
obj/user/lsfd:     file format elf64-x86-64


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
  80003c:	e8 7c 01 00 00       	callq  8001bd <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <usage>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 bf 60 47 80 00 00 	movabs $0x804760,%rdi
  80004e:	00 00 00 
  800051:	b8 00 00 00 00       	mov    $0x0,%eax
  800056:	48 ba 88 03 80 00 00 	movabs $0x800388,%rdx
  80005d:	00 00 00 
  800060:	ff d2                	callq  *%rdx
  800062:	48 b8 40 02 80 00 00 	movabs $0x800240,%rax
  800069:	00 00 00 
  80006c:	ff d0                	callq  *%rax
  80006e:	5d                   	pop    %rbp
  80006f:	c3                   	retq   

0000000000800070 <umain>:
  800070:	55                   	push   %rbp
  800071:	48 89 e5             	mov    %rsp,%rbp
  800074:	48 81 ec e0 00 00 00 	sub    $0xe0,%rsp
  80007b:	89 bd 3c ff ff ff    	mov    %edi,-0xc4(%rbp)
  800081:	48 89 b5 30 ff ff ff 	mov    %rsi,-0xd0(%rbp)
  800088:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
  80008f:	48 8d 95 40 ff ff ff 	lea    -0xc0(%rbp),%rdx
  800096:	48 8b 8d 30 ff ff ff 	mov    -0xd0(%rbp),%rcx
  80009d:	48 8d 85 3c ff ff ff 	lea    -0xc4(%rbp),%rax
  8000a4:	48 89 ce             	mov    %rcx,%rsi
  8000a7:	48 89 c7             	mov    %rax,%rdi
  8000aa:	48 b8 4a 1d 80 00 00 	movabs $0x801d4a,%rax
  8000b1:	00 00 00 
  8000b4:	ff d0                	callq  *%rax
  8000b6:	eb 1b                	jmp    8000d3 <umain+0x63>
  8000b8:	83 7d fc 31          	cmpl   $0x31,-0x4(%rbp)
  8000bc:	75 09                	jne    8000c7 <umain+0x57>
  8000be:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%rbp)
  8000c5:	eb 0c                	jmp    8000d3 <umain+0x63>
  8000c7:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8000ce:	00 00 00 
  8000d1:	ff d0                	callq  *%rax
  8000d3:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  8000da:	48 89 c7             	mov    %rax,%rdi
  8000dd:	48 b8 ae 1d 80 00 00 	movabs $0x801dae,%rax
  8000e4:	00 00 00 
  8000e7:	ff d0                	callq  *%rax
  8000e9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8000ec:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8000f0:	79 c6                	jns    8000b8 <umain+0x48>
  8000f2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8000f9:	e9 b3 00 00 00       	jmpq   8001b1 <umain+0x141>
  8000fe:	48 8d 95 60 ff ff ff 	lea    -0xa0(%rbp),%rdx
  800105:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800108:	48 89 d6             	mov    %rdx,%rsi
  80010b:	89 c7                	mov    %eax,%edi
  80010d:	48 b8 76 28 80 00 00 	movabs $0x802876,%rax
  800114:	00 00 00 
  800117:	ff d0                	callq  *%rax
  800119:	85 c0                	test   %eax,%eax
  80011b:	0f 88 8c 00 00 00    	js     8001ad <umain+0x13d>
  800121:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  800125:	74 4a                	je     800171 <umain+0x101>
  800127:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80012b:	48 8b 48 08          	mov    0x8(%rax),%rcx
  80012f:	8b 7d e0             	mov    -0x20(%rbp),%edi
  800132:	8b 75 e4             	mov    -0x1c(%rbp),%esi
  800135:	48 8d 95 60 ff ff ff 	lea    -0xa0(%rbp),%rdx
  80013c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80013f:	48 89 0c 24          	mov    %rcx,(%rsp)
  800143:	41 89 f9             	mov    %edi,%r9d
  800146:	41 89 f0             	mov    %esi,%r8d
  800149:	48 89 d1             	mov    %rdx,%rcx
  80014c:	89 c2                	mov    %eax,%edx
  80014e:	48 be 78 47 80 00 00 	movabs $0x804778,%rsi
  800155:	00 00 00 
  800158:	bf 01 00 00 00       	mov    $0x1,%edi
  80015d:	b8 00 00 00 00       	mov    $0x0,%eax
  800162:	49 ba f0 31 80 00 00 	movabs $0x8031f0,%r10
  800169:	00 00 00 
  80016c:	41 ff d2             	callq  *%r10
  80016f:	eb 3c                	jmp    8001ad <umain+0x13d>
  800171:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800175:	48 8b 78 08          	mov    0x8(%rax),%rdi
  800179:	8b 75 e0             	mov    -0x20(%rbp),%esi
  80017c:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  80017f:	48 8d 95 60 ff ff ff 	lea    -0xa0(%rbp),%rdx
  800186:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800189:	49 89 f9             	mov    %rdi,%r9
  80018c:	41 89 f0             	mov    %esi,%r8d
  80018f:	89 c6                	mov    %eax,%esi
  800191:	48 bf 78 47 80 00 00 	movabs $0x804778,%rdi
  800198:	00 00 00 
  80019b:	b8 00 00 00 00       	mov    $0x0,%eax
  8001a0:	49 ba 88 03 80 00 00 	movabs $0x800388,%r10
  8001a7:	00 00 00 
  8001aa:	41 ff d2             	callq  *%r10
  8001ad:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8001b1:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  8001b5:	0f 8e 43 ff ff ff    	jle    8000fe <umain+0x8e>
  8001bb:	c9                   	leaveq 
  8001bc:	c3                   	retq   

00000000008001bd <libmain>:
  8001bd:	55                   	push   %rbp
  8001be:	48 89 e5             	mov    %rsp,%rbp
  8001c1:	48 83 ec 10          	sub    $0x10,%rsp
  8001c5:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8001c8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8001cc:	48 b8 f0 17 80 00 00 	movabs $0x8017f0,%rax
  8001d3:	00 00 00 
  8001d6:	ff d0                	callq  *%rax
  8001d8:	25 ff 03 00 00       	and    $0x3ff,%eax
  8001dd:	48 98                	cltq   
  8001df:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8001e6:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8001ed:	00 00 00 
  8001f0:	48 01 c2             	add    %rax,%rdx
  8001f3:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8001fa:	00 00 00 
  8001fd:	48 89 10             	mov    %rdx,(%rax)
  800200:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800204:	7e 14                	jle    80021a <libmain+0x5d>
  800206:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80020a:	48 8b 10             	mov    (%rax),%rdx
  80020d:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  800214:	00 00 00 
  800217:	48 89 10             	mov    %rdx,(%rax)
  80021a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80021e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800221:	48 89 d6             	mov    %rdx,%rsi
  800224:	89 c7                	mov    %eax,%edi
  800226:	48 b8 70 00 80 00 00 	movabs $0x800070,%rax
  80022d:	00 00 00 
  800230:	ff d0                	callq  *%rax
  800232:	48 b8 40 02 80 00 00 	movabs $0x800240,%rax
  800239:	00 00 00 
  80023c:	ff d0                	callq  *%rax
  80023e:	c9                   	leaveq 
  80023f:	c3                   	retq   

0000000000800240 <exit>:
  800240:	55                   	push   %rbp
  800241:	48 89 e5             	mov    %rsp,%rbp
  800244:	48 b8 70 23 80 00 00 	movabs $0x802370,%rax
  80024b:	00 00 00 
  80024e:	ff d0                	callq  *%rax
  800250:	bf 00 00 00 00       	mov    $0x0,%edi
  800255:	48 b8 ac 17 80 00 00 	movabs $0x8017ac,%rax
  80025c:	00 00 00 
  80025f:	ff d0                	callq  *%rax
  800261:	5d                   	pop    %rbp
  800262:	c3                   	retq   

0000000000800263 <putch>:
  800263:	55                   	push   %rbp
  800264:	48 89 e5             	mov    %rsp,%rbp
  800267:	48 83 ec 10          	sub    $0x10,%rsp
  80026b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80026e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800272:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800276:	8b 00                	mov    (%rax),%eax
  800278:	8d 48 01             	lea    0x1(%rax),%ecx
  80027b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80027f:	89 0a                	mov    %ecx,(%rdx)
  800281:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800284:	89 d1                	mov    %edx,%ecx
  800286:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80028a:	48 98                	cltq   
  80028c:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  800290:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800294:	8b 00                	mov    (%rax),%eax
  800296:	3d ff 00 00 00       	cmp    $0xff,%eax
  80029b:	75 2c                	jne    8002c9 <putch+0x66>
  80029d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8002a1:	8b 00                	mov    (%rax),%eax
  8002a3:	48 98                	cltq   
  8002a5:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8002a9:	48 83 c2 08          	add    $0x8,%rdx
  8002ad:	48 89 c6             	mov    %rax,%rsi
  8002b0:	48 89 d7             	mov    %rdx,%rdi
  8002b3:	48 b8 24 17 80 00 00 	movabs $0x801724,%rax
  8002ba:	00 00 00 
  8002bd:	ff d0                	callq  *%rax
  8002bf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8002c3:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8002c9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8002cd:	8b 40 04             	mov    0x4(%rax),%eax
  8002d0:	8d 50 01             	lea    0x1(%rax),%edx
  8002d3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8002d7:	89 50 04             	mov    %edx,0x4(%rax)
  8002da:	c9                   	leaveq 
  8002db:	c3                   	retq   

00000000008002dc <vcprintf>:
  8002dc:	55                   	push   %rbp
  8002dd:	48 89 e5             	mov    %rsp,%rbp
  8002e0:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  8002e7:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  8002ee:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  8002f5:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  8002fc:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  800303:	48 8b 0a             	mov    (%rdx),%rcx
  800306:	48 89 08             	mov    %rcx,(%rax)
  800309:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80030d:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800311:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800315:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800319:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  800320:	00 00 00 
  800323:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  80032a:	00 00 00 
  80032d:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  800334:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  80033b:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800342:	48 89 c6             	mov    %rax,%rsi
  800345:	48 bf 63 02 80 00 00 	movabs $0x800263,%rdi
  80034c:	00 00 00 
  80034f:	48 b8 3b 07 80 00 00 	movabs $0x80073b,%rax
  800356:	00 00 00 
  800359:	ff d0                	callq  *%rax
  80035b:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  800361:	48 98                	cltq   
  800363:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  80036a:	48 83 c2 08          	add    $0x8,%rdx
  80036e:	48 89 c6             	mov    %rax,%rsi
  800371:	48 89 d7             	mov    %rdx,%rdi
  800374:	48 b8 24 17 80 00 00 	movabs $0x801724,%rax
  80037b:	00 00 00 
  80037e:	ff d0                	callq  *%rax
  800380:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  800386:	c9                   	leaveq 
  800387:	c3                   	retq   

0000000000800388 <cprintf>:
  800388:	55                   	push   %rbp
  800389:	48 89 e5             	mov    %rsp,%rbp
  80038c:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  800393:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  80039a:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  8003a1:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8003a8:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8003af:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8003b6:	84 c0                	test   %al,%al
  8003b8:	74 20                	je     8003da <cprintf+0x52>
  8003ba:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8003be:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8003c2:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8003c6:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8003ca:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8003ce:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8003d2:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8003d6:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8003da:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  8003e1:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  8003e8:	00 00 00 
  8003eb:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8003f2:	00 00 00 
  8003f5:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8003f9:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800400:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800407:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  80040e:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800415:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  80041c:	48 8b 0a             	mov    (%rdx),%rcx
  80041f:	48 89 08             	mov    %rcx,(%rax)
  800422:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800426:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80042a:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  80042e:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800432:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  800439:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800440:	48 89 d6             	mov    %rdx,%rsi
  800443:	48 89 c7             	mov    %rax,%rdi
  800446:	48 b8 dc 02 80 00 00 	movabs $0x8002dc,%rax
  80044d:	00 00 00 
  800450:	ff d0                	callq  *%rax
  800452:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  800458:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  80045e:	c9                   	leaveq 
  80045f:	c3                   	retq   

0000000000800460 <printnum>:
  800460:	55                   	push   %rbp
  800461:	48 89 e5             	mov    %rsp,%rbp
  800464:	53                   	push   %rbx
  800465:	48 83 ec 38          	sub    $0x38,%rsp
  800469:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80046d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800471:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  800475:	89 4d d4             	mov    %ecx,-0x2c(%rbp)
  800478:	44 89 45 d0          	mov    %r8d,-0x30(%rbp)
  80047c:	44 89 4d cc          	mov    %r9d,-0x34(%rbp)
  800480:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  800483:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  800487:	77 3b                	ja     8004c4 <printnum+0x64>
  800489:	8b 45 d0             	mov    -0x30(%rbp),%eax
  80048c:	44 8d 40 ff          	lea    -0x1(%rax),%r8d
  800490:	8b 5d d4             	mov    -0x2c(%rbp),%ebx
  800493:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800497:	ba 00 00 00 00       	mov    $0x0,%edx
  80049c:	48 f7 f3             	div    %rbx
  80049f:	48 89 c2             	mov    %rax,%rdx
  8004a2:	8b 7d cc             	mov    -0x34(%rbp),%edi
  8004a5:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  8004a8:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
  8004ac:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8004b0:	41 89 f9             	mov    %edi,%r9d
  8004b3:	48 89 c7             	mov    %rax,%rdi
  8004b6:	48 b8 60 04 80 00 00 	movabs $0x800460,%rax
  8004bd:	00 00 00 
  8004c0:	ff d0                	callq  *%rax
  8004c2:	eb 1e                	jmp    8004e2 <printnum+0x82>
  8004c4:	eb 12                	jmp    8004d8 <printnum+0x78>
  8004c6:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8004ca:	8b 55 cc             	mov    -0x34(%rbp),%edx
  8004cd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8004d1:	48 89 ce             	mov    %rcx,%rsi
  8004d4:	89 d7                	mov    %edx,%edi
  8004d6:	ff d0                	callq  *%rax
  8004d8:	83 6d d0 01          	subl   $0x1,-0x30(%rbp)
  8004dc:	83 7d d0 00          	cmpl   $0x0,-0x30(%rbp)
  8004e0:	7f e4                	jg     8004c6 <printnum+0x66>
  8004e2:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  8004e5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8004e9:	ba 00 00 00 00       	mov    $0x0,%edx
  8004ee:	48 f7 f1             	div    %rcx
  8004f1:	48 89 d0             	mov    %rdx,%rax
  8004f4:	48 ba b0 49 80 00 00 	movabs $0x8049b0,%rdx
  8004fb:	00 00 00 
  8004fe:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
  800502:	0f be d0             	movsbl %al,%edx
  800505:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  800509:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80050d:	48 89 ce             	mov    %rcx,%rsi
  800510:	89 d7                	mov    %edx,%edi
  800512:	ff d0                	callq  *%rax
  800514:	48 83 c4 38          	add    $0x38,%rsp
  800518:	5b                   	pop    %rbx
  800519:	5d                   	pop    %rbp
  80051a:	c3                   	retq   

000000000080051b <getuint>:
  80051b:	55                   	push   %rbp
  80051c:	48 89 e5             	mov    %rsp,%rbp
  80051f:	48 83 ec 1c          	sub    $0x1c,%rsp
  800523:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800527:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80052a:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  80052e:	7e 52                	jle    800582 <getuint+0x67>
  800530:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800534:	8b 00                	mov    (%rax),%eax
  800536:	83 f8 30             	cmp    $0x30,%eax
  800539:	73 24                	jae    80055f <getuint+0x44>
  80053b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80053f:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800543:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800547:	8b 00                	mov    (%rax),%eax
  800549:	89 c0                	mov    %eax,%eax
  80054b:	48 01 d0             	add    %rdx,%rax
  80054e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800552:	8b 12                	mov    (%rdx),%edx
  800554:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800557:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80055b:	89 0a                	mov    %ecx,(%rdx)
  80055d:	eb 17                	jmp    800576 <getuint+0x5b>
  80055f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800563:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800567:	48 89 d0             	mov    %rdx,%rax
  80056a:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  80056e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800572:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800576:	48 8b 00             	mov    (%rax),%rax
  800579:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80057d:	e9 a3 00 00 00       	jmpq   800625 <getuint+0x10a>
  800582:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800586:	74 4f                	je     8005d7 <getuint+0xbc>
  800588:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80058c:	8b 00                	mov    (%rax),%eax
  80058e:	83 f8 30             	cmp    $0x30,%eax
  800591:	73 24                	jae    8005b7 <getuint+0x9c>
  800593:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800597:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80059b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80059f:	8b 00                	mov    (%rax),%eax
  8005a1:	89 c0                	mov    %eax,%eax
  8005a3:	48 01 d0             	add    %rdx,%rax
  8005a6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8005aa:	8b 12                	mov    (%rdx),%edx
  8005ac:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8005af:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8005b3:	89 0a                	mov    %ecx,(%rdx)
  8005b5:	eb 17                	jmp    8005ce <getuint+0xb3>
  8005b7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005bb:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8005bf:	48 89 d0             	mov    %rdx,%rax
  8005c2:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8005c6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8005ca:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8005ce:	48 8b 00             	mov    (%rax),%rax
  8005d1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8005d5:	eb 4e                	jmp    800625 <getuint+0x10a>
  8005d7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005db:	8b 00                	mov    (%rax),%eax
  8005dd:	83 f8 30             	cmp    $0x30,%eax
  8005e0:	73 24                	jae    800606 <getuint+0xeb>
  8005e2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005e6:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8005ea:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005ee:	8b 00                	mov    (%rax),%eax
  8005f0:	89 c0                	mov    %eax,%eax
  8005f2:	48 01 d0             	add    %rdx,%rax
  8005f5:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8005f9:	8b 12                	mov    (%rdx),%edx
  8005fb:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8005fe:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800602:	89 0a                	mov    %ecx,(%rdx)
  800604:	eb 17                	jmp    80061d <getuint+0x102>
  800606:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80060a:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80060e:	48 89 d0             	mov    %rdx,%rax
  800611:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800615:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800619:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80061d:	8b 00                	mov    (%rax),%eax
  80061f:	89 c0                	mov    %eax,%eax
  800621:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800625:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800629:	c9                   	leaveq 
  80062a:	c3                   	retq   

000000000080062b <getint>:
  80062b:	55                   	push   %rbp
  80062c:	48 89 e5             	mov    %rsp,%rbp
  80062f:	48 83 ec 1c          	sub    $0x1c,%rsp
  800633:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800637:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80063a:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  80063e:	7e 52                	jle    800692 <getint+0x67>
  800640:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800644:	8b 00                	mov    (%rax),%eax
  800646:	83 f8 30             	cmp    $0x30,%eax
  800649:	73 24                	jae    80066f <getint+0x44>
  80064b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80064f:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800653:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800657:	8b 00                	mov    (%rax),%eax
  800659:	89 c0                	mov    %eax,%eax
  80065b:	48 01 d0             	add    %rdx,%rax
  80065e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800662:	8b 12                	mov    (%rdx),%edx
  800664:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800667:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80066b:	89 0a                	mov    %ecx,(%rdx)
  80066d:	eb 17                	jmp    800686 <getint+0x5b>
  80066f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800673:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800677:	48 89 d0             	mov    %rdx,%rax
  80067a:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  80067e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800682:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800686:	48 8b 00             	mov    (%rax),%rax
  800689:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80068d:	e9 a3 00 00 00       	jmpq   800735 <getint+0x10a>
  800692:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800696:	74 4f                	je     8006e7 <getint+0xbc>
  800698:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80069c:	8b 00                	mov    (%rax),%eax
  80069e:	83 f8 30             	cmp    $0x30,%eax
  8006a1:	73 24                	jae    8006c7 <getint+0x9c>
  8006a3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006a7:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8006ab:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006af:	8b 00                	mov    (%rax),%eax
  8006b1:	89 c0                	mov    %eax,%eax
  8006b3:	48 01 d0             	add    %rdx,%rax
  8006b6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006ba:	8b 12                	mov    (%rdx),%edx
  8006bc:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8006bf:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006c3:	89 0a                	mov    %ecx,(%rdx)
  8006c5:	eb 17                	jmp    8006de <getint+0xb3>
  8006c7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006cb:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8006cf:	48 89 d0             	mov    %rdx,%rax
  8006d2:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8006d6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006da:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8006de:	48 8b 00             	mov    (%rax),%rax
  8006e1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8006e5:	eb 4e                	jmp    800735 <getint+0x10a>
  8006e7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006eb:	8b 00                	mov    (%rax),%eax
  8006ed:	83 f8 30             	cmp    $0x30,%eax
  8006f0:	73 24                	jae    800716 <getint+0xeb>
  8006f2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006f6:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8006fa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006fe:	8b 00                	mov    (%rax),%eax
  800700:	89 c0                	mov    %eax,%eax
  800702:	48 01 d0             	add    %rdx,%rax
  800705:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800709:	8b 12                	mov    (%rdx),%edx
  80070b:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80070e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800712:	89 0a                	mov    %ecx,(%rdx)
  800714:	eb 17                	jmp    80072d <getint+0x102>
  800716:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80071a:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80071e:	48 89 d0             	mov    %rdx,%rax
  800721:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800725:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800729:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80072d:	8b 00                	mov    (%rax),%eax
  80072f:	48 98                	cltq   
  800731:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800735:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800739:	c9                   	leaveq 
  80073a:	c3                   	retq   

