
obj/user/primes:     file format elf64-x86-64


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
  80003c:	e8 8d 01 00 00       	callq  8001ce <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <primeproc>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 10          	sub    $0x10,%rsp
  80004b:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  80004f:	ba 00 00 00 00       	mov    $0x0,%edx
  800054:	be 00 00 00 00       	mov    $0x0,%esi
  800059:	48 89 c7             	mov    %rax,%rdi
  80005c:	48 b8 84 24 80 00 00 	movabs $0x802484,%rax
  800063:	00 00 00 
  800066:	ff d0                	callq  *%rax
  800068:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80006b:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  800072:	00 00 00 
  800075:	48 8b 00             	mov    (%rax),%rax
  800078:	8b 80 dc 00 00 00    	mov    0xdc(%rax),%eax
  80007e:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800081:	89 c6                	mov    %eax,%esi
  800083:	48 bf c0 48 80 00 00 	movabs $0x8048c0,%rdi
  80008a:	00 00 00 
  80008d:	b8 00 00 00 00       	mov    $0x0,%eax
  800092:	48 b9 ad 04 80 00 00 	movabs $0x8004ad,%rcx
  800099:	00 00 00 
  80009c:	ff d1                	callq  *%rcx
  80009e:	48 b8 0f 22 80 00 00 	movabs $0x80220f,%rax
  8000a5:	00 00 00 
  8000a8:	ff d0                	callq  *%rax
  8000aa:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8000ad:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8000b1:	79 30                	jns    8000e3 <primeproc+0xa0>
  8000b3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8000b6:	89 c1                	mov    %eax,%ecx
  8000b8:	48 ba cc 48 80 00 00 	movabs $0x8048cc,%rdx
  8000bf:	00 00 00 
  8000c2:	be 1b 00 00 00       	mov    $0x1b,%esi
  8000c7:	48 bf d5 48 80 00 00 	movabs $0x8048d5,%rdi
  8000ce:	00 00 00 
  8000d1:	b8 00 00 00 00       	mov    $0x0,%eax
  8000d6:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  8000dd:	00 00 00 
  8000e0:	41 ff d0             	callq  *%r8
  8000e3:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8000e7:	75 05                	jne    8000ee <primeproc+0xab>
  8000e9:	e9 5d ff ff ff       	jmpq   80004b <primeproc+0x8>
  8000ee:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8000f2:	ba 00 00 00 00       	mov    $0x0,%edx
  8000f7:	be 00 00 00 00       	mov    $0x0,%esi
  8000fc:	48 89 c7             	mov    %rax,%rdi
  8000ff:	48 b8 84 24 80 00 00 	movabs $0x802484,%rax
  800106:	00 00 00 
  800109:	ff d0                	callq  *%rax
  80010b:	89 45 f4             	mov    %eax,-0xc(%rbp)
  80010e:	8b 45 f4             	mov    -0xc(%rbp),%eax
  800111:	99                   	cltd   
  800112:	f7 7d fc             	idivl  -0x4(%rbp)
  800115:	89 d0                	mov    %edx,%eax
  800117:	85 c0                	test   %eax,%eax
  800119:	74 20                	je     80013b <primeproc+0xf8>
  80011b:	8b 75 f4             	mov    -0xc(%rbp),%esi
  80011e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800121:	b9 00 00 00 00       	mov    $0x0,%ecx
  800126:	ba 00 00 00 00       	mov    $0x0,%edx
  80012b:	89 c7                	mov    %eax,%edi
  80012d:	48 b8 45 25 80 00 00 	movabs $0x802545,%rax
  800134:	00 00 00 
  800137:	ff d0                	callq  *%rax
  800139:	eb b3                	jmp    8000ee <primeproc+0xab>
  80013b:	eb b1                	jmp    8000ee <primeproc+0xab>

000000000080013d <umain>:
  80013d:	55                   	push   %rbp
  80013e:	48 89 e5             	mov    %rsp,%rbp
  800141:	48 83 ec 20          	sub    $0x20,%rsp
  800145:	89 7d ec             	mov    %edi,-0x14(%rbp)
  800148:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80014c:	48 b8 0f 22 80 00 00 	movabs $0x80220f,%rax
  800153:	00 00 00 
  800156:	ff d0                	callq  *%rax
  800158:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80015b:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80015f:	79 30                	jns    800191 <umain+0x54>
  800161:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800164:	89 c1                	mov    %eax,%ecx
  800166:	48 ba cc 48 80 00 00 	movabs $0x8048cc,%rdx
  80016d:	00 00 00 
  800170:	be 2e 00 00 00       	mov    $0x2e,%esi
  800175:	48 bf d5 48 80 00 00 	movabs $0x8048d5,%rdi
  80017c:	00 00 00 
  80017f:	b8 00 00 00 00       	mov    $0x0,%eax
  800184:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  80018b:	00 00 00 
  80018e:	41 ff d0             	callq  *%r8
  800191:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  800195:	75 0c                	jne    8001a3 <umain+0x66>
  800197:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  80019e:	00 00 00 
  8001a1:	ff d0                	callq  *%rax
  8001a3:	c7 45 fc 02 00 00 00 	movl   $0x2,-0x4(%rbp)
  8001aa:	8b 75 fc             	mov    -0x4(%rbp),%esi
  8001ad:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8001b0:	b9 00 00 00 00       	mov    $0x0,%ecx
  8001b5:	ba 00 00 00 00       	mov    $0x0,%edx
  8001ba:	89 c7                	mov    %eax,%edi
  8001bc:	48 b8 45 25 80 00 00 	movabs $0x802545,%rax
  8001c3:	00 00 00 
  8001c6:	ff d0                	callq  *%rax
  8001c8:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8001cc:	eb dc                	jmp    8001aa <umain+0x6d>

00000000008001ce <libmain>:
  8001ce:	55                   	push   %rbp
  8001cf:	48 89 e5             	mov    %rsp,%rbp
  8001d2:	48 83 ec 10          	sub    $0x10,%rsp
  8001d6:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8001d9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8001dd:	48 b8 15 19 80 00 00 	movabs $0x801915,%rax
  8001e4:	00 00 00 
  8001e7:	ff d0                	callq  *%rax
  8001e9:	25 ff 03 00 00       	and    $0x3ff,%eax
  8001ee:	48 98                	cltq   
  8001f0:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8001f7:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8001fe:	00 00 00 
  800201:	48 01 c2             	add    %rax,%rdx
  800204:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80020b:	00 00 00 
  80020e:	48 89 10             	mov    %rdx,(%rax)
  800211:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800215:	7e 14                	jle    80022b <libmain+0x5d>
  800217:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80021b:	48 8b 10             	mov    (%rax),%rdx
  80021e:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  800225:	00 00 00 
  800228:	48 89 10             	mov    %rdx,(%rax)
  80022b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80022f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800232:	48 89 d6             	mov    %rdx,%rsi
  800235:	89 c7                	mov    %eax,%edi
  800237:	48 b8 3d 01 80 00 00 	movabs $0x80013d,%rax
  80023e:	00 00 00 
  800241:	ff d0                	callq  *%rax
  800243:	48 b8 51 02 80 00 00 	movabs $0x800251,%rax
  80024a:	00 00 00 
  80024d:	ff d0                	callq  *%rax
  80024f:	c9                   	leaveq 
  800250:	c3                   	retq   

0000000000800251 <exit>:
  800251:	55                   	push   %rbp
  800252:	48 89 e5             	mov    %rsp,%rbp
  800255:	48 b8 8e 29 80 00 00 	movabs $0x80298e,%rax
  80025c:	00 00 00 
  80025f:	ff d0                	callq  *%rax
  800261:	bf 00 00 00 00       	mov    $0x0,%edi
  800266:	48 b8 d1 18 80 00 00 	movabs $0x8018d1,%rax
  80026d:	00 00 00 
  800270:	ff d0                	callq  *%rax
  800272:	5d                   	pop    %rbp
  800273:	c3                   	retq   

0000000000800274 <_panic>:
  800274:	55                   	push   %rbp
  800275:	48 89 e5             	mov    %rsp,%rbp
  800278:	53                   	push   %rbx
  800279:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  800280:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  800287:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  80028d:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  800294:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  80029b:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  8002a2:	84 c0                	test   %al,%al
  8002a4:	74 23                	je     8002c9 <_panic+0x55>
  8002a6:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  8002ad:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  8002b1:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  8002b5:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  8002b9:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  8002bd:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  8002c1:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  8002c5:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  8002c9:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  8002d0:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  8002d7:	00 00 00 
  8002da:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  8002e1:	00 00 00 
  8002e4:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8002e8:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  8002ef:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  8002f6:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8002fd:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  800304:	00 00 00 
  800307:	48 8b 18             	mov    (%rax),%rbx
  80030a:	48 b8 15 19 80 00 00 	movabs $0x801915,%rax
  800311:	00 00 00 
  800314:	ff d0                	callq  *%rax
  800316:	8b 8d 14 ff ff ff    	mov    -0xec(%rbp),%ecx
  80031c:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800323:	41 89 c8             	mov    %ecx,%r8d
  800326:	48 89 d1             	mov    %rdx,%rcx
  800329:	48 89 da             	mov    %rbx,%rdx
  80032c:	89 c6                	mov    %eax,%esi
  80032e:	48 bf f0 48 80 00 00 	movabs $0x8048f0,%rdi
  800335:	00 00 00 
  800338:	b8 00 00 00 00       	mov    $0x0,%eax
  80033d:	49 b9 ad 04 80 00 00 	movabs $0x8004ad,%r9
  800344:	00 00 00 
  800347:	41 ff d1             	callq  *%r9
  80034a:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  800351:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800358:	48 89 d6             	mov    %rdx,%rsi
  80035b:	48 89 c7             	mov    %rax,%rdi
  80035e:	48 b8 01 04 80 00 00 	movabs $0x800401,%rax
  800365:	00 00 00 
  800368:	ff d0                	callq  *%rax
  80036a:	48 bf 13 49 80 00 00 	movabs $0x804913,%rdi
  800371:	00 00 00 
  800374:	b8 00 00 00 00       	mov    $0x0,%eax
  800379:	48 ba ad 04 80 00 00 	movabs $0x8004ad,%rdx
  800380:	00 00 00 
  800383:	ff d2                	callq  *%rdx
  800385:	cc                   	int3   
  800386:	eb fd                	jmp    800385 <_panic+0x111>

0000000000800388 <putch>:
  800388:	55                   	push   %rbp
  800389:	48 89 e5             	mov    %rsp,%rbp
  80038c:	48 83 ec 10          	sub    $0x10,%rsp
  800390:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800393:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800397:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80039b:	8b 00                	mov    (%rax),%eax
  80039d:	8d 48 01             	lea    0x1(%rax),%ecx
  8003a0:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8003a4:	89 0a                	mov    %ecx,(%rdx)
  8003a6:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8003a9:	89 d1                	mov    %edx,%ecx
  8003ab:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8003af:	48 98                	cltq   
  8003b1:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  8003b5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8003b9:	8b 00                	mov    (%rax),%eax
  8003bb:	3d ff 00 00 00       	cmp    $0xff,%eax
  8003c0:	75 2c                	jne    8003ee <putch+0x66>
  8003c2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8003c6:	8b 00                	mov    (%rax),%eax
  8003c8:	48 98                	cltq   
  8003ca:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8003ce:	48 83 c2 08          	add    $0x8,%rdx
  8003d2:	48 89 c6             	mov    %rax,%rsi
  8003d5:	48 89 d7             	mov    %rdx,%rdi
  8003d8:	48 b8 49 18 80 00 00 	movabs $0x801849,%rax
  8003df:	00 00 00 
  8003e2:	ff d0                	callq  *%rax
  8003e4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8003e8:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8003ee:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8003f2:	8b 40 04             	mov    0x4(%rax),%eax
  8003f5:	8d 50 01             	lea    0x1(%rax),%edx
  8003f8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8003fc:	89 50 04             	mov    %edx,0x4(%rax)
  8003ff:	c9                   	leaveq 
  800400:	c3                   	retq   

0000000000800401 <vcprintf>:
  800401:	55                   	push   %rbp
  800402:	48 89 e5             	mov    %rsp,%rbp
  800405:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  80040c:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  800413:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  80041a:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  800421:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  800428:	48 8b 0a             	mov    (%rdx),%rcx
  80042b:	48 89 08             	mov    %rcx,(%rax)
  80042e:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800432:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800436:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  80043a:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80043e:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  800445:	00 00 00 
  800448:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  80044f:	00 00 00 
  800452:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  800459:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  800460:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800467:	48 89 c6             	mov    %rax,%rsi
  80046a:	48 bf 88 03 80 00 00 	movabs $0x800388,%rdi
  800471:	00 00 00 
  800474:	48 b8 60 08 80 00 00 	movabs $0x800860,%rax
  80047b:	00 00 00 
  80047e:	ff d0                	callq  *%rax
  800480:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  800486:	48 98                	cltq   
  800488:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  80048f:	48 83 c2 08          	add    $0x8,%rdx
  800493:	48 89 c6             	mov    %rax,%rsi
  800496:	48 89 d7             	mov    %rdx,%rdi
  800499:	48 b8 49 18 80 00 00 	movabs $0x801849,%rax
  8004a0:	00 00 00 
  8004a3:	ff d0                	callq  *%rax
  8004a5:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  8004ab:	c9                   	leaveq 
  8004ac:	c3                   	retq   

00000000008004ad <cprintf>:
  8004ad:	55                   	push   %rbp
  8004ae:	48 89 e5             	mov    %rsp,%rbp
  8004b1:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  8004b8:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  8004bf:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  8004c6:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8004cd:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8004d4:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8004db:	84 c0                	test   %al,%al
  8004dd:	74 20                	je     8004ff <cprintf+0x52>
  8004df:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8004e3:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8004e7:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8004eb:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8004ef:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8004f3:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8004f7:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8004fb:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8004ff:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800506:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  80050d:	00 00 00 
  800510:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800517:	00 00 00 
  80051a:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80051e:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800525:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  80052c:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800533:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  80053a:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800541:	48 8b 0a             	mov    (%rdx),%rcx
  800544:	48 89 08             	mov    %rcx,(%rax)
  800547:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80054b:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80054f:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800553:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800557:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  80055e:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800565:	48 89 d6             	mov    %rdx,%rsi
  800568:	48 89 c7             	mov    %rax,%rdi
  80056b:	48 b8 01 04 80 00 00 	movabs $0x800401,%rax
  800572:	00 00 00 
  800575:	ff d0                	callq  *%rax
  800577:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  80057d:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  800583:	c9                   	leaveq 
  800584:	c3                   	retq   

0000000000800585 <printnum>:
  800585:	55                   	push   %rbp
  800586:	48 89 e5             	mov    %rsp,%rbp
  800589:	53                   	push   %rbx
  80058a:	48 83 ec 38          	sub    $0x38,%rsp
  80058e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800592:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800596:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80059a:	89 4d d4             	mov    %ecx,-0x2c(%rbp)
  80059d:	44 89 45 d0          	mov    %r8d,-0x30(%rbp)
  8005a1:	44 89 4d cc          	mov    %r9d,-0x34(%rbp)
  8005a5:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  8005a8:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8005ac:	77 3b                	ja     8005e9 <printnum+0x64>
  8005ae:	8b 45 d0             	mov    -0x30(%rbp),%eax
  8005b1:	44 8d 40 ff          	lea    -0x1(%rax),%r8d
  8005b5:	8b 5d d4             	mov    -0x2c(%rbp),%ebx
  8005b8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8005bc:	ba 00 00 00 00       	mov    $0x0,%edx
  8005c1:	48 f7 f3             	div    %rbx
  8005c4:	48 89 c2             	mov    %rax,%rdx
  8005c7:	8b 7d cc             	mov    -0x34(%rbp),%edi
  8005ca:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  8005cd:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
  8005d1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005d5:	41 89 f9             	mov    %edi,%r9d
  8005d8:	48 89 c7             	mov    %rax,%rdi
  8005db:	48 b8 85 05 80 00 00 	movabs $0x800585,%rax
  8005e2:	00 00 00 
  8005e5:	ff d0                	callq  *%rax
  8005e7:	eb 1e                	jmp    800607 <printnum+0x82>
  8005e9:	eb 12                	jmp    8005fd <printnum+0x78>
  8005eb:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8005ef:	8b 55 cc             	mov    -0x34(%rbp),%edx
  8005f2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005f6:	48 89 ce             	mov    %rcx,%rsi
  8005f9:	89 d7                	mov    %edx,%edi
  8005fb:	ff d0                	callq  *%rax
  8005fd:	83 6d d0 01          	subl   $0x1,-0x30(%rbp)
  800601:	83 7d d0 00          	cmpl   $0x0,-0x30(%rbp)
  800605:	7f e4                	jg     8005eb <printnum+0x66>
  800607:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  80060a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80060e:	ba 00 00 00 00       	mov    $0x0,%edx
  800613:	48 f7 f1             	div    %rcx
  800616:	48 89 d0             	mov    %rdx,%rax
  800619:	48 ba 10 4b 80 00 00 	movabs $0x804b10,%rdx
  800620:	00 00 00 
  800623:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
  800627:	0f be d0             	movsbl %al,%edx
  80062a:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80062e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800632:	48 89 ce             	mov    %rcx,%rsi
  800635:	89 d7                	mov    %edx,%edi
  800637:	ff d0                	callq  *%rax
  800639:	48 83 c4 38          	add    $0x38,%rsp
  80063d:	5b                   	pop    %rbx
  80063e:	5d                   	pop    %rbp
  80063f:	c3                   	retq   

0000000000800640 <getuint>:
  800640:	55                   	push   %rbp
  800641:	48 89 e5             	mov    %rsp,%rbp
  800644:	48 83 ec 1c          	sub    $0x1c,%rsp
  800648:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80064c:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80064f:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800653:	7e 52                	jle    8006a7 <getuint+0x67>
  800655:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800659:	8b 00                	mov    (%rax),%eax
  80065b:	83 f8 30             	cmp    $0x30,%eax
  80065e:	73 24                	jae    800684 <getuint+0x44>
  800660:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800664:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800668:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80066c:	8b 00                	mov    (%rax),%eax
  80066e:	89 c0                	mov    %eax,%eax
  800670:	48 01 d0             	add    %rdx,%rax
  800673:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800677:	8b 12                	mov    (%rdx),%edx
  800679:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80067c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800680:	89 0a                	mov    %ecx,(%rdx)
  800682:	eb 17                	jmp    80069b <getuint+0x5b>
  800684:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800688:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80068c:	48 89 d0             	mov    %rdx,%rax
  80068f:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800693:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800697:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80069b:	48 8b 00             	mov    (%rax),%rax
  80069e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8006a2:	e9 a3 00 00 00       	jmpq   80074a <getuint+0x10a>
  8006a7:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  8006ab:	74 4f                	je     8006fc <getuint+0xbc>
  8006ad:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006b1:	8b 00                	mov    (%rax),%eax
  8006b3:	83 f8 30             	cmp    $0x30,%eax
  8006b6:	73 24                	jae    8006dc <getuint+0x9c>
  8006b8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006bc:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8006c0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006c4:	8b 00                	mov    (%rax),%eax
  8006c6:	89 c0                	mov    %eax,%eax
  8006c8:	48 01 d0             	add    %rdx,%rax
  8006cb:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006cf:	8b 12                	mov    (%rdx),%edx
  8006d1:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8006d4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006d8:	89 0a                	mov    %ecx,(%rdx)
  8006da:	eb 17                	jmp    8006f3 <getuint+0xb3>
  8006dc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006e0:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8006e4:	48 89 d0             	mov    %rdx,%rax
  8006e7:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8006eb:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006ef:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8006f3:	48 8b 00             	mov    (%rax),%rax
  8006f6:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8006fa:	eb 4e                	jmp    80074a <getuint+0x10a>
  8006fc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800700:	8b 00                	mov    (%rax),%eax
  800702:	83 f8 30             	cmp    $0x30,%eax
  800705:	73 24                	jae    80072b <getuint+0xeb>
  800707:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80070b:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80070f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800713:	8b 00                	mov    (%rax),%eax
  800715:	89 c0                	mov    %eax,%eax
  800717:	48 01 d0             	add    %rdx,%rax
  80071a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80071e:	8b 12                	mov    (%rdx),%edx
  800720:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800723:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800727:	89 0a                	mov    %ecx,(%rdx)
  800729:	eb 17                	jmp    800742 <getuint+0x102>
  80072b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80072f:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800733:	48 89 d0             	mov    %rdx,%rax
  800736:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  80073a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80073e:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800742:	8b 00                	mov    (%rax),%eax
  800744:	89 c0                	mov    %eax,%eax
  800746:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80074a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80074e:	c9                   	leaveq 
  80074f:	c3                   	retq   

0000000000800750 <getint>:
  800750:	55                   	push   %rbp
  800751:	48 89 e5             	mov    %rsp,%rbp
  800754:	48 83 ec 1c          	sub    $0x1c,%rsp
  800758:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80075c:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80075f:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800763:	7e 52                	jle    8007b7 <getint+0x67>
  800765:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800769:	8b 00                	mov    (%rax),%eax
  80076b:	83 f8 30             	cmp    $0x30,%eax
  80076e:	73 24                	jae    800794 <getint+0x44>
  800770:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800774:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800778:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80077c:	8b 00                	mov    (%rax),%eax
  80077e:	89 c0                	mov    %eax,%eax
  800780:	48 01 d0             	add    %rdx,%rax
  800783:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800787:	8b 12                	mov    (%rdx),%edx
  800789:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80078c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800790:	89 0a                	mov    %ecx,(%rdx)
  800792:	eb 17                	jmp    8007ab <getint+0x5b>
  800794:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800798:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80079c:	48 89 d0             	mov    %rdx,%rax
  80079f:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8007a3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007a7:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8007ab:	48 8b 00             	mov    (%rax),%rax
  8007ae:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8007b2:	e9 a3 00 00 00       	jmpq   80085a <getint+0x10a>
  8007b7:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  8007bb:	74 4f                	je     80080c <getint+0xbc>
  8007bd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007c1:	8b 00                	mov    (%rax),%eax
  8007c3:	83 f8 30             	cmp    $0x30,%eax
  8007c6:	73 24                	jae    8007ec <getint+0x9c>
  8007c8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007cc:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8007d0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007d4:	8b 00                	mov    (%rax),%eax
  8007d6:	89 c0                	mov    %eax,%eax
  8007d8:	48 01 d0             	add    %rdx,%rax
  8007db:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007df:	8b 12                	mov    (%rdx),%edx
  8007e1:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8007e4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007e8:	89 0a                	mov    %ecx,(%rdx)
  8007ea:	eb 17                	jmp    800803 <getint+0xb3>
  8007ec:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007f0:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8007f4:	48 89 d0             	mov    %rdx,%rax
  8007f7:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8007fb:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007ff:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800803:	48 8b 00             	mov    (%rax),%rax
  800806:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80080a:	eb 4e                	jmp    80085a <getint+0x10a>
  80080c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800810:	8b 00                	mov    (%rax),%eax
  800812:	83 f8 30             	cmp    $0x30,%eax
  800815:	73 24                	jae    80083b <getint+0xeb>
  800817:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80081b:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80081f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800823:	8b 00                	mov    (%rax),%eax
  800825:	89 c0                	mov    %eax,%eax
  800827:	48 01 d0             	add    %rdx,%rax
  80082a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80082e:	8b 12                	mov    (%rdx),%edx
  800830:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800833:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800837:	89 0a                	mov    %ecx,(%rdx)
  800839:	eb 17                	jmp    800852 <getint+0x102>
  80083b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80083f:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800843:	48 89 d0             	mov    %rdx,%rax
  800846:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  80084a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80084e:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800852:	8b 00                	mov    (%rax),%eax
  800854:	48 98                	cltq   
  800856:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80085a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80085e:	c9                   	leaveq 
  80085f:	c3                   	retq   

