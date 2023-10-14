
obj/user/httpd:     file format elf64-x86-64


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
  80003c:	e8 f7 0a 00 00       	callq  800b38 <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <die>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 10          	sub    $0x10,%rsp
  80004b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80004f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800053:	48 89 c6             	mov    %rax,%rsi
  800056:	48 bf 5c 55 80 00 00 	movabs $0x80555c,%rdi
  80005d:	00 00 00 
  800060:	b8 00 00 00 00       	mov    $0x0,%eax
  800065:	48 ba 17 0e 80 00 00 	movabs $0x800e17,%rdx
  80006c:	00 00 00 
  80006f:	ff d2                	callq  *%rdx
  800071:	48 b8 bb 0b 80 00 00 	movabs $0x800bbb,%rax
  800078:	00 00 00 
  80007b:	ff d0                	callq  *%rax
  80007d:	c9                   	leaveq 
  80007e:	c3                   	retq   

000000000080007f <req_free>:
  80007f:	55                   	push   %rbp
  800080:	48 89 e5             	mov    %rsp,%rbp
  800083:	48 83 ec 10          	sub    $0x10,%rsp
  800087:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80008b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80008f:	48 8b 40 08          	mov    0x8(%rax),%rax
  800093:	48 89 c7             	mov    %rax,%rdi
  800096:	48 b8 2c 44 80 00 00 	movabs $0x80442c,%rax
  80009d:	00 00 00 
  8000a0:	ff d0                	callq  *%rax
  8000a2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8000a6:	48 8b 40 10          	mov    0x10(%rax),%rax
  8000aa:	48 89 c7             	mov    %rax,%rdi
  8000ad:	48 b8 2c 44 80 00 00 	movabs $0x80442c,%rax
  8000b4:	00 00 00 
  8000b7:	ff d0                	callq  *%rax
  8000b9:	c9                   	leaveq 
  8000ba:	c3                   	retq   

00000000008000bb <send_header>:
  8000bb:	55                   	push   %rbp
  8000bc:	48 89 e5             	mov    %rsp,%rbp
  8000bf:	48 83 ec 20          	sub    $0x20,%rsp
  8000c3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8000c7:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8000ca:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8000d1:	00 00 00 
  8000d4:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8000d8:	eb 12                	jmp    8000ec <send_header+0x31>
  8000da:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8000de:	8b 00                	mov    (%rax),%eax
  8000e0:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  8000e3:	75 02                	jne    8000e7 <send_header+0x2c>
  8000e5:	eb 1c                	jmp    800103 <send_header+0x48>
  8000e7:	48 83 45 f8 10       	addq   $0x10,-0x8(%rbp)
  8000ec:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8000f0:	8b 00                	mov    (%rax),%eax
  8000f2:	85 c0                	test   %eax,%eax
  8000f4:	74 0d                	je     800103 <send_header+0x48>
  8000f6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8000fa:	48 8b 40 08          	mov    0x8(%rax),%rax
  8000fe:	48 85 c0             	test   %rax,%rax
  800101:	75 d7                	jne    8000da <send_header+0x1f>
  800103:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800107:	8b 00                	mov    (%rax),%eax
  800109:	85 c0                	test   %eax,%eax
  80010b:	75 07                	jne    800114 <send_header+0x59>
  80010d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  800112:	eb 5f                	jmp    800173 <send_header+0xb8>
  800114:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800118:	48 8b 40 08          	mov    0x8(%rax),%rax
  80011c:	48 89 c7             	mov    %rax,%rdi
  80011f:	48 b8 60 19 80 00 00 	movabs $0x801960,%rax
  800126:	00 00 00 
  800129:	ff d0                	callq  *%rax
  80012b:	89 45 f4             	mov    %eax,-0xc(%rbp)
  80012e:	8b 45 f4             	mov    -0xc(%rbp),%eax
  800131:	48 63 d0             	movslq %eax,%rdx
  800134:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800138:	48 8b 48 08          	mov    0x8(%rax),%rcx
  80013c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800140:	8b 00                	mov    (%rax),%eax
  800142:	48 89 ce             	mov    %rcx,%rsi
  800145:	89 c7                	mov    %eax,%edi
  800147:	48 b8 3b 2e 80 00 00 	movabs $0x802e3b,%rax
  80014e:	00 00 00 
  800151:	ff d0                	callq  *%rax
  800153:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  800156:	74 16                	je     80016e <send_header+0xb3>
  800158:	48 bf 60 55 80 00 00 	movabs $0x805560,%rdi
  80015f:	00 00 00 
  800162:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800169:	00 00 00 
  80016c:	ff d0                	callq  *%rax
  80016e:	b8 00 00 00 00       	mov    $0x0,%eax
  800173:	c9                   	leaveq 
  800174:	c3                   	retq   

0000000000800175 <send_data>:
  800175:	55                   	push   %rbp
  800176:	48 89 e5             	mov    %rsp,%rbp
  800179:	48 81 ec 20 01 00 00 	sub    $0x120,%rsp
  800180:	48 89 bd e8 fe ff ff 	mov    %rdi,-0x118(%rbp)
  800187:	89 b5 e4 fe ff ff    	mov    %esi,-0x11c(%rbp)
  80018d:	48 8d 8d f0 fe ff ff 	lea    -0x110(%rbp),%rcx
  800194:	8b 85 e4 fe ff ff    	mov    -0x11c(%rbp),%eax
  80019a:	ba 00 01 00 00       	mov    $0x100,%edx
  80019f:	48 89 ce             	mov    %rcx,%rsi
  8001a2:	89 c7                	mov    %eax,%edi
  8001a4:	48 b8 f1 2c 80 00 00 	movabs $0x802cf1,%rax
  8001ab:	00 00 00 
  8001ae:	ff d0                	callq  *%rax
  8001b0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8001b3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8001b7:	79 25                	jns    8001de <send_data+0x69>
  8001b9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8001bc:	89 c6                	mov    %eax,%esi
  8001be:	48 bf 7f 55 80 00 00 	movabs $0x80557f,%rdi
  8001c5:	00 00 00 
  8001c8:	b8 00 00 00 00       	mov    $0x0,%eax
  8001cd:	48 ba 17 0e 80 00 00 	movabs $0x800e17,%rdx
  8001d4:	00 00 00 
  8001d7:	ff d2                	callq  *%rdx
  8001d9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8001dc:	eb 59                	jmp    800237 <send_data+0xc2>
  8001de:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8001e2:	75 07                	jne    8001eb <send_data+0x76>
  8001e4:	b8 00 00 00 00       	mov    $0x0,%eax
  8001e9:	eb 4c                	jmp    800237 <send_data+0xc2>
  8001eb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8001ee:	48 63 d0             	movslq %eax,%rdx
  8001f1:	48 8b 85 e8 fe ff ff 	mov    -0x118(%rbp),%rax
  8001f8:	8b 00                	mov    (%rax),%eax
  8001fa:	48 8d 8d f0 fe ff ff 	lea    -0x110(%rbp),%rcx
  800201:	48 89 ce             	mov    %rcx,%rsi
  800204:	89 c7                	mov    %eax,%edi
  800206:	48 b8 3b 2e 80 00 00 	movabs $0x802e3b,%rax
  80020d:	00 00 00 
  800210:	ff d0                	callq  *%rax
  800212:	3b 45 fc             	cmp    -0x4(%rbp),%eax
  800215:	74 1b                	je     800232 <send_data+0xbd>
  800217:	48 bf 9b 55 80 00 00 	movabs $0x80559b,%rdi
  80021e:	00 00 00 
  800221:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800228:	00 00 00 
  80022b:	ff d0                	callq  *%rax
  80022d:	e9 5b ff ff ff       	jmpq   80018d <send_data+0x18>
  800232:	e9 56 ff ff ff       	jmpq   80018d <send_data+0x18>
  800237:	c9                   	leaveq 
  800238:	c3                   	retq   

0000000000800239 <send_size>:
  800239:	55                   	push   %rbp
  80023a:	48 89 e5             	mov    %rsp,%rbp
  80023d:	48 83 ec 60          	sub    $0x60,%rsp
  800241:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  800245:	89 75 a4             	mov    %esi,-0x5c(%rbp)
  800248:	8b 45 a4             	mov    -0x5c(%rbp),%eax
  80024b:	48 63 d0             	movslq %eax,%rdx
  80024e:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
  800252:	48 89 d1             	mov    %rdx,%rcx
  800255:	48 ba b9 55 80 00 00 	movabs $0x8055b9,%rdx
  80025c:	00 00 00 
  80025f:	be 40 00 00 00       	mov    $0x40,%esi
  800264:	48 89 c7             	mov    %rax,%rdi
  800267:	b8 00 00 00 00       	mov    $0x0,%eax
  80026c:	49 b8 7f 18 80 00 00 	movabs $0x80187f,%r8
  800273:	00 00 00 
  800276:	41 ff d0             	callq  *%r8
  800279:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80027c:	83 7d fc 3f          	cmpl   $0x3f,-0x4(%rbp)
  800280:	7e 2a                	jle    8002ac <send_size+0x73>
  800282:	48 ba cf 55 80 00 00 	movabs $0x8055cf,%rdx
  800289:	00 00 00 
  80028c:	be 6e 00 00 00       	mov    $0x6e,%esi
  800291:	48 bf e1 55 80 00 00 	movabs $0x8055e1,%rdi
  800298:	00 00 00 
  80029b:	b8 00 00 00 00       	mov    $0x0,%eax
  8002a0:	48 b9 de 0b 80 00 00 	movabs $0x800bde,%rcx
  8002a7:	00 00 00 
  8002aa:	ff d1                	callq  *%rcx
  8002ac:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8002af:	48 63 d0             	movslq %eax,%rdx
  8002b2:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8002b6:	8b 00                	mov    (%rax),%eax
  8002b8:	48 8d 4d b0          	lea    -0x50(%rbp),%rcx
  8002bc:	48 89 ce             	mov    %rcx,%rsi
  8002bf:	89 c7                	mov    %eax,%edi
  8002c1:	48 b8 3b 2e 80 00 00 	movabs $0x802e3b,%rax
  8002c8:	00 00 00 
  8002cb:	ff d0                	callq  *%rax
  8002cd:	3b 45 fc             	cmp    -0x4(%rbp),%eax
  8002d0:	74 07                	je     8002d9 <send_size+0xa0>
  8002d2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  8002d7:	eb 05                	jmp    8002de <send_size+0xa5>
  8002d9:	b8 00 00 00 00       	mov    $0x0,%eax
  8002de:	c9                   	leaveq 
  8002df:	c3                   	retq   

00000000008002e0 <mime_type>:
  8002e0:	55                   	push   %rbp
  8002e1:	48 89 e5             	mov    %rsp,%rbp
  8002e4:	48 83 ec 08          	sub    $0x8,%rsp
  8002e8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8002ec:	48 b8 f1 55 80 00 00 	movabs $0x8055f1,%rax
  8002f3:	00 00 00 
  8002f6:	c9                   	leaveq 
  8002f7:	c3                   	retq   

00000000008002f8 <send_content_type>:
  8002f8:	55                   	push   %rbp
  8002f9:	48 89 e5             	mov    %rsp,%rbp
  8002fc:	48 81 ec a0 00 00 00 	sub    $0xa0,%rsp
  800303:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  80030a:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  800311:	48 8b 40 08          	mov    0x8(%rax),%rax
  800315:	48 89 c7             	mov    %rax,%rdi
  800318:	48 b8 e0 02 80 00 00 	movabs $0x8002e0,%rax
  80031f:	00 00 00 
  800322:	ff d0                	callq  *%rax
  800324:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800328:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  80032d:	75 0a                	jne    800339 <send_content_type+0x41>
  80032f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  800334:	e9 9d 00 00 00       	jmpq   8003d6 <send_content_type+0xde>
  800339:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80033d:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  800344:	48 89 d1             	mov    %rdx,%rcx
  800347:	48 ba fb 55 80 00 00 	movabs $0x8055fb,%rdx
  80034e:	00 00 00 
  800351:	be 80 00 00 00       	mov    $0x80,%esi
  800356:	48 89 c7             	mov    %rax,%rdi
  800359:	b8 00 00 00 00       	mov    $0x0,%eax
  80035e:	49 b8 7f 18 80 00 00 	movabs $0x80187f,%r8
  800365:	00 00 00 
  800368:	41 ff d0             	callq  *%r8
  80036b:	89 45 f4             	mov    %eax,-0xc(%rbp)
  80036e:	83 7d f4 7f          	cmpl   $0x7f,-0xc(%rbp)
  800372:	7e 2a                	jle    80039e <send_content_type+0xa6>
  800374:	48 ba cf 55 80 00 00 	movabs $0x8055cf,%rdx
  80037b:	00 00 00 
  80037e:	be 8a 00 00 00       	mov    $0x8a,%esi
  800383:	48 bf e1 55 80 00 00 	movabs $0x8055e1,%rdi
  80038a:	00 00 00 
  80038d:	b8 00 00 00 00       	mov    $0x0,%eax
  800392:	48 b9 de 0b 80 00 00 	movabs $0x800bde,%rcx
  800399:	00 00 00 
  80039c:	ff d1                	callq  *%rcx
  80039e:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8003a1:	48 63 d0             	movslq %eax,%rdx
  8003a4:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  8003ab:	8b 00                	mov    (%rax),%eax
  8003ad:	48 8d 8d 70 ff ff ff 	lea    -0x90(%rbp),%rcx
  8003b4:	48 89 ce             	mov    %rcx,%rsi
  8003b7:	89 c7                	mov    %eax,%edi
  8003b9:	48 b8 3b 2e 80 00 00 	movabs $0x802e3b,%rax
  8003c0:	00 00 00 
  8003c3:	ff d0                	callq  *%rax
  8003c5:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  8003c8:	74 07                	je     8003d1 <send_content_type+0xd9>
  8003ca:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  8003cf:	eb 05                	jmp    8003d6 <send_content_type+0xde>
  8003d1:	b8 00 00 00 00       	mov    $0x0,%eax
  8003d6:	c9                   	leaveq 
  8003d7:	c3                   	retq   

00000000008003d8 <send_header_fin>:
  8003d8:	55                   	push   %rbp
  8003d9:	48 89 e5             	mov    %rsp,%rbp
  8003dc:	48 83 ec 20          	sub    $0x20,%rsp
  8003e0:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8003e4:	48 b8 0e 56 80 00 00 	movabs $0x80560e,%rax
  8003eb:	00 00 00 
  8003ee:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8003f2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8003f6:	48 89 c7             	mov    %rax,%rdi
  8003f9:	48 b8 60 19 80 00 00 	movabs $0x801960,%rax
  800400:	00 00 00 
  800403:	ff d0                	callq  *%rax
  800405:	89 45 f4             	mov    %eax,-0xc(%rbp)
  800408:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80040b:	48 63 d0             	movslq %eax,%rdx
  80040e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800412:	8b 00                	mov    (%rax),%eax
  800414:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  800418:	48 89 ce             	mov    %rcx,%rsi
  80041b:	89 c7                	mov    %eax,%edi
  80041d:	48 b8 3b 2e 80 00 00 	movabs $0x802e3b,%rax
  800424:	00 00 00 
  800427:	ff d0                	callq  *%rax
  800429:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  80042c:	74 07                	je     800435 <send_header_fin+0x5d>
  80042e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  800433:	eb 05                	jmp    80043a <send_header_fin+0x62>
  800435:	b8 00 00 00 00       	mov    $0x0,%eax
  80043a:	c9                   	leaveq 
  80043b:	c3                   	retq   

000000000080043c <http_request_parse>:
  80043c:	55                   	push   %rbp
  80043d:	48 89 e5             	mov    %rsp,%rbp
  800440:	48 83 ec 30          	sub    $0x30,%rsp
  800444:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  800448:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80044c:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  800451:	75 0a                	jne    80045d <http_request_parse+0x21>
  800453:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  800458:	e9 57 01 00 00       	jmpq   8005b4 <http_request_parse+0x178>
  80045d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800461:	ba 04 00 00 00       	mov    $0x4,%edx
  800466:	48 be 11 56 80 00 00 	movabs $0x805611,%rsi
  80046d:	00 00 00 
  800470:	48 89 c7             	mov    %rax,%rdi
  800473:	48 b8 81 1b 80 00 00 	movabs $0x801b81,%rax
  80047a:	00 00 00 
  80047d:	ff d0                	callq  *%rax
  80047f:	85 c0                	test   %eax,%eax
  800481:	74 0a                	je     80048d <http_request_parse+0x51>
  800483:	b8 18 fc ff ff       	mov    $0xfffffc18,%eax
  800488:	e9 27 01 00 00       	jmpq   8005b4 <http_request_parse+0x178>
  80048d:	48 83 45 d0 04       	addq   $0x4,-0x30(%rbp)
  800492:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800496:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80049a:	eb 05                	jmp    8004a1 <http_request_parse+0x65>
  80049c:	48 83 45 d0 01       	addq   $0x1,-0x30(%rbp)
  8004a1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8004a5:	0f b6 00             	movzbl (%rax),%eax
  8004a8:	84 c0                	test   %al,%al
  8004aa:	74 0b                	je     8004b7 <http_request_parse+0x7b>
  8004ac:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8004b0:	0f b6 00             	movzbl (%rax),%eax
  8004b3:	3c 20                	cmp    $0x20,%al
  8004b5:	75 e5                	jne    80049c <http_request_parse+0x60>
  8004b7:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  8004bb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8004bf:	48 29 c2             	sub    %rax,%rdx
  8004c2:	48 89 d0             	mov    %rdx,%rax
  8004c5:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8004c8:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8004cb:	83 c0 01             	add    $0x1,%eax
  8004ce:	48 98                	cltq   
  8004d0:	48 89 c7             	mov    %rax,%rdi
  8004d3:	48 b8 ae 40 80 00 00 	movabs $0x8040ae,%rax
  8004da:	00 00 00 
  8004dd:	ff d0                	callq  *%rax
  8004df:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8004e3:	48 89 42 08          	mov    %rax,0x8(%rdx)
  8004e7:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8004ea:	48 63 d0             	movslq %eax,%rdx
  8004ed:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8004f1:	48 8b 40 08          	mov    0x8(%rax),%rax
  8004f5:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  8004f9:	48 89 ce             	mov    %rcx,%rsi
  8004fc:	48 89 c7             	mov    %rax,%rdi
  8004ff:	48 b8 f0 1c 80 00 00 	movabs $0x801cf0,%rax
  800506:	00 00 00 
  800509:	ff d0                	callq  *%rax
  80050b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80050f:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800513:	8b 45 f4             	mov    -0xc(%rbp),%eax
  800516:	48 98                	cltq   
  800518:	48 01 d0             	add    %rdx,%rax
  80051b:	c6 00 00             	movb   $0x0,(%rax)
  80051e:	48 83 45 d0 01       	addq   $0x1,-0x30(%rbp)
  800523:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800527:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80052b:	eb 05                	jmp    800532 <http_request_parse+0xf6>
  80052d:	48 83 45 d0 01       	addq   $0x1,-0x30(%rbp)
  800532:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800536:	0f b6 00             	movzbl (%rax),%eax
  800539:	84 c0                	test   %al,%al
  80053b:	74 0b                	je     800548 <http_request_parse+0x10c>
  80053d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800541:	0f b6 00             	movzbl (%rax),%eax
  800544:	3c 0a                	cmp    $0xa,%al
  800546:	75 e5                	jne    80052d <http_request_parse+0xf1>
  800548:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  80054c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800550:	48 29 c2             	sub    %rax,%rdx
  800553:	48 89 d0             	mov    %rdx,%rax
  800556:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  800559:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80055c:	83 c0 01             	add    $0x1,%eax
  80055f:	48 98                	cltq   
  800561:	48 89 c7             	mov    %rax,%rdi
  800564:	48 b8 ae 40 80 00 00 	movabs $0x8040ae,%rax
  80056b:	00 00 00 
  80056e:	ff d0                	callq  *%rax
  800570:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  800574:	48 89 42 10          	mov    %rax,0x10(%rdx)
  800578:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80057b:	48 63 d0             	movslq %eax,%rdx
  80057e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800582:	48 8b 40 10          	mov    0x10(%rax),%rax
  800586:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80058a:	48 89 ce             	mov    %rcx,%rsi
  80058d:	48 89 c7             	mov    %rax,%rdi
  800590:	48 b8 f0 1c 80 00 00 	movabs $0x801cf0,%rax
  800597:	00 00 00 
  80059a:	ff d0                	callq  *%rax
  80059c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8005a0:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8005a4:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8005a7:	48 98                	cltq   
  8005a9:	48 01 d0             	add    %rdx,%rax
  8005ac:	c6 00 00             	movb   $0x0,(%rax)
  8005af:	b8 00 00 00 00       	mov    $0x0,%eax
  8005b4:	c9                   	leaveq 
  8005b5:	c3                   	retq   

00000000008005b6 <send_error>:
  8005b6:	55                   	push   %rbp
  8005b7:	48 89 e5             	mov    %rsp,%rbp
  8005ba:	48 81 ec 30 02 00 00 	sub    $0x230,%rsp
  8005c1:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  8005c8:	89 b5 e4 fd ff ff    	mov    %esi,-0x21c(%rbp)
  8005ce:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  8005d5:	00 00 00 
  8005d8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8005dc:	eb 15                	jmp    8005f3 <send_error+0x3d>
  8005de:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8005e2:	8b 00                	mov    (%rax),%eax
  8005e4:	3b 85 e4 fd ff ff    	cmp    -0x21c(%rbp),%eax
  8005ea:	75 02                	jne    8005ee <send_error+0x38>
  8005ec:	eb 1c                	jmp    80060a <send_error+0x54>
  8005ee:	48 83 45 f8 10       	addq   $0x10,-0x8(%rbp)
  8005f3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8005f7:	8b 00                	mov    (%rax),%eax
  8005f9:	85 c0                	test   %eax,%eax
  8005fb:	74 0d                	je     80060a <send_error+0x54>
  8005fd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800601:	48 8b 40 08          	mov    0x8(%rax),%rax
  800605:	48 85 c0             	test   %rax,%rax
  800608:	75 d4                	jne    8005de <send_error+0x28>
  80060a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80060e:	8b 00                	mov    (%rax),%eax
  800610:	85 c0                	test   %eax,%eax
  800612:	75 0a                	jne    80061e <send_error+0x68>
  800614:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  800619:	e9 8e 00 00 00       	jmpq   8006ac <send_error+0xf6>
  80061e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800622:	48 8b 48 08          	mov    0x8(%rax),%rcx
  800626:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80062a:	8b 38                	mov    (%rax),%edi
  80062c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800630:	48 8b 70 08          	mov    0x8(%rax),%rsi
  800634:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800638:	8b 10                	mov    (%rax),%edx
  80063a:	48 8d 85 f0 fd ff ff 	lea    -0x210(%rbp),%rax
  800641:	48 89 0c 24          	mov    %rcx,(%rsp)
  800645:	41 89 f9             	mov    %edi,%r9d
  800648:	49 89 f0             	mov    %rsi,%r8
  80064b:	89 d1                	mov    %edx,%ecx
  80064d:	48 ba 18 56 80 00 00 	movabs $0x805618,%rdx
  800654:	00 00 00 
  800657:	be 00 02 00 00       	mov    $0x200,%esi
  80065c:	48 89 c7             	mov    %rax,%rdi
  80065f:	b8 00 00 00 00       	mov    $0x0,%eax
  800664:	49 ba 7f 18 80 00 00 	movabs $0x80187f,%r10
  80066b:	00 00 00 
  80066e:	41 ff d2             	callq  *%r10
  800671:	89 45 f4             	mov    %eax,-0xc(%rbp)
  800674:	8b 45 f4             	mov    -0xc(%rbp),%eax
  800677:	48 63 d0             	movslq %eax,%rdx
  80067a:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  800681:	8b 00                	mov    (%rax),%eax
  800683:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  80068a:	48 89 ce             	mov    %rcx,%rsi
  80068d:	89 c7                	mov    %eax,%edi
  80068f:	48 b8 3b 2e 80 00 00 	movabs $0x802e3b,%rax
  800696:	00 00 00 
  800699:	ff d0                	callq  *%rax
  80069b:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  80069e:	74 07                	je     8006a7 <send_error+0xf1>
  8006a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  8006a5:	eb 05                	jmp    8006ac <send_error+0xf6>
  8006a7:	b8 00 00 00 00       	mov    $0x0,%eax
  8006ac:	c9                   	leaveq 
  8006ad:	c3                   	retq   

00000000008006ae <send_file>:
  8006ae:	55                   	push   %rbp
  8006af:	48 89 e5             	mov    %rsp,%rbp
  8006b2:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  8006b9:	48 89 bd 58 ff ff ff 	mov    %rdi,-0xa8(%rbp)
  8006c0:	c7 45 f8 ff ff ff ff 	movl   $0xffffffff,-0x8(%rbp)
  8006c7:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  8006ce:	48 8b 40 08          	mov    0x8(%rax),%rax
  8006d2:	be 00 00 00 00       	mov    $0x0,%esi
  8006d7:	48 89 c7             	mov    %rax,%rdi
  8006da:	48 b8 c7 31 80 00 00 	movabs $0x8031c7,%rax
  8006e1:	00 00 00 
  8006e4:	ff d0                	callq  *%rax
  8006e6:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8006e9:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8006ed:	79 20                	jns    80070f <send_file+0x61>
  8006ef:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  8006f6:	be 94 01 00 00       	mov    $0x194,%esi
  8006fb:	48 89 c7             	mov    %rax,%rdi
  8006fe:	48 b8 b6 05 80 00 00 	movabs $0x8005b6,%rax
  800705:	00 00 00 
  800708:	ff d0                	callq  *%rax
  80070a:	e9 56 01 00 00       	jmpq   800865 <send_file+0x1b7>
  80070f:	48 8d 95 60 ff ff ff 	lea    -0xa0(%rbp),%rdx
  800716:	8b 45 f4             	mov    -0xc(%rbp),%eax
  800719:	48 89 d6             	mov    %rdx,%rsi
  80071c:	89 c7                	mov    %eax,%edi
  80071e:	48 b8 20 30 80 00 00 	movabs $0x803020,%rax
  800725:	00 00 00 
  800728:	ff d0                	callq  *%rax
  80072a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80072d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800731:	79 31                	jns    800764 <send_file+0xb6>
  800733:	8b 45 f4             	mov    -0xc(%rbp),%eax
  800736:	89 c7                	mov    %eax,%edi
  800738:	48 b8 cf 2a 80 00 00 	movabs $0x802acf,%rax
  80073f:	00 00 00 
  800742:	ff d0                	callq  *%rax
  800744:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  80074b:	be 94 01 00 00       	mov    $0x194,%esi
  800750:	48 89 c7             	mov    %rax,%rdi
  800753:	48 b8 b6 05 80 00 00 	movabs $0x8005b6,%rax
  80075a:	00 00 00 
  80075d:	ff d0                	callq  *%rax
  80075f:	e9 01 01 00 00       	jmpq   800865 <send_file+0x1b7>
  800764:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  800767:	85 c0                	test   %eax,%eax
  800769:	74 31                	je     80079c <send_file+0xee>
  80076b:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80076e:	89 c7                	mov    %eax,%edi
  800770:	48 b8 cf 2a 80 00 00 	movabs $0x802acf,%rax
  800777:	00 00 00 
  80077a:	ff d0                	callq  *%rax
  80077c:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  800783:	be 94 01 00 00       	mov    $0x194,%esi
  800788:	48 89 c7             	mov    %rax,%rdi
  80078b:	48 b8 b6 05 80 00 00 	movabs $0x8005b6,%rax
  800792:	00 00 00 
  800795:	ff d0                	callq  *%rax
  800797:	e9 c9 00 00 00       	jmpq   800865 <send_file+0x1b7>
  80079c:	8b 45 e0             	mov    -0x20(%rbp),%eax
  80079f:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8007a2:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  8007a9:	be c8 00 00 00       	mov    $0xc8,%esi
  8007ae:	48 89 c7             	mov    %rax,%rdi
  8007b1:	48 b8 bb 00 80 00 00 	movabs $0x8000bb,%rax
  8007b8:	00 00 00 
  8007bb:	ff d0                	callq  *%rax
  8007bd:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8007c0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8007c4:	79 05                	jns    8007cb <send_file+0x11d>
  8007c6:	e9 86 00 00 00       	jmpq   800851 <send_file+0x1a3>
  8007cb:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8007ce:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  8007d5:	89 d6                	mov    %edx,%esi
  8007d7:	48 89 c7             	mov    %rax,%rdi
  8007da:	48 b8 39 02 80 00 00 	movabs $0x800239,%rax
  8007e1:	00 00 00 
  8007e4:	ff d0                	callq  *%rax
  8007e6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8007e9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8007ed:	79 02                	jns    8007f1 <send_file+0x143>
  8007ef:	eb 60                	jmp    800851 <send_file+0x1a3>
  8007f1:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  8007f8:	48 89 c7             	mov    %rax,%rdi
  8007fb:	48 b8 f8 02 80 00 00 	movabs $0x8002f8,%rax
  800802:	00 00 00 
  800805:	ff d0                	callq  *%rax
  800807:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80080a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80080e:	79 02                	jns    800812 <send_file+0x164>
  800810:	eb 3f                	jmp    800851 <send_file+0x1a3>
  800812:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  800819:	48 89 c7             	mov    %rax,%rdi
  80081c:	48 b8 d8 03 80 00 00 	movabs $0x8003d8,%rax
  800823:	00 00 00 
  800826:	ff d0                	callq  *%rax
  800828:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80082b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80082f:	79 02                	jns    800833 <send_file+0x185>
  800831:	eb 1e                	jmp    800851 <send_file+0x1a3>
  800833:	8b 55 f4             	mov    -0xc(%rbp),%edx
  800836:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  80083d:	89 d6                	mov    %edx,%esi
  80083f:	48 89 c7             	mov    %rax,%rdi
  800842:	48 b8 75 01 80 00 00 	movabs $0x800175,%rax
  800849:	00 00 00 
  80084c:	ff d0                	callq  *%rax
  80084e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800851:	8b 45 f4             	mov    -0xc(%rbp),%eax
  800854:	89 c7                	mov    %eax,%edi
  800856:	48 b8 cf 2a 80 00 00 	movabs $0x802acf,%rax
  80085d:	00 00 00 
  800860:	ff d0                	callq  *%rax
  800862:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800865:	c9                   	leaveq 
  800866:	c3                   	retq   

0000000000800867 <handle_client>:
  800867:	55                   	push   %rbp
  800868:	48 89 e5             	mov    %rsp,%rbp
  80086b:	48 81 ec 40 02 00 00 	sub    $0x240,%rsp
  800872:	89 bd cc fd ff ff    	mov    %edi,-0x234(%rbp)
  800878:	c7 45 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%rbp)
  80087f:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  800883:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  800887:	48 8d 8d d0 fd ff ff 	lea    -0x230(%rbp),%rcx
  80088e:	8b 85 cc fd ff ff    	mov    -0x234(%rbp),%eax
  800894:	ba 00 02 00 00       	mov    $0x200,%edx
  800899:	48 89 ce             	mov    %rcx,%rsi
  80089c:	89 c7                	mov    %eax,%edi
  80089e:	48 b8 f1 2c 80 00 00 	movabs $0x802cf1,%rax
  8008a5:	00 00 00 
  8008a8:	ff d0                	callq  *%rax
  8008aa:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8008ad:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8008b1:	79 2a                	jns    8008dd <handle_client+0x76>
  8008b3:	48 ba 93 56 80 00 00 	movabs $0x805693,%rdx
  8008ba:	00 00 00 
  8008bd:	be 2a 01 00 00       	mov    $0x12a,%esi
  8008c2:	48 bf e1 55 80 00 00 	movabs $0x8055e1,%rdi
  8008c9:	00 00 00 
  8008cc:	b8 00 00 00 00       	mov    $0x0,%eax
  8008d1:	48 b9 de 0b 80 00 00 	movabs $0x800bde,%rcx
  8008d8:	00 00 00 
  8008db:	ff d1                	callq  *%rcx
  8008dd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8008e1:	ba 08 00 00 00       	mov    $0x8,%edx
  8008e6:	be 00 00 00 00       	mov    $0x0,%esi
  8008eb:	48 89 c7             	mov    %rax,%rdi
  8008ee:	48 b8 65 1c 80 00 00 	movabs $0x801c65,%rax
  8008f5:	00 00 00 
  8008f8:	ff d0                	callq  *%rax
  8008fa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8008fe:	8b 95 cc fd ff ff    	mov    -0x234(%rbp),%edx
  800904:	89 10                	mov    %edx,(%rax)
  800906:	48 8d 95 d0 fd ff ff 	lea    -0x230(%rbp),%rdx
  80090d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800911:	48 89 d6             	mov    %rdx,%rsi
  800914:	48 89 c7             	mov    %rax,%rdi
  800917:	48 b8 3c 04 80 00 00 	movabs $0x80043c,%rax
  80091e:	00 00 00 
  800921:	ff d0                	callq  *%rax
  800923:	89 45 ec             	mov    %eax,-0x14(%rbp)
  800926:	81 7d ec 18 fc ff ff 	cmpl   $0xfffffc18,-0x14(%rbp)
  80092d:	75 1a                	jne    800949 <handle_client+0xe2>
  80092f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800933:	be 90 01 00 00       	mov    $0x190,%esi
  800938:	48 89 c7             	mov    %rax,%rdi
  80093b:	48 b8 b6 05 80 00 00 	movabs $0x8005b6,%rax
  800942:	00 00 00 
  800945:	ff d0                	callq  *%rax
  800947:	eb 43                	jmp    80098c <handle_client+0x125>
  800949:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80094d:	79 2a                	jns    800979 <handle_client+0x112>
  80094f:	48 ba a2 56 80 00 00 	movabs $0x8056a2,%rdx
  800956:	00 00 00 
  800959:	be 34 01 00 00       	mov    $0x134,%esi
  80095e:	48 bf e1 55 80 00 00 	movabs $0x8055e1,%rdi
  800965:	00 00 00 
  800968:	b8 00 00 00 00       	mov    $0x0,%eax
  80096d:	48 b9 de 0b 80 00 00 	movabs $0x800bde,%rcx
  800974:	00 00 00 
  800977:	ff d1                	callq  *%rcx
  800979:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80097d:	48 89 c7             	mov    %rax,%rdi
  800980:	48 b8 ae 06 80 00 00 	movabs $0x8006ae,%rax
  800987:	00 00 00 
  80098a:	ff d0                	callq  *%rax
  80098c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800990:	48 89 c7             	mov    %rax,%rdi
  800993:	48 b8 7f 00 80 00 00 	movabs $0x80007f,%rax
  80099a:	00 00 00 
  80099d:	ff d0                	callq  *%rax
  80099f:	90                   	nop
  8009a0:	8b 85 cc fd ff ff    	mov    -0x234(%rbp),%eax
  8009a6:	89 c7                	mov    %eax,%edi
  8009a8:	48 b8 cf 2a 80 00 00 	movabs $0x802acf,%rax
  8009af:	00 00 00 
  8009b2:	ff d0                	callq  *%rax
  8009b4:	c9                   	leaveq 
  8009b5:	c3                   	retq   

