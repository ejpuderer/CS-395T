
obj/user/vmm:     file format elf64-x86-64


Disassembly of section .text:

0000000000800020 <_start>:
// starts us running when we are initially loaded into a new environment.
.text
.globl _start
_start:
	// See if we were started with arguments on the stack
	movabs $USTACKTOP, %rax
  800020:	48 b8 00 e0 7f ef 00 	movabs $0xef7fe000,%rax
  800027:	00 00 00 
	cmpq %rax,%rsp
  80002a:	48 39 c4             	cmp    %rax,%rsp
	jne args_exist
  80002d:	75 04                	jne    800033 <args_exist>

	// If not, push dummy argc/argv arguments.
	// This happens when we are loaded by the kernel,
	// because the kernel does not know about passing arguments.
	pushq $0
  80002f:	6a 00                	pushq  $0x0
	pushq $0
  800031:	6a 00                	pushq  $0x0

0000000000800033 <args_exist>:

args_exist:
	movq 8(%rsp), %rsi
  800033:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
	movq (%rsp), %rdi
  800038:	48 8b 3c 24          	mov    (%rsp),%rdi
	call libmain
  80003c:	e8 b0 02 00 00       	callq  8002f1 <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <map_in_guest>:
// Return 0 on success, <0 on failure.
//
// Hint: Call sys_ept_map() for mapping page. 
static int
map_in_guest( envid_t guest, uintptr_t gpa, size_t memsz, 
	      int fd, size_t filesz, off_t fileoffset ) {
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 24          	sub    $0x24,%rsp
  80004b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80004e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800052:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  800056:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  800059:	4c 89 45 e0          	mov    %r8,-0x20(%rbp)
  80005d:	44 89 4d dc          	mov    %r9d,-0x24(%rbp)
	/* Your code here */
	return -E_NO_SYS;
  800061:	b8 f9 ff ff ff       	mov    $0xfffffff9,%eax
} 
  800066:	c9                   	leaveq 
  800067:	c3                   	retq   

0000000000800068 <copy_guest_kern_gpa>:
//
// Return 0 on success, <0 on error
//
// Hint: compare with ELF parsing in env.c, and use map_in_guest for each segment.
static int
copy_guest_kern_gpa( envid_t guest, char* fname ) {
  800068:	55                   	push   %rbp
  800069:	48 89 e5             	mov    %rsp,%rbp
  80006c:	48 83 ec 10          	sub    $0x10,%rsp
  800070:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800073:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
	/* Your code here */
	return -E_NO_SYS;
  800077:	b8 f9 ff ff ff       	mov    $0xfffffff9,%eax
}
  80007c:	c9                   	leaveq 
  80007d:	c3                   	retq   

000000000080007e <umain>:

void
umain(int argc, char **argv) {
  80007e:	55                   	push   %rbp
  80007f:	48 89 e5             	mov    %rsp,%rbp
  800082:	48 83 ec 60          	sub    $0x60,%rsp
  800086:	89 7d ac             	mov    %edi,-0x54(%rbp)
  800089:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
	int ret;
	envid_t guest;
	char filename_buffer[50];	//buffer to save the path 
	int vmdisk_number;
	int r;
	if ((ret = sys_env_mkguest( GUEST_MEM_SZ, JOS_ENTRY )) < 0) {
  80008d:	be 00 70 00 00       	mov    $0x7000,%esi
  800092:	bf 00 00 00 01       	mov    $0x1000000,%edi
  800097:	48 b8 36 1d 80 00 00 	movabs $0x801d36,%rax
  80009e:	00 00 00 
  8000a1:	ff d0                	callq  *%rax
  8000a3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8000a6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8000aa:	79 2c                	jns    8000d8 <umain+0x5a>
		cprintf("Error creating a guest OS env: %e\n", ret );
  8000ac:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8000af:	89 c6                	mov    %eax,%esi
  8000b1:	48 bf 40 43 80 00 00 	movabs $0x804340,%rdi
  8000b8:	00 00 00 
  8000bb:	b8 00 00 00 00       	mov    $0x0,%eax
  8000c0:	48 ba bc 04 80 00 00 	movabs $0x8004bc,%rdx
  8000c7:	00 00 00 
  8000ca:	ff d2                	callq  *%rdx
		exit();
  8000cc:	48 b8 74 03 80 00 00 	movabs $0x800374,%rax
  8000d3:	00 00 00 
  8000d6:	ff d0                	callq  *%rax
	}
	guest = ret;
  8000d8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8000db:	89 45 f8             	mov    %eax,-0x8(%rbp)

	// Copy the guest kernel code into guest phys mem.
	if((ret = copy_guest_kern_gpa(guest, GUEST_KERN)) < 0) {
  8000de:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8000e1:	48 be 63 43 80 00 00 	movabs $0x804363,%rsi
  8000e8:	00 00 00 
  8000eb:	89 c7                	mov    %eax,%edi
  8000ed:	48 b8 68 00 80 00 00 	movabs $0x800068,%rax
  8000f4:	00 00 00 
  8000f7:	ff d0                	callq  *%rax
  8000f9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8000fc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800100:	79 2c                	jns    80012e <umain+0xb0>
		cprintf("Error copying page into the guest - %d\n.", ret);
  800102:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800105:	89 c6                	mov    %eax,%esi
  800107:	48 bf 70 43 80 00 00 	movabs $0x804370,%rdi
  80010e:	00 00 00 
  800111:	b8 00 00 00 00       	mov    $0x0,%eax
  800116:	48 ba bc 04 80 00 00 	movabs $0x8004bc,%rdx
  80011d:	00 00 00 
  800120:	ff d2                	callq  *%rdx
		exit();
  800122:	48 b8 74 03 80 00 00 	movabs $0x800374,%rax
  800129:	00 00 00 
  80012c:	ff d0                	callq  *%rax
	}

	// Now copy the bootloader.
	int fd;
	if ((fd = open( GUEST_BOOT, O_RDONLY)) < 0 ) {
  80012e:	be 00 00 00 00       	mov    $0x0,%esi
  800133:	48 bf 99 43 80 00 00 	movabs $0x804399,%rdi
  80013a:	00 00 00 
  80013d:	48 b8 6c 28 80 00 00 	movabs $0x80286c,%rax
  800144:	00 00 00 
  800147:	ff d0                	callq  *%rax
  800149:	89 45 f4             	mov    %eax,-0xc(%rbp)
  80014c:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  800150:	79 36                	jns    800188 <umain+0x10a>
		cprintf("open %s for read: %e\n", GUEST_BOOT, fd );
  800152:	8b 45 f4             	mov    -0xc(%rbp),%eax
  800155:	89 c2                	mov    %eax,%edx
  800157:	48 be 99 43 80 00 00 	movabs $0x804399,%rsi
  80015e:	00 00 00 
  800161:	48 bf a3 43 80 00 00 	movabs $0x8043a3,%rdi
  800168:	00 00 00 
  80016b:	b8 00 00 00 00       	mov    $0x0,%eax
  800170:	48 b9 bc 04 80 00 00 	movabs $0x8004bc,%rcx
  800177:	00 00 00 
  80017a:	ff d1                	callq  *%rcx
		exit();
  80017c:	48 b8 74 03 80 00 00 	movabs $0x800374,%rax
  800183:	00 00 00 
  800186:	ff d0                	callq  *%rax
	}

	// sizeof(bootloader) < 512.
	if ((ret = map_in_guest(guest, JOS_ENTRY, 512, fd, 512, 0)) < 0) {
  800188:	8b 55 f4             	mov    -0xc(%rbp),%edx
  80018b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80018e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  800194:	41 b8 00 02 00 00    	mov    $0x200,%r8d
  80019a:	89 d1                	mov    %edx,%ecx
  80019c:	ba 00 02 00 00       	mov    $0x200,%edx
  8001a1:	be 00 70 00 00       	mov    $0x7000,%esi
  8001a6:	89 c7                	mov    %eax,%edi
  8001a8:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8001af:	00 00 00 
  8001b2:	ff d0                	callq  *%rax
  8001b4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8001b7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8001bb:	79 2c                	jns    8001e9 <umain+0x16b>
		cprintf("Error mapping bootloader into the guest - %d\n.", ret);
  8001bd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8001c0:	89 c6                	mov    %eax,%esi
  8001c2:	48 bf c0 43 80 00 00 	movabs $0x8043c0,%rdi
  8001c9:	00 00 00 
  8001cc:	b8 00 00 00 00       	mov    $0x0,%eax
  8001d1:	48 ba bc 04 80 00 00 	movabs $0x8004bc,%rdx
  8001d8:	00 00 00 
  8001db:	ff d2                	callq  *%rdx
		exit();
  8001dd:	48 b8 74 03 80 00 00 	movabs $0x800374,%rax
  8001e4:	00 00 00 
  8001e7:	ff d0                	callq  *%rax
	}
#ifndef VMM_GUEST	
	sys_vmx_incr_vmdisk_number();	//increase the vmdisk number
  8001e9:	b8 00 00 00 00       	mov    $0x0,%eax
  8001ee:	48 ba 40 1e 80 00 00 	movabs $0x801e40,%rdx
  8001f5:	00 00 00 
  8001f8:	ff d2                	callq  *%rdx
	//create a new guest disk image
	
	vmdisk_number = sys_vmx_get_vmdisk_number();
  8001fa:	b8 00 00 00 00       	mov    $0x0,%eax
  8001ff:	48 ba 02 1e 80 00 00 	movabs $0x801e02,%rdx
  800206:	00 00 00 
  800209:	ff d2                	callq  *%rdx
  80020b:	89 45 f0             	mov    %eax,-0x10(%rbp)
	snprintf(filename_buffer, 50, "/vmm/fs%d.img", vmdisk_number);
  80020e:	8b 55 f0             	mov    -0x10(%rbp),%edx
  800211:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
  800215:	89 d1                	mov    %edx,%ecx
  800217:	48 ba ef 43 80 00 00 	movabs $0x8043ef,%rdx
  80021e:	00 00 00 
  800221:	be 32 00 00 00       	mov    $0x32,%esi
  800226:	48 89 c7             	mov    %rax,%rdi
  800229:	b8 00 00 00 00       	mov    $0x0,%eax
  80022e:	49 b8 24 0f 80 00 00 	movabs $0x800f24,%r8
  800235:	00 00 00 
  800238:	41 ff d0             	callq  *%r8
	
	cprintf("Creating a new virtual HDD at /vmm/fs%d.img\n", vmdisk_number);
  80023b:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80023e:	89 c6                	mov    %eax,%esi
  800240:	48 bf 00 44 80 00 00 	movabs $0x804400,%rdi
  800247:	00 00 00 
  80024a:	b8 00 00 00 00       	mov    $0x0,%eax
  80024f:	48 ba bc 04 80 00 00 	movabs $0x8004bc,%rdx
  800256:	00 00 00 
  800259:	ff d2                	callq  *%rdx
        r = copy("vmm/clean-fs.img", filename_buffer);
  80025b:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
  80025f:	48 89 c6             	mov    %rax,%rsi
  800262:	48 bf 2d 44 80 00 00 	movabs $0x80442d,%rdi
  800269:	00 00 00 
  80026c:	48 b8 ce 2c 80 00 00 	movabs $0x802cce,%rax
  800273:	00 00 00 
  800276:	ff d0                	callq  *%rax
  800278:	89 45 ec             	mov    %eax,-0x14(%rbp)
        
        if (r < 0) {
  80027b:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80027f:	79 2c                	jns    8002ad <umain+0x22f>
        	cprintf("Create new virtual HDD failed: %e\n", r);
  800281:	8b 45 ec             	mov    -0x14(%rbp),%eax
  800284:	89 c6                	mov    %eax,%esi
  800286:	48 bf 40 44 80 00 00 	movabs $0x804440,%rdi
  80028d:	00 00 00 
  800290:	b8 00 00 00 00       	mov    $0x0,%eax
  800295:	48 ba bc 04 80 00 00 	movabs $0x8004bc,%rdx
  80029c:	00 00 00 
  80029f:	ff d2                	callq  *%rdx
        	exit();
  8002a1:	48 b8 74 03 80 00 00 	movabs $0x800374,%rax
  8002a8:	00 00 00 
  8002ab:	ff d0                	callq  *%rax
        }
        
        cprintf("Create VHD finished\n");
  8002ad:	48 bf 63 44 80 00 00 	movabs $0x804463,%rdi
  8002b4:	00 00 00 
  8002b7:	b8 00 00 00 00       	mov    $0x0,%eax
  8002bc:	48 ba bc 04 80 00 00 	movabs $0x8004bc,%rdx
  8002c3:	00 00 00 
  8002c6:	ff d2                	callq  *%rdx
#endif
	// Mark the guest as runnable.
	sys_env_set_status(guest, ENV_RUNNABLE);
  8002c8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8002cb:	be 02 00 00 00       	mov    $0x2,%esi
  8002d0:	89 c7                	mov    %eax,%edi
  8002d2:	48 b8 95 1a 80 00 00 	movabs $0x801a95,%rax
  8002d9:	00 00 00 
  8002dc:	ff d0                	callq  *%rax
	wait(guest);
  8002de:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8002e1:	89 c7                	mov    %eax,%edi
  8002e3:	48 b8 7e 3c 80 00 00 	movabs $0x803c7e,%rax
  8002ea:	00 00 00 
  8002ed:	ff d0                	callq  *%rax
}
  8002ef:	c9                   	leaveq 
  8002f0:	c3                   	retq   

00000000008002f1 <libmain>:
  8002f1:	55                   	push   %rbp
  8002f2:	48 89 e5             	mov    %rsp,%rbp
  8002f5:	48 83 ec 10          	sub    $0x10,%rsp
  8002f9:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8002fc:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800300:	48 b8 24 19 80 00 00 	movabs $0x801924,%rax
  800307:	00 00 00 
  80030a:	ff d0                	callq  *%rax
  80030c:	25 ff 03 00 00       	and    $0x3ff,%eax
  800311:	48 98                	cltq   
  800313:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  80031a:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  800321:	00 00 00 
  800324:	48 01 c2             	add    %rax,%rdx
  800327:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  80032e:	00 00 00 
  800331:	48 89 10             	mov    %rdx,(%rax)
  800334:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800338:	7e 14                	jle    80034e <libmain+0x5d>
  80033a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80033e:	48 8b 10             	mov    (%rax),%rdx
  800341:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  800348:	00 00 00 
  80034b:	48 89 10             	mov    %rdx,(%rax)
  80034e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800352:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800355:	48 89 d6             	mov    %rdx,%rsi
  800358:	89 c7                	mov    %eax,%edi
  80035a:	48 b8 7e 00 80 00 00 	movabs $0x80007e,%rax
  800361:	00 00 00 
  800364:	ff d0                	callq  *%rax
  800366:	48 b8 74 03 80 00 00 	movabs $0x800374,%rax
  80036d:	00 00 00 
  800370:	ff d0                	callq  *%rax
  800372:	c9                   	leaveq 
  800373:	c3                   	retq   

0000000000800374 <exit>:
  800374:	55                   	push   %rbp
  800375:	48 89 e5             	mov    %rsp,%rbp
  800378:	48 b8 bf 21 80 00 00 	movabs $0x8021bf,%rax
  80037f:	00 00 00 
  800382:	ff d0                	callq  *%rax
  800384:	bf 00 00 00 00       	mov    $0x0,%edi
  800389:	48 b8 e0 18 80 00 00 	movabs $0x8018e0,%rax
  800390:	00 00 00 
  800393:	ff d0                	callq  *%rax
  800395:	5d                   	pop    %rbp
  800396:	c3                   	retq   

0000000000800397 <putch>:
  800397:	55                   	push   %rbp
  800398:	48 89 e5             	mov    %rsp,%rbp
  80039b:	48 83 ec 10          	sub    $0x10,%rsp
  80039f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8003a2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8003a6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8003aa:	8b 00                	mov    (%rax),%eax
  8003ac:	8d 48 01             	lea    0x1(%rax),%ecx
  8003af:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8003b3:	89 0a                	mov    %ecx,(%rdx)
  8003b5:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8003b8:	89 d1                	mov    %edx,%ecx
  8003ba:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8003be:	48 98                	cltq   
  8003c0:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  8003c4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8003c8:	8b 00                	mov    (%rax),%eax
  8003ca:	3d ff 00 00 00       	cmp    $0xff,%eax
  8003cf:	75 2c                	jne    8003fd <putch+0x66>
  8003d1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8003d5:	8b 00                	mov    (%rax),%eax
  8003d7:	48 98                	cltq   
  8003d9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8003dd:	48 83 c2 08          	add    $0x8,%rdx
  8003e1:	48 89 c6             	mov    %rax,%rsi
  8003e4:	48 89 d7             	mov    %rdx,%rdi
  8003e7:	48 b8 58 18 80 00 00 	movabs $0x801858,%rax
  8003ee:	00 00 00 
  8003f1:	ff d0                	callq  *%rax
  8003f3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8003f7:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8003fd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800401:	8b 40 04             	mov    0x4(%rax),%eax
  800404:	8d 50 01             	lea    0x1(%rax),%edx
  800407:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80040b:	89 50 04             	mov    %edx,0x4(%rax)
  80040e:	c9                   	leaveq 
  80040f:	c3                   	retq   

0000000000800410 <vcprintf>:
  800410:	55                   	push   %rbp
  800411:	48 89 e5             	mov    %rsp,%rbp
  800414:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  80041b:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  800422:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  800429:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  800430:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  800437:	48 8b 0a             	mov    (%rdx),%rcx
  80043a:	48 89 08             	mov    %rcx,(%rax)
  80043d:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800441:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800445:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800449:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80044d:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  800454:	00 00 00 
  800457:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  80045e:	00 00 00 
  800461:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  800468:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  80046f:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800476:	48 89 c6             	mov    %rax,%rsi
  800479:	48 bf 97 03 80 00 00 	movabs $0x800397,%rdi
  800480:	00 00 00 
  800483:	48 b8 6f 08 80 00 00 	movabs $0x80086f,%rax
  80048a:	00 00 00 
  80048d:	ff d0                	callq  *%rax
  80048f:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  800495:	48 98                	cltq   
  800497:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  80049e:	48 83 c2 08          	add    $0x8,%rdx
  8004a2:	48 89 c6             	mov    %rax,%rsi
  8004a5:	48 89 d7             	mov    %rdx,%rdi
  8004a8:	48 b8 58 18 80 00 00 	movabs $0x801858,%rax
  8004af:	00 00 00 
  8004b2:	ff d0                	callq  *%rax
  8004b4:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  8004ba:	c9                   	leaveq 
  8004bb:	c3                   	retq   

00000000008004bc <cprintf>:
  8004bc:	55                   	push   %rbp
  8004bd:	48 89 e5             	mov    %rsp,%rbp
  8004c0:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  8004c7:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  8004ce:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  8004d5:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8004dc:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8004e3:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8004ea:	84 c0                	test   %al,%al
  8004ec:	74 20                	je     80050e <cprintf+0x52>
  8004ee:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8004f2:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8004f6:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8004fa:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8004fe:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800502:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800506:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  80050a:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  80050e:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800515:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  80051c:	00 00 00 
  80051f:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800526:	00 00 00 
  800529:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80052d:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800534:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  80053b:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800542:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800549:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800550:	48 8b 0a             	mov    (%rdx),%rcx
  800553:	48 89 08             	mov    %rcx,(%rax)
  800556:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80055a:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80055e:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800562:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800566:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  80056d:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800574:	48 89 d6             	mov    %rdx,%rsi
  800577:	48 89 c7             	mov    %rax,%rdi
  80057a:	48 b8 10 04 80 00 00 	movabs $0x800410,%rax
  800581:	00 00 00 
  800584:	ff d0                	callq  *%rax
  800586:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  80058c:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  800592:	c9                   	leaveq 
  800593:	c3                   	retq   

0000000000800594 <printnum>:
  800594:	55                   	push   %rbp
  800595:	48 89 e5             	mov    %rsp,%rbp
  800598:	53                   	push   %rbx
  800599:	48 83 ec 38          	sub    $0x38,%rsp
  80059d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8005a1:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8005a5:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8005a9:	89 4d d4             	mov    %ecx,-0x2c(%rbp)
  8005ac:	44 89 45 d0          	mov    %r8d,-0x30(%rbp)
  8005b0:	44 89 4d cc          	mov    %r9d,-0x34(%rbp)
  8005b4:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  8005b7:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8005bb:	77 3b                	ja     8005f8 <printnum+0x64>
  8005bd:	8b 45 d0             	mov    -0x30(%rbp),%eax
  8005c0:	44 8d 40 ff          	lea    -0x1(%rax),%r8d
  8005c4:	8b 5d d4             	mov    -0x2c(%rbp),%ebx
  8005c7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8005cb:	ba 00 00 00 00       	mov    $0x0,%edx
  8005d0:	48 f7 f3             	div    %rbx
  8005d3:	48 89 c2             	mov    %rax,%rdx
  8005d6:	8b 7d cc             	mov    -0x34(%rbp),%edi
  8005d9:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  8005dc:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
  8005e0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005e4:	41 89 f9             	mov    %edi,%r9d
  8005e7:	48 89 c7             	mov    %rax,%rdi
  8005ea:	48 b8 94 05 80 00 00 	movabs $0x800594,%rax
  8005f1:	00 00 00 
  8005f4:	ff d0                	callq  *%rax
  8005f6:	eb 1e                	jmp    800616 <printnum+0x82>
  8005f8:	eb 12                	jmp    80060c <printnum+0x78>
  8005fa:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8005fe:	8b 55 cc             	mov    -0x34(%rbp),%edx
  800601:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800605:	48 89 ce             	mov    %rcx,%rsi
  800608:	89 d7                	mov    %edx,%edi
  80060a:	ff d0                	callq  *%rax
  80060c:	83 6d d0 01          	subl   $0x1,-0x30(%rbp)
  800610:	83 7d d0 00          	cmpl   $0x0,-0x30(%rbp)
  800614:	7f e4                	jg     8005fa <printnum+0x66>
  800616:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  800619:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80061d:	ba 00 00 00 00       	mov    $0x0,%edx
  800622:	48 f7 f1             	div    %rcx
  800625:	48 89 d0             	mov    %rdx,%rax
  800628:	48 ba 90 46 80 00 00 	movabs $0x804690,%rdx
  80062f:	00 00 00 
  800632:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
  800636:	0f be d0             	movsbl %al,%edx
  800639:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80063d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800641:	48 89 ce             	mov    %rcx,%rsi
  800644:	89 d7                	mov    %edx,%edi
  800646:	ff d0                	callq  *%rax
  800648:	48 83 c4 38          	add    $0x38,%rsp
  80064c:	5b                   	pop    %rbx
  80064d:	5d                   	pop    %rbp
  80064e:	c3                   	retq   

000000000080064f <getuint>:
  80064f:	55                   	push   %rbp
  800650:	48 89 e5             	mov    %rsp,%rbp
  800653:	48 83 ec 1c          	sub    $0x1c,%rsp
  800657:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80065b:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80065e:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800662:	7e 52                	jle    8006b6 <getuint+0x67>
  800664:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800668:	8b 00                	mov    (%rax),%eax
  80066a:	83 f8 30             	cmp    $0x30,%eax
  80066d:	73 24                	jae    800693 <getuint+0x44>
  80066f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800673:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800677:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80067b:	8b 00                	mov    (%rax),%eax
  80067d:	89 c0                	mov    %eax,%eax
  80067f:	48 01 d0             	add    %rdx,%rax
  800682:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800686:	8b 12                	mov    (%rdx),%edx
  800688:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80068b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80068f:	89 0a                	mov    %ecx,(%rdx)
  800691:	eb 17                	jmp    8006aa <getuint+0x5b>
  800693:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800697:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80069b:	48 89 d0             	mov    %rdx,%rax
  80069e:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8006a2:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006a6:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8006aa:	48 8b 00             	mov    (%rax),%rax
  8006ad:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8006b1:	e9 a3 00 00 00       	jmpq   800759 <getuint+0x10a>
  8006b6:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  8006ba:	74 4f                	je     80070b <getuint+0xbc>
  8006bc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006c0:	8b 00                	mov    (%rax),%eax
  8006c2:	83 f8 30             	cmp    $0x30,%eax
  8006c5:	73 24                	jae    8006eb <getuint+0x9c>
  8006c7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006cb:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8006cf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006d3:	8b 00                	mov    (%rax),%eax
  8006d5:	89 c0                	mov    %eax,%eax
  8006d7:	48 01 d0             	add    %rdx,%rax
  8006da:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006de:	8b 12                	mov    (%rdx),%edx
  8006e0:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8006e3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006e7:	89 0a                	mov    %ecx,(%rdx)
  8006e9:	eb 17                	jmp    800702 <getuint+0xb3>
  8006eb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006ef:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8006f3:	48 89 d0             	mov    %rdx,%rax
  8006f6:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8006fa:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006fe:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800702:	48 8b 00             	mov    (%rax),%rax
  800705:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800709:	eb 4e                	jmp    800759 <getuint+0x10a>
  80070b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80070f:	8b 00                	mov    (%rax),%eax
  800711:	83 f8 30             	cmp    $0x30,%eax
  800714:	73 24                	jae    80073a <getuint+0xeb>
  800716:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80071a:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80071e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800722:	8b 00                	mov    (%rax),%eax
  800724:	89 c0                	mov    %eax,%eax
  800726:	48 01 d0             	add    %rdx,%rax
  800729:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80072d:	8b 12                	mov    (%rdx),%edx
  80072f:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800732:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800736:	89 0a                	mov    %ecx,(%rdx)
  800738:	eb 17                	jmp    800751 <getuint+0x102>
  80073a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80073e:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800742:	48 89 d0             	mov    %rdx,%rax
  800745:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800749:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80074d:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800751:	8b 00                	mov    (%rax),%eax
  800753:	89 c0                	mov    %eax,%eax
  800755:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800759:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80075d:	c9                   	leaveq 
  80075e:	c3                   	retq   

000000000080075f <getint>:
  80075f:	55                   	push   %rbp
  800760:	48 89 e5             	mov    %rsp,%rbp
  800763:	48 83 ec 1c          	sub    $0x1c,%rsp
  800767:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80076b:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80076e:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800772:	7e 52                	jle    8007c6 <getint+0x67>
  800774:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800778:	8b 00                	mov    (%rax),%eax
  80077a:	83 f8 30             	cmp    $0x30,%eax
  80077d:	73 24                	jae    8007a3 <getint+0x44>
  80077f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800783:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800787:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80078b:	8b 00                	mov    (%rax),%eax
  80078d:	89 c0                	mov    %eax,%eax
  80078f:	48 01 d0             	add    %rdx,%rax
  800792:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800796:	8b 12                	mov    (%rdx),%edx
  800798:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80079b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80079f:	89 0a                	mov    %ecx,(%rdx)
  8007a1:	eb 17                	jmp    8007ba <getint+0x5b>
  8007a3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007a7:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8007ab:	48 89 d0             	mov    %rdx,%rax
  8007ae:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8007b2:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007b6:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8007ba:	48 8b 00             	mov    (%rax),%rax
  8007bd:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8007c1:	e9 a3 00 00 00       	jmpq   800869 <getint+0x10a>
  8007c6:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  8007ca:	74 4f                	je     80081b <getint+0xbc>
  8007cc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007d0:	8b 00                	mov    (%rax),%eax
  8007d2:	83 f8 30             	cmp    $0x30,%eax
  8007d5:	73 24                	jae    8007fb <getint+0x9c>
  8007d7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007db:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8007df:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007e3:	8b 00                	mov    (%rax),%eax
  8007e5:	89 c0                	mov    %eax,%eax
  8007e7:	48 01 d0             	add    %rdx,%rax
  8007ea:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007ee:	8b 12                	mov    (%rdx),%edx
  8007f0:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8007f3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007f7:	89 0a                	mov    %ecx,(%rdx)
  8007f9:	eb 17                	jmp    800812 <getint+0xb3>
  8007fb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007ff:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800803:	48 89 d0             	mov    %rdx,%rax
  800806:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  80080a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80080e:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800812:	48 8b 00             	mov    (%rax),%rax
  800815:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800819:	eb 4e                	jmp    800869 <getint+0x10a>
  80081b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80081f:	8b 00                	mov    (%rax),%eax
  800821:	83 f8 30             	cmp    $0x30,%eax
  800824:	73 24                	jae    80084a <getint+0xeb>
  800826:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80082a:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80082e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800832:	8b 00                	mov    (%rax),%eax
  800834:	89 c0                	mov    %eax,%eax
  800836:	48 01 d0             	add    %rdx,%rax
  800839:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80083d:	8b 12                	mov    (%rdx),%edx
  80083f:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800842:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800846:	89 0a                	mov    %ecx,(%rdx)
  800848:	eb 17                	jmp    800861 <getint+0x102>
  80084a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80084e:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800852:	48 89 d0             	mov    %rdx,%rax
  800855:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800859:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80085d:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800861:	8b 00                	mov    (%rax),%eax
  800863:	48 98                	cltq   
  800865:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800869:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80086d:	c9                   	leaveq 
  80086e:	c3                   	retq   

