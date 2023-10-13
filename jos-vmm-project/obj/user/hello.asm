
obj/user/hello:     file format elf64-x86-64


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
  80003c:	e8 5e 00 00 00       	callq  80009f <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <umain>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 10          	sub    $0x10,%rsp
  80004b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80004e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800052:	48 bf 60 40 80 00 00 	movabs $0x804060,%rdi
  800059:	00 00 00 
  80005c:	b8 00 00 00 00       	mov    $0x0,%eax
  800061:	48 ba 6a 02 80 00 00 	movabs $0x80026a,%rdx
  800068:	00 00 00 
  80006b:	ff d2                	callq  *%rdx
  80006d:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  800074:	00 00 00 
  800077:	48 8b 00             	mov    (%rax),%rax
  80007a:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  800080:	89 c6                	mov    %eax,%esi
  800082:	48 bf 6e 40 80 00 00 	movabs $0x80406e,%rdi
  800089:	00 00 00 
  80008c:	b8 00 00 00 00       	mov    $0x0,%eax
  800091:	48 ba 6a 02 80 00 00 	movabs $0x80026a,%rdx
  800098:	00 00 00 
  80009b:	ff d2                	callq  *%rdx
  80009d:	c9                   	leaveq 
  80009e:	c3                   	retq   

000000000080009f <libmain>:
  80009f:	55                   	push   %rbp
  8000a0:	48 89 e5             	mov    %rsp,%rbp
  8000a3:	48 83 ec 10          	sub    $0x10,%rsp
  8000a7:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8000aa:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8000ae:	48 b8 d2 16 80 00 00 	movabs $0x8016d2,%rax
  8000b5:	00 00 00 
  8000b8:	ff d0                	callq  *%rax
  8000ba:	25 ff 03 00 00       	and    $0x3ff,%eax
  8000bf:	48 98                	cltq   
  8000c1:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8000c8:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8000cf:	00 00 00 
  8000d2:	48 01 c2             	add    %rax,%rdx
  8000d5:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8000dc:	00 00 00 
  8000df:	48 89 10             	mov    %rdx,(%rax)
  8000e2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8000e6:	7e 14                	jle    8000fc <libmain+0x5d>
  8000e8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8000ec:	48 8b 10             	mov    (%rax),%rdx
  8000ef:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  8000f6:	00 00 00 
  8000f9:	48 89 10             	mov    %rdx,(%rax)
  8000fc:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800100:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800103:	48 89 d6             	mov    %rdx,%rsi
  800106:	89 c7                	mov    %eax,%edi
  800108:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  80010f:	00 00 00 
  800112:	ff d0                	callq  *%rax
  800114:	48 b8 22 01 80 00 00 	movabs $0x800122,%rax
  80011b:	00 00 00 
  80011e:	ff d0                	callq  *%rax
  800120:	c9                   	leaveq 
  800121:	c3                   	retq   

0000000000800122 <exit>:
  800122:	55                   	push   %rbp
  800123:	48 89 e5             	mov    %rsp,%rbp
  800126:	48 b8 6d 1f 80 00 00 	movabs $0x801f6d,%rax
  80012d:	00 00 00 
  800130:	ff d0                	callq  *%rax
  800132:	bf 00 00 00 00       	mov    $0x0,%edi
  800137:	48 b8 8e 16 80 00 00 	movabs $0x80168e,%rax
  80013e:	00 00 00 
  800141:	ff d0                	callq  *%rax
  800143:	5d                   	pop    %rbp
  800144:	c3                   	retq   

0000000000800145 <putch>:
  800145:	55                   	push   %rbp
  800146:	48 89 e5             	mov    %rsp,%rbp
  800149:	48 83 ec 10          	sub    $0x10,%rsp
  80014d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800150:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800154:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800158:	8b 00                	mov    (%rax),%eax
  80015a:	8d 48 01             	lea    0x1(%rax),%ecx
  80015d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800161:	89 0a                	mov    %ecx,(%rdx)
  800163:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800166:	89 d1                	mov    %edx,%ecx
  800168:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80016c:	48 98                	cltq   
  80016e:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  800172:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800176:	8b 00                	mov    (%rax),%eax
  800178:	3d ff 00 00 00       	cmp    $0xff,%eax
  80017d:	75 2c                	jne    8001ab <putch+0x66>
  80017f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800183:	8b 00                	mov    (%rax),%eax
  800185:	48 98                	cltq   
  800187:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80018b:	48 83 c2 08          	add    $0x8,%rdx
  80018f:	48 89 c6             	mov    %rax,%rsi
  800192:	48 89 d7             	mov    %rdx,%rdi
  800195:	48 b8 06 16 80 00 00 	movabs $0x801606,%rax
  80019c:	00 00 00 
  80019f:	ff d0                	callq  *%rax
  8001a1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8001a5:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8001ab:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8001af:	8b 40 04             	mov    0x4(%rax),%eax
  8001b2:	8d 50 01             	lea    0x1(%rax),%edx
  8001b5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8001b9:	89 50 04             	mov    %edx,0x4(%rax)
  8001bc:	c9                   	leaveq 
  8001bd:	c3                   	retq   

00000000008001be <vcprintf>:
  8001be:	55                   	push   %rbp
  8001bf:	48 89 e5             	mov    %rsp,%rbp
  8001c2:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  8001c9:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  8001d0:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  8001d7:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  8001de:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  8001e5:	48 8b 0a             	mov    (%rdx),%rcx
  8001e8:	48 89 08             	mov    %rcx,(%rax)
  8001eb:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8001ef:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8001f3:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8001f7:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8001fb:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  800202:	00 00 00 
  800205:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  80020c:	00 00 00 
  80020f:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  800216:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  80021d:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800224:	48 89 c6             	mov    %rax,%rsi
  800227:	48 bf 45 01 80 00 00 	movabs $0x800145,%rdi
  80022e:	00 00 00 
  800231:	48 b8 1d 06 80 00 00 	movabs $0x80061d,%rax
  800238:	00 00 00 
  80023b:	ff d0                	callq  *%rax
  80023d:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  800243:	48 98                	cltq   
  800245:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  80024c:	48 83 c2 08          	add    $0x8,%rdx
  800250:	48 89 c6             	mov    %rax,%rsi
  800253:	48 89 d7             	mov    %rdx,%rdi
  800256:	48 b8 06 16 80 00 00 	movabs $0x801606,%rax
  80025d:	00 00 00 
  800260:	ff d0                	callq  *%rax
  800262:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  800268:	c9                   	leaveq 
  800269:	c3                   	retq   

000000000080026a <cprintf>:
  80026a:	55                   	push   %rbp
  80026b:	48 89 e5             	mov    %rsp,%rbp
  80026e:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  800275:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  80027c:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  800283:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  80028a:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800291:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800298:	84 c0                	test   %al,%al
  80029a:	74 20                	je     8002bc <cprintf+0x52>
  80029c:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8002a0:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8002a4:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8002a8:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8002ac:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8002b0:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8002b4:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8002b8:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8002bc:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  8002c3:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  8002ca:	00 00 00 
  8002cd:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8002d4:	00 00 00 
  8002d7:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8002db:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8002e2:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8002e9:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8002f0:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  8002f7:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8002fe:	48 8b 0a             	mov    (%rdx),%rcx
  800301:	48 89 08             	mov    %rcx,(%rax)
  800304:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800308:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80030c:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800310:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800314:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  80031b:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800322:	48 89 d6             	mov    %rdx,%rsi
  800325:	48 89 c7             	mov    %rax,%rdi
  800328:	48 b8 be 01 80 00 00 	movabs $0x8001be,%rax
  80032f:	00 00 00 
  800332:	ff d0                	callq  *%rax
  800334:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  80033a:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  800340:	c9                   	leaveq 
  800341:	c3                   	retq   

0000000000800342 <printnum>:
  800342:	55                   	push   %rbp
  800343:	48 89 e5             	mov    %rsp,%rbp
  800346:	53                   	push   %rbx
  800347:	48 83 ec 38          	sub    $0x38,%rsp
  80034b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80034f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800353:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  800357:	89 4d d4             	mov    %ecx,-0x2c(%rbp)
  80035a:	44 89 45 d0          	mov    %r8d,-0x30(%rbp)
  80035e:	44 89 4d cc          	mov    %r9d,-0x34(%rbp)
  800362:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  800365:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  800369:	77 3b                	ja     8003a6 <printnum+0x64>
  80036b:	8b 45 d0             	mov    -0x30(%rbp),%eax
  80036e:	44 8d 40 ff          	lea    -0x1(%rax),%r8d
  800372:	8b 5d d4             	mov    -0x2c(%rbp),%ebx
  800375:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800379:	ba 00 00 00 00       	mov    $0x0,%edx
  80037e:	48 f7 f3             	div    %rbx
  800381:	48 89 c2             	mov    %rax,%rdx
  800384:	8b 7d cc             	mov    -0x34(%rbp),%edi
  800387:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  80038a:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
  80038e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800392:	41 89 f9             	mov    %edi,%r9d
  800395:	48 89 c7             	mov    %rax,%rdi
  800398:	48 b8 42 03 80 00 00 	movabs $0x800342,%rax
  80039f:	00 00 00 
  8003a2:	ff d0                	callq  *%rax
  8003a4:	eb 1e                	jmp    8003c4 <printnum+0x82>
  8003a6:	eb 12                	jmp    8003ba <printnum+0x78>
  8003a8:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8003ac:	8b 55 cc             	mov    -0x34(%rbp),%edx
  8003af:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8003b3:	48 89 ce             	mov    %rcx,%rsi
  8003b6:	89 d7                	mov    %edx,%edi
  8003b8:	ff d0                	callq  *%rax
  8003ba:	83 6d d0 01          	subl   $0x1,-0x30(%rbp)
  8003be:	83 7d d0 00          	cmpl   $0x0,-0x30(%rbp)
  8003c2:	7f e4                	jg     8003a8 <printnum+0x66>
  8003c4:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  8003c7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8003cb:	ba 00 00 00 00       	mov    $0x0,%edx
  8003d0:	48 f7 f1             	div    %rcx
  8003d3:	48 89 d0             	mov    %rdx,%rax
  8003d6:	48 ba 90 42 80 00 00 	movabs $0x804290,%rdx
  8003dd:	00 00 00 
  8003e0:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
  8003e4:	0f be d0             	movsbl %al,%edx
  8003e7:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8003eb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8003ef:	48 89 ce             	mov    %rcx,%rsi
  8003f2:	89 d7                	mov    %edx,%edi
  8003f4:	ff d0                	callq  *%rax
  8003f6:	48 83 c4 38          	add    $0x38,%rsp
  8003fa:	5b                   	pop    %rbx
  8003fb:	5d                   	pop    %rbp
  8003fc:	c3                   	retq   

00000000008003fd <getuint>:
  8003fd:	55                   	push   %rbp
  8003fe:	48 89 e5             	mov    %rsp,%rbp
  800401:	48 83 ec 1c          	sub    $0x1c,%rsp
  800405:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800409:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80040c:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800410:	7e 52                	jle    800464 <getuint+0x67>
  800412:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800416:	8b 00                	mov    (%rax),%eax
  800418:	83 f8 30             	cmp    $0x30,%eax
  80041b:	73 24                	jae    800441 <getuint+0x44>
  80041d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800421:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800425:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800429:	8b 00                	mov    (%rax),%eax
  80042b:	89 c0                	mov    %eax,%eax
  80042d:	48 01 d0             	add    %rdx,%rax
  800430:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800434:	8b 12                	mov    (%rdx),%edx
  800436:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800439:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80043d:	89 0a                	mov    %ecx,(%rdx)
  80043f:	eb 17                	jmp    800458 <getuint+0x5b>
  800441:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800445:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800449:	48 89 d0             	mov    %rdx,%rax
  80044c:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800450:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800454:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800458:	48 8b 00             	mov    (%rax),%rax
  80045b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80045f:	e9 a3 00 00 00       	jmpq   800507 <getuint+0x10a>
  800464:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800468:	74 4f                	je     8004b9 <getuint+0xbc>
  80046a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80046e:	8b 00                	mov    (%rax),%eax
  800470:	83 f8 30             	cmp    $0x30,%eax
  800473:	73 24                	jae    800499 <getuint+0x9c>
  800475:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800479:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80047d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800481:	8b 00                	mov    (%rax),%eax
  800483:	89 c0                	mov    %eax,%eax
  800485:	48 01 d0             	add    %rdx,%rax
  800488:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80048c:	8b 12                	mov    (%rdx),%edx
  80048e:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800491:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800495:	89 0a                	mov    %ecx,(%rdx)
  800497:	eb 17                	jmp    8004b0 <getuint+0xb3>
  800499:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80049d:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8004a1:	48 89 d0             	mov    %rdx,%rax
  8004a4:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8004a8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8004ac:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8004b0:	48 8b 00             	mov    (%rax),%rax
  8004b3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8004b7:	eb 4e                	jmp    800507 <getuint+0x10a>
  8004b9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8004bd:	8b 00                	mov    (%rax),%eax
  8004bf:	83 f8 30             	cmp    $0x30,%eax
  8004c2:	73 24                	jae    8004e8 <getuint+0xeb>
  8004c4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8004c8:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8004cc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8004d0:	8b 00                	mov    (%rax),%eax
  8004d2:	89 c0                	mov    %eax,%eax
  8004d4:	48 01 d0             	add    %rdx,%rax
  8004d7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8004db:	8b 12                	mov    (%rdx),%edx
  8004dd:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8004e0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8004e4:	89 0a                	mov    %ecx,(%rdx)
  8004e6:	eb 17                	jmp    8004ff <getuint+0x102>
  8004e8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8004ec:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8004f0:	48 89 d0             	mov    %rdx,%rax
  8004f3:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8004f7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8004fb:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8004ff:	8b 00                	mov    (%rax),%eax
  800501:	89 c0                	mov    %eax,%eax
  800503:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800507:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80050b:	c9                   	leaveq 
  80050c:	c3                   	retq   

000000000080050d <getint>:
  80050d:	55                   	push   %rbp
  80050e:	48 89 e5             	mov    %rsp,%rbp
  800511:	48 83 ec 1c          	sub    $0x1c,%rsp
  800515:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800519:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80051c:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800520:	7e 52                	jle    800574 <getint+0x67>
  800522:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800526:	8b 00                	mov    (%rax),%eax
  800528:	83 f8 30             	cmp    $0x30,%eax
  80052b:	73 24                	jae    800551 <getint+0x44>
  80052d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800531:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800535:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800539:	8b 00                	mov    (%rax),%eax
  80053b:	89 c0                	mov    %eax,%eax
  80053d:	48 01 d0             	add    %rdx,%rax
  800540:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800544:	8b 12                	mov    (%rdx),%edx
  800546:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800549:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80054d:	89 0a                	mov    %ecx,(%rdx)
  80054f:	eb 17                	jmp    800568 <getint+0x5b>
  800551:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800555:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800559:	48 89 d0             	mov    %rdx,%rax
  80055c:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800560:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800564:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800568:	48 8b 00             	mov    (%rax),%rax
  80056b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80056f:	e9 a3 00 00 00       	jmpq   800617 <getint+0x10a>
  800574:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800578:	74 4f                	je     8005c9 <getint+0xbc>
  80057a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80057e:	8b 00                	mov    (%rax),%eax
  800580:	83 f8 30             	cmp    $0x30,%eax
  800583:	73 24                	jae    8005a9 <getint+0x9c>
  800585:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800589:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80058d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800591:	8b 00                	mov    (%rax),%eax
  800593:	89 c0                	mov    %eax,%eax
  800595:	48 01 d0             	add    %rdx,%rax
  800598:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80059c:	8b 12                	mov    (%rdx),%edx
  80059e:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8005a1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8005a5:	89 0a                	mov    %ecx,(%rdx)
  8005a7:	eb 17                	jmp    8005c0 <getint+0xb3>
  8005a9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005ad:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8005b1:	48 89 d0             	mov    %rdx,%rax
  8005b4:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8005b8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8005bc:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8005c0:	48 8b 00             	mov    (%rax),%rax
  8005c3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8005c7:	eb 4e                	jmp    800617 <getint+0x10a>
  8005c9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005cd:	8b 00                	mov    (%rax),%eax
  8005cf:	83 f8 30             	cmp    $0x30,%eax
  8005d2:	73 24                	jae    8005f8 <getint+0xeb>
  8005d4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005d8:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8005dc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005e0:	8b 00                	mov    (%rax),%eax
  8005e2:	89 c0                	mov    %eax,%eax
  8005e4:	48 01 d0             	add    %rdx,%rax
  8005e7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8005eb:	8b 12                	mov    (%rdx),%edx
  8005ed:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8005f0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8005f4:	89 0a                	mov    %ecx,(%rdx)
  8005f6:	eb 17                	jmp    80060f <getint+0x102>
  8005f8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005fc:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800600:	48 89 d0             	mov    %rdx,%rax
  800603:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800607:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80060b:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80060f:	8b 00                	mov    (%rax),%eax
  800611:	48 98                	cltq   
  800613:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800617:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80061b:	c9                   	leaveq 
  80061c:	c3                   	retq   

000000000080061d <vprintfmt>:
  80061d:	55                   	push   %rbp
  80061e:	48 89 e5             	mov    %rsp,%rbp
  800621:	41 54                	push   %r12
  800623:	53                   	push   %rbx
  800624:	48 83 ec 60          	sub    $0x60,%rsp
  800628:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  80062c:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  800630:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800634:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  800638:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  80063c:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  800640:	48 8b 0a             	mov    (%rdx),%rcx
  800643:	48 89 08             	mov    %rcx,(%rax)
  800646:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80064a:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80064e:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800652:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800656:	eb 17                	jmp    80066f <vprintfmt+0x52>
  800658:	85 db                	test   %ebx,%ebx
  80065a:	0f 84 cc 04 00 00    	je     800b2c <vprintfmt+0x50f>
  800660:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800664:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800668:	48 89 d6             	mov    %rdx,%rsi
  80066b:	89 df                	mov    %ebx,%edi
  80066d:	ff d0                	callq  *%rax
  80066f:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800673:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800677:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  80067b:	0f b6 00             	movzbl (%rax),%eax
  80067e:	0f b6 d8             	movzbl %al,%ebx
  800681:	83 fb 25             	cmp    $0x25,%ebx
  800684:	75 d2                	jne    800658 <vprintfmt+0x3b>
  800686:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  80068a:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  800691:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800698:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  80069f:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  8006a6:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8006aa:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8006ae:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8006b2:	0f b6 00             	movzbl (%rax),%eax
  8006b5:	0f b6 d8             	movzbl %al,%ebx
  8006b8:	8d 43 dd             	lea    -0x23(%rbx),%eax
  8006bb:	83 f8 55             	cmp    $0x55,%eax
  8006be:	0f 87 34 04 00 00    	ja     800af8 <vprintfmt+0x4db>
  8006c4:	89 c0                	mov    %eax,%eax
  8006c6:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8006cd:	00 
  8006ce:	48 b8 b8 42 80 00 00 	movabs $0x8042b8,%rax
  8006d5:	00 00 00 
  8006d8:	48 01 d0             	add    %rdx,%rax
  8006db:	48 8b 00             	mov    (%rax),%rax
  8006de:	ff e0                	jmpq   *%rax
  8006e0:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  8006e4:	eb c0                	jmp    8006a6 <vprintfmt+0x89>
  8006e6:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  8006ea:	eb ba                	jmp    8006a6 <vprintfmt+0x89>
  8006ec:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  8006f3:	8b 55 d8             	mov    -0x28(%rbp),%edx
  8006f6:	89 d0                	mov    %edx,%eax
  8006f8:	c1 e0 02             	shl    $0x2,%eax
  8006fb:	01 d0                	add    %edx,%eax
  8006fd:	01 c0                	add    %eax,%eax
  8006ff:	01 d8                	add    %ebx,%eax
  800701:	83 e8 30             	sub    $0x30,%eax
  800704:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800707:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  80070b:	0f b6 00             	movzbl (%rax),%eax
  80070e:	0f be d8             	movsbl %al,%ebx
  800711:	83 fb 2f             	cmp    $0x2f,%ebx
  800714:	7e 0c                	jle    800722 <vprintfmt+0x105>
  800716:	83 fb 39             	cmp    $0x39,%ebx
  800719:	7f 07                	jg     800722 <vprintfmt+0x105>
  80071b:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  800720:	eb d1                	jmp    8006f3 <vprintfmt+0xd6>
  800722:	eb 58                	jmp    80077c <vprintfmt+0x15f>
  800724:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800727:	83 f8 30             	cmp    $0x30,%eax
  80072a:	73 17                	jae    800743 <vprintfmt+0x126>
  80072c:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800730:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800733:	89 c0                	mov    %eax,%eax
  800735:	48 01 d0             	add    %rdx,%rax
  800738:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80073b:	83 c2 08             	add    $0x8,%edx
  80073e:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800741:	eb 0f                	jmp    800752 <vprintfmt+0x135>
  800743:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800747:	48 89 d0             	mov    %rdx,%rax
  80074a:	48 83 c2 08          	add    $0x8,%rdx
  80074e:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800752:	8b 00                	mov    (%rax),%eax
  800754:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800757:	eb 23                	jmp    80077c <vprintfmt+0x15f>
  800759:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  80075d:	79 0c                	jns    80076b <vprintfmt+0x14e>
  80075f:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  800766:	e9 3b ff ff ff       	jmpq   8006a6 <vprintfmt+0x89>
  80076b:	e9 36 ff ff ff       	jmpq   8006a6 <vprintfmt+0x89>
  800770:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  800777:	e9 2a ff ff ff       	jmpq   8006a6 <vprintfmt+0x89>
  80077c:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800780:	79 12                	jns    800794 <vprintfmt+0x177>
  800782:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800785:	89 45 dc             	mov    %eax,-0x24(%rbp)
  800788:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  80078f:	e9 12 ff ff ff       	jmpq   8006a6 <vprintfmt+0x89>
  800794:	e9 0d ff ff ff       	jmpq   8006a6 <vprintfmt+0x89>
  800799:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  80079d:	e9 04 ff ff ff       	jmpq   8006a6 <vprintfmt+0x89>
  8007a2:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8007a5:	83 f8 30             	cmp    $0x30,%eax
  8007a8:	73 17                	jae    8007c1 <vprintfmt+0x1a4>
  8007aa:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8007ae:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8007b1:	89 c0                	mov    %eax,%eax
  8007b3:	48 01 d0             	add    %rdx,%rax
  8007b6:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8007b9:	83 c2 08             	add    $0x8,%edx
  8007bc:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8007bf:	eb 0f                	jmp    8007d0 <vprintfmt+0x1b3>
  8007c1:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  8007c5:	48 89 d0             	mov    %rdx,%rax
  8007c8:	48 83 c2 08          	add    $0x8,%rdx
  8007cc:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8007d0:	8b 10                	mov    (%rax),%edx
  8007d2:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  8007d6:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8007da:	48 89 ce             	mov    %rcx,%rsi
  8007dd:	89 d7                	mov    %edx,%edi
  8007df:	ff d0                	callq  *%rax
  8007e1:	e9 40 03 00 00       	jmpq   800b26 <vprintfmt+0x509>
  8007e6:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8007e9:	83 f8 30             	cmp    $0x30,%eax
  8007ec:	73 17                	jae    800805 <vprintfmt+0x1e8>
  8007ee:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8007f2:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8007f5:	89 c0                	mov    %eax,%eax
  8007f7:	48 01 d0             	add    %rdx,%rax
  8007fa:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8007fd:	83 c2 08             	add    $0x8,%edx
  800800:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800803:	eb 0f                	jmp    800814 <vprintfmt+0x1f7>
  800805:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800809:	48 89 d0             	mov    %rdx,%rax
  80080c:	48 83 c2 08          	add    $0x8,%rdx
  800810:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800814:	8b 18                	mov    (%rax),%ebx
  800816:	85 db                	test   %ebx,%ebx
  800818:	79 02                	jns    80081c <vprintfmt+0x1ff>
  80081a:	f7 db                	neg    %ebx
  80081c:	83 fb 15             	cmp    $0x15,%ebx
  80081f:	7f 16                	jg     800837 <vprintfmt+0x21a>
  800821:	48 b8 e0 41 80 00 00 	movabs $0x8041e0,%rax
  800828:	00 00 00 
  80082b:	48 63 d3             	movslq %ebx,%rdx
  80082e:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800832:	4d 85 e4             	test   %r12,%r12
  800835:	75 2e                	jne    800865 <vprintfmt+0x248>
  800837:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  80083b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80083f:	89 d9                	mov    %ebx,%ecx
  800841:	48 ba a1 42 80 00 00 	movabs $0x8042a1,%rdx
  800848:	00 00 00 
  80084b:	48 89 c7             	mov    %rax,%rdi
  80084e:	b8 00 00 00 00       	mov    $0x0,%eax
  800853:	49 b8 35 0b 80 00 00 	movabs $0x800b35,%r8
  80085a:	00 00 00 
  80085d:	41 ff d0             	callq  *%r8
  800860:	e9 c1 02 00 00       	jmpq   800b26 <vprintfmt+0x509>
  800865:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800869:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80086d:	4c 89 e1             	mov    %r12,%rcx
  800870:	48 ba aa 42 80 00 00 	movabs $0x8042aa,%rdx
  800877:	00 00 00 
  80087a:	48 89 c7             	mov    %rax,%rdi
  80087d:	b8 00 00 00 00       	mov    $0x0,%eax
  800882:	49 b8 35 0b 80 00 00 	movabs $0x800b35,%r8
  800889:	00 00 00 
  80088c:	41 ff d0             	callq  *%r8
  80088f:	e9 92 02 00 00       	jmpq   800b26 <vprintfmt+0x509>
  800894:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800897:	83 f8 30             	cmp    $0x30,%eax
  80089a:	73 17                	jae    8008b3 <vprintfmt+0x296>
  80089c:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8008a0:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8008a3:	89 c0                	mov    %eax,%eax
  8008a5:	48 01 d0             	add    %rdx,%rax
  8008a8:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8008ab:	83 c2 08             	add    $0x8,%edx
  8008ae:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8008b1:	eb 0f                	jmp    8008c2 <vprintfmt+0x2a5>
  8008b3:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  8008b7:	48 89 d0             	mov    %rdx,%rax
  8008ba:	48 83 c2 08          	add    $0x8,%rdx
  8008be:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8008c2:	4c 8b 20             	mov    (%rax),%r12
  8008c5:	4d 85 e4             	test   %r12,%r12
  8008c8:	75 0a                	jne    8008d4 <vprintfmt+0x2b7>
  8008ca:	49 bc ad 42 80 00 00 	movabs $0x8042ad,%r12
  8008d1:	00 00 00 
  8008d4:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8008d8:	7e 3f                	jle    800919 <vprintfmt+0x2fc>
  8008da:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  8008de:	74 39                	je     800919 <vprintfmt+0x2fc>
  8008e0:	8b 45 d8             	mov    -0x28(%rbp),%eax
  8008e3:	48 98                	cltq   
  8008e5:	48 89 c6             	mov    %rax,%rsi
  8008e8:	4c 89 e7             	mov    %r12,%rdi
  8008eb:	48 b8 e1 0d 80 00 00 	movabs $0x800de1,%rax
  8008f2:	00 00 00 
  8008f5:	ff d0                	callq  *%rax
  8008f7:	29 45 dc             	sub    %eax,-0x24(%rbp)
  8008fa:	eb 17                	jmp    800913 <vprintfmt+0x2f6>
  8008fc:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800900:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800904:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800908:	48 89 ce             	mov    %rcx,%rsi
  80090b:	89 d7                	mov    %edx,%edi
  80090d:	ff d0                	callq  *%rax
  80090f:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800913:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800917:	7f e3                	jg     8008fc <vprintfmt+0x2df>
  800919:	eb 37                	jmp    800952 <vprintfmt+0x335>
  80091b:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  80091f:	74 1e                	je     80093f <vprintfmt+0x322>
  800921:	83 fb 1f             	cmp    $0x1f,%ebx
  800924:	7e 05                	jle    80092b <vprintfmt+0x30e>
  800926:	83 fb 7e             	cmp    $0x7e,%ebx
  800929:	7e 14                	jle    80093f <vprintfmt+0x322>
  80092b:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  80092f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800933:	48 89 d6             	mov    %rdx,%rsi
  800936:	bf 3f 00 00 00       	mov    $0x3f,%edi
  80093b:	ff d0                	callq  *%rax
  80093d:	eb 0f                	jmp    80094e <vprintfmt+0x331>
  80093f:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800943:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800947:	48 89 d6             	mov    %rdx,%rsi
  80094a:	89 df                	mov    %ebx,%edi
  80094c:	ff d0                	callq  *%rax
  80094e:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800952:	4c 89 e0             	mov    %r12,%rax
  800955:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800959:	0f b6 00             	movzbl (%rax),%eax
  80095c:	0f be d8             	movsbl %al,%ebx
  80095f:	85 db                	test   %ebx,%ebx
  800961:	74 10                	je     800973 <vprintfmt+0x356>
  800963:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800967:	78 b2                	js     80091b <vprintfmt+0x2fe>
  800969:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  80096d:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800971:	79 a8                	jns    80091b <vprintfmt+0x2fe>
  800973:	eb 16                	jmp    80098b <vprintfmt+0x36e>
  800975:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800979:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80097d:	48 89 d6             	mov    %rdx,%rsi
  800980:	bf 20 00 00 00       	mov    $0x20,%edi
  800985:	ff d0                	callq  *%rax
  800987:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  80098b:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  80098f:	7f e4                	jg     800975 <vprintfmt+0x358>
  800991:	e9 90 01 00 00       	jmpq   800b26 <vprintfmt+0x509>
  800996:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  80099a:	be 03 00 00 00       	mov    $0x3,%esi
  80099f:	48 89 c7             	mov    %rax,%rdi
  8009a2:	48 b8 0d 05 80 00 00 	movabs $0x80050d,%rax
  8009a9:	00 00 00 
  8009ac:	ff d0                	callq  *%rax
  8009ae:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8009b2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009b6:	48 85 c0             	test   %rax,%rax
  8009b9:	79 1d                	jns    8009d8 <vprintfmt+0x3bb>
  8009bb:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8009bf:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8009c3:	48 89 d6             	mov    %rdx,%rsi
  8009c6:	bf 2d 00 00 00       	mov    $0x2d,%edi
  8009cb:	ff d0                	callq  *%rax
  8009cd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009d1:	48 f7 d8             	neg    %rax
  8009d4:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8009d8:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  8009df:	e9 d5 00 00 00       	jmpq   800ab9 <vprintfmt+0x49c>
  8009e4:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8009e8:	be 03 00 00 00       	mov    $0x3,%esi
  8009ed:	48 89 c7             	mov    %rax,%rdi
  8009f0:	48 b8 fd 03 80 00 00 	movabs $0x8003fd,%rax
  8009f7:	00 00 00 
  8009fa:	ff d0                	callq  *%rax
  8009fc:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800a00:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800a07:	e9 ad 00 00 00       	jmpq   800ab9 <vprintfmt+0x49c>
  800a0c:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800a10:	be 03 00 00 00       	mov    $0x3,%esi
  800a15:	48 89 c7             	mov    %rax,%rdi
  800a18:	48 b8 fd 03 80 00 00 	movabs $0x8003fd,%rax
  800a1f:	00 00 00 
  800a22:	ff d0                	callq  *%rax
  800a24:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800a28:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800a2f:	e9 85 00 00 00       	jmpq   800ab9 <vprintfmt+0x49c>
  800a34:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800a38:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a3c:	48 89 d6             	mov    %rdx,%rsi
  800a3f:	bf 30 00 00 00       	mov    $0x30,%edi
  800a44:	ff d0                	callq  *%rax
  800a46:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800a4a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a4e:	48 89 d6             	mov    %rdx,%rsi
  800a51:	bf 78 00 00 00       	mov    $0x78,%edi
  800a56:	ff d0                	callq  *%rax
  800a58:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800a5b:	83 f8 30             	cmp    $0x30,%eax
  800a5e:	73 17                	jae    800a77 <vprintfmt+0x45a>
  800a60:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800a64:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800a67:	89 c0                	mov    %eax,%eax
  800a69:	48 01 d0             	add    %rdx,%rax
  800a6c:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800a6f:	83 c2 08             	add    $0x8,%edx
  800a72:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800a75:	eb 0f                	jmp    800a86 <vprintfmt+0x469>
  800a77:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800a7b:	48 89 d0             	mov    %rdx,%rax
  800a7e:	48 83 c2 08          	add    $0x8,%rdx
  800a82:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800a86:	48 8b 00             	mov    (%rax),%rax
  800a89:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800a8d:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800a94:	eb 23                	jmp    800ab9 <vprintfmt+0x49c>
  800a96:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800a9a:	be 03 00 00 00       	mov    $0x3,%esi
  800a9f:	48 89 c7             	mov    %rax,%rdi
  800aa2:	48 b8 fd 03 80 00 00 	movabs $0x8003fd,%rax
  800aa9:	00 00 00 
  800aac:	ff d0                	callq  *%rax
  800aae:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800ab2:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800ab9:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  800abe:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800ac1:	8b 7d dc             	mov    -0x24(%rbp),%edi
  800ac4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800ac8:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800acc:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ad0:	45 89 c1             	mov    %r8d,%r9d
  800ad3:	41 89 f8             	mov    %edi,%r8d
  800ad6:	48 89 c7             	mov    %rax,%rdi
  800ad9:	48 b8 42 03 80 00 00 	movabs $0x800342,%rax
  800ae0:	00 00 00 
  800ae3:	ff d0                	callq  *%rax
  800ae5:	eb 3f                	jmp    800b26 <vprintfmt+0x509>
  800ae7:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800aeb:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800aef:	48 89 d6             	mov    %rdx,%rsi
  800af2:	89 df                	mov    %ebx,%edi
  800af4:	ff d0                	callq  *%rax
  800af6:	eb 2e                	jmp    800b26 <vprintfmt+0x509>
  800af8:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800afc:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b00:	48 89 d6             	mov    %rdx,%rsi
  800b03:	bf 25 00 00 00       	mov    $0x25,%edi
  800b08:	ff d0                	callq  *%rax
  800b0a:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800b0f:	eb 05                	jmp    800b16 <vprintfmt+0x4f9>
  800b11:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800b16:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800b1a:	48 83 e8 01          	sub    $0x1,%rax
  800b1e:	0f b6 00             	movzbl (%rax),%eax
  800b21:	3c 25                	cmp    $0x25,%al
  800b23:	75 ec                	jne    800b11 <vprintfmt+0x4f4>
  800b25:	90                   	nop
  800b26:	90                   	nop
  800b27:	e9 43 fb ff ff       	jmpq   80066f <vprintfmt+0x52>
  800b2c:	48 83 c4 60          	add    $0x60,%rsp
  800b30:	5b                   	pop    %rbx
  800b31:	41 5c                	pop    %r12
  800b33:	5d                   	pop    %rbp
  800b34:	c3                   	retq   

