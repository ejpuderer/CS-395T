
obj/user/idle:     file format elf64-x86-64


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
  80003c:	e8 36 00 00 00       	callq  800077 <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <umain>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 10          	sub    $0x10,%rsp
  80004b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80004e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800052:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  800059:	00 00 00 
  80005c:	48 ba 20 40 80 00 00 	movabs $0x804020,%rdx
  800063:	00 00 00 
  800066:	48 89 10             	mov    %rdx,(%rax)
  800069:	48 b8 b5 02 80 00 00 	movabs $0x8002b5,%rax
  800070:	00 00 00 
  800073:	ff d0                	callq  *%rax
  800075:	eb f2                	jmp    800069 <umain+0x26>

0000000000800077 <libmain>:
  800077:	55                   	push   %rbp
  800078:	48 89 e5             	mov    %rsp,%rbp
  80007b:	48 83 ec 10          	sub    $0x10,%rsp
  80007f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800082:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800086:	48 b8 77 02 80 00 00 	movabs $0x800277,%rax
  80008d:	00 00 00 
  800090:	ff d0                	callq  *%rax
  800092:	25 ff 03 00 00       	and    $0x3ff,%eax
  800097:	48 98                	cltq   
  800099:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8000a0:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8000a7:	00 00 00 
  8000aa:	48 01 c2             	add    %rax,%rdx
  8000ad:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8000b4:	00 00 00 
  8000b7:	48 89 10             	mov    %rdx,(%rax)
  8000ba:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8000be:	7e 14                	jle    8000d4 <libmain+0x5d>
  8000c0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8000c4:	48 8b 10             	mov    (%rax),%rdx
  8000c7:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  8000ce:	00 00 00 
  8000d1:	48 89 10             	mov    %rdx,(%rax)
  8000d4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8000d8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8000db:	48 89 d6             	mov    %rdx,%rsi
  8000de:	89 c7                	mov    %eax,%edi
  8000e0:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8000e7:	00 00 00 
  8000ea:	ff d0                	callq  *%rax
  8000ec:	48 b8 fa 00 80 00 00 	movabs $0x8000fa,%rax
  8000f3:	00 00 00 
  8000f6:	ff d0                	callq  *%rax
  8000f8:	c9                   	leaveq 
  8000f9:	c3                   	retq   

00000000008000fa <exit>:
  8000fa:	55                   	push   %rbp
  8000fb:	48 89 e5             	mov    %rsp,%rbp
  8000fe:	48 b8 12 0b 80 00 00 	movabs $0x800b12,%rax
  800105:	00 00 00 
  800108:	ff d0                	callq  *%rax
  80010a:	bf 00 00 00 00       	mov    $0x0,%edi
  80010f:	48 b8 33 02 80 00 00 	movabs $0x800233,%rax
  800116:	00 00 00 
  800119:	ff d0                	callq  *%rax
  80011b:	5d                   	pop    %rbp
  80011c:	c3                   	retq   

000000000080011d <syscall>:
  80011d:	55                   	push   %rbp
  80011e:	48 89 e5             	mov    %rsp,%rbp
  800121:	53                   	push   %rbx
  800122:	48 83 ec 48          	sub    $0x48,%rsp
  800126:	89 7d dc             	mov    %edi,-0x24(%rbp)
  800129:	89 75 d8             	mov    %esi,-0x28(%rbp)
  80012c:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  800130:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  800134:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  800138:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  80013c:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80013f:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  800143:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  800147:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  80014b:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  80014f:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  800153:	4c 89 c3             	mov    %r8,%rbx
  800156:	cd 30                	int    $0x30
  800158:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80015c:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800160:	74 3e                	je     8001a0 <syscall+0x83>
  800162:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  800167:	7e 37                	jle    8001a0 <syscall+0x83>
  800169:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80016d:	8b 45 dc             	mov    -0x24(%rbp),%eax
  800170:	49 89 d0             	mov    %rdx,%r8
  800173:	89 c1                	mov    %eax,%ecx
  800175:	48 ba 2f 40 80 00 00 	movabs $0x80402f,%rdx
  80017c:	00 00 00 
  80017f:	be 24 00 00 00       	mov    $0x24,%esi
  800184:	48 bf 4c 40 80 00 00 	movabs $0x80404c,%rdi
  80018b:	00 00 00 
  80018e:	b8 00 00 00 00       	mov    $0x0,%eax
  800193:	49 b9 84 28 80 00 00 	movabs $0x802884,%r9
  80019a:	00 00 00 
  80019d:	41 ff d1             	callq  *%r9
  8001a0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8001a4:	48 83 c4 48          	add    $0x48,%rsp
  8001a8:	5b                   	pop    %rbx
  8001a9:	5d                   	pop    %rbp
  8001aa:	c3                   	retq   

00000000008001ab <sys_cputs>:
  8001ab:	55                   	push   %rbp
  8001ac:	48 89 e5             	mov    %rsp,%rbp
  8001af:	48 83 ec 20          	sub    $0x20,%rsp
  8001b3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8001b7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8001bb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8001bf:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8001c3:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8001ca:	00 
  8001cb:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8001d1:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8001d7:	48 89 d1             	mov    %rdx,%rcx
  8001da:	48 89 c2             	mov    %rax,%rdx
  8001dd:	be 00 00 00 00       	mov    $0x0,%esi
  8001e2:	bf 00 00 00 00       	mov    $0x0,%edi
  8001e7:	48 b8 1d 01 80 00 00 	movabs $0x80011d,%rax
  8001ee:	00 00 00 
  8001f1:	ff d0                	callq  *%rax
  8001f3:	c9                   	leaveq 
  8001f4:	c3                   	retq   

00000000008001f5 <sys_cgetc>:
  8001f5:	55                   	push   %rbp
  8001f6:	48 89 e5             	mov    %rsp,%rbp
  8001f9:	48 83 ec 10          	sub    $0x10,%rsp
  8001fd:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  800204:	00 
  800205:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80020b:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  800211:	b9 00 00 00 00       	mov    $0x0,%ecx
  800216:	ba 00 00 00 00       	mov    $0x0,%edx
  80021b:	be 00 00 00 00       	mov    $0x0,%esi
  800220:	bf 01 00 00 00       	mov    $0x1,%edi
  800225:	48 b8 1d 01 80 00 00 	movabs $0x80011d,%rax
  80022c:	00 00 00 
  80022f:	ff d0                	callq  *%rax
  800231:	c9                   	leaveq 
  800232:	c3                   	retq   

0000000000800233 <sys_env_destroy>:
  800233:	55                   	push   %rbp
  800234:	48 89 e5             	mov    %rsp,%rbp
  800237:	48 83 ec 10          	sub    $0x10,%rsp
  80023b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80023e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800241:	48 98                	cltq   
  800243:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80024a:	00 
  80024b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  800251:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  800257:	b9 00 00 00 00       	mov    $0x0,%ecx
  80025c:	48 89 c2             	mov    %rax,%rdx
  80025f:	be 01 00 00 00       	mov    $0x1,%esi
  800264:	bf 03 00 00 00       	mov    $0x3,%edi
  800269:	48 b8 1d 01 80 00 00 	movabs $0x80011d,%rax
  800270:	00 00 00 
  800273:	ff d0                	callq  *%rax
  800275:	c9                   	leaveq 
  800276:	c3                   	retq   

0000000000800277 <sys_getenvid>:
  800277:	55                   	push   %rbp
  800278:	48 89 e5             	mov    %rsp,%rbp
  80027b:	48 83 ec 10          	sub    $0x10,%rsp
  80027f:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  800286:	00 
  800287:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80028d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  800293:	b9 00 00 00 00       	mov    $0x0,%ecx
  800298:	ba 00 00 00 00       	mov    $0x0,%edx
  80029d:	be 00 00 00 00       	mov    $0x0,%esi
  8002a2:	bf 02 00 00 00       	mov    $0x2,%edi
  8002a7:	48 b8 1d 01 80 00 00 	movabs $0x80011d,%rax
  8002ae:	00 00 00 
  8002b1:	ff d0                	callq  *%rax
  8002b3:	c9                   	leaveq 
  8002b4:	c3                   	retq   

00000000008002b5 <sys_yield>:
  8002b5:	55                   	push   %rbp
  8002b6:	48 89 e5             	mov    %rsp,%rbp
  8002b9:	48 83 ec 10          	sub    $0x10,%rsp
  8002bd:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8002c4:	00 
  8002c5:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8002cb:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8002d1:	b9 00 00 00 00       	mov    $0x0,%ecx
  8002d6:	ba 00 00 00 00       	mov    $0x0,%edx
  8002db:	be 00 00 00 00       	mov    $0x0,%esi
  8002e0:	bf 0b 00 00 00       	mov    $0xb,%edi
  8002e5:	48 b8 1d 01 80 00 00 	movabs $0x80011d,%rax
  8002ec:	00 00 00 
  8002ef:	ff d0                	callq  *%rax
  8002f1:	c9                   	leaveq 
  8002f2:	c3                   	retq   

00000000008002f3 <sys_page_alloc>:
  8002f3:	55                   	push   %rbp
  8002f4:	48 89 e5             	mov    %rsp,%rbp
  8002f7:	48 83 ec 20          	sub    $0x20,%rsp
  8002fb:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8002fe:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800302:	89 55 f8             	mov    %edx,-0x8(%rbp)
  800305:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800308:	48 63 c8             	movslq %eax,%rcx
  80030b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80030f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800312:	48 98                	cltq   
  800314:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80031b:	00 
  80031c:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  800322:	49 89 c8             	mov    %rcx,%r8
  800325:	48 89 d1             	mov    %rdx,%rcx
  800328:	48 89 c2             	mov    %rax,%rdx
  80032b:	be 01 00 00 00       	mov    $0x1,%esi
  800330:	bf 04 00 00 00       	mov    $0x4,%edi
  800335:	48 b8 1d 01 80 00 00 	movabs $0x80011d,%rax
  80033c:	00 00 00 
  80033f:	ff d0                	callq  *%rax
  800341:	c9                   	leaveq 
  800342:	c3                   	retq   

0000000000800343 <sys_page_map>:
  800343:	55                   	push   %rbp
  800344:	48 89 e5             	mov    %rsp,%rbp
  800347:	48 83 ec 30          	sub    $0x30,%rsp
  80034b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80034e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800352:	89 55 f8             	mov    %edx,-0x8(%rbp)
  800355:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  800359:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  80035d:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  800360:	48 63 c8             	movslq %eax,%rcx
  800363:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  800367:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80036a:	48 63 f0             	movslq %eax,%rsi
  80036d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800371:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800374:	48 98                	cltq   
  800376:	48 89 0c 24          	mov    %rcx,(%rsp)
  80037a:	49 89 f9             	mov    %rdi,%r9
  80037d:	49 89 f0             	mov    %rsi,%r8
  800380:	48 89 d1             	mov    %rdx,%rcx
  800383:	48 89 c2             	mov    %rax,%rdx
  800386:	be 01 00 00 00       	mov    $0x1,%esi
  80038b:	bf 05 00 00 00       	mov    $0x5,%edi
  800390:	48 b8 1d 01 80 00 00 	movabs $0x80011d,%rax
  800397:	00 00 00 
  80039a:	ff d0                	callq  *%rax
  80039c:	c9                   	leaveq 
  80039d:	c3                   	retq   

000000000080039e <sys_page_unmap>:
  80039e:	55                   	push   %rbp
  80039f:	48 89 e5             	mov    %rsp,%rbp
  8003a2:	48 83 ec 20          	sub    $0x20,%rsp
  8003a6:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8003a9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8003ad:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8003b1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8003b4:	48 98                	cltq   
  8003b6:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8003bd:	00 
  8003be:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8003c4:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8003ca:	48 89 d1             	mov    %rdx,%rcx
  8003cd:	48 89 c2             	mov    %rax,%rdx
  8003d0:	be 01 00 00 00       	mov    $0x1,%esi
  8003d5:	bf 06 00 00 00       	mov    $0x6,%edi
  8003da:	48 b8 1d 01 80 00 00 	movabs $0x80011d,%rax
  8003e1:	00 00 00 
  8003e4:	ff d0                	callq  *%rax
  8003e6:	c9                   	leaveq 
  8003e7:	c3                   	retq   

00000000008003e8 <sys_env_set_status>:
  8003e8:	55                   	push   %rbp
  8003e9:	48 89 e5             	mov    %rsp,%rbp
  8003ec:	48 83 ec 10          	sub    $0x10,%rsp
  8003f0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8003f3:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8003f6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8003f9:	48 63 d0             	movslq %eax,%rdx
  8003fc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8003ff:	48 98                	cltq   
  800401:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  800408:	00 
  800409:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80040f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  800415:	48 89 d1             	mov    %rdx,%rcx
  800418:	48 89 c2             	mov    %rax,%rdx
  80041b:	be 01 00 00 00       	mov    $0x1,%esi
  800420:	bf 08 00 00 00       	mov    $0x8,%edi
  800425:	48 b8 1d 01 80 00 00 	movabs $0x80011d,%rax
  80042c:	00 00 00 
  80042f:	ff d0                	callq  *%rax
  800431:	c9                   	leaveq 
  800432:	c3                   	retq   

0000000000800433 <sys_env_set_trapframe>:
  800433:	55                   	push   %rbp
  800434:	48 89 e5             	mov    %rsp,%rbp
  800437:	48 83 ec 20          	sub    $0x20,%rsp
  80043b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80043e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800442:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800446:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800449:	48 98                	cltq   
  80044b:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  800452:	00 
  800453:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  800459:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80045f:	48 89 d1             	mov    %rdx,%rcx
  800462:	48 89 c2             	mov    %rax,%rdx
  800465:	be 01 00 00 00       	mov    $0x1,%esi
  80046a:	bf 09 00 00 00       	mov    $0x9,%edi
  80046f:	48 b8 1d 01 80 00 00 	movabs $0x80011d,%rax
  800476:	00 00 00 
  800479:	ff d0                	callq  *%rax
  80047b:	c9                   	leaveq 
  80047c:	c3                   	retq   

000000000080047d <sys_env_set_pgfault_upcall>:
  80047d:	55                   	push   %rbp
  80047e:	48 89 e5             	mov    %rsp,%rbp
  800481:	48 83 ec 20          	sub    $0x20,%rsp
  800485:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800488:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80048c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800490:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800493:	48 98                	cltq   
  800495:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80049c:	00 
  80049d:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8004a3:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8004a9:	48 89 d1             	mov    %rdx,%rcx
  8004ac:	48 89 c2             	mov    %rax,%rdx
  8004af:	be 01 00 00 00       	mov    $0x1,%esi
  8004b4:	bf 0a 00 00 00       	mov    $0xa,%edi
  8004b9:	48 b8 1d 01 80 00 00 	movabs $0x80011d,%rax
  8004c0:	00 00 00 
  8004c3:	ff d0                	callq  *%rax
  8004c5:	c9                   	leaveq 
  8004c6:	c3                   	retq   

00000000008004c7 <sys_ipc_try_send>:
  8004c7:	55                   	push   %rbp
  8004c8:	48 89 e5             	mov    %rsp,%rbp
  8004cb:	48 83 ec 20          	sub    $0x20,%rsp
  8004cf:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8004d2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8004d6:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8004da:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  8004dd:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8004e0:	48 63 f0             	movslq %eax,%rsi
  8004e3:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8004e7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8004ea:	48 98                	cltq   
  8004ec:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8004f0:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8004f7:	00 
  8004f8:	49 89 f1             	mov    %rsi,%r9
  8004fb:	49 89 c8             	mov    %rcx,%r8
  8004fe:	48 89 d1             	mov    %rdx,%rcx
  800501:	48 89 c2             	mov    %rax,%rdx
  800504:	be 00 00 00 00       	mov    $0x0,%esi
  800509:	bf 0c 00 00 00       	mov    $0xc,%edi
  80050e:	48 b8 1d 01 80 00 00 	movabs $0x80011d,%rax
  800515:	00 00 00 
  800518:	ff d0                	callq  *%rax
  80051a:	c9                   	leaveq 
  80051b:	c3                   	retq   

000000000080051c <sys_ipc_recv>:
  80051c:	55                   	push   %rbp
  80051d:	48 89 e5             	mov    %rsp,%rbp
  800520:	48 83 ec 10          	sub    $0x10,%rsp
  800524:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800528:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80052c:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  800533:	00 
  800534:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80053a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  800540:	b9 00 00 00 00       	mov    $0x0,%ecx
  800545:	48 89 c2             	mov    %rax,%rdx
  800548:	be 01 00 00 00       	mov    $0x1,%esi
  80054d:	bf 0d 00 00 00       	mov    $0xd,%edi
  800552:	48 b8 1d 01 80 00 00 	movabs $0x80011d,%rax
  800559:	00 00 00 
  80055c:	ff d0                	callq  *%rax
  80055e:	c9                   	leaveq 
  80055f:	c3                   	retq   

0000000000800560 <sys_time_msec>:
  800560:	55                   	push   %rbp
  800561:	48 89 e5             	mov    %rsp,%rbp
  800564:	48 83 ec 10          	sub    $0x10,%rsp
  800568:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80056f:	00 
  800570:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  800576:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80057c:	b9 00 00 00 00       	mov    $0x0,%ecx
  800581:	ba 00 00 00 00       	mov    $0x0,%edx
  800586:	be 00 00 00 00       	mov    $0x0,%esi
  80058b:	bf 0e 00 00 00       	mov    $0xe,%edi
  800590:	48 b8 1d 01 80 00 00 	movabs $0x80011d,%rax
  800597:	00 00 00 
  80059a:	ff d0                	callq  *%rax
  80059c:	c9                   	leaveq 
  80059d:	c3                   	retq   

000000000080059e <sys_net_transmit>:
  80059e:	55                   	push   %rbp
  80059f:	48 89 e5             	mov    %rsp,%rbp
  8005a2:	48 83 ec 20          	sub    $0x20,%rsp
  8005a6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8005aa:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8005ad:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8005b0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8005b4:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8005bb:	00 
  8005bc:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8005c2:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8005c8:	48 89 d1             	mov    %rdx,%rcx
  8005cb:	48 89 c2             	mov    %rax,%rdx
  8005ce:	be 00 00 00 00       	mov    $0x0,%esi
  8005d3:	bf 0f 00 00 00       	mov    $0xf,%edi
  8005d8:	48 b8 1d 01 80 00 00 	movabs $0x80011d,%rax
  8005df:	00 00 00 
  8005e2:	ff d0                	callq  *%rax
  8005e4:	c9                   	leaveq 
  8005e5:	c3                   	retq   

00000000008005e6 <sys_net_receive>:
  8005e6:	55                   	push   %rbp
  8005e7:	48 89 e5             	mov    %rsp,%rbp
  8005ea:	48 83 ec 20          	sub    $0x20,%rsp
  8005ee:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8005f2:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8005f5:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8005f8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8005fc:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  800603:	00 
  800604:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80060a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  800610:	48 89 d1             	mov    %rdx,%rcx
  800613:	48 89 c2             	mov    %rax,%rdx
  800616:	be 00 00 00 00       	mov    $0x0,%esi
  80061b:	bf 10 00 00 00       	mov    $0x10,%edi
  800620:	48 b8 1d 01 80 00 00 	movabs $0x80011d,%rax
  800627:	00 00 00 
  80062a:	ff d0                	callq  *%rax
  80062c:	c9                   	leaveq 
  80062d:	c3                   	retq   

000000000080062e <sys_ept_map>:
  80062e:	55                   	push   %rbp
  80062f:	48 89 e5             	mov    %rsp,%rbp
  800632:	48 83 ec 30          	sub    $0x30,%rsp
  800636:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800639:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80063d:	89 55 f8             	mov    %edx,-0x8(%rbp)
  800640:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  800644:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  800648:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80064b:	48 63 c8             	movslq %eax,%rcx
  80064e:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  800652:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800655:	48 63 f0             	movslq %eax,%rsi
  800658:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80065c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80065f:	48 98                	cltq   
  800661:	48 89 0c 24          	mov    %rcx,(%rsp)
  800665:	49 89 f9             	mov    %rdi,%r9
  800668:	49 89 f0             	mov    %rsi,%r8
  80066b:	48 89 d1             	mov    %rdx,%rcx
  80066e:	48 89 c2             	mov    %rax,%rdx
  800671:	be 00 00 00 00       	mov    $0x0,%esi
  800676:	bf 11 00 00 00       	mov    $0x11,%edi
  80067b:	48 b8 1d 01 80 00 00 	movabs $0x80011d,%rax
  800682:	00 00 00 
  800685:	ff d0                	callq  *%rax
  800687:	c9                   	leaveq 
  800688:	c3                   	retq   

0000000000800689 <sys_env_mkguest>:
  800689:	55                   	push   %rbp
  80068a:	48 89 e5             	mov    %rsp,%rbp
  80068d:	48 83 ec 20          	sub    $0x20,%rsp
  800691:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800695:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800699:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80069d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8006a1:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8006a8:	00 
  8006a9:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8006af:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8006b5:	48 89 d1             	mov    %rdx,%rcx
  8006b8:	48 89 c2             	mov    %rax,%rdx
  8006bb:	be 00 00 00 00       	mov    $0x0,%esi
  8006c0:	bf 12 00 00 00       	mov    $0x12,%edi
  8006c5:	48 b8 1d 01 80 00 00 	movabs $0x80011d,%rax
  8006cc:	00 00 00 
  8006cf:	ff d0                	callq  *%rax
  8006d1:	c9                   	leaveq 
  8006d2:	c3                   	retq   

00000000008006d3 <sys_vmx_list_vms>:
  8006d3:	55                   	push   %rbp
  8006d4:	48 89 e5             	mov    %rsp,%rbp
  8006d7:	48 83 ec 10          	sub    $0x10,%rsp
  8006db:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8006e2:	00 
  8006e3:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8006e9:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8006ef:	b9 00 00 00 00       	mov    $0x0,%ecx
  8006f4:	ba 00 00 00 00       	mov    $0x0,%edx
  8006f9:	be 00 00 00 00       	mov    $0x0,%esi
  8006fe:	bf 13 00 00 00       	mov    $0x13,%edi
  800703:	48 b8 1d 01 80 00 00 	movabs $0x80011d,%rax
  80070a:	00 00 00 
  80070d:	ff d0                	callq  *%rax
  80070f:	c9                   	leaveq 
  800710:	c3                   	retq   

0000000000800711 <sys_vmx_sel_resume>:
  800711:	55                   	push   %rbp
  800712:	48 89 e5             	mov    %rsp,%rbp
  800715:	48 83 ec 10          	sub    $0x10,%rsp
  800719:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80071c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80071f:	48 98                	cltq   
  800721:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  800728:	00 
  800729:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80072f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  800735:	b9 00 00 00 00       	mov    $0x0,%ecx
  80073a:	48 89 c2             	mov    %rax,%rdx
  80073d:	be 00 00 00 00       	mov    $0x0,%esi
  800742:	bf 14 00 00 00       	mov    $0x14,%edi
  800747:	48 b8 1d 01 80 00 00 	movabs $0x80011d,%rax
  80074e:	00 00 00 
  800751:	ff d0                	callq  *%rax
  800753:	c9                   	leaveq 
  800754:	c3                   	retq   

0000000000800755 <sys_vmx_get_vmdisk_number>:
  800755:	55                   	push   %rbp
  800756:	48 89 e5             	mov    %rsp,%rbp
  800759:	48 83 ec 10          	sub    $0x10,%rsp
  80075d:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  800764:	00 
  800765:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80076b:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  800771:	b9 00 00 00 00       	mov    $0x0,%ecx
  800776:	ba 00 00 00 00       	mov    $0x0,%edx
  80077b:	be 00 00 00 00       	mov    $0x0,%esi
  800780:	bf 15 00 00 00       	mov    $0x15,%edi
  800785:	48 b8 1d 01 80 00 00 	movabs $0x80011d,%rax
  80078c:	00 00 00 
  80078f:	ff d0                	callq  *%rax
  800791:	c9                   	leaveq 
  800792:	c3                   	retq   

0000000000800793 <sys_vmx_incr_vmdisk_number>:
  800793:	55                   	push   %rbp
  800794:	48 89 e5             	mov    %rsp,%rbp
  800797:	48 83 ec 10          	sub    $0x10,%rsp
  80079b:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8007a2:	00 
  8007a3:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8007a9:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8007af:	b9 00 00 00 00       	mov    $0x0,%ecx
  8007b4:	ba 00 00 00 00       	mov    $0x0,%edx
  8007b9:	be 00 00 00 00       	mov    $0x0,%esi
  8007be:	bf 16 00 00 00       	mov    $0x16,%edi
  8007c3:	48 b8 1d 01 80 00 00 	movabs $0x80011d,%rax
  8007ca:	00 00 00 
  8007cd:	ff d0                	callq  *%rax
  8007cf:	c9                   	leaveq 
  8007d0:	c3                   	retq   

00000000008007d1 <fd2num>:
  8007d1:	55                   	push   %rbp
  8007d2:	48 89 e5             	mov    %rsp,%rbp
  8007d5:	48 83 ec 08          	sub    $0x8,%rsp
  8007d9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8007dd:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8007e1:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  8007e8:	ff ff ff 
  8007eb:	48 01 d0             	add    %rdx,%rax
  8007ee:	48 c1 e8 0c          	shr    $0xc,%rax
  8007f2:	c9                   	leaveq 
  8007f3:	c3                   	retq   

00000000008007f4 <fd2data>:
  8007f4:	55                   	push   %rbp
  8007f5:	48 89 e5             	mov    %rsp,%rbp
  8007f8:	48 83 ec 08          	sub    $0x8,%rsp
  8007fc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800800:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800804:	48 89 c7             	mov    %rax,%rdi
  800807:	48 b8 d1 07 80 00 00 	movabs $0x8007d1,%rax
  80080e:	00 00 00 
  800811:	ff d0                	callq  *%rax
  800813:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  800819:	48 c1 e0 0c          	shl    $0xc,%rax
  80081d:	c9                   	leaveq 
  80081e:	c3                   	retq   

000000000080081f <fd_alloc>:
  80081f:	55                   	push   %rbp
  800820:	48 89 e5             	mov    %rsp,%rbp
  800823:	48 83 ec 18          	sub    $0x18,%rsp
  800827:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80082b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800832:	eb 6b                	jmp    80089f <fd_alloc+0x80>
  800834:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800837:	48 98                	cltq   
  800839:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  80083f:	48 c1 e0 0c          	shl    $0xc,%rax
  800843:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  800847:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80084b:	48 c1 e8 15          	shr    $0x15,%rax
  80084f:	48 89 c2             	mov    %rax,%rdx
  800852:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  800859:	01 00 00 
  80085c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  800860:	83 e0 01             	and    $0x1,%eax
  800863:	48 85 c0             	test   %rax,%rax
  800866:	74 21                	je     800889 <fd_alloc+0x6a>
  800868:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80086c:	48 c1 e8 0c          	shr    $0xc,%rax
  800870:	48 89 c2             	mov    %rax,%rdx
  800873:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80087a:	01 00 00 
  80087d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  800881:	83 e0 01             	and    $0x1,%eax
  800884:	48 85 c0             	test   %rax,%rax
  800887:	75 12                	jne    80089b <fd_alloc+0x7c>
  800889:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80088d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800891:	48 89 10             	mov    %rdx,(%rax)
  800894:	b8 00 00 00 00       	mov    $0x0,%eax
  800899:	eb 1a                	jmp    8008b5 <fd_alloc+0x96>
  80089b:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80089f:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  8008a3:	7e 8f                	jle    800834 <fd_alloc+0x15>
  8008a5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008a9:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  8008b0:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  8008b5:	c9                   	leaveq 
  8008b6:	c3                   	retq   

