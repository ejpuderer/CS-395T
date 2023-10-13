
obj/user/echotest:     file format elf64-x86-64


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
  80003c:	e8 d9 02 00 00       	callq  80031a <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <die>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 10          	sub    $0x10,%rsp
  80004b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80004f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800053:	48 89 c6             	mov    %rax,%rsi
  800056:	48 bf 8e 47 80 00 00 	movabs $0x80478e,%rdi
  80005d:	00 00 00 
  800060:	b8 00 00 00 00       	mov    $0x0,%eax
  800065:	48 ba e5 04 80 00 00 	movabs $0x8004e5,%rdx
  80006c:	00 00 00 
  80006f:	ff d2                	callq  *%rdx
  800071:	48 b8 9d 03 80 00 00 	movabs $0x80039d,%rax
  800078:	00 00 00 
  80007b:	ff d0                	callq  *%rax
  80007d:	c9                   	leaveq 
  80007e:	c3                   	retq   

000000000080007f <umain>:
  80007f:	55                   	push   %rbp
  800080:	48 89 e5             	mov    %rsp,%rbp
  800083:	48 83 ec 50          	sub    $0x50,%rsp
  800087:	89 7d bc             	mov    %edi,-0x44(%rbp)
  80008a:	48 89 75 b0          	mov    %rsi,-0x50(%rbp)
  80008e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800095:	48 bf 92 47 80 00 00 	movabs $0x804792,%rdi
  80009c:	00 00 00 
  80009f:	b8 00 00 00 00       	mov    $0x0,%eax
  8000a4:	48 ba e5 04 80 00 00 	movabs $0x8004e5,%rdx
  8000ab:	00 00 00 
  8000ae:	ff d2                	callq  *%rdx
  8000b0:	48 bf a2 47 80 00 00 	movabs $0x8047a2,%rdi
  8000b7:	00 00 00 
  8000ba:	48 b8 c0 42 80 00 00 	movabs $0x8042c0,%rax
  8000c1:	00 00 00 
  8000c4:	ff d0                	callq  *%rax
  8000c6:	89 c2                	mov    %eax,%edx
  8000c8:	48 be a2 47 80 00 00 	movabs $0x8047a2,%rsi
  8000cf:	00 00 00 
  8000d2:	48 bf ac 47 80 00 00 	movabs $0x8047ac,%rdi
  8000d9:	00 00 00 
  8000dc:	b8 00 00 00 00       	mov    $0x0,%eax
  8000e1:	48 b9 e5 04 80 00 00 	movabs $0x8004e5,%rcx
  8000e8:	00 00 00 
  8000eb:	ff d1                	callq  *%rcx
  8000ed:	ba 06 00 00 00       	mov    $0x6,%edx
  8000f2:	be 01 00 00 00       	mov    $0x1,%esi
  8000f7:	bf 02 00 00 00       	mov    $0x2,%edi
  8000fc:	48 b8 47 32 80 00 00 	movabs $0x803247,%rax
  800103:	00 00 00 
  800106:	ff d0                	callq  *%rax
  800108:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80010b:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80010f:	79 16                	jns    800127 <umain+0xa8>
  800111:	48 bf c1 47 80 00 00 	movabs $0x8047c1,%rdi
  800118:	00 00 00 
  80011b:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800122:	00 00 00 
  800125:	ff d0                	callq  *%rax
  800127:	48 bf d9 47 80 00 00 	movabs $0x8047d9,%rdi
  80012e:	00 00 00 
  800131:	b8 00 00 00 00       	mov    $0x0,%eax
  800136:	48 ba e5 04 80 00 00 	movabs $0x8004e5,%rdx
  80013d:	00 00 00 
  800140:	ff d2                	callq  *%rdx
  800142:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  800146:	ba 10 00 00 00       	mov    $0x10,%edx
  80014b:	be 00 00 00 00       	mov    $0x0,%esi
  800150:	48 89 c7             	mov    %rax,%rdi
  800153:	48 b8 33 13 80 00 00 	movabs $0x801333,%rax
  80015a:	00 00 00 
  80015d:	ff d0                	callq  *%rax
  80015f:	c6 45 e1 02          	movb   $0x2,-0x1f(%rbp)
  800163:	48 bf a2 47 80 00 00 	movabs $0x8047a2,%rdi
  80016a:	00 00 00 
  80016d:	48 b8 c0 42 80 00 00 	movabs $0x8042c0,%rax
  800174:	00 00 00 
  800177:	ff d0                	callq  *%rax
  800179:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  80017c:	bf 10 27 00 00       	mov    $0x2710,%edi
  800181:	48 b8 cf 46 80 00 00 	movabs $0x8046cf,%rax
  800188:	00 00 00 
  80018b:	ff d0                	callq  *%rax
  80018d:	66 89 45 e2          	mov    %ax,-0x1e(%rbp)
  800191:	48 bf e8 47 80 00 00 	movabs $0x8047e8,%rdi
  800198:	00 00 00 
  80019b:	b8 00 00 00 00       	mov    $0x0,%eax
  8001a0:	48 ba e5 04 80 00 00 	movabs $0x8004e5,%rdx
  8001a7:	00 00 00 
  8001aa:	ff d2                	callq  *%rdx
  8001ac:	48 8d 4d e0          	lea    -0x20(%rbp),%rcx
  8001b0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8001b3:	ba 10 00 00 00       	mov    $0x10,%edx
  8001b8:	48 89 ce             	mov    %rcx,%rsi
  8001bb:	89 c7                	mov    %eax,%edi
  8001bd:	48 b8 0c 31 80 00 00 	movabs $0x80310c,%rax
  8001c4:	00 00 00 
  8001c7:	ff d0                	callq  *%rax
  8001c9:	85 c0                	test   %eax,%eax
  8001cb:	79 16                	jns    8001e3 <umain+0x164>
  8001cd:	48 bf 05 48 80 00 00 	movabs $0x804805,%rdi
  8001d4:	00 00 00 
  8001d7:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8001de:	00 00 00 
  8001e1:	ff d0                	callq  *%rax
  8001e3:	48 bf 23 48 80 00 00 	movabs $0x804823,%rdi
  8001ea:	00 00 00 
  8001ed:	b8 00 00 00 00       	mov    $0x0,%eax
  8001f2:	48 ba e5 04 80 00 00 	movabs $0x8004e5,%rdx
  8001f9:	00 00 00 
  8001fc:	ff d2                	callq  *%rdx
  8001fe:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  800205:	00 00 00 
  800208:	48 8b 00             	mov    (%rax),%rax
  80020b:	48 89 c7             	mov    %rax,%rdi
  80020e:	48 b8 2e 10 80 00 00 	movabs $0x80102e,%rax
  800215:	00 00 00 
  800218:	ff d0                	callq  *%rax
  80021a:	89 45 f4             	mov    %eax,-0xc(%rbp)
  80021d:	8b 55 f4             	mov    -0xc(%rbp),%edx
  800220:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  800227:	00 00 00 
  80022a:	48 8b 08             	mov    (%rax),%rcx
  80022d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800230:	48 89 ce             	mov    %rcx,%rsi
  800233:	89 c7                	mov    %eax,%edi
  800235:	48 b8 09 25 80 00 00 	movabs $0x802509,%rax
  80023c:	00 00 00 
  80023f:	ff d0                	callq  *%rax
  800241:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  800244:	74 16                	je     80025c <umain+0x1dd>
  800246:	48 bf 38 48 80 00 00 	movabs $0x804838,%rdi
  80024d:	00 00 00 
  800250:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800257:	00 00 00 
  80025a:	ff d0                	callq  *%rax
  80025c:	48 bf 59 48 80 00 00 	movabs $0x804859,%rdi
  800263:	00 00 00 
  800266:	b8 00 00 00 00       	mov    $0x0,%eax
  80026b:	48 ba e5 04 80 00 00 	movabs $0x8004e5,%rdx
  800272:	00 00 00 
  800275:	ff d2                	callq  *%rdx
  800277:	eb 6b                	jmp    8002e4 <umain+0x265>
  800279:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
  800280:	48 8d 4d c0          	lea    -0x40(%rbp),%rcx
  800284:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800287:	ba 1f 00 00 00       	mov    $0x1f,%edx
  80028c:	48 89 ce             	mov    %rcx,%rsi
  80028f:	89 c7                	mov    %eax,%edi
  800291:	48 b8 bf 23 80 00 00 	movabs $0x8023bf,%rax
  800298:	00 00 00 
  80029b:	ff d0                	callq  *%rax
  80029d:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8002a0:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8002a4:	7f 16                	jg     8002bc <umain+0x23d>
  8002a6:	48 bf 68 48 80 00 00 	movabs $0x804868,%rdi
  8002ad:	00 00 00 
  8002b0:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8002b7:	00 00 00 
  8002ba:	ff d0                	callq  *%rax
  8002bc:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8002bf:	01 45 fc             	add    %eax,-0x4(%rbp)
  8002c2:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8002c5:	48 98                	cltq   
  8002c7:	c6 44 05 c0 00       	movb   $0x0,-0x40(%rbp,%rax,1)
  8002cc:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
  8002d0:	48 89 c7             	mov    %rax,%rdi
  8002d3:	b8 00 00 00 00       	mov    $0x0,%eax
  8002d8:	48 ba e5 04 80 00 00 	movabs $0x8004e5,%rdx
  8002df:	00 00 00 
  8002e2:	ff d2                	callq  *%rdx
  8002e4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8002e7:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  8002ea:	72 8d                	jb     800279 <umain+0x1fa>
  8002ec:	48 bf 8c 48 80 00 00 	movabs $0x80488c,%rdi
  8002f3:	00 00 00 
  8002f6:	b8 00 00 00 00       	mov    $0x0,%eax
  8002fb:	48 ba e5 04 80 00 00 	movabs $0x8004e5,%rdx
  800302:	00 00 00 
  800305:	ff d2                	callq  *%rdx
  800307:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80030a:	89 c7                	mov    %eax,%edi
  80030c:	48 b8 9d 21 80 00 00 	movabs $0x80219d,%rax
  800313:	00 00 00 
  800316:	ff d0                	callq  *%rax
  800318:	c9                   	leaveq 
  800319:	c3                   	retq   

000000000080031a <libmain>:
  80031a:	55                   	push   %rbp
  80031b:	48 89 e5             	mov    %rsp,%rbp
  80031e:	48 83 ec 10          	sub    $0x10,%rsp
  800322:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800325:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800329:	48 b8 4d 19 80 00 00 	movabs $0x80194d,%rax
  800330:	00 00 00 
  800333:	ff d0                	callq  *%rax
  800335:	25 ff 03 00 00       	and    $0x3ff,%eax
  80033a:	48 98                	cltq   
  80033c:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  800343:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80034a:	00 00 00 
  80034d:	48 01 c2             	add    %rax,%rdx
  800350:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  800357:	00 00 00 
  80035a:	48 89 10             	mov    %rdx,(%rax)
  80035d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800361:	7e 14                	jle    800377 <libmain+0x5d>
  800363:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800367:	48 8b 10             	mov    (%rax),%rdx
  80036a:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  800371:	00 00 00 
  800374:	48 89 10             	mov    %rdx,(%rax)
  800377:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80037b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80037e:	48 89 d6             	mov    %rdx,%rsi
  800381:	89 c7                	mov    %eax,%edi
  800383:	48 b8 7f 00 80 00 00 	movabs $0x80007f,%rax
  80038a:	00 00 00 
  80038d:	ff d0                	callq  *%rax
  80038f:	48 b8 9d 03 80 00 00 	movabs $0x80039d,%rax
  800396:	00 00 00 
  800399:	ff d0                	callq  *%rax
  80039b:	c9                   	leaveq 
  80039c:	c3                   	retq   

000000000080039d <exit>:
  80039d:	55                   	push   %rbp
  80039e:	48 89 e5             	mov    %rsp,%rbp
  8003a1:	48 b8 e8 21 80 00 00 	movabs $0x8021e8,%rax
  8003a8:	00 00 00 
  8003ab:	ff d0                	callq  *%rax
  8003ad:	bf 00 00 00 00       	mov    $0x0,%edi
  8003b2:	48 b8 09 19 80 00 00 	movabs $0x801909,%rax
  8003b9:	00 00 00 
  8003bc:	ff d0                	callq  *%rax
  8003be:	5d                   	pop    %rbp
  8003bf:	c3                   	retq   

00000000008003c0 <putch>:
  8003c0:	55                   	push   %rbp
  8003c1:	48 89 e5             	mov    %rsp,%rbp
  8003c4:	48 83 ec 10          	sub    $0x10,%rsp
  8003c8:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8003cb:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8003cf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8003d3:	8b 00                	mov    (%rax),%eax
  8003d5:	8d 48 01             	lea    0x1(%rax),%ecx
  8003d8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8003dc:	89 0a                	mov    %ecx,(%rdx)
  8003de:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8003e1:	89 d1                	mov    %edx,%ecx
  8003e3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8003e7:	48 98                	cltq   
  8003e9:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  8003ed:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8003f1:	8b 00                	mov    (%rax),%eax
  8003f3:	3d ff 00 00 00       	cmp    $0xff,%eax
  8003f8:	75 2c                	jne    800426 <putch+0x66>
  8003fa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8003fe:	8b 00                	mov    (%rax),%eax
  800400:	48 98                	cltq   
  800402:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800406:	48 83 c2 08          	add    $0x8,%rdx
  80040a:	48 89 c6             	mov    %rax,%rsi
  80040d:	48 89 d7             	mov    %rdx,%rdi
  800410:	48 b8 81 18 80 00 00 	movabs $0x801881,%rax
  800417:	00 00 00 
  80041a:	ff d0                	callq  *%rax
  80041c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800420:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  800426:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80042a:	8b 40 04             	mov    0x4(%rax),%eax
  80042d:	8d 50 01             	lea    0x1(%rax),%edx
  800430:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800434:	89 50 04             	mov    %edx,0x4(%rax)
  800437:	c9                   	leaveq 
  800438:	c3                   	retq   

0000000000800439 <vcprintf>:
  800439:	55                   	push   %rbp
  80043a:	48 89 e5             	mov    %rsp,%rbp
  80043d:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  800444:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  80044b:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  800452:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  800459:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  800460:	48 8b 0a             	mov    (%rdx),%rcx
  800463:	48 89 08             	mov    %rcx,(%rax)
  800466:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80046a:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80046e:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800472:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800476:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  80047d:	00 00 00 
  800480:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  800487:	00 00 00 
  80048a:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  800491:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  800498:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  80049f:	48 89 c6             	mov    %rax,%rsi
  8004a2:	48 bf c0 03 80 00 00 	movabs $0x8003c0,%rdi
  8004a9:	00 00 00 
  8004ac:	48 b8 98 08 80 00 00 	movabs $0x800898,%rax
  8004b3:	00 00 00 
  8004b6:	ff d0                	callq  *%rax
  8004b8:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  8004be:	48 98                	cltq   
  8004c0:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  8004c7:	48 83 c2 08          	add    $0x8,%rdx
  8004cb:	48 89 c6             	mov    %rax,%rsi
  8004ce:	48 89 d7             	mov    %rdx,%rdi
  8004d1:	48 b8 81 18 80 00 00 	movabs $0x801881,%rax
  8004d8:	00 00 00 
  8004db:	ff d0                	callq  *%rax
  8004dd:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  8004e3:	c9                   	leaveq 
  8004e4:	c3                   	retq   

00000000008004e5 <cprintf>:
  8004e5:	55                   	push   %rbp
  8004e6:	48 89 e5             	mov    %rsp,%rbp
  8004e9:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  8004f0:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  8004f7:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  8004fe:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800505:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  80050c:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800513:	84 c0                	test   %al,%al
  800515:	74 20                	je     800537 <cprintf+0x52>
  800517:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  80051b:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80051f:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800523:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800527:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  80052b:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  80052f:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800533:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800537:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  80053e:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  800545:	00 00 00 
  800548:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  80054f:	00 00 00 
  800552:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800556:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  80055d:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800564:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  80056b:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800572:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800579:	48 8b 0a             	mov    (%rdx),%rcx
  80057c:	48 89 08             	mov    %rcx,(%rax)
  80057f:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800583:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800587:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  80058b:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80058f:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  800596:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  80059d:	48 89 d6             	mov    %rdx,%rsi
  8005a0:	48 89 c7             	mov    %rax,%rdi
  8005a3:	48 b8 39 04 80 00 00 	movabs $0x800439,%rax
  8005aa:	00 00 00 
  8005ad:	ff d0                	callq  *%rax
  8005af:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  8005b5:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  8005bb:	c9                   	leaveq 
  8005bc:	c3                   	retq   

00000000008005bd <printnum>:
  8005bd:	55                   	push   %rbp
  8005be:	48 89 e5             	mov    %rsp,%rbp
  8005c1:	53                   	push   %rbx
  8005c2:	48 83 ec 38          	sub    $0x38,%rsp
  8005c6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8005ca:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8005ce:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8005d2:	89 4d d4             	mov    %ecx,-0x2c(%rbp)
  8005d5:	44 89 45 d0          	mov    %r8d,-0x30(%rbp)
  8005d9:	44 89 4d cc          	mov    %r9d,-0x34(%rbp)
  8005dd:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  8005e0:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8005e4:	77 3b                	ja     800621 <printnum+0x64>
  8005e6:	8b 45 d0             	mov    -0x30(%rbp),%eax
  8005e9:	44 8d 40 ff          	lea    -0x1(%rax),%r8d
  8005ed:	8b 5d d4             	mov    -0x2c(%rbp),%ebx
  8005f0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8005f4:	ba 00 00 00 00       	mov    $0x0,%edx
  8005f9:	48 f7 f3             	div    %rbx
  8005fc:	48 89 c2             	mov    %rax,%rdx
  8005ff:	8b 7d cc             	mov    -0x34(%rbp),%edi
  800602:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  800605:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
  800609:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80060d:	41 89 f9             	mov    %edi,%r9d
  800610:	48 89 c7             	mov    %rax,%rdi
  800613:	48 b8 bd 05 80 00 00 	movabs $0x8005bd,%rax
  80061a:	00 00 00 
  80061d:	ff d0                	callq  *%rax
  80061f:	eb 1e                	jmp    80063f <printnum+0x82>
  800621:	eb 12                	jmp    800635 <printnum+0x78>
  800623:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  800627:	8b 55 cc             	mov    -0x34(%rbp),%edx
  80062a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80062e:	48 89 ce             	mov    %rcx,%rsi
  800631:	89 d7                	mov    %edx,%edi
  800633:	ff d0                	callq  *%rax
  800635:	83 6d d0 01          	subl   $0x1,-0x30(%rbp)
  800639:	83 7d d0 00          	cmpl   $0x0,-0x30(%rbp)
  80063d:	7f e4                	jg     800623 <printnum+0x66>
  80063f:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  800642:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800646:	ba 00 00 00 00       	mov    $0x0,%edx
  80064b:	48 f7 f1             	div    %rcx
  80064e:	48 89 d0             	mov    %rdx,%rax
  800651:	48 ba 90 4a 80 00 00 	movabs $0x804a90,%rdx
  800658:	00 00 00 
  80065b:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
  80065f:	0f be d0             	movsbl %al,%edx
  800662:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  800666:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80066a:	48 89 ce             	mov    %rcx,%rsi
  80066d:	89 d7                	mov    %edx,%edi
  80066f:	ff d0                	callq  *%rax
  800671:	48 83 c4 38          	add    $0x38,%rsp
  800675:	5b                   	pop    %rbx
  800676:	5d                   	pop    %rbp
  800677:	c3                   	retq   

0000000000800678 <getuint>:
  800678:	55                   	push   %rbp
  800679:	48 89 e5             	mov    %rsp,%rbp
  80067c:	48 83 ec 1c          	sub    $0x1c,%rsp
  800680:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800684:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800687:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  80068b:	7e 52                	jle    8006df <getuint+0x67>
  80068d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800691:	8b 00                	mov    (%rax),%eax
  800693:	83 f8 30             	cmp    $0x30,%eax
  800696:	73 24                	jae    8006bc <getuint+0x44>
  800698:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80069c:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8006a0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006a4:	8b 00                	mov    (%rax),%eax
  8006a6:	89 c0                	mov    %eax,%eax
  8006a8:	48 01 d0             	add    %rdx,%rax
  8006ab:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006af:	8b 12                	mov    (%rdx),%edx
  8006b1:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8006b4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006b8:	89 0a                	mov    %ecx,(%rdx)
  8006ba:	eb 17                	jmp    8006d3 <getuint+0x5b>
  8006bc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006c0:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8006c4:	48 89 d0             	mov    %rdx,%rax
  8006c7:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8006cb:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006cf:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8006d3:	48 8b 00             	mov    (%rax),%rax
  8006d6:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8006da:	e9 a3 00 00 00       	jmpq   800782 <getuint+0x10a>
  8006df:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  8006e3:	74 4f                	je     800734 <getuint+0xbc>
  8006e5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006e9:	8b 00                	mov    (%rax),%eax
  8006eb:	83 f8 30             	cmp    $0x30,%eax
  8006ee:	73 24                	jae    800714 <getuint+0x9c>
  8006f0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006f4:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8006f8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006fc:	8b 00                	mov    (%rax),%eax
  8006fe:	89 c0                	mov    %eax,%eax
  800700:	48 01 d0             	add    %rdx,%rax
  800703:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800707:	8b 12                	mov    (%rdx),%edx
  800709:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80070c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800710:	89 0a                	mov    %ecx,(%rdx)
  800712:	eb 17                	jmp    80072b <getuint+0xb3>
  800714:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800718:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80071c:	48 89 d0             	mov    %rdx,%rax
  80071f:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800723:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800727:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80072b:	48 8b 00             	mov    (%rax),%rax
  80072e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800732:	eb 4e                	jmp    800782 <getuint+0x10a>
  800734:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800738:	8b 00                	mov    (%rax),%eax
  80073a:	83 f8 30             	cmp    $0x30,%eax
  80073d:	73 24                	jae    800763 <getuint+0xeb>
  80073f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800743:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800747:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80074b:	8b 00                	mov    (%rax),%eax
  80074d:	89 c0                	mov    %eax,%eax
  80074f:	48 01 d0             	add    %rdx,%rax
  800752:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800756:	8b 12                	mov    (%rdx),%edx
  800758:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80075b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80075f:	89 0a                	mov    %ecx,(%rdx)
  800761:	eb 17                	jmp    80077a <getuint+0x102>
  800763:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800767:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80076b:	48 89 d0             	mov    %rdx,%rax
  80076e:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800772:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800776:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80077a:	8b 00                	mov    (%rax),%eax
  80077c:	89 c0                	mov    %eax,%eax
  80077e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800782:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800786:	c9                   	leaveq 
  800787:	c3                   	retq   

0000000000800788 <getint>:
  800788:	55                   	push   %rbp
  800789:	48 89 e5             	mov    %rsp,%rbp
  80078c:	48 83 ec 1c          	sub    $0x1c,%rsp
  800790:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800794:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800797:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  80079b:	7e 52                	jle    8007ef <getint+0x67>
  80079d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007a1:	8b 00                	mov    (%rax),%eax
  8007a3:	83 f8 30             	cmp    $0x30,%eax
  8007a6:	73 24                	jae    8007cc <getint+0x44>
  8007a8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007ac:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8007b0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007b4:	8b 00                	mov    (%rax),%eax
  8007b6:	89 c0                	mov    %eax,%eax
  8007b8:	48 01 d0             	add    %rdx,%rax
  8007bb:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007bf:	8b 12                	mov    (%rdx),%edx
  8007c1:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8007c4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007c8:	89 0a                	mov    %ecx,(%rdx)
  8007ca:	eb 17                	jmp    8007e3 <getint+0x5b>
  8007cc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007d0:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8007d4:	48 89 d0             	mov    %rdx,%rax
  8007d7:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8007db:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007df:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8007e3:	48 8b 00             	mov    (%rax),%rax
  8007e6:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8007ea:	e9 a3 00 00 00       	jmpq   800892 <getint+0x10a>
  8007ef:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  8007f3:	74 4f                	je     800844 <getint+0xbc>
  8007f5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007f9:	8b 00                	mov    (%rax),%eax
  8007fb:	83 f8 30             	cmp    $0x30,%eax
  8007fe:	73 24                	jae    800824 <getint+0x9c>
  800800:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800804:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800808:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80080c:	8b 00                	mov    (%rax),%eax
  80080e:	89 c0                	mov    %eax,%eax
  800810:	48 01 d0             	add    %rdx,%rax
  800813:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800817:	8b 12                	mov    (%rdx),%edx
  800819:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80081c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800820:	89 0a                	mov    %ecx,(%rdx)
  800822:	eb 17                	jmp    80083b <getint+0xb3>
  800824:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800828:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80082c:	48 89 d0             	mov    %rdx,%rax
  80082f:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800833:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800837:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80083b:	48 8b 00             	mov    (%rax),%rax
  80083e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800842:	eb 4e                	jmp    800892 <getint+0x10a>
  800844:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800848:	8b 00                	mov    (%rax),%eax
  80084a:	83 f8 30             	cmp    $0x30,%eax
  80084d:	73 24                	jae    800873 <getint+0xeb>
  80084f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800853:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800857:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80085b:	8b 00                	mov    (%rax),%eax
  80085d:	89 c0                	mov    %eax,%eax
  80085f:	48 01 d0             	add    %rdx,%rax
  800862:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800866:	8b 12                	mov    (%rdx),%edx
  800868:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80086b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80086f:	89 0a                	mov    %ecx,(%rdx)
  800871:	eb 17                	jmp    80088a <getint+0x102>
  800873:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800877:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80087b:	48 89 d0             	mov    %rdx,%rax
  80087e:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800882:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800886:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80088a:	8b 00                	mov    (%rax),%eax
  80088c:	48 98                	cltq   
  80088e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800892:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800896:	c9                   	leaveq 
  800897:	c3                   	retq   

