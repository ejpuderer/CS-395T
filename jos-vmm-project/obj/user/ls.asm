
obj/user/ls:     file format elf64-x86-64


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
  80003c:	e8 da 04 00 00       	callq  80051b <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <ls>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  80004e:	48 89 bd 58 ff ff ff 	mov    %rdi,-0xa8(%rbp)
  800055:	48 89 b5 50 ff ff ff 	mov    %rsi,-0xb0(%rbp)
  80005c:	48 8d 95 60 ff ff ff 	lea    -0xa0(%rbp),%rdx
  800063:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  80006a:	48 89 d6             	mov    %rdx,%rsi
  80006d:	48 89 c7             	mov    %rax,%rdi
  800070:	48 b8 a1 2d 80 00 00 	movabs $0x802da1,%rax
  800077:	00 00 00 
  80007a:	ff d0                	callq  *%rax
  80007c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80007f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800083:	79 3b                	jns    8000c0 <ls+0x7d>
  800085:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800088:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  80008f:	41 89 d0             	mov    %edx,%r8d
  800092:	48 89 c1             	mov    %rax,%rcx
  800095:	48 ba c0 4a 80 00 00 	movabs $0x804ac0,%rdx
  80009c:	00 00 00 
  80009f:	be 10 00 00 00       	mov    $0x10,%esi
  8000a4:	48 bf cc 4a 80 00 00 	movabs $0x804acc,%rdi
  8000ab:	00 00 00 
  8000ae:	b8 00 00 00 00       	mov    $0x0,%eax
  8000b3:	49 b9 c1 05 80 00 00 	movabs $0x8005c1,%r9
  8000ba:	00 00 00 
  8000bd:	41 ff d1             	callq  *%r9
  8000c0:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8000c3:	85 c0                	test   %eax,%eax
  8000c5:	74 36                	je     8000fd <ls+0xba>
  8000c7:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  8000ce:	00 00 00 
  8000d1:	8b 80 90 01 00 00    	mov    0x190(%rax),%eax
  8000d7:	85 c0                	test   %eax,%eax
  8000d9:	75 22                	jne    8000fd <ls+0xba>
  8000db:	48 8b 95 50 ff ff ff 	mov    -0xb0(%rbp),%rdx
  8000e2:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  8000e9:	48 89 d6             	mov    %rdx,%rsi
  8000ec:	48 89 c7             	mov    %rax,%rdi
  8000ef:	48 b8 27 01 80 00 00 	movabs $0x800127,%rax
  8000f6:	00 00 00 
  8000f9:	ff d0                	callq  *%rax
  8000fb:	eb 28                	jmp    800125 <ls+0xe2>
  8000fd:	8b 55 e0             	mov    -0x20(%rbp),%edx
  800100:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  800103:	85 c0                	test   %eax,%eax
  800105:	0f 95 c0             	setne  %al
  800108:	0f b6 c0             	movzbl %al,%eax
  80010b:	48 8b 8d 58 ff ff ff 	mov    -0xa8(%rbp),%rcx
  800112:	89 c6                	mov    %eax,%esi
  800114:	bf 00 00 00 00       	mov    $0x0,%edi
  800119:	48 b8 88 02 80 00 00 	movabs $0x800288,%rax
  800120:	00 00 00 
  800123:	ff d0                	callq  *%rax
  800125:	c9                   	leaveq 
  800126:	c3                   	retq   

0000000000800127 <lsdir>:
  800127:	55                   	push   %rbp
  800128:	48 89 e5             	mov    %rsp,%rbp
  80012b:	48 81 ec 20 01 00 00 	sub    $0x120,%rsp
  800132:	48 89 bd e8 fe ff ff 	mov    %rdi,-0x118(%rbp)
  800139:	48 89 b5 e0 fe ff ff 	mov    %rsi,-0x120(%rbp)
  800140:	48 8b 85 e8 fe ff ff 	mov    -0x118(%rbp),%rax
  800147:	be 00 00 00 00       	mov    $0x0,%esi
  80014c:	48 89 c7             	mov    %rax,%rdi
  80014f:	48 b8 8f 2e 80 00 00 	movabs $0x802e8f,%rax
  800156:	00 00 00 
  800159:	ff d0                	callq  *%rax
  80015b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80015e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800162:	79 3b                	jns    80019f <lsdir+0x78>
  800164:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800167:	48 8b 85 e8 fe ff ff 	mov    -0x118(%rbp),%rax
  80016e:	41 89 d0             	mov    %edx,%r8d
  800171:	48 89 c1             	mov    %rax,%rcx
  800174:	48 ba d9 4a 80 00 00 	movabs $0x804ad9,%rdx
  80017b:	00 00 00 
  80017e:	be 1e 00 00 00       	mov    $0x1e,%esi
  800183:	48 bf cc 4a 80 00 00 	movabs $0x804acc,%rdi
  80018a:	00 00 00 
  80018d:	b8 00 00 00 00       	mov    $0x0,%eax
  800192:	49 b9 c1 05 80 00 00 	movabs $0x8005c1,%r9
  800199:	00 00 00 
  80019c:	41 ff d1             	callq  *%r9
  80019f:	eb 3d                	jmp    8001de <lsdir+0xb7>
  8001a1:	0f b6 85 f0 fe ff ff 	movzbl -0x110(%rbp),%eax
  8001a8:	84 c0                	test   %al,%al
  8001aa:	74 32                	je     8001de <lsdir+0xb7>
  8001ac:	8b 95 70 ff ff ff    	mov    -0x90(%rbp),%edx
  8001b2:	8b 85 74 ff ff ff    	mov    -0x8c(%rbp),%eax
  8001b8:	83 f8 01             	cmp    $0x1,%eax
  8001bb:	0f 94 c0             	sete   %al
  8001be:	0f b6 f0             	movzbl %al,%esi
  8001c1:	48 8d 8d f0 fe ff ff 	lea    -0x110(%rbp),%rcx
  8001c8:	48 8b 85 e0 fe ff ff 	mov    -0x120(%rbp),%rax
  8001cf:	48 89 c7             	mov    %rax,%rdi
  8001d2:	48 b8 88 02 80 00 00 	movabs $0x800288,%rax
  8001d9:	00 00 00 
  8001dc:	ff d0                	callq  *%rax
  8001de:	48 8d 8d f0 fe ff ff 	lea    -0x110(%rbp),%rcx
  8001e5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8001e8:	ba 00 01 00 00       	mov    $0x100,%edx
  8001ed:	48 89 ce             	mov    %rcx,%rsi
  8001f0:	89 c7                	mov    %eax,%edi
  8001f2:	48 b8 8e 2a 80 00 00 	movabs $0x802a8e,%rax
  8001f9:	00 00 00 
  8001fc:	ff d0                	callq  *%rax
  8001fe:	89 45 f8             	mov    %eax,-0x8(%rbp)
  800201:	81 7d f8 00 01 00 00 	cmpl   $0x100,-0x8(%rbp)
  800208:	74 97                	je     8001a1 <lsdir+0x7a>
  80020a:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80020e:	7e 35                	jle    800245 <lsdir+0x11e>
  800210:	48 8b 85 e8 fe ff ff 	mov    -0x118(%rbp),%rax
  800217:	48 89 c1             	mov    %rax,%rcx
  80021a:	48 ba e5 4a 80 00 00 	movabs $0x804ae5,%rdx
  800221:	00 00 00 
  800224:	be 23 00 00 00       	mov    $0x23,%esi
  800229:	48 bf cc 4a 80 00 00 	movabs $0x804acc,%rdi
  800230:	00 00 00 
  800233:	b8 00 00 00 00       	mov    $0x0,%eax
  800238:	49 b8 c1 05 80 00 00 	movabs $0x8005c1,%r8
  80023f:	00 00 00 
  800242:	41 ff d0             	callq  *%r8
  800245:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  800249:	79 3b                	jns    800286 <lsdir+0x15f>
  80024b:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80024e:	48 8b 85 e8 fe ff ff 	mov    -0x118(%rbp),%rax
  800255:	41 89 d0             	mov    %edx,%r8d
  800258:	48 89 c1             	mov    %rax,%rcx
  80025b:	48 ba 00 4b 80 00 00 	movabs $0x804b00,%rdx
  800262:	00 00 00 
  800265:	be 25 00 00 00       	mov    $0x25,%esi
  80026a:	48 bf cc 4a 80 00 00 	movabs $0x804acc,%rdi
  800271:	00 00 00 
  800274:	b8 00 00 00 00       	mov    $0x0,%eax
  800279:	49 b9 c1 05 80 00 00 	movabs $0x8005c1,%r9
  800280:	00 00 00 
  800283:	41 ff d1             	callq  *%r9
  800286:	c9                   	leaveq 
  800287:	c3                   	retq   

0000000000800288 <ls1>:
  800288:	55                   	push   %rbp
  800289:	48 89 e5             	mov    %rsp,%rbp
  80028c:	48 83 ec 30          	sub    $0x30,%rsp
  800290:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800294:	89 f0                	mov    %esi,%eax
  800296:	89 55 e0             	mov    %edx,-0x20(%rbp)
  800299:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
  80029d:	88 45 e4             	mov    %al,-0x1c(%rbp)
  8002a0:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  8002a7:	00 00 00 
  8002aa:	8b 80 b0 01 00 00    	mov    0x1b0(%rax),%eax
  8002b0:	85 c0                	test   %eax,%eax
  8002b2:	74 34                	je     8002e8 <ls1+0x60>
  8002b4:	80 7d e4 00          	cmpb   $0x0,-0x1c(%rbp)
  8002b8:	74 07                	je     8002c1 <ls1+0x39>
  8002ba:	b8 64 00 00 00       	mov    $0x64,%eax
  8002bf:	eb 05                	jmp    8002c6 <ls1+0x3e>
  8002c1:	b8 2d 00 00 00       	mov    $0x2d,%eax
  8002c6:	8b 4d e0             	mov    -0x20(%rbp),%ecx
  8002c9:	89 c2                	mov    %eax,%edx
  8002cb:	89 ce                	mov    %ecx,%esi
  8002cd:	48 bf 1f 4b 80 00 00 	movabs $0x804b1f,%rdi
  8002d4:	00 00 00 
  8002d7:	b8 00 00 00 00       	mov    $0x0,%eax
  8002dc:	48 b9 1a 37 80 00 00 	movabs $0x80371a,%rcx
  8002e3:	00 00 00 
  8002e6:	ff d1                	callq  *%rcx
  8002e8:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8002ed:	74 76                	je     800365 <ls1+0xdd>
  8002ef:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8002f3:	0f b6 00             	movzbl (%rax),%eax
  8002f6:	84 c0                	test   %al,%al
  8002f8:	74 37                	je     800331 <ls1+0xa9>
  8002fa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8002fe:	48 89 c7             	mov    %rax,%rdi
  800301:	48 b8 43 13 80 00 00 	movabs $0x801343,%rax
  800308:	00 00 00 
  80030b:	ff d0                	callq  *%rax
  80030d:	48 98                	cltq   
  80030f:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  800313:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800317:	48 01 d0             	add    %rdx,%rax
  80031a:	0f b6 00             	movzbl (%rax),%eax
  80031d:	3c 2f                	cmp    $0x2f,%al
  80031f:	74 10                	je     800331 <ls1+0xa9>
  800321:	48 b8 28 4b 80 00 00 	movabs $0x804b28,%rax
  800328:	00 00 00 
  80032b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80032f:	eb 0e                	jmp    80033f <ls1+0xb7>
  800331:	48 b8 2a 4b 80 00 00 	movabs $0x804b2a,%rax
  800338:	00 00 00 
  80033b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80033f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  800343:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800347:	48 89 c6             	mov    %rax,%rsi
  80034a:	48 bf 2b 4b 80 00 00 	movabs $0x804b2b,%rdi
  800351:	00 00 00 
  800354:	b8 00 00 00 00       	mov    $0x0,%eax
  800359:	48 b9 1a 37 80 00 00 	movabs $0x80371a,%rcx
  800360:	00 00 00 
  800363:	ff d1                	callq  *%rcx
  800365:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800369:	48 89 c6             	mov    %rax,%rsi
  80036c:	48 bf 30 4b 80 00 00 	movabs $0x804b30,%rdi
  800373:	00 00 00 
  800376:	b8 00 00 00 00       	mov    $0x0,%eax
  80037b:	48 ba 1a 37 80 00 00 	movabs $0x80371a,%rdx
  800382:	00 00 00 
  800385:	ff d2                	callq  *%rdx
  800387:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  80038e:	00 00 00 
  800391:	8b 80 18 01 00 00    	mov    0x118(%rax),%eax
  800397:	85 c0                	test   %eax,%eax
  800399:	74 21                	je     8003bc <ls1+0x134>
  80039b:	80 7d e4 00          	cmpb   $0x0,-0x1c(%rbp)
  80039f:	74 1b                	je     8003bc <ls1+0x134>
  8003a1:	48 bf 28 4b 80 00 00 	movabs $0x804b28,%rdi
  8003a8:	00 00 00 
  8003ab:	b8 00 00 00 00       	mov    $0x0,%eax
  8003b0:	48 ba 1a 37 80 00 00 	movabs $0x80371a,%rdx
  8003b7:	00 00 00 
  8003ba:	ff d2                	callq  *%rdx
  8003bc:	48 bf 33 4b 80 00 00 	movabs $0x804b33,%rdi
  8003c3:	00 00 00 
  8003c6:	b8 00 00 00 00       	mov    $0x0,%eax
  8003cb:	48 ba 1a 37 80 00 00 	movabs $0x80371a,%rdx
  8003d2:	00 00 00 
  8003d5:	ff d2                	callq  *%rdx
  8003d7:	c9                   	leaveq 
  8003d8:	c3                   	retq   

00000000008003d9 <usage>:
  8003d9:	55                   	push   %rbp
  8003da:	48 89 e5             	mov    %rsp,%rbp
  8003dd:	48 bf 35 4b 80 00 00 	movabs $0x804b35,%rdi
  8003e4:	00 00 00 
  8003e7:	b8 00 00 00 00       	mov    $0x0,%eax
  8003ec:	48 ba 1a 37 80 00 00 	movabs $0x80371a,%rdx
  8003f3:	00 00 00 
  8003f6:	ff d2                	callq  *%rdx
  8003f8:	48 b8 9e 05 80 00 00 	movabs $0x80059e,%rax
  8003ff:	00 00 00 
  800402:	ff d0                	callq  *%rax
  800404:	5d                   	pop    %rbp
  800405:	c3                   	retq   

0000000000800406 <umain>:
  800406:	55                   	push   %rbp
  800407:	48 89 e5             	mov    %rsp,%rbp
  80040a:	48 83 ec 40          	sub    $0x40,%rsp
  80040e:	89 7d cc             	mov    %edi,-0x34(%rbp)
  800411:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
  800415:	48 8d 55 d0          	lea    -0x30(%rbp),%rdx
  800419:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
  80041d:	48 8d 45 cc          	lea    -0x34(%rbp),%rax
  800421:	48 89 ce             	mov    %rcx,%rsi
  800424:	48 89 c7             	mov    %rax,%rdi
  800427:	48 b8 bc 21 80 00 00 	movabs $0x8021bc,%rax
  80042e:	00 00 00 
  800431:	ff d0                	callq  *%rax
  800433:	eb 49                	jmp    80047e <umain+0x78>
  800435:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800438:	83 f8 64             	cmp    $0x64,%eax
  80043b:	74 0a                	je     800447 <umain+0x41>
  80043d:	83 f8 6c             	cmp    $0x6c,%eax
  800440:	74 05                	je     800447 <umain+0x41>
  800442:	83 f8 46             	cmp    $0x46,%eax
  800445:	75 2b                	jne    800472 <umain+0x6c>
  800447:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  80044e:	00 00 00 
  800451:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800454:	48 63 d2             	movslq %edx,%rdx
  800457:	8b 04 90             	mov    (%rax,%rdx,4),%eax
  80045a:	8d 48 01             	lea    0x1(%rax),%ecx
  80045d:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  800464:	00 00 00 
  800467:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80046a:	48 63 d2             	movslq %edx,%rdx
  80046d:	89 0c 90             	mov    %ecx,(%rax,%rdx,4)
  800470:	eb 0c                	jmp    80047e <umain+0x78>
  800472:	48 b8 d9 03 80 00 00 	movabs $0x8003d9,%rax
  800479:	00 00 00 
  80047c:	ff d0                	callq  *%rax
  80047e:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  800482:	48 89 c7             	mov    %rax,%rdi
  800485:	48 b8 20 22 80 00 00 	movabs $0x802220,%rax
  80048c:	00 00 00 
  80048f:	ff d0                	callq  *%rax
  800491:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800494:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800498:	79 9b                	jns    800435 <umain+0x2f>
  80049a:	8b 45 cc             	mov    -0x34(%rbp),%eax
  80049d:	83 f8 01             	cmp    $0x1,%eax
  8004a0:	75 22                	jne    8004c4 <umain+0xbe>
  8004a2:	48 be 2a 4b 80 00 00 	movabs $0x804b2a,%rsi
  8004a9:	00 00 00 
  8004ac:	48 bf 28 4b 80 00 00 	movabs $0x804b28,%rdi
  8004b3:	00 00 00 
  8004b6:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8004bd:	00 00 00 
  8004c0:	ff d0                	callq  *%rax
  8004c2:	eb 55                	jmp    800519 <umain+0x113>
  8004c4:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  8004cb:	eb 44                	jmp    800511 <umain+0x10b>
  8004cd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8004d0:	48 98                	cltq   
  8004d2:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8004d9:	00 
  8004da:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  8004de:	48 01 d0             	add    %rdx,%rax
  8004e1:	48 8b 10             	mov    (%rax),%rdx
  8004e4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8004e7:	48 98                	cltq   
  8004e9:	48 8d 0c c5 00 00 00 	lea    0x0(,%rax,8),%rcx
  8004f0:	00 
  8004f1:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  8004f5:	48 01 c8             	add    %rcx,%rax
  8004f8:	48 8b 00             	mov    (%rax),%rax
  8004fb:	48 89 d6             	mov    %rdx,%rsi
  8004fe:	48 89 c7             	mov    %rax,%rdi
  800501:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800508:	00 00 00 
  80050b:	ff d0                	callq  *%rax
  80050d:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800511:	8b 45 cc             	mov    -0x34(%rbp),%eax
  800514:	39 45 fc             	cmp    %eax,-0x4(%rbp)
  800517:	7c b4                	jl     8004cd <umain+0xc7>
  800519:	c9                   	leaveq 
  80051a:	c3                   	retq   

000000000080051b <libmain>:
  80051b:	55                   	push   %rbp
  80051c:	48 89 e5             	mov    %rsp,%rbp
  80051f:	48 83 ec 10          	sub    $0x10,%rsp
  800523:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800526:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80052a:	48 b8 62 1c 80 00 00 	movabs $0x801c62,%rax
  800531:	00 00 00 
  800534:	ff d0                	callq  *%rax
  800536:	25 ff 03 00 00       	and    $0x3ff,%eax
  80053b:	48 98                	cltq   
  80053d:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  800544:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80054b:	00 00 00 
  80054e:	48 01 c2             	add    %rax,%rdx
  800551:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  800558:	00 00 00 
  80055b:	48 89 10             	mov    %rdx,(%rax)
  80055e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800562:	7e 14                	jle    800578 <libmain+0x5d>
  800564:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800568:	48 8b 10             	mov    (%rax),%rdx
  80056b:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  800572:	00 00 00 
  800575:	48 89 10             	mov    %rdx,(%rax)
  800578:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80057c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80057f:	48 89 d6             	mov    %rdx,%rsi
  800582:	89 c7                	mov    %eax,%edi
  800584:	48 b8 06 04 80 00 00 	movabs $0x800406,%rax
  80058b:	00 00 00 
  80058e:	ff d0                	callq  *%rax
  800590:	48 b8 9e 05 80 00 00 	movabs $0x80059e,%rax
  800597:	00 00 00 
  80059a:	ff d0                	callq  *%rax
  80059c:	c9                   	leaveq 
  80059d:	c3                   	retq   

000000000080059e <exit>:
  80059e:	55                   	push   %rbp
  80059f:	48 89 e5             	mov    %rsp,%rbp
  8005a2:	48 b8 e2 27 80 00 00 	movabs $0x8027e2,%rax
  8005a9:	00 00 00 
  8005ac:	ff d0                	callq  *%rax
  8005ae:	bf 00 00 00 00       	mov    $0x0,%edi
  8005b3:	48 b8 1e 1c 80 00 00 	movabs $0x801c1e,%rax
  8005ba:	00 00 00 
  8005bd:	ff d0                	callq  *%rax
  8005bf:	5d                   	pop    %rbp
  8005c0:	c3                   	retq   

00000000008005c1 <_panic>:
  8005c1:	55                   	push   %rbp
  8005c2:	48 89 e5             	mov    %rsp,%rbp
  8005c5:	53                   	push   %rbx
  8005c6:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  8005cd:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  8005d4:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  8005da:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  8005e1:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  8005e8:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  8005ef:	84 c0                	test   %al,%al
  8005f1:	74 23                	je     800616 <_panic+0x55>
  8005f3:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  8005fa:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  8005fe:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  800602:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  800606:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  80060a:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  80060e:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  800612:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  800616:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  80061d:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  800624:	00 00 00 
  800627:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  80062e:	00 00 00 
  800631:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800635:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  80063c:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  800643:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  80064a:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  800651:	00 00 00 
  800654:	48 8b 18             	mov    (%rax),%rbx
  800657:	48 b8 62 1c 80 00 00 	movabs $0x801c62,%rax
  80065e:	00 00 00 
  800661:	ff d0                	callq  *%rax
  800663:	8b 8d 14 ff ff ff    	mov    -0xec(%rbp),%ecx
  800669:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800670:	41 89 c8             	mov    %ecx,%r8d
  800673:	48 89 d1             	mov    %rdx,%rcx
  800676:	48 89 da             	mov    %rbx,%rdx
  800679:	89 c6                	mov    %eax,%esi
  80067b:	48 bf 60 4b 80 00 00 	movabs $0x804b60,%rdi
  800682:	00 00 00 
  800685:	b8 00 00 00 00       	mov    $0x0,%eax
  80068a:	49 b9 fa 07 80 00 00 	movabs $0x8007fa,%r9
  800691:	00 00 00 
  800694:	41 ff d1             	callq  *%r9
  800697:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  80069e:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8006a5:	48 89 d6             	mov    %rdx,%rsi
  8006a8:	48 89 c7             	mov    %rax,%rdi
  8006ab:	48 b8 4e 07 80 00 00 	movabs $0x80074e,%rax
  8006b2:	00 00 00 
  8006b5:	ff d0                	callq  *%rax
  8006b7:	48 bf 83 4b 80 00 00 	movabs $0x804b83,%rdi
  8006be:	00 00 00 
  8006c1:	b8 00 00 00 00       	mov    $0x0,%eax
  8006c6:	48 ba fa 07 80 00 00 	movabs $0x8007fa,%rdx
  8006cd:	00 00 00 
  8006d0:	ff d2                	callq  *%rdx
  8006d2:	cc                   	int3   
  8006d3:	eb fd                	jmp    8006d2 <_panic+0x111>

00000000008006d5 <putch>:
  8006d5:	55                   	push   %rbp
  8006d6:	48 89 e5             	mov    %rsp,%rbp
  8006d9:	48 83 ec 10          	sub    $0x10,%rsp
  8006dd:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8006e0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8006e4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8006e8:	8b 00                	mov    (%rax),%eax
  8006ea:	8d 48 01             	lea    0x1(%rax),%ecx
  8006ed:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8006f1:	89 0a                	mov    %ecx,(%rdx)
  8006f3:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8006f6:	89 d1                	mov    %edx,%ecx
  8006f8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8006fc:	48 98                	cltq   
  8006fe:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  800702:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800706:	8b 00                	mov    (%rax),%eax
  800708:	3d ff 00 00 00       	cmp    $0xff,%eax
  80070d:	75 2c                	jne    80073b <putch+0x66>
  80070f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800713:	8b 00                	mov    (%rax),%eax
  800715:	48 98                	cltq   
  800717:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80071b:	48 83 c2 08          	add    $0x8,%rdx
  80071f:	48 89 c6             	mov    %rax,%rsi
  800722:	48 89 d7             	mov    %rdx,%rdi
  800725:	48 b8 96 1b 80 00 00 	movabs $0x801b96,%rax
  80072c:	00 00 00 
  80072f:	ff d0                	callq  *%rax
  800731:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800735:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  80073b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80073f:	8b 40 04             	mov    0x4(%rax),%eax
  800742:	8d 50 01             	lea    0x1(%rax),%edx
  800745:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800749:	89 50 04             	mov    %edx,0x4(%rax)
  80074c:	c9                   	leaveq 
  80074d:	c3                   	retq   

000000000080074e <vcprintf>:
  80074e:	55                   	push   %rbp
  80074f:	48 89 e5             	mov    %rsp,%rbp
  800752:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  800759:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  800760:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  800767:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  80076e:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  800775:	48 8b 0a             	mov    (%rdx),%rcx
  800778:	48 89 08             	mov    %rcx,(%rax)
  80077b:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80077f:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800783:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800787:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80078b:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  800792:	00 00 00 
  800795:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  80079c:	00 00 00 
  80079f:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  8007a6:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  8007ad:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  8007b4:	48 89 c6             	mov    %rax,%rsi
  8007b7:	48 bf d5 06 80 00 00 	movabs $0x8006d5,%rdi
  8007be:	00 00 00 
  8007c1:	48 b8 ad 0b 80 00 00 	movabs $0x800bad,%rax
  8007c8:	00 00 00 
  8007cb:	ff d0                	callq  *%rax
  8007cd:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  8007d3:	48 98                	cltq   
  8007d5:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  8007dc:	48 83 c2 08          	add    $0x8,%rdx
  8007e0:	48 89 c6             	mov    %rax,%rsi
  8007e3:	48 89 d7             	mov    %rdx,%rdi
  8007e6:	48 b8 96 1b 80 00 00 	movabs $0x801b96,%rax
  8007ed:	00 00 00 
  8007f0:	ff d0                	callq  *%rax
  8007f2:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  8007f8:	c9                   	leaveq 
  8007f9:	c3                   	retq   

00000000008007fa <cprintf>:
  8007fa:	55                   	push   %rbp
  8007fb:	48 89 e5             	mov    %rsp,%rbp
  8007fe:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  800805:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  80080c:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  800813:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  80081a:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800821:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800828:	84 c0                	test   %al,%al
  80082a:	74 20                	je     80084c <cprintf+0x52>
  80082c:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800830:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800834:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800838:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  80083c:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800840:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800844:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800848:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  80084c:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800853:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  80085a:	00 00 00 
  80085d:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800864:	00 00 00 
  800867:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80086b:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800872:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800879:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800880:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800887:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  80088e:	48 8b 0a             	mov    (%rdx),%rcx
  800891:	48 89 08             	mov    %rcx,(%rax)
  800894:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800898:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80089c:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8008a0:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8008a4:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  8008ab:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8008b2:	48 89 d6             	mov    %rdx,%rsi
  8008b5:	48 89 c7             	mov    %rax,%rdi
  8008b8:	48 b8 4e 07 80 00 00 	movabs $0x80074e,%rax
  8008bf:	00 00 00 
  8008c2:	ff d0                	callq  *%rax
  8008c4:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  8008ca:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  8008d0:	c9                   	leaveq 
  8008d1:	c3                   	retq   

00000000008008d2 <printnum>:
  8008d2:	55                   	push   %rbp
  8008d3:	48 89 e5             	mov    %rsp,%rbp
  8008d6:	53                   	push   %rbx
  8008d7:	48 83 ec 38          	sub    $0x38,%rsp
  8008db:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8008df:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8008e3:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8008e7:	89 4d d4             	mov    %ecx,-0x2c(%rbp)
  8008ea:	44 89 45 d0          	mov    %r8d,-0x30(%rbp)
  8008ee:	44 89 4d cc          	mov    %r9d,-0x34(%rbp)
  8008f2:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  8008f5:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8008f9:	77 3b                	ja     800936 <printnum+0x64>
  8008fb:	8b 45 d0             	mov    -0x30(%rbp),%eax
  8008fe:	44 8d 40 ff          	lea    -0x1(%rax),%r8d
  800902:	8b 5d d4             	mov    -0x2c(%rbp),%ebx
  800905:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800909:	ba 00 00 00 00       	mov    $0x0,%edx
  80090e:	48 f7 f3             	div    %rbx
  800911:	48 89 c2             	mov    %rax,%rdx
  800914:	8b 7d cc             	mov    -0x34(%rbp),%edi
  800917:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  80091a:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
  80091e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800922:	41 89 f9             	mov    %edi,%r9d
  800925:	48 89 c7             	mov    %rax,%rdi
  800928:	48 b8 d2 08 80 00 00 	movabs $0x8008d2,%rax
  80092f:	00 00 00 
  800932:	ff d0                	callq  *%rax
  800934:	eb 1e                	jmp    800954 <printnum+0x82>
  800936:	eb 12                	jmp    80094a <printnum+0x78>
  800938:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80093c:	8b 55 cc             	mov    -0x34(%rbp),%edx
  80093f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800943:	48 89 ce             	mov    %rcx,%rsi
  800946:	89 d7                	mov    %edx,%edi
  800948:	ff d0                	callq  *%rax
  80094a:	83 6d d0 01          	subl   $0x1,-0x30(%rbp)
  80094e:	83 7d d0 00          	cmpl   $0x0,-0x30(%rbp)
  800952:	7f e4                	jg     800938 <printnum+0x66>
  800954:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  800957:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80095b:	ba 00 00 00 00       	mov    $0x0,%edx
  800960:	48 f7 f1             	div    %rcx
  800963:	48 89 d0             	mov    %rdx,%rax
  800966:	48 ba 90 4d 80 00 00 	movabs $0x804d90,%rdx
  80096d:	00 00 00 
  800970:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
  800974:	0f be d0             	movsbl %al,%edx
  800977:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80097b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80097f:	48 89 ce             	mov    %rcx,%rsi
  800982:	89 d7                	mov    %edx,%edi
  800984:	ff d0                	callq  *%rax
  800986:	48 83 c4 38          	add    $0x38,%rsp
  80098a:	5b                   	pop    %rbx
  80098b:	5d                   	pop    %rbp
  80098c:	c3                   	retq   