000000000080073b <vprintfmt>:
  80073b:	55                   	push   %rbp
  80073c:	48 89 e5             	mov    %rsp,%rbp
  80073f:	41 54                	push   %r12
  800741:	53                   	push   %rbx
  800742:	48 83 ec 60          	sub    $0x60,%rsp
  800746:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  80074a:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  80074e:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800752:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  800756:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  80075a:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  80075e:	48 8b 0a             	mov    (%rdx),%rcx
  800761:	48 89 08             	mov    %rcx,(%rax)
  800764:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800768:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80076c:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800770:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800774:	eb 17                	jmp    80078d <vprintfmt+0x52>
  800776:	85 db                	test   %ebx,%ebx
  800778:	0f 84 cc 04 00 00    	je     800c4a <vprintfmt+0x50f>
  80077e:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800782:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800786:	48 89 d6             	mov    %rdx,%rsi
  800789:	89 df                	mov    %ebx,%edi
  80078b:	ff d0                	callq  *%rax
  80078d:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800791:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800795:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800799:	0f b6 00             	movzbl (%rax),%eax
  80079c:	0f b6 d8             	movzbl %al,%ebx
  80079f:	83 fb 25             	cmp    $0x25,%ebx
  8007a2:	75 d2                	jne    800776 <vprintfmt+0x3b>
  8007a4:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  8007a8:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  8007af:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  8007b6:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  8007bd:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  8007c4:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8007c8:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8007cc:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8007d0:	0f b6 00             	movzbl (%rax),%eax
  8007d3:	0f b6 d8             	movzbl %al,%ebx
  8007d6:	8d 43 dd             	lea    -0x23(%rbx),%eax
  8007d9:	83 f8 55             	cmp    $0x55,%eax
  8007dc:	0f 87 34 04 00 00    	ja     800c16 <vprintfmt+0x4db>
  8007e2:	89 c0                	mov    %eax,%eax
  8007e4:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8007eb:	00 
  8007ec:	48 b8 d8 49 80 00 00 	movabs $0x8049d8,%rax
  8007f3:	00 00 00 
  8007f6:	48 01 d0             	add    %rdx,%rax
  8007f9:	48 8b 00             	mov    (%rax),%rax
  8007fc:	ff e0                	jmpq   *%rax
  8007fe:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  800802:	eb c0                	jmp    8007c4 <vprintfmt+0x89>
  800804:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  800808:	eb ba                	jmp    8007c4 <vprintfmt+0x89>
  80080a:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  800811:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800814:	89 d0                	mov    %edx,%eax
  800816:	c1 e0 02             	shl    $0x2,%eax
  800819:	01 d0                	add    %edx,%eax
  80081b:	01 c0                	add    %eax,%eax
  80081d:	01 d8                	add    %ebx,%eax
  80081f:	83 e8 30             	sub    $0x30,%eax
  800822:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800825:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800829:	0f b6 00             	movzbl (%rax),%eax
  80082c:	0f be d8             	movsbl %al,%ebx
  80082f:	83 fb 2f             	cmp    $0x2f,%ebx
  800832:	7e 0c                	jle    800840 <vprintfmt+0x105>
  800834:	83 fb 39             	cmp    $0x39,%ebx
  800837:	7f 07                	jg     800840 <vprintfmt+0x105>
  800839:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  80083e:	eb d1                	jmp    800811 <vprintfmt+0xd6>
  800840:	eb 58                	jmp    80089a <vprintfmt+0x15f>
  800842:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800845:	83 f8 30             	cmp    $0x30,%eax
  800848:	73 17                	jae    800861 <vprintfmt+0x126>
  80084a:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80084e:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800851:	89 c0                	mov    %eax,%eax
  800853:	48 01 d0             	add    %rdx,%rax
  800856:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800859:	83 c2 08             	add    $0x8,%edx
  80085c:	89 55 b8             	mov    %edx,-0x48(%rbp)
  80085f:	eb 0f                	jmp    800870 <vprintfmt+0x135>
  800861:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800865:	48 89 d0             	mov    %rdx,%rax
  800868:	48 83 c2 08          	add    $0x8,%rdx
  80086c:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800870:	8b 00                	mov    (%rax),%eax
  800872:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800875:	eb 23                	jmp    80089a <vprintfmt+0x15f>
  800877:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  80087b:	79 0c                	jns    800889 <vprintfmt+0x14e>
  80087d:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  800884:	e9 3b ff ff ff       	jmpq   8007c4 <vprintfmt+0x89>
  800889:	e9 36 ff ff ff       	jmpq   8007c4 <vprintfmt+0x89>
  80088e:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  800895:	e9 2a ff ff ff       	jmpq   8007c4 <vprintfmt+0x89>
  80089a:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  80089e:	79 12                	jns    8008b2 <vprintfmt+0x177>
  8008a0:	8b 45 d8             	mov    -0x28(%rbp),%eax
  8008a3:	89 45 dc             	mov    %eax,-0x24(%rbp)
  8008a6:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  8008ad:	e9 12 ff ff ff       	jmpq   8007c4 <vprintfmt+0x89>
  8008b2:	e9 0d ff ff ff       	jmpq   8007c4 <vprintfmt+0x89>
  8008b7:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  8008bb:	e9 04 ff ff ff       	jmpq   8007c4 <vprintfmt+0x89>
  8008c0:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8008c3:	83 f8 30             	cmp    $0x30,%eax
  8008c6:	73 17                	jae    8008df <vprintfmt+0x1a4>
  8008c8:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8008cc:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8008cf:	89 c0                	mov    %eax,%eax
  8008d1:	48 01 d0             	add    %rdx,%rax
  8008d4:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8008d7:	83 c2 08             	add    $0x8,%edx
  8008da:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8008dd:	eb 0f                	jmp    8008ee <vprintfmt+0x1b3>
  8008df:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  8008e3:	48 89 d0             	mov    %rdx,%rax
  8008e6:	48 83 c2 08          	add    $0x8,%rdx
  8008ea:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8008ee:	8b 10                	mov    (%rax),%edx
  8008f0:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  8008f4:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8008f8:	48 89 ce             	mov    %rcx,%rsi
  8008fb:	89 d7                	mov    %edx,%edi
  8008fd:	ff d0                	callq  *%rax
  8008ff:	e9 40 03 00 00       	jmpq   800c44 <vprintfmt+0x509>
  800904:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800907:	83 f8 30             	cmp    $0x30,%eax
  80090a:	73 17                	jae    800923 <vprintfmt+0x1e8>
  80090c:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800910:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800913:	89 c0                	mov    %eax,%eax
  800915:	48 01 d0             	add    %rdx,%rax
  800918:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80091b:	83 c2 08             	add    $0x8,%edx
  80091e:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800921:	eb 0f                	jmp    800932 <vprintfmt+0x1f7>
  800923:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800927:	48 89 d0             	mov    %rdx,%rax
  80092a:	48 83 c2 08          	add    $0x8,%rdx
  80092e:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800932:	8b 18                	mov    (%rax),%ebx
  800934:	85 db                	test   %ebx,%ebx
  800936:	79 02                	jns    80093a <vprintfmt+0x1ff>
  800938:	f7 db                	neg    %ebx
  80093a:	83 fb 15             	cmp    $0x15,%ebx
  80093d:	7f 16                	jg     800955 <vprintfmt+0x21a>
  80093f:	48 b8 00 49 80 00 00 	movabs $0x804900,%rax
  800946:	00 00 00 
  800949:	48 63 d3             	movslq %ebx,%rdx
  80094c:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800950:	4d 85 e4             	test   %r12,%r12
  800953:	75 2e                	jne    800983 <vprintfmt+0x248>
  800955:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800959:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80095d:	89 d9                	mov    %ebx,%ecx
  80095f:	48 ba c1 49 80 00 00 	movabs $0x8049c1,%rdx
  800966:	00 00 00 
  800969:	48 89 c7             	mov    %rax,%rdi
  80096c:	b8 00 00 00 00       	mov    $0x0,%eax
  800971:	49 b8 53 0c 80 00 00 	movabs $0x800c53,%r8
  800978:	00 00 00 
  80097b:	41 ff d0             	callq  *%r8
  80097e:	e9 c1 02 00 00       	jmpq   800c44 <vprintfmt+0x509>
  800983:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800987:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80098b:	4c 89 e1             	mov    %r12,%rcx
  80098e:	48 ba ca 49 80 00 00 	movabs $0x8049ca,%rdx
  800995:	00 00 00 
  800998:	48 89 c7             	mov    %rax,%rdi
  80099b:	b8 00 00 00 00       	mov    $0x0,%eax
  8009a0:	49 b8 53 0c 80 00 00 	movabs $0x800c53,%r8
  8009a7:	00 00 00 
  8009aa:	41 ff d0             	callq  *%r8
  8009ad:	e9 92 02 00 00       	jmpq   800c44 <vprintfmt+0x509>
  8009b2:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8009b5:	83 f8 30             	cmp    $0x30,%eax
  8009b8:	73 17                	jae    8009d1 <vprintfmt+0x296>
  8009ba:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8009be:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8009c1:	89 c0                	mov    %eax,%eax
  8009c3:	48 01 d0             	add    %rdx,%rax
  8009c6:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8009c9:	83 c2 08             	add    $0x8,%edx
  8009cc:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8009cf:	eb 0f                	jmp    8009e0 <vprintfmt+0x2a5>
  8009d1:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  8009d5:	48 89 d0             	mov    %rdx,%rax
  8009d8:	48 83 c2 08          	add    $0x8,%rdx
  8009dc:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8009e0:	4c 8b 20             	mov    (%rax),%r12
  8009e3:	4d 85 e4             	test   %r12,%r12
  8009e6:	75 0a                	jne    8009f2 <vprintfmt+0x2b7>
  8009e8:	49 bc cd 49 80 00 00 	movabs $0x8049cd,%r12
  8009ef:	00 00 00 
  8009f2:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8009f6:	7e 3f                	jle    800a37 <vprintfmt+0x2fc>
  8009f8:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  8009fc:	74 39                	je     800a37 <vprintfmt+0x2fc>
  8009fe:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800a01:	48 98                	cltq   
  800a03:	48 89 c6             	mov    %rax,%rsi
  800a06:	4c 89 e7             	mov    %r12,%rdi
  800a09:	48 b8 ff 0e 80 00 00 	movabs $0x800eff,%rax
  800a10:	00 00 00 
  800a13:	ff d0                	callq  *%rax
  800a15:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800a18:	eb 17                	jmp    800a31 <vprintfmt+0x2f6>
  800a1a:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800a1e:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800a22:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a26:	48 89 ce             	mov    %rcx,%rsi
  800a29:	89 d7                	mov    %edx,%edi
  800a2b:	ff d0                	callq  *%rax
  800a2d:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800a31:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800a35:	7f e3                	jg     800a1a <vprintfmt+0x2df>
  800a37:	eb 37                	jmp    800a70 <vprintfmt+0x335>
  800a39:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  800a3d:	74 1e                	je     800a5d <vprintfmt+0x322>
  800a3f:	83 fb 1f             	cmp    $0x1f,%ebx
  800a42:	7e 05                	jle    800a49 <vprintfmt+0x30e>
  800a44:	83 fb 7e             	cmp    $0x7e,%ebx
  800a47:	7e 14                	jle    800a5d <vprintfmt+0x322>
  800a49:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800a4d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a51:	48 89 d6             	mov    %rdx,%rsi
  800a54:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800a59:	ff d0                	callq  *%rax
  800a5b:	eb 0f                	jmp    800a6c <vprintfmt+0x331>
  800a5d:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800a61:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a65:	48 89 d6             	mov    %rdx,%rsi
  800a68:	89 df                	mov    %ebx,%edi
  800a6a:	ff d0                	callq  *%rax
  800a6c:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800a70:	4c 89 e0             	mov    %r12,%rax
  800a73:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800a77:	0f b6 00             	movzbl (%rax),%eax
  800a7a:	0f be d8             	movsbl %al,%ebx
  800a7d:	85 db                	test   %ebx,%ebx
  800a7f:	74 10                	je     800a91 <vprintfmt+0x356>
  800a81:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800a85:	78 b2                	js     800a39 <vprintfmt+0x2fe>
  800a87:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800a8b:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800a8f:	79 a8                	jns    800a39 <vprintfmt+0x2fe>
  800a91:	eb 16                	jmp    800aa9 <vprintfmt+0x36e>
  800a93:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800a97:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a9b:	48 89 d6             	mov    %rdx,%rsi
  800a9e:	bf 20 00 00 00       	mov    $0x20,%edi
  800aa3:	ff d0                	callq  *%rax
  800aa5:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800aa9:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800aad:	7f e4                	jg     800a93 <vprintfmt+0x358>
  800aaf:	e9 90 01 00 00       	jmpq   800c44 <vprintfmt+0x509>
  800ab4:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800ab8:	be 03 00 00 00       	mov    $0x3,%esi
  800abd:	48 89 c7             	mov    %rax,%rdi
  800ac0:	48 b8 2b 06 80 00 00 	movabs $0x80062b,%rax
  800ac7:	00 00 00 
  800aca:	ff d0                	callq  *%rax
  800acc:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800ad0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ad4:	48 85 c0             	test   %rax,%rax
  800ad7:	79 1d                	jns    800af6 <vprintfmt+0x3bb>
  800ad9:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800add:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ae1:	48 89 d6             	mov    %rdx,%rsi
  800ae4:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800ae9:	ff d0                	callq  *%rax
  800aeb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800aef:	48 f7 d8             	neg    %rax
  800af2:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800af6:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800afd:	e9 d5 00 00 00       	jmpq   800bd7 <vprintfmt+0x49c>
  800b02:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800b06:	be 03 00 00 00       	mov    $0x3,%esi
  800b0b:	48 89 c7             	mov    %rax,%rdi
  800b0e:	48 b8 1b 05 80 00 00 	movabs $0x80051b,%rax
  800b15:	00 00 00 
  800b18:	ff d0                	callq  *%rax
  800b1a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800b1e:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800b25:	e9 ad 00 00 00       	jmpq   800bd7 <vprintfmt+0x49c>
  800b2a:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800b2e:	be 03 00 00 00       	mov    $0x3,%esi
  800b33:	48 89 c7             	mov    %rax,%rdi
  800b36:	48 b8 1b 05 80 00 00 	movabs $0x80051b,%rax
  800b3d:	00 00 00 
  800b40:	ff d0                	callq  *%rax
  800b42:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800b46:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800b4d:	e9 85 00 00 00       	jmpq   800bd7 <vprintfmt+0x49c>
  800b52:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800b56:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b5a:	48 89 d6             	mov    %rdx,%rsi
  800b5d:	bf 30 00 00 00       	mov    $0x30,%edi
  800b62:	ff d0                	callq  *%rax
  800b64:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800b68:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b6c:	48 89 d6             	mov    %rdx,%rsi
  800b6f:	bf 78 00 00 00       	mov    $0x78,%edi
  800b74:	ff d0                	callq  *%rax
  800b76:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b79:	83 f8 30             	cmp    $0x30,%eax
  800b7c:	73 17                	jae    800b95 <vprintfmt+0x45a>
  800b7e:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800b82:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b85:	89 c0                	mov    %eax,%eax
  800b87:	48 01 d0             	add    %rdx,%rax
  800b8a:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b8d:	83 c2 08             	add    $0x8,%edx
  800b90:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800b93:	eb 0f                	jmp    800ba4 <vprintfmt+0x469>
  800b95:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800b99:	48 89 d0             	mov    %rdx,%rax
  800b9c:	48 83 c2 08          	add    $0x8,%rdx
  800ba0:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800ba4:	48 8b 00             	mov    (%rax),%rax
  800ba7:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800bab:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800bb2:	eb 23                	jmp    800bd7 <vprintfmt+0x49c>
  800bb4:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800bb8:	be 03 00 00 00       	mov    $0x3,%esi
  800bbd:	48 89 c7             	mov    %rax,%rdi
  800bc0:	48 b8 1b 05 80 00 00 	movabs $0x80051b,%rax
  800bc7:	00 00 00 
  800bca:	ff d0                	callq  *%rax
  800bcc:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800bd0:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800bd7:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  800bdc:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800bdf:	8b 7d dc             	mov    -0x24(%rbp),%edi
  800be2:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800be6:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800bea:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800bee:	45 89 c1             	mov    %r8d,%r9d
  800bf1:	41 89 f8             	mov    %edi,%r8d
  800bf4:	48 89 c7             	mov    %rax,%rdi
  800bf7:	48 b8 60 04 80 00 00 	movabs $0x800460,%rax
  800bfe:	00 00 00 
  800c01:	ff d0                	callq  *%rax
  800c03:	eb 3f                	jmp    800c44 <vprintfmt+0x509>
  800c05:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c09:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c0d:	48 89 d6             	mov    %rdx,%rsi
  800c10:	89 df                	mov    %ebx,%edi
  800c12:	ff d0                	callq  *%rax
  800c14:	eb 2e                	jmp    800c44 <vprintfmt+0x509>
  800c16:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c1a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c1e:	48 89 d6             	mov    %rdx,%rsi
  800c21:	bf 25 00 00 00       	mov    $0x25,%edi
  800c26:	ff d0                	callq  *%rax
  800c28:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800c2d:	eb 05                	jmp    800c34 <vprintfmt+0x4f9>
  800c2f:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800c34:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800c38:	48 83 e8 01          	sub    $0x1,%rax
  800c3c:	0f b6 00             	movzbl (%rax),%eax
  800c3f:	3c 25                	cmp    $0x25,%al
  800c41:	75 ec                	jne    800c2f <vprintfmt+0x4f4>
  800c43:	90                   	nop
  800c44:	90                   	nop
  800c45:	e9 43 fb ff ff       	jmpq   80078d <vprintfmt+0x52>
  800c4a:	48 83 c4 60          	add    $0x60,%rsp
  800c4e:	5b                   	pop    %rbx
  800c4f:	41 5c                	pop    %r12
  800c51:	5d                   	pop    %rbp
  800c52:	c3                   	retq   

0000000000800c53 <printfmt>:
  800c53:	55                   	push   %rbp
  800c54:	48 89 e5             	mov    %rsp,%rbp
  800c57:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  800c5e:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  800c65:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  800c6c:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800c73:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800c7a:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800c81:	84 c0                	test   %al,%al
  800c83:	74 20                	je     800ca5 <printfmt+0x52>
  800c85:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800c89:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800c8d:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800c91:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800c95:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800c99:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800c9d:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800ca1:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800ca5:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  800cac:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  800cb3:	00 00 00 
  800cb6:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  800cbd:	00 00 00 
  800cc0:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800cc4:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800ccb:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800cd2:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  800cd9:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  800ce0:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800ce7:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  800cee:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  800cf5:	48 89 c7             	mov    %rax,%rdi
  800cf8:	48 b8 3b 07 80 00 00 	movabs $0x80073b,%rax
  800cff:	00 00 00 
  800d02:	ff d0                	callq  *%rax
  800d04:	c9                   	leaveq 
  800d05:	c3                   	retq   

0000000000800d06 <sprintputch>:
  800d06:	55                   	push   %rbp
  800d07:	48 89 e5             	mov    %rsp,%rbp
  800d0a:	48 83 ec 10          	sub    $0x10,%rsp
  800d0e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800d11:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800d15:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800d19:	8b 40 10             	mov    0x10(%rax),%eax
  800d1c:	8d 50 01             	lea    0x1(%rax),%edx
  800d1f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800d23:	89 50 10             	mov    %edx,0x10(%rax)
  800d26:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800d2a:	48 8b 10             	mov    (%rax),%rdx
  800d2d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800d31:	48 8b 40 08          	mov    0x8(%rax),%rax
  800d35:	48 39 c2             	cmp    %rax,%rdx
  800d38:	73 17                	jae    800d51 <sprintputch+0x4b>
  800d3a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800d3e:	48 8b 00             	mov    (%rax),%rax
  800d41:	48 8d 48 01          	lea    0x1(%rax),%rcx
  800d45:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800d49:	48 89 0a             	mov    %rcx,(%rdx)
  800d4c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800d4f:	88 10                	mov    %dl,(%rax)
  800d51:	c9                   	leaveq 
  800d52:	c3                   	retq   

0000000000800d53 <vsnprintf>:
  800d53:	55                   	push   %rbp
  800d54:	48 89 e5             	mov    %rsp,%rbp
  800d57:	48 83 ec 50          	sub    $0x50,%rsp
  800d5b:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  800d5f:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  800d62:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  800d66:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  800d6a:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  800d6e:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  800d72:	48 8b 0a             	mov    (%rdx),%rcx
  800d75:	48 89 08             	mov    %rcx,(%rax)
  800d78:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800d7c:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800d80:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800d84:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800d88:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800d8c:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  800d90:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  800d93:	48 98                	cltq   
  800d95:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  800d99:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800d9d:	48 01 d0             	add    %rdx,%rax
  800da0:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  800da4:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800dab:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  800db0:	74 06                	je     800db8 <vsnprintf+0x65>
  800db2:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  800db6:	7f 07                	jg     800dbf <vsnprintf+0x6c>
  800db8:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800dbd:	eb 2f                	jmp    800dee <vsnprintf+0x9b>
  800dbf:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  800dc3:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  800dc7:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  800dcb:	48 89 c6             	mov    %rax,%rsi
  800dce:	48 bf 06 0d 80 00 00 	movabs $0x800d06,%rdi
  800dd5:	00 00 00 
  800dd8:	48 b8 3b 07 80 00 00 	movabs $0x80073b,%rax
  800ddf:	00 00 00 
  800de2:	ff d0                	callq  *%rax
  800de4:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800de8:	c6 00 00             	movb   $0x0,(%rax)
  800deb:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800dee:	c9                   	leaveq 
  800def:	c3                   	retq   

0000000000800df0 <snprintf>:
  800df0:	55                   	push   %rbp
  800df1:	48 89 e5             	mov    %rsp,%rbp
  800df4:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  800dfb:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800e02:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  800e08:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800e0f:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800e16:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800e1d:	84 c0                	test   %al,%al
  800e1f:	74 20                	je     800e41 <snprintf+0x51>
  800e21:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800e25:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800e29:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800e2d:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800e31:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800e35:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800e39:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800e3d:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800e41:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  800e48:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  800e4f:	00 00 00 
  800e52:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800e59:	00 00 00 
  800e5c:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800e60:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800e67:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800e6e:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800e75:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800e7c:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800e83:	48 8b 0a             	mov    (%rdx),%rcx
  800e86:	48 89 08             	mov    %rcx,(%rax)
  800e89:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800e8d:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800e91:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800e95:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800e99:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  800ea0:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  800ea7:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  800ead:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800eb4:	48 89 c7             	mov    %rax,%rdi
  800eb7:	48 b8 53 0d 80 00 00 	movabs $0x800d53,%rax
  800ebe:	00 00 00 
  800ec1:	ff d0                	callq  *%rax
  800ec3:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  800ec9:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  800ecf:	c9                   	leaveq 
  800ed0:	c3                   	retq   

0000000000800ed1 <strlen>:
  800ed1:	55                   	push   %rbp
  800ed2:	48 89 e5             	mov    %rsp,%rbp
  800ed5:	48 83 ec 18          	sub    $0x18,%rsp
  800ed9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800edd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800ee4:	eb 09                	jmp    800eef <strlen+0x1e>
  800ee6:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800eea:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  800eef:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ef3:	0f b6 00             	movzbl (%rax),%eax
  800ef6:	84 c0                	test   %al,%al
  800ef8:	75 ec                	jne    800ee6 <strlen+0x15>
  800efa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800efd:	c9                   	leaveq 
  800efe:	c3                   	retq   

0000000000800eff <strnlen>:
  800eff:	55                   	push   %rbp
  800f00:	48 89 e5             	mov    %rsp,%rbp
  800f03:	48 83 ec 20          	sub    $0x20,%rsp
  800f07:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800f0b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800f0f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800f16:	eb 0e                	jmp    800f26 <strnlen+0x27>
  800f18:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800f1c:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  800f21:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  800f26:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  800f2b:	74 0b                	je     800f38 <strnlen+0x39>
  800f2d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f31:	0f b6 00             	movzbl (%rax),%eax
  800f34:	84 c0                	test   %al,%al
  800f36:	75 e0                	jne    800f18 <strnlen+0x19>
  800f38:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800f3b:	c9                   	leaveq 
  800f3c:	c3                   	retq   

0000000000800f3d <strcpy>:
  800f3d:	55                   	push   %rbp
  800f3e:	48 89 e5             	mov    %rsp,%rbp
  800f41:	48 83 ec 20          	sub    $0x20,%rsp
  800f45:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800f49:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800f4d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f51:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800f55:	90                   	nop
  800f56:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f5a:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800f5e:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  800f62:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  800f66:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  800f6a:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  800f6e:	0f b6 12             	movzbl (%rdx),%edx
  800f71:	88 10                	mov    %dl,(%rax)
  800f73:	0f b6 00             	movzbl (%rax),%eax
  800f76:	84 c0                	test   %al,%al
  800f78:	75 dc                	jne    800f56 <strcpy+0x19>
  800f7a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800f7e:	c9                   	leaveq 
  800f7f:	c3                   	retq   

0000000000800f80 <strcat>:
  800f80:	55                   	push   %rbp
  800f81:	48 89 e5             	mov    %rsp,%rbp
  800f84:	48 83 ec 20          	sub    $0x20,%rsp
  800f88:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800f8c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800f90:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f94:	48 89 c7             	mov    %rax,%rdi
  800f97:	48 b8 d1 0e 80 00 00 	movabs $0x800ed1,%rax
  800f9e:	00 00 00 
  800fa1:	ff d0                	callq  *%rax
  800fa3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800fa6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800fa9:	48 63 d0             	movslq %eax,%rdx
  800fac:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800fb0:	48 01 c2             	add    %rax,%rdx
  800fb3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800fb7:	48 89 c6             	mov    %rax,%rsi
  800fba:	48 89 d7             	mov    %rdx,%rdi
  800fbd:	48 b8 3d 0f 80 00 00 	movabs $0x800f3d,%rax
  800fc4:	00 00 00 
  800fc7:	ff d0                	callq  *%rax
  800fc9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800fcd:	c9                   	leaveq 
  800fce:	c3                   	retq   

0000000000800fcf <strncpy>:
  800fcf:	55                   	push   %rbp
  800fd0:	48 89 e5             	mov    %rsp,%rbp
  800fd3:	48 83 ec 28          	sub    $0x28,%rsp
  800fd7:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800fdb:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800fdf:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  800fe3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800fe7:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  800feb:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  800ff2:	00 
  800ff3:	eb 2a                	jmp    80101f <strncpy+0x50>
  800ff5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ff9:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800ffd:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801001:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801005:	0f b6 12             	movzbl (%rdx),%edx
  801008:	88 10                	mov    %dl,(%rax)
  80100a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80100e:	0f b6 00             	movzbl (%rax),%eax
  801011:	84 c0                	test   %al,%al
  801013:	74 05                	je     80101a <strncpy+0x4b>
  801015:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  80101a:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80101f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801023:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  801027:	72 cc                	jb     800ff5 <strncpy+0x26>
  801029:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80102d:	c9                   	leaveq 
  80102e:	c3                   	retq   

000000000080102f <strlcpy>:
  80102f:	55                   	push   %rbp
  801030:	48 89 e5             	mov    %rsp,%rbp
  801033:	48 83 ec 28          	sub    $0x28,%rsp
  801037:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80103b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80103f:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801043:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801047:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80104b:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801050:	74 3d                	je     80108f <strlcpy+0x60>
  801052:	eb 1d                	jmp    801071 <strlcpy+0x42>
  801054:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801058:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80105c:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801060:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801064:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801068:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  80106c:	0f b6 12             	movzbl (%rdx),%edx
  80106f:	88 10                	mov    %dl,(%rax)
  801071:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  801076:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80107b:	74 0b                	je     801088 <strlcpy+0x59>
  80107d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801081:	0f b6 00             	movzbl (%rax),%eax
  801084:	84 c0                	test   %al,%al
  801086:	75 cc                	jne    801054 <strlcpy+0x25>
  801088:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80108c:	c6 00 00             	movb   $0x0,(%rax)
  80108f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801093:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801097:	48 29 c2             	sub    %rax,%rdx
  80109a:	48 89 d0             	mov    %rdx,%rax
  80109d:	c9                   	leaveq 
  80109e:	c3                   	retq   

000000000080109f <strcmp>:
  80109f:	55                   	push   %rbp
  8010a0:	48 89 e5             	mov    %rsp,%rbp
  8010a3:	48 83 ec 10          	sub    $0x10,%rsp
  8010a7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8010ab:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8010af:	eb 0a                	jmp    8010bb <strcmp+0x1c>
  8010b1:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8010b6:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8010bb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010bf:	0f b6 00             	movzbl (%rax),%eax
  8010c2:	84 c0                	test   %al,%al
  8010c4:	74 12                	je     8010d8 <strcmp+0x39>
  8010c6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010ca:	0f b6 10             	movzbl (%rax),%edx
  8010cd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8010d1:	0f b6 00             	movzbl (%rax),%eax
  8010d4:	38 c2                	cmp    %al,%dl
  8010d6:	74 d9                	je     8010b1 <strcmp+0x12>
  8010d8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010dc:	0f b6 00             	movzbl (%rax),%eax
  8010df:	0f b6 d0             	movzbl %al,%edx
  8010e2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8010e6:	0f b6 00             	movzbl (%rax),%eax
  8010e9:	0f b6 c0             	movzbl %al,%eax
  8010ec:	29 c2                	sub    %eax,%edx
  8010ee:	89 d0                	mov    %edx,%eax
  8010f0:	c9                   	leaveq 
  8010f1:	c3                   	retq   

00000000008010f2 <strncmp>:
  8010f2:	55                   	push   %rbp
  8010f3:	48 89 e5             	mov    %rsp,%rbp
  8010f6:	48 83 ec 18          	sub    $0x18,%rsp
  8010fa:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8010fe:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801102:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801106:	eb 0f                	jmp    801117 <strncmp+0x25>
  801108:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  80110d:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801112:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801117:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80111c:	74 1d                	je     80113b <strncmp+0x49>
  80111e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801122:	0f b6 00             	movzbl (%rax),%eax
  801125:	84 c0                	test   %al,%al
  801127:	74 12                	je     80113b <strncmp+0x49>
  801129:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80112d:	0f b6 10             	movzbl (%rax),%edx
  801130:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801134:	0f b6 00             	movzbl (%rax),%eax
  801137:	38 c2                	cmp    %al,%dl
  801139:	74 cd                	je     801108 <strncmp+0x16>
  80113b:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801140:	75 07                	jne    801149 <strncmp+0x57>
  801142:	b8 00 00 00 00       	mov    $0x0,%eax
  801147:	eb 18                	jmp    801161 <strncmp+0x6f>
  801149:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80114d:	0f b6 00             	movzbl (%rax),%eax
  801150:	0f b6 d0             	movzbl %al,%edx
  801153:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801157:	0f b6 00             	movzbl (%rax),%eax
  80115a:	0f b6 c0             	movzbl %al,%eax
  80115d:	29 c2                	sub    %eax,%edx
  80115f:	89 d0                	mov    %edx,%eax
  801161:	c9                   	leaveq 
  801162:	c3                   	retq   

0000000000801163 <strchr>:
  801163:	55                   	push   %rbp
  801164:	48 89 e5             	mov    %rsp,%rbp
  801167:	48 83 ec 0c          	sub    $0xc,%rsp
  80116b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80116f:	89 f0                	mov    %esi,%eax
  801171:	88 45 f4             	mov    %al,-0xc(%rbp)
  801174:	eb 17                	jmp    80118d <strchr+0x2a>
  801176:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80117a:	0f b6 00             	movzbl (%rax),%eax
  80117d:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801180:	75 06                	jne    801188 <strchr+0x25>
  801182:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801186:	eb 15                	jmp    80119d <strchr+0x3a>
  801188:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80118d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801191:	0f b6 00             	movzbl (%rax),%eax
  801194:	84 c0                	test   %al,%al
  801196:	75 de                	jne    801176 <strchr+0x13>
  801198:	b8 00 00 00 00       	mov    $0x0,%eax
  80119d:	c9                   	leaveq 
  80119e:	c3                   	retq   

000000000080119f <strfind>:
  80119f:	55                   	push   %rbp
  8011a0:	48 89 e5             	mov    %rsp,%rbp
  8011a3:	48 83 ec 0c          	sub    $0xc,%rsp
  8011a7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8011ab:	89 f0                	mov    %esi,%eax
  8011ad:	88 45 f4             	mov    %al,-0xc(%rbp)
  8011b0:	eb 13                	jmp    8011c5 <strfind+0x26>
  8011b2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011b6:	0f b6 00             	movzbl (%rax),%eax
  8011b9:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8011bc:	75 02                	jne    8011c0 <strfind+0x21>
  8011be:	eb 10                	jmp    8011d0 <strfind+0x31>
  8011c0:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8011c5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011c9:	0f b6 00             	movzbl (%rax),%eax
  8011cc:	84 c0                	test   %al,%al
  8011ce:	75 e2                	jne    8011b2 <strfind+0x13>
  8011d0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011d4:	c9                   	leaveq 
  8011d5:	c3                   	retq   

00000000008011d6 <memset>:
  8011d6:	55                   	push   %rbp
  8011d7:	48 89 e5             	mov    %rsp,%rbp
  8011da:	48 83 ec 18          	sub    $0x18,%rsp
  8011de:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8011e2:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8011e5:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8011e9:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8011ee:	75 06                	jne    8011f6 <memset+0x20>
  8011f0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011f4:	eb 69                	jmp    80125f <memset+0x89>
  8011f6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011fa:	83 e0 03             	and    $0x3,%eax
  8011fd:	48 85 c0             	test   %rax,%rax
  801200:	75 48                	jne    80124a <memset+0x74>
  801202:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801206:	83 e0 03             	and    $0x3,%eax
  801209:	48 85 c0             	test   %rax,%rax
  80120c:	75 3c                	jne    80124a <memset+0x74>
  80120e:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  801215:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801218:	c1 e0 18             	shl    $0x18,%eax
  80121b:	89 c2                	mov    %eax,%edx
  80121d:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801220:	c1 e0 10             	shl    $0x10,%eax
  801223:	09 c2                	or     %eax,%edx
  801225:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801228:	c1 e0 08             	shl    $0x8,%eax
  80122b:	09 d0                	or     %edx,%eax
  80122d:	09 45 f4             	or     %eax,-0xc(%rbp)
  801230:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801234:	48 c1 e8 02          	shr    $0x2,%rax
  801238:	48 89 c1             	mov    %rax,%rcx
  80123b:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80123f:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801242:	48 89 d7             	mov    %rdx,%rdi
  801245:	fc                   	cld    
  801246:	f3 ab                	rep stos %eax,%es:(%rdi)
  801248:	eb 11                	jmp    80125b <memset+0x85>
  80124a:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80124e:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801251:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801255:	48 89 d7             	mov    %rdx,%rdi
  801258:	fc                   	cld    
  801259:	f3 aa                	rep stos %al,%es:(%rdi)
  80125b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80125f:	c9                   	leaveq 
  801260:	c3                   	retq   