00000000008008b7 <fd_lookup>:
  8008b7:	55                   	push   %rbp
  8008b8:	48 89 e5             	mov    %rsp,%rbp
  8008bb:	48 83 ec 20          	sub    $0x20,%rsp
  8008bf:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8008c2:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8008c6:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8008ca:	78 06                	js     8008d2 <fd_lookup+0x1b>
  8008cc:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  8008d0:	7e 07                	jle    8008d9 <fd_lookup+0x22>
  8008d2:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8008d7:	eb 6c                	jmp    800945 <fd_lookup+0x8e>
  8008d9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8008dc:	48 98                	cltq   
  8008de:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  8008e4:	48 c1 e0 0c          	shl    $0xc,%rax
  8008e8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8008ec:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8008f0:	48 c1 e8 15          	shr    $0x15,%rax
  8008f4:	48 89 c2             	mov    %rax,%rdx
  8008f7:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8008fe:	01 00 00 
  800901:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  800905:	83 e0 01             	and    $0x1,%eax
  800908:	48 85 c0             	test   %rax,%rax
  80090b:	74 21                	je     80092e <fd_lookup+0x77>
  80090d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800911:	48 c1 e8 0c          	shr    $0xc,%rax
  800915:	48 89 c2             	mov    %rax,%rdx
  800918:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80091f:	01 00 00 
  800922:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  800926:	83 e0 01             	and    $0x1,%eax
  800929:	48 85 c0             	test   %rax,%rax
  80092c:	75 07                	jne    800935 <fd_lookup+0x7e>
  80092e:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800933:	eb 10                	jmp    800945 <fd_lookup+0x8e>
  800935:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800939:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80093d:	48 89 10             	mov    %rdx,(%rax)
  800940:	b8 00 00 00 00       	mov    $0x0,%eax
  800945:	c9                   	leaveq 
  800946:	c3                   	retq   

0000000000800947 <fd_close>:
  800947:	55                   	push   %rbp
  800948:	48 89 e5             	mov    %rsp,%rbp
  80094b:	48 83 ec 30          	sub    $0x30,%rsp
  80094f:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  800953:	89 f0                	mov    %esi,%eax
  800955:	88 45 d4             	mov    %al,-0x2c(%rbp)
  800958:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80095c:	48 89 c7             	mov    %rax,%rdi
  80095f:	48 b8 d1 07 80 00 00 	movabs $0x8007d1,%rax
  800966:	00 00 00 
  800969:	ff d0                	callq  *%rax
  80096b:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80096f:	48 89 d6             	mov    %rdx,%rsi
  800972:	89 c7                	mov    %eax,%edi
  800974:	48 b8 b7 08 80 00 00 	movabs $0x8008b7,%rax
  80097b:	00 00 00 
  80097e:	ff d0                	callq  *%rax
  800980:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800983:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800987:	78 0a                	js     800993 <fd_close+0x4c>
  800989:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80098d:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  800991:	74 12                	je     8009a5 <fd_close+0x5e>
  800993:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  800997:	74 05                	je     80099e <fd_close+0x57>
  800999:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80099c:	eb 05                	jmp    8009a3 <fd_close+0x5c>
  80099e:	b8 00 00 00 00       	mov    $0x0,%eax
  8009a3:	eb 69                	jmp    800a0e <fd_close+0xc7>
  8009a5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8009a9:	8b 00                	mov    (%rax),%eax
  8009ab:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8009af:	48 89 d6             	mov    %rdx,%rsi
  8009b2:	89 c7                	mov    %eax,%edi
  8009b4:	48 b8 10 0a 80 00 00 	movabs $0x800a10,%rax
  8009bb:	00 00 00 
  8009be:	ff d0                	callq  *%rax
  8009c0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8009c3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8009c7:	78 2a                	js     8009f3 <fd_close+0xac>
  8009c9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009cd:	48 8b 40 20          	mov    0x20(%rax),%rax
  8009d1:	48 85 c0             	test   %rax,%rax
  8009d4:	74 16                	je     8009ec <fd_close+0xa5>
  8009d6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009da:	48 8b 40 20          	mov    0x20(%rax),%rax
  8009de:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8009e2:	48 89 d7             	mov    %rdx,%rdi
  8009e5:	ff d0                	callq  *%rax
  8009e7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8009ea:	eb 07                	jmp    8009f3 <fd_close+0xac>
  8009ec:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8009f3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8009f7:	48 89 c6             	mov    %rax,%rsi
  8009fa:	bf 00 00 00 00       	mov    $0x0,%edi
  8009ff:	48 b8 9e 03 80 00 00 	movabs $0x80039e,%rax
  800a06:	00 00 00 
  800a09:	ff d0                	callq  *%rax
  800a0b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800a0e:	c9                   	leaveq 
  800a0f:	c3                   	retq   

0000000000800a10 <dev_lookup>:
  800a10:	55                   	push   %rbp
  800a11:	48 89 e5             	mov    %rsp,%rbp
  800a14:	48 83 ec 20          	sub    $0x20,%rsp
  800a18:	89 7d ec             	mov    %edi,-0x14(%rbp)
  800a1b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800a1f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800a26:	eb 41                	jmp    800a69 <dev_lookup+0x59>
  800a28:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  800a2f:	00 00 00 
  800a32:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800a35:	48 63 d2             	movslq %edx,%rdx
  800a38:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  800a3c:	8b 00                	mov    (%rax),%eax
  800a3e:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  800a41:	75 22                	jne    800a65 <dev_lookup+0x55>
  800a43:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  800a4a:	00 00 00 
  800a4d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800a50:	48 63 d2             	movslq %edx,%rdx
  800a53:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  800a57:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800a5b:	48 89 10             	mov    %rdx,(%rax)
  800a5e:	b8 00 00 00 00       	mov    $0x0,%eax
  800a63:	eb 60                	jmp    800ac5 <dev_lookup+0xb5>
  800a65:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800a69:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  800a70:	00 00 00 
  800a73:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800a76:	48 63 d2             	movslq %edx,%rdx
  800a79:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  800a7d:	48 85 c0             	test   %rax,%rax
  800a80:	75 a6                	jne    800a28 <dev_lookup+0x18>
  800a82:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  800a89:	00 00 00 
  800a8c:	48 8b 00             	mov    (%rax),%rax
  800a8f:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  800a95:	8b 55 ec             	mov    -0x14(%rbp),%edx
  800a98:	89 c6                	mov    %eax,%esi
  800a9a:	48 bf 60 40 80 00 00 	movabs $0x804060,%rdi
  800aa1:	00 00 00 
  800aa4:	b8 00 00 00 00       	mov    $0x0,%eax
  800aa9:	48 b9 bd 2a 80 00 00 	movabs $0x802abd,%rcx
  800ab0:	00 00 00 
  800ab3:	ff d1                	callq  *%rcx
  800ab5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800ab9:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  800ac0:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800ac5:	c9                   	leaveq 
  800ac6:	c3                   	retq   

0000000000800ac7 <close>:
  800ac7:	55                   	push   %rbp
  800ac8:	48 89 e5             	mov    %rsp,%rbp
  800acb:	48 83 ec 20          	sub    $0x20,%rsp
  800acf:	89 7d ec             	mov    %edi,-0x14(%rbp)
  800ad2:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  800ad6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  800ad9:	48 89 d6             	mov    %rdx,%rsi
  800adc:	89 c7                	mov    %eax,%edi
  800ade:	48 b8 b7 08 80 00 00 	movabs $0x8008b7,%rax
  800ae5:	00 00 00 
  800ae8:	ff d0                	callq  *%rax
  800aea:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800aed:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800af1:	79 05                	jns    800af8 <close+0x31>
  800af3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800af6:	eb 18                	jmp    800b10 <close+0x49>
  800af8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800afc:	be 01 00 00 00       	mov    $0x1,%esi
  800b01:	48 89 c7             	mov    %rax,%rdi
  800b04:	48 b8 47 09 80 00 00 	movabs $0x800947,%rax
  800b0b:	00 00 00 
  800b0e:	ff d0                	callq  *%rax
  800b10:	c9                   	leaveq 
  800b11:	c3                   	retq   

0000000000800b12 <close_all>:
  800b12:	55                   	push   %rbp
  800b13:	48 89 e5             	mov    %rsp,%rbp
  800b16:	48 83 ec 10          	sub    $0x10,%rsp
  800b1a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800b21:	eb 15                	jmp    800b38 <close_all+0x26>
  800b23:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800b26:	89 c7                	mov    %eax,%edi
  800b28:	48 b8 c7 0a 80 00 00 	movabs $0x800ac7,%rax
  800b2f:	00 00 00 
  800b32:	ff d0                	callq  *%rax
  800b34:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800b38:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  800b3c:	7e e5                	jle    800b23 <close_all+0x11>
  800b3e:	c9                   	leaveq 
  800b3f:	c3                   	retq   

0000000000800b40 <dup>:
  800b40:	55                   	push   %rbp
  800b41:	48 89 e5             	mov    %rsp,%rbp
  800b44:	48 83 ec 40          	sub    $0x40,%rsp
  800b48:	89 7d cc             	mov    %edi,-0x34(%rbp)
  800b4b:	89 75 c8             	mov    %esi,-0x38(%rbp)
  800b4e:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  800b52:	8b 45 cc             	mov    -0x34(%rbp),%eax
  800b55:	48 89 d6             	mov    %rdx,%rsi
  800b58:	89 c7                	mov    %eax,%edi
  800b5a:	48 b8 b7 08 80 00 00 	movabs $0x8008b7,%rax
  800b61:	00 00 00 
  800b64:	ff d0                	callq  *%rax
  800b66:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800b69:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800b6d:	79 08                	jns    800b77 <dup+0x37>
  800b6f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800b72:	e9 70 01 00 00       	jmpq   800ce7 <dup+0x1a7>
  800b77:	8b 45 c8             	mov    -0x38(%rbp),%eax
  800b7a:	89 c7                	mov    %eax,%edi
  800b7c:	48 b8 c7 0a 80 00 00 	movabs $0x800ac7,%rax
  800b83:	00 00 00 
  800b86:	ff d0                	callq  *%rax
  800b88:	8b 45 c8             	mov    -0x38(%rbp),%eax
  800b8b:	48 98                	cltq   
  800b8d:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  800b93:	48 c1 e0 0c          	shl    $0xc,%rax
  800b97:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  800b9b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800b9f:	48 89 c7             	mov    %rax,%rdi
  800ba2:	48 b8 f4 07 80 00 00 	movabs $0x8007f4,%rax
  800ba9:	00 00 00 
  800bac:	ff d0                	callq  *%rax
  800bae:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800bb2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800bb6:	48 89 c7             	mov    %rax,%rdi
  800bb9:	48 b8 f4 07 80 00 00 	movabs $0x8007f4,%rax
  800bc0:	00 00 00 
  800bc3:	ff d0                	callq  *%rax
  800bc5:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  800bc9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800bcd:	48 c1 e8 15          	shr    $0x15,%rax
  800bd1:	48 89 c2             	mov    %rax,%rdx
  800bd4:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  800bdb:	01 00 00 
  800bde:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  800be2:	83 e0 01             	and    $0x1,%eax
  800be5:	48 85 c0             	test   %rax,%rax
  800be8:	74 73                	je     800c5d <dup+0x11d>
  800bea:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800bee:	48 c1 e8 0c          	shr    $0xc,%rax
  800bf2:	48 89 c2             	mov    %rax,%rdx
  800bf5:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  800bfc:	01 00 00 
  800bff:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  800c03:	83 e0 01             	and    $0x1,%eax
  800c06:	48 85 c0             	test   %rax,%rax
  800c09:	74 52                	je     800c5d <dup+0x11d>
  800c0b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c0f:	48 c1 e8 0c          	shr    $0xc,%rax
  800c13:	48 89 c2             	mov    %rax,%rdx
  800c16:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  800c1d:	01 00 00 
  800c20:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  800c24:	25 07 0e 00 00       	and    $0xe07,%eax
  800c29:	89 c1                	mov    %eax,%ecx
  800c2b:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  800c2f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c33:	41 89 c8             	mov    %ecx,%r8d
  800c36:	48 89 d1             	mov    %rdx,%rcx
  800c39:	ba 00 00 00 00       	mov    $0x0,%edx
  800c3e:	48 89 c6             	mov    %rax,%rsi
  800c41:	bf 00 00 00 00       	mov    $0x0,%edi
  800c46:	48 b8 43 03 80 00 00 	movabs $0x800343,%rax
  800c4d:	00 00 00 
  800c50:	ff d0                	callq  *%rax
  800c52:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800c55:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800c59:	79 02                	jns    800c5d <dup+0x11d>
  800c5b:	eb 57                	jmp    800cb4 <dup+0x174>
  800c5d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800c61:	48 c1 e8 0c          	shr    $0xc,%rax
  800c65:	48 89 c2             	mov    %rax,%rdx
  800c68:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  800c6f:	01 00 00 
  800c72:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  800c76:	25 07 0e 00 00       	and    $0xe07,%eax
  800c7b:	89 c1                	mov    %eax,%ecx
  800c7d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800c81:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800c85:	41 89 c8             	mov    %ecx,%r8d
  800c88:	48 89 d1             	mov    %rdx,%rcx
  800c8b:	ba 00 00 00 00       	mov    $0x0,%edx
  800c90:	48 89 c6             	mov    %rax,%rsi
  800c93:	bf 00 00 00 00       	mov    $0x0,%edi
  800c98:	48 b8 43 03 80 00 00 	movabs $0x800343,%rax
  800c9f:	00 00 00 
  800ca2:	ff d0                	callq  *%rax
  800ca4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800ca7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800cab:	79 02                	jns    800caf <dup+0x16f>
  800cad:	eb 05                	jmp    800cb4 <dup+0x174>
  800caf:	8b 45 c8             	mov    -0x38(%rbp),%eax
  800cb2:	eb 33                	jmp    800ce7 <dup+0x1a7>
  800cb4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800cb8:	48 89 c6             	mov    %rax,%rsi
  800cbb:	bf 00 00 00 00       	mov    $0x0,%edi
  800cc0:	48 b8 9e 03 80 00 00 	movabs $0x80039e,%rax
  800cc7:	00 00 00 
  800cca:	ff d0                	callq  *%rax
  800ccc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800cd0:	48 89 c6             	mov    %rax,%rsi
  800cd3:	bf 00 00 00 00       	mov    $0x0,%edi
  800cd8:	48 b8 9e 03 80 00 00 	movabs $0x80039e,%rax
  800cdf:	00 00 00 
  800ce2:	ff d0                	callq  *%rax
  800ce4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800ce7:	c9                   	leaveq 
  800ce8:	c3                   	retq   

0000000000800ce9 <read>:
  800ce9:	55                   	push   %rbp
  800cea:	48 89 e5             	mov    %rsp,%rbp
  800ced:	48 83 ec 40          	sub    $0x40,%rsp
  800cf1:	89 7d dc             	mov    %edi,-0x24(%rbp)
  800cf4:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  800cf8:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  800cfc:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  800d00:	8b 45 dc             	mov    -0x24(%rbp),%eax
  800d03:	48 89 d6             	mov    %rdx,%rsi
  800d06:	89 c7                	mov    %eax,%edi
  800d08:	48 b8 b7 08 80 00 00 	movabs $0x8008b7,%rax
  800d0f:	00 00 00 
  800d12:	ff d0                	callq  *%rax
  800d14:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800d17:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800d1b:	78 24                	js     800d41 <read+0x58>
  800d1d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800d21:	8b 00                	mov    (%rax),%eax
  800d23:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  800d27:	48 89 d6             	mov    %rdx,%rsi
  800d2a:	89 c7                	mov    %eax,%edi
  800d2c:	48 b8 10 0a 80 00 00 	movabs $0x800a10,%rax
  800d33:	00 00 00 
  800d36:	ff d0                	callq  *%rax
  800d38:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800d3b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800d3f:	79 05                	jns    800d46 <read+0x5d>
  800d41:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800d44:	eb 76                	jmp    800dbc <read+0xd3>
  800d46:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800d4a:	8b 40 08             	mov    0x8(%rax),%eax
  800d4d:	83 e0 03             	and    $0x3,%eax
  800d50:	83 f8 01             	cmp    $0x1,%eax
  800d53:	75 3a                	jne    800d8f <read+0xa6>
  800d55:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  800d5c:	00 00 00 
  800d5f:	48 8b 00             	mov    (%rax),%rax
  800d62:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  800d68:	8b 55 dc             	mov    -0x24(%rbp),%edx
  800d6b:	89 c6                	mov    %eax,%esi
  800d6d:	48 bf 7f 40 80 00 00 	movabs $0x80407f,%rdi
  800d74:	00 00 00 
  800d77:	b8 00 00 00 00       	mov    $0x0,%eax
  800d7c:	48 b9 bd 2a 80 00 00 	movabs $0x802abd,%rcx
  800d83:	00 00 00 
  800d86:	ff d1                	callq  *%rcx
  800d88:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800d8d:	eb 2d                	jmp    800dbc <read+0xd3>
  800d8f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800d93:	48 8b 40 10          	mov    0x10(%rax),%rax
  800d97:	48 85 c0             	test   %rax,%rax
  800d9a:	75 07                	jne    800da3 <read+0xba>
  800d9c:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  800da1:	eb 19                	jmp    800dbc <read+0xd3>
  800da3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800da7:	48 8b 40 10          	mov    0x10(%rax),%rax
  800dab:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  800daf:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800db3:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  800db7:	48 89 cf             	mov    %rcx,%rdi
  800dba:	ff d0                	callq  *%rax
  800dbc:	c9                   	leaveq 
  800dbd:	c3                   	retq   

0000000000800dbe <readn>:
  800dbe:	55                   	push   %rbp
  800dbf:	48 89 e5             	mov    %rsp,%rbp
  800dc2:	48 83 ec 30          	sub    $0x30,%rsp
  800dc6:	89 7d ec             	mov    %edi,-0x14(%rbp)
  800dc9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800dcd:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  800dd1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800dd8:	eb 49                	jmp    800e23 <readn+0x65>
  800dda:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800ddd:	48 98                	cltq   
  800ddf:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  800de3:	48 29 c2             	sub    %rax,%rdx
  800de6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800de9:	48 63 c8             	movslq %eax,%rcx
  800dec:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800df0:	48 01 c1             	add    %rax,%rcx
  800df3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  800df6:	48 89 ce             	mov    %rcx,%rsi
  800df9:	89 c7                	mov    %eax,%edi
  800dfb:	48 b8 e9 0c 80 00 00 	movabs $0x800ce9,%rax
  800e02:	00 00 00 
  800e05:	ff d0                	callq  *%rax
  800e07:	89 45 f8             	mov    %eax,-0x8(%rbp)
  800e0a:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  800e0e:	79 05                	jns    800e15 <readn+0x57>
  800e10:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800e13:	eb 1c                	jmp    800e31 <readn+0x73>
  800e15:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  800e19:	75 02                	jne    800e1d <readn+0x5f>
  800e1b:	eb 11                	jmp    800e2e <readn+0x70>
  800e1d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800e20:	01 45 fc             	add    %eax,-0x4(%rbp)
  800e23:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800e26:	48 98                	cltq   
  800e28:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  800e2c:	72 ac                	jb     800dda <readn+0x1c>
  800e2e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800e31:	c9                   	leaveq 
  800e32:	c3                   	retq   

0000000000800e33 <write>:
  800e33:	55                   	push   %rbp
  800e34:	48 89 e5             	mov    %rsp,%rbp
  800e37:	48 83 ec 40          	sub    $0x40,%rsp
  800e3b:	89 7d dc             	mov    %edi,-0x24(%rbp)
  800e3e:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  800e42:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  800e46:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  800e4a:	8b 45 dc             	mov    -0x24(%rbp),%eax
  800e4d:	48 89 d6             	mov    %rdx,%rsi
  800e50:	89 c7                	mov    %eax,%edi
  800e52:	48 b8 b7 08 80 00 00 	movabs $0x8008b7,%rax
  800e59:	00 00 00 
  800e5c:	ff d0                	callq  *%rax
  800e5e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800e61:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800e65:	78 24                	js     800e8b <write+0x58>
  800e67:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e6b:	8b 00                	mov    (%rax),%eax
  800e6d:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  800e71:	48 89 d6             	mov    %rdx,%rsi
  800e74:	89 c7                	mov    %eax,%edi
  800e76:	48 b8 10 0a 80 00 00 	movabs $0x800a10,%rax
  800e7d:	00 00 00 
  800e80:	ff d0                	callq  *%rax
  800e82:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800e85:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800e89:	79 05                	jns    800e90 <write+0x5d>
  800e8b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800e8e:	eb 75                	jmp    800f05 <write+0xd2>
  800e90:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e94:	8b 40 08             	mov    0x8(%rax),%eax
  800e97:	83 e0 03             	and    $0x3,%eax
  800e9a:	85 c0                	test   %eax,%eax
  800e9c:	75 3a                	jne    800ed8 <write+0xa5>
  800e9e:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  800ea5:	00 00 00 
  800ea8:	48 8b 00             	mov    (%rax),%rax
  800eab:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  800eb1:	8b 55 dc             	mov    -0x24(%rbp),%edx
  800eb4:	89 c6                	mov    %eax,%esi
  800eb6:	48 bf 9b 40 80 00 00 	movabs $0x80409b,%rdi
  800ebd:	00 00 00 
  800ec0:	b8 00 00 00 00       	mov    $0x0,%eax
  800ec5:	48 b9 bd 2a 80 00 00 	movabs $0x802abd,%rcx
  800ecc:	00 00 00 
  800ecf:	ff d1                	callq  *%rcx
  800ed1:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800ed6:	eb 2d                	jmp    800f05 <write+0xd2>
  800ed8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800edc:	48 8b 40 18          	mov    0x18(%rax),%rax
  800ee0:	48 85 c0             	test   %rax,%rax
  800ee3:	75 07                	jne    800eec <write+0xb9>
  800ee5:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  800eea:	eb 19                	jmp    800f05 <write+0xd2>
  800eec:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800ef0:	48 8b 40 18          	mov    0x18(%rax),%rax
  800ef4:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  800ef8:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800efc:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  800f00:	48 89 cf             	mov    %rcx,%rdi
  800f03:	ff d0                	callq  *%rax
  800f05:	c9                   	leaveq 
  800f06:	c3                   	retq   

0000000000800f07 <seek>:
  800f07:	55                   	push   %rbp
  800f08:	48 89 e5             	mov    %rsp,%rbp
  800f0b:	48 83 ec 18          	sub    $0x18,%rsp
  800f0f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  800f12:	89 75 e8             	mov    %esi,-0x18(%rbp)
  800f15:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  800f19:	8b 45 ec             	mov    -0x14(%rbp),%eax
  800f1c:	48 89 d6             	mov    %rdx,%rsi
  800f1f:	89 c7                	mov    %eax,%edi
  800f21:	48 b8 b7 08 80 00 00 	movabs $0x8008b7,%rax
  800f28:	00 00 00 
  800f2b:	ff d0                	callq  *%rax
  800f2d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800f30:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800f34:	79 05                	jns    800f3b <seek+0x34>
  800f36:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800f39:	eb 0f                	jmp    800f4a <seek+0x43>
  800f3b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800f3f:	8b 55 e8             	mov    -0x18(%rbp),%edx
  800f42:	89 50 04             	mov    %edx,0x4(%rax)
  800f45:	b8 00 00 00 00       	mov    $0x0,%eax
  800f4a:	c9                   	leaveq 
  800f4b:	c3                   	retq   

0000000000800f4c <ftruncate>:
  800f4c:	55                   	push   %rbp
  800f4d:	48 89 e5             	mov    %rsp,%rbp
  800f50:	48 83 ec 30          	sub    $0x30,%rsp
  800f54:	89 7d dc             	mov    %edi,-0x24(%rbp)
  800f57:	89 75 d8             	mov    %esi,-0x28(%rbp)
  800f5a:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  800f5e:	8b 45 dc             	mov    -0x24(%rbp),%eax
  800f61:	48 89 d6             	mov    %rdx,%rsi
  800f64:	89 c7                	mov    %eax,%edi
  800f66:	48 b8 b7 08 80 00 00 	movabs $0x8008b7,%rax
  800f6d:	00 00 00 
  800f70:	ff d0                	callq  *%rax
  800f72:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800f75:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800f79:	78 24                	js     800f9f <ftruncate+0x53>
  800f7b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f7f:	8b 00                	mov    (%rax),%eax
  800f81:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  800f85:	48 89 d6             	mov    %rdx,%rsi
  800f88:	89 c7                	mov    %eax,%edi
  800f8a:	48 b8 10 0a 80 00 00 	movabs $0x800a10,%rax
  800f91:	00 00 00 
  800f94:	ff d0                	callq  *%rax
  800f96:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800f99:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800f9d:	79 05                	jns    800fa4 <ftruncate+0x58>
  800f9f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800fa2:	eb 72                	jmp    801016 <ftruncate+0xca>
  800fa4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800fa8:	8b 40 08             	mov    0x8(%rax),%eax
  800fab:	83 e0 03             	and    $0x3,%eax
  800fae:	85 c0                	test   %eax,%eax
  800fb0:	75 3a                	jne    800fec <ftruncate+0xa0>
  800fb2:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  800fb9:	00 00 00 
  800fbc:	48 8b 00             	mov    (%rax),%rax
  800fbf:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  800fc5:	8b 55 dc             	mov    -0x24(%rbp),%edx
  800fc8:	89 c6                	mov    %eax,%esi
  800fca:	48 bf b8 40 80 00 00 	movabs $0x8040b8,%rdi
  800fd1:	00 00 00 
  800fd4:	b8 00 00 00 00       	mov    $0x0,%eax
  800fd9:	48 b9 bd 2a 80 00 00 	movabs $0x802abd,%rcx
  800fe0:	00 00 00 
  800fe3:	ff d1                	callq  *%rcx
  800fe5:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800fea:	eb 2a                	jmp    801016 <ftruncate+0xca>
  800fec:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800ff0:	48 8b 40 30          	mov    0x30(%rax),%rax
  800ff4:	48 85 c0             	test   %rax,%rax
  800ff7:	75 07                	jne    801000 <ftruncate+0xb4>
  800ff9:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  800ffe:	eb 16                	jmp    801016 <ftruncate+0xca>
  801000:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801004:	48 8b 40 30          	mov    0x30(%rax),%rax
  801008:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80100c:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  80100f:	89 ce                	mov    %ecx,%esi
  801011:	48 89 d7             	mov    %rdx,%rdi
  801014:	ff d0                	callq  *%rax
  801016:	c9                   	leaveq 
  801017:	c3                   	retq   

