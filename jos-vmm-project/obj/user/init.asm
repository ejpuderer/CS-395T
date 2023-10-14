
obj/user/init:     file format elf64-x86-64


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
  80003c:	e8 6c 06 00 00       	callq  8006ad <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <sum>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 1c          	sub    $0x1c,%rsp
  80004b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80004f:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800052:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
  800059:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800060:	eb 1e                	jmp    800080 <sum+0x3d>
  800062:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800065:	48 63 d0             	movslq %eax,%rdx
  800068:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80006c:	48 01 d0             	add    %rdx,%rax
  80006f:	0f b6 00             	movzbl (%rax),%eax
  800072:	0f be c0             	movsbl %al,%eax
  800075:	0f af 45 fc          	imul   -0x4(%rbp),%eax
  800079:	31 45 f8             	xor    %eax,-0x8(%rbp)
  80007c:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800080:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800083:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  800086:	7c da                	jl     800062 <sum+0x1f>
  800088:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80008b:	c9                   	leaveq 
  80008c:	c3                   	retq   

000000000080008d <umain>:
  80008d:	55                   	push   %rbp
  80008e:	48 89 e5             	mov    %rsp,%rbp
  800091:	48 81 ec 20 01 00 00 	sub    $0x120,%rsp
  800098:	89 bd ec fe ff ff    	mov    %edi,-0x114(%rbp)
  80009e:	48 89 b5 e0 fe ff ff 	mov    %rsi,-0x120(%rbp)
  8000a5:	48 bf a0 4f 80 00 00 	movabs $0x804fa0,%rdi
  8000ac:	00 00 00 
  8000af:	b8 00 00 00 00       	mov    $0x0,%eax
  8000b4:	48 ba 8c 09 80 00 00 	movabs $0x80098c,%rdx
  8000bb:	00 00 00 
  8000be:	ff d2                	callq  *%rdx
  8000c0:	c7 45 f8 9e 98 0f 00 	movl   $0xf989e,-0x8(%rbp)
  8000c7:	be 70 17 00 00       	mov    $0x1770,%esi
  8000cc:	48 bf 00 70 80 00 00 	movabs $0x807000,%rdi
  8000d3:	00 00 00 
  8000d6:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8000dd:	00 00 00 
  8000e0:	ff d0                	callq  *%rax
  8000e2:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8000e5:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8000e8:	3b 45 f8             	cmp    -0x8(%rbp),%eax
  8000eb:	74 25                	je     800112 <umain+0x85>
  8000ed:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8000f0:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8000f3:	89 c6                	mov    %eax,%esi
  8000f5:	48 bf b0 4f 80 00 00 	movabs $0x804fb0,%rdi
  8000fc:	00 00 00 
  8000ff:	b8 00 00 00 00       	mov    $0x0,%eax
  800104:	48 b9 8c 09 80 00 00 	movabs $0x80098c,%rcx
  80010b:	00 00 00 
  80010e:	ff d1                	callq  *%rcx
  800110:	eb 1b                	jmp    80012d <umain+0xa0>
  800112:	48 bf e9 4f 80 00 00 	movabs $0x804fe9,%rdi
  800119:	00 00 00 
  80011c:	b8 00 00 00 00       	mov    $0x0,%eax
  800121:	48 ba 8c 09 80 00 00 	movabs $0x80098c,%rdx
  800128:	00 00 00 
  80012b:	ff d2                	callq  *%rdx
  80012d:	be 70 17 00 00       	mov    $0x1770,%esi
  800132:	48 bf 20 90 80 00 00 	movabs $0x809020,%rdi
  800139:	00 00 00 
  80013c:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800143:	00 00 00 
  800146:	ff d0                	callq  *%rax
  800148:	89 45 f4             	mov    %eax,-0xc(%rbp)
  80014b:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  80014f:	74 22                	je     800173 <umain+0xe6>
  800151:	8b 45 f4             	mov    -0xc(%rbp),%eax
  800154:	89 c6                	mov    %eax,%esi
  800156:	48 bf 00 50 80 00 00 	movabs $0x805000,%rdi
  80015d:	00 00 00 
  800160:	b8 00 00 00 00       	mov    $0x0,%eax
  800165:	48 ba 8c 09 80 00 00 	movabs $0x80098c,%rdx
  80016c:	00 00 00 
  80016f:	ff d2                	callq  *%rdx
  800171:	eb 1b                	jmp    80018e <umain+0x101>
  800173:	48 bf 2f 50 80 00 00 	movabs $0x80502f,%rdi
  80017a:	00 00 00 
  80017d:	b8 00 00 00 00       	mov    $0x0,%eax
  800182:	48 ba 8c 09 80 00 00 	movabs $0x80098c,%rdx
  800189:	00 00 00 
  80018c:	ff d2                	callq  *%rdx
  80018e:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800195:	48 be 45 50 80 00 00 	movabs $0x805045,%rsi
  80019c:	00 00 00 
  80019f:	48 89 c7             	mov    %rax,%rdi
  8001a2:	48 b8 84 15 80 00 00 	movabs $0x801584,%rax
  8001a9:	00 00 00 
  8001ac:	ff d0                	callq  *%rax
  8001ae:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8001b5:	eb 77                	jmp    80022e <umain+0x1a1>
  8001b7:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  8001be:	48 be 51 50 80 00 00 	movabs $0x805051,%rsi
  8001c5:	00 00 00 
  8001c8:	48 89 c7             	mov    %rax,%rdi
  8001cb:	48 b8 84 15 80 00 00 	movabs $0x801584,%rax
  8001d2:	00 00 00 
  8001d5:	ff d0                	callq  *%rax
  8001d7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8001da:	48 98                	cltq   
  8001dc:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8001e3:	00 
  8001e4:	48 8b 85 e0 fe ff ff 	mov    -0x120(%rbp),%rax
  8001eb:	48 01 d0             	add    %rdx,%rax
  8001ee:	48 8b 10             	mov    (%rax),%rdx
  8001f1:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  8001f8:	48 89 d6             	mov    %rdx,%rsi
  8001fb:	48 89 c7             	mov    %rax,%rdi
  8001fe:	48 b8 84 15 80 00 00 	movabs $0x801584,%rax
  800205:	00 00 00 
  800208:	ff d0                	callq  *%rax
  80020a:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800211:	48 be 54 50 80 00 00 	movabs $0x805054,%rsi
  800218:	00 00 00 
  80021b:	48 89 c7             	mov    %rax,%rdi
  80021e:	48 b8 84 15 80 00 00 	movabs $0x801584,%rax
  800225:	00 00 00 
  800228:	ff d0                	callq  *%rax
  80022a:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80022e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800231:	3b 85 ec fe ff ff    	cmp    -0x114(%rbp),%eax
  800237:	0f 8c 7a ff ff ff    	jl     8001b7 <umain+0x12a>
  80023d:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800244:	48 89 c6             	mov    %rax,%rsi
  800247:	48 bf 56 50 80 00 00 	movabs $0x805056,%rdi
  80024e:	00 00 00 
  800251:	b8 00 00 00 00       	mov    $0x0,%eax
  800256:	48 ba 8c 09 80 00 00 	movabs $0x80098c,%rdx
  80025d:	00 00 00 
  800260:	ff d2                	callq  *%rdx
  800262:	48 bf 5a 50 80 00 00 	movabs $0x80505a,%rdi
  800269:	00 00 00 
  80026c:	b8 00 00 00 00       	mov    $0x0,%eax
  800271:	48 ba 8c 09 80 00 00 	movabs $0x80098c,%rdx
  800278:	00 00 00 
  80027b:	ff d2                	callq  *%rdx
  80027d:	bf 00 00 00 00       	mov    $0x0,%edi
  800282:	48 b8 44 26 80 00 00 	movabs $0x802644,%rax
  800289:	00 00 00 
  80028c:	ff d0                	callq  *%rax
  80028e:	48 b8 bb 04 80 00 00 	movabs $0x8004bb,%rax
  800295:	00 00 00 
  800298:	ff d0                	callq  *%rax
  80029a:	89 45 f0             	mov    %eax,-0x10(%rbp)
  80029d:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8002a1:	79 30                	jns    8002d3 <umain+0x246>
  8002a3:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8002a6:	89 c1                	mov    %eax,%ecx
  8002a8:	48 ba 6c 50 80 00 00 	movabs $0x80506c,%rdx
  8002af:	00 00 00 
  8002b2:	be 39 00 00 00       	mov    $0x39,%esi
  8002b7:	48 bf 79 50 80 00 00 	movabs $0x805079,%rdi
  8002be:	00 00 00 
  8002c1:	b8 00 00 00 00       	mov    $0x0,%eax
  8002c6:	49 b8 53 07 80 00 00 	movabs $0x800753,%r8
  8002cd:	00 00 00 
  8002d0:	41 ff d0             	callq  *%r8
  8002d3:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8002d7:	74 30                	je     800309 <umain+0x27c>
  8002d9:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8002dc:	89 c1                	mov    %eax,%ecx
  8002de:	48 ba 88 50 80 00 00 	movabs $0x805088,%rdx
  8002e5:	00 00 00 
  8002e8:	be 3b 00 00 00       	mov    $0x3b,%esi
  8002ed:	48 bf 79 50 80 00 00 	movabs $0x805079,%rdi
  8002f4:	00 00 00 
  8002f7:	b8 00 00 00 00       	mov    $0x0,%eax
  8002fc:	49 b8 53 07 80 00 00 	movabs $0x800753,%r8
  800303:	00 00 00 
  800306:	41 ff d0             	callq  *%r8
  800309:	be 01 00 00 00       	mov    $0x1,%esi
  80030e:	bf 00 00 00 00       	mov    $0x0,%edi
  800313:	48 b8 bd 26 80 00 00 	movabs $0x8026bd,%rax
  80031a:	00 00 00 
  80031d:	ff d0                	callq  *%rax
  80031f:	89 45 f0             	mov    %eax,-0x10(%rbp)
  800322:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  800326:	79 30                	jns    800358 <umain+0x2cb>
  800328:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80032b:	89 c1                	mov    %eax,%ecx
  80032d:	48 ba a2 50 80 00 00 	movabs $0x8050a2,%rdx
  800334:	00 00 00 
  800337:	be 3d 00 00 00       	mov    $0x3d,%esi
  80033c:	48 bf 79 50 80 00 00 	movabs $0x805079,%rdi
  800343:	00 00 00 
  800346:	b8 00 00 00 00       	mov    $0x0,%eax
  80034b:	49 b8 53 07 80 00 00 	movabs $0x800753,%r8
  800352:	00 00 00 
  800355:	41 ff d0             	callq  *%r8
  800358:	48 bf aa 50 80 00 00 	movabs $0x8050aa,%rdi
  80035f:	00 00 00 
  800362:	b8 00 00 00 00       	mov    $0x0,%eax
  800367:	48 ba 8c 09 80 00 00 	movabs $0x80098c,%rdx
  80036e:	00 00 00 
  800371:	ff d2                	callq  *%rdx
  800373:	ba 00 00 00 00       	mov    $0x0,%edx
  800378:	48 be bd 50 80 00 00 	movabs $0x8050bd,%rsi
  80037f:	00 00 00 
  800382:	48 bf c0 50 80 00 00 	movabs $0x8050c0,%rdi
  800389:	00 00 00 
  80038c:	b8 00 00 00 00       	mov    $0x0,%eax
  800391:	48 b9 cc 36 80 00 00 	movabs $0x8036cc,%rcx
  800398:	00 00 00 
  80039b:	ff d1                	callq  *%rcx
  80039d:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8003a0:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8003a4:	79 23                	jns    8003c9 <umain+0x33c>
  8003a6:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8003a9:	89 c6                	mov    %eax,%esi
  8003ab:	48 bf c8 50 80 00 00 	movabs $0x8050c8,%rdi
  8003b2:	00 00 00 
  8003b5:	b8 00 00 00 00       	mov    $0x0,%eax
  8003ba:	48 ba 8c 09 80 00 00 	movabs $0x80098c,%rdx
  8003c1:	00 00 00 
  8003c4:	ff d2                	callq  *%rdx
  8003c6:	90                   	nop
  8003c7:	eb 8f                	jmp    800358 <umain+0x2cb>
  8003c9:	48 bf dc 50 80 00 00 	movabs $0x8050dc,%rdi
  8003d0:	00 00 00 
  8003d3:	b8 00 00 00 00       	mov    $0x0,%eax
  8003d8:	48 ba 8c 09 80 00 00 	movabs $0x80098c,%rdx
  8003df:	00 00 00 
  8003e2:	ff d2                	callq  *%rdx
  8003e4:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8003e7:	89 c7                	mov    %eax,%edi
  8003e9:	48 b8 b8 4c 80 00 00 	movabs $0x804cb8,%rax
  8003f0:	00 00 00 
  8003f3:	ff d0                	callq  *%rax
  8003f5:	e9 5e ff ff ff       	jmpq   800358 <umain+0x2cb>

00000000008003fa <cputchar>:
  8003fa:	55                   	push   %rbp
  8003fb:	48 89 e5             	mov    %rsp,%rbp
  8003fe:	48 83 ec 20          	sub    $0x20,%rsp
  800402:	89 7d ec             	mov    %edi,-0x14(%rbp)
  800405:	8b 45 ec             	mov    -0x14(%rbp),%eax
  800408:	88 45 ff             	mov    %al,-0x1(%rbp)
  80040b:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  80040f:	be 01 00 00 00       	mov    $0x1,%esi
  800414:	48 89 c7             	mov    %rax,%rdi
  800417:	48 b8 28 1d 80 00 00 	movabs $0x801d28,%rax
  80041e:	00 00 00 
  800421:	ff d0                	callq  *%rax
  800423:	c9                   	leaveq 
  800424:	c3                   	retq   

0000000000800425 <getchar>:
  800425:	55                   	push   %rbp
  800426:	48 89 e5             	mov    %rsp,%rbp
  800429:	48 83 ec 10          	sub    $0x10,%rsp
  80042d:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  800431:	ba 01 00 00 00       	mov    $0x1,%edx
  800436:	48 89 c6             	mov    %rax,%rsi
  800439:	bf 00 00 00 00       	mov    $0x0,%edi
  80043e:	48 b8 66 28 80 00 00 	movabs $0x802866,%rax
  800445:	00 00 00 
  800448:	ff d0                	callq  *%rax
  80044a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80044d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800451:	79 05                	jns    800458 <getchar+0x33>
  800453:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800456:	eb 14                	jmp    80046c <getchar+0x47>
  800458:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80045c:	7f 07                	jg     800465 <getchar+0x40>
  80045e:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  800463:	eb 07                	jmp    80046c <getchar+0x47>
  800465:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  800469:	0f b6 c0             	movzbl %al,%eax
  80046c:	c9                   	leaveq 
  80046d:	c3                   	retq   

000000000080046e <iscons>:
  80046e:	55                   	push   %rbp
  80046f:	48 89 e5             	mov    %rsp,%rbp
  800472:	48 83 ec 20          	sub    $0x20,%rsp
  800476:	89 7d ec             	mov    %edi,-0x14(%rbp)
  800479:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80047d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  800480:	48 89 d6             	mov    %rdx,%rsi
  800483:	89 c7                	mov    %eax,%edi
  800485:	48 b8 34 24 80 00 00 	movabs $0x802434,%rax
  80048c:	00 00 00 
  80048f:	ff d0                	callq  *%rax
  800491:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800494:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800498:	79 05                	jns    80049f <iscons+0x31>
  80049a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80049d:	eb 1a                	jmp    8004b9 <iscons+0x4b>
  80049f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8004a3:	8b 10                	mov    (%rax),%edx
  8004a5:	48 b8 80 87 80 00 00 	movabs $0x808780,%rax
  8004ac:	00 00 00 
  8004af:	8b 00                	mov    (%rax),%eax
  8004b1:	39 c2                	cmp    %eax,%edx
  8004b3:	0f 94 c0             	sete   %al
  8004b6:	0f b6 c0             	movzbl %al,%eax
  8004b9:	c9                   	leaveq 
  8004ba:	c3                   	retq   

00000000008004bb <opencons>:
  8004bb:	55                   	push   %rbp
  8004bc:	48 89 e5             	mov    %rsp,%rbp
  8004bf:	48 83 ec 10          	sub    $0x10,%rsp
  8004c3:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8004c7:	48 89 c7             	mov    %rax,%rdi
  8004ca:	48 b8 9c 23 80 00 00 	movabs $0x80239c,%rax
  8004d1:	00 00 00 
  8004d4:	ff d0                	callq  *%rax
  8004d6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8004d9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8004dd:	79 05                	jns    8004e4 <opencons+0x29>
  8004df:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8004e2:	eb 5b                	jmp    80053f <opencons+0x84>
  8004e4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8004e8:	ba 07 04 00 00       	mov    $0x407,%edx
  8004ed:	48 89 c6             	mov    %rax,%rsi
  8004f0:	bf 00 00 00 00       	mov    $0x0,%edi
  8004f5:	48 b8 70 1e 80 00 00 	movabs $0x801e70,%rax
  8004fc:	00 00 00 
  8004ff:	ff d0                	callq  *%rax
  800501:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800504:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800508:	79 05                	jns    80050f <opencons+0x54>
  80050a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80050d:	eb 30                	jmp    80053f <opencons+0x84>
  80050f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800513:	48 ba 80 87 80 00 00 	movabs $0x808780,%rdx
  80051a:	00 00 00 
  80051d:	8b 12                	mov    (%rdx),%edx
  80051f:	89 10                	mov    %edx,(%rax)
  800521:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800525:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  80052c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800530:	48 89 c7             	mov    %rax,%rdi
  800533:	48 b8 4e 23 80 00 00 	movabs $0x80234e,%rax
  80053a:	00 00 00 
  80053d:	ff d0                	callq  *%rax
  80053f:	c9                   	leaveq 
  800540:	c3                   	retq   

0000000000800541 <devcons_read>:
  800541:	55                   	push   %rbp
  800542:	48 89 e5             	mov    %rsp,%rbp
  800545:	48 83 ec 30          	sub    $0x30,%rsp
  800549:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80054d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800551:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  800555:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80055a:	75 07                	jne    800563 <devcons_read+0x22>
  80055c:	b8 00 00 00 00       	mov    $0x0,%eax
  800561:	eb 4b                	jmp    8005ae <devcons_read+0x6d>
  800563:	eb 0c                	jmp    800571 <devcons_read+0x30>
  800565:	48 b8 32 1e 80 00 00 	movabs $0x801e32,%rax
  80056c:	00 00 00 
  80056f:	ff d0                	callq  *%rax
  800571:	48 b8 72 1d 80 00 00 	movabs $0x801d72,%rax
  800578:	00 00 00 
  80057b:	ff d0                	callq  *%rax
  80057d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800580:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800584:	74 df                	je     800565 <devcons_read+0x24>
  800586:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80058a:	79 05                	jns    800591 <devcons_read+0x50>
  80058c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80058f:	eb 1d                	jmp    8005ae <devcons_read+0x6d>
  800591:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  800595:	75 07                	jne    80059e <devcons_read+0x5d>
  800597:	b8 00 00 00 00       	mov    $0x0,%eax
  80059c:	eb 10                	jmp    8005ae <devcons_read+0x6d>
  80059e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8005a1:	89 c2                	mov    %eax,%edx
  8005a3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8005a7:	88 10                	mov    %dl,(%rax)
  8005a9:	b8 01 00 00 00       	mov    $0x1,%eax
  8005ae:	c9                   	leaveq 
  8005af:	c3                   	retq   

00000000008005b0 <devcons_write>:
  8005b0:	55                   	push   %rbp
  8005b1:	48 89 e5             	mov    %rsp,%rbp
  8005b4:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  8005bb:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  8005c2:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  8005c9:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  8005d0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8005d7:	eb 76                	jmp    80064f <devcons_write+0x9f>
  8005d9:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  8005e0:	89 c2                	mov    %eax,%edx
  8005e2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8005e5:	29 c2                	sub    %eax,%edx
  8005e7:	89 d0                	mov    %edx,%eax
  8005e9:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8005ec:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8005ef:	83 f8 7f             	cmp    $0x7f,%eax
  8005f2:	76 07                	jbe    8005fb <devcons_write+0x4b>
  8005f4:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  8005fb:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8005fe:	48 63 d0             	movslq %eax,%rdx
  800601:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800604:	48 63 c8             	movslq %eax,%rcx
  800607:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  80060e:	48 01 c1             	add    %rax,%rcx
  800611:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  800618:	48 89 ce             	mov    %rcx,%rsi
  80061b:	48 89 c7             	mov    %rax,%rdi
  80061e:	48 b8 65 18 80 00 00 	movabs $0x801865,%rax
  800625:	00 00 00 
  800628:	ff d0                	callq  *%rax
  80062a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80062d:	48 63 d0             	movslq %eax,%rdx
  800630:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  800637:	48 89 d6             	mov    %rdx,%rsi
  80063a:	48 89 c7             	mov    %rax,%rdi
  80063d:	48 b8 28 1d 80 00 00 	movabs $0x801d28,%rax
  800644:	00 00 00 
  800647:	ff d0                	callq  *%rax
  800649:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80064c:	01 45 fc             	add    %eax,-0x4(%rbp)
  80064f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800652:	48 98                	cltq   
  800654:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  80065b:	0f 82 78 ff ff ff    	jb     8005d9 <devcons_write+0x29>
  800661:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800664:	c9                   	leaveq 
  800665:	c3                   	retq   

0000000000800666 <devcons_close>:
  800666:	55                   	push   %rbp
  800667:	48 89 e5             	mov    %rsp,%rbp
  80066a:	48 83 ec 08          	sub    $0x8,%rsp
  80066e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800672:	b8 00 00 00 00       	mov    $0x0,%eax
  800677:	c9                   	leaveq 
  800678:	c3                   	retq   

0000000000800679 <devcons_stat>:
  800679:	55                   	push   %rbp
  80067a:	48 89 e5             	mov    %rsp,%rbp
  80067d:	48 83 ec 10          	sub    $0x10,%rsp
  800681:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800685:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800689:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80068d:	48 be ef 50 80 00 00 	movabs $0x8050ef,%rsi
  800694:	00 00 00 
  800697:	48 89 c7             	mov    %rax,%rdi
  80069a:	48 b8 41 15 80 00 00 	movabs $0x801541,%rax
  8006a1:	00 00 00 
  8006a4:	ff d0                	callq  *%rax
  8006a6:	b8 00 00 00 00       	mov    $0x0,%eax
  8006ab:	c9                   	leaveq 
  8006ac:	c3                   	retq   

00000000008006ad <libmain>:
  8006ad:	55                   	push   %rbp
  8006ae:	48 89 e5             	mov    %rsp,%rbp
  8006b1:	48 83 ec 10          	sub    $0x10,%rsp
  8006b5:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8006b8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8006bc:	48 b8 f4 1d 80 00 00 	movabs $0x801df4,%rax
  8006c3:	00 00 00 
  8006c6:	ff d0                	callq  *%rax
  8006c8:	25 ff 03 00 00       	and    $0x3ff,%eax
  8006cd:	48 98                	cltq   
  8006cf:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8006d6:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8006dd:	00 00 00 
  8006e0:	48 01 c2             	add    %rax,%rdx
  8006e3:	48 b8 90 a7 80 00 00 	movabs $0x80a790,%rax
  8006ea:	00 00 00 
  8006ed:	48 89 10             	mov    %rdx,(%rax)
  8006f0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8006f4:	7e 14                	jle    80070a <libmain+0x5d>
  8006f6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8006fa:	48 8b 10             	mov    (%rax),%rdx
  8006fd:	48 b8 b8 87 80 00 00 	movabs $0x8087b8,%rax
  800704:	00 00 00 
  800707:	48 89 10             	mov    %rdx,(%rax)
  80070a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80070e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800711:	48 89 d6             	mov    %rdx,%rsi
  800714:	89 c7                	mov    %eax,%edi
  800716:	48 b8 8d 00 80 00 00 	movabs $0x80008d,%rax
  80071d:	00 00 00 
  800720:	ff d0                	callq  *%rax
  800722:	48 b8 30 07 80 00 00 	movabs $0x800730,%rax
  800729:	00 00 00 
  80072c:	ff d0                	callq  *%rax
  80072e:	c9                   	leaveq 
  80072f:	c3                   	retq   

0000000000800730 <exit>:
  800730:	55                   	push   %rbp
  800731:	48 89 e5             	mov    %rsp,%rbp
  800734:	48 b8 8f 26 80 00 00 	movabs $0x80268f,%rax
  80073b:	00 00 00 
  80073e:	ff d0                	callq  *%rax
  800740:	bf 00 00 00 00       	mov    $0x0,%edi
  800745:	48 b8 b0 1d 80 00 00 	movabs $0x801db0,%rax
  80074c:	00 00 00 
  80074f:	ff d0                	callq  *%rax
  800751:	5d                   	pop    %rbp
  800752:	c3                   	retq   

0000000000800753 <_panic>:
  800753:	55                   	push   %rbp
  800754:	48 89 e5             	mov    %rsp,%rbp
  800757:	53                   	push   %rbx
  800758:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  80075f:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  800766:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  80076c:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  800773:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  80077a:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  800781:	84 c0                	test   %al,%al
  800783:	74 23                	je     8007a8 <_panic+0x55>
  800785:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  80078c:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  800790:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  800794:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  800798:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  80079c:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  8007a0:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  8007a4:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  8007a8:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  8007af:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  8007b6:	00 00 00 
  8007b9:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  8007c0:	00 00 00 
  8007c3:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8007c7:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  8007ce:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  8007d5:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8007dc:	48 b8 b8 87 80 00 00 	movabs $0x8087b8,%rax
  8007e3:	00 00 00 
  8007e6:	48 8b 18             	mov    (%rax),%rbx
  8007e9:	48 b8 f4 1d 80 00 00 	movabs $0x801df4,%rax
  8007f0:	00 00 00 
  8007f3:	ff d0                	callq  *%rax
  8007f5:	8b 8d 14 ff ff ff    	mov    -0xec(%rbp),%ecx
  8007fb:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800802:	41 89 c8             	mov    %ecx,%r8d
  800805:	48 89 d1             	mov    %rdx,%rcx
  800808:	48 89 da             	mov    %rbx,%rdx
  80080b:	89 c6                	mov    %eax,%esi
  80080d:	48 bf 00 51 80 00 00 	movabs $0x805100,%rdi
  800814:	00 00 00 
  800817:	b8 00 00 00 00       	mov    $0x0,%eax
  80081c:	49 b9 8c 09 80 00 00 	movabs $0x80098c,%r9
  800823:	00 00 00 
  800826:	41 ff d1             	callq  *%r9
  800829:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  800830:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800837:	48 89 d6             	mov    %rdx,%rsi
  80083a:	48 89 c7             	mov    %rax,%rdi
  80083d:	48 b8 e0 08 80 00 00 	movabs $0x8008e0,%rax
  800844:	00 00 00 
  800847:	ff d0                	callq  *%rax
  800849:	48 bf 23 51 80 00 00 	movabs $0x805123,%rdi
  800850:	00 00 00 
  800853:	b8 00 00 00 00       	mov    $0x0,%eax
  800858:	48 ba 8c 09 80 00 00 	movabs $0x80098c,%rdx
  80085f:	00 00 00 
  800862:	ff d2                	callq  *%rdx
  800864:	cc                   	int3   
  800865:	eb fd                	jmp    800864 <_panic+0x111>

0000000000800867 <putch>:
  800867:	55                   	push   %rbp
  800868:	48 89 e5             	mov    %rsp,%rbp
  80086b:	48 83 ec 10          	sub    $0x10,%rsp
  80086f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800872:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800876:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80087a:	8b 00                	mov    (%rax),%eax
  80087c:	8d 48 01             	lea    0x1(%rax),%ecx
  80087f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800883:	89 0a                	mov    %ecx,(%rdx)
  800885:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800888:	89 d1                	mov    %edx,%ecx
  80088a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80088e:	48 98                	cltq   
  800890:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  800894:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800898:	8b 00                	mov    (%rax),%eax
  80089a:	3d ff 00 00 00       	cmp    $0xff,%eax
  80089f:	75 2c                	jne    8008cd <putch+0x66>
  8008a1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8008a5:	8b 00                	mov    (%rax),%eax
  8008a7:	48 98                	cltq   
  8008a9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8008ad:	48 83 c2 08          	add    $0x8,%rdx
  8008b1:	48 89 c6             	mov    %rax,%rsi
  8008b4:	48 89 d7             	mov    %rdx,%rdi
  8008b7:	48 b8 28 1d 80 00 00 	movabs $0x801d28,%rax
  8008be:	00 00 00 
  8008c1:	ff d0                	callq  *%rax
  8008c3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8008c7:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8008cd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8008d1:	8b 40 04             	mov    0x4(%rax),%eax
  8008d4:	8d 50 01             	lea    0x1(%rax),%edx
  8008d7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8008db:	89 50 04             	mov    %edx,0x4(%rax)
  8008de:	c9                   	leaveq 
  8008df:	c3                   	retq   

00000000008008e0 <vcprintf>:
  8008e0:	55                   	push   %rbp
  8008e1:	48 89 e5             	mov    %rsp,%rbp
  8008e4:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  8008eb:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  8008f2:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  8008f9:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  800900:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  800907:	48 8b 0a             	mov    (%rdx),%rcx
  80090a:	48 89 08             	mov    %rcx,(%rax)
  80090d:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800911:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800915:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800919:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80091d:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  800924:	00 00 00 
  800927:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  80092e:	00 00 00 
  800931:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  800938:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  80093f:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800946:	48 89 c6             	mov    %rax,%rsi
  800949:	48 bf 67 08 80 00 00 	movabs $0x800867,%rdi
  800950:	00 00 00 
  800953:	48 b8 3f 0d 80 00 00 	movabs $0x800d3f,%rax
  80095a:	00 00 00 
  80095d:	ff d0                	callq  *%rax
  80095f:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  800965:	48 98                	cltq   
  800967:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  80096e:	48 83 c2 08          	add    $0x8,%rdx
  800972:	48 89 c6             	mov    %rax,%rsi
  800975:	48 89 d7             	mov    %rdx,%rdi
  800978:	48 b8 28 1d 80 00 00 	movabs $0x801d28,%rax
  80097f:	00 00 00 
  800982:	ff d0                	callq  *%rax
  800984:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  80098a:	c9                   	leaveq 
  80098b:	c3                   	retq   

000000000080098c <cprintf>:
  80098c:	55                   	push   %rbp
  80098d:	48 89 e5             	mov    %rsp,%rbp
  800990:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  800997:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  80099e:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  8009a5:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8009ac:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8009b3:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8009ba:	84 c0                	test   %al,%al
  8009bc:	74 20                	je     8009de <cprintf+0x52>
  8009be:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8009c2:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8009c6:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8009ca:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8009ce:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8009d2:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8009d6:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8009da:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8009de:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  8009e5:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  8009ec:	00 00 00 
  8009ef:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8009f6:	00 00 00 
  8009f9:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8009fd:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800a04:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800a0b:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800a12:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800a19:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800a20:	48 8b 0a             	mov    (%rdx),%rcx
  800a23:	48 89 08             	mov    %rcx,(%rax)
  800a26:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800a2a:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800a2e:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800a32:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800a36:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  800a3d:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800a44:	48 89 d6             	mov    %rdx,%rsi
  800a47:	48 89 c7             	mov    %rax,%rdi
  800a4a:	48 b8 e0 08 80 00 00 	movabs $0x8008e0,%rax
  800a51:	00 00 00 
  800a54:	ff d0                	callq  *%rax
  800a56:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  800a5c:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  800a62:	c9                   	leaveq 
  800a63:	c3                   	retq   

0000000000800a64 <printnum>:
  800a64:	55                   	push   %rbp
  800a65:	48 89 e5             	mov    %rsp,%rbp
  800a68:	53                   	push   %rbx
  800a69:	48 83 ec 38          	sub    $0x38,%rsp
  800a6d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800a71:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800a75:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  800a79:	89 4d d4             	mov    %ecx,-0x2c(%rbp)
  800a7c:	44 89 45 d0          	mov    %r8d,-0x30(%rbp)
  800a80:	44 89 4d cc          	mov    %r9d,-0x34(%rbp)
  800a84:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  800a87:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  800a8b:	77 3b                	ja     800ac8 <printnum+0x64>
  800a8d:	8b 45 d0             	mov    -0x30(%rbp),%eax
  800a90:	44 8d 40 ff          	lea    -0x1(%rax),%r8d
  800a94:	8b 5d d4             	mov    -0x2c(%rbp),%ebx
  800a97:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800a9b:	ba 00 00 00 00       	mov    $0x0,%edx
  800aa0:	48 f7 f3             	div    %rbx
  800aa3:	48 89 c2             	mov    %rax,%rdx
  800aa6:	8b 7d cc             	mov    -0x34(%rbp),%edi
  800aa9:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  800aac:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
  800ab0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ab4:	41 89 f9             	mov    %edi,%r9d
  800ab7:	48 89 c7             	mov    %rax,%rdi
  800aba:	48 b8 64 0a 80 00 00 	movabs $0x800a64,%rax
  800ac1:	00 00 00 
  800ac4:	ff d0                	callq  *%rax
  800ac6:	eb 1e                	jmp    800ae6 <printnum+0x82>
  800ac8:	eb 12                	jmp    800adc <printnum+0x78>
  800aca:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  800ace:	8b 55 cc             	mov    -0x34(%rbp),%edx
  800ad1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ad5:	48 89 ce             	mov    %rcx,%rsi
  800ad8:	89 d7                	mov    %edx,%edi
  800ada:	ff d0                	callq  *%rax
  800adc:	83 6d d0 01          	subl   $0x1,-0x30(%rbp)
  800ae0:	83 7d d0 00          	cmpl   $0x0,-0x30(%rbp)
  800ae4:	7f e4                	jg     800aca <printnum+0x66>
  800ae6:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  800ae9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800aed:	ba 00 00 00 00       	mov    $0x0,%edx
  800af2:	48 f7 f1             	div    %rcx
  800af5:	48 89 d0             	mov    %rdx,%rax
  800af8:	48 ba 30 53 80 00 00 	movabs $0x805330,%rdx
  800aff:	00 00 00 
  800b02:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
  800b06:	0f be d0             	movsbl %al,%edx
  800b09:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  800b0d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b11:	48 89 ce             	mov    %rcx,%rsi
  800b14:	89 d7                	mov    %edx,%edi
  800b16:	ff d0                	callq  *%rax
  800b18:	48 83 c4 38          	add    $0x38,%rsp
  800b1c:	5b                   	pop    %rbx
  800b1d:	5d                   	pop    %rbp
  800b1e:	c3                   	retq   