00000000008009b6 <umain>:
  8009b6:	55                   	push   %rbp
  8009b7:	48 89 e5             	mov    %rsp,%rbp
  8009ba:	53                   	push   %rbx
  8009bb:	48 83 ec 58          	sub    $0x58,%rsp
  8009bf:	89 7d ac             	mov    %edi,-0x54(%rbp)
  8009c2:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  8009c6:	48 b8 40 80 80 00 00 	movabs $0x808040,%rax
  8009cd:	00 00 00 
  8009d0:	48 bb af 56 80 00 00 	movabs $0x8056af,%rbx
  8009d7:	00 00 00 
  8009da:	48 89 18             	mov    %rbx,(%rax)
  8009dd:	ba 06 00 00 00       	mov    $0x6,%edx
  8009e2:	be 01 00 00 00       	mov    $0x1,%esi
  8009e7:	bf 02 00 00 00       	mov    $0x2,%edi
  8009ec:	48 b8 79 3b 80 00 00 	movabs $0x803b79,%rax
  8009f3:	00 00 00 
  8009f6:	ff d0                	callq  *%rax
  8009f8:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8009fb:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8009ff:	79 16                	jns    800a17 <umain+0x61>
  800a01:	48 bf b6 56 80 00 00 	movabs $0x8056b6,%rdi
  800a08:	00 00 00 
  800a0b:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800a12:	00 00 00 
  800a15:	ff d0                	callq  *%rax
  800a17:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  800a1b:	ba 10 00 00 00       	mov    $0x10,%edx
  800a20:	be 00 00 00 00       	mov    $0x0,%esi
  800a25:	48 89 c7             	mov    %rax,%rdi
  800a28:	48 b8 65 1c 80 00 00 	movabs $0x801c65,%rax
  800a2f:	00 00 00 
  800a32:	ff d0                	callq  *%rax
  800a34:	c6 45 d1 02          	movb   $0x2,-0x2f(%rbp)
  800a38:	bf 00 00 00 00       	mov    $0x0,%edi
  800a3d:	48 b8 bc 54 80 00 00 	movabs $0x8054bc,%rax
  800a44:	00 00 00 
  800a47:	ff d0                	callq  *%rax
  800a49:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  800a4c:	bf 50 00 00 00       	mov    $0x50,%edi
  800a51:	48 b8 77 54 80 00 00 	movabs $0x805477,%rax
  800a58:	00 00 00 
  800a5b:	ff d0                	callq  *%rax
  800a5d:	66 89 45 d2          	mov    %ax,-0x2e(%rbp)
  800a61:	48 8d 4d d0          	lea    -0x30(%rbp),%rcx
  800a65:	8b 45 ec             	mov    -0x14(%rbp),%eax
  800a68:	ba 10 00 00 00       	mov    $0x10,%edx
  800a6d:	48 89 ce             	mov    %rcx,%rsi
  800a70:	89 c7                	mov    %eax,%edi
  800a72:	48 b8 69 39 80 00 00 	movabs $0x803969,%rax
  800a79:	00 00 00 
  800a7c:	ff d0                	callq  *%rax
  800a7e:	85 c0                	test   %eax,%eax
  800a80:	79 16                	jns    800a98 <umain+0xe2>
  800a82:	48 bf d0 56 80 00 00 	movabs $0x8056d0,%rdi
  800a89:	00 00 00 
  800a8c:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800a93:	00 00 00 
  800a96:	ff d0                	callq  *%rax
  800a98:	8b 45 ec             	mov    -0x14(%rbp),%eax
  800a9b:	be 05 00 00 00       	mov    $0x5,%esi
  800aa0:	89 c7                	mov    %eax,%edi
  800aa2:	48 b8 8c 3a 80 00 00 	movabs $0x803a8c,%rax
  800aa9:	00 00 00 
  800aac:	ff d0                	callq  *%rax
  800aae:	85 c0                	test   %eax,%eax
  800ab0:	79 16                	jns    800ac8 <umain+0x112>
  800ab2:	48 bf f8 56 80 00 00 	movabs $0x8056f8,%rdi
  800ab9:	00 00 00 
  800abc:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800ac3:	00 00 00 
  800ac6:	ff d0                	callq  *%rax
  800ac8:	48 bf 20 57 80 00 00 	movabs $0x805720,%rdi
  800acf:	00 00 00 
  800ad2:	b8 00 00 00 00       	mov    $0x0,%eax
  800ad7:	48 ba 17 0e 80 00 00 	movabs $0x800e17,%rdx
  800ade:	00 00 00 
  800ae1:	ff d2                	callq  *%rdx
  800ae3:	c7 45 bc 10 00 00 00 	movl   $0x10,-0x44(%rbp)
  800aea:	48 8d 55 bc          	lea    -0x44(%rbp),%rdx
  800aee:	48 8d 4d c0          	lea    -0x40(%rbp),%rcx
  800af2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  800af5:	48 89 ce             	mov    %rcx,%rsi
  800af8:	89 c7                	mov    %eax,%edi
  800afa:	48 b8 fa 38 80 00 00 	movabs $0x8038fa,%rax
  800b01:	00 00 00 
  800b04:	ff d0                	callq  *%rax
  800b06:	89 45 e8             	mov    %eax,-0x18(%rbp)
  800b09:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  800b0d:	79 16                	jns    800b25 <umain+0x16f>
  800b0f:	48 bf 48 57 80 00 00 	movabs $0x805748,%rdi
  800b16:	00 00 00 
  800b19:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800b20:	00 00 00 
  800b23:	ff d0                	callq  *%rax
  800b25:	8b 45 e8             	mov    -0x18(%rbp),%eax
  800b28:	89 c7                	mov    %eax,%edi
  800b2a:	48 b8 67 08 80 00 00 	movabs $0x800867,%rax
  800b31:	00 00 00 
  800b34:	ff d0                	callq  *%rax
  800b36:	eb ab                	jmp    800ae3 <umain+0x12d>

0000000000800b38 <libmain>:
  800b38:	55                   	push   %rbp
  800b39:	48 89 e5             	mov    %rsp,%rbp
  800b3c:	48 83 ec 10          	sub    $0x10,%rsp
  800b40:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800b43:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800b47:	48 b8 7f 22 80 00 00 	movabs $0x80227f,%rax
  800b4e:	00 00 00 
  800b51:	ff d0                	callq  *%rax
  800b53:	25 ff 03 00 00       	and    $0x3ff,%eax
  800b58:	48 98                	cltq   
  800b5a:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  800b61:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  800b68:	00 00 00 
  800b6b:	48 01 c2             	add    %rax,%rdx
  800b6e:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  800b75:	00 00 00 
  800b78:	48 89 10             	mov    %rdx,(%rax)
  800b7b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800b7f:	7e 14                	jle    800b95 <libmain+0x5d>
  800b81:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800b85:	48 8b 10             	mov    (%rax),%rdx
  800b88:	48 b8 40 80 80 00 00 	movabs $0x808040,%rax
  800b8f:	00 00 00 
  800b92:	48 89 10             	mov    %rdx,(%rax)
  800b95:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800b99:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800b9c:	48 89 d6             	mov    %rdx,%rsi
  800b9f:	89 c7                	mov    %eax,%edi
  800ba1:	48 b8 b6 09 80 00 00 	movabs $0x8009b6,%rax
  800ba8:	00 00 00 
  800bab:	ff d0                	callq  *%rax
  800bad:	48 b8 bb 0b 80 00 00 	movabs $0x800bbb,%rax
  800bb4:	00 00 00 
  800bb7:	ff d0                	callq  *%rax
  800bb9:	c9                   	leaveq 
  800bba:	c3                   	retq   

0000000000800bbb <exit>:
  800bbb:	55                   	push   %rbp
  800bbc:	48 89 e5             	mov    %rsp,%rbp
  800bbf:	48 b8 1a 2b 80 00 00 	movabs $0x802b1a,%rax
  800bc6:	00 00 00 
  800bc9:	ff d0                	callq  *%rax
  800bcb:	bf 00 00 00 00       	mov    $0x0,%edi
  800bd0:	48 b8 3b 22 80 00 00 	movabs $0x80223b,%rax
  800bd7:	00 00 00 
  800bda:	ff d0                	callq  *%rax
  800bdc:	5d                   	pop    %rbp
  800bdd:	c3                   	retq   

0000000000800bde <_panic>:
  800bde:	55                   	push   %rbp
  800bdf:	48 89 e5             	mov    %rsp,%rbp
  800be2:	53                   	push   %rbx
  800be3:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  800bea:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  800bf1:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  800bf7:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  800bfe:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  800c05:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  800c0c:	84 c0                	test   %al,%al
  800c0e:	74 23                	je     800c33 <_panic+0x55>
  800c10:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  800c17:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  800c1b:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  800c1f:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  800c23:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  800c27:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  800c2b:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  800c2f:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  800c33:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  800c3a:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  800c41:	00 00 00 
  800c44:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  800c4b:	00 00 00 
  800c4e:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800c52:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  800c59:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  800c60:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800c67:	48 b8 40 80 80 00 00 	movabs $0x808040,%rax
  800c6e:	00 00 00 
  800c71:	48 8b 18             	mov    (%rax),%rbx
  800c74:	48 b8 7f 22 80 00 00 	movabs $0x80227f,%rax
  800c7b:	00 00 00 
  800c7e:	ff d0                	callq  *%rax
  800c80:	8b 8d 14 ff ff ff    	mov    -0xec(%rbp),%ecx
  800c86:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800c8d:	41 89 c8             	mov    %ecx,%r8d
  800c90:	48 89 d1             	mov    %rdx,%rcx
  800c93:	48 89 da             	mov    %rbx,%rdx
  800c96:	89 c6                	mov    %eax,%esi
  800c98:	48 bf 78 57 80 00 00 	movabs $0x805778,%rdi
  800c9f:	00 00 00 
  800ca2:	b8 00 00 00 00       	mov    $0x0,%eax
  800ca7:	49 b9 17 0e 80 00 00 	movabs $0x800e17,%r9
  800cae:	00 00 00 
  800cb1:	41 ff d1             	callq  *%r9
  800cb4:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  800cbb:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800cc2:	48 89 d6             	mov    %rdx,%rsi
  800cc5:	48 89 c7             	mov    %rax,%rdi
  800cc8:	48 b8 6b 0d 80 00 00 	movabs $0x800d6b,%rax
  800ccf:	00 00 00 
  800cd2:	ff d0                	callq  *%rax
  800cd4:	48 bf 9b 57 80 00 00 	movabs $0x80579b,%rdi
  800cdb:	00 00 00 
  800cde:	b8 00 00 00 00       	mov    $0x0,%eax
  800ce3:	48 ba 17 0e 80 00 00 	movabs $0x800e17,%rdx
  800cea:	00 00 00 
  800ced:	ff d2                	callq  *%rdx
  800cef:	cc                   	int3   
  800cf0:	eb fd                	jmp    800cef <_panic+0x111>

0000000000800cf2 <putch>:
  800cf2:	55                   	push   %rbp
  800cf3:	48 89 e5             	mov    %rsp,%rbp
  800cf6:	48 83 ec 10          	sub    $0x10,%rsp
  800cfa:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800cfd:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800d01:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800d05:	8b 00                	mov    (%rax),%eax
  800d07:	8d 48 01             	lea    0x1(%rax),%ecx
  800d0a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800d0e:	89 0a                	mov    %ecx,(%rdx)
  800d10:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800d13:	89 d1                	mov    %edx,%ecx
  800d15:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800d19:	48 98                	cltq   
  800d1b:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  800d1f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800d23:	8b 00                	mov    (%rax),%eax
  800d25:	3d ff 00 00 00       	cmp    $0xff,%eax
  800d2a:	75 2c                	jne    800d58 <putch+0x66>
  800d2c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800d30:	8b 00                	mov    (%rax),%eax
  800d32:	48 98                	cltq   
  800d34:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800d38:	48 83 c2 08          	add    $0x8,%rdx
  800d3c:	48 89 c6             	mov    %rax,%rsi
  800d3f:	48 89 d7             	mov    %rdx,%rdi
  800d42:	48 b8 b3 21 80 00 00 	movabs $0x8021b3,%rax
  800d49:	00 00 00 
  800d4c:	ff d0                	callq  *%rax
  800d4e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800d52:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  800d58:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800d5c:	8b 40 04             	mov    0x4(%rax),%eax
  800d5f:	8d 50 01             	lea    0x1(%rax),%edx
  800d62:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800d66:	89 50 04             	mov    %edx,0x4(%rax)
  800d69:	c9                   	leaveq 
  800d6a:	c3                   	retq   

0000000000800d6b <vcprintf>:
  800d6b:	55                   	push   %rbp
  800d6c:	48 89 e5             	mov    %rsp,%rbp
  800d6f:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  800d76:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  800d7d:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  800d84:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  800d8b:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  800d92:	48 8b 0a             	mov    (%rdx),%rcx
  800d95:	48 89 08             	mov    %rcx,(%rax)
  800d98:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800d9c:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800da0:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800da4:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800da8:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  800daf:	00 00 00 
  800db2:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  800db9:	00 00 00 
  800dbc:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  800dc3:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  800dca:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800dd1:	48 89 c6             	mov    %rax,%rsi
  800dd4:	48 bf f2 0c 80 00 00 	movabs $0x800cf2,%rdi
  800ddb:	00 00 00 
  800dde:	48 b8 ca 11 80 00 00 	movabs $0x8011ca,%rax
  800de5:	00 00 00 
  800de8:	ff d0                	callq  *%rax
  800dea:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  800df0:	48 98                	cltq   
  800df2:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  800df9:	48 83 c2 08          	add    $0x8,%rdx
  800dfd:	48 89 c6             	mov    %rax,%rsi
  800e00:	48 89 d7             	mov    %rdx,%rdi
  800e03:	48 b8 b3 21 80 00 00 	movabs $0x8021b3,%rax
  800e0a:	00 00 00 
  800e0d:	ff d0                	callq  *%rax
  800e0f:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  800e15:	c9                   	leaveq 
  800e16:	c3                   	retq   

0000000000800e17 <cprintf>:
  800e17:	55                   	push   %rbp
  800e18:	48 89 e5             	mov    %rsp,%rbp
  800e1b:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  800e22:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  800e29:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  800e30:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800e37:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800e3e:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800e45:	84 c0                	test   %al,%al
  800e47:	74 20                	je     800e69 <cprintf+0x52>
  800e49:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800e4d:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800e51:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800e55:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800e59:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800e5d:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800e61:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800e65:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800e69:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800e70:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  800e77:	00 00 00 
  800e7a:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800e81:	00 00 00 
  800e84:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800e88:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800e8f:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800e96:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800e9d:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800ea4:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800eab:	48 8b 0a             	mov    (%rdx),%rcx
  800eae:	48 89 08             	mov    %rcx,(%rax)
  800eb1:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800eb5:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800eb9:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800ebd:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800ec1:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  800ec8:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800ecf:	48 89 d6             	mov    %rdx,%rsi
  800ed2:	48 89 c7             	mov    %rax,%rdi
  800ed5:	48 b8 6b 0d 80 00 00 	movabs $0x800d6b,%rax
  800edc:	00 00 00 
  800edf:	ff d0                	callq  *%rax
  800ee1:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  800ee7:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  800eed:	c9                   	leaveq 
  800eee:	c3                   	retq   

0000000000800eef <printnum>:
  800eef:	55                   	push   %rbp
  800ef0:	48 89 e5             	mov    %rsp,%rbp
  800ef3:	53                   	push   %rbx
  800ef4:	48 83 ec 38          	sub    $0x38,%rsp
  800ef8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800efc:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800f00:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  800f04:	89 4d d4             	mov    %ecx,-0x2c(%rbp)
  800f07:	44 89 45 d0          	mov    %r8d,-0x30(%rbp)
  800f0b:	44 89 4d cc          	mov    %r9d,-0x34(%rbp)
  800f0f:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  800f12:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  800f16:	77 3b                	ja     800f53 <printnum+0x64>
  800f18:	8b 45 d0             	mov    -0x30(%rbp),%eax
  800f1b:	44 8d 40 ff          	lea    -0x1(%rax),%r8d
  800f1f:	8b 5d d4             	mov    -0x2c(%rbp),%ebx
  800f22:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800f26:	ba 00 00 00 00       	mov    $0x0,%edx
  800f2b:	48 f7 f3             	div    %rbx
  800f2e:	48 89 c2             	mov    %rax,%rdx
  800f31:	8b 7d cc             	mov    -0x34(%rbp),%edi
  800f34:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  800f37:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
  800f3b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f3f:	41 89 f9             	mov    %edi,%r9d
  800f42:	48 89 c7             	mov    %rax,%rdi
  800f45:	48 b8 ef 0e 80 00 00 	movabs $0x800eef,%rax
  800f4c:	00 00 00 
  800f4f:	ff d0                	callq  *%rax
  800f51:	eb 1e                	jmp    800f71 <printnum+0x82>
  800f53:	eb 12                	jmp    800f67 <printnum+0x78>
  800f55:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  800f59:	8b 55 cc             	mov    -0x34(%rbp),%edx
  800f5c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f60:	48 89 ce             	mov    %rcx,%rsi
  800f63:	89 d7                	mov    %edx,%edi
  800f65:	ff d0                	callq  *%rax
  800f67:	83 6d d0 01          	subl   $0x1,-0x30(%rbp)
  800f6b:	83 7d d0 00          	cmpl   $0x0,-0x30(%rbp)
  800f6f:	7f e4                	jg     800f55 <printnum+0x66>
  800f71:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  800f74:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800f78:	ba 00 00 00 00       	mov    $0x0,%edx
  800f7d:	48 f7 f1             	div    %rcx
  800f80:	48 89 d0             	mov    %rdx,%rax
  800f83:	48 ba 90 59 80 00 00 	movabs $0x805990,%rdx
  800f8a:	00 00 00 
  800f8d:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
  800f91:	0f be d0             	movsbl %al,%edx
  800f94:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  800f98:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f9c:	48 89 ce             	mov    %rcx,%rsi
  800f9f:	89 d7                	mov    %edx,%edi
  800fa1:	ff d0                	callq  *%rax
  800fa3:	48 83 c4 38          	add    $0x38,%rsp
  800fa7:	5b                   	pop    %rbx
  800fa8:	5d                   	pop    %rbp
  800fa9:	c3                   	retq   

0000000000800faa <getuint>:
  800faa:	55                   	push   %rbp
  800fab:	48 89 e5             	mov    %rsp,%rbp
  800fae:	48 83 ec 1c          	sub    $0x1c,%rsp
  800fb2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800fb6:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800fb9:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800fbd:	7e 52                	jle    801011 <getuint+0x67>
  800fbf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800fc3:	8b 00                	mov    (%rax),%eax
  800fc5:	83 f8 30             	cmp    $0x30,%eax
  800fc8:	73 24                	jae    800fee <getuint+0x44>
  800fca:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800fce:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800fd2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800fd6:	8b 00                	mov    (%rax),%eax
  800fd8:	89 c0                	mov    %eax,%eax
  800fda:	48 01 d0             	add    %rdx,%rax
  800fdd:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800fe1:	8b 12                	mov    (%rdx),%edx
  800fe3:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800fe6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800fea:	89 0a                	mov    %ecx,(%rdx)
  800fec:	eb 17                	jmp    801005 <getuint+0x5b>
  800fee:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ff2:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800ff6:	48 89 d0             	mov    %rdx,%rax
  800ff9:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800ffd:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801001:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  801005:	48 8b 00             	mov    (%rax),%rax
  801008:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80100c:	e9 a3 00 00 00       	jmpq   8010b4 <getuint+0x10a>
  801011:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  801015:	74 4f                	je     801066 <getuint+0xbc>
  801017:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80101b:	8b 00                	mov    (%rax),%eax
  80101d:	83 f8 30             	cmp    $0x30,%eax
  801020:	73 24                	jae    801046 <getuint+0x9c>
  801022:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801026:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80102a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80102e:	8b 00                	mov    (%rax),%eax
  801030:	89 c0                	mov    %eax,%eax
  801032:	48 01 d0             	add    %rdx,%rax
  801035:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801039:	8b 12                	mov    (%rdx),%edx
  80103b:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80103e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801042:	89 0a                	mov    %ecx,(%rdx)
  801044:	eb 17                	jmp    80105d <getuint+0xb3>
  801046:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80104a:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80104e:	48 89 d0             	mov    %rdx,%rax
  801051:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  801055:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801059:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80105d:	48 8b 00             	mov    (%rax),%rax
  801060:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801064:	eb 4e                	jmp    8010b4 <getuint+0x10a>
  801066:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80106a:	8b 00                	mov    (%rax),%eax
  80106c:	83 f8 30             	cmp    $0x30,%eax
  80106f:	73 24                	jae    801095 <getuint+0xeb>
  801071:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801075:	48 8b 50 10          	mov    0x10(%rax),%rdx
  801079:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80107d:	8b 00                	mov    (%rax),%eax
  80107f:	89 c0                	mov    %eax,%eax
  801081:	48 01 d0             	add    %rdx,%rax
  801084:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801088:	8b 12                	mov    (%rdx),%edx
  80108a:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80108d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801091:	89 0a                	mov    %ecx,(%rdx)
  801093:	eb 17                	jmp    8010ac <getuint+0x102>
  801095:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801099:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80109d:	48 89 d0             	mov    %rdx,%rax
  8010a0:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8010a4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8010a8:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8010ac:	8b 00                	mov    (%rax),%eax
  8010ae:	89 c0                	mov    %eax,%eax
  8010b0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8010b4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010b8:	c9                   	leaveq 
  8010b9:	c3                   	retq   

00000000008010ba <getint>:
  8010ba:	55                   	push   %rbp
  8010bb:	48 89 e5             	mov    %rsp,%rbp
  8010be:	48 83 ec 1c          	sub    $0x1c,%rsp
  8010c2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8010c6:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8010c9:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8010cd:	7e 52                	jle    801121 <getint+0x67>
  8010cf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010d3:	8b 00                	mov    (%rax),%eax
  8010d5:	83 f8 30             	cmp    $0x30,%eax
  8010d8:	73 24                	jae    8010fe <getint+0x44>
  8010da:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010de:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8010e2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010e6:	8b 00                	mov    (%rax),%eax
  8010e8:	89 c0                	mov    %eax,%eax
  8010ea:	48 01 d0             	add    %rdx,%rax
  8010ed:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8010f1:	8b 12                	mov    (%rdx),%edx
  8010f3:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8010f6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8010fa:	89 0a                	mov    %ecx,(%rdx)
  8010fc:	eb 17                	jmp    801115 <getint+0x5b>
  8010fe:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801102:	48 8b 50 08          	mov    0x8(%rax),%rdx
  801106:	48 89 d0             	mov    %rdx,%rax
  801109:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  80110d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801111:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  801115:	48 8b 00             	mov    (%rax),%rax
  801118:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80111c:	e9 a3 00 00 00       	jmpq   8011c4 <getint+0x10a>
  801121:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  801125:	74 4f                	je     801176 <getint+0xbc>
  801127:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80112b:	8b 00                	mov    (%rax),%eax
  80112d:	83 f8 30             	cmp    $0x30,%eax
  801130:	73 24                	jae    801156 <getint+0x9c>
  801132:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801136:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80113a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80113e:	8b 00                	mov    (%rax),%eax
  801140:	89 c0                	mov    %eax,%eax
  801142:	48 01 d0             	add    %rdx,%rax
  801145:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801149:	8b 12                	mov    (%rdx),%edx
  80114b:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80114e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801152:	89 0a                	mov    %ecx,(%rdx)
  801154:	eb 17                	jmp    80116d <getint+0xb3>
  801156:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80115a:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80115e:	48 89 d0             	mov    %rdx,%rax
  801161:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  801165:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801169:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80116d:	48 8b 00             	mov    (%rax),%rax
  801170:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801174:	eb 4e                	jmp    8011c4 <getint+0x10a>
  801176:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80117a:	8b 00                	mov    (%rax),%eax
  80117c:	83 f8 30             	cmp    $0x30,%eax
  80117f:	73 24                	jae    8011a5 <getint+0xeb>
  801181:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801185:	48 8b 50 10          	mov    0x10(%rax),%rdx
  801189:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80118d:	8b 00                	mov    (%rax),%eax
  80118f:	89 c0                	mov    %eax,%eax
  801191:	48 01 d0             	add    %rdx,%rax
  801194:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801198:	8b 12                	mov    (%rdx),%edx
  80119a:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80119d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8011a1:	89 0a                	mov    %ecx,(%rdx)
  8011a3:	eb 17                	jmp    8011bc <getint+0x102>
  8011a5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011a9:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8011ad:	48 89 d0             	mov    %rdx,%rax
  8011b0:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8011b4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8011b8:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8011bc:	8b 00                	mov    (%rax),%eax
  8011be:	48 98                	cltq   
  8011c0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8011c4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011c8:	c9                   	leaveq 
  8011c9:	c3                   	retq   

00000000008011ca <vprintfmt>:
  8011ca:	55                   	push   %rbp
  8011cb:	48 89 e5             	mov    %rsp,%rbp
  8011ce:	41 54                	push   %r12
  8011d0:	53                   	push   %rbx
  8011d1:	48 83 ec 60          	sub    $0x60,%rsp
  8011d5:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  8011d9:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  8011dd:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8011e1:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  8011e5:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8011e9:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  8011ed:	48 8b 0a             	mov    (%rdx),%rcx
  8011f0:	48 89 08             	mov    %rcx,(%rax)
  8011f3:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8011f7:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8011fb:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8011ff:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801203:	eb 17                	jmp    80121c <vprintfmt+0x52>
  801205:	85 db                	test   %ebx,%ebx
  801207:	0f 84 cc 04 00 00    	je     8016d9 <vprintfmt+0x50f>
  80120d:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801211:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801215:	48 89 d6             	mov    %rdx,%rsi
  801218:	89 df                	mov    %ebx,%edi
  80121a:	ff d0                	callq  *%rax
  80121c:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  801220:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801224:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  801228:	0f b6 00             	movzbl (%rax),%eax
  80122b:	0f b6 d8             	movzbl %al,%ebx
  80122e:	83 fb 25             	cmp    $0x25,%ebx
  801231:	75 d2                	jne    801205 <vprintfmt+0x3b>
  801233:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  801237:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  80123e:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  801245:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  80124c:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  801253:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  801257:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80125b:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  80125f:	0f b6 00             	movzbl (%rax),%eax
  801262:	0f b6 d8             	movzbl %al,%ebx
  801265:	8d 43 dd             	lea    -0x23(%rbx),%eax
  801268:	83 f8 55             	cmp    $0x55,%eax
  80126b:	0f 87 34 04 00 00    	ja     8016a5 <vprintfmt+0x4db>
  801271:	89 c0                	mov    %eax,%eax
  801273:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  80127a:	00 
  80127b:	48 b8 b8 59 80 00 00 	movabs $0x8059b8,%rax
  801282:	00 00 00 
  801285:	48 01 d0             	add    %rdx,%rax
  801288:	48 8b 00             	mov    (%rax),%rax
  80128b:	ff e0                	jmpq   *%rax
  80128d:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  801291:	eb c0                	jmp    801253 <vprintfmt+0x89>
  801293:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  801297:	eb ba                	jmp    801253 <vprintfmt+0x89>
  801299:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  8012a0:	8b 55 d8             	mov    -0x28(%rbp),%edx
  8012a3:	89 d0                	mov    %edx,%eax
  8012a5:	c1 e0 02             	shl    $0x2,%eax
  8012a8:	01 d0                	add    %edx,%eax
  8012aa:	01 c0                	add    %eax,%eax
  8012ac:	01 d8                	add    %ebx,%eax
  8012ae:	83 e8 30             	sub    $0x30,%eax
  8012b1:	89 45 d8             	mov    %eax,-0x28(%rbp)
  8012b4:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8012b8:	0f b6 00             	movzbl (%rax),%eax
  8012bb:	0f be d8             	movsbl %al,%ebx
  8012be:	83 fb 2f             	cmp    $0x2f,%ebx
  8012c1:	7e 0c                	jle    8012cf <vprintfmt+0x105>
  8012c3:	83 fb 39             	cmp    $0x39,%ebx
  8012c6:	7f 07                	jg     8012cf <vprintfmt+0x105>
  8012c8:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  8012cd:	eb d1                	jmp    8012a0 <vprintfmt+0xd6>
  8012cf:	eb 58                	jmp    801329 <vprintfmt+0x15f>
  8012d1:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8012d4:	83 f8 30             	cmp    $0x30,%eax
  8012d7:	73 17                	jae    8012f0 <vprintfmt+0x126>
  8012d9:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8012dd:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8012e0:	89 c0                	mov    %eax,%eax
  8012e2:	48 01 d0             	add    %rdx,%rax
  8012e5:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8012e8:	83 c2 08             	add    $0x8,%edx
  8012eb:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8012ee:	eb 0f                	jmp    8012ff <vprintfmt+0x135>
  8012f0:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  8012f4:	48 89 d0             	mov    %rdx,%rax
  8012f7:	48 83 c2 08          	add    $0x8,%rdx
  8012fb:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8012ff:	8b 00                	mov    (%rax),%eax
  801301:	89 45 d8             	mov    %eax,-0x28(%rbp)
  801304:	eb 23                	jmp    801329 <vprintfmt+0x15f>
  801306:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  80130a:	79 0c                	jns    801318 <vprintfmt+0x14e>
  80130c:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  801313:	e9 3b ff ff ff       	jmpq   801253 <vprintfmt+0x89>
  801318:	e9 36 ff ff ff       	jmpq   801253 <vprintfmt+0x89>
  80131d:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  801324:	e9 2a ff ff ff       	jmpq   801253 <vprintfmt+0x89>
  801329:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  80132d:	79 12                	jns    801341 <vprintfmt+0x177>
  80132f:	8b 45 d8             	mov    -0x28(%rbp),%eax
  801332:	89 45 dc             	mov    %eax,-0x24(%rbp)
  801335:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  80133c:	e9 12 ff ff ff       	jmpq   801253 <vprintfmt+0x89>
  801341:	e9 0d ff ff ff       	jmpq   801253 <vprintfmt+0x89>
  801346:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  80134a:	e9 04 ff ff ff       	jmpq   801253 <vprintfmt+0x89>
  80134f:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801352:	83 f8 30             	cmp    $0x30,%eax
  801355:	73 17                	jae    80136e <vprintfmt+0x1a4>
  801357:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80135b:	8b 45 b8             	mov    -0x48(%rbp),%eax
  80135e:	89 c0                	mov    %eax,%eax
  801360:	48 01 d0             	add    %rdx,%rax
  801363:	8b 55 b8             	mov    -0x48(%rbp),%edx
  801366:	83 c2 08             	add    $0x8,%edx
  801369:	89 55 b8             	mov    %edx,-0x48(%rbp)
  80136c:	eb 0f                	jmp    80137d <vprintfmt+0x1b3>
  80136e:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  801372:	48 89 d0             	mov    %rdx,%rax
  801375:	48 83 c2 08          	add    $0x8,%rdx
  801379:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  80137d:	8b 10                	mov    (%rax),%edx
  80137f:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  801383:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801387:	48 89 ce             	mov    %rcx,%rsi
  80138a:	89 d7                	mov    %edx,%edi
  80138c:	ff d0                	callq  *%rax
  80138e:	e9 40 03 00 00       	jmpq   8016d3 <vprintfmt+0x509>
  801393:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801396:	83 f8 30             	cmp    $0x30,%eax
  801399:	73 17                	jae    8013b2 <vprintfmt+0x1e8>
  80139b:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80139f:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8013a2:	89 c0                	mov    %eax,%eax
  8013a4:	48 01 d0             	add    %rdx,%rax
  8013a7:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8013aa:	83 c2 08             	add    $0x8,%edx
  8013ad:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8013b0:	eb 0f                	jmp    8013c1 <vprintfmt+0x1f7>
  8013b2:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  8013b6:	48 89 d0             	mov    %rdx,%rax
  8013b9:	48 83 c2 08          	add    $0x8,%rdx
  8013bd:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8013c1:	8b 18                	mov    (%rax),%ebx
  8013c3:	85 db                	test   %ebx,%ebx
  8013c5:	79 02                	jns    8013c9 <vprintfmt+0x1ff>
  8013c7:	f7 db                	neg    %ebx
  8013c9:	83 fb 15             	cmp    $0x15,%ebx
  8013cc:	7f 16                	jg     8013e4 <vprintfmt+0x21a>
  8013ce:	48 b8 e0 58 80 00 00 	movabs $0x8058e0,%rax
  8013d5:	00 00 00 
  8013d8:	48 63 d3             	movslq %ebx,%rdx
  8013db:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  8013df:	4d 85 e4             	test   %r12,%r12
  8013e2:	75 2e                	jne    801412 <vprintfmt+0x248>
  8013e4:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  8013e8:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8013ec:	89 d9                	mov    %ebx,%ecx
  8013ee:	48 ba a1 59 80 00 00 	movabs $0x8059a1,%rdx
  8013f5:	00 00 00 
  8013f8:	48 89 c7             	mov    %rax,%rdi
  8013fb:	b8 00 00 00 00       	mov    $0x0,%eax
  801400:	49 b8 e2 16 80 00 00 	movabs $0x8016e2,%r8
  801407:	00 00 00 
  80140a:	41 ff d0             	callq  *%r8
  80140d:	e9 c1 02 00 00       	jmpq   8016d3 <vprintfmt+0x509>
  801412:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  801416:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80141a:	4c 89 e1             	mov    %r12,%rcx
  80141d:	48 ba aa 59 80 00 00 	movabs $0x8059aa,%rdx
  801424:	00 00 00 
  801427:	48 89 c7             	mov    %rax,%rdi
  80142a:	b8 00 00 00 00       	mov    $0x0,%eax
  80142f:	49 b8 e2 16 80 00 00 	movabs $0x8016e2,%r8
  801436:	00 00 00 
  801439:	41 ff d0             	callq  *%r8
  80143c:	e9 92 02 00 00       	jmpq   8016d3 <vprintfmt+0x509>
  801441:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801444:	83 f8 30             	cmp    $0x30,%eax
  801447:	73 17                	jae    801460 <vprintfmt+0x296>
  801449:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80144d:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801450:	89 c0                	mov    %eax,%eax
  801452:	48 01 d0             	add    %rdx,%rax
  801455:	8b 55 b8             	mov    -0x48(%rbp),%edx
  801458:	83 c2 08             	add    $0x8,%edx
  80145b:	89 55 b8             	mov    %edx,-0x48(%rbp)
  80145e:	eb 0f                	jmp    80146f <vprintfmt+0x2a5>
  801460:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  801464:	48 89 d0             	mov    %rdx,%rax
  801467:	48 83 c2 08          	add    $0x8,%rdx
  80146b:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  80146f:	4c 8b 20             	mov    (%rax),%r12
  801472:	4d 85 e4             	test   %r12,%r12
  801475:	75 0a                	jne    801481 <vprintfmt+0x2b7>
  801477:	49 bc ad 59 80 00 00 	movabs $0x8059ad,%r12
  80147e:	00 00 00 
  801481:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  801485:	7e 3f                	jle    8014c6 <vprintfmt+0x2fc>
  801487:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  80148b:	74 39                	je     8014c6 <vprintfmt+0x2fc>
  80148d:	8b 45 d8             	mov    -0x28(%rbp),%eax
  801490:	48 98                	cltq   
  801492:	48 89 c6             	mov    %rax,%rsi
  801495:	4c 89 e7             	mov    %r12,%rdi
  801498:	48 b8 8e 19 80 00 00 	movabs $0x80198e,%rax
  80149f:	00 00 00 
  8014a2:	ff d0                	callq  *%rax
  8014a4:	29 45 dc             	sub    %eax,-0x24(%rbp)
  8014a7:	eb 17                	jmp    8014c0 <vprintfmt+0x2f6>
  8014a9:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  8014ad:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  8014b1:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8014b5:	48 89 ce             	mov    %rcx,%rsi
  8014b8:	89 d7                	mov    %edx,%edi
  8014ba:	ff d0                	callq  *%rax
  8014bc:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  8014c0:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8014c4:	7f e3                	jg     8014a9 <vprintfmt+0x2df>
  8014c6:	eb 37                	jmp    8014ff <vprintfmt+0x335>
  8014c8:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  8014cc:	74 1e                	je     8014ec <vprintfmt+0x322>
  8014ce:	83 fb 1f             	cmp    $0x1f,%ebx
  8014d1:	7e 05                	jle    8014d8 <vprintfmt+0x30e>
  8014d3:	83 fb 7e             	cmp    $0x7e,%ebx
  8014d6:	7e 14                	jle    8014ec <vprintfmt+0x322>
  8014d8:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8014dc:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8014e0:	48 89 d6             	mov    %rdx,%rsi
  8014e3:	bf 3f 00 00 00       	mov    $0x3f,%edi
  8014e8:	ff d0                	callq  *%rax
  8014ea:	eb 0f                	jmp    8014fb <vprintfmt+0x331>
  8014ec:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8014f0:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8014f4:	48 89 d6             	mov    %rdx,%rsi
  8014f7:	89 df                	mov    %ebx,%edi
  8014f9:	ff d0                	callq  *%rax
  8014fb:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  8014ff:	4c 89 e0             	mov    %r12,%rax
  801502:	4c 8d 60 01          	lea    0x1(%rax),%r12
  801506:	0f b6 00             	movzbl (%rax),%eax
  801509:	0f be d8             	movsbl %al,%ebx
  80150c:	85 db                	test   %ebx,%ebx
  80150e:	74 10                	je     801520 <vprintfmt+0x356>
  801510:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801514:	78 b2                	js     8014c8 <vprintfmt+0x2fe>
  801516:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  80151a:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  80151e:	79 a8                	jns    8014c8 <vprintfmt+0x2fe>
  801520:	eb 16                	jmp    801538 <vprintfmt+0x36e>
  801522:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801526:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80152a:	48 89 d6             	mov    %rdx,%rsi
  80152d:	bf 20 00 00 00       	mov    $0x20,%edi
  801532:	ff d0                	callq  *%rax
  801534:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  801538:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  80153c:	7f e4                	jg     801522 <vprintfmt+0x358>
  80153e:	e9 90 01 00 00       	jmpq   8016d3 <vprintfmt+0x509>
  801543:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  801547:	be 03 00 00 00       	mov    $0x3,%esi
  80154c:	48 89 c7             	mov    %rax,%rdi
  80154f:	48 b8 ba 10 80 00 00 	movabs $0x8010ba,%rax
  801556:	00 00 00 
  801559:	ff d0                	callq  *%rax
  80155b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80155f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801563:	48 85 c0             	test   %rax,%rax
  801566:	79 1d                	jns    801585 <vprintfmt+0x3bb>
  801568:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  80156c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801570:	48 89 d6             	mov    %rdx,%rsi
  801573:	bf 2d 00 00 00       	mov    $0x2d,%edi
  801578:	ff d0                	callq  *%rax
  80157a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80157e:	48 f7 d8             	neg    %rax
  801581:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801585:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  80158c:	e9 d5 00 00 00       	jmpq   801666 <vprintfmt+0x49c>
  801591:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  801595:	be 03 00 00 00       	mov    $0x3,%esi
  80159a:	48 89 c7             	mov    %rax,%rdi
  80159d:	48 b8 aa 0f 80 00 00 	movabs $0x800faa,%rax
  8015a4:	00 00 00 
  8015a7:	ff d0                	callq  *%rax
  8015a9:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8015ad:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  8015b4:	e9 ad 00 00 00       	jmpq   801666 <vprintfmt+0x49c>
  8015b9:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8015bd:	be 03 00 00 00       	mov    $0x3,%esi
  8015c2:	48 89 c7             	mov    %rax,%rdi
  8015c5:	48 b8 aa 0f 80 00 00 	movabs $0x800faa,%rax
  8015cc:	00 00 00 
  8015cf:	ff d0                	callq  *%rax
  8015d1:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8015d5:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  8015dc:	e9 85 00 00 00       	jmpq   801666 <vprintfmt+0x49c>
  8015e1:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8015e5:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8015e9:	48 89 d6             	mov    %rdx,%rsi
  8015ec:	bf 30 00 00 00       	mov    $0x30,%edi
  8015f1:	ff d0                	callq  *%rax
  8015f3:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8015f7:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8015fb:	48 89 d6             	mov    %rdx,%rsi
  8015fe:	bf 78 00 00 00       	mov    $0x78,%edi
  801603:	ff d0                	callq  *%rax
  801605:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801608:	83 f8 30             	cmp    $0x30,%eax
  80160b:	73 17                	jae    801624 <vprintfmt+0x45a>
  80160d:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  801611:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801614:	89 c0                	mov    %eax,%eax
  801616:	48 01 d0             	add    %rdx,%rax
  801619:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80161c:	83 c2 08             	add    $0x8,%edx
  80161f:	89 55 b8             	mov    %edx,-0x48(%rbp)
  801622:	eb 0f                	jmp    801633 <vprintfmt+0x469>
  801624:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  801628:	48 89 d0             	mov    %rdx,%rax
  80162b:	48 83 c2 08          	add    $0x8,%rdx
  80162f:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  801633:	48 8b 00             	mov    (%rax),%rax
  801636:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80163a:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  801641:	eb 23                	jmp    801666 <vprintfmt+0x49c>
  801643:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  801647:	be 03 00 00 00       	mov    $0x3,%esi
  80164c:	48 89 c7             	mov    %rax,%rdi
  80164f:	48 b8 aa 0f 80 00 00 	movabs $0x800faa,%rax
  801656:	00 00 00 
  801659:	ff d0                	callq  *%rax
  80165b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80165f:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  801666:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  80166b:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  80166e:	8b 7d dc             	mov    -0x24(%rbp),%edi
  801671:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801675:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  801679:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80167d:	45 89 c1             	mov    %r8d,%r9d
  801680:	41 89 f8             	mov    %edi,%r8d
  801683:	48 89 c7             	mov    %rax,%rdi
  801686:	48 b8 ef 0e 80 00 00 	movabs $0x800eef,%rax
  80168d:	00 00 00 
  801690:	ff d0                	callq  *%rax
  801692:	eb 3f                	jmp    8016d3 <vprintfmt+0x509>
  801694:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801698:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80169c:	48 89 d6             	mov    %rdx,%rsi
  80169f:	89 df                	mov    %ebx,%edi
  8016a1:	ff d0                	callq  *%rax
  8016a3:	eb 2e                	jmp    8016d3 <vprintfmt+0x509>
  8016a5:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8016a9:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8016ad:	48 89 d6             	mov    %rdx,%rsi
  8016b0:	bf 25 00 00 00       	mov    $0x25,%edi
  8016b5:	ff d0                	callq  *%rax
  8016b7:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  8016bc:	eb 05                	jmp    8016c3 <vprintfmt+0x4f9>
  8016be:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  8016c3:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8016c7:	48 83 e8 01          	sub    $0x1,%rax
  8016cb:	0f b6 00             	movzbl (%rax),%eax
  8016ce:	3c 25                	cmp    $0x25,%al
  8016d0:	75 ec                	jne    8016be <vprintfmt+0x4f4>
  8016d2:	90                   	nop
  8016d3:	90                   	nop
  8016d4:	e9 43 fb ff ff       	jmpq   80121c <vprintfmt+0x52>
  8016d9:	48 83 c4 60          	add    $0x60,%rsp
  8016dd:	5b                   	pop    %rbx
  8016de:	41 5c                	pop    %r12
  8016e0:	5d                   	pop    %rbp
  8016e1:	c3                   	retq   

