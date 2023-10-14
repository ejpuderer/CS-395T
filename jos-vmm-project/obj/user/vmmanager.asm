
obj/user/vmmanager:     file format elf64-x86-64


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
  80003c:	e8 e4 00 00 00       	callq  800125 <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <umain>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 20          	sub    $0x20,%rsp
  80004b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80004e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800052:	b8 00 00 00 00       	mov    $0x0,%eax
  800057:	48 ba 0e 1d 80 00 00 	movabs $0x801d0e,%rdx
  80005e:	00 00 00 
  800061:	ff d2                	callq  *%rdx
  800063:	48 bf 40 45 80 00 00 	movabs $0x804540,%rdi
  80006a:	00 00 00 
  80006d:	48 b8 39 0e 80 00 00 	movabs $0x800e39,%rax
  800074:	00 00 00 
  800077:	ff d0                	callq  *%rax
  800079:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80007d:	eb 35                	jmp    8000b4 <umain+0x71>
  80007f:	48 bf 60 45 80 00 00 	movabs $0x804560,%rdi
  800086:	00 00 00 
  800089:	b8 00 00 00 00       	mov    $0x0,%eax
  80008e:	48 ba f0 02 80 00 00 	movabs $0x8002f0,%rdx
  800095:	00 00 00 
  800098:	ff d2                	callq  *%rdx
  80009a:	48 bf 40 45 80 00 00 	movabs $0x804540,%rdi
  8000a1:	00 00 00 
  8000a4:	48 b8 39 0e 80 00 00 	movabs $0x800e39,%rax
  8000ab:	00 00 00 
  8000ae:	ff d0                	callq  *%rax
  8000b0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8000b4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8000b8:	48 89 c7             	mov    %rax,%rdi
  8000bb:	48 b8 93 0f 80 00 00 	movabs $0x800f93,%rax
  8000c2:	00 00 00 
  8000c5:	ff d0                	callq  *%rax
  8000c7:	83 f8 01             	cmp    $0x1,%eax
  8000ca:	75 b3                	jne    80007f <umain+0x3c>
  8000cc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8000d0:	0f b6 00             	movzbl (%rax),%eax
  8000d3:	3c 30                	cmp    $0x30,%al
  8000d5:	7e a8                	jle    80007f <umain+0x3c>
  8000d7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8000db:	0f b6 00             	movzbl (%rax),%eax
  8000de:	3c 39                	cmp    $0x39,%al
  8000e0:	7f 9d                	jg     80007f <umain+0x3c>
  8000e2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8000e6:	0f b6 00             	movzbl (%rax),%eax
  8000e9:	0f be c0             	movsbl %al,%eax
  8000ec:	83 e8 30             	sub    $0x30,%eax
  8000ef:	89 c7                	mov    %eax,%edi
  8000f1:	48 b8 4c 1d 80 00 00 	movabs $0x801d4c,%rax
  8000f8:	00 00 00 
  8000fb:	ff d0                	callq  *%rax
  8000fd:	85 c0                	test   %eax,%eax
  8000ff:	74 1d                	je     80011e <umain+0xdb>
  800101:	48 bf 82 45 80 00 00 	movabs $0x804582,%rdi
  800108:	00 00 00 
  80010b:	b8 00 00 00 00       	mov    $0x0,%eax
  800110:	48 ba f0 02 80 00 00 	movabs $0x8002f0,%rdx
  800117:	00 00 00 
  80011a:	ff d2                	callq  *%rdx
  80011c:	eb 05                	jmp    800123 <umain+0xe0>
  80011e:	e9 5c ff ff ff       	jmpq   80007f <umain+0x3c>
  800123:	c9                   	leaveq 
  800124:	c3                   	retq   

0000000000800125 <libmain>:
  800125:	55                   	push   %rbp
  800126:	48 89 e5             	mov    %rsp,%rbp
  800129:	48 83 ec 10          	sub    $0x10,%rsp
  80012d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800130:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800134:	48 b8 b2 18 80 00 00 	movabs $0x8018b2,%rax
  80013b:	00 00 00 
  80013e:	ff d0                	callq  *%rax
  800140:	25 ff 03 00 00       	and    $0x3ff,%eax
  800145:	48 98                	cltq   
  800147:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  80014e:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  800155:	00 00 00 
  800158:	48 01 c2             	add    %rax,%rdx
  80015b:	48 b8 08 74 80 00 00 	movabs $0x807408,%rax
  800162:	00 00 00 
  800165:	48 89 10             	mov    %rdx,(%rax)
  800168:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80016c:	7e 14                	jle    800182 <libmain+0x5d>
  80016e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800172:	48 8b 10             	mov    (%rax),%rdx
  800175:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  80017c:	00 00 00 
  80017f:	48 89 10             	mov    %rdx,(%rax)
  800182:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800186:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800189:	48 89 d6             	mov    %rdx,%rsi
  80018c:	89 c7                	mov    %eax,%edi
  80018e:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800195:	00 00 00 
  800198:	ff d0                	callq  *%rax
  80019a:	48 b8 a8 01 80 00 00 	movabs $0x8001a8,%rax
  8001a1:	00 00 00 
  8001a4:	ff d0                	callq  *%rax
  8001a6:	c9                   	leaveq 
  8001a7:	c3                   	retq   

00000000008001a8 <exit>:
  8001a8:	55                   	push   %rbp
  8001a9:	48 89 e5             	mov    %rsp,%rbp
  8001ac:	48 b8 4d 21 80 00 00 	movabs $0x80214d,%rax
  8001b3:	00 00 00 
  8001b6:	ff d0                	callq  *%rax
  8001b8:	bf 00 00 00 00       	mov    $0x0,%edi
  8001bd:	48 b8 6e 18 80 00 00 	movabs $0x80186e,%rax
  8001c4:	00 00 00 
  8001c7:	ff d0                	callq  *%rax
  8001c9:	5d                   	pop    %rbp
  8001ca:	c3                   	retq   

00000000008001cb <putch>:
  8001cb:	55                   	push   %rbp
  8001cc:	48 89 e5             	mov    %rsp,%rbp
  8001cf:	48 83 ec 10          	sub    $0x10,%rsp
  8001d3:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8001d6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8001da:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8001de:	8b 00                	mov    (%rax),%eax
  8001e0:	8d 48 01             	lea    0x1(%rax),%ecx
  8001e3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8001e7:	89 0a                	mov    %ecx,(%rdx)
  8001e9:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8001ec:	89 d1                	mov    %edx,%ecx
  8001ee:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8001f2:	48 98                	cltq   
  8001f4:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  8001f8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8001fc:	8b 00                	mov    (%rax),%eax
  8001fe:	3d ff 00 00 00       	cmp    $0xff,%eax
  800203:	75 2c                	jne    800231 <putch+0x66>
  800205:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800209:	8b 00                	mov    (%rax),%eax
  80020b:	48 98                	cltq   
  80020d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800211:	48 83 c2 08          	add    $0x8,%rdx
  800215:	48 89 c6             	mov    %rax,%rsi
  800218:	48 89 d7             	mov    %rdx,%rdi
  80021b:	48 b8 e6 17 80 00 00 	movabs $0x8017e6,%rax
  800222:	00 00 00 
  800225:	ff d0                	callq  *%rax
  800227:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80022b:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  800231:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800235:	8b 40 04             	mov    0x4(%rax),%eax
  800238:	8d 50 01             	lea    0x1(%rax),%edx
  80023b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80023f:	89 50 04             	mov    %edx,0x4(%rax)
  800242:	c9                   	leaveq 
  800243:	c3                   	retq   

0000000000800244 <vcprintf>:
  800244:	55                   	push   %rbp
  800245:	48 89 e5             	mov    %rsp,%rbp
  800248:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  80024f:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  800256:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  80025d:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  800264:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  80026b:	48 8b 0a             	mov    (%rdx),%rcx
  80026e:	48 89 08             	mov    %rcx,(%rax)
  800271:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800275:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800279:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  80027d:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800281:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  800288:	00 00 00 
  80028b:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  800292:	00 00 00 
  800295:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  80029c:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  8002a3:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  8002aa:	48 89 c6             	mov    %rax,%rsi
  8002ad:	48 bf cb 01 80 00 00 	movabs $0x8001cb,%rdi
  8002b4:	00 00 00 
  8002b7:	48 b8 a3 06 80 00 00 	movabs $0x8006a3,%rax
  8002be:	00 00 00 
  8002c1:	ff d0                	callq  *%rax
  8002c3:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  8002c9:	48 98                	cltq   
  8002cb:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  8002d2:	48 83 c2 08          	add    $0x8,%rdx
  8002d6:	48 89 c6             	mov    %rax,%rsi
  8002d9:	48 89 d7             	mov    %rdx,%rdi
  8002dc:	48 b8 e6 17 80 00 00 	movabs $0x8017e6,%rax
  8002e3:	00 00 00 
  8002e6:	ff d0                	callq  *%rax
  8002e8:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  8002ee:	c9                   	leaveq 
  8002ef:	c3                   	retq   

00000000008002f0 <cprintf>:
  8002f0:	55                   	push   %rbp
  8002f1:	48 89 e5             	mov    %rsp,%rbp
  8002f4:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  8002fb:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  800302:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  800309:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800310:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800317:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  80031e:	84 c0                	test   %al,%al
  800320:	74 20                	je     800342 <cprintf+0x52>
  800322:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800326:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80032a:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  80032e:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800332:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800336:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  80033a:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  80033e:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800342:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800349:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  800350:	00 00 00 
  800353:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  80035a:	00 00 00 
  80035d:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800361:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800368:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  80036f:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800376:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  80037d:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800384:	48 8b 0a             	mov    (%rdx),%rcx
  800387:	48 89 08             	mov    %rcx,(%rax)
  80038a:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80038e:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800392:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800396:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80039a:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  8003a1:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8003a8:	48 89 d6             	mov    %rdx,%rsi
  8003ab:	48 89 c7             	mov    %rax,%rdi
  8003ae:	48 b8 44 02 80 00 00 	movabs $0x800244,%rax
  8003b5:	00 00 00 
  8003b8:	ff d0                	callq  *%rax
  8003ba:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  8003c0:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  8003c6:	c9                   	leaveq 
  8003c7:	c3                   	retq   

00000000008003c8 <printnum>:
  8003c8:	55                   	push   %rbp
  8003c9:	48 89 e5             	mov    %rsp,%rbp
  8003cc:	53                   	push   %rbx
  8003cd:	48 83 ec 38          	sub    $0x38,%rsp
  8003d1:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8003d5:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8003d9:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8003dd:	89 4d d4             	mov    %ecx,-0x2c(%rbp)
  8003e0:	44 89 45 d0          	mov    %r8d,-0x30(%rbp)
  8003e4:	44 89 4d cc          	mov    %r9d,-0x34(%rbp)
  8003e8:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  8003eb:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8003ef:	77 3b                	ja     80042c <printnum+0x64>
  8003f1:	8b 45 d0             	mov    -0x30(%rbp),%eax
  8003f4:	44 8d 40 ff          	lea    -0x1(%rax),%r8d
  8003f8:	8b 5d d4             	mov    -0x2c(%rbp),%ebx
  8003fb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8003ff:	ba 00 00 00 00       	mov    $0x0,%edx
  800404:	48 f7 f3             	div    %rbx
  800407:	48 89 c2             	mov    %rax,%rdx
  80040a:	8b 7d cc             	mov    -0x34(%rbp),%edi
  80040d:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  800410:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
  800414:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800418:	41 89 f9             	mov    %edi,%r9d
  80041b:	48 89 c7             	mov    %rax,%rdi
  80041e:	48 b8 c8 03 80 00 00 	movabs $0x8003c8,%rax
  800425:	00 00 00 
  800428:	ff d0                	callq  *%rax
  80042a:	eb 1e                	jmp    80044a <printnum+0x82>
  80042c:	eb 12                	jmp    800440 <printnum+0x78>
  80042e:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  800432:	8b 55 cc             	mov    -0x34(%rbp),%edx
  800435:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800439:	48 89 ce             	mov    %rcx,%rsi
  80043c:	89 d7                	mov    %edx,%edi
  80043e:	ff d0                	callq  *%rax
  800440:	83 6d d0 01          	subl   $0x1,-0x30(%rbp)
  800444:	83 7d d0 00          	cmpl   $0x0,-0x30(%rbp)
  800448:	7f e4                	jg     80042e <printnum+0x66>
  80044a:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  80044d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800451:	ba 00 00 00 00       	mov    $0x0,%edx
  800456:	48 f7 f1             	div    %rcx
  800459:	48 89 d0             	mov    %rdx,%rax
  80045c:	48 ba b0 47 80 00 00 	movabs $0x8047b0,%rdx
  800463:	00 00 00 
  800466:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
  80046a:	0f be d0             	movsbl %al,%edx
  80046d:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  800471:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800475:	48 89 ce             	mov    %rcx,%rsi
  800478:	89 d7                	mov    %edx,%edi
  80047a:	ff d0                	callq  *%rax
  80047c:	48 83 c4 38          	add    $0x38,%rsp
  800480:	5b                   	pop    %rbx
  800481:	5d                   	pop    %rbp
  800482:	c3                   	retq   

0000000000800483 <getuint>:
  800483:	55                   	push   %rbp
  800484:	48 89 e5             	mov    %rsp,%rbp
  800487:	48 83 ec 1c          	sub    $0x1c,%rsp
  80048b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80048f:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800492:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800496:	7e 52                	jle    8004ea <getuint+0x67>
  800498:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80049c:	8b 00                	mov    (%rax),%eax
  80049e:	83 f8 30             	cmp    $0x30,%eax
  8004a1:	73 24                	jae    8004c7 <getuint+0x44>
  8004a3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8004a7:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8004ab:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8004af:	8b 00                	mov    (%rax),%eax
  8004b1:	89 c0                	mov    %eax,%eax
  8004b3:	48 01 d0             	add    %rdx,%rax
  8004b6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8004ba:	8b 12                	mov    (%rdx),%edx
  8004bc:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8004bf:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8004c3:	89 0a                	mov    %ecx,(%rdx)
  8004c5:	eb 17                	jmp    8004de <getuint+0x5b>
  8004c7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8004cb:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8004cf:	48 89 d0             	mov    %rdx,%rax
  8004d2:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8004d6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8004da:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8004de:	48 8b 00             	mov    (%rax),%rax
  8004e1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8004e5:	e9 a3 00 00 00       	jmpq   80058d <getuint+0x10a>
  8004ea:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  8004ee:	74 4f                	je     80053f <getuint+0xbc>
  8004f0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8004f4:	8b 00                	mov    (%rax),%eax
  8004f6:	83 f8 30             	cmp    $0x30,%eax
  8004f9:	73 24                	jae    80051f <getuint+0x9c>
  8004fb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8004ff:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800503:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800507:	8b 00                	mov    (%rax),%eax
  800509:	89 c0                	mov    %eax,%eax
  80050b:	48 01 d0             	add    %rdx,%rax
  80050e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800512:	8b 12                	mov    (%rdx),%edx
  800514:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800517:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80051b:	89 0a                	mov    %ecx,(%rdx)
  80051d:	eb 17                	jmp    800536 <getuint+0xb3>
  80051f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800523:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800527:	48 89 d0             	mov    %rdx,%rax
  80052a:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  80052e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800532:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800536:	48 8b 00             	mov    (%rax),%rax
  800539:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80053d:	eb 4e                	jmp    80058d <getuint+0x10a>
  80053f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800543:	8b 00                	mov    (%rax),%eax
  800545:	83 f8 30             	cmp    $0x30,%eax
  800548:	73 24                	jae    80056e <getuint+0xeb>
  80054a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80054e:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800552:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800556:	8b 00                	mov    (%rax),%eax
  800558:	89 c0                	mov    %eax,%eax
  80055a:	48 01 d0             	add    %rdx,%rax
  80055d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800561:	8b 12                	mov    (%rdx),%edx
  800563:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800566:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80056a:	89 0a                	mov    %ecx,(%rdx)
  80056c:	eb 17                	jmp    800585 <getuint+0x102>
  80056e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800572:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800576:	48 89 d0             	mov    %rdx,%rax
  800579:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  80057d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800581:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800585:	8b 00                	mov    (%rax),%eax
  800587:	89 c0                	mov    %eax,%eax
  800589:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80058d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800591:	c9                   	leaveq 
  800592:	c3                   	retq   

0000000000800593 <getint>:
  800593:	55                   	push   %rbp
  800594:	48 89 e5             	mov    %rsp,%rbp
  800597:	48 83 ec 1c          	sub    $0x1c,%rsp
  80059b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80059f:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8005a2:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8005a6:	7e 52                	jle    8005fa <getint+0x67>
  8005a8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005ac:	8b 00                	mov    (%rax),%eax
  8005ae:	83 f8 30             	cmp    $0x30,%eax
  8005b1:	73 24                	jae    8005d7 <getint+0x44>
  8005b3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005b7:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8005bb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005bf:	8b 00                	mov    (%rax),%eax
  8005c1:	89 c0                	mov    %eax,%eax
  8005c3:	48 01 d0             	add    %rdx,%rax
  8005c6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8005ca:	8b 12                	mov    (%rdx),%edx
  8005cc:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8005cf:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8005d3:	89 0a                	mov    %ecx,(%rdx)
  8005d5:	eb 17                	jmp    8005ee <getint+0x5b>
  8005d7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005db:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8005df:	48 89 d0             	mov    %rdx,%rax
  8005e2:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8005e6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8005ea:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8005ee:	48 8b 00             	mov    (%rax),%rax
  8005f1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8005f5:	e9 a3 00 00 00       	jmpq   80069d <getint+0x10a>
  8005fa:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  8005fe:	74 4f                	je     80064f <getint+0xbc>
  800600:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800604:	8b 00                	mov    (%rax),%eax
  800606:	83 f8 30             	cmp    $0x30,%eax
  800609:	73 24                	jae    80062f <getint+0x9c>
  80060b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80060f:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800613:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800617:	8b 00                	mov    (%rax),%eax
  800619:	89 c0                	mov    %eax,%eax
  80061b:	48 01 d0             	add    %rdx,%rax
  80061e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800622:	8b 12                	mov    (%rdx),%edx
  800624:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800627:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80062b:	89 0a                	mov    %ecx,(%rdx)
  80062d:	eb 17                	jmp    800646 <getint+0xb3>
  80062f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800633:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800637:	48 89 d0             	mov    %rdx,%rax
  80063a:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  80063e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800642:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800646:	48 8b 00             	mov    (%rax),%rax
  800649:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80064d:	eb 4e                	jmp    80069d <getint+0x10a>
  80064f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800653:	8b 00                	mov    (%rax),%eax
  800655:	83 f8 30             	cmp    $0x30,%eax
  800658:	73 24                	jae    80067e <getint+0xeb>
  80065a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80065e:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800662:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800666:	8b 00                	mov    (%rax),%eax
  800668:	89 c0                	mov    %eax,%eax
  80066a:	48 01 d0             	add    %rdx,%rax
  80066d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800671:	8b 12                	mov    (%rdx),%edx
  800673:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800676:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80067a:	89 0a                	mov    %ecx,(%rdx)
  80067c:	eb 17                	jmp    800695 <getint+0x102>
  80067e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800682:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800686:	48 89 d0             	mov    %rdx,%rax
  800689:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  80068d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800691:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800695:	8b 00                	mov    (%rax),%eax
  800697:	48 98                	cltq   
  800699:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80069d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8006a1:	c9                   	leaveq 
  8006a2:	c3                   	retq   

