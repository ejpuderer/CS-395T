
obj/user/forktree:     file format elf64-x86-64


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
  80003c:	e8 24 01 00 00       	callq  800165 <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <forkchild>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 20          	sub    $0x20,%rsp
  80004b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80004f:	89 f0                	mov    %esi,%eax
  800051:	88 45 e4             	mov    %al,-0x1c(%rbp)
  800054:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800058:	48 89 c7             	mov    %rax,%rdi
  80005b:	48 b8 79 0e 80 00 00 	movabs $0x800e79,%rax
  800062:	00 00 00 
  800065:	ff d0                	callq  *%rax
  800067:	83 f8 02             	cmp    $0x2,%eax
  80006a:	7f 65                	jg     8000d1 <forkchild+0x8e>
  80006c:	0f be 4d e4          	movsbl -0x1c(%rbp),%ecx
  800070:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800074:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  800078:	41 89 c8             	mov    %ecx,%r8d
  80007b:	48 89 d1             	mov    %rdx,%rcx
  80007e:	48 ba 60 48 80 00 00 	movabs $0x804860,%rdx
  800085:	00 00 00 
  800088:	be 04 00 00 00       	mov    $0x4,%esi
  80008d:	48 89 c7             	mov    %rax,%rdi
  800090:	b8 00 00 00 00       	mov    $0x0,%eax
  800095:	49 b9 98 0d 80 00 00 	movabs $0x800d98,%r9
  80009c:	00 00 00 
  80009f:	41 ff d1             	callq  *%r9
  8000a2:	48 b8 92 20 80 00 00 	movabs $0x802092,%rax
  8000a9:	00 00 00 
  8000ac:	ff d0                	callq  *%rax
  8000ae:	85 c0                	test   %eax,%eax
  8000b0:	75 1f                	jne    8000d1 <forkchild+0x8e>
  8000b2:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8000b6:	48 89 c7             	mov    %rax,%rdi
  8000b9:	48 b8 d3 00 80 00 00 	movabs $0x8000d3,%rax
  8000c0:	00 00 00 
  8000c3:	ff d0                	callq  *%rax
  8000c5:	48 b8 e8 01 80 00 00 	movabs $0x8001e8,%rax
  8000cc:	00 00 00 
  8000cf:	ff d0                	callq  *%rax
  8000d1:	c9                   	leaveq 
  8000d2:	c3                   	retq   

00000000008000d3 <forktree>:
  8000d3:	55                   	push   %rbp
  8000d4:	48 89 e5             	mov    %rsp,%rbp
  8000d7:	48 83 ec 10          	sub    $0x10,%rsp
  8000db:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8000df:	48 b8 98 17 80 00 00 	movabs $0x801798,%rax
  8000e6:	00 00 00 
  8000e9:	ff d0                	callq  *%rax
  8000eb:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8000ef:	89 c6                	mov    %eax,%esi
  8000f1:	48 bf 65 48 80 00 00 	movabs $0x804865,%rdi
  8000f8:	00 00 00 
  8000fb:	b8 00 00 00 00       	mov    $0x0,%eax
  800100:	48 b9 30 03 80 00 00 	movabs $0x800330,%rcx
  800107:	00 00 00 
  80010a:	ff d1                	callq  *%rcx
  80010c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800110:	be 30 00 00 00       	mov    $0x30,%esi
  800115:	48 89 c7             	mov    %rax,%rdi
  800118:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  80011f:	00 00 00 
  800122:	ff d0                	callq  *%rax
  800124:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800128:	be 31 00 00 00       	mov    $0x31,%esi
  80012d:	48 89 c7             	mov    %rax,%rdi
  800130:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800137:	00 00 00 
  80013a:	ff d0                	callq  *%rax
  80013c:	c9                   	leaveq 
  80013d:	c3                   	retq   

000000000080013e <umain>:
  80013e:	55                   	push   %rbp
  80013f:	48 89 e5             	mov    %rsp,%rbp
  800142:	48 83 ec 10          	sub    $0x10,%rsp
  800146:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800149:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80014d:	48 bf 76 48 80 00 00 	movabs $0x804876,%rdi
  800154:	00 00 00 
  800157:	48 b8 d3 00 80 00 00 	movabs $0x8000d3,%rax
  80015e:	00 00 00 
  800161:	ff d0                	callq  *%rax
  800163:	c9                   	leaveq 
  800164:	c3                   	retq   

0000000000800165 <libmain>:
  800165:	55                   	push   %rbp
  800166:	48 89 e5             	mov    %rsp,%rbp
  800169:	48 83 ec 10          	sub    $0x10,%rsp
  80016d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800170:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800174:	48 b8 98 17 80 00 00 	movabs $0x801798,%rax
  80017b:	00 00 00 
  80017e:	ff d0                	callq  *%rax
  800180:	25 ff 03 00 00       	and    $0x3ff,%eax
  800185:	48 98                	cltq   
  800187:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  80018e:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  800195:	00 00 00 
  800198:	48 01 c2             	add    %rax,%rdx
  80019b:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8001a2:	00 00 00 
  8001a5:	48 89 10             	mov    %rdx,(%rax)
  8001a8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8001ac:	7e 14                	jle    8001c2 <libmain+0x5d>
  8001ae:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8001b2:	48 8b 10             	mov    (%rax),%rdx
  8001b5:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8001bc:	00 00 00 
  8001bf:	48 89 10             	mov    %rdx,(%rax)
  8001c2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8001c6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8001c9:	48 89 d6             	mov    %rdx,%rsi
  8001cc:	89 c7                	mov    %eax,%edi
  8001ce:	48 b8 3e 01 80 00 00 	movabs $0x80013e,%rax
  8001d5:	00 00 00 
  8001d8:	ff d0                	callq  *%rax
  8001da:	48 b8 e8 01 80 00 00 	movabs $0x8001e8,%rax
  8001e1:	00 00 00 
  8001e4:	ff d0                	callq  *%rax
  8001e6:	c9                   	leaveq 
  8001e7:	c3                   	retq   

00000000008001e8 <exit>:
  8001e8:	55                   	push   %rbp
  8001e9:	48 89 e5             	mov    %rsp,%rbp
  8001ec:	48 b8 48 26 80 00 00 	movabs $0x802648,%rax
  8001f3:	00 00 00 
  8001f6:	ff d0                	callq  *%rax
  8001f8:	bf 00 00 00 00       	mov    $0x0,%edi
  8001fd:	48 b8 54 17 80 00 00 	movabs $0x801754,%rax
  800204:	00 00 00 
  800207:	ff d0                	callq  *%rax
  800209:	5d                   	pop    %rbp
  80020a:	c3                   	retq   

000000000080020b <putch>:
  80020b:	55                   	push   %rbp
  80020c:	48 89 e5             	mov    %rsp,%rbp
  80020f:	48 83 ec 10          	sub    $0x10,%rsp
  800213:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800216:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80021a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80021e:	8b 00                	mov    (%rax),%eax
  800220:	8d 48 01             	lea    0x1(%rax),%ecx
  800223:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800227:	89 0a                	mov    %ecx,(%rdx)
  800229:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80022c:	89 d1                	mov    %edx,%ecx
  80022e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800232:	48 98                	cltq   
  800234:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  800238:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80023c:	8b 00                	mov    (%rax),%eax
  80023e:	3d ff 00 00 00       	cmp    $0xff,%eax
  800243:	75 2c                	jne    800271 <putch+0x66>
  800245:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800249:	8b 00                	mov    (%rax),%eax
  80024b:	48 98                	cltq   
  80024d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800251:	48 83 c2 08          	add    $0x8,%rdx
  800255:	48 89 c6             	mov    %rax,%rsi
  800258:	48 89 d7             	mov    %rdx,%rdi
  80025b:	48 b8 cc 16 80 00 00 	movabs $0x8016cc,%rax
  800262:	00 00 00 
  800265:	ff d0                	callq  *%rax
  800267:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80026b:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  800271:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800275:	8b 40 04             	mov    0x4(%rax),%eax
  800278:	8d 50 01             	lea    0x1(%rax),%edx
  80027b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80027f:	89 50 04             	mov    %edx,0x4(%rax)
  800282:	c9                   	leaveq 
  800283:	c3                   	retq   

0000000000800284 <vcprintf>:
  800284:	55                   	push   %rbp
  800285:	48 89 e5             	mov    %rsp,%rbp
  800288:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  80028f:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  800296:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  80029d:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  8002a4:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  8002ab:	48 8b 0a             	mov    (%rdx),%rcx
  8002ae:	48 89 08             	mov    %rcx,(%rax)
  8002b1:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8002b5:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8002b9:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8002bd:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8002c1:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  8002c8:	00 00 00 
  8002cb:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  8002d2:	00 00 00 
  8002d5:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  8002dc:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  8002e3:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  8002ea:	48 89 c6             	mov    %rax,%rsi
  8002ed:	48 bf 0b 02 80 00 00 	movabs $0x80020b,%rdi
  8002f4:	00 00 00 
  8002f7:	48 b8 e3 06 80 00 00 	movabs $0x8006e3,%rax
  8002fe:	00 00 00 
  800301:	ff d0                	callq  *%rax
  800303:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  800309:	48 98                	cltq   
  80030b:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  800312:	48 83 c2 08          	add    $0x8,%rdx
  800316:	48 89 c6             	mov    %rax,%rsi
  800319:	48 89 d7             	mov    %rdx,%rdi
  80031c:	48 b8 cc 16 80 00 00 	movabs $0x8016cc,%rax
  800323:	00 00 00 
  800326:	ff d0                	callq  *%rax
  800328:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  80032e:	c9                   	leaveq 
  80032f:	c3                   	retq   

0000000000800330 <cprintf>:
  800330:	55                   	push   %rbp
  800331:	48 89 e5             	mov    %rsp,%rbp
  800334:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  80033b:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  800342:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  800349:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800350:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800357:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  80035e:	84 c0                	test   %al,%al
  800360:	74 20                	je     800382 <cprintf+0x52>
  800362:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800366:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80036a:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  80036e:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800372:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800376:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  80037a:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  80037e:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800382:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800389:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  800390:	00 00 00 
  800393:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  80039a:	00 00 00 
  80039d:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8003a1:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8003a8:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8003af:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8003b6:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  8003bd:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8003c4:	48 8b 0a             	mov    (%rdx),%rcx
  8003c7:	48 89 08             	mov    %rcx,(%rax)
  8003ca:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8003ce:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8003d2:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8003d6:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8003da:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  8003e1:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8003e8:	48 89 d6             	mov    %rdx,%rsi
  8003eb:	48 89 c7             	mov    %rax,%rdi
  8003ee:	48 b8 84 02 80 00 00 	movabs $0x800284,%rax
  8003f5:	00 00 00 
  8003f8:	ff d0                	callq  *%rax
  8003fa:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  800400:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  800406:	c9                   	leaveq 
  800407:	c3                   	retq   

0000000000800408 <printnum>:
  800408:	55                   	push   %rbp
  800409:	48 89 e5             	mov    %rsp,%rbp
  80040c:	53                   	push   %rbx
  80040d:	48 83 ec 38          	sub    $0x38,%rsp
  800411:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800415:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800419:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80041d:	89 4d d4             	mov    %ecx,-0x2c(%rbp)
  800420:	44 89 45 d0          	mov    %r8d,-0x30(%rbp)
  800424:	44 89 4d cc          	mov    %r9d,-0x34(%rbp)
  800428:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  80042b:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  80042f:	77 3b                	ja     80046c <printnum+0x64>
  800431:	8b 45 d0             	mov    -0x30(%rbp),%eax
  800434:	44 8d 40 ff          	lea    -0x1(%rax),%r8d
  800438:	8b 5d d4             	mov    -0x2c(%rbp),%ebx
  80043b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80043f:	ba 00 00 00 00       	mov    $0x0,%edx
  800444:	48 f7 f3             	div    %rbx
  800447:	48 89 c2             	mov    %rax,%rdx
  80044a:	8b 7d cc             	mov    -0x34(%rbp),%edi
  80044d:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  800450:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
  800454:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800458:	41 89 f9             	mov    %edi,%r9d
  80045b:	48 89 c7             	mov    %rax,%rdi
  80045e:	48 b8 08 04 80 00 00 	movabs $0x800408,%rax
  800465:	00 00 00 
  800468:	ff d0                	callq  *%rax
  80046a:	eb 1e                	jmp    80048a <printnum+0x82>
  80046c:	eb 12                	jmp    800480 <printnum+0x78>
  80046e:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  800472:	8b 55 cc             	mov    -0x34(%rbp),%edx
  800475:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800479:	48 89 ce             	mov    %rcx,%rsi
  80047c:	89 d7                	mov    %edx,%edi
  80047e:	ff d0                	callq  *%rax
  800480:	83 6d d0 01          	subl   $0x1,-0x30(%rbp)
  800484:	83 7d d0 00          	cmpl   $0x0,-0x30(%rbp)
  800488:	7f e4                	jg     80046e <printnum+0x66>
  80048a:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  80048d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800491:	ba 00 00 00 00       	mov    $0x0,%edx
  800496:	48 f7 f1             	div    %rcx
  800499:	48 89 d0             	mov    %rdx,%rax
  80049c:	48 ba 90 4a 80 00 00 	movabs $0x804a90,%rdx
  8004a3:	00 00 00 
  8004a6:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
  8004aa:	0f be d0             	movsbl %al,%edx
  8004ad:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8004b1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8004b5:	48 89 ce             	mov    %rcx,%rsi
  8004b8:	89 d7                	mov    %edx,%edi
  8004ba:	ff d0                	callq  *%rax
  8004bc:	48 83 c4 38          	add    $0x38,%rsp
  8004c0:	5b                   	pop    %rbx
  8004c1:	5d                   	pop    %rbp
  8004c2:	c3                   	retq   

00000000008004c3 <getuint>:
  8004c3:	55                   	push   %rbp
  8004c4:	48 89 e5             	mov    %rsp,%rbp
  8004c7:	48 83 ec 1c          	sub    $0x1c,%rsp
  8004cb:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8004cf:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8004d2:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8004d6:	7e 52                	jle    80052a <getuint+0x67>
  8004d8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8004dc:	8b 00                	mov    (%rax),%eax
  8004de:	83 f8 30             	cmp    $0x30,%eax
  8004e1:	73 24                	jae    800507 <getuint+0x44>
  8004e3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8004e7:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8004eb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8004ef:	8b 00                	mov    (%rax),%eax
  8004f1:	89 c0                	mov    %eax,%eax
  8004f3:	48 01 d0             	add    %rdx,%rax
  8004f6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8004fa:	8b 12                	mov    (%rdx),%edx
  8004fc:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8004ff:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800503:	89 0a                	mov    %ecx,(%rdx)
  800505:	eb 17                	jmp    80051e <getuint+0x5b>
  800507:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80050b:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80050f:	48 89 d0             	mov    %rdx,%rax
  800512:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800516:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80051a:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80051e:	48 8b 00             	mov    (%rax),%rax
  800521:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800525:	e9 a3 00 00 00       	jmpq   8005cd <getuint+0x10a>
  80052a:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  80052e:	74 4f                	je     80057f <getuint+0xbc>
  800530:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800534:	8b 00                	mov    (%rax),%eax
  800536:	83 f8 30             	cmp    $0x30,%eax
  800539:	73 24                	jae    80055f <getuint+0x9c>
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
  80055d:	eb 17                	jmp    800576 <getuint+0xb3>
  80055f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800563:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800567:	48 89 d0             	mov    %rdx,%rax
  80056a:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  80056e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800572:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800576:	48 8b 00             	mov    (%rax),%rax
  800579:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80057d:	eb 4e                	jmp    8005cd <getuint+0x10a>
  80057f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800583:	8b 00                	mov    (%rax),%eax
  800585:	83 f8 30             	cmp    $0x30,%eax
  800588:	73 24                	jae    8005ae <getuint+0xeb>
  80058a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80058e:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800592:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800596:	8b 00                	mov    (%rax),%eax
  800598:	89 c0                	mov    %eax,%eax
  80059a:	48 01 d0             	add    %rdx,%rax
  80059d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8005a1:	8b 12                	mov    (%rdx),%edx
  8005a3:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8005a6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8005aa:	89 0a                	mov    %ecx,(%rdx)
  8005ac:	eb 17                	jmp    8005c5 <getuint+0x102>
  8005ae:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005b2:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8005b6:	48 89 d0             	mov    %rdx,%rax
  8005b9:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8005bd:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8005c1:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8005c5:	8b 00                	mov    (%rax),%eax
  8005c7:	89 c0                	mov    %eax,%eax
  8005c9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8005cd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8005d1:	c9                   	leaveq 
  8005d2:	c3                   	retq   

00000000008005d3 <getint>:
  8005d3:	55                   	push   %rbp
  8005d4:	48 89 e5             	mov    %rsp,%rbp
  8005d7:	48 83 ec 1c          	sub    $0x1c,%rsp
  8005db:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8005df:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8005e2:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8005e6:	7e 52                	jle    80063a <getint+0x67>
  8005e8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005ec:	8b 00                	mov    (%rax),%eax
  8005ee:	83 f8 30             	cmp    $0x30,%eax
  8005f1:	73 24                	jae    800617 <getint+0x44>
  8005f3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005f7:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8005fb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005ff:	8b 00                	mov    (%rax),%eax
  800601:	89 c0                	mov    %eax,%eax
  800603:	48 01 d0             	add    %rdx,%rax
  800606:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80060a:	8b 12                	mov    (%rdx),%edx
  80060c:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80060f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800613:	89 0a                	mov    %ecx,(%rdx)
  800615:	eb 17                	jmp    80062e <getint+0x5b>
  800617:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80061b:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80061f:	48 89 d0             	mov    %rdx,%rax
  800622:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800626:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80062a:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80062e:	48 8b 00             	mov    (%rax),%rax
  800631:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800635:	e9 a3 00 00 00       	jmpq   8006dd <getint+0x10a>
  80063a:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  80063e:	74 4f                	je     80068f <getint+0xbc>
  800640:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800644:	8b 00                	mov    (%rax),%eax
  800646:	83 f8 30             	cmp    $0x30,%eax
  800649:	73 24                	jae    80066f <getint+0x9c>
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
  80066d:	eb 17                	jmp    800686 <getint+0xb3>
  80066f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800673:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800677:	48 89 d0             	mov    %rdx,%rax
  80067a:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  80067e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800682:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800686:	48 8b 00             	mov    (%rax),%rax
  800689:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80068d:	eb 4e                	jmp    8006dd <getint+0x10a>
  80068f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800693:	8b 00                	mov    (%rax),%eax
  800695:	83 f8 30             	cmp    $0x30,%eax
  800698:	73 24                	jae    8006be <getint+0xeb>
  80069a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80069e:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8006a2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006a6:	8b 00                	mov    (%rax),%eax
  8006a8:	89 c0                	mov    %eax,%eax
  8006aa:	48 01 d0             	add    %rdx,%rax
  8006ad:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006b1:	8b 12                	mov    (%rdx),%edx
  8006b3:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8006b6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006ba:	89 0a                	mov    %ecx,(%rdx)
  8006bc:	eb 17                	jmp    8006d5 <getint+0x102>
  8006be:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006c2:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8006c6:	48 89 d0             	mov    %rdx,%rax
  8006c9:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8006cd:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006d1:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8006d5:	8b 00                	mov    (%rax),%eax
  8006d7:	48 98                	cltq   
  8006d9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8006dd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8006e1:	c9                   	leaveq 
  8006e2:	c3                   	retq   

00000000008006e3 <vprintfmt>:
  8006e3:	55                   	push   %rbp
  8006e4:	48 89 e5             	mov    %rsp,%rbp
  8006e7:	41 54                	push   %r12
  8006e9:	53                   	push   %rbx
  8006ea:	48 83 ec 60          	sub    $0x60,%rsp
  8006ee:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  8006f2:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  8006f6:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8006fa:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  8006fe:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800702:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  800706:	48 8b 0a             	mov    (%rdx),%rcx
  800709:	48 89 08             	mov    %rcx,(%rax)
  80070c:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800710:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800714:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800718:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80071c:	eb 17                	jmp    800735 <vprintfmt+0x52>
  80071e:	85 db                	test   %ebx,%ebx
  800720:	0f 84 cc 04 00 00    	je     800bf2 <vprintfmt+0x50f>
  800726:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  80072a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80072e:	48 89 d6             	mov    %rdx,%rsi
  800731:	89 df                	mov    %ebx,%edi
  800733:	ff d0                	callq  *%rax
  800735:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800739:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80073d:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800741:	0f b6 00             	movzbl (%rax),%eax
  800744:	0f b6 d8             	movzbl %al,%ebx
  800747:	83 fb 25             	cmp    $0x25,%ebx
  80074a:	75 d2                	jne    80071e <vprintfmt+0x3b>
  80074c:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  800750:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  800757:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  80075e:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800765:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  80076c:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800770:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800774:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800778:	0f b6 00             	movzbl (%rax),%eax
  80077b:	0f b6 d8             	movzbl %al,%ebx
  80077e:	8d 43 dd             	lea    -0x23(%rbx),%eax
  800781:	83 f8 55             	cmp    $0x55,%eax
  800784:	0f 87 34 04 00 00    	ja     800bbe <vprintfmt+0x4db>
  80078a:	89 c0                	mov    %eax,%eax
  80078c:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800793:	00 
  800794:	48 b8 b8 4a 80 00 00 	movabs $0x804ab8,%rax
  80079b:	00 00 00 
  80079e:	48 01 d0             	add    %rdx,%rax
  8007a1:	48 8b 00             	mov    (%rax),%rax
  8007a4:	ff e0                	jmpq   *%rax
  8007a6:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  8007aa:	eb c0                	jmp    80076c <vprintfmt+0x89>
  8007ac:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  8007b0:	eb ba                	jmp    80076c <vprintfmt+0x89>
  8007b2:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  8007b9:	8b 55 d8             	mov    -0x28(%rbp),%edx
  8007bc:	89 d0                	mov    %edx,%eax
  8007be:	c1 e0 02             	shl    $0x2,%eax
  8007c1:	01 d0                	add    %edx,%eax
  8007c3:	01 c0                	add    %eax,%eax
  8007c5:	01 d8                	add    %ebx,%eax
  8007c7:	83 e8 30             	sub    $0x30,%eax
  8007ca:	89 45 d8             	mov    %eax,-0x28(%rbp)
  8007cd:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8007d1:	0f b6 00             	movzbl (%rax),%eax
  8007d4:	0f be d8             	movsbl %al,%ebx
  8007d7:	83 fb 2f             	cmp    $0x2f,%ebx
  8007da:	7e 0c                	jle    8007e8 <vprintfmt+0x105>
  8007dc:	83 fb 39             	cmp    $0x39,%ebx
  8007df:	7f 07                	jg     8007e8 <vprintfmt+0x105>
  8007e1:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  8007e6:	eb d1                	jmp    8007b9 <vprintfmt+0xd6>
  8007e8:	eb 58                	jmp    800842 <vprintfmt+0x15f>
  8007ea:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8007ed:	83 f8 30             	cmp    $0x30,%eax
  8007f0:	73 17                	jae    800809 <vprintfmt+0x126>
  8007f2:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8007f6:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8007f9:	89 c0                	mov    %eax,%eax
  8007fb:	48 01 d0             	add    %rdx,%rax
  8007fe:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800801:	83 c2 08             	add    $0x8,%edx
  800804:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800807:	eb 0f                	jmp    800818 <vprintfmt+0x135>
  800809:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  80080d:	48 89 d0             	mov    %rdx,%rax
  800810:	48 83 c2 08          	add    $0x8,%rdx
  800814:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800818:	8b 00                	mov    (%rax),%eax
  80081a:	89 45 d8             	mov    %eax,-0x28(%rbp)
  80081d:	eb 23                	jmp    800842 <vprintfmt+0x15f>
  80081f:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800823:	79 0c                	jns    800831 <vprintfmt+0x14e>
  800825:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  80082c:	e9 3b ff ff ff       	jmpq   80076c <vprintfmt+0x89>
  800831:	e9 36 ff ff ff       	jmpq   80076c <vprintfmt+0x89>
  800836:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  80083d:	e9 2a ff ff ff       	jmpq   80076c <vprintfmt+0x89>
  800842:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800846:	79 12                	jns    80085a <vprintfmt+0x177>
  800848:	8b 45 d8             	mov    -0x28(%rbp),%eax
  80084b:	89 45 dc             	mov    %eax,-0x24(%rbp)
  80084e:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800855:	e9 12 ff ff ff       	jmpq   80076c <vprintfmt+0x89>
  80085a:	e9 0d ff ff ff       	jmpq   80076c <vprintfmt+0x89>
  80085f:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  800863:	e9 04 ff ff ff       	jmpq   80076c <vprintfmt+0x89>
  800868:	8b 45 b8             	mov    -0x48(%rbp),%eax
  80086b:	83 f8 30             	cmp    $0x30,%eax
  80086e:	73 17                	jae    800887 <vprintfmt+0x1a4>
  800870:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800874:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800877:	89 c0                	mov    %eax,%eax
  800879:	48 01 d0             	add    %rdx,%rax
  80087c:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80087f:	83 c2 08             	add    $0x8,%edx
  800882:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800885:	eb 0f                	jmp    800896 <vprintfmt+0x1b3>
  800887:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  80088b:	48 89 d0             	mov    %rdx,%rax
  80088e:	48 83 c2 08          	add    $0x8,%rdx
  800892:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800896:	8b 10                	mov    (%rax),%edx
  800898:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  80089c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8008a0:	48 89 ce             	mov    %rcx,%rsi
  8008a3:	89 d7                	mov    %edx,%edi
  8008a5:	ff d0                	callq  *%rax
  8008a7:	e9 40 03 00 00       	jmpq   800bec <vprintfmt+0x509>
  8008ac:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8008af:	83 f8 30             	cmp    $0x30,%eax
  8008b2:	73 17                	jae    8008cb <vprintfmt+0x1e8>
  8008b4:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8008b8:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8008bb:	89 c0                	mov    %eax,%eax
  8008bd:	48 01 d0             	add    %rdx,%rax
  8008c0:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8008c3:	83 c2 08             	add    $0x8,%edx
  8008c6:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8008c9:	eb 0f                	jmp    8008da <vprintfmt+0x1f7>
  8008cb:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  8008cf:	48 89 d0             	mov    %rdx,%rax
  8008d2:	48 83 c2 08          	add    $0x8,%rdx
  8008d6:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8008da:	8b 18                	mov    (%rax),%ebx
  8008dc:	85 db                	test   %ebx,%ebx
  8008de:	79 02                	jns    8008e2 <vprintfmt+0x1ff>
  8008e0:	f7 db                	neg    %ebx
  8008e2:	83 fb 15             	cmp    $0x15,%ebx
  8008e5:	7f 16                	jg     8008fd <vprintfmt+0x21a>
  8008e7:	48 b8 e0 49 80 00 00 	movabs $0x8049e0,%rax
  8008ee:	00 00 00 
  8008f1:	48 63 d3             	movslq %ebx,%rdx
  8008f4:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  8008f8:	4d 85 e4             	test   %r12,%r12
  8008fb:	75 2e                	jne    80092b <vprintfmt+0x248>
  8008fd:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800901:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800905:	89 d9                	mov    %ebx,%ecx
  800907:	48 ba a1 4a 80 00 00 	movabs $0x804aa1,%rdx
  80090e:	00 00 00 
  800911:	48 89 c7             	mov    %rax,%rdi
  800914:	b8 00 00 00 00       	mov    $0x0,%eax
  800919:	49 b8 fb 0b 80 00 00 	movabs $0x800bfb,%r8
  800920:	00 00 00 
  800923:	41 ff d0             	callq  *%r8
  800926:	e9 c1 02 00 00       	jmpq   800bec <vprintfmt+0x509>
  80092b:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  80092f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800933:	4c 89 e1             	mov    %r12,%rcx
  800936:	48 ba aa 4a 80 00 00 	movabs $0x804aaa,%rdx
  80093d:	00 00 00 
  800940:	48 89 c7             	mov    %rax,%rdi
  800943:	b8 00 00 00 00       	mov    $0x0,%eax
  800948:	49 b8 fb 0b 80 00 00 	movabs $0x800bfb,%r8
  80094f:	00 00 00 
  800952:	41 ff d0             	callq  *%r8
  800955:	e9 92 02 00 00       	jmpq   800bec <vprintfmt+0x509>
  80095a:	8b 45 b8             	mov    -0x48(%rbp),%eax
  80095d:	83 f8 30             	cmp    $0x30,%eax
  800960:	73 17                	jae    800979 <vprintfmt+0x296>
  800962:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800966:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800969:	89 c0                	mov    %eax,%eax
  80096b:	48 01 d0             	add    %rdx,%rax
  80096e:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800971:	83 c2 08             	add    $0x8,%edx
  800974:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800977:	eb 0f                	jmp    800988 <vprintfmt+0x2a5>
  800979:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  80097d:	48 89 d0             	mov    %rdx,%rax
  800980:	48 83 c2 08          	add    $0x8,%rdx
  800984:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800988:	4c 8b 20             	mov    (%rax),%r12
  80098b:	4d 85 e4             	test   %r12,%r12
  80098e:	75 0a                	jne    80099a <vprintfmt+0x2b7>
  800990:	49 bc ad 4a 80 00 00 	movabs $0x804aad,%r12
  800997:	00 00 00 
  80099a:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  80099e:	7e 3f                	jle    8009df <vprintfmt+0x2fc>
  8009a0:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  8009a4:	74 39                	je     8009df <vprintfmt+0x2fc>
  8009a6:	8b 45 d8             	mov    -0x28(%rbp),%eax
  8009a9:	48 98                	cltq   
  8009ab:	48 89 c6             	mov    %rax,%rsi
  8009ae:	4c 89 e7             	mov    %r12,%rdi
  8009b1:	48 b8 a7 0e 80 00 00 	movabs $0x800ea7,%rax
  8009b8:	00 00 00 
  8009bb:	ff d0                	callq  *%rax
  8009bd:	29 45 dc             	sub    %eax,-0x24(%rbp)
  8009c0:	eb 17                	jmp    8009d9 <vprintfmt+0x2f6>
  8009c2:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  8009c6:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  8009ca:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8009ce:	48 89 ce             	mov    %rcx,%rsi
  8009d1:	89 d7                	mov    %edx,%edi
  8009d3:	ff d0                	callq  *%rax
  8009d5:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  8009d9:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8009dd:	7f e3                	jg     8009c2 <vprintfmt+0x2df>
  8009df:	eb 37                	jmp    800a18 <vprintfmt+0x335>
  8009e1:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  8009e5:	74 1e                	je     800a05 <vprintfmt+0x322>
  8009e7:	83 fb 1f             	cmp    $0x1f,%ebx
  8009ea:	7e 05                	jle    8009f1 <vprintfmt+0x30e>
  8009ec:	83 fb 7e             	cmp    $0x7e,%ebx
  8009ef:	7e 14                	jle    800a05 <vprintfmt+0x322>
  8009f1:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8009f5:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8009f9:	48 89 d6             	mov    %rdx,%rsi
  8009fc:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800a01:	ff d0                	callq  *%rax
  800a03:	eb 0f                	jmp    800a14 <vprintfmt+0x331>
  800a05:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800a09:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a0d:	48 89 d6             	mov    %rdx,%rsi
  800a10:	89 df                	mov    %ebx,%edi
  800a12:	ff d0                	callq  *%rax
  800a14:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800a18:	4c 89 e0             	mov    %r12,%rax
  800a1b:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800a1f:	0f b6 00             	movzbl (%rax),%eax
  800a22:	0f be d8             	movsbl %al,%ebx
  800a25:	85 db                	test   %ebx,%ebx
  800a27:	74 10                	je     800a39 <vprintfmt+0x356>
  800a29:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800a2d:	78 b2                	js     8009e1 <vprintfmt+0x2fe>
  800a2f:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800a33:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800a37:	79 a8                	jns    8009e1 <vprintfmt+0x2fe>
  800a39:	eb 16                	jmp    800a51 <vprintfmt+0x36e>
  800a3b:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800a3f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a43:	48 89 d6             	mov    %rdx,%rsi
  800a46:	bf 20 00 00 00       	mov    $0x20,%edi
  800a4b:	ff d0                	callq  *%rax
  800a4d:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800a51:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800a55:	7f e4                	jg     800a3b <vprintfmt+0x358>
  800a57:	e9 90 01 00 00       	jmpq   800bec <vprintfmt+0x509>
  800a5c:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800a60:	be 03 00 00 00       	mov    $0x3,%esi
  800a65:	48 89 c7             	mov    %rax,%rdi
  800a68:	48 b8 d3 05 80 00 00 	movabs $0x8005d3,%rax
  800a6f:	00 00 00 
  800a72:	ff d0                	callq  *%rax
  800a74:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800a78:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a7c:	48 85 c0             	test   %rax,%rax
  800a7f:	79 1d                	jns    800a9e <vprintfmt+0x3bb>
  800a81:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800a85:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a89:	48 89 d6             	mov    %rdx,%rsi
  800a8c:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800a91:	ff d0                	callq  *%rax
  800a93:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a97:	48 f7 d8             	neg    %rax
  800a9a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800a9e:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800aa5:	e9 d5 00 00 00       	jmpq   800b7f <vprintfmt+0x49c>
  800aaa:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800aae:	be 03 00 00 00       	mov    $0x3,%esi
  800ab3:	48 89 c7             	mov    %rax,%rdi
  800ab6:	48 b8 c3 04 80 00 00 	movabs $0x8004c3,%rax
  800abd:	00 00 00 
  800ac0:	ff d0                	callq  *%rax
  800ac2:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800ac6:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800acd:	e9 ad 00 00 00       	jmpq   800b7f <vprintfmt+0x49c>
  800ad2:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800ad6:	be 03 00 00 00       	mov    $0x3,%esi
  800adb:	48 89 c7             	mov    %rax,%rdi
  800ade:	48 b8 c3 04 80 00 00 	movabs $0x8004c3,%rax
  800ae5:	00 00 00 
  800ae8:	ff d0                	callq  *%rax
  800aea:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800aee:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800af5:	e9 85 00 00 00       	jmpq   800b7f <vprintfmt+0x49c>
  800afa:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800afe:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b02:	48 89 d6             	mov    %rdx,%rsi
  800b05:	bf 30 00 00 00       	mov    $0x30,%edi
  800b0a:	ff d0                	callq  *%rax
  800b0c:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800b10:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b14:	48 89 d6             	mov    %rdx,%rsi
  800b17:	bf 78 00 00 00       	mov    $0x78,%edi
  800b1c:	ff d0                	callq  *%rax
  800b1e:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b21:	83 f8 30             	cmp    $0x30,%eax
  800b24:	73 17                	jae    800b3d <vprintfmt+0x45a>
  800b26:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800b2a:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b2d:	89 c0                	mov    %eax,%eax
  800b2f:	48 01 d0             	add    %rdx,%rax
  800b32:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b35:	83 c2 08             	add    $0x8,%edx
  800b38:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800b3b:	eb 0f                	jmp    800b4c <vprintfmt+0x469>
  800b3d:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800b41:	48 89 d0             	mov    %rdx,%rax
  800b44:	48 83 c2 08          	add    $0x8,%rdx
  800b48:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800b4c:	48 8b 00             	mov    (%rax),%rax
  800b4f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800b53:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800b5a:	eb 23                	jmp    800b7f <vprintfmt+0x49c>
  800b5c:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800b60:	be 03 00 00 00       	mov    $0x3,%esi
  800b65:	48 89 c7             	mov    %rax,%rdi
  800b68:	48 b8 c3 04 80 00 00 	movabs $0x8004c3,%rax
  800b6f:	00 00 00 
  800b72:	ff d0                	callq  *%rax
  800b74:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800b78:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800b7f:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  800b84:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800b87:	8b 7d dc             	mov    -0x24(%rbp),%edi
  800b8a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b8e:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800b92:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b96:	45 89 c1             	mov    %r8d,%r9d
  800b99:	41 89 f8             	mov    %edi,%r8d
  800b9c:	48 89 c7             	mov    %rax,%rdi
  800b9f:	48 b8 08 04 80 00 00 	movabs $0x800408,%rax
  800ba6:	00 00 00 
  800ba9:	ff d0                	callq  *%rax
  800bab:	eb 3f                	jmp    800bec <vprintfmt+0x509>
  800bad:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800bb1:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800bb5:	48 89 d6             	mov    %rdx,%rsi
  800bb8:	89 df                	mov    %ebx,%edi
  800bba:	ff d0                	callq  *%rax
  800bbc:	eb 2e                	jmp    800bec <vprintfmt+0x509>
  800bbe:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800bc2:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800bc6:	48 89 d6             	mov    %rdx,%rsi
  800bc9:	bf 25 00 00 00       	mov    $0x25,%edi
  800bce:	ff d0                	callq  *%rax
  800bd0:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800bd5:	eb 05                	jmp    800bdc <vprintfmt+0x4f9>
  800bd7:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800bdc:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800be0:	48 83 e8 01          	sub    $0x1,%rax
  800be4:	0f b6 00             	movzbl (%rax),%eax
  800be7:	3c 25                	cmp    $0x25,%al
  800be9:	75 ec                	jne    800bd7 <vprintfmt+0x4f4>
  800beb:	90                   	nop
  800bec:	90                   	nop
  800bed:	e9 43 fb ff ff       	jmpq   800735 <vprintfmt+0x52>
  800bf2:	48 83 c4 60          	add    $0x60,%rsp
  800bf6:	5b                   	pop    %rbx
  800bf7:	41 5c                	pop    %r12
  800bf9:	5d                   	pop    %rbp
  800bfa:	c3                   	retq   