00000000008016e2 <printfmt>:
  8016e2:	55                   	push   %rbp
  8016e3:	48 89 e5             	mov    %rsp,%rbp
  8016e6:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  8016ed:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  8016f4:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  8016fb:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  801702:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  801709:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  801710:	84 c0                	test   %al,%al
  801712:	74 20                	je     801734 <printfmt+0x52>
  801714:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  801718:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80171c:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  801720:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  801724:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  801728:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  80172c:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  801730:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  801734:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  80173b:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  801742:	00 00 00 
  801745:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  80174c:	00 00 00 
  80174f:	48 8d 45 10          	lea    0x10(%rbp),%rax
  801753:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  80175a:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  801761:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  801768:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  80176f:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  801776:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  80177d:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  801784:	48 89 c7             	mov    %rax,%rdi
  801787:	48 b8 ca 11 80 00 00 	movabs $0x8011ca,%rax
  80178e:	00 00 00 
  801791:	ff d0                	callq  *%rax
  801793:	c9                   	leaveq 
  801794:	c3                   	retq   

0000000000801795 <sprintputch>:
  801795:	55                   	push   %rbp
  801796:	48 89 e5             	mov    %rsp,%rbp
  801799:	48 83 ec 10          	sub    $0x10,%rsp
  80179d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8017a0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8017a4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017a8:	8b 40 10             	mov    0x10(%rax),%eax
  8017ab:	8d 50 01             	lea    0x1(%rax),%edx
  8017ae:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017b2:	89 50 10             	mov    %edx,0x10(%rax)
  8017b5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017b9:	48 8b 10             	mov    (%rax),%rdx
  8017bc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017c0:	48 8b 40 08          	mov    0x8(%rax),%rax
  8017c4:	48 39 c2             	cmp    %rax,%rdx
  8017c7:	73 17                	jae    8017e0 <sprintputch+0x4b>
  8017c9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017cd:	48 8b 00             	mov    (%rax),%rax
  8017d0:	48 8d 48 01          	lea    0x1(%rax),%rcx
  8017d4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8017d8:	48 89 0a             	mov    %rcx,(%rdx)
  8017db:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8017de:	88 10                	mov    %dl,(%rax)
  8017e0:	c9                   	leaveq 
  8017e1:	c3                   	retq   

00000000008017e2 <vsnprintf>:
  8017e2:	55                   	push   %rbp
  8017e3:	48 89 e5             	mov    %rsp,%rbp
  8017e6:	48 83 ec 50          	sub    $0x50,%rsp
  8017ea:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  8017ee:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  8017f1:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  8017f5:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  8017f9:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  8017fd:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  801801:	48 8b 0a             	mov    (%rdx),%rcx
  801804:	48 89 08             	mov    %rcx,(%rax)
  801807:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80180b:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80180f:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801813:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801817:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80181b:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  80181f:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  801822:	48 98                	cltq   
  801824:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801828:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80182c:	48 01 d0             	add    %rdx,%rax
  80182f:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  801833:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  80183a:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  80183f:	74 06                	je     801847 <vsnprintf+0x65>
  801841:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  801845:	7f 07                	jg     80184e <vsnprintf+0x6c>
  801847:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80184c:	eb 2f                	jmp    80187d <vsnprintf+0x9b>
  80184e:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  801852:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  801856:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  80185a:	48 89 c6             	mov    %rax,%rsi
  80185d:	48 bf 95 17 80 00 00 	movabs $0x801795,%rdi
  801864:	00 00 00 
  801867:	48 b8 ca 11 80 00 00 	movabs $0x8011ca,%rax
  80186e:	00 00 00 
  801871:	ff d0                	callq  *%rax
  801873:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801877:	c6 00 00             	movb   $0x0,(%rax)
  80187a:	8b 45 e0             	mov    -0x20(%rbp),%eax
  80187d:	c9                   	leaveq 
  80187e:	c3                   	retq   

000000000080187f <snprintf>:
  80187f:	55                   	push   %rbp
  801880:	48 89 e5             	mov    %rsp,%rbp
  801883:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  80188a:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  801891:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  801897:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  80189e:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8018a5:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8018ac:	84 c0                	test   %al,%al
  8018ae:	74 20                	je     8018d0 <snprintf+0x51>
  8018b0:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8018b4:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8018b8:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8018bc:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8018c0:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8018c4:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8018c8:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8018cc:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8018d0:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  8018d7:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  8018de:	00 00 00 
  8018e1:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8018e8:	00 00 00 
  8018eb:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8018ef:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8018f6:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8018fd:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  801904:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  80190b:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  801912:	48 8b 0a             	mov    (%rdx),%rcx
  801915:	48 89 08             	mov    %rcx,(%rax)
  801918:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80191c:	48 89 48 08          	mov    %rcx,0x8(%rax)
  801920:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801924:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801928:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  80192f:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  801936:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  80193c:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  801943:	48 89 c7             	mov    %rax,%rdi
  801946:	48 b8 e2 17 80 00 00 	movabs $0x8017e2,%rax
  80194d:	00 00 00 
  801950:	ff d0                	callq  *%rax
  801952:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  801958:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  80195e:	c9                   	leaveq 
  80195f:	c3                   	retq   

0000000000801960 <strlen>:
  801960:	55                   	push   %rbp
  801961:	48 89 e5             	mov    %rsp,%rbp
  801964:	48 83 ec 18          	sub    $0x18,%rsp
  801968:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80196c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801973:	eb 09                	jmp    80197e <strlen+0x1e>
  801975:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801979:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80197e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801982:	0f b6 00             	movzbl (%rax),%eax
  801985:	84 c0                	test   %al,%al
  801987:	75 ec                	jne    801975 <strlen+0x15>
  801989:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80198c:	c9                   	leaveq 
  80198d:	c3                   	retq   

000000000080198e <strnlen>:
  80198e:	55                   	push   %rbp
  80198f:	48 89 e5             	mov    %rsp,%rbp
  801992:	48 83 ec 20          	sub    $0x20,%rsp
  801996:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80199a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80199e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8019a5:	eb 0e                	jmp    8019b5 <strnlen+0x27>
  8019a7:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8019ab:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8019b0:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  8019b5:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8019ba:	74 0b                	je     8019c7 <strnlen+0x39>
  8019bc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8019c0:	0f b6 00             	movzbl (%rax),%eax
  8019c3:	84 c0                	test   %al,%al
  8019c5:	75 e0                	jne    8019a7 <strnlen+0x19>
  8019c7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8019ca:	c9                   	leaveq 
  8019cb:	c3                   	retq   

00000000008019cc <strcpy>:
  8019cc:	55                   	push   %rbp
  8019cd:	48 89 e5             	mov    %rsp,%rbp
  8019d0:	48 83 ec 20          	sub    $0x20,%rsp
  8019d4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8019d8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8019dc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8019e0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8019e4:	90                   	nop
  8019e5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8019e9:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8019ed:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8019f1:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8019f5:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8019f9:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8019fd:	0f b6 12             	movzbl (%rdx),%edx
  801a00:	88 10                	mov    %dl,(%rax)
  801a02:	0f b6 00             	movzbl (%rax),%eax
  801a05:	84 c0                	test   %al,%al
  801a07:	75 dc                	jne    8019e5 <strcpy+0x19>
  801a09:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801a0d:	c9                   	leaveq 
  801a0e:	c3                   	retq   

0000000000801a0f <strcat>:
  801a0f:	55                   	push   %rbp
  801a10:	48 89 e5             	mov    %rsp,%rbp
  801a13:	48 83 ec 20          	sub    $0x20,%rsp
  801a17:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801a1b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801a1f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801a23:	48 89 c7             	mov    %rax,%rdi
  801a26:	48 b8 60 19 80 00 00 	movabs $0x801960,%rax
  801a2d:	00 00 00 
  801a30:	ff d0                	callq  *%rax
  801a32:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801a35:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a38:	48 63 d0             	movslq %eax,%rdx
  801a3b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801a3f:	48 01 c2             	add    %rax,%rdx
  801a42:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801a46:	48 89 c6             	mov    %rax,%rsi
  801a49:	48 89 d7             	mov    %rdx,%rdi
  801a4c:	48 b8 cc 19 80 00 00 	movabs $0x8019cc,%rax
  801a53:	00 00 00 
  801a56:	ff d0                	callq  *%rax
  801a58:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801a5c:	c9                   	leaveq 
  801a5d:	c3                   	retq   

0000000000801a5e <strncpy>:
  801a5e:	55                   	push   %rbp
  801a5f:	48 89 e5             	mov    %rsp,%rbp
  801a62:	48 83 ec 28          	sub    $0x28,%rsp
  801a66:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801a6a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801a6e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801a72:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801a76:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801a7a:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  801a81:	00 
  801a82:	eb 2a                	jmp    801aae <strncpy+0x50>
  801a84:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801a88:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801a8c:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801a90:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801a94:	0f b6 12             	movzbl (%rdx),%edx
  801a97:	88 10                	mov    %dl,(%rax)
  801a99:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801a9d:	0f b6 00             	movzbl (%rax),%eax
  801aa0:	84 c0                	test   %al,%al
  801aa2:	74 05                	je     801aa9 <strncpy+0x4b>
  801aa4:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  801aa9:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801aae:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ab2:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  801ab6:	72 cc                	jb     801a84 <strncpy+0x26>
  801ab8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801abc:	c9                   	leaveq 
  801abd:	c3                   	retq   

0000000000801abe <strlcpy>:
  801abe:	55                   	push   %rbp
  801abf:	48 89 e5             	mov    %rsp,%rbp
  801ac2:	48 83 ec 28          	sub    $0x28,%rsp
  801ac6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801aca:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801ace:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801ad2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801ad6:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801ada:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801adf:	74 3d                	je     801b1e <strlcpy+0x60>
  801ae1:	eb 1d                	jmp    801b00 <strlcpy+0x42>
  801ae3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801ae7:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801aeb:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801aef:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801af3:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801af7:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  801afb:	0f b6 12             	movzbl (%rdx),%edx
  801afe:	88 10                	mov    %dl,(%rax)
  801b00:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  801b05:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801b0a:	74 0b                	je     801b17 <strlcpy+0x59>
  801b0c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801b10:	0f b6 00             	movzbl (%rax),%eax
  801b13:	84 c0                	test   %al,%al
  801b15:	75 cc                	jne    801ae3 <strlcpy+0x25>
  801b17:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801b1b:	c6 00 00             	movb   $0x0,(%rax)
  801b1e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801b22:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b26:	48 29 c2             	sub    %rax,%rdx
  801b29:	48 89 d0             	mov    %rdx,%rax
  801b2c:	c9                   	leaveq 
  801b2d:	c3                   	retq   

0000000000801b2e <strcmp>:
  801b2e:	55                   	push   %rbp
  801b2f:	48 89 e5             	mov    %rsp,%rbp
  801b32:	48 83 ec 10          	sub    $0x10,%rsp
  801b36:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801b3a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b3e:	eb 0a                	jmp    801b4a <strcmp+0x1c>
  801b40:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801b45:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801b4a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b4e:	0f b6 00             	movzbl (%rax),%eax
  801b51:	84 c0                	test   %al,%al
  801b53:	74 12                	je     801b67 <strcmp+0x39>
  801b55:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b59:	0f b6 10             	movzbl (%rax),%edx
  801b5c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801b60:	0f b6 00             	movzbl (%rax),%eax
  801b63:	38 c2                	cmp    %al,%dl
  801b65:	74 d9                	je     801b40 <strcmp+0x12>
  801b67:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b6b:	0f b6 00             	movzbl (%rax),%eax
  801b6e:	0f b6 d0             	movzbl %al,%edx
  801b71:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801b75:	0f b6 00             	movzbl (%rax),%eax
  801b78:	0f b6 c0             	movzbl %al,%eax
  801b7b:	29 c2                	sub    %eax,%edx
  801b7d:	89 d0                	mov    %edx,%eax
  801b7f:	c9                   	leaveq 
  801b80:	c3                   	retq   

0000000000801b81 <strncmp>:
  801b81:	55                   	push   %rbp
  801b82:	48 89 e5             	mov    %rsp,%rbp
  801b85:	48 83 ec 18          	sub    $0x18,%rsp
  801b89:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801b8d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b91:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801b95:	eb 0f                	jmp    801ba6 <strncmp+0x25>
  801b97:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  801b9c:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801ba1:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801ba6:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801bab:	74 1d                	je     801bca <strncmp+0x49>
  801bad:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801bb1:	0f b6 00             	movzbl (%rax),%eax
  801bb4:	84 c0                	test   %al,%al
  801bb6:	74 12                	je     801bca <strncmp+0x49>
  801bb8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801bbc:	0f b6 10             	movzbl (%rax),%edx
  801bbf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801bc3:	0f b6 00             	movzbl (%rax),%eax
  801bc6:	38 c2                	cmp    %al,%dl
  801bc8:	74 cd                	je     801b97 <strncmp+0x16>
  801bca:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801bcf:	75 07                	jne    801bd8 <strncmp+0x57>
  801bd1:	b8 00 00 00 00       	mov    $0x0,%eax
  801bd6:	eb 18                	jmp    801bf0 <strncmp+0x6f>
  801bd8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801bdc:	0f b6 00             	movzbl (%rax),%eax
  801bdf:	0f b6 d0             	movzbl %al,%edx
  801be2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801be6:	0f b6 00             	movzbl (%rax),%eax
  801be9:	0f b6 c0             	movzbl %al,%eax
  801bec:	29 c2                	sub    %eax,%edx
  801bee:	89 d0                	mov    %edx,%eax
  801bf0:	c9                   	leaveq 
  801bf1:	c3                   	retq   

0000000000801bf2 <strchr>:
  801bf2:	55                   	push   %rbp
  801bf3:	48 89 e5             	mov    %rsp,%rbp
  801bf6:	48 83 ec 0c          	sub    $0xc,%rsp
  801bfa:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801bfe:	89 f0                	mov    %esi,%eax
  801c00:	88 45 f4             	mov    %al,-0xc(%rbp)
  801c03:	eb 17                	jmp    801c1c <strchr+0x2a>
  801c05:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c09:	0f b6 00             	movzbl (%rax),%eax
  801c0c:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801c0f:	75 06                	jne    801c17 <strchr+0x25>
  801c11:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c15:	eb 15                	jmp    801c2c <strchr+0x3a>
  801c17:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801c1c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c20:	0f b6 00             	movzbl (%rax),%eax
  801c23:	84 c0                	test   %al,%al
  801c25:	75 de                	jne    801c05 <strchr+0x13>
  801c27:	b8 00 00 00 00       	mov    $0x0,%eax
  801c2c:	c9                   	leaveq 
  801c2d:	c3                   	retq   

0000000000801c2e <strfind>:
  801c2e:	55                   	push   %rbp
  801c2f:	48 89 e5             	mov    %rsp,%rbp
  801c32:	48 83 ec 0c          	sub    $0xc,%rsp
  801c36:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c3a:	89 f0                	mov    %esi,%eax
  801c3c:	88 45 f4             	mov    %al,-0xc(%rbp)
  801c3f:	eb 13                	jmp    801c54 <strfind+0x26>
  801c41:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c45:	0f b6 00             	movzbl (%rax),%eax
  801c48:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801c4b:	75 02                	jne    801c4f <strfind+0x21>
  801c4d:	eb 10                	jmp    801c5f <strfind+0x31>
  801c4f:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801c54:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c58:	0f b6 00             	movzbl (%rax),%eax
  801c5b:	84 c0                	test   %al,%al
  801c5d:	75 e2                	jne    801c41 <strfind+0x13>
  801c5f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c63:	c9                   	leaveq 
  801c64:	c3                   	retq   

0000000000801c65 <memset>:
  801c65:	55                   	push   %rbp
  801c66:	48 89 e5             	mov    %rsp,%rbp
  801c69:	48 83 ec 18          	sub    $0x18,%rsp
  801c6d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c71:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801c74:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801c78:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801c7d:	75 06                	jne    801c85 <memset+0x20>
  801c7f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c83:	eb 69                	jmp    801cee <memset+0x89>
  801c85:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c89:	83 e0 03             	and    $0x3,%eax
  801c8c:	48 85 c0             	test   %rax,%rax
  801c8f:	75 48                	jne    801cd9 <memset+0x74>
  801c91:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801c95:	83 e0 03             	and    $0x3,%eax
  801c98:	48 85 c0             	test   %rax,%rax
  801c9b:	75 3c                	jne    801cd9 <memset+0x74>
  801c9d:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  801ca4:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801ca7:	c1 e0 18             	shl    $0x18,%eax
  801caa:	89 c2                	mov    %eax,%edx
  801cac:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801caf:	c1 e0 10             	shl    $0x10,%eax
  801cb2:	09 c2                	or     %eax,%edx
  801cb4:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801cb7:	c1 e0 08             	shl    $0x8,%eax
  801cba:	09 d0                	or     %edx,%eax
  801cbc:	09 45 f4             	or     %eax,-0xc(%rbp)
  801cbf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801cc3:	48 c1 e8 02          	shr    $0x2,%rax
  801cc7:	48 89 c1             	mov    %rax,%rcx
  801cca:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801cce:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801cd1:	48 89 d7             	mov    %rdx,%rdi
  801cd4:	fc                   	cld    
  801cd5:	f3 ab                	rep stos %eax,%es:(%rdi)
  801cd7:	eb 11                	jmp    801cea <memset+0x85>
  801cd9:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801cdd:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801ce0:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801ce4:	48 89 d7             	mov    %rdx,%rdi
  801ce7:	fc                   	cld    
  801ce8:	f3 aa                	rep stos %al,%es:(%rdi)
  801cea:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801cee:	c9                   	leaveq 
  801cef:	c3                   	retq   

0000000000801cf0 <memmove>:
  801cf0:	55                   	push   %rbp
  801cf1:	48 89 e5             	mov    %rsp,%rbp
  801cf4:	48 83 ec 28          	sub    $0x28,%rsp
  801cf8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801cfc:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801d00:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801d04:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801d08:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801d0c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801d10:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801d14:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d18:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801d1c:	0f 83 88 00 00 00    	jae    801daa <memmove+0xba>
  801d22:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801d26:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801d2a:	48 01 d0             	add    %rdx,%rax
  801d2d:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801d31:	76 77                	jbe    801daa <memmove+0xba>
  801d33:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801d37:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  801d3b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801d3f:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  801d43:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d47:	83 e0 03             	and    $0x3,%eax
  801d4a:	48 85 c0             	test   %rax,%rax
  801d4d:	75 3b                	jne    801d8a <memmove+0x9a>
  801d4f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801d53:	83 e0 03             	and    $0x3,%eax
  801d56:	48 85 c0             	test   %rax,%rax
  801d59:	75 2f                	jne    801d8a <memmove+0x9a>
  801d5b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801d5f:	83 e0 03             	and    $0x3,%eax
  801d62:	48 85 c0             	test   %rax,%rax
  801d65:	75 23                	jne    801d8a <memmove+0x9a>
  801d67:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801d6b:	48 83 e8 04          	sub    $0x4,%rax
  801d6f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801d73:	48 83 ea 04          	sub    $0x4,%rdx
  801d77:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801d7b:	48 c1 e9 02          	shr    $0x2,%rcx
  801d7f:	48 89 c7             	mov    %rax,%rdi
  801d82:	48 89 d6             	mov    %rdx,%rsi
  801d85:	fd                   	std    
  801d86:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801d88:	eb 1d                	jmp    801da7 <memmove+0xb7>
  801d8a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801d8e:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801d92:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d96:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  801d9a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801d9e:	48 89 d7             	mov    %rdx,%rdi
  801da1:	48 89 c1             	mov    %rax,%rcx
  801da4:	fd                   	std    
  801da5:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801da7:	fc                   	cld    
  801da8:	eb 57                	jmp    801e01 <memmove+0x111>
  801daa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801dae:	83 e0 03             	and    $0x3,%eax
  801db1:	48 85 c0             	test   %rax,%rax
  801db4:	75 36                	jne    801dec <memmove+0xfc>
  801db6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801dba:	83 e0 03             	and    $0x3,%eax
  801dbd:	48 85 c0             	test   %rax,%rax
  801dc0:	75 2a                	jne    801dec <memmove+0xfc>
  801dc2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801dc6:	83 e0 03             	and    $0x3,%eax
  801dc9:	48 85 c0             	test   %rax,%rax
  801dcc:	75 1e                	jne    801dec <memmove+0xfc>
  801dce:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801dd2:	48 c1 e8 02          	shr    $0x2,%rax
  801dd6:	48 89 c1             	mov    %rax,%rcx
  801dd9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801ddd:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801de1:	48 89 c7             	mov    %rax,%rdi
  801de4:	48 89 d6             	mov    %rdx,%rsi
  801de7:	fc                   	cld    
  801de8:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801dea:	eb 15                	jmp    801e01 <memmove+0x111>
  801dec:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801df0:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801df4:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801df8:	48 89 c7             	mov    %rax,%rdi
  801dfb:	48 89 d6             	mov    %rdx,%rsi
  801dfe:	fc                   	cld    
  801dff:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801e01:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801e05:	c9                   	leaveq 
  801e06:	c3                   	retq   

0000000000801e07 <memcpy>:
  801e07:	55                   	push   %rbp
  801e08:	48 89 e5             	mov    %rsp,%rbp
  801e0b:	48 83 ec 18          	sub    $0x18,%rsp
  801e0f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801e13:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801e17:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801e1b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801e1f:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  801e23:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e27:	48 89 ce             	mov    %rcx,%rsi
  801e2a:	48 89 c7             	mov    %rax,%rdi
  801e2d:	48 b8 f0 1c 80 00 00 	movabs $0x801cf0,%rax
  801e34:	00 00 00 
  801e37:	ff d0                	callq  *%rax
  801e39:	c9                   	leaveq 
  801e3a:	c3                   	retq   

0000000000801e3b <memcmp>:
  801e3b:	55                   	push   %rbp
  801e3c:	48 89 e5             	mov    %rsp,%rbp
  801e3f:	48 83 ec 28          	sub    $0x28,%rsp
  801e43:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801e47:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801e4b:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801e4f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801e53:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801e57:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801e5b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801e5f:	eb 36                	jmp    801e97 <memcmp+0x5c>
  801e61:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e65:	0f b6 10             	movzbl (%rax),%edx
  801e68:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801e6c:	0f b6 00             	movzbl (%rax),%eax
  801e6f:	38 c2                	cmp    %al,%dl
  801e71:	74 1a                	je     801e8d <memcmp+0x52>
  801e73:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e77:	0f b6 00             	movzbl (%rax),%eax
  801e7a:	0f b6 d0             	movzbl %al,%edx
  801e7d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801e81:	0f b6 00             	movzbl (%rax),%eax
  801e84:	0f b6 c0             	movzbl %al,%eax
  801e87:	29 c2                	sub    %eax,%edx
  801e89:	89 d0                	mov    %edx,%eax
  801e8b:	eb 20                	jmp    801ead <memcmp+0x72>
  801e8d:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801e92:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801e97:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e9b:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801e9f:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801ea3:	48 85 c0             	test   %rax,%rax
  801ea6:	75 b9                	jne    801e61 <memcmp+0x26>
  801ea8:	b8 00 00 00 00       	mov    $0x0,%eax
  801ead:	c9                   	leaveq 
  801eae:	c3                   	retq   

0000000000801eaf <memfind>:
  801eaf:	55                   	push   %rbp
  801eb0:	48 89 e5             	mov    %rsp,%rbp
  801eb3:	48 83 ec 28          	sub    $0x28,%rsp
  801eb7:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801ebb:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  801ebe:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801ec2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ec6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801eca:	48 01 d0             	add    %rdx,%rax
  801ecd:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801ed1:	eb 15                	jmp    801ee8 <memfind+0x39>
  801ed3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801ed7:	0f b6 10             	movzbl (%rax),%edx
  801eda:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801edd:	38 c2                	cmp    %al,%dl
  801edf:	75 02                	jne    801ee3 <memfind+0x34>
  801ee1:	eb 0f                	jmp    801ef2 <memfind+0x43>
  801ee3:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801ee8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801eec:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  801ef0:	72 e1                	jb     801ed3 <memfind+0x24>
  801ef2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801ef6:	c9                   	leaveq 
  801ef7:	c3                   	retq   

0000000000801ef8 <strtol>:
  801ef8:	55                   	push   %rbp
  801ef9:	48 89 e5             	mov    %rsp,%rbp
  801efc:	48 83 ec 34          	sub    $0x34,%rsp
  801f00:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801f04:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801f08:	89 55 cc             	mov    %edx,-0x34(%rbp)
  801f0b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801f12:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  801f19:	00 
  801f1a:	eb 05                	jmp    801f21 <strtol+0x29>
  801f1c:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801f21:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f25:	0f b6 00             	movzbl (%rax),%eax
  801f28:	3c 20                	cmp    $0x20,%al
  801f2a:	74 f0                	je     801f1c <strtol+0x24>
  801f2c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f30:	0f b6 00             	movzbl (%rax),%eax
  801f33:	3c 09                	cmp    $0x9,%al
  801f35:	74 e5                	je     801f1c <strtol+0x24>
  801f37:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f3b:	0f b6 00             	movzbl (%rax),%eax
  801f3e:	3c 2b                	cmp    $0x2b,%al
  801f40:	75 07                	jne    801f49 <strtol+0x51>
  801f42:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801f47:	eb 17                	jmp    801f60 <strtol+0x68>
  801f49:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f4d:	0f b6 00             	movzbl (%rax),%eax
  801f50:	3c 2d                	cmp    $0x2d,%al
  801f52:	75 0c                	jne    801f60 <strtol+0x68>
  801f54:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801f59:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  801f60:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801f64:	74 06                	je     801f6c <strtol+0x74>
  801f66:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  801f6a:	75 28                	jne    801f94 <strtol+0x9c>
  801f6c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f70:	0f b6 00             	movzbl (%rax),%eax
  801f73:	3c 30                	cmp    $0x30,%al
  801f75:	75 1d                	jne    801f94 <strtol+0x9c>
  801f77:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f7b:	48 83 c0 01          	add    $0x1,%rax
  801f7f:	0f b6 00             	movzbl (%rax),%eax
  801f82:	3c 78                	cmp    $0x78,%al
  801f84:	75 0e                	jne    801f94 <strtol+0x9c>
  801f86:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  801f8b:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  801f92:	eb 2c                	jmp    801fc0 <strtol+0xc8>
  801f94:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801f98:	75 19                	jne    801fb3 <strtol+0xbb>
  801f9a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f9e:	0f b6 00             	movzbl (%rax),%eax
  801fa1:	3c 30                	cmp    $0x30,%al
  801fa3:	75 0e                	jne    801fb3 <strtol+0xbb>
  801fa5:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801faa:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  801fb1:	eb 0d                	jmp    801fc0 <strtol+0xc8>
  801fb3:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801fb7:	75 07                	jne    801fc0 <strtol+0xc8>
  801fb9:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  801fc0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801fc4:	0f b6 00             	movzbl (%rax),%eax
  801fc7:	3c 2f                	cmp    $0x2f,%al
  801fc9:	7e 1d                	jle    801fe8 <strtol+0xf0>
  801fcb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801fcf:	0f b6 00             	movzbl (%rax),%eax
  801fd2:	3c 39                	cmp    $0x39,%al
  801fd4:	7f 12                	jg     801fe8 <strtol+0xf0>
  801fd6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801fda:	0f b6 00             	movzbl (%rax),%eax
  801fdd:	0f be c0             	movsbl %al,%eax
  801fe0:	83 e8 30             	sub    $0x30,%eax
  801fe3:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801fe6:	eb 4e                	jmp    802036 <strtol+0x13e>
  801fe8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801fec:	0f b6 00             	movzbl (%rax),%eax
  801fef:	3c 60                	cmp    $0x60,%al
  801ff1:	7e 1d                	jle    802010 <strtol+0x118>
  801ff3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ff7:	0f b6 00             	movzbl (%rax),%eax
  801ffa:	3c 7a                	cmp    $0x7a,%al
  801ffc:	7f 12                	jg     802010 <strtol+0x118>
  801ffe:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802002:	0f b6 00             	movzbl (%rax),%eax
  802005:	0f be c0             	movsbl %al,%eax
  802008:	83 e8 57             	sub    $0x57,%eax
  80200b:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80200e:	eb 26                	jmp    802036 <strtol+0x13e>
  802010:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802014:	0f b6 00             	movzbl (%rax),%eax
  802017:	3c 40                	cmp    $0x40,%al
  802019:	7e 48                	jle    802063 <strtol+0x16b>
  80201b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80201f:	0f b6 00             	movzbl (%rax),%eax
  802022:	3c 5a                	cmp    $0x5a,%al
  802024:	7f 3d                	jg     802063 <strtol+0x16b>
  802026:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80202a:	0f b6 00             	movzbl (%rax),%eax
  80202d:	0f be c0             	movsbl %al,%eax
  802030:	83 e8 37             	sub    $0x37,%eax
  802033:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802036:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802039:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  80203c:	7c 02                	jl     802040 <strtol+0x148>
  80203e:	eb 23                	jmp    802063 <strtol+0x16b>
  802040:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  802045:	8b 45 cc             	mov    -0x34(%rbp),%eax
  802048:	48 98                	cltq   
  80204a:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  80204f:	48 89 c2             	mov    %rax,%rdx
  802052:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802055:	48 98                	cltq   
  802057:	48 01 d0             	add    %rdx,%rax
  80205a:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80205e:	e9 5d ff ff ff       	jmpq   801fc0 <strtol+0xc8>
  802063:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  802068:	74 0b                	je     802075 <strtol+0x17d>
  80206a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80206e:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802072:	48 89 10             	mov    %rdx,(%rax)
  802075:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802079:	74 09                	je     802084 <strtol+0x18c>
  80207b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80207f:	48 f7 d8             	neg    %rax
  802082:	eb 04                	jmp    802088 <strtol+0x190>
  802084:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802088:	c9                   	leaveq 
  802089:	c3                   	retq   

