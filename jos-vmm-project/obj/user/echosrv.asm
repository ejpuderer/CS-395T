
obj/user/echosrv:     file format elf64-x86-64


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
  80003c:	e8 f7 02 00 00       	callq  800338 <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <die>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 10          	sub    $0x10,%rsp
  80004b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80004f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800053:	48 89 c6             	mov    %rax,%rsi
  800056:	48 bf a0 47 80 00 00 	movabs $0x8047a0,%rdi
  80005d:	00 00 00 
  800060:	b8 00 00 00 00       	mov    $0x0,%eax
  800065:	48 ba 03 05 80 00 00 	movabs $0x800503,%rdx
  80006c:	00 00 00 
  80006f:	ff d2                	callq  *%rdx
  800071:	48 b8 bb 03 80 00 00 	movabs $0x8003bb,%rax
  800078:	00 00 00 
  80007b:	ff d0                	callq  *%rax
  80007d:	c9                   	leaveq 
  80007e:	c3                   	retq   

000000000080007f <handle_client>:
  80007f:	55                   	push   %rbp
  800080:	48 89 e5             	mov    %rsp,%rbp
  800083:	48 83 ec 40          	sub    $0x40,%rsp
  800087:	89 7d cc             	mov    %edi,-0x34(%rbp)
  80008a:	c7 45 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%rbp)
  800091:	48 8d 4d d0          	lea    -0x30(%rbp),%rcx
  800095:	8b 45 cc             	mov    -0x34(%rbp),%eax
  800098:	ba 20 00 00 00       	mov    $0x20,%edx
  80009d:	48 89 ce             	mov    %rcx,%rsi
  8000a0:	89 c7                	mov    %eax,%edi
  8000a2:	48 b8 dd 23 80 00 00 	movabs $0x8023dd,%rax
  8000a9:	00 00 00 
  8000ac:	ff d0                	callq  *%rax
  8000ae:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8000b1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8000b5:	79 18                	jns    8000cf <handle_client+0x50>
  8000b7:	48 bf a8 47 80 00 00 	movabs $0x8047a8,%rdi
  8000be:	00 00 00 
  8000c1:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8000c8:	00 00 00 
  8000cb:	ff d0                	callq  *%rax
  8000cd:	eb 77                	jmp    800146 <handle_client+0xc7>
  8000cf:	eb 75                	jmp    800146 <handle_client+0xc7>
  8000d1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8000d4:	48 63 d0             	movslq %eax,%rdx
  8000d7:	48 8d 4d d0          	lea    -0x30(%rbp),%rcx
  8000db:	8b 45 cc             	mov    -0x34(%rbp),%eax
  8000de:	48 89 ce             	mov    %rcx,%rsi
  8000e1:	89 c7                	mov    %eax,%edi
  8000e3:	48 b8 27 25 80 00 00 	movabs $0x802527,%rax
  8000ea:	00 00 00 
  8000ed:	ff d0                	callq  *%rax
  8000ef:	3b 45 fc             	cmp    -0x4(%rbp),%eax
  8000f2:	74 16                	je     80010a <handle_client+0x8b>
  8000f4:	48 bf d8 47 80 00 00 	movabs $0x8047d8,%rdi
  8000fb:	00 00 00 
  8000fe:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800105:	00 00 00 
  800108:	ff d0                	callq  *%rax
  80010a:	48 8d 4d d0          	lea    -0x30(%rbp),%rcx
  80010e:	8b 45 cc             	mov    -0x34(%rbp),%eax
  800111:	ba 20 00 00 00       	mov    $0x20,%edx
  800116:	48 89 ce             	mov    %rcx,%rsi
  800119:	89 c7                	mov    %eax,%edi
  80011b:	48 b8 dd 23 80 00 00 	movabs $0x8023dd,%rax
  800122:	00 00 00 
  800125:	ff d0                	callq  *%rax
  800127:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80012a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80012e:	79 16                	jns    800146 <handle_client+0xc7>
  800130:	48 bf f8 47 80 00 00 	movabs $0x8047f8,%rdi
  800137:	00 00 00 
  80013a:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800141:	00 00 00 
  800144:	ff d0                	callq  *%rax
  800146:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80014a:	7f 85                	jg     8000d1 <handle_client+0x52>
  80014c:	8b 45 cc             	mov    -0x34(%rbp),%eax
  80014f:	89 c7                	mov    %eax,%edi
  800151:	48 b8 bb 21 80 00 00 	movabs $0x8021bb,%rax
  800158:	00 00 00 
  80015b:	ff d0                	callq  *%rax
  80015d:	c9                   	leaveq 
  80015e:	c3                   	retq   

000000000080015f <umain>:
  80015f:	55                   	push   %rbp
  800160:	48 89 e5             	mov    %rsp,%rbp
  800163:	48 83 ec 70          	sub    $0x70,%rsp
  800167:	89 7d 9c             	mov    %edi,-0x64(%rbp)
  80016a:	48 89 75 90          	mov    %rsi,-0x70(%rbp)
  80016e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800175:	ba 06 00 00 00       	mov    $0x6,%edx
  80017a:	be 01 00 00 00       	mov    $0x1,%esi
  80017f:	bf 02 00 00 00       	mov    $0x2,%edi
  800184:	48 b8 65 32 80 00 00 	movabs $0x803265,%rax
  80018b:	00 00 00 
  80018e:	ff d0                	callq  *%rax
  800190:	89 45 f8             	mov    %eax,-0x8(%rbp)
  800193:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  800197:	79 16                	jns    8001af <umain+0x50>
  800199:	48 bf 27 48 80 00 00 	movabs $0x804827,%rdi
  8001a0:	00 00 00 
  8001a3:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8001aa:	00 00 00 
  8001ad:	ff d0                	callq  *%rax
  8001af:	48 bf 3f 48 80 00 00 	movabs $0x80483f,%rdi
  8001b6:	00 00 00 
  8001b9:	b8 00 00 00 00       	mov    $0x0,%eax
  8001be:	48 ba 03 05 80 00 00 	movabs $0x800503,%rdx
  8001c5:	00 00 00 
  8001c8:	ff d2                	callq  *%rdx
  8001ca:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  8001ce:	ba 10 00 00 00       	mov    $0x10,%edx
  8001d3:	be 00 00 00 00       	mov    $0x0,%esi
  8001d8:	48 89 c7             	mov    %rax,%rdi
  8001db:	48 b8 51 13 80 00 00 	movabs $0x801351,%rax
  8001e2:	00 00 00 
  8001e5:	ff d0                	callq  *%rax
  8001e7:	c6 45 e1 02          	movb   $0x2,-0x1f(%rbp)
  8001eb:	bf 00 00 00 00       	mov    $0x0,%edi
  8001f0:	48 b8 32 47 80 00 00 	movabs $0x804732,%rax
  8001f7:	00 00 00 
  8001fa:	ff d0                	callq  *%rax
  8001fc:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  8001ff:	bf 07 00 00 00       	mov    $0x7,%edi
  800204:	48 b8 ed 46 80 00 00 	movabs $0x8046ed,%rax
  80020b:	00 00 00 
  80020e:	ff d0                	callq  *%rax
  800210:	66 89 45 e2          	mov    %ax,-0x1e(%rbp)
  800214:	48 bf 4e 48 80 00 00 	movabs $0x80484e,%rdi
  80021b:	00 00 00 
  80021e:	b8 00 00 00 00       	mov    $0x0,%eax
  800223:	48 ba 03 05 80 00 00 	movabs $0x800503,%rdx
  80022a:	00 00 00 
  80022d:	ff d2                	callq  *%rdx
  80022f:	48 8d 4d e0          	lea    -0x20(%rbp),%rcx
  800233:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800236:	ba 10 00 00 00       	mov    $0x10,%edx
  80023b:	48 89 ce             	mov    %rcx,%rsi
  80023e:	89 c7                	mov    %eax,%edi
  800240:	48 b8 55 30 80 00 00 	movabs $0x803055,%rax
  800247:	00 00 00 
  80024a:	ff d0                	callq  *%rax
  80024c:	85 c0                	test   %eax,%eax
  80024e:	79 16                	jns    800266 <umain+0x107>
  800250:	48 bf 60 48 80 00 00 	movabs $0x804860,%rdi
  800257:	00 00 00 
  80025a:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800261:	00 00 00 
  800264:	ff d0                	callq  *%rax
  800266:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800269:	be 05 00 00 00       	mov    $0x5,%esi
  80026e:	89 c7                	mov    %eax,%edi
  800270:	48 b8 78 31 80 00 00 	movabs $0x803178,%rax
  800277:	00 00 00 
  80027a:	ff d0                	callq  *%rax
  80027c:	85 c0                	test   %eax,%eax
  80027e:	79 16                	jns    800296 <umain+0x137>
  800280:	48 bf 88 48 80 00 00 	movabs $0x804888,%rdi
  800287:	00 00 00 
  80028a:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800291:	00 00 00 
  800294:	ff d0                	callq  *%rax
  800296:	48 bf aa 48 80 00 00 	movabs $0x8048aa,%rdi
  80029d:	00 00 00 
  8002a0:	b8 00 00 00 00       	mov    $0x0,%eax
  8002a5:	48 ba 03 05 80 00 00 	movabs $0x800503,%rdx
  8002ac:	00 00 00 
  8002af:	ff d2                	callq  *%rdx
  8002b1:	c7 45 ac 10 00 00 00 	movl   $0x10,-0x54(%rbp)
  8002b8:	48 8d 55 ac          	lea    -0x54(%rbp),%rdx
  8002bc:	48 8d 4d d0          	lea    -0x30(%rbp),%rcx
  8002c0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8002c3:	48 89 ce             	mov    %rcx,%rsi
  8002c6:	89 c7                	mov    %eax,%edi
  8002c8:	48 b8 e6 2f 80 00 00 	movabs $0x802fe6,%rax
  8002cf:	00 00 00 
  8002d2:	ff d0                	callq  *%rax
  8002d4:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8002d7:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8002db:	79 16                	jns    8002f3 <umain+0x194>
  8002dd:	48 bf b8 48 80 00 00 	movabs $0x8048b8,%rdi
  8002e4:	00 00 00 
  8002e7:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8002ee:	00 00 00 
  8002f1:	ff d0                	callq  *%rax
  8002f3:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  8002f6:	89 c7                	mov    %eax,%edi
  8002f8:	48 b8 bb 45 80 00 00 	movabs $0x8045bb,%rax
  8002ff:	00 00 00 
  800302:	ff d0                	callq  *%rax
  800304:	48 89 c6             	mov    %rax,%rsi
  800307:	48 bf db 48 80 00 00 	movabs $0x8048db,%rdi
  80030e:	00 00 00 
  800311:	b8 00 00 00 00       	mov    $0x0,%eax
  800316:	48 ba 03 05 80 00 00 	movabs $0x800503,%rdx
  80031d:	00 00 00 
  800320:	ff d2                	callq  *%rdx
  800322:	8b 45 f4             	mov    -0xc(%rbp),%eax
  800325:	89 c7                	mov    %eax,%edi
  800327:	48 b8 7f 00 80 00 00 	movabs $0x80007f,%rax
  80032e:	00 00 00 
  800331:	ff d0                	callq  *%rax
  800333:	e9 79 ff ff ff       	jmpq   8002b1 <umain+0x152>

0000000000800338 <libmain>:
  800338:	55                   	push   %rbp
  800339:	48 89 e5             	mov    %rsp,%rbp
  80033c:	48 83 ec 10          	sub    $0x10,%rsp
  800340:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800343:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800347:	48 b8 6b 19 80 00 00 	movabs $0x80196b,%rax
  80034e:	00 00 00 
  800351:	ff d0                	callq  *%rax
  800353:	25 ff 03 00 00       	and    $0x3ff,%eax
  800358:	48 98                	cltq   
  80035a:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  800361:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  800368:	00 00 00 
  80036b:	48 01 c2             	add    %rax,%rdx
  80036e:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  800375:	00 00 00 
  800378:	48 89 10             	mov    %rdx,(%rax)
  80037b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80037f:	7e 14                	jle    800395 <libmain+0x5d>
  800381:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800385:	48 8b 10             	mov    (%rax),%rdx
  800388:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  80038f:	00 00 00 
  800392:	48 89 10             	mov    %rdx,(%rax)
  800395:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800399:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80039c:	48 89 d6             	mov    %rdx,%rsi
  80039f:	89 c7                	mov    %eax,%edi
  8003a1:	48 b8 5f 01 80 00 00 	movabs $0x80015f,%rax
  8003a8:	00 00 00 
  8003ab:	ff d0                	callq  *%rax
  8003ad:	48 b8 bb 03 80 00 00 	movabs $0x8003bb,%rax
  8003b4:	00 00 00 
  8003b7:	ff d0                	callq  *%rax
  8003b9:	c9                   	leaveq 
  8003ba:	c3                   	retq   

00000000008003bb <exit>:
  8003bb:	55                   	push   %rbp
  8003bc:	48 89 e5             	mov    %rsp,%rbp
  8003bf:	48 b8 06 22 80 00 00 	movabs $0x802206,%rax
  8003c6:	00 00 00 
  8003c9:	ff d0                	callq  *%rax
  8003cb:	bf 00 00 00 00       	mov    $0x0,%edi
  8003d0:	48 b8 27 19 80 00 00 	movabs $0x801927,%rax
  8003d7:	00 00 00 
  8003da:	ff d0                	callq  *%rax
  8003dc:	5d                   	pop    %rbp
  8003dd:	c3                   	retq   

00000000008003de <putch>:
  8003de:	55                   	push   %rbp
  8003df:	48 89 e5             	mov    %rsp,%rbp
  8003e2:	48 83 ec 10          	sub    $0x10,%rsp
  8003e6:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8003e9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8003ed:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8003f1:	8b 00                	mov    (%rax),%eax
  8003f3:	8d 48 01             	lea    0x1(%rax),%ecx
  8003f6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8003fa:	89 0a                	mov    %ecx,(%rdx)
  8003fc:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8003ff:	89 d1                	mov    %edx,%ecx
  800401:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800405:	48 98                	cltq   
  800407:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  80040b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80040f:	8b 00                	mov    (%rax),%eax
  800411:	3d ff 00 00 00       	cmp    $0xff,%eax
  800416:	75 2c                	jne    800444 <putch+0x66>
  800418:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80041c:	8b 00                	mov    (%rax),%eax
  80041e:	48 98                	cltq   
  800420:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800424:	48 83 c2 08          	add    $0x8,%rdx
  800428:	48 89 c6             	mov    %rax,%rsi
  80042b:	48 89 d7             	mov    %rdx,%rdi
  80042e:	48 b8 9f 18 80 00 00 	movabs $0x80189f,%rax
  800435:	00 00 00 
  800438:	ff d0                	callq  *%rax
  80043a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80043e:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  800444:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800448:	8b 40 04             	mov    0x4(%rax),%eax
  80044b:	8d 50 01             	lea    0x1(%rax),%edx
  80044e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800452:	89 50 04             	mov    %edx,0x4(%rax)
  800455:	c9                   	leaveq 
  800456:	c3                   	retq   

0000000000800457 <vcprintf>:
  800457:	55                   	push   %rbp
  800458:	48 89 e5             	mov    %rsp,%rbp
  80045b:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  800462:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  800469:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  800470:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  800477:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  80047e:	48 8b 0a             	mov    (%rdx),%rcx
  800481:	48 89 08             	mov    %rcx,(%rax)
  800484:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800488:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80048c:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800490:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800494:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  80049b:	00 00 00 
  80049e:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  8004a5:	00 00 00 
  8004a8:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  8004af:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  8004b6:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  8004bd:	48 89 c6             	mov    %rax,%rsi
  8004c0:	48 bf de 03 80 00 00 	movabs $0x8003de,%rdi
  8004c7:	00 00 00 
  8004ca:	48 b8 b6 08 80 00 00 	movabs $0x8008b6,%rax
  8004d1:	00 00 00 
  8004d4:	ff d0                	callq  *%rax
  8004d6:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  8004dc:	48 98                	cltq   
  8004de:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  8004e5:	48 83 c2 08          	add    $0x8,%rdx
  8004e9:	48 89 c6             	mov    %rax,%rsi
  8004ec:	48 89 d7             	mov    %rdx,%rdi
  8004ef:	48 b8 9f 18 80 00 00 	movabs $0x80189f,%rax
  8004f6:	00 00 00 
  8004f9:	ff d0                	callq  *%rax
  8004fb:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  800501:	c9                   	leaveq 
  800502:	c3                   	retq   

0000000000800503 <cprintf>:
  800503:	55                   	push   %rbp
  800504:	48 89 e5             	mov    %rsp,%rbp
  800507:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  80050e:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  800515:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  80051c:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800523:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  80052a:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800531:	84 c0                	test   %al,%al
  800533:	74 20                	je     800555 <cprintf+0x52>
  800535:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800539:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80053d:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800541:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800545:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800549:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  80054d:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800551:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800555:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  80055c:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  800563:	00 00 00 
  800566:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  80056d:	00 00 00 
  800570:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800574:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  80057b:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800582:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800589:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800590:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800597:	48 8b 0a             	mov    (%rdx),%rcx
  80059a:	48 89 08             	mov    %rcx,(%rax)
  80059d:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8005a1:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8005a5:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8005a9:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8005ad:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  8005b4:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8005bb:	48 89 d6             	mov    %rdx,%rsi
  8005be:	48 89 c7             	mov    %rax,%rdi
  8005c1:	48 b8 57 04 80 00 00 	movabs $0x800457,%rax
  8005c8:	00 00 00 
  8005cb:	ff d0                	callq  *%rax
  8005cd:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  8005d3:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  8005d9:	c9                   	leaveq 
  8005da:	c3                   	retq   

00000000008005db <printnum>:
  8005db:	55                   	push   %rbp
  8005dc:	48 89 e5             	mov    %rsp,%rbp
  8005df:	53                   	push   %rbx
  8005e0:	48 83 ec 38          	sub    $0x38,%rsp
  8005e4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8005e8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8005ec:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8005f0:	89 4d d4             	mov    %ecx,-0x2c(%rbp)
  8005f3:	44 89 45 d0          	mov    %r8d,-0x30(%rbp)
  8005f7:	44 89 4d cc          	mov    %r9d,-0x34(%rbp)
  8005fb:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  8005fe:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  800602:	77 3b                	ja     80063f <printnum+0x64>
  800604:	8b 45 d0             	mov    -0x30(%rbp),%eax
  800607:	44 8d 40 ff          	lea    -0x1(%rax),%r8d
  80060b:	8b 5d d4             	mov    -0x2c(%rbp),%ebx
  80060e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800612:	ba 00 00 00 00       	mov    $0x0,%edx
  800617:	48 f7 f3             	div    %rbx
  80061a:	48 89 c2             	mov    %rax,%rdx
  80061d:	8b 7d cc             	mov    -0x34(%rbp),%edi
  800620:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  800623:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
  800627:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80062b:	41 89 f9             	mov    %edi,%r9d
  80062e:	48 89 c7             	mov    %rax,%rdi
  800631:	48 b8 db 05 80 00 00 	movabs $0x8005db,%rax
  800638:	00 00 00 
  80063b:	ff d0                	callq  *%rax
  80063d:	eb 1e                	jmp    80065d <printnum+0x82>
  80063f:	eb 12                	jmp    800653 <printnum+0x78>
  800641:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  800645:	8b 55 cc             	mov    -0x34(%rbp),%edx
  800648:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80064c:	48 89 ce             	mov    %rcx,%rsi
  80064f:	89 d7                	mov    %edx,%edi
  800651:	ff d0                	callq  *%rax
  800653:	83 6d d0 01          	subl   $0x1,-0x30(%rbp)
  800657:	83 7d d0 00          	cmpl   $0x0,-0x30(%rbp)
  80065b:	7f e4                	jg     800641 <printnum+0x66>
  80065d:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  800660:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800664:	ba 00 00 00 00       	mov    $0x0,%edx
  800669:	48 f7 f1             	div    %rcx
  80066c:	48 89 d0             	mov    %rdx,%rax
  80066f:	48 ba f0 4a 80 00 00 	movabs $0x804af0,%rdx
  800676:	00 00 00 
  800679:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
  80067d:	0f be d0             	movsbl %al,%edx
  800680:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  800684:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800688:	48 89 ce             	mov    %rcx,%rsi
  80068b:	89 d7                	mov    %edx,%edi
  80068d:	ff d0                	callq  *%rax
  80068f:	48 83 c4 38          	add    $0x38,%rsp
  800693:	5b                   	pop    %rbx
  800694:	5d                   	pop    %rbp
  800695:	c3                   	retq   

0000000000800696 <getuint>:
  800696:	55                   	push   %rbp
  800697:	48 89 e5             	mov    %rsp,%rbp
  80069a:	48 83 ec 1c          	sub    $0x1c,%rsp
  80069e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8006a2:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8006a5:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8006a9:	7e 52                	jle    8006fd <getuint+0x67>
  8006ab:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006af:	8b 00                	mov    (%rax),%eax
  8006b1:	83 f8 30             	cmp    $0x30,%eax
  8006b4:	73 24                	jae    8006da <getuint+0x44>
  8006b6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006ba:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8006be:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006c2:	8b 00                	mov    (%rax),%eax
  8006c4:	89 c0                	mov    %eax,%eax
  8006c6:	48 01 d0             	add    %rdx,%rax
  8006c9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006cd:	8b 12                	mov    (%rdx),%edx
  8006cf:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8006d2:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006d6:	89 0a                	mov    %ecx,(%rdx)
  8006d8:	eb 17                	jmp    8006f1 <getuint+0x5b>
  8006da:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006de:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8006e2:	48 89 d0             	mov    %rdx,%rax
  8006e5:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8006e9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006ed:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8006f1:	48 8b 00             	mov    (%rax),%rax
  8006f4:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8006f8:	e9 a3 00 00 00       	jmpq   8007a0 <getuint+0x10a>
  8006fd:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800701:	74 4f                	je     800752 <getuint+0xbc>
  800703:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800707:	8b 00                	mov    (%rax),%eax
  800709:	83 f8 30             	cmp    $0x30,%eax
  80070c:	73 24                	jae    800732 <getuint+0x9c>
  80070e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800712:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800716:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80071a:	8b 00                	mov    (%rax),%eax
  80071c:	89 c0                	mov    %eax,%eax
  80071e:	48 01 d0             	add    %rdx,%rax
  800721:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800725:	8b 12                	mov    (%rdx),%edx
  800727:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80072a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80072e:	89 0a                	mov    %ecx,(%rdx)
  800730:	eb 17                	jmp    800749 <getuint+0xb3>
  800732:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800736:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80073a:	48 89 d0             	mov    %rdx,%rax
  80073d:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800741:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800745:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800749:	48 8b 00             	mov    (%rax),%rax
  80074c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800750:	eb 4e                	jmp    8007a0 <getuint+0x10a>
  800752:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800756:	8b 00                	mov    (%rax),%eax
  800758:	83 f8 30             	cmp    $0x30,%eax
  80075b:	73 24                	jae    800781 <getuint+0xeb>
  80075d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800761:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800765:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800769:	8b 00                	mov    (%rax),%eax
  80076b:	89 c0                	mov    %eax,%eax
  80076d:	48 01 d0             	add    %rdx,%rax
  800770:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800774:	8b 12                	mov    (%rdx),%edx
  800776:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800779:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80077d:	89 0a                	mov    %ecx,(%rdx)
  80077f:	eb 17                	jmp    800798 <getuint+0x102>
  800781:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800785:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800789:	48 89 d0             	mov    %rdx,%rax
  80078c:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800790:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800794:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800798:	8b 00                	mov    (%rax),%eax
  80079a:	89 c0                	mov    %eax,%eax
  80079c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8007a0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8007a4:	c9                   	leaveq 
  8007a5:	c3                   	retq   

00000000008007a6 <getint>:
  8007a6:	55                   	push   %rbp
  8007a7:	48 89 e5             	mov    %rsp,%rbp
  8007aa:	48 83 ec 1c          	sub    $0x1c,%rsp
  8007ae:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8007b2:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8007b5:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8007b9:	7e 52                	jle    80080d <getint+0x67>
  8007bb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007bf:	8b 00                	mov    (%rax),%eax
  8007c1:	83 f8 30             	cmp    $0x30,%eax
  8007c4:	73 24                	jae    8007ea <getint+0x44>
  8007c6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007ca:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8007ce:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007d2:	8b 00                	mov    (%rax),%eax
  8007d4:	89 c0                	mov    %eax,%eax
  8007d6:	48 01 d0             	add    %rdx,%rax
  8007d9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007dd:	8b 12                	mov    (%rdx),%edx
  8007df:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8007e2:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007e6:	89 0a                	mov    %ecx,(%rdx)
  8007e8:	eb 17                	jmp    800801 <getint+0x5b>
  8007ea:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007ee:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8007f2:	48 89 d0             	mov    %rdx,%rax
  8007f5:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8007f9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007fd:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800801:	48 8b 00             	mov    (%rax),%rax
  800804:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800808:	e9 a3 00 00 00       	jmpq   8008b0 <getint+0x10a>
  80080d:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800811:	74 4f                	je     800862 <getint+0xbc>
  800813:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800817:	8b 00                	mov    (%rax),%eax
  800819:	83 f8 30             	cmp    $0x30,%eax
  80081c:	73 24                	jae    800842 <getint+0x9c>
  80081e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800822:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800826:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80082a:	8b 00                	mov    (%rax),%eax
  80082c:	89 c0                	mov    %eax,%eax
  80082e:	48 01 d0             	add    %rdx,%rax
  800831:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800835:	8b 12                	mov    (%rdx),%edx
  800837:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80083a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80083e:	89 0a                	mov    %ecx,(%rdx)
  800840:	eb 17                	jmp    800859 <getint+0xb3>
  800842:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800846:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80084a:	48 89 d0             	mov    %rdx,%rax
  80084d:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800851:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800855:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800859:	48 8b 00             	mov    (%rax),%rax
  80085c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800860:	eb 4e                	jmp    8008b0 <getint+0x10a>
  800862:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800866:	8b 00                	mov    (%rax),%eax
  800868:	83 f8 30             	cmp    $0x30,%eax
  80086b:	73 24                	jae    800891 <getint+0xeb>
  80086d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800871:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800875:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800879:	8b 00                	mov    (%rax),%eax
  80087b:	89 c0                	mov    %eax,%eax
  80087d:	48 01 d0             	add    %rdx,%rax
  800880:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800884:	8b 12                	mov    (%rdx),%edx
  800886:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800889:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80088d:	89 0a                	mov    %ecx,(%rdx)
  80088f:	eb 17                	jmp    8008a8 <getint+0x102>
  800891:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800895:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800899:	48 89 d0             	mov    %rdx,%rax
  80089c:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8008a0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008a4:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8008a8:	8b 00                	mov    (%rax),%eax
  8008aa:	48 98                	cltq   
  8008ac:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8008b0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8008b4:	c9                   	leaveq 
  8008b5:	c3                   	retq   