0000000000800898 <vprintfmt>:
  800898:	55                   	push   %rbp
  800899:	48 89 e5             	mov    %rsp,%rbp
  80089c:	41 54                	push   %r12
  80089e:	53                   	push   %rbx
  80089f:	48 83 ec 60          	sub    $0x60,%rsp
  8008a3:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  8008a7:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  8008ab:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8008af:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  8008b3:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8008b7:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  8008bb:	48 8b 0a             	mov    (%rdx),%rcx
  8008be:	48 89 08             	mov    %rcx,(%rax)
  8008c1:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8008c5:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8008c9:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8008cd:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8008d1:	eb 17                	jmp    8008ea <vprintfmt+0x52>
  8008d3:	85 db                	test   %ebx,%ebx
  8008d5:	0f 84 cc 04 00 00    	je     800da7 <vprintfmt+0x50f>
  8008db:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8008df:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8008e3:	48 89 d6             	mov    %rdx,%rsi
  8008e6:	89 df                	mov    %ebx,%edi
  8008e8:	ff d0                	callq  *%rax
  8008ea:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8008ee:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8008f2:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8008f6:	0f b6 00             	movzbl (%rax),%eax
  8008f9:	0f b6 d8             	movzbl %al,%ebx
  8008fc:	83 fb 25             	cmp    $0x25,%ebx
  8008ff:	75 d2                	jne    8008d3 <vprintfmt+0x3b>
  800901:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  800905:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  80090c:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800913:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  80091a:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  800921:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800925:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800929:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  80092d:	0f b6 00             	movzbl (%rax),%eax
  800930:	0f b6 d8             	movzbl %al,%ebx
  800933:	8d 43 dd             	lea    -0x23(%rbx),%eax
  800936:	83 f8 55             	cmp    $0x55,%eax
  800939:	0f 87 34 04 00 00    	ja     800d73 <vprintfmt+0x4db>
  80093f:	89 c0                	mov    %eax,%eax
  800941:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800948:	00 
  800949:	48 b8 b8 4a 80 00 00 	movabs $0x804ab8,%rax
  800950:	00 00 00 
  800953:	48 01 d0             	add    %rdx,%rax
  800956:	48 8b 00             	mov    (%rax),%rax
  800959:	ff e0                	jmpq   *%rax
  80095b:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  80095f:	eb c0                	jmp    800921 <vprintfmt+0x89>
  800961:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  800965:	eb ba                	jmp    800921 <vprintfmt+0x89>
  800967:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  80096e:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800971:	89 d0                	mov    %edx,%eax
  800973:	c1 e0 02             	shl    $0x2,%eax
  800976:	01 d0                	add    %edx,%eax
  800978:	01 c0                	add    %eax,%eax
  80097a:	01 d8                	add    %ebx,%eax
  80097c:	83 e8 30             	sub    $0x30,%eax
  80097f:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800982:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800986:	0f b6 00             	movzbl (%rax),%eax
  800989:	0f be d8             	movsbl %al,%ebx
  80098c:	83 fb 2f             	cmp    $0x2f,%ebx
  80098f:	7e 0c                	jle    80099d <vprintfmt+0x105>
  800991:	83 fb 39             	cmp    $0x39,%ebx
  800994:	7f 07                	jg     80099d <vprintfmt+0x105>
  800996:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  80099b:	eb d1                	jmp    80096e <vprintfmt+0xd6>
  80099d:	eb 58                	jmp    8009f7 <vprintfmt+0x15f>
  80099f:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8009a2:	83 f8 30             	cmp    $0x30,%eax
  8009a5:	73 17                	jae    8009be <vprintfmt+0x126>
  8009a7:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8009ab:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8009ae:	89 c0                	mov    %eax,%eax
  8009b0:	48 01 d0             	add    %rdx,%rax
  8009b3:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8009b6:	83 c2 08             	add    $0x8,%edx
  8009b9:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8009bc:	eb 0f                	jmp    8009cd <vprintfmt+0x135>
  8009be:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  8009c2:	48 89 d0             	mov    %rdx,%rax
  8009c5:	48 83 c2 08          	add    $0x8,%rdx
  8009c9:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8009cd:	8b 00                	mov    (%rax),%eax
  8009cf:	89 45 d8             	mov    %eax,-0x28(%rbp)
  8009d2:	eb 23                	jmp    8009f7 <vprintfmt+0x15f>
  8009d4:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8009d8:	79 0c                	jns    8009e6 <vprintfmt+0x14e>
  8009da:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  8009e1:	e9 3b ff ff ff       	jmpq   800921 <vprintfmt+0x89>
  8009e6:	e9 36 ff ff ff       	jmpq   800921 <vprintfmt+0x89>
  8009eb:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  8009f2:	e9 2a ff ff ff       	jmpq   800921 <vprintfmt+0x89>
  8009f7:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8009fb:	79 12                	jns    800a0f <vprintfmt+0x177>
  8009fd:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800a00:	89 45 dc             	mov    %eax,-0x24(%rbp)
  800a03:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800a0a:	e9 12 ff ff ff       	jmpq   800921 <vprintfmt+0x89>
  800a0f:	e9 0d ff ff ff       	jmpq   800921 <vprintfmt+0x89>
  800a14:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  800a18:	e9 04 ff ff ff       	jmpq   800921 <vprintfmt+0x89>
  800a1d:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800a20:	83 f8 30             	cmp    $0x30,%eax
  800a23:	73 17                	jae    800a3c <vprintfmt+0x1a4>
  800a25:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800a29:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800a2c:	89 c0                	mov    %eax,%eax
  800a2e:	48 01 d0             	add    %rdx,%rax
  800a31:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800a34:	83 c2 08             	add    $0x8,%edx
  800a37:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800a3a:	eb 0f                	jmp    800a4b <vprintfmt+0x1b3>
  800a3c:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800a40:	48 89 d0             	mov    %rdx,%rax
  800a43:	48 83 c2 08          	add    $0x8,%rdx
  800a47:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800a4b:	8b 10                	mov    (%rax),%edx
  800a4d:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800a51:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a55:	48 89 ce             	mov    %rcx,%rsi
  800a58:	89 d7                	mov    %edx,%edi
  800a5a:	ff d0                	callq  *%rax
  800a5c:	e9 40 03 00 00       	jmpq   800da1 <vprintfmt+0x509>
  800a61:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800a64:	83 f8 30             	cmp    $0x30,%eax
  800a67:	73 17                	jae    800a80 <vprintfmt+0x1e8>
  800a69:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800a6d:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800a70:	89 c0                	mov    %eax,%eax
  800a72:	48 01 d0             	add    %rdx,%rax
  800a75:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800a78:	83 c2 08             	add    $0x8,%edx
  800a7b:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800a7e:	eb 0f                	jmp    800a8f <vprintfmt+0x1f7>
  800a80:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800a84:	48 89 d0             	mov    %rdx,%rax
  800a87:	48 83 c2 08          	add    $0x8,%rdx
  800a8b:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800a8f:	8b 18                	mov    (%rax),%ebx
  800a91:	85 db                	test   %ebx,%ebx
  800a93:	79 02                	jns    800a97 <vprintfmt+0x1ff>
  800a95:	f7 db                	neg    %ebx
  800a97:	83 fb 15             	cmp    $0x15,%ebx
  800a9a:	7f 16                	jg     800ab2 <vprintfmt+0x21a>
  800a9c:	48 b8 e0 49 80 00 00 	movabs $0x8049e0,%rax
  800aa3:	00 00 00 
  800aa6:	48 63 d3             	movslq %ebx,%rdx
  800aa9:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800aad:	4d 85 e4             	test   %r12,%r12
  800ab0:	75 2e                	jne    800ae0 <vprintfmt+0x248>
  800ab2:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800ab6:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800aba:	89 d9                	mov    %ebx,%ecx
  800abc:	48 ba a1 4a 80 00 00 	movabs $0x804aa1,%rdx
  800ac3:	00 00 00 
  800ac6:	48 89 c7             	mov    %rax,%rdi
  800ac9:	b8 00 00 00 00       	mov    $0x0,%eax
  800ace:	49 b8 b0 0d 80 00 00 	movabs $0x800db0,%r8
  800ad5:	00 00 00 
  800ad8:	41 ff d0             	callq  *%r8
  800adb:	e9 c1 02 00 00       	jmpq   800da1 <vprintfmt+0x509>
  800ae0:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800ae4:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ae8:	4c 89 e1             	mov    %r12,%rcx
  800aeb:	48 ba aa 4a 80 00 00 	movabs $0x804aaa,%rdx
  800af2:	00 00 00 
  800af5:	48 89 c7             	mov    %rax,%rdi
  800af8:	b8 00 00 00 00       	mov    $0x0,%eax
  800afd:	49 b8 b0 0d 80 00 00 	movabs $0x800db0,%r8
  800b04:	00 00 00 
  800b07:	41 ff d0             	callq  *%r8
  800b0a:	e9 92 02 00 00       	jmpq   800da1 <vprintfmt+0x509>
  800b0f:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b12:	83 f8 30             	cmp    $0x30,%eax
  800b15:	73 17                	jae    800b2e <vprintfmt+0x296>
  800b17:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800b1b:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b1e:	89 c0                	mov    %eax,%eax
  800b20:	48 01 d0             	add    %rdx,%rax
  800b23:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b26:	83 c2 08             	add    $0x8,%edx
  800b29:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800b2c:	eb 0f                	jmp    800b3d <vprintfmt+0x2a5>
  800b2e:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800b32:	48 89 d0             	mov    %rdx,%rax
  800b35:	48 83 c2 08          	add    $0x8,%rdx
  800b39:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800b3d:	4c 8b 20             	mov    (%rax),%r12
  800b40:	4d 85 e4             	test   %r12,%r12
  800b43:	75 0a                	jne    800b4f <vprintfmt+0x2b7>
  800b45:	49 bc ad 4a 80 00 00 	movabs $0x804aad,%r12
  800b4c:	00 00 00 
  800b4f:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800b53:	7e 3f                	jle    800b94 <vprintfmt+0x2fc>
  800b55:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  800b59:	74 39                	je     800b94 <vprintfmt+0x2fc>
  800b5b:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800b5e:	48 98                	cltq   
  800b60:	48 89 c6             	mov    %rax,%rsi
  800b63:	4c 89 e7             	mov    %r12,%rdi
  800b66:	48 b8 5c 10 80 00 00 	movabs $0x80105c,%rax
  800b6d:	00 00 00 
  800b70:	ff d0                	callq  *%rax
  800b72:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800b75:	eb 17                	jmp    800b8e <vprintfmt+0x2f6>
  800b77:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800b7b:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800b7f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b83:	48 89 ce             	mov    %rcx,%rsi
  800b86:	89 d7                	mov    %edx,%edi
  800b88:	ff d0                	callq  *%rax
  800b8a:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800b8e:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800b92:	7f e3                	jg     800b77 <vprintfmt+0x2df>
  800b94:	eb 37                	jmp    800bcd <vprintfmt+0x335>
  800b96:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  800b9a:	74 1e                	je     800bba <vprintfmt+0x322>
  800b9c:	83 fb 1f             	cmp    $0x1f,%ebx
  800b9f:	7e 05                	jle    800ba6 <vprintfmt+0x30e>
  800ba1:	83 fb 7e             	cmp    $0x7e,%ebx
  800ba4:	7e 14                	jle    800bba <vprintfmt+0x322>
  800ba6:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800baa:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800bae:	48 89 d6             	mov    %rdx,%rsi
  800bb1:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800bb6:	ff d0                	callq  *%rax
  800bb8:	eb 0f                	jmp    800bc9 <vprintfmt+0x331>
  800bba:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800bbe:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800bc2:	48 89 d6             	mov    %rdx,%rsi
  800bc5:	89 df                	mov    %ebx,%edi
  800bc7:	ff d0                	callq  *%rax
  800bc9:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800bcd:	4c 89 e0             	mov    %r12,%rax
  800bd0:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800bd4:	0f b6 00             	movzbl (%rax),%eax
  800bd7:	0f be d8             	movsbl %al,%ebx
  800bda:	85 db                	test   %ebx,%ebx
  800bdc:	74 10                	je     800bee <vprintfmt+0x356>
  800bde:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800be2:	78 b2                	js     800b96 <vprintfmt+0x2fe>
  800be4:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800be8:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800bec:	79 a8                	jns    800b96 <vprintfmt+0x2fe>
  800bee:	eb 16                	jmp    800c06 <vprintfmt+0x36e>
  800bf0:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800bf4:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800bf8:	48 89 d6             	mov    %rdx,%rsi
  800bfb:	bf 20 00 00 00       	mov    $0x20,%edi
  800c00:	ff d0                	callq  *%rax
  800c02:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800c06:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800c0a:	7f e4                	jg     800bf0 <vprintfmt+0x358>
  800c0c:	e9 90 01 00 00       	jmpq   800da1 <vprintfmt+0x509>
  800c11:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800c15:	be 03 00 00 00       	mov    $0x3,%esi
  800c1a:	48 89 c7             	mov    %rax,%rdi
  800c1d:	48 b8 88 07 80 00 00 	movabs $0x800788,%rax
  800c24:	00 00 00 
  800c27:	ff d0                	callq  *%rax
  800c29:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800c2d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c31:	48 85 c0             	test   %rax,%rax
  800c34:	79 1d                	jns    800c53 <vprintfmt+0x3bb>
  800c36:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c3a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c3e:	48 89 d6             	mov    %rdx,%rsi
  800c41:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800c46:	ff d0                	callq  *%rax
  800c48:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c4c:	48 f7 d8             	neg    %rax
  800c4f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800c53:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800c5a:	e9 d5 00 00 00       	jmpq   800d34 <vprintfmt+0x49c>
  800c5f:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800c63:	be 03 00 00 00       	mov    $0x3,%esi
  800c68:	48 89 c7             	mov    %rax,%rdi
  800c6b:	48 b8 78 06 80 00 00 	movabs $0x800678,%rax
  800c72:	00 00 00 
  800c75:	ff d0                	callq  *%rax
  800c77:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800c7b:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800c82:	e9 ad 00 00 00       	jmpq   800d34 <vprintfmt+0x49c>
  800c87:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800c8b:	be 03 00 00 00       	mov    $0x3,%esi
  800c90:	48 89 c7             	mov    %rax,%rdi
  800c93:	48 b8 78 06 80 00 00 	movabs $0x800678,%rax
  800c9a:	00 00 00 
  800c9d:	ff d0                	callq  *%rax
  800c9f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800ca3:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800caa:	e9 85 00 00 00       	jmpq   800d34 <vprintfmt+0x49c>
  800caf:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800cb3:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800cb7:	48 89 d6             	mov    %rdx,%rsi
  800cba:	bf 30 00 00 00       	mov    $0x30,%edi
  800cbf:	ff d0                	callq  *%rax
  800cc1:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800cc5:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800cc9:	48 89 d6             	mov    %rdx,%rsi
  800ccc:	bf 78 00 00 00       	mov    $0x78,%edi
  800cd1:	ff d0                	callq  *%rax
  800cd3:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800cd6:	83 f8 30             	cmp    $0x30,%eax
  800cd9:	73 17                	jae    800cf2 <vprintfmt+0x45a>
  800cdb:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800cdf:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800ce2:	89 c0                	mov    %eax,%eax
  800ce4:	48 01 d0             	add    %rdx,%rax
  800ce7:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800cea:	83 c2 08             	add    $0x8,%edx
  800ced:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800cf0:	eb 0f                	jmp    800d01 <vprintfmt+0x469>
  800cf2:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800cf6:	48 89 d0             	mov    %rdx,%rax
  800cf9:	48 83 c2 08          	add    $0x8,%rdx
  800cfd:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800d01:	48 8b 00             	mov    (%rax),%rax
  800d04:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800d08:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800d0f:	eb 23                	jmp    800d34 <vprintfmt+0x49c>
  800d11:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800d15:	be 03 00 00 00       	mov    $0x3,%esi
  800d1a:	48 89 c7             	mov    %rax,%rdi
  800d1d:	48 b8 78 06 80 00 00 	movabs $0x800678,%rax
  800d24:	00 00 00 
  800d27:	ff d0                	callq  *%rax
  800d29:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800d2d:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800d34:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  800d39:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800d3c:	8b 7d dc             	mov    -0x24(%rbp),%edi
  800d3f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800d43:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800d47:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d4b:	45 89 c1             	mov    %r8d,%r9d
  800d4e:	41 89 f8             	mov    %edi,%r8d
  800d51:	48 89 c7             	mov    %rax,%rdi
  800d54:	48 b8 bd 05 80 00 00 	movabs $0x8005bd,%rax
  800d5b:	00 00 00 
  800d5e:	ff d0                	callq  *%rax
  800d60:	eb 3f                	jmp    800da1 <vprintfmt+0x509>
  800d62:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d66:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d6a:	48 89 d6             	mov    %rdx,%rsi
  800d6d:	89 df                	mov    %ebx,%edi
  800d6f:	ff d0                	callq  *%rax
  800d71:	eb 2e                	jmp    800da1 <vprintfmt+0x509>
  800d73:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d77:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d7b:	48 89 d6             	mov    %rdx,%rsi
  800d7e:	bf 25 00 00 00       	mov    $0x25,%edi
  800d83:	ff d0                	callq  *%rax
  800d85:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800d8a:	eb 05                	jmp    800d91 <vprintfmt+0x4f9>
  800d8c:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800d91:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800d95:	48 83 e8 01          	sub    $0x1,%rax
  800d99:	0f b6 00             	movzbl (%rax),%eax
  800d9c:	3c 25                	cmp    $0x25,%al
  800d9e:	75 ec                	jne    800d8c <vprintfmt+0x4f4>
  800da0:	90                   	nop
  800da1:	90                   	nop
  800da2:	e9 43 fb ff ff       	jmpq   8008ea <vprintfmt+0x52>
  800da7:	48 83 c4 60          	add    $0x60,%rsp
  800dab:	5b                   	pop    %rbx
  800dac:	41 5c                	pop    %r12
  800dae:	5d                   	pop    %rbp
  800daf:	c3                   	retq   

0000000000800db0 <printfmt>:
  800db0:	55                   	push   %rbp
  800db1:	48 89 e5             	mov    %rsp,%rbp
  800db4:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  800dbb:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  800dc2:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  800dc9:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800dd0:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800dd7:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800dde:	84 c0                	test   %al,%al
  800de0:	74 20                	je     800e02 <printfmt+0x52>
  800de2:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800de6:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800dea:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800dee:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800df2:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800df6:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800dfa:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800dfe:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800e02:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  800e09:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  800e10:	00 00 00 
  800e13:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  800e1a:	00 00 00 
  800e1d:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800e21:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800e28:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800e2f:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  800e36:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  800e3d:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800e44:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  800e4b:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  800e52:	48 89 c7             	mov    %rax,%rdi
  800e55:	48 b8 98 08 80 00 00 	movabs $0x800898,%rax
  800e5c:	00 00 00 
  800e5f:	ff d0                	callq  *%rax
  800e61:	c9                   	leaveq 
  800e62:	c3                   	retq   

0000000000800e63 <sprintputch>:
  800e63:	55                   	push   %rbp
  800e64:	48 89 e5             	mov    %rsp,%rbp
  800e67:	48 83 ec 10          	sub    $0x10,%rsp
  800e6b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800e6e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800e72:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e76:	8b 40 10             	mov    0x10(%rax),%eax
  800e79:	8d 50 01             	lea    0x1(%rax),%edx
  800e7c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e80:	89 50 10             	mov    %edx,0x10(%rax)
  800e83:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e87:	48 8b 10             	mov    (%rax),%rdx
  800e8a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e8e:	48 8b 40 08          	mov    0x8(%rax),%rax
  800e92:	48 39 c2             	cmp    %rax,%rdx
  800e95:	73 17                	jae    800eae <sprintputch+0x4b>
  800e97:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e9b:	48 8b 00             	mov    (%rax),%rax
  800e9e:	48 8d 48 01          	lea    0x1(%rax),%rcx
  800ea2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800ea6:	48 89 0a             	mov    %rcx,(%rdx)
  800ea9:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800eac:	88 10                	mov    %dl,(%rax)
  800eae:	c9                   	leaveq 
  800eaf:	c3                   	retq   

0000000000800eb0 <vsnprintf>:
  800eb0:	55                   	push   %rbp
  800eb1:	48 89 e5             	mov    %rsp,%rbp
  800eb4:	48 83 ec 50          	sub    $0x50,%rsp
  800eb8:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  800ebc:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  800ebf:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  800ec3:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  800ec7:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  800ecb:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  800ecf:	48 8b 0a             	mov    (%rdx),%rcx
  800ed2:	48 89 08             	mov    %rcx,(%rax)
  800ed5:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800ed9:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800edd:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800ee1:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800ee5:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800ee9:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  800eed:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  800ef0:	48 98                	cltq   
  800ef2:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  800ef6:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800efa:	48 01 d0             	add    %rdx,%rax
  800efd:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  800f01:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800f08:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  800f0d:	74 06                	je     800f15 <vsnprintf+0x65>
  800f0f:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  800f13:	7f 07                	jg     800f1c <vsnprintf+0x6c>
  800f15:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800f1a:	eb 2f                	jmp    800f4b <vsnprintf+0x9b>
  800f1c:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  800f20:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  800f24:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  800f28:	48 89 c6             	mov    %rax,%rsi
  800f2b:	48 bf 63 0e 80 00 00 	movabs $0x800e63,%rdi
  800f32:	00 00 00 
  800f35:	48 b8 98 08 80 00 00 	movabs $0x800898,%rax
  800f3c:	00 00 00 
  800f3f:	ff d0                	callq  *%rax
  800f41:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800f45:	c6 00 00             	movb   $0x0,(%rax)
  800f48:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800f4b:	c9                   	leaveq 
  800f4c:	c3                   	retq   

0000000000800f4d <snprintf>:
  800f4d:	55                   	push   %rbp
  800f4e:	48 89 e5             	mov    %rsp,%rbp
  800f51:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  800f58:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800f5f:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  800f65:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800f6c:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800f73:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800f7a:	84 c0                	test   %al,%al
  800f7c:	74 20                	je     800f9e <snprintf+0x51>
  800f7e:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800f82:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800f86:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800f8a:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800f8e:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800f92:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800f96:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800f9a:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800f9e:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  800fa5:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  800fac:	00 00 00 
  800faf:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800fb6:	00 00 00 
  800fb9:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800fbd:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800fc4:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800fcb:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800fd2:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800fd9:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800fe0:	48 8b 0a             	mov    (%rdx),%rcx
  800fe3:	48 89 08             	mov    %rcx,(%rax)
  800fe6:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800fea:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800fee:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800ff2:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800ff6:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  800ffd:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  801004:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  80100a:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  801011:	48 89 c7             	mov    %rax,%rdi
  801014:	48 b8 b0 0e 80 00 00 	movabs $0x800eb0,%rax
  80101b:	00 00 00 
  80101e:	ff d0                	callq  *%rax
  801020:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  801026:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  80102c:	c9                   	leaveq 
  80102d:	c3                   	retq   

000000000080102e <strlen>:
  80102e:	55                   	push   %rbp
  80102f:	48 89 e5             	mov    %rsp,%rbp
  801032:	48 83 ec 18          	sub    $0x18,%rsp
  801036:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80103a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801041:	eb 09                	jmp    80104c <strlen+0x1e>
  801043:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801047:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80104c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801050:	0f b6 00             	movzbl (%rax),%eax
  801053:	84 c0                	test   %al,%al
  801055:	75 ec                	jne    801043 <strlen+0x15>
  801057:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80105a:	c9                   	leaveq 
  80105b:	c3                   	retq   

000000000080105c <strnlen>:
  80105c:	55                   	push   %rbp
  80105d:	48 89 e5             	mov    %rsp,%rbp
  801060:	48 83 ec 20          	sub    $0x20,%rsp
  801064:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801068:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80106c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801073:	eb 0e                	jmp    801083 <strnlen+0x27>
  801075:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801079:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80107e:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  801083:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  801088:	74 0b                	je     801095 <strnlen+0x39>
  80108a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80108e:	0f b6 00             	movzbl (%rax),%eax
  801091:	84 c0                	test   %al,%al
  801093:	75 e0                	jne    801075 <strnlen+0x19>
  801095:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801098:	c9                   	leaveq 
  801099:	c3                   	retq   

000000000080109a <strcpy>:
  80109a:	55                   	push   %rbp
  80109b:	48 89 e5             	mov    %rsp,%rbp
  80109e:	48 83 ec 20          	sub    $0x20,%rsp
  8010a2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8010a6:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8010aa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010ae:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8010b2:	90                   	nop
  8010b3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010b7:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8010bb:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8010bf:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8010c3:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8010c7:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8010cb:	0f b6 12             	movzbl (%rdx),%edx
  8010ce:	88 10                	mov    %dl,(%rax)
  8010d0:	0f b6 00             	movzbl (%rax),%eax
  8010d3:	84 c0                	test   %al,%al
  8010d5:	75 dc                	jne    8010b3 <strcpy+0x19>
  8010d7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010db:	c9                   	leaveq 
  8010dc:	c3                   	retq   

00000000008010dd <strcat>:
  8010dd:	55                   	push   %rbp
  8010de:	48 89 e5             	mov    %rsp,%rbp
  8010e1:	48 83 ec 20          	sub    $0x20,%rsp
  8010e5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8010e9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8010ed:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010f1:	48 89 c7             	mov    %rax,%rdi
  8010f4:	48 b8 2e 10 80 00 00 	movabs $0x80102e,%rax
  8010fb:	00 00 00 
  8010fe:	ff d0                	callq  *%rax
  801100:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801103:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801106:	48 63 d0             	movslq %eax,%rdx
  801109:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80110d:	48 01 c2             	add    %rax,%rdx
  801110:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801114:	48 89 c6             	mov    %rax,%rsi
  801117:	48 89 d7             	mov    %rdx,%rdi
  80111a:	48 b8 9a 10 80 00 00 	movabs $0x80109a,%rax
  801121:	00 00 00 
  801124:	ff d0                	callq  *%rax
  801126:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80112a:	c9                   	leaveq 
  80112b:	c3                   	retq   

000000000080112c <strncpy>:
  80112c:	55                   	push   %rbp
  80112d:	48 89 e5             	mov    %rsp,%rbp
  801130:	48 83 ec 28          	sub    $0x28,%rsp
  801134:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801138:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80113c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801140:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801144:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801148:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80114f:	00 
  801150:	eb 2a                	jmp    80117c <strncpy+0x50>
  801152:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801156:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80115a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80115e:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801162:	0f b6 12             	movzbl (%rdx),%edx
  801165:	88 10                	mov    %dl,(%rax)
  801167:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80116b:	0f b6 00             	movzbl (%rax),%eax
  80116e:	84 c0                	test   %al,%al
  801170:	74 05                	je     801177 <strncpy+0x4b>
  801172:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  801177:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80117c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801180:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  801184:	72 cc                	jb     801152 <strncpy+0x26>
  801186:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80118a:	c9                   	leaveq 
  80118b:	c3                   	retq   

000000000080118c <strlcpy>:
  80118c:	55                   	push   %rbp
  80118d:	48 89 e5             	mov    %rsp,%rbp
  801190:	48 83 ec 28          	sub    $0x28,%rsp
  801194:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801198:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80119c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8011a0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011a4:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8011a8:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8011ad:	74 3d                	je     8011ec <strlcpy+0x60>
  8011af:	eb 1d                	jmp    8011ce <strlcpy+0x42>
  8011b1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011b5:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8011b9:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8011bd:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8011c1:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8011c5:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8011c9:	0f b6 12             	movzbl (%rdx),%edx
  8011cc:	88 10                	mov    %dl,(%rax)
  8011ce:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  8011d3:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8011d8:	74 0b                	je     8011e5 <strlcpy+0x59>
  8011da:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8011de:	0f b6 00             	movzbl (%rax),%eax
  8011e1:	84 c0                	test   %al,%al
  8011e3:	75 cc                	jne    8011b1 <strlcpy+0x25>
  8011e5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011e9:	c6 00 00             	movb   $0x0,(%rax)
  8011ec:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8011f0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011f4:	48 29 c2             	sub    %rax,%rdx
  8011f7:	48 89 d0             	mov    %rdx,%rax
  8011fa:	c9                   	leaveq 
  8011fb:	c3                   	retq   

00000000008011fc <strcmp>:
  8011fc:	55                   	push   %rbp
  8011fd:	48 89 e5             	mov    %rsp,%rbp
  801200:	48 83 ec 10          	sub    $0x10,%rsp
  801204:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801208:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80120c:	eb 0a                	jmp    801218 <strcmp+0x1c>
  80120e:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801213:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801218:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80121c:	0f b6 00             	movzbl (%rax),%eax
  80121f:	84 c0                	test   %al,%al
  801221:	74 12                	je     801235 <strcmp+0x39>
  801223:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801227:	0f b6 10             	movzbl (%rax),%edx
  80122a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80122e:	0f b6 00             	movzbl (%rax),%eax
  801231:	38 c2                	cmp    %al,%dl
  801233:	74 d9                	je     80120e <strcmp+0x12>
  801235:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801239:	0f b6 00             	movzbl (%rax),%eax
  80123c:	0f b6 d0             	movzbl %al,%edx
  80123f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801243:	0f b6 00             	movzbl (%rax),%eax
  801246:	0f b6 c0             	movzbl %al,%eax
  801249:	29 c2                	sub    %eax,%edx
  80124b:	89 d0                	mov    %edx,%eax
  80124d:	c9                   	leaveq 
  80124e:	c3                   	retq   

000000000080124f <strncmp>:
  80124f:	55                   	push   %rbp
  801250:	48 89 e5             	mov    %rsp,%rbp
  801253:	48 83 ec 18          	sub    $0x18,%rsp
  801257:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80125b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80125f:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801263:	eb 0f                	jmp    801274 <strncmp+0x25>
  801265:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  80126a:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80126f:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801274:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801279:	74 1d                	je     801298 <strncmp+0x49>
  80127b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80127f:	0f b6 00             	movzbl (%rax),%eax
  801282:	84 c0                	test   %al,%al
  801284:	74 12                	je     801298 <strncmp+0x49>
  801286:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80128a:	0f b6 10             	movzbl (%rax),%edx
  80128d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801291:	0f b6 00             	movzbl (%rax),%eax
  801294:	38 c2                	cmp    %al,%dl
  801296:	74 cd                	je     801265 <strncmp+0x16>
  801298:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80129d:	75 07                	jne    8012a6 <strncmp+0x57>
  80129f:	b8 00 00 00 00       	mov    $0x0,%eax
  8012a4:	eb 18                	jmp    8012be <strncmp+0x6f>
  8012a6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012aa:	0f b6 00             	movzbl (%rax),%eax
  8012ad:	0f b6 d0             	movzbl %al,%edx
  8012b0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012b4:	0f b6 00             	movzbl (%rax),%eax
  8012b7:	0f b6 c0             	movzbl %al,%eax
  8012ba:	29 c2                	sub    %eax,%edx
  8012bc:	89 d0                	mov    %edx,%eax
  8012be:	c9                   	leaveq 
  8012bf:	c3                   	retq   

00000000008012c0 <strchr>:
  8012c0:	55                   	push   %rbp
  8012c1:	48 89 e5             	mov    %rsp,%rbp
  8012c4:	48 83 ec 0c          	sub    $0xc,%rsp
  8012c8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8012cc:	89 f0                	mov    %esi,%eax
  8012ce:	88 45 f4             	mov    %al,-0xc(%rbp)
  8012d1:	eb 17                	jmp    8012ea <strchr+0x2a>
  8012d3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012d7:	0f b6 00             	movzbl (%rax),%eax
  8012da:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8012dd:	75 06                	jne    8012e5 <strchr+0x25>
  8012df:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012e3:	eb 15                	jmp    8012fa <strchr+0x3a>
  8012e5:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8012ea:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012ee:	0f b6 00             	movzbl (%rax),%eax
  8012f1:	84 c0                	test   %al,%al
  8012f3:	75 de                	jne    8012d3 <strchr+0x13>
  8012f5:	b8 00 00 00 00       	mov    $0x0,%eax
  8012fa:	c9                   	leaveq 
  8012fb:	c3                   	retq   

00000000008012fc <strfind>:
  8012fc:	55                   	push   %rbp
  8012fd:	48 89 e5             	mov    %rsp,%rbp
  801300:	48 83 ec 0c          	sub    $0xc,%rsp
  801304:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801308:	89 f0                	mov    %esi,%eax
  80130a:	88 45 f4             	mov    %al,-0xc(%rbp)
  80130d:	eb 13                	jmp    801322 <strfind+0x26>
  80130f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801313:	0f b6 00             	movzbl (%rax),%eax
  801316:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801319:	75 02                	jne    80131d <strfind+0x21>
  80131b:	eb 10                	jmp    80132d <strfind+0x31>
  80131d:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801322:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801326:	0f b6 00             	movzbl (%rax),%eax
  801329:	84 c0                	test   %al,%al
  80132b:	75 e2                	jne    80130f <strfind+0x13>
  80132d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801331:	c9                   	leaveq 
  801332:	c3                   	retq   