00000000008006a3 <vprintfmt>:
  8006a3:	55                   	push   %rbp
  8006a4:	48 89 e5             	mov    %rsp,%rbp
  8006a7:	41 54                	push   %r12
  8006a9:	53                   	push   %rbx
  8006aa:	48 83 ec 60          	sub    $0x60,%rsp
  8006ae:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  8006b2:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  8006b6:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8006ba:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  8006be:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8006c2:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  8006c6:	48 8b 0a             	mov    (%rdx),%rcx
  8006c9:	48 89 08             	mov    %rcx,(%rax)
  8006cc:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8006d0:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8006d4:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8006d8:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8006dc:	eb 17                	jmp    8006f5 <vprintfmt+0x52>
  8006de:	85 db                	test   %ebx,%ebx
  8006e0:	0f 84 cc 04 00 00    	je     800bb2 <vprintfmt+0x50f>
  8006e6:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8006ea:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8006ee:	48 89 d6             	mov    %rdx,%rsi
  8006f1:	89 df                	mov    %ebx,%edi
  8006f3:	ff d0                	callq  *%rax
  8006f5:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8006f9:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8006fd:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800701:	0f b6 00             	movzbl (%rax),%eax
  800704:	0f b6 d8             	movzbl %al,%ebx
  800707:	83 fb 25             	cmp    $0x25,%ebx
  80070a:	75 d2                	jne    8006de <vprintfmt+0x3b>
  80070c:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  800710:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  800717:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  80071e:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800725:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  80072c:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800730:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800734:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800738:	0f b6 00             	movzbl (%rax),%eax
  80073b:	0f b6 d8             	movzbl %al,%ebx
  80073e:	8d 43 dd             	lea    -0x23(%rbx),%eax
  800741:	83 f8 55             	cmp    $0x55,%eax
  800744:	0f 87 34 04 00 00    	ja     800b7e <vprintfmt+0x4db>
  80074a:	89 c0                	mov    %eax,%eax
  80074c:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800753:	00 
  800754:	48 b8 d8 47 80 00 00 	movabs $0x8047d8,%rax
  80075b:	00 00 00 
  80075e:	48 01 d0             	add    %rdx,%rax
  800761:	48 8b 00             	mov    (%rax),%rax
  800764:	ff e0                	jmpq   *%rax
  800766:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  80076a:	eb c0                	jmp    80072c <vprintfmt+0x89>
  80076c:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  800770:	eb ba                	jmp    80072c <vprintfmt+0x89>
  800772:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  800779:	8b 55 d8             	mov    -0x28(%rbp),%edx
  80077c:	89 d0                	mov    %edx,%eax
  80077e:	c1 e0 02             	shl    $0x2,%eax
  800781:	01 d0                	add    %edx,%eax
  800783:	01 c0                	add    %eax,%eax
  800785:	01 d8                	add    %ebx,%eax
  800787:	83 e8 30             	sub    $0x30,%eax
  80078a:	89 45 d8             	mov    %eax,-0x28(%rbp)
  80078d:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800791:	0f b6 00             	movzbl (%rax),%eax
  800794:	0f be d8             	movsbl %al,%ebx
  800797:	83 fb 2f             	cmp    $0x2f,%ebx
  80079a:	7e 0c                	jle    8007a8 <vprintfmt+0x105>
  80079c:	83 fb 39             	cmp    $0x39,%ebx
  80079f:	7f 07                	jg     8007a8 <vprintfmt+0x105>
  8007a1:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  8007a6:	eb d1                	jmp    800779 <vprintfmt+0xd6>
  8007a8:	eb 58                	jmp    800802 <vprintfmt+0x15f>
  8007aa:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8007ad:	83 f8 30             	cmp    $0x30,%eax
  8007b0:	73 17                	jae    8007c9 <vprintfmt+0x126>
  8007b2:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8007b6:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8007b9:	89 c0                	mov    %eax,%eax
  8007bb:	48 01 d0             	add    %rdx,%rax
  8007be:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8007c1:	83 c2 08             	add    $0x8,%edx
  8007c4:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8007c7:	eb 0f                	jmp    8007d8 <vprintfmt+0x135>
  8007c9:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  8007cd:	48 89 d0             	mov    %rdx,%rax
  8007d0:	48 83 c2 08          	add    $0x8,%rdx
  8007d4:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8007d8:	8b 00                	mov    (%rax),%eax
  8007da:	89 45 d8             	mov    %eax,-0x28(%rbp)
  8007dd:	eb 23                	jmp    800802 <vprintfmt+0x15f>
  8007df:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8007e3:	79 0c                	jns    8007f1 <vprintfmt+0x14e>
  8007e5:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  8007ec:	e9 3b ff ff ff       	jmpq   80072c <vprintfmt+0x89>
  8007f1:	e9 36 ff ff ff       	jmpq   80072c <vprintfmt+0x89>
  8007f6:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  8007fd:	e9 2a ff ff ff       	jmpq   80072c <vprintfmt+0x89>
  800802:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800806:	79 12                	jns    80081a <vprintfmt+0x177>
  800808:	8b 45 d8             	mov    -0x28(%rbp),%eax
  80080b:	89 45 dc             	mov    %eax,-0x24(%rbp)
  80080e:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800815:	e9 12 ff ff ff       	jmpq   80072c <vprintfmt+0x89>
  80081a:	e9 0d ff ff ff       	jmpq   80072c <vprintfmt+0x89>
  80081f:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  800823:	e9 04 ff ff ff       	jmpq   80072c <vprintfmt+0x89>
  800828:	8b 45 b8             	mov    -0x48(%rbp),%eax
  80082b:	83 f8 30             	cmp    $0x30,%eax
  80082e:	73 17                	jae    800847 <vprintfmt+0x1a4>
  800830:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800834:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800837:	89 c0                	mov    %eax,%eax
  800839:	48 01 d0             	add    %rdx,%rax
  80083c:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80083f:	83 c2 08             	add    $0x8,%edx
  800842:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800845:	eb 0f                	jmp    800856 <vprintfmt+0x1b3>
  800847:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  80084b:	48 89 d0             	mov    %rdx,%rax
  80084e:	48 83 c2 08          	add    $0x8,%rdx
  800852:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800856:	8b 10                	mov    (%rax),%edx
  800858:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  80085c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800860:	48 89 ce             	mov    %rcx,%rsi
  800863:	89 d7                	mov    %edx,%edi
  800865:	ff d0                	callq  *%rax
  800867:	e9 40 03 00 00       	jmpq   800bac <vprintfmt+0x509>
  80086c:	8b 45 b8             	mov    -0x48(%rbp),%eax
  80086f:	83 f8 30             	cmp    $0x30,%eax
  800872:	73 17                	jae    80088b <vprintfmt+0x1e8>
  800874:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800878:	8b 45 b8             	mov    -0x48(%rbp),%eax
  80087b:	89 c0                	mov    %eax,%eax
  80087d:	48 01 d0             	add    %rdx,%rax
  800880:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800883:	83 c2 08             	add    $0x8,%edx
  800886:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800889:	eb 0f                	jmp    80089a <vprintfmt+0x1f7>
  80088b:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  80088f:	48 89 d0             	mov    %rdx,%rax
  800892:	48 83 c2 08          	add    $0x8,%rdx
  800896:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  80089a:	8b 18                	mov    (%rax),%ebx
  80089c:	85 db                	test   %ebx,%ebx
  80089e:	79 02                	jns    8008a2 <vprintfmt+0x1ff>
  8008a0:	f7 db                	neg    %ebx
  8008a2:	83 fb 15             	cmp    $0x15,%ebx
  8008a5:	7f 16                	jg     8008bd <vprintfmt+0x21a>
  8008a7:	48 b8 00 47 80 00 00 	movabs $0x804700,%rax
  8008ae:	00 00 00 
  8008b1:	48 63 d3             	movslq %ebx,%rdx
  8008b4:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  8008b8:	4d 85 e4             	test   %r12,%r12
  8008bb:	75 2e                	jne    8008eb <vprintfmt+0x248>
  8008bd:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  8008c1:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8008c5:	89 d9                	mov    %ebx,%ecx
  8008c7:	48 ba c1 47 80 00 00 	movabs $0x8047c1,%rdx
  8008ce:	00 00 00 
  8008d1:	48 89 c7             	mov    %rax,%rdi
  8008d4:	b8 00 00 00 00       	mov    $0x0,%eax
  8008d9:	49 b8 bb 0b 80 00 00 	movabs $0x800bbb,%r8
  8008e0:	00 00 00 
  8008e3:	41 ff d0             	callq  *%r8
  8008e6:	e9 c1 02 00 00       	jmpq   800bac <vprintfmt+0x509>
  8008eb:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  8008ef:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8008f3:	4c 89 e1             	mov    %r12,%rcx
  8008f6:	48 ba ca 47 80 00 00 	movabs $0x8047ca,%rdx
  8008fd:	00 00 00 
  800900:	48 89 c7             	mov    %rax,%rdi
  800903:	b8 00 00 00 00       	mov    $0x0,%eax
  800908:	49 b8 bb 0b 80 00 00 	movabs $0x800bbb,%r8
  80090f:	00 00 00 
  800912:	41 ff d0             	callq  *%r8
  800915:	e9 92 02 00 00       	jmpq   800bac <vprintfmt+0x509>
  80091a:	8b 45 b8             	mov    -0x48(%rbp),%eax
  80091d:	83 f8 30             	cmp    $0x30,%eax
  800920:	73 17                	jae    800939 <vprintfmt+0x296>
  800922:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800926:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800929:	89 c0                	mov    %eax,%eax
  80092b:	48 01 d0             	add    %rdx,%rax
  80092e:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800931:	83 c2 08             	add    $0x8,%edx
  800934:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800937:	eb 0f                	jmp    800948 <vprintfmt+0x2a5>
  800939:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  80093d:	48 89 d0             	mov    %rdx,%rax
  800940:	48 83 c2 08          	add    $0x8,%rdx
  800944:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800948:	4c 8b 20             	mov    (%rax),%r12
  80094b:	4d 85 e4             	test   %r12,%r12
  80094e:	75 0a                	jne    80095a <vprintfmt+0x2b7>
  800950:	49 bc cd 47 80 00 00 	movabs $0x8047cd,%r12
  800957:	00 00 00 
  80095a:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  80095e:	7e 3f                	jle    80099f <vprintfmt+0x2fc>
  800960:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  800964:	74 39                	je     80099f <vprintfmt+0x2fc>
  800966:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800969:	48 98                	cltq   
  80096b:	48 89 c6             	mov    %rax,%rsi
  80096e:	4c 89 e7             	mov    %r12,%rdi
  800971:	48 b8 c1 0f 80 00 00 	movabs $0x800fc1,%rax
  800978:	00 00 00 
  80097b:	ff d0                	callq  *%rax
  80097d:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800980:	eb 17                	jmp    800999 <vprintfmt+0x2f6>
  800982:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800986:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  80098a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80098e:	48 89 ce             	mov    %rcx,%rsi
  800991:	89 d7                	mov    %edx,%edi
  800993:	ff d0                	callq  *%rax
  800995:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800999:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  80099d:	7f e3                	jg     800982 <vprintfmt+0x2df>
  80099f:	eb 37                	jmp    8009d8 <vprintfmt+0x335>
  8009a1:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  8009a5:	74 1e                	je     8009c5 <vprintfmt+0x322>
  8009a7:	83 fb 1f             	cmp    $0x1f,%ebx
  8009aa:	7e 05                	jle    8009b1 <vprintfmt+0x30e>
  8009ac:	83 fb 7e             	cmp    $0x7e,%ebx
  8009af:	7e 14                	jle    8009c5 <vprintfmt+0x322>
  8009b1:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8009b5:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8009b9:	48 89 d6             	mov    %rdx,%rsi
  8009bc:	bf 3f 00 00 00       	mov    $0x3f,%edi
  8009c1:	ff d0                	callq  *%rax
  8009c3:	eb 0f                	jmp    8009d4 <vprintfmt+0x331>
  8009c5:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8009c9:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8009cd:	48 89 d6             	mov    %rdx,%rsi
  8009d0:	89 df                	mov    %ebx,%edi
  8009d2:	ff d0                	callq  *%rax
  8009d4:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  8009d8:	4c 89 e0             	mov    %r12,%rax
  8009db:	4c 8d 60 01          	lea    0x1(%rax),%r12
  8009df:	0f b6 00             	movzbl (%rax),%eax
  8009e2:	0f be d8             	movsbl %al,%ebx
  8009e5:	85 db                	test   %ebx,%ebx
  8009e7:	74 10                	je     8009f9 <vprintfmt+0x356>
  8009e9:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  8009ed:	78 b2                	js     8009a1 <vprintfmt+0x2fe>
  8009ef:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  8009f3:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  8009f7:	79 a8                	jns    8009a1 <vprintfmt+0x2fe>
  8009f9:	eb 16                	jmp    800a11 <vprintfmt+0x36e>
  8009fb:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8009ff:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a03:	48 89 d6             	mov    %rdx,%rsi
  800a06:	bf 20 00 00 00       	mov    $0x20,%edi
  800a0b:	ff d0                	callq  *%rax
  800a0d:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800a11:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800a15:	7f e4                	jg     8009fb <vprintfmt+0x358>
  800a17:	e9 90 01 00 00       	jmpq   800bac <vprintfmt+0x509>
  800a1c:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800a20:	be 03 00 00 00       	mov    $0x3,%esi
  800a25:	48 89 c7             	mov    %rax,%rdi
  800a28:	48 b8 93 05 80 00 00 	movabs $0x800593,%rax
  800a2f:	00 00 00 
  800a32:	ff d0                	callq  *%rax
  800a34:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800a38:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a3c:	48 85 c0             	test   %rax,%rax
  800a3f:	79 1d                	jns    800a5e <vprintfmt+0x3bb>
  800a41:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800a45:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a49:	48 89 d6             	mov    %rdx,%rsi
  800a4c:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800a51:	ff d0                	callq  *%rax
  800a53:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a57:	48 f7 d8             	neg    %rax
  800a5a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800a5e:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800a65:	e9 d5 00 00 00       	jmpq   800b3f <vprintfmt+0x49c>
  800a6a:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800a6e:	be 03 00 00 00       	mov    $0x3,%esi
  800a73:	48 89 c7             	mov    %rax,%rdi
  800a76:	48 b8 83 04 80 00 00 	movabs $0x800483,%rax
  800a7d:	00 00 00 
  800a80:	ff d0                	callq  *%rax
  800a82:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800a86:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800a8d:	e9 ad 00 00 00       	jmpq   800b3f <vprintfmt+0x49c>
  800a92:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800a96:	be 03 00 00 00       	mov    $0x3,%esi
  800a9b:	48 89 c7             	mov    %rax,%rdi
  800a9e:	48 b8 83 04 80 00 00 	movabs $0x800483,%rax
  800aa5:	00 00 00 
  800aa8:	ff d0                	callq  *%rax
  800aaa:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800aae:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800ab5:	e9 85 00 00 00       	jmpq   800b3f <vprintfmt+0x49c>
  800aba:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800abe:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ac2:	48 89 d6             	mov    %rdx,%rsi
  800ac5:	bf 30 00 00 00       	mov    $0x30,%edi
  800aca:	ff d0                	callq  *%rax
  800acc:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800ad0:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ad4:	48 89 d6             	mov    %rdx,%rsi
  800ad7:	bf 78 00 00 00       	mov    $0x78,%edi
  800adc:	ff d0                	callq  *%rax
  800ade:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800ae1:	83 f8 30             	cmp    $0x30,%eax
  800ae4:	73 17                	jae    800afd <vprintfmt+0x45a>
  800ae6:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800aea:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800aed:	89 c0                	mov    %eax,%eax
  800aef:	48 01 d0             	add    %rdx,%rax
  800af2:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800af5:	83 c2 08             	add    $0x8,%edx
  800af8:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800afb:	eb 0f                	jmp    800b0c <vprintfmt+0x469>
  800afd:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800b01:	48 89 d0             	mov    %rdx,%rax
  800b04:	48 83 c2 08          	add    $0x8,%rdx
  800b08:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800b0c:	48 8b 00             	mov    (%rax),%rax
  800b0f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800b13:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800b1a:	eb 23                	jmp    800b3f <vprintfmt+0x49c>
  800b1c:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800b20:	be 03 00 00 00       	mov    $0x3,%esi
  800b25:	48 89 c7             	mov    %rax,%rdi
  800b28:	48 b8 83 04 80 00 00 	movabs $0x800483,%rax
  800b2f:	00 00 00 
  800b32:	ff d0                	callq  *%rax
  800b34:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800b38:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800b3f:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  800b44:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800b47:	8b 7d dc             	mov    -0x24(%rbp),%edi
  800b4a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b4e:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800b52:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b56:	45 89 c1             	mov    %r8d,%r9d
  800b59:	41 89 f8             	mov    %edi,%r8d
  800b5c:	48 89 c7             	mov    %rax,%rdi
  800b5f:	48 b8 c8 03 80 00 00 	movabs $0x8003c8,%rax
  800b66:	00 00 00 
  800b69:	ff d0                	callq  *%rax
  800b6b:	eb 3f                	jmp    800bac <vprintfmt+0x509>
  800b6d:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800b71:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b75:	48 89 d6             	mov    %rdx,%rsi
  800b78:	89 df                	mov    %ebx,%edi
  800b7a:	ff d0                	callq  *%rax
  800b7c:	eb 2e                	jmp    800bac <vprintfmt+0x509>
  800b7e:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800b82:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b86:	48 89 d6             	mov    %rdx,%rsi
  800b89:	bf 25 00 00 00       	mov    $0x25,%edi
  800b8e:	ff d0                	callq  *%rax
  800b90:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800b95:	eb 05                	jmp    800b9c <vprintfmt+0x4f9>
  800b97:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800b9c:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800ba0:	48 83 e8 01          	sub    $0x1,%rax
  800ba4:	0f b6 00             	movzbl (%rax),%eax
  800ba7:	3c 25                	cmp    $0x25,%al
  800ba9:	75 ec                	jne    800b97 <vprintfmt+0x4f4>
  800bab:	90                   	nop
  800bac:	90                   	nop
  800bad:	e9 43 fb ff ff       	jmpq   8006f5 <vprintfmt+0x52>
  800bb2:	48 83 c4 60          	add    $0x60,%rsp
  800bb6:	5b                   	pop    %rbx
  800bb7:	41 5c                	pop    %r12
  800bb9:	5d                   	pop    %rbp
  800bba:	c3                   	retq   

0000000000800bbb <printfmt>:
  800bbb:	55                   	push   %rbp
  800bbc:	48 89 e5             	mov    %rsp,%rbp
  800bbf:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  800bc6:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  800bcd:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  800bd4:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800bdb:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800be2:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800be9:	84 c0                	test   %al,%al
  800beb:	74 20                	je     800c0d <printfmt+0x52>
  800bed:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800bf1:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800bf5:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800bf9:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800bfd:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800c01:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800c05:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800c09:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800c0d:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  800c14:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  800c1b:	00 00 00 
  800c1e:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  800c25:	00 00 00 
  800c28:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800c2c:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800c33:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800c3a:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  800c41:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  800c48:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800c4f:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  800c56:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  800c5d:	48 89 c7             	mov    %rax,%rdi
  800c60:	48 b8 a3 06 80 00 00 	movabs $0x8006a3,%rax
  800c67:	00 00 00 
  800c6a:	ff d0                	callq  *%rax
  800c6c:	c9                   	leaveq 
  800c6d:	c3                   	retq   

0000000000800c6e <sprintputch>:
  800c6e:	55                   	push   %rbp
  800c6f:	48 89 e5             	mov    %rsp,%rbp
  800c72:	48 83 ec 10          	sub    $0x10,%rsp
  800c76:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800c79:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800c7d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800c81:	8b 40 10             	mov    0x10(%rax),%eax
  800c84:	8d 50 01             	lea    0x1(%rax),%edx
  800c87:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800c8b:	89 50 10             	mov    %edx,0x10(%rax)
  800c8e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800c92:	48 8b 10             	mov    (%rax),%rdx
  800c95:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800c99:	48 8b 40 08          	mov    0x8(%rax),%rax
  800c9d:	48 39 c2             	cmp    %rax,%rdx
  800ca0:	73 17                	jae    800cb9 <sprintputch+0x4b>
  800ca2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800ca6:	48 8b 00             	mov    (%rax),%rax
  800ca9:	48 8d 48 01          	lea    0x1(%rax),%rcx
  800cad:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800cb1:	48 89 0a             	mov    %rcx,(%rdx)
  800cb4:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800cb7:	88 10                	mov    %dl,(%rax)
  800cb9:	c9                   	leaveq 
  800cba:	c3                   	retq   

0000000000800cbb <vsnprintf>:
  800cbb:	55                   	push   %rbp
  800cbc:	48 89 e5             	mov    %rsp,%rbp
  800cbf:	48 83 ec 50          	sub    $0x50,%rsp
  800cc3:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  800cc7:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  800cca:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  800cce:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  800cd2:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  800cd6:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  800cda:	48 8b 0a             	mov    (%rdx),%rcx
  800cdd:	48 89 08             	mov    %rcx,(%rax)
  800ce0:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800ce4:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800ce8:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800cec:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800cf0:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800cf4:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  800cf8:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  800cfb:	48 98                	cltq   
  800cfd:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  800d01:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800d05:	48 01 d0             	add    %rdx,%rax
  800d08:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  800d0c:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800d13:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  800d18:	74 06                	je     800d20 <vsnprintf+0x65>
  800d1a:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  800d1e:	7f 07                	jg     800d27 <vsnprintf+0x6c>
  800d20:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800d25:	eb 2f                	jmp    800d56 <vsnprintf+0x9b>
  800d27:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  800d2b:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  800d2f:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  800d33:	48 89 c6             	mov    %rax,%rsi
  800d36:	48 bf 6e 0c 80 00 00 	movabs $0x800c6e,%rdi
  800d3d:	00 00 00 
  800d40:	48 b8 a3 06 80 00 00 	movabs $0x8006a3,%rax
  800d47:	00 00 00 
  800d4a:	ff d0                	callq  *%rax
  800d4c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800d50:	c6 00 00             	movb   $0x0,(%rax)
  800d53:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800d56:	c9                   	leaveq 
  800d57:	c3                   	retq   

0000000000800d58 <snprintf>:
  800d58:	55                   	push   %rbp
  800d59:	48 89 e5             	mov    %rsp,%rbp
  800d5c:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  800d63:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800d6a:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  800d70:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800d77:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800d7e:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800d85:	84 c0                	test   %al,%al
  800d87:	74 20                	je     800da9 <snprintf+0x51>
  800d89:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800d8d:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800d91:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800d95:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800d99:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800d9d:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800da1:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800da5:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800da9:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  800db0:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  800db7:	00 00 00 
  800dba:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800dc1:	00 00 00 
  800dc4:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800dc8:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800dcf:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800dd6:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800ddd:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800de4:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800deb:	48 8b 0a             	mov    (%rdx),%rcx
  800dee:	48 89 08             	mov    %rcx,(%rax)
  800df1:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800df5:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800df9:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800dfd:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800e01:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  800e08:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  800e0f:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  800e15:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800e1c:	48 89 c7             	mov    %rax,%rdi
  800e1f:	48 b8 bb 0c 80 00 00 	movabs $0x800cbb,%rax
  800e26:	00 00 00 
  800e29:	ff d0                	callq  *%rax
  800e2b:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  800e31:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  800e37:	c9                   	leaveq 
  800e38:	c3                   	retq   

0000000000800e39 <readline>:
  800e39:	55                   	push   %rbp
  800e3a:	48 89 e5             	mov    %rsp,%rbp
  800e3d:	48 83 ec 20          	sub    $0x20,%rsp
  800e41:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800e45:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  800e4a:	74 27                	je     800e73 <readline+0x3a>
  800e4c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e50:	48 89 c2             	mov    %rax,%rdx
  800e53:	48 be 88 4a 80 00 00 	movabs $0x804a88,%rsi
  800e5a:	00 00 00 
  800e5d:	bf 01 00 00 00       	mov    $0x1,%edi
  800e62:	b8 00 00 00 00       	mov    $0x0,%eax
  800e67:	48 b9 cd 2f 80 00 00 	movabs $0x802fcd,%rcx
  800e6e:	00 00 00 
  800e71:	ff d1                	callq  *%rcx
  800e73:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800e7a:	bf 00 00 00 00       	mov    $0x0,%edi
  800e7f:	48 b8 84 3f 80 00 00 	movabs $0x803f84,%rax
  800e86:	00 00 00 
  800e89:	ff d0                	callq  *%rax
  800e8b:	89 45 f8             	mov    %eax,-0x8(%rbp)
  800e8e:	48 b8 3b 3f 80 00 00 	movabs $0x803f3b,%rax
  800e95:	00 00 00 
  800e98:	ff d0                	callq  *%rax
  800e9a:	89 45 f4             	mov    %eax,-0xc(%rbp)
  800e9d:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  800ea1:	79 30                	jns    800ed3 <readline+0x9a>
  800ea3:	83 7d f4 f7          	cmpl   $0xfffffff7,-0xc(%rbp)
  800ea7:	74 20                	je     800ec9 <readline+0x90>
  800ea9:	8b 45 f4             	mov    -0xc(%rbp),%eax
  800eac:	89 c6                	mov    %eax,%esi
  800eae:	48 bf 8b 4a 80 00 00 	movabs $0x804a8b,%rdi
  800eb5:	00 00 00 
  800eb8:	b8 00 00 00 00       	mov    $0x0,%eax
  800ebd:	48 ba f0 02 80 00 00 	movabs $0x8002f0,%rdx
  800ec4:	00 00 00 
  800ec7:	ff d2                	callq  *%rdx
  800ec9:	b8 00 00 00 00       	mov    $0x0,%eax
  800ece:	e9 be 00 00 00       	jmpq   800f91 <readline+0x158>
  800ed3:	83 7d f4 08          	cmpl   $0x8,-0xc(%rbp)
  800ed7:	74 06                	je     800edf <readline+0xa6>
  800ed9:	83 7d f4 7f          	cmpl   $0x7f,-0xc(%rbp)
  800edd:	75 26                	jne    800f05 <readline+0xcc>
  800edf:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800ee3:	7e 20                	jle    800f05 <readline+0xcc>
  800ee5:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  800ee9:	74 11                	je     800efc <readline+0xc3>
  800eeb:	bf 08 00 00 00       	mov    $0x8,%edi
  800ef0:	48 b8 10 3f 80 00 00 	movabs $0x803f10,%rax
  800ef7:	00 00 00 
  800efa:	ff d0                	callq  *%rax
  800efc:	83 6d fc 01          	subl   $0x1,-0x4(%rbp)
  800f00:	e9 87 00 00 00       	jmpq   800f8c <readline+0x153>
  800f05:	83 7d f4 1f          	cmpl   $0x1f,-0xc(%rbp)
  800f09:	7e 3f                	jle    800f4a <readline+0x111>
  800f0b:	81 7d fc fe 03 00 00 	cmpl   $0x3fe,-0x4(%rbp)
  800f12:	7f 36                	jg     800f4a <readline+0x111>
  800f14:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  800f18:	74 11                	je     800f2b <readline+0xf2>
  800f1a:	8b 45 f4             	mov    -0xc(%rbp),%eax
  800f1d:	89 c7                	mov    %eax,%edi
  800f1f:	48 b8 10 3f 80 00 00 	movabs $0x803f10,%rax
  800f26:	00 00 00 
  800f29:	ff d0                	callq  *%rax
  800f2b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800f2e:	8d 50 01             	lea    0x1(%rax),%edx
  800f31:	89 55 fc             	mov    %edx,-0x4(%rbp)
  800f34:	8b 55 f4             	mov    -0xc(%rbp),%edx
  800f37:	89 d1                	mov    %edx,%ecx
  800f39:	48 ba 00 70 80 00 00 	movabs $0x807000,%rdx
  800f40:	00 00 00 
  800f43:	48 98                	cltq   
  800f45:	88 0c 02             	mov    %cl,(%rdx,%rax,1)
  800f48:	eb 42                	jmp    800f8c <readline+0x153>
  800f4a:	83 7d f4 0a          	cmpl   $0xa,-0xc(%rbp)
  800f4e:	74 06                	je     800f56 <readline+0x11d>
  800f50:	83 7d f4 0d          	cmpl   $0xd,-0xc(%rbp)
  800f54:	75 36                	jne    800f8c <readline+0x153>
  800f56:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  800f5a:	74 11                	je     800f6d <readline+0x134>
  800f5c:	bf 0a 00 00 00       	mov    $0xa,%edi
  800f61:	48 b8 10 3f 80 00 00 	movabs $0x803f10,%rax
  800f68:	00 00 00 
  800f6b:	ff d0                	callq  *%rax
  800f6d:	48 ba 00 70 80 00 00 	movabs $0x807000,%rdx
  800f74:	00 00 00 
  800f77:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800f7a:	48 98                	cltq   
  800f7c:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
  800f80:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  800f87:	00 00 00 
  800f8a:	eb 05                	jmp    800f91 <readline+0x158>
  800f8c:	e9 fd fe ff ff       	jmpq   800e8e <readline+0x55>
  800f91:	c9                   	leaveq 
  800f92:	c3                   	retq   

0000000000800f93 <strlen>:
  800f93:	55                   	push   %rbp
  800f94:	48 89 e5             	mov    %rsp,%rbp
  800f97:	48 83 ec 18          	sub    $0x18,%rsp
  800f9b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800f9f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800fa6:	eb 09                	jmp    800fb1 <strlen+0x1e>
  800fa8:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800fac:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  800fb1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800fb5:	0f b6 00             	movzbl (%rax),%eax
  800fb8:	84 c0                	test   %al,%al
  800fba:	75 ec                	jne    800fa8 <strlen+0x15>
  800fbc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800fbf:	c9                   	leaveq 
  800fc0:	c3                   	retq   

0000000000800fc1 <strnlen>:
  800fc1:	55                   	push   %rbp
  800fc2:	48 89 e5             	mov    %rsp,%rbp
  800fc5:	48 83 ec 20          	sub    $0x20,%rsp
  800fc9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800fcd:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800fd1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800fd8:	eb 0e                	jmp    800fe8 <strnlen+0x27>
  800fda:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800fde:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  800fe3:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  800fe8:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  800fed:	74 0b                	je     800ffa <strnlen+0x39>
  800fef:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ff3:	0f b6 00             	movzbl (%rax),%eax
  800ff6:	84 c0                	test   %al,%al
  800ff8:	75 e0                	jne    800fda <strnlen+0x19>
  800ffa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800ffd:	c9                   	leaveq 
  800ffe:	c3                   	retq   

0000000000800fff <strcpy>:
  800fff:	55                   	push   %rbp
  801000:	48 89 e5             	mov    %rsp,%rbp
  801003:	48 83 ec 20          	sub    $0x20,%rsp
  801007:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80100b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80100f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801013:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801017:	90                   	nop
  801018:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80101c:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801020:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801024:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801028:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  80102c:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  801030:	0f b6 12             	movzbl (%rdx),%edx
  801033:	88 10                	mov    %dl,(%rax)
  801035:	0f b6 00             	movzbl (%rax),%eax
  801038:	84 c0                	test   %al,%al
  80103a:	75 dc                	jne    801018 <strcpy+0x19>
  80103c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801040:	c9                   	leaveq 
  801041:	c3                   	retq   

0000000000801042 <strcat>:
  801042:	55                   	push   %rbp
  801043:	48 89 e5             	mov    %rsp,%rbp
  801046:	48 83 ec 20          	sub    $0x20,%rsp
  80104a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80104e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801052:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801056:	48 89 c7             	mov    %rax,%rdi
  801059:	48 b8 93 0f 80 00 00 	movabs $0x800f93,%rax
  801060:	00 00 00 
  801063:	ff d0                	callq  *%rax
  801065:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801068:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80106b:	48 63 d0             	movslq %eax,%rdx
  80106e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801072:	48 01 c2             	add    %rax,%rdx
  801075:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801079:	48 89 c6             	mov    %rax,%rsi
  80107c:	48 89 d7             	mov    %rdx,%rdi
  80107f:	48 b8 ff 0f 80 00 00 	movabs $0x800fff,%rax
  801086:	00 00 00 
  801089:	ff d0                	callq  *%rax
  80108b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80108f:	c9                   	leaveq 
  801090:	c3                   	retq   

0000000000801091 <strncpy>:
  801091:	55                   	push   %rbp
  801092:	48 89 e5             	mov    %rsp,%rbp
  801095:	48 83 ec 28          	sub    $0x28,%rsp
  801099:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80109d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8010a1:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8010a5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010a9:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8010ad:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8010b4:	00 
  8010b5:	eb 2a                	jmp    8010e1 <strncpy+0x50>
  8010b7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010bb:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8010bf:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8010c3:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8010c7:	0f b6 12             	movzbl (%rdx),%edx
  8010ca:	88 10                	mov    %dl,(%rax)
  8010cc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8010d0:	0f b6 00             	movzbl (%rax),%eax
  8010d3:	84 c0                	test   %al,%al
  8010d5:	74 05                	je     8010dc <strncpy+0x4b>
  8010d7:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  8010dc:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8010e1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010e5:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8010e9:	72 cc                	jb     8010b7 <strncpy+0x26>
  8010eb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8010ef:	c9                   	leaveq 
  8010f0:	c3                   	retq   

00000000008010f1 <strlcpy>:
  8010f1:	55                   	push   %rbp
  8010f2:	48 89 e5             	mov    %rsp,%rbp
  8010f5:	48 83 ec 28          	sub    $0x28,%rsp
  8010f9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8010fd:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801101:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801105:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801109:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80110d:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801112:	74 3d                	je     801151 <strlcpy+0x60>
  801114:	eb 1d                	jmp    801133 <strlcpy+0x42>
  801116:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80111a:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80111e:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801122:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801126:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  80112a:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  80112e:	0f b6 12             	movzbl (%rdx),%edx
  801131:	88 10                	mov    %dl,(%rax)
  801133:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  801138:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80113d:	74 0b                	je     80114a <strlcpy+0x59>
  80113f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801143:	0f b6 00             	movzbl (%rax),%eax
  801146:	84 c0                	test   %al,%al
  801148:	75 cc                	jne    801116 <strlcpy+0x25>
  80114a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80114e:	c6 00 00             	movb   $0x0,(%rax)
  801151:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801155:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801159:	48 29 c2             	sub    %rax,%rdx
  80115c:	48 89 d0             	mov    %rdx,%rax
  80115f:	c9                   	leaveq 
  801160:	c3                   	retq   

0000000000801161 <strcmp>:
  801161:	55                   	push   %rbp
  801162:	48 89 e5             	mov    %rsp,%rbp
  801165:	48 83 ec 10          	sub    $0x10,%rsp
  801169:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80116d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801171:	eb 0a                	jmp    80117d <strcmp+0x1c>
  801173:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801178:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  80117d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801181:	0f b6 00             	movzbl (%rax),%eax
  801184:	84 c0                	test   %al,%al
  801186:	74 12                	je     80119a <strcmp+0x39>
  801188:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80118c:	0f b6 10             	movzbl (%rax),%edx
  80118f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801193:	0f b6 00             	movzbl (%rax),%eax
  801196:	38 c2                	cmp    %al,%dl
  801198:	74 d9                	je     801173 <strcmp+0x12>
  80119a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80119e:	0f b6 00             	movzbl (%rax),%eax
  8011a1:	0f b6 d0             	movzbl %al,%edx
  8011a4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8011a8:	0f b6 00             	movzbl (%rax),%eax
  8011ab:	0f b6 c0             	movzbl %al,%eax
  8011ae:	29 c2                	sub    %eax,%edx
  8011b0:	89 d0                	mov    %edx,%eax
  8011b2:	c9                   	leaveq 
  8011b3:	c3                   	retq   

00000000008011b4 <strncmp>:
  8011b4:	55                   	push   %rbp
  8011b5:	48 89 e5             	mov    %rsp,%rbp
  8011b8:	48 83 ec 18          	sub    $0x18,%rsp
  8011bc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8011c0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8011c4:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8011c8:	eb 0f                	jmp    8011d9 <strncmp+0x25>
  8011ca:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  8011cf:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8011d4:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8011d9:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8011de:	74 1d                	je     8011fd <strncmp+0x49>
  8011e0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011e4:	0f b6 00             	movzbl (%rax),%eax
  8011e7:	84 c0                	test   %al,%al
  8011e9:	74 12                	je     8011fd <strncmp+0x49>
  8011eb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011ef:	0f b6 10             	movzbl (%rax),%edx
  8011f2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8011f6:	0f b6 00             	movzbl (%rax),%eax
  8011f9:	38 c2                	cmp    %al,%dl
  8011fb:	74 cd                	je     8011ca <strncmp+0x16>
  8011fd:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801202:	75 07                	jne    80120b <strncmp+0x57>
  801204:	b8 00 00 00 00       	mov    $0x0,%eax
  801209:	eb 18                	jmp    801223 <strncmp+0x6f>
  80120b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80120f:	0f b6 00             	movzbl (%rax),%eax
  801212:	0f b6 d0             	movzbl %al,%edx
  801215:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801219:	0f b6 00             	movzbl (%rax),%eax
  80121c:	0f b6 c0             	movzbl %al,%eax
  80121f:	29 c2                	sub    %eax,%edx
  801221:	89 d0                	mov    %edx,%eax
  801223:	c9                   	leaveq 
  801224:	c3                   	retq   