0000000000800860 <vprintfmt>:
  800860:	55                   	push   %rbp
  800861:	48 89 e5             	mov    %rsp,%rbp
  800864:	41 54                	push   %r12
  800866:	53                   	push   %rbx
  800867:	48 83 ec 60          	sub    $0x60,%rsp
  80086b:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  80086f:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  800873:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800877:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  80087b:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  80087f:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  800883:	48 8b 0a             	mov    (%rdx),%rcx
  800886:	48 89 08             	mov    %rcx,(%rax)
  800889:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80088d:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800891:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800895:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800899:	eb 17                	jmp    8008b2 <vprintfmt+0x52>
  80089b:	85 db                	test   %ebx,%ebx
  80089d:	0f 84 cc 04 00 00    	je     800d6f <vprintfmt+0x50f>
  8008a3:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8008a7:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8008ab:	48 89 d6             	mov    %rdx,%rsi
  8008ae:	89 df                	mov    %ebx,%edi
  8008b0:	ff d0                	callq  *%rax
  8008b2:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8008b6:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8008ba:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8008be:	0f b6 00             	movzbl (%rax),%eax
  8008c1:	0f b6 d8             	movzbl %al,%ebx
  8008c4:	83 fb 25             	cmp    $0x25,%ebx
  8008c7:	75 d2                	jne    80089b <vprintfmt+0x3b>
  8008c9:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  8008cd:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  8008d4:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  8008db:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  8008e2:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  8008e9:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8008ed:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8008f1:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8008f5:	0f b6 00             	movzbl (%rax),%eax
  8008f8:	0f b6 d8             	movzbl %al,%ebx
  8008fb:	8d 43 dd             	lea    -0x23(%rbx),%eax
  8008fe:	83 f8 55             	cmp    $0x55,%eax
  800901:	0f 87 34 04 00 00    	ja     800d3b <vprintfmt+0x4db>
  800907:	89 c0                	mov    %eax,%eax
  800909:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800910:	00 
  800911:	48 b8 38 4b 80 00 00 	movabs $0x804b38,%rax
  800918:	00 00 00 
  80091b:	48 01 d0             	add    %rdx,%rax
  80091e:	48 8b 00             	mov    (%rax),%rax
  800921:	ff e0                	jmpq   *%rax
  800923:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  800927:	eb c0                	jmp    8008e9 <vprintfmt+0x89>
  800929:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  80092d:	eb ba                	jmp    8008e9 <vprintfmt+0x89>
  80092f:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  800936:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800939:	89 d0                	mov    %edx,%eax
  80093b:	c1 e0 02             	shl    $0x2,%eax
  80093e:	01 d0                	add    %edx,%eax
  800940:	01 c0                	add    %eax,%eax
  800942:	01 d8                	add    %ebx,%eax
  800944:	83 e8 30             	sub    $0x30,%eax
  800947:	89 45 d8             	mov    %eax,-0x28(%rbp)
  80094a:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  80094e:	0f b6 00             	movzbl (%rax),%eax
  800951:	0f be d8             	movsbl %al,%ebx
  800954:	83 fb 2f             	cmp    $0x2f,%ebx
  800957:	7e 0c                	jle    800965 <vprintfmt+0x105>
  800959:	83 fb 39             	cmp    $0x39,%ebx
  80095c:	7f 07                	jg     800965 <vprintfmt+0x105>
  80095e:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  800963:	eb d1                	jmp    800936 <vprintfmt+0xd6>
  800965:	eb 58                	jmp    8009bf <vprintfmt+0x15f>
  800967:	8b 45 b8             	mov    -0x48(%rbp),%eax
  80096a:	83 f8 30             	cmp    $0x30,%eax
  80096d:	73 17                	jae    800986 <vprintfmt+0x126>
  80096f:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800973:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800976:	89 c0                	mov    %eax,%eax
  800978:	48 01 d0             	add    %rdx,%rax
  80097b:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80097e:	83 c2 08             	add    $0x8,%edx
  800981:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800984:	eb 0f                	jmp    800995 <vprintfmt+0x135>
  800986:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  80098a:	48 89 d0             	mov    %rdx,%rax
  80098d:	48 83 c2 08          	add    $0x8,%rdx
  800991:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800995:	8b 00                	mov    (%rax),%eax
  800997:	89 45 d8             	mov    %eax,-0x28(%rbp)
  80099a:	eb 23                	jmp    8009bf <vprintfmt+0x15f>
  80099c:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8009a0:	79 0c                	jns    8009ae <vprintfmt+0x14e>
  8009a2:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  8009a9:	e9 3b ff ff ff       	jmpq   8008e9 <vprintfmt+0x89>
  8009ae:	e9 36 ff ff ff       	jmpq   8008e9 <vprintfmt+0x89>
  8009b3:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  8009ba:	e9 2a ff ff ff       	jmpq   8008e9 <vprintfmt+0x89>
  8009bf:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8009c3:	79 12                	jns    8009d7 <vprintfmt+0x177>
  8009c5:	8b 45 d8             	mov    -0x28(%rbp),%eax
  8009c8:	89 45 dc             	mov    %eax,-0x24(%rbp)
  8009cb:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  8009d2:	e9 12 ff ff ff       	jmpq   8008e9 <vprintfmt+0x89>
  8009d7:	e9 0d ff ff ff       	jmpq   8008e9 <vprintfmt+0x89>
  8009dc:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  8009e0:	e9 04 ff ff ff       	jmpq   8008e9 <vprintfmt+0x89>
  8009e5:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8009e8:	83 f8 30             	cmp    $0x30,%eax
  8009eb:	73 17                	jae    800a04 <vprintfmt+0x1a4>
  8009ed:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8009f1:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8009f4:	89 c0                	mov    %eax,%eax
  8009f6:	48 01 d0             	add    %rdx,%rax
  8009f9:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8009fc:	83 c2 08             	add    $0x8,%edx
  8009ff:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800a02:	eb 0f                	jmp    800a13 <vprintfmt+0x1b3>
  800a04:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800a08:	48 89 d0             	mov    %rdx,%rax
  800a0b:	48 83 c2 08          	add    $0x8,%rdx
  800a0f:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800a13:	8b 10                	mov    (%rax),%edx
  800a15:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800a19:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a1d:	48 89 ce             	mov    %rcx,%rsi
  800a20:	89 d7                	mov    %edx,%edi
  800a22:	ff d0                	callq  *%rax
  800a24:	e9 40 03 00 00       	jmpq   800d69 <vprintfmt+0x509>
  800a29:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800a2c:	83 f8 30             	cmp    $0x30,%eax
  800a2f:	73 17                	jae    800a48 <vprintfmt+0x1e8>
  800a31:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800a35:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800a38:	89 c0                	mov    %eax,%eax
  800a3a:	48 01 d0             	add    %rdx,%rax
  800a3d:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800a40:	83 c2 08             	add    $0x8,%edx
  800a43:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800a46:	eb 0f                	jmp    800a57 <vprintfmt+0x1f7>
  800a48:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800a4c:	48 89 d0             	mov    %rdx,%rax
  800a4f:	48 83 c2 08          	add    $0x8,%rdx
  800a53:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800a57:	8b 18                	mov    (%rax),%ebx
  800a59:	85 db                	test   %ebx,%ebx
  800a5b:	79 02                	jns    800a5f <vprintfmt+0x1ff>
  800a5d:	f7 db                	neg    %ebx
  800a5f:	83 fb 15             	cmp    $0x15,%ebx
  800a62:	7f 16                	jg     800a7a <vprintfmt+0x21a>
  800a64:	48 b8 60 4a 80 00 00 	movabs $0x804a60,%rax
  800a6b:	00 00 00 
  800a6e:	48 63 d3             	movslq %ebx,%rdx
  800a71:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800a75:	4d 85 e4             	test   %r12,%r12
  800a78:	75 2e                	jne    800aa8 <vprintfmt+0x248>
  800a7a:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800a7e:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a82:	89 d9                	mov    %ebx,%ecx
  800a84:	48 ba 21 4b 80 00 00 	movabs $0x804b21,%rdx
  800a8b:	00 00 00 
  800a8e:	48 89 c7             	mov    %rax,%rdi
  800a91:	b8 00 00 00 00       	mov    $0x0,%eax
  800a96:	49 b8 78 0d 80 00 00 	movabs $0x800d78,%r8
  800a9d:	00 00 00 
  800aa0:	41 ff d0             	callq  *%r8
  800aa3:	e9 c1 02 00 00       	jmpq   800d69 <vprintfmt+0x509>
  800aa8:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800aac:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ab0:	4c 89 e1             	mov    %r12,%rcx
  800ab3:	48 ba 2a 4b 80 00 00 	movabs $0x804b2a,%rdx
  800aba:	00 00 00 
  800abd:	48 89 c7             	mov    %rax,%rdi
  800ac0:	b8 00 00 00 00       	mov    $0x0,%eax
  800ac5:	49 b8 78 0d 80 00 00 	movabs $0x800d78,%r8
  800acc:	00 00 00 
  800acf:	41 ff d0             	callq  *%r8
  800ad2:	e9 92 02 00 00       	jmpq   800d69 <vprintfmt+0x509>
  800ad7:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800ada:	83 f8 30             	cmp    $0x30,%eax
  800add:	73 17                	jae    800af6 <vprintfmt+0x296>
  800adf:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800ae3:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800ae6:	89 c0                	mov    %eax,%eax
  800ae8:	48 01 d0             	add    %rdx,%rax
  800aeb:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800aee:	83 c2 08             	add    $0x8,%edx
  800af1:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800af4:	eb 0f                	jmp    800b05 <vprintfmt+0x2a5>
  800af6:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800afa:	48 89 d0             	mov    %rdx,%rax
  800afd:	48 83 c2 08          	add    $0x8,%rdx
  800b01:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800b05:	4c 8b 20             	mov    (%rax),%r12
  800b08:	4d 85 e4             	test   %r12,%r12
  800b0b:	75 0a                	jne    800b17 <vprintfmt+0x2b7>
  800b0d:	49 bc 2d 4b 80 00 00 	movabs $0x804b2d,%r12
  800b14:	00 00 00 
  800b17:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800b1b:	7e 3f                	jle    800b5c <vprintfmt+0x2fc>
  800b1d:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  800b21:	74 39                	je     800b5c <vprintfmt+0x2fc>
  800b23:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800b26:	48 98                	cltq   
  800b28:	48 89 c6             	mov    %rax,%rsi
  800b2b:	4c 89 e7             	mov    %r12,%rdi
  800b2e:	48 b8 24 10 80 00 00 	movabs $0x801024,%rax
  800b35:	00 00 00 
  800b38:	ff d0                	callq  *%rax
  800b3a:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800b3d:	eb 17                	jmp    800b56 <vprintfmt+0x2f6>
  800b3f:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800b43:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800b47:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b4b:	48 89 ce             	mov    %rcx,%rsi
  800b4e:	89 d7                	mov    %edx,%edi
  800b50:	ff d0                	callq  *%rax
  800b52:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800b56:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800b5a:	7f e3                	jg     800b3f <vprintfmt+0x2df>
  800b5c:	eb 37                	jmp    800b95 <vprintfmt+0x335>
  800b5e:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  800b62:	74 1e                	je     800b82 <vprintfmt+0x322>
  800b64:	83 fb 1f             	cmp    $0x1f,%ebx
  800b67:	7e 05                	jle    800b6e <vprintfmt+0x30e>
  800b69:	83 fb 7e             	cmp    $0x7e,%ebx
  800b6c:	7e 14                	jle    800b82 <vprintfmt+0x322>
  800b6e:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800b72:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b76:	48 89 d6             	mov    %rdx,%rsi
  800b79:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800b7e:	ff d0                	callq  *%rax
  800b80:	eb 0f                	jmp    800b91 <vprintfmt+0x331>
  800b82:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800b86:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b8a:	48 89 d6             	mov    %rdx,%rsi
  800b8d:	89 df                	mov    %ebx,%edi
  800b8f:	ff d0                	callq  *%rax
  800b91:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800b95:	4c 89 e0             	mov    %r12,%rax
  800b98:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800b9c:	0f b6 00             	movzbl (%rax),%eax
  800b9f:	0f be d8             	movsbl %al,%ebx
  800ba2:	85 db                	test   %ebx,%ebx
  800ba4:	74 10                	je     800bb6 <vprintfmt+0x356>
  800ba6:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800baa:	78 b2                	js     800b5e <vprintfmt+0x2fe>
  800bac:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800bb0:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800bb4:	79 a8                	jns    800b5e <vprintfmt+0x2fe>
  800bb6:	eb 16                	jmp    800bce <vprintfmt+0x36e>
  800bb8:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800bbc:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800bc0:	48 89 d6             	mov    %rdx,%rsi
  800bc3:	bf 20 00 00 00       	mov    $0x20,%edi
  800bc8:	ff d0                	callq  *%rax
  800bca:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800bce:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800bd2:	7f e4                	jg     800bb8 <vprintfmt+0x358>
  800bd4:	e9 90 01 00 00       	jmpq   800d69 <vprintfmt+0x509>
  800bd9:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800bdd:	be 03 00 00 00       	mov    $0x3,%esi
  800be2:	48 89 c7             	mov    %rax,%rdi
  800be5:	48 b8 50 07 80 00 00 	movabs $0x800750,%rax
  800bec:	00 00 00 
  800bef:	ff d0                	callq  *%rax
  800bf1:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800bf5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800bf9:	48 85 c0             	test   %rax,%rax
  800bfc:	79 1d                	jns    800c1b <vprintfmt+0x3bb>
  800bfe:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c02:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c06:	48 89 d6             	mov    %rdx,%rsi
  800c09:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800c0e:	ff d0                	callq  *%rax
  800c10:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c14:	48 f7 d8             	neg    %rax
  800c17:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800c1b:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800c22:	e9 d5 00 00 00       	jmpq   800cfc <vprintfmt+0x49c>
  800c27:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800c2b:	be 03 00 00 00       	mov    $0x3,%esi
  800c30:	48 89 c7             	mov    %rax,%rdi
  800c33:	48 b8 40 06 80 00 00 	movabs $0x800640,%rax
  800c3a:	00 00 00 
  800c3d:	ff d0                	callq  *%rax
  800c3f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800c43:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800c4a:	e9 ad 00 00 00       	jmpq   800cfc <vprintfmt+0x49c>
  800c4f:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800c53:	be 03 00 00 00       	mov    $0x3,%esi
  800c58:	48 89 c7             	mov    %rax,%rdi
  800c5b:	48 b8 40 06 80 00 00 	movabs $0x800640,%rax
  800c62:	00 00 00 
  800c65:	ff d0                	callq  *%rax
  800c67:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800c6b:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800c72:	e9 85 00 00 00       	jmpq   800cfc <vprintfmt+0x49c>
  800c77:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c7b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c7f:	48 89 d6             	mov    %rdx,%rsi
  800c82:	bf 30 00 00 00       	mov    $0x30,%edi
  800c87:	ff d0                	callq  *%rax
  800c89:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c8d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c91:	48 89 d6             	mov    %rdx,%rsi
  800c94:	bf 78 00 00 00       	mov    $0x78,%edi
  800c99:	ff d0                	callq  *%rax
  800c9b:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800c9e:	83 f8 30             	cmp    $0x30,%eax
  800ca1:	73 17                	jae    800cba <vprintfmt+0x45a>
  800ca3:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800ca7:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800caa:	89 c0                	mov    %eax,%eax
  800cac:	48 01 d0             	add    %rdx,%rax
  800caf:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800cb2:	83 c2 08             	add    $0x8,%edx
  800cb5:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800cb8:	eb 0f                	jmp    800cc9 <vprintfmt+0x469>
  800cba:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800cbe:	48 89 d0             	mov    %rdx,%rax
  800cc1:	48 83 c2 08          	add    $0x8,%rdx
  800cc5:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800cc9:	48 8b 00             	mov    (%rax),%rax
  800ccc:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800cd0:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800cd7:	eb 23                	jmp    800cfc <vprintfmt+0x49c>
  800cd9:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800cdd:	be 03 00 00 00       	mov    $0x3,%esi
  800ce2:	48 89 c7             	mov    %rax,%rdi
  800ce5:	48 b8 40 06 80 00 00 	movabs $0x800640,%rax
  800cec:	00 00 00 
  800cef:	ff d0                	callq  *%rax
  800cf1:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800cf5:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800cfc:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  800d01:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800d04:	8b 7d dc             	mov    -0x24(%rbp),%edi
  800d07:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800d0b:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800d0f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d13:	45 89 c1             	mov    %r8d,%r9d
  800d16:	41 89 f8             	mov    %edi,%r8d
  800d19:	48 89 c7             	mov    %rax,%rdi
  800d1c:	48 b8 85 05 80 00 00 	movabs $0x800585,%rax
  800d23:	00 00 00 
  800d26:	ff d0                	callq  *%rax
  800d28:	eb 3f                	jmp    800d69 <vprintfmt+0x509>
  800d2a:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d2e:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d32:	48 89 d6             	mov    %rdx,%rsi
  800d35:	89 df                	mov    %ebx,%edi
  800d37:	ff d0                	callq  *%rax
  800d39:	eb 2e                	jmp    800d69 <vprintfmt+0x509>
  800d3b:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d3f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d43:	48 89 d6             	mov    %rdx,%rsi
  800d46:	bf 25 00 00 00       	mov    $0x25,%edi
  800d4b:	ff d0                	callq  *%rax
  800d4d:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800d52:	eb 05                	jmp    800d59 <vprintfmt+0x4f9>
  800d54:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800d59:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800d5d:	48 83 e8 01          	sub    $0x1,%rax
  800d61:	0f b6 00             	movzbl (%rax),%eax
  800d64:	3c 25                	cmp    $0x25,%al
  800d66:	75 ec                	jne    800d54 <vprintfmt+0x4f4>
  800d68:	90                   	nop
  800d69:	90                   	nop
  800d6a:	e9 43 fb ff ff       	jmpq   8008b2 <vprintfmt+0x52>
  800d6f:	48 83 c4 60          	add    $0x60,%rsp
  800d73:	5b                   	pop    %rbx
  800d74:	41 5c                	pop    %r12
  800d76:	5d                   	pop    %rbp
  800d77:	c3                   	retq   

0000000000800d78 <printfmt>:
  800d78:	55                   	push   %rbp
  800d79:	48 89 e5             	mov    %rsp,%rbp
  800d7c:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  800d83:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  800d8a:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  800d91:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800d98:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800d9f:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800da6:	84 c0                	test   %al,%al
  800da8:	74 20                	je     800dca <printfmt+0x52>
  800daa:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800dae:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800db2:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800db6:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800dba:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800dbe:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800dc2:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800dc6:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800dca:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  800dd1:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  800dd8:	00 00 00 
  800ddb:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  800de2:	00 00 00 
  800de5:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800de9:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800df0:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800df7:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  800dfe:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  800e05:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800e0c:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  800e13:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  800e1a:	48 89 c7             	mov    %rax,%rdi
  800e1d:	48 b8 60 08 80 00 00 	movabs $0x800860,%rax
  800e24:	00 00 00 
  800e27:	ff d0                	callq  *%rax
  800e29:	c9                   	leaveq 
  800e2a:	c3                   	retq   

0000000000800e2b <sprintputch>:
  800e2b:	55                   	push   %rbp
  800e2c:	48 89 e5             	mov    %rsp,%rbp
  800e2f:	48 83 ec 10          	sub    $0x10,%rsp
  800e33:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800e36:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800e3a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e3e:	8b 40 10             	mov    0x10(%rax),%eax
  800e41:	8d 50 01             	lea    0x1(%rax),%edx
  800e44:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e48:	89 50 10             	mov    %edx,0x10(%rax)
  800e4b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e4f:	48 8b 10             	mov    (%rax),%rdx
  800e52:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e56:	48 8b 40 08          	mov    0x8(%rax),%rax
  800e5a:	48 39 c2             	cmp    %rax,%rdx
  800e5d:	73 17                	jae    800e76 <sprintputch+0x4b>
  800e5f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e63:	48 8b 00             	mov    (%rax),%rax
  800e66:	48 8d 48 01          	lea    0x1(%rax),%rcx
  800e6a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800e6e:	48 89 0a             	mov    %rcx,(%rdx)
  800e71:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800e74:	88 10                	mov    %dl,(%rax)
  800e76:	c9                   	leaveq 
  800e77:	c3                   	retq   

0000000000800e78 <vsnprintf>:
  800e78:	55                   	push   %rbp
  800e79:	48 89 e5             	mov    %rsp,%rbp
  800e7c:	48 83 ec 50          	sub    $0x50,%rsp
  800e80:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  800e84:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  800e87:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  800e8b:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  800e8f:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  800e93:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  800e97:	48 8b 0a             	mov    (%rdx),%rcx
  800e9a:	48 89 08             	mov    %rcx,(%rax)
  800e9d:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800ea1:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800ea5:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800ea9:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800ead:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800eb1:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  800eb5:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  800eb8:	48 98                	cltq   
  800eba:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  800ebe:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800ec2:	48 01 d0             	add    %rdx,%rax
  800ec5:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  800ec9:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800ed0:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  800ed5:	74 06                	je     800edd <vsnprintf+0x65>
  800ed7:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  800edb:	7f 07                	jg     800ee4 <vsnprintf+0x6c>
  800edd:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800ee2:	eb 2f                	jmp    800f13 <vsnprintf+0x9b>
  800ee4:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  800ee8:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  800eec:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  800ef0:	48 89 c6             	mov    %rax,%rsi
  800ef3:	48 bf 2b 0e 80 00 00 	movabs $0x800e2b,%rdi
  800efa:	00 00 00 
  800efd:	48 b8 60 08 80 00 00 	movabs $0x800860,%rax
  800f04:	00 00 00 
  800f07:	ff d0                	callq  *%rax
  800f09:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800f0d:	c6 00 00             	movb   $0x0,(%rax)
  800f10:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800f13:	c9                   	leaveq 
  800f14:	c3                   	retq   

0000000000800f15 <snprintf>:
  800f15:	55                   	push   %rbp
  800f16:	48 89 e5             	mov    %rsp,%rbp
  800f19:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  800f20:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800f27:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  800f2d:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800f34:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800f3b:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800f42:	84 c0                	test   %al,%al
  800f44:	74 20                	je     800f66 <snprintf+0x51>
  800f46:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800f4a:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800f4e:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800f52:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800f56:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800f5a:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800f5e:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800f62:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800f66:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  800f6d:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  800f74:	00 00 00 
  800f77:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800f7e:	00 00 00 
  800f81:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800f85:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800f8c:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800f93:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800f9a:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800fa1:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800fa8:	48 8b 0a             	mov    (%rdx),%rcx
  800fab:	48 89 08             	mov    %rcx,(%rax)
  800fae:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800fb2:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800fb6:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800fba:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800fbe:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  800fc5:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  800fcc:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  800fd2:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800fd9:	48 89 c7             	mov    %rax,%rdi
  800fdc:	48 b8 78 0e 80 00 00 	movabs $0x800e78,%rax
  800fe3:	00 00 00 
  800fe6:	ff d0                	callq  *%rax
  800fe8:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  800fee:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  800ff4:	c9                   	leaveq 
  800ff5:	c3                   	retq   

0000000000800ff6 <strlen>:
  800ff6:	55                   	push   %rbp
  800ff7:	48 89 e5             	mov    %rsp,%rbp
  800ffa:	48 83 ec 18          	sub    $0x18,%rsp
  800ffe:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801002:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801009:	eb 09                	jmp    801014 <strlen+0x1e>
  80100b:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80100f:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801014:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801018:	0f b6 00             	movzbl (%rax),%eax
  80101b:	84 c0                	test   %al,%al
  80101d:	75 ec                	jne    80100b <strlen+0x15>
  80101f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801022:	c9                   	leaveq 
  801023:	c3                   	retq   

0000000000801024 <strnlen>:
  801024:	55                   	push   %rbp
  801025:	48 89 e5             	mov    %rsp,%rbp
  801028:	48 83 ec 20          	sub    $0x20,%rsp
  80102c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801030:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801034:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80103b:	eb 0e                	jmp    80104b <strnlen+0x27>
  80103d:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801041:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801046:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  80104b:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  801050:	74 0b                	je     80105d <strnlen+0x39>
  801052:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801056:	0f b6 00             	movzbl (%rax),%eax
  801059:	84 c0                	test   %al,%al
  80105b:	75 e0                	jne    80103d <strnlen+0x19>
  80105d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801060:	c9                   	leaveq 
  801061:	c3                   	retq   

0000000000801062 <strcpy>:
  801062:	55                   	push   %rbp
  801063:	48 89 e5             	mov    %rsp,%rbp
  801066:	48 83 ec 20          	sub    $0x20,%rsp
  80106a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80106e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801072:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801076:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80107a:	90                   	nop
  80107b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80107f:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801083:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801087:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80108b:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  80108f:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  801093:	0f b6 12             	movzbl (%rdx),%edx
  801096:	88 10                	mov    %dl,(%rax)
  801098:	0f b6 00             	movzbl (%rax),%eax
  80109b:	84 c0                	test   %al,%al
  80109d:	75 dc                	jne    80107b <strcpy+0x19>
  80109f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010a3:	c9                   	leaveq 
  8010a4:	c3                   	retq   

00000000008010a5 <strcat>:
  8010a5:	55                   	push   %rbp
  8010a6:	48 89 e5             	mov    %rsp,%rbp
  8010a9:	48 83 ec 20          	sub    $0x20,%rsp
  8010ad:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8010b1:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8010b5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010b9:	48 89 c7             	mov    %rax,%rdi
  8010bc:	48 b8 f6 0f 80 00 00 	movabs $0x800ff6,%rax
  8010c3:	00 00 00 
  8010c6:	ff d0                	callq  *%rax
  8010c8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8010cb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8010ce:	48 63 d0             	movslq %eax,%rdx
  8010d1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010d5:	48 01 c2             	add    %rax,%rdx
  8010d8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8010dc:	48 89 c6             	mov    %rax,%rsi
  8010df:	48 89 d7             	mov    %rdx,%rdi
  8010e2:	48 b8 62 10 80 00 00 	movabs $0x801062,%rax
  8010e9:	00 00 00 
  8010ec:	ff d0                	callq  *%rax
  8010ee:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010f2:	c9                   	leaveq 
  8010f3:	c3                   	retq   

00000000008010f4 <strncpy>:
  8010f4:	55                   	push   %rbp
  8010f5:	48 89 e5             	mov    %rsp,%rbp
  8010f8:	48 83 ec 28          	sub    $0x28,%rsp
  8010fc:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801100:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801104:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801108:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80110c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801110:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  801117:	00 
  801118:	eb 2a                	jmp    801144 <strncpy+0x50>
  80111a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80111e:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801122:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801126:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80112a:	0f b6 12             	movzbl (%rdx),%edx
  80112d:	88 10                	mov    %dl,(%rax)
  80112f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801133:	0f b6 00             	movzbl (%rax),%eax
  801136:	84 c0                	test   %al,%al
  801138:	74 05                	je     80113f <strncpy+0x4b>
  80113a:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  80113f:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801144:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801148:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  80114c:	72 cc                	jb     80111a <strncpy+0x26>
  80114e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801152:	c9                   	leaveq 
  801153:	c3                   	retq   

0000000000801154 <strlcpy>:
  801154:	55                   	push   %rbp
  801155:	48 89 e5             	mov    %rsp,%rbp
  801158:	48 83 ec 28          	sub    $0x28,%rsp
  80115c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801160:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801164:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801168:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80116c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801170:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801175:	74 3d                	je     8011b4 <strlcpy+0x60>
  801177:	eb 1d                	jmp    801196 <strlcpy+0x42>
  801179:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80117d:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801181:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801185:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801189:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  80118d:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  801191:	0f b6 12             	movzbl (%rdx),%edx
  801194:	88 10                	mov    %dl,(%rax)
  801196:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  80119b:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8011a0:	74 0b                	je     8011ad <strlcpy+0x59>
  8011a2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8011a6:	0f b6 00             	movzbl (%rax),%eax
  8011a9:	84 c0                	test   %al,%al
  8011ab:	75 cc                	jne    801179 <strlcpy+0x25>
  8011ad:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011b1:	c6 00 00             	movb   $0x0,(%rax)
  8011b4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8011b8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011bc:	48 29 c2             	sub    %rax,%rdx
  8011bf:	48 89 d0             	mov    %rdx,%rax
  8011c2:	c9                   	leaveq 
  8011c3:	c3                   	retq   

00000000008011c4 <strcmp>:
  8011c4:	55                   	push   %rbp
  8011c5:	48 89 e5             	mov    %rsp,%rbp
  8011c8:	48 83 ec 10          	sub    $0x10,%rsp
  8011cc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8011d0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8011d4:	eb 0a                	jmp    8011e0 <strcmp+0x1c>
  8011d6:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8011db:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8011e0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011e4:	0f b6 00             	movzbl (%rax),%eax
  8011e7:	84 c0                	test   %al,%al
  8011e9:	74 12                	je     8011fd <strcmp+0x39>
  8011eb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011ef:	0f b6 10             	movzbl (%rax),%edx
  8011f2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8011f6:	0f b6 00             	movzbl (%rax),%eax
  8011f9:	38 c2                	cmp    %al,%dl
  8011fb:	74 d9                	je     8011d6 <strcmp+0x12>
  8011fd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801201:	0f b6 00             	movzbl (%rax),%eax
  801204:	0f b6 d0             	movzbl %al,%edx
  801207:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80120b:	0f b6 00             	movzbl (%rax),%eax
  80120e:	0f b6 c0             	movzbl %al,%eax
  801211:	29 c2                	sub    %eax,%edx
  801213:	89 d0                	mov    %edx,%eax
  801215:	c9                   	leaveq 
  801216:	c3                   	retq   

0000000000801217 <strncmp>:
  801217:	55                   	push   %rbp
  801218:	48 89 e5             	mov    %rsp,%rbp
  80121b:	48 83 ec 18          	sub    $0x18,%rsp
  80121f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801223:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801227:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80122b:	eb 0f                	jmp    80123c <strncmp+0x25>
  80122d:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  801232:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801237:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  80123c:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801241:	74 1d                	je     801260 <strncmp+0x49>
  801243:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801247:	0f b6 00             	movzbl (%rax),%eax
  80124a:	84 c0                	test   %al,%al
  80124c:	74 12                	je     801260 <strncmp+0x49>
  80124e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801252:	0f b6 10             	movzbl (%rax),%edx
  801255:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801259:	0f b6 00             	movzbl (%rax),%eax
  80125c:	38 c2                	cmp    %al,%dl
  80125e:	74 cd                	je     80122d <strncmp+0x16>
  801260:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801265:	75 07                	jne    80126e <strncmp+0x57>
  801267:	b8 00 00 00 00       	mov    $0x0,%eax
  80126c:	eb 18                	jmp    801286 <strncmp+0x6f>
  80126e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801272:	0f b6 00             	movzbl (%rax),%eax
  801275:	0f b6 d0             	movzbl %al,%edx
  801278:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80127c:	0f b6 00             	movzbl (%rax),%eax
  80127f:	0f b6 c0             	movzbl %al,%eax
  801282:	29 c2                	sub    %eax,%edx
  801284:	89 d0                	mov    %edx,%eax
  801286:	c9                   	leaveq 
  801287:	c3                   	retq   

0000000000801288 <strchr>:
  801288:	55                   	push   %rbp
  801289:	48 89 e5             	mov    %rsp,%rbp
  80128c:	48 83 ec 0c          	sub    $0xc,%rsp
  801290:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801294:	89 f0                	mov    %esi,%eax
  801296:	88 45 f4             	mov    %al,-0xc(%rbp)
  801299:	eb 17                	jmp    8012b2 <strchr+0x2a>
  80129b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80129f:	0f b6 00             	movzbl (%rax),%eax
  8012a2:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8012a5:	75 06                	jne    8012ad <strchr+0x25>
  8012a7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012ab:	eb 15                	jmp    8012c2 <strchr+0x3a>
  8012ad:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8012b2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012b6:	0f b6 00             	movzbl (%rax),%eax
  8012b9:	84 c0                	test   %al,%al
  8012bb:	75 de                	jne    80129b <strchr+0x13>
  8012bd:	b8 00 00 00 00       	mov    $0x0,%eax
  8012c2:	c9                   	leaveq 
  8012c3:	c3                   	retq   

00000000008012c4 <strfind>:
  8012c4:	55                   	push   %rbp
  8012c5:	48 89 e5             	mov    %rsp,%rbp
  8012c8:	48 83 ec 0c          	sub    $0xc,%rsp
  8012cc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8012d0:	89 f0                	mov    %esi,%eax
  8012d2:	88 45 f4             	mov    %al,-0xc(%rbp)
  8012d5:	eb 13                	jmp    8012ea <strfind+0x26>
  8012d7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012db:	0f b6 00             	movzbl (%rax),%eax
  8012de:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8012e1:	75 02                	jne    8012e5 <strfind+0x21>
  8012e3:	eb 10                	jmp    8012f5 <strfind+0x31>
  8012e5:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8012ea:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012ee:	0f b6 00             	movzbl (%rax),%eax
  8012f1:	84 c0                	test   %al,%al
  8012f3:	75 e2                	jne    8012d7 <strfind+0x13>
  8012f5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012f9:	c9                   	leaveq 
  8012fa:	c3                   	retq   

00000000008012fb <memset>:
  8012fb:	55                   	push   %rbp
  8012fc:	48 89 e5             	mov    %rsp,%rbp
  8012ff:	48 83 ec 18          	sub    $0x18,%rsp
  801303:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801307:	89 75 f4             	mov    %esi,-0xc(%rbp)
  80130a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80130e:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801313:	75 06                	jne    80131b <memset+0x20>
  801315:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801319:	eb 69                	jmp    801384 <memset+0x89>
  80131b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80131f:	83 e0 03             	and    $0x3,%eax
  801322:	48 85 c0             	test   %rax,%rax
  801325:	75 48                	jne    80136f <memset+0x74>
  801327:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80132b:	83 e0 03             	and    $0x3,%eax
  80132e:	48 85 c0             	test   %rax,%rax
  801331:	75 3c                	jne    80136f <memset+0x74>
  801333:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  80133a:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80133d:	c1 e0 18             	shl    $0x18,%eax
  801340:	89 c2                	mov    %eax,%edx
  801342:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801345:	c1 e0 10             	shl    $0x10,%eax
  801348:	09 c2                	or     %eax,%edx
  80134a:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80134d:	c1 e0 08             	shl    $0x8,%eax
  801350:	09 d0                	or     %edx,%eax
  801352:	09 45 f4             	or     %eax,-0xc(%rbp)
  801355:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801359:	48 c1 e8 02          	shr    $0x2,%rax
  80135d:	48 89 c1             	mov    %rax,%rcx
  801360:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801364:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801367:	48 89 d7             	mov    %rdx,%rdi
  80136a:	fc                   	cld    
  80136b:	f3 ab                	rep stos %eax,%es:(%rdi)
  80136d:	eb 11                	jmp    801380 <memset+0x85>
  80136f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801373:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801376:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80137a:	48 89 d7             	mov    %rdx,%rdi
  80137d:	fc                   	cld    
  80137e:	f3 aa                	rep stos %al,%es:(%rdi)
  801380:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801384:	c9                   	leaveq 
  801385:	c3                   	retq   