0000000000801333 <memset>:
  801333:	55                   	push   %rbp
  801334:	48 89 e5             	mov    %rsp,%rbp
  801337:	48 83 ec 18          	sub    $0x18,%rsp
  80133b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80133f:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801342:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801346:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80134b:	75 06                	jne    801353 <memset+0x20>
  80134d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801351:	eb 69                	jmp    8013bc <memset+0x89>
  801353:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801357:	83 e0 03             	and    $0x3,%eax
  80135a:	48 85 c0             	test   %rax,%rax
  80135d:	75 48                	jne    8013a7 <memset+0x74>
  80135f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801363:	83 e0 03             	and    $0x3,%eax
  801366:	48 85 c0             	test   %rax,%rax
  801369:	75 3c                	jne    8013a7 <memset+0x74>
  80136b:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  801372:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801375:	c1 e0 18             	shl    $0x18,%eax
  801378:	89 c2                	mov    %eax,%edx
  80137a:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80137d:	c1 e0 10             	shl    $0x10,%eax
  801380:	09 c2                	or     %eax,%edx
  801382:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801385:	c1 e0 08             	shl    $0x8,%eax
  801388:	09 d0                	or     %edx,%eax
  80138a:	09 45 f4             	or     %eax,-0xc(%rbp)
  80138d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801391:	48 c1 e8 02          	shr    $0x2,%rax
  801395:	48 89 c1             	mov    %rax,%rcx
  801398:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80139c:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80139f:	48 89 d7             	mov    %rdx,%rdi
  8013a2:	fc                   	cld    
  8013a3:	f3 ab                	rep stos %eax,%es:(%rdi)
  8013a5:	eb 11                	jmp    8013b8 <memset+0x85>
  8013a7:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8013ab:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8013ae:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8013b2:	48 89 d7             	mov    %rdx,%rdi
  8013b5:	fc                   	cld    
  8013b6:	f3 aa                	rep stos %al,%es:(%rdi)
  8013b8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013bc:	c9                   	leaveq 
  8013bd:	c3                   	retq   

00000000008013be <memmove>:
  8013be:	55                   	push   %rbp
  8013bf:	48 89 e5             	mov    %rsp,%rbp
  8013c2:	48 83 ec 28          	sub    $0x28,%rsp
  8013c6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8013ca:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8013ce:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8013d2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8013d6:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8013da:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013de:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8013e2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013e6:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8013ea:	0f 83 88 00 00 00    	jae    801478 <memmove+0xba>
  8013f0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8013f4:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8013f8:	48 01 d0             	add    %rdx,%rax
  8013fb:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8013ff:	76 77                	jbe    801478 <memmove+0xba>
  801401:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801405:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  801409:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80140d:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  801411:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801415:	83 e0 03             	and    $0x3,%eax
  801418:	48 85 c0             	test   %rax,%rax
  80141b:	75 3b                	jne    801458 <memmove+0x9a>
  80141d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801421:	83 e0 03             	and    $0x3,%eax
  801424:	48 85 c0             	test   %rax,%rax
  801427:	75 2f                	jne    801458 <memmove+0x9a>
  801429:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80142d:	83 e0 03             	and    $0x3,%eax
  801430:	48 85 c0             	test   %rax,%rax
  801433:	75 23                	jne    801458 <memmove+0x9a>
  801435:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801439:	48 83 e8 04          	sub    $0x4,%rax
  80143d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801441:	48 83 ea 04          	sub    $0x4,%rdx
  801445:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801449:	48 c1 e9 02          	shr    $0x2,%rcx
  80144d:	48 89 c7             	mov    %rax,%rdi
  801450:	48 89 d6             	mov    %rdx,%rsi
  801453:	fd                   	std    
  801454:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801456:	eb 1d                	jmp    801475 <memmove+0xb7>
  801458:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80145c:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801460:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801464:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  801468:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80146c:	48 89 d7             	mov    %rdx,%rdi
  80146f:	48 89 c1             	mov    %rax,%rcx
  801472:	fd                   	std    
  801473:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801475:	fc                   	cld    
  801476:	eb 57                	jmp    8014cf <memmove+0x111>
  801478:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80147c:	83 e0 03             	and    $0x3,%eax
  80147f:	48 85 c0             	test   %rax,%rax
  801482:	75 36                	jne    8014ba <memmove+0xfc>
  801484:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801488:	83 e0 03             	and    $0x3,%eax
  80148b:	48 85 c0             	test   %rax,%rax
  80148e:	75 2a                	jne    8014ba <memmove+0xfc>
  801490:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801494:	83 e0 03             	and    $0x3,%eax
  801497:	48 85 c0             	test   %rax,%rax
  80149a:	75 1e                	jne    8014ba <memmove+0xfc>
  80149c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014a0:	48 c1 e8 02          	shr    $0x2,%rax
  8014a4:	48 89 c1             	mov    %rax,%rcx
  8014a7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014ab:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8014af:	48 89 c7             	mov    %rax,%rdi
  8014b2:	48 89 d6             	mov    %rdx,%rsi
  8014b5:	fc                   	cld    
  8014b6:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  8014b8:	eb 15                	jmp    8014cf <memmove+0x111>
  8014ba:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014be:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8014c2:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  8014c6:	48 89 c7             	mov    %rax,%rdi
  8014c9:	48 89 d6             	mov    %rdx,%rsi
  8014cc:	fc                   	cld    
  8014cd:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  8014cf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014d3:	c9                   	leaveq 
  8014d4:	c3                   	retq   

00000000008014d5 <memcpy>:
  8014d5:	55                   	push   %rbp
  8014d6:	48 89 e5             	mov    %rsp,%rbp
  8014d9:	48 83 ec 18          	sub    $0x18,%rsp
  8014dd:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8014e1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8014e5:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8014e9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8014ed:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8014f1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014f5:	48 89 ce             	mov    %rcx,%rsi
  8014f8:	48 89 c7             	mov    %rax,%rdi
  8014fb:	48 b8 be 13 80 00 00 	movabs $0x8013be,%rax
  801502:	00 00 00 
  801505:	ff d0                	callq  *%rax
  801507:	c9                   	leaveq 
  801508:	c3                   	retq   

0000000000801509 <memcmp>:
  801509:	55                   	push   %rbp
  80150a:	48 89 e5             	mov    %rsp,%rbp
  80150d:	48 83 ec 28          	sub    $0x28,%rsp
  801511:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801515:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801519:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80151d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801521:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801525:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801529:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80152d:	eb 36                	jmp    801565 <memcmp+0x5c>
  80152f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801533:	0f b6 10             	movzbl (%rax),%edx
  801536:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80153a:	0f b6 00             	movzbl (%rax),%eax
  80153d:	38 c2                	cmp    %al,%dl
  80153f:	74 1a                	je     80155b <memcmp+0x52>
  801541:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801545:	0f b6 00             	movzbl (%rax),%eax
  801548:	0f b6 d0             	movzbl %al,%edx
  80154b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80154f:	0f b6 00             	movzbl (%rax),%eax
  801552:	0f b6 c0             	movzbl %al,%eax
  801555:	29 c2                	sub    %eax,%edx
  801557:	89 d0                	mov    %edx,%eax
  801559:	eb 20                	jmp    80157b <memcmp+0x72>
  80155b:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801560:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801565:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801569:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80156d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801571:	48 85 c0             	test   %rax,%rax
  801574:	75 b9                	jne    80152f <memcmp+0x26>
  801576:	b8 00 00 00 00       	mov    $0x0,%eax
  80157b:	c9                   	leaveq 
  80157c:	c3                   	retq   

000000000080157d <memfind>:
  80157d:	55                   	push   %rbp
  80157e:	48 89 e5             	mov    %rsp,%rbp
  801581:	48 83 ec 28          	sub    $0x28,%rsp
  801585:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801589:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80158c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801590:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801594:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801598:	48 01 d0             	add    %rdx,%rax
  80159b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80159f:	eb 15                	jmp    8015b6 <memfind+0x39>
  8015a1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8015a5:	0f b6 10             	movzbl (%rax),%edx
  8015a8:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8015ab:	38 c2                	cmp    %al,%dl
  8015ad:	75 02                	jne    8015b1 <memfind+0x34>
  8015af:	eb 0f                	jmp    8015c0 <memfind+0x43>
  8015b1:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8015b6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8015ba:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  8015be:	72 e1                	jb     8015a1 <memfind+0x24>
  8015c0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8015c4:	c9                   	leaveq 
  8015c5:	c3                   	retq   

00000000008015c6 <strtol>:
  8015c6:	55                   	push   %rbp
  8015c7:	48 89 e5             	mov    %rsp,%rbp
  8015ca:	48 83 ec 34          	sub    $0x34,%rsp
  8015ce:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8015d2:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8015d6:	89 55 cc             	mov    %edx,-0x34(%rbp)
  8015d9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8015e0:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  8015e7:	00 
  8015e8:	eb 05                	jmp    8015ef <strtol+0x29>
  8015ea:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8015ef:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015f3:	0f b6 00             	movzbl (%rax),%eax
  8015f6:	3c 20                	cmp    $0x20,%al
  8015f8:	74 f0                	je     8015ea <strtol+0x24>
  8015fa:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015fe:	0f b6 00             	movzbl (%rax),%eax
  801601:	3c 09                	cmp    $0x9,%al
  801603:	74 e5                	je     8015ea <strtol+0x24>
  801605:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801609:	0f b6 00             	movzbl (%rax),%eax
  80160c:	3c 2b                	cmp    $0x2b,%al
  80160e:	75 07                	jne    801617 <strtol+0x51>
  801610:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801615:	eb 17                	jmp    80162e <strtol+0x68>
  801617:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80161b:	0f b6 00             	movzbl (%rax),%eax
  80161e:	3c 2d                	cmp    $0x2d,%al
  801620:	75 0c                	jne    80162e <strtol+0x68>
  801622:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801627:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  80162e:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801632:	74 06                	je     80163a <strtol+0x74>
  801634:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  801638:	75 28                	jne    801662 <strtol+0x9c>
  80163a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80163e:	0f b6 00             	movzbl (%rax),%eax
  801641:	3c 30                	cmp    $0x30,%al
  801643:	75 1d                	jne    801662 <strtol+0x9c>
  801645:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801649:	48 83 c0 01          	add    $0x1,%rax
  80164d:	0f b6 00             	movzbl (%rax),%eax
  801650:	3c 78                	cmp    $0x78,%al
  801652:	75 0e                	jne    801662 <strtol+0x9c>
  801654:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  801659:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  801660:	eb 2c                	jmp    80168e <strtol+0xc8>
  801662:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801666:	75 19                	jne    801681 <strtol+0xbb>
  801668:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80166c:	0f b6 00             	movzbl (%rax),%eax
  80166f:	3c 30                	cmp    $0x30,%al
  801671:	75 0e                	jne    801681 <strtol+0xbb>
  801673:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801678:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  80167f:	eb 0d                	jmp    80168e <strtol+0xc8>
  801681:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801685:	75 07                	jne    80168e <strtol+0xc8>
  801687:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  80168e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801692:	0f b6 00             	movzbl (%rax),%eax
  801695:	3c 2f                	cmp    $0x2f,%al
  801697:	7e 1d                	jle    8016b6 <strtol+0xf0>
  801699:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80169d:	0f b6 00             	movzbl (%rax),%eax
  8016a0:	3c 39                	cmp    $0x39,%al
  8016a2:	7f 12                	jg     8016b6 <strtol+0xf0>
  8016a4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016a8:	0f b6 00             	movzbl (%rax),%eax
  8016ab:	0f be c0             	movsbl %al,%eax
  8016ae:	83 e8 30             	sub    $0x30,%eax
  8016b1:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8016b4:	eb 4e                	jmp    801704 <strtol+0x13e>
  8016b6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016ba:	0f b6 00             	movzbl (%rax),%eax
  8016bd:	3c 60                	cmp    $0x60,%al
  8016bf:	7e 1d                	jle    8016de <strtol+0x118>
  8016c1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016c5:	0f b6 00             	movzbl (%rax),%eax
  8016c8:	3c 7a                	cmp    $0x7a,%al
  8016ca:	7f 12                	jg     8016de <strtol+0x118>
  8016cc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016d0:	0f b6 00             	movzbl (%rax),%eax
  8016d3:	0f be c0             	movsbl %al,%eax
  8016d6:	83 e8 57             	sub    $0x57,%eax
  8016d9:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8016dc:	eb 26                	jmp    801704 <strtol+0x13e>
  8016de:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016e2:	0f b6 00             	movzbl (%rax),%eax
  8016e5:	3c 40                	cmp    $0x40,%al
  8016e7:	7e 48                	jle    801731 <strtol+0x16b>
  8016e9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016ed:	0f b6 00             	movzbl (%rax),%eax
  8016f0:	3c 5a                	cmp    $0x5a,%al
  8016f2:	7f 3d                	jg     801731 <strtol+0x16b>
  8016f4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016f8:	0f b6 00             	movzbl (%rax),%eax
  8016fb:	0f be c0             	movsbl %al,%eax
  8016fe:	83 e8 37             	sub    $0x37,%eax
  801701:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801704:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801707:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  80170a:	7c 02                	jl     80170e <strtol+0x148>
  80170c:	eb 23                	jmp    801731 <strtol+0x16b>
  80170e:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801713:	8b 45 cc             	mov    -0x34(%rbp),%eax
  801716:	48 98                	cltq   
  801718:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  80171d:	48 89 c2             	mov    %rax,%rdx
  801720:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801723:	48 98                	cltq   
  801725:	48 01 d0             	add    %rdx,%rax
  801728:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80172c:	e9 5d ff ff ff       	jmpq   80168e <strtol+0xc8>
  801731:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  801736:	74 0b                	je     801743 <strtol+0x17d>
  801738:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80173c:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801740:	48 89 10             	mov    %rdx,(%rax)
  801743:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801747:	74 09                	je     801752 <strtol+0x18c>
  801749:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80174d:	48 f7 d8             	neg    %rax
  801750:	eb 04                	jmp    801756 <strtol+0x190>
  801752:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801756:	c9                   	leaveq 
  801757:	c3                   	retq   

0000000000801758 <strstr>:
  801758:	55                   	push   %rbp
  801759:	48 89 e5             	mov    %rsp,%rbp
  80175c:	48 83 ec 30          	sub    $0x30,%rsp
  801760:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801764:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801768:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80176c:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801770:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801774:	0f b6 00             	movzbl (%rax),%eax
  801777:	88 45 ff             	mov    %al,-0x1(%rbp)
  80177a:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  80177e:	75 06                	jne    801786 <strstr+0x2e>
  801780:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801784:	eb 6b                	jmp    8017f1 <strstr+0x99>
  801786:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80178a:	48 89 c7             	mov    %rax,%rdi
  80178d:	48 b8 2e 10 80 00 00 	movabs $0x80102e,%rax
  801794:	00 00 00 
  801797:	ff d0                	callq  *%rax
  801799:	48 98                	cltq   
  80179b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80179f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017a3:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8017a7:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8017ab:	0f b6 00             	movzbl (%rax),%eax
  8017ae:	88 45 ef             	mov    %al,-0x11(%rbp)
  8017b1:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  8017b5:	75 07                	jne    8017be <strstr+0x66>
  8017b7:	b8 00 00 00 00       	mov    $0x0,%eax
  8017bc:	eb 33                	jmp    8017f1 <strstr+0x99>
  8017be:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  8017c2:	3a 45 ff             	cmp    -0x1(%rbp),%al
  8017c5:	75 d8                	jne    80179f <strstr+0x47>
  8017c7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8017cb:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  8017cf:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017d3:	48 89 ce             	mov    %rcx,%rsi
  8017d6:	48 89 c7             	mov    %rax,%rdi
  8017d9:	48 b8 4f 12 80 00 00 	movabs $0x80124f,%rax
  8017e0:	00 00 00 
  8017e3:	ff d0                	callq  *%rax
  8017e5:	85 c0                	test   %eax,%eax
  8017e7:	75 b6                	jne    80179f <strstr+0x47>
  8017e9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017ed:	48 83 e8 01          	sub    $0x1,%rax
  8017f1:	c9                   	leaveq 
  8017f2:	c3                   	retq   

00000000008017f3 <syscall>:
  8017f3:	55                   	push   %rbp
  8017f4:	48 89 e5             	mov    %rsp,%rbp
  8017f7:	53                   	push   %rbx
  8017f8:	48 83 ec 48          	sub    $0x48,%rsp
  8017fc:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8017ff:	89 75 d8             	mov    %esi,-0x28(%rbp)
  801802:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801806:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  80180a:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  80180e:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  801812:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801815:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  801819:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  80181d:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  801821:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  801825:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  801829:	4c 89 c3             	mov    %r8,%rbx
  80182c:	cd 30                	int    $0x30
  80182e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801832:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801836:	74 3e                	je     801876 <syscall+0x83>
  801838:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80183d:	7e 37                	jle    801876 <syscall+0x83>
  80183f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801843:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801846:	49 89 d0             	mov    %rdx,%r8
  801849:	89 c1                	mov    %eax,%ecx
  80184b:	48 ba 68 4d 80 00 00 	movabs $0x804d68,%rdx
  801852:	00 00 00 
  801855:	be 24 00 00 00       	mov    $0x24,%esi
  80185a:	48 bf 85 4d 80 00 00 	movabs $0x804d85,%rdi
  801861:	00 00 00 
  801864:	b8 00 00 00 00       	mov    $0x0,%eax
  801869:	49 b9 5a 3f 80 00 00 	movabs $0x803f5a,%r9
  801870:	00 00 00 
  801873:	41 ff d1             	callq  *%r9
  801876:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80187a:	48 83 c4 48          	add    $0x48,%rsp
  80187e:	5b                   	pop    %rbx
  80187f:	5d                   	pop    %rbp
  801880:	c3                   	retq   

0000000000801881 <sys_cputs>:
  801881:	55                   	push   %rbp
  801882:	48 89 e5             	mov    %rsp,%rbp
  801885:	48 83 ec 20          	sub    $0x20,%rsp
  801889:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80188d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801891:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801895:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801899:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8018a0:	00 
  8018a1:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8018a7:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8018ad:	48 89 d1             	mov    %rdx,%rcx
  8018b0:	48 89 c2             	mov    %rax,%rdx
  8018b3:	be 00 00 00 00       	mov    $0x0,%esi
  8018b8:	bf 00 00 00 00       	mov    $0x0,%edi
  8018bd:	48 b8 f3 17 80 00 00 	movabs $0x8017f3,%rax
  8018c4:	00 00 00 
  8018c7:	ff d0                	callq  *%rax
  8018c9:	c9                   	leaveq 
  8018ca:	c3                   	retq   

00000000008018cb <sys_cgetc>:
  8018cb:	55                   	push   %rbp
  8018cc:	48 89 e5             	mov    %rsp,%rbp
  8018cf:	48 83 ec 10          	sub    $0x10,%rsp
  8018d3:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8018da:	00 
  8018db:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8018e1:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8018e7:	b9 00 00 00 00       	mov    $0x0,%ecx
  8018ec:	ba 00 00 00 00       	mov    $0x0,%edx
  8018f1:	be 00 00 00 00       	mov    $0x0,%esi
  8018f6:	bf 01 00 00 00       	mov    $0x1,%edi
  8018fb:	48 b8 f3 17 80 00 00 	movabs $0x8017f3,%rax
  801902:	00 00 00 
  801905:	ff d0                	callq  *%rax
  801907:	c9                   	leaveq 
  801908:	c3                   	retq   

0000000000801909 <sys_env_destroy>:
  801909:	55                   	push   %rbp
  80190a:	48 89 e5             	mov    %rsp,%rbp
  80190d:	48 83 ec 10          	sub    $0x10,%rsp
  801911:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801914:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801917:	48 98                	cltq   
  801919:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801920:	00 
  801921:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801927:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80192d:	b9 00 00 00 00       	mov    $0x0,%ecx
  801932:	48 89 c2             	mov    %rax,%rdx
  801935:	be 01 00 00 00       	mov    $0x1,%esi
  80193a:	bf 03 00 00 00       	mov    $0x3,%edi
  80193f:	48 b8 f3 17 80 00 00 	movabs $0x8017f3,%rax
  801946:	00 00 00 
  801949:	ff d0                	callq  *%rax
  80194b:	c9                   	leaveq 
  80194c:	c3                   	retq   

000000000080194d <sys_getenvid>:
  80194d:	55                   	push   %rbp
  80194e:	48 89 e5             	mov    %rsp,%rbp
  801951:	48 83 ec 10          	sub    $0x10,%rsp
  801955:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80195c:	00 
  80195d:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801963:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801969:	b9 00 00 00 00       	mov    $0x0,%ecx
  80196e:	ba 00 00 00 00       	mov    $0x0,%edx
  801973:	be 00 00 00 00       	mov    $0x0,%esi
  801978:	bf 02 00 00 00       	mov    $0x2,%edi
  80197d:	48 b8 f3 17 80 00 00 	movabs $0x8017f3,%rax
  801984:	00 00 00 
  801987:	ff d0                	callq  *%rax
  801989:	c9                   	leaveq 
  80198a:	c3                   	retq   

000000000080198b <sys_yield>:
  80198b:	55                   	push   %rbp
  80198c:	48 89 e5             	mov    %rsp,%rbp
  80198f:	48 83 ec 10          	sub    $0x10,%rsp
  801993:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80199a:	00 
  80199b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8019a1:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8019a7:	b9 00 00 00 00       	mov    $0x0,%ecx
  8019ac:	ba 00 00 00 00       	mov    $0x0,%edx
  8019b1:	be 00 00 00 00       	mov    $0x0,%esi
  8019b6:	bf 0b 00 00 00       	mov    $0xb,%edi
  8019bb:	48 b8 f3 17 80 00 00 	movabs $0x8017f3,%rax
  8019c2:	00 00 00 
  8019c5:	ff d0                	callq  *%rax
  8019c7:	c9                   	leaveq 
  8019c8:	c3                   	retq   

00000000008019c9 <sys_page_alloc>:
  8019c9:	55                   	push   %rbp
  8019ca:	48 89 e5             	mov    %rsp,%rbp
  8019cd:	48 83 ec 20          	sub    $0x20,%rsp
  8019d1:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8019d4:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8019d8:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8019db:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8019de:	48 63 c8             	movslq %eax,%rcx
  8019e1:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8019e5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8019e8:	48 98                	cltq   
  8019ea:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8019f1:	00 
  8019f2:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8019f8:	49 89 c8             	mov    %rcx,%r8
  8019fb:	48 89 d1             	mov    %rdx,%rcx
  8019fe:	48 89 c2             	mov    %rax,%rdx
  801a01:	be 01 00 00 00       	mov    $0x1,%esi
  801a06:	bf 04 00 00 00       	mov    $0x4,%edi
  801a0b:	48 b8 f3 17 80 00 00 	movabs $0x8017f3,%rax
  801a12:	00 00 00 
  801a15:	ff d0                	callq  *%rax
  801a17:	c9                   	leaveq 
  801a18:	c3                   	retq   

0000000000801a19 <sys_page_map>:
  801a19:	55                   	push   %rbp
  801a1a:	48 89 e5             	mov    %rsp,%rbp
  801a1d:	48 83 ec 30          	sub    $0x30,%rsp
  801a21:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a24:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a28:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801a2b:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801a2f:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801a33:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801a36:	48 63 c8             	movslq %eax,%rcx
  801a39:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801a3d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801a40:	48 63 f0             	movslq %eax,%rsi
  801a43:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801a47:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a4a:	48 98                	cltq   
  801a4c:	48 89 0c 24          	mov    %rcx,(%rsp)
  801a50:	49 89 f9             	mov    %rdi,%r9
  801a53:	49 89 f0             	mov    %rsi,%r8
  801a56:	48 89 d1             	mov    %rdx,%rcx
  801a59:	48 89 c2             	mov    %rax,%rdx
  801a5c:	be 01 00 00 00       	mov    $0x1,%esi
  801a61:	bf 05 00 00 00       	mov    $0x5,%edi
  801a66:	48 b8 f3 17 80 00 00 	movabs $0x8017f3,%rax
  801a6d:	00 00 00 
  801a70:	ff d0                	callq  *%rax
  801a72:	c9                   	leaveq 
  801a73:	c3                   	retq   

0000000000801a74 <sys_page_unmap>:
  801a74:	55                   	push   %rbp
  801a75:	48 89 e5             	mov    %rsp,%rbp
  801a78:	48 83 ec 20          	sub    $0x20,%rsp
  801a7c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a7f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a83:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801a87:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a8a:	48 98                	cltq   
  801a8c:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801a93:	00 
  801a94:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a9a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801aa0:	48 89 d1             	mov    %rdx,%rcx
  801aa3:	48 89 c2             	mov    %rax,%rdx
  801aa6:	be 01 00 00 00       	mov    $0x1,%esi
  801aab:	bf 06 00 00 00       	mov    $0x6,%edi
  801ab0:	48 b8 f3 17 80 00 00 	movabs $0x8017f3,%rax
  801ab7:	00 00 00 
  801aba:	ff d0                	callq  *%rax
  801abc:	c9                   	leaveq 
  801abd:	c3                   	retq   

0000000000801abe <sys_env_set_status>:
  801abe:	55                   	push   %rbp
  801abf:	48 89 e5             	mov    %rsp,%rbp
  801ac2:	48 83 ec 10          	sub    $0x10,%rsp
  801ac6:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801ac9:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801acc:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801acf:	48 63 d0             	movslq %eax,%rdx
  801ad2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ad5:	48 98                	cltq   
  801ad7:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801ade:	00 
  801adf:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ae5:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801aeb:	48 89 d1             	mov    %rdx,%rcx
  801aee:	48 89 c2             	mov    %rax,%rdx
  801af1:	be 01 00 00 00       	mov    $0x1,%esi
  801af6:	bf 08 00 00 00       	mov    $0x8,%edi
  801afb:	48 b8 f3 17 80 00 00 	movabs $0x8017f3,%rax
  801b02:	00 00 00 
  801b05:	ff d0                	callq  *%rax
  801b07:	c9                   	leaveq 
  801b08:	c3                   	retq   

0000000000801b09 <sys_env_set_trapframe>:
  801b09:	55                   	push   %rbp
  801b0a:	48 89 e5             	mov    %rsp,%rbp
  801b0d:	48 83 ec 20          	sub    $0x20,%rsp
  801b11:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b14:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b18:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b1c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b1f:	48 98                	cltq   
  801b21:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801b28:	00 
  801b29:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b2f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b35:	48 89 d1             	mov    %rdx,%rcx
  801b38:	48 89 c2             	mov    %rax,%rdx
  801b3b:	be 01 00 00 00       	mov    $0x1,%esi
  801b40:	bf 09 00 00 00       	mov    $0x9,%edi
  801b45:	48 b8 f3 17 80 00 00 	movabs $0x8017f3,%rax
  801b4c:	00 00 00 
  801b4f:	ff d0                	callq  *%rax
  801b51:	c9                   	leaveq 
  801b52:	c3                   	retq   

0000000000801b53 <sys_env_set_pgfault_upcall>:
  801b53:	55                   	push   %rbp
  801b54:	48 89 e5             	mov    %rsp,%rbp
  801b57:	48 83 ec 20          	sub    $0x20,%rsp
  801b5b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b5e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b62:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b66:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b69:	48 98                	cltq   
  801b6b:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801b72:	00 
  801b73:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b79:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b7f:	48 89 d1             	mov    %rdx,%rcx
  801b82:	48 89 c2             	mov    %rax,%rdx
  801b85:	be 01 00 00 00       	mov    $0x1,%esi
  801b8a:	bf 0a 00 00 00       	mov    $0xa,%edi
  801b8f:	48 b8 f3 17 80 00 00 	movabs $0x8017f3,%rax
  801b96:	00 00 00 
  801b99:	ff d0                	callq  *%rax
  801b9b:	c9                   	leaveq 
  801b9c:	c3                   	retq   

0000000000801b9d <sys_ipc_try_send>:
  801b9d:	55                   	push   %rbp
  801b9e:	48 89 e5             	mov    %rsp,%rbp
  801ba1:	48 83 ec 20          	sub    $0x20,%rsp
  801ba5:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801ba8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801bac:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801bb0:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801bb3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801bb6:	48 63 f0             	movslq %eax,%rsi
  801bb9:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801bbd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801bc0:	48 98                	cltq   
  801bc2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801bc6:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801bcd:	00 
  801bce:	49 89 f1             	mov    %rsi,%r9
  801bd1:	49 89 c8             	mov    %rcx,%r8
  801bd4:	48 89 d1             	mov    %rdx,%rcx
  801bd7:	48 89 c2             	mov    %rax,%rdx
  801bda:	be 00 00 00 00       	mov    $0x0,%esi
  801bdf:	bf 0c 00 00 00       	mov    $0xc,%edi
  801be4:	48 b8 f3 17 80 00 00 	movabs $0x8017f3,%rax
  801beb:	00 00 00 
  801bee:	ff d0                	callq  *%rax
  801bf0:	c9                   	leaveq 
  801bf1:	c3                   	retq   

0000000000801bf2 <sys_ipc_recv>:
  801bf2:	55                   	push   %rbp
  801bf3:	48 89 e5             	mov    %rsp,%rbp
  801bf6:	48 83 ec 10          	sub    $0x10,%rsp
  801bfa:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801bfe:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c02:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c09:	00 
  801c0a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c10:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c16:	b9 00 00 00 00       	mov    $0x0,%ecx
  801c1b:	48 89 c2             	mov    %rax,%rdx
  801c1e:	be 01 00 00 00       	mov    $0x1,%esi
  801c23:	bf 0d 00 00 00       	mov    $0xd,%edi
  801c28:	48 b8 f3 17 80 00 00 	movabs $0x8017f3,%rax
  801c2f:	00 00 00 
  801c32:	ff d0                	callq  *%rax
  801c34:	c9                   	leaveq 
  801c35:	c3                   	retq   