000000000080086f <vprintfmt>:
  80086f:	55                   	push   %rbp
  800870:	48 89 e5             	mov    %rsp,%rbp
  800873:	41 54                	push   %r12
  800875:	53                   	push   %rbx
  800876:	48 83 ec 60          	sub    $0x60,%rsp
  80087a:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  80087e:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  800882:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800886:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  80088a:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  80088e:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  800892:	48 8b 0a             	mov    (%rdx),%rcx
  800895:	48 89 08             	mov    %rcx,(%rax)
  800898:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80089c:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8008a0:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8008a4:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8008a8:	eb 17                	jmp    8008c1 <vprintfmt+0x52>
  8008aa:	85 db                	test   %ebx,%ebx
  8008ac:	0f 84 cc 04 00 00    	je     800d7e <vprintfmt+0x50f>
  8008b2:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8008b6:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8008ba:	48 89 d6             	mov    %rdx,%rsi
  8008bd:	89 df                	mov    %ebx,%edi
  8008bf:	ff d0                	callq  *%rax
  8008c1:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8008c5:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8008c9:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8008cd:	0f b6 00             	movzbl (%rax),%eax
  8008d0:	0f b6 d8             	movzbl %al,%ebx
  8008d3:	83 fb 25             	cmp    $0x25,%ebx
  8008d6:	75 d2                	jne    8008aa <vprintfmt+0x3b>
  8008d8:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  8008dc:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  8008e3:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  8008ea:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  8008f1:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  8008f8:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8008fc:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800900:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800904:	0f b6 00             	movzbl (%rax),%eax
  800907:	0f b6 d8             	movzbl %al,%ebx
  80090a:	8d 43 dd             	lea    -0x23(%rbx),%eax
  80090d:	83 f8 55             	cmp    $0x55,%eax
  800910:	0f 87 34 04 00 00    	ja     800d4a <vprintfmt+0x4db>
  800916:	89 c0                	mov    %eax,%eax
  800918:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  80091f:	00 
  800920:	48 b8 b8 46 80 00 00 	movabs $0x8046b8,%rax
  800927:	00 00 00 
  80092a:	48 01 d0             	add    %rdx,%rax
  80092d:	48 8b 00             	mov    (%rax),%rax
  800930:	ff e0                	jmpq   *%rax
  800932:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  800936:	eb c0                	jmp    8008f8 <vprintfmt+0x89>
  800938:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  80093c:	eb ba                	jmp    8008f8 <vprintfmt+0x89>
  80093e:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  800945:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800948:	89 d0                	mov    %edx,%eax
  80094a:	c1 e0 02             	shl    $0x2,%eax
  80094d:	01 d0                	add    %edx,%eax
  80094f:	01 c0                	add    %eax,%eax
  800951:	01 d8                	add    %ebx,%eax
  800953:	83 e8 30             	sub    $0x30,%eax
  800956:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800959:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  80095d:	0f b6 00             	movzbl (%rax),%eax
  800960:	0f be d8             	movsbl %al,%ebx
  800963:	83 fb 2f             	cmp    $0x2f,%ebx
  800966:	7e 0c                	jle    800974 <vprintfmt+0x105>
  800968:	83 fb 39             	cmp    $0x39,%ebx
  80096b:	7f 07                	jg     800974 <vprintfmt+0x105>
  80096d:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  800972:	eb d1                	jmp    800945 <vprintfmt+0xd6>
  800974:	eb 58                	jmp    8009ce <vprintfmt+0x15f>
  800976:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800979:	83 f8 30             	cmp    $0x30,%eax
  80097c:	73 17                	jae    800995 <vprintfmt+0x126>
  80097e:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800982:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800985:	89 c0                	mov    %eax,%eax
  800987:	48 01 d0             	add    %rdx,%rax
  80098a:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80098d:	83 c2 08             	add    $0x8,%edx
  800990:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800993:	eb 0f                	jmp    8009a4 <vprintfmt+0x135>
  800995:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800999:	48 89 d0             	mov    %rdx,%rax
  80099c:	48 83 c2 08          	add    $0x8,%rdx
  8009a0:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8009a4:	8b 00                	mov    (%rax),%eax
  8009a6:	89 45 d8             	mov    %eax,-0x28(%rbp)
  8009a9:	eb 23                	jmp    8009ce <vprintfmt+0x15f>
  8009ab:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8009af:	79 0c                	jns    8009bd <vprintfmt+0x14e>
  8009b1:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  8009b8:	e9 3b ff ff ff       	jmpq   8008f8 <vprintfmt+0x89>
  8009bd:	e9 36 ff ff ff       	jmpq   8008f8 <vprintfmt+0x89>
  8009c2:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  8009c9:	e9 2a ff ff ff       	jmpq   8008f8 <vprintfmt+0x89>
  8009ce:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8009d2:	79 12                	jns    8009e6 <vprintfmt+0x177>
  8009d4:	8b 45 d8             	mov    -0x28(%rbp),%eax
  8009d7:	89 45 dc             	mov    %eax,-0x24(%rbp)
  8009da:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  8009e1:	e9 12 ff ff ff       	jmpq   8008f8 <vprintfmt+0x89>
  8009e6:	e9 0d ff ff ff       	jmpq   8008f8 <vprintfmt+0x89>
  8009eb:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  8009ef:	e9 04 ff ff ff       	jmpq   8008f8 <vprintfmt+0x89>
  8009f4:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8009f7:	83 f8 30             	cmp    $0x30,%eax
  8009fa:	73 17                	jae    800a13 <vprintfmt+0x1a4>
  8009fc:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800a00:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800a03:	89 c0                	mov    %eax,%eax
  800a05:	48 01 d0             	add    %rdx,%rax
  800a08:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800a0b:	83 c2 08             	add    $0x8,%edx
  800a0e:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800a11:	eb 0f                	jmp    800a22 <vprintfmt+0x1b3>
  800a13:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800a17:	48 89 d0             	mov    %rdx,%rax
  800a1a:	48 83 c2 08          	add    $0x8,%rdx
  800a1e:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800a22:	8b 10                	mov    (%rax),%edx
  800a24:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800a28:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a2c:	48 89 ce             	mov    %rcx,%rsi
  800a2f:	89 d7                	mov    %edx,%edi
  800a31:	ff d0                	callq  *%rax
  800a33:	e9 40 03 00 00       	jmpq   800d78 <vprintfmt+0x509>
  800a38:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800a3b:	83 f8 30             	cmp    $0x30,%eax
  800a3e:	73 17                	jae    800a57 <vprintfmt+0x1e8>
  800a40:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800a44:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800a47:	89 c0                	mov    %eax,%eax
  800a49:	48 01 d0             	add    %rdx,%rax
  800a4c:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800a4f:	83 c2 08             	add    $0x8,%edx
  800a52:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800a55:	eb 0f                	jmp    800a66 <vprintfmt+0x1f7>
  800a57:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800a5b:	48 89 d0             	mov    %rdx,%rax
  800a5e:	48 83 c2 08          	add    $0x8,%rdx
  800a62:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800a66:	8b 18                	mov    (%rax),%ebx
  800a68:	85 db                	test   %ebx,%ebx
  800a6a:	79 02                	jns    800a6e <vprintfmt+0x1ff>
  800a6c:	f7 db                	neg    %ebx
  800a6e:	83 fb 15             	cmp    $0x15,%ebx
  800a71:	7f 16                	jg     800a89 <vprintfmt+0x21a>
  800a73:	48 b8 e0 45 80 00 00 	movabs $0x8045e0,%rax
  800a7a:	00 00 00 
  800a7d:	48 63 d3             	movslq %ebx,%rdx
  800a80:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800a84:	4d 85 e4             	test   %r12,%r12
  800a87:	75 2e                	jne    800ab7 <vprintfmt+0x248>
  800a89:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800a8d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a91:	89 d9                	mov    %ebx,%ecx
  800a93:	48 ba a1 46 80 00 00 	movabs $0x8046a1,%rdx
  800a9a:	00 00 00 
  800a9d:	48 89 c7             	mov    %rax,%rdi
  800aa0:	b8 00 00 00 00       	mov    $0x0,%eax
  800aa5:	49 b8 87 0d 80 00 00 	movabs $0x800d87,%r8
  800aac:	00 00 00 
  800aaf:	41 ff d0             	callq  *%r8
  800ab2:	e9 c1 02 00 00       	jmpq   800d78 <vprintfmt+0x509>
  800ab7:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800abb:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800abf:	4c 89 e1             	mov    %r12,%rcx
  800ac2:	48 ba aa 46 80 00 00 	movabs $0x8046aa,%rdx
  800ac9:	00 00 00 
  800acc:	48 89 c7             	mov    %rax,%rdi
  800acf:	b8 00 00 00 00       	mov    $0x0,%eax
  800ad4:	49 b8 87 0d 80 00 00 	movabs $0x800d87,%r8
  800adb:	00 00 00 
  800ade:	41 ff d0             	callq  *%r8
  800ae1:	e9 92 02 00 00       	jmpq   800d78 <vprintfmt+0x509>
  800ae6:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800ae9:	83 f8 30             	cmp    $0x30,%eax
  800aec:	73 17                	jae    800b05 <vprintfmt+0x296>
  800aee:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800af2:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800af5:	89 c0                	mov    %eax,%eax
  800af7:	48 01 d0             	add    %rdx,%rax
  800afa:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800afd:	83 c2 08             	add    $0x8,%edx
  800b00:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800b03:	eb 0f                	jmp    800b14 <vprintfmt+0x2a5>
  800b05:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800b09:	48 89 d0             	mov    %rdx,%rax
  800b0c:	48 83 c2 08          	add    $0x8,%rdx
  800b10:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800b14:	4c 8b 20             	mov    (%rax),%r12
  800b17:	4d 85 e4             	test   %r12,%r12
  800b1a:	75 0a                	jne    800b26 <vprintfmt+0x2b7>
  800b1c:	49 bc ad 46 80 00 00 	movabs $0x8046ad,%r12
  800b23:	00 00 00 
  800b26:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800b2a:	7e 3f                	jle    800b6b <vprintfmt+0x2fc>
  800b2c:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  800b30:	74 39                	je     800b6b <vprintfmt+0x2fc>
  800b32:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800b35:	48 98                	cltq   
  800b37:	48 89 c6             	mov    %rax,%rsi
  800b3a:	4c 89 e7             	mov    %r12,%rdi
  800b3d:	48 b8 33 10 80 00 00 	movabs $0x801033,%rax
  800b44:	00 00 00 
  800b47:	ff d0                	callq  *%rax
  800b49:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800b4c:	eb 17                	jmp    800b65 <vprintfmt+0x2f6>
  800b4e:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800b52:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800b56:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b5a:	48 89 ce             	mov    %rcx,%rsi
  800b5d:	89 d7                	mov    %edx,%edi
  800b5f:	ff d0                	callq  *%rax
  800b61:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800b65:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800b69:	7f e3                	jg     800b4e <vprintfmt+0x2df>
  800b6b:	eb 37                	jmp    800ba4 <vprintfmt+0x335>
  800b6d:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  800b71:	74 1e                	je     800b91 <vprintfmt+0x322>
  800b73:	83 fb 1f             	cmp    $0x1f,%ebx
  800b76:	7e 05                	jle    800b7d <vprintfmt+0x30e>
  800b78:	83 fb 7e             	cmp    $0x7e,%ebx
  800b7b:	7e 14                	jle    800b91 <vprintfmt+0x322>
  800b7d:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800b81:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b85:	48 89 d6             	mov    %rdx,%rsi
  800b88:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800b8d:	ff d0                	callq  *%rax
  800b8f:	eb 0f                	jmp    800ba0 <vprintfmt+0x331>
  800b91:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800b95:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b99:	48 89 d6             	mov    %rdx,%rsi
  800b9c:	89 df                	mov    %ebx,%edi
  800b9e:	ff d0                	callq  *%rax
  800ba0:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800ba4:	4c 89 e0             	mov    %r12,%rax
  800ba7:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800bab:	0f b6 00             	movzbl (%rax),%eax
  800bae:	0f be d8             	movsbl %al,%ebx
  800bb1:	85 db                	test   %ebx,%ebx
  800bb3:	74 10                	je     800bc5 <vprintfmt+0x356>
  800bb5:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800bb9:	78 b2                	js     800b6d <vprintfmt+0x2fe>
  800bbb:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800bbf:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800bc3:	79 a8                	jns    800b6d <vprintfmt+0x2fe>
  800bc5:	eb 16                	jmp    800bdd <vprintfmt+0x36e>
  800bc7:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800bcb:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800bcf:	48 89 d6             	mov    %rdx,%rsi
  800bd2:	bf 20 00 00 00       	mov    $0x20,%edi
  800bd7:	ff d0                	callq  *%rax
  800bd9:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800bdd:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800be1:	7f e4                	jg     800bc7 <vprintfmt+0x358>
  800be3:	e9 90 01 00 00       	jmpq   800d78 <vprintfmt+0x509>
  800be8:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800bec:	be 03 00 00 00       	mov    $0x3,%esi
  800bf1:	48 89 c7             	mov    %rax,%rdi
  800bf4:	48 b8 5f 07 80 00 00 	movabs $0x80075f,%rax
  800bfb:	00 00 00 
  800bfe:	ff d0                	callq  *%rax
  800c00:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800c04:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c08:	48 85 c0             	test   %rax,%rax
  800c0b:	79 1d                	jns    800c2a <vprintfmt+0x3bb>
  800c0d:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c11:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c15:	48 89 d6             	mov    %rdx,%rsi
  800c18:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800c1d:	ff d0                	callq  *%rax
  800c1f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c23:	48 f7 d8             	neg    %rax
  800c26:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800c2a:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800c31:	e9 d5 00 00 00       	jmpq   800d0b <vprintfmt+0x49c>
  800c36:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800c3a:	be 03 00 00 00       	mov    $0x3,%esi
  800c3f:	48 89 c7             	mov    %rax,%rdi
  800c42:	48 b8 4f 06 80 00 00 	movabs $0x80064f,%rax
  800c49:	00 00 00 
  800c4c:	ff d0                	callq  *%rax
  800c4e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800c52:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800c59:	e9 ad 00 00 00       	jmpq   800d0b <vprintfmt+0x49c>
  800c5e:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800c62:	be 03 00 00 00       	mov    $0x3,%esi
  800c67:	48 89 c7             	mov    %rax,%rdi
  800c6a:	48 b8 4f 06 80 00 00 	movabs $0x80064f,%rax
  800c71:	00 00 00 
  800c74:	ff d0                	callq  *%rax
  800c76:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800c7a:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800c81:	e9 85 00 00 00       	jmpq   800d0b <vprintfmt+0x49c>
  800c86:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c8a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c8e:	48 89 d6             	mov    %rdx,%rsi
  800c91:	bf 30 00 00 00       	mov    $0x30,%edi
  800c96:	ff d0                	callq  *%rax
  800c98:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c9c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ca0:	48 89 d6             	mov    %rdx,%rsi
  800ca3:	bf 78 00 00 00       	mov    $0x78,%edi
  800ca8:	ff d0                	callq  *%rax
  800caa:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800cad:	83 f8 30             	cmp    $0x30,%eax
  800cb0:	73 17                	jae    800cc9 <vprintfmt+0x45a>
  800cb2:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800cb6:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800cb9:	89 c0                	mov    %eax,%eax
  800cbb:	48 01 d0             	add    %rdx,%rax
  800cbe:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800cc1:	83 c2 08             	add    $0x8,%edx
  800cc4:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800cc7:	eb 0f                	jmp    800cd8 <vprintfmt+0x469>
  800cc9:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800ccd:	48 89 d0             	mov    %rdx,%rax
  800cd0:	48 83 c2 08          	add    $0x8,%rdx
  800cd4:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800cd8:	48 8b 00             	mov    (%rax),%rax
  800cdb:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800cdf:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800ce6:	eb 23                	jmp    800d0b <vprintfmt+0x49c>
  800ce8:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800cec:	be 03 00 00 00       	mov    $0x3,%esi
  800cf1:	48 89 c7             	mov    %rax,%rdi
  800cf4:	48 b8 4f 06 80 00 00 	movabs $0x80064f,%rax
  800cfb:	00 00 00 
  800cfe:	ff d0                	callq  *%rax
  800d00:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800d04:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800d0b:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  800d10:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800d13:	8b 7d dc             	mov    -0x24(%rbp),%edi
  800d16:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800d1a:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800d1e:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d22:	45 89 c1             	mov    %r8d,%r9d
  800d25:	41 89 f8             	mov    %edi,%r8d
  800d28:	48 89 c7             	mov    %rax,%rdi
  800d2b:	48 b8 94 05 80 00 00 	movabs $0x800594,%rax
  800d32:	00 00 00 
  800d35:	ff d0                	callq  *%rax
  800d37:	eb 3f                	jmp    800d78 <vprintfmt+0x509>
  800d39:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d3d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d41:	48 89 d6             	mov    %rdx,%rsi
  800d44:	89 df                	mov    %ebx,%edi
  800d46:	ff d0                	callq  *%rax
  800d48:	eb 2e                	jmp    800d78 <vprintfmt+0x509>
  800d4a:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d4e:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d52:	48 89 d6             	mov    %rdx,%rsi
  800d55:	bf 25 00 00 00       	mov    $0x25,%edi
  800d5a:	ff d0                	callq  *%rax
  800d5c:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800d61:	eb 05                	jmp    800d68 <vprintfmt+0x4f9>
  800d63:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800d68:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800d6c:	48 83 e8 01          	sub    $0x1,%rax
  800d70:	0f b6 00             	movzbl (%rax),%eax
  800d73:	3c 25                	cmp    $0x25,%al
  800d75:	75 ec                	jne    800d63 <vprintfmt+0x4f4>
  800d77:	90                   	nop
  800d78:	90                   	nop
  800d79:	e9 43 fb ff ff       	jmpq   8008c1 <vprintfmt+0x52>
  800d7e:	48 83 c4 60          	add    $0x60,%rsp
  800d82:	5b                   	pop    %rbx
  800d83:	41 5c                	pop    %r12
  800d85:	5d                   	pop    %rbp
  800d86:	c3                   	retq   

0000000000800d87 <printfmt>:
  800d87:	55                   	push   %rbp
  800d88:	48 89 e5             	mov    %rsp,%rbp
  800d8b:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  800d92:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  800d99:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  800da0:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800da7:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800dae:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800db5:	84 c0                	test   %al,%al
  800db7:	74 20                	je     800dd9 <printfmt+0x52>
  800db9:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800dbd:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800dc1:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800dc5:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800dc9:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800dcd:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800dd1:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800dd5:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800dd9:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  800de0:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  800de7:	00 00 00 
  800dea:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  800df1:	00 00 00 
  800df4:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800df8:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800dff:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800e06:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  800e0d:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  800e14:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800e1b:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  800e22:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  800e29:	48 89 c7             	mov    %rax,%rdi
  800e2c:	48 b8 6f 08 80 00 00 	movabs $0x80086f,%rax
  800e33:	00 00 00 
  800e36:	ff d0                	callq  *%rax
  800e38:	c9                   	leaveq 
  800e39:	c3                   	retq   

0000000000800e3a <sprintputch>:
  800e3a:	55                   	push   %rbp
  800e3b:	48 89 e5             	mov    %rsp,%rbp
  800e3e:	48 83 ec 10          	sub    $0x10,%rsp
  800e42:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800e45:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800e49:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e4d:	8b 40 10             	mov    0x10(%rax),%eax
  800e50:	8d 50 01             	lea    0x1(%rax),%edx
  800e53:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e57:	89 50 10             	mov    %edx,0x10(%rax)
  800e5a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e5e:	48 8b 10             	mov    (%rax),%rdx
  800e61:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e65:	48 8b 40 08          	mov    0x8(%rax),%rax
  800e69:	48 39 c2             	cmp    %rax,%rdx
  800e6c:	73 17                	jae    800e85 <sprintputch+0x4b>
  800e6e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e72:	48 8b 00             	mov    (%rax),%rax
  800e75:	48 8d 48 01          	lea    0x1(%rax),%rcx
  800e79:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800e7d:	48 89 0a             	mov    %rcx,(%rdx)
  800e80:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800e83:	88 10                	mov    %dl,(%rax)
  800e85:	c9                   	leaveq 
  800e86:	c3                   	retq   

0000000000800e87 <vsnprintf>:
  800e87:	55                   	push   %rbp
  800e88:	48 89 e5             	mov    %rsp,%rbp
  800e8b:	48 83 ec 50          	sub    $0x50,%rsp
  800e8f:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  800e93:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  800e96:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  800e9a:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  800e9e:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  800ea2:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  800ea6:	48 8b 0a             	mov    (%rdx),%rcx
  800ea9:	48 89 08             	mov    %rcx,(%rax)
  800eac:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800eb0:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800eb4:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800eb8:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800ebc:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800ec0:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  800ec4:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  800ec7:	48 98                	cltq   
  800ec9:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  800ecd:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800ed1:	48 01 d0             	add    %rdx,%rax
  800ed4:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  800ed8:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800edf:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  800ee4:	74 06                	je     800eec <vsnprintf+0x65>
  800ee6:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  800eea:	7f 07                	jg     800ef3 <vsnprintf+0x6c>
  800eec:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800ef1:	eb 2f                	jmp    800f22 <vsnprintf+0x9b>
  800ef3:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  800ef7:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  800efb:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  800eff:	48 89 c6             	mov    %rax,%rsi
  800f02:	48 bf 3a 0e 80 00 00 	movabs $0x800e3a,%rdi
  800f09:	00 00 00 
  800f0c:	48 b8 6f 08 80 00 00 	movabs $0x80086f,%rax
  800f13:	00 00 00 
  800f16:	ff d0                	callq  *%rax
  800f18:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800f1c:	c6 00 00             	movb   $0x0,(%rax)
  800f1f:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800f22:	c9                   	leaveq 
  800f23:	c3                   	retq   

0000000000800f24 <snprintf>:
  800f24:	55                   	push   %rbp
  800f25:	48 89 e5             	mov    %rsp,%rbp
  800f28:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  800f2f:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800f36:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  800f3c:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800f43:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800f4a:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800f51:	84 c0                	test   %al,%al
  800f53:	74 20                	je     800f75 <snprintf+0x51>
  800f55:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800f59:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800f5d:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800f61:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800f65:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800f69:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800f6d:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800f71:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800f75:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  800f7c:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  800f83:	00 00 00 
  800f86:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800f8d:	00 00 00 
  800f90:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800f94:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800f9b:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800fa2:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800fa9:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800fb0:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800fb7:	48 8b 0a             	mov    (%rdx),%rcx
  800fba:	48 89 08             	mov    %rcx,(%rax)
  800fbd:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800fc1:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800fc5:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800fc9:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800fcd:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  800fd4:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  800fdb:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  800fe1:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800fe8:	48 89 c7             	mov    %rax,%rdi
  800feb:	48 b8 87 0e 80 00 00 	movabs $0x800e87,%rax
  800ff2:	00 00 00 
  800ff5:	ff d0                	callq  *%rax
  800ff7:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  800ffd:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  801003:	c9                   	leaveq 
  801004:	c3                   	retq   

0000000000801005 <strlen>:
  801005:	55                   	push   %rbp
  801006:	48 89 e5             	mov    %rsp,%rbp
  801009:	48 83 ec 18          	sub    $0x18,%rsp
  80100d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801011:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801018:	eb 09                	jmp    801023 <strlen+0x1e>
  80101a:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80101e:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801023:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801027:	0f b6 00             	movzbl (%rax),%eax
  80102a:	84 c0                	test   %al,%al
  80102c:	75 ec                	jne    80101a <strlen+0x15>
  80102e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801031:	c9                   	leaveq 
  801032:	c3                   	retq   

0000000000801033 <strnlen>:
  801033:	55                   	push   %rbp
  801034:	48 89 e5             	mov    %rsp,%rbp
  801037:	48 83 ec 20          	sub    $0x20,%rsp
  80103b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80103f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801043:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80104a:	eb 0e                	jmp    80105a <strnlen+0x27>
  80104c:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801050:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801055:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  80105a:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80105f:	74 0b                	je     80106c <strnlen+0x39>
  801061:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801065:	0f b6 00             	movzbl (%rax),%eax
  801068:	84 c0                	test   %al,%al
  80106a:	75 e0                	jne    80104c <strnlen+0x19>
  80106c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80106f:	c9                   	leaveq 
  801070:	c3                   	retq   

0000000000801071 <strcpy>:
  801071:	55                   	push   %rbp
  801072:	48 89 e5             	mov    %rsp,%rbp
  801075:	48 83 ec 20          	sub    $0x20,%rsp
  801079:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80107d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801081:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801085:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801089:	90                   	nop
  80108a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80108e:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801092:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801096:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80109a:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  80109e:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8010a2:	0f b6 12             	movzbl (%rdx),%edx
  8010a5:	88 10                	mov    %dl,(%rax)
  8010a7:	0f b6 00             	movzbl (%rax),%eax
  8010aa:	84 c0                	test   %al,%al
  8010ac:	75 dc                	jne    80108a <strcpy+0x19>
  8010ae:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010b2:	c9                   	leaveq 
  8010b3:	c3                   	retq   

00000000008010b4 <strcat>:
  8010b4:	55                   	push   %rbp
  8010b5:	48 89 e5             	mov    %rsp,%rbp
  8010b8:	48 83 ec 20          	sub    $0x20,%rsp
  8010bc:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8010c0:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8010c4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010c8:	48 89 c7             	mov    %rax,%rdi
  8010cb:	48 b8 05 10 80 00 00 	movabs $0x801005,%rax
  8010d2:	00 00 00 
  8010d5:	ff d0                	callq  *%rax
  8010d7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8010da:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8010dd:	48 63 d0             	movslq %eax,%rdx
  8010e0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010e4:	48 01 c2             	add    %rax,%rdx
  8010e7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8010eb:	48 89 c6             	mov    %rax,%rsi
  8010ee:	48 89 d7             	mov    %rdx,%rdi
  8010f1:	48 b8 71 10 80 00 00 	movabs $0x801071,%rax
  8010f8:	00 00 00 
  8010fb:	ff d0                	callq  *%rax
  8010fd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801101:	c9                   	leaveq 
  801102:	c3                   	retq   