0000000000801018 <fstat>:
  801018:	55                   	push   %rbp
  801019:	48 89 e5             	mov    %rsp,%rbp
  80101c:	48 83 ec 30          	sub    $0x30,%rsp
  801020:	89 7d dc             	mov    %edi,-0x24(%rbp)
  801023:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801027:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80102b:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80102e:	48 89 d6             	mov    %rdx,%rsi
  801031:	89 c7                	mov    %eax,%edi
  801033:	48 b8 b7 08 80 00 00 	movabs $0x8008b7,%rax
  80103a:	00 00 00 
  80103d:	ff d0                	callq  *%rax
  80103f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801042:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801046:	78 24                	js     80106c <fstat+0x54>
  801048:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80104c:	8b 00                	mov    (%rax),%eax
  80104e:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  801052:	48 89 d6             	mov    %rdx,%rsi
  801055:	89 c7                	mov    %eax,%edi
  801057:	48 b8 10 0a 80 00 00 	movabs $0x800a10,%rax
  80105e:	00 00 00 
  801061:	ff d0                	callq  *%rax
  801063:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801066:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80106a:	79 05                	jns    801071 <fstat+0x59>
  80106c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80106f:	eb 5e                	jmp    8010cf <fstat+0xb7>
  801071:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801075:	48 8b 40 28          	mov    0x28(%rax),%rax
  801079:	48 85 c0             	test   %rax,%rax
  80107c:	75 07                	jne    801085 <fstat+0x6d>
  80107e:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  801083:	eb 4a                	jmp    8010cf <fstat+0xb7>
  801085:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801089:	c6 00 00             	movb   $0x0,(%rax)
  80108c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801090:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  801097:	00 00 00 
  80109a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80109e:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  8010a5:	00 00 00 
  8010a8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8010ac:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8010b0:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  8010b7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8010bb:	48 8b 40 28          	mov    0x28(%rax),%rax
  8010bf:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8010c3:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  8010c7:	48 89 ce             	mov    %rcx,%rsi
  8010ca:	48 89 d7             	mov    %rdx,%rdi
  8010cd:	ff d0                	callq  *%rax
  8010cf:	c9                   	leaveq 
  8010d0:	c3                   	retq   

00000000008010d1 <stat>:
  8010d1:	55                   	push   %rbp
  8010d2:	48 89 e5             	mov    %rsp,%rbp
  8010d5:	48 83 ec 20          	sub    $0x20,%rsp
  8010d9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8010dd:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8010e1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010e5:	be 00 00 00 00       	mov    $0x0,%esi
  8010ea:	48 89 c7             	mov    %rax,%rdi
  8010ed:	48 b8 bf 11 80 00 00 	movabs $0x8011bf,%rax
  8010f4:	00 00 00 
  8010f7:	ff d0                	callq  *%rax
  8010f9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8010fc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801100:	79 05                	jns    801107 <stat+0x36>
  801102:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801105:	eb 2f                	jmp    801136 <stat+0x65>
  801107:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80110b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80110e:	48 89 d6             	mov    %rdx,%rsi
  801111:	89 c7                	mov    %eax,%edi
  801113:	48 b8 18 10 80 00 00 	movabs $0x801018,%rax
  80111a:	00 00 00 
  80111d:	ff d0                	callq  *%rax
  80111f:	89 45 f8             	mov    %eax,-0x8(%rbp)
  801122:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801125:	89 c7                	mov    %eax,%edi
  801127:	48 b8 c7 0a 80 00 00 	movabs $0x800ac7,%rax
  80112e:	00 00 00 
  801131:	ff d0                	callq  *%rax
  801133:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801136:	c9                   	leaveq 
  801137:	c3                   	retq   

0000000000801138 <fsipc>:
  801138:	55                   	push   %rbp
  801139:	48 89 e5             	mov    %rsp,%rbp
  80113c:	48 83 ec 10          	sub    $0x10,%rsp
  801140:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801143:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801147:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  80114e:	00 00 00 
  801151:	8b 00                	mov    (%rax),%eax
  801153:	85 c0                	test   %eax,%eax
  801155:	75 1d                	jne    801174 <fsipc+0x3c>
  801157:	bf 01 00 00 00       	mov    $0x1,%edi
  80115c:	48 b8 22 3f 80 00 00 	movabs $0x803f22,%rax
  801163:	00 00 00 
  801166:	ff d0                	callq  *%rax
  801168:	48 ba 00 70 80 00 00 	movabs $0x807000,%rdx
  80116f:	00 00 00 
  801172:	89 02                	mov    %eax,(%rdx)
  801174:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  80117b:	00 00 00 
  80117e:	8b 00                	mov    (%rax),%eax
  801180:	8b 75 fc             	mov    -0x4(%rbp),%esi
  801183:	b9 07 00 00 00       	mov    $0x7,%ecx
  801188:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  80118f:	00 00 00 
  801192:	89 c7                	mov    %eax,%edi
  801194:	48 b8 8c 3e 80 00 00 	movabs $0x803e8c,%rax
  80119b:	00 00 00 
  80119e:	ff d0                	callq  *%rax
  8011a0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8011a4:	ba 00 00 00 00       	mov    $0x0,%edx
  8011a9:	48 89 c6             	mov    %rax,%rsi
  8011ac:	bf 00 00 00 00       	mov    $0x0,%edi
  8011b1:	48 b8 cb 3d 80 00 00 	movabs $0x803dcb,%rax
  8011b8:	00 00 00 
  8011bb:	ff d0                	callq  *%rax
  8011bd:	c9                   	leaveq 
  8011be:	c3                   	retq   

00000000008011bf <open>:
  8011bf:	55                   	push   %rbp
  8011c0:	48 89 e5             	mov    %rsp,%rbp
  8011c3:	48 83 ec 20          	sub    $0x20,%rsp
  8011c7:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8011cb:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8011ce:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011d2:	48 89 c7             	mov    %rax,%rdi
  8011d5:	48 b8 06 36 80 00 00 	movabs $0x803606,%rax
  8011dc:	00 00 00 
  8011df:	ff d0                	callq  *%rax
  8011e1:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  8011e6:	7e 0a                	jle    8011f2 <open+0x33>
  8011e8:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  8011ed:	e9 a5 00 00 00       	jmpq   801297 <open+0xd8>
  8011f2:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8011f6:	48 89 c7             	mov    %rax,%rdi
  8011f9:	48 b8 1f 08 80 00 00 	movabs $0x80081f,%rax
  801200:	00 00 00 
  801203:	ff d0                	callq  *%rax
  801205:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801208:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80120c:	79 08                	jns    801216 <open+0x57>
  80120e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801211:	e9 81 00 00 00       	jmpq   801297 <open+0xd8>
  801216:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80121a:	48 89 c6             	mov    %rax,%rsi
  80121d:	48 bf 00 80 80 00 00 	movabs $0x808000,%rdi
  801224:	00 00 00 
  801227:	48 b8 72 36 80 00 00 	movabs $0x803672,%rax
  80122e:	00 00 00 
  801231:	ff d0                	callq  *%rax
  801233:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80123a:	00 00 00 
  80123d:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  801240:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  801246:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80124a:	48 89 c6             	mov    %rax,%rsi
  80124d:	bf 01 00 00 00       	mov    $0x1,%edi
  801252:	48 b8 38 11 80 00 00 	movabs $0x801138,%rax
  801259:	00 00 00 
  80125c:	ff d0                	callq  *%rax
  80125e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801261:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801265:	79 1d                	jns    801284 <open+0xc5>
  801267:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80126b:	be 00 00 00 00       	mov    $0x0,%esi
  801270:	48 89 c7             	mov    %rax,%rdi
  801273:	48 b8 47 09 80 00 00 	movabs $0x800947,%rax
  80127a:	00 00 00 
  80127d:	ff d0                	callq  *%rax
  80127f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801282:	eb 13                	jmp    801297 <open+0xd8>
  801284:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801288:	48 89 c7             	mov    %rax,%rdi
  80128b:	48 b8 d1 07 80 00 00 	movabs $0x8007d1,%rax
  801292:	00 00 00 
  801295:	ff d0                	callq  *%rax
  801297:	c9                   	leaveq 
  801298:	c3                   	retq   

0000000000801299 <devfile_flush>:
  801299:	55                   	push   %rbp
  80129a:	48 89 e5             	mov    %rsp,%rbp
  80129d:	48 83 ec 10          	sub    $0x10,%rsp
  8012a1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8012a5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012a9:	8b 50 0c             	mov    0xc(%rax),%edx
  8012ac:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8012b3:	00 00 00 
  8012b6:	89 10                	mov    %edx,(%rax)
  8012b8:	be 00 00 00 00       	mov    $0x0,%esi
  8012bd:	bf 06 00 00 00       	mov    $0x6,%edi
  8012c2:	48 b8 38 11 80 00 00 	movabs $0x801138,%rax
  8012c9:	00 00 00 
  8012cc:	ff d0                	callq  *%rax
  8012ce:	c9                   	leaveq 
  8012cf:	c3                   	retq   

00000000008012d0 <devfile_read>:
  8012d0:	55                   	push   %rbp
  8012d1:	48 89 e5             	mov    %rsp,%rbp
  8012d4:	48 83 ec 30          	sub    $0x30,%rsp
  8012d8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8012dc:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8012e0:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8012e4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012e8:	8b 50 0c             	mov    0xc(%rax),%edx
  8012eb:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8012f2:	00 00 00 
  8012f5:	89 10                	mov    %edx,(%rax)
  8012f7:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8012fe:	00 00 00 
  801301:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801305:	48 89 50 08          	mov    %rdx,0x8(%rax)
  801309:	be 00 00 00 00       	mov    $0x0,%esi
  80130e:	bf 03 00 00 00       	mov    $0x3,%edi
  801313:	48 b8 38 11 80 00 00 	movabs $0x801138,%rax
  80131a:	00 00 00 
  80131d:	ff d0                	callq  *%rax
  80131f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801322:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801326:	79 08                	jns    801330 <devfile_read+0x60>
  801328:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80132b:	e9 a4 00 00 00       	jmpq   8013d4 <devfile_read+0x104>
  801330:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801333:	48 98                	cltq   
  801335:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  801339:	76 35                	jbe    801370 <devfile_read+0xa0>
  80133b:	48 b9 de 40 80 00 00 	movabs $0x8040de,%rcx
  801342:	00 00 00 
  801345:	48 ba e5 40 80 00 00 	movabs $0x8040e5,%rdx
  80134c:	00 00 00 
  80134f:	be 89 00 00 00       	mov    $0x89,%esi
  801354:	48 bf fa 40 80 00 00 	movabs $0x8040fa,%rdi
  80135b:	00 00 00 
  80135e:	b8 00 00 00 00       	mov    $0x0,%eax
  801363:	49 b8 84 28 80 00 00 	movabs $0x802884,%r8
  80136a:	00 00 00 
  80136d:	41 ff d0             	callq  *%r8
  801370:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  801377:	7e 35                	jle    8013ae <devfile_read+0xde>
  801379:	48 b9 08 41 80 00 00 	movabs $0x804108,%rcx
  801380:	00 00 00 
  801383:	48 ba e5 40 80 00 00 	movabs $0x8040e5,%rdx
  80138a:	00 00 00 
  80138d:	be 8a 00 00 00       	mov    $0x8a,%esi
  801392:	48 bf fa 40 80 00 00 	movabs $0x8040fa,%rdi
  801399:	00 00 00 
  80139c:	b8 00 00 00 00       	mov    $0x0,%eax
  8013a1:	49 b8 84 28 80 00 00 	movabs $0x802884,%r8
  8013a8:	00 00 00 
  8013ab:	41 ff d0             	callq  *%r8
  8013ae:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8013b1:	48 63 d0             	movslq %eax,%rdx
  8013b4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8013b8:	48 be 00 80 80 00 00 	movabs $0x808000,%rsi
  8013bf:	00 00 00 
  8013c2:	48 89 c7             	mov    %rax,%rdi
  8013c5:	48 b8 96 39 80 00 00 	movabs $0x803996,%rax
  8013cc:	00 00 00 
  8013cf:	ff d0                	callq  *%rax
  8013d1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8013d4:	c9                   	leaveq 
  8013d5:	c3                   	retq   

00000000008013d6 <devfile_write>:
  8013d6:	55                   	push   %rbp
  8013d7:	48 89 e5             	mov    %rsp,%rbp
  8013da:	48 83 ec 40          	sub    $0x40,%rsp
  8013de:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8013e2:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8013e6:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8013ea:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8013ee:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8013f2:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  8013f9:	00 
  8013fa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8013fe:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  801402:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  801407:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  80140b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80140f:	8b 50 0c             	mov    0xc(%rax),%edx
  801412:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  801419:	00 00 00 
  80141c:	89 10                	mov    %edx,(%rax)
  80141e:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  801425:	00 00 00 
  801428:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80142c:	48 89 50 08          	mov    %rdx,0x8(%rax)
  801430:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  801434:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801438:	48 89 c6             	mov    %rax,%rsi
  80143b:	48 bf 10 80 80 00 00 	movabs $0x808010,%rdi
  801442:	00 00 00 
  801445:	48 b8 96 39 80 00 00 	movabs $0x803996,%rax
  80144c:	00 00 00 
  80144f:	ff d0                	callq  *%rax
  801451:	be 00 00 00 00       	mov    $0x0,%esi
  801456:	bf 04 00 00 00       	mov    $0x4,%edi
  80145b:	48 b8 38 11 80 00 00 	movabs $0x801138,%rax
  801462:	00 00 00 
  801465:	ff d0                	callq  *%rax
  801467:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80146a:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80146e:	79 05                	jns    801475 <devfile_write+0x9f>
  801470:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801473:	eb 43                	jmp    8014b8 <devfile_write+0xe2>
  801475:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801478:	48 98                	cltq   
  80147a:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  80147e:	76 35                	jbe    8014b5 <devfile_write+0xdf>
  801480:	48 b9 de 40 80 00 00 	movabs $0x8040de,%rcx
  801487:	00 00 00 
  80148a:	48 ba e5 40 80 00 00 	movabs $0x8040e5,%rdx
  801491:	00 00 00 
  801494:	be a8 00 00 00       	mov    $0xa8,%esi
  801499:	48 bf fa 40 80 00 00 	movabs $0x8040fa,%rdi
  8014a0:	00 00 00 
  8014a3:	b8 00 00 00 00       	mov    $0x0,%eax
  8014a8:	49 b8 84 28 80 00 00 	movabs $0x802884,%r8
  8014af:	00 00 00 
  8014b2:	41 ff d0             	callq  *%r8
  8014b5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8014b8:	c9                   	leaveq 
  8014b9:	c3                   	retq   

00000000008014ba <devfile_stat>:
  8014ba:	55                   	push   %rbp
  8014bb:	48 89 e5             	mov    %rsp,%rbp
  8014be:	48 83 ec 20          	sub    $0x20,%rsp
  8014c2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8014c6:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8014ca:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014ce:	8b 50 0c             	mov    0xc(%rax),%edx
  8014d1:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8014d8:	00 00 00 
  8014db:	89 10                	mov    %edx,(%rax)
  8014dd:	be 00 00 00 00       	mov    $0x0,%esi
  8014e2:	bf 05 00 00 00       	mov    $0x5,%edi
  8014e7:	48 b8 38 11 80 00 00 	movabs $0x801138,%rax
  8014ee:	00 00 00 
  8014f1:	ff d0                	callq  *%rax
  8014f3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8014f6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8014fa:	79 05                	jns    801501 <devfile_stat+0x47>
  8014fc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8014ff:	eb 56                	jmp    801557 <devfile_stat+0x9d>
  801501:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801505:	48 be 00 80 80 00 00 	movabs $0x808000,%rsi
  80150c:	00 00 00 
  80150f:	48 89 c7             	mov    %rax,%rdi
  801512:	48 b8 72 36 80 00 00 	movabs $0x803672,%rax
  801519:	00 00 00 
  80151c:	ff d0                	callq  *%rax
  80151e:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  801525:	00 00 00 
  801528:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  80152e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801532:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  801538:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80153f:	00 00 00 
  801542:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  801548:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80154c:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  801552:	b8 00 00 00 00       	mov    $0x0,%eax
  801557:	c9                   	leaveq 
  801558:	c3                   	retq   

0000000000801559 <devfile_trunc>:
  801559:	55                   	push   %rbp
  80155a:	48 89 e5             	mov    %rsp,%rbp
  80155d:	48 83 ec 10          	sub    $0x10,%rsp
  801561:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801565:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801568:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80156c:	8b 50 0c             	mov    0xc(%rax),%edx
  80156f:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  801576:	00 00 00 
  801579:	89 10                	mov    %edx,(%rax)
  80157b:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  801582:	00 00 00 
  801585:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801588:	89 50 04             	mov    %edx,0x4(%rax)
  80158b:	be 00 00 00 00       	mov    $0x0,%esi
  801590:	bf 02 00 00 00       	mov    $0x2,%edi
  801595:	48 b8 38 11 80 00 00 	movabs $0x801138,%rax
  80159c:	00 00 00 
  80159f:	ff d0                	callq  *%rax
  8015a1:	c9                   	leaveq 
  8015a2:	c3                   	retq   

00000000008015a3 <remove>:
  8015a3:	55                   	push   %rbp
  8015a4:	48 89 e5             	mov    %rsp,%rbp
  8015a7:	48 83 ec 10          	sub    $0x10,%rsp
  8015ab:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8015af:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015b3:	48 89 c7             	mov    %rax,%rdi
  8015b6:	48 b8 06 36 80 00 00 	movabs $0x803606,%rax
  8015bd:	00 00 00 
  8015c0:	ff d0                	callq  *%rax
  8015c2:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  8015c7:	7e 07                	jle    8015d0 <remove+0x2d>
  8015c9:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  8015ce:	eb 33                	jmp    801603 <remove+0x60>
  8015d0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015d4:	48 89 c6             	mov    %rax,%rsi
  8015d7:	48 bf 00 80 80 00 00 	movabs $0x808000,%rdi
  8015de:	00 00 00 
  8015e1:	48 b8 72 36 80 00 00 	movabs $0x803672,%rax
  8015e8:	00 00 00 
  8015eb:	ff d0                	callq  *%rax
  8015ed:	be 00 00 00 00       	mov    $0x0,%esi
  8015f2:	bf 07 00 00 00       	mov    $0x7,%edi
  8015f7:	48 b8 38 11 80 00 00 	movabs $0x801138,%rax
  8015fe:	00 00 00 
  801601:	ff d0                	callq  *%rax
  801603:	c9                   	leaveq 
  801604:	c3                   	retq   

0000000000801605 <sync>:
  801605:	55                   	push   %rbp
  801606:	48 89 e5             	mov    %rsp,%rbp
  801609:	be 00 00 00 00       	mov    $0x0,%esi
  80160e:	bf 08 00 00 00       	mov    $0x8,%edi
  801613:	48 b8 38 11 80 00 00 	movabs $0x801138,%rax
  80161a:	00 00 00 
  80161d:	ff d0                	callq  *%rax
  80161f:	5d                   	pop    %rbp
  801620:	c3                   	retq   

0000000000801621 <copy>:
  801621:	55                   	push   %rbp
  801622:	48 89 e5             	mov    %rsp,%rbp
  801625:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  80162c:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  801633:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  80163a:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  801641:	be 00 00 00 00       	mov    $0x0,%esi
  801646:	48 89 c7             	mov    %rax,%rdi
  801649:	48 b8 bf 11 80 00 00 	movabs $0x8011bf,%rax
  801650:	00 00 00 
  801653:	ff d0                	callq  *%rax
  801655:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801658:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80165c:	79 28                	jns    801686 <copy+0x65>
  80165e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801661:	89 c6                	mov    %eax,%esi
  801663:	48 bf 14 41 80 00 00 	movabs $0x804114,%rdi
  80166a:	00 00 00 
  80166d:	b8 00 00 00 00       	mov    $0x0,%eax
  801672:	48 ba bd 2a 80 00 00 	movabs $0x802abd,%rdx
  801679:	00 00 00 
  80167c:	ff d2                	callq  *%rdx
  80167e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801681:	e9 74 01 00 00       	jmpq   8017fa <copy+0x1d9>
  801686:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  80168d:	be 01 01 00 00       	mov    $0x101,%esi
  801692:	48 89 c7             	mov    %rax,%rdi
  801695:	48 b8 bf 11 80 00 00 	movabs $0x8011bf,%rax
  80169c:	00 00 00 
  80169f:	ff d0                	callq  *%rax
  8016a1:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8016a4:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8016a8:	79 39                	jns    8016e3 <copy+0xc2>
  8016aa:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8016ad:	89 c6                	mov    %eax,%esi
  8016af:	48 bf 2a 41 80 00 00 	movabs $0x80412a,%rdi
  8016b6:	00 00 00 
  8016b9:	b8 00 00 00 00       	mov    $0x0,%eax
  8016be:	48 ba bd 2a 80 00 00 	movabs $0x802abd,%rdx
  8016c5:	00 00 00 
  8016c8:	ff d2                	callq  *%rdx
  8016ca:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8016cd:	89 c7                	mov    %eax,%edi
  8016cf:	48 b8 c7 0a 80 00 00 	movabs $0x800ac7,%rax
  8016d6:	00 00 00 
  8016d9:	ff d0                	callq  *%rax
  8016db:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8016de:	e9 17 01 00 00       	jmpq   8017fa <copy+0x1d9>
  8016e3:	eb 74                	jmp    801759 <copy+0x138>
  8016e5:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8016e8:	48 63 d0             	movslq %eax,%rdx
  8016eb:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  8016f2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8016f5:	48 89 ce             	mov    %rcx,%rsi
  8016f8:	89 c7                	mov    %eax,%edi
  8016fa:	48 b8 33 0e 80 00 00 	movabs $0x800e33,%rax
  801701:	00 00 00 
  801704:	ff d0                	callq  *%rax
  801706:	89 45 f0             	mov    %eax,-0x10(%rbp)
  801709:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  80170d:	79 4a                	jns    801759 <copy+0x138>
  80170f:	8b 45 f0             	mov    -0x10(%rbp),%eax
  801712:	89 c6                	mov    %eax,%esi
  801714:	48 bf 44 41 80 00 00 	movabs $0x804144,%rdi
  80171b:	00 00 00 
  80171e:	b8 00 00 00 00       	mov    $0x0,%eax
  801723:	48 ba bd 2a 80 00 00 	movabs $0x802abd,%rdx
  80172a:	00 00 00 
  80172d:	ff d2                	callq  *%rdx
  80172f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801732:	89 c7                	mov    %eax,%edi
  801734:	48 b8 c7 0a 80 00 00 	movabs $0x800ac7,%rax
  80173b:	00 00 00 
  80173e:	ff d0                	callq  *%rax
  801740:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801743:	89 c7                	mov    %eax,%edi
  801745:	48 b8 c7 0a 80 00 00 	movabs $0x800ac7,%rax
  80174c:	00 00 00 
  80174f:	ff d0                	callq  *%rax
  801751:	8b 45 f0             	mov    -0x10(%rbp),%eax
  801754:	e9 a1 00 00 00       	jmpq   8017fa <copy+0x1d9>
  801759:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  801760:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801763:	ba 00 02 00 00       	mov    $0x200,%edx
  801768:	48 89 ce             	mov    %rcx,%rsi
  80176b:	89 c7                	mov    %eax,%edi
  80176d:	48 b8 e9 0c 80 00 00 	movabs $0x800ce9,%rax
  801774:	00 00 00 
  801777:	ff d0                	callq  *%rax
  801779:	89 45 f4             	mov    %eax,-0xc(%rbp)
  80177c:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  801780:	0f 8f 5f ff ff ff    	jg     8016e5 <copy+0xc4>
  801786:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  80178a:	79 47                	jns    8017d3 <copy+0x1b2>
  80178c:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80178f:	89 c6                	mov    %eax,%esi
  801791:	48 bf 57 41 80 00 00 	movabs $0x804157,%rdi
  801798:	00 00 00 
  80179b:	b8 00 00 00 00       	mov    $0x0,%eax
  8017a0:	48 ba bd 2a 80 00 00 	movabs $0x802abd,%rdx
  8017a7:	00 00 00 
  8017aa:	ff d2                	callq  *%rdx
  8017ac:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8017af:	89 c7                	mov    %eax,%edi
  8017b1:	48 b8 c7 0a 80 00 00 	movabs $0x800ac7,%rax
  8017b8:	00 00 00 
  8017bb:	ff d0                	callq  *%rax
  8017bd:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8017c0:	89 c7                	mov    %eax,%edi
  8017c2:	48 b8 c7 0a 80 00 00 	movabs $0x800ac7,%rax
  8017c9:	00 00 00 
  8017cc:	ff d0                	callq  *%rax
  8017ce:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8017d1:	eb 27                	jmp    8017fa <copy+0x1d9>
  8017d3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8017d6:	89 c7                	mov    %eax,%edi
  8017d8:	48 b8 c7 0a 80 00 00 	movabs $0x800ac7,%rax
  8017df:	00 00 00 
  8017e2:	ff d0                	callq  *%rax
  8017e4:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8017e7:	89 c7                	mov    %eax,%edi
  8017e9:	48 b8 c7 0a 80 00 00 	movabs $0x800ac7,%rax
  8017f0:	00 00 00 
  8017f3:	ff d0                	callq  *%rax
  8017f5:	b8 00 00 00 00       	mov    $0x0,%eax
  8017fa:	c9                   	leaveq 
  8017fb:	c3                   	retq   

00000000008017fc <fd2sockid>:
  8017fc:	55                   	push   %rbp
  8017fd:	48 89 e5             	mov    %rsp,%rbp
  801800:	48 83 ec 20          	sub    $0x20,%rsp
  801804:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801807:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80180b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80180e:	48 89 d6             	mov    %rdx,%rsi
  801811:	89 c7                	mov    %eax,%edi
  801813:	48 b8 b7 08 80 00 00 	movabs $0x8008b7,%rax
  80181a:	00 00 00 
  80181d:	ff d0                	callq  *%rax
  80181f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801822:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801826:	79 05                	jns    80182d <fd2sockid+0x31>
  801828:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80182b:	eb 24                	jmp    801851 <fd2sockid+0x55>
  80182d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801831:	8b 10                	mov    (%rax),%edx
  801833:	48 b8 a0 60 80 00 00 	movabs $0x8060a0,%rax
  80183a:	00 00 00 
  80183d:	8b 00                	mov    (%rax),%eax
  80183f:	39 c2                	cmp    %eax,%edx
  801841:	74 07                	je     80184a <fd2sockid+0x4e>
  801843:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  801848:	eb 07                	jmp    801851 <fd2sockid+0x55>
  80184a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80184e:	8b 40 0c             	mov    0xc(%rax),%eax
  801851:	c9                   	leaveq 
  801852:	c3                   	retq   

