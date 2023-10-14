
obj/user/testpiperace:     file format elf64-x86-64


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
  80003c:	e8 44 03 00 00       	callq  800385 <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <umain>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 50          	sub    $0x50,%rsp
  80004b:	89 7d bc             	mov    %edi,-0x44(%rbp)
  80004e:	48 89 75 b0          	mov    %rsi,-0x50(%rbp)
  800052:	48 bf 80 4a 80 00 00 	movabs $0x804a80,%rdi
  800059:	00 00 00 
  80005c:	b8 00 00 00 00       	mov    $0x0,%eax
  800061:	48 ba 64 06 80 00 00 	movabs $0x800664,%rdx
  800068:	00 00 00 
  80006b:	ff d2                	callq  *%rdx
  80006d:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  800071:	48 89 c7             	mov    %rax,%rdi
  800074:	48 b8 c4 40 80 00 00 	movabs $0x8040c4,%rax
  80007b:	00 00 00 
  80007e:	ff d0                	callq  *%rax
  800080:	89 45 f8             	mov    %eax,-0x8(%rbp)
  800083:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  800087:	79 30                	jns    8000b9 <umain+0x76>
  800089:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80008c:	89 c1                	mov    %eax,%ecx
  80008e:	48 ba 99 4a 80 00 00 	movabs $0x804a99,%rdx
  800095:	00 00 00 
  800098:	be 0e 00 00 00       	mov    $0xe,%esi
  80009d:	48 bf a2 4a 80 00 00 	movabs $0x804aa2,%rdi
  8000a4:	00 00 00 
  8000a7:	b8 00 00 00 00       	mov    $0x0,%eax
  8000ac:	49 b8 2b 04 80 00 00 	movabs $0x80042b,%r8
  8000b3:	00 00 00 
  8000b6:	41 ff d0             	callq  *%r8
  8000b9:	c7 45 f4 c8 00 00 00 	movl   $0xc8,-0xc(%rbp)
  8000c0:	48 b8 c6 23 80 00 00 	movabs $0x8023c6,%rax
  8000c7:	00 00 00 
  8000ca:	ff d0                	callq  *%rax
  8000cc:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8000cf:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8000d3:	79 30                	jns    800105 <umain+0xc2>
  8000d5:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8000d8:	89 c1                	mov    %eax,%ecx
  8000da:	48 ba b9 4a 80 00 00 	movabs $0x804ab9,%rdx
  8000e1:	00 00 00 
  8000e4:	be 11 00 00 00       	mov    $0x11,%esi
  8000e9:	48 bf a2 4a 80 00 00 	movabs $0x804aa2,%rdi
  8000f0:	00 00 00 
  8000f3:	b8 00 00 00 00       	mov    $0x0,%eax
  8000f8:	49 b8 2b 04 80 00 00 	movabs $0x80042b,%r8
  8000ff:	00 00 00 
  800102:	41 ff d0             	callq  *%r8
  800105:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  800109:	0f 85 89 00 00 00    	jne    800198 <umain+0x155>
  80010f:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  800112:	89 c7                	mov    %eax,%edi
  800114:	48 b8 fa 2a 80 00 00 	movabs $0x802afa,%rax
  80011b:	00 00 00 
  80011e:	ff d0                	callq  *%rax
  800120:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800127:	eb 4c                	jmp    800175 <umain+0x132>
  800129:	8b 45 d0             	mov    -0x30(%rbp),%eax
  80012c:	89 c7                	mov    %eax,%edi
  80012e:	48 b8 8d 43 80 00 00 	movabs $0x80438d,%rax
  800135:	00 00 00 
  800138:	ff d0                	callq  *%rax
  80013a:	85 c0                	test   %eax,%eax
  80013c:	74 27                	je     800165 <umain+0x122>
  80013e:	48 bf c2 4a 80 00 00 	movabs $0x804ac2,%rdi
  800145:	00 00 00 
  800148:	b8 00 00 00 00       	mov    $0x0,%eax
  80014d:	48 ba 64 06 80 00 00 	movabs $0x800664,%rdx
  800154:	00 00 00 
  800157:	ff d2                	callq  *%rdx
  800159:	48 b8 08 04 80 00 00 	movabs $0x800408,%rax
  800160:	00 00 00 
  800163:	ff d0                	callq  *%rax
  800165:	48 b8 0a 1b 80 00 00 	movabs $0x801b0a,%rax
  80016c:	00 00 00 
  80016f:	ff d0                	callq  *%rax
  800171:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800175:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800178:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  80017b:	7c ac                	jl     800129 <umain+0xe6>
  80017d:	ba 00 00 00 00       	mov    $0x0,%edx
  800182:	be 00 00 00 00       	mov    $0x0,%esi
  800187:	bf 00 00 00 00       	mov    $0x0,%edi
  80018c:	48 b8 3b 26 80 00 00 	movabs $0x80263b,%rax
  800193:	00 00 00 
  800196:	ff d0                	callq  *%rax
  800198:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80019b:	89 45 f0             	mov    %eax,-0x10(%rbp)
  80019e:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8001a1:	89 c6                	mov    %eax,%esi
  8001a3:	48 bf dd 4a 80 00 00 	movabs $0x804add,%rdi
  8001aa:	00 00 00 
  8001ad:	b8 00 00 00 00       	mov    $0x0,%eax
  8001b2:	48 ba 64 06 80 00 00 	movabs $0x800664,%rdx
  8001b9:	00 00 00 
  8001bc:	ff d2                	callq  *%rdx
  8001be:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
  8001c5:	00 
  8001c6:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8001c9:	25 ff 03 00 00       	and    $0x3ff,%eax
  8001ce:	48 98                	cltq   
  8001d0:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8001d7:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8001de:	00 00 00 
  8001e1:	48 01 d0             	add    %rdx,%rax
  8001e4:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8001e8:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8001ec:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8001f3:	00 00 00 
  8001f6:	48 29 c2             	sub    %rax,%rdx
  8001f9:	48 89 d0             	mov    %rdx,%rax
  8001fc:	48 c1 f8 03          	sar    $0x3,%rax
  800200:	48 89 c2             	mov    %rax,%rdx
  800203:	48 b8 a5 4f fa a4 4f 	movabs $0x4fa4fa4fa4fa4fa5,%rax
  80020a:	fa a4 4f 
  80020d:	48 0f af c2          	imul   %rdx,%rax
  800211:	48 89 c6             	mov    %rax,%rsi
  800214:	48 bf e8 4a 80 00 00 	movabs $0x804ae8,%rdi
  80021b:	00 00 00 
  80021e:	b8 00 00 00 00       	mov    $0x0,%eax
  800223:	48 ba 64 06 80 00 00 	movabs $0x800664,%rdx
  80022a:	00 00 00 
  80022d:	ff d2                	callq  *%rdx
  80022f:	8b 45 d0             	mov    -0x30(%rbp),%eax
  800232:	be 0a 00 00 00       	mov    $0xa,%esi
  800237:	89 c7                	mov    %eax,%edi
  800239:	48 b8 73 2b 80 00 00 	movabs $0x802b73,%rax
  800240:	00 00 00 
  800243:	ff d0                	callq  *%rax
  800245:	eb 16                	jmp    80025d <umain+0x21a>
  800247:	8b 45 d0             	mov    -0x30(%rbp),%eax
  80024a:	be 0a 00 00 00       	mov    $0xa,%esi
  80024f:	89 c7                	mov    %eax,%edi
  800251:	48 b8 73 2b 80 00 00 	movabs $0x802b73,%rax
  800258:	00 00 00 
  80025b:	ff d0                	callq  *%rax
  80025d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800261:	8b 80 d4 00 00 00    	mov    0xd4(%rax),%eax
  800267:	83 f8 02             	cmp    $0x2,%eax
  80026a:	74 db                	je     800247 <umain+0x204>
  80026c:	48 bf f3 4a 80 00 00 	movabs $0x804af3,%rdi
  800273:	00 00 00 
  800276:	b8 00 00 00 00       	mov    $0x0,%eax
  80027b:	48 ba 64 06 80 00 00 	movabs $0x800664,%rdx
  800282:	00 00 00 
  800285:	ff d2                	callq  *%rdx
  800287:	8b 45 d0             	mov    -0x30(%rbp),%eax
  80028a:	89 c7                	mov    %eax,%edi
  80028c:	48 b8 8d 43 80 00 00 	movabs $0x80438d,%rax
  800293:	00 00 00 
  800296:	ff d0                	callq  *%rax
  800298:	85 c0                	test   %eax,%eax
  80029a:	74 2a                	je     8002c6 <umain+0x283>
  80029c:	48 ba 10 4b 80 00 00 	movabs $0x804b10,%rdx
  8002a3:	00 00 00 
  8002a6:	be 3b 00 00 00       	mov    $0x3b,%esi
  8002ab:	48 bf a2 4a 80 00 00 	movabs $0x804aa2,%rdi
  8002b2:	00 00 00 
  8002b5:	b8 00 00 00 00       	mov    $0x0,%eax
  8002ba:	48 b9 2b 04 80 00 00 	movabs $0x80042b,%rcx
  8002c1:	00 00 00 
  8002c4:	ff d1                	callq  *%rcx
  8002c6:	8b 45 d0             	mov    -0x30(%rbp),%eax
  8002c9:	48 8d 55 c8          	lea    -0x38(%rbp),%rdx
  8002cd:	48 89 d6             	mov    %rdx,%rsi
  8002d0:	89 c7                	mov    %eax,%edi
  8002d2:	48 b8 ea 28 80 00 00 	movabs $0x8028ea,%rax
  8002d9:	00 00 00 
  8002dc:	ff d0                	callq  *%rax
  8002de:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8002e1:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8002e5:	79 30                	jns    800317 <umain+0x2d4>
  8002e7:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8002ea:	89 c1                	mov    %eax,%ecx
  8002ec:	48 ba 3a 4b 80 00 00 	movabs $0x804b3a,%rdx
  8002f3:	00 00 00 
  8002f6:	be 3d 00 00 00       	mov    $0x3d,%esi
  8002fb:	48 bf a2 4a 80 00 00 	movabs $0x804aa2,%rdi
  800302:	00 00 00 
  800305:	b8 00 00 00 00       	mov    $0x0,%eax
  80030a:	49 b8 2b 04 80 00 00 	movabs $0x80042b,%r8
  800311:	00 00 00 
  800314:	41 ff d0             	callq  *%r8
  800317:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80031b:	48 89 c7             	mov    %rax,%rdi
  80031e:	48 b8 27 28 80 00 00 	movabs $0x802827,%rax
  800325:	00 00 00 
  800328:	ff d0                	callq  *%rax
  80032a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80032e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800332:	48 89 c7             	mov    %rax,%rdi
  800335:	48 b8 2f 38 80 00 00 	movabs $0x80382f,%rax
  80033c:	00 00 00 
  80033f:	ff d0                	callq  *%rax
  800341:	83 f8 04             	cmp    $0x4,%eax
  800344:	74 1d                	je     800363 <umain+0x320>
  800346:	48 bf 52 4b 80 00 00 	movabs $0x804b52,%rdi
  80034d:	00 00 00 
  800350:	b8 00 00 00 00       	mov    $0x0,%eax
  800355:	48 ba 64 06 80 00 00 	movabs $0x800664,%rdx
  80035c:	00 00 00 
  80035f:	ff d2                	callq  *%rdx
  800361:	eb 20                	jmp    800383 <umain+0x340>
  800363:	8b 45 f4             	mov    -0xc(%rbp),%eax
  800366:	89 c6                	mov    %eax,%esi
  800368:	48 bf 68 4b 80 00 00 	movabs $0x804b68,%rdi
  80036f:	00 00 00 
  800372:	b8 00 00 00 00       	mov    $0x0,%eax
  800377:	48 ba 64 06 80 00 00 	movabs $0x800664,%rdx
  80037e:	00 00 00 
  800381:	ff d2                	callq  *%rdx
  800383:	c9                   	leaveq 
  800384:	c3                   	retq   

0000000000800385 <libmain>:
  800385:	55                   	push   %rbp
  800386:	48 89 e5             	mov    %rsp,%rbp
  800389:	48 83 ec 10          	sub    $0x10,%rsp
  80038d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800390:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800394:	48 b8 cc 1a 80 00 00 	movabs $0x801acc,%rax
  80039b:	00 00 00 
  80039e:	ff d0                	callq  *%rax
  8003a0:	25 ff 03 00 00       	and    $0x3ff,%eax
  8003a5:	48 98                	cltq   
  8003a7:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8003ae:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8003b5:	00 00 00 
  8003b8:	48 01 c2             	add    %rax,%rdx
  8003bb:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8003c2:	00 00 00 
  8003c5:	48 89 10             	mov    %rdx,(%rax)
  8003c8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8003cc:	7e 14                	jle    8003e2 <libmain+0x5d>
  8003ce:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8003d2:	48 8b 10             	mov    (%rax),%rdx
  8003d5:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8003dc:	00 00 00 
  8003df:	48 89 10             	mov    %rdx,(%rax)
  8003e2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8003e6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8003e9:	48 89 d6             	mov    %rdx,%rsi
  8003ec:	89 c7                	mov    %eax,%edi
  8003ee:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8003f5:	00 00 00 
  8003f8:	ff d0                	callq  *%rax
  8003fa:	48 b8 08 04 80 00 00 	movabs $0x800408,%rax
  800401:	00 00 00 
  800404:	ff d0                	callq  *%rax
  800406:	c9                   	leaveq 
  800407:	c3                   	retq   

0000000000800408 <exit>:
  800408:	55                   	push   %rbp
  800409:	48 89 e5             	mov    %rsp,%rbp
  80040c:	48 b8 45 2b 80 00 00 	movabs $0x802b45,%rax
  800413:	00 00 00 
  800416:	ff d0                	callq  *%rax
  800418:	bf 00 00 00 00       	mov    $0x0,%edi
  80041d:	48 b8 88 1a 80 00 00 	movabs $0x801a88,%rax
  800424:	00 00 00 
  800427:	ff d0                	callq  *%rax
  800429:	5d                   	pop    %rbp
  80042a:	c3                   	retq   

000000000080042b <_panic>:
  80042b:	55                   	push   %rbp
  80042c:	48 89 e5             	mov    %rsp,%rbp
  80042f:	53                   	push   %rbx
  800430:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  800437:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  80043e:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  800444:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  80044b:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  800452:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  800459:	84 c0                	test   %al,%al
  80045b:	74 23                	je     800480 <_panic+0x55>
  80045d:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  800464:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  800468:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  80046c:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  800470:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  800474:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  800478:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  80047c:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  800480:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  800487:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  80048e:	00 00 00 
  800491:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  800498:	00 00 00 
  80049b:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80049f:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  8004a6:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  8004ad:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8004b4:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8004bb:	00 00 00 
  8004be:	48 8b 18             	mov    (%rax),%rbx
  8004c1:	48 b8 cc 1a 80 00 00 	movabs $0x801acc,%rax
  8004c8:	00 00 00 
  8004cb:	ff d0                	callq  *%rax
  8004cd:	8b 8d 14 ff ff ff    	mov    -0xec(%rbp),%ecx
  8004d3:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  8004da:	41 89 c8             	mov    %ecx,%r8d
  8004dd:	48 89 d1             	mov    %rdx,%rcx
  8004e0:	48 89 da             	mov    %rbx,%rdx
  8004e3:	89 c6                	mov    %eax,%esi
  8004e5:	48 bf 88 4b 80 00 00 	movabs $0x804b88,%rdi
  8004ec:	00 00 00 
  8004ef:	b8 00 00 00 00       	mov    $0x0,%eax
  8004f4:	49 b9 64 06 80 00 00 	movabs $0x800664,%r9
  8004fb:	00 00 00 
  8004fe:	41 ff d1             	callq  *%r9
  800501:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  800508:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  80050f:	48 89 d6             	mov    %rdx,%rsi
  800512:	48 89 c7             	mov    %rax,%rdi
  800515:	48 b8 b8 05 80 00 00 	movabs $0x8005b8,%rax
  80051c:	00 00 00 
  80051f:	ff d0                	callq  *%rax
  800521:	48 bf ab 4b 80 00 00 	movabs $0x804bab,%rdi
  800528:	00 00 00 
  80052b:	b8 00 00 00 00       	mov    $0x0,%eax
  800530:	48 ba 64 06 80 00 00 	movabs $0x800664,%rdx
  800537:	00 00 00 
  80053a:	ff d2                	callq  *%rdx
  80053c:	cc                   	int3   
  80053d:	eb fd                	jmp    80053c <_panic+0x111>

000000000080053f <putch>:
  80053f:	55                   	push   %rbp
  800540:	48 89 e5             	mov    %rsp,%rbp
  800543:	48 83 ec 10          	sub    $0x10,%rsp
  800547:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80054a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80054e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800552:	8b 00                	mov    (%rax),%eax
  800554:	8d 48 01             	lea    0x1(%rax),%ecx
  800557:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80055b:	89 0a                	mov    %ecx,(%rdx)
  80055d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800560:	89 d1                	mov    %edx,%ecx
  800562:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800566:	48 98                	cltq   
  800568:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  80056c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800570:	8b 00                	mov    (%rax),%eax
  800572:	3d ff 00 00 00       	cmp    $0xff,%eax
  800577:	75 2c                	jne    8005a5 <putch+0x66>
  800579:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80057d:	8b 00                	mov    (%rax),%eax
  80057f:	48 98                	cltq   
  800581:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800585:	48 83 c2 08          	add    $0x8,%rdx
  800589:	48 89 c6             	mov    %rax,%rsi
  80058c:	48 89 d7             	mov    %rdx,%rdi
  80058f:	48 b8 00 1a 80 00 00 	movabs $0x801a00,%rax
  800596:	00 00 00 
  800599:	ff d0                	callq  *%rax
  80059b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80059f:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8005a5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8005a9:	8b 40 04             	mov    0x4(%rax),%eax
  8005ac:	8d 50 01             	lea    0x1(%rax),%edx
  8005af:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8005b3:	89 50 04             	mov    %edx,0x4(%rax)
  8005b6:	c9                   	leaveq 
  8005b7:	c3                   	retq   

00000000008005b8 <vcprintf>:
  8005b8:	55                   	push   %rbp
  8005b9:	48 89 e5             	mov    %rsp,%rbp
  8005bc:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  8005c3:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  8005ca:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  8005d1:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  8005d8:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  8005df:	48 8b 0a             	mov    (%rdx),%rcx
  8005e2:	48 89 08             	mov    %rcx,(%rax)
  8005e5:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8005e9:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8005ed:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8005f1:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8005f5:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  8005fc:	00 00 00 
  8005ff:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  800606:	00 00 00 
  800609:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  800610:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  800617:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  80061e:	48 89 c6             	mov    %rax,%rsi
  800621:	48 bf 3f 05 80 00 00 	movabs $0x80053f,%rdi
  800628:	00 00 00 
  80062b:	48 b8 17 0a 80 00 00 	movabs $0x800a17,%rax
  800632:	00 00 00 
  800635:	ff d0                	callq  *%rax
  800637:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  80063d:	48 98                	cltq   
  80063f:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  800646:	48 83 c2 08          	add    $0x8,%rdx
  80064a:	48 89 c6             	mov    %rax,%rsi
  80064d:	48 89 d7             	mov    %rdx,%rdi
  800650:	48 b8 00 1a 80 00 00 	movabs $0x801a00,%rax
  800657:	00 00 00 
  80065a:	ff d0                	callq  *%rax
  80065c:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  800662:	c9                   	leaveq 
  800663:	c3                   	retq   

0000000000800664 <cprintf>:
  800664:	55                   	push   %rbp
  800665:	48 89 e5             	mov    %rsp,%rbp
  800668:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  80066f:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  800676:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  80067d:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800684:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  80068b:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800692:	84 c0                	test   %al,%al
  800694:	74 20                	je     8006b6 <cprintf+0x52>
  800696:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  80069a:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80069e:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8006a2:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8006a6:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8006aa:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8006ae:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8006b2:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8006b6:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  8006bd:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  8006c4:	00 00 00 
  8006c7:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8006ce:	00 00 00 
  8006d1:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8006d5:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8006dc:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8006e3:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8006ea:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  8006f1:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8006f8:	48 8b 0a             	mov    (%rdx),%rcx
  8006fb:	48 89 08             	mov    %rcx,(%rax)
  8006fe:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800702:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800706:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  80070a:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80070e:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  800715:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  80071c:	48 89 d6             	mov    %rdx,%rsi
  80071f:	48 89 c7             	mov    %rax,%rdi
  800722:	48 b8 b8 05 80 00 00 	movabs $0x8005b8,%rax
  800729:	00 00 00 
  80072c:	ff d0                	callq  *%rax
  80072e:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  800734:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  80073a:	c9                   	leaveq 
  80073b:	c3                   	retq   

000000000080073c <printnum>:
  80073c:	55                   	push   %rbp
  80073d:	48 89 e5             	mov    %rsp,%rbp
  800740:	53                   	push   %rbx
  800741:	48 83 ec 38          	sub    $0x38,%rsp
  800745:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800749:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80074d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  800751:	89 4d d4             	mov    %ecx,-0x2c(%rbp)
  800754:	44 89 45 d0          	mov    %r8d,-0x30(%rbp)
  800758:	44 89 4d cc          	mov    %r9d,-0x34(%rbp)
  80075c:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  80075f:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  800763:	77 3b                	ja     8007a0 <printnum+0x64>
  800765:	8b 45 d0             	mov    -0x30(%rbp),%eax
  800768:	44 8d 40 ff          	lea    -0x1(%rax),%r8d
  80076c:	8b 5d d4             	mov    -0x2c(%rbp),%ebx
  80076f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800773:	ba 00 00 00 00       	mov    $0x0,%edx
  800778:	48 f7 f3             	div    %rbx
  80077b:	48 89 c2             	mov    %rax,%rdx
  80077e:	8b 7d cc             	mov    -0x34(%rbp),%edi
  800781:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  800784:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
  800788:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80078c:	41 89 f9             	mov    %edi,%r9d
  80078f:	48 89 c7             	mov    %rax,%rdi
  800792:	48 b8 3c 07 80 00 00 	movabs $0x80073c,%rax
  800799:	00 00 00 
  80079c:	ff d0                	callq  *%rax
  80079e:	eb 1e                	jmp    8007be <printnum+0x82>
  8007a0:	eb 12                	jmp    8007b4 <printnum+0x78>
  8007a2:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8007a6:	8b 55 cc             	mov    -0x34(%rbp),%edx
  8007a9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007ad:	48 89 ce             	mov    %rcx,%rsi
  8007b0:	89 d7                	mov    %edx,%edi
  8007b2:	ff d0                	callq  *%rax
  8007b4:	83 6d d0 01          	subl   $0x1,-0x30(%rbp)
  8007b8:	83 7d d0 00          	cmpl   $0x0,-0x30(%rbp)
  8007bc:	7f e4                	jg     8007a2 <printnum+0x66>
  8007be:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  8007c1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8007c5:	ba 00 00 00 00       	mov    $0x0,%edx
  8007ca:	48 f7 f1             	div    %rcx
  8007cd:	48 89 d0             	mov    %rdx,%rax
  8007d0:	48 ba b0 4d 80 00 00 	movabs $0x804db0,%rdx
  8007d7:	00 00 00 
  8007da:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
  8007de:	0f be d0             	movsbl %al,%edx
  8007e1:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8007e5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007e9:	48 89 ce             	mov    %rcx,%rsi
  8007ec:	89 d7                	mov    %edx,%edi
  8007ee:	ff d0                	callq  *%rax
  8007f0:	48 83 c4 38          	add    $0x38,%rsp
  8007f4:	5b                   	pop    %rbx
  8007f5:	5d                   	pop    %rbp
  8007f6:	c3                   	retq   

00000000008007f7 <getuint>:
  8007f7:	55                   	push   %rbp
  8007f8:	48 89 e5             	mov    %rsp,%rbp
  8007fb:	48 83 ec 1c          	sub    $0x1c,%rsp
  8007ff:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800803:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800806:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  80080a:	7e 52                	jle    80085e <getuint+0x67>
  80080c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800810:	8b 00                	mov    (%rax),%eax
  800812:	83 f8 30             	cmp    $0x30,%eax
  800815:	73 24                	jae    80083b <getuint+0x44>
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
  800839:	eb 17                	jmp    800852 <getuint+0x5b>
  80083b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80083f:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800843:	48 89 d0             	mov    %rdx,%rax
  800846:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  80084a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80084e:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800852:	48 8b 00             	mov    (%rax),%rax
  800855:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800859:	e9 a3 00 00 00       	jmpq   800901 <getuint+0x10a>
  80085e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800862:	74 4f                	je     8008b3 <getuint+0xbc>
  800864:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800868:	8b 00                	mov    (%rax),%eax
  80086a:	83 f8 30             	cmp    $0x30,%eax
  80086d:	73 24                	jae    800893 <getuint+0x9c>
  80086f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800873:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800877:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80087b:	8b 00                	mov    (%rax),%eax
  80087d:	89 c0                	mov    %eax,%eax
  80087f:	48 01 d0             	add    %rdx,%rax
  800882:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800886:	8b 12                	mov    (%rdx),%edx
  800888:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80088b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80088f:	89 0a                	mov    %ecx,(%rdx)
  800891:	eb 17                	jmp    8008aa <getuint+0xb3>
  800893:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800897:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80089b:	48 89 d0             	mov    %rdx,%rax
  80089e:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8008a2:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008a6:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8008aa:	48 8b 00             	mov    (%rax),%rax
  8008ad:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8008b1:	eb 4e                	jmp    800901 <getuint+0x10a>
  8008b3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008b7:	8b 00                	mov    (%rax),%eax
  8008b9:	83 f8 30             	cmp    $0x30,%eax
  8008bc:	73 24                	jae    8008e2 <getuint+0xeb>
  8008be:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008c2:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8008c6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008ca:	8b 00                	mov    (%rax),%eax
  8008cc:	89 c0                	mov    %eax,%eax
  8008ce:	48 01 d0             	add    %rdx,%rax
  8008d1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008d5:	8b 12                	mov    (%rdx),%edx
  8008d7:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8008da:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008de:	89 0a                	mov    %ecx,(%rdx)
  8008e0:	eb 17                	jmp    8008f9 <getuint+0x102>
  8008e2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008e6:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8008ea:	48 89 d0             	mov    %rdx,%rax
  8008ed:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8008f1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008f5:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8008f9:	8b 00                	mov    (%rax),%eax
  8008fb:	89 c0                	mov    %eax,%eax
  8008fd:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800901:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800905:	c9                   	leaveq 
  800906:	c3                   	retq   

0000000000800907 <getint>:
  800907:	55                   	push   %rbp
  800908:	48 89 e5             	mov    %rsp,%rbp
  80090b:	48 83 ec 1c          	sub    $0x1c,%rsp
  80090f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800913:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800916:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  80091a:	7e 52                	jle    80096e <getint+0x67>
  80091c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800920:	8b 00                	mov    (%rax),%eax
  800922:	83 f8 30             	cmp    $0x30,%eax
  800925:	73 24                	jae    80094b <getint+0x44>
  800927:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80092b:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80092f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800933:	8b 00                	mov    (%rax),%eax
  800935:	89 c0                	mov    %eax,%eax
  800937:	48 01 d0             	add    %rdx,%rax
  80093a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80093e:	8b 12                	mov    (%rdx),%edx
  800940:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800943:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800947:	89 0a                	mov    %ecx,(%rdx)
  800949:	eb 17                	jmp    800962 <getint+0x5b>
  80094b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80094f:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800953:	48 89 d0             	mov    %rdx,%rax
  800956:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  80095a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80095e:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800962:	48 8b 00             	mov    (%rax),%rax
  800965:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800969:	e9 a3 00 00 00       	jmpq   800a11 <getint+0x10a>
  80096e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800972:	74 4f                	je     8009c3 <getint+0xbc>
  800974:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800978:	8b 00                	mov    (%rax),%eax
  80097a:	83 f8 30             	cmp    $0x30,%eax
  80097d:	73 24                	jae    8009a3 <getint+0x9c>
  80097f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800983:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800987:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80098b:	8b 00                	mov    (%rax),%eax
  80098d:	89 c0                	mov    %eax,%eax
  80098f:	48 01 d0             	add    %rdx,%rax
  800992:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800996:	8b 12                	mov    (%rdx),%edx
  800998:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80099b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80099f:	89 0a                	mov    %ecx,(%rdx)
  8009a1:	eb 17                	jmp    8009ba <getint+0xb3>
  8009a3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009a7:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8009ab:	48 89 d0             	mov    %rdx,%rax
  8009ae:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8009b2:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009b6:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8009ba:	48 8b 00             	mov    (%rax),%rax
  8009bd:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8009c1:	eb 4e                	jmp    800a11 <getint+0x10a>
  8009c3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009c7:	8b 00                	mov    (%rax),%eax
  8009c9:	83 f8 30             	cmp    $0x30,%eax
  8009cc:	73 24                	jae    8009f2 <getint+0xeb>
  8009ce:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009d2:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8009d6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009da:	8b 00                	mov    (%rax),%eax
  8009dc:	89 c0                	mov    %eax,%eax
  8009de:	48 01 d0             	add    %rdx,%rax
  8009e1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009e5:	8b 12                	mov    (%rdx),%edx
  8009e7:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8009ea:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009ee:	89 0a                	mov    %ecx,(%rdx)
  8009f0:	eb 17                	jmp    800a09 <getint+0x102>
  8009f2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009f6:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8009fa:	48 89 d0             	mov    %rdx,%rax
  8009fd:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800a01:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a05:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800a09:	8b 00                	mov    (%rax),%eax
  800a0b:	48 98                	cltq   
  800a0d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800a11:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800a15:	c9                   	leaveq 
  800a16:	c3                   	retq   