0000000000801103 <strncpy>:
  801103:	55                   	push   %rbp
  801104:	48 89 e5             	mov    %rsp,%rbp
  801107:	48 83 ec 28          	sub    $0x28,%rsp
  80110b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80110f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801113:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801117:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80111b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80111f:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  801126:	00 
  801127:	eb 2a                	jmp    801153 <strncpy+0x50>
  801129:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80112d:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801131:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801135:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801139:	0f b6 12             	movzbl (%rdx),%edx
  80113c:	88 10                	mov    %dl,(%rax)
  80113e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801142:	0f b6 00             	movzbl (%rax),%eax
  801145:	84 c0                	test   %al,%al
  801147:	74 05                	je     80114e <strncpy+0x4b>
  801149:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  80114e:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801153:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801157:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  80115b:	72 cc                	jb     801129 <strncpy+0x26>
  80115d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801161:	c9                   	leaveq 
  801162:	c3                   	retq   

0000000000801163 <strlcpy>:
  801163:	55                   	push   %rbp
  801164:	48 89 e5             	mov    %rsp,%rbp
  801167:	48 83 ec 28          	sub    $0x28,%rsp
  80116b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80116f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801173:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801177:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80117b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80117f:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801184:	74 3d                	je     8011c3 <strlcpy+0x60>
  801186:	eb 1d                	jmp    8011a5 <strlcpy+0x42>
  801188:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80118c:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801190:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801194:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801198:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  80119c:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8011a0:	0f b6 12             	movzbl (%rdx),%edx
  8011a3:	88 10                	mov    %dl,(%rax)
  8011a5:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  8011aa:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8011af:	74 0b                	je     8011bc <strlcpy+0x59>
  8011b1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8011b5:	0f b6 00             	movzbl (%rax),%eax
  8011b8:	84 c0                	test   %al,%al
  8011ba:	75 cc                	jne    801188 <strlcpy+0x25>
  8011bc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011c0:	c6 00 00             	movb   $0x0,(%rax)
  8011c3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8011c7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011cb:	48 29 c2             	sub    %rax,%rdx
  8011ce:	48 89 d0             	mov    %rdx,%rax
  8011d1:	c9                   	leaveq 
  8011d2:	c3                   	retq   

00000000008011d3 <strcmp>:
  8011d3:	55                   	push   %rbp
  8011d4:	48 89 e5             	mov    %rsp,%rbp
  8011d7:	48 83 ec 10          	sub    $0x10,%rsp
  8011db:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8011df:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8011e3:	eb 0a                	jmp    8011ef <strcmp+0x1c>
  8011e5:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8011ea:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8011ef:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011f3:	0f b6 00             	movzbl (%rax),%eax
  8011f6:	84 c0                	test   %al,%al
  8011f8:	74 12                	je     80120c <strcmp+0x39>
  8011fa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011fe:	0f b6 10             	movzbl (%rax),%edx
  801201:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801205:	0f b6 00             	movzbl (%rax),%eax
  801208:	38 c2                	cmp    %al,%dl
  80120a:	74 d9                	je     8011e5 <strcmp+0x12>
  80120c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801210:	0f b6 00             	movzbl (%rax),%eax
  801213:	0f b6 d0             	movzbl %al,%edx
  801216:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80121a:	0f b6 00             	movzbl (%rax),%eax
  80121d:	0f b6 c0             	movzbl %al,%eax
  801220:	29 c2                	sub    %eax,%edx
  801222:	89 d0                	mov    %edx,%eax
  801224:	c9                   	leaveq 
  801225:	c3                   	retq   

0000000000801226 <strncmp>:
  801226:	55                   	push   %rbp
  801227:	48 89 e5             	mov    %rsp,%rbp
  80122a:	48 83 ec 18          	sub    $0x18,%rsp
  80122e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801232:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801236:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80123a:	eb 0f                	jmp    80124b <strncmp+0x25>
  80123c:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  801241:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801246:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  80124b:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801250:	74 1d                	je     80126f <strncmp+0x49>
  801252:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801256:	0f b6 00             	movzbl (%rax),%eax
  801259:	84 c0                	test   %al,%al
  80125b:	74 12                	je     80126f <strncmp+0x49>
  80125d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801261:	0f b6 10             	movzbl (%rax),%edx
  801264:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801268:	0f b6 00             	movzbl (%rax),%eax
  80126b:	38 c2                	cmp    %al,%dl
  80126d:	74 cd                	je     80123c <strncmp+0x16>
  80126f:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801274:	75 07                	jne    80127d <strncmp+0x57>
  801276:	b8 00 00 00 00       	mov    $0x0,%eax
  80127b:	eb 18                	jmp    801295 <strncmp+0x6f>
  80127d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801281:	0f b6 00             	movzbl (%rax),%eax
  801284:	0f b6 d0             	movzbl %al,%edx
  801287:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80128b:	0f b6 00             	movzbl (%rax),%eax
  80128e:	0f b6 c0             	movzbl %al,%eax
  801291:	29 c2                	sub    %eax,%edx
  801293:	89 d0                	mov    %edx,%eax
  801295:	c9                   	leaveq 
  801296:	c3                   	retq   

0000000000801297 <strchr>:
  801297:	55                   	push   %rbp
  801298:	48 89 e5             	mov    %rsp,%rbp
  80129b:	48 83 ec 0c          	sub    $0xc,%rsp
  80129f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8012a3:	89 f0                	mov    %esi,%eax
  8012a5:	88 45 f4             	mov    %al,-0xc(%rbp)
  8012a8:	eb 17                	jmp    8012c1 <strchr+0x2a>
  8012aa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012ae:	0f b6 00             	movzbl (%rax),%eax
  8012b1:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8012b4:	75 06                	jne    8012bc <strchr+0x25>
  8012b6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012ba:	eb 15                	jmp    8012d1 <strchr+0x3a>
  8012bc:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8012c1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012c5:	0f b6 00             	movzbl (%rax),%eax
  8012c8:	84 c0                	test   %al,%al
  8012ca:	75 de                	jne    8012aa <strchr+0x13>
  8012cc:	b8 00 00 00 00       	mov    $0x0,%eax
  8012d1:	c9                   	leaveq 
  8012d2:	c3                   	retq   

00000000008012d3 <strfind>:
  8012d3:	55                   	push   %rbp
  8012d4:	48 89 e5             	mov    %rsp,%rbp
  8012d7:	48 83 ec 0c          	sub    $0xc,%rsp
  8012db:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8012df:	89 f0                	mov    %esi,%eax
  8012e1:	88 45 f4             	mov    %al,-0xc(%rbp)
  8012e4:	eb 13                	jmp    8012f9 <strfind+0x26>
  8012e6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012ea:	0f b6 00             	movzbl (%rax),%eax
  8012ed:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8012f0:	75 02                	jne    8012f4 <strfind+0x21>
  8012f2:	eb 10                	jmp    801304 <strfind+0x31>
  8012f4:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8012f9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012fd:	0f b6 00             	movzbl (%rax),%eax
  801300:	84 c0                	test   %al,%al
  801302:	75 e2                	jne    8012e6 <strfind+0x13>
  801304:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801308:	c9                   	leaveq 
  801309:	c3                   	retq   

000000000080130a <memset>:
  80130a:	55                   	push   %rbp
  80130b:	48 89 e5             	mov    %rsp,%rbp
  80130e:	48 83 ec 18          	sub    $0x18,%rsp
  801312:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801316:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801319:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80131d:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801322:	75 06                	jne    80132a <memset+0x20>
  801324:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801328:	eb 69                	jmp    801393 <memset+0x89>
  80132a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80132e:	83 e0 03             	and    $0x3,%eax
  801331:	48 85 c0             	test   %rax,%rax
  801334:	75 48                	jne    80137e <memset+0x74>
  801336:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80133a:	83 e0 03             	and    $0x3,%eax
  80133d:	48 85 c0             	test   %rax,%rax
  801340:	75 3c                	jne    80137e <memset+0x74>
  801342:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  801349:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80134c:	c1 e0 18             	shl    $0x18,%eax
  80134f:	89 c2                	mov    %eax,%edx
  801351:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801354:	c1 e0 10             	shl    $0x10,%eax
  801357:	09 c2                	or     %eax,%edx
  801359:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80135c:	c1 e0 08             	shl    $0x8,%eax
  80135f:	09 d0                	or     %edx,%eax
  801361:	09 45 f4             	or     %eax,-0xc(%rbp)
  801364:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801368:	48 c1 e8 02          	shr    $0x2,%rax
  80136c:	48 89 c1             	mov    %rax,%rcx
  80136f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801373:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801376:	48 89 d7             	mov    %rdx,%rdi
  801379:	fc                   	cld    
  80137a:	f3 ab                	rep stos %eax,%es:(%rdi)
  80137c:	eb 11                	jmp    80138f <memset+0x85>
  80137e:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801382:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801385:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801389:	48 89 d7             	mov    %rdx,%rdi
  80138c:	fc                   	cld    
  80138d:	f3 aa                	rep stos %al,%es:(%rdi)
  80138f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801393:	c9                   	leaveq 
  801394:	c3                   	retq   

0000000000801395 <memmove>:
  801395:	55                   	push   %rbp
  801396:	48 89 e5             	mov    %rsp,%rbp
  801399:	48 83 ec 28          	sub    $0x28,%rsp
  80139d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8013a1:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8013a5:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8013a9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8013ad:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8013b1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013b5:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8013b9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013bd:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8013c1:	0f 83 88 00 00 00    	jae    80144f <memmove+0xba>
  8013c7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8013cb:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8013cf:	48 01 d0             	add    %rdx,%rax
  8013d2:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8013d6:	76 77                	jbe    80144f <memmove+0xba>
  8013d8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8013dc:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  8013e0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8013e4:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  8013e8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013ec:	83 e0 03             	and    $0x3,%eax
  8013ef:	48 85 c0             	test   %rax,%rax
  8013f2:	75 3b                	jne    80142f <memmove+0x9a>
  8013f4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8013f8:	83 e0 03             	and    $0x3,%eax
  8013fb:	48 85 c0             	test   %rax,%rax
  8013fe:	75 2f                	jne    80142f <memmove+0x9a>
  801400:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801404:	83 e0 03             	and    $0x3,%eax
  801407:	48 85 c0             	test   %rax,%rax
  80140a:	75 23                	jne    80142f <memmove+0x9a>
  80140c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801410:	48 83 e8 04          	sub    $0x4,%rax
  801414:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801418:	48 83 ea 04          	sub    $0x4,%rdx
  80141c:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801420:	48 c1 e9 02          	shr    $0x2,%rcx
  801424:	48 89 c7             	mov    %rax,%rdi
  801427:	48 89 d6             	mov    %rdx,%rsi
  80142a:	fd                   	std    
  80142b:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  80142d:	eb 1d                	jmp    80144c <memmove+0xb7>
  80142f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801433:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801437:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80143b:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  80143f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801443:	48 89 d7             	mov    %rdx,%rdi
  801446:	48 89 c1             	mov    %rax,%rcx
  801449:	fd                   	std    
  80144a:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  80144c:	fc                   	cld    
  80144d:	eb 57                	jmp    8014a6 <memmove+0x111>
  80144f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801453:	83 e0 03             	and    $0x3,%eax
  801456:	48 85 c0             	test   %rax,%rax
  801459:	75 36                	jne    801491 <memmove+0xfc>
  80145b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80145f:	83 e0 03             	and    $0x3,%eax
  801462:	48 85 c0             	test   %rax,%rax
  801465:	75 2a                	jne    801491 <memmove+0xfc>
  801467:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80146b:	83 e0 03             	and    $0x3,%eax
  80146e:	48 85 c0             	test   %rax,%rax
  801471:	75 1e                	jne    801491 <memmove+0xfc>
  801473:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801477:	48 c1 e8 02          	shr    $0x2,%rax
  80147b:	48 89 c1             	mov    %rax,%rcx
  80147e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801482:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801486:	48 89 c7             	mov    %rax,%rdi
  801489:	48 89 d6             	mov    %rdx,%rsi
  80148c:	fc                   	cld    
  80148d:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  80148f:	eb 15                	jmp    8014a6 <memmove+0x111>
  801491:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801495:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801499:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  80149d:	48 89 c7             	mov    %rax,%rdi
  8014a0:	48 89 d6             	mov    %rdx,%rsi
  8014a3:	fc                   	cld    
  8014a4:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  8014a6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014aa:	c9                   	leaveq 
  8014ab:	c3                   	retq   

00000000008014ac <memcpy>:
  8014ac:	55                   	push   %rbp
  8014ad:	48 89 e5             	mov    %rsp,%rbp
  8014b0:	48 83 ec 18          	sub    $0x18,%rsp
  8014b4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8014b8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8014bc:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8014c0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8014c4:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8014c8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014cc:	48 89 ce             	mov    %rcx,%rsi
  8014cf:	48 89 c7             	mov    %rax,%rdi
  8014d2:	48 b8 95 13 80 00 00 	movabs $0x801395,%rax
  8014d9:	00 00 00 
  8014dc:	ff d0                	callq  *%rax
  8014de:	c9                   	leaveq 
  8014df:	c3                   	retq   

00000000008014e0 <memcmp>:
  8014e0:	55                   	push   %rbp
  8014e1:	48 89 e5             	mov    %rsp,%rbp
  8014e4:	48 83 ec 28          	sub    $0x28,%rsp
  8014e8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8014ec:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8014f0:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8014f4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014f8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8014fc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801500:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801504:	eb 36                	jmp    80153c <memcmp+0x5c>
  801506:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80150a:	0f b6 10             	movzbl (%rax),%edx
  80150d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801511:	0f b6 00             	movzbl (%rax),%eax
  801514:	38 c2                	cmp    %al,%dl
  801516:	74 1a                	je     801532 <memcmp+0x52>
  801518:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80151c:	0f b6 00             	movzbl (%rax),%eax
  80151f:	0f b6 d0             	movzbl %al,%edx
  801522:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801526:	0f b6 00             	movzbl (%rax),%eax
  801529:	0f b6 c0             	movzbl %al,%eax
  80152c:	29 c2                	sub    %eax,%edx
  80152e:	89 d0                	mov    %edx,%eax
  801530:	eb 20                	jmp    801552 <memcmp+0x72>
  801532:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801537:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  80153c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801540:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801544:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801548:	48 85 c0             	test   %rax,%rax
  80154b:	75 b9                	jne    801506 <memcmp+0x26>
  80154d:	b8 00 00 00 00       	mov    $0x0,%eax
  801552:	c9                   	leaveq 
  801553:	c3                   	retq   

0000000000801554 <memfind>:
  801554:	55                   	push   %rbp
  801555:	48 89 e5             	mov    %rsp,%rbp
  801558:	48 83 ec 28          	sub    $0x28,%rsp
  80155c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801560:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  801563:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801567:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80156b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80156f:	48 01 d0             	add    %rdx,%rax
  801572:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801576:	eb 15                	jmp    80158d <memfind+0x39>
  801578:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80157c:	0f b6 10             	movzbl (%rax),%edx
  80157f:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801582:	38 c2                	cmp    %al,%dl
  801584:	75 02                	jne    801588 <memfind+0x34>
  801586:	eb 0f                	jmp    801597 <memfind+0x43>
  801588:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80158d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801591:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  801595:	72 e1                	jb     801578 <memfind+0x24>
  801597:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80159b:	c9                   	leaveq 
  80159c:	c3                   	retq   

000000000080159d <strtol>:
  80159d:	55                   	push   %rbp
  80159e:	48 89 e5             	mov    %rsp,%rbp
  8015a1:	48 83 ec 34          	sub    $0x34,%rsp
  8015a5:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8015a9:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8015ad:	89 55 cc             	mov    %edx,-0x34(%rbp)
  8015b0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8015b7:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  8015be:	00 
  8015bf:	eb 05                	jmp    8015c6 <strtol+0x29>
  8015c1:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8015c6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015ca:	0f b6 00             	movzbl (%rax),%eax
  8015cd:	3c 20                	cmp    $0x20,%al
  8015cf:	74 f0                	je     8015c1 <strtol+0x24>
  8015d1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015d5:	0f b6 00             	movzbl (%rax),%eax
  8015d8:	3c 09                	cmp    $0x9,%al
  8015da:	74 e5                	je     8015c1 <strtol+0x24>
  8015dc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015e0:	0f b6 00             	movzbl (%rax),%eax
  8015e3:	3c 2b                	cmp    $0x2b,%al
  8015e5:	75 07                	jne    8015ee <strtol+0x51>
  8015e7:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8015ec:	eb 17                	jmp    801605 <strtol+0x68>
  8015ee:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015f2:	0f b6 00             	movzbl (%rax),%eax
  8015f5:	3c 2d                	cmp    $0x2d,%al
  8015f7:	75 0c                	jne    801605 <strtol+0x68>
  8015f9:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8015fe:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  801605:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801609:	74 06                	je     801611 <strtol+0x74>
  80160b:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  80160f:	75 28                	jne    801639 <strtol+0x9c>
  801611:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801615:	0f b6 00             	movzbl (%rax),%eax
  801618:	3c 30                	cmp    $0x30,%al
  80161a:	75 1d                	jne    801639 <strtol+0x9c>
  80161c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801620:	48 83 c0 01          	add    $0x1,%rax
  801624:	0f b6 00             	movzbl (%rax),%eax
  801627:	3c 78                	cmp    $0x78,%al
  801629:	75 0e                	jne    801639 <strtol+0x9c>
  80162b:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  801630:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  801637:	eb 2c                	jmp    801665 <strtol+0xc8>
  801639:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  80163d:	75 19                	jne    801658 <strtol+0xbb>
  80163f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801643:	0f b6 00             	movzbl (%rax),%eax
  801646:	3c 30                	cmp    $0x30,%al
  801648:	75 0e                	jne    801658 <strtol+0xbb>
  80164a:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80164f:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  801656:	eb 0d                	jmp    801665 <strtol+0xc8>
  801658:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  80165c:	75 07                	jne    801665 <strtol+0xc8>
  80165e:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  801665:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801669:	0f b6 00             	movzbl (%rax),%eax
  80166c:	3c 2f                	cmp    $0x2f,%al
  80166e:	7e 1d                	jle    80168d <strtol+0xf0>
  801670:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801674:	0f b6 00             	movzbl (%rax),%eax
  801677:	3c 39                	cmp    $0x39,%al
  801679:	7f 12                	jg     80168d <strtol+0xf0>
  80167b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80167f:	0f b6 00             	movzbl (%rax),%eax
  801682:	0f be c0             	movsbl %al,%eax
  801685:	83 e8 30             	sub    $0x30,%eax
  801688:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80168b:	eb 4e                	jmp    8016db <strtol+0x13e>
  80168d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801691:	0f b6 00             	movzbl (%rax),%eax
  801694:	3c 60                	cmp    $0x60,%al
  801696:	7e 1d                	jle    8016b5 <strtol+0x118>
  801698:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80169c:	0f b6 00             	movzbl (%rax),%eax
  80169f:	3c 7a                	cmp    $0x7a,%al
  8016a1:	7f 12                	jg     8016b5 <strtol+0x118>
  8016a3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016a7:	0f b6 00             	movzbl (%rax),%eax
  8016aa:	0f be c0             	movsbl %al,%eax
  8016ad:	83 e8 57             	sub    $0x57,%eax
  8016b0:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8016b3:	eb 26                	jmp    8016db <strtol+0x13e>
  8016b5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016b9:	0f b6 00             	movzbl (%rax),%eax
  8016bc:	3c 40                	cmp    $0x40,%al
  8016be:	7e 48                	jle    801708 <strtol+0x16b>
  8016c0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016c4:	0f b6 00             	movzbl (%rax),%eax
  8016c7:	3c 5a                	cmp    $0x5a,%al
  8016c9:	7f 3d                	jg     801708 <strtol+0x16b>
  8016cb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016cf:	0f b6 00             	movzbl (%rax),%eax
  8016d2:	0f be c0             	movsbl %al,%eax
  8016d5:	83 e8 37             	sub    $0x37,%eax
  8016d8:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8016db:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8016de:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  8016e1:	7c 02                	jl     8016e5 <strtol+0x148>
  8016e3:	eb 23                	jmp    801708 <strtol+0x16b>
  8016e5:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8016ea:	8b 45 cc             	mov    -0x34(%rbp),%eax
  8016ed:	48 98                	cltq   
  8016ef:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  8016f4:	48 89 c2             	mov    %rax,%rdx
  8016f7:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8016fa:	48 98                	cltq   
  8016fc:	48 01 d0             	add    %rdx,%rax
  8016ff:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801703:	e9 5d ff ff ff       	jmpq   801665 <strtol+0xc8>
  801708:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  80170d:	74 0b                	je     80171a <strtol+0x17d>
  80170f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801713:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801717:	48 89 10             	mov    %rdx,(%rax)
  80171a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80171e:	74 09                	je     801729 <strtol+0x18c>
  801720:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801724:	48 f7 d8             	neg    %rax
  801727:	eb 04                	jmp    80172d <strtol+0x190>
  801729:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80172d:	c9                   	leaveq 
  80172e:	c3                   	retq   

000000000080172f <strstr>:
  80172f:	55                   	push   %rbp
  801730:	48 89 e5             	mov    %rsp,%rbp
  801733:	48 83 ec 30          	sub    $0x30,%rsp
  801737:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80173b:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80173f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801743:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801747:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  80174b:	0f b6 00             	movzbl (%rax),%eax
  80174e:	88 45 ff             	mov    %al,-0x1(%rbp)
  801751:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  801755:	75 06                	jne    80175d <strstr+0x2e>
  801757:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80175b:	eb 6b                	jmp    8017c8 <strstr+0x99>
  80175d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801761:	48 89 c7             	mov    %rax,%rdi
  801764:	48 b8 05 10 80 00 00 	movabs $0x801005,%rax
  80176b:	00 00 00 
  80176e:	ff d0                	callq  *%rax
  801770:	48 98                	cltq   
  801772:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801776:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80177a:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80177e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801782:	0f b6 00             	movzbl (%rax),%eax
  801785:	88 45 ef             	mov    %al,-0x11(%rbp)
  801788:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  80178c:	75 07                	jne    801795 <strstr+0x66>
  80178e:	b8 00 00 00 00       	mov    $0x0,%eax
  801793:	eb 33                	jmp    8017c8 <strstr+0x99>
  801795:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  801799:	3a 45 ff             	cmp    -0x1(%rbp),%al
  80179c:	75 d8                	jne    801776 <strstr+0x47>
  80179e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8017a2:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  8017a6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017aa:	48 89 ce             	mov    %rcx,%rsi
  8017ad:	48 89 c7             	mov    %rax,%rdi
  8017b0:	48 b8 26 12 80 00 00 	movabs $0x801226,%rax
  8017b7:	00 00 00 
  8017ba:	ff d0                	callq  *%rax
  8017bc:	85 c0                	test   %eax,%eax
  8017be:	75 b6                	jne    801776 <strstr+0x47>
  8017c0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017c4:	48 83 e8 01          	sub    $0x1,%rax
  8017c8:	c9                   	leaveq 
  8017c9:	c3                   	retq   

00000000008017ca <syscall>:
  8017ca:	55                   	push   %rbp
  8017cb:	48 89 e5             	mov    %rsp,%rbp
  8017ce:	53                   	push   %rbx
  8017cf:	48 83 ec 48          	sub    $0x48,%rsp
  8017d3:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8017d6:	89 75 d8             	mov    %esi,-0x28(%rbp)
  8017d9:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  8017dd:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  8017e1:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  8017e5:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  8017e9:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8017ec:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  8017f0:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  8017f4:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  8017f8:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  8017fc:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  801800:	4c 89 c3             	mov    %r8,%rbx
  801803:	cd 30                	int    $0x30
  801805:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801809:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  80180d:	74 3e                	je     80184d <syscall+0x83>
  80180f:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801814:	7e 37                	jle    80184d <syscall+0x83>
  801816:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80181a:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80181d:	49 89 d0             	mov    %rdx,%r8
  801820:	89 c1                	mov    %eax,%ecx
  801822:	48 ba 68 49 80 00 00 	movabs $0x804968,%rdx
  801829:	00 00 00 
  80182c:	be 24 00 00 00       	mov    $0x24,%esi
  801831:	48 bf 85 49 80 00 00 	movabs $0x804985,%rdi
  801838:	00 00 00 
  80183b:	b8 00 00 00 00       	mov    $0x0,%eax
  801840:	49 b9 c6 3f 80 00 00 	movabs $0x803fc6,%r9
  801847:	00 00 00 
  80184a:	41 ff d1             	callq  *%r9
  80184d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801851:	48 83 c4 48          	add    $0x48,%rsp
  801855:	5b                   	pop    %rbx
  801856:	5d                   	pop    %rbp
  801857:	c3                   	retq   

0000000000801858 <sys_cputs>:
  801858:	55                   	push   %rbp
  801859:	48 89 e5             	mov    %rsp,%rbp
  80185c:	48 83 ec 20          	sub    $0x20,%rsp
  801860:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801864:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801868:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80186c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801870:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801877:	00 
  801878:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80187e:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801884:	48 89 d1             	mov    %rdx,%rcx
  801887:	48 89 c2             	mov    %rax,%rdx
  80188a:	be 00 00 00 00       	mov    $0x0,%esi
  80188f:	bf 00 00 00 00       	mov    $0x0,%edi
  801894:	48 b8 ca 17 80 00 00 	movabs $0x8017ca,%rax
  80189b:	00 00 00 
  80189e:	ff d0                	callq  *%rax
  8018a0:	c9                   	leaveq 
  8018a1:	c3                   	retq   

00000000008018a2 <sys_cgetc>:
  8018a2:	55                   	push   %rbp
  8018a3:	48 89 e5             	mov    %rsp,%rbp
  8018a6:	48 83 ec 10          	sub    $0x10,%rsp
  8018aa:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8018b1:	00 
  8018b2:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8018b8:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8018be:	b9 00 00 00 00       	mov    $0x0,%ecx
  8018c3:	ba 00 00 00 00       	mov    $0x0,%edx
  8018c8:	be 00 00 00 00       	mov    $0x0,%esi
  8018cd:	bf 01 00 00 00       	mov    $0x1,%edi
  8018d2:	48 b8 ca 17 80 00 00 	movabs $0x8017ca,%rax
  8018d9:	00 00 00 
  8018dc:	ff d0                	callq  *%rax
  8018de:	c9                   	leaveq 
  8018df:	c3                   	retq   

00000000008018e0 <sys_env_destroy>:
  8018e0:	55                   	push   %rbp
  8018e1:	48 89 e5             	mov    %rsp,%rbp
  8018e4:	48 83 ec 10          	sub    $0x10,%rsp
  8018e8:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8018eb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8018ee:	48 98                	cltq   
  8018f0:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8018f7:	00 
  8018f8:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8018fe:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801904:	b9 00 00 00 00       	mov    $0x0,%ecx
  801909:	48 89 c2             	mov    %rax,%rdx
  80190c:	be 01 00 00 00       	mov    $0x1,%esi
  801911:	bf 03 00 00 00       	mov    $0x3,%edi
  801916:	48 b8 ca 17 80 00 00 	movabs $0x8017ca,%rax
  80191d:	00 00 00 
  801920:	ff d0                	callq  *%rax
  801922:	c9                   	leaveq 
  801923:	c3                   	retq   

0000000000801924 <sys_getenvid>:
  801924:	55                   	push   %rbp
  801925:	48 89 e5             	mov    %rsp,%rbp
  801928:	48 83 ec 10          	sub    $0x10,%rsp
  80192c:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801933:	00 
  801934:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80193a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801940:	b9 00 00 00 00       	mov    $0x0,%ecx
  801945:	ba 00 00 00 00       	mov    $0x0,%edx
  80194a:	be 00 00 00 00       	mov    $0x0,%esi
  80194f:	bf 02 00 00 00       	mov    $0x2,%edi
  801954:	48 b8 ca 17 80 00 00 	movabs $0x8017ca,%rax
  80195b:	00 00 00 
  80195e:	ff d0                	callq  *%rax
  801960:	c9                   	leaveq 
  801961:	c3                   	retq   