0000000000801853 <alloc_sockfd>:
  801853:	55                   	push   %rbp
  801854:	48 89 e5             	mov    %rsp,%rbp
  801857:	48 83 ec 20          	sub    $0x20,%rsp
  80185b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80185e:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  801862:	48 89 c7             	mov    %rax,%rdi
  801865:	48 b8 1f 08 80 00 00 	movabs $0x80081f,%rax
  80186c:	00 00 00 
  80186f:	ff d0                	callq  *%rax
  801871:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801874:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801878:	78 26                	js     8018a0 <alloc_sockfd+0x4d>
  80187a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80187e:	ba 07 04 00 00       	mov    $0x407,%edx
  801883:	48 89 c6             	mov    %rax,%rsi
  801886:	bf 00 00 00 00       	mov    $0x0,%edi
  80188b:	48 b8 f3 02 80 00 00 	movabs $0x8002f3,%rax
  801892:	00 00 00 
  801895:	ff d0                	callq  *%rax
  801897:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80189a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80189e:	79 16                	jns    8018b6 <alloc_sockfd+0x63>
  8018a0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8018a3:	89 c7                	mov    %eax,%edi
  8018a5:	48 b8 60 1d 80 00 00 	movabs $0x801d60,%rax
  8018ac:	00 00 00 
  8018af:	ff d0                	callq  *%rax
  8018b1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8018b4:	eb 3a                	jmp    8018f0 <alloc_sockfd+0x9d>
  8018b6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8018ba:	48 ba a0 60 80 00 00 	movabs $0x8060a0,%rdx
  8018c1:	00 00 00 
  8018c4:	8b 12                	mov    (%rdx),%edx
  8018c6:	89 10                	mov    %edx,(%rax)
  8018c8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8018cc:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8018d3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8018d7:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8018da:	89 50 0c             	mov    %edx,0xc(%rax)
  8018dd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8018e1:	48 89 c7             	mov    %rax,%rdi
  8018e4:	48 b8 d1 07 80 00 00 	movabs $0x8007d1,%rax
  8018eb:	00 00 00 
  8018ee:	ff d0                	callq  *%rax
  8018f0:	c9                   	leaveq 
  8018f1:	c3                   	retq   

00000000008018f2 <accept>:
  8018f2:	55                   	push   %rbp
  8018f3:	48 89 e5             	mov    %rsp,%rbp
  8018f6:	48 83 ec 30          	sub    $0x30,%rsp
  8018fa:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8018fd:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801901:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801905:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801908:	89 c7                	mov    %eax,%edi
  80190a:	48 b8 fc 17 80 00 00 	movabs $0x8017fc,%rax
  801911:	00 00 00 
  801914:	ff d0                	callq  *%rax
  801916:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801919:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80191d:	79 05                	jns    801924 <accept+0x32>
  80191f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801922:	eb 3b                	jmp    80195f <accept+0x6d>
  801924:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801928:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80192c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80192f:	48 89 ce             	mov    %rcx,%rsi
  801932:	89 c7                	mov    %eax,%edi
  801934:	48 b8 3d 1c 80 00 00 	movabs $0x801c3d,%rax
  80193b:	00 00 00 
  80193e:	ff d0                	callq  *%rax
  801940:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801943:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801947:	79 05                	jns    80194e <accept+0x5c>
  801949:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80194c:	eb 11                	jmp    80195f <accept+0x6d>
  80194e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801951:	89 c7                	mov    %eax,%edi
  801953:	48 b8 53 18 80 00 00 	movabs $0x801853,%rax
  80195a:	00 00 00 
  80195d:	ff d0                	callq  *%rax
  80195f:	c9                   	leaveq 
  801960:	c3                   	retq   

0000000000801961 <bind>:
  801961:	55                   	push   %rbp
  801962:	48 89 e5             	mov    %rsp,%rbp
  801965:	48 83 ec 20          	sub    $0x20,%rsp
  801969:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80196c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801970:	89 55 e8             	mov    %edx,-0x18(%rbp)
  801973:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801976:	89 c7                	mov    %eax,%edi
  801978:	48 b8 fc 17 80 00 00 	movabs $0x8017fc,%rax
  80197f:	00 00 00 
  801982:	ff d0                	callq  *%rax
  801984:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801987:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80198b:	79 05                	jns    801992 <bind+0x31>
  80198d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801990:	eb 1b                	jmp    8019ad <bind+0x4c>
  801992:	8b 55 e8             	mov    -0x18(%rbp),%edx
  801995:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  801999:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80199c:	48 89 ce             	mov    %rcx,%rsi
  80199f:	89 c7                	mov    %eax,%edi
  8019a1:	48 b8 bc 1c 80 00 00 	movabs $0x801cbc,%rax
  8019a8:	00 00 00 
  8019ab:	ff d0                	callq  *%rax
  8019ad:	c9                   	leaveq 
  8019ae:	c3                   	retq   

00000000008019af <shutdown>:
  8019af:	55                   	push   %rbp
  8019b0:	48 89 e5             	mov    %rsp,%rbp
  8019b3:	48 83 ec 20          	sub    $0x20,%rsp
  8019b7:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8019ba:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8019bd:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8019c0:	89 c7                	mov    %eax,%edi
  8019c2:	48 b8 fc 17 80 00 00 	movabs $0x8017fc,%rax
  8019c9:	00 00 00 
  8019cc:	ff d0                	callq  *%rax
  8019ce:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8019d1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8019d5:	79 05                	jns    8019dc <shutdown+0x2d>
  8019d7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8019da:	eb 16                	jmp    8019f2 <shutdown+0x43>
  8019dc:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8019df:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8019e2:	89 d6                	mov    %edx,%esi
  8019e4:	89 c7                	mov    %eax,%edi
  8019e6:	48 b8 20 1d 80 00 00 	movabs $0x801d20,%rax
  8019ed:	00 00 00 
  8019f0:	ff d0                	callq  *%rax
  8019f2:	c9                   	leaveq 
  8019f3:	c3                   	retq   

00000000008019f4 <devsock_close>:
  8019f4:	55                   	push   %rbp
  8019f5:	48 89 e5             	mov    %rsp,%rbp
  8019f8:	48 83 ec 10          	sub    $0x10,%rsp
  8019fc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801a00:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801a04:	48 89 c7             	mov    %rax,%rdi
  801a07:	48 b8 94 3f 80 00 00 	movabs $0x803f94,%rax
  801a0e:	00 00 00 
  801a11:	ff d0                	callq  *%rax
  801a13:	83 f8 01             	cmp    $0x1,%eax
  801a16:	75 17                	jne    801a2f <devsock_close+0x3b>
  801a18:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801a1c:	8b 40 0c             	mov    0xc(%rax),%eax
  801a1f:	89 c7                	mov    %eax,%edi
  801a21:	48 b8 60 1d 80 00 00 	movabs $0x801d60,%rax
  801a28:	00 00 00 
  801a2b:	ff d0                	callq  *%rax
  801a2d:	eb 05                	jmp    801a34 <devsock_close+0x40>
  801a2f:	b8 00 00 00 00       	mov    $0x0,%eax
  801a34:	c9                   	leaveq 
  801a35:	c3                   	retq   

0000000000801a36 <connect>:
  801a36:	55                   	push   %rbp
  801a37:	48 89 e5             	mov    %rsp,%rbp
  801a3a:	48 83 ec 20          	sub    $0x20,%rsp
  801a3e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801a41:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801a45:	89 55 e8             	mov    %edx,-0x18(%rbp)
  801a48:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801a4b:	89 c7                	mov    %eax,%edi
  801a4d:	48 b8 fc 17 80 00 00 	movabs $0x8017fc,%rax
  801a54:	00 00 00 
  801a57:	ff d0                	callq  *%rax
  801a59:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801a5c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801a60:	79 05                	jns    801a67 <connect+0x31>
  801a62:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a65:	eb 1b                	jmp    801a82 <connect+0x4c>
  801a67:	8b 55 e8             	mov    -0x18(%rbp),%edx
  801a6a:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  801a6e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a71:	48 89 ce             	mov    %rcx,%rsi
  801a74:	89 c7                	mov    %eax,%edi
  801a76:	48 b8 8d 1d 80 00 00 	movabs $0x801d8d,%rax
  801a7d:	00 00 00 
  801a80:	ff d0                	callq  *%rax
  801a82:	c9                   	leaveq 
  801a83:	c3                   	retq   

0000000000801a84 <listen>:
  801a84:	55                   	push   %rbp
  801a85:	48 89 e5             	mov    %rsp,%rbp
  801a88:	48 83 ec 20          	sub    $0x20,%rsp
  801a8c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801a8f:	89 75 e8             	mov    %esi,-0x18(%rbp)
  801a92:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801a95:	89 c7                	mov    %eax,%edi
  801a97:	48 b8 fc 17 80 00 00 	movabs $0x8017fc,%rax
  801a9e:	00 00 00 
  801aa1:	ff d0                	callq  *%rax
  801aa3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801aa6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801aaa:	79 05                	jns    801ab1 <listen+0x2d>
  801aac:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801aaf:	eb 16                	jmp    801ac7 <listen+0x43>
  801ab1:	8b 55 e8             	mov    -0x18(%rbp),%edx
  801ab4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ab7:	89 d6                	mov    %edx,%esi
  801ab9:	89 c7                	mov    %eax,%edi
  801abb:	48 b8 f1 1d 80 00 00 	movabs $0x801df1,%rax
  801ac2:	00 00 00 
  801ac5:	ff d0                	callq  *%rax
  801ac7:	c9                   	leaveq 
  801ac8:	c3                   	retq   

0000000000801ac9 <devsock_read>:
  801ac9:	55                   	push   %rbp
  801aca:	48 89 e5             	mov    %rsp,%rbp
  801acd:	48 83 ec 20          	sub    $0x20,%rsp
  801ad1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801ad5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801ad9:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801add:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801ae1:	89 c2                	mov    %eax,%edx
  801ae3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ae7:	8b 40 0c             	mov    0xc(%rax),%eax
  801aea:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  801aee:	b9 00 00 00 00       	mov    $0x0,%ecx
  801af3:	89 c7                	mov    %eax,%edi
  801af5:	48 b8 31 1e 80 00 00 	movabs $0x801e31,%rax
  801afc:	00 00 00 
  801aff:	ff d0                	callq  *%rax
  801b01:	c9                   	leaveq 
  801b02:	c3                   	retq   

0000000000801b03 <devsock_write>:
  801b03:	55                   	push   %rbp
  801b04:	48 89 e5             	mov    %rsp,%rbp
  801b07:	48 83 ec 20          	sub    $0x20,%rsp
  801b0b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801b0f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b13:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801b17:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801b1b:	89 c2                	mov    %eax,%edx
  801b1d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b21:	8b 40 0c             	mov    0xc(%rax),%eax
  801b24:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  801b28:	b9 00 00 00 00       	mov    $0x0,%ecx
  801b2d:	89 c7                	mov    %eax,%edi
  801b2f:	48 b8 fd 1e 80 00 00 	movabs $0x801efd,%rax
  801b36:	00 00 00 
  801b39:	ff d0                	callq  *%rax
  801b3b:	c9                   	leaveq 
  801b3c:	c3                   	retq   

0000000000801b3d <devsock_stat>:
  801b3d:	55                   	push   %rbp
  801b3e:	48 89 e5             	mov    %rsp,%rbp
  801b41:	48 83 ec 10          	sub    $0x10,%rsp
  801b45:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801b49:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b4d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801b51:	48 be 72 41 80 00 00 	movabs $0x804172,%rsi
  801b58:	00 00 00 
  801b5b:	48 89 c7             	mov    %rax,%rdi
  801b5e:	48 b8 72 36 80 00 00 	movabs $0x803672,%rax
  801b65:	00 00 00 
  801b68:	ff d0                	callq  *%rax
  801b6a:	b8 00 00 00 00       	mov    $0x0,%eax
  801b6f:	c9                   	leaveq 
  801b70:	c3                   	retq   

0000000000801b71 <socket>:
  801b71:	55                   	push   %rbp
  801b72:	48 89 e5             	mov    %rsp,%rbp
  801b75:	48 83 ec 20          	sub    $0x20,%rsp
  801b79:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801b7c:	89 75 e8             	mov    %esi,-0x18(%rbp)
  801b7f:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  801b82:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  801b85:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  801b88:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801b8b:	89 ce                	mov    %ecx,%esi
  801b8d:	89 c7                	mov    %eax,%edi
  801b8f:	48 b8 b5 1f 80 00 00 	movabs $0x801fb5,%rax
  801b96:	00 00 00 
  801b99:	ff d0                	callq  *%rax
  801b9b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801b9e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801ba2:	79 05                	jns    801ba9 <socket+0x38>
  801ba4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ba7:	eb 11                	jmp    801bba <socket+0x49>
  801ba9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801bac:	89 c7                	mov    %eax,%edi
  801bae:	48 b8 53 18 80 00 00 	movabs $0x801853,%rax
  801bb5:	00 00 00 
  801bb8:	ff d0                	callq  *%rax
  801bba:	c9                   	leaveq 
  801bbb:	c3                   	retq   

0000000000801bbc <nsipc>:
  801bbc:	55                   	push   %rbp
  801bbd:	48 89 e5             	mov    %rsp,%rbp
  801bc0:	48 83 ec 10          	sub    $0x10,%rsp
  801bc4:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801bc7:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  801bce:	00 00 00 
  801bd1:	8b 00                	mov    (%rax),%eax
  801bd3:	85 c0                	test   %eax,%eax
  801bd5:	75 1d                	jne    801bf4 <nsipc+0x38>
  801bd7:	bf 02 00 00 00       	mov    $0x2,%edi
  801bdc:	48 b8 22 3f 80 00 00 	movabs $0x803f22,%rax
  801be3:	00 00 00 
  801be6:	ff d0                	callq  *%rax
  801be8:	48 ba 04 70 80 00 00 	movabs $0x807004,%rdx
  801bef:	00 00 00 
  801bf2:	89 02                	mov    %eax,(%rdx)
  801bf4:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  801bfb:	00 00 00 
  801bfe:	8b 00                	mov    (%rax),%eax
  801c00:	8b 75 fc             	mov    -0x4(%rbp),%esi
  801c03:	b9 07 00 00 00       	mov    $0x7,%ecx
  801c08:	48 ba 00 a0 80 00 00 	movabs $0x80a000,%rdx
  801c0f:	00 00 00 
  801c12:	89 c7                	mov    %eax,%edi
  801c14:	48 b8 8c 3e 80 00 00 	movabs $0x803e8c,%rax
  801c1b:	00 00 00 
  801c1e:	ff d0                	callq  *%rax
  801c20:	ba 00 00 00 00       	mov    $0x0,%edx
  801c25:	be 00 00 00 00       	mov    $0x0,%esi
  801c2a:	bf 00 00 00 00       	mov    $0x0,%edi
  801c2f:	48 b8 cb 3d 80 00 00 	movabs $0x803dcb,%rax
  801c36:	00 00 00 
  801c39:	ff d0                	callq  *%rax
  801c3b:	c9                   	leaveq 
  801c3c:	c3                   	retq   

0000000000801c3d <nsipc_accept>:
  801c3d:	55                   	push   %rbp
  801c3e:	48 89 e5             	mov    %rsp,%rbp
  801c41:	48 83 ec 30          	sub    $0x30,%rsp
  801c45:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801c48:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801c4c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801c50:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  801c57:	00 00 00 
  801c5a:	8b 55 ec             	mov    -0x14(%rbp),%edx
  801c5d:	89 10                	mov    %edx,(%rax)
  801c5f:	bf 01 00 00 00       	mov    $0x1,%edi
  801c64:	48 b8 bc 1b 80 00 00 	movabs $0x801bbc,%rax
  801c6b:	00 00 00 
  801c6e:	ff d0                	callq  *%rax
  801c70:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801c73:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801c77:	78 3e                	js     801cb7 <nsipc_accept+0x7a>
  801c79:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  801c80:	00 00 00 
  801c83:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801c87:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801c8b:	8b 40 10             	mov    0x10(%rax),%eax
  801c8e:	89 c2                	mov    %eax,%edx
  801c90:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  801c94:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801c98:	48 89 ce             	mov    %rcx,%rsi
  801c9b:	48 89 c7             	mov    %rax,%rdi
  801c9e:	48 b8 96 39 80 00 00 	movabs $0x803996,%rax
  801ca5:	00 00 00 
  801ca8:	ff d0                	callq  *%rax
  801caa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801cae:	8b 50 10             	mov    0x10(%rax),%edx
  801cb1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801cb5:	89 10                	mov    %edx,(%rax)
  801cb7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801cba:	c9                   	leaveq 
  801cbb:	c3                   	retq   

0000000000801cbc <nsipc_bind>:
  801cbc:	55                   	push   %rbp
  801cbd:	48 89 e5             	mov    %rsp,%rbp
  801cc0:	48 83 ec 10          	sub    $0x10,%rsp
  801cc4:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801cc7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801ccb:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801cce:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  801cd5:	00 00 00 
  801cd8:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801cdb:	89 10                	mov    %edx,(%rax)
  801cdd:	8b 55 f8             	mov    -0x8(%rbp),%edx
  801ce0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801ce4:	48 89 c6             	mov    %rax,%rsi
  801ce7:	48 bf 04 a0 80 00 00 	movabs $0x80a004,%rdi
  801cee:	00 00 00 
  801cf1:	48 b8 96 39 80 00 00 	movabs $0x803996,%rax
  801cf8:	00 00 00 
  801cfb:	ff d0                	callq  *%rax
  801cfd:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  801d04:	00 00 00 
  801d07:	8b 55 f8             	mov    -0x8(%rbp),%edx
  801d0a:	89 50 14             	mov    %edx,0x14(%rax)
  801d0d:	bf 02 00 00 00       	mov    $0x2,%edi
  801d12:	48 b8 bc 1b 80 00 00 	movabs $0x801bbc,%rax
  801d19:	00 00 00 
  801d1c:	ff d0                	callq  *%rax
  801d1e:	c9                   	leaveq 
  801d1f:	c3                   	retq   

0000000000801d20 <nsipc_shutdown>:
  801d20:	55                   	push   %rbp
  801d21:	48 89 e5             	mov    %rsp,%rbp
  801d24:	48 83 ec 10          	sub    $0x10,%rsp
  801d28:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801d2b:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801d2e:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  801d35:	00 00 00 
  801d38:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801d3b:	89 10                	mov    %edx,(%rax)
  801d3d:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  801d44:	00 00 00 
  801d47:	8b 55 f8             	mov    -0x8(%rbp),%edx
  801d4a:	89 50 04             	mov    %edx,0x4(%rax)
  801d4d:	bf 03 00 00 00       	mov    $0x3,%edi
  801d52:	48 b8 bc 1b 80 00 00 	movabs $0x801bbc,%rax
  801d59:	00 00 00 
  801d5c:	ff d0                	callq  *%rax
  801d5e:	c9                   	leaveq 
  801d5f:	c3                   	retq   

0000000000801d60 <nsipc_close>:
  801d60:	55                   	push   %rbp
  801d61:	48 89 e5             	mov    %rsp,%rbp
  801d64:	48 83 ec 10          	sub    $0x10,%rsp
  801d68:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801d6b:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  801d72:	00 00 00 
  801d75:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801d78:	89 10                	mov    %edx,(%rax)
  801d7a:	bf 04 00 00 00       	mov    $0x4,%edi
  801d7f:	48 b8 bc 1b 80 00 00 	movabs $0x801bbc,%rax
  801d86:	00 00 00 
  801d89:	ff d0                	callq  *%rax
  801d8b:	c9                   	leaveq 
  801d8c:	c3                   	retq   

0000000000801d8d <nsipc_connect>:
  801d8d:	55                   	push   %rbp
  801d8e:	48 89 e5             	mov    %rsp,%rbp
  801d91:	48 83 ec 10          	sub    $0x10,%rsp
  801d95:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801d98:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d9c:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801d9f:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  801da6:	00 00 00 
  801da9:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801dac:	89 10                	mov    %edx,(%rax)
  801dae:	8b 55 f8             	mov    -0x8(%rbp),%edx
  801db1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801db5:	48 89 c6             	mov    %rax,%rsi
  801db8:	48 bf 04 a0 80 00 00 	movabs $0x80a004,%rdi
  801dbf:	00 00 00 
  801dc2:	48 b8 96 39 80 00 00 	movabs $0x803996,%rax
  801dc9:	00 00 00 
  801dcc:	ff d0                	callq  *%rax
  801dce:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  801dd5:	00 00 00 
  801dd8:	8b 55 f8             	mov    -0x8(%rbp),%edx
  801ddb:	89 50 14             	mov    %edx,0x14(%rax)
  801dde:	bf 05 00 00 00       	mov    $0x5,%edi
  801de3:	48 b8 bc 1b 80 00 00 	movabs $0x801bbc,%rax
  801dea:	00 00 00 
  801ded:	ff d0                	callq  *%rax
  801def:	c9                   	leaveq 
  801df0:	c3                   	retq   

0000000000801df1 <nsipc_listen>:
  801df1:	55                   	push   %rbp
  801df2:	48 89 e5             	mov    %rsp,%rbp
  801df5:	48 83 ec 10          	sub    $0x10,%rsp
  801df9:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801dfc:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801dff:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  801e06:	00 00 00 
  801e09:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801e0c:	89 10                	mov    %edx,(%rax)
  801e0e:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  801e15:	00 00 00 
  801e18:	8b 55 f8             	mov    -0x8(%rbp),%edx
  801e1b:	89 50 04             	mov    %edx,0x4(%rax)
  801e1e:	bf 06 00 00 00       	mov    $0x6,%edi
  801e23:	48 b8 bc 1b 80 00 00 	movabs $0x801bbc,%rax
  801e2a:	00 00 00 
  801e2d:	ff d0                	callq  *%rax
  801e2f:	c9                   	leaveq 
  801e30:	c3                   	retq   

0000000000801e31 <nsipc_recv>:
  801e31:	55                   	push   %rbp
  801e32:	48 89 e5             	mov    %rsp,%rbp
  801e35:	48 83 ec 30          	sub    $0x30,%rsp
  801e39:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801e3c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801e40:	89 55 e8             	mov    %edx,-0x18(%rbp)
  801e43:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  801e46:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  801e4d:	00 00 00 
  801e50:	8b 55 ec             	mov    -0x14(%rbp),%edx
  801e53:	89 10                	mov    %edx,(%rax)
  801e55:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  801e5c:	00 00 00 
  801e5f:	8b 55 e8             	mov    -0x18(%rbp),%edx
  801e62:	89 50 04             	mov    %edx,0x4(%rax)
  801e65:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  801e6c:	00 00 00 
  801e6f:	8b 55 dc             	mov    -0x24(%rbp),%edx
  801e72:	89 50 08             	mov    %edx,0x8(%rax)
  801e75:	bf 07 00 00 00       	mov    $0x7,%edi
  801e7a:	48 b8 bc 1b 80 00 00 	movabs $0x801bbc,%rax
  801e81:	00 00 00 
  801e84:	ff d0                	callq  *%rax
  801e86:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801e89:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801e8d:	78 69                	js     801ef8 <nsipc_recv+0xc7>
  801e8f:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  801e96:	7f 08                	jg     801ea0 <nsipc_recv+0x6f>
  801e98:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e9b:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  801e9e:	7e 35                	jle    801ed5 <nsipc_recv+0xa4>
  801ea0:	48 b9 79 41 80 00 00 	movabs $0x804179,%rcx
  801ea7:	00 00 00 
  801eaa:	48 ba 8e 41 80 00 00 	movabs $0x80418e,%rdx
  801eb1:	00 00 00 
  801eb4:	be 62 00 00 00       	mov    $0x62,%esi
  801eb9:	48 bf a3 41 80 00 00 	movabs $0x8041a3,%rdi
  801ec0:	00 00 00 
  801ec3:	b8 00 00 00 00       	mov    $0x0,%eax
  801ec8:	49 b8 84 28 80 00 00 	movabs $0x802884,%r8
  801ecf:	00 00 00 
  801ed2:	41 ff d0             	callq  *%r8
  801ed5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ed8:	48 63 d0             	movslq %eax,%rdx
  801edb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801edf:	48 be 00 a0 80 00 00 	movabs $0x80a000,%rsi
  801ee6:	00 00 00 
  801ee9:	48 89 c7             	mov    %rax,%rdi
  801eec:	48 b8 96 39 80 00 00 	movabs $0x803996,%rax
  801ef3:	00 00 00 
  801ef6:	ff d0                	callq  *%rax
  801ef8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801efb:	c9                   	leaveq 
  801efc:	c3                   	retq   

0000000000801efd <nsipc_send>:
  801efd:	55                   	push   %rbp
  801efe:	48 89 e5             	mov    %rsp,%rbp
  801f01:	48 83 ec 20          	sub    $0x20,%rsp
  801f05:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801f08:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801f0c:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801f0f:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  801f12:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  801f19:	00 00 00 
  801f1c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801f1f:	89 10                	mov    %edx,(%rax)
  801f21:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  801f28:	7e 35                	jle    801f5f <nsipc_send+0x62>
  801f2a:	48 b9 b2 41 80 00 00 	movabs $0x8041b2,%rcx
  801f31:	00 00 00 
  801f34:	48 ba 8e 41 80 00 00 	movabs $0x80418e,%rdx
  801f3b:	00 00 00 
  801f3e:	be 6d 00 00 00       	mov    $0x6d,%esi
  801f43:	48 bf a3 41 80 00 00 	movabs $0x8041a3,%rdi
  801f4a:	00 00 00 
  801f4d:	b8 00 00 00 00       	mov    $0x0,%eax
  801f52:	49 b8 84 28 80 00 00 	movabs $0x802884,%r8
  801f59:	00 00 00 
  801f5c:	41 ff d0             	callq  *%r8
  801f5f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801f62:	48 63 d0             	movslq %eax,%rdx
  801f65:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801f69:	48 89 c6             	mov    %rax,%rsi
  801f6c:	48 bf 0c a0 80 00 00 	movabs $0x80a00c,%rdi
  801f73:	00 00 00 
  801f76:	48 b8 96 39 80 00 00 	movabs $0x803996,%rax
  801f7d:	00 00 00 
  801f80:	ff d0                	callq  *%rax
  801f82:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  801f89:	00 00 00 
  801f8c:	8b 55 f8             	mov    -0x8(%rbp),%edx
  801f8f:	89 50 04             	mov    %edx,0x4(%rax)
  801f92:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  801f99:	00 00 00 
  801f9c:	8b 55 ec             	mov    -0x14(%rbp),%edx
  801f9f:	89 50 08             	mov    %edx,0x8(%rax)
  801fa2:	bf 08 00 00 00       	mov    $0x8,%edi
  801fa7:	48 b8 bc 1b 80 00 00 	movabs $0x801bbc,%rax
  801fae:	00 00 00 
  801fb1:	ff d0                	callq  *%rax
  801fb3:	c9                   	leaveq 
  801fb4:	c3                   	retq   

