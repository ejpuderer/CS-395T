
obj/user/num:     file format elf64-x86-64


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
  80003c:	e8 97 02 00 00       	callq  8002d8 <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <num>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 20          	sub    $0x20,%rsp
  80004b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80004e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800052:	e9 da 00 00 00       	jmpq   800131 <num+0xee>
  800057:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  80005e:	00 00 00 
  800061:	8b 00                	mov    (%rax),%eax
  800063:	85 c0                	test   %eax,%eax
  800065:	74 54                	je     8000bb <num+0x78>
  800067:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  80006e:	00 00 00 
  800071:	8b 00                	mov    (%rax),%eax
  800073:	8d 50 01             	lea    0x1(%rax),%edx
  800076:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  80007d:	00 00 00 
  800080:	89 10                	mov    %edx,(%rax)
  800082:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  800089:	00 00 00 
  80008c:	8b 00                	mov    (%rax),%eax
  80008e:	89 c6                	mov    %eax,%esi
  800090:	48 bf a0 45 80 00 00 	movabs $0x8045a0,%rdi
  800097:	00 00 00 
  80009a:	b8 00 00 00 00       	mov    $0x0,%eax
  80009f:	48 ba f2 31 80 00 00 	movabs $0x8031f2,%rdx
  8000a6:	00 00 00 
  8000a9:	ff d2                	callq  *%rdx
  8000ab:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  8000b2:	00 00 00 
  8000b5:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8000bb:	48 8d 45 f3          	lea    -0xd(%rbp),%rax
  8000bf:	ba 01 00 00 00       	mov    $0x1,%edx
  8000c4:	48 89 c6             	mov    %rax,%rsi
  8000c7:	bf 01 00 00 00       	mov    $0x1,%edi
  8000cc:	48 b8 db 25 80 00 00 	movabs $0x8025db,%rax
  8000d3:	00 00 00 
  8000d6:	ff d0                	callq  *%rax
  8000d8:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8000db:	83 7d f4 01          	cmpl   $0x1,-0xc(%rbp)
  8000df:	74 38                	je     800119 <num+0xd6>
  8000e1:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8000e4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8000e8:	41 89 d0             	mov    %edx,%r8d
  8000eb:	48 89 c1             	mov    %rax,%rcx
  8000ee:	48 ba a5 45 80 00 00 	movabs $0x8045a5,%rdx
  8000f5:	00 00 00 
  8000f8:	be 14 00 00 00       	mov    $0x14,%esi
  8000fd:	48 bf c0 45 80 00 00 	movabs $0x8045c0,%rdi
  800104:	00 00 00 
  800107:	b8 00 00 00 00       	mov    $0x0,%eax
  80010c:	49 b9 7e 03 80 00 00 	movabs $0x80037e,%r9
  800113:	00 00 00 
  800116:	41 ff d1             	callq  *%r9
  800119:	0f b6 45 f3          	movzbl -0xd(%rbp),%eax
  80011d:	3c 0a                	cmp    $0xa,%al
  80011f:	75 10                	jne    800131 <num+0xee>
  800121:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  800128:	00 00 00 
  80012b:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
  800131:	48 8d 4d f3          	lea    -0xd(%rbp),%rcx
  800135:	8b 45 ec             	mov    -0x14(%rbp),%eax
  800138:	ba 01 00 00 00       	mov    $0x1,%edx
  80013d:	48 89 ce             	mov    %rcx,%rsi
  800140:	89 c7                	mov    %eax,%edi
  800142:	48 b8 91 24 80 00 00 	movabs $0x802491,%rax
  800149:	00 00 00 
  80014c:	ff d0                	callq  *%rax
  80014e:	48 98                	cltq   
  800150:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800154:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  800159:	0f 8f f8 fe ff ff    	jg     800057 <num+0x14>
  80015f:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  800164:	79 39                	jns    80019f <num+0x15c>
  800166:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80016a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80016e:	49 89 d0             	mov    %rdx,%r8
  800171:	48 89 c1             	mov    %rax,%rcx
  800174:	48 ba ce 45 80 00 00 	movabs $0x8045ce,%rdx
  80017b:	00 00 00 
  80017e:	be 19 00 00 00       	mov    $0x19,%esi
  800183:	48 bf c0 45 80 00 00 	movabs $0x8045c0,%rdi
  80018a:	00 00 00 
  80018d:	b8 00 00 00 00       	mov    $0x0,%eax
  800192:	49 b9 7e 03 80 00 00 	movabs $0x80037e,%r9
  800199:	00 00 00 
  80019c:	41 ff d1             	callq  *%r9
  80019f:	c9                   	leaveq 
  8001a0:	c3                   	retq   

00000000008001a1 <umain>:
  8001a1:	55                   	push   %rbp
  8001a2:	48 89 e5             	mov    %rsp,%rbp
  8001a5:	53                   	push   %rbx
  8001a6:	48 83 ec 28          	sub    $0x28,%rsp
  8001aa:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8001ad:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8001b1:	48 b8 08 60 80 00 00 	movabs $0x806008,%rax
  8001b8:	00 00 00 
  8001bb:	48 bb e3 45 80 00 00 	movabs $0x8045e3,%rbx
  8001c2:	00 00 00 
  8001c5:	48 89 18             	mov    %rbx,(%rax)
  8001c8:	83 7d dc 01          	cmpl   $0x1,-0x24(%rbp)
  8001cc:	75 20                	jne    8001ee <umain+0x4d>
  8001ce:	48 be e7 45 80 00 00 	movabs $0x8045e7,%rsi
  8001d5:	00 00 00 
  8001d8:	bf 00 00 00 00       	mov    $0x0,%edi
  8001dd:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8001e4:	00 00 00 
  8001e7:	ff d0                	callq  *%rax
  8001e9:	e9 d7 00 00 00       	jmpq   8002c5 <umain+0x124>
  8001ee:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%rbp)
  8001f5:	e9 bf 00 00 00       	jmpq   8002b9 <umain+0x118>
  8001fa:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8001fd:	48 98                	cltq   
  8001ff:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800206:	00 
  800207:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80020b:	48 01 d0             	add    %rdx,%rax
  80020e:	48 8b 00             	mov    (%rax),%rax
  800211:	be 00 00 00 00       	mov    $0x0,%esi
  800216:	48 89 c7             	mov    %rax,%rdi
  800219:	48 b8 67 29 80 00 00 	movabs $0x802967,%rax
  800220:	00 00 00 
  800223:	ff d0                	callq  *%rax
  800225:	89 45 e8             	mov    %eax,-0x18(%rbp)
  800228:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  80022c:	79 4b                	jns    800279 <umain+0xd8>
  80022e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  800231:	48 98                	cltq   
  800233:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  80023a:	00 
  80023b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80023f:	48 01 d0             	add    %rdx,%rax
  800242:	48 8b 00             	mov    (%rax),%rax
  800245:	8b 55 e8             	mov    -0x18(%rbp),%edx
  800248:	41 89 d0             	mov    %edx,%r8d
  80024b:	48 89 c1             	mov    %rax,%rcx
  80024e:	48 ba ef 45 80 00 00 	movabs $0x8045ef,%rdx
  800255:	00 00 00 
  800258:	be 28 00 00 00       	mov    $0x28,%esi
  80025d:	48 bf c0 45 80 00 00 	movabs $0x8045c0,%rdi
  800264:	00 00 00 
  800267:	b8 00 00 00 00       	mov    $0x0,%eax
  80026c:	49 b9 7e 03 80 00 00 	movabs $0x80037e,%r9
  800273:	00 00 00 
  800276:	41 ff d1             	callq  *%r9
  800279:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80027c:	48 98                	cltq   
  80027e:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800285:	00 
  800286:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80028a:	48 01 d0             	add    %rdx,%rax
  80028d:	48 8b 10             	mov    (%rax),%rdx
  800290:	8b 45 e8             	mov    -0x18(%rbp),%eax
  800293:	48 89 d6             	mov    %rdx,%rsi
  800296:	89 c7                	mov    %eax,%edi
  800298:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  80029f:	00 00 00 
  8002a2:	ff d0                	callq  *%rax
  8002a4:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8002a7:	89 c7                	mov    %eax,%edi
  8002a9:	48 b8 6f 22 80 00 00 	movabs $0x80226f,%rax
  8002b0:	00 00 00 
  8002b3:	ff d0                	callq  *%rax
  8002b5:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
  8002b9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8002bc:	3b 45 dc             	cmp    -0x24(%rbp),%eax
  8002bf:	0f 8c 35 ff ff ff    	jl     8001fa <umain+0x59>
  8002c5:	48 b8 5b 03 80 00 00 	movabs $0x80035b,%rax
  8002cc:	00 00 00 
  8002cf:	ff d0                	callq  *%rax
  8002d1:	48 83 c4 28          	add    $0x28,%rsp
  8002d5:	5b                   	pop    %rbx
  8002d6:	5d                   	pop    %rbp
  8002d7:	c3                   	retq   

00000000008002d8 <libmain>:
  8002d8:	55                   	push   %rbp
  8002d9:	48 89 e5             	mov    %rsp,%rbp
  8002dc:	48 83 ec 10          	sub    $0x10,%rsp
  8002e0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8002e3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8002e7:	48 b8 1f 1a 80 00 00 	movabs $0x801a1f,%rax
  8002ee:	00 00 00 
  8002f1:	ff d0                	callq  *%rax
  8002f3:	25 ff 03 00 00       	and    $0x3ff,%eax
  8002f8:	48 98                	cltq   
  8002fa:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  800301:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  800308:	00 00 00 
  80030b:	48 01 c2             	add    %rax,%rdx
  80030e:	48 b8 10 70 80 00 00 	movabs $0x807010,%rax
  800315:	00 00 00 
  800318:	48 89 10             	mov    %rdx,(%rax)
  80031b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80031f:	7e 14                	jle    800335 <libmain+0x5d>
  800321:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800325:	48 8b 10             	mov    (%rax),%rdx
  800328:	48 b8 08 60 80 00 00 	movabs $0x806008,%rax
  80032f:	00 00 00 
  800332:	48 89 10             	mov    %rdx,(%rax)
  800335:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800339:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80033c:	48 89 d6             	mov    %rdx,%rsi
  80033f:	89 c7                	mov    %eax,%edi
  800341:	48 b8 a1 01 80 00 00 	movabs $0x8001a1,%rax
  800348:	00 00 00 
  80034b:	ff d0                	callq  *%rax
  80034d:	48 b8 5b 03 80 00 00 	movabs $0x80035b,%rax
  800354:	00 00 00 
  800357:	ff d0                	callq  *%rax
  800359:	c9                   	leaveq 
  80035a:	c3                   	retq   

000000000080035b <exit>:
  80035b:	55                   	push   %rbp
  80035c:	48 89 e5             	mov    %rsp,%rbp
  80035f:	48 b8 ba 22 80 00 00 	movabs $0x8022ba,%rax
  800366:	00 00 00 
  800369:	ff d0                	callq  *%rax
  80036b:	bf 00 00 00 00       	mov    $0x0,%edi
  800370:	48 b8 db 19 80 00 00 	movabs $0x8019db,%rax
  800377:	00 00 00 
  80037a:	ff d0                	callq  *%rax
  80037c:	5d                   	pop    %rbp
  80037d:	c3                   	retq   

000000000080037e <_panic>:
  80037e:	55                   	push   %rbp
  80037f:	48 89 e5             	mov    %rsp,%rbp
  800382:	53                   	push   %rbx
  800383:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  80038a:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  800391:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  800397:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  80039e:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  8003a5:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  8003ac:	84 c0                	test   %al,%al
  8003ae:	74 23                	je     8003d3 <_panic+0x55>
  8003b0:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  8003b7:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  8003bb:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  8003bf:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  8003c3:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  8003c7:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  8003cb:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  8003cf:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  8003d3:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  8003da:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  8003e1:	00 00 00 
  8003e4:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  8003eb:	00 00 00 
  8003ee:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8003f2:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  8003f9:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  800400:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800407:	48 b8 08 60 80 00 00 	movabs $0x806008,%rax
  80040e:	00 00 00 
  800411:	48 8b 18             	mov    (%rax),%rbx
  800414:	48 b8 1f 1a 80 00 00 	movabs $0x801a1f,%rax
  80041b:	00 00 00 
  80041e:	ff d0                	callq  *%rax
  800420:	8b 8d 14 ff ff ff    	mov    -0xec(%rbp),%ecx
  800426:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  80042d:	41 89 c8             	mov    %ecx,%r8d
  800430:	48 89 d1             	mov    %rdx,%rcx
  800433:	48 89 da             	mov    %rbx,%rdx
  800436:	89 c6                	mov    %eax,%esi
  800438:	48 bf 10 46 80 00 00 	movabs $0x804610,%rdi
  80043f:	00 00 00 
  800442:	b8 00 00 00 00       	mov    $0x0,%eax
  800447:	49 b9 b7 05 80 00 00 	movabs $0x8005b7,%r9
  80044e:	00 00 00 
  800451:	41 ff d1             	callq  *%r9
  800454:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  80045b:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800462:	48 89 d6             	mov    %rdx,%rsi
  800465:	48 89 c7             	mov    %rax,%rdi
  800468:	48 b8 0b 05 80 00 00 	movabs $0x80050b,%rax
  80046f:	00 00 00 
  800472:	ff d0                	callq  *%rax
  800474:	48 bf 33 46 80 00 00 	movabs $0x804633,%rdi
  80047b:	00 00 00 
  80047e:	b8 00 00 00 00       	mov    $0x0,%eax
  800483:	48 ba b7 05 80 00 00 	movabs $0x8005b7,%rdx
  80048a:	00 00 00 
  80048d:	ff d2                	callq  *%rdx
  80048f:	cc                   	int3   
  800490:	eb fd                	jmp    80048f <_panic+0x111>

0000000000800492 <putch>:
  800492:	55                   	push   %rbp
  800493:	48 89 e5             	mov    %rsp,%rbp
  800496:	48 83 ec 10          	sub    $0x10,%rsp
  80049a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80049d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8004a1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8004a5:	8b 00                	mov    (%rax),%eax
  8004a7:	8d 48 01             	lea    0x1(%rax),%ecx
  8004aa:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8004ae:	89 0a                	mov    %ecx,(%rdx)
  8004b0:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8004b3:	89 d1                	mov    %edx,%ecx
  8004b5:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8004b9:	48 98                	cltq   
  8004bb:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  8004bf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8004c3:	8b 00                	mov    (%rax),%eax
  8004c5:	3d ff 00 00 00       	cmp    $0xff,%eax
  8004ca:	75 2c                	jne    8004f8 <putch+0x66>
  8004cc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8004d0:	8b 00                	mov    (%rax),%eax
  8004d2:	48 98                	cltq   
  8004d4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8004d8:	48 83 c2 08          	add    $0x8,%rdx
  8004dc:	48 89 c6             	mov    %rax,%rsi
  8004df:	48 89 d7             	mov    %rdx,%rdi
  8004e2:	48 b8 53 19 80 00 00 	movabs $0x801953,%rax
  8004e9:	00 00 00 
  8004ec:	ff d0                	callq  *%rax
  8004ee:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8004f2:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8004f8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8004fc:	8b 40 04             	mov    0x4(%rax),%eax
  8004ff:	8d 50 01             	lea    0x1(%rax),%edx
  800502:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800506:	89 50 04             	mov    %edx,0x4(%rax)
  800509:	c9                   	leaveq 
  80050a:	c3                   	retq   

000000000080050b <vcprintf>:
  80050b:	55                   	push   %rbp
  80050c:	48 89 e5             	mov    %rsp,%rbp
  80050f:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  800516:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  80051d:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  800524:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  80052b:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  800532:	48 8b 0a             	mov    (%rdx),%rcx
  800535:	48 89 08             	mov    %rcx,(%rax)
  800538:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80053c:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800540:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800544:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800548:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  80054f:	00 00 00 
  800552:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  800559:	00 00 00 
  80055c:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  800563:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  80056a:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800571:	48 89 c6             	mov    %rax,%rsi
  800574:	48 bf 92 04 80 00 00 	movabs $0x800492,%rdi
  80057b:	00 00 00 
  80057e:	48 b8 6a 09 80 00 00 	movabs $0x80096a,%rax
  800585:	00 00 00 
  800588:	ff d0                	callq  *%rax
  80058a:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  800590:	48 98                	cltq   
  800592:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  800599:	48 83 c2 08          	add    $0x8,%rdx
  80059d:	48 89 c6             	mov    %rax,%rsi
  8005a0:	48 89 d7             	mov    %rdx,%rdi
  8005a3:	48 b8 53 19 80 00 00 	movabs $0x801953,%rax
  8005aa:	00 00 00 
  8005ad:	ff d0                	callq  *%rax
  8005af:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  8005b5:	c9                   	leaveq 
  8005b6:	c3                   	retq   

00000000008005b7 <cprintf>:
  8005b7:	55                   	push   %rbp
  8005b8:	48 89 e5             	mov    %rsp,%rbp
  8005bb:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  8005c2:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  8005c9:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  8005d0:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8005d7:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8005de:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8005e5:	84 c0                	test   %al,%al
  8005e7:	74 20                	je     800609 <cprintf+0x52>
  8005e9:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8005ed:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8005f1:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8005f5:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8005f9:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8005fd:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800601:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800605:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800609:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800610:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  800617:	00 00 00 
  80061a:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800621:	00 00 00 
  800624:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800628:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  80062f:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800636:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  80063d:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800644:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  80064b:	48 8b 0a             	mov    (%rdx),%rcx
  80064e:	48 89 08             	mov    %rcx,(%rax)
  800651:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800655:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800659:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  80065d:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800661:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  800668:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  80066f:	48 89 d6             	mov    %rdx,%rsi
  800672:	48 89 c7             	mov    %rax,%rdi
  800675:	48 b8 0b 05 80 00 00 	movabs $0x80050b,%rax
  80067c:	00 00 00 
  80067f:	ff d0                	callq  *%rax
  800681:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  800687:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  80068d:	c9                   	leaveq 
  80068e:	c3                   	retq   

000000000080068f <printnum>:
  80068f:	55                   	push   %rbp
  800690:	48 89 e5             	mov    %rsp,%rbp
  800693:	53                   	push   %rbx
  800694:	48 83 ec 38          	sub    $0x38,%rsp
  800698:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80069c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8006a0:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8006a4:	89 4d d4             	mov    %ecx,-0x2c(%rbp)
  8006a7:	44 89 45 d0          	mov    %r8d,-0x30(%rbp)
  8006ab:	44 89 4d cc          	mov    %r9d,-0x34(%rbp)
  8006af:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  8006b2:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8006b6:	77 3b                	ja     8006f3 <printnum+0x64>
  8006b8:	8b 45 d0             	mov    -0x30(%rbp),%eax
  8006bb:	44 8d 40 ff          	lea    -0x1(%rax),%r8d
  8006bf:	8b 5d d4             	mov    -0x2c(%rbp),%ebx
  8006c2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8006c6:	ba 00 00 00 00       	mov    $0x0,%edx
  8006cb:	48 f7 f3             	div    %rbx
  8006ce:	48 89 c2             	mov    %rax,%rdx
  8006d1:	8b 7d cc             	mov    -0x34(%rbp),%edi
  8006d4:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  8006d7:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
  8006db:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006df:	41 89 f9             	mov    %edi,%r9d
  8006e2:	48 89 c7             	mov    %rax,%rdi
  8006e5:	48 b8 8f 06 80 00 00 	movabs $0x80068f,%rax
  8006ec:	00 00 00 
  8006ef:	ff d0                	callq  *%rax
  8006f1:	eb 1e                	jmp    800711 <printnum+0x82>
  8006f3:	eb 12                	jmp    800707 <printnum+0x78>
  8006f5:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8006f9:	8b 55 cc             	mov    -0x34(%rbp),%edx
  8006fc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800700:	48 89 ce             	mov    %rcx,%rsi
  800703:	89 d7                	mov    %edx,%edi
  800705:	ff d0                	callq  *%rax
  800707:	83 6d d0 01          	subl   $0x1,-0x30(%rbp)
  80070b:	83 7d d0 00          	cmpl   $0x0,-0x30(%rbp)
  80070f:	7f e4                	jg     8006f5 <printnum+0x66>
  800711:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  800714:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800718:	ba 00 00 00 00       	mov    $0x0,%edx
  80071d:	48 f7 f1             	div    %rcx
  800720:	48 89 d0             	mov    %rdx,%rax
  800723:	48 ba 30 48 80 00 00 	movabs $0x804830,%rdx
  80072a:	00 00 00 
  80072d:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
  800731:	0f be d0             	movsbl %al,%edx
  800734:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  800738:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80073c:	48 89 ce             	mov    %rcx,%rsi
  80073f:	89 d7                	mov    %edx,%edi
  800741:	ff d0                	callq  *%rax
  800743:	48 83 c4 38          	add    $0x38,%rsp
  800747:	5b                   	pop    %rbx
  800748:	5d                   	pop    %rbp
  800749:	c3                   	retq   

000000000080074a <getuint>:
  80074a:	55                   	push   %rbp
  80074b:	48 89 e5             	mov    %rsp,%rbp
  80074e:	48 83 ec 1c          	sub    $0x1c,%rsp
  800752:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800756:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800759:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  80075d:	7e 52                	jle    8007b1 <getuint+0x67>
  80075f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800763:	8b 00                	mov    (%rax),%eax
  800765:	83 f8 30             	cmp    $0x30,%eax
  800768:	73 24                	jae    80078e <getuint+0x44>
  80076a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80076e:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800772:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800776:	8b 00                	mov    (%rax),%eax
  800778:	89 c0                	mov    %eax,%eax
  80077a:	48 01 d0             	add    %rdx,%rax
  80077d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800781:	8b 12                	mov    (%rdx),%edx
  800783:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800786:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80078a:	89 0a                	mov    %ecx,(%rdx)
  80078c:	eb 17                	jmp    8007a5 <getuint+0x5b>
  80078e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800792:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800796:	48 89 d0             	mov    %rdx,%rax
  800799:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  80079d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007a1:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8007a5:	48 8b 00             	mov    (%rax),%rax
  8007a8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8007ac:	e9 a3 00 00 00       	jmpq   800854 <getuint+0x10a>
  8007b1:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  8007b5:	74 4f                	je     800806 <getuint+0xbc>
  8007b7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007bb:	8b 00                	mov    (%rax),%eax
  8007bd:	83 f8 30             	cmp    $0x30,%eax
  8007c0:	73 24                	jae    8007e6 <getuint+0x9c>
  8007c2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007c6:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8007ca:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007ce:	8b 00                	mov    (%rax),%eax
  8007d0:	89 c0                	mov    %eax,%eax
  8007d2:	48 01 d0             	add    %rdx,%rax
  8007d5:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007d9:	8b 12                	mov    (%rdx),%edx
  8007db:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8007de:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007e2:	89 0a                	mov    %ecx,(%rdx)
  8007e4:	eb 17                	jmp    8007fd <getuint+0xb3>
  8007e6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007ea:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8007ee:	48 89 d0             	mov    %rdx,%rax
  8007f1:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8007f5:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007f9:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8007fd:	48 8b 00             	mov    (%rax),%rax
  800800:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800804:	eb 4e                	jmp    800854 <getuint+0x10a>
  800806:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80080a:	8b 00                	mov    (%rax),%eax
  80080c:	83 f8 30             	cmp    $0x30,%eax
  80080f:	73 24                	jae    800835 <getuint+0xeb>
  800811:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800815:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800819:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80081d:	8b 00                	mov    (%rax),%eax
  80081f:	89 c0                	mov    %eax,%eax
  800821:	48 01 d0             	add    %rdx,%rax
  800824:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800828:	8b 12                	mov    (%rdx),%edx
  80082a:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80082d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800831:	89 0a                	mov    %ecx,(%rdx)
  800833:	eb 17                	jmp    80084c <getuint+0x102>
  800835:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800839:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80083d:	48 89 d0             	mov    %rdx,%rax
  800840:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800844:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800848:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80084c:	8b 00                	mov    (%rax),%eax
  80084e:	89 c0                	mov    %eax,%eax
  800850:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800854:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800858:	c9                   	leaveq 
  800859:	c3                   	retq   

000000000080085a <getint>:
  80085a:	55                   	push   %rbp
  80085b:	48 89 e5             	mov    %rsp,%rbp
  80085e:	48 83 ec 1c          	sub    $0x1c,%rsp
  800862:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800866:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800869:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  80086d:	7e 52                	jle    8008c1 <getint+0x67>
  80086f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800873:	8b 00                	mov    (%rax),%eax
  800875:	83 f8 30             	cmp    $0x30,%eax
  800878:	73 24                	jae    80089e <getint+0x44>
  80087a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80087e:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800882:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800886:	8b 00                	mov    (%rax),%eax
  800888:	89 c0                	mov    %eax,%eax
  80088a:	48 01 d0             	add    %rdx,%rax
  80088d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800891:	8b 12                	mov    (%rdx),%edx
  800893:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800896:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80089a:	89 0a                	mov    %ecx,(%rdx)
  80089c:	eb 17                	jmp    8008b5 <getint+0x5b>
  80089e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008a2:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8008a6:	48 89 d0             	mov    %rdx,%rax
  8008a9:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8008ad:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008b1:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8008b5:	48 8b 00             	mov    (%rax),%rax
  8008b8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8008bc:	e9 a3 00 00 00       	jmpq   800964 <getint+0x10a>
  8008c1:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  8008c5:	74 4f                	je     800916 <getint+0xbc>
  8008c7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008cb:	8b 00                	mov    (%rax),%eax
  8008cd:	83 f8 30             	cmp    $0x30,%eax
  8008d0:	73 24                	jae    8008f6 <getint+0x9c>
  8008d2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008d6:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8008da:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008de:	8b 00                	mov    (%rax),%eax
  8008e0:	89 c0                	mov    %eax,%eax
  8008e2:	48 01 d0             	add    %rdx,%rax
  8008e5:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008e9:	8b 12                	mov    (%rdx),%edx
  8008eb:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8008ee:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008f2:	89 0a                	mov    %ecx,(%rdx)
  8008f4:	eb 17                	jmp    80090d <getint+0xb3>
  8008f6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008fa:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8008fe:	48 89 d0             	mov    %rdx,%rax
  800901:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800905:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800909:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80090d:	48 8b 00             	mov    (%rax),%rax
  800910:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800914:	eb 4e                	jmp    800964 <getint+0x10a>
  800916:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80091a:	8b 00                	mov    (%rax),%eax
  80091c:	83 f8 30             	cmp    $0x30,%eax
  80091f:	73 24                	jae    800945 <getint+0xeb>
  800921:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800925:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800929:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80092d:	8b 00                	mov    (%rax),%eax
  80092f:	89 c0                	mov    %eax,%eax
  800931:	48 01 d0             	add    %rdx,%rax
  800934:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800938:	8b 12                	mov    (%rdx),%edx
  80093a:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80093d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800941:	89 0a                	mov    %ecx,(%rdx)
  800943:	eb 17                	jmp    80095c <getint+0x102>
  800945:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800949:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80094d:	48 89 d0             	mov    %rdx,%rax
  800950:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800954:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800958:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80095c:	8b 00                	mov    (%rax),%eax
  80095e:	48 98                	cltq   
  800960:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800964:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800968:	c9                   	leaveq 
  800969:	c3                   	retq   

