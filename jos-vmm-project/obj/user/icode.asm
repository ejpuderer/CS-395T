
obj/user/icode:     file format elf64-x86-64


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
  80003c:	e8 21 02 00 00       	callq  800262 <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <umain>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	53                   	push   %rbx
  800048:	48 81 ec 28 02 00 00 	sub    $0x228,%rsp
  80004f:	89 bd dc fd ff ff    	mov    %edi,-0x224(%rbp)
  800055:	48 89 b5 d0 fd ff ff 	mov    %rsi,-0x230(%rbp)
  80005c:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  800063:	00 00 00 
  800066:	48 bb 80 4d 80 00 00 	movabs $0x804d80,%rbx
  80006d:	00 00 00 
  800070:	48 89 18             	mov    %rbx,(%rax)
  800073:	48 bf 86 4d 80 00 00 	movabs $0x804d86,%rdi
  80007a:	00 00 00 
  80007d:	b8 00 00 00 00       	mov    $0x0,%eax
  800082:	48 ba 41 05 80 00 00 	movabs $0x800541,%rdx
  800089:	00 00 00 
  80008c:	ff d2                	callq  *%rdx
  80008e:	48 bf 95 4d 80 00 00 	movabs $0x804d95,%rdi
  800095:	00 00 00 
  800098:	b8 00 00 00 00       	mov    $0x0,%eax
  80009d:	48 ba 41 05 80 00 00 	movabs $0x800541,%rdx
  8000a4:	00 00 00 
  8000a7:	ff d2                	callq  *%rdx
  8000a9:	be 00 00 00 00       	mov    $0x0,%esi
  8000ae:	48 bf a8 4d 80 00 00 	movabs $0x804da8,%rdi
  8000b5:	00 00 00 
  8000b8:	48 b8 f1 28 80 00 00 	movabs $0x8028f1,%rax
  8000bf:	00 00 00 
  8000c2:	ff d0                	callq  *%rax
  8000c4:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8000c7:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8000cb:	79 30                	jns    8000fd <umain+0xba>
  8000cd:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8000d0:	89 c1                	mov    %eax,%ecx
  8000d2:	48 ba ae 4d 80 00 00 	movabs $0x804dae,%rdx
  8000d9:	00 00 00 
  8000dc:	be 1a 00 00 00       	mov    $0x1a,%esi
  8000e1:	48 bf c4 4d 80 00 00 	movabs $0x804dc4,%rdi
  8000e8:	00 00 00 
  8000eb:	b8 00 00 00 00       	mov    $0x0,%eax
  8000f0:	49 b8 08 03 80 00 00 	movabs $0x800308,%r8
  8000f7:	00 00 00 
  8000fa:	41 ff d0             	callq  *%r8
  8000fd:	48 bf d4 4d 80 00 00 	movabs $0x804dd4,%rdi
  800104:	00 00 00 
  800107:	b8 00 00 00 00       	mov    $0x0,%eax
  80010c:	48 ba 41 05 80 00 00 	movabs $0x800541,%rdx
  800113:	00 00 00 
  800116:	ff d2                	callq  *%rdx
  800118:	eb 3a                	jmp    800154 <umain+0x111>
  80011a:	48 bf e7 4d 80 00 00 	movabs $0x804de7,%rdi
  800121:	00 00 00 
  800124:	b8 00 00 00 00       	mov    $0x0,%eax
  800129:	48 ba 41 05 80 00 00 	movabs $0x800541,%rdx
  800130:	00 00 00 
  800133:	ff d2                	callq  *%rdx
  800135:	8b 45 e8             	mov    -0x18(%rbp),%eax
  800138:	48 63 d0             	movslq %eax,%rdx
  80013b:	48 8d 85 e0 fd ff ff 	lea    -0x220(%rbp),%rax
  800142:	48 89 d6             	mov    %rdx,%rsi
  800145:	48 89 c7             	mov    %rax,%rdi
  800148:	48 b8 dd 18 80 00 00 	movabs $0x8018dd,%rax
  80014f:	00 00 00 
  800152:	ff d0                	callq  *%rax
  800154:	48 8d 8d e0 fd ff ff 	lea    -0x220(%rbp),%rcx
  80015b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80015e:	ba 00 02 00 00       	mov    $0x200,%edx
  800163:	48 89 ce             	mov    %rcx,%rsi
  800166:	89 c7                	mov    %eax,%edi
  800168:	48 b8 1b 24 80 00 00 	movabs $0x80241b,%rax
  80016f:	00 00 00 
  800172:	ff d0                	callq  *%rax
  800174:	89 45 e8             	mov    %eax,-0x18(%rbp)
  800177:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  80017b:	7f 9d                	jg     80011a <umain+0xd7>
  80017d:	48 bf f5 4d 80 00 00 	movabs $0x804df5,%rdi
  800184:	00 00 00 
  800187:	b8 00 00 00 00       	mov    $0x0,%eax
  80018c:	48 ba 41 05 80 00 00 	movabs $0x800541,%rdx
  800193:	00 00 00 
  800196:	ff d2                	callq  *%rdx
  800198:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80019b:	89 c7                	mov    %eax,%edi
  80019d:	48 b8 f9 21 80 00 00 	movabs $0x8021f9,%rax
  8001a4:	00 00 00 
  8001a7:	ff d0                	callq  *%rax
  8001a9:	48 bf 09 4e 80 00 00 	movabs $0x804e09,%rdi
  8001b0:	00 00 00 
  8001b3:	b8 00 00 00 00       	mov    $0x0,%eax
  8001b8:	48 ba 41 05 80 00 00 	movabs $0x800541,%rdx
  8001bf:	00 00 00 
  8001c2:	ff d2                	callq  *%rdx
  8001c4:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8001ca:	48 b9 22 4e 80 00 00 	movabs $0x804e22,%rcx
  8001d1:	00 00 00 
  8001d4:	48 ba 2b 4e 80 00 00 	movabs $0x804e2b,%rdx
  8001db:	00 00 00 
  8001de:	48 be 34 4e 80 00 00 	movabs $0x804e34,%rsi
  8001e5:	00 00 00 
  8001e8:	48 bf 39 4e 80 00 00 	movabs $0x804e39,%rdi
  8001ef:	00 00 00 
  8001f2:	b8 00 00 00 00       	mov    $0x0,%eax
  8001f7:	49 b9 81 32 80 00 00 	movabs $0x803281,%r9
  8001fe:	00 00 00 
  800201:	41 ff d1             	callq  *%r9
  800204:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  800207:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  80020b:	79 30                	jns    80023d <umain+0x1fa>
  80020d:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  800210:	89 c1                	mov    %eax,%ecx
  800212:	48 ba 44 4e 80 00 00 	movabs $0x804e44,%rdx
  800219:	00 00 00 
  80021c:	be 28 00 00 00       	mov    $0x28,%esi
  800221:	48 bf c4 4d 80 00 00 	movabs $0x804dc4,%rdi
  800228:	00 00 00 
  80022b:	b8 00 00 00 00       	mov    $0x0,%eax
  800230:	49 b8 08 03 80 00 00 	movabs $0x800308,%r8
  800237:	00 00 00 
  80023a:	41 ff d0             	callq  *%r8
  80023d:	48 bf 60 4e 80 00 00 	movabs $0x804e60,%rdi
  800244:	00 00 00 
  800247:	b8 00 00 00 00       	mov    $0x0,%eax
  80024c:	48 ba 41 05 80 00 00 	movabs $0x800541,%rdx
  800253:	00 00 00 
  800256:	ff d2                	callq  *%rdx
  800258:	48 81 c4 28 02 00 00 	add    $0x228,%rsp
  80025f:	5b                   	pop    %rbx
  800260:	5d                   	pop    %rbp
  800261:	c3                   	retq   

0000000000800262 <libmain>:
  800262:	55                   	push   %rbp
  800263:	48 89 e5             	mov    %rsp,%rbp
  800266:	48 83 ec 10          	sub    $0x10,%rsp
  80026a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80026d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800271:	48 b8 a9 19 80 00 00 	movabs $0x8019a9,%rax
  800278:	00 00 00 
  80027b:	ff d0                	callq  *%rax
  80027d:	25 ff 03 00 00       	and    $0x3ff,%eax
  800282:	48 98                	cltq   
  800284:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  80028b:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  800292:	00 00 00 
  800295:	48 01 c2             	add    %rax,%rdx
  800298:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80029f:	00 00 00 
  8002a2:	48 89 10             	mov    %rdx,(%rax)
  8002a5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8002a9:	7e 14                	jle    8002bf <libmain+0x5d>
  8002ab:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8002af:	48 8b 10             	mov    (%rax),%rdx
  8002b2:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8002b9:	00 00 00 
  8002bc:	48 89 10             	mov    %rdx,(%rax)
  8002bf:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8002c3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8002c6:	48 89 d6             	mov    %rdx,%rsi
  8002c9:	89 c7                	mov    %eax,%edi
  8002cb:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8002d2:	00 00 00 
  8002d5:	ff d0                	callq  *%rax
  8002d7:	48 b8 e5 02 80 00 00 	movabs $0x8002e5,%rax
  8002de:	00 00 00 
  8002e1:	ff d0                	callq  *%rax
  8002e3:	c9                   	leaveq 
  8002e4:	c3                   	retq   

00000000008002e5 <exit>:
  8002e5:	55                   	push   %rbp
  8002e6:	48 89 e5             	mov    %rsp,%rbp
  8002e9:	48 b8 44 22 80 00 00 	movabs $0x802244,%rax
  8002f0:	00 00 00 
  8002f3:	ff d0                	callq  *%rax
  8002f5:	bf 00 00 00 00       	mov    $0x0,%edi
  8002fa:	48 b8 65 19 80 00 00 	movabs $0x801965,%rax
  800301:	00 00 00 
  800304:	ff d0                	callq  *%rax
  800306:	5d                   	pop    %rbp
  800307:	c3                   	retq   

0000000000800308 <_panic>:
  800308:	55                   	push   %rbp
  800309:	48 89 e5             	mov    %rsp,%rbp
  80030c:	53                   	push   %rbx
  80030d:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  800314:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  80031b:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  800321:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  800328:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  80032f:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  800336:	84 c0                	test   %al,%al
  800338:	74 23                	je     80035d <_panic+0x55>
  80033a:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  800341:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  800345:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  800349:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  80034d:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  800351:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  800355:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  800359:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  80035d:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  800364:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  80036b:	00 00 00 
  80036e:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  800375:	00 00 00 
  800378:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80037c:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  800383:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  80038a:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800391:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  800398:	00 00 00 
  80039b:	48 8b 18             	mov    (%rax),%rbx
  80039e:	48 b8 a9 19 80 00 00 	movabs $0x8019a9,%rax
  8003a5:	00 00 00 
  8003a8:	ff d0                	callq  *%rax
  8003aa:	8b 8d 14 ff ff ff    	mov    -0xec(%rbp),%ecx
  8003b0:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  8003b7:	41 89 c8             	mov    %ecx,%r8d
  8003ba:	48 89 d1             	mov    %rdx,%rcx
  8003bd:	48 89 da             	mov    %rbx,%rdx
  8003c0:	89 c6                	mov    %eax,%esi
  8003c2:	48 bf 80 4e 80 00 00 	movabs $0x804e80,%rdi
  8003c9:	00 00 00 
  8003cc:	b8 00 00 00 00       	mov    $0x0,%eax
  8003d1:	49 b9 41 05 80 00 00 	movabs $0x800541,%r9
  8003d8:	00 00 00 
  8003db:	41 ff d1             	callq  *%r9
  8003de:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  8003e5:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8003ec:	48 89 d6             	mov    %rdx,%rsi
  8003ef:	48 89 c7             	mov    %rax,%rdi
  8003f2:	48 b8 95 04 80 00 00 	movabs $0x800495,%rax
  8003f9:	00 00 00 
  8003fc:	ff d0                	callq  *%rax
  8003fe:	48 bf a3 4e 80 00 00 	movabs $0x804ea3,%rdi
  800405:	00 00 00 
  800408:	b8 00 00 00 00       	mov    $0x0,%eax
  80040d:	48 ba 41 05 80 00 00 	movabs $0x800541,%rdx
  800414:	00 00 00 
  800417:	ff d2                	callq  *%rdx
  800419:	cc                   	int3   
  80041a:	eb fd                	jmp    800419 <_panic+0x111>

000000000080041c <putch>:
  80041c:	55                   	push   %rbp
  80041d:	48 89 e5             	mov    %rsp,%rbp
  800420:	48 83 ec 10          	sub    $0x10,%rsp
  800424:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800427:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80042b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80042f:	8b 00                	mov    (%rax),%eax
  800431:	8d 48 01             	lea    0x1(%rax),%ecx
  800434:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800438:	89 0a                	mov    %ecx,(%rdx)
  80043a:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80043d:	89 d1                	mov    %edx,%ecx
  80043f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800443:	48 98                	cltq   
  800445:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  800449:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80044d:	8b 00                	mov    (%rax),%eax
  80044f:	3d ff 00 00 00       	cmp    $0xff,%eax
  800454:	75 2c                	jne    800482 <putch+0x66>
  800456:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80045a:	8b 00                	mov    (%rax),%eax
  80045c:	48 98                	cltq   
  80045e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800462:	48 83 c2 08          	add    $0x8,%rdx
  800466:	48 89 c6             	mov    %rax,%rsi
  800469:	48 89 d7             	mov    %rdx,%rdi
  80046c:	48 b8 dd 18 80 00 00 	movabs $0x8018dd,%rax
  800473:	00 00 00 
  800476:	ff d0                	callq  *%rax
  800478:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80047c:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  800482:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800486:	8b 40 04             	mov    0x4(%rax),%eax
  800489:	8d 50 01             	lea    0x1(%rax),%edx
  80048c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800490:	89 50 04             	mov    %edx,0x4(%rax)
  800493:	c9                   	leaveq 
  800494:	c3                   	retq   

0000000000800495 <vcprintf>:
  800495:	55                   	push   %rbp
  800496:	48 89 e5             	mov    %rsp,%rbp
  800499:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  8004a0:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  8004a7:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  8004ae:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  8004b5:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  8004bc:	48 8b 0a             	mov    (%rdx),%rcx
  8004bf:	48 89 08             	mov    %rcx,(%rax)
  8004c2:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8004c6:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8004ca:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8004ce:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8004d2:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  8004d9:	00 00 00 
  8004dc:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  8004e3:	00 00 00 
  8004e6:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  8004ed:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  8004f4:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  8004fb:	48 89 c6             	mov    %rax,%rsi
  8004fe:	48 bf 1c 04 80 00 00 	movabs $0x80041c,%rdi
  800505:	00 00 00 
  800508:	48 b8 f4 08 80 00 00 	movabs $0x8008f4,%rax
  80050f:	00 00 00 
  800512:	ff d0                	callq  *%rax
  800514:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  80051a:	48 98                	cltq   
  80051c:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  800523:	48 83 c2 08          	add    $0x8,%rdx
  800527:	48 89 c6             	mov    %rax,%rsi
  80052a:	48 89 d7             	mov    %rdx,%rdi
  80052d:	48 b8 dd 18 80 00 00 	movabs $0x8018dd,%rax
  800534:	00 00 00 
  800537:	ff d0                	callq  *%rax
  800539:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  80053f:	c9                   	leaveq 
  800540:	c3                   	retq   

0000000000800541 <cprintf>:
  800541:	55                   	push   %rbp
  800542:	48 89 e5             	mov    %rsp,%rbp
  800545:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  80054c:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  800553:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  80055a:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800561:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800568:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  80056f:	84 c0                	test   %al,%al
  800571:	74 20                	je     800593 <cprintf+0x52>
  800573:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800577:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80057b:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  80057f:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800583:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800587:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  80058b:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  80058f:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800593:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  80059a:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  8005a1:	00 00 00 
  8005a4:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8005ab:	00 00 00 
  8005ae:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8005b2:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8005b9:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8005c0:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8005c7:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  8005ce:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8005d5:	48 8b 0a             	mov    (%rdx),%rcx
  8005d8:	48 89 08             	mov    %rcx,(%rax)
  8005db:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8005df:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8005e3:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8005e7:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8005eb:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  8005f2:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8005f9:	48 89 d6             	mov    %rdx,%rsi
  8005fc:	48 89 c7             	mov    %rax,%rdi
  8005ff:	48 b8 95 04 80 00 00 	movabs $0x800495,%rax
  800606:	00 00 00 
  800609:	ff d0                	callq  *%rax
  80060b:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  800611:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  800617:	c9                   	leaveq 
  800618:	c3                   	retq   

0000000000800619 <printnum>:
  800619:	55                   	push   %rbp
  80061a:	48 89 e5             	mov    %rsp,%rbp
  80061d:	53                   	push   %rbx
  80061e:	48 83 ec 38          	sub    $0x38,%rsp
  800622:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800626:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80062a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80062e:	89 4d d4             	mov    %ecx,-0x2c(%rbp)
  800631:	44 89 45 d0          	mov    %r8d,-0x30(%rbp)
  800635:	44 89 4d cc          	mov    %r9d,-0x34(%rbp)
  800639:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  80063c:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  800640:	77 3b                	ja     80067d <printnum+0x64>
  800642:	8b 45 d0             	mov    -0x30(%rbp),%eax
  800645:	44 8d 40 ff          	lea    -0x1(%rax),%r8d
  800649:	8b 5d d4             	mov    -0x2c(%rbp),%ebx
  80064c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800650:	ba 00 00 00 00       	mov    $0x0,%edx
  800655:	48 f7 f3             	div    %rbx
  800658:	48 89 c2             	mov    %rax,%rdx
  80065b:	8b 7d cc             	mov    -0x34(%rbp),%edi
  80065e:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  800661:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
  800665:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800669:	41 89 f9             	mov    %edi,%r9d
  80066c:	48 89 c7             	mov    %rax,%rdi
  80066f:	48 b8 19 06 80 00 00 	movabs $0x800619,%rax
  800676:	00 00 00 
  800679:	ff d0                	callq  *%rax
  80067b:	eb 1e                	jmp    80069b <printnum+0x82>
  80067d:	eb 12                	jmp    800691 <printnum+0x78>
  80067f:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  800683:	8b 55 cc             	mov    -0x34(%rbp),%edx
  800686:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80068a:	48 89 ce             	mov    %rcx,%rsi
  80068d:	89 d7                	mov    %edx,%edi
  80068f:	ff d0                	callq  *%rax
  800691:	83 6d d0 01          	subl   $0x1,-0x30(%rbp)
  800695:	83 7d d0 00          	cmpl   $0x0,-0x30(%rbp)
  800699:	7f e4                	jg     80067f <printnum+0x66>
  80069b:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  80069e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8006a2:	ba 00 00 00 00       	mov    $0x0,%edx
  8006a7:	48 f7 f1             	div    %rcx
  8006aa:	48 89 d0             	mov    %rdx,%rax
  8006ad:	48 ba b0 50 80 00 00 	movabs $0x8050b0,%rdx
  8006b4:	00 00 00 
  8006b7:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
  8006bb:	0f be d0             	movsbl %al,%edx
  8006be:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8006c2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006c6:	48 89 ce             	mov    %rcx,%rsi
  8006c9:	89 d7                	mov    %edx,%edi
  8006cb:	ff d0                	callq  *%rax
  8006cd:	48 83 c4 38          	add    $0x38,%rsp
  8006d1:	5b                   	pop    %rbx
  8006d2:	5d                   	pop    %rbp
  8006d3:	c3                   	retq   

00000000008006d4 <getuint>:
  8006d4:	55                   	push   %rbp
  8006d5:	48 89 e5             	mov    %rsp,%rbp
  8006d8:	48 83 ec 1c          	sub    $0x1c,%rsp
  8006dc:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8006e0:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8006e3:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8006e7:	7e 52                	jle    80073b <getuint+0x67>
  8006e9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006ed:	8b 00                	mov    (%rax),%eax
  8006ef:	83 f8 30             	cmp    $0x30,%eax
  8006f2:	73 24                	jae    800718 <getuint+0x44>
  8006f4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006f8:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8006fc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800700:	8b 00                	mov    (%rax),%eax
  800702:	89 c0                	mov    %eax,%eax
  800704:	48 01 d0             	add    %rdx,%rax
  800707:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80070b:	8b 12                	mov    (%rdx),%edx
  80070d:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800710:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800714:	89 0a                	mov    %ecx,(%rdx)
  800716:	eb 17                	jmp    80072f <getuint+0x5b>
  800718:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80071c:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800720:	48 89 d0             	mov    %rdx,%rax
  800723:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800727:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80072b:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80072f:	48 8b 00             	mov    (%rax),%rax
  800732:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800736:	e9 a3 00 00 00       	jmpq   8007de <getuint+0x10a>
  80073b:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  80073f:	74 4f                	je     800790 <getuint+0xbc>
  800741:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800745:	8b 00                	mov    (%rax),%eax
  800747:	83 f8 30             	cmp    $0x30,%eax
  80074a:	73 24                	jae    800770 <getuint+0x9c>
  80074c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800750:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800754:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800758:	8b 00                	mov    (%rax),%eax
  80075a:	89 c0                	mov    %eax,%eax
  80075c:	48 01 d0             	add    %rdx,%rax
  80075f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800763:	8b 12                	mov    (%rdx),%edx
  800765:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800768:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80076c:	89 0a                	mov    %ecx,(%rdx)
  80076e:	eb 17                	jmp    800787 <getuint+0xb3>
  800770:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800774:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800778:	48 89 d0             	mov    %rdx,%rax
  80077b:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  80077f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800783:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800787:	48 8b 00             	mov    (%rax),%rax
  80078a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80078e:	eb 4e                	jmp    8007de <getuint+0x10a>
  800790:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800794:	8b 00                	mov    (%rax),%eax
  800796:	83 f8 30             	cmp    $0x30,%eax
  800799:	73 24                	jae    8007bf <getuint+0xeb>
  80079b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80079f:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8007a3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007a7:	8b 00                	mov    (%rax),%eax
  8007a9:	89 c0                	mov    %eax,%eax
  8007ab:	48 01 d0             	add    %rdx,%rax
  8007ae:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007b2:	8b 12                	mov    (%rdx),%edx
  8007b4:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8007b7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007bb:	89 0a                	mov    %ecx,(%rdx)
  8007bd:	eb 17                	jmp    8007d6 <getuint+0x102>
  8007bf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007c3:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8007c7:	48 89 d0             	mov    %rdx,%rax
  8007ca:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8007ce:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007d2:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8007d6:	8b 00                	mov    (%rax),%eax
  8007d8:	89 c0                	mov    %eax,%eax
  8007da:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8007de:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8007e2:	c9                   	leaveq 
  8007e3:	c3                   	retq   

00000000008007e4 <getint>:
  8007e4:	55                   	push   %rbp
  8007e5:	48 89 e5             	mov    %rsp,%rbp
  8007e8:	48 83 ec 1c          	sub    $0x1c,%rsp
  8007ec:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8007f0:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8007f3:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8007f7:	7e 52                	jle    80084b <getint+0x67>
  8007f9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007fd:	8b 00                	mov    (%rax),%eax
  8007ff:	83 f8 30             	cmp    $0x30,%eax
  800802:	73 24                	jae    800828 <getint+0x44>
  800804:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800808:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80080c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800810:	8b 00                	mov    (%rax),%eax
  800812:	89 c0                	mov    %eax,%eax
  800814:	48 01 d0             	add    %rdx,%rax
  800817:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80081b:	8b 12                	mov    (%rdx),%edx
  80081d:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800820:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800824:	89 0a                	mov    %ecx,(%rdx)
  800826:	eb 17                	jmp    80083f <getint+0x5b>
  800828:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80082c:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800830:	48 89 d0             	mov    %rdx,%rax
  800833:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800837:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80083b:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80083f:	48 8b 00             	mov    (%rax),%rax
  800842:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800846:	e9 a3 00 00 00       	jmpq   8008ee <getint+0x10a>
  80084b:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  80084f:	74 4f                	je     8008a0 <getint+0xbc>
  800851:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800855:	8b 00                	mov    (%rax),%eax
  800857:	83 f8 30             	cmp    $0x30,%eax
  80085a:	73 24                	jae    800880 <getint+0x9c>
  80085c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800860:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800864:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800868:	8b 00                	mov    (%rax),%eax
  80086a:	89 c0                	mov    %eax,%eax
  80086c:	48 01 d0             	add    %rdx,%rax
  80086f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800873:	8b 12                	mov    (%rdx),%edx
  800875:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800878:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80087c:	89 0a                	mov    %ecx,(%rdx)
  80087e:	eb 17                	jmp    800897 <getint+0xb3>
  800880:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800884:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800888:	48 89 d0             	mov    %rdx,%rax
  80088b:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  80088f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800893:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800897:	48 8b 00             	mov    (%rax),%rax
  80089a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80089e:	eb 4e                	jmp    8008ee <getint+0x10a>
  8008a0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008a4:	8b 00                	mov    (%rax),%eax
  8008a6:	83 f8 30             	cmp    $0x30,%eax
  8008a9:	73 24                	jae    8008cf <getint+0xeb>
  8008ab:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008af:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8008b3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008b7:	8b 00                	mov    (%rax),%eax
  8008b9:	89 c0                	mov    %eax,%eax
  8008bb:	48 01 d0             	add    %rdx,%rax
  8008be:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008c2:	8b 12                	mov    (%rdx),%edx
  8008c4:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8008c7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008cb:	89 0a                	mov    %ecx,(%rdx)
  8008cd:	eb 17                	jmp    8008e6 <getint+0x102>
  8008cf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008d3:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8008d7:	48 89 d0             	mov    %rdx,%rax
  8008da:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8008de:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008e2:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8008e6:	8b 00                	mov    (%rax),%eax
  8008e8:	48 98                	cltq   
  8008ea:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8008ee:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8008f2:	c9                   	leaveq 
  8008f3:	c3                   	retq   