000000000080208a <strstr>:
  80208a:	55                   	push   %rbp
  80208b:	48 89 e5             	mov    %rsp,%rbp
  80208e:	48 83 ec 30          	sub    $0x30,%rsp
  802092:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802096:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80209a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80209e:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8020a2:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  8020a6:	0f b6 00             	movzbl (%rax),%eax
  8020a9:	88 45 ff             	mov    %al,-0x1(%rbp)
  8020ac:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  8020b0:	75 06                	jne    8020b8 <strstr+0x2e>
  8020b2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8020b6:	eb 6b                	jmp    802123 <strstr+0x99>
  8020b8:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8020bc:	48 89 c7             	mov    %rax,%rdi
  8020bf:	48 b8 60 19 80 00 00 	movabs $0x801960,%rax
  8020c6:	00 00 00 
  8020c9:	ff d0                	callq  *%rax
  8020cb:	48 98                	cltq   
  8020cd:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8020d1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8020d5:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8020d9:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8020dd:	0f b6 00             	movzbl (%rax),%eax
  8020e0:	88 45 ef             	mov    %al,-0x11(%rbp)
  8020e3:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  8020e7:	75 07                	jne    8020f0 <strstr+0x66>
  8020e9:	b8 00 00 00 00       	mov    $0x0,%eax
  8020ee:	eb 33                	jmp    802123 <strstr+0x99>
  8020f0:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  8020f4:	3a 45 ff             	cmp    -0x1(%rbp),%al
  8020f7:	75 d8                	jne    8020d1 <strstr+0x47>
  8020f9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8020fd:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  802101:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802105:	48 89 ce             	mov    %rcx,%rsi
  802108:	48 89 c7             	mov    %rax,%rdi
  80210b:	48 b8 81 1b 80 00 00 	movabs $0x801b81,%rax
  802112:	00 00 00 
  802115:	ff d0                	callq  *%rax
  802117:	85 c0                	test   %eax,%eax
  802119:	75 b6                	jne    8020d1 <strstr+0x47>
  80211b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80211f:	48 83 e8 01          	sub    $0x1,%rax
  802123:	c9                   	leaveq 
  802124:	c3                   	retq   

0000000000802125 <syscall>:
  802125:	55                   	push   %rbp
  802126:	48 89 e5             	mov    %rsp,%rbp
  802129:	53                   	push   %rbx
  80212a:	48 83 ec 48          	sub    $0x48,%rsp
  80212e:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802131:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802134:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  802138:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  80213c:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  802140:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  802144:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802147:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  80214b:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  80214f:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  802153:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  802157:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  80215b:	4c 89 c3             	mov    %r8,%rbx
  80215e:	cd 30                	int    $0x30
  802160:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802164:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  802168:	74 3e                	je     8021a8 <syscall+0x83>
  80216a:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80216f:	7e 37                	jle    8021a8 <syscall+0x83>
  802171:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802175:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802178:	49 89 d0             	mov    %rdx,%r8
  80217b:	89 c1                	mov    %eax,%ecx
  80217d:	48 ba 68 5c 80 00 00 	movabs $0x805c68,%rdx
  802184:	00 00 00 
  802187:	be 24 00 00 00       	mov    $0x24,%esi
  80218c:	48 bf 85 5c 80 00 00 	movabs $0x805c85,%rdi
  802193:	00 00 00 
  802196:	b8 00 00 00 00       	mov    $0x0,%eax
  80219b:	49 b9 de 0b 80 00 00 	movabs $0x800bde,%r9
  8021a2:	00 00 00 
  8021a5:	41 ff d1             	callq  *%r9
  8021a8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8021ac:	48 83 c4 48          	add    $0x48,%rsp
  8021b0:	5b                   	pop    %rbx
  8021b1:	5d                   	pop    %rbp
  8021b2:	c3                   	retq   

00000000008021b3 <sys_cputs>:
  8021b3:	55                   	push   %rbp
  8021b4:	48 89 e5             	mov    %rsp,%rbp
  8021b7:	48 83 ec 20          	sub    $0x20,%rsp
  8021bb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8021bf:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8021c3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8021c7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8021cb:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8021d2:	00 
  8021d3:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8021d9:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8021df:	48 89 d1             	mov    %rdx,%rcx
  8021e2:	48 89 c2             	mov    %rax,%rdx
  8021e5:	be 00 00 00 00       	mov    $0x0,%esi
  8021ea:	bf 00 00 00 00       	mov    $0x0,%edi
  8021ef:	48 b8 25 21 80 00 00 	movabs $0x802125,%rax
  8021f6:	00 00 00 
  8021f9:	ff d0                	callq  *%rax
  8021fb:	c9                   	leaveq 
  8021fc:	c3                   	retq   

00000000008021fd <sys_cgetc>:
  8021fd:	55                   	push   %rbp
  8021fe:	48 89 e5             	mov    %rsp,%rbp
  802201:	48 83 ec 10          	sub    $0x10,%rsp
  802205:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80220c:	00 
  80220d:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802213:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802219:	b9 00 00 00 00       	mov    $0x0,%ecx
  80221e:	ba 00 00 00 00       	mov    $0x0,%edx
  802223:	be 00 00 00 00       	mov    $0x0,%esi
  802228:	bf 01 00 00 00       	mov    $0x1,%edi
  80222d:	48 b8 25 21 80 00 00 	movabs $0x802125,%rax
  802234:	00 00 00 
  802237:	ff d0                	callq  *%rax
  802239:	c9                   	leaveq 
  80223a:	c3                   	retq   

000000000080223b <sys_env_destroy>:
  80223b:	55                   	push   %rbp
  80223c:	48 89 e5             	mov    %rsp,%rbp
  80223f:	48 83 ec 10          	sub    $0x10,%rsp
  802243:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802246:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802249:	48 98                	cltq   
  80224b:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802252:	00 
  802253:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802259:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80225f:	b9 00 00 00 00       	mov    $0x0,%ecx
  802264:	48 89 c2             	mov    %rax,%rdx
  802267:	be 01 00 00 00       	mov    $0x1,%esi
  80226c:	bf 03 00 00 00       	mov    $0x3,%edi
  802271:	48 b8 25 21 80 00 00 	movabs $0x802125,%rax
  802278:	00 00 00 
  80227b:	ff d0                	callq  *%rax
  80227d:	c9                   	leaveq 
  80227e:	c3                   	retq   

000000000080227f <sys_getenvid>:
  80227f:	55                   	push   %rbp
  802280:	48 89 e5             	mov    %rsp,%rbp
  802283:	48 83 ec 10          	sub    $0x10,%rsp
  802287:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80228e:	00 
  80228f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802295:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80229b:	b9 00 00 00 00       	mov    $0x0,%ecx
  8022a0:	ba 00 00 00 00       	mov    $0x0,%edx
  8022a5:	be 00 00 00 00       	mov    $0x0,%esi
  8022aa:	bf 02 00 00 00       	mov    $0x2,%edi
  8022af:	48 b8 25 21 80 00 00 	movabs $0x802125,%rax
  8022b6:	00 00 00 
  8022b9:	ff d0                	callq  *%rax
  8022bb:	c9                   	leaveq 
  8022bc:	c3                   	retq   

00000000008022bd <sys_yield>:
  8022bd:	55                   	push   %rbp
  8022be:	48 89 e5             	mov    %rsp,%rbp
  8022c1:	48 83 ec 10          	sub    $0x10,%rsp
  8022c5:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8022cc:	00 
  8022cd:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8022d3:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8022d9:	b9 00 00 00 00       	mov    $0x0,%ecx
  8022de:	ba 00 00 00 00       	mov    $0x0,%edx
  8022e3:	be 00 00 00 00       	mov    $0x0,%esi
  8022e8:	bf 0b 00 00 00       	mov    $0xb,%edi
  8022ed:	48 b8 25 21 80 00 00 	movabs $0x802125,%rax
  8022f4:	00 00 00 
  8022f7:	ff d0                	callq  *%rax
  8022f9:	c9                   	leaveq 
  8022fa:	c3                   	retq   

00000000008022fb <sys_page_alloc>:
  8022fb:	55                   	push   %rbp
  8022fc:	48 89 e5             	mov    %rsp,%rbp
  8022ff:	48 83 ec 20          	sub    $0x20,%rsp
  802303:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802306:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80230a:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80230d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802310:	48 63 c8             	movslq %eax,%rcx
  802313:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802317:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80231a:	48 98                	cltq   
  80231c:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802323:	00 
  802324:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80232a:	49 89 c8             	mov    %rcx,%r8
  80232d:	48 89 d1             	mov    %rdx,%rcx
  802330:	48 89 c2             	mov    %rax,%rdx
  802333:	be 01 00 00 00       	mov    $0x1,%esi
  802338:	bf 04 00 00 00       	mov    $0x4,%edi
  80233d:	48 b8 25 21 80 00 00 	movabs $0x802125,%rax
  802344:	00 00 00 
  802347:	ff d0                	callq  *%rax
  802349:	c9                   	leaveq 
  80234a:	c3                   	retq   

000000000080234b <sys_page_map>:
  80234b:	55                   	push   %rbp
  80234c:	48 89 e5             	mov    %rsp,%rbp
  80234f:	48 83 ec 30          	sub    $0x30,%rsp
  802353:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802356:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80235a:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80235d:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  802361:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  802365:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  802368:	48 63 c8             	movslq %eax,%rcx
  80236b:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  80236f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802372:	48 63 f0             	movslq %eax,%rsi
  802375:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802379:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80237c:	48 98                	cltq   
  80237e:	48 89 0c 24          	mov    %rcx,(%rsp)
  802382:	49 89 f9             	mov    %rdi,%r9
  802385:	49 89 f0             	mov    %rsi,%r8
  802388:	48 89 d1             	mov    %rdx,%rcx
  80238b:	48 89 c2             	mov    %rax,%rdx
  80238e:	be 01 00 00 00       	mov    $0x1,%esi
  802393:	bf 05 00 00 00       	mov    $0x5,%edi
  802398:	48 b8 25 21 80 00 00 	movabs $0x802125,%rax
  80239f:	00 00 00 
  8023a2:	ff d0                	callq  *%rax
  8023a4:	c9                   	leaveq 
  8023a5:	c3                   	retq   

00000000008023a6 <sys_page_unmap>:
  8023a6:	55                   	push   %rbp
  8023a7:	48 89 e5             	mov    %rsp,%rbp
  8023aa:	48 83 ec 20          	sub    $0x20,%rsp
  8023ae:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8023b1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8023b5:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8023b9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023bc:	48 98                	cltq   
  8023be:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8023c5:	00 
  8023c6:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8023cc:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8023d2:	48 89 d1             	mov    %rdx,%rcx
  8023d5:	48 89 c2             	mov    %rax,%rdx
  8023d8:	be 01 00 00 00       	mov    $0x1,%esi
  8023dd:	bf 06 00 00 00       	mov    $0x6,%edi
  8023e2:	48 b8 25 21 80 00 00 	movabs $0x802125,%rax
  8023e9:	00 00 00 
  8023ec:	ff d0                	callq  *%rax
  8023ee:	c9                   	leaveq 
  8023ef:	c3                   	retq   

00000000008023f0 <sys_env_set_status>:
  8023f0:	55                   	push   %rbp
  8023f1:	48 89 e5             	mov    %rsp,%rbp
  8023f4:	48 83 ec 10          	sub    $0x10,%rsp
  8023f8:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8023fb:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8023fe:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802401:	48 63 d0             	movslq %eax,%rdx
  802404:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802407:	48 98                	cltq   
  802409:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802410:	00 
  802411:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802417:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80241d:	48 89 d1             	mov    %rdx,%rcx
  802420:	48 89 c2             	mov    %rax,%rdx
  802423:	be 01 00 00 00       	mov    $0x1,%esi
  802428:	bf 08 00 00 00       	mov    $0x8,%edi
  80242d:	48 b8 25 21 80 00 00 	movabs $0x802125,%rax
  802434:	00 00 00 
  802437:	ff d0                	callq  *%rax
  802439:	c9                   	leaveq 
  80243a:	c3                   	retq   

000000000080243b <sys_env_set_trapframe>:
  80243b:	55                   	push   %rbp
  80243c:	48 89 e5             	mov    %rsp,%rbp
  80243f:	48 83 ec 20          	sub    $0x20,%rsp
  802443:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802446:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80244a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80244e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802451:	48 98                	cltq   
  802453:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80245a:	00 
  80245b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802461:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802467:	48 89 d1             	mov    %rdx,%rcx
  80246a:	48 89 c2             	mov    %rax,%rdx
  80246d:	be 01 00 00 00       	mov    $0x1,%esi
  802472:	bf 09 00 00 00       	mov    $0x9,%edi
  802477:	48 b8 25 21 80 00 00 	movabs $0x802125,%rax
  80247e:	00 00 00 
  802481:	ff d0                	callq  *%rax
  802483:	c9                   	leaveq 
  802484:	c3                   	retq   

0000000000802485 <sys_env_set_pgfault_upcall>:
  802485:	55                   	push   %rbp
  802486:	48 89 e5             	mov    %rsp,%rbp
  802489:	48 83 ec 20          	sub    $0x20,%rsp
  80248d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802490:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802494:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802498:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80249b:	48 98                	cltq   
  80249d:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8024a4:	00 
  8024a5:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8024ab:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8024b1:	48 89 d1             	mov    %rdx,%rcx
  8024b4:	48 89 c2             	mov    %rax,%rdx
  8024b7:	be 01 00 00 00       	mov    $0x1,%esi
  8024bc:	bf 0a 00 00 00       	mov    $0xa,%edi
  8024c1:	48 b8 25 21 80 00 00 	movabs $0x802125,%rax
  8024c8:	00 00 00 
  8024cb:	ff d0                	callq  *%rax
  8024cd:	c9                   	leaveq 
  8024ce:	c3                   	retq   

00000000008024cf <sys_ipc_try_send>:
  8024cf:	55                   	push   %rbp
  8024d0:	48 89 e5             	mov    %rsp,%rbp
  8024d3:	48 83 ec 20          	sub    $0x20,%rsp
  8024d7:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8024da:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8024de:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8024e2:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  8024e5:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8024e8:	48 63 f0             	movslq %eax,%rsi
  8024eb:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8024ef:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024f2:	48 98                	cltq   
  8024f4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8024f8:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8024ff:	00 
  802500:	49 89 f1             	mov    %rsi,%r9
  802503:	49 89 c8             	mov    %rcx,%r8
  802506:	48 89 d1             	mov    %rdx,%rcx
  802509:	48 89 c2             	mov    %rax,%rdx
  80250c:	be 00 00 00 00       	mov    $0x0,%esi
  802511:	bf 0c 00 00 00       	mov    $0xc,%edi
  802516:	48 b8 25 21 80 00 00 	movabs $0x802125,%rax
  80251d:	00 00 00 
  802520:	ff d0                	callq  *%rax
  802522:	c9                   	leaveq 
  802523:	c3                   	retq   

0000000000802524 <sys_ipc_recv>:
  802524:	55                   	push   %rbp
  802525:	48 89 e5             	mov    %rsp,%rbp
  802528:	48 83 ec 10          	sub    $0x10,%rsp
  80252c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802530:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802534:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80253b:	00 
  80253c:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802542:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802548:	b9 00 00 00 00       	mov    $0x0,%ecx
  80254d:	48 89 c2             	mov    %rax,%rdx
  802550:	be 01 00 00 00       	mov    $0x1,%esi
  802555:	bf 0d 00 00 00       	mov    $0xd,%edi
  80255a:	48 b8 25 21 80 00 00 	movabs $0x802125,%rax
  802561:	00 00 00 
  802564:	ff d0                	callq  *%rax
  802566:	c9                   	leaveq 
  802567:	c3                   	retq   

0000000000802568 <sys_time_msec>:
  802568:	55                   	push   %rbp
  802569:	48 89 e5             	mov    %rsp,%rbp
  80256c:	48 83 ec 10          	sub    $0x10,%rsp
  802570:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802577:	00 
  802578:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80257e:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802584:	b9 00 00 00 00       	mov    $0x0,%ecx
  802589:	ba 00 00 00 00       	mov    $0x0,%edx
  80258e:	be 00 00 00 00       	mov    $0x0,%esi
  802593:	bf 0e 00 00 00       	mov    $0xe,%edi
  802598:	48 b8 25 21 80 00 00 	movabs $0x802125,%rax
  80259f:	00 00 00 
  8025a2:	ff d0                	callq  *%rax
  8025a4:	c9                   	leaveq 
  8025a5:	c3                   	retq   

00000000008025a6 <sys_net_transmit>:
  8025a6:	55                   	push   %rbp
  8025a7:	48 89 e5             	mov    %rsp,%rbp
  8025aa:	48 83 ec 20          	sub    $0x20,%rsp
  8025ae:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8025b2:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8025b5:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8025b8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8025bc:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8025c3:	00 
  8025c4:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8025ca:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8025d0:	48 89 d1             	mov    %rdx,%rcx
  8025d3:	48 89 c2             	mov    %rax,%rdx
  8025d6:	be 00 00 00 00       	mov    $0x0,%esi
  8025db:	bf 0f 00 00 00       	mov    $0xf,%edi
  8025e0:	48 b8 25 21 80 00 00 	movabs $0x802125,%rax
  8025e7:	00 00 00 
  8025ea:	ff d0                	callq  *%rax
  8025ec:	c9                   	leaveq 
  8025ed:	c3                   	retq   

00000000008025ee <sys_net_receive>:
  8025ee:	55                   	push   %rbp
  8025ef:	48 89 e5             	mov    %rsp,%rbp
  8025f2:	48 83 ec 20          	sub    $0x20,%rsp
  8025f6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8025fa:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8025fd:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802600:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802604:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80260b:	00 
  80260c:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802612:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802618:	48 89 d1             	mov    %rdx,%rcx
  80261b:	48 89 c2             	mov    %rax,%rdx
  80261e:	be 00 00 00 00       	mov    $0x0,%esi
  802623:	bf 10 00 00 00       	mov    $0x10,%edi
  802628:	48 b8 25 21 80 00 00 	movabs $0x802125,%rax
  80262f:	00 00 00 
  802632:	ff d0                	callq  *%rax
  802634:	c9                   	leaveq 
  802635:	c3                   	retq   

0000000000802636 <sys_ept_map>:
  802636:	55                   	push   %rbp
  802637:	48 89 e5             	mov    %rsp,%rbp
  80263a:	48 83 ec 30          	sub    $0x30,%rsp
  80263e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802641:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802645:	89 55 f8             	mov    %edx,-0x8(%rbp)
  802648:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  80264c:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  802650:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  802653:	48 63 c8             	movslq %eax,%rcx
  802656:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  80265a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80265d:	48 63 f0             	movslq %eax,%rsi
  802660:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802664:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802667:	48 98                	cltq   
  802669:	48 89 0c 24          	mov    %rcx,(%rsp)
  80266d:	49 89 f9             	mov    %rdi,%r9
  802670:	49 89 f0             	mov    %rsi,%r8
  802673:	48 89 d1             	mov    %rdx,%rcx
  802676:	48 89 c2             	mov    %rax,%rdx
  802679:	be 00 00 00 00       	mov    $0x0,%esi
  80267e:	bf 11 00 00 00       	mov    $0x11,%edi
  802683:	48 b8 25 21 80 00 00 	movabs $0x802125,%rax
  80268a:	00 00 00 
  80268d:	ff d0                	callq  *%rax
  80268f:	c9                   	leaveq 
  802690:	c3                   	retq   

0000000000802691 <sys_env_mkguest>:
  802691:	55                   	push   %rbp
  802692:	48 89 e5             	mov    %rsp,%rbp
  802695:	48 83 ec 20          	sub    $0x20,%rsp
  802699:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80269d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8026a1:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8026a5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8026a9:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8026b0:	00 
  8026b1:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8026b7:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8026bd:	48 89 d1             	mov    %rdx,%rcx
  8026c0:	48 89 c2             	mov    %rax,%rdx
  8026c3:	be 00 00 00 00       	mov    $0x0,%esi
  8026c8:	bf 12 00 00 00       	mov    $0x12,%edi
  8026cd:	48 b8 25 21 80 00 00 	movabs $0x802125,%rax
  8026d4:	00 00 00 
  8026d7:	ff d0                	callq  *%rax
  8026d9:	c9                   	leaveq 
  8026da:	c3                   	retq   

00000000008026db <sys_vmx_list_vms>:
  8026db:	55                   	push   %rbp
  8026dc:	48 89 e5             	mov    %rsp,%rbp
  8026df:	48 83 ec 10          	sub    $0x10,%rsp
  8026e3:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8026ea:	00 
  8026eb:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8026f1:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8026f7:	b9 00 00 00 00       	mov    $0x0,%ecx
  8026fc:	ba 00 00 00 00       	mov    $0x0,%edx
  802701:	be 00 00 00 00       	mov    $0x0,%esi
  802706:	bf 13 00 00 00       	mov    $0x13,%edi
  80270b:	48 b8 25 21 80 00 00 	movabs $0x802125,%rax
  802712:	00 00 00 
  802715:	ff d0                	callq  *%rax
  802717:	c9                   	leaveq 
  802718:	c3                   	retq   

0000000000802719 <sys_vmx_sel_resume>:
  802719:	55                   	push   %rbp
  80271a:	48 89 e5             	mov    %rsp,%rbp
  80271d:	48 83 ec 10          	sub    $0x10,%rsp
  802721:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802724:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802727:	48 98                	cltq   
  802729:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802730:	00 
  802731:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802737:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80273d:	b9 00 00 00 00       	mov    $0x0,%ecx
  802742:	48 89 c2             	mov    %rax,%rdx
  802745:	be 00 00 00 00       	mov    $0x0,%esi
  80274a:	bf 14 00 00 00       	mov    $0x14,%edi
  80274f:	48 b8 25 21 80 00 00 	movabs $0x802125,%rax
  802756:	00 00 00 
  802759:	ff d0                	callq  *%rax
  80275b:	c9                   	leaveq 
  80275c:	c3                   	retq   

000000000080275d <sys_vmx_get_vmdisk_number>:
  80275d:	55                   	push   %rbp
  80275e:	48 89 e5             	mov    %rsp,%rbp
  802761:	48 83 ec 10          	sub    $0x10,%rsp
  802765:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80276c:	00 
  80276d:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802773:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802779:	b9 00 00 00 00       	mov    $0x0,%ecx
  80277e:	ba 00 00 00 00       	mov    $0x0,%edx
  802783:	be 00 00 00 00       	mov    $0x0,%esi
  802788:	bf 15 00 00 00       	mov    $0x15,%edi
  80278d:	48 b8 25 21 80 00 00 	movabs $0x802125,%rax
  802794:	00 00 00 
  802797:	ff d0                	callq  *%rax
  802799:	c9                   	leaveq 
  80279a:	c3                   	retq   

000000000080279b <sys_vmx_incr_vmdisk_number>:
  80279b:	55                   	push   %rbp
  80279c:	48 89 e5             	mov    %rsp,%rbp
  80279f:	48 83 ec 10          	sub    $0x10,%rsp
  8027a3:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8027aa:	00 
  8027ab:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8027b1:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8027b7:	b9 00 00 00 00       	mov    $0x0,%ecx
  8027bc:	ba 00 00 00 00       	mov    $0x0,%edx
  8027c1:	be 00 00 00 00       	mov    $0x0,%esi
  8027c6:	bf 16 00 00 00       	mov    $0x16,%edi
  8027cb:	48 b8 25 21 80 00 00 	movabs $0x802125,%rax
  8027d2:	00 00 00 
  8027d5:	ff d0                	callq  *%rax
  8027d7:	c9                   	leaveq 
  8027d8:	c3                   	retq   

00000000008027d9 <fd2num>:
  8027d9:	55                   	push   %rbp
  8027da:	48 89 e5             	mov    %rsp,%rbp
  8027dd:	48 83 ec 08          	sub    $0x8,%rsp
  8027e1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8027e5:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8027e9:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  8027f0:	ff ff ff 
  8027f3:	48 01 d0             	add    %rdx,%rax
  8027f6:	48 c1 e8 0c          	shr    $0xc,%rax
  8027fa:	c9                   	leaveq 
  8027fb:	c3                   	retq   

00000000008027fc <fd2data>:
  8027fc:	55                   	push   %rbp
  8027fd:	48 89 e5             	mov    %rsp,%rbp
  802800:	48 83 ec 08          	sub    $0x8,%rsp
  802804:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802808:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80280c:	48 89 c7             	mov    %rax,%rdi
  80280f:	48 b8 d9 27 80 00 00 	movabs $0x8027d9,%rax
  802816:	00 00 00 
  802819:	ff d0                	callq  *%rax
  80281b:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  802821:	48 c1 e0 0c          	shl    $0xc,%rax
  802825:	c9                   	leaveq 
  802826:	c3                   	retq   

0000000000802827 <fd_alloc>:
  802827:	55                   	push   %rbp
  802828:	48 89 e5             	mov    %rsp,%rbp
  80282b:	48 83 ec 18          	sub    $0x18,%rsp
  80282f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802833:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80283a:	eb 6b                	jmp    8028a7 <fd_alloc+0x80>
  80283c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80283f:	48 98                	cltq   
  802841:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802847:	48 c1 e0 0c          	shl    $0xc,%rax
  80284b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80284f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802853:	48 c1 e8 15          	shr    $0x15,%rax
  802857:	48 89 c2             	mov    %rax,%rdx
  80285a:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802861:	01 00 00 
  802864:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802868:	83 e0 01             	and    $0x1,%eax
  80286b:	48 85 c0             	test   %rax,%rax
  80286e:	74 21                	je     802891 <fd_alloc+0x6a>
  802870:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802874:	48 c1 e8 0c          	shr    $0xc,%rax
  802878:	48 89 c2             	mov    %rax,%rdx
  80287b:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802882:	01 00 00 
  802885:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802889:	83 e0 01             	and    $0x1,%eax
  80288c:	48 85 c0             	test   %rax,%rax
  80288f:	75 12                	jne    8028a3 <fd_alloc+0x7c>
  802891:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802895:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802899:	48 89 10             	mov    %rdx,(%rax)
  80289c:	b8 00 00 00 00       	mov    $0x0,%eax
  8028a1:	eb 1a                	jmp    8028bd <fd_alloc+0x96>
  8028a3:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8028a7:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  8028ab:	7e 8f                	jle    80283c <fd_alloc+0x15>
  8028ad:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8028b1:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  8028b8:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  8028bd:	c9                   	leaveq 
  8028be:	c3                   	retq   

00000000008028bf <fd_lookup>:
  8028bf:	55                   	push   %rbp
  8028c0:	48 89 e5             	mov    %rsp,%rbp
  8028c3:	48 83 ec 20          	sub    $0x20,%rsp
  8028c7:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8028ca:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8028ce:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8028d2:	78 06                	js     8028da <fd_lookup+0x1b>
  8028d4:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  8028d8:	7e 07                	jle    8028e1 <fd_lookup+0x22>
  8028da:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8028df:	eb 6c                	jmp    80294d <fd_lookup+0x8e>
  8028e1:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8028e4:	48 98                	cltq   
  8028e6:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  8028ec:	48 c1 e0 0c          	shl    $0xc,%rax
  8028f0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8028f4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8028f8:	48 c1 e8 15          	shr    $0x15,%rax
  8028fc:	48 89 c2             	mov    %rax,%rdx
  8028ff:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802906:	01 00 00 
  802909:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80290d:	83 e0 01             	and    $0x1,%eax
  802910:	48 85 c0             	test   %rax,%rax
  802913:	74 21                	je     802936 <fd_lookup+0x77>
  802915:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802919:	48 c1 e8 0c          	shr    $0xc,%rax
  80291d:	48 89 c2             	mov    %rax,%rdx
  802920:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802927:	01 00 00 
  80292a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80292e:	83 e0 01             	and    $0x1,%eax
  802931:	48 85 c0             	test   %rax,%rax
  802934:	75 07                	jne    80293d <fd_lookup+0x7e>
  802936:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80293b:	eb 10                	jmp    80294d <fd_lookup+0x8e>
  80293d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802941:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802945:	48 89 10             	mov    %rdx,(%rax)
  802948:	b8 00 00 00 00       	mov    $0x0,%eax
  80294d:	c9                   	leaveq 
  80294e:	c3                   	retq   

000000000080294f <fd_close>:
  80294f:	55                   	push   %rbp
  802950:	48 89 e5             	mov    %rsp,%rbp
  802953:	48 83 ec 30          	sub    $0x30,%rsp
  802957:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80295b:	89 f0                	mov    %esi,%eax
  80295d:	88 45 d4             	mov    %al,-0x2c(%rbp)
  802960:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802964:	48 89 c7             	mov    %rax,%rdi
  802967:	48 b8 d9 27 80 00 00 	movabs $0x8027d9,%rax
  80296e:	00 00 00 
  802971:	ff d0                	callq  *%rax
  802973:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802977:	48 89 d6             	mov    %rdx,%rsi
  80297a:	89 c7                	mov    %eax,%edi
  80297c:	48 b8 bf 28 80 00 00 	movabs $0x8028bf,%rax
  802983:	00 00 00 
  802986:	ff d0                	callq  *%rax
  802988:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80298b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80298f:	78 0a                	js     80299b <fd_close+0x4c>
  802991:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802995:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  802999:	74 12                	je     8029ad <fd_close+0x5e>
  80299b:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  80299f:	74 05                	je     8029a6 <fd_close+0x57>
  8029a1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029a4:	eb 05                	jmp    8029ab <fd_close+0x5c>
  8029a6:	b8 00 00 00 00       	mov    $0x0,%eax
  8029ab:	eb 69                	jmp    802a16 <fd_close+0xc7>
  8029ad:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8029b1:	8b 00                	mov    (%rax),%eax
  8029b3:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8029b7:	48 89 d6             	mov    %rdx,%rsi
  8029ba:	89 c7                	mov    %eax,%edi
  8029bc:	48 b8 18 2a 80 00 00 	movabs $0x802a18,%rax
  8029c3:	00 00 00 
  8029c6:	ff d0                	callq  *%rax
  8029c8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8029cb:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8029cf:	78 2a                	js     8029fb <fd_close+0xac>
  8029d1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8029d5:	48 8b 40 20          	mov    0x20(%rax),%rax
  8029d9:	48 85 c0             	test   %rax,%rax
  8029dc:	74 16                	je     8029f4 <fd_close+0xa5>
  8029de:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8029e2:	48 8b 40 20          	mov    0x20(%rax),%rax
  8029e6:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8029ea:	48 89 d7             	mov    %rdx,%rdi
  8029ed:	ff d0                	callq  *%rax
  8029ef:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8029f2:	eb 07                	jmp    8029fb <fd_close+0xac>
  8029f4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8029fb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8029ff:	48 89 c6             	mov    %rax,%rsi
  802a02:	bf 00 00 00 00       	mov    $0x0,%edi
  802a07:	48 b8 a6 23 80 00 00 	movabs $0x8023a6,%rax
  802a0e:	00 00 00 
  802a11:	ff d0                	callq  *%rax
  802a13:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a16:	c9                   	leaveq 
  802a17:	c3                   	retq   

0000000000802a18 <dev_lookup>:
  802a18:	55                   	push   %rbp
  802a19:	48 89 e5             	mov    %rsp,%rbp
  802a1c:	48 83 ec 20          	sub    $0x20,%rsp
  802a20:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802a23:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802a27:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802a2e:	eb 41                	jmp    802a71 <dev_lookup+0x59>
  802a30:	48 b8 60 80 80 00 00 	movabs $0x808060,%rax
  802a37:	00 00 00 
  802a3a:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802a3d:	48 63 d2             	movslq %edx,%rdx
  802a40:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802a44:	8b 00                	mov    (%rax),%eax
  802a46:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  802a49:	75 22                	jne    802a6d <dev_lookup+0x55>
  802a4b:	48 b8 60 80 80 00 00 	movabs $0x808060,%rax
  802a52:	00 00 00 
  802a55:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802a58:	48 63 d2             	movslq %edx,%rdx
  802a5b:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  802a5f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802a63:	48 89 10             	mov    %rdx,(%rax)
  802a66:	b8 00 00 00 00       	mov    $0x0,%eax
  802a6b:	eb 60                	jmp    802acd <dev_lookup+0xb5>
  802a6d:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802a71:	48 b8 60 80 80 00 00 	movabs $0x808060,%rax
  802a78:	00 00 00 
  802a7b:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802a7e:	48 63 d2             	movslq %edx,%rdx
  802a81:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802a85:	48 85 c0             	test   %rax,%rax
  802a88:	75 a6                	jne    802a30 <dev_lookup+0x18>
  802a8a:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  802a91:	00 00 00 
  802a94:	48 8b 00             	mov    (%rax),%rax
  802a97:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802a9d:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802aa0:	89 c6                	mov    %eax,%esi
  802aa2:	48 bf 98 5c 80 00 00 	movabs $0x805c98,%rdi
  802aa9:	00 00 00 
  802aac:	b8 00 00 00 00       	mov    $0x0,%eax
  802ab1:	48 b9 17 0e 80 00 00 	movabs $0x800e17,%rcx
  802ab8:	00 00 00 
  802abb:	ff d1                	callq  *%rcx
  802abd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802ac1:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802ac8:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802acd:	c9                   	leaveq 
  802ace:	c3                   	retq   

0000000000802acf <close>:
  802acf:	55                   	push   %rbp
  802ad0:	48 89 e5             	mov    %rsp,%rbp
  802ad3:	48 83 ec 20          	sub    $0x20,%rsp
  802ad7:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802ada:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802ade:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802ae1:	48 89 d6             	mov    %rdx,%rsi
  802ae4:	89 c7                	mov    %eax,%edi
  802ae6:	48 b8 bf 28 80 00 00 	movabs $0x8028bf,%rax
  802aed:	00 00 00 
  802af0:	ff d0                	callq  *%rax
  802af2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802af5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802af9:	79 05                	jns    802b00 <close+0x31>
  802afb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802afe:	eb 18                	jmp    802b18 <close+0x49>
  802b00:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802b04:	be 01 00 00 00       	mov    $0x1,%esi
  802b09:	48 89 c7             	mov    %rax,%rdi
  802b0c:	48 b8 4f 29 80 00 00 	movabs $0x80294f,%rax
  802b13:	00 00 00 
  802b16:	ff d0                	callq  *%rax
  802b18:	c9                   	leaveq 
  802b19:	c3                   	retq   

0000000000802b1a <close_all>:
  802b1a:	55                   	push   %rbp
  802b1b:	48 89 e5             	mov    %rsp,%rbp
  802b1e:	48 83 ec 10          	sub    $0x10,%rsp
  802b22:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802b29:	eb 15                	jmp    802b40 <close_all+0x26>
  802b2b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b2e:	89 c7                	mov    %eax,%edi
  802b30:	48 b8 cf 2a 80 00 00 	movabs $0x802acf,%rax
  802b37:	00 00 00 
  802b3a:	ff d0                	callq  *%rax
  802b3c:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802b40:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802b44:	7e e5                	jle    802b2b <close_all+0x11>
  802b46:	c9                   	leaveq 
  802b47:	c3                   	retq   