000000000080096a <vprintfmt>:
  80096a:	55                   	push   %rbp
  80096b:	48 89 e5             	mov    %rsp,%rbp
  80096e:	41 54                	push   %r12
  800970:	53                   	push   %rbx
  800971:	48 83 ec 60          	sub    $0x60,%rsp
  800975:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  800979:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  80097d:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800981:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  800985:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800989:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  80098d:	48 8b 0a             	mov    (%rdx),%rcx
  800990:	48 89 08             	mov    %rcx,(%rax)
  800993:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800997:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80099b:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  80099f:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8009a3:	eb 17                	jmp    8009bc <vprintfmt+0x52>
  8009a5:	85 db                	test   %ebx,%ebx
  8009a7:	0f 84 cc 04 00 00    	je     800e79 <vprintfmt+0x50f>
  8009ad:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8009b1:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8009b5:	48 89 d6             	mov    %rdx,%rsi
  8009b8:	89 df                	mov    %ebx,%edi
  8009ba:	ff d0                	callq  *%rax
  8009bc:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8009c0:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8009c4:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8009c8:	0f b6 00             	movzbl (%rax),%eax
  8009cb:	0f b6 d8             	movzbl %al,%ebx
  8009ce:	83 fb 25             	cmp    $0x25,%ebx
  8009d1:	75 d2                	jne    8009a5 <vprintfmt+0x3b>
  8009d3:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  8009d7:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  8009de:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  8009e5:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  8009ec:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  8009f3:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8009f7:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8009fb:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8009ff:	0f b6 00             	movzbl (%rax),%eax
  800a02:	0f b6 d8             	movzbl %al,%ebx
  800a05:	8d 43 dd             	lea    -0x23(%rbx),%eax
  800a08:	83 f8 55             	cmp    $0x55,%eax
  800a0b:	0f 87 34 04 00 00    	ja     800e45 <vprintfmt+0x4db>
  800a11:	89 c0                	mov    %eax,%eax
  800a13:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800a1a:	00 
  800a1b:	48 b8 58 48 80 00 00 	movabs $0x804858,%rax
  800a22:	00 00 00 
  800a25:	48 01 d0             	add    %rdx,%rax
  800a28:	48 8b 00             	mov    (%rax),%rax
  800a2b:	ff e0                	jmpq   *%rax
  800a2d:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  800a31:	eb c0                	jmp    8009f3 <vprintfmt+0x89>
  800a33:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  800a37:	eb ba                	jmp    8009f3 <vprintfmt+0x89>
  800a39:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  800a40:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800a43:	89 d0                	mov    %edx,%eax
  800a45:	c1 e0 02             	shl    $0x2,%eax
  800a48:	01 d0                	add    %edx,%eax
  800a4a:	01 c0                	add    %eax,%eax
  800a4c:	01 d8                	add    %ebx,%eax
  800a4e:	83 e8 30             	sub    $0x30,%eax
  800a51:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800a54:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800a58:	0f b6 00             	movzbl (%rax),%eax
  800a5b:	0f be d8             	movsbl %al,%ebx
  800a5e:	83 fb 2f             	cmp    $0x2f,%ebx
  800a61:	7e 0c                	jle    800a6f <vprintfmt+0x105>
  800a63:	83 fb 39             	cmp    $0x39,%ebx
  800a66:	7f 07                	jg     800a6f <vprintfmt+0x105>
  800a68:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  800a6d:	eb d1                	jmp    800a40 <vprintfmt+0xd6>
  800a6f:	eb 58                	jmp    800ac9 <vprintfmt+0x15f>
  800a71:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800a74:	83 f8 30             	cmp    $0x30,%eax
  800a77:	73 17                	jae    800a90 <vprintfmt+0x126>
  800a79:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800a7d:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800a80:	89 c0                	mov    %eax,%eax
  800a82:	48 01 d0             	add    %rdx,%rax
  800a85:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800a88:	83 c2 08             	add    $0x8,%edx
  800a8b:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800a8e:	eb 0f                	jmp    800a9f <vprintfmt+0x135>
  800a90:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800a94:	48 89 d0             	mov    %rdx,%rax
  800a97:	48 83 c2 08          	add    $0x8,%rdx
  800a9b:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800a9f:	8b 00                	mov    (%rax),%eax
  800aa1:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800aa4:	eb 23                	jmp    800ac9 <vprintfmt+0x15f>
  800aa6:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800aaa:	79 0c                	jns    800ab8 <vprintfmt+0x14e>
  800aac:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  800ab3:	e9 3b ff ff ff       	jmpq   8009f3 <vprintfmt+0x89>
  800ab8:	e9 36 ff ff ff       	jmpq   8009f3 <vprintfmt+0x89>
  800abd:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  800ac4:	e9 2a ff ff ff       	jmpq   8009f3 <vprintfmt+0x89>
  800ac9:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800acd:	79 12                	jns    800ae1 <vprintfmt+0x177>
  800acf:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800ad2:	89 45 dc             	mov    %eax,-0x24(%rbp)
  800ad5:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800adc:	e9 12 ff ff ff       	jmpq   8009f3 <vprintfmt+0x89>
  800ae1:	e9 0d ff ff ff       	jmpq   8009f3 <vprintfmt+0x89>
  800ae6:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  800aea:	e9 04 ff ff ff       	jmpq   8009f3 <vprintfmt+0x89>
  800aef:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800af2:	83 f8 30             	cmp    $0x30,%eax
  800af5:	73 17                	jae    800b0e <vprintfmt+0x1a4>
  800af7:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800afb:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800afe:	89 c0                	mov    %eax,%eax
  800b00:	48 01 d0             	add    %rdx,%rax
  800b03:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b06:	83 c2 08             	add    $0x8,%edx
  800b09:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800b0c:	eb 0f                	jmp    800b1d <vprintfmt+0x1b3>
  800b0e:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800b12:	48 89 d0             	mov    %rdx,%rax
  800b15:	48 83 c2 08          	add    $0x8,%rdx
  800b19:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800b1d:	8b 10                	mov    (%rax),%edx
  800b1f:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800b23:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b27:	48 89 ce             	mov    %rcx,%rsi
  800b2a:	89 d7                	mov    %edx,%edi
  800b2c:	ff d0                	callq  *%rax
  800b2e:	e9 40 03 00 00       	jmpq   800e73 <vprintfmt+0x509>
  800b33:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b36:	83 f8 30             	cmp    $0x30,%eax
  800b39:	73 17                	jae    800b52 <vprintfmt+0x1e8>
  800b3b:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800b3f:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b42:	89 c0                	mov    %eax,%eax
  800b44:	48 01 d0             	add    %rdx,%rax
  800b47:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b4a:	83 c2 08             	add    $0x8,%edx
  800b4d:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800b50:	eb 0f                	jmp    800b61 <vprintfmt+0x1f7>
  800b52:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800b56:	48 89 d0             	mov    %rdx,%rax
  800b59:	48 83 c2 08          	add    $0x8,%rdx
  800b5d:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800b61:	8b 18                	mov    (%rax),%ebx
  800b63:	85 db                	test   %ebx,%ebx
  800b65:	79 02                	jns    800b69 <vprintfmt+0x1ff>
  800b67:	f7 db                	neg    %ebx
  800b69:	83 fb 15             	cmp    $0x15,%ebx
  800b6c:	7f 16                	jg     800b84 <vprintfmt+0x21a>
  800b6e:	48 b8 80 47 80 00 00 	movabs $0x804780,%rax
  800b75:	00 00 00 
  800b78:	48 63 d3             	movslq %ebx,%rdx
  800b7b:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800b7f:	4d 85 e4             	test   %r12,%r12
  800b82:	75 2e                	jne    800bb2 <vprintfmt+0x248>
  800b84:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800b88:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b8c:	89 d9                	mov    %ebx,%ecx
  800b8e:	48 ba 41 48 80 00 00 	movabs $0x804841,%rdx
  800b95:	00 00 00 
  800b98:	48 89 c7             	mov    %rax,%rdi
  800b9b:	b8 00 00 00 00       	mov    $0x0,%eax
  800ba0:	49 b8 82 0e 80 00 00 	movabs $0x800e82,%r8
  800ba7:	00 00 00 
  800baa:	41 ff d0             	callq  *%r8
  800bad:	e9 c1 02 00 00       	jmpq   800e73 <vprintfmt+0x509>
  800bb2:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800bb6:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800bba:	4c 89 e1             	mov    %r12,%rcx
  800bbd:	48 ba 4a 48 80 00 00 	movabs $0x80484a,%rdx
  800bc4:	00 00 00 
  800bc7:	48 89 c7             	mov    %rax,%rdi
  800bca:	b8 00 00 00 00       	mov    $0x0,%eax
  800bcf:	49 b8 82 0e 80 00 00 	movabs $0x800e82,%r8
  800bd6:	00 00 00 
  800bd9:	41 ff d0             	callq  *%r8
  800bdc:	e9 92 02 00 00       	jmpq   800e73 <vprintfmt+0x509>
  800be1:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800be4:	83 f8 30             	cmp    $0x30,%eax
  800be7:	73 17                	jae    800c00 <vprintfmt+0x296>
  800be9:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800bed:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800bf0:	89 c0                	mov    %eax,%eax
  800bf2:	48 01 d0             	add    %rdx,%rax
  800bf5:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800bf8:	83 c2 08             	add    $0x8,%edx
  800bfb:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800bfe:	eb 0f                	jmp    800c0f <vprintfmt+0x2a5>
  800c00:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800c04:	48 89 d0             	mov    %rdx,%rax
  800c07:	48 83 c2 08          	add    $0x8,%rdx
  800c0b:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800c0f:	4c 8b 20             	mov    (%rax),%r12
  800c12:	4d 85 e4             	test   %r12,%r12
  800c15:	75 0a                	jne    800c21 <vprintfmt+0x2b7>
  800c17:	49 bc 4d 48 80 00 00 	movabs $0x80484d,%r12
  800c1e:	00 00 00 
  800c21:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800c25:	7e 3f                	jle    800c66 <vprintfmt+0x2fc>
  800c27:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  800c2b:	74 39                	je     800c66 <vprintfmt+0x2fc>
  800c2d:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800c30:	48 98                	cltq   
  800c32:	48 89 c6             	mov    %rax,%rsi
  800c35:	4c 89 e7             	mov    %r12,%rdi
  800c38:	48 b8 2e 11 80 00 00 	movabs $0x80112e,%rax
  800c3f:	00 00 00 
  800c42:	ff d0                	callq  *%rax
  800c44:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800c47:	eb 17                	jmp    800c60 <vprintfmt+0x2f6>
  800c49:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800c4d:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800c51:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c55:	48 89 ce             	mov    %rcx,%rsi
  800c58:	89 d7                	mov    %edx,%edi
  800c5a:	ff d0                	callq  *%rax
  800c5c:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800c60:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800c64:	7f e3                	jg     800c49 <vprintfmt+0x2df>
  800c66:	eb 37                	jmp    800c9f <vprintfmt+0x335>
  800c68:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  800c6c:	74 1e                	je     800c8c <vprintfmt+0x322>
  800c6e:	83 fb 1f             	cmp    $0x1f,%ebx
  800c71:	7e 05                	jle    800c78 <vprintfmt+0x30e>
  800c73:	83 fb 7e             	cmp    $0x7e,%ebx
  800c76:	7e 14                	jle    800c8c <vprintfmt+0x322>
  800c78:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c7c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c80:	48 89 d6             	mov    %rdx,%rsi
  800c83:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800c88:	ff d0                	callq  *%rax
  800c8a:	eb 0f                	jmp    800c9b <vprintfmt+0x331>
  800c8c:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c90:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c94:	48 89 d6             	mov    %rdx,%rsi
  800c97:	89 df                	mov    %ebx,%edi
  800c99:	ff d0                	callq  *%rax
  800c9b:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800c9f:	4c 89 e0             	mov    %r12,%rax
  800ca2:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800ca6:	0f b6 00             	movzbl (%rax),%eax
  800ca9:	0f be d8             	movsbl %al,%ebx
  800cac:	85 db                	test   %ebx,%ebx
  800cae:	74 10                	je     800cc0 <vprintfmt+0x356>
  800cb0:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800cb4:	78 b2                	js     800c68 <vprintfmt+0x2fe>
  800cb6:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800cba:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800cbe:	79 a8                	jns    800c68 <vprintfmt+0x2fe>
  800cc0:	eb 16                	jmp    800cd8 <vprintfmt+0x36e>
  800cc2:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800cc6:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800cca:	48 89 d6             	mov    %rdx,%rsi
  800ccd:	bf 20 00 00 00       	mov    $0x20,%edi
  800cd2:	ff d0                	callq  *%rax
  800cd4:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800cd8:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800cdc:	7f e4                	jg     800cc2 <vprintfmt+0x358>
  800cde:	e9 90 01 00 00       	jmpq   800e73 <vprintfmt+0x509>
  800ce3:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800ce7:	be 03 00 00 00       	mov    $0x3,%esi
  800cec:	48 89 c7             	mov    %rax,%rdi
  800cef:	48 b8 5a 08 80 00 00 	movabs $0x80085a,%rax
  800cf6:	00 00 00 
  800cf9:	ff d0                	callq  *%rax
  800cfb:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800cff:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800d03:	48 85 c0             	test   %rax,%rax
  800d06:	79 1d                	jns    800d25 <vprintfmt+0x3bb>
  800d08:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d0c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d10:	48 89 d6             	mov    %rdx,%rsi
  800d13:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800d18:	ff d0                	callq  *%rax
  800d1a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800d1e:	48 f7 d8             	neg    %rax
  800d21:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800d25:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800d2c:	e9 d5 00 00 00       	jmpq   800e06 <vprintfmt+0x49c>
  800d31:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800d35:	be 03 00 00 00       	mov    $0x3,%esi
  800d3a:	48 89 c7             	mov    %rax,%rdi
  800d3d:	48 b8 4a 07 80 00 00 	movabs $0x80074a,%rax
  800d44:	00 00 00 
  800d47:	ff d0                	callq  *%rax
  800d49:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800d4d:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800d54:	e9 ad 00 00 00       	jmpq   800e06 <vprintfmt+0x49c>
  800d59:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800d5d:	be 03 00 00 00       	mov    $0x3,%esi
  800d62:	48 89 c7             	mov    %rax,%rdi
  800d65:	48 b8 4a 07 80 00 00 	movabs $0x80074a,%rax
  800d6c:	00 00 00 
  800d6f:	ff d0                	callq  *%rax
  800d71:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800d75:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800d7c:	e9 85 00 00 00       	jmpq   800e06 <vprintfmt+0x49c>
  800d81:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d85:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d89:	48 89 d6             	mov    %rdx,%rsi
  800d8c:	bf 30 00 00 00       	mov    $0x30,%edi
  800d91:	ff d0                	callq  *%rax
  800d93:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d97:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d9b:	48 89 d6             	mov    %rdx,%rsi
  800d9e:	bf 78 00 00 00       	mov    $0x78,%edi
  800da3:	ff d0                	callq  *%rax
  800da5:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800da8:	83 f8 30             	cmp    $0x30,%eax
  800dab:	73 17                	jae    800dc4 <vprintfmt+0x45a>
  800dad:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800db1:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800db4:	89 c0                	mov    %eax,%eax
  800db6:	48 01 d0             	add    %rdx,%rax
  800db9:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800dbc:	83 c2 08             	add    $0x8,%edx
  800dbf:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800dc2:	eb 0f                	jmp    800dd3 <vprintfmt+0x469>
  800dc4:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800dc8:	48 89 d0             	mov    %rdx,%rax
  800dcb:	48 83 c2 08          	add    $0x8,%rdx
  800dcf:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800dd3:	48 8b 00             	mov    (%rax),%rax
  800dd6:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800dda:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800de1:	eb 23                	jmp    800e06 <vprintfmt+0x49c>
  800de3:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800de7:	be 03 00 00 00       	mov    $0x3,%esi
  800dec:	48 89 c7             	mov    %rax,%rdi
  800def:	48 b8 4a 07 80 00 00 	movabs $0x80074a,%rax
  800df6:	00 00 00 
  800df9:	ff d0                	callq  *%rax
  800dfb:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800dff:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800e06:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  800e0b:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800e0e:	8b 7d dc             	mov    -0x24(%rbp),%edi
  800e11:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800e15:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800e19:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e1d:	45 89 c1             	mov    %r8d,%r9d
  800e20:	41 89 f8             	mov    %edi,%r8d
  800e23:	48 89 c7             	mov    %rax,%rdi
  800e26:	48 b8 8f 06 80 00 00 	movabs $0x80068f,%rax
  800e2d:	00 00 00 
  800e30:	ff d0                	callq  *%rax
  800e32:	eb 3f                	jmp    800e73 <vprintfmt+0x509>
  800e34:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800e38:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e3c:	48 89 d6             	mov    %rdx,%rsi
  800e3f:	89 df                	mov    %ebx,%edi
  800e41:	ff d0                	callq  *%rax
  800e43:	eb 2e                	jmp    800e73 <vprintfmt+0x509>
  800e45:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800e49:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e4d:	48 89 d6             	mov    %rdx,%rsi
  800e50:	bf 25 00 00 00       	mov    $0x25,%edi
  800e55:	ff d0                	callq  *%rax
  800e57:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800e5c:	eb 05                	jmp    800e63 <vprintfmt+0x4f9>
  800e5e:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800e63:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800e67:	48 83 e8 01          	sub    $0x1,%rax
  800e6b:	0f b6 00             	movzbl (%rax),%eax
  800e6e:	3c 25                	cmp    $0x25,%al
  800e70:	75 ec                	jne    800e5e <vprintfmt+0x4f4>
  800e72:	90                   	nop
  800e73:	90                   	nop
  800e74:	e9 43 fb ff ff       	jmpq   8009bc <vprintfmt+0x52>
  800e79:	48 83 c4 60          	add    $0x60,%rsp
  800e7d:	5b                   	pop    %rbx
  800e7e:	41 5c                	pop    %r12
  800e80:	5d                   	pop    %rbp
  800e81:	c3                   	retq   

0000000000800e82 <printfmt>:
  800e82:	55                   	push   %rbp
  800e83:	48 89 e5             	mov    %rsp,%rbp
  800e86:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  800e8d:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  800e94:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  800e9b:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800ea2:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800ea9:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800eb0:	84 c0                	test   %al,%al
  800eb2:	74 20                	je     800ed4 <printfmt+0x52>
  800eb4:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800eb8:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800ebc:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800ec0:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800ec4:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800ec8:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800ecc:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800ed0:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800ed4:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  800edb:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  800ee2:	00 00 00 
  800ee5:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  800eec:	00 00 00 
  800eef:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800ef3:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800efa:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800f01:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  800f08:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  800f0f:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800f16:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  800f1d:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  800f24:	48 89 c7             	mov    %rax,%rdi
  800f27:	48 b8 6a 09 80 00 00 	movabs $0x80096a,%rax
  800f2e:	00 00 00 
  800f31:	ff d0                	callq  *%rax
  800f33:	c9                   	leaveq 
  800f34:	c3                   	retq   

0000000000800f35 <sprintputch>:
  800f35:	55                   	push   %rbp
  800f36:	48 89 e5             	mov    %rsp,%rbp
  800f39:	48 83 ec 10          	sub    $0x10,%rsp
  800f3d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800f40:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800f44:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800f48:	8b 40 10             	mov    0x10(%rax),%eax
  800f4b:	8d 50 01             	lea    0x1(%rax),%edx
  800f4e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800f52:	89 50 10             	mov    %edx,0x10(%rax)
  800f55:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800f59:	48 8b 10             	mov    (%rax),%rdx
  800f5c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800f60:	48 8b 40 08          	mov    0x8(%rax),%rax
  800f64:	48 39 c2             	cmp    %rax,%rdx
  800f67:	73 17                	jae    800f80 <sprintputch+0x4b>
  800f69:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800f6d:	48 8b 00             	mov    (%rax),%rax
  800f70:	48 8d 48 01          	lea    0x1(%rax),%rcx
  800f74:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800f78:	48 89 0a             	mov    %rcx,(%rdx)
  800f7b:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800f7e:	88 10                	mov    %dl,(%rax)
  800f80:	c9                   	leaveq 
  800f81:	c3                   	retq   

0000000000800f82 <vsnprintf>:
  800f82:	55                   	push   %rbp
  800f83:	48 89 e5             	mov    %rsp,%rbp
  800f86:	48 83 ec 50          	sub    $0x50,%rsp
  800f8a:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  800f8e:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  800f91:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  800f95:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  800f99:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  800f9d:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  800fa1:	48 8b 0a             	mov    (%rdx),%rcx
  800fa4:	48 89 08             	mov    %rcx,(%rax)
  800fa7:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800fab:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800faf:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800fb3:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800fb7:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800fbb:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  800fbf:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  800fc2:	48 98                	cltq   
  800fc4:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  800fc8:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800fcc:	48 01 d0             	add    %rdx,%rax
  800fcf:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  800fd3:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800fda:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  800fdf:	74 06                	je     800fe7 <vsnprintf+0x65>
  800fe1:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  800fe5:	7f 07                	jg     800fee <vsnprintf+0x6c>
  800fe7:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800fec:	eb 2f                	jmp    80101d <vsnprintf+0x9b>
  800fee:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  800ff2:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  800ff6:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  800ffa:	48 89 c6             	mov    %rax,%rsi
  800ffd:	48 bf 35 0f 80 00 00 	movabs $0x800f35,%rdi
  801004:	00 00 00 
  801007:	48 b8 6a 09 80 00 00 	movabs $0x80096a,%rax
  80100e:	00 00 00 
  801011:	ff d0                	callq  *%rax
  801013:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801017:	c6 00 00             	movb   $0x0,(%rax)
  80101a:	8b 45 e0             	mov    -0x20(%rbp),%eax
  80101d:	c9                   	leaveq 
  80101e:	c3                   	retq   

000000000080101f <snprintf>:
  80101f:	55                   	push   %rbp
  801020:	48 89 e5             	mov    %rsp,%rbp
  801023:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  80102a:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  801031:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  801037:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  80103e:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  801045:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  80104c:	84 c0                	test   %al,%al
  80104e:	74 20                	je     801070 <snprintf+0x51>
  801050:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  801054:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  801058:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  80105c:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  801060:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  801064:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  801068:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  80106c:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  801070:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  801077:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  80107e:	00 00 00 
  801081:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  801088:	00 00 00 
  80108b:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80108f:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  801096:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  80109d:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8010a4:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  8010ab:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8010b2:	48 8b 0a             	mov    (%rdx),%rcx
  8010b5:	48 89 08             	mov    %rcx,(%rax)
  8010b8:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8010bc:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8010c0:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8010c4:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8010c8:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  8010cf:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  8010d6:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  8010dc:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8010e3:	48 89 c7             	mov    %rax,%rdi
  8010e6:	48 b8 82 0f 80 00 00 	movabs $0x800f82,%rax
  8010ed:	00 00 00 
  8010f0:	ff d0                	callq  *%rax
  8010f2:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  8010f8:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  8010fe:	c9                   	leaveq 
  8010ff:	c3                   	retq   

0000000000801100 <strlen>:
  801100:	55                   	push   %rbp
  801101:	48 89 e5             	mov    %rsp,%rbp
  801104:	48 83 ec 18          	sub    $0x18,%rsp
  801108:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80110c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801113:	eb 09                	jmp    80111e <strlen+0x1e>
  801115:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801119:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80111e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801122:	0f b6 00             	movzbl (%rax),%eax
  801125:	84 c0                	test   %al,%al
  801127:	75 ec                	jne    801115 <strlen+0x15>
  801129:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80112c:	c9                   	leaveq 
  80112d:	c3                   	retq   

000000000080112e <strnlen>:
  80112e:	55                   	push   %rbp
  80112f:	48 89 e5             	mov    %rsp,%rbp
  801132:	48 83 ec 20          	sub    $0x20,%rsp
  801136:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80113a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80113e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801145:	eb 0e                	jmp    801155 <strnlen+0x27>
  801147:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80114b:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801150:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  801155:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80115a:	74 0b                	je     801167 <strnlen+0x39>
  80115c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801160:	0f b6 00             	movzbl (%rax),%eax
  801163:	84 c0                	test   %al,%al
  801165:	75 e0                	jne    801147 <strnlen+0x19>
  801167:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80116a:	c9                   	leaveq 
  80116b:	c3                   	retq   

000000000080116c <strcpy>:
  80116c:	55                   	push   %rbp
  80116d:	48 89 e5             	mov    %rsp,%rbp
  801170:	48 83 ec 20          	sub    $0x20,%rsp
  801174:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801178:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80117c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801180:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801184:	90                   	nop
  801185:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801189:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80118d:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801191:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801195:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801199:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  80119d:	0f b6 12             	movzbl (%rdx),%edx
  8011a0:	88 10                	mov    %dl,(%rax)
  8011a2:	0f b6 00             	movzbl (%rax),%eax
  8011a5:	84 c0                	test   %al,%al
  8011a7:	75 dc                	jne    801185 <strcpy+0x19>
  8011a9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011ad:	c9                   	leaveq 
  8011ae:	c3                   	retq   

00000000008011af <strcat>:
  8011af:	55                   	push   %rbp
  8011b0:	48 89 e5             	mov    %rsp,%rbp
  8011b3:	48 83 ec 20          	sub    $0x20,%rsp
  8011b7:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8011bb:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8011bf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011c3:	48 89 c7             	mov    %rax,%rdi
  8011c6:	48 b8 00 11 80 00 00 	movabs $0x801100,%rax
  8011cd:	00 00 00 
  8011d0:	ff d0                	callq  *%rax
  8011d2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8011d5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8011d8:	48 63 d0             	movslq %eax,%rdx
  8011db:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011df:	48 01 c2             	add    %rax,%rdx
  8011e2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8011e6:	48 89 c6             	mov    %rax,%rsi
  8011e9:	48 89 d7             	mov    %rdx,%rdi
  8011ec:	48 b8 6c 11 80 00 00 	movabs $0x80116c,%rax
  8011f3:	00 00 00 
  8011f6:	ff d0                	callq  *%rax
  8011f8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011fc:	c9                   	leaveq 
  8011fd:	c3                   	retq   

00000000008011fe <strncpy>:
  8011fe:	55                   	push   %rbp
  8011ff:	48 89 e5             	mov    %rsp,%rbp
  801202:	48 83 ec 28          	sub    $0x28,%rsp
  801206:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80120a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80120e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801212:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801216:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80121a:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  801221:	00 
  801222:	eb 2a                	jmp    80124e <strncpy+0x50>
  801224:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801228:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80122c:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801230:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801234:	0f b6 12             	movzbl (%rdx),%edx
  801237:	88 10                	mov    %dl,(%rax)
  801239:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80123d:	0f b6 00             	movzbl (%rax),%eax
  801240:	84 c0                	test   %al,%al
  801242:	74 05                	je     801249 <strncpy+0x4b>
  801244:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  801249:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80124e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801252:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  801256:	72 cc                	jb     801224 <strncpy+0x26>
  801258:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80125c:	c9                   	leaveq 
  80125d:	c3                   	retq   

000000000080125e <strlcpy>:
  80125e:	55                   	push   %rbp
  80125f:	48 89 e5             	mov    %rsp,%rbp
  801262:	48 83 ec 28          	sub    $0x28,%rsp
  801266:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80126a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80126e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801272:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801276:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80127a:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80127f:	74 3d                	je     8012be <strlcpy+0x60>
  801281:	eb 1d                	jmp    8012a0 <strlcpy+0x42>
  801283:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801287:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80128b:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80128f:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801293:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801297:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  80129b:	0f b6 12             	movzbl (%rdx),%edx
  80129e:	88 10                	mov    %dl,(%rax)
  8012a0:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  8012a5:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8012aa:	74 0b                	je     8012b7 <strlcpy+0x59>
  8012ac:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8012b0:	0f b6 00             	movzbl (%rax),%eax
  8012b3:	84 c0                	test   %al,%al
  8012b5:	75 cc                	jne    801283 <strlcpy+0x25>
  8012b7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012bb:	c6 00 00             	movb   $0x0,(%rax)
  8012be:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8012c2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012c6:	48 29 c2             	sub    %rax,%rdx
  8012c9:	48 89 d0             	mov    %rdx,%rax
  8012cc:	c9                   	leaveq 
  8012cd:	c3                   	retq   