0000000000800b1f <getuint>:
  800b1f:	55                   	push   %rbp
  800b20:	48 89 e5             	mov    %rsp,%rbp
  800b23:	48 83 ec 1c          	sub    $0x1c,%rsp
  800b27:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800b2b:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800b2e:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800b32:	7e 52                	jle    800b86 <getuint+0x67>
  800b34:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b38:	8b 00                	mov    (%rax),%eax
  800b3a:	83 f8 30             	cmp    $0x30,%eax
  800b3d:	73 24                	jae    800b63 <getuint+0x44>
  800b3f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b43:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800b47:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b4b:	8b 00                	mov    (%rax),%eax
  800b4d:	89 c0                	mov    %eax,%eax
  800b4f:	48 01 d0             	add    %rdx,%rax
  800b52:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b56:	8b 12                	mov    (%rdx),%edx
  800b58:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800b5b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b5f:	89 0a                	mov    %ecx,(%rdx)
  800b61:	eb 17                	jmp    800b7a <getuint+0x5b>
  800b63:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b67:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800b6b:	48 89 d0             	mov    %rdx,%rax
  800b6e:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800b72:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b76:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800b7a:	48 8b 00             	mov    (%rax),%rax
  800b7d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800b81:	e9 a3 00 00 00       	jmpq   800c29 <getuint+0x10a>
  800b86:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800b8a:	74 4f                	je     800bdb <getuint+0xbc>
  800b8c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b90:	8b 00                	mov    (%rax),%eax
  800b92:	83 f8 30             	cmp    $0x30,%eax
  800b95:	73 24                	jae    800bbb <getuint+0x9c>
  800b97:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b9b:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800b9f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ba3:	8b 00                	mov    (%rax),%eax
  800ba5:	89 c0                	mov    %eax,%eax
  800ba7:	48 01 d0             	add    %rdx,%rax
  800baa:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800bae:	8b 12                	mov    (%rdx),%edx
  800bb0:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800bb3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800bb7:	89 0a                	mov    %ecx,(%rdx)
  800bb9:	eb 17                	jmp    800bd2 <getuint+0xb3>
  800bbb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800bbf:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800bc3:	48 89 d0             	mov    %rdx,%rax
  800bc6:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800bca:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800bce:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800bd2:	48 8b 00             	mov    (%rax),%rax
  800bd5:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800bd9:	eb 4e                	jmp    800c29 <getuint+0x10a>
  800bdb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800bdf:	8b 00                	mov    (%rax),%eax
  800be1:	83 f8 30             	cmp    $0x30,%eax
  800be4:	73 24                	jae    800c0a <getuint+0xeb>
  800be6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800bea:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800bee:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800bf2:	8b 00                	mov    (%rax),%eax
  800bf4:	89 c0                	mov    %eax,%eax
  800bf6:	48 01 d0             	add    %rdx,%rax
  800bf9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800bfd:	8b 12                	mov    (%rdx),%edx
  800bff:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800c02:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800c06:	89 0a                	mov    %ecx,(%rdx)
  800c08:	eb 17                	jmp    800c21 <getuint+0x102>
  800c0a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c0e:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800c12:	48 89 d0             	mov    %rdx,%rax
  800c15:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800c19:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800c1d:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800c21:	8b 00                	mov    (%rax),%eax
  800c23:	89 c0                	mov    %eax,%eax
  800c25:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800c29:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800c2d:	c9                   	leaveq 
  800c2e:	c3                   	retq   

0000000000800c2f <getint>:
  800c2f:	55                   	push   %rbp
  800c30:	48 89 e5             	mov    %rsp,%rbp
  800c33:	48 83 ec 1c          	sub    $0x1c,%rsp
  800c37:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800c3b:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800c3e:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800c42:	7e 52                	jle    800c96 <getint+0x67>
  800c44:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c48:	8b 00                	mov    (%rax),%eax
  800c4a:	83 f8 30             	cmp    $0x30,%eax
  800c4d:	73 24                	jae    800c73 <getint+0x44>
  800c4f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c53:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800c57:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c5b:	8b 00                	mov    (%rax),%eax
  800c5d:	89 c0                	mov    %eax,%eax
  800c5f:	48 01 d0             	add    %rdx,%rax
  800c62:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800c66:	8b 12                	mov    (%rdx),%edx
  800c68:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800c6b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800c6f:	89 0a                	mov    %ecx,(%rdx)
  800c71:	eb 17                	jmp    800c8a <getint+0x5b>
  800c73:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c77:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800c7b:	48 89 d0             	mov    %rdx,%rax
  800c7e:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800c82:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800c86:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800c8a:	48 8b 00             	mov    (%rax),%rax
  800c8d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800c91:	e9 a3 00 00 00       	jmpq   800d39 <getint+0x10a>
  800c96:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800c9a:	74 4f                	je     800ceb <getint+0xbc>
  800c9c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ca0:	8b 00                	mov    (%rax),%eax
  800ca2:	83 f8 30             	cmp    $0x30,%eax
  800ca5:	73 24                	jae    800ccb <getint+0x9c>
  800ca7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800cab:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800caf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800cb3:	8b 00                	mov    (%rax),%eax
  800cb5:	89 c0                	mov    %eax,%eax
  800cb7:	48 01 d0             	add    %rdx,%rax
  800cba:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800cbe:	8b 12                	mov    (%rdx),%edx
  800cc0:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800cc3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800cc7:	89 0a                	mov    %ecx,(%rdx)
  800cc9:	eb 17                	jmp    800ce2 <getint+0xb3>
  800ccb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ccf:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800cd3:	48 89 d0             	mov    %rdx,%rax
  800cd6:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800cda:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800cde:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800ce2:	48 8b 00             	mov    (%rax),%rax
  800ce5:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800ce9:	eb 4e                	jmp    800d39 <getint+0x10a>
  800ceb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800cef:	8b 00                	mov    (%rax),%eax
  800cf1:	83 f8 30             	cmp    $0x30,%eax
  800cf4:	73 24                	jae    800d1a <getint+0xeb>
  800cf6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800cfa:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800cfe:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800d02:	8b 00                	mov    (%rax),%eax
  800d04:	89 c0                	mov    %eax,%eax
  800d06:	48 01 d0             	add    %rdx,%rax
  800d09:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800d0d:	8b 12                	mov    (%rdx),%edx
  800d0f:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800d12:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800d16:	89 0a                	mov    %ecx,(%rdx)
  800d18:	eb 17                	jmp    800d31 <getint+0x102>
  800d1a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800d1e:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800d22:	48 89 d0             	mov    %rdx,%rax
  800d25:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800d29:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800d2d:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800d31:	8b 00                	mov    (%rax),%eax
  800d33:	48 98                	cltq   
  800d35:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800d39:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800d3d:	c9                   	leaveq 
  800d3e:	c3                   	retq   

0000000000800d3f <vprintfmt>:
  800d3f:	55                   	push   %rbp
  800d40:	48 89 e5             	mov    %rsp,%rbp
  800d43:	41 54                	push   %r12
  800d45:	53                   	push   %rbx
  800d46:	48 83 ec 60          	sub    $0x60,%rsp
  800d4a:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  800d4e:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  800d52:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800d56:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  800d5a:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800d5e:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  800d62:	48 8b 0a             	mov    (%rdx),%rcx
  800d65:	48 89 08             	mov    %rcx,(%rax)
  800d68:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800d6c:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800d70:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800d74:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800d78:	eb 17                	jmp    800d91 <vprintfmt+0x52>
  800d7a:	85 db                	test   %ebx,%ebx
  800d7c:	0f 84 cc 04 00 00    	je     80124e <vprintfmt+0x50f>
  800d82:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d86:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d8a:	48 89 d6             	mov    %rdx,%rsi
  800d8d:	89 df                	mov    %ebx,%edi
  800d8f:	ff d0                	callq  *%rax
  800d91:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800d95:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800d99:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800d9d:	0f b6 00             	movzbl (%rax),%eax
  800da0:	0f b6 d8             	movzbl %al,%ebx
  800da3:	83 fb 25             	cmp    $0x25,%ebx
  800da6:	75 d2                	jne    800d7a <vprintfmt+0x3b>
  800da8:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  800dac:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  800db3:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800dba:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800dc1:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  800dc8:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800dcc:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800dd0:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800dd4:	0f b6 00             	movzbl (%rax),%eax
  800dd7:	0f b6 d8             	movzbl %al,%ebx
  800dda:	8d 43 dd             	lea    -0x23(%rbx),%eax
  800ddd:	83 f8 55             	cmp    $0x55,%eax
  800de0:	0f 87 34 04 00 00    	ja     80121a <vprintfmt+0x4db>
  800de6:	89 c0                	mov    %eax,%eax
  800de8:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800def:	00 
  800df0:	48 b8 58 53 80 00 00 	movabs $0x805358,%rax
  800df7:	00 00 00 
  800dfa:	48 01 d0             	add    %rdx,%rax
  800dfd:	48 8b 00             	mov    (%rax),%rax
  800e00:	ff e0                	jmpq   *%rax
  800e02:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  800e06:	eb c0                	jmp    800dc8 <vprintfmt+0x89>
  800e08:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  800e0c:	eb ba                	jmp    800dc8 <vprintfmt+0x89>
  800e0e:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  800e15:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800e18:	89 d0                	mov    %edx,%eax
  800e1a:	c1 e0 02             	shl    $0x2,%eax
  800e1d:	01 d0                	add    %edx,%eax
  800e1f:	01 c0                	add    %eax,%eax
  800e21:	01 d8                	add    %ebx,%eax
  800e23:	83 e8 30             	sub    $0x30,%eax
  800e26:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800e29:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800e2d:	0f b6 00             	movzbl (%rax),%eax
  800e30:	0f be d8             	movsbl %al,%ebx
  800e33:	83 fb 2f             	cmp    $0x2f,%ebx
  800e36:	7e 0c                	jle    800e44 <vprintfmt+0x105>
  800e38:	83 fb 39             	cmp    $0x39,%ebx
  800e3b:	7f 07                	jg     800e44 <vprintfmt+0x105>
  800e3d:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  800e42:	eb d1                	jmp    800e15 <vprintfmt+0xd6>
  800e44:	eb 58                	jmp    800e9e <vprintfmt+0x15f>
  800e46:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800e49:	83 f8 30             	cmp    $0x30,%eax
  800e4c:	73 17                	jae    800e65 <vprintfmt+0x126>
  800e4e:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800e52:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800e55:	89 c0                	mov    %eax,%eax
  800e57:	48 01 d0             	add    %rdx,%rax
  800e5a:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800e5d:	83 c2 08             	add    $0x8,%edx
  800e60:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800e63:	eb 0f                	jmp    800e74 <vprintfmt+0x135>
  800e65:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800e69:	48 89 d0             	mov    %rdx,%rax
  800e6c:	48 83 c2 08          	add    $0x8,%rdx
  800e70:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800e74:	8b 00                	mov    (%rax),%eax
  800e76:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800e79:	eb 23                	jmp    800e9e <vprintfmt+0x15f>
  800e7b:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800e7f:	79 0c                	jns    800e8d <vprintfmt+0x14e>
  800e81:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  800e88:	e9 3b ff ff ff       	jmpq   800dc8 <vprintfmt+0x89>
  800e8d:	e9 36 ff ff ff       	jmpq   800dc8 <vprintfmt+0x89>
  800e92:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  800e99:	e9 2a ff ff ff       	jmpq   800dc8 <vprintfmt+0x89>
  800e9e:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800ea2:	79 12                	jns    800eb6 <vprintfmt+0x177>
  800ea4:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800ea7:	89 45 dc             	mov    %eax,-0x24(%rbp)
  800eaa:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800eb1:	e9 12 ff ff ff       	jmpq   800dc8 <vprintfmt+0x89>
  800eb6:	e9 0d ff ff ff       	jmpq   800dc8 <vprintfmt+0x89>
  800ebb:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  800ebf:	e9 04 ff ff ff       	jmpq   800dc8 <vprintfmt+0x89>
  800ec4:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800ec7:	83 f8 30             	cmp    $0x30,%eax
  800eca:	73 17                	jae    800ee3 <vprintfmt+0x1a4>
  800ecc:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800ed0:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800ed3:	89 c0                	mov    %eax,%eax
  800ed5:	48 01 d0             	add    %rdx,%rax
  800ed8:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800edb:	83 c2 08             	add    $0x8,%edx
  800ede:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800ee1:	eb 0f                	jmp    800ef2 <vprintfmt+0x1b3>
  800ee3:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800ee7:	48 89 d0             	mov    %rdx,%rax
  800eea:	48 83 c2 08          	add    $0x8,%rdx
  800eee:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800ef2:	8b 10                	mov    (%rax),%edx
  800ef4:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800ef8:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800efc:	48 89 ce             	mov    %rcx,%rsi
  800eff:	89 d7                	mov    %edx,%edi
  800f01:	ff d0                	callq  *%rax
  800f03:	e9 40 03 00 00       	jmpq   801248 <vprintfmt+0x509>
  800f08:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800f0b:	83 f8 30             	cmp    $0x30,%eax
  800f0e:	73 17                	jae    800f27 <vprintfmt+0x1e8>
  800f10:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800f14:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800f17:	89 c0                	mov    %eax,%eax
  800f19:	48 01 d0             	add    %rdx,%rax
  800f1c:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800f1f:	83 c2 08             	add    $0x8,%edx
  800f22:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800f25:	eb 0f                	jmp    800f36 <vprintfmt+0x1f7>
  800f27:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800f2b:	48 89 d0             	mov    %rdx,%rax
  800f2e:	48 83 c2 08          	add    $0x8,%rdx
  800f32:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800f36:	8b 18                	mov    (%rax),%ebx
  800f38:	85 db                	test   %ebx,%ebx
  800f3a:	79 02                	jns    800f3e <vprintfmt+0x1ff>
  800f3c:	f7 db                	neg    %ebx
  800f3e:	83 fb 15             	cmp    $0x15,%ebx
  800f41:	7f 16                	jg     800f59 <vprintfmt+0x21a>
  800f43:	48 b8 80 52 80 00 00 	movabs $0x805280,%rax
  800f4a:	00 00 00 
  800f4d:	48 63 d3             	movslq %ebx,%rdx
  800f50:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800f54:	4d 85 e4             	test   %r12,%r12
  800f57:	75 2e                	jne    800f87 <vprintfmt+0x248>
  800f59:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800f5d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800f61:	89 d9                	mov    %ebx,%ecx
  800f63:	48 ba 41 53 80 00 00 	movabs $0x805341,%rdx
  800f6a:	00 00 00 
  800f6d:	48 89 c7             	mov    %rax,%rdi
  800f70:	b8 00 00 00 00       	mov    $0x0,%eax
  800f75:	49 b8 57 12 80 00 00 	movabs $0x801257,%r8
  800f7c:	00 00 00 
  800f7f:	41 ff d0             	callq  *%r8
  800f82:	e9 c1 02 00 00       	jmpq   801248 <vprintfmt+0x509>
  800f87:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800f8b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800f8f:	4c 89 e1             	mov    %r12,%rcx
  800f92:	48 ba 4a 53 80 00 00 	movabs $0x80534a,%rdx
  800f99:	00 00 00 
  800f9c:	48 89 c7             	mov    %rax,%rdi
  800f9f:	b8 00 00 00 00       	mov    $0x0,%eax
  800fa4:	49 b8 57 12 80 00 00 	movabs $0x801257,%r8
  800fab:	00 00 00 
  800fae:	41 ff d0             	callq  *%r8
  800fb1:	e9 92 02 00 00       	jmpq   801248 <vprintfmt+0x509>
  800fb6:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800fb9:	83 f8 30             	cmp    $0x30,%eax
  800fbc:	73 17                	jae    800fd5 <vprintfmt+0x296>
  800fbe:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800fc2:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800fc5:	89 c0                	mov    %eax,%eax
  800fc7:	48 01 d0             	add    %rdx,%rax
  800fca:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800fcd:	83 c2 08             	add    $0x8,%edx
  800fd0:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800fd3:	eb 0f                	jmp    800fe4 <vprintfmt+0x2a5>
  800fd5:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800fd9:	48 89 d0             	mov    %rdx,%rax
  800fdc:	48 83 c2 08          	add    $0x8,%rdx
  800fe0:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800fe4:	4c 8b 20             	mov    (%rax),%r12
  800fe7:	4d 85 e4             	test   %r12,%r12
  800fea:	75 0a                	jne    800ff6 <vprintfmt+0x2b7>
  800fec:	49 bc 4d 53 80 00 00 	movabs $0x80534d,%r12
  800ff3:	00 00 00 
  800ff6:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800ffa:	7e 3f                	jle    80103b <vprintfmt+0x2fc>
  800ffc:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  801000:	74 39                	je     80103b <vprintfmt+0x2fc>
  801002:	8b 45 d8             	mov    -0x28(%rbp),%eax
  801005:	48 98                	cltq   
  801007:	48 89 c6             	mov    %rax,%rsi
  80100a:	4c 89 e7             	mov    %r12,%rdi
  80100d:	48 b8 03 15 80 00 00 	movabs $0x801503,%rax
  801014:	00 00 00 
  801017:	ff d0                	callq  *%rax
  801019:	29 45 dc             	sub    %eax,-0x24(%rbp)
  80101c:	eb 17                	jmp    801035 <vprintfmt+0x2f6>
  80101e:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  801022:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  801026:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80102a:	48 89 ce             	mov    %rcx,%rsi
  80102d:	89 d7                	mov    %edx,%edi
  80102f:	ff d0                	callq  *%rax
  801031:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  801035:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  801039:	7f e3                	jg     80101e <vprintfmt+0x2df>
  80103b:	eb 37                	jmp    801074 <vprintfmt+0x335>
  80103d:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  801041:	74 1e                	je     801061 <vprintfmt+0x322>
  801043:	83 fb 1f             	cmp    $0x1f,%ebx
  801046:	7e 05                	jle    80104d <vprintfmt+0x30e>
  801048:	83 fb 7e             	cmp    $0x7e,%ebx
  80104b:	7e 14                	jle    801061 <vprintfmt+0x322>
  80104d:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801051:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801055:	48 89 d6             	mov    %rdx,%rsi
  801058:	bf 3f 00 00 00       	mov    $0x3f,%edi
  80105d:	ff d0                	callq  *%rax
  80105f:	eb 0f                	jmp    801070 <vprintfmt+0x331>
  801061:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801065:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801069:	48 89 d6             	mov    %rdx,%rsi
  80106c:	89 df                	mov    %ebx,%edi
  80106e:	ff d0                	callq  *%rax
  801070:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  801074:	4c 89 e0             	mov    %r12,%rax
  801077:	4c 8d 60 01          	lea    0x1(%rax),%r12
  80107b:	0f b6 00             	movzbl (%rax),%eax
  80107e:	0f be d8             	movsbl %al,%ebx
  801081:	85 db                	test   %ebx,%ebx
  801083:	74 10                	je     801095 <vprintfmt+0x356>
  801085:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801089:	78 b2                	js     80103d <vprintfmt+0x2fe>
  80108b:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  80108f:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801093:	79 a8                	jns    80103d <vprintfmt+0x2fe>
  801095:	eb 16                	jmp    8010ad <vprintfmt+0x36e>
  801097:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  80109b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80109f:	48 89 d6             	mov    %rdx,%rsi
  8010a2:	bf 20 00 00 00       	mov    $0x20,%edi
  8010a7:	ff d0                	callq  *%rax
  8010a9:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  8010ad:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8010b1:	7f e4                	jg     801097 <vprintfmt+0x358>
  8010b3:	e9 90 01 00 00       	jmpq   801248 <vprintfmt+0x509>
  8010b8:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8010bc:	be 03 00 00 00       	mov    $0x3,%esi
  8010c1:	48 89 c7             	mov    %rax,%rdi
  8010c4:	48 b8 2f 0c 80 00 00 	movabs $0x800c2f,%rax
  8010cb:	00 00 00 
  8010ce:	ff d0                	callq  *%rax
  8010d0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8010d4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010d8:	48 85 c0             	test   %rax,%rax
  8010db:	79 1d                	jns    8010fa <vprintfmt+0x3bb>
  8010dd:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8010e1:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8010e5:	48 89 d6             	mov    %rdx,%rsi
  8010e8:	bf 2d 00 00 00       	mov    $0x2d,%edi
  8010ed:	ff d0                	callq  *%rax
  8010ef:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010f3:	48 f7 d8             	neg    %rax
  8010f6:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8010fa:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  801101:	e9 d5 00 00 00       	jmpq   8011db <vprintfmt+0x49c>
  801106:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  80110a:	be 03 00 00 00       	mov    $0x3,%esi
  80110f:	48 89 c7             	mov    %rax,%rdi
  801112:	48 b8 1f 0b 80 00 00 	movabs $0x800b1f,%rax
  801119:	00 00 00 
  80111c:	ff d0                	callq  *%rax
  80111e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801122:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  801129:	e9 ad 00 00 00       	jmpq   8011db <vprintfmt+0x49c>
  80112e:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  801132:	be 03 00 00 00       	mov    $0x3,%esi
  801137:	48 89 c7             	mov    %rax,%rdi
  80113a:	48 b8 1f 0b 80 00 00 	movabs $0x800b1f,%rax
  801141:	00 00 00 
  801144:	ff d0                	callq  *%rax
  801146:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80114a:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  801151:	e9 85 00 00 00       	jmpq   8011db <vprintfmt+0x49c>
  801156:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  80115a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80115e:	48 89 d6             	mov    %rdx,%rsi
  801161:	bf 30 00 00 00       	mov    $0x30,%edi
  801166:	ff d0                	callq  *%rax
  801168:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  80116c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801170:	48 89 d6             	mov    %rdx,%rsi
  801173:	bf 78 00 00 00       	mov    $0x78,%edi
  801178:	ff d0                	callq  *%rax
  80117a:	8b 45 b8             	mov    -0x48(%rbp),%eax
  80117d:	83 f8 30             	cmp    $0x30,%eax
  801180:	73 17                	jae    801199 <vprintfmt+0x45a>
  801182:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  801186:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801189:	89 c0                	mov    %eax,%eax
  80118b:	48 01 d0             	add    %rdx,%rax
  80118e:	8b 55 b8             	mov    -0x48(%rbp),%edx
  801191:	83 c2 08             	add    $0x8,%edx
  801194:	89 55 b8             	mov    %edx,-0x48(%rbp)
  801197:	eb 0f                	jmp    8011a8 <vprintfmt+0x469>
  801199:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  80119d:	48 89 d0             	mov    %rdx,%rax
  8011a0:	48 83 c2 08          	add    $0x8,%rdx
  8011a4:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8011a8:	48 8b 00             	mov    (%rax),%rax
  8011ab:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8011af:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  8011b6:	eb 23                	jmp    8011db <vprintfmt+0x49c>
  8011b8:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8011bc:	be 03 00 00 00       	mov    $0x3,%esi
  8011c1:	48 89 c7             	mov    %rax,%rdi
  8011c4:	48 b8 1f 0b 80 00 00 	movabs $0x800b1f,%rax
  8011cb:	00 00 00 
  8011ce:	ff d0                	callq  *%rax
  8011d0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8011d4:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  8011db:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  8011e0:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  8011e3:	8b 7d dc             	mov    -0x24(%rbp),%edi
  8011e6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8011ea:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  8011ee:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8011f2:	45 89 c1             	mov    %r8d,%r9d
  8011f5:	41 89 f8             	mov    %edi,%r8d
  8011f8:	48 89 c7             	mov    %rax,%rdi
  8011fb:	48 b8 64 0a 80 00 00 	movabs $0x800a64,%rax
  801202:	00 00 00 
  801205:	ff d0                	callq  *%rax
  801207:	eb 3f                	jmp    801248 <vprintfmt+0x509>
  801209:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  80120d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801211:	48 89 d6             	mov    %rdx,%rsi
  801214:	89 df                	mov    %ebx,%edi
  801216:	ff d0                	callq  *%rax
  801218:	eb 2e                	jmp    801248 <vprintfmt+0x509>
  80121a:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  80121e:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801222:	48 89 d6             	mov    %rdx,%rsi
  801225:	bf 25 00 00 00       	mov    $0x25,%edi
  80122a:	ff d0                	callq  *%rax
  80122c:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  801231:	eb 05                	jmp    801238 <vprintfmt+0x4f9>
  801233:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  801238:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  80123c:	48 83 e8 01          	sub    $0x1,%rax
  801240:	0f b6 00             	movzbl (%rax),%eax
  801243:	3c 25                	cmp    $0x25,%al
  801245:	75 ec                	jne    801233 <vprintfmt+0x4f4>
  801247:	90                   	nop
  801248:	90                   	nop
  801249:	e9 43 fb ff ff       	jmpq   800d91 <vprintfmt+0x52>
  80124e:	48 83 c4 60          	add    $0x60,%rsp
  801252:	5b                   	pop    %rbx
  801253:	41 5c                	pop    %r12
  801255:	5d                   	pop    %rbp
  801256:	c3                   	retq   

0000000000801257 <printfmt>:
  801257:	55                   	push   %rbp
  801258:	48 89 e5             	mov    %rsp,%rbp
  80125b:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  801262:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  801269:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  801270:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  801277:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  80127e:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  801285:	84 c0                	test   %al,%al
  801287:	74 20                	je     8012a9 <printfmt+0x52>
  801289:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  80128d:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  801291:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  801295:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  801299:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  80129d:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8012a1:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8012a5:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8012a9:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  8012b0:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  8012b7:	00 00 00 
  8012ba:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  8012c1:	00 00 00 
  8012c4:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8012c8:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8012cf:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8012d6:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  8012dd:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  8012e4:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  8012eb:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  8012f2:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  8012f9:	48 89 c7             	mov    %rax,%rdi
  8012fc:	48 b8 3f 0d 80 00 00 	movabs $0x800d3f,%rax
  801303:	00 00 00 
  801306:	ff d0                	callq  *%rax
  801308:	c9                   	leaveq 
  801309:	c3                   	retq   

000000000080130a <sprintputch>:
  80130a:	55                   	push   %rbp
  80130b:	48 89 e5             	mov    %rsp,%rbp
  80130e:	48 83 ec 10          	sub    $0x10,%rsp
  801312:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801315:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801319:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80131d:	8b 40 10             	mov    0x10(%rax),%eax
  801320:	8d 50 01             	lea    0x1(%rax),%edx
  801323:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801327:	89 50 10             	mov    %edx,0x10(%rax)
  80132a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80132e:	48 8b 10             	mov    (%rax),%rdx
  801331:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801335:	48 8b 40 08          	mov    0x8(%rax),%rax
  801339:	48 39 c2             	cmp    %rax,%rdx
  80133c:	73 17                	jae    801355 <sprintputch+0x4b>
  80133e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801342:	48 8b 00             	mov    (%rax),%rax
  801345:	48 8d 48 01          	lea    0x1(%rax),%rcx
  801349:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80134d:	48 89 0a             	mov    %rcx,(%rdx)
  801350:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801353:	88 10                	mov    %dl,(%rax)
  801355:	c9                   	leaveq 
  801356:	c3                   	retq   

0000000000801357 <vsnprintf>:
  801357:	55                   	push   %rbp
  801358:	48 89 e5             	mov    %rsp,%rbp
  80135b:	48 83 ec 50          	sub    $0x50,%rsp
  80135f:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  801363:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  801366:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  80136a:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  80136e:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  801372:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  801376:	48 8b 0a             	mov    (%rdx),%rcx
  801379:	48 89 08             	mov    %rcx,(%rax)
  80137c:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  801380:	48 89 48 08          	mov    %rcx,0x8(%rax)
  801384:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801388:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80138c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801390:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  801394:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  801397:	48 98                	cltq   
  801399:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80139d:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8013a1:	48 01 d0             	add    %rdx,%rax
  8013a4:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  8013a8:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  8013af:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  8013b4:	74 06                	je     8013bc <vsnprintf+0x65>
  8013b6:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  8013ba:	7f 07                	jg     8013c3 <vsnprintf+0x6c>
  8013bc:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8013c1:	eb 2f                	jmp    8013f2 <vsnprintf+0x9b>
  8013c3:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  8013c7:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  8013cb:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  8013cf:	48 89 c6             	mov    %rax,%rsi
  8013d2:	48 bf 0a 13 80 00 00 	movabs $0x80130a,%rdi
  8013d9:	00 00 00 
  8013dc:	48 b8 3f 0d 80 00 00 	movabs $0x800d3f,%rax
  8013e3:	00 00 00 
  8013e6:	ff d0                	callq  *%rax
  8013e8:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8013ec:	c6 00 00             	movb   $0x0,(%rax)
  8013ef:	8b 45 e0             	mov    -0x20(%rbp),%eax
  8013f2:	c9                   	leaveq 
  8013f3:	c3                   	retq   

00000000008013f4 <snprintf>:
  8013f4:	55                   	push   %rbp
  8013f5:	48 89 e5             	mov    %rsp,%rbp
  8013f8:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  8013ff:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  801406:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  80140c:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  801413:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  80141a:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  801421:	84 c0                	test   %al,%al
  801423:	74 20                	je     801445 <snprintf+0x51>
  801425:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  801429:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80142d:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  801431:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  801435:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  801439:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  80143d:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  801441:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  801445:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  80144c:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  801453:	00 00 00 
  801456:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  80145d:	00 00 00 
  801460:	48 8d 45 10          	lea    0x10(%rbp),%rax
  801464:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  80146b:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  801472:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  801479:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  801480:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  801487:	48 8b 0a             	mov    (%rdx),%rcx
  80148a:	48 89 08             	mov    %rcx,(%rax)
  80148d:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  801491:	48 89 48 08          	mov    %rcx,0x8(%rax)
  801495:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801499:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80149d:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  8014a4:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  8014ab:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  8014b1:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8014b8:	48 89 c7             	mov    %rax,%rdi
  8014bb:	48 b8 57 13 80 00 00 	movabs $0x801357,%rax
  8014c2:	00 00 00 
  8014c5:	ff d0                	callq  *%rax
  8014c7:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  8014cd:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  8014d3:	c9                   	leaveq 
  8014d4:	c3                   	retq   

00000000008014d5 <strlen>:
  8014d5:	55                   	push   %rbp
  8014d6:	48 89 e5             	mov    %rsp,%rbp
  8014d9:	48 83 ec 18          	sub    $0x18,%rsp
  8014dd:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8014e1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8014e8:	eb 09                	jmp    8014f3 <strlen+0x1e>
  8014ea:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8014ee:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8014f3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014f7:	0f b6 00             	movzbl (%rax),%eax
  8014fa:	84 c0                	test   %al,%al
  8014fc:	75 ec                	jne    8014ea <strlen+0x15>
  8014fe:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801501:	c9                   	leaveq 
  801502:	c3                   	retq   

0000000000801503 <strnlen>:
  801503:	55                   	push   %rbp
  801504:	48 89 e5             	mov    %rsp,%rbp
  801507:	48 83 ec 20          	sub    $0x20,%rsp
  80150b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80150f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801513:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80151a:	eb 0e                	jmp    80152a <strnlen+0x27>
  80151c:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801520:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801525:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  80152a:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80152f:	74 0b                	je     80153c <strnlen+0x39>
  801531:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801535:	0f b6 00             	movzbl (%rax),%eax
  801538:	84 c0                	test   %al,%al
  80153a:	75 e0                	jne    80151c <strnlen+0x19>
  80153c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80153f:	c9                   	leaveq 
  801540:	c3                   	retq   