0000000000800b35 <printfmt>:
  800b35:	55                   	push   %rbp
  800b36:	48 89 e5             	mov    %rsp,%rbp
  800b39:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  800b40:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  800b47:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  800b4e:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800b55:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800b5c:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800b63:	84 c0                	test   %al,%al
  800b65:	74 20                	je     800b87 <printfmt+0x52>
  800b67:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800b6b:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800b6f:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800b73:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800b77:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800b7b:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800b7f:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800b83:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800b87:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  800b8e:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  800b95:	00 00 00 
  800b98:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  800b9f:	00 00 00 
  800ba2:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800ba6:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800bad:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800bb4:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  800bbb:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  800bc2:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800bc9:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  800bd0:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  800bd7:	48 89 c7             	mov    %rax,%rdi
  800bda:	48 b8 1d 06 80 00 00 	movabs $0x80061d,%rax
  800be1:	00 00 00 
  800be4:	ff d0                	callq  *%rax
  800be6:	c9                   	leaveq 
  800be7:	c3                   	retq   

0000000000800be8 <sprintputch>:
  800be8:	55                   	push   %rbp
  800be9:	48 89 e5             	mov    %rsp,%rbp
  800bec:	48 83 ec 10          	sub    $0x10,%rsp
  800bf0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800bf3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800bf7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800bfb:	8b 40 10             	mov    0x10(%rax),%eax
  800bfe:	8d 50 01             	lea    0x1(%rax),%edx
  800c01:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800c05:	89 50 10             	mov    %edx,0x10(%rax)
  800c08:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800c0c:	48 8b 10             	mov    (%rax),%rdx
  800c0f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800c13:	48 8b 40 08          	mov    0x8(%rax),%rax
  800c17:	48 39 c2             	cmp    %rax,%rdx
  800c1a:	73 17                	jae    800c33 <sprintputch+0x4b>
  800c1c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800c20:	48 8b 00             	mov    (%rax),%rax
  800c23:	48 8d 48 01          	lea    0x1(%rax),%rcx
  800c27:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800c2b:	48 89 0a             	mov    %rcx,(%rdx)
  800c2e:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800c31:	88 10                	mov    %dl,(%rax)
  800c33:	c9                   	leaveq 
  800c34:	c3                   	retq   

0000000000800c35 <vsnprintf>:
  800c35:	55                   	push   %rbp
  800c36:	48 89 e5             	mov    %rsp,%rbp
  800c39:	48 83 ec 50          	sub    $0x50,%rsp
  800c3d:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  800c41:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  800c44:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  800c48:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  800c4c:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  800c50:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  800c54:	48 8b 0a             	mov    (%rdx),%rcx
  800c57:	48 89 08             	mov    %rcx,(%rax)
  800c5a:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800c5e:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800c62:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800c66:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800c6a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800c6e:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  800c72:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  800c75:	48 98                	cltq   
  800c77:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  800c7b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800c7f:	48 01 d0             	add    %rdx,%rax
  800c82:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  800c86:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800c8d:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  800c92:	74 06                	je     800c9a <vsnprintf+0x65>
  800c94:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  800c98:	7f 07                	jg     800ca1 <vsnprintf+0x6c>
  800c9a:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800c9f:	eb 2f                	jmp    800cd0 <vsnprintf+0x9b>
  800ca1:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  800ca5:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  800ca9:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  800cad:	48 89 c6             	mov    %rax,%rsi
  800cb0:	48 bf e8 0b 80 00 00 	movabs $0x800be8,%rdi
  800cb7:	00 00 00 
  800cba:	48 b8 1d 06 80 00 00 	movabs $0x80061d,%rax
  800cc1:	00 00 00 
  800cc4:	ff d0                	callq  *%rax
  800cc6:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800cca:	c6 00 00             	movb   $0x0,(%rax)
  800ccd:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800cd0:	c9                   	leaveq 
  800cd1:	c3                   	retq   

0000000000800cd2 <snprintf>:
  800cd2:	55                   	push   %rbp
  800cd3:	48 89 e5             	mov    %rsp,%rbp
  800cd6:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  800cdd:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800ce4:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  800cea:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800cf1:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800cf8:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800cff:	84 c0                	test   %al,%al
  800d01:	74 20                	je     800d23 <snprintf+0x51>
  800d03:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800d07:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800d0b:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800d0f:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800d13:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800d17:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800d1b:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800d1f:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800d23:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  800d2a:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  800d31:	00 00 00 
  800d34:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800d3b:	00 00 00 
  800d3e:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800d42:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800d49:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800d50:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800d57:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800d5e:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800d65:	48 8b 0a             	mov    (%rdx),%rcx
  800d68:	48 89 08             	mov    %rcx,(%rax)
  800d6b:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800d6f:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800d73:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800d77:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800d7b:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  800d82:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  800d89:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  800d8f:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800d96:	48 89 c7             	mov    %rax,%rdi
  800d99:	48 b8 35 0c 80 00 00 	movabs $0x800c35,%rax
  800da0:	00 00 00 
  800da3:	ff d0                	callq  *%rax
  800da5:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  800dab:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  800db1:	c9                   	leaveq 
  800db2:	c3                   	retq   

0000000000800db3 <strlen>:
  800db3:	55                   	push   %rbp
  800db4:	48 89 e5             	mov    %rsp,%rbp
  800db7:	48 83 ec 18          	sub    $0x18,%rsp
  800dbb:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800dbf:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800dc6:	eb 09                	jmp    800dd1 <strlen+0x1e>
  800dc8:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800dcc:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  800dd1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800dd5:	0f b6 00             	movzbl (%rax),%eax
  800dd8:	84 c0                	test   %al,%al
  800dda:	75 ec                	jne    800dc8 <strlen+0x15>
  800ddc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800ddf:	c9                   	leaveq 
  800de0:	c3                   	retq   

0000000000800de1 <strnlen>:
  800de1:	55                   	push   %rbp
  800de2:	48 89 e5             	mov    %rsp,%rbp
  800de5:	48 83 ec 20          	sub    $0x20,%rsp
  800de9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800ded:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800df1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800df8:	eb 0e                	jmp    800e08 <strnlen+0x27>
  800dfa:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800dfe:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  800e03:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  800e08:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  800e0d:	74 0b                	je     800e1a <strnlen+0x39>
  800e0f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e13:	0f b6 00             	movzbl (%rax),%eax
  800e16:	84 c0                	test   %al,%al
  800e18:	75 e0                	jne    800dfa <strnlen+0x19>
  800e1a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800e1d:	c9                   	leaveq 
  800e1e:	c3                   	retq   

0000000000800e1f <strcpy>:
  800e1f:	55                   	push   %rbp
  800e20:	48 89 e5             	mov    %rsp,%rbp
  800e23:	48 83 ec 20          	sub    $0x20,%rsp
  800e27:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800e2b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800e2f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e33:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800e37:	90                   	nop
  800e38:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e3c:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800e40:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  800e44:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  800e48:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  800e4c:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  800e50:	0f b6 12             	movzbl (%rdx),%edx
  800e53:	88 10                	mov    %dl,(%rax)
  800e55:	0f b6 00             	movzbl (%rax),%eax
  800e58:	84 c0                	test   %al,%al
  800e5a:	75 dc                	jne    800e38 <strcpy+0x19>
  800e5c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800e60:	c9                   	leaveq 
  800e61:	c3                   	retq   

0000000000800e62 <strcat>:
  800e62:	55                   	push   %rbp
  800e63:	48 89 e5             	mov    %rsp,%rbp
  800e66:	48 83 ec 20          	sub    $0x20,%rsp
  800e6a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800e6e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800e72:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e76:	48 89 c7             	mov    %rax,%rdi
  800e79:	48 b8 b3 0d 80 00 00 	movabs $0x800db3,%rax
  800e80:	00 00 00 
  800e83:	ff d0                	callq  *%rax
  800e85:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800e88:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800e8b:	48 63 d0             	movslq %eax,%rdx
  800e8e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e92:	48 01 c2             	add    %rax,%rdx
  800e95:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800e99:	48 89 c6             	mov    %rax,%rsi
  800e9c:	48 89 d7             	mov    %rdx,%rdi
  800e9f:	48 b8 1f 0e 80 00 00 	movabs $0x800e1f,%rax
  800ea6:	00 00 00 
  800ea9:	ff d0                	callq  *%rax
  800eab:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800eaf:	c9                   	leaveq 
  800eb0:	c3                   	retq   

0000000000800eb1 <strncpy>:
  800eb1:	55                   	push   %rbp
  800eb2:	48 89 e5             	mov    %rsp,%rbp
  800eb5:	48 83 ec 28          	sub    $0x28,%rsp
  800eb9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800ebd:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800ec1:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  800ec5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ec9:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  800ecd:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  800ed4:	00 
  800ed5:	eb 2a                	jmp    800f01 <strncpy+0x50>
  800ed7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800edb:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800edf:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  800ee3:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  800ee7:	0f b6 12             	movzbl (%rdx),%edx
  800eea:	88 10                	mov    %dl,(%rax)
  800eec:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800ef0:	0f b6 00             	movzbl (%rax),%eax
  800ef3:	84 c0                	test   %al,%al
  800ef5:	74 05                	je     800efc <strncpy+0x4b>
  800ef7:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  800efc:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  800f01:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800f05:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  800f09:	72 cc                	jb     800ed7 <strncpy+0x26>
  800f0b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800f0f:	c9                   	leaveq 
  800f10:	c3                   	retq   

0000000000800f11 <strlcpy>:
  800f11:	55                   	push   %rbp
  800f12:	48 89 e5             	mov    %rsp,%rbp
  800f15:	48 83 ec 28          	sub    $0x28,%rsp
  800f19:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800f1d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800f21:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  800f25:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f29:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800f2d:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  800f32:	74 3d                	je     800f71 <strlcpy+0x60>
  800f34:	eb 1d                	jmp    800f53 <strlcpy+0x42>
  800f36:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f3a:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800f3e:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  800f42:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  800f46:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  800f4a:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  800f4e:	0f b6 12             	movzbl (%rdx),%edx
  800f51:	88 10                	mov    %dl,(%rax)
  800f53:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  800f58:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  800f5d:	74 0b                	je     800f6a <strlcpy+0x59>
  800f5f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800f63:	0f b6 00             	movzbl (%rax),%eax
  800f66:	84 c0                	test   %al,%al
  800f68:	75 cc                	jne    800f36 <strlcpy+0x25>
  800f6a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f6e:	c6 00 00             	movb   $0x0,(%rax)
  800f71:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800f75:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800f79:	48 29 c2             	sub    %rax,%rdx
  800f7c:	48 89 d0             	mov    %rdx,%rax
  800f7f:	c9                   	leaveq 
  800f80:	c3                   	retq   

0000000000800f81 <strcmp>:
  800f81:	55                   	push   %rbp
  800f82:	48 89 e5             	mov    %rsp,%rbp
  800f85:	48 83 ec 10          	sub    $0x10,%rsp
  800f89:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800f8d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800f91:	eb 0a                	jmp    800f9d <strcmp+0x1c>
  800f93:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  800f98:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  800f9d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800fa1:	0f b6 00             	movzbl (%rax),%eax
  800fa4:	84 c0                	test   %al,%al
  800fa6:	74 12                	je     800fba <strcmp+0x39>
  800fa8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800fac:	0f b6 10             	movzbl (%rax),%edx
  800faf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800fb3:	0f b6 00             	movzbl (%rax),%eax
  800fb6:	38 c2                	cmp    %al,%dl
  800fb8:	74 d9                	je     800f93 <strcmp+0x12>
  800fba:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800fbe:	0f b6 00             	movzbl (%rax),%eax
  800fc1:	0f b6 d0             	movzbl %al,%edx
  800fc4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800fc8:	0f b6 00             	movzbl (%rax),%eax
  800fcb:	0f b6 c0             	movzbl %al,%eax
  800fce:	29 c2                	sub    %eax,%edx
  800fd0:	89 d0                	mov    %edx,%eax
  800fd2:	c9                   	leaveq 
  800fd3:	c3                   	retq   

0000000000800fd4 <strncmp>:
  800fd4:	55                   	push   %rbp
  800fd5:	48 89 e5             	mov    %rsp,%rbp
  800fd8:	48 83 ec 18          	sub    $0x18,%rsp
  800fdc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800fe0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800fe4:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  800fe8:	eb 0f                	jmp    800ff9 <strncmp+0x25>
  800fea:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  800fef:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  800ff4:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  800ff9:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  800ffe:	74 1d                	je     80101d <strncmp+0x49>
  801000:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801004:	0f b6 00             	movzbl (%rax),%eax
  801007:	84 c0                	test   %al,%al
  801009:	74 12                	je     80101d <strncmp+0x49>
  80100b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80100f:	0f b6 10             	movzbl (%rax),%edx
  801012:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801016:	0f b6 00             	movzbl (%rax),%eax
  801019:	38 c2                	cmp    %al,%dl
  80101b:	74 cd                	je     800fea <strncmp+0x16>
  80101d:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801022:	75 07                	jne    80102b <strncmp+0x57>
  801024:	b8 00 00 00 00       	mov    $0x0,%eax
  801029:	eb 18                	jmp    801043 <strncmp+0x6f>
  80102b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80102f:	0f b6 00             	movzbl (%rax),%eax
  801032:	0f b6 d0             	movzbl %al,%edx
  801035:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801039:	0f b6 00             	movzbl (%rax),%eax
  80103c:	0f b6 c0             	movzbl %al,%eax
  80103f:	29 c2                	sub    %eax,%edx
  801041:	89 d0                	mov    %edx,%eax
  801043:	c9                   	leaveq 
  801044:	c3                   	retq   

0000000000801045 <strchr>:
  801045:	55                   	push   %rbp
  801046:	48 89 e5             	mov    %rsp,%rbp
  801049:	48 83 ec 0c          	sub    $0xc,%rsp
  80104d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801051:	89 f0                	mov    %esi,%eax
  801053:	88 45 f4             	mov    %al,-0xc(%rbp)
  801056:	eb 17                	jmp    80106f <strchr+0x2a>
  801058:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80105c:	0f b6 00             	movzbl (%rax),%eax
  80105f:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801062:	75 06                	jne    80106a <strchr+0x25>
  801064:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801068:	eb 15                	jmp    80107f <strchr+0x3a>
  80106a:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80106f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801073:	0f b6 00             	movzbl (%rax),%eax
  801076:	84 c0                	test   %al,%al
  801078:	75 de                	jne    801058 <strchr+0x13>
  80107a:	b8 00 00 00 00       	mov    $0x0,%eax
  80107f:	c9                   	leaveq 
  801080:	c3                   	retq   

0000000000801081 <strfind>:
  801081:	55                   	push   %rbp
  801082:	48 89 e5             	mov    %rsp,%rbp
  801085:	48 83 ec 0c          	sub    $0xc,%rsp
  801089:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80108d:	89 f0                	mov    %esi,%eax
  80108f:	88 45 f4             	mov    %al,-0xc(%rbp)
  801092:	eb 13                	jmp    8010a7 <strfind+0x26>
  801094:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801098:	0f b6 00             	movzbl (%rax),%eax
  80109b:	3a 45 f4             	cmp    -0xc(%rbp),%al
  80109e:	75 02                	jne    8010a2 <strfind+0x21>
  8010a0:	eb 10                	jmp    8010b2 <strfind+0x31>
  8010a2:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8010a7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010ab:	0f b6 00             	movzbl (%rax),%eax
  8010ae:	84 c0                	test   %al,%al
  8010b0:	75 e2                	jne    801094 <strfind+0x13>
  8010b2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010b6:	c9                   	leaveq 
  8010b7:	c3                   	retq   

00000000008010b8 <memset>:
  8010b8:	55                   	push   %rbp
  8010b9:	48 89 e5             	mov    %rsp,%rbp
  8010bc:	48 83 ec 18          	sub    $0x18,%rsp
  8010c0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8010c4:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8010c7:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8010cb:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8010d0:	75 06                	jne    8010d8 <memset+0x20>
  8010d2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010d6:	eb 69                	jmp    801141 <memset+0x89>
  8010d8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010dc:	83 e0 03             	and    $0x3,%eax
  8010df:	48 85 c0             	test   %rax,%rax
  8010e2:	75 48                	jne    80112c <memset+0x74>
  8010e4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010e8:	83 e0 03             	and    $0x3,%eax
  8010eb:	48 85 c0             	test   %rax,%rax
  8010ee:	75 3c                	jne    80112c <memset+0x74>
  8010f0:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  8010f7:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8010fa:	c1 e0 18             	shl    $0x18,%eax
  8010fd:	89 c2                	mov    %eax,%edx
  8010ff:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801102:	c1 e0 10             	shl    $0x10,%eax
  801105:	09 c2                	or     %eax,%edx
  801107:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80110a:	c1 e0 08             	shl    $0x8,%eax
  80110d:	09 d0                	or     %edx,%eax
  80110f:	09 45 f4             	or     %eax,-0xc(%rbp)
  801112:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801116:	48 c1 e8 02          	shr    $0x2,%rax
  80111a:	48 89 c1             	mov    %rax,%rcx
  80111d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801121:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801124:	48 89 d7             	mov    %rdx,%rdi
  801127:	fc                   	cld    
  801128:	f3 ab                	rep stos %eax,%es:(%rdi)
  80112a:	eb 11                	jmp    80113d <memset+0x85>
  80112c:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801130:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801133:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801137:	48 89 d7             	mov    %rdx,%rdi
  80113a:	fc                   	cld    
  80113b:	f3 aa                	rep stos %al,%es:(%rdi)
  80113d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801141:	c9                   	leaveq 
  801142:	c3                   	retq   