0000000000801386 <memmove>:
  801386:	55                   	push   %rbp
  801387:	48 89 e5             	mov    %rsp,%rbp
  80138a:	48 83 ec 28          	sub    $0x28,%rsp
  80138e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801392:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801396:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80139a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80139e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8013a2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013a6:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8013aa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013ae:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8013b2:	0f 83 88 00 00 00    	jae    801440 <memmove+0xba>
  8013b8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8013bc:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8013c0:	48 01 d0             	add    %rdx,%rax
  8013c3:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8013c7:	76 77                	jbe    801440 <memmove+0xba>
  8013c9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8013cd:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  8013d1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8013d5:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  8013d9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013dd:	83 e0 03             	and    $0x3,%eax
  8013e0:	48 85 c0             	test   %rax,%rax
  8013e3:	75 3b                	jne    801420 <memmove+0x9a>
  8013e5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8013e9:	83 e0 03             	and    $0x3,%eax
  8013ec:	48 85 c0             	test   %rax,%rax
  8013ef:	75 2f                	jne    801420 <memmove+0x9a>
  8013f1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8013f5:	83 e0 03             	and    $0x3,%eax
  8013f8:	48 85 c0             	test   %rax,%rax
  8013fb:	75 23                	jne    801420 <memmove+0x9a>
  8013fd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801401:	48 83 e8 04          	sub    $0x4,%rax
  801405:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801409:	48 83 ea 04          	sub    $0x4,%rdx
  80140d:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801411:	48 c1 e9 02          	shr    $0x2,%rcx
  801415:	48 89 c7             	mov    %rax,%rdi
  801418:	48 89 d6             	mov    %rdx,%rsi
  80141b:	fd                   	std    
  80141c:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  80141e:	eb 1d                	jmp    80143d <memmove+0xb7>
  801420:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801424:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801428:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80142c:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  801430:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801434:	48 89 d7             	mov    %rdx,%rdi
  801437:	48 89 c1             	mov    %rax,%rcx
  80143a:	fd                   	std    
  80143b:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  80143d:	fc                   	cld    
  80143e:	eb 57                	jmp    801497 <memmove+0x111>
  801440:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801444:	83 e0 03             	and    $0x3,%eax
  801447:	48 85 c0             	test   %rax,%rax
  80144a:	75 36                	jne    801482 <memmove+0xfc>
  80144c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801450:	83 e0 03             	and    $0x3,%eax
  801453:	48 85 c0             	test   %rax,%rax
  801456:	75 2a                	jne    801482 <memmove+0xfc>
  801458:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80145c:	83 e0 03             	and    $0x3,%eax
  80145f:	48 85 c0             	test   %rax,%rax
  801462:	75 1e                	jne    801482 <memmove+0xfc>
  801464:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801468:	48 c1 e8 02          	shr    $0x2,%rax
  80146c:	48 89 c1             	mov    %rax,%rcx
  80146f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801473:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801477:	48 89 c7             	mov    %rax,%rdi
  80147a:	48 89 d6             	mov    %rdx,%rsi
  80147d:	fc                   	cld    
  80147e:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801480:	eb 15                	jmp    801497 <memmove+0x111>
  801482:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801486:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80148a:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  80148e:	48 89 c7             	mov    %rax,%rdi
  801491:	48 89 d6             	mov    %rdx,%rsi
  801494:	fc                   	cld    
  801495:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801497:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80149b:	c9                   	leaveq 
  80149c:	c3                   	retq   

000000000080149d <memcpy>:
  80149d:	55                   	push   %rbp
  80149e:	48 89 e5             	mov    %rsp,%rbp
  8014a1:	48 83 ec 18          	sub    $0x18,%rsp
  8014a5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8014a9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8014ad:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8014b1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8014b5:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8014b9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014bd:	48 89 ce             	mov    %rcx,%rsi
  8014c0:	48 89 c7             	mov    %rax,%rdi
  8014c3:	48 b8 86 13 80 00 00 	movabs $0x801386,%rax
  8014ca:	00 00 00 
  8014cd:	ff d0                	callq  *%rax
  8014cf:	c9                   	leaveq 
  8014d0:	c3                   	retq   

00000000008014d1 <memcmp>:
  8014d1:	55                   	push   %rbp
  8014d2:	48 89 e5             	mov    %rsp,%rbp
  8014d5:	48 83 ec 28          	sub    $0x28,%rsp
  8014d9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8014dd:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8014e1:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8014e5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014e9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8014ed:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8014f1:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8014f5:	eb 36                	jmp    80152d <memcmp+0x5c>
  8014f7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014fb:	0f b6 10             	movzbl (%rax),%edx
  8014fe:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801502:	0f b6 00             	movzbl (%rax),%eax
  801505:	38 c2                	cmp    %al,%dl
  801507:	74 1a                	je     801523 <memcmp+0x52>
  801509:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80150d:	0f b6 00             	movzbl (%rax),%eax
  801510:	0f b6 d0             	movzbl %al,%edx
  801513:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801517:	0f b6 00             	movzbl (%rax),%eax
  80151a:	0f b6 c0             	movzbl %al,%eax
  80151d:	29 c2                	sub    %eax,%edx
  80151f:	89 d0                	mov    %edx,%eax
  801521:	eb 20                	jmp    801543 <memcmp+0x72>
  801523:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801528:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  80152d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801531:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801535:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801539:	48 85 c0             	test   %rax,%rax
  80153c:	75 b9                	jne    8014f7 <memcmp+0x26>
  80153e:	b8 00 00 00 00       	mov    $0x0,%eax
  801543:	c9                   	leaveq 
  801544:	c3                   	retq   

0000000000801545 <memfind>:
  801545:	55                   	push   %rbp
  801546:	48 89 e5             	mov    %rsp,%rbp
  801549:	48 83 ec 28          	sub    $0x28,%rsp
  80154d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801551:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  801554:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801558:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80155c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801560:	48 01 d0             	add    %rdx,%rax
  801563:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801567:	eb 15                	jmp    80157e <memfind+0x39>
  801569:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80156d:	0f b6 10             	movzbl (%rax),%edx
  801570:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801573:	38 c2                	cmp    %al,%dl
  801575:	75 02                	jne    801579 <memfind+0x34>
  801577:	eb 0f                	jmp    801588 <memfind+0x43>
  801579:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80157e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801582:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  801586:	72 e1                	jb     801569 <memfind+0x24>
  801588:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80158c:	c9                   	leaveq 
  80158d:	c3                   	retq   

000000000080158e <strtol>:
  80158e:	55                   	push   %rbp
  80158f:	48 89 e5             	mov    %rsp,%rbp
  801592:	48 83 ec 34          	sub    $0x34,%rsp
  801596:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80159a:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80159e:	89 55 cc             	mov    %edx,-0x34(%rbp)
  8015a1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8015a8:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  8015af:	00 
  8015b0:	eb 05                	jmp    8015b7 <strtol+0x29>
  8015b2:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8015b7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015bb:	0f b6 00             	movzbl (%rax),%eax
  8015be:	3c 20                	cmp    $0x20,%al
  8015c0:	74 f0                	je     8015b2 <strtol+0x24>
  8015c2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015c6:	0f b6 00             	movzbl (%rax),%eax
  8015c9:	3c 09                	cmp    $0x9,%al
  8015cb:	74 e5                	je     8015b2 <strtol+0x24>
  8015cd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015d1:	0f b6 00             	movzbl (%rax),%eax
  8015d4:	3c 2b                	cmp    $0x2b,%al
  8015d6:	75 07                	jne    8015df <strtol+0x51>
  8015d8:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8015dd:	eb 17                	jmp    8015f6 <strtol+0x68>
  8015df:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015e3:	0f b6 00             	movzbl (%rax),%eax
  8015e6:	3c 2d                	cmp    $0x2d,%al
  8015e8:	75 0c                	jne    8015f6 <strtol+0x68>
  8015ea:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8015ef:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  8015f6:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8015fa:	74 06                	je     801602 <strtol+0x74>
  8015fc:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  801600:	75 28                	jne    80162a <strtol+0x9c>
  801602:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801606:	0f b6 00             	movzbl (%rax),%eax
  801609:	3c 30                	cmp    $0x30,%al
  80160b:	75 1d                	jne    80162a <strtol+0x9c>
  80160d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801611:	48 83 c0 01          	add    $0x1,%rax
  801615:	0f b6 00             	movzbl (%rax),%eax
  801618:	3c 78                	cmp    $0x78,%al
  80161a:	75 0e                	jne    80162a <strtol+0x9c>
  80161c:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  801621:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  801628:	eb 2c                	jmp    801656 <strtol+0xc8>
  80162a:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  80162e:	75 19                	jne    801649 <strtol+0xbb>
  801630:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801634:	0f b6 00             	movzbl (%rax),%eax
  801637:	3c 30                	cmp    $0x30,%al
  801639:	75 0e                	jne    801649 <strtol+0xbb>
  80163b:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801640:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  801647:	eb 0d                	jmp    801656 <strtol+0xc8>
  801649:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  80164d:	75 07                	jne    801656 <strtol+0xc8>
  80164f:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  801656:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80165a:	0f b6 00             	movzbl (%rax),%eax
  80165d:	3c 2f                	cmp    $0x2f,%al
  80165f:	7e 1d                	jle    80167e <strtol+0xf0>
  801661:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801665:	0f b6 00             	movzbl (%rax),%eax
  801668:	3c 39                	cmp    $0x39,%al
  80166a:	7f 12                	jg     80167e <strtol+0xf0>
  80166c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801670:	0f b6 00             	movzbl (%rax),%eax
  801673:	0f be c0             	movsbl %al,%eax
  801676:	83 e8 30             	sub    $0x30,%eax
  801679:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80167c:	eb 4e                	jmp    8016cc <strtol+0x13e>
  80167e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801682:	0f b6 00             	movzbl (%rax),%eax
  801685:	3c 60                	cmp    $0x60,%al
  801687:	7e 1d                	jle    8016a6 <strtol+0x118>
  801689:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80168d:	0f b6 00             	movzbl (%rax),%eax
  801690:	3c 7a                	cmp    $0x7a,%al
  801692:	7f 12                	jg     8016a6 <strtol+0x118>
  801694:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801698:	0f b6 00             	movzbl (%rax),%eax
  80169b:	0f be c0             	movsbl %al,%eax
  80169e:	83 e8 57             	sub    $0x57,%eax
  8016a1:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8016a4:	eb 26                	jmp    8016cc <strtol+0x13e>
  8016a6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016aa:	0f b6 00             	movzbl (%rax),%eax
  8016ad:	3c 40                	cmp    $0x40,%al
  8016af:	7e 48                	jle    8016f9 <strtol+0x16b>
  8016b1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016b5:	0f b6 00             	movzbl (%rax),%eax
  8016b8:	3c 5a                	cmp    $0x5a,%al
  8016ba:	7f 3d                	jg     8016f9 <strtol+0x16b>
  8016bc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016c0:	0f b6 00             	movzbl (%rax),%eax
  8016c3:	0f be c0             	movsbl %al,%eax
  8016c6:	83 e8 37             	sub    $0x37,%eax
  8016c9:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8016cc:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8016cf:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  8016d2:	7c 02                	jl     8016d6 <strtol+0x148>
  8016d4:	eb 23                	jmp    8016f9 <strtol+0x16b>
  8016d6:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8016db:	8b 45 cc             	mov    -0x34(%rbp),%eax
  8016de:	48 98                	cltq   
  8016e0:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  8016e5:	48 89 c2             	mov    %rax,%rdx
  8016e8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8016eb:	48 98                	cltq   
  8016ed:	48 01 d0             	add    %rdx,%rax
  8016f0:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8016f4:	e9 5d ff ff ff       	jmpq   801656 <strtol+0xc8>
  8016f9:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  8016fe:	74 0b                	je     80170b <strtol+0x17d>
  801700:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801704:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801708:	48 89 10             	mov    %rdx,(%rax)
  80170b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80170f:	74 09                	je     80171a <strtol+0x18c>
  801711:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801715:	48 f7 d8             	neg    %rax
  801718:	eb 04                	jmp    80171e <strtol+0x190>
  80171a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80171e:	c9                   	leaveq 
  80171f:	c3                   	retq   

0000000000801720 <strstr>:
  801720:	55                   	push   %rbp
  801721:	48 89 e5             	mov    %rsp,%rbp
  801724:	48 83 ec 30          	sub    $0x30,%rsp
  801728:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80172c:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801730:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801734:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801738:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  80173c:	0f b6 00             	movzbl (%rax),%eax
  80173f:	88 45 ff             	mov    %al,-0x1(%rbp)
  801742:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  801746:	75 06                	jne    80174e <strstr+0x2e>
  801748:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80174c:	eb 6b                	jmp    8017b9 <strstr+0x99>
  80174e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801752:	48 89 c7             	mov    %rax,%rdi
  801755:	48 b8 f6 0f 80 00 00 	movabs $0x800ff6,%rax
  80175c:	00 00 00 
  80175f:	ff d0                	callq  *%rax
  801761:	48 98                	cltq   
  801763:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801767:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80176b:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80176f:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801773:	0f b6 00             	movzbl (%rax),%eax
  801776:	88 45 ef             	mov    %al,-0x11(%rbp)
  801779:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  80177d:	75 07                	jne    801786 <strstr+0x66>
  80177f:	b8 00 00 00 00       	mov    $0x0,%eax
  801784:	eb 33                	jmp    8017b9 <strstr+0x99>
  801786:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  80178a:	3a 45 ff             	cmp    -0x1(%rbp),%al
  80178d:	75 d8                	jne    801767 <strstr+0x47>
  80178f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801793:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  801797:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80179b:	48 89 ce             	mov    %rcx,%rsi
  80179e:	48 89 c7             	mov    %rax,%rdi
  8017a1:	48 b8 17 12 80 00 00 	movabs $0x801217,%rax
  8017a8:	00 00 00 
  8017ab:	ff d0                	callq  *%rax
  8017ad:	85 c0                	test   %eax,%eax
  8017af:	75 b6                	jne    801767 <strstr+0x47>
  8017b1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017b5:	48 83 e8 01          	sub    $0x1,%rax
  8017b9:	c9                   	leaveq 
  8017ba:	c3                   	retq   

00000000008017bb <syscall>:
  8017bb:	55                   	push   %rbp
  8017bc:	48 89 e5             	mov    %rsp,%rbp
  8017bf:	53                   	push   %rbx
  8017c0:	48 83 ec 48          	sub    $0x48,%rsp
  8017c4:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8017c7:	89 75 d8             	mov    %esi,-0x28(%rbp)
  8017ca:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  8017ce:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  8017d2:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  8017d6:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  8017da:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8017dd:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  8017e1:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  8017e5:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  8017e9:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  8017ed:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  8017f1:	4c 89 c3             	mov    %r8,%rbx
  8017f4:	cd 30                	int    $0x30
  8017f6:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8017fa:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  8017fe:	74 3e                	je     80183e <syscall+0x83>
  801800:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801805:	7e 37                	jle    80183e <syscall+0x83>
  801807:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80180b:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80180e:	49 89 d0             	mov    %rdx,%r8
  801811:	89 c1                	mov    %eax,%ecx
  801813:	48 ba e8 4d 80 00 00 	movabs $0x804de8,%rdx
  80181a:	00 00 00 
  80181d:	be 24 00 00 00       	mov    $0x24,%esi
  801822:	48 bf 05 4e 80 00 00 	movabs $0x804e05,%rdi
  801829:	00 00 00 
  80182c:	b8 00 00 00 00       	mov    $0x0,%eax
  801831:	49 b9 74 02 80 00 00 	movabs $0x800274,%r9
  801838:	00 00 00 
  80183b:	41 ff d1             	callq  *%r9
  80183e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801842:	48 83 c4 48          	add    $0x48,%rsp
  801846:	5b                   	pop    %rbx
  801847:	5d                   	pop    %rbp
  801848:	c3                   	retq   

0000000000801849 <sys_cputs>:
  801849:	55                   	push   %rbp
  80184a:	48 89 e5             	mov    %rsp,%rbp
  80184d:	48 83 ec 20          	sub    $0x20,%rsp
  801851:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801855:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801859:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80185d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801861:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801868:	00 
  801869:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80186f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801875:	48 89 d1             	mov    %rdx,%rcx
  801878:	48 89 c2             	mov    %rax,%rdx
  80187b:	be 00 00 00 00       	mov    $0x0,%esi
  801880:	bf 00 00 00 00       	mov    $0x0,%edi
  801885:	48 b8 bb 17 80 00 00 	movabs $0x8017bb,%rax
  80188c:	00 00 00 
  80188f:	ff d0                	callq  *%rax
  801891:	c9                   	leaveq 
  801892:	c3                   	retq   

0000000000801893 <sys_cgetc>:
  801893:	55                   	push   %rbp
  801894:	48 89 e5             	mov    %rsp,%rbp
  801897:	48 83 ec 10          	sub    $0x10,%rsp
  80189b:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8018a2:	00 
  8018a3:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8018a9:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8018af:	b9 00 00 00 00       	mov    $0x0,%ecx
  8018b4:	ba 00 00 00 00       	mov    $0x0,%edx
  8018b9:	be 00 00 00 00       	mov    $0x0,%esi
  8018be:	bf 01 00 00 00       	mov    $0x1,%edi
  8018c3:	48 b8 bb 17 80 00 00 	movabs $0x8017bb,%rax
  8018ca:	00 00 00 
  8018cd:	ff d0                	callq  *%rax
  8018cf:	c9                   	leaveq 
  8018d0:	c3                   	retq   

00000000008018d1 <sys_env_destroy>:
  8018d1:	55                   	push   %rbp
  8018d2:	48 89 e5             	mov    %rsp,%rbp
  8018d5:	48 83 ec 10          	sub    $0x10,%rsp
  8018d9:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8018dc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8018df:	48 98                	cltq   
  8018e1:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8018e8:	00 
  8018e9:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8018ef:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8018f5:	b9 00 00 00 00       	mov    $0x0,%ecx
  8018fa:	48 89 c2             	mov    %rax,%rdx
  8018fd:	be 01 00 00 00       	mov    $0x1,%esi
  801902:	bf 03 00 00 00       	mov    $0x3,%edi
  801907:	48 b8 bb 17 80 00 00 	movabs $0x8017bb,%rax
  80190e:	00 00 00 
  801911:	ff d0                	callq  *%rax
  801913:	c9                   	leaveq 
  801914:	c3                   	retq   

0000000000801915 <sys_getenvid>:
  801915:	55                   	push   %rbp
  801916:	48 89 e5             	mov    %rsp,%rbp
  801919:	48 83 ec 10          	sub    $0x10,%rsp
  80191d:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801924:	00 
  801925:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80192b:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801931:	b9 00 00 00 00       	mov    $0x0,%ecx
  801936:	ba 00 00 00 00       	mov    $0x0,%edx
  80193b:	be 00 00 00 00       	mov    $0x0,%esi
  801940:	bf 02 00 00 00       	mov    $0x2,%edi
  801945:	48 b8 bb 17 80 00 00 	movabs $0x8017bb,%rax
  80194c:	00 00 00 
  80194f:	ff d0                	callq  *%rax
  801951:	c9                   	leaveq 
  801952:	c3                   	retq   

0000000000801953 <sys_yield>:
  801953:	55                   	push   %rbp
  801954:	48 89 e5             	mov    %rsp,%rbp
  801957:	48 83 ec 10          	sub    $0x10,%rsp
  80195b:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801962:	00 
  801963:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801969:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80196f:	b9 00 00 00 00       	mov    $0x0,%ecx
  801974:	ba 00 00 00 00       	mov    $0x0,%edx
  801979:	be 00 00 00 00       	mov    $0x0,%esi
  80197e:	bf 0b 00 00 00       	mov    $0xb,%edi
  801983:	48 b8 bb 17 80 00 00 	movabs $0x8017bb,%rax
  80198a:	00 00 00 
  80198d:	ff d0                	callq  *%rax
  80198f:	c9                   	leaveq 
  801990:	c3                   	retq   

0000000000801991 <sys_page_alloc>:
  801991:	55                   	push   %rbp
  801992:	48 89 e5             	mov    %rsp,%rbp
  801995:	48 83 ec 20          	sub    $0x20,%rsp
  801999:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80199c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8019a0:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8019a3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8019a6:	48 63 c8             	movslq %eax,%rcx
  8019a9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8019ad:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8019b0:	48 98                	cltq   
  8019b2:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8019b9:	00 
  8019ba:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8019c0:	49 89 c8             	mov    %rcx,%r8
  8019c3:	48 89 d1             	mov    %rdx,%rcx
  8019c6:	48 89 c2             	mov    %rax,%rdx
  8019c9:	be 01 00 00 00       	mov    $0x1,%esi
  8019ce:	bf 04 00 00 00       	mov    $0x4,%edi
  8019d3:	48 b8 bb 17 80 00 00 	movabs $0x8017bb,%rax
  8019da:	00 00 00 
  8019dd:	ff d0                	callq  *%rax
  8019df:	c9                   	leaveq 
  8019e0:	c3                   	retq   

00000000008019e1 <sys_page_map>:
  8019e1:	55                   	push   %rbp
  8019e2:	48 89 e5             	mov    %rsp,%rbp
  8019e5:	48 83 ec 30          	sub    $0x30,%rsp
  8019e9:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8019ec:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8019f0:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8019f3:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  8019f7:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  8019fb:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8019fe:	48 63 c8             	movslq %eax,%rcx
  801a01:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801a05:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801a08:	48 63 f0             	movslq %eax,%rsi
  801a0b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801a0f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a12:	48 98                	cltq   
  801a14:	48 89 0c 24          	mov    %rcx,(%rsp)
  801a18:	49 89 f9             	mov    %rdi,%r9
  801a1b:	49 89 f0             	mov    %rsi,%r8
  801a1e:	48 89 d1             	mov    %rdx,%rcx
  801a21:	48 89 c2             	mov    %rax,%rdx
  801a24:	be 01 00 00 00       	mov    $0x1,%esi
  801a29:	bf 05 00 00 00       	mov    $0x5,%edi
  801a2e:	48 b8 bb 17 80 00 00 	movabs $0x8017bb,%rax
  801a35:	00 00 00 
  801a38:	ff d0                	callq  *%rax
  801a3a:	c9                   	leaveq 
  801a3b:	c3                   	retq   

0000000000801a3c <sys_page_unmap>:
  801a3c:	55                   	push   %rbp
  801a3d:	48 89 e5             	mov    %rsp,%rbp
  801a40:	48 83 ec 20          	sub    $0x20,%rsp
  801a44:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a47:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a4b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801a4f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a52:	48 98                	cltq   
  801a54:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801a5b:	00 
  801a5c:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a62:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a68:	48 89 d1             	mov    %rdx,%rcx
  801a6b:	48 89 c2             	mov    %rax,%rdx
  801a6e:	be 01 00 00 00       	mov    $0x1,%esi
  801a73:	bf 06 00 00 00       	mov    $0x6,%edi
  801a78:	48 b8 bb 17 80 00 00 	movabs $0x8017bb,%rax
  801a7f:	00 00 00 
  801a82:	ff d0                	callq  *%rax
  801a84:	c9                   	leaveq 
  801a85:	c3                   	retq   

0000000000801a86 <sys_env_set_status>:
  801a86:	55                   	push   %rbp
  801a87:	48 89 e5             	mov    %rsp,%rbp
  801a8a:	48 83 ec 10          	sub    $0x10,%rsp
  801a8e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a91:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801a94:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801a97:	48 63 d0             	movslq %eax,%rdx
  801a9a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a9d:	48 98                	cltq   
  801a9f:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801aa6:	00 
  801aa7:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801aad:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ab3:	48 89 d1             	mov    %rdx,%rcx
  801ab6:	48 89 c2             	mov    %rax,%rdx
  801ab9:	be 01 00 00 00       	mov    $0x1,%esi
  801abe:	bf 08 00 00 00       	mov    $0x8,%edi
  801ac3:	48 b8 bb 17 80 00 00 	movabs $0x8017bb,%rax
  801aca:	00 00 00 
  801acd:	ff d0                	callq  *%rax
  801acf:	c9                   	leaveq 
  801ad0:	c3                   	retq   

0000000000801ad1 <sys_env_set_trapframe>:
  801ad1:	55                   	push   %rbp
  801ad2:	48 89 e5             	mov    %rsp,%rbp
  801ad5:	48 83 ec 20          	sub    $0x20,%rsp
  801ad9:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801adc:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801ae0:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801ae4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ae7:	48 98                	cltq   
  801ae9:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801af0:	00 
  801af1:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801af7:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801afd:	48 89 d1             	mov    %rdx,%rcx
  801b00:	48 89 c2             	mov    %rax,%rdx
  801b03:	be 01 00 00 00       	mov    $0x1,%esi
  801b08:	bf 09 00 00 00       	mov    $0x9,%edi
  801b0d:	48 b8 bb 17 80 00 00 	movabs $0x8017bb,%rax
  801b14:	00 00 00 
  801b17:	ff d0                	callq  *%rax
  801b19:	c9                   	leaveq 
  801b1a:	c3                   	retq   

0000000000801b1b <sys_env_set_pgfault_upcall>:
  801b1b:	55                   	push   %rbp
  801b1c:	48 89 e5             	mov    %rsp,%rbp
  801b1f:	48 83 ec 20          	sub    $0x20,%rsp
  801b23:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b26:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b2a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b2e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b31:	48 98                	cltq   
  801b33:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801b3a:	00 
  801b3b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b41:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b47:	48 89 d1             	mov    %rdx,%rcx
  801b4a:	48 89 c2             	mov    %rax,%rdx
  801b4d:	be 01 00 00 00       	mov    $0x1,%esi
  801b52:	bf 0a 00 00 00       	mov    $0xa,%edi
  801b57:	48 b8 bb 17 80 00 00 	movabs $0x8017bb,%rax
  801b5e:	00 00 00 
  801b61:	ff d0                	callq  *%rax
  801b63:	c9                   	leaveq 
  801b64:	c3                   	retq   

0000000000801b65 <sys_ipc_try_send>:
  801b65:	55                   	push   %rbp
  801b66:	48 89 e5             	mov    %rsp,%rbp
  801b69:	48 83 ec 20          	sub    $0x20,%rsp
  801b6d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b70:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b74:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801b78:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801b7b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801b7e:	48 63 f0             	movslq %eax,%rsi
  801b81:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801b85:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b88:	48 98                	cltq   
  801b8a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b8e:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801b95:	00 
  801b96:	49 89 f1             	mov    %rsi,%r9
  801b99:	49 89 c8             	mov    %rcx,%r8
  801b9c:	48 89 d1             	mov    %rdx,%rcx
  801b9f:	48 89 c2             	mov    %rax,%rdx
  801ba2:	be 00 00 00 00       	mov    $0x0,%esi
  801ba7:	bf 0c 00 00 00       	mov    $0xc,%edi
  801bac:	48 b8 bb 17 80 00 00 	movabs $0x8017bb,%rax
  801bb3:	00 00 00 
  801bb6:	ff d0                	callq  *%rax
  801bb8:	c9                   	leaveq 
  801bb9:	c3                   	retq   

0000000000801bba <sys_ipc_recv>:
  801bba:	55                   	push   %rbp
  801bbb:	48 89 e5             	mov    %rsp,%rbp
  801bbe:	48 83 ec 10          	sub    $0x10,%rsp
  801bc2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801bc6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801bca:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801bd1:	00 
  801bd2:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801bd8:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801bde:	b9 00 00 00 00       	mov    $0x0,%ecx
  801be3:	48 89 c2             	mov    %rax,%rdx
  801be6:	be 01 00 00 00       	mov    $0x1,%esi
  801beb:	bf 0d 00 00 00       	mov    $0xd,%edi
  801bf0:	48 b8 bb 17 80 00 00 	movabs $0x8017bb,%rax
  801bf7:	00 00 00 
  801bfa:	ff d0                	callq  *%rax
  801bfc:	c9                   	leaveq 
  801bfd:	c3                   	retq   

0000000000801bfe <sys_time_msec>:
  801bfe:	55                   	push   %rbp
  801bff:	48 89 e5             	mov    %rsp,%rbp
  801c02:	48 83 ec 10          	sub    $0x10,%rsp
  801c06:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c0d:	00 
  801c0e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c14:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c1a:	b9 00 00 00 00       	mov    $0x0,%ecx
  801c1f:	ba 00 00 00 00       	mov    $0x0,%edx
  801c24:	be 00 00 00 00       	mov    $0x0,%esi
  801c29:	bf 0e 00 00 00       	mov    $0xe,%edi
  801c2e:	48 b8 bb 17 80 00 00 	movabs $0x8017bb,%rax
  801c35:	00 00 00 
  801c38:	ff d0                	callq  *%rax
  801c3a:	c9                   	leaveq 
  801c3b:	c3                   	retq   