0000000000801541 <strcpy>:
  801541:	55                   	push   %rbp
  801542:	48 89 e5             	mov    %rsp,%rbp
  801545:	48 83 ec 20          	sub    $0x20,%rsp
  801549:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80154d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801551:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801555:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801559:	90                   	nop
  80155a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80155e:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801562:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801566:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80156a:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  80156e:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  801572:	0f b6 12             	movzbl (%rdx),%edx
  801575:	88 10                	mov    %dl,(%rax)
  801577:	0f b6 00             	movzbl (%rax),%eax
  80157a:	84 c0                	test   %al,%al
  80157c:	75 dc                	jne    80155a <strcpy+0x19>
  80157e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801582:	c9                   	leaveq 
  801583:	c3                   	retq   

0000000000801584 <strcat>:
  801584:	55                   	push   %rbp
  801585:	48 89 e5             	mov    %rsp,%rbp
  801588:	48 83 ec 20          	sub    $0x20,%rsp
  80158c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801590:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801594:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801598:	48 89 c7             	mov    %rax,%rdi
  80159b:	48 b8 d5 14 80 00 00 	movabs $0x8014d5,%rax
  8015a2:	00 00 00 
  8015a5:	ff d0                	callq  *%rax
  8015a7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8015aa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8015ad:	48 63 d0             	movslq %eax,%rdx
  8015b0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8015b4:	48 01 c2             	add    %rax,%rdx
  8015b7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8015bb:	48 89 c6             	mov    %rax,%rsi
  8015be:	48 89 d7             	mov    %rdx,%rdi
  8015c1:	48 b8 41 15 80 00 00 	movabs $0x801541,%rax
  8015c8:	00 00 00 
  8015cb:	ff d0                	callq  *%rax
  8015cd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8015d1:	c9                   	leaveq 
  8015d2:	c3                   	retq   

00000000008015d3 <strncpy>:
  8015d3:	55                   	push   %rbp
  8015d4:	48 89 e5             	mov    %rsp,%rbp
  8015d7:	48 83 ec 28          	sub    $0x28,%rsp
  8015db:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8015df:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8015e3:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8015e7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8015eb:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8015ef:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8015f6:	00 
  8015f7:	eb 2a                	jmp    801623 <strncpy+0x50>
  8015f9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8015fd:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801601:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801605:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801609:	0f b6 12             	movzbl (%rdx),%edx
  80160c:	88 10                	mov    %dl,(%rax)
  80160e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801612:	0f b6 00             	movzbl (%rax),%eax
  801615:	84 c0                	test   %al,%al
  801617:	74 05                	je     80161e <strncpy+0x4b>
  801619:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  80161e:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801623:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801627:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  80162b:	72 cc                	jb     8015f9 <strncpy+0x26>
  80162d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801631:	c9                   	leaveq 
  801632:	c3                   	retq   

0000000000801633 <strlcpy>:
  801633:	55                   	push   %rbp
  801634:	48 89 e5             	mov    %rsp,%rbp
  801637:	48 83 ec 28          	sub    $0x28,%rsp
  80163b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80163f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801643:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801647:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80164b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80164f:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801654:	74 3d                	je     801693 <strlcpy+0x60>
  801656:	eb 1d                	jmp    801675 <strlcpy+0x42>
  801658:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80165c:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801660:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801664:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801668:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  80166c:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  801670:	0f b6 12             	movzbl (%rdx),%edx
  801673:	88 10                	mov    %dl,(%rax)
  801675:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  80167a:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80167f:	74 0b                	je     80168c <strlcpy+0x59>
  801681:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801685:	0f b6 00             	movzbl (%rax),%eax
  801688:	84 c0                	test   %al,%al
  80168a:	75 cc                	jne    801658 <strlcpy+0x25>
  80168c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801690:	c6 00 00             	movb   $0x0,(%rax)
  801693:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801697:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80169b:	48 29 c2             	sub    %rax,%rdx
  80169e:	48 89 d0             	mov    %rdx,%rax
  8016a1:	c9                   	leaveq 
  8016a2:	c3                   	retq   

00000000008016a3 <strcmp>:
  8016a3:	55                   	push   %rbp
  8016a4:	48 89 e5             	mov    %rsp,%rbp
  8016a7:	48 83 ec 10          	sub    $0x10,%rsp
  8016ab:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8016af:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8016b3:	eb 0a                	jmp    8016bf <strcmp+0x1c>
  8016b5:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8016ba:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8016bf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016c3:	0f b6 00             	movzbl (%rax),%eax
  8016c6:	84 c0                	test   %al,%al
  8016c8:	74 12                	je     8016dc <strcmp+0x39>
  8016ca:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016ce:	0f b6 10             	movzbl (%rax),%edx
  8016d1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8016d5:	0f b6 00             	movzbl (%rax),%eax
  8016d8:	38 c2                	cmp    %al,%dl
  8016da:	74 d9                	je     8016b5 <strcmp+0x12>
  8016dc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016e0:	0f b6 00             	movzbl (%rax),%eax
  8016e3:	0f b6 d0             	movzbl %al,%edx
  8016e6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8016ea:	0f b6 00             	movzbl (%rax),%eax
  8016ed:	0f b6 c0             	movzbl %al,%eax
  8016f0:	29 c2                	sub    %eax,%edx
  8016f2:	89 d0                	mov    %edx,%eax
  8016f4:	c9                   	leaveq 
  8016f5:	c3                   	retq   

00000000008016f6 <strncmp>:
  8016f6:	55                   	push   %rbp
  8016f7:	48 89 e5             	mov    %rsp,%rbp
  8016fa:	48 83 ec 18          	sub    $0x18,%rsp
  8016fe:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801702:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801706:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80170a:	eb 0f                	jmp    80171b <strncmp+0x25>
  80170c:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  801711:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801716:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  80171b:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801720:	74 1d                	je     80173f <strncmp+0x49>
  801722:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801726:	0f b6 00             	movzbl (%rax),%eax
  801729:	84 c0                	test   %al,%al
  80172b:	74 12                	je     80173f <strncmp+0x49>
  80172d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801731:	0f b6 10             	movzbl (%rax),%edx
  801734:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801738:	0f b6 00             	movzbl (%rax),%eax
  80173b:	38 c2                	cmp    %al,%dl
  80173d:	74 cd                	je     80170c <strncmp+0x16>
  80173f:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801744:	75 07                	jne    80174d <strncmp+0x57>
  801746:	b8 00 00 00 00       	mov    $0x0,%eax
  80174b:	eb 18                	jmp    801765 <strncmp+0x6f>
  80174d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801751:	0f b6 00             	movzbl (%rax),%eax
  801754:	0f b6 d0             	movzbl %al,%edx
  801757:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80175b:	0f b6 00             	movzbl (%rax),%eax
  80175e:	0f b6 c0             	movzbl %al,%eax
  801761:	29 c2                	sub    %eax,%edx
  801763:	89 d0                	mov    %edx,%eax
  801765:	c9                   	leaveq 
  801766:	c3                   	retq   

0000000000801767 <strchr>:
  801767:	55                   	push   %rbp
  801768:	48 89 e5             	mov    %rsp,%rbp
  80176b:	48 83 ec 0c          	sub    $0xc,%rsp
  80176f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801773:	89 f0                	mov    %esi,%eax
  801775:	88 45 f4             	mov    %al,-0xc(%rbp)
  801778:	eb 17                	jmp    801791 <strchr+0x2a>
  80177a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80177e:	0f b6 00             	movzbl (%rax),%eax
  801781:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801784:	75 06                	jne    80178c <strchr+0x25>
  801786:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80178a:	eb 15                	jmp    8017a1 <strchr+0x3a>
  80178c:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801791:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801795:	0f b6 00             	movzbl (%rax),%eax
  801798:	84 c0                	test   %al,%al
  80179a:	75 de                	jne    80177a <strchr+0x13>
  80179c:	b8 00 00 00 00       	mov    $0x0,%eax
  8017a1:	c9                   	leaveq 
  8017a2:	c3                   	retq   

00000000008017a3 <strfind>:
  8017a3:	55                   	push   %rbp
  8017a4:	48 89 e5             	mov    %rsp,%rbp
  8017a7:	48 83 ec 0c          	sub    $0xc,%rsp
  8017ab:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8017af:	89 f0                	mov    %esi,%eax
  8017b1:	88 45 f4             	mov    %al,-0xc(%rbp)
  8017b4:	eb 13                	jmp    8017c9 <strfind+0x26>
  8017b6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8017ba:	0f b6 00             	movzbl (%rax),%eax
  8017bd:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8017c0:	75 02                	jne    8017c4 <strfind+0x21>
  8017c2:	eb 10                	jmp    8017d4 <strfind+0x31>
  8017c4:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8017c9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8017cd:	0f b6 00             	movzbl (%rax),%eax
  8017d0:	84 c0                	test   %al,%al
  8017d2:	75 e2                	jne    8017b6 <strfind+0x13>
  8017d4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8017d8:	c9                   	leaveq 
  8017d9:	c3                   	retq   

00000000008017da <memset>:
  8017da:	55                   	push   %rbp
  8017db:	48 89 e5             	mov    %rsp,%rbp
  8017de:	48 83 ec 18          	sub    $0x18,%rsp
  8017e2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8017e6:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8017e9:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8017ed:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8017f2:	75 06                	jne    8017fa <memset+0x20>
  8017f4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8017f8:	eb 69                	jmp    801863 <memset+0x89>
  8017fa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8017fe:	83 e0 03             	and    $0x3,%eax
  801801:	48 85 c0             	test   %rax,%rax
  801804:	75 48                	jne    80184e <memset+0x74>
  801806:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80180a:	83 e0 03             	and    $0x3,%eax
  80180d:	48 85 c0             	test   %rax,%rax
  801810:	75 3c                	jne    80184e <memset+0x74>
  801812:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  801819:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80181c:	c1 e0 18             	shl    $0x18,%eax
  80181f:	89 c2                	mov    %eax,%edx
  801821:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801824:	c1 e0 10             	shl    $0x10,%eax
  801827:	09 c2                	or     %eax,%edx
  801829:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80182c:	c1 e0 08             	shl    $0x8,%eax
  80182f:	09 d0                	or     %edx,%eax
  801831:	09 45 f4             	or     %eax,-0xc(%rbp)
  801834:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801838:	48 c1 e8 02          	shr    $0x2,%rax
  80183c:	48 89 c1             	mov    %rax,%rcx
  80183f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801843:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801846:	48 89 d7             	mov    %rdx,%rdi
  801849:	fc                   	cld    
  80184a:	f3 ab                	rep stos %eax,%es:(%rdi)
  80184c:	eb 11                	jmp    80185f <memset+0x85>
  80184e:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801852:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801855:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801859:	48 89 d7             	mov    %rdx,%rdi
  80185c:	fc                   	cld    
  80185d:	f3 aa                	rep stos %al,%es:(%rdi)
  80185f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801863:	c9                   	leaveq 
  801864:	c3                   	retq   

0000000000801865 <memmove>:
  801865:	55                   	push   %rbp
  801866:	48 89 e5             	mov    %rsp,%rbp
  801869:	48 83 ec 28          	sub    $0x28,%rsp
  80186d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801871:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801875:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801879:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80187d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801881:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801885:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801889:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80188d:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801891:	0f 83 88 00 00 00    	jae    80191f <memmove+0xba>
  801897:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80189b:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80189f:	48 01 d0             	add    %rdx,%rax
  8018a2:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8018a6:	76 77                	jbe    80191f <memmove+0xba>
  8018a8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018ac:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  8018b0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018b4:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  8018b8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8018bc:	83 e0 03             	and    $0x3,%eax
  8018bf:	48 85 c0             	test   %rax,%rax
  8018c2:	75 3b                	jne    8018ff <memmove+0x9a>
  8018c4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8018c8:	83 e0 03             	and    $0x3,%eax
  8018cb:	48 85 c0             	test   %rax,%rax
  8018ce:	75 2f                	jne    8018ff <memmove+0x9a>
  8018d0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018d4:	83 e0 03             	and    $0x3,%eax
  8018d7:	48 85 c0             	test   %rax,%rax
  8018da:	75 23                	jne    8018ff <memmove+0x9a>
  8018dc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8018e0:	48 83 e8 04          	sub    $0x4,%rax
  8018e4:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8018e8:	48 83 ea 04          	sub    $0x4,%rdx
  8018ec:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  8018f0:	48 c1 e9 02          	shr    $0x2,%rcx
  8018f4:	48 89 c7             	mov    %rax,%rdi
  8018f7:	48 89 d6             	mov    %rdx,%rsi
  8018fa:	fd                   	std    
  8018fb:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  8018fd:	eb 1d                	jmp    80191c <memmove+0xb7>
  8018ff:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801903:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801907:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80190b:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  80190f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801913:	48 89 d7             	mov    %rdx,%rdi
  801916:	48 89 c1             	mov    %rax,%rcx
  801919:	fd                   	std    
  80191a:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  80191c:	fc                   	cld    
  80191d:	eb 57                	jmp    801976 <memmove+0x111>
  80191f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801923:	83 e0 03             	and    $0x3,%eax
  801926:	48 85 c0             	test   %rax,%rax
  801929:	75 36                	jne    801961 <memmove+0xfc>
  80192b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80192f:	83 e0 03             	and    $0x3,%eax
  801932:	48 85 c0             	test   %rax,%rax
  801935:	75 2a                	jne    801961 <memmove+0xfc>
  801937:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80193b:	83 e0 03             	and    $0x3,%eax
  80193e:	48 85 c0             	test   %rax,%rax
  801941:	75 1e                	jne    801961 <memmove+0xfc>
  801943:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801947:	48 c1 e8 02          	shr    $0x2,%rax
  80194b:	48 89 c1             	mov    %rax,%rcx
  80194e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801952:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801956:	48 89 c7             	mov    %rax,%rdi
  801959:	48 89 d6             	mov    %rdx,%rsi
  80195c:	fc                   	cld    
  80195d:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  80195f:	eb 15                	jmp    801976 <memmove+0x111>
  801961:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801965:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801969:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  80196d:	48 89 c7             	mov    %rax,%rdi
  801970:	48 89 d6             	mov    %rdx,%rsi
  801973:	fc                   	cld    
  801974:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801976:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80197a:	c9                   	leaveq 
  80197b:	c3                   	retq   

000000000080197c <memcpy>:
  80197c:	55                   	push   %rbp
  80197d:	48 89 e5             	mov    %rsp,%rbp
  801980:	48 83 ec 18          	sub    $0x18,%rsp
  801984:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801988:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80198c:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801990:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801994:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  801998:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80199c:	48 89 ce             	mov    %rcx,%rsi
  80199f:	48 89 c7             	mov    %rax,%rdi
  8019a2:	48 b8 65 18 80 00 00 	movabs $0x801865,%rax
  8019a9:	00 00 00 
  8019ac:	ff d0                	callq  *%rax
  8019ae:	c9                   	leaveq 
  8019af:	c3                   	retq   

00000000008019b0 <memcmp>:
  8019b0:	55                   	push   %rbp
  8019b1:	48 89 e5             	mov    %rsp,%rbp
  8019b4:	48 83 ec 28          	sub    $0x28,%rsp
  8019b8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8019bc:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8019c0:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8019c4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8019c8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8019cc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8019d0:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8019d4:	eb 36                	jmp    801a0c <memcmp+0x5c>
  8019d6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8019da:	0f b6 10             	movzbl (%rax),%edx
  8019dd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8019e1:	0f b6 00             	movzbl (%rax),%eax
  8019e4:	38 c2                	cmp    %al,%dl
  8019e6:	74 1a                	je     801a02 <memcmp+0x52>
  8019e8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8019ec:	0f b6 00             	movzbl (%rax),%eax
  8019ef:	0f b6 d0             	movzbl %al,%edx
  8019f2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8019f6:	0f b6 00             	movzbl (%rax),%eax
  8019f9:	0f b6 c0             	movzbl %al,%eax
  8019fc:	29 c2                	sub    %eax,%edx
  8019fe:	89 d0                	mov    %edx,%eax
  801a00:	eb 20                	jmp    801a22 <memcmp+0x72>
  801a02:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801a07:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801a0c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a10:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801a14:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801a18:	48 85 c0             	test   %rax,%rax
  801a1b:	75 b9                	jne    8019d6 <memcmp+0x26>
  801a1d:	b8 00 00 00 00       	mov    $0x0,%eax
  801a22:	c9                   	leaveq 
  801a23:	c3                   	retq   

0000000000801a24 <memfind>:
  801a24:	55                   	push   %rbp
  801a25:	48 89 e5             	mov    %rsp,%rbp
  801a28:	48 83 ec 28          	sub    $0x28,%rsp
  801a2c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801a30:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  801a33:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801a37:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a3b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801a3f:	48 01 d0             	add    %rdx,%rax
  801a42:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801a46:	eb 15                	jmp    801a5d <memfind+0x39>
  801a48:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801a4c:	0f b6 10             	movzbl (%rax),%edx
  801a4f:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801a52:	38 c2                	cmp    %al,%dl
  801a54:	75 02                	jne    801a58 <memfind+0x34>
  801a56:	eb 0f                	jmp    801a67 <memfind+0x43>
  801a58:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801a5d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801a61:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  801a65:	72 e1                	jb     801a48 <memfind+0x24>
  801a67:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801a6b:	c9                   	leaveq 
  801a6c:	c3                   	retq   

0000000000801a6d <strtol>:
  801a6d:	55                   	push   %rbp
  801a6e:	48 89 e5             	mov    %rsp,%rbp
  801a71:	48 83 ec 34          	sub    $0x34,%rsp
  801a75:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801a79:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801a7d:	89 55 cc             	mov    %edx,-0x34(%rbp)
  801a80:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801a87:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  801a8e:	00 
  801a8f:	eb 05                	jmp    801a96 <strtol+0x29>
  801a91:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801a96:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a9a:	0f b6 00             	movzbl (%rax),%eax
  801a9d:	3c 20                	cmp    $0x20,%al
  801a9f:	74 f0                	je     801a91 <strtol+0x24>
  801aa1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801aa5:	0f b6 00             	movzbl (%rax),%eax
  801aa8:	3c 09                	cmp    $0x9,%al
  801aaa:	74 e5                	je     801a91 <strtol+0x24>
  801aac:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ab0:	0f b6 00             	movzbl (%rax),%eax
  801ab3:	3c 2b                	cmp    $0x2b,%al
  801ab5:	75 07                	jne    801abe <strtol+0x51>
  801ab7:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801abc:	eb 17                	jmp    801ad5 <strtol+0x68>
  801abe:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ac2:	0f b6 00             	movzbl (%rax),%eax
  801ac5:	3c 2d                	cmp    $0x2d,%al
  801ac7:	75 0c                	jne    801ad5 <strtol+0x68>
  801ac9:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801ace:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  801ad5:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801ad9:	74 06                	je     801ae1 <strtol+0x74>
  801adb:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  801adf:	75 28                	jne    801b09 <strtol+0x9c>
  801ae1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ae5:	0f b6 00             	movzbl (%rax),%eax
  801ae8:	3c 30                	cmp    $0x30,%al
  801aea:	75 1d                	jne    801b09 <strtol+0x9c>
  801aec:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801af0:	48 83 c0 01          	add    $0x1,%rax
  801af4:	0f b6 00             	movzbl (%rax),%eax
  801af7:	3c 78                	cmp    $0x78,%al
  801af9:	75 0e                	jne    801b09 <strtol+0x9c>
  801afb:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  801b00:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  801b07:	eb 2c                	jmp    801b35 <strtol+0xc8>
  801b09:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801b0d:	75 19                	jne    801b28 <strtol+0xbb>
  801b0f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801b13:	0f b6 00             	movzbl (%rax),%eax
  801b16:	3c 30                	cmp    $0x30,%al
  801b18:	75 0e                	jne    801b28 <strtol+0xbb>
  801b1a:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801b1f:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  801b26:	eb 0d                	jmp    801b35 <strtol+0xc8>
  801b28:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801b2c:	75 07                	jne    801b35 <strtol+0xc8>
  801b2e:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  801b35:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801b39:	0f b6 00             	movzbl (%rax),%eax
  801b3c:	3c 2f                	cmp    $0x2f,%al
  801b3e:	7e 1d                	jle    801b5d <strtol+0xf0>
  801b40:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801b44:	0f b6 00             	movzbl (%rax),%eax
  801b47:	3c 39                	cmp    $0x39,%al
  801b49:	7f 12                	jg     801b5d <strtol+0xf0>
  801b4b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801b4f:	0f b6 00             	movzbl (%rax),%eax
  801b52:	0f be c0             	movsbl %al,%eax
  801b55:	83 e8 30             	sub    $0x30,%eax
  801b58:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801b5b:	eb 4e                	jmp    801bab <strtol+0x13e>
  801b5d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801b61:	0f b6 00             	movzbl (%rax),%eax
  801b64:	3c 60                	cmp    $0x60,%al
  801b66:	7e 1d                	jle    801b85 <strtol+0x118>
  801b68:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801b6c:	0f b6 00             	movzbl (%rax),%eax
  801b6f:	3c 7a                	cmp    $0x7a,%al
  801b71:	7f 12                	jg     801b85 <strtol+0x118>
  801b73:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801b77:	0f b6 00             	movzbl (%rax),%eax
  801b7a:	0f be c0             	movsbl %al,%eax
  801b7d:	83 e8 57             	sub    $0x57,%eax
  801b80:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801b83:	eb 26                	jmp    801bab <strtol+0x13e>
  801b85:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801b89:	0f b6 00             	movzbl (%rax),%eax
  801b8c:	3c 40                	cmp    $0x40,%al
  801b8e:	7e 48                	jle    801bd8 <strtol+0x16b>
  801b90:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801b94:	0f b6 00             	movzbl (%rax),%eax
  801b97:	3c 5a                	cmp    $0x5a,%al
  801b99:	7f 3d                	jg     801bd8 <strtol+0x16b>
  801b9b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801b9f:	0f b6 00             	movzbl (%rax),%eax
  801ba2:	0f be c0             	movsbl %al,%eax
  801ba5:	83 e8 37             	sub    $0x37,%eax
  801ba8:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801bab:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801bae:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  801bb1:	7c 02                	jl     801bb5 <strtol+0x148>
  801bb3:	eb 23                	jmp    801bd8 <strtol+0x16b>
  801bb5:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801bba:	8b 45 cc             	mov    -0x34(%rbp),%eax
  801bbd:	48 98                	cltq   
  801bbf:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  801bc4:	48 89 c2             	mov    %rax,%rdx
  801bc7:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801bca:	48 98                	cltq   
  801bcc:	48 01 d0             	add    %rdx,%rax
  801bcf:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801bd3:	e9 5d ff ff ff       	jmpq   801b35 <strtol+0xc8>
  801bd8:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  801bdd:	74 0b                	je     801bea <strtol+0x17d>
  801bdf:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801be3:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801be7:	48 89 10             	mov    %rdx,(%rax)
  801bea:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801bee:	74 09                	je     801bf9 <strtol+0x18c>
  801bf0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801bf4:	48 f7 d8             	neg    %rax
  801bf7:	eb 04                	jmp    801bfd <strtol+0x190>
  801bf9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801bfd:	c9                   	leaveq 
  801bfe:	c3                   	retq   

0000000000801bff <strstr>:
  801bff:	55                   	push   %rbp
  801c00:	48 89 e5             	mov    %rsp,%rbp
  801c03:	48 83 ec 30          	sub    $0x30,%rsp
  801c07:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801c0b:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801c0f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801c13:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801c17:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801c1b:	0f b6 00             	movzbl (%rax),%eax
  801c1e:	88 45 ff             	mov    %al,-0x1(%rbp)
  801c21:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  801c25:	75 06                	jne    801c2d <strstr+0x2e>
  801c27:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801c2b:	eb 6b                	jmp    801c98 <strstr+0x99>
  801c2d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801c31:	48 89 c7             	mov    %rax,%rdi
  801c34:	48 b8 d5 14 80 00 00 	movabs $0x8014d5,%rax
  801c3b:	00 00 00 
  801c3e:	ff d0                	callq  *%rax
  801c40:	48 98                	cltq   
  801c42:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801c46:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801c4a:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801c4e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801c52:	0f b6 00             	movzbl (%rax),%eax
  801c55:	88 45 ef             	mov    %al,-0x11(%rbp)
  801c58:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  801c5c:	75 07                	jne    801c65 <strstr+0x66>
  801c5e:	b8 00 00 00 00       	mov    $0x0,%eax
  801c63:	eb 33                	jmp    801c98 <strstr+0x99>
  801c65:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  801c69:	3a 45 ff             	cmp    -0x1(%rbp),%al
  801c6c:	75 d8                	jne    801c46 <strstr+0x47>
  801c6e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c72:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  801c76:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801c7a:	48 89 ce             	mov    %rcx,%rsi
  801c7d:	48 89 c7             	mov    %rax,%rdi
  801c80:	48 b8 f6 16 80 00 00 	movabs $0x8016f6,%rax
  801c87:	00 00 00 
  801c8a:	ff d0                	callq  *%rax
  801c8c:	85 c0                	test   %eax,%eax
  801c8e:	75 b6                	jne    801c46 <strstr+0x47>
  801c90:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801c94:	48 83 e8 01          	sub    $0x1,%rax
  801c98:	c9                   	leaveq 
  801c99:	c3                   	retq   

0000000000801c9a <syscall>:
  801c9a:	55                   	push   %rbp
  801c9b:	48 89 e5             	mov    %rsp,%rbp
  801c9e:	53                   	push   %rbx
  801c9f:	48 83 ec 48          	sub    $0x48,%rsp
  801ca3:	89 7d dc             	mov    %edi,-0x24(%rbp)
  801ca6:	89 75 d8             	mov    %esi,-0x28(%rbp)
  801ca9:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801cad:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  801cb1:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  801cb5:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  801cb9:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801cbc:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  801cc0:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  801cc4:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  801cc8:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  801ccc:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  801cd0:	4c 89 c3             	mov    %r8,%rbx
  801cd3:	cd 30                	int    $0x30
  801cd5:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801cd9:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801cdd:	74 3e                	je     801d1d <syscall+0x83>
  801cdf:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801ce4:	7e 37                	jle    801d1d <syscall+0x83>
  801ce6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801cea:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801ced:	49 89 d0             	mov    %rdx,%r8
  801cf0:	89 c1                	mov    %eax,%ecx
  801cf2:	48 ba 08 56 80 00 00 	movabs $0x805608,%rdx
  801cf9:	00 00 00 
  801cfc:	be 24 00 00 00       	mov    $0x24,%esi
  801d01:	48 bf 25 56 80 00 00 	movabs $0x805625,%rdi
  801d08:	00 00 00 
  801d0b:	b8 00 00 00 00       	mov    $0x0,%eax
  801d10:	49 b9 53 07 80 00 00 	movabs $0x800753,%r9
  801d17:	00 00 00 
  801d1a:	41 ff d1             	callq  *%r9
  801d1d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801d21:	48 83 c4 48          	add    $0x48,%rsp
  801d25:	5b                   	pop    %rbx
  801d26:	5d                   	pop    %rbp
  801d27:	c3                   	retq   

0000000000801d28 <sys_cputs>:
  801d28:	55                   	push   %rbp
  801d29:	48 89 e5             	mov    %rsp,%rbp
  801d2c:	48 83 ec 20          	sub    $0x20,%rsp
  801d30:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d34:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d38:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d3c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d40:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801d47:	00 
  801d48:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d4e:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d54:	48 89 d1             	mov    %rdx,%rcx
  801d57:	48 89 c2             	mov    %rax,%rdx
  801d5a:	be 00 00 00 00       	mov    $0x0,%esi
  801d5f:	bf 00 00 00 00       	mov    $0x0,%edi
  801d64:	48 b8 9a 1c 80 00 00 	movabs $0x801c9a,%rax
  801d6b:	00 00 00 
  801d6e:	ff d0                	callq  *%rax
  801d70:	c9                   	leaveq 
  801d71:	c3                   	retq   

0000000000801d72 <sys_cgetc>:
  801d72:	55                   	push   %rbp
  801d73:	48 89 e5             	mov    %rsp,%rbp
  801d76:	48 83 ec 10          	sub    $0x10,%rsp
  801d7a:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801d81:	00 
  801d82:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d88:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d8e:	b9 00 00 00 00       	mov    $0x0,%ecx
  801d93:	ba 00 00 00 00       	mov    $0x0,%edx
  801d98:	be 00 00 00 00       	mov    $0x0,%esi
  801d9d:	bf 01 00 00 00       	mov    $0x1,%edi
  801da2:	48 b8 9a 1c 80 00 00 	movabs $0x801c9a,%rax
  801da9:	00 00 00 
  801dac:	ff d0                	callq  *%rax
  801dae:	c9                   	leaveq 
  801daf:	c3                   	retq   

0000000000801db0 <sys_env_destroy>:
  801db0:	55                   	push   %rbp
  801db1:	48 89 e5             	mov    %rsp,%rbp
  801db4:	48 83 ec 10          	sub    $0x10,%rsp
  801db8:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801dbb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801dbe:	48 98                	cltq   
  801dc0:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801dc7:	00 
  801dc8:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801dce:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801dd4:	b9 00 00 00 00       	mov    $0x0,%ecx
  801dd9:	48 89 c2             	mov    %rax,%rdx
  801ddc:	be 01 00 00 00       	mov    $0x1,%esi
  801de1:	bf 03 00 00 00       	mov    $0x3,%edi
  801de6:	48 b8 9a 1c 80 00 00 	movabs $0x801c9a,%rax
  801ded:	00 00 00 
  801df0:	ff d0                	callq  *%rax
  801df2:	c9                   	leaveq 
  801df3:	c3                   	retq   

0000000000801df4 <sys_getenvid>:
  801df4:	55                   	push   %rbp
  801df5:	48 89 e5             	mov    %rsp,%rbp
  801df8:	48 83 ec 10          	sub    $0x10,%rsp
  801dfc:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801e03:	00 
  801e04:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e0a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e10:	b9 00 00 00 00       	mov    $0x0,%ecx
  801e15:	ba 00 00 00 00       	mov    $0x0,%edx
  801e1a:	be 00 00 00 00       	mov    $0x0,%esi
  801e1f:	bf 02 00 00 00       	mov    $0x2,%edi
  801e24:	48 b8 9a 1c 80 00 00 	movabs $0x801c9a,%rax
  801e2b:	00 00 00 
  801e2e:	ff d0                	callq  *%rax
  801e30:	c9                   	leaveq 
  801e31:	c3                   	retq   

0000000000801e32 <sys_yield>:
  801e32:	55                   	push   %rbp
  801e33:	48 89 e5             	mov    %rsp,%rbp
  801e36:	48 83 ec 10          	sub    $0x10,%rsp
  801e3a:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801e41:	00 
  801e42:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e48:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e4e:	b9 00 00 00 00       	mov    $0x0,%ecx
  801e53:	ba 00 00 00 00       	mov    $0x0,%edx
  801e58:	be 00 00 00 00       	mov    $0x0,%esi
  801e5d:	bf 0b 00 00 00       	mov    $0xb,%edi
  801e62:	48 b8 9a 1c 80 00 00 	movabs $0x801c9a,%rax
  801e69:	00 00 00 
  801e6c:	ff d0                	callq  *%rax
  801e6e:	c9                   	leaveq 
  801e6f:	c3                   	retq   

0000000000801e70 <sys_page_alloc>:
  801e70:	55                   	push   %rbp
  801e71:	48 89 e5             	mov    %rsp,%rbp
  801e74:	48 83 ec 20          	sub    $0x20,%rsp
  801e78:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801e7b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801e7f:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801e82:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801e85:	48 63 c8             	movslq %eax,%rcx
  801e88:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801e8c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e8f:	48 98                	cltq   
  801e91:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801e98:	00 
  801e99:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e9f:	49 89 c8             	mov    %rcx,%r8
  801ea2:	48 89 d1             	mov    %rdx,%rcx
  801ea5:	48 89 c2             	mov    %rax,%rdx
  801ea8:	be 01 00 00 00       	mov    $0x1,%esi
  801ead:	bf 04 00 00 00       	mov    $0x4,%edi
  801eb2:	48 b8 9a 1c 80 00 00 	movabs $0x801c9a,%rax
  801eb9:	00 00 00 
  801ebc:	ff d0                	callq  *%rax
  801ebe:	c9                   	leaveq 
  801ebf:	c3                   	retq   

0000000000801ec0 <sys_page_map>:
  801ec0:	55                   	push   %rbp
  801ec1:	48 89 e5             	mov    %rsp,%rbp
  801ec4:	48 83 ec 30          	sub    $0x30,%rsp
  801ec8:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801ecb:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801ecf:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801ed2:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801ed6:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801eda:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801edd:	48 63 c8             	movslq %eax,%rcx
  801ee0:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801ee4:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801ee7:	48 63 f0             	movslq %eax,%rsi
  801eea:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801eee:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ef1:	48 98                	cltq   
  801ef3:	48 89 0c 24          	mov    %rcx,(%rsp)
  801ef7:	49 89 f9             	mov    %rdi,%r9
  801efa:	49 89 f0             	mov    %rsi,%r8
  801efd:	48 89 d1             	mov    %rdx,%rcx
  801f00:	48 89 c2             	mov    %rax,%rdx
  801f03:	be 01 00 00 00       	mov    $0x1,%esi
  801f08:	bf 05 00 00 00       	mov    $0x5,%edi
  801f0d:	48 b8 9a 1c 80 00 00 	movabs $0x801c9a,%rax
  801f14:	00 00 00 
  801f17:	ff d0                	callq  *%rax
  801f19:	c9                   	leaveq 
  801f1a:	c3                   	retq   