00000000008008f4 <vprintfmt>:
  8008f4:	55                   	push   %rbp
  8008f5:	48 89 e5             	mov    %rsp,%rbp
  8008f8:	41 54                	push   %r12
  8008fa:	53                   	push   %rbx
  8008fb:	48 83 ec 60          	sub    $0x60,%rsp
  8008ff:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  800903:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  800907:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  80090b:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  80090f:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800913:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  800917:	48 8b 0a             	mov    (%rdx),%rcx
  80091a:	48 89 08             	mov    %rcx,(%rax)
  80091d:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800921:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800925:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800929:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80092d:	eb 17                	jmp    800946 <vprintfmt+0x52>
  80092f:	85 db                	test   %ebx,%ebx
  800931:	0f 84 cc 04 00 00    	je     800e03 <vprintfmt+0x50f>
  800937:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  80093b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80093f:	48 89 d6             	mov    %rdx,%rsi
  800942:	89 df                	mov    %ebx,%edi
  800944:	ff d0                	callq  *%rax
  800946:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  80094a:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80094e:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800952:	0f b6 00             	movzbl (%rax),%eax
  800955:	0f b6 d8             	movzbl %al,%ebx
  800958:	83 fb 25             	cmp    $0x25,%ebx
  80095b:	75 d2                	jne    80092f <vprintfmt+0x3b>
  80095d:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  800961:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  800968:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  80096f:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800976:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  80097d:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800981:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800985:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800989:	0f b6 00             	movzbl (%rax),%eax
  80098c:	0f b6 d8             	movzbl %al,%ebx
  80098f:	8d 43 dd             	lea    -0x23(%rbx),%eax
  800992:	83 f8 55             	cmp    $0x55,%eax
  800995:	0f 87 34 04 00 00    	ja     800dcf <vprintfmt+0x4db>
  80099b:	89 c0                	mov    %eax,%eax
  80099d:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8009a4:	00 
  8009a5:	48 b8 d8 50 80 00 00 	movabs $0x8050d8,%rax
  8009ac:	00 00 00 
  8009af:	48 01 d0             	add    %rdx,%rax
  8009b2:	48 8b 00             	mov    (%rax),%rax
  8009b5:	ff e0                	jmpq   *%rax
  8009b7:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  8009bb:	eb c0                	jmp    80097d <vprintfmt+0x89>
  8009bd:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  8009c1:	eb ba                	jmp    80097d <vprintfmt+0x89>
  8009c3:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  8009ca:	8b 55 d8             	mov    -0x28(%rbp),%edx
  8009cd:	89 d0                	mov    %edx,%eax
  8009cf:	c1 e0 02             	shl    $0x2,%eax
  8009d2:	01 d0                	add    %edx,%eax
  8009d4:	01 c0                	add    %eax,%eax
  8009d6:	01 d8                	add    %ebx,%eax
  8009d8:	83 e8 30             	sub    $0x30,%eax
  8009db:	89 45 d8             	mov    %eax,-0x28(%rbp)
  8009de:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8009e2:	0f b6 00             	movzbl (%rax),%eax
  8009e5:	0f be d8             	movsbl %al,%ebx
  8009e8:	83 fb 2f             	cmp    $0x2f,%ebx
  8009eb:	7e 0c                	jle    8009f9 <vprintfmt+0x105>
  8009ed:	83 fb 39             	cmp    $0x39,%ebx
  8009f0:	7f 07                	jg     8009f9 <vprintfmt+0x105>
  8009f2:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  8009f7:	eb d1                	jmp    8009ca <vprintfmt+0xd6>
  8009f9:	eb 58                	jmp    800a53 <vprintfmt+0x15f>
  8009fb:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8009fe:	83 f8 30             	cmp    $0x30,%eax
  800a01:	73 17                	jae    800a1a <vprintfmt+0x126>
  800a03:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800a07:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800a0a:	89 c0                	mov    %eax,%eax
  800a0c:	48 01 d0             	add    %rdx,%rax
  800a0f:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800a12:	83 c2 08             	add    $0x8,%edx
  800a15:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800a18:	eb 0f                	jmp    800a29 <vprintfmt+0x135>
  800a1a:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800a1e:	48 89 d0             	mov    %rdx,%rax
  800a21:	48 83 c2 08          	add    $0x8,%rdx
  800a25:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800a29:	8b 00                	mov    (%rax),%eax
  800a2b:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800a2e:	eb 23                	jmp    800a53 <vprintfmt+0x15f>
  800a30:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800a34:	79 0c                	jns    800a42 <vprintfmt+0x14e>
  800a36:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  800a3d:	e9 3b ff ff ff       	jmpq   80097d <vprintfmt+0x89>
  800a42:	e9 36 ff ff ff       	jmpq   80097d <vprintfmt+0x89>
  800a47:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  800a4e:	e9 2a ff ff ff       	jmpq   80097d <vprintfmt+0x89>
  800a53:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800a57:	79 12                	jns    800a6b <vprintfmt+0x177>
  800a59:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800a5c:	89 45 dc             	mov    %eax,-0x24(%rbp)
  800a5f:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800a66:	e9 12 ff ff ff       	jmpq   80097d <vprintfmt+0x89>
  800a6b:	e9 0d ff ff ff       	jmpq   80097d <vprintfmt+0x89>
  800a70:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  800a74:	e9 04 ff ff ff       	jmpq   80097d <vprintfmt+0x89>
  800a79:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800a7c:	83 f8 30             	cmp    $0x30,%eax
  800a7f:	73 17                	jae    800a98 <vprintfmt+0x1a4>
  800a81:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800a85:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800a88:	89 c0                	mov    %eax,%eax
  800a8a:	48 01 d0             	add    %rdx,%rax
  800a8d:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800a90:	83 c2 08             	add    $0x8,%edx
  800a93:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800a96:	eb 0f                	jmp    800aa7 <vprintfmt+0x1b3>
  800a98:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800a9c:	48 89 d0             	mov    %rdx,%rax
  800a9f:	48 83 c2 08          	add    $0x8,%rdx
  800aa3:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800aa7:	8b 10                	mov    (%rax),%edx
  800aa9:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800aad:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ab1:	48 89 ce             	mov    %rcx,%rsi
  800ab4:	89 d7                	mov    %edx,%edi
  800ab6:	ff d0                	callq  *%rax
  800ab8:	e9 40 03 00 00       	jmpq   800dfd <vprintfmt+0x509>
  800abd:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800ac0:	83 f8 30             	cmp    $0x30,%eax
  800ac3:	73 17                	jae    800adc <vprintfmt+0x1e8>
  800ac5:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800ac9:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800acc:	89 c0                	mov    %eax,%eax
  800ace:	48 01 d0             	add    %rdx,%rax
  800ad1:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800ad4:	83 c2 08             	add    $0x8,%edx
  800ad7:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800ada:	eb 0f                	jmp    800aeb <vprintfmt+0x1f7>
  800adc:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800ae0:	48 89 d0             	mov    %rdx,%rax
  800ae3:	48 83 c2 08          	add    $0x8,%rdx
  800ae7:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800aeb:	8b 18                	mov    (%rax),%ebx
  800aed:	85 db                	test   %ebx,%ebx
  800aef:	79 02                	jns    800af3 <vprintfmt+0x1ff>
  800af1:	f7 db                	neg    %ebx
  800af3:	83 fb 15             	cmp    $0x15,%ebx
  800af6:	7f 16                	jg     800b0e <vprintfmt+0x21a>
  800af8:	48 b8 00 50 80 00 00 	movabs $0x805000,%rax
  800aff:	00 00 00 
  800b02:	48 63 d3             	movslq %ebx,%rdx
  800b05:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800b09:	4d 85 e4             	test   %r12,%r12
  800b0c:	75 2e                	jne    800b3c <vprintfmt+0x248>
  800b0e:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800b12:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b16:	89 d9                	mov    %ebx,%ecx
  800b18:	48 ba c1 50 80 00 00 	movabs $0x8050c1,%rdx
  800b1f:	00 00 00 
  800b22:	48 89 c7             	mov    %rax,%rdi
  800b25:	b8 00 00 00 00       	mov    $0x0,%eax
  800b2a:	49 b8 0c 0e 80 00 00 	movabs $0x800e0c,%r8
  800b31:	00 00 00 
  800b34:	41 ff d0             	callq  *%r8
  800b37:	e9 c1 02 00 00       	jmpq   800dfd <vprintfmt+0x509>
  800b3c:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800b40:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b44:	4c 89 e1             	mov    %r12,%rcx
  800b47:	48 ba ca 50 80 00 00 	movabs $0x8050ca,%rdx
  800b4e:	00 00 00 
  800b51:	48 89 c7             	mov    %rax,%rdi
  800b54:	b8 00 00 00 00       	mov    $0x0,%eax
  800b59:	49 b8 0c 0e 80 00 00 	movabs $0x800e0c,%r8
  800b60:	00 00 00 
  800b63:	41 ff d0             	callq  *%r8
  800b66:	e9 92 02 00 00       	jmpq   800dfd <vprintfmt+0x509>
  800b6b:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b6e:	83 f8 30             	cmp    $0x30,%eax
  800b71:	73 17                	jae    800b8a <vprintfmt+0x296>
  800b73:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800b77:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b7a:	89 c0                	mov    %eax,%eax
  800b7c:	48 01 d0             	add    %rdx,%rax
  800b7f:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b82:	83 c2 08             	add    $0x8,%edx
  800b85:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800b88:	eb 0f                	jmp    800b99 <vprintfmt+0x2a5>
  800b8a:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800b8e:	48 89 d0             	mov    %rdx,%rax
  800b91:	48 83 c2 08          	add    $0x8,%rdx
  800b95:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800b99:	4c 8b 20             	mov    (%rax),%r12
  800b9c:	4d 85 e4             	test   %r12,%r12
  800b9f:	75 0a                	jne    800bab <vprintfmt+0x2b7>
  800ba1:	49 bc cd 50 80 00 00 	movabs $0x8050cd,%r12
  800ba8:	00 00 00 
  800bab:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800baf:	7e 3f                	jle    800bf0 <vprintfmt+0x2fc>
  800bb1:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  800bb5:	74 39                	je     800bf0 <vprintfmt+0x2fc>
  800bb7:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800bba:	48 98                	cltq   
  800bbc:	48 89 c6             	mov    %rax,%rsi
  800bbf:	4c 89 e7             	mov    %r12,%rdi
  800bc2:	48 b8 b8 10 80 00 00 	movabs $0x8010b8,%rax
  800bc9:	00 00 00 
  800bcc:	ff d0                	callq  *%rax
  800bce:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800bd1:	eb 17                	jmp    800bea <vprintfmt+0x2f6>
  800bd3:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800bd7:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800bdb:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800bdf:	48 89 ce             	mov    %rcx,%rsi
  800be2:	89 d7                	mov    %edx,%edi
  800be4:	ff d0                	callq  *%rax
  800be6:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800bea:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800bee:	7f e3                	jg     800bd3 <vprintfmt+0x2df>
  800bf0:	eb 37                	jmp    800c29 <vprintfmt+0x335>
  800bf2:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  800bf6:	74 1e                	je     800c16 <vprintfmt+0x322>
  800bf8:	83 fb 1f             	cmp    $0x1f,%ebx
  800bfb:	7e 05                	jle    800c02 <vprintfmt+0x30e>
  800bfd:	83 fb 7e             	cmp    $0x7e,%ebx
  800c00:	7e 14                	jle    800c16 <vprintfmt+0x322>
  800c02:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c06:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c0a:	48 89 d6             	mov    %rdx,%rsi
  800c0d:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800c12:	ff d0                	callq  *%rax
  800c14:	eb 0f                	jmp    800c25 <vprintfmt+0x331>
  800c16:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c1a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c1e:	48 89 d6             	mov    %rdx,%rsi
  800c21:	89 df                	mov    %ebx,%edi
  800c23:	ff d0                	callq  *%rax
  800c25:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800c29:	4c 89 e0             	mov    %r12,%rax
  800c2c:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800c30:	0f b6 00             	movzbl (%rax),%eax
  800c33:	0f be d8             	movsbl %al,%ebx
  800c36:	85 db                	test   %ebx,%ebx
  800c38:	74 10                	je     800c4a <vprintfmt+0x356>
  800c3a:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800c3e:	78 b2                	js     800bf2 <vprintfmt+0x2fe>
  800c40:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800c44:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800c48:	79 a8                	jns    800bf2 <vprintfmt+0x2fe>
  800c4a:	eb 16                	jmp    800c62 <vprintfmt+0x36e>
  800c4c:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c50:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c54:	48 89 d6             	mov    %rdx,%rsi
  800c57:	bf 20 00 00 00       	mov    $0x20,%edi
  800c5c:	ff d0                	callq  *%rax
  800c5e:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800c62:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800c66:	7f e4                	jg     800c4c <vprintfmt+0x358>
  800c68:	e9 90 01 00 00       	jmpq   800dfd <vprintfmt+0x509>
  800c6d:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800c71:	be 03 00 00 00       	mov    $0x3,%esi
  800c76:	48 89 c7             	mov    %rax,%rdi
  800c79:	48 b8 e4 07 80 00 00 	movabs $0x8007e4,%rax
  800c80:	00 00 00 
  800c83:	ff d0                	callq  *%rax
  800c85:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800c89:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c8d:	48 85 c0             	test   %rax,%rax
  800c90:	79 1d                	jns    800caf <vprintfmt+0x3bb>
  800c92:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c96:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c9a:	48 89 d6             	mov    %rdx,%rsi
  800c9d:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800ca2:	ff d0                	callq  *%rax
  800ca4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ca8:	48 f7 d8             	neg    %rax
  800cab:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800caf:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800cb6:	e9 d5 00 00 00       	jmpq   800d90 <vprintfmt+0x49c>
  800cbb:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800cbf:	be 03 00 00 00       	mov    $0x3,%esi
  800cc4:	48 89 c7             	mov    %rax,%rdi
  800cc7:	48 b8 d4 06 80 00 00 	movabs $0x8006d4,%rax
  800cce:	00 00 00 
  800cd1:	ff d0                	callq  *%rax
  800cd3:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800cd7:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800cde:	e9 ad 00 00 00       	jmpq   800d90 <vprintfmt+0x49c>
  800ce3:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800ce7:	be 03 00 00 00       	mov    $0x3,%esi
  800cec:	48 89 c7             	mov    %rax,%rdi
  800cef:	48 b8 d4 06 80 00 00 	movabs $0x8006d4,%rax
  800cf6:	00 00 00 
  800cf9:	ff d0                	callq  *%rax
  800cfb:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800cff:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800d06:	e9 85 00 00 00       	jmpq   800d90 <vprintfmt+0x49c>
  800d0b:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d0f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d13:	48 89 d6             	mov    %rdx,%rsi
  800d16:	bf 30 00 00 00       	mov    $0x30,%edi
  800d1b:	ff d0                	callq  *%rax
  800d1d:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d21:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d25:	48 89 d6             	mov    %rdx,%rsi
  800d28:	bf 78 00 00 00       	mov    $0x78,%edi
  800d2d:	ff d0                	callq  *%rax
  800d2f:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800d32:	83 f8 30             	cmp    $0x30,%eax
  800d35:	73 17                	jae    800d4e <vprintfmt+0x45a>
  800d37:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800d3b:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800d3e:	89 c0                	mov    %eax,%eax
  800d40:	48 01 d0             	add    %rdx,%rax
  800d43:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800d46:	83 c2 08             	add    $0x8,%edx
  800d49:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800d4c:	eb 0f                	jmp    800d5d <vprintfmt+0x469>
  800d4e:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800d52:	48 89 d0             	mov    %rdx,%rax
  800d55:	48 83 c2 08          	add    $0x8,%rdx
  800d59:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800d5d:	48 8b 00             	mov    (%rax),%rax
  800d60:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800d64:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800d6b:	eb 23                	jmp    800d90 <vprintfmt+0x49c>
  800d6d:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800d71:	be 03 00 00 00       	mov    $0x3,%esi
  800d76:	48 89 c7             	mov    %rax,%rdi
  800d79:	48 b8 d4 06 80 00 00 	movabs $0x8006d4,%rax
  800d80:	00 00 00 
  800d83:	ff d0                	callq  *%rax
  800d85:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800d89:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800d90:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  800d95:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800d98:	8b 7d dc             	mov    -0x24(%rbp),%edi
  800d9b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800d9f:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800da3:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800da7:	45 89 c1             	mov    %r8d,%r9d
  800daa:	41 89 f8             	mov    %edi,%r8d
  800dad:	48 89 c7             	mov    %rax,%rdi
  800db0:	48 b8 19 06 80 00 00 	movabs $0x800619,%rax
  800db7:	00 00 00 
  800dba:	ff d0                	callq  *%rax
  800dbc:	eb 3f                	jmp    800dfd <vprintfmt+0x509>
  800dbe:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800dc2:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800dc6:	48 89 d6             	mov    %rdx,%rsi
  800dc9:	89 df                	mov    %ebx,%edi
  800dcb:	ff d0                	callq  *%rax
  800dcd:	eb 2e                	jmp    800dfd <vprintfmt+0x509>
  800dcf:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800dd3:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800dd7:	48 89 d6             	mov    %rdx,%rsi
  800dda:	bf 25 00 00 00       	mov    $0x25,%edi
  800ddf:	ff d0                	callq  *%rax
  800de1:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800de6:	eb 05                	jmp    800ded <vprintfmt+0x4f9>
  800de8:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800ded:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800df1:	48 83 e8 01          	sub    $0x1,%rax
  800df5:	0f b6 00             	movzbl (%rax),%eax
  800df8:	3c 25                	cmp    $0x25,%al
  800dfa:	75 ec                	jne    800de8 <vprintfmt+0x4f4>
  800dfc:	90                   	nop
  800dfd:	90                   	nop
  800dfe:	e9 43 fb ff ff       	jmpq   800946 <vprintfmt+0x52>
  800e03:	48 83 c4 60          	add    $0x60,%rsp
  800e07:	5b                   	pop    %rbx
  800e08:	41 5c                	pop    %r12
  800e0a:	5d                   	pop    %rbp
  800e0b:	c3                   	retq   

0000000000800e0c <printfmt>:
  800e0c:	55                   	push   %rbp
  800e0d:	48 89 e5             	mov    %rsp,%rbp
  800e10:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  800e17:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  800e1e:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  800e25:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800e2c:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800e33:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800e3a:	84 c0                	test   %al,%al
  800e3c:	74 20                	je     800e5e <printfmt+0x52>
  800e3e:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800e42:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800e46:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800e4a:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800e4e:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800e52:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800e56:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800e5a:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800e5e:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  800e65:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  800e6c:	00 00 00 
  800e6f:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  800e76:	00 00 00 
  800e79:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800e7d:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800e84:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800e8b:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  800e92:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  800e99:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800ea0:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  800ea7:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  800eae:	48 89 c7             	mov    %rax,%rdi
  800eb1:	48 b8 f4 08 80 00 00 	movabs $0x8008f4,%rax
  800eb8:	00 00 00 
  800ebb:	ff d0                	callq  *%rax
  800ebd:	c9                   	leaveq 
  800ebe:	c3                   	retq   

0000000000800ebf <sprintputch>:
  800ebf:	55                   	push   %rbp
  800ec0:	48 89 e5             	mov    %rsp,%rbp
  800ec3:	48 83 ec 10          	sub    $0x10,%rsp
  800ec7:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800eca:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800ece:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800ed2:	8b 40 10             	mov    0x10(%rax),%eax
  800ed5:	8d 50 01             	lea    0x1(%rax),%edx
  800ed8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800edc:	89 50 10             	mov    %edx,0x10(%rax)
  800edf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800ee3:	48 8b 10             	mov    (%rax),%rdx
  800ee6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800eea:	48 8b 40 08          	mov    0x8(%rax),%rax
  800eee:	48 39 c2             	cmp    %rax,%rdx
  800ef1:	73 17                	jae    800f0a <sprintputch+0x4b>
  800ef3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800ef7:	48 8b 00             	mov    (%rax),%rax
  800efa:	48 8d 48 01          	lea    0x1(%rax),%rcx
  800efe:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800f02:	48 89 0a             	mov    %rcx,(%rdx)
  800f05:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800f08:	88 10                	mov    %dl,(%rax)
  800f0a:	c9                   	leaveq 
  800f0b:	c3                   	retq   

0000000000800f0c <vsnprintf>:
  800f0c:	55                   	push   %rbp
  800f0d:	48 89 e5             	mov    %rsp,%rbp
  800f10:	48 83 ec 50          	sub    $0x50,%rsp
  800f14:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  800f18:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  800f1b:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  800f1f:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  800f23:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  800f27:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  800f2b:	48 8b 0a             	mov    (%rdx),%rcx
  800f2e:	48 89 08             	mov    %rcx,(%rax)
  800f31:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800f35:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800f39:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800f3d:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800f41:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800f45:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  800f49:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  800f4c:	48 98                	cltq   
  800f4e:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  800f52:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800f56:	48 01 d0             	add    %rdx,%rax
  800f59:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  800f5d:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800f64:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  800f69:	74 06                	je     800f71 <vsnprintf+0x65>
  800f6b:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  800f6f:	7f 07                	jg     800f78 <vsnprintf+0x6c>
  800f71:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800f76:	eb 2f                	jmp    800fa7 <vsnprintf+0x9b>
  800f78:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  800f7c:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  800f80:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  800f84:	48 89 c6             	mov    %rax,%rsi
  800f87:	48 bf bf 0e 80 00 00 	movabs $0x800ebf,%rdi
  800f8e:	00 00 00 
  800f91:	48 b8 f4 08 80 00 00 	movabs $0x8008f4,%rax
  800f98:	00 00 00 
  800f9b:	ff d0                	callq  *%rax
  800f9d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800fa1:	c6 00 00             	movb   $0x0,(%rax)
  800fa4:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800fa7:	c9                   	leaveq 
  800fa8:	c3                   	retq   

0000000000800fa9 <snprintf>:
  800fa9:	55                   	push   %rbp
  800faa:	48 89 e5             	mov    %rsp,%rbp
  800fad:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  800fb4:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800fbb:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  800fc1:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800fc8:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800fcf:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800fd6:	84 c0                	test   %al,%al
  800fd8:	74 20                	je     800ffa <snprintf+0x51>
  800fda:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800fde:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800fe2:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800fe6:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800fea:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800fee:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800ff2:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800ff6:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800ffa:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  801001:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  801008:	00 00 00 
  80100b:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  801012:	00 00 00 
  801015:	48 8d 45 10          	lea    0x10(%rbp),%rax
  801019:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  801020:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  801027:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  80102e:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  801035:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  80103c:	48 8b 0a             	mov    (%rdx),%rcx
  80103f:	48 89 08             	mov    %rcx,(%rax)
  801042:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  801046:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80104a:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  80104e:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801052:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  801059:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  801060:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  801066:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  80106d:	48 89 c7             	mov    %rax,%rdi
  801070:	48 b8 0c 0f 80 00 00 	movabs $0x800f0c,%rax
  801077:	00 00 00 
  80107a:	ff d0                	callq  *%rax
  80107c:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  801082:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  801088:	c9                   	leaveq 
  801089:	c3                   	retq   

000000000080108a <strlen>:
  80108a:	55                   	push   %rbp
  80108b:	48 89 e5             	mov    %rsp,%rbp
  80108e:	48 83 ec 18          	sub    $0x18,%rsp
  801092:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801096:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80109d:	eb 09                	jmp    8010a8 <strlen+0x1e>
  80109f:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8010a3:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8010a8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010ac:	0f b6 00             	movzbl (%rax),%eax
  8010af:	84 c0                	test   %al,%al
  8010b1:	75 ec                	jne    80109f <strlen+0x15>
  8010b3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8010b6:	c9                   	leaveq 
  8010b7:	c3                   	retq   

00000000008010b8 <strnlen>:
  8010b8:	55                   	push   %rbp
  8010b9:	48 89 e5             	mov    %rsp,%rbp
  8010bc:	48 83 ec 20          	sub    $0x20,%rsp
  8010c0:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8010c4:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8010c8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8010cf:	eb 0e                	jmp    8010df <strnlen+0x27>
  8010d1:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8010d5:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8010da:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  8010df:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8010e4:	74 0b                	je     8010f1 <strnlen+0x39>
  8010e6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010ea:	0f b6 00             	movzbl (%rax),%eax
  8010ed:	84 c0                	test   %al,%al
  8010ef:	75 e0                	jne    8010d1 <strnlen+0x19>
  8010f1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8010f4:	c9                   	leaveq 
  8010f5:	c3                   	retq   

00000000008010f6 <strcpy>:
  8010f6:	55                   	push   %rbp
  8010f7:	48 89 e5             	mov    %rsp,%rbp
  8010fa:	48 83 ec 20          	sub    $0x20,%rsp
  8010fe:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801102:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801106:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80110a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80110e:	90                   	nop
  80110f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801113:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801117:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80111b:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80111f:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801123:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  801127:	0f b6 12             	movzbl (%rdx),%edx
  80112a:	88 10                	mov    %dl,(%rax)
  80112c:	0f b6 00             	movzbl (%rax),%eax
  80112f:	84 c0                	test   %al,%al
  801131:	75 dc                	jne    80110f <strcpy+0x19>
  801133:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801137:	c9                   	leaveq 
  801138:	c3                   	retq   

0000000000801139 <strcat>:
  801139:	55                   	push   %rbp
  80113a:	48 89 e5             	mov    %rsp,%rbp
  80113d:	48 83 ec 20          	sub    $0x20,%rsp
  801141:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801145:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801149:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80114d:	48 89 c7             	mov    %rax,%rdi
  801150:	48 b8 8a 10 80 00 00 	movabs $0x80108a,%rax
  801157:	00 00 00 
  80115a:	ff d0                	callq  *%rax
  80115c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80115f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801162:	48 63 d0             	movslq %eax,%rdx
  801165:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801169:	48 01 c2             	add    %rax,%rdx
  80116c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801170:	48 89 c6             	mov    %rax,%rsi
  801173:	48 89 d7             	mov    %rdx,%rdi
  801176:	48 b8 f6 10 80 00 00 	movabs $0x8010f6,%rax
  80117d:	00 00 00 
  801180:	ff d0                	callq  *%rax
  801182:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801186:	c9                   	leaveq 
  801187:	c3                   	retq   

0000000000801188 <strncpy>:
  801188:	55                   	push   %rbp
  801189:	48 89 e5             	mov    %rsp,%rbp
  80118c:	48 83 ec 28          	sub    $0x28,%rsp
  801190:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801194:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801198:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80119c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011a0:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8011a4:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8011ab:	00 
  8011ac:	eb 2a                	jmp    8011d8 <strncpy+0x50>
  8011ae:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011b2:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8011b6:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8011ba:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8011be:	0f b6 12             	movzbl (%rdx),%edx
  8011c1:	88 10                	mov    %dl,(%rax)
  8011c3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8011c7:	0f b6 00             	movzbl (%rax),%eax
  8011ca:	84 c0                	test   %al,%al
  8011cc:	74 05                	je     8011d3 <strncpy+0x4b>
  8011ce:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  8011d3:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8011d8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011dc:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8011e0:	72 cc                	jb     8011ae <strncpy+0x26>
  8011e2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8011e6:	c9                   	leaveq 
  8011e7:	c3                   	retq   

00000000008011e8 <strlcpy>:
  8011e8:	55                   	push   %rbp
  8011e9:	48 89 e5             	mov    %rsp,%rbp
  8011ec:	48 83 ec 28          	sub    $0x28,%rsp
  8011f0:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8011f4:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8011f8:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8011fc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801200:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801204:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801209:	74 3d                	je     801248 <strlcpy+0x60>
  80120b:	eb 1d                	jmp    80122a <strlcpy+0x42>
  80120d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801211:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801215:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801219:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80121d:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801221:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  801225:	0f b6 12             	movzbl (%rdx),%edx
  801228:	88 10                	mov    %dl,(%rax)
  80122a:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  80122f:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801234:	74 0b                	je     801241 <strlcpy+0x59>
  801236:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80123a:	0f b6 00             	movzbl (%rax),%eax
  80123d:	84 c0                	test   %al,%al
  80123f:	75 cc                	jne    80120d <strlcpy+0x25>
  801241:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801245:	c6 00 00             	movb   $0x0,(%rax)
  801248:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80124c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801250:	48 29 c2             	sub    %rax,%rdx
  801253:	48 89 d0             	mov    %rdx,%rax
  801256:	c9                   	leaveq 
  801257:	c3                   	retq   

0000000000801258 <strcmp>:
  801258:	55                   	push   %rbp
  801259:	48 89 e5             	mov    %rsp,%rbp
  80125c:	48 83 ec 10          	sub    $0x10,%rsp
  801260:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801264:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801268:	eb 0a                	jmp    801274 <strcmp+0x1c>
  80126a:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80126f:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801274:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801278:	0f b6 00             	movzbl (%rax),%eax
  80127b:	84 c0                	test   %al,%al
  80127d:	74 12                	je     801291 <strcmp+0x39>
  80127f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801283:	0f b6 10             	movzbl (%rax),%edx
  801286:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80128a:	0f b6 00             	movzbl (%rax),%eax
  80128d:	38 c2                	cmp    %al,%dl
  80128f:	74 d9                	je     80126a <strcmp+0x12>
  801291:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801295:	0f b6 00             	movzbl (%rax),%eax
  801298:	0f b6 d0             	movzbl %al,%edx
  80129b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80129f:	0f b6 00             	movzbl (%rax),%eax
  8012a2:	0f b6 c0             	movzbl %al,%eax
  8012a5:	29 c2                	sub    %eax,%edx
  8012a7:	89 d0                	mov    %edx,%eax
  8012a9:	c9                   	leaveq 
  8012aa:	c3                   	retq   

00000000008012ab <strncmp>:
  8012ab:	55                   	push   %rbp
  8012ac:	48 89 e5             	mov    %rsp,%rbp
  8012af:	48 83 ec 18          	sub    $0x18,%rsp
  8012b3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8012b7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8012bb:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8012bf:	eb 0f                	jmp    8012d0 <strncmp+0x25>
  8012c1:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  8012c6:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8012cb:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8012d0:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8012d5:	74 1d                	je     8012f4 <strncmp+0x49>
  8012d7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012db:	0f b6 00             	movzbl (%rax),%eax
  8012de:	84 c0                	test   %al,%al
  8012e0:	74 12                	je     8012f4 <strncmp+0x49>
  8012e2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012e6:	0f b6 10             	movzbl (%rax),%edx
  8012e9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012ed:	0f b6 00             	movzbl (%rax),%eax
  8012f0:	38 c2                	cmp    %al,%dl
  8012f2:	74 cd                	je     8012c1 <strncmp+0x16>
  8012f4:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8012f9:	75 07                	jne    801302 <strncmp+0x57>
  8012fb:	b8 00 00 00 00       	mov    $0x0,%eax
  801300:	eb 18                	jmp    80131a <strncmp+0x6f>
  801302:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801306:	0f b6 00             	movzbl (%rax),%eax
  801309:	0f b6 d0             	movzbl %al,%edx
  80130c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801310:	0f b6 00             	movzbl (%rax),%eax
  801313:	0f b6 c0             	movzbl %al,%eax
  801316:	29 c2                	sub    %eax,%edx
  801318:	89 d0                	mov    %edx,%eax
  80131a:	c9                   	leaveq 
  80131b:	c3                   	retq   

000000000080131c <strchr>:
  80131c:	55                   	push   %rbp
  80131d:	48 89 e5             	mov    %rsp,%rbp
  801320:	48 83 ec 0c          	sub    $0xc,%rsp
  801324:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801328:	89 f0                	mov    %esi,%eax
  80132a:	88 45 f4             	mov    %al,-0xc(%rbp)
  80132d:	eb 17                	jmp    801346 <strchr+0x2a>
  80132f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801333:	0f b6 00             	movzbl (%rax),%eax
  801336:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801339:	75 06                	jne    801341 <strchr+0x25>
  80133b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80133f:	eb 15                	jmp    801356 <strchr+0x3a>
  801341:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801346:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80134a:	0f b6 00             	movzbl (%rax),%eax
  80134d:	84 c0                	test   %al,%al
  80134f:	75 de                	jne    80132f <strchr+0x13>
  801351:	b8 00 00 00 00       	mov    $0x0,%eax
  801356:	c9                   	leaveq 
  801357:	c3                   	retq   

0000000000801358 <strfind>:
  801358:	55                   	push   %rbp
  801359:	48 89 e5             	mov    %rsp,%rbp
  80135c:	48 83 ec 0c          	sub    $0xc,%rsp
  801360:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801364:	89 f0                	mov    %esi,%eax
  801366:	88 45 f4             	mov    %al,-0xc(%rbp)
  801369:	eb 13                	jmp    80137e <strfind+0x26>
  80136b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80136f:	0f b6 00             	movzbl (%rax),%eax
  801372:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801375:	75 02                	jne    801379 <strfind+0x21>
  801377:	eb 10                	jmp    801389 <strfind+0x31>
  801379:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80137e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801382:	0f b6 00             	movzbl (%rax),%eax
  801385:	84 c0                	test   %al,%al
  801387:	75 e2                	jne    80136b <strfind+0x13>
  801389:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80138d:	c9                   	leaveq 
  80138e:	c3                   	retq   

000000000080138f <memset>:
  80138f:	55                   	push   %rbp
  801390:	48 89 e5             	mov    %rsp,%rbp
  801393:	48 83 ec 18          	sub    $0x18,%rsp
  801397:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80139b:	89 75 f4             	mov    %esi,-0xc(%rbp)
  80139e:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8013a2:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8013a7:	75 06                	jne    8013af <memset+0x20>
  8013a9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013ad:	eb 69                	jmp    801418 <memset+0x89>
  8013af:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013b3:	83 e0 03             	and    $0x3,%eax
  8013b6:	48 85 c0             	test   %rax,%rax
  8013b9:	75 48                	jne    801403 <memset+0x74>
  8013bb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013bf:	83 e0 03             	and    $0x3,%eax
  8013c2:	48 85 c0             	test   %rax,%rax
  8013c5:	75 3c                	jne    801403 <memset+0x74>
  8013c7:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  8013ce:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8013d1:	c1 e0 18             	shl    $0x18,%eax
  8013d4:	89 c2                	mov    %eax,%edx
  8013d6:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8013d9:	c1 e0 10             	shl    $0x10,%eax
  8013dc:	09 c2                	or     %eax,%edx
  8013de:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8013e1:	c1 e0 08             	shl    $0x8,%eax
  8013e4:	09 d0                	or     %edx,%eax
  8013e6:	09 45 f4             	or     %eax,-0xc(%rbp)
  8013e9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013ed:	48 c1 e8 02          	shr    $0x2,%rax
  8013f1:	48 89 c1             	mov    %rax,%rcx
  8013f4:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8013f8:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8013fb:	48 89 d7             	mov    %rdx,%rdi
  8013fe:	fc                   	cld    
  8013ff:	f3 ab                	rep stos %eax,%es:(%rdi)
  801401:	eb 11                	jmp    801414 <memset+0x85>
  801403:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801407:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80140a:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80140e:	48 89 d7             	mov    %rdx,%rdi
  801411:	fc                   	cld    
  801412:	f3 aa                	rep stos %al,%es:(%rdi)
  801414:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801418:	c9                   	leaveq 
  801419:	c3                   	retq   

000000000080141a <memmove>:
  80141a:	55                   	push   %rbp
  80141b:	48 89 e5             	mov    %rsp,%rbp
  80141e:	48 83 ec 28          	sub    $0x28,%rsp
  801422:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801426:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80142a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80142e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801432:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801436:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80143a:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80143e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801442:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801446:	0f 83 88 00 00 00    	jae    8014d4 <memmove+0xba>
  80144c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801450:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801454:	48 01 d0             	add    %rdx,%rax
  801457:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  80145b:	76 77                	jbe    8014d4 <memmove+0xba>
  80145d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801461:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  801465:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801469:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  80146d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801471:	83 e0 03             	and    $0x3,%eax
  801474:	48 85 c0             	test   %rax,%rax
  801477:	75 3b                	jne    8014b4 <memmove+0x9a>
  801479:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80147d:	83 e0 03             	and    $0x3,%eax
  801480:	48 85 c0             	test   %rax,%rax
  801483:	75 2f                	jne    8014b4 <memmove+0x9a>
  801485:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801489:	83 e0 03             	and    $0x3,%eax
  80148c:	48 85 c0             	test   %rax,%rax
  80148f:	75 23                	jne    8014b4 <memmove+0x9a>
  801491:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801495:	48 83 e8 04          	sub    $0x4,%rax
  801499:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80149d:	48 83 ea 04          	sub    $0x4,%rdx
  8014a1:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  8014a5:	48 c1 e9 02          	shr    $0x2,%rcx
  8014a9:	48 89 c7             	mov    %rax,%rdi
  8014ac:	48 89 d6             	mov    %rdx,%rsi
  8014af:	fd                   	std    
  8014b0:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  8014b2:	eb 1d                	jmp    8014d1 <memmove+0xb7>
  8014b4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014b8:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8014bc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014c0:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  8014c4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014c8:	48 89 d7             	mov    %rdx,%rdi
  8014cb:	48 89 c1             	mov    %rax,%rcx
  8014ce:	fd                   	std    
  8014cf:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  8014d1:	fc                   	cld    
  8014d2:	eb 57                	jmp    80152b <memmove+0x111>
  8014d4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014d8:	83 e0 03             	and    $0x3,%eax
  8014db:	48 85 c0             	test   %rax,%rax
  8014de:	75 36                	jne    801516 <memmove+0xfc>
  8014e0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014e4:	83 e0 03             	and    $0x3,%eax
  8014e7:	48 85 c0             	test   %rax,%rax
  8014ea:	75 2a                	jne    801516 <memmove+0xfc>
  8014ec:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014f0:	83 e0 03             	and    $0x3,%eax
  8014f3:	48 85 c0             	test   %rax,%rax
  8014f6:	75 1e                	jne    801516 <memmove+0xfc>
  8014f8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014fc:	48 c1 e8 02          	shr    $0x2,%rax
  801500:	48 89 c1             	mov    %rax,%rcx
  801503:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801507:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80150b:	48 89 c7             	mov    %rax,%rdi
  80150e:	48 89 d6             	mov    %rdx,%rsi
  801511:	fc                   	cld    
  801512:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801514:	eb 15                	jmp    80152b <memmove+0x111>
  801516:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80151a:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80151e:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801522:	48 89 c7             	mov    %rax,%rdi
  801525:	48 89 d6             	mov    %rdx,%rsi
  801528:	fc                   	cld    
  801529:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  80152b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80152f:	c9                   	leaveq 
  801530:	c3                   	retq   