0000000000800a17 <vprintfmt>:
  800a17:	55                   	push   %rbp
  800a18:	48 89 e5             	mov    %rsp,%rbp
  800a1b:	41 54                	push   %r12
  800a1d:	53                   	push   %rbx
  800a1e:	48 83 ec 60          	sub    $0x60,%rsp
  800a22:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  800a26:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  800a2a:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800a2e:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  800a32:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800a36:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  800a3a:	48 8b 0a             	mov    (%rdx),%rcx
  800a3d:	48 89 08             	mov    %rcx,(%rax)
  800a40:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800a44:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800a48:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800a4c:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800a50:	eb 17                	jmp    800a69 <vprintfmt+0x52>
  800a52:	85 db                	test   %ebx,%ebx
  800a54:	0f 84 cc 04 00 00    	je     800f26 <vprintfmt+0x50f>
  800a5a:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800a5e:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a62:	48 89 d6             	mov    %rdx,%rsi
  800a65:	89 df                	mov    %ebx,%edi
  800a67:	ff d0                	callq  *%rax
  800a69:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800a6d:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800a71:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800a75:	0f b6 00             	movzbl (%rax),%eax
  800a78:	0f b6 d8             	movzbl %al,%ebx
  800a7b:	83 fb 25             	cmp    $0x25,%ebx
  800a7e:	75 d2                	jne    800a52 <vprintfmt+0x3b>
  800a80:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  800a84:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  800a8b:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800a92:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800a99:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  800aa0:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800aa4:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800aa8:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800aac:	0f b6 00             	movzbl (%rax),%eax
  800aaf:	0f b6 d8             	movzbl %al,%ebx
  800ab2:	8d 43 dd             	lea    -0x23(%rbx),%eax
  800ab5:	83 f8 55             	cmp    $0x55,%eax
  800ab8:	0f 87 34 04 00 00    	ja     800ef2 <vprintfmt+0x4db>
  800abe:	89 c0                	mov    %eax,%eax
  800ac0:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800ac7:	00 
  800ac8:	48 b8 d8 4d 80 00 00 	movabs $0x804dd8,%rax
  800acf:	00 00 00 
  800ad2:	48 01 d0             	add    %rdx,%rax
  800ad5:	48 8b 00             	mov    (%rax),%rax
  800ad8:	ff e0                	jmpq   *%rax
  800ada:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  800ade:	eb c0                	jmp    800aa0 <vprintfmt+0x89>
  800ae0:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  800ae4:	eb ba                	jmp    800aa0 <vprintfmt+0x89>
  800ae6:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  800aed:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800af0:	89 d0                	mov    %edx,%eax
  800af2:	c1 e0 02             	shl    $0x2,%eax
  800af5:	01 d0                	add    %edx,%eax
  800af7:	01 c0                	add    %eax,%eax
  800af9:	01 d8                	add    %ebx,%eax
  800afb:	83 e8 30             	sub    $0x30,%eax
  800afe:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800b01:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800b05:	0f b6 00             	movzbl (%rax),%eax
  800b08:	0f be d8             	movsbl %al,%ebx
  800b0b:	83 fb 2f             	cmp    $0x2f,%ebx
  800b0e:	7e 0c                	jle    800b1c <vprintfmt+0x105>
  800b10:	83 fb 39             	cmp    $0x39,%ebx
  800b13:	7f 07                	jg     800b1c <vprintfmt+0x105>
  800b15:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  800b1a:	eb d1                	jmp    800aed <vprintfmt+0xd6>
  800b1c:	eb 58                	jmp    800b76 <vprintfmt+0x15f>
  800b1e:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b21:	83 f8 30             	cmp    $0x30,%eax
  800b24:	73 17                	jae    800b3d <vprintfmt+0x126>
  800b26:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800b2a:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b2d:	89 c0                	mov    %eax,%eax
  800b2f:	48 01 d0             	add    %rdx,%rax
  800b32:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b35:	83 c2 08             	add    $0x8,%edx
  800b38:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800b3b:	eb 0f                	jmp    800b4c <vprintfmt+0x135>
  800b3d:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800b41:	48 89 d0             	mov    %rdx,%rax
  800b44:	48 83 c2 08          	add    $0x8,%rdx
  800b48:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800b4c:	8b 00                	mov    (%rax),%eax
  800b4e:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800b51:	eb 23                	jmp    800b76 <vprintfmt+0x15f>
  800b53:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800b57:	79 0c                	jns    800b65 <vprintfmt+0x14e>
  800b59:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  800b60:	e9 3b ff ff ff       	jmpq   800aa0 <vprintfmt+0x89>
  800b65:	e9 36 ff ff ff       	jmpq   800aa0 <vprintfmt+0x89>
  800b6a:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  800b71:	e9 2a ff ff ff       	jmpq   800aa0 <vprintfmt+0x89>
  800b76:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800b7a:	79 12                	jns    800b8e <vprintfmt+0x177>
  800b7c:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800b7f:	89 45 dc             	mov    %eax,-0x24(%rbp)
  800b82:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800b89:	e9 12 ff ff ff       	jmpq   800aa0 <vprintfmt+0x89>
  800b8e:	e9 0d ff ff ff       	jmpq   800aa0 <vprintfmt+0x89>
  800b93:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  800b97:	e9 04 ff ff ff       	jmpq   800aa0 <vprintfmt+0x89>
  800b9c:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b9f:	83 f8 30             	cmp    $0x30,%eax
  800ba2:	73 17                	jae    800bbb <vprintfmt+0x1a4>
  800ba4:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800ba8:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800bab:	89 c0                	mov    %eax,%eax
  800bad:	48 01 d0             	add    %rdx,%rax
  800bb0:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800bb3:	83 c2 08             	add    $0x8,%edx
  800bb6:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800bb9:	eb 0f                	jmp    800bca <vprintfmt+0x1b3>
  800bbb:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800bbf:	48 89 d0             	mov    %rdx,%rax
  800bc2:	48 83 c2 08          	add    $0x8,%rdx
  800bc6:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800bca:	8b 10                	mov    (%rax),%edx
  800bcc:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800bd0:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800bd4:	48 89 ce             	mov    %rcx,%rsi
  800bd7:	89 d7                	mov    %edx,%edi
  800bd9:	ff d0                	callq  *%rax
  800bdb:	e9 40 03 00 00       	jmpq   800f20 <vprintfmt+0x509>
  800be0:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800be3:	83 f8 30             	cmp    $0x30,%eax
  800be6:	73 17                	jae    800bff <vprintfmt+0x1e8>
  800be8:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800bec:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800bef:	89 c0                	mov    %eax,%eax
  800bf1:	48 01 d0             	add    %rdx,%rax
  800bf4:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800bf7:	83 c2 08             	add    $0x8,%edx
  800bfa:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800bfd:	eb 0f                	jmp    800c0e <vprintfmt+0x1f7>
  800bff:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800c03:	48 89 d0             	mov    %rdx,%rax
  800c06:	48 83 c2 08          	add    $0x8,%rdx
  800c0a:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800c0e:	8b 18                	mov    (%rax),%ebx
  800c10:	85 db                	test   %ebx,%ebx
  800c12:	79 02                	jns    800c16 <vprintfmt+0x1ff>
  800c14:	f7 db                	neg    %ebx
  800c16:	83 fb 15             	cmp    $0x15,%ebx
  800c19:	7f 16                	jg     800c31 <vprintfmt+0x21a>
  800c1b:	48 b8 00 4d 80 00 00 	movabs $0x804d00,%rax
  800c22:	00 00 00 
  800c25:	48 63 d3             	movslq %ebx,%rdx
  800c28:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800c2c:	4d 85 e4             	test   %r12,%r12
  800c2f:	75 2e                	jne    800c5f <vprintfmt+0x248>
  800c31:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800c35:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c39:	89 d9                	mov    %ebx,%ecx
  800c3b:	48 ba c1 4d 80 00 00 	movabs $0x804dc1,%rdx
  800c42:	00 00 00 
  800c45:	48 89 c7             	mov    %rax,%rdi
  800c48:	b8 00 00 00 00       	mov    $0x0,%eax
  800c4d:	49 b8 2f 0f 80 00 00 	movabs $0x800f2f,%r8
  800c54:	00 00 00 
  800c57:	41 ff d0             	callq  *%r8
  800c5a:	e9 c1 02 00 00       	jmpq   800f20 <vprintfmt+0x509>
  800c5f:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800c63:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c67:	4c 89 e1             	mov    %r12,%rcx
  800c6a:	48 ba ca 4d 80 00 00 	movabs $0x804dca,%rdx
  800c71:	00 00 00 
  800c74:	48 89 c7             	mov    %rax,%rdi
  800c77:	b8 00 00 00 00       	mov    $0x0,%eax
  800c7c:	49 b8 2f 0f 80 00 00 	movabs $0x800f2f,%r8
  800c83:	00 00 00 
  800c86:	41 ff d0             	callq  *%r8
  800c89:	e9 92 02 00 00       	jmpq   800f20 <vprintfmt+0x509>
  800c8e:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800c91:	83 f8 30             	cmp    $0x30,%eax
  800c94:	73 17                	jae    800cad <vprintfmt+0x296>
  800c96:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800c9a:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800c9d:	89 c0                	mov    %eax,%eax
  800c9f:	48 01 d0             	add    %rdx,%rax
  800ca2:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800ca5:	83 c2 08             	add    $0x8,%edx
  800ca8:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800cab:	eb 0f                	jmp    800cbc <vprintfmt+0x2a5>
  800cad:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800cb1:	48 89 d0             	mov    %rdx,%rax
  800cb4:	48 83 c2 08          	add    $0x8,%rdx
  800cb8:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800cbc:	4c 8b 20             	mov    (%rax),%r12
  800cbf:	4d 85 e4             	test   %r12,%r12
  800cc2:	75 0a                	jne    800cce <vprintfmt+0x2b7>
  800cc4:	49 bc cd 4d 80 00 00 	movabs $0x804dcd,%r12
  800ccb:	00 00 00 
  800cce:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800cd2:	7e 3f                	jle    800d13 <vprintfmt+0x2fc>
  800cd4:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  800cd8:	74 39                	je     800d13 <vprintfmt+0x2fc>
  800cda:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800cdd:	48 98                	cltq   
  800cdf:	48 89 c6             	mov    %rax,%rsi
  800ce2:	4c 89 e7             	mov    %r12,%rdi
  800ce5:	48 b8 db 11 80 00 00 	movabs $0x8011db,%rax
  800cec:	00 00 00 
  800cef:	ff d0                	callq  *%rax
  800cf1:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800cf4:	eb 17                	jmp    800d0d <vprintfmt+0x2f6>
  800cf6:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800cfa:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800cfe:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d02:	48 89 ce             	mov    %rcx,%rsi
  800d05:	89 d7                	mov    %edx,%edi
  800d07:	ff d0                	callq  *%rax
  800d09:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800d0d:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800d11:	7f e3                	jg     800cf6 <vprintfmt+0x2df>
  800d13:	eb 37                	jmp    800d4c <vprintfmt+0x335>
  800d15:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  800d19:	74 1e                	je     800d39 <vprintfmt+0x322>
  800d1b:	83 fb 1f             	cmp    $0x1f,%ebx
  800d1e:	7e 05                	jle    800d25 <vprintfmt+0x30e>
  800d20:	83 fb 7e             	cmp    $0x7e,%ebx
  800d23:	7e 14                	jle    800d39 <vprintfmt+0x322>
  800d25:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d29:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d2d:	48 89 d6             	mov    %rdx,%rsi
  800d30:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800d35:	ff d0                	callq  *%rax
  800d37:	eb 0f                	jmp    800d48 <vprintfmt+0x331>
  800d39:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d3d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d41:	48 89 d6             	mov    %rdx,%rsi
  800d44:	89 df                	mov    %ebx,%edi
  800d46:	ff d0                	callq  *%rax
  800d48:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800d4c:	4c 89 e0             	mov    %r12,%rax
  800d4f:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800d53:	0f b6 00             	movzbl (%rax),%eax
  800d56:	0f be d8             	movsbl %al,%ebx
  800d59:	85 db                	test   %ebx,%ebx
  800d5b:	74 10                	je     800d6d <vprintfmt+0x356>
  800d5d:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800d61:	78 b2                	js     800d15 <vprintfmt+0x2fe>
  800d63:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800d67:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800d6b:	79 a8                	jns    800d15 <vprintfmt+0x2fe>
  800d6d:	eb 16                	jmp    800d85 <vprintfmt+0x36e>
  800d6f:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d73:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d77:	48 89 d6             	mov    %rdx,%rsi
  800d7a:	bf 20 00 00 00       	mov    $0x20,%edi
  800d7f:	ff d0                	callq  *%rax
  800d81:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800d85:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800d89:	7f e4                	jg     800d6f <vprintfmt+0x358>
  800d8b:	e9 90 01 00 00       	jmpq   800f20 <vprintfmt+0x509>
  800d90:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800d94:	be 03 00 00 00       	mov    $0x3,%esi
  800d99:	48 89 c7             	mov    %rax,%rdi
  800d9c:	48 b8 07 09 80 00 00 	movabs $0x800907,%rax
  800da3:	00 00 00 
  800da6:	ff d0                	callq  *%rax
  800da8:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800dac:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800db0:	48 85 c0             	test   %rax,%rax
  800db3:	79 1d                	jns    800dd2 <vprintfmt+0x3bb>
  800db5:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800db9:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800dbd:	48 89 d6             	mov    %rdx,%rsi
  800dc0:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800dc5:	ff d0                	callq  *%rax
  800dc7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800dcb:	48 f7 d8             	neg    %rax
  800dce:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800dd2:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800dd9:	e9 d5 00 00 00       	jmpq   800eb3 <vprintfmt+0x49c>
  800dde:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800de2:	be 03 00 00 00       	mov    $0x3,%esi
  800de7:	48 89 c7             	mov    %rax,%rdi
  800dea:	48 b8 f7 07 80 00 00 	movabs $0x8007f7,%rax
  800df1:	00 00 00 
  800df4:	ff d0                	callq  *%rax
  800df6:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800dfa:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800e01:	e9 ad 00 00 00       	jmpq   800eb3 <vprintfmt+0x49c>
  800e06:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800e0a:	be 03 00 00 00       	mov    $0x3,%esi
  800e0f:	48 89 c7             	mov    %rax,%rdi
  800e12:	48 b8 f7 07 80 00 00 	movabs $0x8007f7,%rax
  800e19:	00 00 00 
  800e1c:	ff d0                	callq  *%rax
  800e1e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800e22:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800e29:	e9 85 00 00 00       	jmpq   800eb3 <vprintfmt+0x49c>
  800e2e:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800e32:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e36:	48 89 d6             	mov    %rdx,%rsi
  800e39:	bf 30 00 00 00       	mov    $0x30,%edi
  800e3e:	ff d0                	callq  *%rax
  800e40:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800e44:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e48:	48 89 d6             	mov    %rdx,%rsi
  800e4b:	bf 78 00 00 00       	mov    $0x78,%edi
  800e50:	ff d0                	callq  *%rax
  800e52:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800e55:	83 f8 30             	cmp    $0x30,%eax
  800e58:	73 17                	jae    800e71 <vprintfmt+0x45a>
  800e5a:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800e5e:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800e61:	89 c0                	mov    %eax,%eax
  800e63:	48 01 d0             	add    %rdx,%rax
  800e66:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800e69:	83 c2 08             	add    $0x8,%edx
  800e6c:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800e6f:	eb 0f                	jmp    800e80 <vprintfmt+0x469>
  800e71:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800e75:	48 89 d0             	mov    %rdx,%rax
  800e78:	48 83 c2 08          	add    $0x8,%rdx
  800e7c:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800e80:	48 8b 00             	mov    (%rax),%rax
  800e83:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800e87:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800e8e:	eb 23                	jmp    800eb3 <vprintfmt+0x49c>
  800e90:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800e94:	be 03 00 00 00       	mov    $0x3,%esi
  800e99:	48 89 c7             	mov    %rax,%rdi
  800e9c:	48 b8 f7 07 80 00 00 	movabs $0x8007f7,%rax
  800ea3:	00 00 00 
  800ea6:	ff d0                	callq  *%rax
  800ea8:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800eac:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800eb3:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  800eb8:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800ebb:	8b 7d dc             	mov    -0x24(%rbp),%edi
  800ebe:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800ec2:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800ec6:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800eca:	45 89 c1             	mov    %r8d,%r9d
  800ecd:	41 89 f8             	mov    %edi,%r8d
  800ed0:	48 89 c7             	mov    %rax,%rdi
  800ed3:	48 b8 3c 07 80 00 00 	movabs $0x80073c,%rax
  800eda:	00 00 00 
  800edd:	ff d0                	callq  *%rax
  800edf:	eb 3f                	jmp    800f20 <vprintfmt+0x509>
  800ee1:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800ee5:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ee9:	48 89 d6             	mov    %rdx,%rsi
  800eec:	89 df                	mov    %ebx,%edi
  800eee:	ff d0                	callq  *%rax
  800ef0:	eb 2e                	jmp    800f20 <vprintfmt+0x509>
  800ef2:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800ef6:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800efa:	48 89 d6             	mov    %rdx,%rsi
  800efd:	bf 25 00 00 00       	mov    $0x25,%edi
  800f02:	ff d0                	callq  *%rax
  800f04:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800f09:	eb 05                	jmp    800f10 <vprintfmt+0x4f9>
  800f0b:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800f10:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800f14:	48 83 e8 01          	sub    $0x1,%rax
  800f18:	0f b6 00             	movzbl (%rax),%eax
  800f1b:	3c 25                	cmp    $0x25,%al
  800f1d:	75 ec                	jne    800f0b <vprintfmt+0x4f4>
  800f1f:	90                   	nop
  800f20:	90                   	nop
  800f21:	e9 43 fb ff ff       	jmpq   800a69 <vprintfmt+0x52>
  800f26:	48 83 c4 60          	add    $0x60,%rsp
  800f2a:	5b                   	pop    %rbx
  800f2b:	41 5c                	pop    %r12
  800f2d:	5d                   	pop    %rbp
  800f2e:	c3                   	retq   

0000000000800f2f <printfmt>:
  800f2f:	55                   	push   %rbp
  800f30:	48 89 e5             	mov    %rsp,%rbp
  800f33:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  800f3a:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  800f41:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  800f48:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800f4f:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800f56:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800f5d:	84 c0                	test   %al,%al
  800f5f:	74 20                	je     800f81 <printfmt+0x52>
  800f61:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800f65:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800f69:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800f6d:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800f71:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800f75:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800f79:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800f7d:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800f81:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  800f88:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  800f8f:	00 00 00 
  800f92:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  800f99:	00 00 00 
  800f9c:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800fa0:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800fa7:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800fae:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  800fb5:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  800fbc:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800fc3:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  800fca:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  800fd1:	48 89 c7             	mov    %rax,%rdi
  800fd4:	48 b8 17 0a 80 00 00 	movabs $0x800a17,%rax
  800fdb:	00 00 00 
  800fde:	ff d0                	callq  *%rax
  800fe0:	c9                   	leaveq 
  800fe1:	c3                   	retq   

0000000000800fe2 <sprintputch>:
  800fe2:	55                   	push   %rbp
  800fe3:	48 89 e5             	mov    %rsp,%rbp
  800fe6:	48 83 ec 10          	sub    $0x10,%rsp
  800fea:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800fed:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800ff1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800ff5:	8b 40 10             	mov    0x10(%rax),%eax
  800ff8:	8d 50 01             	lea    0x1(%rax),%edx
  800ffb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800fff:	89 50 10             	mov    %edx,0x10(%rax)
  801002:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801006:	48 8b 10             	mov    (%rax),%rdx
  801009:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80100d:	48 8b 40 08          	mov    0x8(%rax),%rax
  801011:	48 39 c2             	cmp    %rax,%rdx
  801014:	73 17                	jae    80102d <sprintputch+0x4b>
  801016:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80101a:	48 8b 00             	mov    (%rax),%rax
  80101d:	48 8d 48 01          	lea    0x1(%rax),%rcx
  801021:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801025:	48 89 0a             	mov    %rcx,(%rdx)
  801028:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80102b:	88 10                	mov    %dl,(%rax)
  80102d:	c9                   	leaveq 
  80102e:	c3                   	retq   

000000000080102f <vsnprintf>:
  80102f:	55                   	push   %rbp
  801030:	48 89 e5             	mov    %rsp,%rbp
  801033:	48 83 ec 50          	sub    $0x50,%rsp
  801037:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  80103b:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  80103e:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  801042:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  801046:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  80104a:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  80104e:	48 8b 0a             	mov    (%rdx),%rcx
  801051:	48 89 08             	mov    %rcx,(%rax)
  801054:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  801058:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80105c:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801060:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801064:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801068:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  80106c:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  80106f:	48 98                	cltq   
  801071:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801075:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801079:	48 01 d0             	add    %rdx,%rax
  80107c:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  801080:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  801087:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  80108c:	74 06                	je     801094 <vsnprintf+0x65>
  80108e:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  801092:	7f 07                	jg     80109b <vsnprintf+0x6c>
  801094:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801099:	eb 2f                	jmp    8010ca <vsnprintf+0x9b>
  80109b:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  80109f:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  8010a3:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  8010a7:	48 89 c6             	mov    %rax,%rsi
  8010aa:	48 bf e2 0f 80 00 00 	movabs $0x800fe2,%rdi
  8010b1:	00 00 00 
  8010b4:	48 b8 17 0a 80 00 00 	movabs $0x800a17,%rax
  8010bb:	00 00 00 
  8010be:	ff d0                	callq  *%rax
  8010c0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8010c4:	c6 00 00             	movb   $0x0,(%rax)
  8010c7:	8b 45 e0             	mov    -0x20(%rbp),%eax
  8010ca:	c9                   	leaveq 
  8010cb:	c3                   	retq   

00000000008010cc <snprintf>:
  8010cc:	55                   	push   %rbp
  8010cd:	48 89 e5             	mov    %rsp,%rbp
  8010d0:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  8010d7:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  8010de:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  8010e4:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8010eb:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8010f2:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8010f9:	84 c0                	test   %al,%al
  8010fb:	74 20                	je     80111d <snprintf+0x51>
  8010fd:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  801101:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  801105:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  801109:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  80110d:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  801111:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  801115:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  801119:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  80111d:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  801124:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  80112b:	00 00 00 
  80112e:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  801135:	00 00 00 
  801138:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80113c:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  801143:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  80114a:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  801151:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  801158:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  80115f:	48 8b 0a             	mov    (%rdx),%rcx
  801162:	48 89 08             	mov    %rcx,(%rax)
  801165:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  801169:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80116d:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801171:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801175:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  80117c:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  801183:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  801189:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  801190:	48 89 c7             	mov    %rax,%rdi
  801193:	48 b8 2f 10 80 00 00 	movabs $0x80102f,%rax
  80119a:	00 00 00 
  80119d:	ff d0                	callq  *%rax
  80119f:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  8011a5:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  8011ab:	c9                   	leaveq 
  8011ac:	c3                   	retq   

00000000008011ad <strlen>:
  8011ad:	55                   	push   %rbp
  8011ae:	48 89 e5             	mov    %rsp,%rbp
  8011b1:	48 83 ec 18          	sub    $0x18,%rsp
  8011b5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8011b9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8011c0:	eb 09                	jmp    8011cb <strlen+0x1e>
  8011c2:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8011c6:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8011cb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011cf:	0f b6 00             	movzbl (%rax),%eax
  8011d2:	84 c0                	test   %al,%al
  8011d4:	75 ec                	jne    8011c2 <strlen+0x15>
  8011d6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8011d9:	c9                   	leaveq 
  8011da:	c3                   	retq   

00000000008011db <strnlen>:
  8011db:	55                   	push   %rbp
  8011dc:	48 89 e5             	mov    %rsp,%rbp
  8011df:	48 83 ec 20          	sub    $0x20,%rsp
  8011e3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8011e7:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8011eb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8011f2:	eb 0e                	jmp    801202 <strnlen+0x27>
  8011f4:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8011f8:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8011fd:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  801202:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  801207:	74 0b                	je     801214 <strnlen+0x39>
  801209:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80120d:	0f b6 00             	movzbl (%rax),%eax
  801210:	84 c0                	test   %al,%al
  801212:	75 e0                	jne    8011f4 <strnlen+0x19>
  801214:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801217:	c9                   	leaveq 
  801218:	c3                   	retq   

0000000000801219 <strcpy>:
  801219:	55                   	push   %rbp
  80121a:	48 89 e5             	mov    %rsp,%rbp
  80121d:	48 83 ec 20          	sub    $0x20,%rsp
  801221:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801225:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801229:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80122d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801231:	90                   	nop
  801232:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801236:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80123a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80123e:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801242:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801246:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  80124a:	0f b6 12             	movzbl (%rdx),%edx
  80124d:	88 10                	mov    %dl,(%rax)
  80124f:	0f b6 00             	movzbl (%rax),%eax
  801252:	84 c0                	test   %al,%al
  801254:	75 dc                	jne    801232 <strcpy+0x19>
  801256:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80125a:	c9                   	leaveq 
  80125b:	c3                   	retq   

000000000080125c <strcat>:
  80125c:	55                   	push   %rbp
  80125d:	48 89 e5             	mov    %rsp,%rbp
  801260:	48 83 ec 20          	sub    $0x20,%rsp
  801264:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801268:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80126c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801270:	48 89 c7             	mov    %rax,%rdi
  801273:	48 b8 ad 11 80 00 00 	movabs $0x8011ad,%rax
  80127a:	00 00 00 
  80127d:	ff d0                	callq  *%rax
  80127f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801282:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801285:	48 63 d0             	movslq %eax,%rdx
  801288:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80128c:	48 01 c2             	add    %rax,%rdx
  80128f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801293:	48 89 c6             	mov    %rax,%rsi
  801296:	48 89 d7             	mov    %rdx,%rdi
  801299:	48 b8 19 12 80 00 00 	movabs $0x801219,%rax
  8012a0:	00 00 00 
  8012a3:	ff d0                	callq  *%rax
  8012a5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012a9:	c9                   	leaveq 
  8012aa:	c3                   	retq   

00000000008012ab <strncpy>:
  8012ab:	55                   	push   %rbp
  8012ac:	48 89 e5             	mov    %rsp,%rbp
  8012af:	48 83 ec 28          	sub    $0x28,%rsp
  8012b3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8012b7:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8012bb:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8012bf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012c3:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8012c7:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8012ce:	00 
  8012cf:	eb 2a                	jmp    8012fb <strncpy+0x50>
  8012d1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012d5:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8012d9:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8012dd:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8012e1:	0f b6 12             	movzbl (%rdx),%edx
  8012e4:	88 10                	mov    %dl,(%rax)
  8012e6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8012ea:	0f b6 00             	movzbl (%rax),%eax
  8012ed:	84 c0                	test   %al,%al
  8012ef:	74 05                	je     8012f6 <strncpy+0x4b>
  8012f1:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  8012f6:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8012fb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012ff:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  801303:	72 cc                	jb     8012d1 <strncpy+0x26>
  801305:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801309:	c9                   	leaveq 
  80130a:	c3                   	retq   

000000000080130b <strlcpy>:
  80130b:	55                   	push   %rbp
  80130c:	48 89 e5             	mov    %rsp,%rbp
  80130f:	48 83 ec 28          	sub    $0x28,%rsp
  801313:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801317:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80131b:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80131f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801323:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801327:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80132c:	74 3d                	je     80136b <strlcpy+0x60>
  80132e:	eb 1d                	jmp    80134d <strlcpy+0x42>
  801330:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801334:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801338:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80133c:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801340:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801344:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  801348:	0f b6 12             	movzbl (%rdx),%edx
  80134b:	88 10                	mov    %dl,(%rax)
  80134d:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  801352:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801357:	74 0b                	je     801364 <strlcpy+0x59>
  801359:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80135d:	0f b6 00             	movzbl (%rax),%eax
  801360:	84 c0                	test   %al,%al
  801362:	75 cc                	jne    801330 <strlcpy+0x25>
  801364:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801368:	c6 00 00             	movb   $0x0,(%rax)
  80136b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80136f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801373:	48 29 c2             	sub    %rax,%rdx
  801376:	48 89 d0             	mov    %rdx,%rax
  801379:	c9                   	leaveq 
  80137a:	c3                   	retq   

000000000080137b <strcmp>:
  80137b:	55                   	push   %rbp
  80137c:	48 89 e5             	mov    %rsp,%rbp
  80137f:	48 83 ec 10          	sub    $0x10,%rsp
  801383:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801387:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80138b:	eb 0a                	jmp    801397 <strcmp+0x1c>
  80138d:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801392:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801397:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80139b:	0f b6 00             	movzbl (%rax),%eax
  80139e:	84 c0                	test   %al,%al
  8013a0:	74 12                	je     8013b4 <strcmp+0x39>
  8013a2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013a6:	0f b6 10             	movzbl (%rax),%edx
  8013a9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8013ad:	0f b6 00             	movzbl (%rax),%eax
  8013b0:	38 c2                	cmp    %al,%dl
  8013b2:	74 d9                	je     80138d <strcmp+0x12>
  8013b4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013b8:	0f b6 00             	movzbl (%rax),%eax
  8013bb:	0f b6 d0             	movzbl %al,%edx
  8013be:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8013c2:	0f b6 00             	movzbl (%rax),%eax
  8013c5:	0f b6 c0             	movzbl %al,%eax
  8013c8:	29 c2                	sub    %eax,%edx
  8013ca:	89 d0                	mov    %edx,%eax
  8013cc:	c9                   	leaveq 
  8013cd:	c3                   	retq   

00000000008013ce <strncmp>:
  8013ce:	55                   	push   %rbp
  8013cf:	48 89 e5             	mov    %rsp,%rbp
  8013d2:	48 83 ec 18          	sub    $0x18,%rsp
  8013d6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8013da:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8013de:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8013e2:	eb 0f                	jmp    8013f3 <strncmp+0x25>
  8013e4:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  8013e9:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8013ee:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8013f3:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8013f8:	74 1d                	je     801417 <strncmp+0x49>
  8013fa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013fe:	0f b6 00             	movzbl (%rax),%eax
  801401:	84 c0                	test   %al,%al
  801403:	74 12                	je     801417 <strncmp+0x49>
  801405:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801409:	0f b6 10             	movzbl (%rax),%edx
  80140c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801410:	0f b6 00             	movzbl (%rax),%eax
  801413:	38 c2                	cmp    %al,%dl
  801415:	74 cd                	je     8013e4 <strncmp+0x16>
  801417:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80141c:	75 07                	jne    801425 <strncmp+0x57>
  80141e:	b8 00 00 00 00       	mov    $0x0,%eax
  801423:	eb 18                	jmp    80143d <strncmp+0x6f>
  801425:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801429:	0f b6 00             	movzbl (%rax),%eax
  80142c:	0f b6 d0             	movzbl %al,%edx
  80142f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801433:	0f b6 00             	movzbl (%rax),%eax
  801436:	0f b6 c0             	movzbl %al,%eax
  801439:	29 c2                	sub    %eax,%edx
  80143b:	89 d0                	mov    %edx,%eax
  80143d:	c9                   	leaveq 
  80143e:	c3                   	retq   