00000000008008b6 <vprintfmt>:
  8008b6:	55                   	push   %rbp
  8008b7:	48 89 e5             	mov    %rsp,%rbp
  8008ba:	41 54                	push   %r12
  8008bc:	53                   	push   %rbx
  8008bd:	48 83 ec 60          	sub    $0x60,%rsp
  8008c1:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  8008c5:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  8008c9:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8008cd:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  8008d1:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8008d5:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  8008d9:	48 8b 0a             	mov    (%rdx),%rcx
  8008dc:	48 89 08             	mov    %rcx,(%rax)
  8008df:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8008e3:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8008e7:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8008eb:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8008ef:	eb 17                	jmp    800908 <vprintfmt+0x52>
  8008f1:	85 db                	test   %ebx,%ebx
  8008f3:	0f 84 cc 04 00 00    	je     800dc5 <vprintfmt+0x50f>
  8008f9:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8008fd:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800901:	48 89 d6             	mov    %rdx,%rsi
  800904:	89 df                	mov    %ebx,%edi
  800906:	ff d0                	callq  *%rax
  800908:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  80090c:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800910:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800914:	0f b6 00             	movzbl (%rax),%eax
  800917:	0f b6 d8             	movzbl %al,%ebx
  80091a:	83 fb 25             	cmp    $0x25,%ebx
  80091d:	75 d2                	jne    8008f1 <vprintfmt+0x3b>
  80091f:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  800923:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  80092a:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800931:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800938:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  80093f:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800943:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800947:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  80094b:	0f b6 00             	movzbl (%rax),%eax
  80094e:	0f b6 d8             	movzbl %al,%ebx
  800951:	8d 43 dd             	lea    -0x23(%rbx),%eax
  800954:	83 f8 55             	cmp    $0x55,%eax
  800957:	0f 87 34 04 00 00    	ja     800d91 <vprintfmt+0x4db>
  80095d:	89 c0                	mov    %eax,%eax
  80095f:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800966:	00 
  800967:	48 b8 18 4b 80 00 00 	movabs $0x804b18,%rax
  80096e:	00 00 00 
  800971:	48 01 d0             	add    %rdx,%rax
  800974:	48 8b 00             	mov    (%rax),%rax
  800977:	ff e0                	jmpq   *%rax
  800979:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  80097d:	eb c0                	jmp    80093f <vprintfmt+0x89>
  80097f:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  800983:	eb ba                	jmp    80093f <vprintfmt+0x89>
  800985:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  80098c:	8b 55 d8             	mov    -0x28(%rbp),%edx
  80098f:	89 d0                	mov    %edx,%eax
  800991:	c1 e0 02             	shl    $0x2,%eax
  800994:	01 d0                	add    %edx,%eax
  800996:	01 c0                	add    %eax,%eax
  800998:	01 d8                	add    %ebx,%eax
  80099a:	83 e8 30             	sub    $0x30,%eax
  80099d:	89 45 d8             	mov    %eax,-0x28(%rbp)
  8009a0:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8009a4:	0f b6 00             	movzbl (%rax),%eax
  8009a7:	0f be d8             	movsbl %al,%ebx
  8009aa:	83 fb 2f             	cmp    $0x2f,%ebx
  8009ad:	7e 0c                	jle    8009bb <vprintfmt+0x105>
  8009af:	83 fb 39             	cmp    $0x39,%ebx
  8009b2:	7f 07                	jg     8009bb <vprintfmt+0x105>
  8009b4:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  8009b9:	eb d1                	jmp    80098c <vprintfmt+0xd6>
  8009bb:	eb 58                	jmp    800a15 <vprintfmt+0x15f>
  8009bd:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8009c0:	83 f8 30             	cmp    $0x30,%eax
  8009c3:	73 17                	jae    8009dc <vprintfmt+0x126>
  8009c5:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8009c9:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8009cc:	89 c0                	mov    %eax,%eax
  8009ce:	48 01 d0             	add    %rdx,%rax
  8009d1:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8009d4:	83 c2 08             	add    $0x8,%edx
  8009d7:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8009da:	eb 0f                	jmp    8009eb <vprintfmt+0x135>
  8009dc:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  8009e0:	48 89 d0             	mov    %rdx,%rax
  8009e3:	48 83 c2 08          	add    $0x8,%rdx
  8009e7:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8009eb:	8b 00                	mov    (%rax),%eax
  8009ed:	89 45 d8             	mov    %eax,-0x28(%rbp)
  8009f0:	eb 23                	jmp    800a15 <vprintfmt+0x15f>
  8009f2:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8009f6:	79 0c                	jns    800a04 <vprintfmt+0x14e>
  8009f8:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  8009ff:	e9 3b ff ff ff       	jmpq   80093f <vprintfmt+0x89>
  800a04:	e9 36 ff ff ff       	jmpq   80093f <vprintfmt+0x89>
  800a09:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  800a10:	e9 2a ff ff ff       	jmpq   80093f <vprintfmt+0x89>
  800a15:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800a19:	79 12                	jns    800a2d <vprintfmt+0x177>
  800a1b:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800a1e:	89 45 dc             	mov    %eax,-0x24(%rbp)
  800a21:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800a28:	e9 12 ff ff ff       	jmpq   80093f <vprintfmt+0x89>
  800a2d:	e9 0d ff ff ff       	jmpq   80093f <vprintfmt+0x89>
  800a32:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  800a36:	e9 04 ff ff ff       	jmpq   80093f <vprintfmt+0x89>
  800a3b:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800a3e:	83 f8 30             	cmp    $0x30,%eax
  800a41:	73 17                	jae    800a5a <vprintfmt+0x1a4>
  800a43:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800a47:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800a4a:	89 c0                	mov    %eax,%eax
  800a4c:	48 01 d0             	add    %rdx,%rax
  800a4f:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800a52:	83 c2 08             	add    $0x8,%edx
  800a55:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800a58:	eb 0f                	jmp    800a69 <vprintfmt+0x1b3>
  800a5a:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800a5e:	48 89 d0             	mov    %rdx,%rax
  800a61:	48 83 c2 08          	add    $0x8,%rdx
  800a65:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800a69:	8b 10                	mov    (%rax),%edx
  800a6b:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800a6f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a73:	48 89 ce             	mov    %rcx,%rsi
  800a76:	89 d7                	mov    %edx,%edi
  800a78:	ff d0                	callq  *%rax
  800a7a:	e9 40 03 00 00       	jmpq   800dbf <vprintfmt+0x509>
  800a7f:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800a82:	83 f8 30             	cmp    $0x30,%eax
  800a85:	73 17                	jae    800a9e <vprintfmt+0x1e8>
  800a87:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800a8b:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800a8e:	89 c0                	mov    %eax,%eax
  800a90:	48 01 d0             	add    %rdx,%rax
  800a93:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800a96:	83 c2 08             	add    $0x8,%edx
  800a99:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800a9c:	eb 0f                	jmp    800aad <vprintfmt+0x1f7>
  800a9e:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800aa2:	48 89 d0             	mov    %rdx,%rax
  800aa5:	48 83 c2 08          	add    $0x8,%rdx
  800aa9:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800aad:	8b 18                	mov    (%rax),%ebx
  800aaf:	85 db                	test   %ebx,%ebx
  800ab1:	79 02                	jns    800ab5 <vprintfmt+0x1ff>
  800ab3:	f7 db                	neg    %ebx
  800ab5:	83 fb 15             	cmp    $0x15,%ebx
  800ab8:	7f 16                	jg     800ad0 <vprintfmt+0x21a>
  800aba:	48 b8 40 4a 80 00 00 	movabs $0x804a40,%rax
  800ac1:	00 00 00 
  800ac4:	48 63 d3             	movslq %ebx,%rdx
  800ac7:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800acb:	4d 85 e4             	test   %r12,%r12
  800ace:	75 2e                	jne    800afe <vprintfmt+0x248>
  800ad0:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800ad4:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ad8:	89 d9                	mov    %ebx,%ecx
  800ada:	48 ba 01 4b 80 00 00 	movabs $0x804b01,%rdx
  800ae1:	00 00 00 
  800ae4:	48 89 c7             	mov    %rax,%rdi
  800ae7:	b8 00 00 00 00       	mov    $0x0,%eax
  800aec:	49 b8 ce 0d 80 00 00 	movabs $0x800dce,%r8
  800af3:	00 00 00 
  800af6:	41 ff d0             	callq  *%r8
  800af9:	e9 c1 02 00 00       	jmpq   800dbf <vprintfmt+0x509>
  800afe:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800b02:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b06:	4c 89 e1             	mov    %r12,%rcx
  800b09:	48 ba 0a 4b 80 00 00 	movabs $0x804b0a,%rdx
  800b10:	00 00 00 
  800b13:	48 89 c7             	mov    %rax,%rdi
  800b16:	b8 00 00 00 00       	mov    $0x0,%eax
  800b1b:	49 b8 ce 0d 80 00 00 	movabs $0x800dce,%r8
  800b22:	00 00 00 
  800b25:	41 ff d0             	callq  *%r8
  800b28:	e9 92 02 00 00       	jmpq   800dbf <vprintfmt+0x509>
  800b2d:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b30:	83 f8 30             	cmp    $0x30,%eax
  800b33:	73 17                	jae    800b4c <vprintfmt+0x296>
  800b35:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800b39:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b3c:	89 c0                	mov    %eax,%eax
  800b3e:	48 01 d0             	add    %rdx,%rax
  800b41:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b44:	83 c2 08             	add    $0x8,%edx
  800b47:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800b4a:	eb 0f                	jmp    800b5b <vprintfmt+0x2a5>
  800b4c:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800b50:	48 89 d0             	mov    %rdx,%rax
  800b53:	48 83 c2 08          	add    $0x8,%rdx
  800b57:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800b5b:	4c 8b 20             	mov    (%rax),%r12
  800b5e:	4d 85 e4             	test   %r12,%r12
  800b61:	75 0a                	jne    800b6d <vprintfmt+0x2b7>
  800b63:	49 bc 0d 4b 80 00 00 	movabs $0x804b0d,%r12
  800b6a:	00 00 00 
  800b6d:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800b71:	7e 3f                	jle    800bb2 <vprintfmt+0x2fc>
  800b73:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  800b77:	74 39                	je     800bb2 <vprintfmt+0x2fc>
  800b79:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800b7c:	48 98                	cltq   
  800b7e:	48 89 c6             	mov    %rax,%rsi
  800b81:	4c 89 e7             	mov    %r12,%rdi
  800b84:	48 b8 7a 10 80 00 00 	movabs $0x80107a,%rax
  800b8b:	00 00 00 
  800b8e:	ff d0                	callq  *%rax
  800b90:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800b93:	eb 17                	jmp    800bac <vprintfmt+0x2f6>
  800b95:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800b99:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800b9d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ba1:	48 89 ce             	mov    %rcx,%rsi
  800ba4:	89 d7                	mov    %edx,%edi
  800ba6:	ff d0                	callq  *%rax
  800ba8:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800bac:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800bb0:	7f e3                	jg     800b95 <vprintfmt+0x2df>
  800bb2:	eb 37                	jmp    800beb <vprintfmt+0x335>
  800bb4:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  800bb8:	74 1e                	je     800bd8 <vprintfmt+0x322>
  800bba:	83 fb 1f             	cmp    $0x1f,%ebx
  800bbd:	7e 05                	jle    800bc4 <vprintfmt+0x30e>
  800bbf:	83 fb 7e             	cmp    $0x7e,%ebx
  800bc2:	7e 14                	jle    800bd8 <vprintfmt+0x322>
  800bc4:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800bc8:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800bcc:	48 89 d6             	mov    %rdx,%rsi
  800bcf:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800bd4:	ff d0                	callq  *%rax
  800bd6:	eb 0f                	jmp    800be7 <vprintfmt+0x331>
  800bd8:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800bdc:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800be0:	48 89 d6             	mov    %rdx,%rsi
  800be3:	89 df                	mov    %ebx,%edi
  800be5:	ff d0                	callq  *%rax
  800be7:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800beb:	4c 89 e0             	mov    %r12,%rax
  800bee:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800bf2:	0f b6 00             	movzbl (%rax),%eax
  800bf5:	0f be d8             	movsbl %al,%ebx
  800bf8:	85 db                	test   %ebx,%ebx
  800bfa:	74 10                	je     800c0c <vprintfmt+0x356>
  800bfc:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800c00:	78 b2                	js     800bb4 <vprintfmt+0x2fe>
  800c02:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800c06:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800c0a:	79 a8                	jns    800bb4 <vprintfmt+0x2fe>
  800c0c:	eb 16                	jmp    800c24 <vprintfmt+0x36e>
  800c0e:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c12:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c16:	48 89 d6             	mov    %rdx,%rsi
  800c19:	bf 20 00 00 00       	mov    $0x20,%edi
  800c1e:	ff d0                	callq  *%rax
  800c20:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800c24:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800c28:	7f e4                	jg     800c0e <vprintfmt+0x358>
  800c2a:	e9 90 01 00 00       	jmpq   800dbf <vprintfmt+0x509>
  800c2f:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800c33:	be 03 00 00 00       	mov    $0x3,%esi
  800c38:	48 89 c7             	mov    %rax,%rdi
  800c3b:	48 b8 a6 07 80 00 00 	movabs $0x8007a6,%rax
  800c42:	00 00 00 
  800c45:	ff d0                	callq  *%rax
  800c47:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800c4b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c4f:	48 85 c0             	test   %rax,%rax
  800c52:	79 1d                	jns    800c71 <vprintfmt+0x3bb>
  800c54:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c58:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c5c:	48 89 d6             	mov    %rdx,%rsi
  800c5f:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800c64:	ff d0                	callq  *%rax
  800c66:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c6a:	48 f7 d8             	neg    %rax
  800c6d:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800c71:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800c78:	e9 d5 00 00 00       	jmpq   800d52 <vprintfmt+0x49c>
  800c7d:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800c81:	be 03 00 00 00       	mov    $0x3,%esi
  800c86:	48 89 c7             	mov    %rax,%rdi
  800c89:	48 b8 96 06 80 00 00 	movabs $0x800696,%rax
  800c90:	00 00 00 
  800c93:	ff d0                	callq  *%rax
  800c95:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800c99:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800ca0:	e9 ad 00 00 00       	jmpq   800d52 <vprintfmt+0x49c>
  800ca5:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800ca9:	be 03 00 00 00       	mov    $0x3,%esi
  800cae:	48 89 c7             	mov    %rax,%rdi
  800cb1:	48 b8 96 06 80 00 00 	movabs $0x800696,%rax
  800cb8:	00 00 00 
  800cbb:	ff d0                	callq  *%rax
  800cbd:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800cc1:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800cc8:	e9 85 00 00 00       	jmpq   800d52 <vprintfmt+0x49c>
  800ccd:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800cd1:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800cd5:	48 89 d6             	mov    %rdx,%rsi
  800cd8:	bf 30 00 00 00       	mov    $0x30,%edi
  800cdd:	ff d0                	callq  *%rax
  800cdf:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800ce3:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ce7:	48 89 d6             	mov    %rdx,%rsi
  800cea:	bf 78 00 00 00       	mov    $0x78,%edi
  800cef:	ff d0                	callq  *%rax
  800cf1:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800cf4:	83 f8 30             	cmp    $0x30,%eax
  800cf7:	73 17                	jae    800d10 <vprintfmt+0x45a>
  800cf9:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800cfd:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800d00:	89 c0                	mov    %eax,%eax
  800d02:	48 01 d0             	add    %rdx,%rax
  800d05:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800d08:	83 c2 08             	add    $0x8,%edx
  800d0b:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800d0e:	eb 0f                	jmp    800d1f <vprintfmt+0x469>
  800d10:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800d14:	48 89 d0             	mov    %rdx,%rax
  800d17:	48 83 c2 08          	add    $0x8,%rdx
  800d1b:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800d1f:	48 8b 00             	mov    (%rax),%rax
  800d22:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800d26:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800d2d:	eb 23                	jmp    800d52 <vprintfmt+0x49c>
  800d2f:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800d33:	be 03 00 00 00       	mov    $0x3,%esi
  800d38:	48 89 c7             	mov    %rax,%rdi
  800d3b:	48 b8 96 06 80 00 00 	movabs $0x800696,%rax
  800d42:	00 00 00 
  800d45:	ff d0                	callq  *%rax
  800d47:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800d4b:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800d52:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  800d57:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800d5a:	8b 7d dc             	mov    -0x24(%rbp),%edi
  800d5d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800d61:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800d65:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d69:	45 89 c1             	mov    %r8d,%r9d
  800d6c:	41 89 f8             	mov    %edi,%r8d
  800d6f:	48 89 c7             	mov    %rax,%rdi
  800d72:	48 b8 db 05 80 00 00 	movabs $0x8005db,%rax
  800d79:	00 00 00 
  800d7c:	ff d0                	callq  *%rax
  800d7e:	eb 3f                	jmp    800dbf <vprintfmt+0x509>
  800d80:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d84:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d88:	48 89 d6             	mov    %rdx,%rsi
  800d8b:	89 df                	mov    %ebx,%edi
  800d8d:	ff d0                	callq  *%rax
  800d8f:	eb 2e                	jmp    800dbf <vprintfmt+0x509>
  800d91:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d95:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d99:	48 89 d6             	mov    %rdx,%rsi
  800d9c:	bf 25 00 00 00       	mov    $0x25,%edi
  800da1:	ff d0                	callq  *%rax
  800da3:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800da8:	eb 05                	jmp    800daf <vprintfmt+0x4f9>
  800daa:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800daf:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800db3:	48 83 e8 01          	sub    $0x1,%rax
  800db7:	0f b6 00             	movzbl (%rax),%eax
  800dba:	3c 25                	cmp    $0x25,%al
  800dbc:	75 ec                	jne    800daa <vprintfmt+0x4f4>
  800dbe:	90                   	nop
  800dbf:	90                   	nop
  800dc0:	e9 43 fb ff ff       	jmpq   800908 <vprintfmt+0x52>
  800dc5:	48 83 c4 60          	add    $0x60,%rsp
  800dc9:	5b                   	pop    %rbx
  800dca:	41 5c                	pop    %r12
  800dcc:	5d                   	pop    %rbp
  800dcd:	c3                   	retq   

0000000000800dce <printfmt>:
  800dce:	55                   	push   %rbp
  800dcf:	48 89 e5             	mov    %rsp,%rbp
  800dd2:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  800dd9:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  800de0:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  800de7:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800dee:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800df5:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800dfc:	84 c0                	test   %al,%al
  800dfe:	74 20                	je     800e20 <printfmt+0x52>
  800e00:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800e04:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800e08:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800e0c:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800e10:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800e14:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800e18:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800e1c:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800e20:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  800e27:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  800e2e:	00 00 00 
  800e31:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  800e38:	00 00 00 
  800e3b:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800e3f:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800e46:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800e4d:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  800e54:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  800e5b:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800e62:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  800e69:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  800e70:	48 89 c7             	mov    %rax,%rdi
  800e73:	48 b8 b6 08 80 00 00 	movabs $0x8008b6,%rax
  800e7a:	00 00 00 
  800e7d:	ff d0                	callq  *%rax
  800e7f:	c9                   	leaveq 
  800e80:	c3                   	retq   

0000000000800e81 <sprintputch>:
  800e81:	55                   	push   %rbp
  800e82:	48 89 e5             	mov    %rsp,%rbp
  800e85:	48 83 ec 10          	sub    $0x10,%rsp
  800e89:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800e8c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800e90:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e94:	8b 40 10             	mov    0x10(%rax),%eax
  800e97:	8d 50 01             	lea    0x1(%rax),%edx
  800e9a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e9e:	89 50 10             	mov    %edx,0x10(%rax)
  800ea1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800ea5:	48 8b 10             	mov    (%rax),%rdx
  800ea8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800eac:	48 8b 40 08          	mov    0x8(%rax),%rax
  800eb0:	48 39 c2             	cmp    %rax,%rdx
  800eb3:	73 17                	jae    800ecc <sprintputch+0x4b>
  800eb5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800eb9:	48 8b 00             	mov    (%rax),%rax
  800ebc:	48 8d 48 01          	lea    0x1(%rax),%rcx
  800ec0:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800ec4:	48 89 0a             	mov    %rcx,(%rdx)
  800ec7:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800eca:	88 10                	mov    %dl,(%rax)
  800ecc:	c9                   	leaveq 
  800ecd:	c3                   	retq   

0000000000800ece <vsnprintf>:
  800ece:	55                   	push   %rbp
  800ecf:	48 89 e5             	mov    %rsp,%rbp
  800ed2:	48 83 ec 50          	sub    $0x50,%rsp
  800ed6:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  800eda:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  800edd:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  800ee1:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  800ee5:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  800ee9:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  800eed:	48 8b 0a             	mov    (%rdx),%rcx
  800ef0:	48 89 08             	mov    %rcx,(%rax)
  800ef3:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800ef7:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800efb:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800eff:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800f03:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800f07:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  800f0b:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  800f0e:	48 98                	cltq   
  800f10:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  800f14:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800f18:	48 01 d0             	add    %rdx,%rax
  800f1b:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  800f1f:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800f26:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  800f2b:	74 06                	je     800f33 <vsnprintf+0x65>
  800f2d:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  800f31:	7f 07                	jg     800f3a <vsnprintf+0x6c>
  800f33:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800f38:	eb 2f                	jmp    800f69 <vsnprintf+0x9b>
  800f3a:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  800f3e:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  800f42:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  800f46:	48 89 c6             	mov    %rax,%rsi
  800f49:	48 bf 81 0e 80 00 00 	movabs $0x800e81,%rdi
  800f50:	00 00 00 
  800f53:	48 b8 b6 08 80 00 00 	movabs $0x8008b6,%rax
  800f5a:	00 00 00 
  800f5d:	ff d0                	callq  *%rax
  800f5f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800f63:	c6 00 00             	movb   $0x0,(%rax)
  800f66:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800f69:	c9                   	leaveq 
  800f6a:	c3                   	retq   

0000000000800f6b <snprintf>:
  800f6b:	55                   	push   %rbp
  800f6c:	48 89 e5             	mov    %rsp,%rbp
  800f6f:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  800f76:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800f7d:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  800f83:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800f8a:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800f91:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800f98:	84 c0                	test   %al,%al
  800f9a:	74 20                	je     800fbc <snprintf+0x51>
  800f9c:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800fa0:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800fa4:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800fa8:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800fac:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800fb0:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800fb4:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800fb8:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800fbc:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  800fc3:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  800fca:	00 00 00 
  800fcd:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800fd4:	00 00 00 
  800fd7:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800fdb:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800fe2:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800fe9:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800ff0:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800ff7:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800ffe:	48 8b 0a             	mov    (%rdx),%rcx
  801001:	48 89 08             	mov    %rcx,(%rax)
  801004:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  801008:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80100c:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801010:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801014:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  80101b:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  801022:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  801028:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  80102f:	48 89 c7             	mov    %rax,%rdi
  801032:	48 b8 ce 0e 80 00 00 	movabs $0x800ece,%rax
  801039:	00 00 00 
  80103c:	ff d0                	callq  *%rax
  80103e:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  801044:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  80104a:	c9                   	leaveq 
  80104b:	c3                   	retq   

000000000080104c <strlen>:
  80104c:	55                   	push   %rbp
  80104d:	48 89 e5             	mov    %rsp,%rbp
  801050:	48 83 ec 18          	sub    $0x18,%rsp
  801054:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801058:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80105f:	eb 09                	jmp    80106a <strlen+0x1e>
  801061:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801065:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80106a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80106e:	0f b6 00             	movzbl (%rax),%eax
  801071:	84 c0                	test   %al,%al
  801073:	75 ec                	jne    801061 <strlen+0x15>
  801075:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801078:	c9                   	leaveq 
  801079:	c3                   	retq   

000000000080107a <strnlen>:
  80107a:	55                   	push   %rbp
  80107b:	48 89 e5             	mov    %rsp,%rbp
  80107e:	48 83 ec 20          	sub    $0x20,%rsp
  801082:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801086:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80108a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801091:	eb 0e                	jmp    8010a1 <strnlen+0x27>
  801093:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801097:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80109c:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  8010a1:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8010a6:	74 0b                	je     8010b3 <strnlen+0x39>
  8010a8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010ac:	0f b6 00             	movzbl (%rax),%eax
  8010af:	84 c0                	test   %al,%al
  8010b1:	75 e0                	jne    801093 <strnlen+0x19>
  8010b3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8010b6:	c9                   	leaveq 
  8010b7:	c3                   	retq   

00000000008010b8 <strcpy>:
  8010b8:	55                   	push   %rbp
  8010b9:	48 89 e5             	mov    %rsp,%rbp
  8010bc:	48 83 ec 20          	sub    $0x20,%rsp
  8010c0:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8010c4:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8010c8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010cc:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8010d0:	90                   	nop
  8010d1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010d5:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8010d9:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8010dd:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8010e1:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8010e5:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8010e9:	0f b6 12             	movzbl (%rdx),%edx
  8010ec:	88 10                	mov    %dl,(%rax)
  8010ee:	0f b6 00             	movzbl (%rax),%eax
  8010f1:	84 c0                	test   %al,%al
  8010f3:	75 dc                	jne    8010d1 <strcpy+0x19>
  8010f5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010f9:	c9                   	leaveq 
  8010fa:	c3                   	retq   

00000000008010fb <strcat>:
  8010fb:	55                   	push   %rbp
  8010fc:	48 89 e5             	mov    %rsp,%rbp
  8010ff:	48 83 ec 20          	sub    $0x20,%rsp
  801103:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801107:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80110b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80110f:	48 89 c7             	mov    %rax,%rdi
  801112:	48 b8 4c 10 80 00 00 	movabs $0x80104c,%rax
  801119:	00 00 00 
  80111c:	ff d0                	callq  *%rax
  80111e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801121:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801124:	48 63 d0             	movslq %eax,%rdx
  801127:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80112b:	48 01 c2             	add    %rax,%rdx
  80112e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801132:	48 89 c6             	mov    %rax,%rsi
  801135:	48 89 d7             	mov    %rdx,%rdi
  801138:	48 b8 b8 10 80 00 00 	movabs $0x8010b8,%rax
  80113f:	00 00 00 
  801142:	ff d0                	callq  *%rax
  801144:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801148:	c9                   	leaveq 
  801149:	c3                   	retq   

000000000080114a <strncpy>:
  80114a:	55                   	push   %rbp
  80114b:	48 89 e5             	mov    %rsp,%rbp
  80114e:	48 83 ec 28          	sub    $0x28,%rsp
  801152:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801156:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80115a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80115e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801162:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801166:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80116d:	00 
  80116e:	eb 2a                	jmp    80119a <strncpy+0x50>
  801170:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801174:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801178:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80117c:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801180:	0f b6 12             	movzbl (%rdx),%edx
  801183:	88 10                	mov    %dl,(%rax)
  801185:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801189:	0f b6 00             	movzbl (%rax),%eax
  80118c:	84 c0                	test   %al,%al
  80118e:	74 05                	je     801195 <strncpy+0x4b>
  801190:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  801195:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80119a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80119e:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8011a2:	72 cc                	jb     801170 <strncpy+0x26>
  8011a4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8011a8:	c9                   	leaveq 
  8011a9:	c3                   	retq   

00000000008011aa <strlcpy>:
  8011aa:	55                   	push   %rbp
  8011ab:	48 89 e5             	mov    %rsp,%rbp
  8011ae:	48 83 ec 28          	sub    $0x28,%rsp
  8011b2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8011b6:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8011ba:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8011be:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011c2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8011c6:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8011cb:	74 3d                	je     80120a <strlcpy+0x60>
  8011cd:	eb 1d                	jmp    8011ec <strlcpy+0x42>
  8011cf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011d3:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8011d7:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8011db:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8011df:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8011e3:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8011e7:	0f b6 12             	movzbl (%rdx),%edx
  8011ea:	88 10                	mov    %dl,(%rax)
  8011ec:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  8011f1:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8011f6:	74 0b                	je     801203 <strlcpy+0x59>
  8011f8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8011fc:	0f b6 00             	movzbl (%rax),%eax
  8011ff:	84 c0                	test   %al,%al
  801201:	75 cc                	jne    8011cf <strlcpy+0x25>
  801203:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801207:	c6 00 00             	movb   $0x0,(%rax)
  80120a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80120e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801212:	48 29 c2             	sub    %rax,%rdx
  801215:	48 89 d0             	mov    %rdx,%rax
  801218:	c9                   	leaveq 
  801219:	c3                   	retq   

000000000080121a <strcmp>:
  80121a:	55                   	push   %rbp
  80121b:	48 89 e5             	mov    %rsp,%rbp
  80121e:	48 83 ec 10          	sub    $0x10,%rsp
  801222:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801226:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80122a:	eb 0a                	jmp    801236 <strcmp+0x1c>
  80122c:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801231:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801236:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80123a:	0f b6 00             	movzbl (%rax),%eax
  80123d:	84 c0                	test   %al,%al
  80123f:	74 12                	je     801253 <strcmp+0x39>
  801241:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801245:	0f b6 10             	movzbl (%rax),%edx
  801248:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80124c:	0f b6 00             	movzbl (%rax),%eax
  80124f:	38 c2                	cmp    %al,%dl
  801251:	74 d9                	je     80122c <strcmp+0x12>
  801253:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801257:	0f b6 00             	movzbl (%rax),%eax
  80125a:	0f b6 d0             	movzbl %al,%edx
  80125d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801261:	0f b6 00             	movzbl (%rax),%eax
  801264:	0f b6 c0             	movzbl %al,%eax
  801267:	29 c2                	sub    %eax,%edx
  801269:	89 d0                	mov    %edx,%eax
  80126b:	c9                   	leaveq 
  80126c:	c3                   	retq   

000000000080126d <strncmp>:
  80126d:	55                   	push   %rbp
  80126e:	48 89 e5             	mov    %rsp,%rbp
  801271:	48 83 ec 18          	sub    $0x18,%rsp
  801275:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801279:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80127d:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801281:	eb 0f                	jmp    801292 <strncmp+0x25>
  801283:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  801288:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80128d:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801292:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801297:	74 1d                	je     8012b6 <strncmp+0x49>
  801299:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80129d:	0f b6 00             	movzbl (%rax),%eax
  8012a0:	84 c0                	test   %al,%al
  8012a2:	74 12                	je     8012b6 <strncmp+0x49>
  8012a4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012a8:	0f b6 10             	movzbl (%rax),%edx
  8012ab:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012af:	0f b6 00             	movzbl (%rax),%eax
  8012b2:	38 c2                	cmp    %al,%dl
  8012b4:	74 cd                	je     801283 <strncmp+0x16>
  8012b6:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8012bb:	75 07                	jne    8012c4 <strncmp+0x57>
  8012bd:	b8 00 00 00 00       	mov    $0x0,%eax
  8012c2:	eb 18                	jmp    8012dc <strncmp+0x6f>
  8012c4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012c8:	0f b6 00             	movzbl (%rax),%eax
  8012cb:	0f b6 d0             	movzbl %al,%edx
  8012ce:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012d2:	0f b6 00             	movzbl (%rax),%eax
  8012d5:	0f b6 c0             	movzbl %al,%eax
  8012d8:	29 c2                	sub    %eax,%edx
  8012da:	89 d0                	mov    %edx,%eax
  8012dc:	c9                   	leaveq 
  8012dd:	c3                   	retq   

00000000008012de <strchr>:
  8012de:	55                   	push   %rbp
  8012df:	48 89 e5             	mov    %rsp,%rbp
  8012e2:	48 83 ec 0c          	sub    $0xc,%rsp
  8012e6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8012ea:	89 f0                	mov    %esi,%eax
  8012ec:	88 45 f4             	mov    %al,-0xc(%rbp)
  8012ef:	eb 17                	jmp    801308 <strchr+0x2a>
  8012f1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012f5:	0f b6 00             	movzbl (%rax),%eax
  8012f8:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8012fb:	75 06                	jne    801303 <strchr+0x25>
  8012fd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801301:	eb 15                	jmp    801318 <strchr+0x3a>
  801303:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801308:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80130c:	0f b6 00             	movzbl (%rax),%eax
  80130f:	84 c0                	test   %al,%al
  801311:	75 de                	jne    8012f1 <strchr+0x13>
  801313:	b8 00 00 00 00       	mov    $0x0,%eax
  801318:	c9                   	leaveq 
  801319:	c3                   	retq   