0000000000801531 <memcpy>:
  801531:	55                   	push   %rbp
  801532:	48 89 e5             	mov    %rsp,%rbp
  801535:	48 83 ec 18          	sub    $0x18,%rsp
  801539:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80153d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801541:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801545:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801549:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  80154d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801551:	48 89 ce             	mov    %rcx,%rsi
  801554:	48 89 c7             	mov    %rax,%rdi
  801557:	48 b8 1a 14 80 00 00 	movabs $0x80141a,%rax
  80155e:	00 00 00 
  801561:	ff d0                	callq  *%rax
  801563:	c9                   	leaveq 
  801564:	c3                   	retq   

0000000000801565 <memcmp>:
  801565:	55                   	push   %rbp
  801566:	48 89 e5             	mov    %rsp,%rbp
  801569:	48 83 ec 28          	sub    $0x28,%rsp
  80156d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801571:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801575:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801579:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80157d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801581:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801585:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801589:	eb 36                	jmp    8015c1 <memcmp+0x5c>
  80158b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80158f:	0f b6 10             	movzbl (%rax),%edx
  801592:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801596:	0f b6 00             	movzbl (%rax),%eax
  801599:	38 c2                	cmp    %al,%dl
  80159b:	74 1a                	je     8015b7 <memcmp+0x52>
  80159d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015a1:	0f b6 00             	movzbl (%rax),%eax
  8015a4:	0f b6 d0             	movzbl %al,%edx
  8015a7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015ab:	0f b6 00             	movzbl (%rax),%eax
  8015ae:	0f b6 c0             	movzbl %al,%eax
  8015b1:	29 c2                	sub    %eax,%edx
  8015b3:	89 d0                	mov    %edx,%eax
  8015b5:	eb 20                	jmp    8015d7 <memcmp+0x72>
  8015b7:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8015bc:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8015c1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015c5:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8015c9:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8015cd:	48 85 c0             	test   %rax,%rax
  8015d0:	75 b9                	jne    80158b <memcmp+0x26>
  8015d2:	b8 00 00 00 00       	mov    $0x0,%eax
  8015d7:	c9                   	leaveq 
  8015d8:	c3                   	retq   

00000000008015d9 <memfind>:
  8015d9:	55                   	push   %rbp
  8015da:	48 89 e5             	mov    %rsp,%rbp
  8015dd:	48 83 ec 28          	sub    $0x28,%rsp
  8015e1:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8015e5:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8015e8:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8015ec:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015f0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8015f4:	48 01 d0             	add    %rdx,%rax
  8015f7:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8015fb:	eb 15                	jmp    801612 <memfind+0x39>
  8015fd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801601:	0f b6 10             	movzbl (%rax),%edx
  801604:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801607:	38 c2                	cmp    %al,%dl
  801609:	75 02                	jne    80160d <memfind+0x34>
  80160b:	eb 0f                	jmp    80161c <memfind+0x43>
  80160d:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801612:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801616:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  80161a:	72 e1                	jb     8015fd <memfind+0x24>
  80161c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801620:	c9                   	leaveq 
  801621:	c3                   	retq   

0000000000801622 <strtol>:
  801622:	55                   	push   %rbp
  801623:	48 89 e5             	mov    %rsp,%rbp
  801626:	48 83 ec 34          	sub    $0x34,%rsp
  80162a:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80162e:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801632:	89 55 cc             	mov    %edx,-0x34(%rbp)
  801635:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80163c:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  801643:	00 
  801644:	eb 05                	jmp    80164b <strtol+0x29>
  801646:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80164b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80164f:	0f b6 00             	movzbl (%rax),%eax
  801652:	3c 20                	cmp    $0x20,%al
  801654:	74 f0                	je     801646 <strtol+0x24>
  801656:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80165a:	0f b6 00             	movzbl (%rax),%eax
  80165d:	3c 09                	cmp    $0x9,%al
  80165f:	74 e5                	je     801646 <strtol+0x24>
  801661:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801665:	0f b6 00             	movzbl (%rax),%eax
  801668:	3c 2b                	cmp    $0x2b,%al
  80166a:	75 07                	jne    801673 <strtol+0x51>
  80166c:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801671:	eb 17                	jmp    80168a <strtol+0x68>
  801673:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801677:	0f b6 00             	movzbl (%rax),%eax
  80167a:	3c 2d                	cmp    $0x2d,%al
  80167c:	75 0c                	jne    80168a <strtol+0x68>
  80167e:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801683:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  80168a:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  80168e:	74 06                	je     801696 <strtol+0x74>
  801690:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  801694:	75 28                	jne    8016be <strtol+0x9c>
  801696:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80169a:	0f b6 00             	movzbl (%rax),%eax
  80169d:	3c 30                	cmp    $0x30,%al
  80169f:	75 1d                	jne    8016be <strtol+0x9c>
  8016a1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016a5:	48 83 c0 01          	add    $0x1,%rax
  8016a9:	0f b6 00             	movzbl (%rax),%eax
  8016ac:	3c 78                	cmp    $0x78,%al
  8016ae:	75 0e                	jne    8016be <strtol+0x9c>
  8016b0:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  8016b5:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  8016bc:	eb 2c                	jmp    8016ea <strtol+0xc8>
  8016be:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8016c2:	75 19                	jne    8016dd <strtol+0xbb>
  8016c4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016c8:	0f b6 00             	movzbl (%rax),%eax
  8016cb:	3c 30                	cmp    $0x30,%al
  8016cd:	75 0e                	jne    8016dd <strtol+0xbb>
  8016cf:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8016d4:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  8016db:	eb 0d                	jmp    8016ea <strtol+0xc8>
  8016dd:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8016e1:	75 07                	jne    8016ea <strtol+0xc8>
  8016e3:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  8016ea:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016ee:	0f b6 00             	movzbl (%rax),%eax
  8016f1:	3c 2f                	cmp    $0x2f,%al
  8016f3:	7e 1d                	jle    801712 <strtol+0xf0>
  8016f5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016f9:	0f b6 00             	movzbl (%rax),%eax
  8016fc:	3c 39                	cmp    $0x39,%al
  8016fe:	7f 12                	jg     801712 <strtol+0xf0>
  801700:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801704:	0f b6 00             	movzbl (%rax),%eax
  801707:	0f be c0             	movsbl %al,%eax
  80170a:	83 e8 30             	sub    $0x30,%eax
  80170d:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801710:	eb 4e                	jmp    801760 <strtol+0x13e>
  801712:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801716:	0f b6 00             	movzbl (%rax),%eax
  801719:	3c 60                	cmp    $0x60,%al
  80171b:	7e 1d                	jle    80173a <strtol+0x118>
  80171d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801721:	0f b6 00             	movzbl (%rax),%eax
  801724:	3c 7a                	cmp    $0x7a,%al
  801726:	7f 12                	jg     80173a <strtol+0x118>
  801728:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80172c:	0f b6 00             	movzbl (%rax),%eax
  80172f:	0f be c0             	movsbl %al,%eax
  801732:	83 e8 57             	sub    $0x57,%eax
  801735:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801738:	eb 26                	jmp    801760 <strtol+0x13e>
  80173a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80173e:	0f b6 00             	movzbl (%rax),%eax
  801741:	3c 40                	cmp    $0x40,%al
  801743:	7e 48                	jle    80178d <strtol+0x16b>
  801745:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801749:	0f b6 00             	movzbl (%rax),%eax
  80174c:	3c 5a                	cmp    $0x5a,%al
  80174e:	7f 3d                	jg     80178d <strtol+0x16b>
  801750:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801754:	0f b6 00             	movzbl (%rax),%eax
  801757:	0f be c0             	movsbl %al,%eax
  80175a:	83 e8 37             	sub    $0x37,%eax
  80175d:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801760:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801763:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  801766:	7c 02                	jl     80176a <strtol+0x148>
  801768:	eb 23                	jmp    80178d <strtol+0x16b>
  80176a:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80176f:	8b 45 cc             	mov    -0x34(%rbp),%eax
  801772:	48 98                	cltq   
  801774:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  801779:	48 89 c2             	mov    %rax,%rdx
  80177c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80177f:	48 98                	cltq   
  801781:	48 01 d0             	add    %rdx,%rax
  801784:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801788:	e9 5d ff ff ff       	jmpq   8016ea <strtol+0xc8>
  80178d:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  801792:	74 0b                	je     80179f <strtol+0x17d>
  801794:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801798:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80179c:	48 89 10             	mov    %rdx,(%rax)
  80179f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8017a3:	74 09                	je     8017ae <strtol+0x18c>
  8017a5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017a9:	48 f7 d8             	neg    %rax
  8017ac:	eb 04                	jmp    8017b2 <strtol+0x190>
  8017ae:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017b2:	c9                   	leaveq 
  8017b3:	c3                   	retq   

00000000008017b4 <strstr>:
  8017b4:	55                   	push   %rbp
  8017b5:	48 89 e5             	mov    %rsp,%rbp
  8017b8:	48 83 ec 30          	sub    $0x30,%rsp
  8017bc:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8017c0:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8017c4:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8017c8:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8017cc:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  8017d0:	0f b6 00             	movzbl (%rax),%eax
  8017d3:	88 45 ff             	mov    %al,-0x1(%rbp)
  8017d6:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  8017da:	75 06                	jne    8017e2 <strstr+0x2e>
  8017dc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017e0:	eb 6b                	jmp    80184d <strstr+0x99>
  8017e2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8017e6:	48 89 c7             	mov    %rax,%rdi
  8017e9:	48 b8 8a 10 80 00 00 	movabs $0x80108a,%rax
  8017f0:	00 00 00 
  8017f3:	ff d0                	callq  *%rax
  8017f5:	48 98                	cltq   
  8017f7:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8017fb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017ff:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801803:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801807:	0f b6 00             	movzbl (%rax),%eax
  80180a:	88 45 ef             	mov    %al,-0x11(%rbp)
  80180d:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  801811:	75 07                	jne    80181a <strstr+0x66>
  801813:	b8 00 00 00 00       	mov    $0x0,%eax
  801818:	eb 33                	jmp    80184d <strstr+0x99>
  80181a:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  80181e:	3a 45 ff             	cmp    -0x1(%rbp),%al
  801821:	75 d8                	jne    8017fb <strstr+0x47>
  801823:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801827:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  80182b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80182f:	48 89 ce             	mov    %rcx,%rsi
  801832:	48 89 c7             	mov    %rax,%rdi
  801835:	48 b8 ab 12 80 00 00 	movabs $0x8012ab,%rax
  80183c:	00 00 00 
  80183f:	ff d0                	callq  *%rax
  801841:	85 c0                	test   %eax,%eax
  801843:	75 b6                	jne    8017fb <strstr+0x47>
  801845:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801849:	48 83 e8 01          	sub    $0x1,%rax
  80184d:	c9                   	leaveq 
  80184e:	c3                   	retq   

000000000080184f <syscall>:
  80184f:	55                   	push   %rbp
  801850:	48 89 e5             	mov    %rsp,%rbp
  801853:	53                   	push   %rbx
  801854:	48 83 ec 48          	sub    $0x48,%rsp
  801858:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80185b:	89 75 d8             	mov    %esi,-0x28(%rbp)
  80185e:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801862:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  801866:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  80186a:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  80186e:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801871:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  801875:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  801879:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  80187d:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  801881:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  801885:	4c 89 c3             	mov    %r8,%rbx
  801888:	cd 30                	int    $0x30
  80188a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80188e:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801892:	74 3e                	je     8018d2 <syscall+0x83>
  801894:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801899:	7e 37                	jle    8018d2 <syscall+0x83>
  80189b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80189f:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8018a2:	49 89 d0             	mov    %rdx,%r8
  8018a5:	89 c1                	mov    %eax,%ecx
  8018a7:	48 ba 88 53 80 00 00 	movabs $0x805388,%rdx
  8018ae:	00 00 00 
  8018b1:	be 24 00 00 00       	mov    $0x24,%esi
  8018b6:	48 bf a5 53 80 00 00 	movabs $0x8053a5,%rdi
  8018bd:	00 00 00 
  8018c0:	b8 00 00 00 00       	mov    $0x0,%eax
  8018c5:	49 b9 08 03 80 00 00 	movabs $0x800308,%r9
  8018cc:	00 00 00 
  8018cf:	41 ff d1             	callq  *%r9
  8018d2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8018d6:	48 83 c4 48          	add    $0x48,%rsp
  8018da:	5b                   	pop    %rbx
  8018db:	5d                   	pop    %rbp
  8018dc:	c3                   	retq   

00000000008018dd <sys_cputs>:
  8018dd:	55                   	push   %rbp
  8018de:	48 89 e5             	mov    %rsp,%rbp
  8018e1:	48 83 ec 20          	sub    $0x20,%rsp
  8018e5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8018e9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8018ed:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8018f1:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8018f5:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8018fc:	00 
  8018fd:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801903:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801909:	48 89 d1             	mov    %rdx,%rcx
  80190c:	48 89 c2             	mov    %rax,%rdx
  80190f:	be 00 00 00 00       	mov    $0x0,%esi
  801914:	bf 00 00 00 00       	mov    $0x0,%edi
  801919:	48 b8 4f 18 80 00 00 	movabs $0x80184f,%rax
  801920:	00 00 00 
  801923:	ff d0                	callq  *%rax
  801925:	c9                   	leaveq 
  801926:	c3                   	retq   

0000000000801927 <sys_cgetc>:
  801927:	55                   	push   %rbp
  801928:	48 89 e5             	mov    %rsp,%rbp
  80192b:	48 83 ec 10          	sub    $0x10,%rsp
  80192f:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801936:	00 
  801937:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80193d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801943:	b9 00 00 00 00       	mov    $0x0,%ecx
  801948:	ba 00 00 00 00       	mov    $0x0,%edx
  80194d:	be 00 00 00 00       	mov    $0x0,%esi
  801952:	bf 01 00 00 00       	mov    $0x1,%edi
  801957:	48 b8 4f 18 80 00 00 	movabs $0x80184f,%rax
  80195e:	00 00 00 
  801961:	ff d0                	callq  *%rax
  801963:	c9                   	leaveq 
  801964:	c3                   	retq   

0000000000801965 <sys_env_destroy>:
  801965:	55                   	push   %rbp
  801966:	48 89 e5             	mov    %rsp,%rbp
  801969:	48 83 ec 10          	sub    $0x10,%rsp
  80196d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801970:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801973:	48 98                	cltq   
  801975:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80197c:	00 
  80197d:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801983:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801989:	b9 00 00 00 00       	mov    $0x0,%ecx
  80198e:	48 89 c2             	mov    %rax,%rdx
  801991:	be 01 00 00 00       	mov    $0x1,%esi
  801996:	bf 03 00 00 00       	mov    $0x3,%edi
  80199b:	48 b8 4f 18 80 00 00 	movabs $0x80184f,%rax
  8019a2:	00 00 00 
  8019a5:	ff d0                	callq  *%rax
  8019a7:	c9                   	leaveq 
  8019a8:	c3                   	retq   

00000000008019a9 <sys_getenvid>:
  8019a9:	55                   	push   %rbp
  8019aa:	48 89 e5             	mov    %rsp,%rbp
  8019ad:	48 83 ec 10          	sub    $0x10,%rsp
  8019b1:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8019b8:	00 
  8019b9:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8019bf:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8019c5:	b9 00 00 00 00       	mov    $0x0,%ecx
  8019ca:	ba 00 00 00 00       	mov    $0x0,%edx
  8019cf:	be 00 00 00 00       	mov    $0x0,%esi
  8019d4:	bf 02 00 00 00       	mov    $0x2,%edi
  8019d9:	48 b8 4f 18 80 00 00 	movabs $0x80184f,%rax
  8019e0:	00 00 00 
  8019e3:	ff d0                	callq  *%rax
  8019e5:	c9                   	leaveq 
  8019e6:	c3                   	retq   

00000000008019e7 <sys_yield>:
  8019e7:	55                   	push   %rbp
  8019e8:	48 89 e5             	mov    %rsp,%rbp
  8019eb:	48 83 ec 10          	sub    $0x10,%rsp
  8019ef:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8019f6:	00 
  8019f7:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8019fd:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a03:	b9 00 00 00 00       	mov    $0x0,%ecx
  801a08:	ba 00 00 00 00       	mov    $0x0,%edx
  801a0d:	be 00 00 00 00       	mov    $0x0,%esi
  801a12:	bf 0b 00 00 00       	mov    $0xb,%edi
  801a17:	48 b8 4f 18 80 00 00 	movabs $0x80184f,%rax
  801a1e:	00 00 00 
  801a21:	ff d0                	callq  *%rax
  801a23:	c9                   	leaveq 
  801a24:	c3                   	retq   

0000000000801a25 <sys_page_alloc>:
  801a25:	55                   	push   %rbp
  801a26:	48 89 e5             	mov    %rsp,%rbp
  801a29:	48 83 ec 20          	sub    $0x20,%rsp
  801a2d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a30:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a34:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801a37:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801a3a:	48 63 c8             	movslq %eax,%rcx
  801a3d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801a41:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a44:	48 98                	cltq   
  801a46:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801a4d:	00 
  801a4e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a54:	49 89 c8             	mov    %rcx,%r8
  801a57:	48 89 d1             	mov    %rdx,%rcx
  801a5a:	48 89 c2             	mov    %rax,%rdx
  801a5d:	be 01 00 00 00       	mov    $0x1,%esi
  801a62:	bf 04 00 00 00       	mov    $0x4,%edi
  801a67:	48 b8 4f 18 80 00 00 	movabs $0x80184f,%rax
  801a6e:	00 00 00 
  801a71:	ff d0                	callq  *%rax
  801a73:	c9                   	leaveq 
  801a74:	c3                   	retq   

0000000000801a75 <sys_page_map>:
  801a75:	55                   	push   %rbp
  801a76:	48 89 e5             	mov    %rsp,%rbp
  801a79:	48 83 ec 30          	sub    $0x30,%rsp
  801a7d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a80:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a84:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801a87:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801a8b:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801a8f:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801a92:	48 63 c8             	movslq %eax,%rcx
  801a95:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801a99:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801a9c:	48 63 f0             	movslq %eax,%rsi
  801a9f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801aa3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801aa6:	48 98                	cltq   
  801aa8:	48 89 0c 24          	mov    %rcx,(%rsp)
  801aac:	49 89 f9             	mov    %rdi,%r9
  801aaf:	49 89 f0             	mov    %rsi,%r8
  801ab2:	48 89 d1             	mov    %rdx,%rcx
  801ab5:	48 89 c2             	mov    %rax,%rdx
  801ab8:	be 01 00 00 00       	mov    $0x1,%esi
  801abd:	bf 05 00 00 00       	mov    $0x5,%edi
  801ac2:	48 b8 4f 18 80 00 00 	movabs $0x80184f,%rax
  801ac9:	00 00 00 
  801acc:	ff d0                	callq  *%rax
  801ace:	c9                   	leaveq 
  801acf:	c3                   	retq   

0000000000801ad0 <sys_page_unmap>:
  801ad0:	55                   	push   %rbp
  801ad1:	48 89 e5             	mov    %rsp,%rbp
  801ad4:	48 83 ec 20          	sub    $0x20,%rsp
  801ad8:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801adb:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801adf:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801ae3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ae6:	48 98                	cltq   
  801ae8:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801aef:	00 
  801af0:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801af6:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801afc:	48 89 d1             	mov    %rdx,%rcx
  801aff:	48 89 c2             	mov    %rax,%rdx
  801b02:	be 01 00 00 00       	mov    $0x1,%esi
  801b07:	bf 06 00 00 00       	mov    $0x6,%edi
  801b0c:	48 b8 4f 18 80 00 00 	movabs $0x80184f,%rax
  801b13:	00 00 00 
  801b16:	ff d0                	callq  *%rax
  801b18:	c9                   	leaveq 
  801b19:	c3                   	retq   

0000000000801b1a <sys_env_set_status>:
  801b1a:	55                   	push   %rbp
  801b1b:	48 89 e5             	mov    %rsp,%rbp
  801b1e:	48 83 ec 10          	sub    $0x10,%rsp
  801b22:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b25:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801b28:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801b2b:	48 63 d0             	movslq %eax,%rdx
  801b2e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b31:	48 98                	cltq   
  801b33:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801b3a:	00 
  801b3b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b41:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b47:	48 89 d1             	mov    %rdx,%rcx
  801b4a:	48 89 c2             	mov    %rax,%rdx
  801b4d:	be 01 00 00 00       	mov    $0x1,%esi
  801b52:	bf 08 00 00 00       	mov    $0x8,%edi
  801b57:	48 b8 4f 18 80 00 00 	movabs $0x80184f,%rax
  801b5e:	00 00 00 
  801b61:	ff d0                	callq  *%rax
  801b63:	c9                   	leaveq 
  801b64:	c3                   	retq   

0000000000801b65 <sys_env_set_trapframe>:
  801b65:	55                   	push   %rbp
  801b66:	48 89 e5             	mov    %rsp,%rbp
  801b69:	48 83 ec 20          	sub    $0x20,%rsp
  801b6d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b70:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b74:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b78:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b7b:	48 98                	cltq   
  801b7d:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801b84:	00 
  801b85:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b8b:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b91:	48 89 d1             	mov    %rdx,%rcx
  801b94:	48 89 c2             	mov    %rax,%rdx
  801b97:	be 01 00 00 00       	mov    $0x1,%esi
  801b9c:	bf 09 00 00 00       	mov    $0x9,%edi
  801ba1:	48 b8 4f 18 80 00 00 	movabs $0x80184f,%rax
  801ba8:	00 00 00 
  801bab:	ff d0                	callq  *%rax
  801bad:	c9                   	leaveq 
  801bae:	c3                   	retq   

0000000000801baf <sys_env_set_pgfault_upcall>:
  801baf:	55                   	push   %rbp
  801bb0:	48 89 e5             	mov    %rsp,%rbp
  801bb3:	48 83 ec 20          	sub    $0x20,%rsp
  801bb7:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801bba:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801bbe:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801bc2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801bc5:	48 98                	cltq   
  801bc7:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801bce:	00 
  801bcf:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801bd5:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801bdb:	48 89 d1             	mov    %rdx,%rcx
  801bde:	48 89 c2             	mov    %rax,%rdx
  801be1:	be 01 00 00 00       	mov    $0x1,%esi
  801be6:	bf 0a 00 00 00       	mov    $0xa,%edi
  801beb:	48 b8 4f 18 80 00 00 	movabs $0x80184f,%rax
  801bf2:	00 00 00 
  801bf5:	ff d0                	callq  *%rax
  801bf7:	c9                   	leaveq 
  801bf8:	c3                   	retq   

0000000000801bf9 <sys_ipc_try_send>:
  801bf9:	55                   	push   %rbp
  801bfa:	48 89 e5             	mov    %rsp,%rbp
  801bfd:	48 83 ec 20          	sub    $0x20,%rsp
  801c01:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801c04:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c08:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801c0c:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801c0f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801c12:	48 63 f0             	movslq %eax,%rsi
  801c15:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801c19:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c1c:	48 98                	cltq   
  801c1e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c22:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c29:	00 
  801c2a:	49 89 f1             	mov    %rsi,%r9
  801c2d:	49 89 c8             	mov    %rcx,%r8
  801c30:	48 89 d1             	mov    %rdx,%rcx
  801c33:	48 89 c2             	mov    %rax,%rdx
  801c36:	be 00 00 00 00       	mov    $0x0,%esi
  801c3b:	bf 0c 00 00 00       	mov    $0xc,%edi
  801c40:	48 b8 4f 18 80 00 00 	movabs $0x80184f,%rax
  801c47:	00 00 00 
  801c4a:	ff d0                	callq  *%rax
  801c4c:	c9                   	leaveq 
  801c4d:	c3                   	retq   

0000000000801c4e <sys_ipc_recv>:
  801c4e:	55                   	push   %rbp
  801c4f:	48 89 e5             	mov    %rsp,%rbp
  801c52:	48 83 ec 10          	sub    $0x10,%rsp
  801c56:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c5a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c5e:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c65:	00 
  801c66:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c6c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c72:	b9 00 00 00 00       	mov    $0x0,%ecx
  801c77:	48 89 c2             	mov    %rax,%rdx
  801c7a:	be 01 00 00 00       	mov    $0x1,%esi
  801c7f:	bf 0d 00 00 00       	mov    $0xd,%edi
  801c84:	48 b8 4f 18 80 00 00 	movabs $0x80184f,%rax
  801c8b:	00 00 00 
  801c8e:	ff d0                	callq  *%rax
  801c90:	c9                   	leaveq 
  801c91:	c3                   	retq   

0000000000801c92 <sys_time_msec>:
  801c92:	55                   	push   %rbp
  801c93:	48 89 e5             	mov    %rsp,%rbp
  801c96:	48 83 ec 10          	sub    $0x10,%rsp
  801c9a:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801ca1:	00 
  801ca2:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ca8:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801cae:	b9 00 00 00 00       	mov    $0x0,%ecx
  801cb3:	ba 00 00 00 00       	mov    $0x0,%edx
  801cb8:	be 00 00 00 00       	mov    $0x0,%esi
  801cbd:	bf 0e 00 00 00       	mov    $0xe,%edi
  801cc2:	48 b8 4f 18 80 00 00 	movabs $0x80184f,%rax
  801cc9:	00 00 00 
  801ccc:	ff d0                	callq  *%rax
  801cce:	c9                   	leaveq 
  801ccf:	c3                   	retq   

0000000000801cd0 <sys_net_transmit>:
  801cd0:	55                   	push   %rbp
  801cd1:	48 89 e5             	mov    %rsp,%rbp
  801cd4:	48 83 ec 20          	sub    $0x20,%rsp
  801cd8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801cdc:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801cdf:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801ce2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ce6:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801ced:	00 
  801cee:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801cf4:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801cfa:	48 89 d1             	mov    %rdx,%rcx
  801cfd:	48 89 c2             	mov    %rax,%rdx
  801d00:	be 00 00 00 00       	mov    $0x0,%esi
  801d05:	bf 0f 00 00 00       	mov    $0xf,%edi
  801d0a:	48 b8 4f 18 80 00 00 	movabs $0x80184f,%rax
  801d11:	00 00 00 
  801d14:	ff d0                	callq  *%rax
  801d16:	c9                   	leaveq 
  801d17:	c3                   	retq   

0000000000801d18 <sys_net_receive>:
  801d18:	55                   	push   %rbp
  801d19:	48 89 e5             	mov    %rsp,%rbp
  801d1c:	48 83 ec 20          	sub    $0x20,%rsp
  801d20:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d24:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801d27:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801d2a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d2e:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801d35:	00 
  801d36:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d3c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d42:	48 89 d1             	mov    %rdx,%rcx
  801d45:	48 89 c2             	mov    %rax,%rdx
  801d48:	be 00 00 00 00       	mov    $0x0,%esi
  801d4d:	bf 10 00 00 00       	mov    $0x10,%edi
  801d52:	48 b8 4f 18 80 00 00 	movabs $0x80184f,%rax
  801d59:	00 00 00 
  801d5c:	ff d0                	callq  *%rax
  801d5e:	c9                   	leaveq 
  801d5f:	c3                   	retq   

0000000000801d60 <sys_ept_map>:
  801d60:	55                   	push   %rbp
  801d61:	48 89 e5             	mov    %rsp,%rbp
  801d64:	48 83 ec 30          	sub    $0x30,%rsp
  801d68:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801d6b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d6f:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801d72:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801d76:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801d7a:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801d7d:	48 63 c8             	movslq %eax,%rcx
  801d80:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801d84:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801d87:	48 63 f0             	movslq %eax,%rsi
  801d8a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d8e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801d91:	48 98                	cltq   
  801d93:	48 89 0c 24          	mov    %rcx,(%rsp)
  801d97:	49 89 f9             	mov    %rdi,%r9
  801d9a:	49 89 f0             	mov    %rsi,%r8
  801d9d:	48 89 d1             	mov    %rdx,%rcx
  801da0:	48 89 c2             	mov    %rax,%rdx
  801da3:	be 00 00 00 00       	mov    $0x0,%esi
  801da8:	bf 11 00 00 00       	mov    $0x11,%edi
  801dad:	48 b8 4f 18 80 00 00 	movabs $0x80184f,%rax
  801db4:	00 00 00 
  801db7:	ff d0                	callq  *%rax
  801db9:	c9                   	leaveq 
  801dba:	c3                   	retq   

0000000000801dbb <sys_env_mkguest>:
  801dbb:	55                   	push   %rbp
  801dbc:	48 89 e5             	mov    %rsp,%rbp
  801dbf:	48 83 ec 20          	sub    $0x20,%rsp
  801dc3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801dc7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801dcb:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801dcf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801dd3:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801dda:	00 
  801ddb:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801de1:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801de7:	48 89 d1             	mov    %rdx,%rcx
  801dea:	48 89 c2             	mov    %rax,%rdx
  801ded:	be 00 00 00 00       	mov    $0x0,%esi
  801df2:	bf 12 00 00 00       	mov    $0x12,%edi
  801df7:	48 b8 4f 18 80 00 00 	movabs $0x80184f,%rax
  801dfe:	00 00 00 
  801e01:	ff d0                	callq  *%rax
  801e03:	c9                   	leaveq 
  801e04:	c3                   	retq   

0000000000801e05 <sys_vmx_list_vms>:
  801e05:	55                   	push   %rbp
  801e06:	48 89 e5             	mov    %rsp,%rbp
  801e09:	48 83 ec 10          	sub    $0x10,%rsp
  801e0d:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801e14:	00 
  801e15:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e1b:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e21:	b9 00 00 00 00       	mov    $0x0,%ecx
  801e26:	ba 00 00 00 00       	mov    $0x0,%edx
  801e2b:	be 00 00 00 00       	mov    $0x0,%esi
  801e30:	bf 13 00 00 00       	mov    $0x13,%edi
  801e35:	48 b8 4f 18 80 00 00 	movabs $0x80184f,%rax
  801e3c:	00 00 00 
  801e3f:	ff d0                	callq  *%rax
  801e41:	c9                   	leaveq 
  801e42:	c3                   	retq   

0000000000801e43 <sys_vmx_sel_resume>:
  801e43:	55                   	push   %rbp
  801e44:	48 89 e5             	mov    %rsp,%rbp
  801e47:	48 83 ec 10          	sub    $0x10,%rsp
  801e4b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801e4e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e51:	48 98                	cltq   
  801e53:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801e5a:	00 
  801e5b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e61:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e67:	b9 00 00 00 00       	mov    $0x0,%ecx
  801e6c:	48 89 c2             	mov    %rax,%rdx
  801e6f:	be 00 00 00 00       	mov    $0x0,%esi
  801e74:	bf 14 00 00 00       	mov    $0x14,%edi
  801e79:	48 b8 4f 18 80 00 00 	movabs $0x80184f,%rax
  801e80:	00 00 00 
  801e83:	ff d0                	callq  *%rax
  801e85:	c9                   	leaveq 
  801e86:	c3                   	retq   