0000000000800bfb <printfmt>:
  800bfb:	55                   	push   %rbp
  800bfc:	48 89 e5             	mov    %rsp,%rbp
  800bff:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  800c06:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  800c0d:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  800c14:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800c1b:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800c22:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800c29:	84 c0                	test   %al,%al
  800c2b:	74 20                	je     800c4d <printfmt+0x52>
  800c2d:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800c31:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800c35:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800c39:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800c3d:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800c41:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800c45:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800c49:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800c4d:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  800c54:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  800c5b:	00 00 00 
  800c5e:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  800c65:	00 00 00 
  800c68:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800c6c:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800c73:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800c7a:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  800c81:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  800c88:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800c8f:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  800c96:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  800c9d:	48 89 c7             	mov    %rax,%rdi
  800ca0:	48 b8 e3 06 80 00 00 	movabs $0x8006e3,%rax
  800ca7:	00 00 00 
  800caa:	ff d0                	callq  *%rax
  800cac:	c9                   	leaveq 
  800cad:	c3                   	retq   

0000000000800cae <sprintputch>:
  800cae:	55                   	push   %rbp
  800caf:	48 89 e5             	mov    %rsp,%rbp
  800cb2:	48 83 ec 10          	sub    $0x10,%rsp
  800cb6:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800cb9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800cbd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800cc1:	8b 40 10             	mov    0x10(%rax),%eax
  800cc4:	8d 50 01             	lea    0x1(%rax),%edx
  800cc7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800ccb:	89 50 10             	mov    %edx,0x10(%rax)
  800cce:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800cd2:	48 8b 10             	mov    (%rax),%rdx
  800cd5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800cd9:	48 8b 40 08          	mov    0x8(%rax),%rax
  800cdd:	48 39 c2             	cmp    %rax,%rdx
  800ce0:	73 17                	jae    800cf9 <sprintputch+0x4b>
  800ce2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800ce6:	48 8b 00             	mov    (%rax),%rax
  800ce9:	48 8d 48 01          	lea    0x1(%rax),%rcx
  800ced:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800cf1:	48 89 0a             	mov    %rcx,(%rdx)
  800cf4:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800cf7:	88 10                	mov    %dl,(%rax)
  800cf9:	c9                   	leaveq 
  800cfa:	c3                   	retq   

0000000000800cfb <vsnprintf>:
  800cfb:	55                   	push   %rbp
  800cfc:	48 89 e5             	mov    %rsp,%rbp
  800cff:	48 83 ec 50          	sub    $0x50,%rsp
  800d03:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  800d07:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  800d0a:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  800d0e:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  800d12:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  800d16:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  800d1a:	48 8b 0a             	mov    (%rdx),%rcx
  800d1d:	48 89 08             	mov    %rcx,(%rax)
  800d20:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800d24:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800d28:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800d2c:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800d30:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800d34:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  800d38:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  800d3b:	48 98                	cltq   
  800d3d:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  800d41:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800d45:	48 01 d0             	add    %rdx,%rax
  800d48:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  800d4c:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800d53:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  800d58:	74 06                	je     800d60 <vsnprintf+0x65>
  800d5a:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  800d5e:	7f 07                	jg     800d67 <vsnprintf+0x6c>
  800d60:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800d65:	eb 2f                	jmp    800d96 <vsnprintf+0x9b>
  800d67:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  800d6b:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  800d6f:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  800d73:	48 89 c6             	mov    %rax,%rsi
  800d76:	48 bf ae 0c 80 00 00 	movabs $0x800cae,%rdi
  800d7d:	00 00 00 
  800d80:	48 b8 e3 06 80 00 00 	movabs $0x8006e3,%rax
  800d87:	00 00 00 
  800d8a:	ff d0                	callq  *%rax
  800d8c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800d90:	c6 00 00             	movb   $0x0,(%rax)
  800d93:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800d96:	c9                   	leaveq 
  800d97:	c3                   	retq   

0000000000800d98 <snprintf>:
  800d98:	55                   	push   %rbp
  800d99:	48 89 e5             	mov    %rsp,%rbp
  800d9c:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  800da3:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800daa:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  800db0:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800db7:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800dbe:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800dc5:	84 c0                	test   %al,%al
  800dc7:	74 20                	je     800de9 <snprintf+0x51>
  800dc9:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800dcd:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800dd1:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800dd5:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800dd9:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800ddd:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800de1:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800de5:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800de9:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  800df0:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  800df7:	00 00 00 
  800dfa:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800e01:	00 00 00 
  800e04:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800e08:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800e0f:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800e16:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800e1d:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800e24:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800e2b:	48 8b 0a             	mov    (%rdx),%rcx
  800e2e:	48 89 08             	mov    %rcx,(%rax)
  800e31:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800e35:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800e39:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800e3d:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800e41:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  800e48:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  800e4f:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  800e55:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800e5c:	48 89 c7             	mov    %rax,%rdi
  800e5f:	48 b8 fb 0c 80 00 00 	movabs $0x800cfb,%rax
  800e66:	00 00 00 
  800e69:	ff d0                	callq  *%rax
  800e6b:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  800e71:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  800e77:	c9                   	leaveq 
  800e78:	c3                   	retq   

0000000000800e79 <strlen>:
  800e79:	55                   	push   %rbp
  800e7a:	48 89 e5             	mov    %rsp,%rbp
  800e7d:	48 83 ec 18          	sub    $0x18,%rsp
  800e81:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800e85:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800e8c:	eb 09                	jmp    800e97 <strlen+0x1e>
  800e8e:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800e92:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  800e97:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e9b:	0f b6 00             	movzbl (%rax),%eax
  800e9e:	84 c0                	test   %al,%al
  800ea0:	75 ec                	jne    800e8e <strlen+0x15>
  800ea2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800ea5:	c9                   	leaveq 
  800ea6:	c3                   	retq   

0000000000800ea7 <strnlen>:
  800ea7:	55                   	push   %rbp
  800ea8:	48 89 e5             	mov    %rsp,%rbp
  800eab:	48 83 ec 20          	sub    $0x20,%rsp
  800eaf:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800eb3:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800eb7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800ebe:	eb 0e                	jmp    800ece <strnlen+0x27>
  800ec0:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800ec4:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  800ec9:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  800ece:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  800ed3:	74 0b                	je     800ee0 <strnlen+0x39>
  800ed5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ed9:	0f b6 00             	movzbl (%rax),%eax
  800edc:	84 c0                	test   %al,%al
  800ede:	75 e0                	jne    800ec0 <strnlen+0x19>
  800ee0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800ee3:	c9                   	leaveq 
  800ee4:	c3                   	retq   

0000000000800ee5 <strcpy>:
  800ee5:	55                   	push   %rbp
  800ee6:	48 89 e5             	mov    %rsp,%rbp
  800ee9:	48 83 ec 20          	sub    $0x20,%rsp
  800eed:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800ef1:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800ef5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ef9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800efd:	90                   	nop
  800efe:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f02:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800f06:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  800f0a:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  800f0e:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  800f12:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  800f16:	0f b6 12             	movzbl (%rdx),%edx
  800f19:	88 10                	mov    %dl,(%rax)
  800f1b:	0f b6 00             	movzbl (%rax),%eax
  800f1e:	84 c0                	test   %al,%al
  800f20:	75 dc                	jne    800efe <strcpy+0x19>
  800f22:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800f26:	c9                   	leaveq 
  800f27:	c3                   	retq   

0000000000800f28 <strcat>:
  800f28:	55                   	push   %rbp
  800f29:	48 89 e5             	mov    %rsp,%rbp
  800f2c:	48 83 ec 20          	sub    $0x20,%rsp
  800f30:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800f34:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800f38:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f3c:	48 89 c7             	mov    %rax,%rdi
  800f3f:	48 b8 79 0e 80 00 00 	movabs $0x800e79,%rax
  800f46:	00 00 00 
  800f49:	ff d0                	callq  *%rax
  800f4b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800f4e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800f51:	48 63 d0             	movslq %eax,%rdx
  800f54:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f58:	48 01 c2             	add    %rax,%rdx
  800f5b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800f5f:	48 89 c6             	mov    %rax,%rsi
  800f62:	48 89 d7             	mov    %rdx,%rdi
  800f65:	48 b8 e5 0e 80 00 00 	movabs $0x800ee5,%rax
  800f6c:	00 00 00 
  800f6f:	ff d0                	callq  *%rax
  800f71:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f75:	c9                   	leaveq 
  800f76:	c3                   	retq   

0000000000800f77 <strncpy>:
  800f77:	55                   	push   %rbp
  800f78:	48 89 e5             	mov    %rsp,%rbp
  800f7b:	48 83 ec 28          	sub    $0x28,%rsp
  800f7f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800f83:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800f87:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  800f8b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f8f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  800f93:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  800f9a:	00 
  800f9b:	eb 2a                	jmp    800fc7 <strncpy+0x50>
  800f9d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800fa1:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800fa5:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  800fa9:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  800fad:	0f b6 12             	movzbl (%rdx),%edx
  800fb0:	88 10                	mov    %dl,(%rax)
  800fb2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800fb6:	0f b6 00             	movzbl (%rax),%eax
  800fb9:	84 c0                	test   %al,%al
  800fbb:	74 05                	je     800fc2 <strncpy+0x4b>
  800fbd:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  800fc2:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  800fc7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800fcb:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  800fcf:	72 cc                	jb     800f9d <strncpy+0x26>
  800fd1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800fd5:	c9                   	leaveq 
  800fd6:	c3                   	retq   

0000000000800fd7 <strlcpy>:
  800fd7:	55                   	push   %rbp
  800fd8:	48 89 e5             	mov    %rsp,%rbp
  800fdb:	48 83 ec 28          	sub    $0x28,%rsp
  800fdf:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800fe3:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800fe7:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  800feb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800fef:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800ff3:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  800ff8:	74 3d                	je     801037 <strlcpy+0x60>
  800ffa:	eb 1d                	jmp    801019 <strlcpy+0x42>
  800ffc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801000:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801004:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801008:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80100c:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801010:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  801014:	0f b6 12             	movzbl (%rdx),%edx
  801017:	88 10                	mov    %dl,(%rax)
  801019:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  80101e:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801023:	74 0b                	je     801030 <strlcpy+0x59>
  801025:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801029:	0f b6 00             	movzbl (%rax),%eax
  80102c:	84 c0                	test   %al,%al
  80102e:	75 cc                	jne    800ffc <strlcpy+0x25>
  801030:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801034:	c6 00 00             	movb   $0x0,(%rax)
  801037:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80103b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80103f:	48 29 c2             	sub    %rax,%rdx
  801042:	48 89 d0             	mov    %rdx,%rax
  801045:	c9                   	leaveq 
  801046:	c3                   	retq   

0000000000801047 <strcmp>:
  801047:	55                   	push   %rbp
  801048:	48 89 e5             	mov    %rsp,%rbp
  80104b:	48 83 ec 10          	sub    $0x10,%rsp
  80104f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801053:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801057:	eb 0a                	jmp    801063 <strcmp+0x1c>
  801059:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80105e:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801063:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801067:	0f b6 00             	movzbl (%rax),%eax
  80106a:	84 c0                	test   %al,%al
  80106c:	74 12                	je     801080 <strcmp+0x39>
  80106e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801072:	0f b6 10             	movzbl (%rax),%edx
  801075:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801079:	0f b6 00             	movzbl (%rax),%eax
  80107c:	38 c2                	cmp    %al,%dl
  80107e:	74 d9                	je     801059 <strcmp+0x12>
  801080:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801084:	0f b6 00             	movzbl (%rax),%eax
  801087:	0f b6 d0             	movzbl %al,%edx
  80108a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80108e:	0f b6 00             	movzbl (%rax),%eax
  801091:	0f b6 c0             	movzbl %al,%eax
  801094:	29 c2                	sub    %eax,%edx
  801096:	89 d0                	mov    %edx,%eax
  801098:	c9                   	leaveq 
  801099:	c3                   	retq   

000000000080109a <strncmp>:
  80109a:	55                   	push   %rbp
  80109b:	48 89 e5             	mov    %rsp,%rbp
  80109e:	48 83 ec 18          	sub    $0x18,%rsp
  8010a2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8010a6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8010aa:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8010ae:	eb 0f                	jmp    8010bf <strncmp+0x25>
  8010b0:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  8010b5:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8010ba:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8010bf:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8010c4:	74 1d                	je     8010e3 <strncmp+0x49>
  8010c6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010ca:	0f b6 00             	movzbl (%rax),%eax
  8010cd:	84 c0                	test   %al,%al
  8010cf:	74 12                	je     8010e3 <strncmp+0x49>
  8010d1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010d5:	0f b6 10             	movzbl (%rax),%edx
  8010d8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8010dc:	0f b6 00             	movzbl (%rax),%eax
  8010df:	38 c2                	cmp    %al,%dl
  8010e1:	74 cd                	je     8010b0 <strncmp+0x16>
  8010e3:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8010e8:	75 07                	jne    8010f1 <strncmp+0x57>
  8010ea:	b8 00 00 00 00       	mov    $0x0,%eax
  8010ef:	eb 18                	jmp    801109 <strncmp+0x6f>
  8010f1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010f5:	0f b6 00             	movzbl (%rax),%eax
  8010f8:	0f b6 d0             	movzbl %al,%edx
  8010fb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8010ff:	0f b6 00             	movzbl (%rax),%eax
  801102:	0f b6 c0             	movzbl %al,%eax
  801105:	29 c2                	sub    %eax,%edx
  801107:	89 d0                	mov    %edx,%eax
  801109:	c9                   	leaveq 
  80110a:	c3                   	retq   

000000000080110b <strchr>:
  80110b:	55                   	push   %rbp
  80110c:	48 89 e5             	mov    %rsp,%rbp
  80110f:	48 83 ec 0c          	sub    $0xc,%rsp
  801113:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801117:	89 f0                	mov    %esi,%eax
  801119:	88 45 f4             	mov    %al,-0xc(%rbp)
  80111c:	eb 17                	jmp    801135 <strchr+0x2a>
  80111e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801122:	0f b6 00             	movzbl (%rax),%eax
  801125:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801128:	75 06                	jne    801130 <strchr+0x25>
  80112a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80112e:	eb 15                	jmp    801145 <strchr+0x3a>
  801130:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801135:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801139:	0f b6 00             	movzbl (%rax),%eax
  80113c:	84 c0                	test   %al,%al
  80113e:	75 de                	jne    80111e <strchr+0x13>
  801140:	b8 00 00 00 00       	mov    $0x0,%eax
  801145:	c9                   	leaveq 
  801146:	c3                   	retq   

0000000000801147 <strfind>:
  801147:	55                   	push   %rbp
  801148:	48 89 e5             	mov    %rsp,%rbp
  80114b:	48 83 ec 0c          	sub    $0xc,%rsp
  80114f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801153:	89 f0                	mov    %esi,%eax
  801155:	88 45 f4             	mov    %al,-0xc(%rbp)
  801158:	eb 13                	jmp    80116d <strfind+0x26>
  80115a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80115e:	0f b6 00             	movzbl (%rax),%eax
  801161:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801164:	75 02                	jne    801168 <strfind+0x21>
  801166:	eb 10                	jmp    801178 <strfind+0x31>
  801168:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80116d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801171:	0f b6 00             	movzbl (%rax),%eax
  801174:	84 c0                	test   %al,%al
  801176:	75 e2                	jne    80115a <strfind+0x13>
  801178:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80117c:	c9                   	leaveq 
  80117d:	c3                   	retq   

000000000080117e <memset>:
  80117e:	55                   	push   %rbp
  80117f:	48 89 e5             	mov    %rsp,%rbp
  801182:	48 83 ec 18          	sub    $0x18,%rsp
  801186:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80118a:	89 75 f4             	mov    %esi,-0xc(%rbp)
  80118d:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801191:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801196:	75 06                	jne    80119e <memset+0x20>
  801198:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80119c:	eb 69                	jmp    801207 <memset+0x89>
  80119e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011a2:	83 e0 03             	and    $0x3,%eax
  8011a5:	48 85 c0             	test   %rax,%rax
  8011a8:	75 48                	jne    8011f2 <memset+0x74>
  8011aa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011ae:	83 e0 03             	and    $0x3,%eax
  8011b1:	48 85 c0             	test   %rax,%rax
  8011b4:	75 3c                	jne    8011f2 <memset+0x74>
  8011b6:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  8011bd:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8011c0:	c1 e0 18             	shl    $0x18,%eax
  8011c3:	89 c2                	mov    %eax,%edx
  8011c5:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8011c8:	c1 e0 10             	shl    $0x10,%eax
  8011cb:	09 c2                	or     %eax,%edx
  8011cd:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8011d0:	c1 e0 08             	shl    $0x8,%eax
  8011d3:	09 d0                	or     %edx,%eax
  8011d5:	09 45 f4             	or     %eax,-0xc(%rbp)
  8011d8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011dc:	48 c1 e8 02          	shr    $0x2,%rax
  8011e0:	48 89 c1             	mov    %rax,%rcx
  8011e3:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8011e7:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8011ea:	48 89 d7             	mov    %rdx,%rdi
  8011ed:	fc                   	cld    
  8011ee:	f3 ab                	rep stos %eax,%es:(%rdi)
  8011f0:	eb 11                	jmp    801203 <memset+0x85>
  8011f2:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8011f6:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8011f9:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8011fd:	48 89 d7             	mov    %rdx,%rdi
  801200:	fc                   	cld    
  801201:	f3 aa                	rep stos %al,%es:(%rdi)
  801203:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801207:	c9                   	leaveq 
  801208:	c3                   	retq   

0000000000801209 <memmove>:
  801209:	55                   	push   %rbp
  80120a:	48 89 e5             	mov    %rsp,%rbp
  80120d:	48 83 ec 28          	sub    $0x28,%rsp
  801211:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801215:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801219:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80121d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801221:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801225:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801229:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80122d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801231:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801235:	0f 83 88 00 00 00    	jae    8012c3 <memmove+0xba>
  80123b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80123f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801243:	48 01 d0             	add    %rdx,%rax
  801246:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  80124a:	76 77                	jbe    8012c3 <memmove+0xba>
  80124c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801250:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  801254:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801258:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  80125c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801260:	83 e0 03             	and    $0x3,%eax
  801263:	48 85 c0             	test   %rax,%rax
  801266:	75 3b                	jne    8012a3 <memmove+0x9a>
  801268:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80126c:	83 e0 03             	and    $0x3,%eax
  80126f:	48 85 c0             	test   %rax,%rax
  801272:	75 2f                	jne    8012a3 <memmove+0x9a>
  801274:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801278:	83 e0 03             	and    $0x3,%eax
  80127b:	48 85 c0             	test   %rax,%rax
  80127e:	75 23                	jne    8012a3 <memmove+0x9a>
  801280:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801284:	48 83 e8 04          	sub    $0x4,%rax
  801288:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80128c:	48 83 ea 04          	sub    $0x4,%rdx
  801290:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801294:	48 c1 e9 02          	shr    $0x2,%rcx
  801298:	48 89 c7             	mov    %rax,%rdi
  80129b:	48 89 d6             	mov    %rdx,%rsi
  80129e:	fd                   	std    
  80129f:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  8012a1:	eb 1d                	jmp    8012c0 <memmove+0xb7>
  8012a3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012a7:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8012ab:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012af:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  8012b3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8012b7:	48 89 d7             	mov    %rdx,%rdi
  8012ba:	48 89 c1             	mov    %rax,%rcx
  8012bd:	fd                   	std    
  8012be:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  8012c0:	fc                   	cld    
  8012c1:	eb 57                	jmp    80131a <memmove+0x111>
  8012c3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012c7:	83 e0 03             	and    $0x3,%eax
  8012ca:	48 85 c0             	test   %rax,%rax
  8012cd:	75 36                	jne    801305 <memmove+0xfc>
  8012cf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012d3:	83 e0 03             	and    $0x3,%eax
  8012d6:	48 85 c0             	test   %rax,%rax
  8012d9:	75 2a                	jne    801305 <memmove+0xfc>
  8012db:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8012df:	83 e0 03             	and    $0x3,%eax
  8012e2:	48 85 c0             	test   %rax,%rax
  8012e5:	75 1e                	jne    801305 <memmove+0xfc>
  8012e7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8012eb:	48 c1 e8 02          	shr    $0x2,%rax
  8012ef:	48 89 c1             	mov    %rax,%rcx
  8012f2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012f6:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8012fa:	48 89 c7             	mov    %rax,%rdi
  8012fd:	48 89 d6             	mov    %rdx,%rsi
  801300:	fc                   	cld    
  801301:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801303:	eb 15                	jmp    80131a <memmove+0x111>
  801305:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801309:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80130d:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801311:	48 89 c7             	mov    %rax,%rdi
  801314:	48 89 d6             	mov    %rdx,%rsi
  801317:	fc                   	cld    
  801318:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  80131a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80131e:	c9                   	leaveq 
  80131f:	c3                   	retq   