0000000000801f1b <sys_page_unmap>:
  801f1b:	55                   	push   %rbp
  801f1c:	48 89 e5             	mov    %rsp,%rbp
  801f1f:	48 83 ec 20          	sub    $0x20,%rsp
  801f23:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801f26:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801f2a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801f2e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801f31:	48 98                	cltq   
  801f33:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801f3a:	00 
  801f3b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801f41:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801f47:	48 89 d1             	mov    %rdx,%rcx
  801f4a:	48 89 c2             	mov    %rax,%rdx
  801f4d:	be 01 00 00 00       	mov    $0x1,%esi
  801f52:	bf 06 00 00 00       	mov    $0x6,%edi
  801f57:	48 b8 9a 1c 80 00 00 	movabs $0x801c9a,%rax
  801f5e:	00 00 00 
  801f61:	ff d0                	callq  *%rax
  801f63:	c9                   	leaveq 
  801f64:	c3                   	retq   

0000000000801f65 <sys_env_set_status>:
  801f65:	55                   	push   %rbp
  801f66:	48 89 e5             	mov    %rsp,%rbp
  801f69:	48 83 ec 10          	sub    $0x10,%rsp
  801f6d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801f70:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801f73:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801f76:	48 63 d0             	movslq %eax,%rdx
  801f79:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801f7c:	48 98                	cltq   
  801f7e:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801f85:	00 
  801f86:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801f8c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801f92:	48 89 d1             	mov    %rdx,%rcx
  801f95:	48 89 c2             	mov    %rax,%rdx
  801f98:	be 01 00 00 00       	mov    $0x1,%esi
  801f9d:	bf 08 00 00 00       	mov    $0x8,%edi
  801fa2:	48 b8 9a 1c 80 00 00 	movabs $0x801c9a,%rax
  801fa9:	00 00 00 
  801fac:	ff d0                	callq  *%rax
  801fae:	c9                   	leaveq 
  801faf:	c3                   	retq   

0000000000801fb0 <sys_env_set_trapframe>:
  801fb0:	55                   	push   %rbp
  801fb1:	48 89 e5             	mov    %rsp,%rbp
  801fb4:	48 83 ec 20          	sub    $0x20,%rsp
  801fb8:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801fbb:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801fbf:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801fc3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801fc6:	48 98                	cltq   
  801fc8:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801fcf:	00 
  801fd0:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801fd6:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801fdc:	48 89 d1             	mov    %rdx,%rcx
  801fdf:	48 89 c2             	mov    %rax,%rdx
  801fe2:	be 01 00 00 00       	mov    $0x1,%esi
  801fe7:	bf 09 00 00 00       	mov    $0x9,%edi
  801fec:	48 b8 9a 1c 80 00 00 	movabs $0x801c9a,%rax
  801ff3:	00 00 00 
  801ff6:	ff d0                	callq  *%rax
  801ff8:	c9                   	leaveq 
  801ff9:	c3                   	retq   

0000000000801ffa <sys_env_set_pgfault_upcall>:
  801ffa:	55                   	push   %rbp
  801ffb:	48 89 e5             	mov    %rsp,%rbp
  801ffe:	48 83 ec 20          	sub    $0x20,%rsp
  802002:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802005:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802009:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80200d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802010:	48 98                	cltq   
  802012:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802019:	00 
  80201a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802020:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802026:	48 89 d1             	mov    %rdx,%rcx
  802029:	48 89 c2             	mov    %rax,%rdx
  80202c:	be 01 00 00 00       	mov    $0x1,%esi
  802031:	bf 0a 00 00 00       	mov    $0xa,%edi
  802036:	48 b8 9a 1c 80 00 00 	movabs $0x801c9a,%rax
  80203d:	00 00 00 
  802040:	ff d0                	callq  *%rax
  802042:	c9                   	leaveq 
  802043:	c3                   	retq   

0000000000802044 <sys_ipc_try_send>:
  802044:	55                   	push   %rbp
  802045:	48 89 e5             	mov    %rsp,%rbp
  802048:	48 83 ec 20          	sub    $0x20,%rsp
  80204c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80204f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802053:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  802057:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  80205a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80205d:	48 63 f0             	movslq %eax,%rsi
  802060:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802064:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802067:	48 98                	cltq   
  802069:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80206d:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802074:	00 
  802075:	49 89 f1             	mov    %rsi,%r9
  802078:	49 89 c8             	mov    %rcx,%r8
  80207b:	48 89 d1             	mov    %rdx,%rcx
  80207e:	48 89 c2             	mov    %rax,%rdx
  802081:	be 00 00 00 00       	mov    $0x0,%esi
  802086:	bf 0c 00 00 00       	mov    $0xc,%edi
  80208b:	48 b8 9a 1c 80 00 00 	movabs $0x801c9a,%rax
  802092:	00 00 00 
  802095:	ff d0                	callq  *%rax
  802097:	c9                   	leaveq 
  802098:	c3                   	retq   

0000000000802099 <sys_ipc_recv>:
  802099:	55                   	push   %rbp
  80209a:	48 89 e5             	mov    %rsp,%rbp
  80209d:	48 83 ec 10          	sub    $0x10,%rsp
  8020a1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8020a5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8020a9:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8020b0:	00 
  8020b1:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8020b7:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8020bd:	b9 00 00 00 00       	mov    $0x0,%ecx
  8020c2:	48 89 c2             	mov    %rax,%rdx
  8020c5:	be 01 00 00 00       	mov    $0x1,%esi
  8020ca:	bf 0d 00 00 00       	mov    $0xd,%edi
  8020cf:	48 b8 9a 1c 80 00 00 	movabs $0x801c9a,%rax
  8020d6:	00 00 00 
  8020d9:	ff d0                	callq  *%rax
  8020db:	c9                   	leaveq 
  8020dc:	c3                   	retq   

00000000008020dd <sys_time_msec>:
  8020dd:	55                   	push   %rbp
  8020de:	48 89 e5             	mov    %rsp,%rbp
  8020e1:	48 83 ec 10          	sub    $0x10,%rsp
  8020e5:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8020ec:	00 
  8020ed:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8020f3:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8020f9:	b9 00 00 00 00       	mov    $0x0,%ecx
  8020fe:	ba 00 00 00 00       	mov    $0x0,%edx
  802103:	be 00 00 00 00       	mov    $0x0,%esi
  802108:	bf 0e 00 00 00       	mov    $0xe,%edi
  80210d:	48 b8 9a 1c 80 00 00 	movabs $0x801c9a,%rax
  802114:	00 00 00 
  802117:	ff d0                	callq  *%rax
  802119:	c9                   	leaveq 
  80211a:	c3                   	retq   

000000000080211b <sys_net_transmit>:
  80211b:	55                   	push   %rbp
  80211c:	48 89 e5             	mov    %rsp,%rbp
  80211f:	48 83 ec 20          	sub    $0x20,%rsp
  802123:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802127:	89 75 f4             	mov    %esi,-0xc(%rbp)
  80212a:	8b 55 f4             	mov    -0xc(%rbp),%edx
  80212d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802131:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802138:	00 
  802139:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80213f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802145:	48 89 d1             	mov    %rdx,%rcx
  802148:	48 89 c2             	mov    %rax,%rdx
  80214b:	be 00 00 00 00       	mov    $0x0,%esi
  802150:	bf 0f 00 00 00       	mov    $0xf,%edi
  802155:	48 b8 9a 1c 80 00 00 	movabs $0x801c9a,%rax
  80215c:	00 00 00 
  80215f:	ff d0                	callq  *%rax
  802161:	c9                   	leaveq 
  802162:	c3                   	retq   

0000000000802163 <sys_net_receive>:
  802163:	55                   	push   %rbp
  802164:	48 89 e5             	mov    %rsp,%rbp
  802167:	48 83 ec 20          	sub    $0x20,%rsp
  80216b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80216f:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802172:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802175:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802179:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802180:	00 
  802181:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802187:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80218d:	48 89 d1             	mov    %rdx,%rcx
  802190:	48 89 c2             	mov    %rax,%rdx
  802193:	be 00 00 00 00       	mov    $0x0,%esi
  802198:	bf 10 00 00 00       	mov    $0x10,%edi
  80219d:	48 b8 9a 1c 80 00 00 	movabs $0x801c9a,%rax
  8021a4:	00 00 00 
  8021a7:	ff d0                	callq  *%rax
  8021a9:	c9                   	leaveq 
  8021aa:	c3                   	retq   

00000000008021ab <sys_ept_map>:
  8021ab:	55                   	push   %rbp
  8021ac:	48 89 e5             	mov    %rsp,%rbp
  8021af:	48 83 ec 30          	sub    $0x30,%rsp
  8021b3:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8021b6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8021ba:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8021bd:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  8021c1:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  8021c5:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8021c8:	48 63 c8             	movslq %eax,%rcx
  8021cb:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  8021cf:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8021d2:	48 63 f0             	movslq %eax,%rsi
  8021d5:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8021d9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8021dc:	48 98                	cltq   
  8021de:	48 89 0c 24          	mov    %rcx,(%rsp)
  8021e2:	49 89 f9             	mov    %rdi,%r9
  8021e5:	49 89 f0             	mov    %rsi,%r8
  8021e8:	48 89 d1             	mov    %rdx,%rcx
  8021eb:	48 89 c2             	mov    %rax,%rdx
  8021ee:	be 00 00 00 00       	mov    $0x0,%esi
  8021f3:	bf 11 00 00 00       	mov    $0x11,%edi
  8021f8:	48 b8 9a 1c 80 00 00 	movabs $0x801c9a,%rax
  8021ff:	00 00 00 
  802202:	ff d0                	callq  *%rax
  802204:	c9                   	leaveq 
  802205:	c3                   	retq   

0000000000802206 <sys_env_mkguest>:
  802206:	55                   	push   %rbp
  802207:	48 89 e5             	mov    %rsp,%rbp
  80220a:	48 83 ec 20          	sub    $0x20,%rsp
  80220e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802212:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802216:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80221a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80221e:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802225:	00 
  802226:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80222c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802232:	48 89 d1             	mov    %rdx,%rcx
  802235:	48 89 c2             	mov    %rax,%rdx
  802238:	be 00 00 00 00       	mov    $0x0,%esi
  80223d:	bf 12 00 00 00       	mov    $0x12,%edi
  802242:	48 b8 9a 1c 80 00 00 	movabs $0x801c9a,%rax
  802249:	00 00 00 
  80224c:	ff d0                	callq  *%rax
  80224e:	c9                   	leaveq 
  80224f:	c3                   	retq   

0000000000802250 <sys_vmx_list_vms>:
  802250:	55                   	push   %rbp
  802251:	48 89 e5             	mov    %rsp,%rbp
  802254:	48 83 ec 10          	sub    $0x10,%rsp
  802258:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80225f:	00 
  802260:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802266:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80226c:	b9 00 00 00 00       	mov    $0x0,%ecx
  802271:	ba 00 00 00 00       	mov    $0x0,%edx
  802276:	be 00 00 00 00       	mov    $0x0,%esi
  80227b:	bf 13 00 00 00       	mov    $0x13,%edi
  802280:	48 b8 9a 1c 80 00 00 	movabs $0x801c9a,%rax
  802287:	00 00 00 
  80228a:	ff d0                	callq  *%rax
  80228c:	c9                   	leaveq 
  80228d:	c3                   	retq   

000000000080228e <sys_vmx_sel_resume>:
  80228e:	55                   	push   %rbp
  80228f:	48 89 e5             	mov    %rsp,%rbp
  802292:	48 83 ec 10          	sub    $0x10,%rsp
  802296:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802299:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80229c:	48 98                	cltq   
  80229e:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8022a5:	00 
  8022a6:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8022ac:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8022b2:	b9 00 00 00 00       	mov    $0x0,%ecx
  8022b7:	48 89 c2             	mov    %rax,%rdx
  8022ba:	be 00 00 00 00       	mov    $0x0,%esi
  8022bf:	bf 14 00 00 00       	mov    $0x14,%edi
  8022c4:	48 b8 9a 1c 80 00 00 	movabs $0x801c9a,%rax
  8022cb:	00 00 00 
  8022ce:	ff d0                	callq  *%rax
  8022d0:	c9                   	leaveq 
  8022d1:	c3                   	retq   

00000000008022d2 <sys_vmx_get_vmdisk_number>:
  8022d2:	55                   	push   %rbp
  8022d3:	48 89 e5             	mov    %rsp,%rbp
  8022d6:	48 83 ec 10          	sub    $0x10,%rsp
  8022da:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8022e1:	00 
  8022e2:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8022e8:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8022ee:	b9 00 00 00 00       	mov    $0x0,%ecx
  8022f3:	ba 00 00 00 00       	mov    $0x0,%edx
  8022f8:	be 00 00 00 00       	mov    $0x0,%esi
  8022fd:	bf 15 00 00 00       	mov    $0x15,%edi
  802302:	48 b8 9a 1c 80 00 00 	movabs $0x801c9a,%rax
  802309:	00 00 00 
  80230c:	ff d0                	callq  *%rax
  80230e:	c9                   	leaveq 
  80230f:	c3                   	retq   

0000000000802310 <sys_vmx_incr_vmdisk_number>:
  802310:	55                   	push   %rbp
  802311:	48 89 e5             	mov    %rsp,%rbp
  802314:	48 83 ec 10          	sub    $0x10,%rsp
  802318:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80231f:	00 
  802320:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802326:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80232c:	b9 00 00 00 00       	mov    $0x0,%ecx
  802331:	ba 00 00 00 00       	mov    $0x0,%edx
  802336:	be 00 00 00 00       	mov    $0x0,%esi
  80233b:	bf 16 00 00 00       	mov    $0x16,%edi
  802340:	48 b8 9a 1c 80 00 00 	movabs $0x801c9a,%rax
  802347:	00 00 00 
  80234a:	ff d0                	callq  *%rax
  80234c:	c9                   	leaveq 
  80234d:	c3                   	retq   

000000000080234e <fd2num>:
  80234e:	55                   	push   %rbp
  80234f:	48 89 e5             	mov    %rsp,%rbp
  802352:	48 83 ec 08          	sub    $0x8,%rsp
  802356:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80235a:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80235e:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  802365:	ff ff ff 
  802368:	48 01 d0             	add    %rdx,%rax
  80236b:	48 c1 e8 0c          	shr    $0xc,%rax
  80236f:	c9                   	leaveq 
  802370:	c3                   	retq   

0000000000802371 <fd2data>:
  802371:	55                   	push   %rbp
  802372:	48 89 e5             	mov    %rsp,%rbp
  802375:	48 83 ec 08          	sub    $0x8,%rsp
  802379:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80237d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802381:	48 89 c7             	mov    %rax,%rdi
  802384:	48 b8 4e 23 80 00 00 	movabs $0x80234e,%rax
  80238b:	00 00 00 
  80238e:	ff d0                	callq  *%rax
  802390:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  802396:	48 c1 e0 0c          	shl    $0xc,%rax
  80239a:	c9                   	leaveq 
  80239b:	c3                   	retq   

000000000080239c <fd_alloc>:
  80239c:	55                   	push   %rbp
  80239d:	48 89 e5             	mov    %rsp,%rbp
  8023a0:	48 83 ec 18          	sub    $0x18,%rsp
  8023a4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8023a8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8023af:	eb 6b                	jmp    80241c <fd_alloc+0x80>
  8023b1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023b4:	48 98                	cltq   
  8023b6:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  8023bc:	48 c1 e0 0c          	shl    $0xc,%rax
  8023c0:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8023c4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8023c8:	48 c1 e8 15          	shr    $0x15,%rax
  8023cc:	48 89 c2             	mov    %rax,%rdx
  8023cf:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8023d6:	01 00 00 
  8023d9:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8023dd:	83 e0 01             	and    $0x1,%eax
  8023e0:	48 85 c0             	test   %rax,%rax
  8023e3:	74 21                	je     802406 <fd_alloc+0x6a>
  8023e5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8023e9:	48 c1 e8 0c          	shr    $0xc,%rax
  8023ed:	48 89 c2             	mov    %rax,%rdx
  8023f0:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8023f7:	01 00 00 
  8023fa:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8023fe:	83 e0 01             	and    $0x1,%eax
  802401:	48 85 c0             	test   %rax,%rax
  802404:	75 12                	jne    802418 <fd_alloc+0x7c>
  802406:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80240a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80240e:	48 89 10             	mov    %rdx,(%rax)
  802411:	b8 00 00 00 00       	mov    $0x0,%eax
  802416:	eb 1a                	jmp    802432 <fd_alloc+0x96>
  802418:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80241c:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802420:	7e 8f                	jle    8023b1 <fd_alloc+0x15>
  802422:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802426:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  80242d:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  802432:	c9                   	leaveq 
  802433:	c3                   	retq   

0000000000802434 <fd_lookup>:
  802434:	55                   	push   %rbp
  802435:	48 89 e5             	mov    %rsp,%rbp
  802438:	48 83 ec 20          	sub    $0x20,%rsp
  80243c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80243f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802443:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802447:	78 06                	js     80244f <fd_lookup+0x1b>
  802449:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  80244d:	7e 07                	jle    802456 <fd_lookup+0x22>
  80244f:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802454:	eb 6c                	jmp    8024c2 <fd_lookup+0x8e>
  802456:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802459:	48 98                	cltq   
  80245b:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802461:	48 c1 e0 0c          	shl    $0xc,%rax
  802465:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802469:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80246d:	48 c1 e8 15          	shr    $0x15,%rax
  802471:	48 89 c2             	mov    %rax,%rdx
  802474:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  80247b:	01 00 00 
  80247e:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802482:	83 e0 01             	and    $0x1,%eax
  802485:	48 85 c0             	test   %rax,%rax
  802488:	74 21                	je     8024ab <fd_lookup+0x77>
  80248a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80248e:	48 c1 e8 0c          	shr    $0xc,%rax
  802492:	48 89 c2             	mov    %rax,%rdx
  802495:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80249c:	01 00 00 
  80249f:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8024a3:	83 e0 01             	and    $0x1,%eax
  8024a6:	48 85 c0             	test   %rax,%rax
  8024a9:	75 07                	jne    8024b2 <fd_lookup+0x7e>
  8024ab:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8024b0:	eb 10                	jmp    8024c2 <fd_lookup+0x8e>
  8024b2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8024b6:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8024ba:	48 89 10             	mov    %rdx,(%rax)
  8024bd:	b8 00 00 00 00       	mov    $0x0,%eax
  8024c2:	c9                   	leaveq 
  8024c3:	c3                   	retq   

00000000008024c4 <fd_close>:
  8024c4:	55                   	push   %rbp
  8024c5:	48 89 e5             	mov    %rsp,%rbp
  8024c8:	48 83 ec 30          	sub    $0x30,%rsp
  8024cc:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8024d0:	89 f0                	mov    %esi,%eax
  8024d2:	88 45 d4             	mov    %al,-0x2c(%rbp)
  8024d5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8024d9:	48 89 c7             	mov    %rax,%rdi
  8024dc:	48 b8 4e 23 80 00 00 	movabs $0x80234e,%rax
  8024e3:	00 00 00 
  8024e6:	ff d0                	callq  *%rax
  8024e8:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8024ec:	48 89 d6             	mov    %rdx,%rsi
  8024ef:	89 c7                	mov    %eax,%edi
  8024f1:	48 b8 34 24 80 00 00 	movabs $0x802434,%rax
  8024f8:	00 00 00 
  8024fb:	ff d0                	callq  *%rax
  8024fd:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802500:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802504:	78 0a                	js     802510 <fd_close+0x4c>
  802506:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80250a:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  80250e:	74 12                	je     802522 <fd_close+0x5e>
  802510:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  802514:	74 05                	je     80251b <fd_close+0x57>
  802516:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802519:	eb 05                	jmp    802520 <fd_close+0x5c>
  80251b:	b8 00 00 00 00       	mov    $0x0,%eax
  802520:	eb 69                	jmp    80258b <fd_close+0xc7>
  802522:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802526:	8b 00                	mov    (%rax),%eax
  802528:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80252c:	48 89 d6             	mov    %rdx,%rsi
  80252f:	89 c7                	mov    %eax,%edi
  802531:	48 b8 8d 25 80 00 00 	movabs $0x80258d,%rax
  802538:	00 00 00 
  80253b:	ff d0                	callq  *%rax
  80253d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802540:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802544:	78 2a                	js     802570 <fd_close+0xac>
  802546:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80254a:	48 8b 40 20          	mov    0x20(%rax),%rax
  80254e:	48 85 c0             	test   %rax,%rax
  802551:	74 16                	je     802569 <fd_close+0xa5>
  802553:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802557:	48 8b 40 20          	mov    0x20(%rax),%rax
  80255b:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80255f:	48 89 d7             	mov    %rdx,%rdi
  802562:	ff d0                	callq  *%rax
  802564:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802567:	eb 07                	jmp    802570 <fd_close+0xac>
  802569:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802570:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802574:	48 89 c6             	mov    %rax,%rsi
  802577:	bf 00 00 00 00       	mov    $0x0,%edi
  80257c:	48 b8 1b 1f 80 00 00 	movabs $0x801f1b,%rax
  802583:	00 00 00 
  802586:	ff d0                	callq  *%rax
  802588:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80258b:	c9                   	leaveq 
  80258c:	c3                   	retq   

000000000080258d <dev_lookup>:
  80258d:	55                   	push   %rbp
  80258e:	48 89 e5             	mov    %rsp,%rbp
  802591:	48 83 ec 20          	sub    $0x20,%rsp
  802595:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802598:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80259c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8025a3:	eb 41                	jmp    8025e6 <dev_lookup+0x59>
  8025a5:	48 b8 c0 87 80 00 00 	movabs $0x8087c0,%rax
  8025ac:	00 00 00 
  8025af:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8025b2:	48 63 d2             	movslq %edx,%rdx
  8025b5:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8025b9:	8b 00                	mov    (%rax),%eax
  8025bb:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  8025be:	75 22                	jne    8025e2 <dev_lookup+0x55>
  8025c0:	48 b8 c0 87 80 00 00 	movabs $0x8087c0,%rax
  8025c7:	00 00 00 
  8025ca:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8025cd:	48 63 d2             	movslq %edx,%rdx
  8025d0:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  8025d4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8025d8:	48 89 10             	mov    %rdx,(%rax)
  8025db:	b8 00 00 00 00       	mov    $0x0,%eax
  8025e0:	eb 60                	jmp    802642 <dev_lookup+0xb5>
  8025e2:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8025e6:	48 b8 c0 87 80 00 00 	movabs $0x8087c0,%rax
  8025ed:	00 00 00 
  8025f0:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8025f3:	48 63 d2             	movslq %edx,%rdx
  8025f6:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8025fa:	48 85 c0             	test   %rax,%rax
  8025fd:	75 a6                	jne    8025a5 <dev_lookup+0x18>
  8025ff:	48 b8 90 a7 80 00 00 	movabs $0x80a790,%rax
  802606:	00 00 00 
  802609:	48 8b 00             	mov    (%rax),%rax
  80260c:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802612:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802615:	89 c6                	mov    %eax,%esi
  802617:	48 bf 38 56 80 00 00 	movabs $0x805638,%rdi
  80261e:	00 00 00 
  802621:	b8 00 00 00 00       	mov    $0x0,%eax
  802626:	48 b9 8c 09 80 00 00 	movabs $0x80098c,%rcx
  80262d:	00 00 00 
  802630:	ff d1                	callq  *%rcx
  802632:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802636:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  80263d:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802642:	c9                   	leaveq 
  802643:	c3                   	retq   

0000000000802644 <close>:
  802644:	55                   	push   %rbp
  802645:	48 89 e5             	mov    %rsp,%rbp
  802648:	48 83 ec 20          	sub    $0x20,%rsp
  80264c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80264f:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802653:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802656:	48 89 d6             	mov    %rdx,%rsi
  802659:	89 c7                	mov    %eax,%edi
  80265b:	48 b8 34 24 80 00 00 	movabs $0x802434,%rax
  802662:	00 00 00 
  802665:	ff d0                	callq  *%rax
  802667:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80266a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80266e:	79 05                	jns    802675 <close+0x31>
  802670:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802673:	eb 18                	jmp    80268d <close+0x49>
  802675:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802679:	be 01 00 00 00       	mov    $0x1,%esi
  80267e:	48 89 c7             	mov    %rax,%rdi
  802681:	48 b8 c4 24 80 00 00 	movabs $0x8024c4,%rax
  802688:	00 00 00 
  80268b:	ff d0                	callq  *%rax
  80268d:	c9                   	leaveq 
  80268e:	c3                   	retq   

000000000080268f <close_all>:
  80268f:	55                   	push   %rbp
  802690:	48 89 e5             	mov    %rsp,%rbp
  802693:	48 83 ec 10          	sub    $0x10,%rsp
  802697:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80269e:	eb 15                	jmp    8026b5 <close_all+0x26>
  8026a0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8026a3:	89 c7                	mov    %eax,%edi
  8026a5:	48 b8 44 26 80 00 00 	movabs $0x802644,%rax
  8026ac:	00 00 00 
  8026af:	ff d0                	callq  *%rax
  8026b1:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8026b5:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  8026b9:	7e e5                	jle    8026a0 <close_all+0x11>
  8026bb:	c9                   	leaveq 
  8026bc:	c3                   	retq   

00000000008026bd <dup>:
  8026bd:	55                   	push   %rbp
  8026be:	48 89 e5             	mov    %rsp,%rbp
  8026c1:	48 83 ec 40          	sub    $0x40,%rsp
  8026c5:	89 7d cc             	mov    %edi,-0x34(%rbp)
  8026c8:	89 75 c8             	mov    %esi,-0x38(%rbp)
  8026cb:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  8026cf:	8b 45 cc             	mov    -0x34(%rbp),%eax
  8026d2:	48 89 d6             	mov    %rdx,%rsi
  8026d5:	89 c7                	mov    %eax,%edi
  8026d7:	48 b8 34 24 80 00 00 	movabs $0x802434,%rax
  8026de:	00 00 00 
  8026e1:	ff d0                	callq  *%rax
  8026e3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8026e6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8026ea:	79 08                	jns    8026f4 <dup+0x37>
  8026ec:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8026ef:	e9 70 01 00 00       	jmpq   802864 <dup+0x1a7>
  8026f4:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8026f7:	89 c7                	mov    %eax,%edi
  8026f9:	48 b8 44 26 80 00 00 	movabs $0x802644,%rax
  802700:	00 00 00 
  802703:	ff d0                	callq  *%rax
  802705:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802708:	48 98                	cltq   
  80270a:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802710:	48 c1 e0 0c          	shl    $0xc,%rax
  802714:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802718:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80271c:	48 89 c7             	mov    %rax,%rdi
  80271f:	48 b8 71 23 80 00 00 	movabs $0x802371,%rax
  802726:	00 00 00 
  802729:	ff d0                	callq  *%rax
  80272b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80272f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802733:	48 89 c7             	mov    %rax,%rdi
  802736:	48 b8 71 23 80 00 00 	movabs $0x802371,%rax
  80273d:	00 00 00 
  802740:	ff d0                	callq  *%rax
  802742:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802746:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80274a:	48 c1 e8 15          	shr    $0x15,%rax
  80274e:	48 89 c2             	mov    %rax,%rdx
  802751:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802758:	01 00 00 
  80275b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80275f:	83 e0 01             	and    $0x1,%eax
  802762:	48 85 c0             	test   %rax,%rax
  802765:	74 73                	je     8027da <dup+0x11d>
  802767:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80276b:	48 c1 e8 0c          	shr    $0xc,%rax
  80276f:	48 89 c2             	mov    %rax,%rdx
  802772:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802779:	01 00 00 
  80277c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802780:	83 e0 01             	and    $0x1,%eax
  802783:	48 85 c0             	test   %rax,%rax
  802786:	74 52                	je     8027da <dup+0x11d>
  802788:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80278c:	48 c1 e8 0c          	shr    $0xc,%rax
  802790:	48 89 c2             	mov    %rax,%rdx
  802793:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80279a:	01 00 00 
  80279d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8027a1:	25 07 0e 00 00       	and    $0xe07,%eax
  8027a6:	89 c1                	mov    %eax,%ecx
  8027a8:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8027ac:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8027b0:	41 89 c8             	mov    %ecx,%r8d
  8027b3:	48 89 d1             	mov    %rdx,%rcx
  8027b6:	ba 00 00 00 00       	mov    $0x0,%edx
  8027bb:	48 89 c6             	mov    %rax,%rsi
  8027be:	bf 00 00 00 00       	mov    $0x0,%edi
  8027c3:	48 b8 c0 1e 80 00 00 	movabs $0x801ec0,%rax
  8027ca:	00 00 00 
  8027cd:	ff d0                	callq  *%rax
  8027cf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8027d2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8027d6:	79 02                	jns    8027da <dup+0x11d>
  8027d8:	eb 57                	jmp    802831 <dup+0x174>
  8027da:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8027de:	48 c1 e8 0c          	shr    $0xc,%rax
  8027e2:	48 89 c2             	mov    %rax,%rdx
  8027e5:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8027ec:	01 00 00 
  8027ef:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8027f3:	25 07 0e 00 00       	and    $0xe07,%eax
  8027f8:	89 c1                	mov    %eax,%ecx
  8027fa:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8027fe:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802802:	41 89 c8             	mov    %ecx,%r8d
  802805:	48 89 d1             	mov    %rdx,%rcx
  802808:	ba 00 00 00 00       	mov    $0x0,%edx
  80280d:	48 89 c6             	mov    %rax,%rsi
  802810:	bf 00 00 00 00       	mov    $0x0,%edi
  802815:	48 b8 c0 1e 80 00 00 	movabs $0x801ec0,%rax
  80281c:	00 00 00 
  80281f:	ff d0                	callq  *%rax
  802821:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802824:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802828:	79 02                	jns    80282c <dup+0x16f>
  80282a:	eb 05                	jmp    802831 <dup+0x174>
  80282c:	8b 45 c8             	mov    -0x38(%rbp),%eax
  80282f:	eb 33                	jmp    802864 <dup+0x1a7>
  802831:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802835:	48 89 c6             	mov    %rax,%rsi
  802838:	bf 00 00 00 00       	mov    $0x0,%edi
  80283d:	48 b8 1b 1f 80 00 00 	movabs $0x801f1b,%rax
  802844:	00 00 00 
  802847:	ff d0                	callq  *%rax
  802849:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80284d:	48 89 c6             	mov    %rax,%rsi
  802850:	bf 00 00 00 00       	mov    $0x0,%edi
  802855:	48 b8 1b 1f 80 00 00 	movabs $0x801f1b,%rax
  80285c:	00 00 00 
  80285f:	ff d0                	callq  *%rax
  802861:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802864:	c9                   	leaveq 
  802865:	c3                   	retq   

0000000000802866 <read>:
  802866:	55                   	push   %rbp
  802867:	48 89 e5             	mov    %rsp,%rbp
  80286a:	48 83 ec 40          	sub    $0x40,%rsp
  80286e:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802871:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802875:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802879:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80287d:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802880:	48 89 d6             	mov    %rdx,%rsi
  802883:	89 c7                	mov    %eax,%edi
  802885:	48 b8 34 24 80 00 00 	movabs $0x802434,%rax
  80288c:	00 00 00 
  80288f:	ff d0                	callq  *%rax
  802891:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802894:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802898:	78 24                	js     8028be <read+0x58>
  80289a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80289e:	8b 00                	mov    (%rax),%eax
  8028a0:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8028a4:	48 89 d6             	mov    %rdx,%rsi
  8028a7:	89 c7                	mov    %eax,%edi
  8028a9:	48 b8 8d 25 80 00 00 	movabs $0x80258d,%rax
  8028b0:	00 00 00 
  8028b3:	ff d0                	callq  *%rax
  8028b5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8028b8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8028bc:	79 05                	jns    8028c3 <read+0x5d>
  8028be:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8028c1:	eb 76                	jmp    802939 <read+0xd3>
  8028c3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8028c7:	8b 40 08             	mov    0x8(%rax),%eax
  8028ca:	83 e0 03             	and    $0x3,%eax
  8028cd:	83 f8 01             	cmp    $0x1,%eax
  8028d0:	75 3a                	jne    80290c <read+0xa6>
  8028d2:	48 b8 90 a7 80 00 00 	movabs $0x80a790,%rax
  8028d9:	00 00 00 
  8028dc:	48 8b 00             	mov    (%rax),%rax
  8028df:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8028e5:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8028e8:	89 c6                	mov    %eax,%esi
  8028ea:	48 bf 57 56 80 00 00 	movabs $0x805657,%rdi
  8028f1:	00 00 00 
  8028f4:	b8 00 00 00 00       	mov    $0x0,%eax
  8028f9:	48 b9 8c 09 80 00 00 	movabs $0x80098c,%rcx
  802900:	00 00 00 
  802903:	ff d1                	callq  *%rcx
  802905:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80290a:	eb 2d                	jmp    802939 <read+0xd3>
  80290c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802910:	48 8b 40 10          	mov    0x10(%rax),%rax
  802914:	48 85 c0             	test   %rax,%rax
  802917:	75 07                	jne    802920 <read+0xba>
  802919:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80291e:	eb 19                	jmp    802939 <read+0xd3>
  802920:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802924:	48 8b 40 10          	mov    0x10(%rax),%rax
  802928:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80292c:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802930:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802934:	48 89 cf             	mov    %rcx,%rdi
  802937:	ff d0                	callq  *%rax
  802939:	c9                   	leaveq 
  80293a:	c3                   	retq   