0000000000801e87 <sys_vmx_get_vmdisk_number>:
  801e87:	55                   	push   %rbp
  801e88:	48 89 e5             	mov    %rsp,%rbp
  801e8b:	48 83 ec 10          	sub    $0x10,%rsp
  801e8f:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801e96:	00 
  801e97:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e9d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ea3:	b9 00 00 00 00       	mov    $0x0,%ecx
  801ea8:	ba 00 00 00 00       	mov    $0x0,%edx
  801ead:	be 00 00 00 00       	mov    $0x0,%esi
  801eb2:	bf 15 00 00 00       	mov    $0x15,%edi
  801eb7:	48 b8 4f 18 80 00 00 	movabs $0x80184f,%rax
  801ebe:	00 00 00 
  801ec1:	ff d0                	callq  *%rax
  801ec3:	c9                   	leaveq 
  801ec4:	c3                   	retq   

0000000000801ec5 <sys_vmx_incr_vmdisk_number>:
  801ec5:	55                   	push   %rbp
  801ec6:	48 89 e5             	mov    %rsp,%rbp
  801ec9:	48 83 ec 10          	sub    $0x10,%rsp
  801ecd:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801ed4:	00 
  801ed5:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801edb:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ee1:	b9 00 00 00 00       	mov    $0x0,%ecx
  801ee6:	ba 00 00 00 00       	mov    $0x0,%edx
  801eeb:	be 00 00 00 00       	mov    $0x0,%esi
  801ef0:	bf 16 00 00 00       	mov    $0x16,%edi
  801ef5:	48 b8 4f 18 80 00 00 	movabs $0x80184f,%rax
  801efc:	00 00 00 
  801eff:	ff d0                	callq  *%rax
  801f01:	c9                   	leaveq 
  801f02:	c3                   	retq   

0000000000801f03 <fd2num>:
  801f03:	55                   	push   %rbp
  801f04:	48 89 e5             	mov    %rsp,%rbp
  801f07:	48 83 ec 08          	sub    $0x8,%rsp
  801f0b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801f0f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801f13:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  801f1a:	ff ff ff 
  801f1d:	48 01 d0             	add    %rdx,%rax
  801f20:	48 c1 e8 0c          	shr    $0xc,%rax
  801f24:	c9                   	leaveq 
  801f25:	c3                   	retq   

0000000000801f26 <fd2data>:
  801f26:	55                   	push   %rbp
  801f27:	48 89 e5             	mov    %rsp,%rbp
  801f2a:	48 83 ec 08          	sub    $0x8,%rsp
  801f2e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801f32:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801f36:	48 89 c7             	mov    %rax,%rdi
  801f39:	48 b8 03 1f 80 00 00 	movabs $0x801f03,%rax
  801f40:	00 00 00 
  801f43:	ff d0                	callq  *%rax
  801f45:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  801f4b:	48 c1 e0 0c          	shl    $0xc,%rax
  801f4f:	c9                   	leaveq 
  801f50:	c3                   	retq   

0000000000801f51 <fd_alloc>:
  801f51:	55                   	push   %rbp
  801f52:	48 89 e5             	mov    %rsp,%rbp
  801f55:	48 83 ec 18          	sub    $0x18,%rsp
  801f59:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801f5d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801f64:	eb 6b                	jmp    801fd1 <fd_alloc+0x80>
  801f66:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801f69:	48 98                	cltq   
  801f6b:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801f71:	48 c1 e0 0c          	shl    $0xc,%rax
  801f75:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801f79:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801f7d:	48 c1 e8 15          	shr    $0x15,%rax
  801f81:	48 89 c2             	mov    %rax,%rdx
  801f84:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  801f8b:	01 00 00 
  801f8e:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801f92:	83 e0 01             	and    $0x1,%eax
  801f95:	48 85 c0             	test   %rax,%rax
  801f98:	74 21                	je     801fbb <fd_alloc+0x6a>
  801f9a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801f9e:	48 c1 e8 0c          	shr    $0xc,%rax
  801fa2:	48 89 c2             	mov    %rax,%rdx
  801fa5:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801fac:	01 00 00 
  801faf:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801fb3:	83 e0 01             	and    $0x1,%eax
  801fb6:	48 85 c0             	test   %rax,%rax
  801fb9:	75 12                	jne    801fcd <fd_alloc+0x7c>
  801fbb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801fbf:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801fc3:	48 89 10             	mov    %rdx,(%rax)
  801fc6:	b8 00 00 00 00       	mov    $0x0,%eax
  801fcb:	eb 1a                	jmp    801fe7 <fd_alloc+0x96>
  801fcd:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801fd1:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  801fd5:	7e 8f                	jle    801f66 <fd_alloc+0x15>
  801fd7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801fdb:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  801fe2:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  801fe7:	c9                   	leaveq 
  801fe8:	c3                   	retq   

0000000000801fe9 <fd_lookup>:
  801fe9:	55                   	push   %rbp
  801fea:	48 89 e5             	mov    %rsp,%rbp
  801fed:	48 83 ec 20          	sub    $0x20,%rsp
  801ff1:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801ff4:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801ff8:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  801ffc:	78 06                	js     802004 <fd_lookup+0x1b>
  801ffe:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  802002:	7e 07                	jle    80200b <fd_lookup+0x22>
  802004:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802009:	eb 6c                	jmp    802077 <fd_lookup+0x8e>
  80200b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80200e:	48 98                	cltq   
  802010:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802016:	48 c1 e0 0c          	shl    $0xc,%rax
  80201a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80201e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802022:	48 c1 e8 15          	shr    $0x15,%rax
  802026:	48 89 c2             	mov    %rax,%rdx
  802029:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802030:	01 00 00 
  802033:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802037:	83 e0 01             	and    $0x1,%eax
  80203a:	48 85 c0             	test   %rax,%rax
  80203d:	74 21                	je     802060 <fd_lookup+0x77>
  80203f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802043:	48 c1 e8 0c          	shr    $0xc,%rax
  802047:	48 89 c2             	mov    %rax,%rdx
  80204a:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802051:	01 00 00 
  802054:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802058:	83 e0 01             	and    $0x1,%eax
  80205b:	48 85 c0             	test   %rax,%rax
  80205e:	75 07                	jne    802067 <fd_lookup+0x7e>
  802060:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802065:	eb 10                	jmp    802077 <fd_lookup+0x8e>
  802067:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80206b:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80206f:	48 89 10             	mov    %rdx,(%rax)
  802072:	b8 00 00 00 00       	mov    $0x0,%eax
  802077:	c9                   	leaveq 
  802078:	c3                   	retq   

0000000000802079 <fd_close>:
  802079:	55                   	push   %rbp
  80207a:	48 89 e5             	mov    %rsp,%rbp
  80207d:	48 83 ec 30          	sub    $0x30,%rsp
  802081:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802085:	89 f0                	mov    %esi,%eax
  802087:	88 45 d4             	mov    %al,-0x2c(%rbp)
  80208a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80208e:	48 89 c7             	mov    %rax,%rdi
  802091:	48 b8 03 1f 80 00 00 	movabs $0x801f03,%rax
  802098:	00 00 00 
  80209b:	ff d0                	callq  *%rax
  80209d:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8020a1:	48 89 d6             	mov    %rdx,%rsi
  8020a4:	89 c7                	mov    %eax,%edi
  8020a6:	48 b8 e9 1f 80 00 00 	movabs $0x801fe9,%rax
  8020ad:	00 00 00 
  8020b0:	ff d0                	callq  *%rax
  8020b2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8020b5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8020b9:	78 0a                	js     8020c5 <fd_close+0x4c>
  8020bb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8020bf:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  8020c3:	74 12                	je     8020d7 <fd_close+0x5e>
  8020c5:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  8020c9:	74 05                	je     8020d0 <fd_close+0x57>
  8020cb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8020ce:	eb 05                	jmp    8020d5 <fd_close+0x5c>
  8020d0:	b8 00 00 00 00       	mov    $0x0,%eax
  8020d5:	eb 69                	jmp    802140 <fd_close+0xc7>
  8020d7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8020db:	8b 00                	mov    (%rax),%eax
  8020dd:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8020e1:	48 89 d6             	mov    %rdx,%rsi
  8020e4:	89 c7                	mov    %eax,%edi
  8020e6:	48 b8 42 21 80 00 00 	movabs $0x802142,%rax
  8020ed:	00 00 00 
  8020f0:	ff d0                	callq  *%rax
  8020f2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8020f5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8020f9:	78 2a                	js     802125 <fd_close+0xac>
  8020fb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8020ff:	48 8b 40 20          	mov    0x20(%rax),%rax
  802103:	48 85 c0             	test   %rax,%rax
  802106:	74 16                	je     80211e <fd_close+0xa5>
  802108:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80210c:	48 8b 40 20          	mov    0x20(%rax),%rax
  802110:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802114:	48 89 d7             	mov    %rdx,%rdi
  802117:	ff d0                	callq  *%rax
  802119:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80211c:	eb 07                	jmp    802125 <fd_close+0xac>
  80211e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802125:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802129:	48 89 c6             	mov    %rax,%rsi
  80212c:	bf 00 00 00 00       	mov    $0x0,%edi
  802131:	48 b8 d0 1a 80 00 00 	movabs $0x801ad0,%rax
  802138:	00 00 00 
  80213b:	ff d0                	callq  *%rax
  80213d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802140:	c9                   	leaveq 
  802141:	c3                   	retq   

0000000000802142 <dev_lookup>:
  802142:	55                   	push   %rbp
  802143:	48 89 e5             	mov    %rsp,%rbp
  802146:	48 83 ec 20          	sub    $0x20,%rsp
  80214a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80214d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802151:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802158:	eb 41                	jmp    80219b <dev_lookup+0x59>
  80215a:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802161:	00 00 00 
  802164:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802167:	48 63 d2             	movslq %edx,%rdx
  80216a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80216e:	8b 00                	mov    (%rax),%eax
  802170:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  802173:	75 22                	jne    802197 <dev_lookup+0x55>
  802175:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  80217c:	00 00 00 
  80217f:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802182:	48 63 d2             	movslq %edx,%rdx
  802185:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  802189:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80218d:	48 89 10             	mov    %rdx,(%rax)
  802190:	b8 00 00 00 00       	mov    $0x0,%eax
  802195:	eb 60                	jmp    8021f7 <dev_lookup+0xb5>
  802197:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80219b:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  8021a2:	00 00 00 
  8021a5:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8021a8:	48 63 d2             	movslq %edx,%rdx
  8021ab:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8021af:	48 85 c0             	test   %rax,%rax
  8021b2:	75 a6                	jne    80215a <dev_lookup+0x18>
  8021b4:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8021bb:	00 00 00 
  8021be:	48 8b 00             	mov    (%rax),%rax
  8021c1:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8021c7:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8021ca:	89 c6                	mov    %eax,%esi
  8021cc:	48 bf b8 53 80 00 00 	movabs $0x8053b8,%rdi
  8021d3:	00 00 00 
  8021d6:	b8 00 00 00 00       	mov    $0x0,%eax
  8021db:	48 b9 41 05 80 00 00 	movabs $0x800541,%rcx
  8021e2:	00 00 00 
  8021e5:	ff d1                	callq  *%rcx
  8021e7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8021eb:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  8021f2:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8021f7:	c9                   	leaveq 
  8021f8:	c3                   	retq   

00000000008021f9 <close>:
  8021f9:	55                   	push   %rbp
  8021fa:	48 89 e5             	mov    %rsp,%rbp
  8021fd:	48 83 ec 20          	sub    $0x20,%rsp
  802201:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802204:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802208:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80220b:	48 89 d6             	mov    %rdx,%rsi
  80220e:	89 c7                	mov    %eax,%edi
  802210:	48 b8 e9 1f 80 00 00 	movabs $0x801fe9,%rax
  802217:	00 00 00 
  80221a:	ff d0                	callq  *%rax
  80221c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80221f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802223:	79 05                	jns    80222a <close+0x31>
  802225:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802228:	eb 18                	jmp    802242 <close+0x49>
  80222a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80222e:	be 01 00 00 00       	mov    $0x1,%esi
  802233:	48 89 c7             	mov    %rax,%rdi
  802236:	48 b8 79 20 80 00 00 	movabs $0x802079,%rax
  80223d:	00 00 00 
  802240:	ff d0                	callq  *%rax
  802242:	c9                   	leaveq 
  802243:	c3                   	retq   

0000000000802244 <close_all>:
  802244:	55                   	push   %rbp
  802245:	48 89 e5             	mov    %rsp,%rbp
  802248:	48 83 ec 10          	sub    $0x10,%rsp
  80224c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802253:	eb 15                	jmp    80226a <close_all+0x26>
  802255:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802258:	89 c7                	mov    %eax,%edi
  80225a:	48 b8 f9 21 80 00 00 	movabs $0x8021f9,%rax
  802261:	00 00 00 
  802264:	ff d0                	callq  *%rax
  802266:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80226a:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  80226e:	7e e5                	jle    802255 <close_all+0x11>
  802270:	c9                   	leaveq 
  802271:	c3                   	retq   

0000000000802272 <dup>:
  802272:	55                   	push   %rbp
  802273:	48 89 e5             	mov    %rsp,%rbp
  802276:	48 83 ec 40          	sub    $0x40,%rsp
  80227a:	89 7d cc             	mov    %edi,-0x34(%rbp)
  80227d:	89 75 c8             	mov    %esi,-0x38(%rbp)
  802280:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  802284:	8b 45 cc             	mov    -0x34(%rbp),%eax
  802287:	48 89 d6             	mov    %rdx,%rsi
  80228a:	89 c7                	mov    %eax,%edi
  80228c:	48 b8 e9 1f 80 00 00 	movabs $0x801fe9,%rax
  802293:	00 00 00 
  802296:	ff d0                	callq  *%rax
  802298:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80229b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80229f:	79 08                	jns    8022a9 <dup+0x37>
  8022a1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8022a4:	e9 70 01 00 00       	jmpq   802419 <dup+0x1a7>
  8022a9:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8022ac:	89 c7                	mov    %eax,%edi
  8022ae:	48 b8 f9 21 80 00 00 	movabs $0x8021f9,%rax
  8022b5:	00 00 00 
  8022b8:	ff d0                	callq  *%rax
  8022ba:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8022bd:	48 98                	cltq   
  8022bf:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  8022c5:	48 c1 e0 0c          	shl    $0xc,%rax
  8022c9:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8022cd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8022d1:	48 89 c7             	mov    %rax,%rdi
  8022d4:	48 b8 26 1f 80 00 00 	movabs $0x801f26,%rax
  8022db:	00 00 00 
  8022de:	ff d0                	callq  *%rax
  8022e0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8022e4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8022e8:	48 89 c7             	mov    %rax,%rdi
  8022eb:	48 b8 26 1f 80 00 00 	movabs $0x801f26,%rax
  8022f2:	00 00 00 
  8022f5:	ff d0                	callq  *%rax
  8022f7:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8022fb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8022ff:	48 c1 e8 15          	shr    $0x15,%rax
  802303:	48 89 c2             	mov    %rax,%rdx
  802306:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  80230d:	01 00 00 
  802310:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802314:	83 e0 01             	and    $0x1,%eax
  802317:	48 85 c0             	test   %rax,%rax
  80231a:	74 73                	je     80238f <dup+0x11d>
  80231c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802320:	48 c1 e8 0c          	shr    $0xc,%rax
  802324:	48 89 c2             	mov    %rax,%rdx
  802327:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80232e:	01 00 00 
  802331:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802335:	83 e0 01             	and    $0x1,%eax
  802338:	48 85 c0             	test   %rax,%rax
  80233b:	74 52                	je     80238f <dup+0x11d>
  80233d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802341:	48 c1 e8 0c          	shr    $0xc,%rax
  802345:	48 89 c2             	mov    %rax,%rdx
  802348:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80234f:	01 00 00 
  802352:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802356:	25 07 0e 00 00       	and    $0xe07,%eax
  80235b:	89 c1                	mov    %eax,%ecx
  80235d:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802361:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802365:	41 89 c8             	mov    %ecx,%r8d
  802368:	48 89 d1             	mov    %rdx,%rcx
  80236b:	ba 00 00 00 00       	mov    $0x0,%edx
  802370:	48 89 c6             	mov    %rax,%rsi
  802373:	bf 00 00 00 00       	mov    $0x0,%edi
  802378:	48 b8 75 1a 80 00 00 	movabs $0x801a75,%rax
  80237f:	00 00 00 
  802382:	ff d0                	callq  *%rax
  802384:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802387:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80238b:	79 02                	jns    80238f <dup+0x11d>
  80238d:	eb 57                	jmp    8023e6 <dup+0x174>
  80238f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802393:	48 c1 e8 0c          	shr    $0xc,%rax
  802397:	48 89 c2             	mov    %rax,%rdx
  80239a:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8023a1:	01 00 00 
  8023a4:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8023a8:	25 07 0e 00 00       	and    $0xe07,%eax
  8023ad:	89 c1                	mov    %eax,%ecx
  8023af:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8023b3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8023b7:	41 89 c8             	mov    %ecx,%r8d
  8023ba:	48 89 d1             	mov    %rdx,%rcx
  8023bd:	ba 00 00 00 00       	mov    $0x0,%edx
  8023c2:	48 89 c6             	mov    %rax,%rsi
  8023c5:	bf 00 00 00 00       	mov    $0x0,%edi
  8023ca:	48 b8 75 1a 80 00 00 	movabs $0x801a75,%rax
  8023d1:	00 00 00 
  8023d4:	ff d0                	callq  *%rax
  8023d6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8023d9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8023dd:	79 02                	jns    8023e1 <dup+0x16f>
  8023df:	eb 05                	jmp    8023e6 <dup+0x174>
  8023e1:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8023e4:	eb 33                	jmp    802419 <dup+0x1a7>
  8023e6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8023ea:	48 89 c6             	mov    %rax,%rsi
  8023ed:	bf 00 00 00 00       	mov    $0x0,%edi
  8023f2:	48 b8 d0 1a 80 00 00 	movabs $0x801ad0,%rax
  8023f9:	00 00 00 
  8023fc:	ff d0                	callq  *%rax
  8023fe:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802402:	48 89 c6             	mov    %rax,%rsi
  802405:	bf 00 00 00 00       	mov    $0x0,%edi
  80240a:	48 b8 d0 1a 80 00 00 	movabs $0x801ad0,%rax
  802411:	00 00 00 
  802414:	ff d0                	callq  *%rax
  802416:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802419:	c9                   	leaveq 
  80241a:	c3                   	retq   

000000000080241b <read>:
  80241b:	55                   	push   %rbp
  80241c:	48 89 e5             	mov    %rsp,%rbp
  80241f:	48 83 ec 40          	sub    $0x40,%rsp
  802423:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802426:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80242a:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80242e:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802432:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802435:	48 89 d6             	mov    %rdx,%rsi
  802438:	89 c7                	mov    %eax,%edi
  80243a:	48 b8 e9 1f 80 00 00 	movabs $0x801fe9,%rax
  802441:	00 00 00 
  802444:	ff d0                	callq  *%rax
  802446:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802449:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80244d:	78 24                	js     802473 <read+0x58>
  80244f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802453:	8b 00                	mov    (%rax),%eax
  802455:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802459:	48 89 d6             	mov    %rdx,%rsi
  80245c:	89 c7                	mov    %eax,%edi
  80245e:	48 b8 42 21 80 00 00 	movabs $0x802142,%rax
  802465:	00 00 00 
  802468:	ff d0                	callq  *%rax
  80246a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80246d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802471:	79 05                	jns    802478 <read+0x5d>
  802473:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802476:	eb 76                	jmp    8024ee <read+0xd3>
  802478:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80247c:	8b 40 08             	mov    0x8(%rax),%eax
  80247f:	83 e0 03             	and    $0x3,%eax
  802482:	83 f8 01             	cmp    $0x1,%eax
  802485:	75 3a                	jne    8024c1 <read+0xa6>
  802487:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80248e:	00 00 00 
  802491:	48 8b 00             	mov    (%rax),%rax
  802494:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80249a:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80249d:	89 c6                	mov    %eax,%esi
  80249f:	48 bf d7 53 80 00 00 	movabs $0x8053d7,%rdi
  8024a6:	00 00 00 
  8024a9:	b8 00 00 00 00       	mov    $0x0,%eax
  8024ae:	48 b9 41 05 80 00 00 	movabs $0x800541,%rcx
  8024b5:	00 00 00 
  8024b8:	ff d1                	callq  *%rcx
  8024ba:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8024bf:	eb 2d                	jmp    8024ee <read+0xd3>
  8024c1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8024c5:	48 8b 40 10          	mov    0x10(%rax),%rax
  8024c9:	48 85 c0             	test   %rax,%rax
  8024cc:	75 07                	jne    8024d5 <read+0xba>
  8024ce:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8024d3:	eb 19                	jmp    8024ee <read+0xd3>
  8024d5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8024d9:	48 8b 40 10          	mov    0x10(%rax),%rax
  8024dd:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8024e1:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8024e5:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  8024e9:	48 89 cf             	mov    %rcx,%rdi
  8024ec:	ff d0                	callq  *%rax
  8024ee:	c9                   	leaveq 
  8024ef:	c3                   	retq   

00000000008024f0 <readn>:
  8024f0:	55                   	push   %rbp
  8024f1:	48 89 e5             	mov    %rsp,%rbp
  8024f4:	48 83 ec 30          	sub    $0x30,%rsp
  8024f8:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8024fb:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8024ff:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802503:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80250a:	eb 49                	jmp    802555 <readn+0x65>
  80250c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80250f:	48 98                	cltq   
  802511:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802515:	48 29 c2             	sub    %rax,%rdx
  802518:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80251b:	48 63 c8             	movslq %eax,%rcx
  80251e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802522:	48 01 c1             	add    %rax,%rcx
  802525:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802528:	48 89 ce             	mov    %rcx,%rsi
  80252b:	89 c7                	mov    %eax,%edi
  80252d:	48 b8 1b 24 80 00 00 	movabs $0x80241b,%rax
  802534:	00 00 00 
  802537:	ff d0                	callq  *%rax
  802539:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80253c:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802540:	79 05                	jns    802547 <readn+0x57>
  802542:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802545:	eb 1c                	jmp    802563 <readn+0x73>
  802547:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80254b:	75 02                	jne    80254f <readn+0x5f>
  80254d:	eb 11                	jmp    802560 <readn+0x70>
  80254f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802552:	01 45 fc             	add    %eax,-0x4(%rbp)
  802555:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802558:	48 98                	cltq   
  80255a:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  80255e:	72 ac                	jb     80250c <readn+0x1c>
  802560:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802563:	c9                   	leaveq 
  802564:	c3                   	retq   

0000000000802565 <write>:
  802565:	55                   	push   %rbp
  802566:	48 89 e5             	mov    %rsp,%rbp
  802569:	48 83 ec 40          	sub    $0x40,%rsp
  80256d:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802570:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802574:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802578:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80257c:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80257f:	48 89 d6             	mov    %rdx,%rsi
  802582:	89 c7                	mov    %eax,%edi
  802584:	48 b8 e9 1f 80 00 00 	movabs $0x801fe9,%rax
  80258b:	00 00 00 
  80258e:	ff d0                	callq  *%rax
  802590:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802593:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802597:	78 24                	js     8025bd <write+0x58>
  802599:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80259d:	8b 00                	mov    (%rax),%eax
  80259f:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8025a3:	48 89 d6             	mov    %rdx,%rsi
  8025a6:	89 c7                	mov    %eax,%edi
  8025a8:	48 b8 42 21 80 00 00 	movabs $0x802142,%rax
  8025af:	00 00 00 
  8025b2:	ff d0                	callq  *%rax
  8025b4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8025b7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8025bb:	79 05                	jns    8025c2 <write+0x5d>
  8025bd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8025c0:	eb 75                	jmp    802637 <write+0xd2>
  8025c2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8025c6:	8b 40 08             	mov    0x8(%rax),%eax
  8025c9:	83 e0 03             	and    $0x3,%eax
  8025cc:	85 c0                	test   %eax,%eax
  8025ce:	75 3a                	jne    80260a <write+0xa5>
  8025d0:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8025d7:	00 00 00 
  8025da:	48 8b 00             	mov    (%rax),%rax
  8025dd:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8025e3:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8025e6:	89 c6                	mov    %eax,%esi
  8025e8:	48 bf f3 53 80 00 00 	movabs $0x8053f3,%rdi
  8025ef:	00 00 00 
  8025f2:	b8 00 00 00 00       	mov    $0x0,%eax
  8025f7:	48 b9 41 05 80 00 00 	movabs $0x800541,%rcx
  8025fe:	00 00 00 
  802601:	ff d1                	callq  *%rcx
  802603:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802608:	eb 2d                	jmp    802637 <write+0xd2>
  80260a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80260e:	48 8b 40 18          	mov    0x18(%rax),%rax
  802612:	48 85 c0             	test   %rax,%rax
  802615:	75 07                	jne    80261e <write+0xb9>
  802617:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80261c:	eb 19                	jmp    802637 <write+0xd2>
  80261e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802622:	48 8b 40 18          	mov    0x18(%rax),%rax
  802626:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80262a:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80262e:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802632:	48 89 cf             	mov    %rcx,%rdi
  802635:	ff d0                	callq  *%rax
  802637:	c9                   	leaveq 
  802638:	c3                   	retq   

0000000000802639 <seek>:
  802639:	55                   	push   %rbp
  80263a:	48 89 e5             	mov    %rsp,%rbp
  80263d:	48 83 ec 18          	sub    $0x18,%rsp
  802641:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802644:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802647:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80264b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80264e:	48 89 d6             	mov    %rdx,%rsi
  802651:	89 c7                	mov    %eax,%edi
  802653:	48 b8 e9 1f 80 00 00 	movabs $0x801fe9,%rax
  80265a:	00 00 00 
  80265d:	ff d0                	callq  *%rax
  80265f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802662:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802666:	79 05                	jns    80266d <seek+0x34>
  802668:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80266b:	eb 0f                	jmp    80267c <seek+0x43>
  80266d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802671:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802674:	89 50 04             	mov    %edx,0x4(%rax)
  802677:	b8 00 00 00 00       	mov    $0x0,%eax
  80267c:	c9                   	leaveq 
  80267d:	c3                   	retq   

000000000080267e <ftruncate>:
  80267e:	55                   	push   %rbp
  80267f:	48 89 e5             	mov    %rsp,%rbp
  802682:	48 83 ec 30          	sub    $0x30,%rsp
  802686:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802689:	89 75 d8             	mov    %esi,-0x28(%rbp)
  80268c:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802690:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802693:	48 89 d6             	mov    %rdx,%rsi
  802696:	89 c7                	mov    %eax,%edi
  802698:	48 b8 e9 1f 80 00 00 	movabs $0x801fe9,%rax
  80269f:	00 00 00 
  8026a2:	ff d0                	callq  *%rax
  8026a4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8026a7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8026ab:	78 24                	js     8026d1 <ftruncate+0x53>
  8026ad:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8026b1:	8b 00                	mov    (%rax),%eax
  8026b3:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8026b7:	48 89 d6             	mov    %rdx,%rsi
  8026ba:	89 c7                	mov    %eax,%edi
  8026bc:	48 b8 42 21 80 00 00 	movabs $0x802142,%rax
  8026c3:	00 00 00 
  8026c6:	ff d0                	callq  *%rax
  8026c8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8026cb:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8026cf:	79 05                	jns    8026d6 <ftruncate+0x58>
  8026d1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8026d4:	eb 72                	jmp    802748 <ftruncate+0xca>
  8026d6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8026da:	8b 40 08             	mov    0x8(%rax),%eax
  8026dd:	83 e0 03             	and    $0x3,%eax
  8026e0:	85 c0                	test   %eax,%eax
  8026e2:	75 3a                	jne    80271e <ftruncate+0xa0>
  8026e4:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8026eb:	00 00 00 
  8026ee:	48 8b 00             	mov    (%rax),%rax
  8026f1:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8026f7:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8026fa:	89 c6                	mov    %eax,%esi
  8026fc:	48 bf 10 54 80 00 00 	movabs $0x805410,%rdi
  802703:	00 00 00 
  802706:	b8 00 00 00 00       	mov    $0x0,%eax
  80270b:	48 b9 41 05 80 00 00 	movabs $0x800541,%rcx
  802712:	00 00 00 
  802715:	ff d1                	callq  *%rcx
  802717:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80271c:	eb 2a                	jmp    802748 <ftruncate+0xca>
  80271e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802722:	48 8b 40 30          	mov    0x30(%rax),%rax
  802726:	48 85 c0             	test   %rax,%rax
  802729:	75 07                	jne    802732 <ftruncate+0xb4>
  80272b:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802730:	eb 16                	jmp    802748 <ftruncate+0xca>
  802732:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802736:	48 8b 40 30          	mov    0x30(%rax),%rax
  80273a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80273e:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  802741:	89 ce                	mov    %ecx,%esi
  802743:	48 89 d7             	mov    %rdx,%rdi
  802746:	ff d0                	callq  *%rax
  802748:	c9                   	leaveq 
  802749:	c3                   	retq   

000000000080274a <fstat>:
  80274a:	55                   	push   %rbp
  80274b:	48 89 e5             	mov    %rsp,%rbp
  80274e:	48 83 ec 30          	sub    $0x30,%rsp
  802752:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802755:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802759:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80275d:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802760:	48 89 d6             	mov    %rdx,%rsi
  802763:	89 c7                	mov    %eax,%edi
  802765:	48 b8 e9 1f 80 00 00 	movabs $0x801fe9,%rax
  80276c:	00 00 00 
  80276f:	ff d0                	callq  *%rax
  802771:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802774:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802778:	78 24                	js     80279e <fstat+0x54>
  80277a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80277e:	8b 00                	mov    (%rax),%eax
  802780:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802784:	48 89 d6             	mov    %rdx,%rsi
  802787:	89 c7                	mov    %eax,%edi
  802789:	48 b8 42 21 80 00 00 	movabs $0x802142,%rax
  802790:	00 00 00 
  802793:	ff d0                	callq  *%rax
  802795:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802798:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80279c:	79 05                	jns    8027a3 <fstat+0x59>
  80279e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8027a1:	eb 5e                	jmp    802801 <fstat+0xb7>
  8027a3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8027a7:	48 8b 40 28          	mov    0x28(%rax),%rax
  8027ab:	48 85 c0             	test   %rax,%rax
  8027ae:	75 07                	jne    8027b7 <fstat+0x6d>
  8027b0:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8027b5:	eb 4a                	jmp    802801 <fstat+0xb7>
  8027b7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8027bb:	c6 00 00             	movb   $0x0,(%rax)
  8027be:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8027c2:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  8027c9:	00 00 00 
  8027cc:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8027d0:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  8027d7:	00 00 00 
  8027da:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8027de:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8027e2:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  8027e9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8027ed:	48 8b 40 28          	mov    0x28(%rax),%rax
  8027f1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8027f5:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  8027f9:	48 89 ce             	mov    %rcx,%rsi
  8027fc:	48 89 d7             	mov    %rdx,%rdi
  8027ff:	ff d0                	callq  *%rax
  802801:	c9                   	leaveq 
  802802:	c3                   	retq   