0000000000801143 <memmove>:
  801143:	55                   	push   %rbp
  801144:	48 89 e5             	mov    %rsp,%rbp
  801147:	48 83 ec 28          	sub    $0x28,%rsp
  80114b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80114f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801153:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801157:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80115b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80115f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801163:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801167:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80116b:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  80116f:	0f 83 88 00 00 00    	jae    8011fd <memmove+0xba>
  801175:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801179:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80117d:	48 01 d0             	add    %rdx,%rax
  801180:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801184:	76 77                	jbe    8011fd <memmove+0xba>
  801186:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80118a:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  80118e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801192:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  801196:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80119a:	83 e0 03             	and    $0x3,%eax
  80119d:	48 85 c0             	test   %rax,%rax
  8011a0:	75 3b                	jne    8011dd <memmove+0x9a>
  8011a2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8011a6:	83 e0 03             	and    $0x3,%eax
  8011a9:	48 85 c0             	test   %rax,%rax
  8011ac:	75 2f                	jne    8011dd <memmove+0x9a>
  8011ae:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8011b2:	83 e0 03             	and    $0x3,%eax
  8011b5:	48 85 c0             	test   %rax,%rax
  8011b8:	75 23                	jne    8011dd <memmove+0x9a>
  8011ba:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8011be:	48 83 e8 04          	sub    $0x4,%rax
  8011c2:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8011c6:	48 83 ea 04          	sub    $0x4,%rdx
  8011ca:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  8011ce:	48 c1 e9 02          	shr    $0x2,%rcx
  8011d2:	48 89 c7             	mov    %rax,%rdi
  8011d5:	48 89 d6             	mov    %rdx,%rsi
  8011d8:	fd                   	std    
  8011d9:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  8011db:	eb 1d                	jmp    8011fa <memmove+0xb7>
  8011dd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8011e1:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8011e5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011e9:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  8011ed:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8011f1:	48 89 d7             	mov    %rdx,%rdi
  8011f4:	48 89 c1             	mov    %rax,%rcx
  8011f7:	fd                   	std    
  8011f8:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  8011fa:	fc                   	cld    
  8011fb:	eb 57                	jmp    801254 <memmove+0x111>
  8011fd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801201:	83 e0 03             	and    $0x3,%eax
  801204:	48 85 c0             	test   %rax,%rax
  801207:	75 36                	jne    80123f <memmove+0xfc>
  801209:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80120d:	83 e0 03             	and    $0x3,%eax
  801210:	48 85 c0             	test   %rax,%rax
  801213:	75 2a                	jne    80123f <memmove+0xfc>
  801215:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801219:	83 e0 03             	and    $0x3,%eax
  80121c:	48 85 c0             	test   %rax,%rax
  80121f:	75 1e                	jne    80123f <memmove+0xfc>
  801221:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801225:	48 c1 e8 02          	shr    $0x2,%rax
  801229:	48 89 c1             	mov    %rax,%rcx
  80122c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801230:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801234:	48 89 c7             	mov    %rax,%rdi
  801237:	48 89 d6             	mov    %rdx,%rsi
  80123a:	fc                   	cld    
  80123b:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  80123d:	eb 15                	jmp    801254 <memmove+0x111>
  80123f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801243:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801247:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  80124b:	48 89 c7             	mov    %rax,%rdi
  80124e:	48 89 d6             	mov    %rdx,%rsi
  801251:	fc                   	cld    
  801252:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801254:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801258:	c9                   	leaveq 
  801259:	c3                   	retq   

000000000080125a <memcpy>:
  80125a:	55                   	push   %rbp
  80125b:	48 89 e5             	mov    %rsp,%rbp
  80125e:	48 83 ec 18          	sub    $0x18,%rsp
  801262:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801266:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80126a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80126e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801272:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  801276:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80127a:	48 89 ce             	mov    %rcx,%rsi
  80127d:	48 89 c7             	mov    %rax,%rdi
  801280:	48 b8 43 11 80 00 00 	movabs $0x801143,%rax
  801287:	00 00 00 
  80128a:	ff d0                	callq  *%rax
  80128c:	c9                   	leaveq 
  80128d:	c3                   	retq   

000000000080128e <memcmp>:
  80128e:	55                   	push   %rbp
  80128f:	48 89 e5             	mov    %rsp,%rbp
  801292:	48 83 ec 28          	sub    $0x28,%rsp
  801296:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80129a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80129e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8012a2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012a6:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8012aa:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8012ae:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8012b2:	eb 36                	jmp    8012ea <memcmp+0x5c>
  8012b4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012b8:	0f b6 10             	movzbl (%rax),%edx
  8012bb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012bf:	0f b6 00             	movzbl (%rax),%eax
  8012c2:	38 c2                	cmp    %al,%dl
  8012c4:	74 1a                	je     8012e0 <memcmp+0x52>
  8012c6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012ca:	0f b6 00             	movzbl (%rax),%eax
  8012cd:	0f b6 d0             	movzbl %al,%edx
  8012d0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012d4:	0f b6 00             	movzbl (%rax),%eax
  8012d7:	0f b6 c0             	movzbl %al,%eax
  8012da:	29 c2                	sub    %eax,%edx
  8012dc:	89 d0                	mov    %edx,%eax
  8012de:	eb 20                	jmp    801300 <memcmp+0x72>
  8012e0:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8012e5:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8012ea:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8012ee:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8012f2:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8012f6:	48 85 c0             	test   %rax,%rax
  8012f9:	75 b9                	jne    8012b4 <memcmp+0x26>
  8012fb:	b8 00 00 00 00       	mov    $0x0,%eax
  801300:	c9                   	leaveq 
  801301:	c3                   	retq   

0000000000801302 <memfind>:
  801302:	55                   	push   %rbp
  801303:	48 89 e5             	mov    %rsp,%rbp
  801306:	48 83 ec 28          	sub    $0x28,%rsp
  80130a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80130e:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  801311:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801315:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801319:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80131d:	48 01 d0             	add    %rdx,%rax
  801320:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801324:	eb 15                	jmp    80133b <memfind+0x39>
  801326:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80132a:	0f b6 10             	movzbl (%rax),%edx
  80132d:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801330:	38 c2                	cmp    %al,%dl
  801332:	75 02                	jne    801336 <memfind+0x34>
  801334:	eb 0f                	jmp    801345 <memfind+0x43>
  801336:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80133b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80133f:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  801343:	72 e1                	jb     801326 <memfind+0x24>
  801345:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801349:	c9                   	leaveq 
  80134a:	c3                   	retq   

000000000080134b <strtol>:
  80134b:	55                   	push   %rbp
  80134c:	48 89 e5             	mov    %rsp,%rbp
  80134f:	48 83 ec 34          	sub    $0x34,%rsp
  801353:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801357:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80135b:	89 55 cc             	mov    %edx,-0x34(%rbp)
  80135e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801365:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  80136c:	00 
  80136d:	eb 05                	jmp    801374 <strtol+0x29>
  80136f:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801374:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801378:	0f b6 00             	movzbl (%rax),%eax
  80137b:	3c 20                	cmp    $0x20,%al
  80137d:	74 f0                	je     80136f <strtol+0x24>
  80137f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801383:	0f b6 00             	movzbl (%rax),%eax
  801386:	3c 09                	cmp    $0x9,%al
  801388:	74 e5                	je     80136f <strtol+0x24>
  80138a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80138e:	0f b6 00             	movzbl (%rax),%eax
  801391:	3c 2b                	cmp    $0x2b,%al
  801393:	75 07                	jne    80139c <strtol+0x51>
  801395:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80139a:	eb 17                	jmp    8013b3 <strtol+0x68>
  80139c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8013a0:	0f b6 00             	movzbl (%rax),%eax
  8013a3:	3c 2d                	cmp    $0x2d,%al
  8013a5:	75 0c                	jne    8013b3 <strtol+0x68>
  8013a7:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8013ac:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  8013b3:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8013b7:	74 06                	je     8013bf <strtol+0x74>
  8013b9:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  8013bd:	75 28                	jne    8013e7 <strtol+0x9c>
  8013bf:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8013c3:	0f b6 00             	movzbl (%rax),%eax
  8013c6:	3c 30                	cmp    $0x30,%al
  8013c8:	75 1d                	jne    8013e7 <strtol+0x9c>
  8013ca:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8013ce:	48 83 c0 01          	add    $0x1,%rax
  8013d2:	0f b6 00             	movzbl (%rax),%eax
  8013d5:	3c 78                	cmp    $0x78,%al
  8013d7:	75 0e                	jne    8013e7 <strtol+0x9c>
  8013d9:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  8013de:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  8013e5:	eb 2c                	jmp    801413 <strtol+0xc8>
  8013e7:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8013eb:	75 19                	jne    801406 <strtol+0xbb>
  8013ed:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8013f1:	0f b6 00             	movzbl (%rax),%eax
  8013f4:	3c 30                	cmp    $0x30,%al
  8013f6:	75 0e                	jne    801406 <strtol+0xbb>
  8013f8:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8013fd:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  801404:	eb 0d                	jmp    801413 <strtol+0xc8>
  801406:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  80140a:	75 07                	jne    801413 <strtol+0xc8>
  80140c:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  801413:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801417:	0f b6 00             	movzbl (%rax),%eax
  80141a:	3c 2f                	cmp    $0x2f,%al
  80141c:	7e 1d                	jle    80143b <strtol+0xf0>
  80141e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801422:	0f b6 00             	movzbl (%rax),%eax
  801425:	3c 39                	cmp    $0x39,%al
  801427:	7f 12                	jg     80143b <strtol+0xf0>
  801429:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80142d:	0f b6 00             	movzbl (%rax),%eax
  801430:	0f be c0             	movsbl %al,%eax
  801433:	83 e8 30             	sub    $0x30,%eax
  801436:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801439:	eb 4e                	jmp    801489 <strtol+0x13e>
  80143b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80143f:	0f b6 00             	movzbl (%rax),%eax
  801442:	3c 60                	cmp    $0x60,%al
  801444:	7e 1d                	jle    801463 <strtol+0x118>
  801446:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80144a:	0f b6 00             	movzbl (%rax),%eax
  80144d:	3c 7a                	cmp    $0x7a,%al
  80144f:	7f 12                	jg     801463 <strtol+0x118>
  801451:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801455:	0f b6 00             	movzbl (%rax),%eax
  801458:	0f be c0             	movsbl %al,%eax
  80145b:	83 e8 57             	sub    $0x57,%eax
  80145e:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801461:	eb 26                	jmp    801489 <strtol+0x13e>
  801463:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801467:	0f b6 00             	movzbl (%rax),%eax
  80146a:	3c 40                	cmp    $0x40,%al
  80146c:	7e 48                	jle    8014b6 <strtol+0x16b>
  80146e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801472:	0f b6 00             	movzbl (%rax),%eax
  801475:	3c 5a                	cmp    $0x5a,%al
  801477:	7f 3d                	jg     8014b6 <strtol+0x16b>
  801479:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80147d:	0f b6 00             	movzbl (%rax),%eax
  801480:	0f be c0             	movsbl %al,%eax
  801483:	83 e8 37             	sub    $0x37,%eax
  801486:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801489:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80148c:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  80148f:	7c 02                	jl     801493 <strtol+0x148>
  801491:	eb 23                	jmp    8014b6 <strtol+0x16b>
  801493:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801498:	8b 45 cc             	mov    -0x34(%rbp),%eax
  80149b:	48 98                	cltq   
  80149d:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  8014a2:	48 89 c2             	mov    %rax,%rdx
  8014a5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8014a8:	48 98                	cltq   
  8014aa:	48 01 d0             	add    %rdx,%rax
  8014ad:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8014b1:	e9 5d ff ff ff       	jmpq   801413 <strtol+0xc8>
  8014b6:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  8014bb:	74 0b                	je     8014c8 <strtol+0x17d>
  8014bd:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8014c1:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8014c5:	48 89 10             	mov    %rdx,(%rax)
  8014c8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8014cc:	74 09                	je     8014d7 <strtol+0x18c>
  8014ce:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014d2:	48 f7 d8             	neg    %rax
  8014d5:	eb 04                	jmp    8014db <strtol+0x190>
  8014d7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014db:	c9                   	leaveq 
  8014dc:	c3                   	retq   

00000000008014dd <strstr>:
  8014dd:	55                   	push   %rbp
  8014de:	48 89 e5             	mov    %rsp,%rbp
  8014e1:	48 83 ec 30          	sub    $0x30,%rsp
  8014e5:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8014e9:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8014ed:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8014f1:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8014f5:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  8014f9:	0f b6 00             	movzbl (%rax),%eax
  8014fc:	88 45 ff             	mov    %al,-0x1(%rbp)
  8014ff:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  801503:	75 06                	jne    80150b <strstr+0x2e>
  801505:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801509:	eb 6b                	jmp    801576 <strstr+0x99>
  80150b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80150f:	48 89 c7             	mov    %rax,%rdi
  801512:	48 b8 b3 0d 80 00 00 	movabs $0x800db3,%rax
  801519:	00 00 00 
  80151c:	ff d0                	callq  *%rax
  80151e:	48 98                	cltq   
  801520:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801524:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801528:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80152c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801530:	0f b6 00             	movzbl (%rax),%eax
  801533:	88 45 ef             	mov    %al,-0x11(%rbp)
  801536:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  80153a:	75 07                	jne    801543 <strstr+0x66>
  80153c:	b8 00 00 00 00       	mov    $0x0,%eax
  801541:	eb 33                	jmp    801576 <strstr+0x99>
  801543:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  801547:	3a 45 ff             	cmp    -0x1(%rbp),%al
  80154a:	75 d8                	jne    801524 <strstr+0x47>
  80154c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801550:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  801554:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801558:	48 89 ce             	mov    %rcx,%rsi
  80155b:	48 89 c7             	mov    %rax,%rdi
  80155e:	48 b8 d4 0f 80 00 00 	movabs $0x800fd4,%rax
  801565:	00 00 00 
  801568:	ff d0                	callq  *%rax
  80156a:	85 c0                	test   %eax,%eax
  80156c:	75 b6                	jne    801524 <strstr+0x47>
  80156e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801572:	48 83 e8 01          	sub    $0x1,%rax
  801576:	c9                   	leaveq 
  801577:	c3                   	retq   

0000000000801578 <syscall>:
  801578:	55                   	push   %rbp
  801579:	48 89 e5             	mov    %rsp,%rbp
  80157c:	53                   	push   %rbx
  80157d:	48 83 ec 48          	sub    $0x48,%rsp
  801581:	89 7d dc             	mov    %edi,-0x24(%rbp)
  801584:	89 75 d8             	mov    %esi,-0x28(%rbp)
  801587:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  80158b:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  80158f:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  801593:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  801597:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80159a:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  80159e:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  8015a2:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  8015a6:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  8015aa:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  8015ae:	4c 89 c3             	mov    %r8,%rbx
  8015b1:	cd 30                	int    $0x30
  8015b3:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8015b7:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  8015bb:	74 3e                	je     8015fb <syscall+0x83>
  8015bd:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8015c2:	7e 37                	jle    8015fb <syscall+0x83>
  8015c4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8015c8:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8015cb:	49 89 d0             	mov    %rdx,%r8
  8015ce:	89 c1                	mov    %eax,%ecx
  8015d0:	48 ba 68 45 80 00 00 	movabs $0x804568,%rdx
  8015d7:	00 00 00 
  8015da:	be 24 00 00 00       	mov    $0x24,%esi
  8015df:	48 bf 85 45 80 00 00 	movabs $0x804585,%rdi
  8015e6:	00 00 00 
  8015e9:	b8 00 00 00 00       	mov    $0x0,%eax
  8015ee:	49 b9 df 3c 80 00 00 	movabs $0x803cdf,%r9
  8015f5:	00 00 00 
  8015f8:	41 ff d1             	callq  *%r9
  8015fb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8015ff:	48 83 c4 48          	add    $0x48,%rsp
  801603:	5b                   	pop    %rbx
  801604:	5d                   	pop    %rbp
  801605:	c3                   	retq   

0000000000801606 <sys_cputs>:
  801606:	55                   	push   %rbp
  801607:	48 89 e5             	mov    %rsp,%rbp
  80160a:	48 83 ec 20          	sub    $0x20,%rsp
  80160e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801612:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801616:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80161a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80161e:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801625:	00 
  801626:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80162c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801632:	48 89 d1             	mov    %rdx,%rcx
  801635:	48 89 c2             	mov    %rax,%rdx
  801638:	be 00 00 00 00       	mov    $0x0,%esi
  80163d:	bf 00 00 00 00       	mov    $0x0,%edi
  801642:	48 b8 78 15 80 00 00 	movabs $0x801578,%rax
  801649:	00 00 00 
  80164c:	ff d0                	callq  *%rax
  80164e:	c9                   	leaveq 
  80164f:	c3                   	retq   

0000000000801650 <sys_cgetc>:
  801650:	55                   	push   %rbp
  801651:	48 89 e5             	mov    %rsp,%rbp
  801654:	48 83 ec 10          	sub    $0x10,%rsp
  801658:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80165f:	00 
  801660:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801666:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80166c:	b9 00 00 00 00       	mov    $0x0,%ecx
  801671:	ba 00 00 00 00       	mov    $0x0,%edx
  801676:	be 00 00 00 00       	mov    $0x0,%esi
  80167b:	bf 01 00 00 00       	mov    $0x1,%edi
  801680:	48 b8 78 15 80 00 00 	movabs $0x801578,%rax
  801687:	00 00 00 
  80168a:	ff d0                	callq  *%rax
  80168c:	c9                   	leaveq 
  80168d:	c3                   	retq   

000000000080168e <sys_env_destroy>:
  80168e:	55                   	push   %rbp
  80168f:	48 89 e5             	mov    %rsp,%rbp
  801692:	48 83 ec 10          	sub    $0x10,%rsp
  801696:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801699:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80169c:	48 98                	cltq   
  80169e:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8016a5:	00 
  8016a6:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8016ac:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8016b2:	b9 00 00 00 00       	mov    $0x0,%ecx
  8016b7:	48 89 c2             	mov    %rax,%rdx
  8016ba:	be 01 00 00 00       	mov    $0x1,%esi
  8016bf:	bf 03 00 00 00       	mov    $0x3,%edi
  8016c4:	48 b8 78 15 80 00 00 	movabs $0x801578,%rax
  8016cb:	00 00 00 
  8016ce:	ff d0                	callq  *%rax
  8016d0:	c9                   	leaveq 
  8016d1:	c3                   	retq   

00000000008016d2 <sys_getenvid>:
  8016d2:	55                   	push   %rbp
  8016d3:	48 89 e5             	mov    %rsp,%rbp
  8016d6:	48 83 ec 10          	sub    $0x10,%rsp
  8016da:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8016e1:	00 
  8016e2:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8016e8:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8016ee:	b9 00 00 00 00       	mov    $0x0,%ecx
  8016f3:	ba 00 00 00 00       	mov    $0x0,%edx
  8016f8:	be 00 00 00 00       	mov    $0x0,%esi
  8016fd:	bf 02 00 00 00       	mov    $0x2,%edi
  801702:	48 b8 78 15 80 00 00 	movabs $0x801578,%rax
  801709:	00 00 00 
  80170c:	ff d0                	callq  *%rax
  80170e:	c9                   	leaveq 
  80170f:	c3                   	retq   

0000000000801710 <sys_yield>:
  801710:	55                   	push   %rbp
  801711:	48 89 e5             	mov    %rsp,%rbp
  801714:	48 83 ec 10          	sub    $0x10,%rsp
  801718:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80171f:	00 
  801720:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801726:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80172c:	b9 00 00 00 00       	mov    $0x0,%ecx
  801731:	ba 00 00 00 00       	mov    $0x0,%edx
  801736:	be 00 00 00 00       	mov    $0x0,%esi
  80173b:	bf 0b 00 00 00       	mov    $0xb,%edi
  801740:	48 b8 78 15 80 00 00 	movabs $0x801578,%rax
  801747:	00 00 00 
  80174a:	ff d0                	callq  *%rax
  80174c:	c9                   	leaveq 
  80174d:	c3                   	retq   

000000000080174e <sys_page_alloc>:
  80174e:	55                   	push   %rbp
  80174f:	48 89 e5             	mov    %rsp,%rbp
  801752:	48 83 ec 20          	sub    $0x20,%rsp
  801756:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801759:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80175d:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801760:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801763:	48 63 c8             	movslq %eax,%rcx
  801766:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80176a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80176d:	48 98                	cltq   
  80176f:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801776:	00 
  801777:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80177d:	49 89 c8             	mov    %rcx,%r8
  801780:	48 89 d1             	mov    %rdx,%rcx
  801783:	48 89 c2             	mov    %rax,%rdx
  801786:	be 01 00 00 00       	mov    $0x1,%esi
  80178b:	bf 04 00 00 00       	mov    $0x4,%edi
  801790:	48 b8 78 15 80 00 00 	movabs $0x801578,%rax
  801797:	00 00 00 
  80179a:	ff d0                	callq  *%rax
  80179c:	c9                   	leaveq 
  80179d:	c3                   	retq   

000000000080179e <sys_page_map>:
  80179e:	55                   	push   %rbp
  80179f:	48 89 e5             	mov    %rsp,%rbp
  8017a2:	48 83 ec 30          	sub    $0x30,%rsp
  8017a6:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8017a9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8017ad:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8017b0:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  8017b4:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  8017b8:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8017bb:	48 63 c8             	movslq %eax,%rcx
  8017be:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  8017c2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8017c5:	48 63 f0             	movslq %eax,%rsi
  8017c8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8017cc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8017cf:	48 98                	cltq   
  8017d1:	48 89 0c 24          	mov    %rcx,(%rsp)
  8017d5:	49 89 f9             	mov    %rdi,%r9
  8017d8:	49 89 f0             	mov    %rsi,%r8
  8017db:	48 89 d1             	mov    %rdx,%rcx
  8017de:	48 89 c2             	mov    %rax,%rdx
  8017e1:	be 01 00 00 00       	mov    $0x1,%esi
  8017e6:	bf 05 00 00 00       	mov    $0x5,%edi
  8017eb:	48 b8 78 15 80 00 00 	movabs $0x801578,%rax
  8017f2:	00 00 00 
  8017f5:	ff d0                	callq  *%rax
  8017f7:	c9                   	leaveq 
  8017f8:	c3                   	retq   

00000000008017f9 <sys_page_unmap>:
  8017f9:	55                   	push   %rbp
  8017fa:	48 89 e5             	mov    %rsp,%rbp
  8017fd:	48 83 ec 20          	sub    $0x20,%rsp
  801801:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801804:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801808:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80180c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80180f:	48 98                	cltq   
  801811:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801818:	00 
  801819:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80181f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801825:	48 89 d1             	mov    %rdx,%rcx
  801828:	48 89 c2             	mov    %rax,%rdx
  80182b:	be 01 00 00 00       	mov    $0x1,%esi
  801830:	bf 06 00 00 00       	mov    $0x6,%edi
  801835:	48 b8 78 15 80 00 00 	movabs $0x801578,%rax
  80183c:	00 00 00 
  80183f:	ff d0                	callq  *%rax
  801841:	c9                   	leaveq 
  801842:	c3                   	retq   

0000000000801843 <sys_env_set_status>:
  801843:	55                   	push   %rbp
  801844:	48 89 e5             	mov    %rsp,%rbp
  801847:	48 83 ec 10          	sub    $0x10,%rsp
  80184b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80184e:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801851:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801854:	48 63 d0             	movslq %eax,%rdx
  801857:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80185a:	48 98                	cltq   
  80185c:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801863:	00 
  801864:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80186a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801870:	48 89 d1             	mov    %rdx,%rcx
  801873:	48 89 c2             	mov    %rax,%rdx
  801876:	be 01 00 00 00       	mov    $0x1,%esi
  80187b:	bf 08 00 00 00       	mov    $0x8,%edi
  801880:	48 b8 78 15 80 00 00 	movabs $0x801578,%rax
  801887:	00 00 00 
  80188a:	ff d0                	callq  *%rax
  80188c:	c9                   	leaveq 
  80188d:	c3                   	retq   

000000000080188e <sys_env_set_trapframe>:
  80188e:	55                   	push   %rbp
  80188f:	48 89 e5             	mov    %rsp,%rbp
  801892:	48 83 ec 20          	sub    $0x20,%rsp
  801896:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801899:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80189d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8018a1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8018a4:	48 98                	cltq   
  8018a6:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8018ad:	00 
  8018ae:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8018b4:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8018ba:	48 89 d1             	mov    %rdx,%rcx
  8018bd:	48 89 c2             	mov    %rax,%rdx
  8018c0:	be 01 00 00 00       	mov    $0x1,%esi
  8018c5:	bf 09 00 00 00       	mov    $0x9,%edi
  8018ca:	48 b8 78 15 80 00 00 	movabs $0x801578,%rax
  8018d1:	00 00 00 
  8018d4:	ff d0                	callq  *%rax
  8018d6:	c9                   	leaveq 
  8018d7:	c3                   	retq   

00000000008018d8 <sys_env_set_pgfault_upcall>:
  8018d8:	55                   	push   %rbp
  8018d9:	48 89 e5             	mov    %rsp,%rbp
  8018dc:	48 83 ec 20          	sub    $0x20,%rsp
  8018e0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8018e3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8018e7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8018eb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8018ee:	48 98                	cltq   
  8018f0:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8018f7:	00 
  8018f8:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8018fe:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801904:	48 89 d1             	mov    %rdx,%rcx
  801907:	48 89 c2             	mov    %rax,%rdx
  80190a:	be 01 00 00 00       	mov    $0x1,%esi
  80190f:	bf 0a 00 00 00       	mov    $0xa,%edi
  801914:	48 b8 78 15 80 00 00 	movabs $0x801578,%rax
  80191b:	00 00 00 
  80191e:	ff d0                	callq  *%rax
  801920:	c9                   	leaveq 
  801921:	c3                   	retq   