0000000000801962 <sys_yield>:
  801962:	55                   	push   %rbp
  801963:	48 89 e5             	mov    %rsp,%rbp
  801966:	48 83 ec 10          	sub    $0x10,%rsp
  80196a:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801971:	00 
  801972:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801978:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80197e:	b9 00 00 00 00       	mov    $0x0,%ecx
  801983:	ba 00 00 00 00       	mov    $0x0,%edx
  801988:	be 00 00 00 00       	mov    $0x0,%esi
  80198d:	bf 0b 00 00 00       	mov    $0xb,%edi
  801992:	48 b8 ca 17 80 00 00 	movabs $0x8017ca,%rax
  801999:	00 00 00 
  80199c:	ff d0                	callq  *%rax
  80199e:	c9                   	leaveq 
  80199f:	c3                   	retq   

00000000008019a0 <sys_page_alloc>:
  8019a0:	55                   	push   %rbp
  8019a1:	48 89 e5             	mov    %rsp,%rbp
  8019a4:	48 83 ec 20          	sub    $0x20,%rsp
  8019a8:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8019ab:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8019af:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8019b2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8019b5:	48 63 c8             	movslq %eax,%rcx
  8019b8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8019bc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8019bf:	48 98                	cltq   
  8019c1:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8019c8:	00 
  8019c9:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8019cf:	49 89 c8             	mov    %rcx,%r8
  8019d2:	48 89 d1             	mov    %rdx,%rcx
  8019d5:	48 89 c2             	mov    %rax,%rdx
  8019d8:	be 01 00 00 00       	mov    $0x1,%esi
  8019dd:	bf 04 00 00 00       	mov    $0x4,%edi
  8019e2:	48 b8 ca 17 80 00 00 	movabs $0x8017ca,%rax
  8019e9:	00 00 00 
  8019ec:	ff d0                	callq  *%rax
  8019ee:	c9                   	leaveq 
  8019ef:	c3                   	retq   

00000000008019f0 <sys_page_map>:
  8019f0:	55                   	push   %rbp
  8019f1:	48 89 e5             	mov    %rsp,%rbp
  8019f4:	48 83 ec 30          	sub    $0x30,%rsp
  8019f8:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8019fb:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8019ff:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801a02:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801a06:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801a0a:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801a0d:	48 63 c8             	movslq %eax,%rcx
  801a10:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801a14:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801a17:	48 63 f0             	movslq %eax,%rsi
  801a1a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801a1e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a21:	48 98                	cltq   
  801a23:	48 89 0c 24          	mov    %rcx,(%rsp)
  801a27:	49 89 f9             	mov    %rdi,%r9
  801a2a:	49 89 f0             	mov    %rsi,%r8
  801a2d:	48 89 d1             	mov    %rdx,%rcx
  801a30:	48 89 c2             	mov    %rax,%rdx
  801a33:	be 01 00 00 00       	mov    $0x1,%esi
  801a38:	bf 05 00 00 00       	mov    $0x5,%edi
  801a3d:	48 b8 ca 17 80 00 00 	movabs $0x8017ca,%rax
  801a44:	00 00 00 
  801a47:	ff d0                	callq  *%rax
  801a49:	c9                   	leaveq 
  801a4a:	c3                   	retq   

0000000000801a4b <sys_page_unmap>:
  801a4b:	55                   	push   %rbp
  801a4c:	48 89 e5             	mov    %rsp,%rbp
  801a4f:	48 83 ec 20          	sub    $0x20,%rsp
  801a53:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a56:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a5a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801a5e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a61:	48 98                	cltq   
  801a63:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801a6a:	00 
  801a6b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a71:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a77:	48 89 d1             	mov    %rdx,%rcx
  801a7a:	48 89 c2             	mov    %rax,%rdx
  801a7d:	be 01 00 00 00       	mov    $0x1,%esi
  801a82:	bf 06 00 00 00       	mov    $0x6,%edi
  801a87:	48 b8 ca 17 80 00 00 	movabs $0x8017ca,%rax
  801a8e:	00 00 00 
  801a91:	ff d0                	callq  *%rax
  801a93:	c9                   	leaveq 
  801a94:	c3                   	retq   

0000000000801a95 <sys_env_set_status>:
  801a95:	55                   	push   %rbp
  801a96:	48 89 e5             	mov    %rsp,%rbp
  801a99:	48 83 ec 10          	sub    $0x10,%rsp
  801a9d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801aa0:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801aa3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801aa6:	48 63 d0             	movslq %eax,%rdx
  801aa9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801aac:	48 98                	cltq   
  801aae:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801ab5:	00 
  801ab6:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801abc:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ac2:	48 89 d1             	mov    %rdx,%rcx
  801ac5:	48 89 c2             	mov    %rax,%rdx
  801ac8:	be 01 00 00 00       	mov    $0x1,%esi
  801acd:	bf 08 00 00 00       	mov    $0x8,%edi
  801ad2:	48 b8 ca 17 80 00 00 	movabs $0x8017ca,%rax
  801ad9:	00 00 00 
  801adc:	ff d0                	callq  *%rax
  801ade:	c9                   	leaveq 
  801adf:	c3                   	retq   

0000000000801ae0 <sys_env_set_trapframe>:
  801ae0:	55                   	push   %rbp
  801ae1:	48 89 e5             	mov    %rsp,%rbp
  801ae4:	48 83 ec 20          	sub    $0x20,%rsp
  801ae8:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801aeb:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801aef:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801af3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801af6:	48 98                	cltq   
  801af8:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801aff:	00 
  801b00:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b06:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b0c:	48 89 d1             	mov    %rdx,%rcx
  801b0f:	48 89 c2             	mov    %rax,%rdx
  801b12:	be 01 00 00 00       	mov    $0x1,%esi
  801b17:	bf 09 00 00 00       	mov    $0x9,%edi
  801b1c:	48 b8 ca 17 80 00 00 	movabs $0x8017ca,%rax
  801b23:	00 00 00 
  801b26:	ff d0                	callq  *%rax
  801b28:	c9                   	leaveq 
  801b29:	c3                   	retq   

0000000000801b2a <sys_env_set_pgfault_upcall>:
  801b2a:	55                   	push   %rbp
  801b2b:	48 89 e5             	mov    %rsp,%rbp
  801b2e:	48 83 ec 20          	sub    $0x20,%rsp
  801b32:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b35:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b39:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b3d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b40:	48 98                	cltq   
  801b42:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801b49:	00 
  801b4a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b50:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b56:	48 89 d1             	mov    %rdx,%rcx
  801b59:	48 89 c2             	mov    %rax,%rdx
  801b5c:	be 01 00 00 00       	mov    $0x1,%esi
  801b61:	bf 0a 00 00 00       	mov    $0xa,%edi
  801b66:	48 b8 ca 17 80 00 00 	movabs $0x8017ca,%rax
  801b6d:	00 00 00 
  801b70:	ff d0                	callq  *%rax
  801b72:	c9                   	leaveq 
  801b73:	c3                   	retq   

0000000000801b74 <sys_ipc_try_send>:
  801b74:	55                   	push   %rbp
  801b75:	48 89 e5             	mov    %rsp,%rbp
  801b78:	48 83 ec 20          	sub    $0x20,%rsp
  801b7c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b7f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b83:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801b87:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801b8a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801b8d:	48 63 f0             	movslq %eax,%rsi
  801b90:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801b94:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b97:	48 98                	cltq   
  801b99:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b9d:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801ba4:	00 
  801ba5:	49 89 f1             	mov    %rsi,%r9
  801ba8:	49 89 c8             	mov    %rcx,%r8
  801bab:	48 89 d1             	mov    %rdx,%rcx
  801bae:	48 89 c2             	mov    %rax,%rdx
  801bb1:	be 00 00 00 00       	mov    $0x0,%esi
  801bb6:	bf 0c 00 00 00       	mov    $0xc,%edi
  801bbb:	48 b8 ca 17 80 00 00 	movabs $0x8017ca,%rax
  801bc2:	00 00 00 
  801bc5:	ff d0                	callq  *%rax
  801bc7:	c9                   	leaveq 
  801bc8:	c3                   	retq   

0000000000801bc9 <sys_ipc_recv>:
  801bc9:	55                   	push   %rbp
  801bca:	48 89 e5             	mov    %rsp,%rbp
  801bcd:	48 83 ec 10          	sub    $0x10,%rsp
  801bd1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801bd5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801bd9:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801be0:	00 
  801be1:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801be7:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801bed:	b9 00 00 00 00       	mov    $0x0,%ecx
  801bf2:	48 89 c2             	mov    %rax,%rdx
  801bf5:	be 01 00 00 00       	mov    $0x1,%esi
  801bfa:	bf 0d 00 00 00       	mov    $0xd,%edi
  801bff:	48 b8 ca 17 80 00 00 	movabs $0x8017ca,%rax
  801c06:	00 00 00 
  801c09:	ff d0                	callq  *%rax
  801c0b:	c9                   	leaveq 
  801c0c:	c3                   	retq   

0000000000801c0d <sys_time_msec>:
  801c0d:	55                   	push   %rbp
  801c0e:	48 89 e5             	mov    %rsp,%rbp
  801c11:	48 83 ec 10          	sub    $0x10,%rsp
  801c15:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c1c:	00 
  801c1d:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c23:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c29:	b9 00 00 00 00       	mov    $0x0,%ecx
  801c2e:	ba 00 00 00 00       	mov    $0x0,%edx
  801c33:	be 00 00 00 00       	mov    $0x0,%esi
  801c38:	bf 0e 00 00 00       	mov    $0xe,%edi
  801c3d:	48 b8 ca 17 80 00 00 	movabs $0x8017ca,%rax
  801c44:	00 00 00 
  801c47:	ff d0                	callq  *%rax
  801c49:	c9                   	leaveq 
  801c4a:	c3                   	retq   

0000000000801c4b <sys_net_transmit>:
  801c4b:	55                   	push   %rbp
  801c4c:	48 89 e5             	mov    %rsp,%rbp
  801c4f:	48 83 ec 20          	sub    $0x20,%rsp
  801c53:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c57:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801c5a:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801c5d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c61:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c68:	00 
  801c69:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c6f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c75:	48 89 d1             	mov    %rdx,%rcx
  801c78:	48 89 c2             	mov    %rax,%rdx
  801c7b:	be 00 00 00 00       	mov    $0x0,%esi
  801c80:	bf 0f 00 00 00       	mov    $0xf,%edi
  801c85:	48 b8 ca 17 80 00 00 	movabs $0x8017ca,%rax
  801c8c:	00 00 00 
  801c8f:	ff d0                	callq  *%rax
  801c91:	c9                   	leaveq 
  801c92:	c3                   	retq   

0000000000801c93 <sys_net_receive>:
  801c93:	55                   	push   %rbp
  801c94:	48 89 e5             	mov    %rsp,%rbp
  801c97:	48 83 ec 20          	sub    $0x20,%rsp
  801c9b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c9f:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801ca2:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801ca5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ca9:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801cb0:	00 
  801cb1:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801cb7:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801cbd:	48 89 d1             	mov    %rdx,%rcx
  801cc0:	48 89 c2             	mov    %rax,%rdx
  801cc3:	be 00 00 00 00       	mov    $0x0,%esi
  801cc8:	bf 10 00 00 00       	mov    $0x10,%edi
  801ccd:	48 b8 ca 17 80 00 00 	movabs $0x8017ca,%rax
  801cd4:	00 00 00 
  801cd7:	ff d0                	callq  *%rax
  801cd9:	c9                   	leaveq 
  801cda:	c3                   	retq   

0000000000801cdb <sys_ept_map>:
  801cdb:	55                   	push   %rbp
  801cdc:	48 89 e5             	mov    %rsp,%rbp
  801cdf:	48 83 ec 30          	sub    $0x30,%rsp
  801ce3:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801ce6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801cea:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801ced:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801cf1:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801cf5:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801cf8:	48 63 c8             	movslq %eax,%rcx
  801cfb:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801cff:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801d02:	48 63 f0             	movslq %eax,%rsi
  801d05:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d09:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801d0c:	48 98                	cltq   
  801d0e:	48 89 0c 24          	mov    %rcx,(%rsp)
  801d12:	49 89 f9             	mov    %rdi,%r9
  801d15:	49 89 f0             	mov    %rsi,%r8
  801d18:	48 89 d1             	mov    %rdx,%rcx
  801d1b:	48 89 c2             	mov    %rax,%rdx
  801d1e:	be 00 00 00 00       	mov    $0x0,%esi
  801d23:	bf 11 00 00 00       	mov    $0x11,%edi
  801d28:	48 b8 ca 17 80 00 00 	movabs $0x8017ca,%rax
  801d2f:	00 00 00 
  801d32:	ff d0                	callq  *%rax
  801d34:	c9                   	leaveq 
  801d35:	c3                   	retq   

0000000000801d36 <sys_env_mkguest>:
  801d36:	55                   	push   %rbp
  801d37:	48 89 e5             	mov    %rsp,%rbp
  801d3a:	48 83 ec 20          	sub    $0x20,%rsp
  801d3e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d42:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d46:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d4a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d4e:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801d55:	00 
  801d56:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d5c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d62:	48 89 d1             	mov    %rdx,%rcx
  801d65:	48 89 c2             	mov    %rax,%rdx
  801d68:	be 00 00 00 00       	mov    $0x0,%esi
  801d6d:	bf 12 00 00 00       	mov    $0x12,%edi
  801d72:	48 b8 ca 17 80 00 00 	movabs $0x8017ca,%rax
  801d79:	00 00 00 
  801d7c:	ff d0                	callq  *%rax
  801d7e:	c9                   	leaveq 
  801d7f:	c3                   	retq   

0000000000801d80 <sys_vmx_list_vms>:
  801d80:	55                   	push   %rbp
  801d81:	48 89 e5             	mov    %rsp,%rbp
  801d84:	48 83 ec 10          	sub    $0x10,%rsp
  801d88:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801d8f:	00 
  801d90:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d96:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d9c:	b9 00 00 00 00       	mov    $0x0,%ecx
  801da1:	ba 00 00 00 00       	mov    $0x0,%edx
  801da6:	be 00 00 00 00       	mov    $0x0,%esi
  801dab:	bf 13 00 00 00       	mov    $0x13,%edi
  801db0:	48 b8 ca 17 80 00 00 	movabs $0x8017ca,%rax
  801db7:	00 00 00 
  801dba:	ff d0                	callq  *%rax
  801dbc:	c9                   	leaveq 
  801dbd:	c3                   	retq   

0000000000801dbe <sys_vmx_sel_resume>:
  801dbe:	55                   	push   %rbp
  801dbf:	48 89 e5             	mov    %rsp,%rbp
  801dc2:	48 83 ec 10          	sub    $0x10,%rsp
  801dc6:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801dc9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801dcc:	48 98                	cltq   
  801dce:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801dd5:	00 
  801dd6:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ddc:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801de2:	b9 00 00 00 00       	mov    $0x0,%ecx
  801de7:	48 89 c2             	mov    %rax,%rdx
  801dea:	be 00 00 00 00       	mov    $0x0,%esi
  801def:	bf 14 00 00 00       	mov    $0x14,%edi
  801df4:	48 b8 ca 17 80 00 00 	movabs $0x8017ca,%rax
  801dfb:	00 00 00 
  801dfe:	ff d0                	callq  *%rax
  801e00:	c9                   	leaveq 
  801e01:	c3                   	retq   

0000000000801e02 <sys_vmx_get_vmdisk_number>:
  801e02:	55                   	push   %rbp
  801e03:	48 89 e5             	mov    %rsp,%rbp
  801e06:	48 83 ec 10          	sub    $0x10,%rsp
  801e0a:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801e11:	00 
  801e12:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e18:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e1e:	b9 00 00 00 00       	mov    $0x0,%ecx
  801e23:	ba 00 00 00 00       	mov    $0x0,%edx
  801e28:	be 00 00 00 00       	mov    $0x0,%esi
  801e2d:	bf 15 00 00 00       	mov    $0x15,%edi
  801e32:	48 b8 ca 17 80 00 00 	movabs $0x8017ca,%rax
  801e39:	00 00 00 
  801e3c:	ff d0                	callq  *%rax
  801e3e:	c9                   	leaveq 
  801e3f:	c3                   	retq   

0000000000801e40 <sys_vmx_incr_vmdisk_number>:
  801e40:	55                   	push   %rbp
  801e41:	48 89 e5             	mov    %rsp,%rbp
  801e44:	48 83 ec 10          	sub    $0x10,%rsp
  801e48:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801e4f:	00 
  801e50:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e56:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e5c:	b9 00 00 00 00       	mov    $0x0,%ecx
  801e61:	ba 00 00 00 00       	mov    $0x0,%edx
  801e66:	be 00 00 00 00       	mov    $0x0,%esi
  801e6b:	bf 16 00 00 00       	mov    $0x16,%edi
  801e70:	48 b8 ca 17 80 00 00 	movabs $0x8017ca,%rax
  801e77:	00 00 00 
  801e7a:	ff d0                	callq  *%rax
  801e7c:	c9                   	leaveq 
  801e7d:	c3                   	retq   

0000000000801e7e <fd2num>:
  801e7e:	55                   	push   %rbp
  801e7f:	48 89 e5             	mov    %rsp,%rbp
  801e82:	48 83 ec 08          	sub    $0x8,%rsp
  801e86:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801e8a:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801e8e:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  801e95:	ff ff ff 
  801e98:	48 01 d0             	add    %rdx,%rax
  801e9b:	48 c1 e8 0c          	shr    $0xc,%rax
  801e9f:	c9                   	leaveq 
  801ea0:	c3                   	retq   

0000000000801ea1 <fd2data>:
  801ea1:	55                   	push   %rbp
  801ea2:	48 89 e5             	mov    %rsp,%rbp
  801ea5:	48 83 ec 08          	sub    $0x8,%rsp
  801ea9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801ead:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801eb1:	48 89 c7             	mov    %rax,%rdi
  801eb4:	48 b8 7e 1e 80 00 00 	movabs $0x801e7e,%rax
  801ebb:	00 00 00 
  801ebe:	ff d0                	callq  *%rax
  801ec0:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  801ec6:	48 c1 e0 0c          	shl    $0xc,%rax
  801eca:	c9                   	leaveq 
  801ecb:	c3                   	retq   

0000000000801ecc <fd_alloc>:
  801ecc:	55                   	push   %rbp
  801ecd:	48 89 e5             	mov    %rsp,%rbp
  801ed0:	48 83 ec 18          	sub    $0x18,%rsp
  801ed4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801ed8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801edf:	eb 6b                	jmp    801f4c <fd_alloc+0x80>
  801ee1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ee4:	48 98                	cltq   
  801ee6:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801eec:	48 c1 e0 0c          	shl    $0xc,%rax
  801ef0:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801ef4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801ef8:	48 c1 e8 15          	shr    $0x15,%rax
  801efc:	48 89 c2             	mov    %rax,%rdx
  801eff:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  801f06:	01 00 00 
  801f09:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801f0d:	83 e0 01             	and    $0x1,%eax
  801f10:	48 85 c0             	test   %rax,%rax
  801f13:	74 21                	je     801f36 <fd_alloc+0x6a>
  801f15:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801f19:	48 c1 e8 0c          	shr    $0xc,%rax
  801f1d:	48 89 c2             	mov    %rax,%rdx
  801f20:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801f27:	01 00 00 
  801f2a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801f2e:	83 e0 01             	and    $0x1,%eax
  801f31:	48 85 c0             	test   %rax,%rax
  801f34:	75 12                	jne    801f48 <fd_alloc+0x7c>
  801f36:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801f3a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801f3e:	48 89 10             	mov    %rdx,(%rax)
  801f41:	b8 00 00 00 00       	mov    $0x0,%eax
  801f46:	eb 1a                	jmp    801f62 <fd_alloc+0x96>
  801f48:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801f4c:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  801f50:	7e 8f                	jle    801ee1 <fd_alloc+0x15>
  801f52:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801f56:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  801f5d:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  801f62:	c9                   	leaveq 
  801f63:	c3                   	retq   

0000000000801f64 <fd_lookup>:
  801f64:	55                   	push   %rbp
  801f65:	48 89 e5             	mov    %rsp,%rbp
  801f68:	48 83 ec 20          	sub    $0x20,%rsp
  801f6c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801f6f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801f73:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  801f77:	78 06                	js     801f7f <fd_lookup+0x1b>
  801f79:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  801f7d:	7e 07                	jle    801f86 <fd_lookup+0x22>
  801f7f:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801f84:	eb 6c                	jmp    801ff2 <fd_lookup+0x8e>
  801f86:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801f89:	48 98                	cltq   
  801f8b:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801f91:	48 c1 e0 0c          	shl    $0xc,%rax
  801f95:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801f99:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801f9d:	48 c1 e8 15          	shr    $0x15,%rax
  801fa1:	48 89 c2             	mov    %rax,%rdx
  801fa4:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  801fab:	01 00 00 
  801fae:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801fb2:	83 e0 01             	and    $0x1,%eax
  801fb5:	48 85 c0             	test   %rax,%rax
  801fb8:	74 21                	je     801fdb <fd_lookup+0x77>
  801fba:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801fbe:	48 c1 e8 0c          	shr    $0xc,%rax
  801fc2:	48 89 c2             	mov    %rax,%rdx
  801fc5:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801fcc:	01 00 00 
  801fcf:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801fd3:	83 e0 01             	and    $0x1,%eax
  801fd6:	48 85 c0             	test   %rax,%rax
  801fd9:	75 07                	jne    801fe2 <fd_lookup+0x7e>
  801fdb:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801fe0:	eb 10                	jmp    801ff2 <fd_lookup+0x8e>
  801fe2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801fe6:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801fea:	48 89 10             	mov    %rdx,(%rax)
  801fed:	b8 00 00 00 00       	mov    $0x0,%eax
  801ff2:	c9                   	leaveq 
  801ff3:	c3                   	retq   

0000000000801ff4 <fd_close>:
  801ff4:	55                   	push   %rbp
  801ff5:	48 89 e5             	mov    %rsp,%rbp
  801ff8:	48 83 ec 30          	sub    $0x30,%rsp
  801ffc:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802000:	89 f0                	mov    %esi,%eax
  802002:	88 45 d4             	mov    %al,-0x2c(%rbp)
  802005:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802009:	48 89 c7             	mov    %rax,%rdi
  80200c:	48 b8 7e 1e 80 00 00 	movabs $0x801e7e,%rax
  802013:	00 00 00 
  802016:	ff d0                	callq  *%rax
  802018:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80201c:	48 89 d6             	mov    %rdx,%rsi
  80201f:	89 c7                	mov    %eax,%edi
  802021:	48 b8 64 1f 80 00 00 	movabs $0x801f64,%rax
  802028:	00 00 00 
  80202b:	ff d0                	callq  *%rax
  80202d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802030:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802034:	78 0a                	js     802040 <fd_close+0x4c>
  802036:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80203a:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  80203e:	74 12                	je     802052 <fd_close+0x5e>
  802040:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  802044:	74 05                	je     80204b <fd_close+0x57>
  802046:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802049:	eb 05                	jmp    802050 <fd_close+0x5c>
  80204b:	b8 00 00 00 00       	mov    $0x0,%eax
  802050:	eb 69                	jmp    8020bb <fd_close+0xc7>
  802052:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802056:	8b 00                	mov    (%rax),%eax
  802058:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80205c:	48 89 d6             	mov    %rdx,%rsi
  80205f:	89 c7                	mov    %eax,%edi
  802061:	48 b8 bd 20 80 00 00 	movabs $0x8020bd,%rax
  802068:	00 00 00 
  80206b:	ff d0                	callq  *%rax
  80206d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802070:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802074:	78 2a                	js     8020a0 <fd_close+0xac>
  802076:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80207a:	48 8b 40 20          	mov    0x20(%rax),%rax
  80207e:	48 85 c0             	test   %rax,%rax
  802081:	74 16                	je     802099 <fd_close+0xa5>
  802083:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802087:	48 8b 40 20          	mov    0x20(%rax),%rax
  80208b:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80208f:	48 89 d7             	mov    %rdx,%rdi
  802092:	ff d0                	callq  *%rax
  802094:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802097:	eb 07                	jmp    8020a0 <fd_close+0xac>
  802099:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8020a0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8020a4:	48 89 c6             	mov    %rax,%rsi
  8020a7:	bf 00 00 00 00       	mov    $0x0,%edi
  8020ac:	48 b8 4b 1a 80 00 00 	movabs $0x801a4b,%rax
  8020b3:	00 00 00 
  8020b6:	ff d0                	callq  *%rax
  8020b8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8020bb:	c9                   	leaveq 
  8020bc:	c3                   	retq   

00000000008020bd <dev_lookup>:
  8020bd:	55                   	push   %rbp
  8020be:	48 89 e5             	mov    %rsp,%rbp
  8020c1:	48 83 ec 20          	sub    $0x20,%rsp
  8020c5:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8020c8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8020cc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8020d3:	eb 41                	jmp    802116 <dev_lookup+0x59>
  8020d5:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  8020dc:	00 00 00 
  8020df:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8020e2:	48 63 d2             	movslq %edx,%rdx
  8020e5:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8020e9:	8b 00                	mov    (%rax),%eax
  8020eb:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  8020ee:	75 22                	jne    802112 <dev_lookup+0x55>
  8020f0:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  8020f7:	00 00 00 
  8020fa:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8020fd:	48 63 d2             	movslq %edx,%rdx
  802100:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  802104:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802108:	48 89 10             	mov    %rdx,(%rax)
  80210b:	b8 00 00 00 00       	mov    $0x0,%eax
  802110:	eb 60                	jmp    802172 <dev_lookup+0xb5>
  802112:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802116:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  80211d:	00 00 00 
  802120:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802123:	48 63 d2             	movslq %edx,%rdx
  802126:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80212a:	48 85 c0             	test   %rax,%rax
  80212d:	75 a6                	jne    8020d5 <dev_lookup+0x18>
  80212f:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  802136:	00 00 00 
  802139:	48 8b 00             	mov    (%rax),%rax
  80213c:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802142:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802145:	89 c6                	mov    %eax,%esi
  802147:	48 bf 98 49 80 00 00 	movabs $0x804998,%rdi
  80214e:	00 00 00 
  802151:	b8 00 00 00 00       	mov    $0x0,%eax
  802156:	48 b9 bc 04 80 00 00 	movabs $0x8004bc,%rcx
  80215d:	00 00 00 
  802160:	ff d1                	callq  *%rcx
  802162:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802166:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  80216d:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802172:	c9                   	leaveq 
  802173:	c3                   	retq   

0000000000802174 <close>:
  802174:	55                   	push   %rbp
  802175:	48 89 e5             	mov    %rsp,%rbp
  802178:	48 83 ec 20          	sub    $0x20,%rsp
  80217c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80217f:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802183:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802186:	48 89 d6             	mov    %rdx,%rsi
  802189:	89 c7                	mov    %eax,%edi
  80218b:	48 b8 64 1f 80 00 00 	movabs $0x801f64,%rax
  802192:	00 00 00 
  802195:	ff d0                	callq  *%rax
  802197:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80219a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80219e:	79 05                	jns    8021a5 <close+0x31>
  8021a0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8021a3:	eb 18                	jmp    8021bd <close+0x49>
  8021a5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8021a9:	be 01 00 00 00       	mov    $0x1,%esi
  8021ae:	48 89 c7             	mov    %rax,%rdi
  8021b1:	48 b8 f4 1f 80 00 00 	movabs $0x801ff4,%rax
  8021b8:	00 00 00 
  8021bb:	ff d0                	callq  *%rax
  8021bd:	c9                   	leaveq 
  8021be:	c3                   	retq   