0000000000801fb5 <nsipc_socket>:
  801fb5:	55                   	push   %rbp
  801fb6:	48 89 e5             	mov    %rsp,%rbp
  801fb9:	48 83 ec 10          	sub    $0x10,%rsp
  801fbd:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801fc0:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801fc3:	89 55 f4             	mov    %edx,-0xc(%rbp)
  801fc6:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  801fcd:	00 00 00 
  801fd0:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801fd3:	89 10                	mov    %edx,(%rax)
  801fd5:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  801fdc:	00 00 00 
  801fdf:	8b 55 f8             	mov    -0x8(%rbp),%edx
  801fe2:	89 50 04             	mov    %edx,0x4(%rax)
  801fe5:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  801fec:	00 00 00 
  801fef:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801ff2:	89 50 08             	mov    %edx,0x8(%rax)
  801ff5:	bf 09 00 00 00       	mov    $0x9,%edi
  801ffa:	48 b8 bc 1b 80 00 00 	movabs $0x801bbc,%rax
  802001:	00 00 00 
  802004:	ff d0                	callq  *%rax
  802006:	c9                   	leaveq 
  802007:	c3                   	retq   

0000000000802008 <pipe>:
  802008:	55                   	push   %rbp
  802009:	48 89 e5             	mov    %rsp,%rbp
  80200c:	53                   	push   %rbx
  80200d:	48 83 ec 38          	sub    $0x38,%rsp
  802011:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  802015:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  802019:	48 89 c7             	mov    %rax,%rdi
  80201c:	48 b8 1f 08 80 00 00 	movabs $0x80081f,%rax
  802023:	00 00 00 
  802026:	ff d0                	callq  *%rax
  802028:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80202b:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80202f:	0f 88 bf 01 00 00    	js     8021f4 <pipe+0x1ec>
  802035:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802039:	ba 07 04 00 00       	mov    $0x407,%edx
  80203e:	48 89 c6             	mov    %rax,%rsi
  802041:	bf 00 00 00 00       	mov    $0x0,%edi
  802046:	48 b8 f3 02 80 00 00 	movabs $0x8002f3,%rax
  80204d:	00 00 00 
  802050:	ff d0                	callq  *%rax
  802052:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802055:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802059:	0f 88 95 01 00 00    	js     8021f4 <pipe+0x1ec>
  80205f:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  802063:	48 89 c7             	mov    %rax,%rdi
  802066:	48 b8 1f 08 80 00 00 	movabs $0x80081f,%rax
  80206d:	00 00 00 
  802070:	ff d0                	callq  *%rax
  802072:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802075:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802079:	0f 88 5d 01 00 00    	js     8021dc <pipe+0x1d4>
  80207f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802083:	ba 07 04 00 00       	mov    $0x407,%edx
  802088:	48 89 c6             	mov    %rax,%rsi
  80208b:	bf 00 00 00 00       	mov    $0x0,%edi
  802090:	48 b8 f3 02 80 00 00 	movabs $0x8002f3,%rax
  802097:	00 00 00 
  80209a:	ff d0                	callq  *%rax
  80209c:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80209f:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8020a3:	0f 88 33 01 00 00    	js     8021dc <pipe+0x1d4>
  8020a9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8020ad:	48 89 c7             	mov    %rax,%rdi
  8020b0:	48 b8 f4 07 80 00 00 	movabs $0x8007f4,%rax
  8020b7:	00 00 00 
  8020ba:	ff d0                	callq  *%rax
  8020bc:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8020c0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8020c4:	ba 07 04 00 00       	mov    $0x407,%edx
  8020c9:	48 89 c6             	mov    %rax,%rsi
  8020cc:	bf 00 00 00 00       	mov    $0x0,%edi
  8020d1:	48 b8 f3 02 80 00 00 	movabs $0x8002f3,%rax
  8020d8:	00 00 00 
  8020db:	ff d0                	callq  *%rax
  8020dd:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8020e0:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8020e4:	79 05                	jns    8020eb <pipe+0xe3>
  8020e6:	e9 d9 00 00 00       	jmpq   8021c4 <pipe+0x1bc>
  8020eb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8020ef:	48 89 c7             	mov    %rax,%rdi
  8020f2:	48 b8 f4 07 80 00 00 	movabs $0x8007f4,%rax
  8020f9:	00 00 00 
  8020fc:	ff d0                	callq  *%rax
  8020fe:	48 89 c2             	mov    %rax,%rdx
  802101:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802105:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  80210b:	48 89 d1             	mov    %rdx,%rcx
  80210e:	ba 00 00 00 00       	mov    $0x0,%edx
  802113:	48 89 c6             	mov    %rax,%rsi
  802116:	bf 00 00 00 00       	mov    $0x0,%edi
  80211b:	48 b8 43 03 80 00 00 	movabs $0x800343,%rax
  802122:	00 00 00 
  802125:	ff d0                	callq  *%rax
  802127:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80212a:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80212e:	79 1b                	jns    80214b <pipe+0x143>
  802130:	90                   	nop
  802131:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802135:	48 89 c6             	mov    %rax,%rsi
  802138:	bf 00 00 00 00       	mov    $0x0,%edi
  80213d:	48 b8 9e 03 80 00 00 	movabs $0x80039e,%rax
  802144:	00 00 00 
  802147:	ff d0                	callq  *%rax
  802149:	eb 79                	jmp    8021c4 <pipe+0x1bc>
  80214b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80214f:	48 ba e0 60 80 00 00 	movabs $0x8060e0,%rdx
  802156:	00 00 00 
  802159:	8b 12                	mov    (%rdx),%edx
  80215b:	89 10                	mov    %edx,(%rax)
  80215d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802161:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  802168:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80216c:	48 ba e0 60 80 00 00 	movabs $0x8060e0,%rdx
  802173:	00 00 00 
  802176:	8b 12                	mov    (%rdx),%edx
  802178:	89 10                	mov    %edx,(%rax)
  80217a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80217e:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  802185:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802189:	48 89 c7             	mov    %rax,%rdi
  80218c:	48 b8 d1 07 80 00 00 	movabs $0x8007d1,%rax
  802193:	00 00 00 
  802196:	ff d0                	callq  *%rax
  802198:	89 c2                	mov    %eax,%edx
  80219a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80219e:	89 10                	mov    %edx,(%rax)
  8021a0:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8021a4:	48 8d 58 04          	lea    0x4(%rax),%rbx
  8021a8:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8021ac:	48 89 c7             	mov    %rax,%rdi
  8021af:	48 b8 d1 07 80 00 00 	movabs $0x8007d1,%rax
  8021b6:	00 00 00 
  8021b9:	ff d0                	callq  *%rax
  8021bb:	89 03                	mov    %eax,(%rbx)
  8021bd:	b8 00 00 00 00       	mov    $0x0,%eax
  8021c2:	eb 33                	jmp    8021f7 <pipe+0x1ef>
  8021c4:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8021c8:	48 89 c6             	mov    %rax,%rsi
  8021cb:	bf 00 00 00 00       	mov    $0x0,%edi
  8021d0:	48 b8 9e 03 80 00 00 	movabs $0x80039e,%rax
  8021d7:	00 00 00 
  8021da:	ff d0                	callq  *%rax
  8021dc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8021e0:	48 89 c6             	mov    %rax,%rsi
  8021e3:	bf 00 00 00 00       	mov    $0x0,%edi
  8021e8:	48 b8 9e 03 80 00 00 	movabs $0x80039e,%rax
  8021ef:	00 00 00 
  8021f2:	ff d0                	callq  *%rax
  8021f4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8021f7:	48 83 c4 38          	add    $0x38,%rsp
  8021fb:	5b                   	pop    %rbx
  8021fc:	5d                   	pop    %rbp
  8021fd:	c3                   	retq   

00000000008021fe <_pipeisclosed>:
  8021fe:	55                   	push   %rbp
  8021ff:	48 89 e5             	mov    %rsp,%rbp
  802202:	53                   	push   %rbx
  802203:	48 83 ec 28          	sub    $0x28,%rsp
  802207:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80220b:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80220f:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  802216:	00 00 00 
  802219:	48 8b 00             	mov    (%rax),%rax
  80221c:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802222:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802225:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802229:	48 89 c7             	mov    %rax,%rdi
  80222c:	48 b8 94 3f 80 00 00 	movabs $0x803f94,%rax
  802233:	00 00 00 
  802236:	ff d0                	callq  *%rax
  802238:	89 c3                	mov    %eax,%ebx
  80223a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80223e:	48 89 c7             	mov    %rax,%rdi
  802241:	48 b8 94 3f 80 00 00 	movabs $0x803f94,%rax
  802248:	00 00 00 
  80224b:	ff d0                	callq  *%rax
  80224d:	39 c3                	cmp    %eax,%ebx
  80224f:	0f 94 c0             	sete   %al
  802252:	0f b6 c0             	movzbl %al,%eax
  802255:	89 45 e8             	mov    %eax,-0x18(%rbp)
  802258:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  80225f:	00 00 00 
  802262:	48 8b 00             	mov    (%rax),%rax
  802265:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80226b:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  80226e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802271:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  802274:	75 05                	jne    80227b <_pipeisclosed+0x7d>
  802276:	8b 45 e8             	mov    -0x18(%rbp),%eax
  802279:	eb 4f                	jmp    8022ca <_pipeisclosed+0xcc>
  80227b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80227e:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  802281:	74 42                	je     8022c5 <_pipeisclosed+0xc7>
  802283:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  802287:	75 3c                	jne    8022c5 <_pipeisclosed+0xc7>
  802289:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  802290:	00 00 00 
  802293:	48 8b 00             	mov    (%rax),%rax
  802296:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  80229c:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  80229f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8022a2:	89 c6                	mov    %eax,%esi
  8022a4:	48 bf c3 41 80 00 00 	movabs $0x8041c3,%rdi
  8022ab:	00 00 00 
  8022ae:	b8 00 00 00 00       	mov    $0x0,%eax
  8022b3:	49 b8 bd 2a 80 00 00 	movabs $0x802abd,%r8
  8022ba:	00 00 00 
  8022bd:	41 ff d0             	callq  *%r8
  8022c0:	e9 4a ff ff ff       	jmpq   80220f <_pipeisclosed+0x11>
  8022c5:	e9 45 ff ff ff       	jmpq   80220f <_pipeisclosed+0x11>
  8022ca:	48 83 c4 28          	add    $0x28,%rsp
  8022ce:	5b                   	pop    %rbx
  8022cf:	5d                   	pop    %rbp
  8022d0:	c3                   	retq   

00000000008022d1 <pipeisclosed>:
  8022d1:	55                   	push   %rbp
  8022d2:	48 89 e5             	mov    %rsp,%rbp
  8022d5:	48 83 ec 30          	sub    $0x30,%rsp
  8022d9:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8022dc:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8022e0:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8022e3:	48 89 d6             	mov    %rdx,%rsi
  8022e6:	89 c7                	mov    %eax,%edi
  8022e8:	48 b8 b7 08 80 00 00 	movabs $0x8008b7,%rax
  8022ef:	00 00 00 
  8022f2:	ff d0                	callq  *%rax
  8022f4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8022f7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8022fb:	79 05                	jns    802302 <pipeisclosed+0x31>
  8022fd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802300:	eb 31                	jmp    802333 <pipeisclosed+0x62>
  802302:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802306:	48 89 c7             	mov    %rax,%rdi
  802309:	48 b8 f4 07 80 00 00 	movabs $0x8007f4,%rax
  802310:	00 00 00 
  802313:	ff d0                	callq  *%rax
  802315:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802319:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80231d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802321:	48 89 d6             	mov    %rdx,%rsi
  802324:	48 89 c7             	mov    %rax,%rdi
  802327:	48 b8 fe 21 80 00 00 	movabs $0x8021fe,%rax
  80232e:	00 00 00 
  802331:	ff d0                	callq  *%rax
  802333:	c9                   	leaveq 
  802334:	c3                   	retq   

0000000000802335 <devpipe_read>:
  802335:	55                   	push   %rbp
  802336:	48 89 e5             	mov    %rsp,%rbp
  802339:	48 83 ec 40          	sub    $0x40,%rsp
  80233d:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802341:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802345:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802349:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80234d:	48 89 c7             	mov    %rax,%rdi
  802350:	48 b8 f4 07 80 00 00 	movabs $0x8007f4,%rax
  802357:	00 00 00 
  80235a:	ff d0                	callq  *%rax
  80235c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802360:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802364:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802368:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80236f:	00 
  802370:	e9 92 00 00 00       	jmpq   802407 <devpipe_read+0xd2>
  802375:	eb 41                	jmp    8023b8 <devpipe_read+0x83>
  802377:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  80237c:	74 09                	je     802387 <devpipe_read+0x52>
  80237e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802382:	e9 92 00 00 00       	jmpq   802419 <devpipe_read+0xe4>
  802387:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80238b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80238f:	48 89 d6             	mov    %rdx,%rsi
  802392:	48 89 c7             	mov    %rax,%rdi
  802395:	48 b8 fe 21 80 00 00 	movabs $0x8021fe,%rax
  80239c:	00 00 00 
  80239f:	ff d0                	callq  *%rax
  8023a1:	85 c0                	test   %eax,%eax
  8023a3:	74 07                	je     8023ac <devpipe_read+0x77>
  8023a5:	b8 00 00 00 00       	mov    $0x0,%eax
  8023aa:	eb 6d                	jmp    802419 <devpipe_read+0xe4>
  8023ac:	48 b8 b5 02 80 00 00 	movabs $0x8002b5,%rax
  8023b3:	00 00 00 
  8023b6:	ff d0                	callq  *%rax
  8023b8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8023bc:	8b 10                	mov    (%rax),%edx
  8023be:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8023c2:	8b 40 04             	mov    0x4(%rax),%eax
  8023c5:	39 c2                	cmp    %eax,%edx
  8023c7:	74 ae                	je     802377 <devpipe_read+0x42>
  8023c9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8023cd:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8023d1:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  8023d5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8023d9:	8b 00                	mov    (%rax),%eax
  8023db:	99                   	cltd   
  8023dc:	c1 ea 1b             	shr    $0x1b,%edx
  8023df:	01 d0                	add    %edx,%eax
  8023e1:	83 e0 1f             	and    $0x1f,%eax
  8023e4:	29 d0                	sub    %edx,%eax
  8023e6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8023ea:	48 98                	cltq   
  8023ec:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  8023f1:	88 01                	mov    %al,(%rcx)
  8023f3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8023f7:	8b 00                	mov    (%rax),%eax
  8023f9:	8d 50 01             	lea    0x1(%rax),%edx
  8023fc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802400:	89 10                	mov    %edx,(%rax)
  802402:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  802407:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80240b:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  80240f:	0f 82 60 ff ff ff    	jb     802375 <devpipe_read+0x40>
  802415:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802419:	c9                   	leaveq 
  80241a:	c3                   	retq   

000000000080241b <devpipe_write>:
  80241b:	55                   	push   %rbp
  80241c:	48 89 e5             	mov    %rsp,%rbp
  80241f:	48 83 ec 40          	sub    $0x40,%rsp
  802423:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802427:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80242b:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80242f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802433:	48 89 c7             	mov    %rax,%rdi
  802436:	48 b8 f4 07 80 00 00 	movabs $0x8007f4,%rax
  80243d:	00 00 00 
  802440:	ff d0                	callq  *%rax
  802442:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802446:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80244a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80244e:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  802455:	00 
  802456:	e9 8e 00 00 00       	jmpq   8024e9 <devpipe_write+0xce>
  80245b:	eb 31                	jmp    80248e <devpipe_write+0x73>
  80245d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802461:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802465:	48 89 d6             	mov    %rdx,%rsi
  802468:	48 89 c7             	mov    %rax,%rdi
  80246b:	48 b8 fe 21 80 00 00 	movabs $0x8021fe,%rax
  802472:	00 00 00 
  802475:	ff d0                	callq  *%rax
  802477:	85 c0                	test   %eax,%eax
  802479:	74 07                	je     802482 <devpipe_write+0x67>
  80247b:	b8 00 00 00 00       	mov    $0x0,%eax
  802480:	eb 79                	jmp    8024fb <devpipe_write+0xe0>
  802482:	48 b8 b5 02 80 00 00 	movabs $0x8002b5,%rax
  802489:	00 00 00 
  80248c:	ff d0                	callq  *%rax
  80248e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802492:	8b 40 04             	mov    0x4(%rax),%eax
  802495:	48 63 d0             	movslq %eax,%rdx
  802498:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80249c:	8b 00                	mov    (%rax),%eax
  80249e:	48 98                	cltq   
  8024a0:	48 83 c0 20          	add    $0x20,%rax
  8024a4:	48 39 c2             	cmp    %rax,%rdx
  8024a7:	73 b4                	jae    80245d <devpipe_write+0x42>
  8024a9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8024ad:	8b 40 04             	mov    0x4(%rax),%eax
  8024b0:	99                   	cltd   
  8024b1:	c1 ea 1b             	shr    $0x1b,%edx
  8024b4:	01 d0                	add    %edx,%eax
  8024b6:	83 e0 1f             	and    $0x1f,%eax
  8024b9:	29 d0                	sub    %edx,%eax
  8024bb:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8024bf:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8024c3:	48 01 ca             	add    %rcx,%rdx
  8024c6:	0f b6 0a             	movzbl (%rdx),%ecx
  8024c9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8024cd:	48 98                	cltq   
  8024cf:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  8024d3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8024d7:	8b 40 04             	mov    0x4(%rax),%eax
  8024da:	8d 50 01             	lea    0x1(%rax),%edx
  8024dd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8024e1:	89 50 04             	mov    %edx,0x4(%rax)
  8024e4:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8024e9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8024ed:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8024f1:	0f 82 64 ff ff ff    	jb     80245b <devpipe_write+0x40>
  8024f7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8024fb:	c9                   	leaveq 
  8024fc:	c3                   	retq   

00000000008024fd <devpipe_stat>:
  8024fd:	55                   	push   %rbp
  8024fe:	48 89 e5             	mov    %rsp,%rbp
  802501:	48 83 ec 20          	sub    $0x20,%rsp
  802505:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802509:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80250d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802511:	48 89 c7             	mov    %rax,%rdi
  802514:	48 b8 f4 07 80 00 00 	movabs $0x8007f4,%rax
  80251b:	00 00 00 
  80251e:	ff d0                	callq  *%rax
  802520:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802524:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802528:	48 be d6 41 80 00 00 	movabs $0x8041d6,%rsi
  80252f:	00 00 00 
  802532:	48 89 c7             	mov    %rax,%rdi
  802535:	48 b8 72 36 80 00 00 	movabs $0x803672,%rax
  80253c:	00 00 00 
  80253f:	ff d0                	callq  *%rax
  802541:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802545:	8b 50 04             	mov    0x4(%rax),%edx
  802548:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80254c:	8b 00                	mov    (%rax),%eax
  80254e:	29 c2                	sub    %eax,%edx
  802550:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802554:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  80255a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80255e:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  802565:	00 00 00 
  802568:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80256c:	48 b9 e0 60 80 00 00 	movabs $0x8060e0,%rcx
  802573:	00 00 00 
  802576:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  80257d:	b8 00 00 00 00       	mov    $0x0,%eax
  802582:	c9                   	leaveq 
  802583:	c3                   	retq   

0000000000802584 <devpipe_close>:
  802584:	55                   	push   %rbp
  802585:	48 89 e5             	mov    %rsp,%rbp
  802588:	48 83 ec 10          	sub    $0x10,%rsp
  80258c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802590:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802594:	48 89 c6             	mov    %rax,%rsi
  802597:	bf 00 00 00 00       	mov    $0x0,%edi
  80259c:	48 b8 9e 03 80 00 00 	movabs $0x80039e,%rax
  8025a3:	00 00 00 
  8025a6:	ff d0                	callq  *%rax
  8025a8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8025ac:	48 89 c7             	mov    %rax,%rdi
  8025af:	48 b8 f4 07 80 00 00 	movabs $0x8007f4,%rax
  8025b6:	00 00 00 
  8025b9:	ff d0                	callq  *%rax
  8025bb:	48 89 c6             	mov    %rax,%rsi
  8025be:	bf 00 00 00 00       	mov    $0x0,%edi
  8025c3:	48 b8 9e 03 80 00 00 	movabs $0x80039e,%rax
  8025ca:	00 00 00 
  8025cd:	ff d0                	callq  *%rax
  8025cf:	c9                   	leaveq 
  8025d0:	c3                   	retq   

00000000008025d1 <cputchar>:
  8025d1:	55                   	push   %rbp
  8025d2:	48 89 e5             	mov    %rsp,%rbp
  8025d5:	48 83 ec 20          	sub    $0x20,%rsp
  8025d9:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8025dc:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8025df:	88 45 ff             	mov    %al,-0x1(%rbp)
  8025e2:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  8025e6:	be 01 00 00 00       	mov    $0x1,%esi
  8025eb:	48 89 c7             	mov    %rax,%rdi
  8025ee:	48 b8 ab 01 80 00 00 	movabs $0x8001ab,%rax
  8025f5:	00 00 00 
  8025f8:	ff d0                	callq  *%rax
  8025fa:	c9                   	leaveq 
  8025fb:	c3                   	retq   

00000000008025fc <getchar>:
  8025fc:	55                   	push   %rbp
  8025fd:	48 89 e5             	mov    %rsp,%rbp
  802600:	48 83 ec 10          	sub    $0x10,%rsp
  802604:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  802608:	ba 01 00 00 00       	mov    $0x1,%edx
  80260d:	48 89 c6             	mov    %rax,%rsi
  802610:	bf 00 00 00 00       	mov    $0x0,%edi
  802615:	48 b8 e9 0c 80 00 00 	movabs $0x800ce9,%rax
  80261c:	00 00 00 
  80261f:	ff d0                	callq  *%rax
  802621:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802624:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802628:	79 05                	jns    80262f <getchar+0x33>
  80262a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80262d:	eb 14                	jmp    802643 <getchar+0x47>
  80262f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802633:	7f 07                	jg     80263c <getchar+0x40>
  802635:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  80263a:	eb 07                	jmp    802643 <getchar+0x47>
  80263c:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  802640:	0f b6 c0             	movzbl %al,%eax
  802643:	c9                   	leaveq 
  802644:	c3                   	retq   

0000000000802645 <iscons>:
  802645:	55                   	push   %rbp
  802646:	48 89 e5             	mov    %rsp,%rbp
  802649:	48 83 ec 20          	sub    $0x20,%rsp
  80264d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802650:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802654:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802657:	48 89 d6             	mov    %rdx,%rsi
  80265a:	89 c7                	mov    %eax,%edi
  80265c:	48 b8 b7 08 80 00 00 	movabs $0x8008b7,%rax
  802663:	00 00 00 
  802666:	ff d0                	callq  *%rax
  802668:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80266b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80266f:	79 05                	jns    802676 <iscons+0x31>
  802671:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802674:	eb 1a                	jmp    802690 <iscons+0x4b>
  802676:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80267a:	8b 10                	mov    (%rax),%edx
  80267c:	48 b8 20 61 80 00 00 	movabs $0x806120,%rax
  802683:	00 00 00 
  802686:	8b 00                	mov    (%rax),%eax
  802688:	39 c2                	cmp    %eax,%edx
  80268a:	0f 94 c0             	sete   %al
  80268d:	0f b6 c0             	movzbl %al,%eax
  802690:	c9                   	leaveq 
  802691:	c3                   	retq   

0000000000802692 <opencons>:
  802692:	55                   	push   %rbp
  802693:	48 89 e5             	mov    %rsp,%rbp
  802696:	48 83 ec 10          	sub    $0x10,%rsp
  80269a:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  80269e:	48 89 c7             	mov    %rax,%rdi
  8026a1:	48 b8 1f 08 80 00 00 	movabs $0x80081f,%rax
  8026a8:	00 00 00 
  8026ab:	ff d0                	callq  *%rax
  8026ad:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8026b0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8026b4:	79 05                	jns    8026bb <opencons+0x29>
  8026b6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8026b9:	eb 5b                	jmp    802716 <opencons+0x84>
  8026bb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8026bf:	ba 07 04 00 00       	mov    $0x407,%edx
  8026c4:	48 89 c6             	mov    %rax,%rsi
  8026c7:	bf 00 00 00 00       	mov    $0x0,%edi
  8026cc:	48 b8 f3 02 80 00 00 	movabs $0x8002f3,%rax
  8026d3:	00 00 00 
  8026d6:	ff d0                	callq  *%rax
  8026d8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8026db:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8026df:	79 05                	jns    8026e6 <opencons+0x54>
  8026e1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8026e4:	eb 30                	jmp    802716 <opencons+0x84>
  8026e6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8026ea:	48 ba 20 61 80 00 00 	movabs $0x806120,%rdx
  8026f1:	00 00 00 
  8026f4:	8b 12                	mov    (%rdx),%edx
  8026f6:	89 10                	mov    %edx,(%rax)
  8026f8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8026fc:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  802703:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802707:	48 89 c7             	mov    %rax,%rdi
  80270a:	48 b8 d1 07 80 00 00 	movabs $0x8007d1,%rax
  802711:	00 00 00 
  802714:	ff d0                	callq  *%rax
  802716:	c9                   	leaveq 
  802717:	c3                   	retq   

0000000000802718 <devcons_read>:
  802718:	55                   	push   %rbp
  802719:	48 89 e5             	mov    %rsp,%rbp
  80271c:	48 83 ec 30          	sub    $0x30,%rsp
  802720:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802724:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802728:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80272c:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  802731:	75 07                	jne    80273a <devcons_read+0x22>
  802733:	b8 00 00 00 00       	mov    $0x0,%eax
  802738:	eb 4b                	jmp    802785 <devcons_read+0x6d>
  80273a:	eb 0c                	jmp    802748 <devcons_read+0x30>
  80273c:	48 b8 b5 02 80 00 00 	movabs $0x8002b5,%rax
  802743:	00 00 00 
  802746:	ff d0                	callq  *%rax
  802748:	48 b8 f5 01 80 00 00 	movabs $0x8001f5,%rax
  80274f:	00 00 00 
  802752:	ff d0                	callq  *%rax
  802754:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802757:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80275b:	74 df                	je     80273c <devcons_read+0x24>
  80275d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802761:	79 05                	jns    802768 <devcons_read+0x50>
  802763:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802766:	eb 1d                	jmp    802785 <devcons_read+0x6d>
  802768:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  80276c:	75 07                	jne    802775 <devcons_read+0x5d>
  80276e:	b8 00 00 00 00       	mov    $0x0,%eax
  802773:	eb 10                	jmp    802785 <devcons_read+0x6d>
  802775:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802778:	89 c2                	mov    %eax,%edx
  80277a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80277e:	88 10                	mov    %dl,(%rax)
  802780:	b8 01 00 00 00       	mov    $0x1,%eax
  802785:	c9                   	leaveq 
  802786:	c3                   	retq   