0000000000802803 <stat>:
  802803:	55                   	push   %rbp
  802804:	48 89 e5             	mov    %rsp,%rbp
  802807:	48 83 ec 20          	sub    $0x20,%rsp
  80280b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80280f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802813:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802817:	be 00 00 00 00       	mov    $0x0,%esi
  80281c:	48 89 c7             	mov    %rax,%rdi
  80281f:	48 b8 f1 28 80 00 00 	movabs $0x8028f1,%rax
  802826:	00 00 00 
  802829:	ff d0                	callq  *%rax
  80282b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80282e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802832:	79 05                	jns    802839 <stat+0x36>
  802834:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802837:	eb 2f                	jmp    802868 <stat+0x65>
  802839:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80283d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802840:	48 89 d6             	mov    %rdx,%rsi
  802843:	89 c7                	mov    %eax,%edi
  802845:	48 b8 4a 27 80 00 00 	movabs $0x80274a,%rax
  80284c:	00 00 00 
  80284f:	ff d0                	callq  *%rax
  802851:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802854:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802857:	89 c7                	mov    %eax,%edi
  802859:	48 b8 f9 21 80 00 00 	movabs $0x8021f9,%rax
  802860:	00 00 00 
  802863:	ff d0                	callq  *%rax
  802865:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802868:	c9                   	leaveq 
  802869:	c3                   	retq   

000000000080286a <fsipc>:
  80286a:	55                   	push   %rbp
  80286b:	48 89 e5             	mov    %rsp,%rbp
  80286e:	48 83 ec 10          	sub    $0x10,%rsp
  802872:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802875:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802879:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802880:	00 00 00 
  802883:	8b 00                	mov    (%rax),%eax
  802885:	85 c0                	test   %eax,%eax
  802887:	75 1d                	jne    8028a6 <fsipc+0x3c>
  802889:	bf 01 00 00 00       	mov    $0x1,%edi
  80288e:	48 b8 77 4c 80 00 00 	movabs $0x804c77,%rax
  802895:	00 00 00 
  802898:	ff d0                	callq  *%rax
  80289a:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  8028a1:	00 00 00 
  8028a4:	89 02                	mov    %eax,(%rdx)
  8028a6:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8028ad:	00 00 00 
  8028b0:	8b 00                	mov    (%rax),%eax
  8028b2:	8b 75 fc             	mov    -0x4(%rbp),%esi
  8028b5:	b9 07 00 00 00       	mov    $0x7,%ecx
  8028ba:	48 ba 00 90 80 00 00 	movabs $0x809000,%rdx
  8028c1:	00 00 00 
  8028c4:	89 c7                	mov    %eax,%edi
  8028c6:	48 b8 e1 4b 80 00 00 	movabs $0x804be1,%rax
  8028cd:	00 00 00 
  8028d0:	ff d0                	callq  *%rax
  8028d2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8028d6:	ba 00 00 00 00       	mov    $0x0,%edx
  8028db:	48 89 c6             	mov    %rax,%rsi
  8028de:	bf 00 00 00 00       	mov    $0x0,%edi
  8028e3:	48 b8 20 4b 80 00 00 	movabs $0x804b20,%rax
  8028ea:	00 00 00 
  8028ed:	ff d0                	callq  *%rax
  8028ef:	c9                   	leaveq 
  8028f0:	c3                   	retq   

00000000008028f1 <open>:
  8028f1:	55                   	push   %rbp
  8028f2:	48 89 e5             	mov    %rsp,%rbp
  8028f5:	48 83 ec 20          	sub    $0x20,%rsp
  8028f9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8028fd:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  802900:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802904:	48 89 c7             	mov    %rax,%rdi
  802907:	48 b8 8a 10 80 00 00 	movabs $0x80108a,%rax
  80290e:	00 00 00 
  802911:	ff d0                	callq  *%rax
  802913:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802918:	7e 0a                	jle    802924 <open+0x33>
  80291a:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  80291f:	e9 a5 00 00 00       	jmpq   8029c9 <open+0xd8>
  802924:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802928:	48 89 c7             	mov    %rax,%rdi
  80292b:	48 b8 51 1f 80 00 00 	movabs $0x801f51,%rax
  802932:	00 00 00 
  802935:	ff d0                	callq  *%rax
  802937:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80293a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80293e:	79 08                	jns    802948 <open+0x57>
  802940:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802943:	e9 81 00 00 00       	jmpq   8029c9 <open+0xd8>
  802948:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80294c:	48 89 c6             	mov    %rax,%rsi
  80294f:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  802956:	00 00 00 
  802959:	48 b8 f6 10 80 00 00 	movabs $0x8010f6,%rax
  802960:	00 00 00 
  802963:	ff d0                	callq  *%rax
  802965:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80296c:	00 00 00 
  80296f:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  802972:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  802978:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80297c:	48 89 c6             	mov    %rax,%rsi
  80297f:	bf 01 00 00 00       	mov    $0x1,%edi
  802984:	48 b8 6a 28 80 00 00 	movabs $0x80286a,%rax
  80298b:	00 00 00 
  80298e:	ff d0                	callq  *%rax
  802990:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802993:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802997:	79 1d                	jns    8029b6 <open+0xc5>
  802999:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80299d:	be 00 00 00 00       	mov    $0x0,%esi
  8029a2:	48 89 c7             	mov    %rax,%rdi
  8029a5:	48 b8 79 20 80 00 00 	movabs $0x802079,%rax
  8029ac:	00 00 00 
  8029af:	ff d0                	callq  *%rax
  8029b1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029b4:	eb 13                	jmp    8029c9 <open+0xd8>
  8029b6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8029ba:	48 89 c7             	mov    %rax,%rdi
  8029bd:	48 b8 03 1f 80 00 00 	movabs $0x801f03,%rax
  8029c4:	00 00 00 
  8029c7:	ff d0                	callq  *%rax
  8029c9:	c9                   	leaveq 
  8029ca:	c3                   	retq   

00000000008029cb <devfile_flush>:
  8029cb:	55                   	push   %rbp
  8029cc:	48 89 e5             	mov    %rsp,%rbp
  8029cf:	48 83 ec 10          	sub    $0x10,%rsp
  8029d3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8029d7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8029db:	8b 50 0c             	mov    0xc(%rax),%edx
  8029de:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8029e5:	00 00 00 
  8029e8:	89 10                	mov    %edx,(%rax)
  8029ea:	be 00 00 00 00       	mov    $0x0,%esi
  8029ef:	bf 06 00 00 00       	mov    $0x6,%edi
  8029f4:	48 b8 6a 28 80 00 00 	movabs $0x80286a,%rax
  8029fb:	00 00 00 
  8029fe:	ff d0                	callq  *%rax
  802a00:	c9                   	leaveq 
  802a01:	c3                   	retq   

0000000000802a02 <devfile_read>:
  802a02:	55                   	push   %rbp
  802a03:	48 89 e5             	mov    %rsp,%rbp
  802a06:	48 83 ec 30          	sub    $0x30,%rsp
  802a0a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802a0e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802a12:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802a16:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802a1a:	8b 50 0c             	mov    0xc(%rax),%edx
  802a1d:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802a24:	00 00 00 
  802a27:	89 10                	mov    %edx,(%rax)
  802a29:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802a30:	00 00 00 
  802a33:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802a37:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802a3b:	be 00 00 00 00       	mov    $0x0,%esi
  802a40:	bf 03 00 00 00       	mov    $0x3,%edi
  802a45:	48 b8 6a 28 80 00 00 	movabs $0x80286a,%rax
  802a4c:	00 00 00 
  802a4f:	ff d0                	callq  *%rax
  802a51:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802a54:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802a58:	79 08                	jns    802a62 <devfile_read+0x60>
  802a5a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a5d:	e9 a4 00 00 00       	jmpq   802b06 <devfile_read+0x104>
  802a62:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a65:	48 98                	cltq   
  802a67:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802a6b:	76 35                	jbe    802aa2 <devfile_read+0xa0>
  802a6d:	48 b9 36 54 80 00 00 	movabs $0x805436,%rcx
  802a74:	00 00 00 
  802a77:	48 ba 3d 54 80 00 00 	movabs $0x80543d,%rdx
  802a7e:	00 00 00 
  802a81:	be 89 00 00 00       	mov    $0x89,%esi
  802a86:	48 bf 52 54 80 00 00 	movabs $0x805452,%rdi
  802a8d:	00 00 00 
  802a90:	b8 00 00 00 00       	mov    $0x0,%eax
  802a95:	49 b8 08 03 80 00 00 	movabs $0x800308,%r8
  802a9c:	00 00 00 
  802a9f:	41 ff d0             	callq  *%r8
  802aa2:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  802aa9:	7e 35                	jle    802ae0 <devfile_read+0xde>
  802aab:	48 b9 60 54 80 00 00 	movabs $0x805460,%rcx
  802ab2:	00 00 00 
  802ab5:	48 ba 3d 54 80 00 00 	movabs $0x80543d,%rdx
  802abc:	00 00 00 
  802abf:	be 8a 00 00 00       	mov    $0x8a,%esi
  802ac4:	48 bf 52 54 80 00 00 	movabs $0x805452,%rdi
  802acb:	00 00 00 
  802ace:	b8 00 00 00 00       	mov    $0x0,%eax
  802ad3:	49 b8 08 03 80 00 00 	movabs $0x800308,%r8
  802ada:	00 00 00 
  802add:	41 ff d0             	callq  *%r8
  802ae0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ae3:	48 63 d0             	movslq %eax,%rdx
  802ae6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802aea:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  802af1:	00 00 00 
  802af4:	48 89 c7             	mov    %rax,%rdi
  802af7:	48 b8 1a 14 80 00 00 	movabs $0x80141a,%rax
  802afe:	00 00 00 
  802b01:	ff d0                	callq  *%rax
  802b03:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b06:	c9                   	leaveq 
  802b07:	c3                   	retq   

0000000000802b08 <devfile_write>:
  802b08:	55                   	push   %rbp
  802b09:	48 89 e5             	mov    %rsp,%rbp
  802b0c:	48 83 ec 40          	sub    $0x40,%rsp
  802b10:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802b14:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802b18:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802b1c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  802b20:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802b24:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  802b2b:	00 
  802b2c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802b30:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  802b34:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  802b39:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  802b3d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802b41:	8b 50 0c             	mov    0xc(%rax),%edx
  802b44:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802b4b:	00 00 00 
  802b4e:	89 10                	mov    %edx,(%rax)
  802b50:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802b57:	00 00 00 
  802b5a:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802b5e:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802b62:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802b66:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802b6a:	48 89 c6             	mov    %rax,%rsi
  802b6d:	48 bf 10 90 80 00 00 	movabs $0x809010,%rdi
  802b74:	00 00 00 
  802b77:	48 b8 1a 14 80 00 00 	movabs $0x80141a,%rax
  802b7e:	00 00 00 
  802b81:	ff d0                	callq  *%rax
  802b83:	be 00 00 00 00       	mov    $0x0,%esi
  802b88:	bf 04 00 00 00       	mov    $0x4,%edi
  802b8d:	48 b8 6a 28 80 00 00 	movabs $0x80286a,%rax
  802b94:	00 00 00 
  802b97:	ff d0                	callq  *%rax
  802b99:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802b9c:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802ba0:	79 05                	jns    802ba7 <devfile_write+0x9f>
  802ba2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802ba5:	eb 43                	jmp    802bea <devfile_write+0xe2>
  802ba7:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802baa:	48 98                	cltq   
  802bac:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  802bb0:	76 35                	jbe    802be7 <devfile_write+0xdf>
  802bb2:	48 b9 36 54 80 00 00 	movabs $0x805436,%rcx
  802bb9:	00 00 00 
  802bbc:	48 ba 3d 54 80 00 00 	movabs $0x80543d,%rdx
  802bc3:	00 00 00 
  802bc6:	be a8 00 00 00       	mov    $0xa8,%esi
  802bcb:	48 bf 52 54 80 00 00 	movabs $0x805452,%rdi
  802bd2:	00 00 00 
  802bd5:	b8 00 00 00 00       	mov    $0x0,%eax
  802bda:	49 b8 08 03 80 00 00 	movabs $0x800308,%r8
  802be1:	00 00 00 
  802be4:	41 ff d0             	callq  *%r8
  802be7:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802bea:	c9                   	leaveq 
  802beb:	c3                   	retq   

0000000000802bec <devfile_stat>:
  802bec:	55                   	push   %rbp
  802bed:	48 89 e5             	mov    %rsp,%rbp
  802bf0:	48 83 ec 20          	sub    $0x20,%rsp
  802bf4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802bf8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802bfc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c00:	8b 50 0c             	mov    0xc(%rax),%edx
  802c03:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802c0a:	00 00 00 
  802c0d:	89 10                	mov    %edx,(%rax)
  802c0f:	be 00 00 00 00       	mov    $0x0,%esi
  802c14:	bf 05 00 00 00       	mov    $0x5,%edi
  802c19:	48 b8 6a 28 80 00 00 	movabs $0x80286a,%rax
  802c20:	00 00 00 
  802c23:	ff d0                	callq  *%rax
  802c25:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c28:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c2c:	79 05                	jns    802c33 <devfile_stat+0x47>
  802c2e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c31:	eb 56                	jmp    802c89 <devfile_stat+0x9d>
  802c33:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802c37:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  802c3e:	00 00 00 
  802c41:	48 89 c7             	mov    %rax,%rdi
  802c44:	48 b8 f6 10 80 00 00 	movabs $0x8010f6,%rax
  802c4b:	00 00 00 
  802c4e:	ff d0                	callq  *%rax
  802c50:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802c57:	00 00 00 
  802c5a:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  802c60:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802c64:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  802c6a:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802c71:	00 00 00 
  802c74:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  802c7a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802c7e:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  802c84:	b8 00 00 00 00       	mov    $0x0,%eax
  802c89:	c9                   	leaveq 
  802c8a:	c3                   	retq   

0000000000802c8b <devfile_trunc>:
  802c8b:	55                   	push   %rbp
  802c8c:	48 89 e5             	mov    %rsp,%rbp
  802c8f:	48 83 ec 10          	sub    $0x10,%rsp
  802c93:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802c97:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802c9a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802c9e:	8b 50 0c             	mov    0xc(%rax),%edx
  802ca1:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802ca8:	00 00 00 
  802cab:	89 10                	mov    %edx,(%rax)
  802cad:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802cb4:	00 00 00 
  802cb7:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802cba:	89 50 04             	mov    %edx,0x4(%rax)
  802cbd:	be 00 00 00 00       	mov    $0x0,%esi
  802cc2:	bf 02 00 00 00       	mov    $0x2,%edi
  802cc7:	48 b8 6a 28 80 00 00 	movabs $0x80286a,%rax
  802cce:	00 00 00 
  802cd1:	ff d0                	callq  *%rax
  802cd3:	c9                   	leaveq 
  802cd4:	c3                   	retq   

0000000000802cd5 <remove>:
  802cd5:	55                   	push   %rbp
  802cd6:	48 89 e5             	mov    %rsp,%rbp
  802cd9:	48 83 ec 10          	sub    $0x10,%rsp
  802cdd:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802ce1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802ce5:	48 89 c7             	mov    %rax,%rdi
  802ce8:	48 b8 8a 10 80 00 00 	movabs $0x80108a,%rax
  802cef:	00 00 00 
  802cf2:	ff d0                	callq  *%rax
  802cf4:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802cf9:	7e 07                	jle    802d02 <remove+0x2d>
  802cfb:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802d00:	eb 33                	jmp    802d35 <remove+0x60>
  802d02:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802d06:	48 89 c6             	mov    %rax,%rsi
  802d09:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  802d10:	00 00 00 
  802d13:	48 b8 f6 10 80 00 00 	movabs $0x8010f6,%rax
  802d1a:	00 00 00 
  802d1d:	ff d0                	callq  *%rax
  802d1f:	be 00 00 00 00       	mov    $0x0,%esi
  802d24:	bf 07 00 00 00       	mov    $0x7,%edi
  802d29:	48 b8 6a 28 80 00 00 	movabs $0x80286a,%rax
  802d30:	00 00 00 
  802d33:	ff d0                	callq  *%rax
  802d35:	c9                   	leaveq 
  802d36:	c3                   	retq   

0000000000802d37 <sync>:
  802d37:	55                   	push   %rbp
  802d38:	48 89 e5             	mov    %rsp,%rbp
  802d3b:	be 00 00 00 00       	mov    $0x0,%esi
  802d40:	bf 08 00 00 00       	mov    $0x8,%edi
  802d45:	48 b8 6a 28 80 00 00 	movabs $0x80286a,%rax
  802d4c:	00 00 00 
  802d4f:	ff d0                	callq  *%rax
  802d51:	5d                   	pop    %rbp
  802d52:	c3                   	retq   

0000000000802d53 <copy>:
  802d53:	55                   	push   %rbp
  802d54:	48 89 e5             	mov    %rsp,%rbp
  802d57:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  802d5e:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  802d65:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  802d6c:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  802d73:	be 00 00 00 00       	mov    $0x0,%esi
  802d78:	48 89 c7             	mov    %rax,%rdi
  802d7b:	48 b8 f1 28 80 00 00 	movabs $0x8028f1,%rax
  802d82:	00 00 00 
  802d85:	ff d0                	callq  *%rax
  802d87:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d8a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d8e:	79 28                	jns    802db8 <copy+0x65>
  802d90:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d93:	89 c6                	mov    %eax,%esi
  802d95:	48 bf 6c 54 80 00 00 	movabs $0x80546c,%rdi
  802d9c:	00 00 00 
  802d9f:	b8 00 00 00 00       	mov    $0x0,%eax
  802da4:	48 ba 41 05 80 00 00 	movabs $0x800541,%rdx
  802dab:	00 00 00 
  802dae:	ff d2                	callq  *%rdx
  802db0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802db3:	e9 74 01 00 00       	jmpq   802f2c <copy+0x1d9>
  802db8:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  802dbf:	be 01 01 00 00       	mov    $0x101,%esi
  802dc4:	48 89 c7             	mov    %rax,%rdi
  802dc7:	48 b8 f1 28 80 00 00 	movabs $0x8028f1,%rax
  802dce:	00 00 00 
  802dd1:	ff d0                	callq  *%rax
  802dd3:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802dd6:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802dda:	79 39                	jns    802e15 <copy+0xc2>
  802ddc:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802ddf:	89 c6                	mov    %eax,%esi
  802de1:	48 bf 82 54 80 00 00 	movabs $0x805482,%rdi
  802de8:	00 00 00 
  802deb:	b8 00 00 00 00       	mov    $0x0,%eax
  802df0:	48 ba 41 05 80 00 00 	movabs $0x800541,%rdx
  802df7:	00 00 00 
  802dfa:	ff d2                	callq  *%rdx
  802dfc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802dff:	89 c7                	mov    %eax,%edi
  802e01:	48 b8 f9 21 80 00 00 	movabs $0x8021f9,%rax
  802e08:	00 00 00 
  802e0b:	ff d0                	callq  *%rax
  802e0d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802e10:	e9 17 01 00 00       	jmpq   802f2c <copy+0x1d9>
  802e15:	eb 74                	jmp    802e8b <copy+0x138>
  802e17:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802e1a:	48 63 d0             	movslq %eax,%rdx
  802e1d:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802e24:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802e27:	48 89 ce             	mov    %rcx,%rsi
  802e2a:	89 c7                	mov    %eax,%edi
  802e2c:	48 b8 65 25 80 00 00 	movabs $0x802565,%rax
  802e33:	00 00 00 
  802e36:	ff d0                	callq  *%rax
  802e38:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802e3b:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802e3f:	79 4a                	jns    802e8b <copy+0x138>
  802e41:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802e44:	89 c6                	mov    %eax,%esi
  802e46:	48 bf 9c 54 80 00 00 	movabs $0x80549c,%rdi
  802e4d:	00 00 00 
  802e50:	b8 00 00 00 00       	mov    $0x0,%eax
  802e55:	48 ba 41 05 80 00 00 	movabs $0x800541,%rdx
  802e5c:	00 00 00 
  802e5f:	ff d2                	callq  *%rdx
  802e61:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e64:	89 c7                	mov    %eax,%edi
  802e66:	48 b8 f9 21 80 00 00 	movabs $0x8021f9,%rax
  802e6d:	00 00 00 
  802e70:	ff d0                	callq  *%rax
  802e72:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802e75:	89 c7                	mov    %eax,%edi
  802e77:	48 b8 f9 21 80 00 00 	movabs $0x8021f9,%rax
  802e7e:	00 00 00 
  802e81:	ff d0                	callq  *%rax
  802e83:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802e86:	e9 a1 00 00 00       	jmpq   802f2c <copy+0x1d9>
  802e8b:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802e92:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e95:	ba 00 02 00 00       	mov    $0x200,%edx
  802e9a:	48 89 ce             	mov    %rcx,%rsi
  802e9d:	89 c7                	mov    %eax,%edi
  802e9f:	48 b8 1b 24 80 00 00 	movabs $0x80241b,%rax
  802ea6:	00 00 00 
  802ea9:	ff d0                	callq  *%rax
  802eab:	89 45 f4             	mov    %eax,-0xc(%rbp)
  802eae:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802eb2:	0f 8f 5f ff ff ff    	jg     802e17 <copy+0xc4>
  802eb8:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802ebc:	79 47                	jns    802f05 <copy+0x1b2>
  802ebe:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802ec1:	89 c6                	mov    %eax,%esi
  802ec3:	48 bf af 54 80 00 00 	movabs $0x8054af,%rdi
  802eca:	00 00 00 
  802ecd:	b8 00 00 00 00       	mov    $0x0,%eax
  802ed2:	48 ba 41 05 80 00 00 	movabs $0x800541,%rdx
  802ed9:	00 00 00 
  802edc:	ff d2                	callq  *%rdx
  802ede:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ee1:	89 c7                	mov    %eax,%edi
  802ee3:	48 b8 f9 21 80 00 00 	movabs $0x8021f9,%rax
  802eea:	00 00 00 
  802eed:	ff d0                	callq  *%rax
  802eef:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802ef2:	89 c7                	mov    %eax,%edi
  802ef4:	48 b8 f9 21 80 00 00 	movabs $0x8021f9,%rax
  802efb:	00 00 00 
  802efe:	ff d0                	callq  *%rax
  802f00:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802f03:	eb 27                	jmp    802f2c <copy+0x1d9>
  802f05:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f08:	89 c7                	mov    %eax,%edi
  802f0a:	48 b8 f9 21 80 00 00 	movabs $0x8021f9,%rax
  802f11:	00 00 00 
  802f14:	ff d0                	callq  *%rax
  802f16:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802f19:	89 c7                	mov    %eax,%edi
  802f1b:	48 b8 f9 21 80 00 00 	movabs $0x8021f9,%rax
  802f22:	00 00 00 
  802f25:	ff d0                	callq  *%rax
  802f27:	b8 00 00 00 00       	mov    $0x0,%eax
  802f2c:	c9                   	leaveq 
  802f2d:	c3                   	retq   

0000000000802f2e <spawn>:
  802f2e:	55                   	push   %rbp
  802f2f:	48 89 e5             	mov    %rsp,%rbp
  802f32:	48 81 ec 10 03 00 00 	sub    $0x310,%rsp
  802f39:	48 89 bd 08 fd ff ff 	mov    %rdi,-0x2f8(%rbp)
  802f40:	48 89 b5 00 fd ff ff 	mov    %rsi,-0x300(%rbp)
  802f47:	48 8b 85 08 fd ff ff 	mov    -0x2f8(%rbp),%rax
  802f4e:	be 00 00 00 00       	mov    $0x0,%esi
  802f53:	48 89 c7             	mov    %rax,%rdi
  802f56:	48 b8 f1 28 80 00 00 	movabs $0x8028f1,%rax
  802f5d:	00 00 00 
  802f60:	ff d0                	callq  *%rax
  802f62:	89 45 e8             	mov    %eax,-0x18(%rbp)
  802f65:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  802f69:	79 08                	jns    802f73 <spawn+0x45>
  802f6b:	8b 45 e8             	mov    -0x18(%rbp),%eax
  802f6e:	e9 0c 03 00 00       	jmpq   80327f <spawn+0x351>
  802f73:	8b 45 e8             	mov    -0x18(%rbp),%eax
  802f76:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  802f79:	48 8d 85 d0 fd ff ff 	lea    -0x230(%rbp),%rax
  802f80:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  802f84:	48 8d 8d d0 fd ff ff 	lea    -0x230(%rbp),%rcx
  802f8b:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  802f8e:	ba 00 02 00 00       	mov    $0x200,%edx
  802f93:	48 89 ce             	mov    %rcx,%rsi
  802f96:	89 c7                	mov    %eax,%edi
  802f98:	48 b8 f0 24 80 00 00 	movabs $0x8024f0,%rax
  802f9f:	00 00 00 
  802fa2:	ff d0                	callq  *%rax
  802fa4:	3d 00 02 00 00       	cmp    $0x200,%eax
  802fa9:	75 0d                	jne    802fb8 <spawn+0x8a>
  802fab:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802faf:	8b 00                	mov    (%rax),%eax
  802fb1:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
  802fb6:	74 43                	je     802ffb <spawn+0xcd>
  802fb8:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  802fbb:	89 c7                	mov    %eax,%edi
  802fbd:	48 b8 f9 21 80 00 00 	movabs $0x8021f9,%rax
  802fc4:	00 00 00 
  802fc7:	ff d0                	callq  *%rax
  802fc9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802fcd:	8b 00                	mov    (%rax),%eax
  802fcf:	ba 7f 45 4c 46       	mov    $0x464c457f,%edx
  802fd4:	89 c6                	mov    %eax,%esi
  802fd6:	48 bf c8 54 80 00 00 	movabs $0x8054c8,%rdi
  802fdd:	00 00 00 
  802fe0:	b8 00 00 00 00       	mov    $0x0,%eax
  802fe5:	48 b9 41 05 80 00 00 	movabs $0x800541,%rcx
  802fec:	00 00 00 
  802fef:	ff d1                	callq  *%rcx
  802ff1:	b8 f1 ff ff ff       	mov    $0xfffffff1,%eax
  802ff6:	e9 84 02 00 00       	jmpq   80327f <spawn+0x351>
  802ffb:	b8 07 00 00 00       	mov    $0x7,%eax
  803000:	cd 30                	int    $0x30
  803002:	89 45 d0             	mov    %eax,-0x30(%rbp)
  803005:	8b 45 d0             	mov    -0x30(%rbp),%eax
  803008:	89 45 e8             	mov    %eax,-0x18(%rbp)
  80300b:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  80300f:	79 08                	jns    803019 <spawn+0xeb>
  803011:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803014:	e9 66 02 00 00       	jmpq   80327f <spawn+0x351>
  803019:	8b 45 e8             	mov    -0x18(%rbp),%eax
  80301c:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  80301f:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  803022:	25 ff 03 00 00       	and    $0x3ff,%eax
  803027:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  80302e:	00 00 00 
  803031:	48 98                	cltq   
  803033:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  80303a:	48 01 d0             	add    %rdx,%rax
  80303d:	48 8d 95 10 fd ff ff 	lea    -0x2f0(%rbp),%rdx
  803044:	48 89 c6             	mov    %rax,%rsi
  803047:	b8 18 00 00 00       	mov    $0x18,%eax
  80304c:	48 89 d7             	mov    %rdx,%rdi
  80304f:	48 89 c1             	mov    %rax,%rcx
  803052:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
  803055:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803059:	48 8b 40 18          	mov    0x18(%rax),%rax
  80305d:	48 89 85 a8 fd ff ff 	mov    %rax,-0x258(%rbp)
  803064:	48 8d 85 10 fd ff ff 	lea    -0x2f0(%rbp),%rax
  80306b:	48 8d 90 b0 00 00 00 	lea    0xb0(%rax),%rdx
  803072:	48 8b 8d 00 fd ff ff 	mov    -0x300(%rbp),%rcx
  803079:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  80307c:	48 89 ce             	mov    %rcx,%rsi
  80307f:	89 c7                	mov    %eax,%edi
  803081:	48 b8 e9 34 80 00 00 	movabs $0x8034e9,%rax
  803088:	00 00 00 
  80308b:	ff d0                	callq  *%rax
  80308d:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803090:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  803094:	79 08                	jns    80309e <spawn+0x170>
  803096:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803099:	e9 e1 01 00 00       	jmpq   80327f <spawn+0x351>
  80309e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8030a2:	48 8b 40 20          	mov    0x20(%rax),%rax
  8030a6:	48 8d 95 d0 fd ff ff 	lea    -0x230(%rbp),%rdx
  8030ad:	48 01 d0             	add    %rdx,%rax
  8030b0:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8030b4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8030bb:	e9 a3 00 00 00       	jmpq   803163 <spawn+0x235>
  8030c0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8030c4:	8b 00                	mov    (%rax),%eax
  8030c6:	83 f8 01             	cmp    $0x1,%eax
  8030c9:	74 05                	je     8030d0 <spawn+0x1a2>
  8030cb:	e9 8a 00 00 00       	jmpq   80315a <spawn+0x22c>
  8030d0:	c7 45 ec 05 00 00 00 	movl   $0x5,-0x14(%rbp)
  8030d7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8030db:	8b 40 04             	mov    0x4(%rax),%eax
  8030de:	83 e0 02             	and    $0x2,%eax
  8030e1:	85 c0                	test   %eax,%eax
  8030e3:	74 04                	je     8030e9 <spawn+0x1bb>
  8030e5:	83 4d ec 02          	orl    $0x2,-0x14(%rbp)
  8030e9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8030ed:	48 8b 40 08          	mov    0x8(%rax),%rax
  8030f1:	41 89 c1             	mov    %eax,%r9d
  8030f4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8030f8:	4c 8b 40 20          	mov    0x20(%rax),%r8
  8030fc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803100:	48 8b 50 28          	mov    0x28(%rax),%rdx
  803104:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803108:	48 8b 70 10          	mov    0x10(%rax),%rsi
  80310c:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  80310f:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  803112:	8b 7d ec             	mov    -0x14(%rbp),%edi
  803115:	89 3c 24             	mov    %edi,(%rsp)
  803118:	89 c7                	mov    %eax,%edi
  80311a:	48 b8 92 37 80 00 00 	movabs $0x803792,%rax
  803121:	00 00 00 
  803124:	ff d0                	callq  *%rax
  803126:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803129:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  80312d:	79 2b                	jns    80315a <spawn+0x22c>
  80312f:	90                   	nop
  803130:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  803133:	89 c7                	mov    %eax,%edi
  803135:	48 b8 65 19 80 00 00 	movabs $0x801965,%rax
  80313c:	00 00 00 
  80313f:	ff d0                	callq  *%rax
  803141:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  803144:	89 c7                	mov    %eax,%edi
  803146:	48 b8 f9 21 80 00 00 	movabs $0x8021f9,%rax
  80314d:	00 00 00 
  803150:	ff d0                	callq  *%rax
  803152:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803155:	e9 25 01 00 00       	jmpq   80327f <spawn+0x351>
  80315a:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80315e:	48 83 45 f0 38       	addq   $0x38,-0x10(%rbp)
  803163:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803167:	0f b7 40 38          	movzwl 0x38(%rax),%eax
  80316b:	0f b7 c0             	movzwl %ax,%eax
  80316e:	3b 45 fc             	cmp    -0x4(%rbp),%eax
  803171:	0f 8f 49 ff ff ff    	jg     8030c0 <spawn+0x192>
  803177:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80317a:	89 c7                	mov    %eax,%edi
  80317c:	48 b8 f9 21 80 00 00 	movabs $0x8021f9,%rax
  803183:	00 00 00 
  803186:	ff d0                	callq  *%rax
  803188:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%rbp)
  80318f:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  803192:	89 c7                	mov    %eax,%edi
  803194:	48 b8 7e 39 80 00 00 	movabs $0x80397e,%rax
  80319b:	00 00 00 
  80319e:	ff d0                	callq  *%rax
  8031a0:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8031a3:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  8031a7:	79 30                	jns    8031d9 <spawn+0x2ab>
  8031a9:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8031ac:	89 c1                	mov    %eax,%ecx
  8031ae:	48 ba e2 54 80 00 00 	movabs $0x8054e2,%rdx
  8031b5:	00 00 00 
  8031b8:	be 86 00 00 00       	mov    $0x86,%esi
  8031bd:	48 bf f8 54 80 00 00 	movabs $0x8054f8,%rdi
  8031c4:	00 00 00 
  8031c7:	b8 00 00 00 00       	mov    $0x0,%eax
  8031cc:	49 b8 08 03 80 00 00 	movabs $0x800308,%r8
  8031d3:	00 00 00 
  8031d6:	41 ff d0             	callq  *%r8
  8031d9:	48 8d 95 10 fd ff ff 	lea    -0x2f0(%rbp),%rdx
  8031e0:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  8031e3:	48 89 d6             	mov    %rdx,%rsi
  8031e6:	89 c7                	mov    %eax,%edi
  8031e8:	48 b8 65 1b 80 00 00 	movabs $0x801b65,%rax
  8031ef:	00 00 00 
  8031f2:	ff d0                	callq  *%rax
  8031f4:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8031f7:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  8031fb:	79 30                	jns    80322d <spawn+0x2ff>
  8031fd:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803200:	89 c1                	mov    %eax,%ecx
  803202:	48 ba 07 55 80 00 00 	movabs $0x805507,%rdx
  803209:	00 00 00 
  80320c:	be 8a 00 00 00       	mov    $0x8a,%esi
  803211:	48 bf f8 54 80 00 00 	movabs $0x8054f8,%rdi
  803218:	00 00 00 
  80321b:	b8 00 00 00 00       	mov    $0x0,%eax
  803220:	49 b8 08 03 80 00 00 	movabs $0x800308,%r8
  803227:	00 00 00 
  80322a:	41 ff d0             	callq  *%r8
  80322d:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  803230:	be 02 00 00 00       	mov    $0x2,%esi
  803235:	89 c7                	mov    %eax,%edi
  803237:	48 b8 1a 1b 80 00 00 	movabs $0x801b1a,%rax
  80323e:	00 00 00 
  803241:	ff d0                	callq  *%rax
  803243:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803246:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  80324a:	79 30                	jns    80327c <spawn+0x34e>
  80324c:	8b 45 e8             	mov    -0x18(%rbp),%eax
  80324f:	89 c1                	mov    %eax,%ecx
  803251:	48 ba 21 55 80 00 00 	movabs $0x805521,%rdx
  803258:	00 00 00 
  80325b:	be 8d 00 00 00       	mov    $0x8d,%esi
  803260:	48 bf f8 54 80 00 00 	movabs $0x8054f8,%rdi
  803267:	00 00 00 
  80326a:	b8 00 00 00 00       	mov    $0x0,%eax
  80326f:	49 b8 08 03 80 00 00 	movabs $0x800308,%r8
  803276:	00 00 00 
  803279:	41 ff d0             	callq  *%r8
  80327c:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  80327f:	c9                   	leaveq 
  803280:	c3                   	retq   