0000000000801261 <memmove>:
  801261:	55                   	push   %rbp
  801262:	48 89 e5             	mov    %rsp,%rbp
  801265:	48 83 ec 28          	sub    $0x28,%rsp
  801269:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80126d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801271:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801275:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801279:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80127d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801281:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801285:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801289:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  80128d:	0f 83 88 00 00 00    	jae    80131b <memmove+0xba>
  801293:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801297:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80129b:	48 01 d0             	add    %rdx,%rax
  80129e:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8012a2:	76 77                	jbe    80131b <memmove+0xba>
  8012a4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8012a8:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  8012ac:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8012b0:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  8012b4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012b8:	83 e0 03             	and    $0x3,%eax
  8012bb:	48 85 c0             	test   %rax,%rax
  8012be:	75 3b                	jne    8012fb <memmove+0x9a>
  8012c0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012c4:	83 e0 03             	and    $0x3,%eax
  8012c7:	48 85 c0             	test   %rax,%rax
  8012ca:	75 2f                	jne    8012fb <memmove+0x9a>
  8012cc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8012d0:	83 e0 03             	and    $0x3,%eax
  8012d3:	48 85 c0             	test   %rax,%rax
  8012d6:	75 23                	jne    8012fb <memmove+0x9a>
  8012d8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012dc:	48 83 e8 04          	sub    $0x4,%rax
  8012e0:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8012e4:	48 83 ea 04          	sub    $0x4,%rdx
  8012e8:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  8012ec:	48 c1 e9 02          	shr    $0x2,%rcx
  8012f0:	48 89 c7             	mov    %rax,%rdi
  8012f3:	48 89 d6             	mov    %rdx,%rsi
  8012f6:	fd                   	std    
  8012f7:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  8012f9:	eb 1d                	jmp    801318 <memmove+0xb7>
  8012fb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012ff:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801303:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801307:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  80130b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80130f:	48 89 d7             	mov    %rdx,%rdi
  801312:	48 89 c1             	mov    %rax,%rcx
  801315:	fd                   	std    
  801316:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801318:	fc                   	cld    
  801319:	eb 57                	jmp    801372 <memmove+0x111>
  80131b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80131f:	83 e0 03             	and    $0x3,%eax
  801322:	48 85 c0             	test   %rax,%rax
  801325:	75 36                	jne    80135d <memmove+0xfc>
  801327:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80132b:	83 e0 03             	and    $0x3,%eax
  80132e:	48 85 c0             	test   %rax,%rax
  801331:	75 2a                	jne    80135d <memmove+0xfc>
  801333:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801337:	83 e0 03             	and    $0x3,%eax
  80133a:	48 85 c0             	test   %rax,%rax
  80133d:	75 1e                	jne    80135d <memmove+0xfc>
  80133f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801343:	48 c1 e8 02          	shr    $0x2,%rax
  801347:	48 89 c1             	mov    %rax,%rcx
  80134a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80134e:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801352:	48 89 c7             	mov    %rax,%rdi
  801355:	48 89 d6             	mov    %rdx,%rsi
  801358:	fc                   	cld    
  801359:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  80135b:	eb 15                	jmp    801372 <memmove+0x111>
  80135d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801361:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801365:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801369:	48 89 c7             	mov    %rax,%rdi
  80136c:	48 89 d6             	mov    %rdx,%rsi
  80136f:	fc                   	cld    
  801370:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801372:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801376:	c9                   	leaveq 
  801377:	c3                   	retq   

0000000000801378 <memcpy>:
  801378:	55                   	push   %rbp
  801379:	48 89 e5             	mov    %rsp,%rbp
  80137c:	48 83 ec 18          	sub    $0x18,%rsp
  801380:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801384:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801388:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80138c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801390:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  801394:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801398:	48 89 ce             	mov    %rcx,%rsi
  80139b:	48 89 c7             	mov    %rax,%rdi
  80139e:	48 b8 61 12 80 00 00 	movabs $0x801261,%rax
  8013a5:	00 00 00 
  8013a8:	ff d0                	callq  *%rax
  8013aa:	c9                   	leaveq 
  8013ab:	c3                   	retq   

00000000008013ac <memcmp>:
  8013ac:	55                   	push   %rbp
  8013ad:	48 89 e5             	mov    %rsp,%rbp
  8013b0:	48 83 ec 28          	sub    $0x28,%rsp
  8013b4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8013b8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8013bc:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8013c0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013c4:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8013c8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8013cc:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8013d0:	eb 36                	jmp    801408 <memcmp+0x5c>
  8013d2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013d6:	0f b6 10             	movzbl (%rax),%edx
  8013d9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8013dd:	0f b6 00             	movzbl (%rax),%eax
  8013e0:	38 c2                	cmp    %al,%dl
  8013e2:	74 1a                	je     8013fe <memcmp+0x52>
  8013e4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013e8:	0f b6 00             	movzbl (%rax),%eax
  8013eb:	0f b6 d0             	movzbl %al,%edx
  8013ee:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8013f2:	0f b6 00             	movzbl (%rax),%eax
  8013f5:	0f b6 c0             	movzbl %al,%eax
  8013f8:	29 c2                	sub    %eax,%edx
  8013fa:	89 d0                	mov    %edx,%eax
  8013fc:	eb 20                	jmp    80141e <memcmp+0x72>
  8013fe:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801403:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801408:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80140c:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801410:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801414:	48 85 c0             	test   %rax,%rax
  801417:	75 b9                	jne    8013d2 <memcmp+0x26>
  801419:	b8 00 00 00 00       	mov    $0x0,%eax
  80141e:	c9                   	leaveq 
  80141f:	c3                   	retq   

0000000000801420 <memfind>:
  801420:	55                   	push   %rbp
  801421:	48 89 e5             	mov    %rsp,%rbp
  801424:	48 83 ec 28          	sub    $0x28,%rsp
  801428:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80142c:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80142f:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801433:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801437:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80143b:	48 01 d0             	add    %rdx,%rax
  80143e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801442:	eb 15                	jmp    801459 <memfind+0x39>
  801444:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801448:	0f b6 10             	movzbl (%rax),%edx
  80144b:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80144e:	38 c2                	cmp    %al,%dl
  801450:	75 02                	jne    801454 <memfind+0x34>
  801452:	eb 0f                	jmp    801463 <memfind+0x43>
  801454:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801459:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80145d:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  801461:	72 e1                	jb     801444 <memfind+0x24>
  801463:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801467:	c9                   	leaveq 
  801468:	c3                   	retq   

0000000000801469 <strtol>:
  801469:	55                   	push   %rbp
  80146a:	48 89 e5             	mov    %rsp,%rbp
  80146d:	48 83 ec 34          	sub    $0x34,%rsp
  801471:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801475:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801479:	89 55 cc             	mov    %edx,-0x34(%rbp)
  80147c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801483:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  80148a:	00 
  80148b:	eb 05                	jmp    801492 <strtol+0x29>
  80148d:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801492:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801496:	0f b6 00             	movzbl (%rax),%eax
  801499:	3c 20                	cmp    $0x20,%al
  80149b:	74 f0                	je     80148d <strtol+0x24>
  80149d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014a1:	0f b6 00             	movzbl (%rax),%eax
  8014a4:	3c 09                	cmp    $0x9,%al
  8014a6:	74 e5                	je     80148d <strtol+0x24>
  8014a8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014ac:	0f b6 00             	movzbl (%rax),%eax
  8014af:	3c 2b                	cmp    $0x2b,%al
  8014b1:	75 07                	jne    8014ba <strtol+0x51>
  8014b3:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8014b8:	eb 17                	jmp    8014d1 <strtol+0x68>
  8014ba:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014be:	0f b6 00             	movzbl (%rax),%eax
  8014c1:	3c 2d                	cmp    $0x2d,%al
  8014c3:	75 0c                	jne    8014d1 <strtol+0x68>
  8014c5:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8014ca:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  8014d1:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8014d5:	74 06                	je     8014dd <strtol+0x74>
  8014d7:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  8014db:	75 28                	jne    801505 <strtol+0x9c>
  8014dd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014e1:	0f b6 00             	movzbl (%rax),%eax
  8014e4:	3c 30                	cmp    $0x30,%al
  8014e6:	75 1d                	jne    801505 <strtol+0x9c>
  8014e8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014ec:	48 83 c0 01          	add    $0x1,%rax
  8014f0:	0f b6 00             	movzbl (%rax),%eax
  8014f3:	3c 78                	cmp    $0x78,%al
  8014f5:	75 0e                	jne    801505 <strtol+0x9c>
  8014f7:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  8014fc:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  801503:	eb 2c                	jmp    801531 <strtol+0xc8>
  801505:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801509:	75 19                	jne    801524 <strtol+0xbb>
  80150b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80150f:	0f b6 00             	movzbl (%rax),%eax
  801512:	3c 30                	cmp    $0x30,%al
  801514:	75 0e                	jne    801524 <strtol+0xbb>
  801516:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80151b:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  801522:	eb 0d                	jmp    801531 <strtol+0xc8>
  801524:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801528:	75 07                	jne    801531 <strtol+0xc8>
  80152a:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  801531:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801535:	0f b6 00             	movzbl (%rax),%eax
  801538:	3c 2f                	cmp    $0x2f,%al
  80153a:	7e 1d                	jle    801559 <strtol+0xf0>
  80153c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801540:	0f b6 00             	movzbl (%rax),%eax
  801543:	3c 39                	cmp    $0x39,%al
  801545:	7f 12                	jg     801559 <strtol+0xf0>
  801547:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80154b:	0f b6 00             	movzbl (%rax),%eax
  80154e:	0f be c0             	movsbl %al,%eax
  801551:	83 e8 30             	sub    $0x30,%eax
  801554:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801557:	eb 4e                	jmp    8015a7 <strtol+0x13e>
  801559:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80155d:	0f b6 00             	movzbl (%rax),%eax
  801560:	3c 60                	cmp    $0x60,%al
  801562:	7e 1d                	jle    801581 <strtol+0x118>
  801564:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801568:	0f b6 00             	movzbl (%rax),%eax
  80156b:	3c 7a                	cmp    $0x7a,%al
  80156d:	7f 12                	jg     801581 <strtol+0x118>
  80156f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801573:	0f b6 00             	movzbl (%rax),%eax
  801576:	0f be c0             	movsbl %al,%eax
  801579:	83 e8 57             	sub    $0x57,%eax
  80157c:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80157f:	eb 26                	jmp    8015a7 <strtol+0x13e>
  801581:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801585:	0f b6 00             	movzbl (%rax),%eax
  801588:	3c 40                	cmp    $0x40,%al
  80158a:	7e 48                	jle    8015d4 <strtol+0x16b>
  80158c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801590:	0f b6 00             	movzbl (%rax),%eax
  801593:	3c 5a                	cmp    $0x5a,%al
  801595:	7f 3d                	jg     8015d4 <strtol+0x16b>
  801597:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80159b:	0f b6 00             	movzbl (%rax),%eax
  80159e:	0f be c0             	movsbl %al,%eax
  8015a1:	83 e8 37             	sub    $0x37,%eax
  8015a4:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8015a7:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8015aa:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  8015ad:	7c 02                	jl     8015b1 <strtol+0x148>
  8015af:	eb 23                	jmp    8015d4 <strtol+0x16b>
  8015b1:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8015b6:	8b 45 cc             	mov    -0x34(%rbp),%eax
  8015b9:	48 98                	cltq   
  8015bb:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  8015c0:	48 89 c2             	mov    %rax,%rdx
  8015c3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8015c6:	48 98                	cltq   
  8015c8:	48 01 d0             	add    %rdx,%rax
  8015cb:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8015cf:	e9 5d ff ff ff       	jmpq   801531 <strtol+0xc8>
  8015d4:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  8015d9:	74 0b                	je     8015e6 <strtol+0x17d>
  8015db:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8015df:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8015e3:	48 89 10             	mov    %rdx,(%rax)
  8015e6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8015ea:	74 09                	je     8015f5 <strtol+0x18c>
  8015ec:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015f0:	48 f7 d8             	neg    %rax
  8015f3:	eb 04                	jmp    8015f9 <strtol+0x190>
  8015f5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015f9:	c9                   	leaveq 
  8015fa:	c3                   	retq   

00000000008015fb <strstr>:
  8015fb:	55                   	push   %rbp
  8015fc:	48 89 e5             	mov    %rsp,%rbp
  8015ff:	48 83 ec 30          	sub    $0x30,%rsp
  801603:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801607:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80160b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80160f:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801613:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801617:	0f b6 00             	movzbl (%rax),%eax
  80161a:	88 45 ff             	mov    %al,-0x1(%rbp)
  80161d:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  801621:	75 06                	jne    801629 <strstr+0x2e>
  801623:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801627:	eb 6b                	jmp    801694 <strstr+0x99>
  801629:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80162d:	48 89 c7             	mov    %rax,%rdi
  801630:	48 b8 d1 0e 80 00 00 	movabs $0x800ed1,%rax
  801637:	00 00 00 
  80163a:	ff d0                	callq  *%rax
  80163c:	48 98                	cltq   
  80163e:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801642:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801646:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80164a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80164e:	0f b6 00             	movzbl (%rax),%eax
  801651:	88 45 ef             	mov    %al,-0x11(%rbp)
  801654:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  801658:	75 07                	jne    801661 <strstr+0x66>
  80165a:	b8 00 00 00 00       	mov    $0x0,%eax
  80165f:	eb 33                	jmp    801694 <strstr+0x99>
  801661:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  801665:	3a 45 ff             	cmp    -0x1(%rbp),%al
  801668:	75 d8                	jne    801642 <strstr+0x47>
  80166a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80166e:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  801672:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801676:	48 89 ce             	mov    %rcx,%rsi
  801679:	48 89 c7             	mov    %rax,%rdi
  80167c:	48 b8 f2 10 80 00 00 	movabs $0x8010f2,%rax
  801683:	00 00 00 
  801686:	ff d0                	callq  *%rax
  801688:	85 c0                	test   %eax,%eax
  80168a:	75 b6                	jne    801642 <strstr+0x47>
  80168c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801690:	48 83 e8 01          	sub    $0x1,%rax
  801694:	c9                   	leaveq 
  801695:	c3                   	retq   

0000000000801696 <syscall>:
  801696:	55                   	push   %rbp
  801697:	48 89 e5             	mov    %rsp,%rbp
  80169a:	53                   	push   %rbx
  80169b:	48 83 ec 48          	sub    $0x48,%rsp
  80169f:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8016a2:	89 75 d8             	mov    %esi,-0x28(%rbp)
  8016a5:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  8016a9:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  8016ad:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  8016b1:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  8016b5:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8016b8:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  8016bc:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  8016c0:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  8016c4:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  8016c8:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  8016cc:	4c 89 c3             	mov    %r8,%rbx
  8016cf:	cd 30                	int    $0x30
  8016d1:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8016d5:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  8016d9:	74 3e                	je     801719 <syscall+0x83>
  8016db:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8016e0:	7e 37                	jle    801719 <syscall+0x83>
  8016e2:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8016e6:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8016e9:	49 89 d0             	mov    %rdx,%r8
  8016ec:	89 c1                	mov    %eax,%ecx
  8016ee:	48 ba 88 4c 80 00 00 	movabs $0x804c88,%rdx
  8016f5:	00 00 00 
  8016f8:	be 24 00 00 00       	mov    $0x24,%esi
  8016fd:	48 bf a5 4c 80 00 00 	movabs $0x804ca5,%rdi
  801704:	00 00 00 
  801707:	b8 00 00 00 00       	mov    $0x0,%eax
  80170c:	49 b9 e6 43 80 00 00 	movabs $0x8043e6,%r9
  801713:	00 00 00 
  801716:	41 ff d1             	callq  *%r9
  801719:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80171d:	48 83 c4 48          	add    $0x48,%rsp
  801721:	5b                   	pop    %rbx
  801722:	5d                   	pop    %rbp
  801723:	c3                   	retq   

0000000000801724 <sys_cputs>:
  801724:	55                   	push   %rbp
  801725:	48 89 e5             	mov    %rsp,%rbp
  801728:	48 83 ec 20          	sub    $0x20,%rsp
  80172c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801730:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801734:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801738:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80173c:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801743:	00 
  801744:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80174a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801750:	48 89 d1             	mov    %rdx,%rcx
  801753:	48 89 c2             	mov    %rax,%rdx
  801756:	be 00 00 00 00       	mov    $0x0,%esi
  80175b:	bf 00 00 00 00       	mov    $0x0,%edi
  801760:	48 b8 96 16 80 00 00 	movabs $0x801696,%rax
  801767:	00 00 00 
  80176a:	ff d0                	callq  *%rax
  80176c:	c9                   	leaveq 
  80176d:	c3                   	retq   

000000000080176e <sys_cgetc>:
  80176e:	55                   	push   %rbp
  80176f:	48 89 e5             	mov    %rsp,%rbp
  801772:	48 83 ec 10          	sub    $0x10,%rsp
  801776:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80177d:	00 
  80177e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801784:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80178a:	b9 00 00 00 00       	mov    $0x0,%ecx
  80178f:	ba 00 00 00 00       	mov    $0x0,%edx
  801794:	be 00 00 00 00       	mov    $0x0,%esi
  801799:	bf 01 00 00 00       	mov    $0x1,%edi
  80179e:	48 b8 96 16 80 00 00 	movabs $0x801696,%rax
  8017a5:	00 00 00 
  8017a8:	ff d0                	callq  *%rax
  8017aa:	c9                   	leaveq 
  8017ab:	c3                   	retq   

00000000008017ac <sys_env_destroy>:
  8017ac:	55                   	push   %rbp
  8017ad:	48 89 e5             	mov    %rsp,%rbp
  8017b0:	48 83 ec 10          	sub    $0x10,%rsp
  8017b4:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8017b7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8017ba:	48 98                	cltq   
  8017bc:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8017c3:	00 
  8017c4:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8017ca:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8017d0:	b9 00 00 00 00       	mov    $0x0,%ecx
  8017d5:	48 89 c2             	mov    %rax,%rdx
  8017d8:	be 01 00 00 00       	mov    $0x1,%esi
  8017dd:	bf 03 00 00 00       	mov    $0x3,%edi
  8017e2:	48 b8 96 16 80 00 00 	movabs $0x801696,%rax
  8017e9:	00 00 00 
  8017ec:	ff d0                	callq  *%rax
  8017ee:	c9                   	leaveq 
  8017ef:	c3                   	retq   

00000000008017f0 <sys_getenvid>:
  8017f0:	55                   	push   %rbp
  8017f1:	48 89 e5             	mov    %rsp,%rbp
  8017f4:	48 83 ec 10          	sub    $0x10,%rsp
  8017f8:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8017ff:	00 
  801800:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801806:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80180c:	b9 00 00 00 00       	mov    $0x0,%ecx
  801811:	ba 00 00 00 00       	mov    $0x0,%edx
  801816:	be 00 00 00 00       	mov    $0x0,%esi
  80181b:	bf 02 00 00 00       	mov    $0x2,%edi
  801820:	48 b8 96 16 80 00 00 	movabs $0x801696,%rax
  801827:	00 00 00 
  80182a:	ff d0                	callq  *%rax
  80182c:	c9                   	leaveq 
  80182d:	c3                   	retq   

000000000080182e <sys_yield>:
  80182e:	55                   	push   %rbp
  80182f:	48 89 e5             	mov    %rsp,%rbp
  801832:	48 83 ec 10          	sub    $0x10,%rsp
  801836:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80183d:	00 
  80183e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801844:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80184a:	b9 00 00 00 00       	mov    $0x0,%ecx
  80184f:	ba 00 00 00 00       	mov    $0x0,%edx
  801854:	be 00 00 00 00       	mov    $0x0,%esi
  801859:	bf 0b 00 00 00       	mov    $0xb,%edi
  80185e:	48 b8 96 16 80 00 00 	movabs $0x801696,%rax
  801865:	00 00 00 
  801868:	ff d0                	callq  *%rax
  80186a:	c9                   	leaveq 
  80186b:	c3                   	retq   

000000000080186c <sys_page_alloc>:
  80186c:	55                   	push   %rbp
  80186d:	48 89 e5             	mov    %rsp,%rbp
  801870:	48 83 ec 20          	sub    $0x20,%rsp
  801874:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801877:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80187b:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80187e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801881:	48 63 c8             	movslq %eax,%rcx
  801884:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801888:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80188b:	48 98                	cltq   
  80188d:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801894:	00 
  801895:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80189b:	49 89 c8             	mov    %rcx,%r8
  80189e:	48 89 d1             	mov    %rdx,%rcx
  8018a1:	48 89 c2             	mov    %rax,%rdx
  8018a4:	be 01 00 00 00       	mov    $0x1,%esi
  8018a9:	bf 04 00 00 00       	mov    $0x4,%edi
  8018ae:	48 b8 96 16 80 00 00 	movabs $0x801696,%rax
  8018b5:	00 00 00 
  8018b8:	ff d0                	callq  *%rax
  8018ba:	c9                   	leaveq 
  8018bb:	c3                   	retq   

00000000008018bc <sys_page_map>:
  8018bc:	55                   	push   %rbp
  8018bd:	48 89 e5             	mov    %rsp,%rbp
  8018c0:	48 83 ec 30          	sub    $0x30,%rsp
  8018c4:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8018c7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8018cb:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8018ce:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  8018d2:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  8018d6:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8018d9:	48 63 c8             	movslq %eax,%rcx
  8018dc:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  8018e0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8018e3:	48 63 f0             	movslq %eax,%rsi
  8018e6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8018ea:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8018ed:	48 98                	cltq   
  8018ef:	48 89 0c 24          	mov    %rcx,(%rsp)
  8018f3:	49 89 f9             	mov    %rdi,%r9
  8018f6:	49 89 f0             	mov    %rsi,%r8
  8018f9:	48 89 d1             	mov    %rdx,%rcx
  8018fc:	48 89 c2             	mov    %rax,%rdx
  8018ff:	be 01 00 00 00       	mov    $0x1,%esi
  801904:	bf 05 00 00 00       	mov    $0x5,%edi
  801909:	48 b8 96 16 80 00 00 	movabs $0x801696,%rax
  801910:	00 00 00 
  801913:	ff d0                	callq  *%rax
  801915:	c9                   	leaveq 
  801916:	c3                   	retq   

0000000000801917 <sys_page_unmap>:
  801917:	55                   	push   %rbp
  801918:	48 89 e5             	mov    %rsp,%rbp
  80191b:	48 83 ec 20          	sub    $0x20,%rsp
  80191f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801922:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801926:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80192a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80192d:	48 98                	cltq   
  80192f:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801936:	00 
  801937:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80193d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801943:	48 89 d1             	mov    %rdx,%rcx
  801946:	48 89 c2             	mov    %rax,%rdx
  801949:	be 01 00 00 00       	mov    $0x1,%esi
  80194e:	bf 06 00 00 00       	mov    $0x6,%edi
  801953:	48 b8 96 16 80 00 00 	movabs $0x801696,%rax
  80195a:	00 00 00 
  80195d:	ff d0                	callq  *%rax
  80195f:	c9                   	leaveq 
  801960:	c3                   	retq   

0000000000801961 <sys_env_set_status>:
  801961:	55                   	push   %rbp
  801962:	48 89 e5             	mov    %rsp,%rbp
  801965:	48 83 ec 10          	sub    $0x10,%rsp
  801969:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80196c:	89 75 f8             	mov    %esi,-0x8(%rbp)
  80196f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801972:	48 63 d0             	movslq %eax,%rdx
  801975:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801978:	48 98                	cltq   
  80197a:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801981:	00 
  801982:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801988:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80198e:	48 89 d1             	mov    %rdx,%rcx
  801991:	48 89 c2             	mov    %rax,%rdx
  801994:	be 01 00 00 00       	mov    $0x1,%esi
  801999:	bf 08 00 00 00       	mov    $0x8,%edi
  80199e:	48 b8 96 16 80 00 00 	movabs $0x801696,%rax
  8019a5:	00 00 00 
  8019a8:	ff d0                	callq  *%rax
  8019aa:	c9                   	leaveq 
  8019ab:	c3                   	retq   

00000000008019ac <sys_env_set_trapframe>:
  8019ac:	55                   	push   %rbp
  8019ad:	48 89 e5             	mov    %rsp,%rbp
  8019b0:	48 83 ec 20          	sub    $0x20,%rsp
  8019b4:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8019b7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8019bb:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8019bf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8019c2:	48 98                	cltq   
  8019c4:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8019cb:	00 
  8019cc:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8019d2:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8019d8:	48 89 d1             	mov    %rdx,%rcx
  8019db:	48 89 c2             	mov    %rax,%rdx
  8019de:	be 01 00 00 00       	mov    $0x1,%esi
  8019e3:	bf 09 00 00 00       	mov    $0x9,%edi
  8019e8:	48 b8 96 16 80 00 00 	movabs $0x801696,%rax
  8019ef:	00 00 00 
  8019f2:	ff d0                	callq  *%rax
  8019f4:	c9                   	leaveq 
  8019f5:	c3                   	retq   

00000000008019f6 <sys_env_set_pgfault_upcall>:
  8019f6:	55                   	push   %rbp
  8019f7:	48 89 e5             	mov    %rsp,%rbp
  8019fa:	48 83 ec 20          	sub    $0x20,%rsp
  8019fe:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a01:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a05:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801a09:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a0c:	48 98                	cltq   
  801a0e:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801a15:	00 
  801a16:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a1c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a22:	48 89 d1             	mov    %rdx,%rcx
  801a25:	48 89 c2             	mov    %rax,%rdx
  801a28:	be 01 00 00 00       	mov    $0x1,%esi
  801a2d:	bf 0a 00 00 00       	mov    $0xa,%edi
  801a32:	48 b8 96 16 80 00 00 	movabs $0x801696,%rax
  801a39:	00 00 00 
  801a3c:	ff d0                	callq  *%rax
  801a3e:	c9                   	leaveq 
  801a3f:	c3                   	retq   

0000000000801a40 <sys_ipc_try_send>:
  801a40:	55                   	push   %rbp
  801a41:	48 89 e5             	mov    %rsp,%rbp
  801a44:	48 83 ec 20          	sub    $0x20,%rsp
  801a48:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a4b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a4f:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801a53:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801a56:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801a59:	48 63 f0             	movslq %eax,%rsi
  801a5c:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801a60:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a63:	48 98                	cltq   
  801a65:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801a69:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801a70:	00 
  801a71:	49 89 f1             	mov    %rsi,%r9
  801a74:	49 89 c8             	mov    %rcx,%r8
  801a77:	48 89 d1             	mov    %rdx,%rcx
  801a7a:	48 89 c2             	mov    %rax,%rdx
  801a7d:	be 00 00 00 00       	mov    $0x0,%esi
  801a82:	bf 0c 00 00 00       	mov    $0xc,%edi
  801a87:	48 b8 96 16 80 00 00 	movabs $0x801696,%rax
  801a8e:	00 00 00 
  801a91:	ff d0                	callq  *%rax
  801a93:	c9                   	leaveq 
  801a94:	c3                   	retq   

0000000000801a95 <sys_ipc_recv>:
  801a95:	55                   	push   %rbp
  801a96:	48 89 e5             	mov    %rsp,%rbp
  801a99:	48 83 ec 10          	sub    $0x10,%rsp
  801a9d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801aa1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801aa5:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801aac:	00 
  801aad:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ab3:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ab9:	b9 00 00 00 00       	mov    $0x0,%ecx
  801abe:	48 89 c2             	mov    %rax,%rdx
  801ac1:	be 01 00 00 00       	mov    $0x1,%esi
  801ac6:	bf 0d 00 00 00       	mov    $0xd,%edi
  801acb:	48 b8 96 16 80 00 00 	movabs $0x801696,%rax
  801ad2:	00 00 00 
  801ad5:	ff d0                	callq  *%rax
  801ad7:	c9                   	leaveq 
  801ad8:	c3                   	retq   

0000000000801ad9 <sys_time_msec>:
  801ad9:	55                   	push   %rbp
  801ada:	48 89 e5             	mov    %rsp,%rbp
  801add:	48 83 ec 10          	sub    $0x10,%rsp
  801ae1:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801ae8:	00 
  801ae9:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801aef:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801af5:	b9 00 00 00 00       	mov    $0x0,%ecx
  801afa:	ba 00 00 00 00       	mov    $0x0,%edx
  801aff:	be 00 00 00 00       	mov    $0x0,%esi
  801b04:	bf 0e 00 00 00       	mov    $0xe,%edi
  801b09:	48 b8 96 16 80 00 00 	movabs $0x801696,%rax
  801b10:	00 00 00 
  801b13:	ff d0                	callq  *%rax
  801b15:	c9                   	leaveq 
  801b16:	c3                   	retq   

0000000000801b17 <sys_net_transmit>:
  801b17:	55                   	push   %rbp
  801b18:	48 89 e5             	mov    %rsp,%rbp
  801b1b:	48 83 ec 20          	sub    $0x20,%rsp
  801b1f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801b23:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801b26:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801b29:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b2d:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801b34:	00 
  801b35:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b3b:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b41:	48 89 d1             	mov    %rdx,%rcx
  801b44:	48 89 c2             	mov    %rax,%rdx
  801b47:	be 00 00 00 00       	mov    $0x0,%esi
  801b4c:	bf 0f 00 00 00       	mov    $0xf,%edi
  801b51:	48 b8 96 16 80 00 00 	movabs $0x801696,%rax
  801b58:	00 00 00 
  801b5b:	ff d0                	callq  *%rax
  801b5d:	c9                   	leaveq 
  801b5e:	c3                   	retq   