00000000008012ce <strcmp>:
  8012ce:	55                   	push   %rbp
  8012cf:	48 89 e5             	mov    %rsp,%rbp
  8012d2:	48 83 ec 10          	sub    $0x10,%rsp
  8012d6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8012da:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8012de:	eb 0a                	jmp    8012ea <strcmp+0x1c>
  8012e0:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8012e5:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8012ea:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012ee:	0f b6 00             	movzbl (%rax),%eax
  8012f1:	84 c0                	test   %al,%al
  8012f3:	74 12                	je     801307 <strcmp+0x39>
  8012f5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012f9:	0f b6 10             	movzbl (%rax),%edx
  8012fc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801300:	0f b6 00             	movzbl (%rax),%eax
  801303:	38 c2                	cmp    %al,%dl
  801305:	74 d9                	je     8012e0 <strcmp+0x12>
  801307:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80130b:	0f b6 00             	movzbl (%rax),%eax
  80130e:	0f b6 d0             	movzbl %al,%edx
  801311:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801315:	0f b6 00             	movzbl (%rax),%eax
  801318:	0f b6 c0             	movzbl %al,%eax
  80131b:	29 c2                	sub    %eax,%edx
  80131d:	89 d0                	mov    %edx,%eax
  80131f:	c9                   	leaveq 
  801320:	c3                   	retq   

0000000000801321 <strncmp>:
  801321:	55                   	push   %rbp
  801322:	48 89 e5             	mov    %rsp,%rbp
  801325:	48 83 ec 18          	sub    $0x18,%rsp
  801329:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80132d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801331:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801335:	eb 0f                	jmp    801346 <strncmp+0x25>
  801337:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  80133c:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801341:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801346:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80134b:	74 1d                	je     80136a <strncmp+0x49>
  80134d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801351:	0f b6 00             	movzbl (%rax),%eax
  801354:	84 c0                	test   %al,%al
  801356:	74 12                	je     80136a <strncmp+0x49>
  801358:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80135c:	0f b6 10             	movzbl (%rax),%edx
  80135f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801363:	0f b6 00             	movzbl (%rax),%eax
  801366:	38 c2                	cmp    %al,%dl
  801368:	74 cd                	je     801337 <strncmp+0x16>
  80136a:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80136f:	75 07                	jne    801378 <strncmp+0x57>
  801371:	b8 00 00 00 00       	mov    $0x0,%eax
  801376:	eb 18                	jmp    801390 <strncmp+0x6f>
  801378:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80137c:	0f b6 00             	movzbl (%rax),%eax
  80137f:	0f b6 d0             	movzbl %al,%edx
  801382:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801386:	0f b6 00             	movzbl (%rax),%eax
  801389:	0f b6 c0             	movzbl %al,%eax
  80138c:	29 c2                	sub    %eax,%edx
  80138e:	89 d0                	mov    %edx,%eax
  801390:	c9                   	leaveq 
  801391:	c3                   	retq   

0000000000801392 <strchr>:
  801392:	55                   	push   %rbp
  801393:	48 89 e5             	mov    %rsp,%rbp
  801396:	48 83 ec 0c          	sub    $0xc,%rsp
  80139a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80139e:	89 f0                	mov    %esi,%eax
  8013a0:	88 45 f4             	mov    %al,-0xc(%rbp)
  8013a3:	eb 17                	jmp    8013bc <strchr+0x2a>
  8013a5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013a9:	0f b6 00             	movzbl (%rax),%eax
  8013ac:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8013af:	75 06                	jne    8013b7 <strchr+0x25>
  8013b1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013b5:	eb 15                	jmp    8013cc <strchr+0x3a>
  8013b7:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8013bc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013c0:	0f b6 00             	movzbl (%rax),%eax
  8013c3:	84 c0                	test   %al,%al
  8013c5:	75 de                	jne    8013a5 <strchr+0x13>
  8013c7:	b8 00 00 00 00       	mov    $0x0,%eax
  8013cc:	c9                   	leaveq 
  8013cd:	c3                   	retq   

00000000008013ce <strfind>:
  8013ce:	55                   	push   %rbp
  8013cf:	48 89 e5             	mov    %rsp,%rbp
  8013d2:	48 83 ec 0c          	sub    $0xc,%rsp
  8013d6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8013da:	89 f0                	mov    %esi,%eax
  8013dc:	88 45 f4             	mov    %al,-0xc(%rbp)
  8013df:	eb 13                	jmp    8013f4 <strfind+0x26>
  8013e1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013e5:	0f b6 00             	movzbl (%rax),%eax
  8013e8:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8013eb:	75 02                	jne    8013ef <strfind+0x21>
  8013ed:	eb 10                	jmp    8013ff <strfind+0x31>
  8013ef:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8013f4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013f8:	0f b6 00             	movzbl (%rax),%eax
  8013fb:	84 c0                	test   %al,%al
  8013fd:	75 e2                	jne    8013e1 <strfind+0x13>
  8013ff:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801403:	c9                   	leaveq 
  801404:	c3                   	retq   

0000000000801405 <memset>:
  801405:	55                   	push   %rbp
  801406:	48 89 e5             	mov    %rsp,%rbp
  801409:	48 83 ec 18          	sub    $0x18,%rsp
  80140d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801411:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801414:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801418:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80141d:	75 06                	jne    801425 <memset+0x20>
  80141f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801423:	eb 69                	jmp    80148e <memset+0x89>
  801425:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801429:	83 e0 03             	and    $0x3,%eax
  80142c:	48 85 c0             	test   %rax,%rax
  80142f:	75 48                	jne    801479 <memset+0x74>
  801431:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801435:	83 e0 03             	and    $0x3,%eax
  801438:	48 85 c0             	test   %rax,%rax
  80143b:	75 3c                	jne    801479 <memset+0x74>
  80143d:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  801444:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801447:	c1 e0 18             	shl    $0x18,%eax
  80144a:	89 c2                	mov    %eax,%edx
  80144c:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80144f:	c1 e0 10             	shl    $0x10,%eax
  801452:	09 c2                	or     %eax,%edx
  801454:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801457:	c1 e0 08             	shl    $0x8,%eax
  80145a:	09 d0                	or     %edx,%eax
  80145c:	09 45 f4             	or     %eax,-0xc(%rbp)
  80145f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801463:	48 c1 e8 02          	shr    $0x2,%rax
  801467:	48 89 c1             	mov    %rax,%rcx
  80146a:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80146e:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801471:	48 89 d7             	mov    %rdx,%rdi
  801474:	fc                   	cld    
  801475:	f3 ab                	rep stos %eax,%es:(%rdi)
  801477:	eb 11                	jmp    80148a <memset+0x85>
  801479:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80147d:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801480:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801484:	48 89 d7             	mov    %rdx,%rdi
  801487:	fc                   	cld    
  801488:	f3 aa                	rep stos %al,%es:(%rdi)
  80148a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80148e:	c9                   	leaveq 
  80148f:	c3                   	retq   

0000000000801490 <memmove>:
  801490:	55                   	push   %rbp
  801491:	48 89 e5             	mov    %rsp,%rbp
  801494:	48 83 ec 28          	sub    $0x28,%rsp
  801498:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80149c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8014a0:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8014a4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8014a8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8014ac:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014b0:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8014b4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014b8:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8014bc:	0f 83 88 00 00 00    	jae    80154a <memmove+0xba>
  8014c2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014c6:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8014ca:	48 01 d0             	add    %rdx,%rax
  8014cd:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8014d1:	76 77                	jbe    80154a <memmove+0xba>
  8014d3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014d7:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  8014db:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014df:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  8014e3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014e7:	83 e0 03             	and    $0x3,%eax
  8014ea:	48 85 c0             	test   %rax,%rax
  8014ed:	75 3b                	jne    80152a <memmove+0x9a>
  8014ef:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014f3:	83 e0 03             	and    $0x3,%eax
  8014f6:	48 85 c0             	test   %rax,%rax
  8014f9:	75 2f                	jne    80152a <memmove+0x9a>
  8014fb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014ff:	83 e0 03             	and    $0x3,%eax
  801502:	48 85 c0             	test   %rax,%rax
  801505:	75 23                	jne    80152a <memmove+0x9a>
  801507:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80150b:	48 83 e8 04          	sub    $0x4,%rax
  80150f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801513:	48 83 ea 04          	sub    $0x4,%rdx
  801517:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  80151b:	48 c1 e9 02          	shr    $0x2,%rcx
  80151f:	48 89 c7             	mov    %rax,%rdi
  801522:	48 89 d6             	mov    %rdx,%rsi
  801525:	fd                   	std    
  801526:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801528:	eb 1d                	jmp    801547 <memmove+0xb7>
  80152a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80152e:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801532:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801536:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  80153a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80153e:	48 89 d7             	mov    %rdx,%rdi
  801541:	48 89 c1             	mov    %rax,%rcx
  801544:	fd                   	std    
  801545:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801547:	fc                   	cld    
  801548:	eb 57                	jmp    8015a1 <memmove+0x111>
  80154a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80154e:	83 e0 03             	and    $0x3,%eax
  801551:	48 85 c0             	test   %rax,%rax
  801554:	75 36                	jne    80158c <memmove+0xfc>
  801556:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80155a:	83 e0 03             	and    $0x3,%eax
  80155d:	48 85 c0             	test   %rax,%rax
  801560:	75 2a                	jne    80158c <memmove+0xfc>
  801562:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801566:	83 e0 03             	and    $0x3,%eax
  801569:	48 85 c0             	test   %rax,%rax
  80156c:	75 1e                	jne    80158c <memmove+0xfc>
  80156e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801572:	48 c1 e8 02          	shr    $0x2,%rax
  801576:	48 89 c1             	mov    %rax,%rcx
  801579:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80157d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801581:	48 89 c7             	mov    %rax,%rdi
  801584:	48 89 d6             	mov    %rdx,%rsi
  801587:	fc                   	cld    
  801588:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  80158a:	eb 15                	jmp    8015a1 <memmove+0x111>
  80158c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801590:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801594:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801598:	48 89 c7             	mov    %rax,%rdi
  80159b:	48 89 d6             	mov    %rdx,%rsi
  80159e:	fc                   	cld    
  80159f:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  8015a1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8015a5:	c9                   	leaveq 
  8015a6:	c3                   	retq   

00000000008015a7 <memcpy>:
  8015a7:	55                   	push   %rbp
  8015a8:	48 89 e5             	mov    %rsp,%rbp
  8015ab:	48 83 ec 18          	sub    $0x18,%rsp
  8015af:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8015b3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8015b7:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8015bb:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8015bf:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8015c3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015c7:	48 89 ce             	mov    %rcx,%rsi
  8015ca:	48 89 c7             	mov    %rax,%rdi
  8015cd:	48 b8 90 14 80 00 00 	movabs $0x801490,%rax
  8015d4:	00 00 00 
  8015d7:	ff d0                	callq  *%rax
  8015d9:	c9                   	leaveq 
  8015da:	c3                   	retq   

00000000008015db <memcmp>:
  8015db:	55                   	push   %rbp
  8015dc:	48 89 e5             	mov    %rsp,%rbp
  8015df:	48 83 ec 28          	sub    $0x28,%rsp
  8015e3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8015e7:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8015eb:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8015ef:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8015f3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8015f7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8015fb:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8015ff:	eb 36                	jmp    801637 <memcmp+0x5c>
  801601:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801605:	0f b6 10             	movzbl (%rax),%edx
  801608:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80160c:	0f b6 00             	movzbl (%rax),%eax
  80160f:	38 c2                	cmp    %al,%dl
  801611:	74 1a                	je     80162d <memcmp+0x52>
  801613:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801617:	0f b6 00             	movzbl (%rax),%eax
  80161a:	0f b6 d0             	movzbl %al,%edx
  80161d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801621:	0f b6 00             	movzbl (%rax),%eax
  801624:	0f b6 c0             	movzbl %al,%eax
  801627:	29 c2                	sub    %eax,%edx
  801629:	89 d0                	mov    %edx,%eax
  80162b:	eb 20                	jmp    80164d <memcmp+0x72>
  80162d:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801632:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801637:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80163b:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80163f:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801643:	48 85 c0             	test   %rax,%rax
  801646:	75 b9                	jne    801601 <memcmp+0x26>
  801648:	b8 00 00 00 00       	mov    $0x0,%eax
  80164d:	c9                   	leaveq 
  80164e:	c3                   	retq   

000000000080164f <memfind>:
  80164f:	55                   	push   %rbp
  801650:	48 89 e5             	mov    %rsp,%rbp
  801653:	48 83 ec 28          	sub    $0x28,%rsp
  801657:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80165b:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80165e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801662:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801666:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80166a:	48 01 d0             	add    %rdx,%rax
  80166d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801671:	eb 15                	jmp    801688 <memfind+0x39>
  801673:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801677:	0f b6 10             	movzbl (%rax),%edx
  80167a:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80167d:	38 c2                	cmp    %al,%dl
  80167f:	75 02                	jne    801683 <memfind+0x34>
  801681:	eb 0f                	jmp    801692 <memfind+0x43>
  801683:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801688:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80168c:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  801690:	72 e1                	jb     801673 <memfind+0x24>
  801692:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801696:	c9                   	leaveq 
  801697:	c3                   	retq   

0000000000801698 <strtol>:
  801698:	55                   	push   %rbp
  801699:	48 89 e5             	mov    %rsp,%rbp
  80169c:	48 83 ec 34          	sub    $0x34,%rsp
  8016a0:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8016a4:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8016a8:	89 55 cc             	mov    %edx,-0x34(%rbp)
  8016ab:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8016b2:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  8016b9:	00 
  8016ba:	eb 05                	jmp    8016c1 <strtol+0x29>
  8016bc:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8016c1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016c5:	0f b6 00             	movzbl (%rax),%eax
  8016c8:	3c 20                	cmp    $0x20,%al
  8016ca:	74 f0                	je     8016bc <strtol+0x24>
  8016cc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016d0:	0f b6 00             	movzbl (%rax),%eax
  8016d3:	3c 09                	cmp    $0x9,%al
  8016d5:	74 e5                	je     8016bc <strtol+0x24>
  8016d7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016db:	0f b6 00             	movzbl (%rax),%eax
  8016de:	3c 2b                	cmp    $0x2b,%al
  8016e0:	75 07                	jne    8016e9 <strtol+0x51>
  8016e2:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8016e7:	eb 17                	jmp    801700 <strtol+0x68>
  8016e9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016ed:	0f b6 00             	movzbl (%rax),%eax
  8016f0:	3c 2d                	cmp    $0x2d,%al
  8016f2:	75 0c                	jne    801700 <strtol+0x68>
  8016f4:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8016f9:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  801700:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801704:	74 06                	je     80170c <strtol+0x74>
  801706:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  80170a:	75 28                	jne    801734 <strtol+0x9c>
  80170c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801710:	0f b6 00             	movzbl (%rax),%eax
  801713:	3c 30                	cmp    $0x30,%al
  801715:	75 1d                	jne    801734 <strtol+0x9c>
  801717:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80171b:	48 83 c0 01          	add    $0x1,%rax
  80171f:	0f b6 00             	movzbl (%rax),%eax
  801722:	3c 78                	cmp    $0x78,%al
  801724:	75 0e                	jne    801734 <strtol+0x9c>
  801726:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  80172b:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  801732:	eb 2c                	jmp    801760 <strtol+0xc8>
  801734:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801738:	75 19                	jne    801753 <strtol+0xbb>
  80173a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80173e:	0f b6 00             	movzbl (%rax),%eax
  801741:	3c 30                	cmp    $0x30,%al
  801743:	75 0e                	jne    801753 <strtol+0xbb>
  801745:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80174a:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  801751:	eb 0d                	jmp    801760 <strtol+0xc8>
  801753:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801757:	75 07                	jne    801760 <strtol+0xc8>
  801759:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  801760:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801764:	0f b6 00             	movzbl (%rax),%eax
  801767:	3c 2f                	cmp    $0x2f,%al
  801769:	7e 1d                	jle    801788 <strtol+0xf0>
  80176b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80176f:	0f b6 00             	movzbl (%rax),%eax
  801772:	3c 39                	cmp    $0x39,%al
  801774:	7f 12                	jg     801788 <strtol+0xf0>
  801776:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80177a:	0f b6 00             	movzbl (%rax),%eax
  80177d:	0f be c0             	movsbl %al,%eax
  801780:	83 e8 30             	sub    $0x30,%eax
  801783:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801786:	eb 4e                	jmp    8017d6 <strtol+0x13e>
  801788:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80178c:	0f b6 00             	movzbl (%rax),%eax
  80178f:	3c 60                	cmp    $0x60,%al
  801791:	7e 1d                	jle    8017b0 <strtol+0x118>
  801793:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801797:	0f b6 00             	movzbl (%rax),%eax
  80179a:	3c 7a                	cmp    $0x7a,%al
  80179c:	7f 12                	jg     8017b0 <strtol+0x118>
  80179e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017a2:	0f b6 00             	movzbl (%rax),%eax
  8017a5:	0f be c0             	movsbl %al,%eax
  8017a8:	83 e8 57             	sub    $0x57,%eax
  8017ab:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8017ae:	eb 26                	jmp    8017d6 <strtol+0x13e>
  8017b0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017b4:	0f b6 00             	movzbl (%rax),%eax
  8017b7:	3c 40                	cmp    $0x40,%al
  8017b9:	7e 48                	jle    801803 <strtol+0x16b>
  8017bb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017bf:	0f b6 00             	movzbl (%rax),%eax
  8017c2:	3c 5a                	cmp    $0x5a,%al
  8017c4:	7f 3d                	jg     801803 <strtol+0x16b>
  8017c6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017ca:	0f b6 00             	movzbl (%rax),%eax
  8017cd:	0f be c0             	movsbl %al,%eax
  8017d0:	83 e8 37             	sub    $0x37,%eax
  8017d3:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8017d6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8017d9:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  8017dc:	7c 02                	jl     8017e0 <strtol+0x148>
  8017de:	eb 23                	jmp    801803 <strtol+0x16b>
  8017e0:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8017e5:	8b 45 cc             	mov    -0x34(%rbp),%eax
  8017e8:	48 98                	cltq   
  8017ea:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  8017ef:	48 89 c2             	mov    %rax,%rdx
  8017f2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8017f5:	48 98                	cltq   
  8017f7:	48 01 d0             	add    %rdx,%rax
  8017fa:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8017fe:	e9 5d ff ff ff       	jmpq   801760 <strtol+0xc8>
  801803:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  801808:	74 0b                	je     801815 <strtol+0x17d>
  80180a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80180e:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801812:	48 89 10             	mov    %rdx,(%rax)
  801815:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801819:	74 09                	je     801824 <strtol+0x18c>
  80181b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80181f:	48 f7 d8             	neg    %rax
  801822:	eb 04                	jmp    801828 <strtol+0x190>
  801824:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801828:	c9                   	leaveq 
  801829:	c3                   	retq   

000000000080182a <strstr>:
  80182a:	55                   	push   %rbp
  80182b:	48 89 e5             	mov    %rsp,%rbp
  80182e:	48 83 ec 30          	sub    $0x30,%rsp
  801832:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801836:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80183a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80183e:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801842:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801846:	0f b6 00             	movzbl (%rax),%eax
  801849:	88 45 ff             	mov    %al,-0x1(%rbp)
  80184c:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  801850:	75 06                	jne    801858 <strstr+0x2e>
  801852:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801856:	eb 6b                	jmp    8018c3 <strstr+0x99>
  801858:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80185c:	48 89 c7             	mov    %rax,%rdi
  80185f:	48 b8 00 11 80 00 00 	movabs $0x801100,%rax
  801866:	00 00 00 
  801869:	ff d0                	callq  *%rax
  80186b:	48 98                	cltq   
  80186d:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801871:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801875:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801879:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80187d:	0f b6 00             	movzbl (%rax),%eax
  801880:	88 45 ef             	mov    %al,-0x11(%rbp)
  801883:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  801887:	75 07                	jne    801890 <strstr+0x66>
  801889:	b8 00 00 00 00       	mov    $0x0,%eax
  80188e:	eb 33                	jmp    8018c3 <strstr+0x99>
  801890:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  801894:	3a 45 ff             	cmp    -0x1(%rbp),%al
  801897:	75 d8                	jne    801871 <strstr+0x47>
  801899:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80189d:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  8018a1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018a5:	48 89 ce             	mov    %rcx,%rsi
  8018a8:	48 89 c7             	mov    %rax,%rdi
  8018ab:	48 b8 21 13 80 00 00 	movabs $0x801321,%rax
  8018b2:	00 00 00 
  8018b5:	ff d0                	callq  *%rax
  8018b7:	85 c0                	test   %eax,%eax
  8018b9:	75 b6                	jne    801871 <strstr+0x47>
  8018bb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018bf:	48 83 e8 01          	sub    $0x1,%rax
  8018c3:	c9                   	leaveq 
  8018c4:	c3                   	retq   

00000000008018c5 <syscall>:
  8018c5:	55                   	push   %rbp
  8018c6:	48 89 e5             	mov    %rsp,%rbp
  8018c9:	53                   	push   %rbx
  8018ca:	48 83 ec 48          	sub    $0x48,%rsp
  8018ce:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8018d1:	89 75 d8             	mov    %esi,-0x28(%rbp)
  8018d4:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  8018d8:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  8018dc:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  8018e0:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  8018e4:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8018e7:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  8018eb:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  8018ef:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  8018f3:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  8018f7:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  8018fb:	4c 89 c3             	mov    %r8,%rbx
  8018fe:	cd 30                	int    $0x30
  801900:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801904:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801908:	74 3e                	je     801948 <syscall+0x83>
  80190a:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80190f:	7e 37                	jle    801948 <syscall+0x83>
  801911:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801915:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801918:	49 89 d0             	mov    %rdx,%r8
  80191b:	89 c1                	mov    %eax,%ecx
  80191d:	48 ba 08 4b 80 00 00 	movabs $0x804b08,%rdx
  801924:	00 00 00 
  801927:	be 24 00 00 00       	mov    $0x24,%esi
  80192c:	48 bf 25 4b 80 00 00 	movabs $0x804b25,%rdi
  801933:	00 00 00 
  801936:	b8 00 00 00 00       	mov    $0x0,%eax
  80193b:	49 b9 7e 03 80 00 00 	movabs $0x80037e,%r9
  801942:	00 00 00 
  801945:	41 ff d1             	callq  *%r9
  801948:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80194c:	48 83 c4 48          	add    $0x48,%rsp
  801950:	5b                   	pop    %rbx
  801951:	5d                   	pop    %rbp
  801952:	c3                   	retq   

0000000000801953 <sys_cputs>:
  801953:	55                   	push   %rbp
  801954:	48 89 e5             	mov    %rsp,%rbp
  801957:	48 83 ec 20          	sub    $0x20,%rsp
  80195b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80195f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801963:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801967:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80196b:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801972:	00 
  801973:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801979:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80197f:	48 89 d1             	mov    %rdx,%rcx
  801982:	48 89 c2             	mov    %rax,%rdx
  801985:	be 00 00 00 00       	mov    $0x0,%esi
  80198a:	bf 00 00 00 00       	mov    $0x0,%edi
  80198f:	48 b8 c5 18 80 00 00 	movabs $0x8018c5,%rax
  801996:	00 00 00 
  801999:	ff d0                	callq  *%rax
  80199b:	c9                   	leaveq 
  80199c:	c3                   	retq   

000000000080199d <sys_cgetc>:
  80199d:	55                   	push   %rbp
  80199e:	48 89 e5             	mov    %rsp,%rbp
  8019a1:	48 83 ec 10          	sub    $0x10,%rsp
  8019a5:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8019ac:	00 
  8019ad:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8019b3:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8019b9:	b9 00 00 00 00       	mov    $0x0,%ecx
  8019be:	ba 00 00 00 00       	mov    $0x0,%edx
  8019c3:	be 00 00 00 00       	mov    $0x0,%esi
  8019c8:	bf 01 00 00 00       	mov    $0x1,%edi
  8019cd:	48 b8 c5 18 80 00 00 	movabs $0x8018c5,%rax
  8019d4:	00 00 00 
  8019d7:	ff d0                	callq  *%rax
  8019d9:	c9                   	leaveq 
  8019da:	c3                   	retq   

00000000008019db <sys_env_destroy>:
  8019db:	55                   	push   %rbp
  8019dc:	48 89 e5             	mov    %rsp,%rbp
  8019df:	48 83 ec 10          	sub    $0x10,%rsp
  8019e3:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8019e6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8019e9:	48 98                	cltq   
  8019eb:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8019f2:	00 
  8019f3:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8019f9:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8019ff:	b9 00 00 00 00       	mov    $0x0,%ecx
  801a04:	48 89 c2             	mov    %rax,%rdx
  801a07:	be 01 00 00 00       	mov    $0x1,%esi
  801a0c:	bf 03 00 00 00       	mov    $0x3,%edi
  801a11:	48 b8 c5 18 80 00 00 	movabs $0x8018c5,%rax
  801a18:	00 00 00 
  801a1b:	ff d0                	callq  *%rax
  801a1d:	c9                   	leaveq 
  801a1e:	c3                   	retq   

0000000000801a1f <sys_getenvid>:
  801a1f:	55                   	push   %rbp
  801a20:	48 89 e5             	mov    %rsp,%rbp
  801a23:	48 83 ec 10          	sub    $0x10,%rsp
  801a27:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801a2e:	00 
  801a2f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a35:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a3b:	b9 00 00 00 00       	mov    $0x0,%ecx
  801a40:	ba 00 00 00 00       	mov    $0x0,%edx
  801a45:	be 00 00 00 00       	mov    $0x0,%esi
  801a4a:	bf 02 00 00 00       	mov    $0x2,%edi
  801a4f:	48 b8 c5 18 80 00 00 	movabs $0x8018c5,%rax
  801a56:	00 00 00 
  801a59:	ff d0                	callq  *%rax
  801a5b:	c9                   	leaveq 
  801a5c:	c3                   	retq   

0000000000801a5d <sys_yield>:
  801a5d:	55                   	push   %rbp
  801a5e:	48 89 e5             	mov    %rsp,%rbp
  801a61:	48 83 ec 10          	sub    $0x10,%rsp
  801a65:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801a6c:	00 
  801a6d:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a73:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a79:	b9 00 00 00 00       	mov    $0x0,%ecx
  801a7e:	ba 00 00 00 00       	mov    $0x0,%edx
  801a83:	be 00 00 00 00       	mov    $0x0,%esi
  801a88:	bf 0b 00 00 00       	mov    $0xb,%edi
  801a8d:	48 b8 c5 18 80 00 00 	movabs $0x8018c5,%rax
  801a94:	00 00 00 
  801a97:	ff d0                	callq  *%rax
  801a99:	c9                   	leaveq 
  801a9a:	c3                   	retq   

0000000000801a9b <sys_page_alloc>:
  801a9b:	55                   	push   %rbp
  801a9c:	48 89 e5             	mov    %rsp,%rbp
  801a9f:	48 83 ec 20          	sub    $0x20,%rsp
  801aa3:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801aa6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801aaa:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801aad:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801ab0:	48 63 c8             	movslq %eax,%rcx
  801ab3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801ab7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801aba:	48 98                	cltq   
  801abc:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801ac3:	00 
  801ac4:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801aca:	49 89 c8             	mov    %rcx,%r8
  801acd:	48 89 d1             	mov    %rdx,%rcx
  801ad0:	48 89 c2             	mov    %rax,%rdx
  801ad3:	be 01 00 00 00       	mov    $0x1,%esi
  801ad8:	bf 04 00 00 00       	mov    $0x4,%edi
  801add:	48 b8 c5 18 80 00 00 	movabs $0x8018c5,%rax
  801ae4:	00 00 00 
  801ae7:	ff d0                	callq  *%rax
  801ae9:	c9                   	leaveq 
  801aea:	c3                   	retq   

0000000000801aeb <sys_page_map>:
  801aeb:	55                   	push   %rbp
  801aec:	48 89 e5             	mov    %rsp,%rbp
  801aef:	48 83 ec 30          	sub    $0x30,%rsp
  801af3:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801af6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801afa:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801afd:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801b01:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801b05:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801b08:	48 63 c8             	movslq %eax,%rcx
  801b0b:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801b0f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801b12:	48 63 f0             	movslq %eax,%rsi
  801b15:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b19:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b1c:	48 98                	cltq   
  801b1e:	48 89 0c 24          	mov    %rcx,(%rsp)
  801b22:	49 89 f9             	mov    %rdi,%r9
  801b25:	49 89 f0             	mov    %rsi,%r8
  801b28:	48 89 d1             	mov    %rdx,%rcx
  801b2b:	48 89 c2             	mov    %rax,%rdx
  801b2e:	be 01 00 00 00       	mov    $0x1,%esi
  801b33:	bf 05 00 00 00       	mov    $0x5,%edi
  801b38:	48 b8 c5 18 80 00 00 	movabs $0x8018c5,%rax
  801b3f:	00 00 00 
  801b42:	ff d0                	callq  *%rax
  801b44:	c9                   	leaveq 
  801b45:	c3                   	retq   