000000000080143f <strchr>:
  80143f:	55                   	push   %rbp
  801440:	48 89 e5             	mov    %rsp,%rbp
  801443:	48 83 ec 0c          	sub    $0xc,%rsp
  801447:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80144b:	89 f0                	mov    %esi,%eax
  80144d:	88 45 f4             	mov    %al,-0xc(%rbp)
  801450:	eb 17                	jmp    801469 <strchr+0x2a>
  801452:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801456:	0f b6 00             	movzbl (%rax),%eax
  801459:	3a 45 f4             	cmp    -0xc(%rbp),%al
  80145c:	75 06                	jne    801464 <strchr+0x25>
  80145e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801462:	eb 15                	jmp    801479 <strchr+0x3a>
  801464:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801469:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80146d:	0f b6 00             	movzbl (%rax),%eax
  801470:	84 c0                	test   %al,%al
  801472:	75 de                	jne    801452 <strchr+0x13>
  801474:	b8 00 00 00 00       	mov    $0x0,%eax
  801479:	c9                   	leaveq 
  80147a:	c3                   	retq   

000000000080147b <strfind>:
  80147b:	55                   	push   %rbp
  80147c:	48 89 e5             	mov    %rsp,%rbp
  80147f:	48 83 ec 0c          	sub    $0xc,%rsp
  801483:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801487:	89 f0                	mov    %esi,%eax
  801489:	88 45 f4             	mov    %al,-0xc(%rbp)
  80148c:	eb 13                	jmp    8014a1 <strfind+0x26>
  80148e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801492:	0f b6 00             	movzbl (%rax),%eax
  801495:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801498:	75 02                	jne    80149c <strfind+0x21>
  80149a:	eb 10                	jmp    8014ac <strfind+0x31>
  80149c:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8014a1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014a5:	0f b6 00             	movzbl (%rax),%eax
  8014a8:	84 c0                	test   %al,%al
  8014aa:	75 e2                	jne    80148e <strfind+0x13>
  8014ac:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014b0:	c9                   	leaveq 
  8014b1:	c3                   	retq   

00000000008014b2 <memset>:
  8014b2:	55                   	push   %rbp
  8014b3:	48 89 e5             	mov    %rsp,%rbp
  8014b6:	48 83 ec 18          	sub    $0x18,%rsp
  8014ba:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8014be:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8014c1:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8014c5:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8014ca:	75 06                	jne    8014d2 <memset+0x20>
  8014cc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014d0:	eb 69                	jmp    80153b <memset+0x89>
  8014d2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014d6:	83 e0 03             	and    $0x3,%eax
  8014d9:	48 85 c0             	test   %rax,%rax
  8014dc:	75 48                	jne    801526 <memset+0x74>
  8014de:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014e2:	83 e0 03             	and    $0x3,%eax
  8014e5:	48 85 c0             	test   %rax,%rax
  8014e8:	75 3c                	jne    801526 <memset+0x74>
  8014ea:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  8014f1:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8014f4:	c1 e0 18             	shl    $0x18,%eax
  8014f7:	89 c2                	mov    %eax,%edx
  8014f9:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8014fc:	c1 e0 10             	shl    $0x10,%eax
  8014ff:	09 c2                	or     %eax,%edx
  801501:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801504:	c1 e0 08             	shl    $0x8,%eax
  801507:	09 d0                	or     %edx,%eax
  801509:	09 45 f4             	or     %eax,-0xc(%rbp)
  80150c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801510:	48 c1 e8 02          	shr    $0x2,%rax
  801514:	48 89 c1             	mov    %rax,%rcx
  801517:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80151b:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80151e:	48 89 d7             	mov    %rdx,%rdi
  801521:	fc                   	cld    
  801522:	f3 ab                	rep stos %eax,%es:(%rdi)
  801524:	eb 11                	jmp    801537 <memset+0x85>
  801526:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80152a:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80152d:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801531:	48 89 d7             	mov    %rdx,%rdi
  801534:	fc                   	cld    
  801535:	f3 aa                	rep stos %al,%es:(%rdi)
  801537:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80153b:	c9                   	leaveq 
  80153c:	c3                   	retq   

000000000080153d <memmove>:
  80153d:	55                   	push   %rbp
  80153e:	48 89 e5             	mov    %rsp,%rbp
  801541:	48 83 ec 28          	sub    $0x28,%rsp
  801545:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801549:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80154d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801551:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801555:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801559:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80155d:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801561:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801565:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801569:	0f 83 88 00 00 00    	jae    8015f7 <memmove+0xba>
  80156f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801573:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801577:	48 01 d0             	add    %rdx,%rax
  80157a:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  80157e:	76 77                	jbe    8015f7 <memmove+0xba>
  801580:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801584:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  801588:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80158c:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  801590:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801594:	83 e0 03             	and    $0x3,%eax
  801597:	48 85 c0             	test   %rax,%rax
  80159a:	75 3b                	jne    8015d7 <memmove+0x9a>
  80159c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015a0:	83 e0 03             	and    $0x3,%eax
  8015a3:	48 85 c0             	test   %rax,%rax
  8015a6:	75 2f                	jne    8015d7 <memmove+0x9a>
  8015a8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015ac:	83 e0 03             	and    $0x3,%eax
  8015af:	48 85 c0             	test   %rax,%rax
  8015b2:	75 23                	jne    8015d7 <memmove+0x9a>
  8015b4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015b8:	48 83 e8 04          	sub    $0x4,%rax
  8015bc:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8015c0:	48 83 ea 04          	sub    $0x4,%rdx
  8015c4:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  8015c8:	48 c1 e9 02          	shr    $0x2,%rcx
  8015cc:	48 89 c7             	mov    %rax,%rdi
  8015cf:	48 89 d6             	mov    %rdx,%rsi
  8015d2:	fd                   	std    
  8015d3:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  8015d5:	eb 1d                	jmp    8015f4 <memmove+0xb7>
  8015d7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015db:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8015df:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015e3:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  8015e7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015eb:	48 89 d7             	mov    %rdx,%rdi
  8015ee:	48 89 c1             	mov    %rax,%rcx
  8015f1:	fd                   	std    
  8015f2:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  8015f4:	fc                   	cld    
  8015f5:	eb 57                	jmp    80164e <memmove+0x111>
  8015f7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015fb:	83 e0 03             	and    $0x3,%eax
  8015fe:	48 85 c0             	test   %rax,%rax
  801601:	75 36                	jne    801639 <memmove+0xfc>
  801603:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801607:	83 e0 03             	and    $0x3,%eax
  80160a:	48 85 c0             	test   %rax,%rax
  80160d:	75 2a                	jne    801639 <memmove+0xfc>
  80160f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801613:	83 e0 03             	and    $0x3,%eax
  801616:	48 85 c0             	test   %rax,%rax
  801619:	75 1e                	jne    801639 <memmove+0xfc>
  80161b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80161f:	48 c1 e8 02          	shr    $0x2,%rax
  801623:	48 89 c1             	mov    %rax,%rcx
  801626:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80162a:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80162e:	48 89 c7             	mov    %rax,%rdi
  801631:	48 89 d6             	mov    %rdx,%rsi
  801634:	fc                   	cld    
  801635:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801637:	eb 15                	jmp    80164e <memmove+0x111>
  801639:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80163d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801641:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801645:	48 89 c7             	mov    %rax,%rdi
  801648:	48 89 d6             	mov    %rdx,%rsi
  80164b:	fc                   	cld    
  80164c:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  80164e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801652:	c9                   	leaveq 
  801653:	c3                   	retq   

0000000000801654 <memcpy>:
  801654:	55                   	push   %rbp
  801655:	48 89 e5             	mov    %rsp,%rbp
  801658:	48 83 ec 18          	sub    $0x18,%rsp
  80165c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801660:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801664:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801668:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80166c:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  801670:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801674:	48 89 ce             	mov    %rcx,%rsi
  801677:	48 89 c7             	mov    %rax,%rdi
  80167a:	48 b8 3d 15 80 00 00 	movabs $0x80153d,%rax
  801681:	00 00 00 
  801684:	ff d0                	callq  *%rax
  801686:	c9                   	leaveq 
  801687:	c3                   	retq   

0000000000801688 <memcmp>:
  801688:	55                   	push   %rbp
  801689:	48 89 e5             	mov    %rsp,%rbp
  80168c:	48 83 ec 28          	sub    $0x28,%rsp
  801690:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801694:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801698:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80169c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8016a0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8016a4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8016a8:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8016ac:	eb 36                	jmp    8016e4 <memcmp+0x5c>
  8016ae:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016b2:	0f b6 10             	movzbl (%rax),%edx
  8016b5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8016b9:	0f b6 00             	movzbl (%rax),%eax
  8016bc:	38 c2                	cmp    %al,%dl
  8016be:	74 1a                	je     8016da <memcmp+0x52>
  8016c0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016c4:	0f b6 00             	movzbl (%rax),%eax
  8016c7:	0f b6 d0             	movzbl %al,%edx
  8016ca:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8016ce:	0f b6 00             	movzbl (%rax),%eax
  8016d1:	0f b6 c0             	movzbl %al,%eax
  8016d4:	29 c2                	sub    %eax,%edx
  8016d6:	89 d0                	mov    %edx,%eax
  8016d8:	eb 20                	jmp    8016fa <memcmp+0x72>
  8016da:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8016df:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8016e4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016e8:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8016ec:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8016f0:	48 85 c0             	test   %rax,%rax
  8016f3:	75 b9                	jne    8016ae <memcmp+0x26>
  8016f5:	b8 00 00 00 00       	mov    $0x0,%eax
  8016fa:	c9                   	leaveq 
  8016fb:	c3                   	retq   

00000000008016fc <memfind>:
  8016fc:	55                   	push   %rbp
  8016fd:	48 89 e5             	mov    %rsp,%rbp
  801700:	48 83 ec 28          	sub    $0x28,%rsp
  801704:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801708:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80170b:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80170f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801713:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801717:	48 01 d0             	add    %rdx,%rax
  80171a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80171e:	eb 15                	jmp    801735 <memfind+0x39>
  801720:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801724:	0f b6 10             	movzbl (%rax),%edx
  801727:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80172a:	38 c2                	cmp    %al,%dl
  80172c:	75 02                	jne    801730 <memfind+0x34>
  80172e:	eb 0f                	jmp    80173f <memfind+0x43>
  801730:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801735:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801739:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  80173d:	72 e1                	jb     801720 <memfind+0x24>
  80173f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801743:	c9                   	leaveq 
  801744:	c3                   	retq   

0000000000801745 <strtol>:
  801745:	55                   	push   %rbp
  801746:	48 89 e5             	mov    %rsp,%rbp
  801749:	48 83 ec 34          	sub    $0x34,%rsp
  80174d:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801751:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801755:	89 55 cc             	mov    %edx,-0x34(%rbp)
  801758:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80175f:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  801766:	00 
  801767:	eb 05                	jmp    80176e <strtol+0x29>
  801769:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80176e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801772:	0f b6 00             	movzbl (%rax),%eax
  801775:	3c 20                	cmp    $0x20,%al
  801777:	74 f0                	je     801769 <strtol+0x24>
  801779:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80177d:	0f b6 00             	movzbl (%rax),%eax
  801780:	3c 09                	cmp    $0x9,%al
  801782:	74 e5                	je     801769 <strtol+0x24>
  801784:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801788:	0f b6 00             	movzbl (%rax),%eax
  80178b:	3c 2b                	cmp    $0x2b,%al
  80178d:	75 07                	jne    801796 <strtol+0x51>
  80178f:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801794:	eb 17                	jmp    8017ad <strtol+0x68>
  801796:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80179a:	0f b6 00             	movzbl (%rax),%eax
  80179d:	3c 2d                	cmp    $0x2d,%al
  80179f:	75 0c                	jne    8017ad <strtol+0x68>
  8017a1:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8017a6:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  8017ad:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8017b1:	74 06                	je     8017b9 <strtol+0x74>
  8017b3:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  8017b7:	75 28                	jne    8017e1 <strtol+0x9c>
  8017b9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017bd:	0f b6 00             	movzbl (%rax),%eax
  8017c0:	3c 30                	cmp    $0x30,%al
  8017c2:	75 1d                	jne    8017e1 <strtol+0x9c>
  8017c4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017c8:	48 83 c0 01          	add    $0x1,%rax
  8017cc:	0f b6 00             	movzbl (%rax),%eax
  8017cf:	3c 78                	cmp    $0x78,%al
  8017d1:	75 0e                	jne    8017e1 <strtol+0x9c>
  8017d3:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  8017d8:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  8017df:	eb 2c                	jmp    80180d <strtol+0xc8>
  8017e1:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8017e5:	75 19                	jne    801800 <strtol+0xbb>
  8017e7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017eb:	0f b6 00             	movzbl (%rax),%eax
  8017ee:	3c 30                	cmp    $0x30,%al
  8017f0:	75 0e                	jne    801800 <strtol+0xbb>
  8017f2:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8017f7:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  8017fe:	eb 0d                	jmp    80180d <strtol+0xc8>
  801800:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801804:	75 07                	jne    80180d <strtol+0xc8>
  801806:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  80180d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801811:	0f b6 00             	movzbl (%rax),%eax
  801814:	3c 2f                	cmp    $0x2f,%al
  801816:	7e 1d                	jle    801835 <strtol+0xf0>
  801818:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80181c:	0f b6 00             	movzbl (%rax),%eax
  80181f:	3c 39                	cmp    $0x39,%al
  801821:	7f 12                	jg     801835 <strtol+0xf0>
  801823:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801827:	0f b6 00             	movzbl (%rax),%eax
  80182a:	0f be c0             	movsbl %al,%eax
  80182d:	83 e8 30             	sub    $0x30,%eax
  801830:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801833:	eb 4e                	jmp    801883 <strtol+0x13e>
  801835:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801839:	0f b6 00             	movzbl (%rax),%eax
  80183c:	3c 60                	cmp    $0x60,%al
  80183e:	7e 1d                	jle    80185d <strtol+0x118>
  801840:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801844:	0f b6 00             	movzbl (%rax),%eax
  801847:	3c 7a                	cmp    $0x7a,%al
  801849:	7f 12                	jg     80185d <strtol+0x118>
  80184b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80184f:	0f b6 00             	movzbl (%rax),%eax
  801852:	0f be c0             	movsbl %al,%eax
  801855:	83 e8 57             	sub    $0x57,%eax
  801858:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80185b:	eb 26                	jmp    801883 <strtol+0x13e>
  80185d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801861:	0f b6 00             	movzbl (%rax),%eax
  801864:	3c 40                	cmp    $0x40,%al
  801866:	7e 48                	jle    8018b0 <strtol+0x16b>
  801868:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80186c:	0f b6 00             	movzbl (%rax),%eax
  80186f:	3c 5a                	cmp    $0x5a,%al
  801871:	7f 3d                	jg     8018b0 <strtol+0x16b>
  801873:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801877:	0f b6 00             	movzbl (%rax),%eax
  80187a:	0f be c0             	movsbl %al,%eax
  80187d:	83 e8 37             	sub    $0x37,%eax
  801880:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801883:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801886:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  801889:	7c 02                	jl     80188d <strtol+0x148>
  80188b:	eb 23                	jmp    8018b0 <strtol+0x16b>
  80188d:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801892:	8b 45 cc             	mov    -0x34(%rbp),%eax
  801895:	48 98                	cltq   
  801897:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  80189c:	48 89 c2             	mov    %rax,%rdx
  80189f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8018a2:	48 98                	cltq   
  8018a4:	48 01 d0             	add    %rdx,%rax
  8018a7:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8018ab:	e9 5d ff ff ff       	jmpq   80180d <strtol+0xc8>
  8018b0:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  8018b5:	74 0b                	je     8018c2 <strtol+0x17d>
  8018b7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8018bb:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8018bf:	48 89 10             	mov    %rdx,(%rax)
  8018c2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8018c6:	74 09                	je     8018d1 <strtol+0x18c>
  8018c8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8018cc:	48 f7 d8             	neg    %rax
  8018cf:	eb 04                	jmp    8018d5 <strtol+0x190>
  8018d1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8018d5:	c9                   	leaveq 
  8018d6:	c3                   	retq   

00000000008018d7 <strstr>:
  8018d7:	55                   	push   %rbp
  8018d8:	48 89 e5             	mov    %rsp,%rbp
  8018db:	48 83 ec 30          	sub    $0x30,%rsp
  8018df:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8018e3:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8018e7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8018eb:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8018ef:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  8018f3:	0f b6 00             	movzbl (%rax),%eax
  8018f6:	88 45 ff             	mov    %al,-0x1(%rbp)
  8018f9:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  8018fd:	75 06                	jne    801905 <strstr+0x2e>
  8018ff:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801903:	eb 6b                	jmp    801970 <strstr+0x99>
  801905:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801909:	48 89 c7             	mov    %rax,%rdi
  80190c:	48 b8 ad 11 80 00 00 	movabs $0x8011ad,%rax
  801913:	00 00 00 
  801916:	ff d0                	callq  *%rax
  801918:	48 98                	cltq   
  80191a:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80191e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801922:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801926:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80192a:	0f b6 00             	movzbl (%rax),%eax
  80192d:	88 45 ef             	mov    %al,-0x11(%rbp)
  801930:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  801934:	75 07                	jne    80193d <strstr+0x66>
  801936:	b8 00 00 00 00       	mov    $0x0,%eax
  80193b:	eb 33                	jmp    801970 <strstr+0x99>
  80193d:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  801941:	3a 45 ff             	cmp    -0x1(%rbp),%al
  801944:	75 d8                	jne    80191e <strstr+0x47>
  801946:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80194a:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  80194e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801952:	48 89 ce             	mov    %rcx,%rsi
  801955:	48 89 c7             	mov    %rax,%rdi
  801958:	48 b8 ce 13 80 00 00 	movabs $0x8013ce,%rax
  80195f:	00 00 00 
  801962:	ff d0                	callq  *%rax
  801964:	85 c0                	test   %eax,%eax
  801966:	75 b6                	jne    80191e <strstr+0x47>
  801968:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80196c:	48 83 e8 01          	sub    $0x1,%rax
  801970:	c9                   	leaveq 
  801971:	c3                   	retq   

0000000000801972 <syscall>:
  801972:	55                   	push   %rbp
  801973:	48 89 e5             	mov    %rsp,%rbp
  801976:	53                   	push   %rbx
  801977:	48 83 ec 48          	sub    $0x48,%rsp
  80197b:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80197e:	89 75 d8             	mov    %esi,-0x28(%rbp)
  801981:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801985:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  801989:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  80198d:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  801991:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801994:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  801998:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  80199c:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  8019a0:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  8019a4:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  8019a8:	4c 89 c3             	mov    %r8,%rbx
  8019ab:	cd 30                	int    $0x30
  8019ad:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8019b1:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  8019b5:	74 3e                	je     8019f5 <syscall+0x83>
  8019b7:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8019bc:	7e 37                	jle    8019f5 <syscall+0x83>
  8019be:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8019c2:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8019c5:	49 89 d0             	mov    %rdx,%r8
  8019c8:	89 c1                	mov    %eax,%ecx
  8019ca:	48 ba 88 50 80 00 00 	movabs $0x805088,%rdx
  8019d1:	00 00 00 
  8019d4:	be 24 00 00 00       	mov    $0x24,%esi
  8019d9:	48 bf a5 50 80 00 00 	movabs $0x8050a5,%rdi
  8019e0:	00 00 00 
  8019e3:	b8 00 00 00 00       	mov    $0x0,%eax
  8019e8:	49 b9 2b 04 80 00 00 	movabs $0x80042b,%r9
  8019ef:	00 00 00 
  8019f2:	41 ff d1             	callq  *%r9
  8019f5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8019f9:	48 83 c4 48          	add    $0x48,%rsp
  8019fd:	5b                   	pop    %rbx
  8019fe:	5d                   	pop    %rbp
  8019ff:	c3                   	retq   

0000000000801a00 <sys_cputs>:
  801a00:	55                   	push   %rbp
  801a01:	48 89 e5             	mov    %rsp,%rbp
  801a04:	48 83 ec 20          	sub    $0x20,%rsp
  801a08:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801a0c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a10:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801a14:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801a18:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801a1f:	00 
  801a20:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a26:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a2c:	48 89 d1             	mov    %rdx,%rcx
  801a2f:	48 89 c2             	mov    %rax,%rdx
  801a32:	be 00 00 00 00       	mov    $0x0,%esi
  801a37:	bf 00 00 00 00       	mov    $0x0,%edi
  801a3c:	48 b8 72 19 80 00 00 	movabs $0x801972,%rax
  801a43:	00 00 00 
  801a46:	ff d0                	callq  *%rax
  801a48:	c9                   	leaveq 
  801a49:	c3                   	retq   

0000000000801a4a <sys_cgetc>:
  801a4a:	55                   	push   %rbp
  801a4b:	48 89 e5             	mov    %rsp,%rbp
  801a4e:	48 83 ec 10          	sub    $0x10,%rsp
  801a52:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801a59:	00 
  801a5a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a60:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a66:	b9 00 00 00 00       	mov    $0x0,%ecx
  801a6b:	ba 00 00 00 00       	mov    $0x0,%edx
  801a70:	be 00 00 00 00       	mov    $0x0,%esi
  801a75:	bf 01 00 00 00       	mov    $0x1,%edi
  801a7a:	48 b8 72 19 80 00 00 	movabs $0x801972,%rax
  801a81:	00 00 00 
  801a84:	ff d0                	callq  *%rax
  801a86:	c9                   	leaveq 
  801a87:	c3                   	retq   

0000000000801a88 <sys_env_destroy>:
  801a88:	55                   	push   %rbp
  801a89:	48 89 e5             	mov    %rsp,%rbp
  801a8c:	48 83 ec 10          	sub    $0x10,%rsp
  801a90:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a93:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a96:	48 98                	cltq   
  801a98:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801a9f:	00 
  801aa0:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801aa6:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801aac:	b9 00 00 00 00       	mov    $0x0,%ecx
  801ab1:	48 89 c2             	mov    %rax,%rdx
  801ab4:	be 01 00 00 00       	mov    $0x1,%esi
  801ab9:	bf 03 00 00 00       	mov    $0x3,%edi
  801abe:	48 b8 72 19 80 00 00 	movabs $0x801972,%rax
  801ac5:	00 00 00 
  801ac8:	ff d0                	callq  *%rax
  801aca:	c9                   	leaveq 
  801acb:	c3                   	retq   

0000000000801acc <sys_getenvid>:
  801acc:	55                   	push   %rbp
  801acd:	48 89 e5             	mov    %rsp,%rbp
  801ad0:	48 83 ec 10          	sub    $0x10,%rsp
  801ad4:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801adb:	00 
  801adc:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ae2:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ae8:	b9 00 00 00 00       	mov    $0x0,%ecx
  801aed:	ba 00 00 00 00       	mov    $0x0,%edx
  801af2:	be 00 00 00 00       	mov    $0x0,%esi
  801af7:	bf 02 00 00 00       	mov    $0x2,%edi
  801afc:	48 b8 72 19 80 00 00 	movabs $0x801972,%rax
  801b03:	00 00 00 
  801b06:	ff d0                	callq  *%rax
  801b08:	c9                   	leaveq 
  801b09:	c3                   	retq   

0000000000801b0a <sys_yield>:
  801b0a:	55                   	push   %rbp
  801b0b:	48 89 e5             	mov    %rsp,%rbp
  801b0e:	48 83 ec 10          	sub    $0x10,%rsp
  801b12:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801b19:	00 
  801b1a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b20:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b26:	b9 00 00 00 00       	mov    $0x0,%ecx
  801b2b:	ba 00 00 00 00       	mov    $0x0,%edx
  801b30:	be 00 00 00 00       	mov    $0x0,%esi
  801b35:	bf 0b 00 00 00       	mov    $0xb,%edi
  801b3a:	48 b8 72 19 80 00 00 	movabs $0x801972,%rax
  801b41:	00 00 00 
  801b44:	ff d0                	callq  *%rax
  801b46:	c9                   	leaveq 
  801b47:	c3                   	retq   

0000000000801b48 <sys_page_alloc>:
  801b48:	55                   	push   %rbp
  801b49:	48 89 e5             	mov    %rsp,%rbp
  801b4c:	48 83 ec 20          	sub    $0x20,%rsp
  801b50:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b53:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b57:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801b5a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801b5d:	48 63 c8             	movslq %eax,%rcx
  801b60:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b64:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b67:	48 98                	cltq   
  801b69:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801b70:	00 
  801b71:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b77:	49 89 c8             	mov    %rcx,%r8
  801b7a:	48 89 d1             	mov    %rdx,%rcx
  801b7d:	48 89 c2             	mov    %rax,%rdx
  801b80:	be 01 00 00 00       	mov    $0x1,%esi
  801b85:	bf 04 00 00 00       	mov    $0x4,%edi
  801b8a:	48 b8 72 19 80 00 00 	movabs $0x801972,%rax
  801b91:	00 00 00 
  801b94:	ff d0                	callq  *%rax
  801b96:	c9                   	leaveq 
  801b97:	c3                   	retq   

0000000000801b98 <sys_page_map>:
  801b98:	55                   	push   %rbp
  801b99:	48 89 e5             	mov    %rsp,%rbp
  801b9c:	48 83 ec 30          	sub    $0x30,%rsp
  801ba0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801ba3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801ba7:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801baa:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801bae:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801bb2:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801bb5:	48 63 c8             	movslq %eax,%rcx
  801bb8:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801bbc:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801bbf:	48 63 f0             	movslq %eax,%rsi
  801bc2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801bc6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801bc9:	48 98                	cltq   
  801bcb:	48 89 0c 24          	mov    %rcx,(%rsp)
  801bcf:	49 89 f9             	mov    %rdi,%r9
  801bd2:	49 89 f0             	mov    %rsi,%r8
  801bd5:	48 89 d1             	mov    %rdx,%rcx
  801bd8:	48 89 c2             	mov    %rax,%rdx
  801bdb:	be 01 00 00 00       	mov    $0x1,%esi
  801be0:	bf 05 00 00 00       	mov    $0x5,%edi
  801be5:	48 b8 72 19 80 00 00 	movabs $0x801972,%rax
  801bec:	00 00 00 
  801bef:	ff d0                	callq  *%rax
  801bf1:	c9                   	leaveq 
  801bf2:	c3                   	retq   

0000000000801bf3 <sys_page_unmap>:
  801bf3:	55                   	push   %rbp
  801bf4:	48 89 e5             	mov    %rsp,%rbp
  801bf7:	48 83 ec 20          	sub    $0x20,%rsp
  801bfb:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801bfe:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c02:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c06:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c09:	48 98                	cltq   
  801c0b:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c12:	00 
  801c13:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c19:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c1f:	48 89 d1             	mov    %rdx,%rcx
  801c22:	48 89 c2             	mov    %rax,%rdx
  801c25:	be 01 00 00 00       	mov    $0x1,%esi
  801c2a:	bf 06 00 00 00       	mov    $0x6,%edi
  801c2f:	48 b8 72 19 80 00 00 	movabs $0x801972,%rax
  801c36:	00 00 00 
  801c39:	ff d0                	callq  *%rax
  801c3b:	c9                   	leaveq 
  801c3c:	c3                   	retq   

0000000000801c3d <sys_env_set_status>:
  801c3d:	55                   	push   %rbp
  801c3e:	48 89 e5             	mov    %rsp,%rbp
  801c41:	48 83 ec 10          	sub    $0x10,%rsp
  801c45:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801c48:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801c4b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801c4e:	48 63 d0             	movslq %eax,%rdx
  801c51:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c54:	48 98                	cltq   
  801c56:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c5d:	00 
  801c5e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c64:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c6a:	48 89 d1             	mov    %rdx,%rcx
  801c6d:	48 89 c2             	mov    %rax,%rdx
  801c70:	be 01 00 00 00       	mov    $0x1,%esi
  801c75:	bf 08 00 00 00       	mov    $0x8,%edi
  801c7a:	48 b8 72 19 80 00 00 	movabs $0x801972,%rax
  801c81:	00 00 00 
  801c84:	ff d0                	callq  *%rax
  801c86:	c9                   	leaveq 
  801c87:	c3                   	retq   

0000000000801c88 <sys_env_set_trapframe>:
  801c88:	55                   	push   %rbp
  801c89:	48 89 e5             	mov    %rsp,%rbp
  801c8c:	48 83 ec 20          	sub    $0x20,%rsp
  801c90:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801c93:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c97:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c9b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c9e:	48 98                	cltq   
  801ca0:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801ca7:	00 
  801ca8:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801cae:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801cb4:	48 89 d1             	mov    %rdx,%rcx
  801cb7:	48 89 c2             	mov    %rax,%rdx
  801cba:	be 01 00 00 00       	mov    $0x1,%esi
  801cbf:	bf 09 00 00 00       	mov    $0x9,%edi
  801cc4:	48 b8 72 19 80 00 00 	movabs $0x801972,%rax
  801ccb:	00 00 00 
  801cce:	ff d0                	callq  *%rax
  801cd0:	c9                   	leaveq 
  801cd1:	c3                   	retq   

0000000000801cd2 <sys_env_set_pgfault_upcall>:
  801cd2:	55                   	push   %rbp
  801cd3:	48 89 e5             	mov    %rsp,%rbp
  801cd6:	48 83 ec 20          	sub    $0x20,%rsp
  801cda:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801cdd:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801ce1:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801ce5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ce8:	48 98                	cltq   
  801cea:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801cf1:	00 
  801cf2:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801cf8:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801cfe:	48 89 d1             	mov    %rdx,%rcx
  801d01:	48 89 c2             	mov    %rax,%rdx
  801d04:	be 01 00 00 00       	mov    $0x1,%esi
  801d09:	bf 0a 00 00 00       	mov    $0xa,%edi
  801d0e:	48 b8 72 19 80 00 00 	movabs $0x801972,%rax
  801d15:	00 00 00 
  801d18:	ff d0                	callq  *%rax
  801d1a:	c9                   	leaveq 
  801d1b:	c3                   	retq   