0000000000801922 <sys_ipc_try_send>:
  801922:	55                   	push   %rbp
  801923:	48 89 e5             	mov    %rsp,%rbp
  801926:	48 83 ec 20          	sub    $0x20,%rsp
  80192a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80192d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801931:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801935:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801938:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80193b:	48 63 f0             	movslq %eax,%rsi
  80193e:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801942:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801945:	48 98                	cltq   
  801947:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80194b:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801952:	00 
  801953:	49 89 f1             	mov    %rsi,%r9
  801956:	49 89 c8             	mov    %rcx,%r8
  801959:	48 89 d1             	mov    %rdx,%rcx
  80195c:	48 89 c2             	mov    %rax,%rdx
  80195f:	be 00 00 00 00       	mov    $0x0,%esi
  801964:	bf 0c 00 00 00       	mov    $0xc,%edi
  801969:	48 b8 78 15 80 00 00 	movabs $0x801578,%rax
  801970:	00 00 00 
  801973:	ff d0                	callq  *%rax
  801975:	c9                   	leaveq 
  801976:	c3                   	retq   

0000000000801977 <sys_ipc_recv>:
  801977:	55                   	push   %rbp
  801978:	48 89 e5             	mov    %rsp,%rbp
  80197b:	48 83 ec 10          	sub    $0x10,%rsp
  80197f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801983:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801987:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80198e:	00 
  80198f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801995:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80199b:	b9 00 00 00 00       	mov    $0x0,%ecx
  8019a0:	48 89 c2             	mov    %rax,%rdx
  8019a3:	be 01 00 00 00       	mov    $0x1,%esi
  8019a8:	bf 0d 00 00 00       	mov    $0xd,%edi
  8019ad:	48 b8 78 15 80 00 00 	movabs $0x801578,%rax
  8019b4:	00 00 00 
  8019b7:	ff d0                	callq  *%rax
  8019b9:	c9                   	leaveq 
  8019ba:	c3                   	retq   

00000000008019bb <sys_time_msec>:
  8019bb:	55                   	push   %rbp
  8019bc:	48 89 e5             	mov    %rsp,%rbp
  8019bf:	48 83 ec 10          	sub    $0x10,%rsp
  8019c3:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8019ca:	00 
  8019cb:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8019d1:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8019d7:	b9 00 00 00 00       	mov    $0x0,%ecx
  8019dc:	ba 00 00 00 00       	mov    $0x0,%edx
  8019e1:	be 00 00 00 00       	mov    $0x0,%esi
  8019e6:	bf 0e 00 00 00       	mov    $0xe,%edi
  8019eb:	48 b8 78 15 80 00 00 	movabs $0x801578,%rax
  8019f2:	00 00 00 
  8019f5:	ff d0                	callq  *%rax
  8019f7:	c9                   	leaveq 
  8019f8:	c3                   	retq   

00000000008019f9 <sys_net_transmit>:
  8019f9:	55                   	push   %rbp
  8019fa:	48 89 e5             	mov    %rsp,%rbp
  8019fd:	48 83 ec 20          	sub    $0x20,%rsp
  801a01:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801a05:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801a08:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801a0b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801a0f:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801a16:	00 
  801a17:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a1d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a23:	48 89 d1             	mov    %rdx,%rcx
  801a26:	48 89 c2             	mov    %rax,%rdx
  801a29:	be 00 00 00 00       	mov    $0x0,%esi
  801a2e:	bf 0f 00 00 00       	mov    $0xf,%edi
  801a33:	48 b8 78 15 80 00 00 	movabs $0x801578,%rax
  801a3a:	00 00 00 
  801a3d:	ff d0                	callq  *%rax
  801a3f:	c9                   	leaveq 
  801a40:	c3                   	retq   

0000000000801a41 <sys_net_receive>:
  801a41:	55                   	push   %rbp
  801a42:	48 89 e5             	mov    %rsp,%rbp
  801a45:	48 83 ec 20          	sub    $0x20,%rsp
  801a49:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801a4d:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801a50:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801a53:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801a57:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801a5e:	00 
  801a5f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a65:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a6b:	48 89 d1             	mov    %rdx,%rcx
  801a6e:	48 89 c2             	mov    %rax,%rdx
  801a71:	be 00 00 00 00       	mov    $0x0,%esi
  801a76:	bf 10 00 00 00       	mov    $0x10,%edi
  801a7b:	48 b8 78 15 80 00 00 	movabs $0x801578,%rax
  801a82:	00 00 00 
  801a85:	ff d0                	callq  *%rax
  801a87:	c9                   	leaveq 
  801a88:	c3                   	retq   

0000000000801a89 <sys_ept_map>:
  801a89:	55                   	push   %rbp
  801a8a:	48 89 e5             	mov    %rsp,%rbp
  801a8d:	48 83 ec 30          	sub    $0x30,%rsp
  801a91:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a94:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a98:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801a9b:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801a9f:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801aa3:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801aa6:	48 63 c8             	movslq %eax,%rcx
  801aa9:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801aad:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801ab0:	48 63 f0             	movslq %eax,%rsi
  801ab3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801ab7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801aba:	48 98                	cltq   
  801abc:	48 89 0c 24          	mov    %rcx,(%rsp)
  801ac0:	49 89 f9             	mov    %rdi,%r9
  801ac3:	49 89 f0             	mov    %rsi,%r8
  801ac6:	48 89 d1             	mov    %rdx,%rcx
  801ac9:	48 89 c2             	mov    %rax,%rdx
  801acc:	be 00 00 00 00       	mov    $0x0,%esi
  801ad1:	bf 11 00 00 00       	mov    $0x11,%edi
  801ad6:	48 b8 78 15 80 00 00 	movabs $0x801578,%rax
  801add:	00 00 00 
  801ae0:	ff d0                	callq  *%rax
  801ae2:	c9                   	leaveq 
  801ae3:	c3                   	retq   

0000000000801ae4 <sys_env_mkguest>:
  801ae4:	55                   	push   %rbp
  801ae5:	48 89 e5             	mov    %rsp,%rbp
  801ae8:	48 83 ec 20          	sub    $0x20,%rsp
  801aec:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801af0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801af4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801af8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801afc:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801b03:	00 
  801b04:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b0a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b10:	48 89 d1             	mov    %rdx,%rcx
  801b13:	48 89 c2             	mov    %rax,%rdx
  801b16:	be 00 00 00 00       	mov    $0x0,%esi
  801b1b:	bf 12 00 00 00       	mov    $0x12,%edi
  801b20:	48 b8 78 15 80 00 00 	movabs $0x801578,%rax
  801b27:	00 00 00 
  801b2a:	ff d0                	callq  *%rax
  801b2c:	c9                   	leaveq 
  801b2d:	c3                   	retq   

0000000000801b2e <sys_vmx_list_vms>:
  801b2e:	55                   	push   %rbp
  801b2f:	48 89 e5             	mov    %rsp,%rbp
  801b32:	48 83 ec 10          	sub    $0x10,%rsp
  801b36:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801b3d:	00 
  801b3e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b44:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b4a:	b9 00 00 00 00       	mov    $0x0,%ecx
  801b4f:	ba 00 00 00 00       	mov    $0x0,%edx
  801b54:	be 00 00 00 00       	mov    $0x0,%esi
  801b59:	bf 13 00 00 00       	mov    $0x13,%edi
  801b5e:	48 b8 78 15 80 00 00 	movabs $0x801578,%rax
  801b65:	00 00 00 
  801b68:	ff d0                	callq  *%rax
  801b6a:	c9                   	leaveq 
  801b6b:	c3                   	retq   

0000000000801b6c <sys_vmx_sel_resume>:
  801b6c:	55                   	push   %rbp
  801b6d:	48 89 e5             	mov    %rsp,%rbp
  801b70:	48 83 ec 10          	sub    $0x10,%rsp
  801b74:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b77:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b7a:	48 98                	cltq   
  801b7c:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801b83:	00 
  801b84:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b8a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b90:	b9 00 00 00 00       	mov    $0x0,%ecx
  801b95:	48 89 c2             	mov    %rax,%rdx
  801b98:	be 00 00 00 00       	mov    $0x0,%esi
  801b9d:	bf 14 00 00 00       	mov    $0x14,%edi
  801ba2:	48 b8 78 15 80 00 00 	movabs $0x801578,%rax
  801ba9:	00 00 00 
  801bac:	ff d0                	callq  *%rax
  801bae:	c9                   	leaveq 
  801baf:	c3                   	retq   

0000000000801bb0 <sys_vmx_get_vmdisk_number>:
  801bb0:	55                   	push   %rbp
  801bb1:	48 89 e5             	mov    %rsp,%rbp
  801bb4:	48 83 ec 10          	sub    $0x10,%rsp
  801bb8:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801bbf:	00 
  801bc0:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801bc6:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801bcc:	b9 00 00 00 00       	mov    $0x0,%ecx
  801bd1:	ba 00 00 00 00       	mov    $0x0,%edx
  801bd6:	be 00 00 00 00       	mov    $0x0,%esi
  801bdb:	bf 15 00 00 00       	mov    $0x15,%edi
  801be0:	48 b8 78 15 80 00 00 	movabs $0x801578,%rax
  801be7:	00 00 00 
  801bea:	ff d0                	callq  *%rax
  801bec:	c9                   	leaveq 
  801bed:	c3                   	retq   

0000000000801bee <sys_vmx_incr_vmdisk_number>:
  801bee:	55                   	push   %rbp
  801bef:	48 89 e5             	mov    %rsp,%rbp
  801bf2:	48 83 ec 10          	sub    $0x10,%rsp
  801bf6:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801bfd:	00 
  801bfe:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c04:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c0a:	b9 00 00 00 00       	mov    $0x0,%ecx
  801c0f:	ba 00 00 00 00       	mov    $0x0,%edx
  801c14:	be 00 00 00 00       	mov    $0x0,%esi
  801c19:	bf 16 00 00 00       	mov    $0x16,%edi
  801c1e:	48 b8 78 15 80 00 00 	movabs $0x801578,%rax
  801c25:	00 00 00 
  801c28:	ff d0                	callq  *%rax
  801c2a:	c9                   	leaveq 
  801c2b:	c3                   	retq   

0000000000801c2c <fd2num>:
  801c2c:	55                   	push   %rbp
  801c2d:	48 89 e5             	mov    %rsp,%rbp
  801c30:	48 83 ec 08          	sub    $0x8,%rsp
  801c34:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c38:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801c3c:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  801c43:	ff ff ff 
  801c46:	48 01 d0             	add    %rdx,%rax
  801c49:	48 c1 e8 0c          	shr    $0xc,%rax
  801c4d:	c9                   	leaveq 
  801c4e:	c3                   	retq   

0000000000801c4f <fd2data>:
  801c4f:	55                   	push   %rbp
  801c50:	48 89 e5             	mov    %rsp,%rbp
  801c53:	48 83 ec 08          	sub    $0x8,%rsp
  801c57:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c5b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c5f:	48 89 c7             	mov    %rax,%rdi
  801c62:	48 b8 2c 1c 80 00 00 	movabs $0x801c2c,%rax
  801c69:	00 00 00 
  801c6c:	ff d0                	callq  *%rax
  801c6e:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  801c74:	48 c1 e0 0c          	shl    $0xc,%rax
  801c78:	c9                   	leaveq 
  801c79:	c3                   	retq   

0000000000801c7a <fd_alloc>:
  801c7a:	55                   	push   %rbp
  801c7b:	48 89 e5             	mov    %rsp,%rbp
  801c7e:	48 83 ec 18          	sub    $0x18,%rsp
  801c82:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801c86:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801c8d:	eb 6b                	jmp    801cfa <fd_alloc+0x80>
  801c8f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c92:	48 98                	cltq   
  801c94:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801c9a:	48 c1 e0 0c          	shl    $0xc,%rax
  801c9e:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801ca2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801ca6:	48 c1 e8 15          	shr    $0x15,%rax
  801caa:	48 89 c2             	mov    %rax,%rdx
  801cad:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  801cb4:	01 00 00 
  801cb7:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801cbb:	83 e0 01             	and    $0x1,%eax
  801cbe:	48 85 c0             	test   %rax,%rax
  801cc1:	74 21                	je     801ce4 <fd_alloc+0x6a>
  801cc3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801cc7:	48 c1 e8 0c          	shr    $0xc,%rax
  801ccb:	48 89 c2             	mov    %rax,%rdx
  801cce:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801cd5:	01 00 00 
  801cd8:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801cdc:	83 e0 01             	and    $0x1,%eax
  801cdf:	48 85 c0             	test   %rax,%rax
  801ce2:	75 12                	jne    801cf6 <fd_alloc+0x7c>
  801ce4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801ce8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801cec:	48 89 10             	mov    %rdx,(%rax)
  801cef:	b8 00 00 00 00       	mov    $0x0,%eax
  801cf4:	eb 1a                	jmp    801d10 <fd_alloc+0x96>
  801cf6:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801cfa:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  801cfe:	7e 8f                	jle    801c8f <fd_alloc+0x15>
  801d00:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801d04:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  801d0b:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  801d10:	c9                   	leaveq 
  801d11:	c3                   	retq   

0000000000801d12 <fd_lookup>:
  801d12:	55                   	push   %rbp
  801d13:	48 89 e5             	mov    %rsp,%rbp
  801d16:	48 83 ec 20          	sub    $0x20,%rsp
  801d1a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801d1d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801d21:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  801d25:	78 06                	js     801d2d <fd_lookup+0x1b>
  801d27:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  801d2b:	7e 07                	jle    801d34 <fd_lookup+0x22>
  801d2d:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801d32:	eb 6c                	jmp    801da0 <fd_lookup+0x8e>
  801d34:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801d37:	48 98                	cltq   
  801d39:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801d3f:	48 c1 e0 0c          	shl    $0xc,%rax
  801d43:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801d47:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d4b:	48 c1 e8 15          	shr    $0x15,%rax
  801d4f:	48 89 c2             	mov    %rax,%rdx
  801d52:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  801d59:	01 00 00 
  801d5c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801d60:	83 e0 01             	and    $0x1,%eax
  801d63:	48 85 c0             	test   %rax,%rax
  801d66:	74 21                	je     801d89 <fd_lookup+0x77>
  801d68:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d6c:	48 c1 e8 0c          	shr    $0xc,%rax
  801d70:	48 89 c2             	mov    %rax,%rdx
  801d73:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801d7a:	01 00 00 
  801d7d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801d81:	83 e0 01             	and    $0x1,%eax
  801d84:	48 85 c0             	test   %rax,%rax
  801d87:	75 07                	jne    801d90 <fd_lookup+0x7e>
  801d89:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801d8e:	eb 10                	jmp    801da0 <fd_lookup+0x8e>
  801d90:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801d94:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801d98:	48 89 10             	mov    %rdx,(%rax)
  801d9b:	b8 00 00 00 00       	mov    $0x0,%eax
  801da0:	c9                   	leaveq 
  801da1:	c3                   	retq   

0000000000801da2 <fd_close>:
  801da2:	55                   	push   %rbp
  801da3:	48 89 e5             	mov    %rsp,%rbp
  801da6:	48 83 ec 30          	sub    $0x30,%rsp
  801daa:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801dae:	89 f0                	mov    %esi,%eax
  801db0:	88 45 d4             	mov    %al,-0x2c(%rbp)
  801db3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801db7:	48 89 c7             	mov    %rax,%rdi
  801dba:	48 b8 2c 1c 80 00 00 	movabs $0x801c2c,%rax
  801dc1:	00 00 00 
  801dc4:	ff d0                	callq  *%rax
  801dc6:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  801dca:	48 89 d6             	mov    %rdx,%rsi
  801dcd:	89 c7                	mov    %eax,%edi
  801dcf:	48 b8 12 1d 80 00 00 	movabs $0x801d12,%rax
  801dd6:	00 00 00 
  801dd9:	ff d0                	callq  *%rax
  801ddb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801dde:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801de2:	78 0a                	js     801dee <fd_close+0x4c>
  801de4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801de8:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  801dec:	74 12                	je     801e00 <fd_close+0x5e>
  801dee:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  801df2:	74 05                	je     801df9 <fd_close+0x57>
  801df4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801df7:	eb 05                	jmp    801dfe <fd_close+0x5c>
  801df9:	b8 00 00 00 00       	mov    $0x0,%eax
  801dfe:	eb 69                	jmp    801e69 <fd_close+0xc7>
  801e00:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e04:	8b 00                	mov    (%rax),%eax
  801e06:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  801e0a:	48 89 d6             	mov    %rdx,%rsi
  801e0d:	89 c7                	mov    %eax,%edi
  801e0f:	48 b8 6b 1e 80 00 00 	movabs $0x801e6b,%rax
  801e16:	00 00 00 
  801e19:	ff d0                	callq  *%rax
  801e1b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801e1e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801e22:	78 2a                	js     801e4e <fd_close+0xac>
  801e24:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801e28:	48 8b 40 20          	mov    0x20(%rax),%rax
  801e2c:	48 85 c0             	test   %rax,%rax
  801e2f:	74 16                	je     801e47 <fd_close+0xa5>
  801e31:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801e35:	48 8b 40 20          	mov    0x20(%rax),%rax
  801e39:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801e3d:	48 89 d7             	mov    %rdx,%rdi
  801e40:	ff d0                	callq  *%rax
  801e42:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801e45:	eb 07                	jmp    801e4e <fd_close+0xac>
  801e47:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801e4e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e52:	48 89 c6             	mov    %rax,%rsi
  801e55:	bf 00 00 00 00       	mov    $0x0,%edi
  801e5a:	48 b8 f9 17 80 00 00 	movabs $0x8017f9,%rax
  801e61:	00 00 00 
  801e64:	ff d0                	callq  *%rax
  801e66:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e69:	c9                   	leaveq 
  801e6a:	c3                   	retq   

0000000000801e6b <dev_lookup>:
  801e6b:	55                   	push   %rbp
  801e6c:	48 89 e5             	mov    %rsp,%rbp
  801e6f:	48 83 ec 20          	sub    $0x20,%rsp
  801e73:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801e76:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801e7a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801e81:	eb 41                	jmp    801ec4 <dev_lookup+0x59>
  801e83:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  801e8a:	00 00 00 
  801e8d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801e90:	48 63 d2             	movslq %edx,%rdx
  801e93:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801e97:	8b 00                	mov    (%rax),%eax
  801e99:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  801e9c:	75 22                	jne    801ec0 <dev_lookup+0x55>
  801e9e:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  801ea5:	00 00 00 
  801ea8:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801eab:	48 63 d2             	movslq %edx,%rdx
  801eae:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  801eb2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801eb6:	48 89 10             	mov    %rdx,(%rax)
  801eb9:	b8 00 00 00 00       	mov    $0x0,%eax
  801ebe:	eb 60                	jmp    801f20 <dev_lookup+0xb5>
  801ec0:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801ec4:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  801ecb:	00 00 00 
  801ece:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801ed1:	48 63 d2             	movslq %edx,%rdx
  801ed4:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801ed8:	48 85 c0             	test   %rax,%rax
  801edb:	75 a6                	jne    801e83 <dev_lookup+0x18>
  801edd:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  801ee4:	00 00 00 
  801ee7:	48 8b 00             	mov    (%rax),%rax
  801eea:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  801ef0:	8b 55 ec             	mov    -0x14(%rbp),%edx
  801ef3:	89 c6                	mov    %eax,%esi
  801ef5:	48 bf 98 45 80 00 00 	movabs $0x804598,%rdi
  801efc:	00 00 00 
  801eff:	b8 00 00 00 00       	mov    $0x0,%eax
  801f04:	48 b9 6a 02 80 00 00 	movabs $0x80026a,%rcx
  801f0b:	00 00 00 
  801f0e:	ff d1                	callq  *%rcx
  801f10:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801f14:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  801f1b:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801f20:	c9                   	leaveq 
  801f21:	c3                   	retq   

0000000000801f22 <close>:
  801f22:	55                   	push   %rbp
  801f23:	48 89 e5             	mov    %rsp,%rbp
  801f26:	48 83 ec 20          	sub    $0x20,%rsp
  801f2a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801f2d:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  801f31:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801f34:	48 89 d6             	mov    %rdx,%rsi
  801f37:	89 c7                	mov    %eax,%edi
  801f39:	48 b8 12 1d 80 00 00 	movabs $0x801d12,%rax
  801f40:	00 00 00 
  801f43:	ff d0                	callq  *%rax
  801f45:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801f48:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801f4c:	79 05                	jns    801f53 <close+0x31>
  801f4e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801f51:	eb 18                	jmp    801f6b <close+0x49>
  801f53:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801f57:	be 01 00 00 00       	mov    $0x1,%esi
  801f5c:	48 89 c7             	mov    %rax,%rdi
  801f5f:	48 b8 a2 1d 80 00 00 	movabs $0x801da2,%rax
  801f66:	00 00 00 
  801f69:	ff d0                	callq  *%rax
  801f6b:	c9                   	leaveq 
  801f6c:	c3                   	retq   

0000000000801f6d <close_all>:
  801f6d:	55                   	push   %rbp
  801f6e:	48 89 e5             	mov    %rsp,%rbp
  801f71:	48 83 ec 10          	sub    $0x10,%rsp
  801f75:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801f7c:	eb 15                	jmp    801f93 <close_all+0x26>
  801f7e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801f81:	89 c7                	mov    %eax,%edi
  801f83:	48 b8 22 1f 80 00 00 	movabs $0x801f22,%rax
  801f8a:	00 00 00 
  801f8d:	ff d0                	callq  *%rax
  801f8f:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801f93:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  801f97:	7e e5                	jle    801f7e <close_all+0x11>
  801f99:	c9                   	leaveq 
  801f9a:	c3                   	retq   

0000000000801f9b <dup>:
  801f9b:	55                   	push   %rbp
  801f9c:	48 89 e5             	mov    %rsp,%rbp
  801f9f:	48 83 ec 40          	sub    $0x40,%rsp
  801fa3:	89 7d cc             	mov    %edi,-0x34(%rbp)
  801fa6:	89 75 c8             	mov    %esi,-0x38(%rbp)
  801fa9:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  801fad:	8b 45 cc             	mov    -0x34(%rbp),%eax
  801fb0:	48 89 d6             	mov    %rdx,%rsi
  801fb3:	89 c7                	mov    %eax,%edi
  801fb5:	48 b8 12 1d 80 00 00 	movabs $0x801d12,%rax
  801fbc:	00 00 00 
  801fbf:	ff d0                	callq  *%rax
  801fc1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801fc4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801fc8:	79 08                	jns    801fd2 <dup+0x37>
  801fca:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801fcd:	e9 70 01 00 00       	jmpq   802142 <dup+0x1a7>
  801fd2:	8b 45 c8             	mov    -0x38(%rbp),%eax
  801fd5:	89 c7                	mov    %eax,%edi
  801fd7:	48 b8 22 1f 80 00 00 	movabs $0x801f22,%rax
  801fde:	00 00 00 
  801fe1:	ff d0                	callq  *%rax
  801fe3:	8b 45 c8             	mov    -0x38(%rbp),%eax
  801fe6:	48 98                	cltq   
  801fe8:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801fee:	48 c1 e0 0c          	shl    $0xc,%rax
  801ff2:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801ff6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ffa:	48 89 c7             	mov    %rax,%rdi
  801ffd:	48 b8 4f 1c 80 00 00 	movabs $0x801c4f,%rax
  802004:	00 00 00 
  802007:	ff d0                	callq  *%rax
  802009:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80200d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802011:	48 89 c7             	mov    %rax,%rdi
  802014:	48 b8 4f 1c 80 00 00 	movabs $0x801c4f,%rax
  80201b:	00 00 00 
  80201e:	ff d0                	callq  *%rax
  802020:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802024:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802028:	48 c1 e8 15          	shr    $0x15,%rax
  80202c:	48 89 c2             	mov    %rax,%rdx
  80202f:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802036:	01 00 00 
  802039:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80203d:	83 e0 01             	and    $0x1,%eax
  802040:	48 85 c0             	test   %rax,%rax
  802043:	74 73                	je     8020b8 <dup+0x11d>
  802045:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802049:	48 c1 e8 0c          	shr    $0xc,%rax
  80204d:	48 89 c2             	mov    %rax,%rdx
  802050:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802057:	01 00 00 
  80205a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80205e:	83 e0 01             	and    $0x1,%eax
  802061:	48 85 c0             	test   %rax,%rax
  802064:	74 52                	je     8020b8 <dup+0x11d>
  802066:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80206a:	48 c1 e8 0c          	shr    $0xc,%rax
  80206e:	48 89 c2             	mov    %rax,%rdx
  802071:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802078:	01 00 00 
  80207b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80207f:	25 07 0e 00 00       	and    $0xe07,%eax
  802084:	89 c1                	mov    %eax,%ecx
  802086:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80208a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80208e:	41 89 c8             	mov    %ecx,%r8d
  802091:	48 89 d1             	mov    %rdx,%rcx
  802094:	ba 00 00 00 00       	mov    $0x0,%edx
  802099:	48 89 c6             	mov    %rax,%rsi
  80209c:	bf 00 00 00 00       	mov    $0x0,%edi
  8020a1:	48 b8 9e 17 80 00 00 	movabs $0x80179e,%rax
  8020a8:	00 00 00 
  8020ab:	ff d0                	callq  *%rax
  8020ad:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8020b0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8020b4:	79 02                	jns    8020b8 <dup+0x11d>
  8020b6:	eb 57                	jmp    80210f <dup+0x174>
  8020b8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8020bc:	48 c1 e8 0c          	shr    $0xc,%rax
  8020c0:	48 89 c2             	mov    %rax,%rdx
  8020c3:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8020ca:	01 00 00 
  8020cd:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8020d1:	25 07 0e 00 00       	and    $0xe07,%eax
  8020d6:	89 c1                	mov    %eax,%ecx
  8020d8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8020dc:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8020e0:	41 89 c8             	mov    %ecx,%r8d
  8020e3:	48 89 d1             	mov    %rdx,%rcx
  8020e6:	ba 00 00 00 00       	mov    $0x0,%edx
  8020eb:	48 89 c6             	mov    %rax,%rsi
  8020ee:	bf 00 00 00 00       	mov    $0x0,%edi
  8020f3:	48 b8 9e 17 80 00 00 	movabs $0x80179e,%rax
  8020fa:	00 00 00 
  8020fd:	ff d0                	callq  *%rax
  8020ff:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802102:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802106:	79 02                	jns    80210a <dup+0x16f>
  802108:	eb 05                	jmp    80210f <dup+0x174>
  80210a:	8b 45 c8             	mov    -0x38(%rbp),%eax
  80210d:	eb 33                	jmp    802142 <dup+0x1a7>
  80210f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802113:	48 89 c6             	mov    %rax,%rsi
  802116:	bf 00 00 00 00       	mov    $0x0,%edi
  80211b:	48 b8 f9 17 80 00 00 	movabs $0x8017f9,%rax
  802122:	00 00 00 
  802125:	ff d0                	callq  *%rax
  802127:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80212b:	48 89 c6             	mov    %rax,%rsi
  80212e:	bf 00 00 00 00       	mov    $0x0,%edi
  802133:	48 b8 f9 17 80 00 00 	movabs $0x8017f9,%rax
  80213a:	00 00 00 
  80213d:	ff d0                	callq  *%rax
  80213f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802142:	c9                   	leaveq 
  802143:	c3                   	retq   