0000000000801c36 <sys_time_msec>:
  801c36:	55                   	push   %rbp
  801c37:	48 89 e5             	mov    %rsp,%rbp
  801c3a:	48 83 ec 10          	sub    $0x10,%rsp
  801c3e:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c45:	00 
  801c46:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c4c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c52:	b9 00 00 00 00       	mov    $0x0,%ecx
  801c57:	ba 00 00 00 00       	mov    $0x0,%edx
  801c5c:	be 00 00 00 00       	mov    $0x0,%esi
  801c61:	bf 0e 00 00 00       	mov    $0xe,%edi
  801c66:	48 b8 f3 17 80 00 00 	movabs $0x8017f3,%rax
  801c6d:	00 00 00 
  801c70:	ff d0                	callq  *%rax
  801c72:	c9                   	leaveq 
  801c73:	c3                   	retq   

0000000000801c74 <sys_net_transmit>:
  801c74:	55                   	push   %rbp
  801c75:	48 89 e5             	mov    %rsp,%rbp
  801c78:	48 83 ec 20          	sub    $0x20,%rsp
  801c7c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c80:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801c83:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801c86:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c8a:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c91:	00 
  801c92:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c98:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c9e:	48 89 d1             	mov    %rdx,%rcx
  801ca1:	48 89 c2             	mov    %rax,%rdx
  801ca4:	be 00 00 00 00       	mov    $0x0,%esi
  801ca9:	bf 0f 00 00 00       	mov    $0xf,%edi
  801cae:	48 b8 f3 17 80 00 00 	movabs $0x8017f3,%rax
  801cb5:	00 00 00 
  801cb8:	ff d0                	callq  *%rax
  801cba:	c9                   	leaveq 
  801cbb:	c3                   	retq   

0000000000801cbc <sys_net_receive>:
  801cbc:	55                   	push   %rbp
  801cbd:	48 89 e5             	mov    %rsp,%rbp
  801cc0:	48 83 ec 20          	sub    $0x20,%rsp
  801cc4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801cc8:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801ccb:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801cce:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801cd2:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801cd9:	00 
  801cda:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ce0:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ce6:	48 89 d1             	mov    %rdx,%rcx
  801ce9:	48 89 c2             	mov    %rax,%rdx
  801cec:	be 00 00 00 00       	mov    $0x0,%esi
  801cf1:	bf 10 00 00 00       	mov    $0x10,%edi
  801cf6:	48 b8 f3 17 80 00 00 	movabs $0x8017f3,%rax
  801cfd:	00 00 00 
  801d00:	ff d0                	callq  *%rax
  801d02:	c9                   	leaveq 
  801d03:	c3                   	retq   

0000000000801d04 <sys_ept_map>:
  801d04:	55                   	push   %rbp
  801d05:	48 89 e5             	mov    %rsp,%rbp
  801d08:	48 83 ec 30          	sub    $0x30,%rsp
  801d0c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801d0f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d13:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801d16:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801d1a:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801d1e:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801d21:	48 63 c8             	movslq %eax,%rcx
  801d24:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801d28:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801d2b:	48 63 f0             	movslq %eax,%rsi
  801d2e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d32:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801d35:	48 98                	cltq   
  801d37:	48 89 0c 24          	mov    %rcx,(%rsp)
  801d3b:	49 89 f9             	mov    %rdi,%r9
  801d3e:	49 89 f0             	mov    %rsi,%r8
  801d41:	48 89 d1             	mov    %rdx,%rcx
  801d44:	48 89 c2             	mov    %rax,%rdx
  801d47:	be 00 00 00 00       	mov    $0x0,%esi
  801d4c:	bf 11 00 00 00       	mov    $0x11,%edi
  801d51:	48 b8 f3 17 80 00 00 	movabs $0x8017f3,%rax
  801d58:	00 00 00 
  801d5b:	ff d0                	callq  *%rax
  801d5d:	c9                   	leaveq 
  801d5e:	c3                   	retq   

0000000000801d5f <sys_env_mkguest>:
  801d5f:	55                   	push   %rbp
  801d60:	48 89 e5             	mov    %rsp,%rbp
  801d63:	48 83 ec 20          	sub    $0x20,%rsp
  801d67:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d6b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d6f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d73:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d77:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801d7e:	00 
  801d7f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d85:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d8b:	48 89 d1             	mov    %rdx,%rcx
  801d8e:	48 89 c2             	mov    %rax,%rdx
  801d91:	be 00 00 00 00       	mov    $0x0,%esi
  801d96:	bf 12 00 00 00       	mov    $0x12,%edi
  801d9b:	48 b8 f3 17 80 00 00 	movabs $0x8017f3,%rax
  801da2:	00 00 00 
  801da5:	ff d0                	callq  *%rax
  801da7:	c9                   	leaveq 
  801da8:	c3                   	retq   

0000000000801da9 <sys_vmx_list_vms>:
  801da9:	55                   	push   %rbp
  801daa:	48 89 e5             	mov    %rsp,%rbp
  801dad:	48 83 ec 10          	sub    $0x10,%rsp
  801db1:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801db8:	00 
  801db9:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801dbf:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801dc5:	b9 00 00 00 00       	mov    $0x0,%ecx
  801dca:	ba 00 00 00 00       	mov    $0x0,%edx
  801dcf:	be 00 00 00 00       	mov    $0x0,%esi
  801dd4:	bf 13 00 00 00       	mov    $0x13,%edi
  801dd9:	48 b8 f3 17 80 00 00 	movabs $0x8017f3,%rax
  801de0:	00 00 00 
  801de3:	ff d0                	callq  *%rax
  801de5:	c9                   	leaveq 
  801de6:	c3                   	retq   

0000000000801de7 <sys_vmx_sel_resume>:
  801de7:	55                   	push   %rbp
  801de8:	48 89 e5             	mov    %rsp,%rbp
  801deb:	48 83 ec 10          	sub    $0x10,%rsp
  801def:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801df2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801df5:	48 98                	cltq   
  801df7:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801dfe:	00 
  801dff:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e05:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e0b:	b9 00 00 00 00       	mov    $0x0,%ecx
  801e10:	48 89 c2             	mov    %rax,%rdx
  801e13:	be 00 00 00 00       	mov    $0x0,%esi
  801e18:	bf 14 00 00 00       	mov    $0x14,%edi
  801e1d:	48 b8 f3 17 80 00 00 	movabs $0x8017f3,%rax
  801e24:	00 00 00 
  801e27:	ff d0                	callq  *%rax
  801e29:	c9                   	leaveq 
  801e2a:	c3                   	retq   

0000000000801e2b <sys_vmx_get_vmdisk_number>:
  801e2b:	55                   	push   %rbp
  801e2c:	48 89 e5             	mov    %rsp,%rbp
  801e2f:	48 83 ec 10          	sub    $0x10,%rsp
  801e33:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801e3a:	00 
  801e3b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e41:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e47:	b9 00 00 00 00       	mov    $0x0,%ecx
  801e4c:	ba 00 00 00 00       	mov    $0x0,%edx
  801e51:	be 00 00 00 00       	mov    $0x0,%esi
  801e56:	bf 15 00 00 00       	mov    $0x15,%edi
  801e5b:	48 b8 f3 17 80 00 00 	movabs $0x8017f3,%rax
  801e62:	00 00 00 
  801e65:	ff d0                	callq  *%rax
  801e67:	c9                   	leaveq 
  801e68:	c3                   	retq   

0000000000801e69 <sys_vmx_incr_vmdisk_number>:
  801e69:	55                   	push   %rbp
  801e6a:	48 89 e5             	mov    %rsp,%rbp
  801e6d:	48 83 ec 10          	sub    $0x10,%rsp
  801e71:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801e78:	00 
  801e79:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e7f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e85:	b9 00 00 00 00       	mov    $0x0,%ecx
  801e8a:	ba 00 00 00 00       	mov    $0x0,%edx
  801e8f:	be 00 00 00 00       	mov    $0x0,%esi
  801e94:	bf 16 00 00 00       	mov    $0x16,%edi
  801e99:	48 b8 f3 17 80 00 00 	movabs $0x8017f3,%rax
  801ea0:	00 00 00 
  801ea3:	ff d0                	callq  *%rax
  801ea5:	c9                   	leaveq 
  801ea6:	c3                   	retq   

0000000000801ea7 <fd2num>:
  801ea7:	55                   	push   %rbp
  801ea8:	48 89 e5             	mov    %rsp,%rbp
  801eab:	48 83 ec 08          	sub    $0x8,%rsp
  801eaf:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801eb3:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801eb7:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  801ebe:	ff ff ff 
  801ec1:	48 01 d0             	add    %rdx,%rax
  801ec4:	48 c1 e8 0c          	shr    $0xc,%rax
  801ec8:	c9                   	leaveq 
  801ec9:	c3                   	retq   

0000000000801eca <fd2data>:
  801eca:	55                   	push   %rbp
  801ecb:	48 89 e5             	mov    %rsp,%rbp
  801ece:	48 83 ec 08          	sub    $0x8,%rsp
  801ed2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801ed6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801eda:	48 89 c7             	mov    %rax,%rdi
  801edd:	48 b8 a7 1e 80 00 00 	movabs $0x801ea7,%rax
  801ee4:	00 00 00 
  801ee7:	ff d0                	callq  *%rax
  801ee9:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  801eef:	48 c1 e0 0c          	shl    $0xc,%rax
  801ef3:	c9                   	leaveq 
  801ef4:	c3                   	retq   

0000000000801ef5 <fd_alloc>:
  801ef5:	55                   	push   %rbp
  801ef6:	48 89 e5             	mov    %rsp,%rbp
  801ef9:	48 83 ec 18          	sub    $0x18,%rsp
  801efd:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801f01:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801f08:	eb 6b                	jmp    801f75 <fd_alloc+0x80>
  801f0a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801f0d:	48 98                	cltq   
  801f0f:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801f15:	48 c1 e0 0c          	shl    $0xc,%rax
  801f19:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801f1d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801f21:	48 c1 e8 15          	shr    $0x15,%rax
  801f25:	48 89 c2             	mov    %rax,%rdx
  801f28:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  801f2f:	01 00 00 
  801f32:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801f36:	83 e0 01             	and    $0x1,%eax
  801f39:	48 85 c0             	test   %rax,%rax
  801f3c:	74 21                	je     801f5f <fd_alloc+0x6a>
  801f3e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801f42:	48 c1 e8 0c          	shr    $0xc,%rax
  801f46:	48 89 c2             	mov    %rax,%rdx
  801f49:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801f50:	01 00 00 
  801f53:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801f57:	83 e0 01             	and    $0x1,%eax
  801f5a:	48 85 c0             	test   %rax,%rax
  801f5d:	75 12                	jne    801f71 <fd_alloc+0x7c>
  801f5f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801f63:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801f67:	48 89 10             	mov    %rdx,(%rax)
  801f6a:	b8 00 00 00 00       	mov    $0x0,%eax
  801f6f:	eb 1a                	jmp    801f8b <fd_alloc+0x96>
  801f71:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801f75:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  801f79:	7e 8f                	jle    801f0a <fd_alloc+0x15>
  801f7b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801f7f:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  801f86:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  801f8b:	c9                   	leaveq 
  801f8c:	c3                   	retq   

0000000000801f8d <fd_lookup>:
  801f8d:	55                   	push   %rbp
  801f8e:	48 89 e5             	mov    %rsp,%rbp
  801f91:	48 83 ec 20          	sub    $0x20,%rsp
  801f95:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801f98:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801f9c:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  801fa0:	78 06                	js     801fa8 <fd_lookup+0x1b>
  801fa2:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  801fa6:	7e 07                	jle    801faf <fd_lookup+0x22>
  801fa8:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801fad:	eb 6c                	jmp    80201b <fd_lookup+0x8e>
  801faf:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801fb2:	48 98                	cltq   
  801fb4:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801fba:	48 c1 e0 0c          	shl    $0xc,%rax
  801fbe:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801fc2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801fc6:	48 c1 e8 15          	shr    $0x15,%rax
  801fca:	48 89 c2             	mov    %rax,%rdx
  801fcd:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  801fd4:	01 00 00 
  801fd7:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801fdb:	83 e0 01             	and    $0x1,%eax
  801fde:	48 85 c0             	test   %rax,%rax
  801fe1:	74 21                	je     802004 <fd_lookup+0x77>
  801fe3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801fe7:	48 c1 e8 0c          	shr    $0xc,%rax
  801feb:	48 89 c2             	mov    %rax,%rdx
  801fee:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801ff5:	01 00 00 
  801ff8:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801ffc:	83 e0 01             	and    $0x1,%eax
  801fff:	48 85 c0             	test   %rax,%rax
  802002:	75 07                	jne    80200b <fd_lookup+0x7e>
  802004:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802009:	eb 10                	jmp    80201b <fd_lookup+0x8e>
  80200b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80200f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802013:	48 89 10             	mov    %rdx,(%rax)
  802016:	b8 00 00 00 00       	mov    $0x0,%eax
  80201b:	c9                   	leaveq 
  80201c:	c3                   	retq   

000000000080201d <fd_close>:
  80201d:	55                   	push   %rbp
  80201e:	48 89 e5             	mov    %rsp,%rbp
  802021:	48 83 ec 30          	sub    $0x30,%rsp
  802025:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802029:	89 f0                	mov    %esi,%eax
  80202b:	88 45 d4             	mov    %al,-0x2c(%rbp)
  80202e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802032:	48 89 c7             	mov    %rax,%rdi
  802035:	48 b8 a7 1e 80 00 00 	movabs $0x801ea7,%rax
  80203c:	00 00 00 
  80203f:	ff d0                	callq  *%rax
  802041:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802045:	48 89 d6             	mov    %rdx,%rsi
  802048:	89 c7                	mov    %eax,%edi
  80204a:	48 b8 8d 1f 80 00 00 	movabs $0x801f8d,%rax
  802051:	00 00 00 
  802054:	ff d0                	callq  *%rax
  802056:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802059:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80205d:	78 0a                	js     802069 <fd_close+0x4c>
  80205f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802063:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  802067:	74 12                	je     80207b <fd_close+0x5e>
  802069:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  80206d:	74 05                	je     802074 <fd_close+0x57>
  80206f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802072:	eb 05                	jmp    802079 <fd_close+0x5c>
  802074:	b8 00 00 00 00       	mov    $0x0,%eax
  802079:	eb 69                	jmp    8020e4 <fd_close+0xc7>
  80207b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80207f:	8b 00                	mov    (%rax),%eax
  802081:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802085:	48 89 d6             	mov    %rdx,%rsi
  802088:	89 c7                	mov    %eax,%edi
  80208a:	48 b8 e6 20 80 00 00 	movabs $0x8020e6,%rax
  802091:	00 00 00 
  802094:	ff d0                	callq  *%rax
  802096:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802099:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80209d:	78 2a                	js     8020c9 <fd_close+0xac>
  80209f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8020a3:	48 8b 40 20          	mov    0x20(%rax),%rax
  8020a7:	48 85 c0             	test   %rax,%rax
  8020aa:	74 16                	je     8020c2 <fd_close+0xa5>
  8020ac:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8020b0:	48 8b 40 20          	mov    0x20(%rax),%rax
  8020b4:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8020b8:	48 89 d7             	mov    %rdx,%rdi
  8020bb:	ff d0                	callq  *%rax
  8020bd:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8020c0:	eb 07                	jmp    8020c9 <fd_close+0xac>
  8020c2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8020c9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8020cd:	48 89 c6             	mov    %rax,%rsi
  8020d0:	bf 00 00 00 00       	mov    $0x0,%edi
  8020d5:	48 b8 74 1a 80 00 00 	movabs $0x801a74,%rax
  8020dc:	00 00 00 
  8020df:	ff d0                	callq  *%rax
  8020e1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8020e4:	c9                   	leaveq 
  8020e5:	c3                   	retq   

00000000008020e6 <dev_lookup>:
  8020e6:	55                   	push   %rbp
  8020e7:	48 89 e5             	mov    %rsp,%rbp
  8020ea:	48 83 ec 20          	sub    $0x20,%rsp
  8020ee:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8020f1:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8020f5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8020fc:	eb 41                	jmp    80213f <dev_lookup+0x59>
  8020fe:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802105:	00 00 00 
  802108:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80210b:	48 63 d2             	movslq %edx,%rdx
  80210e:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802112:	8b 00                	mov    (%rax),%eax
  802114:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  802117:	75 22                	jne    80213b <dev_lookup+0x55>
  802119:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802120:	00 00 00 
  802123:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802126:	48 63 d2             	movslq %edx,%rdx
  802129:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  80212d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802131:	48 89 10             	mov    %rdx,(%rax)
  802134:	b8 00 00 00 00       	mov    $0x0,%eax
  802139:	eb 60                	jmp    80219b <dev_lookup+0xb5>
  80213b:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80213f:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802146:	00 00 00 
  802149:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80214c:	48 63 d2             	movslq %edx,%rdx
  80214f:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802153:	48 85 c0             	test   %rax,%rax
  802156:	75 a6                	jne    8020fe <dev_lookup+0x18>
  802158:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  80215f:	00 00 00 
  802162:	48 8b 00             	mov    (%rax),%rax
  802165:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80216b:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80216e:	89 c6                	mov    %eax,%esi
  802170:	48 bf 98 4d 80 00 00 	movabs $0x804d98,%rdi
  802177:	00 00 00 
  80217a:	b8 00 00 00 00       	mov    $0x0,%eax
  80217f:	48 b9 e5 04 80 00 00 	movabs $0x8004e5,%rcx
  802186:	00 00 00 
  802189:	ff d1                	callq  *%rcx
  80218b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80218f:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802196:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80219b:	c9                   	leaveq 
  80219c:	c3                   	retq   

000000000080219d <close>:
  80219d:	55                   	push   %rbp
  80219e:	48 89 e5             	mov    %rsp,%rbp
  8021a1:	48 83 ec 20          	sub    $0x20,%rsp
  8021a5:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8021a8:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8021ac:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8021af:	48 89 d6             	mov    %rdx,%rsi
  8021b2:	89 c7                	mov    %eax,%edi
  8021b4:	48 b8 8d 1f 80 00 00 	movabs $0x801f8d,%rax
  8021bb:	00 00 00 
  8021be:	ff d0                	callq  *%rax
  8021c0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8021c3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8021c7:	79 05                	jns    8021ce <close+0x31>
  8021c9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8021cc:	eb 18                	jmp    8021e6 <close+0x49>
  8021ce:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8021d2:	be 01 00 00 00       	mov    $0x1,%esi
  8021d7:	48 89 c7             	mov    %rax,%rdi
  8021da:	48 b8 1d 20 80 00 00 	movabs $0x80201d,%rax
  8021e1:	00 00 00 
  8021e4:	ff d0                	callq  *%rax
  8021e6:	c9                   	leaveq 
  8021e7:	c3                   	retq   

00000000008021e8 <close_all>:
  8021e8:	55                   	push   %rbp
  8021e9:	48 89 e5             	mov    %rsp,%rbp
  8021ec:	48 83 ec 10          	sub    $0x10,%rsp
  8021f0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8021f7:	eb 15                	jmp    80220e <close_all+0x26>
  8021f9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8021fc:	89 c7                	mov    %eax,%edi
  8021fe:	48 b8 9d 21 80 00 00 	movabs $0x80219d,%rax
  802205:	00 00 00 
  802208:	ff d0                	callq  *%rax
  80220a:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80220e:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802212:	7e e5                	jle    8021f9 <close_all+0x11>
  802214:	c9                   	leaveq 
  802215:	c3                   	retq   

0000000000802216 <dup>:
  802216:	55                   	push   %rbp
  802217:	48 89 e5             	mov    %rsp,%rbp
  80221a:	48 83 ec 40          	sub    $0x40,%rsp
  80221e:	89 7d cc             	mov    %edi,-0x34(%rbp)
  802221:	89 75 c8             	mov    %esi,-0x38(%rbp)
  802224:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  802228:	8b 45 cc             	mov    -0x34(%rbp),%eax
  80222b:	48 89 d6             	mov    %rdx,%rsi
  80222e:	89 c7                	mov    %eax,%edi
  802230:	48 b8 8d 1f 80 00 00 	movabs $0x801f8d,%rax
  802237:	00 00 00 
  80223a:	ff d0                	callq  *%rax
  80223c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80223f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802243:	79 08                	jns    80224d <dup+0x37>
  802245:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802248:	e9 70 01 00 00       	jmpq   8023bd <dup+0x1a7>
  80224d:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802250:	89 c7                	mov    %eax,%edi
  802252:	48 b8 9d 21 80 00 00 	movabs $0x80219d,%rax
  802259:	00 00 00 
  80225c:	ff d0                	callq  *%rax
  80225e:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802261:	48 98                	cltq   
  802263:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802269:	48 c1 e0 0c          	shl    $0xc,%rax
  80226d:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802271:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802275:	48 89 c7             	mov    %rax,%rdi
  802278:	48 b8 ca 1e 80 00 00 	movabs $0x801eca,%rax
  80227f:	00 00 00 
  802282:	ff d0                	callq  *%rax
  802284:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802288:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80228c:	48 89 c7             	mov    %rax,%rdi
  80228f:	48 b8 ca 1e 80 00 00 	movabs $0x801eca,%rax
  802296:	00 00 00 
  802299:	ff d0                	callq  *%rax
  80229b:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80229f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8022a3:	48 c1 e8 15          	shr    $0x15,%rax
  8022a7:	48 89 c2             	mov    %rax,%rdx
  8022aa:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8022b1:	01 00 00 
  8022b4:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8022b8:	83 e0 01             	and    $0x1,%eax
  8022bb:	48 85 c0             	test   %rax,%rax
  8022be:	74 73                	je     802333 <dup+0x11d>
  8022c0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8022c4:	48 c1 e8 0c          	shr    $0xc,%rax
  8022c8:	48 89 c2             	mov    %rax,%rdx
  8022cb:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8022d2:	01 00 00 
  8022d5:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8022d9:	83 e0 01             	and    $0x1,%eax
  8022dc:	48 85 c0             	test   %rax,%rax
  8022df:	74 52                	je     802333 <dup+0x11d>
  8022e1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8022e5:	48 c1 e8 0c          	shr    $0xc,%rax
  8022e9:	48 89 c2             	mov    %rax,%rdx
  8022ec:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8022f3:	01 00 00 
  8022f6:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8022fa:	25 07 0e 00 00       	and    $0xe07,%eax
  8022ff:	89 c1                	mov    %eax,%ecx
  802301:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802305:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802309:	41 89 c8             	mov    %ecx,%r8d
  80230c:	48 89 d1             	mov    %rdx,%rcx
  80230f:	ba 00 00 00 00       	mov    $0x0,%edx
  802314:	48 89 c6             	mov    %rax,%rsi
  802317:	bf 00 00 00 00       	mov    $0x0,%edi
  80231c:	48 b8 19 1a 80 00 00 	movabs $0x801a19,%rax
  802323:	00 00 00 
  802326:	ff d0                	callq  *%rax
  802328:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80232b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80232f:	79 02                	jns    802333 <dup+0x11d>
  802331:	eb 57                	jmp    80238a <dup+0x174>
  802333:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802337:	48 c1 e8 0c          	shr    $0xc,%rax
  80233b:	48 89 c2             	mov    %rax,%rdx
  80233e:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802345:	01 00 00 
  802348:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80234c:	25 07 0e 00 00       	and    $0xe07,%eax
  802351:	89 c1                	mov    %eax,%ecx
  802353:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802357:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80235b:	41 89 c8             	mov    %ecx,%r8d
  80235e:	48 89 d1             	mov    %rdx,%rcx
  802361:	ba 00 00 00 00       	mov    $0x0,%edx
  802366:	48 89 c6             	mov    %rax,%rsi
  802369:	bf 00 00 00 00       	mov    $0x0,%edi
  80236e:	48 b8 19 1a 80 00 00 	movabs $0x801a19,%rax
  802375:	00 00 00 
  802378:	ff d0                	callq  *%rax
  80237a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80237d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802381:	79 02                	jns    802385 <dup+0x16f>
  802383:	eb 05                	jmp    80238a <dup+0x174>
  802385:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802388:	eb 33                	jmp    8023bd <dup+0x1a7>
  80238a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80238e:	48 89 c6             	mov    %rax,%rsi
  802391:	bf 00 00 00 00       	mov    $0x0,%edi
  802396:	48 b8 74 1a 80 00 00 	movabs $0x801a74,%rax
  80239d:	00 00 00 
  8023a0:	ff d0                	callq  *%rax
  8023a2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8023a6:	48 89 c6             	mov    %rax,%rsi
  8023a9:	bf 00 00 00 00       	mov    $0x0,%edi
  8023ae:	48 b8 74 1a 80 00 00 	movabs $0x801a74,%rax
  8023b5:	00 00 00 
  8023b8:	ff d0                	callq  *%rax
  8023ba:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023bd:	c9                   	leaveq 
  8023be:	c3                   	retq   

00000000008023bf <read>:
  8023bf:	55                   	push   %rbp
  8023c0:	48 89 e5             	mov    %rsp,%rbp
  8023c3:	48 83 ec 40          	sub    $0x40,%rsp
  8023c7:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8023ca:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8023ce:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8023d2:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8023d6:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8023d9:	48 89 d6             	mov    %rdx,%rsi
  8023dc:	89 c7                	mov    %eax,%edi
  8023de:	48 b8 8d 1f 80 00 00 	movabs $0x801f8d,%rax
  8023e5:	00 00 00 
  8023e8:	ff d0                	callq  *%rax
  8023ea:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8023ed:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8023f1:	78 24                	js     802417 <read+0x58>
  8023f3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8023f7:	8b 00                	mov    (%rax),%eax
  8023f9:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8023fd:	48 89 d6             	mov    %rdx,%rsi
  802400:	89 c7                	mov    %eax,%edi
  802402:	48 b8 e6 20 80 00 00 	movabs $0x8020e6,%rax
  802409:	00 00 00 
  80240c:	ff d0                	callq  *%rax
  80240e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802411:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802415:	79 05                	jns    80241c <read+0x5d>
  802417:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80241a:	eb 76                	jmp    802492 <read+0xd3>
  80241c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802420:	8b 40 08             	mov    0x8(%rax),%eax
  802423:	83 e0 03             	and    $0x3,%eax
  802426:	83 f8 01             	cmp    $0x1,%eax
  802429:	75 3a                	jne    802465 <read+0xa6>
  80242b:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  802432:	00 00 00 
  802435:	48 8b 00             	mov    (%rax),%rax
  802438:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80243e:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802441:	89 c6                	mov    %eax,%esi
  802443:	48 bf b7 4d 80 00 00 	movabs $0x804db7,%rdi
  80244a:	00 00 00 
  80244d:	b8 00 00 00 00       	mov    $0x0,%eax
  802452:	48 b9 e5 04 80 00 00 	movabs $0x8004e5,%rcx
  802459:	00 00 00 
  80245c:	ff d1                	callq  *%rcx
  80245e:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802463:	eb 2d                	jmp    802492 <read+0xd3>
  802465:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802469:	48 8b 40 10          	mov    0x10(%rax),%rax
  80246d:	48 85 c0             	test   %rax,%rax
  802470:	75 07                	jne    802479 <read+0xba>
  802472:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802477:	eb 19                	jmp    802492 <read+0xd3>
  802479:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80247d:	48 8b 40 10          	mov    0x10(%rax),%rax
  802481:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802485:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802489:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  80248d:	48 89 cf             	mov    %rcx,%rdi
  802490:	ff d0                	callq  *%rax
  802492:	c9                   	leaveq 
  802493:	c3                   	retq   

0000000000802494 <readn>:
  802494:	55                   	push   %rbp
  802495:	48 89 e5             	mov    %rsp,%rbp
  802498:	48 83 ec 30          	sub    $0x30,%rsp
  80249c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80249f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8024a3:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8024a7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8024ae:	eb 49                	jmp    8024f9 <readn+0x65>
  8024b0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024b3:	48 98                	cltq   
  8024b5:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8024b9:	48 29 c2             	sub    %rax,%rdx
  8024bc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024bf:	48 63 c8             	movslq %eax,%rcx
  8024c2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8024c6:	48 01 c1             	add    %rax,%rcx
  8024c9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8024cc:	48 89 ce             	mov    %rcx,%rsi
  8024cf:	89 c7                	mov    %eax,%edi
  8024d1:	48 b8 bf 23 80 00 00 	movabs $0x8023bf,%rax
  8024d8:	00 00 00 
  8024db:	ff d0                	callq  *%rax
  8024dd:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8024e0:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8024e4:	79 05                	jns    8024eb <readn+0x57>
  8024e6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8024e9:	eb 1c                	jmp    802507 <readn+0x73>
  8024eb:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8024ef:	75 02                	jne    8024f3 <readn+0x5f>
  8024f1:	eb 11                	jmp    802504 <readn+0x70>
  8024f3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8024f6:	01 45 fc             	add    %eax,-0x4(%rbp)
  8024f9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024fc:	48 98                	cltq   
  8024fe:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802502:	72 ac                	jb     8024b0 <readn+0x1c>
  802504:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802507:	c9                   	leaveq 
  802508:	c3                   	retq   