0000000000801320 <memcpy>:
  801320:	55                   	push   %rbp
  801321:	48 89 e5             	mov    %rsp,%rbp
  801324:	48 83 ec 18          	sub    $0x18,%rsp
  801328:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80132c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801330:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801334:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801338:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  80133c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801340:	48 89 ce             	mov    %rcx,%rsi
  801343:	48 89 c7             	mov    %rax,%rdi
  801346:	48 b8 09 12 80 00 00 	movabs $0x801209,%rax
  80134d:	00 00 00 
  801350:	ff d0                	callq  *%rax
  801352:	c9                   	leaveq 
  801353:	c3                   	retq   

0000000000801354 <memcmp>:
  801354:	55                   	push   %rbp
  801355:	48 89 e5             	mov    %rsp,%rbp
  801358:	48 83 ec 28          	sub    $0x28,%rsp
  80135c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801360:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801364:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801368:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80136c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801370:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801374:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801378:	eb 36                	jmp    8013b0 <memcmp+0x5c>
  80137a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80137e:	0f b6 10             	movzbl (%rax),%edx
  801381:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801385:	0f b6 00             	movzbl (%rax),%eax
  801388:	38 c2                	cmp    %al,%dl
  80138a:	74 1a                	je     8013a6 <memcmp+0x52>
  80138c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801390:	0f b6 00             	movzbl (%rax),%eax
  801393:	0f b6 d0             	movzbl %al,%edx
  801396:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80139a:	0f b6 00             	movzbl (%rax),%eax
  80139d:	0f b6 c0             	movzbl %al,%eax
  8013a0:	29 c2                	sub    %eax,%edx
  8013a2:	89 d0                	mov    %edx,%eax
  8013a4:	eb 20                	jmp    8013c6 <memcmp+0x72>
  8013a6:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8013ab:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8013b0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8013b4:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8013b8:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8013bc:	48 85 c0             	test   %rax,%rax
  8013bf:	75 b9                	jne    80137a <memcmp+0x26>
  8013c1:	b8 00 00 00 00       	mov    $0x0,%eax
  8013c6:	c9                   	leaveq 
  8013c7:	c3                   	retq   

00000000008013c8 <memfind>:
  8013c8:	55                   	push   %rbp
  8013c9:	48 89 e5             	mov    %rsp,%rbp
  8013cc:	48 83 ec 28          	sub    $0x28,%rsp
  8013d0:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8013d4:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8013d7:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8013db:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8013df:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8013e3:	48 01 d0             	add    %rdx,%rax
  8013e6:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8013ea:	eb 15                	jmp    801401 <memfind+0x39>
  8013ec:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013f0:	0f b6 10             	movzbl (%rax),%edx
  8013f3:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8013f6:	38 c2                	cmp    %al,%dl
  8013f8:	75 02                	jne    8013fc <memfind+0x34>
  8013fa:	eb 0f                	jmp    80140b <memfind+0x43>
  8013fc:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801401:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801405:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  801409:	72 e1                	jb     8013ec <memfind+0x24>
  80140b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80140f:	c9                   	leaveq 
  801410:	c3                   	retq   

0000000000801411 <strtol>:
  801411:	55                   	push   %rbp
  801412:	48 89 e5             	mov    %rsp,%rbp
  801415:	48 83 ec 34          	sub    $0x34,%rsp
  801419:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80141d:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801421:	89 55 cc             	mov    %edx,-0x34(%rbp)
  801424:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80142b:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  801432:	00 
  801433:	eb 05                	jmp    80143a <strtol+0x29>
  801435:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80143a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80143e:	0f b6 00             	movzbl (%rax),%eax
  801441:	3c 20                	cmp    $0x20,%al
  801443:	74 f0                	je     801435 <strtol+0x24>
  801445:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801449:	0f b6 00             	movzbl (%rax),%eax
  80144c:	3c 09                	cmp    $0x9,%al
  80144e:	74 e5                	je     801435 <strtol+0x24>
  801450:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801454:	0f b6 00             	movzbl (%rax),%eax
  801457:	3c 2b                	cmp    $0x2b,%al
  801459:	75 07                	jne    801462 <strtol+0x51>
  80145b:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801460:	eb 17                	jmp    801479 <strtol+0x68>
  801462:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801466:	0f b6 00             	movzbl (%rax),%eax
  801469:	3c 2d                	cmp    $0x2d,%al
  80146b:	75 0c                	jne    801479 <strtol+0x68>
  80146d:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801472:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  801479:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  80147d:	74 06                	je     801485 <strtol+0x74>
  80147f:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  801483:	75 28                	jne    8014ad <strtol+0x9c>
  801485:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801489:	0f b6 00             	movzbl (%rax),%eax
  80148c:	3c 30                	cmp    $0x30,%al
  80148e:	75 1d                	jne    8014ad <strtol+0x9c>
  801490:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801494:	48 83 c0 01          	add    $0x1,%rax
  801498:	0f b6 00             	movzbl (%rax),%eax
  80149b:	3c 78                	cmp    $0x78,%al
  80149d:	75 0e                	jne    8014ad <strtol+0x9c>
  80149f:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  8014a4:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  8014ab:	eb 2c                	jmp    8014d9 <strtol+0xc8>
  8014ad:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8014b1:	75 19                	jne    8014cc <strtol+0xbb>
  8014b3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014b7:	0f b6 00             	movzbl (%rax),%eax
  8014ba:	3c 30                	cmp    $0x30,%al
  8014bc:	75 0e                	jne    8014cc <strtol+0xbb>
  8014be:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8014c3:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  8014ca:	eb 0d                	jmp    8014d9 <strtol+0xc8>
  8014cc:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8014d0:	75 07                	jne    8014d9 <strtol+0xc8>
  8014d2:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  8014d9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014dd:	0f b6 00             	movzbl (%rax),%eax
  8014e0:	3c 2f                	cmp    $0x2f,%al
  8014e2:	7e 1d                	jle    801501 <strtol+0xf0>
  8014e4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014e8:	0f b6 00             	movzbl (%rax),%eax
  8014eb:	3c 39                	cmp    $0x39,%al
  8014ed:	7f 12                	jg     801501 <strtol+0xf0>
  8014ef:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014f3:	0f b6 00             	movzbl (%rax),%eax
  8014f6:	0f be c0             	movsbl %al,%eax
  8014f9:	83 e8 30             	sub    $0x30,%eax
  8014fc:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8014ff:	eb 4e                	jmp    80154f <strtol+0x13e>
  801501:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801505:	0f b6 00             	movzbl (%rax),%eax
  801508:	3c 60                	cmp    $0x60,%al
  80150a:	7e 1d                	jle    801529 <strtol+0x118>
  80150c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801510:	0f b6 00             	movzbl (%rax),%eax
  801513:	3c 7a                	cmp    $0x7a,%al
  801515:	7f 12                	jg     801529 <strtol+0x118>
  801517:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80151b:	0f b6 00             	movzbl (%rax),%eax
  80151e:	0f be c0             	movsbl %al,%eax
  801521:	83 e8 57             	sub    $0x57,%eax
  801524:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801527:	eb 26                	jmp    80154f <strtol+0x13e>
  801529:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80152d:	0f b6 00             	movzbl (%rax),%eax
  801530:	3c 40                	cmp    $0x40,%al
  801532:	7e 48                	jle    80157c <strtol+0x16b>
  801534:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801538:	0f b6 00             	movzbl (%rax),%eax
  80153b:	3c 5a                	cmp    $0x5a,%al
  80153d:	7f 3d                	jg     80157c <strtol+0x16b>
  80153f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801543:	0f b6 00             	movzbl (%rax),%eax
  801546:	0f be c0             	movsbl %al,%eax
  801549:	83 e8 37             	sub    $0x37,%eax
  80154c:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80154f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801552:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  801555:	7c 02                	jl     801559 <strtol+0x148>
  801557:	eb 23                	jmp    80157c <strtol+0x16b>
  801559:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80155e:	8b 45 cc             	mov    -0x34(%rbp),%eax
  801561:	48 98                	cltq   
  801563:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  801568:	48 89 c2             	mov    %rax,%rdx
  80156b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80156e:	48 98                	cltq   
  801570:	48 01 d0             	add    %rdx,%rax
  801573:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801577:	e9 5d ff ff ff       	jmpq   8014d9 <strtol+0xc8>
  80157c:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  801581:	74 0b                	je     80158e <strtol+0x17d>
  801583:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801587:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80158b:	48 89 10             	mov    %rdx,(%rax)
  80158e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801592:	74 09                	je     80159d <strtol+0x18c>
  801594:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801598:	48 f7 d8             	neg    %rax
  80159b:	eb 04                	jmp    8015a1 <strtol+0x190>
  80159d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015a1:	c9                   	leaveq 
  8015a2:	c3                   	retq   

00000000008015a3 <strstr>:
  8015a3:	55                   	push   %rbp
  8015a4:	48 89 e5             	mov    %rsp,%rbp
  8015a7:	48 83 ec 30          	sub    $0x30,%rsp
  8015ab:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8015af:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8015b3:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8015b7:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8015bb:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  8015bf:	0f b6 00             	movzbl (%rax),%eax
  8015c2:	88 45 ff             	mov    %al,-0x1(%rbp)
  8015c5:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  8015c9:	75 06                	jne    8015d1 <strstr+0x2e>
  8015cb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015cf:	eb 6b                	jmp    80163c <strstr+0x99>
  8015d1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8015d5:	48 89 c7             	mov    %rax,%rdi
  8015d8:	48 b8 79 0e 80 00 00 	movabs $0x800e79,%rax
  8015df:	00 00 00 
  8015e2:	ff d0                	callq  *%rax
  8015e4:	48 98                	cltq   
  8015e6:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8015ea:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015ee:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8015f2:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8015f6:	0f b6 00             	movzbl (%rax),%eax
  8015f9:	88 45 ef             	mov    %al,-0x11(%rbp)
  8015fc:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  801600:	75 07                	jne    801609 <strstr+0x66>
  801602:	b8 00 00 00 00       	mov    $0x0,%eax
  801607:	eb 33                	jmp    80163c <strstr+0x99>
  801609:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  80160d:	3a 45 ff             	cmp    -0x1(%rbp),%al
  801610:	75 d8                	jne    8015ea <strstr+0x47>
  801612:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801616:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  80161a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80161e:	48 89 ce             	mov    %rcx,%rsi
  801621:	48 89 c7             	mov    %rax,%rdi
  801624:	48 b8 9a 10 80 00 00 	movabs $0x80109a,%rax
  80162b:	00 00 00 
  80162e:	ff d0                	callq  *%rax
  801630:	85 c0                	test   %eax,%eax
  801632:	75 b6                	jne    8015ea <strstr+0x47>
  801634:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801638:	48 83 e8 01          	sub    $0x1,%rax
  80163c:	c9                   	leaveq 
  80163d:	c3                   	retq   

000000000080163e <syscall>:
  80163e:	55                   	push   %rbp
  80163f:	48 89 e5             	mov    %rsp,%rbp
  801642:	53                   	push   %rbx
  801643:	48 83 ec 48          	sub    $0x48,%rsp
  801647:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80164a:	89 75 d8             	mov    %esi,-0x28(%rbp)
  80164d:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801651:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  801655:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  801659:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  80165d:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801660:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  801664:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  801668:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  80166c:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  801670:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  801674:	4c 89 c3             	mov    %r8,%rbx
  801677:	cd 30                	int    $0x30
  801679:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80167d:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801681:	74 3e                	je     8016c1 <syscall+0x83>
  801683:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801688:	7e 37                	jle    8016c1 <syscall+0x83>
  80168a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80168e:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801691:	49 89 d0             	mov    %rdx,%r8
  801694:	89 c1                	mov    %eax,%ecx
  801696:	48 ba 68 4d 80 00 00 	movabs $0x804d68,%rdx
  80169d:	00 00 00 
  8016a0:	be 24 00 00 00       	mov    $0x24,%esi
  8016a5:	48 bf 85 4d 80 00 00 	movabs $0x804d85,%rdi
  8016ac:	00 00 00 
  8016af:	b8 00 00 00 00       	mov    $0x0,%eax
  8016b4:	49 b9 ba 43 80 00 00 	movabs $0x8043ba,%r9
  8016bb:	00 00 00 
  8016be:	41 ff d1             	callq  *%r9
  8016c1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8016c5:	48 83 c4 48          	add    $0x48,%rsp
  8016c9:	5b                   	pop    %rbx
  8016ca:	5d                   	pop    %rbp
  8016cb:	c3                   	retq   

00000000008016cc <sys_cputs>:
  8016cc:	55                   	push   %rbp
  8016cd:	48 89 e5             	mov    %rsp,%rbp
  8016d0:	48 83 ec 20          	sub    $0x20,%rsp
  8016d4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8016d8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8016dc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016e0:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8016e4:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8016eb:	00 
  8016ec:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8016f2:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8016f8:	48 89 d1             	mov    %rdx,%rcx
  8016fb:	48 89 c2             	mov    %rax,%rdx
  8016fe:	be 00 00 00 00       	mov    $0x0,%esi
  801703:	bf 00 00 00 00       	mov    $0x0,%edi
  801708:	48 b8 3e 16 80 00 00 	movabs $0x80163e,%rax
  80170f:	00 00 00 
  801712:	ff d0                	callq  *%rax
  801714:	c9                   	leaveq 
  801715:	c3                   	retq   

0000000000801716 <sys_cgetc>:
  801716:	55                   	push   %rbp
  801717:	48 89 e5             	mov    %rsp,%rbp
  80171a:	48 83 ec 10          	sub    $0x10,%rsp
  80171e:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801725:	00 
  801726:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80172c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801732:	b9 00 00 00 00       	mov    $0x0,%ecx
  801737:	ba 00 00 00 00       	mov    $0x0,%edx
  80173c:	be 00 00 00 00       	mov    $0x0,%esi
  801741:	bf 01 00 00 00       	mov    $0x1,%edi
  801746:	48 b8 3e 16 80 00 00 	movabs $0x80163e,%rax
  80174d:	00 00 00 
  801750:	ff d0                	callq  *%rax
  801752:	c9                   	leaveq 
  801753:	c3                   	retq   

0000000000801754 <sys_env_destroy>:
  801754:	55                   	push   %rbp
  801755:	48 89 e5             	mov    %rsp,%rbp
  801758:	48 83 ec 10          	sub    $0x10,%rsp
  80175c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80175f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801762:	48 98                	cltq   
  801764:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80176b:	00 
  80176c:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801772:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801778:	b9 00 00 00 00       	mov    $0x0,%ecx
  80177d:	48 89 c2             	mov    %rax,%rdx
  801780:	be 01 00 00 00       	mov    $0x1,%esi
  801785:	bf 03 00 00 00       	mov    $0x3,%edi
  80178a:	48 b8 3e 16 80 00 00 	movabs $0x80163e,%rax
  801791:	00 00 00 
  801794:	ff d0                	callq  *%rax
  801796:	c9                   	leaveq 
  801797:	c3                   	retq   

0000000000801798 <sys_getenvid>:
  801798:	55                   	push   %rbp
  801799:	48 89 e5             	mov    %rsp,%rbp
  80179c:	48 83 ec 10          	sub    $0x10,%rsp
  8017a0:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8017a7:	00 
  8017a8:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8017ae:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8017b4:	b9 00 00 00 00       	mov    $0x0,%ecx
  8017b9:	ba 00 00 00 00       	mov    $0x0,%edx
  8017be:	be 00 00 00 00       	mov    $0x0,%esi
  8017c3:	bf 02 00 00 00       	mov    $0x2,%edi
  8017c8:	48 b8 3e 16 80 00 00 	movabs $0x80163e,%rax
  8017cf:	00 00 00 
  8017d2:	ff d0                	callq  *%rax
  8017d4:	c9                   	leaveq 
  8017d5:	c3                   	retq   

00000000008017d6 <sys_yield>:
  8017d6:	55                   	push   %rbp
  8017d7:	48 89 e5             	mov    %rsp,%rbp
  8017da:	48 83 ec 10          	sub    $0x10,%rsp
  8017de:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8017e5:	00 
  8017e6:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8017ec:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8017f2:	b9 00 00 00 00       	mov    $0x0,%ecx
  8017f7:	ba 00 00 00 00       	mov    $0x0,%edx
  8017fc:	be 00 00 00 00       	mov    $0x0,%esi
  801801:	bf 0b 00 00 00       	mov    $0xb,%edi
  801806:	48 b8 3e 16 80 00 00 	movabs $0x80163e,%rax
  80180d:	00 00 00 
  801810:	ff d0                	callq  *%rax
  801812:	c9                   	leaveq 
  801813:	c3                   	retq   

0000000000801814 <sys_page_alloc>:
  801814:	55                   	push   %rbp
  801815:	48 89 e5             	mov    %rsp,%rbp
  801818:	48 83 ec 20          	sub    $0x20,%rsp
  80181c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80181f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801823:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801826:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801829:	48 63 c8             	movslq %eax,%rcx
  80182c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801830:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801833:	48 98                	cltq   
  801835:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80183c:	00 
  80183d:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801843:	49 89 c8             	mov    %rcx,%r8
  801846:	48 89 d1             	mov    %rdx,%rcx
  801849:	48 89 c2             	mov    %rax,%rdx
  80184c:	be 01 00 00 00       	mov    $0x1,%esi
  801851:	bf 04 00 00 00       	mov    $0x4,%edi
  801856:	48 b8 3e 16 80 00 00 	movabs $0x80163e,%rax
  80185d:	00 00 00 
  801860:	ff d0                	callq  *%rax
  801862:	c9                   	leaveq 
  801863:	c3                   	retq   

0000000000801864 <sys_page_map>:
  801864:	55                   	push   %rbp
  801865:	48 89 e5             	mov    %rsp,%rbp
  801868:	48 83 ec 30          	sub    $0x30,%rsp
  80186c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80186f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801873:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801876:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  80187a:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  80187e:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801881:	48 63 c8             	movslq %eax,%rcx
  801884:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801888:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80188b:	48 63 f0             	movslq %eax,%rsi
  80188e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801892:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801895:	48 98                	cltq   
  801897:	48 89 0c 24          	mov    %rcx,(%rsp)
  80189b:	49 89 f9             	mov    %rdi,%r9
  80189e:	49 89 f0             	mov    %rsi,%r8
  8018a1:	48 89 d1             	mov    %rdx,%rcx
  8018a4:	48 89 c2             	mov    %rax,%rdx
  8018a7:	be 01 00 00 00       	mov    $0x1,%esi
  8018ac:	bf 05 00 00 00       	mov    $0x5,%edi
  8018b1:	48 b8 3e 16 80 00 00 	movabs $0x80163e,%rax
  8018b8:	00 00 00 
  8018bb:	ff d0                	callq  *%rax
  8018bd:	c9                   	leaveq 
  8018be:	c3                   	retq   

00000000008018bf <sys_page_unmap>:
  8018bf:	55                   	push   %rbp
  8018c0:	48 89 e5             	mov    %rsp,%rbp
  8018c3:	48 83 ec 20          	sub    $0x20,%rsp
  8018c7:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8018ca:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8018ce:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8018d2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8018d5:	48 98                	cltq   
  8018d7:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8018de:	00 
  8018df:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8018e5:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8018eb:	48 89 d1             	mov    %rdx,%rcx
  8018ee:	48 89 c2             	mov    %rax,%rdx
  8018f1:	be 01 00 00 00       	mov    $0x1,%esi
  8018f6:	bf 06 00 00 00       	mov    $0x6,%edi
  8018fb:	48 b8 3e 16 80 00 00 	movabs $0x80163e,%rax
  801902:	00 00 00 
  801905:	ff d0                	callq  *%rax
  801907:	c9                   	leaveq 
  801908:	c3                   	retq   

0000000000801909 <sys_env_set_status>:
  801909:	55                   	push   %rbp
  80190a:	48 89 e5             	mov    %rsp,%rbp
  80190d:	48 83 ec 10          	sub    $0x10,%rsp
  801911:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801914:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801917:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80191a:	48 63 d0             	movslq %eax,%rdx
  80191d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801920:	48 98                	cltq   
  801922:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801929:	00 
  80192a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801930:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801936:	48 89 d1             	mov    %rdx,%rcx
  801939:	48 89 c2             	mov    %rax,%rdx
  80193c:	be 01 00 00 00       	mov    $0x1,%esi
  801941:	bf 08 00 00 00       	mov    $0x8,%edi
  801946:	48 b8 3e 16 80 00 00 	movabs $0x80163e,%rax
  80194d:	00 00 00 
  801950:	ff d0                	callq  *%rax
  801952:	c9                   	leaveq 
  801953:	c3                   	retq   

0000000000801954 <sys_env_set_trapframe>:
  801954:	55                   	push   %rbp
  801955:	48 89 e5             	mov    %rsp,%rbp
  801958:	48 83 ec 20          	sub    $0x20,%rsp
  80195c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80195f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801963:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801967:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80196a:	48 98                	cltq   
  80196c:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801973:	00 
  801974:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80197a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801980:	48 89 d1             	mov    %rdx,%rcx
  801983:	48 89 c2             	mov    %rax,%rdx
  801986:	be 01 00 00 00       	mov    $0x1,%esi
  80198b:	bf 09 00 00 00       	mov    $0x9,%edi
  801990:	48 b8 3e 16 80 00 00 	movabs $0x80163e,%rax
  801997:	00 00 00 
  80199a:	ff d0                	callq  *%rax
  80199c:	c9                   	leaveq 
  80199d:	c3                   	retq   

000000000080199e <sys_env_set_pgfault_upcall>:
  80199e:	55                   	push   %rbp
  80199f:	48 89 e5             	mov    %rsp,%rbp
  8019a2:	48 83 ec 20          	sub    $0x20,%rsp
  8019a6:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8019a9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8019ad:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8019b1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8019b4:	48 98                	cltq   
  8019b6:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8019bd:	00 
  8019be:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8019c4:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8019ca:	48 89 d1             	mov    %rdx,%rcx
  8019cd:	48 89 c2             	mov    %rax,%rdx
  8019d0:	be 01 00 00 00       	mov    $0x1,%esi
  8019d5:	bf 0a 00 00 00       	mov    $0xa,%edi
  8019da:	48 b8 3e 16 80 00 00 	movabs $0x80163e,%rax
  8019e1:	00 00 00 
  8019e4:	ff d0                	callq  *%rax
  8019e6:	c9                   	leaveq 
  8019e7:	c3                   	retq   

00000000008019e8 <sys_ipc_try_send>:
  8019e8:	55                   	push   %rbp
  8019e9:	48 89 e5             	mov    %rsp,%rbp
  8019ec:	48 83 ec 20          	sub    $0x20,%rsp
  8019f0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8019f3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8019f7:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8019fb:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  8019fe:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801a01:	48 63 f0             	movslq %eax,%rsi
  801a04:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801a08:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a0b:	48 98                	cltq   
  801a0d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801a11:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801a18:	00 
  801a19:	49 89 f1             	mov    %rsi,%r9
  801a1c:	49 89 c8             	mov    %rcx,%r8
  801a1f:	48 89 d1             	mov    %rdx,%rcx
  801a22:	48 89 c2             	mov    %rax,%rdx
  801a25:	be 00 00 00 00       	mov    $0x0,%esi
  801a2a:	bf 0c 00 00 00       	mov    $0xc,%edi
  801a2f:	48 b8 3e 16 80 00 00 	movabs $0x80163e,%rax
  801a36:	00 00 00 
  801a39:	ff d0                	callq  *%rax
  801a3b:	c9                   	leaveq 
  801a3c:	c3                   	retq   

0000000000801a3d <sys_ipc_recv>:
  801a3d:	55                   	push   %rbp
  801a3e:	48 89 e5             	mov    %rsp,%rbp
  801a41:	48 83 ec 10          	sub    $0x10,%rsp
  801a45:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801a49:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801a4d:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801a54:	00 
  801a55:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a5b:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a61:	b9 00 00 00 00       	mov    $0x0,%ecx
  801a66:	48 89 c2             	mov    %rax,%rdx
  801a69:	be 01 00 00 00       	mov    $0x1,%esi
  801a6e:	bf 0d 00 00 00       	mov    $0xd,%edi
  801a73:	48 b8 3e 16 80 00 00 	movabs $0x80163e,%rax
  801a7a:	00 00 00 
  801a7d:	ff d0                	callq  *%rax
  801a7f:	c9                   	leaveq 
  801a80:	c3                   	retq   

0000000000801a81 <sys_time_msec>:
  801a81:	55                   	push   %rbp
  801a82:	48 89 e5             	mov    %rsp,%rbp
  801a85:	48 83 ec 10          	sub    $0x10,%rsp
  801a89:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801a90:	00 
  801a91:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a97:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a9d:	b9 00 00 00 00       	mov    $0x0,%ecx
  801aa2:	ba 00 00 00 00       	mov    $0x0,%edx
  801aa7:	be 00 00 00 00       	mov    $0x0,%esi
  801aac:	bf 0e 00 00 00       	mov    $0xe,%edi
  801ab1:	48 b8 3e 16 80 00 00 	movabs $0x80163e,%rax
  801ab8:	00 00 00 
  801abb:	ff d0                	callq  *%rax
  801abd:	c9                   	leaveq 
  801abe:	c3                   	retq   

0000000000801abf <sys_net_transmit>:
  801abf:	55                   	push   %rbp
  801ac0:	48 89 e5             	mov    %rsp,%rbp
  801ac3:	48 83 ec 20          	sub    $0x20,%rsp
  801ac7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801acb:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801ace:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801ad1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ad5:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801adc:	00 
  801add:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ae3:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ae9:	48 89 d1             	mov    %rdx,%rcx
  801aec:	48 89 c2             	mov    %rax,%rdx
  801aef:	be 00 00 00 00       	mov    $0x0,%esi
  801af4:	bf 0f 00 00 00       	mov    $0xf,%edi
  801af9:	48 b8 3e 16 80 00 00 	movabs $0x80163e,%rax
  801b00:	00 00 00 
  801b03:	ff d0                	callq  *%rax
  801b05:	c9                   	leaveq 
  801b06:	c3                   	retq   

0000000000801b07 <sys_net_receive>:
  801b07:	55                   	push   %rbp
  801b08:	48 89 e5             	mov    %rsp,%rbp
  801b0b:	48 83 ec 20          	sub    $0x20,%rsp
  801b0f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801b13:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801b16:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801b19:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b1d:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801b24:	00 
  801b25:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b2b:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b31:	48 89 d1             	mov    %rdx,%rcx
  801b34:	48 89 c2             	mov    %rax,%rdx
  801b37:	be 00 00 00 00       	mov    $0x0,%esi
  801b3c:	bf 10 00 00 00       	mov    $0x10,%edi
  801b41:	48 b8 3e 16 80 00 00 	movabs $0x80163e,%rax
  801b48:	00 00 00 
  801b4b:	ff d0                	callq  *%rax
  801b4d:	c9                   	leaveq 
  801b4e:	c3                   	retq   

0000000000801b4f <sys_ept_map>:
  801b4f:	55                   	push   %rbp
  801b50:	48 89 e5             	mov    %rsp,%rbp
  801b53:	48 83 ec 30          	sub    $0x30,%rsp
  801b57:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b5a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b5e:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801b61:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801b65:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801b69:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801b6c:	48 63 c8             	movslq %eax,%rcx
  801b6f:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801b73:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801b76:	48 63 f0             	movslq %eax,%rsi
  801b79:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b7d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b80:	48 98                	cltq   
  801b82:	48 89 0c 24          	mov    %rcx,(%rsp)
  801b86:	49 89 f9             	mov    %rdi,%r9
  801b89:	49 89 f0             	mov    %rsi,%r8
  801b8c:	48 89 d1             	mov    %rdx,%rcx
  801b8f:	48 89 c2             	mov    %rax,%rdx
  801b92:	be 00 00 00 00       	mov    $0x0,%esi
  801b97:	bf 11 00 00 00       	mov    $0x11,%edi
  801b9c:	48 b8 3e 16 80 00 00 	movabs $0x80163e,%rax
  801ba3:	00 00 00 
  801ba6:	ff d0                	callq  *%rax
  801ba8:	c9                   	leaveq 
  801ba9:	c3                   	retq   

0000000000801baa <sys_env_mkguest>:
  801baa:	55                   	push   %rbp
  801bab:	48 89 e5             	mov    %rsp,%rbp
  801bae:	48 83 ec 20          	sub    $0x20,%rsp
  801bb2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801bb6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801bba:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801bbe:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801bc2:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801bc9:	00 
  801bca:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801bd0:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801bd6:	48 89 d1             	mov    %rdx,%rcx
  801bd9:	48 89 c2             	mov    %rax,%rdx
  801bdc:	be 00 00 00 00       	mov    $0x0,%esi
  801be1:	bf 12 00 00 00       	mov    $0x12,%edi
  801be6:	48 b8 3e 16 80 00 00 	movabs $0x80163e,%rax
  801bed:	00 00 00 
  801bf0:	ff d0                	callq  *%rax
  801bf2:	c9                   	leaveq 
  801bf3:	c3                   	retq   