0000000000802144 <read>:
  802144:	55                   	push   %rbp
  802145:	48 89 e5             	mov    %rsp,%rbp
  802148:	48 83 ec 40          	sub    $0x40,%rsp
  80214c:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80214f:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802153:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802157:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80215b:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80215e:	48 89 d6             	mov    %rdx,%rsi
  802161:	89 c7                	mov    %eax,%edi
  802163:	48 b8 12 1d 80 00 00 	movabs $0x801d12,%rax
  80216a:	00 00 00 
  80216d:	ff d0                	callq  *%rax
  80216f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802172:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802176:	78 24                	js     80219c <read+0x58>
  802178:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80217c:	8b 00                	mov    (%rax),%eax
  80217e:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802182:	48 89 d6             	mov    %rdx,%rsi
  802185:	89 c7                	mov    %eax,%edi
  802187:	48 b8 6b 1e 80 00 00 	movabs $0x801e6b,%rax
  80218e:	00 00 00 
  802191:	ff d0                	callq  *%rax
  802193:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802196:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80219a:	79 05                	jns    8021a1 <read+0x5d>
  80219c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80219f:	eb 76                	jmp    802217 <read+0xd3>
  8021a1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8021a5:	8b 40 08             	mov    0x8(%rax),%eax
  8021a8:	83 e0 03             	and    $0x3,%eax
  8021ab:	83 f8 01             	cmp    $0x1,%eax
  8021ae:	75 3a                	jne    8021ea <read+0xa6>
  8021b0:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8021b7:	00 00 00 
  8021ba:	48 8b 00             	mov    (%rax),%rax
  8021bd:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8021c3:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8021c6:	89 c6                	mov    %eax,%esi
  8021c8:	48 bf b7 45 80 00 00 	movabs $0x8045b7,%rdi
  8021cf:	00 00 00 
  8021d2:	b8 00 00 00 00       	mov    $0x0,%eax
  8021d7:	48 b9 6a 02 80 00 00 	movabs $0x80026a,%rcx
  8021de:	00 00 00 
  8021e1:	ff d1                	callq  *%rcx
  8021e3:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8021e8:	eb 2d                	jmp    802217 <read+0xd3>
  8021ea:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8021ee:	48 8b 40 10          	mov    0x10(%rax),%rax
  8021f2:	48 85 c0             	test   %rax,%rax
  8021f5:	75 07                	jne    8021fe <read+0xba>
  8021f7:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8021fc:	eb 19                	jmp    802217 <read+0xd3>
  8021fe:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802202:	48 8b 40 10          	mov    0x10(%rax),%rax
  802206:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80220a:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80220e:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802212:	48 89 cf             	mov    %rcx,%rdi
  802215:	ff d0                	callq  *%rax
  802217:	c9                   	leaveq 
  802218:	c3                   	retq   

0000000000802219 <readn>:
  802219:	55                   	push   %rbp
  80221a:	48 89 e5             	mov    %rsp,%rbp
  80221d:	48 83 ec 30          	sub    $0x30,%rsp
  802221:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802224:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802228:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80222c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802233:	eb 49                	jmp    80227e <readn+0x65>
  802235:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802238:	48 98                	cltq   
  80223a:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80223e:	48 29 c2             	sub    %rax,%rdx
  802241:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802244:	48 63 c8             	movslq %eax,%rcx
  802247:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80224b:	48 01 c1             	add    %rax,%rcx
  80224e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802251:	48 89 ce             	mov    %rcx,%rsi
  802254:	89 c7                	mov    %eax,%edi
  802256:	48 b8 44 21 80 00 00 	movabs $0x802144,%rax
  80225d:	00 00 00 
  802260:	ff d0                	callq  *%rax
  802262:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802265:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802269:	79 05                	jns    802270 <readn+0x57>
  80226b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80226e:	eb 1c                	jmp    80228c <readn+0x73>
  802270:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802274:	75 02                	jne    802278 <readn+0x5f>
  802276:	eb 11                	jmp    802289 <readn+0x70>
  802278:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80227b:	01 45 fc             	add    %eax,-0x4(%rbp)
  80227e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802281:	48 98                	cltq   
  802283:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802287:	72 ac                	jb     802235 <readn+0x1c>
  802289:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80228c:	c9                   	leaveq 
  80228d:	c3                   	retq   

000000000080228e <write>:
  80228e:	55                   	push   %rbp
  80228f:	48 89 e5             	mov    %rsp,%rbp
  802292:	48 83 ec 40          	sub    $0x40,%rsp
  802296:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802299:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80229d:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8022a1:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8022a5:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8022a8:	48 89 d6             	mov    %rdx,%rsi
  8022ab:	89 c7                	mov    %eax,%edi
  8022ad:	48 b8 12 1d 80 00 00 	movabs $0x801d12,%rax
  8022b4:	00 00 00 
  8022b7:	ff d0                	callq  *%rax
  8022b9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8022bc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8022c0:	78 24                	js     8022e6 <write+0x58>
  8022c2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8022c6:	8b 00                	mov    (%rax),%eax
  8022c8:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8022cc:	48 89 d6             	mov    %rdx,%rsi
  8022cf:	89 c7                	mov    %eax,%edi
  8022d1:	48 b8 6b 1e 80 00 00 	movabs $0x801e6b,%rax
  8022d8:	00 00 00 
  8022db:	ff d0                	callq  *%rax
  8022dd:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8022e0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8022e4:	79 05                	jns    8022eb <write+0x5d>
  8022e6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8022e9:	eb 75                	jmp    802360 <write+0xd2>
  8022eb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8022ef:	8b 40 08             	mov    0x8(%rax),%eax
  8022f2:	83 e0 03             	and    $0x3,%eax
  8022f5:	85 c0                	test   %eax,%eax
  8022f7:	75 3a                	jne    802333 <write+0xa5>
  8022f9:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  802300:	00 00 00 
  802303:	48 8b 00             	mov    (%rax),%rax
  802306:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80230c:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80230f:	89 c6                	mov    %eax,%esi
  802311:	48 bf d3 45 80 00 00 	movabs $0x8045d3,%rdi
  802318:	00 00 00 
  80231b:	b8 00 00 00 00       	mov    $0x0,%eax
  802320:	48 b9 6a 02 80 00 00 	movabs $0x80026a,%rcx
  802327:	00 00 00 
  80232a:	ff d1                	callq  *%rcx
  80232c:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802331:	eb 2d                	jmp    802360 <write+0xd2>
  802333:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802337:	48 8b 40 18          	mov    0x18(%rax),%rax
  80233b:	48 85 c0             	test   %rax,%rax
  80233e:	75 07                	jne    802347 <write+0xb9>
  802340:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802345:	eb 19                	jmp    802360 <write+0xd2>
  802347:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80234b:	48 8b 40 18          	mov    0x18(%rax),%rax
  80234f:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802353:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802357:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  80235b:	48 89 cf             	mov    %rcx,%rdi
  80235e:	ff d0                	callq  *%rax
  802360:	c9                   	leaveq 
  802361:	c3                   	retq   

0000000000802362 <seek>:
  802362:	55                   	push   %rbp
  802363:	48 89 e5             	mov    %rsp,%rbp
  802366:	48 83 ec 18          	sub    $0x18,%rsp
  80236a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80236d:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802370:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802374:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802377:	48 89 d6             	mov    %rdx,%rsi
  80237a:	89 c7                	mov    %eax,%edi
  80237c:	48 b8 12 1d 80 00 00 	movabs $0x801d12,%rax
  802383:	00 00 00 
  802386:	ff d0                	callq  *%rax
  802388:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80238b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80238f:	79 05                	jns    802396 <seek+0x34>
  802391:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802394:	eb 0f                	jmp    8023a5 <seek+0x43>
  802396:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80239a:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80239d:	89 50 04             	mov    %edx,0x4(%rax)
  8023a0:	b8 00 00 00 00       	mov    $0x0,%eax
  8023a5:	c9                   	leaveq 
  8023a6:	c3                   	retq   

00000000008023a7 <ftruncate>:
  8023a7:	55                   	push   %rbp
  8023a8:	48 89 e5             	mov    %rsp,%rbp
  8023ab:	48 83 ec 30          	sub    $0x30,%rsp
  8023af:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8023b2:	89 75 d8             	mov    %esi,-0x28(%rbp)
  8023b5:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8023b9:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8023bc:	48 89 d6             	mov    %rdx,%rsi
  8023bf:	89 c7                	mov    %eax,%edi
  8023c1:	48 b8 12 1d 80 00 00 	movabs $0x801d12,%rax
  8023c8:	00 00 00 
  8023cb:	ff d0                	callq  *%rax
  8023cd:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8023d0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8023d4:	78 24                	js     8023fa <ftruncate+0x53>
  8023d6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8023da:	8b 00                	mov    (%rax),%eax
  8023dc:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8023e0:	48 89 d6             	mov    %rdx,%rsi
  8023e3:	89 c7                	mov    %eax,%edi
  8023e5:	48 b8 6b 1e 80 00 00 	movabs $0x801e6b,%rax
  8023ec:	00 00 00 
  8023ef:	ff d0                	callq  *%rax
  8023f1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8023f4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8023f8:	79 05                	jns    8023ff <ftruncate+0x58>
  8023fa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023fd:	eb 72                	jmp    802471 <ftruncate+0xca>
  8023ff:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802403:	8b 40 08             	mov    0x8(%rax),%eax
  802406:	83 e0 03             	and    $0x3,%eax
  802409:	85 c0                	test   %eax,%eax
  80240b:	75 3a                	jne    802447 <ftruncate+0xa0>
  80240d:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  802414:	00 00 00 
  802417:	48 8b 00             	mov    (%rax),%rax
  80241a:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802420:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802423:	89 c6                	mov    %eax,%esi
  802425:	48 bf f0 45 80 00 00 	movabs $0x8045f0,%rdi
  80242c:	00 00 00 
  80242f:	b8 00 00 00 00       	mov    $0x0,%eax
  802434:	48 b9 6a 02 80 00 00 	movabs $0x80026a,%rcx
  80243b:	00 00 00 
  80243e:	ff d1                	callq  *%rcx
  802440:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802445:	eb 2a                	jmp    802471 <ftruncate+0xca>
  802447:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80244b:	48 8b 40 30          	mov    0x30(%rax),%rax
  80244f:	48 85 c0             	test   %rax,%rax
  802452:	75 07                	jne    80245b <ftruncate+0xb4>
  802454:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802459:	eb 16                	jmp    802471 <ftruncate+0xca>
  80245b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80245f:	48 8b 40 30          	mov    0x30(%rax),%rax
  802463:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802467:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  80246a:	89 ce                	mov    %ecx,%esi
  80246c:	48 89 d7             	mov    %rdx,%rdi
  80246f:	ff d0                	callq  *%rax
  802471:	c9                   	leaveq 
  802472:	c3                   	retq   

0000000000802473 <fstat>:
  802473:	55                   	push   %rbp
  802474:	48 89 e5             	mov    %rsp,%rbp
  802477:	48 83 ec 30          	sub    $0x30,%rsp
  80247b:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80247e:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802482:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802486:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802489:	48 89 d6             	mov    %rdx,%rsi
  80248c:	89 c7                	mov    %eax,%edi
  80248e:	48 b8 12 1d 80 00 00 	movabs $0x801d12,%rax
  802495:	00 00 00 
  802498:	ff d0                	callq  *%rax
  80249a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80249d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8024a1:	78 24                	js     8024c7 <fstat+0x54>
  8024a3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8024a7:	8b 00                	mov    (%rax),%eax
  8024a9:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8024ad:	48 89 d6             	mov    %rdx,%rsi
  8024b0:	89 c7                	mov    %eax,%edi
  8024b2:	48 b8 6b 1e 80 00 00 	movabs $0x801e6b,%rax
  8024b9:	00 00 00 
  8024bc:	ff d0                	callq  *%rax
  8024be:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8024c1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8024c5:	79 05                	jns    8024cc <fstat+0x59>
  8024c7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024ca:	eb 5e                	jmp    80252a <fstat+0xb7>
  8024cc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8024d0:	48 8b 40 28          	mov    0x28(%rax),%rax
  8024d4:	48 85 c0             	test   %rax,%rax
  8024d7:	75 07                	jne    8024e0 <fstat+0x6d>
  8024d9:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8024de:	eb 4a                	jmp    80252a <fstat+0xb7>
  8024e0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8024e4:	c6 00 00             	movb   $0x0,(%rax)
  8024e7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8024eb:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  8024f2:	00 00 00 
  8024f5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8024f9:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  802500:	00 00 00 
  802503:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802507:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80250b:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  802512:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802516:	48 8b 40 28          	mov    0x28(%rax),%rax
  80251a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80251e:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  802522:	48 89 ce             	mov    %rcx,%rsi
  802525:	48 89 d7             	mov    %rdx,%rdi
  802528:	ff d0                	callq  *%rax
  80252a:	c9                   	leaveq 
  80252b:	c3                   	retq   

000000000080252c <stat>:
  80252c:	55                   	push   %rbp
  80252d:	48 89 e5             	mov    %rsp,%rbp
  802530:	48 83 ec 20          	sub    $0x20,%rsp
  802534:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802538:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80253c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802540:	be 00 00 00 00       	mov    $0x0,%esi
  802545:	48 89 c7             	mov    %rax,%rdi
  802548:	48 b8 1a 26 80 00 00 	movabs $0x80261a,%rax
  80254f:	00 00 00 
  802552:	ff d0                	callq  *%rax
  802554:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802557:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80255b:	79 05                	jns    802562 <stat+0x36>
  80255d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802560:	eb 2f                	jmp    802591 <stat+0x65>
  802562:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802566:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802569:	48 89 d6             	mov    %rdx,%rsi
  80256c:	89 c7                	mov    %eax,%edi
  80256e:	48 b8 73 24 80 00 00 	movabs $0x802473,%rax
  802575:	00 00 00 
  802578:	ff d0                	callq  *%rax
  80257a:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80257d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802580:	89 c7                	mov    %eax,%edi
  802582:	48 b8 22 1f 80 00 00 	movabs $0x801f22,%rax
  802589:	00 00 00 
  80258c:	ff d0                	callq  *%rax
  80258e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802591:	c9                   	leaveq 
  802592:	c3                   	retq   

0000000000802593 <fsipc>:
  802593:	55                   	push   %rbp
  802594:	48 89 e5             	mov    %rsp,%rbp
  802597:	48 83 ec 10          	sub    $0x10,%rsp
  80259b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80259e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8025a2:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8025a9:	00 00 00 
  8025ac:	8b 00                	mov    (%rax),%eax
  8025ae:	85 c0                	test   %eax,%eax
  8025b0:	75 1d                	jne    8025cf <fsipc+0x3c>
  8025b2:	bf 01 00 00 00       	mov    $0x1,%edi
  8025b7:	48 b8 4a 3f 80 00 00 	movabs $0x803f4a,%rax
  8025be:	00 00 00 
  8025c1:	ff d0                	callq  *%rax
  8025c3:	48 ba 00 70 80 00 00 	movabs $0x807000,%rdx
  8025ca:	00 00 00 
  8025cd:	89 02                	mov    %eax,(%rdx)
  8025cf:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8025d6:	00 00 00 
  8025d9:	8b 00                	mov    (%rax),%eax
  8025db:	8b 75 fc             	mov    -0x4(%rbp),%esi
  8025de:	b9 07 00 00 00       	mov    $0x7,%ecx
  8025e3:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  8025ea:	00 00 00 
  8025ed:	89 c7                	mov    %eax,%edi
  8025ef:	48 b8 b4 3e 80 00 00 	movabs $0x803eb4,%rax
  8025f6:	00 00 00 
  8025f9:	ff d0                	callq  *%rax
  8025fb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8025ff:	ba 00 00 00 00       	mov    $0x0,%edx
  802604:	48 89 c6             	mov    %rax,%rsi
  802607:	bf 00 00 00 00       	mov    $0x0,%edi
  80260c:	48 b8 f3 3d 80 00 00 	movabs $0x803df3,%rax
  802613:	00 00 00 
  802616:	ff d0                	callq  *%rax
  802618:	c9                   	leaveq 
  802619:	c3                   	retq   

000000000080261a <open>:
  80261a:	55                   	push   %rbp
  80261b:	48 89 e5             	mov    %rsp,%rbp
  80261e:	48 83 ec 20          	sub    $0x20,%rsp
  802622:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802626:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  802629:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80262d:	48 89 c7             	mov    %rax,%rdi
  802630:	48 b8 b3 0d 80 00 00 	movabs $0x800db3,%rax
  802637:	00 00 00 
  80263a:	ff d0                	callq  *%rax
  80263c:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802641:	7e 0a                	jle    80264d <open+0x33>
  802643:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802648:	e9 a5 00 00 00       	jmpq   8026f2 <open+0xd8>
  80264d:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802651:	48 89 c7             	mov    %rax,%rdi
  802654:	48 b8 7a 1c 80 00 00 	movabs $0x801c7a,%rax
  80265b:	00 00 00 
  80265e:	ff d0                	callq  *%rax
  802660:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802663:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802667:	79 08                	jns    802671 <open+0x57>
  802669:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80266c:	e9 81 00 00 00       	jmpq   8026f2 <open+0xd8>
  802671:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802675:	48 89 c6             	mov    %rax,%rsi
  802678:	48 bf 00 80 80 00 00 	movabs $0x808000,%rdi
  80267f:	00 00 00 
  802682:	48 b8 1f 0e 80 00 00 	movabs $0x800e1f,%rax
  802689:	00 00 00 
  80268c:	ff d0                	callq  *%rax
  80268e:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802695:	00 00 00 
  802698:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  80269b:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  8026a1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8026a5:	48 89 c6             	mov    %rax,%rsi
  8026a8:	bf 01 00 00 00       	mov    $0x1,%edi
  8026ad:	48 b8 93 25 80 00 00 	movabs $0x802593,%rax
  8026b4:	00 00 00 
  8026b7:	ff d0                	callq  *%rax
  8026b9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8026bc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8026c0:	79 1d                	jns    8026df <open+0xc5>
  8026c2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8026c6:	be 00 00 00 00       	mov    $0x0,%esi
  8026cb:	48 89 c7             	mov    %rax,%rdi
  8026ce:	48 b8 a2 1d 80 00 00 	movabs $0x801da2,%rax
  8026d5:	00 00 00 
  8026d8:	ff d0                	callq  *%rax
  8026da:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8026dd:	eb 13                	jmp    8026f2 <open+0xd8>
  8026df:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8026e3:	48 89 c7             	mov    %rax,%rdi
  8026e6:	48 b8 2c 1c 80 00 00 	movabs $0x801c2c,%rax
  8026ed:	00 00 00 
  8026f0:	ff d0                	callq  *%rax
  8026f2:	c9                   	leaveq 
  8026f3:	c3                   	retq   

00000000008026f4 <devfile_flush>:
  8026f4:	55                   	push   %rbp
  8026f5:	48 89 e5             	mov    %rsp,%rbp
  8026f8:	48 83 ec 10          	sub    $0x10,%rsp
  8026fc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802700:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802704:	8b 50 0c             	mov    0xc(%rax),%edx
  802707:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80270e:	00 00 00 
  802711:	89 10                	mov    %edx,(%rax)
  802713:	be 00 00 00 00       	mov    $0x0,%esi
  802718:	bf 06 00 00 00       	mov    $0x6,%edi
  80271d:	48 b8 93 25 80 00 00 	movabs $0x802593,%rax
  802724:	00 00 00 
  802727:	ff d0                	callq  *%rax
  802729:	c9                   	leaveq 
  80272a:	c3                   	retq   

000000000080272b <devfile_read>:
  80272b:	55                   	push   %rbp
  80272c:	48 89 e5             	mov    %rsp,%rbp
  80272f:	48 83 ec 30          	sub    $0x30,%rsp
  802733:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802737:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80273b:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80273f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802743:	8b 50 0c             	mov    0xc(%rax),%edx
  802746:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80274d:	00 00 00 
  802750:	89 10                	mov    %edx,(%rax)
  802752:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802759:	00 00 00 
  80275c:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802760:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802764:	be 00 00 00 00       	mov    $0x0,%esi
  802769:	bf 03 00 00 00       	mov    $0x3,%edi
  80276e:	48 b8 93 25 80 00 00 	movabs $0x802593,%rax
  802775:	00 00 00 
  802778:	ff d0                	callq  *%rax
  80277a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80277d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802781:	79 08                	jns    80278b <devfile_read+0x60>
  802783:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802786:	e9 a4 00 00 00       	jmpq   80282f <devfile_read+0x104>
  80278b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80278e:	48 98                	cltq   
  802790:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802794:	76 35                	jbe    8027cb <devfile_read+0xa0>
  802796:	48 b9 16 46 80 00 00 	movabs $0x804616,%rcx
  80279d:	00 00 00 
  8027a0:	48 ba 1d 46 80 00 00 	movabs $0x80461d,%rdx
  8027a7:	00 00 00 
  8027aa:	be 89 00 00 00       	mov    $0x89,%esi
  8027af:	48 bf 32 46 80 00 00 	movabs $0x804632,%rdi
  8027b6:	00 00 00 
  8027b9:	b8 00 00 00 00       	mov    $0x0,%eax
  8027be:	49 b8 df 3c 80 00 00 	movabs $0x803cdf,%r8
  8027c5:	00 00 00 
  8027c8:	41 ff d0             	callq  *%r8
  8027cb:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  8027d2:	7e 35                	jle    802809 <devfile_read+0xde>
  8027d4:	48 b9 40 46 80 00 00 	movabs $0x804640,%rcx
  8027db:	00 00 00 
  8027de:	48 ba 1d 46 80 00 00 	movabs $0x80461d,%rdx
  8027e5:	00 00 00 
  8027e8:	be 8a 00 00 00       	mov    $0x8a,%esi
  8027ed:	48 bf 32 46 80 00 00 	movabs $0x804632,%rdi
  8027f4:	00 00 00 
  8027f7:	b8 00 00 00 00       	mov    $0x0,%eax
  8027fc:	49 b8 df 3c 80 00 00 	movabs $0x803cdf,%r8
  802803:	00 00 00 
  802806:	41 ff d0             	callq  *%r8
  802809:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80280c:	48 63 d0             	movslq %eax,%rdx
  80280f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802813:	48 be 00 80 80 00 00 	movabs $0x808000,%rsi
  80281a:	00 00 00 
  80281d:	48 89 c7             	mov    %rax,%rdi
  802820:	48 b8 43 11 80 00 00 	movabs $0x801143,%rax
  802827:	00 00 00 
  80282a:	ff d0                	callq  *%rax
  80282c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80282f:	c9                   	leaveq 
  802830:	c3                   	retq   

0000000000802831 <devfile_write>:
  802831:	55                   	push   %rbp
  802832:	48 89 e5             	mov    %rsp,%rbp
  802835:	48 83 ec 40          	sub    $0x40,%rsp
  802839:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80283d:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802841:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802845:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  802849:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80284d:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  802854:	00 
  802855:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802859:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  80285d:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  802862:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  802866:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80286a:	8b 50 0c             	mov    0xc(%rax),%edx
  80286d:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802874:	00 00 00 
  802877:	89 10                	mov    %edx,(%rax)
  802879:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802880:	00 00 00 
  802883:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802887:	48 89 50 08          	mov    %rdx,0x8(%rax)
  80288b:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80288f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802893:	48 89 c6             	mov    %rax,%rsi
  802896:	48 bf 10 80 80 00 00 	movabs $0x808010,%rdi
  80289d:	00 00 00 
  8028a0:	48 b8 43 11 80 00 00 	movabs $0x801143,%rax
  8028a7:	00 00 00 
  8028aa:	ff d0                	callq  *%rax
  8028ac:	be 00 00 00 00       	mov    $0x0,%esi
  8028b1:	bf 04 00 00 00       	mov    $0x4,%edi
  8028b6:	48 b8 93 25 80 00 00 	movabs $0x802593,%rax
  8028bd:	00 00 00 
  8028c0:	ff d0                	callq  *%rax
  8028c2:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8028c5:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8028c9:	79 05                	jns    8028d0 <devfile_write+0x9f>
  8028cb:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8028ce:	eb 43                	jmp    802913 <devfile_write+0xe2>
  8028d0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8028d3:	48 98                	cltq   
  8028d5:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8028d9:	76 35                	jbe    802910 <devfile_write+0xdf>
  8028db:	48 b9 16 46 80 00 00 	movabs $0x804616,%rcx
  8028e2:	00 00 00 
  8028e5:	48 ba 1d 46 80 00 00 	movabs $0x80461d,%rdx
  8028ec:	00 00 00 
  8028ef:	be a8 00 00 00       	mov    $0xa8,%esi
  8028f4:	48 bf 32 46 80 00 00 	movabs $0x804632,%rdi
  8028fb:	00 00 00 
  8028fe:	b8 00 00 00 00       	mov    $0x0,%eax
  802903:	49 b8 df 3c 80 00 00 	movabs $0x803cdf,%r8
  80290a:	00 00 00 
  80290d:	41 ff d0             	callq  *%r8
  802910:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802913:	c9                   	leaveq 
  802914:	c3                   	retq   