0000000000801d1c <sys_ipc_try_send>:
  801d1c:	55                   	push   %rbp
  801d1d:	48 89 e5             	mov    %rsp,%rbp
  801d20:	48 83 ec 20          	sub    $0x20,%rsp
  801d24:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801d27:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d2b:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801d2f:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801d32:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801d35:	48 63 f0             	movslq %eax,%rsi
  801d38:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801d3c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801d3f:	48 98                	cltq   
  801d41:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d45:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801d4c:	00 
  801d4d:	49 89 f1             	mov    %rsi,%r9
  801d50:	49 89 c8             	mov    %rcx,%r8
  801d53:	48 89 d1             	mov    %rdx,%rcx
  801d56:	48 89 c2             	mov    %rax,%rdx
  801d59:	be 00 00 00 00       	mov    $0x0,%esi
  801d5e:	bf 0c 00 00 00       	mov    $0xc,%edi
  801d63:	48 b8 72 19 80 00 00 	movabs $0x801972,%rax
  801d6a:	00 00 00 
  801d6d:	ff d0                	callq  *%rax
  801d6f:	c9                   	leaveq 
  801d70:	c3                   	retq   

0000000000801d71 <sys_ipc_recv>:
  801d71:	55                   	push   %rbp
  801d72:	48 89 e5             	mov    %rsp,%rbp
  801d75:	48 83 ec 10          	sub    $0x10,%rsp
  801d79:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d7d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d81:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801d88:	00 
  801d89:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d8f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d95:	b9 00 00 00 00       	mov    $0x0,%ecx
  801d9a:	48 89 c2             	mov    %rax,%rdx
  801d9d:	be 01 00 00 00       	mov    $0x1,%esi
  801da2:	bf 0d 00 00 00       	mov    $0xd,%edi
  801da7:	48 b8 72 19 80 00 00 	movabs $0x801972,%rax
  801dae:	00 00 00 
  801db1:	ff d0                	callq  *%rax
  801db3:	c9                   	leaveq 
  801db4:	c3                   	retq   

0000000000801db5 <sys_time_msec>:
  801db5:	55                   	push   %rbp
  801db6:	48 89 e5             	mov    %rsp,%rbp
  801db9:	48 83 ec 10          	sub    $0x10,%rsp
  801dbd:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801dc4:	00 
  801dc5:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801dcb:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801dd1:	b9 00 00 00 00       	mov    $0x0,%ecx
  801dd6:	ba 00 00 00 00       	mov    $0x0,%edx
  801ddb:	be 00 00 00 00       	mov    $0x0,%esi
  801de0:	bf 0e 00 00 00       	mov    $0xe,%edi
  801de5:	48 b8 72 19 80 00 00 	movabs $0x801972,%rax
  801dec:	00 00 00 
  801def:	ff d0                	callq  *%rax
  801df1:	c9                   	leaveq 
  801df2:	c3                   	retq   

0000000000801df3 <sys_net_transmit>:
  801df3:	55                   	push   %rbp
  801df4:	48 89 e5             	mov    %rsp,%rbp
  801df7:	48 83 ec 20          	sub    $0x20,%rsp
  801dfb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801dff:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801e02:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801e05:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e09:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801e10:	00 
  801e11:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e17:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e1d:	48 89 d1             	mov    %rdx,%rcx
  801e20:	48 89 c2             	mov    %rax,%rdx
  801e23:	be 00 00 00 00       	mov    $0x0,%esi
  801e28:	bf 0f 00 00 00       	mov    $0xf,%edi
  801e2d:	48 b8 72 19 80 00 00 	movabs $0x801972,%rax
  801e34:	00 00 00 
  801e37:	ff d0                	callq  *%rax
  801e39:	c9                   	leaveq 
  801e3a:	c3                   	retq   

0000000000801e3b <sys_net_receive>:
  801e3b:	55                   	push   %rbp
  801e3c:	48 89 e5             	mov    %rsp,%rbp
  801e3f:	48 83 ec 20          	sub    $0x20,%rsp
  801e43:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801e47:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801e4a:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801e4d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e51:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801e58:	00 
  801e59:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e5f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e65:	48 89 d1             	mov    %rdx,%rcx
  801e68:	48 89 c2             	mov    %rax,%rdx
  801e6b:	be 00 00 00 00       	mov    $0x0,%esi
  801e70:	bf 10 00 00 00       	mov    $0x10,%edi
  801e75:	48 b8 72 19 80 00 00 	movabs $0x801972,%rax
  801e7c:	00 00 00 
  801e7f:	ff d0                	callq  *%rax
  801e81:	c9                   	leaveq 
  801e82:	c3                   	retq   

0000000000801e83 <sys_ept_map>:
  801e83:	55                   	push   %rbp
  801e84:	48 89 e5             	mov    %rsp,%rbp
  801e87:	48 83 ec 30          	sub    $0x30,%rsp
  801e8b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801e8e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801e92:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801e95:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801e99:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801e9d:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801ea0:	48 63 c8             	movslq %eax,%rcx
  801ea3:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801ea7:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801eaa:	48 63 f0             	movslq %eax,%rsi
  801ead:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801eb1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801eb4:	48 98                	cltq   
  801eb6:	48 89 0c 24          	mov    %rcx,(%rsp)
  801eba:	49 89 f9             	mov    %rdi,%r9
  801ebd:	49 89 f0             	mov    %rsi,%r8
  801ec0:	48 89 d1             	mov    %rdx,%rcx
  801ec3:	48 89 c2             	mov    %rax,%rdx
  801ec6:	be 00 00 00 00       	mov    $0x0,%esi
  801ecb:	bf 11 00 00 00       	mov    $0x11,%edi
  801ed0:	48 b8 72 19 80 00 00 	movabs $0x801972,%rax
  801ed7:	00 00 00 
  801eda:	ff d0                	callq  *%rax
  801edc:	c9                   	leaveq 
  801edd:	c3                   	retq   

0000000000801ede <sys_env_mkguest>:
  801ede:	55                   	push   %rbp
  801edf:	48 89 e5             	mov    %rsp,%rbp
  801ee2:	48 83 ec 20          	sub    $0x20,%rsp
  801ee6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801eea:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801eee:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801ef2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ef6:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801efd:	00 
  801efe:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801f04:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801f0a:	48 89 d1             	mov    %rdx,%rcx
  801f0d:	48 89 c2             	mov    %rax,%rdx
  801f10:	be 00 00 00 00       	mov    $0x0,%esi
  801f15:	bf 12 00 00 00       	mov    $0x12,%edi
  801f1a:	48 b8 72 19 80 00 00 	movabs $0x801972,%rax
  801f21:	00 00 00 
  801f24:	ff d0                	callq  *%rax
  801f26:	c9                   	leaveq 
  801f27:	c3                   	retq   

0000000000801f28 <sys_vmx_list_vms>:
  801f28:	55                   	push   %rbp
  801f29:	48 89 e5             	mov    %rsp,%rbp
  801f2c:	48 83 ec 10          	sub    $0x10,%rsp
  801f30:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801f37:	00 
  801f38:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801f3e:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801f44:	b9 00 00 00 00       	mov    $0x0,%ecx
  801f49:	ba 00 00 00 00       	mov    $0x0,%edx
  801f4e:	be 00 00 00 00       	mov    $0x0,%esi
  801f53:	bf 13 00 00 00       	mov    $0x13,%edi
  801f58:	48 b8 72 19 80 00 00 	movabs $0x801972,%rax
  801f5f:	00 00 00 
  801f62:	ff d0                	callq  *%rax
  801f64:	c9                   	leaveq 
  801f65:	c3                   	retq   

0000000000801f66 <sys_vmx_sel_resume>:
  801f66:	55                   	push   %rbp
  801f67:	48 89 e5             	mov    %rsp,%rbp
  801f6a:	48 83 ec 10          	sub    $0x10,%rsp
  801f6e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801f71:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801f74:	48 98                	cltq   
  801f76:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801f7d:	00 
  801f7e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801f84:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801f8a:	b9 00 00 00 00       	mov    $0x0,%ecx
  801f8f:	48 89 c2             	mov    %rax,%rdx
  801f92:	be 00 00 00 00       	mov    $0x0,%esi
  801f97:	bf 14 00 00 00       	mov    $0x14,%edi
  801f9c:	48 b8 72 19 80 00 00 	movabs $0x801972,%rax
  801fa3:	00 00 00 
  801fa6:	ff d0                	callq  *%rax
  801fa8:	c9                   	leaveq 
  801fa9:	c3                   	retq   

0000000000801faa <sys_vmx_get_vmdisk_number>:
  801faa:	55                   	push   %rbp
  801fab:	48 89 e5             	mov    %rsp,%rbp
  801fae:	48 83 ec 10          	sub    $0x10,%rsp
  801fb2:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801fb9:	00 
  801fba:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801fc0:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801fc6:	b9 00 00 00 00       	mov    $0x0,%ecx
  801fcb:	ba 00 00 00 00       	mov    $0x0,%edx
  801fd0:	be 00 00 00 00       	mov    $0x0,%esi
  801fd5:	bf 15 00 00 00       	mov    $0x15,%edi
  801fda:	48 b8 72 19 80 00 00 	movabs $0x801972,%rax
  801fe1:	00 00 00 
  801fe4:	ff d0                	callq  *%rax
  801fe6:	c9                   	leaveq 
  801fe7:	c3                   	retq   

0000000000801fe8 <sys_vmx_incr_vmdisk_number>:
  801fe8:	55                   	push   %rbp
  801fe9:	48 89 e5             	mov    %rsp,%rbp
  801fec:	48 83 ec 10          	sub    $0x10,%rsp
  801ff0:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801ff7:	00 
  801ff8:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ffe:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802004:	b9 00 00 00 00       	mov    $0x0,%ecx
  802009:	ba 00 00 00 00       	mov    $0x0,%edx
  80200e:	be 00 00 00 00       	mov    $0x0,%esi
  802013:	bf 16 00 00 00       	mov    $0x16,%edi
  802018:	48 b8 72 19 80 00 00 	movabs $0x801972,%rax
  80201f:	00 00 00 
  802022:	ff d0                	callq  *%rax
  802024:	c9                   	leaveq 
  802025:	c3                   	retq   

0000000000802026 <pgfault>:
  802026:	55                   	push   %rbp
  802027:	48 89 e5             	mov    %rsp,%rbp
  80202a:	48 83 ec 30          	sub    $0x30,%rsp
  80202e:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802032:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802036:	48 8b 00             	mov    (%rax),%rax
  802039:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80203d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802041:	48 8b 40 08          	mov    0x8(%rax),%rax
  802045:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802048:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80204b:	83 e0 02             	and    $0x2,%eax
  80204e:	85 c0                	test   %eax,%eax
  802050:	75 40                	jne    802092 <pgfault+0x6c>
  802052:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802056:	48 8b 90 88 00 00 00 	mov    0x88(%rax),%rdx
  80205d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802061:	49 89 d0             	mov    %rdx,%r8
  802064:	48 89 c1             	mov    %rax,%rcx
  802067:	48 ba b8 50 80 00 00 	movabs $0x8050b8,%rdx
  80206e:	00 00 00 
  802071:	be 1f 00 00 00       	mov    $0x1f,%esi
  802076:	48 bf d1 50 80 00 00 	movabs $0x8050d1,%rdi
  80207d:	00 00 00 
  802080:	b8 00 00 00 00       	mov    $0x0,%eax
  802085:	49 b9 2b 04 80 00 00 	movabs $0x80042b,%r9
  80208c:	00 00 00 
  80208f:	41 ff d1             	callq  *%r9
  802092:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802096:	48 c1 e8 0c          	shr    $0xc,%rax
  80209a:	48 89 c2             	mov    %rax,%rdx
  80209d:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8020a4:	01 00 00 
  8020a7:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8020ab:	25 07 08 00 00       	and    $0x807,%eax
  8020b0:	48 3d 05 08 00 00    	cmp    $0x805,%rax
  8020b6:	74 4e                	je     802106 <pgfault+0xe0>
  8020b8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8020bc:	48 c1 e8 0c          	shr    $0xc,%rax
  8020c0:	48 89 c2             	mov    %rax,%rdx
  8020c3:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8020ca:	01 00 00 
  8020cd:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  8020d1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8020d5:	49 89 d0             	mov    %rdx,%r8
  8020d8:	48 89 c1             	mov    %rax,%rcx
  8020db:	48 ba e0 50 80 00 00 	movabs $0x8050e0,%rdx
  8020e2:	00 00 00 
  8020e5:	be 22 00 00 00       	mov    $0x22,%esi
  8020ea:	48 bf d1 50 80 00 00 	movabs $0x8050d1,%rdi
  8020f1:	00 00 00 
  8020f4:	b8 00 00 00 00       	mov    $0x0,%eax
  8020f9:	49 b9 2b 04 80 00 00 	movabs $0x80042b,%r9
  802100:	00 00 00 
  802103:	41 ff d1             	callq  *%r9
  802106:	ba 07 00 00 00       	mov    $0x7,%edx
  80210b:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  802110:	bf 00 00 00 00       	mov    $0x0,%edi
  802115:	48 b8 48 1b 80 00 00 	movabs $0x801b48,%rax
  80211c:	00 00 00 
  80211f:	ff d0                	callq  *%rax
  802121:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802124:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802128:	79 30                	jns    80215a <pgfault+0x134>
  80212a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80212d:	89 c1                	mov    %eax,%ecx
  80212f:	48 ba 0b 51 80 00 00 	movabs $0x80510b,%rdx
  802136:	00 00 00 
  802139:	be 30 00 00 00       	mov    $0x30,%esi
  80213e:	48 bf d1 50 80 00 00 	movabs $0x8050d1,%rdi
  802145:	00 00 00 
  802148:	b8 00 00 00 00       	mov    $0x0,%eax
  80214d:	49 b8 2b 04 80 00 00 	movabs $0x80042b,%r8
  802154:	00 00 00 
  802157:	41 ff d0             	callq  *%r8
  80215a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80215e:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802162:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802166:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  80216c:	ba 00 10 00 00       	mov    $0x1000,%edx
  802171:	48 89 c6             	mov    %rax,%rsi
  802174:	bf 00 f0 5f 00       	mov    $0x5ff000,%edi
  802179:	48 b8 3d 15 80 00 00 	movabs $0x80153d,%rax
  802180:	00 00 00 
  802183:	ff d0                	callq  *%rax
  802185:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802189:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80218d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802191:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  802197:	41 b8 07 00 00 00    	mov    $0x7,%r8d
  80219d:	48 89 c1             	mov    %rax,%rcx
  8021a0:	ba 00 00 00 00       	mov    $0x0,%edx
  8021a5:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  8021aa:	bf 00 00 00 00       	mov    $0x0,%edi
  8021af:	48 b8 98 1b 80 00 00 	movabs $0x801b98,%rax
  8021b6:	00 00 00 
  8021b9:	ff d0                	callq  *%rax
  8021bb:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8021be:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8021c2:	79 30                	jns    8021f4 <pgfault+0x1ce>
  8021c4:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8021c7:	89 c1                	mov    %eax,%ecx
  8021c9:	48 ba 1e 51 80 00 00 	movabs $0x80511e,%rdx
  8021d0:	00 00 00 
  8021d3:	be 35 00 00 00       	mov    $0x35,%esi
  8021d8:	48 bf d1 50 80 00 00 	movabs $0x8050d1,%rdi
  8021df:	00 00 00 
  8021e2:	b8 00 00 00 00       	mov    $0x0,%eax
  8021e7:	49 b8 2b 04 80 00 00 	movabs $0x80042b,%r8
  8021ee:	00 00 00 
  8021f1:	41 ff d0             	callq  *%r8
  8021f4:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  8021f9:	bf 00 00 00 00       	mov    $0x0,%edi
  8021fe:	48 b8 f3 1b 80 00 00 	movabs $0x801bf3,%rax
  802205:	00 00 00 
  802208:	ff d0                	callq  *%rax
  80220a:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80220d:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802211:	79 30                	jns    802243 <pgfault+0x21d>
  802213:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802216:	89 c1                	mov    %eax,%ecx
  802218:	48 ba 2f 51 80 00 00 	movabs $0x80512f,%rdx
  80221f:	00 00 00 
  802222:	be 39 00 00 00       	mov    $0x39,%esi
  802227:	48 bf d1 50 80 00 00 	movabs $0x8050d1,%rdi
  80222e:	00 00 00 
  802231:	b8 00 00 00 00       	mov    $0x0,%eax
  802236:	49 b8 2b 04 80 00 00 	movabs $0x80042b,%r8
  80223d:	00 00 00 
  802240:	41 ff d0             	callq  *%r8
  802243:	c9                   	leaveq 
  802244:	c3                   	retq   

0000000000802245 <duppage>:
  802245:	55                   	push   %rbp
  802246:	48 89 e5             	mov    %rsp,%rbp
  802249:	48 83 ec 30          	sub    $0x30,%rsp
  80224d:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802250:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802253:	8b 45 d8             	mov    -0x28(%rbp),%eax
  802256:	c1 e0 0c             	shl    $0xc,%eax
  802259:	89 c0                	mov    %eax,%eax
  80225b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80225f:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802266:	01 00 00 
  802269:	8b 55 d8             	mov    -0x28(%rbp),%edx
  80226c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802270:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802274:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802278:	25 02 08 00 00       	and    $0x802,%eax
  80227d:	48 85 c0             	test   %rax,%rax
  802280:	74 0e                	je     802290 <duppage+0x4b>
  802282:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802286:	25 00 04 00 00       	and    $0x400,%eax
  80228b:	48 85 c0             	test   %rax,%rax
  80228e:	74 70                	je     802300 <duppage+0xbb>
  802290:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802294:	25 07 0e 00 00       	and    $0xe07,%eax
  802299:	89 c6                	mov    %eax,%esi
  80229b:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  80229f:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8022a2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8022a6:	41 89 f0             	mov    %esi,%r8d
  8022a9:	48 89 c6             	mov    %rax,%rsi
  8022ac:	bf 00 00 00 00       	mov    $0x0,%edi
  8022b1:	48 b8 98 1b 80 00 00 	movabs $0x801b98,%rax
  8022b8:	00 00 00 
  8022bb:	ff d0                	callq  *%rax
  8022bd:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8022c0:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8022c4:	79 30                	jns    8022f6 <duppage+0xb1>
  8022c6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8022c9:	89 c1                	mov    %eax,%ecx
  8022cb:	48 ba 1e 51 80 00 00 	movabs $0x80511e,%rdx
  8022d2:	00 00 00 
  8022d5:	be 63 00 00 00       	mov    $0x63,%esi
  8022da:	48 bf d1 50 80 00 00 	movabs $0x8050d1,%rdi
  8022e1:	00 00 00 
  8022e4:	b8 00 00 00 00       	mov    $0x0,%eax
  8022e9:	49 b8 2b 04 80 00 00 	movabs $0x80042b,%r8
  8022f0:	00 00 00 
  8022f3:	41 ff d0             	callq  *%r8
  8022f6:	b8 00 00 00 00       	mov    $0x0,%eax
  8022fb:	e9 c4 00 00 00       	jmpq   8023c4 <duppage+0x17f>
  802300:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  802304:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802307:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80230b:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  802311:	48 89 c6             	mov    %rax,%rsi
  802314:	bf 00 00 00 00       	mov    $0x0,%edi
  802319:	48 b8 98 1b 80 00 00 	movabs $0x801b98,%rax
  802320:	00 00 00 
  802323:	ff d0                	callq  *%rax
  802325:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802328:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80232c:	79 30                	jns    80235e <duppage+0x119>
  80232e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802331:	89 c1                	mov    %eax,%ecx
  802333:	48 ba 1e 51 80 00 00 	movabs $0x80511e,%rdx
  80233a:	00 00 00 
  80233d:	be 7e 00 00 00       	mov    $0x7e,%esi
  802342:	48 bf d1 50 80 00 00 	movabs $0x8050d1,%rdi
  802349:	00 00 00 
  80234c:	b8 00 00 00 00       	mov    $0x0,%eax
  802351:	49 b8 2b 04 80 00 00 	movabs $0x80042b,%r8
  802358:	00 00 00 
  80235b:	41 ff d0             	callq  *%r8
  80235e:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802362:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802366:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  80236c:	48 89 d1             	mov    %rdx,%rcx
  80236f:	ba 00 00 00 00       	mov    $0x0,%edx
  802374:	48 89 c6             	mov    %rax,%rsi
  802377:	bf 00 00 00 00       	mov    $0x0,%edi
  80237c:	48 b8 98 1b 80 00 00 	movabs $0x801b98,%rax
  802383:	00 00 00 
  802386:	ff d0                	callq  *%rax
  802388:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80238b:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80238f:	79 30                	jns    8023c1 <duppage+0x17c>
  802391:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802394:	89 c1                	mov    %eax,%ecx
  802396:	48 ba 1e 51 80 00 00 	movabs $0x80511e,%rdx
  80239d:	00 00 00 
  8023a0:	be 80 00 00 00       	mov    $0x80,%esi
  8023a5:	48 bf d1 50 80 00 00 	movabs $0x8050d1,%rdi
  8023ac:	00 00 00 
  8023af:	b8 00 00 00 00       	mov    $0x0,%eax
  8023b4:	49 b8 2b 04 80 00 00 	movabs $0x80042b,%r8
  8023bb:	00 00 00 
  8023be:	41 ff d0             	callq  *%r8
  8023c1:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8023c4:	c9                   	leaveq 
  8023c5:	c3                   	retq   

00000000008023c6 <fork>:
  8023c6:	55                   	push   %rbp
  8023c7:	48 89 e5             	mov    %rsp,%rbp
  8023ca:	48 83 ec 20          	sub    $0x20,%rsp
  8023ce:	48 bf 26 20 80 00 00 	movabs $0x802026,%rdi
  8023d5:	00 00 00 
  8023d8:	48 b8 40 49 80 00 00 	movabs $0x804940,%rax
  8023df:	00 00 00 
  8023e2:	ff d0                	callq  *%rax
  8023e4:	b8 07 00 00 00       	mov    $0x7,%eax
  8023e9:	cd 30                	int    $0x30
  8023eb:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8023ee:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8023f1:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8023f4:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8023f8:	79 08                	jns    802402 <fork+0x3c>
  8023fa:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8023fd:	e9 09 02 00 00       	jmpq   80260b <fork+0x245>
  802402:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802406:	75 3e                	jne    802446 <fork+0x80>
  802408:	48 b8 cc 1a 80 00 00 	movabs $0x801acc,%rax
  80240f:	00 00 00 
  802412:	ff d0                	callq  *%rax
  802414:	25 ff 03 00 00       	and    $0x3ff,%eax
  802419:	48 98                	cltq   
  80241b:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  802422:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  802429:	00 00 00 
  80242c:	48 01 c2             	add    %rax,%rdx
  80242f:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802436:	00 00 00 
  802439:	48 89 10             	mov    %rdx,(%rax)
  80243c:	b8 00 00 00 00       	mov    $0x0,%eax
  802441:	e9 c5 01 00 00       	jmpq   80260b <fork+0x245>
  802446:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80244d:	e9 a4 00 00 00       	jmpq   8024f6 <fork+0x130>
  802452:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802455:	c1 f8 12             	sar    $0x12,%eax
  802458:	89 c2                	mov    %eax,%edx
  80245a:	48 b8 00 00 40 80 00 	movabs $0x10080400000,%rax
  802461:	01 00 00 
  802464:	48 63 d2             	movslq %edx,%rdx
  802467:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80246b:	83 e0 01             	and    $0x1,%eax
  80246e:	48 85 c0             	test   %rax,%rax
  802471:	74 21                	je     802494 <fork+0xce>
  802473:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802476:	c1 f8 09             	sar    $0x9,%eax
  802479:	89 c2                	mov    %eax,%edx
  80247b:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802482:	01 00 00 
  802485:	48 63 d2             	movslq %edx,%rdx
  802488:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80248c:	83 e0 01             	and    $0x1,%eax
  80248f:	48 85 c0             	test   %rax,%rax
  802492:	75 09                	jne    80249d <fork+0xd7>
  802494:	81 45 fc 00 02 00 00 	addl   $0x200,-0x4(%rbp)
  80249b:	eb 59                	jmp    8024f6 <fork+0x130>
  80249d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024a0:	05 00 02 00 00       	add    $0x200,%eax
  8024a5:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8024a8:	eb 44                	jmp    8024ee <fork+0x128>
  8024aa:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8024b1:	01 00 00 
  8024b4:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8024b7:	48 63 d2             	movslq %edx,%rdx
  8024ba:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8024be:	83 e0 05             	and    $0x5,%eax
  8024c1:	48 83 f8 05          	cmp    $0x5,%rax
  8024c5:	74 02                	je     8024c9 <fork+0x103>
  8024c7:	eb 21                	jmp    8024ea <fork+0x124>
  8024c9:	81 7d fc ff f7 0e 00 	cmpl   $0xef7ff,-0x4(%rbp)
  8024d0:	75 02                	jne    8024d4 <fork+0x10e>
  8024d2:	eb 16                	jmp    8024ea <fork+0x124>
  8024d4:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8024d7:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8024da:	89 d6                	mov    %edx,%esi
  8024dc:	89 c7                	mov    %eax,%edi
  8024de:	48 b8 45 22 80 00 00 	movabs $0x802245,%rax
  8024e5:	00 00 00 
  8024e8:	ff d0                	callq  *%rax
  8024ea:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8024ee:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024f1:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  8024f4:	7c b4                	jl     8024aa <fork+0xe4>
  8024f6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024f9:	3d ff 07 00 08       	cmp    $0x80007ff,%eax
  8024fe:	0f 86 4e ff ff ff    	jbe    802452 <fork+0x8c>
  802504:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802507:	ba 07 00 00 00       	mov    $0x7,%edx
  80250c:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  802511:	89 c7                	mov    %eax,%edi
  802513:	48 b8 48 1b 80 00 00 	movabs $0x801b48,%rax
  80251a:	00 00 00 
  80251d:	ff d0                	callq  *%rax
  80251f:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802522:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802526:	79 30                	jns    802558 <fork+0x192>
  802528:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80252b:	89 c1                	mov    %eax,%ecx
  80252d:	48 ba 48 51 80 00 00 	movabs $0x805148,%rdx
  802534:	00 00 00 
  802537:	be bc 00 00 00       	mov    $0xbc,%esi
  80253c:	48 bf d1 50 80 00 00 	movabs $0x8050d1,%rdi
  802543:	00 00 00 
  802546:	b8 00 00 00 00       	mov    $0x0,%eax
  80254b:	49 b8 2b 04 80 00 00 	movabs $0x80042b,%r8
  802552:	00 00 00 
  802555:	41 ff d0             	callq  *%r8
  802558:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80255f:	00 00 00 
  802562:	48 8b 00             	mov    (%rax),%rax
  802565:	48 8b 90 f0 00 00 00 	mov    0xf0(%rax),%rdx
  80256c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80256f:	48 89 d6             	mov    %rdx,%rsi
  802572:	89 c7                	mov    %eax,%edi
  802574:	48 b8 d2 1c 80 00 00 	movabs $0x801cd2,%rax
  80257b:	00 00 00 
  80257e:	ff d0                	callq  *%rax
  802580:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802583:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802587:	79 30                	jns    8025b9 <fork+0x1f3>
  802589:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80258c:	89 c1                	mov    %eax,%ecx
  80258e:	48 ba 68 51 80 00 00 	movabs $0x805168,%rdx
  802595:	00 00 00 
  802598:	be c0 00 00 00       	mov    $0xc0,%esi
  80259d:	48 bf d1 50 80 00 00 	movabs $0x8050d1,%rdi
  8025a4:	00 00 00 
  8025a7:	b8 00 00 00 00       	mov    $0x0,%eax
  8025ac:	49 b8 2b 04 80 00 00 	movabs $0x80042b,%r8
  8025b3:	00 00 00 
  8025b6:	41 ff d0             	callq  *%r8
  8025b9:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8025bc:	be 02 00 00 00       	mov    $0x2,%esi
  8025c1:	89 c7                	mov    %eax,%edi
  8025c3:	48 b8 3d 1c 80 00 00 	movabs $0x801c3d,%rax
  8025ca:	00 00 00 
  8025cd:	ff d0                	callq  *%rax
  8025cf:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8025d2:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8025d6:	79 30                	jns    802608 <fork+0x242>
  8025d8:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8025db:	89 c1                	mov    %eax,%ecx
  8025dd:	48 ba 87 51 80 00 00 	movabs $0x805187,%rdx
  8025e4:	00 00 00 
  8025e7:	be c5 00 00 00       	mov    $0xc5,%esi
  8025ec:	48 bf d1 50 80 00 00 	movabs $0x8050d1,%rdi
  8025f3:	00 00 00 
  8025f6:	b8 00 00 00 00       	mov    $0x0,%eax
  8025fb:	49 b8 2b 04 80 00 00 	movabs $0x80042b,%r8
  802602:	00 00 00 
  802605:	41 ff d0             	callq  *%r8
  802608:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80260b:	c9                   	leaveq 
  80260c:	c3                   	retq   

000000000080260d <sfork>:
  80260d:	55                   	push   %rbp
  80260e:	48 89 e5             	mov    %rsp,%rbp
  802611:	48 ba 9e 51 80 00 00 	movabs $0x80519e,%rdx
  802618:	00 00 00 
  80261b:	be d2 00 00 00       	mov    $0xd2,%esi
  802620:	48 bf d1 50 80 00 00 	movabs $0x8050d1,%rdi
  802627:	00 00 00 
  80262a:	b8 00 00 00 00       	mov    $0x0,%eax
  80262f:	48 b9 2b 04 80 00 00 	movabs $0x80042b,%rcx
  802636:	00 00 00 
  802639:	ff d1                	callq  *%rcx