0000000000802509 <write>:
  802509:	55                   	push   %rbp
  80250a:	48 89 e5             	mov    %rsp,%rbp
  80250d:	48 83 ec 40          	sub    $0x40,%rsp
  802511:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802514:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802518:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80251c:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802520:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802523:	48 89 d6             	mov    %rdx,%rsi
  802526:	89 c7                	mov    %eax,%edi
  802528:	48 b8 8d 1f 80 00 00 	movabs $0x801f8d,%rax
  80252f:	00 00 00 
  802532:	ff d0                	callq  *%rax
  802534:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802537:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80253b:	78 24                	js     802561 <write+0x58>
  80253d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802541:	8b 00                	mov    (%rax),%eax
  802543:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802547:	48 89 d6             	mov    %rdx,%rsi
  80254a:	89 c7                	mov    %eax,%edi
  80254c:	48 b8 e6 20 80 00 00 	movabs $0x8020e6,%rax
  802553:	00 00 00 
  802556:	ff d0                	callq  *%rax
  802558:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80255b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80255f:	79 05                	jns    802566 <write+0x5d>
  802561:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802564:	eb 75                	jmp    8025db <write+0xd2>
  802566:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80256a:	8b 40 08             	mov    0x8(%rax),%eax
  80256d:	83 e0 03             	and    $0x3,%eax
  802570:	85 c0                	test   %eax,%eax
  802572:	75 3a                	jne    8025ae <write+0xa5>
  802574:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  80257b:	00 00 00 
  80257e:	48 8b 00             	mov    (%rax),%rax
  802581:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802587:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80258a:	89 c6                	mov    %eax,%esi
  80258c:	48 bf d3 4d 80 00 00 	movabs $0x804dd3,%rdi
  802593:	00 00 00 
  802596:	b8 00 00 00 00       	mov    $0x0,%eax
  80259b:	48 b9 e5 04 80 00 00 	movabs $0x8004e5,%rcx
  8025a2:	00 00 00 
  8025a5:	ff d1                	callq  *%rcx
  8025a7:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8025ac:	eb 2d                	jmp    8025db <write+0xd2>
  8025ae:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8025b2:	48 8b 40 18          	mov    0x18(%rax),%rax
  8025b6:	48 85 c0             	test   %rax,%rax
  8025b9:	75 07                	jne    8025c2 <write+0xb9>
  8025bb:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8025c0:	eb 19                	jmp    8025db <write+0xd2>
  8025c2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8025c6:	48 8b 40 18          	mov    0x18(%rax),%rax
  8025ca:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8025ce:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8025d2:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  8025d6:	48 89 cf             	mov    %rcx,%rdi
  8025d9:	ff d0                	callq  *%rax
  8025db:	c9                   	leaveq 
  8025dc:	c3                   	retq   

00000000008025dd <seek>:
  8025dd:	55                   	push   %rbp
  8025de:	48 89 e5             	mov    %rsp,%rbp
  8025e1:	48 83 ec 18          	sub    $0x18,%rsp
  8025e5:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8025e8:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8025eb:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8025ef:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8025f2:	48 89 d6             	mov    %rdx,%rsi
  8025f5:	89 c7                	mov    %eax,%edi
  8025f7:	48 b8 8d 1f 80 00 00 	movabs $0x801f8d,%rax
  8025fe:	00 00 00 
  802601:	ff d0                	callq  *%rax
  802603:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802606:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80260a:	79 05                	jns    802611 <seek+0x34>
  80260c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80260f:	eb 0f                	jmp    802620 <seek+0x43>
  802611:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802615:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802618:	89 50 04             	mov    %edx,0x4(%rax)
  80261b:	b8 00 00 00 00       	mov    $0x0,%eax
  802620:	c9                   	leaveq 
  802621:	c3                   	retq   

0000000000802622 <ftruncate>:
  802622:	55                   	push   %rbp
  802623:	48 89 e5             	mov    %rsp,%rbp
  802626:	48 83 ec 30          	sub    $0x30,%rsp
  80262a:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80262d:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802630:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802634:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802637:	48 89 d6             	mov    %rdx,%rsi
  80263a:	89 c7                	mov    %eax,%edi
  80263c:	48 b8 8d 1f 80 00 00 	movabs $0x801f8d,%rax
  802643:	00 00 00 
  802646:	ff d0                	callq  *%rax
  802648:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80264b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80264f:	78 24                	js     802675 <ftruncate+0x53>
  802651:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802655:	8b 00                	mov    (%rax),%eax
  802657:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80265b:	48 89 d6             	mov    %rdx,%rsi
  80265e:	89 c7                	mov    %eax,%edi
  802660:	48 b8 e6 20 80 00 00 	movabs $0x8020e6,%rax
  802667:	00 00 00 
  80266a:	ff d0                	callq  *%rax
  80266c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80266f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802673:	79 05                	jns    80267a <ftruncate+0x58>
  802675:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802678:	eb 72                	jmp    8026ec <ftruncate+0xca>
  80267a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80267e:	8b 40 08             	mov    0x8(%rax),%eax
  802681:	83 e0 03             	and    $0x3,%eax
  802684:	85 c0                	test   %eax,%eax
  802686:	75 3a                	jne    8026c2 <ftruncate+0xa0>
  802688:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  80268f:	00 00 00 
  802692:	48 8b 00             	mov    (%rax),%rax
  802695:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80269b:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80269e:	89 c6                	mov    %eax,%esi
  8026a0:	48 bf f0 4d 80 00 00 	movabs $0x804df0,%rdi
  8026a7:	00 00 00 
  8026aa:	b8 00 00 00 00       	mov    $0x0,%eax
  8026af:	48 b9 e5 04 80 00 00 	movabs $0x8004e5,%rcx
  8026b6:	00 00 00 
  8026b9:	ff d1                	callq  *%rcx
  8026bb:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8026c0:	eb 2a                	jmp    8026ec <ftruncate+0xca>
  8026c2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8026c6:	48 8b 40 30          	mov    0x30(%rax),%rax
  8026ca:	48 85 c0             	test   %rax,%rax
  8026cd:	75 07                	jne    8026d6 <ftruncate+0xb4>
  8026cf:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8026d4:	eb 16                	jmp    8026ec <ftruncate+0xca>
  8026d6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8026da:	48 8b 40 30          	mov    0x30(%rax),%rax
  8026de:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8026e2:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  8026e5:	89 ce                	mov    %ecx,%esi
  8026e7:	48 89 d7             	mov    %rdx,%rdi
  8026ea:	ff d0                	callq  *%rax
  8026ec:	c9                   	leaveq 
  8026ed:	c3                   	retq   

00000000008026ee <fstat>:
  8026ee:	55                   	push   %rbp
  8026ef:	48 89 e5             	mov    %rsp,%rbp
  8026f2:	48 83 ec 30          	sub    $0x30,%rsp
  8026f6:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8026f9:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8026fd:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802701:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802704:	48 89 d6             	mov    %rdx,%rsi
  802707:	89 c7                	mov    %eax,%edi
  802709:	48 b8 8d 1f 80 00 00 	movabs $0x801f8d,%rax
  802710:	00 00 00 
  802713:	ff d0                	callq  *%rax
  802715:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802718:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80271c:	78 24                	js     802742 <fstat+0x54>
  80271e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802722:	8b 00                	mov    (%rax),%eax
  802724:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802728:	48 89 d6             	mov    %rdx,%rsi
  80272b:	89 c7                	mov    %eax,%edi
  80272d:	48 b8 e6 20 80 00 00 	movabs $0x8020e6,%rax
  802734:	00 00 00 
  802737:	ff d0                	callq  *%rax
  802739:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80273c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802740:	79 05                	jns    802747 <fstat+0x59>
  802742:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802745:	eb 5e                	jmp    8027a5 <fstat+0xb7>
  802747:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80274b:	48 8b 40 28          	mov    0x28(%rax),%rax
  80274f:	48 85 c0             	test   %rax,%rax
  802752:	75 07                	jne    80275b <fstat+0x6d>
  802754:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802759:	eb 4a                	jmp    8027a5 <fstat+0xb7>
  80275b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80275f:	c6 00 00             	movb   $0x0,(%rax)
  802762:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802766:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  80276d:	00 00 00 
  802770:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802774:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  80277b:	00 00 00 
  80277e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802782:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802786:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  80278d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802791:	48 8b 40 28          	mov    0x28(%rax),%rax
  802795:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802799:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  80279d:	48 89 ce             	mov    %rcx,%rsi
  8027a0:	48 89 d7             	mov    %rdx,%rdi
  8027a3:	ff d0                	callq  *%rax
  8027a5:	c9                   	leaveq 
  8027a6:	c3                   	retq   

00000000008027a7 <stat>:
  8027a7:	55                   	push   %rbp
  8027a8:	48 89 e5             	mov    %rsp,%rbp
  8027ab:	48 83 ec 20          	sub    $0x20,%rsp
  8027af:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8027b3:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8027b7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8027bb:	be 00 00 00 00       	mov    $0x0,%esi
  8027c0:	48 89 c7             	mov    %rax,%rdi
  8027c3:	48 b8 95 28 80 00 00 	movabs $0x802895,%rax
  8027ca:	00 00 00 
  8027cd:	ff d0                	callq  *%rax
  8027cf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8027d2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8027d6:	79 05                	jns    8027dd <stat+0x36>
  8027d8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8027db:	eb 2f                	jmp    80280c <stat+0x65>
  8027dd:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8027e1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8027e4:	48 89 d6             	mov    %rdx,%rsi
  8027e7:	89 c7                	mov    %eax,%edi
  8027e9:	48 b8 ee 26 80 00 00 	movabs $0x8026ee,%rax
  8027f0:	00 00 00 
  8027f3:	ff d0                	callq  *%rax
  8027f5:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8027f8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8027fb:	89 c7                	mov    %eax,%edi
  8027fd:	48 b8 9d 21 80 00 00 	movabs $0x80219d,%rax
  802804:	00 00 00 
  802807:	ff d0                	callq  *%rax
  802809:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80280c:	c9                   	leaveq 
  80280d:	c3                   	retq   

000000000080280e <fsipc>:
  80280e:	55                   	push   %rbp
  80280f:	48 89 e5             	mov    %rsp,%rbp
  802812:	48 83 ec 10          	sub    $0x10,%rsp
  802816:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802819:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80281d:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802824:	00 00 00 
  802827:	8b 00                	mov    (%rax),%eax
  802829:	85 c0                	test   %eax,%eax
  80282b:	75 1d                	jne    80284a <fsipc+0x3c>
  80282d:	bf 01 00 00 00       	mov    $0x1,%edi
  802832:	48 b8 c5 41 80 00 00 	movabs $0x8041c5,%rax
  802839:	00 00 00 
  80283c:	ff d0                	callq  *%rax
  80283e:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  802845:	00 00 00 
  802848:	89 02                	mov    %eax,(%rdx)
  80284a:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802851:	00 00 00 
  802854:	8b 00                	mov    (%rax),%eax
  802856:	8b 75 fc             	mov    -0x4(%rbp),%esi
  802859:	b9 07 00 00 00       	mov    $0x7,%ecx
  80285e:	48 ba 00 90 80 00 00 	movabs $0x809000,%rdx
  802865:	00 00 00 
  802868:	89 c7                	mov    %eax,%edi
  80286a:	48 b8 2f 41 80 00 00 	movabs $0x80412f,%rax
  802871:	00 00 00 
  802874:	ff d0                	callq  *%rax
  802876:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80287a:	ba 00 00 00 00       	mov    $0x0,%edx
  80287f:	48 89 c6             	mov    %rax,%rsi
  802882:	bf 00 00 00 00       	mov    $0x0,%edi
  802887:	48 b8 6e 40 80 00 00 	movabs $0x80406e,%rax
  80288e:	00 00 00 
  802891:	ff d0                	callq  *%rax
  802893:	c9                   	leaveq 
  802894:	c3                   	retq   

0000000000802895 <open>:
  802895:	55                   	push   %rbp
  802896:	48 89 e5             	mov    %rsp,%rbp
  802899:	48 83 ec 20          	sub    $0x20,%rsp
  80289d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8028a1:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8028a4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8028a8:	48 89 c7             	mov    %rax,%rdi
  8028ab:	48 b8 2e 10 80 00 00 	movabs $0x80102e,%rax
  8028b2:	00 00 00 
  8028b5:	ff d0                	callq  *%rax
  8028b7:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  8028bc:	7e 0a                	jle    8028c8 <open+0x33>
  8028be:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  8028c3:	e9 a5 00 00 00       	jmpq   80296d <open+0xd8>
  8028c8:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8028cc:	48 89 c7             	mov    %rax,%rdi
  8028cf:	48 b8 f5 1e 80 00 00 	movabs $0x801ef5,%rax
  8028d6:	00 00 00 
  8028d9:	ff d0                	callq  *%rax
  8028db:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8028de:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8028e2:	79 08                	jns    8028ec <open+0x57>
  8028e4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8028e7:	e9 81 00 00 00       	jmpq   80296d <open+0xd8>
  8028ec:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8028f0:	48 89 c6             	mov    %rax,%rsi
  8028f3:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  8028fa:	00 00 00 
  8028fd:	48 b8 9a 10 80 00 00 	movabs $0x80109a,%rax
  802904:	00 00 00 
  802907:	ff d0                	callq  *%rax
  802909:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802910:	00 00 00 
  802913:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  802916:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  80291c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802920:	48 89 c6             	mov    %rax,%rsi
  802923:	bf 01 00 00 00       	mov    $0x1,%edi
  802928:	48 b8 0e 28 80 00 00 	movabs $0x80280e,%rax
  80292f:	00 00 00 
  802932:	ff d0                	callq  *%rax
  802934:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802937:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80293b:	79 1d                	jns    80295a <open+0xc5>
  80293d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802941:	be 00 00 00 00       	mov    $0x0,%esi
  802946:	48 89 c7             	mov    %rax,%rdi
  802949:	48 b8 1d 20 80 00 00 	movabs $0x80201d,%rax
  802950:	00 00 00 
  802953:	ff d0                	callq  *%rax
  802955:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802958:	eb 13                	jmp    80296d <open+0xd8>
  80295a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80295e:	48 89 c7             	mov    %rax,%rdi
  802961:	48 b8 a7 1e 80 00 00 	movabs $0x801ea7,%rax
  802968:	00 00 00 
  80296b:	ff d0                	callq  *%rax
  80296d:	c9                   	leaveq 
  80296e:	c3                   	retq   

000000000080296f <devfile_flush>:
  80296f:	55                   	push   %rbp
  802970:	48 89 e5             	mov    %rsp,%rbp
  802973:	48 83 ec 10          	sub    $0x10,%rsp
  802977:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80297b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80297f:	8b 50 0c             	mov    0xc(%rax),%edx
  802982:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802989:	00 00 00 
  80298c:	89 10                	mov    %edx,(%rax)
  80298e:	be 00 00 00 00       	mov    $0x0,%esi
  802993:	bf 06 00 00 00       	mov    $0x6,%edi
  802998:	48 b8 0e 28 80 00 00 	movabs $0x80280e,%rax
  80299f:	00 00 00 
  8029a2:	ff d0                	callq  *%rax
  8029a4:	c9                   	leaveq 
  8029a5:	c3                   	retq   

00000000008029a6 <devfile_read>:
  8029a6:	55                   	push   %rbp
  8029a7:	48 89 e5             	mov    %rsp,%rbp
  8029aa:	48 83 ec 30          	sub    $0x30,%rsp
  8029ae:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8029b2:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8029b6:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8029ba:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8029be:	8b 50 0c             	mov    0xc(%rax),%edx
  8029c1:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8029c8:	00 00 00 
  8029cb:	89 10                	mov    %edx,(%rax)
  8029cd:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8029d4:	00 00 00 
  8029d7:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8029db:	48 89 50 08          	mov    %rdx,0x8(%rax)
  8029df:	be 00 00 00 00       	mov    $0x0,%esi
  8029e4:	bf 03 00 00 00       	mov    $0x3,%edi
  8029e9:	48 b8 0e 28 80 00 00 	movabs $0x80280e,%rax
  8029f0:	00 00 00 
  8029f3:	ff d0                	callq  *%rax
  8029f5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8029f8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8029fc:	79 08                	jns    802a06 <devfile_read+0x60>
  8029fe:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a01:	e9 a4 00 00 00       	jmpq   802aaa <devfile_read+0x104>
  802a06:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a09:	48 98                	cltq   
  802a0b:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802a0f:	76 35                	jbe    802a46 <devfile_read+0xa0>
  802a11:	48 b9 16 4e 80 00 00 	movabs $0x804e16,%rcx
  802a18:	00 00 00 
  802a1b:	48 ba 1d 4e 80 00 00 	movabs $0x804e1d,%rdx
  802a22:	00 00 00 
  802a25:	be 89 00 00 00       	mov    $0x89,%esi
  802a2a:	48 bf 32 4e 80 00 00 	movabs $0x804e32,%rdi
  802a31:	00 00 00 
  802a34:	b8 00 00 00 00       	mov    $0x0,%eax
  802a39:	49 b8 5a 3f 80 00 00 	movabs $0x803f5a,%r8
  802a40:	00 00 00 
  802a43:	41 ff d0             	callq  *%r8
  802a46:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  802a4d:	7e 35                	jle    802a84 <devfile_read+0xde>
  802a4f:	48 b9 40 4e 80 00 00 	movabs $0x804e40,%rcx
  802a56:	00 00 00 
  802a59:	48 ba 1d 4e 80 00 00 	movabs $0x804e1d,%rdx
  802a60:	00 00 00 
  802a63:	be 8a 00 00 00       	mov    $0x8a,%esi
  802a68:	48 bf 32 4e 80 00 00 	movabs $0x804e32,%rdi
  802a6f:	00 00 00 
  802a72:	b8 00 00 00 00       	mov    $0x0,%eax
  802a77:	49 b8 5a 3f 80 00 00 	movabs $0x803f5a,%r8
  802a7e:	00 00 00 
  802a81:	41 ff d0             	callq  *%r8
  802a84:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a87:	48 63 d0             	movslq %eax,%rdx
  802a8a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802a8e:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  802a95:	00 00 00 
  802a98:	48 89 c7             	mov    %rax,%rdi
  802a9b:	48 b8 be 13 80 00 00 	movabs $0x8013be,%rax
  802aa2:	00 00 00 
  802aa5:	ff d0                	callq  *%rax
  802aa7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802aaa:	c9                   	leaveq 
  802aab:	c3                   	retq   

0000000000802aac <devfile_write>:
  802aac:	55                   	push   %rbp
  802aad:	48 89 e5             	mov    %rsp,%rbp
  802ab0:	48 83 ec 40          	sub    $0x40,%rsp
  802ab4:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802ab8:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802abc:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802ac0:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  802ac4:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802ac8:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  802acf:	00 
  802ad0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ad4:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  802ad8:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  802add:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  802ae1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802ae5:	8b 50 0c             	mov    0xc(%rax),%edx
  802ae8:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802aef:	00 00 00 
  802af2:	89 10                	mov    %edx,(%rax)
  802af4:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802afb:	00 00 00 
  802afe:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802b02:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802b06:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802b0a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802b0e:	48 89 c6             	mov    %rax,%rsi
  802b11:	48 bf 10 90 80 00 00 	movabs $0x809010,%rdi
  802b18:	00 00 00 
  802b1b:	48 b8 be 13 80 00 00 	movabs $0x8013be,%rax
  802b22:	00 00 00 
  802b25:	ff d0                	callq  *%rax
  802b27:	be 00 00 00 00       	mov    $0x0,%esi
  802b2c:	bf 04 00 00 00       	mov    $0x4,%edi
  802b31:	48 b8 0e 28 80 00 00 	movabs $0x80280e,%rax
  802b38:	00 00 00 
  802b3b:	ff d0                	callq  *%rax
  802b3d:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802b40:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802b44:	79 05                	jns    802b4b <devfile_write+0x9f>
  802b46:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802b49:	eb 43                	jmp    802b8e <devfile_write+0xe2>
  802b4b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802b4e:	48 98                	cltq   
  802b50:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  802b54:	76 35                	jbe    802b8b <devfile_write+0xdf>
  802b56:	48 b9 16 4e 80 00 00 	movabs $0x804e16,%rcx
  802b5d:	00 00 00 
  802b60:	48 ba 1d 4e 80 00 00 	movabs $0x804e1d,%rdx
  802b67:	00 00 00 
  802b6a:	be a8 00 00 00       	mov    $0xa8,%esi
  802b6f:	48 bf 32 4e 80 00 00 	movabs $0x804e32,%rdi
  802b76:	00 00 00 
  802b79:	b8 00 00 00 00       	mov    $0x0,%eax
  802b7e:	49 b8 5a 3f 80 00 00 	movabs $0x803f5a,%r8
  802b85:	00 00 00 
  802b88:	41 ff d0             	callq  *%r8
  802b8b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802b8e:	c9                   	leaveq 
  802b8f:	c3                   	retq   

0000000000802b90 <devfile_stat>:
  802b90:	55                   	push   %rbp
  802b91:	48 89 e5             	mov    %rsp,%rbp
  802b94:	48 83 ec 20          	sub    $0x20,%rsp
  802b98:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802b9c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802ba0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ba4:	8b 50 0c             	mov    0xc(%rax),%edx
  802ba7:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802bae:	00 00 00 
  802bb1:	89 10                	mov    %edx,(%rax)
  802bb3:	be 00 00 00 00       	mov    $0x0,%esi
  802bb8:	bf 05 00 00 00       	mov    $0x5,%edi
  802bbd:	48 b8 0e 28 80 00 00 	movabs $0x80280e,%rax
  802bc4:	00 00 00 
  802bc7:	ff d0                	callq  *%rax
  802bc9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802bcc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802bd0:	79 05                	jns    802bd7 <devfile_stat+0x47>
  802bd2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802bd5:	eb 56                	jmp    802c2d <devfile_stat+0x9d>
  802bd7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802bdb:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  802be2:	00 00 00 
  802be5:	48 89 c7             	mov    %rax,%rdi
  802be8:	48 b8 9a 10 80 00 00 	movabs $0x80109a,%rax
  802bef:	00 00 00 
  802bf2:	ff d0                	callq  *%rax
  802bf4:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802bfb:	00 00 00 
  802bfe:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  802c04:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802c08:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  802c0e:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802c15:	00 00 00 
  802c18:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  802c1e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802c22:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  802c28:	b8 00 00 00 00       	mov    $0x0,%eax
  802c2d:	c9                   	leaveq 
  802c2e:	c3                   	retq   

0000000000802c2f <devfile_trunc>:
  802c2f:	55                   	push   %rbp
  802c30:	48 89 e5             	mov    %rsp,%rbp
  802c33:	48 83 ec 10          	sub    $0x10,%rsp
  802c37:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802c3b:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802c3e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802c42:	8b 50 0c             	mov    0xc(%rax),%edx
  802c45:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802c4c:	00 00 00 
  802c4f:	89 10                	mov    %edx,(%rax)
  802c51:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802c58:	00 00 00 
  802c5b:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802c5e:	89 50 04             	mov    %edx,0x4(%rax)
  802c61:	be 00 00 00 00       	mov    $0x0,%esi
  802c66:	bf 02 00 00 00       	mov    $0x2,%edi
  802c6b:	48 b8 0e 28 80 00 00 	movabs $0x80280e,%rax
  802c72:	00 00 00 
  802c75:	ff d0                	callq  *%rax
  802c77:	c9                   	leaveq 
  802c78:	c3                   	retq   

0000000000802c79 <remove>:
  802c79:	55                   	push   %rbp
  802c7a:	48 89 e5             	mov    %rsp,%rbp
  802c7d:	48 83 ec 10          	sub    $0x10,%rsp
  802c81:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802c85:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802c89:	48 89 c7             	mov    %rax,%rdi
  802c8c:	48 b8 2e 10 80 00 00 	movabs $0x80102e,%rax
  802c93:	00 00 00 
  802c96:	ff d0                	callq  *%rax
  802c98:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802c9d:	7e 07                	jle    802ca6 <remove+0x2d>
  802c9f:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802ca4:	eb 33                	jmp    802cd9 <remove+0x60>
  802ca6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802caa:	48 89 c6             	mov    %rax,%rsi
  802cad:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  802cb4:	00 00 00 
  802cb7:	48 b8 9a 10 80 00 00 	movabs $0x80109a,%rax
  802cbe:	00 00 00 
  802cc1:	ff d0                	callq  *%rax
  802cc3:	be 00 00 00 00       	mov    $0x0,%esi
  802cc8:	bf 07 00 00 00       	mov    $0x7,%edi
  802ccd:	48 b8 0e 28 80 00 00 	movabs $0x80280e,%rax
  802cd4:	00 00 00 
  802cd7:	ff d0                	callq  *%rax
  802cd9:	c9                   	leaveq 
  802cda:	c3                   	retq   

0000000000802cdb <sync>:
  802cdb:	55                   	push   %rbp
  802cdc:	48 89 e5             	mov    %rsp,%rbp
  802cdf:	be 00 00 00 00       	mov    $0x0,%esi
  802ce4:	bf 08 00 00 00       	mov    $0x8,%edi
  802ce9:	48 b8 0e 28 80 00 00 	movabs $0x80280e,%rax
  802cf0:	00 00 00 
  802cf3:	ff d0                	callq  *%rax
  802cf5:	5d                   	pop    %rbp
  802cf6:	c3                   	retq   

0000000000802cf7 <copy>:
  802cf7:	55                   	push   %rbp
  802cf8:	48 89 e5             	mov    %rsp,%rbp
  802cfb:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  802d02:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  802d09:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  802d10:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  802d17:	be 00 00 00 00       	mov    $0x0,%esi
  802d1c:	48 89 c7             	mov    %rax,%rdi
  802d1f:	48 b8 95 28 80 00 00 	movabs $0x802895,%rax
  802d26:	00 00 00 
  802d29:	ff d0                	callq  *%rax
  802d2b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d2e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d32:	79 28                	jns    802d5c <copy+0x65>
  802d34:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d37:	89 c6                	mov    %eax,%esi
  802d39:	48 bf 4c 4e 80 00 00 	movabs $0x804e4c,%rdi
  802d40:	00 00 00 
  802d43:	b8 00 00 00 00       	mov    $0x0,%eax
  802d48:	48 ba e5 04 80 00 00 	movabs $0x8004e5,%rdx
  802d4f:	00 00 00 
  802d52:	ff d2                	callq  *%rdx
  802d54:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d57:	e9 74 01 00 00       	jmpq   802ed0 <copy+0x1d9>
  802d5c:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  802d63:	be 01 01 00 00       	mov    $0x101,%esi
  802d68:	48 89 c7             	mov    %rax,%rdi
  802d6b:	48 b8 95 28 80 00 00 	movabs $0x802895,%rax
  802d72:	00 00 00 
  802d75:	ff d0                	callq  *%rax
  802d77:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802d7a:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802d7e:	79 39                	jns    802db9 <copy+0xc2>
  802d80:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802d83:	89 c6                	mov    %eax,%esi
  802d85:	48 bf 62 4e 80 00 00 	movabs $0x804e62,%rdi
  802d8c:	00 00 00 
  802d8f:	b8 00 00 00 00       	mov    $0x0,%eax
  802d94:	48 ba e5 04 80 00 00 	movabs $0x8004e5,%rdx
  802d9b:	00 00 00 
  802d9e:	ff d2                	callq  *%rdx
  802da0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802da3:	89 c7                	mov    %eax,%edi
  802da5:	48 b8 9d 21 80 00 00 	movabs $0x80219d,%rax
  802dac:	00 00 00 
  802daf:	ff d0                	callq  *%rax
  802db1:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802db4:	e9 17 01 00 00       	jmpq   802ed0 <copy+0x1d9>
  802db9:	eb 74                	jmp    802e2f <copy+0x138>
  802dbb:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802dbe:	48 63 d0             	movslq %eax,%rdx
  802dc1:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802dc8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802dcb:	48 89 ce             	mov    %rcx,%rsi
  802dce:	89 c7                	mov    %eax,%edi
  802dd0:	48 b8 09 25 80 00 00 	movabs $0x802509,%rax
  802dd7:	00 00 00 
  802dda:	ff d0                	callq  *%rax
  802ddc:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802ddf:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802de3:	79 4a                	jns    802e2f <copy+0x138>
  802de5:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802de8:	89 c6                	mov    %eax,%esi
  802dea:	48 bf 7c 4e 80 00 00 	movabs $0x804e7c,%rdi
  802df1:	00 00 00 
  802df4:	b8 00 00 00 00       	mov    $0x0,%eax
  802df9:	48 ba e5 04 80 00 00 	movabs $0x8004e5,%rdx
  802e00:	00 00 00 
  802e03:	ff d2                	callq  *%rdx
  802e05:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e08:	89 c7                	mov    %eax,%edi
  802e0a:	48 b8 9d 21 80 00 00 	movabs $0x80219d,%rax
  802e11:	00 00 00 
  802e14:	ff d0                	callq  *%rax
  802e16:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802e19:	89 c7                	mov    %eax,%edi
  802e1b:	48 b8 9d 21 80 00 00 	movabs $0x80219d,%rax
  802e22:	00 00 00 
  802e25:	ff d0                	callq  *%rax
  802e27:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802e2a:	e9 a1 00 00 00       	jmpq   802ed0 <copy+0x1d9>
  802e2f:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802e36:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e39:	ba 00 02 00 00       	mov    $0x200,%edx
  802e3e:	48 89 ce             	mov    %rcx,%rsi
  802e41:	89 c7                	mov    %eax,%edi
  802e43:	48 b8 bf 23 80 00 00 	movabs $0x8023bf,%rax
  802e4a:	00 00 00 
  802e4d:	ff d0                	callq  *%rax
  802e4f:	89 45 f4             	mov    %eax,-0xc(%rbp)
  802e52:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802e56:	0f 8f 5f ff ff ff    	jg     802dbb <copy+0xc4>
  802e5c:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802e60:	79 47                	jns    802ea9 <copy+0x1b2>
  802e62:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802e65:	89 c6                	mov    %eax,%esi
  802e67:	48 bf 8f 4e 80 00 00 	movabs $0x804e8f,%rdi
  802e6e:	00 00 00 
  802e71:	b8 00 00 00 00       	mov    $0x0,%eax
  802e76:	48 ba e5 04 80 00 00 	movabs $0x8004e5,%rdx
  802e7d:	00 00 00 
  802e80:	ff d2                	callq  *%rdx
  802e82:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e85:	89 c7                	mov    %eax,%edi
  802e87:	48 b8 9d 21 80 00 00 	movabs $0x80219d,%rax
  802e8e:	00 00 00 
  802e91:	ff d0                	callq  *%rax
  802e93:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802e96:	89 c7                	mov    %eax,%edi
  802e98:	48 b8 9d 21 80 00 00 	movabs $0x80219d,%rax
  802e9f:	00 00 00 
  802ea2:	ff d0                	callq  *%rax
  802ea4:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802ea7:	eb 27                	jmp    802ed0 <copy+0x1d9>
  802ea9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802eac:	89 c7                	mov    %eax,%edi
  802eae:	48 b8 9d 21 80 00 00 	movabs $0x80219d,%rax
  802eb5:	00 00 00 
  802eb8:	ff d0                	callq  *%rax
  802eba:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802ebd:	89 c7                	mov    %eax,%edi
  802ebf:	48 b8 9d 21 80 00 00 	movabs $0x80219d,%rax
  802ec6:	00 00 00 
  802ec9:	ff d0                	callq  *%rax
  802ecb:	b8 00 00 00 00       	mov    $0x0,%eax
  802ed0:	c9                   	leaveq 
  802ed1:	c3                   	retq   