0000000000801225 <strchr>:
  801225:	55                   	push   %rbp
  801226:	48 89 e5             	mov    %rsp,%rbp
  801229:	48 83 ec 0c          	sub    $0xc,%rsp
  80122d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801231:	89 f0                	mov    %esi,%eax
  801233:	88 45 f4             	mov    %al,-0xc(%rbp)
  801236:	eb 17                	jmp    80124f <strchr+0x2a>
  801238:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80123c:	0f b6 00             	movzbl (%rax),%eax
  80123f:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801242:	75 06                	jne    80124a <strchr+0x25>
  801244:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801248:	eb 15                	jmp    80125f <strchr+0x3a>
  80124a:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80124f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801253:	0f b6 00             	movzbl (%rax),%eax
  801256:	84 c0                	test   %al,%al
  801258:	75 de                	jne    801238 <strchr+0x13>
  80125a:	b8 00 00 00 00       	mov    $0x0,%eax
  80125f:	c9                   	leaveq 
  801260:	c3                   	retq   

0000000000801261 <strfind>:
  801261:	55                   	push   %rbp
  801262:	48 89 e5             	mov    %rsp,%rbp
  801265:	48 83 ec 0c          	sub    $0xc,%rsp
  801269:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80126d:	89 f0                	mov    %esi,%eax
  80126f:	88 45 f4             	mov    %al,-0xc(%rbp)
  801272:	eb 13                	jmp    801287 <strfind+0x26>
  801274:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801278:	0f b6 00             	movzbl (%rax),%eax
  80127b:	3a 45 f4             	cmp    -0xc(%rbp),%al
  80127e:	75 02                	jne    801282 <strfind+0x21>
  801280:	eb 10                	jmp    801292 <strfind+0x31>
  801282:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801287:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80128b:	0f b6 00             	movzbl (%rax),%eax
  80128e:	84 c0                	test   %al,%al
  801290:	75 e2                	jne    801274 <strfind+0x13>
  801292:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801296:	c9                   	leaveq 
  801297:	c3                   	retq   

0000000000801298 <memset>:
  801298:	55                   	push   %rbp
  801299:	48 89 e5             	mov    %rsp,%rbp
  80129c:	48 83 ec 18          	sub    $0x18,%rsp
  8012a0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8012a4:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8012a7:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8012ab:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8012b0:	75 06                	jne    8012b8 <memset+0x20>
  8012b2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012b6:	eb 69                	jmp    801321 <memset+0x89>
  8012b8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012bc:	83 e0 03             	and    $0x3,%eax
  8012bf:	48 85 c0             	test   %rax,%rax
  8012c2:	75 48                	jne    80130c <memset+0x74>
  8012c4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012c8:	83 e0 03             	and    $0x3,%eax
  8012cb:	48 85 c0             	test   %rax,%rax
  8012ce:	75 3c                	jne    80130c <memset+0x74>
  8012d0:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  8012d7:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8012da:	c1 e0 18             	shl    $0x18,%eax
  8012dd:	89 c2                	mov    %eax,%edx
  8012df:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8012e2:	c1 e0 10             	shl    $0x10,%eax
  8012e5:	09 c2                	or     %eax,%edx
  8012e7:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8012ea:	c1 e0 08             	shl    $0x8,%eax
  8012ed:	09 d0                	or     %edx,%eax
  8012ef:	09 45 f4             	or     %eax,-0xc(%rbp)
  8012f2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012f6:	48 c1 e8 02          	shr    $0x2,%rax
  8012fa:	48 89 c1             	mov    %rax,%rcx
  8012fd:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801301:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801304:	48 89 d7             	mov    %rdx,%rdi
  801307:	fc                   	cld    
  801308:	f3 ab                	rep stos %eax,%es:(%rdi)
  80130a:	eb 11                	jmp    80131d <memset+0x85>
  80130c:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801310:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801313:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801317:	48 89 d7             	mov    %rdx,%rdi
  80131a:	fc                   	cld    
  80131b:	f3 aa                	rep stos %al,%es:(%rdi)
  80131d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801321:	c9                   	leaveq 
  801322:	c3                   	retq   

0000000000801323 <memmove>:
  801323:	55                   	push   %rbp
  801324:	48 89 e5             	mov    %rsp,%rbp
  801327:	48 83 ec 28          	sub    $0x28,%rsp
  80132b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80132f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801333:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801337:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80133b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80133f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801343:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801347:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80134b:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  80134f:	0f 83 88 00 00 00    	jae    8013dd <memmove+0xba>
  801355:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801359:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80135d:	48 01 d0             	add    %rdx,%rax
  801360:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801364:	76 77                	jbe    8013dd <memmove+0xba>
  801366:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80136a:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  80136e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801372:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  801376:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80137a:	83 e0 03             	and    $0x3,%eax
  80137d:	48 85 c0             	test   %rax,%rax
  801380:	75 3b                	jne    8013bd <memmove+0x9a>
  801382:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801386:	83 e0 03             	and    $0x3,%eax
  801389:	48 85 c0             	test   %rax,%rax
  80138c:	75 2f                	jne    8013bd <memmove+0x9a>
  80138e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801392:	83 e0 03             	and    $0x3,%eax
  801395:	48 85 c0             	test   %rax,%rax
  801398:	75 23                	jne    8013bd <memmove+0x9a>
  80139a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80139e:	48 83 e8 04          	sub    $0x4,%rax
  8013a2:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8013a6:	48 83 ea 04          	sub    $0x4,%rdx
  8013aa:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  8013ae:	48 c1 e9 02          	shr    $0x2,%rcx
  8013b2:	48 89 c7             	mov    %rax,%rdi
  8013b5:	48 89 d6             	mov    %rdx,%rsi
  8013b8:	fd                   	std    
  8013b9:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  8013bb:	eb 1d                	jmp    8013da <memmove+0xb7>
  8013bd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8013c1:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8013c5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013c9:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  8013cd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8013d1:	48 89 d7             	mov    %rdx,%rdi
  8013d4:	48 89 c1             	mov    %rax,%rcx
  8013d7:	fd                   	std    
  8013d8:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  8013da:	fc                   	cld    
  8013db:	eb 57                	jmp    801434 <memmove+0x111>
  8013dd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013e1:	83 e0 03             	and    $0x3,%eax
  8013e4:	48 85 c0             	test   %rax,%rax
  8013e7:	75 36                	jne    80141f <memmove+0xfc>
  8013e9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8013ed:	83 e0 03             	and    $0x3,%eax
  8013f0:	48 85 c0             	test   %rax,%rax
  8013f3:	75 2a                	jne    80141f <memmove+0xfc>
  8013f5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8013f9:	83 e0 03             	and    $0x3,%eax
  8013fc:	48 85 c0             	test   %rax,%rax
  8013ff:	75 1e                	jne    80141f <memmove+0xfc>
  801401:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801405:	48 c1 e8 02          	shr    $0x2,%rax
  801409:	48 89 c1             	mov    %rax,%rcx
  80140c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801410:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801414:	48 89 c7             	mov    %rax,%rdi
  801417:	48 89 d6             	mov    %rdx,%rsi
  80141a:	fc                   	cld    
  80141b:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  80141d:	eb 15                	jmp    801434 <memmove+0x111>
  80141f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801423:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801427:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  80142b:	48 89 c7             	mov    %rax,%rdi
  80142e:	48 89 d6             	mov    %rdx,%rsi
  801431:	fc                   	cld    
  801432:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801434:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801438:	c9                   	leaveq 
  801439:	c3                   	retq   

000000000080143a <memcpy>:
  80143a:	55                   	push   %rbp
  80143b:	48 89 e5             	mov    %rsp,%rbp
  80143e:	48 83 ec 18          	sub    $0x18,%rsp
  801442:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801446:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80144a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80144e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801452:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  801456:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80145a:	48 89 ce             	mov    %rcx,%rsi
  80145d:	48 89 c7             	mov    %rax,%rdi
  801460:	48 b8 23 13 80 00 00 	movabs $0x801323,%rax
  801467:	00 00 00 
  80146a:	ff d0                	callq  *%rax
  80146c:	c9                   	leaveq 
  80146d:	c3                   	retq   

000000000080146e <memcmp>:
  80146e:	55                   	push   %rbp
  80146f:	48 89 e5             	mov    %rsp,%rbp
  801472:	48 83 ec 28          	sub    $0x28,%rsp
  801476:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80147a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80147e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801482:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801486:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80148a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80148e:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801492:	eb 36                	jmp    8014ca <memcmp+0x5c>
  801494:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801498:	0f b6 10             	movzbl (%rax),%edx
  80149b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80149f:	0f b6 00             	movzbl (%rax),%eax
  8014a2:	38 c2                	cmp    %al,%dl
  8014a4:	74 1a                	je     8014c0 <memcmp+0x52>
  8014a6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014aa:	0f b6 00             	movzbl (%rax),%eax
  8014ad:	0f b6 d0             	movzbl %al,%edx
  8014b0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014b4:	0f b6 00             	movzbl (%rax),%eax
  8014b7:	0f b6 c0             	movzbl %al,%eax
  8014ba:	29 c2                	sub    %eax,%edx
  8014bc:	89 d0                	mov    %edx,%eax
  8014be:	eb 20                	jmp    8014e0 <memcmp+0x72>
  8014c0:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8014c5:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8014ca:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014ce:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8014d2:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8014d6:	48 85 c0             	test   %rax,%rax
  8014d9:	75 b9                	jne    801494 <memcmp+0x26>
  8014db:	b8 00 00 00 00       	mov    $0x0,%eax
  8014e0:	c9                   	leaveq 
  8014e1:	c3                   	retq   

00000000008014e2 <memfind>:
  8014e2:	55                   	push   %rbp
  8014e3:	48 89 e5             	mov    %rsp,%rbp
  8014e6:	48 83 ec 28          	sub    $0x28,%rsp
  8014ea:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8014ee:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8014f1:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8014f5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014f9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8014fd:	48 01 d0             	add    %rdx,%rax
  801500:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801504:	eb 15                	jmp    80151b <memfind+0x39>
  801506:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80150a:	0f b6 10             	movzbl (%rax),%edx
  80150d:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801510:	38 c2                	cmp    %al,%dl
  801512:	75 02                	jne    801516 <memfind+0x34>
  801514:	eb 0f                	jmp    801525 <memfind+0x43>
  801516:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80151b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80151f:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  801523:	72 e1                	jb     801506 <memfind+0x24>
  801525:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801529:	c9                   	leaveq 
  80152a:	c3                   	retq   

000000000080152b <strtol>:
  80152b:	55                   	push   %rbp
  80152c:	48 89 e5             	mov    %rsp,%rbp
  80152f:	48 83 ec 34          	sub    $0x34,%rsp
  801533:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801537:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80153b:	89 55 cc             	mov    %edx,-0x34(%rbp)
  80153e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801545:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  80154c:	00 
  80154d:	eb 05                	jmp    801554 <strtol+0x29>
  80154f:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801554:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801558:	0f b6 00             	movzbl (%rax),%eax
  80155b:	3c 20                	cmp    $0x20,%al
  80155d:	74 f0                	je     80154f <strtol+0x24>
  80155f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801563:	0f b6 00             	movzbl (%rax),%eax
  801566:	3c 09                	cmp    $0x9,%al
  801568:	74 e5                	je     80154f <strtol+0x24>
  80156a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80156e:	0f b6 00             	movzbl (%rax),%eax
  801571:	3c 2b                	cmp    $0x2b,%al
  801573:	75 07                	jne    80157c <strtol+0x51>
  801575:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80157a:	eb 17                	jmp    801593 <strtol+0x68>
  80157c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801580:	0f b6 00             	movzbl (%rax),%eax
  801583:	3c 2d                	cmp    $0x2d,%al
  801585:	75 0c                	jne    801593 <strtol+0x68>
  801587:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80158c:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  801593:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801597:	74 06                	je     80159f <strtol+0x74>
  801599:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  80159d:	75 28                	jne    8015c7 <strtol+0x9c>
  80159f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015a3:	0f b6 00             	movzbl (%rax),%eax
  8015a6:	3c 30                	cmp    $0x30,%al
  8015a8:	75 1d                	jne    8015c7 <strtol+0x9c>
  8015aa:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015ae:	48 83 c0 01          	add    $0x1,%rax
  8015b2:	0f b6 00             	movzbl (%rax),%eax
  8015b5:	3c 78                	cmp    $0x78,%al
  8015b7:	75 0e                	jne    8015c7 <strtol+0x9c>
  8015b9:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  8015be:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  8015c5:	eb 2c                	jmp    8015f3 <strtol+0xc8>
  8015c7:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8015cb:	75 19                	jne    8015e6 <strtol+0xbb>
  8015cd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015d1:	0f b6 00             	movzbl (%rax),%eax
  8015d4:	3c 30                	cmp    $0x30,%al
  8015d6:	75 0e                	jne    8015e6 <strtol+0xbb>
  8015d8:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8015dd:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  8015e4:	eb 0d                	jmp    8015f3 <strtol+0xc8>
  8015e6:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8015ea:	75 07                	jne    8015f3 <strtol+0xc8>
  8015ec:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  8015f3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015f7:	0f b6 00             	movzbl (%rax),%eax
  8015fa:	3c 2f                	cmp    $0x2f,%al
  8015fc:	7e 1d                	jle    80161b <strtol+0xf0>
  8015fe:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801602:	0f b6 00             	movzbl (%rax),%eax
  801605:	3c 39                	cmp    $0x39,%al
  801607:	7f 12                	jg     80161b <strtol+0xf0>
  801609:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80160d:	0f b6 00             	movzbl (%rax),%eax
  801610:	0f be c0             	movsbl %al,%eax
  801613:	83 e8 30             	sub    $0x30,%eax
  801616:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801619:	eb 4e                	jmp    801669 <strtol+0x13e>
  80161b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80161f:	0f b6 00             	movzbl (%rax),%eax
  801622:	3c 60                	cmp    $0x60,%al
  801624:	7e 1d                	jle    801643 <strtol+0x118>
  801626:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80162a:	0f b6 00             	movzbl (%rax),%eax
  80162d:	3c 7a                	cmp    $0x7a,%al
  80162f:	7f 12                	jg     801643 <strtol+0x118>
  801631:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801635:	0f b6 00             	movzbl (%rax),%eax
  801638:	0f be c0             	movsbl %al,%eax
  80163b:	83 e8 57             	sub    $0x57,%eax
  80163e:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801641:	eb 26                	jmp    801669 <strtol+0x13e>
  801643:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801647:	0f b6 00             	movzbl (%rax),%eax
  80164a:	3c 40                	cmp    $0x40,%al
  80164c:	7e 48                	jle    801696 <strtol+0x16b>
  80164e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801652:	0f b6 00             	movzbl (%rax),%eax
  801655:	3c 5a                	cmp    $0x5a,%al
  801657:	7f 3d                	jg     801696 <strtol+0x16b>
  801659:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80165d:	0f b6 00             	movzbl (%rax),%eax
  801660:	0f be c0             	movsbl %al,%eax
  801663:	83 e8 37             	sub    $0x37,%eax
  801666:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801669:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80166c:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  80166f:	7c 02                	jl     801673 <strtol+0x148>
  801671:	eb 23                	jmp    801696 <strtol+0x16b>
  801673:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801678:	8b 45 cc             	mov    -0x34(%rbp),%eax
  80167b:	48 98                	cltq   
  80167d:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  801682:	48 89 c2             	mov    %rax,%rdx
  801685:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801688:	48 98                	cltq   
  80168a:	48 01 d0             	add    %rdx,%rax
  80168d:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801691:	e9 5d ff ff ff       	jmpq   8015f3 <strtol+0xc8>
  801696:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  80169b:	74 0b                	je     8016a8 <strtol+0x17d>
  80169d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8016a1:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8016a5:	48 89 10             	mov    %rdx,(%rax)
  8016a8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8016ac:	74 09                	je     8016b7 <strtol+0x18c>
  8016ae:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8016b2:	48 f7 d8             	neg    %rax
  8016b5:	eb 04                	jmp    8016bb <strtol+0x190>
  8016b7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8016bb:	c9                   	leaveq 
  8016bc:	c3                   	retq   

00000000008016bd <strstr>:
  8016bd:	55                   	push   %rbp
  8016be:	48 89 e5             	mov    %rsp,%rbp
  8016c1:	48 83 ec 30          	sub    $0x30,%rsp
  8016c5:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8016c9:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8016cd:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8016d1:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8016d5:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  8016d9:	0f b6 00             	movzbl (%rax),%eax
  8016dc:	88 45 ff             	mov    %al,-0x1(%rbp)
  8016df:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  8016e3:	75 06                	jne    8016eb <strstr+0x2e>
  8016e5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016e9:	eb 6b                	jmp    801756 <strstr+0x99>
  8016eb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8016ef:	48 89 c7             	mov    %rax,%rdi
  8016f2:	48 b8 93 0f 80 00 00 	movabs $0x800f93,%rax
  8016f9:	00 00 00 
  8016fc:	ff d0                	callq  *%rax
  8016fe:	48 98                	cltq   
  801700:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801704:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801708:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80170c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801710:	0f b6 00             	movzbl (%rax),%eax
  801713:	88 45 ef             	mov    %al,-0x11(%rbp)
  801716:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  80171a:	75 07                	jne    801723 <strstr+0x66>
  80171c:	b8 00 00 00 00       	mov    $0x0,%eax
  801721:	eb 33                	jmp    801756 <strstr+0x99>
  801723:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  801727:	3a 45 ff             	cmp    -0x1(%rbp),%al
  80172a:	75 d8                	jne    801704 <strstr+0x47>
  80172c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801730:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  801734:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801738:	48 89 ce             	mov    %rcx,%rsi
  80173b:	48 89 c7             	mov    %rax,%rdi
  80173e:	48 b8 b4 11 80 00 00 	movabs $0x8011b4,%rax
  801745:	00 00 00 
  801748:	ff d0                	callq  *%rax
  80174a:	85 c0                	test   %eax,%eax
  80174c:	75 b6                	jne    801704 <strstr+0x47>
  80174e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801752:	48 83 e8 01          	sub    $0x1,%rax
  801756:	c9                   	leaveq 
  801757:	c3                   	retq   

0000000000801758 <syscall>:
  801758:	55                   	push   %rbp
  801759:	48 89 e5             	mov    %rsp,%rbp
  80175c:	53                   	push   %rbx
  80175d:	48 83 ec 48          	sub    $0x48,%rsp
  801761:	89 7d dc             	mov    %edi,-0x24(%rbp)
  801764:	89 75 d8             	mov    %esi,-0x28(%rbp)
  801767:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  80176b:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  80176f:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  801773:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  801777:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80177a:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  80177e:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  801782:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  801786:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  80178a:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  80178e:	4c 89 c3             	mov    %r8,%rbx
  801791:	cd 30                	int    $0x30
  801793:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801797:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  80179b:	74 3e                	je     8017db <syscall+0x83>
  80179d:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8017a2:	7e 37                	jle    8017db <syscall+0x83>
  8017a4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8017a8:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8017ab:	49 89 d0             	mov    %rdx,%r8
  8017ae:	89 c1                	mov    %eax,%ecx
  8017b0:	48 ba 9b 4a 80 00 00 	movabs $0x804a9b,%rdx
  8017b7:	00 00 00 
  8017ba:	be 24 00 00 00       	mov    $0x24,%esi
  8017bf:	48 bf b8 4a 80 00 00 	movabs $0x804ab8,%rdi
  8017c6:	00 00 00 
  8017c9:	b8 00 00 00 00       	mov    $0x0,%eax
  8017ce:	49 b9 c3 41 80 00 00 	movabs $0x8041c3,%r9
  8017d5:	00 00 00 
  8017d8:	41 ff d1             	callq  *%r9
  8017db:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8017df:	48 83 c4 48          	add    $0x48,%rsp
  8017e3:	5b                   	pop    %rbx
  8017e4:	5d                   	pop    %rbp
  8017e5:	c3                   	retq   

00000000008017e6 <sys_cputs>:
  8017e6:	55                   	push   %rbp
  8017e7:	48 89 e5             	mov    %rsp,%rbp
  8017ea:	48 83 ec 20          	sub    $0x20,%rsp
  8017ee:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8017f2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8017f6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8017fa:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8017fe:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801805:	00 
  801806:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80180c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801812:	48 89 d1             	mov    %rdx,%rcx
  801815:	48 89 c2             	mov    %rax,%rdx
  801818:	be 00 00 00 00       	mov    $0x0,%esi
  80181d:	bf 00 00 00 00       	mov    $0x0,%edi
  801822:	48 b8 58 17 80 00 00 	movabs $0x801758,%rax
  801829:	00 00 00 
  80182c:	ff d0                	callq  *%rax
  80182e:	c9                   	leaveq 
  80182f:	c3                   	retq   

0000000000801830 <sys_cgetc>:
  801830:	55                   	push   %rbp
  801831:	48 89 e5             	mov    %rsp,%rbp
  801834:	48 83 ec 10          	sub    $0x10,%rsp
  801838:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80183f:	00 
  801840:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801846:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80184c:	b9 00 00 00 00       	mov    $0x0,%ecx
  801851:	ba 00 00 00 00       	mov    $0x0,%edx
  801856:	be 00 00 00 00       	mov    $0x0,%esi
  80185b:	bf 01 00 00 00       	mov    $0x1,%edi
  801860:	48 b8 58 17 80 00 00 	movabs $0x801758,%rax
  801867:	00 00 00 
  80186a:	ff d0                	callq  *%rax
  80186c:	c9                   	leaveq 
  80186d:	c3                   	retq   

000000000080186e <sys_env_destroy>:
  80186e:	55                   	push   %rbp
  80186f:	48 89 e5             	mov    %rsp,%rbp
  801872:	48 83 ec 10          	sub    $0x10,%rsp
  801876:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801879:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80187c:	48 98                	cltq   
  80187e:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801885:	00 
  801886:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80188c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801892:	b9 00 00 00 00       	mov    $0x0,%ecx
  801897:	48 89 c2             	mov    %rax,%rdx
  80189a:	be 01 00 00 00       	mov    $0x1,%esi
  80189f:	bf 03 00 00 00       	mov    $0x3,%edi
  8018a4:	48 b8 58 17 80 00 00 	movabs $0x801758,%rax
  8018ab:	00 00 00 
  8018ae:	ff d0                	callq  *%rax
  8018b0:	c9                   	leaveq 
  8018b1:	c3                   	retq   

00000000008018b2 <sys_getenvid>:
  8018b2:	55                   	push   %rbp
  8018b3:	48 89 e5             	mov    %rsp,%rbp
  8018b6:	48 83 ec 10          	sub    $0x10,%rsp
  8018ba:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8018c1:	00 
  8018c2:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8018c8:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8018ce:	b9 00 00 00 00       	mov    $0x0,%ecx
  8018d3:	ba 00 00 00 00       	mov    $0x0,%edx
  8018d8:	be 00 00 00 00       	mov    $0x0,%esi
  8018dd:	bf 02 00 00 00       	mov    $0x2,%edi
  8018e2:	48 b8 58 17 80 00 00 	movabs $0x801758,%rax
  8018e9:	00 00 00 
  8018ec:	ff d0                	callq  *%rax
  8018ee:	c9                   	leaveq 
  8018ef:	c3                   	retq   

00000000008018f0 <sys_yield>:
  8018f0:	55                   	push   %rbp
  8018f1:	48 89 e5             	mov    %rsp,%rbp
  8018f4:	48 83 ec 10          	sub    $0x10,%rsp
  8018f8:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8018ff:	00 
  801900:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801906:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80190c:	b9 00 00 00 00       	mov    $0x0,%ecx
  801911:	ba 00 00 00 00       	mov    $0x0,%edx
  801916:	be 00 00 00 00       	mov    $0x0,%esi
  80191b:	bf 0b 00 00 00       	mov    $0xb,%edi
  801920:	48 b8 58 17 80 00 00 	movabs $0x801758,%rax
  801927:	00 00 00 
  80192a:	ff d0                	callq  *%rax
  80192c:	c9                   	leaveq 
  80192d:	c3                   	retq   

000000000080192e <sys_page_alloc>:
  80192e:	55                   	push   %rbp
  80192f:	48 89 e5             	mov    %rsp,%rbp
  801932:	48 83 ec 20          	sub    $0x20,%rsp
  801936:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801939:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80193d:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801940:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801943:	48 63 c8             	movslq %eax,%rcx
  801946:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80194a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80194d:	48 98                	cltq   
  80194f:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801956:	00 
  801957:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80195d:	49 89 c8             	mov    %rcx,%r8
  801960:	48 89 d1             	mov    %rdx,%rcx
  801963:	48 89 c2             	mov    %rax,%rdx
  801966:	be 01 00 00 00       	mov    $0x1,%esi
  80196b:	bf 04 00 00 00       	mov    $0x4,%edi
  801970:	48 b8 58 17 80 00 00 	movabs $0x801758,%rax
  801977:	00 00 00 
  80197a:	ff d0                	callq  *%rax
  80197c:	c9                   	leaveq 
  80197d:	c3                   	retq   

000000000080197e <sys_page_map>:
  80197e:	55                   	push   %rbp
  80197f:	48 89 e5             	mov    %rsp,%rbp
  801982:	48 83 ec 30          	sub    $0x30,%rsp
  801986:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801989:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80198d:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801990:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801994:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801998:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80199b:	48 63 c8             	movslq %eax,%rcx
  80199e:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  8019a2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8019a5:	48 63 f0             	movslq %eax,%rsi
  8019a8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8019ac:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8019af:	48 98                	cltq   
  8019b1:	48 89 0c 24          	mov    %rcx,(%rsp)
  8019b5:	49 89 f9             	mov    %rdi,%r9
  8019b8:	49 89 f0             	mov    %rsi,%r8
  8019bb:	48 89 d1             	mov    %rdx,%rcx
  8019be:	48 89 c2             	mov    %rax,%rdx
  8019c1:	be 01 00 00 00       	mov    $0x1,%esi
  8019c6:	bf 05 00 00 00       	mov    $0x5,%edi
  8019cb:	48 b8 58 17 80 00 00 	movabs $0x801758,%rax
  8019d2:	00 00 00 
  8019d5:	ff d0                	callq  *%rax
  8019d7:	c9                   	leaveq 
  8019d8:	c3                   	retq   

00000000008019d9 <sys_page_unmap>:
  8019d9:	55                   	push   %rbp
  8019da:	48 89 e5             	mov    %rsp,%rbp
  8019dd:	48 83 ec 20          	sub    $0x20,%rsp
  8019e1:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8019e4:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8019e8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8019ec:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8019ef:	48 98                	cltq   
  8019f1:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8019f8:	00 
  8019f9:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8019ff:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a05:	48 89 d1             	mov    %rdx,%rcx
  801a08:	48 89 c2             	mov    %rax,%rdx
  801a0b:	be 01 00 00 00       	mov    $0x1,%esi
  801a10:	bf 06 00 00 00       	mov    $0x6,%edi
  801a15:	48 b8 58 17 80 00 00 	movabs $0x801758,%rax
  801a1c:	00 00 00 
  801a1f:	ff d0                	callq  *%rax
  801a21:	c9                   	leaveq 
  801a22:	c3                   	retq   

0000000000801a23 <sys_env_set_status>:
  801a23:	55                   	push   %rbp
  801a24:	48 89 e5             	mov    %rsp,%rbp
  801a27:	48 83 ec 10          	sub    $0x10,%rsp
  801a2b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a2e:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801a31:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801a34:	48 63 d0             	movslq %eax,%rdx
  801a37:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a3a:	48 98                	cltq   
  801a3c:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801a43:	00 
  801a44:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a4a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a50:	48 89 d1             	mov    %rdx,%rcx
  801a53:	48 89 c2             	mov    %rax,%rdx
  801a56:	be 01 00 00 00       	mov    $0x1,%esi
  801a5b:	bf 08 00 00 00       	mov    $0x8,%edi
  801a60:	48 b8 58 17 80 00 00 	movabs $0x801758,%rax
  801a67:	00 00 00 
  801a6a:	ff d0                	callq  *%rax
  801a6c:	c9                   	leaveq 
  801a6d:	c3                   	retq   