0000000000803281 <spawnl>:
  803281:	55                   	push   %rbp
  803282:	48 89 e5             	mov    %rsp,%rbp
  803285:	41 55                	push   %r13
  803287:	41 54                	push   %r12
  803289:	53                   	push   %rbx
  80328a:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  803291:	48 89 bd f8 fe ff ff 	mov    %rdi,-0x108(%rbp)
  803298:	48 89 95 40 ff ff ff 	mov    %rdx,-0xc0(%rbp)
  80329f:	48 89 8d 48 ff ff ff 	mov    %rcx,-0xb8(%rbp)
  8032a6:	4c 89 85 50 ff ff ff 	mov    %r8,-0xb0(%rbp)
  8032ad:	4c 89 8d 58 ff ff ff 	mov    %r9,-0xa8(%rbp)
  8032b4:	84 c0                	test   %al,%al
  8032b6:	74 26                	je     8032de <spawnl+0x5d>
  8032b8:	0f 29 85 60 ff ff ff 	movaps %xmm0,-0xa0(%rbp)
  8032bf:	0f 29 8d 70 ff ff ff 	movaps %xmm1,-0x90(%rbp)
  8032c6:	0f 29 55 80          	movaps %xmm2,-0x80(%rbp)
  8032ca:	0f 29 5d 90          	movaps %xmm3,-0x70(%rbp)
  8032ce:	0f 29 65 a0          	movaps %xmm4,-0x60(%rbp)
  8032d2:	0f 29 6d b0          	movaps %xmm5,-0x50(%rbp)
  8032d6:	0f 29 75 c0          	movaps %xmm6,-0x40(%rbp)
  8032da:	0f 29 7d d0          	movaps %xmm7,-0x30(%rbp)
  8032de:	48 89 b5 f0 fe ff ff 	mov    %rsi,-0x110(%rbp)
  8032e5:	c7 85 2c ff ff ff 00 	movl   $0x0,-0xd4(%rbp)
  8032ec:	00 00 00 
  8032ef:	c7 85 00 ff ff ff 10 	movl   $0x10,-0x100(%rbp)
  8032f6:	00 00 00 
  8032f9:	c7 85 04 ff ff ff 30 	movl   $0x30,-0xfc(%rbp)
  803300:	00 00 00 
  803303:	48 8d 45 10          	lea    0x10(%rbp),%rax
  803307:	48 89 85 08 ff ff ff 	mov    %rax,-0xf8(%rbp)
  80330e:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
  803315:	48 89 85 10 ff ff ff 	mov    %rax,-0xf0(%rbp)
  80331c:	eb 07                	jmp    803325 <spawnl+0xa4>
  80331e:	83 85 2c ff ff ff 01 	addl   $0x1,-0xd4(%rbp)
  803325:	8b 85 00 ff ff ff    	mov    -0x100(%rbp),%eax
  80332b:	83 f8 30             	cmp    $0x30,%eax
  80332e:	73 23                	jae    803353 <spawnl+0xd2>
  803330:	48 8b 95 10 ff ff ff 	mov    -0xf0(%rbp),%rdx
  803337:	8b 85 00 ff ff ff    	mov    -0x100(%rbp),%eax
  80333d:	89 c0                	mov    %eax,%eax
  80333f:	48 01 d0             	add    %rdx,%rax
  803342:	8b 95 00 ff ff ff    	mov    -0x100(%rbp),%edx
  803348:	83 c2 08             	add    $0x8,%edx
  80334b:	89 95 00 ff ff ff    	mov    %edx,-0x100(%rbp)
  803351:	eb 15                	jmp    803368 <spawnl+0xe7>
  803353:	48 8b 95 08 ff ff ff 	mov    -0xf8(%rbp),%rdx
  80335a:	48 89 d0             	mov    %rdx,%rax
  80335d:	48 83 c2 08          	add    $0x8,%rdx
  803361:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  803368:	48 8b 00             	mov    (%rax),%rax
  80336b:	48 85 c0             	test   %rax,%rax
  80336e:	75 ae                	jne    80331e <spawnl+0x9d>
  803370:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  803376:	83 c0 02             	add    $0x2,%eax
  803379:	48 89 e2             	mov    %rsp,%rdx
  80337c:	48 89 d3             	mov    %rdx,%rbx
  80337f:	48 63 d0             	movslq %eax,%rdx
  803382:	48 83 ea 01          	sub    $0x1,%rdx
  803386:	48 89 95 20 ff ff ff 	mov    %rdx,-0xe0(%rbp)
  80338d:	48 63 d0             	movslq %eax,%rdx
  803390:	49 89 d4             	mov    %rdx,%r12
  803393:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  803399:	48 63 d0             	movslq %eax,%rdx
  80339c:	49 89 d2             	mov    %rdx,%r10
  80339f:	41 bb 00 00 00 00    	mov    $0x0,%r11d
  8033a5:	48 98                	cltq   
  8033a7:	48 c1 e0 03          	shl    $0x3,%rax
  8033ab:	48 8d 50 07          	lea    0x7(%rax),%rdx
  8033af:	b8 10 00 00 00       	mov    $0x10,%eax
  8033b4:	48 83 e8 01          	sub    $0x1,%rax
  8033b8:	48 01 d0             	add    %rdx,%rax
  8033bb:	bf 10 00 00 00       	mov    $0x10,%edi
  8033c0:	ba 00 00 00 00       	mov    $0x0,%edx
  8033c5:	48 f7 f7             	div    %rdi
  8033c8:	48 6b c0 10          	imul   $0x10,%rax,%rax
  8033cc:	48 29 c4             	sub    %rax,%rsp
  8033cf:	48 89 e0             	mov    %rsp,%rax
  8033d2:	48 83 c0 07          	add    $0x7,%rax
  8033d6:	48 c1 e8 03          	shr    $0x3,%rax
  8033da:	48 c1 e0 03          	shl    $0x3,%rax
  8033de:	48 89 85 18 ff ff ff 	mov    %rax,-0xe8(%rbp)
  8033e5:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  8033ec:	48 8b 95 f0 fe ff ff 	mov    -0x110(%rbp),%rdx
  8033f3:	48 89 10             	mov    %rdx,(%rax)
  8033f6:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  8033fc:	8d 50 01             	lea    0x1(%rax),%edx
  8033ff:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  803406:	48 63 d2             	movslq %edx,%rdx
  803409:	48 c7 04 d0 00 00 00 	movq   $0x0,(%rax,%rdx,8)
  803410:	00 
  803411:	c7 85 00 ff ff ff 10 	movl   $0x10,-0x100(%rbp)
  803418:	00 00 00 
  80341b:	c7 85 04 ff ff ff 30 	movl   $0x30,-0xfc(%rbp)
  803422:	00 00 00 
  803425:	48 8d 45 10          	lea    0x10(%rbp),%rax
  803429:	48 89 85 08 ff ff ff 	mov    %rax,-0xf8(%rbp)
  803430:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
  803437:	48 89 85 10 ff ff ff 	mov    %rax,-0xf0(%rbp)
  80343e:	c7 85 28 ff ff ff 00 	movl   $0x0,-0xd8(%rbp)
  803445:	00 00 00 
  803448:	eb 63                	jmp    8034ad <spawnl+0x22c>
  80344a:	8b 85 28 ff ff ff    	mov    -0xd8(%rbp),%eax
  803450:	8d 70 01             	lea    0x1(%rax),%esi
  803453:	8b 85 00 ff ff ff    	mov    -0x100(%rbp),%eax
  803459:	83 f8 30             	cmp    $0x30,%eax
  80345c:	73 23                	jae    803481 <spawnl+0x200>
  80345e:	48 8b 95 10 ff ff ff 	mov    -0xf0(%rbp),%rdx
  803465:	8b 85 00 ff ff ff    	mov    -0x100(%rbp),%eax
  80346b:	89 c0                	mov    %eax,%eax
  80346d:	48 01 d0             	add    %rdx,%rax
  803470:	8b 95 00 ff ff ff    	mov    -0x100(%rbp),%edx
  803476:	83 c2 08             	add    $0x8,%edx
  803479:	89 95 00 ff ff ff    	mov    %edx,-0x100(%rbp)
  80347f:	eb 15                	jmp    803496 <spawnl+0x215>
  803481:	48 8b 95 08 ff ff ff 	mov    -0xf8(%rbp),%rdx
  803488:	48 89 d0             	mov    %rdx,%rax
  80348b:	48 83 c2 08          	add    $0x8,%rdx
  80348f:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  803496:	48 8b 08             	mov    (%rax),%rcx
  803499:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  8034a0:	89 f2                	mov    %esi,%edx
  8034a2:	48 89 0c d0          	mov    %rcx,(%rax,%rdx,8)
  8034a6:	83 85 28 ff ff ff 01 	addl   $0x1,-0xd8(%rbp)
  8034ad:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  8034b3:	3b 85 28 ff ff ff    	cmp    -0xd8(%rbp),%eax
  8034b9:	77 8f                	ja     80344a <spawnl+0x1c9>
  8034bb:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  8034c2:	48 8b 85 f8 fe ff ff 	mov    -0x108(%rbp),%rax
  8034c9:	48 89 d6             	mov    %rdx,%rsi
  8034cc:	48 89 c7             	mov    %rax,%rdi
  8034cf:	48 b8 2e 2f 80 00 00 	movabs $0x802f2e,%rax
  8034d6:	00 00 00 
  8034d9:	ff d0                	callq  *%rax
  8034db:	48 89 dc             	mov    %rbx,%rsp
  8034de:	48 8d 65 e8          	lea    -0x18(%rbp),%rsp
  8034e2:	5b                   	pop    %rbx
  8034e3:	41 5c                	pop    %r12
  8034e5:	41 5d                	pop    %r13
  8034e7:	5d                   	pop    %rbp
  8034e8:	c3                   	retq   

00000000008034e9 <init_stack>:
  8034e9:	55                   	push   %rbp
  8034ea:	48 89 e5             	mov    %rsp,%rbp
  8034ed:	48 83 ec 50          	sub    $0x50,%rsp
  8034f1:	89 7d cc             	mov    %edi,-0x34(%rbp)
  8034f4:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
  8034f8:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  8034fc:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803503:	00 
  803504:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
  80350b:	eb 33                	jmp    803540 <init_stack+0x57>
  80350d:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803510:	48 98                	cltq   
  803512:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  803519:	00 
  80351a:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  80351e:	48 01 d0             	add    %rdx,%rax
  803521:	48 8b 00             	mov    (%rax),%rax
  803524:	48 89 c7             	mov    %rax,%rdi
  803527:	48 b8 8a 10 80 00 00 	movabs $0x80108a,%rax
  80352e:	00 00 00 
  803531:	ff d0                	callq  *%rax
  803533:	83 c0 01             	add    $0x1,%eax
  803536:	48 98                	cltq   
  803538:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  80353c:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
  803540:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803543:	48 98                	cltq   
  803545:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  80354c:	00 
  80354d:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  803551:	48 01 d0             	add    %rdx,%rax
  803554:	48 8b 00             	mov    (%rax),%rax
  803557:	48 85 c0             	test   %rax,%rax
  80355a:	75 b1                	jne    80350d <init_stack+0x24>
  80355c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803560:	48 f7 d8             	neg    %rax
  803563:	48 05 00 10 40 00    	add    $0x401000,%rax
  803569:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80356d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803571:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  803575:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803579:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  80357d:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803580:	83 c2 01             	add    $0x1,%edx
  803583:	c1 e2 03             	shl    $0x3,%edx
  803586:	48 63 d2             	movslq %edx,%rdx
  803589:	48 f7 da             	neg    %rdx
  80358c:	48 01 d0             	add    %rdx,%rax
  80358f:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  803593:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803597:	48 83 e8 10          	sub    $0x10,%rax
  80359b:	48 3d ff ff 3f 00    	cmp    $0x3fffff,%rax
  8035a1:	77 0a                	ja     8035ad <init_stack+0xc4>
  8035a3:	b8 fc ff ff ff       	mov    $0xfffffffc,%eax
  8035a8:	e9 e3 01 00 00       	jmpq   803790 <init_stack+0x2a7>
  8035ad:	ba 07 00 00 00       	mov    $0x7,%edx
  8035b2:	be 00 00 40 00       	mov    $0x400000,%esi
  8035b7:	bf 00 00 00 00       	mov    $0x0,%edi
  8035bc:	48 b8 25 1a 80 00 00 	movabs $0x801a25,%rax
  8035c3:	00 00 00 
  8035c6:	ff d0                	callq  *%rax
  8035c8:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8035cb:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8035cf:	79 08                	jns    8035d9 <init_stack+0xf0>
  8035d1:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8035d4:	e9 b7 01 00 00       	jmpq   803790 <init_stack+0x2a7>
  8035d9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
  8035e0:	e9 8a 00 00 00       	jmpq   80366f <init_stack+0x186>
  8035e5:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8035e8:	48 98                	cltq   
  8035ea:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8035f1:	00 
  8035f2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8035f6:	48 01 c2             	add    %rax,%rdx
  8035f9:	b9 00 d0 7f ef       	mov    $0xef7fd000,%ecx
  8035fe:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803602:	48 01 c8             	add    %rcx,%rax
  803605:	48 2d 00 00 40 00    	sub    $0x400000,%rax
  80360b:	48 89 02             	mov    %rax,(%rdx)
  80360e:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803611:	48 98                	cltq   
  803613:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  80361a:	00 
  80361b:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  80361f:	48 01 d0             	add    %rdx,%rax
  803622:	48 8b 10             	mov    (%rax),%rdx
  803625:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803629:	48 89 d6             	mov    %rdx,%rsi
  80362c:	48 89 c7             	mov    %rax,%rdi
  80362f:	48 b8 f6 10 80 00 00 	movabs $0x8010f6,%rax
  803636:	00 00 00 
  803639:	ff d0                	callq  *%rax
  80363b:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80363e:	48 98                	cltq   
  803640:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  803647:	00 
  803648:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  80364c:	48 01 d0             	add    %rdx,%rax
  80364f:	48 8b 00             	mov    (%rax),%rax
  803652:	48 89 c7             	mov    %rax,%rdi
  803655:	48 b8 8a 10 80 00 00 	movabs $0x80108a,%rax
  80365c:	00 00 00 
  80365f:	ff d0                	callq  *%rax
  803661:	48 98                	cltq   
  803663:	48 83 c0 01          	add    $0x1,%rax
  803667:	48 01 45 e0          	add    %rax,-0x20(%rbp)
  80366b:	83 45 f0 01          	addl   $0x1,-0x10(%rbp)
  80366f:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803672:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  803675:	0f 8c 6a ff ff ff    	jl     8035e5 <init_stack+0xfc>
  80367b:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80367e:	48 98                	cltq   
  803680:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  803687:	00 
  803688:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80368c:	48 01 d0             	add    %rdx,%rax
  80368f:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  803696:	48 81 7d e0 00 10 40 	cmpq   $0x401000,-0x20(%rbp)
  80369d:	00 
  80369e:	74 35                	je     8036d5 <init_stack+0x1ec>
  8036a0:	48 b9 38 55 80 00 00 	movabs $0x805538,%rcx
  8036a7:	00 00 00 
  8036aa:	48 ba 5e 55 80 00 00 	movabs $0x80555e,%rdx
  8036b1:	00 00 00 
  8036b4:	be f6 00 00 00       	mov    $0xf6,%esi
  8036b9:	48 bf f8 54 80 00 00 	movabs $0x8054f8,%rdi
  8036c0:	00 00 00 
  8036c3:	b8 00 00 00 00       	mov    $0x0,%eax
  8036c8:	49 b8 08 03 80 00 00 	movabs $0x800308,%r8
  8036cf:	00 00 00 
  8036d2:	41 ff d0             	callq  *%r8
  8036d5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8036d9:	48 8d 50 f8          	lea    -0x8(%rax),%rdx
  8036dd:	b9 00 d0 7f ef       	mov    $0xef7fd000,%ecx
  8036e2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8036e6:	48 01 c8             	add    %rcx,%rax
  8036e9:	48 2d 00 00 40 00    	sub    $0x400000,%rax
  8036ef:	48 89 02             	mov    %rax,(%rdx)
  8036f2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8036f6:	48 8d 50 f0          	lea    -0x10(%rax),%rdx
  8036fa:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8036fd:	48 98                	cltq   
  8036ff:	48 89 02             	mov    %rax,(%rdx)
  803702:	ba f0 cf 7f ef       	mov    $0xef7fcff0,%edx
  803707:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80370b:	48 01 d0             	add    %rdx,%rax
  80370e:	48 2d 00 00 40 00    	sub    $0x400000,%rax
  803714:	48 89 c2             	mov    %rax,%rdx
  803717:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  80371b:	48 89 10             	mov    %rdx,(%rax)
  80371e:	8b 45 cc             	mov    -0x34(%rbp),%eax
  803721:	41 b8 07 00 00 00    	mov    $0x7,%r8d
  803727:	b9 00 d0 7f ef       	mov    $0xef7fd000,%ecx
  80372c:	89 c2                	mov    %eax,%edx
  80372e:	be 00 00 40 00       	mov    $0x400000,%esi
  803733:	bf 00 00 00 00       	mov    $0x0,%edi
  803738:	48 b8 75 1a 80 00 00 	movabs $0x801a75,%rax
  80373f:	00 00 00 
  803742:	ff d0                	callq  *%rax
  803744:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803747:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80374b:	79 02                	jns    80374f <init_stack+0x266>
  80374d:	eb 28                	jmp    803777 <init_stack+0x28e>
  80374f:	be 00 00 40 00       	mov    $0x400000,%esi
  803754:	bf 00 00 00 00       	mov    $0x0,%edi
  803759:	48 b8 d0 1a 80 00 00 	movabs $0x801ad0,%rax
  803760:	00 00 00 
  803763:	ff d0                	callq  *%rax
  803765:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803768:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80376c:	79 02                	jns    803770 <init_stack+0x287>
  80376e:	eb 07                	jmp    803777 <init_stack+0x28e>
  803770:	b8 00 00 00 00       	mov    $0x0,%eax
  803775:	eb 19                	jmp    803790 <init_stack+0x2a7>
  803777:	be 00 00 40 00       	mov    $0x400000,%esi
  80377c:	bf 00 00 00 00       	mov    $0x0,%edi
  803781:	48 b8 d0 1a 80 00 00 	movabs $0x801ad0,%rax
  803788:	00 00 00 
  80378b:	ff d0                	callq  *%rax
  80378d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803790:	c9                   	leaveq 
  803791:	c3                   	retq   

0000000000803792 <map_segment>:
  803792:	55                   	push   %rbp
  803793:	48 89 e5             	mov    %rsp,%rbp
  803796:	48 83 ec 50          	sub    $0x50,%rsp
  80379a:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80379d:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8037a1:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8037a5:	89 4d d8             	mov    %ecx,-0x28(%rbp)
  8037a8:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  8037ac:	44 89 4d bc          	mov    %r9d,-0x44(%rbp)
  8037b0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8037b4:	25 ff 0f 00 00       	and    $0xfff,%eax
  8037b9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8037bc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8037c0:	74 21                	je     8037e3 <map_segment+0x51>
  8037c2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037c5:	48 98                	cltq   
  8037c7:	48 29 45 d0          	sub    %rax,-0x30(%rbp)
  8037cb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037ce:	48 98                	cltq   
  8037d0:	48 01 45 c8          	add    %rax,-0x38(%rbp)
  8037d4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037d7:	48 98                	cltq   
  8037d9:	48 01 45 c0          	add    %rax,-0x40(%rbp)
  8037dd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037e0:	29 45 bc             	sub    %eax,-0x44(%rbp)
  8037e3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8037ea:	e9 79 01 00 00       	jmpq   803968 <map_segment+0x1d6>
  8037ef:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037f2:	48 98                	cltq   
  8037f4:	48 3b 45 c0          	cmp    -0x40(%rbp),%rax
  8037f8:	72 3c                	jb     803836 <map_segment+0xa4>
  8037fa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037fd:	48 63 d0             	movslq %eax,%rdx
  803800:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803804:	48 01 d0             	add    %rdx,%rax
  803807:	48 89 c1             	mov    %rax,%rcx
  80380a:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80380d:	8b 55 10             	mov    0x10(%rbp),%edx
  803810:	48 89 ce             	mov    %rcx,%rsi
  803813:	89 c7                	mov    %eax,%edi
  803815:	48 b8 25 1a 80 00 00 	movabs $0x801a25,%rax
  80381c:	00 00 00 
  80381f:	ff d0                	callq  *%rax
  803821:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803824:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803828:	0f 89 33 01 00 00    	jns    803961 <map_segment+0x1cf>
  80382e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803831:	e9 46 01 00 00       	jmpq   80397c <map_segment+0x1ea>
  803836:	ba 07 00 00 00       	mov    $0x7,%edx
  80383b:	be 00 00 40 00       	mov    $0x400000,%esi
  803840:	bf 00 00 00 00       	mov    $0x0,%edi
  803845:	48 b8 25 1a 80 00 00 	movabs $0x801a25,%rax
  80384c:	00 00 00 
  80384f:	ff d0                	callq  *%rax
  803851:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803854:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803858:	79 08                	jns    803862 <map_segment+0xd0>
  80385a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80385d:	e9 1a 01 00 00       	jmpq   80397c <map_segment+0x1ea>
  803862:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803865:	8b 55 bc             	mov    -0x44(%rbp),%edx
  803868:	01 c2                	add    %eax,%edx
  80386a:	8b 45 d8             	mov    -0x28(%rbp),%eax
  80386d:	89 d6                	mov    %edx,%esi
  80386f:	89 c7                	mov    %eax,%edi
  803871:	48 b8 39 26 80 00 00 	movabs $0x802639,%rax
  803878:	00 00 00 
  80387b:	ff d0                	callq  *%rax
  80387d:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803880:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803884:	79 08                	jns    80388e <map_segment+0xfc>
  803886:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803889:	e9 ee 00 00 00       	jmpq   80397c <map_segment+0x1ea>
  80388e:	c7 45 f4 00 10 00 00 	movl   $0x1000,-0xc(%rbp)
  803895:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803898:	48 98                	cltq   
  80389a:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  80389e:	48 29 c2             	sub    %rax,%rdx
  8038a1:	48 89 d0             	mov    %rdx,%rax
  8038a4:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8038a8:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8038ab:	48 63 d0             	movslq %eax,%rdx
  8038ae:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8038b2:	48 39 c2             	cmp    %rax,%rdx
  8038b5:	48 0f 47 d0          	cmova  %rax,%rdx
  8038b9:	8b 45 d8             	mov    -0x28(%rbp),%eax
  8038bc:	be 00 00 40 00       	mov    $0x400000,%esi
  8038c1:	89 c7                	mov    %eax,%edi
  8038c3:	48 b8 f0 24 80 00 00 	movabs $0x8024f0,%rax
  8038ca:	00 00 00 
  8038cd:	ff d0                	callq  *%rax
  8038cf:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8038d2:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8038d6:	79 08                	jns    8038e0 <map_segment+0x14e>
  8038d8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8038db:	e9 9c 00 00 00       	jmpq   80397c <map_segment+0x1ea>
  8038e0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038e3:	48 63 d0             	movslq %eax,%rdx
  8038e6:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8038ea:	48 01 d0             	add    %rdx,%rax
  8038ed:	48 89 c2             	mov    %rax,%rdx
  8038f0:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8038f3:	44 8b 45 10          	mov    0x10(%rbp),%r8d
  8038f7:	48 89 d1             	mov    %rdx,%rcx
  8038fa:	89 c2                	mov    %eax,%edx
  8038fc:	be 00 00 40 00       	mov    $0x400000,%esi
  803901:	bf 00 00 00 00       	mov    $0x0,%edi
  803906:	48 b8 75 1a 80 00 00 	movabs $0x801a75,%rax
  80390d:	00 00 00 
  803910:	ff d0                	callq  *%rax
  803912:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803915:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803919:	79 30                	jns    80394b <map_segment+0x1b9>
  80391b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80391e:	89 c1                	mov    %eax,%ecx
  803920:	48 ba 73 55 80 00 00 	movabs $0x805573,%rdx
  803927:	00 00 00 
  80392a:	be 29 01 00 00       	mov    $0x129,%esi
  80392f:	48 bf f8 54 80 00 00 	movabs $0x8054f8,%rdi
  803936:	00 00 00 
  803939:	b8 00 00 00 00       	mov    $0x0,%eax
  80393e:	49 b8 08 03 80 00 00 	movabs $0x800308,%r8
  803945:	00 00 00 
  803948:	41 ff d0             	callq  *%r8
  80394b:	be 00 00 40 00       	mov    $0x400000,%esi
  803950:	bf 00 00 00 00       	mov    $0x0,%edi
  803955:	48 b8 d0 1a 80 00 00 	movabs $0x801ad0,%rax
  80395c:	00 00 00 
  80395f:	ff d0                	callq  *%rax
  803961:	81 45 fc 00 10 00 00 	addl   $0x1000,-0x4(%rbp)
  803968:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80396b:	48 98                	cltq   
  80396d:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803971:	0f 82 78 fe ff ff    	jb     8037ef <map_segment+0x5d>
  803977:	b8 00 00 00 00       	mov    $0x0,%eax
  80397c:	c9                   	leaveq 
  80397d:	c3                   	retq   

000000000080397e <copy_shared_pages>:
  80397e:	55                   	push   %rbp
  80397f:	48 89 e5             	mov    %rsp,%rbp
  803982:	48 83 ec 30          	sub    $0x30,%rsp
  803986:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803989:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803990:	00 
  803991:	e9 eb 00 00 00       	jmpq   803a81 <copy_shared_pages+0x103>
  803996:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80399a:	48 c1 f8 12          	sar    $0x12,%rax
  80399e:	48 89 c2             	mov    %rax,%rdx
  8039a1:	48 b8 00 00 40 80 00 	movabs $0x10080400000,%rax
  8039a8:	01 00 00 
  8039ab:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8039af:	83 e0 01             	and    $0x1,%eax
  8039b2:	48 85 c0             	test   %rax,%rax
  8039b5:	74 21                	je     8039d8 <copy_shared_pages+0x5a>
  8039b7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8039bb:	48 c1 f8 09          	sar    $0x9,%rax
  8039bf:	48 89 c2             	mov    %rax,%rdx
  8039c2:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8039c9:	01 00 00 
  8039cc:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8039d0:	83 e0 01             	and    $0x1,%eax
  8039d3:	48 85 c0             	test   %rax,%rax
  8039d6:	75 0d                	jne    8039e5 <copy_shared_pages+0x67>
  8039d8:	48 81 45 f8 00 02 00 	addq   $0x200,-0x8(%rbp)
  8039df:	00 
  8039e0:	e9 9c 00 00 00       	jmpq   803a81 <copy_shared_pages+0x103>
  8039e5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8039e9:	48 05 00 02 00 00    	add    $0x200,%rax
  8039ef:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8039f3:	eb 7e                	jmp    803a73 <copy_shared_pages+0xf5>
  8039f5:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8039fc:	01 00 00 
  8039ff:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  803a03:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803a07:	25 01 04 00 00       	and    $0x401,%eax
  803a0c:	48 3d 01 04 00 00    	cmp    $0x401,%rax
  803a12:	75 5a                	jne    803a6e <copy_shared_pages+0xf0>
  803a14:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803a18:	48 c1 e0 0c          	shl    $0xc,%rax
  803a1c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803a20:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  803a27:	01 00 00 
  803a2a:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  803a2e:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803a32:	25 07 0e 00 00       	and    $0xe07,%eax
  803a37:	89 c6                	mov    %eax,%esi
  803a39:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  803a3d:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803a40:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803a44:	41 89 f0             	mov    %esi,%r8d
  803a47:	48 89 c6             	mov    %rax,%rsi
  803a4a:	bf 00 00 00 00       	mov    $0x0,%edi
  803a4f:	48 b8 75 1a 80 00 00 	movabs $0x801a75,%rax
  803a56:	00 00 00 
  803a59:	ff d0                	callq  *%rax
  803a5b:	48 98                	cltq   
  803a5d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803a61:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  803a66:	79 06                	jns    803a6e <copy_shared_pages+0xf0>
  803a68:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803a6c:	eb 28                	jmp    803a96 <copy_shared_pages+0x118>
  803a6e:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803a73:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803a77:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  803a7b:	0f 8c 74 ff ff ff    	jl     8039f5 <copy_shared_pages+0x77>
  803a81:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803a85:	48 3d ff 07 00 08    	cmp    $0x80007ff,%rax
  803a8b:	0f 86 05 ff ff ff    	jbe    803996 <copy_shared_pages+0x18>
  803a91:	b8 00 00 00 00       	mov    $0x0,%eax
  803a96:	c9                   	leaveq 
  803a97:	c3                   	retq   