0000000000802ed2 <fd2sockid>:
  802ed2:	55                   	push   %rbp
  802ed3:	48 89 e5             	mov    %rsp,%rbp
  802ed6:	48 83 ec 20          	sub    $0x20,%rsp
  802eda:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802edd:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802ee1:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802ee4:	48 89 d6             	mov    %rdx,%rsi
  802ee7:	89 c7                	mov    %eax,%edi
  802ee9:	48 b8 8d 1f 80 00 00 	movabs $0x801f8d,%rax
  802ef0:	00 00 00 
  802ef3:	ff d0                	callq  *%rax
  802ef5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ef8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802efc:	79 05                	jns    802f03 <fd2sockid+0x31>
  802efe:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f01:	eb 24                	jmp    802f27 <fd2sockid+0x55>
  802f03:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f07:	8b 10                	mov    (%rax),%edx
  802f09:	48 b8 a0 70 80 00 00 	movabs $0x8070a0,%rax
  802f10:	00 00 00 
  802f13:	8b 00                	mov    (%rax),%eax
  802f15:	39 c2                	cmp    %eax,%edx
  802f17:	74 07                	je     802f20 <fd2sockid+0x4e>
  802f19:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802f1e:	eb 07                	jmp    802f27 <fd2sockid+0x55>
  802f20:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f24:	8b 40 0c             	mov    0xc(%rax),%eax
  802f27:	c9                   	leaveq 
  802f28:	c3                   	retq   

0000000000802f29 <alloc_sockfd>:
  802f29:	55                   	push   %rbp
  802f2a:	48 89 e5             	mov    %rsp,%rbp
  802f2d:	48 83 ec 20          	sub    $0x20,%rsp
  802f31:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802f34:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802f38:	48 89 c7             	mov    %rax,%rdi
  802f3b:	48 b8 f5 1e 80 00 00 	movabs $0x801ef5,%rax
  802f42:	00 00 00 
  802f45:	ff d0                	callq  *%rax
  802f47:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f4a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f4e:	78 26                	js     802f76 <alloc_sockfd+0x4d>
  802f50:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f54:	ba 07 04 00 00       	mov    $0x407,%edx
  802f59:	48 89 c6             	mov    %rax,%rsi
  802f5c:	bf 00 00 00 00       	mov    $0x0,%edi
  802f61:	48 b8 c9 19 80 00 00 	movabs $0x8019c9,%rax
  802f68:	00 00 00 
  802f6b:	ff d0                	callq  *%rax
  802f6d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f70:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f74:	79 16                	jns    802f8c <alloc_sockfd+0x63>
  802f76:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802f79:	89 c7                	mov    %eax,%edi
  802f7b:	48 b8 36 34 80 00 00 	movabs $0x803436,%rax
  802f82:	00 00 00 
  802f85:	ff d0                	callq  *%rax
  802f87:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f8a:	eb 3a                	jmp    802fc6 <alloc_sockfd+0x9d>
  802f8c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f90:	48 ba a0 70 80 00 00 	movabs $0x8070a0,%rdx
  802f97:	00 00 00 
  802f9a:	8b 12                	mov    (%rdx),%edx
  802f9c:	89 10                	mov    %edx,(%rax)
  802f9e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802fa2:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  802fa9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802fad:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802fb0:	89 50 0c             	mov    %edx,0xc(%rax)
  802fb3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802fb7:	48 89 c7             	mov    %rax,%rdi
  802fba:	48 b8 a7 1e 80 00 00 	movabs $0x801ea7,%rax
  802fc1:	00 00 00 
  802fc4:	ff d0                	callq  *%rax
  802fc6:	c9                   	leaveq 
  802fc7:	c3                   	retq   

0000000000802fc8 <accept>:
  802fc8:	55                   	push   %rbp
  802fc9:	48 89 e5             	mov    %rsp,%rbp
  802fcc:	48 83 ec 30          	sub    $0x30,%rsp
  802fd0:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802fd3:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802fd7:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802fdb:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802fde:	89 c7                	mov    %eax,%edi
  802fe0:	48 b8 d2 2e 80 00 00 	movabs $0x802ed2,%rax
  802fe7:	00 00 00 
  802fea:	ff d0                	callq  *%rax
  802fec:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802fef:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ff3:	79 05                	jns    802ffa <accept+0x32>
  802ff5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ff8:	eb 3b                	jmp    803035 <accept+0x6d>
  802ffa:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802ffe:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803002:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803005:	48 89 ce             	mov    %rcx,%rsi
  803008:	89 c7                	mov    %eax,%edi
  80300a:	48 b8 13 33 80 00 00 	movabs $0x803313,%rax
  803011:	00 00 00 
  803014:	ff d0                	callq  *%rax
  803016:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803019:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80301d:	79 05                	jns    803024 <accept+0x5c>
  80301f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803022:	eb 11                	jmp    803035 <accept+0x6d>
  803024:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803027:	89 c7                	mov    %eax,%edi
  803029:	48 b8 29 2f 80 00 00 	movabs $0x802f29,%rax
  803030:	00 00 00 
  803033:	ff d0                	callq  *%rax
  803035:	c9                   	leaveq 
  803036:	c3                   	retq   

0000000000803037 <bind>:
  803037:	55                   	push   %rbp
  803038:	48 89 e5             	mov    %rsp,%rbp
  80303b:	48 83 ec 20          	sub    $0x20,%rsp
  80303f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803042:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803046:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803049:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80304c:	89 c7                	mov    %eax,%edi
  80304e:	48 b8 d2 2e 80 00 00 	movabs $0x802ed2,%rax
  803055:	00 00 00 
  803058:	ff d0                	callq  *%rax
  80305a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80305d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803061:	79 05                	jns    803068 <bind+0x31>
  803063:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803066:	eb 1b                	jmp    803083 <bind+0x4c>
  803068:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80306b:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80306f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803072:	48 89 ce             	mov    %rcx,%rsi
  803075:	89 c7                	mov    %eax,%edi
  803077:	48 b8 92 33 80 00 00 	movabs $0x803392,%rax
  80307e:	00 00 00 
  803081:	ff d0                	callq  *%rax
  803083:	c9                   	leaveq 
  803084:	c3                   	retq   

0000000000803085 <shutdown>:
  803085:	55                   	push   %rbp
  803086:	48 89 e5             	mov    %rsp,%rbp
  803089:	48 83 ec 20          	sub    $0x20,%rsp
  80308d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803090:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803093:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803096:	89 c7                	mov    %eax,%edi
  803098:	48 b8 d2 2e 80 00 00 	movabs $0x802ed2,%rax
  80309f:	00 00 00 
  8030a2:	ff d0                	callq  *%rax
  8030a4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8030a7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8030ab:	79 05                	jns    8030b2 <shutdown+0x2d>
  8030ad:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030b0:	eb 16                	jmp    8030c8 <shutdown+0x43>
  8030b2:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8030b5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030b8:	89 d6                	mov    %edx,%esi
  8030ba:	89 c7                	mov    %eax,%edi
  8030bc:	48 b8 f6 33 80 00 00 	movabs $0x8033f6,%rax
  8030c3:	00 00 00 
  8030c6:	ff d0                	callq  *%rax
  8030c8:	c9                   	leaveq 
  8030c9:	c3                   	retq   

00000000008030ca <devsock_close>:
  8030ca:	55                   	push   %rbp
  8030cb:	48 89 e5             	mov    %rsp,%rbp
  8030ce:	48 83 ec 10          	sub    $0x10,%rsp
  8030d2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8030d6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8030da:	48 89 c7             	mov    %rax,%rdi
  8030dd:	48 b8 37 42 80 00 00 	movabs $0x804237,%rax
  8030e4:	00 00 00 
  8030e7:	ff d0                	callq  *%rax
  8030e9:	83 f8 01             	cmp    $0x1,%eax
  8030ec:	75 17                	jne    803105 <devsock_close+0x3b>
  8030ee:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8030f2:	8b 40 0c             	mov    0xc(%rax),%eax
  8030f5:	89 c7                	mov    %eax,%edi
  8030f7:	48 b8 36 34 80 00 00 	movabs $0x803436,%rax
  8030fe:	00 00 00 
  803101:	ff d0                	callq  *%rax
  803103:	eb 05                	jmp    80310a <devsock_close+0x40>
  803105:	b8 00 00 00 00       	mov    $0x0,%eax
  80310a:	c9                   	leaveq 
  80310b:	c3                   	retq   

000000000080310c <connect>:
  80310c:	55                   	push   %rbp
  80310d:	48 89 e5             	mov    %rsp,%rbp
  803110:	48 83 ec 20          	sub    $0x20,%rsp
  803114:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803117:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80311b:	89 55 e8             	mov    %edx,-0x18(%rbp)
  80311e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803121:	89 c7                	mov    %eax,%edi
  803123:	48 b8 d2 2e 80 00 00 	movabs $0x802ed2,%rax
  80312a:	00 00 00 
  80312d:	ff d0                	callq  *%rax
  80312f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803132:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803136:	79 05                	jns    80313d <connect+0x31>
  803138:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80313b:	eb 1b                	jmp    803158 <connect+0x4c>
  80313d:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803140:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803144:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803147:	48 89 ce             	mov    %rcx,%rsi
  80314a:	89 c7                	mov    %eax,%edi
  80314c:	48 b8 63 34 80 00 00 	movabs $0x803463,%rax
  803153:	00 00 00 
  803156:	ff d0                	callq  *%rax
  803158:	c9                   	leaveq 
  803159:	c3                   	retq   

000000000080315a <listen>:
  80315a:	55                   	push   %rbp
  80315b:	48 89 e5             	mov    %rsp,%rbp
  80315e:	48 83 ec 20          	sub    $0x20,%rsp
  803162:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803165:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803168:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80316b:	89 c7                	mov    %eax,%edi
  80316d:	48 b8 d2 2e 80 00 00 	movabs $0x802ed2,%rax
  803174:	00 00 00 
  803177:	ff d0                	callq  *%rax
  803179:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80317c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803180:	79 05                	jns    803187 <listen+0x2d>
  803182:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803185:	eb 16                	jmp    80319d <listen+0x43>
  803187:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80318a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80318d:	89 d6                	mov    %edx,%esi
  80318f:	89 c7                	mov    %eax,%edi
  803191:	48 b8 c7 34 80 00 00 	movabs $0x8034c7,%rax
  803198:	00 00 00 
  80319b:	ff d0                	callq  *%rax
  80319d:	c9                   	leaveq 
  80319e:	c3                   	retq   

000000000080319f <devsock_read>:
  80319f:	55                   	push   %rbp
  8031a0:	48 89 e5             	mov    %rsp,%rbp
  8031a3:	48 83 ec 20          	sub    $0x20,%rsp
  8031a7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8031ab:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8031af:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8031b3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8031b7:	89 c2                	mov    %eax,%edx
  8031b9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8031bd:	8b 40 0c             	mov    0xc(%rax),%eax
  8031c0:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  8031c4:	b9 00 00 00 00       	mov    $0x0,%ecx
  8031c9:	89 c7                	mov    %eax,%edi
  8031cb:	48 b8 07 35 80 00 00 	movabs $0x803507,%rax
  8031d2:	00 00 00 
  8031d5:	ff d0                	callq  *%rax
  8031d7:	c9                   	leaveq 
  8031d8:	c3                   	retq   

00000000008031d9 <devsock_write>:
  8031d9:	55                   	push   %rbp
  8031da:	48 89 e5             	mov    %rsp,%rbp
  8031dd:	48 83 ec 20          	sub    $0x20,%rsp
  8031e1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8031e5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8031e9:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8031ed:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8031f1:	89 c2                	mov    %eax,%edx
  8031f3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8031f7:	8b 40 0c             	mov    0xc(%rax),%eax
  8031fa:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  8031fe:	b9 00 00 00 00       	mov    $0x0,%ecx
  803203:	89 c7                	mov    %eax,%edi
  803205:	48 b8 d3 35 80 00 00 	movabs $0x8035d3,%rax
  80320c:	00 00 00 
  80320f:	ff d0                	callq  *%rax
  803211:	c9                   	leaveq 
  803212:	c3                   	retq   

0000000000803213 <devsock_stat>:
  803213:	55                   	push   %rbp
  803214:	48 89 e5             	mov    %rsp,%rbp
  803217:	48 83 ec 10          	sub    $0x10,%rsp
  80321b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80321f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803223:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803227:	48 be aa 4e 80 00 00 	movabs $0x804eaa,%rsi
  80322e:	00 00 00 
  803231:	48 89 c7             	mov    %rax,%rdi
  803234:	48 b8 9a 10 80 00 00 	movabs $0x80109a,%rax
  80323b:	00 00 00 
  80323e:	ff d0                	callq  *%rax
  803240:	b8 00 00 00 00       	mov    $0x0,%eax
  803245:	c9                   	leaveq 
  803246:	c3                   	retq   

0000000000803247 <socket>:
  803247:	55                   	push   %rbp
  803248:	48 89 e5             	mov    %rsp,%rbp
  80324b:	48 83 ec 20          	sub    $0x20,%rsp
  80324f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803252:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803255:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  803258:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  80325b:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  80325e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803261:	89 ce                	mov    %ecx,%esi
  803263:	89 c7                	mov    %eax,%edi
  803265:	48 b8 8b 36 80 00 00 	movabs $0x80368b,%rax
  80326c:	00 00 00 
  80326f:	ff d0                	callq  *%rax
  803271:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803274:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803278:	79 05                	jns    80327f <socket+0x38>
  80327a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80327d:	eb 11                	jmp    803290 <socket+0x49>
  80327f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803282:	89 c7                	mov    %eax,%edi
  803284:	48 b8 29 2f 80 00 00 	movabs $0x802f29,%rax
  80328b:	00 00 00 
  80328e:	ff d0                	callq  *%rax
  803290:	c9                   	leaveq 
  803291:	c3                   	retq   

0000000000803292 <nsipc>:
  803292:	55                   	push   %rbp
  803293:	48 89 e5             	mov    %rsp,%rbp
  803296:	48 83 ec 10          	sub    $0x10,%rsp
  80329a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80329d:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  8032a4:	00 00 00 
  8032a7:	8b 00                	mov    (%rax),%eax
  8032a9:	85 c0                	test   %eax,%eax
  8032ab:	75 1d                	jne    8032ca <nsipc+0x38>
  8032ad:	bf 02 00 00 00       	mov    $0x2,%edi
  8032b2:	48 b8 c5 41 80 00 00 	movabs $0x8041c5,%rax
  8032b9:	00 00 00 
  8032bc:	ff d0                	callq  *%rax
  8032be:	48 ba 04 80 80 00 00 	movabs $0x808004,%rdx
  8032c5:	00 00 00 
  8032c8:	89 02                	mov    %eax,(%rdx)
  8032ca:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  8032d1:	00 00 00 
  8032d4:	8b 00                	mov    (%rax),%eax
  8032d6:	8b 75 fc             	mov    -0x4(%rbp),%esi
  8032d9:	b9 07 00 00 00       	mov    $0x7,%ecx
  8032de:	48 ba 00 b0 80 00 00 	movabs $0x80b000,%rdx
  8032e5:	00 00 00 
  8032e8:	89 c7                	mov    %eax,%edi
  8032ea:	48 b8 2f 41 80 00 00 	movabs $0x80412f,%rax
  8032f1:	00 00 00 
  8032f4:	ff d0                	callq  *%rax
  8032f6:	ba 00 00 00 00       	mov    $0x0,%edx
  8032fb:	be 00 00 00 00       	mov    $0x0,%esi
  803300:	bf 00 00 00 00       	mov    $0x0,%edi
  803305:	48 b8 6e 40 80 00 00 	movabs $0x80406e,%rax
  80330c:	00 00 00 
  80330f:	ff d0                	callq  *%rax
  803311:	c9                   	leaveq 
  803312:	c3                   	retq   

0000000000803313 <nsipc_accept>:
  803313:	55                   	push   %rbp
  803314:	48 89 e5             	mov    %rsp,%rbp
  803317:	48 83 ec 30          	sub    $0x30,%rsp
  80331b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80331e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803322:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803326:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80332d:	00 00 00 
  803330:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803333:	89 10                	mov    %edx,(%rax)
  803335:	bf 01 00 00 00       	mov    $0x1,%edi
  80333a:	48 b8 92 32 80 00 00 	movabs $0x803292,%rax
  803341:	00 00 00 
  803344:	ff d0                	callq  *%rax
  803346:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803349:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80334d:	78 3e                	js     80338d <nsipc_accept+0x7a>
  80334f:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803356:	00 00 00 
  803359:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80335d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803361:	8b 40 10             	mov    0x10(%rax),%eax
  803364:	89 c2                	mov    %eax,%edx
  803366:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  80336a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80336e:	48 89 ce             	mov    %rcx,%rsi
  803371:	48 89 c7             	mov    %rax,%rdi
  803374:	48 b8 be 13 80 00 00 	movabs $0x8013be,%rax
  80337b:	00 00 00 
  80337e:	ff d0                	callq  *%rax
  803380:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803384:	8b 50 10             	mov    0x10(%rax),%edx
  803387:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80338b:	89 10                	mov    %edx,(%rax)
  80338d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803390:	c9                   	leaveq 
  803391:	c3                   	retq   

0000000000803392 <nsipc_bind>:
  803392:	55                   	push   %rbp
  803393:	48 89 e5             	mov    %rsp,%rbp
  803396:	48 83 ec 10          	sub    $0x10,%rsp
  80339a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80339d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8033a1:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8033a4:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8033ab:	00 00 00 
  8033ae:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8033b1:	89 10                	mov    %edx,(%rax)
  8033b3:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8033b6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8033ba:	48 89 c6             	mov    %rax,%rsi
  8033bd:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  8033c4:	00 00 00 
  8033c7:	48 b8 be 13 80 00 00 	movabs $0x8013be,%rax
  8033ce:	00 00 00 
  8033d1:	ff d0                	callq  *%rax
  8033d3:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8033da:	00 00 00 
  8033dd:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8033e0:	89 50 14             	mov    %edx,0x14(%rax)
  8033e3:	bf 02 00 00 00       	mov    $0x2,%edi
  8033e8:	48 b8 92 32 80 00 00 	movabs $0x803292,%rax
  8033ef:	00 00 00 
  8033f2:	ff d0                	callq  *%rax
  8033f4:	c9                   	leaveq 
  8033f5:	c3                   	retq   

00000000008033f6 <nsipc_shutdown>:
  8033f6:	55                   	push   %rbp
  8033f7:	48 89 e5             	mov    %rsp,%rbp
  8033fa:	48 83 ec 10          	sub    $0x10,%rsp
  8033fe:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803401:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803404:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80340b:	00 00 00 
  80340e:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803411:	89 10                	mov    %edx,(%rax)
  803413:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80341a:	00 00 00 
  80341d:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803420:	89 50 04             	mov    %edx,0x4(%rax)
  803423:	bf 03 00 00 00       	mov    $0x3,%edi
  803428:	48 b8 92 32 80 00 00 	movabs $0x803292,%rax
  80342f:	00 00 00 
  803432:	ff d0                	callq  *%rax
  803434:	c9                   	leaveq 
  803435:	c3                   	retq   

0000000000803436 <nsipc_close>:
  803436:	55                   	push   %rbp
  803437:	48 89 e5             	mov    %rsp,%rbp
  80343a:	48 83 ec 10          	sub    $0x10,%rsp
  80343e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803441:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803448:	00 00 00 
  80344b:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80344e:	89 10                	mov    %edx,(%rax)
  803450:	bf 04 00 00 00       	mov    $0x4,%edi
  803455:	48 b8 92 32 80 00 00 	movabs $0x803292,%rax
  80345c:	00 00 00 
  80345f:	ff d0                	callq  *%rax
  803461:	c9                   	leaveq 
  803462:	c3                   	retq   

0000000000803463 <nsipc_connect>:
  803463:	55                   	push   %rbp
  803464:	48 89 e5             	mov    %rsp,%rbp
  803467:	48 83 ec 10          	sub    $0x10,%rsp
  80346b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80346e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803472:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803475:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80347c:	00 00 00 
  80347f:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803482:	89 10                	mov    %edx,(%rax)
  803484:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803487:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80348b:	48 89 c6             	mov    %rax,%rsi
  80348e:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803495:	00 00 00 
  803498:	48 b8 be 13 80 00 00 	movabs $0x8013be,%rax
  80349f:	00 00 00 
  8034a2:	ff d0                	callq  *%rax
  8034a4:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8034ab:	00 00 00 
  8034ae:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8034b1:	89 50 14             	mov    %edx,0x14(%rax)
  8034b4:	bf 05 00 00 00       	mov    $0x5,%edi
  8034b9:	48 b8 92 32 80 00 00 	movabs $0x803292,%rax
  8034c0:	00 00 00 
  8034c3:	ff d0                	callq  *%rax
  8034c5:	c9                   	leaveq 
  8034c6:	c3                   	retq   

00000000008034c7 <nsipc_listen>:
  8034c7:	55                   	push   %rbp
  8034c8:	48 89 e5             	mov    %rsp,%rbp
  8034cb:	48 83 ec 10          	sub    $0x10,%rsp
  8034cf:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8034d2:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8034d5:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8034dc:	00 00 00 
  8034df:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8034e2:	89 10                	mov    %edx,(%rax)
  8034e4:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8034eb:	00 00 00 
  8034ee:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8034f1:	89 50 04             	mov    %edx,0x4(%rax)
  8034f4:	bf 06 00 00 00       	mov    $0x6,%edi
  8034f9:	48 b8 92 32 80 00 00 	movabs $0x803292,%rax
  803500:	00 00 00 
  803503:	ff d0                	callq  *%rax
  803505:	c9                   	leaveq 
  803506:	c3                   	retq   

0000000000803507 <nsipc_recv>:
  803507:	55                   	push   %rbp
  803508:	48 89 e5             	mov    %rsp,%rbp
  80350b:	48 83 ec 30          	sub    $0x30,%rsp
  80350f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803512:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803516:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803519:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  80351c:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803523:	00 00 00 
  803526:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803529:	89 10                	mov    %edx,(%rax)
  80352b:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803532:	00 00 00 
  803535:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803538:	89 50 04             	mov    %edx,0x4(%rax)
  80353b:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803542:	00 00 00 
  803545:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803548:	89 50 08             	mov    %edx,0x8(%rax)
  80354b:	bf 07 00 00 00       	mov    $0x7,%edi
  803550:	48 b8 92 32 80 00 00 	movabs $0x803292,%rax
  803557:	00 00 00 
  80355a:	ff d0                	callq  *%rax
  80355c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80355f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803563:	78 69                	js     8035ce <nsipc_recv+0xc7>
  803565:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  80356c:	7f 08                	jg     803576 <nsipc_recv+0x6f>
  80356e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803571:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  803574:	7e 35                	jle    8035ab <nsipc_recv+0xa4>
  803576:	48 b9 b1 4e 80 00 00 	movabs $0x804eb1,%rcx
  80357d:	00 00 00 
  803580:	48 ba c6 4e 80 00 00 	movabs $0x804ec6,%rdx
  803587:	00 00 00 
  80358a:	be 62 00 00 00       	mov    $0x62,%esi
  80358f:	48 bf db 4e 80 00 00 	movabs $0x804edb,%rdi
  803596:	00 00 00 
  803599:	b8 00 00 00 00       	mov    $0x0,%eax
  80359e:	49 b8 5a 3f 80 00 00 	movabs $0x803f5a,%r8
  8035a5:	00 00 00 
  8035a8:	41 ff d0             	callq  *%r8
  8035ab:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035ae:	48 63 d0             	movslq %eax,%rdx
  8035b1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8035b5:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  8035bc:	00 00 00 
  8035bf:	48 89 c7             	mov    %rax,%rdi
  8035c2:	48 b8 be 13 80 00 00 	movabs $0x8013be,%rax
  8035c9:	00 00 00 
  8035cc:	ff d0                	callq  *%rax
  8035ce:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035d1:	c9                   	leaveq 
  8035d2:	c3                   	retq   

00000000008035d3 <nsipc_send>:
  8035d3:	55                   	push   %rbp
  8035d4:	48 89 e5             	mov    %rsp,%rbp
  8035d7:	48 83 ec 20          	sub    $0x20,%rsp
  8035db:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8035de:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8035e2:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8035e5:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  8035e8:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8035ef:	00 00 00 
  8035f2:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8035f5:	89 10                	mov    %edx,(%rax)
  8035f7:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  8035fe:	7e 35                	jle    803635 <nsipc_send+0x62>
  803600:	48 b9 ea 4e 80 00 00 	movabs $0x804eea,%rcx
  803607:	00 00 00 
  80360a:	48 ba c6 4e 80 00 00 	movabs $0x804ec6,%rdx
  803611:	00 00 00 
  803614:	be 6d 00 00 00       	mov    $0x6d,%esi
  803619:	48 bf db 4e 80 00 00 	movabs $0x804edb,%rdi
  803620:	00 00 00 
  803623:	b8 00 00 00 00       	mov    $0x0,%eax
  803628:	49 b8 5a 3f 80 00 00 	movabs $0x803f5a,%r8
  80362f:	00 00 00 
  803632:	41 ff d0             	callq  *%r8
  803635:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803638:	48 63 d0             	movslq %eax,%rdx
  80363b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80363f:	48 89 c6             	mov    %rax,%rsi
  803642:	48 bf 0c b0 80 00 00 	movabs $0x80b00c,%rdi
  803649:	00 00 00 
  80364c:	48 b8 be 13 80 00 00 	movabs $0x8013be,%rax
  803653:	00 00 00 
  803656:	ff d0                	callq  *%rax
  803658:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80365f:	00 00 00 
  803662:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803665:	89 50 04             	mov    %edx,0x4(%rax)
  803668:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80366f:	00 00 00 
  803672:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803675:	89 50 08             	mov    %edx,0x8(%rax)
  803678:	bf 08 00 00 00       	mov    $0x8,%edi
  80367d:	48 b8 92 32 80 00 00 	movabs $0x803292,%rax
  803684:	00 00 00 
  803687:	ff d0                	callq  *%rax
  803689:	c9                   	leaveq 
  80368a:	c3                   	retq   

000000000080368b <nsipc_socket>:
  80368b:	55                   	push   %rbp
  80368c:	48 89 e5             	mov    %rsp,%rbp
  80368f:	48 83 ec 10          	sub    $0x10,%rsp
  803693:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803696:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803699:	89 55 f4             	mov    %edx,-0xc(%rbp)
  80369c:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8036a3:	00 00 00 
  8036a6:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8036a9:	89 10                	mov    %edx,(%rax)
  8036ab:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8036b2:	00 00 00 
  8036b5:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8036b8:	89 50 04             	mov    %edx,0x4(%rax)
  8036bb:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8036c2:	00 00 00 
  8036c5:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8036c8:	89 50 08             	mov    %edx,0x8(%rax)
  8036cb:	bf 09 00 00 00       	mov    $0x9,%edi
  8036d0:	48 b8 92 32 80 00 00 	movabs $0x803292,%rax
  8036d7:	00 00 00 
  8036da:	ff d0                	callq  *%rax
  8036dc:	c9                   	leaveq 
  8036dd:	c3                   	retq   