000000000080263b <ipc_recv>:
  80263b:	55                   	push   %rbp
  80263c:	48 89 e5             	mov    %rsp,%rbp
  80263f:	48 83 ec 30          	sub    $0x30,%rsp
  802643:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802647:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80264b:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80264f:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  802654:	75 0e                	jne    802664 <ipc_recv+0x29>
  802656:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80265d:	00 00 00 
  802660:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802664:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802668:	48 89 c7             	mov    %rax,%rdi
  80266b:	48 b8 71 1d 80 00 00 	movabs $0x801d71,%rax
  802672:	00 00 00 
  802675:	ff d0                	callq  *%rax
  802677:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80267a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80267e:	79 27                	jns    8026a7 <ipc_recv+0x6c>
  802680:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  802685:	74 0a                	je     802691 <ipc_recv+0x56>
  802687:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80268b:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  802691:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  802696:	74 0a                	je     8026a2 <ipc_recv+0x67>
  802698:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80269c:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8026a2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8026a5:	eb 53                	jmp    8026fa <ipc_recv+0xbf>
  8026a7:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8026ac:	74 19                	je     8026c7 <ipc_recv+0x8c>
  8026ae:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8026b5:	00 00 00 
  8026b8:	48 8b 00             	mov    (%rax),%rax
  8026bb:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  8026c1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8026c5:	89 10                	mov    %edx,(%rax)
  8026c7:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8026cc:	74 19                	je     8026e7 <ipc_recv+0xac>
  8026ce:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8026d5:	00 00 00 
  8026d8:	48 8b 00             	mov    (%rax),%rax
  8026db:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  8026e1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8026e5:	89 10                	mov    %edx,(%rax)
  8026e7:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8026ee:	00 00 00 
  8026f1:	48 8b 00             	mov    (%rax),%rax
  8026f4:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  8026fa:	c9                   	leaveq 
  8026fb:	c3                   	retq   

00000000008026fc <ipc_send>:
  8026fc:	55                   	push   %rbp
  8026fd:	48 89 e5             	mov    %rsp,%rbp
  802700:	48 83 ec 30          	sub    $0x30,%rsp
  802704:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802707:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80270a:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  80270e:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  802711:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  802716:	75 10                	jne    802728 <ipc_send+0x2c>
  802718:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80271f:	00 00 00 
  802722:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802726:	eb 0e                	jmp    802736 <ipc_send+0x3a>
  802728:	eb 0c                	jmp    802736 <ipc_send+0x3a>
  80272a:	48 b8 0a 1b 80 00 00 	movabs $0x801b0a,%rax
  802731:	00 00 00 
  802734:	ff d0                	callq  *%rax
  802736:	8b 75 e8             	mov    -0x18(%rbp),%esi
  802739:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  80273c:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802740:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802743:	89 c7                	mov    %eax,%edi
  802745:	48 b8 1c 1d 80 00 00 	movabs $0x801d1c,%rax
  80274c:	00 00 00 
  80274f:	ff d0                	callq  *%rax
  802751:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802754:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  802758:	74 d0                	je     80272a <ipc_send+0x2e>
  80275a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80275e:	79 30                	jns    802790 <ipc_send+0x94>
  802760:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802763:	89 c1                	mov    %eax,%ecx
  802765:	48 ba b4 51 80 00 00 	movabs $0x8051b4,%rdx
  80276c:	00 00 00 
  80276f:	be 44 00 00 00       	mov    $0x44,%esi
  802774:	48 bf ca 51 80 00 00 	movabs $0x8051ca,%rdi
  80277b:	00 00 00 
  80277e:	b8 00 00 00 00       	mov    $0x0,%eax
  802783:	49 b8 2b 04 80 00 00 	movabs $0x80042b,%r8
  80278a:	00 00 00 
  80278d:	41 ff d0             	callq  *%r8
  802790:	c9                   	leaveq 
  802791:	c3                   	retq   

0000000000802792 <ipc_find_env>:
  802792:	55                   	push   %rbp
  802793:	48 89 e5             	mov    %rsp,%rbp
  802796:	48 83 ec 14          	sub    $0x14,%rsp
  80279a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80279d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8027a4:	eb 4e                	jmp    8027f4 <ipc_find_env+0x62>
  8027a6:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  8027ad:	00 00 00 
  8027b0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8027b3:	48 98                	cltq   
  8027b5:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  8027bc:	48 01 d0             	add    %rdx,%rax
  8027bf:	48 05 d0 00 00 00    	add    $0xd0,%rax
  8027c5:	8b 00                	mov    (%rax),%eax
  8027c7:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  8027ca:	75 24                	jne    8027f0 <ipc_find_env+0x5e>
  8027cc:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  8027d3:	00 00 00 
  8027d6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8027d9:	48 98                	cltq   
  8027db:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  8027e2:	48 01 d0             	add    %rdx,%rax
  8027e5:	48 05 c0 00 00 00    	add    $0xc0,%rax
  8027eb:	8b 40 08             	mov    0x8(%rax),%eax
  8027ee:	eb 12                	jmp    802802 <ipc_find_env+0x70>
  8027f0:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8027f4:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  8027fb:	7e a9                	jle    8027a6 <ipc_find_env+0x14>
  8027fd:	b8 00 00 00 00       	mov    $0x0,%eax
  802802:	c9                   	leaveq 
  802803:	c3                   	retq   

0000000000802804 <fd2num>:
  802804:	55                   	push   %rbp
  802805:	48 89 e5             	mov    %rsp,%rbp
  802808:	48 83 ec 08          	sub    $0x8,%rsp
  80280c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802810:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802814:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  80281b:	ff ff ff 
  80281e:	48 01 d0             	add    %rdx,%rax
  802821:	48 c1 e8 0c          	shr    $0xc,%rax
  802825:	c9                   	leaveq 
  802826:	c3                   	retq   

0000000000802827 <fd2data>:
  802827:	55                   	push   %rbp
  802828:	48 89 e5             	mov    %rsp,%rbp
  80282b:	48 83 ec 08          	sub    $0x8,%rsp
  80282f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802833:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802837:	48 89 c7             	mov    %rax,%rdi
  80283a:	48 b8 04 28 80 00 00 	movabs $0x802804,%rax
  802841:	00 00 00 
  802844:	ff d0                	callq  *%rax
  802846:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  80284c:	48 c1 e0 0c          	shl    $0xc,%rax
  802850:	c9                   	leaveq 
  802851:	c3                   	retq   

0000000000802852 <fd_alloc>:
  802852:	55                   	push   %rbp
  802853:	48 89 e5             	mov    %rsp,%rbp
  802856:	48 83 ec 18          	sub    $0x18,%rsp
  80285a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80285e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802865:	eb 6b                	jmp    8028d2 <fd_alloc+0x80>
  802867:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80286a:	48 98                	cltq   
  80286c:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802872:	48 c1 e0 0c          	shl    $0xc,%rax
  802876:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80287a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80287e:	48 c1 e8 15          	shr    $0x15,%rax
  802882:	48 89 c2             	mov    %rax,%rdx
  802885:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  80288c:	01 00 00 
  80288f:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802893:	83 e0 01             	and    $0x1,%eax
  802896:	48 85 c0             	test   %rax,%rax
  802899:	74 21                	je     8028bc <fd_alloc+0x6a>
  80289b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80289f:	48 c1 e8 0c          	shr    $0xc,%rax
  8028a3:	48 89 c2             	mov    %rax,%rdx
  8028a6:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8028ad:	01 00 00 
  8028b0:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8028b4:	83 e0 01             	and    $0x1,%eax
  8028b7:	48 85 c0             	test   %rax,%rax
  8028ba:	75 12                	jne    8028ce <fd_alloc+0x7c>
  8028bc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8028c0:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8028c4:	48 89 10             	mov    %rdx,(%rax)
  8028c7:	b8 00 00 00 00       	mov    $0x0,%eax
  8028cc:	eb 1a                	jmp    8028e8 <fd_alloc+0x96>
  8028ce:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8028d2:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  8028d6:	7e 8f                	jle    802867 <fd_alloc+0x15>
  8028d8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8028dc:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  8028e3:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  8028e8:	c9                   	leaveq 
  8028e9:	c3                   	retq   

00000000008028ea <fd_lookup>:
  8028ea:	55                   	push   %rbp
  8028eb:	48 89 e5             	mov    %rsp,%rbp
  8028ee:	48 83 ec 20          	sub    $0x20,%rsp
  8028f2:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8028f5:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8028f9:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8028fd:	78 06                	js     802905 <fd_lookup+0x1b>
  8028ff:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  802903:	7e 07                	jle    80290c <fd_lookup+0x22>
  802905:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80290a:	eb 6c                	jmp    802978 <fd_lookup+0x8e>
  80290c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80290f:	48 98                	cltq   
  802911:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802917:	48 c1 e0 0c          	shl    $0xc,%rax
  80291b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80291f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802923:	48 c1 e8 15          	shr    $0x15,%rax
  802927:	48 89 c2             	mov    %rax,%rdx
  80292a:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802931:	01 00 00 
  802934:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802938:	83 e0 01             	and    $0x1,%eax
  80293b:	48 85 c0             	test   %rax,%rax
  80293e:	74 21                	je     802961 <fd_lookup+0x77>
  802940:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802944:	48 c1 e8 0c          	shr    $0xc,%rax
  802948:	48 89 c2             	mov    %rax,%rdx
  80294b:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802952:	01 00 00 
  802955:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802959:	83 e0 01             	and    $0x1,%eax
  80295c:	48 85 c0             	test   %rax,%rax
  80295f:	75 07                	jne    802968 <fd_lookup+0x7e>
  802961:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802966:	eb 10                	jmp    802978 <fd_lookup+0x8e>
  802968:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80296c:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802970:	48 89 10             	mov    %rdx,(%rax)
  802973:	b8 00 00 00 00       	mov    $0x0,%eax
  802978:	c9                   	leaveq 
  802979:	c3                   	retq   

000000000080297a <fd_close>:
  80297a:	55                   	push   %rbp
  80297b:	48 89 e5             	mov    %rsp,%rbp
  80297e:	48 83 ec 30          	sub    $0x30,%rsp
  802982:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802986:	89 f0                	mov    %esi,%eax
  802988:	88 45 d4             	mov    %al,-0x2c(%rbp)
  80298b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80298f:	48 89 c7             	mov    %rax,%rdi
  802992:	48 b8 04 28 80 00 00 	movabs $0x802804,%rax
  802999:	00 00 00 
  80299c:	ff d0                	callq  *%rax
  80299e:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8029a2:	48 89 d6             	mov    %rdx,%rsi
  8029a5:	89 c7                	mov    %eax,%edi
  8029a7:	48 b8 ea 28 80 00 00 	movabs $0x8028ea,%rax
  8029ae:	00 00 00 
  8029b1:	ff d0                	callq  *%rax
  8029b3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8029b6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8029ba:	78 0a                	js     8029c6 <fd_close+0x4c>
  8029bc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8029c0:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  8029c4:	74 12                	je     8029d8 <fd_close+0x5e>
  8029c6:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  8029ca:	74 05                	je     8029d1 <fd_close+0x57>
  8029cc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029cf:	eb 05                	jmp    8029d6 <fd_close+0x5c>
  8029d1:	b8 00 00 00 00       	mov    $0x0,%eax
  8029d6:	eb 69                	jmp    802a41 <fd_close+0xc7>
  8029d8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8029dc:	8b 00                	mov    (%rax),%eax
  8029de:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8029e2:	48 89 d6             	mov    %rdx,%rsi
  8029e5:	89 c7                	mov    %eax,%edi
  8029e7:	48 b8 43 2a 80 00 00 	movabs $0x802a43,%rax
  8029ee:	00 00 00 
  8029f1:	ff d0                	callq  *%rax
  8029f3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8029f6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8029fa:	78 2a                	js     802a26 <fd_close+0xac>
  8029fc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802a00:	48 8b 40 20          	mov    0x20(%rax),%rax
  802a04:	48 85 c0             	test   %rax,%rax
  802a07:	74 16                	je     802a1f <fd_close+0xa5>
  802a09:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802a0d:	48 8b 40 20          	mov    0x20(%rax),%rax
  802a11:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802a15:	48 89 d7             	mov    %rdx,%rdi
  802a18:	ff d0                	callq  *%rax
  802a1a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802a1d:	eb 07                	jmp    802a26 <fd_close+0xac>
  802a1f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802a26:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802a2a:	48 89 c6             	mov    %rax,%rsi
  802a2d:	bf 00 00 00 00       	mov    $0x0,%edi
  802a32:	48 b8 f3 1b 80 00 00 	movabs $0x801bf3,%rax
  802a39:	00 00 00 
  802a3c:	ff d0                	callq  *%rax
  802a3e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a41:	c9                   	leaveq 
  802a42:	c3                   	retq   

0000000000802a43 <dev_lookup>:
  802a43:	55                   	push   %rbp
  802a44:	48 89 e5             	mov    %rsp,%rbp
  802a47:	48 83 ec 20          	sub    $0x20,%rsp
  802a4b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802a4e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802a52:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802a59:	eb 41                	jmp    802a9c <dev_lookup+0x59>
  802a5b:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802a62:	00 00 00 
  802a65:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802a68:	48 63 d2             	movslq %edx,%rdx
  802a6b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802a6f:	8b 00                	mov    (%rax),%eax
  802a71:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  802a74:	75 22                	jne    802a98 <dev_lookup+0x55>
  802a76:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802a7d:	00 00 00 
  802a80:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802a83:	48 63 d2             	movslq %edx,%rdx
  802a86:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  802a8a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802a8e:	48 89 10             	mov    %rdx,(%rax)
  802a91:	b8 00 00 00 00       	mov    $0x0,%eax
  802a96:	eb 60                	jmp    802af8 <dev_lookup+0xb5>
  802a98:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802a9c:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802aa3:	00 00 00 
  802aa6:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802aa9:	48 63 d2             	movslq %edx,%rdx
  802aac:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802ab0:	48 85 c0             	test   %rax,%rax
  802ab3:	75 a6                	jne    802a5b <dev_lookup+0x18>
  802ab5:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802abc:	00 00 00 
  802abf:	48 8b 00             	mov    (%rax),%rax
  802ac2:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802ac8:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802acb:	89 c6                	mov    %eax,%esi
  802acd:	48 bf d8 51 80 00 00 	movabs $0x8051d8,%rdi
  802ad4:	00 00 00 
  802ad7:	b8 00 00 00 00       	mov    $0x0,%eax
  802adc:	48 b9 64 06 80 00 00 	movabs $0x800664,%rcx
  802ae3:	00 00 00 
  802ae6:	ff d1                	callq  *%rcx
  802ae8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802aec:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802af3:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802af8:	c9                   	leaveq 
  802af9:	c3                   	retq   

0000000000802afa <close>:
  802afa:	55                   	push   %rbp
  802afb:	48 89 e5             	mov    %rsp,%rbp
  802afe:	48 83 ec 20          	sub    $0x20,%rsp
  802b02:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802b05:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802b09:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802b0c:	48 89 d6             	mov    %rdx,%rsi
  802b0f:	89 c7                	mov    %eax,%edi
  802b11:	48 b8 ea 28 80 00 00 	movabs $0x8028ea,%rax
  802b18:	00 00 00 
  802b1b:	ff d0                	callq  *%rax
  802b1d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b20:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b24:	79 05                	jns    802b2b <close+0x31>
  802b26:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b29:	eb 18                	jmp    802b43 <close+0x49>
  802b2b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802b2f:	be 01 00 00 00       	mov    $0x1,%esi
  802b34:	48 89 c7             	mov    %rax,%rdi
  802b37:	48 b8 7a 29 80 00 00 	movabs $0x80297a,%rax
  802b3e:	00 00 00 
  802b41:	ff d0                	callq  *%rax
  802b43:	c9                   	leaveq 
  802b44:	c3                   	retq   

0000000000802b45 <close_all>:
  802b45:	55                   	push   %rbp
  802b46:	48 89 e5             	mov    %rsp,%rbp
  802b49:	48 83 ec 10          	sub    $0x10,%rsp
  802b4d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802b54:	eb 15                	jmp    802b6b <close_all+0x26>
  802b56:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b59:	89 c7                	mov    %eax,%edi
  802b5b:	48 b8 fa 2a 80 00 00 	movabs $0x802afa,%rax
  802b62:	00 00 00 
  802b65:	ff d0                	callq  *%rax
  802b67:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802b6b:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802b6f:	7e e5                	jle    802b56 <close_all+0x11>
  802b71:	c9                   	leaveq 
  802b72:	c3                   	retq   

0000000000802b73 <dup>:
  802b73:	55                   	push   %rbp
  802b74:	48 89 e5             	mov    %rsp,%rbp
  802b77:	48 83 ec 40          	sub    $0x40,%rsp
  802b7b:	89 7d cc             	mov    %edi,-0x34(%rbp)
  802b7e:	89 75 c8             	mov    %esi,-0x38(%rbp)
  802b81:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  802b85:	8b 45 cc             	mov    -0x34(%rbp),%eax
  802b88:	48 89 d6             	mov    %rdx,%rsi
  802b8b:	89 c7                	mov    %eax,%edi
  802b8d:	48 b8 ea 28 80 00 00 	movabs $0x8028ea,%rax
  802b94:	00 00 00 
  802b97:	ff d0                	callq  *%rax
  802b99:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b9c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ba0:	79 08                	jns    802baa <dup+0x37>
  802ba2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ba5:	e9 70 01 00 00       	jmpq   802d1a <dup+0x1a7>
  802baa:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802bad:	89 c7                	mov    %eax,%edi
  802baf:	48 b8 fa 2a 80 00 00 	movabs $0x802afa,%rax
  802bb6:	00 00 00 
  802bb9:	ff d0                	callq  *%rax
  802bbb:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802bbe:	48 98                	cltq   
  802bc0:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802bc6:	48 c1 e0 0c          	shl    $0xc,%rax
  802bca:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802bce:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802bd2:	48 89 c7             	mov    %rax,%rdi
  802bd5:	48 b8 27 28 80 00 00 	movabs $0x802827,%rax
  802bdc:	00 00 00 
  802bdf:	ff d0                	callq  *%rax
  802be1:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802be5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802be9:	48 89 c7             	mov    %rax,%rdi
  802bec:	48 b8 27 28 80 00 00 	movabs $0x802827,%rax
  802bf3:	00 00 00 
  802bf6:	ff d0                	callq  *%rax
  802bf8:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802bfc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c00:	48 c1 e8 15          	shr    $0x15,%rax
  802c04:	48 89 c2             	mov    %rax,%rdx
  802c07:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802c0e:	01 00 00 
  802c11:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802c15:	83 e0 01             	and    $0x1,%eax
  802c18:	48 85 c0             	test   %rax,%rax
  802c1b:	74 73                	je     802c90 <dup+0x11d>
  802c1d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c21:	48 c1 e8 0c          	shr    $0xc,%rax
  802c25:	48 89 c2             	mov    %rax,%rdx
  802c28:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802c2f:	01 00 00 
  802c32:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802c36:	83 e0 01             	and    $0x1,%eax
  802c39:	48 85 c0             	test   %rax,%rax
  802c3c:	74 52                	je     802c90 <dup+0x11d>
  802c3e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c42:	48 c1 e8 0c          	shr    $0xc,%rax
  802c46:	48 89 c2             	mov    %rax,%rdx
  802c49:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802c50:	01 00 00 
  802c53:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802c57:	25 07 0e 00 00       	and    $0xe07,%eax
  802c5c:	89 c1                	mov    %eax,%ecx
  802c5e:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802c62:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c66:	41 89 c8             	mov    %ecx,%r8d
  802c69:	48 89 d1             	mov    %rdx,%rcx
  802c6c:	ba 00 00 00 00       	mov    $0x0,%edx
  802c71:	48 89 c6             	mov    %rax,%rsi
  802c74:	bf 00 00 00 00       	mov    $0x0,%edi
  802c79:	48 b8 98 1b 80 00 00 	movabs $0x801b98,%rax
  802c80:	00 00 00 
  802c83:	ff d0                	callq  *%rax
  802c85:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c88:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c8c:	79 02                	jns    802c90 <dup+0x11d>
  802c8e:	eb 57                	jmp    802ce7 <dup+0x174>
  802c90:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802c94:	48 c1 e8 0c          	shr    $0xc,%rax
  802c98:	48 89 c2             	mov    %rax,%rdx
  802c9b:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802ca2:	01 00 00 
  802ca5:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802ca9:	25 07 0e 00 00       	and    $0xe07,%eax
  802cae:	89 c1                	mov    %eax,%ecx
  802cb0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802cb4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802cb8:	41 89 c8             	mov    %ecx,%r8d
  802cbb:	48 89 d1             	mov    %rdx,%rcx
  802cbe:	ba 00 00 00 00       	mov    $0x0,%edx
  802cc3:	48 89 c6             	mov    %rax,%rsi
  802cc6:	bf 00 00 00 00       	mov    $0x0,%edi
  802ccb:	48 b8 98 1b 80 00 00 	movabs $0x801b98,%rax
  802cd2:	00 00 00 
  802cd5:	ff d0                	callq  *%rax
  802cd7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802cda:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802cde:	79 02                	jns    802ce2 <dup+0x16f>
  802ce0:	eb 05                	jmp    802ce7 <dup+0x174>
  802ce2:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802ce5:	eb 33                	jmp    802d1a <dup+0x1a7>
  802ce7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ceb:	48 89 c6             	mov    %rax,%rsi
  802cee:	bf 00 00 00 00       	mov    $0x0,%edi
  802cf3:	48 b8 f3 1b 80 00 00 	movabs $0x801bf3,%rax
  802cfa:	00 00 00 
  802cfd:	ff d0                	callq  *%rax
  802cff:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802d03:	48 89 c6             	mov    %rax,%rsi
  802d06:	bf 00 00 00 00       	mov    $0x0,%edi
  802d0b:	48 b8 f3 1b 80 00 00 	movabs $0x801bf3,%rax
  802d12:	00 00 00 
  802d15:	ff d0                	callq  *%rax
  802d17:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d1a:	c9                   	leaveq 
  802d1b:	c3                   	retq   

0000000000802d1c <read>:
  802d1c:	55                   	push   %rbp
  802d1d:	48 89 e5             	mov    %rsp,%rbp
  802d20:	48 83 ec 40          	sub    $0x40,%rsp
  802d24:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802d27:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802d2b:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802d2f:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802d33:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802d36:	48 89 d6             	mov    %rdx,%rsi
  802d39:	89 c7                	mov    %eax,%edi
  802d3b:	48 b8 ea 28 80 00 00 	movabs $0x8028ea,%rax
  802d42:	00 00 00 
  802d45:	ff d0                	callq  *%rax
  802d47:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d4a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d4e:	78 24                	js     802d74 <read+0x58>
  802d50:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d54:	8b 00                	mov    (%rax),%eax
  802d56:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802d5a:	48 89 d6             	mov    %rdx,%rsi
  802d5d:	89 c7                	mov    %eax,%edi
  802d5f:	48 b8 43 2a 80 00 00 	movabs $0x802a43,%rax
  802d66:	00 00 00 
  802d69:	ff d0                	callq  *%rax
  802d6b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d6e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d72:	79 05                	jns    802d79 <read+0x5d>
  802d74:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d77:	eb 76                	jmp    802def <read+0xd3>
  802d79:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d7d:	8b 40 08             	mov    0x8(%rax),%eax
  802d80:	83 e0 03             	and    $0x3,%eax
  802d83:	83 f8 01             	cmp    $0x1,%eax
  802d86:	75 3a                	jne    802dc2 <read+0xa6>
  802d88:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802d8f:	00 00 00 
  802d92:	48 8b 00             	mov    (%rax),%rax
  802d95:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802d9b:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802d9e:	89 c6                	mov    %eax,%esi
  802da0:	48 bf f7 51 80 00 00 	movabs $0x8051f7,%rdi
  802da7:	00 00 00 
  802daa:	b8 00 00 00 00       	mov    $0x0,%eax
  802daf:	48 b9 64 06 80 00 00 	movabs $0x800664,%rcx
  802db6:	00 00 00 
  802db9:	ff d1                	callq  *%rcx
  802dbb:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802dc0:	eb 2d                	jmp    802def <read+0xd3>
  802dc2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802dc6:	48 8b 40 10          	mov    0x10(%rax),%rax
  802dca:	48 85 c0             	test   %rax,%rax
  802dcd:	75 07                	jne    802dd6 <read+0xba>
  802dcf:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802dd4:	eb 19                	jmp    802def <read+0xd3>
  802dd6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802dda:	48 8b 40 10          	mov    0x10(%rax),%rax
  802dde:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802de2:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802de6:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802dea:	48 89 cf             	mov    %rcx,%rdi
  802ded:	ff d0                	callq  *%rax
  802def:	c9                   	leaveq 
  802df0:	c3                   	retq   

0000000000802df1 <readn>:
  802df1:	55                   	push   %rbp
  802df2:	48 89 e5             	mov    %rsp,%rbp
  802df5:	48 83 ec 30          	sub    $0x30,%rsp
  802df9:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802dfc:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802e00:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802e04:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802e0b:	eb 49                	jmp    802e56 <readn+0x65>
  802e0d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e10:	48 98                	cltq   
  802e12:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802e16:	48 29 c2             	sub    %rax,%rdx
  802e19:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e1c:	48 63 c8             	movslq %eax,%rcx
  802e1f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802e23:	48 01 c1             	add    %rax,%rcx
  802e26:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802e29:	48 89 ce             	mov    %rcx,%rsi
  802e2c:	89 c7                	mov    %eax,%edi
  802e2e:	48 b8 1c 2d 80 00 00 	movabs $0x802d1c,%rax
  802e35:	00 00 00 
  802e38:	ff d0                	callq  *%rax
  802e3a:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802e3d:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802e41:	79 05                	jns    802e48 <readn+0x57>
  802e43:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802e46:	eb 1c                	jmp    802e64 <readn+0x73>
  802e48:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802e4c:	75 02                	jne    802e50 <readn+0x5f>
  802e4e:	eb 11                	jmp    802e61 <readn+0x70>
  802e50:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802e53:	01 45 fc             	add    %eax,-0x4(%rbp)
  802e56:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e59:	48 98                	cltq   
  802e5b:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802e5f:	72 ac                	jb     802e0d <readn+0x1c>
  802e61:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e64:	c9                   	leaveq 
  802e65:	c3                   	retq   

0000000000802e66 <write>:
  802e66:	55                   	push   %rbp
  802e67:	48 89 e5             	mov    %rsp,%rbp
  802e6a:	48 83 ec 40          	sub    $0x40,%rsp
  802e6e:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802e71:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802e75:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802e79:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802e7d:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802e80:	48 89 d6             	mov    %rdx,%rsi
  802e83:	89 c7                	mov    %eax,%edi
  802e85:	48 b8 ea 28 80 00 00 	movabs $0x8028ea,%rax
  802e8c:	00 00 00 
  802e8f:	ff d0                	callq  *%rax
  802e91:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e94:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e98:	78 24                	js     802ebe <write+0x58>
  802e9a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e9e:	8b 00                	mov    (%rax),%eax
  802ea0:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802ea4:	48 89 d6             	mov    %rdx,%rsi
  802ea7:	89 c7                	mov    %eax,%edi
  802ea9:	48 b8 43 2a 80 00 00 	movabs $0x802a43,%rax
  802eb0:	00 00 00 
  802eb3:	ff d0                	callq  *%rax
  802eb5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802eb8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ebc:	79 05                	jns    802ec3 <write+0x5d>
  802ebe:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ec1:	eb 75                	jmp    802f38 <write+0xd2>
  802ec3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ec7:	8b 40 08             	mov    0x8(%rax),%eax
  802eca:	83 e0 03             	and    $0x3,%eax
  802ecd:	85 c0                	test   %eax,%eax
  802ecf:	75 3a                	jne    802f0b <write+0xa5>
  802ed1:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802ed8:	00 00 00 
  802edb:	48 8b 00             	mov    (%rax),%rax
  802ede:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802ee4:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802ee7:	89 c6                	mov    %eax,%esi
  802ee9:	48 bf 13 52 80 00 00 	movabs $0x805213,%rdi
  802ef0:	00 00 00 
  802ef3:	b8 00 00 00 00       	mov    $0x0,%eax
  802ef8:	48 b9 64 06 80 00 00 	movabs $0x800664,%rcx
  802eff:	00 00 00 
  802f02:	ff d1                	callq  *%rcx
  802f04:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802f09:	eb 2d                	jmp    802f38 <write+0xd2>
  802f0b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f0f:	48 8b 40 18          	mov    0x18(%rax),%rax
  802f13:	48 85 c0             	test   %rax,%rax
  802f16:	75 07                	jne    802f1f <write+0xb9>
  802f18:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802f1d:	eb 19                	jmp    802f38 <write+0xd2>
  802f1f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f23:	48 8b 40 18          	mov    0x18(%rax),%rax
  802f27:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802f2b:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802f2f:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802f33:	48 89 cf             	mov    %rcx,%rdi
  802f36:	ff d0                	callq  *%rax
  802f38:	c9                   	leaveq 
  802f39:	c3                   	retq   

0000000000802f3a <seek>:
  802f3a:	55                   	push   %rbp
  802f3b:	48 89 e5             	mov    %rsp,%rbp
  802f3e:	48 83 ec 18          	sub    $0x18,%rsp
  802f42:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802f45:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802f48:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802f4c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802f4f:	48 89 d6             	mov    %rdx,%rsi
  802f52:	89 c7                	mov    %eax,%edi
  802f54:	48 b8 ea 28 80 00 00 	movabs $0x8028ea,%rax
  802f5b:	00 00 00 
  802f5e:	ff d0                	callq  *%rax
  802f60:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f63:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f67:	79 05                	jns    802f6e <seek+0x34>
  802f69:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f6c:	eb 0f                	jmp    802f7d <seek+0x43>
  802f6e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f72:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802f75:	89 50 04             	mov    %edx,0x4(%rax)
  802f78:	b8 00 00 00 00       	mov    $0x0,%eax
  802f7d:	c9                   	leaveq 
  802f7e:	c3                   	retq   