0000000000803a98 <fd2sockid>:
  803a98:	55                   	push   %rbp
  803a99:	48 89 e5             	mov    %rsp,%rbp
  803a9c:	48 83 ec 20          	sub    $0x20,%rsp
  803aa0:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803aa3:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803aa7:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803aaa:	48 89 d6             	mov    %rdx,%rsi
  803aad:	89 c7                	mov    %eax,%edi
  803aaf:	48 b8 e9 1f 80 00 00 	movabs $0x801fe9,%rax
  803ab6:	00 00 00 
  803ab9:	ff d0                	callq  *%rax
  803abb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803abe:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803ac2:	79 05                	jns    803ac9 <fd2sockid+0x31>
  803ac4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ac7:	eb 24                	jmp    803aed <fd2sockid+0x55>
  803ac9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803acd:	8b 10                	mov    (%rax),%edx
  803acf:	48 b8 a0 70 80 00 00 	movabs $0x8070a0,%rax
  803ad6:	00 00 00 
  803ad9:	8b 00                	mov    (%rax),%eax
  803adb:	39 c2                	cmp    %eax,%edx
  803add:	74 07                	je     803ae6 <fd2sockid+0x4e>
  803adf:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803ae4:	eb 07                	jmp    803aed <fd2sockid+0x55>
  803ae6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803aea:	8b 40 0c             	mov    0xc(%rax),%eax
  803aed:	c9                   	leaveq 
  803aee:	c3                   	retq   

0000000000803aef <alloc_sockfd>:
  803aef:	55                   	push   %rbp
  803af0:	48 89 e5             	mov    %rsp,%rbp
  803af3:	48 83 ec 20          	sub    $0x20,%rsp
  803af7:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803afa:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803afe:	48 89 c7             	mov    %rax,%rdi
  803b01:	48 b8 51 1f 80 00 00 	movabs $0x801f51,%rax
  803b08:	00 00 00 
  803b0b:	ff d0                	callq  *%rax
  803b0d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803b10:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803b14:	78 26                	js     803b3c <alloc_sockfd+0x4d>
  803b16:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b1a:	ba 07 04 00 00       	mov    $0x407,%edx
  803b1f:	48 89 c6             	mov    %rax,%rsi
  803b22:	bf 00 00 00 00       	mov    $0x0,%edi
  803b27:	48 b8 25 1a 80 00 00 	movabs $0x801a25,%rax
  803b2e:	00 00 00 
  803b31:	ff d0                	callq  *%rax
  803b33:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803b36:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803b3a:	79 16                	jns    803b52 <alloc_sockfd+0x63>
  803b3c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803b3f:	89 c7                	mov    %eax,%edi
  803b41:	48 b8 fc 3f 80 00 00 	movabs $0x803ffc,%rax
  803b48:	00 00 00 
  803b4b:	ff d0                	callq  *%rax
  803b4d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b50:	eb 3a                	jmp    803b8c <alloc_sockfd+0x9d>
  803b52:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b56:	48 ba a0 70 80 00 00 	movabs $0x8070a0,%rdx
  803b5d:	00 00 00 
  803b60:	8b 12                	mov    (%rdx),%edx
  803b62:	89 10                	mov    %edx,(%rax)
  803b64:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b68:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  803b6f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b73:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803b76:	89 50 0c             	mov    %edx,0xc(%rax)
  803b79:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b7d:	48 89 c7             	mov    %rax,%rdi
  803b80:	48 b8 03 1f 80 00 00 	movabs $0x801f03,%rax
  803b87:	00 00 00 
  803b8a:	ff d0                	callq  *%rax
  803b8c:	c9                   	leaveq 
  803b8d:	c3                   	retq   

0000000000803b8e <accept>:
  803b8e:	55                   	push   %rbp
  803b8f:	48 89 e5             	mov    %rsp,%rbp
  803b92:	48 83 ec 30          	sub    $0x30,%rsp
  803b96:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803b99:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803b9d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803ba1:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803ba4:	89 c7                	mov    %eax,%edi
  803ba6:	48 b8 98 3a 80 00 00 	movabs $0x803a98,%rax
  803bad:	00 00 00 
  803bb0:	ff d0                	callq  *%rax
  803bb2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803bb5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803bb9:	79 05                	jns    803bc0 <accept+0x32>
  803bbb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803bbe:	eb 3b                	jmp    803bfb <accept+0x6d>
  803bc0:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803bc4:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803bc8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803bcb:	48 89 ce             	mov    %rcx,%rsi
  803bce:	89 c7                	mov    %eax,%edi
  803bd0:	48 b8 d9 3e 80 00 00 	movabs $0x803ed9,%rax
  803bd7:	00 00 00 
  803bda:	ff d0                	callq  *%rax
  803bdc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803bdf:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803be3:	79 05                	jns    803bea <accept+0x5c>
  803be5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803be8:	eb 11                	jmp    803bfb <accept+0x6d>
  803bea:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803bed:	89 c7                	mov    %eax,%edi
  803bef:	48 b8 ef 3a 80 00 00 	movabs $0x803aef,%rax
  803bf6:	00 00 00 
  803bf9:	ff d0                	callq  *%rax
  803bfb:	c9                   	leaveq 
  803bfc:	c3                   	retq   

0000000000803bfd <bind>:
  803bfd:	55                   	push   %rbp
  803bfe:	48 89 e5             	mov    %rsp,%rbp
  803c01:	48 83 ec 20          	sub    $0x20,%rsp
  803c05:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803c08:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803c0c:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803c0f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803c12:	89 c7                	mov    %eax,%edi
  803c14:	48 b8 98 3a 80 00 00 	movabs $0x803a98,%rax
  803c1b:	00 00 00 
  803c1e:	ff d0                	callq  *%rax
  803c20:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803c23:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803c27:	79 05                	jns    803c2e <bind+0x31>
  803c29:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c2c:	eb 1b                	jmp    803c49 <bind+0x4c>
  803c2e:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803c31:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803c35:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c38:	48 89 ce             	mov    %rcx,%rsi
  803c3b:	89 c7                	mov    %eax,%edi
  803c3d:	48 b8 58 3f 80 00 00 	movabs $0x803f58,%rax
  803c44:	00 00 00 
  803c47:	ff d0                	callq  *%rax
  803c49:	c9                   	leaveq 
  803c4a:	c3                   	retq   

0000000000803c4b <shutdown>:
  803c4b:	55                   	push   %rbp
  803c4c:	48 89 e5             	mov    %rsp,%rbp
  803c4f:	48 83 ec 20          	sub    $0x20,%rsp
  803c53:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803c56:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803c59:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803c5c:	89 c7                	mov    %eax,%edi
  803c5e:	48 b8 98 3a 80 00 00 	movabs $0x803a98,%rax
  803c65:	00 00 00 
  803c68:	ff d0                	callq  *%rax
  803c6a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803c6d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803c71:	79 05                	jns    803c78 <shutdown+0x2d>
  803c73:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c76:	eb 16                	jmp    803c8e <shutdown+0x43>
  803c78:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803c7b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c7e:	89 d6                	mov    %edx,%esi
  803c80:	89 c7                	mov    %eax,%edi
  803c82:	48 b8 bc 3f 80 00 00 	movabs $0x803fbc,%rax
  803c89:	00 00 00 
  803c8c:	ff d0                	callq  *%rax
  803c8e:	c9                   	leaveq 
  803c8f:	c3                   	retq   

0000000000803c90 <devsock_close>:
  803c90:	55                   	push   %rbp
  803c91:	48 89 e5             	mov    %rsp,%rbp
  803c94:	48 83 ec 10          	sub    $0x10,%rsp
  803c98:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803c9c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803ca0:	48 89 c7             	mov    %rax,%rdi
  803ca3:	48 b8 e9 4c 80 00 00 	movabs $0x804ce9,%rax
  803caa:	00 00 00 
  803cad:	ff d0                	callq  *%rax
  803caf:	83 f8 01             	cmp    $0x1,%eax
  803cb2:	75 17                	jne    803ccb <devsock_close+0x3b>
  803cb4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803cb8:	8b 40 0c             	mov    0xc(%rax),%eax
  803cbb:	89 c7                	mov    %eax,%edi
  803cbd:	48 b8 fc 3f 80 00 00 	movabs $0x803ffc,%rax
  803cc4:	00 00 00 
  803cc7:	ff d0                	callq  *%rax
  803cc9:	eb 05                	jmp    803cd0 <devsock_close+0x40>
  803ccb:	b8 00 00 00 00       	mov    $0x0,%eax
  803cd0:	c9                   	leaveq 
  803cd1:	c3                   	retq   

0000000000803cd2 <connect>:
  803cd2:	55                   	push   %rbp
  803cd3:	48 89 e5             	mov    %rsp,%rbp
  803cd6:	48 83 ec 20          	sub    $0x20,%rsp
  803cda:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803cdd:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803ce1:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803ce4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803ce7:	89 c7                	mov    %eax,%edi
  803ce9:	48 b8 98 3a 80 00 00 	movabs $0x803a98,%rax
  803cf0:	00 00 00 
  803cf3:	ff d0                	callq  *%rax
  803cf5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803cf8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803cfc:	79 05                	jns    803d03 <connect+0x31>
  803cfe:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d01:	eb 1b                	jmp    803d1e <connect+0x4c>
  803d03:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803d06:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803d0a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d0d:	48 89 ce             	mov    %rcx,%rsi
  803d10:	89 c7                	mov    %eax,%edi
  803d12:	48 b8 29 40 80 00 00 	movabs $0x804029,%rax
  803d19:	00 00 00 
  803d1c:	ff d0                	callq  *%rax
  803d1e:	c9                   	leaveq 
  803d1f:	c3                   	retq   

0000000000803d20 <listen>:
  803d20:	55                   	push   %rbp
  803d21:	48 89 e5             	mov    %rsp,%rbp
  803d24:	48 83 ec 20          	sub    $0x20,%rsp
  803d28:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803d2b:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803d2e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803d31:	89 c7                	mov    %eax,%edi
  803d33:	48 b8 98 3a 80 00 00 	movabs $0x803a98,%rax
  803d3a:	00 00 00 
  803d3d:	ff d0                	callq  *%rax
  803d3f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803d42:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803d46:	79 05                	jns    803d4d <listen+0x2d>
  803d48:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d4b:	eb 16                	jmp    803d63 <listen+0x43>
  803d4d:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803d50:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d53:	89 d6                	mov    %edx,%esi
  803d55:	89 c7                	mov    %eax,%edi
  803d57:	48 b8 8d 40 80 00 00 	movabs $0x80408d,%rax
  803d5e:	00 00 00 
  803d61:	ff d0                	callq  *%rax
  803d63:	c9                   	leaveq 
  803d64:	c3                   	retq   

0000000000803d65 <devsock_read>:
  803d65:	55                   	push   %rbp
  803d66:	48 89 e5             	mov    %rsp,%rbp
  803d69:	48 83 ec 20          	sub    $0x20,%rsp
  803d6d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803d71:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803d75:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803d79:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803d7d:	89 c2                	mov    %eax,%edx
  803d7f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803d83:	8b 40 0c             	mov    0xc(%rax),%eax
  803d86:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803d8a:	b9 00 00 00 00       	mov    $0x0,%ecx
  803d8f:	89 c7                	mov    %eax,%edi
  803d91:	48 b8 cd 40 80 00 00 	movabs $0x8040cd,%rax
  803d98:	00 00 00 
  803d9b:	ff d0                	callq  *%rax
  803d9d:	c9                   	leaveq 
  803d9e:	c3                   	retq   

0000000000803d9f <devsock_write>:
  803d9f:	55                   	push   %rbp
  803da0:	48 89 e5             	mov    %rsp,%rbp
  803da3:	48 83 ec 20          	sub    $0x20,%rsp
  803da7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803dab:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803daf:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803db3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803db7:	89 c2                	mov    %eax,%edx
  803db9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803dbd:	8b 40 0c             	mov    0xc(%rax),%eax
  803dc0:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803dc4:	b9 00 00 00 00       	mov    $0x0,%ecx
  803dc9:	89 c7                	mov    %eax,%edi
  803dcb:	48 b8 99 41 80 00 00 	movabs $0x804199,%rax
  803dd2:	00 00 00 
  803dd5:	ff d0                	callq  *%rax
  803dd7:	c9                   	leaveq 
  803dd8:	c3                   	retq   

0000000000803dd9 <devsock_stat>:
  803dd9:	55                   	push   %rbp
  803dda:	48 89 e5             	mov    %rsp,%rbp
  803ddd:	48 83 ec 10          	sub    $0x10,%rsp
  803de1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803de5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803de9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ded:	48 be 95 55 80 00 00 	movabs $0x805595,%rsi
  803df4:	00 00 00 
  803df7:	48 89 c7             	mov    %rax,%rdi
  803dfa:	48 b8 f6 10 80 00 00 	movabs $0x8010f6,%rax
  803e01:	00 00 00 
  803e04:	ff d0                	callq  *%rax
  803e06:	b8 00 00 00 00       	mov    $0x0,%eax
  803e0b:	c9                   	leaveq 
  803e0c:	c3                   	retq   

0000000000803e0d <socket>:
  803e0d:	55                   	push   %rbp
  803e0e:	48 89 e5             	mov    %rsp,%rbp
  803e11:	48 83 ec 20          	sub    $0x20,%rsp
  803e15:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803e18:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803e1b:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  803e1e:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803e21:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803e24:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803e27:	89 ce                	mov    %ecx,%esi
  803e29:	89 c7                	mov    %eax,%edi
  803e2b:	48 b8 51 42 80 00 00 	movabs $0x804251,%rax
  803e32:	00 00 00 
  803e35:	ff d0                	callq  *%rax
  803e37:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803e3a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803e3e:	79 05                	jns    803e45 <socket+0x38>
  803e40:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e43:	eb 11                	jmp    803e56 <socket+0x49>
  803e45:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e48:	89 c7                	mov    %eax,%edi
  803e4a:	48 b8 ef 3a 80 00 00 	movabs $0x803aef,%rax
  803e51:	00 00 00 
  803e54:	ff d0                	callq  *%rax
  803e56:	c9                   	leaveq 
  803e57:	c3                   	retq   

0000000000803e58 <nsipc>:
  803e58:	55                   	push   %rbp
  803e59:	48 89 e5             	mov    %rsp,%rbp
  803e5c:	48 83 ec 10          	sub    $0x10,%rsp
  803e60:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803e63:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803e6a:	00 00 00 
  803e6d:	8b 00                	mov    (%rax),%eax
  803e6f:	85 c0                	test   %eax,%eax
  803e71:	75 1d                	jne    803e90 <nsipc+0x38>
  803e73:	bf 02 00 00 00       	mov    $0x2,%edi
  803e78:	48 b8 77 4c 80 00 00 	movabs $0x804c77,%rax
  803e7f:	00 00 00 
  803e82:	ff d0                	callq  *%rax
  803e84:	48 ba 04 80 80 00 00 	movabs $0x808004,%rdx
  803e8b:	00 00 00 
  803e8e:	89 02                	mov    %eax,(%rdx)
  803e90:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803e97:	00 00 00 
  803e9a:	8b 00                	mov    (%rax),%eax
  803e9c:	8b 75 fc             	mov    -0x4(%rbp),%esi
  803e9f:	b9 07 00 00 00       	mov    $0x7,%ecx
  803ea4:	48 ba 00 b0 80 00 00 	movabs $0x80b000,%rdx
  803eab:	00 00 00 
  803eae:	89 c7                	mov    %eax,%edi
  803eb0:	48 b8 e1 4b 80 00 00 	movabs $0x804be1,%rax
  803eb7:	00 00 00 
  803eba:	ff d0                	callq  *%rax
  803ebc:	ba 00 00 00 00       	mov    $0x0,%edx
  803ec1:	be 00 00 00 00       	mov    $0x0,%esi
  803ec6:	bf 00 00 00 00       	mov    $0x0,%edi
  803ecb:	48 b8 20 4b 80 00 00 	movabs $0x804b20,%rax
  803ed2:	00 00 00 
  803ed5:	ff d0                	callq  *%rax
  803ed7:	c9                   	leaveq 
  803ed8:	c3                   	retq   

0000000000803ed9 <nsipc_accept>:
  803ed9:	55                   	push   %rbp
  803eda:	48 89 e5             	mov    %rsp,%rbp
  803edd:	48 83 ec 30          	sub    $0x30,%rsp
  803ee1:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803ee4:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803ee8:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803eec:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803ef3:	00 00 00 
  803ef6:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803ef9:	89 10                	mov    %edx,(%rax)
  803efb:	bf 01 00 00 00       	mov    $0x1,%edi
  803f00:	48 b8 58 3e 80 00 00 	movabs $0x803e58,%rax
  803f07:	00 00 00 
  803f0a:	ff d0                	callq  *%rax
  803f0c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803f0f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803f13:	78 3e                	js     803f53 <nsipc_accept+0x7a>
  803f15:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803f1c:	00 00 00 
  803f1f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803f23:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f27:	8b 40 10             	mov    0x10(%rax),%eax
  803f2a:	89 c2                	mov    %eax,%edx
  803f2c:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  803f30:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803f34:	48 89 ce             	mov    %rcx,%rsi
  803f37:	48 89 c7             	mov    %rax,%rdi
  803f3a:	48 b8 1a 14 80 00 00 	movabs $0x80141a,%rax
  803f41:	00 00 00 
  803f44:	ff d0                	callq  *%rax
  803f46:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f4a:	8b 50 10             	mov    0x10(%rax),%edx
  803f4d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803f51:	89 10                	mov    %edx,(%rax)
  803f53:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f56:	c9                   	leaveq 
  803f57:	c3                   	retq   

0000000000803f58 <nsipc_bind>:
  803f58:	55                   	push   %rbp
  803f59:	48 89 e5             	mov    %rsp,%rbp
  803f5c:	48 83 ec 10          	sub    $0x10,%rsp
  803f60:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803f63:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803f67:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803f6a:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803f71:	00 00 00 
  803f74:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803f77:	89 10                	mov    %edx,(%rax)
  803f79:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803f7c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f80:	48 89 c6             	mov    %rax,%rsi
  803f83:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803f8a:	00 00 00 
  803f8d:	48 b8 1a 14 80 00 00 	movabs $0x80141a,%rax
  803f94:	00 00 00 
  803f97:	ff d0                	callq  *%rax
  803f99:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803fa0:	00 00 00 
  803fa3:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803fa6:	89 50 14             	mov    %edx,0x14(%rax)
  803fa9:	bf 02 00 00 00       	mov    $0x2,%edi
  803fae:	48 b8 58 3e 80 00 00 	movabs $0x803e58,%rax
  803fb5:	00 00 00 
  803fb8:	ff d0                	callq  *%rax
  803fba:	c9                   	leaveq 
  803fbb:	c3                   	retq   

0000000000803fbc <nsipc_shutdown>:
  803fbc:	55                   	push   %rbp
  803fbd:	48 89 e5             	mov    %rsp,%rbp
  803fc0:	48 83 ec 10          	sub    $0x10,%rsp
  803fc4:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803fc7:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803fca:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803fd1:	00 00 00 
  803fd4:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803fd7:	89 10                	mov    %edx,(%rax)
  803fd9:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803fe0:	00 00 00 
  803fe3:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803fe6:	89 50 04             	mov    %edx,0x4(%rax)
  803fe9:	bf 03 00 00 00       	mov    $0x3,%edi
  803fee:	48 b8 58 3e 80 00 00 	movabs $0x803e58,%rax
  803ff5:	00 00 00 
  803ff8:	ff d0                	callq  *%rax
  803ffa:	c9                   	leaveq 
  803ffb:	c3                   	retq   

0000000000803ffc <nsipc_close>:
  803ffc:	55                   	push   %rbp
  803ffd:	48 89 e5             	mov    %rsp,%rbp
  804000:	48 83 ec 10          	sub    $0x10,%rsp
  804004:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804007:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80400e:	00 00 00 
  804011:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804014:	89 10                	mov    %edx,(%rax)
  804016:	bf 04 00 00 00       	mov    $0x4,%edi
  80401b:	48 b8 58 3e 80 00 00 	movabs $0x803e58,%rax
  804022:	00 00 00 
  804025:	ff d0                	callq  *%rax
  804027:	c9                   	leaveq 
  804028:	c3                   	retq   

0000000000804029 <nsipc_connect>:
  804029:	55                   	push   %rbp
  80402a:	48 89 e5             	mov    %rsp,%rbp
  80402d:	48 83 ec 10          	sub    $0x10,%rsp
  804031:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804034:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804038:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80403b:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804042:	00 00 00 
  804045:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804048:	89 10                	mov    %edx,(%rax)
  80404a:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80404d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804051:	48 89 c6             	mov    %rax,%rsi
  804054:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  80405b:	00 00 00 
  80405e:	48 b8 1a 14 80 00 00 	movabs $0x80141a,%rax
  804065:	00 00 00 
  804068:	ff d0                	callq  *%rax
  80406a:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804071:	00 00 00 
  804074:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804077:	89 50 14             	mov    %edx,0x14(%rax)
  80407a:	bf 05 00 00 00       	mov    $0x5,%edi
  80407f:	48 b8 58 3e 80 00 00 	movabs $0x803e58,%rax
  804086:	00 00 00 
  804089:	ff d0                	callq  *%rax
  80408b:	c9                   	leaveq 
  80408c:	c3                   	retq   

000000000080408d <nsipc_listen>:
  80408d:	55                   	push   %rbp
  80408e:	48 89 e5             	mov    %rsp,%rbp
  804091:	48 83 ec 10          	sub    $0x10,%rsp
  804095:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804098:	89 75 f8             	mov    %esi,-0x8(%rbp)
  80409b:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8040a2:	00 00 00 
  8040a5:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8040a8:	89 10                	mov    %edx,(%rax)
  8040aa:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8040b1:	00 00 00 
  8040b4:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8040b7:	89 50 04             	mov    %edx,0x4(%rax)
  8040ba:	bf 06 00 00 00       	mov    $0x6,%edi
  8040bf:	48 b8 58 3e 80 00 00 	movabs $0x803e58,%rax
  8040c6:	00 00 00 
  8040c9:	ff d0                	callq  *%rax
  8040cb:	c9                   	leaveq 
  8040cc:	c3                   	retq   

00000000008040cd <nsipc_recv>:
  8040cd:	55                   	push   %rbp
  8040ce:	48 89 e5             	mov    %rsp,%rbp
  8040d1:	48 83 ec 30          	sub    $0x30,%rsp
  8040d5:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8040d8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8040dc:	89 55 e8             	mov    %edx,-0x18(%rbp)
  8040df:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  8040e2:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8040e9:	00 00 00 
  8040ec:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8040ef:	89 10                	mov    %edx,(%rax)
  8040f1:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8040f8:	00 00 00 
  8040fb:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8040fe:	89 50 04             	mov    %edx,0x4(%rax)
  804101:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804108:	00 00 00 
  80410b:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80410e:	89 50 08             	mov    %edx,0x8(%rax)
  804111:	bf 07 00 00 00       	mov    $0x7,%edi
  804116:	48 b8 58 3e 80 00 00 	movabs $0x803e58,%rax
  80411d:	00 00 00 
  804120:	ff d0                	callq  *%rax
  804122:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804125:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804129:	78 69                	js     804194 <nsipc_recv+0xc7>
  80412b:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  804132:	7f 08                	jg     80413c <nsipc_recv+0x6f>
  804134:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804137:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  80413a:	7e 35                	jle    804171 <nsipc_recv+0xa4>
  80413c:	48 b9 9c 55 80 00 00 	movabs $0x80559c,%rcx
  804143:	00 00 00 
  804146:	48 ba b1 55 80 00 00 	movabs $0x8055b1,%rdx
  80414d:	00 00 00 
  804150:	be 62 00 00 00       	mov    $0x62,%esi
  804155:	48 bf c6 55 80 00 00 	movabs $0x8055c6,%rdi
  80415c:	00 00 00 
  80415f:	b8 00 00 00 00       	mov    $0x0,%eax
  804164:	49 b8 08 03 80 00 00 	movabs $0x800308,%r8
  80416b:	00 00 00 
  80416e:	41 ff d0             	callq  *%r8
  804171:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804174:	48 63 d0             	movslq %eax,%rdx
  804177:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80417b:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  804182:	00 00 00 
  804185:	48 89 c7             	mov    %rax,%rdi
  804188:	48 b8 1a 14 80 00 00 	movabs $0x80141a,%rax
  80418f:	00 00 00 
  804192:	ff d0                	callq  *%rax
  804194:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804197:	c9                   	leaveq 
  804198:	c3                   	retq   

0000000000804199 <nsipc_send>:
  804199:	55                   	push   %rbp
  80419a:	48 89 e5             	mov    %rsp,%rbp
  80419d:	48 83 ec 20          	sub    $0x20,%rsp
  8041a1:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8041a4:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8041a8:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8041ab:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  8041ae:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8041b5:	00 00 00 
  8041b8:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8041bb:	89 10                	mov    %edx,(%rax)
  8041bd:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  8041c4:	7e 35                	jle    8041fb <nsipc_send+0x62>
  8041c6:	48 b9 d5 55 80 00 00 	movabs $0x8055d5,%rcx
  8041cd:	00 00 00 
  8041d0:	48 ba b1 55 80 00 00 	movabs $0x8055b1,%rdx
  8041d7:	00 00 00 
  8041da:	be 6d 00 00 00       	mov    $0x6d,%esi
  8041df:	48 bf c6 55 80 00 00 	movabs $0x8055c6,%rdi
  8041e6:	00 00 00 
  8041e9:	b8 00 00 00 00       	mov    $0x0,%eax
  8041ee:	49 b8 08 03 80 00 00 	movabs $0x800308,%r8
  8041f5:	00 00 00 
  8041f8:	41 ff d0             	callq  *%r8
  8041fb:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8041fe:	48 63 d0             	movslq %eax,%rdx
  804201:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804205:	48 89 c6             	mov    %rax,%rsi
  804208:	48 bf 0c b0 80 00 00 	movabs $0x80b00c,%rdi
  80420f:	00 00 00 
  804212:	48 b8 1a 14 80 00 00 	movabs $0x80141a,%rax
  804219:	00 00 00 
  80421c:	ff d0                	callq  *%rax
  80421e:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804225:	00 00 00 
  804228:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80422b:	89 50 04             	mov    %edx,0x4(%rax)
  80422e:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804235:	00 00 00 
  804238:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80423b:	89 50 08             	mov    %edx,0x8(%rax)
  80423e:	bf 08 00 00 00       	mov    $0x8,%edi
  804243:	48 b8 58 3e 80 00 00 	movabs $0x803e58,%rax
  80424a:	00 00 00 
  80424d:	ff d0                	callq  *%rax
  80424f:	c9                   	leaveq 
  804250:	c3                   	retq   

0000000000804251 <nsipc_socket>:
  804251:	55                   	push   %rbp
  804252:	48 89 e5             	mov    %rsp,%rbp
  804255:	48 83 ec 10          	sub    $0x10,%rsp
  804259:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80425c:	89 75 f8             	mov    %esi,-0x8(%rbp)
  80425f:	89 55 f4             	mov    %edx,-0xc(%rbp)
  804262:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804269:	00 00 00 
  80426c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80426f:	89 10                	mov    %edx,(%rax)
  804271:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804278:	00 00 00 
  80427b:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80427e:	89 50 04             	mov    %edx,0x4(%rax)
  804281:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804288:	00 00 00 
  80428b:	8b 55 f4             	mov    -0xc(%rbp),%edx
  80428e:	89 50 08             	mov    %edx,0x8(%rax)
  804291:	bf 09 00 00 00       	mov    $0x9,%edi
  804296:	48 b8 58 3e 80 00 00 	movabs $0x803e58,%rax
  80429d:	00 00 00 
  8042a0:	ff d0                	callq  *%rax
  8042a2:	c9                   	leaveq 
  8042a3:	c3                   	retq   

00000000008042a4 <pipe>:
  8042a4:	55                   	push   %rbp
  8042a5:	48 89 e5             	mov    %rsp,%rbp
  8042a8:	53                   	push   %rbx
  8042a9:	48 83 ec 38          	sub    $0x38,%rsp
  8042ad:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  8042b1:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  8042b5:	48 89 c7             	mov    %rax,%rdi
  8042b8:	48 b8 51 1f 80 00 00 	movabs $0x801f51,%rax
  8042bf:	00 00 00 
  8042c2:	ff d0                	callq  *%rax
  8042c4:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8042c7:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8042cb:	0f 88 bf 01 00 00    	js     804490 <pipe+0x1ec>
  8042d1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8042d5:	ba 07 04 00 00       	mov    $0x407,%edx
  8042da:	48 89 c6             	mov    %rax,%rsi
  8042dd:	bf 00 00 00 00       	mov    $0x0,%edi
  8042e2:	48 b8 25 1a 80 00 00 	movabs $0x801a25,%rax
  8042e9:	00 00 00 
  8042ec:	ff d0                	callq  *%rax
  8042ee:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8042f1:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8042f5:	0f 88 95 01 00 00    	js     804490 <pipe+0x1ec>
  8042fb:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  8042ff:	48 89 c7             	mov    %rax,%rdi
  804302:	48 b8 51 1f 80 00 00 	movabs $0x801f51,%rax
  804309:	00 00 00 
  80430c:	ff d0                	callq  *%rax
  80430e:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804311:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804315:	0f 88 5d 01 00 00    	js     804478 <pipe+0x1d4>
  80431b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80431f:	ba 07 04 00 00       	mov    $0x407,%edx
  804324:	48 89 c6             	mov    %rax,%rsi
  804327:	bf 00 00 00 00       	mov    $0x0,%edi
  80432c:	48 b8 25 1a 80 00 00 	movabs $0x801a25,%rax
  804333:	00 00 00 
  804336:	ff d0                	callq  *%rax
  804338:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80433b:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80433f:	0f 88 33 01 00 00    	js     804478 <pipe+0x1d4>
  804345:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804349:	48 89 c7             	mov    %rax,%rdi
  80434c:	48 b8 26 1f 80 00 00 	movabs $0x801f26,%rax
  804353:	00 00 00 
  804356:	ff d0                	callq  *%rax
  804358:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80435c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804360:	ba 07 04 00 00       	mov    $0x407,%edx
  804365:	48 89 c6             	mov    %rax,%rsi
  804368:	bf 00 00 00 00       	mov    $0x0,%edi
  80436d:	48 b8 25 1a 80 00 00 	movabs $0x801a25,%rax
  804374:	00 00 00 
  804377:	ff d0                	callq  *%rax
  804379:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80437c:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804380:	79 05                	jns    804387 <pipe+0xe3>
  804382:	e9 d9 00 00 00       	jmpq   804460 <pipe+0x1bc>
  804387:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80438b:	48 89 c7             	mov    %rax,%rdi
  80438e:	48 b8 26 1f 80 00 00 	movabs $0x801f26,%rax
  804395:	00 00 00 
  804398:	ff d0                	callq  *%rax
  80439a:	48 89 c2             	mov    %rax,%rdx
  80439d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8043a1:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  8043a7:	48 89 d1             	mov    %rdx,%rcx
  8043aa:	ba 00 00 00 00       	mov    $0x0,%edx
  8043af:	48 89 c6             	mov    %rax,%rsi
  8043b2:	bf 00 00 00 00       	mov    $0x0,%edi
  8043b7:	48 b8 75 1a 80 00 00 	movabs $0x801a75,%rax
  8043be:	00 00 00 
  8043c1:	ff d0                	callq  *%rax
  8043c3:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8043c6:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8043ca:	79 1b                	jns    8043e7 <pipe+0x143>
  8043cc:	90                   	nop
  8043cd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8043d1:	48 89 c6             	mov    %rax,%rsi
  8043d4:	bf 00 00 00 00       	mov    $0x0,%edi
  8043d9:	48 b8 d0 1a 80 00 00 	movabs $0x801ad0,%rax
  8043e0:	00 00 00 
  8043e3:	ff d0                	callq  *%rax
  8043e5:	eb 79                	jmp    804460 <pipe+0x1bc>
  8043e7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8043eb:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  8043f2:	00 00 00 
  8043f5:	8b 12                	mov    (%rdx),%edx
  8043f7:	89 10                	mov    %edx,(%rax)
  8043f9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8043fd:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  804404:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804408:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  80440f:	00 00 00 
  804412:	8b 12                	mov    (%rdx),%edx
  804414:	89 10                	mov    %edx,(%rax)
  804416:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80441a:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  804421:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804425:	48 89 c7             	mov    %rax,%rdi
  804428:	48 b8 03 1f 80 00 00 	movabs $0x801f03,%rax
  80442f:	00 00 00 
  804432:	ff d0                	callq  *%rax
  804434:	89 c2                	mov    %eax,%edx
  804436:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80443a:	89 10                	mov    %edx,(%rax)
  80443c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  804440:	48 8d 58 04          	lea    0x4(%rax),%rbx
  804444:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804448:	48 89 c7             	mov    %rax,%rdi
  80444b:	48 b8 03 1f 80 00 00 	movabs $0x801f03,%rax
  804452:	00 00 00 
  804455:	ff d0                	callq  *%rax
  804457:	89 03                	mov    %eax,(%rbx)
  804459:	b8 00 00 00 00       	mov    $0x0,%eax
  80445e:	eb 33                	jmp    804493 <pipe+0x1ef>
  804460:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804464:	48 89 c6             	mov    %rax,%rsi
  804467:	bf 00 00 00 00       	mov    $0x0,%edi
  80446c:	48 b8 d0 1a 80 00 00 	movabs $0x801ad0,%rax
  804473:	00 00 00 
  804476:	ff d0                	callq  *%rax
  804478:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80447c:	48 89 c6             	mov    %rax,%rsi
  80447f:	bf 00 00 00 00       	mov    $0x0,%edi
  804484:	48 b8 d0 1a 80 00 00 	movabs $0x801ad0,%rax
  80448b:	00 00 00 
  80448e:	ff d0                	callq  *%rax
  804490:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804493:	48 83 c4 38          	add    $0x38,%rsp
  804497:	5b                   	pop    %rbx
  804498:	5d                   	pop    %rbp
  804499:	c3                   	retq   