000000000080098d <getuint>:
  80098d:	55                   	push   %rbp
  80098e:	48 89 e5             	mov    %rsp,%rbp
  800991:	48 83 ec 1c          	sub    $0x1c,%rsp
  800995:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800999:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80099c:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8009a0:	7e 52                	jle    8009f4 <getuint+0x67>
  8009a2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009a6:	8b 00                	mov    (%rax),%eax
  8009a8:	83 f8 30             	cmp    $0x30,%eax
  8009ab:	73 24                	jae    8009d1 <getuint+0x44>
  8009ad:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009b1:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8009b5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009b9:	8b 00                	mov    (%rax),%eax
  8009bb:	89 c0                	mov    %eax,%eax
  8009bd:	48 01 d0             	add    %rdx,%rax
  8009c0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009c4:	8b 12                	mov    (%rdx),%edx
  8009c6:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8009c9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009cd:	89 0a                	mov    %ecx,(%rdx)
  8009cf:	eb 17                	jmp    8009e8 <getuint+0x5b>
  8009d1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009d5:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8009d9:	48 89 d0             	mov    %rdx,%rax
  8009dc:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8009e0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009e4:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8009e8:	48 8b 00             	mov    (%rax),%rax
  8009eb:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8009ef:	e9 a3 00 00 00       	jmpq   800a97 <getuint+0x10a>
  8009f4:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  8009f8:	74 4f                	je     800a49 <getuint+0xbc>
  8009fa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009fe:	8b 00                	mov    (%rax),%eax
  800a00:	83 f8 30             	cmp    $0x30,%eax
  800a03:	73 24                	jae    800a29 <getuint+0x9c>
  800a05:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a09:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800a0d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a11:	8b 00                	mov    (%rax),%eax
  800a13:	89 c0                	mov    %eax,%eax
  800a15:	48 01 d0             	add    %rdx,%rax
  800a18:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a1c:	8b 12                	mov    (%rdx),%edx
  800a1e:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800a21:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a25:	89 0a                	mov    %ecx,(%rdx)
  800a27:	eb 17                	jmp    800a40 <getuint+0xb3>
  800a29:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a2d:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800a31:	48 89 d0             	mov    %rdx,%rax
  800a34:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800a38:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a3c:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800a40:	48 8b 00             	mov    (%rax),%rax
  800a43:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800a47:	eb 4e                	jmp    800a97 <getuint+0x10a>
  800a49:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a4d:	8b 00                	mov    (%rax),%eax
  800a4f:	83 f8 30             	cmp    $0x30,%eax
  800a52:	73 24                	jae    800a78 <getuint+0xeb>
  800a54:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a58:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800a5c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a60:	8b 00                	mov    (%rax),%eax
  800a62:	89 c0                	mov    %eax,%eax
  800a64:	48 01 d0             	add    %rdx,%rax
  800a67:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a6b:	8b 12                	mov    (%rdx),%edx
  800a6d:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800a70:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a74:	89 0a                	mov    %ecx,(%rdx)
  800a76:	eb 17                	jmp    800a8f <getuint+0x102>
  800a78:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a7c:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800a80:	48 89 d0             	mov    %rdx,%rax
  800a83:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800a87:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a8b:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800a8f:	8b 00                	mov    (%rax),%eax
  800a91:	89 c0                	mov    %eax,%eax
  800a93:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800a97:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800a9b:	c9                   	leaveq 
  800a9c:	c3                   	retq   

0000000000800a9d <getint>:
  800a9d:	55                   	push   %rbp
  800a9e:	48 89 e5             	mov    %rsp,%rbp
  800aa1:	48 83 ec 1c          	sub    $0x1c,%rsp
  800aa5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800aa9:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800aac:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800ab0:	7e 52                	jle    800b04 <getint+0x67>
  800ab2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ab6:	8b 00                	mov    (%rax),%eax
  800ab8:	83 f8 30             	cmp    $0x30,%eax
  800abb:	73 24                	jae    800ae1 <getint+0x44>
  800abd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ac1:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800ac5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ac9:	8b 00                	mov    (%rax),%eax
  800acb:	89 c0                	mov    %eax,%eax
  800acd:	48 01 d0             	add    %rdx,%rax
  800ad0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800ad4:	8b 12                	mov    (%rdx),%edx
  800ad6:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800ad9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800add:	89 0a                	mov    %ecx,(%rdx)
  800adf:	eb 17                	jmp    800af8 <getint+0x5b>
  800ae1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ae5:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800ae9:	48 89 d0             	mov    %rdx,%rax
  800aec:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800af0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800af4:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800af8:	48 8b 00             	mov    (%rax),%rax
  800afb:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800aff:	e9 a3 00 00 00       	jmpq   800ba7 <getint+0x10a>
  800b04:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800b08:	74 4f                	je     800b59 <getint+0xbc>
  800b0a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b0e:	8b 00                	mov    (%rax),%eax
  800b10:	83 f8 30             	cmp    $0x30,%eax
  800b13:	73 24                	jae    800b39 <getint+0x9c>
  800b15:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b19:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800b1d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b21:	8b 00                	mov    (%rax),%eax
  800b23:	89 c0                	mov    %eax,%eax
  800b25:	48 01 d0             	add    %rdx,%rax
  800b28:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b2c:	8b 12                	mov    (%rdx),%edx
  800b2e:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800b31:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b35:	89 0a                	mov    %ecx,(%rdx)
  800b37:	eb 17                	jmp    800b50 <getint+0xb3>
  800b39:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b3d:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800b41:	48 89 d0             	mov    %rdx,%rax
  800b44:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800b48:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b4c:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800b50:	48 8b 00             	mov    (%rax),%rax
  800b53:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800b57:	eb 4e                	jmp    800ba7 <getint+0x10a>
  800b59:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b5d:	8b 00                	mov    (%rax),%eax
  800b5f:	83 f8 30             	cmp    $0x30,%eax
  800b62:	73 24                	jae    800b88 <getint+0xeb>
  800b64:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b68:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800b6c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b70:	8b 00                	mov    (%rax),%eax
  800b72:	89 c0                	mov    %eax,%eax
  800b74:	48 01 d0             	add    %rdx,%rax
  800b77:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b7b:	8b 12                	mov    (%rdx),%edx
  800b7d:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800b80:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b84:	89 0a                	mov    %ecx,(%rdx)
  800b86:	eb 17                	jmp    800b9f <getint+0x102>
  800b88:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b8c:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800b90:	48 89 d0             	mov    %rdx,%rax
  800b93:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800b97:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b9b:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800b9f:	8b 00                	mov    (%rax),%eax
  800ba1:	48 98                	cltq   
  800ba3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800ba7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800bab:	c9                   	leaveq 
  800bac:	c3                   	retq   

0000000000800bad <vprintfmt>:
  800bad:	55                   	push   %rbp
  800bae:	48 89 e5             	mov    %rsp,%rbp
  800bb1:	41 54                	push   %r12
  800bb3:	53                   	push   %rbx
  800bb4:	48 83 ec 60          	sub    $0x60,%rsp
  800bb8:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  800bbc:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  800bc0:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800bc4:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  800bc8:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800bcc:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  800bd0:	48 8b 0a             	mov    (%rdx),%rcx
  800bd3:	48 89 08             	mov    %rcx,(%rax)
  800bd6:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800bda:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800bde:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800be2:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800be6:	eb 17                	jmp    800bff <vprintfmt+0x52>
  800be8:	85 db                	test   %ebx,%ebx
  800bea:	0f 84 cc 04 00 00    	je     8010bc <vprintfmt+0x50f>
  800bf0:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800bf4:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800bf8:	48 89 d6             	mov    %rdx,%rsi
  800bfb:	89 df                	mov    %ebx,%edi
  800bfd:	ff d0                	callq  *%rax
  800bff:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800c03:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800c07:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800c0b:	0f b6 00             	movzbl (%rax),%eax
  800c0e:	0f b6 d8             	movzbl %al,%ebx
  800c11:	83 fb 25             	cmp    $0x25,%ebx
  800c14:	75 d2                	jne    800be8 <vprintfmt+0x3b>
  800c16:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  800c1a:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  800c21:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800c28:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800c2f:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  800c36:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800c3a:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800c3e:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800c42:	0f b6 00             	movzbl (%rax),%eax
  800c45:	0f b6 d8             	movzbl %al,%ebx
  800c48:	8d 43 dd             	lea    -0x23(%rbx),%eax
  800c4b:	83 f8 55             	cmp    $0x55,%eax
  800c4e:	0f 87 34 04 00 00    	ja     801088 <vprintfmt+0x4db>
  800c54:	89 c0                	mov    %eax,%eax
  800c56:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800c5d:	00 
  800c5e:	48 b8 b8 4d 80 00 00 	movabs $0x804db8,%rax
  800c65:	00 00 00 
  800c68:	48 01 d0             	add    %rdx,%rax
  800c6b:	48 8b 00             	mov    (%rax),%rax
  800c6e:	ff e0                	jmpq   *%rax
  800c70:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  800c74:	eb c0                	jmp    800c36 <vprintfmt+0x89>
  800c76:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  800c7a:	eb ba                	jmp    800c36 <vprintfmt+0x89>
  800c7c:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  800c83:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800c86:	89 d0                	mov    %edx,%eax
  800c88:	c1 e0 02             	shl    $0x2,%eax
  800c8b:	01 d0                	add    %edx,%eax
  800c8d:	01 c0                	add    %eax,%eax
  800c8f:	01 d8                	add    %ebx,%eax
  800c91:	83 e8 30             	sub    $0x30,%eax
  800c94:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800c97:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800c9b:	0f b6 00             	movzbl (%rax),%eax
  800c9e:	0f be d8             	movsbl %al,%ebx
  800ca1:	83 fb 2f             	cmp    $0x2f,%ebx
  800ca4:	7e 0c                	jle    800cb2 <vprintfmt+0x105>
  800ca6:	83 fb 39             	cmp    $0x39,%ebx
  800ca9:	7f 07                	jg     800cb2 <vprintfmt+0x105>
  800cab:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  800cb0:	eb d1                	jmp    800c83 <vprintfmt+0xd6>
  800cb2:	eb 58                	jmp    800d0c <vprintfmt+0x15f>
  800cb4:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800cb7:	83 f8 30             	cmp    $0x30,%eax
  800cba:	73 17                	jae    800cd3 <vprintfmt+0x126>
  800cbc:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800cc0:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800cc3:	89 c0                	mov    %eax,%eax
  800cc5:	48 01 d0             	add    %rdx,%rax
  800cc8:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800ccb:	83 c2 08             	add    $0x8,%edx
  800cce:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800cd1:	eb 0f                	jmp    800ce2 <vprintfmt+0x135>
  800cd3:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800cd7:	48 89 d0             	mov    %rdx,%rax
  800cda:	48 83 c2 08          	add    $0x8,%rdx
  800cde:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800ce2:	8b 00                	mov    (%rax),%eax
  800ce4:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800ce7:	eb 23                	jmp    800d0c <vprintfmt+0x15f>
  800ce9:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800ced:	79 0c                	jns    800cfb <vprintfmt+0x14e>
  800cef:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  800cf6:	e9 3b ff ff ff       	jmpq   800c36 <vprintfmt+0x89>
  800cfb:	e9 36 ff ff ff       	jmpq   800c36 <vprintfmt+0x89>
  800d00:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  800d07:	e9 2a ff ff ff       	jmpq   800c36 <vprintfmt+0x89>
  800d0c:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800d10:	79 12                	jns    800d24 <vprintfmt+0x177>
  800d12:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800d15:	89 45 dc             	mov    %eax,-0x24(%rbp)
  800d18:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800d1f:	e9 12 ff ff ff       	jmpq   800c36 <vprintfmt+0x89>
  800d24:	e9 0d ff ff ff       	jmpq   800c36 <vprintfmt+0x89>
  800d29:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  800d2d:	e9 04 ff ff ff       	jmpq   800c36 <vprintfmt+0x89>
  800d32:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800d35:	83 f8 30             	cmp    $0x30,%eax
  800d38:	73 17                	jae    800d51 <vprintfmt+0x1a4>
  800d3a:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800d3e:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800d41:	89 c0                	mov    %eax,%eax
  800d43:	48 01 d0             	add    %rdx,%rax
  800d46:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800d49:	83 c2 08             	add    $0x8,%edx
  800d4c:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800d4f:	eb 0f                	jmp    800d60 <vprintfmt+0x1b3>
  800d51:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800d55:	48 89 d0             	mov    %rdx,%rax
  800d58:	48 83 c2 08          	add    $0x8,%rdx
  800d5c:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800d60:	8b 10                	mov    (%rax),%edx
  800d62:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800d66:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d6a:	48 89 ce             	mov    %rcx,%rsi
  800d6d:	89 d7                	mov    %edx,%edi
  800d6f:	ff d0                	callq  *%rax
  800d71:	e9 40 03 00 00       	jmpq   8010b6 <vprintfmt+0x509>
  800d76:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800d79:	83 f8 30             	cmp    $0x30,%eax
  800d7c:	73 17                	jae    800d95 <vprintfmt+0x1e8>
  800d7e:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800d82:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800d85:	89 c0                	mov    %eax,%eax
  800d87:	48 01 d0             	add    %rdx,%rax
  800d8a:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800d8d:	83 c2 08             	add    $0x8,%edx
  800d90:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800d93:	eb 0f                	jmp    800da4 <vprintfmt+0x1f7>
  800d95:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800d99:	48 89 d0             	mov    %rdx,%rax
  800d9c:	48 83 c2 08          	add    $0x8,%rdx
  800da0:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800da4:	8b 18                	mov    (%rax),%ebx
  800da6:	85 db                	test   %ebx,%ebx
  800da8:	79 02                	jns    800dac <vprintfmt+0x1ff>
  800daa:	f7 db                	neg    %ebx
  800dac:	83 fb 15             	cmp    $0x15,%ebx
  800daf:	7f 16                	jg     800dc7 <vprintfmt+0x21a>
  800db1:	48 b8 e0 4c 80 00 00 	movabs $0x804ce0,%rax
  800db8:	00 00 00 
  800dbb:	48 63 d3             	movslq %ebx,%rdx
  800dbe:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800dc2:	4d 85 e4             	test   %r12,%r12
  800dc5:	75 2e                	jne    800df5 <vprintfmt+0x248>
  800dc7:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800dcb:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800dcf:	89 d9                	mov    %ebx,%ecx
  800dd1:	48 ba a1 4d 80 00 00 	movabs $0x804da1,%rdx
  800dd8:	00 00 00 
  800ddb:	48 89 c7             	mov    %rax,%rdi
  800dde:	b8 00 00 00 00       	mov    $0x0,%eax
  800de3:	49 b8 c5 10 80 00 00 	movabs $0x8010c5,%r8
  800dea:	00 00 00 
  800ded:	41 ff d0             	callq  *%r8
  800df0:	e9 c1 02 00 00       	jmpq   8010b6 <vprintfmt+0x509>
  800df5:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800df9:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800dfd:	4c 89 e1             	mov    %r12,%rcx
  800e00:	48 ba aa 4d 80 00 00 	movabs $0x804daa,%rdx
  800e07:	00 00 00 
  800e0a:	48 89 c7             	mov    %rax,%rdi
  800e0d:	b8 00 00 00 00       	mov    $0x0,%eax
  800e12:	49 b8 c5 10 80 00 00 	movabs $0x8010c5,%r8
  800e19:	00 00 00 
  800e1c:	41 ff d0             	callq  *%r8
  800e1f:	e9 92 02 00 00       	jmpq   8010b6 <vprintfmt+0x509>
  800e24:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800e27:	83 f8 30             	cmp    $0x30,%eax
  800e2a:	73 17                	jae    800e43 <vprintfmt+0x296>
  800e2c:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800e30:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800e33:	89 c0                	mov    %eax,%eax
  800e35:	48 01 d0             	add    %rdx,%rax
  800e38:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800e3b:	83 c2 08             	add    $0x8,%edx
  800e3e:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800e41:	eb 0f                	jmp    800e52 <vprintfmt+0x2a5>
  800e43:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800e47:	48 89 d0             	mov    %rdx,%rax
  800e4a:	48 83 c2 08          	add    $0x8,%rdx
  800e4e:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800e52:	4c 8b 20             	mov    (%rax),%r12
  800e55:	4d 85 e4             	test   %r12,%r12
  800e58:	75 0a                	jne    800e64 <vprintfmt+0x2b7>
  800e5a:	49 bc ad 4d 80 00 00 	movabs $0x804dad,%r12
  800e61:	00 00 00 
  800e64:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800e68:	7e 3f                	jle    800ea9 <vprintfmt+0x2fc>
  800e6a:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  800e6e:	74 39                	je     800ea9 <vprintfmt+0x2fc>
  800e70:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800e73:	48 98                	cltq   
  800e75:	48 89 c6             	mov    %rax,%rsi
  800e78:	4c 89 e7             	mov    %r12,%rdi
  800e7b:	48 b8 71 13 80 00 00 	movabs $0x801371,%rax
  800e82:	00 00 00 
  800e85:	ff d0                	callq  *%rax
  800e87:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800e8a:	eb 17                	jmp    800ea3 <vprintfmt+0x2f6>
  800e8c:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800e90:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800e94:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e98:	48 89 ce             	mov    %rcx,%rsi
  800e9b:	89 d7                	mov    %edx,%edi
  800e9d:	ff d0                	callq  *%rax
  800e9f:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800ea3:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800ea7:	7f e3                	jg     800e8c <vprintfmt+0x2df>
  800ea9:	eb 37                	jmp    800ee2 <vprintfmt+0x335>
  800eab:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  800eaf:	74 1e                	je     800ecf <vprintfmt+0x322>
  800eb1:	83 fb 1f             	cmp    $0x1f,%ebx
  800eb4:	7e 05                	jle    800ebb <vprintfmt+0x30e>
  800eb6:	83 fb 7e             	cmp    $0x7e,%ebx
  800eb9:	7e 14                	jle    800ecf <vprintfmt+0x322>
  800ebb:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800ebf:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ec3:	48 89 d6             	mov    %rdx,%rsi
  800ec6:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800ecb:	ff d0                	callq  *%rax
  800ecd:	eb 0f                	jmp    800ede <vprintfmt+0x331>
  800ecf:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800ed3:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ed7:	48 89 d6             	mov    %rdx,%rsi
  800eda:	89 df                	mov    %ebx,%edi
  800edc:	ff d0                	callq  *%rax
  800ede:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800ee2:	4c 89 e0             	mov    %r12,%rax
  800ee5:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800ee9:	0f b6 00             	movzbl (%rax),%eax
  800eec:	0f be d8             	movsbl %al,%ebx
  800eef:	85 db                	test   %ebx,%ebx
  800ef1:	74 10                	je     800f03 <vprintfmt+0x356>
  800ef3:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800ef7:	78 b2                	js     800eab <vprintfmt+0x2fe>
  800ef9:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800efd:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800f01:	79 a8                	jns    800eab <vprintfmt+0x2fe>
  800f03:	eb 16                	jmp    800f1b <vprintfmt+0x36e>
  800f05:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800f09:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800f0d:	48 89 d6             	mov    %rdx,%rsi
  800f10:	bf 20 00 00 00       	mov    $0x20,%edi
  800f15:	ff d0                	callq  *%rax
  800f17:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800f1b:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800f1f:	7f e4                	jg     800f05 <vprintfmt+0x358>
  800f21:	e9 90 01 00 00       	jmpq   8010b6 <vprintfmt+0x509>
  800f26:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800f2a:	be 03 00 00 00       	mov    $0x3,%esi
  800f2f:	48 89 c7             	mov    %rax,%rdi
  800f32:	48 b8 9d 0a 80 00 00 	movabs $0x800a9d,%rax
  800f39:	00 00 00 
  800f3c:	ff d0                	callq  *%rax
  800f3e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800f42:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f46:	48 85 c0             	test   %rax,%rax
  800f49:	79 1d                	jns    800f68 <vprintfmt+0x3bb>
  800f4b:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800f4f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800f53:	48 89 d6             	mov    %rdx,%rsi
  800f56:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800f5b:	ff d0                	callq  *%rax
  800f5d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f61:	48 f7 d8             	neg    %rax
  800f64:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800f68:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800f6f:	e9 d5 00 00 00       	jmpq   801049 <vprintfmt+0x49c>
  800f74:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800f78:	be 03 00 00 00       	mov    $0x3,%esi
  800f7d:	48 89 c7             	mov    %rax,%rdi
  800f80:	48 b8 8d 09 80 00 00 	movabs $0x80098d,%rax
  800f87:	00 00 00 
  800f8a:	ff d0                	callq  *%rax
  800f8c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800f90:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800f97:	e9 ad 00 00 00       	jmpq   801049 <vprintfmt+0x49c>
  800f9c:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800fa0:	be 03 00 00 00       	mov    $0x3,%esi
  800fa5:	48 89 c7             	mov    %rax,%rdi
  800fa8:	48 b8 8d 09 80 00 00 	movabs $0x80098d,%rax
  800faf:	00 00 00 
  800fb2:	ff d0                	callq  *%rax
  800fb4:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800fb8:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800fbf:	e9 85 00 00 00       	jmpq   801049 <vprintfmt+0x49c>
  800fc4:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800fc8:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800fcc:	48 89 d6             	mov    %rdx,%rsi
  800fcf:	bf 30 00 00 00       	mov    $0x30,%edi
  800fd4:	ff d0                	callq  *%rax
  800fd6:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800fda:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800fde:	48 89 d6             	mov    %rdx,%rsi
  800fe1:	bf 78 00 00 00       	mov    $0x78,%edi
  800fe6:	ff d0                	callq  *%rax
  800fe8:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800feb:	83 f8 30             	cmp    $0x30,%eax
  800fee:	73 17                	jae    801007 <vprintfmt+0x45a>
  800ff0:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800ff4:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800ff7:	89 c0                	mov    %eax,%eax
  800ff9:	48 01 d0             	add    %rdx,%rax
  800ffc:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800fff:	83 c2 08             	add    $0x8,%edx
  801002:	89 55 b8             	mov    %edx,-0x48(%rbp)
  801005:	eb 0f                	jmp    801016 <vprintfmt+0x469>
  801007:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  80100b:	48 89 d0             	mov    %rdx,%rax
  80100e:	48 83 c2 08          	add    $0x8,%rdx
  801012:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  801016:	48 8b 00             	mov    (%rax),%rax
  801019:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80101d:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  801024:	eb 23                	jmp    801049 <vprintfmt+0x49c>
  801026:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  80102a:	be 03 00 00 00       	mov    $0x3,%esi
  80102f:	48 89 c7             	mov    %rax,%rdi
  801032:	48 b8 8d 09 80 00 00 	movabs $0x80098d,%rax
  801039:	00 00 00 
  80103c:	ff d0                	callq  *%rax
  80103e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801042:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  801049:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  80104e:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  801051:	8b 7d dc             	mov    -0x24(%rbp),%edi
  801054:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801058:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  80105c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801060:	45 89 c1             	mov    %r8d,%r9d
  801063:	41 89 f8             	mov    %edi,%r8d
  801066:	48 89 c7             	mov    %rax,%rdi
  801069:	48 b8 d2 08 80 00 00 	movabs $0x8008d2,%rax
  801070:	00 00 00 
  801073:	ff d0                	callq  *%rax
  801075:	eb 3f                	jmp    8010b6 <vprintfmt+0x509>
  801077:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  80107b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80107f:	48 89 d6             	mov    %rdx,%rsi
  801082:	89 df                	mov    %ebx,%edi
  801084:	ff d0                	callq  *%rax
  801086:	eb 2e                	jmp    8010b6 <vprintfmt+0x509>
  801088:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  80108c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801090:	48 89 d6             	mov    %rdx,%rsi
  801093:	bf 25 00 00 00       	mov    $0x25,%edi
  801098:	ff d0                	callq  *%rax
  80109a:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  80109f:	eb 05                	jmp    8010a6 <vprintfmt+0x4f9>
  8010a1:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  8010a6:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8010aa:	48 83 e8 01          	sub    $0x1,%rax
  8010ae:	0f b6 00             	movzbl (%rax),%eax
  8010b1:	3c 25                	cmp    $0x25,%al
  8010b3:	75 ec                	jne    8010a1 <vprintfmt+0x4f4>
  8010b5:	90                   	nop
  8010b6:	90                   	nop
  8010b7:	e9 43 fb ff ff       	jmpq   800bff <vprintfmt+0x52>
  8010bc:	48 83 c4 60          	add    $0x60,%rsp
  8010c0:	5b                   	pop    %rbx
  8010c1:	41 5c                	pop    %r12
  8010c3:	5d                   	pop    %rbp
  8010c4:	c3                   	retq   

00000000008010c5 <printfmt>:
  8010c5:	55                   	push   %rbp
  8010c6:	48 89 e5             	mov    %rsp,%rbp
  8010c9:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  8010d0:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  8010d7:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  8010de:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8010e5:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8010ec:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8010f3:	84 c0                	test   %al,%al
  8010f5:	74 20                	je     801117 <printfmt+0x52>
  8010f7:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8010fb:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8010ff:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  801103:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  801107:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  80110b:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  80110f:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  801113:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  801117:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  80111e:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  801125:	00 00 00 
  801128:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  80112f:	00 00 00 
  801132:	48 8d 45 10          	lea    0x10(%rbp),%rax
  801136:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  80113d:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  801144:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  80114b:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  801152:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  801159:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  801160:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  801167:	48 89 c7             	mov    %rax,%rdi
  80116a:	48 b8 ad 0b 80 00 00 	movabs $0x800bad,%rax
  801171:	00 00 00 
  801174:	ff d0                	callq  *%rax
  801176:	c9                   	leaveq 
  801177:	c3                   	retq   

0000000000801178 <sprintputch>:
  801178:	55                   	push   %rbp
  801179:	48 89 e5             	mov    %rsp,%rbp
  80117c:	48 83 ec 10          	sub    $0x10,%rsp
  801180:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801183:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801187:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80118b:	8b 40 10             	mov    0x10(%rax),%eax
  80118e:	8d 50 01             	lea    0x1(%rax),%edx
  801191:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801195:	89 50 10             	mov    %edx,0x10(%rax)
  801198:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80119c:	48 8b 10             	mov    (%rax),%rdx
  80119f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8011a3:	48 8b 40 08          	mov    0x8(%rax),%rax
  8011a7:	48 39 c2             	cmp    %rax,%rdx
  8011aa:	73 17                	jae    8011c3 <sprintputch+0x4b>
  8011ac:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8011b0:	48 8b 00             	mov    (%rax),%rax
  8011b3:	48 8d 48 01          	lea    0x1(%rax),%rcx
  8011b7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8011bb:	48 89 0a             	mov    %rcx,(%rdx)
  8011be:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8011c1:	88 10                	mov    %dl,(%rax)
  8011c3:	c9                   	leaveq 
  8011c4:	c3                   	retq   

00000000008011c5 <vsnprintf>:
  8011c5:	55                   	push   %rbp
  8011c6:	48 89 e5             	mov    %rsp,%rbp
  8011c9:	48 83 ec 50          	sub    $0x50,%rsp
  8011cd:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  8011d1:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  8011d4:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  8011d8:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  8011dc:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  8011e0:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  8011e4:	48 8b 0a             	mov    (%rdx),%rcx
  8011e7:	48 89 08             	mov    %rcx,(%rax)
  8011ea:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8011ee:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8011f2:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8011f6:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8011fa:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8011fe:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  801202:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  801205:	48 98                	cltq   
  801207:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80120b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80120f:	48 01 d0             	add    %rdx,%rax
  801212:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  801216:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  80121d:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  801222:	74 06                	je     80122a <vsnprintf+0x65>
  801224:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  801228:	7f 07                	jg     801231 <vsnprintf+0x6c>
  80122a:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80122f:	eb 2f                	jmp    801260 <vsnprintf+0x9b>
  801231:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  801235:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  801239:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  80123d:	48 89 c6             	mov    %rax,%rsi
  801240:	48 bf 78 11 80 00 00 	movabs $0x801178,%rdi
  801247:	00 00 00 
  80124a:	48 b8 ad 0b 80 00 00 	movabs $0x800bad,%rax
  801251:	00 00 00 
  801254:	ff d0                	callq  *%rax
  801256:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80125a:	c6 00 00             	movb   $0x0,(%rax)
  80125d:	8b 45 e0             	mov    -0x20(%rbp),%eax
  801260:	c9                   	leaveq 
  801261:	c3                   	retq   

0000000000801262 <snprintf>:
  801262:	55                   	push   %rbp
  801263:	48 89 e5             	mov    %rsp,%rbp
  801266:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  80126d:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  801274:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  80127a:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  801281:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  801288:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  80128f:	84 c0                	test   %al,%al
  801291:	74 20                	je     8012b3 <snprintf+0x51>
  801293:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  801297:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80129b:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  80129f:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8012a3:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8012a7:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8012ab:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8012af:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8012b3:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  8012ba:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  8012c1:	00 00 00 
  8012c4:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8012cb:	00 00 00 
  8012ce:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8012d2:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8012d9:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8012e0:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8012e7:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  8012ee:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8012f5:	48 8b 0a             	mov    (%rdx),%rcx
  8012f8:	48 89 08             	mov    %rcx,(%rax)
  8012fb:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8012ff:	48 89 48 08          	mov    %rcx,0x8(%rax)
  801303:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801307:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80130b:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  801312:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  801319:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  80131f:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  801326:	48 89 c7             	mov    %rax,%rdi
  801329:	48 b8 c5 11 80 00 00 	movabs $0x8011c5,%rax
  801330:	00 00 00 
  801333:	ff d0                	callq  *%rax
  801335:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  80133b:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  801341:	c9                   	leaveq 
  801342:	c3                   	retq   

0000000000801343 <strlen>:
  801343:	55                   	push   %rbp
  801344:	48 89 e5             	mov    %rsp,%rbp
  801347:	48 83 ec 18          	sub    $0x18,%rsp
  80134b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80134f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801356:	eb 09                	jmp    801361 <strlen+0x1e>
  801358:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80135c:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801361:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801365:	0f b6 00             	movzbl (%rax),%eax
  801368:	84 c0                	test   %al,%al
  80136a:	75 ec                	jne    801358 <strlen+0x15>
  80136c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80136f:	c9                   	leaveq 
  801370:	c3                   	retq   