0000000000801b5f <sys_net_receive>:
  801b5f:	55                   	push   %rbp
  801b60:	48 89 e5             	mov    %rsp,%rbp
  801b63:	48 83 ec 20          	sub    $0x20,%rsp
  801b67:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801b6b:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801b6e:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801b71:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b75:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801b7c:	00 
  801b7d:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b83:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b89:	48 89 d1             	mov    %rdx,%rcx
  801b8c:	48 89 c2             	mov    %rax,%rdx
  801b8f:	be 00 00 00 00       	mov    $0x0,%esi
  801b94:	bf 10 00 00 00       	mov    $0x10,%edi
  801b99:	48 b8 96 16 80 00 00 	movabs $0x801696,%rax
  801ba0:	00 00 00 
  801ba3:	ff d0                	callq  *%rax
  801ba5:	c9                   	leaveq 
  801ba6:	c3                   	retq   

0000000000801ba7 <sys_ept_map>:
  801ba7:	55                   	push   %rbp
  801ba8:	48 89 e5             	mov    %rsp,%rbp
  801bab:	48 83 ec 30          	sub    $0x30,%rsp
  801baf:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801bb2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801bb6:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801bb9:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801bbd:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801bc1:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801bc4:	48 63 c8             	movslq %eax,%rcx
  801bc7:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801bcb:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801bce:	48 63 f0             	movslq %eax,%rsi
  801bd1:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801bd5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801bd8:	48 98                	cltq   
  801bda:	48 89 0c 24          	mov    %rcx,(%rsp)
  801bde:	49 89 f9             	mov    %rdi,%r9
  801be1:	49 89 f0             	mov    %rsi,%r8
  801be4:	48 89 d1             	mov    %rdx,%rcx
  801be7:	48 89 c2             	mov    %rax,%rdx
  801bea:	be 00 00 00 00       	mov    $0x0,%esi
  801bef:	bf 11 00 00 00       	mov    $0x11,%edi
  801bf4:	48 b8 96 16 80 00 00 	movabs $0x801696,%rax
  801bfb:	00 00 00 
  801bfe:	ff d0                	callq  *%rax
  801c00:	c9                   	leaveq 
  801c01:	c3                   	retq   

0000000000801c02 <sys_env_mkguest>:
  801c02:	55                   	push   %rbp
  801c03:	48 89 e5             	mov    %rsp,%rbp
  801c06:	48 83 ec 20          	sub    $0x20,%rsp
  801c0a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c0e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c12:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c16:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c1a:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c21:	00 
  801c22:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c28:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c2e:	48 89 d1             	mov    %rdx,%rcx
  801c31:	48 89 c2             	mov    %rax,%rdx
  801c34:	be 00 00 00 00       	mov    $0x0,%esi
  801c39:	bf 12 00 00 00       	mov    $0x12,%edi
  801c3e:	48 b8 96 16 80 00 00 	movabs $0x801696,%rax
  801c45:	00 00 00 
  801c48:	ff d0                	callq  *%rax
  801c4a:	c9                   	leaveq 
  801c4b:	c3                   	retq   

0000000000801c4c <sys_vmx_list_vms>:
  801c4c:	55                   	push   %rbp
  801c4d:	48 89 e5             	mov    %rsp,%rbp
  801c50:	48 83 ec 10          	sub    $0x10,%rsp
  801c54:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c5b:	00 
  801c5c:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c62:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c68:	b9 00 00 00 00       	mov    $0x0,%ecx
  801c6d:	ba 00 00 00 00       	mov    $0x0,%edx
  801c72:	be 00 00 00 00       	mov    $0x0,%esi
  801c77:	bf 13 00 00 00       	mov    $0x13,%edi
  801c7c:	48 b8 96 16 80 00 00 	movabs $0x801696,%rax
  801c83:	00 00 00 
  801c86:	ff d0                	callq  *%rax
  801c88:	c9                   	leaveq 
  801c89:	c3                   	retq   

0000000000801c8a <sys_vmx_sel_resume>:
  801c8a:	55                   	push   %rbp
  801c8b:	48 89 e5             	mov    %rsp,%rbp
  801c8e:	48 83 ec 10          	sub    $0x10,%rsp
  801c92:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801c95:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c98:	48 98                	cltq   
  801c9a:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801ca1:	00 
  801ca2:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ca8:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801cae:	b9 00 00 00 00       	mov    $0x0,%ecx
  801cb3:	48 89 c2             	mov    %rax,%rdx
  801cb6:	be 00 00 00 00       	mov    $0x0,%esi
  801cbb:	bf 14 00 00 00       	mov    $0x14,%edi
  801cc0:	48 b8 96 16 80 00 00 	movabs $0x801696,%rax
  801cc7:	00 00 00 
  801cca:	ff d0                	callq  *%rax
  801ccc:	c9                   	leaveq 
  801ccd:	c3                   	retq   

0000000000801cce <sys_vmx_get_vmdisk_number>:
  801cce:	55                   	push   %rbp
  801ccf:	48 89 e5             	mov    %rsp,%rbp
  801cd2:	48 83 ec 10          	sub    $0x10,%rsp
  801cd6:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801cdd:	00 
  801cde:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ce4:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801cea:	b9 00 00 00 00       	mov    $0x0,%ecx
  801cef:	ba 00 00 00 00       	mov    $0x0,%edx
  801cf4:	be 00 00 00 00       	mov    $0x0,%esi
  801cf9:	bf 15 00 00 00       	mov    $0x15,%edi
  801cfe:	48 b8 96 16 80 00 00 	movabs $0x801696,%rax
  801d05:	00 00 00 
  801d08:	ff d0                	callq  *%rax
  801d0a:	c9                   	leaveq 
  801d0b:	c3                   	retq   

0000000000801d0c <sys_vmx_incr_vmdisk_number>:
  801d0c:	55                   	push   %rbp
  801d0d:	48 89 e5             	mov    %rsp,%rbp
  801d10:	48 83 ec 10          	sub    $0x10,%rsp
  801d14:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801d1b:	00 
  801d1c:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d22:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d28:	b9 00 00 00 00       	mov    $0x0,%ecx
  801d2d:	ba 00 00 00 00       	mov    $0x0,%edx
  801d32:	be 00 00 00 00       	mov    $0x0,%esi
  801d37:	bf 16 00 00 00       	mov    $0x16,%edi
  801d3c:	48 b8 96 16 80 00 00 	movabs $0x801696,%rax
  801d43:	00 00 00 
  801d46:	ff d0                	callq  *%rax
  801d48:	c9                   	leaveq 
  801d49:	c3                   	retq   

0000000000801d4a <argstart>:
  801d4a:	55                   	push   %rbp
  801d4b:	48 89 e5             	mov    %rsp,%rbp
  801d4e:	48 83 ec 18          	sub    $0x18,%rsp
  801d52:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d56:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d5a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801d5e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801d62:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801d66:	48 89 10             	mov    %rdx,(%rax)
  801d69:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801d6d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d71:	48 89 50 08          	mov    %rdx,0x8(%rax)
  801d75:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d79:	8b 00                	mov    (%rax),%eax
  801d7b:	83 f8 01             	cmp    $0x1,%eax
  801d7e:	7e 13                	jle    801d93 <argstart+0x49>
  801d80:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
  801d85:	74 0c                	je     801d93 <argstart+0x49>
  801d87:	48 b8 b6 4c 80 00 00 	movabs $0x804cb6,%rax
  801d8e:	00 00 00 
  801d91:	eb 05                	jmp    801d98 <argstart+0x4e>
  801d93:	b8 00 00 00 00       	mov    $0x0,%eax
  801d98:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801d9c:	48 89 42 10          	mov    %rax,0x10(%rdx)
  801da0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801da4:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
  801dab:	00 
  801dac:	c9                   	leaveq 
  801dad:	c3                   	retq   

0000000000801dae <argnext>:
  801dae:	55                   	push   %rbp
  801daf:	48 89 e5             	mov    %rsp,%rbp
  801db2:	48 83 ec 20          	sub    $0x20,%rsp
  801db6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801dba:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801dbe:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
  801dc5:	00 
  801dc6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801dca:	48 8b 40 10          	mov    0x10(%rax),%rax
  801dce:	48 85 c0             	test   %rax,%rax
  801dd1:	75 0a                	jne    801ddd <argnext+0x2f>
  801dd3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  801dd8:	e9 25 01 00 00       	jmpq   801f02 <argnext+0x154>
  801ddd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801de1:	48 8b 40 10          	mov    0x10(%rax),%rax
  801de5:	0f b6 00             	movzbl (%rax),%eax
  801de8:	84 c0                	test   %al,%al
  801dea:	0f 85 d7 00 00 00    	jne    801ec7 <argnext+0x119>
  801df0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801df4:	48 8b 00             	mov    (%rax),%rax
  801df7:	8b 00                	mov    (%rax),%eax
  801df9:	83 f8 01             	cmp    $0x1,%eax
  801dfc:	0f 84 ef 00 00 00    	je     801ef1 <argnext+0x143>
  801e02:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801e06:	48 8b 40 08          	mov    0x8(%rax),%rax
  801e0a:	48 83 c0 08          	add    $0x8,%rax
  801e0e:	48 8b 00             	mov    (%rax),%rax
  801e11:	0f b6 00             	movzbl (%rax),%eax
  801e14:	3c 2d                	cmp    $0x2d,%al
  801e16:	0f 85 d5 00 00 00    	jne    801ef1 <argnext+0x143>
  801e1c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801e20:	48 8b 40 08          	mov    0x8(%rax),%rax
  801e24:	48 83 c0 08          	add    $0x8,%rax
  801e28:	48 8b 00             	mov    (%rax),%rax
  801e2b:	48 83 c0 01          	add    $0x1,%rax
  801e2f:	0f b6 00             	movzbl (%rax),%eax
  801e32:	84 c0                	test   %al,%al
  801e34:	0f 84 b7 00 00 00    	je     801ef1 <argnext+0x143>
  801e3a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801e3e:	48 8b 40 08          	mov    0x8(%rax),%rax
  801e42:	48 83 c0 08          	add    $0x8,%rax
  801e46:	48 8b 00             	mov    (%rax),%rax
  801e49:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801e4d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801e51:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801e55:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801e59:	48 8b 00             	mov    (%rax),%rax
  801e5c:	8b 00                	mov    (%rax),%eax
  801e5e:	83 e8 01             	sub    $0x1,%eax
  801e61:	48 98                	cltq   
  801e63:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  801e6a:	00 
  801e6b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801e6f:	48 8b 40 08          	mov    0x8(%rax),%rax
  801e73:	48 8d 48 10          	lea    0x10(%rax),%rcx
  801e77:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801e7b:	48 8b 40 08          	mov    0x8(%rax),%rax
  801e7f:	48 83 c0 08          	add    $0x8,%rax
  801e83:	48 89 ce             	mov    %rcx,%rsi
  801e86:	48 89 c7             	mov    %rax,%rdi
  801e89:	48 b8 61 12 80 00 00 	movabs $0x801261,%rax
  801e90:	00 00 00 
  801e93:	ff d0                	callq  *%rax
  801e95:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801e99:	48 8b 00             	mov    (%rax),%rax
  801e9c:	8b 10                	mov    (%rax),%edx
  801e9e:	83 ea 01             	sub    $0x1,%edx
  801ea1:	89 10                	mov    %edx,(%rax)
  801ea3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801ea7:	48 8b 40 10          	mov    0x10(%rax),%rax
  801eab:	0f b6 00             	movzbl (%rax),%eax
  801eae:	3c 2d                	cmp    $0x2d,%al
  801eb0:	75 15                	jne    801ec7 <argnext+0x119>
  801eb2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801eb6:	48 8b 40 10          	mov    0x10(%rax),%rax
  801eba:	48 83 c0 01          	add    $0x1,%rax
  801ebe:	0f b6 00             	movzbl (%rax),%eax
  801ec1:	84 c0                	test   %al,%al
  801ec3:	75 02                	jne    801ec7 <argnext+0x119>
  801ec5:	eb 2a                	jmp    801ef1 <argnext+0x143>
  801ec7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801ecb:	48 8b 40 10          	mov    0x10(%rax),%rax
  801ecf:	0f b6 00             	movzbl (%rax),%eax
  801ed2:	0f b6 c0             	movzbl %al,%eax
  801ed5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801ed8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801edc:	48 8b 40 10          	mov    0x10(%rax),%rax
  801ee0:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801ee4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801ee8:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801eec:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801eef:	eb 11                	jmp    801f02 <argnext+0x154>
  801ef1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801ef5:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
  801efc:	00 
  801efd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  801f02:	c9                   	leaveq 
  801f03:	c3                   	retq   

0000000000801f04 <argvalue>:
  801f04:	55                   	push   %rbp
  801f05:	48 89 e5             	mov    %rsp,%rbp
  801f08:	48 83 ec 10          	sub    $0x10,%rsp
  801f0c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801f10:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801f14:	48 8b 40 18          	mov    0x18(%rax),%rax
  801f18:	48 85 c0             	test   %rax,%rax
  801f1b:	74 0a                	je     801f27 <argvalue+0x23>
  801f1d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801f21:	48 8b 40 18          	mov    0x18(%rax),%rax
  801f25:	eb 13                	jmp    801f3a <argvalue+0x36>
  801f27:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801f2b:	48 89 c7             	mov    %rax,%rdi
  801f2e:	48 b8 3c 1f 80 00 00 	movabs $0x801f3c,%rax
  801f35:	00 00 00 
  801f38:	ff d0                	callq  *%rax
  801f3a:	c9                   	leaveq 
  801f3b:	c3                   	retq   

0000000000801f3c <argnextvalue>:
  801f3c:	55                   	push   %rbp
  801f3d:	48 89 e5             	mov    %rsp,%rbp
  801f40:	53                   	push   %rbx
  801f41:	48 83 ec 18          	sub    $0x18,%rsp
  801f45:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801f49:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801f4d:	48 8b 40 10          	mov    0x10(%rax),%rax
  801f51:	48 85 c0             	test   %rax,%rax
  801f54:	75 0a                	jne    801f60 <argnextvalue+0x24>
  801f56:	b8 00 00 00 00       	mov    $0x0,%eax
  801f5b:	e9 c8 00 00 00       	jmpq   802028 <argnextvalue+0xec>
  801f60:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801f64:	48 8b 40 10          	mov    0x10(%rax),%rax
  801f68:	0f b6 00             	movzbl (%rax),%eax
  801f6b:	84 c0                	test   %al,%al
  801f6d:	74 27                	je     801f96 <argnextvalue+0x5a>
  801f6f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801f73:	48 8b 50 10          	mov    0x10(%rax),%rdx
  801f77:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801f7b:	48 89 50 18          	mov    %rdx,0x18(%rax)
  801f7f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801f83:	48 bb b6 4c 80 00 00 	movabs $0x804cb6,%rbx
  801f8a:	00 00 00 
  801f8d:	48 89 58 10          	mov    %rbx,0x10(%rax)
  801f91:	e9 8a 00 00 00       	jmpq   802020 <argnextvalue+0xe4>
  801f96:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801f9a:	48 8b 00             	mov    (%rax),%rax
  801f9d:	8b 00                	mov    (%rax),%eax
  801f9f:	83 f8 01             	cmp    $0x1,%eax
  801fa2:	7e 64                	jle    802008 <argnextvalue+0xcc>
  801fa4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801fa8:	48 8b 40 08          	mov    0x8(%rax),%rax
  801fac:	48 8b 50 08          	mov    0x8(%rax),%rdx
  801fb0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801fb4:	48 89 50 18          	mov    %rdx,0x18(%rax)
  801fb8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801fbc:	48 8b 00             	mov    (%rax),%rax
  801fbf:	8b 00                	mov    (%rax),%eax
  801fc1:	83 e8 01             	sub    $0x1,%eax
  801fc4:	48 98                	cltq   
  801fc6:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  801fcd:	00 
  801fce:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801fd2:	48 8b 40 08          	mov    0x8(%rax),%rax
  801fd6:	48 8d 48 10          	lea    0x10(%rax),%rcx
  801fda:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801fde:	48 8b 40 08          	mov    0x8(%rax),%rax
  801fe2:	48 83 c0 08          	add    $0x8,%rax
  801fe6:	48 89 ce             	mov    %rcx,%rsi
  801fe9:	48 89 c7             	mov    %rax,%rdi
  801fec:	48 b8 61 12 80 00 00 	movabs $0x801261,%rax
  801ff3:	00 00 00 
  801ff6:	ff d0                	callq  *%rax
  801ff8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801ffc:	48 8b 00             	mov    (%rax),%rax
  801fff:	8b 10                	mov    (%rax),%edx
  802001:	83 ea 01             	sub    $0x1,%edx
  802004:	89 10                	mov    %edx,(%rax)
  802006:	eb 18                	jmp    802020 <argnextvalue+0xe4>
  802008:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80200c:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
  802013:	00 
  802014:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802018:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
  80201f:	00 
  802020:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802024:	48 8b 40 18          	mov    0x18(%rax),%rax
  802028:	48 83 c4 18          	add    $0x18,%rsp
  80202c:	5b                   	pop    %rbx
  80202d:	5d                   	pop    %rbp
  80202e:	c3                   	retq   

000000000080202f <fd2num>:
  80202f:	55                   	push   %rbp
  802030:	48 89 e5             	mov    %rsp,%rbp
  802033:	48 83 ec 08          	sub    $0x8,%rsp
  802037:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80203b:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80203f:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  802046:	ff ff ff 
  802049:	48 01 d0             	add    %rdx,%rax
  80204c:	48 c1 e8 0c          	shr    $0xc,%rax
  802050:	c9                   	leaveq 
  802051:	c3                   	retq   

0000000000802052 <fd2data>:
  802052:	55                   	push   %rbp
  802053:	48 89 e5             	mov    %rsp,%rbp
  802056:	48 83 ec 08          	sub    $0x8,%rsp
  80205a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80205e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802062:	48 89 c7             	mov    %rax,%rdi
  802065:	48 b8 2f 20 80 00 00 	movabs $0x80202f,%rax
  80206c:	00 00 00 
  80206f:	ff d0                	callq  *%rax
  802071:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  802077:	48 c1 e0 0c          	shl    $0xc,%rax
  80207b:	c9                   	leaveq 
  80207c:	c3                   	retq   

000000000080207d <fd_alloc>:
  80207d:	55                   	push   %rbp
  80207e:	48 89 e5             	mov    %rsp,%rbp
  802081:	48 83 ec 18          	sub    $0x18,%rsp
  802085:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802089:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802090:	eb 6b                	jmp    8020fd <fd_alloc+0x80>
  802092:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802095:	48 98                	cltq   
  802097:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  80209d:	48 c1 e0 0c          	shl    $0xc,%rax
  8020a1:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8020a5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8020a9:	48 c1 e8 15          	shr    $0x15,%rax
  8020ad:	48 89 c2             	mov    %rax,%rdx
  8020b0:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8020b7:	01 00 00 
  8020ba:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8020be:	83 e0 01             	and    $0x1,%eax
  8020c1:	48 85 c0             	test   %rax,%rax
  8020c4:	74 21                	je     8020e7 <fd_alloc+0x6a>
  8020c6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8020ca:	48 c1 e8 0c          	shr    $0xc,%rax
  8020ce:	48 89 c2             	mov    %rax,%rdx
  8020d1:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8020d8:	01 00 00 
  8020db:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8020df:	83 e0 01             	and    $0x1,%eax
  8020e2:	48 85 c0             	test   %rax,%rax
  8020e5:	75 12                	jne    8020f9 <fd_alloc+0x7c>
  8020e7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8020eb:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8020ef:	48 89 10             	mov    %rdx,(%rax)
  8020f2:	b8 00 00 00 00       	mov    $0x0,%eax
  8020f7:	eb 1a                	jmp    802113 <fd_alloc+0x96>
  8020f9:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8020fd:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802101:	7e 8f                	jle    802092 <fd_alloc+0x15>
  802103:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802107:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  80210e:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  802113:	c9                   	leaveq 
  802114:	c3                   	retq   

0000000000802115 <fd_lookup>:
  802115:	55                   	push   %rbp
  802116:	48 89 e5             	mov    %rsp,%rbp
  802119:	48 83 ec 20          	sub    $0x20,%rsp
  80211d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802120:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802124:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802128:	78 06                	js     802130 <fd_lookup+0x1b>
  80212a:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  80212e:	7e 07                	jle    802137 <fd_lookup+0x22>
  802130:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802135:	eb 6c                	jmp    8021a3 <fd_lookup+0x8e>
  802137:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80213a:	48 98                	cltq   
  80213c:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802142:	48 c1 e0 0c          	shl    $0xc,%rax
  802146:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80214a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80214e:	48 c1 e8 15          	shr    $0x15,%rax
  802152:	48 89 c2             	mov    %rax,%rdx
  802155:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  80215c:	01 00 00 
  80215f:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802163:	83 e0 01             	and    $0x1,%eax
  802166:	48 85 c0             	test   %rax,%rax
  802169:	74 21                	je     80218c <fd_lookup+0x77>
  80216b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80216f:	48 c1 e8 0c          	shr    $0xc,%rax
  802173:	48 89 c2             	mov    %rax,%rdx
  802176:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80217d:	01 00 00 
  802180:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802184:	83 e0 01             	and    $0x1,%eax
  802187:	48 85 c0             	test   %rax,%rax
  80218a:	75 07                	jne    802193 <fd_lookup+0x7e>
  80218c:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802191:	eb 10                	jmp    8021a3 <fd_lookup+0x8e>
  802193:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802197:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80219b:	48 89 10             	mov    %rdx,(%rax)
  80219e:	b8 00 00 00 00       	mov    $0x0,%eax
  8021a3:	c9                   	leaveq 
  8021a4:	c3                   	retq   

00000000008021a5 <fd_close>:
  8021a5:	55                   	push   %rbp
  8021a6:	48 89 e5             	mov    %rsp,%rbp
  8021a9:	48 83 ec 30          	sub    $0x30,%rsp
  8021ad:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8021b1:	89 f0                	mov    %esi,%eax
  8021b3:	88 45 d4             	mov    %al,-0x2c(%rbp)
  8021b6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8021ba:	48 89 c7             	mov    %rax,%rdi
  8021bd:	48 b8 2f 20 80 00 00 	movabs $0x80202f,%rax
  8021c4:	00 00 00 
  8021c7:	ff d0                	callq  *%rax
  8021c9:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8021cd:	48 89 d6             	mov    %rdx,%rsi
  8021d0:	89 c7                	mov    %eax,%edi
  8021d2:	48 b8 15 21 80 00 00 	movabs $0x802115,%rax
  8021d9:	00 00 00 
  8021dc:	ff d0                	callq  *%rax
  8021de:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8021e1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8021e5:	78 0a                	js     8021f1 <fd_close+0x4c>
  8021e7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8021eb:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  8021ef:	74 12                	je     802203 <fd_close+0x5e>
  8021f1:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  8021f5:	74 05                	je     8021fc <fd_close+0x57>
  8021f7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8021fa:	eb 05                	jmp    802201 <fd_close+0x5c>
  8021fc:	b8 00 00 00 00       	mov    $0x0,%eax
  802201:	eb 69                	jmp    80226c <fd_close+0xc7>
  802203:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802207:	8b 00                	mov    (%rax),%eax
  802209:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80220d:	48 89 d6             	mov    %rdx,%rsi
  802210:	89 c7                	mov    %eax,%edi
  802212:	48 b8 6e 22 80 00 00 	movabs $0x80226e,%rax
  802219:	00 00 00 
  80221c:	ff d0                	callq  *%rax
  80221e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802221:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802225:	78 2a                	js     802251 <fd_close+0xac>
  802227:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80222b:	48 8b 40 20          	mov    0x20(%rax),%rax
  80222f:	48 85 c0             	test   %rax,%rax
  802232:	74 16                	je     80224a <fd_close+0xa5>
  802234:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802238:	48 8b 40 20          	mov    0x20(%rax),%rax
  80223c:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802240:	48 89 d7             	mov    %rdx,%rdi
  802243:	ff d0                	callq  *%rax
  802245:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802248:	eb 07                	jmp    802251 <fd_close+0xac>
  80224a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802251:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802255:	48 89 c6             	mov    %rax,%rsi
  802258:	bf 00 00 00 00       	mov    $0x0,%edi
  80225d:	48 b8 17 19 80 00 00 	movabs $0x801917,%rax
  802264:	00 00 00 
  802267:	ff d0                	callq  *%rax
  802269:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80226c:	c9                   	leaveq 
  80226d:	c3                   	retq   

000000000080226e <dev_lookup>:
  80226e:	55                   	push   %rbp
  80226f:	48 89 e5             	mov    %rsp,%rbp
  802272:	48 83 ec 20          	sub    $0x20,%rsp
  802276:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802279:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80227d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802284:	eb 41                	jmp    8022c7 <dev_lookup+0x59>
  802286:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  80228d:	00 00 00 
  802290:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802293:	48 63 d2             	movslq %edx,%rdx
  802296:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80229a:	8b 00                	mov    (%rax),%eax
  80229c:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  80229f:	75 22                	jne    8022c3 <dev_lookup+0x55>
  8022a1:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  8022a8:	00 00 00 
  8022ab:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8022ae:	48 63 d2             	movslq %edx,%rdx
  8022b1:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  8022b5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8022b9:	48 89 10             	mov    %rdx,(%rax)
  8022bc:	b8 00 00 00 00       	mov    $0x0,%eax
  8022c1:	eb 60                	jmp    802323 <dev_lookup+0xb5>
  8022c3:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8022c7:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  8022ce:	00 00 00 
  8022d1:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8022d4:	48 63 d2             	movslq %edx,%rdx
  8022d7:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8022db:	48 85 c0             	test   %rax,%rax
  8022de:	75 a6                	jne    802286 <dev_lookup+0x18>
  8022e0:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8022e7:	00 00 00 
  8022ea:	48 8b 00             	mov    (%rax),%rax
  8022ed:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8022f3:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8022f6:	89 c6                	mov    %eax,%esi
  8022f8:	48 bf b8 4c 80 00 00 	movabs $0x804cb8,%rdi
  8022ff:	00 00 00 
  802302:	b8 00 00 00 00       	mov    $0x0,%eax
  802307:	48 b9 88 03 80 00 00 	movabs $0x800388,%rcx
  80230e:	00 00 00 
  802311:	ff d1                	callq  *%rcx
  802313:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802317:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  80231e:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802323:	c9                   	leaveq 
  802324:	c3                   	retq   

0000000000802325 <close>:
  802325:	55                   	push   %rbp
  802326:	48 89 e5             	mov    %rsp,%rbp
  802329:	48 83 ec 20          	sub    $0x20,%rsp
  80232d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802330:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802334:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802337:	48 89 d6             	mov    %rdx,%rsi
  80233a:	89 c7                	mov    %eax,%edi
  80233c:	48 b8 15 21 80 00 00 	movabs $0x802115,%rax
  802343:	00 00 00 
  802346:	ff d0                	callq  *%rax
  802348:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80234b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80234f:	79 05                	jns    802356 <close+0x31>
  802351:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802354:	eb 18                	jmp    80236e <close+0x49>
  802356:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80235a:	be 01 00 00 00       	mov    $0x1,%esi
  80235f:	48 89 c7             	mov    %rax,%rdi
  802362:	48 b8 a5 21 80 00 00 	movabs $0x8021a5,%rax
  802369:	00 00 00 
  80236c:	ff d0                	callq  *%rax
  80236e:	c9                   	leaveq 
  80236f:	c3                   	retq   

0000000000802370 <close_all>:
  802370:	55                   	push   %rbp
  802371:	48 89 e5             	mov    %rsp,%rbp
  802374:	48 83 ec 10          	sub    $0x10,%rsp
  802378:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80237f:	eb 15                	jmp    802396 <close_all+0x26>
  802381:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802384:	89 c7                	mov    %eax,%edi
  802386:	48 b8 25 23 80 00 00 	movabs $0x802325,%rax
  80238d:	00 00 00 
  802390:	ff d0                	callq  *%rax
  802392:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802396:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  80239a:	7e e5                	jle    802381 <close_all+0x11>
  80239c:	c9                   	leaveq 
  80239d:	c3                   	retq   