00000000008021bf <close_all>:
  8021bf:	55                   	push   %rbp
  8021c0:	48 89 e5             	mov    %rsp,%rbp
  8021c3:	48 83 ec 10          	sub    $0x10,%rsp
  8021c7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8021ce:	eb 15                	jmp    8021e5 <close_all+0x26>
  8021d0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8021d3:	89 c7                	mov    %eax,%edi
  8021d5:	48 b8 74 21 80 00 00 	movabs $0x802174,%rax
  8021dc:	00 00 00 
  8021df:	ff d0                	callq  *%rax
  8021e1:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8021e5:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  8021e9:	7e e5                	jle    8021d0 <close_all+0x11>
  8021eb:	c9                   	leaveq 
  8021ec:	c3                   	retq   

00000000008021ed <dup>:
  8021ed:	55                   	push   %rbp
  8021ee:	48 89 e5             	mov    %rsp,%rbp
  8021f1:	48 83 ec 40          	sub    $0x40,%rsp
  8021f5:	89 7d cc             	mov    %edi,-0x34(%rbp)
  8021f8:	89 75 c8             	mov    %esi,-0x38(%rbp)
  8021fb:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  8021ff:	8b 45 cc             	mov    -0x34(%rbp),%eax
  802202:	48 89 d6             	mov    %rdx,%rsi
  802205:	89 c7                	mov    %eax,%edi
  802207:	48 b8 64 1f 80 00 00 	movabs $0x801f64,%rax
  80220e:	00 00 00 
  802211:	ff d0                	callq  *%rax
  802213:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802216:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80221a:	79 08                	jns    802224 <dup+0x37>
  80221c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80221f:	e9 70 01 00 00       	jmpq   802394 <dup+0x1a7>
  802224:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802227:	89 c7                	mov    %eax,%edi
  802229:	48 b8 74 21 80 00 00 	movabs $0x802174,%rax
  802230:	00 00 00 
  802233:	ff d0                	callq  *%rax
  802235:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802238:	48 98                	cltq   
  80223a:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802240:	48 c1 e0 0c          	shl    $0xc,%rax
  802244:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802248:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80224c:	48 89 c7             	mov    %rax,%rdi
  80224f:	48 b8 a1 1e 80 00 00 	movabs $0x801ea1,%rax
  802256:	00 00 00 
  802259:	ff d0                	callq  *%rax
  80225b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80225f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802263:	48 89 c7             	mov    %rax,%rdi
  802266:	48 b8 a1 1e 80 00 00 	movabs $0x801ea1,%rax
  80226d:	00 00 00 
  802270:	ff d0                	callq  *%rax
  802272:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802276:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80227a:	48 c1 e8 15          	shr    $0x15,%rax
  80227e:	48 89 c2             	mov    %rax,%rdx
  802281:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802288:	01 00 00 
  80228b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80228f:	83 e0 01             	and    $0x1,%eax
  802292:	48 85 c0             	test   %rax,%rax
  802295:	74 73                	je     80230a <dup+0x11d>
  802297:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80229b:	48 c1 e8 0c          	shr    $0xc,%rax
  80229f:	48 89 c2             	mov    %rax,%rdx
  8022a2:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8022a9:	01 00 00 
  8022ac:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8022b0:	83 e0 01             	and    $0x1,%eax
  8022b3:	48 85 c0             	test   %rax,%rax
  8022b6:	74 52                	je     80230a <dup+0x11d>
  8022b8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8022bc:	48 c1 e8 0c          	shr    $0xc,%rax
  8022c0:	48 89 c2             	mov    %rax,%rdx
  8022c3:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8022ca:	01 00 00 
  8022cd:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8022d1:	25 07 0e 00 00       	and    $0xe07,%eax
  8022d6:	89 c1                	mov    %eax,%ecx
  8022d8:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8022dc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8022e0:	41 89 c8             	mov    %ecx,%r8d
  8022e3:	48 89 d1             	mov    %rdx,%rcx
  8022e6:	ba 00 00 00 00       	mov    $0x0,%edx
  8022eb:	48 89 c6             	mov    %rax,%rsi
  8022ee:	bf 00 00 00 00       	mov    $0x0,%edi
  8022f3:	48 b8 f0 19 80 00 00 	movabs $0x8019f0,%rax
  8022fa:	00 00 00 
  8022fd:	ff d0                	callq  *%rax
  8022ff:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802302:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802306:	79 02                	jns    80230a <dup+0x11d>
  802308:	eb 57                	jmp    802361 <dup+0x174>
  80230a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80230e:	48 c1 e8 0c          	shr    $0xc,%rax
  802312:	48 89 c2             	mov    %rax,%rdx
  802315:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80231c:	01 00 00 
  80231f:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802323:	25 07 0e 00 00       	and    $0xe07,%eax
  802328:	89 c1                	mov    %eax,%ecx
  80232a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80232e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802332:	41 89 c8             	mov    %ecx,%r8d
  802335:	48 89 d1             	mov    %rdx,%rcx
  802338:	ba 00 00 00 00       	mov    $0x0,%edx
  80233d:	48 89 c6             	mov    %rax,%rsi
  802340:	bf 00 00 00 00       	mov    $0x0,%edi
  802345:	48 b8 f0 19 80 00 00 	movabs $0x8019f0,%rax
  80234c:	00 00 00 
  80234f:	ff d0                	callq  *%rax
  802351:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802354:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802358:	79 02                	jns    80235c <dup+0x16f>
  80235a:	eb 05                	jmp    802361 <dup+0x174>
  80235c:	8b 45 c8             	mov    -0x38(%rbp),%eax
  80235f:	eb 33                	jmp    802394 <dup+0x1a7>
  802361:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802365:	48 89 c6             	mov    %rax,%rsi
  802368:	bf 00 00 00 00       	mov    $0x0,%edi
  80236d:	48 b8 4b 1a 80 00 00 	movabs $0x801a4b,%rax
  802374:	00 00 00 
  802377:	ff d0                	callq  *%rax
  802379:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80237d:	48 89 c6             	mov    %rax,%rsi
  802380:	bf 00 00 00 00       	mov    $0x0,%edi
  802385:	48 b8 4b 1a 80 00 00 	movabs $0x801a4b,%rax
  80238c:	00 00 00 
  80238f:	ff d0                	callq  *%rax
  802391:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802394:	c9                   	leaveq 
  802395:	c3                   	retq   

0000000000802396 <read>:
  802396:	55                   	push   %rbp
  802397:	48 89 e5             	mov    %rsp,%rbp
  80239a:	48 83 ec 40          	sub    $0x40,%rsp
  80239e:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8023a1:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8023a5:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8023a9:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8023ad:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8023b0:	48 89 d6             	mov    %rdx,%rsi
  8023b3:	89 c7                	mov    %eax,%edi
  8023b5:	48 b8 64 1f 80 00 00 	movabs $0x801f64,%rax
  8023bc:	00 00 00 
  8023bf:	ff d0                	callq  *%rax
  8023c1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8023c4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8023c8:	78 24                	js     8023ee <read+0x58>
  8023ca:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8023ce:	8b 00                	mov    (%rax),%eax
  8023d0:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8023d4:	48 89 d6             	mov    %rdx,%rsi
  8023d7:	89 c7                	mov    %eax,%edi
  8023d9:	48 b8 bd 20 80 00 00 	movabs $0x8020bd,%rax
  8023e0:	00 00 00 
  8023e3:	ff d0                	callq  *%rax
  8023e5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8023e8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8023ec:	79 05                	jns    8023f3 <read+0x5d>
  8023ee:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023f1:	eb 76                	jmp    802469 <read+0xd3>
  8023f3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8023f7:	8b 40 08             	mov    0x8(%rax),%eax
  8023fa:	83 e0 03             	and    $0x3,%eax
  8023fd:	83 f8 01             	cmp    $0x1,%eax
  802400:	75 3a                	jne    80243c <read+0xa6>
  802402:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  802409:	00 00 00 
  80240c:	48 8b 00             	mov    (%rax),%rax
  80240f:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802415:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802418:	89 c6                	mov    %eax,%esi
  80241a:	48 bf b7 49 80 00 00 	movabs $0x8049b7,%rdi
  802421:	00 00 00 
  802424:	b8 00 00 00 00       	mov    $0x0,%eax
  802429:	48 b9 bc 04 80 00 00 	movabs $0x8004bc,%rcx
  802430:	00 00 00 
  802433:	ff d1                	callq  *%rcx
  802435:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80243a:	eb 2d                	jmp    802469 <read+0xd3>
  80243c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802440:	48 8b 40 10          	mov    0x10(%rax),%rax
  802444:	48 85 c0             	test   %rax,%rax
  802447:	75 07                	jne    802450 <read+0xba>
  802449:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80244e:	eb 19                	jmp    802469 <read+0xd3>
  802450:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802454:	48 8b 40 10          	mov    0x10(%rax),%rax
  802458:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80245c:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802460:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802464:	48 89 cf             	mov    %rcx,%rdi
  802467:	ff d0                	callq  *%rax
  802469:	c9                   	leaveq 
  80246a:	c3                   	retq   

000000000080246b <readn>:
  80246b:	55                   	push   %rbp
  80246c:	48 89 e5             	mov    %rsp,%rbp
  80246f:	48 83 ec 30          	sub    $0x30,%rsp
  802473:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802476:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80247a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80247e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802485:	eb 49                	jmp    8024d0 <readn+0x65>
  802487:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80248a:	48 98                	cltq   
  80248c:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802490:	48 29 c2             	sub    %rax,%rdx
  802493:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802496:	48 63 c8             	movslq %eax,%rcx
  802499:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80249d:	48 01 c1             	add    %rax,%rcx
  8024a0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8024a3:	48 89 ce             	mov    %rcx,%rsi
  8024a6:	89 c7                	mov    %eax,%edi
  8024a8:	48 b8 96 23 80 00 00 	movabs $0x802396,%rax
  8024af:	00 00 00 
  8024b2:	ff d0                	callq  *%rax
  8024b4:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8024b7:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8024bb:	79 05                	jns    8024c2 <readn+0x57>
  8024bd:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8024c0:	eb 1c                	jmp    8024de <readn+0x73>
  8024c2:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8024c6:	75 02                	jne    8024ca <readn+0x5f>
  8024c8:	eb 11                	jmp    8024db <readn+0x70>
  8024ca:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8024cd:	01 45 fc             	add    %eax,-0x4(%rbp)
  8024d0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024d3:	48 98                	cltq   
  8024d5:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8024d9:	72 ac                	jb     802487 <readn+0x1c>
  8024db:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024de:	c9                   	leaveq 
  8024df:	c3                   	retq   

00000000008024e0 <write>:
  8024e0:	55                   	push   %rbp
  8024e1:	48 89 e5             	mov    %rsp,%rbp
  8024e4:	48 83 ec 40          	sub    $0x40,%rsp
  8024e8:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8024eb:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8024ef:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8024f3:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8024f7:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8024fa:	48 89 d6             	mov    %rdx,%rsi
  8024fd:	89 c7                	mov    %eax,%edi
  8024ff:	48 b8 64 1f 80 00 00 	movabs $0x801f64,%rax
  802506:	00 00 00 
  802509:	ff d0                	callq  *%rax
  80250b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80250e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802512:	78 24                	js     802538 <write+0x58>
  802514:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802518:	8b 00                	mov    (%rax),%eax
  80251a:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80251e:	48 89 d6             	mov    %rdx,%rsi
  802521:	89 c7                	mov    %eax,%edi
  802523:	48 b8 bd 20 80 00 00 	movabs $0x8020bd,%rax
  80252a:	00 00 00 
  80252d:	ff d0                	callq  *%rax
  80252f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802532:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802536:	79 05                	jns    80253d <write+0x5d>
  802538:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80253b:	eb 75                	jmp    8025b2 <write+0xd2>
  80253d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802541:	8b 40 08             	mov    0x8(%rax),%eax
  802544:	83 e0 03             	and    $0x3,%eax
  802547:	85 c0                	test   %eax,%eax
  802549:	75 3a                	jne    802585 <write+0xa5>
  80254b:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  802552:	00 00 00 
  802555:	48 8b 00             	mov    (%rax),%rax
  802558:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80255e:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802561:	89 c6                	mov    %eax,%esi
  802563:	48 bf d3 49 80 00 00 	movabs $0x8049d3,%rdi
  80256a:	00 00 00 
  80256d:	b8 00 00 00 00       	mov    $0x0,%eax
  802572:	48 b9 bc 04 80 00 00 	movabs $0x8004bc,%rcx
  802579:	00 00 00 
  80257c:	ff d1                	callq  *%rcx
  80257e:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802583:	eb 2d                	jmp    8025b2 <write+0xd2>
  802585:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802589:	48 8b 40 18          	mov    0x18(%rax),%rax
  80258d:	48 85 c0             	test   %rax,%rax
  802590:	75 07                	jne    802599 <write+0xb9>
  802592:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802597:	eb 19                	jmp    8025b2 <write+0xd2>
  802599:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80259d:	48 8b 40 18          	mov    0x18(%rax),%rax
  8025a1:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8025a5:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8025a9:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  8025ad:	48 89 cf             	mov    %rcx,%rdi
  8025b0:	ff d0                	callq  *%rax
  8025b2:	c9                   	leaveq 
  8025b3:	c3                   	retq   

00000000008025b4 <seek>:
  8025b4:	55                   	push   %rbp
  8025b5:	48 89 e5             	mov    %rsp,%rbp
  8025b8:	48 83 ec 18          	sub    $0x18,%rsp
  8025bc:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8025bf:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8025c2:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8025c6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8025c9:	48 89 d6             	mov    %rdx,%rsi
  8025cc:	89 c7                	mov    %eax,%edi
  8025ce:	48 b8 64 1f 80 00 00 	movabs $0x801f64,%rax
  8025d5:	00 00 00 
  8025d8:	ff d0                	callq  *%rax
  8025da:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8025dd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8025e1:	79 05                	jns    8025e8 <seek+0x34>
  8025e3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8025e6:	eb 0f                	jmp    8025f7 <seek+0x43>
  8025e8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8025ec:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8025ef:	89 50 04             	mov    %edx,0x4(%rax)
  8025f2:	b8 00 00 00 00       	mov    $0x0,%eax
  8025f7:	c9                   	leaveq 
  8025f8:	c3                   	retq   

00000000008025f9 <ftruncate>:
  8025f9:	55                   	push   %rbp
  8025fa:	48 89 e5             	mov    %rsp,%rbp
  8025fd:	48 83 ec 30          	sub    $0x30,%rsp
  802601:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802604:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802607:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80260b:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80260e:	48 89 d6             	mov    %rdx,%rsi
  802611:	89 c7                	mov    %eax,%edi
  802613:	48 b8 64 1f 80 00 00 	movabs $0x801f64,%rax
  80261a:	00 00 00 
  80261d:	ff d0                	callq  *%rax
  80261f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802622:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802626:	78 24                	js     80264c <ftruncate+0x53>
  802628:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80262c:	8b 00                	mov    (%rax),%eax
  80262e:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802632:	48 89 d6             	mov    %rdx,%rsi
  802635:	89 c7                	mov    %eax,%edi
  802637:	48 b8 bd 20 80 00 00 	movabs $0x8020bd,%rax
  80263e:	00 00 00 
  802641:	ff d0                	callq  *%rax
  802643:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802646:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80264a:	79 05                	jns    802651 <ftruncate+0x58>
  80264c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80264f:	eb 72                	jmp    8026c3 <ftruncate+0xca>
  802651:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802655:	8b 40 08             	mov    0x8(%rax),%eax
  802658:	83 e0 03             	and    $0x3,%eax
  80265b:	85 c0                	test   %eax,%eax
  80265d:	75 3a                	jne    802699 <ftruncate+0xa0>
  80265f:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  802666:	00 00 00 
  802669:	48 8b 00             	mov    (%rax),%rax
  80266c:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802672:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802675:	89 c6                	mov    %eax,%esi
  802677:	48 bf f0 49 80 00 00 	movabs $0x8049f0,%rdi
  80267e:	00 00 00 
  802681:	b8 00 00 00 00       	mov    $0x0,%eax
  802686:	48 b9 bc 04 80 00 00 	movabs $0x8004bc,%rcx
  80268d:	00 00 00 
  802690:	ff d1                	callq  *%rcx
  802692:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802697:	eb 2a                	jmp    8026c3 <ftruncate+0xca>
  802699:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80269d:	48 8b 40 30          	mov    0x30(%rax),%rax
  8026a1:	48 85 c0             	test   %rax,%rax
  8026a4:	75 07                	jne    8026ad <ftruncate+0xb4>
  8026a6:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8026ab:	eb 16                	jmp    8026c3 <ftruncate+0xca>
  8026ad:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8026b1:	48 8b 40 30          	mov    0x30(%rax),%rax
  8026b5:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8026b9:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  8026bc:	89 ce                	mov    %ecx,%esi
  8026be:	48 89 d7             	mov    %rdx,%rdi
  8026c1:	ff d0                	callq  *%rax
  8026c3:	c9                   	leaveq 
  8026c4:	c3                   	retq   

00000000008026c5 <fstat>:
  8026c5:	55                   	push   %rbp
  8026c6:	48 89 e5             	mov    %rsp,%rbp
  8026c9:	48 83 ec 30          	sub    $0x30,%rsp
  8026cd:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8026d0:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8026d4:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8026d8:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8026db:	48 89 d6             	mov    %rdx,%rsi
  8026de:	89 c7                	mov    %eax,%edi
  8026e0:	48 b8 64 1f 80 00 00 	movabs $0x801f64,%rax
  8026e7:	00 00 00 
  8026ea:	ff d0                	callq  *%rax
  8026ec:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8026ef:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8026f3:	78 24                	js     802719 <fstat+0x54>
  8026f5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8026f9:	8b 00                	mov    (%rax),%eax
  8026fb:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8026ff:	48 89 d6             	mov    %rdx,%rsi
  802702:	89 c7                	mov    %eax,%edi
  802704:	48 b8 bd 20 80 00 00 	movabs $0x8020bd,%rax
  80270b:	00 00 00 
  80270e:	ff d0                	callq  *%rax
  802710:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802713:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802717:	79 05                	jns    80271e <fstat+0x59>
  802719:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80271c:	eb 5e                	jmp    80277c <fstat+0xb7>
  80271e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802722:	48 8b 40 28          	mov    0x28(%rax),%rax
  802726:	48 85 c0             	test   %rax,%rax
  802729:	75 07                	jne    802732 <fstat+0x6d>
  80272b:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802730:	eb 4a                	jmp    80277c <fstat+0xb7>
  802732:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802736:	c6 00 00             	movb   $0x0,(%rax)
  802739:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80273d:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  802744:	00 00 00 
  802747:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80274b:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  802752:	00 00 00 
  802755:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802759:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80275d:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  802764:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802768:	48 8b 40 28          	mov    0x28(%rax),%rax
  80276c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802770:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  802774:	48 89 ce             	mov    %rcx,%rsi
  802777:	48 89 d7             	mov    %rdx,%rdi
  80277a:	ff d0                	callq  *%rax
  80277c:	c9                   	leaveq 
  80277d:	c3                   	retq   

000000000080277e <stat>:
  80277e:	55                   	push   %rbp
  80277f:	48 89 e5             	mov    %rsp,%rbp
  802782:	48 83 ec 20          	sub    $0x20,%rsp
  802786:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80278a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80278e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802792:	be 00 00 00 00       	mov    $0x0,%esi
  802797:	48 89 c7             	mov    %rax,%rdi
  80279a:	48 b8 6c 28 80 00 00 	movabs $0x80286c,%rax
  8027a1:	00 00 00 
  8027a4:	ff d0                	callq  *%rax
  8027a6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8027a9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8027ad:	79 05                	jns    8027b4 <stat+0x36>
  8027af:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8027b2:	eb 2f                	jmp    8027e3 <stat+0x65>
  8027b4:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8027b8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8027bb:	48 89 d6             	mov    %rdx,%rsi
  8027be:	89 c7                	mov    %eax,%edi
  8027c0:	48 b8 c5 26 80 00 00 	movabs $0x8026c5,%rax
  8027c7:	00 00 00 
  8027ca:	ff d0                	callq  *%rax
  8027cc:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8027cf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8027d2:	89 c7                	mov    %eax,%edi
  8027d4:	48 b8 74 21 80 00 00 	movabs $0x802174,%rax
  8027db:	00 00 00 
  8027de:	ff d0                	callq  *%rax
  8027e0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8027e3:	c9                   	leaveq 
  8027e4:	c3                   	retq   

00000000008027e5 <fsipc>:
  8027e5:	55                   	push   %rbp
  8027e6:	48 89 e5             	mov    %rsp,%rbp
  8027e9:	48 83 ec 10          	sub    $0x10,%rsp
  8027ed:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8027f0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8027f4:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8027fb:	00 00 00 
  8027fe:	8b 00                	mov    (%rax),%eax
  802800:	85 c0                	test   %eax,%eax
  802802:	75 1d                	jne    802821 <fsipc+0x3c>
  802804:	bf 01 00 00 00       	mov    $0x1,%edi
  802809:	48 b8 31 42 80 00 00 	movabs $0x804231,%rax
  802810:	00 00 00 
  802813:	ff d0                	callq  *%rax
  802815:	48 ba 00 70 80 00 00 	movabs $0x807000,%rdx
  80281c:	00 00 00 
  80281f:	89 02                	mov    %eax,(%rdx)
  802821:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  802828:	00 00 00 
  80282b:	8b 00                	mov    (%rax),%eax
  80282d:	8b 75 fc             	mov    -0x4(%rbp),%esi
  802830:	b9 07 00 00 00       	mov    $0x7,%ecx
  802835:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  80283c:	00 00 00 
  80283f:	89 c7                	mov    %eax,%edi
  802841:	48 b8 9b 41 80 00 00 	movabs $0x80419b,%rax
  802848:	00 00 00 
  80284b:	ff d0                	callq  *%rax
  80284d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802851:	ba 00 00 00 00       	mov    $0x0,%edx
  802856:	48 89 c6             	mov    %rax,%rsi
  802859:	bf 00 00 00 00       	mov    $0x0,%edi
  80285e:	48 b8 da 40 80 00 00 	movabs $0x8040da,%rax
  802865:	00 00 00 
  802868:	ff d0                	callq  *%rax
  80286a:	c9                   	leaveq 
  80286b:	c3                   	retq   

000000000080286c <open>:
  80286c:	55                   	push   %rbp
  80286d:	48 89 e5             	mov    %rsp,%rbp
  802870:	48 83 ec 20          	sub    $0x20,%rsp
  802874:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802878:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80287b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80287f:	48 89 c7             	mov    %rax,%rdi
  802882:	48 b8 05 10 80 00 00 	movabs $0x801005,%rax
  802889:	00 00 00 
  80288c:	ff d0                	callq  *%rax
  80288e:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802893:	7e 0a                	jle    80289f <open+0x33>
  802895:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  80289a:	e9 a5 00 00 00       	jmpq   802944 <open+0xd8>
  80289f:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8028a3:	48 89 c7             	mov    %rax,%rdi
  8028a6:	48 b8 cc 1e 80 00 00 	movabs $0x801ecc,%rax
  8028ad:	00 00 00 
  8028b0:	ff d0                	callq  *%rax
  8028b2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8028b5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8028b9:	79 08                	jns    8028c3 <open+0x57>
  8028bb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8028be:	e9 81 00 00 00       	jmpq   802944 <open+0xd8>
  8028c3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8028c7:	48 89 c6             	mov    %rax,%rsi
  8028ca:	48 bf 00 80 80 00 00 	movabs $0x808000,%rdi
  8028d1:	00 00 00 
  8028d4:	48 b8 71 10 80 00 00 	movabs $0x801071,%rax
  8028db:	00 00 00 
  8028de:	ff d0                	callq  *%rax
  8028e0:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8028e7:	00 00 00 
  8028ea:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8028ed:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  8028f3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8028f7:	48 89 c6             	mov    %rax,%rsi
  8028fa:	bf 01 00 00 00       	mov    $0x1,%edi
  8028ff:	48 b8 e5 27 80 00 00 	movabs $0x8027e5,%rax
  802906:	00 00 00 
  802909:	ff d0                	callq  *%rax
  80290b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80290e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802912:	79 1d                	jns    802931 <open+0xc5>
  802914:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802918:	be 00 00 00 00       	mov    $0x0,%esi
  80291d:	48 89 c7             	mov    %rax,%rdi
  802920:	48 b8 f4 1f 80 00 00 	movabs $0x801ff4,%rax
  802927:	00 00 00 
  80292a:	ff d0                	callq  *%rax
  80292c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80292f:	eb 13                	jmp    802944 <open+0xd8>
  802931:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802935:	48 89 c7             	mov    %rax,%rdi
  802938:	48 b8 7e 1e 80 00 00 	movabs $0x801e7e,%rax
  80293f:	00 00 00 
  802942:	ff d0                	callq  *%rax
  802944:	c9                   	leaveq 
  802945:	c3                   	retq   

0000000000802946 <devfile_flush>:
  802946:	55                   	push   %rbp
  802947:	48 89 e5             	mov    %rsp,%rbp
  80294a:	48 83 ec 10          	sub    $0x10,%rsp
  80294e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802952:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802956:	8b 50 0c             	mov    0xc(%rax),%edx
  802959:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802960:	00 00 00 
  802963:	89 10                	mov    %edx,(%rax)
  802965:	be 00 00 00 00       	mov    $0x0,%esi
  80296a:	bf 06 00 00 00       	mov    $0x6,%edi
  80296f:	48 b8 e5 27 80 00 00 	movabs $0x8027e5,%rax
  802976:	00 00 00 
  802979:	ff d0                	callq  *%rax
  80297b:	c9                   	leaveq 
  80297c:	c3                   	retq   

000000000080297d <devfile_read>:
  80297d:	55                   	push   %rbp
  80297e:	48 89 e5             	mov    %rsp,%rbp
  802981:	48 83 ec 30          	sub    $0x30,%rsp
  802985:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802989:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80298d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802991:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802995:	8b 50 0c             	mov    0xc(%rax),%edx
  802998:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80299f:	00 00 00 
  8029a2:	89 10                	mov    %edx,(%rax)
  8029a4:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8029ab:	00 00 00 
  8029ae:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8029b2:	48 89 50 08          	mov    %rdx,0x8(%rax)
  8029b6:	be 00 00 00 00       	mov    $0x0,%esi
  8029bb:	bf 03 00 00 00       	mov    $0x3,%edi
  8029c0:	48 b8 e5 27 80 00 00 	movabs $0x8027e5,%rax
  8029c7:	00 00 00 
  8029ca:	ff d0                	callq  *%rax
  8029cc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8029cf:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8029d3:	79 08                	jns    8029dd <devfile_read+0x60>
  8029d5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029d8:	e9 a4 00 00 00       	jmpq   802a81 <devfile_read+0x104>
  8029dd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029e0:	48 98                	cltq   
  8029e2:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8029e6:	76 35                	jbe    802a1d <devfile_read+0xa0>
  8029e8:	48 b9 16 4a 80 00 00 	movabs $0x804a16,%rcx
  8029ef:	00 00 00 
  8029f2:	48 ba 1d 4a 80 00 00 	movabs $0x804a1d,%rdx
  8029f9:	00 00 00 
  8029fc:	be 89 00 00 00       	mov    $0x89,%esi
  802a01:	48 bf 32 4a 80 00 00 	movabs $0x804a32,%rdi
  802a08:	00 00 00 
  802a0b:	b8 00 00 00 00       	mov    $0x0,%eax
  802a10:	49 b8 c6 3f 80 00 00 	movabs $0x803fc6,%r8
  802a17:	00 00 00 
  802a1a:	41 ff d0             	callq  *%r8
  802a1d:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  802a24:	7e 35                	jle    802a5b <devfile_read+0xde>
  802a26:	48 b9 40 4a 80 00 00 	movabs $0x804a40,%rcx
  802a2d:	00 00 00 
  802a30:	48 ba 1d 4a 80 00 00 	movabs $0x804a1d,%rdx
  802a37:	00 00 00 
  802a3a:	be 8a 00 00 00       	mov    $0x8a,%esi
  802a3f:	48 bf 32 4a 80 00 00 	movabs $0x804a32,%rdi
  802a46:	00 00 00 
  802a49:	b8 00 00 00 00       	mov    $0x0,%eax
  802a4e:	49 b8 c6 3f 80 00 00 	movabs $0x803fc6,%r8
  802a55:	00 00 00 
  802a58:	41 ff d0             	callq  *%r8
  802a5b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a5e:	48 63 d0             	movslq %eax,%rdx
  802a61:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802a65:	48 be 00 80 80 00 00 	movabs $0x808000,%rsi
  802a6c:	00 00 00 
  802a6f:	48 89 c7             	mov    %rax,%rdi
  802a72:	48 b8 95 13 80 00 00 	movabs $0x801395,%rax
  802a79:	00 00 00 
  802a7c:	ff d0                	callq  *%rax
  802a7e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a81:	c9                   	leaveq 
  802a82:	c3                   	retq   