0000000000802787 <devcons_write>:
  802787:	55                   	push   %rbp
  802788:	48 89 e5             	mov    %rsp,%rbp
  80278b:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  802792:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  802799:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  8027a0:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  8027a7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8027ae:	eb 76                	jmp    802826 <devcons_write+0x9f>
  8027b0:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  8027b7:	89 c2                	mov    %eax,%edx
  8027b9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8027bc:	29 c2                	sub    %eax,%edx
  8027be:	89 d0                	mov    %edx,%eax
  8027c0:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8027c3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8027c6:	83 f8 7f             	cmp    $0x7f,%eax
  8027c9:	76 07                	jbe    8027d2 <devcons_write+0x4b>
  8027cb:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  8027d2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8027d5:	48 63 d0             	movslq %eax,%rdx
  8027d8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8027db:	48 63 c8             	movslq %eax,%rcx
  8027de:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  8027e5:	48 01 c1             	add    %rax,%rcx
  8027e8:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  8027ef:	48 89 ce             	mov    %rcx,%rsi
  8027f2:	48 89 c7             	mov    %rax,%rdi
  8027f5:	48 b8 96 39 80 00 00 	movabs $0x803996,%rax
  8027fc:	00 00 00 
  8027ff:	ff d0                	callq  *%rax
  802801:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802804:	48 63 d0             	movslq %eax,%rdx
  802807:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  80280e:	48 89 d6             	mov    %rdx,%rsi
  802811:	48 89 c7             	mov    %rax,%rdi
  802814:	48 b8 ab 01 80 00 00 	movabs $0x8001ab,%rax
  80281b:	00 00 00 
  80281e:	ff d0                	callq  *%rax
  802820:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802823:	01 45 fc             	add    %eax,-0x4(%rbp)
  802826:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802829:	48 98                	cltq   
  80282b:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  802832:	0f 82 78 ff ff ff    	jb     8027b0 <devcons_write+0x29>
  802838:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80283b:	c9                   	leaveq 
  80283c:	c3                   	retq   

000000000080283d <devcons_close>:
  80283d:	55                   	push   %rbp
  80283e:	48 89 e5             	mov    %rsp,%rbp
  802841:	48 83 ec 08          	sub    $0x8,%rsp
  802845:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802849:	b8 00 00 00 00       	mov    $0x0,%eax
  80284e:	c9                   	leaveq 
  80284f:	c3                   	retq   

0000000000802850 <devcons_stat>:
  802850:	55                   	push   %rbp
  802851:	48 89 e5             	mov    %rsp,%rbp
  802854:	48 83 ec 10          	sub    $0x10,%rsp
  802858:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80285c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802860:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802864:	48 be e2 41 80 00 00 	movabs $0x8041e2,%rsi
  80286b:	00 00 00 
  80286e:	48 89 c7             	mov    %rax,%rdi
  802871:	48 b8 72 36 80 00 00 	movabs $0x803672,%rax
  802878:	00 00 00 
  80287b:	ff d0                	callq  *%rax
  80287d:	b8 00 00 00 00       	mov    $0x0,%eax
  802882:	c9                   	leaveq 
  802883:	c3                   	retq   

0000000000802884 <_panic>:
  802884:	55                   	push   %rbp
  802885:	48 89 e5             	mov    %rsp,%rbp
  802888:	53                   	push   %rbx
  802889:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  802890:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  802897:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  80289d:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  8028a4:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  8028ab:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  8028b2:	84 c0                	test   %al,%al
  8028b4:	74 23                	je     8028d9 <_panic+0x55>
  8028b6:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  8028bd:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  8028c1:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  8028c5:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  8028c9:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  8028cd:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  8028d1:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  8028d5:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  8028d9:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  8028e0:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  8028e7:	00 00 00 
  8028ea:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  8028f1:	00 00 00 
  8028f4:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8028f8:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  8028ff:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  802906:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  80290d:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  802914:	00 00 00 
  802917:	48 8b 18             	mov    (%rax),%rbx
  80291a:	48 b8 77 02 80 00 00 	movabs $0x800277,%rax
  802921:	00 00 00 
  802924:	ff d0                	callq  *%rax
  802926:	8b 8d 14 ff ff ff    	mov    -0xec(%rbp),%ecx
  80292c:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  802933:	41 89 c8             	mov    %ecx,%r8d
  802936:	48 89 d1             	mov    %rdx,%rcx
  802939:	48 89 da             	mov    %rbx,%rdx
  80293c:	89 c6                	mov    %eax,%esi
  80293e:	48 bf f0 41 80 00 00 	movabs $0x8041f0,%rdi
  802945:	00 00 00 
  802948:	b8 00 00 00 00       	mov    $0x0,%eax
  80294d:	49 b9 bd 2a 80 00 00 	movabs $0x802abd,%r9
  802954:	00 00 00 
  802957:	41 ff d1             	callq  *%r9
  80295a:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  802961:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  802968:	48 89 d6             	mov    %rdx,%rsi
  80296b:	48 89 c7             	mov    %rax,%rdi
  80296e:	48 b8 11 2a 80 00 00 	movabs $0x802a11,%rax
  802975:	00 00 00 
  802978:	ff d0                	callq  *%rax
  80297a:	48 bf 13 42 80 00 00 	movabs $0x804213,%rdi
  802981:	00 00 00 
  802984:	b8 00 00 00 00       	mov    $0x0,%eax
  802989:	48 ba bd 2a 80 00 00 	movabs $0x802abd,%rdx
  802990:	00 00 00 
  802993:	ff d2                	callq  *%rdx
  802995:	cc                   	int3   
  802996:	eb fd                	jmp    802995 <_panic+0x111>

0000000000802998 <putch>:
  802998:	55                   	push   %rbp
  802999:	48 89 e5             	mov    %rsp,%rbp
  80299c:	48 83 ec 10          	sub    $0x10,%rsp
  8029a0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8029a3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8029a7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8029ab:	8b 00                	mov    (%rax),%eax
  8029ad:	8d 48 01             	lea    0x1(%rax),%ecx
  8029b0:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8029b4:	89 0a                	mov    %ecx,(%rdx)
  8029b6:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8029b9:	89 d1                	mov    %edx,%ecx
  8029bb:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8029bf:	48 98                	cltq   
  8029c1:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  8029c5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8029c9:	8b 00                	mov    (%rax),%eax
  8029cb:	3d ff 00 00 00       	cmp    $0xff,%eax
  8029d0:	75 2c                	jne    8029fe <putch+0x66>
  8029d2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8029d6:	8b 00                	mov    (%rax),%eax
  8029d8:	48 98                	cltq   
  8029da:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8029de:	48 83 c2 08          	add    $0x8,%rdx
  8029e2:	48 89 c6             	mov    %rax,%rsi
  8029e5:	48 89 d7             	mov    %rdx,%rdi
  8029e8:	48 b8 ab 01 80 00 00 	movabs $0x8001ab,%rax
  8029ef:	00 00 00 
  8029f2:	ff d0                	callq  *%rax
  8029f4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8029f8:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8029fe:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802a02:	8b 40 04             	mov    0x4(%rax),%eax
  802a05:	8d 50 01             	lea    0x1(%rax),%edx
  802a08:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802a0c:	89 50 04             	mov    %edx,0x4(%rax)
  802a0f:	c9                   	leaveq 
  802a10:	c3                   	retq   

0000000000802a11 <vcprintf>:
  802a11:	55                   	push   %rbp
  802a12:	48 89 e5             	mov    %rsp,%rbp
  802a15:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  802a1c:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  802a23:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  802a2a:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  802a31:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  802a38:	48 8b 0a             	mov    (%rdx),%rcx
  802a3b:	48 89 08             	mov    %rcx,(%rax)
  802a3e:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  802a42:	48 89 48 08          	mov    %rcx,0x8(%rax)
  802a46:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  802a4a:	48 89 50 10          	mov    %rdx,0x10(%rax)
  802a4e:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  802a55:	00 00 00 
  802a58:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  802a5f:	00 00 00 
  802a62:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  802a69:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  802a70:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  802a77:	48 89 c6             	mov    %rax,%rsi
  802a7a:	48 bf 98 29 80 00 00 	movabs $0x802998,%rdi
  802a81:	00 00 00 
  802a84:	48 b8 70 2e 80 00 00 	movabs $0x802e70,%rax
  802a8b:	00 00 00 
  802a8e:	ff d0                	callq  *%rax
  802a90:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  802a96:	48 98                	cltq   
  802a98:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  802a9f:	48 83 c2 08          	add    $0x8,%rdx
  802aa3:	48 89 c6             	mov    %rax,%rsi
  802aa6:	48 89 d7             	mov    %rdx,%rdi
  802aa9:	48 b8 ab 01 80 00 00 	movabs $0x8001ab,%rax
  802ab0:	00 00 00 
  802ab3:	ff d0                	callq  *%rax
  802ab5:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  802abb:	c9                   	leaveq 
  802abc:	c3                   	retq   

0000000000802abd <cprintf>:
  802abd:	55                   	push   %rbp
  802abe:	48 89 e5             	mov    %rsp,%rbp
  802ac1:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  802ac8:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  802acf:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  802ad6:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  802add:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  802ae4:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  802aeb:	84 c0                	test   %al,%al
  802aed:	74 20                	je     802b0f <cprintf+0x52>
  802aef:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  802af3:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  802af7:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  802afb:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  802aff:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  802b03:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  802b07:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  802b0b:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  802b0f:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  802b16:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  802b1d:	00 00 00 
  802b20:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  802b27:	00 00 00 
  802b2a:	48 8d 45 10          	lea    0x10(%rbp),%rax
  802b2e:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  802b35:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  802b3c:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  802b43:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  802b4a:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  802b51:	48 8b 0a             	mov    (%rdx),%rcx
  802b54:	48 89 08             	mov    %rcx,(%rax)
  802b57:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  802b5b:	48 89 48 08          	mov    %rcx,0x8(%rax)
  802b5f:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  802b63:	48 89 50 10          	mov    %rdx,0x10(%rax)
  802b67:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  802b6e:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  802b75:	48 89 d6             	mov    %rdx,%rsi
  802b78:	48 89 c7             	mov    %rax,%rdi
  802b7b:	48 b8 11 2a 80 00 00 	movabs $0x802a11,%rax
  802b82:	00 00 00 
  802b85:	ff d0                	callq  *%rax
  802b87:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  802b8d:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  802b93:	c9                   	leaveq 
  802b94:	c3                   	retq   

0000000000802b95 <printnum>:
  802b95:	55                   	push   %rbp
  802b96:	48 89 e5             	mov    %rsp,%rbp
  802b99:	53                   	push   %rbx
  802b9a:	48 83 ec 38          	sub    $0x38,%rsp
  802b9e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802ba2:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802ba6:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802baa:	89 4d d4             	mov    %ecx,-0x2c(%rbp)
  802bad:	44 89 45 d0          	mov    %r8d,-0x30(%rbp)
  802bb1:	44 89 4d cc          	mov    %r9d,-0x34(%rbp)
  802bb5:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  802bb8:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802bbc:	77 3b                	ja     802bf9 <printnum+0x64>
  802bbe:	8b 45 d0             	mov    -0x30(%rbp),%eax
  802bc1:	44 8d 40 ff          	lea    -0x1(%rax),%r8d
  802bc5:	8b 5d d4             	mov    -0x2c(%rbp),%ebx
  802bc8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802bcc:	ba 00 00 00 00       	mov    $0x0,%edx
  802bd1:	48 f7 f3             	div    %rbx
  802bd4:	48 89 c2             	mov    %rax,%rdx
  802bd7:	8b 7d cc             	mov    -0x34(%rbp),%edi
  802bda:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  802bdd:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
  802be1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802be5:	41 89 f9             	mov    %edi,%r9d
  802be8:	48 89 c7             	mov    %rax,%rdi
  802beb:	48 b8 95 2b 80 00 00 	movabs $0x802b95,%rax
  802bf2:	00 00 00 
  802bf5:	ff d0                	callq  *%rax
  802bf7:	eb 1e                	jmp    802c17 <printnum+0x82>
  802bf9:	eb 12                	jmp    802c0d <printnum+0x78>
  802bfb:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  802bff:	8b 55 cc             	mov    -0x34(%rbp),%edx
  802c02:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c06:	48 89 ce             	mov    %rcx,%rsi
  802c09:	89 d7                	mov    %edx,%edi
  802c0b:	ff d0                	callq  *%rax
  802c0d:	83 6d d0 01          	subl   $0x1,-0x30(%rbp)
  802c11:	83 7d d0 00          	cmpl   $0x0,-0x30(%rbp)
  802c15:	7f e4                	jg     802bfb <printnum+0x66>
  802c17:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  802c1a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802c1e:	ba 00 00 00 00       	mov    $0x0,%edx
  802c23:	48 f7 f1             	div    %rcx
  802c26:	48 89 d0             	mov    %rdx,%rax
  802c29:	48 ba 10 44 80 00 00 	movabs $0x804410,%rdx
  802c30:	00 00 00 
  802c33:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
  802c37:	0f be d0             	movsbl %al,%edx
  802c3a:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  802c3e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c42:	48 89 ce             	mov    %rcx,%rsi
  802c45:	89 d7                	mov    %edx,%edi
  802c47:	ff d0                	callq  *%rax
  802c49:	48 83 c4 38          	add    $0x38,%rsp
  802c4d:	5b                   	pop    %rbx
  802c4e:	5d                   	pop    %rbp
  802c4f:	c3                   	retq   

0000000000802c50 <getuint>:
  802c50:	55                   	push   %rbp
  802c51:	48 89 e5             	mov    %rsp,%rbp
  802c54:	48 83 ec 1c          	sub    $0x1c,%rsp
  802c58:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802c5c:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  802c5f:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  802c63:	7e 52                	jle    802cb7 <getuint+0x67>
  802c65:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c69:	8b 00                	mov    (%rax),%eax
  802c6b:	83 f8 30             	cmp    $0x30,%eax
  802c6e:	73 24                	jae    802c94 <getuint+0x44>
  802c70:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c74:	48 8b 50 10          	mov    0x10(%rax),%rdx
  802c78:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c7c:	8b 00                	mov    (%rax),%eax
  802c7e:	89 c0                	mov    %eax,%eax
  802c80:	48 01 d0             	add    %rdx,%rax
  802c83:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802c87:	8b 12                	mov    (%rdx),%edx
  802c89:	8d 4a 08             	lea    0x8(%rdx),%ecx
  802c8c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802c90:	89 0a                	mov    %ecx,(%rdx)
  802c92:	eb 17                	jmp    802cab <getuint+0x5b>
  802c94:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c98:	48 8b 50 08          	mov    0x8(%rax),%rdx
  802c9c:	48 89 d0             	mov    %rdx,%rax
  802c9f:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  802ca3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802ca7:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  802cab:	48 8b 00             	mov    (%rax),%rax
  802cae:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802cb2:	e9 a3 00 00 00       	jmpq   802d5a <getuint+0x10a>
  802cb7:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  802cbb:	74 4f                	je     802d0c <getuint+0xbc>
  802cbd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802cc1:	8b 00                	mov    (%rax),%eax
  802cc3:	83 f8 30             	cmp    $0x30,%eax
  802cc6:	73 24                	jae    802cec <getuint+0x9c>
  802cc8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ccc:	48 8b 50 10          	mov    0x10(%rax),%rdx
  802cd0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802cd4:	8b 00                	mov    (%rax),%eax
  802cd6:	89 c0                	mov    %eax,%eax
  802cd8:	48 01 d0             	add    %rdx,%rax
  802cdb:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802cdf:	8b 12                	mov    (%rdx),%edx
  802ce1:	8d 4a 08             	lea    0x8(%rdx),%ecx
  802ce4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802ce8:	89 0a                	mov    %ecx,(%rdx)
  802cea:	eb 17                	jmp    802d03 <getuint+0xb3>
  802cec:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802cf0:	48 8b 50 08          	mov    0x8(%rax),%rdx
  802cf4:	48 89 d0             	mov    %rdx,%rax
  802cf7:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  802cfb:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802cff:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  802d03:	48 8b 00             	mov    (%rax),%rax
  802d06:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802d0a:	eb 4e                	jmp    802d5a <getuint+0x10a>
  802d0c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d10:	8b 00                	mov    (%rax),%eax
  802d12:	83 f8 30             	cmp    $0x30,%eax
  802d15:	73 24                	jae    802d3b <getuint+0xeb>
  802d17:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d1b:	48 8b 50 10          	mov    0x10(%rax),%rdx
  802d1f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d23:	8b 00                	mov    (%rax),%eax
  802d25:	89 c0                	mov    %eax,%eax
  802d27:	48 01 d0             	add    %rdx,%rax
  802d2a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802d2e:	8b 12                	mov    (%rdx),%edx
  802d30:	8d 4a 08             	lea    0x8(%rdx),%ecx
  802d33:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802d37:	89 0a                	mov    %ecx,(%rdx)
  802d39:	eb 17                	jmp    802d52 <getuint+0x102>
  802d3b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d3f:	48 8b 50 08          	mov    0x8(%rax),%rdx
  802d43:	48 89 d0             	mov    %rdx,%rax
  802d46:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  802d4a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802d4e:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  802d52:	8b 00                	mov    (%rax),%eax
  802d54:	89 c0                	mov    %eax,%eax
  802d56:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802d5a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802d5e:	c9                   	leaveq 
  802d5f:	c3                   	retq   

0000000000802d60 <getint>:
  802d60:	55                   	push   %rbp
  802d61:	48 89 e5             	mov    %rsp,%rbp
  802d64:	48 83 ec 1c          	sub    $0x1c,%rsp
  802d68:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802d6c:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  802d6f:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  802d73:	7e 52                	jle    802dc7 <getint+0x67>
  802d75:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d79:	8b 00                	mov    (%rax),%eax
  802d7b:	83 f8 30             	cmp    $0x30,%eax
  802d7e:	73 24                	jae    802da4 <getint+0x44>
  802d80:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d84:	48 8b 50 10          	mov    0x10(%rax),%rdx
  802d88:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d8c:	8b 00                	mov    (%rax),%eax
  802d8e:	89 c0                	mov    %eax,%eax
  802d90:	48 01 d0             	add    %rdx,%rax
  802d93:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802d97:	8b 12                	mov    (%rdx),%edx
  802d99:	8d 4a 08             	lea    0x8(%rdx),%ecx
  802d9c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802da0:	89 0a                	mov    %ecx,(%rdx)
  802da2:	eb 17                	jmp    802dbb <getint+0x5b>
  802da4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802da8:	48 8b 50 08          	mov    0x8(%rax),%rdx
  802dac:	48 89 d0             	mov    %rdx,%rax
  802daf:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  802db3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802db7:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  802dbb:	48 8b 00             	mov    (%rax),%rax
  802dbe:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802dc2:	e9 a3 00 00 00       	jmpq   802e6a <getint+0x10a>
  802dc7:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  802dcb:	74 4f                	je     802e1c <getint+0xbc>
  802dcd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802dd1:	8b 00                	mov    (%rax),%eax
  802dd3:	83 f8 30             	cmp    $0x30,%eax
  802dd6:	73 24                	jae    802dfc <getint+0x9c>
  802dd8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ddc:	48 8b 50 10          	mov    0x10(%rax),%rdx
  802de0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802de4:	8b 00                	mov    (%rax),%eax
  802de6:	89 c0                	mov    %eax,%eax
  802de8:	48 01 d0             	add    %rdx,%rax
  802deb:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802def:	8b 12                	mov    (%rdx),%edx
  802df1:	8d 4a 08             	lea    0x8(%rdx),%ecx
  802df4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802df8:	89 0a                	mov    %ecx,(%rdx)
  802dfa:	eb 17                	jmp    802e13 <getint+0xb3>
  802dfc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e00:	48 8b 50 08          	mov    0x8(%rax),%rdx
  802e04:	48 89 d0             	mov    %rdx,%rax
  802e07:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  802e0b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802e0f:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  802e13:	48 8b 00             	mov    (%rax),%rax
  802e16:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802e1a:	eb 4e                	jmp    802e6a <getint+0x10a>
  802e1c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e20:	8b 00                	mov    (%rax),%eax
  802e22:	83 f8 30             	cmp    $0x30,%eax
  802e25:	73 24                	jae    802e4b <getint+0xeb>
  802e27:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e2b:	48 8b 50 10          	mov    0x10(%rax),%rdx
  802e2f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e33:	8b 00                	mov    (%rax),%eax
  802e35:	89 c0                	mov    %eax,%eax
  802e37:	48 01 d0             	add    %rdx,%rax
  802e3a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802e3e:	8b 12                	mov    (%rdx),%edx
  802e40:	8d 4a 08             	lea    0x8(%rdx),%ecx
  802e43:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802e47:	89 0a                	mov    %ecx,(%rdx)
  802e49:	eb 17                	jmp    802e62 <getint+0x102>
  802e4b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e4f:	48 8b 50 08          	mov    0x8(%rax),%rdx
  802e53:	48 89 d0             	mov    %rdx,%rax
  802e56:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  802e5a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802e5e:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  802e62:	8b 00                	mov    (%rax),%eax
  802e64:	48 98                	cltq   
  802e66:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802e6a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802e6e:	c9                   	leaveq 
  802e6f:	c3                   	retq   