000000000080293b <readn>:
  80293b:	55                   	push   %rbp
  80293c:	48 89 e5             	mov    %rsp,%rbp
  80293f:	48 83 ec 30          	sub    $0x30,%rsp
  802943:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802946:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80294a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80294e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802955:	eb 49                	jmp    8029a0 <readn+0x65>
  802957:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80295a:	48 98                	cltq   
  80295c:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802960:	48 29 c2             	sub    %rax,%rdx
  802963:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802966:	48 63 c8             	movslq %eax,%rcx
  802969:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80296d:	48 01 c1             	add    %rax,%rcx
  802970:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802973:	48 89 ce             	mov    %rcx,%rsi
  802976:	89 c7                	mov    %eax,%edi
  802978:	48 b8 66 28 80 00 00 	movabs $0x802866,%rax
  80297f:	00 00 00 
  802982:	ff d0                	callq  *%rax
  802984:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802987:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80298b:	79 05                	jns    802992 <readn+0x57>
  80298d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802990:	eb 1c                	jmp    8029ae <readn+0x73>
  802992:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802996:	75 02                	jne    80299a <readn+0x5f>
  802998:	eb 11                	jmp    8029ab <readn+0x70>
  80299a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80299d:	01 45 fc             	add    %eax,-0x4(%rbp)
  8029a0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029a3:	48 98                	cltq   
  8029a5:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8029a9:	72 ac                	jb     802957 <readn+0x1c>
  8029ab:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029ae:	c9                   	leaveq 
  8029af:	c3                   	retq   

00000000008029b0 <write>:
  8029b0:	55                   	push   %rbp
  8029b1:	48 89 e5             	mov    %rsp,%rbp
  8029b4:	48 83 ec 40          	sub    $0x40,%rsp
  8029b8:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8029bb:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8029bf:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8029c3:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8029c7:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8029ca:	48 89 d6             	mov    %rdx,%rsi
  8029cd:	89 c7                	mov    %eax,%edi
  8029cf:	48 b8 34 24 80 00 00 	movabs $0x802434,%rax
  8029d6:	00 00 00 
  8029d9:	ff d0                	callq  *%rax
  8029db:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8029de:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8029e2:	78 24                	js     802a08 <write+0x58>
  8029e4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8029e8:	8b 00                	mov    (%rax),%eax
  8029ea:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8029ee:	48 89 d6             	mov    %rdx,%rsi
  8029f1:	89 c7                	mov    %eax,%edi
  8029f3:	48 b8 8d 25 80 00 00 	movabs $0x80258d,%rax
  8029fa:	00 00 00 
  8029fd:	ff d0                	callq  *%rax
  8029ff:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802a02:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802a06:	79 05                	jns    802a0d <write+0x5d>
  802a08:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a0b:	eb 75                	jmp    802a82 <write+0xd2>
  802a0d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802a11:	8b 40 08             	mov    0x8(%rax),%eax
  802a14:	83 e0 03             	and    $0x3,%eax
  802a17:	85 c0                	test   %eax,%eax
  802a19:	75 3a                	jne    802a55 <write+0xa5>
  802a1b:	48 b8 90 a7 80 00 00 	movabs $0x80a790,%rax
  802a22:	00 00 00 
  802a25:	48 8b 00             	mov    (%rax),%rax
  802a28:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802a2e:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802a31:	89 c6                	mov    %eax,%esi
  802a33:	48 bf 73 56 80 00 00 	movabs $0x805673,%rdi
  802a3a:	00 00 00 
  802a3d:	b8 00 00 00 00       	mov    $0x0,%eax
  802a42:	48 b9 8c 09 80 00 00 	movabs $0x80098c,%rcx
  802a49:	00 00 00 
  802a4c:	ff d1                	callq  *%rcx
  802a4e:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802a53:	eb 2d                	jmp    802a82 <write+0xd2>
  802a55:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802a59:	48 8b 40 18          	mov    0x18(%rax),%rax
  802a5d:	48 85 c0             	test   %rax,%rax
  802a60:	75 07                	jne    802a69 <write+0xb9>
  802a62:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802a67:	eb 19                	jmp    802a82 <write+0xd2>
  802a69:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802a6d:	48 8b 40 18          	mov    0x18(%rax),%rax
  802a71:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802a75:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802a79:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802a7d:	48 89 cf             	mov    %rcx,%rdi
  802a80:	ff d0                	callq  *%rax
  802a82:	c9                   	leaveq 
  802a83:	c3                   	retq   

0000000000802a84 <seek>:
  802a84:	55                   	push   %rbp
  802a85:	48 89 e5             	mov    %rsp,%rbp
  802a88:	48 83 ec 18          	sub    $0x18,%rsp
  802a8c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802a8f:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802a92:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802a96:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802a99:	48 89 d6             	mov    %rdx,%rsi
  802a9c:	89 c7                	mov    %eax,%edi
  802a9e:	48 b8 34 24 80 00 00 	movabs $0x802434,%rax
  802aa5:	00 00 00 
  802aa8:	ff d0                	callq  *%rax
  802aaa:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802aad:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ab1:	79 05                	jns    802ab8 <seek+0x34>
  802ab3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ab6:	eb 0f                	jmp    802ac7 <seek+0x43>
  802ab8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802abc:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802abf:	89 50 04             	mov    %edx,0x4(%rax)
  802ac2:	b8 00 00 00 00       	mov    $0x0,%eax
  802ac7:	c9                   	leaveq 
  802ac8:	c3                   	retq   

0000000000802ac9 <ftruncate>:
  802ac9:	55                   	push   %rbp
  802aca:	48 89 e5             	mov    %rsp,%rbp
  802acd:	48 83 ec 30          	sub    $0x30,%rsp
  802ad1:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802ad4:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802ad7:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802adb:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802ade:	48 89 d6             	mov    %rdx,%rsi
  802ae1:	89 c7                	mov    %eax,%edi
  802ae3:	48 b8 34 24 80 00 00 	movabs $0x802434,%rax
  802aea:	00 00 00 
  802aed:	ff d0                	callq  *%rax
  802aef:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802af2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802af6:	78 24                	js     802b1c <ftruncate+0x53>
  802af8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802afc:	8b 00                	mov    (%rax),%eax
  802afe:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802b02:	48 89 d6             	mov    %rdx,%rsi
  802b05:	89 c7                	mov    %eax,%edi
  802b07:	48 b8 8d 25 80 00 00 	movabs $0x80258d,%rax
  802b0e:	00 00 00 
  802b11:	ff d0                	callq  *%rax
  802b13:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b16:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b1a:	79 05                	jns    802b21 <ftruncate+0x58>
  802b1c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b1f:	eb 72                	jmp    802b93 <ftruncate+0xca>
  802b21:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b25:	8b 40 08             	mov    0x8(%rax),%eax
  802b28:	83 e0 03             	and    $0x3,%eax
  802b2b:	85 c0                	test   %eax,%eax
  802b2d:	75 3a                	jne    802b69 <ftruncate+0xa0>
  802b2f:	48 b8 90 a7 80 00 00 	movabs $0x80a790,%rax
  802b36:	00 00 00 
  802b39:	48 8b 00             	mov    (%rax),%rax
  802b3c:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802b42:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802b45:	89 c6                	mov    %eax,%esi
  802b47:	48 bf 90 56 80 00 00 	movabs $0x805690,%rdi
  802b4e:	00 00 00 
  802b51:	b8 00 00 00 00       	mov    $0x0,%eax
  802b56:	48 b9 8c 09 80 00 00 	movabs $0x80098c,%rcx
  802b5d:	00 00 00 
  802b60:	ff d1                	callq  *%rcx
  802b62:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802b67:	eb 2a                	jmp    802b93 <ftruncate+0xca>
  802b69:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802b6d:	48 8b 40 30          	mov    0x30(%rax),%rax
  802b71:	48 85 c0             	test   %rax,%rax
  802b74:	75 07                	jne    802b7d <ftruncate+0xb4>
  802b76:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802b7b:	eb 16                	jmp    802b93 <ftruncate+0xca>
  802b7d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802b81:	48 8b 40 30          	mov    0x30(%rax),%rax
  802b85:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802b89:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  802b8c:	89 ce                	mov    %ecx,%esi
  802b8e:	48 89 d7             	mov    %rdx,%rdi
  802b91:	ff d0                	callq  *%rax
  802b93:	c9                   	leaveq 
  802b94:	c3                   	retq   

0000000000802b95 <fstat>:
  802b95:	55                   	push   %rbp
  802b96:	48 89 e5             	mov    %rsp,%rbp
  802b99:	48 83 ec 30          	sub    $0x30,%rsp
  802b9d:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802ba0:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802ba4:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802ba8:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802bab:	48 89 d6             	mov    %rdx,%rsi
  802bae:	89 c7                	mov    %eax,%edi
  802bb0:	48 b8 34 24 80 00 00 	movabs $0x802434,%rax
  802bb7:	00 00 00 
  802bba:	ff d0                	callq  *%rax
  802bbc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802bbf:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802bc3:	78 24                	js     802be9 <fstat+0x54>
  802bc5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802bc9:	8b 00                	mov    (%rax),%eax
  802bcb:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802bcf:	48 89 d6             	mov    %rdx,%rsi
  802bd2:	89 c7                	mov    %eax,%edi
  802bd4:	48 b8 8d 25 80 00 00 	movabs $0x80258d,%rax
  802bdb:	00 00 00 
  802bde:	ff d0                	callq  *%rax
  802be0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802be3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802be7:	79 05                	jns    802bee <fstat+0x59>
  802be9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802bec:	eb 5e                	jmp    802c4c <fstat+0xb7>
  802bee:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802bf2:	48 8b 40 28          	mov    0x28(%rax),%rax
  802bf6:	48 85 c0             	test   %rax,%rax
  802bf9:	75 07                	jne    802c02 <fstat+0x6d>
  802bfb:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802c00:	eb 4a                	jmp    802c4c <fstat+0xb7>
  802c02:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802c06:	c6 00 00             	movb   $0x0,(%rax)
  802c09:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802c0d:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  802c14:	00 00 00 
  802c17:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802c1b:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  802c22:	00 00 00 
  802c25:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802c29:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802c2d:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  802c34:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802c38:	48 8b 40 28          	mov    0x28(%rax),%rax
  802c3c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802c40:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  802c44:	48 89 ce             	mov    %rcx,%rsi
  802c47:	48 89 d7             	mov    %rdx,%rdi
  802c4a:	ff d0                	callq  *%rax
  802c4c:	c9                   	leaveq 
  802c4d:	c3                   	retq   

0000000000802c4e <stat>:
  802c4e:	55                   	push   %rbp
  802c4f:	48 89 e5             	mov    %rsp,%rbp
  802c52:	48 83 ec 20          	sub    $0x20,%rsp
  802c56:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802c5a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802c5e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c62:	be 00 00 00 00       	mov    $0x0,%esi
  802c67:	48 89 c7             	mov    %rax,%rdi
  802c6a:	48 b8 3c 2d 80 00 00 	movabs $0x802d3c,%rax
  802c71:	00 00 00 
  802c74:	ff d0                	callq  *%rax
  802c76:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c79:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c7d:	79 05                	jns    802c84 <stat+0x36>
  802c7f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c82:	eb 2f                	jmp    802cb3 <stat+0x65>
  802c84:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802c88:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c8b:	48 89 d6             	mov    %rdx,%rsi
  802c8e:	89 c7                	mov    %eax,%edi
  802c90:	48 b8 95 2b 80 00 00 	movabs $0x802b95,%rax
  802c97:	00 00 00 
  802c9a:	ff d0                	callq  *%rax
  802c9c:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802c9f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ca2:	89 c7                	mov    %eax,%edi
  802ca4:	48 b8 44 26 80 00 00 	movabs $0x802644,%rax
  802cab:	00 00 00 
  802cae:	ff d0                	callq  *%rax
  802cb0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802cb3:	c9                   	leaveq 
  802cb4:	c3                   	retq   

0000000000802cb5 <fsipc>:
  802cb5:	55                   	push   %rbp
  802cb6:	48 89 e5             	mov    %rsp,%rbp
  802cb9:	48 83 ec 10          	sub    $0x10,%rsp
  802cbd:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802cc0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802cc4:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802ccb:	00 00 00 
  802cce:	8b 00                	mov    (%rax),%eax
  802cd0:	85 c0                	test   %eax,%eax
  802cd2:	75 1d                	jne    802cf1 <fsipc+0x3c>
  802cd4:	bf 01 00 00 00       	mov    $0x1,%edi
  802cd9:	48 b8 a4 4e 80 00 00 	movabs $0x804ea4,%rax
  802ce0:	00 00 00 
  802ce3:	ff d0                	callq  *%rax
  802ce5:	48 ba 00 90 80 00 00 	movabs $0x809000,%rdx
  802cec:	00 00 00 
  802cef:	89 02                	mov    %eax,(%rdx)
  802cf1:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802cf8:	00 00 00 
  802cfb:	8b 00                	mov    (%rax),%eax
  802cfd:	8b 75 fc             	mov    -0x4(%rbp),%esi
  802d00:	b9 07 00 00 00       	mov    $0x7,%ecx
  802d05:	48 ba 00 b0 80 00 00 	movabs $0x80b000,%rdx
  802d0c:	00 00 00 
  802d0f:	89 c7                	mov    %eax,%edi
  802d11:	48 b8 0e 4e 80 00 00 	movabs $0x804e0e,%rax
  802d18:	00 00 00 
  802d1b:	ff d0                	callq  *%rax
  802d1d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d21:	ba 00 00 00 00       	mov    $0x0,%edx
  802d26:	48 89 c6             	mov    %rax,%rsi
  802d29:	bf 00 00 00 00       	mov    $0x0,%edi
  802d2e:	48 b8 4d 4d 80 00 00 	movabs $0x804d4d,%rax
  802d35:	00 00 00 
  802d38:	ff d0                	callq  *%rax
  802d3a:	c9                   	leaveq 
  802d3b:	c3                   	retq   

0000000000802d3c <open>:
  802d3c:	55                   	push   %rbp
  802d3d:	48 89 e5             	mov    %rsp,%rbp
  802d40:	48 83 ec 20          	sub    $0x20,%rsp
  802d44:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802d48:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  802d4b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d4f:	48 89 c7             	mov    %rax,%rdi
  802d52:	48 b8 d5 14 80 00 00 	movabs $0x8014d5,%rax
  802d59:	00 00 00 
  802d5c:	ff d0                	callq  *%rax
  802d5e:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802d63:	7e 0a                	jle    802d6f <open+0x33>
  802d65:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802d6a:	e9 a5 00 00 00       	jmpq   802e14 <open+0xd8>
  802d6f:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802d73:	48 89 c7             	mov    %rax,%rdi
  802d76:	48 b8 9c 23 80 00 00 	movabs $0x80239c,%rax
  802d7d:	00 00 00 
  802d80:	ff d0                	callq  *%rax
  802d82:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d85:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d89:	79 08                	jns    802d93 <open+0x57>
  802d8b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d8e:	e9 81 00 00 00       	jmpq   802e14 <open+0xd8>
  802d93:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d97:	48 89 c6             	mov    %rax,%rsi
  802d9a:	48 bf 00 b0 80 00 00 	movabs $0x80b000,%rdi
  802da1:	00 00 00 
  802da4:	48 b8 41 15 80 00 00 	movabs $0x801541,%rax
  802dab:	00 00 00 
  802dae:	ff d0                	callq  *%rax
  802db0:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  802db7:	00 00 00 
  802dba:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  802dbd:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  802dc3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802dc7:	48 89 c6             	mov    %rax,%rsi
  802dca:	bf 01 00 00 00       	mov    $0x1,%edi
  802dcf:	48 b8 b5 2c 80 00 00 	movabs $0x802cb5,%rax
  802dd6:	00 00 00 
  802dd9:	ff d0                	callq  *%rax
  802ddb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802dde:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802de2:	79 1d                	jns    802e01 <open+0xc5>
  802de4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802de8:	be 00 00 00 00       	mov    $0x0,%esi
  802ded:	48 89 c7             	mov    %rax,%rdi
  802df0:	48 b8 c4 24 80 00 00 	movabs $0x8024c4,%rax
  802df7:	00 00 00 
  802dfa:	ff d0                	callq  *%rax
  802dfc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802dff:	eb 13                	jmp    802e14 <open+0xd8>
  802e01:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e05:	48 89 c7             	mov    %rax,%rdi
  802e08:	48 b8 4e 23 80 00 00 	movabs $0x80234e,%rax
  802e0f:	00 00 00 
  802e12:	ff d0                	callq  *%rax
  802e14:	c9                   	leaveq 
  802e15:	c3                   	retq   

0000000000802e16 <devfile_flush>:
  802e16:	55                   	push   %rbp
  802e17:	48 89 e5             	mov    %rsp,%rbp
  802e1a:	48 83 ec 10          	sub    $0x10,%rsp
  802e1e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802e22:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802e26:	8b 50 0c             	mov    0xc(%rax),%edx
  802e29:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  802e30:	00 00 00 
  802e33:	89 10                	mov    %edx,(%rax)
  802e35:	be 00 00 00 00       	mov    $0x0,%esi
  802e3a:	bf 06 00 00 00       	mov    $0x6,%edi
  802e3f:	48 b8 b5 2c 80 00 00 	movabs $0x802cb5,%rax
  802e46:	00 00 00 
  802e49:	ff d0                	callq  *%rax
  802e4b:	c9                   	leaveq 
  802e4c:	c3                   	retq   

0000000000802e4d <devfile_read>:
  802e4d:	55                   	push   %rbp
  802e4e:	48 89 e5             	mov    %rsp,%rbp
  802e51:	48 83 ec 30          	sub    $0x30,%rsp
  802e55:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802e59:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802e5d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802e61:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e65:	8b 50 0c             	mov    0xc(%rax),%edx
  802e68:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  802e6f:	00 00 00 
  802e72:	89 10                	mov    %edx,(%rax)
  802e74:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  802e7b:	00 00 00 
  802e7e:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802e82:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802e86:	be 00 00 00 00       	mov    $0x0,%esi
  802e8b:	bf 03 00 00 00       	mov    $0x3,%edi
  802e90:	48 b8 b5 2c 80 00 00 	movabs $0x802cb5,%rax
  802e97:	00 00 00 
  802e9a:	ff d0                	callq  *%rax
  802e9c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e9f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ea3:	79 08                	jns    802ead <devfile_read+0x60>
  802ea5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ea8:	e9 a4 00 00 00       	jmpq   802f51 <devfile_read+0x104>
  802ead:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802eb0:	48 98                	cltq   
  802eb2:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802eb6:	76 35                	jbe    802eed <devfile_read+0xa0>
  802eb8:	48 b9 b6 56 80 00 00 	movabs $0x8056b6,%rcx
  802ebf:	00 00 00 
  802ec2:	48 ba bd 56 80 00 00 	movabs $0x8056bd,%rdx
  802ec9:	00 00 00 
  802ecc:	be 89 00 00 00       	mov    $0x89,%esi
  802ed1:	48 bf d2 56 80 00 00 	movabs $0x8056d2,%rdi
  802ed8:	00 00 00 
  802edb:	b8 00 00 00 00       	mov    $0x0,%eax
  802ee0:	49 b8 53 07 80 00 00 	movabs $0x800753,%r8
  802ee7:	00 00 00 
  802eea:	41 ff d0             	callq  *%r8
  802eed:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  802ef4:	7e 35                	jle    802f2b <devfile_read+0xde>
  802ef6:	48 b9 e0 56 80 00 00 	movabs $0x8056e0,%rcx
  802efd:	00 00 00 
  802f00:	48 ba bd 56 80 00 00 	movabs $0x8056bd,%rdx
  802f07:	00 00 00 
  802f0a:	be 8a 00 00 00       	mov    $0x8a,%esi
  802f0f:	48 bf d2 56 80 00 00 	movabs $0x8056d2,%rdi
  802f16:	00 00 00 
  802f19:	b8 00 00 00 00       	mov    $0x0,%eax
  802f1e:	49 b8 53 07 80 00 00 	movabs $0x800753,%r8
  802f25:	00 00 00 
  802f28:	41 ff d0             	callq  *%r8
  802f2b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f2e:	48 63 d0             	movslq %eax,%rdx
  802f31:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802f35:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  802f3c:	00 00 00 
  802f3f:	48 89 c7             	mov    %rax,%rdi
  802f42:	48 b8 65 18 80 00 00 	movabs $0x801865,%rax
  802f49:	00 00 00 
  802f4c:	ff d0                	callq  *%rax
  802f4e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f51:	c9                   	leaveq 
  802f52:	c3                   	retq   

0000000000802f53 <devfile_write>:
  802f53:	55                   	push   %rbp
  802f54:	48 89 e5             	mov    %rsp,%rbp
  802f57:	48 83 ec 40          	sub    $0x40,%rsp
  802f5b:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802f5f:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802f63:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802f67:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  802f6b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802f6f:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  802f76:	00 
  802f77:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f7b:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  802f7f:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  802f84:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  802f88:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802f8c:	8b 50 0c             	mov    0xc(%rax),%edx
  802f8f:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  802f96:	00 00 00 
  802f99:	89 10                	mov    %edx,(%rax)
  802f9b:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  802fa2:	00 00 00 
  802fa5:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802fa9:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802fad:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802fb1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802fb5:	48 89 c6             	mov    %rax,%rsi
  802fb8:	48 bf 10 b0 80 00 00 	movabs $0x80b010,%rdi
  802fbf:	00 00 00 
  802fc2:	48 b8 65 18 80 00 00 	movabs $0x801865,%rax
  802fc9:	00 00 00 
  802fcc:	ff d0                	callq  *%rax
  802fce:	be 00 00 00 00       	mov    $0x0,%esi
  802fd3:	bf 04 00 00 00       	mov    $0x4,%edi
  802fd8:	48 b8 b5 2c 80 00 00 	movabs $0x802cb5,%rax
  802fdf:	00 00 00 
  802fe2:	ff d0                	callq  *%rax
  802fe4:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802fe7:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802feb:	79 05                	jns    802ff2 <devfile_write+0x9f>
  802fed:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802ff0:	eb 43                	jmp    803035 <devfile_write+0xe2>
  802ff2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802ff5:	48 98                	cltq   
  802ff7:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  802ffb:	76 35                	jbe    803032 <devfile_write+0xdf>
  802ffd:	48 b9 b6 56 80 00 00 	movabs $0x8056b6,%rcx
  803004:	00 00 00 
  803007:	48 ba bd 56 80 00 00 	movabs $0x8056bd,%rdx
  80300e:	00 00 00 
  803011:	be a8 00 00 00       	mov    $0xa8,%esi
  803016:	48 bf d2 56 80 00 00 	movabs $0x8056d2,%rdi
  80301d:	00 00 00 
  803020:	b8 00 00 00 00       	mov    $0x0,%eax
  803025:	49 b8 53 07 80 00 00 	movabs $0x800753,%r8
  80302c:	00 00 00 
  80302f:	41 ff d0             	callq  *%r8
  803032:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803035:	c9                   	leaveq 
  803036:	c3                   	retq   

0000000000803037 <devfile_stat>:
  803037:	55                   	push   %rbp
  803038:	48 89 e5             	mov    %rsp,%rbp
  80303b:	48 83 ec 20          	sub    $0x20,%rsp
  80303f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803043:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803047:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80304b:	8b 50 0c             	mov    0xc(%rax),%edx
  80304e:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803055:	00 00 00 
  803058:	89 10                	mov    %edx,(%rax)
  80305a:	be 00 00 00 00       	mov    $0x0,%esi
  80305f:	bf 05 00 00 00       	mov    $0x5,%edi
  803064:	48 b8 b5 2c 80 00 00 	movabs $0x802cb5,%rax
  80306b:	00 00 00 
  80306e:	ff d0                	callq  *%rax
  803070:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803073:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803077:	79 05                	jns    80307e <devfile_stat+0x47>
  803079:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80307c:	eb 56                	jmp    8030d4 <devfile_stat+0x9d>
  80307e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803082:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  803089:	00 00 00 
  80308c:	48 89 c7             	mov    %rax,%rdi
  80308f:	48 b8 41 15 80 00 00 	movabs $0x801541,%rax
  803096:	00 00 00 
  803099:	ff d0                	callq  *%rax
  80309b:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8030a2:	00 00 00 
  8030a5:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  8030ab:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8030af:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  8030b5:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8030bc:	00 00 00 
  8030bf:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  8030c5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8030c9:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  8030cf:	b8 00 00 00 00       	mov    $0x0,%eax
  8030d4:	c9                   	leaveq 
  8030d5:	c3                   	retq   

00000000008030d6 <devfile_trunc>:
  8030d6:	55                   	push   %rbp
  8030d7:	48 89 e5             	mov    %rsp,%rbp
  8030da:	48 83 ec 10          	sub    $0x10,%rsp
  8030de:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8030e2:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8030e5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8030e9:	8b 50 0c             	mov    0xc(%rax),%edx
  8030ec:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8030f3:	00 00 00 
  8030f6:	89 10                	mov    %edx,(%rax)
  8030f8:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8030ff:	00 00 00 
  803102:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803105:	89 50 04             	mov    %edx,0x4(%rax)
  803108:	be 00 00 00 00       	mov    $0x0,%esi
  80310d:	bf 02 00 00 00       	mov    $0x2,%edi
  803112:	48 b8 b5 2c 80 00 00 	movabs $0x802cb5,%rax
  803119:	00 00 00 
  80311c:	ff d0                	callq  *%rax
  80311e:	c9                   	leaveq 
  80311f:	c3                   	retq   

0000000000803120 <remove>:
  803120:	55                   	push   %rbp
  803121:	48 89 e5             	mov    %rsp,%rbp
  803124:	48 83 ec 10          	sub    $0x10,%rsp
  803128:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80312c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803130:	48 89 c7             	mov    %rax,%rdi
  803133:	48 b8 d5 14 80 00 00 	movabs $0x8014d5,%rax
  80313a:	00 00 00 
  80313d:	ff d0                	callq  *%rax
  80313f:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  803144:	7e 07                	jle    80314d <remove+0x2d>
  803146:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  80314b:	eb 33                	jmp    803180 <remove+0x60>
  80314d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803151:	48 89 c6             	mov    %rax,%rsi
  803154:	48 bf 00 b0 80 00 00 	movabs $0x80b000,%rdi
  80315b:	00 00 00 
  80315e:	48 b8 41 15 80 00 00 	movabs $0x801541,%rax
  803165:	00 00 00 
  803168:	ff d0                	callq  *%rax
  80316a:	be 00 00 00 00       	mov    $0x0,%esi
  80316f:	bf 07 00 00 00       	mov    $0x7,%edi
  803174:	48 b8 b5 2c 80 00 00 	movabs $0x802cb5,%rax
  80317b:	00 00 00 
  80317e:	ff d0                	callq  *%rax
  803180:	c9                   	leaveq 
  803181:	c3                   	retq   

0000000000803182 <sync>:
  803182:	55                   	push   %rbp
  803183:	48 89 e5             	mov    %rsp,%rbp
  803186:	be 00 00 00 00       	mov    $0x0,%esi
  80318b:	bf 08 00 00 00       	mov    $0x8,%edi
  803190:	48 b8 b5 2c 80 00 00 	movabs $0x802cb5,%rax
  803197:	00 00 00 
  80319a:	ff d0                	callq  *%rax
  80319c:	5d                   	pop    %rbp
  80319d:	c3                   	retq   

000000000080319e <copy>:
  80319e:	55                   	push   %rbp
  80319f:	48 89 e5             	mov    %rsp,%rbp
  8031a2:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  8031a9:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  8031b0:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  8031b7:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  8031be:	be 00 00 00 00       	mov    $0x0,%esi
  8031c3:	48 89 c7             	mov    %rax,%rdi
  8031c6:	48 b8 3c 2d 80 00 00 	movabs $0x802d3c,%rax
  8031cd:	00 00 00 
  8031d0:	ff d0                	callq  *%rax
  8031d2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8031d5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8031d9:	79 28                	jns    803203 <copy+0x65>
  8031db:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031de:	89 c6                	mov    %eax,%esi
  8031e0:	48 bf ec 56 80 00 00 	movabs $0x8056ec,%rdi
  8031e7:	00 00 00 
  8031ea:	b8 00 00 00 00       	mov    $0x0,%eax
  8031ef:	48 ba 8c 09 80 00 00 	movabs $0x80098c,%rdx
  8031f6:	00 00 00 
  8031f9:	ff d2                	callq  *%rdx
  8031fb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031fe:	e9 74 01 00 00       	jmpq   803377 <copy+0x1d9>
  803203:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  80320a:	be 01 01 00 00       	mov    $0x101,%esi
  80320f:	48 89 c7             	mov    %rax,%rdi
  803212:	48 b8 3c 2d 80 00 00 	movabs $0x802d3c,%rax
  803219:	00 00 00 
  80321c:	ff d0                	callq  *%rax
  80321e:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803221:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803225:	79 39                	jns    803260 <copy+0xc2>
  803227:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80322a:	89 c6                	mov    %eax,%esi
  80322c:	48 bf 02 57 80 00 00 	movabs $0x805702,%rdi
  803233:	00 00 00 
  803236:	b8 00 00 00 00       	mov    $0x0,%eax
  80323b:	48 ba 8c 09 80 00 00 	movabs $0x80098c,%rdx
  803242:	00 00 00 
  803245:	ff d2                	callq  *%rdx
  803247:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80324a:	89 c7                	mov    %eax,%edi
  80324c:	48 b8 44 26 80 00 00 	movabs $0x802644,%rax
  803253:	00 00 00 
  803256:	ff d0                	callq  *%rax
  803258:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80325b:	e9 17 01 00 00       	jmpq   803377 <copy+0x1d9>
  803260:	eb 74                	jmp    8032d6 <copy+0x138>
  803262:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803265:	48 63 d0             	movslq %eax,%rdx
  803268:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  80326f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803272:	48 89 ce             	mov    %rcx,%rsi
  803275:	89 c7                	mov    %eax,%edi
  803277:	48 b8 b0 29 80 00 00 	movabs $0x8029b0,%rax
  80327e:	00 00 00 
  803281:	ff d0                	callq  *%rax
  803283:	89 45 f0             	mov    %eax,-0x10(%rbp)
  803286:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  80328a:	79 4a                	jns    8032d6 <copy+0x138>
  80328c:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80328f:	89 c6                	mov    %eax,%esi
  803291:	48 bf 1c 57 80 00 00 	movabs $0x80571c,%rdi
  803298:	00 00 00 
  80329b:	b8 00 00 00 00       	mov    $0x0,%eax
  8032a0:	48 ba 8c 09 80 00 00 	movabs $0x80098c,%rdx
  8032a7:	00 00 00 
  8032aa:	ff d2                	callq  *%rdx
  8032ac:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032af:	89 c7                	mov    %eax,%edi
  8032b1:	48 b8 44 26 80 00 00 	movabs $0x802644,%rax
  8032b8:	00 00 00 
  8032bb:	ff d0                	callq  *%rax
  8032bd:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8032c0:	89 c7                	mov    %eax,%edi
  8032c2:	48 b8 44 26 80 00 00 	movabs $0x802644,%rax
  8032c9:	00 00 00 
  8032cc:	ff d0                	callq  *%rax
  8032ce:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8032d1:	e9 a1 00 00 00       	jmpq   803377 <copy+0x1d9>
  8032d6:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  8032dd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032e0:	ba 00 02 00 00       	mov    $0x200,%edx
  8032e5:	48 89 ce             	mov    %rcx,%rsi
  8032e8:	89 c7                	mov    %eax,%edi
  8032ea:	48 b8 66 28 80 00 00 	movabs $0x802866,%rax
  8032f1:	00 00 00 
  8032f4:	ff d0                	callq  *%rax
  8032f6:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8032f9:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8032fd:	0f 8f 5f ff ff ff    	jg     803262 <copy+0xc4>
  803303:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  803307:	79 47                	jns    803350 <copy+0x1b2>
  803309:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80330c:	89 c6                	mov    %eax,%esi
  80330e:	48 bf 2f 57 80 00 00 	movabs $0x80572f,%rdi
  803315:	00 00 00 
  803318:	b8 00 00 00 00       	mov    $0x0,%eax
  80331d:	48 ba 8c 09 80 00 00 	movabs $0x80098c,%rdx
  803324:	00 00 00 
  803327:	ff d2                	callq  *%rdx
  803329:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80332c:	89 c7                	mov    %eax,%edi
  80332e:	48 b8 44 26 80 00 00 	movabs $0x802644,%rax
  803335:	00 00 00 
  803338:	ff d0                	callq  *%rax
  80333a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80333d:	89 c7                	mov    %eax,%edi
  80333f:	48 b8 44 26 80 00 00 	movabs $0x802644,%rax
  803346:	00 00 00 
  803349:	ff d0                	callq  *%rax
  80334b:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80334e:	eb 27                	jmp    803377 <copy+0x1d9>
  803350:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803353:	89 c7                	mov    %eax,%edi
  803355:	48 b8 44 26 80 00 00 	movabs $0x802644,%rax
  80335c:	00 00 00 
  80335f:	ff d0                	callq  *%rax
  803361:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803364:	89 c7                	mov    %eax,%edi
  803366:	48 b8 44 26 80 00 00 	movabs $0x802644,%rax
  80336d:	00 00 00 
  803370:	ff d0                	callq  *%rax
  803372:	b8 00 00 00 00       	mov    $0x0,%eax
  803377:	c9                   	leaveq 
  803378:	c3                   	retq   