0000000000801a6e <sys_env_set_trapframe>:
  801a6e:	55                   	push   %rbp
  801a6f:	48 89 e5             	mov    %rsp,%rbp
  801a72:	48 83 ec 20          	sub    $0x20,%rsp
  801a76:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a79:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a7d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801a81:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a84:	48 98                	cltq   
  801a86:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801a8d:	00 
  801a8e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a94:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a9a:	48 89 d1             	mov    %rdx,%rcx
  801a9d:	48 89 c2             	mov    %rax,%rdx
  801aa0:	be 01 00 00 00       	mov    $0x1,%esi
  801aa5:	bf 09 00 00 00       	mov    $0x9,%edi
  801aaa:	48 b8 58 17 80 00 00 	movabs $0x801758,%rax
  801ab1:	00 00 00 
  801ab4:	ff d0                	callq  *%rax
  801ab6:	c9                   	leaveq 
  801ab7:	c3                   	retq   

0000000000801ab8 <sys_env_set_pgfault_upcall>:
  801ab8:	55                   	push   %rbp
  801ab9:	48 89 e5             	mov    %rsp,%rbp
  801abc:	48 83 ec 20          	sub    $0x20,%rsp
  801ac0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801ac3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801ac7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801acb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ace:	48 98                	cltq   
  801ad0:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801ad7:	00 
  801ad8:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ade:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ae4:	48 89 d1             	mov    %rdx,%rcx
  801ae7:	48 89 c2             	mov    %rax,%rdx
  801aea:	be 01 00 00 00       	mov    $0x1,%esi
  801aef:	bf 0a 00 00 00       	mov    $0xa,%edi
  801af4:	48 b8 58 17 80 00 00 	movabs $0x801758,%rax
  801afb:	00 00 00 
  801afe:	ff d0                	callq  *%rax
  801b00:	c9                   	leaveq 
  801b01:	c3                   	retq   

0000000000801b02 <sys_ipc_try_send>:
  801b02:	55                   	push   %rbp
  801b03:	48 89 e5             	mov    %rsp,%rbp
  801b06:	48 83 ec 20          	sub    $0x20,%rsp
  801b0a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b0d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b11:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801b15:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801b18:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801b1b:	48 63 f0             	movslq %eax,%rsi
  801b1e:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801b22:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b25:	48 98                	cltq   
  801b27:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b2b:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801b32:	00 
  801b33:	49 89 f1             	mov    %rsi,%r9
  801b36:	49 89 c8             	mov    %rcx,%r8
  801b39:	48 89 d1             	mov    %rdx,%rcx
  801b3c:	48 89 c2             	mov    %rax,%rdx
  801b3f:	be 00 00 00 00       	mov    $0x0,%esi
  801b44:	bf 0c 00 00 00       	mov    $0xc,%edi
  801b49:	48 b8 58 17 80 00 00 	movabs $0x801758,%rax
  801b50:	00 00 00 
  801b53:	ff d0                	callq  *%rax
  801b55:	c9                   	leaveq 
  801b56:	c3                   	retq   

0000000000801b57 <sys_ipc_recv>:
  801b57:	55                   	push   %rbp
  801b58:	48 89 e5             	mov    %rsp,%rbp
  801b5b:	48 83 ec 10          	sub    $0x10,%rsp
  801b5f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801b63:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b67:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801b6e:	00 
  801b6f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b75:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b7b:	b9 00 00 00 00       	mov    $0x0,%ecx
  801b80:	48 89 c2             	mov    %rax,%rdx
  801b83:	be 01 00 00 00       	mov    $0x1,%esi
  801b88:	bf 0d 00 00 00       	mov    $0xd,%edi
  801b8d:	48 b8 58 17 80 00 00 	movabs $0x801758,%rax
  801b94:	00 00 00 
  801b97:	ff d0                	callq  *%rax
  801b99:	c9                   	leaveq 
  801b9a:	c3                   	retq   

0000000000801b9b <sys_time_msec>:
  801b9b:	55                   	push   %rbp
  801b9c:	48 89 e5             	mov    %rsp,%rbp
  801b9f:	48 83 ec 10          	sub    $0x10,%rsp
  801ba3:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801baa:	00 
  801bab:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801bb1:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801bb7:	b9 00 00 00 00       	mov    $0x0,%ecx
  801bbc:	ba 00 00 00 00       	mov    $0x0,%edx
  801bc1:	be 00 00 00 00       	mov    $0x0,%esi
  801bc6:	bf 0e 00 00 00       	mov    $0xe,%edi
  801bcb:	48 b8 58 17 80 00 00 	movabs $0x801758,%rax
  801bd2:	00 00 00 
  801bd5:	ff d0                	callq  *%rax
  801bd7:	c9                   	leaveq 
  801bd8:	c3                   	retq   

0000000000801bd9 <sys_net_transmit>:
  801bd9:	55                   	push   %rbp
  801bda:	48 89 e5             	mov    %rsp,%rbp
  801bdd:	48 83 ec 20          	sub    $0x20,%rsp
  801be1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801be5:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801be8:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801beb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801bef:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801bf6:	00 
  801bf7:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801bfd:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c03:	48 89 d1             	mov    %rdx,%rcx
  801c06:	48 89 c2             	mov    %rax,%rdx
  801c09:	be 00 00 00 00       	mov    $0x0,%esi
  801c0e:	bf 0f 00 00 00       	mov    $0xf,%edi
  801c13:	48 b8 58 17 80 00 00 	movabs $0x801758,%rax
  801c1a:	00 00 00 
  801c1d:	ff d0                	callq  *%rax
  801c1f:	c9                   	leaveq 
  801c20:	c3                   	retq   

0000000000801c21 <sys_net_receive>:
  801c21:	55                   	push   %rbp
  801c22:	48 89 e5             	mov    %rsp,%rbp
  801c25:	48 83 ec 20          	sub    $0x20,%rsp
  801c29:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c2d:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801c30:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801c33:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c37:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c3e:	00 
  801c3f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c45:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c4b:	48 89 d1             	mov    %rdx,%rcx
  801c4e:	48 89 c2             	mov    %rax,%rdx
  801c51:	be 00 00 00 00       	mov    $0x0,%esi
  801c56:	bf 10 00 00 00       	mov    $0x10,%edi
  801c5b:	48 b8 58 17 80 00 00 	movabs $0x801758,%rax
  801c62:	00 00 00 
  801c65:	ff d0                	callq  *%rax
  801c67:	c9                   	leaveq 
  801c68:	c3                   	retq   

0000000000801c69 <sys_ept_map>:
  801c69:	55                   	push   %rbp
  801c6a:	48 89 e5             	mov    %rsp,%rbp
  801c6d:	48 83 ec 30          	sub    $0x30,%rsp
  801c71:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801c74:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c78:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801c7b:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801c7f:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801c83:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801c86:	48 63 c8             	movslq %eax,%rcx
  801c89:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801c8d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801c90:	48 63 f0             	movslq %eax,%rsi
  801c93:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c97:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c9a:	48 98                	cltq   
  801c9c:	48 89 0c 24          	mov    %rcx,(%rsp)
  801ca0:	49 89 f9             	mov    %rdi,%r9
  801ca3:	49 89 f0             	mov    %rsi,%r8
  801ca6:	48 89 d1             	mov    %rdx,%rcx
  801ca9:	48 89 c2             	mov    %rax,%rdx
  801cac:	be 00 00 00 00       	mov    $0x0,%esi
  801cb1:	bf 11 00 00 00       	mov    $0x11,%edi
  801cb6:	48 b8 58 17 80 00 00 	movabs $0x801758,%rax
  801cbd:	00 00 00 
  801cc0:	ff d0                	callq  *%rax
  801cc2:	c9                   	leaveq 
  801cc3:	c3                   	retq   

0000000000801cc4 <sys_env_mkguest>:
  801cc4:	55                   	push   %rbp
  801cc5:	48 89 e5             	mov    %rsp,%rbp
  801cc8:	48 83 ec 20          	sub    $0x20,%rsp
  801ccc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801cd0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801cd4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801cd8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801cdc:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801ce3:	00 
  801ce4:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801cea:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801cf0:	48 89 d1             	mov    %rdx,%rcx
  801cf3:	48 89 c2             	mov    %rax,%rdx
  801cf6:	be 00 00 00 00       	mov    $0x0,%esi
  801cfb:	bf 12 00 00 00       	mov    $0x12,%edi
  801d00:	48 b8 58 17 80 00 00 	movabs $0x801758,%rax
  801d07:	00 00 00 
  801d0a:	ff d0                	callq  *%rax
  801d0c:	c9                   	leaveq 
  801d0d:	c3                   	retq   

0000000000801d0e <sys_vmx_list_vms>:
  801d0e:	55                   	push   %rbp
  801d0f:	48 89 e5             	mov    %rsp,%rbp
  801d12:	48 83 ec 10          	sub    $0x10,%rsp
  801d16:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801d1d:	00 
  801d1e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d24:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d2a:	b9 00 00 00 00       	mov    $0x0,%ecx
  801d2f:	ba 00 00 00 00       	mov    $0x0,%edx
  801d34:	be 00 00 00 00       	mov    $0x0,%esi
  801d39:	bf 13 00 00 00       	mov    $0x13,%edi
  801d3e:	48 b8 58 17 80 00 00 	movabs $0x801758,%rax
  801d45:	00 00 00 
  801d48:	ff d0                	callq  *%rax
  801d4a:	c9                   	leaveq 
  801d4b:	c3                   	retq   

0000000000801d4c <sys_vmx_sel_resume>:
  801d4c:	55                   	push   %rbp
  801d4d:	48 89 e5             	mov    %rsp,%rbp
  801d50:	48 83 ec 10          	sub    $0x10,%rsp
  801d54:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801d57:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801d5a:	48 98                	cltq   
  801d5c:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801d63:	00 
  801d64:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d6a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d70:	b9 00 00 00 00       	mov    $0x0,%ecx
  801d75:	48 89 c2             	mov    %rax,%rdx
  801d78:	be 00 00 00 00       	mov    $0x0,%esi
  801d7d:	bf 14 00 00 00       	mov    $0x14,%edi
  801d82:	48 b8 58 17 80 00 00 	movabs $0x801758,%rax
  801d89:	00 00 00 
  801d8c:	ff d0                	callq  *%rax
  801d8e:	c9                   	leaveq 
  801d8f:	c3                   	retq   

0000000000801d90 <sys_vmx_get_vmdisk_number>:
  801d90:	55                   	push   %rbp
  801d91:	48 89 e5             	mov    %rsp,%rbp
  801d94:	48 83 ec 10          	sub    $0x10,%rsp
  801d98:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801d9f:	00 
  801da0:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801da6:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801dac:	b9 00 00 00 00       	mov    $0x0,%ecx
  801db1:	ba 00 00 00 00       	mov    $0x0,%edx
  801db6:	be 00 00 00 00       	mov    $0x0,%esi
  801dbb:	bf 15 00 00 00       	mov    $0x15,%edi
  801dc0:	48 b8 58 17 80 00 00 	movabs $0x801758,%rax
  801dc7:	00 00 00 
  801dca:	ff d0                	callq  *%rax
  801dcc:	c9                   	leaveq 
  801dcd:	c3                   	retq   

0000000000801dce <sys_vmx_incr_vmdisk_number>:
  801dce:	55                   	push   %rbp
  801dcf:	48 89 e5             	mov    %rsp,%rbp
  801dd2:	48 83 ec 10          	sub    $0x10,%rsp
  801dd6:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801ddd:	00 
  801dde:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801de4:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801dea:	b9 00 00 00 00       	mov    $0x0,%ecx
  801def:	ba 00 00 00 00       	mov    $0x0,%edx
  801df4:	be 00 00 00 00       	mov    $0x0,%esi
  801df9:	bf 16 00 00 00       	mov    $0x16,%edi
  801dfe:	48 b8 58 17 80 00 00 	movabs $0x801758,%rax
  801e05:	00 00 00 
  801e08:	ff d0                	callq  *%rax
  801e0a:	c9                   	leaveq 
  801e0b:	c3                   	retq   

0000000000801e0c <fd2num>:
  801e0c:	55                   	push   %rbp
  801e0d:	48 89 e5             	mov    %rsp,%rbp
  801e10:	48 83 ec 08          	sub    $0x8,%rsp
  801e14:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801e18:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801e1c:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  801e23:	ff ff ff 
  801e26:	48 01 d0             	add    %rdx,%rax
  801e29:	48 c1 e8 0c          	shr    $0xc,%rax
  801e2d:	c9                   	leaveq 
  801e2e:	c3                   	retq   

0000000000801e2f <fd2data>:
  801e2f:	55                   	push   %rbp
  801e30:	48 89 e5             	mov    %rsp,%rbp
  801e33:	48 83 ec 08          	sub    $0x8,%rsp
  801e37:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801e3b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e3f:	48 89 c7             	mov    %rax,%rdi
  801e42:	48 b8 0c 1e 80 00 00 	movabs $0x801e0c,%rax
  801e49:	00 00 00 
  801e4c:	ff d0                	callq  *%rax
  801e4e:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  801e54:	48 c1 e0 0c          	shl    $0xc,%rax
  801e58:	c9                   	leaveq 
  801e59:	c3                   	retq   

0000000000801e5a <fd_alloc>:
  801e5a:	55                   	push   %rbp
  801e5b:	48 89 e5             	mov    %rsp,%rbp
  801e5e:	48 83 ec 18          	sub    $0x18,%rsp
  801e62:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801e66:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801e6d:	eb 6b                	jmp    801eda <fd_alloc+0x80>
  801e6f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e72:	48 98                	cltq   
  801e74:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801e7a:	48 c1 e0 0c          	shl    $0xc,%rax
  801e7e:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801e82:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801e86:	48 c1 e8 15          	shr    $0x15,%rax
  801e8a:	48 89 c2             	mov    %rax,%rdx
  801e8d:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  801e94:	01 00 00 
  801e97:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801e9b:	83 e0 01             	and    $0x1,%eax
  801e9e:	48 85 c0             	test   %rax,%rax
  801ea1:	74 21                	je     801ec4 <fd_alloc+0x6a>
  801ea3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801ea7:	48 c1 e8 0c          	shr    $0xc,%rax
  801eab:	48 89 c2             	mov    %rax,%rdx
  801eae:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801eb5:	01 00 00 
  801eb8:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801ebc:	83 e0 01             	and    $0x1,%eax
  801ebf:	48 85 c0             	test   %rax,%rax
  801ec2:	75 12                	jne    801ed6 <fd_alloc+0x7c>
  801ec4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801ec8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801ecc:	48 89 10             	mov    %rdx,(%rax)
  801ecf:	b8 00 00 00 00       	mov    $0x0,%eax
  801ed4:	eb 1a                	jmp    801ef0 <fd_alloc+0x96>
  801ed6:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801eda:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  801ede:	7e 8f                	jle    801e6f <fd_alloc+0x15>
  801ee0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801ee4:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  801eeb:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  801ef0:	c9                   	leaveq 
  801ef1:	c3                   	retq   

0000000000801ef2 <fd_lookup>:
  801ef2:	55                   	push   %rbp
  801ef3:	48 89 e5             	mov    %rsp,%rbp
  801ef6:	48 83 ec 20          	sub    $0x20,%rsp
  801efa:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801efd:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801f01:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  801f05:	78 06                	js     801f0d <fd_lookup+0x1b>
  801f07:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  801f0b:	7e 07                	jle    801f14 <fd_lookup+0x22>
  801f0d:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801f12:	eb 6c                	jmp    801f80 <fd_lookup+0x8e>
  801f14:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801f17:	48 98                	cltq   
  801f19:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801f1f:	48 c1 e0 0c          	shl    $0xc,%rax
  801f23:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801f27:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801f2b:	48 c1 e8 15          	shr    $0x15,%rax
  801f2f:	48 89 c2             	mov    %rax,%rdx
  801f32:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  801f39:	01 00 00 
  801f3c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801f40:	83 e0 01             	and    $0x1,%eax
  801f43:	48 85 c0             	test   %rax,%rax
  801f46:	74 21                	je     801f69 <fd_lookup+0x77>
  801f48:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801f4c:	48 c1 e8 0c          	shr    $0xc,%rax
  801f50:	48 89 c2             	mov    %rax,%rdx
  801f53:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801f5a:	01 00 00 
  801f5d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801f61:	83 e0 01             	and    $0x1,%eax
  801f64:	48 85 c0             	test   %rax,%rax
  801f67:	75 07                	jne    801f70 <fd_lookup+0x7e>
  801f69:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801f6e:	eb 10                	jmp    801f80 <fd_lookup+0x8e>
  801f70:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801f74:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801f78:	48 89 10             	mov    %rdx,(%rax)
  801f7b:	b8 00 00 00 00       	mov    $0x0,%eax
  801f80:	c9                   	leaveq 
  801f81:	c3                   	retq   

0000000000801f82 <fd_close>:
  801f82:	55                   	push   %rbp
  801f83:	48 89 e5             	mov    %rsp,%rbp
  801f86:	48 83 ec 30          	sub    $0x30,%rsp
  801f8a:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801f8e:	89 f0                	mov    %esi,%eax
  801f90:	88 45 d4             	mov    %al,-0x2c(%rbp)
  801f93:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f97:	48 89 c7             	mov    %rax,%rdi
  801f9a:	48 b8 0c 1e 80 00 00 	movabs $0x801e0c,%rax
  801fa1:	00 00 00 
  801fa4:	ff d0                	callq  *%rax
  801fa6:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  801faa:	48 89 d6             	mov    %rdx,%rsi
  801fad:	89 c7                	mov    %eax,%edi
  801faf:	48 b8 f2 1e 80 00 00 	movabs $0x801ef2,%rax
  801fb6:	00 00 00 
  801fb9:	ff d0                	callq  *%rax
  801fbb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801fbe:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801fc2:	78 0a                	js     801fce <fd_close+0x4c>
  801fc4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801fc8:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  801fcc:	74 12                	je     801fe0 <fd_close+0x5e>
  801fce:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  801fd2:	74 05                	je     801fd9 <fd_close+0x57>
  801fd4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801fd7:	eb 05                	jmp    801fde <fd_close+0x5c>
  801fd9:	b8 00 00 00 00       	mov    $0x0,%eax
  801fde:	eb 69                	jmp    802049 <fd_close+0xc7>
  801fe0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801fe4:	8b 00                	mov    (%rax),%eax
  801fe6:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  801fea:	48 89 d6             	mov    %rdx,%rsi
  801fed:	89 c7                	mov    %eax,%edi
  801fef:	48 b8 4b 20 80 00 00 	movabs $0x80204b,%rax
  801ff6:	00 00 00 
  801ff9:	ff d0                	callq  *%rax
  801ffb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801ffe:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802002:	78 2a                	js     80202e <fd_close+0xac>
  802004:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802008:	48 8b 40 20          	mov    0x20(%rax),%rax
  80200c:	48 85 c0             	test   %rax,%rax
  80200f:	74 16                	je     802027 <fd_close+0xa5>
  802011:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802015:	48 8b 40 20          	mov    0x20(%rax),%rax
  802019:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80201d:	48 89 d7             	mov    %rdx,%rdi
  802020:	ff d0                	callq  *%rax
  802022:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802025:	eb 07                	jmp    80202e <fd_close+0xac>
  802027:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80202e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802032:	48 89 c6             	mov    %rax,%rsi
  802035:	bf 00 00 00 00       	mov    $0x0,%edi
  80203a:	48 b8 d9 19 80 00 00 	movabs $0x8019d9,%rax
  802041:	00 00 00 
  802044:	ff d0                	callq  *%rax
  802046:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802049:	c9                   	leaveq 
  80204a:	c3                   	retq   

000000000080204b <dev_lookup>:
  80204b:	55                   	push   %rbp
  80204c:	48 89 e5             	mov    %rsp,%rbp
  80204f:	48 83 ec 20          	sub    $0x20,%rsp
  802053:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802056:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80205a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802061:	eb 41                	jmp    8020a4 <dev_lookup+0x59>
  802063:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  80206a:	00 00 00 
  80206d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802070:	48 63 d2             	movslq %edx,%rdx
  802073:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802077:	8b 00                	mov    (%rax),%eax
  802079:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  80207c:	75 22                	jne    8020a0 <dev_lookup+0x55>
  80207e:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  802085:	00 00 00 
  802088:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80208b:	48 63 d2             	movslq %edx,%rdx
  80208e:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  802092:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802096:	48 89 10             	mov    %rdx,(%rax)
  802099:	b8 00 00 00 00       	mov    $0x0,%eax
  80209e:	eb 60                	jmp    802100 <dev_lookup+0xb5>
  8020a0:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8020a4:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  8020ab:	00 00 00 
  8020ae:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8020b1:	48 63 d2             	movslq %edx,%rdx
  8020b4:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8020b8:	48 85 c0             	test   %rax,%rax
  8020bb:	75 a6                	jne    802063 <dev_lookup+0x18>
  8020bd:	48 b8 08 74 80 00 00 	movabs $0x807408,%rax
  8020c4:	00 00 00 
  8020c7:	48 8b 00             	mov    (%rax),%rax
  8020ca:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8020d0:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8020d3:	89 c6                	mov    %eax,%esi
  8020d5:	48 bf d0 4a 80 00 00 	movabs $0x804ad0,%rdi
  8020dc:	00 00 00 
  8020df:	b8 00 00 00 00       	mov    $0x0,%eax
  8020e4:	48 b9 f0 02 80 00 00 	movabs $0x8002f0,%rcx
  8020eb:	00 00 00 
  8020ee:	ff d1                	callq  *%rcx
  8020f0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8020f4:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  8020fb:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802100:	c9                   	leaveq 
  802101:	c3                   	retq   

0000000000802102 <close>:
  802102:	55                   	push   %rbp
  802103:	48 89 e5             	mov    %rsp,%rbp
  802106:	48 83 ec 20          	sub    $0x20,%rsp
  80210a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80210d:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802111:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802114:	48 89 d6             	mov    %rdx,%rsi
  802117:	89 c7                	mov    %eax,%edi
  802119:	48 b8 f2 1e 80 00 00 	movabs $0x801ef2,%rax
  802120:	00 00 00 
  802123:	ff d0                	callq  *%rax
  802125:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802128:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80212c:	79 05                	jns    802133 <close+0x31>
  80212e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802131:	eb 18                	jmp    80214b <close+0x49>
  802133:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802137:	be 01 00 00 00       	mov    $0x1,%esi
  80213c:	48 89 c7             	mov    %rax,%rdi
  80213f:	48 b8 82 1f 80 00 00 	movabs $0x801f82,%rax
  802146:	00 00 00 
  802149:	ff d0                	callq  *%rax
  80214b:	c9                   	leaveq 
  80214c:	c3                   	retq   

000000000080214d <close_all>:
  80214d:	55                   	push   %rbp
  80214e:	48 89 e5             	mov    %rsp,%rbp
  802151:	48 83 ec 10          	sub    $0x10,%rsp
  802155:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80215c:	eb 15                	jmp    802173 <close_all+0x26>
  80215e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802161:	89 c7                	mov    %eax,%edi
  802163:	48 b8 02 21 80 00 00 	movabs $0x802102,%rax
  80216a:	00 00 00 
  80216d:	ff d0                	callq  *%rax
  80216f:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802173:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802177:	7e e5                	jle    80215e <close_all+0x11>
  802179:	c9                   	leaveq 
  80217a:	c3                   	retq   

000000000080217b <dup>:
  80217b:	55                   	push   %rbp
  80217c:	48 89 e5             	mov    %rsp,%rbp
  80217f:	48 83 ec 40          	sub    $0x40,%rsp
  802183:	89 7d cc             	mov    %edi,-0x34(%rbp)
  802186:	89 75 c8             	mov    %esi,-0x38(%rbp)
  802189:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  80218d:	8b 45 cc             	mov    -0x34(%rbp),%eax
  802190:	48 89 d6             	mov    %rdx,%rsi
  802193:	89 c7                	mov    %eax,%edi
  802195:	48 b8 f2 1e 80 00 00 	movabs $0x801ef2,%rax
  80219c:	00 00 00 
  80219f:	ff d0                	callq  *%rax
  8021a1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8021a4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8021a8:	79 08                	jns    8021b2 <dup+0x37>
  8021aa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8021ad:	e9 70 01 00 00       	jmpq   802322 <dup+0x1a7>
  8021b2:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8021b5:	89 c7                	mov    %eax,%edi
  8021b7:	48 b8 02 21 80 00 00 	movabs $0x802102,%rax
  8021be:	00 00 00 
  8021c1:	ff d0                	callq  *%rax
  8021c3:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8021c6:	48 98                	cltq   
  8021c8:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  8021ce:	48 c1 e0 0c          	shl    $0xc,%rax
  8021d2:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8021d6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8021da:	48 89 c7             	mov    %rax,%rdi
  8021dd:	48 b8 2f 1e 80 00 00 	movabs $0x801e2f,%rax
  8021e4:	00 00 00 
  8021e7:	ff d0                	callq  *%rax
  8021e9:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8021ed:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8021f1:	48 89 c7             	mov    %rax,%rdi
  8021f4:	48 b8 2f 1e 80 00 00 	movabs $0x801e2f,%rax
  8021fb:	00 00 00 
  8021fe:	ff d0                	callq  *%rax
  802200:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802204:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802208:	48 c1 e8 15          	shr    $0x15,%rax
  80220c:	48 89 c2             	mov    %rax,%rdx
  80220f:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802216:	01 00 00 
  802219:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80221d:	83 e0 01             	and    $0x1,%eax
  802220:	48 85 c0             	test   %rax,%rax
  802223:	74 73                	je     802298 <dup+0x11d>
  802225:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802229:	48 c1 e8 0c          	shr    $0xc,%rax
  80222d:	48 89 c2             	mov    %rax,%rdx
  802230:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802237:	01 00 00 
  80223a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80223e:	83 e0 01             	and    $0x1,%eax
  802241:	48 85 c0             	test   %rax,%rax
  802244:	74 52                	je     802298 <dup+0x11d>
  802246:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80224a:	48 c1 e8 0c          	shr    $0xc,%rax
  80224e:	48 89 c2             	mov    %rax,%rdx
  802251:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802258:	01 00 00 
  80225b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80225f:	25 07 0e 00 00       	and    $0xe07,%eax
  802264:	89 c1                	mov    %eax,%ecx
  802266:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80226a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80226e:	41 89 c8             	mov    %ecx,%r8d
  802271:	48 89 d1             	mov    %rdx,%rcx
  802274:	ba 00 00 00 00       	mov    $0x0,%edx
  802279:	48 89 c6             	mov    %rax,%rsi
  80227c:	bf 00 00 00 00       	mov    $0x0,%edi
  802281:	48 b8 7e 19 80 00 00 	movabs $0x80197e,%rax
  802288:	00 00 00 
  80228b:	ff d0                	callq  *%rax
  80228d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802290:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802294:	79 02                	jns    802298 <dup+0x11d>
  802296:	eb 57                	jmp    8022ef <dup+0x174>
  802298:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80229c:	48 c1 e8 0c          	shr    $0xc,%rax
  8022a0:	48 89 c2             	mov    %rax,%rdx
  8022a3:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8022aa:	01 00 00 
  8022ad:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8022b1:	25 07 0e 00 00       	and    $0xe07,%eax
  8022b6:	89 c1                	mov    %eax,%ecx
  8022b8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8022bc:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8022c0:	41 89 c8             	mov    %ecx,%r8d
  8022c3:	48 89 d1             	mov    %rdx,%rcx
  8022c6:	ba 00 00 00 00       	mov    $0x0,%edx
  8022cb:	48 89 c6             	mov    %rax,%rsi
  8022ce:	bf 00 00 00 00       	mov    $0x0,%edi
  8022d3:	48 b8 7e 19 80 00 00 	movabs $0x80197e,%rax
  8022da:	00 00 00 
  8022dd:	ff d0                	callq  *%rax
  8022df:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8022e2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8022e6:	79 02                	jns    8022ea <dup+0x16f>
  8022e8:	eb 05                	jmp    8022ef <dup+0x174>
  8022ea:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8022ed:	eb 33                	jmp    802322 <dup+0x1a7>
  8022ef:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8022f3:	48 89 c6             	mov    %rax,%rsi
  8022f6:	bf 00 00 00 00       	mov    $0x0,%edi
  8022fb:	48 b8 d9 19 80 00 00 	movabs $0x8019d9,%rax
  802302:	00 00 00 
  802305:	ff d0                	callq  *%rax
  802307:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80230b:	48 89 c6             	mov    %rax,%rsi
  80230e:	bf 00 00 00 00       	mov    $0x0,%edi
  802313:	48 b8 d9 19 80 00 00 	movabs $0x8019d9,%rax
  80231a:	00 00 00 
  80231d:	ff d0                	callq  *%rax
  80231f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802322:	c9                   	leaveq 
  802323:	c3                   	retq   