0000000000801c3c <sys_net_transmit>:
  801c3c:	55                   	push   %rbp
  801c3d:	48 89 e5             	mov    %rsp,%rbp
  801c40:	48 83 ec 20          	sub    $0x20,%rsp
  801c44:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c48:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801c4b:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801c4e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c52:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c59:	00 
  801c5a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c60:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c66:	48 89 d1             	mov    %rdx,%rcx
  801c69:	48 89 c2             	mov    %rax,%rdx
  801c6c:	be 00 00 00 00       	mov    $0x0,%esi
  801c71:	bf 0f 00 00 00       	mov    $0xf,%edi
  801c76:	48 b8 bb 17 80 00 00 	movabs $0x8017bb,%rax
  801c7d:	00 00 00 
  801c80:	ff d0                	callq  *%rax
  801c82:	c9                   	leaveq 
  801c83:	c3                   	retq   

0000000000801c84 <sys_net_receive>:
  801c84:	55                   	push   %rbp
  801c85:	48 89 e5             	mov    %rsp,%rbp
  801c88:	48 83 ec 20          	sub    $0x20,%rsp
  801c8c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c90:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801c93:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801c96:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c9a:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801ca1:	00 
  801ca2:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ca8:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801cae:	48 89 d1             	mov    %rdx,%rcx
  801cb1:	48 89 c2             	mov    %rax,%rdx
  801cb4:	be 00 00 00 00       	mov    $0x0,%esi
  801cb9:	bf 10 00 00 00       	mov    $0x10,%edi
  801cbe:	48 b8 bb 17 80 00 00 	movabs $0x8017bb,%rax
  801cc5:	00 00 00 
  801cc8:	ff d0                	callq  *%rax
  801cca:	c9                   	leaveq 
  801ccb:	c3                   	retq   

0000000000801ccc <sys_ept_map>:
  801ccc:	55                   	push   %rbp
  801ccd:	48 89 e5             	mov    %rsp,%rbp
  801cd0:	48 83 ec 30          	sub    $0x30,%rsp
  801cd4:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801cd7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801cdb:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801cde:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801ce2:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801ce6:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801ce9:	48 63 c8             	movslq %eax,%rcx
  801cec:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801cf0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801cf3:	48 63 f0             	movslq %eax,%rsi
  801cf6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801cfa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801cfd:	48 98                	cltq   
  801cff:	48 89 0c 24          	mov    %rcx,(%rsp)
  801d03:	49 89 f9             	mov    %rdi,%r9
  801d06:	49 89 f0             	mov    %rsi,%r8
  801d09:	48 89 d1             	mov    %rdx,%rcx
  801d0c:	48 89 c2             	mov    %rax,%rdx
  801d0f:	be 00 00 00 00       	mov    $0x0,%esi
  801d14:	bf 11 00 00 00       	mov    $0x11,%edi
  801d19:	48 b8 bb 17 80 00 00 	movabs $0x8017bb,%rax
  801d20:	00 00 00 
  801d23:	ff d0                	callq  *%rax
  801d25:	c9                   	leaveq 
  801d26:	c3                   	retq   

0000000000801d27 <sys_env_mkguest>:
  801d27:	55                   	push   %rbp
  801d28:	48 89 e5             	mov    %rsp,%rbp
  801d2b:	48 83 ec 20          	sub    $0x20,%rsp
  801d2f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d33:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d37:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d3b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d3f:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801d46:	00 
  801d47:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d4d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d53:	48 89 d1             	mov    %rdx,%rcx
  801d56:	48 89 c2             	mov    %rax,%rdx
  801d59:	be 00 00 00 00       	mov    $0x0,%esi
  801d5e:	bf 12 00 00 00       	mov    $0x12,%edi
  801d63:	48 b8 bb 17 80 00 00 	movabs $0x8017bb,%rax
  801d6a:	00 00 00 
  801d6d:	ff d0                	callq  *%rax
  801d6f:	c9                   	leaveq 
  801d70:	c3                   	retq   

0000000000801d71 <sys_vmx_list_vms>:
  801d71:	55                   	push   %rbp
  801d72:	48 89 e5             	mov    %rsp,%rbp
  801d75:	48 83 ec 10          	sub    $0x10,%rsp
  801d79:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801d80:	00 
  801d81:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d87:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d8d:	b9 00 00 00 00       	mov    $0x0,%ecx
  801d92:	ba 00 00 00 00       	mov    $0x0,%edx
  801d97:	be 00 00 00 00       	mov    $0x0,%esi
  801d9c:	bf 13 00 00 00       	mov    $0x13,%edi
  801da1:	48 b8 bb 17 80 00 00 	movabs $0x8017bb,%rax
  801da8:	00 00 00 
  801dab:	ff d0                	callq  *%rax
  801dad:	c9                   	leaveq 
  801dae:	c3                   	retq   

0000000000801daf <sys_vmx_sel_resume>:
  801daf:	55                   	push   %rbp
  801db0:	48 89 e5             	mov    %rsp,%rbp
  801db3:	48 83 ec 10          	sub    $0x10,%rsp
  801db7:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801dba:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801dbd:	48 98                	cltq   
  801dbf:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801dc6:	00 
  801dc7:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801dcd:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801dd3:	b9 00 00 00 00       	mov    $0x0,%ecx
  801dd8:	48 89 c2             	mov    %rax,%rdx
  801ddb:	be 00 00 00 00       	mov    $0x0,%esi
  801de0:	bf 14 00 00 00       	mov    $0x14,%edi
  801de5:	48 b8 bb 17 80 00 00 	movabs $0x8017bb,%rax
  801dec:	00 00 00 
  801def:	ff d0                	callq  *%rax
  801df1:	c9                   	leaveq 
  801df2:	c3                   	retq   

0000000000801df3 <sys_vmx_get_vmdisk_number>:
  801df3:	55                   	push   %rbp
  801df4:	48 89 e5             	mov    %rsp,%rbp
  801df7:	48 83 ec 10          	sub    $0x10,%rsp
  801dfb:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801e02:	00 
  801e03:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e09:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e0f:	b9 00 00 00 00       	mov    $0x0,%ecx
  801e14:	ba 00 00 00 00       	mov    $0x0,%edx
  801e19:	be 00 00 00 00       	mov    $0x0,%esi
  801e1e:	bf 15 00 00 00       	mov    $0x15,%edi
  801e23:	48 b8 bb 17 80 00 00 	movabs $0x8017bb,%rax
  801e2a:	00 00 00 
  801e2d:	ff d0                	callq  *%rax
  801e2f:	c9                   	leaveq 
  801e30:	c3                   	retq   

0000000000801e31 <sys_vmx_incr_vmdisk_number>:
  801e31:	55                   	push   %rbp
  801e32:	48 89 e5             	mov    %rsp,%rbp
  801e35:	48 83 ec 10          	sub    $0x10,%rsp
  801e39:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801e40:	00 
  801e41:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e47:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e4d:	b9 00 00 00 00       	mov    $0x0,%ecx
  801e52:	ba 00 00 00 00       	mov    $0x0,%edx
  801e57:	be 00 00 00 00       	mov    $0x0,%esi
  801e5c:	bf 16 00 00 00       	mov    $0x16,%edi
  801e61:	48 b8 bb 17 80 00 00 	movabs $0x8017bb,%rax
  801e68:	00 00 00 
  801e6b:	ff d0                	callq  *%rax
  801e6d:	c9                   	leaveq 
  801e6e:	c3                   	retq   

0000000000801e6f <pgfault>:
  801e6f:	55                   	push   %rbp
  801e70:	48 89 e5             	mov    %rsp,%rbp
  801e73:	48 83 ec 30          	sub    $0x30,%rsp
  801e77:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801e7b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e7f:	48 8b 00             	mov    (%rax),%rax
  801e82:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  801e86:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e8a:	48 8b 40 08          	mov    0x8(%rax),%rax
  801e8e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801e91:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e94:	83 e0 02             	and    $0x2,%eax
  801e97:	85 c0                	test   %eax,%eax
  801e99:	75 40                	jne    801edb <pgfault+0x6c>
  801e9b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e9f:	48 8b 90 88 00 00 00 	mov    0x88(%rax),%rdx
  801ea6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801eaa:	49 89 d0             	mov    %rdx,%r8
  801ead:	48 89 c1             	mov    %rax,%rcx
  801eb0:	48 ba 18 4e 80 00 00 	movabs $0x804e18,%rdx
  801eb7:	00 00 00 
  801eba:	be 1f 00 00 00       	mov    $0x1f,%esi
  801ebf:	48 bf 31 4e 80 00 00 	movabs $0x804e31,%rdi
  801ec6:	00 00 00 
  801ec9:	b8 00 00 00 00       	mov    $0x0,%eax
  801ece:	49 b9 74 02 80 00 00 	movabs $0x800274,%r9
  801ed5:	00 00 00 
  801ed8:	41 ff d1             	callq  *%r9
  801edb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801edf:	48 c1 e8 0c          	shr    $0xc,%rax
  801ee3:	48 89 c2             	mov    %rax,%rdx
  801ee6:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801eed:	01 00 00 
  801ef0:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801ef4:	25 07 08 00 00       	and    $0x807,%eax
  801ef9:	48 3d 05 08 00 00    	cmp    $0x805,%rax
  801eff:	74 4e                	je     801f4f <pgfault+0xe0>
  801f01:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801f05:	48 c1 e8 0c          	shr    $0xc,%rax
  801f09:	48 89 c2             	mov    %rax,%rdx
  801f0c:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801f13:	01 00 00 
  801f16:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  801f1a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801f1e:	49 89 d0             	mov    %rdx,%r8
  801f21:	48 89 c1             	mov    %rax,%rcx
  801f24:	48 ba 40 4e 80 00 00 	movabs $0x804e40,%rdx
  801f2b:	00 00 00 
  801f2e:	be 22 00 00 00       	mov    $0x22,%esi
  801f33:	48 bf 31 4e 80 00 00 	movabs $0x804e31,%rdi
  801f3a:	00 00 00 
  801f3d:	b8 00 00 00 00       	mov    $0x0,%eax
  801f42:	49 b9 74 02 80 00 00 	movabs $0x800274,%r9
  801f49:	00 00 00 
  801f4c:	41 ff d1             	callq  *%r9
  801f4f:	ba 07 00 00 00       	mov    $0x7,%edx
  801f54:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  801f59:	bf 00 00 00 00       	mov    $0x0,%edi
  801f5e:	48 b8 91 19 80 00 00 	movabs $0x801991,%rax
  801f65:	00 00 00 
  801f68:	ff d0                	callq  *%rax
  801f6a:	89 45 f8             	mov    %eax,-0x8(%rbp)
  801f6d:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  801f71:	79 30                	jns    801fa3 <pgfault+0x134>
  801f73:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801f76:	89 c1                	mov    %eax,%ecx
  801f78:	48 ba 6b 4e 80 00 00 	movabs $0x804e6b,%rdx
  801f7f:	00 00 00 
  801f82:	be 30 00 00 00       	mov    $0x30,%esi
  801f87:	48 bf 31 4e 80 00 00 	movabs $0x804e31,%rdi
  801f8e:	00 00 00 
  801f91:	b8 00 00 00 00       	mov    $0x0,%eax
  801f96:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  801f9d:	00 00 00 
  801fa0:	41 ff d0             	callq  *%r8
  801fa3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801fa7:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801fab:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801faf:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  801fb5:	ba 00 10 00 00       	mov    $0x1000,%edx
  801fba:	48 89 c6             	mov    %rax,%rsi
  801fbd:	bf 00 f0 5f 00       	mov    $0x5ff000,%edi
  801fc2:	48 b8 86 13 80 00 00 	movabs $0x801386,%rax
  801fc9:	00 00 00 
  801fcc:	ff d0                	callq  *%rax
  801fce:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801fd2:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801fd6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801fda:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  801fe0:	41 b8 07 00 00 00    	mov    $0x7,%r8d
  801fe6:	48 89 c1             	mov    %rax,%rcx
  801fe9:	ba 00 00 00 00       	mov    $0x0,%edx
  801fee:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  801ff3:	bf 00 00 00 00       	mov    $0x0,%edi
  801ff8:	48 b8 e1 19 80 00 00 	movabs $0x8019e1,%rax
  801fff:	00 00 00 
  802002:	ff d0                	callq  *%rax
  802004:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802007:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80200b:	79 30                	jns    80203d <pgfault+0x1ce>
  80200d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802010:	89 c1                	mov    %eax,%ecx
  802012:	48 ba 7e 4e 80 00 00 	movabs $0x804e7e,%rdx
  802019:	00 00 00 
  80201c:	be 35 00 00 00       	mov    $0x35,%esi
  802021:	48 bf 31 4e 80 00 00 	movabs $0x804e31,%rdi
  802028:	00 00 00 
  80202b:	b8 00 00 00 00       	mov    $0x0,%eax
  802030:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  802037:	00 00 00 
  80203a:	41 ff d0             	callq  *%r8
  80203d:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  802042:	bf 00 00 00 00       	mov    $0x0,%edi
  802047:	48 b8 3c 1a 80 00 00 	movabs $0x801a3c,%rax
  80204e:	00 00 00 
  802051:	ff d0                	callq  *%rax
  802053:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802056:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80205a:	79 30                	jns    80208c <pgfault+0x21d>
  80205c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80205f:	89 c1                	mov    %eax,%ecx
  802061:	48 ba 8f 4e 80 00 00 	movabs $0x804e8f,%rdx
  802068:	00 00 00 
  80206b:	be 39 00 00 00       	mov    $0x39,%esi
  802070:	48 bf 31 4e 80 00 00 	movabs $0x804e31,%rdi
  802077:	00 00 00 
  80207a:	b8 00 00 00 00       	mov    $0x0,%eax
  80207f:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  802086:	00 00 00 
  802089:	41 ff d0             	callq  *%r8
  80208c:	c9                   	leaveq 
  80208d:	c3                   	retq   

000000000080208e <duppage>:
  80208e:	55                   	push   %rbp
  80208f:	48 89 e5             	mov    %rsp,%rbp
  802092:	48 83 ec 30          	sub    $0x30,%rsp
  802096:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802099:	89 75 d8             	mov    %esi,-0x28(%rbp)
  80209c:	8b 45 d8             	mov    -0x28(%rbp),%eax
  80209f:	c1 e0 0c             	shl    $0xc,%eax
  8020a2:	89 c0                	mov    %eax,%eax
  8020a4:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8020a8:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8020af:	01 00 00 
  8020b2:	8b 55 d8             	mov    -0x28(%rbp),%edx
  8020b5:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8020b9:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8020bd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8020c1:	25 02 08 00 00       	and    $0x802,%eax
  8020c6:	48 85 c0             	test   %rax,%rax
  8020c9:	74 0e                	je     8020d9 <duppage+0x4b>
  8020cb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8020cf:	25 00 04 00 00       	and    $0x400,%eax
  8020d4:	48 85 c0             	test   %rax,%rax
  8020d7:	74 70                	je     802149 <duppage+0xbb>
  8020d9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8020dd:	25 07 0e 00 00       	and    $0xe07,%eax
  8020e2:	89 c6                	mov    %eax,%esi
  8020e4:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  8020e8:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8020eb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8020ef:	41 89 f0             	mov    %esi,%r8d
  8020f2:	48 89 c6             	mov    %rax,%rsi
  8020f5:	bf 00 00 00 00       	mov    $0x0,%edi
  8020fa:	48 b8 e1 19 80 00 00 	movabs $0x8019e1,%rax
  802101:	00 00 00 
  802104:	ff d0                	callq  *%rax
  802106:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802109:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80210d:	79 30                	jns    80213f <duppage+0xb1>
  80210f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802112:	89 c1                	mov    %eax,%ecx
  802114:	48 ba 7e 4e 80 00 00 	movabs $0x804e7e,%rdx
  80211b:	00 00 00 
  80211e:	be 63 00 00 00       	mov    $0x63,%esi
  802123:	48 bf 31 4e 80 00 00 	movabs $0x804e31,%rdi
  80212a:	00 00 00 
  80212d:	b8 00 00 00 00       	mov    $0x0,%eax
  802132:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  802139:	00 00 00 
  80213c:	41 ff d0             	callq  *%r8
  80213f:	b8 00 00 00 00       	mov    $0x0,%eax
  802144:	e9 c4 00 00 00       	jmpq   80220d <duppage+0x17f>
  802149:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  80214d:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802150:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802154:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  80215a:	48 89 c6             	mov    %rax,%rsi
  80215d:	bf 00 00 00 00       	mov    $0x0,%edi
  802162:	48 b8 e1 19 80 00 00 	movabs $0x8019e1,%rax
  802169:	00 00 00 
  80216c:	ff d0                	callq  *%rax
  80216e:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802171:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802175:	79 30                	jns    8021a7 <duppage+0x119>
  802177:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80217a:	89 c1                	mov    %eax,%ecx
  80217c:	48 ba 7e 4e 80 00 00 	movabs $0x804e7e,%rdx
  802183:	00 00 00 
  802186:	be 7e 00 00 00       	mov    $0x7e,%esi
  80218b:	48 bf 31 4e 80 00 00 	movabs $0x804e31,%rdi
  802192:	00 00 00 
  802195:	b8 00 00 00 00       	mov    $0x0,%eax
  80219a:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  8021a1:	00 00 00 
  8021a4:	41 ff d0             	callq  *%r8
  8021a7:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8021ab:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8021af:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  8021b5:	48 89 d1             	mov    %rdx,%rcx
  8021b8:	ba 00 00 00 00       	mov    $0x0,%edx
  8021bd:	48 89 c6             	mov    %rax,%rsi
  8021c0:	bf 00 00 00 00       	mov    $0x0,%edi
  8021c5:	48 b8 e1 19 80 00 00 	movabs $0x8019e1,%rax
  8021cc:	00 00 00 
  8021cf:	ff d0                	callq  *%rax
  8021d1:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8021d4:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8021d8:	79 30                	jns    80220a <duppage+0x17c>
  8021da:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8021dd:	89 c1                	mov    %eax,%ecx
  8021df:	48 ba 7e 4e 80 00 00 	movabs $0x804e7e,%rdx
  8021e6:	00 00 00 
  8021e9:	be 80 00 00 00       	mov    $0x80,%esi
  8021ee:	48 bf 31 4e 80 00 00 	movabs $0x804e31,%rdi
  8021f5:	00 00 00 
  8021f8:	b8 00 00 00 00       	mov    $0x0,%eax
  8021fd:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  802204:	00 00 00 
  802207:	41 ff d0             	callq  *%r8
  80220a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80220d:	c9                   	leaveq 
  80220e:	c3                   	retq   

000000000080220f <fork>:
  80220f:	55                   	push   %rbp
  802210:	48 89 e5             	mov    %rsp,%rbp
  802213:	48 83 ec 20          	sub    $0x20,%rsp
  802217:	48 bf 6f 1e 80 00 00 	movabs $0x801e6f,%rdi
  80221e:	00 00 00 
  802221:	48 b8 00 47 80 00 00 	movabs $0x804700,%rax
  802228:	00 00 00 
  80222b:	ff d0                	callq  *%rax
  80222d:	b8 07 00 00 00       	mov    $0x7,%eax
  802232:	cd 30                	int    $0x30
  802234:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802237:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80223a:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80223d:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802241:	79 08                	jns    80224b <fork+0x3c>
  802243:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802246:	e9 09 02 00 00       	jmpq   802454 <fork+0x245>
  80224b:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80224f:	75 3e                	jne    80228f <fork+0x80>
  802251:	48 b8 15 19 80 00 00 	movabs $0x801915,%rax
  802258:	00 00 00 
  80225b:	ff d0                	callq  *%rax
  80225d:	25 ff 03 00 00       	and    $0x3ff,%eax
  802262:	48 98                	cltq   
  802264:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  80226b:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  802272:	00 00 00 
  802275:	48 01 c2             	add    %rax,%rdx
  802278:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80227f:	00 00 00 
  802282:	48 89 10             	mov    %rdx,(%rax)
  802285:	b8 00 00 00 00       	mov    $0x0,%eax
  80228a:	e9 c5 01 00 00       	jmpq   802454 <fork+0x245>
  80228f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802296:	e9 a4 00 00 00       	jmpq   80233f <fork+0x130>
  80229b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80229e:	c1 f8 12             	sar    $0x12,%eax
  8022a1:	89 c2                	mov    %eax,%edx
  8022a3:	48 b8 00 00 40 80 00 	movabs $0x10080400000,%rax
  8022aa:	01 00 00 
  8022ad:	48 63 d2             	movslq %edx,%rdx
  8022b0:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8022b4:	83 e0 01             	and    $0x1,%eax
  8022b7:	48 85 c0             	test   %rax,%rax
  8022ba:	74 21                	je     8022dd <fork+0xce>
  8022bc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8022bf:	c1 f8 09             	sar    $0x9,%eax
  8022c2:	89 c2                	mov    %eax,%edx
  8022c4:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8022cb:	01 00 00 
  8022ce:	48 63 d2             	movslq %edx,%rdx
  8022d1:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8022d5:	83 e0 01             	and    $0x1,%eax
  8022d8:	48 85 c0             	test   %rax,%rax
  8022db:	75 09                	jne    8022e6 <fork+0xd7>
  8022dd:	81 45 fc 00 02 00 00 	addl   $0x200,-0x4(%rbp)
  8022e4:	eb 59                	jmp    80233f <fork+0x130>
  8022e6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8022e9:	05 00 02 00 00       	add    $0x200,%eax
  8022ee:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8022f1:	eb 44                	jmp    802337 <fork+0x128>
  8022f3:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8022fa:	01 00 00 
  8022fd:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802300:	48 63 d2             	movslq %edx,%rdx
  802303:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802307:	83 e0 05             	and    $0x5,%eax
  80230a:	48 83 f8 05          	cmp    $0x5,%rax
  80230e:	74 02                	je     802312 <fork+0x103>
  802310:	eb 21                	jmp    802333 <fork+0x124>
  802312:	81 7d fc ff f7 0e 00 	cmpl   $0xef7ff,-0x4(%rbp)
  802319:	75 02                	jne    80231d <fork+0x10e>
  80231b:	eb 16                	jmp    802333 <fork+0x124>
  80231d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802320:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802323:	89 d6                	mov    %edx,%esi
  802325:	89 c7                	mov    %eax,%edi
  802327:	48 b8 8e 20 80 00 00 	movabs $0x80208e,%rax
  80232e:	00 00 00 
  802331:	ff d0                	callq  *%rax
  802333:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802337:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80233a:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  80233d:	7c b4                	jl     8022f3 <fork+0xe4>
  80233f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802342:	3d ff 07 00 08       	cmp    $0x80007ff,%eax
  802347:	0f 86 4e ff ff ff    	jbe    80229b <fork+0x8c>
  80234d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802350:	ba 07 00 00 00       	mov    $0x7,%edx
  802355:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  80235a:	89 c7                	mov    %eax,%edi
  80235c:	48 b8 91 19 80 00 00 	movabs $0x801991,%rax
  802363:	00 00 00 
  802366:	ff d0                	callq  *%rax
  802368:	89 45 f0             	mov    %eax,-0x10(%rbp)
  80236b:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  80236f:	79 30                	jns    8023a1 <fork+0x192>
  802371:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802374:	89 c1                	mov    %eax,%ecx
  802376:	48 ba a8 4e 80 00 00 	movabs $0x804ea8,%rdx
  80237d:	00 00 00 
  802380:	be bc 00 00 00       	mov    $0xbc,%esi
  802385:	48 bf 31 4e 80 00 00 	movabs $0x804e31,%rdi
  80238c:	00 00 00 
  80238f:	b8 00 00 00 00       	mov    $0x0,%eax
  802394:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  80239b:	00 00 00 
  80239e:	41 ff d0             	callq  *%r8
  8023a1:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8023a8:	00 00 00 
  8023ab:	48 8b 00             	mov    (%rax),%rax
  8023ae:	48 8b 90 f0 00 00 00 	mov    0xf0(%rax),%rdx
  8023b5:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8023b8:	48 89 d6             	mov    %rdx,%rsi
  8023bb:	89 c7                	mov    %eax,%edi
  8023bd:	48 b8 1b 1b 80 00 00 	movabs $0x801b1b,%rax
  8023c4:	00 00 00 
  8023c7:	ff d0                	callq  *%rax
  8023c9:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8023cc:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8023d0:	79 30                	jns    802402 <fork+0x1f3>
  8023d2:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8023d5:	89 c1                	mov    %eax,%ecx
  8023d7:	48 ba c8 4e 80 00 00 	movabs $0x804ec8,%rdx
  8023de:	00 00 00 
  8023e1:	be c0 00 00 00       	mov    $0xc0,%esi
  8023e6:	48 bf 31 4e 80 00 00 	movabs $0x804e31,%rdi
  8023ed:	00 00 00 
  8023f0:	b8 00 00 00 00       	mov    $0x0,%eax
  8023f5:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  8023fc:	00 00 00 
  8023ff:	41 ff d0             	callq  *%r8
  802402:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802405:	be 02 00 00 00       	mov    $0x2,%esi
  80240a:	89 c7                	mov    %eax,%edi
  80240c:	48 b8 86 1a 80 00 00 	movabs $0x801a86,%rax
  802413:	00 00 00 
  802416:	ff d0                	callq  *%rax
  802418:	89 45 f0             	mov    %eax,-0x10(%rbp)
  80241b:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  80241f:	79 30                	jns    802451 <fork+0x242>
  802421:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802424:	89 c1                	mov    %eax,%ecx
  802426:	48 ba e7 4e 80 00 00 	movabs $0x804ee7,%rdx
  80242d:	00 00 00 
  802430:	be c5 00 00 00       	mov    $0xc5,%esi
  802435:	48 bf 31 4e 80 00 00 	movabs $0x804e31,%rdi
  80243c:	00 00 00 
  80243f:	b8 00 00 00 00       	mov    $0x0,%eax
  802444:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  80244b:	00 00 00 
  80244e:	41 ff d0             	callq  *%r8
  802451:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802454:	c9                   	leaveq 
  802455:	c3                   	retq   

0000000000802456 <sfork>:
  802456:	55                   	push   %rbp
  802457:	48 89 e5             	mov    %rsp,%rbp
  80245a:	48 ba fe 4e 80 00 00 	movabs $0x804efe,%rdx
  802461:	00 00 00 
  802464:	be d2 00 00 00       	mov    $0xd2,%esi
  802469:	48 bf 31 4e 80 00 00 	movabs $0x804e31,%rdi
  802470:	00 00 00 
  802473:	b8 00 00 00 00       	mov    $0x0,%eax
  802478:	48 b9 74 02 80 00 00 	movabs $0x800274,%rcx
  80247f:	00 00 00 
  802482:	ff d1                	callq  *%rcx

0000000000802484 <ipc_recv>:
  802484:	55                   	push   %rbp
  802485:	48 89 e5             	mov    %rsp,%rbp
  802488:	48 83 ec 30          	sub    $0x30,%rsp
  80248c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802490:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802494:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802498:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80249d:	75 0e                	jne    8024ad <ipc_recv+0x29>
  80249f:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8024a6:	00 00 00 
  8024a9:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8024ad:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8024b1:	48 89 c7             	mov    %rax,%rdi
  8024b4:	48 b8 ba 1b 80 00 00 	movabs $0x801bba,%rax
  8024bb:	00 00 00 
  8024be:	ff d0                	callq  *%rax
  8024c0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8024c3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8024c7:	79 27                	jns    8024f0 <ipc_recv+0x6c>
  8024c9:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8024ce:	74 0a                	je     8024da <ipc_recv+0x56>
  8024d0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8024d4:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8024da:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8024df:	74 0a                	je     8024eb <ipc_recv+0x67>
  8024e1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8024e5:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8024eb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024ee:	eb 53                	jmp    802543 <ipc_recv+0xbf>
  8024f0:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8024f5:	74 19                	je     802510 <ipc_recv+0x8c>
  8024f7:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8024fe:	00 00 00 
  802501:	48 8b 00             	mov    (%rax),%rax
  802504:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  80250a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80250e:	89 10                	mov    %edx,(%rax)
  802510:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  802515:	74 19                	je     802530 <ipc_recv+0xac>
  802517:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80251e:	00 00 00 
  802521:	48 8b 00             	mov    (%rax),%rax
  802524:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  80252a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80252e:	89 10                	mov    %edx,(%rax)
  802530:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802537:	00 00 00 
  80253a:	48 8b 00             	mov    (%rax),%rax
  80253d:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  802543:	c9                   	leaveq 
  802544:	c3                   	retq   