0000000000802e70 <vprintfmt>:
  802e70:	55                   	push   %rbp
  802e71:	48 89 e5             	mov    %rsp,%rbp
  802e74:	41 54                	push   %r12
  802e76:	53                   	push   %rbx
  802e77:	48 83 ec 60          	sub    $0x60,%rsp
  802e7b:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  802e7f:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  802e83:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  802e87:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  802e8b:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  802e8f:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  802e93:	48 8b 0a             	mov    (%rdx),%rcx
  802e96:	48 89 08             	mov    %rcx,(%rax)
  802e99:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  802e9d:	48 89 48 08          	mov    %rcx,0x8(%rax)
  802ea1:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  802ea5:	48 89 50 10          	mov    %rdx,0x10(%rax)
  802ea9:	eb 17                	jmp    802ec2 <vprintfmt+0x52>
  802eab:	85 db                	test   %ebx,%ebx
  802ead:	0f 84 cc 04 00 00    	je     80337f <vprintfmt+0x50f>
  802eb3:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  802eb7:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  802ebb:	48 89 d6             	mov    %rdx,%rsi
  802ebe:	89 df                	mov    %ebx,%edi
  802ec0:	ff d0                	callq  *%rax
  802ec2:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  802ec6:	48 8d 50 01          	lea    0x1(%rax),%rdx
  802eca:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  802ece:	0f b6 00             	movzbl (%rax),%eax
  802ed1:	0f b6 d8             	movzbl %al,%ebx
  802ed4:	83 fb 25             	cmp    $0x25,%ebx
  802ed7:	75 d2                	jne    802eab <vprintfmt+0x3b>
  802ed9:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  802edd:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  802ee4:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  802eeb:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  802ef2:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  802ef9:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  802efd:	48 8d 50 01          	lea    0x1(%rax),%rdx
  802f01:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  802f05:	0f b6 00             	movzbl (%rax),%eax
  802f08:	0f b6 d8             	movzbl %al,%ebx
  802f0b:	8d 43 dd             	lea    -0x23(%rbx),%eax
  802f0e:	83 f8 55             	cmp    $0x55,%eax
  802f11:	0f 87 34 04 00 00    	ja     80334b <vprintfmt+0x4db>
  802f17:	89 c0                	mov    %eax,%eax
  802f19:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  802f20:	00 
  802f21:	48 b8 38 44 80 00 00 	movabs $0x804438,%rax
  802f28:	00 00 00 
  802f2b:	48 01 d0             	add    %rdx,%rax
  802f2e:	48 8b 00             	mov    (%rax),%rax
  802f31:	ff e0                	jmpq   *%rax
  802f33:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  802f37:	eb c0                	jmp    802ef9 <vprintfmt+0x89>
  802f39:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  802f3d:	eb ba                	jmp    802ef9 <vprintfmt+0x89>
  802f3f:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  802f46:	8b 55 d8             	mov    -0x28(%rbp),%edx
  802f49:	89 d0                	mov    %edx,%eax
  802f4b:	c1 e0 02             	shl    $0x2,%eax
  802f4e:	01 d0                	add    %edx,%eax
  802f50:	01 c0                	add    %eax,%eax
  802f52:	01 d8                	add    %ebx,%eax
  802f54:	83 e8 30             	sub    $0x30,%eax
  802f57:	89 45 d8             	mov    %eax,-0x28(%rbp)
  802f5a:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  802f5e:	0f b6 00             	movzbl (%rax),%eax
  802f61:	0f be d8             	movsbl %al,%ebx
  802f64:	83 fb 2f             	cmp    $0x2f,%ebx
  802f67:	7e 0c                	jle    802f75 <vprintfmt+0x105>
  802f69:	83 fb 39             	cmp    $0x39,%ebx
  802f6c:	7f 07                	jg     802f75 <vprintfmt+0x105>
  802f6e:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  802f73:	eb d1                	jmp    802f46 <vprintfmt+0xd6>
  802f75:	eb 58                	jmp    802fcf <vprintfmt+0x15f>
  802f77:	8b 45 b8             	mov    -0x48(%rbp),%eax
  802f7a:	83 f8 30             	cmp    $0x30,%eax
  802f7d:	73 17                	jae    802f96 <vprintfmt+0x126>
  802f7f:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802f83:	8b 45 b8             	mov    -0x48(%rbp),%eax
  802f86:	89 c0                	mov    %eax,%eax
  802f88:	48 01 d0             	add    %rdx,%rax
  802f8b:	8b 55 b8             	mov    -0x48(%rbp),%edx
  802f8e:	83 c2 08             	add    $0x8,%edx
  802f91:	89 55 b8             	mov    %edx,-0x48(%rbp)
  802f94:	eb 0f                	jmp    802fa5 <vprintfmt+0x135>
  802f96:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  802f9a:	48 89 d0             	mov    %rdx,%rax
  802f9d:	48 83 c2 08          	add    $0x8,%rdx
  802fa1:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  802fa5:	8b 00                	mov    (%rax),%eax
  802fa7:	89 45 d8             	mov    %eax,-0x28(%rbp)
  802faa:	eb 23                	jmp    802fcf <vprintfmt+0x15f>
  802fac:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  802fb0:	79 0c                	jns    802fbe <vprintfmt+0x14e>
  802fb2:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  802fb9:	e9 3b ff ff ff       	jmpq   802ef9 <vprintfmt+0x89>
  802fbe:	e9 36 ff ff ff       	jmpq   802ef9 <vprintfmt+0x89>
  802fc3:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  802fca:	e9 2a ff ff ff       	jmpq   802ef9 <vprintfmt+0x89>
  802fcf:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  802fd3:	79 12                	jns    802fe7 <vprintfmt+0x177>
  802fd5:	8b 45 d8             	mov    -0x28(%rbp),%eax
  802fd8:	89 45 dc             	mov    %eax,-0x24(%rbp)
  802fdb:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  802fe2:	e9 12 ff ff ff       	jmpq   802ef9 <vprintfmt+0x89>
  802fe7:	e9 0d ff ff ff       	jmpq   802ef9 <vprintfmt+0x89>
  802fec:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  802ff0:	e9 04 ff ff ff       	jmpq   802ef9 <vprintfmt+0x89>
  802ff5:	8b 45 b8             	mov    -0x48(%rbp),%eax
  802ff8:	83 f8 30             	cmp    $0x30,%eax
  802ffb:	73 17                	jae    803014 <vprintfmt+0x1a4>
  802ffd:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803001:	8b 45 b8             	mov    -0x48(%rbp),%eax
  803004:	89 c0                	mov    %eax,%eax
  803006:	48 01 d0             	add    %rdx,%rax
  803009:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80300c:	83 c2 08             	add    $0x8,%edx
  80300f:	89 55 b8             	mov    %edx,-0x48(%rbp)
  803012:	eb 0f                	jmp    803023 <vprintfmt+0x1b3>
  803014:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  803018:	48 89 d0             	mov    %rdx,%rax
  80301b:	48 83 c2 08          	add    $0x8,%rdx
  80301f:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  803023:	8b 10                	mov    (%rax),%edx
  803025:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  803029:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80302d:	48 89 ce             	mov    %rcx,%rsi
  803030:	89 d7                	mov    %edx,%edi
  803032:	ff d0                	callq  *%rax
  803034:	e9 40 03 00 00       	jmpq   803379 <vprintfmt+0x509>
  803039:	8b 45 b8             	mov    -0x48(%rbp),%eax
  80303c:	83 f8 30             	cmp    $0x30,%eax
  80303f:	73 17                	jae    803058 <vprintfmt+0x1e8>
  803041:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803045:	8b 45 b8             	mov    -0x48(%rbp),%eax
  803048:	89 c0                	mov    %eax,%eax
  80304a:	48 01 d0             	add    %rdx,%rax
  80304d:	8b 55 b8             	mov    -0x48(%rbp),%edx
  803050:	83 c2 08             	add    $0x8,%edx
  803053:	89 55 b8             	mov    %edx,-0x48(%rbp)
  803056:	eb 0f                	jmp    803067 <vprintfmt+0x1f7>
  803058:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  80305c:	48 89 d0             	mov    %rdx,%rax
  80305f:	48 83 c2 08          	add    $0x8,%rdx
  803063:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  803067:	8b 18                	mov    (%rax),%ebx
  803069:	85 db                	test   %ebx,%ebx
  80306b:	79 02                	jns    80306f <vprintfmt+0x1ff>
  80306d:	f7 db                	neg    %ebx
  80306f:	83 fb 15             	cmp    $0x15,%ebx
  803072:	7f 16                	jg     80308a <vprintfmt+0x21a>
  803074:	48 b8 60 43 80 00 00 	movabs $0x804360,%rax
  80307b:	00 00 00 
  80307e:	48 63 d3             	movslq %ebx,%rdx
  803081:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  803085:	4d 85 e4             	test   %r12,%r12
  803088:	75 2e                	jne    8030b8 <vprintfmt+0x248>
  80308a:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  80308e:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803092:	89 d9                	mov    %ebx,%ecx
  803094:	48 ba 21 44 80 00 00 	movabs $0x804421,%rdx
  80309b:	00 00 00 
  80309e:	48 89 c7             	mov    %rax,%rdi
  8030a1:	b8 00 00 00 00       	mov    $0x0,%eax
  8030a6:	49 b8 88 33 80 00 00 	movabs $0x803388,%r8
  8030ad:	00 00 00 
  8030b0:	41 ff d0             	callq  *%r8
  8030b3:	e9 c1 02 00 00       	jmpq   803379 <vprintfmt+0x509>
  8030b8:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  8030bc:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8030c0:	4c 89 e1             	mov    %r12,%rcx
  8030c3:	48 ba 2a 44 80 00 00 	movabs $0x80442a,%rdx
  8030ca:	00 00 00 
  8030cd:	48 89 c7             	mov    %rax,%rdi
  8030d0:	b8 00 00 00 00       	mov    $0x0,%eax
  8030d5:	49 b8 88 33 80 00 00 	movabs $0x803388,%r8
  8030dc:	00 00 00 
  8030df:	41 ff d0             	callq  *%r8
  8030e2:	e9 92 02 00 00       	jmpq   803379 <vprintfmt+0x509>
  8030e7:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8030ea:	83 f8 30             	cmp    $0x30,%eax
  8030ed:	73 17                	jae    803106 <vprintfmt+0x296>
  8030ef:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8030f3:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8030f6:	89 c0                	mov    %eax,%eax
  8030f8:	48 01 d0             	add    %rdx,%rax
  8030fb:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8030fe:	83 c2 08             	add    $0x8,%edx
  803101:	89 55 b8             	mov    %edx,-0x48(%rbp)
  803104:	eb 0f                	jmp    803115 <vprintfmt+0x2a5>
  803106:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  80310a:	48 89 d0             	mov    %rdx,%rax
  80310d:	48 83 c2 08          	add    $0x8,%rdx
  803111:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  803115:	4c 8b 20             	mov    (%rax),%r12
  803118:	4d 85 e4             	test   %r12,%r12
  80311b:	75 0a                	jne    803127 <vprintfmt+0x2b7>
  80311d:	49 bc 2d 44 80 00 00 	movabs $0x80442d,%r12
  803124:	00 00 00 
  803127:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  80312b:	7e 3f                	jle    80316c <vprintfmt+0x2fc>
  80312d:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  803131:	74 39                	je     80316c <vprintfmt+0x2fc>
  803133:	8b 45 d8             	mov    -0x28(%rbp),%eax
  803136:	48 98                	cltq   
  803138:	48 89 c6             	mov    %rax,%rsi
  80313b:	4c 89 e7             	mov    %r12,%rdi
  80313e:	48 b8 34 36 80 00 00 	movabs $0x803634,%rax
  803145:	00 00 00 
  803148:	ff d0                	callq  *%rax
  80314a:	29 45 dc             	sub    %eax,-0x24(%rbp)
  80314d:	eb 17                	jmp    803166 <vprintfmt+0x2f6>
  80314f:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  803153:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  803157:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80315b:	48 89 ce             	mov    %rcx,%rsi
  80315e:	89 d7                	mov    %edx,%edi
  803160:	ff d0                	callq  *%rax
  803162:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  803166:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  80316a:	7f e3                	jg     80314f <vprintfmt+0x2df>
  80316c:	eb 37                	jmp    8031a5 <vprintfmt+0x335>
  80316e:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  803172:	74 1e                	je     803192 <vprintfmt+0x322>
  803174:	83 fb 1f             	cmp    $0x1f,%ebx
  803177:	7e 05                	jle    80317e <vprintfmt+0x30e>
  803179:	83 fb 7e             	cmp    $0x7e,%ebx
  80317c:	7e 14                	jle    803192 <vprintfmt+0x322>
  80317e:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  803182:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803186:	48 89 d6             	mov    %rdx,%rsi
  803189:	bf 3f 00 00 00       	mov    $0x3f,%edi
  80318e:	ff d0                	callq  *%rax
  803190:	eb 0f                	jmp    8031a1 <vprintfmt+0x331>
  803192:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  803196:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80319a:	48 89 d6             	mov    %rdx,%rsi
  80319d:	89 df                	mov    %ebx,%edi
  80319f:	ff d0                	callq  *%rax
  8031a1:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  8031a5:	4c 89 e0             	mov    %r12,%rax
  8031a8:	4c 8d 60 01          	lea    0x1(%rax),%r12
  8031ac:	0f b6 00             	movzbl (%rax),%eax
  8031af:	0f be d8             	movsbl %al,%ebx
  8031b2:	85 db                	test   %ebx,%ebx
  8031b4:	74 10                	je     8031c6 <vprintfmt+0x356>
  8031b6:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  8031ba:	78 b2                	js     80316e <vprintfmt+0x2fe>
  8031bc:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  8031c0:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  8031c4:	79 a8                	jns    80316e <vprintfmt+0x2fe>
  8031c6:	eb 16                	jmp    8031de <vprintfmt+0x36e>
  8031c8:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8031cc:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8031d0:	48 89 d6             	mov    %rdx,%rsi
  8031d3:	bf 20 00 00 00       	mov    $0x20,%edi
  8031d8:	ff d0                	callq  *%rax
  8031da:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  8031de:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8031e2:	7f e4                	jg     8031c8 <vprintfmt+0x358>
  8031e4:	e9 90 01 00 00       	jmpq   803379 <vprintfmt+0x509>
  8031e9:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8031ed:	be 03 00 00 00       	mov    $0x3,%esi
  8031f2:	48 89 c7             	mov    %rax,%rdi
  8031f5:	48 b8 60 2d 80 00 00 	movabs $0x802d60,%rax
  8031fc:	00 00 00 
  8031ff:	ff d0                	callq  *%rax
  803201:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803205:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803209:	48 85 c0             	test   %rax,%rax
  80320c:	79 1d                	jns    80322b <vprintfmt+0x3bb>
  80320e:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  803212:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803216:	48 89 d6             	mov    %rdx,%rsi
  803219:	bf 2d 00 00 00       	mov    $0x2d,%edi
  80321e:	ff d0                	callq  *%rax
  803220:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803224:	48 f7 d8             	neg    %rax
  803227:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80322b:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  803232:	e9 d5 00 00 00       	jmpq   80330c <vprintfmt+0x49c>
  803237:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  80323b:	be 03 00 00 00       	mov    $0x3,%esi
  803240:	48 89 c7             	mov    %rax,%rdi
  803243:	48 b8 50 2c 80 00 00 	movabs $0x802c50,%rax
  80324a:	00 00 00 
  80324d:	ff d0                	callq  *%rax
  80324f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803253:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  80325a:	e9 ad 00 00 00       	jmpq   80330c <vprintfmt+0x49c>
  80325f:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  803263:	be 03 00 00 00       	mov    $0x3,%esi
  803268:	48 89 c7             	mov    %rax,%rdi
  80326b:	48 b8 50 2c 80 00 00 	movabs $0x802c50,%rax
  803272:	00 00 00 
  803275:	ff d0                	callq  *%rax
  803277:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80327b:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  803282:	e9 85 00 00 00       	jmpq   80330c <vprintfmt+0x49c>
  803287:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  80328b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80328f:	48 89 d6             	mov    %rdx,%rsi
  803292:	bf 30 00 00 00       	mov    $0x30,%edi
  803297:	ff d0                	callq  *%rax
  803299:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  80329d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8032a1:	48 89 d6             	mov    %rdx,%rsi
  8032a4:	bf 78 00 00 00       	mov    $0x78,%edi
  8032a9:	ff d0                	callq  *%rax
  8032ab:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8032ae:	83 f8 30             	cmp    $0x30,%eax
  8032b1:	73 17                	jae    8032ca <vprintfmt+0x45a>
  8032b3:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8032b7:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8032ba:	89 c0                	mov    %eax,%eax
  8032bc:	48 01 d0             	add    %rdx,%rax
  8032bf:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8032c2:	83 c2 08             	add    $0x8,%edx
  8032c5:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8032c8:	eb 0f                	jmp    8032d9 <vprintfmt+0x469>
  8032ca:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  8032ce:	48 89 d0             	mov    %rdx,%rax
  8032d1:	48 83 c2 08          	add    $0x8,%rdx
  8032d5:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8032d9:	48 8b 00             	mov    (%rax),%rax
  8032dc:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8032e0:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  8032e7:	eb 23                	jmp    80330c <vprintfmt+0x49c>
  8032e9:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8032ed:	be 03 00 00 00       	mov    $0x3,%esi
  8032f2:	48 89 c7             	mov    %rax,%rdi
  8032f5:	48 b8 50 2c 80 00 00 	movabs $0x802c50,%rax
  8032fc:	00 00 00 
  8032ff:	ff d0                	callq  *%rax
  803301:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803305:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  80330c:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  803311:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  803314:	8b 7d dc             	mov    -0x24(%rbp),%edi
  803317:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80331b:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  80331f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803323:	45 89 c1             	mov    %r8d,%r9d
  803326:	41 89 f8             	mov    %edi,%r8d
  803329:	48 89 c7             	mov    %rax,%rdi
  80332c:	48 b8 95 2b 80 00 00 	movabs $0x802b95,%rax
  803333:	00 00 00 
  803336:	ff d0                	callq  *%rax
  803338:	eb 3f                	jmp    803379 <vprintfmt+0x509>
  80333a:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  80333e:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803342:	48 89 d6             	mov    %rdx,%rsi
  803345:	89 df                	mov    %ebx,%edi
  803347:	ff d0                	callq  *%rax
  803349:	eb 2e                	jmp    803379 <vprintfmt+0x509>
  80334b:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  80334f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803353:	48 89 d6             	mov    %rdx,%rsi
  803356:	bf 25 00 00 00       	mov    $0x25,%edi
  80335b:	ff d0                	callq  *%rax
  80335d:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  803362:	eb 05                	jmp    803369 <vprintfmt+0x4f9>
  803364:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  803369:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  80336d:	48 83 e8 01          	sub    $0x1,%rax
  803371:	0f b6 00             	movzbl (%rax),%eax
  803374:	3c 25                	cmp    $0x25,%al
  803376:	75 ec                	jne    803364 <vprintfmt+0x4f4>
  803378:	90                   	nop
  803379:	90                   	nop
  80337a:	e9 43 fb ff ff       	jmpq   802ec2 <vprintfmt+0x52>
  80337f:	48 83 c4 60          	add    $0x60,%rsp
  803383:	5b                   	pop    %rbx
  803384:	41 5c                	pop    %r12
  803386:	5d                   	pop    %rbp
  803387:	c3                   	retq   

0000000000803388 <printfmt>:
  803388:	55                   	push   %rbp
  803389:	48 89 e5             	mov    %rsp,%rbp
  80338c:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  803393:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  80339a:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  8033a1:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8033a8:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8033af:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8033b6:	84 c0                	test   %al,%al
  8033b8:	74 20                	je     8033da <printfmt+0x52>
  8033ba:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8033be:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8033c2:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8033c6:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8033ca:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8033ce:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8033d2:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8033d6:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8033da:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  8033e1:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  8033e8:	00 00 00 
  8033eb:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  8033f2:	00 00 00 
  8033f5:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8033f9:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  803400:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  803407:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  80340e:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  803415:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  80341c:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  803423:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  80342a:	48 89 c7             	mov    %rax,%rdi
  80342d:	48 b8 70 2e 80 00 00 	movabs $0x802e70,%rax
  803434:	00 00 00 
  803437:	ff d0                	callq  *%rax
  803439:	c9                   	leaveq 
  80343a:	c3                   	retq   

000000000080343b <sprintputch>:
  80343b:	55                   	push   %rbp
  80343c:	48 89 e5             	mov    %rsp,%rbp
  80343f:	48 83 ec 10          	sub    $0x10,%rsp
  803443:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803446:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80344a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80344e:	8b 40 10             	mov    0x10(%rax),%eax
  803451:	8d 50 01             	lea    0x1(%rax),%edx
  803454:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803458:	89 50 10             	mov    %edx,0x10(%rax)
  80345b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80345f:	48 8b 10             	mov    (%rax),%rdx
  803462:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803466:	48 8b 40 08          	mov    0x8(%rax),%rax
  80346a:	48 39 c2             	cmp    %rax,%rdx
  80346d:	73 17                	jae    803486 <sprintputch+0x4b>
  80346f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803473:	48 8b 00             	mov    (%rax),%rax
  803476:	48 8d 48 01          	lea    0x1(%rax),%rcx
  80347a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80347e:	48 89 0a             	mov    %rcx,(%rdx)
  803481:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803484:	88 10                	mov    %dl,(%rax)
  803486:	c9                   	leaveq 
  803487:	c3                   	retq   

0000000000803488 <vsnprintf>:
  803488:	55                   	push   %rbp
  803489:	48 89 e5             	mov    %rsp,%rbp
  80348c:	48 83 ec 50          	sub    $0x50,%rsp
  803490:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  803494:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  803497:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  80349b:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  80349f:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  8034a3:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  8034a7:	48 8b 0a             	mov    (%rdx),%rcx
  8034aa:	48 89 08             	mov    %rcx,(%rax)
  8034ad:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8034b1:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8034b5:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8034b9:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8034bd:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8034c1:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  8034c5:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  8034c8:	48 98                	cltq   
  8034ca:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8034ce:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8034d2:	48 01 d0             	add    %rdx,%rax
  8034d5:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  8034d9:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  8034e0:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  8034e5:	74 06                	je     8034ed <vsnprintf+0x65>
  8034e7:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  8034eb:	7f 07                	jg     8034f4 <vsnprintf+0x6c>
  8034ed:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8034f2:	eb 2f                	jmp    803523 <vsnprintf+0x9b>
  8034f4:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  8034f8:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  8034fc:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  803500:	48 89 c6             	mov    %rax,%rsi
  803503:	48 bf 3b 34 80 00 00 	movabs $0x80343b,%rdi
  80350a:	00 00 00 
  80350d:	48 b8 70 2e 80 00 00 	movabs $0x802e70,%rax
  803514:	00 00 00 
  803517:	ff d0                	callq  *%rax
  803519:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80351d:	c6 00 00             	movb   $0x0,(%rax)
  803520:	8b 45 e0             	mov    -0x20(%rbp),%eax
  803523:	c9                   	leaveq 
  803524:	c3                   	retq   

0000000000803525 <snprintf>:
  803525:	55                   	push   %rbp
  803526:	48 89 e5             	mov    %rsp,%rbp
  803529:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  803530:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  803537:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  80353d:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  803544:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  80354b:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  803552:	84 c0                	test   %al,%al
  803554:	74 20                	je     803576 <snprintf+0x51>
  803556:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  80355a:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80355e:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  803562:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  803566:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  80356a:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  80356e:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  803572:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  803576:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  80357d:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  803584:	00 00 00 
  803587:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  80358e:	00 00 00 
  803591:	48 8d 45 10          	lea    0x10(%rbp),%rax
  803595:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  80359c:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8035a3:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8035aa:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  8035b1:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8035b8:	48 8b 0a             	mov    (%rdx),%rcx
  8035bb:	48 89 08             	mov    %rcx,(%rax)
  8035be:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8035c2:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8035c6:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8035ca:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8035ce:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  8035d5:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  8035dc:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  8035e2:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8035e9:	48 89 c7             	mov    %rax,%rdi
  8035ec:	48 b8 88 34 80 00 00 	movabs $0x803488,%rax
  8035f3:	00 00 00 
  8035f6:	ff d0                	callq  *%rax
  8035f8:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  8035fe:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  803604:	c9                   	leaveq 
  803605:	c3                   	retq   

0000000000803606 <strlen>:
  803606:	55                   	push   %rbp
  803607:	48 89 e5             	mov    %rsp,%rbp
  80360a:	48 83 ec 18          	sub    $0x18,%rsp
  80360e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803612:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803619:	eb 09                	jmp    803624 <strlen+0x1e>
  80361b:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80361f:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  803624:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803628:	0f b6 00             	movzbl (%rax),%eax
  80362b:	84 c0                	test   %al,%al
  80362d:	75 ec                	jne    80361b <strlen+0x15>
  80362f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803632:	c9                   	leaveq 
  803633:	c3                   	retq   

0000000000803634 <strnlen>:
  803634:	55                   	push   %rbp
  803635:	48 89 e5             	mov    %rsp,%rbp
  803638:	48 83 ec 20          	sub    $0x20,%rsp
  80363c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803640:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803644:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80364b:	eb 0e                	jmp    80365b <strnlen+0x27>
  80364d:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  803651:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  803656:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  80365b:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  803660:	74 0b                	je     80366d <strnlen+0x39>
  803662:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803666:	0f b6 00             	movzbl (%rax),%eax
  803669:	84 c0                	test   %al,%al
  80366b:	75 e0                	jne    80364d <strnlen+0x19>
  80366d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803670:	c9                   	leaveq 
  803671:	c3                   	retq   

0000000000803672 <strcpy>:
  803672:	55                   	push   %rbp
  803673:	48 89 e5             	mov    %rsp,%rbp
  803676:	48 83 ec 20          	sub    $0x20,%rsp
  80367a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80367e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803682:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803686:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80368a:	90                   	nop
  80368b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80368f:	48 8d 50 01          	lea    0x1(%rax),%rdx
  803693:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803697:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80369b:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  80369f:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8036a3:	0f b6 12             	movzbl (%rdx),%edx
  8036a6:	88 10                	mov    %dl,(%rax)
  8036a8:	0f b6 00             	movzbl (%rax),%eax
  8036ab:	84 c0                	test   %al,%al
  8036ad:	75 dc                	jne    80368b <strcpy+0x19>
  8036af:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8036b3:	c9                   	leaveq 
  8036b4:	c3                   	retq   

00000000008036b5 <strcat>:
  8036b5:	55                   	push   %rbp
  8036b6:	48 89 e5             	mov    %rsp,%rbp
  8036b9:	48 83 ec 20          	sub    $0x20,%rsp
  8036bd:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8036c1:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8036c5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8036c9:	48 89 c7             	mov    %rax,%rdi
  8036cc:	48 b8 06 36 80 00 00 	movabs $0x803606,%rax
  8036d3:	00 00 00 
  8036d6:	ff d0                	callq  *%rax
  8036d8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8036db:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036de:	48 63 d0             	movslq %eax,%rdx
  8036e1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8036e5:	48 01 c2             	add    %rax,%rdx
  8036e8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8036ec:	48 89 c6             	mov    %rax,%rsi
  8036ef:	48 89 d7             	mov    %rdx,%rdi
  8036f2:	48 b8 72 36 80 00 00 	movabs $0x803672,%rax
  8036f9:	00 00 00 
  8036fc:	ff d0                	callq  *%rax
  8036fe:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803702:	c9                   	leaveq 
  803703:	c3                   	retq   

0000000000803704 <strncpy>:
  803704:	55                   	push   %rbp
  803705:	48 89 e5             	mov    %rsp,%rbp
  803708:	48 83 ec 28          	sub    $0x28,%rsp
  80370c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803710:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803714:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803718:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80371c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803720:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803727:	00 
  803728:	eb 2a                	jmp    803754 <strncpy+0x50>
  80372a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80372e:	48 8d 50 01          	lea    0x1(%rax),%rdx
  803732:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803736:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80373a:	0f b6 12             	movzbl (%rdx),%edx
  80373d:	88 10                	mov    %dl,(%rax)
  80373f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803743:	0f b6 00             	movzbl (%rax),%eax
  803746:	84 c0                	test   %al,%al
  803748:	74 05                	je     80374f <strncpy+0x4b>
  80374a:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  80374f:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803754:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803758:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  80375c:	72 cc                	jb     80372a <strncpy+0x26>
  80375e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803762:	c9                   	leaveq 
  803763:	c3                   	retq   

0000000000803764 <strlcpy>:
  803764:	55                   	push   %rbp
  803765:	48 89 e5             	mov    %rsp,%rbp
  803768:	48 83 ec 28          	sub    $0x28,%rsp
  80376c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803770:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803774:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803778:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80377c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803780:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  803785:	74 3d                	je     8037c4 <strlcpy+0x60>
  803787:	eb 1d                	jmp    8037a6 <strlcpy+0x42>
  803789:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80378d:	48 8d 50 01          	lea    0x1(%rax),%rdx
  803791:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803795:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  803799:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  80379d:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8037a1:	0f b6 12             	movzbl (%rdx),%edx
  8037a4:	88 10                	mov    %dl,(%rax)
  8037a6:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  8037ab:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8037b0:	74 0b                	je     8037bd <strlcpy+0x59>
  8037b2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8037b6:	0f b6 00             	movzbl (%rax),%eax
  8037b9:	84 c0                	test   %al,%al
  8037bb:	75 cc                	jne    803789 <strlcpy+0x25>
  8037bd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8037c1:	c6 00 00             	movb   $0x0,(%rax)
  8037c4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8037c8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8037cc:	48 29 c2             	sub    %rax,%rdx
  8037cf:	48 89 d0             	mov    %rdx,%rax
  8037d2:	c9                   	leaveq 
  8037d3:	c3                   	retq   

00000000008037d4 <strcmp>:
  8037d4:	55                   	push   %rbp
  8037d5:	48 89 e5             	mov    %rsp,%rbp
  8037d8:	48 83 ec 10          	sub    $0x10,%rsp
  8037dc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8037e0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8037e4:	eb 0a                	jmp    8037f0 <strcmp+0x1c>
  8037e6:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8037eb:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8037f0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8037f4:	0f b6 00             	movzbl (%rax),%eax
  8037f7:	84 c0                	test   %al,%al
  8037f9:	74 12                	je     80380d <strcmp+0x39>
  8037fb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8037ff:	0f b6 10             	movzbl (%rax),%edx
  803802:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803806:	0f b6 00             	movzbl (%rax),%eax
  803809:	38 c2                	cmp    %al,%dl
  80380b:	74 d9                	je     8037e6 <strcmp+0x12>
  80380d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803811:	0f b6 00             	movzbl (%rax),%eax
  803814:	0f b6 d0             	movzbl %al,%edx
  803817:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80381b:	0f b6 00             	movzbl (%rax),%eax
  80381e:	0f b6 c0             	movzbl %al,%eax
  803821:	29 c2                	sub    %eax,%edx
  803823:	89 d0                	mov    %edx,%eax
  803825:	c9                   	leaveq 
  803826:	c3                   	retq   

0000000000803827 <strncmp>:
  803827:	55                   	push   %rbp
  803828:	48 89 e5             	mov    %rsp,%rbp
  80382b:	48 83 ec 18          	sub    $0x18,%rsp
  80382f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803833:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803837:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80383b:	eb 0f                	jmp    80384c <strncmp+0x25>
  80383d:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  803842:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803847:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  80384c:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  803851:	74 1d                	je     803870 <strncmp+0x49>
  803853:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803857:	0f b6 00             	movzbl (%rax),%eax
  80385a:	84 c0                	test   %al,%al
  80385c:	74 12                	je     803870 <strncmp+0x49>
  80385e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803862:	0f b6 10             	movzbl (%rax),%edx
  803865:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803869:	0f b6 00             	movzbl (%rax),%eax
  80386c:	38 c2                	cmp    %al,%dl
  80386e:	74 cd                	je     80383d <strncmp+0x16>
  803870:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  803875:	75 07                	jne    80387e <strncmp+0x57>
  803877:	b8 00 00 00 00       	mov    $0x0,%eax
  80387c:	eb 18                	jmp    803896 <strncmp+0x6f>
  80387e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803882:	0f b6 00             	movzbl (%rax),%eax
  803885:	0f b6 d0             	movzbl %al,%edx
  803888:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80388c:	0f b6 00             	movzbl (%rax),%eax
  80388f:	0f b6 c0             	movzbl %al,%eax
  803892:	29 c2                	sub    %eax,%edx
  803894:	89 d0                	mov    %edx,%eax
  803896:	c9                   	leaveq 
  803897:	c3                   	retq   