000000000080131a <strfind>:
  80131a:	55                   	push   %rbp
  80131b:	48 89 e5             	mov    %rsp,%rbp
  80131e:	48 83 ec 0c          	sub    $0xc,%rsp
  801322:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801326:	89 f0                	mov    %esi,%eax
  801328:	88 45 f4             	mov    %al,-0xc(%rbp)
  80132b:	eb 13                	jmp    801340 <strfind+0x26>
  80132d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801331:	0f b6 00             	movzbl (%rax),%eax
  801334:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801337:	75 02                	jne    80133b <strfind+0x21>
  801339:	eb 10                	jmp    80134b <strfind+0x31>
  80133b:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801340:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801344:	0f b6 00             	movzbl (%rax),%eax
  801347:	84 c0                	test   %al,%al
  801349:	75 e2                	jne    80132d <strfind+0x13>
  80134b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80134f:	c9                   	leaveq 
  801350:	c3                   	retq   

0000000000801351 <memset>:
  801351:	55                   	push   %rbp
  801352:	48 89 e5             	mov    %rsp,%rbp
  801355:	48 83 ec 18          	sub    $0x18,%rsp
  801359:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80135d:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801360:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801364:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801369:	75 06                	jne    801371 <memset+0x20>
  80136b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80136f:	eb 69                	jmp    8013da <memset+0x89>
  801371:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801375:	83 e0 03             	and    $0x3,%eax
  801378:	48 85 c0             	test   %rax,%rax
  80137b:	75 48                	jne    8013c5 <memset+0x74>
  80137d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801381:	83 e0 03             	and    $0x3,%eax
  801384:	48 85 c0             	test   %rax,%rax
  801387:	75 3c                	jne    8013c5 <memset+0x74>
  801389:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  801390:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801393:	c1 e0 18             	shl    $0x18,%eax
  801396:	89 c2                	mov    %eax,%edx
  801398:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80139b:	c1 e0 10             	shl    $0x10,%eax
  80139e:	09 c2                	or     %eax,%edx
  8013a0:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8013a3:	c1 e0 08             	shl    $0x8,%eax
  8013a6:	09 d0                	or     %edx,%eax
  8013a8:	09 45 f4             	or     %eax,-0xc(%rbp)
  8013ab:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013af:	48 c1 e8 02          	shr    $0x2,%rax
  8013b3:	48 89 c1             	mov    %rax,%rcx
  8013b6:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8013ba:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8013bd:	48 89 d7             	mov    %rdx,%rdi
  8013c0:	fc                   	cld    
  8013c1:	f3 ab                	rep stos %eax,%es:(%rdi)
  8013c3:	eb 11                	jmp    8013d6 <memset+0x85>
  8013c5:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8013c9:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8013cc:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8013d0:	48 89 d7             	mov    %rdx,%rdi
  8013d3:	fc                   	cld    
  8013d4:	f3 aa                	rep stos %al,%es:(%rdi)
  8013d6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013da:	c9                   	leaveq 
  8013db:	c3                   	retq   

00000000008013dc <memmove>:
  8013dc:	55                   	push   %rbp
  8013dd:	48 89 e5             	mov    %rsp,%rbp
  8013e0:	48 83 ec 28          	sub    $0x28,%rsp
  8013e4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8013e8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8013ec:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8013f0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8013f4:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8013f8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013fc:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801400:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801404:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801408:	0f 83 88 00 00 00    	jae    801496 <memmove+0xba>
  80140e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801412:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801416:	48 01 d0             	add    %rdx,%rax
  801419:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  80141d:	76 77                	jbe    801496 <memmove+0xba>
  80141f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801423:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  801427:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80142b:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  80142f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801433:	83 e0 03             	and    $0x3,%eax
  801436:	48 85 c0             	test   %rax,%rax
  801439:	75 3b                	jne    801476 <memmove+0x9a>
  80143b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80143f:	83 e0 03             	and    $0x3,%eax
  801442:	48 85 c0             	test   %rax,%rax
  801445:	75 2f                	jne    801476 <memmove+0x9a>
  801447:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80144b:	83 e0 03             	and    $0x3,%eax
  80144e:	48 85 c0             	test   %rax,%rax
  801451:	75 23                	jne    801476 <memmove+0x9a>
  801453:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801457:	48 83 e8 04          	sub    $0x4,%rax
  80145b:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80145f:	48 83 ea 04          	sub    $0x4,%rdx
  801463:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801467:	48 c1 e9 02          	shr    $0x2,%rcx
  80146b:	48 89 c7             	mov    %rax,%rdi
  80146e:	48 89 d6             	mov    %rdx,%rsi
  801471:	fd                   	std    
  801472:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801474:	eb 1d                	jmp    801493 <memmove+0xb7>
  801476:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80147a:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80147e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801482:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  801486:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80148a:	48 89 d7             	mov    %rdx,%rdi
  80148d:	48 89 c1             	mov    %rax,%rcx
  801490:	fd                   	std    
  801491:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801493:	fc                   	cld    
  801494:	eb 57                	jmp    8014ed <memmove+0x111>
  801496:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80149a:	83 e0 03             	and    $0x3,%eax
  80149d:	48 85 c0             	test   %rax,%rax
  8014a0:	75 36                	jne    8014d8 <memmove+0xfc>
  8014a2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014a6:	83 e0 03             	and    $0x3,%eax
  8014a9:	48 85 c0             	test   %rax,%rax
  8014ac:	75 2a                	jne    8014d8 <memmove+0xfc>
  8014ae:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014b2:	83 e0 03             	and    $0x3,%eax
  8014b5:	48 85 c0             	test   %rax,%rax
  8014b8:	75 1e                	jne    8014d8 <memmove+0xfc>
  8014ba:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014be:	48 c1 e8 02          	shr    $0x2,%rax
  8014c2:	48 89 c1             	mov    %rax,%rcx
  8014c5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014c9:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8014cd:	48 89 c7             	mov    %rax,%rdi
  8014d0:	48 89 d6             	mov    %rdx,%rsi
  8014d3:	fc                   	cld    
  8014d4:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  8014d6:	eb 15                	jmp    8014ed <memmove+0x111>
  8014d8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014dc:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8014e0:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  8014e4:	48 89 c7             	mov    %rax,%rdi
  8014e7:	48 89 d6             	mov    %rdx,%rsi
  8014ea:	fc                   	cld    
  8014eb:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  8014ed:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014f1:	c9                   	leaveq 
  8014f2:	c3                   	retq   

00000000008014f3 <memcpy>:
  8014f3:	55                   	push   %rbp
  8014f4:	48 89 e5             	mov    %rsp,%rbp
  8014f7:	48 83 ec 18          	sub    $0x18,%rsp
  8014fb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8014ff:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801503:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801507:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80150b:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  80150f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801513:	48 89 ce             	mov    %rcx,%rsi
  801516:	48 89 c7             	mov    %rax,%rdi
  801519:	48 b8 dc 13 80 00 00 	movabs $0x8013dc,%rax
  801520:	00 00 00 
  801523:	ff d0                	callq  *%rax
  801525:	c9                   	leaveq 
  801526:	c3                   	retq   

0000000000801527 <memcmp>:
  801527:	55                   	push   %rbp
  801528:	48 89 e5             	mov    %rsp,%rbp
  80152b:	48 83 ec 28          	sub    $0x28,%rsp
  80152f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801533:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801537:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80153b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80153f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801543:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801547:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80154b:	eb 36                	jmp    801583 <memcmp+0x5c>
  80154d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801551:	0f b6 10             	movzbl (%rax),%edx
  801554:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801558:	0f b6 00             	movzbl (%rax),%eax
  80155b:	38 c2                	cmp    %al,%dl
  80155d:	74 1a                	je     801579 <memcmp+0x52>
  80155f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801563:	0f b6 00             	movzbl (%rax),%eax
  801566:	0f b6 d0             	movzbl %al,%edx
  801569:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80156d:	0f b6 00             	movzbl (%rax),%eax
  801570:	0f b6 c0             	movzbl %al,%eax
  801573:	29 c2                	sub    %eax,%edx
  801575:	89 d0                	mov    %edx,%eax
  801577:	eb 20                	jmp    801599 <memcmp+0x72>
  801579:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80157e:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801583:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801587:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80158b:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80158f:	48 85 c0             	test   %rax,%rax
  801592:	75 b9                	jne    80154d <memcmp+0x26>
  801594:	b8 00 00 00 00       	mov    $0x0,%eax
  801599:	c9                   	leaveq 
  80159a:	c3                   	retq   

000000000080159b <memfind>:
  80159b:	55                   	push   %rbp
  80159c:	48 89 e5             	mov    %rsp,%rbp
  80159f:	48 83 ec 28          	sub    $0x28,%rsp
  8015a3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8015a7:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8015aa:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8015ae:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015b2:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8015b6:	48 01 d0             	add    %rdx,%rax
  8015b9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8015bd:	eb 15                	jmp    8015d4 <memfind+0x39>
  8015bf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8015c3:	0f b6 10             	movzbl (%rax),%edx
  8015c6:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8015c9:	38 c2                	cmp    %al,%dl
  8015cb:	75 02                	jne    8015cf <memfind+0x34>
  8015cd:	eb 0f                	jmp    8015de <memfind+0x43>
  8015cf:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8015d4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8015d8:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  8015dc:	72 e1                	jb     8015bf <memfind+0x24>
  8015de:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8015e2:	c9                   	leaveq 
  8015e3:	c3                   	retq   

00000000008015e4 <strtol>:
  8015e4:	55                   	push   %rbp
  8015e5:	48 89 e5             	mov    %rsp,%rbp
  8015e8:	48 83 ec 34          	sub    $0x34,%rsp
  8015ec:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8015f0:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8015f4:	89 55 cc             	mov    %edx,-0x34(%rbp)
  8015f7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8015fe:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  801605:	00 
  801606:	eb 05                	jmp    80160d <strtol+0x29>
  801608:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80160d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801611:	0f b6 00             	movzbl (%rax),%eax
  801614:	3c 20                	cmp    $0x20,%al
  801616:	74 f0                	je     801608 <strtol+0x24>
  801618:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80161c:	0f b6 00             	movzbl (%rax),%eax
  80161f:	3c 09                	cmp    $0x9,%al
  801621:	74 e5                	je     801608 <strtol+0x24>
  801623:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801627:	0f b6 00             	movzbl (%rax),%eax
  80162a:	3c 2b                	cmp    $0x2b,%al
  80162c:	75 07                	jne    801635 <strtol+0x51>
  80162e:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801633:	eb 17                	jmp    80164c <strtol+0x68>
  801635:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801639:	0f b6 00             	movzbl (%rax),%eax
  80163c:	3c 2d                	cmp    $0x2d,%al
  80163e:	75 0c                	jne    80164c <strtol+0x68>
  801640:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801645:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  80164c:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801650:	74 06                	je     801658 <strtol+0x74>
  801652:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  801656:	75 28                	jne    801680 <strtol+0x9c>
  801658:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80165c:	0f b6 00             	movzbl (%rax),%eax
  80165f:	3c 30                	cmp    $0x30,%al
  801661:	75 1d                	jne    801680 <strtol+0x9c>
  801663:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801667:	48 83 c0 01          	add    $0x1,%rax
  80166b:	0f b6 00             	movzbl (%rax),%eax
  80166e:	3c 78                	cmp    $0x78,%al
  801670:	75 0e                	jne    801680 <strtol+0x9c>
  801672:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  801677:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  80167e:	eb 2c                	jmp    8016ac <strtol+0xc8>
  801680:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801684:	75 19                	jne    80169f <strtol+0xbb>
  801686:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80168a:	0f b6 00             	movzbl (%rax),%eax
  80168d:	3c 30                	cmp    $0x30,%al
  80168f:	75 0e                	jne    80169f <strtol+0xbb>
  801691:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801696:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  80169d:	eb 0d                	jmp    8016ac <strtol+0xc8>
  80169f:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8016a3:	75 07                	jne    8016ac <strtol+0xc8>
  8016a5:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  8016ac:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016b0:	0f b6 00             	movzbl (%rax),%eax
  8016b3:	3c 2f                	cmp    $0x2f,%al
  8016b5:	7e 1d                	jle    8016d4 <strtol+0xf0>
  8016b7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016bb:	0f b6 00             	movzbl (%rax),%eax
  8016be:	3c 39                	cmp    $0x39,%al
  8016c0:	7f 12                	jg     8016d4 <strtol+0xf0>
  8016c2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016c6:	0f b6 00             	movzbl (%rax),%eax
  8016c9:	0f be c0             	movsbl %al,%eax
  8016cc:	83 e8 30             	sub    $0x30,%eax
  8016cf:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8016d2:	eb 4e                	jmp    801722 <strtol+0x13e>
  8016d4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016d8:	0f b6 00             	movzbl (%rax),%eax
  8016db:	3c 60                	cmp    $0x60,%al
  8016dd:	7e 1d                	jle    8016fc <strtol+0x118>
  8016df:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016e3:	0f b6 00             	movzbl (%rax),%eax
  8016e6:	3c 7a                	cmp    $0x7a,%al
  8016e8:	7f 12                	jg     8016fc <strtol+0x118>
  8016ea:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016ee:	0f b6 00             	movzbl (%rax),%eax
  8016f1:	0f be c0             	movsbl %al,%eax
  8016f4:	83 e8 57             	sub    $0x57,%eax
  8016f7:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8016fa:	eb 26                	jmp    801722 <strtol+0x13e>
  8016fc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801700:	0f b6 00             	movzbl (%rax),%eax
  801703:	3c 40                	cmp    $0x40,%al
  801705:	7e 48                	jle    80174f <strtol+0x16b>
  801707:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80170b:	0f b6 00             	movzbl (%rax),%eax
  80170e:	3c 5a                	cmp    $0x5a,%al
  801710:	7f 3d                	jg     80174f <strtol+0x16b>
  801712:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801716:	0f b6 00             	movzbl (%rax),%eax
  801719:	0f be c0             	movsbl %al,%eax
  80171c:	83 e8 37             	sub    $0x37,%eax
  80171f:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801722:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801725:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  801728:	7c 02                	jl     80172c <strtol+0x148>
  80172a:	eb 23                	jmp    80174f <strtol+0x16b>
  80172c:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801731:	8b 45 cc             	mov    -0x34(%rbp),%eax
  801734:	48 98                	cltq   
  801736:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  80173b:	48 89 c2             	mov    %rax,%rdx
  80173e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801741:	48 98                	cltq   
  801743:	48 01 d0             	add    %rdx,%rax
  801746:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80174a:	e9 5d ff ff ff       	jmpq   8016ac <strtol+0xc8>
  80174f:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  801754:	74 0b                	je     801761 <strtol+0x17d>
  801756:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80175a:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80175e:	48 89 10             	mov    %rdx,(%rax)
  801761:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801765:	74 09                	je     801770 <strtol+0x18c>
  801767:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80176b:	48 f7 d8             	neg    %rax
  80176e:	eb 04                	jmp    801774 <strtol+0x190>
  801770:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801774:	c9                   	leaveq 
  801775:	c3                   	retq   

0000000000801776 <strstr>:
  801776:	55                   	push   %rbp
  801777:	48 89 e5             	mov    %rsp,%rbp
  80177a:	48 83 ec 30          	sub    $0x30,%rsp
  80177e:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801782:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801786:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80178a:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80178e:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801792:	0f b6 00             	movzbl (%rax),%eax
  801795:	88 45 ff             	mov    %al,-0x1(%rbp)
  801798:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  80179c:	75 06                	jne    8017a4 <strstr+0x2e>
  80179e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017a2:	eb 6b                	jmp    80180f <strstr+0x99>
  8017a4:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8017a8:	48 89 c7             	mov    %rax,%rdi
  8017ab:	48 b8 4c 10 80 00 00 	movabs $0x80104c,%rax
  8017b2:	00 00 00 
  8017b5:	ff d0                	callq  *%rax
  8017b7:	48 98                	cltq   
  8017b9:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8017bd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017c1:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8017c5:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8017c9:	0f b6 00             	movzbl (%rax),%eax
  8017cc:	88 45 ef             	mov    %al,-0x11(%rbp)
  8017cf:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  8017d3:	75 07                	jne    8017dc <strstr+0x66>
  8017d5:	b8 00 00 00 00       	mov    $0x0,%eax
  8017da:	eb 33                	jmp    80180f <strstr+0x99>
  8017dc:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  8017e0:	3a 45 ff             	cmp    -0x1(%rbp),%al
  8017e3:	75 d8                	jne    8017bd <strstr+0x47>
  8017e5:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8017e9:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  8017ed:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017f1:	48 89 ce             	mov    %rcx,%rsi
  8017f4:	48 89 c7             	mov    %rax,%rdi
  8017f7:	48 b8 6d 12 80 00 00 	movabs $0x80126d,%rax
  8017fe:	00 00 00 
  801801:	ff d0                	callq  *%rax
  801803:	85 c0                	test   %eax,%eax
  801805:	75 b6                	jne    8017bd <strstr+0x47>
  801807:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80180b:	48 83 e8 01          	sub    $0x1,%rax
  80180f:	c9                   	leaveq 
  801810:	c3                   	retq   

0000000000801811 <syscall>:
  801811:	55                   	push   %rbp
  801812:	48 89 e5             	mov    %rsp,%rbp
  801815:	53                   	push   %rbx
  801816:	48 83 ec 48          	sub    $0x48,%rsp
  80181a:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80181d:	89 75 d8             	mov    %esi,-0x28(%rbp)
  801820:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801824:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  801828:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  80182c:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  801830:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801833:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  801837:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  80183b:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  80183f:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  801843:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  801847:	4c 89 c3             	mov    %r8,%rbx
  80184a:	cd 30                	int    $0x30
  80184c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801850:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801854:	74 3e                	je     801894 <syscall+0x83>
  801856:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80185b:	7e 37                	jle    801894 <syscall+0x83>
  80185d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801861:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801864:	49 89 d0             	mov    %rdx,%r8
  801867:	89 c1                	mov    %eax,%ecx
  801869:	48 ba c8 4d 80 00 00 	movabs $0x804dc8,%rdx
  801870:	00 00 00 
  801873:	be 24 00 00 00       	mov    $0x24,%esi
  801878:	48 bf e5 4d 80 00 00 	movabs $0x804de5,%rdi
  80187f:	00 00 00 
  801882:	b8 00 00 00 00       	mov    $0x0,%eax
  801887:	49 b9 78 3f 80 00 00 	movabs $0x803f78,%r9
  80188e:	00 00 00 
  801891:	41 ff d1             	callq  *%r9
  801894:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801898:	48 83 c4 48          	add    $0x48,%rsp
  80189c:	5b                   	pop    %rbx
  80189d:	5d                   	pop    %rbp
  80189e:	c3                   	retq   

000000000080189f <sys_cputs>:
  80189f:	55                   	push   %rbp
  8018a0:	48 89 e5             	mov    %rsp,%rbp
  8018a3:	48 83 ec 20          	sub    $0x20,%rsp
  8018a7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8018ab:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8018af:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8018b3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8018b7:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8018be:	00 
  8018bf:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8018c5:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8018cb:	48 89 d1             	mov    %rdx,%rcx
  8018ce:	48 89 c2             	mov    %rax,%rdx
  8018d1:	be 00 00 00 00       	mov    $0x0,%esi
  8018d6:	bf 00 00 00 00       	mov    $0x0,%edi
  8018db:	48 b8 11 18 80 00 00 	movabs $0x801811,%rax
  8018e2:	00 00 00 
  8018e5:	ff d0                	callq  *%rax
  8018e7:	c9                   	leaveq 
  8018e8:	c3                   	retq   

00000000008018e9 <sys_cgetc>:
  8018e9:	55                   	push   %rbp
  8018ea:	48 89 e5             	mov    %rsp,%rbp
  8018ed:	48 83 ec 10          	sub    $0x10,%rsp
  8018f1:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8018f8:	00 
  8018f9:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8018ff:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801905:	b9 00 00 00 00       	mov    $0x0,%ecx
  80190a:	ba 00 00 00 00       	mov    $0x0,%edx
  80190f:	be 00 00 00 00       	mov    $0x0,%esi
  801914:	bf 01 00 00 00       	mov    $0x1,%edi
  801919:	48 b8 11 18 80 00 00 	movabs $0x801811,%rax
  801920:	00 00 00 
  801923:	ff d0                	callq  *%rax
  801925:	c9                   	leaveq 
  801926:	c3                   	retq   

0000000000801927 <sys_env_destroy>:
  801927:	55                   	push   %rbp
  801928:	48 89 e5             	mov    %rsp,%rbp
  80192b:	48 83 ec 10          	sub    $0x10,%rsp
  80192f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801932:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801935:	48 98                	cltq   
  801937:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80193e:	00 
  80193f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801945:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80194b:	b9 00 00 00 00       	mov    $0x0,%ecx
  801950:	48 89 c2             	mov    %rax,%rdx
  801953:	be 01 00 00 00       	mov    $0x1,%esi
  801958:	bf 03 00 00 00       	mov    $0x3,%edi
  80195d:	48 b8 11 18 80 00 00 	movabs $0x801811,%rax
  801964:	00 00 00 
  801967:	ff d0                	callq  *%rax
  801969:	c9                   	leaveq 
  80196a:	c3                   	retq   

000000000080196b <sys_getenvid>:
  80196b:	55                   	push   %rbp
  80196c:	48 89 e5             	mov    %rsp,%rbp
  80196f:	48 83 ec 10          	sub    $0x10,%rsp
  801973:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80197a:	00 
  80197b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801981:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801987:	b9 00 00 00 00       	mov    $0x0,%ecx
  80198c:	ba 00 00 00 00       	mov    $0x0,%edx
  801991:	be 00 00 00 00       	mov    $0x0,%esi
  801996:	bf 02 00 00 00       	mov    $0x2,%edi
  80199b:	48 b8 11 18 80 00 00 	movabs $0x801811,%rax
  8019a2:	00 00 00 
  8019a5:	ff d0                	callq  *%rax
  8019a7:	c9                   	leaveq 
  8019a8:	c3                   	retq   

00000000008019a9 <sys_yield>:
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
  8019d4:	bf 0b 00 00 00       	mov    $0xb,%edi
  8019d9:	48 b8 11 18 80 00 00 	movabs $0x801811,%rax
  8019e0:	00 00 00 
  8019e3:	ff d0                	callq  *%rax
  8019e5:	c9                   	leaveq 
  8019e6:	c3                   	retq   

00000000008019e7 <sys_page_alloc>:
  8019e7:	55                   	push   %rbp
  8019e8:	48 89 e5             	mov    %rsp,%rbp
  8019eb:	48 83 ec 20          	sub    $0x20,%rsp
  8019ef:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8019f2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8019f6:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8019f9:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8019fc:	48 63 c8             	movslq %eax,%rcx
  8019ff:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801a03:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a06:	48 98                	cltq   
  801a08:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801a0f:	00 
  801a10:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a16:	49 89 c8             	mov    %rcx,%r8
  801a19:	48 89 d1             	mov    %rdx,%rcx
  801a1c:	48 89 c2             	mov    %rax,%rdx
  801a1f:	be 01 00 00 00       	mov    $0x1,%esi
  801a24:	bf 04 00 00 00       	mov    $0x4,%edi
  801a29:	48 b8 11 18 80 00 00 	movabs $0x801811,%rax
  801a30:	00 00 00 
  801a33:	ff d0                	callq  *%rax
  801a35:	c9                   	leaveq 
  801a36:	c3                   	retq   

0000000000801a37 <sys_page_map>:
  801a37:	55                   	push   %rbp
  801a38:	48 89 e5             	mov    %rsp,%rbp
  801a3b:	48 83 ec 30          	sub    $0x30,%rsp
  801a3f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a42:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a46:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801a49:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801a4d:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801a51:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801a54:	48 63 c8             	movslq %eax,%rcx
  801a57:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801a5b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801a5e:	48 63 f0             	movslq %eax,%rsi
  801a61:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801a65:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a68:	48 98                	cltq   
  801a6a:	48 89 0c 24          	mov    %rcx,(%rsp)
  801a6e:	49 89 f9             	mov    %rdi,%r9
  801a71:	49 89 f0             	mov    %rsi,%r8
  801a74:	48 89 d1             	mov    %rdx,%rcx
  801a77:	48 89 c2             	mov    %rax,%rdx
  801a7a:	be 01 00 00 00       	mov    $0x1,%esi
  801a7f:	bf 05 00 00 00       	mov    $0x5,%edi
  801a84:	48 b8 11 18 80 00 00 	movabs $0x801811,%rax
  801a8b:	00 00 00 
  801a8e:	ff d0                	callq  *%rax
  801a90:	c9                   	leaveq 
  801a91:	c3                   	retq   

0000000000801a92 <sys_page_unmap>:
  801a92:	55                   	push   %rbp
  801a93:	48 89 e5             	mov    %rsp,%rbp
  801a96:	48 83 ec 20          	sub    $0x20,%rsp
  801a9a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a9d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801aa1:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801aa5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801aa8:	48 98                	cltq   
  801aaa:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801ab1:	00 
  801ab2:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ab8:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801abe:	48 89 d1             	mov    %rdx,%rcx
  801ac1:	48 89 c2             	mov    %rax,%rdx
  801ac4:	be 01 00 00 00       	mov    $0x1,%esi
  801ac9:	bf 06 00 00 00       	mov    $0x6,%edi
  801ace:	48 b8 11 18 80 00 00 	movabs $0x801811,%rax
  801ad5:	00 00 00 
  801ad8:	ff d0                	callq  *%rax
  801ada:	c9                   	leaveq 
  801adb:	c3                   	retq   

0000000000801adc <sys_env_set_status>:
  801adc:	55                   	push   %rbp
  801add:	48 89 e5             	mov    %rsp,%rbp
  801ae0:	48 83 ec 10          	sub    $0x10,%rsp
  801ae4:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801ae7:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801aea:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801aed:	48 63 d0             	movslq %eax,%rdx
  801af0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801af3:	48 98                	cltq   
  801af5:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801afc:	00 
  801afd:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b03:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b09:	48 89 d1             	mov    %rdx,%rcx
  801b0c:	48 89 c2             	mov    %rax,%rdx
  801b0f:	be 01 00 00 00       	mov    $0x1,%esi
  801b14:	bf 08 00 00 00       	mov    $0x8,%edi
  801b19:	48 b8 11 18 80 00 00 	movabs $0x801811,%rax
  801b20:	00 00 00 
  801b23:	ff d0                	callq  *%rax
  801b25:	c9                   	leaveq 
  801b26:	c3                   	retq   

0000000000801b27 <sys_env_set_trapframe>:
  801b27:	55                   	push   %rbp
  801b28:	48 89 e5             	mov    %rsp,%rbp
  801b2b:	48 83 ec 20          	sub    $0x20,%rsp
  801b2f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b32:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b36:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b3a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b3d:	48 98                	cltq   
  801b3f:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801b46:	00 
  801b47:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b4d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b53:	48 89 d1             	mov    %rdx,%rcx
  801b56:	48 89 c2             	mov    %rax,%rdx
  801b59:	be 01 00 00 00       	mov    $0x1,%esi
  801b5e:	bf 09 00 00 00       	mov    $0x9,%edi
  801b63:	48 b8 11 18 80 00 00 	movabs $0x801811,%rax
  801b6a:	00 00 00 
  801b6d:	ff d0                	callq  *%rax
  801b6f:	c9                   	leaveq 
  801b70:	c3                   	retq   

0000000000801b71 <sys_env_set_pgfault_upcall>:
  801b71:	55                   	push   %rbp
  801b72:	48 89 e5             	mov    %rsp,%rbp
  801b75:	48 83 ec 20          	sub    $0x20,%rsp
  801b79:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b7c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b80:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b84:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b87:	48 98                	cltq   
  801b89:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801b90:	00 
  801b91:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b97:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b9d:	48 89 d1             	mov    %rdx,%rcx
  801ba0:	48 89 c2             	mov    %rax,%rdx
  801ba3:	be 01 00 00 00       	mov    $0x1,%esi
  801ba8:	bf 0a 00 00 00       	mov    $0xa,%edi
  801bad:	48 b8 11 18 80 00 00 	movabs $0x801811,%rax
  801bb4:	00 00 00 
  801bb7:	ff d0                	callq  *%rax
  801bb9:	c9                   	leaveq 
  801bba:	c3                   	retq   

0000000000801bbb <sys_ipc_try_send>:
  801bbb:	55                   	push   %rbp
  801bbc:	48 89 e5             	mov    %rsp,%rbp
  801bbf:	48 83 ec 20          	sub    $0x20,%rsp
  801bc3:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801bc6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801bca:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801bce:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801bd1:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801bd4:	48 63 f0             	movslq %eax,%rsi
  801bd7:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801bdb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801bde:	48 98                	cltq   
  801be0:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801be4:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801beb:	00 
  801bec:	49 89 f1             	mov    %rsi,%r9
  801bef:	49 89 c8             	mov    %rcx,%r8
  801bf2:	48 89 d1             	mov    %rdx,%rcx
  801bf5:	48 89 c2             	mov    %rax,%rdx
  801bf8:	be 00 00 00 00       	mov    $0x0,%esi
  801bfd:	bf 0c 00 00 00       	mov    $0xc,%edi
  801c02:	48 b8 11 18 80 00 00 	movabs $0x801811,%rax
  801c09:	00 00 00 
  801c0c:	ff d0                	callq  *%rax
  801c0e:	c9                   	leaveq 
  801c0f:	c3                   	retq   