0000000000802324 <read>:
  802324:	55                   	push   %rbp
  802325:	48 89 e5             	mov    %rsp,%rbp
  802328:	48 83 ec 40          	sub    $0x40,%rsp
  80232c:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80232f:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802333:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802337:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80233b:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80233e:	48 89 d6             	mov    %rdx,%rsi
  802341:	89 c7                	mov    %eax,%edi
  802343:	48 b8 f2 1e 80 00 00 	movabs $0x801ef2,%rax
  80234a:	00 00 00 
  80234d:	ff d0                	callq  *%rax
  80234f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802352:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802356:	78 24                	js     80237c <read+0x58>
  802358:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80235c:	8b 00                	mov    (%rax),%eax
  80235e:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802362:	48 89 d6             	mov    %rdx,%rsi
  802365:	89 c7                	mov    %eax,%edi
  802367:	48 b8 4b 20 80 00 00 	movabs $0x80204b,%rax
  80236e:	00 00 00 
  802371:	ff d0                	callq  *%rax
  802373:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802376:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80237a:	79 05                	jns    802381 <read+0x5d>
  80237c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80237f:	eb 76                	jmp    8023f7 <read+0xd3>
  802381:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802385:	8b 40 08             	mov    0x8(%rax),%eax
  802388:	83 e0 03             	and    $0x3,%eax
  80238b:	83 f8 01             	cmp    $0x1,%eax
  80238e:	75 3a                	jne    8023ca <read+0xa6>
  802390:	48 b8 08 74 80 00 00 	movabs $0x807408,%rax
  802397:	00 00 00 
  80239a:	48 8b 00             	mov    (%rax),%rax
  80239d:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8023a3:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8023a6:	89 c6                	mov    %eax,%esi
  8023a8:	48 bf ef 4a 80 00 00 	movabs $0x804aef,%rdi
  8023af:	00 00 00 
  8023b2:	b8 00 00 00 00       	mov    $0x0,%eax
  8023b7:	48 b9 f0 02 80 00 00 	movabs $0x8002f0,%rcx
  8023be:	00 00 00 
  8023c1:	ff d1                	callq  *%rcx
  8023c3:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8023c8:	eb 2d                	jmp    8023f7 <read+0xd3>
  8023ca:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8023ce:	48 8b 40 10          	mov    0x10(%rax),%rax
  8023d2:	48 85 c0             	test   %rax,%rax
  8023d5:	75 07                	jne    8023de <read+0xba>
  8023d7:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8023dc:	eb 19                	jmp    8023f7 <read+0xd3>
  8023de:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8023e2:	48 8b 40 10          	mov    0x10(%rax),%rax
  8023e6:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8023ea:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8023ee:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  8023f2:	48 89 cf             	mov    %rcx,%rdi
  8023f5:	ff d0                	callq  *%rax
  8023f7:	c9                   	leaveq 
  8023f8:	c3                   	retq   

00000000008023f9 <readn>:
  8023f9:	55                   	push   %rbp
  8023fa:	48 89 e5             	mov    %rsp,%rbp
  8023fd:	48 83 ec 30          	sub    $0x30,%rsp
  802401:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802404:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802408:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80240c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802413:	eb 49                	jmp    80245e <readn+0x65>
  802415:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802418:	48 98                	cltq   
  80241a:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80241e:	48 29 c2             	sub    %rax,%rdx
  802421:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802424:	48 63 c8             	movslq %eax,%rcx
  802427:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80242b:	48 01 c1             	add    %rax,%rcx
  80242e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802431:	48 89 ce             	mov    %rcx,%rsi
  802434:	89 c7                	mov    %eax,%edi
  802436:	48 b8 24 23 80 00 00 	movabs $0x802324,%rax
  80243d:	00 00 00 
  802440:	ff d0                	callq  *%rax
  802442:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802445:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802449:	79 05                	jns    802450 <readn+0x57>
  80244b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80244e:	eb 1c                	jmp    80246c <readn+0x73>
  802450:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802454:	75 02                	jne    802458 <readn+0x5f>
  802456:	eb 11                	jmp    802469 <readn+0x70>
  802458:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80245b:	01 45 fc             	add    %eax,-0x4(%rbp)
  80245e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802461:	48 98                	cltq   
  802463:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802467:	72 ac                	jb     802415 <readn+0x1c>
  802469:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80246c:	c9                   	leaveq 
  80246d:	c3                   	retq   

000000000080246e <write>:
  80246e:	55                   	push   %rbp
  80246f:	48 89 e5             	mov    %rsp,%rbp
  802472:	48 83 ec 40          	sub    $0x40,%rsp
  802476:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802479:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80247d:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802481:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802485:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802488:	48 89 d6             	mov    %rdx,%rsi
  80248b:	89 c7                	mov    %eax,%edi
  80248d:	48 b8 f2 1e 80 00 00 	movabs $0x801ef2,%rax
  802494:	00 00 00 
  802497:	ff d0                	callq  *%rax
  802499:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80249c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8024a0:	78 24                	js     8024c6 <write+0x58>
  8024a2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8024a6:	8b 00                	mov    (%rax),%eax
  8024a8:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8024ac:	48 89 d6             	mov    %rdx,%rsi
  8024af:	89 c7                	mov    %eax,%edi
  8024b1:	48 b8 4b 20 80 00 00 	movabs $0x80204b,%rax
  8024b8:	00 00 00 
  8024bb:	ff d0                	callq  *%rax
  8024bd:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8024c0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8024c4:	79 05                	jns    8024cb <write+0x5d>
  8024c6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024c9:	eb 75                	jmp    802540 <write+0xd2>
  8024cb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8024cf:	8b 40 08             	mov    0x8(%rax),%eax
  8024d2:	83 e0 03             	and    $0x3,%eax
  8024d5:	85 c0                	test   %eax,%eax
  8024d7:	75 3a                	jne    802513 <write+0xa5>
  8024d9:	48 b8 08 74 80 00 00 	movabs $0x807408,%rax
  8024e0:	00 00 00 
  8024e3:	48 8b 00             	mov    (%rax),%rax
  8024e6:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8024ec:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8024ef:	89 c6                	mov    %eax,%esi
  8024f1:	48 bf 0b 4b 80 00 00 	movabs $0x804b0b,%rdi
  8024f8:	00 00 00 
  8024fb:	b8 00 00 00 00       	mov    $0x0,%eax
  802500:	48 b9 f0 02 80 00 00 	movabs $0x8002f0,%rcx
  802507:	00 00 00 
  80250a:	ff d1                	callq  *%rcx
  80250c:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802511:	eb 2d                	jmp    802540 <write+0xd2>
  802513:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802517:	48 8b 40 18          	mov    0x18(%rax),%rax
  80251b:	48 85 c0             	test   %rax,%rax
  80251e:	75 07                	jne    802527 <write+0xb9>
  802520:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802525:	eb 19                	jmp    802540 <write+0xd2>
  802527:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80252b:	48 8b 40 18          	mov    0x18(%rax),%rax
  80252f:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802533:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802537:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  80253b:	48 89 cf             	mov    %rcx,%rdi
  80253e:	ff d0                	callq  *%rax
  802540:	c9                   	leaveq 
  802541:	c3                   	retq   

0000000000802542 <seek>:
  802542:	55                   	push   %rbp
  802543:	48 89 e5             	mov    %rsp,%rbp
  802546:	48 83 ec 18          	sub    $0x18,%rsp
  80254a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80254d:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802550:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802554:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802557:	48 89 d6             	mov    %rdx,%rsi
  80255a:	89 c7                	mov    %eax,%edi
  80255c:	48 b8 f2 1e 80 00 00 	movabs $0x801ef2,%rax
  802563:	00 00 00 
  802566:	ff d0                	callq  *%rax
  802568:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80256b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80256f:	79 05                	jns    802576 <seek+0x34>
  802571:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802574:	eb 0f                	jmp    802585 <seek+0x43>
  802576:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80257a:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80257d:	89 50 04             	mov    %edx,0x4(%rax)
  802580:	b8 00 00 00 00       	mov    $0x0,%eax
  802585:	c9                   	leaveq 
  802586:	c3                   	retq   

0000000000802587 <ftruncate>:
  802587:	55                   	push   %rbp
  802588:	48 89 e5             	mov    %rsp,%rbp
  80258b:	48 83 ec 30          	sub    $0x30,%rsp
  80258f:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802592:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802595:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802599:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80259c:	48 89 d6             	mov    %rdx,%rsi
  80259f:	89 c7                	mov    %eax,%edi
  8025a1:	48 b8 f2 1e 80 00 00 	movabs $0x801ef2,%rax
  8025a8:	00 00 00 
  8025ab:	ff d0                	callq  *%rax
  8025ad:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8025b0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8025b4:	78 24                	js     8025da <ftruncate+0x53>
  8025b6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8025ba:	8b 00                	mov    (%rax),%eax
  8025bc:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8025c0:	48 89 d6             	mov    %rdx,%rsi
  8025c3:	89 c7                	mov    %eax,%edi
  8025c5:	48 b8 4b 20 80 00 00 	movabs $0x80204b,%rax
  8025cc:	00 00 00 
  8025cf:	ff d0                	callq  *%rax
  8025d1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8025d4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8025d8:	79 05                	jns    8025df <ftruncate+0x58>
  8025da:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8025dd:	eb 72                	jmp    802651 <ftruncate+0xca>
  8025df:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8025e3:	8b 40 08             	mov    0x8(%rax),%eax
  8025e6:	83 e0 03             	and    $0x3,%eax
  8025e9:	85 c0                	test   %eax,%eax
  8025eb:	75 3a                	jne    802627 <ftruncate+0xa0>
  8025ed:	48 b8 08 74 80 00 00 	movabs $0x807408,%rax
  8025f4:	00 00 00 
  8025f7:	48 8b 00             	mov    (%rax),%rax
  8025fa:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802600:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802603:	89 c6                	mov    %eax,%esi
  802605:	48 bf 28 4b 80 00 00 	movabs $0x804b28,%rdi
  80260c:	00 00 00 
  80260f:	b8 00 00 00 00       	mov    $0x0,%eax
  802614:	48 b9 f0 02 80 00 00 	movabs $0x8002f0,%rcx
  80261b:	00 00 00 
  80261e:	ff d1                	callq  *%rcx
  802620:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802625:	eb 2a                	jmp    802651 <ftruncate+0xca>
  802627:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80262b:	48 8b 40 30          	mov    0x30(%rax),%rax
  80262f:	48 85 c0             	test   %rax,%rax
  802632:	75 07                	jne    80263b <ftruncate+0xb4>
  802634:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802639:	eb 16                	jmp    802651 <ftruncate+0xca>
  80263b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80263f:	48 8b 40 30          	mov    0x30(%rax),%rax
  802643:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802647:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  80264a:	89 ce                	mov    %ecx,%esi
  80264c:	48 89 d7             	mov    %rdx,%rdi
  80264f:	ff d0                	callq  *%rax
  802651:	c9                   	leaveq 
  802652:	c3                   	retq   

0000000000802653 <fstat>:
  802653:	55                   	push   %rbp
  802654:	48 89 e5             	mov    %rsp,%rbp
  802657:	48 83 ec 30          	sub    $0x30,%rsp
  80265b:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80265e:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802662:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802666:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802669:	48 89 d6             	mov    %rdx,%rsi
  80266c:	89 c7                	mov    %eax,%edi
  80266e:	48 b8 f2 1e 80 00 00 	movabs $0x801ef2,%rax
  802675:	00 00 00 
  802678:	ff d0                	callq  *%rax
  80267a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80267d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802681:	78 24                	js     8026a7 <fstat+0x54>
  802683:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802687:	8b 00                	mov    (%rax),%eax
  802689:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80268d:	48 89 d6             	mov    %rdx,%rsi
  802690:	89 c7                	mov    %eax,%edi
  802692:	48 b8 4b 20 80 00 00 	movabs $0x80204b,%rax
  802699:	00 00 00 
  80269c:	ff d0                	callq  *%rax
  80269e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8026a1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8026a5:	79 05                	jns    8026ac <fstat+0x59>
  8026a7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8026aa:	eb 5e                	jmp    80270a <fstat+0xb7>
  8026ac:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8026b0:	48 8b 40 28          	mov    0x28(%rax),%rax
  8026b4:	48 85 c0             	test   %rax,%rax
  8026b7:	75 07                	jne    8026c0 <fstat+0x6d>
  8026b9:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8026be:	eb 4a                	jmp    80270a <fstat+0xb7>
  8026c0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8026c4:	c6 00 00             	movb   $0x0,(%rax)
  8026c7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8026cb:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  8026d2:	00 00 00 
  8026d5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8026d9:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  8026e0:	00 00 00 
  8026e3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8026e7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8026eb:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  8026f2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8026f6:	48 8b 40 28          	mov    0x28(%rax),%rax
  8026fa:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8026fe:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  802702:	48 89 ce             	mov    %rcx,%rsi
  802705:	48 89 d7             	mov    %rdx,%rdi
  802708:	ff d0                	callq  *%rax
  80270a:	c9                   	leaveq 
  80270b:	c3                   	retq   

000000000080270c <stat>:
  80270c:	55                   	push   %rbp
  80270d:	48 89 e5             	mov    %rsp,%rbp
  802710:	48 83 ec 20          	sub    $0x20,%rsp
  802714:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802718:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80271c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802720:	be 00 00 00 00       	mov    $0x0,%esi
  802725:	48 89 c7             	mov    %rax,%rdi
  802728:	48 b8 fa 27 80 00 00 	movabs $0x8027fa,%rax
  80272f:	00 00 00 
  802732:	ff d0                	callq  *%rax
  802734:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802737:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80273b:	79 05                	jns    802742 <stat+0x36>
  80273d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802740:	eb 2f                	jmp    802771 <stat+0x65>
  802742:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802746:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802749:	48 89 d6             	mov    %rdx,%rsi
  80274c:	89 c7                	mov    %eax,%edi
  80274e:	48 b8 53 26 80 00 00 	movabs $0x802653,%rax
  802755:	00 00 00 
  802758:	ff d0                	callq  *%rax
  80275a:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80275d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802760:	89 c7                	mov    %eax,%edi
  802762:	48 b8 02 21 80 00 00 	movabs $0x802102,%rax
  802769:	00 00 00 
  80276c:	ff d0                	callq  *%rax
  80276e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802771:	c9                   	leaveq 
  802772:	c3                   	retq   

0000000000802773 <fsipc>:
  802773:	55                   	push   %rbp
  802774:	48 89 e5             	mov    %rsp,%rbp
  802777:	48 83 ec 10          	sub    $0x10,%rsp
  80277b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80277e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802782:	48 b8 00 74 80 00 00 	movabs $0x807400,%rax
  802789:	00 00 00 
  80278c:	8b 00                	mov    (%rax),%eax
  80278e:	85 c0                	test   %eax,%eax
  802790:	75 1d                	jne    8027af <fsipc+0x3c>
  802792:	bf 01 00 00 00       	mov    $0x1,%edi
  802797:	48 b8 2e 44 80 00 00 	movabs $0x80442e,%rax
  80279e:	00 00 00 
  8027a1:	ff d0                	callq  *%rax
  8027a3:	48 ba 00 74 80 00 00 	movabs $0x807400,%rdx
  8027aa:	00 00 00 
  8027ad:	89 02                	mov    %eax,(%rdx)
  8027af:	48 b8 00 74 80 00 00 	movabs $0x807400,%rax
  8027b6:	00 00 00 
  8027b9:	8b 00                	mov    (%rax),%eax
  8027bb:	8b 75 fc             	mov    -0x4(%rbp),%esi
  8027be:	b9 07 00 00 00       	mov    $0x7,%ecx
  8027c3:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  8027ca:	00 00 00 
  8027cd:	89 c7                	mov    %eax,%edi
  8027cf:	48 b8 98 43 80 00 00 	movabs $0x804398,%rax
  8027d6:	00 00 00 
  8027d9:	ff d0                	callq  *%rax
  8027db:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8027df:	ba 00 00 00 00       	mov    $0x0,%edx
  8027e4:	48 89 c6             	mov    %rax,%rsi
  8027e7:	bf 00 00 00 00       	mov    $0x0,%edi
  8027ec:	48 b8 d7 42 80 00 00 	movabs $0x8042d7,%rax
  8027f3:	00 00 00 
  8027f6:	ff d0                	callq  *%rax
  8027f8:	c9                   	leaveq 
  8027f9:	c3                   	retq   

00000000008027fa <open>:
  8027fa:	55                   	push   %rbp
  8027fb:	48 89 e5             	mov    %rsp,%rbp
  8027fe:	48 83 ec 20          	sub    $0x20,%rsp
  802802:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802806:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  802809:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80280d:	48 89 c7             	mov    %rax,%rdi
  802810:	48 b8 93 0f 80 00 00 	movabs $0x800f93,%rax
  802817:	00 00 00 
  80281a:	ff d0                	callq  *%rax
  80281c:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802821:	7e 0a                	jle    80282d <open+0x33>
  802823:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802828:	e9 a5 00 00 00       	jmpq   8028d2 <open+0xd8>
  80282d:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802831:	48 89 c7             	mov    %rax,%rdi
  802834:	48 b8 5a 1e 80 00 00 	movabs $0x801e5a,%rax
  80283b:	00 00 00 
  80283e:	ff d0                	callq  *%rax
  802840:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802843:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802847:	79 08                	jns    802851 <open+0x57>
  802849:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80284c:	e9 81 00 00 00       	jmpq   8028d2 <open+0xd8>
  802851:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802855:	48 89 c6             	mov    %rax,%rsi
  802858:	48 bf 00 80 80 00 00 	movabs $0x808000,%rdi
  80285f:	00 00 00 
  802862:	48 b8 ff 0f 80 00 00 	movabs $0x800fff,%rax
  802869:	00 00 00 
  80286c:	ff d0                	callq  *%rax
  80286e:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802875:	00 00 00 
  802878:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  80287b:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  802881:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802885:	48 89 c6             	mov    %rax,%rsi
  802888:	bf 01 00 00 00       	mov    $0x1,%edi
  80288d:	48 b8 73 27 80 00 00 	movabs $0x802773,%rax
  802894:	00 00 00 
  802897:	ff d0                	callq  *%rax
  802899:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80289c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8028a0:	79 1d                	jns    8028bf <open+0xc5>
  8028a2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8028a6:	be 00 00 00 00       	mov    $0x0,%esi
  8028ab:	48 89 c7             	mov    %rax,%rdi
  8028ae:	48 b8 82 1f 80 00 00 	movabs $0x801f82,%rax
  8028b5:	00 00 00 
  8028b8:	ff d0                	callq  *%rax
  8028ba:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8028bd:	eb 13                	jmp    8028d2 <open+0xd8>
  8028bf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8028c3:	48 89 c7             	mov    %rax,%rdi
  8028c6:	48 b8 0c 1e 80 00 00 	movabs $0x801e0c,%rax
  8028cd:	00 00 00 
  8028d0:	ff d0                	callq  *%rax
  8028d2:	c9                   	leaveq 
  8028d3:	c3                   	retq   

00000000008028d4 <devfile_flush>:
  8028d4:	55                   	push   %rbp
  8028d5:	48 89 e5             	mov    %rsp,%rbp
  8028d8:	48 83 ec 10          	sub    $0x10,%rsp
  8028dc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8028e0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8028e4:	8b 50 0c             	mov    0xc(%rax),%edx
  8028e7:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8028ee:	00 00 00 
  8028f1:	89 10                	mov    %edx,(%rax)
  8028f3:	be 00 00 00 00       	mov    $0x0,%esi
  8028f8:	bf 06 00 00 00       	mov    $0x6,%edi
  8028fd:	48 b8 73 27 80 00 00 	movabs $0x802773,%rax
  802904:	00 00 00 
  802907:	ff d0                	callq  *%rax
  802909:	c9                   	leaveq 
  80290a:	c3                   	retq   

000000000080290b <devfile_read>:
  80290b:	55                   	push   %rbp
  80290c:	48 89 e5             	mov    %rsp,%rbp
  80290f:	48 83 ec 30          	sub    $0x30,%rsp
  802913:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802917:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80291b:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80291f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802923:	8b 50 0c             	mov    0xc(%rax),%edx
  802926:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80292d:	00 00 00 
  802930:	89 10                	mov    %edx,(%rax)
  802932:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802939:	00 00 00 
  80293c:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802940:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802944:	be 00 00 00 00       	mov    $0x0,%esi
  802949:	bf 03 00 00 00       	mov    $0x3,%edi
  80294e:	48 b8 73 27 80 00 00 	movabs $0x802773,%rax
  802955:	00 00 00 
  802958:	ff d0                	callq  *%rax
  80295a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80295d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802961:	79 08                	jns    80296b <devfile_read+0x60>
  802963:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802966:	e9 a4 00 00 00       	jmpq   802a0f <devfile_read+0x104>
  80296b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80296e:	48 98                	cltq   
  802970:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802974:	76 35                	jbe    8029ab <devfile_read+0xa0>
  802976:	48 b9 4e 4b 80 00 00 	movabs $0x804b4e,%rcx
  80297d:	00 00 00 
  802980:	48 ba 55 4b 80 00 00 	movabs $0x804b55,%rdx
  802987:	00 00 00 
  80298a:	be 89 00 00 00       	mov    $0x89,%esi
  80298f:	48 bf 6a 4b 80 00 00 	movabs $0x804b6a,%rdi
  802996:	00 00 00 
  802999:	b8 00 00 00 00       	mov    $0x0,%eax
  80299e:	49 b8 c3 41 80 00 00 	movabs $0x8041c3,%r8
  8029a5:	00 00 00 
  8029a8:	41 ff d0             	callq  *%r8
  8029ab:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  8029b2:	7e 35                	jle    8029e9 <devfile_read+0xde>
  8029b4:	48 b9 78 4b 80 00 00 	movabs $0x804b78,%rcx
  8029bb:	00 00 00 
  8029be:	48 ba 55 4b 80 00 00 	movabs $0x804b55,%rdx
  8029c5:	00 00 00 
  8029c8:	be 8a 00 00 00       	mov    $0x8a,%esi
  8029cd:	48 bf 6a 4b 80 00 00 	movabs $0x804b6a,%rdi
  8029d4:	00 00 00 
  8029d7:	b8 00 00 00 00       	mov    $0x0,%eax
  8029dc:	49 b8 c3 41 80 00 00 	movabs $0x8041c3,%r8
  8029e3:	00 00 00 
  8029e6:	41 ff d0             	callq  *%r8
  8029e9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029ec:	48 63 d0             	movslq %eax,%rdx
  8029ef:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8029f3:	48 be 00 80 80 00 00 	movabs $0x808000,%rsi
  8029fa:	00 00 00 
  8029fd:	48 89 c7             	mov    %rax,%rdi
  802a00:	48 b8 23 13 80 00 00 	movabs $0x801323,%rax
  802a07:	00 00 00 
  802a0a:	ff d0                	callq  *%rax
  802a0c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a0f:	c9                   	leaveq 
  802a10:	c3                   	retq   

0000000000802a11 <devfile_write>:
  802a11:	55                   	push   %rbp
  802a12:	48 89 e5             	mov    %rsp,%rbp
  802a15:	48 83 ec 40          	sub    $0x40,%rsp
  802a19:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802a1d:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802a21:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802a25:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  802a29:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802a2d:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  802a34:	00 
  802a35:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802a39:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  802a3d:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  802a42:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  802a46:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802a4a:	8b 50 0c             	mov    0xc(%rax),%edx
  802a4d:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802a54:	00 00 00 
  802a57:	89 10                	mov    %edx,(%rax)
  802a59:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802a60:	00 00 00 
  802a63:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802a67:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802a6b:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802a6f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802a73:	48 89 c6             	mov    %rax,%rsi
  802a76:	48 bf 10 80 80 00 00 	movabs $0x808010,%rdi
  802a7d:	00 00 00 
  802a80:	48 b8 23 13 80 00 00 	movabs $0x801323,%rax
  802a87:	00 00 00 
  802a8a:	ff d0                	callq  *%rax
  802a8c:	be 00 00 00 00       	mov    $0x0,%esi
  802a91:	bf 04 00 00 00       	mov    $0x4,%edi
  802a96:	48 b8 73 27 80 00 00 	movabs $0x802773,%rax
  802a9d:	00 00 00 
  802aa0:	ff d0                	callq  *%rax
  802aa2:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802aa5:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802aa9:	79 05                	jns    802ab0 <devfile_write+0x9f>
  802aab:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802aae:	eb 43                	jmp    802af3 <devfile_write+0xe2>
  802ab0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802ab3:	48 98                	cltq   
  802ab5:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  802ab9:	76 35                	jbe    802af0 <devfile_write+0xdf>
  802abb:	48 b9 4e 4b 80 00 00 	movabs $0x804b4e,%rcx
  802ac2:	00 00 00 
  802ac5:	48 ba 55 4b 80 00 00 	movabs $0x804b55,%rdx
  802acc:	00 00 00 
  802acf:	be a8 00 00 00       	mov    $0xa8,%esi
  802ad4:	48 bf 6a 4b 80 00 00 	movabs $0x804b6a,%rdi
  802adb:	00 00 00 
  802ade:	b8 00 00 00 00       	mov    $0x0,%eax
  802ae3:	49 b8 c3 41 80 00 00 	movabs $0x8041c3,%r8
  802aea:	00 00 00 
  802aed:	41 ff d0             	callq  *%r8
  802af0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802af3:	c9                   	leaveq 
  802af4:	c3                   	retq   

0000000000802af5 <devfile_stat>:
  802af5:	55                   	push   %rbp
  802af6:	48 89 e5             	mov    %rsp,%rbp
  802af9:	48 83 ec 20          	sub    $0x20,%rsp
  802afd:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802b01:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802b05:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b09:	8b 50 0c             	mov    0xc(%rax),%edx
  802b0c:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802b13:	00 00 00 
  802b16:	89 10                	mov    %edx,(%rax)
  802b18:	be 00 00 00 00       	mov    $0x0,%esi
  802b1d:	bf 05 00 00 00       	mov    $0x5,%edi
  802b22:	48 b8 73 27 80 00 00 	movabs $0x802773,%rax
  802b29:	00 00 00 
  802b2c:	ff d0                	callq  *%rax
  802b2e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b31:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b35:	79 05                	jns    802b3c <devfile_stat+0x47>
  802b37:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b3a:	eb 56                	jmp    802b92 <devfile_stat+0x9d>
  802b3c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802b40:	48 be 00 80 80 00 00 	movabs $0x808000,%rsi
  802b47:	00 00 00 
  802b4a:	48 89 c7             	mov    %rax,%rdi
  802b4d:	48 b8 ff 0f 80 00 00 	movabs $0x800fff,%rax
  802b54:	00 00 00 
  802b57:	ff d0                	callq  *%rax
  802b59:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802b60:	00 00 00 
  802b63:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  802b69:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802b6d:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  802b73:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802b7a:	00 00 00 
  802b7d:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  802b83:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802b87:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  802b8d:	b8 00 00 00 00       	mov    $0x0,%eax
  802b92:	c9                   	leaveq 
  802b93:	c3                   	retq   