00000000008036de <pipe>:
  8036de:	55                   	push   %rbp
  8036df:	48 89 e5             	mov    %rsp,%rbp
  8036e2:	53                   	push   %rbx
  8036e3:	48 83 ec 38          	sub    $0x38,%rsp
  8036e7:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  8036eb:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  8036ef:	48 89 c7             	mov    %rax,%rdi
  8036f2:	48 b8 f5 1e 80 00 00 	movabs $0x801ef5,%rax
  8036f9:	00 00 00 
  8036fc:	ff d0                	callq  *%rax
  8036fe:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803701:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803705:	0f 88 bf 01 00 00    	js     8038ca <pipe+0x1ec>
  80370b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80370f:	ba 07 04 00 00       	mov    $0x407,%edx
  803714:	48 89 c6             	mov    %rax,%rsi
  803717:	bf 00 00 00 00       	mov    $0x0,%edi
  80371c:	48 b8 c9 19 80 00 00 	movabs $0x8019c9,%rax
  803723:	00 00 00 
  803726:	ff d0                	callq  *%rax
  803728:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80372b:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80372f:	0f 88 95 01 00 00    	js     8038ca <pipe+0x1ec>
  803735:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  803739:	48 89 c7             	mov    %rax,%rdi
  80373c:	48 b8 f5 1e 80 00 00 	movabs $0x801ef5,%rax
  803743:	00 00 00 
  803746:	ff d0                	callq  *%rax
  803748:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80374b:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80374f:	0f 88 5d 01 00 00    	js     8038b2 <pipe+0x1d4>
  803755:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803759:	ba 07 04 00 00       	mov    $0x407,%edx
  80375e:	48 89 c6             	mov    %rax,%rsi
  803761:	bf 00 00 00 00       	mov    $0x0,%edi
  803766:	48 b8 c9 19 80 00 00 	movabs $0x8019c9,%rax
  80376d:	00 00 00 
  803770:	ff d0                	callq  *%rax
  803772:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803775:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803779:	0f 88 33 01 00 00    	js     8038b2 <pipe+0x1d4>
  80377f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803783:	48 89 c7             	mov    %rax,%rdi
  803786:	48 b8 ca 1e 80 00 00 	movabs $0x801eca,%rax
  80378d:	00 00 00 
  803790:	ff d0                	callq  *%rax
  803792:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803796:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80379a:	ba 07 04 00 00       	mov    $0x407,%edx
  80379f:	48 89 c6             	mov    %rax,%rsi
  8037a2:	bf 00 00 00 00       	mov    $0x0,%edi
  8037a7:	48 b8 c9 19 80 00 00 	movabs $0x8019c9,%rax
  8037ae:	00 00 00 
  8037b1:	ff d0                	callq  *%rax
  8037b3:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8037b6:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8037ba:	79 05                	jns    8037c1 <pipe+0xe3>
  8037bc:	e9 d9 00 00 00       	jmpq   80389a <pipe+0x1bc>
  8037c1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8037c5:	48 89 c7             	mov    %rax,%rdi
  8037c8:	48 b8 ca 1e 80 00 00 	movabs $0x801eca,%rax
  8037cf:	00 00 00 
  8037d2:	ff d0                	callq  *%rax
  8037d4:	48 89 c2             	mov    %rax,%rdx
  8037d7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8037db:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  8037e1:	48 89 d1             	mov    %rdx,%rcx
  8037e4:	ba 00 00 00 00       	mov    $0x0,%edx
  8037e9:	48 89 c6             	mov    %rax,%rsi
  8037ec:	bf 00 00 00 00       	mov    $0x0,%edi
  8037f1:	48 b8 19 1a 80 00 00 	movabs $0x801a19,%rax
  8037f8:	00 00 00 
  8037fb:	ff d0                	callq  *%rax
  8037fd:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803800:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803804:	79 1b                	jns    803821 <pipe+0x143>
  803806:	90                   	nop
  803807:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80380b:	48 89 c6             	mov    %rax,%rsi
  80380e:	bf 00 00 00 00       	mov    $0x0,%edi
  803813:	48 b8 74 1a 80 00 00 	movabs $0x801a74,%rax
  80381a:	00 00 00 
  80381d:	ff d0                	callq  *%rax
  80381f:	eb 79                	jmp    80389a <pipe+0x1bc>
  803821:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803825:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  80382c:	00 00 00 
  80382f:	8b 12                	mov    (%rdx),%edx
  803831:	89 10                	mov    %edx,(%rax)
  803833:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803837:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  80383e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803842:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  803849:	00 00 00 
  80384c:	8b 12                	mov    (%rdx),%edx
  80384e:	89 10                	mov    %edx,(%rax)
  803850:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803854:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  80385b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80385f:	48 89 c7             	mov    %rax,%rdi
  803862:	48 b8 a7 1e 80 00 00 	movabs $0x801ea7,%rax
  803869:	00 00 00 
  80386c:	ff d0                	callq  *%rax
  80386e:	89 c2                	mov    %eax,%edx
  803870:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803874:	89 10                	mov    %edx,(%rax)
  803876:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80387a:	48 8d 58 04          	lea    0x4(%rax),%rbx
  80387e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803882:	48 89 c7             	mov    %rax,%rdi
  803885:	48 b8 a7 1e 80 00 00 	movabs $0x801ea7,%rax
  80388c:	00 00 00 
  80388f:	ff d0                	callq  *%rax
  803891:	89 03                	mov    %eax,(%rbx)
  803893:	b8 00 00 00 00       	mov    $0x0,%eax
  803898:	eb 33                	jmp    8038cd <pipe+0x1ef>
  80389a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80389e:	48 89 c6             	mov    %rax,%rsi
  8038a1:	bf 00 00 00 00       	mov    $0x0,%edi
  8038a6:	48 b8 74 1a 80 00 00 	movabs $0x801a74,%rax
  8038ad:	00 00 00 
  8038b0:	ff d0                	callq  *%rax
  8038b2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8038b6:	48 89 c6             	mov    %rax,%rsi
  8038b9:	bf 00 00 00 00       	mov    $0x0,%edi
  8038be:	48 b8 74 1a 80 00 00 	movabs $0x801a74,%rax
  8038c5:	00 00 00 
  8038c8:	ff d0                	callq  *%rax
  8038ca:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8038cd:	48 83 c4 38          	add    $0x38,%rsp
  8038d1:	5b                   	pop    %rbx
  8038d2:	5d                   	pop    %rbp
  8038d3:	c3                   	retq   

00000000008038d4 <_pipeisclosed>:
  8038d4:	55                   	push   %rbp
  8038d5:	48 89 e5             	mov    %rsp,%rbp
  8038d8:	53                   	push   %rbx
  8038d9:	48 83 ec 28          	sub    $0x28,%rsp
  8038dd:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8038e1:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8038e5:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  8038ec:	00 00 00 
  8038ef:	48 8b 00             	mov    (%rax),%rax
  8038f2:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8038f8:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8038fb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8038ff:	48 89 c7             	mov    %rax,%rdi
  803902:	48 b8 37 42 80 00 00 	movabs $0x804237,%rax
  803909:	00 00 00 
  80390c:	ff d0                	callq  *%rax
  80390e:	89 c3                	mov    %eax,%ebx
  803910:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803914:	48 89 c7             	mov    %rax,%rdi
  803917:	48 b8 37 42 80 00 00 	movabs $0x804237,%rax
  80391e:	00 00 00 
  803921:	ff d0                	callq  *%rax
  803923:	39 c3                	cmp    %eax,%ebx
  803925:	0f 94 c0             	sete   %al
  803928:	0f b6 c0             	movzbl %al,%eax
  80392b:	89 45 e8             	mov    %eax,-0x18(%rbp)
  80392e:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  803935:	00 00 00 
  803938:	48 8b 00             	mov    (%rax),%rax
  80393b:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  803941:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  803944:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803947:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  80394a:	75 05                	jne    803951 <_pipeisclosed+0x7d>
  80394c:	8b 45 e8             	mov    -0x18(%rbp),%eax
  80394f:	eb 4f                	jmp    8039a0 <_pipeisclosed+0xcc>
  803951:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803954:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  803957:	74 42                	je     80399b <_pipeisclosed+0xc7>
  803959:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  80395d:	75 3c                	jne    80399b <_pipeisclosed+0xc7>
  80395f:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  803966:	00 00 00 
  803969:	48 8b 00             	mov    (%rax),%rax
  80396c:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  803972:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803975:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803978:	89 c6                	mov    %eax,%esi
  80397a:	48 bf fb 4e 80 00 00 	movabs $0x804efb,%rdi
  803981:	00 00 00 
  803984:	b8 00 00 00 00       	mov    $0x0,%eax
  803989:	49 b8 e5 04 80 00 00 	movabs $0x8004e5,%r8
  803990:	00 00 00 
  803993:	41 ff d0             	callq  *%r8
  803996:	e9 4a ff ff ff       	jmpq   8038e5 <_pipeisclosed+0x11>
  80399b:	e9 45 ff ff ff       	jmpq   8038e5 <_pipeisclosed+0x11>
  8039a0:	48 83 c4 28          	add    $0x28,%rsp
  8039a4:	5b                   	pop    %rbx
  8039a5:	5d                   	pop    %rbp
  8039a6:	c3                   	retq   

00000000008039a7 <pipeisclosed>:
  8039a7:	55                   	push   %rbp
  8039a8:	48 89 e5             	mov    %rsp,%rbp
  8039ab:	48 83 ec 30          	sub    $0x30,%rsp
  8039af:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8039b2:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8039b6:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8039b9:	48 89 d6             	mov    %rdx,%rsi
  8039bc:	89 c7                	mov    %eax,%edi
  8039be:	48 b8 8d 1f 80 00 00 	movabs $0x801f8d,%rax
  8039c5:	00 00 00 
  8039c8:	ff d0                	callq  *%rax
  8039ca:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8039cd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8039d1:	79 05                	jns    8039d8 <pipeisclosed+0x31>
  8039d3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039d6:	eb 31                	jmp    803a09 <pipeisclosed+0x62>
  8039d8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8039dc:	48 89 c7             	mov    %rax,%rdi
  8039df:	48 b8 ca 1e 80 00 00 	movabs $0x801eca,%rax
  8039e6:	00 00 00 
  8039e9:	ff d0                	callq  *%rax
  8039eb:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8039ef:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8039f3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8039f7:	48 89 d6             	mov    %rdx,%rsi
  8039fa:	48 89 c7             	mov    %rax,%rdi
  8039fd:	48 b8 d4 38 80 00 00 	movabs $0x8038d4,%rax
  803a04:	00 00 00 
  803a07:	ff d0                	callq  *%rax
  803a09:	c9                   	leaveq 
  803a0a:	c3                   	retq   

0000000000803a0b <devpipe_read>:
  803a0b:	55                   	push   %rbp
  803a0c:	48 89 e5             	mov    %rsp,%rbp
  803a0f:	48 83 ec 40          	sub    $0x40,%rsp
  803a13:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803a17:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803a1b:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803a1f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803a23:	48 89 c7             	mov    %rax,%rdi
  803a26:	48 b8 ca 1e 80 00 00 	movabs $0x801eca,%rax
  803a2d:	00 00 00 
  803a30:	ff d0                	callq  *%rax
  803a32:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803a36:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803a3a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803a3e:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803a45:	00 
  803a46:	e9 92 00 00 00       	jmpq   803add <devpipe_read+0xd2>
  803a4b:	eb 41                	jmp    803a8e <devpipe_read+0x83>
  803a4d:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  803a52:	74 09                	je     803a5d <devpipe_read+0x52>
  803a54:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803a58:	e9 92 00 00 00       	jmpq   803aef <devpipe_read+0xe4>
  803a5d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803a61:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803a65:	48 89 d6             	mov    %rdx,%rsi
  803a68:	48 89 c7             	mov    %rax,%rdi
  803a6b:	48 b8 d4 38 80 00 00 	movabs $0x8038d4,%rax
  803a72:	00 00 00 
  803a75:	ff d0                	callq  *%rax
  803a77:	85 c0                	test   %eax,%eax
  803a79:	74 07                	je     803a82 <devpipe_read+0x77>
  803a7b:	b8 00 00 00 00       	mov    $0x0,%eax
  803a80:	eb 6d                	jmp    803aef <devpipe_read+0xe4>
  803a82:	48 b8 8b 19 80 00 00 	movabs $0x80198b,%rax
  803a89:	00 00 00 
  803a8c:	ff d0                	callq  *%rax
  803a8e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a92:	8b 10                	mov    (%rax),%edx
  803a94:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a98:	8b 40 04             	mov    0x4(%rax),%eax
  803a9b:	39 c2                	cmp    %eax,%edx
  803a9d:	74 ae                	je     803a4d <devpipe_read+0x42>
  803a9f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803aa3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803aa7:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  803aab:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803aaf:	8b 00                	mov    (%rax),%eax
  803ab1:	99                   	cltd   
  803ab2:	c1 ea 1b             	shr    $0x1b,%edx
  803ab5:	01 d0                	add    %edx,%eax
  803ab7:	83 e0 1f             	and    $0x1f,%eax
  803aba:	29 d0                	sub    %edx,%eax
  803abc:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803ac0:	48 98                	cltq   
  803ac2:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  803ac7:	88 01                	mov    %al,(%rcx)
  803ac9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803acd:	8b 00                	mov    (%rax),%eax
  803acf:	8d 50 01             	lea    0x1(%rax),%edx
  803ad2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ad6:	89 10                	mov    %edx,(%rax)
  803ad8:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803add:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803ae1:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803ae5:	0f 82 60 ff ff ff    	jb     803a4b <devpipe_read+0x40>
  803aeb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803aef:	c9                   	leaveq 
  803af0:	c3                   	retq   

0000000000803af1 <devpipe_write>:
  803af1:	55                   	push   %rbp
  803af2:	48 89 e5             	mov    %rsp,%rbp
  803af5:	48 83 ec 40          	sub    $0x40,%rsp
  803af9:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803afd:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803b01:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803b05:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803b09:	48 89 c7             	mov    %rax,%rdi
  803b0c:	48 b8 ca 1e 80 00 00 	movabs $0x801eca,%rax
  803b13:	00 00 00 
  803b16:	ff d0                	callq  *%rax
  803b18:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803b1c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803b20:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803b24:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803b2b:	00 
  803b2c:	e9 8e 00 00 00       	jmpq   803bbf <devpipe_write+0xce>
  803b31:	eb 31                	jmp    803b64 <devpipe_write+0x73>
  803b33:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803b37:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803b3b:	48 89 d6             	mov    %rdx,%rsi
  803b3e:	48 89 c7             	mov    %rax,%rdi
  803b41:	48 b8 d4 38 80 00 00 	movabs $0x8038d4,%rax
  803b48:	00 00 00 
  803b4b:	ff d0                	callq  *%rax
  803b4d:	85 c0                	test   %eax,%eax
  803b4f:	74 07                	je     803b58 <devpipe_write+0x67>
  803b51:	b8 00 00 00 00       	mov    $0x0,%eax
  803b56:	eb 79                	jmp    803bd1 <devpipe_write+0xe0>
  803b58:	48 b8 8b 19 80 00 00 	movabs $0x80198b,%rax
  803b5f:	00 00 00 
  803b62:	ff d0                	callq  *%rax
  803b64:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b68:	8b 40 04             	mov    0x4(%rax),%eax
  803b6b:	48 63 d0             	movslq %eax,%rdx
  803b6e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b72:	8b 00                	mov    (%rax),%eax
  803b74:	48 98                	cltq   
  803b76:	48 83 c0 20          	add    $0x20,%rax
  803b7a:	48 39 c2             	cmp    %rax,%rdx
  803b7d:	73 b4                	jae    803b33 <devpipe_write+0x42>
  803b7f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b83:	8b 40 04             	mov    0x4(%rax),%eax
  803b86:	99                   	cltd   
  803b87:	c1 ea 1b             	shr    $0x1b,%edx
  803b8a:	01 d0                	add    %edx,%eax
  803b8c:	83 e0 1f             	and    $0x1f,%eax
  803b8f:	29 d0                	sub    %edx,%eax
  803b91:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  803b95:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  803b99:	48 01 ca             	add    %rcx,%rdx
  803b9c:	0f b6 0a             	movzbl (%rdx),%ecx
  803b9f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803ba3:	48 98                	cltq   
  803ba5:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  803ba9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803bad:	8b 40 04             	mov    0x4(%rax),%eax
  803bb0:	8d 50 01             	lea    0x1(%rax),%edx
  803bb3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803bb7:	89 50 04             	mov    %edx,0x4(%rax)
  803bba:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803bbf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803bc3:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803bc7:	0f 82 64 ff ff ff    	jb     803b31 <devpipe_write+0x40>
  803bcd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803bd1:	c9                   	leaveq 
  803bd2:	c3                   	retq   

0000000000803bd3 <devpipe_stat>:
  803bd3:	55                   	push   %rbp
  803bd4:	48 89 e5             	mov    %rsp,%rbp
  803bd7:	48 83 ec 20          	sub    $0x20,%rsp
  803bdb:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803bdf:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803be3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803be7:	48 89 c7             	mov    %rax,%rdi
  803bea:	48 b8 ca 1e 80 00 00 	movabs $0x801eca,%rax
  803bf1:	00 00 00 
  803bf4:	ff d0                	callq  *%rax
  803bf6:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803bfa:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803bfe:	48 be 0e 4f 80 00 00 	movabs $0x804f0e,%rsi
  803c05:	00 00 00 
  803c08:	48 89 c7             	mov    %rax,%rdi
  803c0b:	48 b8 9a 10 80 00 00 	movabs $0x80109a,%rax
  803c12:	00 00 00 
  803c15:	ff d0                	callq  *%rax
  803c17:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803c1b:	8b 50 04             	mov    0x4(%rax),%edx
  803c1e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803c22:	8b 00                	mov    (%rax),%eax
  803c24:	29 c2                	sub    %eax,%edx
  803c26:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803c2a:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  803c30:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803c34:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  803c3b:	00 00 00 
  803c3e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803c42:	48 b9 e0 70 80 00 00 	movabs $0x8070e0,%rcx
  803c49:	00 00 00 
  803c4c:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  803c53:	b8 00 00 00 00       	mov    $0x0,%eax
  803c58:	c9                   	leaveq 
  803c59:	c3                   	retq   

0000000000803c5a <devpipe_close>:
  803c5a:	55                   	push   %rbp
  803c5b:	48 89 e5             	mov    %rsp,%rbp
  803c5e:	48 83 ec 10          	sub    $0x10,%rsp
  803c62:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803c66:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803c6a:	48 89 c6             	mov    %rax,%rsi
  803c6d:	bf 00 00 00 00       	mov    $0x0,%edi
  803c72:	48 b8 74 1a 80 00 00 	movabs $0x801a74,%rax
  803c79:	00 00 00 
  803c7c:	ff d0                	callq  *%rax
  803c7e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803c82:	48 89 c7             	mov    %rax,%rdi
  803c85:	48 b8 ca 1e 80 00 00 	movabs $0x801eca,%rax
  803c8c:	00 00 00 
  803c8f:	ff d0                	callq  *%rax
  803c91:	48 89 c6             	mov    %rax,%rsi
  803c94:	bf 00 00 00 00       	mov    $0x0,%edi
  803c99:	48 b8 74 1a 80 00 00 	movabs $0x801a74,%rax
  803ca0:	00 00 00 
  803ca3:	ff d0                	callq  *%rax
  803ca5:	c9                   	leaveq 
  803ca6:	c3                   	retq   

0000000000803ca7 <cputchar>:
  803ca7:	55                   	push   %rbp
  803ca8:	48 89 e5             	mov    %rsp,%rbp
  803cab:	48 83 ec 20          	sub    $0x20,%rsp
  803caf:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803cb2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803cb5:	88 45 ff             	mov    %al,-0x1(%rbp)
  803cb8:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  803cbc:	be 01 00 00 00       	mov    $0x1,%esi
  803cc1:	48 89 c7             	mov    %rax,%rdi
  803cc4:	48 b8 81 18 80 00 00 	movabs $0x801881,%rax
  803ccb:	00 00 00 
  803cce:	ff d0                	callq  *%rax
  803cd0:	c9                   	leaveq 
  803cd1:	c3                   	retq   

0000000000803cd2 <getchar>:
  803cd2:	55                   	push   %rbp
  803cd3:	48 89 e5             	mov    %rsp,%rbp
  803cd6:	48 83 ec 10          	sub    $0x10,%rsp
  803cda:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  803cde:	ba 01 00 00 00       	mov    $0x1,%edx
  803ce3:	48 89 c6             	mov    %rax,%rsi
  803ce6:	bf 00 00 00 00       	mov    $0x0,%edi
  803ceb:	48 b8 bf 23 80 00 00 	movabs $0x8023bf,%rax
  803cf2:	00 00 00 
  803cf5:	ff d0                	callq  *%rax
  803cf7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803cfa:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803cfe:	79 05                	jns    803d05 <getchar+0x33>
  803d00:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d03:	eb 14                	jmp    803d19 <getchar+0x47>
  803d05:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803d09:	7f 07                	jg     803d12 <getchar+0x40>
  803d0b:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  803d10:	eb 07                	jmp    803d19 <getchar+0x47>
  803d12:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  803d16:	0f b6 c0             	movzbl %al,%eax
  803d19:	c9                   	leaveq 
  803d1a:	c3                   	retq   

0000000000803d1b <iscons>:
  803d1b:	55                   	push   %rbp
  803d1c:	48 89 e5             	mov    %rsp,%rbp
  803d1f:	48 83 ec 20          	sub    $0x20,%rsp
  803d23:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803d26:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803d2a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803d2d:	48 89 d6             	mov    %rdx,%rsi
  803d30:	89 c7                	mov    %eax,%edi
  803d32:	48 b8 8d 1f 80 00 00 	movabs $0x801f8d,%rax
  803d39:	00 00 00 
  803d3c:	ff d0                	callq  *%rax
  803d3e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803d41:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803d45:	79 05                	jns    803d4c <iscons+0x31>
  803d47:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d4a:	eb 1a                	jmp    803d66 <iscons+0x4b>
  803d4c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803d50:	8b 10                	mov    (%rax),%edx
  803d52:	48 b8 20 71 80 00 00 	movabs $0x807120,%rax
  803d59:	00 00 00 
  803d5c:	8b 00                	mov    (%rax),%eax
  803d5e:	39 c2                	cmp    %eax,%edx
  803d60:	0f 94 c0             	sete   %al
  803d63:	0f b6 c0             	movzbl %al,%eax
  803d66:	c9                   	leaveq 
  803d67:	c3                   	retq   

0000000000803d68 <opencons>:
  803d68:	55                   	push   %rbp
  803d69:	48 89 e5             	mov    %rsp,%rbp
  803d6c:	48 83 ec 10          	sub    $0x10,%rsp
  803d70:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803d74:	48 89 c7             	mov    %rax,%rdi
  803d77:	48 b8 f5 1e 80 00 00 	movabs $0x801ef5,%rax
  803d7e:	00 00 00 
  803d81:	ff d0                	callq  *%rax
  803d83:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803d86:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803d8a:	79 05                	jns    803d91 <opencons+0x29>
  803d8c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d8f:	eb 5b                	jmp    803dec <opencons+0x84>
  803d91:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803d95:	ba 07 04 00 00       	mov    $0x407,%edx
  803d9a:	48 89 c6             	mov    %rax,%rsi
  803d9d:	bf 00 00 00 00       	mov    $0x0,%edi
  803da2:	48 b8 c9 19 80 00 00 	movabs $0x8019c9,%rax
  803da9:	00 00 00 
  803dac:	ff d0                	callq  *%rax
  803dae:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803db1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803db5:	79 05                	jns    803dbc <opencons+0x54>
  803db7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803dba:	eb 30                	jmp    803dec <opencons+0x84>
  803dbc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803dc0:	48 ba 20 71 80 00 00 	movabs $0x807120,%rdx
  803dc7:	00 00 00 
  803dca:	8b 12                	mov    (%rdx),%edx
  803dcc:	89 10                	mov    %edx,(%rax)
  803dce:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803dd2:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  803dd9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ddd:	48 89 c7             	mov    %rax,%rdi
  803de0:	48 b8 a7 1e 80 00 00 	movabs $0x801ea7,%rax
  803de7:	00 00 00 
  803dea:	ff d0                	callq  *%rax
  803dec:	c9                   	leaveq 
  803ded:	c3                   	retq   

0000000000803dee <devcons_read>:
  803dee:	55                   	push   %rbp
  803def:	48 89 e5             	mov    %rsp,%rbp
  803df2:	48 83 ec 30          	sub    $0x30,%rsp
  803df6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803dfa:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803dfe:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803e02:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  803e07:	75 07                	jne    803e10 <devcons_read+0x22>
  803e09:	b8 00 00 00 00       	mov    $0x0,%eax
  803e0e:	eb 4b                	jmp    803e5b <devcons_read+0x6d>
  803e10:	eb 0c                	jmp    803e1e <devcons_read+0x30>
  803e12:	48 b8 8b 19 80 00 00 	movabs $0x80198b,%rax
  803e19:	00 00 00 
  803e1c:	ff d0                	callq  *%rax
  803e1e:	48 b8 cb 18 80 00 00 	movabs $0x8018cb,%rax
  803e25:	00 00 00 
  803e28:	ff d0                	callq  *%rax
  803e2a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803e2d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803e31:	74 df                	je     803e12 <devcons_read+0x24>
  803e33:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803e37:	79 05                	jns    803e3e <devcons_read+0x50>
  803e39:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e3c:	eb 1d                	jmp    803e5b <devcons_read+0x6d>
  803e3e:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  803e42:	75 07                	jne    803e4b <devcons_read+0x5d>
  803e44:	b8 00 00 00 00       	mov    $0x0,%eax
  803e49:	eb 10                	jmp    803e5b <devcons_read+0x6d>
  803e4b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e4e:	89 c2                	mov    %eax,%edx
  803e50:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803e54:	88 10                	mov    %dl,(%rax)
  803e56:	b8 01 00 00 00       	mov    $0x1,%eax
  803e5b:	c9                   	leaveq 
  803e5c:	c3                   	retq   

0000000000803e5d <devcons_write>:
  803e5d:	55                   	push   %rbp
  803e5e:	48 89 e5             	mov    %rsp,%rbp
  803e61:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  803e68:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  803e6f:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  803e76:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  803e7d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803e84:	eb 76                	jmp    803efc <devcons_write+0x9f>
  803e86:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  803e8d:	89 c2                	mov    %eax,%edx
  803e8f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e92:	29 c2                	sub    %eax,%edx
  803e94:	89 d0                	mov    %edx,%eax
  803e96:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803e99:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803e9c:	83 f8 7f             	cmp    $0x7f,%eax
  803e9f:	76 07                	jbe    803ea8 <devcons_write+0x4b>
  803ea1:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  803ea8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803eab:	48 63 d0             	movslq %eax,%rdx
  803eae:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803eb1:	48 63 c8             	movslq %eax,%rcx
  803eb4:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  803ebb:	48 01 c1             	add    %rax,%rcx
  803ebe:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  803ec5:	48 89 ce             	mov    %rcx,%rsi
  803ec8:	48 89 c7             	mov    %rax,%rdi
  803ecb:	48 b8 be 13 80 00 00 	movabs $0x8013be,%rax
  803ed2:	00 00 00 
  803ed5:	ff d0                	callq  *%rax
  803ed7:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803eda:	48 63 d0             	movslq %eax,%rdx
  803edd:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  803ee4:	48 89 d6             	mov    %rdx,%rsi
  803ee7:	48 89 c7             	mov    %rax,%rdi
  803eea:	48 b8 81 18 80 00 00 	movabs $0x801881,%rax
  803ef1:	00 00 00 
  803ef4:	ff d0                	callq  *%rax
  803ef6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803ef9:	01 45 fc             	add    %eax,-0x4(%rbp)
  803efc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803eff:	48 98                	cltq   
  803f01:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  803f08:	0f 82 78 ff ff ff    	jb     803e86 <devcons_write+0x29>
  803f0e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f11:	c9                   	leaveq 
  803f12:	c3                   	retq   

0000000000803f13 <devcons_close>:
  803f13:	55                   	push   %rbp
  803f14:	48 89 e5             	mov    %rsp,%rbp
  803f17:	48 83 ec 08          	sub    $0x8,%rsp
  803f1b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803f1f:	b8 00 00 00 00       	mov    $0x0,%eax
  803f24:	c9                   	leaveq 
  803f25:	c3                   	retq   

0000000000803f26 <devcons_stat>:
  803f26:	55                   	push   %rbp
  803f27:	48 89 e5             	mov    %rsp,%rbp
  803f2a:	48 83 ec 10          	sub    $0x10,%rsp
  803f2e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803f32:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803f36:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f3a:	48 be 1a 4f 80 00 00 	movabs $0x804f1a,%rsi
  803f41:	00 00 00 
  803f44:	48 89 c7             	mov    %rax,%rdi
  803f47:	48 b8 9a 10 80 00 00 	movabs $0x80109a,%rax
  803f4e:	00 00 00 
  803f51:	ff d0                	callq  *%rax
  803f53:	b8 00 00 00 00       	mov    $0x0,%eax
  803f58:	c9                   	leaveq 
  803f59:	c3                   	retq   

0000000000803f5a <_panic>:
  803f5a:	55                   	push   %rbp
  803f5b:	48 89 e5             	mov    %rsp,%rbp
  803f5e:	53                   	push   %rbx
  803f5f:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  803f66:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  803f6d:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  803f73:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  803f7a:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  803f81:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  803f88:	84 c0                	test   %al,%al
  803f8a:	74 23                	je     803faf <_panic+0x55>
  803f8c:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  803f93:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  803f97:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  803f9b:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  803f9f:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  803fa3:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  803fa7:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  803fab:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  803faf:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  803fb6:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  803fbd:	00 00 00 
  803fc0:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  803fc7:	00 00 00 
  803fca:	48 8d 45 10          	lea    0x10(%rbp),%rax
  803fce:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  803fd5:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  803fdc:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  803fe3:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803fea:	00 00 00 
  803fed:	48 8b 18             	mov    (%rax),%rbx
  803ff0:	48 b8 4d 19 80 00 00 	movabs $0x80194d,%rax
  803ff7:	00 00 00 
  803ffa:	ff d0                	callq  *%rax
  803ffc:	8b 8d 14 ff ff ff    	mov    -0xec(%rbp),%ecx
  804002:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  804009:	41 89 c8             	mov    %ecx,%r8d
  80400c:	48 89 d1             	mov    %rdx,%rcx
  80400f:	48 89 da             	mov    %rbx,%rdx
  804012:	89 c6                	mov    %eax,%esi
  804014:	48 bf 28 4f 80 00 00 	movabs $0x804f28,%rdi
  80401b:	00 00 00 
  80401e:	b8 00 00 00 00       	mov    $0x0,%eax
  804023:	49 b9 e5 04 80 00 00 	movabs $0x8004e5,%r9
  80402a:	00 00 00 
  80402d:	41 ff d1             	callq  *%r9
  804030:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  804037:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  80403e:	48 89 d6             	mov    %rdx,%rsi
  804041:	48 89 c7             	mov    %rax,%rdi
  804044:	48 b8 39 04 80 00 00 	movabs $0x800439,%rax
  80404b:	00 00 00 
  80404e:	ff d0                	callq  *%rax
  804050:	48 bf 4b 4f 80 00 00 	movabs $0x804f4b,%rdi
  804057:	00 00 00 
  80405a:	b8 00 00 00 00       	mov    $0x0,%eax
  80405f:	48 ba e5 04 80 00 00 	movabs $0x8004e5,%rdx
  804066:	00 00 00 
  804069:	ff d2                	callq  *%rdx
  80406b:	cc                   	int3   
  80406c:	eb fd                	jmp    80406b <_panic+0x111>