0000000000802b48 <dup>:
  802b48:	55                   	push   %rbp
  802b49:	48 89 e5             	mov    %rsp,%rbp
  802b4c:	48 83 ec 40          	sub    $0x40,%rsp
  802b50:	89 7d cc             	mov    %edi,-0x34(%rbp)
  802b53:	89 75 c8             	mov    %esi,-0x38(%rbp)
  802b56:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  802b5a:	8b 45 cc             	mov    -0x34(%rbp),%eax
  802b5d:	48 89 d6             	mov    %rdx,%rsi
  802b60:	89 c7                	mov    %eax,%edi
  802b62:	48 b8 bf 28 80 00 00 	movabs $0x8028bf,%rax
  802b69:	00 00 00 
  802b6c:	ff d0                	callq  *%rax
  802b6e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b71:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b75:	79 08                	jns    802b7f <dup+0x37>
  802b77:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b7a:	e9 70 01 00 00       	jmpq   802cef <dup+0x1a7>
  802b7f:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802b82:	89 c7                	mov    %eax,%edi
  802b84:	48 b8 cf 2a 80 00 00 	movabs $0x802acf,%rax
  802b8b:	00 00 00 
  802b8e:	ff d0                	callq  *%rax
  802b90:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802b93:	48 98                	cltq   
  802b95:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802b9b:	48 c1 e0 0c          	shl    $0xc,%rax
  802b9f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802ba3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802ba7:	48 89 c7             	mov    %rax,%rdi
  802baa:	48 b8 fc 27 80 00 00 	movabs $0x8027fc,%rax
  802bb1:	00 00 00 
  802bb4:	ff d0                	callq  *%rax
  802bb6:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802bba:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802bbe:	48 89 c7             	mov    %rax,%rdi
  802bc1:	48 b8 fc 27 80 00 00 	movabs $0x8027fc,%rax
  802bc8:	00 00 00 
  802bcb:	ff d0                	callq  *%rax
  802bcd:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802bd1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802bd5:	48 c1 e8 15          	shr    $0x15,%rax
  802bd9:	48 89 c2             	mov    %rax,%rdx
  802bdc:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802be3:	01 00 00 
  802be6:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802bea:	83 e0 01             	and    $0x1,%eax
  802bed:	48 85 c0             	test   %rax,%rax
  802bf0:	74 73                	je     802c65 <dup+0x11d>
  802bf2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802bf6:	48 c1 e8 0c          	shr    $0xc,%rax
  802bfa:	48 89 c2             	mov    %rax,%rdx
  802bfd:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802c04:	01 00 00 
  802c07:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802c0b:	83 e0 01             	and    $0x1,%eax
  802c0e:	48 85 c0             	test   %rax,%rax
  802c11:	74 52                	je     802c65 <dup+0x11d>
  802c13:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c17:	48 c1 e8 0c          	shr    $0xc,%rax
  802c1b:	48 89 c2             	mov    %rax,%rdx
  802c1e:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802c25:	01 00 00 
  802c28:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802c2c:	25 07 0e 00 00       	and    $0xe07,%eax
  802c31:	89 c1                	mov    %eax,%ecx
  802c33:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802c37:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c3b:	41 89 c8             	mov    %ecx,%r8d
  802c3e:	48 89 d1             	mov    %rdx,%rcx
  802c41:	ba 00 00 00 00       	mov    $0x0,%edx
  802c46:	48 89 c6             	mov    %rax,%rsi
  802c49:	bf 00 00 00 00       	mov    $0x0,%edi
  802c4e:	48 b8 4b 23 80 00 00 	movabs $0x80234b,%rax
  802c55:	00 00 00 
  802c58:	ff d0                	callq  *%rax
  802c5a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c5d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c61:	79 02                	jns    802c65 <dup+0x11d>
  802c63:	eb 57                	jmp    802cbc <dup+0x174>
  802c65:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802c69:	48 c1 e8 0c          	shr    $0xc,%rax
  802c6d:	48 89 c2             	mov    %rax,%rdx
  802c70:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802c77:	01 00 00 
  802c7a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802c7e:	25 07 0e 00 00       	and    $0xe07,%eax
  802c83:	89 c1                	mov    %eax,%ecx
  802c85:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802c89:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802c8d:	41 89 c8             	mov    %ecx,%r8d
  802c90:	48 89 d1             	mov    %rdx,%rcx
  802c93:	ba 00 00 00 00       	mov    $0x0,%edx
  802c98:	48 89 c6             	mov    %rax,%rsi
  802c9b:	bf 00 00 00 00       	mov    $0x0,%edi
  802ca0:	48 b8 4b 23 80 00 00 	movabs $0x80234b,%rax
  802ca7:	00 00 00 
  802caa:	ff d0                	callq  *%rax
  802cac:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802caf:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802cb3:	79 02                	jns    802cb7 <dup+0x16f>
  802cb5:	eb 05                	jmp    802cbc <dup+0x174>
  802cb7:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802cba:	eb 33                	jmp    802cef <dup+0x1a7>
  802cbc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802cc0:	48 89 c6             	mov    %rax,%rsi
  802cc3:	bf 00 00 00 00       	mov    $0x0,%edi
  802cc8:	48 b8 a6 23 80 00 00 	movabs $0x8023a6,%rax
  802ccf:	00 00 00 
  802cd2:	ff d0                	callq  *%rax
  802cd4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802cd8:	48 89 c6             	mov    %rax,%rsi
  802cdb:	bf 00 00 00 00       	mov    $0x0,%edi
  802ce0:	48 b8 a6 23 80 00 00 	movabs $0x8023a6,%rax
  802ce7:	00 00 00 
  802cea:	ff d0                	callq  *%rax
  802cec:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802cef:	c9                   	leaveq 
  802cf0:	c3                   	retq   

0000000000802cf1 <read>:
  802cf1:	55                   	push   %rbp
  802cf2:	48 89 e5             	mov    %rsp,%rbp
  802cf5:	48 83 ec 40          	sub    $0x40,%rsp
  802cf9:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802cfc:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802d00:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802d04:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802d08:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802d0b:	48 89 d6             	mov    %rdx,%rsi
  802d0e:	89 c7                	mov    %eax,%edi
  802d10:	48 b8 bf 28 80 00 00 	movabs $0x8028bf,%rax
  802d17:	00 00 00 
  802d1a:	ff d0                	callq  *%rax
  802d1c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d1f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d23:	78 24                	js     802d49 <read+0x58>
  802d25:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d29:	8b 00                	mov    (%rax),%eax
  802d2b:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802d2f:	48 89 d6             	mov    %rdx,%rsi
  802d32:	89 c7                	mov    %eax,%edi
  802d34:	48 b8 18 2a 80 00 00 	movabs $0x802a18,%rax
  802d3b:	00 00 00 
  802d3e:	ff d0                	callq  *%rax
  802d40:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d43:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d47:	79 05                	jns    802d4e <read+0x5d>
  802d49:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d4c:	eb 76                	jmp    802dc4 <read+0xd3>
  802d4e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d52:	8b 40 08             	mov    0x8(%rax),%eax
  802d55:	83 e0 03             	and    $0x3,%eax
  802d58:	83 f8 01             	cmp    $0x1,%eax
  802d5b:	75 3a                	jne    802d97 <read+0xa6>
  802d5d:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  802d64:	00 00 00 
  802d67:	48 8b 00             	mov    (%rax),%rax
  802d6a:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802d70:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802d73:	89 c6                	mov    %eax,%esi
  802d75:	48 bf b7 5c 80 00 00 	movabs $0x805cb7,%rdi
  802d7c:	00 00 00 
  802d7f:	b8 00 00 00 00       	mov    $0x0,%eax
  802d84:	48 b9 17 0e 80 00 00 	movabs $0x800e17,%rcx
  802d8b:	00 00 00 
  802d8e:	ff d1                	callq  *%rcx
  802d90:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802d95:	eb 2d                	jmp    802dc4 <read+0xd3>
  802d97:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d9b:	48 8b 40 10          	mov    0x10(%rax),%rax
  802d9f:	48 85 c0             	test   %rax,%rax
  802da2:	75 07                	jne    802dab <read+0xba>
  802da4:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802da9:	eb 19                	jmp    802dc4 <read+0xd3>
  802dab:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802daf:	48 8b 40 10          	mov    0x10(%rax),%rax
  802db3:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802db7:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802dbb:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802dbf:	48 89 cf             	mov    %rcx,%rdi
  802dc2:	ff d0                	callq  *%rax
  802dc4:	c9                   	leaveq 
  802dc5:	c3                   	retq   

0000000000802dc6 <readn>:
  802dc6:	55                   	push   %rbp
  802dc7:	48 89 e5             	mov    %rsp,%rbp
  802dca:	48 83 ec 30          	sub    $0x30,%rsp
  802dce:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802dd1:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802dd5:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802dd9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802de0:	eb 49                	jmp    802e2b <readn+0x65>
  802de2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802de5:	48 98                	cltq   
  802de7:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802deb:	48 29 c2             	sub    %rax,%rdx
  802dee:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802df1:	48 63 c8             	movslq %eax,%rcx
  802df4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802df8:	48 01 c1             	add    %rax,%rcx
  802dfb:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802dfe:	48 89 ce             	mov    %rcx,%rsi
  802e01:	89 c7                	mov    %eax,%edi
  802e03:	48 b8 f1 2c 80 00 00 	movabs $0x802cf1,%rax
  802e0a:	00 00 00 
  802e0d:	ff d0                	callq  *%rax
  802e0f:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802e12:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802e16:	79 05                	jns    802e1d <readn+0x57>
  802e18:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802e1b:	eb 1c                	jmp    802e39 <readn+0x73>
  802e1d:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802e21:	75 02                	jne    802e25 <readn+0x5f>
  802e23:	eb 11                	jmp    802e36 <readn+0x70>
  802e25:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802e28:	01 45 fc             	add    %eax,-0x4(%rbp)
  802e2b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e2e:	48 98                	cltq   
  802e30:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802e34:	72 ac                	jb     802de2 <readn+0x1c>
  802e36:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e39:	c9                   	leaveq 
  802e3a:	c3                   	retq   

0000000000802e3b <write>:
  802e3b:	55                   	push   %rbp
  802e3c:	48 89 e5             	mov    %rsp,%rbp
  802e3f:	48 83 ec 40          	sub    $0x40,%rsp
  802e43:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802e46:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802e4a:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802e4e:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802e52:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802e55:	48 89 d6             	mov    %rdx,%rsi
  802e58:	89 c7                	mov    %eax,%edi
  802e5a:	48 b8 bf 28 80 00 00 	movabs $0x8028bf,%rax
  802e61:	00 00 00 
  802e64:	ff d0                	callq  *%rax
  802e66:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e69:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e6d:	78 24                	js     802e93 <write+0x58>
  802e6f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e73:	8b 00                	mov    (%rax),%eax
  802e75:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802e79:	48 89 d6             	mov    %rdx,%rsi
  802e7c:	89 c7                	mov    %eax,%edi
  802e7e:	48 b8 18 2a 80 00 00 	movabs $0x802a18,%rax
  802e85:	00 00 00 
  802e88:	ff d0                	callq  *%rax
  802e8a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e8d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e91:	79 05                	jns    802e98 <write+0x5d>
  802e93:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e96:	eb 75                	jmp    802f0d <write+0xd2>
  802e98:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e9c:	8b 40 08             	mov    0x8(%rax),%eax
  802e9f:	83 e0 03             	and    $0x3,%eax
  802ea2:	85 c0                	test   %eax,%eax
  802ea4:	75 3a                	jne    802ee0 <write+0xa5>
  802ea6:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  802ead:	00 00 00 
  802eb0:	48 8b 00             	mov    (%rax),%rax
  802eb3:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802eb9:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802ebc:	89 c6                	mov    %eax,%esi
  802ebe:	48 bf d3 5c 80 00 00 	movabs $0x805cd3,%rdi
  802ec5:	00 00 00 
  802ec8:	b8 00 00 00 00       	mov    $0x0,%eax
  802ecd:	48 b9 17 0e 80 00 00 	movabs $0x800e17,%rcx
  802ed4:	00 00 00 
  802ed7:	ff d1                	callq  *%rcx
  802ed9:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802ede:	eb 2d                	jmp    802f0d <write+0xd2>
  802ee0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ee4:	48 8b 40 18          	mov    0x18(%rax),%rax
  802ee8:	48 85 c0             	test   %rax,%rax
  802eeb:	75 07                	jne    802ef4 <write+0xb9>
  802eed:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802ef2:	eb 19                	jmp    802f0d <write+0xd2>
  802ef4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ef8:	48 8b 40 18          	mov    0x18(%rax),%rax
  802efc:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802f00:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802f04:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802f08:	48 89 cf             	mov    %rcx,%rdi
  802f0b:	ff d0                	callq  *%rax
  802f0d:	c9                   	leaveq 
  802f0e:	c3                   	retq   

0000000000802f0f <seek>:
  802f0f:	55                   	push   %rbp
  802f10:	48 89 e5             	mov    %rsp,%rbp
  802f13:	48 83 ec 18          	sub    $0x18,%rsp
  802f17:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802f1a:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802f1d:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802f21:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802f24:	48 89 d6             	mov    %rdx,%rsi
  802f27:	89 c7                	mov    %eax,%edi
  802f29:	48 b8 bf 28 80 00 00 	movabs $0x8028bf,%rax
  802f30:	00 00 00 
  802f33:	ff d0                	callq  *%rax
  802f35:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f38:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f3c:	79 05                	jns    802f43 <seek+0x34>
  802f3e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f41:	eb 0f                	jmp    802f52 <seek+0x43>
  802f43:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f47:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802f4a:	89 50 04             	mov    %edx,0x4(%rax)
  802f4d:	b8 00 00 00 00       	mov    $0x0,%eax
  802f52:	c9                   	leaveq 
  802f53:	c3                   	retq   

0000000000802f54 <ftruncate>:
  802f54:	55                   	push   %rbp
  802f55:	48 89 e5             	mov    %rsp,%rbp
  802f58:	48 83 ec 30          	sub    $0x30,%rsp
  802f5c:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802f5f:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802f62:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802f66:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802f69:	48 89 d6             	mov    %rdx,%rsi
  802f6c:	89 c7                	mov    %eax,%edi
  802f6e:	48 b8 bf 28 80 00 00 	movabs $0x8028bf,%rax
  802f75:	00 00 00 
  802f78:	ff d0                	callq  *%rax
  802f7a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f7d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f81:	78 24                	js     802fa7 <ftruncate+0x53>
  802f83:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f87:	8b 00                	mov    (%rax),%eax
  802f89:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802f8d:	48 89 d6             	mov    %rdx,%rsi
  802f90:	89 c7                	mov    %eax,%edi
  802f92:	48 b8 18 2a 80 00 00 	movabs $0x802a18,%rax
  802f99:	00 00 00 
  802f9c:	ff d0                	callq  *%rax
  802f9e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802fa1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802fa5:	79 05                	jns    802fac <ftruncate+0x58>
  802fa7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802faa:	eb 72                	jmp    80301e <ftruncate+0xca>
  802fac:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802fb0:	8b 40 08             	mov    0x8(%rax),%eax
  802fb3:	83 e0 03             	and    $0x3,%eax
  802fb6:	85 c0                	test   %eax,%eax
  802fb8:	75 3a                	jne    802ff4 <ftruncate+0xa0>
  802fba:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  802fc1:	00 00 00 
  802fc4:	48 8b 00             	mov    (%rax),%rax
  802fc7:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802fcd:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802fd0:	89 c6                	mov    %eax,%esi
  802fd2:	48 bf f0 5c 80 00 00 	movabs $0x805cf0,%rdi
  802fd9:	00 00 00 
  802fdc:	b8 00 00 00 00       	mov    $0x0,%eax
  802fe1:	48 b9 17 0e 80 00 00 	movabs $0x800e17,%rcx
  802fe8:	00 00 00 
  802feb:	ff d1                	callq  *%rcx
  802fed:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802ff2:	eb 2a                	jmp    80301e <ftruncate+0xca>
  802ff4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ff8:	48 8b 40 30          	mov    0x30(%rax),%rax
  802ffc:	48 85 c0             	test   %rax,%rax
  802fff:	75 07                	jne    803008 <ftruncate+0xb4>
  803001:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803006:	eb 16                	jmp    80301e <ftruncate+0xca>
  803008:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80300c:	48 8b 40 30          	mov    0x30(%rax),%rax
  803010:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803014:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  803017:	89 ce                	mov    %ecx,%esi
  803019:	48 89 d7             	mov    %rdx,%rdi
  80301c:	ff d0                	callq  *%rax
  80301e:	c9                   	leaveq 
  80301f:	c3                   	retq   

0000000000803020 <fstat>:
  803020:	55                   	push   %rbp
  803021:	48 89 e5             	mov    %rsp,%rbp
  803024:	48 83 ec 30          	sub    $0x30,%rsp
  803028:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80302b:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80302f:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  803033:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803036:	48 89 d6             	mov    %rdx,%rsi
  803039:	89 c7                	mov    %eax,%edi
  80303b:	48 b8 bf 28 80 00 00 	movabs $0x8028bf,%rax
  803042:	00 00 00 
  803045:	ff d0                	callq  *%rax
  803047:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80304a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80304e:	78 24                	js     803074 <fstat+0x54>
  803050:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803054:	8b 00                	mov    (%rax),%eax
  803056:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80305a:	48 89 d6             	mov    %rdx,%rsi
  80305d:	89 c7                	mov    %eax,%edi
  80305f:	48 b8 18 2a 80 00 00 	movabs $0x802a18,%rax
  803066:	00 00 00 
  803069:	ff d0                	callq  *%rax
  80306b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80306e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803072:	79 05                	jns    803079 <fstat+0x59>
  803074:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803077:	eb 5e                	jmp    8030d7 <fstat+0xb7>
  803079:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80307d:	48 8b 40 28          	mov    0x28(%rax),%rax
  803081:	48 85 c0             	test   %rax,%rax
  803084:	75 07                	jne    80308d <fstat+0x6d>
  803086:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80308b:	eb 4a                	jmp    8030d7 <fstat+0xb7>
  80308d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803091:	c6 00 00             	movb   $0x0,(%rax)
  803094:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803098:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  80309f:	00 00 00 
  8030a2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8030a6:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  8030ad:	00 00 00 
  8030b0:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8030b4:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8030b8:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  8030bf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8030c3:	48 8b 40 28          	mov    0x28(%rax),%rax
  8030c7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8030cb:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  8030cf:	48 89 ce             	mov    %rcx,%rsi
  8030d2:	48 89 d7             	mov    %rdx,%rdi
  8030d5:	ff d0                	callq  *%rax
  8030d7:	c9                   	leaveq 
  8030d8:	c3                   	retq   

00000000008030d9 <stat>:
  8030d9:	55                   	push   %rbp
  8030da:	48 89 e5             	mov    %rsp,%rbp
  8030dd:	48 83 ec 20          	sub    $0x20,%rsp
  8030e1:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8030e5:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8030e9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8030ed:	be 00 00 00 00       	mov    $0x0,%esi
  8030f2:	48 89 c7             	mov    %rax,%rdi
  8030f5:	48 b8 c7 31 80 00 00 	movabs $0x8031c7,%rax
  8030fc:	00 00 00 
  8030ff:	ff d0                	callq  *%rax
  803101:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803104:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803108:	79 05                	jns    80310f <stat+0x36>
  80310a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80310d:	eb 2f                	jmp    80313e <stat+0x65>
  80310f:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  803113:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803116:	48 89 d6             	mov    %rdx,%rsi
  803119:	89 c7                	mov    %eax,%edi
  80311b:	48 b8 20 30 80 00 00 	movabs $0x803020,%rax
  803122:	00 00 00 
  803125:	ff d0                	callq  *%rax
  803127:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80312a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80312d:	89 c7                	mov    %eax,%edi
  80312f:	48 b8 cf 2a 80 00 00 	movabs $0x802acf,%rax
  803136:	00 00 00 
  803139:	ff d0                	callq  *%rax
  80313b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80313e:	c9                   	leaveq 
  80313f:	c3                   	retq   

0000000000803140 <fsipc>:
  803140:	55                   	push   %rbp
  803141:	48 89 e5             	mov    %rsp,%rbp
  803144:	48 83 ec 10          	sub    $0x10,%rsp
  803148:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80314b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80314f:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803156:	00 00 00 
  803159:	8b 00                	mov    (%rax),%eax
  80315b:	85 c0                	test   %eax,%eax
  80315d:	75 1d                	jne    80317c <fsipc+0x3c>
  80315f:	bf 01 00 00 00       	mov    $0x1,%edi
  803164:	48 b8 6d 4f 80 00 00 	movabs $0x804f6d,%rax
  80316b:	00 00 00 
  80316e:	ff d0                	callq  *%rax
  803170:	48 ba 00 90 80 00 00 	movabs $0x809000,%rdx
  803177:	00 00 00 
  80317a:	89 02                	mov    %eax,(%rdx)
  80317c:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803183:	00 00 00 
  803186:	8b 00                	mov    (%rax),%eax
  803188:	8b 75 fc             	mov    -0x4(%rbp),%esi
  80318b:	b9 07 00 00 00       	mov    $0x7,%ecx
  803190:	48 ba 00 a0 80 00 00 	movabs $0x80a000,%rdx
  803197:	00 00 00 
  80319a:	89 c7                	mov    %eax,%edi
  80319c:	48 b8 d7 4e 80 00 00 	movabs $0x804ed7,%rax
  8031a3:	00 00 00 
  8031a6:	ff d0                	callq  *%rax
  8031a8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8031ac:	ba 00 00 00 00       	mov    $0x0,%edx
  8031b1:	48 89 c6             	mov    %rax,%rsi
  8031b4:	bf 00 00 00 00       	mov    $0x0,%edi
  8031b9:	48 b8 16 4e 80 00 00 	movabs $0x804e16,%rax
  8031c0:	00 00 00 
  8031c3:	ff d0                	callq  *%rax
  8031c5:	c9                   	leaveq 
  8031c6:	c3                   	retq   

00000000008031c7 <open>:
  8031c7:	55                   	push   %rbp
  8031c8:	48 89 e5             	mov    %rsp,%rbp
  8031cb:	48 83 ec 20          	sub    $0x20,%rsp
  8031cf:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8031d3:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8031d6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8031da:	48 89 c7             	mov    %rax,%rdi
  8031dd:	48 b8 60 19 80 00 00 	movabs $0x801960,%rax
  8031e4:	00 00 00 
  8031e7:	ff d0                	callq  *%rax
  8031e9:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  8031ee:	7e 0a                	jle    8031fa <open+0x33>
  8031f0:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  8031f5:	e9 a5 00 00 00       	jmpq   80329f <open+0xd8>
  8031fa:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8031fe:	48 89 c7             	mov    %rax,%rdi
  803201:	48 b8 27 28 80 00 00 	movabs $0x802827,%rax
  803208:	00 00 00 
  80320b:	ff d0                	callq  *%rax
  80320d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803210:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803214:	79 08                	jns    80321e <open+0x57>
  803216:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803219:	e9 81 00 00 00       	jmpq   80329f <open+0xd8>
  80321e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803222:	48 89 c6             	mov    %rax,%rsi
  803225:	48 bf 00 a0 80 00 00 	movabs $0x80a000,%rdi
  80322c:	00 00 00 
  80322f:	48 b8 cc 19 80 00 00 	movabs $0x8019cc,%rax
  803236:	00 00 00 
  803239:	ff d0                	callq  *%rax
  80323b:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803242:	00 00 00 
  803245:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803248:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  80324e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803252:	48 89 c6             	mov    %rax,%rsi
  803255:	bf 01 00 00 00       	mov    $0x1,%edi
  80325a:	48 b8 40 31 80 00 00 	movabs $0x803140,%rax
  803261:	00 00 00 
  803264:	ff d0                	callq  *%rax
  803266:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803269:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80326d:	79 1d                	jns    80328c <open+0xc5>
  80326f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803273:	be 00 00 00 00       	mov    $0x0,%esi
  803278:	48 89 c7             	mov    %rax,%rdi
  80327b:	48 b8 4f 29 80 00 00 	movabs $0x80294f,%rax
  803282:	00 00 00 
  803285:	ff d0                	callq  *%rax
  803287:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80328a:	eb 13                	jmp    80329f <open+0xd8>
  80328c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803290:	48 89 c7             	mov    %rax,%rdi
  803293:	48 b8 d9 27 80 00 00 	movabs $0x8027d9,%rax
  80329a:	00 00 00 
  80329d:	ff d0                	callq  *%rax
  80329f:	c9                   	leaveq 
  8032a0:	c3                   	retq   

00000000008032a1 <devfile_flush>:
  8032a1:	55                   	push   %rbp
  8032a2:	48 89 e5             	mov    %rsp,%rbp
  8032a5:	48 83 ec 10          	sub    $0x10,%rsp
  8032a9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8032ad:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8032b1:	8b 50 0c             	mov    0xc(%rax),%edx
  8032b4:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8032bb:	00 00 00 
  8032be:	89 10                	mov    %edx,(%rax)
  8032c0:	be 00 00 00 00       	mov    $0x0,%esi
  8032c5:	bf 06 00 00 00       	mov    $0x6,%edi
  8032ca:	48 b8 40 31 80 00 00 	movabs $0x803140,%rax
  8032d1:	00 00 00 
  8032d4:	ff d0                	callq  *%rax
  8032d6:	c9                   	leaveq 
  8032d7:	c3                   	retq   

00000000008032d8 <devfile_read>:
  8032d8:	55                   	push   %rbp
  8032d9:	48 89 e5             	mov    %rsp,%rbp
  8032dc:	48 83 ec 30          	sub    $0x30,%rsp
  8032e0:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8032e4:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8032e8:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8032ec:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8032f0:	8b 50 0c             	mov    0xc(%rax),%edx
  8032f3:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8032fa:	00 00 00 
  8032fd:	89 10                	mov    %edx,(%rax)
  8032ff:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803306:	00 00 00 
  803309:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80330d:	48 89 50 08          	mov    %rdx,0x8(%rax)
  803311:	be 00 00 00 00       	mov    $0x0,%esi
  803316:	bf 03 00 00 00       	mov    $0x3,%edi
  80331b:	48 b8 40 31 80 00 00 	movabs $0x803140,%rax
  803322:	00 00 00 
  803325:	ff d0                	callq  *%rax
  803327:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80332a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80332e:	79 08                	jns    803338 <devfile_read+0x60>
  803330:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803333:	e9 a4 00 00 00       	jmpq   8033dc <devfile_read+0x104>
  803338:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80333b:	48 98                	cltq   
  80333d:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  803341:	76 35                	jbe    803378 <devfile_read+0xa0>
  803343:	48 b9 16 5d 80 00 00 	movabs $0x805d16,%rcx
  80334a:	00 00 00 
  80334d:	48 ba 1d 5d 80 00 00 	movabs $0x805d1d,%rdx
  803354:	00 00 00 
  803357:	be 89 00 00 00       	mov    $0x89,%esi
  80335c:	48 bf 32 5d 80 00 00 	movabs $0x805d32,%rdi
  803363:	00 00 00 
  803366:	b8 00 00 00 00       	mov    $0x0,%eax
  80336b:	49 b8 de 0b 80 00 00 	movabs $0x800bde,%r8
  803372:	00 00 00 
  803375:	41 ff d0             	callq  *%r8
  803378:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  80337f:	7e 35                	jle    8033b6 <devfile_read+0xde>
  803381:	48 b9 40 5d 80 00 00 	movabs $0x805d40,%rcx
  803388:	00 00 00 
  80338b:	48 ba 1d 5d 80 00 00 	movabs $0x805d1d,%rdx
  803392:	00 00 00 
  803395:	be 8a 00 00 00       	mov    $0x8a,%esi
  80339a:	48 bf 32 5d 80 00 00 	movabs $0x805d32,%rdi
  8033a1:	00 00 00 
  8033a4:	b8 00 00 00 00       	mov    $0x0,%eax
  8033a9:	49 b8 de 0b 80 00 00 	movabs $0x800bde,%r8
  8033b0:	00 00 00 
  8033b3:	41 ff d0             	callq  *%r8
  8033b6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033b9:	48 63 d0             	movslq %eax,%rdx
  8033bc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8033c0:	48 be 00 a0 80 00 00 	movabs $0x80a000,%rsi
  8033c7:	00 00 00 
  8033ca:	48 89 c7             	mov    %rax,%rdi
  8033cd:	48 b8 f0 1c 80 00 00 	movabs $0x801cf0,%rax
  8033d4:	00 00 00 
  8033d7:	ff d0                	callq  *%rax
  8033d9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033dc:	c9                   	leaveq 
  8033dd:	c3                   	retq   

00000000008033de <devfile_write>:
  8033de:	55                   	push   %rbp
  8033df:	48 89 e5             	mov    %rsp,%rbp
  8033e2:	48 83 ec 40          	sub    $0x40,%rsp
  8033e6:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8033ea:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8033ee:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8033f2:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8033f6:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8033fa:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  803401:	00 
  803402:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803406:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  80340a:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  80340f:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  803413:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803417:	8b 50 0c             	mov    0xc(%rax),%edx
  80341a:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803421:	00 00 00 
  803424:	89 10                	mov    %edx,(%rax)
  803426:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80342d:	00 00 00 
  803430:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803434:	48 89 50 08          	mov    %rdx,0x8(%rax)
  803438:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80343c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803440:	48 89 c6             	mov    %rax,%rsi
  803443:	48 bf 10 a0 80 00 00 	movabs $0x80a010,%rdi
  80344a:	00 00 00 
  80344d:	48 b8 f0 1c 80 00 00 	movabs $0x801cf0,%rax
  803454:	00 00 00 
  803457:	ff d0                	callq  *%rax
  803459:	be 00 00 00 00       	mov    $0x0,%esi
  80345e:	bf 04 00 00 00       	mov    $0x4,%edi
  803463:	48 b8 40 31 80 00 00 	movabs $0x803140,%rax
  80346a:	00 00 00 
  80346d:	ff d0                	callq  *%rax
  80346f:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803472:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803476:	79 05                	jns    80347d <devfile_write+0x9f>
  803478:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80347b:	eb 43                	jmp    8034c0 <devfile_write+0xe2>
  80347d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803480:	48 98                	cltq   
  803482:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803486:	76 35                	jbe    8034bd <devfile_write+0xdf>
  803488:	48 b9 16 5d 80 00 00 	movabs $0x805d16,%rcx
  80348f:	00 00 00 
  803492:	48 ba 1d 5d 80 00 00 	movabs $0x805d1d,%rdx
  803499:	00 00 00 
  80349c:	be a8 00 00 00       	mov    $0xa8,%esi
  8034a1:	48 bf 32 5d 80 00 00 	movabs $0x805d32,%rdi
  8034a8:	00 00 00 
  8034ab:	b8 00 00 00 00       	mov    $0x0,%eax
  8034b0:	49 b8 de 0b 80 00 00 	movabs $0x800bde,%r8
  8034b7:	00 00 00 
  8034ba:	41 ff d0             	callq  *%r8
  8034bd:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8034c0:	c9                   	leaveq 
  8034c1:	c3                   	retq   

00000000008034c2 <devfile_stat>:
  8034c2:	55                   	push   %rbp
  8034c3:	48 89 e5             	mov    %rsp,%rbp
  8034c6:	48 83 ec 20          	sub    $0x20,%rsp
  8034ca:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8034ce:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8034d2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8034d6:	8b 50 0c             	mov    0xc(%rax),%edx
  8034d9:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8034e0:	00 00 00 
  8034e3:	89 10                	mov    %edx,(%rax)
  8034e5:	be 00 00 00 00       	mov    $0x0,%esi
  8034ea:	bf 05 00 00 00       	mov    $0x5,%edi
  8034ef:	48 b8 40 31 80 00 00 	movabs $0x803140,%rax
  8034f6:	00 00 00 
  8034f9:	ff d0                	callq  *%rax
  8034fb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8034fe:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803502:	79 05                	jns    803509 <devfile_stat+0x47>
  803504:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803507:	eb 56                	jmp    80355f <devfile_stat+0x9d>
  803509:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80350d:	48 be 00 a0 80 00 00 	movabs $0x80a000,%rsi
  803514:	00 00 00 
  803517:	48 89 c7             	mov    %rax,%rdi
  80351a:	48 b8 cc 19 80 00 00 	movabs $0x8019cc,%rax
  803521:	00 00 00 
  803524:	ff d0                	callq  *%rax
  803526:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80352d:	00 00 00 
  803530:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  803536:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80353a:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  803540:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803547:	00 00 00 
  80354a:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  803550:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803554:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  80355a:	b8 00 00 00 00       	mov    $0x0,%eax
  80355f:	c9                   	leaveq 
  803560:	c3                   	retq   

0000000000803561 <devfile_trunc>:
  803561:	55                   	push   %rbp
  803562:	48 89 e5             	mov    %rsp,%rbp
  803565:	48 83 ec 10          	sub    $0x10,%rsp
  803569:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80356d:	89 75 f4             	mov    %esi,-0xc(%rbp)
  803570:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803574:	8b 50 0c             	mov    0xc(%rax),%edx
  803577:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80357e:	00 00 00 
  803581:	89 10                	mov    %edx,(%rax)
  803583:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80358a:	00 00 00 
  80358d:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803590:	89 50 04             	mov    %edx,0x4(%rax)
  803593:	be 00 00 00 00       	mov    $0x0,%esi
  803598:	bf 02 00 00 00       	mov    $0x2,%edi
  80359d:	48 b8 40 31 80 00 00 	movabs $0x803140,%rax
  8035a4:	00 00 00 
  8035a7:	ff d0                	callq  *%rax
  8035a9:	c9                   	leaveq 
  8035aa:	c3                   	retq   

00000000008035ab <remove>:
  8035ab:	55                   	push   %rbp
  8035ac:	48 89 e5             	mov    %rsp,%rbp
  8035af:	48 83 ec 10          	sub    $0x10,%rsp
  8035b3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8035b7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8035bb:	48 89 c7             	mov    %rax,%rdi
  8035be:	48 b8 60 19 80 00 00 	movabs $0x801960,%rax
  8035c5:	00 00 00 
  8035c8:	ff d0                	callq  *%rax
  8035ca:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  8035cf:	7e 07                	jle    8035d8 <remove+0x2d>
  8035d1:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  8035d6:	eb 33                	jmp    80360b <remove+0x60>
  8035d8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8035dc:	48 89 c6             	mov    %rax,%rsi
  8035df:	48 bf 00 a0 80 00 00 	movabs $0x80a000,%rdi
  8035e6:	00 00 00 
  8035e9:	48 b8 cc 19 80 00 00 	movabs $0x8019cc,%rax
  8035f0:	00 00 00 
  8035f3:	ff d0                	callq  *%rax
  8035f5:	be 00 00 00 00       	mov    $0x0,%esi
  8035fa:	bf 07 00 00 00       	mov    $0x7,%edi
  8035ff:	48 b8 40 31 80 00 00 	movabs $0x803140,%rax
  803606:	00 00 00 
  803609:	ff d0                	callq  *%rax
  80360b:	c9                   	leaveq 
  80360c:	c3                   	retq   

000000000080360d <sync>:
  80360d:	55                   	push   %rbp
  80360e:	48 89 e5             	mov    %rsp,%rbp
  803611:	be 00 00 00 00       	mov    $0x0,%esi
  803616:	bf 08 00 00 00       	mov    $0x8,%edi
  80361b:	48 b8 40 31 80 00 00 	movabs $0x803140,%rax
  803622:	00 00 00 
  803625:	ff d0                	callq  *%rax
  803627:	5d                   	pop    %rbp
  803628:	c3                   	retq   