0000000000802f7f <ftruncate>:
  802f7f:	55                   	push   %rbp
  802f80:	48 89 e5             	mov    %rsp,%rbp
  802f83:	48 83 ec 30          	sub    $0x30,%rsp
  802f87:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802f8a:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802f8d:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802f91:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802f94:	48 89 d6             	mov    %rdx,%rsi
  802f97:	89 c7                	mov    %eax,%edi
  802f99:	48 b8 ea 28 80 00 00 	movabs $0x8028ea,%rax
  802fa0:	00 00 00 
  802fa3:	ff d0                	callq  *%rax
  802fa5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802fa8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802fac:	78 24                	js     802fd2 <ftruncate+0x53>
  802fae:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802fb2:	8b 00                	mov    (%rax),%eax
  802fb4:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802fb8:	48 89 d6             	mov    %rdx,%rsi
  802fbb:	89 c7                	mov    %eax,%edi
  802fbd:	48 b8 43 2a 80 00 00 	movabs $0x802a43,%rax
  802fc4:	00 00 00 
  802fc7:	ff d0                	callq  *%rax
  802fc9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802fcc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802fd0:	79 05                	jns    802fd7 <ftruncate+0x58>
  802fd2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802fd5:	eb 72                	jmp    803049 <ftruncate+0xca>
  802fd7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802fdb:	8b 40 08             	mov    0x8(%rax),%eax
  802fde:	83 e0 03             	and    $0x3,%eax
  802fe1:	85 c0                	test   %eax,%eax
  802fe3:	75 3a                	jne    80301f <ftruncate+0xa0>
  802fe5:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802fec:	00 00 00 
  802fef:	48 8b 00             	mov    (%rax),%rax
  802ff2:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802ff8:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802ffb:	89 c6                	mov    %eax,%esi
  802ffd:	48 bf 30 52 80 00 00 	movabs $0x805230,%rdi
  803004:	00 00 00 
  803007:	b8 00 00 00 00       	mov    $0x0,%eax
  80300c:	48 b9 64 06 80 00 00 	movabs $0x800664,%rcx
  803013:	00 00 00 
  803016:	ff d1                	callq  *%rcx
  803018:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80301d:	eb 2a                	jmp    803049 <ftruncate+0xca>
  80301f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803023:	48 8b 40 30          	mov    0x30(%rax),%rax
  803027:	48 85 c0             	test   %rax,%rax
  80302a:	75 07                	jne    803033 <ftruncate+0xb4>
  80302c:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803031:	eb 16                	jmp    803049 <ftruncate+0xca>
  803033:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803037:	48 8b 40 30          	mov    0x30(%rax),%rax
  80303b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80303f:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  803042:	89 ce                	mov    %ecx,%esi
  803044:	48 89 d7             	mov    %rdx,%rdi
  803047:	ff d0                	callq  *%rax
  803049:	c9                   	leaveq 
  80304a:	c3                   	retq   

000000000080304b <fstat>:
  80304b:	55                   	push   %rbp
  80304c:	48 89 e5             	mov    %rsp,%rbp
  80304f:	48 83 ec 30          	sub    $0x30,%rsp
  803053:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803056:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80305a:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80305e:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803061:	48 89 d6             	mov    %rdx,%rsi
  803064:	89 c7                	mov    %eax,%edi
  803066:	48 b8 ea 28 80 00 00 	movabs $0x8028ea,%rax
  80306d:	00 00 00 
  803070:	ff d0                	callq  *%rax
  803072:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803075:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803079:	78 24                	js     80309f <fstat+0x54>
  80307b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80307f:	8b 00                	mov    (%rax),%eax
  803081:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803085:	48 89 d6             	mov    %rdx,%rsi
  803088:	89 c7                	mov    %eax,%edi
  80308a:	48 b8 43 2a 80 00 00 	movabs $0x802a43,%rax
  803091:	00 00 00 
  803094:	ff d0                	callq  *%rax
  803096:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803099:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80309d:	79 05                	jns    8030a4 <fstat+0x59>
  80309f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030a2:	eb 5e                	jmp    803102 <fstat+0xb7>
  8030a4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8030a8:	48 8b 40 28          	mov    0x28(%rax),%rax
  8030ac:	48 85 c0             	test   %rax,%rax
  8030af:	75 07                	jne    8030b8 <fstat+0x6d>
  8030b1:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8030b6:	eb 4a                	jmp    803102 <fstat+0xb7>
  8030b8:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8030bc:	c6 00 00             	movb   $0x0,(%rax)
  8030bf:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8030c3:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  8030ca:	00 00 00 
  8030cd:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8030d1:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  8030d8:	00 00 00 
  8030db:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8030df:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8030e3:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  8030ea:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8030ee:	48 8b 40 28          	mov    0x28(%rax),%rax
  8030f2:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8030f6:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  8030fa:	48 89 ce             	mov    %rcx,%rsi
  8030fd:	48 89 d7             	mov    %rdx,%rdi
  803100:	ff d0                	callq  *%rax
  803102:	c9                   	leaveq 
  803103:	c3                   	retq   

0000000000803104 <stat>:
  803104:	55                   	push   %rbp
  803105:	48 89 e5             	mov    %rsp,%rbp
  803108:	48 83 ec 20          	sub    $0x20,%rsp
  80310c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803110:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803114:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803118:	be 00 00 00 00       	mov    $0x0,%esi
  80311d:	48 89 c7             	mov    %rax,%rdi
  803120:	48 b8 f2 31 80 00 00 	movabs $0x8031f2,%rax
  803127:	00 00 00 
  80312a:	ff d0                	callq  *%rax
  80312c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80312f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803133:	79 05                	jns    80313a <stat+0x36>
  803135:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803138:	eb 2f                	jmp    803169 <stat+0x65>
  80313a:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80313e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803141:	48 89 d6             	mov    %rdx,%rsi
  803144:	89 c7                	mov    %eax,%edi
  803146:	48 b8 4b 30 80 00 00 	movabs $0x80304b,%rax
  80314d:	00 00 00 
  803150:	ff d0                	callq  *%rax
  803152:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803155:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803158:	89 c7                	mov    %eax,%edi
  80315a:	48 b8 fa 2a 80 00 00 	movabs $0x802afa,%rax
  803161:	00 00 00 
  803164:	ff d0                	callq  *%rax
  803166:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803169:	c9                   	leaveq 
  80316a:	c3                   	retq   

000000000080316b <fsipc>:
  80316b:	55                   	push   %rbp
  80316c:	48 89 e5             	mov    %rsp,%rbp
  80316f:	48 83 ec 10          	sub    $0x10,%rsp
  803173:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803176:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80317a:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  803181:	00 00 00 
  803184:	8b 00                	mov    (%rax),%eax
  803186:	85 c0                	test   %eax,%eax
  803188:	75 1d                	jne    8031a7 <fsipc+0x3c>
  80318a:	bf 01 00 00 00       	mov    $0x1,%edi
  80318f:	48 b8 92 27 80 00 00 	movabs $0x802792,%rax
  803196:	00 00 00 
  803199:	ff d0                	callq  *%rax
  80319b:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  8031a2:	00 00 00 
  8031a5:	89 02                	mov    %eax,(%rdx)
  8031a7:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8031ae:	00 00 00 
  8031b1:	8b 00                	mov    (%rax),%eax
  8031b3:	8b 75 fc             	mov    -0x4(%rbp),%esi
  8031b6:	b9 07 00 00 00       	mov    $0x7,%ecx
  8031bb:	48 ba 00 90 80 00 00 	movabs $0x809000,%rdx
  8031c2:	00 00 00 
  8031c5:	89 c7                	mov    %eax,%edi
  8031c7:	48 b8 fc 26 80 00 00 	movabs $0x8026fc,%rax
  8031ce:	00 00 00 
  8031d1:	ff d0                	callq  *%rax
  8031d3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8031d7:	ba 00 00 00 00       	mov    $0x0,%edx
  8031dc:	48 89 c6             	mov    %rax,%rsi
  8031df:	bf 00 00 00 00       	mov    $0x0,%edi
  8031e4:	48 b8 3b 26 80 00 00 	movabs $0x80263b,%rax
  8031eb:	00 00 00 
  8031ee:	ff d0                	callq  *%rax
  8031f0:	c9                   	leaveq 
  8031f1:	c3                   	retq   

00000000008031f2 <open>:
  8031f2:	55                   	push   %rbp
  8031f3:	48 89 e5             	mov    %rsp,%rbp
  8031f6:	48 83 ec 20          	sub    $0x20,%rsp
  8031fa:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8031fe:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  803201:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803205:	48 89 c7             	mov    %rax,%rdi
  803208:	48 b8 ad 11 80 00 00 	movabs $0x8011ad,%rax
  80320f:	00 00 00 
  803212:	ff d0                	callq  *%rax
  803214:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  803219:	7e 0a                	jle    803225 <open+0x33>
  80321b:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  803220:	e9 a5 00 00 00       	jmpq   8032ca <open+0xd8>
  803225:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803229:	48 89 c7             	mov    %rax,%rdi
  80322c:	48 b8 52 28 80 00 00 	movabs $0x802852,%rax
  803233:	00 00 00 
  803236:	ff d0                	callq  *%rax
  803238:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80323b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80323f:	79 08                	jns    803249 <open+0x57>
  803241:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803244:	e9 81 00 00 00       	jmpq   8032ca <open+0xd8>
  803249:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80324d:	48 89 c6             	mov    %rax,%rsi
  803250:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  803257:	00 00 00 
  80325a:	48 b8 19 12 80 00 00 	movabs $0x801219,%rax
  803261:	00 00 00 
  803264:	ff d0                	callq  *%rax
  803266:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80326d:	00 00 00 
  803270:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803273:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  803279:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80327d:	48 89 c6             	mov    %rax,%rsi
  803280:	bf 01 00 00 00       	mov    $0x1,%edi
  803285:	48 b8 6b 31 80 00 00 	movabs $0x80316b,%rax
  80328c:	00 00 00 
  80328f:	ff d0                	callq  *%rax
  803291:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803294:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803298:	79 1d                	jns    8032b7 <open+0xc5>
  80329a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80329e:	be 00 00 00 00       	mov    $0x0,%esi
  8032a3:	48 89 c7             	mov    %rax,%rdi
  8032a6:	48 b8 7a 29 80 00 00 	movabs $0x80297a,%rax
  8032ad:	00 00 00 
  8032b0:	ff d0                	callq  *%rax
  8032b2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032b5:	eb 13                	jmp    8032ca <open+0xd8>
  8032b7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8032bb:	48 89 c7             	mov    %rax,%rdi
  8032be:	48 b8 04 28 80 00 00 	movabs $0x802804,%rax
  8032c5:	00 00 00 
  8032c8:	ff d0                	callq  *%rax
  8032ca:	c9                   	leaveq 
  8032cb:	c3                   	retq   

00000000008032cc <devfile_flush>:
  8032cc:	55                   	push   %rbp
  8032cd:	48 89 e5             	mov    %rsp,%rbp
  8032d0:	48 83 ec 10          	sub    $0x10,%rsp
  8032d4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8032d8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8032dc:	8b 50 0c             	mov    0xc(%rax),%edx
  8032df:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8032e6:	00 00 00 
  8032e9:	89 10                	mov    %edx,(%rax)
  8032eb:	be 00 00 00 00       	mov    $0x0,%esi
  8032f0:	bf 06 00 00 00       	mov    $0x6,%edi
  8032f5:	48 b8 6b 31 80 00 00 	movabs $0x80316b,%rax
  8032fc:	00 00 00 
  8032ff:	ff d0                	callq  *%rax
  803301:	c9                   	leaveq 
  803302:	c3                   	retq   

0000000000803303 <devfile_read>:
  803303:	55                   	push   %rbp
  803304:	48 89 e5             	mov    %rsp,%rbp
  803307:	48 83 ec 30          	sub    $0x30,%rsp
  80330b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80330f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803313:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803317:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80331b:	8b 50 0c             	mov    0xc(%rax),%edx
  80331e:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803325:	00 00 00 
  803328:	89 10                	mov    %edx,(%rax)
  80332a:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803331:	00 00 00 
  803334:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803338:	48 89 50 08          	mov    %rdx,0x8(%rax)
  80333c:	be 00 00 00 00       	mov    $0x0,%esi
  803341:	bf 03 00 00 00       	mov    $0x3,%edi
  803346:	48 b8 6b 31 80 00 00 	movabs $0x80316b,%rax
  80334d:	00 00 00 
  803350:	ff d0                	callq  *%rax
  803352:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803355:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803359:	79 08                	jns    803363 <devfile_read+0x60>
  80335b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80335e:	e9 a4 00 00 00       	jmpq   803407 <devfile_read+0x104>
  803363:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803366:	48 98                	cltq   
  803368:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  80336c:	76 35                	jbe    8033a3 <devfile_read+0xa0>
  80336e:	48 b9 56 52 80 00 00 	movabs $0x805256,%rcx
  803375:	00 00 00 
  803378:	48 ba 5d 52 80 00 00 	movabs $0x80525d,%rdx
  80337f:	00 00 00 
  803382:	be 89 00 00 00       	mov    $0x89,%esi
  803387:	48 bf 72 52 80 00 00 	movabs $0x805272,%rdi
  80338e:	00 00 00 
  803391:	b8 00 00 00 00       	mov    $0x0,%eax
  803396:	49 b8 2b 04 80 00 00 	movabs $0x80042b,%r8
  80339d:	00 00 00 
  8033a0:	41 ff d0             	callq  *%r8
  8033a3:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  8033aa:	7e 35                	jle    8033e1 <devfile_read+0xde>
  8033ac:	48 b9 80 52 80 00 00 	movabs $0x805280,%rcx
  8033b3:	00 00 00 
  8033b6:	48 ba 5d 52 80 00 00 	movabs $0x80525d,%rdx
  8033bd:	00 00 00 
  8033c0:	be 8a 00 00 00       	mov    $0x8a,%esi
  8033c5:	48 bf 72 52 80 00 00 	movabs $0x805272,%rdi
  8033cc:	00 00 00 
  8033cf:	b8 00 00 00 00       	mov    $0x0,%eax
  8033d4:	49 b8 2b 04 80 00 00 	movabs $0x80042b,%r8
  8033db:	00 00 00 
  8033de:	41 ff d0             	callq  *%r8
  8033e1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033e4:	48 63 d0             	movslq %eax,%rdx
  8033e7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8033eb:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  8033f2:	00 00 00 
  8033f5:	48 89 c7             	mov    %rax,%rdi
  8033f8:	48 b8 3d 15 80 00 00 	movabs $0x80153d,%rax
  8033ff:	00 00 00 
  803402:	ff d0                	callq  *%rax
  803404:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803407:	c9                   	leaveq 
  803408:	c3                   	retq   

0000000000803409 <devfile_write>:
  803409:	55                   	push   %rbp
  80340a:	48 89 e5             	mov    %rsp,%rbp
  80340d:	48 83 ec 40          	sub    $0x40,%rsp
  803411:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803415:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803419:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80341d:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803421:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803425:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  80342c:	00 
  80342d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803431:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  803435:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  80343a:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  80343e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803442:	8b 50 0c             	mov    0xc(%rax),%edx
  803445:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80344c:	00 00 00 
  80344f:	89 10                	mov    %edx,(%rax)
  803451:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803458:	00 00 00 
  80345b:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80345f:	48 89 50 08          	mov    %rdx,0x8(%rax)
  803463:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803467:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80346b:	48 89 c6             	mov    %rax,%rsi
  80346e:	48 bf 10 90 80 00 00 	movabs $0x809010,%rdi
  803475:	00 00 00 
  803478:	48 b8 3d 15 80 00 00 	movabs $0x80153d,%rax
  80347f:	00 00 00 
  803482:	ff d0                	callq  *%rax
  803484:	be 00 00 00 00       	mov    $0x0,%esi
  803489:	bf 04 00 00 00       	mov    $0x4,%edi
  80348e:	48 b8 6b 31 80 00 00 	movabs $0x80316b,%rax
  803495:	00 00 00 
  803498:	ff d0                	callq  *%rax
  80349a:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80349d:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8034a1:	79 05                	jns    8034a8 <devfile_write+0x9f>
  8034a3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8034a6:	eb 43                	jmp    8034eb <devfile_write+0xe2>
  8034a8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8034ab:	48 98                	cltq   
  8034ad:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8034b1:	76 35                	jbe    8034e8 <devfile_write+0xdf>
  8034b3:	48 b9 56 52 80 00 00 	movabs $0x805256,%rcx
  8034ba:	00 00 00 
  8034bd:	48 ba 5d 52 80 00 00 	movabs $0x80525d,%rdx
  8034c4:	00 00 00 
  8034c7:	be a8 00 00 00       	mov    $0xa8,%esi
  8034cc:	48 bf 72 52 80 00 00 	movabs $0x805272,%rdi
  8034d3:	00 00 00 
  8034d6:	b8 00 00 00 00       	mov    $0x0,%eax
  8034db:	49 b8 2b 04 80 00 00 	movabs $0x80042b,%r8
  8034e2:	00 00 00 
  8034e5:	41 ff d0             	callq  *%r8
  8034e8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8034eb:	c9                   	leaveq 
  8034ec:	c3                   	retq   

00000000008034ed <devfile_stat>:
  8034ed:	55                   	push   %rbp
  8034ee:	48 89 e5             	mov    %rsp,%rbp
  8034f1:	48 83 ec 20          	sub    $0x20,%rsp
  8034f5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8034f9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8034fd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803501:	8b 50 0c             	mov    0xc(%rax),%edx
  803504:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80350b:	00 00 00 
  80350e:	89 10                	mov    %edx,(%rax)
  803510:	be 00 00 00 00       	mov    $0x0,%esi
  803515:	bf 05 00 00 00       	mov    $0x5,%edi
  80351a:	48 b8 6b 31 80 00 00 	movabs $0x80316b,%rax
  803521:	00 00 00 
  803524:	ff d0                	callq  *%rax
  803526:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803529:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80352d:	79 05                	jns    803534 <devfile_stat+0x47>
  80352f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803532:	eb 56                	jmp    80358a <devfile_stat+0x9d>
  803534:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803538:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  80353f:	00 00 00 
  803542:	48 89 c7             	mov    %rax,%rdi
  803545:	48 b8 19 12 80 00 00 	movabs $0x801219,%rax
  80354c:	00 00 00 
  80354f:	ff d0                	callq  *%rax
  803551:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803558:	00 00 00 
  80355b:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  803561:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803565:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  80356b:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803572:	00 00 00 
  803575:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  80357b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80357f:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  803585:	b8 00 00 00 00       	mov    $0x0,%eax
  80358a:	c9                   	leaveq 
  80358b:	c3                   	retq   

000000000080358c <devfile_trunc>:
  80358c:	55                   	push   %rbp
  80358d:	48 89 e5             	mov    %rsp,%rbp
  803590:	48 83 ec 10          	sub    $0x10,%rsp
  803594:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803598:	89 75 f4             	mov    %esi,-0xc(%rbp)
  80359b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80359f:	8b 50 0c             	mov    0xc(%rax),%edx
  8035a2:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8035a9:	00 00 00 
  8035ac:	89 10                	mov    %edx,(%rax)
  8035ae:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8035b5:	00 00 00 
  8035b8:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8035bb:	89 50 04             	mov    %edx,0x4(%rax)
  8035be:	be 00 00 00 00       	mov    $0x0,%esi
  8035c3:	bf 02 00 00 00       	mov    $0x2,%edi
  8035c8:	48 b8 6b 31 80 00 00 	movabs $0x80316b,%rax
  8035cf:	00 00 00 
  8035d2:	ff d0                	callq  *%rax
  8035d4:	c9                   	leaveq 
  8035d5:	c3                   	retq   

00000000008035d6 <remove>:
  8035d6:	55                   	push   %rbp
  8035d7:	48 89 e5             	mov    %rsp,%rbp
  8035da:	48 83 ec 10          	sub    $0x10,%rsp
  8035de:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8035e2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8035e6:	48 89 c7             	mov    %rax,%rdi
  8035e9:	48 b8 ad 11 80 00 00 	movabs $0x8011ad,%rax
  8035f0:	00 00 00 
  8035f3:	ff d0                	callq  *%rax
  8035f5:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  8035fa:	7e 07                	jle    803603 <remove+0x2d>
  8035fc:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  803601:	eb 33                	jmp    803636 <remove+0x60>
  803603:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803607:	48 89 c6             	mov    %rax,%rsi
  80360a:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  803611:	00 00 00 
  803614:	48 b8 19 12 80 00 00 	movabs $0x801219,%rax
  80361b:	00 00 00 
  80361e:	ff d0                	callq  *%rax
  803620:	be 00 00 00 00       	mov    $0x0,%esi
  803625:	bf 07 00 00 00       	mov    $0x7,%edi
  80362a:	48 b8 6b 31 80 00 00 	movabs $0x80316b,%rax
  803631:	00 00 00 
  803634:	ff d0                	callq  *%rax
  803636:	c9                   	leaveq 
  803637:	c3                   	retq   

0000000000803638 <sync>:
  803638:	55                   	push   %rbp
  803639:	48 89 e5             	mov    %rsp,%rbp
  80363c:	be 00 00 00 00       	mov    $0x0,%esi
  803641:	bf 08 00 00 00       	mov    $0x8,%edi
  803646:	48 b8 6b 31 80 00 00 	movabs $0x80316b,%rax
  80364d:	00 00 00 
  803650:	ff d0                	callq  *%rax
  803652:	5d                   	pop    %rbp
  803653:	c3                   	retq   

0000000000803654 <copy>:
  803654:	55                   	push   %rbp
  803655:	48 89 e5             	mov    %rsp,%rbp
  803658:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  80365f:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  803666:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  80366d:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  803674:	be 00 00 00 00       	mov    $0x0,%esi
  803679:	48 89 c7             	mov    %rax,%rdi
  80367c:	48 b8 f2 31 80 00 00 	movabs $0x8031f2,%rax
  803683:	00 00 00 
  803686:	ff d0                	callq  *%rax
  803688:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80368b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80368f:	79 28                	jns    8036b9 <copy+0x65>
  803691:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803694:	89 c6                	mov    %eax,%esi
  803696:	48 bf 8c 52 80 00 00 	movabs $0x80528c,%rdi
  80369d:	00 00 00 
  8036a0:	b8 00 00 00 00       	mov    $0x0,%eax
  8036a5:	48 ba 64 06 80 00 00 	movabs $0x800664,%rdx
  8036ac:	00 00 00 
  8036af:	ff d2                	callq  *%rdx
  8036b1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036b4:	e9 74 01 00 00       	jmpq   80382d <copy+0x1d9>
  8036b9:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  8036c0:	be 01 01 00 00       	mov    $0x101,%esi
  8036c5:	48 89 c7             	mov    %rax,%rdi
  8036c8:	48 b8 f2 31 80 00 00 	movabs $0x8031f2,%rax
  8036cf:	00 00 00 
  8036d2:	ff d0                	callq  *%rax
  8036d4:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8036d7:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8036db:	79 39                	jns    803716 <copy+0xc2>
  8036dd:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8036e0:	89 c6                	mov    %eax,%esi
  8036e2:	48 bf a2 52 80 00 00 	movabs $0x8052a2,%rdi
  8036e9:	00 00 00 
  8036ec:	b8 00 00 00 00       	mov    $0x0,%eax
  8036f1:	48 ba 64 06 80 00 00 	movabs $0x800664,%rdx
  8036f8:	00 00 00 
  8036fb:	ff d2                	callq  *%rdx
  8036fd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803700:	89 c7                	mov    %eax,%edi
  803702:	48 b8 fa 2a 80 00 00 	movabs $0x802afa,%rax
  803709:	00 00 00 
  80370c:	ff d0                	callq  *%rax
  80370e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803711:	e9 17 01 00 00       	jmpq   80382d <copy+0x1d9>
  803716:	eb 74                	jmp    80378c <copy+0x138>
  803718:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80371b:	48 63 d0             	movslq %eax,%rdx
  80371e:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  803725:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803728:	48 89 ce             	mov    %rcx,%rsi
  80372b:	89 c7                	mov    %eax,%edi
  80372d:	48 b8 66 2e 80 00 00 	movabs $0x802e66,%rax
  803734:	00 00 00 
  803737:	ff d0                	callq  *%rax
  803739:	89 45 f0             	mov    %eax,-0x10(%rbp)
  80373c:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  803740:	79 4a                	jns    80378c <copy+0x138>
  803742:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803745:	89 c6                	mov    %eax,%esi
  803747:	48 bf bc 52 80 00 00 	movabs $0x8052bc,%rdi
  80374e:	00 00 00 
  803751:	b8 00 00 00 00       	mov    $0x0,%eax
  803756:	48 ba 64 06 80 00 00 	movabs $0x800664,%rdx
  80375d:	00 00 00 
  803760:	ff d2                	callq  *%rdx
  803762:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803765:	89 c7                	mov    %eax,%edi
  803767:	48 b8 fa 2a 80 00 00 	movabs $0x802afa,%rax
  80376e:	00 00 00 
  803771:	ff d0                	callq  *%rax
  803773:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803776:	89 c7                	mov    %eax,%edi
  803778:	48 b8 fa 2a 80 00 00 	movabs $0x802afa,%rax
  80377f:	00 00 00 
  803782:	ff d0                	callq  *%rax
  803784:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803787:	e9 a1 00 00 00       	jmpq   80382d <copy+0x1d9>
  80378c:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  803793:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803796:	ba 00 02 00 00       	mov    $0x200,%edx
  80379b:	48 89 ce             	mov    %rcx,%rsi
  80379e:	89 c7                	mov    %eax,%edi
  8037a0:	48 b8 1c 2d 80 00 00 	movabs $0x802d1c,%rax
  8037a7:	00 00 00 
  8037aa:	ff d0                	callq  *%rax
  8037ac:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8037af:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8037b3:	0f 8f 5f ff ff ff    	jg     803718 <copy+0xc4>
  8037b9:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8037bd:	79 47                	jns    803806 <copy+0x1b2>
  8037bf:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8037c2:	89 c6                	mov    %eax,%esi
  8037c4:	48 bf cf 52 80 00 00 	movabs $0x8052cf,%rdi
  8037cb:	00 00 00 
  8037ce:	b8 00 00 00 00       	mov    $0x0,%eax
  8037d3:	48 ba 64 06 80 00 00 	movabs $0x800664,%rdx
  8037da:	00 00 00 
  8037dd:	ff d2                	callq  *%rdx
  8037df:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037e2:	89 c7                	mov    %eax,%edi
  8037e4:	48 b8 fa 2a 80 00 00 	movabs $0x802afa,%rax
  8037eb:	00 00 00 
  8037ee:	ff d0                	callq  *%rax
  8037f0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8037f3:	89 c7                	mov    %eax,%edi
  8037f5:	48 b8 fa 2a 80 00 00 	movabs $0x802afa,%rax
  8037fc:	00 00 00 
  8037ff:	ff d0                	callq  *%rax
  803801:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803804:	eb 27                	jmp    80382d <copy+0x1d9>
  803806:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803809:	89 c7                	mov    %eax,%edi
  80380b:	48 b8 fa 2a 80 00 00 	movabs $0x802afa,%rax
  803812:	00 00 00 
  803815:	ff d0                	callq  *%rax
  803817:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80381a:	89 c7                	mov    %eax,%edi
  80381c:	48 b8 fa 2a 80 00 00 	movabs $0x802afa,%rax
  803823:	00 00 00 
  803826:	ff d0                	callq  *%rax
  803828:	b8 00 00 00 00       	mov    $0x0,%eax
  80382d:	c9                   	leaveq 
  80382e:	c3                   	retq   

000000000080382f <pageref>:
  80382f:	55                   	push   %rbp
  803830:	48 89 e5             	mov    %rsp,%rbp
  803833:	48 83 ec 18          	sub    $0x18,%rsp
  803837:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80383b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80383f:	48 c1 e8 15          	shr    $0x15,%rax
  803843:	48 89 c2             	mov    %rax,%rdx
  803846:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  80384d:	01 00 00 
  803850:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803854:	83 e0 01             	and    $0x1,%eax
  803857:	48 85 c0             	test   %rax,%rax
  80385a:	75 07                	jne    803863 <pageref+0x34>
  80385c:	b8 00 00 00 00       	mov    $0x0,%eax
  803861:	eb 53                	jmp    8038b6 <pageref+0x87>
  803863:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803867:	48 c1 e8 0c          	shr    $0xc,%rax
  80386b:	48 89 c2             	mov    %rax,%rdx
  80386e:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  803875:	01 00 00 
  803878:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80387c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803880:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803884:	83 e0 01             	and    $0x1,%eax
  803887:	48 85 c0             	test   %rax,%rax
  80388a:	75 07                	jne    803893 <pageref+0x64>
  80388c:	b8 00 00 00 00       	mov    $0x0,%eax
  803891:	eb 23                	jmp    8038b6 <pageref+0x87>
  803893:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803897:	48 c1 e8 0c          	shr    $0xc,%rax
  80389b:	48 89 c2             	mov    %rax,%rdx
  80389e:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  8038a5:	00 00 00 
  8038a8:	48 c1 e2 04          	shl    $0x4,%rdx
  8038ac:	48 01 d0             	add    %rdx,%rax
  8038af:	0f b7 40 08          	movzwl 0x8(%rax),%eax
  8038b3:	0f b7 c0             	movzwl %ax,%eax
  8038b6:	c9                   	leaveq 
  8038b7:	c3                   	retq   

00000000008038b8 <fd2sockid>:
  8038b8:	55                   	push   %rbp
  8038b9:	48 89 e5             	mov    %rsp,%rbp
  8038bc:	48 83 ec 20          	sub    $0x20,%rsp
  8038c0:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8038c3:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8038c7:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8038ca:	48 89 d6             	mov    %rdx,%rsi
  8038cd:	89 c7                	mov    %eax,%edi
  8038cf:	48 b8 ea 28 80 00 00 	movabs $0x8028ea,%rax
  8038d6:	00 00 00 
  8038d9:	ff d0                	callq  *%rax
  8038db:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8038de:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8038e2:	79 05                	jns    8038e9 <fd2sockid+0x31>
  8038e4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038e7:	eb 24                	jmp    80390d <fd2sockid+0x55>
  8038e9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8038ed:	8b 10                	mov    (%rax),%edx
  8038ef:	48 b8 a0 70 80 00 00 	movabs $0x8070a0,%rax
  8038f6:	00 00 00 
  8038f9:	8b 00                	mov    (%rax),%eax
  8038fb:	39 c2                	cmp    %eax,%edx
  8038fd:	74 07                	je     803906 <fd2sockid+0x4e>
  8038ff:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803904:	eb 07                	jmp    80390d <fd2sockid+0x55>
  803906:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80390a:	8b 40 0c             	mov    0xc(%rax),%eax
  80390d:	c9                   	leaveq 
  80390e:	c3                   	retq   