000000000080239e <dup>:
  80239e:	55                   	push   %rbp
  80239f:	48 89 e5             	mov    %rsp,%rbp
  8023a2:	48 83 ec 40          	sub    $0x40,%rsp
  8023a6:	89 7d cc             	mov    %edi,-0x34(%rbp)
  8023a9:	89 75 c8             	mov    %esi,-0x38(%rbp)
  8023ac:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  8023b0:	8b 45 cc             	mov    -0x34(%rbp),%eax
  8023b3:	48 89 d6             	mov    %rdx,%rsi
  8023b6:	89 c7                	mov    %eax,%edi
  8023b8:	48 b8 15 21 80 00 00 	movabs $0x802115,%rax
  8023bf:	00 00 00 
  8023c2:	ff d0                	callq  *%rax
  8023c4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8023c7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8023cb:	79 08                	jns    8023d5 <dup+0x37>
  8023cd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023d0:	e9 70 01 00 00       	jmpq   802545 <dup+0x1a7>
  8023d5:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8023d8:	89 c7                	mov    %eax,%edi
  8023da:	48 b8 25 23 80 00 00 	movabs $0x802325,%rax
  8023e1:	00 00 00 
  8023e4:	ff d0                	callq  *%rax
  8023e6:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8023e9:	48 98                	cltq   
  8023eb:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  8023f1:	48 c1 e0 0c          	shl    $0xc,%rax
  8023f5:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8023f9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8023fd:	48 89 c7             	mov    %rax,%rdi
  802400:	48 b8 52 20 80 00 00 	movabs $0x802052,%rax
  802407:	00 00 00 
  80240a:	ff d0                	callq  *%rax
  80240c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802410:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802414:	48 89 c7             	mov    %rax,%rdi
  802417:	48 b8 52 20 80 00 00 	movabs $0x802052,%rax
  80241e:	00 00 00 
  802421:	ff d0                	callq  *%rax
  802423:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802427:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80242b:	48 c1 e8 15          	shr    $0x15,%rax
  80242f:	48 89 c2             	mov    %rax,%rdx
  802432:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802439:	01 00 00 
  80243c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802440:	83 e0 01             	and    $0x1,%eax
  802443:	48 85 c0             	test   %rax,%rax
  802446:	74 73                	je     8024bb <dup+0x11d>
  802448:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80244c:	48 c1 e8 0c          	shr    $0xc,%rax
  802450:	48 89 c2             	mov    %rax,%rdx
  802453:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80245a:	01 00 00 
  80245d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802461:	83 e0 01             	and    $0x1,%eax
  802464:	48 85 c0             	test   %rax,%rax
  802467:	74 52                	je     8024bb <dup+0x11d>
  802469:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80246d:	48 c1 e8 0c          	shr    $0xc,%rax
  802471:	48 89 c2             	mov    %rax,%rdx
  802474:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80247b:	01 00 00 
  80247e:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802482:	25 07 0e 00 00       	and    $0xe07,%eax
  802487:	89 c1                	mov    %eax,%ecx
  802489:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80248d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802491:	41 89 c8             	mov    %ecx,%r8d
  802494:	48 89 d1             	mov    %rdx,%rcx
  802497:	ba 00 00 00 00       	mov    $0x0,%edx
  80249c:	48 89 c6             	mov    %rax,%rsi
  80249f:	bf 00 00 00 00       	mov    $0x0,%edi
  8024a4:	48 b8 bc 18 80 00 00 	movabs $0x8018bc,%rax
  8024ab:	00 00 00 
  8024ae:	ff d0                	callq  *%rax
  8024b0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8024b3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8024b7:	79 02                	jns    8024bb <dup+0x11d>
  8024b9:	eb 57                	jmp    802512 <dup+0x174>
  8024bb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8024bf:	48 c1 e8 0c          	shr    $0xc,%rax
  8024c3:	48 89 c2             	mov    %rax,%rdx
  8024c6:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8024cd:	01 00 00 
  8024d0:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8024d4:	25 07 0e 00 00       	and    $0xe07,%eax
  8024d9:	89 c1                	mov    %eax,%ecx
  8024db:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8024df:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8024e3:	41 89 c8             	mov    %ecx,%r8d
  8024e6:	48 89 d1             	mov    %rdx,%rcx
  8024e9:	ba 00 00 00 00       	mov    $0x0,%edx
  8024ee:	48 89 c6             	mov    %rax,%rsi
  8024f1:	bf 00 00 00 00       	mov    $0x0,%edi
  8024f6:	48 b8 bc 18 80 00 00 	movabs $0x8018bc,%rax
  8024fd:	00 00 00 
  802500:	ff d0                	callq  *%rax
  802502:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802505:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802509:	79 02                	jns    80250d <dup+0x16f>
  80250b:	eb 05                	jmp    802512 <dup+0x174>
  80250d:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802510:	eb 33                	jmp    802545 <dup+0x1a7>
  802512:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802516:	48 89 c6             	mov    %rax,%rsi
  802519:	bf 00 00 00 00       	mov    $0x0,%edi
  80251e:	48 b8 17 19 80 00 00 	movabs $0x801917,%rax
  802525:	00 00 00 
  802528:	ff d0                	callq  *%rax
  80252a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80252e:	48 89 c6             	mov    %rax,%rsi
  802531:	bf 00 00 00 00       	mov    $0x0,%edi
  802536:	48 b8 17 19 80 00 00 	movabs $0x801917,%rax
  80253d:	00 00 00 
  802540:	ff d0                	callq  *%rax
  802542:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802545:	c9                   	leaveq 
  802546:	c3                   	retq   

0000000000802547 <read>:
  802547:	55                   	push   %rbp
  802548:	48 89 e5             	mov    %rsp,%rbp
  80254b:	48 83 ec 40          	sub    $0x40,%rsp
  80254f:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802552:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802556:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80255a:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80255e:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802561:	48 89 d6             	mov    %rdx,%rsi
  802564:	89 c7                	mov    %eax,%edi
  802566:	48 b8 15 21 80 00 00 	movabs $0x802115,%rax
  80256d:	00 00 00 
  802570:	ff d0                	callq  *%rax
  802572:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802575:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802579:	78 24                	js     80259f <read+0x58>
  80257b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80257f:	8b 00                	mov    (%rax),%eax
  802581:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802585:	48 89 d6             	mov    %rdx,%rsi
  802588:	89 c7                	mov    %eax,%edi
  80258a:	48 b8 6e 22 80 00 00 	movabs $0x80226e,%rax
  802591:	00 00 00 
  802594:	ff d0                	callq  *%rax
  802596:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802599:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80259d:	79 05                	jns    8025a4 <read+0x5d>
  80259f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8025a2:	eb 76                	jmp    80261a <read+0xd3>
  8025a4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8025a8:	8b 40 08             	mov    0x8(%rax),%eax
  8025ab:	83 e0 03             	and    $0x3,%eax
  8025ae:	83 f8 01             	cmp    $0x1,%eax
  8025b1:	75 3a                	jne    8025ed <read+0xa6>
  8025b3:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8025ba:	00 00 00 
  8025bd:	48 8b 00             	mov    (%rax),%rax
  8025c0:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8025c6:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8025c9:	89 c6                	mov    %eax,%esi
  8025cb:	48 bf d7 4c 80 00 00 	movabs $0x804cd7,%rdi
  8025d2:	00 00 00 
  8025d5:	b8 00 00 00 00       	mov    $0x0,%eax
  8025da:	48 b9 88 03 80 00 00 	movabs $0x800388,%rcx
  8025e1:	00 00 00 
  8025e4:	ff d1                	callq  *%rcx
  8025e6:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8025eb:	eb 2d                	jmp    80261a <read+0xd3>
  8025ed:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8025f1:	48 8b 40 10          	mov    0x10(%rax),%rax
  8025f5:	48 85 c0             	test   %rax,%rax
  8025f8:	75 07                	jne    802601 <read+0xba>
  8025fa:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8025ff:	eb 19                	jmp    80261a <read+0xd3>
  802601:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802605:	48 8b 40 10          	mov    0x10(%rax),%rax
  802609:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80260d:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802611:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802615:	48 89 cf             	mov    %rcx,%rdi
  802618:	ff d0                	callq  *%rax
  80261a:	c9                   	leaveq 
  80261b:	c3                   	retq   

000000000080261c <readn>:
  80261c:	55                   	push   %rbp
  80261d:	48 89 e5             	mov    %rsp,%rbp
  802620:	48 83 ec 30          	sub    $0x30,%rsp
  802624:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802627:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80262b:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80262f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802636:	eb 49                	jmp    802681 <readn+0x65>
  802638:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80263b:	48 98                	cltq   
  80263d:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802641:	48 29 c2             	sub    %rax,%rdx
  802644:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802647:	48 63 c8             	movslq %eax,%rcx
  80264a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80264e:	48 01 c1             	add    %rax,%rcx
  802651:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802654:	48 89 ce             	mov    %rcx,%rsi
  802657:	89 c7                	mov    %eax,%edi
  802659:	48 b8 47 25 80 00 00 	movabs $0x802547,%rax
  802660:	00 00 00 
  802663:	ff d0                	callq  *%rax
  802665:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802668:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80266c:	79 05                	jns    802673 <readn+0x57>
  80266e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802671:	eb 1c                	jmp    80268f <readn+0x73>
  802673:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802677:	75 02                	jne    80267b <readn+0x5f>
  802679:	eb 11                	jmp    80268c <readn+0x70>
  80267b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80267e:	01 45 fc             	add    %eax,-0x4(%rbp)
  802681:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802684:	48 98                	cltq   
  802686:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  80268a:	72 ac                	jb     802638 <readn+0x1c>
  80268c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80268f:	c9                   	leaveq 
  802690:	c3                   	retq   

0000000000802691 <write>:
  802691:	55                   	push   %rbp
  802692:	48 89 e5             	mov    %rsp,%rbp
  802695:	48 83 ec 40          	sub    $0x40,%rsp
  802699:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80269c:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8026a0:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8026a4:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8026a8:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8026ab:	48 89 d6             	mov    %rdx,%rsi
  8026ae:	89 c7                	mov    %eax,%edi
  8026b0:	48 b8 15 21 80 00 00 	movabs $0x802115,%rax
  8026b7:	00 00 00 
  8026ba:	ff d0                	callq  *%rax
  8026bc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8026bf:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8026c3:	78 24                	js     8026e9 <write+0x58>
  8026c5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8026c9:	8b 00                	mov    (%rax),%eax
  8026cb:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8026cf:	48 89 d6             	mov    %rdx,%rsi
  8026d2:	89 c7                	mov    %eax,%edi
  8026d4:	48 b8 6e 22 80 00 00 	movabs $0x80226e,%rax
  8026db:	00 00 00 
  8026de:	ff d0                	callq  *%rax
  8026e0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8026e3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8026e7:	79 05                	jns    8026ee <write+0x5d>
  8026e9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8026ec:	eb 75                	jmp    802763 <write+0xd2>
  8026ee:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8026f2:	8b 40 08             	mov    0x8(%rax),%eax
  8026f5:	83 e0 03             	and    $0x3,%eax
  8026f8:	85 c0                	test   %eax,%eax
  8026fa:	75 3a                	jne    802736 <write+0xa5>
  8026fc:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  802703:	00 00 00 
  802706:	48 8b 00             	mov    (%rax),%rax
  802709:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80270f:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802712:	89 c6                	mov    %eax,%esi
  802714:	48 bf f3 4c 80 00 00 	movabs $0x804cf3,%rdi
  80271b:	00 00 00 
  80271e:	b8 00 00 00 00       	mov    $0x0,%eax
  802723:	48 b9 88 03 80 00 00 	movabs $0x800388,%rcx
  80272a:	00 00 00 
  80272d:	ff d1                	callq  *%rcx
  80272f:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802734:	eb 2d                	jmp    802763 <write+0xd2>
  802736:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80273a:	48 8b 40 18          	mov    0x18(%rax),%rax
  80273e:	48 85 c0             	test   %rax,%rax
  802741:	75 07                	jne    80274a <write+0xb9>
  802743:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802748:	eb 19                	jmp    802763 <write+0xd2>
  80274a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80274e:	48 8b 40 18          	mov    0x18(%rax),%rax
  802752:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802756:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80275a:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  80275e:	48 89 cf             	mov    %rcx,%rdi
  802761:	ff d0                	callq  *%rax
  802763:	c9                   	leaveq 
  802764:	c3                   	retq   

0000000000802765 <seek>:
  802765:	55                   	push   %rbp
  802766:	48 89 e5             	mov    %rsp,%rbp
  802769:	48 83 ec 18          	sub    $0x18,%rsp
  80276d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802770:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802773:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802777:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80277a:	48 89 d6             	mov    %rdx,%rsi
  80277d:	89 c7                	mov    %eax,%edi
  80277f:	48 b8 15 21 80 00 00 	movabs $0x802115,%rax
  802786:	00 00 00 
  802789:	ff d0                	callq  *%rax
  80278b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80278e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802792:	79 05                	jns    802799 <seek+0x34>
  802794:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802797:	eb 0f                	jmp    8027a8 <seek+0x43>
  802799:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80279d:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8027a0:	89 50 04             	mov    %edx,0x4(%rax)
  8027a3:	b8 00 00 00 00       	mov    $0x0,%eax
  8027a8:	c9                   	leaveq 
  8027a9:	c3                   	retq   

00000000008027aa <ftruncate>:
  8027aa:	55                   	push   %rbp
  8027ab:	48 89 e5             	mov    %rsp,%rbp
  8027ae:	48 83 ec 30          	sub    $0x30,%rsp
  8027b2:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8027b5:	89 75 d8             	mov    %esi,-0x28(%rbp)
  8027b8:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8027bc:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8027bf:	48 89 d6             	mov    %rdx,%rsi
  8027c2:	89 c7                	mov    %eax,%edi
  8027c4:	48 b8 15 21 80 00 00 	movabs $0x802115,%rax
  8027cb:	00 00 00 
  8027ce:	ff d0                	callq  *%rax
  8027d0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8027d3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8027d7:	78 24                	js     8027fd <ftruncate+0x53>
  8027d9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8027dd:	8b 00                	mov    (%rax),%eax
  8027df:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8027e3:	48 89 d6             	mov    %rdx,%rsi
  8027e6:	89 c7                	mov    %eax,%edi
  8027e8:	48 b8 6e 22 80 00 00 	movabs $0x80226e,%rax
  8027ef:	00 00 00 
  8027f2:	ff d0                	callq  *%rax
  8027f4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8027f7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8027fb:	79 05                	jns    802802 <ftruncate+0x58>
  8027fd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802800:	eb 72                	jmp    802874 <ftruncate+0xca>
  802802:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802806:	8b 40 08             	mov    0x8(%rax),%eax
  802809:	83 e0 03             	and    $0x3,%eax
  80280c:	85 c0                	test   %eax,%eax
  80280e:	75 3a                	jne    80284a <ftruncate+0xa0>
  802810:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  802817:	00 00 00 
  80281a:	48 8b 00             	mov    (%rax),%rax
  80281d:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802823:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802826:	89 c6                	mov    %eax,%esi
  802828:	48 bf 10 4d 80 00 00 	movabs $0x804d10,%rdi
  80282f:	00 00 00 
  802832:	b8 00 00 00 00       	mov    $0x0,%eax
  802837:	48 b9 88 03 80 00 00 	movabs $0x800388,%rcx
  80283e:	00 00 00 
  802841:	ff d1                	callq  *%rcx
  802843:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802848:	eb 2a                	jmp    802874 <ftruncate+0xca>
  80284a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80284e:	48 8b 40 30          	mov    0x30(%rax),%rax
  802852:	48 85 c0             	test   %rax,%rax
  802855:	75 07                	jne    80285e <ftruncate+0xb4>
  802857:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80285c:	eb 16                	jmp    802874 <ftruncate+0xca>
  80285e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802862:	48 8b 40 30          	mov    0x30(%rax),%rax
  802866:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80286a:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  80286d:	89 ce                	mov    %ecx,%esi
  80286f:	48 89 d7             	mov    %rdx,%rdi
  802872:	ff d0                	callq  *%rax
  802874:	c9                   	leaveq 
  802875:	c3                   	retq   

0000000000802876 <fstat>:
  802876:	55                   	push   %rbp
  802877:	48 89 e5             	mov    %rsp,%rbp
  80287a:	48 83 ec 30          	sub    $0x30,%rsp
  80287e:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802881:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802885:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802889:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80288c:	48 89 d6             	mov    %rdx,%rsi
  80288f:	89 c7                	mov    %eax,%edi
  802891:	48 b8 15 21 80 00 00 	movabs $0x802115,%rax
  802898:	00 00 00 
  80289b:	ff d0                	callq  *%rax
  80289d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8028a0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8028a4:	78 24                	js     8028ca <fstat+0x54>
  8028a6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8028aa:	8b 00                	mov    (%rax),%eax
  8028ac:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8028b0:	48 89 d6             	mov    %rdx,%rsi
  8028b3:	89 c7                	mov    %eax,%edi
  8028b5:	48 b8 6e 22 80 00 00 	movabs $0x80226e,%rax
  8028bc:	00 00 00 
  8028bf:	ff d0                	callq  *%rax
  8028c1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8028c4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8028c8:	79 05                	jns    8028cf <fstat+0x59>
  8028ca:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8028cd:	eb 5e                	jmp    80292d <fstat+0xb7>
  8028cf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8028d3:	48 8b 40 28          	mov    0x28(%rax),%rax
  8028d7:	48 85 c0             	test   %rax,%rax
  8028da:	75 07                	jne    8028e3 <fstat+0x6d>
  8028dc:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8028e1:	eb 4a                	jmp    80292d <fstat+0xb7>
  8028e3:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8028e7:	c6 00 00             	movb   $0x0,(%rax)
  8028ea:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8028ee:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  8028f5:	00 00 00 
  8028f8:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8028fc:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  802903:	00 00 00 
  802906:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80290a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80290e:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  802915:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802919:	48 8b 40 28          	mov    0x28(%rax),%rax
  80291d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802921:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  802925:	48 89 ce             	mov    %rcx,%rsi
  802928:	48 89 d7             	mov    %rdx,%rdi
  80292b:	ff d0                	callq  *%rax
  80292d:	c9                   	leaveq 
  80292e:	c3                   	retq   

000000000080292f <stat>:
  80292f:	55                   	push   %rbp
  802930:	48 89 e5             	mov    %rsp,%rbp
  802933:	48 83 ec 20          	sub    $0x20,%rsp
  802937:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80293b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80293f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802943:	be 00 00 00 00       	mov    $0x0,%esi
  802948:	48 89 c7             	mov    %rax,%rdi
  80294b:	48 b8 1d 2a 80 00 00 	movabs $0x802a1d,%rax
  802952:	00 00 00 
  802955:	ff d0                	callq  *%rax
  802957:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80295a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80295e:	79 05                	jns    802965 <stat+0x36>
  802960:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802963:	eb 2f                	jmp    802994 <stat+0x65>
  802965:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802969:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80296c:	48 89 d6             	mov    %rdx,%rsi
  80296f:	89 c7                	mov    %eax,%edi
  802971:	48 b8 76 28 80 00 00 	movabs $0x802876,%rax
  802978:	00 00 00 
  80297b:	ff d0                	callq  *%rax
  80297d:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802980:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802983:	89 c7                	mov    %eax,%edi
  802985:	48 b8 25 23 80 00 00 	movabs $0x802325,%rax
  80298c:	00 00 00 
  80298f:	ff d0                	callq  *%rax
  802991:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802994:	c9                   	leaveq 
  802995:	c3                   	retq   

0000000000802996 <fsipc>:
  802996:	55                   	push   %rbp
  802997:	48 89 e5             	mov    %rsp,%rbp
  80299a:	48 83 ec 10          	sub    $0x10,%rsp
  80299e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8029a1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8029a5:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8029ac:	00 00 00 
  8029af:	8b 00                	mov    (%rax),%eax
  8029b1:	85 c0                	test   %eax,%eax
  8029b3:	75 1d                	jne    8029d2 <fsipc+0x3c>
  8029b5:	bf 01 00 00 00       	mov    $0x1,%edi
  8029ba:	48 b8 51 46 80 00 00 	movabs $0x804651,%rax
  8029c1:	00 00 00 
  8029c4:	ff d0                	callq  *%rax
  8029c6:	48 ba 00 70 80 00 00 	movabs $0x807000,%rdx
  8029cd:	00 00 00 
  8029d0:	89 02                	mov    %eax,(%rdx)
  8029d2:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8029d9:	00 00 00 
  8029dc:	8b 00                	mov    (%rax),%eax
  8029de:	8b 75 fc             	mov    -0x4(%rbp),%esi
  8029e1:	b9 07 00 00 00       	mov    $0x7,%ecx
  8029e6:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  8029ed:	00 00 00 
  8029f0:	89 c7                	mov    %eax,%edi
  8029f2:	48 b8 bb 45 80 00 00 	movabs $0x8045bb,%rax
  8029f9:	00 00 00 
  8029fc:	ff d0                	callq  *%rax
  8029fe:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802a02:	ba 00 00 00 00       	mov    $0x0,%edx
  802a07:	48 89 c6             	mov    %rax,%rsi
  802a0a:	bf 00 00 00 00       	mov    $0x0,%edi
  802a0f:	48 b8 fa 44 80 00 00 	movabs $0x8044fa,%rax
  802a16:	00 00 00 
  802a19:	ff d0                	callq  *%rax
  802a1b:	c9                   	leaveq 
  802a1c:	c3                   	retq   

0000000000802a1d <open>:
  802a1d:	55                   	push   %rbp
  802a1e:	48 89 e5             	mov    %rsp,%rbp
  802a21:	48 83 ec 20          	sub    $0x20,%rsp
  802a25:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802a29:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  802a2c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802a30:	48 89 c7             	mov    %rax,%rdi
  802a33:	48 b8 d1 0e 80 00 00 	movabs $0x800ed1,%rax
  802a3a:	00 00 00 
  802a3d:	ff d0                	callq  *%rax
  802a3f:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802a44:	7e 0a                	jle    802a50 <open+0x33>
  802a46:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802a4b:	e9 a5 00 00 00       	jmpq   802af5 <open+0xd8>
  802a50:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802a54:	48 89 c7             	mov    %rax,%rdi
  802a57:	48 b8 7d 20 80 00 00 	movabs $0x80207d,%rax
  802a5e:	00 00 00 
  802a61:	ff d0                	callq  *%rax
  802a63:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802a66:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802a6a:	79 08                	jns    802a74 <open+0x57>
  802a6c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a6f:	e9 81 00 00 00       	jmpq   802af5 <open+0xd8>
  802a74:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802a78:	48 89 c6             	mov    %rax,%rsi
  802a7b:	48 bf 00 80 80 00 00 	movabs $0x808000,%rdi
  802a82:	00 00 00 
  802a85:	48 b8 3d 0f 80 00 00 	movabs $0x800f3d,%rax
  802a8c:	00 00 00 
  802a8f:	ff d0                	callq  *%rax
  802a91:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802a98:	00 00 00 
  802a9b:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  802a9e:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  802aa4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802aa8:	48 89 c6             	mov    %rax,%rsi
  802aab:	bf 01 00 00 00       	mov    $0x1,%edi
  802ab0:	48 b8 96 29 80 00 00 	movabs $0x802996,%rax
  802ab7:	00 00 00 
  802aba:	ff d0                	callq  *%rax
  802abc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802abf:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ac3:	79 1d                	jns    802ae2 <open+0xc5>
  802ac5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ac9:	be 00 00 00 00       	mov    $0x0,%esi
  802ace:	48 89 c7             	mov    %rax,%rdi
  802ad1:	48 b8 a5 21 80 00 00 	movabs $0x8021a5,%rax
  802ad8:	00 00 00 
  802adb:	ff d0                	callq  *%rax
  802add:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ae0:	eb 13                	jmp    802af5 <open+0xd8>
  802ae2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ae6:	48 89 c7             	mov    %rax,%rdi
  802ae9:	48 b8 2f 20 80 00 00 	movabs $0x80202f,%rax
  802af0:	00 00 00 
  802af3:	ff d0                	callq  *%rax
  802af5:	c9                   	leaveq 
  802af6:	c3                   	retq   

0000000000802af7 <devfile_flush>:
  802af7:	55                   	push   %rbp
  802af8:	48 89 e5             	mov    %rsp,%rbp
  802afb:	48 83 ec 10          	sub    $0x10,%rsp
  802aff:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802b03:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802b07:	8b 50 0c             	mov    0xc(%rax),%edx
  802b0a:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802b11:	00 00 00 
  802b14:	89 10                	mov    %edx,(%rax)
  802b16:	be 00 00 00 00       	mov    $0x0,%esi
  802b1b:	bf 06 00 00 00       	mov    $0x6,%edi
  802b20:	48 b8 96 29 80 00 00 	movabs $0x802996,%rax
  802b27:	00 00 00 
  802b2a:	ff d0                	callq  *%rax
  802b2c:	c9                   	leaveq 
  802b2d:	c3                   	retq   

0000000000802b2e <devfile_read>:
  802b2e:	55                   	push   %rbp
  802b2f:	48 89 e5             	mov    %rsp,%rbp
  802b32:	48 83 ec 30          	sub    $0x30,%rsp
  802b36:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802b3a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802b3e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802b42:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b46:	8b 50 0c             	mov    0xc(%rax),%edx
  802b49:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802b50:	00 00 00 
  802b53:	89 10                	mov    %edx,(%rax)
  802b55:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802b5c:	00 00 00 
  802b5f:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802b63:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802b67:	be 00 00 00 00       	mov    $0x0,%esi
  802b6c:	bf 03 00 00 00       	mov    $0x3,%edi
  802b71:	48 b8 96 29 80 00 00 	movabs $0x802996,%rax
  802b78:	00 00 00 
  802b7b:	ff d0                	callq  *%rax
  802b7d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b80:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b84:	79 08                	jns    802b8e <devfile_read+0x60>
  802b86:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b89:	e9 a4 00 00 00       	jmpq   802c32 <devfile_read+0x104>
  802b8e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b91:	48 98                	cltq   
  802b93:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802b97:	76 35                	jbe    802bce <devfile_read+0xa0>
  802b99:	48 b9 36 4d 80 00 00 	movabs $0x804d36,%rcx
  802ba0:	00 00 00 
  802ba3:	48 ba 3d 4d 80 00 00 	movabs $0x804d3d,%rdx
  802baa:	00 00 00 
  802bad:	be 89 00 00 00       	mov    $0x89,%esi
  802bb2:	48 bf 52 4d 80 00 00 	movabs $0x804d52,%rdi
  802bb9:	00 00 00 
  802bbc:	b8 00 00 00 00       	mov    $0x0,%eax
  802bc1:	49 b8 e6 43 80 00 00 	movabs $0x8043e6,%r8
  802bc8:	00 00 00 
  802bcb:	41 ff d0             	callq  *%r8
  802bce:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  802bd5:	7e 35                	jle    802c0c <devfile_read+0xde>
  802bd7:	48 b9 60 4d 80 00 00 	movabs $0x804d60,%rcx
  802bde:	00 00 00 
  802be1:	48 ba 3d 4d 80 00 00 	movabs $0x804d3d,%rdx
  802be8:	00 00 00 
  802beb:	be 8a 00 00 00       	mov    $0x8a,%esi
  802bf0:	48 bf 52 4d 80 00 00 	movabs $0x804d52,%rdi
  802bf7:	00 00 00 
  802bfa:	b8 00 00 00 00       	mov    $0x0,%eax
  802bff:	49 b8 e6 43 80 00 00 	movabs $0x8043e6,%r8
  802c06:	00 00 00 
  802c09:	41 ff d0             	callq  *%r8
  802c0c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c0f:	48 63 d0             	movslq %eax,%rdx
  802c12:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802c16:	48 be 00 80 80 00 00 	movabs $0x808000,%rsi
  802c1d:	00 00 00 
  802c20:	48 89 c7             	mov    %rax,%rdi
  802c23:	48 b8 61 12 80 00 00 	movabs $0x801261,%rax
  802c2a:	00 00 00 
  802c2d:	ff d0                	callq  *%rax
  802c2f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c32:	c9                   	leaveq 
  802c33:	c3                   	retq   

0000000000802c34 <devfile_write>:
  802c34:	55                   	push   %rbp
  802c35:	48 89 e5             	mov    %rsp,%rbp
  802c38:	48 83 ec 40          	sub    $0x40,%rsp
  802c3c:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802c40:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802c44:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802c48:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  802c4c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802c50:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  802c57:	00 
  802c58:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802c5c:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  802c60:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  802c65:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  802c69:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802c6d:	8b 50 0c             	mov    0xc(%rax),%edx
  802c70:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802c77:	00 00 00 
  802c7a:	89 10                	mov    %edx,(%rax)
  802c7c:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802c83:	00 00 00 
  802c86:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802c8a:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802c8e:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802c92:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802c96:	48 89 c6             	mov    %rax,%rsi
  802c99:	48 bf 10 80 80 00 00 	movabs $0x808010,%rdi
  802ca0:	00 00 00 
  802ca3:	48 b8 61 12 80 00 00 	movabs $0x801261,%rax
  802caa:	00 00 00 
  802cad:	ff d0                	callq  *%rax
  802caf:	be 00 00 00 00       	mov    $0x0,%esi
  802cb4:	bf 04 00 00 00       	mov    $0x4,%edi
  802cb9:	48 b8 96 29 80 00 00 	movabs $0x802996,%rax
  802cc0:	00 00 00 
  802cc3:	ff d0                	callq  *%rax
  802cc5:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802cc8:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802ccc:	79 05                	jns    802cd3 <devfile_write+0x9f>
  802cce:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802cd1:	eb 43                	jmp    802d16 <devfile_write+0xe2>
  802cd3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802cd6:	48 98                	cltq   
  802cd8:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  802cdc:	76 35                	jbe    802d13 <devfile_write+0xdf>
  802cde:	48 b9 36 4d 80 00 00 	movabs $0x804d36,%rcx
  802ce5:	00 00 00 
  802ce8:	48 ba 3d 4d 80 00 00 	movabs $0x804d3d,%rdx
  802cef:	00 00 00 
  802cf2:	be a8 00 00 00       	mov    $0xa8,%esi
  802cf7:	48 bf 52 4d 80 00 00 	movabs $0x804d52,%rdi
  802cfe:	00 00 00 
  802d01:	b8 00 00 00 00       	mov    $0x0,%eax
  802d06:	49 b8 e6 43 80 00 00 	movabs $0x8043e6,%r8
  802d0d:	00 00 00 
  802d10:	41 ff d0             	callq  *%r8
  802d13:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802d16:	c9                   	leaveq 
  802d17:	c3                   	retq   

