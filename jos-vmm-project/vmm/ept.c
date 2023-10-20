#line 2 "../vmm/ept.c"

#include <vmm/ept.h>
#include <inc/x86.h>
#include <inc/error.h>
#include <inc/memlayout.h>
#include <kern/pmap.h>
#include <inc/string.h>

// Return the physical address of an ept entry
static inline uintptr_t epte_addr(epte_t epte)
{
	return (epte & EPTE_ADDR);
}

// Return the host kernel virtual address of an ept entry
static inline uintptr_t epte_page_vaddr(epte_t epte)
{
	return (uintptr_t) KADDR(epte_addr(epte));
}

// Return the flags from an ept entry
static inline epte_t epte_flags(epte_t epte)
{
	return (epte & EPTE_FLAGS);
}

// Return true if an ept entry's mapping is present
static inline int epte_present(epte_t epte)
{
	return (epte & __EPTE_FULL) > 0;
}


// From Canvas
// does the walk on the page table hierarchy at the guest and returns the page table entry corresponding to a gpa. 
// It calculates the next index using the address and iterates until it reaches the page table entry at level 0 
// which points to the actual page.
// 
// What does ADDR_TO_IDX(pa, n) do and what is the n parameter? - ADDR_TO_IDX(pa, n) 
// returns the index corresponding to physical address pa in the nth level of the page table. 
// You can get an idea of how it can be used by looking in the test_ept_map()function at the bottom of vmm/ept.c. 
// We suggest using this macro over adapting existing page table walk logic
//
// Find the final ept entry for a given guest physical address,
// creating any missing intermediate extended page tables if create is non-zero.
//
// If epte_out is non-NULL, store the found epte_t* at this address.
//
// Hint: Set the permissions of intermediate ept entries to __EPTE_FULL.
//       The hardware ANDs the permissions at each level, so removing a permission
//       bit at the last level entry is sufficient (and the bookkeeping is much simpler).
/*
Args:
	eptrt (epte_t*): A pointer to ept root represented as an extended page table entry type
	gpa (void*): A guest physical address in 64 bit
	create (int): Create any missing intermedate extended page tables if create is != 0
	epte_out (epte_t): A pointer to a pointer that points to the final ept entry outputing the host physical address
Returns:
	result (int): 0 on success otherwise use an error value as defined in the comment above that i
	-E_INVAL if eptrt is NULL
	-E_NO_ENT if create == 0 and the intermediate page table entries are missing.
	-E_NO_MEM if allocation of intermediate page table entries fails
*/
static int ept_lookup_gpa(epte_t* eptrt, void *gpa,
			  int create, epte_t **epte_out) {
    /* Your code here */
	if (NULL == eptrt) return -E_INVAL;

	//From edstem 364 - Don't use pml4e_walk
	// 365 Loop if you know how deep you're traversing (OH suggested line 279 in ept.c 
	// or look at other ? functions in ept.c that does the traversal / walk).

	/* Go through the extended page table to check if the immediate mappings are correct */
	// You can get an idea of how it can be used by looking in the test_ept_map()
	int i = EPT_LEVELS - 1;
	for (; i > 0; --i ) {
		// returns the index corresponding to physical address pa in the nth level of the page table.
		int idx = ADDR_TO_IDX(UTEMP, i);
		if (!epte_present(eptrt[idx])) {
			// -E_NO_ENT if create == 0 and the intermediate page table entries are missing.
			if (0 == create) return -E_NO_ENT;

			/*

			ept[0]
			--> *
					*
						* [pte] corresponds to gpa
							*
			EPT_LEVELS  = 4
			does this mean that there are 4 page table entries in total? 
			or does it mean there aer 4 page tables total? 

			which one has our gpa?
			*/
			
			// create = 1, create intermediate mapping / allocate?
			// allocate a physical page for the page table entry
			struct PageInfo* pi = page_alloc(eptrt[idx]);
			if (NULL == pi) return -E_NO_MEM; 
		// Hint: Set the permissions of intermediate ept entries to __EPTE_FULL.
//       The hardware ANDs the permissions at each level, so removing a permission
//       bit at the last level entry is sufficient (and the bookkeeping is much simpler).

			// You can map a struct PageInfo * to the corresponding physical address
			//  * with page2pa() in kern/pmap.h.
			// epte_addr

			// get physical address of page we just allocated
			physaddr_t pa = page2pa(pi);

			// store physical address into page table entry
			// update pte with correct permissions as well
			eptrt[idx] = pa | __EPTE_FULL | PTE_P;
			continue;
		}

		// If epte_out is non-NULL, store the found epte_t* at this address.
		eptrt = (epte_t *) epte_page_vaddr(eptrt[idx]);
	}

    return 0;
}