0000000000801c10 <sys_ipc_recv>:
  801c10:	55                   	push   %rbp
  801c11:	48 89 e5             	mov    %rsp,%rbp
  801c14:	48 83 ec 10          	sub    $0x10,%rsp
  801c18:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c1c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c20:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c27:	00 
  801c28:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c2e:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c34:	b9 00 00 00 00       	mov    $0x0,%ecx
  801c39:	48 89 c2             	mov    %rax,%rdx
  801c3c:	be 01 00 00 00       	mov    $0x1,%esi
  801c41:	bf 0d 00 00 00       	mov    $0xd,%edi
  801c46:	48 b8 11 18 80 00 00 	movabs $0x801811,%rax
  801c4d:	00 00 00 
  801c50:	ff d0                	callq  *%rax
  801c52:	c9                   	leaveq 
  801c53:	c3                   	retq   

0000000000801c54 <sys_time_msec>:
  801c54:	55                   	push   %rbp
  801c55:	48 89 e5             	mov    %rsp,%rbp
  801c58:	48 83 ec 10          	sub    $0x10,%rsp
  801c5c:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c63:	00 
  801c64:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c6a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c70:	b9 00 00 00 00       	mov    $0x0,%ecx
  801c75:	ba 00 00 00 00       	mov    $0x0,%edx
  801c7a:	be 00 00 00 00       	mov    $0x0,%esi
  801c7f:	bf 0e 00 00 00       	mov    $0xe,%edi
  801c84:	48 b8 11 18 80 00 00 	movabs $0x801811,%rax
  801c8b:	00 00 00 
  801c8e:	ff d0                	callq  *%rax
  801c90:	c9                   	leaveq 
  801c91:	c3                   	retq   

0000000000801c92 <sys_net_transmit>:
  801c92:	55                   	push   %rbp
  801c93:	48 89 e5             	mov    %rsp,%rbp
  801c96:	48 83 ec 20          	sub    $0x20,%rsp
  801c9a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c9e:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801ca1:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801ca4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ca8:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801caf:	00 
  801cb0:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801cb6:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801cbc:	48 89 d1             	mov    %rdx,%rcx
  801cbf:	48 89 c2             	mov    %rax,%rdx
  801cc2:	be 00 00 00 00       	mov    $0x0,%esi
  801cc7:	bf 0f 00 00 00       	mov    $0xf,%edi
  801ccc:	48 b8 11 18 80 00 00 	movabs $0x801811,%rax
  801cd3:	00 00 00 
  801cd6:	ff d0                	callq  *%rax
  801cd8:	c9                   	leaveq 
  801cd9:	c3                   	retq   

0000000000801cda <sys_net_receive>:
  801cda:	55                   	push   %rbp
  801cdb:	48 89 e5             	mov    %rsp,%rbp
  801cde:	48 83 ec 20          	sub    $0x20,%rsp
  801ce2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801ce6:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801ce9:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801cec:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801cf0:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801cf7:	00 
  801cf8:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801cfe:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d04:	48 89 d1             	mov    %rdx,%rcx
  801d07:	48 89 c2             	mov    %rax,%rdx
  801d0a:	be 00 00 00 00       	mov    $0x0,%esi
  801d0f:	bf 10 00 00 00       	mov    $0x10,%edi
  801d14:	48 b8 11 18 80 00 00 	movabs $0x801811,%rax
  801d1b:	00 00 00 
  801d1e:	ff d0                	callq  *%rax
  801d20:	c9                   	leaveq 
  801d21:	c3                   	retq   

0000000000801d22 <sys_ept_map>:
  801d22:	55                   	push   %rbp
  801d23:	48 89 e5             	mov    %rsp,%rbp
  801d26:	48 83 ec 30          	sub    $0x30,%rsp
  801d2a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801d2d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d31:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801d34:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801d38:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801d3c:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801d3f:	48 63 c8             	movslq %eax,%rcx
  801d42:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801d46:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801d49:	48 63 f0             	movslq %eax,%rsi
  801d4c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d50:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801d53:	48 98                	cltq   
  801d55:	48 89 0c 24          	mov    %rcx,(%rsp)
  801d59:	49 89 f9             	mov    %rdi,%r9
  801d5c:	49 89 f0             	mov    %rsi,%r8
  801d5f:	48 89 d1             	mov    %rdx,%rcx
  801d62:	48 89 c2             	mov    %rax,%rdx
  801d65:	be 00 00 00 00       	mov    $0x0,%esi
  801d6a:	bf 11 00 00 00       	mov    $0x11,%edi
  801d6f:	48 b8 11 18 80 00 00 	movabs $0x801811,%rax
  801d76:	00 00 00 
  801d79:	ff d0                	callq  *%rax
  801d7b:	c9                   	leaveq 
  801d7c:	c3                   	retq   

0000000000801d7d <sys_env_mkguest>:
  801d7d:	55                   	push   %rbp
  801d7e:	48 89 e5             	mov    %rsp,%rbp
  801d81:	48 83 ec 20          	sub    $0x20,%rsp
  801d85:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d89:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d8d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d91:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d95:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801d9c:	00 
  801d9d:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801da3:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801da9:	48 89 d1             	mov    %rdx,%rcx
  801dac:	48 89 c2             	mov    %rax,%rdx
  801daf:	be 00 00 00 00       	mov    $0x0,%esi
  801db4:	bf 12 00 00 00       	mov    $0x12,%edi
  801db9:	48 b8 11 18 80 00 00 	movabs $0x801811,%rax
  801dc0:	00 00 00 
  801dc3:	ff d0                	callq  *%rax
  801dc5:	c9                   	leaveq 
  801dc6:	c3                   	retq   

0000000000801dc7 <sys_vmx_list_vms>:
  801dc7:	55                   	push   %rbp
  801dc8:	48 89 e5             	mov    %rsp,%rbp
  801dcb:	48 83 ec 10          	sub    $0x10,%rsp
  801dcf:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801dd6:	00 
  801dd7:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ddd:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801de3:	b9 00 00 00 00       	mov    $0x0,%ecx
  801de8:	ba 00 00 00 00       	mov    $0x0,%edx
  801ded:	be 00 00 00 00       	mov    $0x0,%esi
  801df2:	bf 13 00 00 00       	mov    $0x13,%edi
  801df7:	48 b8 11 18 80 00 00 	movabs $0x801811,%rax
  801dfe:	00 00 00 
  801e01:	ff d0                	callq  *%rax
  801e03:	c9                   	leaveq 
  801e04:	c3                   	retq   

0000000000801e05 <sys_vmx_sel_resume>:
  801e05:	55                   	push   %rbp
  801e06:	48 89 e5             	mov    %rsp,%rbp
  801e09:	48 83 ec 10          	sub    $0x10,%rsp
  801e0d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801e10:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e13:	48 98                	cltq   
  801e15:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801e1c:	00 
  801e1d:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e23:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e29:	b9 00 00 00 00       	mov    $0x0,%ecx
  801e2e:	48 89 c2             	mov    %rax,%rdx
  801e31:	be 00 00 00 00       	mov    $0x0,%esi
  801e36:	bf 14 00 00 00       	mov    $0x14,%edi
  801e3b:	48 b8 11 18 80 00 00 	movabs $0x801811,%rax
  801e42:	00 00 00 
  801e45:	ff d0                	callq  *%rax
  801e47:	c9                   	leaveq 
  801e48:	c3                   	retq   

0000000000801e49 <sys_vmx_get_vmdisk_number>:
  801e49:	55                   	push   %rbp
  801e4a:	48 89 e5             	mov    %rsp,%rbp
  801e4d:	48 83 ec 10          	sub    $0x10,%rsp
  801e51:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801e58:	00 
  801e59:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e5f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e65:	b9 00 00 00 00       	mov    $0x0,%ecx
  801e6a:	ba 00 00 00 00       	mov    $0x0,%edx
  801e6f:	be 00 00 00 00       	mov    $0x0,%esi
  801e74:	bf 15 00 00 00       	mov    $0x15,%edi
  801e79:	48 b8 11 18 80 00 00 	movabs $0x801811,%rax
  801e80:	00 00 00 
  801e83:	ff d0                	callq  *%rax
  801e85:	c9                   	leaveq 
  801e86:	c3                   	retq   

0000000000801e87 <sys_vmx_incr_vmdisk_number>:
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
  801eb2:	bf 16 00 00 00       	mov    $0x16,%edi
  801eb7:	48 b8 11 18 80 00 00 	movabs $0x801811,%rax
  801ebe:	00 00 00 
  801ec1:	ff d0                	callq  *%rax
  801ec3:	c9                   	leaveq 
  801ec4:	c3                   	retq   

0000000000801ec5 <fd2num>:
  801ec5:	55                   	push   %rbp
  801ec6:	48 89 e5             	mov    %rsp,%rbp
  801ec9:	48 83 ec 08          	sub    $0x8,%rsp
  801ecd:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801ed1:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801ed5:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  801edc:	ff ff ff 
  801edf:	48 01 d0             	add    %rdx,%rax
  801ee2:	48 c1 e8 0c          	shr    $0xc,%rax
  801ee6:	c9                   	leaveq 
  801ee7:	c3                   	retq   

0000000000801ee8 <fd2data>:
  801ee8:	55                   	push   %rbp
  801ee9:	48 89 e5             	mov    %rsp,%rbp
  801eec:	48 83 ec 08          	sub    $0x8,%rsp
  801ef0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801ef4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ef8:	48 89 c7             	mov    %rax,%rdi
  801efb:	48 b8 c5 1e 80 00 00 	movabs $0x801ec5,%rax
  801f02:	00 00 00 
  801f05:	ff d0                	callq  *%rax
  801f07:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  801f0d:	48 c1 e0 0c          	shl    $0xc,%rax
  801f11:	c9                   	leaveq 
  801f12:	c3                   	retq   

0000000000801f13 <fd_alloc>:
  801f13:	55                   	push   %rbp
  801f14:	48 89 e5             	mov    %rsp,%rbp
  801f17:	48 83 ec 18          	sub    $0x18,%rsp
  801f1b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801f1f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801f26:	eb 6b                	jmp    801f93 <fd_alloc+0x80>
  801f28:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801f2b:	48 98                	cltq   
  801f2d:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801f33:	48 c1 e0 0c          	shl    $0xc,%rax
  801f37:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801f3b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801f3f:	48 c1 e8 15          	shr    $0x15,%rax
  801f43:	48 89 c2             	mov    %rax,%rdx
  801f46:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  801f4d:	01 00 00 
  801f50:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801f54:	83 e0 01             	and    $0x1,%eax
  801f57:	48 85 c0             	test   %rax,%rax
  801f5a:	74 21                	je     801f7d <fd_alloc+0x6a>
  801f5c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801f60:	48 c1 e8 0c          	shr    $0xc,%rax
  801f64:	48 89 c2             	mov    %rax,%rdx
  801f67:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801f6e:	01 00 00 
  801f71:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801f75:	83 e0 01             	and    $0x1,%eax
  801f78:	48 85 c0             	test   %rax,%rax
  801f7b:	75 12                	jne    801f8f <fd_alloc+0x7c>
  801f7d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801f81:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801f85:	48 89 10             	mov    %rdx,(%rax)
  801f88:	b8 00 00 00 00       	mov    $0x0,%eax
  801f8d:	eb 1a                	jmp    801fa9 <fd_alloc+0x96>
  801f8f:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801f93:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  801f97:	7e 8f                	jle    801f28 <fd_alloc+0x15>
  801f99:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801f9d:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  801fa4:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  801fa9:	c9                   	leaveq 
  801faa:	c3                   	retq   

0000000000801fab <fd_lookup>:
  801fab:	55                   	push   %rbp
  801fac:	48 89 e5             	mov    %rsp,%rbp
  801faf:	48 83 ec 20          	sub    $0x20,%rsp
  801fb3:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801fb6:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801fba:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  801fbe:	78 06                	js     801fc6 <fd_lookup+0x1b>
  801fc0:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  801fc4:	7e 07                	jle    801fcd <fd_lookup+0x22>
  801fc6:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801fcb:	eb 6c                	jmp    802039 <fd_lookup+0x8e>
  801fcd:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801fd0:	48 98                	cltq   
  801fd2:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801fd8:	48 c1 e0 0c          	shl    $0xc,%rax
  801fdc:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801fe0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801fe4:	48 c1 e8 15          	shr    $0x15,%rax
  801fe8:	48 89 c2             	mov    %rax,%rdx
  801feb:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  801ff2:	01 00 00 
  801ff5:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801ff9:	83 e0 01             	and    $0x1,%eax
  801ffc:	48 85 c0             	test   %rax,%rax
  801fff:	74 21                	je     802022 <fd_lookup+0x77>
  802001:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802005:	48 c1 e8 0c          	shr    $0xc,%rax
  802009:	48 89 c2             	mov    %rax,%rdx
  80200c:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802013:	01 00 00 
  802016:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80201a:	83 e0 01             	and    $0x1,%eax
  80201d:	48 85 c0             	test   %rax,%rax
  802020:	75 07                	jne    802029 <fd_lookup+0x7e>
  802022:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802027:	eb 10                	jmp    802039 <fd_lookup+0x8e>
  802029:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80202d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802031:	48 89 10             	mov    %rdx,(%rax)
  802034:	b8 00 00 00 00       	mov    $0x0,%eax
  802039:	c9                   	leaveq 
  80203a:	c3                   	retq   

000000000080203b <fd_close>:
  80203b:	55                   	push   %rbp
  80203c:	48 89 e5             	mov    %rsp,%rbp
  80203f:	48 83 ec 30          	sub    $0x30,%rsp
  802043:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802047:	89 f0                	mov    %esi,%eax
  802049:	88 45 d4             	mov    %al,-0x2c(%rbp)
  80204c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802050:	48 89 c7             	mov    %rax,%rdi
  802053:	48 b8 c5 1e 80 00 00 	movabs $0x801ec5,%rax
  80205a:	00 00 00 
  80205d:	ff d0                	callq  *%rax
  80205f:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802063:	48 89 d6             	mov    %rdx,%rsi
  802066:	89 c7                	mov    %eax,%edi
  802068:	48 b8 ab 1f 80 00 00 	movabs $0x801fab,%rax
  80206f:	00 00 00 
  802072:	ff d0                	callq  *%rax
  802074:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802077:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80207b:	78 0a                	js     802087 <fd_close+0x4c>
  80207d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802081:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  802085:	74 12                	je     802099 <fd_close+0x5e>
  802087:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  80208b:	74 05                	je     802092 <fd_close+0x57>
  80208d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802090:	eb 05                	jmp    802097 <fd_close+0x5c>
  802092:	b8 00 00 00 00       	mov    $0x0,%eax
  802097:	eb 69                	jmp    802102 <fd_close+0xc7>
  802099:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80209d:	8b 00                	mov    (%rax),%eax
  80209f:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8020a3:	48 89 d6             	mov    %rdx,%rsi
  8020a6:	89 c7                	mov    %eax,%edi
  8020a8:	48 b8 04 21 80 00 00 	movabs $0x802104,%rax
  8020af:	00 00 00 
  8020b2:	ff d0                	callq  *%rax
  8020b4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8020b7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8020bb:	78 2a                	js     8020e7 <fd_close+0xac>
  8020bd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8020c1:	48 8b 40 20          	mov    0x20(%rax),%rax
  8020c5:	48 85 c0             	test   %rax,%rax
  8020c8:	74 16                	je     8020e0 <fd_close+0xa5>
  8020ca:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8020ce:	48 8b 40 20          	mov    0x20(%rax),%rax
  8020d2:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8020d6:	48 89 d7             	mov    %rdx,%rdi
  8020d9:	ff d0                	callq  *%rax
  8020db:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8020de:	eb 07                	jmp    8020e7 <fd_close+0xac>
  8020e0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8020e7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8020eb:	48 89 c6             	mov    %rax,%rsi
  8020ee:	bf 00 00 00 00       	mov    $0x0,%edi
  8020f3:	48 b8 92 1a 80 00 00 	movabs $0x801a92,%rax
  8020fa:	00 00 00 
  8020fd:	ff d0                	callq  *%rax
  8020ff:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802102:	c9                   	leaveq 
  802103:	c3                   	retq   

0000000000802104 <dev_lookup>:
  802104:	55                   	push   %rbp
  802105:	48 89 e5             	mov    %rsp,%rbp
  802108:	48 83 ec 20          	sub    $0x20,%rsp
  80210c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80210f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802113:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80211a:	eb 41                	jmp    80215d <dev_lookup+0x59>
  80211c:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802123:	00 00 00 
  802126:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802129:	48 63 d2             	movslq %edx,%rdx
  80212c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802130:	8b 00                	mov    (%rax),%eax
  802132:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  802135:	75 22                	jne    802159 <dev_lookup+0x55>
  802137:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  80213e:	00 00 00 
  802141:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802144:	48 63 d2             	movslq %edx,%rdx
  802147:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  80214b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80214f:	48 89 10             	mov    %rdx,(%rax)
  802152:	b8 00 00 00 00       	mov    $0x0,%eax
  802157:	eb 60                	jmp    8021b9 <dev_lookup+0xb5>
  802159:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80215d:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802164:	00 00 00 
  802167:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80216a:	48 63 d2             	movslq %edx,%rdx
  80216d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802171:	48 85 c0             	test   %rax,%rax
  802174:	75 a6                	jne    80211c <dev_lookup+0x18>
  802176:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  80217d:	00 00 00 
  802180:	48 8b 00             	mov    (%rax),%rax
  802183:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802189:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80218c:	89 c6                	mov    %eax,%esi
  80218e:	48 bf f8 4d 80 00 00 	movabs $0x804df8,%rdi
  802195:	00 00 00 
  802198:	b8 00 00 00 00       	mov    $0x0,%eax
  80219d:	48 b9 03 05 80 00 00 	movabs $0x800503,%rcx
  8021a4:	00 00 00 
  8021a7:	ff d1                	callq  *%rcx
  8021a9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8021ad:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  8021b4:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8021b9:	c9                   	leaveq 
  8021ba:	c3                   	retq   

00000000008021bb <close>:
  8021bb:	55                   	push   %rbp
  8021bc:	48 89 e5             	mov    %rsp,%rbp
  8021bf:	48 83 ec 20          	sub    $0x20,%rsp
  8021c3:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8021c6:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8021ca:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8021cd:	48 89 d6             	mov    %rdx,%rsi
  8021d0:	89 c7                	mov    %eax,%edi
  8021d2:	48 b8 ab 1f 80 00 00 	movabs $0x801fab,%rax
  8021d9:	00 00 00 
  8021dc:	ff d0                	callq  *%rax
  8021de:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8021e1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8021e5:	79 05                	jns    8021ec <close+0x31>
  8021e7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8021ea:	eb 18                	jmp    802204 <close+0x49>
  8021ec:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8021f0:	be 01 00 00 00       	mov    $0x1,%esi
  8021f5:	48 89 c7             	mov    %rax,%rdi
  8021f8:	48 b8 3b 20 80 00 00 	movabs $0x80203b,%rax
  8021ff:	00 00 00 
  802202:	ff d0                	callq  *%rax
  802204:	c9                   	leaveq 
  802205:	c3                   	retq   

0000000000802206 <close_all>:
  802206:	55                   	push   %rbp
  802207:	48 89 e5             	mov    %rsp,%rbp
  80220a:	48 83 ec 10          	sub    $0x10,%rsp
  80220e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802215:	eb 15                	jmp    80222c <close_all+0x26>
  802217:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80221a:	89 c7                	mov    %eax,%edi
  80221c:	48 b8 bb 21 80 00 00 	movabs $0x8021bb,%rax
  802223:	00 00 00 
  802226:	ff d0                	callq  *%rax
  802228:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80222c:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802230:	7e e5                	jle    802217 <close_all+0x11>
  802232:	c9                   	leaveq 
  802233:	c3                   	retq   

0000000000802234 <dup>:
  802234:	55                   	push   %rbp
  802235:	48 89 e5             	mov    %rsp,%rbp
  802238:	48 83 ec 40          	sub    $0x40,%rsp
  80223c:	89 7d cc             	mov    %edi,-0x34(%rbp)
  80223f:	89 75 c8             	mov    %esi,-0x38(%rbp)
  802242:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  802246:	8b 45 cc             	mov    -0x34(%rbp),%eax
  802249:	48 89 d6             	mov    %rdx,%rsi
  80224c:	89 c7                	mov    %eax,%edi
  80224e:	48 b8 ab 1f 80 00 00 	movabs $0x801fab,%rax
  802255:	00 00 00 
  802258:	ff d0                	callq  *%rax
  80225a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80225d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802261:	79 08                	jns    80226b <dup+0x37>
  802263:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802266:	e9 70 01 00 00       	jmpq   8023db <dup+0x1a7>
  80226b:	8b 45 c8             	mov    -0x38(%rbp),%eax
  80226e:	89 c7                	mov    %eax,%edi
  802270:	48 b8 bb 21 80 00 00 	movabs $0x8021bb,%rax
  802277:	00 00 00 
  80227a:	ff d0                	callq  *%rax
  80227c:	8b 45 c8             	mov    -0x38(%rbp),%eax
  80227f:	48 98                	cltq   
  802281:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802287:	48 c1 e0 0c          	shl    $0xc,%rax
  80228b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80228f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802293:	48 89 c7             	mov    %rax,%rdi
  802296:	48 b8 e8 1e 80 00 00 	movabs $0x801ee8,%rax
  80229d:	00 00 00 
  8022a0:	ff d0                	callq  *%rax
  8022a2:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8022a6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8022aa:	48 89 c7             	mov    %rax,%rdi
  8022ad:	48 b8 e8 1e 80 00 00 	movabs $0x801ee8,%rax
  8022b4:	00 00 00 
  8022b7:	ff d0                	callq  *%rax
  8022b9:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8022bd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8022c1:	48 c1 e8 15          	shr    $0x15,%rax
  8022c5:	48 89 c2             	mov    %rax,%rdx
  8022c8:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8022cf:	01 00 00 
  8022d2:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8022d6:	83 e0 01             	and    $0x1,%eax
  8022d9:	48 85 c0             	test   %rax,%rax
  8022dc:	74 73                	je     802351 <dup+0x11d>
  8022de:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8022e2:	48 c1 e8 0c          	shr    $0xc,%rax
  8022e6:	48 89 c2             	mov    %rax,%rdx
  8022e9:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8022f0:	01 00 00 
  8022f3:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8022f7:	83 e0 01             	and    $0x1,%eax
  8022fa:	48 85 c0             	test   %rax,%rax
  8022fd:	74 52                	je     802351 <dup+0x11d>
  8022ff:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802303:	48 c1 e8 0c          	shr    $0xc,%rax
  802307:	48 89 c2             	mov    %rax,%rdx
  80230a:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802311:	01 00 00 
  802314:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802318:	25 07 0e 00 00       	and    $0xe07,%eax
  80231d:	89 c1                	mov    %eax,%ecx
  80231f:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802323:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802327:	41 89 c8             	mov    %ecx,%r8d
  80232a:	48 89 d1             	mov    %rdx,%rcx
  80232d:	ba 00 00 00 00       	mov    $0x0,%edx
  802332:	48 89 c6             	mov    %rax,%rsi
  802335:	bf 00 00 00 00       	mov    $0x0,%edi
  80233a:	48 b8 37 1a 80 00 00 	movabs $0x801a37,%rax
  802341:	00 00 00 
  802344:	ff d0                	callq  *%rax
  802346:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802349:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80234d:	79 02                	jns    802351 <dup+0x11d>
  80234f:	eb 57                	jmp    8023a8 <dup+0x174>
  802351:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802355:	48 c1 e8 0c          	shr    $0xc,%rax
  802359:	48 89 c2             	mov    %rax,%rdx
  80235c:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802363:	01 00 00 
  802366:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80236a:	25 07 0e 00 00       	and    $0xe07,%eax
  80236f:	89 c1                	mov    %eax,%ecx
  802371:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802375:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802379:	41 89 c8             	mov    %ecx,%r8d
  80237c:	48 89 d1             	mov    %rdx,%rcx
  80237f:	ba 00 00 00 00       	mov    $0x0,%edx
  802384:	48 89 c6             	mov    %rax,%rsi
  802387:	bf 00 00 00 00       	mov    $0x0,%edi
  80238c:	48 b8 37 1a 80 00 00 	movabs $0x801a37,%rax
  802393:	00 00 00 
  802396:	ff d0                	callq  *%rax
  802398:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80239b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80239f:	79 02                	jns    8023a3 <dup+0x16f>
  8023a1:	eb 05                	jmp    8023a8 <dup+0x174>
  8023a3:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8023a6:	eb 33                	jmp    8023db <dup+0x1a7>
  8023a8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8023ac:	48 89 c6             	mov    %rax,%rsi
  8023af:	bf 00 00 00 00       	mov    $0x0,%edi
  8023b4:	48 b8 92 1a 80 00 00 	movabs $0x801a92,%rax
  8023bb:	00 00 00 
  8023be:	ff d0                	callq  *%rax
  8023c0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8023c4:	48 89 c6             	mov    %rax,%rsi
  8023c7:	bf 00 00 00 00       	mov    $0x0,%edi
  8023cc:	48 b8 92 1a 80 00 00 	movabs $0x801a92,%rax
  8023d3:	00 00 00 
  8023d6:	ff d0                	callq  *%rax
  8023d8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023db:	c9                   	leaveq 
  8023dc:	c3                   	retq   

00000000008023dd <read>:
  8023dd:	55                   	push   %rbp
  8023de:	48 89 e5             	mov    %rsp,%rbp
  8023e1:	48 83 ec 40          	sub    $0x40,%rsp
  8023e5:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8023e8:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8023ec:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8023f0:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8023f4:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8023f7:	48 89 d6             	mov    %rdx,%rsi
  8023fa:	89 c7                	mov    %eax,%edi
  8023fc:	48 b8 ab 1f 80 00 00 	movabs $0x801fab,%rax
  802403:	00 00 00 
  802406:	ff d0                	callq  *%rax
  802408:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80240b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80240f:	78 24                	js     802435 <read+0x58>
  802411:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802415:	8b 00                	mov    (%rax),%eax
  802417:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80241b:	48 89 d6             	mov    %rdx,%rsi
  80241e:	89 c7                	mov    %eax,%edi
  802420:	48 b8 04 21 80 00 00 	movabs $0x802104,%rax
  802427:	00 00 00 
  80242a:	ff d0                	callq  *%rax
  80242c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80242f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802433:	79 05                	jns    80243a <read+0x5d>
  802435:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802438:	eb 76                	jmp    8024b0 <read+0xd3>
  80243a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80243e:	8b 40 08             	mov    0x8(%rax),%eax
  802441:	83 e0 03             	and    $0x3,%eax
  802444:	83 f8 01             	cmp    $0x1,%eax
  802447:	75 3a                	jne    802483 <read+0xa6>
  802449:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  802450:	00 00 00 
  802453:	48 8b 00             	mov    (%rax),%rax
  802456:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80245c:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80245f:	89 c6                	mov    %eax,%esi
  802461:	48 bf 17 4e 80 00 00 	movabs $0x804e17,%rdi
  802468:	00 00 00 
  80246b:	b8 00 00 00 00       	mov    $0x0,%eax
  802470:	48 b9 03 05 80 00 00 	movabs $0x800503,%rcx
  802477:	00 00 00 
  80247a:	ff d1                	callq  *%rcx
  80247c:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802481:	eb 2d                	jmp    8024b0 <read+0xd3>
  802483:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802487:	48 8b 40 10          	mov    0x10(%rax),%rax
  80248b:	48 85 c0             	test   %rax,%rax
  80248e:	75 07                	jne    802497 <read+0xba>
  802490:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802495:	eb 19                	jmp    8024b0 <read+0xd3>
  802497:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80249b:	48 8b 40 10          	mov    0x10(%rax),%rax
  80249f:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8024a3:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8024a7:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  8024ab:	48 89 cf             	mov    %rcx,%rdi
  8024ae:	ff d0                	callq  *%rax
  8024b0:	c9                   	leaveq 
  8024b1:	c3                   	retq   

00000000008024b2 <readn>:
  8024b2:	55                   	push   %rbp
  8024b3:	48 89 e5             	mov    %rsp,%rbp
  8024b6:	48 83 ec 30          	sub    $0x30,%rsp
  8024ba:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8024bd:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8024c1:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8024c5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8024cc:	eb 49                	jmp    802517 <readn+0x65>
  8024ce:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024d1:	48 98                	cltq   
  8024d3:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8024d7:	48 29 c2             	sub    %rax,%rdx
  8024da:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024dd:	48 63 c8             	movslq %eax,%rcx
  8024e0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8024e4:	48 01 c1             	add    %rax,%rcx
  8024e7:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8024ea:	48 89 ce             	mov    %rcx,%rsi
  8024ed:	89 c7                	mov    %eax,%edi
  8024ef:	48 b8 dd 23 80 00 00 	movabs $0x8023dd,%rax
  8024f6:	00 00 00 
  8024f9:	ff d0                	callq  *%rax
  8024fb:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8024fe:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802502:	79 05                	jns    802509 <readn+0x57>
  802504:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802507:	eb 1c                	jmp    802525 <readn+0x73>
  802509:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80250d:	75 02                	jne    802511 <readn+0x5f>
  80250f:	eb 11                	jmp    802522 <readn+0x70>
  802511:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802514:	01 45 fc             	add    %eax,-0x4(%rbp)
  802517:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80251a:	48 98                	cltq   
  80251c:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802520:	72 ac                	jb     8024ce <readn+0x1c>
  802522:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802525:	c9                   	leaveq 
  802526:	c3                   	retq   