0000000000802545 <ipc_send>:
  802545:	55                   	push   %rbp
  802546:	48 89 e5             	mov    %rsp,%rbp
  802549:	48 83 ec 30          	sub    $0x30,%rsp
  80254d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802550:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802553:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  802557:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  80255a:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80255f:	75 10                	jne    802571 <ipc_send+0x2c>
  802561:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  802568:	00 00 00 
  80256b:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80256f:	eb 0e                	jmp    80257f <ipc_send+0x3a>
  802571:	eb 0c                	jmp    80257f <ipc_send+0x3a>
  802573:	48 b8 53 19 80 00 00 	movabs $0x801953,%rax
  80257a:	00 00 00 
  80257d:	ff d0                	callq  *%rax
  80257f:	8b 75 e8             	mov    -0x18(%rbp),%esi
  802582:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  802585:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802589:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80258c:	89 c7                	mov    %eax,%edi
  80258e:	48 b8 65 1b 80 00 00 	movabs $0x801b65,%rax
  802595:	00 00 00 
  802598:	ff d0                	callq  *%rax
  80259a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80259d:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  8025a1:	74 d0                	je     802573 <ipc_send+0x2e>
  8025a3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8025a7:	79 30                	jns    8025d9 <ipc_send+0x94>
  8025a9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8025ac:	89 c1                	mov    %eax,%ecx
  8025ae:	48 ba 14 4f 80 00 00 	movabs $0x804f14,%rdx
  8025b5:	00 00 00 
  8025b8:	be 44 00 00 00       	mov    $0x44,%esi
  8025bd:	48 bf 2a 4f 80 00 00 	movabs $0x804f2a,%rdi
  8025c4:	00 00 00 
  8025c7:	b8 00 00 00 00       	mov    $0x0,%eax
  8025cc:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  8025d3:	00 00 00 
  8025d6:	41 ff d0             	callq  *%r8
  8025d9:	c9                   	leaveq 
  8025da:	c3                   	retq   

00000000008025db <ipc_find_env>:
  8025db:	55                   	push   %rbp
  8025dc:	48 89 e5             	mov    %rsp,%rbp
  8025df:	48 83 ec 14          	sub    $0x14,%rsp
  8025e3:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8025e6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8025ed:	eb 4e                	jmp    80263d <ipc_find_env+0x62>
  8025ef:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  8025f6:	00 00 00 
  8025f9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8025fc:	48 98                	cltq   
  8025fe:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  802605:	48 01 d0             	add    %rdx,%rax
  802608:	48 05 d0 00 00 00    	add    $0xd0,%rax
  80260e:	8b 00                	mov    (%rax),%eax
  802610:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  802613:	75 24                	jne    802639 <ipc_find_env+0x5e>
  802615:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  80261c:	00 00 00 
  80261f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802622:	48 98                	cltq   
  802624:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  80262b:	48 01 d0             	add    %rdx,%rax
  80262e:	48 05 c0 00 00 00    	add    $0xc0,%rax
  802634:	8b 40 08             	mov    0x8(%rax),%eax
  802637:	eb 12                	jmp    80264b <ipc_find_env+0x70>
  802639:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80263d:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  802644:	7e a9                	jle    8025ef <ipc_find_env+0x14>
  802646:	b8 00 00 00 00       	mov    $0x0,%eax
  80264b:	c9                   	leaveq 
  80264c:	c3                   	retq   

000000000080264d <fd2num>:
  80264d:	55                   	push   %rbp
  80264e:	48 89 e5             	mov    %rsp,%rbp
  802651:	48 83 ec 08          	sub    $0x8,%rsp
  802655:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802659:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80265d:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  802664:	ff ff ff 
  802667:	48 01 d0             	add    %rdx,%rax
  80266a:	48 c1 e8 0c          	shr    $0xc,%rax
  80266e:	c9                   	leaveq 
  80266f:	c3                   	retq   

0000000000802670 <fd2data>:
  802670:	55                   	push   %rbp
  802671:	48 89 e5             	mov    %rsp,%rbp
  802674:	48 83 ec 08          	sub    $0x8,%rsp
  802678:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80267c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802680:	48 89 c7             	mov    %rax,%rdi
  802683:	48 b8 4d 26 80 00 00 	movabs $0x80264d,%rax
  80268a:	00 00 00 
  80268d:	ff d0                	callq  *%rax
  80268f:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  802695:	48 c1 e0 0c          	shl    $0xc,%rax
  802699:	c9                   	leaveq 
  80269a:	c3                   	retq   

000000000080269b <fd_alloc>:
  80269b:	55                   	push   %rbp
  80269c:	48 89 e5             	mov    %rsp,%rbp
  80269f:	48 83 ec 18          	sub    $0x18,%rsp
  8026a3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8026a7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8026ae:	eb 6b                	jmp    80271b <fd_alloc+0x80>
  8026b0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8026b3:	48 98                	cltq   
  8026b5:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  8026bb:	48 c1 e0 0c          	shl    $0xc,%rax
  8026bf:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8026c3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8026c7:	48 c1 e8 15          	shr    $0x15,%rax
  8026cb:	48 89 c2             	mov    %rax,%rdx
  8026ce:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8026d5:	01 00 00 
  8026d8:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8026dc:	83 e0 01             	and    $0x1,%eax
  8026df:	48 85 c0             	test   %rax,%rax
  8026e2:	74 21                	je     802705 <fd_alloc+0x6a>
  8026e4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8026e8:	48 c1 e8 0c          	shr    $0xc,%rax
  8026ec:	48 89 c2             	mov    %rax,%rdx
  8026ef:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8026f6:	01 00 00 
  8026f9:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8026fd:	83 e0 01             	and    $0x1,%eax
  802700:	48 85 c0             	test   %rax,%rax
  802703:	75 12                	jne    802717 <fd_alloc+0x7c>
  802705:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802709:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80270d:	48 89 10             	mov    %rdx,(%rax)
  802710:	b8 00 00 00 00       	mov    $0x0,%eax
  802715:	eb 1a                	jmp    802731 <fd_alloc+0x96>
  802717:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80271b:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  80271f:	7e 8f                	jle    8026b0 <fd_alloc+0x15>
  802721:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802725:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  80272c:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  802731:	c9                   	leaveq 
  802732:	c3                   	retq   

0000000000802733 <fd_lookup>:
  802733:	55                   	push   %rbp
  802734:	48 89 e5             	mov    %rsp,%rbp
  802737:	48 83 ec 20          	sub    $0x20,%rsp
  80273b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80273e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802742:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802746:	78 06                	js     80274e <fd_lookup+0x1b>
  802748:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  80274c:	7e 07                	jle    802755 <fd_lookup+0x22>
  80274e:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802753:	eb 6c                	jmp    8027c1 <fd_lookup+0x8e>
  802755:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802758:	48 98                	cltq   
  80275a:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802760:	48 c1 e0 0c          	shl    $0xc,%rax
  802764:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802768:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80276c:	48 c1 e8 15          	shr    $0x15,%rax
  802770:	48 89 c2             	mov    %rax,%rdx
  802773:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  80277a:	01 00 00 
  80277d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802781:	83 e0 01             	and    $0x1,%eax
  802784:	48 85 c0             	test   %rax,%rax
  802787:	74 21                	je     8027aa <fd_lookup+0x77>
  802789:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80278d:	48 c1 e8 0c          	shr    $0xc,%rax
  802791:	48 89 c2             	mov    %rax,%rdx
  802794:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80279b:	01 00 00 
  80279e:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8027a2:	83 e0 01             	and    $0x1,%eax
  8027a5:	48 85 c0             	test   %rax,%rax
  8027a8:	75 07                	jne    8027b1 <fd_lookup+0x7e>
  8027aa:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8027af:	eb 10                	jmp    8027c1 <fd_lookup+0x8e>
  8027b1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8027b5:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8027b9:	48 89 10             	mov    %rdx,(%rax)
  8027bc:	b8 00 00 00 00       	mov    $0x0,%eax
  8027c1:	c9                   	leaveq 
  8027c2:	c3                   	retq   

00000000008027c3 <fd_close>:
  8027c3:	55                   	push   %rbp
  8027c4:	48 89 e5             	mov    %rsp,%rbp
  8027c7:	48 83 ec 30          	sub    $0x30,%rsp
  8027cb:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8027cf:	89 f0                	mov    %esi,%eax
  8027d1:	88 45 d4             	mov    %al,-0x2c(%rbp)
  8027d4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8027d8:	48 89 c7             	mov    %rax,%rdi
  8027db:	48 b8 4d 26 80 00 00 	movabs $0x80264d,%rax
  8027e2:	00 00 00 
  8027e5:	ff d0                	callq  *%rax
  8027e7:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8027eb:	48 89 d6             	mov    %rdx,%rsi
  8027ee:	89 c7                	mov    %eax,%edi
  8027f0:	48 b8 33 27 80 00 00 	movabs $0x802733,%rax
  8027f7:	00 00 00 
  8027fa:	ff d0                	callq  *%rax
  8027fc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8027ff:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802803:	78 0a                	js     80280f <fd_close+0x4c>
  802805:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802809:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  80280d:	74 12                	je     802821 <fd_close+0x5e>
  80280f:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  802813:	74 05                	je     80281a <fd_close+0x57>
  802815:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802818:	eb 05                	jmp    80281f <fd_close+0x5c>
  80281a:	b8 00 00 00 00       	mov    $0x0,%eax
  80281f:	eb 69                	jmp    80288a <fd_close+0xc7>
  802821:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802825:	8b 00                	mov    (%rax),%eax
  802827:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80282b:	48 89 d6             	mov    %rdx,%rsi
  80282e:	89 c7                	mov    %eax,%edi
  802830:	48 b8 8c 28 80 00 00 	movabs $0x80288c,%rax
  802837:	00 00 00 
  80283a:	ff d0                	callq  *%rax
  80283c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80283f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802843:	78 2a                	js     80286f <fd_close+0xac>
  802845:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802849:	48 8b 40 20          	mov    0x20(%rax),%rax
  80284d:	48 85 c0             	test   %rax,%rax
  802850:	74 16                	je     802868 <fd_close+0xa5>
  802852:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802856:	48 8b 40 20          	mov    0x20(%rax),%rax
  80285a:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80285e:	48 89 d7             	mov    %rdx,%rdi
  802861:	ff d0                	callq  *%rax
  802863:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802866:	eb 07                	jmp    80286f <fd_close+0xac>
  802868:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80286f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802873:	48 89 c6             	mov    %rax,%rsi
  802876:	bf 00 00 00 00       	mov    $0x0,%edi
  80287b:	48 b8 3c 1a 80 00 00 	movabs $0x801a3c,%rax
  802882:	00 00 00 
  802885:	ff d0                	callq  *%rax
  802887:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80288a:	c9                   	leaveq 
  80288b:	c3                   	retq   

000000000080288c <dev_lookup>:
  80288c:	55                   	push   %rbp
  80288d:	48 89 e5             	mov    %rsp,%rbp
  802890:	48 83 ec 20          	sub    $0x20,%rsp
  802894:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802897:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80289b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8028a2:	eb 41                	jmp    8028e5 <dev_lookup+0x59>
  8028a4:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  8028ab:	00 00 00 
  8028ae:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8028b1:	48 63 d2             	movslq %edx,%rdx
  8028b4:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8028b8:	8b 00                	mov    (%rax),%eax
  8028ba:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  8028bd:	75 22                	jne    8028e1 <dev_lookup+0x55>
  8028bf:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  8028c6:	00 00 00 
  8028c9:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8028cc:	48 63 d2             	movslq %edx,%rdx
  8028cf:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  8028d3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8028d7:	48 89 10             	mov    %rdx,(%rax)
  8028da:	b8 00 00 00 00       	mov    $0x0,%eax
  8028df:	eb 60                	jmp    802941 <dev_lookup+0xb5>
  8028e1:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8028e5:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  8028ec:	00 00 00 
  8028ef:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8028f2:	48 63 d2             	movslq %edx,%rdx
  8028f5:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8028f9:	48 85 c0             	test   %rax,%rax
  8028fc:	75 a6                	jne    8028a4 <dev_lookup+0x18>
  8028fe:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802905:	00 00 00 
  802908:	48 8b 00             	mov    (%rax),%rax
  80290b:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802911:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802914:	89 c6                	mov    %eax,%esi
  802916:	48 bf 38 4f 80 00 00 	movabs $0x804f38,%rdi
  80291d:	00 00 00 
  802920:	b8 00 00 00 00       	mov    $0x0,%eax
  802925:	48 b9 ad 04 80 00 00 	movabs $0x8004ad,%rcx
  80292c:	00 00 00 
  80292f:	ff d1                	callq  *%rcx
  802931:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802935:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  80293c:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802941:	c9                   	leaveq 
  802942:	c3                   	retq   

0000000000802943 <close>:
  802943:	55                   	push   %rbp
  802944:	48 89 e5             	mov    %rsp,%rbp
  802947:	48 83 ec 20          	sub    $0x20,%rsp
  80294b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80294e:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802952:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802955:	48 89 d6             	mov    %rdx,%rsi
  802958:	89 c7                	mov    %eax,%edi
  80295a:	48 b8 33 27 80 00 00 	movabs $0x802733,%rax
  802961:	00 00 00 
  802964:	ff d0                	callq  *%rax
  802966:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802969:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80296d:	79 05                	jns    802974 <close+0x31>
  80296f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802972:	eb 18                	jmp    80298c <close+0x49>
  802974:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802978:	be 01 00 00 00       	mov    $0x1,%esi
  80297d:	48 89 c7             	mov    %rax,%rdi
  802980:	48 b8 c3 27 80 00 00 	movabs $0x8027c3,%rax
  802987:	00 00 00 
  80298a:	ff d0                	callq  *%rax
  80298c:	c9                   	leaveq 
  80298d:	c3                   	retq   

000000000080298e <close_all>:
  80298e:	55                   	push   %rbp
  80298f:	48 89 e5             	mov    %rsp,%rbp
  802992:	48 83 ec 10          	sub    $0x10,%rsp
  802996:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80299d:	eb 15                	jmp    8029b4 <close_all+0x26>
  80299f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029a2:	89 c7                	mov    %eax,%edi
  8029a4:	48 b8 43 29 80 00 00 	movabs $0x802943,%rax
  8029ab:	00 00 00 
  8029ae:	ff d0                	callq  *%rax
  8029b0:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8029b4:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  8029b8:	7e e5                	jle    80299f <close_all+0x11>
  8029ba:	c9                   	leaveq 
  8029bb:	c3                   	retq   

00000000008029bc <dup>:
  8029bc:	55                   	push   %rbp
  8029bd:	48 89 e5             	mov    %rsp,%rbp
  8029c0:	48 83 ec 40          	sub    $0x40,%rsp
  8029c4:	89 7d cc             	mov    %edi,-0x34(%rbp)
  8029c7:	89 75 c8             	mov    %esi,-0x38(%rbp)
  8029ca:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  8029ce:	8b 45 cc             	mov    -0x34(%rbp),%eax
  8029d1:	48 89 d6             	mov    %rdx,%rsi
  8029d4:	89 c7                	mov    %eax,%edi
  8029d6:	48 b8 33 27 80 00 00 	movabs $0x802733,%rax
  8029dd:	00 00 00 
  8029e0:	ff d0                	callq  *%rax
  8029e2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8029e5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8029e9:	79 08                	jns    8029f3 <dup+0x37>
  8029eb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029ee:	e9 70 01 00 00       	jmpq   802b63 <dup+0x1a7>
  8029f3:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8029f6:	89 c7                	mov    %eax,%edi
  8029f8:	48 b8 43 29 80 00 00 	movabs $0x802943,%rax
  8029ff:	00 00 00 
  802a02:	ff d0                	callq  *%rax
  802a04:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802a07:	48 98                	cltq   
  802a09:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802a0f:	48 c1 e0 0c          	shl    $0xc,%rax
  802a13:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802a17:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802a1b:	48 89 c7             	mov    %rax,%rdi
  802a1e:	48 b8 70 26 80 00 00 	movabs $0x802670,%rax
  802a25:	00 00 00 
  802a28:	ff d0                	callq  *%rax
  802a2a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802a2e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802a32:	48 89 c7             	mov    %rax,%rdi
  802a35:	48 b8 70 26 80 00 00 	movabs $0x802670,%rax
  802a3c:	00 00 00 
  802a3f:	ff d0                	callq  *%rax
  802a41:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802a45:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802a49:	48 c1 e8 15          	shr    $0x15,%rax
  802a4d:	48 89 c2             	mov    %rax,%rdx
  802a50:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802a57:	01 00 00 
  802a5a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802a5e:	83 e0 01             	and    $0x1,%eax
  802a61:	48 85 c0             	test   %rax,%rax
  802a64:	74 73                	je     802ad9 <dup+0x11d>
  802a66:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802a6a:	48 c1 e8 0c          	shr    $0xc,%rax
  802a6e:	48 89 c2             	mov    %rax,%rdx
  802a71:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802a78:	01 00 00 
  802a7b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802a7f:	83 e0 01             	and    $0x1,%eax
  802a82:	48 85 c0             	test   %rax,%rax
  802a85:	74 52                	je     802ad9 <dup+0x11d>
  802a87:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802a8b:	48 c1 e8 0c          	shr    $0xc,%rax
  802a8f:	48 89 c2             	mov    %rax,%rdx
  802a92:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802a99:	01 00 00 
  802a9c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802aa0:	25 07 0e 00 00       	and    $0xe07,%eax
  802aa5:	89 c1                	mov    %eax,%ecx
  802aa7:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802aab:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802aaf:	41 89 c8             	mov    %ecx,%r8d
  802ab2:	48 89 d1             	mov    %rdx,%rcx
  802ab5:	ba 00 00 00 00       	mov    $0x0,%edx
  802aba:	48 89 c6             	mov    %rax,%rsi
  802abd:	bf 00 00 00 00       	mov    $0x0,%edi
  802ac2:	48 b8 e1 19 80 00 00 	movabs $0x8019e1,%rax
  802ac9:	00 00 00 
  802acc:	ff d0                	callq  *%rax
  802ace:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ad1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ad5:	79 02                	jns    802ad9 <dup+0x11d>
  802ad7:	eb 57                	jmp    802b30 <dup+0x174>
  802ad9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802add:	48 c1 e8 0c          	shr    $0xc,%rax
  802ae1:	48 89 c2             	mov    %rax,%rdx
  802ae4:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802aeb:	01 00 00 
  802aee:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802af2:	25 07 0e 00 00       	and    $0xe07,%eax
  802af7:	89 c1                	mov    %eax,%ecx
  802af9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802afd:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802b01:	41 89 c8             	mov    %ecx,%r8d
  802b04:	48 89 d1             	mov    %rdx,%rcx
  802b07:	ba 00 00 00 00       	mov    $0x0,%edx
  802b0c:	48 89 c6             	mov    %rax,%rsi
  802b0f:	bf 00 00 00 00       	mov    $0x0,%edi
  802b14:	48 b8 e1 19 80 00 00 	movabs $0x8019e1,%rax
  802b1b:	00 00 00 
  802b1e:	ff d0                	callq  *%rax
  802b20:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b23:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b27:	79 02                	jns    802b2b <dup+0x16f>
  802b29:	eb 05                	jmp    802b30 <dup+0x174>
  802b2b:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802b2e:	eb 33                	jmp    802b63 <dup+0x1a7>
  802b30:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802b34:	48 89 c6             	mov    %rax,%rsi
  802b37:	bf 00 00 00 00       	mov    $0x0,%edi
  802b3c:	48 b8 3c 1a 80 00 00 	movabs $0x801a3c,%rax
  802b43:	00 00 00 
  802b46:	ff d0                	callq  *%rax
  802b48:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802b4c:	48 89 c6             	mov    %rax,%rsi
  802b4f:	bf 00 00 00 00       	mov    $0x0,%edi
  802b54:	48 b8 3c 1a 80 00 00 	movabs $0x801a3c,%rax
  802b5b:	00 00 00 
  802b5e:	ff d0                	callq  *%rax
  802b60:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b63:	c9                   	leaveq 
  802b64:	c3                   	retq   

0000000000802b65 <read>:
  802b65:	55                   	push   %rbp
  802b66:	48 89 e5             	mov    %rsp,%rbp
  802b69:	48 83 ec 40          	sub    $0x40,%rsp
  802b6d:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802b70:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802b74:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802b78:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802b7c:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802b7f:	48 89 d6             	mov    %rdx,%rsi
  802b82:	89 c7                	mov    %eax,%edi
  802b84:	48 b8 33 27 80 00 00 	movabs $0x802733,%rax
  802b8b:	00 00 00 
  802b8e:	ff d0                	callq  *%rax
  802b90:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b93:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b97:	78 24                	js     802bbd <read+0x58>
  802b99:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b9d:	8b 00                	mov    (%rax),%eax
  802b9f:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802ba3:	48 89 d6             	mov    %rdx,%rsi
  802ba6:	89 c7                	mov    %eax,%edi
  802ba8:	48 b8 8c 28 80 00 00 	movabs $0x80288c,%rax
  802baf:	00 00 00 
  802bb2:	ff d0                	callq  *%rax
  802bb4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802bb7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802bbb:	79 05                	jns    802bc2 <read+0x5d>
  802bbd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802bc0:	eb 76                	jmp    802c38 <read+0xd3>
  802bc2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802bc6:	8b 40 08             	mov    0x8(%rax),%eax
  802bc9:	83 e0 03             	and    $0x3,%eax
  802bcc:	83 f8 01             	cmp    $0x1,%eax
  802bcf:	75 3a                	jne    802c0b <read+0xa6>
  802bd1:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802bd8:	00 00 00 
  802bdb:	48 8b 00             	mov    (%rax),%rax
  802bde:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802be4:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802be7:	89 c6                	mov    %eax,%esi
  802be9:	48 bf 57 4f 80 00 00 	movabs $0x804f57,%rdi
  802bf0:	00 00 00 
  802bf3:	b8 00 00 00 00       	mov    $0x0,%eax
  802bf8:	48 b9 ad 04 80 00 00 	movabs $0x8004ad,%rcx
  802bff:	00 00 00 
  802c02:	ff d1                	callq  *%rcx
  802c04:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802c09:	eb 2d                	jmp    802c38 <read+0xd3>
  802c0b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802c0f:	48 8b 40 10          	mov    0x10(%rax),%rax
  802c13:	48 85 c0             	test   %rax,%rax
  802c16:	75 07                	jne    802c1f <read+0xba>
  802c18:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802c1d:	eb 19                	jmp    802c38 <read+0xd3>
  802c1f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802c23:	48 8b 40 10          	mov    0x10(%rax),%rax
  802c27:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802c2b:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802c2f:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802c33:	48 89 cf             	mov    %rcx,%rdi
  802c36:	ff d0                	callq  *%rax
  802c38:	c9                   	leaveq 
  802c39:	c3                   	retq   

0000000000802c3a <readn>:
  802c3a:	55                   	push   %rbp
  802c3b:	48 89 e5             	mov    %rsp,%rbp
  802c3e:	48 83 ec 30          	sub    $0x30,%rsp
  802c42:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802c45:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802c49:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802c4d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802c54:	eb 49                	jmp    802c9f <readn+0x65>
  802c56:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c59:	48 98                	cltq   
  802c5b:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802c5f:	48 29 c2             	sub    %rax,%rdx
  802c62:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c65:	48 63 c8             	movslq %eax,%rcx
  802c68:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802c6c:	48 01 c1             	add    %rax,%rcx
  802c6f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802c72:	48 89 ce             	mov    %rcx,%rsi
  802c75:	89 c7                	mov    %eax,%edi
  802c77:	48 b8 65 2b 80 00 00 	movabs $0x802b65,%rax
  802c7e:	00 00 00 
  802c81:	ff d0                	callq  *%rax
  802c83:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802c86:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802c8a:	79 05                	jns    802c91 <readn+0x57>
  802c8c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802c8f:	eb 1c                	jmp    802cad <readn+0x73>
  802c91:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802c95:	75 02                	jne    802c99 <readn+0x5f>
  802c97:	eb 11                	jmp    802caa <readn+0x70>
  802c99:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802c9c:	01 45 fc             	add    %eax,-0x4(%rbp)
  802c9f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ca2:	48 98                	cltq   
  802ca4:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802ca8:	72 ac                	jb     802c56 <readn+0x1c>
  802caa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802cad:	c9                   	leaveq 
  802cae:	c3                   	retq   

0000000000802caf <write>:
  802caf:	55                   	push   %rbp
  802cb0:	48 89 e5             	mov    %rsp,%rbp
  802cb3:	48 83 ec 40          	sub    $0x40,%rsp
  802cb7:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802cba:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802cbe:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802cc2:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802cc6:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802cc9:	48 89 d6             	mov    %rdx,%rsi
  802ccc:	89 c7                	mov    %eax,%edi
  802cce:	48 b8 33 27 80 00 00 	movabs $0x802733,%rax
  802cd5:	00 00 00 
  802cd8:	ff d0                	callq  *%rax
  802cda:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802cdd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ce1:	78 24                	js     802d07 <write+0x58>
  802ce3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ce7:	8b 00                	mov    (%rax),%eax
  802ce9:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802ced:	48 89 d6             	mov    %rdx,%rsi
  802cf0:	89 c7                	mov    %eax,%edi
  802cf2:	48 b8 8c 28 80 00 00 	movabs $0x80288c,%rax
  802cf9:	00 00 00 
  802cfc:	ff d0                	callq  *%rax
  802cfe:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d01:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d05:	79 05                	jns    802d0c <write+0x5d>
  802d07:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d0a:	eb 75                	jmp    802d81 <write+0xd2>
  802d0c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d10:	8b 40 08             	mov    0x8(%rax),%eax
  802d13:	83 e0 03             	and    $0x3,%eax
  802d16:	85 c0                	test   %eax,%eax
  802d18:	75 3a                	jne    802d54 <write+0xa5>
  802d1a:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802d21:	00 00 00 
  802d24:	48 8b 00             	mov    (%rax),%rax
  802d27:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802d2d:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802d30:	89 c6                	mov    %eax,%esi
  802d32:	48 bf 73 4f 80 00 00 	movabs $0x804f73,%rdi
  802d39:	00 00 00 
  802d3c:	b8 00 00 00 00       	mov    $0x0,%eax
  802d41:	48 b9 ad 04 80 00 00 	movabs $0x8004ad,%rcx
  802d48:	00 00 00 
  802d4b:	ff d1                	callq  *%rcx
  802d4d:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802d52:	eb 2d                	jmp    802d81 <write+0xd2>
  802d54:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d58:	48 8b 40 18          	mov    0x18(%rax),%rax
  802d5c:	48 85 c0             	test   %rax,%rax
  802d5f:	75 07                	jne    802d68 <write+0xb9>
  802d61:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802d66:	eb 19                	jmp    802d81 <write+0xd2>
  802d68:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d6c:	48 8b 40 18          	mov    0x18(%rax),%rax
  802d70:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802d74:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802d78:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802d7c:	48 89 cf             	mov    %rcx,%rdi
  802d7f:	ff d0                	callq  *%rax
  802d81:	c9                   	leaveq 
  802d82:	c3                   	retq   

0000000000802d83 <seek>:
  802d83:	55                   	push   %rbp
  802d84:	48 89 e5             	mov    %rsp,%rbp
  802d87:	48 83 ec 18          	sub    $0x18,%rsp
  802d8b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802d8e:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802d91:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802d95:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802d98:	48 89 d6             	mov    %rdx,%rsi
  802d9b:	89 c7                	mov    %eax,%edi
  802d9d:	48 b8 33 27 80 00 00 	movabs $0x802733,%rax
  802da4:	00 00 00 
  802da7:	ff d0                	callq  *%rax
  802da9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802dac:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802db0:	79 05                	jns    802db7 <seek+0x34>
  802db2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802db5:	eb 0f                	jmp    802dc6 <seek+0x43>
  802db7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802dbb:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802dbe:	89 50 04             	mov    %edx,0x4(%rax)
  802dc1:	b8 00 00 00 00       	mov    $0x0,%eax
  802dc6:	c9                   	leaveq 
  802dc7:	c3                   	retq   

0000000000802dc8 <ftruncate>:
  802dc8:	55                   	push   %rbp
  802dc9:	48 89 e5             	mov    %rsp,%rbp
  802dcc:	48 83 ec 30          	sub    $0x30,%rsp
  802dd0:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802dd3:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802dd6:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802dda:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802ddd:	48 89 d6             	mov    %rdx,%rsi
  802de0:	89 c7                	mov    %eax,%edi
  802de2:	48 b8 33 27 80 00 00 	movabs $0x802733,%rax
  802de9:	00 00 00 
  802dec:	ff d0                	callq  *%rax
  802dee:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802df1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802df5:	78 24                	js     802e1b <ftruncate+0x53>
  802df7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802dfb:	8b 00                	mov    (%rax),%eax
  802dfd:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802e01:	48 89 d6             	mov    %rdx,%rsi
  802e04:	89 c7                	mov    %eax,%edi
  802e06:	48 b8 8c 28 80 00 00 	movabs $0x80288c,%rax
  802e0d:	00 00 00 
  802e10:	ff d0                	callq  *%rax
  802e12:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e15:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e19:	79 05                	jns    802e20 <ftruncate+0x58>
  802e1b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e1e:	eb 72                	jmp    802e92 <ftruncate+0xca>
  802e20:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e24:	8b 40 08             	mov    0x8(%rax),%eax
  802e27:	83 e0 03             	and    $0x3,%eax
  802e2a:	85 c0                	test   %eax,%eax
  802e2c:	75 3a                	jne    802e68 <ftruncate+0xa0>
  802e2e:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802e35:	00 00 00 
  802e38:	48 8b 00             	mov    (%rax),%rax
  802e3b:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802e41:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802e44:	89 c6                	mov    %eax,%esi
  802e46:	48 bf 90 4f 80 00 00 	movabs $0x804f90,%rdi
  802e4d:	00 00 00 
  802e50:	b8 00 00 00 00       	mov    $0x0,%eax
  802e55:	48 b9 ad 04 80 00 00 	movabs $0x8004ad,%rcx
  802e5c:	00 00 00 
  802e5f:	ff d1                	callq  *%rcx
  802e61:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802e66:	eb 2a                	jmp    802e92 <ftruncate+0xca>
  802e68:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e6c:	48 8b 40 30          	mov    0x30(%rax),%rax
  802e70:	48 85 c0             	test   %rax,%rax
  802e73:	75 07                	jne    802e7c <ftruncate+0xb4>
  802e75:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802e7a:	eb 16                	jmp    802e92 <ftruncate+0xca>
  802e7c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e80:	48 8b 40 30          	mov    0x30(%rax),%rax
  802e84:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802e88:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  802e8b:	89 ce                	mov    %ecx,%esi
  802e8d:	48 89 d7             	mov    %rdx,%rdi
  802e90:	ff d0                	callq  *%rax
  802e92:	c9                   	leaveq 
  802e93:	c3                   	retq   