void ept_gpa2hva(epte_t* eptrt, void *gpa, void **hva) {
    epte_t* pte;
    int ret = ept_lookup_gpa(eptrt, gpa, 0, &pte);
    if(ret < 0) {
        *hva = NULL;
    } else {
        if(!epte_present(*pte)) {
           *hva = NULL;
        } else {
           *hva = KADDR(epte_addr(*pte));
        }
    }
}

static void free_ept_level(epte_t* eptrt, int level) {
    epte_t* dir = eptrt;
    int i;

    for(i=0; i<NPTENTRIES; ++i) {
        if(level != 0) {
            if(epte_present(dir[i])) {
                physaddr_t pa = epte_addr(dir[i]);
                free_ept_level((epte_t*) KADDR(pa), level-1);
                // free the table.
                page_decref(pa2page(pa));
            }
        } else {
            // Last level, free the guest physical page.
            if(epte_present(dir[i])) {
                physaddr_t pa = epte_addr(dir[i]);
                page_decref(pa2page(pa));
            }
        }
    }
    return;
}

// Free the EPT table entries and the EPT tables.
// NOTE: Does not deallocate EPT PML4 page.
void free_guest_mem(epte_t* eptrt) {
    free_ept_level(eptrt, EPT_LEVELS - 1);
    tlbflush();
}

// Add Page pp to a guest's EPT at guest physical address gpa
//  with permission perm.  eptrt is the EPT root.
//
// This function should increment the reference count of pp on a
//   successful insert.  If you overwrite a mapping, your code should
//   decrement the reference count of the old mapping.
//
// Return 0 on success, <0 on failure.
//
int ept_page_insert(epte_t* eptrt, struct PageInfo* pp, void* gpa, int perm) {

    /* Your code here */
    return 0;
}


// From Canvas
// does a walk on the page table levels at the guest (given the gpa) using ept_lookup_gpa() 
// and then gets a page table entry at level 0 corresponding to the gpa. This function then 
// inserts the physical address corresponding to the hva, in the page table entry returned by ept_lookup_gpa().
//
// Map host virtual address hva to guest physical address gpa,
// with permissions perm.  eptrt is a pointer to the extended
// page table root.
//
// Return 0 on success.
//
// If the mapping already exists and overwrite is set to 0,
//  return -E_INVAL.
//
// Hint: use ept_lookup_gpa to create the intermediate
//       ept levels, and return the final epte_t pointer.
//       You should set the type to EPTE_TYPE_WB and set __EPTE_IPAT flag.
int ept_map_hva2gpa(epte_t* eptrt, void* hva, void* gpa, int perm,
        int overwrite) {
    /* Your code here */
	// see ept_gpa2hva, pointer made, then passed to ept_lookup_gpa
	epte_t* pte;
	// pte gpa -> hva
	int r = ept_lookup_gpa(eptrt, gpa, 1, &pte);
	if (r == 0) {
		// If the mapping already exists and overwrite is set to 0, return -E_INVAL.
		if (0 == overwrite && &pte) {
			// pte? Would expect the other variables to exist already so best guess
			return -E_INVAL;
		}

		// This function then inserts the physical address corresponding to the hva
		//, in the page table entry returned by ept_lookup_gpa().
		// pte now set, use for ?
		// (N–1):30 Physical address of the 1-GByte page referenced by this entry1
		// copy from hva into
		// ept_page_insert()
		pte= hva | __EPTE_TYPE( EPTE_TYPE_WB ) | __EPTE_IPAT;
		// You should set the type to EPTE_TYPE_WB and set __EPTE_IPAT flag.
		// __EPTE_TYPE( EPTE_TYPE_WB ) | __EPTE_IPAT)
	}
    return r;
}