0000000000802527 <write>:
  802527:	55                   	push   %rbp
  802528:	48 89 e5             	mov    %rsp,%rbp
  80252b:	48 83 ec 40          	sub    $0x40,%rsp
  80252f:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802532:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802536:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80253a:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80253e:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802541:	48 89 d6             	mov    %rdx,%rsi
  802544:	89 c7                	mov    %eax,%edi
  802546:	48 b8 ab 1f 80 00 00 	movabs $0x801fab,%rax
  80254d:	00 00 00 
  802550:	ff d0                	callq  *%rax
  802552:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802555:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802559:	78 24                	js     80257f <write+0x58>
  80255b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80255f:	8b 00                	mov    (%rax),%eax
  802561:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802565:	48 89 d6             	mov    %rdx,%rsi
  802568:	89 c7                	mov    %eax,%edi
  80256a:	48 b8 04 21 80 00 00 	movabs $0x802104,%rax
  802571:	00 00 00 
  802574:	ff d0                	callq  *%rax
  802576:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802579:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80257d:	79 05                	jns    802584 <write+0x5d>
  80257f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802582:	eb 75                	jmp    8025f9 <write+0xd2>
  802584:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802588:	8b 40 08             	mov    0x8(%rax),%eax
  80258b:	83 e0 03             	and    $0x3,%eax
  80258e:	85 c0                	test   %eax,%eax
  802590:	75 3a                	jne    8025cc <write+0xa5>
  802592:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  802599:	00 00 00 
  80259c:	48 8b 00             	mov    (%rax),%rax
  80259f:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8025a5:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8025a8:	89 c6                	mov    %eax,%esi
  8025aa:	48 bf 33 4e 80 00 00 	movabs $0x804e33,%rdi
  8025b1:	00 00 00 
  8025b4:	b8 00 00 00 00       	mov    $0x0,%eax
  8025b9:	48 b9 03 05 80 00 00 	movabs $0x800503,%rcx
  8025c0:	00 00 00 
  8025c3:	ff d1                	callq  *%rcx
  8025c5:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8025ca:	eb 2d                	jmp    8025f9 <write+0xd2>
  8025cc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8025d0:	48 8b 40 18          	mov    0x18(%rax),%rax
  8025d4:	48 85 c0             	test   %rax,%rax
  8025d7:	75 07                	jne    8025e0 <write+0xb9>
  8025d9:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8025de:	eb 19                	jmp    8025f9 <write+0xd2>
  8025e0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8025e4:	48 8b 40 18          	mov    0x18(%rax),%rax
  8025e8:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8025ec:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8025f0:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  8025f4:	48 89 cf             	mov    %rcx,%rdi
  8025f7:	ff d0                	callq  *%rax
  8025f9:	c9                   	leaveq 
  8025fa:	c3                   	retq   

00000000008025fb <seek>:
  8025fb:	55                   	push   %rbp
  8025fc:	48 89 e5             	mov    %rsp,%rbp
  8025ff:	48 83 ec 18          	sub    $0x18,%rsp
  802603:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802606:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802609:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80260d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802610:	48 89 d6             	mov    %rdx,%rsi
  802613:	89 c7                	mov    %eax,%edi
  802615:	48 b8 ab 1f 80 00 00 	movabs $0x801fab,%rax
  80261c:	00 00 00 
  80261f:	ff d0                	callq  *%rax
  802621:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802624:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802628:	79 05                	jns    80262f <seek+0x34>
  80262a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80262d:	eb 0f                	jmp    80263e <seek+0x43>
  80262f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802633:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802636:	89 50 04             	mov    %edx,0x4(%rax)
  802639:	b8 00 00 00 00       	mov    $0x0,%eax
  80263e:	c9                   	leaveq 
  80263f:	c3                   	retq   

0000000000802640 <ftruncate>:
  802640:	55                   	push   %rbp
  802641:	48 89 e5             	mov    %rsp,%rbp
  802644:	48 83 ec 30          	sub    $0x30,%rsp
  802648:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80264b:	89 75 d8             	mov    %esi,-0x28(%rbp)
  80264e:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802652:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802655:	48 89 d6             	mov    %rdx,%rsi
  802658:	89 c7                	mov    %eax,%edi
  80265a:	48 b8 ab 1f 80 00 00 	movabs $0x801fab,%rax
  802661:	00 00 00 
  802664:	ff d0                	callq  *%rax
  802666:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802669:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80266d:	78 24                	js     802693 <ftruncate+0x53>
  80266f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802673:	8b 00                	mov    (%rax),%eax
  802675:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802679:	48 89 d6             	mov    %rdx,%rsi
  80267c:	89 c7                	mov    %eax,%edi
  80267e:	48 b8 04 21 80 00 00 	movabs $0x802104,%rax
  802685:	00 00 00 
  802688:	ff d0                	callq  *%rax
  80268a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80268d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802691:	79 05                	jns    802698 <ftruncate+0x58>
  802693:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802696:	eb 72                	jmp    80270a <ftruncate+0xca>
  802698:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80269c:	8b 40 08             	mov    0x8(%rax),%eax
  80269f:	83 e0 03             	and    $0x3,%eax
  8026a2:	85 c0                	test   %eax,%eax
  8026a4:	75 3a                	jne    8026e0 <ftruncate+0xa0>
  8026a6:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  8026ad:	00 00 00 
  8026b0:	48 8b 00             	mov    (%rax),%rax
  8026b3:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8026b9:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8026bc:	89 c6                	mov    %eax,%esi
  8026be:	48 bf 50 4e 80 00 00 	movabs $0x804e50,%rdi
  8026c5:	00 00 00 
  8026c8:	b8 00 00 00 00       	mov    $0x0,%eax
  8026cd:	48 b9 03 05 80 00 00 	movabs $0x800503,%rcx
  8026d4:	00 00 00 
  8026d7:	ff d1                	callq  *%rcx
  8026d9:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8026de:	eb 2a                	jmp    80270a <ftruncate+0xca>
  8026e0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8026e4:	48 8b 40 30          	mov    0x30(%rax),%rax
  8026e8:	48 85 c0             	test   %rax,%rax
  8026eb:	75 07                	jne    8026f4 <ftruncate+0xb4>
  8026ed:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8026f2:	eb 16                	jmp    80270a <ftruncate+0xca>
  8026f4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8026f8:	48 8b 40 30          	mov    0x30(%rax),%rax
  8026fc:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802700:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  802703:	89 ce                	mov    %ecx,%esi
  802705:	48 89 d7             	mov    %rdx,%rdi
  802708:	ff d0                	callq  *%rax
  80270a:	c9                   	leaveq 
  80270b:	c3                   	retq   

000000000080270c <fstat>:
  80270c:	55                   	push   %rbp
  80270d:	48 89 e5             	mov    %rsp,%rbp
  802710:	48 83 ec 30          	sub    $0x30,%rsp
  802714:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802717:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80271b:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80271f:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802722:	48 89 d6             	mov    %rdx,%rsi
  802725:	89 c7                	mov    %eax,%edi
  802727:	48 b8 ab 1f 80 00 00 	movabs $0x801fab,%rax
  80272e:	00 00 00 
  802731:	ff d0                	callq  *%rax
  802733:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802736:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80273a:	78 24                	js     802760 <fstat+0x54>
  80273c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802740:	8b 00                	mov    (%rax),%eax
  802742:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802746:	48 89 d6             	mov    %rdx,%rsi
  802749:	89 c7                	mov    %eax,%edi
  80274b:	48 b8 04 21 80 00 00 	movabs $0x802104,%rax
  802752:	00 00 00 
  802755:	ff d0                	callq  *%rax
  802757:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80275a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80275e:	79 05                	jns    802765 <fstat+0x59>
  802760:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802763:	eb 5e                	jmp    8027c3 <fstat+0xb7>
  802765:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802769:	48 8b 40 28          	mov    0x28(%rax),%rax
  80276d:	48 85 c0             	test   %rax,%rax
  802770:	75 07                	jne    802779 <fstat+0x6d>
  802772:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802777:	eb 4a                	jmp    8027c3 <fstat+0xb7>
  802779:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80277d:	c6 00 00             	movb   $0x0,(%rax)
  802780:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802784:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  80278b:	00 00 00 
  80278e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802792:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  802799:	00 00 00 
  80279c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8027a0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8027a4:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  8027ab:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8027af:	48 8b 40 28          	mov    0x28(%rax),%rax
  8027b3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8027b7:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  8027bb:	48 89 ce             	mov    %rcx,%rsi
  8027be:	48 89 d7             	mov    %rdx,%rdi
  8027c1:	ff d0                	callq  *%rax
  8027c3:	c9                   	leaveq 
  8027c4:	c3                   	retq   

00000000008027c5 <stat>:
  8027c5:	55                   	push   %rbp
  8027c6:	48 89 e5             	mov    %rsp,%rbp
  8027c9:	48 83 ec 20          	sub    $0x20,%rsp
  8027cd:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8027d1:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8027d5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8027d9:	be 00 00 00 00       	mov    $0x0,%esi
  8027de:	48 89 c7             	mov    %rax,%rdi
  8027e1:	48 b8 b3 28 80 00 00 	movabs $0x8028b3,%rax
  8027e8:	00 00 00 
  8027eb:	ff d0                	callq  *%rax
  8027ed:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8027f0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8027f4:	79 05                	jns    8027fb <stat+0x36>
  8027f6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8027f9:	eb 2f                	jmp    80282a <stat+0x65>
  8027fb:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8027ff:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802802:	48 89 d6             	mov    %rdx,%rsi
  802805:	89 c7                	mov    %eax,%edi
  802807:	48 b8 0c 27 80 00 00 	movabs $0x80270c,%rax
  80280e:	00 00 00 
  802811:	ff d0                	callq  *%rax
  802813:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802816:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802819:	89 c7                	mov    %eax,%edi
  80281b:	48 b8 bb 21 80 00 00 	movabs $0x8021bb,%rax
  802822:	00 00 00 
  802825:	ff d0                	callq  *%rax
  802827:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80282a:	c9                   	leaveq 
  80282b:	c3                   	retq   

000000000080282c <fsipc>:
  80282c:	55                   	push   %rbp
  80282d:	48 89 e5             	mov    %rsp,%rbp
  802830:	48 83 ec 10          	sub    $0x10,%rsp
  802834:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802837:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80283b:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802842:	00 00 00 
  802845:	8b 00                	mov    (%rax),%eax
  802847:	85 c0                	test   %eax,%eax
  802849:	75 1d                	jne    802868 <fsipc+0x3c>
  80284b:	bf 01 00 00 00       	mov    $0x1,%edi
  802850:	48 b8 e3 41 80 00 00 	movabs $0x8041e3,%rax
  802857:	00 00 00 
  80285a:	ff d0                	callq  *%rax
  80285c:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  802863:	00 00 00 
  802866:	89 02                	mov    %eax,(%rdx)
  802868:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80286f:	00 00 00 
  802872:	8b 00                	mov    (%rax),%eax
  802874:	8b 75 fc             	mov    -0x4(%rbp),%esi
  802877:	b9 07 00 00 00       	mov    $0x7,%ecx
  80287c:	48 ba 00 90 80 00 00 	movabs $0x809000,%rdx
  802883:	00 00 00 
  802886:	89 c7                	mov    %eax,%edi
  802888:	48 b8 4d 41 80 00 00 	movabs $0x80414d,%rax
  80288f:	00 00 00 
  802892:	ff d0                	callq  *%rax
  802894:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802898:	ba 00 00 00 00       	mov    $0x0,%edx
  80289d:	48 89 c6             	mov    %rax,%rsi
  8028a0:	bf 00 00 00 00       	mov    $0x0,%edi
  8028a5:	48 b8 8c 40 80 00 00 	movabs $0x80408c,%rax
  8028ac:	00 00 00 
  8028af:	ff d0                	callq  *%rax
  8028b1:	c9                   	leaveq 
  8028b2:	c3                   	retq   

00000000008028b3 <open>:
  8028b3:	55                   	push   %rbp
  8028b4:	48 89 e5             	mov    %rsp,%rbp
  8028b7:	48 83 ec 20          	sub    $0x20,%rsp
  8028bb:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8028bf:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8028c2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8028c6:	48 89 c7             	mov    %rax,%rdi
  8028c9:	48 b8 4c 10 80 00 00 	movabs $0x80104c,%rax
  8028d0:	00 00 00 
  8028d3:	ff d0                	callq  *%rax
  8028d5:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  8028da:	7e 0a                	jle    8028e6 <open+0x33>
  8028dc:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  8028e1:	e9 a5 00 00 00       	jmpq   80298b <open+0xd8>
  8028e6:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8028ea:	48 89 c7             	mov    %rax,%rdi
  8028ed:	48 b8 13 1f 80 00 00 	movabs $0x801f13,%rax
  8028f4:	00 00 00 
  8028f7:	ff d0                	callq  *%rax
  8028f9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8028fc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802900:	79 08                	jns    80290a <open+0x57>
  802902:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802905:	e9 81 00 00 00       	jmpq   80298b <open+0xd8>
  80290a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80290e:	48 89 c6             	mov    %rax,%rsi
  802911:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  802918:	00 00 00 
  80291b:	48 b8 b8 10 80 00 00 	movabs $0x8010b8,%rax
  802922:	00 00 00 
  802925:	ff d0                	callq  *%rax
  802927:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80292e:	00 00 00 
  802931:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  802934:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  80293a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80293e:	48 89 c6             	mov    %rax,%rsi
  802941:	bf 01 00 00 00       	mov    $0x1,%edi
  802946:	48 b8 2c 28 80 00 00 	movabs $0x80282c,%rax
  80294d:	00 00 00 
  802950:	ff d0                	callq  *%rax
  802952:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802955:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802959:	79 1d                	jns    802978 <open+0xc5>
  80295b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80295f:	be 00 00 00 00       	mov    $0x0,%esi
  802964:	48 89 c7             	mov    %rax,%rdi
  802967:	48 b8 3b 20 80 00 00 	movabs $0x80203b,%rax
  80296e:	00 00 00 
  802971:	ff d0                	callq  *%rax
  802973:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802976:	eb 13                	jmp    80298b <open+0xd8>
  802978:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80297c:	48 89 c7             	mov    %rax,%rdi
  80297f:	48 b8 c5 1e 80 00 00 	movabs $0x801ec5,%rax
  802986:	00 00 00 
  802989:	ff d0                	callq  *%rax
  80298b:	c9                   	leaveq 
  80298c:	c3                   	retq   

000000000080298d <devfile_flush>:
  80298d:	55                   	push   %rbp
  80298e:	48 89 e5             	mov    %rsp,%rbp
  802991:	48 83 ec 10          	sub    $0x10,%rsp
  802995:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802999:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80299d:	8b 50 0c             	mov    0xc(%rax),%edx
  8029a0:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8029a7:	00 00 00 
  8029aa:	89 10                	mov    %edx,(%rax)
  8029ac:	be 00 00 00 00       	mov    $0x0,%esi
  8029b1:	bf 06 00 00 00       	mov    $0x6,%edi
  8029b6:	48 b8 2c 28 80 00 00 	movabs $0x80282c,%rax
  8029bd:	00 00 00 
  8029c0:	ff d0                	callq  *%rax
  8029c2:	c9                   	leaveq 
  8029c3:	c3                   	retq   

00000000008029c4 <devfile_read>:
  8029c4:	55                   	push   %rbp
  8029c5:	48 89 e5             	mov    %rsp,%rbp
  8029c8:	48 83 ec 30          	sub    $0x30,%rsp
  8029cc:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8029d0:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8029d4:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8029d8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8029dc:	8b 50 0c             	mov    0xc(%rax),%edx
  8029df:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8029e6:	00 00 00 
  8029e9:	89 10                	mov    %edx,(%rax)
  8029eb:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8029f2:	00 00 00 
  8029f5:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8029f9:	48 89 50 08          	mov    %rdx,0x8(%rax)
  8029fd:	be 00 00 00 00       	mov    $0x0,%esi
  802a02:	bf 03 00 00 00       	mov    $0x3,%edi
  802a07:	48 b8 2c 28 80 00 00 	movabs $0x80282c,%rax
  802a0e:	00 00 00 
  802a11:	ff d0                	callq  *%rax
  802a13:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802a16:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802a1a:	79 08                	jns    802a24 <devfile_read+0x60>
  802a1c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a1f:	e9 a4 00 00 00       	jmpq   802ac8 <devfile_read+0x104>
  802a24:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a27:	48 98                	cltq   
  802a29:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802a2d:	76 35                	jbe    802a64 <devfile_read+0xa0>
  802a2f:	48 b9 76 4e 80 00 00 	movabs $0x804e76,%rcx
  802a36:	00 00 00 
  802a39:	48 ba 7d 4e 80 00 00 	movabs $0x804e7d,%rdx
  802a40:	00 00 00 
  802a43:	be 89 00 00 00       	mov    $0x89,%esi
  802a48:	48 bf 92 4e 80 00 00 	movabs $0x804e92,%rdi
  802a4f:	00 00 00 
  802a52:	b8 00 00 00 00       	mov    $0x0,%eax
  802a57:	49 b8 78 3f 80 00 00 	movabs $0x803f78,%r8
  802a5e:	00 00 00 
  802a61:	41 ff d0             	callq  *%r8
  802a64:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  802a6b:	7e 35                	jle    802aa2 <devfile_read+0xde>
  802a6d:	48 b9 a0 4e 80 00 00 	movabs $0x804ea0,%rcx
  802a74:	00 00 00 
  802a77:	48 ba 7d 4e 80 00 00 	movabs $0x804e7d,%rdx
  802a7e:	00 00 00 
  802a81:	be 8a 00 00 00       	mov    $0x8a,%esi
  802a86:	48 bf 92 4e 80 00 00 	movabs $0x804e92,%rdi
  802a8d:	00 00 00 
  802a90:	b8 00 00 00 00       	mov    $0x0,%eax
  802a95:	49 b8 78 3f 80 00 00 	movabs $0x803f78,%r8
  802a9c:	00 00 00 
  802a9f:	41 ff d0             	callq  *%r8
  802aa2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802aa5:	48 63 d0             	movslq %eax,%rdx
  802aa8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802aac:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  802ab3:	00 00 00 
  802ab6:	48 89 c7             	mov    %rax,%rdi
  802ab9:	48 b8 dc 13 80 00 00 	movabs $0x8013dc,%rax
  802ac0:	00 00 00 
  802ac3:	ff d0                	callq  *%rax
  802ac5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ac8:	c9                   	leaveq 
  802ac9:	c3                   	retq   

0000000000802aca <devfile_write>:
  802aca:	55                   	push   %rbp
  802acb:	48 89 e5             	mov    %rsp,%rbp
  802ace:	48 83 ec 40          	sub    $0x40,%rsp
  802ad2:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802ad6:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802ada:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802ade:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  802ae2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802ae6:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  802aed:	00 
  802aee:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802af2:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  802af6:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  802afb:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  802aff:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802b03:	8b 50 0c             	mov    0xc(%rax),%edx
  802b06:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802b0d:	00 00 00 
  802b10:	89 10                	mov    %edx,(%rax)
  802b12:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802b19:	00 00 00 
  802b1c:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802b20:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802b24:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802b28:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802b2c:	48 89 c6             	mov    %rax,%rsi
  802b2f:	48 bf 10 90 80 00 00 	movabs $0x809010,%rdi
  802b36:	00 00 00 
  802b39:	48 b8 dc 13 80 00 00 	movabs $0x8013dc,%rax
  802b40:	00 00 00 
  802b43:	ff d0                	callq  *%rax
  802b45:	be 00 00 00 00       	mov    $0x0,%esi
  802b4a:	bf 04 00 00 00       	mov    $0x4,%edi
  802b4f:	48 b8 2c 28 80 00 00 	movabs $0x80282c,%rax
  802b56:	00 00 00 
  802b59:	ff d0                	callq  *%rax
  802b5b:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802b5e:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802b62:	79 05                	jns    802b69 <devfile_write+0x9f>
  802b64:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802b67:	eb 43                	jmp    802bac <devfile_write+0xe2>
  802b69:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802b6c:	48 98                	cltq   
  802b6e:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  802b72:	76 35                	jbe    802ba9 <devfile_write+0xdf>
  802b74:	48 b9 76 4e 80 00 00 	movabs $0x804e76,%rcx
  802b7b:	00 00 00 
  802b7e:	48 ba 7d 4e 80 00 00 	movabs $0x804e7d,%rdx
  802b85:	00 00 00 
  802b88:	be a8 00 00 00       	mov    $0xa8,%esi
  802b8d:	48 bf 92 4e 80 00 00 	movabs $0x804e92,%rdi
  802b94:	00 00 00 
  802b97:	b8 00 00 00 00       	mov    $0x0,%eax
  802b9c:	49 b8 78 3f 80 00 00 	movabs $0x803f78,%r8
  802ba3:	00 00 00 
  802ba6:	41 ff d0             	callq  *%r8
  802ba9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802bac:	c9                   	leaveq 
  802bad:	c3                   	retq   

0000000000802bae <devfile_stat>:
  802bae:	55                   	push   %rbp
  802baf:	48 89 e5             	mov    %rsp,%rbp
  802bb2:	48 83 ec 20          	sub    $0x20,%rsp
  802bb6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802bba:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802bbe:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802bc2:	8b 50 0c             	mov    0xc(%rax),%edx
  802bc5:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802bcc:	00 00 00 
  802bcf:	89 10                	mov    %edx,(%rax)
  802bd1:	be 00 00 00 00       	mov    $0x0,%esi
  802bd6:	bf 05 00 00 00       	mov    $0x5,%edi
  802bdb:	48 b8 2c 28 80 00 00 	movabs $0x80282c,%rax
  802be2:	00 00 00 
  802be5:	ff d0                	callq  *%rax
  802be7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802bea:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802bee:	79 05                	jns    802bf5 <devfile_stat+0x47>
  802bf0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802bf3:	eb 56                	jmp    802c4b <devfile_stat+0x9d>
  802bf5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802bf9:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  802c00:	00 00 00 
  802c03:	48 89 c7             	mov    %rax,%rdi
  802c06:	48 b8 b8 10 80 00 00 	movabs $0x8010b8,%rax
  802c0d:	00 00 00 
  802c10:	ff d0                	callq  *%rax
  802c12:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802c19:	00 00 00 
  802c1c:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  802c22:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802c26:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  802c2c:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802c33:	00 00 00 
  802c36:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  802c3c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802c40:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  802c46:	b8 00 00 00 00       	mov    $0x0,%eax
  802c4b:	c9                   	leaveq 
  802c4c:	c3                   	retq   

0000000000802c4d <devfile_trunc>:
  802c4d:	55                   	push   %rbp
  802c4e:	48 89 e5             	mov    %rsp,%rbp
  802c51:	48 83 ec 10          	sub    $0x10,%rsp
  802c55:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802c59:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802c5c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802c60:	8b 50 0c             	mov    0xc(%rax),%edx
  802c63:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802c6a:	00 00 00 
  802c6d:	89 10                	mov    %edx,(%rax)
  802c6f:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802c76:	00 00 00 
  802c79:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802c7c:	89 50 04             	mov    %edx,0x4(%rax)
  802c7f:	be 00 00 00 00       	mov    $0x0,%esi
  802c84:	bf 02 00 00 00       	mov    $0x2,%edi
  802c89:	48 b8 2c 28 80 00 00 	movabs $0x80282c,%rax
  802c90:	00 00 00 
  802c93:	ff d0                	callq  *%rax
  802c95:	c9                   	leaveq 
  802c96:	c3                   	retq   

0000000000802c97 <remove>:
  802c97:	55                   	push   %rbp
  802c98:	48 89 e5             	mov    %rsp,%rbp
  802c9b:	48 83 ec 10          	sub    $0x10,%rsp
  802c9f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802ca3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802ca7:	48 89 c7             	mov    %rax,%rdi
  802caa:	48 b8 4c 10 80 00 00 	movabs $0x80104c,%rax
  802cb1:	00 00 00 
  802cb4:	ff d0                	callq  *%rax
  802cb6:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802cbb:	7e 07                	jle    802cc4 <remove+0x2d>
  802cbd:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802cc2:	eb 33                	jmp    802cf7 <remove+0x60>
  802cc4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802cc8:	48 89 c6             	mov    %rax,%rsi
  802ccb:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  802cd2:	00 00 00 
  802cd5:	48 b8 b8 10 80 00 00 	movabs $0x8010b8,%rax
  802cdc:	00 00 00 
  802cdf:	ff d0                	callq  *%rax
  802ce1:	be 00 00 00 00       	mov    $0x0,%esi
  802ce6:	bf 07 00 00 00       	mov    $0x7,%edi
  802ceb:	48 b8 2c 28 80 00 00 	movabs $0x80282c,%rax
  802cf2:	00 00 00 
  802cf5:	ff d0                	callq  *%rax
  802cf7:	c9                   	leaveq 
  802cf8:	c3                   	retq   

0000000000802cf9 <sync>:
  802cf9:	55                   	push   %rbp
  802cfa:	48 89 e5             	mov    %rsp,%rbp
  802cfd:	be 00 00 00 00       	mov    $0x0,%esi
  802d02:	bf 08 00 00 00       	mov    $0x8,%edi
  802d07:	48 b8 2c 28 80 00 00 	movabs $0x80282c,%rax
  802d0e:	00 00 00 
  802d11:	ff d0                	callq  *%rax
  802d13:	5d                   	pop    %rbp
  802d14:	c3                   	retq   

0000000000802d15 <copy>:
  802d15:	55                   	push   %rbp
  802d16:	48 89 e5             	mov    %rsp,%rbp
  802d19:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  802d20:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  802d27:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  802d2e:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  802d35:	be 00 00 00 00       	mov    $0x0,%esi
  802d3a:	48 89 c7             	mov    %rax,%rdi
  802d3d:	48 b8 b3 28 80 00 00 	movabs $0x8028b3,%rax
  802d44:	00 00 00 
  802d47:	ff d0                	callq  *%rax
  802d49:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d4c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d50:	79 28                	jns    802d7a <copy+0x65>
  802d52:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d55:	89 c6                	mov    %eax,%esi
  802d57:	48 bf ac 4e 80 00 00 	movabs $0x804eac,%rdi
  802d5e:	00 00 00 
  802d61:	b8 00 00 00 00       	mov    $0x0,%eax
  802d66:	48 ba 03 05 80 00 00 	movabs $0x800503,%rdx
  802d6d:	00 00 00 
  802d70:	ff d2                	callq  *%rdx
  802d72:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d75:	e9 74 01 00 00       	jmpq   802eee <copy+0x1d9>
  802d7a:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  802d81:	be 01 01 00 00       	mov    $0x101,%esi
  802d86:	48 89 c7             	mov    %rax,%rdi
  802d89:	48 b8 b3 28 80 00 00 	movabs $0x8028b3,%rax
  802d90:	00 00 00 
  802d93:	ff d0                	callq  *%rax
  802d95:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802d98:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802d9c:	79 39                	jns    802dd7 <copy+0xc2>
  802d9e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802da1:	89 c6                	mov    %eax,%esi
  802da3:	48 bf c2 4e 80 00 00 	movabs $0x804ec2,%rdi
  802daa:	00 00 00 
  802dad:	b8 00 00 00 00       	mov    $0x0,%eax
  802db2:	48 ba 03 05 80 00 00 	movabs $0x800503,%rdx
  802db9:	00 00 00 
  802dbc:	ff d2                	callq  *%rdx
  802dbe:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802dc1:	89 c7                	mov    %eax,%edi
  802dc3:	48 b8 bb 21 80 00 00 	movabs $0x8021bb,%rax
  802dca:	00 00 00 
  802dcd:	ff d0                	callq  *%rax
  802dcf:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802dd2:	e9 17 01 00 00       	jmpq   802eee <copy+0x1d9>
  802dd7:	eb 74                	jmp    802e4d <copy+0x138>
  802dd9:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802ddc:	48 63 d0             	movslq %eax,%rdx
  802ddf:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802de6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802de9:	48 89 ce             	mov    %rcx,%rsi
  802dec:	89 c7                	mov    %eax,%edi
  802dee:	48 b8 27 25 80 00 00 	movabs $0x802527,%rax
  802df5:	00 00 00 
  802df8:	ff d0                	callq  *%rax
  802dfa:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802dfd:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802e01:	79 4a                	jns    802e4d <copy+0x138>
  802e03:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802e06:	89 c6                	mov    %eax,%esi
  802e08:	48 bf dc 4e 80 00 00 	movabs $0x804edc,%rdi
  802e0f:	00 00 00 
  802e12:	b8 00 00 00 00       	mov    $0x0,%eax
  802e17:	48 ba 03 05 80 00 00 	movabs $0x800503,%rdx
  802e1e:	00 00 00 
  802e21:	ff d2                	callq  *%rdx
  802e23:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e26:	89 c7                	mov    %eax,%edi
  802e28:	48 b8 bb 21 80 00 00 	movabs $0x8021bb,%rax
  802e2f:	00 00 00 
  802e32:	ff d0                	callq  *%rax
  802e34:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802e37:	89 c7                	mov    %eax,%edi
  802e39:	48 b8 bb 21 80 00 00 	movabs $0x8021bb,%rax
  802e40:	00 00 00 
  802e43:	ff d0                	callq  *%rax
  802e45:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802e48:	e9 a1 00 00 00       	jmpq   802eee <copy+0x1d9>
  802e4d:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802e54:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e57:	ba 00 02 00 00       	mov    $0x200,%edx
  802e5c:	48 89 ce             	mov    %rcx,%rsi
  802e5f:	89 c7                	mov    %eax,%edi
  802e61:	48 b8 dd 23 80 00 00 	movabs $0x8023dd,%rax
  802e68:	00 00 00 
  802e6b:	ff d0                	callq  *%rax
  802e6d:	89 45 f4             	mov    %eax,-0xc(%rbp)
  802e70:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802e74:	0f 8f 5f ff ff ff    	jg     802dd9 <copy+0xc4>
  802e7a:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802e7e:	79 47                	jns    802ec7 <copy+0x1b2>
  802e80:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802e83:	89 c6                	mov    %eax,%esi
  802e85:	48 bf ef 4e 80 00 00 	movabs $0x804eef,%rdi
  802e8c:	00 00 00 
  802e8f:	b8 00 00 00 00       	mov    $0x0,%eax
  802e94:	48 ba 03 05 80 00 00 	movabs $0x800503,%rdx
  802e9b:	00 00 00 
  802e9e:	ff d2                	callq  *%rdx
  802ea0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ea3:	89 c7                	mov    %eax,%edi
  802ea5:	48 b8 bb 21 80 00 00 	movabs $0x8021bb,%rax
  802eac:	00 00 00 
  802eaf:	ff d0                	callq  *%rax
  802eb1:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802eb4:	89 c7                	mov    %eax,%edi
  802eb6:	48 b8 bb 21 80 00 00 	movabs $0x8021bb,%rax
  802ebd:	00 00 00 
  802ec0:	ff d0                	callq  *%rax
  802ec2:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802ec5:	eb 27                	jmp    802eee <copy+0x1d9>
  802ec7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802eca:	89 c7                	mov    %eax,%edi
  802ecc:	48 b8 bb 21 80 00 00 	movabs $0x8021bb,%rax
  802ed3:	00 00 00 
  802ed6:	ff d0                	callq  *%rax
  802ed8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802edb:	89 c7                	mov    %eax,%edi
  802edd:	48 b8 bb 21 80 00 00 	movabs $0x8021bb,%rax
  802ee4:	00 00 00 
  802ee7:	ff d0                	callq  *%rax
  802ee9:	b8 00 00 00 00       	mov    $0x0,%eax
  802eee:	c9                   	leaveq 
  802eef:	c3                   	retq   