0000000000802e94 <fstat>:
  802e94:	55                   	push   %rbp
  802e95:	48 89 e5             	mov    %rsp,%rbp
  802e98:	48 83 ec 30          	sub    $0x30,%rsp
  802e9c:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802e9f:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802ea3:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802ea7:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802eaa:	48 89 d6             	mov    %rdx,%rsi
  802ead:	89 c7                	mov    %eax,%edi
  802eaf:	48 b8 33 27 80 00 00 	movabs $0x802733,%rax
  802eb6:	00 00 00 
  802eb9:	ff d0                	callq  *%rax
  802ebb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ebe:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ec2:	78 24                	js     802ee8 <fstat+0x54>
  802ec4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ec8:	8b 00                	mov    (%rax),%eax
  802eca:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802ece:	48 89 d6             	mov    %rdx,%rsi
  802ed1:	89 c7                	mov    %eax,%edi
  802ed3:	48 b8 8c 28 80 00 00 	movabs $0x80288c,%rax
  802eda:	00 00 00 
  802edd:	ff d0                	callq  *%rax
  802edf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ee2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ee6:	79 05                	jns    802eed <fstat+0x59>
  802ee8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802eeb:	eb 5e                	jmp    802f4b <fstat+0xb7>
  802eed:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ef1:	48 8b 40 28          	mov    0x28(%rax),%rax
  802ef5:	48 85 c0             	test   %rax,%rax
  802ef8:	75 07                	jne    802f01 <fstat+0x6d>
  802efa:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802eff:	eb 4a                	jmp    802f4b <fstat+0xb7>
  802f01:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802f05:	c6 00 00             	movb   $0x0,(%rax)
  802f08:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802f0c:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  802f13:	00 00 00 
  802f16:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802f1a:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  802f21:	00 00 00 
  802f24:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802f28:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802f2c:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  802f33:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f37:	48 8b 40 28          	mov    0x28(%rax),%rax
  802f3b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802f3f:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  802f43:	48 89 ce             	mov    %rcx,%rsi
  802f46:	48 89 d7             	mov    %rdx,%rdi
  802f49:	ff d0                	callq  *%rax
  802f4b:	c9                   	leaveq 
  802f4c:	c3                   	retq   

0000000000802f4d <stat>:
  802f4d:	55                   	push   %rbp
  802f4e:	48 89 e5             	mov    %rsp,%rbp
  802f51:	48 83 ec 20          	sub    $0x20,%rsp
  802f55:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802f59:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802f5d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f61:	be 00 00 00 00       	mov    $0x0,%esi
  802f66:	48 89 c7             	mov    %rax,%rdi
  802f69:	48 b8 3b 30 80 00 00 	movabs $0x80303b,%rax
  802f70:	00 00 00 
  802f73:	ff d0                	callq  *%rax
  802f75:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f78:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f7c:	79 05                	jns    802f83 <stat+0x36>
  802f7e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f81:	eb 2f                	jmp    802fb2 <stat+0x65>
  802f83:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802f87:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f8a:	48 89 d6             	mov    %rdx,%rsi
  802f8d:	89 c7                	mov    %eax,%edi
  802f8f:	48 b8 94 2e 80 00 00 	movabs $0x802e94,%rax
  802f96:	00 00 00 
  802f99:	ff d0                	callq  *%rax
  802f9b:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802f9e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802fa1:	89 c7                	mov    %eax,%edi
  802fa3:	48 b8 43 29 80 00 00 	movabs $0x802943,%rax
  802faa:	00 00 00 
  802fad:	ff d0                	callq  *%rax
  802faf:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802fb2:	c9                   	leaveq 
  802fb3:	c3                   	retq   

0000000000802fb4 <fsipc>:
  802fb4:	55                   	push   %rbp
  802fb5:	48 89 e5             	mov    %rsp,%rbp
  802fb8:	48 83 ec 10          	sub    $0x10,%rsp
  802fbc:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802fbf:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802fc3:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802fca:	00 00 00 
  802fcd:	8b 00                	mov    (%rax),%eax
  802fcf:	85 c0                	test   %eax,%eax
  802fd1:	75 1d                	jne    802ff0 <fsipc+0x3c>
  802fd3:	bf 01 00 00 00       	mov    $0x1,%edi
  802fd8:	48 b8 db 25 80 00 00 	movabs $0x8025db,%rax
  802fdf:	00 00 00 
  802fe2:	ff d0                	callq  *%rax
  802fe4:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  802feb:	00 00 00 
  802fee:	89 02                	mov    %eax,(%rdx)
  802ff0:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802ff7:	00 00 00 
  802ffa:	8b 00                	mov    (%rax),%eax
  802ffc:	8b 75 fc             	mov    -0x4(%rbp),%esi
  802fff:	b9 07 00 00 00       	mov    $0x7,%ecx
  803004:	48 ba 00 90 80 00 00 	movabs $0x809000,%rdx
  80300b:	00 00 00 
  80300e:	89 c7                	mov    %eax,%edi
  803010:	48 b8 45 25 80 00 00 	movabs $0x802545,%rax
  803017:	00 00 00 
  80301a:	ff d0                	callq  *%rax
  80301c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803020:	ba 00 00 00 00       	mov    $0x0,%edx
  803025:	48 89 c6             	mov    %rax,%rsi
  803028:	bf 00 00 00 00       	mov    $0x0,%edi
  80302d:	48 b8 84 24 80 00 00 	movabs $0x802484,%rax
  803034:	00 00 00 
  803037:	ff d0                	callq  *%rax
  803039:	c9                   	leaveq 
  80303a:	c3                   	retq   

000000000080303b <open>:
  80303b:	55                   	push   %rbp
  80303c:	48 89 e5             	mov    %rsp,%rbp
  80303f:	48 83 ec 20          	sub    $0x20,%rsp
  803043:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803047:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80304a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80304e:	48 89 c7             	mov    %rax,%rdi
  803051:	48 b8 f6 0f 80 00 00 	movabs $0x800ff6,%rax
  803058:	00 00 00 
  80305b:	ff d0                	callq  *%rax
  80305d:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  803062:	7e 0a                	jle    80306e <open+0x33>
  803064:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  803069:	e9 a5 00 00 00       	jmpq   803113 <open+0xd8>
  80306e:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803072:	48 89 c7             	mov    %rax,%rdi
  803075:	48 b8 9b 26 80 00 00 	movabs $0x80269b,%rax
  80307c:	00 00 00 
  80307f:	ff d0                	callq  *%rax
  803081:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803084:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803088:	79 08                	jns    803092 <open+0x57>
  80308a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80308d:	e9 81 00 00 00       	jmpq   803113 <open+0xd8>
  803092:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803096:	48 89 c6             	mov    %rax,%rsi
  803099:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  8030a0:	00 00 00 
  8030a3:	48 b8 62 10 80 00 00 	movabs $0x801062,%rax
  8030aa:	00 00 00 
  8030ad:	ff d0                	callq  *%rax
  8030af:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8030b6:	00 00 00 
  8030b9:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8030bc:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  8030c2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8030c6:	48 89 c6             	mov    %rax,%rsi
  8030c9:	bf 01 00 00 00       	mov    $0x1,%edi
  8030ce:	48 b8 b4 2f 80 00 00 	movabs $0x802fb4,%rax
  8030d5:	00 00 00 
  8030d8:	ff d0                	callq  *%rax
  8030da:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8030dd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8030e1:	79 1d                	jns    803100 <open+0xc5>
  8030e3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8030e7:	be 00 00 00 00       	mov    $0x0,%esi
  8030ec:	48 89 c7             	mov    %rax,%rdi
  8030ef:	48 b8 c3 27 80 00 00 	movabs $0x8027c3,%rax
  8030f6:	00 00 00 
  8030f9:	ff d0                	callq  *%rax
  8030fb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030fe:	eb 13                	jmp    803113 <open+0xd8>
  803100:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803104:	48 89 c7             	mov    %rax,%rdi
  803107:	48 b8 4d 26 80 00 00 	movabs $0x80264d,%rax
  80310e:	00 00 00 
  803111:	ff d0                	callq  *%rax
  803113:	c9                   	leaveq 
  803114:	c3                   	retq   

0000000000803115 <devfile_flush>:
  803115:	55                   	push   %rbp
  803116:	48 89 e5             	mov    %rsp,%rbp
  803119:	48 83 ec 10          	sub    $0x10,%rsp
  80311d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803121:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803125:	8b 50 0c             	mov    0xc(%rax),%edx
  803128:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80312f:	00 00 00 
  803132:	89 10                	mov    %edx,(%rax)
  803134:	be 00 00 00 00       	mov    $0x0,%esi
  803139:	bf 06 00 00 00       	mov    $0x6,%edi
  80313e:	48 b8 b4 2f 80 00 00 	movabs $0x802fb4,%rax
  803145:	00 00 00 
  803148:	ff d0                	callq  *%rax
  80314a:	c9                   	leaveq 
  80314b:	c3                   	retq   

000000000080314c <devfile_read>:
  80314c:	55                   	push   %rbp
  80314d:	48 89 e5             	mov    %rsp,%rbp
  803150:	48 83 ec 30          	sub    $0x30,%rsp
  803154:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803158:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80315c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803160:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803164:	8b 50 0c             	mov    0xc(%rax),%edx
  803167:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80316e:	00 00 00 
  803171:	89 10                	mov    %edx,(%rax)
  803173:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80317a:	00 00 00 
  80317d:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803181:	48 89 50 08          	mov    %rdx,0x8(%rax)
  803185:	be 00 00 00 00       	mov    $0x0,%esi
  80318a:	bf 03 00 00 00       	mov    $0x3,%edi
  80318f:	48 b8 b4 2f 80 00 00 	movabs $0x802fb4,%rax
  803196:	00 00 00 
  803199:	ff d0                	callq  *%rax
  80319b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80319e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8031a2:	79 08                	jns    8031ac <devfile_read+0x60>
  8031a4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031a7:	e9 a4 00 00 00       	jmpq   803250 <devfile_read+0x104>
  8031ac:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031af:	48 98                	cltq   
  8031b1:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8031b5:	76 35                	jbe    8031ec <devfile_read+0xa0>
  8031b7:	48 b9 b6 4f 80 00 00 	movabs $0x804fb6,%rcx
  8031be:	00 00 00 
  8031c1:	48 ba bd 4f 80 00 00 	movabs $0x804fbd,%rdx
  8031c8:	00 00 00 
  8031cb:	be 89 00 00 00       	mov    $0x89,%esi
  8031d0:	48 bf d2 4f 80 00 00 	movabs $0x804fd2,%rdi
  8031d7:	00 00 00 
  8031da:	b8 00 00 00 00       	mov    $0x0,%eax
  8031df:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  8031e6:	00 00 00 
  8031e9:	41 ff d0             	callq  *%r8
  8031ec:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  8031f3:	7e 35                	jle    80322a <devfile_read+0xde>
  8031f5:	48 b9 e0 4f 80 00 00 	movabs $0x804fe0,%rcx
  8031fc:	00 00 00 
  8031ff:	48 ba bd 4f 80 00 00 	movabs $0x804fbd,%rdx
  803206:	00 00 00 
  803209:	be 8a 00 00 00       	mov    $0x8a,%esi
  80320e:	48 bf d2 4f 80 00 00 	movabs $0x804fd2,%rdi
  803215:	00 00 00 
  803218:	b8 00 00 00 00       	mov    $0x0,%eax
  80321d:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  803224:	00 00 00 
  803227:	41 ff d0             	callq  *%r8
  80322a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80322d:	48 63 d0             	movslq %eax,%rdx
  803230:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803234:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  80323b:	00 00 00 
  80323e:	48 89 c7             	mov    %rax,%rdi
  803241:	48 b8 86 13 80 00 00 	movabs $0x801386,%rax
  803248:	00 00 00 
  80324b:	ff d0                	callq  *%rax
  80324d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803250:	c9                   	leaveq 
  803251:	c3                   	retq   

0000000000803252 <devfile_write>:
  803252:	55                   	push   %rbp
  803253:	48 89 e5             	mov    %rsp,%rbp
  803256:	48 83 ec 40          	sub    $0x40,%rsp
  80325a:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80325e:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803262:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803266:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80326a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80326e:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  803275:	00 
  803276:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80327a:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  80327e:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  803283:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  803287:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80328b:	8b 50 0c             	mov    0xc(%rax),%edx
  80328e:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803295:	00 00 00 
  803298:	89 10                	mov    %edx,(%rax)
  80329a:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8032a1:	00 00 00 
  8032a4:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8032a8:	48 89 50 08          	mov    %rdx,0x8(%rax)
  8032ac:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8032b0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8032b4:	48 89 c6             	mov    %rax,%rsi
  8032b7:	48 bf 10 90 80 00 00 	movabs $0x809010,%rdi
  8032be:	00 00 00 
  8032c1:	48 b8 86 13 80 00 00 	movabs $0x801386,%rax
  8032c8:	00 00 00 
  8032cb:	ff d0                	callq  *%rax
  8032cd:	be 00 00 00 00       	mov    $0x0,%esi
  8032d2:	bf 04 00 00 00       	mov    $0x4,%edi
  8032d7:	48 b8 b4 2f 80 00 00 	movabs $0x802fb4,%rax
  8032de:	00 00 00 
  8032e1:	ff d0                	callq  *%rax
  8032e3:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8032e6:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8032ea:	79 05                	jns    8032f1 <devfile_write+0x9f>
  8032ec:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8032ef:	eb 43                	jmp    803334 <devfile_write+0xe2>
  8032f1:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8032f4:	48 98                	cltq   
  8032f6:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8032fa:	76 35                	jbe    803331 <devfile_write+0xdf>
  8032fc:	48 b9 b6 4f 80 00 00 	movabs $0x804fb6,%rcx
  803303:	00 00 00 
  803306:	48 ba bd 4f 80 00 00 	movabs $0x804fbd,%rdx
  80330d:	00 00 00 
  803310:	be a8 00 00 00       	mov    $0xa8,%esi
  803315:	48 bf d2 4f 80 00 00 	movabs $0x804fd2,%rdi
  80331c:	00 00 00 
  80331f:	b8 00 00 00 00       	mov    $0x0,%eax
  803324:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  80332b:	00 00 00 
  80332e:	41 ff d0             	callq  *%r8
  803331:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803334:	c9                   	leaveq 
  803335:	c3                   	retq   

0000000000803336 <devfile_stat>:
  803336:	55                   	push   %rbp
  803337:	48 89 e5             	mov    %rsp,%rbp
  80333a:	48 83 ec 20          	sub    $0x20,%rsp
  80333e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803342:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803346:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80334a:	8b 50 0c             	mov    0xc(%rax),%edx
  80334d:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803354:	00 00 00 
  803357:	89 10                	mov    %edx,(%rax)
  803359:	be 00 00 00 00       	mov    $0x0,%esi
  80335e:	bf 05 00 00 00       	mov    $0x5,%edi
  803363:	48 b8 b4 2f 80 00 00 	movabs $0x802fb4,%rax
  80336a:	00 00 00 
  80336d:	ff d0                	callq  *%rax
  80336f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803372:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803376:	79 05                	jns    80337d <devfile_stat+0x47>
  803378:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80337b:	eb 56                	jmp    8033d3 <devfile_stat+0x9d>
  80337d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803381:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  803388:	00 00 00 
  80338b:	48 89 c7             	mov    %rax,%rdi
  80338e:	48 b8 62 10 80 00 00 	movabs $0x801062,%rax
  803395:	00 00 00 
  803398:	ff d0                	callq  *%rax
  80339a:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8033a1:	00 00 00 
  8033a4:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  8033aa:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8033ae:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  8033b4:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8033bb:	00 00 00 
  8033be:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  8033c4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8033c8:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  8033ce:	b8 00 00 00 00       	mov    $0x0,%eax
  8033d3:	c9                   	leaveq 
  8033d4:	c3                   	retq   

00000000008033d5 <devfile_trunc>:
  8033d5:	55                   	push   %rbp
  8033d6:	48 89 e5             	mov    %rsp,%rbp
  8033d9:	48 83 ec 10          	sub    $0x10,%rsp
  8033dd:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8033e1:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8033e4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8033e8:	8b 50 0c             	mov    0xc(%rax),%edx
  8033eb:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8033f2:	00 00 00 
  8033f5:	89 10                	mov    %edx,(%rax)
  8033f7:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8033fe:	00 00 00 
  803401:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803404:	89 50 04             	mov    %edx,0x4(%rax)
  803407:	be 00 00 00 00       	mov    $0x0,%esi
  80340c:	bf 02 00 00 00       	mov    $0x2,%edi
  803411:	48 b8 b4 2f 80 00 00 	movabs $0x802fb4,%rax
  803418:	00 00 00 
  80341b:	ff d0                	callq  *%rax
  80341d:	c9                   	leaveq 
  80341e:	c3                   	retq   

000000000080341f <remove>:
  80341f:	55                   	push   %rbp
  803420:	48 89 e5             	mov    %rsp,%rbp
  803423:	48 83 ec 10          	sub    $0x10,%rsp
  803427:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80342b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80342f:	48 89 c7             	mov    %rax,%rdi
  803432:	48 b8 f6 0f 80 00 00 	movabs $0x800ff6,%rax
  803439:	00 00 00 
  80343c:	ff d0                	callq  *%rax
  80343e:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  803443:	7e 07                	jle    80344c <remove+0x2d>
  803445:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  80344a:	eb 33                	jmp    80347f <remove+0x60>
  80344c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803450:	48 89 c6             	mov    %rax,%rsi
  803453:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  80345a:	00 00 00 
  80345d:	48 b8 62 10 80 00 00 	movabs $0x801062,%rax
  803464:	00 00 00 
  803467:	ff d0                	callq  *%rax
  803469:	be 00 00 00 00       	mov    $0x0,%esi
  80346e:	bf 07 00 00 00       	mov    $0x7,%edi
  803473:	48 b8 b4 2f 80 00 00 	movabs $0x802fb4,%rax
  80347a:	00 00 00 
  80347d:	ff d0                	callq  *%rax
  80347f:	c9                   	leaveq 
  803480:	c3                   	retq   

0000000000803481 <sync>:
  803481:	55                   	push   %rbp
  803482:	48 89 e5             	mov    %rsp,%rbp
  803485:	be 00 00 00 00       	mov    $0x0,%esi
  80348a:	bf 08 00 00 00       	mov    $0x8,%edi
  80348f:	48 b8 b4 2f 80 00 00 	movabs $0x802fb4,%rax
  803496:	00 00 00 
  803499:	ff d0                	callq  *%rax
  80349b:	5d                   	pop    %rbp
  80349c:	c3                   	retq   

000000000080349d <copy>:
  80349d:	55                   	push   %rbp
  80349e:	48 89 e5             	mov    %rsp,%rbp
  8034a1:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  8034a8:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  8034af:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  8034b6:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  8034bd:	be 00 00 00 00       	mov    $0x0,%esi
  8034c2:	48 89 c7             	mov    %rax,%rdi
  8034c5:	48 b8 3b 30 80 00 00 	movabs $0x80303b,%rax
  8034cc:	00 00 00 
  8034cf:	ff d0                	callq  *%rax
  8034d1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8034d4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8034d8:	79 28                	jns    803502 <copy+0x65>
  8034da:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034dd:	89 c6                	mov    %eax,%esi
  8034df:	48 bf ec 4f 80 00 00 	movabs $0x804fec,%rdi
  8034e6:	00 00 00 
  8034e9:	b8 00 00 00 00       	mov    $0x0,%eax
  8034ee:	48 ba ad 04 80 00 00 	movabs $0x8004ad,%rdx
  8034f5:	00 00 00 
  8034f8:	ff d2                	callq  *%rdx
  8034fa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034fd:	e9 74 01 00 00       	jmpq   803676 <copy+0x1d9>
  803502:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  803509:	be 01 01 00 00       	mov    $0x101,%esi
  80350e:	48 89 c7             	mov    %rax,%rdi
  803511:	48 b8 3b 30 80 00 00 	movabs $0x80303b,%rax
  803518:	00 00 00 
  80351b:	ff d0                	callq  *%rax
  80351d:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803520:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803524:	79 39                	jns    80355f <copy+0xc2>
  803526:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803529:	89 c6                	mov    %eax,%esi
  80352b:	48 bf 02 50 80 00 00 	movabs $0x805002,%rdi
  803532:	00 00 00 
  803535:	b8 00 00 00 00       	mov    $0x0,%eax
  80353a:	48 ba ad 04 80 00 00 	movabs $0x8004ad,%rdx
  803541:	00 00 00 
  803544:	ff d2                	callq  *%rdx
  803546:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803549:	89 c7                	mov    %eax,%edi
  80354b:	48 b8 43 29 80 00 00 	movabs $0x802943,%rax
  803552:	00 00 00 
  803555:	ff d0                	callq  *%rax
  803557:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80355a:	e9 17 01 00 00       	jmpq   803676 <copy+0x1d9>
  80355f:	eb 74                	jmp    8035d5 <copy+0x138>
  803561:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803564:	48 63 d0             	movslq %eax,%rdx
  803567:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  80356e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803571:	48 89 ce             	mov    %rcx,%rsi
  803574:	89 c7                	mov    %eax,%edi
  803576:	48 b8 af 2c 80 00 00 	movabs $0x802caf,%rax
  80357d:	00 00 00 
  803580:	ff d0                	callq  *%rax
  803582:	89 45 f0             	mov    %eax,-0x10(%rbp)
  803585:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  803589:	79 4a                	jns    8035d5 <copy+0x138>
  80358b:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80358e:	89 c6                	mov    %eax,%esi
  803590:	48 bf 1c 50 80 00 00 	movabs $0x80501c,%rdi
  803597:	00 00 00 
  80359a:	b8 00 00 00 00       	mov    $0x0,%eax
  80359f:	48 ba ad 04 80 00 00 	movabs $0x8004ad,%rdx
  8035a6:	00 00 00 
  8035a9:	ff d2                	callq  *%rdx
  8035ab:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035ae:	89 c7                	mov    %eax,%edi
  8035b0:	48 b8 43 29 80 00 00 	movabs $0x802943,%rax
  8035b7:	00 00 00 
  8035ba:	ff d0                	callq  *%rax
  8035bc:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8035bf:	89 c7                	mov    %eax,%edi
  8035c1:	48 b8 43 29 80 00 00 	movabs $0x802943,%rax
  8035c8:	00 00 00 
  8035cb:	ff d0                	callq  *%rax
  8035cd:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8035d0:	e9 a1 00 00 00       	jmpq   803676 <copy+0x1d9>
  8035d5:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  8035dc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035df:	ba 00 02 00 00       	mov    $0x200,%edx
  8035e4:	48 89 ce             	mov    %rcx,%rsi
  8035e7:	89 c7                	mov    %eax,%edi
  8035e9:	48 b8 65 2b 80 00 00 	movabs $0x802b65,%rax
  8035f0:	00 00 00 
  8035f3:	ff d0                	callq  *%rax
  8035f5:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8035f8:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8035fc:	0f 8f 5f ff ff ff    	jg     803561 <copy+0xc4>
  803602:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  803606:	79 47                	jns    80364f <copy+0x1b2>
  803608:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80360b:	89 c6                	mov    %eax,%esi
  80360d:	48 bf 2f 50 80 00 00 	movabs $0x80502f,%rdi
  803614:	00 00 00 
  803617:	b8 00 00 00 00       	mov    $0x0,%eax
  80361c:	48 ba ad 04 80 00 00 	movabs $0x8004ad,%rdx
  803623:	00 00 00 
  803626:	ff d2                	callq  *%rdx
  803628:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80362b:	89 c7                	mov    %eax,%edi
  80362d:	48 b8 43 29 80 00 00 	movabs $0x802943,%rax
  803634:	00 00 00 
  803637:	ff d0                	callq  *%rax
  803639:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80363c:	89 c7                	mov    %eax,%edi
  80363e:	48 b8 43 29 80 00 00 	movabs $0x802943,%rax
  803645:	00 00 00 
  803648:	ff d0                	callq  *%rax
  80364a:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80364d:	eb 27                	jmp    803676 <copy+0x1d9>
  80364f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803652:	89 c7                	mov    %eax,%edi
  803654:	48 b8 43 29 80 00 00 	movabs $0x802943,%rax
  80365b:	00 00 00 
  80365e:	ff d0                	callq  *%rax
  803660:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803663:	89 c7                	mov    %eax,%edi
  803665:	48 b8 43 29 80 00 00 	movabs $0x802943,%rax
  80366c:	00 00 00 
  80366f:	ff d0                	callq  *%rax
  803671:	b8 00 00 00 00       	mov    $0x0,%eax
  803676:	c9                   	leaveq 
  803677:	c3                   	retq   

0000000000803678 <fd2sockid>:
  803678:	55                   	push   %rbp
  803679:	48 89 e5             	mov    %rsp,%rbp
  80367c:	48 83 ec 20          	sub    $0x20,%rsp
  803680:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803683:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803687:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80368a:	48 89 d6             	mov    %rdx,%rsi
  80368d:	89 c7                	mov    %eax,%edi
  80368f:	48 b8 33 27 80 00 00 	movabs $0x802733,%rax
  803696:	00 00 00 
  803699:	ff d0                	callq  *%rax
  80369b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80369e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8036a2:	79 05                	jns    8036a9 <fd2sockid+0x31>
  8036a4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036a7:	eb 24                	jmp    8036cd <fd2sockid+0x55>
  8036a9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8036ad:	8b 10                	mov    (%rax),%edx
  8036af:	48 b8 a0 70 80 00 00 	movabs $0x8070a0,%rax
  8036b6:	00 00 00 
  8036b9:	8b 00                	mov    (%rax),%eax
  8036bb:	39 c2                	cmp    %eax,%edx
  8036bd:	74 07                	je     8036c6 <fd2sockid+0x4e>
  8036bf:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8036c4:	eb 07                	jmp    8036cd <fd2sockid+0x55>
  8036c6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8036ca:	8b 40 0c             	mov    0xc(%rax),%eax
  8036cd:	c9                   	leaveq 
  8036ce:	c3                   	retq   

00000000008036cf <alloc_sockfd>:
  8036cf:	55                   	push   %rbp
  8036d0:	48 89 e5             	mov    %rsp,%rbp
  8036d3:	48 83 ec 20          	sub    $0x20,%rsp
  8036d7:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8036da:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8036de:	48 89 c7             	mov    %rax,%rdi
  8036e1:	48 b8 9b 26 80 00 00 	movabs $0x80269b,%rax
  8036e8:	00 00 00 
  8036eb:	ff d0                	callq  *%rax
  8036ed:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8036f0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8036f4:	78 26                	js     80371c <alloc_sockfd+0x4d>
  8036f6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8036fa:	ba 07 04 00 00       	mov    $0x407,%edx
  8036ff:	48 89 c6             	mov    %rax,%rsi
  803702:	bf 00 00 00 00       	mov    $0x0,%edi
  803707:	48 b8 91 19 80 00 00 	movabs $0x801991,%rax
  80370e:	00 00 00 
  803711:	ff d0                	callq  *%rax
  803713:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803716:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80371a:	79 16                	jns    803732 <alloc_sockfd+0x63>
  80371c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80371f:	89 c7                	mov    %eax,%edi
  803721:	48 b8 dc 3b 80 00 00 	movabs $0x803bdc,%rax
  803728:	00 00 00 
  80372b:	ff d0                	callq  *%rax
  80372d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803730:	eb 3a                	jmp    80376c <alloc_sockfd+0x9d>
  803732:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803736:	48 ba a0 70 80 00 00 	movabs $0x8070a0,%rdx
  80373d:	00 00 00 
  803740:	8b 12                	mov    (%rdx),%edx
  803742:	89 10                	mov    %edx,(%rax)
  803744:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803748:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  80374f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803753:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803756:	89 50 0c             	mov    %edx,0xc(%rax)
  803759:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80375d:	48 89 c7             	mov    %rax,%rdi
  803760:	48 b8 4d 26 80 00 00 	movabs $0x80264d,%rax
  803767:	00 00 00 
  80376a:	ff d0                	callq  *%rax
  80376c:	c9                   	leaveq 
  80376d:	c3                   	retq   