int ept_alloc_static(epte_t *eptrt, struct VmxGuestInfo *ginfo) {
    physaddr_t i;

    for(i=0x0; i < 0xA0000; i+=PGSIZE) {
        struct PageInfo *p = page_alloc(0);
        p->pp_ref += 1;
        int r = ept_map_hva2gpa(eptrt, page2kva(p), (void *)i, __EPTE_FULL, 0);
    }

    for(i=0x100000; i < ginfo->phys_sz; i+=PGSIZE) {
        struct PageInfo *p = page_alloc(0);
        p->pp_ref += 1;
        int r = ept_map_hva2gpa(eptrt, page2kva(p), (void *)i, __EPTE_FULL, 0);
    }
    return 0;
}

#ifdef TEST_EPT_MAP
#include <kern/env.h>
#include <kern/syscall.h>
int _export_sys_ept_map(envid_t srcenvid, void *srcva,
	    envid_t guest, void* guest_pa, int perm);

int test_ept_map(void)
{
	struct Env *srcenv, *dstenv;
	struct PageInfo *pp;
	epte_t *epte;
	int r;
	int pp_ref;
	int i;
	epte_t* dir;
	/* Initialize source env */
	if ((r = env_alloc(&srcenv, 0)) < 0)
		panic("Failed to allocate env (%d)\n", r);
	if (!(pp = page_alloc(ALLOC_ZERO)))
		panic("Failed to allocate page (%d)\n", r);
	if ((r = page_insert(srcenv->env_pml4e, pp, UTEMP, 0)) < 0)
		panic("Failed to insert page (%d)\n", r);
	curenv = srcenv;

	/* Check if sys_ept_map correctly verify the target env */
	if ((r = env_alloc(&dstenv, srcenv->env_id)) < 0)
		panic("Failed to allocate env (%d)\n", r);
	if ((r = _export_sys_ept_map(srcenv->env_id, UTEMP, dstenv->env_id, UTEMP, __EPTE_READ)) < 0)
		cprintf("EPT map to non-guest env failed as expected (%d).\n", r);
	else
		panic("sys_ept_map success on non-guest env.\n");

	/*env_destroy(dstenv);*/

	if ((r = env_guest_alloc(&dstenv, srcenv->env_id)) < 0)
		panic("Failed to allocate guest env (%d)\n", r);
	dstenv->env_vmxinfo.phys_sz = (uint64_t)UTEMP + PGSIZE;

	/* Check if sys_ept_map can verify srcva correctly */
	if ((r = _export_sys_ept_map(srcenv->env_id, (void *)UTOP, dstenv->env_id, UTEMP, __EPTE_READ)) < 0)
		cprintf("EPT map from above UTOP area failed as expected (%d).\n", r);
	else
		panic("sys_ept_map from above UTOP area success\n");
	if ((r = _export_sys_ept_map(srcenv->env_id, UTEMP+1, dstenv->env_id, UTEMP, __EPTE_READ)) < 0)
		cprintf("EPT map from unaligned srcva failed as expected (%d).\n", r);
	else
		panic("sys_ept_map from unaligned srcva success\n");

	/* Check if sys_ept_map can verify guest_pa correctly */
	if ((r = _export_sys_ept_map(srcenv->env_id, UTEMP, dstenv->env_id, UTEMP + PGSIZE, __EPTE_READ)) < 0)
		cprintf("EPT map to out-of-boundary area failed as expected (%d).\n", r);
	else
		panic("sys_ept_map success on out-of-boundary area\n");
	if ((r = _export_sys_ept_map(srcenv->env_id, UTEMP, dstenv->env_id, UTEMP-1, __EPTE_READ)) < 0)
		cprintf("EPT map to unaligned guest_pa failed as expected (%d).\n", r);
	else
		panic("sys_ept_map success on unaligned guest_pa\n");

	/* Check if the sys_ept_map can verify the permission correctly */
	if ((r = _export_sys_ept_map(srcenv->env_id, UTEMP, dstenv->env_id, UTEMP, 0)) < 0)
		cprintf("EPT map with empty perm parameter failed as expected (%d).\n", r);
	else
		panic("sys_ept_map success on empty perm\n");
	if ((r = _export_sys_ept_map(srcenv->env_id, UTEMP, dstenv->env_id, UTEMP, __EPTE_WRITE)) < 0)
		cprintf("EPT map with write perm parameter failed as expected (%d).\n", r);
	else
		panic("sys_ept_map success on write perm\n");

	pp_ref = pp->pp_ref;
	/* Check if the sys_ept_map can succeed on correct setup */
	if ((r = _export_sys_ept_map(srcenv->env_id, UTEMP, dstenv->env_id, UTEMP, __EPTE_READ)) < 0)
		panic("Failed to do sys_ept_map (%d)\n", r);
	else
		cprintf("sys_ept_map finished normally.\n");

	if (pp->pp_ref != pp_ref + 1)
		panic("Failed on checking pp_ref\n");
	else
		cprintf("pp_ref incremented correctly\n");

	/* Check if the sys_ept_map can handle remapping correctly */
	pp_ref = pp->pp_ref;
	if ((r = _export_sys_ept_map(srcenv->env_id, UTEMP, dstenv->env_id, UTEMP, __EPTE_READ)) < 0)
		cprintf("sys_ept_map finished normally.\n");
	else
		panic("sys_ept_map success on remapping the same page\n");
	/* Check if the sys_ept_map reset the pp_ref after failed on remapping the same page */
	if (pp->pp_ref == pp_ref)
		cprintf("sys_ept_map handled pp_ref correctly.\n");
	else
		panic("sys_ept_map failed to handle pp_ref.\n");

	/* Check if ept_lookup_gpa can handle empty eptrt correctly */
	if ((r = ept_lookup_gpa(NULL, UTEMP, 0, &epte)) < 0)
		cprintf("EPT lookup with a null eptrt failed as expected\n");
	else
		panic ("ept_lookup_gpa success on null eptrt\n");


	/* Check if the mapping is valid */
	if ((r = ept_lookup_gpa(dstenv->env_pml4e, UTEMP, 0, &epte)) < 0)
		panic("Failed on ept_lookup_gpa (%d)\n", r);
	if (page2pa(pp) != (epte_addr(*epte)))
		panic("EPT mapping address mismatching (%x vs %x).\n",
				page2pa(pp), epte_addr(*epte));
	else
		cprintf("EPT mapping address looks good: %x vs %x.\n",
				page2pa(pp), epte_addr(*epte));

	/* Check if the map_hva2gpa handle the overwrite correctly */
	if ((r = ept_map_hva2gpa(dstenv->env_pml4e, page2kva(pp), UTEMP, __EPTE_READ, 0)) < 0)
		cprintf("map_hva2gpa handle not overwriting correctly\n");
	else
		panic("map_hva2gpa success on overwriting with non-overwrite parameter\n");

	/* Check if the map_hva2gpa can map a page */
	if ((r = ept_map_hva2gpa(dstenv->env_pml4e, page2kva(pp), UTEMP, __EPTE_READ, 1)) < 0)
		panic ("Failed on mapping a page from kva to gpa\n");
	else
		cprintf("map_hva2gpa success on mapping a page\n");

	/* Check if the map_hva2gpa set permission correctly */
	if ((r = ept_lookup_gpa(dstenv->env_pml4e, UTEMP, 0, &epte)) < 0)
		panic("Failed on ept_lookup_gpa (%d)\n", r);
	if (((uint64_t)*epte & (~EPTE_ADDR)) == (__EPTE_READ | __EPTE_TYPE( EPTE_TYPE_WB ) | __EPTE_IPAT))
		cprintf("map_hva2gpa success on perm check\n");
	else
		panic("map_hva2gpa didn't set permission correctly\n");
	/* Go through the extended page table to check if the immediate mappings are correct */
	dir = dstenv->env_pml4e;
	for ( i = EPT_LEVELS - 1; i > 0; --i ) {
        	int idx = ADDR_TO_IDX(UTEMP, i);
        	if (!epte_present(dir[idx])) {
        		panic("Failed to find page table item at the immediate level %d.", i);
        	}
		if (!(dir[idx] & __EPTE_FULL)) {
			panic("Permission check failed at immediate level %d.", i);
		}
		dir = (epte_t *) epte_page_vaddr(dir[idx]);
        }
	cprintf("EPT immediate mapping check passed\n");


	/* stop running after test, as this is just a test run. */
	panic("Cheers! sys_ept_map seems to work correctly.\n");

	return 0;
}
#endif