0000000000802b94 <devfile_trunc>:
  802b94:	55                   	push   %rbp
  802b95:	48 89 e5             	mov    %rsp,%rbp
  802b98:	48 83 ec 10          	sub    $0x10,%rsp
  802b9c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802ba0:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802ba3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802ba7:	8b 50 0c             	mov    0xc(%rax),%edx
  802baa:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802bb1:	00 00 00 
  802bb4:	89 10                	mov    %edx,(%rax)
  802bb6:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802bbd:	00 00 00 
  802bc0:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802bc3:	89 50 04             	mov    %edx,0x4(%rax)
  802bc6:	be 00 00 00 00       	mov    $0x0,%esi
  802bcb:	bf 02 00 00 00       	mov    $0x2,%edi
  802bd0:	48 b8 73 27 80 00 00 	movabs $0x802773,%rax
  802bd7:	00 00 00 
  802bda:	ff d0                	callq  *%rax
  802bdc:	c9                   	leaveq 
  802bdd:	c3                   	retq   

0000000000802bde <remove>:
  802bde:	55                   	push   %rbp
  802bdf:	48 89 e5             	mov    %rsp,%rbp
  802be2:	48 83 ec 10          	sub    $0x10,%rsp
  802be6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802bea:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802bee:	48 89 c7             	mov    %rax,%rdi
  802bf1:	48 b8 93 0f 80 00 00 	movabs $0x800f93,%rax
  802bf8:	00 00 00 
  802bfb:	ff d0                	callq  *%rax
  802bfd:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802c02:	7e 07                	jle    802c0b <remove+0x2d>
  802c04:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802c09:	eb 33                	jmp    802c3e <remove+0x60>
  802c0b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802c0f:	48 89 c6             	mov    %rax,%rsi
  802c12:	48 bf 00 80 80 00 00 	movabs $0x808000,%rdi
  802c19:	00 00 00 
  802c1c:	48 b8 ff 0f 80 00 00 	movabs $0x800fff,%rax
  802c23:	00 00 00 
  802c26:	ff d0                	callq  *%rax
  802c28:	be 00 00 00 00       	mov    $0x0,%esi
  802c2d:	bf 07 00 00 00       	mov    $0x7,%edi
  802c32:	48 b8 73 27 80 00 00 	movabs $0x802773,%rax
  802c39:	00 00 00 
  802c3c:	ff d0                	callq  *%rax
  802c3e:	c9                   	leaveq 
  802c3f:	c3                   	retq   

0000000000802c40 <sync>:
  802c40:	55                   	push   %rbp
  802c41:	48 89 e5             	mov    %rsp,%rbp
  802c44:	be 00 00 00 00       	mov    $0x0,%esi
  802c49:	bf 08 00 00 00       	mov    $0x8,%edi
  802c4e:	48 b8 73 27 80 00 00 	movabs $0x802773,%rax
  802c55:	00 00 00 
  802c58:	ff d0                	callq  *%rax
  802c5a:	5d                   	pop    %rbp
  802c5b:	c3                   	retq   

0000000000802c5c <copy>:
  802c5c:	55                   	push   %rbp
  802c5d:	48 89 e5             	mov    %rsp,%rbp
  802c60:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  802c67:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  802c6e:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  802c75:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  802c7c:	be 00 00 00 00       	mov    $0x0,%esi
  802c81:	48 89 c7             	mov    %rax,%rdi
  802c84:	48 b8 fa 27 80 00 00 	movabs $0x8027fa,%rax
  802c8b:	00 00 00 
  802c8e:	ff d0                	callq  *%rax
  802c90:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c93:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c97:	79 28                	jns    802cc1 <copy+0x65>
  802c99:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c9c:	89 c6                	mov    %eax,%esi
  802c9e:	48 bf 84 4b 80 00 00 	movabs $0x804b84,%rdi
  802ca5:	00 00 00 
  802ca8:	b8 00 00 00 00       	mov    $0x0,%eax
  802cad:	48 ba f0 02 80 00 00 	movabs $0x8002f0,%rdx
  802cb4:	00 00 00 
  802cb7:	ff d2                	callq  *%rdx
  802cb9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802cbc:	e9 74 01 00 00       	jmpq   802e35 <copy+0x1d9>
  802cc1:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  802cc8:	be 01 01 00 00       	mov    $0x101,%esi
  802ccd:	48 89 c7             	mov    %rax,%rdi
  802cd0:	48 b8 fa 27 80 00 00 	movabs $0x8027fa,%rax
  802cd7:	00 00 00 
  802cda:	ff d0                	callq  *%rax
  802cdc:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802cdf:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802ce3:	79 39                	jns    802d1e <copy+0xc2>
  802ce5:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802ce8:	89 c6                	mov    %eax,%esi
  802cea:	48 bf 9a 4b 80 00 00 	movabs $0x804b9a,%rdi
  802cf1:	00 00 00 
  802cf4:	b8 00 00 00 00       	mov    $0x0,%eax
  802cf9:	48 ba f0 02 80 00 00 	movabs $0x8002f0,%rdx
  802d00:	00 00 00 
  802d03:	ff d2                	callq  *%rdx
  802d05:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d08:	89 c7                	mov    %eax,%edi
  802d0a:	48 b8 02 21 80 00 00 	movabs $0x802102,%rax
  802d11:	00 00 00 
  802d14:	ff d0                	callq  *%rax
  802d16:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802d19:	e9 17 01 00 00       	jmpq   802e35 <copy+0x1d9>
  802d1e:	eb 74                	jmp    802d94 <copy+0x138>
  802d20:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802d23:	48 63 d0             	movslq %eax,%rdx
  802d26:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802d2d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802d30:	48 89 ce             	mov    %rcx,%rsi
  802d33:	89 c7                	mov    %eax,%edi
  802d35:	48 b8 6e 24 80 00 00 	movabs $0x80246e,%rax
  802d3c:	00 00 00 
  802d3f:	ff d0                	callq  *%rax
  802d41:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802d44:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802d48:	79 4a                	jns    802d94 <copy+0x138>
  802d4a:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802d4d:	89 c6                	mov    %eax,%esi
  802d4f:	48 bf b4 4b 80 00 00 	movabs $0x804bb4,%rdi
  802d56:	00 00 00 
  802d59:	b8 00 00 00 00       	mov    $0x0,%eax
  802d5e:	48 ba f0 02 80 00 00 	movabs $0x8002f0,%rdx
  802d65:	00 00 00 
  802d68:	ff d2                	callq  *%rdx
  802d6a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d6d:	89 c7                	mov    %eax,%edi
  802d6f:	48 b8 02 21 80 00 00 	movabs $0x802102,%rax
  802d76:	00 00 00 
  802d79:	ff d0                	callq  *%rax
  802d7b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802d7e:	89 c7                	mov    %eax,%edi
  802d80:	48 b8 02 21 80 00 00 	movabs $0x802102,%rax
  802d87:	00 00 00 
  802d8a:	ff d0                	callq  *%rax
  802d8c:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802d8f:	e9 a1 00 00 00       	jmpq   802e35 <copy+0x1d9>
  802d94:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802d9b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d9e:	ba 00 02 00 00       	mov    $0x200,%edx
  802da3:	48 89 ce             	mov    %rcx,%rsi
  802da6:	89 c7                	mov    %eax,%edi
  802da8:	48 b8 24 23 80 00 00 	movabs $0x802324,%rax
  802daf:	00 00 00 
  802db2:	ff d0                	callq  *%rax
  802db4:	89 45 f4             	mov    %eax,-0xc(%rbp)
  802db7:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802dbb:	0f 8f 5f ff ff ff    	jg     802d20 <copy+0xc4>
  802dc1:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802dc5:	79 47                	jns    802e0e <copy+0x1b2>
  802dc7:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802dca:	89 c6                	mov    %eax,%esi
  802dcc:	48 bf c7 4b 80 00 00 	movabs $0x804bc7,%rdi
  802dd3:	00 00 00 
  802dd6:	b8 00 00 00 00       	mov    $0x0,%eax
  802ddb:	48 ba f0 02 80 00 00 	movabs $0x8002f0,%rdx
  802de2:	00 00 00 
  802de5:	ff d2                	callq  *%rdx
  802de7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802dea:	89 c7                	mov    %eax,%edi
  802dec:	48 b8 02 21 80 00 00 	movabs $0x802102,%rax
  802df3:	00 00 00 
  802df6:	ff d0                	callq  *%rax
  802df8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802dfb:	89 c7                	mov    %eax,%edi
  802dfd:	48 b8 02 21 80 00 00 	movabs $0x802102,%rax
  802e04:	00 00 00 
  802e07:	ff d0                	callq  *%rax
  802e09:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802e0c:	eb 27                	jmp    802e35 <copy+0x1d9>
  802e0e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e11:	89 c7                	mov    %eax,%edi
  802e13:	48 b8 02 21 80 00 00 	movabs $0x802102,%rax
  802e1a:	00 00 00 
  802e1d:	ff d0                	callq  *%rax
  802e1f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802e22:	89 c7                	mov    %eax,%edi
  802e24:	48 b8 02 21 80 00 00 	movabs $0x802102,%rax
  802e2b:	00 00 00 
  802e2e:	ff d0                	callq  *%rax
  802e30:	b8 00 00 00 00       	mov    $0x0,%eax
  802e35:	c9                   	leaveq 
  802e36:	c3                   	retq   

0000000000802e37 <writebuf>:
  802e37:	55                   	push   %rbp
  802e38:	48 89 e5             	mov    %rsp,%rbp
  802e3b:	48 83 ec 20          	sub    $0x20,%rsp
  802e3f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802e43:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e47:	8b 40 0c             	mov    0xc(%rax),%eax
  802e4a:	85 c0                	test   %eax,%eax
  802e4c:	7e 67                	jle    802eb5 <writebuf+0x7e>
  802e4e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e52:	8b 40 04             	mov    0x4(%rax),%eax
  802e55:	48 63 d0             	movslq %eax,%rdx
  802e58:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e5c:	48 8d 48 10          	lea    0x10(%rax),%rcx
  802e60:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e64:	8b 00                	mov    (%rax),%eax
  802e66:	48 89 ce             	mov    %rcx,%rsi
  802e69:	89 c7                	mov    %eax,%edi
  802e6b:	48 b8 6e 24 80 00 00 	movabs $0x80246e,%rax
  802e72:	00 00 00 
  802e75:	ff d0                	callq  *%rax
  802e77:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e7a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e7e:	7e 13                	jle    802e93 <writebuf+0x5c>
  802e80:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e84:	8b 50 08             	mov    0x8(%rax),%edx
  802e87:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e8a:	01 c2                	add    %eax,%edx
  802e8c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e90:	89 50 08             	mov    %edx,0x8(%rax)
  802e93:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e97:	8b 40 04             	mov    0x4(%rax),%eax
  802e9a:	3b 45 fc             	cmp    -0x4(%rbp),%eax
  802e9d:	74 16                	je     802eb5 <writebuf+0x7e>
  802e9f:	b8 00 00 00 00       	mov    $0x0,%eax
  802ea4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ea8:	0f 4e 45 fc          	cmovle -0x4(%rbp),%eax
  802eac:	89 c2                	mov    %eax,%edx
  802eae:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802eb2:	89 50 0c             	mov    %edx,0xc(%rax)
  802eb5:	c9                   	leaveq 
  802eb6:	c3                   	retq   

0000000000802eb7 <putch>:
  802eb7:	55                   	push   %rbp
  802eb8:	48 89 e5             	mov    %rsp,%rbp
  802ebb:	48 83 ec 20          	sub    $0x20,%rsp
  802ebf:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802ec2:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802ec6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802eca:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802ece:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802ed2:	8b 40 04             	mov    0x4(%rax),%eax
  802ed5:	8d 48 01             	lea    0x1(%rax),%ecx
  802ed8:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802edc:	89 4a 04             	mov    %ecx,0x4(%rdx)
  802edf:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802ee2:	89 d1                	mov    %edx,%ecx
  802ee4:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802ee8:	48 98                	cltq   
  802eea:	88 4c 02 10          	mov    %cl,0x10(%rdx,%rax,1)
  802eee:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802ef2:	8b 40 04             	mov    0x4(%rax),%eax
  802ef5:	3d 00 01 00 00       	cmp    $0x100,%eax
  802efa:	75 1e                	jne    802f1a <putch+0x63>
  802efc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802f00:	48 89 c7             	mov    %rax,%rdi
  802f03:	48 b8 37 2e 80 00 00 	movabs $0x802e37,%rax
  802f0a:	00 00 00 
  802f0d:	ff d0                	callq  *%rax
  802f0f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802f13:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%rax)
  802f1a:	c9                   	leaveq 
  802f1b:	c3                   	retq   

0000000000802f1c <vfprintf>:
  802f1c:	55                   	push   %rbp
  802f1d:	48 89 e5             	mov    %rsp,%rbp
  802f20:	48 81 ec 30 01 00 00 	sub    $0x130,%rsp
  802f27:	89 bd ec fe ff ff    	mov    %edi,-0x114(%rbp)
  802f2d:	48 89 b5 e0 fe ff ff 	mov    %rsi,-0x120(%rbp)
  802f34:	48 89 95 d8 fe ff ff 	mov    %rdx,-0x128(%rbp)
  802f3b:	8b 85 ec fe ff ff    	mov    -0x114(%rbp),%eax
  802f41:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%rbp)
  802f47:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  802f4e:	00 00 00 
  802f51:	c7 85 f8 fe ff ff 00 	movl   $0x0,-0x108(%rbp)
  802f58:	00 00 00 
  802f5b:	c7 85 fc fe ff ff 01 	movl   $0x1,-0x104(%rbp)
  802f62:	00 00 00 
  802f65:	48 8b 8d d8 fe ff ff 	mov    -0x128(%rbp),%rcx
  802f6c:	48 8b 95 e0 fe ff ff 	mov    -0x120(%rbp),%rdx
  802f73:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  802f7a:	48 89 c6             	mov    %rax,%rsi
  802f7d:	48 bf b7 2e 80 00 00 	movabs $0x802eb7,%rdi
  802f84:	00 00 00 
  802f87:	48 b8 a3 06 80 00 00 	movabs $0x8006a3,%rax
  802f8e:	00 00 00 
  802f91:	ff d0                	callq  *%rax
  802f93:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  802f99:	85 c0                	test   %eax,%eax
  802f9b:	7e 16                	jle    802fb3 <vfprintf+0x97>
  802f9d:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  802fa4:	48 89 c7             	mov    %rax,%rdi
  802fa7:	48 b8 37 2e 80 00 00 	movabs $0x802e37,%rax
  802fae:	00 00 00 
  802fb1:	ff d0                	callq  *%rax
  802fb3:	8b 85 f8 fe ff ff    	mov    -0x108(%rbp),%eax
  802fb9:	85 c0                	test   %eax,%eax
  802fbb:	74 08                	je     802fc5 <vfprintf+0xa9>
  802fbd:	8b 85 f8 fe ff ff    	mov    -0x108(%rbp),%eax
  802fc3:	eb 06                	jmp    802fcb <vfprintf+0xaf>
  802fc5:	8b 85 fc fe ff ff    	mov    -0x104(%rbp),%eax
  802fcb:	c9                   	leaveq 
  802fcc:	c3                   	retq   

0000000000802fcd <fprintf>:
  802fcd:	55                   	push   %rbp
  802fce:	48 89 e5             	mov    %rsp,%rbp
  802fd1:	48 81 ec e0 00 00 00 	sub    $0xe0,%rsp
  802fd8:	89 bd 2c ff ff ff    	mov    %edi,-0xd4(%rbp)
  802fde:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  802fe5:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  802fec:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  802ff3:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  802ffa:	84 c0                	test   %al,%al
  802ffc:	74 20                	je     80301e <fprintf+0x51>
  802ffe:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  803002:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  803006:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  80300a:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  80300e:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  803012:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  803016:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  80301a:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  80301e:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  803025:	c7 85 30 ff ff ff 10 	movl   $0x10,-0xd0(%rbp)
  80302c:	00 00 00 
  80302f:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  803036:	00 00 00 
  803039:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80303d:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  803044:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  80304b:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  803052:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  803059:	48 8b 8d 20 ff ff ff 	mov    -0xe0(%rbp),%rcx
  803060:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  803066:	48 89 ce             	mov    %rcx,%rsi
  803069:	89 c7                	mov    %eax,%edi
  80306b:	48 b8 1c 2f 80 00 00 	movabs $0x802f1c,%rax
  803072:	00 00 00 
  803075:	ff d0                	callq  *%rax
  803077:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  80307d:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  803083:	c9                   	leaveq 
  803084:	c3                   	retq   

0000000000803085 <printf>:
  803085:	55                   	push   %rbp
  803086:	48 89 e5             	mov    %rsp,%rbp
  803089:	48 81 ec e0 00 00 00 	sub    $0xe0,%rsp
  803090:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  803097:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  80309e:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8030a5:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8030ac:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8030b3:	84 c0                	test   %al,%al
  8030b5:	74 20                	je     8030d7 <printf+0x52>
  8030b7:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8030bb:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8030bf:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8030c3:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8030c7:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8030cb:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8030cf:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8030d3:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8030d7:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  8030de:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  8030e5:	00 00 00 
  8030e8:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8030ef:	00 00 00 
  8030f2:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8030f6:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8030fd:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  803104:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  80310b:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  803112:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  803119:	48 89 c6             	mov    %rax,%rsi
  80311c:	bf 01 00 00 00       	mov    $0x1,%edi
  803121:	48 b8 1c 2f 80 00 00 	movabs $0x802f1c,%rax
  803128:	00 00 00 
  80312b:	ff d0                	callq  *%rax
  80312d:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  803133:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  803139:	c9                   	leaveq 
  80313a:	c3                   	retq   

000000000080313b <fd2sockid>:
  80313b:	55                   	push   %rbp
  80313c:	48 89 e5             	mov    %rsp,%rbp
  80313f:	48 83 ec 20          	sub    $0x20,%rsp
  803143:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803146:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80314a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80314d:	48 89 d6             	mov    %rdx,%rsi
  803150:	89 c7                	mov    %eax,%edi
  803152:	48 b8 f2 1e 80 00 00 	movabs $0x801ef2,%rax
  803159:	00 00 00 
  80315c:	ff d0                	callq  *%rax
  80315e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803161:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803165:	79 05                	jns    80316c <fd2sockid+0x31>
  803167:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80316a:	eb 24                	jmp    803190 <fd2sockid+0x55>
  80316c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803170:	8b 10                	mov    (%rax),%edx
  803172:	48 b8 a0 60 80 00 00 	movabs $0x8060a0,%rax
  803179:	00 00 00 
  80317c:	8b 00                	mov    (%rax),%eax
  80317e:	39 c2                	cmp    %eax,%edx
  803180:	74 07                	je     803189 <fd2sockid+0x4e>
  803182:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803187:	eb 07                	jmp    803190 <fd2sockid+0x55>
  803189:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80318d:	8b 40 0c             	mov    0xc(%rax),%eax
  803190:	c9                   	leaveq 
  803191:	c3                   	retq   

0000000000803192 <alloc_sockfd>:
  803192:	55                   	push   %rbp
  803193:	48 89 e5             	mov    %rsp,%rbp
  803196:	48 83 ec 20          	sub    $0x20,%rsp
  80319a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80319d:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8031a1:	48 89 c7             	mov    %rax,%rdi
  8031a4:	48 b8 5a 1e 80 00 00 	movabs $0x801e5a,%rax
  8031ab:	00 00 00 
  8031ae:	ff d0                	callq  *%rax
  8031b0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8031b3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8031b7:	78 26                	js     8031df <alloc_sockfd+0x4d>
  8031b9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8031bd:	ba 07 04 00 00       	mov    $0x407,%edx
  8031c2:	48 89 c6             	mov    %rax,%rsi
  8031c5:	bf 00 00 00 00       	mov    $0x0,%edi
  8031ca:	48 b8 2e 19 80 00 00 	movabs $0x80192e,%rax
  8031d1:	00 00 00 
  8031d4:	ff d0                	callq  *%rax
  8031d6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8031d9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8031dd:	79 16                	jns    8031f5 <alloc_sockfd+0x63>
  8031df:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8031e2:	89 c7                	mov    %eax,%edi
  8031e4:	48 b8 9f 36 80 00 00 	movabs $0x80369f,%rax
  8031eb:	00 00 00 
  8031ee:	ff d0                	callq  *%rax
  8031f0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031f3:	eb 3a                	jmp    80322f <alloc_sockfd+0x9d>
  8031f5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8031f9:	48 ba a0 60 80 00 00 	movabs $0x8060a0,%rdx
  803200:	00 00 00 
  803203:	8b 12                	mov    (%rdx),%edx
  803205:	89 10                	mov    %edx,(%rax)
  803207:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80320b:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  803212:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803216:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803219:	89 50 0c             	mov    %edx,0xc(%rax)
  80321c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803220:	48 89 c7             	mov    %rax,%rdi
  803223:	48 b8 0c 1e 80 00 00 	movabs $0x801e0c,%rax
  80322a:	00 00 00 
  80322d:	ff d0                	callq  *%rax
  80322f:	c9                   	leaveq 
  803230:	c3                   	retq   

0000000000803231 <accept>:
  803231:	55                   	push   %rbp
  803232:	48 89 e5             	mov    %rsp,%rbp
  803235:	48 83 ec 30          	sub    $0x30,%rsp
  803239:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80323c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803240:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803244:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803247:	89 c7                	mov    %eax,%edi
  803249:	48 b8 3b 31 80 00 00 	movabs $0x80313b,%rax
  803250:	00 00 00 
  803253:	ff d0                	callq  *%rax
  803255:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803258:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80325c:	79 05                	jns    803263 <accept+0x32>
  80325e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803261:	eb 3b                	jmp    80329e <accept+0x6d>
  803263:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803267:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80326b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80326e:	48 89 ce             	mov    %rcx,%rsi
  803271:	89 c7                	mov    %eax,%edi
  803273:	48 b8 7c 35 80 00 00 	movabs $0x80357c,%rax
  80327a:	00 00 00 
  80327d:	ff d0                	callq  *%rax
  80327f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803282:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803286:	79 05                	jns    80328d <accept+0x5c>
  803288:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80328b:	eb 11                	jmp    80329e <accept+0x6d>
  80328d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803290:	89 c7                	mov    %eax,%edi
  803292:	48 b8 92 31 80 00 00 	movabs $0x803192,%rax
  803299:	00 00 00 
  80329c:	ff d0                	callq  *%rax
  80329e:	c9                   	leaveq 
  80329f:	c3                   	retq   

00000000008032a0 <bind>:
  8032a0:	55                   	push   %rbp
  8032a1:	48 89 e5             	mov    %rsp,%rbp
  8032a4:	48 83 ec 20          	sub    $0x20,%rsp
  8032a8:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8032ab:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8032af:	89 55 e8             	mov    %edx,-0x18(%rbp)
  8032b2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8032b5:	89 c7                	mov    %eax,%edi
  8032b7:	48 b8 3b 31 80 00 00 	movabs $0x80313b,%rax
  8032be:	00 00 00 
  8032c1:	ff d0                	callq  *%rax
  8032c3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8032c6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8032ca:	79 05                	jns    8032d1 <bind+0x31>
  8032cc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032cf:	eb 1b                	jmp    8032ec <bind+0x4c>
  8032d1:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8032d4:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8032d8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032db:	48 89 ce             	mov    %rcx,%rsi
  8032de:	89 c7                	mov    %eax,%edi
  8032e0:	48 b8 fb 35 80 00 00 	movabs $0x8035fb,%rax
  8032e7:	00 00 00 
  8032ea:	ff d0                	callq  *%rax
  8032ec:	c9                   	leaveq 
  8032ed:	c3                   	retq   

00000000008032ee <shutdown>:
  8032ee:	55                   	push   %rbp
  8032ef:	48 89 e5             	mov    %rsp,%rbp
  8032f2:	48 83 ec 20          	sub    $0x20,%rsp
  8032f6:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8032f9:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8032fc:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8032ff:	89 c7                	mov    %eax,%edi
  803301:	48 b8 3b 31 80 00 00 	movabs $0x80313b,%rax
  803308:	00 00 00 
  80330b:	ff d0                	callq  *%rax
  80330d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803310:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803314:	79 05                	jns    80331b <shutdown+0x2d>
  803316:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803319:	eb 16                	jmp    803331 <shutdown+0x43>
  80331b:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80331e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803321:	89 d6                	mov    %edx,%esi
  803323:	89 c7                	mov    %eax,%edi
  803325:	48 b8 5f 36 80 00 00 	movabs $0x80365f,%rax
  80332c:	00 00 00 
  80332f:	ff d0                	callq  *%rax
  803331:	c9                   	leaveq 
  803332:	c3                   	retq   

0000000000803333 <devsock_close>:
  803333:	55                   	push   %rbp
  803334:	48 89 e5             	mov    %rsp,%rbp
  803337:	48 83 ec 10          	sub    $0x10,%rsp
  80333b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80333f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803343:	48 89 c7             	mov    %rax,%rdi
  803346:	48 b8 a0 44 80 00 00 	movabs $0x8044a0,%rax
  80334d:	00 00 00 
  803350:	ff d0                	callq  *%rax
  803352:	83 f8 01             	cmp    $0x1,%eax
  803355:	75 17                	jne    80336e <devsock_close+0x3b>
  803357:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80335b:	8b 40 0c             	mov    0xc(%rax),%eax
  80335e:	89 c7                	mov    %eax,%edi
  803360:	48 b8 9f 36 80 00 00 	movabs $0x80369f,%rax
  803367:	00 00 00 
  80336a:	ff d0                	callq  *%rax
  80336c:	eb 05                	jmp    803373 <devsock_close+0x40>
  80336e:	b8 00 00 00 00       	mov    $0x0,%eax
  803373:	c9                   	leaveq 
  803374:	c3                   	retq   

0000000000803375 <connect>:
  803375:	55                   	push   %rbp
  803376:	48 89 e5             	mov    %rsp,%rbp
  803379:	48 83 ec 20          	sub    $0x20,%rsp
  80337d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803380:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803384:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803387:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80338a:	89 c7                	mov    %eax,%edi
  80338c:	48 b8 3b 31 80 00 00 	movabs $0x80313b,%rax
  803393:	00 00 00 
  803396:	ff d0                	callq  *%rax
  803398:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80339b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80339f:	79 05                	jns    8033a6 <connect+0x31>
  8033a1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033a4:	eb 1b                	jmp    8033c1 <connect+0x4c>
  8033a6:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8033a9:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8033ad:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033b0:	48 89 ce             	mov    %rcx,%rsi
  8033b3:	89 c7                	mov    %eax,%edi
  8033b5:	48 b8 cc 36 80 00 00 	movabs $0x8036cc,%rax
  8033bc:	00 00 00 
  8033bf:	ff d0                	callq  *%rax
  8033c1:	c9                   	leaveq 
  8033c2:	c3                   	retq   

00000000008033c3 <listen>:
  8033c3:	55                   	push   %rbp
  8033c4:	48 89 e5             	mov    %rsp,%rbp
  8033c7:	48 83 ec 20          	sub    $0x20,%rsp
  8033cb:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8033ce:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8033d1:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8033d4:	89 c7                	mov    %eax,%edi
  8033d6:	48 b8 3b 31 80 00 00 	movabs $0x80313b,%rax
  8033dd:	00 00 00 
  8033e0:	ff d0                	callq  *%rax
  8033e2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8033e5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8033e9:	79 05                	jns    8033f0 <listen+0x2d>
  8033eb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033ee:	eb 16                	jmp    803406 <listen+0x43>
  8033f0:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8033f3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033f6:	89 d6                	mov    %edx,%esi
  8033f8:	89 c7                	mov    %eax,%edi
  8033fa:	48 b8 30 37 80 00 00 	movabs $0x803730,%rax
  803401:	00 00 00 
  803404:	ff d0                	callq  *%rax
  803406:	c9                   	leaveq 
  803407:	c3                   	retq   

0000000000803408 <devsock_read>:
  803408:	55                   	push   %rbp
  803409:	48 89 e5             	mov    %rsp,%rbp
  80340c:	48 83 ec 20          	sub    $0x20,%rsp
  803410:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803414:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803418:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80341c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803420:	89 c2                	mov    %eax,%edx
  803422:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803426:	8b 40 0c             	mov    0xc(%rax),%eax
  803429:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  80342d:	b9 00 00 00 00       	mov    $0x0,%ecx
  803432:	89 c7                	mov    %eax,%edi
  803434:	48 b8 70 37 80 00 00 	movabs $0x803770,%rax
  80343b:	00 00 00 
  80343e:	ff d0                	callq  *%rax
  803440:	c9                   	leaveq 
  803441:	c3                   	retq   