0000000000801b46 <sys_page_unmap>:
  801b46:	55                   	push   %rbp
  801b47:	48 89 e5             	mov    %rsp,%rbp
  801b4a:	48 83 ec 20          	sub    $0x20,%rsp
  801b4e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b51:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b55:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b59:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b5c:	48 98                	cltq   
  801b5e:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801b65:	00 
  801b66:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b6c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b72:	48 89 d1             	mov    %rdx,%rcx
  801b75:	48 89 c2             	mov    %rax,%rdx
  801b78:	be 01 00 00 00       	mov    $0x1,%esi
  801b7d:	bf 06 00 00 00       	mov    $0x6,%edi
  801b82:	48 b8 c5 18 80 00 00 	movabs $0x8018c5,%rax
  801b89:	00 00 00 
  801b8c:	ff d0                	callq  *%rax
  801b8e:	c9                   	leaveq 
  801b8f:	c3                   	retq   

0000000000801b90 <sys_env_set_status>:
  801b90:	55                   	push   %rbp
  801b91:	48 89 e5             	mov    %rsp,%rbp
  801b94:	48 83 ec 10          	sub    $0x10,%rsp
  801b98:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b9b:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801b9e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801ba1:	48 63 d0             	movslq %eax,%rdx
  801ba4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ba7:	48 98                	cltq   
  801ba9:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801bb0:	00 
  801bb1:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801bb7:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801bbd:	48 89 d1             	mov    %rdx,%rcx
  801bc0:	48 89 c2             	mov    %rax,%rdx
  801bc3:	be 01 00 00 00       	mov    $0x1,%esi
  801bc8:	bf 08 00 00 00       	mov    $0x8,%edi
  801bcd:	48 b8 c5 18 80 00 00 	movabs $0x8018c5,%rax
  801bd4:	00 00 00 
  801bd7:	ff d0                	callq  *%rax
  801bd9:	c9                   	leaveq 
  801bda:	c3                   	retq   

0000000000801bdb <sys_env_set_trapframe>:
  801bdb:	55                   	push   %rbp
  801bdc:	48 89 e5             	mov    %rsp,%rbp
  801bdf:	48 83 ec 20          	sub    $0x20,%rsp
  801be3:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801be6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801bea:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801bee:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801bf1:	48 98                	cltq   
  801bf3:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801bfa:	00 
  801bfb:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c01:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c07:	48 89 d1             	mov    %rdx,%rcx
  801c0a:	48 89 c2             	mov    %rax,%rdx
  801c0d:	be 01 00 00 00       	mov    $0x1,%esi
  801c12:	bf 09 00 00 00       	mov    $0x9,%edi
  801c17:	48 b8 c5 18 80 00 00 	movabs $0x8018c5,%rax
  801c1e:	00 00 00 
  801c21:	ff d0                	callq  *%rax
  801c23:	c9                   	leaveq 
  801c24:	c3                   	retq   

0000000000801c25 <sys_env_set_pgfault_upcall>:
  801c25:	55                   	push   %rbp
  801c26:	48 89 e5             	mov    %rsp,%rbp
  801c29:	48 83 ec 20          	sub    $0x20,%rsp
  801c2d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801c30:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c34:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c38:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c3b:	48 98                	cltq   
  801c3d:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c44:	00 
  801c45:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c4b:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c51:	48 89 d1             	mov    %rdx,%rcx
  801c54:	48 89 c2             	mov    %rax,%rdx
  801c57:	be 01 00 00 00       	mov    $0x1,%esi
  801c5c:	bf 0a 00 00 00       	mov    $0xa,%edi
  801c61:	48 b8 c5 18 80 00 00 	movabs $0x8018c5,%rax
  801c68:	00 00 00 
  801c6b:	ff d0                	callq  *%rax
  801c6d:	c9                   	leaveq 
  801c6e:	c3                   	retq   

0000000000801c6f <sys_ipc_try_send>:
  801c6f:	55                   	push   %rbp
  801c70:	48 89 e5             	mov    %rsp,%rbp
  801c73:	48 83 ec 20          	sub    $0x20,%rsp
  801c77:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801c7a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c7e:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801c82:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801c85:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801c88:	48 63 f0             	movslq %eax,%rsi
  801c8b:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801c8f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c92:	48 98                	cltq   
  801c94:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c98:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c9f:	00 
  801ca0:	49 89 f1             	mov    %rsi,%r9
  801ca3:	49 89 c8             	mov    %rcx,%r8
  801ca6:	48 89 d1             	mov    %rdx,%rcx
  801ca9:	48 89 c2             	mov    %rax,%rdx
  801cac:	be 00 00 00 00       	mov    $0x0,%esi
  801cb1:	bf 0c 00 00 00       	mov    $0xc,%edi
  801cb6:	48 b8 c5 18 80 00 00 	movabs $0x8018c5,%rax
  801cbd:	00 00 00 
  801cc0:	ff d0                	callq  *%rax
  801cc2:	c9                   	leaveq 
  801cc3:	c3                   	retq   

0000000000801cc4 <sys_ipc_recv>:
  801cc4:	55                   	push   %rbp
  801cc5:	48 89 e5             	mov    %rsp,%rbp
  801cc8:	48 83 ec 10          	sub    $0x10,%rsp
  801ccc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801cd0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801cd4:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801cdb:	00 
  801cdc:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ce2:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ce8:	b9 00 00 00 00       	mov    $0x0,%ecx
  801ced:	48 89 c2             	mov    %rax,%rdx
  801cf0:	be 01 00 00 00       	mov    $0x1,%esi
  801cf5:	bf 0d 00 00 00       	mov    $0xd,%edi
  801cfa:	48 b8 c5 18 80 00 00 	movabs $0x8018c5,%rax
  801d01:	00 00 00 
  801d04:	ff d0                	callq  *%rax
  801d06:	c9                   	leaveq 
  801d07:	c3                   	retq   

0000000000801d08 <sys_time_msec>:
  801d08:	55                   	push   %rbp
  801d09:	48 89 e5             	mov    %rsp,%rbp
  801d0c:	48 83 ec 10          	sub    $0x10,%rsp
  801d10:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801d17:	00 
  801d18:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d1e:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d24:	b9 00 00 00 00       	mov    $0x0,%ecx
  801d29:	ba 00 00 00 00       	mov    $0x0,%edx
  801d2e:	be 00 00 00 00       	mov    $0x0,%esi
  801d33:	bf 0e 00 00 00       	mov    $0xe,%edi
  801d38:	48 b8 c5 18 80 00 00 	movabs $0x8018c5,%rax
  801d3f:	00 00 00 
  801d42:	ff d0                	callq  *%rax
  801d44:	c9                   	leaveq 
  801d45:	c3                   	retq   

0000000000801d46 <sys_net_transmit>:
  801d46:	55                   	push   %rbp
  801d47:	48 89 e5             	mov    %rsp,%rbp
  801d4a:	48 83 ec 20          	sub    $0x20,%rsp
  801d4e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d52:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801d55:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801d58:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d5c:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801d63:	00 
  801d64:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d6a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d70:	48 89 d1             	mov    %rdx,%rcx
  801d73:	48 89 c2             	mov    %rax,%rdx
  801d76:	be 00 00 00 00       	mov    $0x0,%esi
  801d7b:	bf 0f 00 00 00       	mov    $0xf,%edi
  801d80:	48 b8 c5 18 80 00 00 	movabs $0x8018c5,%rax
  801d87:	00 00 00 
  801d8a:	ff d0                	callq  *%rax
  801d8c:	c9                   	leaveq 
  801d8d:	c3                   	retq   

0000000000801d8e <sys_net_receive>:
  801d8e:	55                   	push   %rbp
  801d8f:	48 89 e5             	mov    %rsp,%rbp
  801d92:	48 83 ec 20          	sub    $0x20,%rsp
  801d96:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d9a:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801d9d:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801da0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801da4:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801dab:	00 
  801dac:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801db2:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801db8:	48 89 d1             	mov    %rdx,%rcx
  801dbb:	48 89 c2             	mov    %rax,%rdx
  801dbe:	be 00 00 00 00       	mov    $0x0,%esi
  801dc3:	bf 10 00 00 00       	mov    $0x10,%edi
  801dc8:	48 b8 c5 18 80 00 00 	movabs $0x8018c5,%rax
  801dcf:	00 00 00 
  801dd2:	ff d0                	callq  *%rax
  801dd4:	c9                   	leaveq 
  801dd5:	c3                   	retq   

0000000000801dd6 <sys_ept_map>:
  801dd6:	55                   	push   %rbp
  801dd7:	48 89 e5             	mov    %rsp,%rbp
  801dda:	48 83 ec 30          	sub    $0x30,%rsp
  801dde:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801de1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801de5:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801de8:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801dec:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801df0:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801df3:	48 63 c8             	movslq %eax,%rcx
  801df6:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801dfa:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801dfd:	48 63 f0             	movslq %eax,%rsi
  801e00:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801e04:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e07:	48 98                	cltq   
  801e09:	48 89 0c 24          	mov    %rcx,(%rsp)
  801e0d:	49 89 f9             	mov    %rdi,%r9
  801e10:	49 89 f0             	mov    %rsi,%r8
  801e13:	48 89 d1             	mov    %rdx,%rcx
  801e16:	48 89 c2             	mov    %rax,%rdx
  801e19:	be 00 00 00 00       	mov    $0x0,%esi
  801e1e:	bf 11 00 00 00       	mov    $0x11,%edi
  801e23:	48 b8 c5 18 80 00 00 	movabs $0x8018c5,%rax
  801e2a:	00 00 00 
  801e2d:	ff d0                	callq  *%rax
  801e2f:	c9                   	leaveq 
  801e30:	c3                   	retq   

0000000000801e31 <sys_env_mkguest>:
  801e31:	55                   	push   %rbp
  801e32:	48 89 e5             	mov    %rsp,%rbp
  801e35:	48 83 ec 20          	sub    $0x20,%rsp
  801e39:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801e3d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801e41:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801e45:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e49:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801e50:	00 
  801e51:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e57:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e5d:	48 89 d1             	mov    %rdx,%rcx
  801e60:	48 89 c2             	mov    %rax,%rdx
  801e63:	be 00 00 00 00       	mov    $0x0,%esi
  801e68:	bf 12 00 00 00       	mov    $0x12,%edi
  801e6d:	48 b8 c5 18 80 00 00 	movabs $0x8018c5,%rax
  801e74:	00 00 00 
  801e77:	ff d0                	callq  *%rax
  801e79:	c9                   	leaveq 
  801e7a:	c3                   	retq   

0000000000801e7b <sys_vmx_list_vms>:
  801e7b:	55                   	push   %rbp
  801e7c:	48 89 e5             	mov    %rsp,%rbp
  801e7f:	48 83 ec 10          	sub    $0x10,%rsp
  801e83:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801e8a:	00 
  801e8b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e91:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e97:	b9 00 00 00 00       	mov    $0x0,%ecx
  801e9c:	ba 00 00 00 00       	mov    $0x0,%edx
  801ea1:	be 00 00 00 00       	mov    $0x0,%esi
  801ea6:	bf 13 00 00 00       	mov    $0x13,%edi
  801eab:	48 b8 c5 18 80 00 00 	movabs $0x8018c5,%rax
  801eb2:	00 00 00 
  801eb5:	ff d0                	callq  *%rax
  801eb7:	c9                   	leaveq 
  801eb8:	c3                   	retq   

0000000000801eb9 <sys_vmx_sel_resume>:
  801eb9:	55                   	push   %rbp
  801eba:	48 89 e5             	mov    %rsp,%rbp
  801ebd:	48 83 ec 10          	sub    $0x10,%rsp
  801ec1:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801ec4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ec7:	48 98                	cltq   
  801ec9:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801ed0:	00 
  801ed1:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ed7:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801edd:	b9 00 00 00 00       	mov    $0x0,%ecx
  801ee2:	48 89 c2             	mov    %rax,%rdx
  801ee5:	be 00 00 00 00       	mov    $0x0,%esi
  801eea:	bf 14 00 00 00       	mov    $0x14,%edi
  801eef:	48 b8 c5 18 80 00 00 	movabs $0x8018c5,%rax
  801ef6:	00 00 00 
  801ef9:	ff d0                	callq  *%rax
  801efb:	c9                   	leaveq 
  801efc:	c3                   	retq   

0000000000801efd <sys_vmx_get_vmdisk_number>:
  801efd:	55                   	push   %rbp
  801efe:	48 89 e5             	mov    %rsp,%rbp
  801f01:	48 83 ec 10          	sub    $0x10,%rsp
  801f05:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801f0c:	00 
  801f0d:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801f13:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801f19:	b9 00 00 00 00       	mov    $0x0,%ecx
  801f1e:	ba 00 00 00 00       	mov    $0x0,%edx
  801f23:	be 00 00 00 00       	mov    $0x0,%esi
  801f28:	bf 15 00 00 00       	mov    $0x15,%edi
  801f2d:	48 b8 c5 18 80 00 00 	movabs $0x8018c5,%rax
  801f34:	00 00 00 
  801f37:	ff d0                	callq  *%rax
  801f39:	c9                   	leaveq 
  801f3a:	c3                   	retq   

0000000000801f3b <sys_vmx_incr_vmdisk_number>:
  801f3b:	55                   	push   %rbp
  801f3c:	48 89 e5             	mov    %rsp,%rbp
  801f3f:	48 83 ec 10          	sub    $0x10,%rsp
  801f43:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801f4a:	00 
  801f4b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801f51:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801f57:	b9 00 00 00 00       	mov    $0x0,%ecx
  801f5c:	ba 00 00 00 00       	mov    $0x0,%edx
  801f61:	be 00 00 00 00       	mov    $0x0,%esi
  801f66:	bf 16 00 00 00       	mov    $0x16,%edi
  801f6b:	48 b8 c5 18 80 00 00 	movabs $0x8018c5,%rax
  801f72:	00 00 00 
  801f75:	ff d0                	callq  *%rax
  801f77:	c9                   	leaveq 
  801f78:	c3                   	retq   

0000000000801f79 <fd2num>:
  801f79:	55                   	push   %rbp
  801f7a:	48 89 e5             	mov    %rsp,%rbp
  801f7d:	48 83 ec 08          	sub    $0x8,%rsp
  801f81:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801f85:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801f89:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  801f90:	ff ff ff 
  801f93:	48 01 d0             	add    %rdx,%rax
  801f96:	48 c1 e8 0c          	shr    $0xc,%rax
  801f9a:	c9                   	leaveq 
  801f9b:	c3                   	retq   

0000000000801f9c <fd2data>:
  801f9c:	55                   	push   %rbp
  801f9d:	48 89 e5             	mov    %rsp,%rbp
  801fa0:	48 83 ec 08          	sub    $0x8,%rsp
  801fa4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801fa8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801fac:	48 89 c7             	mov    %rax,%rdi
  801faf:	48 b8 79 1f 80 00 00 	movabs $0x801f79,%rax
  801fb6:	00 00 00 
  801fb9:	ff d0                	callq  *%rax
  801fbb:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  801fc1:	48 c1 e0 0c          	shl    $0xc,%rax
  801fc5:	c9                   	leaveq 
  801fc6:	c3                   	retq   

0000000000801fc7 <fd_alloc>:
  801fc7:	55                   	push   %rbp
  801fc8:	48 89 e5             	mov    %rsp,%rbp
  801fcb:	48 83 ec 18          	sub    $0x18,%rsp
  801fcf:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801fd3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801fda:	eb 6b                	jmp    802047 <fd_alloc+0x80>
  801fdc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801fdf:	48 98                	cltq   
  801fe1:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801fe7:	48 c1 e0 0c          	shl    $0xc,%rax
  801feb:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801fef:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801ff3:	48 c1 e8 15          	shr    $0x15,%rax
  801ff7:	48 89 c2             	mov    %rax,%rdx
  801ffa:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802001:	01 00 00 
  802004:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802008:	83 e0 01             	and    $0x1,%eax
  80200b:	48 85 c0             	test   %rax,%rax
  80200e:	74 21                	je     802031 <fd_alloc+0x6a>
  802010:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802014:	48 c1 e8 0c          	shr    $0xc,%rax
  802018:	48 89 c2             	mov    %rax,%rdx
  80201b:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802022:	01 00 00 
  802025:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802029:	83 e0 01             	and    $0x1,%eax
  80202c:	48 85 c0             	test   %rax,%rax
  80202f:	75 12                	jne    802043 <fd_alloc+0x7c>
  802031:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802035:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802039:	48 89 10             	mov    %rdx,(%rax)
  80203c:	b8 00 00 00 00       	mov    $0x0,%eax
  802041:	eb 1a                	jmp    80205d <fd_alloc+0x96>
  802043:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802047:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  80204b:	7e 8f                	jle    801fdc <fd_alloc+0x15>
  80204d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802051:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802058:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  80205d:	c9                   	leaveq 
  80205e:	c3                   	retq   

000000000080205f <fd_lookup>:
  80205f:	55                   	push   %rbp
  802060:	48 89 e5             	mov    %rsp,%rbp
  802063:	48 83 ec 20          	sub    $0x20,%rsp
  802067:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80206a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80206e:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802072:	78 06                	js     80207a <fd_lookup+0x1b>
  802074:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  802078:	7e 07                	jle    802081 <fd_lookup+0x22>
  80207a:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80207f:	eb 6c                	jmp    8020ed <fd_lookup+0x8e>
  802081:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802084:	48 98                	cltq   
  802086:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  80208c:	48 c1 e0 0c          	shl    $0xc,%rax
  802090:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802094:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802098:	48 c1 e8 15          	shr    $0x15,%rax
  80209c:	48 89 c2             	mov    %rax,%rdx
  80209f:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8020a6:	01 00 00 
  8020a9:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8020ad:	83 e0 01             	and    $0x1,%eax
  8020b0:	48 85 c0             	test   %rax,%rax
  8020b3:	74 21                	je     8020d6 <fd_lookup+0x77>
  8020b5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8020b9:	48 c1 e8 0c          	shr    $0xc,%rax
  8020bd:	48 89 c2             	mov    %rax,%rdx
  8020c0:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8020c7:	01 00 00 
  8020ca:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8020ce:	83 e0 01             	and    $0x1,%eax
  8020d1:	48 85 c0             	test   %rax,%rax
  8020d4:	75 07                	jne    8020dd <fd_lookup+0x7e>
  8020d6:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8020db:	eb 10                	jmp    8020ed <fd_lookup+0x8e>
  8020dd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8020e1:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8020e5:	48 89 10             	mov    %rdx,(%rax)
  8020e8:	b8 00 00 00 00       	mov    $0x0,%eax
  8020ed:	c9                   	leaveq 
  8020ee:	c3                   	retq   

00000000008020ef <fd_close>:
  8020ef:	55                   	push   %rbp
  8020f0:	48 89 e5             	mov    %rsp,%rbp
  8020f3:	48 83 ec 30          	sub    $0x30,%rsp
  8020f7:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8020fb:	89 f0                	mov    %esi,%eax
  8020fd:	88 45 d4             	mov    %al,-0x2c(%rbp)
  802100:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802104:	48 89 c7             	mov    %rax,%rdi
  802107:	48 b8 79 1f 80 00 00 	movabs $0x801f79,%rax
  80210e:	00 00 00 
  802111:	ff d0                	callq  *%rax
  802113:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802117:	48 89 d6             	mov    %rdx,%rsi
  80211a:	89 c7                	mov    %eax,%edi
  80211c:	48 b8 5f 20 80 00 00 	movabs $0x80205f,%rax
  802123:	00 00 00 
  802126:	ff d0                	callq  *%rax
  802128:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80212b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80212f:	78 0a                	js     80213b <fd_close+0x4c>
  802131:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802135:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  802139:	74 12                	je     80214d <fd_close+0x5e>
  80213b:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  80213f:	74 05                	je     802146 <fd_close+0x57>
  802141:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802144:	eb 05                	jmp    80214b <fd_close+0x5c>
  802146:	b8 00 00 00 00       	mov    $0x0,%eax
  80214b:	eb 69                	jmp    8021b6 <fd_close+0xc7>
  80214d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802151:	8b 00                	mov    (%rax),%eax
  802153:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802157:	48 89 d6             	mov    %rdx,%rsi
  80215a:	89 c7                	mov    %eax,%edi
  80215c:	48 b8 b8 21 80 00 00 	movabs $0x8021b8,%rax
  802163:	00 00 00 
  802166:	ff d0                	callq  *%rax
  802168:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80216b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80216f:	78 2a                	js     80219b <fd_close+0xac>
  802171:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802175:	48 8b 40 20          	mov    0x20(%rax),%rax
  802179:	48 85 c0             	test   %rax,%rax
  80217c:	74 16                	je     802194 <fd_close+0xa5>
  80217e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802182:	48 8b 40 20          	mov    0x20(%rax),%rax
  802186:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80218a:	48 89 d7             	mov    %rdx,%rdi
  80218d:	ff d0                	callq  *%rax
  80218f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802192:	eb 07                	jmp    80219b <fd_close+0xac>
  802194:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80219b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80219f:	48 89 c6             	mov    %rax,%rsi
  8021a2:	bf 00 00 00 00       	mov    $0x0,%edi
  8021a7:	48 b8 46 1b 80 00 00 	movabs $0x801b46,%rax
  8021ae:	00 00 00 
  8021b1:	ff d0                	callq  *%rax
  8021b3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8021b6:	c9                   	leaveq 
  8021b7:	c3                   	retq   

00000000008021b8 <dev_lookup>:
  8021b8:	55                   	push   %rbp
  8021b9:	48 89 e5             	mov    %rsp,%rbp
  8021bc:	48 83 ec 20          	sub    $0x20,%rsp
  8021c0:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8021c3:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8021c7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8021ce:	eb 41                	jmp    802211 <dev_lookup+0x59>
  8021d0:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  8021d7:	00 00 00 
  8021da:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8021dd:	48 63 d2             	movslq %edx,%rdx
  8021e0:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8021e4:	8b 00                	mov    (%rax),%eax
  8021e6:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  8021e9:	75 22                	jne    80220d <dev_lookup+0x55>
  8021eb:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  8021f2:	00 00 00 
  8021f5:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8021f8:	48 63 d2             	movslq %edx,%rdx
  8021fb:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  8021ff:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802203:	48 89 10             	mov    %rdx,(%rax)
  802206:	b8 00 00 00 00       	mov    $0x0,%eax
  80220b:	eb 60                	jmp    80226d <dev_lookup+0xb5>
  80220d:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802211:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  802218:	00 00 00 
  80221b:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80221e:	48 63 d2             	movslq %edx,%rdx
  802221:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802225:	48 85 c0             	test   %rax,%rax
  802228:	75 a6                	jne    8021d0 <dev_lookup+0x18>
  80222a:	48 b8 10 70 80 00 00 	movabs $0x807010,%rax
  802231:	00 00 00 
  802234:	48 8b 00             	mov    (%rax),%rax
  802237:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80223d:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802240:	89 c6                	mov    %eax,%esi
  802242:	48 bf 38 4b 80 00 00 	movabs $0x804b38,%rdi
  802249:	00 00 00 
  80224c:	b8 00 00 00 00       	mov    $0x0,%eax
  802251:	48 b9 b7 05 80 00 00 	movabs $0x8005b7,%rcx
  802258:	00 00 00 
  80225b:	ff d1                	callq  *%rcx
  80225d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802261:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802268:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80226d:	c9                   	leaveq 
  80226e:	c3                   	retq   

000000000080226f <close>:
  80226f:	55                   	push   %rbp
  802270:	48 89 e5             	mov    %rsp,%rbp
  802273:	48 83 ec 20          	sub    $0x20,%rsp
  802277:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80227a:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80227e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802281:	48 89 d6             	mov    %rdx,%rsi
  802284:	89 c7                	mov    %eax,%edi
  802286:	48 b8 5f 20 80 00 00 	movabs $0x80205f,%rax
  80228d:	00 00 00 
  802290:	ff d0                	callq  *%rax
  802292:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802295:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802299:	79 05                	jns    8022a0 <close+0x31>
  80229b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80229e:	eb 18                	jmp    8022b8 <close+0x49>
  8022a0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8022a4:	be 01 00 00 00       	mov    $0x1,%esi
  8022a9:	48 89 c7             	mov    %rax,%rdi
  8022ac:	48 b8 ef 20 80 00 00 	movabs $0x8020ef,%rax
  8022b3:	00 00 00 
  8022b6:	ff d0                	callq  *%rax
  8022b8:	c9                   	leaveq 
  8022b9:	c3                   	retq   

00000000008022ba <close_all>:
  8022ba:	55                   	push   %rbp
  8022bb:	48 89 e5             	mov    %rsp,%rbp
  8022be:	48 83 ec 10          	sub    $0x10,%rsp
  8022c2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8022c9:	eb 15                	jmp    8022e0 <close_all+0x26>
  8022cb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8022ce:	89 c7                	mov    %eax,%edi
  8022d0:	48 b8 6f 22 80 00 00 	movabs $0x80226f,%rax
  8022d7:	00 00 00 
  8022da:	ff d0                	callq  *%rax
  8022dc:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8022e0:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  8022e4:	7e e5                	jle    8022cb <close_all+0x11>
  8022e6:	c9                   	leaveq 
  8022e7:	c3                   	retq   