0000000000803379 <spawn>:
  803379:	55                   	push   %rbp
  80337a:	48 89 e5             	mov    %rsp,%rbp
  80337d:	48 81 ec 10 03 00 00 	sub    $0x310,%rsp
  803384:	48 89 bd 08 fd ff ff 	mov    %rdi,-0x2f8(%rbp)
  80338b:	48 89 b5 00 fd ff ff 	mov    %rsi,-0x300(%rbp)
  803392:	48 8b 85 08 fd ff ff 	mov    -0x2f8(%rbp),%rax
  803399:	be 00 00 00 00       	mov    $0x0,%esi
  80339e:	48 89 c7             	mov    %rax,%rdi
  8033a1:	48 b8 3c 2d 80 00 00 	movabs $0x802d3c,%rax
  8033a8:	00 00 00 
  8033ab:	ff d0                	callq  *%rax
  8033ad:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8033b0:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  8033b4:	79 08                	jns    8033be <spawn+0x45>
  8033b6:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8033b9:	e9 0c 03 00 00       	jmpq   8036ca <spawn+0x351>
  8033be:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8033c1:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  8033c4:	48 8d 85 d0 fd ff ff 	lea    -0x230(%rbp),%rax
  8033cb:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  8033cf:	48 8d 8d d0 fd ff ff 	lea    -0x230(%rbp),%rcx
  8033d6:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8033d9:	ba 00 02 00 00       	mov    $0x200,%edx
  8033de:	48 89 ce             	mov    %rcx,%rsi
  8033e1:	89 c7                	mov    %eax,%edi
  8033e3:	48 b8 3b 29 80 00 00 	movabs $0x80293b,%rax
  8033ea:	00 00 00 
  8033ed:	ff d0                	callq  *%rax
  8033ef:	3d 00 02 00 00       	cmp    $0x200,%eax
  8033f4:	75 0d                	jne    803403 <spawn+0x8a>
  8033f6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8033fa:	8b 00                	mov    (%rax),%eax
  8033fc:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
  803401:	74 43                	je     803446 <spawn+0xcd>
  803403:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  803406:	89 c7                	mov    %eax,%edi
  803408:	48 b8 44 26 80 00 00 	movabs $0x802644,%rax
  80340f:	00 00 00 
  803412:	ff d0                	callq  *%rax
  803414:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803418:	8b 00                	mov    (%rax),%eax
  80341a:	ba 7f 45 4c 46       	mov    $0x464c457f,%edx
  80341f:	89 c6                	mov    %eax,%esi
  803421:	48 bf 48 57 80 00 00 	movabs $0x805748,%rdi
  803428:	00 00 00 
  80342b:	b8 00 00 00 00       	mov    $0x0,%eax
  803430:	48 b9 8c 09 80 00 00 	movabs $0x80098c,%rcx
  803437:	00 00 00 
  80343a:	ff d1                	callq  *%rcx
  80343c:	b8 f1 ff ff ff       	mov    $0xfffffff1,%eax
  803441:	e9 84 02 00 00       	jmpq   8036ca <spawn+0x351>
  803446:	b8 07 00 00 00       	mov    $0x7,%eax
  80344b:	cd 30                	int    $0x30
  80344d:	89 45 d0             	mov    %eax,-0x30(%rbp)
  803450:	8b 45 d0             	mov    -0x30(%rbp),%eax
  803453:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803456:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  80345a:	79 08                	jns    803464 <spawn+0xeb>
  80345c:	8b 45 e8             	mov    -0x18(%rbp),%eax
  80345f:	e9 66 02 00 00       	jmpq   8036ca <spawn+0x351>
  803464:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803467:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  80346a:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  80346d:	25 ff 03 00 00       	and    $0x3ff,%eax
  803472:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  803479:	00 00 00 
  80347c:	48 98                	cltq   
  80347e:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  803485:	48 01 d0             	add    %rdx,%rax
  803488:	48 8d 95 10 fd ff ff 	lea    -0x2f0(%rbp),%rdx
  80348f:	48 89 c6             	mov    %rax,%rsi
  803492:	b8 18 00 00 00       	mov    $0x18,%eax
  803497:	48 89 d7             	mov    %rdx,%rdi
  80349a:	48 89 c1             	mov    %rax,%rcx
  80349d:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
  8034a0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8034a4:	48 8b 40 18          	mov    0x18(%rax),%rax
  8034a8:	48 89 85 a8 fd ff ff 	mov    %rax,-0x258(%rbp)
  8034af:	48 8d 85 10 fd ff ff 	lea    -0x2f0(%rbp),%rax
  8034b6:	48 8d 90 b0 00 00 00 	lea    0xb0(%rax),%rdx
  8034bd:	48 8b 8d 00 fd ff ff 	mov    -0x300(%rbp),%rcx
  8034c4:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  8034c7:	48 89 ce             	mov    %rcx,%rsi
  8034ca:	89 c7                	mov    %eax,%edi
  8034cc:	48 b8 34 39 80 00 00 	movabs $0x803934,%rax
  8034d3:	00 00 00 
  8034d6:	ff d0                	callq  *%rax
  8034d8:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8034db:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  8034df:	79 08                	jns    8034e9 <spawn+0x170>
  8034e1:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8034e4:	e9 e1 01 00 00       	jmpq   8036ca <spawn+0x351>
  8034e9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8034ed:	48 8b 40 20          	mov    0x20(%rax),%rax
  8034f1:	48 8d 95 d0 fd ff ff 	lea    -0x230(%rbp),%rdx
  8034f8:	48 01 d0             	add    %rdx,%rax
  8034fb:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8034ff:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803506:	e9 a3 00 00 00       	jmpq   8035ae <spawn+0x235>
  80350b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80350f:	8b 00                	mov    (%rax),%eax
  803511:	83 f8 01             	cmp    $0x1,%eax
  803514:	74 05                	je     80351b <spawn+0x1a2>
  803516:	e9 8a 00 00 00       	jmpq   8035a5 <spawn+0x22c>
  80351b:	c7 45 ec 05 00 00 00 	movl   $0x5,-0x14(%rbp)
  803522:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803526:	8b 40 04             	mov    0x4(%rax),%eax
  803529:	83 e0 02             	and    $0x2,%eax
  80352c:	85 c0                	test   %eax,%eax
  80352e:	74 04                	je     803534 <spawn+0x1bb>
  803530:	83 4d ec 02          	orl    $0x2,-0x14(%rbp)
  803534:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803538:	48 8b 40 08          	mov    0x8(%rax),%rax
  80353c:	41 89 c1             	mov    %eax,%r9d
  80353f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803543:	4c 8b 40 20          	mov    0x20(%rax),%r8
  803547:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80354b:	48 8b 50 28          	mov    0x28(%rax),%rdx
  80354f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803553:	48 8b 70 10          	mov    0x10(%rax),%rsi
  803557:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  80355a:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  80355d:	8b 7d ec             	mov    -0x14(%rbp),%edi
  803560:	89 3c 24             	mov    %edi,(%rsp)
  803563:	89 c7                	mov    %eax,%edi
  803565:	48 b8 dd 3b 80 00 00 	movabs $0x803bdd,%rax
  80356c:	00 00 00 
  80356f:	ff d0                	callq  *%rax
  803571:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803574:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  803578:	79 2b                	jns    8035a5 <spawn+0x22c>
  80357a:	90                   	nop
  80357b:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  80357e:	89 c7                	mov    %eax,%edi
  803580:	48 b8 b0 1d 80 00 00 	movabs $0x801db0,%rax
  803587:	00 00 00 
  80358a:	ff d0                	callq  *%rax
  80358c:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80358f:	89 c7                	mov    %eax,%edi
  803591:	48 b8 44 26 80 00 00 	movabs $0x802644,%rax
  803598:	00 00 00 
  80359b:	ff d0                	callq  *%rax
  80359d:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8035a0:	e9 25 01 00 00       	jmpq   8036ca <spawn+0x351>
  8035a5:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8035a9:	48 83 45 f0 38       	addq   $0x38,-0x10(%rbp)
  8035ae:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8035b2:	0f b7 40 38          	movzwl 0x38(%rax),%eax
  8035b6:	0f b7 c0             	movzwl %ax,%eax
  8035b9:	3b 45 fc             	cmp    -0x4(%rbp),%eax
  8035bc:	0f 8f 49 ff ff ff    	jg     80350b <spawn+0x192>
  8035c2:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8035c5:	89 c7                	mov    %eax,%edi
  8035c7:	48 b8 44 26 80 00 00 	movabs $0x802644,%rax
  8035ce:	00 00 00 
  8035d1:	ff d0                	callq  *%rax
  8035d3:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%rbp)
  8035da:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  8035dd:	89 c7                	mov    %eax,%edi
  8035df:	48 b8 c9 3d 80 00 00 	movabs $0x803dc9,%rax
  8035e6:	00 00 00 
  8035e9:	ff d0                	callq  *%rax
  8035eb:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8035ee:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  8035f2:	79 30                	jns    803624 <spawn+0x2ab>
  8035f4:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8035f7:	89 c1                	mov    %eax,%ecx
  8035f9:	48 ba 62 57 80 00 00 	movabs $0x805762,%rdx
  803600:	00 00 00 
  803603:	be 86 00 00 00       	mov    $0x86,%esi
  803608:	48 bf 78 57 80 00 00 	movabs $0x805778,%rdi
  80360f:	00 00 00 
  803612:	b8 00 00 00 00       	mov    $0x0,%eax
  803617:	49 b8 53 07 80 00 00 	movabs $0x800753,%r8
  80361e:	00 00 00 
  803621:	41 ff d0             	callq  *%r8
  803624:	48 8d 95 10 fd ff ff 	lea    -0x2f0(%rbp),%rdx
  80362b:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  80362e:	48 89 d6             	mov    %rdx,%rsi
  803631:	89 c7                	mov    %eax,%edi
  803633:	48 b8 b0 1f 80 00 00 	movabs $0x801fb0,%rax
  80363a:	00 00 00 
  80363d:	ff d0                	callq  *%rax
  80363f:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803642:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  803646:	79 30                	jns    803678 <spawn+0x2ff>
  803648:	8b 45 e8             	mov    -0x18(%rbp),%eax
  80364b:	89 c1                	mov    %eax,%ecx
  80364d:	48 ba 87 57 80 00 00 	movabs $0x805787,%rdx
  803654:	00 00 00 
  803657:	be 8a 00 00 00       	mov    $0x8a,%esi
  80365c:	48 bf 78 57 80 00 00 	movabs $0x805778,%rdi
  803663:	00 00 00 
  803666:	b8 00 00 00 00       	mov    $0x0,%eax
  80366b:	49 b8 53 07 80 00 00 	movabs $0x800753,%r8
  803672:	00 00 00 
  803675:	41 ff d0             	callq  *%r8
  803678:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  80367b:	be 02 00 00 00       	mov    $0x2,%esi
  803680:	89 c7                	mov    %eax,%edi
  803682:	48 b8 65 1f 80 00 00 	movabs $0x801f65,%rax
  803689:	00 00 00 
  80368c:	ff d0                	callq  *%rax
  80368e:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803691:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  803695:	79 30                	jns    8036c7 <spawn+0x34e>
  803697:	8b 45 e8             	mov    -0x18(%rbp),%eax
  80369a:	89 c1                	mov    %eax,%ecx
  80369c:	48 ba a1 57 80 00 00 	movabs $0x8057a1,%rdx
  8036a3:	00 00 00 
  8036a6:	be 8d 00 00 00       	mov    $0x8d,%esi
  8036ab:	48 bf 78 57 80 00 00 	movabs $0x805778,%rdi
  8036b2:	00 00 00 
  8036b5:	b8 00 00 00 00       	mov    $0x0,%eax
  8036ba:	49 b8 53 07 80 00 00 	movabs $0x800753,%r8
  8036c1:	00 00 00 
  8036c4:	41 ff d0             	callq  *%r8
  8036c7:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  8036ca:	c9                   	leaveq 
  8036cb:	c3                   	retq   

00000000008036cc <spawnl>:
  8036cc:	55                   	push   %rbp
  8036cd:	48 89 e5             	mov    %rsp,%rbp
  8036d0:	41 55                	push   %r13
  8036d2:	41 54                	push   %r12
  8036d4:	53                   	push   %rbx
  8036d5:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  8036dc:	48 89 bd f8 fe ff ff 	mov    %rdi,-0x108(%rbp)
  8036e3:	48 89 95 40 ff ff ff 	mov    %rdx,-0xc0(%rbp)
  8036ea:	48 89 8d 48 ff ff ff 	mov    %rcx,-0xb8(%rbp)
  8036f1:	4c 89 85 50 ff ff ff 	mov    %r8,-0xb0(%rbp)
  8036f8:	4c 89 8d 58 ff ff ff 	mov    %r9,-0xa8(%rbp)
  8036ff:	84 c0                	test   %al,%al
  803701:	74 26                	je     803729 <spawnl+0x5d>
  803703:	0f 29 85 60 ff ff ff 	movaps %xmm0,-0xa0(%rbp)
  80370a:	0f 29 8d 70 ff ff ff 	movaps %xmm1,-0x90(%rbp)
  803711:	0f 29 55 80          	movaps %xmm2,-0x80(%rbp)
  803715:	0f 29 5d 90          	movaps %xmm3,-0x70(%rbp)
  803719:	0f 29 65 a0          	movaps %xmm4,-0x60(%rbp)
  80371d:	0f 29 6d b0          	movaps %xmm5,-0x50(%rbp)
  803721:	0f 29 75 c0          	movaps %xmm6,-0x40(%rbp)
  803725:	0f 29 7d d0          	movaps %xmm7,-0x30(%rbp)
  803729:	48 89 b5 f0 fe ff ff 	mov    %rsi,-0x110(%rbp)
  803730:	c7 85 2c ff ff ff 00 	movl   $0x0,-0xd4(%rbp)
  803737:	00 00 00 
  80373a:	c7 85 00 ff ff ff 10 	movl   $0x10,-0x100(%rbp)
  803741:	00 00 00 
  803744:	c7 85 04 ff ff ff 30 	movl   $0x30,-0xfc(%rbp)
  80374b:	00 00 00 
  80374e:	48 8d 45 10          	lea    0x10(%rbp),%rax
  803752:	48 89 85 08 ff ff ff 	mov    %rax,-0xf8(%rbp)
  803759:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
  803760:	48 89 85 10 ff ff ff 	mov    %rax,-0xf0(%rbp)
  803767:	eb 07                	jmp    803770 <spawnl+0xa4>
  803769:	83 85 2c ff ff ff 01 	addl   $0x1,-0xd4(%rbp)
  803770:	8b 85 00 ff ff ff    	mov    -0x100(%rbp),%eax
  803776:	83 f8 30             	cmp    $0x30,%eax
  803779:	73 23                	jae    80379e <spawnl+0xd2>
  80377b:	48 8b 95 10 ff ff ff 	mov    -0xf0(%rbp),%rdx
  803782:	8b 85 00 ff ff ff    	mov    -0x100(%rbp),%eax
  803788:	89 c0                	mov    %eax,%eax
  80378a:	48 01 d0             	add    %rdx,%rax
  80378d:	8b 95 00 ff ff ff    	mov    -0x100(%rbp),%edx
  803793:	83 c2 08             	add    $0x8,%edx
  803796:	89 95 00 ff ff ff    	mov    %edx,-0x100(%rbp)
  80379c:	eb 15                	jmp    8037b3 <spawnl+0xe7>
  80379e:	48 8b 95 08 ff ff ff 	mov    -0xf8(%rbp),%rdx
  8037a5:	48 89 d0             	mov    %rdx,%rax
  8037a8:	48 83 c2 08          	add    $0x8,%rdx
  8037ac:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  8037b3:	48 8b 00             	mov    (%rax),%rax
  8037b6:	48 85 c0             	test   %rax,%rax
  8037b9:	75 ae                	jne    803769 <spawnl+0x9d>
  8037bb:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  8037c1:	83 c0 02             	add    $0x2,%eax
  8037c4:	48 89 e2             	mov    %rsp,%rdx
  8037c7:	48 89 d3             	mov    %rdx,%rbx
  8037ca:	48 63 d0             	movslq %eax,%rdx
  8037cd:	48 83 ea 01          	sub    $0x1,%rdx
  8037d1:	48 89 95 20 ff ff ff 	mov    %rdx,-0xe0(%rbp)
  8037d8:	48 63 d0             	movslq %eax,%rdx
  8037db:	49 89 d4             	mov    %rdx,%r12
  8037de:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  8037e4:	48 63 d0             	movslq %eax,%rdx
  8037e7:	49 89 d2             	mov    %rdx,%r10
  8037ea:	41 bb 00 00 00 00    	mov    $0x0,%r11d
  8037f0:	48 98                	cltq   
  8037f2:	48 c1 e0 03          	shl    $0x3,%rax
  8037f6:	48 8d 50 07          	lea    0x7(%rax),%rdx
  8037fa:	b8 10 00 00 00       	mov    $0x10,%eax
  8037ff:	48 83 e8 01          	sub    $0x1,%rax
  803803:	48 01 d0             	add    %rdx,%rax
  803806:	bf 10 00 00 00       	mov    $0x10,%edi
  80380b:	ba 00 00 00 00       	mov    $0x0,%edx
  803810:	48 f7 f7             	div    %rdi
  803813:	48 6b c0 10          	imul   $0x10,%rax,%rax
  803817:	48 29 c4             	sub    %rax,%rsp
  80381a:	48 89 e0             	mov    %rsp,%rax
  80381d:	48 83 c0 07          	add    $0x7,%rax
  803821:	48 c1 e8 03          	shr    $0x3,%rax
  803825:	48 c1 e0 03          	shl    $0x3,%rax
  803829:	48 89 85 18 ff ff ff 	mov    %rax,-0xe8(%rbp)
  803830:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  803837:	48 8b 95 f0 fe ff ff 	mov    -0x110(%rbp),%rdx
  80383e:	48 89 10             	mov    %rdx,(%rax)
  803841:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  803847:	8d 50 01             	lea    0x1(%rax),%edx
  80384a:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  803851:	48 63 d2             	movslq %edx,%rdx
  803854:	48 c7 04 d0 00 00 00 	movq   $0x0,(%rax,%rdx,8)
  80385b:	00 
  80385c:	c7 85 00 ff ff ff 10 	movl   $0x10,-0x100(%rbp)
  803863:	00 00 00 
  803866:	c7 85 04 ff ff ff 30 	movl   $0x30,-0xfc(%rbp)
  80386d:	00 00 00 
  803870:	48 8d 45 10          	lea    0x10(%rbp),%rax
  803874:	48 89 85 08 ff ff ff 	mov    %rax,-0xf8(%rbp)
  80387b:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
  803882:	48 89 85 10 ff ff ff 	mov    %rax,-0xf0(%rbp)
  803889:	c7 85 28 ff ff ff 00 	movl   $0x0,-0xd8(%rbp)
  803890:	00 00 00 
  803893:	eb 63                	jmp    8038f8 <spawnl+0x22c>
  803895:	8b 85 28 ff ff ff    	mov    -0xd8(%rbp),%eax
  80389b:	8d 70 01             	lea    0x1(%rax),%esi
  80389e:	8b 85 00 ff ff ff    	mov    -0x100(%rbp),%eax
  8038a4:	83 f8 30             	cmp    $0x30,%eax
  8038a7:	73 23                	jae    8038cc <spawnl+0x200>
  8038a9:	48 8b 95 10 ff ff ff 	mov    -0xf0(%rbp),%rdx
  8038b0:	8b 85 00 ff ff ff    	mov    -0x100(%rbp),%eax
  8038b6:	89 c0                	mov    %eax,%eax
  8038b8:	48 01 d0             	add    %rdx,%rax
  8038bb:	8b 95 00 ff ff ff    	mov    -0x100(%rbp),%edx
  8038c1:	83 c2 08             	add    $0x8,%edx
  8038c4:	89 95 00 ff ff ff    	mov    %edx,-0x100(%rbp)
  8038ca:	eb 15                	jmp    8038e1 <spawnl+0x215>
  8038cc:	48 8b 95 08 ff ff ff 	mov    -0xf8(%rbp),%rdx
  8038d3:	48 89 d0             	mov    %rdx,%rax
  8038d6:	48 83 c2 08          	add    $0x8,%rdx
  8038da:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  8038e1:	48 8b 08             	mov    (%rax),%rcx
  8038e4:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  8038eb:	89 f2                	mov    %esi,%edx
  8038ed:	48 89 0c d0          	mov    %rcx,(%rax,%rdx,8)
  8038f1:	83 85 28 ff ff ff 01 	addl   $0x1,-0xd8(%rbp)
  8038f8:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  8038fe:	3b 85 28 ff ff ff    	cmp    -0xd8(%rbp),%eax
  803904:	77 8f                	ja     803895 <spawnl+0x1c9>
  803906:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  80390d:	48 8b 85 f8 fe ff ff 	mov    -0x108(%rbp),%rax
  803914:	48 89 d6             	mov    %rdx,%rsi
  803917:	48 89 c7             	mov    %rax,%rdi
  80391a:	48 b8 79 33 80 00 00 	movabs $0x803379,%rax
  803921:	00 00 00 
  803924:	ff d0                	callq  *%rax
  803926:	48 89 dc             	mov    %rbx,%rsp
  803929:	48 8d 65 e8          	lea    -0x18(%rbp),%rsp
  80392d:	5b                   	pop    %rbx
  80392e:	41 5c                	pop    %r12
  803930:	41 5d                	pop    %r13
  803932:	5d                   	pop    %rbp
  803933:	c3                   	retq   

0000000000803934 <init_stack>:
  803934:	55                   	push   %rbp
  803935:	48 89 e5             	mov    %rsp,%rbp
  803938:	48 83 ec 50          	sub    $0x50,%rsp
  80393c:	89 7d cc             	mov    %edi,-0x34(%rbp)
  80393f:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
  803943:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  803947:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80394e:	00 
  80394f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
  803956:	eb 33                	jmp    80398b <init_stack+0x57>
  803958:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80395b:	48 98                	cltq   
  80395d:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  803964:	00 
  803965:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  803969:	48 01 d0             	add    %rdx,%rax
  80396c:	48 8b 00             	mov    (%rax),%rax
  80396f:	48 89 c7             	mov    %rax,%rdi
  803972:	48 b8 d5 14 80 00 00 	movabs $0x8014d5,%rax
  803979:	00 00 00 
  80397c:	ff d0                	callq  *%rax
  80397e:	83 c0 01             	add    $0x1,%eax
  803981:	48 98                	cltq   
  803983:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  803987:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
  80398b:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80398e:	48 98                	cltq   
  803990:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  803997:	00 
  803998:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  80399c:	48 01 d0             	add    %rdx,%rax
  80399f:	48 8b 00             	mov    (%rax),%rax
  8039a2:	48 85 c0             	test   %rax,%rax
  8039a5:	75 b1                	jne    803958 <init_stack+0x24>
  8039a7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8039ab:	48 f7 d8             	neg    %rax
  8039ae:	48 05 00 10 40 00    	add    $0x401000,%rax
  8039b4:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8039b8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8039bc:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  8039c0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8039c4:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  8039c8:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8039cb:	83 c2 01             	add    $0x1,%edx
  8039ce:	c1 e2 03             	shl    $0x3,%edx
  8039d1:	48 63 d2             	movslq %edx,%rdx
  8039d4:	48 f7 da             	neg    %rdx
  8039d7:	48 01 d0             	add    %rdx,%rax
  8039da:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  8039de:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8039e2:	48 83 e8 10          	sub    $0x10,%rax
  8039e6:	48 3d ff ff 3f 00    	cmp    $0x3fffff,%rax
  8039ec:	77 0a                	ja     8039f8 <init_stack+0xc4>
  8039ee:	b8 fc ff ff ff       	mov    $0xfffffffc,%eax
  8039f3:	e9 e3 01 00 00       	jmpq   803bdb <init_stack+0x2a7>
  8039f8:	ba 07 00 00 00       	mov    $0x7,%edx
  8039fd:	be 00 00 40 00       	mov    $0x400000,%esi
  803a02:	bf 00 00 00 00       	mov    $0x0,%edi
  803a07:	48 b8 70 1e 80 00 00 	movabs $0x801e70,%rax
  803a0e:	00 00 00 
  803a11:	ff d0                	callq  *%rax
  803a13:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803a16:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803a1a:	79 08                	jns    803a24 <init_stack+0xf0>
  803a1c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803a1f:	e9 b7 01 00 00       	jmpq   803bdb <init_stack+0x2a7>
  803a24:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
  803a2b:	e9 8a 00 00 00       	jmpq   803aba <init_stack+0x186>
  803a30:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803a33:	48 98                	cltq   
  803a35:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  803a3c:	00 
  803a3d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803a41:	48 01 c2             	add    %rax,%rdx
  803a44:	b9 00 d0 7f ef       	mov    $0xef7fd000,%ecx
  803a49:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803a4d:	48 01 c8             	add    %rcx,%rax
  803a50:	48 2d 00 00 40 00    	sub    $0x400000,%rax
  803a56:	48 89 02             	mov    %rax,(%rdx)
  803a59:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803a5c:	48 98                	cltq   
  803a5e:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  803a65:	00 
  803a66:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  803a6a:	48 01 d0             	add    %rdx,%rax
  803a6d:	48 8b 10             	mov    (%rax),%rdx
  803a70:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803a74:	48 89 d6             	mov    %rdx,%rsi
  803a77:	48 89 c7             	mov    %rax,%rdi
  803a7a:	48 b8 41 15 80 00 00 	movabs $0x801541,%rax
  803a81:	00 00 00 
  803a84:	ff d0                	callq  *%rax
  803a86:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803a89:	48 98                	cltq   
  803a8b:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  803a92:	00 
  803a93:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  803a97:	48 01 d0             	add    %rdx,%rax
  803a9a:	48 8b 00             	mov    (%rax),%rax
  803a9d:	48 89 c7             	mov    %rax,%rdi
  803aa0:	48 b8 d5 14 80 00 00 	movabs $0x8014d5,%rax
  803aa7:	00 00 00 
  803aaa:	ff d0                	callq  *%rax
  803aac:	48 98                	cltq   
  803aae:	48 83 c0 01          	add    $0x1,%rax
  803ab2:	48 01 45 e0          	add    %rax,-0x20(%rbp)
  803ab6:	83 45 f0 01          	addl   $0x1,-0x10(%rbp)
  803aba:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803abd:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  803ac0:	0f 8c 6a ff ff ff    	jl     803a30 <init_stack+0xfc>
  803ac6:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803ac9:	48 98                	cltq   
  803acb:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  803ad2:	00 
  803ad3:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803ad7:	48 01 d0             	add    %rdx,%rax
  803ada:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  803ae1:	48 81 7d e0 00 10 40 	cmpq   $0x401000,-0x20(%rbp)
  803ae8:	00 
  803ae9:	74 35                	je     803b20 <init_stack+0x1ec>
  803aeb:	48 b9 b8 57 80 00 00 	movabs $0x8057b8,%rcx
  803af2:	00 00 00 
  803af5:	48 ba de 57 80 00 00 	movabs $0x8057de,%rdx
  803afc:	00 00 00 
  803aff:	be f6 00 00 00       	mov    $0xf6,%esi
  803b04:	48 bf 78 57 80 00 00 	movabs $0x805778,%rdi
  803b0b:	00 00 00 
  803b0e:	b8 00 00 00 00       	mov    $0x0,%eax
  803b13:	49 b8 53 07 80 00 00 	movabs $0x800753,%r8
  803b1a:	00 00 00 
  803b1d:	41 ff d0             	callq  *%r8
  803b20:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803b24:	48 8d 50 f8          	lea    -0x8(%rax),%rdx
  803b28:	b9 00 d0 7f ef       	mov    $0xef7fd000,%ecx
  803b2d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803b31:	48 01 c8             	add    %rcx,%rax
  803b34:	48 2d 00 00 40 00    	sub    $0x400000,%rax
  803b3a:	48 89 02             	mov    %rax,(%rdx)
  803b3d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803b41:	48 8d 50 f0          	lea    -0x10(%rax),%rdx
  803b45:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803b48:	48 98                	cltq   
  803b4a:	48 89 02             	mov    %rax,(%rdx)
  803b4d:	ba f0 cf 7f ef       	mov    $0xef7fcff0,%edx
  803b52:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803b56:	48 01 d0             	add    %rdx,%rax
  803b59:	48 2d 00 00 40 00    	sub    $0x400000,%rax
  803b5f:	48 89 c2             	mov    %rax,%rdx
  803b62:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  803b66:	48 89 10             	mov    %rdx,(%rax)
  803b69:	8b 45 cc             	mov    -0x34(%rbp),%eax
  803b6c:	41 b8 07 00 00 00    	mov    $0x7,%r8d
  803b72:	b9 00 d0 7f ef       	mov    $0xef7fd000,%ecx
  803b77:	89 c2                	mov    %eax,%edx
  803b79:	be 00 00 40 00       	mov    $0x400000,%esi
  803b7e:	bf 00 00 00 00       	mov    $0x0,%edi
  803b83:	48 b8 c0 1e 80 00 00 	movabs $0x801ec0,%rax
  803b8a:	00 00 00 
  803b8d:	ff d0                	callq  *%rax
  803b8f:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803b92:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803b96:	79 02                	jns    803b9a <init_stack+0x266>
  803b98:	eb 28                	jmp    803bc2 <init_stack+0x28e>
  803b9a:	be 00 00 40 00       	mov    $0x400000,%esi
  803b9f:	bf 00 00 00 00       	mov    $0x0,%edi
  803ba4:	48 b8 1b 1f 80 00 00 	movabs $0x801f1b,%rax
  803bab:	00 00 00 
  803bae:	ff d0                	callq  *%rax
  803bb0:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803bb3:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803bb7:	79 02                	jns    803bbb <init_stack+0x287>
  803bb9:	eb 07                	jmp    803bc2 <init_stack+0x28e>
  803bbb:	b8 00 00 00 00       	mov    $0x0,%eax
  803bc0:	eb 19                	jmp    803bdb <init_stack+0x2a7>
  803bc2:	be 00 00 40 00       	mov    $0x400000,%esi
  803bc7:	bf 00 00 00 00       	mov    $0x0,%edi
  803bcc:	48 b8 1b 1f 80 00 00 	movabs $0x801f1b,%rax
  803bd3:	00 00 00 
  803bd6:	ff d0                	callq  *%rax
  803bd8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803bdb:	c9                   	leaveq 
  803bdc:	c3                   	retq   