0000000000803442 <devsock_write>:
  803442:	55                   	push   %rbp
  803443:	48 89 e5             	mov    %rsp,%rbp
  803446:	48 83 ec 20          	sub    $0x20,%rsp
  80344a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80344e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803452:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803456:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80345a:	89 c2                	mov    %eax,%edx
  80345c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803460:	8b 40 0c             	mov    0xc(%rax),%eax
  803463:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803467:	b9 00 00 00 00       	mov    $0x0,%ecx
  80346c:	89 c7                	mov    %eax,%edi
  80346e:	48 b8 3c 38 80 00 00 	movabs $0x80383c,%rax
  803475:	00 00 00 
  803478:	ff d0                	callq  *%rax
  80347a:	c9                   	leaveq 
  80347b:	c3                   	retq   

000000000080347c <devsock_stat>:
  80347c:	55                   	push   %rbp
  80347d:	48 89 e5             	mov    %rsp,%rbp
  803480:	48 83 ec 10          	sub    $0x10,%rsp
  803484:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803488:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80348c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803490:	48 be e2 4b 80 00 00 	movabs $0x804be2,%rsi
  803497:	00 00 00 
  80349a:	48 89 c7             	mov    %rax,%rdi
  80349d:	48 b8 ff 0f 80 00 00 	movabs $0x800fff,%rax
  8034a4:	00 00 00 
  8034a7:	ff d0                	callq  *%rax
  8034a9:	b8 00 00 00 00       	mov    $0x0,%eax
  8034ae:	c9                   	leaveq 
  8034af:	c3                   	retq   

00000000008034b0 <socket>:
  8034b0:	55                   	push   %rbp
  8034b1:	48 89 e5             	mov    %rsp,%rbp
  8034b4:	48 83 ec 20          	sub    $0x20,%rsp
  8034b8:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8034bb:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8034be:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  8034c1:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8034c4:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  8034c7:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8034ca:	89 ce                	mov    %ecx,%esi
  8034cc:	89 c7                	mov    %eax,%edi
  8034ce:	48 b8 f4 38 80 00 00 	movabs $0x8038f4,%rax
  8034d5:	00 00 00 
  8034d8:	ff d0                	callq  *%rax
  8034da:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8034dd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8034e1:	79 05                	jns    8034e8 <socket+0x38>
  8034e3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034e6:	eb 11                	jmp    8034f9 <socket+0x49>
  8034e8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034eb:	89 c7                	mov    %eax,%edi
  8034ed:	48 b8 92 31 80 00 00 	movabs $0x803192,%rax
  8034f4:	00 00 00 
  8034f7:	ff d0                	callq  *%rax
  8034f9:	c9                   	leaveq 
  8034fa:	c3                   	retq   

00000000008034fb <nsipc>:
  8034fb:	55                   	push   %rbp
  8034fc:	48 89 e5             	mov    %rsp,%rbp
  8034ff:	48 83 ec 10          	sub    $0x10,%rsp
  803503:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803506:	48 b8 04 74 80 00 00 	movabs $0x807404,%rax
  80350d:	00 00 00 
  803510:	8b 00                	mov    (%rax),%eax
  803512:	85 c0                	test   %eax,%eax
  803514:	75 1d                	jne    803533 <nsipc+0x38>
  803516:	bf 02 00 00 00       	mov    $0x2,%edi
  80351b:	48 b8 2e 44 80 00 00 	movabs $0x80442e,%rax
  803522:	00 00 00 
  803525:	ff d0                	callq  *%rax
  803527:	48 ba 04 74 80 00 00 	movabs $0x807404,%rdx
  80352e:	00 00 00 
  803531:	89 02                	mov    %eax,(%rdx)
  803533:	48 b8 04 74 80 00 00 	movabs $0x807404,%rax
  80353a:	00 00 00 
  80353d:	8b 00                	mov    (%rax),%eax
  80353f:	8b 75 fc             	mov    -0x4(%rbp),%esi
  803542:	b9 07 00 00 00       	mov    $0x7,%ecx
  803547:	48 ba 00 a0 80 00 00 	movabs $0x80a000,%rdx
  80354e:	00 00 00 
  803551:	89 c7                	mov    %eax,%edi
  803553:	48 b8 98 43 80 00 00 	movabs $0x804398,%rax
  80355a:	00 00 00 
  80355d:	ff d0                	callq  *%rax
  80355f:	ba 00 00 00 00       	mov    $0x0,%edx
  803564:	be 00 00 00 00       	mov    $0x0,%esi
  803569:	bf 00 00 00 00       	mov    $0x0,%edi
  80356e:	48 b8 d7 42 80 00 00 	movabs $0x8042d7,%rax
  803575:	00 00 00 
  803578:	ff d0                	callq  *%rax
  80357a:	c9                   	leaveq 
  80357b:	c3                   	retq   

000000000080357c <nsipc_accept>:
  80357c:	55                   	push   %rbp
  80357d:	48 89 e5             	mov    %rsp,%rbp
  803580:	48 83 ec 30          	sub    $0x30,%rsp
  803584:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803587:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80358b:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80358f:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803596:	00 00 00 
  803599:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80359c:	89 10                	mov    %edx,(%rax)
  80359e:	bf 01 00 00 00       	mov    $0x1,%edi
  8035a3:	48 b8 fb 34 80 00 00 	movabs $0x8034fb,%rax
  8035aa:	00 00 00 
  8035ad:	ff d0                	callq  *%rax
  8035af:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8035b2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8035b6:	78 3e                	js     8035f6 <nsipc_accept+0x7a>
  8035b8:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8035bf:	00 00 00 
  8035c2:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8035c6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8035ca:	8b 40 10             	mov    0x10(%rax),%eax
  8035cd:	89 c2                	mov    %eax,%edx
  8035cf:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8035d3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8035d7:	48 89 ce             	mov    %rcx,%rsi
  8035da:	48 89 c7             	mov    %rax,%rdi
  8035dd:	48 b8 23 13 80 00 00 	movabs $0x801323,%rax
  8035e4:	00 00 00 
  8035e7:	ff d0                	callq  *%rax
  8035e9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8035ed:	8b 50 10             	mov    0x10(%rax),%edx
  8035f0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8035f4:	89 10                	mov    %edx,(%rax)
  8035f6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035f9:	c9                   	leaveq 
  8035fa:	c3                   	retq   

00000000008035fb <nsipc_bind>:
  8035fb:	55                   	push   %rbp
  8035fc:	48 89 e5             	mov    %rsp,%rbp
  8035ff:	48 83 ec 10          	sub    $0x10,%rsp
  803603:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803606:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80360a:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80360d:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803614:	00 00 00 
  803617:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80361a:	89 10                	mov    %edx,(%rax)
  80361c:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80361f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803623:	48 89 c6             	mov    %rax,%rsi
  803626:	48 bf 04 a0 80 00 00 	movabs $0x80a004,%rdi
  80362d:	00 00 00 
  803630:	48 b8 23 13 80 00 00 	movabs $0x801323,%rax
  803637:	00 00 00 
  80363a:	ff d0                	callq  *%rax
  80363c:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803643:	00 00 00 
  803646:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803649:	89 50 14             	mov    %edx,0x14(%rax)
  80364c:	bf 02 00 00 00       	mov    $0x2,%edi
  803651:	48 b8 fb 34 80 00 00 	movabs $0x8034fb,%rax
  803658:	00 00 00 
  80365b:	ff d0                	callq  *%rax
  80365d:	c9                   	leaveq 
  80365e:	c3                   	retq   

000000000080365f <nsipc_shutdown>:
  80365f:	55                   	push   %rbp
  803660:	48 89 e5             	mov    %rsp,%rbp
  803663:	48 83 ec 10          	sub    $0x10,%rsp
  803667:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80366a:	89 75 f8             	mov    %esi,-0x8(%rbp)
  80366d:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803674:	00 00 00 
  803677:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80367a:	89 10                	mov    %edx,(%rax)
  80367c:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803683:	00 00 00 
  803686:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803689:	89 50 04             	mov    %edx,0x4(%rax)
  80368c:	bf 03 00 00 00       	mov    $0x3,%edi
  803691:	48 b8 fb 34 80 00 00 	movabs $0x8034fb,%rax
  803698:	00 00 00 
  80369b:	ff d0                	callq  *%rax
  80369d:	c9                   	leaveq 
  80369e:	c3                   	retq   

000000000080369f <nsipc_close>:
  80369f:	55                   	push   %rbp
  8036a0:	48 89 e5             	mov    %rsp,%rbp
  8036a3:	48 83 ec 10          	sub    $0x10,%rsp
  8036a7:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8036aa:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8036b1:	00 00 00 
  8036b4:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8036b7:	89 10                	mov    %edx,(%rax)
  8036b9:	bf 04 00 00 00       	mov    $0x4,%edi
  8036be:	48 b8 fb 34 80 00 00 	movabs $0x8034fb,%rax
  8036c5:	00 00 00 
  8036c8:	ff d0                	callq  *%rax
  8036ca:	c9                   	leaveq 
  8036cb:	c3                   	retq   

00000000008036cc <nsipc_connect>:
  8036cc:	55                   	push   %rbp
  8036cd:	48 89 e5             	mov    %rsp,%rbp
  8036d0:	48 83 ec 10          	sub    $0x10,%rsp
  8036d4:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8036d7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8036db:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8036de:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8036e5:	00 00 00 
  8036e8:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8036eb:	89 10                	mov    %edx,(%rax)
  8036ed:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8036f0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8036f4:	48 89 c6             	mov    %rax,%rsi
  8036f7:	48 bf 04 a0 80 00 00 	movabs $0x80a004,%rdi
  8036fe:	00 00 00 
  803701:	48 b8 23 13 80 00 00 	movabs $0x801323,%rax
  803708:	00 00 00 
  80370b:	ff d0                	callq  *%rax
  80370d:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803714:	00 00 00 
  803717:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80371a:	89 50 14             	mov    %edx,0x14(%rax)
  80371d:	bf 05 00 00 00       	mov    $0x5,%edi
  803722:	48 b8 fb 34 80 00 00 	movabs $0x8034fb,%rax
  803729:	00 00 00 
  80372c:	ff d0                	callq  *%rax
  80372e:	c9                   	leaveq 
  80372f:	c3                   	retq   

0000000000803730 <nsipc_listen>:
  803730:	55                   	push   %rbp
  803731:	48 89 e5             	mov    %rsp,%rbp
  803734:	48 83 ec 10          	sub    $0x10,%rsp
  803738:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80373b:	89 75 f8             	mov    %esi,-0x8(%rbp)
  80373e:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803745:	00 00 00 
  803748:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80374b:	89 10                	mov    %edx,(%rax)
  80374d:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803754:	00 00 00 
  803757:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80375a:	89 50 04             	mov    %edx,0x4(%rax)
  80375d:	bf 06 00 00 00       	mov    $0x6,%edi
  803762:	48 b8 fb 34 80 00 00 	movabs $0x8034fb,%rax
  803769:	00 00 00 
  80376c:	ff d0                	callq  *%rax
  80376e:	c9                   	leaveq 
  80376f:	c3                   	retq   

0000000000803770 <nsipc_recv>:
  803770:	55                   	push   %rbp
  803771:	48 89 e5             	mov    %rsp,%rbp
  803774:	48 83 ec 30          	sub    $0x30,%rsp
  803778:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80377b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80377f:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803782:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  803785:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80378c:	00 00 00 
  80378f:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803792:	89 10                	mov    %edx,(%rax)
  803794:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80379b:	00 00 00 
  80379e:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8037a1:	89 50 04             	mov    %edx,0x4(%rax)
  8037a4:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8037ab:	00 00 00 
  8037ae:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8037b1:	89 50 08             	mov    %edx,0x8(%rax)
  8037b4:	bf 07 00 00 00       	mov    $0x7,%edi
  8037b9:	48 b8 fb 34 80 00 00 	movabs $0x8034fb,%rax
  8037c0:	00 00 00 
  8037c3:	ff d0                	callq  *%rax
  8037c5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8037c8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8037cc:	78 69                	js     803837 <nsipc_recv+0xc7>
  8037ce:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  8037d5:	7f 08                	jg     8037df <nsipc_recv+0x6f>
  8037d7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037da:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  8037dd:	7e 35                	jle    803814 <nsipc_recv+0xa4>
  8037df:	48 b9 e9 4b 80 00 00 	movabs $0x804be9,%rcx
  8037e6:	00 00 00 
  8037e9:	48 ba fe 4b 80 00 00 	movabs $0x804bfe,%rdx
  8037f0:	00 00 00 
  8037f3:	be 62 00 00 00       	mov    $0x62,%esi
  8037f8:	48 bf 13 4c 80 00 00 	movabs $0x804c13,%rdi
  8037ff:	00 00 00 
  803802:	b8 00 00 00 00       	mov    $0x0,%eax
  803807:	49 b8 c3 41 80 00 00 	movabs $0x8041c3,%r8
  80380e:	00 00 00 
  803811:	41 ff d0             	callq  *%r8
  803814:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803817:	48 63 d0             	movslq %eax,%rdx
  80381a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80381e:	48 be 00 a0 80 00 00 	movabs $0x80a000,%rsi
  803825:	00 00 00 
  803828:	48 89 c7             	mov    %rax,%rdi
  80382b:	48 b8 23 13 80 00 00 	movabs $0x801323,%rax
  803832:	00 00 00 
  803835:	ff d0                	callq  *%rax
  803837:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80383a:	c9                   	leaveq 
  80383b:	c3                   	retq   

000000000080383c <nsipc_send>:
  80383c:	55                   	push   %rbp
  80383d:	48 89 e5             	mov    %rsp,%rbp
  803840:	48 83 ec 20          	sub    $0x20,%rsp
  803844:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803847:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80384b:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80384e:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  803851:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803858:	00 00 00 
  80385b:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80385e:	89 10                	mov    %edx,(%rax)
  803860:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  803867:	7e 35                	jle    80389e <nsipc_send+0x62>
  803869:	48 b9 22 4c 80 00 00 	movabs $0x804c22,%rcx
  803870:	00 00 00 
  803873:	48 ba fe 4b 80 00 00 	movabs $0x804bfe,%rdx
  80387a:	00 00 00 
  80387d:	be 6d 00 00 00       	mov    $0x6d,%esi
  803882:	48 bf 13 4c 80 00 00 	movabs $0x804c13,%rdi
  803889:	00 00 00 
  80388c:	b8 00 00 00 00       	mov    $0x0,%eax
  803891:	49 b8 c3 41 80 00 00 	movabs $0x8041c3,%r8
  803898:	00 00 00 
  80389b:	41 ff d0             	callq  *%r8
  80389e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8038a1:	48 63 d0             	movslq %eax,%rdx
  8038a4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8038a8:	48 89 c6             	mov    %rax,%rsi
  8038ab:	48 bf 0c a0 80 00 00 	movabs $0x80a00c,%rdi
  8038b2:	00 00 00 
  8038b5:	48 b8 23 13 80 00 00 	movabs $0x801323,%rax
  8038bc:	00 00 00 
  8038bf:	ff d0                	callq  *%rax
  8038c1:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8038c8:	00 00 00 
  8038cb:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8038ce:	89 50 04             	mov    %edx,0x4(%rax)
  8038d1:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8038d8:	00 00 00 
  8038db:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8038de:	89 50 08             	mov    %edx,0x8(%rax)
  8038e1:	bf 08 00 00 00       	mov    $0x8,%edi
  8038e6:	48 b8 fb 34 80 00 00 	movabs $0x8034fb,%rax
  8038ed:	00 00 00 
  8038f0:	ff d0                	callq  *%rax
  8038f2:	c9                   	leaveq 
  8038f3:	c3                   	retq   

00000000008038f4 <nsipc_socket>:
  8038f4:	55                   	push   %rbp
  8038f5:	48 89 e5             	mov    %rsp,%rbp
  8038f8:	48 83 ec 10          	sub    $0x10,%rsp
  8038fc:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8038ff:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803902:	89 55 f4             	mov    %edx,-0xc(%rbp)
  803905:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80390c:	00 00 00 
  80390f:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803912:	89 10                	mov    %edx,(%rax)
  803914:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80391b:	00 00 00 
  80391e:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803921:	89 50 04             	mov    %edx,0x4(%rax)
  803924:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80392b:	00 00 00 
  80392e:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803931:	89 50 08             	mov    %edx,0x8(%rax)
  803934:	bf 09 00 00 00       	mov    $0x9,%edi
  803939:	48 b8 fb 34 80 00 00 	movabs $0x8034fb,%rax
  803940:	00 00 00 
  803943:	ff d0                	callq  *%rax
  803945:	c9                   	leaveq 
  803946:	c3                   	retq   

0000000000803947 <pipe>:
  803947:	55                   	push   %rbp
  803948:	48 89 e5             	mov    %rsp,%rbp
  80394b:	53                   	push   %rbx
  80394c:	48 83 ec 38          	sub    $0x38,%rsp
  803950:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  803954:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  803958:	48 89 c7             	mov    %rax,%rdi
  80395b:	48 b8 5a 1e 80 00 00 	movabs $0x801e5a,%rax
  803962:	00 00 00 
  803965:	ff d0                	callq  *%rax
  803967:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80396a:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80396e:	0f 88 bf 01 00 00    	js     803b33 <pipe+0x1ec>
  803974:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803978:	ba 07 04 00 00       	mov    $0x407,%edx
  80397d:	48 89 c6             	mov    %rax,%rsi
  803980:	bf 00 00 00 00       	mov    $0x0,%edi
  803985:	48 b8 2e 19 80 00 00 	movabs $0x80192e,%rax
  80398c:	00 00 00 
  80398f:	ff d0                	callq  *%rax
  803991:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803994:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803998:	0f 88 95 01 00 00    	js     803b33 <pipe+0x1ec>
  80399e:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  8039a2:	48 89 c7             	mov    %rax,%rdi
  8039a5:	48 b8 5a 1e 80 00 00 	movabs $0x801e5a,%rax
  8039ac:	00 00 00 
  8039af:	ff d0                	callq  *%rax
  8039b1:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8039b4:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8039b8:	0f 88 5d 01 00 00    	js     803b1b <pipe+0x1d4>
  8039be:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8039c2:	ba 07 04 00 00       	mov    $0x407,%edx
  8039c7:	48 89 c6             	mov    %rax,%rsi
  8039ca:	bf 00 00 00 00       	mov    $0x0,%edi
  8039cf:	48 b8 2e 19 80 00 00 	movabs $0x80192e,%rax
  8039d6:	00 00 00 
  8039d9:	ff d0                	callq  *%rax
  8039db:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8039de:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8039e2:	0f 88 33 01 00 00    	js     803b1b <pipe+0x1d4>
  8039e8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8039ec:	48 89 c7             	mov    %rax,%rdi
  8039ef:	48 b8 2f 1e 80 00 00 	movabs $0x801e2f,%rax
  8039f6:	00 00 00 
  8039f9:	ff d0                	callq  *%rax
  8039fb:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8039ff:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803a03:	ba 07 04 00 00       	mov    $0x407,%edx
  803a08:	48 89 c6             	mov    %rax,%rsi
  803a0b:	bf 00 00 00 00       	mov    $0x0,%edi
  803a10:	48 b8 2e 19 80 00 00 	movabs $0x80192e,%rax
  803a17:	00 00 00 
  803a1a:	ff d0                	callq  *%rax
  803a1c:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803a1f:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803a23:	79 05                	jns    803a2a <pipe+0xe3>
  803a25:	e9 d9 00 00 00       	jmpq   803b03 <pipe+0x1bc>
  803a2a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803a2e:	48 89 c7             	mov    %rax,%rdi
  803a31:	48 b8 2f 1e 80 00 00 	movabs $0x801e2f,%rax
  803a38:	00 00 00 
  803a3b:	ff d0                	callq  *%rax
  803a3d:	48 89 c2             	mov    %rax,%rdx
  803a40:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803a44:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  803a4a:	48 89 d1             	mov    %rdx,%rcx
  803a4d:	ba 00 00 00 00       	mov    $0x0,%edx
  803a52:	48 89 c6             	mov    %rax,%rsi
  803a55:	bf 00 00 00 00       	mov    $0x0,%edi
  803a5a:	48 b8 7e 19 80 00 00 	movabs $0x80197e,%rax
  803a61:	00 00 00 
  803a64:	ff d0                	callq  *%rax
  803a66:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803a69:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803a6d:	79 1b                	jns    803a8a <pipe+0x143>
  803a6f:	90                   	nop
  803a70:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803a74:	48 89 c6             	mov    %rax,%rsi
  803a77:	bf 00 00 00 00       	mov    $0x0,%edi
  803a7c:	48 b8 d9 19 80 00 00 	movabs $0x8019d9,%rax
  803a83:	00 00 00 
  803a86:	ff d0                	callq  *%rax
  803a88:	eb 79                	jmp    803b03 <pipe+0x1bc>
  803a8a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803a8e:	48 ba e0 60 80 00 00 	movabs $0x8060e0,%rdx
  803a95:	00 00 00 
  803a98:	8b 12                	mov    (%rdx),%edx
  803a9a:	89 10                	mov    %edx,(%rax)
  803a9c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803aa0:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  803aa7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803aab:	48 ba e0 60 80 00 00 	movabs $0x8060e0,%rdx
  803ab2:	00 00 00 
  803ab5:	8b 12                	mov    (%rdx),%edx
  803ab7:	89 10                	mov    %edx,(%rax)
  803ab9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803abd:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  803ac4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803ac8:	48 89 c7             	mov    %rax,%rdi
  803acb:	48 b8 0c 1e 80 00 00 	movabs $0x801e0c,%rax
  803ad2:	00 00 00 
  803ad5:	ff d0                	callq  *%rax
  803ad7:	89 c2                	mov    %eax,%edx
  803ad9:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803add:	89 10                	mov    %edx,(%rax)
  803adf:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803ae3:	48 8d 58 04          	lea    0x4(%rax),%rbx
  803ae7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803aeb:	48 89 c7             	mov    %rax,%rdi
  803aee:	48 b8 0c 1e 80 00 00 	movabs $0x801e0c,%rax
  803af5:	00 00 00 
  803af8:	ff d0                	callq  *%rax
  803afa:	89 03                	mov    %eax,(%rbx)
  803afc:	b8 00 00 00 00       	mov    $0x0,%eax
  803b01:	eb 33                	jmp    803b36 <pipe+0x1ef>
  803b03:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803b07:	48 89 c6             	mov    %rax,%rsi
  803b0a:	bf 00 00 00 00       	mov    $0x0,%edi
  803b0f:	48 b8 d9 19 80 00 00 	movabs $0x8019d9,%rax
  803b16:	00 00 00 
  803b19:	ff d0                	callq  *%rax
  803b1b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803b1f:	48 89 c6             	mov    %rax,%rsi
  803b22:	bf 00 00 00 00       	mov    $0x0,%edi
  803b27:	48 b8 d9 19 80 00 00 	movabs $0x8019d9,%rax
  803b2e:	00 00 00 
  803b31:	ff d0                	callq  *%rax
  803b33:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803b36:	48 83 c4 38          	add    $0x38,%rsp
  803b3a:	5b                   	pop    %rbx
  803b3b:	5d                   	pop    %rbp
  803b3c:	c3                   	retq   

0000000000803b3d <_pipeisclosed>:
  803b3d:	55                   	push   %rbp
  803b3e:	48 89 e5             	mov    %rsp,%rbp
  803b41:	53                   	push   %rbx
  803b42:	48 83 ec 28          	sub    $0x28,%rsp
  803b46:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803b4a:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803b4e:	48 b8 08 74 80 00 00 	movabs $0x807408,%rax
  803b55:	00 00 00 
  803b58:	48 8b 00             	mov    (%rax),%rax
  803b5b:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  803b61:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803b64:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803b68:	48 89 c7             	mov    %rax,%rdi
  803b6b:	48 b8 a0 44 80 00 00 	movabs $0x8044a0,%rax
  803b72:	00 00 00 
  803b75:	ff d0                	callq  *%rax
  803b77:	89 c3                	mov    %eax,%ebx
  803b79:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803b7d:	48 89 c7             	mov    %rax,%rdi
  803b80:	48 b8 a0 44 80 00 00 	movabs $0x8044a0,%rax
  803b87:	00 00 00 
  803b8a:	ff d0                	callq  *%rax
  803b8c:	39 c3                	cmp    %eax,%ebx
  803b8e:	0f 94 c0             	sete   %al
  803b91:	0f b6 c0             	movzbl %al,%eax
  803b94:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803b97:	48 b8 08 74 80 00 00 	movabs $0x807408,%rax
  803b9e:	00 00 00 
  803ba1:	48 8b 00             	mov    (%rax),%rax
  803ba4:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  803baa:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  803bad:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803bb0:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  803bb3:	75 05                	jne    803bba <_pipeisclosed+0x7d>
  803bb5:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803bb8:	eb 4f                	jmp    803c09 <_pipeisclosed+0xcc>
  803bba:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803bbd:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  803bc0:	74 42                	je     803c04 <_pipeisclosed+0xc7>
  803bc2:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  803bc6:	75 3c                	jne    803c04 <_pipeisclosed+0xc7>
  803bc8:	48 b8 08 74 80 00 00 	movabs $0x807408,%rax
  803bcf:	00 00 00 
  803bd2:	48 8b 00             	mov    (%rax),%rax
  803bd5:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  803bdb:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803bde:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803be1:	89 c6                	mov    %eax,%esi
  803be3:	48 bf 33 4c 80 00 00 	movabs $0x804c33,%rdi
  803bea:	00 00 00 
  803bed:	b8 00 00 00 00       	mov    $0x0,%eax
  803bf2:	49 b8 f0 02 80 00 00 	movabs $0x8002f0,%r8
  803bf9:	00 00 00 
  803bfc:	41 ff d0             	callq  *%r8
  803bff:	e9 4a ff ff ff       	jmpq   803b4e <_pipeisclosed+0x11>
  803c04:	e9 45 ff ff ff       	jmpq   803b4e <_pipeisclosed+0x11>
  803c09:	48 83 c4 28          	add    $0x28,%rsp
  803c0d:	5b                   	pop    %rbx
  803c0e:	5d                   	pop    %rbp
  803c0f:	c3                   	retq   

0000000000803c10 <pipeisclosed>:
  803c10:	55                   	push   %rbp
  803c11:	48 89 e5             	mov    %rsp,%rbp
  803c14:	48 83 ec 30          	sub    $0x30,%rsp
  803c18:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803c1b:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  803c1f:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803c22:	48 89 d6             	mov    %rdx,%rsi
  803c25:	89 c7                	mov    %eax,%edi
  803c27:	48 b8 f2 1e 80 00 00 	movabs $0x801ef2,%rax
  803c2e:	00 00 00 
  803c31:	ff d0                	callq  *%rax
  803c33:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803c36:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803c3a:	79 05                	jns    803c41 <pipeisclosed+0x31>
  803c3c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c3f:	eb 31                	jmp    803c72 <pipeisclosed+0x62>
  803c41:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803c45:	48 89 c7             	mov    %rax,%rdi
  803c48:	48 b8 2f 1e 80 00 00 	movabs $0x801e2f,%rax
  803c4f:	00 00 00 
  803c52:	ff d0                	callq  *%rax
  803c54:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803c58:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803c5c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803c60:	48 89 d6             	mov    %rdx,%rsi
  803c63:	48 89 c7             	mov    %rax,%rdi
  803c66:	48 b8 3d 3b 80 00 00 	movabs $0x803b3d,%rax
  803c6d:	00 00 00 
  803c70:	ff d0                	callq  *%rax
  803c72:	c9                   	leaveq 
  803c73:	c3                   	retq   