0000000000803629 <copy>:
  803629:	55                   	push   %rbp
  80362a:	48 89 e5             	mov    %rsp,%rbp
  80362d:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  803634:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  80363b:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  803642:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  803649:	be 00 00 00 00       	mov    $0x0,%esi
  80364e:	48 89 c7             	mov    %rax,%rdi
  803651:	48 b8 c7 31 80 00 00 	movabs $0x8031c7,%rax
  803658:	00 00 00 
  80365b:	ff d0                	callq  *%rax
  80365d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803660:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803664:	79 28                	jns    80368e <copy+0x65>
  803666:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803669:	89 c6                	mov    %eax,%esi
  80366b:	48 bf 4c 5d 80 00 00 	movabs $0x805d4c,%rdi
  803672:	00 00 00 
  803675:	b8 00 00 00 00       	mov    $0x0,%eax
  80367a:	48 ba 17 0e 80 00 00 	movabs $0x800e17,%rdx
  803681:	00 00 00 
  803684:	ff d2                	callq  *%rdx
  803686:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803689:	e9 74 01 00 00       	jmpq   803802 <copy+0x1d9>
  80368e:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  803695:	be 01 01 00 00       	mov    $0x101,%esi
  80369a:	48 89 c7             	mov    %rax,%rdi
  80369d:	48 b8 c7 31 80 00 00 	movabs $0x8031c7,%rax
  8036a4:	00 00 00 
  8036a7:	ff d0                	callq  *%rax
  8036a9:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8036ac:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8036b0:	79 39                	jns    8036eb <copy+0xc2>
  8036b2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8036b5:	89 c6                	mov    %eax,%esi
  8036b7:	48 bf 62 5d 80 00 00 	movabs $0x805d62,%rdi
  8036be:	00 00 00 
  8036c1:	b8 00 00 00 00       	mov    $0x0,%eax
  8036c6:	48 ba 17 0e 80 00 00 	movabs $0x800e17,%rdx
  8036cd:	00 00 00 
  8036d0:	ff d2                	callq  *%rdx
  8036d2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036d5:	89 c7                	mov    %eax,%edi
  8036d7:	48 b8 cf 2a 80 00 00 	movabs $0x802acf,%rax
  8036de:	00 00 00 
  8036e1:	ff d0                	callq  *%rax
  8036e3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8036e6:	e9 17 01 00 00       	jmpq   803802 <copy+0x1d9>
  8036eb:	eb 74                	jmp    803761 <copy+0x138>
  8036ed:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8036f0:	48 63 d0             	movslq %eax,%rdx
  8036f3:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  8036fa:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8036fd:	48 89 ce             	mov    %rcx,%rsi
  803700:	89 c7                	mov    %eax,%edi
  803702:	48 b8 3b 2e 80 00 00 	movabs $0x802e3b,%rax
  803709:	00 00 00 
  80370c:	ff d0                	callq  *%rax
  80370e:	89 45 f0             	mov    %eax,-0x10(%rbp)
  803711:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  803715:	79 4a                	jns    803761 <copy+0x138>
  803717:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80371a:	89 c6                	mov    %eax,%esi
  80371c:	48 bf 7c 5d 80 00 00 	movabs $0x805d7c,%rdi
  803723:	00 00 00 
  803726:	b8 00 00 00 00       	mov    $0x0,%eax
  80372b:	48 ba 17 0e 80 00 00 	movabs $0x800e17,%rdx
  803732:	00 00 00 
  803735:	ff d2                	callq  *%rdx
  803737:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80373a:	89 c7                	mov    %eax,%edi
  80373c:	48 b8 cf 2a 80 00 00 	movabs $0x802acf,%rax
  803743:	00 00 00 
  803746:	ff d0                	callq  *%rax
  803748:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80374b:	89 c7                	mov    %eax,%edi
  80374d:	48 b8 cf 2a 80 00 00 	movabs $0x802acf,%rax
  803754:	00 00 00 
  803757:	ff d0                	callq  *%rax
  803759:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80375c:	e9 a1 00 00 00       	jmpq   803802 <copy+0x1d9>
  803761:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  803768:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80376b:	ba 00 02 00 00       	mov    $0x200,%edx
  803770:	48 89 ce             	mov    %rcx,%rsi
  803773:	89 c7                	mov    %eax,%edi
  803775:	48 b8 f1 2c 80 00 00 	movabs $0x802cf1,%rax
  80377c:	00 00 00 
  80377f:	ff d0                	callq  *%rax
  803781:	89 45 f4             	mov    %eax,-0xc(%rbp)
  803784:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  803788:	0f 8f 5f ff ff ff    	jg     8036ed <copy+0xc4>
  80378e:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  803792:	79 47                	jns    8037db <copy+0x1b2>
  803794:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803797:	89 c6                	mov    %eax,%esi
  803799:	48 bf 8f 5d 80 00 00 	movabs $0x805d8f,%rdi
  8037a0:	00 00 00 
  8037a3:	b8 00 00 00 00       	mov    $0x0,%eax
  8037a8:	48 ba 17 0e 80 00 00 	movabs $0x800e17,%rdx
  8037af:	00 00 00 
  8037b2:	ff d2                	callq  *%rdx
  8037b4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037b7:	89 c7                	mov    %eax,%edi
  8037b9:	48 b8 cf 2a 80 00 00 	movabs $0x802acf,%rax
  8037c0:	00 00 00 
  8037c3:	ff d0                	callq  *%rax
  8037c5:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8037c8:	89 c7                	mov    %eax,%edi
  8037ca:	48 b8 cf 2a 80 00 00 	movabs $0x802acf,%rax
  8037d1:	00 00 00 
  8037d4:	ff d0                	callq  *%rax
  8037d6:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8037d9:	eb 27                	jmp    803802 <copy+0x1d9>
  8037db:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037de:	89 c7                	mov    %eax,%edi
  8037e0:	48 b8 cf 2a 80 00 00 	movabs $0x802acf,%rax
  8037e7:	00 00 00 
  8037ea:	ff d0                	callq  *%rax
  8037ec:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8037ef:	89 c7                	mov    %eax,%edi
  8037f1:	48 b8 cf 2a 80 00 00 	movabs $0x802acf,%rax
  8037f8:	00 00 00 
  8037fb:	ff d0                	callq  *%rax
  8037fd:	b8 00 00 00 00       	mov    $0x0,%eax
  803802:	c9                   	leaveq 
  803803:	c3                   	retq   

0000000000803804 <fd2sockid>:
  803804:	55                   	push   %rbp
  803805:	48 89 e5             	mov    %rsp,%rbp
  803808:	48 83 ec 20          	sub    $0x20,%rsp
  80380c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80380f:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803813:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803816:	48 89 d6             	mov    %rdx,%rsi
  803819:	89 c7                	mov    %eax,%edi
  80381b:	48 b8 bf 28 80 00 00 	movabs $0x8028bf,%rax
  803822:	00 00 00 
  803825:	ff d0                	callq  *%rax
  803827:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80382a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80382e:	79 05                	jns    803835 <fd2sockid+0x31>
  803830:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803833:	eb 24                	jmp    803859 <fd2sockid+0x55>
  803835:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803839:	8b 10                	mov    (%rax),%edx
  80383b:	48 b8 e0 80 80 00 00 	movabs $0x8080e0,%rax
  803842:	00 00 00 
  803845:	8b 00                	mov    (%rax),%eax
  803847:	39 c2                	cmp    %eax,%edx
  803849:	74 07                	je     803852 <fd2sockid+0x4e>
  80384b:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803850:	eb 07                	jmp    803859 <fd2sockid+0x55>
  803852:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803856:	8b 40 0c             	mov    0xc(%rax),%eax
  803859:	c9                   	leaveq 
  80385a:	c3                   	retq   

000000000080385b <alloc_sockfd>:
  80385b:	55                   	push   %rbp
  80385c:	48 89 e5             	mov    %rsp,%rbp
  80385f:	48 83 ec 20          	sub    $0x20,%rsp
  803863:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803866:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  80386a:	48 89 c7             	mov    %rax,%rdi
  80386d:	48 b8 27 28 80 00 00 	movabs $0x802827,%rax
  803874:	00 00 00 
  803877:	ff d0                	callq  *%rax
  803879:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80387c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803880:	78 26                	js     8038a8 <alloc_sockfd+0x4d>
  803882:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803886:	ba 07 04 00 00       	mov    $0x407,%edx
  80388b:	48 89 c6             	mov    %rax,%rsi
  80388e:	bf 00 00 00 00       	mov    $0x0,%edi
  803893:	48 b8 fb 22 80 00 00 	movabs $0x8022fb,%rax
  80389a:	00 00 00 
  80389d:	ff d0                	callq  *%rax
  80389f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8038a2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8038a6:	79 16                	jns    8038be <alloc_sockfd+0x63>
  8038a8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8038ab:	89 c7                	mov    %eax,%edi
  8038ad:	48 b8 68 3d 80 00 00 	movabs $0x803d68,%rax
  8038b4:	00 00 00 
  8038b7:	ff d0                	callq  *%rax
  8038b9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038bc:	eb 3a                	jmp    8038f8 <alloc_sockfd+0x9d>
  8038be:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8038c2:	48 ba e0 80 80 00 00 	movabs $0x8080e0,%rdx
  8038c9:	00 00 00 
  8038cc:	8b 12                	mov    (%rdx),%edx
  8038ce:	89 10                	mov    %edx,(%rax)
  8038d0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8038d4:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8038db:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8038df:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8038e2:	89 50 0c             	mov    %edx,0xc(%rax)
  8038e5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8038e9:	48 89 c7             	mov    %rax,%rdi
  8038ec:	48 b8 d9 27 80 00 00 	movabs $0x8027d9,%rax
  8038f3:	00 00 00 
  8038f6:	ff d0                	callq  *%rax
  8038f8:	c9                   	leaveq 
  8038f9:	c3                   	retq   

00000000008038fa <accept>:
  8038fa:	55                   	push   %rbp
  8038fb:	48 89 e5             	mov    %rsp,%rbp
  8038fe:	48 83 ec 30          	sub    $0x30,%rsp
  803902:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803905:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803909:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80390d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803910:	89 c7                	mov    %eax,%edi
  803912:	48 b8 04 38 80 00 00 	movabs $0x803804,%rax
  803919:	00 00 00 
  80391c:	ff d0                	callq  *%rax
  80391e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803921:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803925:	79 05                	jns    80392c <accept+0x32>
  803927:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80392a:	eb 3b                	jmp    803967 <accept+0x6d>
  80392c:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803930:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803934:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803937:	48 89 ce             	mov    %rcx,%rsi
  80393a:	89 c7                	mov    %eax,%edi
  80393c:	48 b8 45 3c 80 00 00 	movabs $0x803c45,%rax
  803943:	00 00 00 
  803946:	ff d0                	callq  *%rax
  803948:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80394b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80394f:	79 05                	jns    803956 <accept+0x5c>
  803951:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803954:	eb 11                	jmp    803967 <accept+0x6d>
  803956:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803959:	89 c7                	mov    %eax,%edi
  80395b:	48 b8 5b 38 80 00 00 	movabs $0x80385b,%rax
  803962:	00 00 00 
  803965:	ff d0                	callq  *%rax
  803967:	c9                   	leaveq 
  803968:	c3                   	retq   

0000000000803969 <bind>:
  803969:	55                   	push   %rbp
  80396a:	48 89 e5             	mov    %rsp,%rbp
  80396d:	48 83 ec 20          	sub    $0x20,%rsp
  803971:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803974:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803978:	89 55 e8             	mov    %edx,-0x18(%rbp)
  80397b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80397e:	89 c7                	mov    %eax,%edi
  803980:	48 b8 04 38 80 00 00 	movabs $0x803804,%rax
  803987:	00 00 00 
  80398a:	ff d0                	callq  *%rax
  80398c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80398f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803993:	79 05                	jns    80399a <bind+0x31>
  803995:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803998:	eb 1b                	jmp    8039b5 <bind+0x4c>
  80399a:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80399d:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8039a1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039a4:	48 89 ce             	mov    %rcx,%rsi
  8039a7:	89 c7                	mov    %eax,%edi
  8039a9:	48 b8 c4 3c 80 00 00 	movabs $0x803cc4,%rax
  8039b0:	00 00 00 
  8039b3:	ff d0                	callq  *%rax
  8039b5:	c9                   	leaveq 
  8039b6:	c3                   	retq   

00000000008039b7 <shutdown>:
  8039b7:	55                   	push   %rbp
  8039b8:	48 89 e5             	mov    %rsp,%rbp
  8039bb:	48 83 ec 20          	sub    $0x20,%rsp
  8039bf:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8039c2:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8039c5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8039c8:	89 c7                	mov    %eax,%edi
  8039ca:	48 b8 04 38 80 00 00 	movabs $0x803804,%rax
  8039d1:	00 00 00 
  8039d4:	ff d0                	callq  *%rax
  8039d6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8039d9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8039dd:	79 05                	jns    8039e4 <shutdown+0x2d>
  8039df:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039e2:	eb 16                	jmp    8039fa <shutdown+0x43>
  8039e4:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8039e7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039ea:	89 d6                	mov    %edx,%esi
  8039ec:	89 c7                	mov    %eax,%edi
  8039ee:	48 b8 28 3d 80 00 00 	movabs $0x803d28,%rax
  8039f5:	00 00 00 
  8039f8:	ff d0                	callq  *%rax
  8039fa:	c9                   	leaveq 
  8039fb:	c3                   	retq   

00000000008039fc <devsock_close>:
  8039fc:	55                   	push   %rbp
  8039fd:	48 89 e5             	mov    %rsp,%rbp
  803a00:	48 83 ec 10          	sub    $0x10,%rsp
  803a04:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803a08:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803a0c:	48 89 c7             	mov    %rax,%rdi
  803a0f:	48 b8 df 4f 80 00 00 	movabs $0x804fdf,%rax
  803a16:	00 00 00 
  803a19:	ff d0                	callq  *%rax
  803a1b:	83 f8 01             	cmp    $0x1,%eax
  803a1e:	75 17                	jne    803a37 <devsock_close+0x3b>
  803a20:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803a24:	8b 40 0c             	mov    0xc(%rax),%eax
  803a27:	89 c7                	mov    %eax,%edi
  803a29:	48 b8 68 3d 80 00 00 	movabs $0x803d68,%rax
  803a30:	00 00 00 
  803a33:	ff d0                	callq  *%rax
  803a35:	eb 05                	jmp    803a3c <devsock_close+0x40>
  803a37:	b8 00 00 00 00       	mov    $0x0,%eax
  803a3c:	c9                   	leaveq 
  803a3d:	c3                   	retq   

0000000000803a3e <connect>:
  803a3e:	55                   	push   %rbp
  803a3f:	48 89 e5             	mov    %rsp,%rbp
  803a42:	48 83 ec 20          	sub    $0x20,%rsp
  803a46:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803a49:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803a4d:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803a50:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803a53:	89 c7                	mov    %eax,%edi
  803a55:	48 b8 04 38 80 00 00 	movabs $0x803804,%rax
  803a5c:	00 00 00 
  803a5f:	ff d0                	callq  *%rax
  803a61:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803a64:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803a68:	79 05                	jns    803a6f <connect+0x31>
  803a6a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a6d:	eb 1b                	jmp    803a8a <connect+0x4c>
  803a6f:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803a72:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803a76:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a79:	48 89 ce             	mov    %rcx,%rsi
  803a7c:	89 c7                	mov    %eax,%edi
  803a7e:	48 b8 95 3d 80 00 00 	movabs $0x803d95,%rax
  803a85:	00 00 00 
  803a88:	ff d0                	callq  *%rax
  803a8a:	c9                   	leaveq 
  803a8b:	c3                   	retq   

0000000000803a8c <listen>:
  803a8c:	55                   	push   %rbp
  803a8d:	48 89 e5             	mov    %rsp,%rbp
  803a90:	48 83 ec 20          	sub    $0x20,%rsp
  803a94:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803a97:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803a9a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803a9d:	89 c7                	mov    %eax,%edi
  803a9f:	48 b8 04 38 80 00 00 	movabs $0x803804,%rax
  803aa6:	00 00 00 
  803aa9:	ff d0                	callq  *%rax
  803aab:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803aae:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803ab2:	79 05                	jns    803ab9 <listen+0x2d>
  803ab4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ab7:	eb 16                	jmp    803acf <listen+0x43>
  803ab9:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803abc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803abf:	89 d6                	mov    %edx,%esi
  803ac1:	89 c7                	mov    %eax,%edi
  803ac3:	48 b8 f9 3d 80 00 00 	movabs $0x803df9,%rax
  803aca:	00 00 00 
  803acd:	ff d0                	callq  *%rax
  803acf:	c9                   	leaveq 
  803ad0:	c3                   	retq   

0000000000803ad1 <devsock_read>:
  803ad1:	55                   	push   %rbp
  803ad2:	48 89 e5             	mov    %rsp,%rbp
  803ad5:	48 83 ec 20          	sub    $0x20,%rsp
  803ad9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803add:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803ae1:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803ae5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803ae9:	89 c2                	mov    %eax,%edx
  803aeb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803aef:	8b 40 0c             	mov    0xc(%rax),%eax
  803af2:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803af6:	b9 00 00 00 00       	mov    $0x0,%ecx
  803afb:	89 c7                	mov    %eax,%edi
  803afd:	48 b8 39 3e 80 00 00 	movabs $0x803e39,%rax
  803b04:	00 00 00 
  803b07:	ff d0                	callq  *%rax
  803b09:	c9                   	leaveq 
  803b0a:	c3                   	retq   

0000000000803b0b <devsock_write>:
  803b0b:	55                   	push   %rbp
  803b0c:	48 89 e5             	mov    %rsp,%rbp
  803b0f:	48 83 ec 20          	sub    $0x20,%rsp
  803b13:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803b17:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803b1b:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803b1f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803b23:	89 c2                	mov    %eax,%edx
  803b25:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803b29:	8b 40 0c             	mov    0xc(%rax),%eax
  803b2c:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803b30:	b9 00 00 00 00       	mov    $0x0,%ecx
  803b35:	89 c7                	mov    %eax,%edi
  803b37:	48 b8 05 3f 80 00 00 	movabs $0x803f05,%rax
  803b3e:	00 00 00 
  803b41:	ff d0                	callq  *%rax
  803b43:	c9                   	leaveq 
  803b44:	c3                   	retq   

0000000000803b45 <devsock_stat>:
  803b45:	55                   	push   %rbp
  803b46:	48 89 e5             	mov    %rsp,%rbp
  803b49:	48 83 ec 10          	sub    $0x10,%rsp
  803b4d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803b51:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803b55:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b59:	48 be aa 5d 80 00 00 	movabs $0x805daa,%rsi
  803b60:	00 00 00 
  803b63:	48 89 c7             	mov    %rax,%rdi
  803b66:	48 b8 cc 19 80 00 00 	movabs $0x8019cc,%rax
  803b6d:	00 00 00 
  803b70:	ff d0                	callq  *%rax
  803b72:	b8 00 00 00 00       	mov    $0x0,%eax
  803b77:	c9                   	leaveq 
  803b78:	c3                   	retq   

0000000000803b79 <socket>:
  803b79:	55                   	push   %rbp
  803b7a:	48 89 e5             	mov    %rsp,%rbp
  803b7d:	48 83 ec 20          	sub    $0x20,%rsp
  803b81:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803b84:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803b87:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  803b8a:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803b8d:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803b90:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803b93:	89 ce                	mov    %ecx,%esi
  803b95:	89 c7                	mov    %eax,%edi
  803b97:	48 b8 bd 3f 80 00 00 	movabs $0x803fbd,%rax
  803b9e:	00 00 00 
  803ba1:	ff d0                	callq  *%rax
  803ba3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803ba6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803baa:	79 05                	jns    803bb1 <socket+0x38>
  803bac:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803baf:	eb 11                	jmp    803bc2 <socket+0x49>
  803bb1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803bb4:	89 c7                	mov    %eax,%edi
  803bb6:	48 b8 5b 38 80 00 00 	movabs $0x80385b,%rax
  803bbd:	00 00 00 
  803bc0:	ff d0                	callq  *%rax
  803bc2:	c9                   	leaveq 
  803bc3:	c3                   	retq   

0000000000803bc4 <nsipc>:
  803bc4:	55                   	push   %rbp
  803bc5:	48 89 e5             	mov    %rsp,%rbp
  803bc8:	48 83 ec 10          	sub    $0x10,%rsp
  803bcc:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803bcf:	48 b8 04 90 80 00 00 	movabs $0x809004,%rax
  803bd6:	00 00 00 
  803bd9:	8b 00                	mov    (%rax),%eax
  803bdb:	85 c0                	test   %eax,%eax
  803bdd:	75 1d                	jne    803bfc <nsipc+0x38>
  803bdf:	bf 02 00 00 00       	mov    $0x2,%edi
  803be4:	48 b8 6d 4f 80 00 00 	movabs $0x804f6d,%rax
  803beb:	00 00 00 
  803bee:	ff d0                	callq  *%rax
  803bf0:	48 ba 04 90 80 00 00 	movabs $0x809004,%rdx
  803bf7:	00 00 00 
  803bfa:	89 02                	mov    %eax,(%rdx)
  803bfc:	48 b8 04 90 80 00 00 	movabs $0x809004,%rax
  803c03:	00 00 00 
  803c06:	8b 00                	mov    (%rax),%eax
  803c08:	8b 75 fc             	mov    -0x4(%rbp),%esi
  803c0b:	b9 07 00 00 00       	mov    $0x7,%ecx
  803c10:	48 ba 00 c0 80 00 00 	movabs $0x80c000,%rdx
  803c17:	00 00 00 
  803c1a:	89 c7                	mov    %eax,%edi
  803c1c:	48 b8 d7 4e 80 00 00 	movabs $0x804ed7,%rax
  803c23:	00 00 00 
  803c26:	ff d0                	callq  *%rax
  803c28:	ba 00 00 00 00       	mov    $0x0,%edx
  803c2d:	be 00 00 00 00       	mov    $0x0,%esi
  803c32:	bf 00 00 00 00       	mov    $0x0,%edi
  803c37:	48 b8 16 4e 80 00 00 	movabs $0x804e16,%rax
  803c3e:	00 00 00 
  803c41:	ff d0                	callq  *%rax
  803c43:	c9                   	leaveq 
  803c44:	c3                   	retq   

0000000000803c45 <nsipc_accept>:
  803c45:	55                   	push   %rbp
  803c46:	48 89 e5             	mov    %rsp,%rbp
  803c49:	48 83 ec 30          	sub    $0x30,%rsp
  803c4d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803c50:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803c54:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803c58:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803c5f:	00 00 00 
  803c62:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803c65:	89 10                	mov    %edx,(%rax)
  803c67:	bf 01 00 00 00       	mov    $0x1,%edi
  803c6c:	48 b8 c4 3b 80 00 00 	movabs $0x803bc4,%rax
  803c73:	00 00 00 
  803c76:	ff d0                	callq  *%rax
  803c78:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803c7b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803c7f:	78 3e                	js     803cbf <nsipc_accept+0x7a>
  803c81:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803c88:	00 00 00 
  803c8b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803c8f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803c93:	8b 40 10             	mov    0x10(%rax),%eax
  803c96:	89 c2                	mov    %eax,%edx
  803c98:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  803c9c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803ca0:	48 89 ce             	mov    %rcx,%rsi
  803ca3:	48 89 c7             	mov    %rax,%rdi
  803ca6:	48 b8 f0 1c 80 00 00 	movabs $0x801cf0,%rax
  803cad:	00 00 00 
  803cb0:	ff d0                	callq  *%rax
  803cb2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803cb6:	8b 50 10             	mov    0x10(%rax),%edx
  803cb9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803cbd:	89 10                	mov    %edx,(%rax)
  803cbf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803cc2:	c9                   	leaveq 
  803cc3:	c3                   	retq   

0000000000803cc4 <nsipc_bind>:
  803cc4:	55                   	push   %rbp
  803cc5:	48 89 e5             	mov    %rsp,%rbp
  803cc8:	48 83 ec 10          	sub    $0x10,%rsp
  803ccc:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803ccf:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803cd3:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803cd6:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803cdd:	00 00 00 
  803ce0:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803ce3:	89 10                	mov    %edx,(%rax)
  803ce5:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803ce8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803cec:	48 89 c6             	mov    %rax,%rsi
  803cef:	48 bf 04 c0 80 00 00 	movabs $0x80c004,%rdi
  803cf6:	00 00 00 
  803cf9:	48 b8 f0 1c 80 00 00 	movabs $0x801cf0,%rax
  803d00:	00 00 00 
  803d03:	ff d0                	callq  *%rax
  803d05:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803d0c:	00 00 00 
  803d0f:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803d12:	89 50 14             	mov    %edx,0x14(%rax)
  803d15:	bf 02 00 00 00       	mov    $0x2,%edi
  803d1a:	48 b8 c4 3b 80 00 00 	movabs $0x803bc4,%rax
  803d21:	00 00 00 
  803d24:	ff d0                	callq  *%rax
  803d26:	c9                   	leaveq 
  803d27:	c3                   	retq   

0000000000803d28 <nsipc_shutdown>:
  803d28:	55                   	push   %rbp
  803d29:	48 89 e5             	mov    %rsp,%rbp
  803d2c:	48 83 ec 10          	sub    $0x10,%rsp
  803d30:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803d33:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803d36:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803d3d:	00 00 00 
  803d40:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803d43:	89 10                	mov    %edx,(%rax)
  803d45:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803d4c:	00 00 00 
  803d4f:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803d52:	89 50 04             	mov    %edx,0x4(%rax)
  803d55:	bf 03 00 00 00       	mov    $0x3,%edi
  803d5a:	48 b8 c4 3b 80 00 00 	movabs $0x803bc4,%rax
  803d61:	00 00 00 
  803d64:	ff d0                	callq  *%rax
  803d66:	c9                   	leaveq 
  803d67:	c3                   	retq   

0000000000803d68 <nsipc_close>:
  803d68:	55                   	push   %rbp
  803d69:	48 89 e5             	mov    %rsp,%rbp
  803d6c:	48 83 ec 10          	sub    $0x10,%rsp
  803d70:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803d73:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803d7a:	00 00 00 
  803d7d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803d80:	89 10                	mov    %edx,(%rax)
  803d82:	bf 04 00 00 00       	mov    $0x4,%edi
  803d87:	48 b8 c4 3b 80 00 00 	movabs $0x803bc4,%rax
  803d8e:	00 00 00 
  803d91:	ff d0                	callq  *%rax
  803d93:	c9                   	leaveq 
  803d94:	c3                   	retq   

0000000000803d95 <nsipc_connect>:
  803d95:	55                   	push   %rbp
  803d96:	48 89 e5             	mov    %rsp,%rbp
  803d99:	48 83 ec 10          	sub    $0x10,%rsp
  803d9d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803da0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803da4:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803da7:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803dae:	00 00 00 
  803db1:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803db4:	89 10                	mov    %edx,(%rax)
  803db6:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803db9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803dbd:	48 89 c6             	mov    %rax,%rsi
  803dc0:	48 bf 04 c0 80 00 00 	movabs $0x80c004,%rdi
  803dc7:	00 00 00 
  803dca:	48 b8 f0 1c 80 00 00 	movabs $0x801cf0,%rax
  803dd1:	00 00 00 
  803dd4:	ff d0                	callq  *%rax
  803dd6:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803ddd:	00 00 00 
  803de0:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803de3:	89 50 14             	mov    %edx,0x14(%rax)
  803de6:	bf 05 00 00 00       	mov    $0x5,%edi
  803deb:	48 b8 c4 3b 80 00 00 	movabs $0x803bc4,%rax
  803df2:	00 00 00 
  803df5:	ff d0                	callq  *%rax
  803df7:	c9                   	leaveq 
  803df8:	c3                   	retq   

0000000000803df9 <nsipc_listen>:
  803df9:	55                   	push   %rbp
  803dfa:	48 89 e5             	mov    %rsp,%rbp
  803dfd:	48 83 ec 10          	sub    $0x10,%rsp
  803e01:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803e04:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803e07:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803e0e:	00 00 00 
  803e11:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803e14:	89 10                	mov    %edx,(%rax)
  803e16:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803e1d:	00 00 00 
  803e20:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803e23:	89 50 04             	mov    %edx,0x4(%rax)
  803e26:	bf 06 00 00 00       	mov    $0x6,%edi
  803e2b:	48 b8 c4 3b 80 00 00 	movabs $0x803bc4,%rax
  803e32:	00 00 00 
  803e35:	ff d0                	callq  *%rax
  803e37:	c9                   	leaveq 
  803e38:	c3                   	retq   

0000000000803e39 <nsipc_recv>:
  803e39:	55                   	push   %rbp
  803e3a:	48 89 e5             	mov    %rsp,%rbp
  803e3d:	48 83 ec 30          	sub    $0x30,%rsp
  803e41:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803e44:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803e48:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803e4b:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  803e4e:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803e55:	00 00 00 
  803e58:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803e5b:	89 10                	mov    %edx,(%rax)
  803e5d:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803e64:	00 00 00 
  803e67:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803e6a:	89 50 04             	mov    %edx,0x4(%rax)
  803e6d:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803e74:	00 00 00 
  803e77:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803e7a:	89 50 08             	mov    %edx,0x8(%rax)
  803e7d:	bf 07 00 00 00       	mov    $0x7,%edi
  803e82:	48 b8 c4 3b 80 00 00 	movabs $0x803bc4,%rax
  803e89:	00 00 00 
  803e8c:	ff d0                	callq  *%rax
  803e8e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803e91:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803e95:	78 69                	js     803f00 <nsipc_recv+0xc7>
  803e97:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  803e9e:	7f 08                	jg     803ea8 <nsipc_recv+0x6f>
  803ea0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ea3:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  803ea6:	7e 35                	jle    803edd <nsipc_recv+0xa4>
  803ea8:	48 b9 b1 5d 80 00 00 	movabs $0x805db1,%rcx
  803eaf:	00 00 00 
  803eb2:	48 ba c6 5d 80 00 00 	movabs $0x805dc6,%rdx
  803eb9:	00 00 00 
  803ebc:	be 62 00 00 00       	mov    $0x62,%esi
  803ec1:	48 bf db 5d 80 00 00 	movabs $0x805ddb,%rdi
  803ec8:	00 00 00 
  803ecb:	b8 00 00 00 00       	mov    $0x0,%eax
  803ed0:	49 b8 de 0b 80 00 00 	movabs $0x800bde,%r8
  803ed7:	00 00 00 
  803eda:	41 ff d0             	callq  *%r8
  803edd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ee0:	48 63 d0             	movslq %eax,%rdx
  803ee3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803ee7:	48 be 00 c0 80 00 00 	movabs $0x80c000,%rsi
  803eee:	00 00 00 
  803ef1:	48 89 c7             	mov    %rax,%rdi
  803ef4:	48 b8 f0 1c 80 00 00 	movabs $0x801cf0,%rax
  803efb:	00 00 00 
  803efe:	ff d0                	callq  *%rax
  803f00:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f03:	c9                   	leaveq 
  803f04:	c3                   	retq   

0000000000803f05 <nsipc_send>:
  803f05:	55                   	push   %rbp
  803f06:	48 89 e5             	mov    %rsp,%rbp
  803f09:	48 83 ec 20          	sub    $0x20,%rsp
  803f0d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803f10:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803f14:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803f17:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  803f1a:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803f21:	00 00 00 
  803f24:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803f27:	89 10                	mov    %edx,(%rax)
  803f29:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  803f30:	7e 35                	jle    803f67 <nsipc_send+0x62>
  803f32:	48 b9 ea 5d 80 00 00 	movabs $0x805dea,%rcx
  803f39:	00 00 00 
  803f3c:	48 ba c6 5d 80 00 00 	movabs $0x805dc6,%rdx
  803f43:	00 00 00 
  803f46:	be 6d 00 00 00       	mov    $0x6d,%esi
  803f4b:	48 bf db 5d 80 00 00 	movabs $0x805ddb,%rdi
  803f52:	00 00 00 
  803f55:	b8 00 00 00 00       	mov    $0x0,%eax
  803f5a:	49 b8 de 0b 80 00 00 	movabs $0x800bde,%r8
  803f61:	00 00 00 
  803f64:	41 ff d0             	callq  *%r8
  803f67:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803f6a:	48 63 d0             	movslq %eax,%rdx
  803f6d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f71:	48 89 c6             	mov    %rax,%rsi
  803f74:	48 bf 0c c0 80 00 00 	movabs $0x80c00c,%rdi
  803f7b:	00 00 00 
  803f7e:	48 b8 f0 1c 80 00 00 	movabs $0x801cf0,%rax
  803f85:	00 00 00 
  803f88:	ff d0                	callq  *%rax
  803f8a:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803f91:	00 00 00 
  803f94:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803f97:	89 50 04             	mov    %edx,0x4(%rax)
  803f9a:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803fa1:	00 00 00 
  803fa4:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803fa7:	89 50 08             	mov    %edx,0x8(%rax)
  803faa:	bf 08 00 00 00       	mov    $0x8,%edi
  803faf:	48 b8 c4 3b 80 00 00 	movabs $0x803bc4,%rax
  803fb6:	00 00 00 
  803fb9:	ff d0                	callq  *%rax
  803fbb:	c9                   	leaveq 
  803fbc:	c3                   	retq   

0000000000803fbd <nsipc_socket>:
  803fbd:	55                   	push   %rbp
  803fbe:	48 89 e5             	mov    %rsp,%rbp
  803fc1:	48 83 ec 10          	sub    $0x10,%rsp
  803fc5:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803fc8:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803fcb:	89 55 f4             	mov    %edx,-0xc(%rbp)
  803fce:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803fd5:	00 00 00 
  803fd8:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803fdb:	89 10                	mov    %edx,(%rax)
  803fdd:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803fe4:	00 00 00 
  803fe7:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803fea:	89 50 04             	mov    %edx,0x4(%rax)
  803fed:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803ff4:	00 00 00 
  803ff7:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803ffa:	89 50 08             	mov    %edx,0x8(%rax)
  803ffd:	bf 09 00 00 00       	mov    $0x9,%edi
  804002:	48 b8 c4 3b 80 00 00 	movabs $0x803bc4,%rax
  804009:	00 00 00 
  80400c:	ff d0                	callq  *%rax
  80400e:	c9                   	leaveq 
  80400f:	c3                   	retq   

0000000000804010 <isfree>:
  804010:	55                   	push   %rbp
  804011:	48 89 e5             	mov    %rsp,%rbp
  804014:	48 83 ec 20          	sub    $0x20,%rsp
  804018:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80401c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804020:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804024:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804028:	48 01 d0             	add    %rdx,%rax
  80402b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80402f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804033:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804037:	eb 64                	jmp    80409d <isfree+0x8d>
  804039:	48 b8 20 81 80 00 00 	movabs $0x808120,%rax
  804040:	00 00 00 
  804043:	48 8b 00             	mov    (%rax),%rax
  804046:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  80404a:	76 42                	jbe    80408e <isfree+0x7e>
  80404c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804050:	48 c1 e8 15          	shr    $0x15,%rax
  804054:	48 89 c2             	mov    %rax,%rdx
  804057:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  80405e:	01 00 00 
  804061:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804065:	83 e0 01             	and    $0x1,%eax
  804068:	48 85 c0             	test   %rax,%rax
  80406b:	74 28                	je     804095 <isfree+0x85>
  80406d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804071:	48 c1 e8 0c          	shr    $0xc,%rax
  804075:	48 89 c2             	mov    %rax,%rdx
  804078:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80407f:	01 00 00 
  804082:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804086:	83 e0 01             	and    $0x1,%eax
  804089:	48 85 c0             	test   %rax,%rax
  80408c:	74 07                	je     804095 <isfree+0x85>
  80408e:	b8 00 00 00 00       	mov    $0x0,%eax
  804093:	eb 17                	jmp    8040ac <isfree+0x9c>
  804095:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
  80409c:	00 
  80409d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8040a1:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8040a5:	72 92                	jb     804039 <isfree+0x29>
  8040a7:	b8 01 00 00 00       	mov    $0x1,%eax
  8040ac:	c9                   	leaveq 
  8040ad:	c3                   	retq   