0000000000801371 <strnlen>:
  801371:	55                   	push   %rbp
  801372:	48 89 e5             	mov    %rsp,%rbp
  801375:	48 83 ec 20          	sub    $0x20,%rsp
  801379:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80137d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801381:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801388:	eb 0e                	jmp    801398 <strnlen+0x27>
  80138a:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80138e:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801393:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  801398:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80139d:	74 0b                	je     8013aa <strnlen+0x39>
  80139f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013a3:	0f b6 00             	movzbl (%rax),%eax
  8013a6:	84 c0                	test   %al,%al
  8013a8:	75 e0                	jne    80138a <strnlen+0x19>
  8013aa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8013ad:	c9                   	leaveq 
  8013ae:	c3                   	retq   

00000000008013af <strcpy>:
  8013af:	55                   	push   %rbp
  8013b0:	48 89 e5             	mov    %rsp,%rbp
  8013b3:	48 83 ec 20          	sub    $0x20,%rsp
  8013b7:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8013bb:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8013bf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013c3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8013c7:	90                   	nop
  8013c8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013cc:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8013d0:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8013d4:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8013d8:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8013dc:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8013e0:	0f b6 12             	movzbl (%rdx),%edx
  8013e3:	88 10                	mov    %dl,(%rax)
  8013e5:	0f b6 00             	movzbl (%rax),%eax
  8013e8:	84 c0                	test   %al,%al
  8013ea:	75 dc                	jne    8013c8 <strcpy+0x19>
  8013ec:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013f0:	c9                   	leaveq 
  8013f1:	c3                   	retq   

00000000008013f2 <strcat>:
  8013f2:	55                   	push   %rbp
  8013f3:	48 89 e5             	mov    %rsp,%rbp
  8013f6:	48 83 ec 20          	sub    $0x20,%rsp
  8013fa:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8013fe:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801402:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801406:	48 89 c7             	mov    %rax,%rdi
  801409:	48 b8 43 13 80 00 00 	movabs $0x801343,%rax
  801410:	00 00 00 
  801413:	ff d0                	callq  *%rax
  801415:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801418:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80141b:	48 63 d0             	movslq %eax,%rdx
  80141e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801422:	48 01 c2             	add    %rax,%rdx
  801425:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801429:	48 89 c6             	mov    %rax,%rsi
  80142c:	48 89 d7             	mov    %rdx,%rdi
  80142f:	48 b8 af 13 80 00 00 	movabs $0x8013af,%rax
  801436:	00 00 00 
  801439:	ff d0                	callq  *%rax
  80143b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80143f:	c9                   	leaveq 
  801440:	c3                   	retq   

0000000000801441 <strncpy>:
  801441:	55                   	push   %rbp
  801442:	48 89 e5             	mov    %rsp,%rbp
  801445:	48 83 ec 28          	sub    $0x28,%rsp
  801449:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80144d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801451:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801455:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801459:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80145d:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  801464:	00 
  801465:	eb 2a                	jmp    801491 <strncpy+0x50>
  801467:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80146b:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80146f:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801473:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801477:	0f b6 12             	movzbl (%rdx),%edx
  80147a:	88 10                	mov    %dl,(%rax)
  80147c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801480:	0f b6 00             	movzbl (%rax),%eax
  801483:	84 c0                	test   %al,%al
  801485:	74 05                	je     80148c <strncpy+0x4b>
  801487:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  80148c:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801491:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801495:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  801499:	72 cc                	jb     801467 <strncpy+0x26>
  80149b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80149f:	c9                   	leaveq 
  8014a0:	c3                   	retq   

00000000008014a1 <strlcpy>:
  8014a1:	55                   	push   %rbp
  8014a2:	48 89 e5             	mov    %rsp,%rbp
  8014a5:	48 83 ec 28          	sub    $0x28,%rsp
  8014a9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8014ad:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8014b1:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8014b5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014b9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8014bd:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8014c2:	74 3d                	je     801501 <strlcpy+0x60>
  8014c4:	eb 1d                	jmp    8014e3 <strlcpy+0x42>
  8014c6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014ca:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8014ce:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8014d2:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8014d6:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8014da:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8014de:	0f b6 12             	movzbl (%rdx),%edx
  8014e1:	88 10                	mov    %dl,(%rax)
  8014e3:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  8014e8:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8014ed:	74 0b                	je     8014fa <strlcpy+0x59>
  8014ef:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8014f3:	0f b6 00             	movzbl (%rax),%eax
  8014f6:	84 c0                	test   %al,%al
  8014f8:	75 cc                	jne    8014c6 <strlcpy+0x25>
  8014fa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014fe:	c6 00 00             	movb   $0x0,(%rax)
  801501:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801505:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801509:	48 29 c2             	sub    %rax,%rdx
  80150c:	48 89 d0             	mov    %rdx,%rax
  80150f:	c9                   	leaveq 
  801510:	c3                   	retq   

0000000000801511 <strcmp>:
  801511:	55                   	push   %rbp
  801512:	48 89 e5             	mov    %rsp,%rbp
  801515:	48 83 ec 10          	sub    $0x10,%rsp
  801519:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80151d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801521:	eb 0a                	jmp    80152d <strcmp+0x1c>
  801523:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801528:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  80152d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801531:	0f b6 00             	movzbl (%rax),%eax
  801534:	84 c0                	test   %al,%al
  801536:	74 12                	je     80154a <strcmp+0x39>
  801538:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80153c:	0f b6 10             	movzbl (%rax),%edx
  80153f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801543:	0f b6 00             	movzbl (%rax),%eax
  801546:	38 c2                	cmp    %al,%dl
  801548:	74 d9                	je     801523 <strcmp+0x12>
  80154a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80154e:	0f b6 00             	movzbl (%rax),%eax
  801551:	0f b6 d0             	movzbl %al,%edx
  801554:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801558:	0f b6 00             	movzbl (%rax),%eax
  80155b:	0f b6 c0             	movzbl %al,%eax
  80155e:	29 c2                	sub    %eax,%edx
  801560:	89 d0                	mov    %edx,%eax
  801562:	c9                   	leaveq 
  801563:	c3                   	retq   

0000000000801564 <strncmp>:
  801564:	55                   	push   %rbp
  801565:	48 89 e5             	mov    %rsp,%rbp
  801568:	48 83 ec 18          	sub    $0x18,%rsp
  80156c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801570:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801574:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801578:	eb 0f                	jmp    801589 <strncmp+0x25>
  80157a:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  80157f:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801584:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801589:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80158e:	74 1d                	je     8015ad <strncmp+0x49>
  801590:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801594:	0f b6 00             	movzbl (%rax),%eax
  801597:	84 c0                	test   %al,%al
  801599:	74 12                	je     8015ad <strncmp+0x49>
  80159b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80159f:	0f b6 10             	movzbl (%rax),%edx
  8015a2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015a6:	0f b6 00             	movzbl (%rax),%eax
  8015a9:	38 c2                	cmp    %al,%dl
  8015ab:	74 cd                	je     80157a <strncmp+0x16>
  8015ad:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8015b2:	75 07                	jne    8015bb <strncmp+0x57>
  8015b4:	b8 00 00 00 00       	mov    $0x0,%eax
  8015b9:	eb 18                	jmp    8015d3 <strncmp+0x6f>
  8015bb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015bf:	0f b6 00             	movzbl (%rax),%eax
  8015c2:	0f b6 d0             	movzbl %al,%edx
  8015c5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015c9:	0f b6 00             	movzbl (%rax),%eax
  8015cc:	0f b6 c0             	movzbl %al,%eax
  8015cf:	29 c2                	sub    %eax,%edx
  8015d1:	89 d0                	mov    %edx,%eax
  8015d3:	c9                   	leaveq 
  8015d4:	c3                   	retq   

00000000008015d5 <strchr>:
  8015d5:	55                   	push   %rbp
  8015d6:	48 89 e5             	mov    %rsp,%rbp
  8015d9:	48 83 ec 0c          	sub    $0xc,%rsp
  8015dd:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8015e1:	89 f0                	mov    %esi,%eax
  8015e3:	88 45 f4             	mov    %al,-0xc(%rbp)
  8015e6:	eb 17                	jmp    8015ff <strchr+0x2a>
  8015e8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015ec:	0f b6 00             	movzbl (%rax),%eax
  8015ef:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8015f2:	75 06                	jne    8015fa <strchr+0x25>
  8015f4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015f8:	eb 15                	jmp    80160f <strchr+0x3a>
  8015fa:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8015ff:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801603:	0f b6 00             	movzbl (%rax),%eax
  801606:	84 c0                	test   %al,%al
  801608:	75 de                	jne    8015e8 <strchr+0x13>
  80160a:	b8 00 00 00 00       	mov    $0x0,%eax
  80160f:	c9                   	leaveq 
  801610:	c3                   	retq   

0000000000801611 <strfind>:
  801611:	55                   	push   %rbp
  801612:	48 89 e5             	mov    %rsp,%rbp
  801615:	48 83 ec 0c          	sub    $0xc,%rsp
  801619:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80161d:	89 f0                	mov    %esi,%eax
  80161f:	88 45 f4             	mov    %al,-0xc(%rbp)
  801622:	eb 13                	jmp    801637 <strfind+0x26>
  801624:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801628:	0f b6 00             	movzbl (%rax),%eax
  80162b:	3a 45 f4             	cmp    -0xc(%rbp),%al
  80162e:	75 02                	jne    801632 <strfind+0x21>
  801630:	eb 10                	jmp    801642 <strfind+0x31>
  801632:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801637:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80163b:	0f b6 00             	movzbl (%rax),%eax
  80163e:	84 c0                	test   %al,%al
  801640:	75 e2                	jne    801624 <strfind+0x13>
  801642:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801646:	c9                   	leaveq 
  801647:	c3                   	retq   

0000000000801648 <memset>:
  801648:	55                   	push   %rbp
  801649:	48 89 e5             	mov    %rsp,%rbp
  80164c:	48 83 ec 18          	sub    $0x18,%rsp
  801650:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801654:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801657:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80165b:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801660:	75 06                	jne    801668 <memset+0x20>
  801662:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801666:	eb 69                	jmp    8016d1 <memset+0x89>
  801668:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80166c:	83 e0 03             	and    $0x3,%eax
  80166f:	48 85 c0             	test   %rax,%rax
  801672:	75 48                	jne    8016bc <memset+0x74>
  801674:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801678:	83 e0 03             	and    $0x3,%eax
  80167b:	48 85 c0             	test   %rax,%rax
  80167e:	75 3c                	jne    8016bc <memset+0x74>
  801680:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  801687:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80168a:	c1 e0 18             	shl    $0x18,%eax
  80168d:	89 c2                	mov    %eax,%edx
  80168f:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801692:	c1 e0 10             	shl    $0x10,%eax
  801695:	09 c2                	or     %eax,%edx
  801697:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80169a:	c1 e0 08             	shl    $0x8,%eax
  80169d:	09 d0                	or     %edx,%eax
  80169f:	09 45 f4             	or     %eax,-0xc(%rbp)
  8016a2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8016a6:	48 c1 e8 02          	shr    $0x2,%rax
  8016aa:	48 89 c1             	mov    %rax,%rcx
  8016ad:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8016b1:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8016b4:	48 89 d7             	mov    %rdx,%rdi
  8016b7:	fc                   	cld    
  8016b8:	f3 ab                	rep stos %eax,%es:(%rdi)
  8016ba:	eb 11                	jmp    8016cd <memset+0x85>
  8016bc:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8016c0:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8016c3:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8016c7:	48 89 d7             	mov    %rdx,%rdi
  8016ca:	fc                   	cld    
  8016cb:	f3 aa                	rep stos %al,%es:(%rdi)
  8016cd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016d1:	c9                   	leaveq 
  8016d2:	c3                   	retq   

00000000008016d3 <memmove>:
  8016d3:	55                   	push   %rbp
  8016d4:	48 89 e5             	mov    %rsp,%rbp
  8016d7:	48 83 ec 28          	sub    $0x28,%rsp
  8016db:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8016df:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8016e3:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8016e7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8016eb:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8016ef:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8016f3:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8016f7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016fb:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8016ff:	0f 83 88 00 00 00    	jae    80178d <memmove+0xba>
  801705:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801709:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80170d:	48 01 d0             	add    %rdx,%rax
  801710:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801714:	76 77                	jbe    80178d <memmove+0xba>
  801716:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80171a:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  80171e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801722:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  801726:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80172a:	83 e0 03             	and    $0x3,%eax
  80172d:	48 85 c0             	test   %rax,%rax
  801730:	75 3b                	jne    80176d <memmove+0x9a>
  801732:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801736:	83 e0 03             	and    $0x3,%eax
  801739:	48 85 c0             	test   %rax,%rax
  80173c:	75 2f                	jne    80176d <memmove+0x9a>
  80173e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801742:	83 e0 03             	and    $0x3,%eax
  801745:	48 85 c0             	test   %rax,%rax
  801748:	75 23                	jne    80176d <memmove+0x9a>
  80174a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80174e:	48 83 e8 04          	sub    $0x4,%rax
  801752:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801756:	48 83 ea 04          	sub    $0x4,%rdx
  80175a:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  80175e:	48 c1 e9 02          	shr    $0x2,%rcx
  801762:	48 89 c7             	mov    %rax,%rdi
  801765:	48 89 d6             	mov    %rdx,%rsi
  801768:	fd                   	std    
  801769:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  80176b:	eb 1d                	jmp    80178a <memmove+0xb7>
  80176d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801771:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801775:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801779:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  80177d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801781:	48 89 d7             	mov    %rdx,%rdi
  801784:	48 89 c1             	mov    %rax,%rcx
  801787:	fd                   	std    
  801788:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  80178a:	fc                   	cld    
  80178b:	eb 57                	jmp    8017e4 <memmove+0x111>
  80178d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801791:	83 e0 03             	and    $0x3,%eax
  801794:	48 85 c0             	test   %rax,%rax
  801797:	75 36                	jne    8017cf <memmove+0xfc>
  801799:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80179d:	83 e0 03             	and    $0x3,%eax
  8017a0:	48 85 c0             	test   %rax,%rax
  8017a3:	75 2a                	jne    8017cf <memmove+0xfc>
  8017a5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017a9:	83 e0 03             	and    $0x3,%eax
  8017ac:	48 85 c0             	test   %rax,%rax
  8017af:	75 1e                	jne    8017cf <memmove+0xfc>
  8017b1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017b5:	48 c1 e8 02          	shr    $0x2,%rax
  8017b9:	48 89 c1             	mov    %rax,%rcx
  8017bc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017c0:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8017c4:	48 89 c7             	mov    %rax,%rdi
  8017c7:	48 89 d6             	mov    %rdx,%rsi
  8017ca:	fc                   	cld    
  8017cb:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  8017cd:	eb 15                	jmp    8017e4 <memmove+0x111>
  8017cf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017d3:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8017d7:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  8017db:	48 89 c7             	mov    %rax,%rdi
  8017de:	48 89 d6             	mov    %rdx,%rsi
  8017e1:	fc                   	cld    
  8017e2:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  8017e4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8017e8:	c9                   	leaveq 
  8017e9:	c3                   	retq   

00000000008017ea <memcpy>:
  8017ea:	55                   	push   %rbp
  8017eb:	48 89 e5             	mov    %rsp,%rbp
  8017ee:	48 83 ec 18          	sub    $0x18,%rsp
  8017f2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8017f6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8017fa:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8017fe:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801802:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  801806:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80180a:	48 89 ce             	mov    %rcx,%rsi
  80180d:	48 89 c7             	mov    %rax,%rdi
  801810:	48 b8 d3 16 80 00 00 	movabs $0x8016d3,%rax
  801817:	00 00 00 
  80181a:	ff d0                	callq  *%rax
  80181c:	c9                   	leaveq 
  80181d:	c3                   	retq   

000000000080181e <memcmp>:
  80181e:	55                   	push   %rbp
  80181f:	48 89 e5             	mov    %rsp,%rbp
  801822:	48 83 ec 28          	sub    $0x28,%rsp
  801826:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80182a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80182e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801832:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801836:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80183a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80183e:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801842:	eb 36                	jmp    80187a <memcmp+0x5c>
  801844:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801848:	0f b6 10             	movzbl (%rax),%edx
  80184b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80184f:	0f b6 00             	movzbl (%rax),%eax
  801852:	38 c2                	cmp    %al,%dl
  801854:	74 1a                	je     801870 <memcmp+0x52>
  801856:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80185a:	0f b6 00             	movzbl (%rax),%eax
  80185d:	0f b6 d0             	movzbl %al,%edx
  801860:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801864:	0f b6 00             	movzbl (%rax),%eax
  801867:	0f b6 c0             	movzbl %al,%eax
  80186a:	29 c2                	sub    %eax,%edx
  80186c:	89 d0                	mov    %edx,%eax
  80186e:	eb 20                	jmp    801890 <memcmp+0x72>
  801870:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801875:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  80187a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80187e:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801882:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801886:	48 85 c0             	test   %rax,%rax
  801889:	75 b9                	jne    801844 <memcmp+0x26>
  80188b:	b8 00 00 00 00       	mov    $0x0,%eax
  801890:	c9                   	leaveq 
  801891:	c3                   	retq   

0000000000801892 <memfind>:
  801892:	55                   	push   %rbp
  801893:	48 89 e5             	mov    %rsp,%rbp
  801896:	48 83 ec 28          	sub    $0x28,%rsp
  80189a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80189e:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8018a1:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8018a5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018a9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8018ad:	48 01 d0             	add    %rdx,%rax
  8018b0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8018b4:	eb 15                	jmp    8018cb <memfind+0x39>
  8018b6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8018ba:	0f b6 10             	movzbl (%rax),%edx
  8018bd:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8018c0:	38 c2                	cmp    %al,%dl
  8018c2:	75 02                	jne    8018c6 <memfind+0x34>
  8018c4:	eb 0f                	jmp    8018d5 <memfind+0x43>
  8018c6:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8018cb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8018cf:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  8018d3:	72 e1                	jb     8018b6 <memfind+0x24>
  8018d5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8018d9:	c9                   	leaveq 
  8018da:	c3                   	retq   

00000000008018db <strtol>:
  8018db:	55                   	push   %rbp
  8018dc:	48 89 e5             	mov    %rsp,%rbp
  8018df:	48 83 ec 34          	sub    $0x34,%rsp
  8018e3:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8018e7:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8018eb:	89 55 cc             	mov    %edx,-0x34(%rbp)
  8018ee:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8018f5:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  8018fc:	00 
  8018fd:	eb 05                	jmp    801904 <strtol+0x29>
  8018ff:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801904:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801908:	0f b6 00             	movzbl (%rax),%eax
  80190b:	3c 20                	cmp    $0x20,%al
  80190d:	74 f0                	je     8018ff <strtol+0x24>
  80190f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801913:	0f b6 00             	movzbl (%rax),%eax
  801916:	3c 09                	cmp    $0x9,%al
  801918:	74 e5                	je     8018ff <strtol+0x24>
  80191a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80191e:	0f b6 00             	movzbl (%rax),%eax
  801921:	3c 2b                	cmp    $0x2b,%al
  801923:	75 07                	jne    80192c <strtol+0x51>
  801925:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80192a:	eb 17                	jmp    801943 <strtol+0x68>
  80192c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801930:	0f b6 00             	movzbl (%rax),%eax
  801933:	3c 2d                	cmp    $0x2d,%al
  801935:	75 0c                	jne    801943 <strtol+0x68>
  801937:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80193c:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  801943:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801947:	74 06                	je     80194f <strtol+0x74>
  801949:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  80194d:	75 28                	jne    801977 <strtol+0x9c>
  80194f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801953:	0f b6 00             	movzbl (%rax),%eax
  801956:	3c 30                	cmp    $0x30,%al
  801958:	75 1d                	jne    801977 <strtol+0x9c>
  80195a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80195e:	48 83 c0 01          	add    $0x1,%rax
  801962:	0f b6 00             	movzbl (%rax),%eax
  801965:	3c 78                	cmp    $0x78,%al
  801967:	75 0e                	jne    801977 <strtol+0x9c>
  801969:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  80196e:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  801975:	eb 2c                	jmp    8019a3 <strtol+0xc8>
  801977:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  80197b:	75 19                	jne    801996 <strtol+0xbb>
  80197d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801981:	0f b6 00             	movzbl (%rax),%eax
  801984:	3c 30                	cmp    $0x30,%al
  801986:	75 0e                	jne    801996 <strtol+0xbb>
  801988:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80198d:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  801994:	eb 0d                	jmp    8019a3 <strtol+0xc8>
  801996:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  80199a:	75 07                	jne    8019a3 <strtol+0xc8>
  80199c:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  8019a3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019a7:	0f b6 00             	movzbl (%rax),%eax
  8019aa:	3c 2f                	cmp    $0x2f,%al
  8019ac:	7e 1d                	jle    8019cb <strtol+0xf0>
  8019ae:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019b2:	0f b6 00             	movzbl (%rax),%eax
  8019b5:	3c 39                	cmp    $0x39,%al
  8019b7:	7f 12                	jg     8019cb <strtol+0xf0>
  8019b9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019bd:	0f b6 00             	movzbl (%rax),%eax
  8019c0:	0f be c0             	movsbl %al,%eax
  8019c3:	83 e8 30             	sub    $0x30,%eax
  8019c6:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8019c9:	eb 4e                	jmp    801a19 <strtol+0x13e>
  8019cb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019cf:	0f b6 00             	movzbl (%rax),%eax
  8019d2:	3c 60                	cmp    $0x60,%al
  8019d4:	7e 1d                	jle    8019f3 <strtol+0x118>
  8019d6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019da:	0f b6 00             	movzbl (%rax),%eax
  8019dd:	3c 7a                	cmp    $0x7a,%al
  8019df:	7f 12                	jg     8019f3 <strtol+0x118>
  8019e1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019e5:	0f b6 00             	movzbl (%rax),%eax
  8019e8:	0f be c0             	movsbl %al,%eax
  8019eb:	83 e8 57             	sub    $0x57,%eax
  8019ee:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8019f1:	eb 26                	jmp    801a19 <strtol+0x13e>
  8019f3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019f7:	0f b6 00             	movzbl (%rax),%eax
  8019fa:	3c 40                	cmp    $0x40,%al
  8019fc:	7e 48                	jle    801a46 <strtol+0x16b>
  8019fe:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a02:	0f b6 00             	movzbl (%rax),%eax
  801a05:	3c 5a                	cmp    $0x5a,%al
  801a07:	7f 3d                	jg     801a46 <strtol+0x16b>
  801a09:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a0d:	0f b6 00             	movzbl (%rax),%eax
  801a10:	0f be c0             	movsbl %al,%eax
  801a13:	83 e8 37             	sub    $0x37,%eax
  801a16:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801a19:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801a1c:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  801a1f:	7c 02                	jl     801a23 <strtol+0x148>
  801a21:	eb 23                	jmp    801a46 <strtol+0x16b>
  801a23:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801a28:	8b 45 cc             	mov    -0x34(%rbp),%eax
  801a2b:	48 98                	cltq   
  801a2d:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  801a32:	48 89 c2             	mov    %rax,%rdx
  801a35:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801a38:	48 98                	cltq   
  801a3a:	48 01 d0             	add    %rdx,%rax
  801a3d:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801a41:	e9 5d ff ff ff       	jmpq   8019a3 <strtol+0xc8>
  801a46:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  801a4b:	74 0b                	je     801a58 <strtol+0x17d>
  801a4d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801a51:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801a55:	48 89 10             	mov    %rdx,(%rax)
  801a58:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801a5c:	74 09                	je     801a67 <strtol+0x18c>
  801a5e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801a62:	48 f7 d8             	neg    %rax
  801a65:	eb 04                	jmp    801a6b <strtol+0x190>
  801a67:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801a6b:	c9                   	leaveq 
  801a6c:	c3                   	retq   

0000000000801a6d <strstr>:
  801a6d:	55                   	push   %rbp
  801a6e:	48 89 e5             	mov    %rsp,%rbp
  801a71:	48 83 ec 30          	sub    $0x30,%rsp
  801a75:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801a79:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801a7d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801a81:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801a85:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801a89:	0f b6 00             	movzbl (%rax),%eax
  801a8c:	88 45 ff             	mov    %al,-0x1(%rbp)
  801a8f:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  801a93:	75 06                	jne    801a9b <strstr+0x2e>
  801a95:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a99:	eb 6b                	jmp    801b06 <strstr+0x99>
  801a9b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801a9f:	48 89 c7             	mov    %rax,%rdi
  801aa2:	48 b8 43 13 80 00 00 	movabs $0x801343,%rax
  801aa9:	00 00 00 
  801aac:	ff d0                	callq  *%rax
  801aae:	48 98                	cltq   
  801ab0:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801ab4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ab8:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801abc:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801ac0:	0f b6 00             	movzbl (%rax),%eax
  801ac3:	88 45 ef             	mov    %al,-0x11(%rbp)
  801ac6:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  801aca:	75 07                	jne    801ad3 <strstr+0x66>
  801acc:	b8 00 00 00 00       	mov    $0x0,%eax
  801ad1:	eb 33                	jmp    801b06 <strstr+0x99>
  801ad3:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  801ad7:	3a 45 ff             	cmp    -0x1(%rbp),%al
  801ada:	75 d8                	jne    801ab4 <strstr+0x47>
  801adc:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801ae0:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  801ae4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ae8:	48 89 ce             	mov    %rcx,%rsi
  801aeb:	48 89 c7             	mov    %rax,%rdi
  801aee:	48 b8 64 15 80 00 00 	movabs $0x801564,%rax
  801af5:	00 00 00 
  801af8:	ff d0                	callq  *%rax
  801afa:	85 c0                	test   %eax,%eax
  801afc:	75 b6                	jne    801ab4 <strstr+0x47>
  801afe:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801b02:	48 83 e8 01          	sub    $0x1,%rax
  801b06:	c9                   	leaveq 
  801b07:	c3                   	retq   

0000000000801b08 <syscall>:
  801b08:	55                   	push   %rbp
  801b09:	48 89 e5             	mov    %rsp,%rbp
  801b0c:	53                   	push   %rbx
  801b0d:	48 83 ec 48          	sub    $0x48,%rsp
  801b11:	89 7d dc             	mov    %edi,-0x24(%rbp)
  801b14:	89 75 d8             	mov    %esi,-0x28(%rbp)
  801b17:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801b1b:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  801b1f:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  801b23:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  801b27:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801b2a:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  801b2e:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  801b32:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  801b36:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  801b3a:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  801b3e:	4c 89 c3             	mov    %r8,%rbx
  801b41:	cd 30                	int    $0x30
  801b43:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801b47:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801b4b:	74 3e                	je     801b8b <syscall+0x83>
  801b4d:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801b52:	7e 37                	jle    801b8b <syscall+0x83>
  801b54:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801b58:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801b5b:	49 89 d0             	mov    %rdx,%r8
  801b5e:	89 c1                	mov    %eax,%ecx
  801b60:	48 ba 68 50 80 00 00 	movabs $0x805068,%rdx
  801b67:	00 00 00 
  801b6a:	be 24 00 00 00       	mov    $0x24,%esi
  801b6f:	48 bf 85 50 80 00 00 	movabs $0x805085,%rdi
  801b76:	00 00 00 
  801b79:	b8 00 00 00 00       	mov    $0x0,%eax
  801b7e:	49 b9 c1 05 80 00 00 	movabs $0x8005c1,%r9
  801b85:	00 00 00 
  801b88:	41 ff d1             	callq  *%r9
  801b8b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801b8f:	48 83 c4 48          	add    $0x48,%rsp
  801b93:	5b                   	pop    %rbx
  801b94:	5d                   	pop    %rbp
  801b95:	c3                   	retq   

0000000000801b96 <sys_cputs>:
  801b96:	55                   	push   %rbp
  801b97:	48 89 e5             	mov    %rsp,%rbp
  801b9a:	48 83 ec 20          	sub    $0x20,%rsp
  801b9e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801ba2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801ba6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801baa:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801bae:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801bb5:	00 
  801bb6:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801bbc:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801bc2:	48 89 d1             	mov    %rdx,%rcx
  801bc5:	48 89 c2             	mov    %rax,%rdx
  801bc8:	be 00 00 00 00       	mov    $0x0,%esi
  801bcd:	bf 00 00 00 00       	mov    $0x0,%edi
  801bd2:	48 b8 08 1b 80 00 00 	movabs $0x801b08,%rax
  801bd9:	00 00 00 
  801bdc:	ff d0                	callq  *%rax
  801bde:	c9                   	leaveq 
  801bdf:	c3                   	retq   

0000000000801be0 <sys_cgetc>:
  801be0:	55                   	push   %rbp
  801be1:	48 89 e5             	mov    %rsp,%rbp
  801be4:	48 83 ec 10          	sub    $0x10,%rsp
  801be8:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801bef:	00 
  801bf0:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801bf6:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801bfc:	b9 00 00 00 00       	mov    $0x0,%ecx
  801c01:	ba 00 00 00 00       	mov    $0x0,%edx
  801c06:	be 00 00 00 00       	mov    $0x0,%esi
  801c0b:	bf 01 00 00 00       	mov    $0x1,%edi
  801c10:	48 b8 08 1b 80 00 00 	movabs $0x801b08,%rax
  801c17:	00 00 00 
  801c1a:	ff d0                	callq  *%rax
  801c1c:	c9                   	leaveq 
  801c1d:	c3                   	retq   

0000000000801c1e <sys_env_destroy>:
  801c1e:	55                   	push   %rbp
  801c1f:	48 89 e5             	mov    %rsp,%rbp
  801c22:	48 83 ec 10          	sub    $0x10,%rsp
  801c26:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801c29:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c2c:	48 98                	cltq   
  801c2e:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c35:	00 
  801c36:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c3c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c42:	b9 00 00 00 00       	mov    $0x0,%ecx
  801c47:	48 89 c2             	mov    %rax,%rdx
  801c4a:	be 01 00 00 00       	mov    $0x1,%esi
  801c4f:	bf 03 00 00 00       	mov    $0x3,%edi
  801c54:	48 b8 08 1b 80 00 00 	movabs $0x801b08,%rax
  801c5b:	00 00 00 
  801c5e:	ff d0                	callq  *%rax
  801c60:	c9                   	leaveq 
  801c61:	c3                   	retq   