0000000000802915 <devfile_stat>:
  802915:	55                   	push   %rbp
  802916:	48 89 e5             	mov    %rsp,%rbp
  802919:	48 83 ec 20          	sub    $0x20,%rsp
  80291d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802921:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802925:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802929:	8b 50 0c             	mov    0xc(%rax),%edx
  80292c:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802933:	00 00 00 
  802936:	89 10                	mov    %edx,(%rax)
  802938:	be 00 00 00 00       	mov    $0x0,%esi
  80293d:	bf 05 00 00 00       	mov    $0x5,%edi
  802942:	48 b8 93 25 80 00 00 	movabs $0x802593,%rax
  802949:	00 00 00 
  80294c:	ff d0                	callq  *%rax
  80294e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802951:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802955:	79 05                	jns    80295c <devfile_stat+0x47>
  802957:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80295a:	eb 56                	jmp    8029b2 <devfile_stat+0x9d>
  80295c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802960:	48 be 00 80 80 00 00 	movabs $0x808000,%rsi
  802967:	00 00 00 
  80296a:	48 89 c7             	mov    %rax,%rdi
  80296d:	48 b8 1f 0e 80 00 00 	movabs $0x800e1f,%rax
  802974:	00 00 00 
  802977:	ff d0                	callq  *%rax
  802979:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802980:	00 00 00 
  802983:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  802989:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80298d:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  802993:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80299a:	00 00 00 
  80299d:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  8029a3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8029a7:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  8029ad:	b8 00 00 00 00       	mov    $0x0,%eax
  8029b2:	c9                   	leaveq 
  8029b3:	c3                   	retq   

00000000008029b4 <devfile_trunc>:
  8029b4:	55                   	push   %rbp
  8029b5:	48 89 e5             	mov    %rsp,%rbp
  8029b8:	48 83 ec 10          	sub    $0x10,%rsp
  8029bc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8029c0:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8029c3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8029c7:	8b 50 0c             	mov    0xc(%rax),%edx
  8029ca:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8029d1:	00 00 00 
  8029d4:	89 10                	mov    %edx,(%rax)
  8029d6:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8029dd:	00 00 00 
  8029e0:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8029e3:	89 50 04             	mov    %edx,0x4(%rax)
  8029e6:	be 00 00 00 00       	mov    $0x0,%esi
  8029eb:	bf 02 00 00 00       	mov    $0x2,%edi
  8029f0:	48 b8 93 25 80 00 00 	movabs $0x802593,%rax
  8029f7:	00 00 00 
  8029fa:	ff d0                	callq  *%rax
  8029fc:	c9                   	leaveq 
  8029fd:	c3                   	retq   

00000000008029fe <remove>:
  8029fe:	55                   	push   %rbp
  8029ff:	48 89 e5             	mov    %rsp,%rbp
  802a02:	48 83 ec 10          	sub    $0x10,%rsp
  802a06:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802a0a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802a0e:	48 89 c7             	mov    %rax,%rdi
  802a11:	48 b8 b3 0d 80 00 00 	movabs $0x800db3,%rax
  802a18:	00 00 00 
  802a1b:	ff d0                	callq  *%rax
  802a1d:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802a22:	7e 07                	jle    802a2b <remove+0x2d>
  802a24:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802a29:	eb 33                	jmp    802a5e <remove+0x60>
  802a2b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802a2f:	48 89 c6             	mov    %rax,%rsi
  802a32:	48 bf 00 80 80 00 00 	movabs $0x808000,%rdi
  802a39:	00 00 00 
  802a3c:	48 b8 1f 0e 80 00 00 	movabs $0x800e1f,%rax
  802a43:	00 00 00 
  802a46:	ff d0                	callq  *%rax
  802a48:	be 00 00 00 00       	mov    $0x0,%esi
  802a4d:	bf 07 00 00 00       	mov    $0x7,%edi
  802a52:	48 b8 93 25 80 00 00 	movabs $0x802593,%rax
  802a59:	00 00 00 
  802a5c:	ff d0                	callq  *%rax
  802a5e:	c9                   	leaveq 
  802a5f:	c3                   	retq   

0000000000802a60 <sync>:
  802a60:	55                   	push   %rbp
  802a61:	48 89 e5             	mov    %rsp,%rbp
  802a64:	be 00 00 00 00       	mov    $0x0,%esi
  802a69:	bf 08 00 00 00       	mov    $0x8,%edi
  802a6e:	48 b8 93 25 80 00 00 	movabs $0x802593,%rax
  802a75:	00 00 00 
  802a78:	ff d0                	callq  *%rax
  802a7a:	5d                   	pop    %rbp
  802a7b:	c3                   	retq   

0000000000802a7c <copy>:
  802a7c:	55                   	push   %rbp
  802a7d:	48 89 e5             	mov    %rsp,%rbp
  802a80:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  802a87:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  802a8e:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  802a95:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  802a9c:	be 00 00 00 00       	mov    $0x0,%esi
  802aa1:	48 89 c7             	mov    %rax,%rdi
  802aa4:	48 b8 1a 26 80 00 00 	movabs $0x80261a,%rax
  802aab:	00 00 00 
  802aae:	ff d0                	callq  *%rax
  802ab0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ab3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ab7:	79 28                	jns    802ae1 <copy+0x65>
  802ab9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802abc:	89 c6                	mov    %eax,%esi
  802abe:	48 bf 4c 46 80 00 00 	movabs $0x80464c,%rdi
  802ac5:	00 00 00 
  802ac8:	b8 00 00 00 00       	mov    $0x0,%eax
  802acd:	48 ba 6a 02 80 00 00 	movabs $0x80026a,%rdx
  802ad4:	00 00 00 
  802ad7:	ff d2                	callq  *%rdx
  802ad9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802adc:	e9 74 01 00 00       	jmpq   802c55 <copy+0x1d9>
  802ae1:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  802ae8:	be 01 01 00 00       	mov    $0x101,%esi
  802aed:	48 89 c7             	mov    %rax,%rdi
  802af0:	48 b8 1a 26 80 00 00 	movabs $0x80261a,%rax
  802af7:	00 00 00 
  802afa:	ff d0                	callq  *%rax
  802afc:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802aff:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802b03:	79 39                	jns    802b3e <copy+0xc2>
  802b05:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802b08:	89 c6                	mov    %eax,%esi
  802b0a:	48 bf 62 46 80 00 00 	movabs $0x804662,%rdi
  802b11:	00 00 00 
  802b14:	b8 00 00 00 00       	mov    $0x0,%eax
  802b19:	48 ba 6a 02 80 00 00 	movabs $0x80026a,%rdx
  802b20:	00 00 00 
  802b23:	ff d2                	callq  *%rdx
  802b25:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b28:	89 c7                	mov    %eax,%edi
  802b2a:	48 b8 22 1f 80 00 00 	movabs $0x801f22,%rax
  802b31:	00 00 00 
  802b34:	ff d0                	callq  *%rax
  802b36:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802b39:	e9 17 01 00 00       	jmpq   802c55 <copy+0x1d9>
  802b3e:	eb 74                	jmp    802bb4 <copy+0x138>
  802b40:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802b43:	48 63 d0             	movslq %eax,%rdx
  802b46:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802b4d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802b50:	48 89 ce             	mov    %rcx,%rsi
  802b53:	89 c7                	mov    %eax,%edi
  802b55:	48 b8 8e 22 80 00 00 	movabs $0x80228e,%rax
  802b5c:	00 00 00 
  802b5f:	ff d0                	callq  *%rax
  802b61:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802b64:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802b68:	79 4a                	jns    802bb4 <copy+0x138>
  802b6a:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802b6d:	89 c6                	mov    %eax,%esi
  802b6f:	48 bf 7c 46 80 00 00 	movabs $0x80467c,%rdi
  802b76:	00 00 00 
  802b79:	b8 00 00 00 00       	mov    $0x0,%eax
  802b7e:	48 ba 6a 02 80 00 00 	movabs $0x80026a,%rdx
  802b85:	00 00 00 
  802b88:	ff d2                	callq  *%rdx
  802b8a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b8d:	89 c7                	mov    %eax,%edi
  802b8f:	48 b8 22 1f 80 00 00 	movabs $0x801f22,%rax
  802b96:	00 00 00 
  802b99:	ff d0                	callq  *%rax
  802b9b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802b9e:	89 c7                	mov    %eax,%edi
  802ba0:	48 b8 22 1f 80 00 00 	movabs $0x801f22,%rax
  802ba7:	00 00 00 
  802baa:	ff d0                	callq  *%rax
  802bac:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802baf:	e9 a1 00 00 00       	jmpq   802c55 <copy+0x1d9>
  802bb4:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802bbb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802bbe:	ba 00 02 00 00       	mov    $0x200,%edx
  802bc3:	48 89 ce             	mov    %rcx,%rsi
  802bc6:	89 c7                	mov    %eax,%edi
  802bc8:	48 b8 44 21 80 00 00 	movabs $0x802144,%rax
  802bcf:	00 00 00 
  802bd2:	ff d0                	callq  *%rax
  802bd4:	89 45 f4             	mov    %eax,-0xc(%rbp)
  802bd7:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802bdb:	0f 8f 5f ff ff ff    	jg     802b40 <copy+0xc4>
  802be1:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802be5:	79 47                	jns    802c2e <copy+0x1b2>
  802be7:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802bea:	89 c6                	mov    %eax,%esi
  802bec:	48 bf 8f 46 80 00 00 	movabs $0x80468f,%rdi
  802bf3:	00 00 00 
  802bf6:	b8 00 00 00 00       	mov    $0x0,%eax
  802bfb:	48 ba 6a 02 80 00 00 	movabs $0x80026a,%rdx
  802c02:	00 00 00 
  802c05:	ff d2                	callq  *%rdx
  802c07:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c0a:	89 c7                	mov    %eax,%edi
  802c0c:	48 b8 22 1f 80 00 00 	movabs $0x801f22,%rax
  802c13:	00 00 00 
  802c16:	ff d0                	callq  *%rax
  802c18:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802c1b:	89 c7                	mov    %eax,%edi
  802c1d:	48 b8 22 1f 80 00 00 	movabs $0x801f22,%rax
  802c24:	00 00 00 
  802c27:	ff d0                	callq  *%rax
  802c29:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802c2c:	eb 27                	jmp    802c55 <copy+0x1d9>
  802c2e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c31:	89 c7                	mov    %eax,%edi
  802c33:	48 b8 22 1f 80 00 00 	movabs $0x801f22,%rax
  802c3a:	00 00 00 
  802c3d:	ff d0                	callq  *%rax
  802c3f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802c42:	89 c7                	mov    %eax,%edi
  802c44:	48 b8 22 1f 80 00 00 	movabs $0x801f22,%rax
  802c4b:	00 00 00 
  802c4e:	ff d0                	callq  *%rax
  802c50:	b8 00 00 00 00       	mov    $0x0,%eax
  802c55:	c9                   	leaveq 
  802c56:	c3                   	retq   

0000000000802c57 <fd2sockid>:
  802c57:	55                   	push   %rbp
  802c58:	48 89 e5             	mov    %rsp,%rbp
  802c5b:	48 83 ec 20          	sub    $0x20,%rsp
  802c5f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802c62:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802c66:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802c69:	48 89 d6             	mov    %rdx,%rsi
  802c6c:	89 c7                	mov    %eax,%edi
  802c6e:	48 b8 12 1d 80 00 00 	movabs $0x801d12,%rax
  802c75:	00 00 00 
  802c78:	ff d0                	callq  *%rax
  802c7a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c7d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c81:	79 05                	jns    802c88 <fd2sockid+0x31>
  802c83:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c86:	eb 24                	jmp    802cac <fd2sockid+0x55>
  802c88:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802c8c:	8b 10                	mov    (%rax),%edx
  802c8e:	48 b8 a0 60 80 00 00 	movabs $0x8060a0,%rax
  802c95:	00 00 00 
  802c98:	8b 00                	mov    (%rax),%eax
  802c9a:	39 c2                	cmp    %eax,%edx
  802c9c:	74 07                	je     802ca5 <fd2sockid+0x4e>
  802c9e:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802ca3:	eb 07                	jmp    802cac <fd2sockid+0x55>
  802ca5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ca9:	8b 40 0c             	mov    0xc(%rax),%eax
  802cac:	c9                   	leaveq 
  802cad:	c3                   	retq   

0000000000802cae <alloc_sockfd>:
  802cae:	55                   	push   %rbp
  802caf:	48 89 e5             	mov    %rsp,%rbp
  802cb2:	48 83 ec 20          	sub    $0x20,%rsp
  802cb6:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802cb9:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802cbd:	48 89 c7             	mov    %rax,%rdi
  802cc0:	48 b8 7a 1c 80 00 00 	movabs $0x801c7a,%rax
  802cc7:	00 00 00 
  802cca:	ff d0                	callq  *%rax
  802ccc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ccf:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802cd3:	78 26                	js     802cfb <alloc_sockfd+0x4d>
  802cd5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802cd9:	ba 07 04 00 00       	mov    $0x407,%edx
  802cde:	48 89 c6             	mov    %rax,%rsi
  802ce1:	bf 00 00 00 00       	mov    $0x0,%edi
  802ce6:	48 b8 4e 17 80 00 00 	movabs $0x80174e,%rax
  802ced:	00 00 00 
  802cf0:	ff d0                	callq  *%rax
  802cf2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802cf5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802cf9:	79 16                	jns    802d11 <alloc_sockfd+0x63>
  802cfb:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802cfe:	89 c7                	mov    %eax,%edi
  802d00:	48 b8 bb 31 80 00 00 	movabs $0x8031bb,%rax
  802d07:	00 00 00 
  802d0a:	ff d0                	callq  *%rax
  802d0c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d0f:	eb 3a                	jmp    802d4b <alloc_sockfd+0x9d>
  802d11:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d15:	48 ba a0 60 80 00 00 	movabs $0x8060a0,%rdx
  802d1c:	00 00 00 
  802d1f:	8b 12                	mov    (%rdx),%edx
  802d21:	89 10                	mov    %edx,(%rax)
  802d23:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d27:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  802d2e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d32:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802d35:	89 50 0c             	mov    %edx,0xc(%rax)
  802d38:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d3c:	48 89 c7             	mov    %rax,%rdi
  802d3f:	48 b8 2c 1c 80 00 00 	movabs $0x801c2c,%rax
  802d46:	00 00 00 
  802d49:	ff d0                	callq  *%rax
  802d4b:	c9                   	leaveq 
  802d4c:	c3                   	retq   

0000000000802d4d <accept>:
  802d4d:	55                   	push   %rbp
  802d4e:	48 89 e5             	mov    %rsp,%rbp
  802d51:	48 83 ec 30          	sub    $0x30,%rsp
  802d55:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802d58:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802d5c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802d60:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802d63:	89 c7                	mov    %eax,%edi
  802d65:	48 b8 57 2c 80 00 00 	movabs $0x802c57,%rax
  802d6c:	00 00 00 
  802d6f:	ff d0                	callq  *%rax
  802d71:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d74:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d78:	79 05                	jns    802d7f <accept+0x32>
  802d7a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d7d:	eb 3b                	jmp    802dba <accept+0x6d>
  802d7f:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802d83:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  802d87:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d8a:	48 89 ce             	mov    %rcx,%rsi
  802d8d:	89 c7                	mov    %eax,%edi
  802d8f:	48 b8 98 30 80 00 00 	movabs $0x803098,%rax
  802d96:	00 00 00 
  802d99:	ff d0                	callq  *%rax
  802d9b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d9e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802da2:	79 05                	jns    802da9 <accept+0x5c>
  802da4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802da7:	eb 11                	jmp    802dba <accept+0x6d>
  802da9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802dac:	89 c7                	mov    %eax,%edi
  802dae:	48 b8 ae 2c 80 00 00 	movabs $0x802cae,%rax
  802db5:	00 00 00 
  802db8:	ff d0                	callq  *%rax
  802dba:	c9                   	leaveq 
  802dbb:	c3                   	retq   

0000000000802dbc <bind>:
  802dbc:	55                   	push   %rbp
  802dbd:	48 89 e5             	mov    %rsp,%rbp
  802dc0:	48 83 ec 20          	sub    $0x20,%rsp
  802dc4:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802dc7:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802dcb:	89 55 e8             	mov    %edx,-0x18(%rbp)
  802dce:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802dd1:	89 c7                	mov    %eax,%edi
  802dd3:	48 b8 57 2c 80 00 00 	movabs $0x802c57,%rax
  802dda:	00 00 00 
  802ddd:	ff d0                	callq  *%rax
  802ddf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802de2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802de6:	79 05                	jns    802ded <bind+0x31>
  802de8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802deb:	eb 1b                	jmp    802e08 <bind+0x4c>
  802ded:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802df0:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  802df4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802df7:	48 89 ce             	mov    %rcx,%rsi
  802dfa:	89 c7                	mov    %eax,%edi
  802dfc:	48 b8 17 31 80 00 00 	movabs $0x803117,%rax
  802e03:	00 00 00 
  802e06:	ff d0                	callq  *%rax
  802e08:	c9                   	leaveq 
  802e09:	c3                   	retq   

0000000000802e0a <shutdown>:
  802e0a:	55                   	push   %rbp
  802e0b:	48 89 e5             	mov    %rsp,%rbp
  802e0e:	48 83 ec 20          	sub    $0x20,%rsp
  802e12:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802e15:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802e18:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802e1b:	89 c7                	mov    %eax,%edi
  802e1d:	48 b8 57 2c 80 00 00 	movabs $0x802c57,%rax
  802e24:	00 00 00 
  802e27:	ff d0                	callq  *%rax
  802e29:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e2c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e30:	79 05                	jns    802e37 <shutdown+0x2d>
  802e32:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e35:	eb 16                	jmp    802e4d <shutdown+0x43>
  802e37:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802e3a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e3d:	89 d6                	mov    %edx,%esi
  802e3f:	89 c7                	mov    %eax,%edi
  802e41:	48 b8 7b 31 80 00 00 	movabs $0x80317b,%rax
  802e48:	00 00 00 
  802e4b:	ff d0                	callq  *%rax
  802e4d:	c9                   	leaveq 
  802e4e:	c3                   	retq   

0000000000802e4f <devsock_close>:
  802e4f:	55                   	push   %rbp
  802e50:	48 89 e5             	mov    %rsp,%rbp
  802e53:	48 83 ec 10          	sub    $0x10,%rsp
  802e57:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802e5b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802e5f:	48 89 c7             	mov    %rax,%rdi
  802e62:	48 b8 bc 3f 80 00 00 	movabs $0x803fbc,%rax
  802e69:	00 00 00 
  802e6c:	ff d0                	callq  *%rax
  802e6e:	83 f8 01             	cmp    $0x1,%eax
  802e71:	75 17                	jne    802e8a <devsock_close+0x3b>
  802e73:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802e77:	8b 40 0c             	mov    0xc(%rax),%eax
  802e7a:	89 c7                	mov    %eax,%edi
  802e7c:	48 b8 bb 31 80 00 00 	movabs $0x8031bb,%rax
  802e83:	00 00 00 
  802e86:	ff d0                	callq  *%rax
  802e88:	eb 05                	jmp    802e8f <devsock_close+0x40>
  802e8a:	b8 00 00 00 00       	mov    $0x0,%eax
  802e8f:	c9                   	leaveq 
  802e90:	c3                   	retq   

0000000000802e91 <connect>:
  802e91:	55                   	push   %rbp
  802e92:	48 89 e5             	mov    %rsp,%rbp
  802e95:	48 83 ec 20          	sub    $0x20,%rsp
  802e99:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802e9c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802ea0:	89 55 e8             	mov    %edx,-0x18(%rbp)
  802ea3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802ea6:	89 c7                	mov    %eax,%edi
  802ea8:	48 b8 57 2c 80 00 00 	movabs $0x802c57,%rax
  802eaf:	00 00 00 
  802eb2:	ff d0                	callq  *%rax
  802eb4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802eb7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ebb:	79 05                	jns    802ec2 <connect+0x31>
  802ebd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ec0:	eb 1b                	jmp    802edd <connect+0x4c>
  802ec2:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802ec5:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  802ec9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ecc:	48 89 ce             	mov    %rcx,%rsi
  802ecf:	89 c7                	mov    %eax,%edi
  802ed1:	48 b8 e8 31 80 00 00 	movabs $0x8031e8,%rax
  802ed8:	00 00 00 
  802edb:	ff d0                	callq  *%rax
  802edd:	c9                   	leaveq 
  802ede:	c3                   	retq   

0000000000802edf <listen>:
  802edf:	55                   	push   %rbp
  802ee0:	48 89 e5             	mov    %rsp,%rbp
  802ee3:	48 83 ec 20          	sub    $0x20,%rsp
  802ee7:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802eea:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802eed:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802ef0:	89 c7                	mov    %eax,%edi
  802ef2:	48 b8 57 2c 80 00 00 	movabs $0x802c57,%rax
  802ef9:	00 00 00 
  802efc:	ff d0                	callq  *%rax
  802efe:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f01:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f05:	79 05                	jns    802f0c <listen+0x2d>
  802f07:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f0a:	eb 16                	jmp    802f22 <listen+0x43>
  802f0c:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802f0f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f12:	89 d6                	mov    %edx,%esi
  802f14:	89 c7                	mov    %eax,%edi
  802f16:	48 b8 4c 32 80 00 00 	movabs $0x80324c,%rax
  802f1d:	00 00 00 
  802f20:	ff d0                	callq  *%rax
  802f22:	c9                   	leaveq 
  802f23:	c3                   	retq   

0000000000802f24 <devsock_read>:
  802f24:	55                   	push   %rbp
  802f25:	48 89 e5             	mov    %rsp,%rbp
  802f28:	48 83 ec 20          	sub    $0x20,%rsp
  802f2c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802f30:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802f34:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  802f38:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f3c:	89 c2                	mov    %eax,%edx
  802f3e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802f42:	8b 40 0c             	mov    0xc(%rax),%eax
  802f45:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  802f49:	b9 00 00 00 00       	mov    $0x0,%ecx
  802f4e:	89 c7                	mov    %eax,%edi
  802f50:	48 b8 8c 32 80 00 00 	movabs $0x80328c,%rax
  802f57:	00 00 00 
  802f5a:	ff d0                	callq  *%rax
  802f5c:	c9                   	leaveq 
  802f5d:	c3                   	retq   

0000000000802f5e <devsock_write>:
  802f5e:	55                   	push   %rbp
  802f5f:	48 89 e5             	mov    %rsp,%rbp
  802f62:	48 83 ec 20          	sub    $0x20,%rsp
  802f66:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802f6a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802f6e:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  802f72:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f76:	89 c2                	mov    %eax,%edx
  802f78:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802f7c:	8b 40 0c             	mov    0xc(%rax),%eax
  802f7f:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  802f83:	b9 00 00 00 00       	mov    $0x0,%ecx
  802f88:	89 c7                	mov    %eax,%edi
  802f8a:	48 b8 58 33 80 00 00 	movabs $0x803358,%rax
  802f91:	00 00 00 
  802f94:	ff d0                	callq  *%rax
  802f96:	c9                   	leaveq 
  802f97:	c3                   	retq   

0000000000802f98 <devsock_stat>:
  802f98:	55                   	push   %rbp
  802f99:	48 89 e5             	mov    %rsp,%rbp
  802f9c:	48 83 ec 10          	sub    $0x10,%rsp
  802fa0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802fa4:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802fa8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802fac:	48 be aa 46 80 00 00 	movabs $0x8046aa,%rsi
  802fb3:	00 00 00 
  802fb6:	48 89 c7             	mov    %rax,%rdi
  802fb9:	48 b8 1f 0e 80 00 00 	movabs $0x800e1f,%rax
  802fc0:	00 00 00 
  802fc3:	ff d0                	callq  *%rax
  802fc5:	b8 00 00 00 00       	mov    $0x0,%eax
  802fca:	c9                   	leaveq 
  802fcb:	c3                   	retq   

0000000000802fcc <socket>:
  802fcc:	55                   	push   %rbp
  802fcd:	48 89 e5             	mov    %rsp,%rbp
  802fd0:	48 83 ec 20          	sub    $0x20,%rsp
  802fd4:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802fd7:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802fda:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  802fdd:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  802fe0:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  802fe3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802fe6:	89 ce                	mov    %ecx,%esi
  802fe8:	89 c7                	mov    %eax,%edi
  802fea:	48 b8 10 34 80 00 00 	movabs $0x803410,%rax
  802ff1:	00 00 00 
  802ff4:	ff d0                	callq  *%rax
  802ff6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ff9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ffd:	79 05                	jns    803004 <socket+0x38>
  802fff:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803002:	eb 11                	jmp    803015 <socket+0x49>
  803004:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803007:	89 c7                	mov    %eax,%edi
  803009:	48 b8 ae 2c 80 00 00 	movabs $0x802cae,%rax
  803010:	00 00 00 
  803013:	ff d0                	callq  *%rax
  803015:	c9                   	leaveq 
  803016:	c3                   	retq   