0000000000802ef0 <fd2sockid>:
  802ef0:	55                   	push   %rbp
  802ef1:	48 89 e5             	mov    %rsp,%rbp
  802ef4:	48 83 ec 20          	sub    $0x20,%rsp
  802ef8:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802efb:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802eff:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802f02:	48 89 d6             	mov    %rdx,%rsi
  802f05:	89 c7                	mov    %eax,%edi
  802f07:	48 b8 ab 1f 80 00 00 	movabs $0x801fab,%rax
  802f0e:	00 00 00 
  802f11:	ff d0                	callq  *%rax
  802f13:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f16:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f1a:	79 05                	jns    802f21 <fd2sockid+0x31>
  802f1c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f1f:	eb 24                	jmp    802f45 <fd2sockid+0x55>
  802f21:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f25:	8b 10                	mov    (%rax),%edx
  802f27:	48 b8 a0 70 80 00 00 	movabs $0x8070a0,%rax
  802f2e:	00 00 00 
  802f31:	8b 00                	mov    (%rax),%eax
  802f33:	39 c2                	cmp    %eax,%edx
  802f35:	74 07                	je     802f3e <fd2sockid+0x4e>
  802f37:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802f3c:	eb 07                	jmp    802f45 <fd2sockid+0x55>
  802f3e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f42:	8b 40 0c             	mov    0xc(%rax),%eax
  802f45:	c9                   	leaveq 
  802f46:	c3                   	retq   

0000000000802f47 <alloc_sockfd>:
  802f47:	55                   	push   %rbp
  802f48:	48 89 e5             	mov    %rsp,%rbp
  802f4b:	48 83 ec 20          	sub    $0x20,%rsp
  802f4f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802f52:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802f56:	48 89 c7             	mov    %rax,%rdi
  802f59:	48 b8 13 1f 80 00 00 	movabs $0x801f13,%rax
  802f60:	00 00 00 
  802f63:	ff d0                	callq  *%rax
  802f65:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f68:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f6c:	78 26                	js     802f94 <alloc_sockfd+0x4d>
  802f6e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f72:	ba 07 04 00 00       	mov    $0x407,%edx
  802f77:	48 89 c6             	mov    %rax,%rsi
  802f7a:	bf 00 00 00 00       	mov    $0x0,%edi
  802f7f:	48 b8 e7 19 80 00 00 	movabs $0x8019e7,%rax
  802f86:	00 00 00 
  802f89:	ff d0                	callq  *%rax
  802f8b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f8e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f92:	79 16                	jns    802faa <alloc_sockfd+0x63>
  802f94:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802f97:	89 c7                	mov    %eax,%edi
  802f99:	48 b8 54 34 80 00 00 	movabs $0x803454,%rax
  802fa0:	00 00 00 
  802fa3:	ff d0                	callq  *%rax
  802fa5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802fa8:	eb 3a                	jmp    802fe4 <alloc_sockfd+0x9d>
  802faa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802fae:	48 ba a0 70 80 00 00 	movabs $0x8070a0,%rdx
  802fb5:	00 00 00 
  802fb8:	8b 12                	mov    (%rdx),%edx
  802fba:	89 10                	mov    %edx,(%rax)
  802fbc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802fc0:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  802fc7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802fcb:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802fce:	89 50 0c             	mov    %edx,0xc(%rax)
  802fd1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802fd5:	48 89 c7             	mov    %rax,%rdi
  802fd8:	48 b8 c5 1e 80 00 00 	movabs $0x801ec5,%rax
  802fdf:	00 00 00 
  802fe2:	ff d0                	callq  *%rax
  802fe4:	c9                   	leaveq 
  802fe5:	c3                   	retq   

0000000000802fe6 <accept>:
  802fe6:	55                   	push   %rbp
  802fe7:	48 89 e5             	mov    %rsp,%rbp
  802fea:	48 83 ec 30          	sub    $0x30,%rsp
  802fee:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802ff1:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802ff5:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802ff9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802ffc:	89 c7                	mov    %eax,%edi
  802ffe:	48 b8 f0 2e 80 00 00 	movabs $0x802ef0,%rax
  803005:	00 00 00 
  803008:	ff d0                	callq  *%rax
  80300a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80300d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803011:	79 05                	jns    803018 <accept+0x32>
  803013:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803016:	eb 3b                	jmp    803053 <accept+0x6d>
  803018:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80301c:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803020:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803023:	48 89 ce             	mov    %rcx,%rsi
  803026:	89 c7                	mov    %eax,%edi
  803028:	48 b8 31 33 80 00 00 	movabs $0x803331,%rax
  80302f:	00 00 00 
  803032:	ff d0                	callq  *%rax
  803034:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803037:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80303b:	79 05                	jns    803042 <accept+0x5c>
  80303d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803040:	eb 11                	jmp    803053 <accept+0x6d>
  803042:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803045:	89 c7                	mov    %eax,%edi
  803047:	48 b8 47 2f 80 00 00 	movabs $0x802f47,%rax
  80304e:	00 00 00 
  803051:	ff d0                	callq  *%rax
  803053:	c9                   	leaveq 
  803054:	c3                   	retq   

0000000000803055 <bind>:
  803055:	55                   	push   %rbp
  803056:	48 89 e5             	mov    %rsp,%rbp
  803059:	48 83 ec 20          	sub    $0x20,%rsp
  80305d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803060:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803064:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803067:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80306a:	89 c7                	mov    %eax,%edi
  80306c:	48 b8 f0 2e 80 00 00 	movabs $0x802ef0,%rax
  803073:	00 00 00 
  803076:	ff d0                	callq  *%rax
  803078:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80307b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80307f:	79 05                	jns    803086 <bind+0x31>
  803081:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803084:	eb 1b                	jmp    8030a1 <bind+0x4c>
  803086:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803089:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80308d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803090:	48 89 ce             	mov    %rcx,%rsi
  803093:	89 c7                	mov    %eax,%edi
  803095:	48 b8 b0 33 80 00 00 	movabs $0x8033b0,%rax
  80309c:	00 00 00 
  80309f:	ff d0                	callq  *%rax
  8030a1:	c9                   	leaveq 
  8030a2:	c3                   	retq   

00000000008030a3 <shutdown>:
  8030a3:	55                   	push   %rbp
  8030a4:	48 89 e5             	mov    %rsp,%rbp
  8030a7:	48 83 ec 20          	sub    $0x20,%rsp
  8030ab:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8030ae:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8030b1:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8030b4:	89 c7                	mov    %eax,%edi
  8030b6:	48 b8 f0 2e 80 00 00 	movabs $0x802ef0,%rax
  8030bd:	00 00 00 
  8030c0:	ff d0                	callq  *%rax
  8030c2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8030c5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8030c9:	79 05                	jns    8030d0 <shutdown+0x2d>
  8030cb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030ce:	eb 16                	jmp    8030e6 <shutdown+0x43>
  8030d0:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8030d3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030d6:	89 d6                	mov    %edx,%esi
  8030d8:	89 c7                	mov    %eax,%edi
  8030da:	48 b8 14 34 80 00 00 	movabs $0x803414,%rax
  8030e1:	00 00 00 
  8030e4:	ff d0                	callq  *%rax
  8030e6:	c9                   	leaveq 
  8030e7:	c3                   	retq   

00000000008030e8 <devsock_close>:
  8030e8:	55                   	push   %rbp
  8030e9:	48 89 e5             	mov    %rsp,%rbp
  8030ec:	48 83 ec 10          	sub    $0x10,%rsp
  8030f0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8030f4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8030f8:	48 89 c7             	mov    %rax,%rdi
  8030fb:	48 b8 55 42 80 00 00 	movabs $0x804255,%rax
  803102:	00 00 00 
  803105:	ff d0                	callq  *%rax
  803107:	83 f8 01             	cmp    $0x1,%eax
  80310a:	75 17                	jne    803123 <devsock_close+0x3b>
  80310c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803110:	8b 40 0c             	mov    0xc(%rax),%eax
  803113:	89 c7                	mov    %eax,%edi
  803115:	48 b8 54 34 80 00 00 	movabs $0x803454,%rax
  80311c:	00 00 00 
  80311f:	ff d0                	callq  *%rax
  803121:	eb 05                	jmp    803128 <devsock_close+0x40>
  803123:	b8 00 00 00 00       	mov    $0x0,%eax
  803128:	c9                   	leaveq 
  803129:	c3                   	retq   

000000000080312a <connect>:
  80312a:	55                   	push   %rbp
  80312b:	48 89 e5             	mov    %rsp,%rbp
  80312e:	48 83 ec 20          	sub    $0x20,%rsp
  803132:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803135:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803139:	89 55 e8             	mov    %edx,-0x18(%rbp)
  80313c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80313f:	89 c7                	mov    %eax,%edi
  803141:	48 b8 f0 2e 80 00 00 	movabs $0x802ef0,%rax
  803148:	00 00 00 
  80314b:	ff d0                	callq  *%rax
  80314d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803150:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803154:	79 05                	jns    80315b <connect+0x31>
  803156:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803159:	eb 1b                	jmp    803176 <connect+0x4c>
  80315b:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80315e:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803162:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803165:	48 89 ce             	mov    %rcx,%rsi
  803168:	89 c7                	mov    %eax,%edi
  80316a:	48 b8 81 34 80 00 00 	movabs $0x803481,%rax
  803171:	00 00 00 
  803174:	ff d0                	callq  *%rax
  803176:	c9                   	leaveq 
  803177:	c3                   	retq   

0000000000803178 <listen>:
  803178:	55                   	push   %rbp
  803179:	48 89 e5             	mov    %rsp,%rbp
  80317c:	48 83 ec 20          	sub    $0x20,%rsp
  803180:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803183:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803186:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803189:	89 c7                	mov    %eax,%edi
  80318b:	48 b8 f0 2e 80 00 00 	movabs $0x802ef0,%rax
  803192:	00 00 00 
  803195:	ff d0                	callq  *%rax
  803197:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80319a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80319e:	79 05                	jns    8031a5 <listen+0x2d>
  8031a0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031a3:	eb 16                	jmp    8031bb <listen+0x43>
  8031a5:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8031a8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031ab:	89 d6                	mov    %edx,%esi
  8031ad:	89 c7                	mov    %eax,%edi
  8031af:	48 b8 e5 34 80 00 00 	movabs $0x8034e5,%rax
  8031b6:	00 00 00 
  8031b9:	ff d0                	callq  *%rax
  8031bb:	c9                   	leaveq 
  8031bc:	c3                   	retq   

00000000008031bd <devsock_read>:
  8031bd:	55                   	push   %rbp
  8031be:	48 89 e5             	mov    %rsp,%rbp
  8031c1:	48 83 ec 20          	sub    $0x20,%rsp
  8031c5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8031c9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8031cd:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8031d1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8031d5:	89 c2                	mov    %eax,%edx
  8031d7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8031db:	8b 40 0c             	mov    0xc(%rax),%eax
  8031de:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  8031e2:	b9 00 00 00 00       	mov    $0x0,%ecx
  8031e7:	89 c7                	mov    %eax,%edi
  8031e9:	48 b8 25 35 80 00 00 	movabs $0x803525,%rax
  8031f0:	00 00 00 
  8031f3:	ff d0                	callq  *%rax
  8031f5:	c9                   	leaveq 
  8031f6:	c3                   	retq   

00000000008031f7 <devsock_write>:
  8031f7:	55                   	push   %rbp
  8031f8:	48 89 e5             	mov    %rsp,%rbp
  8031fb:	48 83 ec 20          	sub    $0x20,%rsp
  8031ff:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803203:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803207:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80320b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80320f:	89 c2                	mov    %eax,%edx
  803211:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803215:	8b 40 0c             	mov    0xc(%rax),%eax
  803218:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  80321c:	b9 00 00 00 00       	mov    $0x0,%ecx
  803221:	89 c7                	mov    %eax,%edi
  803223:	48 b8 f1 35 80 00 00 	movabs $0x8035f1,%rax
  80322a:	00 00 00 
  80322d:	ff d0                	callq  *%rax
  80322f:	c9                   	leaveq 
  803230:	c3                   	retq   

0000000000803231 <devsock_stat>:
  803231:	55                   	push   %rbp
  803232:	48 89 e5             	mov    %rsp,%rbp
  803235:	48 83 ec 10          	sub    $0x10,%rsp
  803239:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80323d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803241:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803245:	48 be 0a 4f 80 00 00 	movabs $0x804f0a,%rsi
  80324c:	00 00 00 
  80324f:	48 89 c7             	mov    %rax,%rdi
  803252:	48 b8 b8 10 80 00 00 	movabs $0x8010b8,%rax
  803259:	00 00 00 
  80325c:	ff d0                	callq  *%rax
  80325e:	b8 00 00 00 00       	mov    $0x0,%eax
  803263:	c9                   	leaveq 
  803264:	c3                   	retq   

0000000000803265 <socket>:
  803265:	55                   	push   %rbp
  803266:	48 89 e5             	mov    %rsp,%rbp
  803269:	48 83 ec 20          	sub    $0x20,%rsp
  80326d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803270:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803273:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  803276:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803279:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  80327c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80327f:	89 ce                	mov    %ecx,%esi
  803281:	89 c7                	mov    %eax,%edi
  803283:	48 b8 a9 36 80 00 00 	movabs $0x8036a9,%rax
  80328a:	00 00 00 
  80328d:	ff d0                	callq  *%rax
  80328f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803292:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803296:	79 05                	jns    80329d <socket+0x38>
  803298:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80329b:	eb 11                	jmp    8032ae <socket+0x49>
  80329d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032a0:	89 c7                	mov    %eax,%edi
  8032a2:	48 b8 47 2f 80 00 00 	movabs $0x802f47,%rax
  8032a9:	00 00 00 
  8032ac:	ff d0                	callq  *%rax
  8032ae:	c9                   	leaveq 
  8032af:	c3                   	retq   

00000000008032b0 <nsipc>:
  8032b0:	55                   	push   %rbp
  8032b1:	48 89 e5             	mov    %rsp,%rbp
  8032b4:	48 83 ec 10          	sub    $0x10,%rsp
  8032b8:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8032bb:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  8032c2:	00 00 00 
  8032c5:	8b 00                	mov    (%rax),%eax
  8032c7:	85 c0                	test   %eax,%eax
  8032c9:	75 1d                	jne    8032e8 <nsipc+0x38>
  8032cb:	bf 02 00 00 00       	mov    $0x2,%edi
  8032d0:	48 b8 e3 41 80 00 00 	movabs $0x8041e3,%rax
  8032d7:	00 00 00 
  8032da:	ff d0                	callq  *%rax
  8032dc:	48 ba 04 80 80 00 00 	movabs $0x808004,%rdx
  8032e3:	00 00 00 
  8032e6:	89 02                	mov    %eax,(%rdx)
  8032e8:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  8032ef:	00 00 00 
  8032f2:	8b 00                	mov    (%rax),%eax
  8032f4:	8b 75 fc             	mov    -0x4(%rbp),%esi
  8032f7:	b9 07 00 00 00       	mov    $0x7,%ecx
  8032fc:	48 ba 00 b0 80 00 00 	movabs $0x80b000,%rdx
  803303:	00 00 00 
  803306:	89 c7                	mov    %eax,%edi
  803308:	48 b8 4d 41 80 00 00 	movabs $0x80414d,%rax
  80330f:	00 00 00 
  803312:	ff d0                	callq  *%rax
  803314:	ba 00 00 00 00       	mov    $0x0,%edx
  803319:	be 00 00 00 00       	mov    $0x0,%esi
  80331e:	bf 00 00 00 00       	mov    $0x0,%edi
  803323:	48 b8 8c 40 80 00 00 	movabs $0x80408c,%rax
  80332a:	00 00 00 
  80332d:	ff d0                	callq  *%rax
  80332f:	c9                   	leaveq 
  803330:	c3                   	retq   

0000000000803331 <nsipc_accept>:
  803331:	55                   	push   %rbp
  803332:	48 89 e5             	mov    %rsp,%rbp
  803335:	48 83 ec 30          	sub    $0x30,%rsp
  803339:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80333c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803340:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803344:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80334b:	00 00 00 
  80334e:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803351:	89 10                	mov    %edx,(%rax)
  803353:	bf 01 00 00 00       	mov    $0x1,%edi
  803358:	48 b8 b0 32 80 00 00 	movabs $0x8032b0,%rax
  80335f:	00 00 00 
  803362:	ff d0                	callq  *%rax
  803364:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803367:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80336b:	78 3e                	js     8033ab <nsipc_accept+0x7a>
  80336d:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803374:	00 00 00 
  803377:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80337b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80337f:	8b 40 10             	mov    0x10(%rax),%eax
  803382:	89 c2                	mov    %eax,%edx
  803384:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  803388:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80338c:	48 89 ce             	mov    %rcx,%rsi
  80338f:	48 89 c7             	mov    %rax,%rdi
  803392:	48 b8 dc 13 80 00 00 	movabs $0x8013dc,%rax
  803399:	00 00 00 
  80339c:	ff d0                	callq  *%rax
  80339e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8033a2:	8b 50 10             	mov    0x10(%rax),%edx
  8033a5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8033a9:	89 10                	mov    %edx,(%rax)
  8033ab:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033ae:	c9                   	leaveq 
  8033af:	c3                   	retq   

00000000008033b0 <nsipc_bind>:
  8033b0:	55                   	push   %rbp
  8033b1:	48 89 e5             	mov    %rsp,%rbp
  8033b4:	48 83 ec 10          	sub    $0x10,%rsp
  8033b8:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8033bb:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8033bf:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8033c2:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8033c9:	00 00 00 
  8033cc:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8033cf:	89 10                	mov    %edx,(%rax)
  8033d1:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8033d4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8033d8:	48 89 c6             	mov    %rax,%rsi
  8033db:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  8033e2:	00 00 00 
  8033e5:	48 b8 dc 13 80 00 00 	movabs $0x8013dc,%rax
  8033ec:	00 00 00 
  8033ef:	ff d0                	callq  *%rax
  8033f1:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8033f8:	00 00 00 
  8033fb:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8033fe:	89 50 14             	mov    %edx,0x14(%rax)
  803401:	bf 02 00 00 00       	mov    $0x2,%edi
  803406:	48 b8 b0 32 80 00 00 	movabs $0x8032b0,%rax
  80340d:	00 00 00 
  803410:	ff d0                	callq  *%rax
  803412:	c9                   	leaveq 
  803413:	c3                   	retq   

0000000000803414 <nsipc_shutdown>:
  803414:	55                   	push   %rbp
  803415:	48 89 e5             	mov    %rsp,%rbp
  803418:	48 83 ec 10          	sub    $0x10,%rsp
  80341c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80341f:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803422:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803429:	00 00 00 
  80342c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80342f:	89 10                	mov    %edx,(%rax)
  803431:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803438:	00 00 00 
  80343b:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80343e:	89 50 04             	mov    %edx,0x4(%rax)
  803441:	bf 03 00 00 00       	mov    $0x3,%edi
  803446:	48 b8 b0 32 80 00 00 	movabs $0x8032b0,%rax
  80344d:	00 00 00 
  803450:	ff d0                	callq  *%rax
  803452:	c9                   	leaveq 
  803453:	c3                   	retq   

0000000000803454 <nsipc_close>:
  803454:	55                   	push   %rbp
  803455:	48 89 e5             	mov    %rsp,%rbp
  803458:	48 83 ec 10          	sub    $0x10,%rsp
  80345c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80345f:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803466:	00 00 00 
  803469:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80346c:	89 10                	mov    %edx,(%rax)
  80346e:	bf 04 00 00 00       	mov    $0x4,%edi
  803473:	48 b8 b0 32 80 00 00 	movabs $0x8032b0,%rax
  80347a:	00 00 00 
  80347d:	ff d0                	callq  *%rax
  80347f:	c9                   	leaveq 
  803480:	c3                   	retq   

0000000000803481 <nsipc_connect>:
  803481:	55                   	push   %rbp
  803482:	48 89 e5             	mov    %rsp,%rbp
  803485:	48 83 ec 10          	sub    $0x10,%rsp
  803489:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80348c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803490:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803493:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80349a:	00 00 00 
  80349d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8034a0:	89 10                	mov    %edx,(%rax)
  8034a2:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8034a5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8034a9:	48 89 c6             	mov    %rax,%rsi
  8034ac:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  8034b3:	00 00 00 
  8034b6:	48 b8 dc 13 80 00 00 	movabs $0x8013dc,%rax
  8034bd:	00 00 00 
  8034c0:	ff d0                	callq  *%rax
  8034c2:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8034c9:	00 00 00 
  8034cc:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8034cf:	89 50 14             	mov    %edx,0x14(%rax)
  8034d2:	bf 05 00 00 00       	mov    $0x5,%edi
  8034d7:	48 b8 b0 32 80 00 00 	movabs $0x8032b0,%rax
  8034de:	00 00 00 
  8034e1:	ff d0                	callq  *%rax
  8034e3:	c9                   	leaveq 
  8034e4:	c3                   	retq   

00000000008034e5 <nsipc_listen>:
  8034e5:	55                   	push   %rbp
  8034e6:	48 89 e5             	mov    %rsp,%rbp
  8034e9:	48 83 ec 10          	sub    $0x10,%rsp
  8034ed:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8034f0:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8034f3:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8034fa:	00 00 00 
  8034fd:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803500:	89 10                	mov    %edx,(%rax)
  803502:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803509:	00 00 00 
  80350c:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80350f:	89 50 04             	mov    %edx,0x4(%rax)
  803512:	bf 06 00 00 00       	mov    $0x6,%edi
  803517:	48 b8 b0 32 80 00 00 	movabs $0x8032b0,%rax
  80351e:	00 00 00 
  803521:	ff d0                	callq  *%rax
  803523:	c9                   	leaveq 
  803524:	c3                   	retq   

0000000000803525 <nsipc_recv>:
  803525:	55                   	push   %rbp
  803526:	48 89 e5             	mov    %rsp,%rbp
  803529:	48 83 ec 30          	sub    $0x30,%rsp
  80352d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803530:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803534:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803537:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  80353a:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803541:	00 00 00 
  803544:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803547:	89 10                	mov    %edx,(%rax)
  803549:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803550:	00 00 00 
  803553:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803556:	89 50 04             	mov    %edx,0x4(%rax)
  803559:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803560:	00 00 00 
  803563:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803566:	89 50 08             	mov    %edx,0x8(%rax)
  803569:	bf 07 00 00 00       	mov    $0x7,%edi
  80356e:	48 b8 b0 32 80 00 00 	movabs $0x8032b0,%rax
  803575:	00 00 00 
  803578:	ff d0                	callq  *%rax
  80357a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80357d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803581:	78 69                	js     8035ec <nsipc_recv+0xc7>
  803583:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  80358a:	7f 08                	jg     803594 <nsipc_recv+0x6f>
  80358c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80358f:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  803592:	7e 35                	jle    8035c9 <nsipc_recv+0xa4>
  803594:	48 b9 11 4f 80 00 00 	movabs $0x804f11,%rcx
  80359b:	00 00 00 
  80359e:	48 ba 26 4f 80 00 00 	movabs $0x804f26,%rdx
  8035a5:	00 00 00 
  8035a8:	be 62 00 00 00       	mov    $0x62,%esi
  8035ad:	48 bf 3b 4f 80 00 00 	movabs $0x804f3b,%rdi
  8035b4:	00 00 00 
  8035b7:	b8 00 00 00 00       	mov    $0x0,%eax
  8035bc:	49 b8 78 3f 80 00 00 	movabs $0x803f78,%r8
  8035c3:	00 00 00 
  8035c6:	41 ff d0             	callq  *%r8
  8035c9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035cc:	48 63 d0             	movslq %eax,%rdx
  8035cf:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8035d3:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  8035da:	00 00 00 
  8035dd:	48 89 c7             	mov    %rax,%rdi
  8035e0:	48 b8 dc 13 80 00 00 	movabs $0x8013dc,%rax
  8035e7:	00 00 00 
  8035ea:	ff d0                	callq  *%rax
  8035ec:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035ef:	c9                   	leaveq 
  8035f0:	c3                   	retq   

00000000008035f1 <nsipc_send>:
  8035f1:	55                   	push   %rbp
  8035f2:	48 89 e5             	mov    %rsp,%rbp
  8035f5:	48 83 ec 20          	sub    $0x20,%rsp
  8035f9:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8035fc:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803600:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803603:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  803606:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80360d:	00 00 00 
  803610:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803613:	89 10                	mov    %edx,(%rax)
  803615:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  80361c:	7e 35                	jle    803653 <nsipc_send+0x62>
  80361e:	48 b9 4a 4f 80 00 00 	movabs $0x804f4a,%rcx
  803625:	00 00 00 
  803628:	48 ba 26 4f 80 00 00 	movabs $0x804f26,%rdx
  80362f:	00 00 00 
  803632:	be 6d 00 00 00       	mov    $0x6d,%esi
  803637:	48 bf 3b 4f 80 00 00 	movabs $0x804f3b,%rdi
  80363e:	00 00 00 
  803641:	b8 00 00 00 00       	mov    $0x0,%eax
  803646:	49 b8 78 3f 80 00 00 	movabs $0x803f78,%r8
  80364d:	00 00 00 
  803650:	41 ff d0             	callq  *%r8
  803653:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803656:	48 63 d0             	movslq %eax,%rdx
  803659:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80365d:	48 89 c6             	mov    %rax,%rsi
  803660:	48 bf 0c b0 80 00 00 	movabs $0x80b00c,%rdi
  803667:	00 00 00 
  80366a:	48 b8 dc 13 80 00 00 	movabs $0x8013dc,%rax
  803671:	00 00 00 
  803674:	ff d0                	callq  *%rax
  803676:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80367d:	00 00 00 
  803680:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803683:	89 50 04             	mov    %edx,0x4(%rax)
  803686:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80368d:	00 00 00 
  803690:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803693:	89 50 08             	mov    %edx,0x8(%rax)
  803696:	bf 08 00 00 00       	mov    $0x8,%edi
  80369b:	48 b8 b0 32 80 00 00 	movabs $0x8032b0,%rax
  8036a2:	00 00 00 
  8036a5:	ff d0                	callq  *%rax
  8036a7:	c9                   	leaveq 
  8036a8:	c3                   	retq   

00000000008036a9 <nsipc_socket>:
  8036a9:	55                   	push   %rbp
  8036aa:	48 89 e5             	mov    %rsp,%rbp
  8036ad:	48 83 ec 10          	sub    $0x10,%rsp
  8036b1:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8036b4:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8036b7:	89 55 f4             	mov    %edx,-0xc(%rbp)
  8036ba:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8036c1:	00 00 00 
  8036c4:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8036c7:	89 10                	mov    %edx,(%rax)
  8036c9:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8036d0:	00 00 00 
  8036d3:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8036d6:	89 50 04             	mov    %edx,0x4(%rax)
  8036d9:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8036e0:	00 00 00 
  8036e3:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8036e6:	89 50 08             	mov    %edx,0x8(%rax)
  8036e9:	bf 09 00 00 00       	mov    $0x9,%edi
  8036ee:	48 b8 b0 32 80 00 00 	movabs $0x8032b0,%rax
  8036f5:	00 00 00 
  8036f8:	ff d0                	callq  *%rax
  8036fa:	c9                   	leaveq 
  8036fb:	c3                   	retq   