0000000000801bf4 <sys_vmx_list_vms>:
  801bf4:	55                   	push   %rbp
  801bf5:	48 89 e5             	mov    %rsp,%rbp
  801bf8:	48 83 ec 10          	sub    $0x10,%rsp
  801bfc:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c03:	00 
  801c04:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c0a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c10:	b9 00 00 00 00       	mov    $0x0,%ecx
  801c15:	ba 00 00 00 00       	mov    $0x0,%edx
  801c1a:	be 00 00 00 00       	mov    $0x0,%esi
  801c1f:	bf 13 00 00 00       	mov    $0x13,%edi
  801c24:	48 b8 3e 16 80 00 00 	movabs $0x80163e,%rax
  801c2b:	00 00 00 
  801c2e:	ff d0                	callq  *%rax
  801c30:	c9                   	leaveq 
  801c31:	c3                   	retq   

0000000000801c32 <sys_vmx_sel_resume>:
  801c32:	55                   	push   %rbp
  801c33:	48 89 e5             	mov    %rsp,%rbp
  801c36:	48 83 ec 10          	sub    $0x10,%rsp
  801c3a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801c3d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c40:	48 98                	cltq   
  801c42:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c49:	00 
  801c4a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c50:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c56:	b9 00 00 00 00       	mov    $0x0,%ecx
  801c5b:	48 89 c2             	mov    %rax,%rdx
  801c5e:	be 00 00 00 00       	mov    $0x0,%esi
  801c63:	bf 14 00 00 00       	mov    $0x14,%edi
  801c68:	48 b8 3e 16 80 00 00 	movabs $0x80163e,%rax
  801c6f:	00 00 00 
  801c72:	ff d0                	callq  *%rax
  801c74:	c9                   	leaveq 
  801c75:	c3                   	retq   

0000000000801c76 <sys_vmx_get_vmdisk_number>:
  801c76:	55                   	push   %rbp
  801c77:	48 89 e5             	mov    %rsp,%rbp
  801c7a:	48 83 ec 10          	sub    $0x10,%rsp
  801c7e:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c85:	00 
  801c86:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c8c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c92:	b9 00 00 00 00       	mov    $0x0,%ecx
  801c97:	ba 00 00 00 00       	mov    $0x0,%edx
  801c9c:	be 00 00 00 00       	mov    $0x0,%esi
  801ca1:	bf 15 00 00 00       	mov    $0x15,%edi
  801ca6:	48 b8 3e 16 80 00 00 	movabs $0x80163e,%rax
  801cad:	00 00 00 
  801cb0:	ff d0                	callq  *%rax
  801cb2:	c9                   	leaveq 
  801cb3:	c3                   	retq   

0000000000801cb4 <sys_vmx_incr_vmdisk_number>:
  801cb4:	55                   	push   %rbp
  801cb5:	48 89 e5             	mov    %rsp,%rbp
  801cb8:	48 83 ec 10          	sub    $0x10,%rsp
  801cbc:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801cc3:	00 
  801cc4:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801cca:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801cd0:	b9 00 00 00 00       	mov    $0x0,%ecx
  801cd5:	ba 00 00 00 00       	mov    $0x0,%edx
  801cda:	be 00 00 00 00       	mov    $0x0,%esi
  801cdf:	bf 16 00 00 00       	mov    $0x16,%edi
  801ce4:	48 b8 3e 16 80 00 00 	movabs $0x80163e,%rax
  801ceb:	00 00 00 
  801cee:	ff d0                	callq  *%rax
  801cf0:	c9                   	leaveq 
  801cf1:	c3                   	retq   

0000000000801cf2 <pgfault>:
  801cf2:	55                   	push   %rbp
  801cf3:	48 89 e5             	mov    %rsp,%rbp
  801cf6:	48 83 ec 30          	sub    $0x30,%rsp
  801cfa:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801cfe:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801d02:	48 8b 00             	mov    (%rax),%rax
  801d05:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  801d09:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801d0d:	48 8b 40 08          	mov    0x8(%rax),%rax
  801d11:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801d14:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801d17:	83 e0 02             	and    $0x2,%eax
  801d1a:	85 c0                	test   %eax,%eax
  801d1c:	75 40                	jne    801d5e <pgfault+0x6c>
  801d1e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801d22:	48 8b 90 88 00 00 00 	mov    0x88(%rax),%rdx
  801d29:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801d2d:	49 89 d0             	mov    %rdx,%r8
  801d30:	48 89 c1             	mov    %rax,%rcx
  801d33:	48 ba 98 4d 80 00 00 	movabs $0x804d98,%rdx
  801d3a:	00 00 00 
  801d3d:	be 1f 00 00 00       	mov    $0x1f,%esi
  801d42:	48 bf b1 4d 80 00 00 	movabs $0x804db1,%rdi
  801d49:	00 00 00 
  801d4c:	b8 00 00 00 00       	mov    $0x0,%eax
  801d51:	49 b9 ba 43 80 00 00 	movabs $0x8043ba,%r9
  801d58:	00 00 00 
  801d5b:	41 ff d1             	callq  *%r9
  801d5e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801d62:	48 c1 e8 0c          	shr    $0xc,%rax
  801d66:	48 89 c2             	mov    %rax,%rdx
  801d69:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801d70:	01 00 00 
  801d73:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801d77:	25 07 08 00 00       	and    $0x807,%eax
  801d7c:	48 3d 05 08 00 00    	cmp    $0x805,%rax
  801d82:	74 4e                	je     801dd2 <pgfault+0xe0>
  801d84:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801d88:	48 c1 e8 0c          	shr    $0xc,%rax
  801d8c:	48 89 c2             	mov    %rax,%rdx
  801d8f:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801d96:	01 00 00 
  801d99:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  801d9d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801da1:	49 89 d0             	mov    %rdx,%r8
  801da4:	48 89 c1             	mov    %rax,%rcx
  801da7:	48 ba c0 4d 80 00 00 	movabs $0x804dc0,%rdx
  801dae:	00 00 00 
  801db1:	be 22 00 00 00       	mov    $0x22,%esi
  801db6:	48 bf b1 4d 80 00 00 	movabs $0x804db1,%rdi
  801dbd:	00 00 00 
  801dc0:	b8 00 00 00 00       	mov    $0x0,%eax
  801dc5:	49 b9 ba 43 80 00 00 	movabs $0x8043ba,%r9
  801dcc:	00 00 00 
  801dcf:	41 ff d1             	callq  *%r9
  801dd2:	ba 07 00 00 00       	mov    $0x7,%edx
  801dd7:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  801ddc:	bf 00 00 00 00       	mov    $0x0,%edi
  801de1:	48 b8 14 18 80 00 00 	movabs $0x801814,%rax
  801de8:	00 00 00 
  801deb:	ff d0                	callq  *%rax
  801ded:	89 45 f8             	mov    %eax,-0x8(%rbp)
  801df0:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  801df4:	79 30                	jns    801e26 <pgfault+0x134>
  801df6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801df9:	89 c1                	mov    %eax,%ecx
  801dfb:	48 ba eb 4d 80 00 00 	movabs $0x804deb,%rdx
  801e02:	00 00 00 
  801e05:	be 30 00 00 00       	mov    $0x30,%esi
  801e0a:	48 bf b1 4d 80 00 00 	movabs $0x804db1,%rdi
  801e11:	00 00 00 
  801e14:	b8 00 00 00 00       	mov    $0x0,%eax
  801e19:	49 b8 ba 43 80 00 00 	movabs $0x8043ba,%r8
  801e20:	00 00 00 
  801e23:	41 ff d0             	callq  *%r8
  801e26:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801e2a:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801e2e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801e32:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  801e38:	ba 00 10 00 00       	mov    $0x1000,%edx
  801e3d:	48 89 c6             	mov    %rax,%rsi
  801e40:	bf 00 f0 5f 00       	mov    $0x5ff000,%edi
  801e45:	48 b8 09 12 80 00 00 	movabs $0x801209,%rax
  801e4c:	00 00 00 
  801e4f:	ff d0                	callq  *%rax
  801e51:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801e55:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801e59:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801e5d:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  801e63:	41 b8 07 00 00 00    	mov    $0x7,%r8d
  801e69:	48 89 c1             	mov    %rax,%rcx
  801e6c:	ba 00 00 00 00       	mov    $0x0,%edx
  801e71:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  801e76:	bf 00 00 00 00       	mov    $0x0,%edi
  801e7b:	48 b8 64 18 80 00 00 	movabs $0x801864,%rax
  801e82:	00 00 00 
  801e85:	ff d0                	callq  *%rax
  801e87:	89 45 f8             	mov    %eax,-0x8(%rbp)
  801e8a:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  801e8e:	79 30                	jns    801ec0 <pgfault+0x1ce>
  801e90:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801e93:	89 c1                	mov    %eax,%ecx
  801e95:	48 ba fe 4d 80 00 00 	movabs $0x804dfe,%rdx
  801e9c:	00 00 00 
  801e9f:	be 35 00 00 00       	mov    $0x35,%esi
  801ea4:	48 bf b1 4d 80 00 00 	movabs $0x804db1,%rdi
  801eab:	00 00 00 
  801eae:	b8 00 00 00 00       	mov    $0x0,%eax
  801eb3:	49 b8 ba 43 80 00 00 	movabs $0x8043ba,%r8
  801eba:	00 00 00 
  801ebd:	41 ff d0             	callq  *%r8
  801ec0:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  801ec5:	bf 00 00 00 00       	mov    $0x0,%edi
  801eca:	48 b8 bf 18 80 00 00 	movabs $0x8018bf,%rax
  801ed1:	00 00 00 
  801ed4:	ff d0                	callq  *%rax
  801ed6:	89 45 f8             	mov    %eax,-0x8(%rbp)
  801ed9:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  801edd:	79 30                	jns    801f0f <pgfault+0x21d>
  801edf:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801ee2:	89 c1                	mov    %eax,%ecx
  801ee4:	48 ba 0f 4e 80 00 00 	movabs $0x804e0f,%rdx
  801eeb:	00 00 00 
  801eee:	be 39 00 00 00       	mov    $0x39,%esi
  801ef3:	48 bf b1 4d 80 00 00 	movabs $0x804db1,%rdi
  801efa:	00 00 00 
  801efd:	b8 00 00 00 00       	mov    $0x0,%eax
  801f02:	49 b8 ba 43 80 00 00 	movabs $0x8043ba,%r8
  801f09:	00 00 00 
  801f0c:	41 ff d0             	callq  *%r8
  801f0f:	c9                   	leaveq 
  801f10:	c3                   	retq   

0000000000801f11 <duppage>:
  801f11:	55                   	push   %rbp
  801f12:	48 89 e5             	mov    %rsp,%rbp
  801f15:	48 83 ec 30          	sub    $0x30,%rsp
  801f19:	89 7d dc             	mov    %edi,-0x24(%rbp)
  801f1c:	89 75 d8             	mov    %esi,-0x28(%rbp)
  801f1f:	8b 45 d8             	mov    -0x28(%rbp),%eax
  801f22:	c1 e0 0c             	shl    $0xc,%eax
  801f25:	89 c0                	mov    %eax,%eax
  801f27:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801f2b:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801f32:	01 00 00 
  801f35:	8b 55 d8             	mov    -0x28(%rbp),%edx
  801f38:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801f3c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801f40:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801f44:	25 02 08 00 00       	and    $0x802,%eax
  801f49:	48 85 c0             	test   %rax,%rax
  801f4c:	74 0e                	je     801f5c <duppage+0x4b>
  801f4e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801f52:	25 00 04 00 00       	and    $0x400,%eax
  801f57:	48 85 c0             	test   %rax,%rax
  801f5a:	74 70                	je     801fcc <duppage+0xbb>
  801f5c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801f60:	25 07 0e 00 00       	and    $0xe07,%eax
  801f65:	89 c6                	mov    %eax,%esi
  801f67:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  801f6b:	8b 55 dc             	mov    -0x24(%rbp),%edx
  801f6e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801f72:	41 89 f0             	mov    %esi,%r8d
  801f75:	48 89 c6             	mov    %rax,%rsi
  801f78:	bf 00 00 00 00       	mov    $0x0,%edi
  801f7d:	48 b8 64 18 80 00 00 	movabs $0x801864,%rax
  801f84:	00 00 00 
  801f87:	ff d0                	callq  *%rax
  801f89:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801f8c:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  801f90:	79 30                	jns    801fc2 <duppage+0xb1>
  801f92:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801f95:	89 c1                	mov    %eax,%ecx
  801f97:	48 ba fe 4d 80 00 00 	movabs $0x804dfe,%rdx
  801f9e:	00 00 00 
  801fa1:	be 63 00 00 00       	mov    $0x63,%esi
  801fa6:	48 bf b1 4d 80 00 00 	movabs $0x804db1,%rdi
  801fad:	00 00 00 
  801fb0:	b8 00 00 00 00       	mov    $0x0,%eax
  801fb5:	49 b8 ba 43 80 00 00 	movabs $0x8043ba,%r8
  801fbc:	00 00 00 
  801fbf:	41 ff d0             	callq  *%r8
  801fc2:	b8 00 00 00 00       	mov    $0x0,%eax
  801fc7:	e9 c4 00 00 00       	jmpq   802090 <duppage+0x17f>
  801fcc:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  801fd0:	8b 55 dc             	mov    -0x24(%rbp),%edx
  801fd3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801fd7:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  801fdd:	48 89 c6             	mov    %rax,%rsi
  801fe0:	bf 00 00 00 00       	mov    $0x0,%edi
  801fe5:	48 b8 64 18 80 00 00 	movabs $0x801864,%rax
  801fec:	00 00 00 
  801fef:	ff d0                	callq  *%rax
  801ff1:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801ff4:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  801ff8:	79 30                	jns    80202a <duppage+0x119>
  801ffa:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801ffd:	89 c1                	mov    %eax,%ecx
  801fff:	48 ba fe 4d 80 00 00 	movabs $0x804dfe,%rdx
  802006:	00 00 00 
  802009:	be 7e 00 00 00       	mov    $0x7e,%esi
  80200e:	48 bf b1 4d 80 00 00 	movabs $0x804db1,%rdi
  802015:	00 00 00 
  802018:	b8 00 00 00 00       	mov    $0x0,%eax
  80201d:	49 b8 ba 43 80 00 00 	movabs $0x8043ba,%r8
  802024:	00 00 00 
  802027:	41 ff d0             	callq  *%r8
  80202a:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80202e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802032:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  802038:	48 89 d1             	mov    %rdx,%rcx
  80203b:	ba 00 00 00 00       	mov    $0x0,%edx
  802040:	48 89 c6             	mov    %rax,%rsi
  802043:	bf 00 00 00 00       	mov    $0x0,%edi
  802048:	48 b8 64 18 80 00 00 	movabs $0x801864,%rax
  80204f:	00 00 00 
  802052:	ff d0                	callq  *%rax
  802054:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802057:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80205b:	79 30                	jns    80208d <duppage+0x17c>
  80205d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802060:	89 c1                	mov    %eax,%ecx
  802062:	48 ba fe 4d 80 00 00 	movabs $0x804dfe,%rdx
  802069:	00 00 00 
  80206c:	be 80 00 00 00       	mov    $0x80,%esi
  802071:	48 bf b1 4d 80 00 00 	movabs $0x804db1,%rdi
  802078:	00 00 00 
  80207b:	b8 00 00 00 00       	mov    $0x0,%eax
  802080:	49 b8 ba 43 80 00 00 	movabs $0x8043ba,%r8
  802087:	00 00 00 
  80208a:	41 ff d0             	callq  *%r8
  80208d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802090:	c9                   	leaveq 
  802091:	c3                   	retq   

0000000000802092 <fork>:
  802092:	55                   	push   %rbp
  802093:	48 89 e5             	mov    %rsp,%rbp
  802096:	48 83 ec 20          	sub    $0x20,%rsp
  80209a:	48 bf f2 1c 80 00 00 	movabs $0x801cf2,%rdi
  8020a1:	00 00 00 
  8020a4:	48 b8 ce 44 80 00 00 	movabs $0x8044ce,%rax
  8020ab:	00 00 00 
  8020ae:	ff d0                	callq  *%rax
  8020b0:	b8 07 00 00 00       	mov    $0x7,%eax
  8020b5:	cd 30                	int    $0x30
  8020b7:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8020ba:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8020bd:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8020c0:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8020c4:	79 08                	jns    8020ce <fork+0x3c>
  8020c6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8020c9:	e9 09 02 00 00       	jmpq   8022d7 <fork+0x245>
  8020ce:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8020d2:	75 3e                	jne    802112 <fork+0x80>
  8020d4:	48 b8 98 17 80 00 00 	movabs $0x801798,%rax
  8020db:	00 00 00 
  8020de:	ff d0                	callq  *%rax
  8020e0:	25 ff 03 00 00       	and    $0x3ff,%eax
  8020e5:	48 98                	cltq   
  8020e7:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8020ee:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8020f5:	00 00 00 
  8020f8:	48 01 c2             	add    %rax,%rdx
  8020fb:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802102:	00 00 00 
  802105:	48 89 10             	mov    %rdx,(%rax)
  802108:	b8 00 00 00 00       	mov    $0x0,%eax
  80210d:	e9 c5 01 00 00       	jmpq   8022d7 <fork+0x245>
  802112:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802119:	e9 a4 00 00 00       	jmpq   8021c2 <fork+0x130>
  80211e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802121:	c1 f8 12             	sar    $0x12,%eax
  802124:	89 c2                	mov    %eax,%edx
  802126:	48 b8 00 00 40 80 00 	movabs $0x10080400000,%rax
  80212d:	01 00 00 
  802130:	48 63 d2             	movslq %edx,%rdx
  802133:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802137:	83 e0 01             	and    $0x1,%eax
  80213a:	48 85 c0             	test   %rax,%rax
  80213d:	74 21                	je     802160 <fork+0xce>
  80213f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802142:	c1 f8 09             	sar    $0x9,%eax
  802145:	89 c2                	mov    %eax,%edx
  802147:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  80214e:	01 00 00 
  802151:	48 63 d2             	movslq %edx,%rdx
  802154:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802158:	83 e0 01             	and    $0x1,%eax
  80215b:	48 85 c0             	test   %rax,%rax
  80215e:	75 09                	jne    802169 <fork+0xd7>
  802160:	81 45 fc 00 02 00 00 	addl   $0x200,-0x4(%rbp)
  802167:	eb 59                	jmp    8021c2 <fork+0x130>
  802169:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80216c:	05 00 02 00 00       	add    $0x200,%eax
  802171:	89 45 f4             	mov    %eax,-0xc(%rbp)
  802174:	eb 44                	jmp    8021ba <fork+0x128>
  802176:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80217d:	01 00 00 
  802180:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802183:	48 63 d2             	movslq %edx,%rdx
  802186:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80218a:	83 e0 05             	and    $0x5,%eax
  80218d:	48 83 f8 05          	cmp    $0x5,%rax
  802191:	74 02                	je     802195 <fork+0x103>
  802193:	eb 21                	jmp    8021b6 <fork+0x124>
  802195:	81 7d fc ff f7 0e 00 	cmpl   $0xef7ff,-0x4(%rbp)
  80219c:	75 02                	jne    8021a0 <fork+0x10e>
  80219e:	eb 16                	jmp    8021b6 <fork+0x124>
  8021a0:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8021a3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8021a6:	89 d6                	mov    %edx,%esi
  8021a8:	89 c7                	mov    %eax,%edi
  8021aa:	48 b8 11 1f 80 00 00 	movabs $0x801f11,%rax
  8021b1:	00 00 00 
  8021b4:	ff d0                	callq  *%rax
  8021b6:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8021ba:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8021bd:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  8021c0:	7c b4                	jl     802176 <fork+0xe4>
  8021c2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8021c5:	3d ff 07 00 08       	cmp    $0x80007ff,%eax
  8021ca:	0f 86 4e ff ff ff    	jbe    80211e <fork+0x8c>
  8021d0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8021d3:	ba 07 00 00 00       	mov    $0x7,%edx
  8021d8:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  8021dd:	89 c7                	mov    %eax,%edi
  8021df:	48 b8 14 18 80 00 00 	movabs $0x801814,%rax
  8021e6:	00 00 00 
  8021e9:	ff d0                	callq  *%rax
  8021eb:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8021ee:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8021f2:	79 30                	jns    802224 <fork+0x192>
  8021f4:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8021f7:	89 c1                	mov    %eax,%ecx
  8021f9:	48 ba 28 4e 80 00 00 	movabs $0x804e28,%rdx
  802200:	00 00 00 
  802203:	be bc 00 00 00       	mov    $0xbc,%esi
  802208:	48 bf b1 4d 80 00 00 	movabs $0x804db1,%rdi
  80220f:	00 00 00 
  802212:	b8 00 00 00 00       	mov    $0x0,%eax
  802217:	49 b8 ba 43 80 00 00 	movabs $0x8043ba,%r8
  80221e:	00 00 00 
  802221:	41 ff d0             	callq  *%r8
  802224:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80222b:	00 00 00 
  80222e:	48 8b 00             	mov    (%rax),%rax
  802231:	48 8b 90 f0 00 00 00 	mov    0xf0(%rax),%rdx
  802238:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80223b:	48 89 d6             	mov    %rdx,%rsi
  80223e:	89 c7                	mov    %eax,%edi
  802240:	48 b8 9e 19 80 00 00 	movabs $0x80199e,%rax
  802247:	00 00 00 
  80224a:	ff d0                	callq  *%rax
  80224c:	89 45 f0             	mov    %eax,-0x10(%rbp)
  80224f:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802253:	79 30                	jns    802285 <fork+0x1f3>
  802255:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802258:	89 c1                	mov    %eax,%ecx
  80225a:	48 ba 48 4e 80 00 00 	movabs $0x804e48,%rdx
  802261:	00 00 00 
  802264:	be c0 00 00 00       	mov    $0xc0,%esi
  802269:	48 bf b1 4d 80 00 00 	movabs $0x804db1,%rdi
  802270:	00 00 00 
  802273:	b8 00 00 00 00       	mov    $0x0,%eax
  802278:	49 b8 ba 43 80 00 00 	movabs $0x8043ba,%r8
  80227f:	00 00 00 
  802282:	41 ff d0             	callq  *%r8
  802285:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802288:	be 02 00 00 00       	mov    $0x2,%esi
  80228d:	89 c7                	mov    %eax,%edi
  80228f:	48 b8 09 19 80 00 00 	movabs $0x801909,%rax
  802296:	00 00 00 
  802299:	ff d0                	callq  *%rax
  80229b:	89 45 f0             	mov    %eax,-0x10(%rbp)
  80229e:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8022a2:	79 30                	jns    8022d4 <fork+0x242>
  8022a4:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8022a7:	89 c1                	mov    %eax,%ecx
  8022a9:	48 ba 67 4e 80 00 00 	movabs $0x804e67,%rdx
  8022b0:	00 00 00 
  8022b3:	be c5 00 00 00       	mov    $0xc5,%esi
  8022b8:	48 bf b1 4d 80 00 00 	movabs $0x804db1,%rdi
  8022bf:	00 00 00 
  8022c2:	b8 00 00 00 00       	mov    $0x0,%eax
  8022c7:	49 b8 ba 43 80 00 00 	movabs $0x8043ba,%r8
  8022ce:	00 00 00 
  8022d1:	41 ff d0             	callq  *%r8
  8022d4:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8022d7:	c9                   	leaveq 
  8022d8:	c3                   	retq   

00000000008022d9 <sfork>:
  8022d9:	55                   	push   %rbp
  8022da:	48 89 e5             	mov    %rsp,%rbp
  8022dd:	48 ba 7e 4e 80 00 00 	movabs $0x804e7e,%rdx
  8022e4:	00 00 00 
  8022e7:	be d2 00 00 00       	mov    $0xd2,%esi
  8022ec:	48 bf b1 4d 80 00 00 	movabs $0x804db1,%rdi
  8022f3:	00 00 00 
  8022f6:	b8 00 00 00 00       	mov    $0x0,%eax
  8022fb:	48 b9 ba 43 80 00 00 	movabs $0x8043ba,%rcx
  802302:	00 00 00 
  802305:	ff d1                	callq  *%rcx

0000000000802307 <fd2num>:
  802307:	55                   	push   %rbp
  802308:	48 89 e5             	mov    %rsp,%rbp
  80230b:	48 83 ec 08          	sub    $0x8,%rsp
  80230f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802313:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802317:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  80231e:	ff ff ff 
  802321:	48 01 d0             	add    %rdx,%rax
  802324:	48 c1 e8 0c          	shr    $0xc,%rax
  802328:	c9                   	leaveq 
  802329:	c3                   	retq   

000000000080232a <fd2data>:
  80232a:	55                   	push   %rbp
  80232b:	48 89 e5             	mov    %rsp,%rbp
  80232e:	48 83 ec 08          	sub    $0x8,%rsp
  802332:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802336:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80233a:	48 89 c7             	mov    %rax,%rdi
  80233d:	48 b8 07 23 80 00 00 	movabs $0x802307,%rax
  802344:	00 00 00 
  802347:	ff d0                	callq  *%rax
  802349:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  80234f:	48 c1 e0 0c          	shl    $0xc,%rax
  802353:	c9                   	leaveq 
  802354:	c3                   	retq   

0000000000802355 <fd_alloc>:
  802355:	55                   	push   %rbp
  802356:	48 89 e5             	mov    %rsp,%rbp
  802359:	48 83 ec 18          	sub    $0x18,%rsp
  80235d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802361:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802368:	eb 6b                	jmp    8023d5 <fd_alloc+0x80>
  80236a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80236d:	48 98                	cltq   
  80236f:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802375:	48 c1 e0 0c          	shl    $0xc,%rax
  802379:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80237d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802381:	48 c1 e8 15          	shr    $0x15,%rax
  802385:	48 89 c2             	mov    %rax,%rdx
  802388:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  80238f:	01 00 00 
  802392:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802396:	83 e0 01             	and    $0x1,%eax
  802399:	48 85 c0             	test   %rax,%rax
  80239c:	74 21                	je     8023bf <fd_alloc+0x6a>
  80239e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8023a2:	48 c1 e8 0c          	shr    $0xc,%rax
  8023a6:	48 89 c2             	mov    %rax,%rdx
  8023a9:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8023b0:	01 00 00 
  8023b3:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8023b7:	83 e0 01             	and    $0x1,%eax
  8023ba:	48 85 c0             	test   %rax,%rax
  8023bd:	75 12                	jne    8023d1 <fd_alloc+0x7c>
  8023bf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8023c3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8023c7:	48 89 10             	mov    %rdx,(%rax)
  8023ca:	b8 00 00 00 00       	mov    $0x0,%eax
  8023cf:	eb 1a                	jmp    8023eb <fd_alloc+0x96>
  8023d1:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8023d5:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  8023d9:	7e 8f                	jle    80236a <fd_alloc+0x15>
  8023db:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8023df:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  8023e6:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  8023eb:	c9                   	leaveq 
  8023ec:	c3                   	retq   

00000000008023ed <fd_lookup>:
  8023ed:	55                   	push   %rbp
  8023ee:	48 89 e5             	mov    %rsp,%rbp
  8023f1:	48 83 ec 20          	sub    $0x20,%rsp
  8023f5:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8023f8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8023fc:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802400:	78 06                	js     802408 <fd_lookup+0x1b>
  802402:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  802406:	7e 07                	jle    80240f <fd_lookup+0x22>
  802408:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80240d:	eb 6c                	jmp    80247b <fd_lookup+0x8e>
  80240f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802412:	48 98                	cltq   
  802414:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  80241a:	48 c1 e0 0c          	shl    $0xc,%rax
  80241e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802422:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802426:	48 c1 e8 15          	shr    $0x15,%rax
  80242a:	48 89 c2             	mov    %rax,%rdx
  80242d:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802434:	01 00 00 
  802437:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80243b:	83 e0 01             	and    $0x1,%eax
  80243e:	48 85 c0             	test   %rax,%rax
  802441:	74 21                	je     802464 <fd_lookup+0x77>
  802443:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802447:	48 c1 e8 0c          	shr    $0xc,%rax
  80244b:	48 89 c2             	mov    %rax,%rdx
  80244e:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802455:	01 00 00 
  802458:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80245c:	83 e0 01             	and    $0x1,%eax
  80245f:	48 85 c0             	test   %rax,%rax
  802462:	75 07                	jne    80246b <fd_lookup+0x7e>
  802464:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802469:	eb 10                	jmp    80247b <fd_lookup+0x8e>
  80246b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80246f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802473:	48 89 10             	mov    %rdx,(%rax)
  802476:	b8 00 00 00 00       	mov    $0x0,%eax
  80247b:	c9                   	leaveq 
  80247c:	c3                   	retq   