0000000000803017 <nsipc>:
  803017:	55                   	push   %rbp
  803018:	48 89 e5             	mov    %rsp,%rbp
  80301b:	48 83 ec 10          	sub    $0x10,%rsp
  80301f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803022:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  803029:	00 00 00 
  80302c:	8b 00                	mov    (%rax),%eax
  80302e:	85 c0                	test   %eax,%eax
  803030:	75 1d                	jne    80304f <nsipc+0x38>
  803032:	bf 02 00 00 00       	mov    $0x2,%edi
  803037:	48 b8 4a 3f 80 00 00 	movabs $0x803f4a,%rax
  80303e:	00 00 00 
  803041:	ff d0                	callq  *%rax
  803043:	48 ba 04 70 80 00 00 	movabs $0x807004,%rdx
  80304a:	00 00 00 
  80304d:	89 02                	mov    %eax,(%rdx)
  80304f:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  803056:	00 00 00 
  803059:	8b 00                	mov    (%rax),%eax
  80305b:	8b 75 fc             	mov    -0x4(%rbp),%esi
  80305e:	b9 07 00 00 00       	mov    $0x7,%ecx
  803063:	48 ba 00 a0 80 00 00 	movabs $0x80a000,%rdx
  80306a:	00 00 00 
  80306d:	89 c7                	mov    %eax,%edi
  80306f:	48 b8 b4 3e 80 00 00 	movabs $0x803eb4,%rax
  803076:	00 00 00 
  803079:	ff d0                	callq  *%rax
  80307b:	ba 00 00 00 00       	mov    $0x0,%edx
  803080:	be 00 00 00 00       	mov    $0x0,%esi
  803085:	bf 00 00 00 00       	mov    $0x0,%edi
  80308a:	48 b8 f3 3d 80 00 00 	movabs $0x803df3,%rax
  803091:	00 00 00 
  803094:	ff d0                	callq  *%rax
  803096:	c9                   	leaveq 
  803097:	c3                   	retq   

0000000000803098 <nsipc_accept>:
  803098:	55                   	push   %rbp
  803099:	48 89 e5             	mov    %rsp,%rbp
  80309c:	48 83 ec 30          	sub    $0x30,%rsp
  8030a0:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8030a3:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8030a7:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8030ab:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8030b2:	00 00 00 
  8030b5:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8030b8:	89 10                	mov    %edx,(%rax)
  8030ba:	bf 01 00 00 00       	mov    $0x1,%edi
  8030bf:	48 b8 17 30 80 00 00 	movabs $0x803017,%rax
  8030c6:	00 00 00 
  8030c9:	ff d0                	callq  *%rax
  8030cb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8030ce:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8030d2:	78 3e                	js     803112 <nsipc_accept+0x7a>
  8030d4:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8030db:	00 00 00 
  8030de:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8030e2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8030e6:	8b 40 10             	mov    0x10(%rax),%eax
  8030e9:	89 c2                	mov    %eax,%edx
  8030eb:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8030ef:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8030f3:	48 89 ce             	mov    %rcx,%rsi
  8030f6:	48 89 c7             	mov    %rax,%rdi
  8030f9:	48 b8 43 11 80 00 00 	movabs $0x801143,%rax
  803100:	00 00 00 
  803103:	ff d0                	callq  *%rax
  803105:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803109:	8b 50 10             	mov    0x10(%rax),%edx
  80310c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803110:	89 10                	mov    %edx,(%rax)
  803112:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803115:	c9                   	leaveq 
  803116:	c3                   	retq   

0000000000803117 <nsipc_bind>:
  803117:	55                   	push   %rbp
  803118:	48 89 e5             	mov    %rsp,%rbp
  80311b:	48 83 ec 10          	sub    $0x10,%rsp
  80311f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803122:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803126:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803129:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803130:	00 00 00 
  803133:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803136:	89 10                	mov    %edx,(%rax)
  803138:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80313b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80313f:	48 89 c6             	mov    %rax,%rsi
  803142:	48 bf 04 a0 80 00 00 	movabs $0x80a004,%rdi
  803149:	00 00 00 
  80314c:	48 b8 43 11 80 00 00 	movabs $0x801143,%rax
  803153:	00 00 00 
  803156:	ff d0                	callq  *%rax
  803158:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80315f:	00 00 00 
  803162:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803165:	89 50 14             	mov    %edx,0x14(%rax)
  803168:	bf 02 00 00 00       	mov    $0x2,%edi
  80316d:	48 b8 17 30 80 00 00 	movabs $0x803017,%rax
  803174:	00 00 00 
  803177:	ff d0                	callq  *%rax
  803179:	c9                   	leaveq 
  80317a:	c3                   	retq   

000000000080317b <nsipc_shutdown>:
  80317b:	55                   	push   %rbp
  80317c:	48 89 e5             	mov    %rsp,%rbp
  80317f:	48 83 ec 10          	sub    $0x10,%rsp
  803183:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803186:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803189:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803190:	00 00 00 
  803193:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803196:	89 10                	mov    %edx,(%rax)
  803198:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80319f:	00 00 00 
  8031a2:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8031a5:	89 50 04             	mov    %edx,0x4(%rax)
  8031a8:	bf 03 00 00 00       	mov    $0x3,%edi
  8031ad:	48 b8 17 30 80 00 00 	movabs $0x803017,%rax
  8031b4:	00 00 00 
  8031b7:	ff d0                	callq  *%rax
  8031b9:	c9                   	leaveq 
  8031ba:	c3                   	retq   

00000000008031bb <nsipc_close>:
  8031bb:	55                   	push   %rbp
  8031bc:	48 89 e5             	mov    %rsp,%rbp
  8031bf:	48 83 ec 10          	sub    $0x10,%rsp
  8031c3:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8031c6:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8031cd:	00 00 00 
  8031d0:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8031d3:	89 10                	mov    %edx,(%rax)
  8031d5:	bf 04 00 00 00       	mov    $0x4,%edi
  8031da:	48 b8 17 30 80 00 00 	movabs $0x803017,%rax
  8031e1:	00 00 00 
  8031e4:	ff d0                	callq  *%rax
  8031e6:	c9                   	leaveq 
  8031e7:	c3                   	retq   

00000000008031e8 <nsipc_connect>:
  8031e8:	55                   	push   %rbp
  8031e9:	48 89 e5             	mov    %rsp,%rbp
  8031ec:	48 83 ec 10          	sub    $0x10,%rsp
  8031f0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8031f3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8031f7:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8031fa:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803201:	00 00 00 
  803204:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803207:	89 10                	mov    %edx,(%rax)
  803209:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80320c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803210:	48 89 c6             	mov    %rax,%rsi
  803213:	48 bf 04 a0 80 00 00 	movabs $0x80a004,%rdi
  80321a:	00 00 00 
  80321d:	48 b8 43 11 80 00 00 	movabs $0x801143,%rax
  803224:	00 00 00 
  803227:	ff d0                	callq  *%rax
  803229:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803230:	00 00 00 
  803233:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803236:	89 50 14             	mov    %edx,0x14(%rax)
  803239:	bf 05 00 00 00       	mov    $0x5,%edi
  80323e:	48 b8 17 30 80 00 00 	movabs $0x803017,%rax
  803245:	00 00 00 
  803248:	ff d0                	callq  *%rax
  80324a:	c9                   	leaveq 
  80324b:	c3                   	retq   

000000000080324c <nsipc_listen>:
  80324c:	55                   	push   %rbp
  80324d:	48 89 e5             	mov    %rsp,%rbp
  803250:	48 83 ec 10          	sub    $0x10,%rsp
  803254:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803257:	89 75 f8             	mov    %esi,-0x8(%rbp)
  80325a:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803261:	00 00 00 
  803264:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803267:	89 10                	mov    %edx,(%rax)
  803269:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803270:	00 00 00 
  803273:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803276:	89 50 04             	mov    %edx,0x4(%rax)
  803279:	bf 06 00 00 00       	mov    $0x6,%edi
  80327e:	48 b8 17 30 80 00 00 	movabs $0x803017,%rax
  803285:	00 00 00 
  803288:	ff d0                	callq  *%rax
  80328a:	c9                   	leaveq 
  80328b:	c3                   	retq   

000000000080328c <nsipc_recv>:
  80328c:	55                   	push   %rbp
  80328d:	48 89 e5             	mov    %rsp,%rbp
  803290:	48 83 ec 30          	sub    $0x30,%rsp
  803294:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803297:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80329b:	89 55 e8             	mov    %edx,-0x18(%rbp)
  80329e:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  8032a1:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8032a8:	00 00 00 
  8032ab:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8032ae:	89 10                	mov    %edx,(%rax)
  8032b0:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8032b7:	00 00 00 
  8032ba:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8032bd:	89 50 04             	mov    %edx,0x4(%rax)
  8032c0:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8032c7:	00 00 00 
  8032ca:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8032cd:	89 50 08             	mov    %edx,0x8(%rax)
  8032d0:	bf 07 00 00 00       	mov    $0x7,%edi
  8032d5:	48 b8 17 30 80 00 00 	movabs $0x803017,%rax
  8032dc:	00 00 00 
  8032df:	ff d0                	callq  *%rax
  8032e1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8032e4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8032e8:	78 69                	js     803353 <nsipc_recv+0xc7>
  8032ea:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  8032f1:	7f 08                	jg     8032fb <nsipc_recv+0x6f>
  8032f3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032f6:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  8032f9:	7e 35                	jle    803330 <nsipc_recv+0xa4>
  8032fb:	48 b9 b1 46 80 00 00 	movabs $0x8046b1,%rcx
  803302:	00 00 00 
  803305:	48 ba c6 46 80 00 00 	movabs $0x8046c6,%rdx
  80330c:	00 00 00 
  80330f:	be 62 00 00 00       	mov    $0x62,%esi
  803314:	48 bf db 46 80 00 00 	movabs $0x8046db,%rdi
  80331b:	00 00 00 
  80331e:	b8 00 00 00 00       	mov    $0x0,%eax
  803323:	49 b8 df 3c 80 00 00 	movabs $0x803cdf,%r8
  80332a:	00 00 00 
  80332d:	41 ff d0             	callq  *%r8
  803330:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803333:	48 63 d0             	movslq %eax,%rdx
  803336:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80333a:	48 be 00 a0 80 00 00 	movabs $0x80a000,%rsi
  803341:	00 00 00 
  803344:	48 89 c7             	mov    %rax,%rdi
  803347:	48 b8 43 11 80 00 00 	movabs $0x801143,%rax
  80334e:	00 00 00 
  803351:	ff d0                	callq  *%rax
  803353:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803356:	c9                   	leaveq 
  803357:	c3                   	retq   

0000000000803358 <nsipc_send>:
  803358:	55                   	push   %rbp
  803359:	48 89 e5             	mov    %rsp,%rbp
  80335c:	48 83 ec 20          	sub    $0x20,%rsp
  803360:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803363:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803367:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80336a:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  80336d:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803374:	00 00 00 
  803377:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80337a:	89 10                	mov    %edx,(%rax)
  80337c:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  803383:	7e 35                	jle    8033ba <nsipc_send+0x62>
  803385:	48 b9 ea 46 80 00 00 	movabs $0x8046ea,%rcx
  80338c:	00 00 00 
  80338f:	48 ba c6 46 80 00 00 	movabs $0x8046c6,%rdx
  803396:	00 00 00 
  803399:	be 6d 00 00 00       	mov    $0x6d,%esi
  80339e:	48 bf db 46 80 00 00 	movabs $0x8046db,%rdi
  8033a5:	00 00 00 
  8033a8:	b8 00 00 00 00       	mov    $0x0,%eax
  8033ad:	49 b8 df 3c 80 00 00 	movabs $0x803cdf,%r8
  8033b4:	00 00 00 
  8033b7:	41 ff d0             	callq  *%r8
  8033ba:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8033bd:	48 63 d0             	movslq %eax,%rdx
  8033c0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8033c4:	48 89 c6             	mov    %rax,%rsi
  8033c7:	48 bf 0c a0 80 00 00 	movabs $0x80a00c,%rdi
  8033ce:	00 00 00 
  8033d1:	48 b8 43 11 80 00 00 	movabs $0x801143,%rax
  8033d8:	00 00 00 
  8033db:	ff d0                	callq  *%rax
  8033dd:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8033e4:	00 00 00 
  8033e7:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8033ea:	89 50 04             	mov    %edx,0x4(%rax)
  8033ed:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8033f4:	00 00 00 
  8033f7:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8033fa:	89 50 08             	mov    %edx,0x8(%rax)
  8033fd:	bf 08 00 00 00       	mov    $0x8,%edi
  803402:	48 b8 17 30 80 00 00 	movabs $0x803017,%rax
  803409:	00 00 00 
  80340c:	ff d0                	callq  *%rax
  80340e:	c9                   	leaveq 
  80340f:	c3                   	retq   

0000000000803410 <nsipc_socket>:
  803410:	55                   	push   %rbp
  803411:	48 89 e5             	mov    %rsp,%rbp
  803414:	48 83 ec 10          	sub    $0x10,%rsp
  803418:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80341b:	89 75 f8             	mov    %esi,-0x8(%rbp)
  80341e:	89 55 f4             	mov    %edx,-0xc(%rbp)
  803421:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803428:	00 00 00 
  80342b:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80342e:	89 10                	mov    %edx,(%rax)
  803430:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803437:	00 00 00 
  80343a:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80343d:	89 50 04             	mov    %edx,0x4(%rax)
  803440:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803447:	00 00 00 
  80344a:	8b 55 f4             	mov    -0xc(%rbp),%edx
  80344d:	89 50 08             	mov    %edx,0x8(%rax)
  803450:	bf 09 00 00 00       	mov    $0x9,%edi
  803455:	48 b8 17 30 80 00 00 	movabs $0x803017,%rax
  80345c:	00 00 00 
  80345f:	ff d0                	callq  *%rax
  803461:	c9                   	leaveq 
  803462:	c3                   	retq   

0000000000803463 <pipe>:
  803463:	55                   	push   %rbp
  803464:	48 89 e5             	mov    %rsp,%rbp
  803467:	53                   	push   %rbx
  803468:	48 83 ec 38          	sub    $0x38,%rsp
  80346c:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  803470:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  803474:	48 89 c7             	mov    %rax,%rdi
  803477:	48 b8 7a 1c 80 00 00 	movabs $0x801c7a,%rax
  80347e:	00 00 00 
  803481:	ff d0                	callq  *%rax
  803483:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803486:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80348a:	0f 88 bf 01 00 00    	js     80364f <pipe+0x1ec>
  803490:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803494:	ba 07 04 00 00       	mov    $0x407,%edx
  803499:	48 89 c6             	mov    %rax,%rsi
  80349c:	bf 00 00 00 00       	mov    $0x0,%edi
  8034a1:	48 b8 4e 17 80 00 00 	movabs $0x80174e,%rax
  8034a8:	00 00 00 
  8034ab:	ff d0                	callq  *%rax
  8034ad:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8034b0:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8034b4:	0f 88 95 01 00 00    	js     80364f <pipe+0x1ec>
  8034ba:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  8034be:	48 89 c7             	mov    %rax,%rdi
  8034c1:	48 b8 7a 1c 80 00 00 	movabs $0x801c7a,%rax
  8034c8:	00 00 00 
  8034cb:	ff d0                	callq  *%rax
  8034cd:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8034d0:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8034d4:	0f 88 5d 01 00 00    	js     803637 <pipe+0x1d4>
  8034da:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8034de:	ba 07 04 00 00       	mov    $0x407,%edx
  8034e3:	48 89 c6             	mov    %rax,%rsi
  8034e6:	bf 00 00 00 00       	mov    $0x0,%edi
  8034eb:	48 b8 4e 17 80 00 00 	movabs $0x80174e,%rax
  8034f2:	00 00 00 
  8034f5:	ff d0                	callq  *%rax
  8034f7:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8034fa:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8034fe:	0f 88 33 01 00 00    	js     803637 <pipe+0x1d4>
  803504:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803508:	48 89 c7             	mov    %rax,%rdi
  80350b:	48 b8 4f 1c 80 00 00 	movabs $0x801c4f,%rax
  803512:	00 00 00 
  803515:	ff d0                	callq  *%rax
  803517:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80351b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80351f:	ba 07 04 00 00       	mov    $0x407,%edx
  803524:	48 89 c6             	mov    %rax,%rsi
  803527:	bf 00 00 00 00       	mov    $0x0,%edi
  80352c:	48 b8 4e 17 80 00 00 	movabs $0x80174e,%rax
  803533:	00 00 00 
  803536:	ff d0                	callq  *%rax
  803538:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80353b:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80353f:	79 05                	jns    803546 <pipe+0xe3>
  803541:	e9 d9 00 00 00       	jmpq   80361f <pipe+0x1bc>
  803546:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80354a:	48 89 c7             	mov    %rax,%rdi
  80354d:	48 b8 4f 1c 80 00 00 	movabs $0x801c4f,%rax
  803554:	00 00 00 
  803557:	ff d0                	callq  *%rax
  803559:	48 89 c2             	mov    %rax,%rdx
  80355c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803560:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  803566:	48 89 d1             	mov    %rdx,%rcx
  803569:	ba 00 00 00 00       	mov    $0x0,%edx
  80356e:	48 89 c6             	mov    %rax,%rsi
  803571:	bf 00 00 00 00       	mov    $0x0,%edi
  803576:	48 b8 9e 17 80 00 00 	movabs $0x80179e,%rax
  80357d:	00 00 00 
  803580:	ff d0                	callq  *%rax
  803582:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803585:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803589:	79 1b                	jns    8035a6 <pipe+0x143>
  80358b:	90                   	nop
  80358c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803590:	48 89 c6             	mov    %rax,%rsi
  803593:	bf 00 00 00 00       	mov    $0x0,%edi
  803598:	48 b8 f9 17 80 00 00 	movabs $0x8017f9,%rax
  80359f:	00 00 00 
  8035a2:	ff d0                	callq  *%rax
  8035a4:	eb 79                	jmp    80361f <pipe+0x1bc>
  8035a6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8035aa:	48 ba e0 60 80 00 00 	movabs $0x8060e0,%rdx
  8035b1:	00 00 00 
  8035b4:	8b 12                	mov    (%rdx),%edx
  8035b6:	89 10                	mov    %edx,(%rax)
  8035b8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8035bc:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  8035c3:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8035c7:	48 ba e0 60 80 00 00 	movabs $0x8060e0,%rdx
  8035ce:	00 00 00 
  8035d1:	8b 12                	mov    (%rdx),%edx
  8035d3:	89 10                	mov    %edx,(%rax)
  8035d5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8035d9:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  8035e0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8035e4:	48 89 c7             	mov    %rax,%rdi
  8035e7:	48 b8 2c 1c 80 00 00 	movabs $0x801c2c,%rax
  8035ee:	00 00 00 
  8035f1:	ff d0                	callq  *%rax
  8035f3:	89 c2                	mov    %eax,%edx
  8035f5:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8035f9:	89 10                	mov    %edx,(%rax)
  8035fb:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8035ff:	48 8d 58 04          	lea    0x4(%rax),%rbx
  803603:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803607:	48 89 c7             	mov    %rax,%rdi
  80360a:	48 b8 2c 1c 80 00 00 	movabs $0x801c2c,%rax
  803611:	00 00 00 
  803614:	ff d0                	callq  *%rax
  803616:	89 03                	mov    %eax,(%rbx)
  803618:	b8 00 00 00 00       	mov    $0x0,%eax
  80361d:	eb 33                	jmp    803652 <pipe+0x1ef>
  80361f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803623:	48 89 c6             	mov    %rax,%rsi
  803626:	bf 00 00 00 00       	mov    $0x0,%edi
  80362b:	48 b8 f9 17 80 00 00 	movabs $0x8017f9,%rax
  803632:	00 00 00 
  803635:	ff d0                	callq  *%rax
  803637:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80363b:	48 89 c6             	mov    %rax,%rsi
  80363e:	bf 00 00 00 00       	mov    $0x0,%edi
  803643:	48 b8 f9 17 80 00 00 	movabs $0x8017f9,%rax
  80364a:	00 00 00 
  80364d:	ff d0                	callq  *%rax
  80364f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803652:	48 83 c4 38          	add    $0x38,%rsp
  803656:	5b                   	pop    %rbx
  803657:	5d                   	pop    %rbp
  803658:	c3                   	retq   

0000000000803659 <_pipeisclosed>:
  803659:	55                   	push   %rbp
  80365a:	48 89 e5             	mov    %rsp,%rbp
  80365d:	53                   	push   %rbx
  80365e:	48 83 ec 28          	sub    $0x28,%rsp
  803662:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803666:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80366a:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803671:	00 00 00 
  803674:	48 8b 00             	mov    (%rax),%rax
  803677:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80367d:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803680:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803684:	48 89 c7             	mov    %rax,%rdi
  803687:	48 b8 bc 3f 80 00 00 	movabs $0x803fbc,%rax
  80368e:	00 00 00 
  803691:	ff d0                	callq  *%rax
  803693:	89 c3                	mov    %eax,%ebx
  803695:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803699:	48 89 c7             	mov    %rax,%rdi
  80369c:	48 b8 bc 3f 80 00 00 	movabs $0x803fbc,%rax
  8036a3:	00 00 00 
  8036a6:	ff d0                	callq  *%rax
  8036a8:	39 c3                	cmp    %eax,%ebx
  8036aa:	0f 94 c0             	sete   %al
  8036ad:	0f b6 c0             	movzbl %al,%eax
  8036b0:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8036b3:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8036ba:	00 00 00 
  8036bd:	48 8b 00             	mov    (%rax),%rax
  8036c0:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8036c6:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  8036c9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8036cc:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  8036cf:	75 05                	jne    8036d6 <_pipeisclosed+0x7d>
  8036d1:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8036d4:	eb 4f                	jmp    803725 <_pipeisclosed+0xcc>
  8036d6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8036d9:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  8036dc:	74 42                	je     803720 <_pipeisclosed+0xc7>
  8036de:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  8036e2:	75 3c                	jne    803720 <_pipeisclosed+0xc7>
  8036e4:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8036eb:	00 00 00 
  8036ee:	48 8b 00             	mov    (%rax),%rax
  8036f1:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  8036f7:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  8036fa:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8036fd:	89 c6                	mov    %eax,%esi
  8036ff:	48 bf fb 46 80 00 00 	movabs $0x8046fb,%rdi
  803706:	00 00 00 
  803709:	b8 00 00 00 00       	mov    $0x0,%eax
  80370e:	49 b8 6a 02 80 00 00 	movabs $0x80026a,%r8
  803715:	00 00 00 
  803718:	41 ff d0             	callq  *%r8
  80371b:	e9 4a ff ff ff       	jmpq   80366a <_pipeisclosed+0x11>
  803720:	e9 45 ff ff ff       	jmpq   80366a <_pipeisclosed+0x11>
  803725:	48 83 c4 28          	add    $0x28,%rsp
  803729:	5b                   	pop    %rbx
  80372a:	5d                   	pop    %rbp
  80372b:	c3                   	retq   

000000000080372c <pipeisclosed>:
  80372c:	55                   	push   %rbp
  80372d:	48 89 e5             	mov    %rsp,%rbp
  803730:	48 83 ec 30          	sub    $0x30,%rsp
  803734:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803737:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80373b:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80373e:	48 89 d6             	mov    %rdx,%rsi
  803741:	89 c7                	mov    %eax,%edi
  803743:	48 b8 12 1d 80 00 00 	movabs $0x801d12,%rax
  80374a:	00 00 00 
  80374d:	ff d0                	callq  *%rax
  80374f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803752:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803756:	79 05                	jns    80375d <pipeisclosed+0x31>
  803758:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80375b:	eb 31                	jmp    80378e <pipeisclosed+0x62>
  80375d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803761:	48 89 c7             	mov    %rax,%rdi
  803764:	48 b8 4f 1c 80 00 00 	movabs $0x801c4f,%rax
  80376b:	00 00 00 
  80376e:	ff d0                	callq  *%rax
  803770:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803774:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803778:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80377c:	48 89 d6             	mov    %rdx,%rsi
  80377f:	48 89 c7             	mov    %rax,%rdi
  803782:	48 b8 59 36 80 00 00 	movabs $0x803659,%rax
  803789:	00 00 00 
  80378c:	ff d0                	callq  *%rax
  80378e:	c9                   	leaveq 
  80378f:	c3                   	retq   

0000000000803790 <devpipe_read>:
  803790:	55                   	push   %rbp
  803791:	48 89 e5             	mov    %rsp,%rbp
  803794:	48 83 ec 40          	sub    $0x40,%rsp
  803798:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80379c:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8037a0:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8037a4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8037a8:	48 89 c7             	mov    %rax,%rdi
  8037ab:	48 b8 4f 1c 80 00 00 	movabs $0x801c4f,%rax
  8037b2:	00 00 00 
  8037b5:	ff d0                	callq  *%rax
  8037b7:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8037bb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8037bf:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8037c3:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8037ca:	00 
  8037cb:	e9 92 00 00 00       	jmpq   803862 <devpipe_read+0xd2>
  8037d0:	eb 41                	jmp    803813 <devpipe_read+0x83>
  8037d2:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  8037d7:	74 09                	je     8037e2 <devpipe_read+0x52>
  8037d9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8037dd:	e9 92 00 00 00       	jmpq   803874 <devpipe_read+0xe4>
  8037e2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8037e6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8037ea:	48 89 d6             	mov    %rdx,%rsi
  8037ed:	48 89 c7             	mov    %rax,%rdi
  8037f0:	48 b8 59 36 80 00 00 	movabs $0x803659,%rax
  8037f7:	00 00 00 
  8037fa:	ff d0                	callq  *%rax
  8037fc:	85 c0                	test   %eax,%eax
  8037fe:	74 07                	je     803807 <devpipe_read+0x77>
  803800:	b8 00 00 00 00       	mov    $0x0,%eax
  803805:	eb 6d                	jmp    803874 <devpipe_read+0xe4>
  803807:	48 b8 10 17 80 00 00 	movabs $0x801710,%rax
  80380e:	00 00 00 
  803811:	ff d0                	callq  *%rax
  803813:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803817:	8b 10                	mov    (%rax),%edx
  803819:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80381d:	8b 40 04             	mov    0x4(%rax),%eax
  803820:	39 c2                	cmp    %eax,%edx
  803822:	74 ae                	je     8037d2 <devpipe_read+0x42>
  803824:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803828:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80382c:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  803830:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803834:	8b 00                	mov    (%rax),%eax
  803836:	99                   	cltd   
  803837:	c1 ea 1b             	shr    $0x1b,%edx
  80383a:	01 d0                	add    %edx,%eax
  80383c:	83 e0 1f             	and    $0x1f,%eax
  80383f:	29 d0                	sub    %edx,%eax
  803841:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803845:	48 98                	cltq   
  803847:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  80384c:	88 01                	mov    %al,(%rcx)
  80384e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803852:	8b 00                	mov    (%rax),%eax
  803854:	8d 50 01             	lea    0x1(%rax),%edx
  803857:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80385b:	89 10                	mov    %edx,(%rax)
  80385d:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803862:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803866:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  80386a:	0f 82 60 ff ff ff    	jb     8037d0 <devpipe_read+0x40>
  803870:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803874:	c9                   	leaveq 
  803875:	c3                   	retq   