0000000000801c62 <sys_getenvid>:
  801c62:	55                   	push   %rbp
  801c63:	48 89 e5             	mov    %rsp,%rbp
  801c66:	48 83 ec 10          	sub    $0x10,%rsp
  801c6a:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c71:	00 
  801c72:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c78:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c7e:	b9 00 00 00 00       	mov    $0x0,%ecx
  801c83:	ba 00 00 00 00       	mov    $0x0,%edx
  801c88:	be 00 00 00 00       	mov    $0x0,%esi
  801c8d:	bf 02 00 00 00       	mov    $0x2,%edi
  801c92:	48 b8 08 1b 80 00 00 	movabs $0x801b08,%rax
  801c99:	00 00 00 
  801c9c:	ff d0                	callq  *%rax
  801c9e:	c9                   	leaveq 
  801c9f:	c3                   	retq   

0000000000801ca0 <sys_yield>:
  801ca0:	55                   	push   %rbp
  801ca1:	48 89 e5             	mov    %rsp,%rbp
  801ca4:	48 83 ec 10          	sub    $0x10,%rsp
  801ca8:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801caf:	00 
  801cb0:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801cb6:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801cbc:	b9 00 00 00 00       	mov    $0x0,%ecx
  801cc1:	ba 00 00 00 00       	mov    $0x0,%edx
  801cc6:	be 00 00 00 00       	mov    $0x0,%esi
  801ccb:	bf 0b 00 00 00       	mov    $0xb,%edi
  801cd0:	48 b8 08 1b 80 00 00 	movabs $0x801b08,%rax
  801cd7:	00 00 00 
  801cda:	ff d0                	callq  *%rax
  801cdc:	c9                   	leaveq 
  801cdd:	c3                   	retq   

0000000000801cde <sys_page_alloc>:
  801cde:	55                   	push   %rbp
  801cdf:	48 89 e5             	mov    %rsp,%rbp
  801ce2:	48 83 ec 20          	sub    $0x20,%rsp
  801ce6:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801ce9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801ced:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801cf0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801cf3:	48 63 c8             	movslq %eax,%rcx
  801cf6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801cfa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801cfd:	48 98                	cltq   
  801cff:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801d06:	00 
  801d07:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d0d:	49 89 c8             	mov    %rcx,%r8
  801d10:	48 89 d1             	mov    %rdx,%rcx
  801d13:	48 89 c2             	mov    %rax,%rdx
  801d16:	be 01 00 00 00       	mov    $0x1,%esi
  801d1b:	bf 04 00 00 00       	mov    $0x4,%edi
  801d20:	48 b8 08 1b 80 00 00 	movabs $0x801b08,%rax
  801d27:	00 00 00 
  801d2a:	ff d0                	callq  *%rax
  801d2c:	c9                   	leaveq 
  801d2d:	c3                   	retq   

0000000000801d2e <sys_page_map>:
  801d2e:	55                   	push   %rbp
  801d2f:	48 89 e5             	mov    %rsp,%rbp
  801d32:	48 83 ec 30          	sub    $0x30,%rsp
  801d36:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801d39:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d3d:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801d40:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801d44:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801d48:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801d4b:	48 63 c8             	movslq %eax,%rcx
  801d4e:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801d52:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801d55:	48 63 f0             	movslq %eax,%rsi
  801d58:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d5c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801d5f:	48 98                	cltq   
  801d61:	48 89 0c 24          	mov    %rcx,(%rsp)
  801d65:	49 89 f9             	mov    %rdi,%r9
  801d68:	49 89 f0             	mov    %rsi,%r8
  801d6b:	48 89 d1             	mov    %rdx,%rcx
  801d6e:	48 89 c2             	mov    %rax,%rdx
  801d71:	be 01 00 00 00       	mov    $0x1,%esi
  801d76:	bf 05 00 00 00       	mov    $0x5,%edi
  801d7b:	48 b8 08 1b 80 00 00 	movabs $0x801b08,%rax
  801d82:	00 00 00 
  801d85:	ff d0                	callq  *%rax
  801d87:	c9                   	leaveq 
  801d88:	c3                   	retq   

0000000000801d89 <sys_page_unmap>:
  801d89:	55                   	push   %rbp
  801d8a:	48 89 e5             	mov    %rsp,%rbp
  801d8d:	48 83 ec 20          	sub    $0x20,%rsp
  801d91:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801d94:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d98:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d9c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801d9f:	48 98                	cltq   
  801da1:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801da8:	00 
  801da9:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801daf:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801db5:	48 89 d1             	mov    %rdx,%rcx
  801db8:	48 89 c2             	mov    %rax,%rdx
  801dbb:	be 01 00 00 00       	mov    $0x1,%esi
  801dc0:	bf 06 00 00 00       	mov    $0x6,%edi
  801dc5:	48 b8 08 1b 80 00 00 	movabs $0x801b08,%rax
  801dcc:	00 00 00 
  801dcf:	ff d0                	callq  *%rax
  801dd1:	c9                   	leaveq 
  801dd2:	c3                   	retq   

0000000000801dd3 <sys_env_set_status>:
  801dd3:	55                   	push   %rbp
  801dd4:	48 89 e5             	mov    %rsp,%rbp
  801dd7:	48 83 ec 10          	sub    $0x10,%rsp
  801ddb:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801dde:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801de1:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801de4:	48 63 d0             	movslq %eax,%rdx
  801de7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801dea:	48 98                	cltq   
  801dec:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801df3:	00 
  801df4:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801dfa:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e00:	48 89 d1             	mov    %rdx,%rcx
  801e03:	48 89 c2             	mov    %rax,%rdx
  801e06:	be 01 00 00 00       	mov    $0x1,%esi
  801e0b:	bf 08 00 00 00       	mov    $0x8,%edi
  801e10:	48 b8 08 1b 80 00 00 	movabs $0x801b08,%rax
  801e17:	00 00 00 
  801e1a:	ff d0                	callq  *%rax
  801e1c:	c9                   	leaveq 
  801e1d:	c3                   	retq   

0000000000801e1e <sys_env_set_trapframe>:
  801e1e:	55                   	push   %rbp
  801e1f:	48 89 e5             	mov    %rsp,%rbp
  801e22:	48 83 ec 20          	sub    $0x20,%rsp
  801e26:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801e29:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801e2d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801e31:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e34:	48 98                	cltq   
  801e36:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801e3d:	00 
  801e3e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e44:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e4a:	48 89 d1             	mov    %rdx,%rcx
  801e4d:	48 89 c2             	mov    %rax,%rdx
  801e50:	be 01 00 00 00       	mov    $0x1,%esi
  801e55:	bf 09 00 00 00       	mov    $0x9,%edi
  801e5a:	48 b8 08 1b 80 00 00 	movabs $0x801b08,%rax
  801e61:	00 00 00 
  801e64:	ff d0                	callq  *%rax
  801e66:	c9                   	leaveq 
  801e67:	c3                   	retq   

0000000000801e68 <sys_env_set_pgfault_upcall>:
  801e68:	55                   	push   %rbp
  801e69:	48 89 e5             	mov    %rsp,%rbp
  801e6c:	48 83 ec 20          	sub    $0x20,%rsp
  801e70:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801e73:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801e77:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801e7b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e7e:	48 98                	cltq   
  801e80:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801e87:	00 
  801e88:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e8e:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e94:	48 89 d1             	mov    %rdx,%rcx
  801e97:	48 89 c2             	mov    %rax,%rdx
  801e9a:	be 01 00 00 00       	mov    $0x1,%esi
  801e9f:	bf 0a 00 00 00       	mov    $0xa,%edi
  801ea4:	48 b8 08 1b 80 00 00 	movabs $0x801b08,%rax
  801eab:	00 00 00 
  801eae:	ff d0                	callq  *%rax
  801eb0:	c9                   	leaveq 
  801eb1:	c3                   	retq   

0000000000801eb2 <sys_ipc_try_send>:
  801eb2:	55                   	push   %rbp
  801eb3:	48 89 e5             	mov    %rsp,%rbp
  801eb6:	48 83 ec 20          	sub    $0x20,%rsp
  801eba:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801ebd:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801ec1:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801ec5:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801ec8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801ecb:	48 63 f0             	movslq %eax,%rsi
  801ece:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801ed2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ed5:	48 98                	cltq   
  801ed7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801edb:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801ee2:	00 
  801ee3:	49 89 f1             	mov    %rsi,%r9
  801ee6:	49 89 c8             	mov    %rcx,%r8
  801ee9:	48 89 d1             	mov    %rdx,%rcx
  801eec:	48 89 c2             	mov    %rax,%rdx
  801eef:	be 00 00 00 00       	mov    $0x0,%esi
  801ef4:	bf 0c 00 00 00       	mov    $0xc,%edi
  801ef9:	48 b8 08 1b 80 00 00 	movabs $0x801b08,%rax
  801f00:	00 00 00 
  801f03:	ff d0                	callq  *%rax
  801f05:	c9                   	leaveq 
  801f06:	c3                   	retq   

0000000000801f07 <sys_ipc_recv>:
  801f07:	55                   	push   %rbp
  801f08:	48 89 e5             	mov    %rsp,%rbp
  801f0b:	48 83 ec 10          	sub    $0x10,%rsp
  801f0f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801f13:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801f17:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801f1e:	00 
  801f1f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801f25:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801f2b:	b9 00 00 00 00       	mov    $0x0,%ecx
  801f30:	48 89 c2             	mov    %rax,%rdx
  801f33:	be 01 00 00 00       	mov    $0x1,%esi
  801f38:	bf 0d 00 00 00       	mov    $0xd,%edi
  801f3d:	48 b8 08 1b 80 00 00 	movabs $0x801b08,%rax
  801f44:	00 00 00 
  801f47:	ff d0                	callq  *%rax
  801f49:	c9                   	leaveq 
  801f4a:	c3                   	retq   

0000000000801f4b <sys_time_msec>:
  801f4b:	55                   	push   %rbp
  801f4c:	48 89 e5             	mov    %rsp,%rbp
  801f4f:	48 83 ec 10          	sub    $0x10,%rsp
  801f53:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801f5a:	00 
  801f5b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801f61:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801f67:	b9 00 00 00 00       	mov    $0x0,%ecx
  801f6c:	ba 00 00 00 00       	mov    $0x0,%edx
  801f71:	be 00 00 00 00       	mov    $0x0,%esi
  801f76:	bf 0e 00 00 00       	mov    $0xe,%edi
  801f7b:	48 b8 08 1b 80 00 00 	movabs $0x801b08,%rax
  801f82:	00 00 00 
  801f85:	ff d0                	callq  *%rax
  801f87:	c9                   	leaveq 
  801f88:	c3                   	retq   

0000000000801f89 <sys_net_transmit>:
  801f89:	55                   	push   %rbp
  801f8a:	48 89 e5             	mov    %rsp,%rbp
  801f8d:	48 83 ec 20          	sub    $0x20,%rsp
  801f91:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801f95:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801f98:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801f9b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801f9f:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801fa6:	00 
  801fa7:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801fad:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801fb3:	48 89 d1             	mov    %rdx,%rcx
  801fb6:	48 89 c2             	mov    %rax,%rdx
  801fb9:	be 00 00 00 00       	mov    $0x0,%esi
  801fbe:	bf 0f 00 00 00       	mov    $0xf,%edi
  801fc3:	48 b8 08 1b 80 00 00 	movabs $0x801b08,%rax
  801fca:	00 00 00 
  801fcd:	ff d0                	callq  *%rax
  801fcf:	c9                   	leaveq 
  801fd0:	c3                   	retq   

0000000000801fd1 <sys_net_receive>:
  801fd1:	55                   	push   %rbp
  801fd2:	48 89 e5             	mov    %rsp,%rbp
  801fd5:	48 83 ec 20          	sub    $0x20,%rsp
  801fd9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801fdd:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801fe0:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801fe3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801fe7:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801fee:	00 
  801fef:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ff5:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ffb:	48 89 d1             	mov    %rdx,%rcx
  801ffe:	48 89 c2             	mov    %rax,%rdx
  802001:	be 00 00 00 00       	mov    $0x0,%esi
  802006:	bf 10 00 00 00       	mov    $0x10,%edi
  80200b:	48 b8 08 1b 80 00 00 	movabs $0x801b08,%rax
  802012:	00 00 00 
  802015:	ff d0                	callq  *%rax
  802017:	c9                   	leaveq 
  802018:	c3                   	retq   

0000000000802019 <sys_ept_map>:
  802019:	55                   	push   %rbp
  80201a:	48 89 e5             	mov    %rsp,%rbp
  80201d:	48 83 ec 30          	sub    $0x30,%rsp
  802021:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802024:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802028:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80202b:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  80202f:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  802033:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  802036:	48 63 c8             	movslq %eax,%rcx
  802039:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  80203d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802040:	48 63 f0             	movslq %eax,%rsi
  802043:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802047:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80204a:	48 98                	cltq   
  80204c:	48 89 0c 24          	mov    %rcx,(%rsp)
  802050:	49 89 f9             	mov    %rdi,%r9
  802053:	49 89 f0             	mov    %rsi,%r8
  802056:	48 89 d1             	mov    %rdx,%rcx
  802059:	48 89 c2             	mov    %rax,%rdx
  80205c:	be 00 00 00 00       	mov    $0x0,%esi
  802061:	bf 11 00 00 00       	mov    $0x11,%edi
  802066:	48 b8 08 1b 80 00 00 	movabs $0x801b08,%rax
  80206d:	00 00 00 
  802070:	ff d0                	callq  *%rax
  802072:	c9                   	leaveq 
  802073:	c3                   	retq   

0000000000802074 <sys_env_mkguest>:
  802074:	55                   	push   %rbp
  802075:	48 89 e5             	mov    %rsp,%rbp
  802078:	48 83 ec 20          	sub    $0x20,%rsp
  80207c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802080:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802084:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802088:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80208c:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802093:	00 
  802094:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80209a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8020a0:	48 89 d1             	mov    %rdx,%rcx
  8020a3:	48 89 c2             	mov    %rax,%rdx
  8020a6:	be 00 00 00 00       	mov    $0x0,%esi
  8020ab:	bf 12 00 00 00       	mov    $0x12,%edi
  8020b0:	48 b8 08 1b 80 00 00 	movabs $0x801b08,%rax
  8020b7:	00 00 00 
  8020ba:	ff d0                	callq  *%rax
  8020bc:	c9                   	leaveq 
  8020bd:	c3                   	retq   

00000000008020be <sys_vmx_list_vms>:
  8020be:	55                   	push   %rbp
  8020bf:	48 89 e5             	mov    %rsp,%rbp
  8020c2:	48 83 ec 10          	sub    $0x10,%rsp
  8020c6:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8020cd:	00 
  8020ce:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8020d4:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8020da:	b9 00 00 00 00       	mov    $0x0,%ecx
  8020df:	ba 00 00 00 00       	mov    $0x0,%edx
  8020e4:	be 00 00 00 00       	mov    $0x0,%esi
  8020e9:	bf 13 00 00 00       	mov    $0x13,%edi
  8020ee:	48 b8 08 1b 80 00 00 	movabs $0x801b08,%rax
  8020f5:	00 00 00 
  8020f8:	ff d0                	callq  *%rax
  8020fa:	c9                   	leaveq 
  8020fb:	c3                   	retq   

00000000008020fc <sys_vmx_sel_resume>:
  8020fc:	55                   	push   %rbp
  8020fd:	48 89 e5             	mov    %rsp,%rbp
  802100:	48 83 ec 10          	sub    $0x10,%rsp
  802104:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802107:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80210a:	48 98                	cltq   
  80210c:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802113:	00 
  802114:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80211a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802120:	b9 00 00 00 00       	mov    $0x0,%ecx
  802125:	48 89 c2             	mov    %rax,%rdx
  802128:	be 00 00 00 00       	mov    $0x0,%esi
  80212d:	bf 14 00 00 00       	mov    $0x14,%edi
  802132:	48 b8 08 1b 80 00 00 	movabs $0x801b08,%rax
  802139:	00 00 00 
  80213c:	ff d0                	callq  *%rax
  80213e:	c9                   	leaveq 
  80213f:	c3                   	retq   

0000000000802140 <sys_vmx_get_vmdisk_number>:
  802140:	55                   	push   %rbp
  802141:	48 89 e5             	mov    %rsp,%rbp
  802144:	48 83 ec 10          	sub    $0x10,%rsp
  802148:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80214f:	00 
  802150:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802156:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80215c:	b9 00 00 00 00       	mov    $0x0,%ecx
  802161:	ba 00 00 00 00       	mov    $0x0,%edx
  802166:	be 00 00 00 00       	mov    $0x0,%esi
  80216b:	bf 15 00 00 00       	mov    $0x15,%edi
  802170:	48 b8 08 1b 80 00 00 	movabs $0x801b08,%rax
  802177:	00 00 00 
  80217a:	ff d0                	callq  *%rax
  80217c:	c9                   	leaveq 
  80217d:	c3                   	retq   

000000000080217e <sys_vmx_incr_vmdisk_number>:
  80217e:	55                   	push   %rbp
  80217f:	48 89 e5             	mov    %rsp,%rbp
  802182:	48 83 ec 10          	sub    $0x10,%rsp
  802186:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80218d:	00 
  80218e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802194:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80219a:	b9 00 00 00 00       	mov    $0x0,%ecx
  80219f:	ba 00 00 00 00       	mov    $0x0,%edx
  8021a4:	be 00 00 00 00       	mov    $0x0,%esi
  8021a9:	bf 16 00 00 00       	mov    $0x16,%edi
  8021ae:	48 b8 08 1b 80 00 00 	movabs $0x801b08,%rax
  8021b5:	00 00 00 
  8021b8:	ff d0                	callq  *%rax
  8021ba:	c9                   	leaveq 
  8021bb:	c3                   	retq   

00000000008021bc <argstart>:
  8021bc:	55                   	push   %rbp
  8021bd:	48 89 e5             	mov    %rsp,%rbp
  8021c0:	48 83 ec 18          	sub    $0x18,%rsp
  8021c4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8021c8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8021cc:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8021d0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8021d4:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8021d8:	48 89 10             	mov    %rdx,(%rax)
  8021db:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8021df:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8021e3:	48 89 50 08          	mov    %rdx,0x8(%rax)
  8021e7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8021eb:	8b 00                	mov    (%rax),%eax
  8021ed:	83 f8 01             	cmp    $0x1,%eax
  8021f0:	7e 13                	jle    802205 <argstart+0x49>
  8021f2:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
  8021f7:	74 0c                	je     802205 <argstart+0x49>
  8021f9:	48 b8 96 50 80 00 00 	movabs $0x805096,%rax
  802200:	00 00 00 
  802203:	eb 05                	jmp    80220a <argstart+0x4e>
  802205:	b8 00 00 00 00       	mov    $0x0,%eax
  80220a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80220e:	48 89 42 10          	mov    %rax,0x10(%rdx)
  802212:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802216:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
  80221d:	00 
  80221e:	c9                   	leaveq 
  80221f:	c3                   	retq   

0000000000802220 <argnext>:
  802220:	55                   	push   %rbp
  802221:	48 89 e5             	mov    %rsp,%rbp
  802224:	48 83 ec 20          	sub    $0x20,%rsp
  802228:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80222c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802230:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
  802237:	00 
  802238:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80223c:	48 8b 40 10          	mov    0x10(%rax),%rax
  802240:	48 85 c0             	test   %rax,%rax
  802243:	75 0a                	jne    80224f <argnext+0x2f>
  802245:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  80224a:	e9 25 01 00 00       	jmpq   802374 <argnext+0x154>
  80224f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802253:	48 8b 40 10          	mov    0x10(%rax),%rax
  802257:	0f b6 00             	movzbl (%rax),%eax
  80225a:	84 c0                	test   %al,%al
  80225c:	0f 85 d7 00 00 00    	jne    802339 <argnext+0x119>
  802262:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802266:	48 8b 00             	mov    (%rax),%rax
  802269:	8b 00                	mov    (%rax),%eax
  80226b:	83 f8 01             	cmp    $0x1,%eax
  80226e:	0f 84 ef 00 00 00    	je     802363 <argnext+0x143>
  802274:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802278:	48 8b 40 08          	mov    0x8(%rax),%rax
  80227c:	48 83 c0 08          	add    $0x8,%rax
  802280:	48 8b 00             	mov    (%rax),%rax
  802283:	0f b6 00             	movzbl (%rax),%eax
  802286:	3c 2d                	cmp    $0x2d,%al
  802288:	0f 85 d5 00 00 00    	jne    802363 <argnext+0x143>
  80228e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802292:	48 8b 40 08          	mov    0x8(%rax),%rax
  802296:	48 83 c0 08          	add    $0x8,%rax
  80229a:	48 8b 00             	mov    (%rax),%rax
  80229d:	48 83 c0 01          	add    $0x1,%rax
  8022a1:	0f b6 00             	movzbl (%rax),%eax
  8022a4:	84 c0                	test   %al,%al
  8022a6:	0f 84 b7 00 00 00    	je     802363 <argnext+0x143>
  8022ac:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8022b0:	48 8b 40 08          	mov    0x8(%rax),%rax
  8022b4:	48 83 c0 08          	add    $0x8,%rax
  8022b8:	48 8b 00             	mov    (%rax),%rax
  8022bb:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8022bf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8022c3:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8022c7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8022cb:	48 8b 00             	mov    (%rax),%rax
  8022ce:	8b 00                	mov    (%rax),%eax
  8022d0:	83 e8 01             	sub    $0x1,%eax
  8022d3:	48 98                	cltq   
  8022d5:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8022dc:	00 
  8022dd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8022e1:	48 8b 40 08          	mov    0x8(%rax),%rax
  8022e5:	48 8d 48 10          	lea    0x10(%rax),%rcx
  8022e9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8022ed:	48 8b 40 08          	mov    0x8(%rax),%rax
  8022f1:	48 83 c0 08          	add    $0x8,%rax
  8022f5:	48 89 ce             	mov    %rcx,%rsi
  8022f8:	48 89 c7             	mov    %rax,%rdi
  8022fb:	48 b8 d3 16 80 00 00 	movabs $0x8016d3,%rax
  802302:	00 00 00 
  802305:	ff d0                	callq  *%rax
  802307:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80230b:	48 8b 00             	mov    (%rax),%rax
  80230e:	8b 10                	mov    (%rax),%edx
  802310:	83 ea 01             	sub    $0x1,%edx
  802313:	89 10                	mov    %edx,(%rax)
  802315:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802319:	48 8b 40 10          	mov    0x10(%rax),%rax
  80231d:	0f b6 00             	movzbl (%rax),%eax
  802320:	3c 2d                	cmp    $0x2d,%al
  802322:	75 15                	jne    802339 <argnext+0x119>
  802324:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802328:	48 8b 40 10          	mov    0x10(%rax),%rax
  80232c:	48 83 c0 01          	add    $0x1,%rax
  802330:	0f b6 00             	movzbl (%rax),%eax
  802333:	84 c0                	test   %al,%al
  802335:	75 02                	jne    802339 <argnext+0x119>
  802337:	eb 2a                	jmp    802363 <argnext+0x143>
  802339:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80233d:	48 8b 40 10          	mov    0x10(%rax),%rax
  802341:	0f b6 00             	movzbl (%rax),%eax
  802344:	0f b6 c0             	movzbl %al,%eax
  802347:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80234a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80234e:	48 8b 40 10          	mov    0x10(%rax),%rax
  802352:	48 8d 50 01          	lea    0x1(%rax),%rdx
  802356:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80235a:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80235e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802361:	eb 11                	jmp    802374 <argnext+0x154>
  802363:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802367:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
  80236e:	00 
  80236f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  802374:	c9                   	leaveq 
  802375:	c3                   	retq   

0000000000802376 <argvalue>:
  802376:	55                   	push   %rbp
  802377:	48 89 e5             	mov    %rsp,%rbp
  80237a:	48 83 ec 10          	sub    $0x10,%rsp
  80237e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802382:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802386:	48 8b 40 18          	mov    0x18(%rax),%rax
  80238a:	48 85 c0             	test   %rax,%rax
  80238d:	74 0a                	je     802399 <argvalue+0x23>
  80238f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802393:	48 8b 40 18          	mov    0x18(%rax),%rax
  802397:	eb 13                	jmp    8023ac <argvalue+0x36>
  802399:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80239d:	48 89 c7             	mov    %rax,%rdi
  8023a0:	48 b8 ae 23 80 00 00 	movabs $0x8023ae,%rax
  8023a7:	00 00 00 
  8023aa:	ff d0                	callq  *%rax
  8023ac:	c9                   	leaveq 
  8023ad:	c3                   	retq   

00000000008023ae <argnextvalue>:
  8023ae:	55                   	push   %rbp
  8023af:	48 89 e5             	mov    %rsp,%rbp
  8023b2:	53                   	push   %rbx
  8023b3:	48 83 ec 18          	sub    $0x18,%rsp
  8023b7:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8023bb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8023bf:	48 8b 40 10          	mov    0x10(%rax),%rax
  8023c3:	48 85 c0             	test   %rax,%rax
  8023c6:	75 0a                	jne    8023d2 <argnextvalue+0x24>
  8023c8:	b8 00 00 00 00       	mov    $0x0,%eax
  8023cd:	e9 c8 00 00 00       	jmpq   80249a <argnextvalue+0xec>
  8023d2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8023d6:	48 8b 40 10          	mov    0x10(%rax),%rax
  8023da:	0f b6 00             	movzbl (%rax),%eax
  8023dd:	84 c0                	test   %al,%al
  8023df:	74 27                	je     802408 <argnextvalue+0x5a>
  8023e1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8023e5:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8023e9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8023ed:	48 89 50 18          	mov    %rdx,0x18(%rax)
  8023f1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8023f5:	48 bb 96 50 80 00 00 	movabs $0x805096,%rbx
  8023fc:	00 00 00 
  8023ff:	48 89 58 10          	mov    %rbx,0x10(%rax)
  802403:	e9 8a 00 00 00       	jmpq   802492 <argnextvalue+0xe4>
  802408:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80240c:	48 8b 00             	mov    (%rax),%rax
  80240f:	8b 00                	mov    (%rax),%eax
  802411:	83 f8 01             	cmp    $0x1,%eax
  802414:	7e 64                	jle    80247a <argnextvalue+0xcc>
  802416:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80241a:	48 8b 40 08          	mov    0x8(%rax),%rax
  80241e:	48 8b 50 08          	mov    0x8(%rax),%rdx
  802422:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802426:	48 89 50 18          	mov    %rdx,0x18(%rax)
  80242a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80242e:	48 8b 00             	mov    (%rax),%rax
  802431:	8b 00                	mov    (%rax),%eax
  802433:	83 e8 01             	sub    $0x1,%eax
  802436:	48 98                	cltq   
  802438:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  80243f:	00 
  802440:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802444:	48 8b 40 08          	mov    0x8(%rax),%rax
  802448:	48 8d 48 10          	lea    0x10(%rax),%rcx
  80244c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802450:	48 8b 40 08          	mov    0x8(%rax),%rax
  802454:	48 83 c0 08          	add    $0x8,%rax
  802458:	48 89 ce             	mov    %rcx,%rsi
  80245b:	48 89 c7             	mov    %rax,%rdi
  80245e:	48 b8 d3 16 80 00 00 	movabs $0x8016d3,%rax
  802465:	00 00 00 
  802468:	ff d0                	callq  *%rax
  80246a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80246e:	48 8b 00             	mov    (%rax),%rax
  802471:	8b 10                	mov    (%rax),%edx
  802473:	83 ea 01             	sub    $0x1,%edx
  802476:	89 10                	mov    %edx,(%rax)
  802478:	eb 18                	jmp    802492 <argnextvalue+0xe4>
  80247a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80247e:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
  802485:	00 
  802486:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80248a:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
  802491:	00 
  802492:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802496:	48 8b 40 18          	mov    0x18(%rax),%rax
  80249a:	48 83 c4 18          	add    $0x18,%rsp
  80249e:	5b                   	pop    %rbx
  80249f:	5d                   	pop    %rbp
  8024a0:	c3                   	retq   

00000000008024a1 <fd2num>:
  8024a1:	55                   	push   %rbp
  8024a2:	48 89 e5             	mov    %rsp,%rbp
  8024a5:	48 83 ec 08          	sub    $0x8,%rsp
  8024a9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8024ad:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8024b1:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  8024b8:	ff ff ff 
  8024bb:	48 01 d0             	add    %rdx,%rax
  8024be:	48 c1 e8 0c          	shr    $0xc,%rax
  8024c2:	c9                   	leaveq 
  8024c3:	c3                   	retq   

00000000008024c4 <fd2data>:
  8024c4:	55                   	push   %rbp
  8024c5:	48 89 e5             	mov    %rsp,%rbp
  8024c8:	48 83 ec 08          	sub    $0x8,%rsp
  8024cc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8024d0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8024d4:	48 89 c7             	mov    %rax,%rdi
  8024d7:	48 b8 a1 24 80 00 00 	movabs $0x8024a1,%rax
  8024de:	00 00 00 
  8024e1:	ff d0                	callq  *%rax
  8024e3:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  8024e9:	48 c1 e0 0c          	shl    $0xc,%rax
  8024ed:	c9                   	leaveq 
  8024ee:	c3                   	retq   

00000000008024ef <fd_alloc>:
  8024ef:	55                   	push   %rbp
  8024f0:	48 89 e5             	mov    %rsp,%rbp
  8024f3:	48 83 ec 18          	sub    $0x18,%rsp
  8024f7:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8024fb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802502:	eb 6b                	jmp    80256f <fd_alloc+0x80>
  802504:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802507:	48 98                	cltq   
  802509:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  80250f:	48 c1 e0 0c          	shl    $0xc,%rax
  802513:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802517:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80251b:	48 c1 e8 15          	shr    $0x15,%rax
  80251f:	48 89 c2             	mov    %rax,%rdx
  802522:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802529:	01 00 00 
  80252c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802530:	83 e0 01             	and    $0x1,%eax
  802533:	48 85 c0             	test   %rax,%rax
  802536:	74 21                	je     802559 <fd_alloc+0x6a>
  802538:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80253c:	48 c1 e8 0c          	shr    $0xc,%rax
  802540:	48 89 c2             	mov    %rax,%rdx
  802543:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80254a:	01 00 00 
  80254d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802551:	83 e0 01             	and    $0x1,%eax
  802554:	48 85 c0             	test   %rax,%rax
  802557:	75 12                	jne    80256b <fd_alloc+0x7c>
  802559:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80255d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802561:	48 89 10             	mov    %rdx,(%rax)
  802564:	b8 00 00 00 00       	mov    $0x0,%eax
  802569:	eb 1a                	jmp    802585 <fd_alloc+0x96>
  80256b:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80256f:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802573:	7e 8f                	jle    802504 <fd_alloc+0x15>
  802575:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802579:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802580:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  802585:	c9                   	leaveq 
  802586:	c3                   	retq   