00000000008036fc <pipe>:
  8036fc:	55                   	push   %rbp
  8036fd:	48 89 e5             	mov    %rsp,%rbp
  803700:	53                   	push   %rbx
  803701:	48 83 ec 38          	sub    $0x38,%rsp
  803705:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  803709:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  80370d:	48 89 c7             	mov    %rax,%rdi
  803710:	48 b8 13 1f 80 00 00 	movabs $0x801f13,%rax
  803717:	00 00 00 
  80371a:	ff d0                	callq  *%rax
  80371c:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80371f:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803723:	0f 88 bf 01 00 00    	js     8038e8 <pipe+0x1ec>
  803729:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80372d:	ba 07 04 00 00       	mov    $0x407,%edx
  803732:	48 89 c6             	mov    %rax,%rsi
  803735:	bf 00 00 00 00       	mov    $0x0,%edi
  80373a:	48 b8 e7 19 80 00 00 	movabs $0x8019e7,%rax
  803741:	00 00 00 
  803744:	ff d0                	callq  *%rax
  803746:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803749:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80374d:	0f 88 95 01 00 00    	js     8038e8 <pipe+0x1ec>
  803753:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  803757:	48 89 c7             	mov    %rax,%rdi
  80375a:	48 b8 13 1f 80 00 00 	movabs $0x801f13,%rax
  803761:	00 00 00 
  803764:	ff d0                	callq  *%rax
  803766:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803769:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80376d:	0f 88 5d 01 00 00    	js     8038d0 <pipe+0x1d4>
  803773:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803777:	ba 07 04 00 00       	mov    $0x407,%edx
  80377c:	48 89 c6             	mov    %rax,%rsi
  80377f:	bf 00 00 00 00       	mov    $0x0,%edi
  803784:	48 b8 e7 19 80 00 00 	movabs $0x8019e7,%rax
  80378b:	00 00 00 
  80378e:	ff d0                	callq  *%rax
  803790:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803793:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803797:	0f 88 33 01 00 00    	js     8038d0 <pipe+0x1d4>
  80379d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8037a1:	48 89 c7             	mov    %rax,%rdi
  8037a4:	48 b8 e8 1e 80 00 00 	movabs $0x801ee8,%rax
  8037ab:	00 00 00 
  8037ae:	ff d0                	callq  *%rax
  8037b0:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8037b4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8037b8:	ba 07 04 00 00       	mov    $0x407,%edx
  8037bd:	48 89 c6             	mov    %rax,%rsi
  8037c0:	bf 00 00 00 00       	mov    $0x0,%edi
  8037c5:	48 b8 e7 19 80 00 00 	movabs $0x8019e7,%rax
  8037cc:	00 00 00 
  8037cf:	ff d0                	callq  *%rax
  8037d1:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8037d4:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8037d8:	79 05                	jns    8037df <pipe+0xe3>
  8037da:	e9 d9 00 00 00       	jmpq   8038b8 <pipe+0x1bc>
  8037df:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8037e3:	48 89 c7             	mov    %rax,%rdi
  8037e6:	48 b8 e8 1e 80 00 00 	movabs $0x801ee8,%rax
  8037ed:	00 00 00 
  8037f0:	ff d0                	callq  *%rax
  8037f2:	48 89 c2             	mov    %rax,%rdx
  8037f5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8037f9:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  8037ff:	48 89 d1             	mov    %rdx,%rcx
  803802:	ba 00 00 00 00       	mov    $0x0,%edx
  803807:	48 89 c6             	mov    %rax,%rsi
  80380a:	bf 00 00 00 00       	mov    $0x0,%edi
  80380f:	48 b8 37 1a 80 00 00 	movabs $0x801a37,%rax
  803816:	00 00 00 
  803819:	ff d0                	callq  *%rax
  80381b:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80381e:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803822:	79 1b                	jns    80383f <pipe+0x143>
  803824:	90                   	nop
  803825:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803829:	48 89 c6             	mov    %rax,%rsi
  80382c:	bf 00 00 00 00       	mov    $0x0,%edi
  803831:	48 b8 92 1a 80 00 00 	movabs $0x801a92,%rax
  803838:	00 00 00 
  80383b:	ff d0                	callq  *%rax
  80383d:	eb 79                	jmp    8038b8 <pipe+0x1bc>
  80383f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803843:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  80384a:	00 00 00 
  80384d:	8b 12                	mov    (%rdx),%edx
  80384f:	89 10                	mov    %edx,(%rax)
  803851:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803855:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  80385c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803860:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  803867:	00 00 00 
  80386a:	8b 12                	mov    (%rdx),%edx
  80386c:	89 10                	mov    %edx,(%rax)
  80386e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803872:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  803879:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80387d:	48 89 c7             	mov    %rax,%rdi
  803880:	48 b8 c5 1e 80 00 00 	movabs $0x801ec5,%rax
  803887:	00 00 00 
  80388a:	ff d0                	callq  *%rax
  80388c:	89 c2                	mov    %eax,%edx
  80388e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803892:	89 10                	mov    %edx,(%rax)
  803894:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803898:	48 8d 58 04          	lea    0x4(%rax),%rbx
  80389c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8038a0:	48 89 c7             	mov    %rax,%rdi
  8038a3:	48 b8 c5 1e 80 00 00 	movabs $0x801ec5,%rax
  8038aa:	00 00 00 
  8038ad:	ff d0                	callq  *%rax
  8038af:	89 03                	mov    %eax,(%rbx)
  8038b1:	b8 00 00 00 00       	mov    $0x0,%eax
  8038b6:	eb 33                	jmp    8038eb <pipe+0x1ef>
  8038b8:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8038bc:	48 89 c6             	mov    %rax,%rsi
  8038bf:	bf 00 00 00 00       	mov    $0x0,%edi
  8038c4:	48 b8 92 1a 80 00 00 	movabs $0x801a92,%rax
  8038cb:	00 00 00 
  8038ce:	ff d0                	callq  *%rax
  8038d0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8038d4:	48 89 c6             	mov    %rax,%rsi
  8038d7:	bf 00 00 00 00       	mov    $0x0,%edi
  8038dc:	48 b8 92 1a 80 00 00 	movabs $0x801a92,%rax
  8038e3:	00 00 00 
  8038e6:	ff d0                	callq  *%rax
  8038e8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8038eb:	48 83 c4 38          	add    $0x38,%rsp
  8038ef:	5b                   	pop    %rbx
  8038f0:	5d                   	pop    %rbp
  8038f1:	c3                   	retq   

00000000008038f2 <_pipeisclosed>:
  8038f2:	55                   	push   %rbp
  8038f3:	48 89 e5             	mov    %rsp,%rbp
  8038f6:	53                   	push   %rbx
  8038f7:	48 83 ec 28          	sub    $0x28,%rsp
  8038fb:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8038ff:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803903:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  80390a:	00 00 00 
  80390d:	48 8b 00             	mov    (%rax),%rax
  803910:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  803916:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803919:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80391d:	48 89 c7             	mov    %rax,%rdi
  803920:	48 b8 55 42 80 00 00 	movabs $0x804255,%rax
  803927:	00 00 00 
  80392a:	ff d0                	callq  *%rax
  80392c:	89 c3                	mov    %eax,%ebx
  80392e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803932:	48 89 c7             	mov    %rax,%rdi
  803935:	48 b8 55 42 80 00 00 	movabs $0x804255,%rax
  80393c:	00 00 00 
  80393f:	ff d0                	callq  *%rax
  803941:	39 c3                	cmp    %eax,%ebx
  803943:	0f 94 c0             	sete   %al
  803946:	0f b6 c0             	movzbl %al,%eax
  803949:	89 45 e8             	mov    %eax,-0x18(%rbp)
  80394c:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  803953:	00 00 00 
  803956:	48 8b 00             	mov    (%rax),%rax
  803959:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80395f:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  803962:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803965:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  803968:	75 05                	jne    80396f <_pipeisclosed+0x7d>
  80396a:	8b 45 e8             	mov    -0x18(%rbp),%eax
  80396d:	eb 4f                	jmp    8039be <_pipeisclosed+0xcc>
  80396f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803972:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  803975:	74 42                	je     8039b9 <_pipeisclosed+0xc7>
  803977:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  80397b:	75 3c                	jne    8039b9 <_pipeisclosed+0xc7>
  80397d:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  803984:	00 00 00 
  803987:	48 8b 00             	mov    (%rax),%rax
  80398a:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  803990:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803993:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803996:	89 c6                	mov    %eax,%esi
  803998:	48 bf 5b 4f 80 00 00 	movabs $0x804f5b,%rdi
  80399f:	00 00 00 
  8039a2:	b8 00 00 00 00       	mov    $0x0,%eax
  8039a7:	49 b8 03 05 80 00 00 	movabs $0x800503,%r8
  8039ae:	00 00 00 
  8039b1:	41 ff d0             	callq  *%r8
  8039b4:	e9 4a ff ff ff       	jmpq   803903 <_pipeisclosed+0x11>
  8039b9:	e9 45 ff ff ff       	jmpq   803903 <_pipeisclosed+0x11>
  8039be:	48 83 c4 28          	add    $0x28,%rsp
  8039c2:	5b                   	pop    %rbx
  8039c3:	5d                   	pop    %rbp
  8039c4:	c3                   	retq   

00000000008039c5 <pipeisclosed>:
  8039c5:	55                   	push   %rbp
  8039c6:	48 89 e5             	mov    %rsp,%rbp
  8039c9:	48 83 ec 30          	sub    $0x30,%rsp
  8039cd:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8039d0:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8039d4:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8039d7:	48 89 d6             	mov    %rdx,%rsi
  8039da:	89 c7                	mov    %eax,%edi
  8039dc:	48 b8 ab 1f 80 00 00 	movabs $0x801fab,%rax
  8039e3:	00 00 00 
  8039e6:	ff d0                	callq  *%rax
  8039e8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8039eb:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8039ef:	79 05                	jns    8039f6 <pipeisclosed+0x31>
  8039f1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039f4:	eb 31                	jmp    803a27 <pipeisclosed+0x62>
  8039f6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8039fa:	48 89 c7             	mov    %rax,%rdi
  8039fd:	48 b8 e8 1e 80 00 00 	movabs $0x801ee8,%rax
  803a04:	00 00 00 
  803a07:	ff d0                	callq  *%rax
  803a09:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803a0d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803a11:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803a15:	48 89 d6             	mov    %rdx,%rsi
  803a18:	48 89 c7             	mov    %rax,%rdi
  803a1b:	48 b8 f2 38 80 00 00 	movabs $0x8038f2,%rax
  803a22:	00 00 00 
  803a25:	ff d0                	callq  *%rax
  803a27:	c9                   	leaveq 
  803a28:	c3                   	retq   

0000000000803a29 <devpipe_read>:
  803a29:	55                   	push   %rbp
  803a2a:	48 89 e5             	mov    %rsp,%rbp
  803a2d:	48 83 ec 40          	sub    $0x40,%rsp
  803a31:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803a35:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803a39:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803a3d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803a41:	48 89 c7             	mov    %rax,%rdi
  803a44:	48 b8 e8 1e 80 00 00 	movabs $0x801ee8,%rax
  803a4b:	00 00 00 
  803a4e:	ff d0                	callq  *%rax
  803a50:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803a54:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803a58:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803a5c:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803a63:	00 
  803a64:	e9 92 00 00 00       	jmpq   803afb <devpipe_read+0xd2>
  803a69:	eb 41                	jmp    803aac <devpipe_read+0x83>
  803a6b:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  803a70:	74 09                	je     803a7b <devpipe_read+0x52>
  803a72:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803a76:	e9 92 00 00 00       	jmpq   803b0d <devpipe_read+0xe4>
  803a7b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803a7f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803a83:	48 89 d6             	mov    %rdx,%rsi
  803a86:	48 89 c7             	mov    %rax,%rdi
  803a89:	48 b8 f2 38 80 00 00 	movabs $0x8038f2,%rax
  803a90:	00 00 00 
  803a93:	ff d0                	callq  *%rax
  803a95:	85 c0                	test   %eax,%eax
  803a97:	74 07                	je     803aa0 <devpipe_read+0x77>
  803a99:	b8 00 00 00 00       	mov    $0x0,%eax
  803a9e:	eb 6d                	jmp    803b0d <devpipe_read+0xe4>
  803aa0:	48 b8 a9 19 80 00 00 	movabs $0x8019a9,%rax
  803aa7:	00 00 00 
  803aaa:	ff d0                	callq  *%rax
  803aac:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ab0:	8b 10                	mov    (%rax),%edx
  803ab2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ab6:	8b 40 04             	mov    0x4(%rax),%eax
  803ab9:	39 c2                	cmp    %eax,%edx
  803abb:	74 ae                	je     803a6b <devpipe_read+0x42>
  803abd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803ac1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803ac5:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  803ac9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803acd:	8b 00                	mov    (%rax),%eax
  803acf:	99                   	cltd   
  803ad0:	c1 ea 1b             	shr    $0x1b,%edx
  803ad3:	01 d0                	add    %edx,%eax
  803ad5:	83 e0 1f             	and    $0x1f,%eax
  803ad8:	29 d0                	sub    %edx,%eax
  803ada:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803ade:	48 98                	cltq   
  803ae0:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  803ae5:	88 01                	mov    %al,(%rcx)
  803ae7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803aeb:	8b 00                	mov    (%rax),%eax
  803aed:	8d 50 01             	lea    0x1(%rax),%edx
  803af0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803af4:	89 10                	mov    %edx,(%rax)
  803af6:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803afb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803aff:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803b03:	0f 82 60 ff ff ff    	jb     803a69 <devpipe_read+0x40>
  803b09:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803b0d:	c9                   	leaveq 
  803b0e:	c3                   	retq   

0000000000803b0f <devpipe_write>:
  803b0f:	55                   	push   %rbp
  803b10:	48 89 e5             	mov    %rsp,%rbp
  803b13:	48 83 ec 40          	sub    $0x40,%rsp
  803b17:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803b1b:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803b1f:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803b23:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803b27:	48 89 c7             	mov    %rax,%rdi
  803b2a:	48 b8 e8 1e 80 00 00 	movabs $0x801ee8,%rax
  803b31:	00 00 00 
  803b34:	ff d0                	callq  *%rax
  803b36:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803b3a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803b3e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803b42:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803b49:	00 
  803b4a:	e9 8e 00 00 00       	jmpq   803bdd <devpipe_write+0xce>
  803b4f:	eb 31                	jmp    803b82 <devpipe_write+0x73>
  803b51:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803b55:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803b59:	48 89 d6             	mov    %rdx,%rsi
  803b5c:	48 89 c7             	mov    %rax,%rdi
  803b5f:	48 b8 f2 38 80 00 00 	movabs $0x8038f2,%rax
  803b66:	00 00 00 
  803b69:	ff d0                	callq  *%rax
  803b6b:	85 c0                	test   %eax,%eax
  803b6d:	74 07                	je     803b76 <devpipe_write+0x67>
  803b6f:	b8 00 00 00 00       	mov    $0x0,%eax
  803b74:	eb 79                	jmp    803bef <devpipe_write+0xe0>
  803b76:	48 b8 a9 19 80 00 00 	movabs $0x8019a9,%rax
  803b7d:	00 00 00 
  803b80:	ff d0                	callq  *%rax
  803b82:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b86:	8b 40 04             	mov    0x4(%rax),%eax
  803b89:	48 63 d0             	movslq %eax,%rdx
  803b8c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b90:	8b 00                	mov    (%rax),%eax
  803b92:	48 98                	cltq   
  803b94:	48 83 c0 20          	add    $0x20,%rax
  803b98:	48 39 c2             	cmp    %rax,%rdx
  803b9b:	73 b4                	jae    803b51 <devpipe_write+0x42>
  803b9d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ba1:	8b 40 04             	mov    0x4(%rax),%eax
  803ba4:	99                   	cltd   
  803ba5:	c1 ea 1b             	shr    $0x1b,%edx
  803ba8:	01 d0                	add    %edx,%eax
  803baa:	83 e0 1f             	and    $0x1f,%eax
  803bad:	29 d0                	sub    %edx,%eax
  803baf:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  803bb3:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  803bb7:	48 01 ca             	add    %rcx,%rdx
  803bba:	0f b6 0a             	movzbl (%rdx),%ecx
  803bbd:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803bc1:	48 98                	cltq   
  803bc3:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  803bc7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803bcb:	8b 40 04             	mov    0x4(%rax),%eax
  803bce:	8d 50 01             	lea    0x1(%rax),%edx
  803bd1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803bd5:	89 50 04             	mov    %edx,0x4(%rax)
  803bd8:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803bdd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803be1:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803be5:	0f 82 64 ff ff ff    	jb     803b4f <devpipe_write+0x40>
  803beb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803bef:	c9                   	leaveq 
  803bf0:	c3                   	retq   

0000000000803bf1 <devpipe_stat>:
  803bf1:	55                   	push   %rbp
  803bf2:	48 89 e5             	mov    %rsp,%rbp
  803bf5:	48 83 ec 20          	sub    $0x20,%rsp
  803bf9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803bfd:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803c01:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803c05:	48 89 c7             	mov    %rax,%rdi
  803c08:	48 b8 e8 1e 80 00 00 	movabs $0x801ee8,%rax
  803c0f:	00 00 00 
  803c12:	ff d0                	callq  *%rax
  803c14:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803c18:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803c1c:	48 be 6e 4f 80 00 00 	movabs $0x804f6e,%rsi
  803c23:	00 00 00 
  803c26:	48 89 c7             	mov    %rax,%rdi
  803c29:	48 b8 b8 10 80 00 00 	movabs $0x8010b8,%rax
  803c30:	00 00 00 
  803c33:	ff d0                	callq  *%rax
  803c35:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803c39:	8b 50 04             	mov    0x4(%rax),%edx
  803c3c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803c40:	8b 00                	mov    (%rax),%eax
  803c42:	29 c2                	sub    %eax,%edx
  803c44:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803c48:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  803c4e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803c52:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  803c59:	00 00 00 
  803c5c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803c60:	48 b9 e0 70 80 00 00 	movabs $0x8070e0,%rcx
  803c67:	00 00 00 
  803c6a:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  803c71:	b8 00 00 00 00       	mov    $0x0,%eax
  803c76:	c9                   	leaveq 
  803c77:	c3                   	retq   

0000000000803c78 <devpipe_close>:
  803c78:	55                   	push   %rbp
  803c79:	48 89 e5             	mov    %rsp,%rbp
  803c7c:	48 83 ec 10          	sub    $0x10,%rsp
  803c80:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803c84:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803c88:	48 89 c6             	mov    %rax,%rsi
  803c8b:	bf 00 00 00 00       	mov    $0x0,%edi
  803c90:	48 b8 92 1a 80 00 00 	movabs $0x801a92,%rax
  803c97:	00 00 00 
  803c9a:	ff d0                	callq  *%rax
  803c9c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803ca0:	48 89 c7             	mov    %rax,%rdi
  803ca3:	48 b8 e8 1e 80 00 00 	movabs $0x801ee8,%rax
  803caa:	00 00 00 
  803cad:	ff d0                	callq  *%rax
  803caf:	48 89 c6             	mov    %rax,%rsi
  803cb2:	bf 00 00 00 00       	mov    $0x0,%edi
  803cb7:	48 b8 92 1a 80 00 00 	movabs $0x801a92,%rax
  803cbe:	00 00 00 
  803cc1:	ff d0                	callq  *%rax
  803cc3:	c9                   	leaveq 
  803cc4:	c3                   	retq   

0000000000803cc5 <cputchar>:
  803cc5:	55                   	push   %rbp
  803cc6:	48 89 e5             	mov    %rsp,%rbp
  803cc9:	48 83 ec 20          	sub    $0x20,%rsp
  803ccd:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803cd0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803cd3:	88 45 ff             	mov    %al,-0x1(%rbp)
  803cd6:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  803cda:	be 01 00 00 00       	mov    $0x1,%esi
  803cdf:	48 89 c7             	mov    %rax,%rdi
  803ce2:	48 b8 9f 18 80 00 00 	movabs $0x80189f,%rax
  803ce9:	00 00 00 
  803cec:	ff d0                	callq  *%rax
  803cee:	c9                   	leaveq 
  803cef:	c3                   	retq   

0000000000803cf0 <getchar>:
  803cf0:	55                   	push   %rbp
  803cf1:	48 89 e5             	mov    %rsp,%rbp
  803cf4:	48 83 ec 10          	sub    $0x10,%rsp
  803cf8:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  803cfc:	ba 01 00 00 00       	mov    $0x1,%edx
  803d01:	48 89 c6             	mov    %rax,%rsi
  803d04:	bf 00 00 00 00       	mov    $0x0,%edi
  803d09:	48 b8 dd 23 80 00 00 	movabs $0x8023dd,%rax
  803d10:	00 00 00 
  803d13:	ff d0                	callq  *%rax
  803d15:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803d18:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803d1c:	79 05                	jns    803d23 <getchar+0x33>
  803d1e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d21:	eb 14                	jmp    803d37 <getchar+0x47>
  803d23:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803d27:	7f 07                	jg     803d30 <getchar+0x40>
  803d29:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  803d2e:	eb 07                	jmp    803d37 <getchar+0x47>
  803d30:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  803d34:	0f b6 c0             	movzbl %al,%eax
  803d37:	c9                   	leaveq 
  803d38:	c3                   	retq   

0000000000803d39 <iscons>:
  803d39:	55                   	push   %rbp
  803d3a:	48 89 e5             	mov    %rsp,%rbp
  803d3d:	48 83 ec 20          	sub    $0x20,%rsp
  803d41:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803d44:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803d48:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803d4b:	48 89 d6             	mov    %rdx,%rsi
  803d4e:	89 c7                	mov    %eax,%edi
  803d50:	48 b8 ab 1f 80 00 00 	movabs $0x801fab,%rax
  803d57:	00 00 00 
  803d5a:	ff d0                	callq  *%rax
  803d5c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803d5f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803d63:	79 05                	jns    803d6a <iscons+0x31>
  803d65:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d68:	eb 1a                	jmp    803d84 <iscons+0x4b>
  803d6a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803d6e:	8b 10                	mov    (%rax),%edx
  803d70:	48 b8 20 71 80 00 00 	movabs $0x807120,%rax
  803d77:	00 00 00 
  803d7a:	8b 00                	mov    (%rax),%eax
  803d7c:	39 c2                	cmp    %eax,%edx
  803d7e:	0f 94 c0             	sete   %al
  803d81:	0f b6 c0             	movzbl %al,%eax
  803d84:	c9                   	leaveq 
  803d85:	c3                   	retq   

0000000000803d86 <opencons>:
  803d86:	55                   	push   %rbp
  803d87:	48 89 e5             	mov    %rsp,%rbp
  803d8a:	48 83 ec 10          	sub    $0x10,%rsp
  803d8e:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803d92:	48 89 c7             	mov    %rax,%rdi
  803d95:	48 b8 13 1f 80 00 00 	movabs $0x801f13,%rax
  803d9c:	00 00 00 
  803d9f:	ff d0                	callq  *%rax
  803da1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803da4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803da8:	79 05                	jns    803daf <opencons+0x29>
  803daa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803dad:	eb 5b                	jmp    803e0a <opencons+0x84>
  803daf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803db3:	ba 07 04 00 00       	mov    $0x407,%edx
  803db8:	48 89 c6             	mov    %rax,%rsi
  803dbb:	bf 00 00 00 00       	mov    $0x0,%edi
  803dc0:	48 b8 e7 19 80 00 00 	movabs $0x8019e7,%rax
  803dc7:	00 00 00 
  803dca:	ff d0                	callq  *%rax
  803dcc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803dcf:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803dd3:	79 05                	jns    803dda <opencons+0x54>
  803dd5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803dd8:	eb 30                	jmp    803e0a <opencons+0x84>
  803dda:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803dde:	48 ba 20 71 80 00 00 	movabs $0x807120,%rdx
  803de5:	00 00 00 
  803de8:	8b 12                	mov    (%rdx),%edx
  803dea:	89 10                	mov    %edx,(%rax)
  803dec:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803df0:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  803df7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803dfb:	48 89 c7             	mov    %rax,%rdi
  803dfe:	48 b8 c5 1e 80 00 00 	movabs $0x801ec5,%rax
  803e05:	00 00 00 
  803e08:	ff d0                	callq  *%rax
  803e0a:	c9                   	leaveq 
  803e0b:	c3                   	retq   

0000000000803e0c <devcons_read>:
  803e0c:	55                   	push   %rbp
  803e0d:	48 89 e5             	mov    %rsp,%rbp
  803e10:	48 83 ec 30          	sub    $0x30,%rsp
  803e14:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803e18:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803e1c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803e20:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  803e25:	75 07                	jne    803e2e <devcons_read+0x22>
  803e27:	b8 00 00 00 00       	mov    $0x0,%eax
  803e2c:	eb 4b                	jmp    803e79 <devcons_read+0x6d>
  803e2e:	eb 0c                	jmp    803e3c <devcons_read+0x30>
  803e30:	48 b8 a9 19 80 00 00 	movabs $0x8019a9,%rax
  803e37:	00 00 00 
  803e3a:	ff d0                	callq  *%rax
  803e3c:	48 b8 e9 18 80 00 00 	movabs $0x8018e9,%rax
  803e43:	00 00 00 
  803e46:	ff d0                	callq  *%rax
  803e48:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803e4b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803e4f:	74 df                	je     803e30 <devcons_read+0x24>
  803e51:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803e55:	79 05                	jns    803e5c <devcons_read+0x50>
  803e57:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e5a:	eb 1d                	jmp    803e79 <devcons_read+0x6d>
  803e5c:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  803e60:	75 07                	jne    803e69 <devcons_read+0x5d>
  803e62:	b8 00 00 00 00       	mov    $0x0,%eax
  803e67:	eb 10                	jmp    803e79 <devcons_read+0x6d>
  803e69:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e6c:	89 c2                	mov    %eax,%edx
  803e6e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803e72:	88 10                	mov    %dl,(%rax)
  803e74:	b8 01 00 00 00       	mov    $0x1,%eax
  803e79:	c9                   	leaveq 
  803e7a:	c3                   	retq   

0000000000803e7b <devcons_write>:
  803e7b:	55                   	push   %rbp
  803e7c:	48 89 e5             	mov    %rsp,%rbp
  803e7f:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  803e86:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  803e8d:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  803e94:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  803e9b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803ea2:	eb 76                	jmp    803f1a <devcons_write+0x9f>
  803ea4:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  803eab:	89 c2                	mov    %eax,%edx
  803ead:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803eb0:	29 c2                	sub    %eax,%edx
  803eb2:	89 d0                	mov    %edx,%eax
  803eb4:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803eb7:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803eba:	83 f8 7f             	cmp    $0x7f,%eax
  803ebd:	76 07                	jbe    803ec6 <devcons_write+0x4b>
  803ebf:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  803ec6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803ec9:	48 63 d0             	movslq %eax,%rdx
  803ecc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ecf:	48 63 c8             	movslq %eax,%rcx
  803ed2:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  803ed9:	48 01 c1             	add    %rax,%rcx
  803edc:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  803ee3:	48 89 ce             	mov    %rcx,%rsi
  803ee6:	48 89 c7             	mov    %rax,%rdi
  803ee9:	48 b8 dc 13 80 00 00 	movabs $0x8013dc,%rax
  803ef0:	00 00 00 
  803ef3:	ff d0                	callq  *%rax
  803ef5:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803ef8:	48 63 d0             	movslq %eax,%rdx
  803efb:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  803f02:	48 89 d6             	mov    %rdx,%rsi
  803f05:	48 89 c7             	mov    %rax,%rdi
  803f08:	48 b8 9f 18 80 00 00 	movabs $0x80189f,%rax
  803f0f:	00 00 00 
  803f12:	ff d0                	callq  *%rax
  803f14:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803f17:	01 45 fc             	add    %eax,-0x4(%rbp)
  803f1a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f1d:	48 98                	cltq   
  803f1f:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  803f26:	0f 82 78 ff ff ff    	jb     803ea4 <devcons_write+0x29>
  803f2c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f2f:	c9                   	leaveq 
  803f30:	c3                   	retq   

0000000000803f31 <devcons_close>:
  803f31:	55                   	push   %rbp
  803f32:	48 89 e5             	mov    %rsp,%rbp
  803f35:	48 83 ec 08          	sub    $0x8,%rsp
  803f39:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803f3d:	b8 00 00 00 00       	mov    $0x0,%eax
  803f42:	c9                   	leaveq 
  803f43:	c3                   	retq   

0000000000803f44 <devcons_stat>:
  803f44:	55                   	push   %rbp
  803f45:	48 89 e5             	mov    %rsp,%rbp
  803f48:	48 83 ec 10          	sub    $0x10,%rsp
  803f4c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803f50:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803f54:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f58:	48 be 7a 4f 80 00 00 	movabs $0x804f7a,%rsi
  803f5f:	00 00 00 
  803f62:	48 89 c7             	mov    %rax,%rdi
  803f65:	48 b8 b8 10 80 00 00 	movabs $0x8010b8,%rax
  803f6c:	00 00 00 
  803f6f:	ff d0                	callq  *%rax
  803f71:	b8 00 00 00 00       	mov    $0x0,%eax
  803f76:	c9                   	leaveq 
  803f77:	c3                   	retq   

0000000000803f78 <_panic>:
  803f78:	55                   	push   %rbp
  803f79:	48 89 e5             	mov    %rsp,%rbp
  803f7c:	53                   	push   %rbx
  803f7d:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  803f84:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  803f8b:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  803f91:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  803f98:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  803f9f:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  803fa6:	84 c0                	test   %al,%al
  803fa8:	74 23                	je     803fcd <_panic+0x55>
  803faa:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  803fb1:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  803fb5:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  803fb9:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  803fbd:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  803fc1:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  803fc5:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  803fc9:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  803fcd:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  803fd4:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  803fdb:	00 00 00 
  803fde:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  803fe5:	00 00 00 
  803fe8:	48 8d 45 10          	lea    0x10(%rbp),%rax
  803fec:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  803ff3:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  803ffa:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  804001:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  804008:	00 00 00 
  80400b:	48 8b 18             	mov    (%rax),%rbx
  80400e:	48 b8 6b 19 80 00 00 	movabs $0x80196b,%rax
  804015:	00 00 00 
  804018:	ff d0                	callq  *%rax
  80401a:	8b 8d 14 ff ff ff    	mov    -0xec(%rbp),%ecx
  804020:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  804027:	41 89 c8             	mov    %ecx,%r8d
  80402a:	48 89 d1             	mov    %rdx,%rcx
  80402d:	48 89 da             	mov    %rbx,%rdx
  804030:	89 c6                	mov    %eax,%esi
  804032:	48 bf 88 4f 80 00 00 	movabs $0x804f88,%rdi
  804039:	00 00 00 
  80403c:	b8 00 00 00 00       	mov    $0x0,%eax
  804041:	49 b9 03 05 80 00 00 	movabs $0x800503,%r9
  804048:	00 00 00 
  80404b:	41 ff d1             	callq  *%r9
  80404e:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  804055:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  80405c:	48 89 d6             	mov    %rdx,%rsi
  80405f:	48 89 c7             	mov    %rax,%rdi
  804062:	48 b8 57 04 80 00 00 	movabs $0x800457,%rax
  804069:	00 00 00 
  80406c:	ff d0                	callq  *%rax
  80406e:	48 bf ab 4f 80 00 00 	movabs $0x804fab,%rdi
  804075:	00 00 00 
  804078:	b8 00 00 00 00       	mov    $0x0,%eax
  80407d:	48 ba 03 05 80 00 00 	movabs $0x800503,%rdx
  804084:	00 00 00 
  804087:	ff d2                	callq  *%rdx
  804089:	cc                   	int3   
  80408a:	eb fd                	jmp    804089 <_panic+0x111>