000000000080390f <alloc_sockfd>:
  80390f:	55                   	push   %rbp
  803910:	48 89 e5             	mov    %rsp,%rbp
  803913:	48 83 ec 20          	sub    $0x20,%rsp
  803917:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80391a:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  80391e:	48 89 c7             	mov    %rax,%rdi
  803921:	48 b8 52 28 80 00 00 	movabs $0x802852,%rax
  803928:	00 00 00 
  80392b:	ff d0                	callq  *%rax
  80392d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803930:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803934:	78 26                	js     80395c <alloc_sockfd+0x4d>
  803936:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80393a:	ba 07 04 00 00       	mov    $0x407,%edx
  80393f:	48 89 c6             	mov    %rax,%rsi
  803942:	bf 00 00 00 00       	mov    $0x0,%edi
  803947:	48 b8 48 1b 80 00 00 	movabs $0x801b48,%rax
  80394e:	00 00 00 
  803951:	ff d0                	callq  *%rax
  803953:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803956:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80395a:	79 16                	jns    803972 <alloc_sockfd+0x63>
  80395c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80395f:	89 c7                	mov    %eax,%edi
  803961:	48 b8 1c 3e 80 00 00 	movabs $0x803e1c,%rax
  803968:	00 00 00 
  80396b:	ff d0                	callq  *%rax
  80396d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803970:	eb 3a                	jmp    8039ac <alloc_sockfd+0x9d>
  803972:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803976:	48 ba a0 70 80 00 00 	movabs $0x8070a0,%rdx
  80397d:	00 00 00 
  803980:	8b 12                	mov    (%rdx),%edx
  803982:	89 10                	mov    %edx,(%rax)
  803984:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803988:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  80398f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803993:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803996:	89 50 0c             	mov    %edx,0xc(%rax)
  803999:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80399d:	48 89 c7             	mov    %rax,%rdi
  8039a0:	48 b8 04 28 80 00 00 	movabs $0x802804,%rax
  8039a7:	00 00 00 
  8039aa:	ff d0                	callq  *%rax
  8039ac:	c9                   	leaveq 
  8039ad:	c3                   	retq   

00000000008039ae <accept>:
  8039ae:	55                   	push   %rbp
  8039af:	48 89 e5             	mov    %rsp,%rbp
  8039b2:	48 83 ec 30          	sub    $0x30,%rsp
  8039b6:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8039b9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8039bd:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8039c1:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8039c4:	89 c7                	mov    %eax,%edi
  8039c6:	48 b8 b8 38 80 00 00 	movabs $0x8038b8,%rax
  8039cd:	00 00 00 
  8039d0:	ff d0                	callq  *%rax
  8039d2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8039d5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8039d9:	79 05                	jns    8039e0 <accept+0x32>
  8039db:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039de:	eb 3b                	jmp    803a1b <accept+0x6d>
  8039e0:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8039e4:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8039e8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039eb:	48 89 ce             	mov    %rcx,%rsi
  8039ee:	89 c7                	mov    %eax,%edi
  8039f0:	48 b8 f9 3c 80 00 00 	movabs $0x803cf9,%rax
  8039f7:	00 00 00 
  8039fa:	ff d0                	callq  *%rax
  8039fc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8039ff:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803a03:	79 05                	jns    803a0a <accept+0x5c>
  803a05:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a08:	eb 11                	jmp    803a1b <accept+0x6d>
  803a0a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a0d:	89 c7                	mov    %eax,%edi
  803a0f:	48 b8 0f 39 80 00 00 	movabs $0x80390f,%rax
  803a16:	00 00 00 
  803a19:	ff d0                	callq  *%rax
  803a1b:	c9                   	leaveq 
  803a1c:	c3                   	retq   

0000000000803a1d <bind>:
  803a1d:	55                   	push   %rbp
  803a1e:	48 89 e5             	mov    %rsp,%rbp
  803a21:	48 83 ec 20          	sub    $0x20,%rsp
  803a25:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803a28:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803a2c:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803a2f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803a32:	89 c7                	mov    %eax,%edi
  803a34:	48 b8 b8 38 80 00 00 	movabs $0x8038b8,%rax
  803a3b:	00 00 00 
  803a3e:	ff d0                	callq  *%rax
  803a40:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803a43:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803a47:	79 05                	jns    803a4e <bind+0x31>
  803a49:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a4c:	eb 1b                	jmp    803a69 <bind+0x4c>
  803a4e:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803a51:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803a55:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a58:	48 89 ce             	mov    %rcx,%rsi
  803a5b:	89 c7                	mov    %eax,%edi
  803a5d:	48 b8 78 3d 80 00 00 	movabs $0x803d78,%rax
  803a64:	00 00 00 
  803a67:	ff d0                	callq  *%rax
  803a69:	c9                   	leaveq 
  803a6a:	c3                   	retq   

0000000000803a6b <shutdown>:
  803a6b:	55                   	push   %rbp
  803a6c:	48 89 e5             	mov    %rsp,%rbp
  803a6f:	48 83 ec 20          	sub    $0x20,%rsp
  803a73:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803a76:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803a79:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803a7c:	89 c7                	mov    %eax,%edi
  803a7e:	48 b8 b8 38 80 00 00 	movabs $0x8038b8,%rax
  803a85:	00 00 00 
  803a88:	ff d0                	callq  *%rax
  803a8a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803a8d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803a91:	79 05                	jns    803a98 <shutdown+0x2d>
  803a93:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a96:	eb 16                	jmp    803aae <shutdown+0x43>
  803a98:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803a9b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a9e:	89 d6                	mov    %edx,%esi
  803aa0:	89 c7                	mov    %eax,%edi
  803aa2:	48 b8 dc 3d 80 00 00 	movabs $0x803ddc,%rax
  803aa9:	00 00 00 
  803aac:	ff d0                	callq  *%rax
  803aae:	c9                   	leaveq 
  803aaf:	c3                   	retq   

0000000000803ab0 <devsock_close>:
  803ab0:	55                   	push   %rbp
  803ab1:	48 89 e5             	mov    %rsp,%rbp
  803ab4:	48 83 ec 10          	sub    $0x10,%rsp
  803ab8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803abc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803ac0:	48 89 c7             	mov    %rax,%rdi
  803ac3:	48 b8 2f 38 80 00 00 	movabs $0x80382f,%rax
  803aca:	00 00 00 
  803acd:	ff d0                	callq  *%rax
  803acf:	83 f8 01             	cmp    $0x1,%eax
  803ad2:	75 17                	jne    803aeb <devsock_close+0x3b>
  803ad4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803ad8:	8b 40 0c             	mov    0xc(%rax),%eax
  803adb:	89 c7                	mov    %eax,%edi
  803add:	48 b8 1c 3e 80 00 00 	movabs $0x803e1c,%rax
  803ae4:	00 00 00 
  803ae7:	ff d0                	callq  *%rax
  803ae9:	eb 05                	jmp    803af0 <devsock_close+0x40>
  803aeb:	b8 00 00 00 00       	mov    $0x0,%eax
  803af0:	c9                   	leaveq 
  803af1:	c3                   	retq   

0000000000803af2 <connect>:
  803af2:	55                   	push   %rbp
  803af3:	48 89 e5             	mov    %rsp,%rbp
  803af6:	48 83 ec 20          	sub    $0x20,%rsp
  803afa:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803afd:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803b01:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803b04:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803b07:	89 c7                	mov    %eax,%edi
  803b09:	48 b8 b8 38 80 00 00 	movabs $0x8038b8,%rax
  803b10:	00 00 00 
  803b13:	ff d0                	callq  *%rax
  803b15:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803b18:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803b1c:	79 05                	jns    803b23 <connect+0x31>
  803b1e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b21:	eb 1b                	jmp    803b3e <connect+0x4c>
  803b23:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803b26:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803b2a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b2d:	48 89 ce             	mov    %rcx,%rsi
  803b30:	89 c7                	mov    %eax,%edi
  803b32:	48 b8 49 3e 80 00 00 	movabs $0x803e49,%rax
  803b39:	00 00 00 
  803b3c:	ff d0                	callq  *%rax
  803b3e:	c9                   	leaveq 
  803b3f:	c3                   	retq   

0000000000803b40 <listen>:
  803b40:	55                   	push   %rbp
  803b41:	48 89 e5             	mov    %rsp,%rbp
  803b44:	48 83 ec 20          	sub    $0x20,%rsp
  803b48:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803b4b:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803b4e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803b51:	89 c7                	mov    %eax,%edi
  803b53:	48 b8 b8 38 80 00 00 	movabs $0x8038b8,%rax
  803b5a:	00 00 00 
  803b5d:	ff d0                	callq  *%rax
  803b5f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803b62:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803b66:	79 05                	jns    803b6d <listen+0x2d>
  803b68:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b6b:	eb 16                	jmp    803b83 <listen+0x43>
  803b6d:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803b70:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b73:	89 d6                	mov    %edx,%esi
  803b75:	89 c7                	mov    %eax,%edi
  803b77:	48 b8 ad 3e 80 00 00 	movabs $0x803ead,%rax
  803b7e:	00 00 00 
  803b81:	ff d0                	callq  *%rax
  803b83:	c9                   	leaveq 
  803b84:	c3                   	retq   

0000000000803b85 <devsock_read>:
  803b85:	55                   	push   %rbp
  803b86:	48 89 e5             	mov    %rsp,%rbp
  803b89:	48 83 ec 20          	sub    $0x20,%rsp
  803b8d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803b91:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803b95:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803b99:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803b9d:	89 c2                	mov    %eax,%edx
  803b9f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803ba3:	8b 40 0c             	mov    0xc(%rax),%eax
  803ba6:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803baa:	b9 00 00 00 00       	mov    $0x0,%ecx
  803baf:	89 c7                	mov    %eax,%edi
  803bb1:	48 b8 ed 3e 80 00 00 	movabs $0x803eed,%rax
  803bb8:	00 00 00 
  803bbb:	ff d0                	callq  *%rax
  803bbd:	c9                   	leaveq 
  803bbe:	c3                   	retq   

0000000000803bbf <devsock_write>:
  803bbf:	55                   	push   %rbp
  803bc0:	48 89 e5             	mov    %rsp,%rbp
  803bc3:	48 83 ec 20          	sub    $0x20,%rsp
  803bc7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803bcb:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803bcf:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803bd3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803bd7:	89 c2                	mov    %eax,%edx
  803bd9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803bdd:	8b 40 0c             	mov    0xc(%rax),%eax
  803be0:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803be4:	b9 00 00 00 00       	mov    $0x0,%ecx
  803be9:	89 c7                	mov    %eax,%edi
  803beb:	48 b8 b9 3f 80 00 00 	movabs $0x803fb9,%rax
  803bf2:	00 00 00 
  803bf5:	ff d0                	callq  *%rax
  803bf7:	c9                   	leaveq 
  803bf8:	c3                   	retq   

0000000000803bf9 <devsock_stat>:
  803bf9:	55                   	push   %rbp
  803bfa:	48 89 e5             	mov    %rsp,%rbp
  803bfd:	48 83 ec 10          	sub    $0x10,%rsp
  803c01:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803c05:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803c09:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803c0d:	48 be ea 52 80 00 00 	movabs $0x8052ea,%rsi
  803c14:	00 00 00 
  803c17:	48 89 c7             	mov    %rax,%rdi
  803c1a:	48 b8 19 12 80 00 00 	movabs $0x801219,%rax
  803c21:	00 00 00 
  803c24:	ff d0                	callq  *%rax
  803c26:	b8 00 00 00 00       	mov    $0x0,%eax
  803c2b:	c9                   	leaveq 
  803c2c:	c3                   	retq   

0000000000803c2d <socket>:
  803c2d:	55                   	push   %rbp
  803c2e:	48 89 e5             	mov    %rsp,%rbp
  803c31:	48 83 ec 20          	sub    $0x20,%rsp
  803c35:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803c38:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803c3b:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  803c3e:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803c41:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803c44:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803c47:	89 ce                	mov    %ecx,%esi
  803c49:	89 c7                	mov    %eax,%edi
  803c4b:	48 b8 71 40 80 00 00 	movabs $0x804071,%rax
  803c52:	00 00 00 
  803c55:	ff d0                	callq  *%rax
  803c57:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803c5a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803c5e:	79 05                	jns    803c65 <socket+0x38>
  803c60:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c63:	eb 11                	jmp    803c76 <socket+0x49>
  803c65:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c68:	89 c7                	mov    %eax,%edi
  803c6a:	48 b8 0f 39 80 00 00 	movabs $0x80390f,%rax
  803c71:	00 00 00 
  803c74:	ff d0                	callq  *%rax
  803c76:	c9                   	leaveq 
  803c77:	c3                   	retq   

0000000000803c78 <nsipc>:
  803c78:	55                   	push   %rbp
  803c79:	48 89 e5             	mov    %rsp,%rbp
  803c7c:	48 83 ec 10          	sub    $0x10,%rsp
  803c80:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803c83:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803c8a:	00 00 00 
  803c8d:	8b 00                	mov    (%rax),%eax
  803c8f:	85 c0                	test   %eax,%eax
  803c91:	75 1d                	jne    803cb0 <nsipc+0x38>
  803c93:	bf 02 00 00 00       	mov    $0x2,%edi
  803c98:	48 b8 92 27 80 00 00 	movabs $0x802792,%rax
  803c9f:	00 00 00 
  803ca2:	ff d0                	callq  *%rax
  803ca4:	48 ba 04 80 80 00 00 	movabs $0x808004,%rdx
  803cab:	00 00 00 
  803cae:	89 02                	mov    %eax,(%rdx)
  803cb0:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803cb7:	00 00 00 
  803cba:	8b 00                	mov    (%rax),%eax
  803cbc:	8b 75 fc             	mov    -0x4(%rbp),%esi
  803cbf:	b9 07 00 00 00       	mov    $0x7,%ecx
  803cc4:	48 ba 00 b0 80 00 00 	movabs $0x80b000,%rdx
  803ccb:	00 00 00 
  803cce:	89 c7                	mov    %eax,%edi
  803cd0:	48 b8 fc 26 80 00 00 	movabs $0x8026fc,%rax
  803cd7:	00 00 00 
  803cda:	ff d0                	callq  *%rax
  803cdc:	ba 00 00 00 00       	mov    $0x0,%edx
  803ce1:	be 00 00 00 00       	mov    $0x0,%esi
  803ce6:	bf 00 00 00 00       	mov    $0x0,%edi
  803ceb:	48 b8 3b 26 80 00 00 	movabs $0x80263b,%rax
  803cf2:	00 00 00 
  803cf5:	ff d0                	callq  *%rax
  803cf7:	c9                   	leaveq 
  803cf8:	c3                   	retq   

0000000000803cf9 <nsipc_accept>:
  803cf9:	55                   	push   %rbp
  803cfa:	48 89 e5             	mov    %rsp,%rbp
  803cfd:	48 83 ec 30          	sub    $0x30,%rsp
  803d01:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803d04:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803d08:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803d0c:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d13:	00 00 00 
  803d16:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803d19:	89 10                	mov    %edx,(%rax)
  803d1b:	bf 01 00 00 00       	mov    $0x1,%edi
  803d20:	48 b8 78 3c 80 00 00 	movabs $0x803c78,%rax
  803d27:	00 00 00 
  803d2a:	ff d0                	callq  *%rax
  803d2c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803d2f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803d33:	78 3e                	js     803d73 <nsipc_accept+0x7a>
  803d35:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d3c:	00 00 00 
  803d3f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803d43:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803d47:	8b 40 10             	mov    0x10(%rax),%eax
  803d4a:	89 c2                	mov    %eax,%edx
  803d4c:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  803d50:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803d54:	48 89 ce             	mov    %rcx,%rsi
  803d57:	48 89 c7             	mov    %rax,%rdi
  803d5a:	48 b8 3d 15 80 00 00 	movabs $0x80153d,%rax
  803d61:	00 00 00 
  803d64:	ff d0                	callq  *%rax
  803d66:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803d6a:	8b 50 10             	mov    0x10(%rax),%edx
  803d6d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803d71:	89 10                	mov    %edx,(%rax)
  803d73:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d76:	c9                   	leaveq 
  803d77:	c3                   	retq   

0000000000803d78 <nsipc_bind>:
  803d78:	55                   	push   %rbp
  803d79:	48 89 e5             	mov    %rsp,%rbp
  803d7c:	48 83 ec 10          	sub    $0x10,%rsp
  803d80:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803d83:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803d87:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803d8a:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d91:	00 00 00 
  803d94:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803d97:	89 10                	mov    %edx,(%rax)
  803d99:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803d9c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803da0:	48 89 c6             	mov    %rax,%rsi
  803da3:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803daa:	00 00 00 
  803dad:	48 b8 3d 15 80 00 00 	movabs $0x80153d,%rax
  803db4:	00 00 00 
  803db7:	ff d0                	callq  *%rax
  803db9:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803dc0:	00 00 00 
  803dc3:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803dc6:	89 50 14             	mov    %edx,0x14(%rax)
  803dc9:	bf 02 00 00 00       	mov    $0x2,%edi
  803dce:	48 b8 78 3c 80 00 00 	movabs $0x803c78,%rax
  803dd5:	00 00 00 
  803dd8:	ff d0                	callq  *%rax
  803dda:	c9                   	leaveq 
  803ddb:	c3                   	retq   

0000000000803ddc <nsipc_shutdown>:
  803ddc:	55                   	push   %rbp
  803ddd:	48 89 e5             	mov    %rsp,%rbp
  803de0:	48 83 ec 10          	sub    $0x10,%rsp
  803de4:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803de7:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803dea:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803df1:	00 00 00 
  803df4:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803df7:	89 10                	mov    %edx,(%rax)
  803df9:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e00:	00 00 00 
  803e03:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803e06:	89 50 04             	mov    %edx,0x4(%rax)
  803e09:	bf 03 00 00 00       	mov    $0x3,%edi
  803e0e:	48 b8 78 3c 80 00 00 	movabs $0x803c78,%rax
  803e15:	00 00 00 
  803e18:	ff d0                	callq  *%rax
  803e1a:	c9                   	leaveq 
  803e1b:	c3                   	retq   

0000000000803e1c <nsipc_close>:
  803e1c:	55                   	push   %rbp
  803e1d:	48 89 e5             	mov    %rsp,%rbp
  803e20:	48 83 ec 10          	sub    $0x10,%rsp
  803e24:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803e27:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e2e:	00 00 00 
  803e31:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803e34:	89 10                	mov    %edx,(%rax)
  803e36:	bf 04 00 00 00       	mov    $0x4,%edi
  803e3b:	48 b8 78 3c 80 00 00 	movabs $0x803c78,%rax
  803e42:	00 00 00 
  803e45:	ff d0                	callq  *%rax
  803e47:	c9                   	leaveq 
  803e48:	c3                   	retq   

0000000000803e49 <nsipc_connect>:
  803e49:	55                   	push   %rbp
  803e4a:	48 89 e5             	mov    %rsp,%rbp
  803e4d:	48 83 ec 10          	sub    $0x10,%rsp
  803e51:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803e54:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803e58:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803e5b:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e62:	00 00 00 
  803e65:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803e68:	89 10                	mov    %edx,(%rax)
  803e6a:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803e6d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e71:	48 89 c6             	mov    %rax,%rsi
  803e74:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803e7b:	00 00 00 
  803e7e:	48 b8 3d 15 80 00 00 	movabs $0x80153d,%rax
  803e85:	00 00 00 
  803e88:	ff d0                	callq  *%rax
  803e8a:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e91:	00 00 00 
  803e94:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803e97:	89 50 14             	mov    %edx,0x14(%rax)
  803e9a:	bf 05 00 00 00       	mov    $0x5,%edi
  803e9f:	48 b8 78 3c 80 00 00 	movabs $0x803c78,%rax
  803ea6:	00 00 00 
  803ea9:	ff d0                	callq  *%rax
  803eab:	c9                   	leaveq 
  803eac:	c3                   	retq   

0000000000803ead <nsipc_listen>:
  803ead:	55                   	push   %rbp
  803eae:	48 89 e5             	mov    %rsp,%rbp
  803eb1:	48 83 ec 10          	sub    $0x10,%rsp
  803eb5:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803eb8:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803ebb:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803ec2:	00 00 00 
  803ec5:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803ec8:	89 10                	mov    %edx,(%rax)
  803eca:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803ed1:	00 00 00 
  803ed4:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803ed7:	89 50 04             	mov    %edx,0x4(%rax)
  803eda:	bf 06 00 00 00       	mov    $0x6,%edi
  803edf:	48 b8 78 3c 80 00 00 	movabs $0x803c78,%rax
  803ee6:	00 00 00 
  803ee9:	ff d0                	callq  *%rax
  803eeb:	c9                   	leaveq 
  803eec:	c3                   	retq   

0000000000803eed <nsipc_recv>:
  803eed:	55                   	push   %rbp
  803eee:	48 89 e5             	mov    %rsp,%rbp
  803ef1:	48 83 ec 30          	sub    $0x30,%rsp
  803ef5:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803ef8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803efc:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803eff:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  803f02:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803f09:	00 00 00 
  803f0c:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803f0f:	89 10                	mov    %edx,(%rax)
  803f11:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803f18:	00 00 00 
  803f1b:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803f1e:	89 50 04             	mov    %edx,0x4(%rax)
  803f21:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803f28:	00 00 00 
  803f2b:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803f2e:	89 50 08             	mov    %edx,0x8(%rax)
  803f31:	bf 07 00 00 00       	mov    $0x7,%edi
  803f36:	48 b8 78 3c 80 00 00 	movabs $0x803c78,%rax
  803f3d:	00 00 00 
  803f40:	ff d0                	callq  *%rax
  803f42:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803f45:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803f49:	78 69                	js     803fb4 <nsipc_recv+0xc7>
  803f4b:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  803f52:	7f 08                	jg     803f5c <nsipc_recv+0x6f>
  803f54:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f57:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  803f5a:	7e 35                	jle    803f91 <nsipc_recv+0xa4>
  803f5c:	48 b9 f1 52 80 00 00 	movabs $0x8052f1,%rcx
  803f63:	00 00 00 
  803f66:	48 ba 06 53 80 00 00 	movabs $0x805306,%rdx
  803f6d:	00 00 00 
  803f70:	be 62 00 00 00       	mov    $0x62,%esi
  803f75:	48 bf 1b 53 80 00 00 	movabs $0x80531b,%rdi
  803f7c:	00 00 00 
  803f7f:	b8 00 00 00 00       	mov    $0x0,%eax
  803f84:	49 b8 2b 04 80 00 00 	movabs $0x80042b,%r8
  803f8b:	00 00 00 
  803f8e:	41 ff d0             	callq  *%r8
  803f91:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f94:	48 63 d0             	movslq %eax,%rdx
  803f97:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803f9b:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  803fa2:	00 00 00 
  803fa5:	48 89 c7             	mov    %rax,%rdi
  803fa8:	48 b8 3d 15 80 00 00 	movabs $0x80153d,%rax
  803faf:	00 00 00 
  803fb2:	ff d0                	callq  *%rax
  803fb4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803fb7:	c9                   	leaveq 
  803fb8:	c3                   	retq   

0000000000803fb9 <nsipc_send>:
  803fb9:	55                   	push   %rbp
  803fba:	48 89 e5             	mov    %rsp,%rbp
  803fbd:	48 83 ec 20          	sub    $0x20,%rsp
  803fc1:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803fc4:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803fc8:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803fcb:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  803fce:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803fd5:	00 00 00 
  803fd8:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803fdb:	89 10                	mov    %edx,(%rax)
  803fdd:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  803fe4:	7e 35                	jle    80401b <nsipc_send+0x62>
  803fe6:	48 b9 2a 53 80 00 00 	movabs $0x80532a,%rcx
  803fed:	00 00 00 
  803ff0:	48 ba 06 53 80 00 00 	movabs $0x805306,%rdx
  803ff7:	00 00 00 
  803ffa:	be 6d 00 00 00       	mov    $0x6d,%esi
  803fff:	48 bf 1b 53 80 00 00 	movabs $0x80531b,%rdi
  804006:	00 00 00 
  804009:	b8 00 00 00 00       	mov    $0x0,%eax
  80400e:	49 b8 2b 04 80 00 00 	movabs $0x80042b,%r8
  804015:	00 00 00 
  804018:	41 ff d0             	callq  *%r8
  80401b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80401e:	48 63 d0             	movslq %eax,%rdx
  804021:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804025:	48 89 c6             	mov    %rax,%rsi
  804028:	48 bf 0c b0 80 00 00 	movabs $0x80b00c,%rdi
  80402f:	00 00 00 
  804032:	48 b8 3d 15 80 00 00 	movabs $0x80153d,%rax
  804039:	00 00 00 
  80403c:	ff d0                	callq  *%rax
  80403e:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804045:	00 00 00 
  804048:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80404b:	89 50 04             	mov    %edx,0x4(%rax)
  80404e:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804055:	00 00 00 
  804058:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80405b:	89 50 08             	mov    %edx,0x8(%rax)
  80405e:	bf 08 00 00 00       	mov    $0x8,%edi
  804063:	48 b8 78 3c 80 00 00 	movabs $0x803c78,%rax
  80406a:	00 00 00 
  80406d:	ff d0                	callq  *%rax
  80406f:	c9                   	leaveq 
  804070:	c3                   	retq   

0000000000804071 <nsipc_socket>:
  804071:	55                   	push   %rbp
  804072:	48 89 e5             	mov    %rsp,%rbp
  804075:	48 83 ec 10          	sub    $0x10,%rsp
  804079:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80407c:	89 75 f8             	mov    %esi,-0x8(%rbp)
  80407f:	89 55 f4             	mov    %edx,-0xc(%rbp)
  804082:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804089:	00 00 00 
  80408c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80408f:	89 10                	mov    %edx,(%rax)
  804091:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804098:	00 00 00 
  80409b:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80409e:	89 50 04             	mov    %edx,0x4(%rax)
  8040a1:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8040a8:	00 00 00 
  8040ab:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8040ae:	89 50 08             	mov    %edx,0x8(%rax)
  8040b1:	bf 09 00 00 00       	mov    $0x9,%edi
  8040b6:	48 b8 78 3c 80 00 00 	movabs $0x803c78,%rax
  8040bd:	00 00 00 
  8040c0:	ff d0                	callq  *%rax
  8040c2:	c9                   	leaveq 
  8040c3:	c3                   	retq   

00000000008040c4 <pipe>:
  8040c4:	55                   	push   %rbp
  8040c5:	48 89 e5             	mov    %rsp,%rbp
  8040c8:	53                   	push   %rbx
  8040c9:	48 83 ec 38          	sub    $0x38,%rsp
  8040cd:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  8040d1:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  8040d5:	48 89 c7             	mov    %rax,%rdi
  8040d8:	48 b8 52 28 80 00 00 	movabs $0x802852,%rax
  8040df:	00 00 00 
  8040e2:	ff d0                	callq  *%rax
  8040e4:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8040e7:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8040eb:	0f 88 bf 01 00 00    	js     8042b0 <pipe+0x1ec>
  8040f1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8040f5:	ba 07 04 00 00       	mov    $0x407,%edx
  8040fa:	48 89 c6             	mov    %rax,%rsi
  8040fd:	bf 00 00 00 00       	mov    $0x0,%edi
  804102:	48 b8 48 1b 80 00 00 	movabs $0x801b48,%rax
  804109:	00 00 00 
  80410c:	ff d0                	callq  *%rax
  80410e:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804111:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804115:	0f 88 95 01 00 00    	js     8042b0 <pipe+0x1ec>
  80411b:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  80411f:	48 89 c7             	mov    %rax,%rdi
  804122:	48 b8 52 28 80 00 00 	movabs $0x802852,%rax
  804129:	00 00 00 
  80412c:	ff d0                	callq  *%rax
  80412e:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804131:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804135:	0f 88 5d 01 00 00    	js     804298 <pipe+0x1d4>
  80413b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80413f:	ba 07 04 00 00       	mov    $0x407,%edx
  804144:	48 89 c6             	mov    %rax,%rsi
  804147:	bf 00 00 00 00       	mov    $0x0,%edi
  80414c:	48 b8 48 1b 80 00 00 	movabs $0x801b48,%rax
  804153:	00 00 00 
  804156:	ff d0                	callq  *%rax
  804158:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80415b:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80415f:	0f 88 33 01 00 00    	js     804298 <pipe+0x1d4>
  804165:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804169:	48 89 c7             	mov    %rax,%rdi
  80416c:	48 b8 27 28 80 00 00 	movabs $0x802827,%rax
  804173:	00 00 00 
  804176:	ff d0                	callq  *%rax
  804178:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80417c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804180:	ba 07 04 00 00       	mov    $0x407,%edx
  804185:	48 89 c6             	mov    %rax,%rsi
  804188:	bf 00 00 00 00       	mov    $0x0,%edi
  80418d:	48 b8 48 1b 80 00 00 	movabs $0x801b48,%rax
  804194:	00 00 00 
  804197:	ff d0                	callq  *%rax
  804199:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80419c:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8041a0:	79 05                	jns    8041a7 <pipe+0xe3>
  8041a2:	e9 d9 00 00 00       	jmpq   804280 <pipe+0x1bc>
  8041a7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8041ab:	48 89 c7             	mov    %rax,%rdi
  8041ae:	48 b8 27 28 80 00 00 	movabs $0x802827,%rax
  8041b5:	00 00 00 
  8041b8:	ff d0                	callq  *%rax
  8041ba:	48 89 c2             	mov    %rax,%rdx
  8041bd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8041c1:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  8041c7:	48 89 d1             	mov    %rdx,%rcx
  8041ca:	ba 00 00 00 00       	mov    $0x0,%edx
  8041cf:	48 89 c6             	mov    %rax,%rsi
  8041d2:	bf 00 00 00 00       	mov    $0x0,%edi
  8041d7:	48 b8 98 1b 80 00 00 	movabs $0x801b98,%rax
  8041de:	00 00 00 
  8041e1:	ff d0                	callq  *%rax
  8041e3:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8041e6:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8041ea:	79 1b                	jns    804207 <pipe+0x143>
  8041ec:	90                   	nop
  8041ed:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8041f1:	48 89 c6             	mov    %rax,%rsi
  8041f4:	bf 00 00 00 00       	mov    $0x0,%edi
  8041f9:	48 b8 f3 1b 80 00 00 	movabs $0x801bf3,%rax
  804200:	00 00 00 
  804203:	ff d0                	callq  *%rax
  804205:	eb 79                	jmp    804280 <pipe+0x1bc>
  804207:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80420b:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  804212:	00 00 00 
  804215:	8b 12                	mov    (%rdx),%edx
  804217:	89 10                	mov    %edx,(%rax)
  804219:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80421d:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  804224:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804228:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  80422f:	00 00 00 
  804232:	8b 12                	mov    (%rdx),%edx
  804234:	89 10                	mov    %edx,(%rax)
  804236:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80423a:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  804241:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804245:	48 89 c7             	mov    %rax,%rdi
  804248:	48 b8 04 28 80 00 00 	movabs $0x802804,%rax
  80424f:	00 00 00 
  804252:	ff d0                	callq  *%rax
  804254:	89 c2                	mov    %eax,%edx
  804256:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80425a:	89 10                	mov    %edx,(%rax)
  80425c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  804260:	48 8d 58 04          	lea    0x4(%rax),%rbx
  804264:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804268:	48 89 c7             	mov    %rax,%rdi
  80426b:	48 b8 04 28 80 00 00 	movabs $0x802804,%rax
  804272:	00 00 00 
  804275:	ff d0                	callq  *%rax
  804277:	89 03                	mov    %eax,(%rbx)
  804279:	b8 00 00 00 00       	mov    $0x0,%eax
  80427e:	eb 33                	jmp    8042b3 <pipe+0x1ef>
  804280:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804284:	48 89 c6             	mov    %rax,%rsi
  804287:	bf 00 00 00 00       	mov    $0x0,%edi
  80428c:	48 b8 f3 1b 80 00 00 	movabs $0x801bf3,%rax
  804293:	00 00 00 
  804296:	ff d0                	callq  *%rax
  804298:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80429c:	48 89 c6             	mov    %rax,%rsi
  80429f:	bf 00 00 00 00       	mov    $0x0,%edi
  8042a4:	48 b8 f3 1b 80 00 00 	movabs $0x801bf3,%rax
  8042ab:	00 00 00 
  8042ae:	ff d0                	callq  *%rax
  8042b0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8042b3:	48 83 c4 38          	add    $0x38,%rsp
  8042b7:	5b                   	pop    %rbx
  8042b8:	5d                   	pop    %rbp
  8042b9:	c3                   	retq   