00000000008022e8 <dup>:
  8022e8:	55                   	push   %rbp
  8022e9:	48 89 e5             	mov    %rsp,%rbp
  8022ec:	48 83 ec 40          	sub    $0x40,%rsp
  8022f0:	89 7d cc             	mov    %edi,-0x34(%rbp)
  8022f3:	89 75 c8             	mov    %esi,-0x38(%rbp)
  8022f6:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  8022fa:	8b 45 cc             	mov    -0x34(%rbp),%eax
  8022fd:	48 89 d6             	mov    %rdx,%rsi
  802300:	89 c7                	mov    %eax,%edi
  802302:	48 b8 5f 20 80 00 00 	movabs $0x80205f,%rax
  802309:	00 00 00 
  80230c:	ff d0                	callq  *%rax
  80230e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802311:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802315:	79 08                	jns    80231f <dup+0x37>
  802317:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80231a:	e9 70 01 00 00       	jmpq   80248f <dup+0x1a7>
  80231f:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802322:	89 c7                	mov    %eax,%edi
  802324:	48 b8 6f 22 80 00 00 	movabs $0x80226f,%rax
  80232b:	00 00 00 
  80232e:	ff d0                	callq  *%rax
  802330:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802333:	48 98                	cltq   
  802335:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  80233b:	48 c1 e0 0c          	shl    $0xc,%rax
  80233f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802343:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802347:	48 89 c7             	mov    %rax,%rdi
  80234a:	48 b8 9c 1f 80 00 00 	movabs $0x801f9c,%rax
  802351:	00 00 00 
  802354:	ff d0                	callq  *%rax
  802356:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80235a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80235e:	48 89 c7             	mov    %rax,%rdi
  802361:	48 b8 9c 1f 80 00 00 	movabs $0x801f9c,%rax
  802368:	00 00 00 
  80236b:	ff d0                	callq  *%rax
  80236d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802371:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802375:	48 c1 e8 15          	shr    $0x15,%rax
  802379:	48 89 c2             	mov    %rax,%rdx
  80237c:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802383:	01 00 00 
  802386:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80238a:	83 e0 01             	and    $0x1,%eax
  80238d:	48 85 c0             	test   %rax,%rax
  802390:	74 73                	je     802405 <dup+0x11d>
  802392:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802396:	48 c1 e8 0c          	shr    $0xc,%rax
  80239a:	48 89 c2             	mov    %rax,%rdx
  80239d:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8023a4:	01 00 00 
  8023a7:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8023ab:	83 e0 01             	and    $0x1,%eax
  8023ae:	48 85 c0             	test   %rax,%rax
  8023b1:	74 52                	je     802405 <dup+0x11d>
  8023b3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8023b7:	48 c1 e8 0c          	shr    $0xc,%rax
  8023bb:	48 89 c2             	mov    %rax,%rdx
  8023be:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8023c5:	01 00 00 
  8023c8:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8023cc:	25 07 0e 00 00       	and    $0xe07,%eax
  8023d1:	89 c1                	mov    %eax,%ecx
  8023d3:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8023d7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8023db:	41 89 c8             	mov    %ecx,%r8d
  8023de:	48 89 d1             	mov    %rdx,%rcx
  8023e1:	ba 00 00 00 00       	mov    $0x0,%edx
  8023e6:	48 89 c6             	mov    %rax,%rsi
  8023e9:	bf 00 00 00 00       	mov    $0x0,%edi
  8023ee:	48 b8 eb 1a 80 00 00 	movabs $0x801aeb,%rax
  8023f5:	00 00 00 
  8023f8:	ff d0                	callq  *%rax
  8023fa:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8023fd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802401:	79 02                	jns    802405 <dup+0x11d>
  802403:	eb 57                	jmp    80245c <dup+0x174>
  802405:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802409:	48 c1 e8 0c          	shr    $0xc,%rax
  80240d:	48 89 c2             	mov    %rax,%rdx
  802410:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802417:	01 00 00 
  80241a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80241e:	25 07 0e 00 00       	and    $0xe07,%eax
  802423:	89 c1                	mov    %eax,%ecx
  802425:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802429:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80242d:	41 89 c8             	mov    %ecx,%r8d
  802430:	48 89 d1             	mov    %rdx,%rcx
  802433:	ba 00 00 00 00       	mov    $0x0,%edx
  802438:	48 89 c6             	mov    %rax,%rsi
  80243b:	bf 00 00 00 00       	mov    $0x0,%edi
  802440:	48 b8 eb 1a 80 00 00 	movabs $0x801aeb,%rax
  802447:	00 00 00 
  80244a:	ff d0                	callq  *%rax
  80244c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80244f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802453:	79 02                	jns    802457 <dup+0x16f>
  802455:	eb 05                	jmp    80245c <dup+0x174>
  802457:	8b 45 c8             	mov    -0x38(%rbp),%eax
  80245a:	eb 33                	jmp    80248f <dup+0x1a7>
  80245c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802460:	48 89 c6             	mov    %rax,%rsi
  802463:	bf 00 00 00 00       	mov    $0x0,%edi
  802468:	48 b8 46 1b 80 00 00 	movabs $0x801b46,%rax
  80246f:	00 00 00 
  802472:	ff d0                	callq  *%rax
  802474:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802478:	48 89 c6             	mov    %rax,%rsi
  80247b:	bf 00 00 00 00       	mov    $0x0,%edi
  802480:	48 b8 46 1b 80 00 00 	movabs $0x801b46,%rax
  802487:	00 00 00 
  80248a:	ff d0                	callq  *%rax
  80248c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80248f:	c9                   	leaveq 
  802490:	c3                   	retq   

0000000000802491 <read>:
  802491:	55                   	push   %rbp
  802492:	48 89 e5             	mov    %rsp,%rbp
  802495:	48 83 ec 40          	sub    $0x40,%rsp
  802499:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80249c:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8024a0:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8024a4:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8024a8:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8024ab:	48 89 d6             	mov    %rdx,%rsi
  8024ae:	89 c7                	mov    %eax,%edi
  8024b0:	48 b8 5f 20 80 00 00 	movabs $0x80205f,%rax
  8024b7:	00 00 00 
  8024ba:	ff d0                	callq  *%rax
  8024bc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8024bf:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8024c3:	78 24                	js     8024e9 <read+0x58>
  8024c5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8024c9:	8b 00                	mov    (%rax),%eax
  8024cb:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8024cf:	48 89 d6             	mov    %rdx,%rsi
  8024d2:	89 c7                	mov    %eax,%edi
  8024d4:	48 b8 b8 21 80 00 00 	movabs $0x8021b8,%rax
  8024db:	00 00 00 
  8024de:	ff d0                	callq  *%rax
  8024e0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8024e3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8024e7:	79 05                	jns    8024ee <read+0x5d>
  8024e9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024ec:	eb 76                	jmp    802564 <read+0xd3>
  8024ee:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8024f2:	8b 40 08             	mov    0x8(%rax),%eax
  8024f5:	83 e0 03             	and    $0x3,%eax
  8024f8:	83 f8 01             	cmp    $0x1,%eax
  8024fb:	75 3a                	jne    802537 <read+0xa6>
  8024fd:	48 b8 10 70 80 00 00 	movabs $0x807010,%rax
  802504:	00 00 00 
  802507:	48 8b 00             	mov    (%rax),%rax
  80250a:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802510:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802513:	89 c6                	mov    %eax,%esi
  802515:	48 bf 57 4b 80 00 00 	movabs $0x804b57,%rdi
  80251c:	00 00 00 
  80251f:	b8 00 00 00 00       	mov    $0x0,%eax
  802524:	48 b9 b7 05 80 00 00 	movabs $0x8005b7,%rcx
  80252b:	00 00 00 
  80252e:	ff d1                	callq  *%rcx
  802530:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802535:	eb 2d                	jmp    802564 <read+0xd3>
  802537:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80253b:	48 8b 40 10          	mov    0x10(%rax),%rax
  80253f:	48 85 c0             	test   %rax,%rax
  802542:	75 07                	jne    80254b <read+0xba>
  802544:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802549:	eb 19                	jmp    802564 <read+0xd3>
  80254b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80254f:	48 8b 40 10          	mov    0x10(%rax),%rax
  802553:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802557:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80255b:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  80255f:	48 89 cf             	mov    %rcx,%rdi
  802562:	ff d0                	callq  *%rax
  802564:	c9                   	leaveq 
  802565:	c3                   	retq   

0000000000802566 <readn>:
  802566:	55                   	push   %rbp
  802567:	48 89 e5             	mov    %rsp,%rbp
  80256a:	48 83 ec 30          	sub    $0x30,%rsp
  80256e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802571:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802575:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802579:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802580:	eb 49                	jmp    8025cb <readn+0x65>
  802582:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802585:	48 98                	cltq   
  802587:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80258b:	48 29 c2             	sub    %rax,%rdx
  80258e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802591:	48 63 c8             	movslq %eax,%rcx
  802594:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802598:	48 01 c1             	add    %rax,%rcx
  80259b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80259e:	48 89 ce             	mov    %rcx,%rsi
  8025a1:	89 c7                	mov    %eax,%edi
  8025a3:	48 b8 91 24 80 00 00 	movabs $0x802491,%rax
  8025aa:	00 00 00 
  8025ad:	ff d0                	callq  *%rax
  8025af:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8025b2:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8025b6:	79 05                	jns    8025bd <readn+0x57>
  8025b8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8025bb:	eb 1c                	jmp    8025d9 <readn+0x73>
  8025bd:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8025c1:	75 02                	jne    8025c5 <readn+0x5f>
  8025c3:	eb 11                	jmp    8025d6 <readn+0x70>
  8025c5:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8025c8:	01 45 fc             	add    %eax,-0x4(%rbp)
  8025cb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8025ce:	48 98                	cltq   
  8025d0:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8025d4:	72 ac                	jb     802582 <readn+0x1c>
  8025d6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8025d9:	c9                   	leaveq 
  8025da:	c3                   	retq   

00000000008025db <write>:
  8025db:	55                   	push   %rbp
  8025dc:	48 89 e5             	mov    %rsp,%rbp
  8025df:	48 83 ec 40          	sub    $0x40,%rsp
  8025e3:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8025e6:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8025ea:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8025ee:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8025f2:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8025f5:	48 89 d6             	mov    %rdx,%rsi
  8025f8:	89 c7                	mov    %eax,%edi
  8025fa:	48 b8 5f 20 80 00 00 	movabs $0x80205f,%rax
  802601:	00 00 00 
  802604:	ff d0                	callq  *%rax
  802606:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802609:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80260d:	78 24                	js     802633 <write+0x58>
  80260f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802613:	8b 00                	mov    (%rax),%eax
  802615:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802619:	48 89 d6             	mov    %rdx,%rsi
  80261c:	89 c7                	mov    %eax,%edi
  80261e:	48 b8 b8 21 80 00 00 	movabs $0x8021b8,%rax
  802625:	00 00 00 
  802628:	ff d0                	callq  *%rax
  80262a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80262d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802631:	79 05                	jns    802638 <write+0x5d>
  802633:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802636:	eb 75                	jmp    8026ad <write+0xd2>
  802638:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80263c:	8b 40 08             	mov    0x8(%rax),%eax
  80263f:	83 e0 03             	and    $0x3,%eax
  802642:	85 c0                	test   %eax,%eax
  802644:	75 3a                	jne    802680 <write+0xa5>
  802646:	48 b8 10 70 80 00 00 	movabs $0x807010,%rax
  80264d:	00 00 00 
  802650:	48 8b 00             	mov    (%rax),%rax
  802653:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802659:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80265c:	89 c6                	mov    %eax,%esi
  80265e:	48 bf 73 4b 80 00 00 	movabs $0x804b73,%rdi
  802665:	00 00 00 
  802668:	b8 00 00 00 00       	mov    $0x0,%eax
  80266d:	48 b9 b7 05 80 00 00 	movabs $0x8005b7,%rcx
  802674:	00 00 00 
  802677:	ff d1                	callq  *%rcx
  802679:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80267e:	eb 2d                	jmp    8026ad <write+0xd2>
  802680:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802684:	48 8b 40 18          	mov    0x18(%rax),%rax
  802688:	48 85 c0             	test   %rax,%rax
  80268b:	75 07                	jne    802694 <write+0xb9>
  80268d:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802692:	eb 19                	jmp    8026ad <write+0xd2>
  802694:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802698:	48 8b 40 18          	mov    0x18(%rax),%rax
  80269c:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8026a0:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8026a4:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  8026a8:	48 89 cf             	mov    %rcx,%rdi
  8026ab:	ff d0                	callq  *%rax
  8026ad:	c9                   	leaveq 
  8026ae:	c3                   	retq   

00000000008026af <seek>:
  8026af:	55                   	push   %rbp
  8026b0:	48 89 e5             	mov    %rsp,%rbp
  8026b3:	48 83 ec 18          	sub    $0x18,%rsp
  8026b7:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8026ba:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8026bd:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8026c1:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8026c4:	48 89 d6             	mov    %rdx,%rsi
  8026c7:	89 c7                	mov    %eax,%edi
  8026c9:	48 b8 5f 20 80 00 00 	movabs $0x80205f,%rax
  8026d0:	00 00 00 
  8026d3:	ff d0                	callq  *%rax
  8026d5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8026d8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8026dc:	79 05                	jns    8026e3 <seek+0x34>
  8026de:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8026e1:	eb 0f                	jmp    8026f2 <seek+0x43>
  8026e3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8026e7:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8026ea:	89 50 04             	mov    %edx,0x4(%rax)
  8026ed:	b8 00 00 00 00       	mov    $0x0,%eax
  8026f2:	c9                   	leaveq 
  8026f3:	c3                   	retq   

00000000008026f4 <ftruncate>:
  8026f4:	55                   	push   %rbp
  8026f5:	48 89 e5             	mov    %rsp,%rbp
  8026f8:	48 83 ec 30          	sub    $0x30,%rsp
  8026fc:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8026ff:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802702:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802706:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802709:	48 89 d6             	mov    %rdx,%rsi
  80270c:	89 c7                	mov    %eax,%edi
  80270e:	48 b8 5f 20 80 00 00 	movabs $0x80205f,%rax
  802715:	00 00 00 
  802718:	ff d0                	callq  *%rax
  80271a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80271d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802721:	78 24                	js     802747 <ftruncate+0x53>
  802723:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802727:	8b 00                	mov    (%rax),%eax
  802729:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80272d:	48 89 d6             	mov    %rdx,%rsi
  802730:	89 c7                	mov    %eax,%edi
  802732:	48 b8 b8 21 80 00 00 	movabs $0x8021b8,%rax
  802739:	00 00 00 
  80273c:	ff d0                	callq  *%rax
  80273e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802741:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802745:	79 05                	jns    80274c <ftruncate+0x58>
  802747:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80274a:	eb 72                	jmp    8027be <ftruncate+0xca>
  80274c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802750:	8b 40 08             	mov    0x8(%rax),%eax
  802753:	83 e0 03             	and    $0x3,%eax
  802756:	85 c0                	test   %eax,%eax
  802758:	75 3a                	jne    802794 <ftruncate+0xa0>
  80275a:	48 b8 10 70 80 00 00 	movabs $0x807010,%rax
  802761:	00 00 00 
  802764:	48 8b 00             	mov    (%rax),%rax
  802767:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80276d:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802770:	89 c6                	mov    %eax,%esi
  802772:	48 bf 90 4b 80 00 00 	movabs $0x804b90,%rdi
  802779:	00 00 00 
  80277c:	b8 00 00 00 00       	mov    $0x0,%eax
  802781:	48 b9 b7 05 80 00 00 	movabs $0x8005b7,%rcx
  802788:	00 00 00 
  80278b:	ff d1                	callq  *%rcx
  80278d:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802792:	eb 2a                	jmp    8027be <ftruncate+0xca>
  802794:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802798:	48 8b 40 30          	mov    0x30(%rax),%rax
  80279c:	48 85 c0             	test   %rax,%rax
  80279f:	75 07                	jne    8027a8 <ftruncate+0xb4>
  8027a1:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8027a6:	eb 16                	jmp    8027be <ftruncate+0xca>
  8027a8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8027ac:	48 8b 40 30          	mov    0x30(%rax),%rax
  8027b0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8027b4:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  8027b7:	89 ce                	mov    %ecx,%esi
  8027b9:	48 89 d7             	mov    %rdx,%rdi
  8027bc:	ff d0                	callq  *%rax
  8027be:	c9                   	leaveq 
  8027bf:	c3                   	retq   

00000000008027c0 <fstat>:
  8027c0:	55                   	push   %rbp
  8027c1:	48 89 e5             	mov    %rsp,%rbp
  8027c4:	48 83 ec 30          	sub    $0x30,%rsp
  8027c8:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8027cb:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8027cf:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8027d3:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8027d6:	48 89 d6             	mov    %rdx,%rsi
  8027d9:	89 c7                	mov    %eax,%edi
  8027db:	48 b8 5f 20 80 00 00 	movabs $0x80205f,%rax
  8027e2:	00 00 00 
  8027e5:	ff d0                	callq  *%rax
  8027e7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8027ea:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8027ee:	78 24                	js     802814 <fstat+0x54>
  8027f0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8027f4:	8b 00                	mov    (%rax),%eax
  8027f6:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8027fa:	48 89 d6             	mov    %rdx,%rsi
  8027fd:	89 c7                	mov    %eax,%edi
  8027ff:	48 b8 b8 21 80 00 00 	movabs $0x8021b8,%rax
  802806:	00 00 00 
  802809:	ff d0                	callq  *%rax
  80280b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80280e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802812:	79 05                	jns    802819 <fstat+0x59>
  802814:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802817:	eb 5e                	jmp    802877 <fstat+0xb7>
  802819:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80281d:	48 8b 40 28          	mov    0x28(%rax),%rax
  802821:	48 85 c0             	test   %rax,%rax
  802824:	75 07                	jne    80282d <fstat+0x6d>
  802826:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80282b:	eb 4a                	jmp    802877 <fstat+0xb7>
  80282d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802831:	c6 00 00             	movb   $0x0,(%rax)
  802834:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802838:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  80283f:	00 00 00 
  802842:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802846:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  80284d:	00 00 00 
  802850:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802854:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802858:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  80285f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802863:	48 8b 40 28          	mov    0x28(%rax),%rax
  802867:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80286b:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  80286f:	48 89 ce             	mov    %rcx,%rsi
  802872:	48 89 d7             	mov    %rdx,%rdi
  802875:	ff d0                	callq  *%rax
  802877:	c9                   	leaveq 
  802878:	c3                   	retq   

0000000000802879 <stat>:
  802879:	55                   	push   %rbp
  80287a:	48 89 e5             	mov    %rsp,%rbp
  80287d:	48 83 ec 20          	sub    $0x20,%rsp
  802881:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802885:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802889:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80288d:	be 00 00 00 00       	mov    $0x0,%esi
  802892:	48 89 c7             	mov    %rax,%rdi
  802895:	48 b8 67 29 80 00 00 	movabs $0x802967,%rax
  80289c:	00 00 00 
  80289f:	ff d0                	callq  *%rax
  8028a1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8028a4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8028a8:	79 05                	jns    8028af <stat+0x36>
  8028aa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8028ad:	eb 2f                	jmp    8028de <stat+0x65>
  8028af:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8028b3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8028b6:	48 89 d6             	mov    %rdx,%rsi
  8028b9:	89 c7                	mov    %eax,%edi
  8028bb:	48 b8 c0 27 80 00 00 	movabs $0x8027c0,%rax
  8028c2:	00 00 00 
  8028c5:	ff d0                	callq  *%rax
  8028c7:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8028ca:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8028cd:	89 c7                	mov    %eax,%edi
  8028cf:	48 b8 6f 22 80 00 00 	movabs $0x80226f,%rax
  8028d6:	00 00 00 
  8028d9:	ff d0                	callq  *%rax
  8028db:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8028de:	c9                   	leaveq 
  8028df:	c3                   	retq   

00000000008028e0 <fsipc>:
  8028e0:	55                   	push   %rbp
  8028e1:	48 89 e5             	mov    %rsp,%rbp
  8028e4:	48 83 ec 10          	sub    $0x10,%rsp
  8028e8:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8028eb:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8028ef:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  8028f6:	00 00 00 
  8028f9:	8b 00                	mov    (%rax),%eax
  8028fb:	85 c0                	test   %eax,%eax
  8028fd:	75 1d                	jne    80291c <fsipc+0x3c>
  8028ff:	bf 01 00 00 00       	mov    $0x1,%edi
  802904:	48 b8 87 44 80 00 00 	movabs $0x804487,%rax
  80290b:	00 00 00 
  80290e:	ff d0                	callq  *%rax
  802910:	48 ba 04 70 80 00 00 	movabs $0x807004,%rdx
  802917:	00 00 00 
  80291a:	89 02                	mov    %eax,(%rdx)
  80291c:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  802923:	00 00 00 
  802926:	8b 00                	mov    (%rax),%eax
  802928:	8b 75 fc             	mov    -0x4(%rbp),%esi
  80292b:	b9 07 00 00 00       	mov    $0x7,%ecx
  802930:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  802937:	00 00 00 
  80293a:	89 c7                	mov    %eax,%edi
  80293c:	48 b8 f1 43 80 00 00 	movabs $0x8043f1,%rax
  802943:	00 00 00 
  802946:	ff d0                	callq  *%rax
  802948:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80294c:	ba 00 00 00 00       	mov    $0x0,%edx
  802951:	48 89 c6             	mov    %rax,%rsi
  802954:	bf 00 00 00 00       	mov    $0x0,%edi
  802959:	48 b8 30 43 80 00 00 	movabs $0x804330,%rax
  802960:	00 00 00 
  802963:	ff d0                	callq  *%rax
  802965:	c9                   	leaveq 
  802966:	c3                   	retq   

0000000000802967 <open>:
  802967:	55                   	push   %rbp
  802968:	48 89 e5             	mov    %rsp,%rbp
  80296b:	48 83 ec 20          	sub    $0x20,%rsp
  80296f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802973:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  802976:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80297a:	48 89 c7             	mov    %rax,%rdi
  80297d:	48 b8 00 11 80 00 00 	movabs $0x801100,%rax
  802984:	00 00 00 
  802987:	ff d0                	callq  *%rax
  802989:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  80298e:	7e 0a                	jle    80299a <open+0x33>
  802990:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802995:	e9 a5 00 00 00       	jmpq   802a3f <open+0xd8>
  80299a:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  80299e:	48 89 c7             	mov    %rax,%rdi
  8029a1:	48 b8 c7 1f 80 00 00 	movabs $0x801fc7,%rax
  8029a8:	00 00 00 
  8029ab:	ff d0                	callq  *%rax
  8029ad:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8029b0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8029b4:	79 08                	jns    8029be <open+0x57>
  8029b6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029b9:	e9 81 00 00 00       	jmpq   802a3f <open+0xd8>
  8029be:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8029c2:	48 89 c6             	mov    %rax,%rsi
  8029c5:	48 bf 00 80 80 00 00 	movabs $0x808000,%rdi
  8029cc:	00 00 00 
  8029cf:	48 b8 6c 11 80 00 00 	movabs $0x80116c,%rax
  8029d6:	00 00 00 
  8029d9:	ff d0                	callq  *%rax
  8029db:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8029e2:	00 00 00 
  8029e5:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8029e8:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  8029ee:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8029f2:	48 89 c6             	mov    %rax,%rsi
  8029f5:	bf 01 00 00 00       	mov    $0x1,%edi
  8029fa:	48 b8 e0 28 80 00 00 	movabs $0x8028e0,%rax
  802a01:	00 00 00 
  802a04:	ff d0                	callq  *%rax
  802a06:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802a09:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802a0d:	79 1d                	jns    802a2c <open+0xc5>
  802a0f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802a13:	be 00 00 00 00       	mov    $0x0,%esi
  802a18:	48 89 c7             	mov    %rax,%rdi
  802a1b:	48 b8 ef 20 80 00 00 	movabs $0x8020ef,%rax
  802a22:	00 00 00 
  802a25:	ff d0                	callq  *%rax
  802a27:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a2a:	eb 13                	jmp    802a3f <open+0xd8>
  802a2c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802a30:	48 89 c7             	mov    %rax,%rdi
  802a33:	48 b8 79 1f 80 00 00 	movabs $0x801f79,%rax
  802a3a:	00 00 00 
  802a3d:	ff d0                	callq  *%rax
  802a3f:	c9                   	leaveq 
  802a40:	c3                   	retq   

0000000000802a41 <devfile_flush>:
  802a41:	55                   	push   %rbp
  802a42:	48 89 e5             	mov    %rsp,%rbp
  802a45:	48 83 ec 10          	sub    $0x10,%rsp
  802a49:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802a4d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802a51:	8b 50 0c             	mov    0xc(%rax),%edx
  802a54:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802a5b:	00 00 00 
  802a5e:	89 10                	mov    %edx,(%rax)
  802a60:	be 00 00 00 00       	mov    $0x0,%esi
  802a65:	bf 06 00 00 00       	mov    $0x6,%edi
  802a6a:	48 b8 e0 28 80 00 00 	movabs $0x8028e0,%rax
  802a71:	00 00 00 
  802a74:	ff d0                	callq  *%rax
  802a76:	c9                   	leaveq 
  802a77:	c3                   	retq   

0000000000802a78 <devfile_read>:
  802a78:	55                   	push   %rbp
  802a79:	48 89 e5             	mov    %rsp,%rbp
  802a7c:	48 83 ec 30          	sub    $0x30,%rsp
  802a80:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802a84:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802a88:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802a8c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802a90:	8b 50 0c             	mov    0xc(%rax),%edx
  802a93:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802a9a:	00 00 00 
  802a9d:	89 10                	mov    %edx,(%rax)
  802a9f:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802aa6:	00 00 00 
  802aa9:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802aad:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802ab1:	be 00 00 00 00       	mov    $0x0,%esi
  802ab6:	bf 03 00 00 00       	mov    $0x3,%edi
  802abb:	48 b8 e0 28 80 00 00 	movabs $0x8028e0,%rax
  802ac2:	00 00 00 
  802ac5:	ff d0                	callq  *%rax
  802ac7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802aca:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ace:	79 08                	jns    802ad8 <devfile_read+0x60>
  802ad0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ad3:	e9 a4 00 00 00       	jmpq   802b7c <devfile_read+0x104>
  802ad8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802adb:	48 98                	cltq   
  802add:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802ae1:	76 35                	jbe    802b18 <devfile_read+0xa0>
  802ae3:	48 b9 b6 4b 80 00 00 	movabs $0x804bb6,%rcx
  802aea:	00 00 00 
  802aed:	48 ba bd 4b 80 00 00 	movabs $0x804bbd,%rdx
  802af4:	00 00 00 
  802af7:	be 89 00 00 00       	mov    $0x89,%esi
  802afc:	48 bf d2 4b 80 00 00 	movabs $0x804bd2,%rdi
  802b03:	00 00 00 
  802b06:	b8 00 00 00 00       	mov    $0x0,%eax
  802b0b:	49 b8 7e 03 80 00 00 	movabs $0x80037e,%r8
  802b12:	00 00 00 
  802b15:	41 ff d0             	callq  *%r8
  802b18:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  802b1f:	7e 35                	jle    802b56 <devfile_read+0xde>
  802b21:	48 b9 e0 4b 80 00 00 	movabs $0x804be0,%rcx
  802b28:	00 00 00 
  802b2b:	48 ba bd 4b 80 00 00 	movabs $0x804bbd,%rdx
  802b32:	00 00 00 
  802b35:	be 8a 00 00 00       	mov    $0x8a,%esi
  802b3a:	48 bf d2 4b 80 00 00 	movabs $0x804bd2,%rdi
  802b41:	00 00 00 
  802b44:	b8 00 00 00 00       	mov    $0x0,%eax
  802b49:	49 b8 7e 03 80 00 00 	movabs $0x80037e,%r8
  802b50:	00 00 00 
  802b53:	41 ff d0             	callq  *%r8
  802b56:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b59:	48 63 d0             	movslq %eax,%rdx
  802b5c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802b60:	48 be 00 80 80 00 00 	movabs $0x808000,%rsi
  802b67:	00 00 00 
  802b6a:	48 89 c7             	mov    %rax,%rdi
  802b6d:	48 b8 90 14 80 00 00 	movabs $0x801490,%rax
  802b74:	00 00 00 
  802b77:	ff d0                	callq  *%rax
  802b79:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b7c:	c9                   	leaveq 
  802b7d:	c3                   	retq   

0000000000802b7e <devfile_write>:
  802b7e:	55                   	push   %rbp
  802b7f:	48 89 e5             	mov    %rsp,%rbp
  802b82:	48 83 ec 40          	sub    $0x40,%rsp
  802b86:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802b8a:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802b8e:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802b92:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  802b96:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802b9a:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  802ba1:	00 
  802ba2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ba6:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  802baa:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  802baf:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  802bb3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802bb7:	8b 50 0c             	mov    0xc(%rax),%edx
  802bba:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802bc1:	00 00 00 
  802bc4:	89 10                	mov    %edx,(%rax)
  802bc6:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802bcd:	00 00 00 
  802bd0:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802bd4:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802bd8:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802bdc:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802be0:	48 89 c6             	mov    %rax,%rsi
  802be3:	48 bf 10 80 80 00 00 	movabs $0x808010,%rdi
  802bea:	00 00 00 
  802bed:	48 b8 90 14 80 00 00 	movabs $0x801490,%rax
  802bf4:	00 00 00 
  802bf7:	ff d0                	callq  *%rax
  802bf9:	be 00 00 00 00       	mov    $0x0,%esi
  802bfe:	bf 04 00 00 00       	mov    $0x4,%edi
  802c03:	48 b8 e0 28 80 00 00 	movabs $0x8028e0,%rax
  802c0a:	00 00 00 
  802c0d:	ff d0                	callq  *%rax
  802c0f:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802c12:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802c16:	79 05                	jns    802c1d <devfile_write+0x9f>
  802c18:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802c1b:	eb 43                	jmp    802c60 <devfile_write+0xe2>
  802c1d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802c20:	48 98                	cltq   
  802c22:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  802c26:	76 35                	jbe    802c5d <devfile_write+0xdf>
  802c28:	48 b9 b6 4b 80 00 00 	movabs $0x804bb6,%rcx
  802c2f:	00 00 00 
  802c32:	48 ba bd 4b 80 00 00 	movabs $0x804bbd,%rdx
  802c39:	00 00 00 
  802c3c:	be a8 00 00 00       	mov    $0xa8,%esi
  802c41:	48 bf d2 4b 80 00 00 	movabs $0x804bd2,%rdi
  802c48:	00 00 00 
  802c4b:	b8 00 00 00 00       	mov    $0x0,%eax
  802c50:	49 b8 7e 03 80 00 00 	movabs $0x80037e,%r8
  802c57:	00 00 00 
  802c5a:	41 ff d0             	callq  *%r8
  802c5d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802c60:	c9                   	leaveq 
  802c61:	c3                   	retq   