000000000080376e <accept>:
  80376e:	55                   	push   %rbp
  80376f:	48 89 e5             	mov    %rsp,%rbp
  803772:	48 83 ec 30          	sub    $0x30,%rsp
  803776:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803779:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80377d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803781:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803784:	89 c7                	mov    %eax,%edi
  803786:	48 b8 78 36 80 00 00 	movabs $0x803678,%rax
  80378d:	00 00 00 
  803790:	ff d0                	callq  *%rax
  803792:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803795:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803799:	79 05                	jns    8037a0 <accept+0x32>
  80379b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80379e:	eb 3b                	jmp    8037db <accept+0x6d>
  8037a0:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8037a4:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8037a8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037ab:	48 89 ce             	mov    %rcx,%rsi
  8037ae:	89 c7                	mov    %eax,%edi
  8037b0:	48 b8 b9 3a 80 00 00 	movabs $0x803ab9,%rax
  8037b7:	00 00 00 
  8037ba:	ff d0                	callq  *%rax
  8037bc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8037bf:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8037c3:	79 05                	jns    8037ca <accept+0x5c>
  8037c5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037c8:	eb 11                	jmp    8037db <accept+0x6d>
  8037ca:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037cd:	89 c7                	mov    %eax,%edi
  8037cf:	48 b8 cf 36 80 00 00 	movabs $0x8036cf,%rax
  8037d6:	00 00 00 
  8037d9:	ff d0                	callq  *%rax
  8037db:	c9                   	leaveq 
  8037dc:	c3                   	retq   

00000000008037dd <bind>:
  8037dd:	55                   	push   %rbp
  8037de:	48 89 e5             	mov    %rsp,%rbp
  8037e1:	48 83 ec 20          	sub    $0x20,%rsp
  8037e5:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8037e8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8037ec:	89 55 e8             	mov    %edx,-0x18(%rbp)
  8037ef:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8037f2:	89 c7                	mov    %eax,%edi
  8037f4:	48 b8 78 36 80 00 00 	movabs $0x803678,%rax
  8037fb:	00 00 00 
  8037fe:	ff d0                	callq  *%rax
  803800:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803803:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803807:	79 05                	jns    80380e <bind+0x31>
  803809:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80380c:	eb 1b                	jmp    803829 <bind+0x4c>
  80380e:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803811:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803815:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803818:	48 89 ce             	mov    %rcx,%rsi
  80381b:	89 c7                	mov    %eax,%edi
  80381d:	48 b8 38 3b 80 00 00 	movabs $0x803b38,%rax
  803824:	00 00 00 
  803827:	ff d0                	callq  *%rax
  803829:	c9                   	leaveq 
  80382a:	c3                   	retq   

000000000080382b <shutdown>:
  80382b:	55                   	push   %rbp
  80382c:	48 89 e5             	mov    %rsp,%rbp
  80382f:	48 83 ec 20          	sub    $0x20,%rsp
  803833:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803836:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803839:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80383c:	89 c7                	mov    %eax,%edi
  80383e:	48 b8 78 36 80 00 00 	movabs $0x803678,%rax
  803845:	00 00 00 
  803848:	ff d0                	callq  *%rax
  80384a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80384d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803851:	79 05                	jns    803858 <shutdown+0x2d>
  803853:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803856:	eb 16                	jmp    80386e <shutdown+0x43>
  803858:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80385b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80385e:	89 d6                	mov    %edx,%esi
  803860:	89 c7                	mov    %eax,%edi
  803862:	48 b8 9c 3b 80 00 00 	movabs $0x803b9c,%rax
  803869:	00 00 00 
  80386c:	ff d0                	callq  *%rax
  80386e:	c9                   	leaveq 
  80386f:	c3                   	retq   

0000000000803870 <devsock_close>:
  803870:	55                   	push   %rbp
  803871:	48 89 e5             	mov    %rsp,%rbp
  803874:	48 83 ec 10          	sub    $0x10,%rsp
  803878:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80387c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803880:	48 89 c7             	mov    %rax,%rdi
  803883:	48 b8 28 48 80 00 00 	movabs $0x804828,%rax
  80388a:	00 00 00 
  80388d:	ff d0                	callq  *%rax
  80388f:	83 f8 01             	cmp    $0x1,%eax
  803892:	75 17                	jne    8038ab <devsock_close+0x3b>
  803894:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803898:	8b 40 0c             	mov    0xc(%rax),%eax
  80389b:	89 c7                	mov    %eax,%edi
  80389d:	48 b8 dc 3b 80 00 00 	movabs $0x803bdc,%rax
  8038a4:	00 00 00 
  8038a7:	ff d0                	callq  *%rax
  8038a9:	eb 05                	jmp    8038b0 <devsock_close+0x40>
  8038ab:	b8 00 00 00 00       	mov    $0x0,%eax
  8038b0:	c9                   	leaveq 
  8038b1:	c3                   	retq   

00000000008038b2 <connect>:
  8038b2:	55                   	push   %rbp
  8038b3:	48 89 e5             	mov    %rsp,%rbp
  8038b6:	48 83 ec 20          	sub    $0x20,%rsp
  8038ba:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8038bd:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8038c1:	89 55 e8             	mov    %edx,-0x18(%rbp)
  8038c4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8038c7:	89 c7                	mov    %eax,%edi
  8038c9:	48 b8 78 36 80 00 00 	movabs $0x803678,%rax
  8038d0:	00 00 00 
  8038d3:	ff d0                	callq  *%rax
  8038d5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8038d8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8038dc:	79 05                	jns    8038e3 <connect+0x31>
  8038de:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038e1:	eb 1b                	jmp    8038fe <connect+0x4c>
  8038e3:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8038e6:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8038ea:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038ed:	48 89 ce             	mov    %rcx,%rsi
  8038f0:	89 c7                	mov    %eax,%edi
  8038f2:	48 b8 09 3c 80 00 00 	movabs $0x803c09,%rax
  8038f9:	00 00 00 
  8038fc:	ff d0                	callq  *%rax
  8038fe:	c9                   	leaveq 
  8038ff:	c3                   	retq   

0000000000803900 <listen>:
  803900:	55                   	push   %rbp
  803901:	48 89 e5             	mov    %rsp,%rbp
  803904:	48 83 ec 20          	sub    $0x20,%rsp
  803908:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80390b:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80390e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803911:	89 c7                	mov    %eax,%edi
  803913:	48 b8 78 36 80 00 00 	movabs $0x803678,%rax
  80391a:	00 00 00 
  80391d:	ff d0                	callq  *%rax
  80391f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803922:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803926:	79 05                	jns    80392d <listen+0x2d>
  803928:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80392b:	eb 16                	jmp    803943 <listen+0x43>
  80392d:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803930:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803933:	89 d6                	mov    %edx,%esi
  803935:	89 c7                	mov    %eax,%edi
  803937:	48 b8 6d 3c 80 00 00 	movabs $0x803c6d,%rax
  80393e:	00 00 00 
  803941:	ff d0                	callq  *%rax
  803943:	c9                   	leaveq 
  803944:	c3                   	retq   

0000000000803945 <devsock_read>:
  803945:	55                   	push   %rbp
  803946:	48 89 e5             	mov    %rsp,%rbp
  803949:	48 83 ec 20          	sub    $0x20,%rsp
  80394d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803951:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803955:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803959:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80395d:	89 c2                	mov    %eax,%edx
  80395f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803963:	8b 40 0c             	mov    0xc(%rax),%eax
  803966:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  80396a:	b9 00 00 00 00       	mov    $0x0,%ecx
  80396f:	89 c7                	mov    %eax,%edi
  803971:	48 b8 ad 3c 80 00 00 	movabs $0x803cad,%rax
  803978:	00 00 00 
  80397b:	ff d0                	callq  *%rax
  80397d:	c9                   	leaveq 
  80397e:	c3                   	retq   

000000000080397f <devsock_write>:
  80397f:	55                   	push   %rbp
  803980:	48 89 e5             	mov    %rsp,%rbp
  803983:	48 83 ec 20          	sub    $0x20,%rsp
  803987:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80398b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80398f:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803993:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803997:	89 c2                	mov    %eax,%edx
  803999:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80399d:	8b 40 0c             	mov    0xc(%rax),%eax
  8039a0:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  8039a4:	b9 00 00 00 00       	mov    $0x0,%ecx
  8039a9:	89 c7                	mov    %eax,%edi
  8039ab:	48 b8 79 3d 80 00 00 	movabs $0x803d79,%rax
  8039b2:	00 00 00 
  8039b5:	ff d0                	callq  *%rax
  8039b7:	c9                   	leaveq 
  8039b8:	c3                   	retq   

00000000008039b9 <devsock_stat>:
  8039b9:	55                   	push   %rbp
  8039ba:	48 89 e5             	mov    %rsp,%rbp
  8039bd:	48 83 ec 10          	sub    $0x10,%rsp
  8039c1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8039c5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8039c9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8039cd:	48 be 4a 50 80 00 00 	movabs $0x80504a,%rsi
  8039d4:	00 00 00 
  8039d7:	48 89 c7             	mov    %rax,%rdi
  8039da:	48 b8 62 10 80 00 00 	movabs $0x801062,%rax
  8039e1:	00 00 00 
  8039e4:	ff d0                	callq  *%rax
  8039e6:	b8 00 00 00 00       	mov    $0x0,%eax
  8039eb:	c9                   	leaveq 
  8039ec:	c3                   	retq   

00000000008039ed <socket>:
  8039ed:	55                   	push   %rbp
  8039ee:	48 89 e5             	mov    %rsp,%rbp
  8039f1:	48 83 ec 20          	sub    $0x20,%rsp
  8039f5:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8039f8:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8039fb:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  8039fe:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803a01:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803a04:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803a07:	89 ce                	mov    %ecx,%esi
  803a09:	89 c7                	mov    %eax,%edi
  803a0b:	48 b8 31 3e 80 00 00 	movabs $0x803e31,%rax
  803a12:	00 00 00 
  803a15:	ff d0                	callq  *%rax
  803a17:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803a1a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803a1e:	79 05                	jns    803a25 <socket+0x38>
  803a20:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a23:	eb 11                	jmp    803a36 <socket+0x49>
  803a25:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a28:	89 c7                	mov    %eax,%edi
  803a2a:	48 b8 cf 36 80 00 00 	movabs $0x8036cf,%rax
  803a31:	00 00 00 
  803a34:	ff d0                	callq  *%rax
  803a36:	c9                   	leaveq 
  803a37:	c3                   	retq   

0000000000803a38 <nsipc>:
  803a38:	55                   	push   %rbp
  803a39:	48 89 e5             	mov    %rsp,%rbp
  803a3c:	48 83 ec 10          	sub    $0x10,%rsp
  803a40:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803a43:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803a4a:	00 00 00 
  803a4d:	8b 00                	mov    (%rax),%eax
  803a4f:	85 c0                	test   %eax,%eax
  803a51:	75 1d                	jne    803a70 <nsipc+0x38>
  803a53:	bf 02 00 00 00       	mov    $0x2,%edi
  803a58:	48 b8 db 25 80 00 00 	movabs $0x8025db,%rax
  803a5f:	00 00 00 
  803a62:	ff d0                	callq  *%rax
  803a64:	48 ba 04 80 80 00 00 	movabs $0x808004,%rdx
  803a6b:	00 00 00 
  803a6e:	89 02                	mov    %eax,(%rdx)
  803a70:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803a77:	00 00 00 
  803a7a:	8b 00                	mov    (%rax),%eax
  803a7c:	8b 75 fc             	mov    -0x4(%rbp),%esi
  803a7f:	b9 07 00 00 00       	mov    $0x7,%ecx
  803a84:	48 ba 00 b0 80 00 00 	movabs $0x80b000,%rdx
  803a8b:	00 00 00 
  803a8e:	89 c7                	mov    %eax,%edi
  803a90:	48 b8 45 25 80 00 00 	movabs $0x802545,%rax
  803a97:	00 00 00 
  803a9a:	ff d0                	callq  *%rax
  803a9c:	ba 00 00 00 00       	mov    $0x0,%edx
  803aa1:	be 00 00 00 00       	mov    $0x0,%esi
  803aa6:	bf 00 00 00 00       	mov    $0x0,%edi
  803aab:	48 b8 84 24 80 00 00 	movabs $0x802484,%rax
  803ab2:	00 00 00 
  803ab5:	ff d0                	callq  *%rax
  803ab7:	c9                   	leaveq 
  803ab8:	c3                   	retq   

0000000000803ab9 <nsipc_accept>:
  803ab9:	55                   	push   %rbp
  803aba:	48 89 e5             	mov    %rsp,%rbp
  803abd:	48 83 ec 30          	sub    $0x30,%rsp
  803ac1:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803ac4:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803ac8:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803acc:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803ad3:	00 00 00 
  803ad6:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803ad9:	89 10                	mov    %edx,(%rax)
  803adb:	bf 01 00 00 00       	mov    $0x1,%edi
  803ae0:	48 b8 38 3a 80 00 00 	movabs $0x803a38,%rax
  803ae7:	00 00 00 
  803aea:	ff d0                	callq  *%rax
  803aec:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803aef:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803af3:	78 3e                	js     803b33 <nsipc_accept+0x7a>
  803af5:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803afc:	00 00 00 
  803aff:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803b03:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b07:	8b 40 10             	mov    0x10(%rax),%eax
  803b0a:	89 c2                	mov    %eax,%edx
  803b0c:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  803b10:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803b14:	48 89 ce             	mov    %rcx,%rsi
  803b17:	48 89 c7             	mov    %rax,%rdi
  803b1a:	48 b8 86 13 80 00 00 	movabs $0x801386,%rax
  803b21:	00 00 00 
  803b24:	ff d0                	callq  *%rax
  803b26:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b2a:	8b 50 10             	mov    0x10(%rax),%edx
  803b2d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803b31:	89 10                	mov    %edx,(%rax)
  803b33:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b36:	c9                   	leaveq 
  803b37:	c3                   	retq   

0000000000803b38 <nsipc_bind>:
  803b38:	55                   	push   %rbp
  803b39:	48 89 e5             	mov    %rsp,%rbp
  803b3c:	48 83 ec 10          	sub    $0x10,%rsp
  803b40:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803b43:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803b47:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803b4a:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803b51:	00 00 00 
  803b54:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803b57:	89 10                	mov    %edx,(%rax)
  803b59:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803b5c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b60:	48 89 c6             	mov    %rax,%rsi
  803b63:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803b6a:	00 00 00 
  803b6d:	48 b8 86 13 80 00 00 	movabs $0x801386,%rax
  803b74:	00 00 00 
  803b77:	ff d0                	callq  *%rax
  803b79:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803b80:	00 00 00 
  803b83:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803b86:	89 50 14             	mov    %edx,0x14(%rax)
  803b89:	bf 02 00 00 00       	mov    $0x2,%edi
  803b8e:	48 b8 38 3a 80 00 00 	movabs $0x803a38,%rax
  803b95:	00 00 00 
  803b98:	ff d0                	callq  *%rax
  803b9a:	c9                   	leaveq 
  803b9b:	c3                   	retq   

0000000000803b9c <nsipc_shutdown>:
  803b9c:	55                   	push   %rbp
  803b9d:	48 89 e5             	mov    %rsp,%rbp
  803ba0:	48 83 ec 10          	sub    $0x10,%rsp
  803ba4:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803ba7:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803baa:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803bb1:	00 00 00 
  803bb4:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803bb7:	89 10                	mov    %edx,(%rax)
  803bb9:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803bc0:	00 00 00 
  803bc3:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803bc6:	89 50 04             	mov    %edx,0x4(%rax)
  803bc9:	bf 03 00 00 00       	mov    $0x3,%edi
  803bce:	48 b8 38 3a 80 00 00 	movabs $0x803a38,%rax
  803bd5:	00 00 00 
  803bd8:	ff d0                	callq  *%rax
  803bda:	c9                   	leaveq 
  803bdb:	c3                   	retq   

0000000000803bdc <nsipc_close>:
  803bdc:	55                   	push   %rbp
  803bdd:	48 89 e5             	mov    %rsp,%rbp
  803be0:	48 83 ec 10          	sub    $0x10,%rsp
  803be4:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803be7:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803bee:	00 00 00 
  803bf1:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803bf4:	89 10                	mov    %edx,(%rax)
  803bf6:	bf 04 00 00 00       	mov    $0x4,%edi
  803bfb:	48 b8 38 3a 80 00 00 	movabs $0x803a38,%rax
  803c02:	00 00 00 
  803c05:	ff d0                	callq  *%rax
  803c07:	c9                   	leaveq 
  803c08:	c3                   	retq   

0000000000803c09 <nsipc_connect>:
  803c09:	55                   	push   %rbp
  803c0a:	48 89 e5             	mov    %rsp,%rbp
  803c0d:	48 83 ec 10          	sub    $0x10,%rsp
  803c11:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803c14:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803c18:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803c1b:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c22:	00 00 00 
  803c25:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803c28:	89 10                	mov    %edx,(%rax)
  803c2a:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803c2d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803c31:	48 89 c6             	mov    %rax,%rsi
  803c34:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803c3b:	00 00 00 
  803c3e:	48 b8 86 13 80 00 00 	movabs $0x801386,%rax
  803c45:	00 00 00 
  803c48:	ff d0                	callq  *%rax
  803c4a:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c51:	00 00 00 
  803c54:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803c57:	89 50 14             	mov    %edx,0x14(%rax)
  803c5a:	bf 05 00 00 00       	mov    $0x5,%edi
  803c5f:	48 b8 38 3a 80 00 00 	movabs $0x803a38,%rax
  803c66:	00 00 00 
  803c69:	ff d0                	callq  *%rax
  803c6b:	c9                   	leaveq 
  803c6c:	c3                   	retq   

0000000000803c6d <nsipc_listen>:
  803c6d:	55                   	push   %rbp
  803c6e:	48 89 e5             	mov    %rsp,%rbp
  803c71:	48 83 ec 10          	sub    $0x10,%rsp
  803c75:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803c78:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803c7b:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c82:	00 00 00 
  803c85:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803c88:	89 10                	mov    %edx,(%rax)
  803c8a:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c91:	00 00 00 
  803c94:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803c97:	89 50 04             	mov    %edx,0x4(%rax)
  803c9a:	bf 06 00 00 00       	mov    $0x6,%edi
  803c9f:	48 b8 38 3a 80 00 00 	movabs $0x803a38,%rax
  803ca6:	00 00 00 
  803ca9:	ff d0                	callq  *%rax
  803cab:	c9                   	leaveq 
  803cac:	c3                   	retq   

0000000000803cad <nsipc_recv>:
  803cad:	55                   	push   %rbp
  803cae:	48 89 e5             	mov    %rsp,%rbp
  803cb1:	48 83 ec 30          	sub    $0x30,%rsp
  803cb5:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803cb8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803cbc:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803cbf:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  803cc2:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803cc9:	00 00 00 
  803ccc:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803ccf:	89 10                	mov    %edx,(%rax)
  803cd1:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803cd8:	00 00 00 
  803cdb:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803cde:	89 50 04             	mov    %edx,0x4(%rax)
  803ce1:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803ce8:	00 00 00 
  803ceb:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803cee:	89 50 08             	mov    %edx,0x8(%rax)
  803cf1:	bf 07 00 00 00       	mov    $0x7,%edi
  803cf6:	48 b8 38 3a 80 00 00 	movabs $0x803a38,%rax
  803cfd:	00 00 00 
  803d00:	ff d0                	callq  *%rax
  803d02:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803d05:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803d09:	78 69                	js     803d74 <nsipc_recv+0xc7>
  803d0b:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  803d12:	7f 08                	jg     803d1c <nsipc_recv+0x6f>
  803d14:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d17:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  803d1a:	7e 35                	jle    803d51 <nsipc_recv+0xa4>
  803d1c:	48 b9 51 50 80 00 00 	movabs $0x805051,%rcx
  803d23:	00 00 00 
  803d26:	48 ba 66 50 80 00 00 	movabs $0x805066,%rdx
  803d2d:	00 00 00 
  803d30:	be 62 00 00 00       	mov    $0x62,%esi
  803d35:	48 bf 7b 50 80 00 00 	movabs $0x80507b,%rdi
  803d3c:	00 00 00 
  803d3f:	b8 00 00 00 00       	mov    $0x0,%eax
  803d44:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  803d4b:	00 00 00 
  803d4e:	41 ff d0             	callq  *%r8
  803d51:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d54:	48 63 d0             	movslq %eax,%rdx
  803d57:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803d5b:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  803d62:	00 00 00 
  803d65:	48 89 c7             	mov    %rax,%rdi
  803d68:	48 b8 86 13 80 00 00 	movabs $0x801386,%rax
  803d6f:	00 00 00 
  803d72:	ff d0                	callq  *%rax
  803d74:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d77:	c9                   	leaveq 
  803d78:	c3                   	retq   

0000000000803d79 <nsipc_send>:
  803d79:	55                   	push   %rbp
  803d7a:	48 89 e5             	mov    %rsp,%rbp
  803d7d:	48 83 ec 20          	sub    $0x20,%rsp
  803d81:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803d84:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803d88:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803d8b:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  803d8e:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d95:	00 00 00 
  803d98:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803d9b:	89 10                	mov    %edx,(%rax)
  803d9d:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  803da4:	7e 35                	jle    803ddb <nsipc_send+0x62>
  803da6:	48 b9 8a 50 80 00 00 	movabs $0x80508a,%rcx
  803dad:	00 00 00 
  803db0:	48 ba 66 50 80 00 00 	movabs $0x805066,%rdx
  803db7:	00 00 00 
  803dba:	be 6d 00 00 00       	mov    $0x6d,%esi
  803dbf:	48 bf 7b 50 80 00 00 	movabs $0x80507b,%rdi
  803dc6:	00 00 00 
  803dc9:	b8 00 00 00 00       	mov    $0x0,%eax
  803dce:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  803dd5:	00 00 00 
  803dd8:	41 ff d0             	callq  *%r8
  803ddb:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803dde:	48 63 d0             	movslq %eax,%rdx
  803de1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803de5:	48 89 c6             	mov    %rax,%rsi
  803de8:	48 bf 0c b0 80 00 00 	movabs $0x80b00c,%rdi
  803def:	00 00 00 
  803df2:	48 b8 86 13 80 00 00 	movabs $0x801386,%rax
  803df9:	00 00 00 
  803dfc:	ff d0                	callq  *%rax
  803dfe:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e05:	00 00 00 
  803e08:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803e0b:	89 50 04             	mov    %edx,0x4(%rax)
  803e0e:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e15:	00 00 00 
  803e18:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803e1b:	89 50 08             	mov    %edx,0x8(%rax)
  803e1e:	bf 08 00 00 00       	mov    $0x8,%edi
  803e23:	48 b8 38 3a 80 00 00 	movabs $0x803a38,%rax
  803e2a:	00 00 00 
  803e2d:	ff d0                	callq  *%rax
  803e2f:	c9                   	leaveq 
  803e30:	c3                   	retq   

0000000000803e31 <nsipc_socket>:
  803e31:	55                   	push   %rbp
  803e32:	48 89 e5             	mov    %rsp,%rbp
  803e35:	48 83 ec 10          	sub    $0x10,%rsp
  803e39:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803e3c:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803e3f:	89 55 f4             	mov    %edx,-0xc(%rbp)
  803e42:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e49:	00 00 00 
  803e4c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803e4f:	89 10                	mov    %edx,(%rax)
  803e51:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e58:	00 00 00 
  803e5b:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803e5e:	89 50 04             	mov    %edx,0x4(%rax)
  803e61:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e68:	00 00 00 
  803e6b:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803e6e:	89 50 08             	mov    %edx,0x8(%rax)
  803e71:	bf 09 00 00 00       	mov    $0x9,%edi
  803e76:	48 b8 38 3a 80 00 00 	movabs $0x803a38,%rax
  803e7d:	00 00 00 
  803e80:	ff d0                	callq  *%rax
  803e82:	c9                   	leaveq 
  803e83:	c3                   	retq   

0000000000803e84 <pipe>:
  803e84:	55                   	push   %rbp
  803e85:	48 89 e5             	mov    %rsp,%rbp
  803e88:	53                   	push   %rbx
  803e89:	48 83 ec 38          	sub    $0x38,%rsp
  803e8d:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  803e91:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  803e95:	48 89 c7             	mov    %rax,%rdi
  803e98:	48 b8 9b 26 80 00 00 	movabs $0x80269b,%rax
  803e9f:	00 00 00 
  803ea2:	ff d0                	callq  *%rax
  803ea4:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803ea7:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803eab:	0f 88 bf 01 00 00    	js     804070 <pipe+0x1ec>
  803eb1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803eb5:	ba 07 04 00 00       	mov    $0x407,%edx
  803eba:	48 89 c6             	mov    %rax,%rsi
  803ebd:	bf 00 00 00 00       	mov    $0x0,%edi
  803ec2:	48 b8 91 19 80 00 00 	movabs $0x801991,%rax
  803ec9:	00 00 00 
  803ecc:	ff d0                	callq  *%rax
  803ece:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803ed1:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803ed5:	0f 88 95 01 00 00    	js     804070 <pipe+0x1ec>
  803edb:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  803edf:	48 89 c7             	mov    %rax,%rdi
  803ee2:	48 b8 9b 26 80 00 00 	movabs $0x80269b,%rax
  803ee9:	00 00 00 
  803eec:	ff d0                	callq  *%rax
  803eee:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803ef1:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803ef5:	0f 88 5d 01 00 00    	js     804058 <pipe+0x1d4>
  803efb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803eff:	ba 07 04 00 00       	mov    $0x407,%edx
  803f04:	48 89 c6             	mov    %rax,%rsi
  803f07:	bf 00 00 00 00       	mov    $0x0,%edi
  803f0c:	48 b8 91 19 80 00 00 	movabs $0x801991,%rax
  803f13:	00 00 00 
  803f16:	ff d0                	callq  *%rax
  803f18:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803f1b:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803f1f:	0f 88 33 01 00 00    	js     804058 <pipe+0x1d4>
  803f25:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803f29:	48 89 c7             	mov    %rax,%rdi
  803f2c:	48 b8 70 26 80 00 00 	movabs $0x802670,%rax
  803f33:	00 00 00 
  803f36:	ff d0                	callq  *%rax
  803f38:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803f3c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803f40:	ba 07 04 00 00       	mov    $0x407,%edx
  803f45:	48 89 c6             	mov    %rax,%rsi
  803f48:	bf 00 00 00 00       	mov    $0x0,%edi
  803f4d:	48 b8 91 19 80 00 00 	movabs $0x801991,%rax
  803f54:	00 00 00 
  803f57:	ff d0                	callq  *%rax
  803f59:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803f5c:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803f60:	79 05                	jns    803f67 <pipe+0xe3>
  803f62:	e9 d9 00 00 00       	jmpq   804040 <pipe+0x1bc>
  803f67:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803f6b:	48 89 c7             	mov    %rax,%rdi
  803f6e:	48 b8 70 26 80 00 00 	movabs $0x802670,%rax
  803f75:	00 00 00 
  803f78:	ff d0                	callq  *%rax
  803f7a:	48 89 c2             	mov    %rax,%rdx
  803f7d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803f81:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  803f87:	48 89 d1             	mov    %rdx,%rcx
  803f8a:	ba 00 00 00 00       	mov    $0x0,%edx
  803f8f:	48 89 c6             	mov    %rax,%rsi
  803f92:	bf 00 00 00 00       	mov    $0x0,%edi
  803f97:	48 b8 e1 19 80 00 00 	movabs $0x8019e1,%rax
  803f9e:	00 00 00 
  803fa1:	ff d0                	callq  *%rax
  803fa3:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803fa6:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803faa:	79 1b                	jns    803fc7 <pipe+0x143>
  803fac:	90                   	nop
  803fad:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803fb1:	48 89 c6             	mov    %rax,%rsi
  803fb4:	bf 00 00 00 00       	mov    $0x0,%edi
  803fb9:	48 b8 3c 1a 80 00 00 	movabs $0x801a3c,%rax
  803fc0:	00 00 00 
  803fc3:	ff d0                	callq  *%rax
  803fc5:	eb 79                	jmp    804040 <pipe+0x1bc>
  803fc7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803fcb:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  803fd2:	00 00 00 
  803fd5:	8b 12                	mov    (%rdx),%edx
  803fd7:	89 10                	mov    %edx,(%rax)
  803fd9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803fdd:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  803fe4:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803fe8:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  803fef:	00 00 00 
  803ff2:	8b 12                	mov    (%rdx),%edx
  803ff4:	89 10                	mov    %edx,(%rax)
  803ff6:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803ffa:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  804001:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804005:	48 89 c7             	mov    %rax,%rdi
  804008:	48 b8 4d 26 80 00 00 	movabs $0x80264d,%rax
  80400f:	00 00 00 
  804012:	ff d0                	callq  *%rax
  804014:	89 c2                	mov    %eax,%edx
  804016:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80401a:	89 10                	mov    %edx,(%rax)
  80401c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  804020:	48 8d 58 04          	lea    0x4(%rax),%rbx
  804024:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804028:	48 89 c7             	mov    %rax,%rdi
  80402b:	48 b8 4d 26 80 00 00 	movabs $0x80264d,%rax
  804032:	00 00 00 
  804035:	ff d0                	callq  *%rax
  804037:	89 03                	mov    %eax,(%rbx)
  804039:	b8 00 00 00 00       	mov    $0x0,%eax
  80403e:	eb 33                	jmp    804073 <pipe+0x1ef>
  804040:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804044:	48 89 c6             	mov    %rax,%rsi
  804047:	bf 00 00 00 00       	mov    $0x0,%edi
  80404c:	48 b8 3c 1a 80 00 00 	movabs $0x801a3c,%rax
  804053:	00 00 00 
  804056:	ff d0                	callq  *%rax
  804058:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80405c:	48 89 c6             	mov    %rax,%rsi
  80405f:	bf 00 00 00 00       	mov    $0x0,%edi
  804064:	48 b8 3c 1a 80 00 00 	movabs $0x801a3c,%rax
  80406b:	00 00 00 
  80406e:	ff d0                	callq  *%rax
  804070:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804073:	48 83 c4 38          	add    $0x38,%rsp
  804077:	5b                   	pop    %rbx
  804078:	5d                   	pop    %rbp
  804079:	c3                   	retq   