00000000008040ae <malloc>:
  8040ae:	55                   	push   %rbp
  8040af:	48 89 e5             	mov    %rsp,%rbp
  8040b2:	48 83 ec 60          	sub    $0x60,%rsp
  8040b6:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  8040ba:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  8040c1:	00 00 00 
  8040c4:	48 8b 00             	mov    (%rax),%rax
  8040c7:	48 85 c0             	test   %rax,%rax
  8040ca:	75 1a                	jne    8040e6 <malloc+0x38>
  8040cc:	48 b8 18 81 80 00 00 	movabs $0x808118,%rax
  8040d3:	00 00 00 
  8040d6:	48 8b 10             	mov    (%rax),%rdx
  8040d9:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  8040e0:	00 00 00 
  8040e3:	48 89 10             	mov    %rdx,(%rax)
  8040e6:	48 c7 45 f0 04 00 00 	movq   $0x4,-0x10(%rbp)
  8040ed:	00 
  8040ee:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8040f2:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
  8040f6:	48 01 d0             	add    %rdx,%rax
  8040f9:	48 83 e8 01          	sub    $0x1,%rax
  8040fd:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804101:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804105:	ba 00 00 00 00       	mov    $0x0,%edx
  80410a:	48 f7 75 f0          	divq   -0x10(%rbp)
  80410e:	48 89 d0             	mov    %rdx,%rax
  804111:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804115:	48 29 c2             	sub    %rax,%rdx
  804118:	48 89 d0             	mov    %rdx,%rax
  80411b:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
  80411f:	48 81 7d a8 ff ff 0f 	cmpq   $0xfffff,-0x58(%rbp)
  804126:	00 
  804127:	76 0a                	jbe    804133 <malloc+0x85>
  804129:	b8 00 00 00 00       	mov    $0x0,%eax
  80412e:	e9 f7 02 00 00       	jmpq   80442a <malloc+0x37c>
  804133:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  80413a:	00 00 00 
  80413d:	48 8b 00             	mov    (%rax),%rax
  804140:	25 ff 0f 00 00       	and    $0xfff,%eax
  804145:	48 85 c0             	test   %rax,%rax
  804148:	0f 84 15 01 00 00    	je     804263 <malloc+0x1b5>
  80414e:	48 c7 45 e0 00 10 00 	movq   $0x1000,-0x20(%rbp)
  804155:	00 
  804156:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  80415d:	00 00 00 
  804160:	48 8b 00             	mov    (%rax),%rax
  804163:	48 89 c2             	mov    %rax,%rdx
  804166:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80416a:	48 01 d0             	add    %rdx,%rax
  80416d:	48 83 e8 01          	sub    $0x1,%rax
  804171:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  804175:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804179:	ba 00 00 00 00       	mov    $0x0,%edx
  80417e:	48 f7 75 e0          	divq   -0x20(%rbp)
  804182:	48 89 d0             	mov    %rdx,%rax
  804185:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  804189:	48 29 c2             	sub    %rax,%rdx
  80418c:	48 89 d0             	mov    %rdx,%rax
  80418f:	48 83 e8 04          	sub    $0x4,%rax
  804193:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  804197:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  80419e:	00 00 00 
  8041a1:	48 8b 00             	mov    (%rax),%rax
  8041a4:	48 c1 e8 0c          	shr    $0xc,%rax
  8041a8:	48 89 c1             	mov    %rax,%rcx
  8041ab:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  8041b2:	00 00 00 
  8041b5:	48 8b 00             	mov    (%rax),%rax
  8041b8:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
  8041bc:	48 83 c2 03          	add    $0x3,%rdx
  8041c0:	48 01 d0             	add    %rdx,%rax
  8041c3:	48 c1 e8 0c          	shr    $0xc,%rax
  8041c7:	48 39 c1             	cmp    %rax,%rcx
  8041ca:	75 4a                	jne    804216 <malloc+0x168>
  8041cc:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8041d0:	8b 00                	mov    (%rax),%eax
  8041d2:	8d 50 01             	lea    0x1(%rax),%edx
  8041d5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8041d9:	89 10                	mov    %edx,(%rax)
  8041db:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  8041e2:	00 00 00 
  8041e5:	48 8b 00             	mov    (%rax),%rax
  8041e8:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  8041ec:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  8041f3:	00 00 00 
  8041f6:	48 8b 10             	mov    (%rax),%rdx
  8041f9:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8041fd:	48 01 c2             	add    %rax,%rdx
  804200:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  804207:	00 00 00 
  80420a:	48 89 10             	mov    %rdx,(%rax)
  80420d:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  804211:	e9 14 02 00 00       	jmpq   80442a <malloc+0x37c>
  804216:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  80421d:	00 00 00 
  804220:	48 8b 00             	mov    (%rax),%rax
  804223:	48 89 c7             	mov    %rax,%rdi
  804226:	48 b8 2c 44 80 00 00 	movabs $0x80442c,%rax
  80422d:	00 00 00 
  804230:	ff d0                	callq  *%rax
  804232:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  804239:	00 00 00 
  80423c:	48 8b 00             	mov    (%rax),%rax
  80423f:	48 05 00 10 00 00    	add    $0x1000,%rax
  804245:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  804249:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  80424d:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  804253:	48 89 c2             	mov    %rax,%rdx
  804256:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  80425d:	00 00 00 
  804260:	48 89 10             	mov    %rdx,(%rax)
  804263:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
  80426a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80426e:	48 8d 50 04          	lea    0x4(%rax),%rdx
  804272:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  804279:	00 00 00 
  80427c:	48 8b 00             	mov    (%rax),%rax
  80427f:	48 89 d6             	mov    %rdx,%rsi
  804282:	48 89 c7             	mov    %rax,%rdi
  804285:	48 b8 10 40 80 00 00 	movabs $0x804010,%rax
  80428c:	00 00 00 
  80428f:	ff d0                	callq  *%rax
  804291:	85 c0                	test   %eax,%eax
  804293:	74 0d                	je     8042a2 <malloc+0x1f4>
  804295:	90                   	nop
  804296:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80429d:	e9 14 01 00 00       	jmpq   8043b6 <malloc+0x308>
  8042a2:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  8042a9:	00 00 00 
  8042ac:	48 8b 00             	mov    (%rax),%rax
  8042af:	48 8d 90 00 10 00 00 	lea    0x1000(%rax),%rdx
  8042b6:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  8042bd:	00 00 00 
  8042c0:	48 89 10             	mov    %rdx,(%rax)
  8042c3:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  8042ca:	00 00 00 
  8042cd:	48 8b 10             	mov    (%rax),%rdx
  8042d0:	48 b8 20 81 80 00 00 	movabs $0x808120,%rax
  8042d7:	00 00 00 
  8042da:	48 8b 00             	mov    (%rax),%rax
  8042dd:	48 39 c2             	cmp    %rax,%rdx
  8042e0:	75 2e                	jne    804310 <malloc+0x262>
  8042e2:	48 b8 18 81 80 00 00 	movabs $0x808118,%rax
  8042e9:	00 00 00 
  8042ec:	48 8b 10             	mov    (%rax),%rdx
  8042ef:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  8042f6:	00 00 00 
  8042f9:	48 89 10             	mov    %rdx,(%rax)
  8042fc:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
  804300:	83 7d f8 02          	cmpl   $0x2,-0x8(%rbp)
  804304:	75 0a                	jne    804310 <malloc+0x262>
  804306:	b8 00 00 00 00       	mov    $0x0,%eax
  80430b:	e9 1a 01 00 00       	jmpq   80442a <malloc+0x37c>
  804310:	e9 55 ff ff ff       	jmpq   80426a <malloc+0x1bc>
  804315:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804318:	05 00 10 00 00       	add    $0x1000,%eax
  80431d:	48 98                	cltq   
  80431f:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
  804323:	48 83 c2 04          	add    $0x4,%rdx
  804327:	48 39 d0             	cmp    %rdx,%rax
  80432a:	73 07                	jae    804333 <malloc+0x285>
  80432c:	b8 00 04 00 00       	mov    $0x400,%eax
  804331:	eb 05                	jmp    804338 <malloc+0x28a>
  804333:	b8 00 00 00 00       	mov    $0x0,%eax
  804338:	89 45 bc             	mov    %eax,-0x44(%rbp)
  80433b:	8b 45 bc             	mov    -0x44(%rbp),%eax
  80433e:	83 c8 07             	or     $0x7,%eax
  804341:	89 c2                	mov    %eax,%edx
  804343:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  80434a:	00 00 00 
  80434d:	48 8b 08             	mov    (%rax),%rcx
  804350:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804353:	48 98                	cltq   
  804355:	48 01 c8             	add    %rcx,%rax
  804358:	48 89 c6             	mov    %rax,%rsi
  80435b:	bf 00 00 00 00       	mov    $0x0,%edi
  804360:	48 b8 fb 22 80 00 00 	movabs $0x8022fb,%rax
  804367:	00 00 00 
  80436a:	ff d0                	callq  *%rax
  80436c:	85 c0                	test   %eax,%eax
  80436e:	79 3f                	jns    8043af <malloc+0x301>
  804370:	eb 30                	jmp    8043a2 <malloc+0x2f4>
  804372:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  804379:	00 00 00 
  80437c:	48 8b 10             	mov    (%rax),%rdx
  80437f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804382:	48 98                	cltq   
  804384:	48 01 d0             	add    %rdx,%rax
  804387:	48 89 c6             	mov    %rax,%rsi
  80438a:	bf 00 00 00 00       	mov    $0x0,%edi
  80438f:	48 b8 a6 23 80 00 00 	movabs $0x8023a6,%rax
  804396:	00 00 00 
  804399:	ff d0                	callq  *%rax
  80439b:	81 6d fc 00 10 00 00 	subl   $0x1000,-0x4(%rbp)
  8043a2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8043a6:	79 ca                	jns    804372 <malloc+0x2c4>
  8043a8:	b8 00 00 00 00       	mov    $0x0,%eax
  8043ad:	eb 7b                	jmp    80442a <malloc+0x37c>
  8043af:	81 45 fc 00 10 00 00 	addl   $0x1000,-0x4(%rbp)
  8043b6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8043b9:	48 98                	cltq   
  8043bb:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
  8043bf:	48 83 c2 04          	add    $0x4,%rdx
  8043c3:	48 39 d0             	cmp    %rdx,%rax
  8043c6:	0f 82 49 ff ff ff    	jb     804315 <malloc+0x267>
  8043cc:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  8043d3:	00 00 00 
  8043d6:	48 8b 00             	mov    (%rax),%rax
  8043d9:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8043dc:	48 63 d2             	movslq %edx,%rdx
  8043df:	48 83 ea 04          	sub    $0x4,%rdx
  8043e3:	48 01 d0             	add    %rdx,%rax
  8043e6:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  8043ea:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8043ee:	c7 00 02 00 00 00    	movl   $0x2,(%rax)
  8043f4:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  8043fb:	00 00 00 
  8043fe:	48 8b 00             	mov    (%rax),%rax
  804401:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  804405:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  80440c:	00 00 00 
  80440f:	48 8b 10             	mov    (%rax),%rdx
  804412:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  804416:	48 01 c2             	add    %rax,%rdx
  804419:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  804420:	00 00 00 
  804423:	48 89 10             	mov    %rdx,(%rax)
  804426:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80442a:	c9                   	leaveq 
  80442b:	c3                   	retq   

000000000080442c <free>:
  80442c:	55                   	push   %rbp
  80442d:	48 89 e5             	mov    %rsp,%rbp
  804430:	48 83 ec 30          	sub    $0x30,%rsp
  804434:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804438:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80443d:	75 05                	jne    804444 <free+0x18>
  80443f:	e9 54 01 00 00       	jmpq   804598 <free+0x16c>
  804444:	48 b8 18 81 80 00 00 	movabs $0x808118,%rax
  80444b:	00 00 00 
  80444e:	48 8b 00             	mov    (%rax),%rax
  804451:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  804455:	77 13                	ja     80446a <free+0x3e>
  804457:	48 b8 20 81 80 00 00 	movabs $0x808120,%rax
  80445e:	00 00 00 
  804461:	48 8b 00             	mov    (%rax),%rax
  804464:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  804468:	72 35                	jb     80449f <free+0x73>
  80446a:	48 b9 f8 5d 80 00 00 	movabs $0x805df8,%rcx
  804471:	00 00 00 
  804474:	48 ba 26 5e 80 00 00 	movabs $0x805e26,%rdx
  80447b:	00 00 00 
  80447e:	be 7b 00 00 00       	mov    $0x7b,%esi
  804483:	48 bf 3b 5e 80 00 00 	movabs $0x805e3b,%rdi
  80448a:	00 00 00 
  80448d:	b8 00 00 00 00       	mov    $0x0,%eax
  804492:	49 b8 de 0b 80 00 00 	movabs $0x800bde,%r8
  804499:	00 00 00 
  80449c:	41 ff d0             	callq  *%r8
  80449f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8044a3:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8044a7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8044ab:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  8044b1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8044b5:	eb 7b                	jmp    804532 <free+0x106>
  8044b7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8044bb:	48 89 c6             	mov    %rax,%rsi
  8044be:	bf 00 00 00 00       	mov    $0x0,%edi
  8044c3:	48 b8 a6 23 80 00 00 	movabs $0x8023a6,%rax
  8044ca:	00 00 00 
  8044cd:	ff d0                	callq  *%rax
  8044cf:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
  8044d6:	00 
  8044d7:	48 b8 18 81 80 00 00 	movabs $0x808118,%rax
  8044de:	00 00 00 
  8044e1:	48 8b 00             	mov    (%rax),%rax
  8044e4:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  8044e8:	77 13                	ja     8044fd <free+0xd1>
  8044ea:	48 b8 20 81 80 00 00 	movabs $0x808120,%rax
  8044f1:	00 00 00 
  8044f4:	48 8b 00             	mov    (%rax),%rax
  8044f7:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  8044fb:	72 35                	jb     804532 <free+0x106>
  8044fd:	48 b9 4b 5e 80 00 00 	movabs $0x805e4b,%rcx
  804504:	00 00 00 
  804507:	48 ba 26 5e 80 00 00 	movabs $0x805e26,%rdx
  80450e:	00 00 00 
  804511:	be 82 00 00 00       	mov    $0x82,%esi
  804516:	48 bf 3b 5e 80 00 00 	movabs $0x805e3b,%rdi
  80451d:	00 00 00 
  804520:	b8 00 00 00 00       	mov    $0x0,%eax
  804525:	49 b8 de 0b 80 00 00 	movabs $0x800bde,%r8
  80452c:	00 00 00 
  80452f:	41 ff d0             	callq  *%r8
  804532:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804536:	48 c1 e8 0c          	shr    $0xc,%rax
  80453a:	48 89 c2             	mov    %rax,%rdx
  80453d:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  804544:	01 00 00 
  804547:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80454b:	25 00 04 00 00       	and    $0x400,%eax
  804550:	48 85 c0             	test   %rax,%rax
  804553:	0f 85 5e ff ff ff    	jne    8044b7 <free+0x8b>
  804559:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80455d:	48 05 fc 0f 00 00    	add    $0xffc,%rax
  804563:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804567:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80456b:	8b 00                	mov    (%rax),%eax
  80456d:	8d 50 ff             	lea    -0x1(%rax),%edx
  804570:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804574:	89 10                	mov    %edx,(%rax)
  804576:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80457a:	8b 00                	mov    (%rax),%eax
  80457c:	85 c0                	test   %eax,%eax
  80457e:	75 18                	jne    804598 <free+0x16c>
  804580:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804584:	48 89 c6             	mov    %rax,%rsi
  804587:	bf 00 00 00 00       	mov    $0x0,%edi
  80458c:	48 b8 a6 23 80 00 00 	movabs $0x8023a6,%rax
  804593:	00 00 00 
  804596:	ff d0                	callq  *%rax
  804598:	c9                   	leaveq 
  804599:	c3                   	retq   

000000000080459a <pipe>:
  80459a:	55                   	push   %rbp
  80459b:	48 89 e5             	mov    %rsp,%rbp
  80459e:	53                   	push   %rbx
  80459f:	48 83 ec 38          	sub    $0x38,%rsp
  8045a3:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  8045a7:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  8045ab:	48 89 c7             	mov    %rax,%rdi
  8045ae:	48 b8 27 28 80 00 00 	movabs $0x802827,%rax
  8045b5:	00 00 00 
  8045b8:	ff d0                	callq  *%rax
  8045ba:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8045bd:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8045c1:	0f 88 bf 01 00 00    	js     804786 <pipe+0x1ec>
  8045c7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8045cb:	ba 07 04 00 00       	mov    $0x407,%edx
  8045d0:	48 89 c6             	mov    %rax,%rsi
  8045d3:	bf 00 00 00 00       	mov    $0x0,%edi
  8045d8:	48 b8 fb 22 80 00 00 	movabs $0x8022fb,%rax
  8045df:	00 00 00 
  8045e2:	ff d0                	callq  *%rax
  8045e4:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8045e7:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8045eb:	0f 88 95 01 00 00    	js     804786 <pipe+0x1ec>
  8045f1:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  8045f5:	48 89 c7             	mov    %rax,%rdi
  8045f8:	48 b8 27 28 80 00 00 	movabs $0x802827,%rax
  8045ff:	00 00 00 
  804602:	ff d0                	callq  *%rax
  804604:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804607:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80460b:	0f 88 5d 01 00 00    	js     80476e <pipe+0x1d4>
  804611:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804615:	ba 07 04 00 00       	mov    $0x407,%edx
  80461a:	48 89 c6             	mov    %rax,%rsi
  80461d:	bf 00 00 00 00       	mov    $0x0,%edi
  804622:	48 b8 fb 22 80 00 00 	movabs $0x8022fb,%rax
  804629:	00 00 00 
  80462c:	ff d0                	callq  *%rax
  80462e:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804631:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804635:	0f 88 33 01 00 00    	js     80476e <pipe+0x1d4>
  80463b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80463f:	48 89 c7             	mov    %rax,%rdi
  804642:	48 b8 fc 27 80 00 00 	movabs $0x8027fc,%rax
  804649:	00 00 00 
  80464c:	ff d0                	callq  *%rax
  80464e:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804652:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804656:	ba 07 04 00 00       	mov    $0x407,%edx
  80465b:	48 89 c6             	mov    %rax,%rsi
  80465e:	bf 00 00 00 00       	mov    $0x0,%edi
  804663:	48 b8 fb 22 80 00 00 	movabs $0x8022fb,%rax
  80466a:	00 00 00 
  80466d:	ff d0                	callq  *%rax
  80466f:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804672:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804676:	79 05                	jns    80467d <pipe+0xe3>
  804678:	e9 d9 00 00 00       	jmpq   804756 <pipe+0x1bc>
  80467d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804681:	48 89 c7             	mov    %rax,%rdi
  804684:	48 b8 fc 27 80 00 00 	movabs $0x8027fc,%rax
  80468b:	00 00 00 
  80468e:	ff d0                	callq  *%rax
  804690:	48 89 c2             	mov    %rax,%rdx
  804693:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804697:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  80469d:	48 89 d1             	mov    %rdx,%rcx
  8046a0:	ba 00 00 00 00       	mov    $0x0,%edx
  8046a5:	48 89 c6             	mov    %rax,%rsi
  8046a8:	bf 00 00 00 00       	mov    $0x0,%edi
  8046ad:	48 b8 4b 23 80 00 00 	movabs $0x80234b,%rax
  8046b4:	00 00 00 
  8046b7:	ff d0                	callq  *%rax
  8046b9:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8046bc:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8046c0:	79 1b                	jns    8046dd <pipe+0x143>
  8046c2:	90                   	nop
  8046c3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8046c7:	48 89 c6             	mov    %rax,%rsi
  8046ca:	bf 00 00 00 00       	mov    $0x0,%edi
  8046cf:	48 b8 a6 23 80 00 00 	movabs $0x8023a6,%rax
  8046d6:	00 00 00 
  8046d9:	ff d0                	callq  *%rax
  8046db:	eb 79                	jmp    804756 <pipe+0x1bc>
  8046dd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8046e1:	48 ba 40 81 80 00 00 	movabs $0x808140,%rdx
  8046e8:	00 00 00 
  8046eb:	8b 12                	mov    (%rdx),%edx
  8046ed:	89 10                	mov    %edx,(%rax)
  8046ef:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8046f3:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  8046fa:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8046fe:	48 ba 40 81 80 00 00 	movabs $0x808140,%rdx
  804705:	00 00 00 
  804708:	8b 12                	mov    (%rdx),%edx
  80470a:	89 10                	mov    %edx,(%rax)
  80470c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804710:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  804717:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80471b:	48 89 c7             	mov    %rax,%rdi
  80471e:	48 b8 d9 27 80 00 00 	movabs $0x8027d9,%rax
  804725:	00 00 00 
  804728:	ff d0                	callq  *%rax
  80472a:	89 c2                	mov    %eax,%edx
  80472c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  804730:	89 10                	mov    %edx,(%rax)
  804732:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  804736:	48 8d 58 04          	lea    0x4(%rax),%rbx
  80473a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80473e:	48 89 c7             	mov    %rax,%rdi
  804741:	48 b8 d9 27 80 00 00 	movabs $0x8027d9,%rax
  804748:	00 00 00 
  80474b:	ff d0                	callq  *%rax
  80474d:	89 03                	mov    %eax,(%rbx)
  80474f:	b8 00 00 00 00       	mov    $0x0,%eax
  804754:	eb 33                	jmp    804789 <pipe+0x1ef>
  804756:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80475a:	48 89 c6             	mov    %rax,%rsi
  80475d:	bf 00 00 00 00       	mov    $0x0,%edi
  804762:	48 b8 a6 23 80 00 00 	movabs $0x8023a6,%rax
  804769:	00 00 00 
  80476c:	ff d0                	callq  *%rax
  80476e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804772:	48 89 c6             	mov    %rax,%rsi
  804775:	bf 00 00 00 00       	mov    $0x0,%edi
  80477a:	48 b8 a6 23 80 00 00 	movabs $0x8023a6,%rax
  804781:	00 00 00 
  804784:	ff d0                	callq  *%rax
  804786:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804789:	48 83 c4 38          	add    $0x38,%rsp
  80478d:	5b                   	pop    %rbx
  80478e:	5d                   	pop    %rbp
  80478f:	c3                   	retq   

0000000000804790 <_pipeisclosed>:
  804790:	55                   	push   %rbp
  804791:	48 89 e5             	mov    %rsp,%rbp
  804794:	53                   	push   %rbx
  804795:	48 83 ec 28          	sub    $0x28,%rsp
  804799:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80479d:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8047a1:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  8047a8:	00 00 00 
  8047ab:	48 8b 00             	mov    (%rax),%rax
  8047ae:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8047b4:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8047b7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8047bb:	48 89 c7             	mov    %rax,%rdi
  8047be:	48 b8 df 4f 80 00 00 	movabs $0x804fdf,%rax
  8047c5:	00 00 00 
  8047c8:	ff d0                	callq  *%rax
  8047ca:	89 c3                	mov    %eax,%ebx
  8047cc:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8047d0:	48 89 c7             	mov    %rax,%rdi
  8047d3:	48 b8 df 4f 80 00 00 	movabs $0x804fdf,%rax
  8047da:	00 00 00 
  8047dd:	ff d0                	callq  *%rax
  8047df:	39 c3                	cmp    %eax,%ebx
  8047e1:	0f 94 c0             	sete   %al
  8047e4:	0f b6 c0             	movzbl %al,%eax
  8047e7:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8047ea:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  8047f1:	00 00 00 
  8047f4:	48 8b 00             	mov    (%rax),%rax
  8047f7:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8047fd:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  804800:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804803:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  804806:	75 05                	jne    80480d <_pipeisclosed+0x7d>
  804808:	8b 45 e8             	mov    -0x18(%rbp),%eax
  80480b:	eb 4f                	jmp    80485c <_pipeisclosed+0xcc>
  80480d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804810:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  804813:	74 42                	je     804857 <_pipeisclosed+0xc7>
  804815:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  804819:	75 3c                	jne    804857 <_pipeisclosed+0xc7>
  80481b:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  804822:	00 00 00 
  804825:	48 8b 00             	mov    (%rax),%rax
  804828:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  80482e:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  804831:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804834:	89 c6                	mov    %eax,%esi
  804836:	48 bf 68 5e 80 00 00 	movabs $0x805e68,%rdi
  80483d:	00 00 00 
  804840:	b8 00 00 00 00       	mov    $0x0,%eax
  804845:	49 b8 17 0e 80 00 00 	movabs $0x800e17,%r8
  80484c:	00 00 00 
  80484f:	41 ff d0             	callq  *%r8
  804852:	e9 4a ff ff ff       	jmpq   8047a1 <_pipeisclosed+0x11>
  804857:	e9 45 ff ff ff       	jmpq   8047a1 <_pipeisclosed+0x11>
  80485c:	48 83 c4 28          	add    $0x28,%rsp
  804860:	5b                   	pop    %rbx
  804861:	5d                   	pop    %rbp
  804862:	c3                   	retq   

0000000000804863 <pipeisclosed>:
  804863:	55                   	push   %rbp
  804864:	48 89 e5             	mov    %rsp,%rbp
  804867:	48 83 ec 30          	sub    $0x30,%rsp
  80486b:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80486e:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  804872:	8b 45 dc             	mov    -0x24(%rbp),%eax
  804875:	48 89 d6             	mov    %rdx,%rsi
  804878:	89 c7                	mov    %eax,%edi
  80487a:	48 b8 bf 28 80 00 00 	movabs $0x8028bf,%rax
  804881:	00 00 00 
  804884:	ff d0                	callq  *%rax
  804886:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804889:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80488d:	79 05                	jns    804894 <pipeisclosed+0x31>
  80488f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804892:	eb 31                	jmp    8048c5 <pipeisclosed+0x62>
  804894:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804898:	48 89 c7             	mov    %rax,%rdi
  80489b:	48 b8 fc 27 80 00 00 	movabs $0x8027fc,%rax
  8048a2:	00 00 00 
  8048a5:	ff d0                	callq  *%rax
  8048a7:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8048ab:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8048af:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8048b3:	48 89 d6             	mov    %rdx,%rsi
  8048b6:	48 89 c7             	mov    %rax,%rdi
  8048b9:	48 b8 90 47 80 00 00 	movabs $0x804790,%rax
  8048c0:	00 00 00 
  8048c3:	ff d0                	callq  *%rax
  8048c5:	c9                   	leaveq 
  8048c6:	c3                   	retq   

00000000008048c7 <devpipe_read>:
  8048c7:	55                   	push   %rbp
  8048c8:	48 89 e5             	mov    %rsp,%rbp
  8048cb:	48 83 ec 40          	sub    $0x40,%rsp
  8048cf:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8048d3:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8048d7:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8048db:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8048df:	48 89 c7             	mov    %rax,%rdi
  8048e2:	48 b8 fc 27 80 00 00 	movabs $0x8027fc,%rax
  8048e9:	00 00 00 
  8048ec:	ff d0                	callq  *%rax
  8048ee:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8048f2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8048f6:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8048fa:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804901:	00 
  804902:	e9 92 00 00 00       	jmpq   804999 <devpipe_read+0xd2>
  804907:	eb 41                	jmp    80494a <devpipe_read+0x83>
  804909:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  80490e:	74 09                	je     804919 <devpipe_read+0x52>
  804910:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804914:	e9 92 00 00 00       	jmpq   8049ab <devpipe_read+0xe4>
  804919:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80491d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804921:	48 89 d6             	mov    %rdx,%rsi
  804924:	48 89 c7             	mov    %rax,%rdi
  804927:	48 b8 90 47 80 00 00 	movabs $0x804790,%rax
  80492e:	00 00 00 
  804931:	ff d0                	callq  *%rax
  804933:	85 c0                	test   %eax,%eax
  804935:	74 07                	je     80493e <devpipe_read+0x77>
  804937:	b8 00 00 00 00       	mov    $0x0,%eax
  80493c:	eb 6d                	jmp    8049ab <devpipe_read+0xe4>
  80493e:	48 b8 bd 22 80 00 00 	movabs $0x8022bd,%rax
  804945:	00 00 00 
  804948:	ff d0                	callq  *%rax
  80494a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80494e:	8b 10                	mov    (%rax),%edx
  804950:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804954:	8b 40 04             	mov    0x4(%rax),%eax
  804957:	39 c2                	cmp    %eax,%edx
  804959:	74 ae                	je     804909 <devpipe_read+0x42>
  80495b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80495f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804963:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  804967:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80496b:	8b 00                	mov    (%rax),%eax
  80496d:	99                   	cltd   
  80496e:	c1 ea 1b             	shr    $0x1b,%edx
  804971:	01 d0                	add    %edx,%eax
  804973:	83 e0 1f             	and    $0x1f,%eax
  804976:	29 d0                	sub    %edx,%eax
  804978:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80497c:	48 98                	cltq   
  80497e:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  804983:	88 01                	mov    %al,(%rcx)
  804985:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804989:	8b 00                	mov    (%rax),%eax
  80498b:	8d 50 01             	lea    0x1(%rax),%edx
  80498e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804992:	89 10                	mov    %edx,(%rax)
  804994:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  804999:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80499d:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8049a1:	0f 82 60 ff ff ff    	jb     804907 <devpipe_read+0x40>
  8049a7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8049ab:	c9                   	leaveq 
  8049ac:	c3                   	retq   

00000000008049ad <devpipe_write>:
  8049ad:	55                   	push   %rbp
  8049ae:	48 89 e5             	mov    %rsp,%rbp
  8049b1:	48 83 ec 40          	sub    $0x40,%rsp
  8049b5:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8049b9:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8049bd:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8049c1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8049c5:	48 89 c7             	mov    %rax,%rdi
  8049c8:	48 b8 fc 27 80 00 00 	movabs $0x8027fc,%rax
  8049cf:	00 00 00 
  8049d2:	ff d0                	callq  *%rax
  8049d4:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8049d8:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8049dc:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8049e0:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8049e7:	00 
  8049e8:	e9 8e 00 00 00       	jmpq   804a7b <devpipe_write+0xce>
  8049ed:	eb 31                	jmp    804a20 <devpipe_write+0x73>
  8049ef:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8049f3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8049f7:	48 89 d6             	mov    %rdx,%rsi
  8049fa:	48 89 c7             	mov    %rax,%rdi
  8049fd:	48 b8 90 47 80 00 00 	movabs $0x804790,%rax
  804a04:	00 00 00 
  804a07:	ff d0                	callq  *%rax
  804a09:	85 c0                	test   %eax,%eax
  804a0b:	74 07                	je     804a14 <devpipe_write+0x67>
  804a0d:	b8 00 00 00 00       	mov    $0x0,%eax
  804a12:	eb 79                	jmp    804a8d <devpipe_write+0xe0>
  804a14:	48 b8 bd 22 80 00 00 	movabs $0x8022bd,%rax
  804a1b:	00 00 00 
  804a1e:	ff d0                	callq  *%rax
  804a20:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804a24:	8b 40 04             	mov    0x4(%rax),%eax
  804a27:	48 63 d0             	movslq %eax,%rdx
  804a2a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804a2e:	8b 00                	mov    (%rax),%eax
  804a30:	48 98                	cltq   
  804a32:	48 83 c0 20          	add    $0x20,%rax
  804a36:	48 39 c2             	cmp    %rax,%rdx
  804a39:	73 b4                	jae    8049ef <devpipe_write+0x42>
  804a3b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804a3f:	8b 40 04             	mov    0x4(%rax),%eax
  804a42:	99                   	cltd   
  804a43:	c1 ea 1b             	shr    $0x1b,%edx
  804a46:	01 d0                	add    %edx,%eax
  804a48:	83 e0 1f             	and    $0x1f,%eax
  804a4b:	29 d0                	sub    %edx,%eax
  804a4d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  804a51:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  804a55:	48 01 ca             	add    %rcx,%rdx
  804a58:	0f b6 0a             	movzbl (%rdx),%ecx
  804a5b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804a5f:	48 98                	cltq   
  804a61:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  804a65:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804a69:	8b 40 04             	mov    0x4(%rax),%eax
  804a6c:	8d 50 01             	lea    0x1(%rax),%edx
  804a6f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804a73:	89 50 04             	mov    %edx,0x4(%rax)
  804a76:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  804a7b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804a7f:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  804a83:	0f 82 64 ff ff ff    	jb     8049ed <devpipe_write+0x40>
  804a89:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804a8d:	c9                   	leaveq 
  804a8e:	c3                   	retq   

0000000000804a8f <devpipe_stat>:
  804a8f:	55                   	push   %rbp
  804a90:	48 89 e5             	mov    %rsp,%rbp
  804a93:	48 83 ec 20          	sub    $0x20,%rsp
  804a97:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804a9b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804a9f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804aa3:	48 89 c7             	mov    %rax,%rdi
  804aa6:	48 b8 fc 27 80 00 00 	movabs $0x8027fc,%rax
  804aad:	00 00 00 
  804ab0:	ff d0                	callq  *%rax
  804ab2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804ab6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804aba:	48 be 7b 5e 80 00 00 	movabs $0x805e7b,%rsi
  804ac1:	00 00 00 
  804ac4:	48 89 c7             	mov    %rax,%rdi
  804ac7:	48 b8 cc 19 80 00 00 	movabs $0x8019cc,%rax
  804ace:	00 00 00 
  804ad1:	ff d0                	callq  *%rax
  804ad3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804ad7:	8b 50 04             	mov    0x4(%rax),%edx
  804ada:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804ade:	8b 00                	mov    (%rax),%eax
  804ae0:	29 c2                	sub    %eax,%edx
  804ae2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804ae6:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  804aec:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804af0:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  804af7:	00 00 00 
  804afa:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804afe:	48 b9 40 81 80 00 00 	movabs $0x808140,%rcx
  804b05:	00 00 00 
  804b08:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  804b0f:	b8 00 00 00 00       	mov    $0x0,%eax
  804b14:	c9                   	leaveq 
  804b15:	c3                   	retq   

0000000000804b16 <devpipe_close>:
  804b16:	55                   	push   %rbp
  804b17:	48 89 e5             	mov    %rsp,%rbp
  804b1a:	48 83 ec 10          	sub    $0x10,%rsp
  804b1e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804b22:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804b26:	48 89 c6             	mov    %rax,%rsi
  804b29:	bf 00 00 00 00       	mov    $0x0,%edi
  804b2e:	48 b8 a6 23 80 00 00 	movabs $0x8023a6,%rax
  804b35:	00 00 00 
  804b38:	ff d0                	callq  *%rax
  804b3a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804b3e:	48 89 c7             	mov    %rax,%rdi
  804b41:	48 b8 fc 27 80 00 00 	movabs $0x8027fc,%rax
  804b48:	00 00 00 
  804b4b:	ff d0                	callq  *%rax
  804b4d:	48 89 c6             	mov    %rax,%rsi
  804b50:	bf 00 00 00 00       	mov    $0x0,%edi
  804b55:	48 b8 a6 23 80 00 00 	movabs $0x8023a6,%rax
  804b5c:	00 00 00 
  804b5f:	ff d0                	callq  *%rax
  804b61:	c9                   	leaveq 
  804b62:	c3                   	retq   

0000000000804b63 <cputchar>:
  804b63:	55                   	push   %rbp
  804b64:	48 89 e5             	mov    %rsp,%rbp
  804b67:	48 83 ec 20          	sub    $0x20,%rsp
  804b6b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804b6e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804b71:	88 45 ff             	mov    %al,-0x1(%rbp)
  804b74:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  804b78:	be 01 00 00 00       	mov    $0x1,%esi
  804b7d:	48 89 c7             	mov    %rax,%rdi
  804b80:	48 b8 b3 21 80 00 00 	movabs $0x8021b3,%rax
  804b87:	00 00 00 
  804b8a:	ff d0                	callq  *%rax
  804b8c:	c9                   	leaveq 
  804b8d:	c3                   	retq   

0000000000804b8e <getchar>:
  804b8e:	55                   	push   %rbp
  804b8f:	48 89 e5             	mov    %rsp,%rbp
  804b92:	48 83 ec 10          	sub    $0x10,%rsp
  804b96:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  804b9a:	ba 01 00 00 00       	mov    $0x1,%edx
  804b9f:	48 89 c6             	mov    %rax,%rsi
  804ba2:	bf 00 00 00 00       	mov    $0x0,%edi
  804ba7:	48 b8 f1 2c 80 00 00 	movabs $0x802cf1,%rax
  804bae:	00 00 00 
  804bb1:	ff d0                	callq  *%rax
  804bb3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804bb6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804bba:	79 05                	jns    804bc1 <getchar+0x33>
  804bbc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804bbf:	eb 14                	jmp    804bd5 <getchar+0x47>
  804bc1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804bc5:	7f 07                	jg     804bce <getchar+0x40>
  804bc7:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  804bcc:	eb 07                	jmp    804bd5 <getchar+0x47>
  804bce:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  804bd2:	0f b6 c0             	movzbl %al,%eax
  804bd5:	c9                   	leaveq 
  804bd6:	c3                   	retq   

0000000000804bd7 <iscons>:
  804bd7:	55                   	push   %rbp
  804bd8:	48 89 e5             	mov    %rsp,%rbp
  804bdb:	48 83 ec 20          	sub    $0x20,%rsp
  804bdf:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804be2:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  804be6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804be9:	48 89 d6             	mov    %rdx,%rsi
  804bec:	89 c7                	mov    %eax,%edi
  804bee:	48 b8 bf 28 80 00 00 	movabs $0x8028bf,%rax
  804bf5:	00 00 00 
  804bf8:	ff d0                	callq  *%rax
  804bfa:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804bfd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804c01:	79 05                	jns    804c08 <iscons+0x31>
  804c03:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804c06:	eb 1a                	jmp    804c22 <iscons+0x4b>
  804c08:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804c0c:	8b 10                	mov    (%rax),%edx
  804c0e:	48 b8 80 81 80 00 00 	movabs $0x808180,%rax
  804c15:	00 00 00 
  804c18:	8b 00                	mov    (%rax),%eax
  804c1a:	39 c2                	cmp    %eax,%edx
  804c1c:	0f 94 c0             	sete   %al
  804c1f:	0f b6 c0             	movzbl %al,%eax
  804c22:	c9                   	leaveq 
  804c23:	c3                   	retq   