0000000000803898 <strchr>:
  803898:	55                   	push   %rbp
  803899:	48 89 e5             	mov    %rsp,%rbp
  80389c:	48 83 ec 0c          	sub    $0xc,%rsp
  8038a0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8038a4:	89 f0                	mov    %esi,%eax
  8038a6:	88 45 f4             	mov    %al,-0xc(%rbp)
  8038a9:	eb 17                	jmp    8038c2 <strchr+0x2a>
  8038ab:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8038af:	0f b6 00             	movzbl (%rax),%eax
  8038b2:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8038b5:	75 06                	jne    8038bd <strchr+0x25>
  8038b7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8038bb:	eb 15                	jmp    8038d2 <strchr+0x3a>
  8038bd:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8038c2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8038c6:	0f b6 00             	movzbl (%rax),%eax
  8038c9:	84 c0                	test   %al,%al
  8038cb:	75 de                	jne    8038ab <strchr+0x13>
  8038cd:	b8 00 00 00 00       	mov    $0x0,%eax
  8038d2:	c9                   	leaveq 
  8038d3:	c3                   	retq   

00000000008038d4 <strfind>:
  8038d4:	55                   	push   %rbp
  8038d5:	48 89 e5             	mov    %rsp,%rbp
  8038d8:	48 83 ec 0c          	sub    $0xc,%rsp
  8038dc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8038e0:	89 f0                	mov    %esi,%eax
  8038e2:	88 45 f4             	mov    %al,-0xc(%rbp)
  8038e5:	eb 13                	jmp    8038fa <strfind+0x26>
  8038e7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8038eb:	0f b6 00             	movzbl (%rax),%eax
  8038ee:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8038f1:	75 02                	jne    8038f5 <strfind+0x21>
  8038f3:	eb 10                	jmp    803905 <strfind+0x31>
  8038f5:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8038fa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8038fe:	0f b6 00             	movzbl (%rax),%eax
  803901:	84 c0                	test   %al,%al
  803903:	75 e2                	jne    8038e7 <strfind+0x13>
  803905:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803909:	c9                   	leaveq 
  80390a:	c3                   	retq   

000000000080390b <memset>:
  80390b:	55                   	push   %rbp
  80390c:	48 89 e5             	mov    %rsp,%rbp
  80390f:	48 83 ec 18          	sub    $0x18,%rsp
  803913:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803917:	89 75 f4             	mov    %esi,-0xc(%rbp)
  80391a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80391e:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  803923:	75 06                	jne    80392b <memset+0x20>
  803925:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803929:	eb 69                	jmp    803994 <memset+0x89>
  80392b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80392f:	83 e0 03             	and    $0x3,%eax
  803932:	48 85 c0             	test   %rax,%rax
  803935:	75 48                	jne    80397f <memset+0x74>
  803937:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80393b:	83 e0 03             	and    $0x3,%eax
  80393e:	48 85 c0             	test   %rax,%rax
  803941:	75 3c                	jne    80397f <memset+0x74>
  803943:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  80394a:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80394d:	c1 e0 18             	shl    $0x18,%eax
  803950:	89 c2                	mov    %eax,%edx
  803952:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803955:	c1 e0 10             	shl    $0x10,%eax
  803958:	09 c2                	or     %eax,%edx
  80395a:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80395d:	c1 e0 08             	shl    $0x8,%eax
  803960:	09 d0                	or     %edx,%eax
  803962:	09 45 f4             	or     %eax,-0xc(%rbp)
  803965:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803969:	48 c1 e8 02          	shr    $0x2,%rax
  80396d:	48 89 c1             	mov    %rax,%rcx
  803970:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  803974:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803977:	48 89 d7             	mov    %rdx,%rdi
  80397a:	fc                   	cld    
  80397b:	f3 ab                	rep stos %eax,%es:(%rdi)
  80397d:	eb 11                	jmp    803990 <memset+0x85>
  80397f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  803983:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803986:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80398a:	48 89 d7             	mov    %rdx,%rdi
  80398d:	fc                   	cld    
  80398e:	f3 aa                	rep stos %al,%es:(%rdi)
  803990:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803994:	c9                   	leaveq 
  803995:	c3                   	retq   

0000000000803996 <memmove>:
  803996:	55                   	push   %rbp
  803997:	48 89 e5             	mov    %rsp,%rbp
  80399a:	48 83 ec 28          	sub    $0x28,%rsp
  80399e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8039a2:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8039a6:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8039aa:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8039ae:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8039b2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8039b6:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8039ba:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8039be:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8039c2:	0f 83 88 00 00 00    	jae    803a50 <memmove+0xba>
  8039c8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8039cc:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8039d0:	48 01 d0             	add    %rdx,%rax
  8039d3:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8039d7:	76 77                	jbe    803a50 <memmove+0xba>
  8039d9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8039dd:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  8039e1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8039e5:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  8039e9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8039ed:	83 e0 03             	and    $0x3,%eax
  8039f0:	48 85 c0             	test   %rax,%rax
  8039f3:	75 3b                	jne    803a30 <memmove+0x9a>
  8039f5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8039f9:	83 e0 03             	and    $0x3,%eax
  8039fc:	48 85 c0             	test   %rax,%rax
  8039ff:	75 2f                	jne    803a30 <memmove+0x9a>
  803a01:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803a05:	83 e0 03             	and    $0x3,%eax
  803a08:	48 85 c0             	test   %rax,%rax
  803a0b:	75 23                	jne    803a30 <memmove+0x9a>
  803a0d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a11:	48 83 e8 04          	sub    $0x4,%rax
  803a15:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  803a19:	48 83 ea 04          	sub    $0x4,%rdx
  803a1d:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  803a21:	48 c1 e9 02          	shr    $0x2,%rcx
  803a25:	48 89 c7             	mov    %rax,%rdi
  803a28:	48 89 d6             	mov    %rdx,%rsi
  803a2b:	fd                   	std    
  803a2c:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  803a2e:	eb 1d                	jmp    803a4d <memmove+0xb7>
  803a30:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a34:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  803a38:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803a3c:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  803a40:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803a44:	48 89 d7             	mov    %rdx,%rdi
  803a47:	48 89 c1             	mov    %rax,%rcx
  803a4a:	fd                   	std    
  803a4b:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  803a4d:	fc                   	cld    
  803a4e:	eb 57                	jmp    803aa7 <memmove+0x111>
  803a50:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803a54:	83 e0 03             	and    $0x3,%eax
  803a57:	48 85 c0             	test   %rax,%rax
  803a5a:	75 36                	jne    803a92 <memmove+0xfc>
  803a5c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a60:	83 e0 03             	and    $0x3,%eax
  803a63:	48 85 c0             	test   %rax,%rax
  803a66:	75 2a                	jne    803a92 <memmove+0xfc>
  803a68:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803a6c:	83 e0 03             	and    $0x3,%eax
  803a6f:	48 85 c0             	test   %rax,%rax
  803a72:	75 1e                	jne    803a92 <memmove+0xfc>
  803a74:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803a78:	48 c1 e8 02          	shr    $0x2,%rax
  803a7c:	48 89 c1             	mov    %rax,%rcx
  803a7f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a83:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  803a87:	48 89 c7             	mov    %rax,%rdi
  803a8a:	48 89 d6             	mov    %rdx,%rsi
  803a8d:	fc                   	cld    
  803a8e:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  803a90:	eb 15                	jmp    803aa7 <memmove+0x111>
  803a92:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a96:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  803a9a:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  803a9e:	48 89 c7             	mov    %rax,%rdi
  803aa1:	48 89 d6             	mov    %rdx,%rsi
  803aa4:	fc                   	cld    
  803aa5:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  803aa7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803aab:	c9                   	leaveq 
  803aac:	c3                   	retq   

0000000000803aad <memcpy>:
  803aad:	55                   	push   %rbp
  803aae:	48 89 e5             	mov    %rsp,%rbp
  803ab1:	48 83 ec 18          	sub    $0x18,%rsp
  803ab5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803ab9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803abd:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803ac1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803ac5:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  803ac9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803acd:	48 89 ce             	mov    %rcx,%rsi
  803ad0:	48 89 c7             	mov    %rax,%rdi
  803ad3:	48 b8 96 39 80 00 00 	movabs $0x803996,%rax
  803ada:	00 00 00 
  803add:	ff d0                	callq  *%rax
  803adf:	c9                   	leaveq 
  803ae0:	c3                   	retq   

0000000000803ae1 <memcmp>:
  803ae1:	55                   	push   %rbp
  803ae2:	48 89 e5             	mov    %rsp,%rbp
  803ae5:	48 83 ec 28          	sub    $0x28,%rsp
  803ae9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803aed:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803af1:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803af5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803af9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803afd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803b01:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803b05:	eb 36                	jmp    803b3d <memcmp+0x5c>
  803b07:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803b0b:	0f b6 10             	movzbl (%rax),%edx
  803b0e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b12:	0f b6 00             	movzbl (%rax),%eax
  803b15:	38 c2                	cmp    %al,%dl
  803b17:	74 1a                	je     803b33 <memcmp+0x52>
  803b19:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803b1d:	0f b6 00             	movzbl (%rax),%eax
  803b20:	0f b6 d0             	movzbl %al,%edx
  803b23:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b27:	0f b6 00             	movzbl (%rax),%eax
  803b2a:	0f b6 c0             	movzbl %al,%eax
  803b2d:	29 c2                	sub    %eax,%edx
  803b2f:	89 d0                	mov    %edx,%eax
  803b31:	eb 20                	jmp    803b53 <memcmp+0x72>
  803b33:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803b38:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  803b3d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803b41:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  803b45:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803b49:	48 85 c0             	test   %rax,%rax
  803b4c:	75 b9                	jne    803b07 <memcmp+0x26>
  803b4e:	b8 00 00 00 00       	mov    $0x0,%eax
  803b53:	c9                   	leaveq 
  803b54:	c3                   	retq   

0000000000803b55 <memfind>:
  803b55:	55                   	push   %rbp
  803b56:	48 89 e5             	mov    %rsp,%rbp
  803b59:	48 83 ec 28          	sub    $0x28,%rsp
  803b5d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803b61:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  803b64:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803b68:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803b6c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803b70:	48 01 d0             	add    %rdx,%rax
  803b73:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803b77:	eb 15                	jmp    803b8e <memfind+0x39>
  803b79:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803b7d:	0f b6 10             	movzbl (%rax),%edx
  803b80:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  803b83:	38 c2                	cmp    %al,%dl
  803b85:	75 02                	jne    803b89 <memfind+0x34>
  803b87:	eb 0f                	jmp    803b98 <memfind+0x43>
  803b89:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  803b8e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803b92:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  803b96:	72 e1                	jb     803b79 <memfind+0x24>
  803b98:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803b9c:	c9                   	leaveq 
  803b9d:	c3                   	retq   

0000000000803b9e <strtol>:
  803b9e:	55                   	push   %rbp
  803b9f:	48 89 e5             	mov    %rsp,%rbp
  803ba2:	48 83 ec 34          	sub    $0x34,%rsp
  803ba6:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803baa:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803bae:	89 55 cc             	mov    %edx,-0x34(%rbp)
  803bb1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803bb8:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  803bbf:	00 
  803bc0:	eb 05                	jmp    803bc7 <strtol+0x29>
  803bc2:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  803bc7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803bcb:	0f b6 00             	movzbl (%rax),%eax
  803bce:	3c 20                	cmp    $0x20,%al
  803bd0:	74 f0                	je     803bc2 <strtol+0x24>
  803bd2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803bd6:	0f b6 00             	movzbl (%rax),%eax
  803bd9:	3c 09                	cmp    $0x9,%al
  803bdb:	74 e5                	je     803bc2 <strtol+0x24>
  803bdd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803be1:	0f b6 00             	movzbl (%rax),%eax
  803be4:	3c 2b                	cmp    $0x2b,%al
  803be6:	75 07                	jne    803bef <strtol+0x51>
  803be8:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  803bed:	eb 17                	jmp    803c06 <strtol+0x68>
  803bef:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803bf3:	0f b6 00             	movzbl (%rax),%eax
  803bf6:	3c 2d                	cmp    $0x2d,%al
  803bf8:	75 0c                	jne    803c06 <strtol+0x68>
  803bfa:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  803bff:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  803c06:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  803c0a:	74 06                	je     803c12 <strtol+0x74>
  803c0c:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  803c10:	75 28                	jne    803c3a <strtol+0x9c>
  803c12:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803c16:	0f b6 00             	movzbl (%rax),%eax
  803c19:	3c 30                	cmp    $0x30,%al
  803c1b:	75 1d                	jne    803c3a <strtol+0x9c>
  803c1d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803c21:	48 83 c0 01          	add    $0x1,%rax
  803c25:	0f b6 00             	movzbl (%rax),%eax
  803c28:	3c 78                	cmp    $0x78,%al
  803c2a:	75 0e                	jne    803c3a <strtol+0x9c>
  803c2c:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  803c31:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  803c38:	eb 2c                	jmp    803c66 <strtol+0xc8>
  803c3a:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  803c3e:	75 19                	jne    803c59 <strtol+0xbb>
  803c40:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803c44:	0f b6 00             	movzbl (%rax),%eax
  803c47:	3c 30                	cmp    $0x30,%al
  803c49:	75 0e                	jne    803c59 <strtol+0xbb>
  803c4b:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  803c50:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  803c57:	eb 0d                	jmp    803c66 <strtol+0xc8>
  803c59:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  803c5d:	75 07                	jne    803c66 <strtol+0xc8>
  803c5f:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  803c66:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803c6a:	0f b6 00             	movzbl (%rax),%eax
  803c6d:	3c 2f                	cmp    $0x2f,%al
  803c6f:	7e 1d                	jle    803c8e <strtol+0xf0>
  803c71:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803c75:	0f b6 00             	movzbl (%rax),%eax
  803c78:	3c 39                	cmp    $0x39,%al
  803c7a:	7f 12                	jg     803c8e <strtol+0xf0>
  803c7c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803c80:	0f b6 00             	movzbl (%rax),%eax
  803c83:	0f be c0             	movsbl %al,%eax
  803c86:	83 e8 30             	sub    $0x30,%eax
  803c89:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803c8c:	eb 4e                	jmp    803cdc <strtol+0x13e>
  803c8e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803c92:	0f b6 00             	movzbl (%rax),%eax
  803c95:	3c 60                	cmp    $0x60,%al
  803c97:	7e 1d                	jle    803cb6 <strtol+0x118>
  803c99:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803c9d:	0f b6 00             	movzbl (%rax),%eax
  803ca0:	3c 7a                	cmp    $0x7a,%al
  803ca2:	7f 12                	jg     803cb6 <strtol+0x118>
  803ca4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803ca8:	0f b6 00             	movzbl (%rax),%eax
  803cab:	0f be c0             	movsbl %al,%eax
  803cae:	83 e8 57             	sub    $0x57,%eax
  803cb1:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803cb4:	eb 26                	jmp    803cdc <strtol+0x13e>
  803cb6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803cba:	0f b6 00             	movzbl (%rax),%eax
  803cbd:	3c 40                	cmp    $0x40,%al
  803cbf:	7e 48                	jle    803d09 <strtol+0x16b>
  803cc1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803cc5:	0f b6 00             	movzbl (%rax),%eax
  803cc8:	3c 5a                	cmp    $0x5a,%al
  803cca:	7f 3d                	jg     803d09 <strtol+0x16b>
  803ccc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803cd0:	0f b6 00             	movzbl (%rax),%eax
  803cd3:	0f be c0             	movsbl %al,%eax
  803cd6:	83 e8 37             	sub    $0x37,%eax
  803cd9:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803cdc:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803cdf:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  803ce2:	7c 02                	jl     803ce6 <strtol+0x148>
  803ce4:	eb 23                	jmp    803d09 <strtol+0x16b>
  803ce6:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  803ceb:	8b 45 cc             	mov    -0x34(%rbp),%eax
  803cee:	48 98                	cltq   
  803cf0:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  803cf5:	48 89 c2             	mov    %rax,%rdx
  803cf8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803cfb:	48 98                	cltq   
  803cfd:	48 01 d0             	add    %rdx,%rax
  803d00:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803d04:	e9 5d ff ff ff       	jmpq   803c66 <strtol+0xc8>
  803d09:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  803d0e:	74 0b                	je     803d1b <strtol+0x17d>
  803d10:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803d14:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803d18:	48 89 10             	mov    %rdx,(%rax)
  803d1b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803d1f:	74 09                	je     803d2a <strtol+0x18c>
  803d21:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803d25:	48 f7 d8             	neg    %rax
  803d28:	eb 04                	jmp    803d2e <strtol+0x190>
  803d2a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803d2e:	c9                   	leaveq 
  803d2f:	c3                   	retq   

0000000000803d30 <strstr>:
  803d30:	55                   	push   %rbp
  803d31:	48 89 e5             	mov    %rsp,%rbp
  803d34:	48 83 ec 30          	sub    $0x30,%rsp
  803d38:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803d3c:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803d40:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803d44:	48 8d 50 01          	lea    0x1(%rax),%rdx
  803d48:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  803d4c:	0f b6 00             	movzbl (%rax),%eax
  803d4f:	88 45 ff             	mov    %al,-0x1(%rbp)
  803d52:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  803d56:	75 06                	jne    803d5e <strstr+0x2e>
  803d58:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803d5c:	eb 6b                	jmp    803dc9 <strstr+0x99>
  803d5e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803d62:	48 89 c7             	mov    %rax,%rdi
  803d65:	48 b8 06 36 80 00 00 	movabs $0x803606,%rax
  803d6c:	00 00 00 
  803d6f:	ff d0                	callq  *%rax
  803d71:	48 98                	cltq   
  803d73:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803d77:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803d7b:	48 8d 50 01          	lea    0x1(%rax),%rdx
  803d7f:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803d83:	0f b6 00             	movzbl (%rax),%eax
  803d86:	88 45 ef             	mov    %al,-0x11(%rbp)
  803d89:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  803d8d:	75 07                	jne    803d96 <strstr+0x66>
  803d8f:	b8 00 00 00 00       	mov    $0x0,%eax
  803d94:	eb 33                	jmp    803dc9 <strstr+0x99>
  803d96:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  803d9a:	3a 45 ff             	cmp    -0x1(%rbp),%al
  803d9d:	75 d8                	jne    803d77 <strstr+0x47>
  803d9f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803da3:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  803da7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803dab:	48 89 ce             	mov    %rcx,%rsi
  803dae:	48 89 c7             	mov    %rax,%rdi
  803db1:	48 b8 27 38 80 00 00 	movabs $0x803827,%rax
  803db8:	00 00 00 
  803dbb:	ff d0                	callq  *%rax
  803dbd:	85 c0                	test   %eax,%eax
  803dbf:	75 b6                	jne    803d77 <strstr+0x47>
  803dc1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803dc5:	48 83 e8 01          	sub    $0x1,%rax
  803dc9:	c9                   	leaveq 
  803dca:	c3                   	retq   

0000000000803dcb <ipc_recv>:
  803dcb:	55                   	push   %rbp
  803dcc:	48 89 e5             	mov    %rsp,%rbp
  803dcf:	48 83 ec 30          	sub    $0x30,%rsp
  803dd3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803dd7:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803ddb:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803ddf:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  803de4:	75 0e                	jne    803df4 <ipc_recv+0x29>
  803de6:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  803ded:	00 00 00 
  803df0:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803df4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803df8:	48 89 c7             	mov    %rax,%rdi
  803dfb:	48 b8 1c 05 80 00 00 	movabs $0x80051c,%rax
  803e02:	00 00 00 
  803e05:	ff d0                	callq  *%rax
  803e07:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803e0a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803e0e:	79 27                	jns    803e37 <ipc_recv+0x6c>
  803e10:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  803e15:	74 0a                	je     803e21 <ipc_recv+0x56>
  803e17:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803e1b:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  803e21:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  803e26:	74 0a                	je     803e32 <ipc_recv+0x67>
  803e28:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803e2c:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  803e32:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e35:	eb 53                	jmp    803e8a <ipc_recv+0xbf>
  803e37:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  803e3c:	74 19                	je     803e57 <ipc_recv+0x8c>
  803e3e:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803e45:	00 00 00 
  803e48:	48 8b 00             	mov    (%rax),%rax
  803e4b:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  803e51:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803e55:	89 10                	mov    %edx,(%rax)
  803e57:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  803e5c:	74 19                	je     803e77 <ipc_recv+0xac>
  803e5e:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803e65:	00 00 00 
  803e68:	48 8b 00             	mov    (%rax),%rax
  803e6b:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  803e71:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803e75:	89 10                	mov    %edx,(%rax)
  803e77:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803e7e:	00 00 00 
  803e81:	48 8b 00             	mov    (%rax),%rax
  803e84:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  803e8a:	c9                   	leaveq 
  803e8b:	c3                   	retq   

0000000000803e8c <ipc_send>:
  803e8c:	55                   	push   %rbp
  803e8d:	48 89 e5             	mov    %rsp,%rbp
  803e90:	48 83 ec 30          	sub    $0x30,%rsp
  803e94:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803e97:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803e9a:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  803e9e:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  803ea1:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  803ea6:	75 10                	jne    803eb8 <ipc_send+0x2c>
  803ea8:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  803eaf:	00 00 00 
  803eb2:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803eb6:	eb 0e                	jmp    803ec6 <ipc_send+0x3a>
  803eb8:	eb 0c                	jmp    803ec6 <ipc_send+0x3a>
  803eba:	48 b8 b5 02 80 00 00 	movabs $0x8002b5,%rax
  803ec1:	00 00 00 
  803ec4:	ff d0                	callq  *%rax
  803ec6:	8b 75 e8             	mov    -0x18(%rbp),%esi
  803ec9:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  803ecc:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  803ed0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803ed3:	89 c7                	mov    %eax,%edi
  803ed5:	48 b8 c7 04 80 00 00 	movabs $0x8004c7,%rax
  803edc:	00 00 00 
  803edf:	ff d0                	callq  *%rax
  803ee1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803ee4:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  803ee8:	74 d0                	je     803eba <ipc_send+0x2e>
  803eea:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803eee:	79 30                	jns    803f20 <ipc_send+0x94>
  803ef0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ef3:	89 c1                	mov    %eax,%ecx
  803ef5:	48 ba e8 46 80 00 00 	movabs $0x8046e8,%rdx
  803efc:	00 00 00 
  803eff:	be 44 00 00 00       	mov    $0x44,%esi
  803f04:	48 bf fe 46 80 00 00 	movabs $0x8046fe,%rdi
  803f0b:	00 00 00 
  803f0e:	b8 00 00 00 00       	mov    $0x0,%eax
  803f13:	49 b8 84 28 80 00 00 	movabs $0x802884,%r8
  803f1a:	00 00 00 
  803f1d:	41 ff d0             	callq  *%r8
  803f20:	c9                   	leaveq 
  803f21:	c3                   	retq   

0000000000803f22 <ipc_find_env>:
  803f22:	55                   	push   %rbp
  803f23:	48 89 e5             	mov    %rsp,%rbp
  803f26:	48 83 ec 14          	sub    $0x14,%rsp
  803f2a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803f2d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803f34:	eb 4e                	jmp    803f84 <ipc_find_env+0x62>
  803f36:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  803f3d:	00 00 00 
  803f40:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f43:	48 98                	cltq   
  803f45:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  803f4c:	48 01 d0             	add    %rdx,%rax
  803f4f:	48 05 d0 00 00 00    	add    $0xd0,%rax
  803f55:	8b 00                	mov    (%rax),%eax
  803f57:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  803f5a:	75 24                	jne    803f80 <ipc_find_env+0x5e>
  803f5c:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  803f63:	00 00 00 
  803f66:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f69:	48 98                	cltq   
  803f6b:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  803f72:	48 01 d0             	add    %rdx,%rax
  803f75:	48 05 c0 00 00 00    	add    $0xc0,%rax
  803f7b:	8b 40 08             	mov    0x8(%rax),%eax
  803f7e:	eb 12                	jmp    803f92 <ipc_find_env+0x70>
  803f80:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  803f84:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  803f8b:	7e a9                	jle    803f36 <ipc_find_env+0x14>
  803f8d:	b8 00 00 00 00       	mov    $0x0,%eax
  803f92:	c9                   	leaveq 
  803f93:	c3                   	retq   

0000000000803f94 <pageref>:
  803f94:	55                   	push   %rbp
  803f95:	48 89 e5             	mov    %rsp,%rbp
  803f98:	48 83 ec 18          	sub    $0x18,%rsp
  803f9c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803fa0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803fa4:	48 c1 e8 15          	shr    $0x15,%rax
  803fa8:	48 89 c2             	mov    %rax,%rdx
  803fab:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  803fb2:	01 00 00 
  803fb5:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803fb9:	83 e0 01             	and    $0x1,%eax
  803fbc:	48 85 c0             	test   %rax,%rax
  803fbf:	75 07                	jne    803fc8 <pageref+0x34>
  803fc1:	b8 00 00 00 00       	mov    $0x0,%eax
  803fc6:	eb 53                	jmp    80401b <pageref+0x87>
  803fc8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803fcc:	48 c1 e8 0c          	shr    $0xc,%rax
  803fd0:	48 89 c2             	mov    %rax,%rdx
  803fd3:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  803fda:	01 00 00 
  803fdd:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803fe1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803fe5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803fe9:	83 e0 01             	and    $0x1,%eax
  803fec:	48 85 c0             	test   %rax,%rax
  803fef:	75 07                	jne    803ff8 <pageref+0x64>
  803ff1:	b8 00 00 00 00       	mov    $0x0,%eax
  803ff6:	eb 23                	jmp    80401b <pageref+0x87>
  803ff8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803ffc:	48 c1 e8 0c          	shr    $0xc,%rax
  804000:	48 89 c2             	mov    %rax,%rdx
  804003:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  80400a:	00 00 00 
  80400d:	48 c1 e2 04          	shl    $0x4,%rdx
  804011:	48 01 d0             	add    %rdx,%rax
  804014:	0f b7 40 08          	movzwl 0x8(%rax),%eax
  804018:	0f b7 c0             	movzwl %ax,%eax
  80401b:	c9                   	leaveq 
  80401c:	c3                   	retq   