00000000008042ba <_pipeisclosed>:
  8042ba:	55                   	push   %rbp
  8042bb:	48 89 e5             	mov    %rsp,%rbp
  8042be:	53                   	push   %rbx
  8042bf:	48 83 ec 28          	sub    $0x28,%rsp
  8042c3:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8042c7:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8042cb:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8042d2:	00 00 00 
  8042d5:	48 8b 00             	mov    (%rax),%rax
  8042d8:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8042de:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8042e1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8042e5:	48 89 c7             	mov    %rax,%rdi
  8042e8:	48 b8 2f 38 80 00 00 	movabs $0x80382f,%rax
  8042ef:	00 00 00 
  8042f2:	ff d0                	callq  *%rax
  8042f4:	89 c3                	mov    %eax,%ebx
  8042f6:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8042fa:	48 89 c7             	mov    %rax,%rdi
  8042fd:	48 b8 2f 38 80 00 00 	movabs $0x80382f,%rax
  804304:	00 00 00 
  804307:	ff d0                	callq  *%rax
  804309:	39 c3                	cmp    %eax,%ebx
  80430b:	0f 94 c0             	sete   %al
  80430e:	0f b6 c0             	movzbl %al,%eax
  804311:	89 45 e8             	mov    %eax,-0x18(%rbp)
  804314:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80431b:	00 00 00 
  80431e:	48 8b 00             	mov    (%rax),%rax
  804321:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  804327:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  80432a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80432d:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  804330:	75 05                	jne    804337 <_pipeisclosed+0x7d>
  804332:	8b 45 e8             	mov    -0x18(%rbp),%eax
  804335:	eb 4f                	jmp    804386 <_pipeisclosed+0xcc>
  804337:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80433a:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  80433d:	74 42                	je     804381 <_pipeisclosed+0xc7>
  80433f:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  804343:	75 3c                	jne    804381 <_pipeisclosed+0xc7>
  804345:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80434c:	00 00 00 
  80434f:	48 8b 00             	mov    (%rax),%rax
  804352:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  804358:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  80435b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80435e:	89 c6                	mov    %eax,%esi
  804360:	48 bf 3b 53 80 00 00 	movabs $0x80533b,%rdi
  804367:	00 00 00 
  80436a:	b8 00 00 00 00       	mov    $0x0,%eax
  80436f:	49 b8 64 06 80 00 00 	movabs $0x800664,%r8
  804376:	00 00 00 
  804379:	41 ff d0             	callq  *%r8
  80437c:	e9 4a ff ff ff       	jmpq   8042cb <_pipeisclosed+0x11>
  804381:	e9 45 ff ff ff       	jmpq   8042cb <_pipeisclosed+0x11>
  804386:	48 83 c4 28          	add    $0x28,%rsp
  80438a:	5b                   	pop    %rbx
  80438b:	5d                   	pop    %rbp
  80438c:	c3                   	retq   

000000000080438d <pipeisclosed>:
  80438d:	55                   	push   %rbp
  80438e:	48 89 e5             	mov    %rsp,%rbp
  804391:	48 83 ec 30          	sub    $0x30,%rsp
  804395:	89 7d dc             	mov    %edi,-0x24(%rbp)
  804398:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80439c:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80439f:	48 89 d6             	mov    %rdx,%rsi
  8043a2:	89 c7                	mov    %eax,%edi
  8043a4:	48 b8 ea 28 80 00 00 	movabs $0x8028ea,%rax
  8043ab:	00 00 00 
  8043ae:	ff d0                	callq  *%rax
  8043b0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8043b3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8043b7:	79 05                	jns    8043be <pipeisclosed+0x31>
  8043b9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8043bc:	eb 31                	jmp    8043ef <pipeisclosed+0x62>
  8043be:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8043c2:	48 89 c7             	mov    %rax,%rdi
  8043c5:	48 b8 27 28 80 00 00 	movabs $0x802827,%rax
  8043cc:	00 00 00 
  8043cf:	ff d0                	callq  *%rax
  8043d1:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8043d5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8043d9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8043dd:	48 89 d6             	mov    %rdx,%rsi
  8043e0:	48 89 c7             	mov    %rax,%rdi
  8043e3:	48 b8 ba 42 80 00 00 	movabs $0x8042ba,%rax
  8043ea:	00 00 00 
  8043ed:	ff d0                	callq  *%rax
  8043ef:	c9                   	leaveq 
  8043f0:	c3                   	retq   

00000000008043f1 <devpipe_read>:
  8043f1:	55                   	push   %rbp
  8043f2:	48 89 e5             	mov    %rsp,%rbp
  8043f5:	48 83 ec 40          	sub    $0x40,%rsp
  8043f9:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8043fd:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804401:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  804405:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804409:	48 89 c7             	mov    %rax,%rdi
  80440c:	48 b8 27 28 80 00 00 	movabs $0x802827,%rax
  804413:	00 00 00 
  804416:	ff d0                	callq  *%rax
  804418:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80441c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804420:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804424:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80442b:	00 
  80442c:	e9 92 00 00 00       	jmpq   8044c3 <devpipe_read+0xd2>
  804431:	eb 41                	jmp    804474 <devpipe_read+0x83>
  804433:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  804438:	74 09                	je     804443 <devpipe_read+0x52>
  80443a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80443e:	e9 92 00 00 00       	jmpq   8044d5 <devpipe_read+0xe4>
  804443:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804447:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80444b:	48 89 d6             	mov    %rdx,%rsi
  80444e:	48 89 c7             	mov    %rax,%rdi
  804451:	48 b8 ba 42 80 00 00 	movabs $0x8042ba,%rax
  804458:	00 00 00 
  80445b:	ff d0                	callq  *%rax
  80445d:	85 c0                	test   %eax,%eax
  80445f:	74 07                	je     804468 <devpipe_read+0x77>
  804461:	b8 00 00 00 00       	mov    $0x0,%eax
  804466:	eb 6d                	jmp    8044d5 <devpipe_read+0xe4>
  804468:	48 b8 0a 1b 80 00 00 	movabs $0x801b0a,%rax
  80446f:	00 00 00 
  804472:	ff d0                	callq  *%rax
  804474:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804478:	8b 10                	mov    (%rax),%edx
  80447a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80447e:	8b 40 04             	mov    0x4(%rax),%eax
  804481:	39 c2                	cmp    %eax,%edx
  804483:	74 ae                	je     804433 <devpipe_read+0x42>
  804485:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804489:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80448d:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  804491:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804495:	8b 00                	mov    (%rax),%eax
  804497:	99                   	cltd   
  804498:	c1 ea 1b             	shr    $0x1b,%edx
  80449b:	01 d0                	add    %edx,%eax
  80449d:	83 e0 1f             	and    $0x1f,%eax
  8044a0:	29 d0                	sub    %edx,%eax
  8044a2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8044a6:	48 98                	cltq   
  8044a8:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  8044ad:	88 01                	mov    %al,(%rcx)
  8044af:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8044b3:	8b 00                	mov    (%rax),%eax
  8044b5:	8d 50 01             	lea    0x1(%rax),%edx
  8044b8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8044bc:	89 10                	mov    %edx,(%rax)
  8044be:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8044c3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8044c7:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8044cb:	0f 82 60 ff ff ff    	jb     804431 <devpipe_read+0x40>
  8044d1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8044d5:	c9                   	leaveq 
  8044d6:	c3                   	retq   

00000000008044d7 <devpipe_write>:
  8044d7:	55                   	push   %rbp
  8044d8:	48 89 e5             	mov    %rsp,%rbp
  8044db:	48 83 ec 40          	sub    $0x40,%rsp
  8044df:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8044e3:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8044e7:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8044eb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8044ef:	48 89 c7             	mov    %rax,%rdi
  8044f2:	48 b8 27 28 80 00 00 	movabs $0x802827,%rax
  8044f9:	00 00 00 
  8044fc:	ff d0                	callq  *%rax
  8044fe:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804502:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804506:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80450a:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804511:	00 
  804512:	e9 8e 00 00 00       	jmpq   8045a5 <devpipe_write+0xce>
  804517:	eb 31                	jmp    80454a <devpipe_write+0x73>
  804519:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80451d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804521:	48 89 d6             	mov    %rdx,%rsi
  804524:	48 89 c7             	mov    %rax,%rdi
  804527:	48 b8 ba 42 80 00 00 	movabs $0x8042ba,%rax
  80452e:	00 00 00 
  804531:	ff d0                	callq  *%rax
  804533:	85 c0                	test   %eax,%eax
  804535:	74 07                	je     80453e <devpipe_write+0x67>
  804537:	b8 00 00 00 00       	mov    $0x0,%eax
  80453c:	eb 79                	jmp    8045b7 <devpipe_write+0xe0>
  80453e:	48 b8 0a 1b 80 00 00 	movabs $0x801b0a,%rax
  804545:	00 00 00 
  804548:	ff d0                	callq  *%rax
  80454a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80454e:	8b 40 04             	mov    0x4(%rax),%eax
  804551:	48 63 d0             	movslq %eax,%rdx
  804554:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804558:	8b 00                	mov    (%rax),%eax
  80455a:	48 98                	cltq   
  80455c:	48 83 c0 20          	add    $0x20,%rax
  804560:	48 39 c2             	cmp    %rax,%rdx
  804563:	73 b4                	jae    804519 <devpipe_write+0x42>
  804565:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804569:	8b 40 04             	mov    0x4(%rax),%eax
  80456c:	99                   	cltd   
  80456d:	c1 ea 1b             	shr    $0x1b,%edx
  804570:	01 d0                	add    %edx,%eax
  804572:	83 e0 1f             	and    $0x1f,%eax
  804575:	29 d0                	sub    %edx,%eax
  804577:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80457b:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80457f:	48 01 ca             	add    %rcx,%rdx
  804582:	0f b6 0a             	movzbl (%rdx),%ecx
  804585:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804589:	48 98                	cltq   
  80458b:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  80458f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804593:	8b 40 04             	mov    0x4(%rax),%eax
  804596:	8d 50 01             	lea    0x1(%rax),%edx
  804599:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80459d:	89 50 04             	mov    %edx,0x4(%rax)
  8045a0:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8045a5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8045a9:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8045ad:	0f 82 64 ff ff ff    	jb     804517 <devpipe_write+0x40>
  8045b3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8045b7:	c9                   	leaveq 
  8045b8:	c3                   	retq   

00000000008045b9 <devpipe_stat>:
  8045b9:	55                   	push   %rbp
  8045ba:	48 89 e5             	mov    %rsp,%rbp
  8045bd:	48 83 ec 20          	sub    $0x20,%rsp
  8045c1:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8045c5:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8045c9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8045cd:	48 89 c7             	mov    %rax,%rdi
  8045d0:	48 b8 27 28 80 00 00 	movabs $0x802827,%rax
  8045d7:	00 00 00 
  8045da:	ff d0                	callq  *%rax
  8045dc:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8045e0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8045e4:	48 be 4e 53 80 00 00 	movabs $0x80534e,%rsi
  8045eb:	00 00 00 
  8045ee:	48 89 c7             	mov    %rax,%rdi
  8045f1:	48 b8 19 12 80 00 00 	movabs $0x801219,%rax
  8045f8:	00 00 00 
  8045fb:	ff d0                	callq  *%rax
  8045fd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804601:	8b 50 04             	mov    0x4(%rax),%edx
  804604:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804608:	8b 00                	mov    (%rax),%eax
  80460a:	29 c2                	sub    %eax,%edx
  80460c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804610:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  804616:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80461a:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  804621:	00 00 00 
  804624:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804628:	48 b9 e0 70 80 00 00 	movabs $0x8070e0,%rcx
  80462f:	00 00 00 
  804632:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  804639:	b8 00 00 00 00       	mov    $0x0,%eax
  80463e:	c9                   	leaveq 
  80463f:	c3                   	retq   

0000000000804640 <devpipe_close>:
  804640:	55                   	push   %rbp
  804641:	48 89 e5             	mov    %rsp,%rbp
  804644:	48 83 ec 10          	sub    $0x10,%rsp
  804648:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80464c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804650:	48 89 c6             	mov    %rax,%rsi
  804653:	bf 00 00 00 00       	mov    $0x0,%edi
  804658:	48 b8 f3 1b 80 00 00 	movabs $0x801bf3,%rax
  80465f:	00 00 00 
  804662:	ff d0                	callq  *%rax
  804664:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804668:	48 89 c7             	mov    %rax,%rdi
  80466b:	48 b8 27 28 80 00 00 	movabs $0x802827,%rax
  804672:	00 00 00 
  804675:	ff d0                	callq  *%rax
  804677:	48 89 c6             	mov    %rax,%rsi
  80467a:	bf 00 00 00 00       	mov    $0x0,%edi
  80467f:	48 b8 f3 1b 80 00 00 	movabs $0x801bf3,%rax
  804686:	00 00 00 
  804689:	ff d0                	callq  *%rax
  80468b:	c9                   	leaveq 
  80468c:	c3                   	retq   

000000000080468d <cputchar>:
  80468d:	55                   	push   %rbp
  80468e:	48 89 e5             	mov    %rsp,%rbp
  804691:	48 83 ec 20          	sub    $0x20,%rsp
  804695:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804698:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80469b:	88 45 ff             	mov    %al,-0x1(%rbp)
  80469e:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  8046a2:	be 01 00 00 00       	mov    $0x1,%esi
  8046a7:	48 89 c7             	mov    %rax,%rdi
  8046aa:	48 b8 00 1a 80 00 00 	movabs $0x801a00,%rax
  8046b1:	00 00 00 
  8046b4:	ff d0                	callq  *%rax
  8046b6:	c9                   	leaveq 
  8046b7:	c3                   	retq   

00000000008046b8 <getchar>:
  8046b8:	55                   	push   %rbp
  8046b9:	48 89 e5             	mov    %rsp,%rbp
  8046bc:	48 83 ec 10          	sub    $0x10,%rsp
  8046c0:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  8046c4:	ba 01 00 00 00       	mov    $0x1,%edx
  8046c9:	48 89 c6             	mov    %rax,%rsi
  8046cc:	bf 00 00 00 00       	mov    $0x0,%edi
  8046d1:	48 b8 1c 2d 80 00 00 	movabs $0x802d1c,%rax
  8046d8:	00 00 00 
  8046db:	ff d0                	callq  *%rax
  8046dd:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8046e0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8046e4:	79 05                	jns    8046eb <getchar+0x33>
  8046e6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8046e9:	eb 14                	jmp    8046ff <getchar+0x47>
  8046eb:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8046ef:	7f 07                	jg     8046f8 <getchar+0x40>
  8046f1:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  8046f6:	eb 07                	jmp    8046ff <getchar+0x47>
  8046f8:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  8046fc:	0f b6 c0             	movzbl %al,%eax
  8046ff:	c9                   	leaveq 
  804700:	c3                   	retq   

0000000000804701 <iscons>:
  804701:	55                   	push   %rbp
  804702:	48 89 e5             	mov    %rsp,%rbp
  804705:	48 83 ec 20          	sub    $0x20,%rsp
  804709:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80470c:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  804710:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804713:	48 89 d6             	mov    %rdx,%rsi
  804716:	89 c7                	mov    %eax,%edi
  804718:	48 b8 ea 28 80 00 00 	movabs $0x8028ea,%rax
  80471f:	00 00 00 
  804722:	ff d0                	callq  *%rax
  804724:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804727:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80472b:	79 05                	jns    804732 <iscons+0x31>
  80472d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804730:	eb 1a                	jmp    80474c <iscons+0x4b>
  804732:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804736:	8b 10                	mov    (%rax),%edx
  804738:	48 b8 20 71 80 00 00 	movabs $0x807120,%rax
  80473f:	00 00 00 
  804742:	8b 00                	mov    (%rax),%eax
  804744:	39 c2                	cmp    %eax,%edx
  804746:	0f 94 c0             	sete   %al
  804749:	0f b6 c0             	movzbl %al,%eax
  80474c:	c9                   	leaveq 
  80474d:	c3                   	retq   

000000000080474e <opencons>:
  80474e:	55                   	push   %rbp
  80474f:	48 89 e5             	mov    %rsp,%rbp
  804752:	48 83 ec 10          	sub    $0x10,%rsp
  804756:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  80475a:	48 89 c7             	mov    %rax,%rdi
  80475d:	48 b8 52 28 80 00 00 	movabs $0x802852,%rax
  804764:	00 00 00 
  804767:	ff d0                	callq  *%rax
  804769:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80476c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804770:	79 05                	jns    804777 <opencons+0x29>
  804772:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804775:	eb 5b                	jmp    8047d2 <opencons+0x84>
  804777:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80477b:	ba 07 04 00 00       	mov    $0x407,%edx
  804780:	48 89 c6             	mov    %rax,%rsi
  804783:	bf 00 00 00 00       	mov    $0x0,%edi
  804788:	48 b8 48 1b 80 00 00 	movabs $0x801b48,%rax
  80478f:	00 00 00 
  804792:	ff d0                	callq  *%rax
  804794:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804797:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80479b:	79 05                	jns    8047a2 <opencons+0x54>
  80479d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8047a0:	eb 30                	jmp    8047d2 <opencons+0x84>
  8047a2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8047a6:	48 ba 20 71 80 00 00 	movabs $0x807120,%rdx
  8047ad:	00 00 00 
  8047b0:	8b 12                	mov    (%rdx),%edx
  8047b2:	89 10                	mov    %edx,(%rax)
  8047b4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8047b8:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8047bf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8047c3:	48 89 c7             	mov    %rax,%rdi
  8047c6:	48 b8 04 28 80 00 00 	movabs $0x802804,%rax
  8047cd:	00 00 00 
  8047d0:	ff d0                	callq  *%rax
  8047d2:	c9                   	leaveq 
  8047d3:	c3                   	retq   

00000000008047d4 <devcons_read>:
  8047d4:	55                   	push   %rbp
  8047d5:	48 89 e5             	mov    %rsp,%rbp
  8047d8:	48 83 ec 30          	sub    $0x30,%rsp
  8047dc:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8047e0:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8047e4:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8047e8:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8047ed:	75 07                	jne    8047f6 <devcons_read+0x22>
  8047ef:	b8 00 00 00 00       	mov    $0x0,%eax
  8047f4:	eb 4b                	jmp    804841 <devcons_read+0x6d>
  8047f6:	eb 0c                	jmp    804804 <devcons_read+0x30>
  8047f8:	48 b8 0a 1b 80 00 00 	movabs $0x801b0a,%rax
  8047ff:	00 00 00 
  804802:	ff d0                	callq  *%rax
  804804:	48 b8 4a 1a 80 00 00 	movabs $0x801a4a,%rax
  80480b:	00 00 00 
  80480e:	ff d0                	callq  *%rax
  804810:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804813:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804817:	74 df                	je     8047f8 <devcons_read+0x24>
  804819:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80481d:	79 05                	jns    804824 <devcons_read+0x50>
  80481f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804822:	eb 1d                	jmp    804841 <devcons_read+0x6d>
  804824:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  804828:	75 07                	jne    804831 <devcons_read+0x5d>
  80482a:	b8 00 00 00 00       	mov    $0x0,%eax
  80482f:	eb 10                	jmp    804841 <devcons_read+0x6d>
  804831:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804834:	89 c2                	mov    %eax,%edx
  804836:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80483a:	88 10                	mov    %dl,(%rax)
  80483c:	b8 01 00 00 00       	mov    $0x1,%eax
  804841:	c9                   	leaveq 
  804842:	c3                   	retq   

0000000000804843 <devcons_write>:
  804843:	55                   	push   %rbp
  804844:	48 89 e5             	mov    %rsp,%rbp
  804847:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  80484e:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  804855:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  80485c:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  804863:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80486a:	eb 76                	jmp    8048e2 <devcons_write+0x9f>
  80486c:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  804873:	89 c2                	mov    %eax,%edx
  804875:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804878:	29 c2                	sub    %eax,%edx
  80487a:	89 d0                	mov    %edx,%eax
  80487c:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80487f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804882:	83 f8 7f             	cmp    $0x7f,%eax
  804885:	76 07                	jbe    80488e <devcons_write+0x4b>
  804887:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  80488e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804891:	48 63 d0             	movslq %eax,%rdx
  804894:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804897:	48 63 c8             	movslq %eax,%rcx
  80489a:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  8048a1:	48 01 c1             	add    %rax,%rcx
  8048a4:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  8048ab:	48 89 ce             	mov    %rcx,%rsi
  8048ae:	48 89 c7             	mov    %rax,%rdi
  8048b1:	48 b8 3d 15 80 00 00 	movabs $0x80153d,%rax
  8048b8:	00 00 00 
  8048bb:	ff d0                	callq  *%rax
  8048bd:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8048c0:	48 63 d0             	movslq %eax,%rdx
  8048c3:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  8048ca:	48 89 d6             	mov    %rdx,%rsi
  8048cd:	48 89 c7             	mov    %rax,%rdi
  8048d0:	48 b8 00 1a 80 00 00 	movabs $0x801a00,%rax
  8048d7:	00 00 00 
  8048da:	ff d0                	callq  *%rax
  8048dc:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8048df:	01 45 fc             	add    %eax,-0x4(%rbp)
  8048e2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8048e5:	48 98                	cltq   
  8048e7:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  8048ee:	0f 82 78 ff ff ff    	jb     80486c <devcons_write+0x29>
  8048f4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8048f7:	c9                   	leaveq 
  8048f8:	c3                   	retq   

00000000008048f9 <devcons_close>:
  8048f9:	55                   	push   %rbp
  8048fa:	48 89 e5             	mov    %rsp,%rbp
  8048fd:	48 83 ec 08          	sub    $0x8,%rsp
  804901:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804905:	b8 00 00 00 00       	mov    $0x0,%eax
  80490a:	c9                   	leaveq 
  80490b:	c3                   	retq   

000000000080490c <devcons_stat>:
  80490c:	55                   	push   %rbp
  80490d:	48 89 e5             	mov    %rsp,%rbp
  804910:	48 83 ec 10          	sub    $0x10,%rsp
  804914:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804918:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80491c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804920:	48 be 5a 53 80 00 00 	movabs $0x80535a,%rsi
  804927:	00 00 00 
  80492a:	48 89 c7             	mov    %rax,%rdi
  80492d:	48 b8 19 12 80 00 00 	movabs $0x801219,%rax
  804934:	00 00 00 
  804937:	ff d0                	callq  *%rax
  804939:	b8 00 00 00 00       	mov    $0x0,%eax
  80493e:	c9                   	leaveq 
  80493f:	c3                   	retq   

0000000000804940 <set_pgfault_handler>:
  804940:	55                   	push   %rbp
  804941:	48 89 e5             	mov    %rsp,%rbp
  804944:	48 83 ec 20          	sub    $0x20,%rsp
  804948:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80494c:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804953:	00 00 00 
  804956:	48 8b 00             	mov    (%rax),%rax
  804959:	48 85 c0             	test   %rax,%rax
  80495c:	75 6f                	jne    8049cd <set_pgfault_handler+0x8d>
  80495e:	ba 07 00 00 00       	mov    $0x7,%edx
  804963:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  804968:	bf 00 00 00 00       	mov    $0x0,%edi
  80496d:	48 b8 48 1b 80 00 00 	movabs $0x801b48,%rax
  804974:	00 00 00 
  804977:	ff d0                	callq  *%rax
  804979:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80497c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804980:	79 30                	jns    8049b2 <set_pgfault_handler+0x72>
  804982:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804985:	89 c1                	mov    %eax,%ecx
  804987:	48 ba 68 53 80 00 00 	movabs $0x805368,%rdx
  80498e:	00 00 00 
  804991:	be 22 00 00 00       	mov    $0x22,%esi
  804996:	48 bf 87 53 80 00 00 	movabs $0x805387,%rdi
  80499d:	00 00 00 
  8049a0:	b8 00 00 00 00       	mov    $0x0,%eax
  8049a5:	49 b8 2b 04 80 00 00 	movabs $0x80042b,%r8
  8049ac:	00 00 00 
  8049af:	41 ff d0             	callq  *%r8
  8049b2:	48 be e0 49 80 00 00 	movabs $0x8049e0,%rsi
  8049b9:	00 00 00 
  8049bc:	bf 00 00 00 00       	mov    $0x0,%edi
  8049c1:	48 b8 d2 1c 80 00 00 	movabs $0x801cd2,%rax
  8049c8:	00 00 00 
  8049cb:	ff d0                	callq  *%rax
  8049cd:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8049d4:	00 00 00 
  8049d7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8049db:	48 89 10             	mov    %rdx,(%rax)
  8049de:	c9                   	leaveq 
  8049df:	c3                   	retq   

00000000008049e0 <_pgfault_upcall>:
.globl _pgfault_upcall
_pgfault_upcall:
// Call the C page fault handler.
// function argument: pointer to UTF

movq  %rsp,%rdi                // passing the function argument in rdi
  8049e0:	48 89 e7             	mov    %rsp,%rdi
movabs _pgfault_handler, %rax
  8049e3:	48 a1 00 c0 80 00 00 	movabs 0x80c000,%rax
  8049ea:	00 00 00 
call *%rax
  8049ed:	ff d0                	callq  *%rax
// registers are available for intermediate calculations.  You
// may find that you have to rearrange your code in non-obvious
// ways as registers become unavailable as scratch space.
//
// LAB 4: Your code here.
subq $8, 152(%rsp)
  8049ef:	48 83 ac 24 98 00 00 	subq   $0x8,0x98(%rsp)
  8049f6:	00 08 
    movq 152(%rsp), %rax
  8049f8:	48 8b 84 24 98 00 00 	mov    0x98(%rsp),%rax
  8049ff:	00 
    movq 136(%rsp), %rbx
  804a00:	48 8b 9c 24 88 00 00 	mov    0x88(%rsp),%rbx
  804a07:	00 
movq %rbx, (%rax)
  804a08:	48 89 18             	mov    %rbx,(%rax)

    // Restore the trap-time registers.  After you do this, you
    // can no longer modify any general-purpose registers.
    // LAB 4: Your code here.
    addq $16, %rsp
  804a0b:	48 83 c4 10          	add    $0x10,%rsp
    POPA_
  804a0f:	4c 8b 3c 24          	mov    (%rsp),%r15
  804a13:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
  804a18:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
  804a1d:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  804a22:	4c 8b 5c 24 20       	mov    0x20(%rsp),%r11
  804a27:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
  804a2c:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
  804a31:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
  804a36:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
  804a3b:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
  804a40:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
  804a45:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
  804a4a:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
  804a4f:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
  804a54:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  804a59:	48 83 c4 78          	add    $0x78,%rsp

    // Restore eflags from the stack.  After you do this, you can
    // no longer use arithmetic operations or anything else that
    // modifies eflags.
    // LAB 4: Your code here.
pushq 8(%rsp)
  804a5d:	ff 74 24 08          	pushq  0x8(%rsp)
    popfq
  804a61:	9d                   	popfq  

    // Switch back to the adjusted trap-time stack.
    // LAB 4: Your code here.
    movq 16(%rsp), %rsp
  804a62:	48 8b 64 24 10       	mov    0x10(%rsp),%rsp

    // Return to re-execute the instruction that faulted.
    // LAB 4: Your code here.
    retq
  804a67:	c3                   	retq   