000000000080247d <fd_close>:
  80247d:	55                   	push   %rbp
  80247e:	48 89 e5             	mov    %rsp,%rbp
  802481:	48 83 ec 30          	sub    $0x30,%rsp
  802485:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802489:	89 f0                	mov    %esi,%eax
  80248b:	88 45 d4             	mov    %al,-0x2c(%rbp)
  80248e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802492:	48 89 c7             	mov    %rax,%rdi
  802495:	48 b8 07 23 80 00 00 	movabs $0x802307,%rax
  80249c:	00 00 00 
  80249f:	ff d0                	callq  *%rax
  8024a1:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8024a5:	48 89 d6             	mov    %rdx,%rsi
  8024a8:	89 c7                	mov    %eax,%edi
  8024aa:	48 b8 ed 23 80 00 00 	movabs $0x8023ed,%rax
  8024b1:	00 00 00 
  8024b4:	ff d0                	callq  *%rax
  8024b6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8024b9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8024bd:	78 0a                	js     8024c9 <fd_close+0x4c>
  8024bf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8024c3:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  8024c7:	74 12                	je     8024db <fd_close+0x5e>
  8024c9:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  8024cd:	74 05                	je     8024d4 <fd_close+0x57>
  8024cf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024d2:	eb 05                	jmp    8024d9 <fd_close+0x5c>
  8024d4:	b8 00 00 00 00       	mov    $0x0,%eax
  8024d9:	eb 69                	jmp    802544 <fd_close+0xc7>
  8024db:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8024df:	8b 00                	mov    (%rax),%eax
  8024e1:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8024e5:	48 89 d6             	mov    %rdx,%rsi
  8024e8:	89 c7                	mov    %eax,%edi
  8024ea:	48 b8 46 25 80 00 00 	movabs $0x802546,%rax
  8024f1:	00 00 00 
  8024f4:	ff d0                	callq  *%rax
  8024f6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8024f9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8024fd:	78 2a                	js     802529 <fd_close+0xac>
  8024ff:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802503:	48 8b 40 20          	mov    0x20(%rax),%rax
  802507:	48 85 c0             	test   %rax,%rax
  80250a:	74 16                	je     802522 <fd_close+0xa5>
  80250c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802510:	48 8b 40 20          	mov    0x20(%rax),%rax
  802514:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802518:	48 89 d7             	mov    %rdx,%rdi
  80251b:	ff d0                	callq  *%rax
  80251d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802520:	eb 07                	jmp    802529 <fd_close+0xac>
  802522:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802529:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80252d:	48 89 c6             	mov    %rax,%rsi
  802530:	bf 00 00 00 00       	mov    $0x0,%edi
  802535:	48 b8 bf 18 80 00 00 	movabs $0x8018bf,%rax
  80253c:	00 00 00 
  80253f:	ff d0                	callq  *%rax
  802541:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802544:	c9                   	leaveq 
  802545:	c3                   	retq   

0000000000802546 <dev_lookup>:
  802546:	55                   	push   %rbp
  802547:	48 89 e5             	mov    %rsp,%rbp
  80254a:	48 83 ec 20          	sub    $0x20,%rsp
  80254e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802551:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802555:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80255c:	eb 41                	jmp    80259f <dev_lookup+0x59>
  80255e:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802565:	00 00 00 
  802568:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80256b:	48 63 d2             	movslq %edx,%rdx
  80256e:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802572:	8b 00                	mov    (%rax),%eax
  802574:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  802577:	75 22                	jne    80259b <dev_lookup+0x55>
  802579:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802580:	00 00 00 
  802583:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802586:	48 63 d2             	movslq %edx,%rdx
  802589:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  80258d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802591:	48 89 10             	mov    %rdx,(%rax)
  802594:	b8 00 00 00 00       	mov    $0x0,%eax
  802599:	eb 60                	jmp    8025fb <dev_lookup+0xb5>
  80259b:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80259f:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  8025a6:	00 00 00 
  8025a9:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8025ac:	48 63 d2             	movslq %edx,%rdx
  8025af:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8025b3:	48 85 c0             	test   %rax,%rax
  8025b6:	75 a6                	jne    80255e <dev_lookup+0x18>
  8025b8:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8025bf:	00 00 00 
  8025c2:	48 8b 00             	mov    (%rax),%rax
  8025c5:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8025cb:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8025ce:	89 c6                	mov    %eax,%esi
  8025d0:	48 bf 98 4e 80 00 00 	movabs $0x804e98,%rdi
  8025d7:	00 00 00 
  8025da:	b8 00 00 00 00       	mov    $0x0,%eax
  8025df:	48 b9 30 03 80 00 00 	movabs $0x800330,%rcx
  8025e6:	00 00 00 
  8025e9:	ff d1                	callq  *%rcx
  8025eb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8025ef:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  8025f6:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8025fb:	c9                   	leaveq 
  8025fc:	c3                   	retq   

00000000008025fd <close>:
  8025fd:	55                   	push   %rbp
  8025fe:	48 89 e5             	mov    %rsp,%rbp
  802601:	48 83 ec 20          	sub    $0x20,%rsp
  802605:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802608:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80260c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80260f:	48 89 d6             	mov    %rdx,%rsi
  802612:	89 c7                	mov    %eax,%edi
  802614:	48 b8 ed 23 80 00 00 	movabs $0x8023ed,%rax
  80261b:	00 00 00 
  80261e:	ff d0                	callq  *%rax
  802620:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802623:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802627:	79 05                	jns    80262e <close+0x31>
  802629:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80262c:	eb 18                	jmp    802646 <close+0x49>
  80262e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802632:	be 01 00 00 00       	mov    $0x1,%esi
  802637:	48 89 c7             	mov    %rax,%rdi
  80263a:	48 b8 7d 24 80 00 00 	movabs $0x80247d,%rax
  802641:	00 00 00 
  802644:	ff d0                	callq  *%rax
  802646:	c9                   	leaveq 
  802647:	c3                   	retq   

0000000000802648 <close_all>:
  802648:	55                   	push   %rbp
  802649:	48 89 e5             	mov    %rsp,%rbp
  80264c:	48 83 ec 10          	sub    $0x10,%rsp
  802650:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802657:	eb 15                	jmp    80266e <close_all+0x26>
  802659:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80265c:	89 c7                	mov    %eax,%edi
  80265e:	48 b8 fd 25 80 00 00 	movabs $0x8025fd,%rax
  802665:	00 00 00 
  802668:	ff d0                	callq  *%rax
  80266a:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80266e:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802672:	7e e5                	jle    802659 <close_all+0x11>
  802674:	c9                   	leaveq 
  802675:	c3                   	retq   

0000000000802676 <dup>:
  802676:	55                   	push   %rbp
  802677:	48 89 e5             	mov    %rsp,%rbp
  80267a:	48 83 ec 40          	sub    $0x40,%rsp
  80267e:	89 7d cc             	mov    %edi,-0x34(%rbp)
  802681:	89 75 c8             	mov    %esi,-0x38(%rbp)
  802684:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  802688:	8b 45 cc             	mov    -0x34(%rbp),%eax
  80268b:	48 89 d6             	mov    %rdx,%rsi
  80268e:	89 c7                	mov    %eax,%edi
  802690:	48 b8 ed 23 80 00 00 	movabs $0x8023ed,%rax
  802697:	00 00 00 
  80269a:	ff d0                	callq  *%rax
  80269c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80269f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8026a3:	79 08                	jns    8026ad <dup+0x37>
  8026a5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8026a8:	e9 70 01 00 00       	jmpq   80281d <dup+0x1a7>
  8026ad:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8026b0:	89 c7                	mov    %eax,%edi
  8026b2:	48 b8 fd 25 80 00 00 	movabs $0x8025fd,%rax
  8026b9:	00 00 00 
  8026bc:	ff d0                	callq  *%rax
  8026be:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8026c1:	48 98                	cltq   
  8026c3:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  8026c9:	48 c1 e0 0c          	shl    $0xc,%rax
  8026cd:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8026d1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8026d5:	48 89 c7             	mov    %rax,%rdi
  8026d8:	48 b8 2a 23 80 00 00 	movabs $0x80232a,%rax
  8026df:	00 00 00 
  8026e2:	ff d0                	callq  *%rax
  8026e4:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8026e8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8026ec:	48 89 c7             	mov    %rax,%rdi
  8026ef:	48 b8 2a 23 80 00 00 	movabs $0x80232a,%rax
  8026f6:	00 00 00 
  8026f9:	ff d0                	callq  *%rax
  8026fb:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8026ff:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802703:	48 c1 e8 15          	shr    $0x15,%rax
  802707:	48 89 c2             	mov    %rax,%rdx
  80270a:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802711:	01 00 00 
  802714:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802718:	83 e0 01             	and    $0x1,%eax
  80271b:	48 85 c0             	test   %rax,%rax
  80271e:	74 73                	je     802793 <dup+0x11d>
  802720:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802724:	48 c1 e8 0c          	shr    $0xc,%rax
  802728:	48 89 c2             	mov    %rax,%rdx
  80272b:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802732:	01 00 00 
  802735:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802739:	83 e0 01             	and    $0x1,%eax
  80273c:	48 85 c0             	test   %rax,%rax
  80273f:	74 52                	je     802793 <dup+0x11d>
  802741:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802745:	48 c1 e8 0c          	shr    $0xc,%rax
  802749:	48 89 c2             	mov    %rax,%rdx
  80274c:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802753:	01 00 00 
  802756:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80275a:	25 07 0e 00 00       	and    $0xe07,%eax
  80275f:	89 c1                	mov    %eax,%ecx
  802761:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802765:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802769:	41 89 c8             	mov    %ecx,%r8d
  80276c:	48 89 d1             	mov    %rdx,%rcx
  80276f:	ba 00 00 00 00       	mov    $0x0,%edx
  802774:	48 89 c6             	mov    %rax,%rsi
  802777:	bf 00 00 00 00       	mov    $0x0,%edi
  80277c:	48 b8 64 18 80 00 00 	movabs $0x801864,%rax
  802783:	00 00 00 
  802786:	ff d0                	callq  *%rax
  802788:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80278b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80278f:	79 02                	jns    802793 <dup+0x11d>
  802791:	eb 57                	jmp    8027ea <dup+0x174>
  802793:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802797:	48 c1 e8 0c          	shr    $0xc,%rax
  80279b:	48 89 c2             	mov    %rax,%rdx
  80279e:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8027a5:	01 00 00 
  8027a8:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8027ac:	25 07 0e 00 00       	and    $0xe07,%eax
  8027b1:	89 c1                	mov    %eax,%ecx
  8027b3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8027b7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8027bb:	41 89 c8             	mov    %ecx,%r8d
  8027be:	48 89 d1             	mov    %rdx,%rcx
  8027c1:	ba 00 00 00 00       	mov    $0x0,%edx
  8027c6:	48 89 c6             	mov    %rax,%rsi
  8027c9:	bf 00 00 00 00       	mov    $0x0,%edi
  8027ce:	48 b8 64 18 80 00 00 	movabs $0x801864,%rax
  8027d5:	00 00 00 
  8027d8:	ff d0                	callq  *%rax
  8027da:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8027dd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8027e1:	79 02                	jns    8027e5 <dup+0x16f>
  8027e3:	eb 05                	jmp    8027ea <dup+0x174>
  8027e5:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8027e8:	eb 33                	jmp    80281d <dup+0x1a7>
  8027ea:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8027ee:	48 89 c6             	mov    %rax,%rsi
  8027f1:	bf 00 00 00 00       	mov    $0x0,%edi
  8027f6:	48 b8 bf 18 80 00 00 	movabs $0x8018bf,%rax
  8027fd:	00 00 00 
  802800:	ff d0                	callq  *%rax
  802802:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802806:	48 89 c6             	mov    %rax,%rsi
  802809:	bf 00 00 00 00       	mov    $0x0,%edi
  80280e:	48 b8 bf 18 80 00 00 	movabs $0x8018bf,%rax
  802815:	00 00 00 
  802818:	ff d0                	callq  *%rax
  80281a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80281d:	c9                   	leaveq 
  80281e:	c3                   	retq   

000000000080281f <read>:
  80281f:	55                   	push   %rbp
  802820:	48 89 e5             	mov    %rsp,%rbp
  802823:	48 83 ec 40          	sub    $0x40,%rsp
  802827:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80282a:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80282e:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802832:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802836:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802839:	48 89 d6             	mov    %rdx,%rsi
  80283c:	89 c7                	mov    %eax,%edi
  80283e:	48 b8 ed 23 80 00 00 	movabs $0x8023ed,%rax
  802845:	00 00 00 
  802848:	ff d0                	callq  *%rax
  80284a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80284d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802851:	78 24                	js     802877 <read+0x58>
  802853:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802857:	8b 00                	mov    (%rax),%eax
  802859:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80285d:	48 89 d6             	mov    %rdx,%rsi
  802860:	89 c7                	mov    %eax,%edi
  802862:	48 b8 46 25 80 00 00 	movabs $0x802546,%rax
  802869:	00 00 00 
  80286c:	ff d0                	callq  *%rax
  80286e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802871:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802875:	79 05                	jns    80287c <read+0x5d>
  802877:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80287a:	eb 76                	jmp    8028f2 <read+0xd3>
  80287c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802880:	8b 40 08             	mov    0x8(%rax),%eax
  802883:	83 e0 03             	and    $0x3,%eax
  802886:	83 f8 01             	cmp    $0x1,%eax
  802889:	75 3a                	jne    8028c5 <read+0xa6>
  80288b:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802892:	00 00 00 
  802895:	48 8b 00             	mov    (%rax),%rax
  802898:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80289e:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8028a1:	89 c6                	mov    %eax,%esi
  8028a3:	48 bf b7 4e 80 00 00 	movabs $0x804eb7,%rdi
  8028aa:	00 00 00 
  8028ad:	b8 00 00 00 00       	mov    $0x0,%eax
  8028b2:	48 b9 30 03 80 00 00 	movabs $0x800330,%rcx
  8028b9:	00 00 00 
  8028bc:	ff d1                	callq  *%rcx
  8028be:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8028c3:	eb 2d                	jmp    8028f2 <read+0xd3>
  8028c5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8028c9:	48 8b 40 10          	mov    0x10(%rax),%rax
  8028cd:	48 85 c0             	test   %rax,%rax
  8028d0:	75 07                	jne    8028d9 <read+0xba>
  8028d2:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8028d7:	eb 19                	jmp    8028f2 <read+0xd3>
  8028d9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8028dd:	48 8b 40 10          	mov    0x10(%rax),%rax
  8028e1:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8028e5:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8028e9:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  8028ed:	48 89 cf             	mov    %rcx,%rdi
  8028f0:	ff d0                	callq  *%rax
  8028f2:	c9                   	leaveq 
  8028f3:	c3                   	retq   

00000000008028f4 <readn>:
  8028f4:	55                   	push   %rbp
  8028f5:	48 89 e5             	mov    %rsp,%rbp
  8028f8:	48 83 ec 30          	sub    $0x30,%rsp
  8028fc:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8028ff:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802903:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802907:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80290e:	eb 49                	jmp    802959 <readn+0x65>
  802910:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802913:	48 98                	cltq   
  802915:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802919:	48 29 c2             	sub    %rax,%rdx
  80291c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80291f:	48 63 c8             	movslq %eax,%rcx
  802922:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802926:	48 01 c1             	add    %rax,%rcx
  802929:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80292c:	48 89 ce             	mov    %rcx,%rsi
  80292f:	89 c7                	mov    %eax,%edi
  802931:	48 b8 1f 28 80 00 00 	movabs $0x80281f,%rax
  802938:	00 00 00 
  80293b:	ff d0                	callq  *%rax
  80293d:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802940:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802944:	79 05                	jns    80294b <readn+0x57>
  802946:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802949:	eb 1c                	jmp    802967 <readn+0x73>
  80294b:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80294f:	75 02                	jne    802953 <readn+0x5f>
  802951:	eb 11                	jmp    802964 <readn+0x70>
  802953:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802956:	01 45 fc             	add    %eax,-0x4(%rbp)
  802959:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80295c:	48 98                	cltq   
  80295e:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802962:	72 ac                	jb     802910 <readn+0x1c>
  802964:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802967:	c9                   	leaveq 
  802968:	c3                   	retq   

0000000000802969 <write>:
  802969:	55                   	push   %rbp
  80296a:	48 89 e5             	mov    %rsp,%rbp
  80296d:	48 83 ec 40          	sub    $0x40,%rsp
  802971:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802974:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802978:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80297c:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802980:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802983:	48 89 d6             	mov    %rdx,%rsi
  802986:	89 c7                	mov    %eax,%edi
  802988:	48 b8 ed 23 80 00 00 	movabs $0x8023ed,%rax
  80298f:	00 00 00 
  802992:	ff d0                	callq  *%rax
  802994:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802997:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80299b:	78 24                	js     8029c1 <write+0x58>
  80299d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8029a1:	8b 00                	mov    (%rax),%eax
  8029a3:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8029a7:	48 89 d6             	mov    %rdx,%rsi
  8029aa:	89 c7                	mov    %eax,%edi
  8029ac:	48 b8 46 25 80 00 00 	movabs $0x802546,%rax
  8029b3:	00 00 00 
  8029b6:	ff d0                	callq  *%rax
  8029b8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8029bb:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8029bf:	79 05                	jns    8029c6 <write+0x5d>
  8029c1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029c4:	eb 75                	jmp    802a3b <write+0xd2>
  8029c6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8029ca:	8b 40 08             	mov    0x8(%rax),%eax
  8029cd:	83 e0 03             	and    $0x3,%eax
  8029d0:	85 c0                	test   %eax,%eax
  8029d2:	75 3a                	jne    802a0e <write+0xa5>
  8029d4:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8029db:	00 00 00 
  8029de:	48 8b 00             	mov    (%rax),%rax
  8029e1:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8029e7:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8029ea:	89 c6                	mov    %eax,%esi
  8029ec:	48 bf d3 4e 80 00 00 	movabs $0x804ed3,%rdi
  8029f3:	00 00 00 
  8029f6:	b8 00 00 00 00       	mov    $0x0,%eax
  8029fb:	48 b9 30 03 80 00 00 	movabs $0x800330,%rcx
  802a02:	00 00 00 
  802a05:	ff d1                	callq  *%rcx
  802a07:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802a0c:	eb 2d                	jmp    802a3b <write+0xd2>
  802a0e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802a12:	48 8b 40 18          	mov    0x18(%rax),%rax
  802a16:	48 85 c0             	test   %rax,%rax
  802a19:	75 07                	jne    802a22 <write+0xb9>
  802a1b:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802a20:	eb 19                	jmp    802a3b <write+0xd2>
  802a22:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802a26:	48 8b 40 18          	mov    0x18(%rax),%rax
  802a2a:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802a2e:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802a32:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802a36:	48 89 cf             	mov    %rcx,%rdi
  802a39:	ff d0                	callq  *%rax
  802a3b:	c9                   	leaveq 
  802a3c:	c3                   	retq   

0000000000802a3d <seek>:
  802a3d:	55                   	push   %rbp
  802a3e:	48 89 e5             	mov    %rsp,%rbp
  802a41:	48 83 ec 18          	sub    $0x18,%rsp
  802a45:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802a48:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802a4b:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802a4f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802a52:	48 89 d6             	mov    %rdx,%rsi
  802a55:	89 c7                	mov    %eax,%edi
  802a57:	48 b8 ed 23 80 00 00 	movabs $0x8023ed,%rax
  802a5e:	00 00 00 
  802a61:	ff d0                	callq  *%rax
  802a63:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802a66:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802a6a:	79 05                	jns    802a71 <seek+0x34>
  802a6c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a6f:	eb 0f                	jmp    802a80 <seek+0x43>
  802a71:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802a75:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802a78:	89 50 04             	mov    %edx,0x4(%rax)
  802a7b:	b8 00 00 00 00       	mov    $0x0,%eax
  802a80:	c9                   	leaveq 
  802a81:	c3                   	retq   

0000000000802a82 <ftruncate>:
  802a82:	55                   	push   %rbp
  802a83:	48 89 e5             	mov    %rsp,%rbp
  802a86:	48 83 ec 30          	sub    $0x30,%rsp
  802a8a:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802a8d:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802a90:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802a94:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802a97:	48 89 d6             	mov    %rdx,%rsi
  802a9a:	89 c7                	mov    %eax,%edi
  802a9c:	48 b8 ed 23 80 00 00 	movabs $0x8023ed,%rax
  802aa3:	00 00 00 
  802aa6:	ff d0                	callq  *%rax
  802aa8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802aab:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802aaf:	78 24                	js     802ad5 <ftruncate+0x53>
  802ab1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ab5:	8b 00                	mov    (%rax),%eax
  802ab7:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802abb:	48 89 d6             	mov    %rdx,%rsi
  802abe:	89 c7                	mov    %eax,%edi
  802ac0:	48 b8 46 25 80 00 00 	movabs $0x802546,%rax
  802ac7:	00 00 00 
  802aca:	ff d0                	callq  *%rax
  802acc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802acf:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ad3:	79 05                	jns    802ada <ftruncate+0x58>
  802ad5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ad8:	eb 72                	jmp    802b4c <ftruncate+0xca>
  802ada:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ade:	8b 40 08             	mov    0x8(%rax),%eax
  802ae1:	83 e0 03             	and    $0x3,%eax
  802ae4:	85 c0                	test   %eax,%eax
  802ae6:	75 3a                	jne    802b22 <ftruncate+0xa0>
  802ae8:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802aef:	00 00 00 
  802af2:	48 8b 00             	mov    (%rax),%rax
  802af5:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802afb:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802afe:	89 c6                	mov    %eax,%esi
  802b00:	48 bf f0 4e 80 00 00 	movabs $0x804ef0,%rdi
  802b07:	00 00 00 
  802b0a:	b8 00 00 00 00       	mov    $0x0,%eax
  802b0f:	48 b9 30 03 80 00 00 	movabs $0x800330,%rcx
  802b16:	00 00 00 
  802b19:	ff d1                	callq  *%rcx
  802b1b:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802b20:	eb 2a                	jmp    802b4c <ftruncate+0xca>
  802b22:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802b26:	48 8b 40 30          	mov    0x30(%rax),%rax
  802b2a:	48 85 c0             	test   %rax,%rax
  802b2d:	75 07                	jne    802b36 <ftruncate+0xb4>
  802b2f:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802b34:	eb 16                	jmp    802b4c <ftruncate+0xca>
  802b36:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802b3a:	48 8b 40 30          	mov    0x30(%rax),%rax
  802b3e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802b42:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  802b45:	89 ce                	mov    %ecx,%esi
  802b47:	48 89 d7             	mov    %rdx,%rdi
  802b4a:	ff d0                	callq  *%rax
  802b4c:	c9                   	leaveq 
  802b4d:	c3                   	retq   

0000000000802b4e <fstat>:
  802b4e:	55                   	push   %rbp
  802b4f:	48 89 e5             	mov    %rsp,%rbp
  802b52:	48 83 ec 30          	sub    $0x30,%rsp
  802b56:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802b59:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802b5d:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802b61:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802b64:	48 89 d6             	mov    %rdx,%rsi
  802b67:	89 c7                	mov    %eax,%edi
  802b69:	48 b8 ed 23 80 00 00 	movabs $0x8023ed,%rax
  802b70:	00 00 00 
  802b73:	ff d0                	callq  *%rax
  802b75:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b78:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b7c:	78 24                	js     802ba2 <fstat+0x54>
  802b7e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b82:	8b 00                	mov    (%rax),%eax
  802b84:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802b88:	48 89 d6             	mov    %rdx,%rsi
  802b8b:	89 c7                	mov    %eax,%edi
  802b8d:	48 b8 46 25 80 00 00 	movabs $0x802546,%rax
  802b94:	00 00 00 
  802b97:	ff d0                	callq  *%rax
  802b99:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b9c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ba0:	79 05                	jns    802ba7 <fstat+0x59>
  802ba2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ba5:	eb 5e                	jmp    802c05 <fstat+0xb7>
  802ba7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802bab:	48 8b 40 28          	mov    0x28(%rax),%rax
  802baf:	48 85 c0             	test   %rax,%rax
  802bb2:	75 07                	jne    802bbb <fstat+0x6d>
  802bb4:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802bb9:	eb 4a                	jmp    802c05 <fstat+0xb7>
  802bbb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802bbf:	c6 00 00             	movb   $0x0,(%rax)
  802bc2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802bc6:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  802bcd:	00 00 00 
  802bd0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802bd4:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  802bdb:	00 00 00 
  802bde:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802be2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802be6:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  802bed:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802bf1:	48 8b 40 28          	mov    0x28(%rax),%rax
  802bf5:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802bf9:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  802bfd:	48 89 ce             	mov    %rcx,%rsi
  802c00:	48 89 d7             	mov    %rdx,%rdi
  802c03:	ff d0                	callq  *%rax
  802c05:	c9                   	leaveq 
  802c06:	c3                   	retq   

0000000000802c07 <stat>:
  802c07:	55                   	push   %rbp
  802c08:	48 89 e5             	mov    %rsp,%rbp
  802c0b:	48 83 ec 20          	sub    $0x20,%rsp
  802c0f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802c13:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802c17:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c1b:	be 00 00 00 00       	mov    $0x0,%esi
  802c20:	48 89 c7             	mov    %rax,%rdi
  802c23:	48 b8 f5 2c 80 00 00 	movabs $0x802cf5,%rax
  802c2a:	00 00 00 
  802c2d:	ff d0                	callq  *%rax
  802c2f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c32:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c36:	79 05                	jns    802c3d <stat+0x36>
  802c38:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c3b:	eb 2f                	jmp    802c6c <stat+0x65>
  802c3d:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802c41:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c44:	48 89 d6             	mov    %rdx,%rsi
  802c47:	89 c7                	mov    %eax,%edi
  802c49:	48 b8 4e 2b 80 00 00 	movabs $0x802b4e,%rax
  802c50:	00 00 00 
  802c53:	ff d0                	callq  *%rax
  802c55:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802c58:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c5b:	89 c7                	mov    %eax,%edi
  802c5d:	48 b8 fd 25 80 00 00 	movabs $0x8025fd,%rax
  802c64:	00 00 00 
  802c67:	ff d0                	callq  *%rax
  802c69:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802c6c:	c9                   	leaveq 
  802c6d:	c3                   	retq   

0000000000802c6e <fsipc>:
  802c6e:	55                   	push   %rbp
  802c6f:	48 89 e5             	mov    %rsp,%rbp
  802c72:	48 83 ec 10          	sub    $0x10,%rsp
  802c76:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802c79:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802c7d:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802c84:	00 00 00 
  802c87:	8b 00                	mov    (%rax),%eax
  802c89:	85 c0                	test   %eax,%eax
  802c8b:	75 1d                	jne    802caa <fsipc+0x3c>
  802c8d:	bf 01 00 00 00       	mov    $0x1,%edi
  802c92:	48 b8 4d 47 80 00 00 	movabs $0x80474d,%rax
  802c99:	00 00 00 
  802c9c:	ff d0                	callq  *%rax
  802c9e:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  802ca5:	00 00 00 
  802ca8:	89 02                	mov    %eax,(%rdx)
  802caa:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802cb1:	00 00 00 
  802cb4:	8b 00                	mov    (%rax),%eax
  802cb6:	8b 75 fc             	mov    -0x4(%rbp),%esi
  802cb9:	b9 07 00 00 00       	mov    $0x7,%ecx
  802cbe:	48 ba 00 90 80 00 00 	movabs $0x809000,%rdx
  802cc5:	00 00 00 
  802cc8:	89 c7                	mov    %eax,%edi
  802cca:	48 b8 b7 46 80 00 00 	movabs $0x8046b7,%rax
  802cd1:	00 00 00 
  802cd4:	ff d0                	callq  *%rax
  802cd6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802cda:	ba 00 00 00 00       	mov    $0x0,%edx
  802cdf:	48 89 c6             	mov    %rax,%rsi
  802ce2:	bf 00 00 00 00       	mov    $0x0,%edi
  802ce7:	48 b8 f6 45 80 00 00 	movabs $0x8045f6,%rax
  802cee:	00 00 00 
  802cf1:	ff d0                	callq  *%rax
  802cf3:	c9                   	leaveq 
  802cf4:	c3                   	retq   

0000000000802cf5 <open>:
  802cf5:	55                   	push   %rbp
  802cf6:	48 89 e5             	mov    %rsp,%rbp
  802cf9:	48 83 ec 20          	sub    $0x20,%rsp
  802cfd:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802d01:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  802d04:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d08:	48 89 c7             	mov    %rax,%rdi
  802d0b:	48 b8 79 0e 80 00 00 	movabs $0x800e79,%rax
  802d12:	00 00 00 
  802d15:	ff d0                	callq  *%rax
  802d17:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802d1c:	7e 0a                	jle    802d28 <open+0x33>
  802d1e:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802d23:	e9 a5 00 00 00       	jmpq   802dcd <open+0xd8>
  802d28:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802d2c:	48 89 c7             	mov    %rax,%rdi
  802d2f:	48 b8 55 23 80 00 00 	movabs $0x802355,%rax
  802d36:	00 00 00 
  802d39:	ff d0                	callq  *%rax
  802d3b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d3e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d42:	79 08                	jns    802d4c <open+0x57>
  802d44:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d47:	e9 81 00 00 00       	jmpq   802dcd <open+0xd8>
  802d4c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d50:	48 89 c6             	mov    %rax,%rsi
  802d53:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  802d5a:	00 00 00 
  802d5d:	48 b8 e5 0e 80 00 00 	movabs $0x800ee5,%rax
  802d64:	00 00 00 
  802d67:	ff d0                	callq  *%rax
  802d69:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802d70:	00 00 00 
  802d73:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  802d76:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  802d7c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d80:	48 89 c6             	mov    %rax,%rsi
  802d83:	bf 01 00 00 00       	mov    $0x1,%edi
  802d88:	48 b8 6e 2c 80 00 00 	movabs $0x802c6e,%rax
  802d8f:	00 00 00 
  802d92:	ff d0                	callq  *%rax
  802d94:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d97:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d9b:	79 1d                	jns    802dba <open+0xc5>
  802d9d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802da1:	be 00 00 00 00       	mov    $0x0,%esi
  802da6:	48 89 c7             	mov    %rax,%rdi
  802da9:	48 b8 7d 24 80 00 00 	movabs $0x80247d,%rax
  802db0:	00 00 00 
  802db3:	ff d0                	callq  *%rax
  802db5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802db8:	eb 13                	jmp    802dcd <open+0xd8>
  802dba:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802dbe:	48 89 c7             	mov    %rax,%rdi
  802dc1:	48 b8 07 23 80 00 00 	movabs $0x802307,%rax
  802dc8:	00 00 00 
  802dcb:	ff d0                	callq  *%rax
  802dcd:	c9                   	leaveq 
  802dce:	c3                   	retq   