0000000000802d18 <devfile_stat>:
  802d18:	55                   	push   %rbp
  802d19:	48 89 e5             	mov    %rsp,%rbp
  802d1c:	48 83 ec 20          	sub    $0x20,%rsp
  802d20:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802d24:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802d28:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d2c:	8b 50 0c             	mov    0xc(%rax),%edx
  802d2f:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802d36:	00 00 00 
  802d39:	89 10                	mov    %edx,(%rax)
  802d3b:	be 00 00 00 00       	mov    $0x0,%esi
  802d40:	bf 05 00 00 00       	mov    $0x5,%edi
  802d45:	48 b8 96 29 80 00 00 	movabs $0x802996,%rax
  802d4c:	00 00 00 
  802d4f:	ff d0                	callq  *%rax
  802d51:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d54:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d58:	79 05                	jns    802d5f <devfile_stat+0x47>
  802d5a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d5d:	eb 56                	jmp    802db5 <devfile_stat+0x9d>
  802d5f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802d63:	48 be 00 80 80 00 00 	movabs $0x808000,%rsi
  802d6a:	00 00 00 
  802d6d:	48 89 c7             	mov    %rax,%rdi
  802d70:	48 b8 3d 0f 80 00 00 	movabs $0x800f3d,%rax
  802d77:	00 00 00 
  802d7a:	ff d0                	callq  *%rax
  802d7c:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802d83:	00 00 00 
  802d86:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  802d8c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802d90:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  802d96:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802d9d:	00 00 00 
  802da0:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  802da6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802daa:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  802db0:	b8 00 00 00 00       	mov    $0x0,%eax
  802db5:	c9                   	leaveq 
  802db6:	c3                   	retq   

0000000000802db7 <devfile_trunc>:
  802db7:	55                   	push   %rbp
  802db8:	48 89 e5             	mov    %rsp,%rbp
  802dbb:	48 83 ec 10          	sub    $0x10,%rsp
  802dbf:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802dc3:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802dc6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802dca:	8b 50 0c             	mov    0xc(%rax),%edx
  802dcd:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802dd4:	00 00 00 
  802dd7:	89 10                	mov    %edx,(%rax)
  802dd9:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802de0:	00 00 00 
  802de3:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802de6:	89 50 04             	mov    %edx,0x4(%rax)
  802de9:	be 00 00 00 00       	mov    $0x0,%esi
  802dee:	bf 02 00 00 00       	mov    $0x2,%edi
  802df3:	48 b8 96 29 80 00 00 	movabs $0x802996,%rax
  802dfa:	00 00 00 
  802dfd:	ff d0                	callq  *%rax
  802dff:	c9                   	leaveq 
  802e00:	c3                   	retq   

0000000000802e01 <remove>:
  802e01:	55                   	push   %rbp
  802e02:	48 89 e5             	mov    %rsp,%rbp
  802e05:	48 83 ec 10          	sub    $0x10,%rsp
  802e09:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802e0d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802e11:	48 89 c7             	mov    %rax,%rdi
  802e14:	48 b8 d1 0e 80 00 00 	movabs $0x800ed1,%rax
  802e1b:	00 00 00 
  802e1e:	ff d0                	callq  *%rax
  802e20:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802e25:	7e 07                	jle    802e2e <remove+0x2d>
  802e27:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802e2c:	eb 33                	jmp    802e61 <remove+0x60>
  802e2e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802e32:	48 89 c6             	mov    %rax,%rsi
  802e35:	48 bf 00 80 80 00 00 	movabs $0x808000,%rdi
  802e3c:	00 00 00 
  802e3f:	48 b8 3d 0f 80 00 00 	movabs $0x800f3d,%rax
  802e46:	00 00 00 
  802e49:	ff d0                	callq  *%rax
  802e4b:	be 00 00 00 00       	mov    $0x0,%esi
  802e50:	bf 07 00 00 00       	mov    $0x7,%edi
  802e55:	48 b8 96 29 80 00 00 	movabs $0x802996,%rax
  802e5c:	00 00 00 
  802e5f:	ff d0                	callq  *%rax
  802e61:	c9                   	leaveq 
  802e62:	c3                   	retq   

0000000000802e63 <sync>:
  802e63:	55                   	push   %rbp
  802e64:	48 89 e5             	mov    %rsp,%rbp
  802e67:	be 00 00 00 00       	mov    $0x0,%esi
  802e6c:	bf 08 00 00 00       	mov    $0x8,%edi
  802e71:	48 b8 96 29 80 00 00 	movabs $0x802996,%rax
  802e78:	00 00 00 
  802e7b:	ff d0                	callq  *%rax
  802e7d:	5d                   	pop    %rbp
  802e7e:	c3                   	retq   

0000000000802e7f <copy>:
  802e7f:	55                   	push   %rbp
  802e80:	48 89 e5             	mov    %rsp,%rbp
  802e83:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  802e8a:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  802e91:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  802e98:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  802e9f:	be 00 00 00 00       	mov    $0x0,%esi
  802ea4:	48 89 c7             	mov    %rax,%rdi
  802ea7:	48 b8 1d 2a 80 00 00 	movabs $0x802a1d,%rax
  802eae:	00 00 00 
  802eb1:	ff d0                	callq  *%rax
  802eb3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802eb6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802eba:	79 28                	jns    802ee4 <copy+0x65>
  802ebc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ebf:	89 c6                	mov    %eax,%esi
  802ec1:	48 bf 6c 4d 80 00 00 	movabs $0x804d6c,%rdi
  802ec8:	00 00 00 
  802ecb:	b8 00 00 00 00       	mov    $0x0,%eax
  802ed0:	48 ba 88 03 80 00 00 	movabs $0x800388,%rdx
  802ed7:	00 00 00 
  802eda:	ff d2                	callq  *%rdx
  802edc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802edf:	e9 74 01 00 00       	jmpq   803058 <copy+0x1d9>
  802ee4:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  802eeb:	be 01 01 00 00       	mov    $0x101,%esi
  802ef0:	48 89 c7             	mov    %rax,%rdi
  802ef3:	48 b8 1d 2a 80 00 00 	movabs $0x802a1d,%rax
  802efa:	00 00 00 
  802efd:	ff d0                	callq  *%rax
  802eff:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802f02:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802f06:	79 39                	jns    802f41 <copy+0xc2>
  802f08:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802f0b:	89 c6                	mov    %eax,%esi
  802f0d:	48 bf 82 4d 80 00 00 	movabs $0x804d82,%rdi
  802f14:	00 00 00 
  802f17:	b8 00 00 00 00       	mov    $0x0,%eax
  802f1c:	48 ba 88 03 80 00 00 	movabs $0x800388,%rdx
  802f23:	00 00 00 
  802f26:	ff d2                	callq  *%rdx
  802f28:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f2b:	89 c7                	mov    %eax,%edi
  802f2d:	48 b8 25 23 80 00 00 	movabs $0x802325,%rax
  802f34:	00 00 00 
  802f37:	ff d0                	callq  *%rax
  802f39:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802f3c:	e9 17 01 00 00       	jmpq   803058 <copy+0x1d9>
  802f41:	eb 74                	jmp    802fb7 <copy+0x138>
  802f43:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802f46:	48 63 d0             	movslq %eax,%rdx
  802f49:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802f50:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802f53:	48 89 ce             	mov    %rcx,%rsi
  802f56:	89 c7                	mov    %eax,%edi
  802f58:	48 b8 91 26 80 00 00 	movabs $0x802691,%rax
  802f5f:	00 00 00 
  802f62:	ff d0                	callq  *%rax
  802f64:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802f67:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802f6b:	79 4a                	jns    802fb7 <copy+0x138>
  802f6d:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802f70:	89 c6                	mov    %eax,%esi
  802f72:	48 bf 9c 4d 80 00 00 	movabs $0x804d9c,%rdi
  802f79:	00 00 00 
  802f7c:	b8 00 00 00 00       	mov    $0x0,%eax
  802f81:	48 ba 88 03 80 00 00 	movabs $0x800388,%rdx
  802f88:	00 00 00 
  802f8b:	ff d2                	callq  *%rdx
  802f8d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f90:	89 c7                	mov    %eax,%edi
  802f92:	48 b8 25 23 80 00 00 	movabs $0x802325,%rax
  802f99:	00 00 00 
  802f9c:	ff d0                	callq  *%rax
  802f9e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802fa1:	89 c7                	mov    %eax,%edi
  802fa3:	48 b8 25 23 80 00 00 	movabs $0x802325,%rax
  802faa:	00 00 00 
  802fad:	ff d0                	callq  *%rax
  802faf:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802fb2:	e9 a1 00 00 00       	jmpq   803058 <copy+0x1d9>
  802fb7:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802fbe:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802fc1:	ba 00 02 00 00       	mov    $0x200,%edx
  802fc6:	48 89 ce             	mov    %rcx,%rsi
  802fc9:	89 c7                	mov    %eax,%edi
  802fcb:	48 b8 47 25 80 00 00 	movabs $0x802547,%rax
  802fd2:	00 00 00 
  802fd5:	ff d0                	callq  *%rax
  802fd7:	89 45 f4             	mov    %eax,-0xc(%rbp)
  802fda:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802fde:	0f 8f 5f ff ff ff    	jg     802f43 <copy+0xc4>
  802fe4:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802fe8:	79 47                	jns    803031 <copy+0x1b2>
  802fea:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802fed:	89 c6                	mov    %eax,%esi
  802fef:	48 bf af 4d 80 00 00 	movabs $0x804daf,%rdi
  802ff6:	00 00 00 
  802ff9:	b8 00 00 00 00       	mov    $0x0,%eax
  802ffe:	48 ba 88 03 80 00 00 	movabs $0x800388,%rdx
  803005:	00 00 00 
  803008:	ff d2                	callq  *%rdx
  80300a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80300d:	89 c7                	mov    %eax,%edi
  80300f:	48 b8 25 23 80 00 00 	movabs $0x802325,%rax
  803016:	00 00 00 
  803019:	ff d0                	callq  *%rax
  80301b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80301e:	89 c7                	mov    %eax,%edi
  803020:	48 b8 25 23 80 00 00 	movabs $0x802325,%rax
  803027:	00 00 00 
  80302a:	ff d0                	callq  *%rax
  80302c:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80302f:	eb 27                	jmp    803058 <copy+0x1d9>
  803031:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803034:	89 c7                	mov    %eax,%edi
  803036:	48 b8 25 23 80 00 00 	movabs $0x802325,%rax
  80303d:	00 00 00 
  803040:	ff d0                	callq  *%rax
  803042:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803045:	89 c7                	mov    %eax,%edi
  803047:	48 b8 25 23 80 00 00 	movabs $0x802325,%rax
  80304e:	00 00 00 
  803051:	ff d0                	callq  *%rax
  803053:	b8 00 00 00 00       	mov    $0x0,%eax
  803058:	c9                   	leaveq 
  803059:	c3                   	retq   

000000000080305a <writebuf>:
  80305a:	55                   	push   %rbp
  80305b:	48 89 e5             	mov    %rsp,%rbp
  80305e:	48 83 ec 20          	sub    $0x20,%rsp
  803062:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803066:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80306a:	8b 40 0c             	mov    0xc(%rax),%eax
  80306d:	85 c0                	test   %eax,%eax
  80306f:	7e 67                	jle    8030d8 <writebuf+0x7e>
  803071:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803075:	8b 40 04             	mov    0x4(%rax),%eax
  803078:	48 63 d0             	movslq %eax,%rdx
  80307b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80307f:	48 8d 48 10          	lea    0x10(%rax),%rcx
  803083:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803087:	8b 00                	mov    (%rax),%eax
  803089:	48 89 ce             	mov    %rcx,%rsi
  80308c:	89 c7                	mov    %eax,%edi
  80308e:	48 b8 91 26 80 00 00 	movabs $0x802691,%rax
  803095:	00 00 00 
  803098:	ff d0                	callq  *%rax
  80309a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80309d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8030a1:	7e 13                	jle    8030b6 <writebuf+0x5c>
  8030a3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8030a7:	8b 50 08             	mov    0x8(%rax),%edx
  8030aa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030ad:	01 c2                	add    %eax,%edx
  8030af:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8030b3:	89 50 08             	mov    %edx,0x8(%rax)
  8030b6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8030ba:	8b 40 04             	mov    0x4(%rax),%eax
  8030bd:	3b 45 fc             	cmp    -0x4(%rbp),%eax
  8030c0:	74 16                	je     8030d8 <writebuf+0x7e>
  8030c2:	b8 00 00 00 00       	mov    $0x0,%eax
  8030c7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8030cb:	0f 4e 45 fc          	cmovle -0x4(%rbp),%eax
  8030cf:	89 c2                	mov    %eax,%edx
  8030d1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8030d5:	89 50 0c             	mov    %edx,0xc(%rax)
  8030d8:	c9                   	leaveq 
  8030d9:	c3                   	retq   

00000000008030da <putch>:
  8030da:	55                   	push   %rbp
  8030db:	48 89 e5             	mov    %rsp,%rbp
  8030de:	48 83 ec 20          	sub    $0x20,%rsp
  8030e2:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8030e5:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8030e9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8030ed:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8030f1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8030f5:	8b 40 04             	mov    0x4(%rax),%eax
  8030f8:	8d 48 01             	lea    0x1(%rax),%ecx
  8030fb:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8030ff:	89 4a 04             	mov    %ecx,0x4(%rdx)
  803102:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803105:	89 d1                	mov    %edx,%ecx
  803107:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80310b:	48 98                	cltq   
  80310d:	88 4c 02 10          	mov    %cl,0x10(%rdx,%rax,1)
  803111:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803115:	8b 40 04             	mov    0x4(%rax),%eax
  803118:	3d 00 01 00 00       	cmp    $0x100,%eax
  80311d:	75 1e                	jne    80313d <putch+0x63>
  80311f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803123:	48 89 c7             	mov    %rax,%rdi
  803126:	48 b8 5a 30 80 00 00 	movabs $0x80305a,%rax
  80312d:	00 00 00 
  803130:	ff d0                	callq  *%rax
  803132:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803136:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%rax)
  80313d:	c9                   	leaveq 
  80313e:	c3                   	retq   

000000000080313f <vfprintf>:
  80313f:	55                   	push   %rbp
  803140:	48 89 e5             	mov    %rsp,%rbp
  803143:	48 81 ec 30 01 00 00 	sub    $0x130,%rsp
  80314a:	89 bd ec fe ff ff    	mov    %edi,-0x114(%rbp)
  803150:	48 89 b5 e0 fe ff ff 	mov    %rsi,-0x120(%rbp)
  803157:	48 89 95 d8 fe ff ff 	mov    %rdx,-0x128(%rbp)
  80315e:	8b 85 ec fe ff ff    	mov    -0x114(%rbp),%eax
  803164:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%rbp)
  80316a:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  803171:	00 00 00 
  803174:	c7 85 f8 fe ff ff 00 	movl   $0x0,-0x108(%rbp)
  80317b:	00 00 00 
  80317e:	c7 85 fc fe ff ff 01 	movl   $0x1,-0x104(%rbp)
  803185:	00 00 00 
  803188:	48 8b 8d d8 fe ff ff 	mov    -0x128(%rbp),%rcx
  80318f:	48 8b 95 e0 fe ff ff 	mov    -0x120(%rbp),%rdx
  803196:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  80319d:	48 89 c6             	mov    %rax,%rsi
  8031a0:	48 bf da 30 80 00 00 	movabs $0x8030da,%rdi
  8031a7:	00 00 00 
  8031aa:	48 b8 3b 07 80 00 00 	movabs $0x80073b,%rax
  8031b1:	00 00 00 
  8031b4:	ff d0                	callq  *%rax
  8031b6:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  8031bc:	85 c0                	test   %eax,%eax
  8031be:	7e 16                	jle    8031d6 <vfprintf+0x97>
  8031c0:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  8031c7:	48 89 c7             	mov    %rax,%rdi
  8031ca:	48 b8 5a 30 80 00 00 	movabs $0x80305a,%rax
  8031d1:	00 00 00 
  8031d4:	ff d0                	callq  *%rax
  8031d6:	8b 85 f8 fe ff ff    	mov    -0x108(%rbp),%eax
  8031dc:	85 c0                	test   %eax,%eax
  8031de:	74 08                	je     8031e8 <vfprintf+0xa9>
  8031e0:	8b 85 f8 fe ff ff    	mov    -0x108(%rbp),%eax
  8031e6:	eb 06                	jmp    8031ee <vfprintf+0xaf>
  8031e8:	8b 85 fc fe ff ff    	mov    -0x104(%rbp),%eax
  8031ee:	c9                   	leaveq 
  8031ef:	c3                   	retq   

00000000008031f0 <fprintf>:
  8031f0:	55                   	push   %rbp
  8031f1:	48 89 e5             	mov    %rsp,%rbp
  8031f4:	48 81 ec e0 00 00 00 	sub    $0xe0,%rsp
  8031fb:	89 bd 2c ff ff ff    	mov    %edi,-0xd4(%rbp)
  803201:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  803208:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  80320f:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  803216:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  80321d:	84 c0                	test   %al,%al
  80321f:	74 20                	je     803241 <fprintf+0x51>
  803221:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  803225:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  803229:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  80322d:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  803231:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  803235:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  803239:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  80323d:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  803241:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  803248:	c7 85 30 ff ff ff 10 	movl   $0x10,-0xd0(%rbp)
  80324f:	00 00 00 
  803252:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  803259:	00 00 00 
  80325c:	48 8d 45 10          	lea    0x10(%rbp),%rax
  803260:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  803267:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  80326e:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  803275:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  80327c:	48 8b 8d 20 ff ff ff 	mov    -0xe0(%rbp),%rcx
  803283:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  803289:	48 89 ce             	mov    %rcx,%rsi
  80328c:	89 c7                	mov    %eax,%edi
  80328e:	48 b8 3f 31 80 00 00 	movabs $0x80313f,%rax
  803295:	00 00 00 
  803298:	ff d0                	callq  *%rax
  80329a:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  8032a0:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  8032a6:	c9                   	leaveq 
  8032a7:	c3                   	retq   

00000000008032a8 <printf>:
  8032a8:	55                   	push   %rbp
  8032a9:	48 89 e5             	mov    %rsp,%rbp
  8032ac:	48 81 ec e0 00 00 00 	sub    $0xe0,%rsp
  8032b3:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  8032ba:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  8032c1:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8032c8:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8032cf:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8032d6:	84 c0                	test   %al,%al
  8032d8:	74 20                	je     8032fa <printf+0x52>
  8032da:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8032de:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8032e2:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8032e6:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8032ea:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8032ee:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8032f2:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8032f6:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8032fa:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  803301:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  803308:	00 00 00 
  80330b:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  803312:	00 00 00 
  803315:	48 8d 45 10          	lea    0x10(%rbp),%rax
  803319:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  803320:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  803327:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  80332e:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  803335:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  80333c:	48 89 c6             	mov    %rax,%rsi
  80333f:	bf 01 00 00 00       	mov    $0x1,%edi
  803344:	48 b8 3f 31 80 00 00 	movabs $0x80313f,%rax
  80334b:	00 00 00 
  80334e:	ff d0                	callq  *%rax
  803350:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  803356:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  80335c:	c9                   	leaveq 
  80335d:	c3                   	retq   

000000000080335e <fd2sockid>:
  80335e:	55                   	push   %rbp
  80335f:	48 89 e5             	mov    %rsp,%rbp
  803362:	48 83 ec 20          	sub    $0x20,%rsp
  803366:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803369:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80336d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803370:	48 89 d6             	mov    %rdx,%rsi
  803373:	89 c7                	mov    %eax,%edi
  803375:	48 b8 15 21 80 00 00 	movabs $0x802115,%rax
  80337c:	00 00 00 
  80337f:	ff d0                	callq  *%rax
  803381:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803384:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803388:	79 05                	jns    80338f <fd2sockid+0x31>
  80338a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80338d:	eb 24                	jmp    8033b3 <fd2sockid+0x55>
  80338f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803393:	8b 10                	mov    (%rax),%edx
  803395:	48 b8 a0 60 80 00 00 	movabs $0x8060a0,%rax
  80339c:	00 00 00 
  80339f:	8b 00                	mov    (%rax),%eax
  8033a1:	39 c2                	cmp    %eax,%edx
  8033a3:	74 07                	je     8033ac <fd2sockid+0x4e>
  8033a5:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8033aa:	eb 07                	jmp    8033b3 <fd2sockid+0x55>
  8033ac:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8033b0:	8b 40 0c             	mov    0xc(%rax),%eax
  8033b3:	c9                   	leaveq 
  8033b4:	c3                   	retq   

00000000008033b5 <alloc_sockfd>:
  8033b5:	55                   	push   %rbp
  8033b6:	48 89 e5             	mov    %rsp,%rbp
  8033b9:	48 83 ec 20          	sub    $0x20,%rsp
  8033bd:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8033c0:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8033c4:	48 89 c7             	mov    %rax,%rdi
  8033c7:	48 b8 7d 20 80 00 00 	movabs $0x80207d,%rax
  8033ce:	00 00 00 
  8033d1:	ff d0                	callq  *%rax
  8033d3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8033d6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8033da:	78 26                	js     803402 <alloc_sockfd+0x4d>
  8033dc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8033e0:	ba 07 04 00 00       	mov    $0x407,%edx
  8033e5:	48 89 c6             	mov    %rax,%rsi
  8033e8:	bf 00 00 00 00       	mov    $0x0,%edi
  8033ed:	48 b8 6c 18 80 00 00 	movabs $0x80186c,%rax
  8033f4:	00 00 00 
  8033f7:	ff d0                	callq  *%rax
  8033f9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8033fc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803400:	79 16                	jns    803418 <alloc_sockfd+0x63>
  803402:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803405:	89 c7                	mov    %eax,%edi
  803407:	48 b8 c2 38 80 00 00 	movabs $0x8038c2,%rax
  80340e:	00 00 00 
  803411:	ff d0                	callq  *%rax
  803413:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803416:	eb 3a                	jmp    803452 <alloc_sockfd+0x9d>
  803418:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80341c:	48 ba a0 60 80 00 00 	movabs $0x8060a0,%rdx
  803423:	00 00 00 
  803426:	8b 12                	mov    (%rdx),%edx
  803428:	89 10                	mov    %edx,(%rax)
  80342a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80342e:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  803435:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803439:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80343c:	89 50 0c             	mov    %edx,0xc(%rax)
  80343f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803443:	48 89 c7             	mov    %rax,%rdi
  803446:	48 b8 2f 20 80 00 00 	movabs $0x80202f,%rax
  80344d:	00 00 00 
  803450:	ff d0                	callq  *%rax
  803452:	c9                   	leaveq 
  803453:	c3                   	retq   

0000000000803454 <accept>:
  803454:	55                   	push   %rbp
  803455:	48 89 e5             	mov    %rsp,%rbp
  803458:	48 83 ec 30          	sub    $0x30,%rsp
  80345c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80345f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803463:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803467:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80346a:	89 c7                	mov    %eax,%edi
  80346c:	48 b8 5e 33 80 00 00 	movabs $0x80335e,%rax
  803473:	00 00 00 
  803476:	ff d0                	callq  *%rax
  803478:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80347b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80347f:	79 05                	jns    803486 <accept+0x32>
  803481:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803484:	eb 3b                	jmp    8034c1 <accept+0x6d>
  803486:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80348a:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80348e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803491:	48 89 ce             	mov    %rcx,%rsi
  803494:	89 c7                	mov    %eax,%edi
  803496:	48 b8 9f 37 80 00 00 	movabs $0x80379f,%rax
  80349d:	00 00 00 
  8034a0:	ff d0                	callq  *%rax
  8034a2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8034a5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8034a9:	79 05                	jns    8034b0 <accept+0x5c>
  8034ab:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034ae:	eb 11                	jmp    8034c1 <accept+0x6d>
  8034b0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034b3:	89 c7                	mov    %eax,%edi
  8034b5:	48 b8 b5 33 80 00 00 	movabs $0x8033b5,%rax
  8034bc:	00 00 00 
  8034bf:	ff d0                	callq  *%rax
  8034c1:	c9                   	leaveq 
  8034c2:	c3                   	retq   

00000000008034c3 <bind>:
  8034c3:	55                   	push   %rbp
  8034c4:	48 89 e5             	mov    %rsp,%rbp
  8034c7:	48 83 ec 20          	sub    $0x20,%rsp
  8034cb:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8034ce:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8034d2:	89 55 e8             	mov    %edx,-0x18(%rbp)
  8034d5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8034d8:	89 c7                	mov    %eax,%edi
  8034da:	48 b8 5e 33 80 00 00 	movabs $0x80335e,%rax
  8034e1:	00 00 00 
  8034e4:	ff d0                	callq  *%rax
  8034e6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8034e9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8034ed:	79 05                	jns    8034f4 <bind+0x31>
  8034ef:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034f2:	eb 1b                	jmp    80350f <bind+0x4c>
  8034f4:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8034f7:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8034fb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034fe:	48 89 ce             	mov    %rcx,%rsi
  803501:	89 c7                	mov    %eax,%edi
  803503:	48 b8 1e 38 80 00 00 	movabs $0x80381e,%rax
  80350a:	00 00 00 
  80350d:	ff d0                	callq  *%rax
  80350f:	c9                   	leaveq 
  803510:	c3                   	retq   

0000000000803511 <shutdown>:
  803511:	55                   	push   %rbp
  803512:	48 89 e5             	mov    %rsp,%rbp
  803515:	48 83 ec 20          	sub    $0x20,%rsp
  803519:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80351c:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80351f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803522:	89 c7                	mov    %eax,%edi
  803524:	48 b8 5e 33 80 00 00 	movabs $0x80335e,%rax
  80352b:	00 00 00 
  80352e:	ff d0                	callq  *%rax
  803530:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803533:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803537:	79 05                	jns    80353e <shutdown+0x2d>
  803539:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80353c:	eb 16                	jmp    803554 <shutdown+0x43>
  80353e:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803541:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803544:	89 d6                	mov    %edx,%esi
  803546:	89 c7                	mov    %eax,%edi
  803548:	48 b8 82 38 80 00 00 	movabs $0x803882,%rax
  80354f:	00 00 00 
  803552:	ff d0                	callq  *%rax
  803554:	c9                   	leaveq 
  803555:	c3                   	retq   

0000000000803556 <devsock_close>:
  803556:	55                   	push   %rbp
  803557:	48 89 e5             	mov    %rsp,%rbp
  80355a:	48 83 ec 10          	sub    $0x10,%rsp
  80355e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803562:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803566:	48 89 c7             	mov    %rax,%rdi
  803569:	48 b8 c3 46 80 00 00 	movabs $0x8046c3,%rax
  803570:	00 00 00 
  803573:	ff d0                	callq  *%rax
  803575:	83 f8 01             	cmp    $0x1,%eax
  803578:	75 17                	jne    803591 <devsock_close+0x3b>
  80357a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80357e:	8b 40 0c             	mov    0xc(%rax),%eax
  803581:	89 c7                	mov    %eax,%edi
  803583:	48 b8 c2 38 80 00 00 	movabs $0x8038c2,%rax
  80358a:	00 00 00 
  80358d:	ff d0                	callq  *%rax
  80358f:	eb 05                	jmp    803596 <devsock_close+0x40>
  803591:	b8 00 00 00 00       	mov    $0x0,%eax
  803596:	c9                   	leaveq 
  803597:	c3                   	retq   

