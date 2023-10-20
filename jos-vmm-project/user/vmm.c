#include <inc/lib.h>
#include <inc/vmx.h>
#include <inc/elf.h>
#include <inc/ept.h>
#include <inc/stdio.h>

#define GUEST_KERN "/vmm/kernel"
#define GUEST_BOOT "/vmm/boot"

#define JOS_ENTRY 0x7000

// From Canvas
// breaks down each segment in number of pages, and calls sys_ept_map() for each page. 
// You cannot pass in the page directly, but rather will have to use a TEMP variable. 
// This is defined as a macro in memlayout.h
//
// Is srcva a kernel virtual address? - No. The srcva that is passed into sys_ept_map() is not a kernel virtual address. 
// If you want to get the kernel virtual address associated with a srcva, you can look up the PageInfo struct associated 
// with srcva, then look up the kernel virtual address for that PageInfo struct.
//
// What are the possible values of perm? - The possible values of perm (for sys_ept_map();
// other permissions may be set for other situations in the codebase) are defined in inc/ept.h.
//
// Map a region of file fd into the guest at guest physical address gpa.
// The file region to map should start at fileoffset and be length filesz.
// The region to map in the guest should be memsz.  The region can span multiple pages.
//
// Return 0 on success, <0 on failure.
//
// Hint: Call sys_ept_map() for mapping page. 
static int
map_in_guest( envid_t guest, uintptr_t gpa, size_t memsz, 
	      int fd, size_t filesz, off_t fileoffset ) {
	/* Your code here */
	// return error if file size is greater than memory size
	if (filesz > memsz) {
		cprintf("map_in_guest filesz error\n");
		return -1;
	}

	envid_t srcid = sys_getenvid();
	int r;

	int i = 0;
	for (; i < filesz; i += PGSIZE) {
		// Can i exceed fd size?

		// UTEMP from memlayout for temp mapping of pages
		// allocate the memory
		r = sys_page_alloc(srcid, UTEMP, PTE_SYSCALL);
		if (r < 0) {
			cprintf("map_in_guest sys_page_alloc error\n");
			return r;
		}

		// seek data from file
		if ((r = seek(fd, fileoffset + i)) < 0) {
			cprintf("map_in_guest seek error\n");
			return r;
		}

		// read from file
		int totalBytesToRead = PGSIZE;
		if (filesz - i < PGSIZE) {
			totalBytesToRead = filesz - i;
		}

		if ((r = readn(fd, UTEMP, totalBytesToRead)) < 0) {
			cprintf("map_in_guest readn error\n");
			return r;
		}

		// ept map hints mention PTE_W?
		// where does fd/filesz and offset come in ?
		r = sys_ept_map(srcid, UTEMP, guest, (void*) (gpa + i), PTE_SYSCALL);
		if (r < 0) {
			cprintf("map_in_guest sys_ept_map error\n");
			return r;
		}

		//clear mapped for next loop
		r = sys_page_unmap(srcid, UTEMP);
		if (r < 0) {
			cprintf("map_in_guest sys_page_unmap error\n");
			return r;
		}
	}
	cprintf("map_in_guest success\n");
	return 0;
} 

// From Canvas
// reads the ELF header from the kernel executable into the struct Elf. 
// The kernel ELF contains multiple segments which must be copied from the host to the guest. 
// This function is similar to the one observed in the prelab but has to call something other than memcpy()
// to map the memory because we are in the virtual guest.
//
// Read the ELF headers of kernel file specified by fname,
// mapping all valid segments into guest physical memory as appropriate.
//
// Return 0 on success, <0 on error
//
// Hint: compare with ELF parsing in env.c, and use map_in_guest for each segment.
static int
copy_guest_kern_gpa( envid_t guest, char* fname ) {
	/* Your code here */
	//File descriptor reference, dont modify
	int fd = open(fname, O_RDONLY);
	if (fd < 0) return fd;

	// see lib/spawn.c
	unsigned char elf_buf[512];
	struct Elf* elf = (struct Elf*) elf_buf;
	if (readn(fd, elf_buf, sizeof(elf_buf)) != sizeof(elf_buf)
            || elf->e_magic != ELF_MAGIC) {
		close(fd);
		cprintf("elf magic %08x want %08x\n", elf->e_magic, ELF_MAGIC);
		return -E_NOT_EXEC;
	}

	//see load_icode in env.c for ELF load ex
	struct Proghdr *ph, *eph;
	ph  = (struct Proghdr *)((uint8_t *)elf + elf->e_phoff);
	eph = ph + elf->e_phnum;
	for(;ph < eph; ph++) {
		if (ph->p_type == ELF_PROG_LOAD) {
			int r = map_in_guest(guest, ph->p_pa, ph->p_memsz, fd, ph->p_filesz, ph->p_offset);
			if (r < 0) {
				cprintf("map_in_guest error\n");
				close(fd);
				return r;
			}
		}
	}

	close(fd);
	fd = -1;
	cprintf("copy_guest_kern_gpa success\n");
	return 0;
}

void
umain(int argc, char **argv) {
	int ret;
	envid_t guest;
	char filename_buffer[50];	//buffer to save the path 
	int vmdisk_number;
	int r;
	if ((ret = sys_env_mkguest( GUEST_MEM_SZ, JOS_ENTRY )) < 0) {
		cprintf("Error creating a guest OS env: %e\n", ret );
		exit();
	}
	guest = ret;

	// Copy the guest kernel code into guest phys mem.
	if((ret = copy_guest_kern_gpa(guest, GUEST_KERN)) < 0) {
		cprintf("Error copying page into the guest - %d\n.", ret);
		exit();
	}

	// Now copy the bootloader.
	int fd;
	if ((fd = open( GUEST_BOOT, O_RDONLY)) < 0 ) {
		cprintf("open %s for read: %e\n", GUEST_BOOT, fd );
		exit();
	}

	// sizeof(bootloader) < 512.
	if ((ret = map_in_guest(guest, JOS_ENTRY, 512, fd, 512, 0)) < 0) {
		cprintf("Error mapping bootloader into the guest - %d\n.", ret);
		exit();
	}
#ifndef VMM_GUEST	
	sys_vmx_incr_vmdisk_number();	//increase the vmdisk number
	//create a new guest disk image
	
	vmdisk_number = sys_vmx_get_vmdisk_number();
	snprintf(filename_buffer, 50, "/vmm/fs%d.img", vmdisk_number);
	
	cprintf("Creating a new virtual HDD at /vmm/fs%d.img\n", vmdisk_number);
        r = copy("vmm/clean-fs.img", filename_buffer);
        
        if (r < 0) {
        	cprintf("Create new virtual HDD failed: %e\n", r);
        	exit();
        }
        
        cprintf("Create VHD finished\n");
#endif
	// Mark the guest as runnable.
	sys_env_set_status(guest, ENV_RUNNABLE);
	wait(guest);
}