0000000000802dcf <devfile_flush>:
  802dcf:	55                   	push   %rbp
  802dd0:	48 89 e5             	mov    %rsp,%rbp
  802dd3:	48 83 ec 10          	sub    $0x10,%rsp
  802dd7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802ddb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802ddf:	8b 50 0c             	mov    0xc(%rax),%edx
  802de2:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802de9:	00 00 00 
  802dec:	89 10                	mov    %edx,(%rax)
  802dee:	be 00 00 00 00       	mov    $0x0,%esi
  802df3:	bf 06 00 00 00       	mov    $0x6,%edi
  802df8:	48 b8 6e 2c 80 00 00 	movabs $0x802c6e,%rax
  802dff:	00 00 00 
  802e02:	ff d0                	callq  *%rax
  802e04:	c9                   	leaveq 
  802e05:	c3                   	retq   

0000000000802e06 <devfile_read>:
  802e06:	55                   	push   %rbp
  802e07:	48 89 e5             	mov    %rsp,%rbp
  802e0a:	48 83 ec 30          	sub    $0x30,%rsp
  802e0e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802e12:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802e16:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802e1a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e1e:	8b 50 0c             	mov    0xc(%rax),%edx
  802e21:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802e28:	00 00 00 
  802e2b:	89 10                	mov    %edx,(%rax)
  802e2d:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802e34:	00 00 00 
  802e37:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802e3b:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802e3f:	be 00 00 00 00       	mov    $0x0,%esi
  802e44:	bf 03 00 00 00       	mov    $0x3,%edi
  802e49:	48 b8 6e 2c 80 00 00 	movabs $0x802c6e,%rax
  802e50:	00 00 00 
  802e53:	ff d0                	callq  *%rax
  802e55:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e58:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e5c:	79 08                	jns    802e66 <devfile_read+0x60>
  802e5e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e61:	e9 a4 00 00 00       	jmpq   802f0a <devfile_read+0x104>
  802e66:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e69:	48 98                	cltq   
  802e6b:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802e6f:	76 35                	jbe    802ea6 <devfile_read+0xa0>
  802e71:	48 b9 16 4f 80 00 00 	movabs $0x804f16,%rcx
  802e78:	00 00 00 
  802e7b:	48 ba 1d 4f 80 00 00 	movabs $0x804f1d,%rdx
  802e82:	00 00 00 
  802e85:	be 89 00 00 00       	mov    $0x89,%esi
  802e8a:	48 bf 32 4f 80 00 00 	movabs $0x804f32,%rdi
  802e91:	00 00 00 
  802e94:	b8 00 00 00 00       	mov    $0x0,%eax
  802e99:	49 b8 ba 43 80 00 00 	movabs $0x8043ba,%r8
  802ea0:	00 00 00 
  802ea3:	41 ff d0             	callq  *%r8
  802ea6:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  802ead:	7e 35                	jle    802ee4 <devfile_read+0xde>
  802eaf:	48 b9 40 4f 80 00 00 	movabs $0x804f40,%rcx
  802eb6:	00 00 00 
  802eb9:	48 ba 1d 4f 80 00 00 	movabs $0x804f1d,%rdx
  802ec0:	00 00 00 
  802ec3:	be 8a 00 00 00       	mov    $0x8a,%esi
  802ec8:	48 bf 32 4f 80 00 00 	movabs $0x804f32,%rdi
  802ecf:	00 00 00 
  802ed2:	b8 00 00 00 00       	mov    $0x0,%eax
  802ed7:	49 b8 ba 43 80 00 00 	movabs $0x8043ba,%r8
  802ede:	00 00 00 
  802ee1:	41 ff d0             	callq  *%r8
  802ee4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ee7:	48 63 d0             	movslq %eax,%rdx
  802eea:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802eee:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  802ef5:	00 00 00 
  802ef8:	48 89 c7             	mov    %rax,%rdi
  802efb:	48 b8 09 12 80 00 00 	movabs $0x801209,%rax
  802f02:	00 00 00 
  802f05:	ff d0                	callq  *%rax
  802f07:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f0a:	c9                   	leaveq 
  802f0b:	c3                   	retq   

0000000000802f0c <devfile_write>:
  802f0c:	55                   	push   %rbp
  802f0d:	48 89 e5             	mov    %rsp,%rbp
  802f10:	48 83 ec 40          	sub    $0x40,%rsp
  802f14:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802f18:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802f1c:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802f20:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  802f24:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802f28:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  802f2f:	00 
  802f30:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f34:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  802f38:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  802f3d:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  802f41:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802f45:	8b 50 0c             	mov    0xc(%rax),%edx
  802f48:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802f4f:	00 00 00 
  802f52:	89 10                	mov    %edx,(%rax)
  802f54:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802f5b:	00 00 00 
  802f5e:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802f62:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802f66:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802f6a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802f6e:	48 89 c6             	mov    %rax,%rsi
  802f71:	48 bf 10 90 80 00 00 	movabs $0x809010,%rdi
  802f78:	00 00 00 
  802f7b:	48 b8 09 12 80 00 00 	movabs $0x801209,%rax
  802f82:	00 00 00 
  802f85:	ff d0                	callq  *%rax
  802f87:	be 00 00 00 00       	mov    $0x0,%esi
  802f8c:	bf 04 00 00 00       	mov    $0x4,%edi
  802f91:	48 b8 6e 2c 80 00 00 	movabs $0x802c6e,%rax
  802f98:	00 00 00 
  802f9b:	ff d0                	callq  *%rax
  802f9d:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802fa0:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802fa4:	79 05                	jns    802fab <devfile_write+0x9f>
  802fa6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802fa9:	eb 43                	jmp    802fee <devfile_write+0xe2>
  802fab:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802fae:	48 98                	cltq   
  802fb0:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  802fb4:	76 35                	jbe    802feb <devfile_write+0xdf>
  802fb6:	48 b9 16 4f 80 00 00 	movabs $0x804f16,%rcx
  802fbd:	00 00 00 
  802fc0:	48 ba 1d 4f 80 00 00 	movabs $0x804f1d,%rdx
  802fc7:	00 00 00 
  802fca:	be a8 00 00 00       	mov    $0xa8,%esi
  802fcf:	48 bf 32 4f 80 00 00 	movabs $0x804f32,%rdi
  802fd6:	00 00 00 
  802fd9:	b8 00 00 00 00       	mov    $0x0,%eax
  802fde:	49 b8 ba 43 80 00 00 	movabs $0x8043ba,%r8
  802fe5:	00 00 00 
  802fe8:	41 ff d0             	callq  *%r8
  802feb:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802fee:	c9                   	leaveq 
  802fef:	c3                   	retq   

0000000000802ff0 <devfile_stat>:
  802ff0:	55                   	push   %rbp
  802ff1:	48 89 e5             	mov    %rsp,%rbp
  802ff4:	48 83 ec 20          	sub    $0x20,%rsp
  802ff8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802ffc:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803000:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803004:	8b 50 0c             	mov    0xc(%rax),%edx
  803007:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80300e:	00 00 00 
  803011:	89 10                	mov    %edx,(%rax)
  803013:	be 00 00 00 00       	mov    $0x0,%esi
  803018:	bf 05 00 00 00       	mov    $0x5,%edi
  80301d:	48 b8 6e 2c 80 00 00 	movabs $0x802c6e,%rax
  803024:	00 00 00 
  803027:	ff d0                	callq  *%rax
  803029:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80302c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803030:	79 05                	jns    803037 <devfile_stat+0x47>
  803032:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803035:	eb 56                	jmp    80308d <devfile_stat+0x9d>
  803037:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80303b:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  803042:	00 00 00 
  803045:	48 89 c7             	mov    %rax,%rdi
  803048:	48 b8 e5 0e 80 00 00 	movabs $0x800ee5,%rax
  80304f:	00 00 00 
  803052:	ff d0                	callq  *%rax
  803054:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80305b:	00 00 00 
  80305e:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  803064:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803068:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  80306e:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803075:	00 00 00 
  803078:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  80307e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803082:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  803088:	b8 00 00 00 00       	mov    $0x0,%eax
  80308d:	c9                   	leaveq 
  80308e:	c3                   	retq   

000000000080308f <devfile_trunc>:
  80308f:	55                   	push   %rbp
  803090:	48 89 e5             	mov    %rsp,%rbp
  803093:	48 83 ec 10          	sub    $0x10,%rsp
  803097:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80309b:	89 75 f4             	mov    %esi,-0xc(%rbp)
  80309e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8030a2:	8b 50 0c             	mov    0xc(%rax),%edx
  8030a5:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8030ac:	00 00 00 
  8030af:	89 10                	mov    %edx,(%rax)
  8030b1:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8030b8:	00 00 00 
  8030bb:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8030be:	89 50 04             	mov    %edx,0x4(%rax)
  8030c1:	be 00 00 00 00       	mov    $0x0,%esi
  8030c6:	bf 02 00 00 00       	mov    $0x2,%edi
  8030cb:	48 b8 6e 2c 80 00 00 	movabs $0x802c6e,%rax
  8030d2:	00 00 00 
  8030d5:	ff d0                	callq  *%rax
  8030d7:	c9                   	leaveq 
  8030d8:	c3                   	retq   

00000000008030d9 <remove>:
  8030d9:	55                   	push   %rbp
  8030da:	48 89 e5             	mov    %rsp,%rbp
  8030dd:	48 83 ec 10          	sub    $0x10,%rsp
  8030e1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8030e5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8030e9:	48 89 c7             	mov    %rax,%rdi
  8030ec:	48 b8 79 0e 80 00 00 	movabs $0x800e79,%rax
  8030f3:	00 00 00 
  8030f6:	ff d0                	callq  *%rax
  8030f8:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  8030fd:	7e 07                	jle    803106 <remove+0x2d>
  8030ff:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  803104:	eb 33                	jmp    803139 <remove+0x60>
  803106:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80310a:	48 89 c6             	mov    %rax,%rsi
  80310d:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  803114:	00 00 00 
  803117:	48 b8 e5 0e 80 00 00 	movabs $0x800ee5,%rax
  80311e:	00 00 00 
  803121:	ff d0                	callq  *%rax
  803123:	be 00 00 00 00       	mov    $0x0,%esi
  803128:	bf 07 00 00 00       	mov    $0x7,%edi
  80312d:	48 b8 6e 2c 80 00 00 	movabs $0x802c6e,%rax
  803134:	00 00 00 
  803137:	ff d0                	callq  *%rax
  803139:	c9                   	leaveq 
  80313a:	c3                   	retq   

000000000080313b <sync>:
  80313b:	55                   	push   %rbp
  80313c:	48 89 e5             	mov    %rsp,%rbp
  80313f:	be 00 00 00 00       	mov    $0x0,%esi
  803144:	bf 08 00 00 00       	mov    $0x8,%edi
  803149:	48 b8 6e 2c 80 00 00 	movabs $0x802c6e,%rax
  803150:	00 00 00 
  803153:	ff d0                	callq  *%rax
  803155:	5d                   	pop    %rbp
  803156:	c3                   	retq   

0000000000803157 <copy>:
  803157:	55                   	push   %rbp
  803158:	48 89 e5             	mov    %rsp,%rbp
  80315b:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  803162:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  803169:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  803170:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  803177:	be 00 00 00 00       	mov    $0x0,%esi
  80317c:	48 89 c7             	mov    %rax,%rdi
  80317f:	48 b8 f5 2c 80 00 00 	movabs $0x802cf5,%rax
  803186:	00 00 00 
  803189:	ff d0                	callq  *%rax
  80318b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80318e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803192:	79 28                	jns    8031bc <copy+0x65>
  803194:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803197:	89 c6                	mov    %eax,%esi
  803199:	48 bf 4c 4f 80 00 00 	movabs $0x804f4c,%rdi
  8031a0:	00 00 00 
  8031a3:	b8 00 00 00 00       	mov    $0x0,%eax
  8031a8:	48 ba 30 03 80 00 00 	movabs $0x800330,%rdx
  8031af:	00 00 00 
  8031b2:	ff d2                	callq  *%rdx
  8031b4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031b7:	e9 74 01 00 00       	jmpq   803330 <copy+0x1d9>
  8031bc:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  8031c3:	be 01 01 00 00       	mov    $0x101,%esi
  8031c8:	48 89 c7             	mov    %rax,%rdi
  8031cb:	48 b8 f5 2c 80 00 00 	movabs $0x802cf5,%rax
  8031d2:	00 00 00 
  8031d5:	ff d0                	callq  *%rax
  8031d7:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8031da:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8031de:	79 39                	jns    803219 <copy+0xc2>
  8031e0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8031e3:	89 c6                	mov    %eax,%esi
  8031e5:	48 bf 62 4f 80 00 00 	movabs $0x804f62,%rdi
  8031ec:	00 00 00 
  8031ef:	b8 00 00 00 00       	mov    $0x0,%eax
  8031f4:	48 ba 30 03 80 00 00 	movabs $0x800330,%rdx
  8031fb:	00 00 00 
  8031fe:	ff d2                	callq  *%rdx
  803200:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803203:	89 c7                	mov    %eax,%edi
  803205:	48 b8 fd 25 80 00 00 	movabs $0x8025fd,%rax
  80320c:	00 00 00 
  80320f:	ff d0                	callq  *%rax
  803211:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803214:	e9 17 01 00 00       	jmpq   803330 <copy+0x1d9>
  803219:	eb 74                	jmp    80328f <copy+0x138>
  80321b:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80321e:	48 63 d0             	movslq %eax,%rdx
  803221:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  803228:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80322b:	48 89 ce             	mov    %rcx,%rsi
  80322e:	89 c7                	mov    %eax,%edi
  803230:	48 b8 69 29 80 00 00 	movabs $0x802969,%rax
  803237:	00 00 00 
  80323a:	ff d0                	callq  *%rax
  80323c:	89 45 f0             	mov    %eax,-0x10(%rbp)
  80323f:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  803243:	79 4a                	jns    80328f <copy+0x138>
  803245:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803248:	89 c6                	mov    %eax,%esi
  80324a:	48 bf 7c 4f 80 00 00 	movabs $0x804f7c,%rdi
  803251:	00 00 00 
  803254:	b8 00 00 00 00       	mov    $0x0,%eax
  803259:	48 ba 30 03 80 00 00 	movabs $0x800330,%rdx
  803260:	00 00 00 
  803263:	ff d2                	callq  *%rdx
  803265:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803268:	89 c7                	mov    %eax,%edi
  80326a:	48 b8 fd 25 80 00 00 	movabs $0x8025fd,%rax
  803271:	00 00 00 
  803274:	ff d0                	callq  *%rax
  803276:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803279:	89 c7                	mov    %eax,%edi
  80327b:	48 b8 fd 25 80 00 00 	movabs $0x8025fd,%rax
  803282:	00 00 00 
  803285:	ff d0                	callq  *%rax
  803287:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80328a:	e9 a1 00 00 00       	jmpq   803330 <copy+0x1d9>
  80328f:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  803296:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803299:	ba 00 02 00 00       	mov    $0x200,%edx
  80329e:	48 89 ce             	mov    %rcx,%rsi
  8032a1:	89 c7                	mov    %eax,%edi
  8032a3:	48 b8 1f 28 80 00 00 	movabs $0x80281f,%rax
  8032aa:	00 00 00 
  8032ad:	ff d0                	callq  *%rax
  8032af:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8032b2:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8032b6:	0f 8f 5f ff ff ff    	jg     80321b <copy+0xc4>
  8032bc:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8032c0:	79 47                	jns    803309 <copy+0x1b2>
  8032c2:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8032c5:	89 c6                	mov    %eax,%esi
  8032c7:	48 bf 8f 4f 80 00 00 	movabs $0x804f8f,%rdi
  8032ce:	00 00 00 
  8032d1:	b8 00 00 00 00       	mov    $0x0,%eax
  8032d6:	48 ba 30 03 80 00 00 	movabs $0x800330,%rdx
  8032dd:	00 00 00 
  8032e0:	ff d2                	callq  *%rdx
  8032e2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032e5:	89 c7                	mov    %eax,%edi
  8032e7:	48 b8 fd 25 80 00 00 	movabs $0x8025fd,%rax
  8032ee:	00 00 00 
  8032f1:	ff d0                	callq  *%rax
  8032f3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8032f6:	89 c7                	mov    %eax,%edi
  8032f8:	48 b8 fd 25 80 00 00 	movabs $0x8025fd,%rax
  8032ff:	00 00 00 
  803302:	ff d0                	callq  *%rax
  803304:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803307:	eb 27                	jmp    803330 <copy+0x1d9>
  803309:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80330c:	89 c7                	mov    %eax,%edi
  80330e:	48 b8 fd 25 80 00 00 	movabs $0x8025fd,%rax
  803315:	00 00 00 
  803318:	ff d0                	callq  *%rax
  80331a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80331d:	89 c7                	mov    %eax,%edi
  80331f:	48 b8 fd 25 80 00 00 	movabs $0x8025fd,%rax
  803326:	00 00 00 
  803329:	ff d0                	callq  *%rax
  80332b:	b8 00 00 00 00       	mov    $0x0,%eax
  803330:	c9                   	leaveq 
  803331:	c3                   	retq   

0000000000803332 <fd2sockid>:
  803332:	55                   	push   %rbp
  803333:	48 89 e5             	mov    %rsp,%rbp
  803336:	48 83 ec 20          	sub    $0x20,%rsp
  80333a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80333d:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803341:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803344:	48 89 d6             	mov    %rdx,%rsi
  803347:	89 c7                	mov    %eax,%edi
  803349:	48 b8 ed 23 80 00 00 	movabs $0x8023ed,%rax
  803350:	00 00 00 
  803353:	ff d0                	callq  *%rax
  803355:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803358:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80335c:	79 05                	jns    803363 <fd2sockid+0x31>
  80335e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803361:	eb 24                	jmp    803387 <fd2sockid+0x55>
  803363:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803367:	8b 10                	mov    (%rax),%edx
  803369:	48 b8 a0 70 80 00 00 	movabs $0x8070a0,%rax
  803370:	00 00 00 
  803373:	8b 00                	mov    (%rax),%eax
  803375:	39 c2                	cmp    %eax,%edx
  803377:	74 07                	je     803380 <fd2sockid+0x4e>
  803379:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80337e:	eb 07                	jmp    803387 <fd2sockid+0x55>
  803380:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803384:	8b 40 0c             	mov    0xc(%rax),%eax
  803387:	c9                   	leaveq 
  803388:	c3                   	retq   

0000000000803389 <alloc_sockfd>:
  803389:	55                   	push   %rbp
  80338a:	48 89 e5             	mov    %rsp,%rbp
  80338d:	48 83 ec 20          	sub    $0x20,%rsp
  803391:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803394:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803398:	48 89 c7             	mov    %rax,%rdi
  80339b:	48 b8 55 23 80 00 00 	movabs $0x802355,%rax
  8033a2:	00 00 00 
  8033a5:	ff d0                	callq  *%rax
  8033a7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8033aa:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8033ae:	78 26                	js     8033d6 <alloc_sockfd+0x4d>
  8033b0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8033b4:	ba 07 04 00 00       	mov    $0x407,%edx
  8033b9:	48 89 c6             	mov    %rax,%rsi
  8033bc:	bf 00 00 00 00       	mov    $0x0,%edi
  8033c1:	48 b8 14 18 80 00 00 	movabs $0x801814,%rax
  8033c8:	00 00 00 
  8033cb:	ff d0                	callq  *%rax
  8033cd:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8033d0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8033d4:	79 16                	jns    8033ec <alloc_sockfd+0x63>
  8033d6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8033d9:	89 c7                	mov    %eax,%edi
  8033db:	48 b8 96 38 80 00 00 	movabs $0x803896,%rax
  8033e2:	00 00 00 
  8033e5:	ff d0                	callq  *%rax
  8033e7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033ea:	eb 3a                	jmp    803426 <alloc_sockfd+0x9d>
  8033ec:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8033f0:	48 ba a0 70 80 00 00 	movabs $0x8070a0,%rdx
  8033f7:	00 00 00 
  8033fa:	8b 12                	mov    (%rdx),%edx
  8033fc:	89 10                	mov    %edx,(%rax)
  8033fe:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803402:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  803409:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80340d:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803410:	89 50 0c             	mov    %edx,0xc(%rax)
  803413:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803417:	48 89 c7             	mov    %rax,%rdi
  80341a:	48 b8 07 23 80 00 00 	movabs $0x802307,%rax
  803421:	00 00 00 
  803424:	ff d0                	callq  *%rax
  803426:	c9                   	leaveq 
  803427:	c3                   	retq   

0000000000803428 <accept>:
  803428:	55                   	push   %rbp
  803429:	48 89 e5             	mov    %rsp,%rbp
  80342c:	48 83 ec 30          	sub    $0x30,%rsp
  803430:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803433:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803437:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80343b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80343e:	89 c7                	mov    %eax,%edi
  803440:	48 b8 32 33 80 00 00 	movabs $0x803332,%rax
  803447:	00 00 00 
  80344a:	ff d0                	callq  *%rax
  80344c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80344f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803453:	79 05                	jns    80345a <accept+0x32>
  803455:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803458:	eb 3b                	jmp    803495 <accept+0x6d>
  80345a:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80345e:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803462:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803465:	48 89 ce             	mov    %rcx,%rsi
  803468:	89 c7                	mov    %eax,%edi
  80346a:	48 b8 73 37 80 00 00 	movabs $0x803773,%rax
  803471:	00 00 00 
  803474:	ff d0                	callq  *%rax
  803476:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803479:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80347d:	79 05                	jns    803484 <accept+0x5c>
  80347f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803482:	eb 11                	jmp    803495 <accept+0x6d>
  803484:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803487:	89 c7                	mov    %eax,%edi
  803489:	48 b8 89 33 80 00 00 	movabs $0x803389,%rax
  803490:	00 00 00 
  803493:	ff d0                	callq  *%rax
  803495:	c9                   	leaveq 
  803496:	c3                   	retq   

0000000000803497 <bind>:
  803497:	55                   	push   %rbp
  803498:	48 89 e5             	mov    %rsp,%rbp
  80349b:	48 83 ec 20          	sub    $0x20,%rsp
  80349f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8034a2:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8034a6:	89 55 e8             	mov    %edx,-0x18(%rbp)
  8034a9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8034ac:	89 c7                	mov    %eax,%edi
  8034ae:	48 b8 32 33 80 00 00 	movabs $0x803332,%rax
  8034b5:	00 00 00 
  8034b8:	ff d0                	callq  *%rax
  8034ba:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8034bd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8034c1:	79 05                	jns    8034c8 <bind+0x31>
  8034c3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034c6:	eb 1b                	jmp    8034e3 <bind+0x4c>
  8034c8:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8034cb:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8034cf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034d2:	48 89 ce             	mov    %rcx,%rsi
  8034d5:	89 c7                	mov    %eax,%edi
  8034d7:	48 b8 f2 37 80 00 00 	movabs $0x8037f2,%rax
  8034de:	00 00 00 
  8034e1:	ff d0                	callq  *%rax
  8034e3:	c9                   	leaveq 
  8034e4:	c3                   	retq   

00000000008034e5 <shutdown>:
  8034e5:	55                   	push   %rbp
  8034e6:	48 89 e5             	mov    %rsp,%rbp
  8034e9:	48 83 ec 20          	sub    $0x20,%rsp
  8034ed:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8034f0:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8034f3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8034f6:	89 c7                	mov    %eax,%edi
  8034f8:	48 b8 32 33 80 00 00 	movabs $0x803332,%rax
  8034ff:	00 00 00 
  803502:	ff d0                	callq  *%rax
  803504:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803507:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80350b:	79 05                	jns    803512 <shutdown+0x2d>
  80350d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803510:	eb 16                	jmp    803528 <shutdown+0x43>
  803512:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803515:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803518:	89 d6                	mov    %edx,%esi
  80351a:	89 c7                	mov    %eax,%edi
  80351c:	48 b8 56 38 80 00 00 	movabs $0x803856,%rax
  803523:	00 00 00 
  803526:	ff d0                	callq  *%rax
  803528:	c9                   	leaveq 
  803529:	c3                   	retq   

000000000080352a <devsock_close>:
  80352a:	55                   	push   %rbp
  80352b:	48 89 e5             	mov    %rsp,%rbp
  80352e:	48 83 ec 10          	sub    $0x10,%rsp
  803532:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803536:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80353a:	48 89 c7             	mov    %rax,%rdi
  80353d:	48 b8 bf 47 80 00 00 	movabs $0x8047bf,%rax
  803544:	00 00 00 
  803547:	ff d0                	callq  *%rax
  803549:	83 f8 01             	cmp    $0x1,%eax
  80354c:	75 17                	jne    803565 <devsock_close+0x3b>
  80354e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803552:	8b 40 0c             	mov    0xc(%rax),%eax
  803555:	89 c7                	mov    %eax,%edi
  803557:	48 b8 96 38 80 00 00 	movabs $0x803896,%rax
  80355e:	00 00 00 
  803561:	ff d0                	callq  *%rax
  803563:	eb 05                	jmp    80356a <devsock_close+0x40>
  803565:	b8 00 00 00 00       	mov    $0x0,%eax
  80356a:	c9                   	leaveq 
  80356b:	c3                   	retq   

000000000080356c <connect>:
  80356c:	55                   	push   %rbp
  80356d:	48 89 e5             	mov    %rsp,%rbp
  803570:	48 83 ec 20          	sub    $0x20,%rsp
  803574:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803577:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80357b:	89 55 e8             	mov    %edx,-0x18(%rbp)
  80357e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803581:	89 c7                	mov    %eax,%edi
  803583:	48 b8 32 33 80 00 00 	movabs $0x803332,%rax
  80358a:	00 00 00 
  80358d:	ff d0                	callq  *%rax
  80358f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803592:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803596:	79 05                	jns    80359d <connect+0x31>
  803598:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80359b:	eb 1b                	jmp    8035b8 <connect+0x4c>
  80359d:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8035a0:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8035a4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035a7:	48 89 ce             	mov    %rcx,%rsi
  8035aa:	89 c7                	mov    %eax,%edi
  8035ac:	48 b8 c3 38 80 00 00 	movabs $0x8038c3,%rax
  8035b3:	00 00 00 
  8035b6:	ff d0                	callq  *%rax
  8035b8:	c9                   	leaveq 
  8035b9:	c3                   	retq   

00000000008035ba <listen>:
  8035ba:	55                   	push   %rbp
  8035bb:	48 89 e5             	mov    %rsp,%rbp
  8035be:	48 83 ec 20          	sub    $0x20,%rsp
  8035c2:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8035c5:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8035c8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8035cb:	89 c7                	mov    %eax,%edi
  8035cd:	48 b8 32 33 80 00 00 	movabs $0x803332,%rax
  8035d4:	00 00 00 
  8035d7:	ff d0                	callq  *%rax
  8035d9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8035dc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8035e0:	79 05                	jns    8035e7 <listen+0x2d>
  8035e2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035e5:	eb 16                	jmp    8035fd <listen+0x43>
  8035e7:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8035ea:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035ed:	89 d6                	mov    %edx,%esi
  8035ef:	89 c7                	mov    %eax,%edi
  8035f1:	48 b8 27 39 80 00 00 	movabs $0x803927,%rax
  8035f8:	00 00 00 
  8035fb:	ff d0                	callq  *%rax
  8035fd:	c9                   	leaveq 
  8035fe:	c3                   	retq   

00000000008035ff <devsock_read>:
  8035ff:	55                   	push   %rbp
  803600:	48 89 e5             	mov    %rsp,%rbp
  803603:	48 83 ec 20          	sub    $0x20,%rsp
  803607:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80360b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80360f:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803613:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803617:	89 c2                	mov    %eax,%edx
  803619:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80361d:	8b 40 0c             	mov    0xc(%rax),%eax
  803620:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803624:	b9 00 00 00 00       	mov    $0x0,%ecx
  803629:	89 c7                	mov    %eax,%edi
  80362b:	48 b8 67 39 80 00 00 	movabs $0x803967,%rax
  803632:	00 00 00 
  803635:	ff d0                	callq  *%rax
  803637:	c9                   	leaveq 
  803638:	c3                   	retq   

0000000000803639 <devsock_write>:
  803639:	55                   	push   %rbp
  80363a:	48 89 e5             	mov    %rsp,%rbp
  80363d:	48 83 ec 20          	sub    $0x20,%rsp
  803641:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803645:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803649:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80364d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803651:	89 c2                	mov    %eax,%edx
  803653:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803657:	8b 40 0c             	mov    0xc(%rax),%eax
  80365a:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  80365e:	b9 00 00 00 00       	mov    $0x0,%ecx
  803663:	89 c7                	mov    %eax,%edi
  803665:	48 b8 33 3a 80 00 00 	movabs $0x803a33,%rax
  80366c:	00 00 00 
  80366f:	ff d0                	callq  *%rax
  803671:	c9                   	leaveq 
  803672:	c3                   	retq   