0000000000802587 <fd_lookup>:
  802587:	55                   	push   %rbp
  802588:	48 89 e5             	mov    %rsp,%rbp
  80258b:	48 83 ec 20          	sub    $0x20,%rsp
  80258f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802592:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802596:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80259a:	78 06                	js     8025a2 <fd_lookup+0x1b>
  80259c:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  8025a0:	7e 07                	jle    8025a9 <fd_lookup+0x22>
  8025a2:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8025a7:	eb 6c                	jmp    802615 <fd_lookup+0x8e>
  8025a9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8025ac:	48 98                	cltq   
  8025ae:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  8025b4:	48 c1 e0 0c          	shl    $0xc,%rax
  8025b8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8025bc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8025c0:	48 c1 e8 15          	shr    $0x15,%rax
  8025c4:	48 89 c2             	mov    %rax,%rdx
  8025c7:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8025ce:	01 00 00 
  8025d1:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8025d5:	83 e0 01             	and    $0x1,%eax
  8025d8:	48 85 c0             	test   %rax,%rax
  8025db:	74 21                	je     8025fe <fd_lookup+0x77>
  8025dd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8025e1:	48 c1 e8 0c          	shr    $0xc,%rax
  8025e5:	48 89 c2             	mov    %rax,%rdx
  8025e8:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8025ef:	01 00 00 
  8025f2:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8025f6:	83 e0 01             	and    $0x1,%eax
  8025f9:	48 85 c0             	test   %rax,%rax
  8025fc:	75 07                	jne    802605 <fd_lookup+0x7e>
  8025fe:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802603:	eb 10                	jmp    802615 <fd_lookup+0x8e>
  802605:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802609:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80260d:	48 89 10             	mov    %rdx,(%rax)
  802610:	b8 00 00 00 00       	mov    $0x0,%eax
  802615:	c9                   	leaveq 
  802616:	c3                   	retq   

0000000000802617 <fd_close>:
  802617:	55                   	push   %rbp
  802618:	48 89 e5             	mov    %rsp,%rbp
  80261b:	48 83 ec 30          	sub    $0x30,%rsp
  80261f:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802623:	89 f0                	mov    %esi,%eax
  802625:	88 45 d4             	mov    %al,-0x2c(%rbp)
  802628:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80262c:	48 89 c7             	mov    %rax,%rdi
  80262f:	48 b8 a1 24 80 00 00 	movabs $0x8024a1,%rax
  802636:	00 00 00 
  802639:	ff d0                	callq  *%rax
  80263b:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80263f:	48 89 d6             	mov    %rdx,%rsi
  802642:	89 c7                	mov    %eax,%edi
  802644:	48 b8 87 25 80 00 00 	movabs $0x802587,%rax
  80264b:	00 00 00 
  80264e:	ff d0                	callq  *%rax
  802650:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802653:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802657:	78 0a                	js     802663 <fd_close+0x4c>
  802659:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80265d:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  802661:	74 12                	je     802675 <fd_close+0x5e>
  802663:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  802667:	74 05                	je     80266e <fd_close+0x57>
  802669:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80266c:	eb 05                	jmp    802673 <fd_close+0x5c>
  80266e:	b8 00 00 00 00       	mov    $0x0,%eax
  802673:	eb 69                	jmp    8026de <fd_close+0xc7>
  802675:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802679:	8b 00                	mov    (%rax),%eax
  80267b:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80267f:	48 89 d6             	mov    %rdx,%rsi
  802682:	89 c7                	mov    %eax,%edi
  802684:	48 b8 e0 26 80 00 00 	movabs $0x8026e0,%rax
  80268b:	00 00 00 
  80268e:	ff d0                	callq  *%rax
  802690:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802693:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802697:	78 2a                	js     8026c3 <fd_close+0xac>
  802699:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80269d:	48 8b 40 20          	mov    0x20(%rax),%rax
  8026a1:	48 85 c0             	test   %rax,%rax
  8026a4:	74 16                	je     8026bc <fd_close+0xa5>
  8026a6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8026aa:	48 8b 40 20          	mov    0x20(%rax),%rax
  8026ae:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8026b2:	48 89 d7             	mov    %rdx,%rdi
  8026b5:	ff d0                	callq  *%rax
  8026b7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8026ba:	eb 07                	jmp    8026c3 <fd_close+0xac>
  8026bc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8026c3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8026c7:	48 89 c6             	mov    %rax,%rsi
  8026ca:	bf 00 00 00 00       	mov    $0x0,%edi
  8026cf:	48 b8 89 1d 80 00 00 	movabs $0x801d89,%rax
  8026d6:	00 00 00 
  8026d9:	ff d0                	callq  *%rax
  8026db:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8026de:	c9                   	leaveq 
  8026df:	c3                   	retq   

00000000008026e0 <dev_lookup>:
  8026e0:	55                   	push   %rbp
  8026e1:	48 89 e5             	mov    %rsp,%rbp
  8026e4:	48 83 ec 20          	sub    $0x20,%rsp
  8026e8:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8026eb:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8026ef:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8026f6:	eb 41                	jmp    802739 <dev_lookup+0x59>
  8026f8:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  8026ff:	00 00 00 
  802702:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802705:	48 63 d2             	movslq %edx,%rdx
  802708:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80270c:	8b 00                	mov    (%rax),%eax
  80270e:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  802711:	75 22                	jne    802735 <dev_lookup+0x55>
  802713:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  80271a:	00 00 00 
  80271d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802720:	48 63 d2             	movslq %edx,%rdx
  802723:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  802727:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80272b:	48 89 10             	mov    %rdx,(%rax)
  80272e:	b8 00 00 00 00       	mov    $0x0,%eax
  802733:	eb 60                	jmp    802795 <dev_lookup+0xb5>
  802735:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802739:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802740:	00 00 00 
  802743:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802746:	48 63 d2             	movslq %edx,%rdx
  802749:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80274d:	48 85 c0             	test   %rax,%rax
  802750:	75 a6                	jne    8026f8 <dev_lookup+0x18>
  802752:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  802759:	00 00 00 
  80275c:	48 8b 00             	mov    (%rax),%rax
  80275f:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802765:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802768:	89 c6                	mov    %eax,%esi
  80276a:	48 bf 98 50 80 00 00 	movabs $0x805098,%rdi
  802771:	00 00 00 
  802774:	b8 00 00 00 00       	mov    $0x0,%eax
  802779:	48 b9 fa 07 80 00 00 	movabs $0x8007fa,%rcx
  802780:	00 00 00 
  802783:	ff d1                	callq  *%rcx
  802785:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802789:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802790:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802795:	c9                   	leaveq 
  802796:	c3                   	retq   

0000000000802797 <close>:
  802797:	55                   	push   %rbp
  802798:	48 89 e5             	mov    %rsp,%rbp
  80279b:	48 83 ec 20          	sub    $0x20,%rsp
  80279f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8027a2:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8027a6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8027a9:	48 89 d6             	mov    %rdx,%rsi
  8027ac:	89 c7                	mov    %eax,%edi
  8027ae:	48 b8 87 25 80 00 00 	movabs $0x802587,%rax
  8027b5:	00 00 00 
  8027b8:	ff d0                	callq  *%rax
  8027ba:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8027bd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8027c1:	79 05                	jns    8027c8 <close+0x31>
  8027c3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8027c6:	eb 18                	jmp    8027e0 <close+0x49>
  8027c8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8027cc:	be 01 00 00 00       	mov    $0x1,%esi
  8027d1:	48 89 c7             	mov    %rax,%rdi
  8027d4:	48 b8 17 26 80 00 00 	movabs $0x802617,%rax
  8027db:	00 00 00 
  8027de:	ff d0                	callq  *%rax
  8027e0:	c9                   	leaveq 
  8027e1:	c3                   	retq   

00000000008027e2 <close_all>:
  8027e2:	55                   	push   %rbp
  8027e3:	48 89 e5             	mov    %rsp,%rbp
  8027e6:	48 83 ec 10          	sub    $0x10,%rsp
  8027ea:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8027f1:	eb 15                	jmp    802808 <close_all+0x26>
  8027f3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8027f6:	89 c7                	mov    %eax,%edi
  8027f8:	48 b8 97 27 80 00 00 	movabs $0x802797,%rax
  8027ff:	00 00 00 
  802802:	ff d0                	callq  *%rax
  802804:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802808:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  80280c:	7e e5                	jle    8027f3 <close_all+0x11>
  80280e:	c9                   	leaveq 
  80280f:	c3                   	retq   

0000000000802810 <dup>:
  802810:	55                   	push   %rbp
  802811:	48 89 e5             	mov    %rsp,%rbp
  802814:	48 83 ec 40          	sub    $0x40,%rsp
  802818:	89 7d cc             	mov    %edi,-0x34(%rbp)
  80281b:	89 75 c8             	mov    %esi,-0x38(%rbp)
  80281e:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  802822:	8b 45 cc             	mov    -0x34(%rbp),%eax
  802825:	48 89 d6             	mov    %rdx,%rsi
  802828:	89 c7                	mov    %eax,%edi
  80282a:	48 b8 87 25 80 00 00 	movabs $0x802587,%rax
  802831:	00 00 00 
  802834:	ff d0                	callq  *%rax
  802836:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802839:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80283d:	79 08                	jns    802847 <dup+0x37>
  80283f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802842:	e9 70 01 00 00       	jmpq   8029b7 <dup+0x1a7>
  802847:	8b 45 c8             	mov    -0x38(%rbp),%eax
  80284a:	89 c7                	mov    %eax,%edi
  80284c:	48 b8 97 27 80 00 00 	movabs $0x802797,%rax
  802853:	00 00 00 
  802856:	ff d0                	callq  *%rax
  802858:	8b 45 c8             	mov    -0x38(%rbp),%eax
  80285b:	48 98                	cltq   
  80285d:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802863:	48 c1 e0 0c          	shl    $0xc,%rax
  802867:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80286b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80286f:	48 89 c7             	mov    %rax,%rdi
  802872:	48 b8 c4 24 80 00 00 	movabs $0x8024c4,%rax
  802879:	00 00 00 
  80287c:	ff d0                	callq  *%rax
  80287e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802882:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802886:	48 89 c7             	mov    %rax,%rdi
  802889:	48 b8 c4 24 80 00 00 	movabs $0x8024c4,%rax
  802890:	00 00 00 
  802893:	ff d0                	callq  *%rax
  802895:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802899:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80289d:	48 c1 e8 15          	shr    $0x15,%rax
  8028a1:	48 89 c2             	mov    %rax,%rdx
  8028a4:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8028ab:	01 00 00 
  8028ae:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8028b2:	83 e0 01             	and    $0x1,%eax
  8028b5:	48 85 c0             	test   %rax,%rax
  8028b8:	74 73                	je     80292d <dup+0x11d>
  8028ba:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8028be:	48 c1 e8 0c          	shr    $0xc,%rax
  8028c2:	48 89 c2             	mov    %rax,%rdx
  8028c5:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8028cc:	01 00 00 
  8028cf:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8028d3:	83 e0 01             	and    $0x1,%eax
  8028d6:	48 85 c0             	test   %rax,%rax
  8028d9:	74 52                	je     80292d <dup+0x11d>
  8028db:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8028df:	48 c1 e8 0c          	shr    $0xc,%rax
  8028e3:	48 89 c2             	mov    %rax,%rdx
  8028e6:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8028ed:	01 00 00 
  8028f0:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8028f4:	25 07 0e 00 00       	and    $0xe07,%eax
  8028f9:	89 c1                	mov    %eax,%ecx
  8028fb:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8028ff:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802903:	41 89 c8             	mov    %ecx,%r8d
  802906:	48 89 d1             	mov    %rdx,%rcx
  802909:	ba 00 00 00 00       	mov    $0x0,%edx
  80290e:	48 89 c6             	mov    %rax,%rsi
  802911:	bf 00 00 00 00       	mov    $0x0,%edi
  802916:	48 b8 2e 1d 80 00 00 	movabs $0x801d2e,%rax
  80291d:	00 00 00 
  802920:	ff d0                	callq  *%rax
  802922:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802925:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802929:	79 02                	jns    80292d <dup+0x11d>
  80292b:	eb 57                	jmp    802984 <dup+0x174>
  80292d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802931:	48 c1 e8 0c          	shr    $0xc,%rax
  802935:	48 89 c2             	mov    %rax,%rdx
  802938:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80293f:	01 00 00 
  802942:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802946:	25 07 0e 00 00       	and    $0xe07,%eax
  80294b:	89 c1                	mov    %eax,%ecx
  80294d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802951:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802955:	41 89 c8             	mov    %ecx,%r8d
  802958:	48 89 d1             	mov    %rdx,%rcx
  80295b:	ba 00 00 00 00       	mov    $0x0,%edx
  802960:	48 89 c6             	mov    %rax,%rsi
  802963:	bf 00 00 00 00       	mov    $0x0,%edi
  802968:	48 b8 2e 1d 80 00 00 	movabs $0x801d2e,%rax
  80296f:	00 00 00 
  802972:	ff d0                	callq  *%rax
  802974:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802977:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80297b:	79 02                	jns    80297f <dup+0x16f>
  80297d:	eb 05                	jmp    802984 <dup+0x174>
  80297f:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802982:	eb 33                	jmp    8029b7 <dup+0x1a7>
  802984:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802988:	48 89 c6             	mov    %rax,%rsi
  80298b:	bf 00 00 00 00       	mov    $0x0,%edi
  802990:	48 b8 89 1d 80 00 00 	movabs $0x801d89,%rax
  802997:	00 00 00 
  80299a:	ff d0                	callq  *%rax
  80299c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8029a0:	48 89 c6             	mov    %rax,%rsi
  8029a3:	bf 00 00 00 00       	mov    $0x0,%edi
  8029a8:	48 b8 89 1d 80 00 00 	movabs $0x801d89,%rax
  8029af:	00 00 00 
  8029b2:	ff d0                	callq  *%rax
  8029b4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029b7:	c9                   	leaveq 
  8029b8:	c3                   	retq   

00000000008029b9 <read>:
  8029b9:	55                   	push   %rbp
  8029ba:	48 89 e5             	mov    %rsp,%rbp
  8029bd:	48 83 ec 40          	sub    $0x40,%rsp
  8029c1:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8029c4:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8029c8:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8029cc:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8029d0:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8029d3:	48 89 d6             	mov    %rdx,%rsi
  8029d6:	89 c7                	mov    %eax,%edi
  8029d8:	48 b8 87 25 80 00 00 	movabs $0x802587,%rax
  8029df:	00 00 00 
  8029e2:	ff d0                	callq  *%rax
  8029e4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8029e7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8029eb:	78 24                	js     802a11 <read+0x58>
  8029ed:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8029f1:	8b 00                	mov    (%rax),%eax
  8029f3:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8029f7:	48 89 d6             	mov    %rdx,%rsi
  8029fa:	89 c7                	mov    %eax,%edi
  8029fc:	48 b8 e0 26 80 00 00 	movabs $0x8026e0,%rax
  802a03:	00 00 00 
  802a06:	ff d0                	callq  *%rax
  802a08:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802a0b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802a0f:	79 05                	jns    802a16 <read+0x5d>
  802a11:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a14:	eb 76                	jmp    802a8c <read+0xd3>
  802a16:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802a1a:	8b 40 08             	mov    0x8(%rax),%eax
  802a1d:	83 e0 03             	and    $0x3,%eax
  802a20:	83 f8 01             	cmp    $0x1,%eax
  802a23:	75 3a                	jne    802a5f <read+0xa6>
  802a25:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  802a2c:	00 00 00 
  802a2f:	48 8b 00             	mov    (%rax),%rax
  802a32:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802a38:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802a3b:	89 c6                	mov    %eax,%esi
  802a3d:	48 bf b7 50 80 00 00 	movabs $0x8050b7,%rdi
  802a44:	00 00 00 
  802a47:	b8 00 00 00 00       	mov    $0x0,%eax
  802a4c:	48 b9 fa 07 80 00 00 	movabs $0x8007fa,%rcx
  802a53:	00 00 00 
  802a56:	ff d1                	callq  *%rcx
  802a58:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802a5d:	eb 2d                	jmp    802a8c <read+0xd3>
  802a5f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802a63:	48 8b 40 10          	mov    0x10(%rax),%rax
  802a67:	48 85 c0             	test   %rax,%rax
  802a6a:	75 07                	jne    802a73 <read+0xba>
  802a6c:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802a71:	eb 19                	jmp    802a8c <read+0xd3>
  802a73:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802a77:	48 8b 40 10          	mov    0x10(%rax),%rax
  802a7b:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802a7f:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802a83:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802a87:	48 89 cf             	mov    %rcx,%rdi
  802a8a:	ff d0                	callq  *%rax
  802a8c:	c9                   	leaveq 
  802a8d:	c3                   	retq   

0000000000802a8e <readn>:
  802a8e:	55                   	push   %rbp
  802a8f:	48 89 e5             	mov    %rsp,%rbp
  802a92:	48 83 ec 30          	sub    $0x30,%rsp
  802a96:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802a99:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802a9d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802aa1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802aa8:	eb 49                	jmp    802af3 <readn+0x65>
  802aaa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802aad:	48 98                	cltq   
  802aaf:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802ab3:	48 29 c2             	sub    %rax,%rdx
  802ab6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ab9:	48 63 c8             	movslq %eax,%rcx
  802abc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802ac0:	48 01 c1             	add    %rax,%rcx
  802ac3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802ac6:	48 89 ce             	mov    %rcx,%rsi
  802ac9:	89 c7                	mov    %eax,%edi
  802acb:	48 b8 b9 29 80 00 00 	movabs $0x8029b9,%rax
  802ad2:	00 00 00 
  802ad5:	ff d0                	callq  *%rax
  802ad7:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802ada:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802ade:	79 05                	jns    802ae5 <readn+0x57>
  802ae0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802ae3:	eb 1c                	jmp    802b01 <readn+0x73>
  802ae5:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802ae9:	75 02                	jne    802aed <readn+0x5f>
  802aeb:	eb 11                	jmp    802afe <readn+0x70>
  802aed:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802af0:	01 45 fc             	add    %eax,-0x4(%rbp)
  802af3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802af6:	48 98                	cltq   
  802af8:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802afc:	72 ac                	jb     802aaa <readn+0x1c>
  802afe:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b01:	c9                   	leaveq 
  802b02:	c3                   	retq   

0000000000802b03 <write>:
  802b03:	55                   	push   %rbp
  802b04:	48 89 e5             	mov    %rsp,%rbp
  802b07:	48 83 ec 40          	sub    $0x40,%rsp
  802b0b:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802b0e:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802b12:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802b16:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802b1a:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802b1d:	48 89 d6             	mov    %rdx,%rsi
  802b20:	89 c7                	mov    %eax,%edi
  802b22:	48 b8 87 25 80 00 00 	movabs $0x802587,%rax
  802b29:	00 00 00 
  802b2c:	ff d0                	callq  *%rax
  802b2e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b31:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b35:	78 24                	js     802b5b <write+0x58>
  802b37:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b3b:	8b 00                	mov    (%rax),%eax
  802b3d:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802b41:	48 89 d6             	mov    %rdx,%rsi
  802b44:	89 c7                	mov    %eax,%edi
  802b46:	48 b8 e0 26 80 00 00 	movabs $0x8026e0,%rax
  802b4d:	00 00 00 
  802b50:	ff d0                	callq  *%rax
  802b52:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b55:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b59:	79 05                	jns    802b60 <write+0x5d>
  802b5b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b5e:	eb 75                	jmp    802bd5 <write+0xd2>
  802b60:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b64:	8b 40 08             	mov    0x8(%rax),%eax
  802b67:	83 e0 03             	and    $0x3,%eax
  802b6a:	85 c0                	test   %eax,%eax
  802b6c:	75 3a                	jne    802ba8 <write+0xa5>
  802b6e:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  802b75:	00 00 00 
  802b78:	48 8b 00             	mov    (%rax),%rax
  802b7b:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802b81:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802b84:	89 c6                	mov    %eax,%esi
  802b86:	48 bf d3 50 80 00 00 	movabs $0x8050d3,%rdi
  802b8d:	00 00 00 
  802b90:	b8 00 00 00 00       	mov    $0x0,%eax
  802b95:	48 b9 fa 07 80 00 00 	movabs $0x8007fa,%rcx
  802b9c:	00 00 00 
  802b9f:	ff d1                	callq  *%rcx
  802ba1:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802ba6:	eb 2d                	jmp    802bd5 <write+0xd2>
  802ba8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802bac:	48 8b 40 18          	mov    0x18(%rax),%rax
  802bb0:	48 85 c0             	test   %rax,%rax
  802bb3:	75 07                	jne    802bbc <write+0xb9>
  802bb5:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802bba:	eb 19                	jmp    802bd5 <write+0xd2>
  802bbc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802bc0:	48 8b 40 18          	mov    0x18(%rax),%rax
  802bc4:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802bc8:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802bcc:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802bd0:	48 89 cf             	mov    %rcx,%rdi
  802bd3:	ff d0                	callq  *%rax
  802bd5:	c9                   	leaveq 
  802bd6:	c3                   	retq   

0000000000802bd7 <seek>:
  802bd7:	55                   	push   %rbp
  802bd8:	48 89 e5             	mov    %rsp,%rbp
  802bdb:	48 83 ec 18          	sub    $0x18,%rsp
  802bdf:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802be2:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802be5:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802be9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802bec:	48 89 d6             	mov    %rdx,%rsi
  802bef:	89 c7                	mov    %eax,%edi
  802bf1:	48 b8 87 25 80 00 00 	movabs $0x802587,%rax
  802bf8:	00 00 00 
  802bfb:	ff d0                	callq  *%rax
  802bfd:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c00:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c04:	79 05                	jns    802c0b <seek+0x34>
  802c06:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c09:	eb 0f                	jmp    802c1a <seek+0x43>
  802c0b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802c0f:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802c12:	89 50 04             	mov    %edx,0x4(%rax)
  802c15:	b8 00 00 00 00       	mov    $0x0,%eax
  802c1a:	c9                   	leaveq 
  802c1b:	c3                   	retq   

0000000000802c1c <ftruncate>:
  802c1c:	55                   	push   %rbp
  802c1d:	48 89 e5             	mov    %rsp,%rbp
  802c20:	48 83 ec 30          	sub    $0x30,%rsp
  802c24:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802c27:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802c2a:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802c2e:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802c31:	48 89 d6             	mov    %rdx,%rsi
  802c34:	89 c7                	mov    %eax,%edi
  802c36:	48 b8 87 25 80 00 00 	movabs $0x802587,%rax
  802c3d:	00 00 00 
  802c40:	ff d0                	callq  *%rax
  802c42:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c45:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c49:	78 24                	js     802c6f <ftruncate+0x53>
  802c4b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c4f:	8b 00                	mov    (%rax),%eax
  802c51:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802c55:	48 89 d6             	mov    %rdx,%rsi
  802c58:	89 c7                	mov    %eax,%edi
  802c5a:	48 b8 e0 26 80 00 00 	movabs $0x8026e0,%rax
  802c61:	00 00 00 
  802c64:	ff d0                	callq  *%rax
  802c66:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c69:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c6d:	79 05                	jns    802c74 <ftruncate+0x58>
  802c6f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c72:	eb 72                	jmp    802ce6 <ftruncate+0xca>
  802c74:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c78:	8b 40 08             	mov    0x8(%rax),%eax
  802c7b:	83 e0 03             	and    $0x3,%eax
  802c7e:	85 c0                	test   %eax,%eax
  802c80:	75 3a                	jne    802cbc <ftruncate+0xa0>
  802c82:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  802c89:	00 00 00 
  802c8c:	48 8b 00             	mov    (%rax),%rax
  802c8f:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802c95:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802c98:	89 c6                	mov    %eax,%esi
  802c9a:	48 bf f0 50 80 00 00 	movabs $0x8050f0,%rdi
  802ca1:	00 00 00 
  802ca4:	b8 00 00 00 00       	mov    $0x0,%eax
  802ca9:	48 b9 fa 07 80 00 00 	movabs $0x8007fa,%rcx
  802cb0:	00 00 00 
  802cb3:	ff d1                	callq  *%rcx
  802cb5:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802cba:	eb 2a                	jmp    802ce6 <ftruncate+0xca>
  802cbc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802cc0:	48 8b 40 30          	mov    0x30(%rax),%rax
  802cc4:	48 85 c0             	test   %rax,%rax
  802cc7:	75 07                	jne    802cd0 <ftruncate+0xb4>
  802cc9:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802cce:	eb 16                	jmp    802ce6 <ftruncate+0xca>
  802cd0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802cd4:	48 8b 40 30          	mov    0x30(%rax),%rax
  802cd8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802cdc:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  802cdf:	89 ce                	mov    %ecx,%esi
  802ce1:	48 89 d7             	mov    %rdx,%rdi
  802ce4:	ff d0                	callq  *%rax
  802ce6:	c9                   	leaveq 
  802ce7:	c3                   	retq   

0000000000802ce8 <fstat>:
  802ce8:	55                   	push   %rbp
  802ce9:	48 89 e5             	mov    %rsp,%rbp
  802cec:	48 83 ec 30          	sub    $0x30,%rsp
  802cf0:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802cf3:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802cf7:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802cfb:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802cfe:	48 89 d6             	mov    %rdx,%rsi
  802d01:	89 c7                	mov    %eax,%edi
  802d03:	48 b8 87 25 80 00 00 	movabs $0x802587,%rax
  802d0a:	00 00 00 
  802d0d:	ff d0                	callq  *%rax
  802d0f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d12:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d16:	78 24                	js     802d3c <fstat+0x54>
  802d18:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d1c:	8b 00                	mov    (%rax),%eax
  802d1e:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802d22:	48 89 d6             	mov    %rdx,%rsi
  802d25:	89 c7                	mov    %eax,%edi
  802d27:	48 b8 e0 26 80 00 00 	movabs $0x8026e0,%rax
  802d2e:	00 00 00 
  802d31:	ff d0                	callq  *%rax
  802d33:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d36:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d3a:	79 05                	jns    802d41 <fstat+0x59>
  802d3c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d3f:	eb 5e                	jmp    802d9f <fstat+0xb7>
  802d41:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d45:	48 8b 40 28          	mov    0x28(%rax),%rax
  802d49:	48 85 c0             	test   %rax,%rax
  802d4c:	75 07                	jne    802d55 <fstat+0x6d>
  802d4e:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802d53:	eb 4a                	jmp    802d9f <fstat+0xb7>
  802d55:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802d59:	c6 00 00             	movb   $0x0,(%rax)
  802d5c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802d60:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  802d67:	00 00 00 
  802d6a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802d6e:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  802d75:	00 00 00 
  802d78:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802d7c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802d80:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  802d87:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d8b:	48 8b 40 28          	mov    0x28(%rax),%rax
  802d8f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802d93:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  802d97:	48 89 ce             	mov    %rcx,%rsi
  802d9a:	48 89 d7             	mov    %rdx,%rdi
  802d9d:	ff d0                	callq  *%rax
  802d9f:	c9                   	leaveq 
  802da0:	c3                   	retq   

0000000000802da1 <stat>:
  802da1:	55                   	push   %rbp
  802da2:	48 89 e5             	mov    %rsp,%rbp
  802da5:	48 83 ec 20          	sub    $0x20,%rsp
  802da9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802dad:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802db1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802db5:	be 00 00 00 00       	mov    $0x0,%esi
  802dba:	48 89 c7             	mov    %rax,%rdi
  802dbd:	48 b8 8f 2e 80 00 00 	movabs $0x802e8f,%rax
  802dc4:	00 00 00 
  802dc7:	ff d0                	callq  *%rax
  802dc9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802dcc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802dd0:	79 05                	jns    802dd7 <stat+0x36>
  802dd2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802dd5:	eb 2f                	jmp    802e06 <stat+0x65>
  802dd7:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802ddb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802dde:	48 89 d6             	mov    %rdx,%rsi
  802de1:	89 c7                	mov    %eax,%edi
  802de3:	48 b8 e8 2c 80 00 00 	movabs $0x802ce8,%rax
  802dea:	00 00 00 
  802ded:	ff d0                	callq  *%rax
  802def:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802df2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802df5:	89 c7                	mov    %eax,%edi
  802df7:	48 b8 97 27 80 00 00 	movabs $0x802797,%rax
  802dfe:	00 00 00 
  802e01:	ff d0                	callq  *%rax
  802e03:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802e06:	c9                   	leaveq 
  802e07:	c3                   	retq   

0000000000802e08 <fsipc>:
  802e08:	55                   	push   %rbp
  802e09:	48 89 e5             	mov    %rsp,%rbp
  802e0c:	48 83 ec 10          	sub    $0x10,%rsp
  802e10:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802e13:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802e17:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802e1e:	00 00 00 
  802e21:	8b 00                	mov    (%rax),%eax
  802e23:	85 c0                	test   %eax,%eax
  802e25:	75 1d                	jne    802e44 <fsipc+0x3c>
  802e27:	bf 01 00 00 00       	mov    $0x1,%edi
  802e2c:	48 b8 af 49 80 00 00 	movabs $0x8049af,%rax
  802e33:	00 00 00 
  802e36:	ff d0                	callq  *%rax
  802e38:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  802e3f:	00 00 00 
  802e42:	89 02                	mov    %eax,(%rdx)
  802e44:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802e4b:	00 00 00 
  802e4e:	8b 00                	mov    (%rax),%eax
  802e50:	8b 75 fc             	mov    -0x4(%rbp),%esi
  802e53:	b9 07 00 00 00       	mov    $0x7,%ecx
  802e58:	48 ba 00 90 80 00 00 	movabs $0x809000,%rdx
  802e5f:	00 00 00 
  802e62:	89 c7                	mov    %eax,%edi
  802e64:	48 b8 19 49 80 00 00 	movabs $0x804919,%rax
  802e6b:	00 00 00 
  802e6e:	ff d0                	callq  *%rax
  802e70:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e74:	ba 00 00 00 00       	mov    $0x0,%edx
  802e79:	48 89 c6             	mov    %rax,%rsi
  802e7c:	bf 00 00 00 00       	mov    $0x0,%edi
  802e81:	48 b8 58 48 80 00 00 	movabs $0x804858,%rax
  802e88:	00 00 00 
  802e8b:	ff d0                	callq  *%rax
  802e8d:	c9                   	leaveq 
  802e8e:	c3                   	retq   