0000000000804c24 <opencons>:
  804c24:	55                   	push   %rbp
  804c25:	48 89 e5             	mov    %rsp,%rbp
  804c28:	48 83 ec 10          	sub    $0x10,%rsp
  804c2c:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  804c30:	48 89 c7             	mov    %rax,%rdi
  804c33:	48 b8 27 28 80 00 00 	movabs $0x802827,%rax
  804c3a:	00 00 00 
  804c3d:	ff d0                	callq  *%rax
  804c3f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804c42:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804c46:	79 05                	jns    804c4d <opencons+0x29>
  804c48:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804c4b:	eb 5b                	jmp    804ca8 <opencons+0x84>
  804c4d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804c51:	ba 07 04 00 00       	mov    $0x407,%edx
  804c56:	48 89 c6             	mov    %rax,%rsi
  804c59:	bf 00 00 00 00       	mov    $0x0,%edi
  804c5e:	48 b8 fb 22 80 00 00 	movabs $0x8022fb,%rax
  804c65:	00 00 00 
  804c68:	ff d0                	callq  *%rax
  804c6a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804c6d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804c71:	79 05                	jns    804c78 <opencons+0x54>
  804c73:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804c76:	eb 30                	jmp    804ca8 <opencons+0x84>
  804c78:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804c7c:	48 ba 80 81 80 00 00 	movabs $0x808180,%rdx
  804c83:	00 00 00 
  804c86:	8b 12                	mov    (%rdx),%edx
  804c88:	89 10                	mov    %edx,(%rax)
  804c8a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804c8e:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  804c95:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804c99:	48 89 c7             	mov    %rax,%rdi
  804c9c:	48 b8 d9 27 80 00 00 	movabs $0x8027d9,%rax
  804ca3:	00 00 00 
  804ca6:	ff d0                	callq  *%rax
  804ca8:	c9                   	leaveq 
  804ca9:	c3                   	retq   

0000000000804caa <devcons_read>:
  804caa:	55                   	push   %rbp
  804cab:	48 89 e5             	mov    %rsp,%rbp
  804cae:	48 83 ec 30          	sub    $0x30,%rsp
  804cb2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804cb6:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804cba:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804cbe:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804cc3:	75 07                	jne    804ccc <devcons_read+0x22>
  804cc5:	b8 00 00 00 00       	mov    $0x0,%eax
  804cca:	eb 4b                	jmp    804d17 <devcons_read+0x6d>
  804ccc:	eb 0c                	jmp    804cda <devcons_read+0x30>
  804cce:	48 b8 bd 22 80 00 00 	movabs $0x8022bd,%rax
  804cd5:	00 00 00 
  804cd8:	ff d0                	callq  *%rax
  804cda:	48 b8 fd 21 80 00 00 	movabs $0x8021fd,%rax
  804ce1:	00 00 00 
  804ce4:	ff d0                	callq  *%rax
  804ce6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804ce9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804ced:	74 df                	je     804cce <devcons_read+0x24>
  804cef:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804cf3:	79 05                	jns    804cfa <devcons_read+0x50>
  804cf5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804cf8:	eb 1d                	jmp    804d17 <devcons_read+0x6d>
  804cfa:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  804cfe:	75 07                	jne    804d07 <devcons_read+0x5d>
  804d00:	b8 00 00 00 00       	mov    $0x0,%eax
  804d05:	eb 10                	jmp    804d17 <devcons_read+0x6d>
  804d07:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804d0a:	89 c2                	mov    %eax,%edx
  804d0c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804d10:	88 10                	mov    %dl,(%rax)
  804d12:	b8 01 00 00 00       	mov    $0x1,%eax
  804d17:	c9                   	leaveq 
  804d18:	c3                   	retq   

0000000000804d19 <devcons_write>:
  804d19:	55                   	push   %rbp
  804d1a:	48 89 e5             	mov    %rsp,%rbp
  804d1d:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  804d24:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  804d2b:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  804d32:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  804d39:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804d40:	eb 76                	jmp    804db8 <devcons_write+0x9f>
  804d42:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  804d49:	89 c2                	mov    %eax,%edx
  804d4b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804d4e:	29 c2                	sub    %eax,%edx
  804d50:	89 d0                	mov    %edx,%eax
  804d52:	89 45 f8             	mov    %eax,-0x8(%rbp)
  804d55:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804d58:	83 f8 7f             	cmp    $0x7f,%eax
  804d5b:	76 07                	jbe    804d64 <devcons_write+0x4b>
  804d5d:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  804d64:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804d67:	48 63 d0             	movslq %eax,%rdx
  804d6a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804d6d:	48 63 c8             	movslq %eax,%rcx
  804d70:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  804d77:	48 01 c1             	add    %rax,%rcx
  804d7a:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  804d81:	48 89 ce             	mov    %rcx,%rsi
  804d84:	48 89 c7             	mov    %rax,%rdi
  804d87:	48 b8 f0 1c 80 00 00 	movabs $0x801cf0,%rax
  804d8e:	00 00 00 
  804d91:	ff d0                	callq  *%rax
  804d93:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804d96:	48 63 d0             	movslq %eax,%rdx
  804d99:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  804da0:	48 89 d6             	mov    %rdx,%rsi
  804da3:	48 89 c7             	mov    %rax,%rdi
  804da6:	48 b8 b3 21 80 00 00 	movabs $0x8021b3,%rax
  804dad:	00 00 00 
  804db0:	ff d0                	callq  *%rax
  804db2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804db5:	01 45 fc             	add    %eax,-0x4(%rbp)
  804db8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804dbb:	48 98                	cltq   
  804dbd:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  804dc4:	0f 82 78 ff ff ff    	jb     804d42 <devcons_write+0x29>
  804dca:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804dcd:	c9                   	leaveq 
  804dce:	c3                   	retq   

0000000000804dcf <devcons_close>:
  804dcf:	55                   	push   %rbp
  804dd0:	48 89 e5             	mov    %rsp,%rbp
  804dd3:	48 83 ec 08          	sub    $0x8,%rsp
  804dd7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804ddb:	b8 00 00 00 00       	mov    $0x0,%eax
  804de0:	c9                   	leaveq 
  804de1:	c3                   	retq   

0000000000804de2 <devcons_stat>:
  804de2:	55                   	push   %rbp
  804de3:	48 89 e5             	mov    %rsp,%rbp
  804de6:	48 83 ec 10          	sub    $0x10,%rsp
  804dea:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804dee:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804df2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804df6:	48 be 87 5e 80 00 00 	movabs $0x805e87,%rsi
  804dfd:	00 00 00 
  804e00:	48 89 c7             	mov    %rax,%rdi
  804e03:	48 b8 cc 19 80 00 00 	movabs $0x8019cc,%rax
  804e0a:	00 00 00 
  804e0d:	ff d0                	callq  *%rax
  804e0f:	b8 00 00 00 00       	mov    $0x0,%eax
  804e14:	c9                   	leaveq 
  804e15:	c3                   	retq   

0000000000804e16 <ipc_recv>:
  804e16:	55                   	push   %rbp
  804e17:	48 89 e5             	mov    %rsp,%rbp
  804e1a:	48 83 ec 30          	sub    $0x30,%rsp
  804e1e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804e22:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804e26:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804e2a:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  804e2f:	75 0e                	jne    804e3f <ipc_recv+0x29>
  804e31:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804e38:	00 00 00 
  804e3b:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804e3f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804e43:	48 89 c7             	mov    %rax,%rdi
  804e46:	48 b8 24 25 80 00 00 	movabs $0x802524,%rax
  804e4d:	00 00 00 
  804e50:	ff d0                	callq  *%rax
  804e52:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804e55:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804e59:	79 27                	jns    804e82 <ipc_recv+0x6c>
  804e5b:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  804e60:	74 0a                	je     804e6c <ipc_recv+0x56>
  804e62:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804e66:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  804e6c:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804e71:	74 0a                	je     804e7d <ipc_recv+0x67>
  804e73:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804e77:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  804e7d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804e80:	eb 53                	jmp    804ed5 <ipc_recv+0xbf>
  804e82:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  804e87:	74 19                	je     804ea2 <ipc_recv+0x8c>
  804e89:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  804e90:	00 00 00 
  804e93:	48 8b 00             	mov    (%rax),%rax
  804e96:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  804e9c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804ea0:	89 10                	mov    %edx,(%rax)
  804ea2:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804ea7:	74 19                	je     804ec2 <ipc_recv+0xac>
  804ea9:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  804eb0:	00 00 00 
  804eb3:	48 8b 00             	mov    (%rax),%rax
  804eb6:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  804ebc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804ec0:	89 10                	mov    %edx,(%rax)
  804ec2:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  804ec9:	00 00 00 
  804ecc:	48 8b 00             	mov    (%rax),%rax
  804ecf:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  804ed5:	c9                   	leaveq 
  804ed6:	c3                   	retq   

0000000000804ed7 <ipc_send>:
  804ed7:	55                   	push   %rbp
  804ed8:	48 89 e5             	mov    %rsp,%rbp
  804edb:	48 83 ec 30          	sub    $0x30,%rsp
  804edf:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804ee2:	89 75 e8             	mov    %esi,-0x18(%rbp)
  804ee5:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  804ee9:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  804eec:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  804ef1:	75 10                	jne    804f03 <ipc_send+0x2c>
  804ef3:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804efa:	00 00 00 
  804efd:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804f01:	eb 0e                	jmp    804f11 <ipc_send+0x3a>
  804f03:	eb 0c                	jmp    804f11 <ipc_send+0x3a>
  804f05:	48 b8 bd 22 80 00 00 	movabs $0x8022bd,%rax
  804f0c:	00 00 00 
  804f0f:	ff d0                	callq  *%rax
  804f11:	8b 75 e8             	mov    -0x18(%rbp),%esi
  804f14:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  804f17:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  804f1b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804f1e:	89 c7                	mov    %eax,%edi
  804f20:	48 b8 cf 24 80 00 00 	movabs $0x8024cf,%rax
  804f27:	00 00 00 
  804f2a:	ff d0                	callq  *%rax
  804f2c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804f2f:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  804f33:	74 d0                	je     804f05 <ipc_send+0x2e>
  804f35:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804f39:	79 30                	jns    804f6b <ipc_send+0x94>
  804f3b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804f3e:	89 c1                	mov    %eax,%ecx
  804f40:	48 ba 8e 5e 80 00 00 	movabs $0x805e8e,%rdx
  804f47:	00 00 00 
  804f4a:	be 44 00 00 00       	mov    $0x44,%esi
  804f4f:	48 bf a4 5e 80 00 00 	movabs $0x805ea4,%rdi
  804f56:	00 00 00 
  804f59:	b8 00 00 00 00       	mov    $0x0,%eax
  804f5e:	49 b8 de 0b 80 00 00 	movabs $0x800bde,%r8
  804f65:	00 00 00 
  804f68:	41 ff d0             	callq  *%r8
  804f6b:	c9                   	leaveq 
  804f6c:	c3                   	retq   

0000000000804f6d <ipc_find_env>:
  804f6d:	55                   	push   %rbp
  804f6e:	48 89 e5             	mov    %rsp,%rbp
  804f71:	48 83 ec 14          	sub    $0x14,%rsp
  804f75:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804f78:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804f7f:	eb 4e                	jmp    804fcf <ipc_find_env+0x62>
  804f81:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804f88:	00 00 00 
  804f8b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804f8e:	48 98                	cltq   
  804f90:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804f97:	48 01 d0             	add    %rdx,%rax
  804f9a:	48 05 d0 00 00 00    	add    $0xd0,%rax
  804fa0:	8b 00                	mov    (%rax),%eax
  804fa2:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  804fa5:	75 24                	jne    804fcb <ipc_find_env+0x5e>
  804fa7:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804fae:	00 00 00 
  804fb1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804fb4:	48 98                	cltq   
  804fb6:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804fbd:	48 01 d0             	add    %rdx,%rax
  804fc0:	48 05 c0 00 00 00    	add    $0xc0,%rax
  804fc6:	8b 40 08             	mov    0x8(%rax),%eax
  804fc9:	eb 12                	jmp    804fdd <ipc_find_env+0x70>
  804fcb:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  804fcf:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  804fd6:	7e a9                	jle    804f81 <ipc_find_env+0x14>
  804fd8:	b8 00 00 00 00       	mov    $0x0,%eax
  804fdd:	c9                   	leaveq 
  804fde:	c3                   	retq   

0000000000804fdf <pageref>:
  804fdf:	55                   	push   %rbp
  804fe0:	48 89 e5             	mov    %rsp,%rbp
  804fe3:	48 83 ec 18          	sub    $0x18,%rsp
  804fe7:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804feb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804fef:	48 c1 e8 15          	shr    $0x15,%rax
  804ff3:	48 89 c2             	mov    %rax,%rdx
  804ff6:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  804ffd:	01 00 00 
  805000:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  805004:	83 e0 01             	and    $0x1,%eax
  805007:	48 85 c0             	test   %rax,%rax
  80500a:	75 07                	jne    805013 <pageref+0x34>
  80500c:	b8 00 00 00 00       	mov    $0x0,%eax
  805011:	eb 53                	jmp    805066 <pageref+0x87>
  805013:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805017:	48 c1 e8 0c          	shr    $0xc,%rax
  80501b:	48 89 c2             	mov    %rax,%rdx
  80501e:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  805025:	01 00 00 
  805028:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80502c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  805030:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  805034:	83 e0 01             	and    $0x1,%eax
  805037:	48 85 c0             	test   %rax,%rax
  80503a:	75 07                	jne    805043 <pageref+0x64>
  80503c:	b8 00 00 00 00       	mov    $0x0,%eax
  805041:	eb 23                	jmp    805066 <pageref+0x87>
  805043:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  805047:	48 c1 e8 0c          	shr    $0xc,%rax
  80504b:	48 89 c2             	mov    %rax,%rdx
  80504e:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  805055:	00 00 00 
  805058:	48 c1 e2 04          	shl    $0x4,%rdx
  80505c:	48 01 d0             	add    %rdx,%rax
  80505f:	0f b7 40 08          	movzwl 0x8(%rax),%eax
  805063:	0f b7 c0             	movzwl %ax,%eax
  805066:	c9                   	leaveq 
  805067:	c3                   	retq   

0000000000805068 <inet_addr>:
  805068:	55                   	push   %rbp
  805069:	48 89 e5             	mov    %rsp,%rbp
  80506c:	48 83 ec 20          	sub    $0x20,%rsp
  805070:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  805074:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  805078:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80507c:	48 89 d6             	mov    %rdx,%rsi
  80507f:	48 89 c7             	mov    %rax,%rdi
  805082:	48 b8 9e 50 80 00 00 	movabs $0x80509e,%rax
  805089:	00 00 00 
  80508c:	ff d0                	callq  *%rax
  80508e:	85 c0                	test   %eax,%eax
  805090:	74 05                	je     805097 <inet_addr+0x2f>
  805092:	8b 45 f0             	mov    -0x10(%rbp),%eax
  805095:	eb 05                	jmp    80509c <inet_addr+0x34>
  805097:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  80509c:	c9                   	leaveq 
  80509d:	c3                   	retq   

000000000080509e <inet_aton>:
  80509e:	55                   	push   %rbp
  80509f:	48 89 e5             	mov    %rsp,%rbp
  8050a2:	48 83 ec 40          	sub    $0x40,%rsp
  8050a6:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  8050aa:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
  8050ae:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  8050b2:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8050b6:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8050ba:	0f b6 00             	movzbl (%rax),%eax
  8050bd:	0f be c0             	movsbl %al,%eax
  8050c0:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8050c3:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8050c6:	3c 2f                	cmp    $0x2f,%al
  8050c8:	76 07                	jbe    8050d1 <inet_aton+0x33>
  8050ca:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8050cd:	3c 39                	cmp    $0x39,%al
  8050cf:	76 0a                	jbe    8050db <inet_aton+0x3d>
  8050d1:	b8 00 00 00 00       	mov    $0x0,%eax
  8050d6:	e9 68 02 00 00       	jmpq   805343 <inet_aton+0x2a5>
  8050db:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8050e2:	c7 45 f8 0a 00 00 00 	movl   $0xa,-0x8(%rbp)
  8050e9:	83 7d f4 30          	cmpl   $0x30,-0xc(%rbp)
  8050ed:	75 40                	jne    80512f <inet_aton+0x91>
  8050ef:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  8050f4:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8050f8:	0f b6 00             	movzbl (%rax),%eax
  8050fb:	0f be c0             	movsbl %al,%eax
  8050fe:	89 45 f4             	mov    %eax,-0xc(%rbp)
  805101:	83 7d f4 78          	cmpl   $0x78,-0xc(%rbp)
  805105:	74 06                	je     80510d <inet_aton+0x6f>
  805107:	83 7d f4 58          	cmpl   $0x58,-0xc(%rbp)
  80510b:	75 1b                	jne    805128 <inet_aton+0x8a>
  80510d:	c7 45 f8 10 00 00 00 	movl   $0x10,-0x8(%rbp)
  805114:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  805119:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80511d:	0f b6 00             	movzbl (%rax),%eax
  805120:	0f be c0             	movsbl %al,%eax
  805123:	89 45 f4             	mov    %eax,-0xc(%rbp)
  805126:	eb 07                	jmp    80512f <inet_aton+0x91>
  805128:	c7 45 f8 08 00 00 00 	movl   $0x8,-0x8(%rbp)
  80512f:	8b 45 f4             	mov    -0xc(%rbp),%eax
  805132:	3c 2f                	cmp    $0x2f,%al
  805134:	76 2f                	jbe    805165 <inet_aton+0xc7>
  805136:	8b 45 f4             	mov    -0xc(%rbp),%eax
  805139:	3c 39                	cmp    $0x39,%al
  80513b:	77 28                	ja     805165 <inet_aton+0xc7>
  80513d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  805140:	0f af 45 fc          	imul   -0x4(%rbp),%eax
  805144:	89 c2                	mov    %eax,%edx
  805146:	8b 45 f4             	mov    -0xc(%rbp),%eax
  805149:	01 d0                	add    %edx,%eax
  80514b:	83 e8 30             	sub    $0x30,%eax
  80514e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805151:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  805156:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80515a:	0f b6 00             	movzbl (%rax),%eax
  80515d:	0f be c0             	movsbl %al,%eax
  805160:	89 45 f4             	mov    %eax,-0xc(%rbp)
  805163:	eb ca                	jmp    80512f <inet_aton+0x91>
  805165:	83 7d f8 10          	cmpl   $0x10,-0x8(%rbp)
  805169:	75 72                	jne    8051dd <inet_aton+0x13f>
  80516b:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80516e:	3c 2f                	cmp    $0x2f,%al
  805170:	76 07                	jbe    805179 <inet_aton+0xdb>
  805172:	8b 45 f4             	mov    -0xc(%rbp),%eax
  805175:	3c 39                	cmp    $0x39,%al
  805177:	76 1c                	jbe    805195 <inet_aton+0xf7>
  805179:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80517c:	3c 60                	cmp    $0x60,%al
  80517e:	76 07                	jbe    805187 <inet_aton+0xe9>
  805180:	8b 45 f4             	mov    -0xc(%rbp),%eax
  805183:	3c 66                	cmp    $0x66,%al
  805185:	76 0e                	jbe    805195 <inet_aton+0xf7>
  805187:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80518a:	3c 40                	cmp    $0x40,%al
  80518c:	76 4f                	jbe    8051dd <inet_aton+0x13f>
  80518e:	8b 45 f4             	mov    -0xc(%rbp),%eax
  805191:	3c 46                	cmp    $0x46,%al
  805193:	77 48                	ja     8051dd <inet_aton+0x13f>
  805195:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805198:	c1 e0 04             	shl    $0x4,%eax
  80519b:	89 c2                	mov    %eax,%edx
  80519d:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8051a0:	8d 48 0a             	lea    0xa(%rax),%ecx
  8051a3:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8051a6:	3c 60                	cmp    $0x60,%al
  8051a8:	76 0e                	jbe    8051b8 <inet_aton+0x11a>
  8051aa:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8051ad:	3c 7a                	cmp    $0x7a,%al
  8051af:	77 07                	ja     8051b8 <inet_aton+0x11a>
  8051b1:	b8 61 00 00 00       	mov    $0x61,%eax
  8051b6:	eb 05                	jmp    8051bd <inet_aton+0x11f>
  8051b8:	b8 41 00 00 00       	mov    $0x41,%eax
  8051bd:	29 c1                	sub    %eax,%ecx
  8051bf:	89 c8                	mov    %ecx,%eax
  8051c1:	09 d0                	or     %edx,%eax
  8051c3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8051c6:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  8051cb:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8051cf:	0f b6 00             	movzbl (%rax),%eax
  8051d2:	0f be c0             	movsbl %al,%eax
  8051d5:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8051d8:	e9 52 ff ff ff       	jmpq   80512f <inet_aton+0x91>
  8051dd:	83 7d f4 2e          	cmpl   $0x2e,-0xc(%rbp)
  8051e1:	75 40                	jne    805223 <inet_aton+0x185>
  8051e3:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  8051e7:	48 83 c0 0c          	add    $0xc,%rax
  8051eb:	48 39 45 e8          	cmp    %rax,-0x18(%rbp)
  8051ef:	72 0a                	jb     8051fb <inet_aton+0x15d>
  8051f1:	b8 00 00 00 00       	mov    $0x0,%eax
  8051f6:	e9 48 01 00 00       	jmpq   805343 <inet_aton+0x2a5>
  8051fb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8051ff:	48 8d 50 04          	lea    0x4(%rax),%rdx
  805203:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  805207:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80520a:	89 10                	mov    %edx,(%rax)
  80520c:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  805211:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  805215:	0f b6 00             	movzbl (%rax),%eax
  805218:	0f be c0             	movsbl %al,%eax
  80521b:	89 45 f4             	mov    %eax,-0xc(%rbp)
  80521e:	e9 a0 fe ff ff       	jmpq   8050c3 <inet_aton+0x25>
  805223:	90                   	nop
  805224:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  805228:	74 3c                	je     805266 <inet_aton+0x1c8>
  80522a:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80522d:	3c 1f                	cmp    $0x1f,%al
  80522f:	76 2b                	jbe    80525c <inet_aton+0x1be>
  805231:	8b 45 f4             	mov    -0xc(%rbp),%eax
  805234:	84 c0                	test   %al,%al
  805236:	78 24                	js     80525c <inet_aton+0x1be>
  805238:	83 7d f4 20          	cmpl   $0x20,-0xc(%rbp)
  80523c:	74 28                	je     805266 <inet_aton+0x1c8>
  80523e:	83 7d f4 0c          	cmpl   $0xc,-0xc(%rbp)
  805242:	74 22                	je     805266 <inet_aton+0x1c8>
  805244:	83 7d f4 0a          	cmpl   $0xa,-0xc(%rbp)
  805248:	74 1c                	je     805266 <inet_aton+0x1c8>
  80524a:	83 7d f4 0d          	cmpl   $0xd,-0xc(%rbp)
  80524e:	74 16                	je     805266 <inet_aton+0x1c8>
  805250:	83 7d f4 09          	cmpl   $0x9,-0xc(%rbp)
  805254:	74 10                	je     805266 <inet_aton+0x1c8>
  805256:	83 7d f4 0b          	cmpl   $0xb,-0xc(%rbp)
  80525a:	74 0a                	je     805266 <inet_aton+0x1c8>
  80525c:	b8 00 00 00 00       	mov    $0x0,%eax
  805261:	e9 dd 00 00 00       	jmpq   805343 <inet_aton+0x2a5>
  805266:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80526a:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  80526e:	48 29 c2             	sub    %rax,%rdx
  805271:	48 89 d0             	mov    %rdx,%rax
  805274:	48 c1 f8 02          	sar    $0x2,%rax
  805278:	83 c0 01             	add    $0x1,%eax
  80527b:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  80527e:	83 7d e4 04          	cmpl   $0x4,-0x1c(%rbp)
  805282:	0f 87 98 00 00 00    	ja     805320 <inet_aton+0x282>
  805288:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80528b:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  805292:	00 
  805293:	48 b8 b8 5e 80 00 00 	movabs $0x805eb8,%rax
  80529a:	00 00 00 
  80529d:	48 01 d0             	add    %rdx,%rax
  8052a0:	48 8b 00             	mov    (%rax),%rax
  8052a3:	ff e0                	jmpq   *%rax
  8052a5:	b8 00 00 00 00       	mov    $0x0,%eax
  8052aa:	e9 94 00 00 00       	jmpq   805343 <inet_aton+0x2a5>
  8052af:	81 7d fc ff ff ff 00 	cmpl   $0xffffff,-0x4(%rbp)
  8052b6:	76 0a                	jbe    8052c2 <inet_aton+0x224>
  8052b8:	b8 00 00 00 00       	mov    $0x0,%eax
  8052bd:	e9 81 00 00 00       	jmpq   805343 <inet_aton+0x2a5>
  8052c2:	8b 45 d0             	mov    -0x30(%rbp),%eax
  8052c5:	c1 e0 18             	shl    $0x18,%eax
  8052c8:	09 45 fc             	or     %eax,-0x4(%rbp)
  8052cb:	eb 53                	jmp    805320 <inet_aton+0x282>
  8052cd:	81 7d fc ff ff 00 00 	cmpl   $0xffff,-0x4(%rbp)
  8052d4:	76 07                	jbe    8052dd <inet_aton+0x23f>
  8052d6:	b8 00 00 00 00       	mov    $0x0,%eax
  8052db:	eb 66                	jmp    805343 <inet_aton+0x2a5>
  8052dd:	8b 45 d0             	mov    -0x30(%rbp),%eax
  8052e0:	c1 e0 18             	shl    $0x18,%eax
  8052e3:	89 c2                	mov    %eax,%edx
  8052e5:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  8052e8:	c1 e0 10             	shl    $0x10,%eax
  8052eb:	09 d0                	or     %edx,%eax
  8052ed:	09 45 fc             	or     %eax,-0x4(%rbp)
  8052f0:	eb 2e                	jmp    805320 <inet_aton+0x282>
  8052f2:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%rbp)
  8052f9:	76 07                	jbe    805302 <inet_aton+0x264>
  8052fb:	b8 00 00 00 00       	mov    $0x0,%eax
  805300:	eb 41                	jmp    805343 <inet_aton+0x2a5>
  805302:	8b 45 d0             	mov    -0x30(%rbp),%eax
  805305:	c1 e0 18             	shl    $0x18,%eax
  805308:	89 c2                	mov    %eax,%edx
  80530a:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  80530d:	c1 e0 10             	shl    $0x10,%eax
  805310:	09 c2                	or     %eax,%edx
  805312:	8b 45 d8             	mov    -0x28(%rbp),%eax
  805315:	c1 e0 08             	shl    $0x8,%eax
  805318:	09 d0                	or     %edx,%eax
  80531a:	09 45 fc             	or     %eax,-0x4(%rbp)
  80531d:	eb 01                	jmp    805320 <inet_aton+0x282>
  80531f:	90                   	nop
  805320:	48 83 7d c0 00       	cmpq   $0x0,-0x40(%rbp)
  805325:	74 17                	je     80533e <inet_aton+0x2a0>
  805327:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80532a:	89 c7                	mov    %eax,%edi
  80532c:	48 b8 bc 54 80 00 00 	movabs $0x8054bc,%rax
  805333:	00 00 00 
  805336:	ff d0                	callq  *%rax
  805338:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  80533c:	89 02                	mov    %eax,(%rdx)
  80533e:	b8 01 00 00 00       	mov    $0x1,%eax
  805343:	c9                   	leaveq 
  805344:	c3                   	retq   

0000000000805345 <inet_ntoa>:
  805345:	55                   	push   %rbp
  805346:	48 89 e5             	mov    %rsp,%rbp
  805349:	48 83 ec 30          	sub    $0x30,%rsp
  80534d:	89 7d d0             	mov    %edi,-0x30(%rbp)
  805350:	8b 45 d0             	mov    -0x30(%rbp),%eax
  805353:	89 45 e8             	mov    %eax,-0x18(%rbp)
  805356:	48 b8 10 90 80 00 00 	movabs $0x809010,%rax
  80535d:	00 00 00 
  805360:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  805364:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  805368:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80536c:	c6 45 ef 00          	movb   $0x0,-0x11(%rbp)
  805370:	e9 e0 00 00 00       	jmpq   805455 <inet_ntoa+0x110>
  805375:	c6 45 ee 00          	movb   $0x0,-0x12(%rbp)
  805379:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80537d:	0f b6 08             	movzbl (%rax),%ecx
  805380:	0f b6 d1             	movzbl %cl,%edx
  805383:	89 d0                	mov    %edx,%eax
  805385:	c1 e0 02             	shl    $0x2,%eax
  805388:	01 d0                	add    %edx,%eax
  80538a:	c1 e0 03             	shl    $0x3,%eax
  80538d:	01 d0                	add    %edx,%eax
  80538f:	8d 14 85 00 00 00 00 	lea    0x0(,%rax,4),%edx
  805396:	01 d0                	add    %edx,%eax
  805398:	66 c1 e8 08          	shr    $0x8,%ax
  80539c:	c0 e8 03             	shr    $0x3,%al
  80539f:	88 45 ed             	mov    %al,-0x13(%rbp)
  8053a2:	0f b6 55 ed          	movzbl -0x13(%rbp),%edx
  8053a6:	89 d0                	mov    %edx,%eax
  8053a8:	c1 e0 02             	shl    $0x2,%eax
  8053ab:	01 d0                	add    %edx,%eax
  8053ad:	01 c0                	add    %eax,%eax
  8053af:	29 c1                	sub    %eax,%ecx
  8053b1:	89 c8                	mov    %ecx,%eax
  8053b3:	88 45 ed             	mov    %al,-0x13(%rbp)
  8053b6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8053ba:	0f b6 00             	movzbl (%rax),%eax
  8053bd:	0f b6 d0             	movzbl %al,%edx
  8053c0:	89 d0                	mov    %edx,%eax
  8053c2:	c1 e0 02             	shl    $0x2,%eax
  8053c5:	01 d0                	add    %edx,%eax
  8053c7:	c1 e0 03             	shl    $0x3,%eax
  8053ca:	01 d0                	add    %edx,%eax
  8053cc:	8d 14 85 00 00 00 00 	lea    0x0(,%rax,4),%edx
  8053d3:	01 d0                	add    %edx,%eax
  8053d5:	66 c1 e8 08          	shr    $0x8,%ax
  8053d9:	89 c2                	mov    %eax,%edx
  8053db:	c0 ea 03             	shr    $0x3,%dl
  8053de:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8053e2:	88 10                	mov    %dl,(%rax)
  8053e4:	0f b6 45 ee          	movzbl -0x12(%rbp),%eax
  8053e8:	8d 50 01             	lea    0x1(%rax),%edx
  8053eb:	88 55 ee             	mov    %dl,-0x12(%rbp)
  8053ee:	0f b6 c0             	movzbl %al,%eax
  8053f1:	0f b6 55 ed          	movzbl -0x13(%rbp),%edx
  8053f5:	83 c2 30             	add    $0x30,%edx
  8053f8:	48 98                	cltq   
  8053fa:	88 54 05 e0          	mov    %dl,-0x20(%rbp,%rax,1)
  8053fe:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805402:	0f b6 00             	movzbl (%rax),%eax
  805405:	84 c0                	test   %al,%al
  805407:	0f 85 6c ff ff ff    	jne    805379 <inet_ntoa+0x34>
  80540d:	eb 1a                	jmp    805429 <inet_ntoa+0xe4>
  80540f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  805413:	48 8d 50 01          	lea    0x1(%rax),%rdx
  805417:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
  80541b:	0f b6 55 ee          	movzbl -0x12(%rbp),%edx
  80541f:	48 63 d2             	movslq %edx,%rdx
  805422:	0f b6 54 15 e0       	movzbl -0x20(%rbp,%rdx,1),%edx
  805427:	88 10                	mov    %dl,(%rax)
  805429:	0f b6 45 ee          	movzbl -0x12(%rbp),%eax
  80542d:	8d 50 ff             	lea    -0x1(%rax),%edx
  805430:	88 55 ee             	mov    %dl,-0x12(%rbp)
  805433:	84 c0                	test   %al,%al
  805435:	75 d8                	jne    80540f <inet_ntoa+0xca>
  805437:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80543b:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80543f:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
  805443:	c6 00 2e             	movb   $0x2e,(%rax)
  805446:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  80544b:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  80544f:	83 c0 01             	add    $0x1,%eax
  805452:	88 45 ef             	mov    %al,-0x11(%rbp)
  805455:	80 7d ef 03          	cmpb   $0x3,-0x11(%rbp)
  805459:	0f 86 16 ff ff ff    	jbe    805375 <inet_ntoa+0x30>
  80545f:	48 83 6d f8 01       	subq   $0x1,-0x8(%rbp)
  805464:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  805468:	c6 00 00             	movb   $0x0,(%rax)
  80546b:	48 b8 10 90 80 00 00 	movabs $0x809010,%rax
  805472:	00 00 00 
  805475:	c9                   	leaveq 
  805476:	c3                   	retq   

0000000000805477 <htons>:
  805477:	55                   	push   %rbp
  805478:	48 89 e5             	mov    %rsp,%rbp
  80547b:	48 83 ec 04          	sub    $0x4,%rsp
  80547f:	89 f8                	mov    %edi,%eax
  805481:	66 89 45 fc          	mov    %ax,-0x4(%rbp)
  805485:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
  805489:	c1 e0 08             	shl    $0x8,%eax
  80548c:	89 c2                	mov    %eax,%edx
  80548e:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
  805492:	66 c1 e8 08          	shr    $0x8,%ax
  805496:	09 d0                	or     %edx,%eax
  805498:	c9                   	leaveq 
  805499:	c3                   	retq   

000000000080549a <ntohs>:
  80549a:	55                   	push   %rbp
  80549b:	48 89 e5             	mov    %rsp,%rbp
  80549e:	48 83 ec 08          	sub    $0x8,%rsp
  8054a2:	89 f8                	mov    %edi,%eax
  8054a4:	66 89 45 fc          	mov    %ax,-0x4(%rbp)
  8054a8:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
  8054ac:	89 c7                	mov    %eax,%edi
  8054ae:	48 b8 77 54 80 00 00 	movabs $0x805477,%rax
  8054b5:	00 00 00 
  8054b8:	ff d0                	callq  *%rax
  8054ba:	c9                   	leaveq 
  8054bb:	c3                   	retq   

00000000008054bc <htonl>:
  8054bc:	55                   	push   %rbp
  8054bd:	48 89 e5             	mov    %rsp,%rbp
  8054c0:	48 83 ec 04          	sub    $0x4,%rsp
  8054c4:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8054c7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8054ca:	c1 e0 18             	shl    $0x18,%eax
  8054cd:	89 c2                	mov    %eax,%edx
  8054cf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8054d2:	25 00 ff 00 00       	and    $0xff00,%eax
  8054d7:	c1 e0 08             	shl    $0x8,%eax
  8054da:	09 c2                	or     %eax,%edx
  8054dc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8054df:	25 00 00 ff 00       	and    $0xff0000,%eax
  8054e4:	48 c1 e8 08          	shr    $0x8,%rax
  8054e8:	09 c2                	or     %eax,%edx
  8054ea:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8054ed:	c1 e8 18             	shr    $0x18,%eax
  8054f0:	09 d0                	or     %edx,%eax
  8054f2:	c9                   	leaveq 
  8054f3:	c3                   	retq   

00000000008054f4 <ntohl>:
  8054f4:	55                   	push   %rbp
  8054f5:	48 89 e5             	mov    %rsp,%rbp
  8054f8:	48 83 ec 08          	sub    $0x8,%rsp
  8054fc:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8054ff:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805502:	89 c7                	mov    %eax,%edi
  805504:	48 b8 bc 54 80 00 00 	movabs $0x8054bc,%rax
  80550b:	00 00 00 
  80550e:	ff d0                	callq  *%rax
  805510:	c9                   	leaveq 
  805511:	c3                   	retq   