0000000000803876 <devpipe_write>:
  803876:	55                   	push   %rbp
  803877:	48 89 e5             	mov    %rsp,%rbp
  80387a:	48 83 ec 40          	sub    $0x40,%rsp
  80387e:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803882:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803886:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80388a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80388e:	48 89 c7             	mov    %rax,%rdi
  803891:	48 b8 4f 1c 80 00 00 	movabs $0x801c4f,%rax
  803898:	00 00 00 
  80389b:	ff d0                	callq  *%rax
  80389d:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8038a1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8038a5:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8038a9:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8038b0:	00 
  8038b1:	e9 8e 00 00 00       	jmpq   803944 <devpipe_write+0xce>
  8038b6:	eb 31                	jmp    8038e9 <devpipe_write+0x73>
  8038b8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8038bc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8038c0:	48 89 d6             	mov    %rdx,%rsi
  8038c3:	48 89 c7             	mov    %rax,%rdi
  8038c6:	48 b8 59 36 80 00 00 	movabs $0x803659,%rax
  8038cd:	00 00 00 
  8038d0:	ff d0                	callq  *%rax
  8038d2:	85 c0                	test   %eax,%eax
  8038d4:	74 07                	je     8038dd <devpipe_write+0x67>
  8038d6:	b8 00 00 00 00       	mov    $0x0,%eax
  8038db:	eb 79                	jmp    803956 <devpipe_write+0xe0>
  8038dd:	48 b8 10 17 80 00 00 	movabs $0x801710,%rax
  8038e4:	00 00 00 
  8038e7:	ff d0                	callq  *%rax
  8038e9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8038ed:	8b 40 04             	mov    0x4(%rax),%eax
  8038f0:	48 63 d0             	movslq %eax,%rdx
  8038f3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8038f7:	8b 00                	mov    (%rax),%eax
  8038f9:	48 98                	cltq   
  8038fb:	48 83 c0 20          	add    $0x20,%rax
  8038ff:	48 39 c2             	cmp    %rax,%rdx
  803902:	73 b4                	jae    8038b8 <devpipe_write+0x42>
  803904:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803908:	8b 40 04             	mov    0x4(%rax),%eax
  80390b:	99                   	cltd   
  80390c:	c1 ea 1b             	shr    $0x1b,%edx
  80390f:	01 d0                	add    %edx,%eax
  803911:	83 e0 1f             	and    $0x1f,%eax
  803914:	29 d0                	sub    %edx,%eax
  803916:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80391a:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80391e:	48 01 ca             	add    %rcx,%rdx
  803921:	0f b6 0a             	movzbl (%rdx),%ecx
  803924:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803928:	48 98                	cltq   
  80392a:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  80392e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803932:	8b 40 04             	mov    0x4(%rax),%eax
  803935:	8d 50 01             	lea    0x1(%rax),%edx
  803938:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80393c:	89 50 04             	mov    %edx,0x4(%rax)
  80393f:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803944:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803948:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  80394c:	0f 82 64 ff ff ff    	jb     8038b6 <devpipe_write+0x40>
  803952:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803956:	c9                   	leaveq 
  803957:	c3                   	retq   

0000000000803958 <devpipe_stat>:
  803958:	55                   	push   %rbp
  803959:	48 89 e5             	mov    %rsp,%rbp
  80395c:	48 83 ec 20          	sub    $0x20,%rsp
  803960:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803964:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803968:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80396c:	48 89 c7             	mov    %rax,%rdi
  80396f:	48 b8 4f 1c 80 00 00 	movabs $0x801c4f,%rax
  803976:	00 00 00 
  803979:	ff d0                	callq  *%rax
  80397b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80397f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803983:	48 be 0e 47 80 00 00 	movabs $0x80470e,%rsi
  80398a:	00 00 00 
  80398d:	48 89 c7             	mov    %rax,%rdi
  803990:	48 b8 1f 0e 80 00 00 	movabs $0x800e1f,%rax
  803997:	00 00 00 
  80399a:	ff d0                	callq  *%rax
  80399c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8039a0:	8b 50 04             	mov    0x4(%rax),%edx
  8039a3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8039a7:	8b 00                	mov    (%rax),%eax
  8039a9:	29 c2                	sub    %eax,%edx
  8039ab:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8039af:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  8039b5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8039b9:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  8039c0:	00 00 00 
  8039c3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8039c7:	48 b9 e0 60 80 00 00 	movabs $0x8060e0,%rcx
  8039ce:	00 00 00 
  8039d1:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  8039d8:	b8 00 00 00 00       	mov    $0x0,%eax
  8039dd:	c9                   	leaveq 
  8039de:	c3                   	retq   

00000000008039df <devpipe_close>:
  8039df:	55                   	push   %rbp
  8039e0:	48 89 e5             	mov    %rsp,%rbp
  8039e3:	48 83 ec 10          	sub    $0x10,%rsp
  8039e7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8039eb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8039ef:	48 89 c6             	mov    %rax,%rsi
  8039f2:	bf 00 00 00 00       	mov    $0x0,%edi
  8039f7:	48 b8 f9 17 80 00 00 	movabs $0x8017f9,%rax
  8039fe:	00 00 00 
  803a01:	ff d0                	callq  *%rax
  803a03:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803a07:	48 89 c7             	mov    %rax,%rdi
  803a0a:	48 b8 4f 1c 80 00 00 	movabs $0x801c4f,%rax
  803a11:	00 00 00 
  803a14:	ff d0                	callq  *%rax
  803a16:	48 89 c6             	mov    %rax,%rsi
  803a19:	bf 00 00 00 00       	mov    $0x0,%edi
  803a1e:	48 b8 f9 17 80 00 00 	movabs $0x8017f9,%rax
  803a25:	00 00 00 
  803a28:	ff d0                	callq  *%rax
  803a2a:	c9                   	leaveq 
  803a2b:	c3                   	retq   

0000000000803a2c <cputchar>:
  803a2c:	55                   	push   %rbp
  803a2d:	48 89 e5             	mov    %rsp,%rbp
  803a30:	48 83 ec 20          	sub    $0x20,%rsp
  803a34:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803a37:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803a3a:	88 45 ff             	mov    %al,-0x1(%rbp)
  803a3d:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  803a41:	be 01 00 00 00       	mov    $0x1,%esi
  803a46:	48 89 c7             	mov    %rax,%rdi
  803a49:	48 b8 06 16 80 00 00 	movabs $0x801606,%rax
  803a50:	00 00 00 
  803a53:	ff d0                	callq  *%rax
  803a55:	c9                   	leaveq 
  803a56:	c3                   	retq   

0000000000803a57 <getchar>:
  803a57:	55                   	push   %rbp
  803a58:	48 89 e5             	mov    %rsp,%rbp
  803a5b:	48 83 ec 10          	sub    $0x10,%rsp
  803a5f:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  803a63:	ba 01 00 00 00       	mov    $0x1,%edx
  803a68:	48 89 c6             	mov    %rax,%rsi
  803a6b:	bf 00 00 00 00       	mov    $0x0,%edi
  803a70:	48 b8 44 21 80 00 00 	movabs $0x802144,%rax
  803a77:	00 00 00 
  803a7a:	ff d0                	callq  *%rax
  803a7c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803a7f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803a83:	79 05                	jns    803a8a <getchar+0x33>
  803a85:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a88:	eb 14                	jmp    803a9e <getchar+0x47>
  803a8a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803a8e:	7f 07                	jg     803a97 <getchar+0x40>
  803a90:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  803a95:	eb 07                	jmp    803a9e <getchar+0x47>
  803a97:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  803a9b:	0f b6 c0             	movzbl %al,%eax
  803a9e:	c9                   	leaveq 
  803a9f:	c3                   	retq   

0000000000803aa0 <iscons>:
  803aa0:	55                   	push   %rbp
  803aa1:	48 89 e5             	mov    %rsp,%rbp
  803aa4:	48 83 ec 20          	sub    $0x20,%rsp
  803aa8:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803aab:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803aaf:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803ab2:	48 89 d6             	mov    %rdx,%rsi
  803ab5:	89 c7                	mov    %eax,%edi
  803ab7:	48 b8 12 1d 80 00 00 	movabs $0x801d12,%rax
  803abe:	00 00 00 
  803ac1:	ff d0                	callq  *%rax
  803ac3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803ac6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803aca:	79 05                	jns    803ad1 <iscons+0x31>
  803acc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803acf:	eb 1a                	jmp    803aeb <iscons+0x4b>
  803ad1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ad5:	8b 10                	mov    (%rax),%edx
  803ad7:	48 b8 20 61 80 00 00 	movabs $0x806120,%rax
  803ade:	00 00 00 
  803ae1:	8b 00                	mov    (%rax),%eax
  803ae3:	39 c2                	cmp    %eax,%edx
  803ae5:	0f 94 c0             	sete   %al
  803ae8:	0f b6 c0             	movzbl %al,%eax
  803aeb:	c9                   	leaveq 
  803aec:	c3                   	retq   

0000000000803aed <opencons>:
  803aed:	55                   	push   %rbp
  803aee:	48 89 e5             	mov    %rsp,%rbp
  803af1:	48 83 ec 10          	sub    $0x10,%rsp
  803af5:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803af9:	48 89 c7             	mov    %rax,%rdi
  803afc:	48 b8 7a 1c 80 00 00 	movabs $0x801c7a,%rax
  803b03:	00 00 00 
  803b06:	ff d0                	callq  *%rax
  803b08:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803b0b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803b0f:	79 05                	jns    803b16 <opencons+0x29>
  803b11:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b14:	eb 5b                	jmp    803b71 <opencons+0x84>
  803b16:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b1a:	ba 07 04 00 00       	mov    $0x407,%edx
  803b1f:	48 89 c6             	mov    %rax,%rsi
  803b22:	bf 00 00 00 00       	mov    $0x0,%edi
  803b27:	48 b8 4e 17 80 00 00 	movabs $0x80174e,%rax
  803b2e:	00 00 00 
  803b31:	ff d0                	callq  *%rax
  803b33:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803b36:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803b3a:	79 05                	jns    803b41 <opencons+0x54>
  803b3c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b3f:	eb 30                	jmp    803b71 <opencons+0x84>
  803b41:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b45:	48 ba 20 61 80 00 00 	movabs $0x806120,%rdx
  803b4c:	00 00 00 
  803b4f:	8b 12                	mov    (%rdx),%edx
  803b51:	89 10                	mov    %edx,(%rax)
  803b53:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b57:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  803b5e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b62:	48 89 c7             	mov    %rax,%rdi
  803b65:	48 b8 2c 1c 80 00 00 	movabs $0x801c2c,%rax
  803b6c:	00 00 00 
  803b6f:	ff d0                	callq  *%rax
  803b71:	c9                   	leaveq 
  803b72:	c3                   	retq   

0000000000803b73 <devcons_read>:
  803b73:	55                   	push   %rbp
  803b74:	48 89 e5             	mov    %rsp,%rbp
  803b77:	48 83 ec 30          	sub    $0x30,%rsp
  803b7b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803b7f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803b83:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803b87:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  803b8c:	75 07                	jne    803b95 <devcons_read+0x22>
  803b8e:	b8 00 00 00 00       	mov    $0x0,%eax
  803b93:	eb 4b                	jmp    803be0 <devcons_read+0x6d>
  803b95:	eb 0c                	jmp    803ba3 <devcons_read+0x30>
  803b97:	48 b8 10 17 80 00 00 	movabs $0x801710,%rax
  803b9e:	00 00 00 
  803ba1:	ff d0                	callq  *%rax
  803ba3:	48 b8 50 16 80 00 00 	movabs $0x801650,%rax
  803baa:	00 00 00 
  803bad:	ff d0                	callq  *%rax
  803baf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803bb2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803bb6:	74 df                	je     803b97 <devcons_read+0x24>
  803bb8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803bbc:	79 05                	jns    803bc3 <devcons_read+0x50>
  803bbe:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803bc1:	eb 1d                	jmp    803be0 <devcons_read+0x6d>
  803bc3:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  803bc7:	75 07                	jne    803bd0 <devcons_read+0x5d>
  803bc9:	b8 00 00 00 00       	mov    $0x0,%eax
  803bce:	eb 10                	jmp    803be0 <devcons_read+0x6d>
  803bd0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803bd3:	89 c2                	mov    %eax,%edx
  803bd5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803bd9:	88 10                	mov    %dl,(%rax)
  803bdb:	b8 01 00 00 00       	mov    $0x1,%eax
  803be0:	c9                   	leaveq 
  803be1:	c3                   	retq   

0000000000803be2 <devcons_write>:
  803be2:	55                   	push   %rbp
  803be3:	48 89 e5             	mov    %rsp,%rbp
  803be6:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  803bed:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  803bf4:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  803bfb:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  803c02:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803c09:	eb 76                	jmp    803c81 <devcons_write+0x9f>
  803c0b:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  803c12:	89 c2                	mov    %eax,%edx
  803c14:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c17:	29 c2                	sub    %eax,%edx
  803c19:	89 d0                	mov    %edx,%eax
  803c1b:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803c1e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803c21:	83 f8 7f             	cmp    $0x7f,%eax
  803c24:	76 07                	jbe    803c2d <devcons_write+0x4b>
  803c26:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  803c2d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803c30:	48 63 d0             	movslq %eax,%rdx
  803c33:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c36:	48 63 c8             	movslq %eax,%rcx
  803c39:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  803c40:	48 01 c1             	add    %rax,%rcx
  803c43:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  803c4a:	48 89 ce             	mov    %rcx,%rsi
  803c4d:	48 89 c7             	mov    %rax,%rdi
  803c50:	48 b8 43 11 80 00 00 	movabs $0x801143,%rax
  803c57:	00 00 00 
  803c5a:	ff d0                	callq  *%rax
  803c5c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803c5f:	48 63 d0             	movslq %eax,%rdx
  803c62:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  803c69:	48 89 d6             	mov    %rdx,%rsi
  803c6c:	48 89 c7             	mov    %rax,%rdi
  803c6f:	48 b8 06 16 80 00 00 	movabs $0x801606,%rax
  803c76:	00 00 00 
  803c79:	ff d0                	callq  *%rax
  803c7b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803c7e:	01 45 fc             	add    %eax,-0x4(%rbp)
  803c81:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c84:	48 98                	cltq   
  803c86:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  803c8d:	0f 82 78 ff ff ff    	jb     803c0b <devcons_write+0x29>
  803c93:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c96:	c9                   	leaveq 
  803c97:	c3                   	retq   

0000000000803c98 <devcons_close>:
  803c98:	55                   	push   %rbp
  803c99:	48 89 e5             	mov    %rsp,%rbp
  803c9c:	48 83 ec 08          	sub    $0x8,%rsp
  803ca0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803ca4:	b8 00 00 00 00       	mov    $0x0,%eax
  803ca9:	c9                   	leaveq 
  803caa:	c3                   	retq   

0000000000803cab <devcons_stat>:
  803cab:	55                   	push   %rbp
  803cac:	48 89 e5             	mov    %rsp,%rbp
  803caf:	48 83 ec 10          	sub    $0x10,%rsp
  803cb3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803cb7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803cbb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803cbf:	48 be 1a 47 80 00 00 	movabs $0x80471a,%rsi
  803cc6:	00 00 00 
  803cc9:	48 89 c7             	mov    %rax,%rdi
  803ccc:	48 b8 1f 0e 80 00 00 	movabs $0x800e1f,%rax
  803cd3:	00 00 00 
  803cd6:	ff d0                	callq  *%rax
  803cd8:	b8 00 00 00 00       	mov    $0x0,%eax
  803cdd:	c9                   	leaveq 
  803cde:	c3                   	retq   

0000000000803cdf <_panic>:
  803cdf:	55                   	push   %rbp
  803ce0:	48 89 e5             	mov    %rsp,%rbp
  803ce3:	53                   	push   %rbx
  803ce4:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  803ceb:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  803cf2:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  803cf8:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  803cff:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  803d06:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  803d0d:	84 c0                	test   %al,%al
  803d0f:	74 23                	je     803d34 <_panic+0x55>
  803d11:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  803d18:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  803d1c:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  803d20:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  803d24:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  803d28:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  803d2c:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  803d30:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  803d34:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  803d3b:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  803d42:	00 00 00 
  803d45:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  803d4c:	00 00 00 
  803d4f:	48 8d 45 10          	lea    0x10(%rbp),%rax
  803d53:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  803d5a:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  803d61:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  803d68:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  803d6f:	00 00 00 
  803d72:	48 8b 18             	mov    (%rax),%rbx
  803d75:	48 b8 d2 16 80 00 00 	movabs $0x8016d2,%rax
  803d7c:	00 00 00 
  803d7f:	ff d0                	callq  *%rax
  803d81:	8b 8d 14 ff ff ff    	mov    -0xec(%rbp),%ecx
  803d87:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  803d8e:	41 89 c8             	mov    %ecx,%r8d
  803d91:	48 89 d1             	mov    %rdx,%rcx
  803d94:	48 89 da             	mov    %rbx,%rdx
  803d97:	89 c6                	mov    %eax,%esi
  803d99:	48 bf 28 47 80 00 00 	movabs $0x804728,%rdi
  803da0:	00 00 00 
  803da3:	b8 00 00 00 00       	mov    $0x0,%eax
  803da8:	49 b9 6a 02 80 00 00 	movabs $0x80026a,%r9
  803daf:	00 00 00 
  803db2:	41 ff d1             	callq  *%r9
  803db5:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  803dbc:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  803dc3:	48 89 d6             	mov    %rdx,%rsi
  803dc6:	48 89 c7             	mov    %rax,%rdi
  803dc9:	48 b8 be 01 80 00 00 	movabs $0x8001be,%rax
  803dd0:	00 00 00 
  803dd3:	ff d0                	callq  *%rax
  803dd5:	48 bf 4b 47 80 00 00 	movabs $0x80474b,%rdi
  803ddc:	00 00 00 
  803ddf:	b8 00 00 00 00       	mov    $0x0,%eax
  803de4:	48 ba 6a 02 80 00 00 	movabs $0x80026a,%rdx
  803deb:	00 00 00 
  803dee:	ff d2                	callq  *%rdx
  803df0:	cc                   	int3   
  803df1:	eb fd                	jmp    803df0 <_panic+0x111>

0000000000803df3 <ipc_recv>:
  803df3:	55                   	push   %rbp
  803df4:	48 89 e5             	mov    %rsp,%rbp
  803df7:	48 83 ec 30          	sub    $0x30,%rsp
  803dfb:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803dff:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803e03:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803e07:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  803e0c:	75 0e                	jne    803e1c <ipc_recv+0x29>
  803e0e:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  803e15:	00 00 00 
  803e18:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803e1c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803e20:	48 89 c7             	mov    %rax,%rdi
  803e23:	48 b8 77 19 80 00 00 	movabs $0x801977,%rax
  803e2a:	00 00 00 
  803e2d:	ff d0                	callq  *%rax
  803e2f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803e32:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803e36:	79 27                	jns    803e5f <ipc_recv+0x6c>
  803e38:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  803e3d:	74 0a                	je     803e49 <ipc_recv+0x56>
  803e3f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803e43:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  803e49:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  803e4e:	74 0a                	je     803e5a <ipc_recv+0x67>
  803e50:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803e54:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  803e5a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e5d:	eb 53                	jmp    803eb2 <ipc_recv+0xbf>
  803e5f:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  803e64:	74 19                	je     803e7f <ipc_recv+0x8c>
  803e66:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803e6d:	00 00 00 
  803e70:	48 8b 00             	mov    (%rax),%rax
  803e73:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  803e79:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803e7d:	89 10                	mov    %edx,(%rax)
  803e7f:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  803e84:	74 19                	je     803e9f <ipc_recv+0xac>
  803e86:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803e8d:	00 00 00 
  803e90:	48 8b 00             	mov    (%rax),%rax
  803e93:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  803e99:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803e9d:	89 10                	mov    %edx,(%rax)
  803e9f:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803ea6:	00 00 00 
  803ea9:	48 8b 00             	mov    (%rax),%rax
  803eac:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  803eb2:	c9                   	leaveq 
  803eb3:	c3                   	retq   

0000000000803eb4 <ipc_send>:
  803eb4:	55                   	push   %rbp
  803eb5:	48 89 e5             	mov    %rsp,%rbp
  803eb8:	48 83 ec 30          	sub    $0x30,%rsp
  803ebc:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803ebf:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803ec2:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  803ec6:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  803ec9:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  803ece:	75 10                	jne    803ee0 <ipc_send+0x2c>
  803ed0:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  803ed7:	00 00 00 
  803eda:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803ede:	eb 0e                	jmp    803eee <ipc_send+0x3a>
  803ee0:	eb 0c                	jmp    803eee <ipc_send+0x3a>
  803ee2:	48 b8 10 17 80 00 00 	movabs $0x801710,%rax
  803ee9:	00 00 00 
  803eec:	ff d0                	callq  *%rax
  803eee:	8b 75 e8             	mov    -0x18(%rbp),%esi
  803ef1:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  803ef4:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  803ef8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803efb:	89 c7                	mov    %eax,%edi
  803efd:	48 b8 22 19 80 00 00 	movabs $0x801922,%rax
  803f04:	00 00 00 
  803f07:	ff d0                	callq  *%rax
  803f09:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803f0c:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  803f10:	74 d0                	je     803ee2 <ipc_send+0x2e>
  803f12:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803f16:	79 30                	jns    803f48 <ipc_send+0x94>
  803f18:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f1b:	89 c1                	mov    %eax,%ecx
  803f1d:	48 ba 4d 47 80 00 00 	movabs $0x80474d,%rdx
  803f24:	00 00 00 
  803f27:	be 44 00 00 00       	mov    $0x44,%esi
  803f2c:	48 bf 63 47 80 00 00 	movabs $0x804763,%rdi
  803f33:	00 00 00 
  803f36:	b8 00 00 00 00       	mov    $0x0,%eax
  803f3b:	49 b8 df 3c 80 00 00 	movabs $0x803cdf,%r8
  803f42:	00 00 00 
  803f45:	41 ff d0             	callq  *%r8
  803f48:	c9                   	leaveq 
  803f49:	c3                   	retq   

0000000000803f4a <ipc_find_env>:
  803f4a:	55                   	push   %rbp
  803f4b:	48 89 e5             	mov    %rsp,%rbp
  803f4e:	48 83 ec 14          	sub    $0x14,%rsp
  803f52:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803f55:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803f5c:	eb 4e                	jmp    803fac <ipc_find_env+0x62>
  803f5e:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  803f65:	00 00 00 
  803f68:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f6b:	48 98                	cltq   
  803f6d:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  803f74:	48 01 d0             	add    %rdx,%rax
  803f77:	48 05 d0 00 00 00    	add    $0xd0,%rax
  803f7d:	8b 00                	mov    (%rax),%eax
  803f7f:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  803f82:	75 24                	jne    803fa8 <ipc_find_env+0x5e>
  803f84:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  803f8b:	00 00 00 
  803f8e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f91:	48 98                	cltq   
  803f93:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  803f9a:	48 01 d0             	add    %rdx,%rax
  803f9d:	48 05 c0 00 00 00    	add    $0xc0,%rax
  803fa3:	8b 40 08             	mov    0x8(%rax),%eax
  803fa6:	eb 12                	jmp    803fba <ipc_find_env+0x70>
  803fa8:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  803fac:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  803fb3:	7e a9                	jle    803f5e <ipc_find_env+0x14>
  803fb5:	b8 00 00 00 00       	mov    $0x0,%eax
  803fba:	c9                   	leaveq 
  803fbb:	c3                   	retq   

0000000000803fbc <pageref>:
  803fbc:	55                   	push   %rbp
  803fbd:	48 89 e5             	mov    %rsp,%rbp
  803fc0:	48 83 ec 18          	sub    $0x18,%rsp
  803fc4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803fc8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803fcc:	48 c1 e8 15          	shr    $0x15,%rax
  803fd0:	48 89 c2             	mov    %rax,%rdx
  803fd3:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  803fda:	01 00 00 
  803fdd:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803fe1:	83 e0 01             	and    $0x1,%eax
  803fe4:	48 85 c0             	test   %rax,%rax
  803fe7:	75 07                	jne    803ff0 <pageref+0x34>
  803fe9:	b8 00 00 00 00       	mov    $0x0,%eax
  803fee:	eb 53                	jmp    804043 <pageref+0x87>
  803ff0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803ff4:	48 c1 e8 0c          	shr    $0xc,%rax
  803ff8:	48 89 c2             	mov    %rax,%rdx
  803ffb:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  804002:	01 00 00 
  804005:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804009:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80400d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804011:	83 e0 01             	and    $0x1,%eax
  804014:	48 85 c0             	test   %rax,%rax
  804017:	75 07                	jne    804020 <pageref+0x64>
  804019:	b8 00 00 00 00       	mov    $0x0,%eax
  80401e:	eb 23                	jmp    804043 <pageref+0x87>
  804020:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804024:	48 c1 e8 0c          	shr    $0xc,%rax
  804028:	48 89 c2             	mov    %rax,%rdx
  80402b:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  804032:	00 00 00 
  804035:	48 c1 e2 04          	shl    $0x4,%rdx
  804039:	48 01 d0             	add    %rdx,%rax
  80403c:	0f b7 40 08          	movzwl 0x8(%rax),%eax
  804040:	0f b7 c0             	movzwl %ax,%eax
  804043:	c9                   	leaveq 
  804044:	c3                   	retq   