0000000000802a83 <devfile_write>:
  802a83:	55                   	push   %rbp
  802a84:	48 89 e5             	mov    %rsp,%rbp
  802a87:	48 83 ec 40          	sub    $0x40,%rsp
  802a8b:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802a8f:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802a93:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802a97:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  802a9b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802a9f:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  802aa6:	00 
  802aa7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802aab:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  802aaf:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  802ab4:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  802ab8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802abc:	8b 50 0c             	mov    0xc(%rax),%edx
  802abf:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802ac6:	00 00 00 
  802ac9:	89 10                	mov    %edx,(%rax)
  802acb:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802ad2:	00 00 00 
  802ad5:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802ad9:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802add:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802ae1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802ae5:	48 89 c6             	mov    %rax,%rsi
  802ae8:	48 bf 10 80 80 00 00 	movabs $0x808010,%rdi
  802aef:	00 00 00 
  802af2:	48 b8 95 13 80 00 00 	movabs $0x801395,%rax
  802af9:	00 00 00 
  802afc:	ff d0                	callq  *%rax
  802afe:	be 00 00 00 00       	mov    $0x0,%esi
  802b03:	bf 04 00 00 00       	mov    $0x4,%edi
  802b08:	48 b8 e5 27 80 00 00 	movabs $0x8027e5,%rax
  802b0f:	00 00 00 
  802b12:	ff d0                	callq  *%rax
  802b14:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802b17:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802b1b:	79 05                	jns    802b22 <devfile_write+0x9f>
  802b1d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802b20:	eb 43                	jmp    802b65 <devfile_write+0xe2>
  802b22:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802b25:	48 98                	cltq   
  802b27:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  802b2b:	76 35                	jbe    802b62 <devfile_write+0xdf>
  802b2d:	48 b9 16 4a 80 00 00 	movabs $0x804a16,%rcx
  802b34:	00 00 00 
  802b37:	48 ba 1d 4a 80 00 00 	movabs $0x804a1d,%rdx
  802b3e:	00 00 00 
  802b41:	be a8 00 00 00       	mov    $0xa8,%esi
  802b46:	48 bf 32 4a 80 00 00 	movabs $0x804a32,%rdi
  802b4d:	00 00 00 
  802b50:	b8 00 00 00 00       	mov    $0x0,%eax
  802b55:	49 b8 c6 3f 80 00 00 	movabs $0x803fc6,%r8
  802b5c:	00 00 00 
  802b5f:	41 ff d0             	callq  *%r8
  802b62:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802b65:	c9                   	leaveq 
  802b66:	c3                   	retq   

0000000000802b67 <devfile_stat>:
  802b67:	55                   	push   %rbp
  802b68:	48 89 e5             	mov    %rsp,%rbp
  802b6b:	48 83 ec 20          	sub    $0x20,%rsp
  802b6f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802b73:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802b77:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b7b:	8b 50 0c             	mov    0xc(%rax),%edx
  802b7e:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802b85:	00 00 00 
  802b88:	89 10                	mov    %edx,(%rax)
  802b8a:	be 00 00 00 00       	mov    $0x0,%esi
  802b8f:	bf 05 00 00 00       	mov    $0x5,%edi
  802b94:	48 b8 e5 27 80 00 00 	movabs $0x8027e5,%rax
  802b9b:	00 00 00 
  802b9e:	ff d0                	callq  *%rax
  802ba0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ba3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ba7:	79 05                	jns    802bae <devfile_stat+0x47>
  802ba9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802bac:	eb 56                	jmp    802c04 <devfile_stat+0x9d>
  802bae:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802bb2:	48 be 00 80 80 00 00 	movabs $0x808000,%rsi
  802bb9:	00 00 00 
  802bbc:	48 89 c7             	mov    %rax,%rdi
  802bbf:	48 b8 71 10 80 00 00 	movabs $0x801071,%rax
  802bc6:	00 00 00 
  802bc9:	ff d0                	callq  *%rax
  802bcb:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802bd2:	00 00 00 
  802bd5:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  802bdb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802bdf:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  802be5:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802bec:	00 00 00 
  802bef:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  802bf5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802bf9:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  802bff:	b8 00 00 00 00       	mov    $0x0,%eax
  802c04:	c9                   	leaveq 
  802c05:	c3                   	retq   

0000000000802c06 <devfile_trunc>:
  802c06:	55                   	push   %rbp
  802c07:	48 89 e5             	mov    %rsp,%rbp
  802c0a:	48 83 ec 10          	sub    $0x10,%rsp
  802c0e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802c12:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802c15:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802c19:	8b 50 0c             	mov    0xc(%rax),%edx
  802c1c:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802c23:	00 00 00 
  802c26:	89 10                	mov    %edx,(%rax)
  802c28:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802c2f:	00 00 00 
  802c32:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802c35:	89 50 04             	mov    %edx,0x4(%rax)
  802c38:	be 00 00 00 00       	mov    $0x0,%esi
  802c3d:	bf 02 00 00 00       	mov    $0x2,%edi
  802c42:	48 b8 e5 27 80 00 00 	movabs $0x8027e5,%rax
  802c49:	00 00 00 
  802c4c:	ff d0                	callq  *%rax
  802c4e:	c9                   	leaveq 
  802c4f:	c3                   	retq   

0000000000802c50 <remove>:
  802c50:	55                   	push   %rbp
  802c51:	48 89 e5             	mov    %rsp,%rbp
  802c54:	48 83 ec 10          	sub    $0x10,%rsp
  802c58:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802c5c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802c60:	48 89 c7             	mov    %rax,%rdi
  802c63:	48 b8 05 10 80 00 00 	movabs $0x801005,%rax
  802c6a:	00 00 00 
  802c6d:	ff d0                	callq  *%rax
  802c6f:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802c74:	7e 07                	jle    802c7d <remove+0x2d>
  802c76:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802c7b:	eb 33                	jmp    802cb0 <remove+0x60>
  802c7d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802c81:	48 89 c6             	mov    %rax,%rsi
  802c84:	48 bf 00 80 80 00 00 	movabs $0x808000,%rdi
  802c8b:	00 00 00 
  802c8e:	48 b8 71 10 80 00 00 	movabs $0x801071,%rax
  802c95:	00 00 00 
  802c98:	ff d0                	callq  *%rax
  802c9a:	be 00 00 00 00       	mov    $0x0,%esi
  802c9f:	bf 07 00 00 00       	mov    $0x7,%edi
  802ca4:	48 b8 e5 27 80 00 00 	movabs $0x8027e5,%rax
  802cab:	00 00 00 
  802cae:	ff d0                	callq  *%rax
  802cb0:	c9                   	leaveq 
  802cb1:	c3                   	retq   

0000000000802cb2 <sync>:
  802cb2:	55                   	push   %rbp
  802cb3:	48 89 e5             	mov    %rsp,%rbp
  802cb6:	be 00 00 00 00       	mov    $0x0,%esi
  802cbb:	bf 08 00 00 00       	mov    $0x8,%edi
  802cc0:	48 b8 e5 27 80 00 00 	movabs $0x8027e5,%rax
  802cc7:	00 00 00 
  802cca:	ff d0                	callq  *%rax
  802ccc:	5d                   	pop    %rbp
  802ccd:	c3                   	retq   

0000000000802cce <copy>:
  802cce:	55                   	push   %rbp
  802ccf:	48 89 e5             	mov    %rsp,%rbp
  802cd2:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  802cd9:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  802ce0:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  802ce7:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  802cee:	be 00 00 00 00       	mov    $0x0,%esi
  802cf3:	48 89 c7             	mov    %rax,%rdi
  802cf6:	48 b8 6c 28 80 00 00 	movabs $0x80286c,%rax
  802cfd:	00 00 00 
  802d00:	ff d0                	callq  *%rax
  802d02:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d05:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d09:	79 28                	jns    802d33 <copy+0x65>
  802d0b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d0e:	89 c6                	mov    %eax,%esi
  802d10:	48 bf 4c 4a 80 00 00 	movabs $0x804a4c,%rdi
  802d17:	00 00 00 
  802d1a:	b8 00 00 00 00       	mov    $0x0,%eax
  802d1f:	48 ba bc 04 80 00 00 	movabs $0x8004bc,%rdx
  802d26:	00 00 00 
  802d29:	ff d2                	callq  *%rdx
  802d2b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d2e:	e9 74 01 00 00       	jmpq   802ea7 <copy+0x1d9>
  802d33:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  802d3a:	be 01 01 00 00       	mov    $0x101,%esi
  802d3f:	48 89 c7             	mov    %rax,%rdi
  802d42:	48 b8 6c 28 80 00 00 	movabs $0x80286c,%rax
  802d49:	00 00 00 
  802d4c:	ff d0                	callq  *%rax
  802d4e:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802d51:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802d55:	79 39                	jns    802d90 <copy+0xc2>
  802d57:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802d5a:	89 c6                	mov    %eax,%esi
  802d5c:	48 bf 62 4a 80 00 00 	movabs $0x804a62,%rdi
  802d63:	00 00 00 
  802d66:	b8 00 00 00 00       	mov    $0x0,%eax
  802d6b:	48 ba bc 04 80 00 00 	movabs $0x8004bc,%rdx
  802d72:	00 00 00 
  802d75:	ff d2                	callq  *%rdx
  802d77:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d7a:	89 c7                	mov    %eax,%edi
  802d7c:	48 b8 74 21 80 00 00 	movabs $0x802174,%rax
  802d83:	00 00 00 
  802d86:	ff d0                	callq  *%rax
  802d88:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802d8b:	e9 17 01 00 00       	jmpq   802ea7 <copy+0x1d9>
  802d90:	eb 74                	jmp    802e06 <copy+0x138>
  802d92:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802d95:	48 63 d0             	movslq %eax,%rdx
  802d98:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802d9f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802da2:	48 89 ce             	mov    %rcx,%rsi
  802da5:	89 c7                	mov    %eax,%edi
  802da7:	48 b8 e0 24 80 00 00 	movabs $0x8024e0,%rax
  802dae:	00 00 00 
  802db1:	ff d0                	callq  *%rax
  802db3:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802db6:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802dba:	79 4a                	jns    802e06 <copy+0x138>
  802dbc:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802dbf:	89 c6                	mov    %eax,%esi
  802dc1:	48 bf 7c 4a 80 00 00 	movabs $0x804a7c,%rdi
  802dc8:	00 00 00 
  802dcb:	b8 00 00 00 00       	mov    $0x0,%eax
  802dd0:	48 ba bc 04 80 00 00 	movabs $0x8004bc,%rdx
  802dd7:	00 00 00 
  802dda:	ff d2                	callq  *%rdx
  802ddc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ddf:	89 c7                	mov    %eax,%edi
  802de1:	48 b8 74 21 80 00 00 	movabs $0x802174,%rax
  802de8:	00 00 00 
  802deb:	ff d0                	callq  *%rax
  802ded:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802df0:	89 c7                	mov    %eax,%edi
  802df2:	48 b8 74 21 80 00 00 	movabs $0x802174,%rax
  802df9:	00 00 00 
  802dfc:	ff d0                	callq  *%rax
  802dfe:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802e01:	e9 a1 00 00 00       	jmpq   802ea7 <copy+0x1d9>
  802e06:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802e0d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e10:	ba 00 02 00 00       	mov    $0x200,%edx
  802e15:	48 89 ce             	mov    %rcx,%rsi
  802e18:	89 c7                	mov    %eax,%edi
  802e1a:	48 b8 96 23 80 00 00 	movabs $0x802396,%rax
  802e21:	00 00 00 
  802e24:	ff d0                	callq  *%rax
  802e26:	89 45 f4             	mov    %eax,-0xc(%rbp)
  802e29:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802e2d:	0f 8f 5f ff ff ff    	jg     802d92 <copy+0xc4>
  802e33:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802e37:	79 47                	jns    802e80 <copy+0x1b2>
  802e39:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802e3c:	89 c6                	mov    %eax,%esi
  802e3e:	48 bf 8f 4a 80 00 00 	movabs $0x804a8f,%rdi
  802e45:	00 00 00 
  802e48:	b8 00 00 00 00       	mov    $0x0,%eax
  802e4d:	48 ba bc 04 80 00 00 	movabs $0x8004bc,%rdx
  802e54:	00 00 00 
  802e57:	ff d2                	callq  *%rdx
  802e59:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e5c:	89 c7                	mov    %eax,%edi
  802e5e:	48 b8 74 21 80 00 00 	movabs $0x802174,%rax
  802e65:	00 00 00 
  802e68:	ff d0                	callq  *%rax
  802e6a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802e6d:	89 c7                	mov    %eax,%edi
  802e6f:	48 b8 74 21 80 00 00 	movabs $0x802174,%rax
  802e76:	00 00 00 
  802e79:	ff d0                	callq  *%rax
  802e7b:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802e7e:	eb 27                	jmp    802ea7 <copy+0x1d9>
  802e80:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e83:	89 c7                	mov    %eax,%edi
  802e85:	48 b8 74 21 80 00 00 	movabs $0x802174,%rax
  802e8c:	00 00 00 
  802e8f:	ff d0                	callq  *%rax
  802e91:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802e94:	89 c7                	mov    %eax,%edi
  802e96:	48 b8 74 21 80 00 00 	movabs $0x802174,%rax
  802e9d:	00 00 00 
  802ea0:	ff d0                	callq  *%rax
  802ea2:	b8 00 00 00 00       	mov    $0x0,%eax
  802ea7:	c9                   	leaveq 
  802ea8:	c3                   	retq   

0000000000802ea9 <fd2sockid>:
  802ea9:	55                   	push   %rbp
  802eaa:	48 89 e5             	mov    %rsp,%rbp
  802ead:	48 83 ec 20          	sub    $0x20,%rsp
  802eb1:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802eb4:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802eb8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802ebb:	48 89 d6             	mov    %rdx,%rsi
  802ebe:	89 c7                	mov    %eax,%edi
  802ec0:	48 b8 64 1f 80 00 00 	movabs $0x801f64,%rax
  802ec7:	00 00 00 
  802eca:	ff d0                	callq  *%rax
  802ecc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ecf:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ed3:	79 05                	jns    802eda <fd2sockid+0x31>
  802ed5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ed8:	eb 24                	jmp    802efe <fd2sockid+0x55>
  802eda:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ede:	8b 10                	mov    (%rax),%edx
  802ee0:	48 b8 a0 60 80 00 00 	movabs $0x8060a0,%rax
  802ee7:	00 00 00 
  802eea:	8b 00                	mov    (%rax),%eax
  802eec:	39 c2                	cmp    %eax,%edx
  802eee:	74 07                	je     802ef7 <fd2sockid+0x4e>
  802ef0:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802ef5:	eb 07                	jmp    802efe <fd2sockid+0x55>
  802ef7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802efb:	8b 40 0c             	mov    0xc(%rax),%eax
  802efe:	c9                   	leaveq 
  802eff:	c3                   	retq   

0000000000802f00 <alloc_sockfd>:
  802f00:	55                   	push   %rbp
  802f01:	48 89 e5             	mov    %rsp,%rbp
  802f04:	48 83 ec 20          	sub    $0x20,%rsp
  802f08:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802f0b:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802f0f:	48 89 c7             	mov    %rax,%rdi
  802f12:	48 b8 cc 1e 80 00 00 	movabs $0x801ecc,%rax
  802f19:	00 00 00 
  802f1c:	ff d0                	callq  *%rax
  802f1e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f21:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f25:	78 26                	js     802f4d <alloc_sockfd+0x4d>
  802f27:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f2b:	ba 07 04 00 00       	mov    $0x407,%edx
  802f30:	48 89 c6             	mov    %rax,%rsi
  802f33:	bf 00 00 00 00       	mov    $0x0,%edi
  802f38:	48 b8 a0 19 80 00 00 	movabs $0x8019a0,%rax
  802f3f:	00 00 00 
  802f42:	ff d0                	callq  *%rax
  802f44:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f47:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f4b:	79 16                	jns    802f63 <alloc_sockfd+0x63>
  802f4d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802f50:	89 c7                	mov    %eax,%edi
  802f52:	48 b8 0d 34 80 00 00 	movabs $0x80340d,%rax
  802f59:	00 00 00 
  802f5c:	ff d0                	callq  *%rax
  802f5e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f61:	eb 3a                	jmp    802f9d <alloc_sockfd+0x9d>
  802f63:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f67:	48 ba a0 60 80 00 00 	movabs $0x8060a0,%rdx
  802f6e:	00 00 00 
  802f71:	8b 12                	mov    (%rdx),%edx
  802f73:	89 10                	mov    %edx,(%rax)
  802f75:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f79:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  802f80:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f84:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802f87:	89 50 0c             	mov    %edx,0xc(%rax)
  802f8a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f8e:	48 89 c7             	mov    %rax,%rdi
  802f91:	48 b8 7e 1e 80 00 00 	movabs $0x801e7e,%rax
  802f98:	00 00 00 
  802f9b:	ff d0                	callq  *%rax
  802f9d:	c9                   	leaveq 
  802f9e:	c3                   	retq   

0000000000802f9f <accept>:
  802f9f:	55                   	push   %rbp
  802fa0:	48 89 e5             	mov    %rsp,%rbp
  802fa3:	48 83 ec 30          	sub    $0x30,%rsp
  802fa7:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802faa:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802fae:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802fb2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802fb5:	89 c7                	mov    %eax,%edi
  802fb7:	48 b8 a9 2e 80 00 00 	movabs $0x802ea9,%rax
  802fbe:	00 00 00 
  802fc1:	ff d0                	callq  *%rax
  802fc3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802fc6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802fca:	79 05                	jns    802fd1 <accept+0x32>
  802fcc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802fcf:	eb 3b                	jmp    80300c <accept+0x6d>
  802fd1:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802fd5:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  802fd9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802fdc:	48 89 ce             	mov    %rcx,%rsi
  802fdf:	89 c7                	mov    %eax,%edi
  802fe1:	48 b8 ea 32 80 00 00 	movabs $0x8032ea,%rax
  802fe8:	00 00 00 
  802feb:	ff d0                	callq  *%rax
  802fed:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ff0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ff4:	79 05                	jns    802ffb <accept+0x5c>
  802ff6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ff9:	eb 11                	jmp    80300c <accept+0x6d>
  802ffb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ffe:	89 c7                	mov    %eax,%edi
  803000:	48 b8 00 2f 80 00 00 	movabs $0x802f00,%rax
  803007:	00 00 00 
  80300a:	ff d0                	callq  *%rax
  80300c:	c9                   	leaveq 
  80300d:	c3                   	retq   

000000000080300e <bind>:
  80300e:	55                   	push   %rbp
  80300f:	48 89 e5             	mov    %rsp,%rbp
  803012:	48 83 ec 20          	sub    $0x20,%rsp
  803016:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803019:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80301d:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803020:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803023:	89 c7                	mov    %eax,%edi
  803025:	48 b8 a9 2e 80 00 00 	movabs $0x802ea9,%rax
  80302c:	00 00 00 
  80302f:	ff d0                	callq  *%rax
  803031:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803034:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803038:	79 05                	jns    80303f <bind+0x31>
  80303a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80303d:	eb 1b                	jmp    80305a <bind+0x4c>
  80303f:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803042:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803046:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803049:	48 89 ce             	mov    %rcx,%rsi
  80304c:	89 c7                	mov    %eax,%edi
  80304e:	48 b8 69 33 80 00 00 	movabs $0x803369,%rax
  803055:	00 00 00 
  803058:	ff d0                	callq  *%rax
  80305a:	c9                   	leaveq 
  80305b:	c3                   	retq   

000000000080305c <shutdown>:
  80305c:	55                   	push   %rbp
  80305d:	48 89 e5             	mov    %rsp,%rbp
  803060:	48 83 ec 20          	sub    $0x20,%rsp
  803064:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803067:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80306a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80306d:	89 c7                	mov    %eax,%edi
  80306f:	48 b8 a9 2e 80 00 00 	movabs $0x802ea9,%rax
  803076:	00 00 00 
  803079:	ff d0                	callq  *%rax
  80307b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80307e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803082:	79 05                	jns    803089 <shutdown+0x2d>
  803084:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803087:	eb 16                	jmp    80309f <shutdown+0x43>
  803089:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80308c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80308f:	89 d6                	mov    %edx,%esi
  803091:	89 c7                	mov    %eax,%edi
  803093:	48 b8 cd 33 80 00 00 	movabs $0x8033cd,%rax
  80309a:	00 00 00 
  80309d:	ff d0                	callq  *%rax
  80309f:	c9                   	leaveq 
  8030a0:	c3                   	retq   

00000000008030a1 <devsock_close>:
  8030a1:	55                   	push   %rbp
  8030a2:	48 89 e5             	mov    %rsp,%rbp
  8030a5:	48 83 ec 10          	sub    $0x10,%rsp
  8030a9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8030ad:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8030b1:	48 89 c7             	mov    %rax,%rdi
  8030b4:	48 b8 a3 42 80 00 00 	movabs $0x8042a3,%rax
  8030bb:	00 00 00 
  8030be:	ff d0                	callq  *%rax
  8030c0:	83 f8 01             	cmp    $0x1,%eax
  8030c3:	75 17                	jne    8030dc <devsock_close+0x3b>
  8030c5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8030c9:	8b 40 0c             	mov    0xc(%rax),%eax
  8030cc:	89 c7                	mov    %eax,%edi
  8030ce:	48 b8 0d 34 80 00 00 	movabs $0x80340d,%rax
  8030d5:	00 00 00 
  8030d8:	ff d0                	callq  *%rax
  8030da:	eb 05                	jmp    8030e1 <devsock_close+0x40>
  8030dc:	b8 00 00 00 00       	mov    $0x0,%eax
  8030e1:	c9                   	leaveq 
  8030e2:	c3                   	retq   

00000000008030e3 <connect>:
  8030e3:	55                   	push   %rbp
  8030e4:	48 89 e5             	mov    %rsp,%rbp
  8030e7:	48 83 ec 20          	sub    $0x20,%rsp
  8030eb:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8030ee:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8030f2:	89 55 e8             	mov    %edx,-0x18(%rbp)
  8030f5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8030f8:	89 c7                	mov    %eax,%edi
  8030fa:	48 b8 a9 2e 80 00 00 	movabs $0x802ea9,%rax
  803101:	00 00 00 
  803104:	ff d0                	callq  *%rax
  803106:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803109:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80310d:	79 05                	jns    803114 <connect+0x31>
  80310f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803112:	eb 1b                	jmp    80312f <connect+0x4c>
  803114:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803117:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80311b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80311e:	48 89 ce             	mov    %rcx,%rsi
  803121:	89 c7                	mov    %eax,%edi
  803123:	48 b8 3a 34 80 00 00 	movabs $0x80343a,%rax
  80312a:	00 00 00 
  80312d:	ff d0                	callq  *%rax
  80312f:	c9                   	leaveq 
  803130:	c3                   	retq   

0000000000803131 <listen>:
  803131:	55                   	push   %rbp
  803132:	48 89 e5             	mov    %rsp,%rbp
  803135:	48 83 ec 20          	sub    $0x20,%rsp
  803139:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80313c:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80313f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803142:	89 c7                	mov    %eax,%edi
  803144:	48 b8 a9 2e 80 00 00 	movabs $0x802ea9,%rax
  80314b:	00 00 00 
  80314e:	ff d0                	callq  *%rax
  803150:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803153:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803157:	79 05                	jns    80315e <listen+0x2d>
  803159:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80315c:	eb 16                	jmp    803174 <listen+0x43>
  80315e:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803161:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803164:	89 d6                	mov    %edx,%esi
  803166:	89 c7                	mov    %eax,%edi
  803168:	48 b8 9e 34 80 00 00 	movabs $0x80349e,%rax
  80316f:	00 00 00 
  803172:	ff d0                	callq  *%rax
  803174:	c9                   	leaveq 
  803175:	c3                   	retq   

0000000000803176 <devsock_read>:
  803176:	55                   	push   %rbp
  803177:	48 89 e5             	mov    %rsp,%rbp
  80317a:	48 83 ec 20          	sub    $0x20,%rsp
  80317e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803182:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803186:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80318a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80318e:	89 c2                	mov    %eax,%edx
  803190:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803194:	8b 40 0c             	mov    0xc(%rax),%eax
  803197:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  80319b:	b9 00 00 00 00       	mov    $0x0,%ecx
  8031a0:	89 c7                	mov    %eax,%edi
  8031a2:	48 b8 de 34 80 00 00 	movabs $0x8034de,%rax
  8031a9:	00 00 00 
  8031ac:	ff d0                	callq  *%rax
  8031ae:	c9                   	leaveq 
  8031af:	c3                   	retq   

00000000008031b0 <devsock_write>:
  8031b0:	55                   	push   %rbp
  8031b1:	48 89 e5             	mov    %rsp,%rbp
  8031b4:	48 83 ec 20          	sub    $0x20,%rsp
  8031b8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8031bc:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8031c0:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8031c4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8031c8:	89 c2                	mov    %eax,%edx
  8031ca:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8031ce:	8b 40 0c             	mov    0xc(%rax),%eax
  8031d1:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  8031d5:	b9 00 00 00 00       	mov    $0x0,%ecx
  8031da:	89 c7                	mov    %eax,%edi
  8031dc:	48 b8 aa 35 80 00 00 	movabs $0x8035aa,%rax
  8031e3:	00 00 00 
  8031e6:	ff d0                	callq  *%rax
  8031e8:	c9                   	leaveq 
  8031e9:	c3                   	retq   

00000000008031ea <devsock_stat>:
  8031ea:	55                   	push   %rbp
  8031eb:	48 89 e5             	mov    %rsp,%rbp
  8031ee:	48 83 ec 10          	sub    $0x10,%rsp
  8031f2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8031f6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8031fa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8031fe:	48 be aa 4a 80 00 00 	movabs $0x804aaa,%rsi
  803205:	00 00 00 
  803208:	48 89 c7             	mov    %rax,%rdi
  80320b:	48 b8 71 10 80 00 00 	movabs $0x801071,%rax
  803212:	00 00 00 
  803215:	ff d0                	callq  *%rax
  803217:	b8 00 00 00 00       	mov    $0x0,%eax
  80321c:	c9                   	leaveq 
  80321d:	c3                   	retq   