0000000000802c62 <devfile_stat>:
  802c62:	55                   	push   %rbp
  802c63:	48 89 e5             	mov    %rsp,%rbp
  802c66:	48 83 ec 20          	sub    $0x20,%rsp
  802c6a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802c6e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802c72:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c76:	8b 50 0c             	mov    0xc(%rax),%edx
  802c79:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802c80:	00 00 00 
  802c83:	89 10                	mov    %edx,(%rax)
  802c85:	be 00 00 00 00       	mov    $0x0,%esi
  802c8a:	bf 05 00 00 00       	mov    $0x5,%edi
  802c8f:	48 b8 e0 28 80 00 00 	movabs $0x8028e0,%rax
  802c96:	00 00 00 
  802c99:	ff d0                	callq  *%rax
  802c9b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c9e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ca2:	79 05                	jns    802ca9 <devfile_stat+0x47>
  802ca4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ca7:	eb 56                	jmp    802cff <devfile_stat+0x9d>
  802ca9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802cad:	48 be 00 80 80 00 00 	movabs $0x808000,%rsi
  802cb4:	00 00 00 
  802cb7:	48 89 c7             	mov    %rax,%rdi
  802cba:	48 b8 6c 11 80 00 00 	movabs $0x80116c,%rax
  802cc1:	00 00 00 
  802cc4:	ff d0                	callq  *%rax
  802cc6:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802ccd:	00 00 00 
  802cd0:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  802cd6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802cda:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  802ce0:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802ce7:	00 00 00 
  802cea:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  802cf0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802cf4:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  802cfa:	b8 00 00 00 00       	mov    $0x0,%eax
  802cff:	c9                   	leaveq 
  802d00:	c3                   	retq   

0000000000802d01 <devfile_trunc>:
  802d01:	55                   	push   %rbp
  802d02:	48 89 e5             	mov    %rsp,%rbp
  802d05:	48 83 ec 10          	sub    $0x10,%rsp
  802d09:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802d0d:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802d10:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802d14:	8b 50 0c             	mov    0xc(%rax),%edx
  802d17:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802d1e:	00 00 00 
  802d21:	89 10                	mov    %edx,(%rax)
  802d23:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802d2a:	00 00 00 
  802d2d:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802d30:	89 50 04             	mov    %edx,0x4(%rax)
  802d33:	be 00 00 00 00       	mov    $0x0,%esi
  802d38:	bf 02 00 00 00       	mov    $0x2,%edi
  802d3d:	48 b8 e0 28 80 00 00 	movabs $0x8028e0,%rax
  802d44:	00 00 00 
  802d47:	ff d0                	callq  *%rax
  802d49:	c9                   	leaveq 
  802d4a:	c3                   	retq   

0000000000802d4b <remove>:
  802d4b:	55                   	push   %rbp
  802d4c:	48 89 e5             	mov    %rsp,%rbp
  802d4f:	48 83 ec 10          	sub    $0x10,%rsp
  802d53:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802d57:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802d5b:	48 89 c7             	mov    %rax,%rdi
  802d5e:	48 b8 00 11 80 00 00 	movabs $0x801100,%rax
  802d65:	00 00 00 
  802d68:	ff d0                	callq  *%rax
  802d6a:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802d6f:	7e 07                	jle    802d78 <remove+0x2d>
  802d71:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802d76:	eb 33                	jmp    802dab <remove+0x60>
  802d78:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802d7c:	48 89 c6             	mov    %rax,%rsi
  802d7f:	48 bf 00 80 80 00 00 	movabs $0x808000,%rdi
  802d86:	00 00 00 
  802d89:	48 b8 6c 11 80 00 00 	movabs $0x80116c,%rax
  802d90:	00 00 00 
  802d93:	ff d0                	callq  *%rax
  802d95:	be 00 00 00 00       	mov    $0x0,%esi
  802d9a:	bf 07 00 00 00       	mov    $0x7,%edi
  802d9f:	48 b8 e0 28 80 00 00 	movabs $0x8028e0,%rax
  802da6:	00 00 00 
  802da9:	ff d0                	callq  *%rax
  802dab:	c9                   	leaveq 
  802dac:	c3                   	retq   

0000000000802dad <sync>:
  802dad:	55                   	push   %rbp
  802dae:	48 89 e5             	mov    %rsp,%rbp
  802db1:	be 00 00 00 00       	mov    $0x0,%esi
  802db6:	bf 08 00 00 00       	mov    $0x8,%edi
  802dbb:	48 b8 e0 28 80 00 00 	movabs $0x8028e0,%rax
  802dc2:	00 00 00 
  802dc5:	ff d0                	callq  *%rax
  802dc7:	5d                   	pop    %rbp
  802dc8:	c3                   	retq   

0000000000802dc9 <copy>:
  802dc9:	55                   	push   %rbp
  802dca:	48 89 e5             	mov    %rsp,%rbp
  802dcd:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  802dd4:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  802ddb:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  802de2:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  802de9:	be 00 00 00 00       	mov    $0x0,%esi
  802dee:	48 89 c7             	mov    %rax,%rdi
  802df1:	48 b8 67 29 80 00 00 	movabs $0x802967,%rax
  802df8:	00 00 00 
  802dfb:	ff d0                	callq  *%rax
  802dfd:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e00:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e04:	79 28                	jns    802e2e <copy+0x65>
  802e06:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e09:	89 c6                	mov    %eax,%esi
  802e0b:	48 bf ec 4b 80 00 00 	movabs $0x804bec,%rdi
  802e12:	00 00 00 
  802e15:	b8 00 00 00 00       	mov    $0x0,%eax
  802e1a:	48 ba b7 05 80 00 00 	movabs $0x8005b7,%rdx
  802e21:	00 00 00 
  802e24:	ff d2                	callq  *%rdx
  802e26:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e29:	e9 74 01 00 00       	jmpq   802fa2 <copy+0x1d9>
  802e2e:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  802e35:	be 01 01 00 00       	mov    $0x101,%esi
  802e3a:	48 89 c7             	mov    %rax,%rdi
  802e3d:	48 b8 67 29 80 00 00 	movabs $0x802967,%rax
  802e44:	00 00 00 
  802e47:	ff d0                	callq  *%rax
  802e49:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802e4c:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802e50:	79 39                	jns    802e8b <copy+0xc2>
  802e52:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802e55:	89 c6                	mov    %eax,%esi
  802e57:	48 bf 02 4c 80 00 00 	movabs $0x804c02,%rdi
  802e5e:	00 00 00 
  802e61:	b8 00 00 00 00       	mov    $0x0,%eax
  802e66:	48 ba b7 05 80 00 00 	movabs $0x8005b7,%rdx
  802e6d:	00 00 00 
  802e70:	ff d2                	callq  *%rdx
  802e72:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e75:	89 c7                	mov    %eax,%edi
  802e77:	48 b8 6f 22 80 00 00 	movabs $0x80226f,%rax
  802e7e:	00 00 00 
  802e81:	ff d0                	callq  *%rax
  802e83:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802e86:	e9 17 01 00 00       	jmpq   802fa2 <copy+0x1d9>
  802e8b:	eb 74                	jmp    802f01 <copy+0x138>
  802e8d:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802e90:	48 63 d0             	movslq %eax,%rdx
  802e93:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802e9a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802e9d:	48 89 ce             	mov    %rcx,%rsi
  802ea0:	89 c7                	mov    %eax,%edi
  802ea2:	48 b8 db 25 80 00 00 	movabs $0x8025db,%rax
  802ea9:	00 00 00 
  802eac:	ff d0                	callq  *%rax
  802eae:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802eb1:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802eb5:	79 4a                	jns    802f01 <copy+0x138>
  802eb7:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802eba:	89 c6                	mov    %eax,%esi
  802ebc:	48 bf 1c 4c 80 00 00 	movabs $0x804c1c,%rdi
  802ec3:	00 00 00 
  802ec6:	b8 00 00 00 00       	mov    $0x0,%eax
  802ecb:	48 ba b7 05 80 00 00 	movabs $0x8005b7,%rdx
  802ed2:	00 00 00 
  802ed5:	ff d2                	callq  *%rdx
  802ed7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802eda:	89 c7                	mov    %eax,%edi
  802edc:	48 b8 6f 22 80 00 00 	movabs $0x80226f,%rax
  802ee3:	00 00 00 
  802ee6:	ff d0                	callq  *%rax
  802ee8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802eeb:	89 c7                	mov    %eax,%edi
  802eed:	48 b8 6f 22 80 00 00 	movabs $0x80226f,%rax
  802ef4:	00 00 00 
  802ef7:	ff d0                	callq  *%rax
  802ef9:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802efc:	e9 a1 00 00 00       	jmpq   802fa2 <copy+0x1d9>
  802f01:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802f08:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f0b:	ba 00 02 00 00       	mov    $0x200,%edx
  802f10:	48 89 ce             	mov    %rcx,%rsi
  802f13:	89 c7                	mov    %eax,%edi
  802f15:	48 b8 91 24 80 00 00 	movabs $0x802491,%rax
  802f1c:	00 00 00 
  802f1f:	ff d0                	callq  *%rax
  802f21:	89 45 f4             	mov    %eax,-0xc(%rbp)
  802f24:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802f28:	0f 8f 5f ff ff ff    	jg     802e8d <copy+0xc4>
  802f2e:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802f32:	79 47                	jns    802f7b <copy+0x1b2>
  802f34:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802f37:	89 c6                	mov    %eax,%esi
  802f39:	48 bf 2f 4c 80 00 00 	movabs $0x804c2f,%rdi
  802f40:	00 00 00 
  802f43:	b8 00 00 00 00       	mov    $0x0,%eax
  802f48:	48 ba b7 05 80 00 00 	movabs $0x8005b7,%rdx
  802f4f:	00 00 00 
  802f52:	ff d2                	callq  *%rdx
  802f54:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f57:	89 c7                	mov    %eax,%edi
  802f59:	48 b8 6f 22 80 00 00 	movabs $0x80226f,%rax
  802f60:	00 00 00 
  802f63:	ff d0                	callq  *%rax
  802f65:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802f68:	89 c7                	mov    %eax,%edi
  802f6a:	48 b8 6f 22 80 00 00 	movabs $0x80226f,%rax
  802f71:	00 00 00 
  802f74:	ff d0                	callq  *%rax
  802f76:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802f79:	eb 27                	jmp    802fa2 <copy+0x1d9>
  802f7b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f7e:	89 c7                	mov    %eax,%edi
  802f80:	48 b8 6f 22 80 00 00 	movabs $0x80226f,%rax
  802f87:	00 00 00 
  802f8a:	ff d0                	callq  *%rax
  802f8c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802f8f:	89 c7                	mov    %eax,%edi
  802f91:	48 b8 6f 22 80 00 00 	movabs $0x80226f,%rax
  802f98:	00 00 00 
  802f9b:	ff d0                	callq  *%rax
  802f9d:	b8 00 00 00 00       	mov    $0x0,%eax
  802fa2:	c9                   	leaveq 
  802fa3:	c3                   	retq   

0000000000802fa4 <writebuf>:
  802fa4:	55                   	push   %rbp
  802fa5:	48 89 e5             	mov    %rsp,%rbp
  802fa8:	48 83 ec 20          	sub    $0x20,%rsp
  802fac:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802fb0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802fb4:	8b 40 0c             	mov    0xc(%rax),%eax
  802fb7:	85 c0                	test   %eax,%eax
  802fb9:	7e 67                	jle    803022 <writebuf+0x7e>
  802fbb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802fbf:	8b 40 04             	mov    0x4(%rax),%eax
  802fc2:	48 63 d0             	movslq %eax,%rdx
  802fc5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802fc9:	48 8d 48 10          	lea    0x10(%rax),%rcx
  802fcd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802fd1:	8b 00                	mov    (%rax),%eax
  802fd3:	48 89 ce             	mov    %rcx,%rsi
  802fd6:	89 c7                	mov    %eax,%edi
  802fd8:	48 b8 db 25 80 00 00 	movabs $0x8025db,%rax
  802fdf:	00 00 00 
  802fe2:	ff d0                	callq  *%rax
  802fe4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802fe7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802feb:	7e 13                	jle    803000 <writebuf+0x5c>
  802fed:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ff1:	8b 50 08             	mov    0x8(%rax),%edx
  802ff4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ff7:	01 c2                	add    %eax,%edx
  802ff9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ffd:	89 50 08             	mov    %edx,0x8(%rax)
  803000:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803004:	8b 40 04             	mov    0x4(%rax),%eax
  803007:	3b 45 fc             	cmp    -0x4(%rbp),%eax
  80300a:	74 16                	je     803022 <writebuf+0x7e>
  80300c:	b8 00 00 00 00       	mov    $0x0,%eax
  803011:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803015:	0f 4e 45 fc          	cmovle -0x4(%rbp),%eax
  803019:	89 c2                	mov    %eax,%edx
  80301b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80301f:	89 50 0c             	mov    %edx,0xc(%rax)
  803022:	c9                   	leaveq 
  803023:	c3                   	retq   

0000000000803024 <putch>:
  803024:	55                   	push   %rbp
  803025:	48 89 e5             	mov    %rsp,%rbp
  803028:	48 83 ec 20          	sub    $0x20,%rsp
  80302c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80302f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803033:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803037:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80303b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80303f:	8b 40 04             	mov    0x4(%rax),%eax
  803042:	8d 48 01             	lea    0x1(%rax),%ecx
  803045:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  803049:	89 4a 04             	mov    %ecx,0x4(%rdx)
  80304c:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80304f:	89 d1                	mov    %edx,%ecx
  803051:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  803055:	48 98                	cltq   
  803057:	88 4c 02 10          	mov    %cl,0x10(%rdx,%rax,1)
  80305b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80305f:	8b 40 04             	mov    0x4(%rax),%eax
  803062:	3d 00 01 00 00       	cmp    $0x100,%eax
  803067:	75 1e                	jne    803087 <putch+0x63>
  803069:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80306d:	48 89 c7             	mov    %rax,%rdi
  803070:	48 b8 a4 2f 80 00 00 	movabs $0x802fa4,%rax
  803077:	00 00 00 
  80307a:	ff d0                	callq  *%rax
  80307c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803080:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%rax)
  803087:	c9                   	leaveq 
  803088:	c3                   	retq   

0000000000803089 <vfprintf>:
  803089:	55                   	push   %rbp
  80308a:	48 89 e5             	mov    %rsp,%rbp
  80308d:	48 81 ec 30 01 00 00 	sub    $0x130,%rsp
  803094:	89 bd ec fe ff ff    	mov    %edi,-0x114(%rbp)
  80309a:	48 89 b5 e0 fe ff ff 	mov    %rsi,-0x120(%rbp)
  8030a1:	48 89 95 d8 fe ff ff 	mov    %rdx,-0x128(%rbp)
  8030a8:	8b 85 ec fe ff ff    	mov    -0x114(%rbp),%eax
  8030ae:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%rbp)
  8030b4:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  8030bb:	00 00 00 
  8030be:	c7 85 f8 fe ff ff 00 	movl   $0x0,-0x108(%rbp)
  8030c5:	00 00 00 
  8030c8:	c7 85 fc fe ff ff 01 	movl   $0x1,-0x104(%rbp)
  8030cf:	00 00 00 
  8030d2:	48 8b 8d d8 fe ff ff 	mov    -0x128(%rbp),%rcx
  8030d9:	48 8b 95 e0 fe ff ff 	mov    -0x120(%rbp),%rdx
  8030e0:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  8030e7:	48 89 c6             	mov    %rax,%rsi
  8030ea:	48 bf 24 30 80 00 00 	movabs $0x803024,%rdi
  8030f1:	00 00 00 
  8030f4:	48 b8 6a 09 80 00 00 	movabs $0x80096a,%rax
  8030fb:	00 00 00 
  8030fe:	ff d0                	callq  *%rax
  803100:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  803106:	85 c0                	test   %eax,%eax
  803108:	7e 16                	jle    803120 <vfprintf+0x97>
  80310a:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  803111:	48 89 c7             	mov    %rax,%rdi
  803114:	48 b8 a4 2f 80 00 00 	movabs $0x802fa4,%rax
  80311b:	00 00 00 
  80311e:	ff d0                	callq  *%rax
  803120:	8b 85 f8 fe ff ff    	mov    -0x108(%rbp),%eax
  803126:	85 c0                	test   %eax,%eax
  803128:	74 08                	je     803132 <vfprintf+0xa9>
  80312a:	8b 85 f8 fe ff ff    	mov    -0x108(%rbp),%eax
  803130:	eb 06                	jmp    803138 <vfprintf+0xaf>
  803132:	8b 85 fc fe ff ff    	mov    -0x104(%rbp),%eax
  803138:	c9                   	leaveq 
  803139:	c3                   	retq   

000000000080313a <fprintf>:
  80313a:	55                   	push   %rbp
  80313b:	48 89 e5             	mov    %rsp,%rbp
  80313e:	48 81 ec e0 00 00 00 	sub    $0xe0,%rsp
  803145:	89 bd 2c ff ff ff    	mov    %edi,-0xd4(%rbp)
  80314b:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  803152:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  803159:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  803160:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  803167:	84 c0                	test   %al,%al
  803169:	74 20                	je     80318b <fprintf+0x51>
  80316b:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  80316f:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  803173:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  803177:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  80317b:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  80317f:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  803183:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  803187:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  80318b:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  803192:	c7 85 30 ff ff ff 10 	movl   $0x10,-0xd0(%rbp)
  803199:	00 00 00 
  80319c:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8031a3:	00 00 00 
  8031a6:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8031aa:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8031b1:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8031b8:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8031bf:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8031c6:	48 8b 8d 20 ff ff ff 	mov    -0xe0(%rbp),%rcx
  8031cd:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  8031d3:	48 89 ce             	mov    %rcx,%rsi
  8031d6:	89 c7                	mov    %eax,%edi
  8031d8:	48 b8 89 30 80 00 00 	movabs $0x803089,%rax
  8031df:	00 00 00 
  8031e2:	ff d0                	callq  *%rax
  8031e4:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  8031ea:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  8031f0:	c9                   	leaveq 
  8031f1:	c3                   	retq   

00000000008031f2 <printf>:
  8031f2:	55                   	push   %rbp
  8031f3:	48 89 e5             	mov    %rsp,%rbp
  8031f6:	48 81 ec e0 00 00 00 	sub    $0xe0,%rsp
  8031fd:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  803204:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  80320b:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  803212:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  803219:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  803220:	84 c0                	test   %al,%al
  803222:	74 20                	je     803244 <printf+0x52>
  803224:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  803228:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80322c:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  803230:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  803234:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  803238:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  80323c:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  803240:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  803244:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  80324b:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  803252:	00 00 00 
  803255:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  80325c:	00 00 00 
  80325f:	48 8d 45 10          	lea    0x10(%rbp),%rax
  803263:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  80326a:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  803271:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  803278:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  80327f:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  803286:	48 89 c6             	mov    %rax,%rsi
  803289:	bf 01 00 00 00       	mov    $0x1,%edi
  80328e:	48 b8 89 30 80 00 00 	movabs $0x803089,%rax
  803295:	00 00 00 
  803298:	ff d0                	callq  *%rax
  80329a:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  8032a0:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  8032a6:	c9                   	leaveq 
  8032a7:	c3                   	retq   

00000000008032a8 <fd2sockid>:
  8032a8:	55                   	push   %rbp
  8032a9:	48 89 e5             	mov    %rsp,%rbp
  8032ac:	48 83 ec 20          	sub    $0x20,%rsp
  8032b0:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8032b3:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8032b7:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8032ba:	48 89 d6             	mov    %rdx,%rsi
  8032bd:	89 c7                	mov    %eax,%edi
  8032bf:	48 b8 5f 20 80 00 00 	movabs $0x80205f,%rax
  8032c6:	00 00 00 
  8032c9:	ff d0                	callq  *%rax
  8032cb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8032ce:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8032d2:	79 05                	jns    8032d9 <fd2sockid+0x31>
  8032d4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032d7:	eb 24                	jmp    8032fd <fd2sockid+0x55>
  8032d9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8032dd:	8b 10                	mov    (%rax),%edx
  8032df:	48 b8 a0 60 80 00 00 	movabs $0x8060a0,%rax
  8032e6:	00 00 00 
  8032e9:	8b 00                	mov    (%rax),%eax
  8032eb:	39 c2                	cmp    %eax,%edx
  8032ed:	74 07                	je     8032f6 <fd2sockid+0x4e>
  8032ef:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8032f4:	eb 07                	jmp    8032fd <fd2sockid+0x55>
  8032f6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8032fa:	8b 40 0c             	mov    0xc(%rax),%eax
  8032fd:	c9                   	leaveq 
  8032fe:	c3                   	retq   

00000000008032ff <alloc_sockfd>:
  8032ff:	55                   	push   %rbp
  803300:	48 89 e5             	mov    %rsp,%rbp
  803303:	48 83 ec 20          	sub    $0x20,%rsp
  803307:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80330a:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  80330e:	48 89 c7             	mov    %rax,%rdi
  803311:	48 b8 c7 1f 80 00 00 	movabs $0x801fc7,%rax
  803318:	00 00 00 
  80331b:	ff d0                	callq  *%rax
  80331d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803320:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803324:	78 26                	js     80334c <alloc_sockfd+0x4d>
  803326:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80332a:	ba 07 04 00 00       	mov    $0x407,%edx
  80332f:	48 89 c6             	mov    %rax,%rsi
  803332:	bf 00 00 00 00       	mov    $0x0,%edi
  803337:	48 b8 9b 1a 80 00 00 	movabs $0x801a9b,%rax
  80333e:	00 00 00 
  803341:	ff d0                	callq  *%rax
  803343:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803346:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80334a:	79 16                	jns    803362 <alloc_sockfd+0x63>
  80334c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80334f:	89 c7                	mov    %eax,%edi
  803351:	48 b8 0c 38 80 00 00 	movabs $0x80380c,%rax
  803358:	00 00 00 
  80335b:	ff d0                	callq  *%rax
  80335d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803360:	eb 3a                	jmp    80339c <alloc_sockfd+0x9d>
  803362:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803366:	48 ba a0 60 80 00 00 	movabs $0x8060a0,%rdx
  80336d:	00 00 00 
  803370:	8b 12                	mov    (%rdx),%edx
  803372:	89 10                	mov    %edx,(%rax)
  803374:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803378:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  80337f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803383:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803386:	89 50 0c             	mov    %edx,0xc(%rax)
  803389:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80338d:	48 89 c7             	mov    %rax,%rdi
  803390:	48 b8 79 1f 80 00 00 	movabs $0x801f79,%rax
  803397:	00 00 00 
  80339a:	ff d0                	callq  *%rax
  80339c:	c9                   	leaveq 
  80339d:	c3                   	retq   

000000000080339e <accept>:
  80339e:	55                   	push   %rbp
  80339f:	48 89 e5             	mov    %rsp,%rbp
  8033a2:	48 83 ec 30          	sub    $0x30,%rsp
  8033a6:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8033a9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8033ad:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8033b1:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8033b4:	89 c7                	mov    %eax,%edi
  8033b6:	48 b8 a8 32 80 00 00 	movabs $0x8032a8,%rax
  8033bd:	00 00 00 
  8033c0:	ff d0                	callq  *%rax
  8033c2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8033c5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8033c9:	79 05                	jns    8033d0 <accept+0x32>
  8033cb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033ce:	eb 3b                	jmp    80340b <accept+0x6d>
  8033d0:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8033d4:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8033d8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033db:	48 89 ce             	mov    %rcx,%rsi
  8033de:	89 c7                	mov    %eax,%edi
  8033e0:	48 b8 e9 36 80 00 00 	movabs $0x8036e9,%rax
  8033e7:	00 00 00 
  8033ea:	ff d0                	callq  *%rax
  8033ec:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8033ef:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8033f3:	79 05                	jns    8033fa <accept+0x5c>
  8033f5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033f8:	eb 11                	jmp    80340b <accept+0x6d>
  8033fa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033fd:	89 c7                	mov    %eax,%edi
  8033ff:	48 b8 ff 32 80 00 00 	movabs $0x8032ff,%rax
  803406:	00 00 00 
  803409:	ff d0                	callq  *%rax
  80340b:	c9                   	leaveq 
  80340c:	c3                   	retq   

000000000080340d <bind>:
  80340d:	55                   	push   %rbp
  80340e:	48 89 e5             	mov    %rsp,%rbp
  803411:	48 83 ec 20          	sub    $0x20,%rsp
  803415:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803418:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80341c:	89 55 e8             	mov    %edx,-0x18(%rbp)
  80341f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803422:	89 c7                	mov    %eax,%edi
  803424:	48 b8 a8 32 80 00 00 	movabs $0x8032a8,%rax
  80342b:	00 00 00 
  80342e:	ff d0                	callq  *%rax
  803430:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803433:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803437:	79 05                	jns    80343e <bind+0x31>
  803439:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80343c:	eb 1b                	jmp    803459 <bind+0x4c>
  80343e:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803441:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803445:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803448:	48 89 ce             	mov    %rcx,%rsi
  80344b:	89 c7                	mov    %eax,%edi
  80344d:	48 b8 68 37 80 00 00 	movabs $0x803768,%rax
  803454:	00 00 00 
  803457:	ff d0                	callq  *%rax
  803459:	c9                   	leaveq 
  80345a:	c3                   	retq   

000000000080345b <shutdown>:
  80345b:	55                   	push   %rbp
  80345c:	48 89 e5             	mov    %rsp,%rbp
  80345f:	48 83 ec 20          	sub    $0x20,%rsp
  803463:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803466:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803469:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80346c:	89 c7                	mov    %eax,%edi
  80346e:	48 b8 a8 32 80 00 00 	movabs $0x8032a8,%rax
  803475:	00 00 00 
  803478:	ff d0                	callq  *%rax
  80347a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80347d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803481:	79 05                	jns    803488 <shutdown+0x2d>
  803483:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803486:	eb 16                	jmp    80349e <shutdown+0x43>
  803488:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80348b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80348e:	89 d6                	mov    %edx,%esi
  803490:	89 c7                	mov    %eax,%edi
  803492:	48 b8 cc 37 80 00 00 	movabs $0x8037cc,%rax
  803499:	00 00 00 
  80349c:	ff d0                	callq  *%rax
  80349e:	c9                   	leaveq 
  80349f:	c3                   	retq   

00000000008034a0 <devsock_close>:
  8034a0:	55                   	push   %rbp
  8034a1:	48 89 e5             	mov    %rsp,%rbp
  8034a4:	48 83 ec 10          	sub    $0x10,%rsp
  8034a8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8034ac:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8034b0:	48 89 c7             	mov    %rax,%rdi
  8034b3:	48 b8 f9 44 80 00 00 	movabs $0x8044f9,%rax
  8034ba:	00 00 00 
  8034bd:	ff d0                	callq  *%rax
  8034bf:	83 f8 01             	cmp    $0x1,%eax
  8034c2:	75 17                	jne    8034db <devsock_close+0x3b>
  8034c4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8034c8:	8b 40 0c             	mov    0xc(%rax),%eax
  8034cb:	89 c7                	mov    %eax,%edi
  8034cd:	48 b8 0c 38 80 00 00 	movabs $0x80380c,%rax
  8034d4:	00 00 00 
  8034d7:	ff d0                	callq  *%rax
  8034d9:	eb 05                	jmp    8034e0 <devsock_close+0x40>
  8034db:	b8 00 00 00 00       	mov    $0x0,%eax
  8034e0:	c9                   	leaveq 
  8034e1:	c3                   	retq   