0000000000803673 <devsock_stat>:
  803673:	55                   	push   %rbp
  803674:	48 89 e5             	mov    %rsp,%rbp
  803677:	48 83 ec 10          	sub    $0x10,%rsp
  80367b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80367f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803683:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803687:	48 be aa 4f 80 00 00 	movabs $0x804faa,%rsi
  80368e:	00 00 00 
  803691:	48 89 c7             	mov    %rax,%rdi
  803694:	48 b8 e5 0e 80 00 00 	movabs $0x800ee5,%rax
  80369b:	00 00 00 
  80369e:	ff d0                	callq  *%rax
  8036a0:	b8 00 00 00 00       	mov    $0x0,%eax
  8036a5:	c9                   	leaveq 
  8036a6:	c3                   	retq   

00000000008036a7 <socket>:
  8036a7:	55                   	push   %rbp
  8036a8:	48 89 e5             	mov    %rsp,%rbp
  8036ab:	48 83 ec 20          	sub    $0x20,%rsp
  8036af:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8036b2:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8036b5:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  8036b8:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8036bb:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  8036be:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8036c1:	89 ce                	mov    %ecx,%esi
  8036c3:	89 c7                	mov    %eax,%edi
  8036c5:	48 b8 eb 3a 80 00 00 	movabs $0x803aeb,%rax
  8036cc:	00 00 00 
  8036cf:	ff d0                	callq  *%rax
  8036d1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8036d4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8036d8:	79 05                	jns    8036df <socket+0x38>
  8036da:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036dd:	eb 11                	jmp    8036f0 <socket+0x49>
  8036df:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036e2:	89 c7                	mov    %eax,%edi
  8036e4:	48 b8 89 33 80 00 00 	movabs $0x803389,%rax
  8036eb:	00 00 00 
  8036ee:	ff d0                	callq  *%rax
  8036f0:	c9                   	leaveq 
  8036f1:	c3                   	retq   

00000000008036f2 <nsipc>:
  8036f2:	55                   	push   %rbp
  8036f3:	48 89 e5             	mov    %rsp,%rbp
  8036f6:	48 83 ec 10          	sub    $0x10,%rsp
  8036fa:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8036fd:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803704:	00 00 00 
  803707:	8b 00                	mov    (%rax),%eax
  803709:	85 c0                	test   %eax,%eax
  80370b:	75 1d                	jne    80372a <nsipc+0x38>
  80370d:	bf 02 00 00 00       	mov    $0x2,%edi
  803712:	48 b8 4d 47 80 00 00 	movabs $0x80474d,%rax
  803719:	00 00 00 
  80371c:	ff d0                	callq  *%rax
  80371e:	48 ba 04 80 80 00 00 	movabs $0x808004,%rdx
  803725:	00 00 00 
  803728:	89 02                	mov    %eax,(%rdx)
  80372a:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803731:	00 00 00 
  803734:	8b 00                	mov    (%rax),%eax
  803736:	8b 75 fc             	mov    -0x4(%rbp),%esi
  803739:	b9 07 00 00 00       	mov    $0x7,%ecx
  80373e:	48 ba 00 b0 80 00 00 	movabs $0x80b000,%rdx
  803745:	00 00 00 
  803748:	89 c7                	mov    %eax,%edi
  80374a:	48 b8 b7 46 80 00 00 	movabs $0x8046b7,%rax
  803751:	00 00 00 
  803754:	ff d0                	callq  *%rax
  803756:	ba 00 00 00 00       	mov    $0x0,%edx
  80375b:	be 00 00 00 00       	mov    $0x0,%esi
  803760:	bf 00 00 00 00       	mov    $0x0,%edi
  803765:	48 b8 f6 45 80 00 00 	movabs $0x8045f6,%rax
  80376c:	00 00 00 
  80376f:	ff d0                	callq  *%rax
  803771:	c9                   	leaveq 
  803772:	c3                   	retq   

0000000000803773 <nsipc_accept>:
  803773:	55                   	push   %rbp
  803774:	48 89 e5             	mov    %rsp,%rbp
  803777:	48 83 ec 30          	sub    $0x30,%rsp
  80377b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80377e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803782:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803786:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80378d:	00 00 00 
  803790:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803793:	89 10                	mov    %edx,(%rax)
  803795:	bf 01 00 00 00       	mov    $0x1,%edi
  80379a:	48 b8 f2 36 80 00 00 	movabs $0x8036f2,%rax
  8037a1:	00 00 00 
  8037a4:	ff d0                	callq  *%rax
  8037a6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8037a9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8037ad:	78 3e                	js     8037ed <nsipc_accept+0x7a>
  8037af:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8037b6:	00 00 00 
  8037b9:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8037bd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8037c1:	8b 40 10             	mov    0x10(%rax),%eax
  8037c4:	89 c2                	mov    %eax,%edx
  8037c6:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8037ca:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8037ce:	48 89 ce             	mov    %rcx,%rsi
  8037d1:	48 89 c7             	mov    %rax,%rdi
  8037d4:	48 b8 09 12 80 00 00 	movabs $0x801209,%rax
  8037db:	00 00 00 
  8037de:	ff d0                	callq  *%rax
  8037e0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8037e4:	8b 50 10             	mov    0x10(%rax),%edx
  8037e7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8037eb:	89 10                	mov    %edx,(%rax)
  8037ed:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037f0:	c9                   	leaveq 
  8037f1:	c3                   	retq   

00000000008037f2 <nsipc_bind>:
  8037f2:	55                   	push   %rbp
  8037f3:	48 89 e5             	mov    %rsp,%rbp
  8037f6:	48 83 ec 10          	sub    $0x10,%rsp
  8037fa:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8037fd:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803801:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803804:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80380b:	00 00 00 
  80380e:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803811:	89 10                	mov    %edx,(%rax)
  803813:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803816:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80381a:	48 89 c6             	mov    %rax,%rsi
  80381d:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803824:	00 00 00 
  803827:	48 b8 09 12 80 00 00 	movabs $0x801209,%rax
  80382e:	00 00 00 
  803831:	ff d0                	callq  *%rax
  803833:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80383a:	00 00 00 
  80383d:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803840:	89 50 14             	mov    %edx,0x14(%rax)
  803843:	bf 02 00 00 00       	mov    $0x2,%edi
  803848:	48 b8 f2 36 80 00 00 	movabs $0x8036f2,%rax
  80384f:	00 00 00 
  803852:	ff d0                	callq  *%rax
  803854:	c9                   	leaveq 
  803855:	c3                   	retq   

0000000000803856 <nsipc_shutdown>:
  803856:	55                   	push   %rbp
  803857:	48 89 e5             	mov    %rsp,%rbp
  80385a:	48 83 ec 10          	sub    $0x10,%rsp
  80385e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803861:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803864:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80386b:	00 00 00 
  80386e:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803871:	89 10                	mov    %edx,(%rax)
  803873:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80387a:	00 00 00 
  80387d:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803880:	89 50 04             	mov    %edx,0x4(%rax)
  803883:	bf 03 00 00 00       	mov    $0x3,%edi
  803888:	48 b8 f2 36 80 00 00 	movabs $0x8036f2,%rax
  80388f:	00 00 00 
  803892:	ff d0                	callq  *%rax
  803894:	c9                   	leaveq 
  803895:	c3                   	retq   

0000000000803896 <nsipc_close>:
  803896:	55                   	push   %rbp
  803897:	48 89 e5             	mov    %rsp,%rbp
  80389a:	48 83 ec 10          	sub    $0x10,%rsp
  80389e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8038a1:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8038a8:	00 00 00 
  8038ab:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8038ae:	89 10                	mov    %edx,(%rax)
  8038b0:	bf 04 00 00 00       	mov    $0x4,%edi
  8038b5:	48 b8 f2 36 80 00 00 	movabs $0x8036f2,%rax
  8038bc:	00 00 00 
  8038bf:	ff d0                	callq  *%rax
  8038c1:	c9                   	leaveq 
  8038c2:	c3                   	retq   

00000000008038c3 <nsipc_connect>:
  8038c3:	55                   	push   %rbp
  8038c4:	48 89 e5             	mov    %rsp,%rbp
  8038c7:	48 83 ec 10          	sub    $0x10,%rsp
  8038cb:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8038ce:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8038d2:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8038d5:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8038dc:	00 00 00 
  8038df:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8038e2:	89 10                	mov    %edx,(%rax)
  8038e4:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8038e7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8038eb:	48 89 c6             	mov    %rax,%rsi
  8038ee:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  8038f5:	00 00 00 
  8038f8:	48 b8 09 12 80 00 00 	movabs $0x801209,%rax
  8038ff:	00 00 00 
  803902:	ff d0                	callq  *%rax
  803904:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80390b:	00 00 00 
  80390e:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803911:	89 50 14             	mov    %edx,0x14(%rax)
  803914:	bf 05 00 00 00       	mov    $0x5,%edi
  803919:	48 b8 f2 36 80 00 00 	movabs $0x8036f2,%rax
  803920:	00 00 00 
  803923:	ff d0                	callq  *%rax
  803925:	c9                   	leaveq 
  803926:	c3                   	retq   

0000000000803927 <nsipc_listen>:
  803927:	55                   	push   %rbp
  803928:	48 89 e5             	mov    %rsp,%rbp
  80392b:	48 83 ec 10          	sub    $0x10,%rsp
  80392f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803932:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803935:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80393c:	00 00 00 
  80393f:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803942:	89 10                	mov    %edx,(%rax)
  803944:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80394b:	00 00 00 
  80394e:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803951:	89 50 04             	mov    %edx,0x4(%rax)
  803954:	bf 06 00 00 00       	mov    $0x6,%edi
  803959:	48 b8 f2 36 80 00 00 	movabs $0x8036f2,%rax
  803960:	00 00 00 
  803963:	ff d0                	callq  *%rax
  803965:	c9                   	leaveq 
  803966:	c3                   	retq   

0000000000803967 <nsipc_recv>:
  803967:	55                   	push   %rbp
  803968:	48 89 e5             	mov    %rsp,%rbp
  80396b:	48 83 ec 30          	sub    $0x30,%rsp
  80396f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803972:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803976:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803979:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  80397c:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803983:	00 00 00 
  803986:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803989:	89 10                	mov    %edx,(%rax)
  80398b:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803992:	00 00 00 
  803995:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803998:	89 50 04             	mov    %edx,0x4(%rax)
  80399b:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8039a2:	00 00 00 
  8039a5:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8039a8:	89 50 08             	mov    %edx,0x8(%rax)
  8039ab:	bf 07 00 00 00       	mov    $0x7,%edi
  8039b0:	48 b8 f2 36 80 00 00 	movabs $0x8036f2,%rax
  8039b7:	00 00 00 
  8039ba:	ff d0                	callq  *%rax
  8039bc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8039bf:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8039c3:	78 69                	js     803a2e <nsipc_recv+0xc7>
  8039c5:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  8039cc:	7f 08                	jg     8039d6 <nsipc_recv+0x6f>
  8039ce:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039d1:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  8039d4:	7e 35                	jle    803a0b <nsipc_recv+0xa4>
  8039d6:	48 b9 b1 4f 80 00 00 	movabs $0x804fb1,%rcx
  8039dd:	00 00 00 
  8039e0:	48 ba c6 4f 80 00 00 	movabs $0x804fc6,%rdx
  8039e7:	00 00 00 
  8039ea:	be 62 00 00 00       	mov    $0x62,%esi
  8039ef:	48 bf db 4f 80 00 00 	movabs $0x804fdb,%rdi
  8039f6:	00 00 00 
  8039f9:	b8 00 00 00 00       	mov    $0x0,%eax
  8039fe:	49 b8 ba 43 80 00 00 	movabs $0x8043ba,%r8
  803a05:	00 00 00 
  803a08:	41 ff d0             	callq  *%r8
  803a0b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a0e:	48 63 d0             	movslq %eax,%rdx
  803a11:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803a15:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  803a1c:	00 00 00 
  803a1f:	48 89 c7             	mov    %rax,%rdi
  803a22:	48 b8 09 12 80 00 00 	movabs $0x801209,%rax
  803a29:	00 00 00 
  803a2c:	ff d0                	callq  *%rax
  803a2e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a31:	c9                   	leaveq 
  803a32:	c3                   	retq   

0000000000803a33 <nsipc_send>:
  803a33:	55                   	push   %rbp
  803a34:	48 89 e5             	mov    %rsp,%rbp
  803a37:	48 83 ec 20          	sub    $0x20,%rsp
  803a3b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803a3e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803a42:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803a45:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  803a48:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803a4f:	00 00 00 
  803a52:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803a55:	89 10                	mov    %edx,(%rax)
  803a57:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  803a5e:	7e 35                	jle    803a95 <nsipc_send+0x62>
  803a60:	48 b9 ea 4f 80 00 00 	movabs $0x804fea,%rcx
  803a67:	00 00 00 
  803a6a:	48 ba c6 4f 80 00 00 	movabs $0x804fc6,%rdx
  803a71:	00 00 00 
  803a74:	be 6d 00 00 00       	mov    $0x6d,%esi
  803a79:	48 bf db 4f 80 00 00 	movabs $0x804fdb,%rdi
  803a80:	00 00 00 
  803a83:	b8 00 00 00 00       	mov    $0x0,%eax
  803a88:	49 b8 ba 43 80 00 00 	movabs $0x8043ba,%r8
  803a8f:	00 00 00 
  803a92:	41 ff d0             	callq  *%r8
  803a95:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803a98:	48 63 d0             	movslq %eax,%rdx
  803a9b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a9f:	48 89 c6             	mov    %rax,%rsi
  803aa2:	48 bf 0c b0 80 00 00 	movabs $0x80b00c,%rdi
  803aa9:	00 00 00 
  803aac:	48 b8 09 12 80 00 00 	movabs $0x801209,%rax
  803ab3:	00 00 00 
  803ab6:	ff d0                	callq  *%rax
  803ab8:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803abf:	00 00 00 
  803ac2:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803ac5:	89 50 04             	mov    %edx,0x4(%rax)
  803ac8:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803acf:	00 00 00 
  803ad2:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803ad5:	89 50 08             	mov    %edx,0x8(%rax)
  803ad8:	bf 08 00 00 00       	mov    $0x8,%edi
  803add:	48 b8 f2 36 80 00 00 	movabs $0x8036f2,%rax
  803ae4:	00 00 00 
  803ae7:	ff d0                	callq  *%rax
  803ae9:	c9                   	leaveq 
  803aea:	c3                   	retq   

0000000000803aeb <nsipc_socket>:
  803aeb:	55                   	push   %rbp
  803aec:	48 89 e5             	mov    %rsp,%rbp
  803aef:	48 83 ec 10          	sub    $0x10,%rsp
  803af3:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803af6:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803af9:	89 55 f4             	mov    %edx,-0xc(%rbp)
  803afc:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803b03:	00 00 00 
  803b06:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803b09:	89 10                	mov    %edx,(%rax)
  803b0b:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803b12:	00 00 00 
  803b15:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803b18:	89 50 04             	mov    %edx,0x4(%rax)
  803b1b:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803b22:	00 00 00 
  803b25:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803b28:	89 50 08             	mov    %edx,0x8(%rax)
  803b2b:	bf 09 00 00 00       	mov    $0x9,%edi
  803b30:	48 b8 f2 36 80 00 00 	movabs $0x8036f2,%rax
  803b37:	00 00 00 
  803b3a:	ff d0                	callq  *%rax
  803b3c:	c9                   	leaveq 
  803b3d:	c3                   	retq   

0000000000803b3e <pipe>:
  803b3e:	55                   	push   %rbp
  803b3f:	48 89 e5             	mov    %rsp,%rbp
  803b42:	53                   	push   %rbx
  803b43:	48 83 ec 38          	sub    $0x38,%rsp
  803b47:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  803b4b:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  803b4f:	48 89 c7             	mov    %rax,%rdi
  803b52:	48 b8 55 23 80 00 00 	movabs $0x802355,%rax
  803b59:	00 00 00 
  803b5c:	ff d0                	callq  *%rax
  803b5e:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803b61:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803b65:	0f 88 bf 01 00 00    	js     803d2a <pipe+0x1ec>
  803b6b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803b6f:	ba 07 04 00 00       	mov    $0x407,%edx
  803b74:	48 89 c6             	mov    %rax,%rsi
  803b77:	bf 00 00 00 00       	mov    $0x0,%edi
  803b7c:	48 b8 14 18 80 00 00 	movabs $0x801814,%rax
  803b83:	00 00 00 
  803b86:	ff d0                	callq  *%rax
  803b88:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803b8b:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803b8f:	0f 88 95 01 00 00    	js     803d2a <pipe+0x1ec>
  803b95:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  803b99:	48 89 c7             	mov    %rax,%rdi
  803b9c:	48 b8 55 23 80 00 00 	movabs $0x802355,%rax
  803ba3:	00 00 00 
  803ba6:	ff d0                	callq  *%rax
  803ba8:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803bab:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803baf:	0f 88 5d 01 00 00    	js     803d12 <pipe+0x1d4>
  803bb5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803bb9:	ba 07 04 00 00       	mov    $0x407,%edx
  803bbe:	48 89 c6             	mov    %rax,%rsi
  803bc1:	bf 00 00 00 00       	mov    $0x0,%edi
  803bc6:	48 b8 14 18 80 00 00 	movabs $0x801814,%rax
  803bcd:	00 00 00 
  803bd0:	ff d0                	callq  *%rax
  803bd2:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803bd5:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803bd9:	0f 88 33 01 00 00    	js     803d12 <pipe+0x1d4>
  803bdf:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803be3:	48 89 c7             	mov    %rax,%rdi
  803be6:	48 b8 2a 23 80 00 00 	movabs $0x80232a,%rax
  803bed:	00 00 00 
  803bf0:	ff d0                	callq  *%rax
  803bf2:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803bf6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803bfa:	ba 07 04 00 00       	mov    $0x407,%edx
  803bff:	48 89 c6             	mov    %rax,%rsi
  803c02:	bf 00 00 00 00       	mov    $0x0,%edi
  803c07:	48 b8 14 18 80 00 00 	movabs $0x801814,%rax
  803c0e:	00 00 00 
  803c11:	ff d0                	callq  *%rax
  803c13:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803c16:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803c1a:	79 05                	jns    803c21 <pipe+0xe3>
  803c1c:	e9 d9 00 00 00       	jmpq   803cfa <pipe+0x1bc>
  803c21:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803c25:	48 89 c7             	mov    %rax,%rdi
  803c28:	48 b8 2a 23 80 00 00 	movabs $0x80232a,%rax
  803c2f:	00 00 00 
  803c32:	ff d0                	callq  *%rax
  803c34:	48 89 c2             	mov    %rax,%rdx
  803c37:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803c3b:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  803c41:	48 89 d1             	mov    %rdx,%rcx
  803c44:	ba 00 00 00 00       	mov    $0x0,%edx
  803c49:	48 89 c6             	mov    %rax,%rsi
  803c4c:	bf 00 00 00 00       	mov    $0x0,%edi
  803c51:	48 b8 64 18 80 00 00 	movabs $0x801864,%rax
  803c58:	00 00 00 
  803c5b:	ff d0                	callq  *%rax
  803c5d:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803c60:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803c64:	79 1b                	jns    803c81 <pipe+0x143>
  803c66:	90                   	nop
  803c67:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803c6b:	48 89 c6             	mov    %rax,%rsi
  803c6e:	bf 00 00 00 00       	mov    $0x0,%edi
  803c73:	48 b8 bf 18 80 00 00 	movabs $0x8018bf,%rax
  803c7a:	00 00 00 
  803c7d:	ff d0                	callq  *%rax
  803c7f:	eb 79                	jmp    803cfa <pipe+0x1bc>
  803c81:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803c85:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  803c8c:	00 00 00 
  803c8f:	8b 12                	mov    (%rdx),%edx
  803c91:	89 10                	mov    %edx,(%rax)
  803c93:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803c97:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  803c9e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803ca2:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  803ca9:	00 00 00 
  803cac:	8b 12                	mov    (%rdx),%edx
  803cae:	89 10                	mov    %edx,(%rax)
  803cb0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803cb4:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  803cbb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803cbf:	48 89 c7             	mov    %rax,%rdi
  803cc2:	48 b8 07 23 80 00 00 	movabs $0x802307,%rax
  803cc9:	00 00 00 
  803ccc:	ff d0                	callq  *%rax
  803cce:	89 c2                	mov    %eax,%edx
  803cd0:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803cd4:	89 10                	mov    %edx,(%rax)
  803cd6:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803cda:	48 8d 58 04          	lea    0x4(%rax),%rbx
  803cde:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803ce2:	48 89 c7             	mov    %rax,%rdi
  803ce5:	48 b8 07 23 80 00 00 	movabs $0x802307,%rax
  803cec:	00 00 00 
  803cef:	ff d0                	callq  *%rax
  803cf1:	89 03                	mov    %eax,(%rbx)
  803cf3:	b8 00 00 00 00       	mov    $0x0,%eax
  803cf8:	eb 33                	jmp    803d2d <pipe+0x1ef>
  803cfa:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803cfe:	48 89 c6             	mov    %rax,%rsi
  803d01:	bf 00 00 00 00       	mov    $0x0,%edi
  803d06:	48 b8 bf 18 80 00 00 	movabs $0x8018bf,%rax
  803d0d:	00 00 00 
  803d10:	ff d0                	callq  *%rax
  803d12:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803d16:	48 89 c6             	mov    %rax,%rsi
  803d19:	bf 00 00 00 00       	mov    $0x0,%edi
  803d1e:	48 b8 bf 18 80 00 00 	movabs $0x8018bf,%rax
  803d25:	00 00 00 
  803d28:	ff d0                	callq  *%rax
  803d2a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803d2d:	48 83 c4 38          	add    $0x38,%rsp
  803d31:	5b                   	pop    %rbx
  803d32:	5d                   	pop    %rbp
  803d33:	c3                   	retq   

0000000000803d34 <_pipeisclosed>:
  803d34:	55                   	push   %rbp
  803d35:	48 89 e5             	mov    %rsp,%rbp
  803d38:	53                   	push   %rbx
  803d39:	48 83 ec 28          	sub    $0x28,%rsp
  803d3d:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803d41:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803d45:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  803d4c:	00 00 00 
  803d4f:	48 8b 00             	mov    (%rax),%rax
  803d52:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  803d58:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803d5b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803d5f:	48 89 c7             	mov    %rax,%rdi
  803d62:	48 b8 bf 47 80 00 00 	movabs $0x8047bf,%rax
  803d69:	00 00 00 
  803d6c:	ff d0                	callq  *%rax
  803d6e:	89 c3                	mov    %eax,%ebx
  803d70:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803d74:	48 89 c7             	mov    %rax,%rdi
  803d77:	48 b8 bf 47 80 00 00 	movabs $0x8047bf,%rax
  803d7e:	00 00 00 
  803d81:	ff d0                	callq  *%rax
  803d83:	39 c3                	cmp    %eax,%ebx
  803d85:	0f 94 c0             	sete   %al
  803d88:	0f b6 c0             	movzbl %al,%eax
  803d8b:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803d8e:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  803d95:	00 00 00 
  803d98:	48 8b 00             	mov    (%rax),%rax
  803d9b:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  803da1:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  803da4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803da7:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  803daa:	75 05                	jne    803db1 <_pipeisclosed+0x7d>
  803dac:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803daf:	eb 4f                	jmp    803e00 <_pipeisclosed+0xcc>
  803db1:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803db4:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  803db7:	74 42                	je     803dfb <_pipeisclosed+0xc7>
  803db9:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  803dbd:	75 3c                	jne    803dfb <_pipeisclosed+0xc7>
  803dbf:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  803dc6:	00 00 00 
  803dc9:	48 8b 00             	mov    (%rax),%rax
  803dcc:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  803dd2:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803dd5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803dd8:	89 c6                	mov    %eax,%esi
  803dda:	48 bf fb 4f 80 00 00 	movabs $0x804ffb,%rdi
  803de1:	00 00 00 
  803de4:	b8 00 00 00 00       	mov    $0x0,%eax
  803de9:	49 b8 30 03 80 00 00 	movabs $0x800330,%r8
  803df0:	00 00 00 
  803df3:	41 ff d0             	callq  *%r8
  803df6:	e9 4a ff ff ff       	jmpq   803d45 <_pipeisclosed+0x11>
  803dfb:	e9 45 ff ff ff       	jmpq   803d45 <_pipeisclosed+0x11>
  803e00:	48 83 c4 28          	add    $0x28,%rsp
  803e04:	5b                   	pop    %rbx
  803e05:	5d                   	pop    %rbp
  803e06:	c3                   	retq   

0000000000803e07 <pipeisclosed>:
  803e07:	55                   	push   %rbp
  803e08:	48 89 e5             	mov    %rsp,%rbp
  803e0b:	48 83 ec 30          	sub    $0x30,%rsp
  803e0f:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803e12:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  803e16:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803e19:	48 89 d6             	mov    %rdx,%rsi
  803e1c:	89 c7                	mov    %eax,%edi
  803e1e:	48 b8 ed 23 80 00 00 	movabs $0x8023ed,%rax
  803e25:	00 00 00 
  803e28:	ff d0                	callq  *%rax
  803e2a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803e2d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803e31:	79 05                	jns    803e38 <pipeisclosed+0x31>
  803e33:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e36:	eb 31                	jmp    803e69 <pipeisclosed+0x62>
  803e38:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803e3c:	48 89 c7             	mov    %rax,%rdi
  803e3f:	48 b8 2a 23 80 00 00 	movabs $0x80232a,%rax
  803e46:	00 00 00 
  803e49:	ff d0                	callq  *%rax
  803e4b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803e4f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803e53:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803e57:	48 89 d6             	mov    %rdx,%rsi
  803e5a:	48 89 c7             	mov    %rax,%rdi
  803e5d:	48 b8 34 3d 80 00 00 	movabs $0x803d34,%rax
  803e64:	00 00 00 
  803e67:	ff d0                	callq  *%rax
  803e69:	c9                   	leaveq 
  803e6a:	c3                   	retq   

0000000000803e6b <devpipe_read>:
  803e6b:	55                   	push   %rbp
  803e6c:	48 89 e5             	mov    %rsp,%rbp
  803e6f:	48 83 ec 40          	sub    $0x40,%rsp
  803e73:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803e77:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803e7b:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803e7f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803e83:	48 89 c7             	mov    %rax,%rdi
  803e86:	48 b8 2a 23 80 00 00 	movabs $0x80232a,%rax
  803e8d:	00 00 00 
  803e90:	ff d0                	callq  *%rax
  803e92:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803e96:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803e9a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803e9e:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803ea5:	00 
  803ea6:	e9 92 00 00 00       	jmpq   803f3d <devpipe_read+0xd2>
  803eab:	eb 41                	jmp    803eee <devpipe_read+0x83>
  803ead:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  803eb2:	74 09                	je     803ebd <devpipe_read+0x52>
  803eb4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803eb8:	e9 92 00 00 00       	jmpq   803f4f <devpipe_read+0xe4>
  803ebd:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803ec1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803ec5:	48 89 d6             	mov    %rdx,%rsi
  803ec8:	48 89 c7             	mov    %rax,%rdi
  803ecb:	48 b8 34 3d 80 00 00 	movabs $0x803d34,%rax
  803ed2:	00 00 00 
  803ed5:	ff d0                	callq  *%rax
  803ed7:	85 c0                	test   %eax,%eax
  803ed9:	74 07                	je     803ee2 <devpipe_read+0x77>
  803edb:	b8 00 00 00 00       	mov    $0x0,%eax
  803ee0:	eb 6d                	jmp    803f4f <devpipe_read+0xe4>
  803ee2:	48 b8 d6 17 80 00 00 	movabs $0x8017d6,%rax
  803ee9:	00 00 00 
  803eec:	ff d0                	callq  *%rax
  803eee:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ef2:	8b 10                	mov    (%rax),%edx
  803ef4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ef8:	8b 40 04             	mov    0x4(%rax),%eax
  803efb:	39 c2                	cmp    %eax,%edx
  803efd:	74 ae                	je     803ead <devpipe_read+0x42>
  803eff:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803f03:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803f07:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  803f0b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f0f:	8b 00                	mov    (%rax),%eax
  803f11:	99                   	cltd   
  803f12:	c1 ea 1b             	shr    $0x1b,%edx
  803f15:	01 d0                	add    %edx,%eax
  803f17:	83 e0 1f             	and    $0x1f,%eax
  803f1a:	29 d0                	sub    %edx,%eax
  803f1c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803f20:	48 98                	cltq   
  803f22:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  803f27:	88 01                	mov    %al,(%rcx)
  803f29:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f2d:	8b 00                	mov    (%rax),%eax
  803f2f:	8d 50 01             	lea    0x1(%rax),%edx
  803f32:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f36:	89 10                	mov    %edx,(%rax)
  803f38:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803f3d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803f41:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803f45:	0f 82 60 ff ff ff    	jb     803eab <devpipe_read+0x40>
  803f4b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803f4f:	c9                   	leaveq 
  803f50:	c3                   	retq   