0000000000802e8f <open>:
  802e8f:	55                   	push   %rbp
  802e90:	48 89 e5             	mov    %rsp,%rbp
  802e93:	48 83 ec 20          	sub    $0x20,%rsp
  802e97:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802e9b:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  802e9e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ea2:	48 89 c7             	mov    %rax,%rdi
  802ea5:	48 b8 43 13 80 00 00 	movabs $0x801343,%rax
  802eac:	00 00 00 
  802eaf:	ff d0                	callq  *%rax
  802eb1:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802eb6:	7e 0a                	jle    802ec2 <open+0x33>
  802eb8:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802ebd:	e9 a5 00 00 00       	jmpq   802f67 <open+0xd8>
  802ec2:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802ec6:	48 89 c7             	mov    %rax,%rdi
  802ec9:	48 b8 ef 24 80 00 00 	movabs $0x8024ef,%rax
  802ed0:	00 00 00 
  802ed3:	ff d0                	callq  *%rax
  802ed5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ed8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802edc:	79 08                	jns    802ee6 <open+0x57>
  802ede:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ee1:	e9 81 00 00 00       	jmpq   802f67 <open+0xd8>
  802ee6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802eea:	48 89 c6             	mov    %rax,%rsi
  802eed:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  802ef4:	00 00 00 
  802ef7:	48 b8 af 13 80 00 00 	movabs $0x8013af,%rax
  802efe:	00 00 00 
  802f01:	ff d0                	callq  *%rax
  802f03:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802f0a:	00 00 00 
  802f0d:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  802f10:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  802f16:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f1a:	48 89 c6             	mov    %rax,%rsi
  802f1d:	bf 01 00 00 00       	mov    $0x1,%edi
  802f22:	48 b8 08 2e 80 00 00 	movabs $0x802e08,%rax
  802f29:	00 00 00 
  802f2c:	ff d0                	callq  *%rax
  802f2e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f31:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f35:	79 1d                	jns    802f54 <open+0xc5>
  802f37:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f3b:	be 00 00 00 00       	mov    $0x0,%esi
  802f40:	48 89 c7             	mov    %rax,%rdi
  802f43:	48 b8 17 26 80 00 00 	movabs $0x802617,%rax
  802f4a:	00 00 00 
  802f4d:	ff d0                	callq  *%rax
  802f4f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f52:	eb 13                	jmp    802f67 <open+0xd8>
  802f54:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f58:	48 89 c7             	mov    %rax,%rdi
  802f5b:	48 b8 a1 24 80 00 00 	movabs $0x8024a1,%rax
  802f62:	00 00 00 
  802f65:	ff d0                	callq  *%rax
  802f67:	c9                   	leaveq 
  802f68:	c3                   	retq   

0000000000802f69 <devfile_flush>:
  802f69:	55                   	push   %rbp
  802f6a:	48 89 e5             	mov    %rsp,%rbp
  802f6d:	48 83 ec 10          	sub    $0x10,%rsp
  802f71:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802f75:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802f79:	8b 50 0c             	mov    0xc(%rax),%edx
  802f7c:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802f83:	00 00 00 
  802f86:	89 10                	mov    %edx,(%rax)
  802f88:	be 00 00 00 00       	mov    $0x0,%esi
  802f8d:	bf 06 00 00 00       	mov    $0x6,%edi
  802f92:	48 b8 08 2e 80 00 00 	movabs $0x802e08,%rax
  802f99:	00 00 00 
  802f9c:	ff d0                	callq  *%rax
  802f9e:	c9                   	leaveq 
  802f9f:	c3                   	retq   

0000000000802fa0 <devfile_read>:
  802fa0:	55                   	push   %rbp
  802fa1:	48 89 e5             	mov    %rsp,%rbp
  802fa4:	48 83 ec 30          	sub    $0x30,%rsp
  802fa8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802fac:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802fb0:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802fb4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802fb8:	8b 50 0c             	mov    0xc(%rax),%edx
  802fbb:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802fc2:	00 00 00 
  802fc5:	89 10                	mov    %edx,(%rax)
  802fc7:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802fce:	00 00 00 
  802fd1:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802fd5:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802fd9:	be 00 00 00 00       	mov    $0x0,%esi
  802fde:	bf 03 00 00 00       	mov    $0x3,%edi
  802fe3:	48 b8 08 2e 80 00 00 	movabs $0x802e08,%rax
  802fea:	00 00 00 
  802fed:	ff d0                	callq  *%rax
  802fef:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ff2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ff6:	79 08                	jns    803000 <devfile_read+0x60>
  802ff8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ffb:	e9 a4 00 00 00       	jmpq   8030a4 <devfile_read+0x104>
  803000:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803003:	48 98                	cltq   
  803005:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  803009:	76 35                	jbe    803040 <devfile_read+0xa0>
  80300b:	48 b9 16 51 80 00 00 	movabs $0x805116,%rcx
  803012:	00 00 00 
  803015:	48 ba 1d 51 80 00 00 	movabs $0x80511d,%rdx
  80301c:	00 00 00 
  80301f:	be 89 00 00 00       	mov    $0x89,%esi
  803024:	48 bf 32 51 80 00 00 	movabs $0x805132,%rdi
  80302b:	00 00 00 
  80302e:	b8 00 00 00 00       	mov    $0x0,%eax
  803033:	49 b8 c1 05 80 00 00 	movabs $0x8005c1,%r8
  80303a:	00 00 00 
  80303d:	41 ff d0             	callq  *%r8
  803040:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  803047:	7e 35                	jle    80307e <devfile_read+0xde>
  803049:	48 b9 40 51 80 00 00 	movabs $0x805140,%rcx
  803050:	00 00 00 
  803053:	48 ba 1d 51 80 00 00 	movabs $0x80511d,%rdx
  80305a:	00 00 00 
  80305d:	be 8a 00 00 00       	mov    $0x8a,%esi
  803062:	48 bf 32 51 80 00 00 	movabs $0x805132,%rdi
  803069:	00 00 00 
  80306c:	b8 00 00 00 00       	mov    $0x0,%eax
  803071:	49 b8 c1 05 80 00 00 	movabs $0x8005c1,%r8
  803078:	00 00 00 
  80307b:	41 ff d0             	callq  *%r8
  80307e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803081:	48 63 d0             	movslq %eax,%rdx
  803084:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803088:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  80308f:	00 00 00 
  803092:	48 89 c7             	mov    %rax,%rdi
  803095:	48 b8 d3 16 80 00 00 	movabs $0x8016d3,%rax
  80309c:	00 00 00 
  80309f:	ff d0                	callq  *%rax
  8030a1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030a4:	c9                   	leaveq 
  8030a5:	c3                   	retq   

00000000008030a6 <devfile_write>:
  8030a6:	55                   	push   %rbp
  8030a7:	48 89 e5             	mov    %rsp,%rbp
  8030aa:	48 83 ec 40          	sub    $0x40,%rsp
  8030ae:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8030b2:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8030b6:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8030ba:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8030be:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8030c2:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  8030c9:	00 
  8030ca:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8030ce:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  8030d2:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  8030d7:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  8030db:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8030df:	8b 50 0c             	mov    0xc(%rax),%edx
  8030e2:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8030e9:	00 00 00 
  8030ec:	89 10                	mov    %edx,(%rax)
  8030ee:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8030f5:	00 00 00 
  8030f8:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8030fc:	48 89 50 08          	mov    %rdx,0x8(%rax)
  803100:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803104:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803108:	48 89 c6             	mov    %rax,%rsi
  80310b:	48 bf 10 90 80 00 00 	movabs $0x809010,%rdi
  803112:	00 00 00 
  803115:	48 b8 d3 16 80 00 00 	movabs $0x8016d3,%rax
  80311c:	00 00 00 
  80311f:	ff d0                	callq  *%rax
  803121:	be 00 00 00 00       	mov    $0x0,%esi
  803126:	bf 04 00 00 00       	mov    $0x4,%edi
  80312b:	48 b8 08 2e 80 00 00 	movabs $0x802e08,%rax
  803132:	00 00 00 
  803135:	ff d0                	callq  *%rax
  803137:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80313a:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80313e:	79 05                	jns    803145 <devfile_write+0x9f>
  803140:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803143:	eb 43                	jmp    803188 <devfile_write+0xe2>
  803145:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803148:	48 98                	cltq   
  80314a:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  80314e:	76 35                	jbe    803185 <devfile_write+0xdf>
  803150:	48 b9 16 51 80 00 00 	movabs $0x805116,%rcx
  803157:	00 00 00 
  80315a:	48 ba 1d 51 80 00 00 	movabs $0x80511d,%rdx
  803161:	00 00 00 
  803164:	be a8 00 00 00       	mov    $0xa8,%esi
  803169:	48 bf 32 51 80 00 00 	movabs $0x805132,%rdi
  803170:	00 00 00 
  803173:	b8 00 00 00 00       	mov    $0x0,%eax
  803178:	49 b8 c1 05 80 00 00 	movabs $0x8005c1,%r8
  80317f:	00 00 00 
  803182:	41 ff d0             	callq  *%r8
  803185:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803188:	c9                   	leaveq 
  803189:	c3                   	retq   

000000000080318a <devfile_stat>:
  80318a:	55                   	push   %rbp
  80318b:	48 89 e5             	mov    %rsp,%rbp
  80318e:	48 83 ec 20          	sub    $0x20,%rsp
  803192:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803196:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80319a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80319e:	8b 50 0c             	mov    0xc(%rax),%edx
  8031a1:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8031a8:	00 00 00 
  8031ab:	89 10                	mov    %edx,(%rax)
  8031ad:	be 00 00 00 00       	mov    $0x0,%esi
  8031b2:	bf 05 00 00 00       	mov    $0x5,%edi
  8031b7:	48 b8 08 2e 80 00 00 	movabs $0x802e08,%rax
  8031be:	00 00 00 
  8031c1:	ff d0                	callq  *%rax
  8031c3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8031c6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8031ca:	79 05                	jns    8031d1 <devfile_stat+0x47>
  8031cc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031cf:	eb 56                	jmp    803227 <devfile_stat+0x9d>
  8031d1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8031d5:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  8031dc:	00 00 00 
  8031df:	48 89 c7             	mov    %rax,%rdi
  8031e2:	48 b8 af 13 80 00 00 	movabs $0x8013af,%rax
  8031e9:	00 00 00 
  8031ec:	ff d0                	callq  *%rax
  8031ee:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8031f5:	00 00 00 
  8031f8:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  8031fe:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803202:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  803208:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80320f:	00 00 00 
  803212:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  803218:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80321c:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  803222:	b8 00 00 00 00       	mov    $0x0,%eax
  803227:	c9                   	leaveq 
  803228:	c3                   	retq   

0000000000803229 <devfile_trunc>:
  803229:	55                   	push   %rbp
  80322a:	48 89 e5             	mov    %rsp,%rbp
  80322d:	48 83 ec 10          	sub    $0x10,%rsp
  803231:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803235:	89 75 f4             	mov    %esi,-0xc(%rbp)
  803238:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80323c:	8b 50 0c             	mov    0xc(%rax),%edx
  80323f:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803246:	00 00 00 
  803249:	89 10                	mov    %edx,(%rax)
  80324b:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803252:	00 00 00 
  803255:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803258:	89 50 04             	mov    %edx,0x4(%rax)
  80325b:	be 00 00 00 00       	mov    $0x0,%esi
  803260:	bf 02 00 00 00       	mov    $0x2,%edi
  803265:	48 b8 08 2e 80 00 00 	movabs $0x802e08,%rax
  80326c:	00 00 00 
  80326f:	ff d0                	callq  *%rax
  803271:	c9                   	leaveq 
  803272:	c3                   	retq   

0000000000803273 <remove>:
  803273:	55                   	push   %rbp
  803274:	48 89 e5             	mov    %rsp,%rbp
  803277:	48 83 ec 10          	sub    $0x10,%rsp
  80327b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80327f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803283:	48 89 c7             	mov    %rax,%rdi
  803286:	48 b8 43 13 80 00 00 	movabs $0x801343,%rax
  80328d:	00 00 00 
  803290:	ff d0                	callq  *%rax
  803292:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  803297:	7e 07                	jle    8032a0 <remove+0x2d>
  803299:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  80329e:	eb 33                	jmp    8032d3 <remove+0x60>
  8032a0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8032a4:	48 89 c6             	mov    %rax,%rsi
  8032a7:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  8032ae:	00 00 00 
  8032b1:	48 b8 af 13 80 00 00 	movabs $0x8013af,%rax
  8032b8:	00 00 00 
  8032bb:	ff d0                	callq  *%rax
  8032bd:	be 00 00 00 00       	mov    $0x0,%esi
  8032c2:	bf 07 00 00 00       	mov    $0x7,%edi
  8032c7:	48 b8 08 2e 80 00 00 	movabs $0x802e08,%rax
  8032ce:	00 00 00 
  8032d1:	ff d0                	callq  *%rax
  8032d3:	c9                   	leaveq 
  8032d4:	c3                   	retq   

00000000008032d5 <sync>:
  8032d5:	55                   	push   %rbp
  8032d6:	48 89 e5             	mov    %rsp,%rbp
  8032d9:	be 00 00 00 00       	mov    $0x0,%esi
  8032de:	bf 08 00 00 00       	mov    $0x8,%edi
  8032e3:	48 b8 08 2e 80 00 00 	movabs $0x802e08,%rax
  8032ea:	00 00 00 
  8032ed:	ff d0                	callq  *%rax
  8032ef:	5d                   	pop    %rbp
  8032f0:	c3                   	retq   

00000000008032f1 <copy>:
  8032f1:	55                   	push   %rbp
  8032f2:	48 89 e5             	mov    %rsp,%rbp
  8032f5:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  8032fc:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  803303:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  80330a:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  803311:	be 00 00 00 00       	mov    $0x0,%esi
  803316:	48 89 c7             	mov    %rax,%rdi
  803319:	48 b8 8f 2e 80 00 00 	movabs $0x802e8f,%rax
  803320:	00 00 00 
  803323:	ff d0                	callq  *%rax
  803325:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803328:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80332c:	79 28                	jns    803356 <copy+0x65>
  80332e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803331:	89 c6                	mov    %eax,%esi
  803333:	48 bf 4c 51 80 00 00 	movabs $0x80514c,%rdi
  80333a:	00 00 00 
  80333d:	b8 00 00 00 00       	mov    $0x0,%eax
  803342:	48 ba fa 07 80 00 00 	movabs $0x8007fa,%rdx
  803349:	00 00 00 
  80334c:	ff d2                	callq  *%rdx
  80334e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803351:	e9 74 01 00 00       	jmpq   8034ca <copy+0x1d9>
  803356:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  80335d:	be 01 01 00 00       	mov    $0x101,%esi
  803362:	48 89 c7             	mov    %rax,%rdi
  803365:	48 b8 8f 2e 80 00 00 	movabs $0x802e8f,%rax
  80336c:	00 00 00 
  80336f:	ff d0                	callq  *%rax
  803371:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803374:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803378:	79 39                	jns    8033b3 <copy+0xc2>
  80337a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80337d:	89 c6                	mov    %eax,%esi
  80337f:	48 bf 62 51 80 00 00 	movabs $0x805162,%rdi
  803386:	00 00 00 
  803389:	b8 00 00 00 00       	mov    $0x0,%eax
  80338e:	48 ba fa 07 80 00 00 	movabs $0x8007fa,%rdx
  803395:	00 00 00 
  803398:	ff d2                	callq  *%rdx
  80339a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80339d:	89 c7                	mov    %eax,%edi
  80339f:	48 b8 97 27 80 00 00 	movabs $0x802797,%rax
  8033a6:	00 00 00 
  8033a9:	ff d0                	callq  *%rax
  8033ab:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8033ae:	e9 17 01 00 00       	jmpq   8034ca <copy+0x1d9>
  8033b3:	eb 74                	jmp    803429 <copy+0x138>
  8033b5:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8033b8:	48 63 d0             	movslq %eax,%rdx
  8033bb:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  8033c2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8033c5:	48 89 ce             	mov    %rcx,%rsi
  8033c8:	89 c7                	mov    %eax,%edi
  8033ca:	48 b8 03 2b 80 00 00 	movabs $0x802b03,%rax
  8033d1:	00 00 00 
  8033d4:	ff d0                	callq  *%rax
  8033d6:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8033d9:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8033dd:	79 4a                	jns    803429 <copy+0x138>
  8033df:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8033e2:	89 c6                	mov    %eax,%esi
  8033e4:	48 bf 7c 51 80 00 00 	movabs $0x80517c,%rdi
  8033eb:	00 00 00 
  8033ee:	b8 00 00 00 00       	mov    $0x0,%eax
  8033f3:	48 ba fa 07 80 00 00 	movabs $0x8007fa,%rdx
  8033fa:	00 00 00 
  8033fd:	ff d2                	callq  *%rdx
  8033ff:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803402:	89 c7                	mov    %eax,%edi
  803404:	48 b8 97 27 80 00 00 	movabs $0x802797,%rax
  80340b:	00 00 00 
  80340e:	ff d0                	callq  *%rax
  803410:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803413:	89 c7                	mov    %eax,%edi
  803415:	48 b8 97 27 80 00 00 	movabs $0x802797,%rax
  80341c:	00 00 00 
  80341f:	ff d0                	callq  *%rax
  803421:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803424:	e9 a1 00 00 00       	jmpq   8034ca <copy+0x1d9>
  803429:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  803430:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803433:	ba 00 02 00 00       	mov    $0x200,%edx
  803438:	48 89 ce             	mov    %rcx,%rsi
  80343b:	89 c7                	mov    %eax,%edi
  80343d:	48 b8 b9 29 80 00 00 	movabs $0x8029b9,%rax
  803444:	00 00 00 
  803447:	ff d0                	callq  *%rax
  803449:	89 45 f4             	mov    %eax,-0xc(%rbp)
  80344c:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  803450:	0f 8f 5f ff ff ff    	jg     8033b5 <copy+0xc4>
  803456:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  80345a:	79 47                	jns    8034a3 <copy+0x1b2>
  80345c:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80345f:	89 c6                	mov    %eax,%esi
  803461:	48 bf 8f 51 80 00 00 	movabs $0x80518f,%rdi
  803468:	00 00 00 
  80346b:	b8 00 00 00 00       	mov    $0x0,%eax
  803470:	48 ba fa 07 80 00 00 	movabs $0x8007fa,%rdx
  803477:	00 00 00 
  80347a:	ff d2                	callq  *%rdx
  80347c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80347f:	89 c7                	mov    %eax,%edi
  803481:	48 b8 97 27 80 00 00 	movabs $0x802797,%rax
  803488:	00 00 00 
  80348b:	ff d0                	callq  *%rax
  80348d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803490:	89 c7                	mov    %eax,%edi
  803492:	48 b8 97 27 80 00 00 	movabs $0x802797,%rax
  803499:	00 00 00 
  80349c:	ff d0                	callq  *%rax
  80349e:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8034a1:	eb 27                	jmp    8034ca <copy+0x1d9>
  8034a3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034a6:	89 c7                	mov    %eax,%edi
  8034a8:	48 b8 97 27 80 00 00 	movabs $0x802797,%rax
  8034af:	00 00 00 
  8034b2:	ff d0                	callq  *%rax
  8034b4:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8034b7:	89 c7                	mov    %eax,%edi
  8034b9:	48 b8 97 27 80 00 00 	movabs $0x802797,%rax
  8034c0:	00 00 00 
  8034c3:	ff d0                	callq  *%rax
  8034c5:	b8 00 00 00 00       	mov    $0x0,%eax
  8034ca:	c9                   	leaveq 
  8034cb:	c3                   	retq   

00000000008034cc <writebuf>:
  8034cc:	55                   	push   %rbp
  8034cd:	48 89 e5             	mov    %rsp,%rbp
  8034d0:	48 83 ec 20          	sub    $0x20,%rsp
  8034d4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8034d8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8034dc:	8b 40 0c             	mov    0xc(%rax),%eax
  8034df:	85 c0                	test   %eax,%eax
  8034e1:	7e 67                	jle    80354a <writebuf+0x7e>
  8034e3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8034e7:	8b 40 04             	mov    0x4(%rax),%eax
  8034ea:	48 63 d0             	movslq %eax,%rdx
  8034ed:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8034f1:	48 8d 48 10          	lea    0x10(%rax),%rcx
  8034f5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8034f9:	8b 00                	mov    (%rax),%eax
  8034fb:	48 89 ce             	mov    %rcx,%rsi
  8034fe:	89 c7                	mov    %eax,%edi
  803500:	48 b8 03 2b 80 00 00 	movabs $0x802b03,%rax
  803507:	00 00 00 
  80350a:	ff d0                	callq  *%rax
  80350c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80350f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803513:	7e 13                	jle    803528 <writebuf+0x5c>
  803515:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803519:	8b 50 08             	mov    0x8(%rax),%edx
  80351c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80351f:	01 c2                	add    %eax,%edx
  803521:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803525:	89 50 08             	mov    %edx,0x8(%rax)
  803528:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80352c:	8b 40 04             	mov    0x4(%rax),%eax
  80352f:	3b 45 fc             	cmp    -0x4(%rbp),%eax
  803532:	74 16                	je     80354a <writebuf+0x7e>
  803534:	b8 00 00 00 00       	mov    $0x0,%eax
  803539:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80353d:	0f 4e 45 fc          	cmovle -0x4(%rbp),%eax
  803541:	89 c2                	mov    %eax,%edx
  803543:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803547:	89 50 0c             	mov    %edx,0xc(%rax)
  80354a:	c9                   	leaveq 
  80354b:	c3                   	retq   

000000000080354c <putch>:
  80354c:	55                   	push   %rbp
  80354d:	48 89 e5             	mov    %rsp,%rbp
  803550:	48 83 ec 20          	sub    $0x20,%rsp
  803554:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803557:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80355b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80355f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803563:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803567:	8b 40 04             	mov    0x4(%rax),%eax
  80356a:	8d 48 01             	lea    0x1(%rax),%ecx
  80356d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  803571:	89 4a 04             	mov    %ecx,0x4(%rdx)
  803574:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803577:	89 d1                	mov    %edx,%ecx
  803579:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80357d:	48 98                	cltq   
  80357f:	88 4c 02 10          	mov    %cl,0x10(%rdx,%rax,1)
  803583:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803587:	8b 40 04             	mov    0x4(%rax),%eax
  80358a:	3d 00 01 00 00       	cmp    $0x100,%eax
  80358f:	75 1e                	jne    8035af <putch+0x63>
  803591:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803595:	48 89 c7             	mov    %rax,%rdi
  803598:	48 b8 cc 34 80 00 00 	movabs $0x8034cc,%rax
  80359f:	00 00 00 
  8035a2:	ff d0                	callq  *%rax
  8035a4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8035a8:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%rax)
  8035af:	c9                   	leaveq 
  8035b0:	c3                   	retq   

00000000008035b1 <vfprintf>:
  8035b1:	55                   	push   %rbp
  8035b2:	48 89 e5             	mov    %rsp,%rbp
  8035b5:	48 81 ec 30 01 00 00 	sub    $0x130,%rsp
  8035bc:	89 bd ec fe ff ff    	mov    %edi,-0x114(%rbp)
  8035c2:	48 89 b5 e0 fe ff ff 	mov    %rsi,-0x120(%rbp)
  8035c9:	48 89 95 d8 fe ff ff 	mov    %rdx,-0x128(%rbp)
  8035d0:	8b 85 ec fe ff ff    	mov    -0x114(%rbp),%eax
  8035d6:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%rbp)
  8035dc:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  8035e3:	00 00 00 
  8035e6:	c7 85 f8 fe ff ff 00 	movl   $0x0,-0x108(%rbp)
  8035ed:	00 00 00 
  8035f0:	c7 85 fc fe ff ff 01 	movl   $0x1,-0x104(%rbp)
  8035f7:	00 00 00 
  8035fa:	48 8b 8d d8 fe ff ff 	mov    -0x128(%rbp),%rcx
  803601:	48 8b 95 e0 fe ff ff 	mov    -0x120(%rbp),%rdx
  803608:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  80360f:	48 89 c6             	mov    %rax,%rsi
  803612:	48 bf 4c 35 80 00 00 	movabs $0x80354c,%rdi
  803619:	00 00 00 
  80361c:	48 b8 ad 0b 80 00 00 	movabs $0x800bad,%rax
  803623:	00 00 00 
  803626:	ff d0                	callq  *%rax
  803628:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  80362e:	85 c0                	test   %eax,%eax
  803630:	7e 16                	jle    803648 <vfprintf+0x97>
  803632:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  803639:	48 89 c7             	mov    %rax,%rdi
  80363c:	48 b8 cc 34 80 00 00 	movabs $0x8034cc,%rax
  803643:	00 00 00 
  803646:	ff d0                	callq  *%rax
  803648:	8b 85 f8 fe ff ff    	mov    -0x108(%rbp),%eax
  80364e:	85 c0                	test   %eax,%eax
  803650:	74 08                	je     80365a <vfprintf+0xa9>
  803652:	8b 85 f8 fe ff ff    	mov    -0x108(%rbp),%eax
  803658:	eb 06                	jmp    803660 <vfprintf+0xaf>
  80365a:	8b 85 fc fe ff ff    	mov    -0x104(%rbp),%eax
  803660:	c9                   	leaveq 
  803661:	c3                   	retq   

0000000000803662 <fprintf>:
  803662:	55                   	push   %rbp
  803663:	48 89 e5             	mov    %rsp,%rbp
  803666:	48 81 ec e0 00 00 00 	sub    $0xe0,%rsp
  80366d:	89 bd 2c ff ff ff    	mov    %edi,-0xd4(%rbp)
  803673:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  80367a:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  803681:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  803688:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  80368f:	84 c0                	test   %al,%al
  803691:	74 20                	je     8036b3 <fprintf+0x51>
  803693:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  803697:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80369b:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  80369f:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8036a3:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8036a7:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8036ab:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8036af:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8036b3:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  8036ba:	c7 85 30 ff ff ff 10 	movl   $0x10,-0xd0(%rbp)
  8036c1:	00 00 00 
  8036c4:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8036cb:	00 00 00 
  8036ce:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8036d2:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8036d9:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8036e0:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8036e7:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8036ee:	48 8b 8d 20 ff ff ff 	mov    -0xe0(%rbp),%rcx
  8036f5:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  8036fb:	48 89 ce             	mov    %rcx,%rsi
  8036fe:	89 c7                	mov    %eax,%edi
  803700:	48 b8 b1 35 80 00 00 	movabs $0x8035b1,%rax
  803707:	00 00 00 
  80370a:	ff d0                	callq  *%rax
  80370c:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  803712:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  803718:	c9                   	leaveq 
  803719:	c3                   	retq   

000000000080371a <printf>:
  80371a:	55                   	push   %rbp
  80371b:	48 89 e5             	mov    %rsp,%rbp
  80371e:	48 81 ec e0 00 00 00 	sub    $0xe0,%rsp
  803725:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  80372c:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  803733:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  80373a:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  803741:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  803748:	84 c0                	test   %al,%al
  80374a:	74 20                	je     80376c <printf+0x52>
  80374c:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  803750:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  803754:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  803758:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  80375c:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  803760:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  803764:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  803768:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  80376c:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  803773:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  80377a:	00 00 00 
  80377d:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  803784:	00 00 00 
  803787:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80378b:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  803792:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  803799:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8037a0:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8037a7:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  8037ae:	48 89 c6             	mov    %rax,%rsi
  8037b1:	bf 01 00 00 00       	mov    $0x1,%edi
  8037b6:	48 b8 b1 35 80 00 00 	movabs $0x8035b1,%rax
  8037bd:	00 00 00 
  8037c0:	ff d0                	callq  *%rax
  8037c2:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  8037c8:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  8037ce:	c9                   	leaveq 
  8037cf:	c3                   	retq   

00000000008037d0 <fd2sockid>:
  8037d0:	55                   	push   %rbp
  8037d1:	48 89 e5             	mov    %rsp,%rbp
  8037d4:	48 83 ec 20          	sub    $0x20,%rsp
  8037d8:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8037db:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8037df:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8037e2:	48 89 d6             	mov    %rdx,%rsi
  8037e5:	89 c7                	mov    %eax,%edi
  8037e7:	48 b8 87 25 80 00 00 	movabs $0x802587,%rax
  8037ee:	00 00 00 
  8037f1:	ff d0                	callq  *%rax
  8037f3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8037f6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8037fa:	79 05                	jns    803801 <fd2sockid+0x31>
  8037fc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037ff:	eb 24                	jmp    803825 <fd2sockid+0x55>
  803801:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803805:	8b 10                	mov    (%rax),%edx
  803807:	48 b8 a0 70 80 00 00 	movabs $0x8070a0,%rax
  80380e:	00 00 00 
  803811:	8b 00                	mov    (%rax),%eax
  803813:	39 c2                	cmp    %eax,%edx
  803815:	74 07                	je     80381e <fd2sockid+0x4e>
  803817:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80381c:	eb 07                	jmp    803825 <fd2sockid+0x55>
  80381e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803822:	8b 40 0c             	mov    0xc(%rax),%eax
  803825:	c9                   	leaveq 
  803826:	c3                   	retq   

0000000000803827 <alloc_sockfd>:
  803827:	55                   	push   %rbp
  803828:	48 89 e5             	mov    %rsp,%rbp
  80382b:	48 83 ec 20          	sub    $0x20,%rsp
  80382f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803832:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803836:	48 89 c7             	mov    %rax,%rdi
  803839:	48 b8 ef 24 80 00 00 	movabs $0x8024ef,%rax
  803840:	00 00 00 
  803843:	ff d0                	callq  *%rax
  803845:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803848:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80384c:	78 26                	js     803874 <alloc_sockfd+0x4d>
  80384e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803852:	ba 07 04 00 00       	mov    $0x407,%edx
  803857:	48 89 c6             	mov    %rax,%rsi
  80385a:	bf 00 00 00 00       	mov    $0x0,%edi
  80385f:	48 b8 de 1c 80 00 00 	movabs $0x801cde,%rax
  803866:	00 00 00 
  803869:	ff d0                	callq  *%rax
  80386b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80386e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803872:	79 16                	jns    80388a <alloc_sockfd+0x63>
  803874:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803877:	89 c7                	mov    %eax,%edi
  803879:	48 b8 34 3d 80 00 00 	movabs $0x803d34,%rax
  803880:	00 00 00 
  803883:	ff d0                	callq  *%rax
  803885:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803888:	eb 3a                	jmp    8038c4 <alloc_sockfd+0x9d>
  80388a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80388e:	48 ba a0 70 80 00 00 	movabs $0x8070a0,%rdx
  803895:	00 00 00 
  803898:	8b 12                	mov    (%rdx),%edx
  80389a:	89 10                	mov    %edx,(%rax)
  80389c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8038a0:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8038a7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8038ab:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8038ae:	89 50 0c             	mov    %edx,0xc(%rax)
  8038b1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8038b5:	48 89 c7             	mov    %rax,%rdi
  8038b8:	48 b8 a1 24 80 00 00 	movabs $0x8024a1,%rax
  8038bf:	00 00 00 
  8038c2:	ff d0                	callq  *%rax
  8038c4:	c9                   	leaveq 
  8038c5:	c3                   	retq   