00000000008034e2 <connect>:
  8034e2:	55                   	push   %rbp
  8034e3:	48 89 e5             	mov    %rsp,%rbp
  8034e6:	48 83 ec 20          	sub    $0x20,%rsp
  8034ea:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8034ed:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8034f1:	89 55 e8             	mov    %edx,-0x18(%rbp)
  8034f4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8034f7:	89 c7                	mov    %eax,%edi
  8034f9:	48 b8 a8 32 80 00 00 	movabs $0x8032a8,%rax
  803500:	00 00 00 
  803503:	ff d0                	callq  *%rax
  803505:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803508:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80350c:	79 05                	jns    803513 <connect+0x31>
  80350e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803511:	eb 1b                	jmp    80352e <connect+0x4c>
  803513:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803516:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80351a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80351d:	48 89 ce             	mov    %rcx,%rsi
  803520:	89 c7                	mov    %eax,%edi
  803522:	48 b8 39 38 80 00 00 	movabs $0x803839,%rax
  803529:	00 00 00 
  80352c:	ff d0                	callq  *%rax
  80352e:	c9                   	leaveq 
  80352f:	c3                   	retq   

0000000000803530 <listen>:
  803530:	55                   	push   %rbp
  803531:	48 89 e5             	mov    %rsp,%rbp
  803534:	48 83 ec 20          	sub    $0x20,%rsp
  803538:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80353b:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80353e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803541:	89 c7                	mov    %eax,%edi
  803543:	48 b8 a8 32 80 00 00 	movabs $0x8032a8,%rax
  80354a:	00 00 00 
  80354d:	ff d0                	callq  *%rax
  80354f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803552:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803556:	79 05                	jns    80355d <listen+0x2d>
  803558:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80355b:	eb 16                	jmp    803573 <listen+0x43>
  80355d:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803560:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803563:	89 d6                	mov    %edx,%esi
  803565:	89 c7                	mov    %eax,%edi
  803567:	48 b8 9d 38 80 00 00 	movabs $0x80389d,%rax
  80356e:	00 00 00 
  803571:	ff d0                	callq  *%rax
  803573:	c9                   	leaveq 
  803574:	c3                   	retq   

0000000000803575 <devsock_read>:
  803575:	55                   	push   %rbp
  803576:	48 89 e5             	mov    %rsp,%rbp
  803579:	48 83 ec 20          	sub    $0x20,%rsp
  80357d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803581:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803585:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803589:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80358d:	89 c2                	mov    %eax,%edx
  80358f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803593:	8b 40 0c             	mov    0xc(%rax),%eax
  803596:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  80359a:	b9 00 00 00 00       	mov    $0x0,%ecx
  80359f:	89 c7                	mov    %eax,%edi
  8035a1:	48 b8 dd 38 80 00 00 	movabs $0x8038dd,%rax
  8035a8:	00 00 00 
  8035ab:	ff d0                	callq  *%rax
  8035ad:	c9                   	leaveq 
  8035ae:	c3                   	retq   

00000000008035af <devsock_write>:
  8035af:	55                   	push   %rbp
  8035b0:	48 89 e5             	mov    %rsp,%rbp
  8035b3:	48 83 ec 20          	sub    $0x20,%rsp
  8035b7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8035bb:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8035bf:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8035c3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8035c7:	89 c2                	mov    %eax,%edx
  8035c9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8035cd:	8b 40 0c             	mov    0xc(%rax),%eax
  8035d0:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  8035d4:	b9 00 00 00 00       	mov    $0x0,%ecx
  8035d9:	89 c7                	mov    %eax,%edi
  8035db:	48 b8 a9 39 80 00 00 	movabs $0x8039a9,%rax
  8035e2:	00 00 00 
  8035e5:	ff d0                	callq  *%rax
  8035e7:	c9                   	leaveq 
  8035e8:	c3                   	retq   

00000000008035e9 <devsock_stat>:
  8035e9:	55                   	push   %rbp
  8035ea:	48 89 e5             	mov    %rsp,%rbp
  8035ed:	48 83 ec 10          	sub    $0x10,%rsp
  8035f1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8035f5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8035f9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8035fd:	48 be 4a 4c 80 00 00 	movabs $0x804c4a,%rsi
  803604:	00 00 00 
  803607:	48 89 c7             	mov    %rax,%rdi
  80360a:	48 b8 6c 11 80 00 00 	movabs $0x80116c,%rax
  803611:	00 00 00 
  803614:	ff d0                	callq  *%rax
  803616:	b8 00 00 00 00       	mov    $0x0,%eax
  80361b:	c9                   	leaveq 
  80361c:	c3                   	retq   

000000000080361d <socket>:
  80361d:	55                   	push   %rbp
  80361e:	48 89 e5             	mov    %rsp,%rbp
  803621:	48 83 ec 20          	sub    $0x20,%rsp
  803625:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803628:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80362b:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  80362e:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803631:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803634:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803637:	89 ce                	mov    %ecx,%esi
  803639:	89 c7                	mov    %eax,%edi
  80363b:	48 b8 61 3a 80 00 00 	movabs $0x803a61,%rax
  803642:	00 00 00 
  803645:	ff d0                	callq  *%rax
  803647:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80364a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80364e:	79 05                	jns    803655 <socket+0x38>
  803650:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803653:	eb 11                	jmp    803666 <socket+0x49>
  803655:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803658:	89 c7                	mov    %eax,%edi
  80365a:	48 b8 ff 32 80 00 00 	movabs $0x8032ff,%rax
  803661:	00 00 00 
  803664:	ff d0                	callq  *%rax
  803666:	c9                   	leaveq 
  803667:	c3                   	retq   

0000000000803668 <nsipc>:
  803668:	55                   	push   %rbp
  803669:	48 89 e5             	mov    %rsp,%rbp
  80366c:	48 83 ec 10          	sub    $0x10,%rsp
  803670:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803673:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  80367a:	00 00 00 
  80367d:	8b 00                	mov    (%rax),%eax
  80367f:	85 c0                	test   %eax,%eax
  803681:	75 1d                	jne    8036a0 <nsipc+0x38>
  803683:	bf 02 00 00 00       	mov    $0x2,%edi
  803688:	48 b8 87 44 80 00 00 	movabs $0x804487,%rax
  80368f:	00 00 00 
  803692:	ff d0                	callq  *%rax
  803694:	48 ba 08 70 80 00 00 	movabs $0x807008,%rdx
  80369b:	00 00 00 
  80369e:	89 02                	mov    %eax,(%rdx)
  8036a0:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8036a7:	00 00 00 
  8036aa:	8b 00                	mov    (%rax),%eax
  8036ac:	8b 75 fc             	mov    -0x4(%rbp),%esi
  8036af:	b9 07 00 00 00       	mov    $0x7,%ecx
  8036b4:	48 ba 00 a0 80 00 00 	movabs $0x80a000,%rdx
  8036bb:	00 00 00 
  8036be:	89 c7                	mov    %eax,%edi
  8036c0:	48 b8 f1 43 80 00 00 	movabs $0x8043f1,%rax
  8036c7:	00 00 00 
  8036ca:	ff d0                	callq  *%rax
  8036cc:	ba 00 00 00 00       	mov    $0x0,%edx
  8036d1:	be 00 00 00 00       	mov    $0x0,%esi
  8036d6:	bf 00 00 00 00       	mov    $0x0,%edi
  8036db:	48 b8 30 43 80 00 00 	movabs $0x804330,%rax
  8036e2:	00 00 00 
  8036e5:	ff d0                	callq  *%rax
  8036e7:	c9                   	leaveq 
  8036e8:	c3                   	retq   

00000000008036e9 <nsipc_accept>:
  8036e9:	55                   	push   %rbp
  8036ea:	48 89 e5             	mov    %rsp,%rbp
  8036ed:	48 83 ec 30          	sub    $0x30,%rsp
  8036f1:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8036f4:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8036f8:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8036fc:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803703:	00 00 00 
  803706:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803709:	89 10                	mov    %edx,(%rax)
  80370b:	bf 01 00 00 00       	mov    $0x1,%edi
  803710:	48 b8 68 36 80 00 00 	movabs $0x803668,%rax
  803717:	00 00 00 
  80371a:	ff d0                	callq  *%rax
  80371c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80371f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803723:	78 3e                	js     803763 <nsipc_accept+0x7a>
  803725:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80372c:	00 00 00 
  80372f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803733:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803737:	8b 40 10             	mov    0x10(%rax),%eax
  80373a:	89 c2                	mov    %eax,%edx
  80373c:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  803740:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803744:	48 89 ce             	mov    %rcx,%rsi
  803747:	48 89 c7             	mov    %rax,%rdi
  80374a:	48 b8 90 14 80 00 00 	movabs $0x801490,%rax
  803751:	00 00 00 
  803754:	ff d0                	callq  *%rax
  803756:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80375a:	8b 50 10             	mov    0x10(%rax),%edx
  80375d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803761:	89 10                	mov    %edx,(%rax)
  803763:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803766:	c9                   	leaveq 
  803767:	c3                   	retq   

0000000000803768 <nsipc_bind>:
  803768:	55                   	push   %rbp
  803769:	48 89 e5             	mov    %rsp,%rbp
  80376c:	48 83 ec 10          	sub    $0x10,%rsp
  803770:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803773:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803777:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80377a:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803781:	00 00 00 
  803784:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803787:	89 10                	mov    %edx,(%rax)
  803789:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80378c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803790:	48 89 c6             	mov    %rax,%rsi
  803793:	48 bf 04 a0 80 00 00 	movabs $0x80a004,%rdi
  80379a:	00 00 00 
  80379d:	48 b8 90 14 80 00 00 	movabs $0x801490,%rax
  8037a4:	00 00 00 
  8037a7:	ff d0                	callq  *%rax
  8037a9:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8037b0:	00 00 00 
  8037b3:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8037b6:	89 50 14             	mov    %edx,0x14(%rax)
  8037b9:	bf 02 00 00 00       	mov    $0x2,%edi
  8037be:	48 b8 68 36 80 00 00 	movabs $0x803668,%rax
  8037c5:	00 00 00 
  8037c8:	ff d0                	callq  *%rax
  8037ca:	c9                   	leaveq 
  8037cb:	c3                   	retq   

00000000008037cc <nsipc_shutdown>:
  8037cc:	55                   	push   %rbp
  8037cd:	48 89 e5             	mov    %rsp,%rbp
  8037d0:	48 83 ec 10          	sub    $0x10,%rsp
  8037d4:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8037d7:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8037da:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8037e1:	00 00 00 
  8037e4:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8037e7:	89 10                	mov    %edx,(%rax)
  8037e9:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8037f0:	00 00 00 
  8037f3:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8037f6:	89 50 04             	mov    %edx,0x4(%rax)
  8037f9:	bf 03 00 00 00       	mov    $0x3,%edi
  8037fe:	48 b8 68 36 80 00 00 	movabs $0x803668,%rax
  803805:	00 00 00 
  803808:	ff d0                	callq  *%rax
  80380a:	c9                   	leaveq 
  80380b:	c3                   	retq   

000000000080380c <nsipc_close>:
  80380c:	55                   	push   %rbp
  80380d:	48 89 e5             	mov    %rsp,%rbp
  803810:	48 83 ec 10          	sub    $0x10,%rsp
  803814:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803817:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80381e:	00 00 00 
  803821:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803824:	89 10                	mov    %edx,(%rax)
  803826:	bf 04 00 00 00       	mov    $0x4,%edi
  80382b:	48 b8 68 36 80 00 00 	movabs $0x803668,%rax
  803832:	00 00 00 
  803835:	ff d0                	callq  *%rax
  803837:	c9                   	leaveq 
  803838:	c3                   	retq   

0000000000803839 <nsipc_connect>:
  803839:	55                   	push   %rbp
  80383a:	48 89 e5             	mov    %rsp,%rbp
  80383d:	48 83 ec 10          	sub    $0x10,%rsp
  803841:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803844:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803848:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80384b:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803852:	00 00 00 
  803855:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803858:	89 10                	mov    %edx,(%rax)
  80385a:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80385d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803861:	48 89 c6             	mov    %rax,%rsi
  803864:	48 bf 04 a0 80 00 00 	movabs $0x80a004,%rdi
  80386b:	00 00 00 
  80386e:	48 b8 90 14 80 00 00 	movabs $0x801490,%rax
  803875:	00 00 00 
  803878:	ff d0                	callq  *%rax
  80387a:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803881:	00 00 00 
  803884:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803887:	89 50 14             	mov    %edx,0x14(%rax)
  80388a:	bf 05 00 00 00       	mov    $0x5,%edi
  80388f:	48 b8 68 36 80 00 00 	movabs $0x803668,%rax
  803896:	00 00 00 
  803899:	ff d0                	callq  *%rax
  80389b:	c9                   	leaveq 
  80389c:	c3                   	retq   

000000000080389d <nsipc_listen>:
  80389d:	55                   	push   %rbp
  80389e:	48 89 e5             	mov    %rsp,%rbp
  8038a1:	48 83 ec 10          	sub    $0x10,%rsp
  8038a5:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8038a8:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8038ab:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8038b2:	00 00 00 
  8038b5:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8038b8:	89 10                	mov    %edx,(%rax)
  8038ba:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8038c1:	00 00 00 
  8038c4:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8038c7:	89 50 04             	mov    %edx,0x4(%rax)
  8038ca:	bf 06 00 00 00       	mov    $0x6,%edi
  8038cf:	48 b8 68 36 80 00 00 	movabs $0x803668,%rax
  8038d6:	00 00 00 
  8038d9:	ff d0                	callq  *%rax
  8038db:	c9                   	leaveq 
  8038dc:	c3                   	retq   

00000000008038dd <nsipc_recv>:
  8038dd:	55                   	push   %rbp
  8038de:	48 89 e5             	mov    %rsp,%rbp
  8038e1:	48 83 ec 30          	sub    $0x30,%rsp
  8038e5:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8038e8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8038ec:	89 55 e8             	mov    %edx,-0x18(%rbp)
  8038ef:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  8038f2:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8038f9:	00 00 00 
  8038fc:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8038ff:	89 10                	mov    %edx,(%rax)
  803901:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803908:	00 00 00 
  80390b:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80390e:	89 50 04             	mov    %edx,0x4(%rax)
  803911:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803918:	00 00 00 
  80391b:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80391e:	89 50 08             	mov    %edx,0x8(%rax)
  803921:	bf 07 00 00 00       	mov    $0x7,%edi
  803926:	48 b8 68 36 80 00 00 	movabs $0x803668,%rax
  80392d:	00 00 00 
  803930:	ff d0                	callq  *%rax
  803932:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803935:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803939:	78 69                	js     8039a4 <nsipc_recv+0xc7>
  80393b:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  803942:	7f 08                	jg     80394c <nsipc_recv+0x6f>
  803944:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803947:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  80394a:	7e 35                	jle    803981 <nsipc_recv+0xa4>
  80394c:	48 b9 51 4c 80 00 00 	movabs $0x804c51,%rcx
  803953:	00 00 00 
  803956:	48 ba 66 4c 80 00 00 	movabs $0x804c66,%rdx
  80395d:	00 00 00 
  803960:	be 62 00 00 00       	mov    $0x62,%esi
  803965:	48 bf 7b 4c 80 00 00 	movabs $0x804c7b,%rdi
  80396c:	00 00 00 
  80396f:	b8 00 00 00 00       	mov    $0x0,%eax
  803974:	49 b8 7e 03 80 00 00 	movabs $0x80037e,%r8
  80397b:	00 00 00 
  80397e:	41 ff d0             	callq  *%r8
  803981:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803984:	48 63 d0             	movslq %eax,%rdx
  803987:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80398b:	48 be 00 a0 80 00 00 	movabs $0x80a000,%rsi
  803992:	00 00 00 
  803995:	48 89 c7             	mov    %rax,%rdi
  803998:	48 b8 90 14 80 00 00 	movabs $0x801490,%rax
  80399f:	00 00 00 
  8039a2:	ff d0                	callq  *%rax
  8039a4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039a7:	c9                   	leaveq 
  8039a8:	c3                   	retq   

00000000008039a9 <nsipc_send>:
  8039a9:	55                   	push   %rbp
  8039aa:	48 89 e5             	mov    %rsp,%rbp
  8039ad:	48 83 ec 20          	sub    $0x20,%rsp
  8039b1:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8039b4:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8039b8:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8039bb:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  8039be:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8039c5:	00 00 00 
  8039c8:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8039cb:	89 10                	mov    %edx,(%rax)
  8039cd:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  8039d4:	7e 35                	jle    803a0b <nsipc_send+0x62>
  8039d6:	48 b9 8a 4c 80 00 00 	movabs $0x804c8a,%rcx
  8039dd:	00 00 00 
  8039e0:	48 ba 66 4c 80 00 00 	movabs $0x804c66,%rdx
  8039e7:	00 00 00 
  8039ea:	be 6d 00 00 00       	mov    $0x6d,%esi
  8039ef:	48 bf 7b 4c 80 00 00 	movabs $0x804c7b,%rdi
  8039f6:	00 00 00 
  8039f9:	b8 00 00 00 00       	mov    $0x0,%eax
  8039fe:	49 b8 7e 03 80 00 00 	movabs $0x80037e,%r8
  803a05:	00 00 00 
  803a08:	41 ff d0             	callq  *%r8
  803a0b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803a0e:	48 63 d0             	movslq %eax,%rdx
  803a11:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a15:	48 89 c6             	mov    %rax,%rsi
  803a18:	48 bf 0c a0 80 00 00 	movabs $0x80a00c,%rdi
  803a1f:	00 00 00 
  803a22:	48 b8 90 14 80 00 00 	movabs $0x801490,%rax
  803a29:	00 00 00 
  803a2c:	ff d0                	callq  *%rax
  803a2e:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803a35:	00 00 00 
  803a38:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803a3b:	89 50 04             	mov    %edx,0x4(%rax)
  803a3e:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803a45:	00 00 00 
  803a48:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803a4b:	89 50 08             	mov    %edx,0x8(%rax)
  803a4e:	bf 08 00 00 00       	mov    $0x8,%edi
  803a53:	48 b8 68 36 80 00 00 	movabs $0x803668,%rax
  803a5a:	00 00 00 
  803a5d:	ff d0                	callq  *%rax
  803a5f:	c9                   	leaveq 
  803a60:	c3                   	retq   

0000000000803a61 <nsipc_socket>:
  803a61:	55                   	push   %rbp
  803a62:	48 89 e5             	mov    %rsp,%rbp
  803a65:	48 83 ec 10          	sub    $0x10,%rsp
  803a69:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803a6c:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803a6f:	89 55 f4             	mov    %edx,-0xc(%rbp)
  803a72:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803a79:	00 00 00 
  803a7c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803a7f:	89 10                	mov    %edx,(%rax)
  803a81:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803a88:	00 00 00 
  803a8b:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803a8e:	89 50 04             	mov    %edx,0x4(%rax)
  803a91:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803a98:	00 00 00 
  803a9b:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803a9e:	89 50 08             	mov    %edx,0x8(%rax)
  803aa1:	bf 09 00 00 00       	mov    $0x9,%edi
  803aa6:	48 b8 68 36 80 00 00 	movabs $0x803668,%rax
  803aad:	00 00 00 
  803ab0:	ff d0                	callq  *%rax
  803ab2:	c9                   	leaveq 
  803ab3:	c3                   	retq   

0000000000803ab4 <pipe>:
  803ab4:	55                   	push   %rbp
  803ab5:	48 89 e5             	mov    %rsp,%rbp
  803ab8:	53                   	push   %rbx
  803ab9:	48 83 ec 38          	sub    $0x38,%rsp
  803abd:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  803ac1:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  803ac5:	48 89 c7             	mov    %rax,%rdi
  803ac8:	48 b8 c7 1f 80 00 00 	movabs $0x801fc7,%rax
  803acf:	00 00 00 
  803ad2:	ff d0                	callq  *%rax
  803ad4:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803ad7:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803adb:	0f 88 bf 01 00 00    	js     803ca0 <pipe+0x1ec>
  803ae1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803ae5:	ba 07 04 00 00       	mov    $0x407,%edx
  803aea:	48 89 c6             	mov    %rax,%rsi
  803aed:	bf 00 00 00 00       	mov    $0x0,%edi
  803af2:	48 b8 9b 1a 80 00 00 	movabs $0x801a9b,%rax
  803af9:	00 00 00 
  803afc:	ff d0                	callq  *%rax
  803afe:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803b01:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803b05:	0f 88 95 01 00 00    	js     803ca0 <pipe+0x1ec>
  803b0b:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  803b0f:	48 89 c7             	mov    %rax,%rdi
  803b12:	48 b8 c7 1f 80 00 00 	movabs $0x801fc7,%rax
  803b19:	00 00 00 
  803b1c:	ff d0                	callq  *%rax
  803b1e:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803b21:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803b25:	0f 88 5d 01 00 00    	js     803c88 <pipe+0x1d4>
  803b2b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803b2f:	ba 07 04 00 00       	mov    $0x407,%edx
  803b34:	48 89 c6             	mov    %rax,%rsi
  803b37:	bf 00 00 00 00       	mov    $0x0,%edi
  803b3c:	48 b8 9b 1a 80 00 00 	movabs $0x801a9b,%rax
  803b43:	00 00 00 
  803b46:	ff d0                	callq  *%rax
  803b48:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803b4b:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803b4f:	0f 88 33 01 00 00    	js     803c88 <pipe+0x1d4>
  803b55:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803b59:	48 89 c7             	mov    %rax,%rdi
  803b5c:	48 b8 9c 1f 80 00 00 	movabs $0x801f9c,%rax
  803b63:	00 00 00 
  803b66:	ff d0                	callq  *%rax
  803b68:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803b6c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803b70:	ba 07 04 00 00       	mov    $0x407,%edx
  803b75:	48 89 c6             	mov    %rax,%rsi
  803b78:	bf 00 00 00 00       	mov    $0x0,%edi
  803b7d:	48 b8 9b 1a 80 00 00 	movabs $0x801a9b,%rax
  803b84:	00 00 00 
  803b87:	ff d0                	callq  *%rax
  803b89:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803b8c:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803b90:	79 05                	jns    803b97 <pipe+0xe3>
  803b92:	e9 d9 00 00 00       	jmpq   803c70 <pipe+0x1bc>
  803b97:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803b9b:	48 89 c7             	mov    %rax,%rdi
  803b9e:	48 b8 9c 1f 80 00 00 	movabs $0x801f9c,%rax
  803ba5:	00 00 00 
  803ba8:	ff d0                	callq  *%rax
  803baa:	48 89 c2             	mov    %rax,%rdx
  803bad:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803bb1:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  803bb7:	48 89 d1             	mov    %rdx,%rcx
  803bba:	ba 00 00 00 00       	mov    $0x0,%edx
  803bbf:	48 89 c6             	mov    %rax,%rsi
  803bc2:	bf 00 00 00 00       	mov    $0x0,%edi
  803bc7:	48 b8 eb 1a 80 00 00 	movabs $0x801aeb,%rax
  803bce:	00 00 00 
  803bd1:	ff d0                	callq  *%rax
  803bd3:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803bd6:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803bda:	79 1b                	jns    803bf7 <pipe+0x143>
  803bdc:	90                   	nop
  803bdd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803be1:	48 89 c6             	mov    %rax,%rsi
  803be4:	bf 00 00 00 00       	mov    $0x0,%edi
  803be9:	48 b8 46 1b 80 00 00 	movabs $0x801b46,%rax
  803bf0:	00 00 00 
  803bf3:	ff d0                	callq  *%rax
  803bf5:	eb 79                	jmp    803c70 <pipe+0x1bc>
  803bf7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803bfb:	48 ba e0 60 80 00 00 	movabs $0x8060e0,%rdx
  803c02:	00 00 00 
  803c05:	8b 12                	mov    (%rdx),%edx
  803c07:	89 10                	mov    %edx,(%rax)
  803c09:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803c0d:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  803c14:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803c18:	48 ba e0 60 80 00 00 	movabs $0x8060e0,%rdx
  803c1f:	00 00 00 
  803c22:	8b 12                	mov    (%rdx),%edx
  803c24:	89 10                	mov    %edx,(%rax)
  803c26:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803c2a:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  803c31:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803c35:	48 89 c7             	mov    %rax,%rdi
  803c38:	48 b8 79 1f 80 00 00 	movabs $0x801f79,%rax
  803c3f:	00 00 00 
  803c42:	ff d0                	callq  *%rax
  803c44:	89 c2                	mov    %eax,%edx
  803c46:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803c4a:	89 10                	mov    %edx,(%rax)
  803c4c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803c50:	48 8d 58 04          	lea    0x4(%rax),%rbx
  803c54:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803c58:	48 89 c7             	mov    %rax,%rdi
  803c5b:	48 b8 79 1f 80 00 00 	movabs $0x801f79,%rax
  803c62:	00 00 00 
  803c65:	ff d0                	callq  *%rax
  803c67:	89 03                	mov    %eax,(%rbx)
  803c69:	b8 00 00 00 00       	mov    $0x0,%eax
  803c6e:	eb 33                	jmp    803ca3 <pipe+0x1ef>
  803c70:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803c74:	48 89 c6             	mov    %rax,%rsi
  803c77:	bf 00 00 00 00       	mov    $0x0,%edi
  803c7c:	48 b8 46 1b 80 00 00 	movabs $0x801b46,%rax
  803c83:	00 00 00 
  803c86:	ff d0                	callq  *%rax
  803c88:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803c8c:	48 89 c6             	mov    %rax,%rsi
  803c8f:	bf 00 00 00 00       	mov    $0x0,%edi
  803c94:	48 b8 46 1b 80 00 00 	movabs $0x801b46,%rax
  803c9b:	00 00 00 
  803c9e:	ff d0                	callq  *%rax
  803ca0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803ca3:	48 83 c4 38          	add    $0x38,%rsp
  803ca7:	5b                   	pop    %rbx
  803ca8:	5d                   	pop    %rbp
  803ca9:	c3                   	retq   

0000000000803caa <_pipeisclosed>:
  803caa:	55                   	push   %rbp
  803cab:	48 89 e5             	mov    %rsp,%rbp
  803cae:	53                   	push   %rbx
  803caf:	48 83 ec 28          	sub    $0x28,%rsp
  803cb3:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803cb7:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803cbb:	48 b8 10 70 80 00 00 	movabs $0x807010,%rax
  803cc2:	00 00 00 
  803cc5:	48 8b 00             	mov    (%rax),%rax
  803cc8:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  803cce:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803cd1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803cd5:	48 89 c7             	mov    %rax,%rdi
  803cd8:	48 b8 f9 44 80 00 00 	movabs $0x8044f9,%rax
  803cdf:	00 00 00 
  803ce2:	ff d0                	callq  *%rax
  803ce4:	89 c3                	mov    %eax,%ebx
  803ce6:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803cea:	48 89 c7             	mov    %rax,%rdi
  803ced:	48 b8 f9 44 80 00 00 	movabs $0x8044f9,%rax
  803cf4:	00 00 00 
  803cf7:	ff d0                	callq  *%rax
  803cf9:	39 c3                	cmp    %eax,%ebx
  803cfb:	0f 94 c0             	sete   %al
  803cfe:	0f b6 c0             	movzbl %al,%eax
  803d01:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803d04:	48 b8 10 70 80 00 00 	movabs $0x807010,%rax
  803d0b:	00 00 00 
  803d0e:	48 8b 00             	mov    (%rax),%rax
  803d11:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  803d17:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  803d1a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803d1d:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  803d20:	75 05                	jne    803d27 <_pipeisclosed+0x7d>
  803d22:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803d25:	eb 4f                	jmp    803d76 <_pipeisclosed+0xcc>
  803d27:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803d2a:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  803d2d:	74 42                	je     803d71 <_pipeisclosed+0xc7>
  803d2f:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  803d33:	75 3c                	jne    803d71 <_pipeisclosed+0xc7>
  803d35:	48 b8 10 70 80 00 00 	movabs $0x807010,%rax
  803d3c:	00 00 00 
  803d3f:	48 8b 00             	mov    (%rax),%rax
  803d42:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  803d48:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803d4b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803d4e:	89 c6                	mov    %eax,%esi
  803d50:	48 bf 9b 4c 80 00 00 	movabs $0x804c9b,%rdi
  803d57:	00 00 00 
  803d5a:	b8 00 00 00 00       	mov    $0x0,%eax
  803d5f:	49 b8 b7 05 80 00 00 	movabs $0x8005b7,%r8
  803d66:	00 00 00 
  803d69:	41 ff d0             	callq  *%r8
  803d6c:	e9 4a ff ff ff       	jmpq   803cbb <_pipeisclosed+0x11>
  803d71:	e9 45 ff ff ff       	jmpq   803cbb <_pipeisclosed+0x11>
  803d76:	48 83 c4 28          	add    $0x28,%rsp
  803d7a:	5b                   	pop    %rbx
  803d7b:	5d                   	pop    %rbp
  803d7c:	c3                   	retq   