000000000080407a <_pipeisclosed>:
  80407a:	55                   	push   %rbp
  80407b:	48 89 e5             	mov    %rsp,%rbp
  80407e:	53                   	push   %rbx
  80407f:	48 83 ec 28          	sub    $0x28,%rsp
  804083:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804087:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80408b:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  804092:	00 00 00 
  804095:	48 8b 00             	mov    (%rax),%rax
  804098:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80409e:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8040a1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8040a5:	48 89 c7             	mov    %rax,%rdi
  8040a8:	48 b8 28 48 80 00 00 	movabs $0x804828,%rax
  8040af:	00 00 00 
  8040b2:	ff d0                	callq  *%rax
  8040b4:	89 c3                	mov    %eax,%ebx
  8040b6:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8040ba:	48 89 c7             	mov    %rax,%rdi
  8040bd:	48 b8 28 48 80 00 00 	movabs $0x804828,%rax
  8040c4:	00 00 00 
  8040c7:	ff d0                	callq  *%rax
  8040c9:	39 c3                	cmp    %eax,%ebx
  8040cb:	0f 94 c0             	sete   %al
  8040ce:	0f b6 c0             	movzbl %al,%eax
  8040d1:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8040d4:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8040db:	00 00 00 
  8040de:	48 8b 00             	mov    (%rax),%rax
  8040e1:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8040e7:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  8040ea:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8040ed:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  8040f0:	75 05                	jne    8040f7 <_pipeisclosed+0x7d>
  8040f2:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8040f5:	eb 4f                	jmp    804146 <_pipeisclosed+0xcc>
  8040f7:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8040fa:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  8040fd:	74 42                	je     804141 <_pipeisclosed+0xc7>
  8040ff:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  804103:	75 3c                	jne    804141 <_pipeisclosed+0xc7>
  804105:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80410c:	00 00 00 
  80410f:	48 8b 00             	mov    (%rax),%rax
  804112:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  804118:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  80411b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80411e:	89 c6                	mov    %eax,%esi
  804120:	48 bf 9b 50 80 00 00 	movabs $0x80509b,%rdi
  804127:	00 00 00 
  80412a:	b8 00 00 00 00       	mov    $0x0,%eax
  80412f:	49 b8 ad 04 80 00 00 	movabs $0x8004ad,%r8
  804136:	00 00 00 
  804139:	41 ff d0             	callq  *%r8
  80413c:	e9 4a ff ff ff       	jmpq   80408b <_pipeisclosed+0x11>
  804141:	e9 45 ff ff ff       	jmpq   80408b <_pipeisclosed+0x11>
  804146:	48 83 c4 28          	add    $0x28,%rsp
  80414a:	5b                   	pop    %rbx
  80414b:	5d                   	pop    %rbp
  80414c:	c3                   	retq   

000000000080414d <pipeisclosed>:
  80414d:	55                   	push   %rbp
  80414e:	48 89 e5             	mov    %rsp,%rbp
  804151:	48 83 ec 30          	sub    $0x30,%rsp
  804155:	89 7d dc             	mov    %edi,-0x24(%rbp)
  804158:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80415c:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80415f:	48 89 d6             	mov    %rdx,%rsi
  804162:	89 c7                	mov    %eax,%edi
  804164:	48 b8 33 27 80 00 00 	movabs $0x802733,%rax
  80416b:	00 00 00 
  80416e:	ff d0                	callq  *%rax
  804170:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804173:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804177:	79 05                	jns    80417e <pipeisclosed+0x31>
  804179:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80417c:	eb 31                	jmp    8041af <pipeisclosed+0x62>
  80417e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804182:	48 89 c7             	mov    %rax,%rdi
  804185:	48 b8 70 26 80 00 00 	movabs $0x802670,%rax
  80418c:	00 00 00 
  80418f:	ff d0                	callq  *%rax
  804191:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804195:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804199:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80419d:	48 89 d6             	mov    %rdx,%rsi
  8041a0:	48 89 c7             	mov    %rax,%rdi
  8041a3:	48 b8 7a 40 80 00 00 	movabs $0x80407a,%rax
  8041aa:	00 00 00 
  8041ad:	ff d0                	callq  *%rax
  8041af:	c9                   	leaveq 
  8041b0:	c3                   	retq   

00000000008041b1 <devpipe_read>:
  8041b1:	55                   	push   %rbp
  8041b2:	48 89 e5             	mov    %rsp,%rbp
  8041b5:	48 83 ec 40          	sub    $0x40,%rsp
  8041b9:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8041bd:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8041c1:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8041c5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8041c9:	48 89 c7             	mov    %rax,%rdi
  8041cc:	48 b8 70 26 80 00 00 	movabs $0x802670,%rax
  8041d3:	00 00 00 
  8041d6:	ff d0                	callq  *%rax
  8041d8:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8041dc:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8041e0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8041e4:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8041eb:	00 
  8041ec:	e9 92 00 00 00       	jmpq   804283 <devpipe_read+0xd2>
  8041f1:	eb 41                	jmp    804234 <devpipe_read+0x83>
  8041f3:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  8041f8:	74 09                	je     804203 <devpipe_read+0x52>
  8041fa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8041fe:	e9 92 00 00 00       	jmpq   804295 <devpipe_read+0xe4>
  804203:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804207:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80420b:	48 89 d6             	mov    %rdx,%rsi
  80420e:	48 89 c7             	mov    %rax,%rdi
  804211:	48 b8 7a 40 80 00 00 	movabs $0x80407a,%rax
  804218:	00 00 00 
  80421b:	ff d0                	callq  *%rax
  80421d:	85 c0                	test   %eax,%eax
  80421f:	74 07                	je     804228 <devpipe_read+0x77>
  804221:	b8 00 00 00 00       	mov    $0x0,%eax
  804226:	eb 6d                	jmp    804295 <devpipe_read+0xe4>
  804228:	48 b8 53 19 80 00 00 	movabs $0x801953,%rax
  80422f:	00 00 00 
  804232:	ff d0                	callq  *%rax
  804234:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804238:	8b 10                	mov    (%rax),%edx
  80423a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80423e:	8b 40 04             	mov    0x4(%rax),%eax
  804241:	39 c2                	cmp    %eax,%edx
  804243:	74 ae                	je     8041f3 <devpipe_read+0x42>
  804245:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804249:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80424d:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  804251:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804255:	8b 00                	mov    (%rax),%eax
  804257:	99                   	cltd   
  804258:	c1 ea 1b             	shr    $0x1b,%edx
  80425b:	01 d0                	add    %edx,%eax
  80425d:	83 e0 1f             	and    $0x1f,%eax
  804260:	29 d0                	sub    %edx,%eax
  804262:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804266:	48 98                	cltq   
  804268:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  80426d:	88 01                	mov    %al,(%rcx)
  80426f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804273:	8b 00                	mov    (%rax),%eax
  804275:	8d 50 01             	lea    0x1(%rax),%edx
  804278:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80427c:	89 10                	mov    %edx,(%rax)
  80427e:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  804283:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804287:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  80428b:	0f 82 60 ff ff ff    	jb     8041f1 <devpipe_read+0x40>
  804291:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804295:	c9                   	leaveq 
  804296:	c3                   	retq   

0000000000804297 <devpipe_write>:
  804297:	55                   	push   %rbp
  804298:	48 89 e5             	mov    %rsp,%rbp
  80429b:	48 83 ec 40          	sub    $0x40,%rsp
  80429f:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8042a3:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8042a7:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8042ab:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8042af:	48 89 c7             	mov    %rax,%rdi
  8042b2:	48 b8 70 26 80 00 00 	movabs $0x802670,%rax
  8042b9:	00 00 00 
  8042bc:	ff d0                	callq  *%rax
  8042be:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8042c2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8042c6:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8042ca:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8042d1:	00 
  8042d2:	e9 8e 00 00 00       	jmpq   804365 <devpipe_write+0xce>
  8042d7:	eb 31                	jmp    80430a <devpipe_write+0x73>
  8042d9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8042dd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8042e1:	48 89 d6             	mov    %rdx,%rsi
  8042e4:	48 89 c7             	mov    %rax,%rdi
  8042e7:	48 b8 7a 40 80 00 00 	movabs $0x80407a,%rax
  8042ee:	00 00 00 
  8042f1:	ff d0                	callq  *%rax
  8042f3:	85 c0                	test   %eax,%eax
  8042f5:	74 07                	je     8042fe <devpipe_write+0x67>
  8042f7:	b8 00 00 00 00       	mov    $0x0,%eax
  8042fc:	eb 79                	jmp    804377 <devpipe_write+0xe0>
  8042fe:	48 b8 53 19 80 00 00 	movabs $0x801953,%rax
  804305:	00 00 00 
  804308:	ff d0                	callq  *%rax
  80430a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80430e:	8b 40 04             	mov    0x4(%rax),%eax
  804311:	48 63 d0             	movslq %eax,%rdx
  804314:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804318:	8b 00                	mov    (%rax),%eax
  80431a:	48 98                	cltq   
  80431c:	48 83 c0 20          	add    $0x20,%rax
  804320:	48 39 c2             	cmp    %rax,%rdx
  804323:	73 b4                	jae    8042d9 <devpipe_write+0x42>
  804325:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804329:	8b 40 04             	mov    0x4(%rax),%eax
  80432c:	99                   	cltd   
  80432d:	c1 ea 1b             	shr    $0x1b,%edx
  804330:	01 d0                	add    %edx,%eax
  804332:	83 e0 1f             	and    $0x1f,%eax
  804335:	29 d0                	sub    %edx,%eax
  804337:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80433b:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80433f:	48 01 ca             	add    %rcx,%rdx
  804342:	0f b6 0a             	movzbl (%rdx),%ecx
  804345:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804349:	48 98                	cltq   
  80434b:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  80434f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804353:	8b 40 04             	mov    0x4(%rax),%eax
  804356:	8d 50 01             	lea    0x1(%rax),%edx
  804359:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80435d:	89 50 04             	mov    %edx,0x4(%rax)
  804360:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  804365:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804369:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  80436d:	0f 82 64 ff ff ff    	jb     8042d7 <devpipe_write+0x40>
  804373:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804377:	c9                   	leaveq 
  804378:	c3                   	retq   

0000000000804379 <devpipe_stat>:
  804379:	55                   	push   %rbp
  80437a:	48 89 e5             	mov    %rsp,%rbp
  80437d:	48 83 ec 20          	sub    $0x20,%rsp
  804381:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804385:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804389:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80438d:	48 89 c7             	mov    %rax,%rdi
  804390:	48 b8 70 26 80 00 00 	movabs $0x802670,%rax
  804397:	00 00 00 
  80439a:	ff d0                	callq  *%rax
  80439c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8043a0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8043a4:	48 be ae 50 80 00 00 	movabs $0x8050ae,%rsi
  8043ab:	00 00 00 
  8043ae:	48 89 c7             	mov    %rax,%rdi
  8043b1:	48 b8 62 10 80 00 00 	movabs $0x801062,%rax
  8043b8:	00 00 00 
  8043bb:	ff d0                	callq  *%rax
  8043bd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8043c1:	8b 50 04             	mov    0x4(%rax),%edx
  8043c4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8043c8:	8b 00                	mov    (%rax),%eax
  8043ca:	29 c2                	sub    %eax,%edx
  8043cc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8043d0:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  8043d6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8043da:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  8043e1:	00 00 00 
  8043e4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8043e8:	48 b9 e0 70 80 00 00 	movabs $0x8070e0,%rcx
  8043ef:	00 00 00 
  8043f2:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  8043f9:	b8 00 00 00 00       	mov    $0x0,%eax
  8043fe:	c9                   	leaveq 
  8043ff:	c3                   	retq   

0000000000804400 <devpipe_close>:
  804400:	55                   	push   %rbp
  804401:	48 89 e5             	mov    %rsp,%rbp
  804404:	48 83 ec 10          	sub    $0x10,%rsp
  804408:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80440c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804410:	48 89 c6             	mov    %rax,%rsi
  804413:	bf 00 00 00 00       	mov    $0x0,%edi
  804418:	48 b8 3c 1a 80 00 00 	movabs $0x801a3c,%rax
  80441f:	00 00 00 
  804422:	ff d0                	callq  *%rax
  804424:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804428:	48 89 c7             	mov    %rax,%rdi
  80442b:	48 b8 70 26 80 00 00 	movabs $0x802670,%rax
  804432:	00 00 00 
  804435:	ff d0                	callq  *%rax
  804437:	48 89 c6             	mov    %rax,%rsi
  80443a:	bf 00 00 00 00       	mov    $0x0,%edi
  80443f:	48 b8 3c 1a 80 00 00 	movabs $0x801a3c,%rax
  804446:	00 00 00 
  804449:	ff d0                	callq  *%rax
  80444b:	c9                   	leaveq 
  80444c:	c3                   	retq   

000000000080444d <cputchar>:
  80444d:	55                   	push   %rbp
  80444e:	48 89 e5             	mov    %rsp,%rbp
  804451:	48 83 ec 20          	sub    $0x20,%rsp
  804455:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804458:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80445b:	88 45 ff             	mov    %al,-0x1(%rbp)
  80445e:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  804462:	be 01 00 00 00       	mov    $0x1,%esi
  804467:	48 89 c7             	mov    %rax,%rdi
  80446a:	48 b8 49 18 80 00 00 	movabs $0x801849,%rax
  804471:	00 00 00 
  804474:	ff d0                	callq  *%rax
  804476:	c9                   	leaveq 
  804477:	c3                   	retq   

0000000000804478 <getchar>:
  804478:	55                   	push   %rbp
  804479:	48 89 e5             	mov    %rsp,%rbp
  80447c:	48 83 ec 10          	sub    $0x10,%rsp
  804480:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  804484:	ba 01 00 00 00       	mov    $0x1,%edx
  804489:	48 89 c6             	mov    %rax,%rsi
  80448c:	bf 00 00 00 00       	mov    $0x0,%edi
  804491:	48 b8 65 2b 80 00 00 	movabs $0x802b65,%rax
  804498:	00 00 00 
  80449b:	ff d0                	callq  *%rax
  80449d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8044a0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8044a4:	79 05                	jns    8044ab <getchar+0x33>
  8044a6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8044a9:	eb 14                	jmp    8044bf <getchar+0x47>
  8044ab:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8044af:	7f 07                	jg     8044b8 <getchar+0x40>
  8044b1:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  8044b6:	eb 07                	jmp    8044bf <getchar+0x47>
  8044b8:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  8044bc:	0f b6 c0             	movzbl %al,%eax
  8044bf:	c9                   	leaveq 
  8044c0:	c3                   	retq   

00000000008044c1 <iscons>:
  8044c1:	55                   	push   %rbp
  8044c2:	48 89 e5             	mov    %rsp,%rbp
  8044c5:	48 83 ec 20          	sub    $0x20,%rsp
  8044c9:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8044cc:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8044d0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8044d3:	48 89 d6             	mov    %rdx,%rsi
  8044d6:	89 c7                	mov    %eax,%edi
  8044d8:	48 b8 33 27 80 00 00 	movabs $0x802733,%rax
  8044df:	00 00 00 
  8044e2:	ff d0                	callq  *%rax
  8044e4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8044e7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8044eb:	79 05                	jns    8044f2 <iscons+0x31>
  8044ed:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8044f0:	eb 1a                	jmp    80450c <iscons+0x4b>
  8044f2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8044f6:	8b 10                	mov    (%rax),%edx
  8044f8:	48 b8 20 71 80 00 00 	movabs $0x807120,%rax
  8044ff:	00 00 00 
  804502:	8b 00                	mov    (%rax),%eax
  804504:	39 c2                	cmp    %eax,%edx
  804506:	0f 94 c0             	sete   %al
  804509:	0f b6 c0             	movzbl %al,%eax
  80450c:	c9                   	leaveq 
  80450d:	c3                   	retq   

000000000080450e <opencons>:
  80450e:	55                   	push   %rbp
  80450f:	48 89 e5             	mov    %rsp,%rbp
  804512:	48 83 ec 10          	sub    $0x10,%rsp
  804516:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  80451a:	48 89 c7             	mov    %rax,%rdi
  80451d:	48 b8 9b 26 80 00 00 	movabs $0x80269b,%rax
  804524:	00 00 00 
  804527:	ff d0                	callq  *%rax
  804529:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80452c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804530:	79 05                	jns    804537 <opencons+0x29>
  804532:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804535:	eb 5b                	jmp    804592 <opencons+0x84>
  804537:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80453b:	ba 07 04 00 00       	mov    $0x407,%edx
  804540:	48 89 c6             	mov    %rax,%rsi
  804543:	bf 00 00 00 00       	mov    $0x0,%edi
  804548:	48 b8 91 19 80 00 00 	movabs $0x801991,%rax
  80454f:	00 00 00 
  804552:	ff d0                	callq  *%rax
  804554:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804557:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80455b:	79 05                	jns    804562 <opencons+0x54>
  80455d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804560:	eb 30                	jmp    804592 <opencons+0x84>
  804562:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804566:	48 ba 20 71 80 00 00 	movabs $0x807120,%rdx
  80456d:	00 00 00 
  804570:	8b 12                	mov    (%rdx),%edx
  804572:	89 10                	mov    %edx,(%rax)
  804574:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804578:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  80457f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804583:	48 89 c7             	mov    %rax,%rdi
  804586:	48 b8 4d 26 80 00 00 	movabs $0x80264d,%rax
  80458d:	00 00 00 
  804590:	ff d0                	callq  *%rax
  804592:	c9                   	leaveq 
  804593:	c3                   	retq   

0000000000804594 <devcons_read>:
  804594:	55                   	push   %rbp
  804595:	48 89 e5             	mov    %rsp,%rbp
  804598:	48 83 ec 30          	sub    $0x30,%rsp
  80459c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8045a0:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8045a4:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8045a8:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8045ad:	75 07                	jne    8045b6 <devcons_read+0x22>
  8045af:	b8 00 00 00 00       	mov    $0x0,%eax
  8045b4:	eb 4b                	jmp    804601 <devcons_read+0x6d>
  8045b6:	eb 0c                	jmp    8045c4 <devcons_read+0x30>
  8045b8:	48 b8 53 19 80 00 00 	movabs $0x801953,%rax
  8045bf:	00 00 00 
  8045c2:	ff d0                	callq  *%rax
  8045c4:	48 b8 93 18 80 00 00 	movabs $0x801893,%rax
  8045cb:	00 00 00 
  8045ce:	ff d0                	callq  *%rax
  8045d0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8045d3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8045d7:	74 df                	je     8045b8 <devcons_read+0x24>
  8045d9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8045dd:	79 05                	jns    8045e4 <devcons_read+0x50>
  8045df:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8045e2:	eb 1d                	jmp    804601 <devcons_read+0x6d>
  8045e4:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  8045e8:	75 07                	jne    8045f1 <devcons_read+0x5d>
  8045ea:	b8 00 00 00 00       	mov    $0x0,%eax
  8045ef:	eb 10                	jmp    804601 <devcons_read+0x6d>
  8045f1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8045f4:	89 c2                	mov    %eax,%edx
  8045f6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8045fa:	88 10                	mov    %dl,(%rax)
  8045fc:	b8 01 00 00 00       	mov    $0x1,%eax
  804601:	c9                   	leaveq 
  804602:	c3                   	retq   

0000000000804603 <devcons_write>:
  804603:	55                   	push   %rbp
  804604:	48 89 e5             	mov    %rsp,%rbp
  804607:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  80460e:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  804615:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  80461c:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  804623:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80462a:	eb 76                	jmp    8046a2 <devcons_write+0x9f>
  80462c:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  804633:	89 c2                	mov    %eax,%edx
  804635:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804638:	29 c2                	sub    %eax,%edx
  80463a:	89 d0                	mov    %edx,%eax
  80463c:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80463f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804642:	83 f8 7f             	cmp    $0x7f,%eax
  804645:	76 07                	jbe    80464e <devcons_write+0x4b>
  804647:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  80464e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804651:	48 63 d0             	movslq %eax,%rdx
  804654:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804657:	48 63 c8             	movslq %eax,%rcx
  80465a:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  804661:	48 01 c1             	add    %rax,%rcx
  804664:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  80466b:	48 89 ce             	mov    %rcx,%rsi
  80466e:	48 89 c7             	mov    %rax,%rdi
  804671:	48 b8 86 13 80 00 00 	movabs $0x801386,%rax
  804678:	00 00 00 
  80467b:	ff d0                	callq  *%rax
  80467d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804680:	48 63 d0             	movslq %eax,%rdx
  804683:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  80468a:	48 89 d6             	mov    %rdx,%rsi
  80468d:	48 89 c7             	mov    %rax,%rdi
  804690:	48 b8 49 18 80 00 00 	movabs $0x801849,%rax
  804697:	00 00 00 
  80469a:	ff d0                	callq  *%rax
  80469c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80469f:	01 45 fc             	add    %eax,-0x4(%rbp)
  8046a2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8046a5:	48 98                	cltq   
  8046a7:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  8046ae:	0f 82 78 ff ff ff    	jb     80462c <devcons_write+0x29>
  8046b4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8046b7:	c9                   	leaveq 
  8046b8:	c3                   	retq   

00000000008046b9 <devcons_close>:
  8046b9:	55                   	push   %rbp
  8046ba:	48 89 e5             	mov    %rsp,%rbp
  8046bd:	48 83 ec 08          	sub    $0x8,%rsp
  8046c1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8046c5:	b8 00 00 00 00       	mov    $0x0,%eax
  8046ca:	c9                   	leaveq 
  8046cb:	c3                   	retq   

00000000008046cc <devcons_stat>:
  8046cc:	55                   	push   %rbp
  8046cd:	48 89 e5             	mov    %rsp,%rbp
  8046d0:	48 83 ec 10          	sub    $0x10,%rsp
  8046d4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8046d8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8046dc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8046e0:	48 be ba 50 80 00 00 	movabs $0x8050ba,%rsi
  8046e7:	00 00 00 
  8046ea:	48 89 c7             	mov    %rax,%rdi
  8046ed:	48 b8 62 10 80 00 00 	movabs $0x801062,%rax
  8046f4:	00 00 00 
  8046f7:	ff d0                	callq  *%rax
  8046f9:	b8 00 00 00 00       	mov    $0x0,%eax
  8046fe:	c9                   	leaveq 
  8046ff:	c3                   	retq   

0000000000804700 <set_pgfault_handler>:
  804700:	55                   	push   %rbp
  804701:	48 89 e5             	mov    %rsp,%rbp
  804704:	48 83 ec 20          	sub    $0x20,%rsp
  804708:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80470c:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804713:	00 00 00 
  804716:	48 8b 00             	mov    (%rax),%rax
  804719:	48 85 c0             	test   %rax,%rax
  80471c:	75 6f                	jne    80478d <set_pgfault_handler+0x8d>
  80471e:	ba 07 00 00 00       	mov    $0x7,%edx
  804723:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  804728:	bf 00 00 00 00       	mov    $0x0,%edi
  80472d:	48 b8 91 19 80 00 00 	movabs $0x801991,%rax
  804734:	00 00 00 
  804737:	ff d0                	callq  *%rax
  804739:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80473c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804740:	79 30                	jns    804772 <set_pgfault_handler+0x72>
  804742:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804745:	89 c1                	mov    %eax,%ecx
  804747:	48 ba c8 50 80 00 00 	movabs $0x8050c8,%rdx
  80474e:	00 00 00 
  804751:	be 22 00 00 00       	mov    $0x22,%esi
  804756:	48 bf e7 50 80 00 00 	movabs $0x8050e7,%rdi
  80475d:	00 00 00 
  804760:	b8 00 00 00 00       	mov    $0x0,%eax
  804765:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  80476c:	00 00 00 
  80476f:	41 ff d0             	callq  *%r8
  804772:	48 be a0 47 80 00 00 	movabs $0x8047a0,%rsi
  804779:	00 00 00 
  80477c:	bf 00 00 00 00       	mov    $0x0,%edi
  804781:	48 b8 1b 1b 80 00 00 	movabs $0x801b1b,%rax
  804788:	00 00 00 
  80478b:	ff d0                	callq  *%rax
  80478d:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804794:	00 00 00 
  804797:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80479b:	48 89 10             	mov    %rdx,(%rax)
  80479e:	c9                   	leaveq 
  80479f:	c3                   	retq   

00000000008047a0 <_pgfault_upcall>:
.globl _pgfault_upcall
_pgfault_upcall:
// Call the C page fault handler.
// function argument: pointer to UTF

movq  %rsp,%rdi                // passing the function argument in rdi
  8047a0:	48 89 e7             	mov    %rsp,%rdi
movabs _pgfault_handler, %rax
  8047a3:	48 a1 00 c0 80 00 00 	movabs 0x80c000,%rax
  8047aa:	00 00 00 
call *%rax
  8047ad:	ff d0                	callq  *%rax
// registers are available for intermediate calculations.  You
// may find that you have to rearrange your code in non-obvious
// ways as registers become unavailable as scratch space.
//
// LAB 4: Your code here.
subq $8, 152(%rsp)
  8047af:	48 83 ac 24 98 00 00 	subq   $0x8,0x98(%rsp)
  8047b6:	00 08 
    movq 152(%rsp), %rax
  8047b8:	48 8b 84 24 98 00 00 	mov    0x98(%rsp),%rax
  8047bf:	00 
    movq 136(%rsp), %rbx
  8047c0:	48 8b 9c 24 88 00 00 	mov    0x88(%rsp),%rbx
  8047c7:	00 
movq %rbx, (%rax)
  8047c8:	48 89 18             	mov    %rbx,(%rax)

    // Restore the trap-time registers.  After you do this, you
    // can no longer modify any general-purpose registers.
    // LAB 4: Your code here.
    addq $16, %rsp
  8047cb:	48 83 c4 10          	add    $0x10,%rsp
    POPA_
  8047cf:	4c 8b 3c 24          	mov    (%rsp),%r15
  8047d3:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
  8047d8:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
  8047dd:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  8047e2:	4c 8b 5c 24 20       	mov    0x20(%rsp),%r11
  8047e7:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
  8047ec:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
  8047f1:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
  8047f6:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
  8047fb:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
  804800:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
  804805:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
  80480a:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
  80480f:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
  804814:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  804819:	48 83 c4 78          	add    $0x78,%rsp

    // Restore eflags from the stack.  After you do this, you can
    // no longer use arithmetic operations or anything else that
    // modifies eflags.
    // LAB 4: Your code here.
pushq 8(%rsp)
  80481d:	ff 74 24 08          	pushq  0x8(%rsp)
    popfq
  804821:	9d                   	popfq  

    // Switch back to the adjusted trap-time stack.
    // LAB 4: Your code here.
    movq 16(%rsp), %rsp
  804822:	48 8b 64 24 10       	mov    0x10(%rsp),%rsp

    // Return to re-execute the instruction that faulted.
    // LAB 4: Your code here.
    retq
  804827:	c3                   	retq   

0000000000804828 <pageref>:
  804828:	55                   	push   %rbp
  804829:	48 89 e5             	mov    %rsp,%rbp
  80482c:	48 83 ec 18          	sub    $0x18,%rsp
  804830:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804834:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804838:	48 c1 e8 15          	shr    $0x15,%rax
  80483c:	48 89 c2             	mov    %rax,%rdx
  80483f:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  804846:	01 00 00 
  804849:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80484d:	83 e0 01             	and    $0x1,%eax
  804850:	48 85 c0             	test   %rax,%rax
  804853:	75 07                	jne    80485c <pageref+0x34>
  804855:	b8 00 00 00 00       	mov    $0x0,%eax
  80485a:	eb 53                	jmp    8048af <pageref+0x87>
  80485c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804860:	48 c1 e8 0c          	shr    $0xc,%rax
  804864:	48 89 c2             	mov    %rax,%rdx
  804867:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80486e:	01 00 00 
  804871:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804875:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804879:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80487d:	83 e0 01             	and    $0x1,%eax
  804880:	48 85 c0             	test   %rax,%rax
  804883:	75 07                	jne    80488c <pageref+0x64>
  804885:	b8 00 00 00 00       	mov    $0x0,%eax
  80488a:	eb 23                	jmp    8048af <pageref+0x87>
  80488c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804890:	48 c1 e8 0c          	shr    $0xc,%rax
  804894:	48 89 c2             	mov    %rax,%rdx
  804897:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  80489e:	00 00 00 
  8048a1:	48 c1 e2 04          	shl    $0x4,%rdx
  8048a5:	48 01 d0             	add    %rdx,%rax
  8048a8:	0f b7 40 08          	movzwl 0x8(%rax),%eax
  8048ac:	0f b7 c0             	movzwl %ax,%eax
  8048af:	c9                   	leaveq 
  8048b0:	c3                   	retq   