000000000080408c <ipc_recv>:
  80408c:	55                   	push   %rbp
  80408d:	48 89 e5             	mov    %rsp,%rbp
  804090:	48 83 ec 30          	sub    $0x30,%rsp
  804094:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804098:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80409c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8040a0:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8040a5:	75 0e                	jne    8040b5 <ipc_recv+0x29>
  8040a7:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8040ae:	00 00 00 
  8040b1:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8040b5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8040b9:	48 89 c7             	mov    %rax,%rdi
  8040bc:	48 b8 10 1c 80 00 00 	movabs $0x801c10,%rax
  8040c3:	00 00 00 
  8040c6:	ff d0                	callq  *%rax
  8040c8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8040cb:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8040cf:	79 27                	jns    8040f8 <ipc_recv+0x6c>
  8040d1:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8040d6:	74 0a                	je     8040e2 <ipc_recv+0x56>
  8040d8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8040dc:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8040e2:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8040e7:	74 0a                	je     8040f3 <ipc_recv+0x67>
  8040e9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8040ed:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8040f3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8040f6:	eb 53                	jmp    80414b <ipc_recv+0xbf>
  8040f8:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8040fd:	74 19                	je     804118 <ipc_recv+0x8c>
  8040ff:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  804106:	00 00 00 
  804109:	48 8b 00             	mov    (%rax),%rax
  80410c:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  804112:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804116:	89 10                	mov    %edx,(%rax)
  804118:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80411d:	74 19                	je     804138 <ipc_recv+0xac>
  80411f:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  804126:	00 00 00 
  804129:	48 8b 00             	mov    (%rax),%rax
  80412c:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  804132:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804136:	89 10                	mov    %edx,(%rax)
  804138:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  80413f:	00 00 00 
  804142:	48 8b 00             	mov    (%rax),%rax
  804145:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  80414b:	c9                   	leaveq 
  80414c:	c3                   	retq   

000000000080414d <ipc_send>:
  80414d:	55                   	push   %rbp
  80414e:	48 89 e5             	mov    %rsp,%rbp
  804151:	48 83 ec 30          	sub    $0x30,%rsp
  804155:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804158:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80415b:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  80415f:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  804162:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  804167:	75 10                	jne    804179 <ipc_send+0x2c>
  804169:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804170:	00 00 00 
  804173:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804177:	eb 0e                	jmp    804187 <ipc_send+0x3a>
  804179:	eb 0c                	jmp    804187 <ipc_send+0x3a>
  80417b:	48 b8 a9 19 80 00 00 	movabs $0x8019a9,%rax
  804182:	00 00 00 
  804185:	ff d0                	callq  *%rax
  804187:	8b 75 e8             	mov    -0x18(%rbp),%esi
  80418a:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  80418d:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  804191:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804194:	89 c7                	mov    %eax,%edi
  804196:	48 b8 bb 1b 80 00 00 	movabs $0x801bbb,%rax
  80419d:	00 00 00 
  8041a0:	ff d0                	callq  *%rax
  8041a2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8041a5:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  8041a9:	74 d0                	je     80417b <ipc_send+0x2e>
  8041ab:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8041af:	79 30                	jns    8041e1 <ipc_send+0x94>
  8041b1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8041b4:	89 c1                	mov    %eax,%ecx
  8041b6:	48 ba ad 4f 80 00 00 	movabs $0x804fad,%rdx
  8041bd:	00 00 00 
  8041c0:	be 44 00 00 00       	mov    $0x44,%esi
  8041c5:	48 bf c3 4f 80 00 00 	movabs $0x804fc3,%rdi
  8041cc:	00 00 00 
  8041cf:	b8 00 00 00 00       	mov    $0x0,%eax
  8041d4:	49 b8 78 3f 80 00 00 	movabs $0x803f78,%r8
  8041db:	00 00 00 
  8041de:	41 ff d0             	callq  *%r8
  8041e1:	c9                   	leaveq 
  8041e2:	c3                   	retq   

00000000008041e3 <ipc_find_env>:
  8041e3:	55                   	push   %rbp
  8041e4:	48 89 e5             	mov    %rsp,%rbp
  8041e7:	48 83 ec 14          	sub    $0x14,%rsp
  8041eb:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8041ee:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8041f5:	eb 4e                	jmp    804245 <ipc_find_env+0x62>
  8041f7:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  8041fe:	00 00 00 
  804201:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804204:	48 98                	cltq   
  804206:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  80420d:	48 01 d0             	add    %rdx,%rax
  804210:	48 05 d0 00 00 00    	add    $0xd0,%rax
  804216:	8b 00                	mov    (%rax),%eax
  804218:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  80421b:	75 24                	jne    804241 <ipc_find_env+0x5e>
  80421d:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804224:	00 00 00 
  804227:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80422a:	48 98                	cltq   
  80422c:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804233:	48 01 d0             	add    %rdx,%rax
  804236:	48 05 c0 00 00 00    	add    $0xc0,%rax
  80423c:	8b 40 08             	mov    0x8(%rax),%eax
  80423f:	eb 12                	jmp    804253 <ipc_find_env+0x70>
  804241:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  804245:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  80424c:	7e a9                	jle    8041f7 <ipc_find_env+0x14>
  80424e:	b8 00 00 00 00       	mov    $0x0,%eax
  804253:	c9                   	leaveq 
  804254:	c3                   	retq   

0000000000804255 <pageref>:
  804255:	55                   	push   %rbp
  804256:	48 89 e5             	mov    %rsp,%rbp
  804259:	48 83 ec 18          	sub    $0x18,%rsp
  80425d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804261:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804265:	48 c1 e8 15          	shr    $0x15,%rax
  804269:	48 89 c2             	mov    %rax,%rdx
  80426c:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  804273:	01 00 00 
  804276:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80427a:	83 e0 01             	and    $0x1,%eax
  80427d:	48 85 c0             	test   %rax,%rax
  804280:	75 07                	jne    804289 <pageref+0x34>
  804282:	b8 00 00 00 00       	mov    $0x0,%eax
  804287:	eb 53                	jmp    8042dc <pageref+0x87>
  804289:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80428d:	48 c1 e8 0c          	shr    $0xc,%rax
  804291:	48 89 c2             	mov    %rax,%rdx
  804294:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80429b:	01 00 00 
  80429e:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8042a2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8042a6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8042aa:	83 e0 01             	and    $0x1,%eax
  8042ad:	48 85 c0             	test   %rax,%rax
  8042b0:	75 07                	jne    8042b9 <pageref+0x64>
  8042b2:	b8 00 00 00 00       	mov    $0x0,%eax
  8042b7:	eb 23                	jmp    8042dc <pageref+0x87>
  8042b9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8042bd:	48 c1 e8 0c          	shr    $0xc,%rax
  8042c1:	48 89 c2             	mov    %rax,%rdx
  8042c4:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  8042cb:	00 00 00 
  8042ce:	48 c1 e2 04          	shl    $0x4,%rdx
  8042d2:	48 01 d0             	add    %rdx,%rax
  8042d5:	0f b7 40 08          	movzwl 0x8(%rax),%eax
  8042d9:	0f b7 c0             	movzwl %ax,%eax
  8042dc:	c9                   	leaveq 
  8042dd:	c3                   	retq   

00000000008042de <inet_addr>:
  8042de:	55                   	push   %rbp
  8042df:	48 89 e5             	mov    %rsp,%rbp
  8042e2:	48 83 ec 20          	sub    $0x20,%rsp
  8042e6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8042ea:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8042ee:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8042f2:	48 89 d6             	mov    %rdx,%rsi
  8042f5:	48 89 c7             	mov    %rax,%rdi
  8042f8:	48 b8 14 43 80 00 00 	movabs $0x804314,%rax
  8042ff:	00 00 00 
  804302:	ff d0                	callq  *%rax
  804304:	85 c0                	test   %eax,%eax
  804306:	74 05                	je     80430d <inet_addr+0x2f>
  804308:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80430b:	eb 05                	jmp    804312 <inet_addr+0x34>
  80430d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  804312:	c9                   	leaveq 
  804313:	c3                   	retq   

0000000000804314 <inet_aton>:
  804314:	55                   	push   %rbp
  804315:	48 89 e5             	mov    %rsp,%rbp
  804318:	48 83 ec 40          	sub    $0x40,%rsp
  80431c:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  804320:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
  804324:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  804328:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80432c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  804330:	0f b6 00             	movzbl (%rax),%eax
  804333:	0f be c0             	movsbl %al,%eax
  804336:	89 45 f4             	mov    %eax,-0xc(%rbp)
  804339:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80433c:	3c 2f                	cmp    $0x2f,%al
  80433e:	76 07                	jbe    804347 <inet_aton+0x33>
  804340:	8b 45 f4             	mov    -0xc(%rbp),%eax
  804343:	3c 39                	cmp    $0x39,%al
  804345:	76 0a                	jbe    804351 <inet_aton+0x3d>
  804347:	b8 00 00 00 00       	mov    $0x0,%eax
  80434c:	e9 68 02 00 00       	jmpq   8045b9 <inet_aton+0x2a5>
  804351:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804358:	c7 45 f8 0a 00 00 00 	movl   $0xa,-0x8(%rbp)
  80435f:	83 7d f4 30          	cmpl   $0x30,-0xc(%rbp)
  804363:	75 40                	jne    8043a5 <inet_aton+0x91>
  804365:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  80436a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80436e:	0f b6 00             	movzbl (%rax),%eax
  804371:	0f be c0             	movsbl %al,%eax
  804374:	89 45 f4             	mov    %eax,-0xc(%rbp)
  804377:	83 7d f4 78          	cmpl   $0x78,-0xc(%rbp)
  80437b:	74 06                	je     804383 <inet_aton+0x6f>
  80437d:	83 7d f4 58          	cmpl   $0x58,-0xc(%rbp)
  804381:	75 1b                	jne    80439e <inet_aton+0x8a>
  804383:	c7 45 f8 10 00 00 00 	movl   $0x10,-0x8(%rbp)
  80438a:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  80438f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  804393:	0f b6 00             	movzbl (%rax),%eax
  804396:	0f be c0             	movsbl %al,%eax
  804399:	89 45 f4             	mov    %eax,-0xc(%rbp)
  80439c:	eb 07                	jmp    8043a5 <inet_aton+0x91>
  80439e:	c7 45 f8 08 00 00 00 	movl   $0x8,-0x8(%rbp)
  8043a5:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8043a8:	3c 2f                	cmp    $0x2f,%al
  8043aa:	76 2f                	jbe    8043db <inet_aton+0xc7>
  8043ac:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8043af:	3c 39                	cmp    $0x39,%al
  8043b1:	77 28                	ja     8043db <inet_aton+0xc7>
  8043b3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8043b6:	0f af 45 fc          	imul   -0x4(%rbp),%eax
  8043ba:	89 c2                	mov    %eax,%edx
  8043bc:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8043bf:	01 d0                	add    %edx,%eax
  8043c1:	83 e8 30             	sub    $0x30,%eax
  8043c4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8043c7:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  8043cc:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8043d0:	0f b6 00             	movzbl (%rax),%eax
  8043d3:	0f be c0             	movsbl %al,%eax
  8043d6:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8043d9:	eb ca                	jmp    8043a5 <inet_aton+0x91>
  8043db:	83 7d f8 10          	cmpl   $0x10,-0x8(%rbp)
  8043df:	75 72                	jne    804453 <inet_aton+0x13f>
  8043e1:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8043e4:	3c 2f                	cmp    $0x2f,%al
  8043e6:	76 07                	jbe    8043ef <inet_aton+0xdb>
  8043e8:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8043eb:	3c 39                	cmp    $0x39,%al
  8043ed:	76 1c                	jbe    80440b <inet_aton+0xf7>
  8043ef:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8043f2:	3c 60                	cmp    $0x60,%al
  8043f4:	76 07                	jbe    8043fd <inet_aton+0xe9>
  8043f6:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8043f9:	3c 66                	cmp    $0x66,%al
  8043fb:	76 0e                	jbe    80440b <inet_aton+0xf7>
  8043fd:	8b 45 f4             	mov    -0xc(%rbp),%eax
  804400:	3c 40                	cmp    $0x40,%al
  804402:	76 4f                	jbe    804453 <inet_aton+0x13f>
  804404:	8b 45 f4             	mov    -0xc(%rbp),%eax
  804407:	3c 46                	cmp    $0x46,%al
  804409:	77 48                	ja     804453 <inet_aton+0x13f>
  80440b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80440e:	c1 e0 04             	shl    $0x4,%eax
  804411:	89 c2                	mov    %eax,%edx
  804413:	8b 45 f4             	mov    -0xc(%rbp),%eax
  804416:	8d 48 0a             	lea    0xa(%rax),%ecx
  804419:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80441c:	3c 60                	cmp    $0x60,%al
  80441e:	76 0e                	jbe    80442e <inet_aton+0x11a>
  804420:	8b 45 f4             	mov    -0xc(%rbp),%eax
  804423:	3c 7a                	cmp    $0x7a,%al
  804425:	77 07                	ja     80442e <inet_aton+0x11a>
  804427:	b8 61 00 00 00       	mov    $0x61,%eax
  80442c:	eb 05                	jmp    804433 <inet_aton+0x11f>
  80442e:	b8 41 00 00 00       	mov    $0x41,%eax
  804433:	29 c1                	sub    %eax,%ecx
  804435:	89 c8                	mov    %ecx,%eax
  804437:	09 d0                	or     %edx,%eax
  804439:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80443c:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  804441:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  804445:	0f b6 00             	movzbl (%rax),%eax
  804448:	0f be c0             	movsbl %al,%eax
  80444b:	89 45 f4             	mov    %eax,-0xc(%rbp)
  80444e:	e9 52 ff ff ff       	jmpq   8043a5 <inet_aton+0x91>
  804453:	83 7d f4 2e          	cmpl   $0x2e,-0xc(%rbp)
  804457:	75 40                	jne    804499 <inet_aton+0x185>
  804459:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  80445d:	48 83 c0 0c          	add    $0xc,%rax
  804461:	48 39 45 e8          	cmp    %rax,-0x18(%rbp)
  804465:	72 0a                	jb     804471 <inet_aton+0x15d>
  804467:	b8 00 00 00 00       	mov    $0x0,%eax
  80446c:	e9 48 01 00 00       	jmpq   8045b9 <inet_aton+0x2a5>
  804471:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804475:	48 8d 50 04          	lea    0x4(%rax),%rdx
  804479:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80447d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804480:	89 10                	mov    %edx,(%rax)
  804482:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  804487:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80448b:	0f b6 00             	movzbl (%rax),%eax
  80448e:	0f be c0             	movsbl %al,%eax
  804491:	89 45 f4             	mov    %eax,-0xc(%rbp)
  804494:	e9 a0 fe ff ff       	jmpq   804339 <inet_aton+0x25>
  804499:	90                   	nop
  80449a:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  80449e:	74 3c                	je     8044dc <inet_aton+0x1c8>
  8044a0:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8044a3:	3c 1f                	cmp    $0x1f,%al
  8044a5:	76 2b                	jbe    8044d2 <inet_aton+0x1be>
  8044a7:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8044aa:	84 c0                	test   %al,%al
  8044ac:	78 24                	js     8044d2 <inet_aton+0x1be>
  8044ae:	83 7d f4 20          	cmpl   $0x20,-0xc(%rbp)
  8044b2:	74 28                	je     8044dc <inet_aton+0x1c8>
  8044b4:	83 7d f4 0c          	cmpl   $0xc,-0xc(%rbp)
  8044b8:	74 22                	je     8044dc <inet_aton+0x1c8>
  8044ba:	83 7d f4 0a          	cmpl   $0xa,-0xc(%rbp)
  8044be:	74 1c                	je     8044dc <inet_aton+0x1c8>
  8044c0:	83 7d f4 0d          	cmpl   $0xd,-0xc(%rbp)
  8044c4:	74 16                	je     8044dc <inet_aton+0x1c8>
  8044c6:	83 7d f4 09          	cmpl   $0x9,-0xc(%rbp)
  8044ca:	74 10                	je     8044dc <inet_aton+0x1c8>
  8044cc:	83 7d f4 0b          	cmpl   $0xb,-0xc(%rbp)
  8044d0:	74 0a                	je     8044dc <inet_aton+0x1c8>
  8044d2:	b8 00 00 00 00       	mov    $0x0,%eax
  8044d7:	e9 dd 00 00 00       	jmpq   8045b9 <inet_aton+0x2a5>
  8044dc:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8044e0:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  8044e4:	48 29 c2             	sub    %rax,%rdx
  8044e7:	48 89 d0             	mov    %rdx,%rax
  8044ea:	48 c1 f8 02          	sar    $0x2,%rax
  8044ee:	83 c0 01             	add    $0x1,%eax
  8044f1:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  8044f4:	83 7d e4 04          	cmpl   $0x4,-0x1c(%rbp)
  8044f8:	0f 87 98 00 00 00    	ja     804596 <inet_aton+0x282>
  8044fe:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  804501:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  804508:	00 
  804509:	48 b8 d0 4f 80 00 00 	movabs $0x804fd0,%rax
  804510:	00 00 00 
  804513:	48 01 d0             	add    %rdx,%rax
  804516:	48 8b 00             	mov    (%rax),%rax
  804519:	ff e0                	jmpq   *%rax
  80451b:	b8 00 00 00 00       	mov    $0x0,%eax
  804520:	e9 94 00 00 00       	jmpq   8045b9 <inet_aton+0x2a5>
  804525:	81 7d fc ff ff ff 00 	cmpl   $0xffffff,-0x4(%rbp)
  80452c:	76 0a                	jbe    804538 <inet_aton+0x224>
  80452e:	b8 00 00 00 00       	mov    $0x0,%eax
  804533:	e9 81 00 00 00       	jmpq   8045b9 <inet_aton+0x2a5>
  804538:	8b 45 d0             	mov    -0x30(%rbp),%eax
  80453b:	c1 e0 18             	shl    $0x18,%eax
  80453e:	09 45 fc             	or     %eax,-0x4(%rbp)
  804541:	eb 53                	jmp    804596 <inet_aton+0x282>
  804543:	81 7d fc ff ff 00 00 	cmpl   $0xffff,-0x4(%rbp)
  80454a:	76 07                	jbe    804553 <inet_aton+0x23f>
  80454c:	b8 00 00 00 00       	mov    $0x0,%eax
  804551:	eb 66                	jmp    8045b9 <inet_aton+0x2a5>
  804553:	8b 45 d0             	mov    -0x30(%rbp),%eax
  804556:	c1 e0 18             	shl    $0x18,%eax
  804559:	89 c2                	mov    %eax,%edx
  80455b:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  80455e:	c1 e0 10             	shl    $0x10,%eax
  804561:	09 d0                	or     %edx,%eax
  804563:	09 45 fc             	or     %eax,-0x4(%rbp)
  804566:	eb 2e                	jmp    804596 <inet_aton+0x282>
  804568:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%rbp)
  80456f:	76 07                	jbe    804578 <inet_aton+0x264>
  804571:	b8 00 00 00 00       	mov    $0x0,%eax
  804576:	eb 41                	jmp    8045b9 <inet_aton+0x2a5>
  804578:	8b 45 d0             	mov    -0x30(%rbp),%eax
  80457b:	c1 e0 18             	shl    $0x18,%eax
  80457e:	89 c2                	mov    %eax,%edx
  804580:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  804583:	c1 e0 10             	shl    $0x10,%eax
  804586:	09 c2                	or     %eax,%edx
  804588:	8b 45 d8             	mov    -0x28(%rbp),%eax
  80458b:	c1 e0 08             	shl    $0x8,%eax
  80458e:	09 d0                	or     %edx,%eax
  804590:	09 45 fc             	or     %eax,-0x4(%rbp)
  804593:	eb 01                	jmp    804596 <inet_aton+0x282>
  804595:	90                   	nop
  804596:	48 83 7d c0 00       	cmpq   $0x0,-0x40(%rbp)
  80459b:	74 17                	je     8045b4 <inet_aton+0x2a0>
  80459d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8045a0:	89 c7                	mov    %eax,%edi
  8045a2:	48 b8 32 47 80 00 00 	movabs $0x804732,%rax
  8045a9:	00 00 00 
  8045ac:	ff d0                	callq  *%rax
  8045ae:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  8045b2:	89 02                	mov    %eax,(%rdx)
  8045b4:	b8 01 00 00 00       	mov    $0x1,%eax
  8045b9:	c9                   	leaveq 
  8045ba:	c3                   	retq   

00000000008045bb <inet_ntoa>:
  8045bb:	55                   	push   %rbp
  8045bc:	48 89 e5             	mov    %rsp,%rbp
  8045bf:	48 83 ec 30          	sub    $0x30,%rsp
  8045c3:	89 7d d0             	mov    %edi,-0x30(%rbp)
  8045c6:	8b 45 d0             	mov    -0x30(%rbp),%eax
  8045c9:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8045cc:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  8045d3:	00 00 00 
  8045d6:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8045da:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  8045de:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8045e2:	c6 45 ef 00          	movb   $0x0,-0x11(%rbp)
  8045e6:	e9 e0 00 00 00       	jmpq   8046cb <inet_ntoa+0x110>
  8045eb:	c6 45 ee 00          	movb   $0x0,-0x12(%rbp)
  8045ef:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8045f3:	0f b6 08             	movzbl (%rax),%ecx
  8045f6:	0f b6 d1             	movzbl %cl,%edx
  8045f9:	89 d0                	mov    %edx,%eax
  8045fb:	c1 e0 02             	shl    $0x2,%eax
  8045fe:	01 d0                	add    %edx,%eax
  804600:	c1 e0 03             	shl    $0x3,%eax
  804603:	01 d0                	add    %edx,%eax
  804605:	8d 14 85 00 00 00 00 	lea    0x0(,%rax,4),%edx
  80460c:	01 d0                	add    %edx,%eax
  80460e:	66 c1 e8 08          	shr    $0x8,%ax
  804612:	c0 e8 03             	shr    $0x3,%al
  804615:	88 45 ed             	mov    %al,-0x13(%rbp)
  804618:	0f b6 55 ed          	movzbl -0x13(%rbp),%edx
  80461c:	89 d0                	mov    %edx,%eax
  80461e:	c1 e0 02             	shl    $0x2,%eax
  804621:	01 d0                	add    %edx,%eax
  804623:	01 c0                	add    %eax,%eax
  804625:	29 c1                	sub    %eax,%ecx
  804627:	89 c8                	mov    %ecx,%eax
  804629:	88 45 ed             	mov    %al,-0x13(%rbp)
  80462c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804630:	0f b6 00             	movzbl (%rax),%eax
  804633:	0f b6 d0             	movzbl %al,%edx
  804636:	89 d0                	mov    %edx,%eax
  804638:	c1 e0 02             	shl    $0x2,%eax
  80463b:	01 d0                	add    %edx,%eax
  80463d:	c1 e0 03             	shl    $0x3,%eax
  804640:	01 d0                	add    %edx,%eax
  804642:	8d 14 85 00 00 00 00 	lea    0x0(,%rax,4),%edx
  804649:	01 d0                	add    %edx,%eax
  80464b:	66 c1 e8 08          	shr    $0x8,%ax
  80464f:	89 c2                	mov    %eax,%edx
  804651:	c0 ea 03             	shr    $0x3,%dl
  804654:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804658:	88 10                	mov    %dl,(%rax)
  80465a:	0f b6 45 ee          	movzbl -0x12(%rbp),%eax
  80465e:	8d 50 01             	lea    0x1(%rax),%edx
  804661:	88 55 ee             	mov    %dl,-0x12(%rbp)
  804664:	0f b6 c0             	movzbl %al,%eax
  804667:	0f b6 55 ed          	movzbl -0x13(%rbp),%edx
  80466b:	83 c2 30             	add    $0x30,%edx
  80466e:	48 98                	cltq   
  804670:	88 54 05 e0          	mov    %dl,-0x20(%rbp,%rax,1)
  804674:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804678:	0f b6 00             	movzbl (%rax),%eax
  80467b:	84 c0                	test   %al,%al
  80467d:	0f 85 6c ff ff ff    	jne    8045ef <inet_ntoa+0x34>
  804683:	eb 1a                	jmp    80469f <inet_ntoa+0xe4>
  804685:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804689:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80468d:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
  804691:	0f b6 55 ee          	movzbl -0x12(%rbp),%edx
  804695:	48 63 d2             	movslq %edx,%rdx
  804698:	0f b6 54 15 e0       	movzbl -0x20(%rbp,%rdx,1),%edx
  80469d:	88 10                	mov    %dl,(%rax)
  80469f:	0f b6 45 ee          	movzbl -0x12(%rbp),%eax
  8046a3:	8d 50 ff             	lea    -0x1(%rax),%edx
  8046a6:	88 55 ee             	mov    %dl,-0x12(%rbp)
  8046a9:	84 c0                	test   %al,%al
  8046ab:	75 d8                	jne    804685 <inet_ntoa+0xca>
  8046ad:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8046b1:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8046b5:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
  8046b9:	c6 00 2e             	movb   $0x2e,(%rax)
  8046bc:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8046c1:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  8046c5:	83 c0 01             	add    $0x1,%eax
  8046c8:	88 45 ef             	mov    %al,-0x11(%rbp)
  8046cb:	80 7d ef 03          	cmpb   $0x3,-0x11(%rbp)
  8046cf:	0f 86 16 ff ff ff    	jbe    8045eb <inet_ntoa+0x30>
  8046d5:	48 83 6d f8 01       	subq   $0x1,-0x8(%rbp)
  8046da:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8046de:	c6 00 00             	movb   $0x0,(%rax)
  8046e1:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  8046e8:	00 00 00 
  8046eb:	c9                   	leaveq 
  8046ec:	c3                   	retq   

00000000008046ed <htons>:
  8046ed:	55                   	push   %rbp
  8046ee:	48 89 e5             	mov    %rsp,%rbp
  8046f1:	48 83 ec 04          	sub    $0x4,%rsp
  8046f5:	89 f8                	mov    %edi,%eax
  8046f7:	66 89 45 fc          	mov    %ax,-0x4(%rbp)
  8046fb:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
  8046ff:	c1 e0 08             	shl    $0x8,%eax
  804702:	89 c2                	mov    %eax,%edx
  804704:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
  804708:	66 c1 e8 08          	shr    $0x8,%ax
  80470c:	09 d0                	or     %edx,%eax
  80470e:	c9                   	leaveq 
  80470f:	c3                   	retq   

0000000000804710 <ntohs>:
  804710:	55                   	push   %rbp
  804711:	48 89 e5             	mov    %rsp,%rbp
  804714:	48 83 ec 08          	sub    $0x8,%rsp
  804718:	89 f8                	mov    %edi,%eax
  80471a:	66 89 45 fc          	mov    %ax,-0x4(%rbp)
  80471e:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
  804722:	89 c7                	mov    %eax,%edi
  804724:	48 b8 ed 46 80 00 00 	movabs $0x8046ed,%rax
  80472b:	00 00 00 
  80472e:	ff d0                	callq  *%rax
  804730:	c9                   	leaveq 
  804731:	c3                   	retq   

0000000000804732 <htonl>:
  804732:	55                   	push   %rbp
  804733:	48 89 e5             	mov    %rsp,%rbp
  804736:	48 83 ec 04          	sub    $0x4,%rsp
  80473a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80473d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804740:	c1 e0 18             	shl    $0x18,%eax
  804743:	89 c2                	mov    %eax,%edx
  804745:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804748:	25 00 ff 00 00       	and    $0xff00,%eax
  80474d:	c1 e0 08             	shl    $0x8,%eax
  804750:	09 c2                	or     %eax,%edx
  804752:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804755:	25 00 00 ff 00       	and    $0xff0000,%eax
  80475a:	48 c1 e8 08          	shr    $0x8,%rax
  80475e:	09 c2                	or     %eax,%edx
  804760:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804763:	c1 e8 18             	shr    $0x18,%eax
  804766:	09 d0                	or     %edx,%eax
  804768:	c9                   	leaveq 
  804769:	c3                   	retq   

000000000080476a <ntohl>:
  80476a:	55                   	push   %rbp
  80476b:	48 89 e5             	mov    %rsp,%rbp
  80476e:	48 83 ec 08          	sub    $0x8,%rsp
  804772:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804775:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804778:	89 c7                	mov    %eax,%edi
  80477a:	48 b8 32 47 80 00 00 	movabs $0x804732,%rax
  804781:	00 00 00 
  804784:	ff d0                	callq  *%rax
  804786:	c9                   	leaveq 
  804787:	c3                   	retq   