0000000000803d7d <pipeisclosed>:
  803d7d:	55                   	push   %rbp
  803d7e:	48 89 e5             	mov    %rsp,%rbp
  803d81:	48 83 ec 30          	sub    $0x30,%rsp
  803d85:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803d88:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  803d8c:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803d8f:	48 89 d6             	mov    %rdx,%rsi
  803d92:	89 c7                	mov    %eax,%edi
  803d94:	48 b8 5f 20 80 00 00 	movabs $0x80205f,%rax
  803d9b:	00 00 00 
  803d9e:	ff d0                	callq  *%rax
  803da0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803da3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803da7:	79 05                	jns    803dae <pipeisclosed+0x31>
  803da9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803dac:	eb 31                	jmp    803ddf <pipeisclosed+0x62>
  803dae:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803db2:	48 89 c7             	mov    %rax,%rdi
  803db5:	48 b8 9c 1f 80 00 00 	movabs $0x801f9c,%rax
  803dbc:	00 00 00 
  803dbf:	ff d0                	callq  *%rax
  803dc1:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803dc5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803dc9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803dcd:	48 89 d6             	mov    %rdx,%rsi
  803dd0:	48 89 c7             	mov    %rax,%rdi
  803dd3:	48 b8 aa 3c 80 00 00 	movabs $0x803caa,%rax
  803dda:	00 00 00 
  803ddd:	ff d0                	callq  *%rax
  803ddf:	c9                   	leaveq 
  803de0:	c3                   	retq   

0000000000803de1 <devpipe_read>:
  803de1:	55                   	push   %rbp
  803de2:	48 89 e5             	mov    %rsp,%rbp
  803de5:	48 83 ec 40          	sub    $0x40,%rsp
  803de9:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803ded:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803df1:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803df5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803df9:	48 89 c7             	mov    %rax,%rdi
  803dfc:	48 b8 9c 1f 80 00 00 	movabs $0x801f9c,%rax
  803e03:	00 00 00 
  803e06:	ff d0                	callq  *%rax
  803e08:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803e0c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803e10:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803e14:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803e1b:	00 
  803e1c:	e9 92 00 00 00       	jmpq   803eb3 <devpipe_read+0xd2>
  803e21:	eb 41                	jmp    803e64 <devpipe_read+0x83>
  803e23:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  803e28:	74 09                	je     803e33 <devpipe_read+0x52>
  803e2a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803e2e:	e9 92 00 00 00       	jmpq   803ec5 <devpipe_read+0xe4>
  803e33:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803e37:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803e3b:	48 89 d6             	mov    %rdx,%rsi
  803e3e:	48 89 c7             	mov    %rax,%rdi
  803e41:	48 b8 aa 3c 80 00 00 	movabs $0x803caa,%rax
  803e48:	00 00 00 
  803e4b:	ff d0                	callq  *%rax
  803e4d:	85 c0                	test   %eax,%eax
  803e4f:	74 07                	je     803e58 <devpipe_read+0x77>
  803e51:	b8 00 00 00 00       	mov    $0x0,%eax
  803e56:	eb 6d                	jmp    803ec5 <devpipe_read+0xe4>
  803e58:	48 b8 5d 1a 80 00 00 	movabs $0x801a5d,%rax
  803e5f:	00 00 00 
  803e62:	ff d0                	callq  *%rax
  803e64:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e68:	8b 10                	mov    (%rax),%edx
  803e6a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e6e:	8b 40 04             	mov    0x4(%rax),%eax
  803e71:	39 c2                	cmp    %eax,%edx
  803e73:	74 ae                	je     803e23 <devpipe_read+0x42>
  803e75:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803e79:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803e7d:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  803e81:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e85:	8b 00                	mov    (%rax),%eax
  803e87:	99                   	cltd   
  803e88:	c1 ea 1b             	shr    $0x1b,%edx
  803e8b:	01 d0                	add    %edx,%eax
  803e8d:	83 e0 1f             	and    $0x1f,%eax
  803e90:	29 d0                	sub    %edx,%eax
  803e92:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803e96:	48 98                	cltq   
  803e98:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  803e9d:	88 01                	mov    %al,(%rcx)
  803e9f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ea3:	8b 00                	mov    (%rax),%eax
  803ea5:	8d 50 01             	lea    0x1(%rax),%edx
  803ea8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803eac:	89 10                	mov    %edx,(%rax)
  803eae:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803eb3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803eb7:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803ebb:	0f 82 60 ff ff ff    	jb     803e21 <devpipe_read+0x40>
  803ec1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803ec5:	c9                   	leaveq 
  803ec6:	c3                   	retq   

0000000000803ec7 <devpipe_write>:
  803ec7:	55                   	push   %rbp
  803ec8:	48 89 e5             	mov    %rsp,%rbp
  803ecb:	48 83 ec 40          	sub    $0x40,%rsp
  803ecf:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803ed3:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803ed7:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803edb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803edf:	48 89 c7             	mov    %rax,%rdi
  803ee2:	48 b8 9c 1f 80 00 00 	movabs $0x801f9c,%rax
  803ee9:	00 00 00 
  803eec:	ff d0                	callq  *%rax
  803eee:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803ef2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803ef6:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803efa:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803f01:	00 
  803f02:	e9 8e 00 00 00       	jmpq   803f95 <devpipe_write+0xce>
  803f07:	eb 31                	jmp    803f3a <devpipe_write+0x73>
  803f09:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803f0d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803f11:	48 89 d6             	mov    %rdx,%rsi
  803f14:	48 89 c7             	mov    %rax,%rdi
  803f17:	48 b8 aa 3c 80 00 00 	movabs $0x803caa,%rax
  803f1e:	00 00 00 
  803f21:	ff d0                	callq  *%rax
  803f23:	85 c0                	test   %eax,%eax
  803f25:	74 07                	je     803f2e <devpipe_write+0x67>
  803f27:	b8 00 00 00 00       	mov    $0x0,%eax
  803f2c:	eb 79                	jmp    803fa7 <devpipe_write+0xe0>
  803f2e:	48 b8 5d 1a 80 00 00 	movabs $0x801a5d,%rax
  803f35:	00 00 00 
  803f38:	ff d0                	callq  *%rax
  803f3a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f3e:	8b 40 04             	mov    0x4(%rax),%eax
  803f41:	48 63 d0             	movslq %eax,%rdx
  803f44:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f48:	8b 00                	mov    (%rax),%eax
  803f4a:	48 98                	cltq   
  803f4c:	48 83 c0 20          	add    $0x20,%rax
  803f50:	48 39 c2             	cmp    %rax,%rdx
  803f53:	73 b4                	jae    803f09 <devpipe_write+0x42>
  803f55:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f59:	8b 40 04             	mov    0x4(%rax),%eax
  803f5c:	99                   	cltd   
  803f5d:	c1 ea 1b             	shr    $0x1b,%edx
  803f60:	01 d0                	add    %edx,%eax
  803f62:	83 e0 1f             	and    $0x1f,%eax
  803f65:	29 d0                	sub    %edx,%eax
  803f67:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  803f6b:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  803f6f:	48 01 ca             	add    %rcx,%rdx
  803f72:	0f b6 0a             	movzbl (%rdx),%ecx
  803f75:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803f79:	48 98                	cltq   
  803f7b:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  803f7f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f83:	8b 40 04             	mov    0x4(%rax),%eax
  803f86:	8d 50 01             	lea    0x1(%rax),%edx
  803f89:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f8d:	89 50 04             	mov    %edx,0x4(%rax)
  803f90:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803f95:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803f99:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803f9d:	0f 82 64 ff ff ff    	jb     803f07 <devpipe_write+0x40>
  803fa3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803fa7:	c9                   	leaveq 
  803fa8:	c3                   	retq   

0000000000803fa9 <devpipe_stat>:
  803fa9:	55                   	push   %rbp
  803faa:	48 89 e5             	mov    %rsp,%rbp
  803fad:	48 83 ec 20          	sub    $0x20,%rsp
  803fb1:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803fb5:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803fb9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803fbd:	48 89 c7             	mov    %rax,%rdi
  803fc0:	48 b8 9c 1f 80 00 00 	movabs $0x801f9c,%rax
  803fc7:	00 00 00 
  803fca:	ff d0                	callq  *%rax
  803fcc:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803fd0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803fd4:	48 be ae 4c 80 00 00 	movabs $0x804cae,%rsi
  803fdb:	00 00 00 
  803fde:	48 89 c7             	mov    %rax,%rdi
  803fe1:	48 b8 6c 11 80 00 00 	movabs $0x80116c,%rax
  803fe8:	00 00 00 
  803feb:	ff d0                	callq  *%rax
  803fed:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803ff1:	8b 50 04             	mov    0x4(%rax),%edx
  803ff4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803ff8:	8b 00                	mov    (%rax),%eax
  803ffa:	29 c2                	sub    %eax,%edx
  803ffc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804000:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  804006:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80400a:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  804011:	00 00 00 
  804014:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804018:	48 b9 e0 60 80 00 00 	movabs $0x8060e0,%rcx
  80401f:	00 00 00 
  804022:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  804029:	b8 00 00 00 00       	mov    $0x0,%eax
  80402e:	c9                   	leaveq 
  80402f:	c3                   	retq   

0000000000804030 <devpipe_close>:
  804030:	55                   	push   %rbp
  804031:	48 89 e5             	mov    %rsp,%rbp
  804034:	48 83 ec 10          	sub    $0x10,%rsp
  804038:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80403c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804040:	48 89 c6             	mov    %rax,%rsi
  804043:	bf 00 00 00 00       	mov    $0x0,%edi
  804048:	48 b8 46 1b 80 00 00 	movabs $0x801b46,%rax
  80404f:	00 00 00 
  804052:	ff d0                	callq  *%rax
  804054:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804058:	48 89 c7             	mov    %rax,%rdi
  80405b:	48 b8 9c 1f 80 00 00 	movabs $0x801f9c,%rax
  804062:	00 00 00 
  804065:	ff d0                	callq  *%rax
  804067:	48 89 c6             	mov    %rax,%rsi
  80406a:	bf 00 00 00 00       	mov    $0x0,%edi
  80406f:	48 b8 46 1b 80 00 00 	movabs $0x801b46,%rax
  804076:	00 00 00 
  804079:	ff d0                	callq  *%rax
  80407b:	c9                   	leaveq 
  80407c:	c3                   	retq   

000000000080407d <cputchar>:
  80407d:	55                   	push   %rbp
  80407e:	48 89 e5             	mov    %rsp,%rbp
  804081:	48 83 ec 20          	sub    $0x20,%rsp
  804085:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804088:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80408b:	88 45 ff             	mov    %al,-0x1(%rbp)
  80408e:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  804092:	be 01 00 00 00       	mov    $0x1,%esi
  804097:	48 89 c7             	mov    %rax,%rdi
  80409a:	48 b8 53 19 80 00 00 	movabs $0x801953,%rax
  8040a1:	00 00 00 
  8040a4:	ff d0                	callq  *%rax
  8040a6:	c9                   	leaveq 
  8040a7:	c3                   	retq   

00000000008040a8 <getchar>:
  8040a8:	55                   	push   %rbp
  8040a9:	48 89 e5             	mov    %rsp,%rbp
  8040ac:	48 83 ec 10          	sub    $0x10,%rsp
  8040b0:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  8040b4:	ba 01 00 00 00       	mov    $0x1,%edx
  8040b9:	48 89 c6             	mov    %rax,%rsi
  8040bc:	bf 00 00 00 00       	mov    $0x0,%edi
  8040c1:	48 b8 91 24 80 00 00 	movabs $0x802491,%rax
  8040c8:	00 00 00 
  8040cb:	ff d0                	callq  *%rax
  8040cd:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8040d0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8040d4:	79 05                	jns    8040db <getchar+0x33>
  8040d6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8040d9:	eb 14                	jmp    8040ef <getchar+0x47>
  8040db:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8040df:	7f 07                	jg     8040e8 <getchar+0x40>
  8040e1:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  8040e6:	eb 07                	jmp    8040ef <getchar+0x47>
  8040e8:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  8040ec:	0f b6 c0             	movzbl %al,%eax
  8040ef:	c9                   	leaveq 
  8040f0:	c3                   	retq   

00000000008040f1 <iscons>:
  8040f1:	55                   	push   %rbp
  8040f2:	48 89 e5             	mov    %rsp,%rbp
  8040f5:	48 83 ec 20          	sub    $0x20,%rsp
  8040f9:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8040fc:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  804100:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804103:	48 89 d6             	mov    %rdx,%rsi
  804106:	89 c7                	mov    %eax,%edi
  804108:	48 b8 5f 20 80 00 00 	movabs $0x80205f,%rax
  80410f:	00 00 00 
  804112:	ff d0                	callq  *%rax
  804114:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804117:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80411b:	79 05                	jns    804122 <iscons+0x31>
  80411d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804120:	eb 1a                	jmp    80413c <iscons+0x4b>
  804122:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804126:	8b 10                	mov    (%rax),%edx
  804128:	48 b8 20 61 80 00 00 	movabs $0x806120,%rax
  80412f:	00 00 00 
  804132:	8b 00                	mov    (%rax),%eax
  804134:	39 c2                	cmp    %eax,%edx
  804136:	0f 94 c0             	sete   %al
  804139:	0f b6 c0             	movzbl %al,%eax
  80413c:	c9                   	leaveq 
  80413d:	c3                   	retq   

000000000080413e <opencons>:
  80413e:	55                   	push   %rbp
  80413f:	48 89 e5             	mov    %rsp,%rbp
  804142:	48 83 ec 10          	sub    $0x10,%rsp
  804146:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  80414a:	48 89 c7             	mov    %rax,%rdi
  80414d:	48 b8 c7 1f 80 00 00 	movabs $0x801fc7,%rax
  804154:	00 00 00 
  804157:	ff d0                	callq  *%rax
  804159:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80415c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804160:	79 05                	jns    804167 <opencons+0x29>
  804162:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804165:	eb 5b                	jmp    8041c2 <opencons+0x84>
  804167:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80416b:	ba 07 04 00 00       	mov    $0x407,%edx
  804170:	48 89 c6             	mov    %rax,%rsi
  804173:	bf 00 00 00 00       	mov    $0x0,%edi
  804178:	48 b8 9b 1a 80 00 00 	movabs $0x801a9b,%rax
  80417f:	00 00 00 
  804182:	ff d0                	callq  *%rax
  804184:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804187:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80418b:	79 05                	jns    804192 <opencons+0x54>
  80418d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804190:	eb 30                	jmp    8041c2 <opencons+0x84>
  804192:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804196:	48 ba 20 61 80 00 00 	movabs $0x806120,%rdx
  80419d:	00 00 00 
  8041a0:	8b 12                	mov    (%rdx),%edx
  8041a2:	89 10                	mov    %edx,(%rax)
  8041a4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8041a8:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8041af:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8041b3:	48 89 c7             	mov    %rax,%rdi
  8041b6:	48 b8 79 1f 80 00 00 	movabs $0x801f79,%rax
  8041bd:	00 00 00 
  8041c0:	ff d0                	callq  *%rax
  8041c2:	c9                   	leaveq 
  8041c3:	c3                   	retq   

00000000008041c4 <devcons_read>:
  8041c4:	55                   	push   %rbp
  8041c5:	48 89 e5             	mov    %rsp,%rbp
  8041c8:	48 83 ec 30          	sub    $0x30,%rsp
  8041cc:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8041d0:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8041d4:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8041d8:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8041dd:	75 07                	jne    8041e6 <devcons_read+0x22>
  8041df:	b8 00 00 00 00       	mov    $0x0,%eax
  8041e4:	eb 4b                	jmp    804231 <devcons_read+0x6d>
  8041e6:	eb 0c                	jmp    8041f4 <devcons_read+0x30>
  8041e8:	48 b8 5d 1a 80 00 00 	movabs $0x801a5d,%rax
  8041ef:	00 00 00 
  8041f2:	ff d0                	callq  *%rax
  8041f4:	48 b8 9d 19 80 00 00 	movabs $0x80199d,%rax
  8041fb:	00 00 00 
  8041fe:	ff d0                	callq  *%rax
  804200:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804203:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804207:	74 df                	je     8041e8 <devcons_read+0x24>
  804209:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80420d:	79 05                	jns    804214 <devcons_read+0x50>
  80420f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804212:	eb 1d                	jmp    804231 <devcons_read+0x6d>
  804214:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  804218:	75 07                	jne    804221 <devcons_read+0x5d>
  80421a:	b8 00 00 00 00       	mov    $0x0,%eax
  80421f:	eb 10                	jmp    804231 <devcons_read+0x6d>
  804221:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804224:	89 c2                	mov    %eax,%edx
  804226:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80422a:	88 10                	mov    %dl,(%rax)
  80422c:	b8 01 00 00 00       	mov    $0x1,%eax
  804231:	c9                   	leaveq 
  804232:	c3                   	retq   

0000000000804233 <devcons_write>:
  804233:	55                   	push   %rbp
  804234:	48 89 e5             	mov    %rsp,%rbp
  804237:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  80423e:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  804245:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  80424c:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  804253:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80425a:	eb 76                	jmp    8042d2 <devcons_write+0x9f>
  80425c:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  804263:	89 c2                	mov    %eax,%edx
  804265:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804268:	29 c2                	sub    %eax,%edx
  80426a:	89 d0                	mov    %edx,%eax
  80426c:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80426f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804272:	83 f8 7f             	cmp    $0x7f,%eax
  804275:	76 07                	jbe    80427e <devcons_write+0x4b>
  804277:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  80427e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804281:	48 63 d0             	movslq %eax,%rdx
  804284:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804287:	48 63 c8             	movslq %eax,%rcx
  80428a:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  804291:	48 01 c1             	add    %rax,%rcx
  804294:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  80429b:	48 89 ce             	mov    %rcx,%rsi
  80429e:	48 89 c7             	mov    %rax,%rdi
  8042a1:	48 b8 90 14 80 00 00 	movabs $0x801490,%rax
  8042a8:	00 00 00 
  8042ab:	ff d0                	callq  *%rax
  8042ad:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8042b0:	48 63 d0             	movslq %eax,%rdx
  8042b3:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  8042ba:	48 89 d6             	mov    %rdx,%rsi
  8042bd:	48 89 c7             	mov    %rax,%rdi
  8042c0:	48 b8 53 19 80 00 00 	movabs $0x801953,%rax
  8042c7:	00 00 00 
  8042ca:	ff d0                	callq  *%rax
  8042cc:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8042cf:	01 45 fc             	add    %eax,-0x4(%rbp)
  8042d2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8042d5:	48 98                	cltq   
  8042d7:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  8042de:	0f 82 78 ff ff ff    	jb     80425c <devcons_write+0x29>
  8042e4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8042e7:	c9                   	leaveq 
  8042e8:	c3                   	retq   

00000000008042e9 <devcons_close>:
  8042e9:	55                   	push   %rbp
  8042ea:	48 89 e5             	mov    %rsp,%rbp
  8042ed:	48 83 ec 08          	sub    $0x8,%rsp
  8042f1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8042f5:	b8 00 00 00 00       	mov    $0x0,%eax
  8042fa:	c9                   	leaveq 
  8042fb:	c3                   	retq   

00000000008042fc <devcons_stat>:
  8042fc:	55                   	push   %rbp
  8042fd:	48 89 e5             	mov    %rsp,%rbp
  804300:	48 83 ec 10          	sub    $0x10,%rsp
  804304:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804308:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80430c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804310:	48 be ba 4c 80 00 00 	movabs $0x804cba,%rsi
  804317:	00 00 00 
  80431a:	48 89 c7             	mov    %rax,%rdi
  80431d:	48 b8 6c 11 80 00 00 	movabs $0x80116c,%rax
  804324:	00 00 00 
  804327:	ff d0                	callq  *%rax
  804329:	b8 00 00 00 00       	mov    $0x0,%eax
  80432e:	c9                   	leaveq 
  80432f:	c3                   	retq   

0000000000804330 <ipc_recv>:
  804330:	55                   	push   %rbp
  804331:	48 89 e5             	mov    %rsp,%rbp
  804334:	48 83 ec 30          	sub    $0x30,%rsp
  804338:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80433c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804340:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804344:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  804349:	75 0e                	jne    804359 <ipc_recv+0x29>
  80434b:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804352:	00 00 00 
  804355:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804359:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80435d:	48 89 c7             	mov    %rax,%rdi
  804360:	48 b8 c4 1c 80 00 00 	movabs $0x801cc4,%rax
  804367:	00 00 00 
  80436a:	ff d0                	callq  *%rax
  80436c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80436f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804373:	79 27                	jns    80439c <ipc_recv+0x6c>
  804375:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80437a:	74 0a                	je     804386 <ipc_recv+0x56>
  80437c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804380:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  804386:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80438b:	74 0a                	je     804397 <ipc_recv+0x67>
  80438d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804391:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  804397:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80439a:	eb 53                	jmp    8043ef <ipc_recv+0xbf>
  80439c:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8043a1:	74 19                	je     8043bc <ipc_recv+0x8c>
  8043a3:	48 b8 10 70 80 00 00 	movabs $0x807010,%rax
  8043aa:	00 00 00 
  8043ad:	48 8b 00             	mov    (%rax),%rax
  8043b0:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  8043b6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8043ba:	89 10                	mov    %edx,(%rax)
  8043bc:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8043c1:	74 19                	je     8043dc <ipc_recv+0xac>
  8043c3:	48 b8 10 70 80 00 00 	movabs $0x807010,%rax
  8043ca:	00 00 00 
  8043cd:	48 8b 00             	mov    (%rax),%rax
  8043d0:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  8043d6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8043da:	89 10                	mov    %edx,(%rax)
  8043dc:	48 b8 10 70 80 00 00 	movabs $0x807010,%rax
  8043e3:	00 00 00 
  8043e6:	48 8b 00             	mov    (%rax),%rax
  8043e9:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  8043ef:	c9                   	leaveq 
  8043f0:	c3                   	retq   

00000000008043f1 <ipc_send>:
  8043f1:	55                   	push   %rbp
  8043f2:	48 89 e5             	mov    %rsp,%rbp
  8043f5:	48 83 ec 30          	sub    $0x30,%rsp
  8043f9:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8043fc:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8043ff:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  804403:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  804406:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80440b:	75 10                	jne    80441d <ipc_send+0x2c>
  80440d:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804414:	00 00 00 
  804417:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80441b:	eb 0e                	jmp    80442b <ipc_send+0x3a>
  80441d:	eb 0c                	jmp    80442b <ipc_send+0x3a>
  80441f:	48 b8 5d 1a 80 00 00 	movabs $0x801a5d,%rax
  804426:	00 00 00 
  804429:	ff d0                	callq  *%rax
  80442b:	8b 75 e8             	mov    -0x18(%rbp),%esi
  80442e:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  804431:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  804435:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804438:	89 c7                	mov    %eax,%edi
  80443a:	48 b8 6f 1c 80 00 00 	movabs $0x801c6f,%rax
  804441:	00 00 00 
  804444:	ff d0                	callq  *%rax
  804446:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804449:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  80444d:	74 d0                	je     80441f <ipc_send+0x2e>
  80444f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804453:	79 30                	jns    804485 <ipc_send+0x94>
  804455:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804458:	89 c1                	mov    %eax,%ecx
  80445a:	48 ba c1 4c 80 00 00 	movabs $0x804cc1,%rdx
  804461:	00 00 00 
  804464:	be 44 00 00 00       	mov    $0x44,%esi
  804469:	48 bf d7 4c 80 00 00 	movabs $0x804cd7,%rdi
  804470:	00 00 00 
  804473:	b8 00 00 00 00       	mov    $0x0,%eax
  804478:	49 b8 7e 03 80 00 00 	movabs $0x80037e,%r8
  80447f:	00 00 00 
  804482:	41 ff d0             	callq  *%r8
  804485:	c9                   	leaveq 
  804486:	c3                   	retq   

0000000000804487 <ipc_find_env>:
  804487:	55                   	push   %rbp
  804488:	48 89 e5             	mov    %rsp,%rbp
  80448b:	48 83 ec 14          	sub    $0x14,%rsp
  80448f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804492:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804499:	eb 4e                	jmp    8044e9 <ipc_find_env+0x62>
  80449b:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  8044a2:	00 00 00 
  8044a5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8044a8:	48 98                	cltq   
  8044aa:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  8044b1:	48 01 d0             	add    %rdx,%rax
  8044b4:	48 05 d0 00 00 00    	add    $0xd0,%rax
  8044ba:	8b 00                	mov    (%rax),%eax
  8044bc:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  8044bf:	75 24                	jne    8044e5 <ipc_find_env+0x5e>
  8044c1:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  8044c8:	00 00 00 
  8044cb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8044ce:	48 98                	cltq   
  8044d0:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  8044d7:	48 01 d0             	add    %rdx,%rax
  8044da:	48 05 c0 00 00 00    	add    $0xc0,%rax
  8044e0:	8b 40 08             	mov    0x8(%rax),%eax
  8044e3:	eb 12                	jmp    8044f7 <ipc_find_env+0x70>
  8044e5:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8044e9:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  8044f0:	7e a9                	jle    80449b <ipc_find_env+0x14>
  8044f2:	b8 00 00 00 00       	mov    $0x0,%eax
  8044f7:	c9                   	leaveq 
  8044f8:	c3                   	retq   

00000000008044f9 <pageref>:
  8044f9:	55                   	push   %rbp
  8044fa:	48 89 e5             	mov    %rsp,%rbp
  8044fd:	48 83 ec 18          	sub    $0x18,%rsp
  804501:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804505:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804509:	48 c1 e8 15          	shr    $0x15,%rax
  80450d:	48 89 c2             	mov    %rax,%rdx
  804510:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  804517:	01 00 00 
  80451a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80451e:	83 e0 01             	and    $0x1,%eax
  804521:	48 85 c0             	test   %rax,%rax
  804524:	75 07                	jne    80452d <pageref+0x34>
  804526:	b8 00 00 00 00       	mov    $0x0,%eax
  80452b:	eb 53                	jmp    804580 <pageref+0x87>
  80452d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804531:	48 c1 e8 0c          	shr    $0xc,%rax
  804535:	48 89 c2             	mov    %rax,%rdx
  804538:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80453f:	01 00 00 
  804542:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804546:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80454a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80454e:	83 e0 01             	and    $0x1,%eax
  804551:	48 85 c0             	test   %rax,%rax
  804554:	75 07                	jne    80455d <pageref+0x64>
  804556:	b8 00 00 00 00       	mov    $0x0,%eax
  80455b:	eb 23                	jmp    804580 <pageref+0x87>
  80455d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804561:	48 c1 e8 0c          	shr    $0xc,%rax
  804565:	48 89 c2             	mov    %rax,%rdx
  804568:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  80456f:	00 00 00 
  804572:	48 c1 e2 04          	shl    $0x4,%rdx
  804576:	48 01 d0             	add    %rdx,%rax
  804579:	0f b7 40 08          	movzwl 0x8(%rax),%eax
  80457d:	0f b7 c0             	movzwl %ax,%eax
  804580:	c9                   	leaveq 
  804581:	c3                   	retq   