0000000000803c74 <devpipe_read>:
  803c74:	55                   	push   %rbp
  803c75:	48 89 e5             	mov    %rsp,%rbp
  803c78:	48 83 ec 40          	sub    $0x40,%rsp
  803c7c:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803c80:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803c84:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803c88:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803c8c:	48 89 c7             	mov    %rax,%rdi
  803c8f:	48 b8 2f 1e 80 00 00 	movabs $0x801e2f,%rax
  803c96:	00 00 00 
  803c99:	ff d0                	callq  *%rax
  803c9b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803c9f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803ca3:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803ca7:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803cae:	00 
  803caf:	e9 92 00 00 00       	jmpq   803d46 <devpipe_read+0xd2>
  803cb4:	eb 41                	jmp    803cf7 <devpipe_read+0x83>
  803cb6:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  803cbb:	74 09                	je     803cc6 <devpipe_read+0x52>
  803cbd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803cc1:	e9 92 00 00 00       	jmpq   803d58 <devpipe_read+0xe4>
  803cc6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803cca:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803cce:	48 89 d6             	mov    %rdx,%rsi
  803cd1:	48 89 c7             	mov    %rax,%rdi
  803cd4:	48 b8 3d 3b 80 00 00 	movabs $0x803b3d,%rax
  803cdb:	00 00 00 
  803cde:	ff d0                	callq  *%rax
  803ce0:	85 c0                	test   %eax,%eax
  803ce2:	74 07                	je     803ceb <devpipe_read+0x77>
  803ce4:	b8 00 00 00 00       	mov    $0x0,%eax
  803ce9:	eb 6d                	jmp    803d58 <devpipe_read+0xe4>
  803ceb:	48 b8 f0 18 80 00 00 	movabs $0x8018f0,%rax
  803cf2:	00 00 00 
  803cf5:	ff d0                	callq  *%rax
  803cf7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803cfb:	8b 10                	mov    (%rax),%edx
  803cfd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803d01:	8b 40 04             	mov    0x4(%rax),%eax
  803d04:	39 c2                	cmp    %eax,%edx
  803d06:	74 ae                	je     803cb6 <devpipe_read+0x42>
  803d08:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803d0c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803d10:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  803d14:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803d18:	8b 00                	mov    (%rax),%eax
  803d1a:	99                   	cltd   
  803d1b:	c1 ea 1b             	shr    $0x1b,%edx
  803d1e:	01 d0                	add    %edx,%eax
  803d20:	83 e0 1f             	and    $0x1f,%eax
  803d23:	29 d0                	sub    %edx,%eax
  803d25:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803d29:	48 98                	cltq   
  803d2b:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  803d30:	88 01                	mov    %al,(%rcx)
  803d32:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803d36:	8b 00                	mov    (%rax),%eax
  803d38:	8d 50 01             	lea    0x1(%rax),%edx
  803d3b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803d3f:	89 10                	mov    %edx,(%rax)
  803d41:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803d46:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803d4a:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803d4e:	0f 82 60 ff ff ff    	jb     803cb4 <devpipe_read+0x40>
  803d54:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803d58:	c9                   	leaveq 
  803d59:	c3                   	retq   

0000000000803d5a <devpipe_write>:
  803d5a:	55                   	push   %rbp
  803d5b:	48 89 e5             	mov    %rsp,%rbp
  803d5e:	48 83 ec 40          	sub    $0x40,%rsp
  803d62:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803d66:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803d6a:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803d6e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803d72:	48 89 c7             	mov    %rax,%rdi
  803d75:	48 b8 2f 1e 80 00 00 	movabs $0x801e2f,%rax
  803d7c:	00 00 00 
  803d7f:	ff d0                	callq  *%rax
  803d81:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803d85:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803d89:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803d8d:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803d94:	00 
  803d95:	e9 8e 00 00 00       	jmpq   803e28 <devpipe_write+0xce>
  803d9a:	eb 31                	jmp    803dcd <devpipe_write+0x73>
  803d9c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803da0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803da4:	48 89 d6             	mov    %rdx,%rsi
  803da7:	48 89 c7             	mov    %rax,%rdi
  803daa:	48 b8 3d 3b 80 00 00 	movabs $0x803b3d,%rax
  803db1:	00 00 00 
  803db4:	ff d0                	callq  *%rax
  803db6:	85 c0                	test   %eax,%eax
  803db8:	74 07                	je     803dc1 <devpipe_write+0x67>
  803dba:	b8 00 00 00 00       	mov    $0x0,%eax
  803dbf:	eb 79                	jmp    803e3a <devpipe_write+0xe0>
  803dc1:	48 b8 f0 18 80 00 00 	movabs $0x8018f0,%rax
  803dc8:	00 00 00 
  803dcb:	ff d0                	callq  *%rax
  803dcd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803dd1:	8b 40 04             	mov    0x4(%rax),%eax
  803dd4:	48 63 d0             	movslq %eax,%rdx
  803dd7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ddb:	8b 00                	mov    (%rax),%eax
  803ddd:	48 98                	cltq   
  803ddf:	48 83 c0 20          	add    $0x20,%rax
  803de3:	48 39 c2             	cmp    %rax,%rdx
  803de6:	73 b4                	jae    803d9c <devpipe_write+0x42>
  803de8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803dec:	8b 40 04             	mov    0x4(%rax),%eax
  803def:	99                   	cltd   
  803df0:	c1 ea 1b             	shr    $0x1b,%edx
  803df3:	01 d0                	add    %edx,%eax
  803df5:	83 e0 1f             	and    $0x1f,%eax
  803df8:	29 d0                	sub    %edx,%eax
  803dfa:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  803dfe:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  803e02:	48 01 ca             	add    %rcx,%rdx
  803e05:	0f b6 0a             	movzbl (%rdx),%ecx
  803e08:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803e0c:	48 98                	cltq   
  803e0e:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  803e12:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e16:	8b 40 04             	mov    0x4(%rax),%eax
  803e19:	8d 50 01             	lea    0x1(%rax),%edx
  803e1c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e20:	89 50 04             	mov    %edx,0x4(%rax)
  803e23:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803e28:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803e2c:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803e30:	0f 82 64 ff ff ff    	jb     803d9a <devpipe_write+0x40>
  803e36:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803e3a:	c9                   	leaveq 
  803e3b:	c3                   	retq   

0000000000803e3c <devpipe_stat>:
  803e3c:	55                   	push   %rbp
  803e3d:	48 89 e5             	mov    %rsp,%rbp
  803e40:	48 83 ec 20          	sub    $0x20,%rsp
  803e44:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803e48:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803e4c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803e50:	48 89 c7             	mov    %rax,%rdi
  803e53:	48 b8 2f 1e 80 00 00 	movabs $0x801e2f,%rax
  803e5a:	00 00 00 
  803e5d:	ff d0                	callq  *%rax
  803e5f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803e63:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803e67:	48 be 46 4c 80 00 00 	movabs $0x804c46,%rsi
  803e6e:	00 00 00 
  803e71:	48 89 c7             	mov    %rax,%rdi
  803e74:	48 b8 ff 0f 80 00 00 	movabs $0x800fff,%rax
  803e7b:	00 00 00 
  803e7e:	ff d0                	callq  *%rax
  803e80:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803e84:	8b 50 04             	mov    0x4(%rax),%edx
  803e87:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803e8b:	8b 00                	mov    (%rax),%eax
  803e8d:	29 c2                	sub    %eax,%edx
  803e8f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803e93:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  803e99:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803e9d:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  803ea4:	00 00 00 
  803ea7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803eab:	48 b9 e0 60 80 00 00 	movabs $0x8060e0,%rcx
  803eb2:	00 00 00 
  803eb5:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  803ebc:	b8 00 00 00 00       	mov    $0x0,%eax
  803ec1:	c9                   	leaveq 
  803ec2:	c3                   	retq   

0000000000803ec3 <devpipe_close>:
  803ec3:	55                   	push   %rbp
  803ec4:	48 89 e5             	mov    %rsp,%rbp
  803ec7:	48 83 ec 10          	sub    $0x10,%rsp
  803ecb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803ecf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803ed3:	48 89 c6             	mov    %rax,%rsi
  803ed6:	bf 00 00 00 00       	mov    $0x0,%edi
  803edb:	48 b8 d9 19 80 00 00 	movabs $0x8019d9,%rax
  803ee2:	00 00 00 
  803ee5:	ff d0                	callq  *%rax
  803ee7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803eeb:	48 89 c7             	mov    %rax,%rdi
  803eee:	48 b8 2f 1e 80 00 00 	movabs $0x801e2f,%rax
  803ef5:	00 00 00 
  803ef8:	ff d0                	callq  *%rax
  803efa:	48 89 c6             	mov    %rax,%rsi
  803efd:	bf 00 00 00 00       	mov    $0x0,%edi
  803f02:	48 b8 d9 19 80 00 00 	movabs $0x8019d9,%rax
  803f09:	00 00 00 
  803f0c:	ff d0                	callq  *%rax
  803f0e:	c9                   	leaveq 
  803f0f:	c3                   	retq   

0000000000803f10 <cputchar>:
  803f10:	55                   	push   %rbp
  803f11:	48 89 e5             	mov    %rsp,%rbp
  803f14:	48 83 ec 20          	sub    $0x20,%rsp
  803f18:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803f1b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803f1e:	88 45 ff             	mov    %al,-0x1(%rbp)
  803f21:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  803f25:	be 01 00 00 00       	mov    $0x1,%esi
  803f2a:	48 89 c7             	mov    %rax,%rdi
  803f2d:	48 b8 e6 17 80 00 00 	movabs $0x8017e6,%rax
  803f34:	00 00 00 
  803f37:	ff d0                	callq  *%rax
  803f39:	c9                   	leaveq 
  803f3a:	c3                   	retq   

0000000000803f3b <getchar>:
  803f3b:	55                   	push   %rbp
  803f3c:	48 89 e5             	mov    %rsp,%rbp
  803f3f:	48 83 ec 10          	sub    $0x10,%rsp
  803f43:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  803f47:	ba 01 00 00 00       	mov    $0x1,%edx
  803f4c:	48 89 c6             	mov    %rax,%rsi
  803f4f:	bf 00 00 00 00       	mov    $0x0,%edi
  803f54:	48 b8 24 23 80 00 00 	movabs $0x802324,%rax
  803f5b:	00 00 00 
  803f5e:	ff d0                	callq  *%rax
  803f60:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803f63:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803f67:	79 05                	jns    803f6e <getchar+0x33>
  803f69:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f6c:	eb 14                	jmp    803f82 <getchar+0x47>
  803f6e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803f72:	7f 07                	jg     803f7b <getchar+0x40>
  803f74:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  803f79:	eb 07                	jmp    803f82 <getchar+0x47>
  803f7b:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  803f7f:	0f b6 c0             	movzbl %al,%eax
  803f82:	c9                   	leaveq 
  803f83:	c3                   	retq   

0000000000803f84 <iscons>:
  803f84:	55                   	push   %rbp
  803f85:	48 89 e5             	mov    %rsp,%rbp
  803f88:	48 83 ec 20          	sub    $0x20,%rsp
  803f8c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803f8f:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803f93:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803f96:	48 89 d6             	mov    %rdx,%rsi
  803f99:	89 c7                	mov    %eax,%edi
  803f9b:	48 b8 f2 1e 80 00 00 	movabs $0x801ef2,%rax
  803fa2:	00 00 00 
  803fa5:	ff d0                	callq  *%rax
  803fa7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803faa:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803fae:	79 05                	jns    803fb5 <iscons+0x31>
  803fb0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803fb3:	eb 1a                	jmp    803fcf <iscons+0x4b>
  803fb5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803fb9:	8b 10                	mov    (%rax),%edx
  803fbb:	48 b8 20 61 80 00 00 	movabs $0x806120,%rax
  803fc2:	00 00 00 
  803fc5:	8b 00                	mov    (%rax),%eax
  803fc7:	39 c2                	cmp    %eax,%edx
  803fc9:	0f 94 c0             	sete   %al
  803fcc:	0f b6 c0             	movzbl %al,%eax
  803fcf:	c9                   	leaveq 
  803fd0:	c3                   	retq   

0000000000803fd1 <opencons>:
  803fd1:	55                   	push   %rbp
  803fd2:	48 89 e5             	mov    %rsp,%rbp
  803fd5:	48 83 ec 10          	sub    $0x10,%rsp
  803fd9:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803fdd:	48 89 c7             	mov    %rax,%rdi
  803fe0:	48 b8 5a 1e 80 00 00 	movabs $0x801e5a,%rax
  803fe7:	00 00 00 
  803fea:	ff d0                	callq  *%rax
  803fec:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803fef:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803ff3:	79 05                	jns    803ffa <opencons+0x29>
  803ff5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ff8:	eb 5b                	jmp    804055 <opencons+0x84>
  803ffa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ffe:	ba 07 04 00 00       	mov    $0x407,%edx
  804003:	48 89 c6             	mov    %rax,%rsi
  804006:	bf 00 00 00 00       	mov    $0x0,%edi
  80400b:	48 b8 2e 19 80 00 00 	movabs $0x80192e,%rax
  804012:	00 00 00 
  804015:	ff d0                	callq  *%rax
  804017:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80401a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80401e:	79 05                	jns    804025 <opencons+0x54>
  804020:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804023:	eb 30                	jmp    804055 <opencons+0x84>
  804025:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804029:	48 ba 20 61 80 00 00 	movabs $0x806120,%rdx
  804030:	00 00 00 
  804033:	8b 12                	mov    (%rdx),%edx
  804035:	89 10                	mov    %edx,(%rax)
  804037:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80403b:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  804042:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804046:	48 89 c7             	mov    %rax,%rdi
  804049:	48 b8 0c 1e 80 00 00 	movabs $0x801e0c,%rax
  804050:	00 00 00 
  804053:	ff d0                	callq  *%rax
  804055:	c9                   	leaveq 
  804056:	c3                   	retq   

0000000000804057 <devcons_read>:
  804057:	55                   	push   %rbp
  804058:	48 89 e5             	mov    %rsp,%rbp
  80405b:	48 83 ec 30          	sub    $0x30,%rsp
  80405f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804063:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804067:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80406b:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804070:	75 07                	jne    804079 <devcons_read+0x22>
  804072:	b8 00 00 00 00       	mov    $0x0,%eax
  804077:	eb 4b                	jmp    8040c4 <devcons_read+0x6d>
  804079:	eb 0c                	jmp    804087 <devcons_read+0x30>
  80407b:	48 b8 f0 18 80 00 00 	movabs $0x8018f0,%rax
  804082:	00 00 00 
  804085:	ff d0                	callq  *%rax
  804087:	48 b8 30 18 80 00 00 	movabs $0x801830,%rax
  80408e:	00 00 00 
  804091:	ff d0                	callq  *%rax
  804093:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804096:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80409a:	74 df                	je     80407b <devcons_read+0x24>
  80409c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8040a0:	79 05                	jns    8040a7 <devcons_read+0x50>
  8040a2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8040a5:	eb 1d                	jmp    8040c4 <devcons_read+0x6d>
  8040a7:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  8040ab:	75 07                	jne    8040b4 <devcons_read+0x5d>
  8040ad:	b8 00 00 00 00       	mov    $0x0,%eax
  8040b2:	eb 10                	jmp    8040c4 <devcons_read+0x6d>
  8040b4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8040b7:	89 c2                	mov    %eax,%edx
  8040b9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8040bd:	88 10                	mov    %dl,(%rax)
  8040bf:	b8 01 00 00 00       	mov    $0x1,%eax
  8040c4:	c9                   	leaveq 
  8040c5:	c3                   	retq   

00000000008040c6 <devcons_write>:
  8040c6:	55                   	push   %rbp
  8040c7:	48 89 e5             	mov    %rsp,%rbp
  8040ca:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  8040d1:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  8040d8:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  8040df:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  8040e6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8040ed:	eb 76                	jmp    804165 <devcons_write+0x9f>
  8040ef:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  8040f6:	89 c2                	mov    %eax,%edx
  8040f8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8040fb:	29 c2                	sub    %eax,%edx
  8040fd:	89 d0                	mov    %edx,%eax
  8040ff:	89 45 f8             	mov    %eax,-0x8(%rbp)
  804102:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804105:	83 f8 7f             	cmp    $0x7f,%eax
  804108:	76 07                	jbe    804111 <devcons_write+0x4b>
  80410a:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  804111:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804114:	48 63 d0             	movslq %eax,%rdx
  804117:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80411a:	48 63 c8             	movslq %eax,%rcx
  80411d:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  804124:	48 01 c1             	add    %rax,%rcx
  804127:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  80412e:	48 89 ce             	mov    %rcx,%rsi
  804131:	48 89 c7             	mov    %rax,%rdi
  804134:	48 b8 23 13 80 00 00 	movabs $0x801323,%rax
  80413b:	00 00 00 
  80413e:	ff d0                	callq  *%rax
  804140:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804143:	48 63 d0             	movslq %eax,%rdx
  804146:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  80414d:	48 89 d6             	mov    %rdx,%rsi
  804150:	48 89 c7             	mov    %rax,%rdi
  804153:	48 b8 e6 17 80 00 00 	movabs $0x8017e6,%rax
  80415a:	00 00 00 
  80415d:	ff d0                	callq  *%rax
  80415f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804162:	01 45 fc             	add    %eax,-0x4(%rbp)
  804165:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804168:	48 98                	cltq   
  80416a:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  804171:	0f 82 78 ff ff ff    	jb     8040ef <devcons_write+0x29>
  804177:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80417a:	c9                   	leaveq 
  80417b:	c3                   	retq   

000000000080417c <devcons_close>:
  80417c:	55                   	push   %rbp
  80417d:	48 89 e5             	mov    %rsp,%rbp
  804180:	48 83 ec 08          	sub    $0x8,%rsp
  804184:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804188:	b8 00 00 00 00       	mov    $0x0,%eax
  80418d:	c9                   	leaveq 
  80418e:	c3                   	retq   

000000000080418f <devcons_stat>:
  80418f:	55                   	push   %rbp
  804190:	48 89 e5             	mov    %rsp,%rbp
  804193:	48 83 ec 10          	sub    $0x10,%rsp
  804197:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80419b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80419f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8041a3:	48 be 52 4c 80 00 00 	movabs $0x804c52,%rsi
  8041aa:	00 00 00 
  8041ad:	48 89 c7             	mov    %rax,%rdi
  8041b0:	48 b8 ff 0f 80 00 00 	movabs $0x800fff,%rax
  8041b7:	00 00 00 
  8041ba:	ff d0                	callq  *%rax
  8041bc:	b8 00 00 00 00       	mov    $0x0,%eax
  8041c1:	c9                   	leaveq 
  8041c2:	c3                   	retq   

00000000008041c3 <_panic>:
  8041c3:	55                   	push   %rbp
  8041c4:	48 89 e5             	mov    %rsp,%rbp
  8041c7:	53                   	push   %rbx
  8041c8:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  8041cf:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  8041d6:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  8041dc:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  8041e3:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  8041ea:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  8041f1:	84 c0                	test   %al,%al
  8041f3:	74 23                	je     804218 <_panic+0x55>
  8041f5:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  8041fc:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  804200:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  804204:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  804208:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  80420c:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  804210:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  804214:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  804218:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  80421f:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  804226:	00 00 00 
  804229:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  804230:	00 00 00 
  804233:	48 8d 45 10          	lea    0x10(%rbp),%rax
  804237:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  80423e:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  804245:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  80424c:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  804253:	00 00 00 
  804256:	48 8b 18             	mov    (%rax),%rbx
  804259:	48 b8 b2 18 80 00 00 	movabs $0x8018b2,%rax
  804260:	00 00 00 
  804263:	ff d0                	callq  *%rax
  804265:	8b 8d 14 ff ff ff    	mov    -0xec(%rbp),%ecx
  80426b:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  804272:	41 89 c8             	mov    %ecx,%r8d
  804275:	48 89 d1             	mov    %rdx,%rcx
  804278:	48 89 da             	mov    %rbx,%rdx
  80427b:	89 c6                	mov    %eax,%esi
  80427d:	48 bf 60 4c 80 00 00 	movabs $0x804c60,%rdi
  804284:	00 00 00 
  804287:	b8 00 00 00 00       	mov    $0x0,%eax
  80428c:	49 b9 f0 02 80 00 00 	movabs $0x8002f0,%r9
  804293:	00 00 00 
  804296:	41 ff d1             	callq  *%r9
  804299:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  8042a0:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8042a7:	48 89 d6             	mov    %rdx,%rsi
  8042aa:	48 89 c7             	mov    %rax,%rdi
  8042ad:	48 b8 44 02 80 00 00 	movabs $0x800244,%rax
  8042b4:	00 00 00 
  8042b7:	ff d0                	callq  *%rax
  8042b9:	48 bf 83 4c 80 00 00 	movabs $0x804c83,%rdi
  8042c0:	00 00 00 
  8042c3:	b8 00 00 00 00       	mov    $0x0,%eax
  8042c8:	48 ba f0 02 80 00 00 	movabs $0x8002f0,%rdx
  8042cf:	00 00 00 
  8042d2:	ff d2                	callq  *%rdx
  8042d4:	cc                   	int3   
  8042d5:	eb fd                	jmp    8042d4 <_panic+0x111>

00000000008042d7 <ipc_recv>:
  8042d7:	55                   	push   %rbp
  8042d8:	48 89 e5             	mov    %rsp,%rbp
  8042db:	48 83 ec 30          	sub    $0x30,%rsp
  8042df:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8042e3:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8042e7:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8042eb:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8042f0:	75 0e                	jne    804300 <ipc_recv+0x29>
  8042f2:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8042f9:	00 00 00 
  8042fc:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804300:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804304:	48 89 c7             	mov    %rax,%rdi
  804307:	48 b8 57 1b 80 00 00 	movabs $0x801b57,%rax
  80430e:	00 00 00 
  804311:	ff d0                	callq  *%rax
  804313:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804316:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80431a:	79 27                	jns    804343 <ipc_recv+0x6c>
  80431c:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  804321:	74 0a                	je     80432d <ipc_recv+0x56>
  804323:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804327:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  80432d:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804332:	74 0a                	je     80433e <ipc_recv+0x67>
  804334:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804338:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  80433e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804341:	eb 53                	jmp    804396 <ipc_recv+0xbf>
  804343:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  804348:	74 19                	je     804363 <ipc_recv+0x8c>
  80434a:	48 b8 08 74 80 00 00 	movabs $0x807408,%rax
  804351:	00 00 00 
  804354:	48 8b 00             	mov    (%rax),%rax
  804357:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  80435d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804361:	89 10                	mov    %edx,(%rax)
  804363:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804368:	74 19                	je     804383 <ipc_recv+0xac>
  80436a:	48 b8 08 74 80 00 00 	movabs $0x807408,%rax
  804371:	00 00 00 
  804374:	48 8b 00             	mov    (%rax),%rax
  804377:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  80437d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804381:	89 10                	mov    %edx,(%rax)
  804383:	48 b8 08 74 80 00 00 	movabs $0x807408,%rax
  80438a:	00 00 00 
  80438d:	48 8b 00             	mov    (%rax),%rax
  804390:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  804396:	c9                   	leaveq 
  804397:	c3                   	retq   

0000000000804398 <ipc_send>:
  804398:	55                   	push   %rbp
  804399:	48 89 e5             	mov    %rsp,%rbp
  80439c:	48 83 ec 30          	sub    $0x30,%rsp
  8043a0:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8043a3:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8043a6:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  8043aa:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  8043ad:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8043b2:	75 10                	jne    8043c4 <ipc_send+0x2c>
  8043b4:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8043bb:	00 00 00 
  8043be:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8043c2:	eb 0e                	jmp    8043d2 <ipc_send+0x3a>
  8043c4:	eb 0c                	jmp    8043d2 <ipc_send+0x3a>
  8043c6:	48 b8 f0 18 80 00 00 	movabs $0x8018f0,%rax
  8043cd:	00 00 00 
  8043d0:	ff d0                	callq  *%rax
  8043d2:	8b 75 e8             	mov    -0x18(%rbp),%esi
  8043d5:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  8043d8:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8043dc:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8043df:	89 c7                	mov    %eax,%edi
  8043e1:	48 b8 02 1b 80 00 00 	movabs $0x801b02,%rax
  8043e8:	00 00 00 
  8043eb:	ff d0                	callq  *%rax
  8043ed:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8043f0:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  8043f4:	74 d0                	je     8043c6 <ipc_send+0x2e>
  8043f6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8043fa:	79 30                	jns    80442c <ipc_send+0x94>
  8043fc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8043ff:	89 c1                	mov    %eax,%ecx
  804401:	48 ba 85 4c 80 00 00 	movabs $0x804c85,%rdx
  804408:	00 00 00 
  80440b:	be 44 00 00 00       	mov    $0x44,%esi
  804410:	48 bf 9b 4c 80 00 00 	movabs $0x804c9b,%rdi
  804417:	00 00 00 
  80441a:	b8 00 00 00 00       	mov    $0x0,%eax
  80441f:	49 b8 c3 41 80 00 00 	movabs $0x8041c3,%r8
  804426:	00 00 00 
  804429:	41 ff d0             	callq  *%r8
  80442c:	c9                   	leaveq 
  80442d:	c3                   	retq   

000000000080442e <ipc_find_env>:
  80442e:	55                   	push   %rbp
  80442f:	48 89 e5             	mov    %rsp,%rbp
  804432:	48 83 ec 14          	sub    $0x14,%rsp
  804436:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804439:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804440:	eb 4e                	jmp    804490 <ipc_find_env+0x62>
  804442:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804449:	00 00 00 
  80444c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80444f:	48 98                	cltq   
  804451:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804458:	48 01 d0             	add    %rdx,%rax
  80445b:	48 05 d0 00 00 00    	add    $0xd0,%rax
  804461:	8b 00                	mov    (%rax),%eax
  804463:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  804466:	75 24                	jne    80448c <ipc_find_env+0x5e>
  804468:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  80446f:	00 00 00 
  804472:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804475:	48 98                	cltq   
  804477:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  80447e:	48 01 d0             	add    %rdx,%rax
  804481:	48 05 c0 00 00 00    	add    $0xc0,%rax
  804487:	8b 40 08             	mov    0x8(%rax),%eax
  80448a:	eb 12                	jmp    80449e <ipc_find_env+0x70>
  80448c:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  804490:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  804497:	7e a9                	jle    804442 <ipc_find_env+0x14>
  804499:	b8 00 00 00 00       	mov    $0x0,%eax
  80449e:	c9                   	leaveq 
  80449f:	c3                   	retq   

00000000008044a0 <pageref>:
  8044a0:	55                   	push   %rbp
  8044a1:	48 89 e5             	mov    %rsp,%rbp
  8044a4:	48 83 ec 18          	sub    $0x18,%rsp
  8044a8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8044ac:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8044b0:	48 c1 e8 15          	shr    $0x15,%rax
  8044b4:	48 89 c2             	mov    %rax,%rdx
  8044b7:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8044be:	01 00 00 
  8044c1:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8044c5:	83 e0 01             	and    $0x1,%eax
  8044c8:	48 85 c0             	test   %rax,%rax
  8044cb:	75 07                	jne    8044d4 <pageref+0x34>
  8044cd:	b8 00 00 00 00       	mov    $0x0,%eax
  8044d2:	eb 53                	jmp    804527 <pageref+0x87>
  8044d4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8044d8:	48 c1 e8 0c          	shr    $0xc,%rax
  8044dc:	48 89 c2             	mov    %rax,%rdx
  8044df:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8044e6:	01 00 00 
  8044e9:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8044ed:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8044f1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8044f5:	83 e0 01             	and    $0x1,%eax
  8044f8:	48 85 c0             	test   %rax,%rax
  8044fb:	75 07                	jne    804504 <pageref+0x64>
  8044fd:	b8 00 00 00 00       	mov    $0x0,%eax
  804502:	eb 23                	jmp    804527 <pageref+0x87>
  804504:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804508:	48 c1 e8 0c          	shr    $0xc,%rax
  80450c:	48 89 c2             	mov    %rax,%rdx
  80450f:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  804516:	00 00 00 
  804519:	48 c1 e2 04          	shl    $0x4,%rdx
  80451d:	48 01 d0             	add    %rdx,%rax
  804520:	0f b7 40 08          	movzwl 0x8(%rax),%eax
  804524:	0f b7 c0             	movzwl %ax,%eax
  804527:	c9                   	leaveq 
  804528:	c3                   	retq   