000000000080321e <socket>:
  80321e:	55                   	push   %rbp
  80321f:	48 89 e5             	mov    %rsp,%rbp
  803222:	48 83 ec 20          	sub    $0x20,%rsp
  803226:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803229:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80322c:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  80322f:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803232:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803235:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803238:	89 ce                	mov    %ecx,%esi
  80323a:	89 c7                	mov    %eax,%edi
  80323c:	48 b8 62 36 80 00 00 	movabs $0x803662,%rax
  803243:	00 00 00 
  803246:	ff d0                	callq  *%rax
  803248:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80324b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80324f:	79 05                	jns    803256 <socket+0x38>
  803251:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803254:	eb 11                	jmp    803267 <socket+0x49>
  803256:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803259:	89 c7                	mov    %eax,%edi
  80325b:	48 b8 00 2f 80 00 00 	movabs $0x802f00,%rax
  803262:	00 00 00 
  803265:	ff d0                	callq  *%rax
  803267:	c9                   	leaveq 
  803268:	c3                   	retq   

0000000000803269 <nsipc>:
  803269:	55                   	push   %rbp
  80326a:	48 89 e5             	mov    %rsp,%rbp
  80326d:	48 83 ec 10          	sub    $0x10,%rsp
  803271:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803274:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  80327b:	00 00 00 
  80327e:	8b 00                	mov    (%rax),%eax
  803280:	85 c0                	test   %eax,%eax
  803282:	75 1d                	jne    8032a1 <nsipc+0x38>
  803284:	bf 02 00 00 00       	mov    $0x2,%edi
  803289:	48 b8 31 42 80 00 00 	movabs $0x804231,%rax
  803290:	00 00 00 
  803293:	ff d0                	callq  *%rax
  803295:	48 ba 04 70 80 00 00 	movabs $0x807004,%rdx
  80329c:	00 00 00 
  80329f:	89 02                	mov    %eax,(%rdx)
  8032a1:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  8032a8:	00 00 00 
  8032ab:	8b 00                	mov    (%rax),%eax
  8032ad:	8b 75 fc             	mov    -0x4(%rbp),%esi
  8032b0:	b9 07 00 00 00       	mov    $0x7,%ecx
  8032b5:	48 ba 00 a0 80 00 00 	movabs $0x80a000,%rdx
  8032bc:	00 00 00 
  8032bf:	89 c7                	mov    %eax,%edi
  8032c1:	48 b8 9b 41 80 00 00 	movabs $0x80419b,%rax
  8032c8:	00 00 00 
  8032cb:	ff d0                	callq  *%rax
  8032cd:	ba 00 00 00 00       	mov    $0x0,%edx
  8032d2:	be 00 00 00 00       	mov    $0x0,%esi
  8032d7:	bf 00 00 00 00       	mov    $0x0,%edi
  8032dc:	48 b8 da 40 80 00 00 	movabs $0x8040da,%rax
  8032e3:	00 00 00 
  8032e6:	ff d0                	callq  *%rax
  8032e8:	c9                   	leaveq 
  8032e9:	c3                   	retq   

00000000008032ea <nsipc_accept>:
  8032ea:	55                   	push   %rbp
  8032eb:	48 89 e5             	mov    %rsp,%rbp
  8032ee:	48 83 ec 30          	sub    $0x30,%rsp
  8032f2:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8032f5:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8032f9:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8032fd:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803304:	00 00 00 
  803307:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80330a:	89 10                	mov    %edx,(%rax)
  80330c:	bf 01 00 00 00       	mov    $0x1,%edi
  803311:	48 b8 69 32 80 00 00 	movabs $0x803269,%rax
  803318:	00 00 00 
  80331b:	ff d0                	callq  *%rax
  80331d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803320:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803324:	78 3e                	js     803364 <nsipc_accept+0x7a>
  803326:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80332d:	00 00 00 
  803330:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803334:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803338:	8b 40 10             	mov    0x10(%rax),%eax
  80333b:	89 c2                	mov    %eax,%edx
  80333d:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  803341:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803345:	48 89 ce             	mov    %rcx,%rsi
  803348:	48 89 c7             	mov    %rax,%rdi
  80334b:	48 b8 95 13 80 00 00 	movabs $0x801395,%rax
  803352:	00 00 00 
  803355:	ff d0                	callq  *%rax
  803357:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80335b:	8b 50 10             	mov    0x10(%rax),%edx
  80335e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803362:	89 10                	mov    %edx,(%rax)
  803364:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803367:	c9                   	leaveq 
  803368:	c3                   	retq   

0000000000803369 <nsipc_bind>:
  803369:	55                   	push   %rbp
  80336a:	48 89 e5             	mov    %rsp,%rbp
  80336d:	48 83 ec 10          	sub    $0x10,%rsp
  803371:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803374:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803378:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80337b:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803382:	00 00 00 
  803385:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803388:	89 10                	mov    %edx,(%rax)
  80338a:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80338d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803391:	48 89 c6             	mov    %rax,%rsi
  803394:	48 bf 04 a0 80 00 00 	movabs $0x80a004,%rdi
  80339b:	00 00 00 
  80339e:	48 b8 95 13 80 00 00 	movabs $0x801395,%rax
  8033a5:	00 00 00 
  8033a8:	ff d0                	callq  *%rax
  8033aa:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8033b1:	00 00 00 
  8033b4:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8033b7:	89 50 14             	mov    %edx,0x14(%rax)
  8033ba:	bf 02 00 00 00       	mov    $0x2,%edi
  8033bf:	48 b8 69 32 80 00 00 	movabs $0x803269,%rax
  8033c6:	00 00 00 
  8033c9:	ff d0                	callq  *%rax
  8033cb:	c9                   	leaveq 
  8033cc:	c3                   	retq   

00000000008033cd <nsipc_shutdown>:
  8033cd:	55                   	push   %rbp
  8033ce:	48 89 e5             	mov    %rsp,%rbp
  8033d1:	48 83 ec 10          	sub    $0x10,%rsp
  8033d5:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8033d8:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8033db:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8033e2:	00 00 00 
  8033e5:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8033e8:	89 10                	mov    %edx,(%rax)
  8033ea:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8033f1:	00 00 00 
  8033f4:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8033f7:	89 50 04             	mov    %edx,0x4(%rax)
  8033fa:	bf 03 00 00 00       	mov    $0x3,%edi
  8033ff:	48 b8 69 32 80 00 00 	movabs $0x803269,%rax
  803406:	00 00 00 
  803409:	ff d0                	callq  *%rax
  80340b:	c9                   	leaveq 
  80340c:	c3                   	retq   

000000000080340d <nsipc_close>:
  80340d:	55                   	push   %rbp
  80340e:	48 89 e5             	mov    %rsp,%rbp
  803411:	48 83 ec 10          	sub    $0x10,%rsp
  803415:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803418:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80341f:	00 00 00 
  803422:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803425:	89 10                	mov    %edx,(%rax)
  803427:	bf 04 00 00 00       	mov    $0x4,%edi
  80342c:	48 b8 69 32 80 00 00 	movabs $0x803269,%rax
  803433:	00 00 00 
  803436:	ff d0                	callq  *%rax
  803438:	c9                   	leaveq 
  803439:	c3                   	retq   

000000000080343a <nsipc_connect>:
  80343a:	55                   	push   %rbp
  80343b:	48 89 e5             	mov    %rsp,%rbp
  80343e:	48 83 ec 10          	sub    $0x10,%rsp
  803442:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803445:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803449:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80344c:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803453:	00 00 00 
  803456:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803459:	89 10                	mov    %edx,(%rax)
  80345b:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80345e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803462:	48 89 c6             	mov    %rax,%rsi
  803465:	48 bf 04 a0 80 00 00 	movabs $0x80a004,%rdi
  80346c:	00 00 00 
  80346f:	48 b8 95 13 80 00 00 	movabs $0x801395,%rax
  803476:	00 00 00 
  803479:	ff d0                	callq  *%rax
  80347b:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803482:	00 00 00 
  803485:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803488:	89 50 14             	mov    %edx,0x14(%rax)
  80348b:	bf 05 00 00 00       	mov    $0x5,%edi
  803490:	48 b8 69 32 80 00 00 	movabs $0x803269,%rax
  803497:	00 00 00 
  80349a:	ff d0                	callq  *%rax
  80349c:	c9                   	leaveq 
  80349d:	c3                   	retq   

000000000080349e <nsipc_listen>:
  80349e:	55                   	push   %rbp
  80349f:	48 89 e5             	mov    %rsp,%rbp
  8034a2:	48 83 ec 10          	sub    $0x10,%rsp
  8034a6:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8034a9:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8034ac:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8034b3:	00 00 00 
  8034b6:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8034b9:	89 10                	mov    %edx,(%rax)
  8034bb:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8034c2:	00 00 00 
  8034c5:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8034c8:	89 50 04             	mov    %edx,0x4(%rax)
  8034cb:	bf 06 00 00 00       	mov    $0x6,%edi
  8034d0:	48 b8 69 32 80 00 00 	movabs $0x803269,%rax
  8034d7:	00 00 00 
  8034da:	ff d0                	callq  *%rax
  8034dc:	c9                   	leaveq 
  8034dd:	c3                   	retq   

00000000008034de <nsipc_recv>:
  8034de:	55                   	push   %rbp
  8034df:	48 89 e5             	mov    %rsp,%rbp
  8034e2:	48 83 ec 30          	sub    $0x30,%rsp
  8034e6:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8034e9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8034ed:	89 55 e8             	mov    %edx,-0x18(%rbp)
  8034f0:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  8034f3:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8034fa:	00 00 00 
  8034fd:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803500:	89 10                	mov    %edx,(%rax)
  803502:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803509:	00 00 00 
  80350c:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80350f:	89 50 04             	mov    %edx,0x4(%rax)
  803512:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803519:	00 00 00 
  80351c:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80351f:	89 50 08             	mov    %edx,0x8(%rax)
  803522:	bf 07 00 00 00       	mov    $0x7,%edi
  803527:	48 b8 69 32 80 00 00 	movabs $0x803269,%rax
  80352e:	00 00 00 
  803531:	ff d0                	callq  *%rax
  803533:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803536:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80353a:	78 69                	js     8035a5 <nsipc_recv+0xc7>
  80353c:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  803543:	7f 08                	jg     80354d <nsipc_recv+0x6f>
  803545:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803548:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  80354b:	7e 35                	jle    803582 <nsipc_recv+0xa4>
  80354d:	48 b9 b1 4a 80 00 00 	movabs $0x804ab1,%rcx
  803554:	00 00 00 
  803557:	48 ba c6 4a 80 00 00 	movabs $0x804ac6,%rdx
  80355e:	00 00 00 
  803561:	be 62 00 00 00       	mov    $0x62,%esi
  803566:	48 bf db 4a 80 00 00 	movabs $0x804adb,%rdi
  80356d:	00 00 00 
  803570:	b8 00 00 00 00       	mov    $0x0,%eax
  803575:	49 b8 c6 3f 80 00 00 	movabs $0x803fc6,%r8
  80357c:	00 00 00 
  80357f:	41 ff d0             	callq  *%r8
  803582:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803585:	48 63 d0             	movslq %eax,%rdx
  803588:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80358c:	48 be 00 a0 80 00 00 	movabs $0x80a000,%rsi
  803593:	00 00 00 
  803596:	48 89 c7             	mov    %rax,%rdi
  803599:	48 b8 95 13 80 00 00 	movabs $0x801395,%rax
  8035a0:	00 00 00 
  8035a3:	ff d0                	callq  *%rax
  8035a5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035a8:	c9                   	leaveq 
  8035a9:	c3                   	retq   

00000000008035aa <nsipc_send>:
  8035aa:	55                   	push   %rbp
  8035ab:	48 89 e5             	mov    %rsp,%rbp
  8035ae:	48 83 ec 20          	sub    $0x20,%rsp
  8035b2:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8035b5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8035b9:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8035bc:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  8035bf:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8035c6:	00 00 00 
  8035c9:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8035cc:	89 10                	mov    %edx,(%rax)
  8035ce:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  8035d5:	7e 35                	jle    80360c <nsipc_send+0x62>
  8035d7:	48 b9 ea 4a 80 00 00 	movabs $0x804aea,%rcx
  8035de:	00 00 00 
  8035e1:	48 ba c6 4a 80 00 00 	movabs $0x804ac6,%rdx
  8035e8:	00 00 00 
  8035eb:	be 6d 00 00 00       	mov    $0x6d,%esi
  8035f0:	48 bf db 4a 80 00 00 	movabs $0x804adb,%rdi
  8035f7:	00 00 00 
  8035fa:	b8 00 00 00 00       	mov    $0x0,%eax
  8035ff:	49 b8 c6 3f 80 00 00 	movabs $0x803fc6,%r8
  803606:	00 00 00 
  803609:	41 ff d0             	callq  *%r8
  80360c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80360f:	48 63 d0             	movslq %eax,%rdx
  803612:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803616:	48 89 c6             	mov    %rax,%rsi
  803619:	48 bf 0c a0 80 00 00 	movabs $0x80a00c,%rdi
  803620:	00 00 00 
  803623:	48 b8 95 13 80 00 00 	movabs $0x801395,%rax
  80362a:	00 00 00 
  80362d:	ff d0                	callq  *%rax
  80362f:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803636:	00 00 00 
  803639:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80363c:	89 50 04             	mov    %edx,0x4(%rax)
  80363f:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803646:	00 00 00 
  803649:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80364c:	89 50 08             	mov    %edx,0x8(%rax)
  80364f:	bf 08 00 00 00       	mov    $0x8,%edi
  803654:	48 b8 69 32 80 00 00 	movabs $0x803269,%rax
  80365b:	00 00 00 
  80365e:	ff d0                	callq  *%rax
  803660:	c9                   	leaveq 
  803661:	c3                   	retq   

0000000000803662 <nsipc_socket>:
  803662:	55                   	push   %rbp
  803663:	48 89 e5             	mov    %rsp,%rbp
  803666:	48 83 ec 10          	sub    $0x10,%rsp
  80366a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80366d:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803670:	89 55 f4             	mov    %edx,-0xc(%rbp)
  803673:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80367a:	00 00 00 
  80367d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803680:	89 10                	mov    %edx,(%rax)
  803682:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803689:	00 00 00 
  80368c:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80368f:	89 50 04             	mov    %edx,0x4(%rax)
  803692:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803699:	00 00 00 
  80369c:	8b 55 f4             	mov    -0xc(%rbp),%edx
  80369f:	89 50 08             	mov    %edx,0x8(%rax)
  8036a2:	bf 09 00 00 00       	mov    $0x9,%edi
  8036a7:	48 b8 69 32 80 00 00 	movabs $0x803269,%rax
  8036ae:	00 00 00 
  8036b1:	ff d0                	callq  *%rax
  8036b3:	c9                   	leaveq 
  8036b4:	c3                   	retq   

00000000008036b5 <pipe>:
  8036b5:	55                   	push   %rbp
  8036b6:	48 89 e5             	mov    %rsp,%rbp
  8036b9:	53                   	push   %rbx
  8036ba:	48 83 ec 38          	sub    $0x38,%rsp
  8036be:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  8036c2:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  8036c6:	48 89 c7             	mov    %rax,%rdi
  8036c9:	48 b8 cc 1e 80 00 00 	movabs $0x801ecc,%rax
  8036d0:	00 00 00 
  8036d3:	ff d0                	callq  *%rax
  8036d5:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8036d8:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8036dc:	0f 88 bf 01 00 00    	js     8038a1 <pipe+0x1ec>
  8036e2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8036e6:	ba 07 04 00 00       	mov    $0x407,%edx
  8036eb:	48 89 c6             	mov    %rax,%rsi
  8036ee:	bf 00 00 00 00       	mov    $0x0,%edi
  8036f3:	48 b8 a0 19 80 00 00 	movabs $0x8019a0,%rax
  8036fa:	00 00 00 
  8036fd:	ff d0                	callq  *%rax
  8036ff:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803702:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803706:	0f 88 95 01 00 00    	js     8038a1 <pipe+0x1ec>
  80370c:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  803710:	48 89 c7             	mov    %rax,%rdi
  803713:	48 b8 cc 1e 80 00 00 	movabs $0x801ecc,%rax
  80371a:	00 00 00 
  80371d:	ff d0                	callq  *%rax
  80371f:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803722:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803726:	0f 88 5d 01 00 00    	js     803889 <pipe+0x1d4>
  80372c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803730:	ba 07 04 00 00       	mov    $0x407,%edx
  803735:	48 89 c6             	mov    %rax,%rsi
  803738:	bf 00 00 00 00       	mov    $0x0,%edi
  80373d:	48 b8 a0 19 80 00 00 	movabs $0x8019a0,%rax
  803744:	00 00 00 
  803747:	ff d0                	callq  *%rax
  803749:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80374c:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803750:	0f 88 33 01 00 00    	js     803889 <pipe+0x1d4>
  803756:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80375a:	48 89 c7             	mov    %rax,%rdi
  80375d:	48 b8 a1 1e 80 00 00 	movabs $0x801ea1,%rax
  803764:	00 00 00 
  803767:	ff d0                	callq  *%rax
  803769:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80376d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803771:	ba 07 04 00 00       	mov    $0x407,%edx
  803776:	48 89 c6             	mov    %rax,%rsi
  803779:	bf 00 00 00 00       	mov    $0x0,%edi
  80377e:	48 b8 a0 19 80 00 00 	movabs $0x8019a0,%rax
  803785:	00 00 00 
  803788:	ff d0                	callq  *%rax
  80378a:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80378d:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803791:	79 05                	jns    803798 <pipe+0xe3>
  803793:	e9 d9 00 00 00       	jmpq   803871 <pipe+0x1bc>
  803798:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80379c:	48 89 c7             	mov    %rax,%rdi
  80379f:	48 b8 a1 1e 80 00 00 	movabs $0x801ea1,%rax
  8037a6:	00 00 00 
  8037a9:	ff d0                	callq  *%rax
  8037ab:	48 89 c2             	mov    %rax,%rdx
  8037ae:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8037b2:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  8037b8:	48 89 d1             	mov    %rdx,%rcx
  8037bb:	ba 00 00 00 00       	mov    $0x0,%edx
  8037c0:	48 89 c6             	mov    %rax,%rsi
  8037c3:	bf 00 00 00 00       	mov    $0x0,%edi
  8037c8:	48 b8 f0 19 80 00 00 	movabs $0x8019f0,%rax
  8037cf:	00 00 00 
  8037d2:	ff d0                	callq  *%rax
  8037d4:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8037d7:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8037db:	79 1b                	jns    8037f8 <pipe+0x143>
  8037dd:	90                   	nop
  8037de:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8037e2:	48 89 c6             	mov    %rax,%rsi
  8037e5:	bf 00 00 00 00       	mov    $0x0,%edi
  8037ea:	48 b8 4b 1a 80 00 00 	movabs $0x801a4b,%rax
  8037f1:	00 00 00 
  8037f4:	ff d0                	callq  *%rax
  8037f6:	eb 79                	jmp    803871 <pipe+0x1bc>
  8037f8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8037fc:	48 ba e0 60 80 00 00 	movabs $0x8060e0,%rdx
  803803:	00 00 00 
  803806:	8b 12                	mov    (%rdx),%edx
  803808:	89 10                	mov    %edx,(%rax)
  80380a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80380e:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  803815:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803819:	48 ba e0 60 80 00 00 	movabs $0x8060e0,%rdx
  803820:	00 00 00 
  803823:	8b 12                	mov    (%rdx),%edx
  803825:	89 10                	mov    %edx,(%rax)
  803827:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80382b:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  803832:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803836:	48 89 c7             	mov    %rax,%rdi
  803839:	48 b8 7e 1e 80 00 00 	movabs $0x801e7e,%rax
  803840:	00 00 00 
  803843:	ff d0                	callq  *%rax
  803845:	89 c2                	mov    %eax,%edx
  803847:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80384b:	89 10                	mov    %edx,(%rax)
  80384d:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803851:	48 8d 58 04          	lea    0x4(%rax),%rbx
  803855:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803859:	48 89 c7             	mov    %rax,%rdi
  80385c:	48 b8 7e 1e 80 00 00 	movabs $0x801e7e,%rax
  803863:	00 00 00 
  803866:	ff d0                	callq  *%rax
  803868:	89 03                	mov    %eax,(%rbx)
  80386a:	b8 00 00 00 00       	mov    $0x0,%eax
  80386f:	eb 33                	jmp    8038a4 <pipe+0x1ef>
  803871:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803875:	48 89 c6             	mov    %rax,%rsi
  803878:	bf 00 00 00 00       	mov    $0x0,%edi
  80387d:	48 b8 4b 1a 80 00 00 	movabs $0x801a4b,%rax
  803884:	00 00 00 
  803887:	ff d0                	callq  *%rax
  803889:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80388d:	48 89 c6             	mov    %rax,%rsi
  803890:	bf 00 00 00 00       	mov    $0x0,%edi
  803895:	48 b8 4b 1a 80 00 00 	movabs $0x801a4b,%rax
  80389c:	00 00 00 
  80389f:	ff d0                	callq  *%rax
  8038a1:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8038a4:	48 83 c4 38          	add    $0x38,%rsp
  8038a8:	5b                   	pop    %rbx
  8038a9:	5d                   	pop    %rbp
  8038aa:	c3                   	retq   

00000000008038ab <_pipeisclosed>:
  8038ab:	55                   	push   %rbp
  8038ac:	48 89 e5             	mov    %rsp,%rbp
  8038af:	53                   	push   %rbx
  8038b0:	48 83 ec 28          	sub    $0x28,%rsp
  8038b4:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8038b8:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8038bc:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8038c3:	00 00 00 
  8038c6:	48 8b 00             	mov    (%rax),%rax
  8038c9:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8038cf:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8038d2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8038d6:	48 89 c7             	mov    %rax,%rdi
  8038d9:	48 b8 a3 42 80 00 00 	movabs $0x8042a3,%rax
  8038e0:	00 00 00 
  8038e3:	ff d0                	callq  *%rax
  8038e5:	89 c3                	mov    %eax,%ebx
  8038e7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8038eb:	48 89 c7             	mov    %rax,%rdi
  8038ee:	48 b8 a3 42 80 00 00 	movabs $0x8042a3,%rax
  8038f5:	00 00 00 
  8038f8:	ff d0                	callq  *%rax
  8038fa:	39 c3                	cmp    %eax,%ebx
  8038fc:	0f 94 c0             	sete   %al
  8038ff:	0f b6 c0             	movzbl %al,%eax
  803902:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803905:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  80390c:	00 00 00 
  80390f:	48 8b 00             	mov    (%rax),%rax
  803912:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  803918:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  80391b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80391e:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  803921:	75 05                	jne    803928 <_pipeisclosed+0x7d>
  803923:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803926:	eb 4f                	jmp    803977 <_pipeisclosed+0xcc>
  803928:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80392b:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  80392e:	74 42                	je     803972 <_pipeisclosed+0xc7>
  803930:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  803934:	75 3c                	jne    803972 <_pipeisclosed+0xc7>
  803936:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  80393d:	00 00 00 
  803940:	48 8b 00             	mov    (%rax),%rax
  803943:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  803949:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  80394c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80394f:	89 c6                	mov    %eax,%esi
  803951:	48 bf fb 4a 80 00 00 	movabs $0x804afb,%rdi
  803958:	00 00 00 
  80395b:	b8 00 00 00 00       	mov    $0x0,%eax
  803960:	49 b8 bc 04 80 00 00 	movabs $0x8004bc,%r8
  803967:	00 00 00 
  80396a:	41 ff d0             	callq  *%r8
  80396d:	e9 4a ff ff ff       	jmpq   8038bc <_pipeisclosed+0x11>
  803972:	e9 45 ff ff ff       	jmpq   8038bc <_pipeisclosed+0x11>
  803977:	48 83 c4 28          	add    $0x28,%rsp
  80397b:	5b                   	pop    %rbx
  80397c:	5d                   	pop    %rbp
  80397d:	c3                   	retq   

000000000080397e <pipeisclosed>:
  80397e:	55                   	push   %rbp
  80397f:	48 89 e5             	mov    %rsp,%rbp
  803982:	48 83 ec 30          	sub    $0x30,%rsp
  803986:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803989:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80398d:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803990:	48 89 d6             	mov    %rdx,%rsi
  803993:	89 c7                	mov    %eax,%edi
  803995:	48 b8 64 1f 80 00 00 	movabs $0x801f64,%rax
  80399c:	00 00 00 
  80399f:	ff d0                	callq  *%rax
  8039a1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8039a4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8039a8:	79 05                	jns    8039af <pipeisclosed+0x31>
  8039aa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039ad:	eb 31                	jmp    8039e0 <pipeisclosed+0x62>
  8039af:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8039b3:	48 89 c7             	mov    %rax,%rdi
  8039b6:	48 b8 a1 1e 80 00 00 	movabs $0x801ea1,%rax
  8039bd:	00 00 00 
  8039c0:	ff d0                	callq  *%rax
  8039c2:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8039c6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8039ca:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8039ce:	48 89 d6             	mov    %rdx,%rsi
  8039d1:	48 89 c7             	mov    %rax,%rdi
  8039d4:	48 b8 ab 38 80 00 00 	movabs $0x8038ab,%rax
  8039db:	00 00 00 
  8039de:	ff d0                	callq  *%rax
  8039e0:	c9                   	leaveq 
  8039e1:	c3                   	retq   

00000000008039e2 <devpipe_read>:
  8039e2:	55                   	push   %rbp
  8039e3:	48 89 e5             	mov    %rsp,%rbp
  8039e6:	48 83 ec 40          	sub    $0x40,%rsp
  8039ea:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8039ee:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8039f2:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8039f6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8039fa:	48 89 c7             	mov    %rax,%rdi
  8039fd:	48 b8 a1 1e 80 00 00 	movabs $0x801ea1,%rax
  803a04:	00 00 00 
  803a07:	ff d0                	callq  *%rax
  803a09:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803a0d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803a11:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803a15:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803a1c:	00 
  803a1d:	e9 92 00 00 00       	jmpq   803ab4 <devpipe_read+0xd2>
  803a22:	eb 41                	jmp    803a65 <devpipe_read+0x83>
  803a24:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  803a29:	74 09                	je     803a34 <devpipe_read+0x52>
  803a2b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803a2f:	e9 92 00 00 00       	jmpq   803ac6 <devpipe_read+0xe4>
  803a34:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803a38:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803a3c:	48 89 d6             	mov    %rdx,%rsi
  803a3f:	48 89 c7             	mov    %rax,%rdi
  803a42:	48 b8 ab 38 80 00 00 	movabs $0x8038ab,%rax
  803a49:	00 00 00 
  803a4c:	ff d0                	callq  *%rax
  803a4e:	85 c0                	test   %eax,%eax
  803a50:	74 07                	je     803a59 <devpipe_read+0x77>
  803a52:	b8 00 00 00 00       	mov    $0x0,%eax
  803a57:	eb 6d                	jmp    803ac6 <devpipe_read+0xe4>
  803a59:	48 b8 62 19 80 00 00 	movabs $0x801962,%rax
  803a60:	00 00 00 
  803a63:	ff d0                	callq  *%rax
  803a65:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a69:	8b 10                	mov    (%rax),%edx
  803a6b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a6f:	8b 40 04             	mov    0x4(%rax),%eax
  803a72:	39 c2                	cmp    %eax,%edx
  803a74:	74 ae                	je     803a24 <devpipe_read+0x42>
  803a76:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803a7a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803a7e:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  803a82:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a86:	8b 00                	mov    (%rax),%eax
  803a88:	99                   	cltd   
  803a89:	c1 ea 1b             	shr    $0x1b,%edx
  803a8c:	01 d0                	add    %edx,%eax
  803a8e:	83 e0 1f             	and    $0x1f,%eax
  803a91:	29 d0                	sub    %edx,%eax
  803a93:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803a97:	48 98                	cltq   
  803a99:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  803a9e:	88 01                	mov    %al,(%rcx)
  803aa0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803aa4:	8b 00                	mov    (%rax),%eax
  803aa6:	8d 50 01             	lea    0x1(%rax),%edx
  803aa9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803aad:	89 10                	mov    %edx,(%rax)
  803aaf:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803ab4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803ab8:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803abc:	0f 82 60 ff ff ff    	jb     803a22 <devpipe_read+0x40>
  803ac2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803ac6:	c9                   	leaveq 
  803ac7:	c3                   	retq   