0000000000803598 <connect>:
  803598:	55                   	push   %rbp
  803599:	48 89 e5             	mov    %rsp,%rbp
  80359c:	48 83 ec 20          	sub    $0x20,%rsp
  8035a0:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8035a3:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8035a7:	89 55 e8             	mov    %edx,-0x18(%rbp)
  8035aa:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8035ad:	89 c7                	mov    %eax,%edi
  8035af:	48 b8 5e 33 80 00 00 	movabs $0x80335e,%rax
  8035b6:	00 00 00 
  8035b9:	ff d0                	callq  *%rax
  8035bb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8035be:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8035c2:	79 05                	jns    8035c9 <connect+0x31>
  8035c4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035c7:	eb 1b                	jmp    8035e4 <connect+0x4c>
  8035c9:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8035cc:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8035d0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035d3:	48 89 ce             	mov    %rcx,%rsi
  8035d6:	89 c7                	mov    %eax,%edi
  8035d8:	48 b8 ef 38 80 00 00 	movabs $0x8038ef,%rax
  8035df:	00 00 00 
  8035e2:	ff d0                	callq  *%rax
  8035e4:	c9                   	leaveq 
  8035e5:	c3                   	retq   

00000000008035e6 <listen>:
  8035e6:	55                   	push   %rbp
  8035e7:	48 89 e5             	mov    %rsp,%rbp
  8035ea:	48 83 ec 20          	sub    $0x20,%rsp
  8035ee:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8035f1:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8035f4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8035f7:	89 c7                	mov    %eax,%edi
  8035f9:	48 b8 5e 33 80 00 00 	movabs $0x80335e,%rax
  803600:	00 00 00 
  803603:	ff d0                	callq  *%rax
  803605:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803608:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80360c:	79 05                	jns    803613 <listen+0x2d>
  80360e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803611:	eb 16                	jmp    803629 <listen+0x43>
  803613:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803616:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803619:	89 d6                	mov    %edx,%esi
  80361b:	89 c7                	mov    %eax,%edi
  80361d:	48 b8 53 39 80 00 00 	movabs $0x803953,%rax
  803624:	00 00 00 
  803627:	ff d0                	callq  *%rax
  803629:	c9                   	leaveq 
  80362a:	c3                   	retq   

000000000080362b <devsock_read>:
  80362b:	55                   	push   %rbp
  80362c:	48 89 e5             	mov    %rsp,%rbp
  80362f:	48 83 ec 20          	sub    $0x20,%rsp
  803633:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803637:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80363b:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80363f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803643:	89 c2                	mov    %eax,%edx
  803645:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803649:	8b 40 0c             	mov    0xc(%rax),%eax
  80364c:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803650:	b9 00 00 00 00       	mov    $0x0,%ecx
  803655:	89 c7                	mov    %eax,%edi
  803657:	48 b8 93 39 80 00 00 	movabs $0x803993,%rax
  80365e:	00 00 00 
  803661:	ff d0                	callq  *%rax
  803663:	c9                   	leaveq 
  803664:	c3                   	retq   

0000000000803665 <devsock_write>:
  803665:	55                   	push   %rbp
  803666:	48 89 e5             	mov    %rsp,%rbp
  803669:	48 83 ec 20          	sub    $0x20,%rsp
  80366d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803671:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803675:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803679:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80367d:	89 c2                	mov    %eax,%edx
  80367f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803683:	8b 40 0c             	mov    0xc(%rax),%eax
  803686:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  80368a:	b9 00 00 00 00       	mov    $0x0,%ecx
  80368f:	89 c7                	mov    %eax,%edi
  803691:	48 b8 5f 3a 80 00 00 	movabs $0x803a5f,%rax
  803698:	00 00 00 
  80369b:	ff d0                	callq  *%rax
  80369d:	c9                   	leaveq 
  80369e:	c3                   	retq   

000000000080369f <devsock_stat>:
  80369f:	55                   	push   %rbp
  8036a0:	48 89 e5             	mov    %rsp,%rbp
  8036a3:	48 83 ec 10          	sub    $0x10,%rsp
  8036a7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8036ab:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8036af:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8036b3:	48 be ca 4d 80 00 00 	movabs $0x804dca,%rsi
  8036ba:	00 00 00 
  8036bd:	48 89 c7             	mov    %rax,%rdi
  8036c0:	48 b8 3d 0f 80 00 00 	movabs $0x800f3d,%rax
  8036c7:	00 00 00 
  8036ca:	ff d0                	callq  *%rax
  8036cc:	b8 00 00 00 00       	mov    $0x0,%eax
  8036d1:	c9                   	leaveq 
  8036d2:	c3                   	retq   

00000000008036d3 <socket>:
  8036d3:	55                   	push   %rbp
  8036d4:	48 89 e5             	mov    %rsp,%rbp
  8036d7:	48 83 ec 20          	sub    $0x20,%rsp
  8036db:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8036de:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8036e1:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  8036e4:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8036e7:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  8036ea:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8036ed:	89 ce                	mov    %ecx,%esi
  8036ef:	89 c7                	mov    %eax,%edi
  8036f1:	48 b8 17 3b 80 00 00 	movabs $0x803b17,%rax
  8036f8:	00 00 00 
  8036fb:	ff d0                	callq  *%rax
  8036fd:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803700:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803704:	79 05                	jns    80370b <socket+0x38>
  803706:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803709:	eb 11                	jmp    80371c <socket+0x49>
  80370b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80370e:	89 c7                	mov    %eax,%edi
  803710:	48 b8 b5 33 80 00 00 	movabs $0x8033b5,%rax
  803717:	00 00 00 
  80371a:	ff d0                	callq  *%rax
  80371c:	c9                   	leaveq 
  80371d:	c3                   	retq   

000000000080371e <nsipc>:
  80371e:	55                   	push   %rbp
  80371f:	48 89 e5             	mov    %rsp,%rbp
  803722:	48 83 ec 10          	sub    $0x10,%rsp
  803726:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803729:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  803730:	00 00 00 
  803733:	8b 00                	mov    (%rax),%eax
  803735:	85 c0                	test   %eax,%eax
  803737:	75 1d                	jne    803756 <nsipc+0x38>
  803739:	bf 02 00 00 00       	mov    $0x2,%edi
  80373e:	48 b8 51 46 80 00 00 	movabs $0x804651,%rax
  803745:	00 00 00 
  803748:	ff d0                	callq  *%rax
  80374a:	48 ba 04 70 80 00 00 	movabs $0x807004,%rdx
  803751:	00 00 00 
  803754:	89 02                	mov    %eax,(%rdx)
  803756:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  80375d:	00 00 00 
  803760:	8b 00                	mov    (%rax),%eax
  803762:	8b 75 fc             	mov    -0x4(%rbp),%esi
  803765:	b9 07 00 00 00       	mov    $0x7,%ecx
  80376a:	48 ba 00 a0 80 00 00 	movabs $0x80a000,%rdx
  803771:	00 00 00 
  803774:	89 c7                	mov    %eax,%edi
  803776:	48 b8 bb 45 80 00 00 	movabs $0x8045bb,%rax
  80377d:	00 00 00 
  803780:	ff d0                	callq  *%rax
  803782:	ba 00 00 00 00       	mov    $0x0,%edx
  803787:	be 00 00 00 00       	mov    $0x0,%esi
  80378c:	bf 00 00 00 00       	mov    $0x0,%edi
  803791:	48 b8 fa 44 80 00 00 	movabs $0x8044fa,%rax
  803798:	00 00 00 
  80379b:	ff d0                	callq  *%rax
  80379d:	c9                   	leaveq 
  80379e:	c3                   	retq   

000000000080379f <nsipc_accept>:
  80379f:	55                   	push   %rbp
  8037a0:	48 89 e5             	mov    %rsp,%rbp
  8037a3:	48 83 ec 30          	sub    $0x30,%rsp
  8037a7:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8037aa:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8037ae:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8037b2:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8037b9:	00 00 00 
  8037bc:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8037bf:	89 10                	mov    %edx,(%rax)
  8037c1:	bf 01 00 00 00       	mov    $0x1,%edi
  8037c6:	48 b8 1e 37 80 00 00 	movabs $0x80371e,%rax
  8037cd:	00 00 00 
  8037d0:	ff d0                	callq  *%rax
  8037d2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8037d5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8037d9:	78 3e                	js     803819 <nsipc_accept+0x7a>
  8037db:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8037e2:	00 00 00 
  8037e5:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8037e9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8037ed:	8b 40 10             	mov    0x10(%rax),%eax
  8037f0:	89 c2                	mov    %eax,%edx
  8037f2:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8037f6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8037fa:	48 89 ce             	mov    %rcx,%rsi
  8037fd:	48 89 c7             	mov    %rax,%rdi
  803800:	48 b8 61 12 80 00 00 	movabs $0x801261,%rax
  803807:	00 00 00 
  80380a:	ff d0                	callq  *%rax
  80380c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803810:	8b 50 10             	mov    0x10(%rax),%edx
  803813:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803817:	89 10                	mov    %edx,(%rax)
  803819:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80381c:	c9                   	leaveq 
  80381d:	c3                   	retq   

000000000080381e <nsipc_bind>:
  80381e:	55                   	push   %rbp
  80381f:	48 89 e5             	mov    %rsp,%rbp
  803822:	48 83 ec 10          	sub    $0x10,%rsp
  803826:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803829:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80382d:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803830:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803837:	00 00 00 
  80383a:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80383d:	89 10                	mov    %edx,(%rax)
  80383f:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803842:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803846:	48 89 c6             	mov    %rax,%rsi
  803849:	48 bf 04 a0 80 00 00 	movabs $0x80a004,%rdi
  803850:	00 00 00 
  803853:	48 b8 61 12 80 00 00 	movabs $0x801261,%rax
  80385a:	00 00 00 
  80385d:	ff d0                	callq  *%rax
  80385f:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803866:	00 00 00 
  803869:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80386c:	89 50 14             	mov    %edx,0x14(%rax)
  80386f:	bf 02 00 00 00       	mov    $0x2,%edi
  803874:	48 b8 1e 37 80 00 00 	movabs $0x80371e,%rax
  80387b:	00 00 00 
  80387e:	ff d0                	callq  *%rax
  803880:	c9                   	leaveq 
  803881:	c3                   	retq   

0000000000803882 <nsipc_shutdown>:
  803882:	55                   	push   %rbp
  803883:	48 89 e5             	mov    %rsp,%rbp
  803886:	48 83 ec 10          	sub    $0x10,%rsp
  80388a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80388d:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803890:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803897:	00 00 00 
  80389a:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80389d:	89 10                	mov    %edx,(%rax)
  80389f:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8038a6:	00 00 00 
  8038a9:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8038ac:	89 50 04             	mov    %edx,0x4(%rax)
  8038af:	bf 03 00 00 00       	mov    $0x3,%edi
  8038b4:	48 b8 1e 37 80 00 00 	movabs $0x80371e,%rax
  8038bb:	00 00 00 
  8038be:	ff d0                	callq  *%rax
  8038c0:	c9                   	leaveq 
  8038c1:	c3                   	retq   

00000000008038c2 <nsipc_close>:
  8038c2:	55                   	push   %rbp
  8038c3:	48 89 e5             	mov    %rsp,%rbp
  8038c6:	48 83 ec 10          	sub    $0x10,%rsp
  8038ca:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8038cd:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8038d4:	00 00 00 
  8038d7:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8038da:	89 10                	mov    %edx,(%rax)
  8038dc:	bf 04 00 00 00       	mov    $0x4,%edi
  8038e1:	48 b8 1e 37 80 00 00 	movabs $0x80371e,%rax
  8038e8:	00 00 00 
  8038eb:	ff d0                	callq  *%rax
  8038ed:	c9                   	leaveq 
  8038ee:	c3                   	retq   

00000000008038ef <nsipc_connect>:
  8038ef:	55                   	push   %rbp
  8038f0:	48 89 e5             	mov    %rsp,%rbp
  8038f3:	48 83 ec 10          	sub    $0x10,%rsp
  8038f7:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8038fa:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8038fe:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803901:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803908:	00 00 00 
  80390b:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80390e:	89 10                	mov    %edx,(%rax)
  803910:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803913:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803917:	48 89 c6             	mov    %rax,%rsi
  80391a:	48 bf 04 a0 80 00 00 	movabs $0x80a004,%rdi
  803921:	00 00 00 
  803924:	48 b8 61 12 80 00 00 	movabs $0x801261,%rax
  80392b:	00 00 00 
  80392e:	ff d0                	callq  *%rax
  803930:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803937:	00 00 00 
  80393a:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80393d:	89 50 14             	mov    %edx,0x14(%rax)
  803940:	bf 05 00 00 00       	mov    $0x5,%edi
  803945:	48 b8 1e 37 80 00 00 	movabs $0x80371e,%rax
  80394c:	00 00 00 
  80394f:	ff d0                	callq  *%rax
  803951:	c9                   	leaveq 
  803952:	c3                   	retq   

0000000000803953 <nsipc_listen>:
  803953:	55                   	push   %rbp
  803954:	48 89 e5             	mov    %rsp,%rbp
  803957:	48 83 ec 10          	sub    $0x10,%rsp
  80395b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80395e:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803961:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803968:	00 00 00 
  80396b:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80396e:	89 10                	mov    %edx,(%rax)
  803970:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803977:	00 00 00 
  80397a:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80397d:	89 50 04             	mov    %edx,0x4(%rax)
  803980:	bf 06 00 00 00       	mov    $0x6,%edi
  803985:	48 b8 1e 37 80 00 00 	movabs $0x80371e,%rax
  80398c:	00 00 00 
  80398f:	ff d0                	callq  *%rax
  803991:	c9                   	leaveq 
  803992:	c3                   	retq   

0000000000803993 <nsipc_recv>:
  803993:	55                   	push   %rbp
  803994:	48 89 e5             	mov    %rsp,%rbp
  803997:	48 83 ec 30          	sub    $0x30,%rsp
  80399b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80399e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8039a2:	89 55 e8             	mov    %edx,-0x18(%rbp)
  8039a5:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  8039a8:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8039af:	00 00 00 
  8039b2:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8039b5:	89 10                	mov    %edx,(%rax)
  8039b7:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8039be:	00 00 00 
  8039c1:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8039c4:	89 50 04             	mov    %edx,0x4(%rax)
  8039c7:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8039ce:	00 00 00 
  8039d1:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8039d4:	89 50 08             	mov    %edx,0x8(%rax)
  8039d7:	bf 07 00 00 00       	mov    $0x7,%edi
  8039dc:	48 b8 1e 37 80 00 00 	movabs $0x80371e,%rax
  8039e3:	00 00 00 
  8039e6:	ff d0                	callq  *%rax
  8039e8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8039eb:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8039ef:	78 69                	js     803a5a <nsipc_recv+0xc7>
  8039f1:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  8039f8:	7f 08                	jg     803a02 <nsipc_recv+0x6f>
  8039fa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039fd:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  803a00:	7e 35                	jle    803a37 <nsipc_recv+0xa4>
  803a02:	48 b9 d1 4d 80 00 00 	movabs $0x804dd1,%rcx
  803a09:	00 00 00 
  803a0c:	48 ba e6 4d 80 00 00 	movabs $0x804de6,%rdx
  803a13:	00 00 00 
  803a16:	be 62 00 00 00       	mov    $0x62,%esi
  803a1b:	48 bf fb 4d 80 00 00 	movabs $0x804dfb,%rdi
  803a22:	00 00 00 
  803a25:	b8 00 00 00 00       	mov    $0x0,%eax
  803a2a:	49 b8 e6 43 80 00 00 	movabs $0x8043e6,%r8
  803a31:	00 00 00 
  803a34:	41 ff d0             	callq  *%r8
  803a37:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a3a:	48 63 d0             	movslq %eax,%rdx
  803a3d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803a41:	48 be 00 a0 80 00 00 	movabs $0x80a000,%rsi
  803a48:	00 00 00 
  803a4b:	48 89 c7             	mov    %rax,%rdi
  803a4e:	48 b8 61 12 80 00 00 	movabs $0x801261,%rax
  803a55:	00 00 00 
  803a58:	ff d0                	callq  *%rax
  803a5a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a5d:	c9                   	leaveq 
  803a5e:	c3                   	retq   

0000000000803a5f <nsipc_send>:
  803a5f:	55                   	push   %rbp
  803a60:	48 89 e5             	mov    %rsp,%rbp
  803a63:	48 83 ec 20          	sub    $0x20,%rsp
  803a67:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803a6a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803a6e:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803a71:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  803a74:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803a7b:	00 00 00 
  803a7e:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803a81:	89 10                	mov    %edx,(%rax)
  803a83:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  803a8a:	7e 35                	jle    803ac1 <nsipc_send+0x62>
  803a8c:	48 b9 0a 4e 80 00 00 	movabs $0x804e0a,%rcx
  803a93:	00 00 00 
  803a96:	48 ba e6 4d 80 00 00 	movabs $0x804de6,%rdx
  803a9d:	00 00 00 
  803aa0:	be 6d 00 00 00       	mov    $0x6d,%esi
  803aa5:	48 bf fb 4d 80 00 00 	movabs $0x804dfb,%rdi
  803aac:	00 00 00 
  803aaf:	b8 00 00 00 00       	mov    $0x0,%eax
  803ab4:	49 b8 e6 43 80 00 00 	movabs $0x8043e6,%r8
  803abb:	00 00 00 
  803abe:	41 ff d0             	callq  *%r8
  803ac1:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803ac4:	48 63 d0             	movslq %eax,%rdx
  803ac7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803acb:	48 89 c6             	mov    %rax,%rsi
  803ace:	48 bf 0c a0 80 00 00 	movabs $0x80a00c,%rdi
  803ad5:	00 00 00 
  803ad8:	48 b8 61 12 80 00 00 	movabs $0x801261,%rax
  803adf:	00 00 00 
  803ae2:	ff d0                	callq  *%rax
  803ae4:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803aeb:	00 00 00 
  803aee:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803af1:	89 50 04             	mov    %edx,0x4(%rax)
  803af4:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803afb:	00 00 00 
  803afe:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803b01:	89 50 08             	mov    %edx,0x8(%rax)
  803b04:	bf 08 00 00 00       	mov    $0x8,%edi
  803b09:	48 b8 1e 37 80 00 00 	movabs $0x80371e,%rax
  803b10:	00 00 00 
  803b13:	ff d0                	callq  *%rax
  803b15:	c9                   	leaveq 
  803b16:	c3                   	retq   

0000000000803b17 <nsipc_socket>:
  803b17:	55                   	push   %rbp
  803b18:	48 89 e5             	mov    %rsp,%rbp
  803b1b:	48 83 ec 10          	sub    $0x10,%rsp
  803b1f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803b22:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803b25:	89 55 f4             	mov    %edx,-0xc(%rbp)
  803b28:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803b2f:	00 00 00 
  803b32:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803b35:	89 10                	mov    %edx,(%rax)
  803b37:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803b3e:	00 00 00 
  803b41:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803b44:	89 50 04             	mov    %edx,0x4(%rax)
  803b47:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803b4e:	00 00 00 
  803b51:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803b54:	89 50 08             	mov    %edx,0x8(%rax)
  803b57:	bf 09 00 00 00       	mov    $0x9,%edi
  803b5c:	48 b8 1e 37 80 00 00 	movabs $0x80371e,%rax
  803b63:	00 00 00 
  803b66:	ff d0                	callq  *%rax
  803b68:	c9                   	leaveq 
  803b69:	c3                   	retq   

0000000000803b6a <pipe>:
  803b6a:	55                   	push   %rbp
  803b6b:	48 89 e5             	mov    %rsp,%rbp
  803b6e:	53                   	push   %rbx
  803b6f:	48 83 ec 38          	sub    $0x38,%rsp
  803b73:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  803b77:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  803b7b:	48 89 c7             	mov    %rax,%rdi
  803b7e:	48 b8 7d 20 80 00 00 	movabs $0x80207d,%rax
  803b85:	00 00 00 
  803b88:	ff d0                	callq  *%rax
  803b8a:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803b8d:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803b91:	0f 88 bf 01 00 00    	js     803d56 <pipe+0x1ec>
  803b97:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803b9b:	ba 07 04 00 00       	mov    $0x407,%edx
  803ba0:	48 89 c6             	mov    %rax,%rsi
  803ba3:	bf 00 00 00 00       	mov    $0x0,%edi
  803ba8:	48 b8 6c 18 80 00 00 	movabs $0x80186c,%rax
  803baf:	00 00 00 
  803bb2:	ff d0                	callq  *%rax
  803bb4:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803bb7:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803bbb:	0f 88 95 01 00 00    	js     803d56 <pipe+0x1ec>
  803bc1:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  803bc5:	48 89 c7             	mov    %rax,%rdi
  803bc8:	48 b8 7d 20 80 00 00 	movabs $0x80207d,%rax
  803bcf:	00 00 00 
  803bd2:	ff d0                	callq  *%rax
  803bd4:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803bd7:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803bdb:	0f 88 5d 01 00 00    	js     803d3e <pipe+0x1d4>
  803be1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803be5:	ba 07 04 00 00       	mov    $0x407,%edx
  803bea:	48 89 c6             	mov    %rax,%rsi
  803bed:	bf 00 00 00 00       	mov    $0x0,%edi
  803bf2:	48 b8 6c 18 80 00 00 	movabs $0x80186c,%rax
  803bf9:	00 00 00 
  803bfc:	ff d0                	callq  *%rax
  803bfe:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803c01:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803c05:	0f 88 33 01 00 00    	js     803d3e <pipe+0x1d4>
  803c0b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803c0f:	48 89 c7             	mov    %rax,%rdi
  803c12:	48 b8 52 20 80 00 00 	movabs $0x802052,%rax
  803c19:	00 00 00 
  803c1c:	ff d0                	callq  *%rax
  803c1e:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803c22:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803c26:	ba 07 04 00 00       	mov    $0x407,%edx
  803c2b:	48 89 c6             	mov    %rax,%rsi
  803c2e:	bf 00 00 00 00       	mov    $0x0,%edi
  803c33:	48 b8 6c 18 80 00 00 	movabs $0x80186c,%rax
  803c3a:	00 00 00 
  803c3d:	ff d0                	callq  *%rax
  803c3f:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803c42:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803c46:	79 05                	jns    803c4d <pipe+0xe3>
  803c48:	e9 d9 00 00 00       	jmpq   803d26 <pipe+0x1bc>
  803c4d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803c51:	48 89 c7             	mov    %rax,%rdi
  803c54:	48 b8 52 20 80 00 00 	movabs $0x802052,%rax
  803c5b:	00 00 00 
  803c5e:	ff d0                	callq  *%rax
  803c60:	48 89 c2             	mov    %rax,%rdx
  803c63:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803c67:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  803c6d:	48 89 d1             	mov    %rdx,%rcx
  803c70:	ba 00 00 00 00       	mov    $0x0,%edx
  803c75:	48 89 c6             	mov    %rax,%rsi
  803c78:	bf 00 00 00 00       	mov    $0x0,%edi
  803c7d:	48 b8 bc 18 80 00 00 	movabs $0x8018bc,%rax
  803c84:	00 00 00 
  803c87:	ff d0                	callq  *%rax
  803c89:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803c8c:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803c90:	79 1b                	jns    803cad <pipe+0x143>
  803c92:	90                   	nop
  803c93:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803c97:	48 89 c6             	mov    %rax,%rsi
  803c9a:	bf 00 00 00 00       	mov    $0x0,%edi
  803c9f:	48 b8 17 19 80 00 00 	movabs $0x801917,%rax
  803ca6:	00 00 00 
  803ca9:	ff d0                	callq  *%rax
  803cab:	eb 79                	jmp    803d26 <pipe+0x1bc>
  803cad:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803cb1:	48 ba e0 60 80 00 00 	movabs $0x8060e0,%rdx
  803cb8:	00 00 00 
  803cbb:	8b 12                	mov    (%rdx),%edx
  803cbd:	89 10                	mov    %edx,(%rax)
  803cbf:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803cc3:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  803cca:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803cce:	48 ba e0 60 80 00 00 	movabs $0x8060e0,%rdx
  803cd5:	00 00 00 
  803cd8:	8b 12                	mov    (%rdx),%edx
  803cda:	89 10                	mov    %edx,(%rax)
  803cdc:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803ce0:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  803ce7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803ceb:	48 89 c7             	mov    %rax,%rdi
  803cee:	48 b8 2f 20 80 00 00 	movabs $0x80202f,%rax
  803cf5:	00 00 00 
  803cf8:	ff d0                	callq  *%rax
  803cfa:	89 c2                	mov    %eax,%edx
  803cfc:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803d00:	89 10                	mov    %edx,(%rax)
  803d02:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803d06:	48 8d 58 04          	lea    0x4(%rax),%rbx
  803d0a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803d0e:	48 89 c7             	mov    %rax,%rdi
  803d11:	48 b8 2f 20 80 00 00 	movabs $0x80202f,%rax
  803d18:	00 00 00 
  803d1b:	ff d0                	callq  *%rax
  803d1d:	89 03                	mov    %eax,(%rbx)
  803d1f:	b8 00 00 00 00       	mov    $0x0,%eax
  803d24:	eb 33                	jmp    803d59 <pipe+0x1ef>
  803d26:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803d2a:	48 89 c6             	mov    %rax,%rsi
  803d2d:	bf 00 00 00 00       	mov    $0x0,%edi
  803d32:	48 b8 17 19 80 00 00 	movabs $0x801917,%rax
  803d39:	00 00 00 
  803d3c:	ff d0                	callq  *%rax
  803d3e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803d42:	48 89 c6             	mov    %rax,%rsi
  803d45:	bf 00 00 00 00       	mov    $0x0,%edi
  803d4a:	48 b8 17 19 80 00 00 	movabs $0x801917,%rax
  803d51:	00 00 00 
  803d54:	ff d0                	callq  *%rax
  803d56:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803d59:	48 83 c4 38          	add    $0x38,%rsp
  803d5d:	5b                   	pop    %rbx
  803d5e:	5d                   	pop    %rbp
  803d5f:	c3                   	retq   

0000000000803d60 <_pipeisclosed>:
  803d60:	55                   	push   %rbp
  803d61:	48 89 e5             	mov    %rsp,%rbp
  803d64:	53                   	push   %rbx
  803d65:	48 83 ec 28          	sub    $0x28,%rsp
  803d69:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803d6d:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803d71:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803d78:	00 00 00 
  803d7b:	48 8b 00             	mov    (%rax),%rax
  803d7e:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  803d84:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803d87:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803d8b:	48 89 c7             	mov    %rax,%rdi
  803d8e:	48 b8 c3 46 80 00 00 	movabs $0x8046c3,%rax
  803d95:	00 00 00 
  803d98:	ff d0                	callq  *%rax
  803d9a:	89 c3                	mov    %eax,%ebx
  803d9c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803da0:	48 89 c7             	mov    %rax,%rdi
  803da3:	48 b8 c3 46 80 00 00 	movabs $0x8046c3,%rax
  803daa:	00 00 00 
  803dad:	ff d0                	callq  *%rax
  803daf:	39 c3                	cmp    %eax,%ebx
  803db1:	0f 94 c0             	sete   %al
  803db4:	0f b6 c0             	movzbl %al,%eax
  803db7:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803dba:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803dc1:	00 00 00 
  803dc4:	48 8b 00             	mov    (%rax),%rax
  803dc7:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  803dcd:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  803dd0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803dd3:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  803dd6:	75 05                	jne    803ddd <_pipeisclosed+0x7d>
  803dd8:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803ddb:	eb 4f                	jmp    803e2c <_pipeisclosed+0xcc>
  803ddd:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803de0:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  803de3:	74 42                	je     803e27 <_pipeisclosed+0xc7>
  803de5:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  803de9:	75 3c                	jne    803e27 <_pipeisclosed+0xc7>
  803deb:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803df2:	00 00 00 
  803df5:	48 8b 00             	mov    (%rax),%rax
  803df8:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  803dfe:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803e01:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803e04:	89 c6                	mov    %eax,%esi
  803e06:	48 bf 1b 4e 80 00 00 	movabs $0x804e1b,%rdi
  803e0d:	00 00 00 
  803e10:	b8 00 00 00 00       	mov    $0x0,%eax
  803e15:	49 b8 88 03 80 00 00 	movabs $0x800388,%r8
  803e1c:	00 00 00 
  803e1f:	41 ff d0             	callq  *%r8
  803e22:	e9 4a ff ff ff       	jmpq   803d71 <_pipeisclosed+0x11>
  803e27:	e9 45 ff ff ff       	jmpq   803d71 <_pipeisclosed+0x11>
  803e2c:	48 83 c4 28          	add    $0x28,%rsp
  803e30:	5b                   	pop    %rbx
  803e31:	5d                   	pop    %rbp
  803e32:	c3                   	retq   