0000000000803f51 <devpipe_write>:
  803f51:	55                   	push   %rbp
  803f52:	48 89 e5             	mov    %rsp,%rbp
  803f55:	48 83 ec 40          	sub    $0x40,%rsp
  803f59:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803f5d:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803f61:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803f65:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803f69:	48 89 c7             	mov    %rax,%rdi
  803f6c:	48 b8 2a 23 80 00 00 	movabs $0x80232a,%rax
  803f73:	00 00 00 
  803f76:	ff d0                	callq  *%rax
  803f78:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803f7c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803f80:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803f84:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803f8b:	00 
  803f8c:	e9 8e 00 00 00       	jmpq   80401f <devpipe_write+0xce>
  803f91:	eb 31                	jmp    803fc4 <devpipe_write+0x73>
  803f93:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803f97:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803f9b:	48 89 d6             	mov    %rdx,%rsi
  803f9e:	48 89 c7             	mov    %rax,%rdi
  803fa1:	48 b8 34 3d 80 00 00 	movabs $0x803d34,%rax
  803fa8:	00 00 00 
  803fab:	ff d0                	callq  *%rax
  803fad:	85 c0                	test   %eax,%eax
  803faf:	74 07                	je     803fb8 <devpipe_write+0x67>
  803fb1:	b8 00 00 00 00       	mov    $0x0,%eax
  803fb6:	eb 79                	jmp    804031 <devpipe_write+0xe0>
  803fb8:	48 b8 d6 17 80 00 00 	movabs $0x8017d6,%rax
  803fbf:	00 00 00 
  803fc2:	ff d0                	callq  *%rax
  803fc4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803fc8:	8b 40 04             	mov    0x4(%rax),%eax
  803fcb:	48 63 d0             	movslq %eax,%rdx
  803fce:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803fd2:	8b 00                	mov    (%rax),%eax
  803fd4:	48 98                	cltq   
  803fd6:	48 83 c0 20          	add    $0x20,%rax
  803fda:	48 39 c2             	cmp    %rax,%rdx
  803fdd:	73 b4                	jae    803f93 <devpipe_write+0x42>
  803fdf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803fe3:	8b 40 04             	mov    0x4(%rax),%eax
  803fe6:	99                   	cltd   
  803fe7:	c1 ea 1b             	shr    $0x1b,%edx
  803fea:	01 d0                	add    %edx,%eax
  803fec:	83 e0 1f             	and    $0x1f,%eax
  803fef:	29 d0                	sub    %edx,%eax
  803ff1:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  803ff5:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  803ff9:	48 01 ca             	add    %rcx,%rdx
  803ffc:	0f b6 0a             	movzbl (%rdx),%ecx
  803fff:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804003:	48 98                	cltq   
  804005:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  804009:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80400d:	8b 40 04             	mov    0x4(%rax),%eax
  804010:	8d 50 01             	lea    0x1(%rax),%edx
  804013:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804017:	89 50 04             	mov    %edx,0x4(%rax)
  80401a:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80401f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804023:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  804027:	0f 82 64 ff ff ff    	jb     803f91 <devpipe_write+0x40>
  80402d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804031:	c9                   	leaveq 
  804032:	c3                   	retq   

0000000000804033 <devpipe_stat>:
  804033:	55                   	push   %rbp
  804034:	48 89 e5             	mov    %rsp,%rbp
  804037:	48 83 ec 20          	sub    $0x20,%rsp
  80403b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80403f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804043:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804047:	48 89 c7             	mov    %rax,%rdi
  80404a:	48 b8 2a 23 80 00 00 	movabs $0x80232a,%rax
  804051:	00 00 00 
  804054:	ff d0                	callq  *%rax
  804056:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80405a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80405e:	48 be 0e 50 80 00 00 	movabs $0x80500e,%rsi
  804065:	00 00 00 
  804068:	48 89 c7             	mov    %rax,%rdi
  80406b:	48 b8 e5 0e 80 00 00 	movabs $0x800ee5,%rax
  804072:	00 00 00 
  804075:	ff d0                	callq  *%rax
  804077:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80407b:	8b 50 04             	mov    0x4(%rax),%edx
  80407e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804082:	8b 00                	mov    (%rax),%eax
  804084:	29 c2                	sub    %eax,%edx
  804086:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80408a:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  804090:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804094:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  80409b:	00 00 00 
  80409e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8040a2:	48 b9 e0 70 80 00 00 	movabs $0x8070e0,%rcx
  8040a9:	00 00 00 
  8040ac:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  8040b3:	b8 00 00 00 00       	mov    $0x0,%eax
  8040b8:	c9                   	leaveq 
  8040b9:	c3                   	retq   

00000000008040ba <devpipe_close>:
  8040ba:	55                   	push   %rbp
  8040bb:	48 89 e5             	mov    %rsp,%rbp
  8040be:	48 83 ec 10          	sub    $0x10,%rsp
  8040c2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8040c6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8040ca:	48 89 c6             	mov    %rax,%rsi
  8040cd:	bf 00 00 00 00       	mov    $0x0,%edi
  8040d2:	48 b8 bf 18 80 00 00 	movabs $0x8018bf,%rax
  8040d9:	00 00 00 
  8040dc:	ff d0                	callq  *%rax
  8040de:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8040e2:	48 89 c7             	mov    %rax,%rdi
  8040e5:	48 b8 2a 23 80 00 00 	movabs $0x80232a,%rax
  8040ec:	00 00 00 
  8040ef:	ff d0                	callq  *%rax
  8040f1:	48 89 c6             	mov    %rax,%rsi
  8040f4:	bf 00 00 00 00       	mov    $0x0,%edi
  8040f9:	48 b8 bf 18 80 00 00 	movabs $0x8018bf,%rax
  804100:	00 00 00 
  804103:	ff d0                	callq  *%rax
  804105:	c9                   	leaveq 
  804106:	c3                   	retq   

0000000000804107 <cputchar>:
  804107:	55                   	push   %rbp
  804108:	48 89 e5             	mov    %rsp,%rbp
  80410b:	48 83 ec 20          	sub    $0x20,%rsp
  80410f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804112:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804115:	88 45 ff             	mov    %al,-0x1(%rbp)
  804118:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  80411c:	be 01 00 00 00       	mov    $0x1,%esi
  804121:	48 89 c7             	mov    %rax,%rdi
  804124:	48 b8 cc 16 80 00 00 	movabs $0x8016cc,%rax
  80412b:	00 00 00 
  80412e:	ff d0                	callq  *%rax
  804130:	c9                   	leaveq 
  804131:	c3                   	retq   

0000000000804132 <getchar>:
  804132:	55                   	push   %rbp
  804133:	48 89 e5             	mov    %rsp,%rbp
  804136:	48 83 ec 10          	sub    $0x10,%rsp
  80413a:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  80413e:	ba 01 00 00 00       	mov    $0x1,%edx
  804143:	48 89 c6             	mov    %rax,%rsi
  804146:	bf 00 00 00 00       	mov    $0x0,%edi
  80414b:	48 b8 1f 28 80 00 00 	movabs $0x80281f,%rax
  804152:	00 00 00 
  804155:	ff d0                	callq  *%rax
  804157:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80415a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80415e:	79 05                	jns    804165 <getchar+0x33>
  804160:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804163:	eb 14                	jmp    804179 <getchar+0x47>
  804165:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804169:	7f 07                	jg     804172 <getchar+0x40>
  80416b:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  804170:	eb 07                	jmp    804179 <getchar+0x47>
  804172:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  804176:	0f b6 c0             	movzbl %al,%eax
  804179:	c9                   	leaveq 
  80417a:	c3                   	retq   

000000000080417b <iscons>:
  80417b:	55                   	push   %rbp
  80417c:	48 89 e5             	mov    %rsp,%rbp
  80417f:	48 83 ec 20          	sub    $0x20,%rsp
  804183:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804186:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80418a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80418d:	48 89 d6             	mov    %rdx,%rsi
  804190:	89 c7                	mov    %eax,%edi
  804192:	48 b8 ed 23 80 00 00 	movabs $0x8023ed,%rax
  804199:	00 00 00 
  80419c:	ff d0                	callq  *%rax
  80419e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8041a1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8041a5:	79 05                	jns    8041ac <iscons+0x31>
  8041a7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8041aa:	eb 1a                	jmp    8041c6 <iscons+0x4b>
  8041ac:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8041b0:	8b 10                	mov    (%rax),%edx
  8041b2:	48 b8 20 71 80 00 00 	movabs $0x807120,%rax
  8041b9:	00 00 00 
  8041bc:	8b 00                	mov    (%rax),%eax
  8041be:	39 c2                	cmp    %eax,%edx
  8041c0:	0f 94 c0             	sete   %al
  8041c3:	0f b6 c0             	movzbl %al,%eax
  8041c6:	c9                   	leaveq 
  8041c7:	c3                   	retq   

00000000008041c8 <opencons>:
  8041c8:	55                   	push   %rbp
  8041c9:	48 89 e5             	mov    %rsp,%rbp
  8041cc:	48 83 ec 10          	sub    $0x10,%rsp
  8041d0:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8041d4:	48 89 c7             	mov    %rax,%rdi
  8041d7:	48 b8 55 23 80 00 00 	movabs $0x802355,%rax
  8041de:	00 00 00 
  8041e1:	ff d0                	callq  *%rax
  8041e3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8041e6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8041ea:	79 05                	jns    8041f1 <opencons+0x29>
  8041ec:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8041ef:	eb 5b                	jmp    80424c <opencons+0x84>
  8041f1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8041f5:	ba 07 04 00 00       	mov    $0x407,%edx
  8041fa:	48 89 c6             	mov    %rax,%rsi
  8041fd:	bf 00 00 00 00       	mov    $0x0,%edi
  804202:	48 b8 14 18 80 00 00 	movabs $0x801814,%rax
  804209:	00 00 00 
  80420c:	ff d0                	callq  *%rax
  80420e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804211:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804215:	79 05                	jns    80421c <opencons+0x54>
  804217:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80421a:	eb 30                	jmp    80424c <opencons+0x84>
  80421c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804220:	48 ba 20 71 80 00 00 	movabs $0x807120,%rdx
  804227:	00 00 00 
  80422a:	8b 12                	mov    (%rdx),%edx
  80422c:	89 10                	mov    %edx,(%rax)
  80422e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804232:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  804239:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80423d:	48 89 c7             	mov    %rax,%rdi
  804240:	48 b8 07 23 80 00 00 	movabs $0x802307,%rax
  804247:	00 00 00 
  80424a:	ff d0                	callq  *%rax
  80424c:	c9                   	leaveq 
  80424d:	c3                   	retq   

000000000080424e <devcons_read>:
  80424e:	55                   	push   %rbp
  80424f:	48 89 e5             	mov    %rsp,%rbp
  804252:	48 83 ec 30          	sub    $0x30,%rsp
  804256:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80425a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80425e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804262:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804267:	75 07                	jne    804270 <devcons_read+0x22>
  804269:	b8 00 00 00 00       	mov    $0x0,%eax
  80426e:	eb 4b                	jmp    8042bb <devcons_read+0x6d>
  804270:	eb 0c                	jmp    80427e <devcons_read+0x30>
  804272:	48 b8 d6 17 80 00 00 	movabs $0x8017d6,%rax
  804279:	00 00 00 
  80427c:	ff d0                	callq  *%rax
  80427e:	48 b8 16 17 80 00 00 	movabs $0x801716,%rax
  804285:	00 00 00 
  804288:	ff d0                	callq  *%rax
  80428a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80428d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804291:	74 df                	je     804272 <devcons_read+0x24>
  804293:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804297:	79 05                	jns    80429e <devcons_read+0x50>
  804299:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80429c:	eb 1d                	jmp    8042bb <devcons_read+0x6d>
  80429e:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  8042a2:	75 07                	jne    8042ab <devcons_read+0x5d>
  8042a4:	b8 00 00 00 00       	mov    $0x0,%eax
  8042a9:	eb 10                	jmp    8042bb <devcons_read+0x6d>
  8042ab:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8042ae:	89 c2                	mov    %eax,%edx
  8042b0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8042b4:	88 10                	mov    %dl,(%rax)
  8042b6:	b8 01 00 00 00       	mov    $0x1,%eax
  8042bb:	c9                   	leaveq 
  8042bc:	c3                   	retq   

00000000008042bd <devcons_write>:
  8042bd:	55                   	push   %rbp
  8042be:	48 89 e5             	mov    %rsp,%rbp
  8042c1:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  8042c8:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  8042cf:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  8042d6:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  8042dd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8042e4:	eb 76                	jmp    80435c <devcons_write+0x9f>
  8042e6:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  8042ed:	89 c2                	mov    %eax,%edx
  8042ef:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8042f2:	29 c2                	sub    %eax,%edx
  8042f4:	89 d0                	mov    %edx,%eax
  8042f6:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8042f9:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8042fc:	83 f8 7f             	cmp    $0x7f,%eax
  8042ff:	76 07                	jbe    804308 <devcons_write+0x4b>
  804301:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  804308:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80430b:	48 63 d0             	movslq %eax,%rdx
  80430e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804311:	48 63 c8             	movslq %eax,%rcx
  804314:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  80431b:	48 01 c1             	add    %rax,%rcx
  80431e:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  804325:	48 89 ce             	mov    %rcx,%rsi
  804328:	48 89 c7             	mov    %rax,%rdi
  80432b:	48 b8 09 12 80 00 00 	movabs $0x801209,%rax
  804332:	00 00 00 
  804335:	ff d0                	callq  *%rax
  804337:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80433a:	48 63 d0             	movslq %eax,%rdx
  80433d:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  804344:	48 89 d6             	mov    %rdx,%rsi
  804347:	48 89 c7             	mov    %rax,%rdi
  80434a:	48 b8 cc 16 80 00 00 	movabs $0x8016cc,%rax
  804351:	00 00 00 
  804354:	ff d0                	callq  *%rax
  804356:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804359:	01 45 fc             	add    %eax,-0x4(%rbp)
  80435c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80435f:	48 98                	cltq   
  804361:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  804368:	0f 82 78 ff ff ff    	jb     8042e6 <devcons_write+0x29>
  80436e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804371:	c9                   	leaveq 
  804372:	c3                   	retq   

0000000000804373 <devcons_close>:
  804373:	55                   	push   %rbp
  804374:	48 89 e5             	mov    %rsp,%rbp
  804377:	48 83 ec 08          	sub    $0x8,%rsp
  80437b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80437f:	b8 00 00 00 00       	mov    $0x0,%eax
  804384:	c9                   	leaveq 
  804385:	c3                   	retq   

0000000000804386 <devcons_stat>:
  804386:	55                   	push   %rbp
  804387:	48 89 e5             	mov    %rsp,%rbp
  80438a:	48 83 ec 10          	sub    $0x10,%rsp
  80438e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804392:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804396:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80439a:	48 be 1a 50 80 00 00 	movabs $0x80501a,%rsi
  8043a1:	00 00 00 
  8043a4:	48 89 c7             	mov    %rax,%rdi
  8043a7:	48 b8 e5 0e 80 00 00 	movabs $0x800ee5,%rax
  8043ae:	00 00 00 
  8043b1:	ff d0                	callq  *%rax
  8043b3:	b8 00 00 00 00       	mov    $0x0,%eax
  8043b8:	c9                   	leaveq 
  8043b9:	c3                   	retq   

00000000008043ba <_panic>:
  8043ba:	55                   	push   %rbp
  8043bb:	48 89 e5             	mov    %rsp,%rbp
  8043be:	53                   	push   %rbx
  8043bf:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  8043c6:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  8043cd:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  8043d3:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  8043da:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  8043e1:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  8043e8:	84 c0                	test   %al,%al
  8043ea:	74 23                	je     80440f <_panic+0x55>
  8043ec:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  8043f3:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  8043f7:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  8043fb:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  8043ff:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  804403:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  804407:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  80440b:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  80440f:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  804416:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  80441d:	00 00 00 
  804420:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  804427:	00 00 00 
  80442a:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80442e:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  804435:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  80443c:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  804443:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  80444a:	00 00 00 
  80444d:	48 8b 18             	mov    (%rax),%rbx
  804450:	48 b8 98 17 80 00 00 	movabs $0x801798,%rax
  804457:	00 00 00 
  80445a:	ff d0                	callq  *%rax
  80445c:	8b 8d 14 ff ff ff    	mov    -0xec(%rbp),%ecx
  804462:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  804469:	41 89 c8             	mov    %ecx,%r8d
  80446c:	48 89 d1             	mov    %rdx,%rcx
  80446f:	48 89 da             	mov    %rbx,%rdx
  804472:	89 c6                	mov    %eax,%esi
  804474:	48 bf 28 50 80 00 00 	movabs $0x805028,%rdi
  80447b:	00 00 00 
  80447e:	b8 00 00 00 00       	mov    $0x0,%eax
  804483:	49 b9 30 03 80 00 00 	movabs $0x800330,%r9
  80448a:	00 00 00 
  80448d:	41 ff d1             	callq  *%r9
  804490:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  804497:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  80449e:	48 89 d6             	mov    %rdx,%rsi
  8044a1:	48 89 c7             	mov    %rax,%rdi
  8044a4:	48 b8 84 02 80 00 00 	movabs $0x800284,%rax
  8044ab:	00 00 00 
  8044ae:	ff d0                	callq  *%rax
  8044b0:	48 bf 4b 50 80 00 00 	movabs $0x80504b,%rdi
  8044b7:	00 00 00 
  8044ba:	b8 00 00 00 00       	mov    $0x0,%eax
  8044bf:	48 ba 30 03 80 00 00 	movabs $0x800330,%rdx
  8044c6:	00 00 00 
  8044c9:	ff d2                	callq  *%rdx
  8044cb:	cc                   	int3   
  8044cc:	eb fd                	jmp    8044cb <_panic+0x111>

00000000008044ce <set_pgfault_handler>:
  8044ce:	55                   	push   %rbp
  8044cf:	48 89 e5             	mov    %rsp,%rbp
  8044d2:	48 83 ec 20          	sub    $0x20,%rsp
  8044d6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8044da:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8044e1:	00 00 00 
  8044e4:	48 8b 00             	mov    (%rax),%rax
  8044e7:	48 85 c0             	test   %rax,%rax
  8044ea:	75 6f                	jne    80455b <set_pgfault_handler+0x8d>
  8044ec:	ba 07 00 00 00       	mov    $0x7,%edx
  8044f1:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  8044f6:	bf 00 00 00 00       	mov    $0x0,%edi
  8044fb:	48 b8 14 18 80 00 00 	movabs $0x801814,%rax
  804502:	00 00 00 
  804505:	ff d0                	callq  *%rax
  804507:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80450a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80450e:	79 30                	jns    804540 <set_pgfault_handler+0x72>
  804510:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804513:	89 c1                	mov    %eax,%ecx
  804515:	48 ba 50 50 80 00 00 	movabs $0x805050,%rdx
  80451c:	00 00 00 
  80451f:	be 22 00 00 00       	mov    $0x22,%esi
  804524:	48 bf 6f 50 80 00 00 	movabs $0x80506f,%rdi
  80452b:	00 00 00 
  80452e:	b8 00 00 00 00       	mov    $0x0,%eax
  804533:	49 b8 ba 43 80 00 00 	movabs $0x8043ba,%r8
  80453a:	00 00 00 
  80453d:	41 ff d0             	callq  *%r8
  804540:	48 be 6e 45 80 00 00 	movabs $0x80456e,%rsi
  804547:	00 00 00 
  80454a:	bf 00 00 00 00       	mov    $0x0,%edi
  80454f:	48 b8 9e 19 80 00 00 	movabs $0x80199e,%rax
  804556:	00 00 00 
  804559:	ff d0                	callq  *%rax
  80455b:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804562:	00 00 00 
  804565:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804569:	48 89 10             	mov    %rdx,(%rax)
  80456c:	c9                   	leaveq 
  80456d:	c3                   	retq   

000000000080456e <_pgfault_upcall>:
.globl _pgfault_upcall
_pgfault_upcall:
// Call the C page fault handler.
// function argument: pointer to UTF

movq  %rsp,%rdi                // passing the function argument in rdi
  80456e:	48 89 e7             	mov    %rsp,%rdi
movabs _pgfault_handler, %rax
  804571:	48 a1 00 c0 80 00 00 	movabs 0x80c000,%rax
  804578:	00 00 00 
call *%rax
  80457b:	ff d0                	callq  *%rax
// registers are available for intermediate calculations.  You
// may find that you have to rearrange your code in non-obvious
// ways as registers become unavailable as scratch space.
//
// LAB 4: Your code here.
subq $8, 152(%rsp)
  80457d:	48 83 ac 24 98 00 00 	subq   $0x8,0x98(%rsp)
  804584:	00 08 
    movq 152(%rsp), %rax
  804586:	48 8b 84 24 98 00 00 	mov    0x98(%rsp),%rax
  80458d:	00 
    movq 136(%rsp), %rbx
  80458e:	48 8b 9c 24 88 00 00 	mov    0x88(%rsp),%rbx
  804595:	00 
movq %rbx, (%rax)
  804596:	48 89 18             	mov    %rbx,(%rax)

    // Restore the trap-time registers.  After you do this, you
    // can no longer modify any general-purpose registers.
    // LAB 4: Your code here.
    addq $16, %rsp
  804599:	48 83 c4 10          	add    $0x10,%rsp
    POPA_
  80459d:	4c 8b 3c 24          	mov    (%rsp),%r15
  8045a1:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
  8045a6:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
  8045ab:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  8045b0:	4c 8b 5c 24 20       	mov    0x20(%rsp),%r11
  8045b5:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
  8045ba:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
  8045bf:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
  8045c4:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
  8045c9:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
  8045ce:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
  8045d3:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
  8045d8:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
  8045dd:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
  8045e2:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  8045e7:	48 83 c4 78          	add    $0x78,%rsp

    // Restore eflags from the stack.  After you do this, you can
    // no longer use arithmetic operations or anything else that
    // modifies eflags.
    // LAB 4: Your code here.
pushq 8(%rsp)
  8045eb:	ff 74 24 08          	pushq  0x8(%rsp)
    popfq
  8045ef:	9d                   	popfq  

    // Switch back to the adjusted trap-time stack.
    // LAB 4: Your code here.
    movq 16(%rsp), %rsp
  8045f0:	48 8b 64 24 10       	mov    0x10(%rsp),%rsp

    // Return to re-execute the instruction that faulted.
    // LAB 4: Your code here.
    retq
  8045f5:	c3                   	retq   

00000000008045f6 <ipc_recv>:
  8045f6:	55                   	push   %rbp
  8045f7:	48 89 e5             	mov    %rsp,%rbp
  8045fa:	48 83 ec 30          	sub    $0x30,%rsp
  8045fe:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804602:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804606:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80460a:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80460f:	75 0e                	jne    80461f <ipc_recv+0x29>
  804611:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804618:	00 00 00 
  80461b:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80461f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804623:	48 89 c7             	mov    %rax,%rdi
  804626:	48 b8 3d 1a 80 00 00 	movabs $0x801a3d,%rax
  80462d:	00 00 00 
  804630:	ff d0                	callq  *%rax
  804632:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804635:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804639:	79 27                	jns    804662 <ipc_recv+0x6c>
  80463b:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  804640:	74 0a                	je     80464c <ipc_recv+0x56>
  804642:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804646:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  80464c:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804651:	74 0a                	je     80465d <ipc_recv+0x67>
  804653:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804657:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  80465d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804660:	eb 53                	jmp    8046b5 <ipc_recv+0xbf>
  804662:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  804667:	74 19                	je     804682 <ipc_recv+0x8c>
  804669:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  804670:	00 00 00 
  804673:	48 8b 00             	mov    (%rax),%rax
  804676:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  80467c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804680:	89 10                	mov    %edx,(%rax)
  804682:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804687:	74 19                	je     8046a2 <ipc_recv+0xac>
  804689:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  804690:	00 00 00 
  804693:	48 8b 00             	mov    (%rax),%rax
  804696:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  80469c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8046a0:	89 10                	mov    %edx,(%rax)
  8046a2:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8046a9:	00 00 00 
  8046ac:	48 8b 00             	mov    (%rax),%rax
  8046af:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  8046b5:	c9                   	leaveq 
  8046b6:	c3                   	retq   

00000000008046b7 <ipc_send>:
  8046b7:	55                   	push   %rbp
  8046b8:	48 89 e5             	mov    %rsp,%rbp
  8046bb:	48 83 ec 30          	sub    $0x30,%rsp
  8046bf:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8046c2:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8046c5:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  8046c9:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  8046cc:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8046d1:	75 10                	jne    8046e3 <ipc_send+0x2c>
  8046d3:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8046da:	00 00 00 
  8046dd:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8046e1:	eb 0e                	jmp    8046f1 <ipc_send+0x3a>
  8046e3:	eb 0c                	jmp    8046f1 <ipc_send+0x3a>
  8046e5:	48 b8 d6 17 80 00 00 	movabs $0x8017d6,%rax
  8046ec:	00 00 00 
  8046ef:	ff d0                	callq  *%rax
  8046f1:	8b 75 e8             	mov    -0x18(%rbp),%esi
  8046f4:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  8046f7:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8046fb:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8046fe:	89 c7                	mov    %eax,%edi
  804700:	48 b8 e8 19 80 00 00 	movabs $0x8019e8,%rax
  804707:	00 00 00 
  80470a:	ff d0                	callq  *%rax
  80470c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80470f:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  804713:	74 d0                	je     8046e5 <ipc_send+0x2e>
  804715:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804719:	79 30                	jns    80474b <ipc_send+0x94>
  80471b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80471e:	89 c1                	mov    %eax,%ecx
  804720:	48 ba 80 50 80 00 00 	movabs $0x805080,%rdx
  804727:	00 00 00 
  80472a:	be 44 00 00 00       	mov    $0x44,%esi
  80472f:	48 bf 96 50 80 00 00 	movabs $0x805096,%rdi
  804736:	00 00 00 
  804739:	b8 00 00 00 00       	mov    $0x0,%eax
  80473e:	49 b8 ba 43 80 00 00 	movabs $0x8043ba,%r8
  804745:	00 00 00 
  804748:	41 ff d0             	callq  *%r8
  80474b:	c9                   	leaveq 
  80474c:	c3                   	retq   

000000000080474d <ipc_find_env>:
  80474d:	55                   	push   %rbp
  80474e:	48 89 e5             	mov    %rsp,%rbp
  804751:	48 83 ec 14          	sub    $0x14,%rsp
  804755:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804758:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80475f:	eb 4e                	jmp    8047af <ipc_find_env+0x62>
  804761:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804768:	00 00 00 
  80476b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80476e:	48 98                	cltq   
  804770:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804777:	48 01 d0             	add    %rdx,%rax
  80477a:	48 05 d0 00 00 00    	add    $0xd0,%rax
  804780:	8b 00                	mov    (%rax),%eax
  804782:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  804785:	75 24                	jne    8047ab <ipc_find_env+0x5e>
  804787:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  80478e:	00 00 00 
  804791:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804794:	48 98                	cltq   
  804796:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  80479d:	48 01 d0             	add    %rdx,%rax
  8047a0:	48 05 c0 00 00 00    	add    $0xc0,%rax
  8047a6:	8b 40 08             	mov    0x8(%rax),%eax
  8047a9:	eb 12                	jmp    8047bd <ipc_find_env+0x70>
  8047ab:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8047af:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  8047b6:	7e a9                	jle    804761 <ipc_find_env+0x14>
  8047b8:	b8 00 00 00 00       	mov    $0x0,%eax
  8047bd:	c9                   	leaveq 
  8047be:	c3                   	retq   

00000000008047bf <pageref>:
  8047bf:	55                   	push   %rbp
  8047c0:	48 89 e5             	mov    %rsp,%rbp
  8047c3:	48 83 ec 18          	sub    $0x18,%rsp
  8047c7:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8047cb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8047cf:	48 c1 e8 15          	shr    $0x15,%rax
  8047d3:	48 89 c2             	mov    %rax,%rdx
  8047d6:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8047dd:	01 00 00 
  8047e0:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8047e4:	83 e0 01             	and    $0x1,%eax
  8047e7:	48 85 c0             	test   %rax,%rax
  8047ea:	75 07                	jne    8047f3 <pageref+0x34>
  8047ec:	b8 00 00 00 00       	mov    $0x0,%eax
  8047f1:	eb 53                	jmp    804846 <pageref+0x87>
  8047f3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8047f7:	48 c1 e8 0c          	shr    $0xc,%rax
  8047fb:	48 89 c2             	mov    %rax,%rdx
  8047fe:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  804805:	01 00 00 
  804808:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80480c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804810:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804814:	83 e0 01             	and    $0x1,%eax
  804817:	48 85 c0             	test   %rax,%rax
  80481a:	75 07                	jne    804823 <pageref+0x64>
  80481c:	b8 00 00 00 00       	mov    $0x0,%eax
  804821:	eb 23                	jmp    804846 <pageref+0x87>
  804823:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804827:	48 c1 e8 0c          	shr    $0xc,%rax
  80482b:	48 89 c2             	mov    %rax,%rdx
  80482e:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  804835:	00 00 00 
  804838:	48 c1 e2 04          	shl    $0x4,%rdx
  80483c:	48 01 d0             	add    %rdx,%rax
  80483f:	0f b7 40 08          	movzwl 0x8(%rax),%eax
  804843:	0f b7 c0             	movzwl %ax,%eax
  804846:	c9                   	leaveq 
  804847:	c3                   	retq   