0000000000803ac8 <devpipe_write>:
  803ac8:	55                   	push   %rbp
  803ac9:	48 89 e5             	mov    %rsp,%rbp
  803acc:	48 83 ec 40          	sub    $0x40,%rsp
  803ad0:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803ad4:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803ad8:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803adc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803ae0:	48 89 c7             	mov    %rax,%rdi
  803ae3:	48 b8 a1 1e 80 00 00 	movabs $0x801ea1,%rax
  803aea:	00 00 00 
  803aed:	ff d0                	callq  *%rax
  803aef:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803af3:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803af7:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803afb:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803b02:	00 
  803b03:	e9 8e 00 00 00       	jmpq   803b96 <devpipe_write+0xce>
  803b08:	eb 31                	jmp    803b3b <devpipe_write+0x73>
  803b0a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803b0e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803b12:	48 89 d6             	mov    %rdx,%rsi
  803b15:	48 89 c7             	mov    %rax,%rdi
  803b18:	48 b8 ab 38 80 00 00 	movabs $0x8038ab,%rax
  803b1f:	00 00 00 
  803b22:	ff d0                	callq  *%rax
  803b24:	85 c0                	test   %eax,%eax
  803b26:	74 07                	je     803b2f <devpipe_write+0x67>
  803b28:	b8 00 00 00 00       	mov    $0x0,%eax
  803b2d:	eb 79                	jmp    803ba8 <devpipe_write+0xe0>
  803b2f:	48 b8 62 19 80 00 00 	movabs $0x801962,%rax
  803b36:	00 00 00 
  803b39:	ff d0                	callq  *%rax
  803b3b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b3f:	8b 40 04             	mov    0x4(%rax),%eax
  803b42:	48 63 d0             	movslq %eax,%rdx
  803b45:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b49:	8b 00                	mov    (%rax),%eax
  803b4b:	48 98                	cltq   
  803b4d:	48 83 c0 20          	add    $0x20,%rax
  803b51:	48 39 c2             	cmp    %rax,%rdx
  803b54:	73 b4                	jae    803b0a <devpipe_write+0x42>
  803b56:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b5a:	8b 40 04             	mov    0x4(%rax),%eax
  803b5d:	99                   	cltd   
  803b5e:	c1 ea 1b             	shr    $0x1b,%edx
  803b61:	01 d0                	add    %edx,%eax
  803b63:	83 e0 1f             	and    $0x1f,%eax
  803b66:	29 d0                	sub    %edx,%eax
  803b68:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  803b6c:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  803b70:	48 01 ca             	add    %rcx,%rdx
  803b73:	0f b6 0a             	movzbl (%rdx),%ecx
  803b76:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803b7a:	48 98                	cltq   
  803b7c:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  803b80:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b84:	8b 40 04             	mov    0x4(%rax),%eax
  803b87:	8d 50 01             	lea    0x1(%rax),%edx
  803b8a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b8e:	89 50 04             	mov    %edx,0x4(%rax)
  803b91:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803b96:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803b9a:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803b9e:	0f 82 64 ff ff ff    	jb     803b08 <devpipe_write+0x40>
  803ba4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803ba8:	c9                   	leaveq 
  803ba9:	c3                   	retq   

0000000000803baa <devpipe_stat>:
  803baa:	55                   	push   %rbp
  803bab:	48 89 e5             	mov    %rsp,%rbp
  803bae:	48 83 ec 20          	sub    $0x20,%rsp
  803bb2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803bb6:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803bba:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803bbe:	48 89 c7             	mov    %rax,%rdi
  803bc1:	48 b8 a1 1e 80 00 00 	movabs $0x801ea1,%rax
  803bc8:	00 00 00 
  803bcb:	ff d0                	callq  *%rax
  803bcd:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803bd1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803bd5:	48 be 0e 4b 80 00 00 	movabs $0x804b0e,%rsi
  803bdc:	00 00 00 
  803bdf:	48 89 c7             	mov    %rax,%rdi
  803be2:	48 b8 71 10 80 00 00 	movabs $0x801071,%rax
  803be9:	00 00 00 
  803bec:	ff d0                	callq  *%rax
  803bee:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803bf2:	8b 50 04             	mov    0x4(%rax),%edx
  803bf5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803bf9:	8b 00                	mov    (%rax),%eax
  803bfb:	29 c2                	sub    %eax,%edx
  803bfd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803c01:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  803c07:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803c0b:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  803c12:	00 00 00 
  803c15:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803c19:	48 b9 e0 60 80 00 00 	movabs $0x8060e0,%rcx
  803c20:	00 00 00 
  803c23:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  803c2a:	b8 00 00 00 00       	mov    $0x0,%eax
  803c2f:	c9                   	leaveq 
  803c30:	c3                   	retq   

0000000000803c31 <devpipe_close>:
  803c31:	55                   	push   %rbp
  803c32:	48 89 e5             	mov    %rsp,%rbp
  803c35:	48 83 ec 10          	sub    $0x10,%rsp
  803c39:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803c3d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803c41:	48 89 c6             	mov    %rax,%rsi
  803c44:	bf 00 00 00 00       	mov    $0x0,%edi
  803c49:	48 b8 4b 1a 80 00 00 	movabs $0x801a4b,%rax
  803c50:	00 00 00 
  803c53:	ff d0                	callq  *%rax
  803c55:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803c59:	48 89 c7             	mov    %rax,%rdi
  803c5c:	48 b8 a1 1e 80 00 00 	movabs $0x801ea1,%rax
  803c63:	00 00 00 
  803c66:	ff d0                	callq  *%rax
  803c68:	48 89 c6             	mov    %rax,%rsi
  803c6b:	bf 00 00 00 00       	mov    $0x0,%edi
  803c70:	48 b8 4b 1a 80 00 00 	movabs $0x801a4b,%rax
  803c77:	00 00 00 
  803c7a:	ff d0                	callq  *%rax
  803c7c:	c9                   	leaveq 
  803c7d:	c3                   	retq   

0000000000803c7e <wait>:
  803c7e:	55                   	push   %rbp
  803c7f:	48 89 e5             	mov    %rsp,%rbp
  803c82:	48 83 ec 20          	sub    $0x20,%rsp
  803c86:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803c89:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803c8d:	75 35                	jne    803cc4 <wait+0x46>
  803c8f:	48 b9 15 4b 80 00 00 	movabs $0x804b15,%rcx
  803c96:	00 00 00 
  803c99:	48 ba 20 4b 80 00 00 	movabs $0x804b20,%rdx
  803ca0:	00 00 00 
  803ca3:	be 0a 00 00 00       	mov    $0xa,%esi
  803ca8:	48 bf 35 4b 80 00 00 	movabs $0x804b35,%rdi
  803caf:	00 00 00 
  803cb2:	b8 00 00 00 00       	mov    $0x0,%eax
  803cb7:	49 b8 c6 3f 80 00 00 	movabs $0x803fc6,%r8
  803cbe:	00 00 00 
  803cc1:	41 ff d0             	callq  *%r8
  803cc4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803cc7:	25 ff 03 00 00       	and    $0x3ff,%eax
  803ccc:	48 98                	cltq   
  803cce:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  803cd5:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  803cdc:	00 00 00 
  803cdf:	48 01 d0             	add    %rdx,%rax
  803ce2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803ce6:	eb 0c                	jmp    803cf4 <wait+0x76>
  803ce8:	48 b8 62 19 80 00 00 	movabs $0x801962,%rax
  803cef:	00 00 00 
  803cf2:	ff d0                	callq  *%rax
  803cf4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803cf8:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  803cfe:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  803d01:	75 0e                	jne    803d11 <wait+0x93>
  803d03:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803d07:	8b 80 d4 00 00 00    	mov    0xd4(%rax),%eax
  803d0d:	85 c0                	test   %eax,%eax
  803d0f:	75 d7                	jne    803ce8 <wait+0x6a>
  803d11:	c9                   	leaveq 
  803d12:	c3                   	retq   

0000000000803d13 <cputchar>:
  803d13:	55                   	push   %rbp
  803d14:	48 89 e5             	mov    %rsp,%rbp
  803d17:	48 83 ec 20          	sub    $0x20,%rsp
  803d1b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803d1e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803d21:	88 45 ff             	mov    %al,-0x1(%rbp)
  803d24:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  803d28:	be 01 00 00 00       	mov    $0x1,%esi
  803d2d:	48 89 c7             	mov    %rax,%rdi
  803d30:	48 b8 58 18 80 00 00 	movabs $0x801858,%rax
  803d37:	00 00 00 
  803d3a:	ff d0                	callq  *%rax
  803d3c:	c9                   	leaveq 
  803d3d:	c3                   	retq   

0000000000803d3e <getchar>:
  803d3e:	55                   	push   %rbp
  803d3f:	48 89 e5             	mov    %rsp,%rbp
  803d42:	48 83 ec 10          	sub    $0x10,%rsp
  803d46:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  803d4a:	ba 01 00 00 00       	mov    $0x1,%edx
  803d4f:	48 89 c6             	mov    %rax,%rsi
  803d52:	bf 00 00 00 00       	mov    $0x0,%edi
  803d57:	48 b8 96 23 80 00 00 	movabs $0x802396,%rax
  803d5e:	00 00 00 
  803d61:	ff d0                	callq  *%rax
  803d63:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803d66:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803d6a:	79 05                	jns    803d71 <getchar+0x33>
  803d6c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d6f:	eb 14                	jmp    803d85 <getchar+0x47>
  803d71:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803d75:	7f 07                	jg     803d7e <getchar+0x40>
  803d77:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  803d7c:	eb 07                	jmp    803d85 <getchar+0x47>
  803d7e:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  803d82:	0f b6 c0             	movzbl %al,%eax
  803d85:	c9                   	leaveq 
  803d86:	c3                   	retq   

0000000000803d87 <iscons>:
  803d87:	55                   	push   %rbp
  803d88:	48 89 e5             	mov    %rsp,%rbp
  803d8b:	48 83 ec 20          	sub    $0x20,%rsp
  803d8f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803d92:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803d96:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803d99:	48 89 d6             	mov    %rdx,%rsi
  803d9c:	89 c7                	mov    %eax,%edi
  803d9e:	48 b8 64 1f 80 00 00 	movabs $0x801f64,%rax
  803da5:	00 00 00 
  803da8:	ff d0                	callq  *%rax
  803daa:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803dad:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803db1:	79 05                	jns    803db8 <iscons+0x31>
  803db3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803db6:	eb 1a                	jmp    803dd2 <iscons+0x4b>
  803db8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803dbc:	8b 10                	mov    (%rax),%edx
  803dbe:	48 b8 20 61 80 00 00 	movabs $0x806120,%rax
  803dc5:	00 00 00 
  803dc8:	8b 00                	mov    (%rax),%eax
  803dca:	39 c2                	cmp    %eax,%edx
  803dcc:	0f 94 c0             	sete   %al
  803dcf:	0f b6 c0             	movzbl %al,%eax
  803dd2:	c9                   	leaveq 
  803dd3:	c3                   	retq   

0000000000803dd4 <opencons>:
  803dd4:	55                   	push   %rbp
  803dd5:	48 89 e5             	mov    %rsp,%rbp
  803dd8:	48 83 ec 10          	sub    $0x10,%rsp
  803ddc:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803de0:	48 89 c7             	mov    %rax,%rdi
  803de3:	48 b8 cc 1e 80 00 00 	movabs $0x801ecc,%rax
  803dea:	00 00 00 
  803ded:	ff d0                	callq  *%rax
  803def:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803df2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803df6:	79 05                	jns    803dfd <opencons+0x29>
  803df8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803dfb:	eb 5b                	jmp    803e58 <opencons+0x84>
  803dfd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e01:	ba 07 04 00 00       	mov    $0x407,%edx
  803e06:	48 89 c6             	mov    %rax,%rsi
  803e09:	bf 00 00 00 00       	mov    $0x0,%edi
  803e0e:	48 b8 a0 19 80 00 00 	movabs $0x8019a0,%rax
  803e15:	00 00 00 
  803e18:	ff d0                	callq  *%rax
  803e1a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803e1d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803e21:	79 05                	jns    803e28 <opencons+0x54>
  803e23:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e26:	eb 30                	jmp    803e58 <opencons+0x84>
  803e28:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e2c:	48 ba 20 61 80 00 00 	movabs $0x806120,%rdx
  803e33:	00 00 00 
  803e36:	8b 12                	mov    (%rdx),%edx
  803e38:	89 10                	mov    %edx,(%rax)
  803e3a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e3e:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  803e45:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e49:	48 89 c7             	mov    %rax,%rdi
  803e4c:	48 b8 7e 1e 80 00 00 	movabs $0x801e7e,%rax
  803e53:	00 00 00 
  803e56:	ff d0                	callq  *%rax
  803e58:	c9                   	leaveq 
  803e59:	c3                   	retq   

0000000000803e5a <devcons_read>:
  803e5a:	55                   	push   %rbp
  803e5b:	48 89 e5             	mov    %rsp,%rbp
  803e5e:	48 83 ec 30          	sub    $0x30,%rsp
  803e62:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803e66:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803e6a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803e6e:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  803e73:	75 07                	jne    803e7c <devcons_read+0x22>
  803e75:	b8 00 00 00 00       	mov    $0x0,%eax
  803e7a:	eb 4b                	jmp    803ec7 <devcons_read+0x6d>
  803e7c:	eb 0c                	jmp    803e8a <devcons_read+0x30>
  803e7e:	48 b8 62 19 80 00 00 	movabs $0x801962,%rax
  803e85:	00 00 00 
  803e88:	ff d0                	callq  *%rax
  803e8a:	48 b8 a2 18 80 00 00 	movabs $0x8018a2,%rax
  803e91:	00 00 00 
  803e94:	ff d0                	callq  *%rax
  803e96:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803e99:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803e9d:	74 df                	je     803e7e <devcons_read+0x24>
  803e9f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803ea3:	79 05                	jns    803eaa <devcons_read+0x50>
  803ea5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ea8:	eb 1d                	jmp    803ec7 <devcons_read+0x6d>
  803eaa:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  803eae:	75 07                	jne    803eb7 <devcons_read+0x5d>
  803eb0:	b8 00 00 00 00       	mov    $0x0,%eax
  803eb5:	eb 10                	jmp    803ec7 <devcons_read+0x6d>
  803eb7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803eba:	89 c2                	mov    %eax,%edx
  803ebc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803ec0:	88 10                	mov    %dl,(%rax)
  803ec2:	b8 01 00 00 00       	mov    $0x1,%eax
  803ec7:	c9                   	leaveq 
  803ec8:	c3                   	retq   

0000000000803ec9 <devcons_write>:
  803ec9:	55                   	push   %rbp
  803eca:	48 89 e5             	mov    %rsp,%rbp
  803ecd:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  803ed4:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  803edb:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  803ee2:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  803ee9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803ef0:	eb 76                	jmp    803f68 <devcons_write+0x9f>
  803ef2:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  803ef9:	89 c2                	mov    %eax,%edx
  803efb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803efe:	29 c2                	sub    %eax,%edx
  803f00:	89 d0                	mov    %edx,%eax
  803f02:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803f05:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803f08:	83 f8 7f             	cmp    $0x7f,%eax
  803f0b:	76 07                	jbe    803f14 <devcons_write+0x4b>
  803f0d:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  803f14:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803f17:	48 63 d0             	movslq %eax,%rdx
  803f1a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f1d:	48 63 c8             	movslq %eax,%rcx
  803f20:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  803f27:	48 01 c1             	add    %rax,%rcx
  803f2a:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  803f31:	48 89 ce             	mov    %rcx,%rsi
  803f34:	48 89 c7             	mov    %rax,%rdi
  803f37:	48 b8 95 13 80 00 00 	movabs $0x801395,%rax
  803f3e:	00 00 00 
  803f41:	ff d0                	callq  *%rax
  803f43:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803f46:	48 63 d0             	movslq %eax,%rdx
  803f49:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  803f50:	48 89 d6             	mov    %rdx,%rsi
  803f53:	48 89 c7             	mov    %rax,%rdi
  803f56:	48 b8 58 18 80 00 00 	movabs $0x801858,%rax
  803f5d:	00 00 00 
  803f60:	ff d0                	callq  *%rax
  803f62:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803f65:	01 45 fc             	add    %eax,-0x4(%rbp)
  803f68:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f6b:	48 98                	cltq   
  803f6d:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  803f74:	0f 82 78 ff ff ff    	jb     803ef2 <devcons_write+0x29>
  803f7a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f7d:	c9                   	leaveq 
  803f7e:	c3                   	retq   

0000000000803f7f <devcons_close>:
  803f7f:	55                   	push   %rbp
  803f80:	48 89 e5             	mov    %rsp,%rbp
  803f83:	48 83 ec 08          	sub    $0x8,%rsp
  803f87:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803f8b:	b8 00 00 00 00       	mov    $0x0,%eax
  803f90:	c9                   	leaveq 
  803f91:	c3                   	retq   

0000000000803f92 <devcons_stat>:
  803f92:	55                   	push   %rbp
  803f93:	48 89 e5             	mov    %rsp,%rbp
  803f96:	48 83 ec 10          	sub    $0x10,%rsp
  803f9a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803f9e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803fa2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803fa6:	48 be 48 4b 80 00 00 	movabs $0x804b48,%rsi
  803fad:	00 00 00 
  803fb0:	48 89 c7             	mov    %rax,%rdi
  803fb3:	48 b8 71 10 80 00 00 	movabs $0x801071,%rax
  803fba:	00 00 00 
  803fbd:	ff d0                	callq  *%rax
  803fbf:	b8 00 00 00 00       	mov    $0x0,%eax
  803fc4:	c9                   	leaveq 
  803fc5:	c3                   	retq   

0000000000803fc6 <_panic>:
  803fc6:	55                   	push   %rbp
  803fc7:	48 89 e5             	mov    %rsp,%rbp
  803fca:	53                   	push   %rbx
  803fcb:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  803fd2:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  803fd9:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  803fdf:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  803fe6:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  803fed:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  803ff4:	84 c0                	test   %al,%al
  803ff6:	74 23                	je     80401b <_panic+0x55>
  803ff8:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  803fff:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  804003:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  804007:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  80400b:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  80400f:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  804013:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  804017:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  80401b:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  804022:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  804029:	00 00 00 
  80402c:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  804033:	00 00 00 
  804036:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80403a:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  804041:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  804048:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  80404f:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  804056:	00 00 00 
  804059:	48 8b 18             	mov    (%rax),%rbx
  80405c:	48 b8 24 19 80 00 00 	movabs $0x801924,%rax
  804063:	00 00 00 
  804066:	ff d0                	callq  *%rax
  804068:	8b 8d 14 ff ff ff    	mov    -0xec(%rbp),%ecx
  80406e:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  804075:	41 89 c8             	mov    %ecx,%r8d
  804078:	48 89 d1             	mov    %rdx,%rcx
  80407b:	48 89 da             	mov    %rbx,%rdx
  80407e:	89 c6                	mov    %eax,%esi
  804080:	48 bf 50 4b 80 00 00 	movabs $0x804b50,%rdi
  804087:	00 00 00 
  80408a:	b8 00 00 00 00       	mov    $0x0,%eax
  80408f:	49 b9 bc 04 80 00 00 	movabs $0x8004bc,%r9
  804096:	00 00 00 
  804099:	41 ff d1             	callq  *%r9
  80409c:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  8040a3:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8040aa:	48 89 d6             	mov    %rdx,%rsi
  8040ad:	48 89 c7             	mov    %rax,%rdi
  8040b0:	48 b8 10 04 80 00 00 	movabs $0x800410,%rax
  8040b7:	00 00 00 
  8040ba:	ff d0                	callq  *%rax
  8040bc:	48 bf 73 4b 80 00 00 	movabs $0x804b73,%rdi
  8040c3:	00 00 00 
  8040c6:	b8 00 00 00 00       	mov    $0x0,%eax
  8040cb:	48 ba bc 04 80 00 00 	movabs $0x8004bc,%rdx
  8040d2:	00 00 00 
  8040d5:	ff d2                	callq  *%rdx
  8040d7:	cc                   	int3   
  8040d8:	eb fd                	jmp    8040d7 <_panic+0x111>

00000000008040da <ipc_recv>:
  8040da:	55                   	push   %rbp
  8040db:	48 89 e5             	mov    %rsp,%rbp
  8040de:	48 83 ec 30          	sub    $0x30,%rsp
  8040e2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8040e6:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8040ea:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8040ee:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8040f3:	75 0e                	jne    804103 <ipc_recv+0x29>
  8040f5:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8040fc:	00 00 00 
  8040ff:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804103:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804107:	48 89 c7             	mov    %rax,%rdi
  80410a:	48 b8 c9 1b 80 00 00 	movabs $0x801bc9,%rax
  804111:	00 00 00 
  804114:	ff d0                	callq  *%rax
  804116:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804119:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80411d:	79 27                	jns    804146 <ipc_recv+0x6c>
  80411f:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  804124:	74 0a                	je     804130 <ipc_recv+0x56>
  804126:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80412a:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  804130:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804135:	74 0a                	je     804141 <ipc_recv+0x67>
  804137:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80413b:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  804141:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804144:	eb 53                	jmp    804199 <ipc_recv+0xbf>
  804146:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80414b:	74 19                	je     804166 <ipc_recv+0x8c>
  80414d:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  804154:	00 00 00 
  804157:	48 8b 00             	mov    (%rax),%rax
  80415a:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  804160:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804164:	89 10                	mov    %edx,(%rax)
  804166:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80416b:	74 19                	je     804186 <ipc_recv+0xac>
  80416d:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  804174:	00 00 00 
  804177:	48 8b 00             	mov    (%rax),%rax
  80417a:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  804180:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804184:	89 10                	mov    %edx,(%rax)
  804186:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  80418d:	00 00 00 
  804190:	48 8b 00             	mov    (%rax),%rax
  804193:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  804199:	c9                   	leaveq 
  80419a:	c3                   	retq   

000000000080419b <ipc_send>:
  80419b:	55                   	push   %rbp
  80419c:	48 89 e5             	mov    %rsp,%rbp
  80419f:	48 83 ec 30          	sub    $0x30,%rsp
  8041a3:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8041a6:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8041a9:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  8041ad:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  8041b0:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8041b5:	75 10                	jne    8041c7 <ipc_send+0x2c>
  8041b7:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8041be:	00 00 00 
  8041c1:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8041c5:	eb 0e                	jmp    8041d5 <ipc_send+0x3a>
  8041c7:	eb 0c                	jmp    8041d5 <ipc_send+0x3a>
  8041c9:	48 b8 62 19 80 00 00 	movabs $0x801962,%rax
  8041d0:	00 00 00 
  8041d3:	ff d0                	callq  *%rax
  8041d5:	8b 75 e8             	mov    -0x18(%rbp),%esi
  8041d8:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  8041db:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8041df:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8041e2:	89 c7                	mov    %eax,%edi
  8041e4:	48 b8 74 1b 80 00 00 	movabs $0x801b74,%rax
  8041eb:	00 00 00 
  8041ee:	ff d0                	callq  *%rax
  8041f0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8041f3:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  8041f7:	74 d0                	je     8041c9 <ipc_send+0x2e>
  8041f9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8041fd:	79 30                	jns    80422f <ipc_send+0x94>
  8041ff:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804202:	89 c1                	mov    %eax,%ecx
  804204:	48 ba 75 4b 80 00 00 	movabs $0x804b75,%rdx
  80420b:	00 00 00 
  80420e:	be 44 00 00 00       	mov    $0x44,%esi
  804213:	48 bf 8b 4b 80 00 00 	movabs $0x804b8b,%rdi
  80421a:	00 00 00 
  80421d:	b8 00 00 00 00       	mov    $0x0,%eax
  804222:	49 b8 c6 3f 80 00 00 	movabs $0x803fc6,%r8
  804229:	00 00 00 
  80422c:	41 ff d0             	callq  *%r8
  80422f:	c9                   	leaveq 
  804230:	c3                   	retq   

0000000000804231 <ipc_find_env>:
  804231:	55                   	push   %rbp
  804232:	48 89 e5             	mov    %rsp,%rbp
  804235:	48 83 ec 14          	sub    $0x14,%rsp
  804239:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80423c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804243:	eb 4e                	jmp    804293 <ipc_find_env+0x62>
  804245:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  80424c:	00 00 00 
  80424f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804252:	48 98                	cltq   
  804254:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  80425b:	48 01 d0             	add    %rdx,%rax
  80425e:	48 05 d0 00 00 00    	add    $0xd0,%rax
  804264:	8b 00                	mov    (%rax),%eax
  804266:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  804269:	75 24                	jne    80428f <ipc_find_env+0x5e>
  80426b:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804272:	00 00 00 
  804275:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804278:	48 98                	cltq   
  80427a:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804281:	48 01 d0             	add    %rdx,%rax
  804284:	48 05 c0 00 00 00    	add    $0xc0,%rax
  80428a:	8b 40 08             	mov    0x8(%rax),%eax
  80428d:	eb 12                	jmp    8042a1 <ipc_find_env+0x70>
  80428f:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  804293:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  80429a:	7e a9                	jle    804245 <ipc_find_env+0x14>
  80429c:	b8 00 00 00 00       	mov    $0x0,%eax
  8042a1:	c9                   	leaveq 
  8042a2:	c3                   	retq   

00000000008042a3 <pageref>:
  8042a3:	55                   	push   %rbp
  8042a4:	48 89 e5             	mov    %rsp,%rbp
  8042a7:	48 83 ec 18          	sub    $0x18,%rsp
  8042ab:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8042af:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8042b3:	48 c1 e8 15          	shr    $0x15,%rax
  8042b7:	48 89 c2             	mov    %rax,%rdx
  8042ba:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8042c1:	01 00 00 
  8042c4:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8042c8:	83 e0 01             	and    $0x1,%eax
  8042cb:	48 85 c0             	test   %rax,%rax
  8042ce:	75 07                	jne    8042d7 <pageref+0x34>
  8042d0:	b8 00 00 00 00       	mov    $0x0,%eax
  8042d5:	eb 53                	jmp    80432a <pageref+0x87>
  8042d7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8042db:	48 c1 e8 0c          	shr    $0xc,%rax
  8042df:	48 89 c2             	mov    %rax,%rdx
  8042e2:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8042e9:	01 00 00 
  8042ec:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8042f0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8042f4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8042f8:	83 e0 01             	and    $0x1,%eax
  8042fb:	48 85 c0             	test   %rax,%rax
  8042fe:	75 07                	jne    804307 <pageref+0x64>
  804300:	b8 00 00 00 00       	mov    $0x0,%eax
  804305:	eb 23                	jmp    80432a <pageref+0x87>
  804307:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80430b:	48 c1 e8 0c          	shr    $0xc,%rax
  80430f:	48 89 c2             	mov    %rax,%rdx
  804312:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  804319:	00 00 00 
  80431c:	48 c1 e2 04          	shl    $0x4,%rdx
  804320:	48 01 d0             	add    %rdx,%rax
  804323:	0f b7 40 08          	movzwl 0x8(%rax),%eax
  804327:	0f b7 c0             	movzwl %ax,%eax
  80432a:	c9                   	leaveq 
  80432b:	c3                   	retq   