00000000008038c6 <accept>:
  8038c6:	55                   	push   %rbp
  8038c7:	48 89 e5             	mov    %rsp,%rbp
  8038ca:	48 83 ec 30          	sub    $0x30,%rsp
  8038ce:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8038d1:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8038d5:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8038d9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8038dc:	89 c7                	mov    %eax,%edi
  8038de:	48 b8 d0 37 80 00 00 	movabs $0x8037d0,%rax
  8038e5:	00 00 00 
  8038e8:	ff d0                	callq  *%rax
  8038ea:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8038ed:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8038f1:	79 05                	jns    8038f8 <accept+0x32>
  8038f3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038f6:	eb 3b                	jmp    803933 <accept+0x6d>
  8038f8:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8038fc:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803900:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803903:	48 89 ce             	mov    %rcx,%rsi
  803906:	89 c7                	mov    %eax,%edi
  803908:	48 b8 11 3c 80 00 00 	movabs $0x803c11,%rax
  80390f:	00 00 00 
  803912:	ff d0                	callq  *%rax
  803914:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803917:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80391b:	79 05                	jns    803922 <accept+0x5c>
  80391d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803920:	eb 11                	jmp    803933 <accept+0x6d>
  803922:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803925:	89 c7                	mov    %eax,%edi
  803927:	48 b8 27 38 80 00 00 	movabs $0x803827,%rax
  80392e:	00 00 00 
  803931:	ff d0                	callq  *%rax
  803933:	c9                   	leaveq 
  803934:	c3                   	retq   

0000000000803935 <bind>:
  803935:	55                   	push   %rbp
  803936:	48 89 e5             	mov    %rsp,%rbp
  803939:	48 83 ec 20          	sub    $0x20,%rsp
  80393d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803940:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803944:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803947:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80394a:	89 c7                	mov    %eax,%edi
  80394c:	48 b8 d0 37 80 00 00 	movabs $0x8037d0,%rax
  803953:	00 00 00 
  803956:	ff d0                	callq  *%rax
  803958:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80395b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80395f:	79 05                	jns    803966 <bind+0x31>
  803961:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803964:	eb 1b                	jmp    803981 <bind+0x4c>
  803966:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803969:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80396d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803970:	48 89 ce             	mov    %rcx,%rsi
  803973:	89 c7                	mov    %eax,%edi
  803975:	48 b8 90 3c 80 00 00 	movabs $0x803c90,%rax
  80397c:	00 00 00 
  80397f:	ff d0                	callq  *%rax
  803981:	c9                   	leaveq 
  803982:	c3                   	retq   

0000000000803983 <shutdown>:
  803983:	55                   	push   %rbp
  803984:	48 89 e5             	mov    %rsp,%rbp
  803987:	48 83 ec 20          	sub    $0x20,%rsp
  80398b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80398e:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803991:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803994:	89 c7                	mov    %eax,%edi
  803996:	48 b8 d0 37 80 00 00 	movabs $0x8037d0,%rax
  80399d:	00 00 00 
  8039a0:	ff d0                	callq  *%rax
  8039a2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8039a5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8039a9:	79 05                	jns    8039b0 <shutdown+0x2d>
  8039ab:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039ae:	eb 16                	jmp    8039c6 <shutdown+0x43>
  8039b0:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8039b3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039b6:	89 d6                	mov    %edx,%esi
  8039b8:	89 c7                	mov    %eax,%edi
  8039ba:	48 b8 f4 3c 80 00 00 	movabs $0x803cf4,%rax
  8039c1:	00 00 00 
  8039c4:	ff d0                	callq  *%rax
  8039c6:	c9                   	leaveq 
  8039c7:	c3                   	retq   

00000000008039c8 <devsock_close>:
  8039c8:	55                   	push   %rbp
  8039c9:	48 89 e5             	mov    %rsp,%rbp
  8039cc:	48 83 ec 10          	sub    $0x10,%rsp
  8039d0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8039d4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8039d8:	48 89 c7             	mov    %rax,%rdi
  8039db:	48 b8 21 4a 80 00 00 	movabs $0x804a21,%rax
  8039e2:	00 00 00 
  8039e5:	ff d0                	callq  *%rax
  8039e7:	83 f8 01             	cmp    $0x1,%eax
  8039ea:	75 17                	jne    803a03 <devsock_close+0x3b>
  8039ec:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8039f0:	8b 40 0c             	mov    0xc(%rax),%eax
  8039f3:	89 c7                	mov    %eax,%edi
  8039f5:	48 b8 34 3d 80 00 00 	movabs $0x803d34,%rax
  8039fc:	00 00 00 
  8039ff:	ff d0                	callq  *%rax
  803a01:	eb 05                	jmp    803a08 <devsock_close+0x40>
  803a03:	b8 00 00 00 00       	mov    $0x0,%eax
  803a08:	c9                   	leaveq 
  803a09:	c3                   	retq   

0000000000803a0a <connect>:
  803a0a:	55                   	push   %rbp
  803a0b:	48 89 e5             	mov    %rsp,%rbp
  803a0e:	48 83 ec 20          	sub    $0x20,%rsp
  803a12:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803a15:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803a19:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803a1c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803a1f:	89 c7                	mov    %eax,%edi
  803a21:	48 b8 d0 37 80 00 00 	movabs $0x8037d0,%rax
  803a28:	00 00 00 
  803a2b:	ff d0                	callq  *%rax
  803a2d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803a30:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803a34:	79 05                	jns    803a3b <connect+0x31>
  803a36:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a39:	eb 1b                	jmp    803a56 <connect+0x4c>
  803a3b:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803a3e:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803a42:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a45:	48 89 ce             	mov    %rcx,%rsi
  803a48:	89 c7                	mov    %eax,%edi
  803a4a:	48 b8 61 3d 80 00 00 	movabs $0x803d61,%rax
  803a51:	00 00 00 
  803a54:	ff d0                	callq  *%rax
  803a56:	c9                   	leaveq 
  803a57:	c3                   	retq   

0000000000803a58 <listen>:
  803a58:	55                   	push   %rbp
  803a59:	48 89 e5             	mov    %rsp,%rbp
  803a5c:	48 83 ec 20          	sub    $0x20,%rsp
  803a60:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803a63:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803a66:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803a69:	89 c7                	mov    %eax,%edi
  803a6b:	48 b8 d0 37 80 00 00 	movabs $0x8037d0,%rax
  803a72:	00 00 00 
  803a75:	ff d0                	callq  *%rax
  803a77:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803a7a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803a7e:	79 05                	jns    803a85 <listen+0x2d>
  803a80:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a83:	eb 16                	jmp    803a9b <listen+0x43>
  803a85:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803a88:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a8b:	89 d6                	mov    %edx,%esi
  803a8d:	89 c7                	mov    %eax,%edi
  803a8f:	48 b8 c5 3d 80 00 00 	movabs $0x803dc5,%rax
  803a96:	00 00 00 
  803a99:	ff d0                	callq  *%rax
  803a9b:	c9                   	leaveq 
  803a9c:	c3                   	retq   

0000000000803a9d <devsock_read>:
  803a9d:	55                   	push   %rbp
  803a9e:	48 89 e5             	mov    %rsp,%rbp
  803aa1:	48 83 ec 20          	sub    $0x20,%rsp
  803aa5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803aa9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803aad:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803ab1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803ab5:	89 c2                	mov    %eax,%edx
  803ab7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803abb:	8b 40 0c             	mov    0xc(%rax),%eax
  803abe:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803ac2:	b9 00 00 00 00       	mov    $0x0,%ecx
  803ac7:	89 c7                	mov    %eax,%edi
  803ac9:	48 b8 05 3e 80 00 00 	movabs $0x803e05,%rax
  803ad0:	00 00 00 
  803ad3:	ff d0                	callq  *%rax
  803ad5:	c9                   	leaveq 
  803ad6:	c3                   	retq   

0000000000803ad7 <devsock_write>:
  803ad7:	55                   	push   %rbp
  803ad8:	48 89 e5             	mov    %rsp,%rbp
  803adb:	48 83 ec 20          	sub    $0x20,%rsp
  803adf:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803ae3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803ae7:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803aeb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803aef:	89 c2                	mov    %eax,%edx
  803af1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803af5:	8b 40 0c             	mov    0xc(%rax),%eax
  803af8:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803afc:	b9 00 00 00 00       	mov    $0x0,%ecx
  803b01:	89 c7                	mov    %eax,%edi
  803b03:	48 b8 d1 3e 80 00 00 	movabs $0x803ed1,%rax
  803b0a:	00 00 00 
  803b0d:	ff d0                	callq  *%rax
  803b0f:	c9                   	leaveq 
  803b10:	c3                   	retq   

0000000000803b11 <devsock_stat>:
  803b11:	55                   	push   %rbp
  803b12:	48 89 e5             	mov    %rsp,%rbp
  803b15:	48 83 ec 10          	sub    $0x10,%rsp
  803b19:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803b1d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803b21:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b25:	48 be aa 51 80 00 00 	movabs $0x8051aa,%rsi
  803b2c:	00 00 00 
  803b2f:	48 89 c7             	mov    %rax,%rdi
  803b32:	48 b8 af 13 80 00 00 	movabs $0x8013af,%rax
  803b39:	00 00 00 
  803b3c:	ff d0                	callq  *%rax
  803b3e:	b8 00 00 00 00       	mov    $0x0,%eax
  803b43:	c9                   	leaveq 
  803b44:	c3                   	retq   

0000000000803b45 <socket>:
  803b45:	55                   	push   %rbp
  803b46:	48 89 e5             	mov    %rsp,%rbp
  803b49:	48 83 ec 20          	sub    $0x20,%rsp
  803b4d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803b50:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803b53:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  803b56:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803b59:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803b5c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803b5f:	89 ce                	mov    %ecx,%esi
  803b61:	89 c7                	mov    %eax,%edi
  803b63:	48 b8 89 3f 80 00 00 	movabs $0x803f89,%rax
  803b6a:	00 00 00 
  803b6d:	ff d0                	callq  *%rax
  803b6f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803b72:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803b76:	79 05                	jns    803b7d <socket+0x38>
  803b78:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b7b:	eb 11                	jmp    803b8e <socket+0x49>
  803b7d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b80:	89 c7                	mov    %eax,%edi
  803b82:	48 b8 27 38 80 00 00 	movabs $0x803827,%rax
  803b89:	00 00 00 
  803b8c:	ff d0                	callq  *%rax
  803b8e:	c9                   	leaveq 
  803b8f:	c3                   	retq   

0000000000803b90 <nsipc>:
  803b90:	55                   	push   %rbp
  803b91:	48 89 e5             	mov    %rsp,%rbp
  803b94:	48 83 ec 10          	sub    $0x10,%rsp
  803b98:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803b9b:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803ba2:	00 00 00 
  803ba5:	8b 00                	mov    (%rax),%eax
  803ba7:	85 c0                	test   %eax,%eax
  803ba9:	75 1d                	jne    803bc8 <nsipc+0x38>
  803bab:	bf 02 00 00 00       	mov    $0x2,%edi
  803bb0:	48 b8 af 49 80 00 00 	movabs $0x8049af,%rax
  803bb7:	00 00 00 
  803bba:	ff d0                	callq  *%rax
  803bbc:	48 ba 04 80 80 00 00 	movabs $0x808004,%rdx
  803bc3:	00 00 00 
  803bc6:	89 02                	mov    %eax,(%rdx)
  803bc8:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803bcf:	00 00 00 
  803bd2:	8b 00                	mov    (%rax),%eax
  803bd4:	8b 75 fc             	mov    -0x4(%rbp),%esi
  803bd7:	b9 07 00 00 00       	mov    $0x7,%ecx
  803bdc:	48 ba 00 b0 80 00 00 	movabs $0x80b000,%rdx
  803be3:	00 00 00 
  803be6:	89 c7                	mov    %eax,%edi
  803be8:	48 b8 19 49 80 00 00 	movabs $0x804919,%rax
  803bef:	00 00 00 
  803bf2:	ff d0                	callq  *%rax
  803bf4:	ba 00 00 00 00       	mov    $0x0,%edx
  803bf9:	be 00 00 00 00       	mov    $0x0,%esi
  803bfe:	bf 00 00 00 00       	mov    $0x0,%edi
  803c03:	48 b8 58 48 80 00 00 	movabs $0x804858,%rax
  803c0a:	00 00 00 
  803c0d:	ff d0                	callq  *%rax
  803c0f:	c9                   	leaveq 
  803c10:	c3                   	retq   

0000000000803c11 <nsipc_accept>:
  803c11:	55                   	push   %rbp
  803c12:	48 89 e5             	mov    %rsp,%rbp
  803c15:	48 83 ec 30          	sub    $0x30,%rsp
  803c19:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803c1c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803c20:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803c24:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c2b:	00 00 00 
  803c2e:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803c31:	89 10                	mov    %edx,(%rax)
  803c33:	bf 01 00 00 00       	mov    $0x1,%edi
  803c38:	48 b8 90 3b 80 00 00 	movabs $0x803b90,%rax
  803c3f:	00 00 00 
  803c42:	ff d0                	callq  *%rax
  803c44:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803c47:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803c4b:	78 3e                	js     803c8b <nsipc_accept+0x7a>
  803c4d:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c54:	00 00 00 
  803c57:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803c5b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803c5f:	8b 40 10             	mov    0x10(%rax),%eax
  803c62:	89 c2                	mov    %eax,%edx
  803c64:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  803c68:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803c6c:	48 89 ce             	mov    %rcx,%rsi
  803c6f:	48 89 c7             	mov    %rax,%rdi
  803c72:	48 b8 d3 16 80 00 00 	movabs $0x8016d3,%rax
  803c79:	00 00 00 
  803c7c:	ff d0                	callq  *%rax
  803c7e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803c82:	8b 50 10             	mov    0x10(%rax),%edx
  803c85:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803c89:	89 10                	mov    %edx,(%rax)
  803c8b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c8e:	c9                   	leaveq 
  803c8f:	c3                   	retq   

0000000000803c90 <nsipc_bind>:
  803c90:	55                   	push   %rbp
  803c91:	48 89 e5             	mov    %rsp,%rbp
  803c94:	48 83 ec 10          	sub    $0x10,%rsp
  803c98:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803c9b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803c9f:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803ca2:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803ca9:	00 00 00 
  803cac:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803caf:	89 10                	mov    %edx,(%rax)
  803cb1:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803cb4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803cb8:	48 89 c6             	mov    %rax,%rsi
  803cbb:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803cc2:	00 00 00 
  803cc5:	48 b8 d3 16 80 00 00 	movabs $0x8016d3,%rax
  803ccc:	00 00 00 
  803ccf:	ff d0                	callq  *%rax
  803cd1:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803cd8:	00 00 00 
  803cdb:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803cde:	89 50 14             	mov    %edx,0x14(%rax)
  803ce1:	bf 02 00 00 00       	mov    $0x2,%edi
  803ce6:	48 b8 90 3b 80 00 00 	movabs $0x803b90,%rax
  803ced:	00 00 00 
  803cf0:	ff d0                	callq  *%rax
  803cf2:	c9                   	leaveq 
  803cf3:	c3                   	retq   

0000000000803cf4 <nsipc_shutdown>:
  803cf4:	55                   	push   %rbp
  803cf5:	48 89 e5             	mov    %rsp,%rbp
  803cf8:	48 83 ec 10          	sub    $0x10,%rsp
  803cfc:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803cff:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803d02:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d09:	00 00 00 
  803d0c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803d0f:	89 10                	mov    %edx,(%rax)
  803d11:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d18:	00 00 00 
  803d1b:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803d1e:	89 50 04             	mov    %edx,0x4(%rax)
  803d21:	bf 03 00 00 00       	mov    $0x3,%edi
  803d26:	48 b8 90 3b 80 00 00 	movabs $0x803b90,%rax
  803d2d:	00 00 00 
  803d30:	ff d0                	callq  *%rax
  803d32:	c9                   	leaveq 
  803d33:	c3                   	retq   

0000000000803d34 <nsipc_close>:
  803d34:	55                   	push   %rbp
  803d35:	48 89 e5             	mov    %rsp,%rbp
  803d38:	48 83 ec 10          	sub    $0x10,%rsp
  803d3c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803d3f:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d46:	00 00 00 
  803d49:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803d4c:	89 10                	mov    %edx,(%rax)
  803d4e:	bf 04 00 00 00       	mov    $0x4,%edi
  803d53:	48 b8 90 3b 80 00 00 	movabs $0x803b90,%rax
  803d5a:	00 00 00 
  803d5d:	ff d0                	callq  *%rax
  803d5f:	c9                   	leaveq 
  803d60:	c3                   	retq   

0000000000803d61 <nsipc_connect>:
  803d61:	55                   	push   %rbp
  803d62:	48 89 e5             	mov    %rsp,%rbp
  803d65:	48 83 ec 10          	sub    $0x10,%rsp
  803d69:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803d6c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803d70:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803d73:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d7a:	00 00 00 
  803d7d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803d80:	89 10                	mov    %edx,(%rax)
  803d82:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803d85:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803d89:	48 89 c6             	mov    %rax,%rsi
  803d8c:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803d93:	00 00 00 
  803d96:	48 b8 d3 16 80 00 00 	movabs $0x8016d3,%rax
  803d9d:	00 00 00 
  803da0:	ff d0                	callq  *%rax
  803da2:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803da9:	00 00 00 
  803dac:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803daf:	89 50 14             	mov    %edx,0x14(%rax)
  803db2:	bf 05 00 00 00       	mov    $0x5,%edi
  803db7:	48 b8 90 3b 80 00 00 	movabs $0x803b90,%rax
  803dbe:	00 00 00 
  803dc1:	ff d0                	callq  *%rax
  803dc3:	c9                   	leaveq 
  803dc4:	c3                   	retq   

0000000000803dc5 <nsipc_listen>:
  803dc5:	55                   	push   %rbp
  803dc6:	48 89 e5             	mov    %rsp,%rbp
  803dc9:	48 83 ec 10          	sub    $0x10,%rsp
  803dcd:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803dd0:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803dd3:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803dda:	00 00 00 
  803ddd:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803de0:	89 10                	mov    %edx,(%rax)
  803de2:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803de9:	00 00 00 
  803dec:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803def:	89 50 04             	mov    %edx,0x4(%rax)
  803df2:	bf 06 00 00 00       	mov    $0x6,%edi
  803df7:	48 b8 90 3b 80 00 00 	movabs $0x803b90,%rax
  803dfe:	00 00 00 
  803e01:	ff d0                	callq  *%rax
  803e03:	c9                   	leaveq 
  803e04:	c3                   	retq   

0000000000803e05 <nsipc_recv>:
  803e05:	55                   	push   %rbp
  803e06:	48 89 e5             	mov    %rsp,%rbp
  803e09:	48 83 ec 30          	sub    $0x30,%rsp
  803e0d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803e10:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803e14:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803e17:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  803e1a:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e21:	00 00 00 
  803e24:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803e27:	89 10                	mov    %edx,(%rax)
  803e29:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e30:	00 00 00 
  803e33:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803e36:	89 50 04             	mov    %edx,0x4(%rax)
  803e39:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e40:	00 00 00 
  803e43:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803e46:	89 50 08             	mov    %edx,0x8(%rax)
  803e49:	bf 07 00 00 00       	mov    $0x7,%edi
  803e4e:	48 b8 90 3b 80 00 00 	movabs $0x803b90,%rax
  803e55:	00 00 00 
  803e58:	ff d0                	callq  *%rax
  803e5a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803e5d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803e61:	78 69                	js     803ecc <nsipc_recv+0xc7>
  803e63:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  803e6a:	7f 08                	jg     803e74 <nsipc_recv+0x6f>
  803e6c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e6f:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  803e72:	7e 35                	jle    803ea9 <nsipc_recv+0xa4>
  803e74:	48 b9 b1 51 80 00 00 	movabs $0x8051b1,%rcx
  803e7b:	00 00 00 
  803e7e:	48 ba c6 51 80 00 00 	movabs $0x8051c6,%rdx
  803e85:	00 00 00 
  803e88:	be 62 00 00 00       	mov    $0x62,%esi
  803e8d:	48 bf db 51 80 00 00 	movabs $0x8051db,%rdi
  803e94:	00 00 00 
  803e97:	b8 00 00 00 00       	mov    $0x0,%eax
  803e9c:	49 b8 c1 05 80 00 00 	movabs $0x8005c1,%r8
  803ea3:	00 00 00 
  803ea6:	41 ff d0             	callq  *%r8
  803ea9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803eac:	48 63 d0             	movslq %eax,%rdx
  803eaf:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803eb3:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  803eba:	00 00 00 
  803ebd:	48 89 c7             	mov    %rax,%rdi
  803ec0:	48 b8 d3 16 80 00 00 	movabs $0x8016d3,%rax
  803ec7:	00 00 00 
  803eca:	ff d0                	callq  *%rax
  803ecc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ecf:	c9                   	leaveq 
  803ed0:	c3                   	retq   

0000000000803ed1 <nsipc_send>:
  803ed1:	55                   	push   %rbp
  803ed2:	48 89 e5             	mov    %rsp,%rbp
  803ed5:	48 83 ec 20          	sub    $0x20,%rsp
  803ed9:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803edc:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803ee0:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803ee3:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  803ee6:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803eed:	00 00 00 
  803ef0:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803ef3:	89 10                	mov    %edx,(%rax)
  803ef5:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  803efc:	7e 35                	jle    803f33 <nsipc_send+0x62>
  803efe:	48 b9 ea 51 80 00 00 	movabs $0x8051ea,%rcx
  803f05:	00 00 00 
  803f08:	48 ba c6 51 80 00 00 	movabs $0x8051c6,%rdx
  803f0f:	00 00 00 
  803f12:	be 6d 00 00 00       	mov    $0x6d,%esi
  803f17:	48 bf db 51 80 00 00 	movabs $0x8051db,%rdi
  803f1e:	00 00 00 
  803f21:	b8 00 00 00 00       	mov    $0x0,%eax
  803f26:	49 b8 c1 05 80 00 00 	movabs $0x8005c1,%r8
  803f2d:	00 00 00 
  803f30:	41 ff d0             	callq  *%r8
  803f33:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803f36:	48 63 d0             	movslq %eax,%rdx
  803f39:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f3d:	48 89 c6             	mov    %rax,%rsi
  803f40:	48 bf 0c b0 80 00 00 	movabs $0x80b00c,%rdi
  803f47:	00 00 00 
  803f4a:	48 b8 d3 16 80 00 00 	movabs $0x8016d3,%rax
  803f51:	00 00 00 
  803f54:	ff d0                	callq  *%rax
  803f56:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803f5d:	00 00 00 
  803f60:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803f63:	89 50 04             	mov    %edx,0x4(%rax)
  803f66:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803f6d:	00 00 00 
  803f70:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803f73:	89 50 08             	mov    %edx,0x8(%rax)
  803f76:	bf 08 00 00 00       	mov    $0x8,%edi
  803f7b:	48 b8 90 3b 80 00 00 	movabs $0x803b90,%rax
  803f82:	00 00 00 
  803f85:	ff d0                	callq  *%rax
  803f87:	c9                   	leaveq 
  803f88:	c3                   	retq   

0000000000803f89 <nsipc_socket>:
  803f89:	55                   	push   %rbp
  803f8a:	48 89 e5             	mov    %rsp,%rbp
  803f8d:	48 83 ec 10          	sub    $0x10,%rsp
  803f91:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803f94:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803f97:	89 55 f4             	mov    %edx,-0xc(%rbp)
  803f9a:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803fa1:	00 00 00 
  803fa4:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803fa7:	89 10                	mov    %edx,(%rax)
  803fa9:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803fb0:	00 00 00 
  803fb3:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803fb6:	89 50 04             	mov    %edx,0x4(%rax)
  803fb9:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803fc0:	00 00 00 
  803fc3:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803fc6:	89 50 08             	mov    %edx,0x8(%rax)
  803fc9:	bf 09 00 00 00       	mov    $0x9,%edi
  803fce:	48 b8 90 3b 80 00 00 	movabs $0x803b90,%rax
  803fd5:	00 00 00 
  803fd8:	ff d0                	callq  *%rax
  803fda:	c9                   	leaveq 
  803fdb:	c3                   	retq   

0000000000803fdc <pipe>:
  803fdc:	55                   	push   %rbp
  803fdd:	48 89 e5             	mov    %rsp,%rbp
  803fe0:	53                   	push   %rbx
  803fe1:	48 83 ec 38          	sub    $0x38,%rsp
  803fe5:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  803fe9:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  803fed:	48 89 c7             	mov    %rax,%rdi
  803ff0:	48 b8 ef 24 80 00 00 	movabs $0x8024ef,%rax
  803ff7:	00 00 00 
  803ffa:	ff d0                	callq  *%rax
  803ffc:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803fff:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804003:	0f 88 bf 01 00 00    	js     8041c8 <pipe+0x1ec>
  804009:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80400d:	ba 07 04 00 00       	mov    $0x407,%edx
  804012:	48 89 c6             	mov    %rax,%rsi
  804015:	bf 00 00 00 00       	mov    $0x0,%edi
  80401a:	48 b8 de 1c 80 00 00 	movabs $0x801cde,%rax
  804021:	00 00 00 
  804024:	ff d0                	callq  *%rax
  804026:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804029:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80402d:	0f 88 95 01 00 00    	js     8041c8 <pipe+0x1ec>
  804033:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  804037:	48 89 c7             	mov    %rax,%rdi
  80403a:	48 b8 ef 24 80 00 00 	movabs $0x8024ef,%rax
  804041:	00 00 00 
  804044:	ff d0                	callq  *%rax
  804046:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804049:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80404d:	0f 88 5d 01 00 00    	js     8041b0 <pipe+0x1d4>
  804053:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804057:	ba 07 04 00 00       	mov    $0x407,%edx
  80405c:	48 89 c6             	mov    %rax,%rsi
  80405f:	bf 00 00 00 00       	mov    $0x0,%edi
  804064:	48 b8 de 1c 80 00 00 	movabs $0x801cde,%rax
  80406b:	00 00 00 
  80406e:	ff d0                	callq  *%rax
  804070:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804073:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804077:	0f 88 33 01 00 00    	js     8041b0 <pipe+0x1d4>
  80407d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804081:	48 89 c7             	mov    %rax,%rdi
  804084:	48 b8 c4 24 80 00 00 	movabs $0x8024c4,%rax
  80408b:	00 00 00 
  80408e:	ff d0                	callq  *%rax
  804090:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804094:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804098:	ba 07 04 00 00       	mov    $0x407,%edx
  80409d:	48 89 c6             	mov    %rax,%rsi
  8040a0:	bf 00 00 00 00       	mov    $0x0,%edi
  8040a5:	48 b8 de 1c 80 00 00 	movabs $0x801cde,%rax
  8040ac:	00 00 00 
  8040af:	ff d0                	callq  *%rax
  8040b1:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8040b4:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8040b8:	79 05                	jns    8040bf <pipe+0xe3>
  8040ba:	e9 d9 00 00 00       	jmpq   804198 <pipe+0x1bc>
  8040bf:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8040c3:	48 89 c7             	mov    %rax,%rdi
  8040c6:	48 b8 c4 24 80 00 00 	movabs $0x8024c4,%rax
  8040cd:	00 00 00 
  8040d0:	ff d0                	callq  *%rax
  8040d2:	48 89 c2             	mov    %rax,%rdx
  8040d5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8040d9:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  8040df:	48 89 d1             	mov    %rdx,%rcx
  8040e2:	ba 00 00 00 00       	mov    $0x0,%edx
  8040e7:	48 89 c6             	mov    %rax,%rsi
  8040ea:	bf 00 00 00 00       	mov    $0x0,%edi
  8040ef:	48 b8 2e 1d 80 00 00 	movabs $0x801d2e,%rax
  8040f6:	00 00 00 
  8040f9:	ff d0                	callq  *%rax
  8040fb:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8040fe:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804102:	79 1b                	jns    80411f <pipe+0x143>
  804104:	90                   	nop
  804105:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804109:	48 89 c6             	mov    %rax,%rsi
  80410c:	bf 00 00 00 00       	mov    $0x0,%edi
  804111:	48 b8 89 1d 80 00 00 	movabs $0x801d89,%rax
  804118:	00 00 00 
  80411b:	ff d0                	callq  *%rax
  80411d:	eb 79                	jmp    804198 <pipe+0x1bc>
  80411f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804123:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  80412a:	00 00 00 
  80412d:	8b 12                	mov    (%rdx),%edx
  80412f:	89 10                	mov    %edx,(%rax)
  804131:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804135:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  80413c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804140:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  804147:	00 00 00 
  80414a:	8b 12                	mov    (%rdx),%edx
  80414c:	89 10                	mov    %edx,(%rax)
  80414e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804152:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  804159:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80415d:	48 89 c7             	mov    %rax,%rdi
  804160:	48 b8 a1 24 80 00 00 	movabs $0x8024a1,%rax
  804167:	00 00 00 
  80416a:	ff d0                	callq  *%rax
  80416c:	89 c2                	mov    %eax,%edx
  80416e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  804172:	89 10                	mov    %edx,(%rax)
  804174:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  804178:	48 8d 58 04          	lea    0x4(%rax),%rbx
  80417c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804180:	48 89 c7             	mov    %rax,%rdi
  804183:	48 b8 a1 24 80 00 00 	movabs $0x8024a1,%rax
  80418a:	00 00 00 
  80418d:	ff d0                	callq  *%rax
  80418f:	89 03                	mov    %eax,(%rbx)
  804191:	b8 00 00 00 00       	mov    $0x0,%eax
  804196:	eb 33                	jmp    8041cb <pipe+0x1ef>
  804198:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80419c:	48 89 c6             	mov    %rax,%rsi
  80419f:	bf 00 00 00 00       	mov    $0x0,%edi
  8041a4:	48 b8 89 1d 80 00 00 	movabs $0x801d89,%rax
  8041ab:	00 00 00 
  8041ae:	ff d0                	callq  *%rax
  8041b0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8041b4:	48 89 c6             	mov    %rax,%rsi
  8041b7:	bf 00 00 00 00       	mov    $0x0,%edi
  8041bc:	48 b8 89 1d 80 00 00 	movabs $0x801d89,%rax
  8041c3:	00 00 00 
  8041c6:	ff d0                	callq  *%rax
  8041c8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8041cb:	48 83 c4 38          	add    $0x38,%rsp
  8041cf:	5b                   	pop    %rbx
  8041d0:	5d                   	pop    %rbp
  8041d1:	c3                   	retq   