0000000000803e33 <pipeisclosed>:
  803e33:	55                   	push   %rbp
  803e34:	48 89 e5             	mov    %rsp,%rbp
  803e37:	48 83 ec 30          	sub    $0x30,%rsp
  803e3b:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803e3e:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  803e42:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803e45:	48 89 d6             	mov    %rdx,%rsi
  803e48:	89 c7                	mov    %eax,%edi
  803e4a:	48 b8 15 21 80 00 00 	movabs $0x802115,%rax
  803e51:	00 00 00 
  803e54:	ff d0                	callq  *%rax
  803e56:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803e59:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803e5d:	79 05                	jns    803e64 <pipeisclosed+0x31>
  803e5f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e62:	eb 31                	jmp    803e95 <pipeisclosed+0x62>
  803e64:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803e68:	48 89 c7             	mov    %rax,%rdi
  803e6b:	48 b8 52 20 80 00 00 	movabs $0x802052,%rax
  803e72:	00 00 00 
  803e75:	ff d0                	callq  *%rax
  803e77:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803e7b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803e7f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803e83:	48 89 d6             	mov    %rdx,%rsi
  803e86:	48 89 c7             	mov    %rax,%rdi
  803e89:	48 b8 60 3d 80 00 00 	movabs $0x803d60,%rax
  803e90:	00 00 00 
  803e93:	ff d0                	callq  *%rax
  803e95:	c9                   	leaveq 
  803e96:	c3                   	retq   

0000000000803e97 <devpipe_read>:
  803e97:	55                   	push   %rbp
  803e98:	48 89 e5             	mov    %rsp,%rbp
  803e9b:	48 83 ec 40          	sub    $0x40,%rsp
  803e9f:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803ea3:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803ea7:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803eab:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803eaf:	48 89 c7             	mov    %rax,%rdi
  803eb2:	48 b8 52 20 80 00 00 	movabs $0x802052,%rax
  803eb9:	00 00 00 
  803ebc:	ff d0                	callq  *%rax
  803ebe:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803ec2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803ec6:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803eca:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803ed1:	00 
  803ed2:	e9 92 00 00 00       	jmpq   803f69 <devpipe_read+0xd2>
  803ed7:	eb 41                	jmp    803f1a <devpipe_read+0x83>
  803ed9:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  803ede:	74 09                	je     803ee9 <devpipe_read+0x52>
  803ee0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803ee4:	e9 92 00 00 00       	jmpq   803f7b <devpipe_read+0xe4>
  803ee9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803eed:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803ef1:	48 89 d6             	mov    %rdx,%rsi
  803ef4:	48 89 c7             	mov    %rax,%rdi
  803ef7:	48 b8 60 3d 80 00 00 	movabs $0x803d60,%rax
  803efe:	00 00 00 
  803f01:	ff d0                	callq  *%rax
  803f03:	85 c0                	test   %eax,%eax
  803f05:	74 07                	je     803f0e <devpipe_read+0x77>
  803f07:	b8 00 00 00 00       	mov    $0x0,%eax
  803f0c:	eb 6d                	jmp    803f7b <devpipe_read+0xe4>
  803f0e:	48 b8 2e 18 80 00 00 	movabs $0x80182e,%rax
  803f15:	00 00 00 
  803f18:	ff d0                	callq  *%rax
  803f1a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f1e:	8b 10                	mov    (%rax),%edx
  803f20:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f24:	8b 40 04             	mov    0x4(%rax),%eax
  803f27:	39 c2                	cmp    %eax,%edx
  803f29:	74 ae                	je     803ed9 <devpipe_read+0x42>
  803f2b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803f2f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803f33:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  803f37:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f3b:	8b 00                	mov    (%rax),%eax
  803f3d:	99                   	cltd   
  803f3e:	c1 ea 1b             	shr    $0x1b,%edx
  803f41:	01 d0                	add    %edx,%eax
  803f43:	83 e0 1f             	and    $0x1f,%eax
  803f46:	29 d0                	sub    %edx,%eax
  803f48:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803f4c:	48 98                	cltq   
  803f4e:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  803f53:	88 01                	mov    %al,(%rcx)
  803f55:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f59:	8b 00                	mov    (%rax),%eax
  803f5b:	8d 50 01             	lea    0x1(%rax),%edx
  803f5e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f62:	89 10                	mov    %edx,(%rax)
  803f64:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803f69:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803f6d:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803f71:	0f 82 60 ff ff ff    	jb     803ed7 <devpipe_read+0x40>
  803f77:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803f7b:	c9                   	leaveq 
  803f7c:	c3                   	retq   

0000000000803f7d <devpipe_write>:
  803f7d:	55                   	push   %rbp
  803f7e:	48 89 e5             	mov    %rsp,%rbp
  803f81:	48 83 ec 40          	sub    $0x40,%rsp
  803f85:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803f89:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803f8d:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803f91:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803f95:	48 89 c7             	mov    %rax,%rdi
  803f98:	48 b8 52 20 80 00 00 	movabs $0x802052,%rax
  803f9f:	00 00 00 
  803fa2:	ff d0                	callq  *%rax
  803fa4:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803fa8:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803fac:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803fb0:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803fb7:	00 
  803fb8:	e9 8e 00 00 00       	jmpq   80404b <devpipe_write+0xce>
  803fbd:	eb 31                	jmp    803ff0 <devpipe_write+0x73>
  803fbf:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803fc3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803fc7:	48 89 d6             	mov    %rdx,%rsi
  803fca:	48 89 c7             	mov    %rax,%rdi
  803fcd:	48 b8 60 3d 80 00 00 	movabs $0x803d60,%rax
  803fd4:	00 00 00 
  803fd7:	ff d0                	callq  *%rax
  803fd9:	85 c0                	test   %eax,%eax
  803fdb:	74 07                	je     803fe4 <devpipe_write+0x67>
  803fdd:	b8 00 00 00 00       	mov    $0x0,%eax
  803fe2:	eb 79                	jmp    80405d <devpipe_write+0xe0>
  803fe4:	48 b8 2e 18 80 00 00 	movabs $0x80182e,%rax
  803feb:	00 00 00 
  803fee:	ff d0                	callq  *%rax
  803ff0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ff4:	8b 40 04             	mov    0x4(%rax),%eax
  803ff7:	48 63 d0             	movslq %eax,%rdx
  803ffa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ffe:	8b 00                	mov    (%rax),%eax
  804000:	48 98                	cltq   
  804002:	48 83 c0 20          	add    $0x20,%rax
  804006:	48 39 c2             	cmp    %rax,%rdx
  804009:	73 b4                	jae    803fbf <devpipe_write+0x42>
  80400b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80400f:	8b 40 04             	mov    0x4(%rax),%eax
  804012:	99                   	cltd   
  804013:	c1 ea 1b             	shr    $0x1b,%edx
  804016:	01 d0                	add    %edx,%eax
  804018:	83 e0 1f             	and    $0x1f,%eax
  80401b:	29 d0                	sub    %edx,%eax
  80401d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  804021:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  804025:	48 01 ca             	add    %rcx,%rdx
  804028:	0f b6 0a             	movzbl (%rdx),%ecx
  80402b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80402f:	48 98                	cltq   
  804031:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  804035:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804039:	8b 40 04             	mov    0x4(%rax),%eax
  80403c:	8d 50 01             	lea    0x1(%rax),%edx
  80403f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804043:	89 50 04             	mov    %edx,0x4(%rax)
  804046:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80404b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80404f:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  804053:	0f 82 64 ff ff ff    	jb     803fbd <devpipe_write+0x40>
  804059:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80405d:	c9                   	leaveq 
  80405e:	c3                   	retq   

000000000080405f <devpipe_stat>:
  80405f:	55                   	push   %rbp
  804060:	48 89 e5             	mov    %rsp,%rbp
  804063:	48 83 ec 20          	sub    $0x20,%rsp
  804067:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80406b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80406f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804073:	48 89 c7             	mov    %rax,%rdi
  804076:	48 b8 52 20 80 00 00 	movabs $0x802052,%rax
  80407d:	00 00 00 
  804080:	ff d0                	callq  *%rax
  804082:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804086:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80408a:	48 be 2e 4e 80 00 00 	movabs $0x804e2e,%rsi
  804091:	00 00 00 
  804094:	48 89 c7             	mov    %rax,%rdi
  804097:	48 b8 3d 0f 80 00 00 	movabs $0x800f3d,%rax
  80409e:	00 00 00 
  8040a1:	ff d0                	callq  *%rax
  8040a3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8040a7:	8b 50 04             	mov    0x4(%rax),%edx
  8040aa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8040ae:	8b 00                	mov    (%rax),%eax
  8040b0:	29 c2                	sub    %eax,%edx
  8040b2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8040b6:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  8040bc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8040c0:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  8040c7:	00 00 00 
  8040ca:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8040ce:	48 b9 e0 60 80 00 00 	movabs $0x8060e0,%rcx
  8040d5:	00 00 00 
  8040d8:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  8040df:	b8 00 00 00 00       	mov    $0x0,%eax
  8040e4:	c9                   	leaveq 
  8040e5:	c3                   	retq   

00000000008040e6 <devpipe_close>:
  8040e6:	55                   	push   %rbp
  8040e7:	48 89 e5             	mov    %rsp,%rbp
  8040ea:	48 83 ec 10          	sub    $0x10,%rsp
  8040ee:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8040f2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8040f6:	48 89 c6             	mov    %rax,%rsi
  8040f9:	bf 00 00 00 00       	mov    $0x0,%edi
  8040fe:	48 b8 17 19 80 00 00 	movabs $0x801917,%rax
  804105:	00 00 00 
  804108:	ff d0                	callq  *%rax
  80410a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80410e:	48 89 c7             	mov    %rax,%rdi
  804111:	48 b8 52 20 80 00 00 	movabs $0x802052,%rax
  804118:	00 00 00 
  80411b:	ff d0                	callq  *%rax
  80411d:	48 89 c6             	mov    %rax,%rsi
  804120:	bf 00 00 00 00       	mov    $0x0,%edi
  804125:	48 b8 17 19 80 00 00 	movabs $0x801917,%rax
  80412c:	00 00 00 
  80412f:	ff d0                	callq  *%rax
  804131:	c9                   	leaveq 
  804132:	c3                   	retq   

0000000000804133 <cputchar>:
  804133:	55                   	push   %rbp
  804134:	48 89 e5             	mov    %rsp,%rbp
  804137:	48 83 ec 20          	sub    $0x20,%rsp
  80413b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80413e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804141:	88 45 ff             	mov    %al,-0x1(%rbp)
  804144:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  804148:	be 01 00 00 00       	mov    $0x1,%esi
  80414d:	48 89 c7             	mov    %rax,%rdi
  804150:	48 b8 24 17 80 00 00 	movabs $0x801724,%rax
  804157:	00 00 00 
  80415a:	ff d0                	callq  *%rax
  80415c:	c9                   	leaveq 
  80415d:	c3                   	retq   

000000000080415e <getchar>:
  80415e:	55                   	push   %rbp
  80415f:	48 89 e5             	mov    %rsp,%rbp
  804162:	48 83 ec 10          	sub    $0x10,%rsp
  804166:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  80416a:	ba 01 00 00 00       	mov    $0x1,%edx
  80416f:	48 89 c6             	mov    %rax,%rsi
  804172:	bf 00 00 00 00       	mov    $0x0,%edi
  804177:	48 b8 47 25 80 00 00 	movabs $0x802547,%rax
  80417e:	00 00 00 
  804181:	ff d0                	callq  *%rax
  804183:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804186:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80418a:	79 05                	jns    804191 <getchar+0x33>
  80418c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80418f:	eb 14                	jmp    8041a5 <getchar+0x47>
  804191:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804195:	7f 07                	jg     80419e <getchar+0x40>
  804197:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  80419c:	eb 07                	jmp    8041a5 <getchar+0x47>
  80419e:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  8041a2:	0f b6 c0             	movzbl %al,%eax
  8041a5:	c9                   	leaveq 
  8041a6:	c3                   	retq   

00000000008041a7 <iscons>:
  8041a7:	55                   	push   %rbp
  8041a8:	48 89 e5             	mov    %rsp,%rbp
  8041ab:	48 83 ec 20          	sub    $0x20,%rsp
  8041af:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8041b2:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8041b6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8041b9:	48 89 d6             	mov    %rdx,%rsi
  8041bc:	89 c7                	mov    %eax,%edi
  8041be:	48 b8 15 21 80 00 00 	movabs $0x802115,%rax
  8041c5:	00 00 00 
  8041c8:	ff d0                	callq  *%rax
  8041ca:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8041cd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8041d1:	79 05                	jns    8041d8 <iscons+0x31>
  8041d3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8041d6:	eb 1a                	jmp    8041f2 <iscons+0x4b>
  8041d8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8041dc:	8b 10                	mov    (%rax),%edx
  8041de:	48 b8 20 61 80 00 00 	movabs $0x806120,%rax
  8041e5:	00 00 00 
  8041e8:	8b 00                	mov    (%rax),%eax
  8041ea:	39 c2                	cmp    %eax,%edx
  8041ec:	0f 94 c0             	sete   %al
  8041ef:	0f b6 c0             	movzbl %al,%eax
  8041f2:	c9                   	leaveq 
  8041f3:	c3                   	retq   

00000000008041f4 <opencons>:
  8041f4:	55                   	push   %rbp
  8041f5:	48 89 e5             	mov    %rsp,%rbp
  8041f8:	48 83 ec 10          	sub    $0x10,%rsp
  8041fc:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  804200:	48 89 c7             	mov    %rax,%rdi
  804203:	48 b8 7d 20 80 00 00 	movabs $0x80207d,%rax
  80420a:	00 00 00 
  80420d:	ff d0                	callq  *%rax
  80420f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804212:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804216:	79 05                	jns    80421d <opencons+0x29>
  804218:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80421b:	eb 5b                	jmp    804278 <opencons+0x84>
  80421d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804221:	ba 07 04 00 00       	mov    $0x407,%edx
  804226:	48 89 c6             	mov    %rax,%rsi
  804229:	bf 00 00 00 00       	mov    $0x0,%edi
  80422e:	48 b8 6c 18 80 00 00 	movabs $0x80186c,%rax
  804235:	00 00 00 
  804238:	ff d0                	callq  *%rax
  80423a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80423d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804241:	79 05                	jns    804248 <opencons+0x54>
  804243:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804246:	eb 30                	jmp    804278 <opencons+0x84>
  804248:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80424c:	48 ba 20 61 80 00 00 	movabs $0x806120,%rdx
  804253:	00 00 00 
  804256:	8b 12                	mov    (%rdx),%edx
  804258:	89 10                	mov    %edx,(%rax)
  80425a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80425e:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  804265:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804269:	48 89 c7             	mov    %rax,%rdi
  80426c:	48 b8 2f 20 80 00 00 	movabs $0x80202f,%rax
  804273:	00 00 00 
  804276:	ff d0                	callq  *%rax
  804278:	c9                   	leaveq 
  804279:	c3                   	retq   

000000000080427a <devcons_read>:
  80427a:	55                   	push   %rbp
  80427b:	48 89 e5             	mov    %rsp,%rbp
  80427e:	48 83 ec 30          	sub    $0x30,%rsp
  804282:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804286:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80428a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80428e:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804293:	75 07                	jne    80429c <devcons_read+0x22>
  804295:	b8 00 00 00 00       	mov    $0x0,%eax
  80429a:	eb 4b                	jmp    8042e7 <devcons_read+0x6d>
  80429c:	eb 0c                	jmp    8042aa <devcons_read+0x30>
  80429e:	48 b8 2e 18 80 00 00 	movabs $0x80182e,%rax
  8042a5:	00 00 00 
  8042a8:	ff d0                	callq  *%rax
  8042aa:	48 b8 6e 17 80 00 00 	movabs $0x80176e,%rax
  8042b1:	00 00 00 
  8042b4:	ff d0                	callq  *%rax
  8042b6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8042b9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8042bd:	74 df                	je     80429e <devcons_read+0x24>
  8042bf:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8042c3:	79 05                	jns    8042ca <devcons_read+0x50>
  8042c5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8042c8:	eb 1d                	jmp    8042e7 <devcons_read+0x6d>
  8042ca:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  8042ce:	75 07                	jne    8042d7 <devcons_read+0x5d>
  8042d0:	b8 00 00 00 00       	mov    $0x0,%eax
  8042d5:	eb 10                	jmp    8042e7 <devcons_read+0x6d>
  8042d7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8042da:	89 c2                	mov    %eax,%edx
  8042dc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8042e0:	88 10                	mov    %dl,(%rax)
  8042e2:	b8 01 00 00 00       	mov    $0x1,%eax
  8042e7:	c9                   	leaveq 
  8042e8:	c3                   	retq   

00000000008042e9 <devcons_write>:
  8042e9:	55                   	push   %rbp
  8042ea:	48 89 e5             	mov    %rsp,%rbp
  8042ed:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  8042f4:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  8042fb:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  804302:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  804309:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804310:	eb 76                	jmp    804388 <devcons_write+0x9f>
  804312:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  804319:	89 c2                	mov    %eax,%edx
  80431b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80431e:	29 c2                	sub    %eax,%edx
  804320:	89 d0                	mov    %edx,%eax
  804322:	89 45 f8             	mov    %eax,-0x8(%rbp)
  804325:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804328:	83 f8 7f             	cmp    $0x7f,%eax
  80432b:	76 07                	jbe    804334 <devcons_write+0x4b>
  80432d:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  804334:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804337:	48 63 d0             	movslq %eax,%rdx
  80433a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80433d:	48 63 c8             	movslq %eax,%rcx
  804340:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  804347:	48 01 c1             	add    %rax,%rcx
  80434a:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  804351:	48 89 ce             	mov    %rcx,%rsi
  804354:	48 89 c7             	mov    %rax,%rdi
  804357:	48 b8 61 12 80 00 00 	movabs $0x801261,%rax
  80435e:	00 00 00 
  804361:	ff d0                	callq  *%rax
  804363:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804366:	48 63 d0             	movslq %eax,%rdx
  804369:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  804370:	48 89 d6             	mov    %rdx,%rsi
  804373:	48 89 c7             	mov    %rax,%rdi
  804376:	48 b8 24 17 80 00 00 	movabs $0x801724,%rax
  80437d:	00 00 00 
  804380:	ff d0                	callq  *%rax
  804382:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804385:	01 45 fc             	add    %eax,-0x4(%rbp)
  804388:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80438b:	48 98                	cltq   
  80438d:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  804394:	0f 82 78 ff ff ff    	jb     804312 <devcons_write+0x29>
  80439a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80439d:	c9                   	leaveq 
  80439e:	c3                   	retq   

000000000080439f <devcons_close>:
  80439f:	55                   	push   %rbp
  8043a0:	48 89 e5             	mov    %rsp,%rbp
  8043a3:	48 83 ec 08          	sub    $0x8,%rsp
  8043a7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8043ab:	b8 00 00 00 00       	mov    $0x0,%eax
  8043b0:	c9                   	leaveq 
  8043b1:	c3                   	retq   

00000000008043b2 <devcons_stat>:
  8043b2:	55                   	push   %rbp
  8043b3:	48 89 e5             	mov    %rsp,%rbp
  8043b6:	48 83 ec 10          	sub    $0x10,%rsp
  8043ba:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8043be:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8043c2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8043c6:	48 be 3a 4e 80 00 00 	movabs $0x804e3a,%rsi
  8043cd:	00 00 00 
  8043d0:	48 89 c7             	mov    %rax,%rdi
  8043d3:	48 b8 3d 0f 80 00 00 	movabs $0x800f3d,%rax
  8043da:	00 00 00 
  8043dd:	ff d0                	callq  *%rax
  8043df:	b8 00 00 00 00       	mov    $0x0,%eax
  8043e4:	c9                   	leaveq 
  8043e5:	c3                   	retq   

00000000008043e6 <_panic>:
  8043e6:	55                   	push   %rbp
  8043e7:	48 89 e5             	mov    %rsp,%rbp
  8043ea:	53                   	push   %rbx
  8043eb:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  8043f2:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  8043f9:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  8043ff:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  804406:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  80440d:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  804414:	84 c0                	test   %al,%al
  804416:	74 23                	je     80443b <_panic+0x55>
  804418:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  80441f:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  804423:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  804427:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  80442b:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  80442f:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  804433:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  804437:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  80443b:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  804442:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  804449:	00 00 00 
  80444c:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  804453:	00 00 00 
  804456:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80445a:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  804461:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  804468:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  80446f:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  804476:	00 00 00 
  804479:	48 8b 18             	mov    (%rax),%rbx
  80447c:	48 b8 f0 17 80 00 00 	movabs $0x8017f0,%rax
  804483:	00 00 00 
  804486:	ff d0                	callq  *%rax
  804488:	8b 8d 14 ff ff ff    	mov    -0xec(%rbp),%ecx
  80448e:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  804495:	41 89 c8             	mov    %ecx,%r8d
  804498:	48 89 d1             	mov    %rdx,%rcx
  80449b:	48 89 da             	mov    %rbx,%rdx
  80449e:	89 c6                	mov    %eax,%esi
  8044a0:	48 bf 48 4e 80 00 00 	movabs $0x804e48,%rdi
  8044a7:	00 00 00 
  8044aa:	b8 00 00 00 00       	mov    $0x0,%eax
  8044af:	49 b9 88 03 80 00 00 	movabs $0x800388,%r9
  8044b6:	00 00 00 
  8044b9:	41 ff d1             	callq  *%r9
  8044bc:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  8044c3:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8044ca:	48 89 d6             	mov    %rdx,%rsi
  8044cd:	48 89 c7             	mov    %rax,%rdi
  8044d0:	48 b8 dc 02 80 00 00 	movabs $0x8002dc,%rax
  8044d7:	00 00 00 
  8044da:	ff d0                	callq  *%rax
  8044dc:	48 bf 6b 4e 80 00 00 	movabs $0x804e6b,%rdi
  8044e3:	00 00 00 
  8044e6:	b8 00 00 00 00       	mov    $0x0,%eax
  8044eb:	48 ba 88 03 80 00 00 	movabs $0x800388,%rdx
  8044f2:	00 00 00 
  8044f5:	ff d2                	callq  *%rdx
  8044f7:	cc                   	int3   
  8044f8:	eb fd                	jmp    8044f7 <_panic+0x111>

00000000008044fa <ipc_recv>:
  8044fa:	55                   	push   %rbp
  8044fb:	48 89 e5             	mov    %rsp,%rbp
  8044fe:	48 83 ec 30          	sub    $0x30,%rsp
  804502:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804506:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80450a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80450e:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  804513:	75 0e                	jne    804523 <ipc_recv+0x29>
  804515:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80451c:	00 00 00 
  80451f:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804523:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804527:	48 89 c7             	mov    %rax,%rdi
  80452a:	48 b8 95 1a 80 00 00 	movabs $0x801a95,%rax
  804531:	00 00 00 
  804534:	ff d0                	callq  *%rax
  804536:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804539:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80453d:	79 27                	jns    804566 <ipc_recv+0x6c>
  80453f:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  804544:	74 0a                	je     804550 <ipc_recv+0x56>
  804546:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80454a:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  804550:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804555:	74 0a                	je     804561 <ipc_recv+0x67>
  804557:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80455b:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  804561:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804564:	eb 53                	jmp    8045b9 <ipc_recv+0xbf>
  804566:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80456b:	74 19                	je     804586 <ipc_recv+0x8c>
  80456d:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  804574:	00 00 00 
  804577:	48 8b 00             	mov    (%rax),%rax
  80457a:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  804580:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804584:	89 10                	mov    %edx,(%rax)
  804586:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80458b:	74 19                	je     8045a6 <ipc_recv+0xac>
  80458d:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  804594:	00 00 00 
  804597:	48 8b 00             	mov    (%rax),%rax
  80459a:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  8045a0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8045a4:	89 10                	mov    %edx,(%rax)
  8045a6:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8045ad:	00 00 00 
  8045b0:	48 8b 00             	mov    (%rax),%rax
  8045b3:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  8045b9:	c9                   	leaveq 
  8045ba:	c3                   	retq   

00000000008045bb <ipc_send>:
  8045bb:	55                   	push   %rbp
  8045bc:	48 89 e5             	mov    %rsp,%rbp
  8045bf:	48 83 ec 30          	sub    $0x30,%rsp
  8045c3:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8045c6:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8045c9:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  8045cd:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  8045d0:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8045d5:	75 10                	jne    8045e7 <ipc_send+0x2c>
  8045d7:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8045de:	00 00 00 
  8045e1:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8045e5:	eb 0e                	jmp    8045f5 <ipc_send+0x3a>
  8045e7:	eb 0c                	jmp    8045f5 <ipc_send+0x3a>
  8045e9:	48 b8 2e 18 80 00 00 	movabs $0x80182e,%rax
  8045f0:	00 00 00 
  8045f3:	ff d0                	callq  *%rax
  8045f5:	8b 75 e8             	mov    -0x18(%rbp),%esi
  8045f8:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  8045fb:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8045ff:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804602:	89 c7                	mov    %eax,%edi
  804604:	48 b8 40 1a 80 00 00 	movabs $0x801a40,%rax
  80460b:	00 00 00 
  80460e:	ff d0                	callq  *%rax
  804610:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804613:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  804617:	74 d0                	je     8045e9 <ipc_send+0x2e>
  804619:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80461d:	79 30                	jns    80464f <ipc_send+0x94>
  80461f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804622:	89 c1                	mov    %eax,%ecx
  804624:	48 ba 6d 4e 80 00 00 	movabs $0x804e6d,%rdx
  80462b:	00 00 00 
  80462e:	be 44 00 00 00       	mov    $0x44,%esi
  804633:	48 bf 83 4e 80 00 00 	movabs $0x804e83,%rdi
  80463a:	00 00 00 
  80463d:	b8 00 00 00 00       	mov    $0x0,%eax
  804642:	49 b8 e6 43 80 00 00 	movabs $0x8043e6,%r8
  804649:	00 00 00 
  80464c:	41 ff d0             	callq  *%r8
  80464f:	c9                   	leaveq 
  804650:	c3                   	retq   

0000000000804651 <ipc_find_env>:
  804651:	55                   	push   %rbp
  804652:	48 89 e5             	mov    %rsp,%rbp
  804655:	48 83 ec 14          	sub    $0x14,%rsp
  804659:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80465c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804663:	eb 4e                	jmp    8046b3 <ipc_find_env+0x62>
  804665:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  80466c:	00 00 00 
  80466f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804672:	48 98                	cltq   
  804674:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  80467b:	48 01 d0             	add    %rdx,%rax
  80467e:	48 05 d0 00 00 00    	add    $0xd0,%rax
  804684:	8b 00                	mov    (%rax),%eax
  804686:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  804689:	75 24                	jne    8046af <ipc_find_env+0x5e>
  80468b:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804692:	00 00 00 
  804695:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804698:	48 98                	cltq   
  80469a:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  8046a1:	48 01 d0             	add    %rdx,%rax
  8046a4:	48 05 c0 00 00 00    	add    $0xc0,%rax
  8046aa:	8b 40 08             	mov    0x8(%rax),%eax
  8046ad:	eb 12                	jmp    8046c1 <ipc_find_env+0x70>
  8046af:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8046b3:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  8046ba:	7e a9                	jle    804665 <ipc_find_env+0x14>
  8046bc:	b8 00 00 00 00       	mov    $0x0,%eax
  8046c1:	c9                   	leaveq 
  8046c2:	c3                   	retq   

00000000008046c3 <pageref>:
  8046c3:	55                   	push   %rbp
  8046c4:	48 89 e5             	mov    %rsp,%rbp
  8046c7:	48 83 ec 18          	sub    $0x18,%rsp
  8046cb:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8046cf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8046d3:	48 c1 e8 15          	shr    $0x15,%rax
  8046d7:	48 89 c2             	mov    %rax,%rdx
  8046da:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8046e1:	01 00 00 
  8046e4:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8046e8:	83 e0 01             	and    $0x1,%eax
  8046eb:	48 85 c0             	test   %rax,%rax
  8046ee:	75 07                	jne    8046f7 <pageref+0x34>
  8046f0:	b8 00 00 00 00       	mov    $0x0,%eax
  8046f5:	eb 53                	jmp    80474a <pageref+0x87>
  8046f7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8046fb:	48 c1 e8 0c          	shr    $0xc,%rax
  8046ff:	48 89 c2             	mov    %rax,%rdx
  804702:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  804709:	01 00 00 
  80470c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804710:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804714:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804718:	83 e0 01             	and    $0x1,%eax
  80471b:	48 85 c0             	test   %rax,%rax
  80471e:	75 07                	jne    804727 <pageref+0x64>
  804720:	b8 00 00 00 00       	mov    $0x0,%eax
  804725:	eb 23                	jmp    80474a <pageref+0x87>
  804727:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80472b:	48 c1 e8 0c          	shr    $0xc,%rax
  80472f:	48 89 c2             	mov    %rax,%rdx
  804732:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  804739:	00 00 00 
  80473c:	48 c1 e2 04          	shl    $0x4,%rdx
  804740:	48 01 d0             	add    %rdx,%rax
  804743:	0f b7 40 08          	movzwl 0x8(%rax),%eax
  804747:	0f b7 c0             	movzwl %ax,%eax
  80474a:	c9                   	leaveq 
  80474b:	c3                   	retq   