0000000000803bdd <map_segment>:
  803bdd:	55                   	push   %rbp
  803bde:	48 89 e5             	mov    %rsp,%rbp
  803be1:	48 83 ec 50          	sub    $0x50,%rsp
  803be5:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803be8:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803bec:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803bf0:	89 4d d8             	mov    %ecx,-0x28(%rbp)
  803bf3:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  803bf7:	44 89 4d bc          	mov    %r9d,-0x44(%rbp)
  803bfb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803bff:	25 ff 0f 00 00       	and    $0xfff,%eax
  803c04:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803c07:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803c0b:	74 21                	je     803c2e <map_segment+0x51>
  803c0d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c10:	48 98                	cltq   
  803c12:	48 29 45 d0          	sub    %rax,-0x30(%rbp)
  803c16:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c19:	48 98                	cltq   
  803c1b:	48 01 45 c8          	add    %rax,-0x38(%rbp)
  803c1f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c22:	48 98                	cltq   
  803c24:	48 01 45 c0          	add    %rax,-0x40(%rbp)
  803c28:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c2b:	29 45 bc             	sub    %eax,-0x44(%rbp)
  803c2e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803c35:	e9 79 01 00 00       	jmpq   803db3 <map_segment+0x1d6>
  803c3a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c3d:	48 98                	cltq   
  803c3f:	48 3b 45 c0          	cmp    -0x40(%rbp),%rax
  803c43:	72 3c                	jb     803c81 <map_segment+0xa4>
  803c45:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c48:	48 63 d0             	movslq %eax,%rdx
  803c4b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803c4f:	48 01 d0             	add    %rdx,%rax
  803c52:	48 89 c1             	mov    %rax,%rcx
  803c55:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803c58:	8b 55 10             	mov    0x10(%rbp),%edx
  803c5b:	48 89 ce             	mov    %rcx,%rsi
  803c5e:	89 c7                	mov    %eax,%edi
  803c60:	48 b8 70 1e 80 00 00 	movabs $0x801e70,%rax
  803c67:	00 00 00 
  803c6a:	ff d0                	callq  *%rax
  803c6c:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803c6f:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803c73:	0f 89 33 01 00 00    	jns    803dac <map_segment+0x1cf>
  803c79:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803c7c:	e9 46 01 00 00       	jmpq   803dc7 <map_segment+0x1ea>
  803c81:	ba 07 00 00 00       	mov    $0x7,%edx
  803c86:	be 00 00 40 00       	mov    $0x400000,%esi
  803c8b:	bf 00 00 00 00       	mov    $0x0,%edi
  803c90:	48 b8 70 1e 80 00 00 	movabs $0x801e70,%rax
  803c97:	00 00 00 
  803c9a:	ff d0                	callq  *%rax
  803c9c:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803c9f:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803ca3:	79 08                	jns    803cad <map_segment+0xd0>
  803ca5:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803ca8:	e9 1a 01 00 00       	jmpq   803dc7 <map_segment+0x1ea>
  803cad:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803cb0:	8b 55 bc             	mov    -0x44(%rbp),%edx
  803cb3:	01 c2                	add    %eax,%edx
  803cb5:	8b 45 d8             	mov    -0x28(%rbp),%eax
  803cb8:	89 d6                	mov    %edx,%esi
  803cba:	89 c7                	mov    %eax,%edi
  803cbc:	48 b8 84 2a 80 00 00 	movabs $0x802a84,%rax
  803cc3:	00 00 00 
  803cc6:	ff d0                	callq  *%rax
  803cc8:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803ccb:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803ccf:	79 08                	jns    803cd9 <map_segment+0xfc>
  803cd1:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803cd4:	e9 ee 00 00 00       	jmpq   803dc7 <map_segment+0x1ea>
  803cd9:	c7 45 f4 00 10 00 00 	movl   $0x1000,-0xc(%rbp)
  803ce0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ce3:	48 98                	cltq   
  803ce5:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  803ce9:	48 29 c2             	sub    %rax,%rdx
  803cec:	48 89 d0             	mov    %rdx,%rax
  803cef:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803cf3:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803cf6:	48 63 d0             	movslq %eax,%rdx
  803cf9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803cfd:	48 39 c2             	cmp    %rax,%rdx
  803d00:	48 0f 47 d0          	cmova  %rax,%rdx
  803d04:	8b 45 d8             	mov    -0x28(%rbp),%eax
  803d07:	be 00 00 40 00       	mov    $0x400000,%esi
  803d0c:	89 c7                	mov    %eax,%edi
  803d0e:	48 b8 3b 29 80 00 00 	movabs $0x80293b,%rax
  803d15:	00 00 00 
  803d18:	ff d0                	callq  *%rax
  803d1a:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803d1d:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803d21:	79 08                	jns    803d2b <map_segment+0x14e>
  803d23:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803d26:	e9 9c 00 00 00       	jmpq   803dc7 <map_segment+0x1ea>
  803d2b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d2e:	48 63 d0             	movslq %eax,%rdx
  803d31:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803d35:	48 01 d0             	add    %rdx,%rax
  803d38:	48 89 c2             	mov    %rax,%rdx
  803d3b:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803d3e:	44 8b 45 10          	mov    0x10(%rbp),%r8d
  803d42:	48 89 d1             	mov    %rdx,%rcx
  803d45:	89 c2                	mov    %eax,%edx
  803d47:	be 00 00 40 00       	mov    $0x400000,%esi
  803d4c:	bf 00 00 00 00       	mov    $0x0,%edi
  803d51:	48 b8 c0 1e 80 00 00 	movabs $0x801ec0,%rax
  803d58:	00 00 00 
  803d5b:	ff d0                	callq  *%rax
  803d5d:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803d60:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803d64:	79 30                	jns    803d96 <map_segment+0x1b9>
  803d66:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803d69:	89 c1                	mov    %eax,%ecx
  803d6b:	48 ba f3 57 80 00 00 	movabs $0x8057f3,%rdx
  803d72:	00 00 00 
  803d75:	be 29 01 00 00       	mov    $0x129,%esi
  803d7a:	48 bf 78 57 80 00 00 	movabs $0x805778,%rdi
  803d81:	00 00 00 
  803d84:	b8 00 00 00 00       	mov    $0x0,%eax
  803d89:	49 b8 53 07 80 00 00 	movabs $0x800753,%r8
  803d90:	00 00 00 
  803d93:	41 ff d0             	callq  *%r8
  803d96:	be 00 00 40 00       	mov    $0x400000,%esi
  803d9b:	bf 00 00 00 00       	mov    $0x0,%edi
  803da0:	48 b8 1b 1f 80 00 00 	movabs $0x801f1b,%rax
  803da7:	00 00 00 
  803daa:	ff d0                	callq  *%rax
  803dac:	81 45 fc 00 10 00 00 	addl   $0x1000,-0x4(%rbp)
  803db3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803db6:	48 98                	cltq   
  803db8:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803dbc:	0f 82 78 fe ff ff    	jb     803c3a <map_segment+0x5d>
  803dc2:	b8 00 00 00 00       	mov    $0x0,%eax
  803dc7:	c9                   	leaveq 
  803dc8:	c3                   	retq   

0000000000803dc9 <copy_shared_pages>:
  803dc9:	55                   	push   %rbp
  803dca:	48 89 e5             	mov    %rsp,%rbp
  803dcd:	48 83 ec 30          	sub    $0x30,%rsp
  803dd1:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803dd4:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803ddb:	00 
  803ddc:	e9 eb 00 00 00       	jmpq   803ecc <copy_shared_pages+0x103>
  803de1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803de5:	48 c1 f8 12          	sar    $0x12,%rax
  803de9:	48 89 c2             	mov    %rax,%rdx
  803dec:	48 b8 00 00 40 80 00 	movabs $0x10080400000,%rax
  803df3:	01 00 00 
  803df6:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803dfa:	83 e0 01             	and    $0x1,%eax
  803dfd:	48 85 c0             	test   %rax,%rax
  803e00:	74 21                	je     803e23 <copy_shared_pages+0x5a>
  803e02:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803e06:	48 c1 f8 09          	sar    $0x9,%rax
  803e0a:	48 89 c2             	mov    %rax,%rdx
  803e0d:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  803e14:	01 00 00 
  803e17:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803e1b:	83 e0 01             	and    $0x1,%eax
  803e1e:	48 85 c0             	test   %rax,%rax
  803e21:	75 0d                	jne    803e30 <copy_shared_pages+0x67>
  803e23:	48 81 45 f8 00 02 00 	addq   $0x200,-0x8(%rbp)
  803e2a:	00 
  803e2b:	e9 9c 00 00 00       	jmpq   803ecc <copy_shared_pages+0x103>
  803e30:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803e34:	48 05 00 02 00 00    	add    $0x200,%rax
  803e3a:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803e3e:	eb 7e                	jmp    803ebe <copy_shared_pages+0xf5>
  803e40:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  803e47:	01 00 00 
  803e4a:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  803e4e:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803e52:	25 01 04 00 00       	and    $0x401,%eax
  803e57:	48 3d 01 04 00 00    	cmp    $0x401,%rax
  803e5d:	75 5a                	jne    803eb9 <copy_shared_pages+0xf0>
  803e5f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803e63:	48 c1 e0 0c          	shl    $0xc,%rax
  803e67:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803e6b:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  803e72:	01 00 00 
  803e75:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  803e79:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803e7d:	25 07 0e 00 00       	and    $0xe07,%eax
  803e82:	89 c6                	mov    %eax,%esi
  803e84:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  803e88:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803e8b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803e8f:	41 89 f0             	mov    %esi,%r8d
  803e92:	48 89 c6             	mov    %rax,%rsi
  803e95:	bf 00 00 00 00       	mov    $0x0,%edi
  803e9a:	48 b8 c0 1e 80 00 00 	movabs $0x801ec0,%rax
  803ea1:	00 00 00 
  803ea4:	ff d0                	callq  *%rax
  803ea6:	48 98                	cltq   
  803ea8:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803eac:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  803eb1:	79 06                	jns    803eb9 <copy_shared_pages+0xf0>
  803eb3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803eb7:	eb 28                	jmp    803ee1 <copy_shared_pages+0x118>
  803eb9:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803ebe:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803ec2:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  803ec6:	0f 8c 74 ff ff ff    	jl     803e40 <copy_shared_pages+0x77>
  803ecc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803ed0:	48 3d ff 07 00 08    	cmp    $0x80007ff,%rax
  803ed6:	0f 86 05 ff ff ff    	jbe    803de1 <copy_shared_pages+0x18>
  803edc:	b8 00 00 00 00       	mov    $0x0,%eax
  803ee1:	c9                   	leaveq 
  803ee2:	c3                   	retq   

0000000000803ee3 <fd2sockid>:
  803ee3:	55                   	push   %rbp
  803ee4:	48 89 e5             	mov    %rsp,%rbp
  803ee7:	48 83 ec 20          	sub    $0x20,%rsp
  803eeb:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803eee:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803ef2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803ef5:	48 89 d6             	mov    %rdx,%rsi
  803ef8:	89 c7                	mov    %eax,%edi
  803efa:	48 b8 34 24 80 00 00 	movabs $0x802434,%rax
  803f01:	00 00 00 
  803f04:	ff d0                	callq  *%rax
  803f06:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803f09:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803f0d:	79 05                	jns    803f14 <fd2sockid+0x31>
  803f0f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f12:	eb 24                	jmp    803f38 <fd2sockid+0x55>
  803f14:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f18:	8b 10                	mov    (%rax),%edx
  803f1a:	48 b8 40 88 80 00 00 	movabs $0x808840,%rax
  803f21:	00 00 00 
  803f24:	8b 00                	mov    (%rax),%eax
  803f26:	39 c2                	cmp    %eax,%edx
  803f28:	74 07                	je     803f31 <fd2sockid+0x4e>
  803f2a:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803f2f:	eb 07                	jmp    803f38 <fd2sockid+0x55>
  803f31:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f35:	8b 40 0c             	mov    0xc(%rax),%eax
  803f38:	c9                   	leaveq 
  803f39:	c3                   	retq   

0000000000803f3a <alloc_sockfd>:
  803f3a:	55                   	push   %rbp
  803f3b:	48 89 e5             	mov    %rsp,%rbp
  803f3e:	48 83 ec 20          	sub    $0x20,%rsp
  803f42:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803f45:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803f49:	48 89 c7             	mov    %rax,%rdi
  803f4c:	48 b8 9c 23 80 00 00 	movabs $0x80239c,%rax
  803f53:	00 00 00 
  803f56:	ff d0                	callq  *%rax
  803f58:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803f5b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803f5f:	78 26                	js     803f87 <alloc_sockfd+0x4d>
  803f61:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f65:	ba 07 04 00 00       	mov    $0x407,%edx
  803f6a:	48 89 c6             	mov    %rax,%rsi
  803f6d:	bf 00 00 00 00       	mov    $0x0,%edi
  803f72:	48 b8 70 1e 80 00 00 	movabs $0x801e70,%rax
  803f79:	00 00 00 
  803f7c:	ff d0                	callq  *%rax
  803f7e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803f81:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803f85:	79 16                	jns    803f9d <alloc_sockfd+0x63>
  803f87:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803f8a:	89 c7                	mov    %eax,%edi
  803f8c:	48 b8 47 44 80 00 00 	movabs $0x804447,%rax
  803f93:	00 00 00 
  803f96:	ff d0                	callq  *%rax
  803f98:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f9b:	eb 3a                	jmp    803fd7 <alloc_sockfd+0x9d>
  803f9d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803fa1:	48 ba 40 88 80 00 00 	movabs $0x808840,%rdx
  803fa8:	00 00 00 
  803fab:	8b 12                	mov    (%rdx),%edx
  803fad:	89 10                	mov    %edx,(%rax)
  803faf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803fb3:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  803fba:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803fbe:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803fc1:	89 50 0c             	mov    %edx,0xc(%rax)
  803fc4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803fc8:	48 89 c7             	mov    %rax,%rdi
  803fcb:	48 b8 4e 23 80 00 00 	movabs $0x80234e,%rax
  803fd2:	00 00 00 
  803fd5:	ff d0                	callq  *%rax
  803fd7:	c9                   	leaveq 
  803fd8:	c3                   	retq   

0000000000803fd9 <accept>:
  803fd9:	55                   	push   %rbp
  803fda:	48 89 e5             	mov    %rsp,%rbp
  803fdd:	48 83 ec 30          	sub    $0x30,%rsp
  803fe1:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803fe4:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803fe8:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803fec:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803fef:	89 c7                	mov    %eax,%edi
  803ff1:	48 b8 e3 3e 80 00 00 	movabs $0x803ee3,%rax
  803ff8:	00 00 00 
  803ffb:	ff d0                	callq  *%rax
  803ffd:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804000:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804004:	79 05                	jns    80400b <accept+0x32>
  804006:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804009:	eb 3b                	jmp    804046 <accept+0x6d>
  80400b:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80400f:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  804013:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804016:	48 89 ce             	mov    %rcx,%rsi
  804019:	89 c7                	mov    %eax,%edi
  80401b:	48 b8 24 43 80 00 00 	movabs $0x804324,%rax
  804022:	00 00 00 
  804025:	ff d0                	callq  *%rax
  804027:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80402a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80402e:	79 05                	jns    804035 <accept+0x5c>
  804030:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804033:	eb 11                	jmp    804046 <accept+0x6d>
  804035:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804038:	89 c7                	mov    %eax,%edi
  80403a:	48 b8 3a 3f 80 00 00 	movabs $0x803f3a,%rax
  804041:	00 00 00 
  804044:	ff d0                	callq  *%rax
  804046:	c9                   	leaveq 
  804047:	c3                   	retq   

0000000000804048 <bind>:
  804048:	55                   	push   %rbp
  804049:	48 89 e5             	mov    %rsp,%rbp
  80404c:	48 83 ec 20          	sub    $0x20,%rsp
  804050:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804053:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804057:	89 55 e8             	mov    %edx,-0x18(%rbp)
  80405a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80405d:	89 c7                	mov    %eax,%edi
  80405f:	48 b8 e3 3e 80 00 00 	movabs $0x803ee3,%rax
  804066:	00 00 00 
  804069:	ff d0                	callq  *%rax
  80406b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80406e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804072:	79 05                	jns    804079 <bind+0x31>
  804074:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804077:	eb 1b                	jmp    804094 <bind+0x4c>
  804079:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80407c:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  804080:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804083:	48 89 ce             	mov    %rcx,%rsi
  804086:	89 c7                	mov    %eax,%edi
  804088:	48 b8 a3 43 80 00 00 	movabs $0x8043a3,%rax
  80408f:	00 00 00 
  804092:	ff d0                	callq  *%rax
  804094:	c9                   	leaveq 
  804095:	c3                   	retq   

0000000000804096 <shutdown>:
  804096:	55                   	push   %rbp
  804097:	48 89 e5             	mov    %rsp,%rbp
  80409a:	48 83 ec 20          	sub    $0x20,%rsp
  80409e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8040a1:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8040a4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8040a7:	89 c7                	mov    %eax,%edi
  8040a9:	48 b8 e3 3e 80 00 00 	movabs $0x803ee3,%rax
  8040b0:	00 00 00 
  8040b3:	ff d0                	callq  *%rax
  8040b5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8040b8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8040bc:	79 05                	jns    8040c3 <shutdown+0x2d>
  8040be:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8040c1:	eb 16                	jmp    8040d9 <shutdown+0x43>
  8040c3:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8040c6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8040c9:	89 d6                	mov    %edx,%esi
  8040cb:	89 c7                	mov    %eax,%edi
  8040cd:	48 b8 07 44 80 00 00 	movabs $0x804407,%rax
  8040d4:	00 00 00 
  8040d7:	ff d0                	callq  *%rax
  8040d9:	c9                   	leaveq 
  8040da:	c3                   	retq   

00000000008040db <devsock_close>:
  8040db:	55                   	push   %rbp
  8040dc:	48 89 e5             	mov    %rsp,%rbp
  8040df:	48 83 ec 10          	sub    $0x10,%rsp
  8040e3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8040e7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8040eb:	48 89 c7             	mov    %rax,%rdi
  8040ee:	48 b8 16 4f 80 00 00 	movabs $0x804f16,%rax
  8040f5:	00 00 00 
  8040f8:	ff d0                	callq  *%rax
  8040fa:	83 f8 01             	cmp    $0x1,%eax
  8040fd:	75 17                	jne    804116 <devsock_close+0x3b>
  8040ff:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804103:	8b 40 0c             	mov    0xc(%rax),%eax
  804106:	89 c7                	mov    %eax,%edi
  804108:	48 b8 47 44 80 00 00 	movabs $0x804447,%rax
  80410f:	00 00 00 
  804112:	ff d0                	callq  *%rax
  804114:	eb 05                	jmp    80411b <devsock_close+0x40>
  804116:	b8 00 00 00 00       	mov    $0x0,%eax
  80411b:	c9                   	leaveq 
  80411c:	c3                   	retq   

000000000080411d <connect>:
  80411d:	55                   	push   %rbp
  80411e:	48 89 e5             	mov    %rsp,%rbp
  804121:	48 83 ec 20          	sub    $0x20,%rsp
  804125:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804128:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80412c:	89 55 e8             	mov    %edx,-0x18(%rbp)
  80412f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804132:	89 c7                	mov    %eax,%edi
  804134:	48 b8 e3 3e 80 00 00 	movabs $0x803ee3,%rax
  80413b:	00 00 00 
  80413e:	ff d0                	callq  *%rax
  804140:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804143:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804147:	79 05                	jns    80414e <connect+0x31>
  804149:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80414c:	eb 1b                	jmp    804169 <connect+0x4c>
  80414e:	8b 55 e8             	mov    -0x18(%rbp),%edx
  804151:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  804155:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804158:	48 89 ce             	mov    %rcx,%rsi
  80415b:	89 c7                	mov    %eax,%edi
  80415d:	48 b8 74 44 80 00 00 	movabs $0x804474,%rax
  804164:	00 00 00 
  804167:	ff d0                	callq  *%rax
  804169:	c9                   	leaveq 
  80416a:	c3                   	retq   

000000000080416b <listen>:
  80416b:	55                   	push   %rbp
  80416c:	48 89 e5             	mov    %rsp,%rbp
  80416f:	48 83 ec 20          	sub    $0x20,%rsp
  804173:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804176:	89 75 e8             	mov    %esi,-0x18(%rbp)
  804179:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80417c:	89 c7                	mov    %eax,%edi
  80417e:	48 b8 e3 3e 80 00 00 	movabs $0x803ee3,%rax
  804185:	00 00 00 
  804188:	ff d0                	callq  *%rax
  80418a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80418d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804191:	79 05                	jns    804198 <listen+0x2d>
  804193:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804196:	eb 16                	jmp    8041ae <listen+0x43>
  804198:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80419b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80419e:	89 d6                	mov    %edx,%esi
  8041a0:	89 c7                	mov    %eax,%edi
  8041a2:	48 b8 d8 44 80 00 00 	movabs $0x8044d8,%rax
  8041a9:	00 00 00 
  8041ac:	ff d0                	callq  *%rax
  8041ae:	c9                   	leaveq 
  8041af:	c3                   	retq   

00000000008041b0 <devsock_read>:
  8041b0:	55                   	push   %rbp
  8041b1:	48 89 e5             	mov    %rsp,%rbp
  8041b4:	48 83 ec 20          	sub    $0x20,%rsp
  8041b8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8041bc:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8041c0:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8041c4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8041c8:	89 c2                	mov    %eax,%edx
  8041ca:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8041ce:	8b 40 0c             	mov    0xc(%rax),%eax
  8041d1:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  8041d5:	b9 00 00 00 00       	mov    $0x0,%ecx
  8041da:	89 c7                	mov    %eax,%edi
  8041dc:	48 b8 18 45 80 00 00 	movabs $0x804518,%rax
  8041e3:	00 00 00 
  8041e6:	ff d0                	callq  *%rax
  8041e8:	c9                   	leaveq 
  8041e9:	c3                   	retq   

00000000008041ea <devsock_write>:
  8041ea:	55                   	push   %rbp
  8041eb:	48 89 e5             	mov    %rsp,%rbp
  8041ee:	48 83 ec 20          	sub    $0x20,%rsp
  8041f2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8041f6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8041fa:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8041fe:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804202:	89 c2                	mov    %eax,%edx
  804204:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804208:	8b 40 0c             	mov    0xc(%rax),%eax
  80420b:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  80420f:	b9 00 00 00 00       	mov    $0x0,%ecx
  804214:	89 c7                	mov    %eax,%edi
  804216:	48 b8 e4 45 80 00 00 	movabs $0x8045e4,%rax
  80421d:	00 00 00 
  804220:	ff d0                	callq  *%rax
  804222:	c9                   	leaveq 
  804223:	c3                   	retq   

0000000000804224 <devsock_stat>:
  804224:	55                   	push   %rbp
  804225:	48 89 e5             	mov    %rsp,%rbp
  804228:	48 83 ec 10          	sub    $0x10,%rsp
  80422c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804230:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804234:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804238:	48 be 15 58 80 00 00 	movabs $0x805815,%rsi
  80423f:	00 00 00 
  804242:	48 89 c7             	mov    %rax,%rdi
  804245:	48 b8 41 15 80 00 00 	movabs $0x801541,%rax
  80424c:	00 00 00 
  80424f:	ff d0                	callq  *%rax
  804251:	b8 00 00 00 00       	mov    $0x0,%eax
  804256:	c9                   	leaveq 
  804257:	c3                   	retq   

0000000000804258 <socket>:
  804258:	55                   	push   %rbp
  804259:	48 89 e5             	mov    %rsp,%rbp
  80425c:	48 83 ec 20          	sub    $0x20,%rsp
  804260:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804263:	89 75 e8             	mov    %esi,-0x18(%rbp)
  804266:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  804269:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  80426c:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  80426f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804272:	89 ce                	mov    %ecx,%esi
  804274:	89 c7                	mov    %eax,%edi
  804276:	48 b8 9c 46 80 00 00 	movabs $0x80469c,%rax
  80427d:	00 00 00 
  804280:	ff d0                	callq  *%rax
  804282:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804285:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804289:	79 05                	jns    804290 <socket+0x38>
  80428b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80428e:	eb 11                	jmp    8042a1 <socket+0x49>
  804290:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804293:	89 c7                	mov    %eax,%edi
  804295:	48 b8 3a 3f 80 00 00 	movabs $0x803f3a,%rax
  80429c:	00 00 00 
  80429f:	ff d0                	callq  *%rax
  8042a1:	c9                   	leaveq 
  8042a2:	c3                   	retq   

00000000008042a3 <nsipc>:
  8042a3:	55                   	push   %rbp
  8042a4:	48 89 e5             	mov    %rsp,%rbp
  8042a7:	48 83 ec 10          	sub    $0x10,%rsp
  8042ab:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8042ae:	48 b8 04 90 80 00 00 	movabs $0x809004,%rax
  8042b5:	00 00 00 
  8042b8:	8b 00                	mov    (%rax),%eax
  8042ba:	85 c0                	test   %eax,%eax
  8042bc:	75 1d                	jne    8042db <nsipc+0x38>
  8042be:	bf 02 00 00 00       	mov    $0x2,%edi
  8042c3:	48 b8 a4 4e 80 00 00 	movabs $0x804ea4,%rax
  8042ca:	00 00 00 
  8042cd:	ff d0                	callq  *%rax
  8042cf:	48 ba 04 90 80 00 00 	movabs $0x809004,%rdx
  8042d6:	00 00 00 
  8042d9:	89 02                	mov    %eax,(%rdx)
  8042db:	48 b8 04 90 80 00 00 	movabs $0x809004,%rax
  8042e2:	00 00 00 
  8042e5:	8b 00                	mov    (%rax),%eax
  8042e7:	8b 75 fc             	mov    -0x4(%rbp),%esi
  8042ea:	b9 07 00 00 00       	mov    $0x7,%ecx
  8042ef:	48 ba 00 d0 80 00 00 	movabs $0x80d000,%rdx
  8042f6:	00 00 00 
  8042f9:	89 c7                	mov    %eax,%edi
  8042fb:	48 b8 0e 4e 80 00 00 	movabs $0x804e0e,%rax
  804302:	00 00 00 
  804305:	ff d0                	callq  *%rax
  804307:	ba 00 00 00 00       	mov    $0x0,%edx
  80430c:	be 00 00 00 00       	mov    $0x0,%esi
  804311:	bf 00 00 00 00       	mov    $0x0,%edi
  804316:	48 b8 4d 4d 80 00 00 	movabs $0x804d4d,%rax
  80431d:	00 00 00 
  804320:	ff d0                	callq  *%rax
  804322:	c9                   	leaveq 
  804323:	c3                   	retq   

0000000000804324 <nsipc_accept>:
  804324:	55                   	push   %rbp
  804325:	48 89 e5             	mov    %rsp,%rbp
  804328:	48 83 ec 30          	sub    $0x30,%rsp
  80432c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80432f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804333:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804337:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  80433e:	00 00 00 
  804341:	8b 55 ec             	mov    -0x14(%rbp),%edx
  804344:	89 10                	mov    %edx,(%rax)
  804346:	bf 01 00 00 00       	mov    $0x1,%edi
  80434b:	48 b8 a3 42 80 00 00 	movabs $0x8042a3,%rax
  804352:	00 00 00 
  804355:	ff d0                	callq  *%rax
  804357:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80435a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80435e:	78 3e                	js     80439e <nsipc_accept+0x7a>
  804360:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  804367:	00 00 00 
  80436a:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80436e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804372:	8b 40 10             	mov    0x10(%rax),%eax
  804375:	89 c2                	mov    %eax,%edx
  804377:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  80437b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80437f:	48 89 ce             	mov    %rcx,%rsi
  804382:	48 89 c7             	mov    %rax,%rdi
  804385:	48 b8 65 18 80 00 00 	movabs $0x801865,%rax
  80438c:	00 00 00 
  80438f:	ff d0                	callq  *%rax
  804391:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804395:	8b 50 10             	mov    0x10(%rax),%edx
  804398:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80439c:	89 10                	mov    %edx,(%rax)
  80439e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8043a1:	c9                   	leaveq 
  8043a2:	c3                   	retq   

00000000008043a3 <nsipc_bind>:
  8043a3:	55                   	push   %rbp
  8043a4:	48 89 e5             	mov    %rsp,%rbp
  8043a7:	48 83 ec 10          	sub    $0x10,%rsp
  8043ab:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8043ae:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8043b2:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8043b5:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  8043bc:	00 00 00 
  8043bf:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8043c2:	89 10                	mov    %edx,(%rax)
  8043c4:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8043c7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8043cb:	48 89 c6             	mov    %rax,%rsi
  8043ce:	48 bf 04 d0 80 00 00 	movabs $0x80d004,%rdi
  8043d5:	00 00 00 
  8043d8:	48 b8 65 18 80 00 00 	movabs $0x801865,%rax
  8043df:	00 00 00 
  8043e2:	ff d0                	callq  *%rax
  8043e4:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  8043eb:	00 00 00 
  8043ee:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8043f1:	89 50 14             	mov    %edx,0x14(%rax)
  8043f4:	bf 02 00 00 00       	mov    $0x2,%edi
  8043f9:	48 b8 a3 42 80 00 00 	movabs $0x8042a3,%rax
  804400:	00 00 00 
  804403:	ff d0                	callq  *%rax
  804405:	c9                   	leaveq 
  804406:	c3                   	retq   

0000000000804407 <nsipc_shutdown>:
  804407:	55                   	push   %rbp
  804408:	48 89 e5             	mov    %rsp,%rbp
  80440b:	48 83 ec 10          	sub    $0x10,%rsp
  80440f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804412:	89 75 f8             	mov    %esi,-0x8(%rbp)
  804415:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  80441c:	00 00 00 
  80441f:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804422:	89 10                	mov    %edx,(%rax)
  804424:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  80442b:	00 00 00 
  80442e:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804431:	89 50 04             	mov    %edx,0x4(%rax)
  804434:	bf 03 00 00 00       	mov    $0x3,%edi
  804439:	48 b8 a3 42 80 00 00 	movabs $0x8042a3,%rax
  804440:	00 00 00 
  804443:	ff d0                	callq  *%rax
  804445:	c9                   	leaveq 
  804446:	c3                   	retq   

0000000000804447 <nsipc_close>:
  804447:	55                   	push   %rbp
  804448:	48 89 e5             	mov    %rsp,%rbp
  80444b:	48 83 ec 10          	sub    $0x10,%rsp
  80444f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804452:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  804459:	00 00 00 
  80445c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80445f:	89 10                	mov    %edx,(%rax)
  804461:	bf 04 00 00 00       	mov    $0x4,%edi
  804466:	48 b8 a3 42 80 00 00 	movabs $0x8042a3,%rax
  80446d:	00 00 00 
  804470:	ff d0                	callq  *%rax
  804472:	c9                   	leaveq 
  804473:	c3                   	retq   

0000000000804474 <nsipc_connect>:
  804474:	55                   	push   %rbp
  804475:	48 89 e5             	mov    %rsp,%rbp
  804478:	48 83 ec 10          	sub    $0x10,%rsp
  80447c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80447f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804483:	89 55 f8             	mov    %edx,-0x8(%rbp)
  804486:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  80448d:	00 00 00 
  804490:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804493:	89 10                	mov    %edx,(%rax)
  804495:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804498:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80449c:	48 89 c6             	mov    %rax,%rsi
  80449f:	48 bf 04 d0 80 00 00 	movabs $0x80d004,%rdi
  8044a6:	00 00 00 
  8044a9:	48 b8 65 18 80 00 00 	movabs $0x801865,%rax
  8044b0:	00 00 00 
  8044b3:	ff d0                	callq  *%rax
  8044b5:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  8044bc:	00 00 00 
  8044bf:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8044c2:	89 50 14             	mov    %edx,0x14(%rax)
  8044c5:	bf 05 00 00 00       	mov    $0x5,%edi
  8044ca:	48 b8 a3 42 80 00 00 	movabs $0x8042a3,%rax
  8044d1:	00 00 00 
  8044d4:	ff d0                	callq  *%rax
  8044d6:	c9                   	leaveq 
  8044d7:	c3                   	retq   

00000000008044d8 <nsipc_listen>:
  8044d8:	55                   	push   %rbp
  8044d9:	48 89 e5             	mov    %rsp,%rbp
  8044dc:	48 83 ec 10          	sub    $0x10,%rsp
  8044e0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8044e3:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8044e6:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  8044ed:	00 00 00 
  8044f0:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8044f3:	89 10                	mov    %edx,(%rax)
  8044f5:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  8044fc:	00 00 00 
  8044ff:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804502:	89 50 04             	mov    %edx,0x4(%rax)
  804505:	bf 06 00 00 00       	mov    $0x6,%edi
  80450a:	48 b8 a3 42 80 00 00 	movabs $0x8042a3,%rax
  804511:	00 00 00 
  804514:	ff d0                	callq  *%rax
  804516:	c9                   	leaveq 
  804517:	c3                   	retq   

0000000000804518 <nsipc_recv>:
  804518:	55                   	push   %rbp
  804519:	48 89 e5             	mov    %rsp,%rbp
  80451c:	48 83 ec 30          	sub    $0x30,%rsp
  804520:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804523:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804527:	89 55 e8             	mov    %edx,-0x18(%rbp)
  80452a:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  80452d:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  804534:	00 00 00 
  804537:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80453a:	89 10                	mov    %edx,(%rax)
  80453c:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  804543:	00 00 00 
  804546:	8b 55 e8             	mov    -0x18(%rbp),%edx
  804549:	89 50 04             	mov    %edx,0x4(%rax)
  80454c:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  804553:	00 00 00 
  804556:	8b 55 dc             	mov    -0x24(%rbp),%edx
  804559:	89 50 08             	mov    %edx,0x8(%rax)
  80455c:	bf 07 00 00 00       	mov    $0x7,%edi
  804561:	48 b8 a3 42 80 00 00 	movabs $0x8042a3,%rax
  804568:	00 00 00 
  80456b:	ff d0                	callq  *%rax
  80456d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804570:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804574:	78 69                	js     8045df <nsipc_recv+0xc7>
  804576:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  80457d:	7f 08                	jg     804587 <nsipc_recv+0x6f>
  80457f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804582:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  804585:	7e 35                	jle    8045bc <nsipc_recv+0xa4>
  804587:	48 b9 1c 58 80 00 00 	movabs $0x80581c,%rcx
  80458e:	00 00 00 
  804591:	48 ba 31 58 80 00 00 	movabs $0x805831,%rdx
  804598:	00 00 00 
  80459b:	be 62 00 00 00       	mov    $0x62,%esi
  8045a0:	48 bf 46 58 80 00 00 	movabs $0x805846,%rdi
  8045a7:	00 00 00 
  8045aa:	b8 00 00 00 00       	mov    $0x0,%eax
  8045af:	49 b8 53 07 80 00 00 	movabs $0x800753,%r8
  8045b6:	00 00 00 
  8045b9:	41 ff d0             	callq  *%r8
  8045bc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8045bf:	48 63 d0             	movslq %eax,%rdx
  8045c2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8045c6:	48 be 00 d0 80 00 00 	movabs $0x80d000,%rsi
  8045cd:	00 00 00 
  8045d0:	48 89 c7             	mov    %rax,%rdi
  8045d3:	48 b8 65 18 80 00 00 	movabs $0x801865,%rax
  8045da:	00 00 00 
  8045dd:	ff d0                	callq  *%rax
  8045df:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8045e2:	c9                   	leaveq 
  8045e3:	c3                   	retq   