00000000008041d2 <_pipeisclosed>:
  8041d2:	55                   	push   %rbp
  8041d3:	48 89 e5             	mov    %rsp,%rbp
  8041d6:	53                   	push   %rbx
  8041d7:	48 83 ec 28          	sub    $0x28,%rsp
  8041db:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8041df:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8041e3:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  8041ea:	00 00 00 
  8041ed:	48 8b 00             	mov    (%rax),%rax
  8041f0:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8041f6:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8041f9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8041fd:	48 89 c7             	mov    %rax,%rdi
  804200:	48 b8 21 4a 80 00 00 	movabs $0x804a21,%rax
  804207:	00 00 00 
  80420a:	ff d0                	callq  *%rax
  80420c:	89 c3                	mov    %eax,%ebx
  80420e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804212:	48 89 c7             	mov    %rax,%rdi
  804215:	48 b8 21 4a 80 00 00 	movabs $0x804a21,%rax
  80421c:	00 00 00 
  80421f:	ff d0                	callq  *%rax
  804221:	39 c3                	cmp    %eax,%ebx
  804223:	0f 94 c0             	sete   %al
  804226:	0f b6 c0             	movzbl %al,%eax
  804229:	89 45 e8             	mov    %eax,-0x18(%rbp)
  80422c:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  804233:	00 00 00 
  804236:	48 8b 00             	mov    (%rax),%rax
  804239:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80423f:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  804242:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804245:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  804248:	75 05                	jne    80424f <_pipeisclosed+0x7d>
  80424a:	8b 45 e8             	mov    -0x18(%rbp),%eax
  80424d:	eb 4f                	jmp    80429e <_pipeisclosed+0xcc>
  80424f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804252:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  804255:	74 42                	je     804299 <_pipeisclosed+0xc7>
  804257:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  80425b:	75 3c                	jne    804299 <_pipeisclosed+0xc7>
  80425d:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  804264:	00 00 00 
  804267:	48 8b 00             	mov    (%rax),%rax
  80426a:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  804270:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  804273:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804276:	89 c6                	mov    %eax,%esi
  804278:	48 bf fb 51 80 00 00 	movabs $0x8051fb,%rdi
  80427f:	00 00 00 
  804282:	b8 00 00 00 00       	mov    $0x0,%eax
  804287:	49 b8 fa 07 80 00 00 	movabs $0x8007fa,%r8
  80428e:	00 00 00 
  804291:	41 ff d0             	callq  *%r8
  804294:	e9 4a ff ff ff       	jmpq   8041e3 <_pipeisclosed+0x11>
  804299:	e9 45 ff ff ff       	jmpq   8041e3 <_pipeisclosed+0x11>
  80429e:	48 83 c4 28          	add    $0x28,%rsp
  8042a2:	5b                   	pop    %rbx
  8042a3:	5d                   	pop    %rbp
  8042a4:	c3                   	retq   

00000000008042a5 <pipeisclosed>:
  8042a5:	55                   	push   %rbp
  8042a6:	48 89 e5             	mov    %rsp,%rbp
  8042a9:	48 83 ec 30          	sub    $0x30,%rsp
  8042ad:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8042b0:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8042b4:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8042b7:	48 89 d6             	mov    %rdx,%rsi
  8042ba:	89 c7                	mov    %eax,%edi
  8042bc:	48 b8 87 25 80 00 00 	movabs $0x802587,%rax
  8042c3:	00 00 00 
  8042c6:	ff d0                	callq  *%rax
  8042c8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8042cb:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8042cf:	79 05                	jns    8042d6 <pipeisclosed+0x31>
  8042d1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8042d4:	eb 31                	jmp    804307 <pipeisclosed+0x62>
  8042d6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8042da:	48 89 c7             	mov    %rax,%rdi
  8042dd:	48 b8 c4 24 80 00 00 	movabs $0x8024c4,%rax
  8042e4:	00 00 00 
  8042e7:	ff d0                	callq  *%rax
  8042e9:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8042ed:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8042f1:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8042f5:	48 89 d6             	mov    %rdx,%rsi
  8042f8:	48 89 c7             	mov    %rax,%rdi
  8042fb:	48 b8 d2 41 80 00 00 	movabs $0x8041d2,%rax
  804302:	00 00 00 
  804305:	ff d0                	callq  *%rax
  804307:	c9                   	leaveq 
  804308:	c3                   	retq   

0000000000804309 <devpipe_read>:
  804309:	55                   	push   %rbp
  80430a:	48 89 e5             	mov    %rsp,%rbp
  80430d:	48 83 ec 40          	sub    $0x40,%rsp
  804311:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804315:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804319:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80431d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804321:	48 89 c7             	mov    %rax,%rdi
  804324:	48 b8 c4 24 80 00 00 	movabs $0x8024c4,%rax
  80432b:	00 00 00 
  80432e:	ff d0                	callq  *%rax
  804330:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804334:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804338:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80433c:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804343:	00 
  804344:	e9 92 00 00 00       	jmpq   8043db <devpipe_read+0xd2>
  804349:	eb 41                	jmp    80438c <devpipe_read+0x83>
  80434b:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  804350:	74 09                	je     80435b <devpipe_read+0x52>
  804352:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804356:	e9 92 00 00 00       	jmpq   8043ed <devpipe_read+0xe4>
  80435b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80435f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804363:	48 89 d6             	mov    %rdx,%rsi
  804366:	48 89 c7             	mov    %rax,%rdi
  804369:	48 b8 d2 41 80 00 00 	movabs $0x8041d2,%rax
  804370:	00 00 00 
  804373:	ff d0                	callq  *%rax
  804375:	85 c0                	test   %eax,%eax
  804377:	74 07                	je     804380 <devpipe_read+0x77>
  804379:	b8 00 00 00 00       	mov    $0x0,%eax
  80437e:	eb 6d                	jmp    8043ed <devpipe_read+0xe4>
  804380:	48 b8 a0 1c 80 00 00 	movabs $0x801ca0,%rax
  804387:	00 00 00 
  80438a:	ff d0                	callq  *%rax
  80438c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804390:	8b 10                	mov    (%rax),%edx
  804392:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804396:	8b 40 04             	mov    0x4(%rax),%eax
  804399:	39 c2                	cmp    %eax,%edx
  80439b:	74 ae                	je     80434b <devpipe_read+0x42>
  80439d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8043a1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8043a5:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  8043a9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8043ad:	8b 00                	mov    (%rax),%eax
  8043af:	99                   	cltd   
  8043b0:	c1 ea 1b             	shr    $0x1b,%edx
  8043b3:	01 d0                	add    %edx,%eax
  8043b5:	83 e0 1f             	and    $0x1f,%eax
  8043b8:	29 d0                	sub    %edx,%eax
  8043ba:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8043be:	48 98                	cltq   
  8043c0:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  8043c5:	88 01                	mov    %al,(%rcx)
  8043c7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8043cb:	8b 00                	mov    (%rax),%eax
  8043cd:	8d 50 01             	lea    0x1(%rax),%edx
  8043d0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8043d4:	89 10                	mov    %edx,(%rax)
  8043d6:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8043db:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8043df:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8043e3:	0f 82 60 ff ff ff    	jb     804349 <devpipe_read+0x40>
  8043e9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8043ed:	c9                   	leaveq 
  8043ee:	c3                   	retq   

00000000008043ef <devpipe_write>:
  8043ef:	55                   	push   %rbp
  8043f0:	48 89 e5             	mov    %rsp,%rbp
  8043f3:	48 83 ec 40          	sub    $0x40,%rsp
  8043f7:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8043fb:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8043ff:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  804403:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804407:	48 89 c7             	mov    %rax,%rdi
  80440a:	48 b8 c4 24 80 00 00 	movabs $0x8024c4,%rax
  804411:	00 00 00 
  804414:	ff d0                	callq  *%rax
  804416:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80441a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80441e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804422:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804429:	00 
  80442a:	e9 8e 00 00 00       	jmpq   8044bd <devpipe_write+0xce>
  80442f:	eb 31                	jmp    804462 <devpipe_write+0x73>
  804431:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804435:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804439:	48 89 d6             	mov    %rdx,%rsi
  80443c:	48 89 c7             	mov    %rax,%rdi
  80443f:	48 b8 d2 41 80 00 00 	movabs $0x8041d2,%rax
  804446:	00 00 00 
  804449:	ff d0                	callq  *%rax
  80444b:	85 c0                	test   %eax,%eax
  80444d:	74 07                	je     804456 <devpipe_write+0x67>
  80444f:	b8 00 00 00 00       	mov    $0x0,%eax
  804454:	eb 79                	jmp    8044cf <devpipe_write+0xe0>
  804456:	48 b8 a0 1c 80 00 00 	movabs $0x801ca0,%rax
  80445d:	00 00 00 
  804460:	ff d0                	callq  *%rax
  804462:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804466:	8b 40 04             	mov    0x4(%rax),%eax
  804469:	48 63 d0             	movslq %eax,%rdx
  80446c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804470:	8b 00                	mov    (%rax),%eax
  804472:	48 98                	cltq   
  804474:	48 83 c0 20          	add    $0x20,%rax
  804478:	48 39 c2             	cmp    %rax,%rdx
  80447b:	73 b4                	jae    804431 <devpipe_write+0x42>
  80447d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804481:	8b 40 04             	mov    0x4(%rax),%eax
  804484:	99                   	cltd   
  804485:	c1 ea 1b             	shr    $0x1b,%edx
  804488:	01 d0                	add    %edx,%eax
  80448a:	83 e0 1f             	and    $0x1f,%eax
  80448d:	29 d0                	sub    %edx,%eax
  80448f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  804493:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  804497:	48 01 ca             	add    %rcx,%rdx
  80449a:	0f b6 0a             	movzbl (%rdx),%ecx
  80449d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8044a1:	48 98                	cltq   
  8044a3:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  8044a7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8044ab:	8b 40 04             	mov    0x4(%rax),%eax
  8044ae:	8d 50 01             	lea    0x1(%rax),%edx
  8044b1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8044b5:	89 50 04             	mov    %edx,0x4(%rax)
  8044b8:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8044bd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8044c1:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8044c5:	0f 82 64 ff ff ff    	jb     80442f <devpipe_write+0x40>
  8044cb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8044cf:	c9                   	leaveq 
  8044d0:	c3                   	retq   

00000000008044d1 <devpipe_stat>:
  8044d1:	55                   	push   %rbp
  8044d2:	48 89 e5             	mov    %rsp,%rbp
  8044d5:	48 83 ec 20          	sub    $0x20,%rsp
  8044d9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8044dd:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8044e1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8044e5:	48 89 c7             	mov    %rax,%rdi
  8044e8:	48 b8 c4 24 80 00 00 	movabs $0x8024c4,%rax
  8044ef:	00 00 00 
  8044f2:	ff d0                	callq  *%rax
  8044f4:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8044f8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8044fc:	48 be 0e 52 80 00 00 	movabs $0x80520e,%rsi
  804503:	00 00 00 
  804506:	48 89 c7             	mov    %rax,%rdi
  804509:	48 b8 af 13 80 00 00 	movabs $0x8013af,%rax
  804510:	00 00 00 
  804513:	ff d0                	callq  *%rax
  804515:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804519:	8b 50 04             	mov    0x4(%rax),%edx
  80451c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804520:	8b 00                	mov    (%rax),%eax
  804522:	29 c2                	sub    %eax,%edx
  804524:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804528:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  80452e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804532:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  804539:	00 00 00 
  80453c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804540:	48 b9 e0 70 80 00 00 	movabs $0x8070e0,%rcx
  804547:	00 00 00 
  80454a:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  804551:	b8 00 00 00 00       	mov    $0x0,%eax
  804556:	c9                   	leaveq 
  804557:	c3                   	retq   

0000000000804558 <devpipe_close>:
  804558:	55                   	push   %rbp
  804559:	48 89 e5             	mov    %rsp,%rbp
  80455c:	48 83 ec 10          	sub    $0x10,%rsp
  804560:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804564:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804568:	48 89 c6             	mov    %rax,%rsi
  80456b:	bf 00 00 00 00       	mov    $0x0,%edi
  804570:	48 b8 89 1d 80 00 00 	movabs $0x801d89,%rax
  804577:	00 00 00 
  80457a:	ff d0                	callq  *%rax
  80457c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804580:	48 89 c7             	mov    %rax,%rdi
  804583:	48 b8 c4 24 80 00 00 	movabs $0x8024c4,%rax
  80458a:	00 00 00 
  80458d:	ff d0                	callq  *%rax
  80458f:	48 89 c6             	mov    %rax,%rsi
  804592:	bf 00 00 00 00       	mov    $0x0,%edi
  804597:	48 b8 89 1d 80 00 00 	movabs $0x801d89,%rax
  80459e:	00 00 00 
  8045a1:	ff d0                	callq  *%rax
  8045a3:	c9                   	leaveq 
  8045a4:	c3                   	retq   

00000000008045a5 <cputchar>:
  8045a5:	55                   	push   %rbp
  8045a6:	48 89 e5             	mov    %rsp,%rbp
  8045a9:	48 83 ec 20          	sub    $0x20,%rsp
  8045ad:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8045b0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8045b3:	88 45 ff             	mov    %al,-0x1(%rbp)
  8045b6:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  8045ba:	be 01 00 00 00       	mov    $0x1,%esi
  8045bf:	48 89 c7             	mov    %rax,%rdi
  8045c2:	48 b8 96 1b 80 00 00 	movabs $0x801b96,%rax
  8045c9:	00 00 00 
  8045cc:	ff d0                	callq  *%rax
  8045ce:	c9                   	leaveq 
  8045cf:	c3                   	retq   

00000000008045d0 <getchar>:
  8045d0:	55                   	push   %rbp
  8045d1:	48 89 e5             	mov    %rsp,%rbp
  8045d4:	48 83 ec 10          	sub    $0x10,%rsp
  8045d8:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  8045dc:	ba 01 00 00 00       	mov    $0x1,%edx
  8045e1:	48 89 c6             	mov    %rax,%rsi
  8045e4:	bf 00 00 00 00       	mov    $0x0,%edi
  8045e9:	48 b8 b9 29 80 00 00 	movabs $0x8029b9,%rax
  8045f0:	00 00 00 
  8045f3:	ff d0                	callq  *%rax
  8045f5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8045f8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8045fc:	79 05                	jns    804603 <getchar+0x33>
  8045fe:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804601:	eb 14                	jmp    804617 <getchar+0x47>
  804603:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804607:	7f 07                	jg     804610 <getchar+0x40>
  804609:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  80460e:	eb 07                	jmp    804617 <getchar+0x47>
  804610:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  804614:	0f b6 c0             	movzbl %al,%eax
  804617:	c9                   	leaveq 
  804618:	c3                   	retq   

0000000000804619 <iscons>:
  804619:	55                   	push   %rbp
  80461a:	48 89 e5             	mov    %rsp,%rbp
  80461d:	48 83 ec 20          	sub    $0x20,%rsp
  804621:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804624:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  804628:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80462b:	48 89 d6             	mov    %rdx,%rsi
  80462e:	89 c7                	mov    %eax,%edi
  804630:	48 b8 87 25 80 00 00 	movabs $0x802587,%rax
  804637:	00 00 00 
  80463a:	ff d0                	callq  *%rax
  80463c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80463f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804643:	79 05                	jns    80464a <iscons+0x31>
  804645:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804648:	eb 1a                	jmp    804664 <iscons+0x4b>
  80464a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80464e:	8b 10                	mov    (%rax),%edx
  804650:	48 b8 20 71 80 00 00 	movabs $0x807120,%rax
  804657:	00 00 00 
  80465a:	8b 00                	mov    (%rax),%eax
  80465c:	39 c2                	cmp    %eax,%edx
  80465e:	0f 94 c0             	sete   %al
  804661:	0f b6 c0             	movzbl %al,%eax
  804664:	c9                   	leaveq 
  804665:	c3                   	retq   

0000000000804666 <opencons>:
  804666:	55                   	push   %rbp
  804667:	48 89 e5             	mov    %rsp,%rbp
  80466a:	48 83 ec 10          	sub    $0x10,%rsp
  80466e:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  804672:	48 89 c7             	mov    %rax,%rdi
  804675:	48 b8 ef 24 80 00 00 	movabs $0x8024ef,%rax
  80467c:	00 00 00 
  80467f:	ff d0                	callq  *%rax
  804681:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804684:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804688:	79 05                	jns    80468f <opencons+0x29>
  80468a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80468d:	eb 5b                	jmp    8046ea <opencons+0x84>
  80468f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804693:	ba 07 04 00 00       	mov    $0x407,%edx
  804698:	48 89 c6             	mov    %rax,%rsi
  80469b:	bf 00 00 00 00       	mov    $0x0,%edi
  8046a0:	48 b8 de 1c 80 00 00 	movabs $0x801cde,%rax
  8046a7:	00 00 00 
  8046aa:	ff d0                	callq  *%rax
  8046ac:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8046af:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8046b3:	79 05                	jns    8046ba <opencons+0x54>
  8046b5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8046b8:	eb 30                	jmp    8046ea <opencons+0x84>
  8046ba:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8046be:	48 ba 20 71 80 00 00 	movabs $0x807120,%rdx
  8046c5:	00 00 00 
  8046c8:	8b 12                	mov    (%rdx),%edx
  8046ca:	89 10                	mov    %edx,(%rax)
  8046cc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8046d0:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8046d7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8046db:	48 89 c7             	mov    %rax,%rdi
  8046de:	48 b8 a1 24 80 00 00 	movabs $0x8024a1,%rax
  8046e5:	00 00 00 
  8046e8:	ff d0                	callq  *%rax
  8046ea:	c9                   	leaveq 
  8046eb:	c3                   	retq   

00000000008046ec <devcons_read>:
  8046ec:	55                   	push   %rbp
  8046ed:	48 89 e5             	mov    %rsp,%rbp
  8046f0:	48 83 ec 30          	sub    $0x30,%rsp
  8046f4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8046f8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8046fc:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804700:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804705:	75 07                	jne    80470e <devcons_read+0x22>
  804707:	b8 00 00 00 00       	mov    $0x0,%eax
  80470c:	eb 4b                	jmp    804759 <devcons_read+0x6d>
  80470e:	eb 0c                	jmp    80471c <devcons_read+0x30>
  804710:	48 b8 a0 1c 80 00 00 	movabs $0x801ca0,%rax
  804717:	00 00 00 
  80471a:	ff d0                	callq  *%rax
  80471c:	48 b8 e0 1b 80 00 00 	movabs $0x801be0,%rax
  804723:	00 00 00 
  804726:	ff d0                	callq  *%rax
  804728:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80472b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80472f:	74 df                	je     804710 <devcons_read+0x24>
  804731:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804735:	79 05                	jns    80473c <devcons_read+0x50>
  804737:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80473a:	eb 1d                	jmp    804759 <devcons_read+0x6d>
  80473c:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  804740:	75 07                	jne    804749 <devcons_read+0x5d>
  804742:	b8 00 00 00 00       	mov    $0x0,%eax
  804747:	eb 10                	jmp    804759 <devcons_read+0x6d>
  804749:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80474c:	89 c2                	mov    %eax,%edx
  80474e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804752:	88 10                	mov    %dl,(%rax)
  804754:	b8 01 00 00 00       	mov    $0x1,%eax
  804759:	c9                   	leaveq 
  80475a:	c3                   	retq   

000000000080475b <devcons_write>:
  80475b:	55                   	push   %rbp
  80475c:	48 89 e5             	mov    %rsp,%rbp
  80475f:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  804766:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  80476d:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  804774:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  80477b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804782:	eb 76                	jmp    8047fa <devcons_write+0x9f>
  804784:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  80478b:	89 c2                	mov    %eax,%edx
  80478d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804790:	29 c2                	sub    %eax,%edx
  804792:	89 d0                	mov    %edx,%eax
  804794:	89 45 f8             	mov    %eax,-0x8(%rbp)
  804797:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80479a:	83 f8 7f             	cmp    $0x7f,%eax
  80479d:	76 07                	jbe    8047a6 <devcons_write+0x4b>
  80479f:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  8047a6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8047a9:	48 63 d0             	movslq %eax,%rdx
  8047ac:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8047af:	48 63 c8             	movslq %eax,%rcx
  8047b2:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  8047b9:	48 01 c1             	add    %rax,%rcx
  8047bc:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  8047c3:	48 89 ce             	mov    %rcx,%rsi
  8047c6:	48 89 c7             	mov    %rax,%rdi
  8047c9:	48 b8 d3 16 80 00 00 	movabs $0x8016d3,%rax
  8047d0:	00 00 00 
  8047d3:	ff d0                	callq  *%rax
  8047d5:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8047d8:	48 63 d0             	movslq %eax,%rdx
  8047db:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  8047e2:	48 89 d6             	mov    %rdx,%rsi
  8047e5:	48 89 c7             	mov    %rax,%rdi
  8047e8:	48 b8 96 1b 80 00 00 	movabs $0x801b96,%rax
  8047ef:	00 00 00 
  8047f2:	ff d0                	callq  *%rax
  8047f4:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8047f7:	01 45 fc             	add    %eax,-0x4(%rbp)
  8047fa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8047fd:	48 98                	cltq   
  8047ff:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  804806:	0f 82 78 ff ff ff    	jb     804784 <devcons_write+0x29>
  80480c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80480f:	c9                   	leaveq 
  804810:	c3                   	retq   

0000000000804811 <devcons_close>:
  804811:	55                   	push   %rbp
  804812:	48 89 e5             	mov    %rsp,%rbp
  804815:	48 83 ec 08          	sub    $0x8,%rsp
  804819:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80481d:	b8 00 00 00 00       	mov    $0x0,%eax
  804822:	c9                   	leaveq 
  804823:	c3                   	retq   

0000000000804824 <devcons_stat>:
  804824:	55                   	push   %rbp
  804825:	48 89 e5             	mov    %rsp,%rbp
  804828:	48 83 ec 10          	sub    $0x10,%rsp
  80482c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804830:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804834:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804838:	48 be 1a 52 80 00 00 	movabs $0x80521a,%rsi
  80483f:	00 00 00 
  804842:	48 89 c7             	mov    %rax,%rdi
  804845:	48 b8 af 13 80 00 00 	movabs $0x8013af,%rax
  80484c:	00 00 00 
  80484f:	ff d0                	callq  *%rax
  804851:	b8 00 00 00 00       	mov    $0x0,%eax
  804856:	c9                   	leaveq 
  804857:	c3                   	retq   

0000000000804858 <ipc_recv>:
  804858:	55                   	push   %rbp
  804859:	48 89 e5             	mov    %rsp,%rbp
  80485c:	48 83 ec 30          	sub    $0x30,%rsp
  804860:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804864:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804868:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80486c:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  804871:	75 0e                	jne    804881 <ipc_recv+0x29>
  804873:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80487a:	00 00 00 
  80487d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804881:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804885:	48 89 c7             	mov    %rax,%rdi
  804888:	48 b8 07 1f 80 00 00 	movabs $0x801f07,%rax
  80488f:	00 00 00 
  804892:	ff d0                	callq  *%rax
  804894:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804897:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80489b:	79 27                	jns    8048c4 <ipc_recv+0x6c>
  80489d:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8048a2:	74 0a                	je     8048ae <ipc_recv+0x56>
  8048a4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8048a8:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8048ae:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8048b3:	74 0a                	je     8048bf <ipc_recv+0x67>
  8048b5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8048b9:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8048bf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8048c2:	eb 53                	jmp    804917 <ipc_recv+0xbf>
  8048c4:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8048c9:	74 19                	je     8048e4 <ipc_recv+0x8c>
  8048cb:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  8048d2:	00 00 00 
  8048d5:	48 8b 00             	mov    (%rax),%rax
  8048d8:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  8048de:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8048e2:	89 10                	mov    %edx,(%rax)
  8048e4:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8048e9:	74 19                	je     804904 <ipc_recv+0xac>
  8048eb:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  8048f2:	00 00 00 
  8048f5:	48 8b 00             	mov    (%rax),%rax
  8048f8:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  8048fe:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804902:	89 10                	mov    %edx,(%rax)
  804904:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  80490b:	00 00 00 
  80490e:	48 8b 00             	mov    (%rax),%rax
  804911:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  804917:	c9                   	leaveq 
  804918:	c3                   	retq   

0000000000804919 <ipc_send>:
  804919:	55                   	push   %rbp
  80491a:	48 89 e5             	mov    %rsp,%rbp
  80491d:	48 83 ec 30          	sub    $0x30,%rsp
  804921:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804924:	89 75 e8             	mov    %esi,-0x18(%rbp)
  804927:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  80492b:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  80492e:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  804933:	75 10                	jne    804945 <ipc_send+0x2c>
  804935:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80493c:	00 00 00 
  80493f:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804943:	eb 0e                	jmp    804953 <ipc_send+0x3a>
  804945:	eb 0c                	jmp    804953 <ipc_send+0x3a>
  804947:	48 b8 a0 1c 80 00 00 	movabs $0x801ca0,%rax
  80494e:	00 00 00 
  804951:	ff d0                	callq  *%rax
  804953:	8b 75 e8             	mov    -0x18(%rbp),%esi
  804956:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  804959:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80495d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804960:	89 c7                	mov    %eax,%edi
  804962:	48 b8 b2 1e 80 00 00 	movabs $0x801eb2,%rax
  804969:	00 00 00 
  80496c:	ff d0                	callq  *%rax
  80496e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804971:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  804975:	74 d0                	je     804947 <ipc_send+0x2e>
  804977:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80497b:	79 30                	jns    8049ad <ipc_send+0x94>
  80497d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804980:	89 c1                	mov    %eax,%ecx
  804982:	48 ba 21 52 80 00 00 	movabs $0x805221,%rdx
  804989:	00 00 00 
  80498c:	be 44 00 00 00       	mov    $0x44,%esi
  804991:	48 bf 37 52 80 00 00 	movabs $0x805237,%rdi
  804998:	00 00 00 
  80499b:	b8 00 00 00 00       	mov    $0x0,%eax
  8049a0:	49 b8 c1 05 80 00 00 	movabs $0x8005c1,%r8
  8049a7:	00 00 00 
  8049aa:	41 ff d0             	callq  *%r8
  8049ad:	c9                   	leaveq 
  8049ae:	c3                   	retq   

00000000008049af <ipc_find_env>:
  8049af:	55                   	push   %rbp
  8049b0:	48 89 e5             	mov    %rsp,%rbp
  8049b3:	48 83 ec 14          	sub    $0x14,%rsp
  8049b7:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8049ba:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8049c1:	eb 4e                	jmp    804a11 <ipc_find_env+0x62>
  8049c3:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  8049ca:	00 00 00 
  8049cd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8049d0:	48 98                	cltq   
  8049d2:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  8049d9:	48 01 d0             	add    %rdx,%rax
  8049dc:	48 05 d0 00 00 00    	add    $0xd0,%rax
  8049e2:	8b 00                	mov    (%rax),%eax
  8049e4:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  8049e7:	75 24                	jne    804a0d <ipc_find_env+0x5e>
  8049e9:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  8049f0:	00 00 00 
  8049f3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8049f6:	48 98                	cltq   
  8049f8:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  8049ff:	48 01 d0             	add    %rdx,%rax
  804a02:	48 05 c0 00 00 00    	add    $0xc0,%rax
  804a08:	8b 40 08             	mov    0x8(%rax),%eax
  804a0b:	eb 12                	jmp    804a1f <ipc_find_env+0x70>
  804a0d:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  804a11:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  804a18:	7e a9                	jle    8049c3 <ipc_find_env+0x14>
  804a1a:	b8 00 00 00 00       	mov    $0x0,%eax
  804a1f:	c9                   	leaveq 
  804a20:	c3                   	retq   

0000000000804a21 <pageref>:
  804a21:	55                   	push   %rbp
  804a22:	48 89 e5             	mov    %rsp,%rbp
  804a25:	48 83 ec 18          	sub    $0x18,%rsp
  804a29:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804a2d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804a31:	48 c1 e8 15          	shr    $0x15,%rax
  804a35:	48 89 c2             	mov    %rax,%rdx
  804a38:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  804a3f:	01 00 00 
  804a42:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804a46:	83 e0 01             	and    $0x1,%eax
  804a49:	48 85 c0             	test   %rax,%rax
  804a4c:	75 07                	jne    804a55 <pageref+0x34>
  804a4e:	b8 00 00 00 00       	mov    $0x0,%eax
  804a53:	eb 53                	jmp    804aa8 <pageref+0x87>
  804a55:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804a59:	48 c1 e8 0c          	shr    $0xc,%rax
  804a5d:	48 89 c2             	mov    %rax,%rdx
  804a60:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  804a67:	01 00 00 
  804a6a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804a6e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804a72:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804a76:	83 e0 01             	and    $0x1,%eax
  804a79:	48 85 c0             	test   %rax,%rax
  804a7c:	75 07                	jne    804a85 <pageref+0x64>
  804a7e:	b8 00 00 00 00       	mov    $0x0,%eax
  804a83:	eb 23                	jmp    804aa8 <pageref+0x87>
  804a85:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804a89:	48 c1 e8 0c          	shr    $0xc,%rax
  804a8d:	48 89 c2             	mov    %rax,%rdx
  804a90:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  804a97:	00 00 00 
  804a9a:	48 c1 e2 04          	shl    $0x4,%rdx
  804a9e:	48 01 d0             	add    %rdx,%rax
  804aa1:	0f b7 40 08          	movzwl 0x8(%rax),%eax
  804aa5:	0f b7 c0             	movzwl %ax,%eax
  804aa8:	c9                   	leaveq 
  804aa9:	c3                   	retq   