000000000080406e <ipc_recv>:
  80406e:	55                   	push   %rbp
  80406f:	48 89 e5             	mov    %rsp,%rbp
  804072:	48 83 ec 30          	sub    $0x30,%rsp
  804076:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80407a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80407e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804082:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  804087:	75 0e                	jne    804097 <ipc_recv+0x29>
  804089:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804090:	00 00 00 
  804093:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804097:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80409b:	48 89 c7             	mov    %rax,%rdi
  80409e:	48 b8 f2 1b 80 00 00 	movabs $0x801bf2,%rax
  8040a5:	00 00 00 
  8040a8:	ff d0                	callq  *%rax
  8040aa:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8040ad:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8040b1:	79 27                	jns    8040da <ipc_recv+0x6c>
  8040b3:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8040b8:	74 0a                	je     8040c4 <ipc_recv+0x56>
  8040ba:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8040be:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8040c4:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8040c9:	74 0a                	je     8040d5 <ipc_recv+0x67>
  8040cb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8040cf:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8040d5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8040d8:	eb 53                	jmp    80412d <ipc_recv+0xbf>
  8040da:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8040df:	74 19                	je     8040fa <ipc_recv+0x8c>
  8040e1:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  8040e8:	00 00 00 
  8040eb:	48 8b 00             	mov    (%rax),%rax
  8040ee:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  8040f4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8040f8:	89 10                	mov    %edx,(%rax)
  8040fa:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8040ff:	74 19                	je     80411a <ipc_recv+0xac>
  804101:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  804108:	00 00 00 
  80410b:	48 8b 00             	mov    (%rax),%rax
  80410e:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  804114:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804118:	89 10                	mov    %edx,(%rax)
  80411a:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  804121:	00 00 00 
  804124:	48 8b 00             	mov    (%rax),%rax
  804127:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  80412d:	c9                   	leaveq 
  80412e:	c3                   	retq   

000000000080412f <ipc_send>:
  80412f:	55                   	push   %rbp
  804130:	48 89 e5             	mov    %rsp,%rbp
  804133:	48 83 ec 30          	sub    $0x30,%rsp
  804137:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80413a:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80413d:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  804141:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  804144:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  804149:	75 10                	jne    80415b <ipc_send+0x2c>
  80414b:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804152:	00 00 00 
  804155:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804159:	eb 0e                	jmp    804169 <ipc_send+0x3a>
  80415b:	eb 0c                	jmp    804169 <ipc_send+0x3a>
  80415d:	48 b8 8b 19 80 00 00 	movabs $0x80198b,%rax
  804164:	00 00 00 
  804167:	ff d0                	callq  *%rax
  804169:	8b 75 e8             	mov    -0x18(%rbp),%esi
  80416c:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  80416f:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  804173:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804176:	89 c7                	mov    %eax,%edi
  804178:	48 b8 9d 1b 80 00 00 	movabs $0x801b9d,%rax
  80417f:	00 00 00 
  804182:	ff d0                	callq  *%rax
  804184:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804187:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  80418b:	74 d0                	je     80415d <ipc_send+0x2e>
  80418d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804191:	79 30                	jns    8041c3 <ipc_send+0x94>
  804193:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804196:	89 c1                	mov    %eax,%ecx
  804198:	48 ba 4d 4f 80 00 00 	movabs $0x804f4d,%rdx
  80419f:	00 00 00 
  8041a2:	be 44 00 00 00       	mov    $0x44,%esi
  8041a7:	48 bf 63 4f 80 00 00 	movabs $0x804f63,%rdi
  8041ae:	00 00 00 
  8041b1:	b8 00 00 00 00       	mov    $0x0,%eax
  8041b6:	49 b8 5a 3f 80 00 00 	movabs $0x803f5a,%r8
  8041bd:	00 00 00 
  8041c0:	41 ff d0             	callq  *%r8
  8041c3:	c9                   	leaveq 
  8041c4:	c3                   	retq   

00000000008041c5 <ipc_find_env>:
  8041c5:	55                   	push   %rbp
  8041c6:	48 89 e5             	mov    %rsp,%rbp
  8041c9:	48 83 ec 14          	sub    $0x14,%rsp
  8041cd:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8041d0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8041d7:	eb 4e                	jmp    804227 <ipc_find_env+0x62>
  8041d9:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  8041e0:	00 00 00 
  8041e3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8041e6:	48 98                	cltq   
  8041e8:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  8041ef:	48 01 d0             	add    %rdx,%rax
  8041f2:	48 05 d0 00 00 00    	add    $0xd0,%rax
  8041f8:	8b 00                	mov    (%rax),%eax
  8041fa:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  8041fd:	75 24                	jne    804223 <ipc_find_env+0x5e>
  8041ff:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804206:	00 00 00 
  804209:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80420c:	48 98                	cltq   
  80420e:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804215:	48 01 d0             	add    %rdx,%rax
  804218:	48 05 c0 00 00 00    	add    $0xc0,%rax
  80421e:	8b 40 08             	mov    0x8(%rax),%eax
  804221:	eb 12                	jmp    804235 <ipc_find_env+0x70>
  804223:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  804227:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  80422e:	7e a9                	jle    8041d9 <ipc_find_env+0x14>
  804230:	b8 00 00 00 00       	mov    $0x0,%eax
  804235:	c9                   	leaveq 
  804236:	c3                   	retq   

0000000000804237 <pageref>:
  804237:	55                   	push   %rbp
  804238:	48 89 e5             	mov    %rsp,%rbp
  80423b:	48 83 ec 18          	sub    $0x18,%rsp
  80423f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804243:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804247:	48 c1 e8 15          	shr    $0x15,%rax
  80424b:	48 89 c2             	mov    %rax,%rdx
  80424e:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  804255:	01 00 00 
  804258:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80425c:	83 e0 01             	and    $0x1,%eax
  80425f:	48 85 c0             	test   %rax,%rax
  804262:	75 07                	jne    80426b <pageref+0x34>
  804264:	b8 00 00 00 00       	mov    $0x0,%eax
  804269:	eb 53                	jmp    8042be <pageref+0x87>
  80426b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80426f:	48 c1 e8 0c          	shr    $0xc,%rax
  804273:	48 89 c2             	mov    %rax,%rdx
  804276:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80427d:	01 00 00 
  804280:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804284:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804288:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80428c:	83 e0 01             	and    $0x1,%eax
  80428f:	48 85 c0             	test   %rax,%rax
  804292:	75 07                	jne    80429b <pageref+0x64>
  804294:	b8 00 00 00 00       	mov    $0x0,%eax
  804299:	eb 23                	jmp    8042be <pageref+0x87>
  80429b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80429f:	48 c1 e8 0c          	shr    $0xc,%rax
  8042a3:	48 89 c2             	mov    %rax,%rdx
  8042a6:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  8042ad:	00 00 00 
  8042b0:	48 c1 e2 04          	shl    $0x4,%rdx
  8042b4:	48 01 d0             	add    %rdx,%rax
  8042b7:	0f b7 40 08          	movzwl 0x8(%rax),%eax
  8042bb:	0f b7 c0             	movzwl %ax,%eax
  8042be:	c9                   	leaveq 
  8042bf:	c3                   	retq   

00000000008042c0 <inet_addr>:
  8042c0:	55                   	push   %rbp
  8042c1:	48 89 e5             	mov    %rsp,%rbp
  8042c4:	48 83 ec 20          	sub    $0x20,%rsp
  8042c8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8042cc:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8042d0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8042d4:	48 89 d6             	mov    %rdx,%rsi
  8042d7:	48 89 c7             	mov    %rax,%rdi
  8042da:	48 b8 f6 42 80 00 00 	movabs $0x8042f6,%rax
  8042e1:	00 00 00 
  8042e4:	ff d0                	callq  *%rax
  8042e6:	85 c0                	test   %eax,%eax
  8042e8:	74 05                	je     8042ef <inet_addr+0x2f>
  8042ea:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8042ed:	eb 05                	jmp    8042f4 <inet_addr+0x34>
  8042ef:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  8042f4:	c9                   	leaveq 
  8042f5:	c3                   	retq   

00000000008042f6 <inet_aton>:
  8042f6:	55                   	push   %rbp
  8042f7:	48 89 e5             	mov    %rsp,%rbp
  8042fa:	48 83 ec 40          	sub    $0x40,%rsp
  8042fe:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  804302:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
  804306:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  80430a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80430e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  804312:	0f b6 00             	movzbl (%rax),%eax
  804315:	0f be c0             	movsbl %al,%eax
  804318:	89 45 f4             	mov    %eax,-0xc(%rbp)
  80431b:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80431e:	3c 2f                	cmp    $0x2f,%al
  804320:	76 07                	jbe    804329 <inet_aton+0x33>
  804322:	8b 45 f4             	mov    -0xc(%rbp),%eax
  804325:	3c 39                	cmp    $0x39,%al
  804327:	76 0a                	jbe    804333 <inet_aton+0x3d>
  804329:	b8 00 00 00 00       	mov    $0x0,%eax
  80432e:	e9 68 02 00 00       	jmpq   80459b <inet_aton+0x2a5>
  804333:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80433a:	c7 45 f8 0a 00 00 00 	movl   $0xa,-0x8(%rbp)
  804341:	83 7d f4 30          	cmpl   $0x30,-0xc(%rbp)
  804345:	75 40                	jne    804387 <inet_aton+0x91>
  804347:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  80434c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  804350:	0f b6 00             	movzbl (%rax),%eax
  804353:	0f be c0             	movsbl %al,%eax
  804356:	89 45 f4             	mov    %eax,-0xc(%rbp)
  804359:	83 7d f4 78          	cmpl   $0x78,-0xc(%rbp)
  80435d:	74 06                	je     804365 <inet_aton+0x6f>
  80435f:	83 7d f4 58          	cmpl   $0x58,-0xc(%rbp)
  804363:	75 1b                	jne    804380 <inet_aton+0x8a>
  804365:	c7 45 f8 10 00 00 00 	movl   $0x10,-0x8(%rbp)
  80436c:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  804371:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  804375:	0f b6 00             	movzbl (%rax),%eax
  804378:	0f be c0             	movsbl %al,%eax
  80437b:	89 45 f4             	mov    %eax,-0xc(%rbp)
  80437e:	eb 07                	jmp    804387 <inet_aton+0x91>
  804380:	c7 45 f8 08 00 00 00 	movl   $0x8,-0x8(%rbp)
  804387:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80438a:	3c 2f                	cmp    $0x2f,%al
  80438c:	76 2f                	jbe    8043bd <inet_aton+0xc7>
  80438e:	8b 45 f4             	mov    -0xc(%rbp),%eax
  804391:	3c 39                	cmp    $0x39,%al
  804393:	77 28                	ja     8043bd <inet_aton+0xc7>
  804395:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804398:	0f af 45 fc          	imul   -0x4(%rbp),%eax
  80439c:	89 c2                	mov    %eax,%edx
  80439e:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8043a1:	01 d0                	add    %edx,%eax
  8043a3:	83 e8 30             	sub    $0x30,%eax
  8043a6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8043a9:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  8043ae:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8043b2:	0f b6 00             	movzbl (%rax),%eax
  8043b5:	0f be c0             	movsbl %al,%eax
  8043b8:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8043bb:	eb ca                	jmp    804387 <inet_aton+0x91>
  8043bd:	83 7d f8 10          	cmpl   $0x10,-0x8(%rbp)
  8043c1:	75 72                	jne    804435 <inet_aton+0x13f>
  8043c3:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8043c6:	3c 2f                	cmp    $0x2f,%al
  8043c8:	76 07                	jbe    8043d1 <inet_aton+0xdb>
  8043ca:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8043cd:	3c 39                	cmp    $0x39,%al
  8043cf:	76 1c                	jbe    8043ed <inet_aton+0xf7>
  8043d1:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8043d4:	3c 60                	cmp    $0x60,%al
  8043d6:	76 07                	jbe    8043df <inet_aton+0xe9>
  8043d8:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8043db:	3c 66                	cmp    $0x66,%al
  8043dd:	76 0e                	jbe    8043ed <inet_aton+0xf7>
  8043df:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8043e2:	3c 40                	cmp    $0x40,%al
  8043e4:	76 4f                	jbe    804435 <inet_aton+0x13f>
  8043e6:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8043e9:	3c 46                	cmp    $0x46,%al
  8043eb:	77 48                	ja     804435 <inet_aton+0x13f>
  8043ed:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8043f0:	c1 e0 04             	shl    $0x4,%eax
  8043f3:	89 c2                	mov    %eax,%edx
  8043f5:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8043f8:	8d 48 0a             	lea    0xa(%rax),%ecx
  8043fb:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8043fe:	3c 60                	cmp    $0x60,%al
  804400:	76 0e                	jbe    804410 <inet_aton+0x11a>
  804402:	8b 45 f4             	mov    -0xc(%rbp),%eax
  804405:	3c 7a                	cmp    $0x7a,%al
  804407:	77 07                	ja     804410 <inet_aton+0x11a>
  804409:	b8 61 00 00 00       	mov    $0x61,%eax
  80440e:	eb 05                	jmp    804415 <inet_aton+0x11f>
  804410:	b8 41 00 00 00       	mov    $0x41,%eax
  804415:	29 c1                	sub    %eax,%ecx
  804417:	89 c8                	mov    %ecx,%eax
  804419:	09 d0                	or     %edx,%eax
  80441b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80441e:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  804423:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  804427:	0f b6 00             	movzbl (%rax),%eax
  80442a:	0f be c0             	movsbl %al,%eax
  80442d:	89 45 f4             	mov    %eax,-0xc(%rbp)
  804430:	e9 52 ff ff ff       	jmpq   804387 <inet_aton+0x91>
  804435:	83 7d f4 2e          	cmpl   $0x2e,-0xc(%rbp)
  804439:	75 40                	jne    80447b <inet_aton+0x185>
  80443b:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  80443f:	48 83 c0 0c          	add    $0xc,%rax
  804443:	48 39 45 e8          	cmp    %rax,-0x18(%rbp)
  804447:	72 0a                	jb     804453 <inet_aton+0x15d>
  804449:	b8 00 00 00 00       	mov    $0x0,%eax
  80444e:	e9 48 01 00 00       	jmpq   80459b <inet_aton+0x2a5>
  804453:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804457:	48 8d 50 04          	lea    0x4(%rax),%rdx
  80445b:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80445f:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804462:	89 10                	mov    %edx,(%rax)
  804464:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  804469:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80446d:	0f b6 00             	movzbl (%rax),%eax
  804470:	0f be c0             	movsbl %al,%eax
  804473:	89 45 f4             	mov    %eax,-0xc(%rbp)
  804476:	e9 a0 fe ff ff       	jmpq   80431b <inet_aton+0x25>
  80447b:	90                   	nop
  80447c:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  804480:	74 3c                	je     8044be <inet_aton+0x1c8>
  804482:	8b 45 f4             	mov    -0xc(%rbp),%eax
  804485:	3c 1f                	cmp    $0x1f,%al
  804487:	76 2b                	jbe    8044b4 <inet_aton+0x1be>
  804489:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80448c:	84 c0                	test   %al,%al
  80448e:	78 24                	js     8044b4 <inet_aton+0x1be>
  804490:	83 7d f4 20          	cmpl   $0x20,-0xc(%rbp)
  804494:	74 28                	je     8044be <inet_aton+0x1c8>
  804496:	83 7d f4 0c          	cmpl   $0xc,-0xc(%rbp)
  80449a:	74 22                	je     8044be <inet_aton+0x1c8>
  80449c:	83 7d f4 0a          	cmpl   $0xa,-0xc(%rbp)
  8044a0:	74 1c                	je     8044be <inet_aton+0x1c8>
  8044a2:	83 7d f4 0d          	cmpl   $0xd,-0xc(%rbp)
  8044a6:	74 16                	je     8044be <inet_aton+0x1c8>
  8044a8:	83 7d f4 09          	cmpl   $0x9,-0xc(%rbp)
  8044ac:	74 10                	je     8044be <inet_aton+0x1c8>
  8044ae:	83 7d f4 0b          	cmpl   $0xb,-0xc(%rbp)
  8044b2:	74 0a                	je     8044be <inet_aton+0x1c8>
  8044b4:	b8 00 00 00 00       	mov    $0x0,%eax
  8044b9:	e9 dd 00 00 00       	jmpq   80459b <inet_aton+0x2a5>
  8044be:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8044c2:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  8044c6:	48 29 c2             	sub    %rax,%rdx
  8044c9:	48 89 d0             	mov    %rdx,%rax
  8044cc:	48 c1 f8 02          	sar    $0x2,%rax
  8044d0:	83 c0 01             	add    $0x1,%eax
  8044d3:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  8044d6:	83 7d e4 04          	cmpl   $0x4,-0x1c(%rbp)
  8044da:	0f 87 98 00 00 00    	ja     804578 <inet_aton+0x282>
  8044e0:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8044e3:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8044ea:	00 
  8044eb:	48 b8 70 4f 80 00 00 	movabs $0x804f70,%rax
  8044f2:	00 00 00 
  8044f5:	48 01 d0             	add    %rdx,%rax
  8044f8:	48 8b 00             	mov    (%rax),%rax
  8044fb:	ff e0                	jmpq   *%rax
  8044fd:	b8 00 00 00 00       	mov    $0x0,%eax
  804502:	e9 94 00 00 00       	jmpq   80459b <inet_aton+0x2a5>
  804507:	81 7d fc ff ff ff 00 	cmpl   $0xffffff,-0x4(%rbp)
  80450e:	76 0a                	jbe    80451a <inet_aton+0x224>
  804510:	b8 00 00 00 00       	mov    $0x0,%eax
  804515:	e9 81 00 00 00       	jmpq   80459b <inet_aton+0x2a5>
  80451a:	8b 45 d0             	mov    -0x30(%rbp),%eax
  80451d:	c1 e0 18             	shl    $0x18,%eax
  804520:	09 45 fc             	or     %eax,-0x4(%rbp)
  804523:	eb 53                	jmp    804578 <inet_aton+0x282>
  804525:	81 7d fc ff ff 00 00 	cmpl   $0xffff,-0x4(%rbp)
  80452c:	76 07                	jbe    804535 <inet_aton+0x23f>
  80452e:	b8 00 00 00 00       	mov    $0x0,%eax
  804533:	eb 66                	jmp    80459b <inet_aton+0x2a5>
  804535:	8b 45 d0             	mov    -0x30(%rbp),%eax
  804538:	c1 e0 18             	shl    $0x18,%eax
  80453b:	89 c2                	mov    %eax,%edx
  80453d:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  804540:	c1 e0 10             	shl    $0x10,%eax
  804543:	09 d0                	or     %edx,%eax
  804545:	09 45 fc             	or     %eax,-0x4(%rbp)
  804548:	eb 2e                	jmp    804578 <inet_aton+0x282>
  80454a:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%rbp)
  804551:	76 07                	jbe    80455a <inet_aton+0x264>
  804553:	b8 00 00 00 00       	mov    $0x0,%eax
  804558:	eb 41                	jmp    80459b <inet_aton+0x2a5>
  80455a:	8b 45 d0             	mov    -0x30(%rbp),%eax
  80455d:	c1 e0 18             	shl    $0x18,%eax
  804560:	89 c2                	mov    %eax,%edx
  804562:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  804565:	c1 e0 10             	shl    $0x10,%eax
  804568:	09 c2                	or     %eax,%edx
  80456a:	8b 45 d8             	mov    -0x28(%rbp),%eax
  80456d:	c1 e0 08             	shl    $0x8,%eax
  804570:	09 d0                	or     %edx,%eax
  804572:	09 45 fc             	or     %eax,-0x4(%rbp)
  804575:	eb 01                	jmp    804578 <inet_aton+0x282>
  804577:	90                   	nop
  804578:	48 83 7d c0 00       	cmpq   $0x0,-0x40(%rbp)
  80457d:	74 17                	je     804596 <inet_aton+0x2a0>
  80457f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804582:	89 c7                	mov    %eax,%edi
  804584:	48 b8 14 47 80 00 00 	movabs $0x804714,%rax
  80458b:	00 00 00 
  80458e:	ff d0                	callq  *%rax
  804590:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  804594:	89 02                	mov    %eax,(%rdx)
  804596:	b8 01 00 00 00       	mov    $0x1,%eax
  80459b:	c9                   	leaveq 
  80459c:	c3                   	retq   

000000000080459d <inet_ntoa>:
  80459d:	55                   	push   %rbp
  80459e:	48 89 e5             	mov    %rsp,%rbp
  8045a1:	48 83 ec 30          	sub    $0x30,%rsp
  8045a5:	89 7d d0             	mov    %edi,-0x30(%rbp)
  8045a8:	8b 45 d0             	mov    -0x30(%rbp),%eax
  8045ab:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8045ae:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  8045b5:	00 00 00 
  8045b8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8045bc:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  8045c0:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8045c4:	c6 45 ef 00          	movb   $0x0,-0x11(%rbp)
  8045c8:	e9 e0 00 00 00       	jmpq   8046ad <inet_ntoa+0x110>
  8045cd:	c6 45 ee 00          	movb   $0x0,-0x12(%rbp)
  8045d1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8045d5:	0f b6 08             	movzbl (%rax),%ecx
  8045d8:	0f b6 d1             	movzbl %cl,%edx
  8045db:	89 d0                	mov    %edx,%eax
  8045dd:	c1 e0 02             	shl    $0x2,%eax
  8045e0:	01 d0                	add    %edx,%eax
  8045e2:	c1 e0 03             	shl    $0x3,%eax
  8045e5:	01 d0                	add    %edx,%eax
  8045e7:	8d 14 85 00 00 00 00 	lea    0x0(,%rax,4),%edx
  8045ee:	01 d0                	add    %edx,%eax
  8045f0:	66 c1 e8 08          	shr    $0x8,%ax
  8045f4:	c0 e8 03             	shr    $0x3,%al
  8045f7:	88 45 ed             	mov    %al,-0x13(%rbp)
  8045fa:	0f b6 55 ed          	movzbl -0x13(%rbp),%edx
  8045fe:	89 d0                	mov    %edx,%eax
  804600:	c1 e0 02             	shl    $0x2,%eax
  804603:	01 d0                	add    %edx,%eax
  804605:	01 c0                	add    %eax,%eax
  804607:	29 c1                	sub    %eax,%ecx
  804609:	89 c8                	mov    %ecx,%eax
  80460b:	88 45 ed             	mov    %al,-0x13(%rbp)
  80460e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804612:	0f b6 00             	movzbl (%rax),%eax
  804615:	0f b6 d0             	movzbl %al,%edx
  804618:	89 d0                	mov    %edx,%eax
  80461a:	c1 e0 02             	shl    $0x2,%eax
  80461d:	01 d0                	add    %edx,%eax
  80461f:	c1 e0 03             	shl    $0x3,%eax
  804622:	01 d0                	add    %edx,%eax
  804624:	8d 14 85 00 00 00 00 	lea    0x0(,%rax,4),%edx
  80462b:	01 d0                	add    %edx,%eax
  80462d:	66 c1 e8 08          	shr    $0x8,%ax
  804631:	89 c2                	mov    %eax,%edx
  804633:	c0 ea 03             	shr    $0x3,%dl
  804636:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80463a:	88 10                	mov    %dl,(%rax)
  80463c:	0f b6 45 ee          	movzbl -0x12(%rbp),%eax
  804640:	8d 50 01             	lea    0x1(%rax),%edx
  804643:	88 55 ee             	mov    %dl,-0x12(%rbp)
  804646:	0f b6 c0             	movzbl %al,%eax
  804649:	0f b6 55 ed          	movzbl -0x13(%rbp),%edx
  80464d:	83 c2 30             	add    $0x30,%edx
  804650:	48 98                	cltq   
  804652:	88 54 05 e0          	mov    %dl,-0x20(%rbp,%rax,1)
  804656:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80465a:	0f b6 00             	movzbl (%rax),%eax
  80465d:	84 c0                	test   %al,%al
  80465f:	0f 85 6c ff ff ff    	jne    8045d1 <inet_ntoa+0x34>
  804665:	eb 1a                	jmp    804681 <inet_ntoa+0xe4>
  804667:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80466b:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80466f:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
  804673:	0f b6 55 ee          	movzbl -0x12(%rbp),%edx
  804677:	48 63 d2             	movslq %edx,%rdx
  80467a:	0f b6 54 15 e0       	movzbl -0x20(%rbp,%rdx,1),%edx
  80467f:	88 10                	mov    %dl,(%rax)
  804681:	0f b6 45 ee          	movzbl -0x12(%rbp),%eax
  804685:	8d 50 ff             	lea    -0x1(%rax),%edx
  804688:	88 55 ee             	mov    %dl,-0x12(%rbp)
  80468b:	84 c0                	test   %al,%al
  80468d:	75 d8                	jne    804667 <inet_ntoa+0xca>
  80468f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804693:	48 8d 50 01          	lea    0x1(%rax),%rdx
  804697:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
  80469b:	c6 00 2e             	movb   $0x2e,(%rax)
  80469e:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8046a3:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  8046a7:	83 c0 01             	add    $0x1,%eax
  8046aa:	88 45 ef             	mov    %al,-0x11(%rbp)
  8046ad:	80 7d ef 03          	cmpb   $0x3,-0x11(%rbp)
  8046b1:	0f 86 16 ff ff ff    	jbe    8045cd <inet_ntoa+0x30>
  8046b7:	48 83 6d f8 01       	subq   $0x1,-0x8(%rbp)
  8046bc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8046c0:	c6 00 00             	movb   $0x0,(%rax)
  8046c3:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  8046ca:	00 00 00 
  8046cd:	c9                   	leaveq 
  8046ce:	c3                   	retq   

00000000008046cf <htons>:
  8046cf:	55                   	push   %rbp
  8046d0:	48 89 e5             	mov    %rsp,%rbp
  8046d3:	48 83 ec 04          	sub    $0x4,%rsp
  8046d7:	89 f8                	mov    %edi,%eax
  8046d9:	66 89 45 fc          	mov    %ax,-0x4(%rbp)
  8046dd:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
  8046e1:	c1 e0 08             	shl    $0x8,%eax
  8046e4:	89 c2                	mov    %eax,%edx
  8046e6:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
  8046ea:	66 c1 e8 08          	shr    $0x8,%ax
  8046ee:	09 d0                	or     %edx,%eax
  8046f0:	c9                   	leaveq 
  8046f1:	c3                   	retq   

00000000008046f2 <ntohs>:
  8046f2:	55                   	push   %rbp
  8046f3:	48 89 e5             	mov    %rsp,%rbp
  8046f6:	48 83 ec 08          	sub    $0x8,%rsp
  8046fa:	89 f8                	mov    %edi,%eax
  8046fc:	66 89 45 fc          	mov    %ax,-0x4(%rbp)
  804700:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
  804704:	89 c7                	mov    %eax,%edi
  804706:	48 b8 cf 46 80 00 00 	movabs $0x8046cf,%rax
  80470d:	00 00 00 
  804710:	ff d0                	callq  *%rax
  804712:	c9                   	leaveq 
  804713:	c3                   	retq   

0000000000804714 <htonl>:
  804714:	55                   	push   %rbp
  804715:	48 89 e5             	mov    %rsp,%rbp
  804718:	48 83 ec 04          	sub    $0x4,%rsp
  80471c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80471f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804722:	c1 e0 18             	shl    $0x18,%eax
  804725:	89 c2                	mov    %eax,%edx
  804727:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80472a:	25 00 ff 00 00       	and    $0xff00,%eax
  80472f:	c1 e0 08             	shl    $0x8,%eax
  804732:	09 c2                	or     %eax,%edx
  804734:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804737:	25 00 00 ff 00       	and    $0xff0000,%eax
  80473c:	48 c1 e8 08          	shr    $0x8,%rax
  804740:	09 c2                	or     %eax,%edx
  804742:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804745:	c1 e8 18             	shr    $0x18,%eax
  804748:	09 d0                	or     %edx,%eax
  80474a:	c9                   	leaveq 
  80474b:	c3                   	retq   

000000000080474c <ntohl>:
  80474c:	55                   	push   %rbp
  80474d:	48 89 e5             	mov    %rsp,%rbp
  804750:	48 83 ec 08          	sub    $0x8,%rsp
  804754:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804757:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80475a:	89 c7                	mov    %eax,%edi
  80475c:	48 b8 14 47 80 00 00 	movabs $0x804714,%rax
  804763:	00 00 00 
  804766:	ff d0                	callq  *%rax
  804768:	c9                   	leaveq 
  804769:	c3                   	retq   