00000000008045e4 <nsipc_send>:
  8045e4:	55                   	push   %rbp
  8045e5:	48 89 e5             	mov    %rsp,%rbp
  8045e8:	48 83 ec 20          	sub    $0x20,%rsp
  8045ec:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8045ef:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8045f3:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8045f6:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  8045f9:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  804600:	00 00 00 
  804603:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804606:	89 10                	mov    %edx,(%rax)
  804608:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  80460f:	7e 35                	jle    804646 <nsipc_send+0x62>
  804611:	48 b9 55 58 80 00 00 	movabs $0x805855,%rcx
  804618:	00 00 00 
  80461b:	48 ba 31 58 80 00 00 	movabs $0x805831,%rdx
  804622:	00 00 00 
  804625:	be 6d 00 00 00       	mov    $0x6d,%esi
  80462a:	48 bf 46 58 80 00 00 	movabs $0x805846,%rdi
  804631:	00 00 00 
  804634:	b8 00 00 00 00       	mov    $0x0,%eax
  804639:	49 b8 53 07 80 00 00 	movabs $0x800753,%r8
  804640:	00 00 00 
  804643:	41 ff d0             	callq  *%r8
  804646:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804649:	48 63 d0             	movslq %eax,%rdx
  80464c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804650:	48 89 c6             	mov    %rax,%rsi
  804653:	48 bf 0c d0 80 00 00 	movabs $0x80d00c,%rdi
  80465a:	00 00 00 
  80465d:	48 b8 65 18 80 00 00 	movabs $0x801865,%rax
  804664:	00 00 00 
  804667:	ff d0                	callq  *%rax
  804669:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  804670:	00 00 00 
  804673:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804676:	89 50 04             	mov    %edx,0x4(%rax)
  804679:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  804680:	00 00 00 
  804683:	8b 55 ec             	mov    -0x14(%rbp),%edx
  804686:	89 50 08             	mov    %edx,0x8(%rax)
  804689:	bf 08 00 00 00       	mov    $0x8,%edi
  80468e:	48 b8 a3 42 80 00 00 	movabs $0x8042a3,%rax
  804695:	00 00 00 
  804698:	ff d0                	callq  *%rax
  80469a:	c9                   	leaveq 
  80469b:	c3                   	retq   

000000000080469c <nsipc_socket>:
  80469c:	55                   	push   %rbp
  80469d:	48 89 e5             	mov    %rsp,%rbp
  8046a0:	48 83 ec 10          	sub    $0x10,%rsp
  8046a4:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8046a7:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8046aa:	89 55 f4             	mov    %edx,-0xc(%rbp)
  8046ad:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  8046b4:	00 00 00 
  8046b7:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8046ba:	89 10                	mov    %edx,(%rax)
  8046bc:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  8046c3:	00 00 00 
  8046c6:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8046c9:	89 50 04             	mov    %edx,0x4(%rax)
  8046cc:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  8046d3:	00 00 00 
  8046d6:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8046d9:	89 50 08             	mov    %edx,0x8(%rax)
  8046dc:	bf 09 00 00 00       	mov    $0x9,%edi
  8046e1:	48 b8 a3 42 80 00 00 	movabs $0x8042a3,%rax
  8046e8:	00 00 00 
  8046eb:	ff d0                	callq  *%rax
  8046ed:	c9                   	leaveq 
  8046ee:	c3                   	retq   

00000000008046ef <pipe>:
  8046ef:	55                   	push   %rbp
  8046f0:	48 89 e5             	mov    %rsp,%rbp
  8046f3:	53                   	push   %rbx
  8046f4:	48 83 ec 38          	sub    $0x38,%rsp
  8046f8:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  8046fc:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  804700:	48 89 c7             	mov    %rax,%rdi
  804703:	48 b8 9c 23 80 00 00 	movabs $0x80239c,%rax
  80470a:	00 00 00 
  80470d:	ff d0                	callq  *%rax
  80470f:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804712:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804716:	0f 88 bf 01 00 00    	js     8048db <pipe+0x1ec>
  80471c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804720:	ba 07 04 00 00       	mov    $0x407,%edx
  804725:	48 89 c6             	mov    %rax,%rsi
  804728:	bf 00 00 00 00       	mov    $0x0,%edi
  80472d:	48 b8 70 1e 80 00 00 	movabs $0x801e70,%rax
  804734:	00 00 00 
  804737:	ff d0                	callq  *%rax
  804739:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80473c:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804740:	0f 88 95 01 00 00    	js     8048db <pipe+0x1ec>
  804746:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  80474a:	48 89 c7             	mov    %rax,%rdi
  80474d:	48 b8 9c 23 80 00 00 	movabs $0x80239c,%rax
  804754:	00 00 00 
  804757:	ff d0                	callq  *%rax
  804759:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80475c:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804760:	0f 88 5d 01 00 00    	js     8048c3 <pipe+0x1d4>
  804766:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80476a:	ba 07 04 00 00       	mov    $0x407,%edx
  80476f:	48 89 c6             	mov    %rax,%rsi
  804772:	bf 00 00 00 00       	mov    $0x0,%edi
  804777:	48 b8 70 1e 80 00 00 	movabs $0x801e70,%rax
  80477e:	00 00 00 
  804781:	ff d0                	callq  *%rax
  804783:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804786:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80478a:	0f 88 33 01 00 00    	js     8048c3 <pipe+0x1d4>
  804790:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804794:	48 89 c7             	mov    %rax,%rdi
  804797:	48 b8 71 23 80 00 00 	movabs $0x802371,%rax
  80479e:	00 00 00 
  8047a1:	ff d0                	callq  *%rax
  8047a3:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8047a7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8047ab:	ba 07 04 00 00       	mov    $0x407,%edx
  8047b0:	48 89 c6             	mov    %rax,%rsi
  8047b3:	bf 00 00 00 00       	mov    $0x0,%edi
  8047b8:	48 b8 70 1e 80 00 00 	movabs $0x801e70,%rax
  8047bf:	00 00 00 
  8047c2:	ff d0                	callq  *%rax
  8047c4:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8047c7:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8047cb:	79 05                	jns    8047d2 <pipe+0xe3>
  8047cd:	e9 d9 00 00 00       	jmpq   8048ab <pipe+0x1bc>
  8047d2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8047d6:	48 89 c7             	mov    %rax,%rdi
  8047d9:	48 b8 71 23 80 00 00 	movabs $0x802371,%rax
  8047e0:	00 00 00 
  8047e3:	ff d0                	callq  *%rax
  8047e5:	48 89 c2             	mov    %rax,%rdx
  8047e8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8047ec:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  8047f2:	48 89 d1             	mov    %rdx,%rcx
  8047f5:	ba 00 00 00 00       	mov    $0x0,%edx
  8047fa:	48 89 c6             	mov    %rax,%rsi
  8047fd:	bf 00 00 00 00       	mov    $0x0,%edi
  804802:	48 b8 c0 1e 80 00 00 	movabs $0x801ec0,%rax
  804809:	00 00 00 
  80480c:	ff d0                	callq  *%rax
  80480e:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804811:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804815:	79 1b                	jns    804832 <pipe+0x143>
  804817:	90                   	nop
  804818:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80481c:	48 89 c6             	mov    %rax,%rsi
  80481f:	bf 00 00 00 00       	mov    $0x0,%edi
  804824:	48 b8 1b 1f 80 00 00 	movabs $0x801f1b,%rax
  80482b:	00 00 00 
  80482e:	ff d0                	callq  *%rax
  804830:	eb 79                	jmp    8048ab <pipe+0x1bc>
  804832:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804836:	48 ba 80 88 80 00 00 	movabs $0x808880,%rdx
  80483d:	00 00 00 
  804840:	8b 12                	mov    (%rdx),%edx
  804842:	89 10                	mov    %edx,(%rax)
  804844:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804848:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  80484f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804853:	48 ba 80 88 80 00 00 	movabs $0x808880,%rdx
  80485a:	00 00 00 
  80485d:	8b 12                	mov    (%rdx),%edx
  80485f:	89 10                	mov    %edx,(%rax)
  804861:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804865:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  80486c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804870:	48 89 c7             	mov    %rax,%rdi
  804873:	48 b8 4e 23 80 00 00 	movabs $0x80234e,%rax
  80487a:	00 00 00 
  80487d:	ff d0                	callq  *%rax
  80487f:	89 c2                	mov    %eax,%edx
  804881:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  804885:	89 10                	mov    %edx,(%rax)
  804887:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80488b:	48 8d 58 04          	lea    0x4(%rax),%rbx
  80488f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804893:	48 89 c7             	mov    %rax,%rdi
  804896:	48 b8 4e 23 80 00 00 	movabs $0x80234e,%rax
  80489d:	00 00 00 
  8048a0:	ff d0                	callq  *%rax
  8048a2:	89 03                	mov    %eax,(%rbx)
  8048a4:	b8 00 00 00 00       	mov    $0x0,%eax
  8048a9:	eb 33                	jmp    8048de <pipe+0x1ef>
  8048ab:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8048af:	48 89 c6             	mov    %rax,%rsi
  8048b2:	bf 00 00 00 00       	mov    $0x0,%edi
  8048b7:	48 b8 1b 1f 80 00 00 	movabs $0x801f1b,%rax
  8048be:	00 00 00 
  8048c1:	ff d0                	callq  *%rax
  8048c3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8048c7:	48 89 c6             	mov    %rax,%rsi
  8048ca:	bf 00 00 00 00       	mov    $0x0,%edi
  8048cf:	48 b8 1b 1f 80 00 00 	movabs $0x801f1b,%rax
  8048d6:	00 00 00 
  8048d9:	ff d0                	callq  *%rax
  8048db:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8048de:	48 83 c4 38          	add    $0x38,%rsp
  8048e2:	5b                   	pop    %rbx
  8048e3:	5d                   	pop    %rbp
  8048e4:	c3                   	retq   

00000000008048e5 <_pipeisclosed>:
  8048e5:	55                   	push   %rbp
  8048e6:	48 89 e5             	mov    %rsp,%rbp
  8048e9:	53                   	push   %rbx
  8048ea:	48 83 ec 28          	sub    $0x28,%rsp
  8048ee:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8048f2:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8048f6:	48 b8 90 a7 80 00 00 	movabs $0x80a790,%rax
  8048fd:	00 00 00 
  804900:	48 8b 00             	mov    (%rax),%rax
  804903:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  804909:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80490c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804910:	48 89 c7             	mov    %rax,%rdi
  804913:	48 b8 16 4f 80 00 00 	movabs $0x804f16,%rax
  80491a:	00 00 00 
  80491d:	ff d0                	callq  *%rax
  80491f:	89 c3                	mov    %eax,%ebx
  804921:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804925:	48 89 c7             	mov    %rax,%rdi
  804928:	48 b8 16 4f 80 00 00 	movabs $0x804f16,%rax
  80492f:	00 00 00 
  804932:	ff d0                	callq  *%rax
  804934:	39 c3                	cmp    %eax,%ebx
  804936:	0f 94 c0             	sete   %al
  804939:	0f b6 c0             	movzbl %al,%eax
  80493c:	89 45 e8             	mov    %eax,-0x18(%rbp)
  80493f:	48 b8 90 a7 80 00 00 	movabs $0x80a790,%rax
  804946:	00 00 00 
  804949:	48 8b 00             	mov    (%rax),%rax
  80494c:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  804952:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  804955:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804958:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  80495b:	75 05                	jne    804962 <_pipeisclosed+0x7d>
  80495d:	8b 45 e8             	mov    -0x18(%rbp),%eax
  804960:	eb 4f                	jmp    8049b1 <_pipeisclosed+0xcc>
  804962:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804965:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  804968:	74 42                	je     8049ac <_pipeisclosed+0xc7>
  80496a:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  80496e:	75 3c                	jne    8049ac <_pipeisclosed+0xc7>
  804970:	48 b8 90 a7 80 00 00 	movabs $0x80a790,%rax
  804977:	00 00 00 
  80497a:	48 8b 00             	mov    (%rax),%rax
  80497d:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  804983:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  804986:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804989:	89 c6                	mov    %eax,%esi
  80498b:	48 bf 66 58 80 00 00 	movabs $0x805866,%rdi
  804992:	00 00 00 
  804995:	b8 00 00 00 00       	mov    $0x0,%eax
  80499a:	49 b8 8c 09 80 00 00 	movabs $0x80098c,%r8
  8049a1:	00 00 00 
  8049a4:	41 ff d0             	callq  *%r8
  8049a7:	e9 4a ff ff ff       	jmpq   8048f6 <_pipeisclosed+0x11>
  8049ac:	e9 45 ff ff ff       	jmpq   8048f6 <_pipeisclosed+0x11>
  8049b1:	48 83 c4 28          	add    $0x28,%rsp
  8049b5:	5b                   	pop    %rbx
  8049b6:	5d                   	pop    %rbp
  8049b7:	c3                   	retq   

00000000008049b8 <pipeisclosed>:
  8049b8:	55                   	push   %rbp
  8049b9:	48 89 e5             	mov    %rsp,%rbp
  8049bc:	48 83 ec 30          	sub    $0x30,%rsp
  8049c0:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8049c3:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8049c7:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8049ca:	48 89 d6             	mov    %rdx,%rsi
  8049cd:	89 c7                	mov    %eax,%edi
  8049cf:	48 b8 34 24 80 00 00 	movabs $0x802434,%rax
  8049d6:	00 00 00 
  8049d9:	ff d0                	callq  *%rax
  8049db:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8049de:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8049e2:	79 05                	jns    8049e9 <pipeisclosed+0x31>
  8049e4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8049e7:	eb 31                	jmp    804a1a <pipeisclosed+0x62>
  8049e9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8049ed:	48 89 c7             	mov    %rax,%rdi
  8049f0:	48 b8 71 23 80 00 00 	movabs $0x802371,%rax
  8049f7:	00 00 00 
  8049fa:	ff d0                	callq  *%rax
  8049fc:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804a00:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804a04:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804a08:	48 89 d6             	mov    %rdx,%rsi
  804a0b:	48 89 c7             	mov    %rax,%rdi
  804a0e:	48 b8 e5 48 80 00 00 	movabs $0x8048e5,%rax
  804a15:	00 00 00 
  804a18:	ff d0                	callq  *%rax
  804a1a:	c9                   	leaveq 
  804a1b:	c3                   	retq   

0000000000804a1c <devpipe_read>:
  804a1c:	55                   	push   %rbp
  804a1d:	48 89 e5             	mov    %rsp,%rbp
  804a20:	48 83 ec 40          	sub    $0x40,%rsp
  804a24:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804a28:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804a2c:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  804a30:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804a34:	48 89 c7             	mov    %rax,%rdi
  804a37:	48 b8 71 23 80 00 00 	movabs $0x802371,%rax
  804a3e:	00 00 00 
  804a41:	ff d0                	callq  *%rax
  804a43:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804a47:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804a4b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804a4f:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804a56:	00 
  804a57:	e9 92 00 00 00       	jmpq   804aee <devpipe_read+0xd2>
  804a5c:	eb 41                	jmp    804a9f <devpipe_read+0x83>
  804a5e:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  804a63:	74 09                	je     804a6e <devpipe_read+0x52>
  804a65:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804a69:	e9 92 00 00 00       	jmpq   804b00 <devpipe_read+0xe4>
  804a6e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804a72:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804a76:	48 89 d6             	mov    %rdx,%rsi
  804a79:	48 89 c7             	mov    %rax,%rdi
  804a7c:	48 b8 e5 48 80 00 00 	movabs $0x8048e5,%rax
  804a83:	00 00 00 
  804a86:	ff d0                	callq  *%rax
  804a88:	85 c0                	test   %eax,%eax
  804a8a:	74 07                	je     804a93 <devpipe_read+0x77>
  804a8c:	b8 00 00 00 00       	mov    $0x0,%eax
  804a91:	eb 6d                	jmp    804b00 <devpipe_read+0xe4>
  804a93:	48 b8 32 1e 80 00 00 	movabs $0x801e32,%rax
  804a9a:	00 00 00 
  804a9d:	ff d0                	callq  *%rax
  804a9f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804aa3:	8b 10                	mov    (%rax),%edx
  804aa5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804aa9:	8b 40 04             	mov    0x4(%rax),%eax
  804aac:	39 c2                	cmp    %eax,%edx
  804aae:	74 ae                	je     804a5e <devpipe_read+0x42>
  804ab0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804ab4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804ab8:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  804abc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804ac0:	8b 00                	mov    (%rax),%eax
  804ac2:	99                   	cltd   
  804ac3:	c1 ea 1b             	shr    $0x1b,%edx
  804ac6:	01 d0                	add    %edx,%eax
  804ac8:	83 e0 1f             	and    $0x1f,%eax
  804acb:	29 d0                	sub    %edx,%eax
  804acd:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804ad1:	48 98                	cltq   
  804ad3:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  804ad8:	88 01                	mov    %al,(%rcx)
  804ada:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804ade:	8b 00                	mov    (%rax),%eax
  804ae0:	8d 50 01             	lea    0x1(%rax),%edx
  804ae3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804ae7:	89 10                	mov    %edx,(%rax)
  804ae9:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  804aee:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804af2:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  804af6:	0f 82 60 ff ff ff    	jb     804a5c <devpipe_read+0x40>
  804afc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804b00:	c9                   	leaveq 
  804b01:	c3                   	retq   

0000000000804b02 <devpipe_write>:
  804b02:	55                   	push   %rbp
  804b03:	48 89 e5             	mov    %rsp,%rbp
  804b06:	48 83 ec 40          	sub    $0x40,%rsp
  804b0a:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804b0e:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804b12:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  804b16:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804b1a:	48 89 c7             	mov    %rax,%rdi
  804b1d:	48 b8 71 23 80 00 00 	movabs $0x802371,%rax
  804b24:	00 00 00 
  804b27:	ff d0                	callq  *%rax
  804b29:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804b2d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804b31:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804b35:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804b3c:	00 
  804b3d:	e9 8e 00 00 00       	jmpq   804bd0 <devpipe_write+0xce>
  804b42:	eb 31                	jmp    804b75 <devpipe_write+0x73>
  804b44:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804b48:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804b4c:	48 89 d6             	mov    %rdx,%rsi
  804b4f:	48 89 c7             	mov    %rax,%rdi
  804b52:	48 b8 e5 48 80 00 00 	movabs $0x8048e5,%rax
  804b59:	00 00 00 
  804b5c:	ff d0                	callq  *%rax
  804b5e:	85 c0                	test   %eax,%eax
  804b60:	74 07                	je     804b69 <devpipe_write+0x67>
  804b62:	b8 00 00 00 00       	mov    $0x0,%eax
  804b67:	eb 79                	jmp    804be2 <devpipe_write+0xe0>
  804b69:	48 b8 32 1e 80 00 00 	movabs $0x801e32,%rax
  804b70:	00 00 00 
  804b73:	ff d0                	callq  *%rax
  804b75:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804b79:	8b 40 04             	mov    0x4(%rax),%eax
  804b7c:	48 63 d0             	movslq %eax,%rdx
  804b7f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804b83:	8b 00                	mov    (%rax),%eax
  804b85:	48 98                	cltq   
  804b87:	48 83 c0 20          	add    $0x20,%rax
  804b8b:	48 39 c2             	cmp    %rax,%rdx
  804b8e:	73 b4                	jae    804b44 <devpipe_write+0x42>
  804b90:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804b94:	8b 40 04             	mov    0x4(%rax),%eax
  804b97:	99                   	cltd   
  804b98:	c1 ea 1b             	shr    $0x1b,%edx
  804b9b:	01 d0                	add    %edx,%eax
  804b9d:	83 e0 1f             	and    $0x1f,%eax
  804ba0:	29 d0                	sub    %edx,%eax
  804ba2:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  804ba6:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  804baa:	48 01 ca             	add    %rcx,%rdx
  804bad:	0f b6 0a             	movzbl (%rdx),%ecx
  804bb0:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804bb4:	48 98                	cltq   
  804bb6:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  804bba:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804bbe:	8b 40 04             	mov    0x4(%rax),%eax
  804bc1:	8d 50 01             	lea    0x1(%rax),%edx
  804bc4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804bc8:	89 50 04             	mov    %edx,0x4(%rax)
  804bcb:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  804bd0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804bd4:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  804bd8:	0f 82 64 ff ff ff    	jb     804b42 <devpipe_write+0x40>
  804bde:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804be2:	c9                   	leaveq 
  804be3:	c3                   	retq   

0000000000804be4 <devpipe_stat>:
  804be4:	55                   	push   %rbp
  804be5:	48 89 e5             	mov    %rsp,%rbp
  804be8:	48 83 ec 20          	sub    $0x20,%rsp
  804bec:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804bf0:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804bf4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804bf8:	48 89 c7             	mov    %rax,%rdi
  804bfb:	48 b8 71 23 80 00 00 	movabs $0x802371,%rax
  804c02:	00 00 00 
  804c05:	ff d0                	callq  *%rax
  804c07:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804c0b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804c0f:	48 be 79 58 80 00 00 	movabs $0x805879,%rsi
  804c16:	00 00 00 
  804c19:	48 89 c7             	mov    %rax,%rdi
  804c1c:	48 b8 41 15 80 00 00 	movabs $0x801541,%rax
  804c23:	00 00 00 
  804c26:	ff d0                	callq  *%rax
  804c28:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804c2c:	8b 50 04             	mov    0x4(%rax),%edx
  804c2f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804c33:	8b 00                	mov    (%rax),%eax
  804c35:	29 c2                	sub    %eax,%edx
  804c37:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804c3b:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  804c41:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804c45:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  804c4c:	00 00 00 
  804c4f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804c53:	48 b9 80 88 80 00 00 	movabs $0x808880,%rcx
  804c5a:	00 00 00 
  804c5d:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  804c64:	b8 00 00 00 00       	mov    $0x0,%eax
  804c69:	c9                   	leaveq 
  804c6a:	c3                   	retq   

0000000000804c6b <devpipe_close>:
  804c6b:	55                   	push   %rbp
  804c6c:	48 89 e5             	mov    %rsp,%rbp
  804c6f:	48 83 ec 10          	sub    $0x10,%rsp
  804c73:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804c77:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804c7b:	48 89 c6             	mov    %rax,%rsi
  804c7e:	bf 00 00 00 00       	mov    $0x0,%edi
  804c83:	48 b8 1b 1f 80 00 00 	movabs $0x801f1b,%rax
  804c8a:	00 00 00 
  804c8d:	ff d0                	callq  *%rax
  804c8f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804c93:	48 89 c7             	mov    %rax,%rdi
  804c96:	48 b8 71 23 80 00 00 	movabs $0x802371,%rax
  804c9d:	00 00 00 
  804ca0:	ff d0                	callq  *%rax
  804ca2:	48 89 c6             	mov    %rax,%rsi
  804ca5:	bf 00 00 00 00       	mov    $0x0,%edi
  804caa:	48 b8 1b 1f 80 00 00 	movabs $0x801f1b,%rax
  804cb1:	00 00 00 
  804cb4:	ff d0                	callq  *%rax
  804cb6:	c9                   	leaveq 
  804cb7:	c3                   	retq   

0000000000804cb8 <wait>:
  804cb8:	55                   	push   %rbp
  804cb9:	48 89 e5             	mov    %rsp,%rbp
  804cbc:	48 83 ec 20          	sub    $0x20,%rsp
  804cc0:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804cc3:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804cc7:	75 35                	jne    804cfe <wait+0x46>
  804cc9:	48 b9 80 58 80 00 00 	movabs $0x805880,%rcx
  804cd0:	00 00 00 
  804cd3:	48 ba 8b 58 80 00 00 	movabs $0x80588b,%rdx
  804cda:	00 00 00 
  804cdd:	be 0a 00 00 00       	mov    $0xa,%esi
  804ce2:	48 bf a0 58 80 00 00 	movabs $0x8058a0,%rdi
  804ce9:	00 00 00 
  804cec:	b8 00 00 00 00       	mov    $0x0,%eax
  804cf1:	49 b8 53 07 80 00 00 	movabs $0x800753,%r8
  804cf8:	00 00 00 
  804cfb:	41 ff d0             	callq  *%r8
  804cfe:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804d01:	25 ff 03 00 00       	and    $0x3ff,%eax
  804d06:	48 98                	cltq   
  804d08:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  804d0f:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804d16:	00 00 00 
  804d19:	48 01 d0             	add    %rdx,%rax
  804d1c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804d20:	eb 0c                	jmp    804d2e <wait+0x76>
  804d22:	48 b8 32 1e 80 00 00 	movabs $0x801e32,%rax
  804d29:	00 00 00 
  804d2c:	ff d0                	callq  *%rax
  804d2e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804d32:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  804d38:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  804d3b:	75 0e                	jne    804d4b <wait+0x93>
  804d3d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804d41:	8b 80 d4 00 00 00    	mov    0xd4(%rax),%eax
  804d47:	85 c0                	test   %eax,%eax
  804d49:	75 d7                	jne    804d22 <wait+0x6a>
  804d4b:	c9                   	leaveq 
  804d4c:	c3                   	retq   

0000000000804d4d <ipc_recv>:
  804d4d:	55                   	push   %rbp
  804d4e:	48 89 e5             	mov    %rsp,%rbp
  804d51:	48 83 ec 30          	sub    $0x30,%rsp
  804d55:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804d59:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804d5d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804d61:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  804d66:	75 0e                	jne    804d76 <ipc_recv+0x29>
  804d68:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804d6f:	00 00 00 
  804d72:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804d76:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804d7a:	48 89 c7             	mov    %rax,%rdi
  804d7d:	48 b8 99 20 80 00 00 	movabs $0x802099,%rax
  804d84:	00 00 00 
  804d87:	ff d0                	callq  *%rax
  804d89:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804d8c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804d90:	79 27                	jns    804db9 <ipc_recv+0x6c>
  804d92:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  804d97:	74 0a                	je     804da3 <ipc_recv+0x56>
  804d99:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804d9d:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  804da3:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804da8:	74 0a                	je     804db4 <ipc_recv+0x67>
  804daa:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804dae:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  804db4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804db7:	eb 53                	jmp    804e0c <ipc_recv+0xbf>
  804db9:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  804dbe:	74 19                	je     804dd9 <ipc_recv+0x8c>
  804dc0:	48 b8 90 a7 80 00 00 	movabs $0x80a790,%rax
  804dc7:	00 00 00 
  804dca:	48 8b 00             	mov    (%rax),%rax
  804dcd:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  804dd3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804dd7:	89 10                	mov    %edx,(%rax)
  804dd9:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804dde:	74 19                	je     804df9 <ipc_recv+0xac>
  804de0:	48 b8 90 a7 80 00 00 	movabs $0x80a790,%rax
  804de7:	00 00 00 
  804dea:	48 8b 00             	mov    (%rax),%rax
  804ded:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  804df3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804df7:	89 10                	mov    %edx,(%rax)
  804df9:	48 b8 90 a7 80 00 00 	movabs $0x80a790,%rax
  804e00:	00 00 00 
  804e03:	48 8b 00             	mov    (%rax),%rax
  804e06:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  804e0c:	c9                   	leaveq 
  804e0d:	c3                   	retq   

0000000000804e0e <ipc_send>:
  804e0e:	55                   	push   %rbp
  804e0f:	48 89 e5             	mov    %rsp,%rbp
  804e12:	48 83 ec 30          	sub    $0x30,%rsp
  804e16:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804e19:	89 75 e8             	mov    %esi,-0x18(%rbp)
  804e1c:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  804e20:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  804e23:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  804e28:	75 10                	jne    804e3a <ipc_send+0x2c>
  804e2a:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804e31:	00 00 00 
  804e34:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804e38:	eb 0e                	jmp    804e48 <ipc_send+0x3a>
  804e3a:	eb 0c                	jmp    804e48 <ipc_send+0x3a>
  804e3c:	48 b8 32 1e 80 00 00 	movabs $0x801e32,%rax
  804e43:	00 00 00 
  804e46:	ff d0                	callq  *%rax
  804e48:	8b 75 e8             	mov    -0x18(%rbp),%esi
  804e4b:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  804e4e:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  804e52:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804e55:	89 c7                	mov    %eax,%edi
  804e57:	48 b8 44 20 80 00 00 	movabs $0x802044,%rax
  804e5e:	00 00 00 
  804e61:	ff d0                	callq  *%rax
  804e63:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804e66:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  804e6a:	74 d0                	je     804e3c <ipc_send+0x2e>
  804e6c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804e70:	79 30                	jns    804ea2 <ipc_send+0x94>
  804e72:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804e75:	89 c1                	mov    %eax,%ecx
  804e77:	48 ba ae 58 80 00 00 	movabs $0x8058ae,%rdx
  804e7e:	00 00 00 
  804e81:	be 44 00 00 00       	mov    $0x44,%esi
  804e86:	48 bf c4 58 80 00 00 	movabs $0x8058c4,%rdi
  804e8d:	00 00 00 
  804e90:	b8 00 00 00 00       	mov    $0x0,%eax
  804e95:	49 b8 53 07 80 00 00 	movabs $0x800753,%r8
  804e9c:	00 00 00 
  804e9f:	41 ff d0             	callq  *%r8
  804ea2:	c9                   	leaveq 
  804ea3:	c3                   	retq   

0000000000804ea4 <ipc_find_env>:
  804ea4:	55                   	push   %rbp
  804ea5:	48 89 e5             	mov    %rsp,%rbp
  804ea8:	48 83 ec 14          	sub    $0x14,%rsp
  804eac:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804eaf:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804eb6:	eb 4e                	jmp    804f06 <ipc_find_env+0x62>
  804eb8:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804ebf:	00 00 00 
  804ec2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804ec5:	48 98                	cltq   
  804ec7:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804ece:	48 01 d0             	add    %rdx,%rax
  804ed1:	48 05 d0 00 00 00    	add    $0xd0,%rax
  804ed7:	8b 00                	mov    (%rax),%eax
  804ed9:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  804edc:	75 24                	jne    804f02 <ipc_find_env+0x5e>
  804ede:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804ee5:	00 00 00 
  804ee8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804eeb:	48 98                	cltq   
  804eed:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804ef4:	48 01 d0             	add    %rdx,%rax
  804ef7:	48 05 c0 00 00 00    	add    $0xc0,%rax
  804efd:	8b 40 08             	mov    0x8(%rax),%eax
  804f00:	eb 12                	jmp    804f14 <ipc_find_env+0x70>
  804f02:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  804f06:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  804f0d:	7e a9                	jle    804eb8 <ipc_find_env+0x14>
  804f0f:	b8 00 00 00 00       	mov    $0x0,%eax
  804f14:	c9                   	leaveq 
  804f15:	c3                   	retq   

0000000000804f16 <pageref>:
  804f16:	55                   	push   %rbp
  804f17:	48 89 e5             	mov    %rsp,%rbp
  804f1a:	48 83 ec 18          	sub    $0x18,%rsp
  804f1e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804f22:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804f26:	48 c1 e8 15          	shr    $0x15,%rax
  804f2a:	48 89 c2             	mov    %rax,%rdx
  804f2d:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  804f34:	01 00 00 
  804f37:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804f3b:	83 e0 01             	and    $0x1,%eax
  804f3e:	48 85 c0             	test   %rax,%rax
  804f41:	75 07                	jne    804f4a <pageref+0x34>
  804f43:	b8 00 00 00 00       	mov    $0x0,%eax
  804f48:	eb 53                	jmp    804f9d <pageref+0x87>
  804f4a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804f4e:	48 c1 e8 0c          	shr    $0xc,%rax
  804f52:	48 89 c2             	mov    %rax,%rdx
  804f55:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  804f5c:	01 00 00 
  804f5f:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804f63:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804f67:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804f6b:	83 e0 01             	and    $0x1,%eax
  804f6e:	48 85 c0             	test   %rax,%rax
  804f71:	75 07                	jne    804f7a <pageref+0x64>
  804f73:	b8 00 00 00 00       	mov    $0x0,%eax
  804f78:	eb 23                	jmp    804f9d <pageref+0x87>
  804f7a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804f7e:	48 c1 e8 0c          	shr    $0xc,%rax
  804f82:	48 89 c2             	mov    %rax,%rdx
  804f85:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  804f8c:	00 00 00 
  804f8f:	48 c1 e2 04          	shl    $0x4,%rdx
  804f93:	48 01 d0             	add    %rdx,%rax
  804f96:	0f b7 40 08          	movzwl 0x8(%rax),%eax
  804f9a:	0f b7 c0             	movzwl %ax,%eax
  804f9d:	c9                   	leaveq 
  804f9e:	c3                   	retq   