000000000080449a <_pipeisclosed>:
  80449a:	55                   	push   %rbp
  80449b:	48 89 e5             	mov    %rsp,%rbp
  80449e:	53                   	push   %rbx
  80449f:	48 83 ec 28          	sub    $0x28,%rsp
  8044a3:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8044a7:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8044ab:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8044b2:	00 00 00 
  8044b5:	48 8b 00             	mov    (%rax),%rax
  8044b8:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8044be:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8044c1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8044c5:	48 89 c7             	mov    %rax,%rdi
  8044c8:	48 b8 e9 4c 80 00 00 	movabs $0x804ce9,%rax
  8044cf:	00 00 00 
  8044d2:	ff d0                	callq  *%rax
  8044d4:	89 c3                	mov    %eax,%ebx
  8044d6:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8044da:	48 89 c7             	mov    %rax,%rdi
  8044dd:	48 b8 e9 4c 80 00 00 	movabs $0x804ce9,%rax
  8044e4:	00 00 00 
  8044e7:	ff d0                	callq  *%rax
  8044e9:	39 c3                	cmp    %eax,%ebx
  8044eb:	0f 94 c0             	sete   %al
  8044ee:	0f b6 c0             	movzbl %al,%eax
  8044f1:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8044f4:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8044fb:	00 00 00 
  8044fe:	48 8b 00             	mov    (%rax),%rax
  804501:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  804507:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  80450a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80450d:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  804510:	75 05                	jne    804517 <_pipeisclosed+0x7d>
  804512:	8b 45 e8             	mov    -0x18(%rbp),%eax
  804515:	eb 4f                	jmp    804566 <_pipeisclosed+0xcc>
  804517:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80451a:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  80451d:	74 42                	je     804561 <_pipeisclosed+0xc7>
  80451f:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  804523:	75 3c                	jne    804561 <_pipeisclosed+0xc7>
  804525:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80452c:	00 00 00 
  80452f:	48 8b 00             	mov    (%rax),%rax
  804532:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  804538:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  80453b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80453e:	89 c6                	mov    %eax,%esi
  804540:	48 bf e6 55 80 00 00 	movabs $0x8055e6,%rdi
  804547:	00 00 00 
  80454a:	b8 00 00 00 00       	mov    $0x0,%eax
  80454f:	49 b8 41 05 80 00 00 	movabs $0x800541,%r8
  804556:	00 00 00 
  804559:	41 ff d0             	callq  *%r8
  80455c:	e9 4a ff ff ff       	jmpq   8044ab <_pipeisclosed+0x11>
  804561:	e9 45 ff ff ff       	jmpq   8044ab <_pipeisclosed+0x11>
  804566:	48 83 c4 28          	add    $0x28,%rsp
  80456a:	5b                   	pop    %rbx
  80456b:	5d                   	pop    %rbp
  80456c:	c3                   	retq   

000000000080456d <pipeisclosed>:
  80456d:	55                   	push   %rbp
  80456e:	48 89 e5             	mov    %rsp,%rbp
  804571:	48 83 ec 30          	sub    $0x30,%rsp
  804575:	89 7d dc             	mov    %edi,-0x24(%rbp)
  804578:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80457c:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80457f:	48 89 d6             	mov    %rdx,%rsi
  804582:	89 c7                	mov    %eax,%edi
  804584:	48 b8 e9 1f 80 00 00 	movabs $0x801fe9,%rax
  80458b:	00 00 00 
  80458e:	ff d0                	callq  *%rax
  804590:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804593:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804597:	79 05                	jns    80459e <pipeisclosed+0x31>
  804599:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80459c:	eb 31                	jmp    8045cf <pipeisclosed+0x62>
  80459e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8045a2:	48 89 c7             	mov    %rax,%rdi
  8045a5:	48 b8 26 1f 80 00 00 	movabs $0x801f26,%rax
  8045ac:	00 00 00 
  8045af:	ff d0                	callq  *%rax
  8045b1:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8045b5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8045b9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8045bd:	48 89 d6             	mov    %rdx,%rsi
  8045c0:	48 89 c7             	mov    %rax,%rdi
  8045c3:	48 b8 9a 44 80 00 00 	movabs $0x80449a,%rax
  8045ca:	00 00 00 
  8045cd:	ff d0                	callq  *%rax
  8045cf:	c9                   	leaveq 
  8045d0:	c3                   	retq   

00000000008045d1 <devpipe_read>:
  8045d1:	55                   	push   %rbp
  8045d2:	48 89 e5             	mov    %rsp,%rbp
  8045d5:	48 83 ec 40          	sub    $0x40,%rsp
  8045d9:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8045dd:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8045e1:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8045e5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8045e9:	48 89 c7             	mov    %rax,%rdi
  8045ec:	48 b8 26 1f 80 00 00 	movabs $0x801f26,%rax
  8045f3:	00 00 00 
  8045f6:	ff d0                	callq  *%rax
  8045f8:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8045fc:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804600:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804604:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80460b:	00 
  80460c:	e9 92 00 00 00       	jmpq   8046a3 <devpipe_read+0xd2>
  804611:	eb 41                	jmp    804654 <devpipe_read+0x83>
  804613:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  804618:	74 09                	je     804623 <devpipe_read+0x52>
  80461a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80461e:	e9 92 00 00 00       	jmpq   8046b5 <devpipe_read+0xe4>
  804623:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804627:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80462b:	48 89 d6             	mov    %rdx,%rsi
  80462e:	48 89 c7             	mov    %rax,%rdi
  804631:	48 b8 9a 44 80 00 00 	movabs $0x80449a,%rax
  804638:	00 00 00 
  80463b:	ff d0                	callq  *%rax
  80463d:	85 c0                	test   %eax,%eax
  80463f:	74 07                	je     804648 <devpipe_read+0x77>
  804641:	b8 00 00 00 00       	mov    $0x0,%eax
  804646:	eb 6d                	jmp    8046b5 <devpipe_read+0xe4>
  804648:	48 b8 e7 19 80 00 00 	movabs $0x8019e7,%rax
  80464f:	00 00 00 
  804652:	ff d0                	callq  *%rax
  804654:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804658:	8b 10                	mov    (%rax),%edx
  80465a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80465e:	8b 40 04             	mov    0x4(%rax),%eax
  804661:	39 c2                	cmp    %eax,%edx
  804663:	74 ae                	je     804613 <devpipe_read+0x42>
  804665:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804669:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80466d:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  804671:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804675:	8b 00                	mov    (%rax),%eax
  804677:	99                   	cltd   
  804678:	c1 ea 1b             	shr    $0x1b,%edx
  80467b:	01 d0                	add    %edx,%eax
  80467d:	83 e0 1f             	and    $0x1f,%eax
  804680:	29 d0                	sub    %edx,%eax
  804682:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804686:	48 98                	cltq   
  804688:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  80468d:	88 01                	mov    %al,(%rcx)
  80468f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804693:	8b 00                	mov    (%rax),%eax
  804695:	8d 50 01             	lea    0x1(%rax),%edx
  804698:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80469c:	89 10                	mov    %edx,(%rax)
  80469e:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8046a3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8046a7:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8046ab:	0f 82 60 ff ff ff    	jb     804611 <devpipe_read+0x40>
  8046b1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8046b5:	c9                   	leaveq 
  8046b6:	c3                   	retq   

00000000008046b7 <devpipe_write>:
  8046b7:	55                   	push   %rbp
  8046b8:	48 89 e5             	mov    %rsp,%rbp
  8046bb:	48 83 ec 40          	sub    $0x40,%rsp
  8046bf:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8046c3:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8046c7:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8046cb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8046cf:	48 89 c7             	mov    %rax,%rdi
  8046d2:	48 b8 26 1f 80 00 00 	movabs $0x801f26,%rax
  8046d9:	00 00 00 
  8046dc:	ff d0                	callq  *%rax
  8046de:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8046e2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8046e6:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8046ea:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8046f1:	00 
  8046f2:	e9 8e 00 00 00       	jmpq   804785 <devpipe_write+0xce>
  8046f7:	eb 31                	jmp    80472a <devpipe_write+0x73>
  8046f9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8046fd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804701:	48 89 d6             	mov    %rdx,%rsi
  804704:	48 89 c7             	mov    %rax,%rdi
  804707:	48 b8 9a 44 80 00 00 	movabs $0x80449a,%rax
  80470e:	00 00 00 
  804711:	ff d0                	callq  *%rax
  804713:	85 c0                	test   %eax,%eax
  804715:	74 07                	je     80471e <devpipe_write+0x67>
  804717:	b8 00 00 00 00       	mov    $0x0,%eax
  80471c:	eb 79                	jmp    804797 <devpipe_write+0xe0>
  80471e:	48 b8 e7 19 80 00 00 	movabs $0x8019e7,%rax
  804725:	00 00 00 
  804728:	ff d0                	callq  *%rax
  80472a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80472e:	8b 40 04             	mov    0x4(%rax),%eax
  804731:	48 63 d0             	movslq %eax,%rdx
  804734:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804738:	8b 00                	mov    (%rax),%eax
  80473a:	48 98                	cltq   
  80473c:	48 83 c0 20          	add    $0x20,%rax
  804740:	48 39 c2             	cmp    %rax,%rdx
  804743:	73 b4                	jae    8046f9 <devpipe_write+0x42>
  804745:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804749:	8b 40 04             	mov    0x4(%rax),%eax
  80474c:	99                   	cltd   
  80474d:	c1 ea 1b             	shr    $0x1b,%edx
  804750:	01 d0                	add    %edx,%eax
  804752:	83 e0 1f             	and    $0x1f,%eax
  804755:	29 d0                	sub    %edx,%eax
  804757:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80475b:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80475f:	48 01 ca             	add    %rcx,%rdx
  804762:	0f b6 0a             	movzbl (%rdx),%ecx
  804765:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804769:	48 98                	cltq   
  80476b:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  80476f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804773:	8b 40 04             	mov    0x4(%rax),%eax
  804776:	8d 50 01             	lea    0x1(%rax),%edx
  804779:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80477d:	89 50 04             	mov    %edx,0x4(%rax)
  804780:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  804785:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804789:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  80478d:	0f 82 64 ff ff ff    	jb     8046f7 <devpipe_write+0x40>
  804793:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804797:	c9                   	leaveq 
  804798:	c3                   	retq   

0000000000804799 <devpipe_stat>:
  804799:	55                   	push   %rbp
  80479a:	48 89 e5             	mov    %rsp,%rbp
  80479d:	48 83 ec 20          	sub    $0x20,%rsp
  8047a1:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8047a5:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8047a9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8047ad:	48 89 c7             	mov    %rax,%rdi
  8047b0:	48 b8 26 1f 80 00 00 	movabs $0x801f26,%rax
  8047b7:	00 00 00 
  8047ba:	ff d0                	callq  *%rax
  8047bc:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8047c0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8047c4:	48 be f9 55 80 00 00 	movabs $0x8055f9,%rsi
  8047cb:	00 00 00 
  8047ce:	48 89 c7             	mov    %rax,%rdi
  8047d1:	48 b8 f6 10 80 00 00 	movabs $0x8010f6,%rax
  8047d8:	00 00 00 
  8047db:	ff d0                	callq  *%rax
  8047dd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8047e1:	8b 50 04             	mov    0x4(%rax),%edx
  8047e4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8047e8:	8b 00                	mov    (%rax),%eax
  8047ea:	29 c2                	sub    %eax,%edx
  8047ec:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8047f0:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  8047f6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8047fa:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  804801:	00 00 00 
  804804:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804808:	48 b9 e0 70 80 00 00 	movabs $0x8070e0,%rcx
  80480f:	00 00 00 
  804812:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  804819:	b8 00 00 00 00       	mov    $0x0,%eax
  80481e:	c9                   	leaveq 
  80481f:	c3                   	retq   

0000000000804820 <devpipe_close>:
  804820:	55                   	push   %rbp
  804821:	48 89 e5             	mov    %rsp,%rbp
  804824:	48 83 ec 10          	sub    $0x10,%rsp
  804828:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80482c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804830:	48 89 c6             	mov    %rax,%rsi
  804833:	bf 00 00 00 00       	mov    $0x0,%edi
  804838:	48 b8 d0 1a 80 00 00 	movabs $0x801ad0,%rax
  80483f:	00 00 00 
  804842:	ff d0                	callq  *%rax
  804844:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804848:	48 89 c7             	mov    %rax,%rdi
  80484b:	48 b8 26 1f 80 00 00 	movabs $0x801f26,%rax
  804852:	00 00 00 
  804855:	ff d0                	callq  *%rax
  804857:	48 89 c6             	mov    %rax,%rsi
  80485a:	bf 00 00 00 00       	mov    $0x0,%edi
  80485f:	48 b8 d0 1a 80 00 00 	movabs $0x801ad0,%rax
  804866:	00 00 00 
  804869:	ff d0                	callq  *%rax
  80486b:	c9                   	leaveq 
  80486c:	c3                   	retq   

000000000080486d <cputchar>:
  80486d:	55                   	push   %rbp
  80486e:	48 89 e5             	mov    %rsp,%rbp
  804871:	48 83 ec 20          	sub    $0x20,%rsp
  804875:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804878:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80487b:	88 45 ff             	mov    %al,-0x1(%rbp)
  80487e:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  804882:	be 01 00 00 00       	mov    $0x1,%esi
  804887:	48 89 c7             	mov    %rax,%rdi
  80488a:	48 b8 dd 18 80 00 00 	movabs $0x8018dd,%rax
  804891:	00 00 00 
  804894:	ff d0                	callq  *%rax
  804896:	c9                   	leaveq 
  804897:	c3                   	retq   

0000000000804898 <getchar>:
  804898:	55                   	push   %rbp
  804899:	48 89 e5             	mov    %rsp,%rbp
  80489c:	48 83 ec 10          	sub    $0x10,%rsp
  8048a0:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  8048a4:	ba 01 00 00 00       	mov    $0x1,%edx
  8048a9:	48 89 c6             	mov    %rax,%rsi
  8048ac:	bf 00 00 00 00       	mov    $0x0,%edi
  8048b1:	48 b8 1b 24 80 00 00 	movabs $0x80241b,%rax
  8048b8:	00 00 00 
  8048bb:	ff d0                	callq  *%rax
  8048bd:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8048c0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8048c4:	79 05                	jns    8048cb <getchar+0x33>
  8048c6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8048c9:	eb 14                	jmp    8048df <getchar+0x47>
  8048cb:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8048cf:	7f 07                	jg     8048d8 <getchar+0x40>
  8048d1:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  8048d6:	eb 07                	jmp    8048df <getchar+0x47>
  8048d8:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  8048dc:	0f b6 c0             	movzbl %al,%eax
  8048df:	c9                   	leaveq 
  8048e0:	c3                   	retq   

00000000008048e1 <iscons>:
  8048e1:	55                   	push   %rbp
  8048e2:	48 89 e5             	mov    %rsp,%rbp
  8048e5:	48 83 ec 20          	sub    $0x20,%rsp
  8048e9:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8048ec:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8048f0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8048f3:	48 89 d6             	mov    %rdx,%rsi
  8048f6:	89 c7                	mov    %eax,%edi
  8048f8:	48 b8 e9 1f 80 00 00 	movabs $0x801fe9,%rax
  8048ff:	00 00 00 
  804902:	ff d0                	callq  *%rax
  804904:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804907:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80490b:	79 05                	jns    804912 <iscons+0x31>
  80490d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804910:	eb 1a                	jmp    80492c <iscons+0x4b>
  804912:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804916:	8b 10                	mov    (%rax),%edx
  804918:	48 b8 20 71 80 00 00 	movabs $0x807120,%rax
  80491f:	00 00 00 
  804922:	8b 00                	mov    (%rax),%eax
  804924:	39 c2                	cmp    %eax,%edx
  804926:	0f 94 c0             	sete   %al
  804929:	0f b6 c0             	movzbl %al,%eax
  80492c:	c9                   	leaveq 
  80492d:	c3                   	retq   

000000000080492e <opencons>:
  80492e:	55                   	push   %rbp
  80492f:	48 89 e5             	mov    %rsp,%rbp
  804932:	48 83 ec 10          	sub    $0x10,%rsp
  804936:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  80493a:	48 89 c7             	mov    %rax,%rdi
  80493d:	48 b8 51 1f 80 00 00 	movabs $0x801f51,%rax
  804944:	00 00 00 
  804947:	ff d0                	callq  *%rax
  804949:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80494c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804950:	79 05                	jns    804957 <opencons+0x29>
  804952:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804955:	eb 5b                	jmp    8049b2 <opencons+0x84>
  804957:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80495b:	ba 07 04 00 00       	mov    $0x407,%edx
  804960:	48 89 c6             	mov    %rax,%rsi
  804963:	bf 00 00 00 00       	mov    $0x0,%edi
  804968:	48 b8 25 1a 80 00 00 	movabs $0x801a25,%rax
  80496f:	00 00 00 
  804972:	ff d0                	callq  *%rax
  804974:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804977:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80497b:	79 05                	jns    804982 <opencons+0x54>
  80497d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804980:	eb 30                	jmp    8049b2 <opencons+0x84>
  804982:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804986:	48 ba 20 71 80 00 00 	movabs $0x807120,%rdx
  80498d:	00 00 00 
  804990:	8b 12                	mov    (%rdx),%edx
  804992:	89 10                	mov    %edx,(%rax)
  804994:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804998:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  80499f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8049a3:	48 89 c7             	mov    %rax,%rdi
  8049a6:	48 b8 03 1f 80 00 00 	movabs $0x801f03,%rax
  8049ad:	00 00 00 
  8049b0:	ff d0                	callq  *%rax
  8049b2:	c9                   	leaveq 
  8049b3:	c3                   	retq   

00000000008049b4 <devcons_read>:
  8049b4:	55                   	push   %rbp
  8049b5:	48 89 e5             	mov    %rsp,%rbp
  8049b8:	48 83 ec 30          	sub    $0x30,%rsp
  8049bc:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8049c0:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8049c4:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8049c8:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8049cd:	75 07                	jne    8049d6 <devcons_read+0x22>
  8049cf:	b8 00 00 00 00       	mov    $0x0,%eax
  8049d4:	eb 4b                	jmp    804a21 <devcons_read+0x6d>
  8049d6:	eb 0c                	jmp    8049e4 <devcons_read+0x30>
  8049d8:	48 b8 e7 19 80 00 00 	movabs $0x8019e7,%rax
  8049df:	00 00 00 
  8049e2:	ff d0                	callq  *%rax
  8049e4:	48 b8 27 19 80 00 00 	movabs $0x801927,%rax
  8049eb:	00 00 00 
  8049ee:	ff d0                	callq  *%rax
  8049f0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8049f3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8049f7:	74 df                	je     8049d8 <devcons_read+0x24>
  8049f9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8049fd:	79 05                	jns    804a04 <devcons_read+0x50>
  8049ff:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804a02:	eb 1d                	jmp    804a21 <devcons_read+0x6d>
  804a04:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  804a08:	75 07                	jne    804a11 <devcons_read+0x5d>
  804a0a:	b8 00 00 00 00       	mov    $0x0,%eax
  804a0f:	eb 10                	jmp    804a21 <devcons_read+0x6d>
  804a11:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804a14:	89 c2                	mov    %eax,%edx
  804a16:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804a1a:	88 10                	mov    %dl,(%rax)
  804a1c:	b8 01 00 00 00       	mov    $0x1,%eax
  804a21:	c9                   	leaveq 
  804a22:	c3                   	retq   

0000000000804a23 <devcons_write>:
  804a23:	55                   	push   %rbp
  804a24:	48 89 e5             	mov    %rsp,%rbp
  804a27:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  804a2e:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  804a35:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  804a3c:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  804a43:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804a4a:	eb 76                	jmp    804ac2 <devcons_write+0x9f>
  804a4c:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  804a53:	89 c2                	mov    %eax,%edx
  804a55:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804a58:	29 c2                	sub    %eax,%edx
  804a5a:	89 d0                	mov    %edx,%eax
  804a5c:	89 45 f8             	mov    %eax,-0x8(%rbp)
  804a5f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804a62:	83 f8 7f             	cmp    $0x7f,%eax
  804a65:	76 07                	jbe    804a6e <devcons_write+0x4b>
  804a67:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  804a6e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804a71:	48 63 d0             	movslq %eax,%rdx
  804a74:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804a77:	48 63 c8             	movslq %eax,%rcx
  804a7a:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  804a81:	48 01 c1             	add    %rax,%rcx
  804a84:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  804a8b:	48 89 ce             	mov    %rcx,%rsi
  804a8e:	48 89 c7             	mov    %rax,%rdi
  804a91:	48 b8 1a 14 80 00 00 	movabs $0x80141a,%rax
  804a98:	00 00 00 
  804a9b:	ff d0                	callq  *%rax
  804a9d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804aa0:	48 63 d0             	movslq %eax,%rdx
  804aa3:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  804aaa:	48 89 d6             	mov    %rdx,%rsi
  804aad:	48 89 c7             	mov    %rax,%rdi
  804ab0:	48 b8 dd 18 80 00 00 	movabs $0x8018dd,%rax
  804ab7:	00 00 00 
  804aba:	ff d0                	callq  *%rax
  804abc:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804abf:	01 45 fc             	add    %eax,-0x4(%rbp)
  804ac2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804ac5:	48 98                	cltq   
  804ac7:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  804ace:	0f 82 78 ff ff ff    	jb     804a4c <devcons_write+0x29>
  804ad4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804ad7:	c9                   	leaveq 
  804ad8:	c3                   	retq   

0000000000804ad9 <devcons_close>:
  804ad9:	55                   	push   %rbp
  804ada:	48 89 e5             	mov    %rsp,%rbp
  804add:	48 83 ec 08          	sub    $0x8,%rsp
  804ae1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804ae5:	b8 00 00 00 00       	mov    $0x0,%eax
  804aea:	c9                   	leaveq 
  804aeb:	c3                   	retq   

0000000000804aec <devcons_stat>:
  804aec:	55                   	push   %rbp
  804aed:	48 89 e5             	mov    %rsp,%rbp
  804af0:	48 83 ec 10          	sub    $0x10,%rsp
  804af4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804af8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804afc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804b00:	48 be 05 56 80 00 00 	movabs $0x805605,%rsi
  804b07:	00 00 00 
  804b0a:	48 89 c7             	mov    %rax,%rdi
  804b0d:	48 b8 f6 10 80 00 00 	movabs $0x8010f6,%rax
  804b14:	00 00 00 
  804b17:	ff d0                	callq  *%rax
  804b19:	b8 00 00 00 00       	mov    $0x0,%eax
  804b1e:	c9                   	leaveq 
  804b1f:	c3                   	retq   

0000000000804b20 <ipc_recv>:
  804b20:	55                   	push   %rbp
  804b21:	48 89 e5             	mov    %rsp,%rbp
  804b24:	48 83 ec 30          	sub    $0x30,%rsp
  804b28:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804b2c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804b30:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804b34:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  804b39:	75 0e                	jne    804b49 <ipc_recv+0x29>
  804b3b:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804b42:	00 00 00 
  804b45:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804b49:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804b4d:	48 89 c7             	mov    %rax,%rdi
  804b50:	48 b8 4e 1c 80 00 00 	movabs $0x801c4e,%rax
  804b57:	00 00 00 
  804b5a:	ff d0                	callq  *%rax
  804b5c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804b5f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804b63:	79 27                	jns    804b8c <ipc_recv+0x6c>
  804b65:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  804b6a:	74 0a                	je     804b76 <ipc_recv+0x56>
  804b6c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804b70:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  804b76:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804b7b:	74 0a                	je     804b87 <ipc_recv+0x67>
  804b7d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804b81:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  804b87:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804b8a:	eb 53                	jmp    804bdf <ipc_recv+0xbf>
  804b8c:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  804b91:	74 19                	je     804bac <ipc_recv+0x8c>
  804b93:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  804b9a:	00 00 00 
  804b9d:	48 8b 00             	mov    (%rax),%rax
  804ba0:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  804ba6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804baa:	89 10                	mov    %edx,(%rax)
  804bac:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804bb1:	74 19                	je     804bcc <ipc_recv+0xac>
  804bb3:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  804bba:	00 00 00 
  804bbd:	48 8b 00             	mov    (%rax),%rax
  804bc0:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  804bc6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804bca:	89 10                	mov    %edx,(%rax)
  804bcc:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  804bd3:	00 00 00 
  804bd6:	48 8b 00             	mov    (%rax),%rax
  804bd9:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  804bdf:	c9                   	leaveq 
  804be0:	c3                   	retq   

0000000000804be1 <ipc_send>:
  804be1:	55                   	push   %rbp
  804be2:	48 89 e5             	mov    %rsp,%rbp
  804be5:	48 83 ec 30          	sub    $0x30,%rsp
  804be9:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804bec:	89 75 e8             	mov    %esi,-0x18(%rbp)
  804bef:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  804bf3:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  804bf6:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  804bfb:	75 10                	jne    804c0d <ipc_send+0x2c>
  804bfd:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804c04:	00 00 00 
  804c07:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804c0b:	eb 0e                	jmp    804c1b <ipc_send+0x3a>
  804c0d:	eb 0c                	jmp    804c1b <ipc_send+0x3a>
  804c0f:	48 b8 e7 19 80 00 00 	movabs $0x8019e7,%rax
  804c16:	00 00 00 
  804c19:	ff d0                	callq  *%rax
  804c1b:	8b 75 e8             	mov    -0x18(%rbp),%esi
  804c1e:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  804c21:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  804c25:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804c28:	89 c7                	mov    %eax,%edi
  804c2a:	48 b8 f9 1b 80 00 00 	movabs $0x801bf9,%rax
  804c31:	00 00 00 
  804c34:	ff d0                	callq  *%rax
  804c36:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804c39:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  804c3d:	74 d0                	je     804c0f <ipc_send+0x2e>
  804c3f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804c43:	79 30                	jns    804c75 <ipc_send+0x94>
  804c45:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804c48:	89 c1                	mov    %eax,%ecx
  804c4a:	48 ba 0c 56 80 00 00 	movabs $0x80560c,%rdx
  804c51:	00 00 00 
  804c54:	be 44 00 00 00       	mov    $0x44,%esi
  804c59:	48 bf 22 56 80 00 00 	movabs $0x805622,%rdi
  804c60:	00 00 00 
  804c63:	b8 00 00 00 00       	mov    $0x0,%eax
  804c68:	49 b8 08 03 80 00 00 	movabs $0x800308,%r8
  804c6f:	00 00 00 
  804c72:	41 ff d0             	callq  *%r8
  804c75:	c9                   	leaveq 
  804c76:	c3                   	retq   

0000000000804c77 <ipc_find_env>:
  804c77:	55                   	push   %rbp
  804c78:	48 89 e5             	mov    %rsp,%rbp
  804c7b:	48 83 ec 14          	sub    $0x14,%rsp
  804c7f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804c82:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804c89:	eb 4e                	jmp    804cd9 <ipc_find_env+0x62>
  804c8b:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804c92:	00 00 00 
  804c95:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804c98:	48 98                	cltq   
  804c9a:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804ca1:	48 01 d0             	add    %rdx,%rax
  804ca4:	48 05 d0 00 00 00    	add    $0xd0,%rax
  804caa:	8b 00                	mov    (%rax),%eax
  804cac:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  804caf:	75 24                	jne    804cd5 <ipc_find_env+0x5e>
  804cb1:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804cb8:	00 00 00 
  804cbb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804cbe:	48 98                	cltq   
  804cc0:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804cc7:	48 01 d0             	add    %rdx,%rax
  804cca:	48 05 c0 00 00 00    	add    $0xc0,%rax
  804cd0:	8b 40 08             	mov    0x8(%rax),%eax
  804cd3:	eb 12                	jmp    804ce7 <ipc_find_env+0x70>
  804cd5:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  804cd9:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  804ce0:	7e a9                	jle    804c8b <ipc_find_env+0x14>
  804ce2:	b8 00 00 00 00       	mov    $0x0,%eax
  804ce7:	c9                   	leaveq 
  804ce8:	c3                   	retq   

0000000000804ce9 <pageref>:
  804ce9:	55                   	push   %rbp
  804cea:	48 89 e5             	mov    %rsp,%rbp
  804ced:	48 83 ec 18          	sub    $0x18,%rsp
  804cf1:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804cf5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804cf9:	48 c1 e8 15          	shr    $0x15,%rax
  804cfd:	48 89 c2             	mov    %rax,%rdx
  804d00:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  804d07:	01 00 00 
  804d0a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804d0e:	83 e0 01             	and    $0x1,%eax
  804d11:	48 85 c0             	test   %rax,%rax
  804d14:	75 07                	jne    804d1d <pageref+0x34>
  804d16:	b8 00 00 00 00       	mov    $0x0,%eax
  804d1b:	eb 53                	jmp    804d70 <pageref+0x87>
  804d1d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804d21:	48 c1 e8 0c          	shr    $0xc,%rax
  804d25:	48 89 c2             	mov    %rax,%rdx
  804d28:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  804d2f:	01 00 00 
  804d32:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804d36:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804d3a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804d3e:	83 e0 01             	and    $0x1,%eax
  804d41:	48 85 c0             	test   %rax,%rax
  804d44:	75 07                	jne    804d4d <pageref+0x64>
  804d46:	b8 00 00 00 00       	mov    $0x0,%eax
  804d4b:	eb 23                	jmp    804d70 <pageref+0x87>
  804d4d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804d51:	48 c1 e8 0c          	shr    $0xc,%rax
  804d55:	48 89 c2             	mov    %rax,%rdx
  804d58:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  804d5f:	00 00 00 
  804d62:	48 c1 e2 04          	shl    $0x4,%rdx
  804d66:	48 01 d0             	add    %rdx,%rax
  804d69:	0f b7 40 08          	movzwl 0x8(%rax),%eax
  804d6d:	0f b7 c0             	movzwl %ax,%eax
  804d70:	c9                   	leaveq 
  804d71:	c3                   	retq   
