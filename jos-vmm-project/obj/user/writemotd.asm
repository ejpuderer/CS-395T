
obj/user/writemotd:     file format elf64-x86-64


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
  80003c:	e8 36 03 00 00       	callq  800377 <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <umain>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  80004e:	89 bd ec fd ff ff    	mov    %edi,-0x214(%rbp)
  800054:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  80005b:	be 00 00 00 00       	mov    $0x0,%esi
  800060:	48 bf 20 43 80 00 00 	movabs $0x804320,%rdi
  800067:	00 00 00 
  80006a:	48 b8 06 2a 80 00 00 	movabs $0x802a06,%rax
  800071:	00 00 00 
  800074:	ff d0                	callq  *%rax
  800076:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800079:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80007d:	79 30                	jns    8000af <umain+0x6c>
  80007f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800082:	89 c1                	mov    %eax,%ecx
  800084:	48 ba 29 43 80 00 00 	movabs $0x804329,%rdx
  80008b:	00 00 00 
  80008e:	be 0c 00 00 00       	mov    $0xc,%esi
  800093:	48 bf 3b 43 80 00 00 	movabs $0x80433b,%rdi
  80009a:	00 00 00 
  80009d:	b8 00 00 00 00       	mov    $0x0,%eax
  8000a2:	49 b8 1d 04 80 00 00 	movabs $0x80041d,%r8
  8000a9:	00 00 00 
  8000ac:	41 ff d0             	callq  *%r8
  8000af:	be 02 00 00 00       	mov    $0x2,%esi
  8000b4:	48 bf 4f 43 80 00 00 	movabs $0x80434f,%rdi
  8000bb:	00 00 00 
  8000be:	48 b8 06 2a 80 00 00 	movabs $0x802a06,%rax
  8000c5:	00 00 00 
  8000c8:	ff d0                	callq  *%rax
  8000ca:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8000cd:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8000d1:	79 30                	jns    800103 <umain+0xc0>
  8000d3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8000d6:	89 c1                	mov    %eax,%ecx
  8000d8:	48 ba 55 43 80 00 00 	movabs $0x804355,%rdx
  8000df:	00 00 00 
  8000e2:	be 0e 00 00 00       	mov    $0xe,%esi
  8000e7:	48 bf 3b 43 80 00 00 	movabs $0x80433b,%rdi
  8000ee:	00 00 00 
  8000f1:	b8 00 00 00 00       	mov    $0x0,%eax
  8000f6:	49 b8 1d 04 80 00 00 	movabs $0x80041d,%r8
  8000fd:	00 00 00 
  800100:	41 ff d0             	callq  *%r8
  800103:	8b 55 f8             	mov    -0x8(%rbp),%edx
  800106:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800109:	89 c6                	mov    %eax,%esi
  80010b:	48 bf 64 43 80 00 00 	movabs $0x804364,%rdi
  800112:	00 00 00 
  800115:	b8 00 00 00 00       	mov    $0x0,%eax
  80011a:	48 b9 56 06 80 00 00 	movabs $0x800656,%rcx
  800121:	00 00 00 
  800124:	ff d1                	callq  *%rcx
  800126:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800129:	3b 45 f8             	cmp    -0x8(%rbp),%eax
  80012c:	75 2a                	jne    800158 <umain+0x115>
  80012e:	48 ba 80 43 80 00 00 	movabs $0x804380,%rdx
  800135:	00 00 00 
  800138:	be 11 00 00 00       	mov    $0x11,%esi
  80013d:	48 bf 3b 43 80 00 00 	movabs $0x80433b,%rdi
  800144:	00 00 00 
  800147:	b8 00 00 00 00       	mov    $0x0,%eax
  80014c:	48 b9 1d 04 80 00 00 	movabs $0x80041d,%rcx
  800153:	00 00 00 
  800156:	ff d1                	callq  *%rcx
  800158:	48 bf b2 43 80 00 00 	movabs $0x8043b2,%rdi
  80015f:	00 00 00 
  800162:	b8 00 00 00 00       	mov    $0x0,%eax
  800167:	48 ba 56 06 80 00 00 	movabs $0x800656,%rdx
  80016e:	00 00 00 
  800171:	ff d2                	callq  *%rdx
  800173:	eb 1f                	jmp    800194 <umain+0x151>
  800175:	8b 45 f4             	mov    -0xc(%rbp),%eax
  800178:	48 63 d0             	movslq %eax,%rdx
  80017b:	48 8d 85 f0 fd ff ff 	lea    -0x210(%rbp),%rax
  800182:	48 89 d6             	mov    %rdx,%rsi
  800185:	48 89 c7             	mov    %rax,%rdi
  800188:	48 b8 f2 19 80 00 00 	movabs $0x8019f2,%rax
  80018f:	00 00 00 
  800192:	ff d0                	callq  *%rax
  800194:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  80019b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80019e:	ba ff 01 00 00       	mov    $0x1ff,%edx
  8001a3:	48 89 ce             	mov    %rcx,%rsi
  8001a6:	89 c7                	mov    %eax,%edi
  8001a8:	48 b8 30 25 80 00 00 	movabs $0x802530,%rax
  8001af:	00 00 00 
  8001b2:	ff d0                	callq  *%rax
  8001b4:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8001b7:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8001bb:	7f b8                	jg     800175 <umain+0x132>
  8001bd:	48 bf c0 43 80 00 00 	movabs $0x8043c0,%rdi
  8001c4:	00 00 00 
  8001c7:	b8 00 00 00 00       	mov    $0x0,%eax
  8001cc:	48 ba 56 06 80 00 00 	movabs $0x800656,%rdx
  8001d3:	00 00 00 
  8001d6:	ff d2                	callq  *%rdx
  8001d8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8001db:	be 00 00 00 00       	mov    $0x0,%esi
  8001e0:	89 c7                	mov    %eax,%edi
  8001e2:	48 b8 4e 27 80 00 00 	movabs $0x80274e,%rax
  8001e9:	00 00 00 
  8001ec:	ff d0                	callq  *%rax
  8001ee:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8001f1:	be 00 00 00 00       	mov    $0x0,%esi
  8001f6:	89 c7                	mov    %eax,%edi
  8001f8:	48 b8 93 27 80 00 00 	movabs $0x802793,%rax
  8001ff:	00 00 00 
  800202:	ff d0                	callq  *%rax
  800204:	89 45 f0             	mov    %eax,-0x10(%rbp)
  800207:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  80020b:	79 30                	jns    80023d <umain+0x1fa>
  80020d:	8b 45 f0             	mov    -0x10(%rbp),%eax
  800210:	89 c1                	mov    %eax,%ecx
  800212:	48 ba c5 43 80 00 00 	movabs $0x8043c5,%rdx
  800219:	00 00 00 
  80021c:	be 1a 00 00 00       	mov    $0x1a,%esi
  800221:	48 bf 3b 43 80 00 00 	movabs $0x80433b,%rdi
  800228:	00 00 00 
  80022b:	b8 00 00 00 00       	mov    $0x0,%eax
  800230:	49 b8 1d 04 80 00 00 	movabs $0x80041d,%r8
  800237:	00 00 00 
  80023a:	41 ff d0             	callq  *%r8
  80023d:	48 bf d8 43 80 00 00 	movabs $0x8043d8,%rdi
  800244:	00 00 00 
  800247:	b8 00 00 00 00       	mov    $0x0,%eax
  80024c:	48 ba 56 06 80 00 00 	movabs $0x800656,%rdx
  800253:	00 00 00 
  800256:	ff d2                	callq  *%rdx
  800258:	eb 7b                	jmp    8002d5 <umain+0x292>
  80025a:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80025d:	48 63 d0             	movslq %eax,%rdx
  800260:	48 8d 85 f0 fd ff ff 	lea    -0x210(%rbp),%rax
  800267:	48 89 d6             	mov    %rdx,%rsi
  80026a:	48 89 c7             	mov    %rax,%rdi
  80026d:	48 b8 f2 19 80 00 00 	movabs $0x8019f2,%rax
  800274:	00 00 00 
  800277:	ff d0                	callq  *%rax
  800279:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80027c:	48 63 d0             	movslq %eax,%rdx
  80027f:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  800286:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800289:	48 89 ce             	mov    %rcx,%rsi
  80028c:	89 c7                	mov    %eax,%edi
  80028e:	48 b8 7a 26 80 00 00 	movabs $0x80267a,%rax
  800295:	00 00 00 
  800298:	ff d0                	callq  *%rax
  80029a:	89 45 f0             	mov    %eax,-0x10(%rbp)
  80029d:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8002a0:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  8002a3:	74 30                	je     8002d5 <umain+0x292>
  8002a5:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8002a8:	89 c1                	mov    %eax,%ecx
  8002aa:	48 ba e6 43 80 00 00 	movabs $0x8043e6,%rdx
  8002b1:	00 00 00 
  8002b4:	be 20 00 00 00       	mov    $0x20,%esi
  8002b9:	48 bf 3b 43 80 00 00 	movabs $0x80433b,%rdi
  8002c0:	00 00 00 
  8002c3:	b8 00 00 00 00       	mov    $0x0,%eax
  8002c8:	49 b8 1d 04 80 00 00 	movabs $0x80041d,%r8
  8002cf:	00 00 00 
  8002d2:	41 ff d0             	callq  *%r8
  8002d5:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  8002dc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8002df:	ba ff 01 00 00       	mov    $0x1ff,%edx
  8002e4:	48 89 ce             	mov    %rcx,%rsi
  8002e7:	89 c7                	mov    %eax,%edi
  8002e9:	48 b8 30 25 80 00 00 	movabs $0x802530,%rax
  8002f0:	00 00 00 
  8002f3:	ff d0                	callq  *%rax
  8002f5:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8002f8:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8002fc:	0f 8f 58 ff ff ff    	jg     80025a <umain+0x217>
  800302:	48 bf c0 43 80 00 00 	movabs $0x8043c0,%rdi
  800309:	00 00 00 
  80030c:	b8 00 00 00 00       	mov    $0x0,%eax
  800311:	48 ba 56 06 80 00 00 	movabs $0x800656,%rdx
  800318:	00 00 00 
  80031b:	ff d2                	callq  *%rdx
  80031d:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  800321:	79 30                	jns    800353 <umain+0x310>
  800323:	8b 45 f4             	mov    -0xc(%rbp),%eax
  800326:	89 c1                	mov    %eax,%ecx
  800328:	48 ba f6 43 80 00 00 	movabs $0x8043f6,%rdx
  80032f:	00 00 00 
  800332:	be 25 00 00 00       	mov    $0x25,%esi
  800337:	48 bf 3b 43 80 00 00 	movabs $0x80433b,%rdi
  80033e:	00 00 00 
  800341:	b8 00 00 00 00       	mov    $0x0,%eax
  800346:	49 b8 1d 04 80 00 00 	movabs $0x80041d,%r8
  80034d:	00 00 00 
  800350:	41 ff d0             	callq  *%r8
  800353:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800356:	89 c7                	mov    %eax,%edi
  800358:	48 b8 0e 23 80 00 00 	movabs $0x80230e,%rax
  80035f:	00 00 00 
  800362:	ff d0                	callq  *%rax
  800364:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800367:	89 c7                	mov    %eax,%edi
  800369:	48 b8 0e 23 80 00 00 	movabs $0x80230e,%rax
  800370:	00 00 00 
  800373:	ff d0                	callq  *%rax
  800375:	c9                   	leaveq 
  800376:	c3                   	retq   

0000000000800377 <libmain>:
  800377:	55                   	push   %rbp
  800378:	48 89 e5             	mov    %rsp,%rbp
  80037b:	48 83 ec 10          	sub    $0x10,%rsp
  80037f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800382:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800386:	48 b8 be 1a 80 00 00 	movabs $0x801abe,%rax
  80038d:	00 00 00 
  800390:	ff d0                	callq  *%rax
  800392:	25 ff 03 00 00       	and    $0x3ff,%eax
  800397:	48 98                	cltq   
  800399:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8003a0:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8003a7:	00 00 00 
  8003aa:	48 01 c2             	add    %rax,%rdx
  8003ad:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8003b4:	00 00 00 
  8003b7:	48 89 10             	mov    %rdx,(%rax)
  8003ba:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8003be:	7e 14                	jle    8003d4 <libmain+0x5d>
  8003c0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8003c4:	48 8b 10             	mov    (%rax),%rdx
  8003c7:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  8003ce:	00 00 00 
  8003d1:	48 89 10             	mov    %rdx,(%rax)
  8003d4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8003d8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8003db:	48 89 d6             	mov    %rdx,%rsi
  8003de:	89 c7                	mov    %eax,%edi
  8003e0:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8003e7:	00 00 00 
  8003ea:	ff d0                	callq  *%rax
  8003ec:	48 b8 fa 03 80 00 00 	movabs $0x8003fa,%rax
  8003f3:	00 00 00 
  8003f6:	ff d0                	callq  *%rax
  8003f8:	c9                   	leaveq 
  8003f9:	c3                   	retq   

00000000008003fa <exit>:
  8003fa:	55                   	push   %rbp
  8003fb:	48 89 e5             	mov    %rsp,%rbp
  8003fe:	48 b8 59 23 80 00 00 	movabs $0x802359,%rax
  800405:	00 00 00 
  800408:	ff d0                	callq  *%rax
  80040a:	bf 00 00 00 00       	mov    $0x0,%edi
  80040f:	48 b8 7a 1a 80 00 00 	movabs $0x801a7a,%rax
  800416:	00 00 00 
  800419:	ff d0                	callq  *%rax
  80041b:	5d                   	pop    %rbp
  80041c:	c3                   	retq   

000000000080041d <_panic>:
  80041d:	55                   	push   %rbp
  80041e:	48 89 e5             	mov    %rsp,%rbp
  800421:	53                   	push   %rbx
  800422:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  800429:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  800430:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  800436:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  80043d:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  800444:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  80044b:	84 c0                	test   %al,%al
  80044d:	74 23                	je     800472 <_panic+0x55>
  80044f:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  800456:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  80045a:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  80045e:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  800462:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  800466:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  80046a:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  80046e:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  800472:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  800479:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  800480:	00 00 00 
  800483:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  80048a:	00 00 00 
  80048d:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800491:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  800498:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  80049f:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8004a6:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  8004ad:	00 00 00 
  8004b0:	48 8b 18             	mov    (%rax),%rbx
  8004b3:	48 b8 be 1a 80 00 00 	movabs $0x801abe,%rax
  8004ba:	00 00 00 
  8004bd:	ff d0                	callq  *%rax
  8004bf:	8b 8d 14 ff ff ff    	mov    -0xec(%rbp),%ecx
  8004c5:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  8004cc:	41 89 c8             	mov    %ecx,%r8d
  8004cf:	48 89 d1             	mov    %rdx,%rcx
  8004d2:	48 89 da             	mov    %rbx,%rdx
  8004d5:	89 c6                	mov    %eax,%esi
  8004d7:	48 bf 18 44 80 00 00 	movabs $0x804418,%rdi
  8004de:	00 00 00 
  8004e1:	b8 00 00 00 00       	mov    $0x0,%eax
  8004e6:	49 b9 56 06 80 00 00 	movabs $0x800656,%r9
  8004ed:	00 00 00 
  8004f0:	41 ff d1             	callq  *%r9
  8004f3:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  8004fa:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800501:	48 89 d6             	mov    %rdx,%rsi
  800504:	48 89 c7             	mov    %rax,%rdi
  800507:	48 b8 aa 05 80 00 00 	movabs $0x8005aa,%rax
  80050e:	00 00 00 
  800511:	ff d0                	callq  *%rax
  800513:	48 bf 3b 44 80 00 00 	movabs $0x80443b,%rdi
  80051a:	00 00 00 
  80051d:	b8 00 00 00 00       	mov    $0x0,%eax
  800522:	48 ba 56 06 80 00 00 	movabs $0x800656,%rdx
  800529:	00 00 00 
  80052c:	ff d2                	callq  *%rdx
  80052e:	cc                   	int3   
  80052f:	eb fd                	jmp    80052e <_panic+0x111>

0000000000800531 <putch>:
  800531:	55                   	push   %rbp
  800532:	48 89 e5             	mov    %rsp,%rbp
  800535:	48 83 ec 10          	sub    $0x10,%rsp
  800539:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80053c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800540:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800544:	8b 00                	mov    (%rax),%eax
  800546:	8d 48 01             	lea    0x1(%rax),%ecx
  800549:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80054d:	89 0a                	mov    %ecx,(%rdx)
  80054f:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800552:	89 d1                	mov    %edx,%ecx
  800554:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800558:	48 98                	cltq   
  80055a:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  80055e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800562:	8b 00                	mov    (%rax),%eax
  800564:	3d ff 00 00 00       	cmp    $0xff,%eax
  800569:	75 2c                	jne    800597 <putch+0x66>
  80056b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80056f:	8b 00                	mov    (%rax),%eax
  800571:	48 98                	cltq   
  800573:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800577:	48 83 c2 08          	add    $0x8,%rdx
  80057b:	48 89 c6             	mov    %rax,%rsi
  80057e:	48 89 d7             	mov    %rdx,%rdi
  800581:	48 b8 f2 19 80 00 00 	movabs $0x8019f2,%rax
  800588:	00 00 00 
  80058b:	ff d0                	callq  *%rax
  80058d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800591:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  800597:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80059b:	8b 40 04             	mov    0x4(%rax),%eax
  80059e:	8d 50 01             	lea    0x1(%rax),%edx
  8005a1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8005a5:	89 50 04             	mov    %edx,0x4(%rax)
  8005a8:	c9                   	leaveq 
  8005a9:	c3                   	retq   

00000000008005aa <vcprintf>:
  8005aa:	55                   	push   %rbp
  8005ab:	48 89 e5             	mov    %rsp,%rbp
  8005ae:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  8005b5:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  8005bc:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  8005c3:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  8005ca:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  8005d1:	48 8b 0a             	mov    (%rdx),%rcx
  8005d4:	48 89 08             	mov    %rcx,(%rax)
  8005d7:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8005db:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8005df:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8005e3:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8005e7:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  8005ee:	00 00 00 
  8005f1:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  8005f8:	00 00 00 
  8005fb:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  800602:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  800609:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800610:	48 89 c6             	mov    %rax,%rsi
  800613:	48 bf 31 05 80 00 00 	movabs $0x800531,%rdi
  80061a:	00 00 00 
  80061d:	48 b8 09 0a 80 00 00 	movabs $0x800a09,%rax
  800624:	00 00 00 
  800627:	ff d0                	callq  *%rax
  800629:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  80062f:	48 98                	cltq   
  800631:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  800638:	48 83 c2 08          	add    $0x8,%rdx
  80063c:	48 89 c6             	mov    %rax,%rsi
  80063f:	48 89 d7             	mov    %rdx,%rdi
  800642:	48 b8 f2 19 80 00 00 	movabs $0x8019f2,%rax
  800649:	00 00 00 
  80064c:	ff d0                	callq  *%rax
  80064e:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  800654:	c9                   	leaveq 
  800655:	c3                   	retq   

0000000000800656 <cprintf>:
  800656:	55                   	push   %rbp
  800657:	48 89 e5             	mov    %rsp,%rbp
  80065a:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  800661:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  800668:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  80066f:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800676:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  80067d:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800684:	84 c0                	test   %al,%al
  800686:	74 20                	je     8006a8 <cprintf+0x52>
  800688:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  80068c:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800690:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800694:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800698:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  80069c:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8006a0:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8006a4:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8006a8:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  8006af:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  8006b6:	00 00 00 
  8006b9:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8006c0:	00 00 00 
  8006c3:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8006c7:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8006ce:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8006d5:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8006dc:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  8006e3:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8006ea:	48 8b 0a             	mov    (%rdx),%rcx
  8006ed:	48 89 08             	mov    %rcx,(%rax)
  8006f0:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8006f4:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8006f8:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8006fc:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800700:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  800707:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  80070e:	48 89 d6             	mov    %rdx,%rsi
  800711:	48 89 c7             	mov    %rax,%rdi
  800714:	48 b8 aa 05 80 00 00 	movabs $0x8005aa,%rax
  80071b:	00 00 00 
  80071e:	ff d0                	callq  *%rax
  800720:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  800726:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  80072c:	c9                   	leaveq 
  80072d:	c3                   	retq   

000000000080072e <printnum>:
  80072e:	55                   	push   %rbp
  80072f:	48 89 e5             	mov    %rsp,%rbp
  800732:	53                   	push   %rbx
  800733:	48 83 ec 38          	sub    $0x38,%rsp
  800737:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80073b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80073f:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  800743:	89 4d d4             	mov    %ecx,-0x2c(%rbp)
  800746:	44 89 45 d0          	mov    %r8d,-0x30(%rbp)
  80074a:	44 89 4d cc          	mov    %r9d,-0x34(%rbp)
  80074e:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  800751:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  800755:	77 3b                	ja     800792 <printnum+0x64>
  800757:	8b 45 d0             	mov    -0x30(%rbp),%eax
  80075a:	44 8d 40 ff          	lea    -0x1(%rax),%r8d
  80075e:	8b 5d d4             	mov    -0x2c(%rbp),%ebx
  800761:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800765:	ba 00 00 00 00       	mov    $0x0,%edx
  80076a:	48 f7 f3             	div    %rbx
  80076d:	48 89 c2             	mov    %rax,%rdx
  800770:	8b 7d cc             	mov    -0x34(%rbp),%edi
  800773:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  800776:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
  80077a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80077e:	41 89 f9             	mov    %edi,%r9d
  800781:	48 89 c7             	mov    %rax,%rdi
  800784:	48 b8 2e 07 80 00 00 	movabs $0x80072e,%rax
  80078b:	00 00 00 
  80078e:	ff d0                	callq  *%rax
  800790:	eb 1e                	jmp    8007b0 <printnum+0x82>
  800792:	eb 12                	jmp    8007a6 <printnum+0x78>
  800794:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  800798:	8b 55 cc             	mov    -0x34(%rbp),%edx
  80079b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80079f:	48 89 ce             	mov    %rcx,%rsi
  8007a2:	89 d7                	mov    %edx,%edi
  8007a4:	ff d0                	callq  *%rax
  8007a6:	83 6d d0 01          	subl   $0x1,-0x30(%rbp)
  8007aa:	83 7d d0 00          	cmpl   $0x0,-0x30(%rbp)
  8007ae:	7f e4                	jg     800794 <printnum+0x66>
  8007b0:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  8007b3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8007b7:	ba 00 00 00 00       	mov    $0x0,%edx
  8007bc:	48 f7 f1             	div    %rcx
  8007bf:	48 89 d0             	mov    %rdx,%rax
  8007c2:	48 ba 30 46 80 00 00 	movabs $0x804630,%rdx
  8007c9:	00 00 00 
  8007cc:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
  8007d0:	0f be d0             	movsbl %al,%edx
  8007d3:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8007d7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007db:	48 89 ce             	mov    %rcx,%rsi
  8007de:	89 d7                	mov    %edx,%edi
  8007e0:	ff d0                	callq  *%rax
  8007e2:	48 83 c4 38          	add    $0x38,%rsp
  8007e6:	5b                   	pop    %rbx
  8007e7:	5d                   	pop    %rbp
  8007e8:	c3                   	retq   

00000000008007e9 <getuint>:
  8007e9:	55                   	push   %rbp
  8007ea:	48 89 e5             	mov    %rsp,%rbp
  8007ed:	48 83 ec 1c          	sub    $0x1c,%rsp
  8007f1:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8007f5:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8007f8:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8007fc:	7e 52                	jle    800850 <getuint+0x67>
  8007fe:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800802:	8b 00                	mov    (%rax),%eax
  800804:	83 f8 30             	cmp    $0x30,%eax
  800807:	73 24                	jae    80082d <getuint+0x44>
  800809:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80080d:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800811:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800815:	8b 00                	mov    (%rax),%eax
  800817:	89 c0                	mov    %eax,%eax
  800819:	48 01 d0             	add    %rdx,%rax
  80081c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800820:	8b 12                	mov    (%rdx),%edx
  800822:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800825:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800829:	89 0a                	mov    %ecx,(%rdx)
  80082b:	eb 17                	jmp    800844 <getuint+0x5b>
  80082d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800831:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800835:	48 89 d0             	mov    %rdx,%rax
  800838:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  80083c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800840:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800844:	48 8b 00             	mov    (%rax),%rax
  800847:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80084b:	e9 a3 00 00 00       	jmpq   8008f3 <getuint+0x10a>
  800850:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800854:	74 4f                	je     8008a5 <getuint+0xbc>
  800856:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80085a:	8b 00                	mov    (%rax),%eax
  80085c:	83 f8 30             	cmp    $0x30,%eax
  80085f:	73 24                	jae    800885 <getuint+0x9c>
  800861:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800865:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800869:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80086d:	8b 00                	mov    (%rax),%eax
  80086f:	89 c0                	mov    %eax,%eax
  800871:	48 01 d0             	add    %rdx,%rax
  800874:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800878:	8b 12                	mov    (%rdx),%edx
  80087a:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80087d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800881:	89 0a                	mov    %ecx,(%rdx)
  800883:	eb 17                	jmp    80089c <getuint+0xb3>
  800885:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800889:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80088d:	48 89 d0             	mov    %rdx,%rax
  800890:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800894:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800898:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80089c:	48 8b 00             	mov    (%rax),%rax
  80089f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8008a3:	eb 4e                	jmp    8008f3 <getuint+0x10a>
  8008a5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008a9:	8b 00                	mov    (%rax),%eax
  8008ab:	83 f8 30             	cmp    $0x30,%eax
  8008ae:	73 24                	jae    8008d4 <getuint+0xeb>
  8008b0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008b4:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8008b8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008bc:	8b 00                	mov    (%rax),%eax
  8008be:	89 c0                	mov    %eax,%eax
  8008c0:	48 01 d0             	add    %rdx,%rax
  8008c3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008c7:	8b 12                	mov    (%rdx),%edx
  8008c9:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8008cc:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008d0:	89 0a                	mov    %ecx,(%rdx)
  8008d2:	eb 17                	jmp    8008eb <getuint+0x102>
  8008d4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008d8:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8008dc:	48 89 d0             	mov    %rdx,%rax
  8008df:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8008e3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008e7:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8008eb:	8b 00                	mov    (%rax),%eax
  8008ed:	89 c0                	mov    %eax,%eax
  8008ef:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8008f3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8008f7:	c9                   	leaveq 
  8008f8:	c3                   	retq   

00000000008008f9 <getint>:
  8008f9:	55                   	push   %rbp
  8008fa:	48 89 e5             	mov    %rsp,%rbp
  8008fd:	48 83 ec 1c          	sub    $0x1c,%rsp
  800901:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800905:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800908:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  80090c:	7e 52                	jle    800960 <getint+0x67>
  80090e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800912:	8b 00                	mov    (%rax),%eax
  800914:	83 f8 30             	cmp    $0x30,%eax
  800917:	73 24                	jae    80093d <getint+0x44>
  800919:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80091d:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800921:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800925:	8b 00                	mov    (%rax),%eax
  800927:	89 c0                	mov    %eax,%eax
  800929:	48 01 d0             	add    %rdx,%rax
  80092c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800930:	8b 12                	mov    (%rdx),%edx
  800932:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800935:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800939:	89 0a                	mov    %ecx,(%rdx)
  80093b:	eb 17                	jmp    800954 <getint+0x5b>
  80093d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800941:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800945:	48 89 d0             	mov    %rdx,%rax
  800948:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  80094c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800950:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800954:	48 8b 00             	mov    (%rax),%rax
  800957:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80095b:	e9 a3 00 00 00       	jmpq   800a03 <getint+0x10a>
  800960:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800964:	74 4f                	je     8009b5 <getint+0xbc>
  800966:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80096a:	8b 00                	mov    (%rax),%eax
  80096c:	83 f8 30             	cmp    $0x30,%eax
  80096f:	73 24                	jae    800995 <getint+0x9c>
  800971:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800975:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800979:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80097d:	8b 00                	mov    (%rax),%eax
  80097f:	89 c0                	mov    %eax,%eax
  800981:	48 01 d0             	add    %rdx,%rax
  800984:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800988:	8b 12                	mov    (%rdx),%edx
  80098a:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80098d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800991:	89 0a                	mov    %ecx,(%rdx)
  800993:	eb 17                	jmp    8009ac <getint+0xb3>
  800995:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800999:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80099d:	48 89 d0             	mov    %rdx,%rax
  8009a0:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8009a4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009a8:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8009ac:	48 8b 00             	mov    (%rax),%rax
  8009af:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8009b3:	eb 4e                	jmp    800a03 <getint+0x10a>
  8009b5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009b9:	8b 00                	mov    (%rax),%eax
  8009bb:	83 f8 30             	cmp    $0x30,%eax
  8009be:	73 24                	jae    8009e4 <getint+0xeb>
  8009c0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009c4:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8009c8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009cc:	8b 00                	mov    (%rax),%eax
  8009ce:	89 c0                	mov    %eax,%eax
  8009d0:	48 01 d0             	add    %rdx,%rax
  8009d3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009d7:	8b 12                	mov    (%rdx),%edx
  8009d9:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8009dc:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009e0:	89 0a                	mov    %ecx,(%rdx)
  8009e2:	eb 17                	jmp    8009fb <getint+0x102>
  8009e4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009e8:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8009ec:	48 89 d0             	mov    %rdx,%rax
  8009ef:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8009f3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009f7:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8009fb:	8b 00                	mov    (%rax),%eax
  8009fd:	48 98                	cltq   
  8009ff:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800a03:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800a07:	c9                   	leaveq 
  800a08:	c3                   	retq   

0000000000800a09 <vprintfmt>:
  800a09:	55                   	push   %rbp
  800a0a:	48 89 e5             	mov    %rsp,%rbp
  800a0d:	41 54                	push   %r12
  800a0f:	53                   	push   %rbx
  800a10:	48 83 ec 60          	sub    $0x60,%rsp
  800a14:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  800a18:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  800a1c:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800a20:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  800a24:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800a28:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  800a2c:	48 8b 0a             	mov    (%rdx),%rcx
  800a2f:	48 89 08             	mov    %rcx,(%rax)
  800a32:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800a36:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800a3a:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800a3e:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800a42:	eb 17                	jmp    800a5b <vprintfmt+0x52>
  800a44:	85 db                	test   %ebx,%ebx
  800a46:	0f 84 cc 04 00 00    	je     800f18 <vprintfmt+0x50f>
  800a4c:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800a50:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a54:	48 89 d6             	mov    %rdx,%rsi
  800a57:	89 df                	mov    %ebx,%edi
  800a59:	ff d0                	callq  *%rax
  800a5b:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800a5f:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800a63:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800a67:	0f b6 00             	movzbl (%rax),%eax
  800a6a:	0f b6 d8             	movzbl %al,%ebx
  800a6d:	83 fb 25             	cmp    $0x25,%ebx
  800a70:	75 d2                	jne    800a44 <vprintfmt+0x3b>
  800a72:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  800a76:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  800a7d:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800a84:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800a8b:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  800a92:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800a96:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800a9a:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800a9e:	0f b6 00             	movzbl (%rax),%eax
  800aa1:	0f b6 d8             	movzbl %al,%ebx
  800aa4:	8d 43 dd             	lea    -0x23(%rbx),%eax
  800aa7:	83 f8 55             	cmp    $0x55,%eax
  800aaa:	0f 87 34 04 00 00    	ja     800ee4 <vprintfmt+0x4db>
  800ab0:	89 c0                	mov    %eax,%eax
  800ab2:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800ab9:	00 
  800aba:	48 b8 58 46 80 00 00 	movabs $0x804658,%rax
  800ac1:	00 00 00 
  800ac4:	48 01 d0             	add    %rdx,%rax
  800ac7:	48 8b 00             	mov    (%rax),%rax
  800aca:	ff e0                	jmpq   *%rax
  800acc:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  800ad0:	eb c0                	jmp    800a92 <vprintfmt+0x89>
  800ad2:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  800ad6:	eb ba                	jmp    800a92 <vprintfmt+0x89>
  800ad8:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  800adf:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800ae2:	89 d0                	mov    %edx,%eax
  800ae4:	c1 e0 02             	shl    $0x2,%eax
  800ae7:	01 d0                	add    %edx,%eax
  800ae9:	01 c0                	add    %eax,%eax
  800aeb:	01 d8                	add    %ebx,%eax
  800aed:	83 e8 30             	sub    $0x30,%eax
  800af0:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800af3:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800af7:	0f b6 00             	movzbl (%rax),%eax
  800afa:	0f be d8             	movsbl %al,%ebx
  800afd:	83 fb 2f             	cmp    $0x2f,%ebx
  800b00:	7e 0c                	jle    800b0e <vprintfmt+0x105>
  800b02:	83 fb 39             	cmp    $0x39,%ebx
  800b05:	7f 07                	jg     800b0e <vprintfmt+0x105>
  800b07:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  800b0c:	eb d1                	jmp    800adf <vprintfmt+0xd6>
  800b0e:	eb 58                	jmp    800b68 <vprintfmt+0x15f>
  800b10:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b13:	83 f8 30             	cmp    $0x30,%eax
  800b16:	73 17                	jae    800b2f <vprintfmt+0x126>
  800b18:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800b1c:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b1f:	89 c0                	mov    %eax,%eax
  800b21:	48 01 d0             	add    %rdx,%rax
  800b24:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b27:	83 c2 08             	add    $0x8,%edx
  800b2a:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800b2d:	eb 0f                	jmp    800b3e <vprintfmt+0x135>
  800b2f:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800b33:	48 89 d0             	mov    %rdx,%rax
  800b36:	48 83 c2 08          	add    $0x8,%rdx
  800b3a:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800b3e:	8b 00                	mov    (%rax),%eax
  800b40:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800b43:	eb 23                	jmp    800b68 <vprintfmt+0x15f>
  800b45:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800b49:	79 0c                	jns    800b57 <vprintfmt+0x14e>
  800b4b:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  800b52:	e9 3b ff ff ff       	jmpq   800a92 <vprintfmt+0x89>
  800b57:	e9 36 ff ff ff       	jmpq   800a92 <vprintfmt+0x89>
  800b5c:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  800b63:	e9 2a ff ff ff       	jmpq   800a92 <vprintfmt+0x89>
  800b68:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800b6c:	79 12                	jns    800b80 <vprintfmt+0x177>
  800b6e:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800b71:	89 45 dc             	mov    %eax,-0x24(%rbp)
  800b74:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800b7b:	e9 12 ff ff ff       	jmpq   800a92 <vprintfmt+0x89>
  800b80:	e9 0d ff ff ff       	jmpq   800a92 <vprintfmt+0x89>
  800b85:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  800b89:	e9 04 ff ff ff       	jmpq   800a92 <vprintfmt+0x89>
  800b8e:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b91:	83 f8 30             	cmp    $0x30,%eax
  800b94:	73 17                	jae    800bad <vprintfmt+0x1a4>
  800b96:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800b9a:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b9d:	89 c0                	mov    %eax,%eax
  800b9f:	48 01 d0             	add    %rdx,%rax
  800ba2:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800ba5:	83 c2 08             	add    $0x8,%edx
  800ba8:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800bab:	eb 0f                	jmp    800bbc <vprintfmt+0x1b3>
  800bad:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800bb1:	48 89 d0             	mov    %rdx,%rax
  800bb4:	48 83 c2 08          	add    $0x8,%rdx
  800bb8:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800bbc:	8b 10                	mov    (%rax),%edx
  800bbe:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800bc2:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800bc6:	48 89 ce             	mov    %rcx,%rsi
  800bc9:	89 d7                	mov    %edx,%edi
  800bcb:	ff d0                	callq  *%rax
  800bcd:	e9 40 03 00 00       	jmpq   800f12 <vprintfmt+0x509>
  800bd2:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800bd5:	83 f8 30             	cmp    $0x30,%eax
  800bd8:	73 17                	jae    800bf1 <vprintfmt+0x1e8>
  800bda:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800bde:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800be1:	89 c0                	mov    %eax,%eax
  800be3:	48 01 d0             	add    %rdx,%rax
  800be6:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800be9:	83 c2 08             	add    $0x8,%edx
  800bec:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800bef:	eb 0f                	jmp    800c00 <vprintfmt+0x1f7>
  800bf1:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800bf5:	48 89 d0             	mov    %rdx,%rax
  800bf8:	48 83 c2 08          	add    $0x8,%rdx
  800bfc:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800c00:	8b 18                	mov    (%rax),%ebx
  800c02:	85 db                	test   %ebx,%ebx
  800c04:	79 02                	jns    800c08 <vprintfmt+0x1ff>
  800c06:	f7 db                	neg    %ebx
  800c08:	83 fb 15             	cmp    $0x15,%ebx
  800c0b:	7f 16                	jg     800c23 <vprintfmt+0x21a>
  800c0d:	48 b8 80 45 80 00 00 	movabs $0x804580,%rax
  800c14:	00 00 00 
  800c17:	48 63 d3             	movslq %ebx,%rdx
  800c1a:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800c1e:	4d 85 e4             	test   %r12,%r12
  800c21:	75 2e                	jne    800c51 <vprintfmt+0x248>
  800c23:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800c27:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c2b:	89 d9                	mov    %ebx,%ecx
  800c2d:	48 ba 41 46 80 00 00 	movabs $0x804641,%rdx
  800c34:	00 00 00 
  800c37:	48 89 c7             	mov    %rax,%rdi
  800c3a:	b8 00 00 00 00       	mov    $0x0,%eax
  800c3f:	49 b8 21 0f 80 00 00 	movabs $0x800f21,%r8
  800c46:	00 00 00 
  800c49:	41 ff d0             	callq  *%r8
  800c4c:	e9 c1 02 00 00       	jmpq   800f12 <vprintfmt+0x509>
  800c51:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800c55:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c59:	4c 89 e1             	mov    %r12,%rcx
  800c5c:	48 ba 4a 46 80 00 00 	movabs $0x80464a,%rdx
  800c63:	00 00 00 
  800c66:	48 89 c7             	mov    %rax,%rdi
  800c69:	b8 00 00 00 00       	mov    $0x0,%eax
  800c6e:	49 b8 21 0f 80 00 00 	movabs $0x800f21,%r8
  800c75:	00 00 00 
  800c78:	41 ff d0             	callq  *%r8
  800c7b:	e9 92 02 00 00       	jmpq   800f12 <vprintfmt+0x509>
  800c80:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800c83:	83 f8 30             	cmp    $0x30,%eax
  800c86:	73 17                	jae    800c9f <vprintfmt+0x296>
  800c88:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800c8c:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800c8f:	89 c0                	mov    %eax,%eax
  800c91:	48 01 d0             	add    %rdx,%rax
  800c94:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800c97:	83 c2 08             	add    $0x8,%edx
  800c9a:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800c9d:	eb 0f                	jmp    800cae <vprintfmt+0x2a5>
  800c9f:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800ca3:	48 89 d0             	mov    %rdx,%rax
  800ca6:	48 83 c2 08          	add    $0x8,%rdx
  800caa:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800cae:	4c 8b 20             	mov    (%rax),%r12
  800cb1:	4d 85 e4             	test   %r12,%r12
  800cb4:	75 0a                	jne    800cc0 <vprintfmt+0x2b7>
  800cb6:	49 bc 4d 46 80 00 00 	movabs $0x80464d,%r12
  800cbd:	00 00 00 
  800cc0:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800cc4:	7e 3f                	jle    800d05 <vprintfmt+0x2fc>
  800cc6:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  800cca:	74 39                	je     800d05 <vprintfmt+0x2fc>
  800ccc:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800ccf:	48 98                	cltq   
  800cd1:	48 89 c6             	mov    %rax,%rsi
  800cd4:	4c 89 e7             	mov    %r12,%rdi
  800cd7:	48 b8 cd 11 80 00 00 	movabs $0x8011cd,%rax
  800cde:	00 00 00 
  800ce1:	ff d0                	callq  *%rax
  800ce3:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800ce6:	eb 17                	jmp    800cff <vprintfmt+0x2f6>
  800ce8:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800cec:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800cf0:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800cf4:	48 89 ce             	mov    %rcx,%rsi
  800cf7:	89 d7                	mov    %edx,%edi
  800cf9:	ff d0                	callq  *%rax
  800cfb:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800cff:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800d03:	7f e3                	jg     800ce8 <vprintfmt+0x2df>
  800d05:	eb 37                	jmp    800d3e <vprintfmt+0x335>
  800d07:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  800d0b:	74 1e                	je     800d2b <vprintfmt+0x322>
  800d0d:	83 fb 1f             	cmp    $0x1f,%ebx
  800d10:	7e 05                	jle    800d17 <vprintfmt+0x30e>
  800d12:	83 fb 7e             	cmp    $0x7e,%ebx
  800d15:	7e 14                	jle    800d2b <vprintfmt+0x322>
  800d17:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d1b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d1f:	48 89 d6             	mov    %rdx,%rsi
  800d22:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800d27:	ff d0                	callq  *%rax
  800d29:	eb 0f                	jmp    800d3a <vprintfmt+0x331>
  800d2b:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d2f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d33:	48 89 d6             	mov    %rdx,%rsi
  800d36:	89 df                	mov    %ebx,%edi
  800d38:	ff d0                	callq  *%rax
  800d3a:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800d3e:	4c 89 e0             	mov    %r12,%rax
  800d41:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800d45:	0f b6 00             	movzbl (%rax),%eax
  800d48:	0f be d8             	movsbl %al,%ebx
  800d4b:	85 db                	test   %ebx,%ebx
  800d4d:	74 10                	je     800d5f <vprintfmt+0x356>
  800d4f:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800d53:	78 b2                	js     800d07 <vprintfmt+0x2fe>
  800d55:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800d59:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800d5d:	79 a8                	jns    800d07 <vprintfmt+0x2fe>
  800d5f:	eb 16                	jmp    800d77 <vprintfmt+0x36e>
  800d61:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d65:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d69:	48 89 d6             	mov    %rdx,%rsi
  800d6c:	bf 20 00 00 00       	mov    $0x20,%edi
  800d71:	ff d0                	callq  *%rax
  800d73:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800d77:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800d7b:	7f e4                	jg     800d61 <vprintfmt+0x358>
  800d7d:	e9 90 01 00 00       	jmpq   800f12 <vprintfmt+0x509>
  800d82:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800d86:	be 03 00 00 00       	mov    $0x3,%esi
  800d8b:	48 89 c7             	mov    %rax,%rdi
  800d8e:	48 b8 f9 08 80 00 00 	movabs $0x8008f9,%rax
  800d95:	00 00 00 
  800d98:	ff d0                	callq  *%rax
  800d9a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800d9e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800da2:	48 85 c0             	test   %rax,%rax
  800da5:	79 1d                	jns    800dc4 <vprintfmt+0x3bb>
  800da7:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800dab:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800daf:	48 89 d6             	mov    %rdx,%rsi
  800db2:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800db7:	ff d0                	callq  *%rax
  800db9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800dbd:	48 f7 d8             	neg    %rax
  800dc0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800dc4:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800dcb:	e9 d5 00 00 00       	jmpq   800ea5 <vprintfmt+0x49c>
  800dd0:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800dd4:	be 03 00 00 00       	mov    $0x3,%esi
  800dd9:	48 89 c7             	mov    %rax,%rdi
  800ddc:	48 b8 e9 07 80 00 00 	movabs $0x8007e9,%rax
  800de3:	00 00 00 
  800de6:	ff d0                	callq  *%rax
  800de8:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800dec:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800df3:	e9 ad 00 00 00       	jmpq   800ea5 <vprintfmt+0x49c>
  800df8:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800dfc:	be 03 00 00 00       	mov    $0x3,%esi
  800e01:	48 89 c7             	mov    %rax,%rdi
  800e04:	48 b8 e9 07 80 00 00 	movabs $0x8007e9,%rax
  800e0b:	00 00 00 
  800e0e:	ff d0                	callq  *%rax
  800e10:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800e14:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800e1b:	e9 85 00 00 00       	jmpq   800ea5 <vprintfmt+0x49c>
  800e20:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800e24:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e28:	48 89 d6             	mov    %rdx,%rsi
  800e2b:	bf 30 00 00 00       	mov    $0x30,%edi
  800e30:	ff d0                	callq  *%rax
  800e32:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800e36:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e3a:	48 89 d6             	mov    %rdx,%rsi
  800e3d:	bf 78 00 00 00       	mov    $0x78,%edi
  800e42:	ff d0                	callq  *%rax
  800e44:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800e47:	83 f8 30             	cmp    $0x30,%eax
  800e4a:	73 17                	jae    800e63 <vprintfmt+0x45a>
  800e4c:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800e50:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800e53:	89 c0                	mov    %eax,%eax
  800e55:	48 01 d0             	add    %rdx,%rax
  800e58:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800e5b:	83 c2 08             	add    $0x8,%edx
  800e5e:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800e61:	eb 0f                	jmp    800e72 <vprintfmt+0x469>
  800e63:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800e67:	48 89 d0             	mov    %rdx,%rax
  800e6a:	48 83 c2 08          	add    $0x8,%rdx
  800e6e:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800e72:	48 8b 00             	mov    (%rax),%rax
  800e75:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800e79:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800e80:	eb 23                	jmp    800ea5 <vprintfmt+0x49c>
  800e82:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800e86:	be 03 00 00 00       	mov    $0x3,%esi
  800e8b:	48 89 c7             	mov    %rax,%rdi
  800e8e:	48 b8 e9 07 80 00 00 	movabs $0x8007e9,%rax
  800e95:	00 00 00 
  800e98:	ff d0                	callq  *%rax
  800e9a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800e9e:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800ea5:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  800eaa:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800ead:	8b 7d dc             	mov    -0x24(%rbp),%edi
  800eb0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800eb4:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800eb8:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ebc:	45 89 c1             	mov    %r8d,%r9d
  800ebf:	41 89 f8             	mov    %edi,%r8d
  800ec2:	48 89 c7             	mov    %rax,%rdi
  800ec5:	48 b8 2e 07 80 00 00 	movabs $0x80072e,%rax
  800ecc:	00 00 00 
  800ecf:	ff d0                	callq  *%rax
  800ed1:	eb 3f                	jmp    800f12 <vprintfmt+0x509>
  800ed3:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800ed7:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800edb:	48 89 d6             	mov    %rdx,%rsi
  800ede:	89 df                	mov    %ebx,%edi
  800ee0:	ff d0                	callq  *%rax
  800ee2:	eb 2e                	jmp    800f12 <vprintfmt+0x509>
  800ee4:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800ee8:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800eec:	48 89 d6             	mov    %rdx,%rsi
  800eef:	bf 25 00 00 00       	mov    $0x25,%edi
  800ef4:	ff d0                	callq  *%rax
  800ef6:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800efb:	eb 05                	jmp    800f02 <vprintfmt+0x4f9>
  800efd:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800f02:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800f06:	48 83 e8 01          	sub    $0x1,%rax
  800f0a:	0f b6 00             	movzbl (%rax),%eax
  800f0d:	3c 25                	cmp    $0x25,%al
  800f0f:	75 ec                	jne    800efd <vprintfmt+0x4f4>
  800f11:	90                   	nop
  800f12:	90                   	nop
  800f13:	e9 43 fb ff ff       	jmpq   800a5b <vprintfmt+0x52>
  800f18:	48 83 c4 60          	add    $0x60,%rsp
  800f1c:	5b                   	pop    %rbx
  800f1d:	41 5c                	pop    %r12
  800f1f:	5d                   	pop    %rbp
  800f20:	c3                   	retq   

0000000000800f21 <printfmt>:
  800f21:	55                   	push   %rbp
  800f22:	48 89 e5             	mov    %rsp,%rbp
  800f25:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  800f2c:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  800f33:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  800f3a:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800f41:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800f48:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800f4f:	84 c0                	test   %al,%al
  800f51:	74 20                	je     800f73 <printfmt+0x52>
  800f53:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800f57:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800f5b:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800f5f:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800f63:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800f67:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800f6b:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800f6f:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800f73:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  800f7a:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  800f81:	00 00 00 
  800f84:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  800f8b:	00 00 00 
  800f8e:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800f92:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800f99:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800fa0:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  800fa7:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  800fae:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800fb5:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  800fbc:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  800fc3:	48 89 c7             	mov    %rax,%rdi
  800fc6:	48 b8 09 0a 80 00 00 	movabs $0x800a09,%rax
  800fcd:	00 00 00 
  800fd0:	ff d0                	callq  *%rax
  800fd2:	c9                   	leaveq 
  800fd3:	c3                   	retq   

0000000000800fd4 <sprintputch>:
  800fd4:	55                   	push   %rbp
  800fd5:	48 89 e5             	mov    %rsp,%rbp
  800fd8:	48 83 ec 10          	sub    $0x10,%rsp
  800fdc:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800fdf:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800fe3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800fe7:	8b 40 10             	mov    0x10(%rax),%eax
  800fea:	8d 50 01             	lea    0x1(%rax),%edx
  800fed:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800ff1:	89 50 10             	mov    %edx,0x10(%rax)
  800ff4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800ff8:	48 8b 10             	mov    (%rax),%rdx
  800ffb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800fff:	48 8b 40 08          	mov    0x8(%rax),%rax
  801003:	48 39 c2             	cmp    %rax,%rdx
  801006:	73 17                	jae    80101f <sprintputch+0x4b>
  801008:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80100c:	48 8b 00             	mov    (%rax),%rax
  80100f:	48 8d 48 01          	lea    0x1(%rax),%rcx
  801013:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801017:	48 89 0a             	mov    %rcx,(%rdx)
  80101a:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80101d:	88 10                	mov    %dl,(%rax)
  80101f:	c9                   	leaveq 
  801020:	c3                   	retq   

0000000000801021 <vsnprintf>:
  801021:	55                   	push   %rbp
  801022:	48 89 e5             	mov    %rsp,%rbp
  801025:	48 83 ec 50          	sub    $0x50,%rsp
  801029:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  80102d:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  801030:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  801034:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  801038:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  80103c:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  801040:	48 8b 0a             	mov    (%rdx),%rcx
  801043:	48 89 08             	mov    %rcx,(%rax)
  801046:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80104a:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80104e:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801052:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801056:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80105a:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  80105e:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  801061:	48 98                	cltq   
  801063:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801067:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80106b:	48 01 d0             	add    %rdx,%rax
  80106e:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  801072:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  801079:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  80107e:	74 06                	je     801086 <vsnprintf+0x65>
  801080:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  801084:	7f 07                	jg     80108d <vsnprintf+0x6c>
  801086:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80108b:	eb 2f                	jmp    8010bc <vsnprintf+0x9b>
  80108d:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  801091:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  801095:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  801099:	48 89 c6             	mov    %rax,%rsi
  80109c:	48 bf d4 0f 80 00 00 	movabs $0x800fd4,%rdi
  8010a3:	00 00 00 
  8010a6:	48 b8 09 0a 80 00 00 	movabs $0x800a09,%rax
  8010ad:	00 00 00 
  8010b0:	ff d0                	callq  *%rax
  8010b2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8010b6:	c6 00 00             	movb   $0x0,(%rax)
  8010b9:	8b 45 e0             	mov    -0x20(%rbp),%eax
  8010bc:	c9                   	leaveq 
  8010bd:	c3                   	retq   

00000000008010be <snprintf>:
  8010be:	55                   	push   %rbp
  8010bf:	48 89 e5             	mov    %rsp,%rbp
  8010c2:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  8010c9:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  8010d0:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  8010d6:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8010dd:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8010e4:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8010eb:	84 c0                	test   %al,%al
  8010ed:	74 20                	je     80110f <snprintf+0x51>
  8010ef:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8010f3:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8010f7:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8010fb:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8010ff:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  801103:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  801107:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  80110b:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  80110f:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  801116:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  80111d:	00 00 00 
  801120:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  801127:	00 00 00 
  80112a:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80112e:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  801135:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  80113c:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  801143:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  80114a:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  801151:	48 8b 0a             	mov    (%rdx),%rcx
  801154:	48 89 08             	mov    %rcx,(%rax)
  801157:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80115b:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80115f:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801163:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801167:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  80116e:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  801175:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  80117b:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  801182:	48 89 c7             	mov    %rax,%rdi
  801185:	48 b8 21 10 80 00 00 	movabs $0x801021,%rax
  80118c:	00 00 00 
  80118f:	ff d0                	callq  *%rax
  801191:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  801197:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  80119d:	c9                   	leaveq 
  80119e:	c3                   	retq   

000000000080119f <strlen>:
  80119f:	55                   	push   %rbp
  8011a0:	48 89 e5             	mov    %rsp,%rbp
  8011a3:	48 83 ec 18          	sub    $0x18,%rsp
  8011a7:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8011ab:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8011b2:	eb 09                	jmp    8011bd <strlen+0x1e>
  8011b4:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8011b8:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8011bd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011c1:	0f b6 00             	movzbl (%rax),%eax
  8011c4:	84 c0                	test   %al,%al
  8011c6:	75 ec                	jne    8011b4 <strlen+0x15>
  8011c8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8011cb:	c9                   	leaveq 
  8011cc:	c3                   	retq   

00000000008011cd <strnlen>:
  8011cd:	55                   	push   %rbp
  8011ce:	48 89 e5             	mov    %rsp,%rbp
  8011d1:	48 83 ec 20          	sub    $0x20,%rsp
  8011d5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8011d9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8011dd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8011e4:	eb 0e                	jmp    8011f4 <strnlen+0x27>
  8011e6:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8011ea:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8011ef:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  8011f4:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8011f9:	74 0b                	je     801206 <strnlen+0x39>
  8011fb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011ff:	0f b6 00             	movzbl (%rax),%eax
  801202:	84 c0                	test   %al,%al
  801204:	75 e0                	jne    8011e6 <strnlen+0x19>
  801206:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801209:	c9                   	leaveq 
  80120a:	c3                   	retq   

000000000080120b <strcpy>:
  80120b:	55                   	push   %rbp
  80120c:	48 89 e5             	mov    %rsp,%rbp
  80120f:	48 83 ec 20          	sub    $0x20,%rsp
  801213:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801217:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80121b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80121f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801223:	90                   	nop
  801224:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801228:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80122c:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801230:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801234:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801238:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  80123c:	0f b6 12             	movzbl (%rdx),%edx
  80123f:	88 10                	mov    %dl,(%rax)
  801241:	0f b6 00             	movzbl (%rax),%eax
  801244:	84 c0                	test   %al,%al
  801246:	75 dc                	jne    801224 <strcpy+0x19>
  801248:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80124c:	c9                   	leaveq 
  80124d:	c3                   	retq   

000000000080124e <strcat>:
  80124e:	55                   	push   %rbp
  80124f:	48 89 e5             	mov    %rsp,%rbp
  801252:	48 83 ec 20          	sub    $0x20,%rsp
  801256:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80125a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80125e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801262:	48 89 c7             	mov    %rax,%rdi
  801265:	48 b8 9f 11 80 00 00 	movabs $0x80119f,%rax
  80126c:	00 00 00 
  80126f:	ff d0                	callq  *%rax
  801271:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801274:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801277:	48 63 d0             	movslq %eax,%rdx
  80127a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80127e:	48 01 c2             	add    %rax,%rdx
  801281:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801285:	48 89 c6             	mov    %rax,%rsi
  801288:	48 89 d7             	mov    %rdx,%rdi
  80128b:	48 b8 0b 12 80 00 00 	movabs $0x80120b,%rax
  801292:	00 00 00 
  801295:	ff d0                	callq  *%rax
  801297:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80129b:	c9                   	leaveq 
  80129c:	c3                   	retq   

000000000080129d <strncpy>:
  80129d:	55                   	push   %rbp
  80129e:	48 89 e5             	mov    %rsp,%rbp
  8012a1:	48 83 ec 28          	sub    $0x28,%rsp
  8012a5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8012a9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8012ad:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8012b1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012b5:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8012b9:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8012c0:	00 
  8012c1:	eb 2a                	jmp    8012ed <strncpy+0x50>
  8012c3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012c7:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8012cb:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8012cf:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8012d3:	0f b6 12             	movzbl (%rdx),%edx
  8012d6:	88 10                	mov    %dl,(%rax)
  8012d8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8012dc:	0f b6 00             	movzbl (%rax),%eax
  8012df:	84 c0                	test   %al,%al
  8012e1:	74 05                	je     8012e8 <strncpy+0x4b>
  8012e3:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  8012e8:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8012ed:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012f1:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8012f5:	72 cc                	jb     8012c3 <strncpy+0x26>
  8012f7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012fb:	c9                   	leaveq 
  8012fc:	c3                   	retq   

00000000008012fd <strlcpy>:
  8012fd:	55                   	push   %rbp
  8012fe:	48 89 e5             	mov    %rsp,%rbp
  801301:	48 83 ec 28          	sub    $0x28,%rsp
  801305:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801309:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80130d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801311:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801315:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801319:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80131e:	74 3d                	je     80135d <strlcpy+0x60>
  801320:	eb 1d                	jmp    80133f <strlcpy+0x42>
  801322:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801326:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80132a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80132e:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801332:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801336:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  80133a:	0f b6 12             	movzbl (%rdx),%edx
  80133d:	88 10                	mov    %dl,(%rax)
  80133f:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  801344:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801349:	74 0b                	je     801356 <strlcpy+0x59>
  80134b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80134f:	0f b6 00             	movzbl (%rax),%eax
  801352:	84 c0                	test   %al,%al
  801354:	75 cc                	jne    801322 <strlcpy+0x25>
  801356:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80135a:	c6 00 00             	movb   $0x0,(%rax)
  80135d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801361:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801365:	48 29 c2             	sub    %rax,%rdx
  801368:	48 89 d0             	mov    %rdx,%rax
  80136b:	c9                   	leaveq 
  80136c:	c3                   	retq   

000000000080136d <strcmp>:
  80136d:	55                   	push   %rbp
  80136e:	48 89 e5             	mov    %rsp,%rbp
  801371:	48 83 ec 10          	sub    $0x10,%rsp
  801375:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801379:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80137d:	eb 0a                	jmp    801389 <strcmp+0x1c>
  80137f:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801384:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801389:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80138d:	0f b6 00             	movzbl (%rax),%eax
  801390:	84 c0                	test   %al,%al
  801392:	74 12                	je     8013a6 <strcmp+0x39>
  801394:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801398:	0f b6 10             	movzbl (%rax),%edx
  80139b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80139f:	0f b6 00             	movzbl (%rax),%eax
  8013a2:	38 c2                	cmp    %al,%dl
  8013a4:	74 d9                	je     80137f <strcmp+0x12>
  8013a6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013aa:	0f b6 00             	movzbl (%rax),%eax
  8013ad:	0f b6 d0             	movzbl %al,%edx
  8013b0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8013b4:	0f b6 00             	movzbl (%rax),%eax
  8013b7:	0f b6 c0             	movzbl %al,%eax
  8013ba:	29 c2                	sub    %eax,%edx
  8013bc:	89 d0                	mov    %edx,%eax
  8013be:	c9                   	leaveq 
  8013bf:	c3                   	retq   

00000000008013c0 <strncmp>:
  8013c0:	55                   	push   %rbp
  8013c1:	48 89 e5             	mov    %rsp,%rbp
  8013c4:	48 83 ec 18          	sub    $0x18,%rsp
  8013c8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8013cc:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8013d0:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8013d4:	eb 0f                	jmp    8013e5 <strncmp+0x25>
  8013d6:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  8013db:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8013e0:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8013e5:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8013ea:	74 1d                	je     801409 <strncmp+0x49>
  8013ec:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013f0:	0f b6 00             	movzbl (%rax),%eax
  8013f3:	84 c0                	test   %al,%al
  8013f5:	74 12                	je     801409 <strncmp+0x49>
  8013f7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013fb:	0f b6 10             	movzbl (%rax),%edx
  8013fe:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801402:	0f b6 00             	movzbl (%rax),%eax
  801405:	38 c2                	cmp    %al,%dl
  801407:	74 cd                	je     8013d6 <strncmp+0x16>
  801409:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80140e:	75 07                	jne    801417 <strncmp+0x57>
  801410:	b8 00 00 00 00       	mov    $0x0,%eax
  801415:	eb 18                	jmp    80142f <strncmp+0x6f>
  801417:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80141b:	0f b6 00             	movzbl (%rax),%eax
  80141e:	0f b6 d0             	movzbl %al,%edx
  801421:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801425:	0f b6 00             	movzbl (%rax),%eax
  801428:	0f b6 c0             	movzbl %al,%eax
  80142b:	29 c2                	sub    %eax,%edx
  80142d:	89 d0                	mov    %edx,%eax
  80142f:	c9                   	leaveq 
  801430:	c3                   	retq   

0000000000801431 <strchr>:
  801431:	55                   	push   %rbp
  801432:	48 89 e5             	mov    %rsp,%rbp
  801435:	48 83 ec 0c          	sub    $0xc,%rsp
  801439:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80143d:	89 f0                	mov    %esi,%eax
  80143f:	88 45 f4             	mov    %al,-0xc(%rbp)
  801442:	eb 17                	jmp    80145b <strchr+0x2a>
  801444:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801448:	0f b6 00             	movzbl (%rax),%eax
  80144b:	3a 45 f4             	cmp    -0xc(%rbp),%al
  80144e:	75 06                	jne    801456 <strchr+0x25>
  801450:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801454:	eb 15                	jmp    80146b <strchr+0x3a>
  801456:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80145b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80145f:	0f b6 00             	movzbl (%rax),%eax
  801462:	84 c0                	test   %al,%al
  801464:	75 de                	jne    801444 <strchr+0x13>
  801466:	b8 00 00 00 00       	mov    $0x0,%eax
  80146b:	c9                   	leaveq 
  80146c:	c3                   	retq   

000000000080146d <strfind>:
  80146d:	55                   	push   %rbp
  80146e:	48 89 e5             	mov    %rsp,%rbp
  801471:	48 83 ec 0c          	sub    $0xc,%rsp
  801475:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801479:	89 f0                	mov    %esi,%eax
  80147b:	88 45 f4             	mov    %al,-0xc(%rbp)
  80147e:	eb 13                	jmp    801493 <strfind+0x26>
  801480:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801484:	0f b6 00             	movzbl (%rax),%eax
  801487:	3a 45 f4             	cmp    -0xc(%rbp),%al
  80148a:	75 02                	jne    80148e <strfind+0x21>
  80148c:	eb 10                	jmp    80149e <strfind+0x31>
  80148e:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801493:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801497:	0f b6 00             	movzbl (%rax),%eax
  80149a:	84 c0                	test   %al,%al
  80149c:	75 e2                	jne    801480 <strfind+0x13>
  80149e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014a2:	c9                   	leaveq 
  8014a3:	c3                   	retq   

00000000008014a4 <memset>:
  8014a4:	55                   	push   %rbp
  8014a5:	48 89 e5             	mov    %rsp,%rbp
  8014a8:	48 83 ec 18          	sub    $0x18,%rsp
  8014ac:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8014b0:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8014b3:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8014b7:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8014bc:	75 06                	jne    8014c4 <memset+0x20>
  8014be:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014c2:	eb 69                	jmp    80152d <memset+0x89>
  8014c4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014c8:	83 e0 03             	and    $0x3,%eax
  8014cb:	48 85 c0             	test   %rax,%rax
  8014ce:	75 48                	jne    801518 <memset+0x74>
  8014d0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014d4:	83 e0 03             	and    $0x3,%eax
  8014d7:	48 85 c0             	test   %rax,%rax
  8014da:	75 3c                	jne    801518 <memset+0x74>
  8014dc:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  8014e3:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8014e6:	c1 e0 18             	shl    $0x18,%eax
  8014e9:	89 c2                	mov    %eax,%edx
  8014eb:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8014ee:	c1 e0 10             	shl    $0x10,%eax
  8014f1:	09 c2                	or     %eax,%edx
  8014f3:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8014f6:	c1 e0 08             	shl    $0x8,%eax
  8014f9:	09 d0                	or     %edx,%eax
  8014fb:	09 45 f4             	or     %eax,-0xc(%rbp)
  8014fe:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801502:	48 c1 e8 02          	shr    $0x2,%rax
  801506:	48 89 c1             	mov    %rax,%rcx
  801509:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80150d:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801510:	48 89 d7             	mov    %rdx,%rdi
  801513:	fc                   	cld    
  801514:	f3 ab                	rep stos %eax,%es:(%rdi)
  801516:	eb 11                	jmp    801529 <memset+0x85>
  801518:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80151c:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80151f:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801523:	48 89 d7             	mov    %rdx,%rdi
  801526:	fc                   	cld    
  801527:	f3 aa                	rep stos %al,%es:(%rdi)
  801529:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80152d:	c9                   	leaveq 
  80152e:	c3                   	retq   

000000000080152f <memmove>:
  80152f:	55                   	push   %rbp
  801530:	48 89 e5             	mov    %rsp,%rbp
  801533:	48 83 ec 28          	sub    $0x28,%rsp
  801537:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80153b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80153f:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801543:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801547:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80154b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80154f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801553:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801557:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  80155b:	0f 83 88 00 00 00    	jae    8015e9 <memmove+0xba>
  801561:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801565:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801569:	48 01 d0             	add    %rdx,%rax
  80156c:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801570:	76 77                	jbe    8015e9 <memmove+0xba>
  801572:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801576:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  80157a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80157e:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  801582:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801586:	83 e0 03             	and    $0x3,%eax
  801589:	48 85 c0             	test   %rax,%rax
  80158c:	75 3b                	jne    8015c9 <memmove+0x9a>
  80158e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801592:	83 e0 03             	and    $0x3,%eax
  801595:	48 85 c0             	test   %rax,%rax
  801598:	75 2f                	jne    8015c9 <memmove+0x9a>
  80159a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80159e:	83 e0 03             	and    $0x3,%eax
  8015a1:	48 85 c0             	test   %rax,%rax
  8015a4:	75 23                	jne    8015c9 <memmove+0x9a>
  8015a6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015aa:	48 83 e8 04          	sub    $0x4,%rax
  8015ae:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8015b2:	48 83 ea 04          	sub    $0x4,%rdx
  8015b6:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  8015ba:	48 c1 e9 02          	shr    $0x2,%rcx
  8015be:	48 89 c7             	mov    %rax,%rdi
  8015c1:	48 89 d6             	mov    %rdx,%rsi
  8015c4:	fd                   	std    
  8015c5:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  8015c7:	eb 1d                	jmp    8015e6 <memmove+0xb7>
  8015c9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015cd:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8015d1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015d5:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  8015d9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015dd:	48 89 d7             	mov    %rdx,%rdi
  8015e0:	48 89 c1             	mov    %rax,%rcx
  8015e3:	fd                   	std    
  8015e4:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  8015e6:	fc                   	cld    
  8015e7:	eb 57                	jmp    801640 <memmove+0x111>
  8015e9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015ed:	83 e0 03             	and    $0x3,%eax
  8015f0:	48 85 c0             	test   %rax,%rax
  8015f3:	75 36                	jne    80162b <memmove+0xfc>
  8015f5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015f9:	83 e0 03             	and    $0x3,%eax
  8015fc:	48 85 c0             	test   %rax,%rax
  8015ff:	75 2a                	jne    80162b <memmove+0xfc>
  801601:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801605:	83 e0 03             	and    $0x3,%eax
  801608:	48 85 c0             	test   %rax,%rax
  80160b:	75 1e                	jne    80162b <memmove+0xfc>
  80160d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801611:	48 c1 e8 02          	shr    $0x2,%rax
  801615:	48 89 c1             	mov    %rax,%rcx
  801618:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80161c:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801620:	48 89 c7             	mov    %rax,%rdi
  801623:	48 89 d6             	mov    %rdx,%rsi
  801626:	fc                   	cld    
  801627:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801629:	eb 15                	jmp    801640 <memmove+0x111>
  80162b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80162f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801633:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801637:	48 89 c7             	mov    %rax,%rdi
  80163a:	48 89 d6             	mov    %rdx,%rsi
  80163d:	fc                   	cld    
  80163e:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801640:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801644:	c9                   	leaveq 
  801645:	c3                   	retq   

0000000000801646 <memcpy>:
  801646:	55                   	push   %rbp
  801647:	48 89 e5             	mov    %rsp,%rbp
  80164a:	48 83 ec 18          	sub    $0x18,%rsp
  80164e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801652:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801656:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80165a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80165e:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  801662:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801666:	48 89 ce             	mov    %rcx,%rsi
  801669:	48 89 c7             	mov    %rax,%rdi
  80166c:	48 b8 2f 15 80 00 00 	movabs $0x80152f,%rax
  801673:	00 00 00 
  801676:	ff d0                	callq  *%rax
  801678:	c9                   	leaveq 
  801679:	c3                   	retq   

000000000080167a <memcmp>:
  80167a:	55                   	push   %rbp
  80167b:	48 89 e5             	mov    %rsp,%rbp
  80167e:	48 83 ec 28          	sub    $0x28,%rsp
  801682:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801686:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80168a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80168e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801692:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801696:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80169a:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80169e:	eb 36                	jmp    8016d6 <memcmp+0x5c>
  8016a0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016a4:	0f b6 10             	movzbl (%rax),%edx
  8016a7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8016ab:	0f b6 00             	movzbl (%rax),%eax
  8016ae:	38 c2                	cmp    %al,%dl
  8016b0:	74 1a                	je     8016cc <memcmp+0x52>
  8016b2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016b6:	0f b6 00             	movzbl (%rax),%eax
  8016b9:	0f b6 d0             	movzbl %al,%edx
  8016bc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8016c0:	0f b6 00             	movzbl (%rax),%eax
  8016c3:	0f b6 c0             	movzbl %al,%eax
  8016c6:	29 c2                	sub    %eax,%edx
  8016c8:	89 d0                	mov    %edx,%eax
  8016ca:	eb 20                	jmp    8016ec <memcmp+0x72>
  8016cc:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8016d1:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8016d6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016da:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8016de:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8016e2:	48 85 c0             	test   %rax,%rax
  8016e5:	75 b9                	jne    8016a0 <memcmp+0x26>
  8016e7:	b8 00 00 00 00       	mov    $0x0,%eax
  8016ec:	c9                   	leaveq 
  8016ed:	c3                   	retq   

00000000008016ee <memfind>:
  8016ee:	55                   	push   %rbp
  8016ef:	48 89 e5             	mov    %rsp,%rbp
  8016f2:	48 83 ec 28          	sub    $0x28,%rsp
  8016f6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8016fa:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8016fd:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801701:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801705:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801709:	48 01 d0             	add    %rdx,%rax
  80170c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801710:	eb 15                	jmp    801727 <memfind+0x39>
  801712:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801716:	0f b6 10             	movzbl (%rax),%edx
  801719:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80171c:	38 c2                	cmp    %al,%dl
  80171e:	75 02                	jne    801722 <memfind+0x34>
  801720:	eb 0f                	jmp    801731 <memfind+0x43>
  801722:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801727:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80172b:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  80172f:	72 e1                	jb     801712 <memfind+0x24>
  801731:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801735:	c9                   	leaveq 
  801736:	c3                   	retq   

0000000000801737 <strtol>:
  801737:	55                   	push   %rbp
  801738:	48 89 e5             	mov    %rsp,%rbp
  80173b:	48 83 ec 34          	sub    $0x34,%rsp
  80173f:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801743:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801747:	89 55 cc             	mov    %edx,-0x34(%rbp)
  80174a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801751:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  801758:	00 
  801759:	eb 05                	jmp    801760 <strtol+0x29>
  80175b:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801760:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801764:	0f b6 00             	movzbl (%rax),%eax
  801767:	3c 20                	cmp    $0x20,%al
  801769:	74 f0                	je     80175b <strtol+0x24>
  80176b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80176f:	0f b6 00             	movzbl (%rax),%eax
  801772:	3c 09                	cmp    $0x9,%al
  801774:	74 e5                	je     80175b <strtol+0x24>
  801776:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80177a:	0f b6 00             	movzbl (%rax),%eax
  80177d:	3c 2b                	cmp    $0x2b,%al
  80177f:	75 07                	jne    801788 <strtol+0x51>
  801781:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801786:	eb 17                	jmp    80179f <strtol+0x68>
  801788:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80178c:	0f b6 00             	movzbl (%rax),%eax
  80178f:	3c 2d                	cmp    $0x2d,%al
  801791:	75 0c                	jne    80179f <strtol+0x68>
  801793:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801798:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  80179f:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8017a3:	74 06                	je     8017ab <strtol+0x74>
  8017a5:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  8017a9:	75 28                	jne    8017d3 <strtol+0x9c>
  8017ab:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017af:	0f b6 00             	movzbl (%rax),%eax
  8017b2:	3c 30                	cmp    $0x30,%al
  8017b4:	75 1d                	jne    8017d3 <strtol+0x9c>
  8017b6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017ba:	48 83 c0 01          	add    $0x1,%rax
  8017be:	0f b6 00             	movzbl (%rax),%eax
  8017c1:	3c 78                	cmp    $0x78,%al
  8017c3:	75 0e                	jne    8017d3 <strtol+0x9c>
  8017c5:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  8017ca:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  8017d1:	eb 2c                	jmp    8017ff <strtol+0xc8>
  8017d3:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8017d7:	75 19                	jne    8017f2 <strtol+0xbb>
  8017d9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017dd:	0f b6 00             	movzbl (%rax),%eax
  8017e0:	3c 30                	cmp    $0x30,%al
  8017e2:	75 0e                	jne    8017f2 <strtol+0xbb>
  8017e4:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8017e9:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  8017f0:	eb 0d                	jmp    8017ff <strtol+0xc8>
  8017f2:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8017f6:	75 07                	jne    8017ff <strtol+0xc8>
  8017f8:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  8017ff:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801803:	0f b6 00             	movzbl (%rax),%eax
  801806:	3c 2f                	cmp    $0x2f,%al
  801808:	7e 1d                	jle    801827 <strtol+0xf0>
  80180a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80180e:	0f b6 00             	movzbl (%rax),%eax
  801811:	3c 39                	cmp    $0x39,%al
  801813:	7f 12                	jg     801827 <strtol+0xf0>
  801815:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801819:	0f b6 00             	movzbl (%rax),%eax
  80181c:	0f be c0             	movsbl %al,%eax
  80181f:	83 e8 30             	sub    $0x30,%eax
  801822:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801825:	eb 4e                	jmp    801875 <strtol+0x13e>
  801827:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80182b:	0f b6 00             	movzbl (%rax),%eax
  80182e:	3c 60                	cmp    $0x60,%al
  801830:	7e 1d                	jle    80184f <strtol+0x118>
  801832:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801836:	0f b6 00             	movzbl (%rax),%eax
  801839:	3c 7a                	cmp    $0x7a,%al
  80183b:	7f 12                	jg     80184f <strtol+0x118>
  80183d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801841:	0f b6 00             	movzbl (%rax),%eax
  801844:	0f be c0             	movsbl %al,%eax
  801847:	83 e8 57             	sub    $0x57,%eax
  80184a:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80184d:	eb 26                	jmp    801875 <strtol+0x13e>
  80184f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801853:	0f b6 00             	movzbl (%rax),%eax
  801856:	3c 40                	cmp    $0x40,%al
  801858:	7e 48                	jle    8018a2 <strtol+0x16b>
  80185a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80185e:	0f b6 00             	movzbl (%rax),%eax
  801861:	3c 5a                	cmp    $0x5a,%al
  801863:	7f 3d                	jg     8018a2 <strtol+0x16b>
  801865:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801869:	0f b6 00             	movzbl (%rax),%eax
  80186c:	0f be c0             	movsbl %al,%eax
  80186f:	83 e8 37             	sub    $0x37,%eax
  801872:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801875:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801878:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  80187b:	7c 02                	jl     80187f <strtol+0x148>
  80187d:	eb 23                	jmp    8018a2 <strtol+0x16b>
  80187f:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801884:	8b 45 cc             	mov    -0x34(%rbp),%eax
  801887:	48 98                	cltq   
  801889:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  80188e:	48 89 c2             	mov    %rax,%rdx
  801891:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801894:	48 98                	cltq   
  801896:	48 01 d0             	add    %rdx,%rax
  801899:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80189d:	e9 5d ff ff ff       	jmpq   8017ff <strtol+0xc8>
  8018a2:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  8018a7:	74 0b                	je     8018b4 <strtol+0x17d>
  8018a9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8018ad:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8018b1:	48 89 10             	mov    %rdx,(%rax)
  8018b4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8018b8:	74 09                	je     8018c3 <strtol+0x18c>
  8018ba:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8018be:	48 f7 d8             	neg    %rax
  8018c1:	eb 04                	jmp    8018c7 <strtol+0x190>
  8018c3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8018c7:	c9                   	leaveq 
  8018c8:	c3                   	retq   

00000000008018c9 <strstr>:
  8018c9:	55                   	push   %rbp
  8018ca:	48 89 e5             	mov    %rsp,%rbp
  8018cd:	48 83 ec 30          	sub    $0x30,%rsp
  8018d1:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8018d5:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8018d9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8018dd:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8018e1:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  8018e5:	0f b6 00             	movzbl (%rax),%eax
  8018e8:	88 45 ff             	mov    %al,-0x1(%rbp)
  8018eb:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  8018ef:	75 06                	jne    8018f7 <strstr+0x2e>
  8018f1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018f5:	eb 6b                	jmp    801962 <strstr+0x99>
  8018f7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8018fb:	48 89 c7             	mov    %rax,%rdi
  8018fe:	48 b8 9f 11 80 00 00 	movabs $0x80119f,%rax
  801905:	00 00 00 
  801908:	ff d0                	callq  *%rax
  80190a:	48 98                	cltq   
  80190c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801910:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801914:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801918:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80191c:	0f b6 00             	movzbl (%rax),%eax
  80191f:	88 45 ef             	mov    %al,-0x11(%rbp)
  801922:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  801926:	75 07                	jne    80192f <strstr+0x66>
  801928:	b8 00 00 00 00       	mov    $0x0,%eax
  80192d:	eb 33                	jmp    801962 <strstr+0x99>
  80192f:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  801933:	3a 45 ff             	cmp    -0x1(%rbp),%al
  801936:	75 d8                	jne    801910 <strstr+0x47>
  801938:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80193c:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  801940:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801944:	48 89 ce             	mov    %rcx,%rsi
  801947:	48 89 c7             	mov    %rax,%rdi
  80194a:	48 b8 c0 13 80 00 00 	movabs $0x8013c0,%rax
  801951:	00 00 00 
  801954:	ff d0                	callq  *%rax
  801956:	85 c0                	test   %eax,%eax
  801958:	75 b6                	jne    801910 <strstr+0x47>
  80195a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80195e:	48 83 e8 01          	sub    $0x1,%rax
  801962:	c9                   	leaveq 
  801963:	c3                   	retq   

0000000000801964 <syscall>:
  801964:	55                   	push   %rbp
  801965:	48 89 e5             	mov    %rsp,%rbp
  801968:	53                   	push   %rbx
  801969:	48 83 ec 48          	sub    $0x48,%rsp
  80196d:	89 7d dc             	mov    %edi,-0x24(%rbp)
  801970:	89 75 d8             	mov    %esi,-0x28(%rbp)
  801973:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801977:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  80197b:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  80197f:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  801983:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801986:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  80198a:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  80198e:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  801992:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  801996:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  80199a:	4c 89 c3             	mov    %r8,%rbx
  80199d:	cd 30                	int    $0x30
  80199f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8019a3:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  8019a7:	74 3e                	je     8019e7 <syscall+0x83>
  8019a9:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8019ae:	7e 37                	jle    8019e7 <syscall+0x83>
  8019b0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8019b4:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8019b7:	49 89 d0             	mov    %rdx,%r8
  8019ba:	89 c1                	mov    %eax,%ecx
  8019bc:	48 ba 08 49 80 00 00 	movabs $0x804908,%rdx
  8019c3:	00 00 00 
  8019c6:	be 24 00 00 00       	mov    $0x24,%esi
  8019cb:	48 bf 25 49 80 00 00 	movabs $0x804925,%rdi
  8019d2:	00 00 00 
  8019d5:	b8 00 00 00 00       	mov    $0x0,%eax
  8019da:	49 b9 1d 04 80 00 00 	movabs $0x80041d,%r9
  8019e1:	00 00 00 
  8019e4:	41 ff d1             	callq  *%r9
  8019e7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8019eb:	48 83 c4 48          	add    $0x48,%rsp
  8019ef:	5b                   	pop    %rbx
  8019f0:	5d                   	pop    %rbp
  8019f1:	c3                   	retq   

00000000008019f2 <sys_cputs>:
  8019f2:	55                   	push   %rbp
  8019f3:	48 89 e5             	mov    %rsp,%rbp
  8019f6:	48 83 ec 20          	sub    $0x20,%rsp
  8019fa:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8019fe:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a02:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801a06:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801a0a:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801a11:	00 
  801a12:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a18:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a1e:	48 89 d1             	mov    %rdx,%rcx
  801a21:	48 89 c2             	mov    %rax,%rdx
  801a24:	be 00 00 00 00       	mov    $0x0,%esi
  801a29:	bf 00 00 00 00       	mov    $0x0,%edi
  801a2e:	48 b8 64 19 80 00 00 	movabs $0x801964,%rax
  801a35:	00 00 00 
  801a38:	ff d0                	callq  *%rax
  801a3a:	c9                   	leaveq 
  801a3b:	c3                   	retq   

0000000000801a3c <sys_cgetc>:
  801a3c:	55                   	push   %rbp
  801a3d:	48 89 e5             	mov    %rsp,%rbp
  801a40:	48 83 ec 10          	sub    $0x10,%rsp
  801a44:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801a4b:	00 
  801a4c:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a52:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a58:	b9 00 00 00 00       	mov    $0x0,%ecx
  801a5d:	ba 00 00 00 00       	mov    $0x0,%edx
  801a62:	be 00 00 00 00       	mov    $0x0,%esi
  801a67:	bf 01 00 00 00       	mov    $0x1,%edi
  801a6c:	48 b8 64 19 80 00 00 	movabs $0x801964,%rax
  801a73:	00 00 00 
  801a76:	ff d0                	callq  *%rax
  801a78:	c9                   	leaveq 
  801a79:	c3                   	retq   

0000000000801a7a <sys_env_destroy>:
  801a7a:	55                   	push   %rbp
  801a7b:	48 89 e5             	mov    %rsp,%rbp
  801a7e:	48 83 ec 10          	sub    $0x10,%rsp
  801a82:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a85:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a88:	48 98                	cltq   
  801a8a:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801a91:	00 
  801a92:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a98:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a9e:	b9 00 00 00 00       	mov    $0x0,%ecx
  801aa3:	48 89 c2             	mov    %rax,%rdx
  801aa6:	be 01 00 00 00       	mov    $0x1,%esi
  801aab:	bf 03 00 00 00       	mov    $0x3,%edi
  801ab0:	48 b8 64 19 80 00 00 	movabs $0x801964,%rax
  801ab7:	00 00 00 
  801aba:	ff d0                	callq  *%rax
  801abc:	c9                   	leaveq 
  801abd:	c3                   	retq   

0000000000801abe <sys_getenvid>:
  801abe:	55                   	push   %rbp
  801abf:	48 89 e5             	mov    %rsp,%rbp
  801ac2:	48 83 ec 10          	sub    $0x10,%rsp
  801ac6:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801acd:	00 
  801ace:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ad4:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ada:	b9 00 00 00 00       	mov    $0x0,%ecx
  801adf:	ba 00 00 00 00       	mov    $0x0,%edx
  801ae4:	be 00 00 00 00       	mov    $0x0,%esi
  801ae9:	bf 02 00 00 00       	mov    $0x2,%edi
  801aee:	48 b8 64 19 80 00 00 	movabs $0x801964,%rax
  801af5:	00 00 00 
  801af8:	ff d0                	callq  *%rax
  801afa:	c9                   	leaveq 
  801afb:	c3                   	retq   

0000000000801afc <sys_yield>:
  801afc:	55                   	push   %rbp
  801afd:	48 89 e5             	mov    %rsp,%rbp
  801b00:	48 83 ec 10          	sub    $0x10,%rsp
  801b04:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801b0b:	00 
  801b0c:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b12:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b18:	b9 00 00 00 00       	mov    $0x0,%ecx
  801b1d:	ba 00 00 00 00       	mov    $0x0,%edx
  801b22:	be 00 00 00 00       	mov    $0x0,%esi
  801b27:	bf 0b 00 00 00       	mov    $0xb,%edi
  801b2c:	48 b8 64 19 80 00 00 	movabs $0x801964,%rax
  801b33:	00 00 00 
  801b36:	ff d0                	callq  *%rax
  801b38:	c9                   	leaveq 
  801b39:	c3                   	retq   

0000000000801b3a <sys_page_alloc>:
  801b3a:	55                   	push   %rbp
  801b3b:	48 89 e5             	mov    %rsp,%rbp
  801b3e:	48 83 ec 20          	sub    $0x20,%rsp
  801b42:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b45:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b49:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801b4c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801b4f:	48 63 c8             	movslq %eax,%rcx
  801b52:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b56:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b59:	48 98                	cltq   
  801b5b:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801b62:	00 
  801b63:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b69:	49 89 c8             	mov    %rcx,%r8
  801b6c:	48 89 d1             	mov    %rdx,%rcx
  801b6f:	48 89 c2             	mov    %rax,%rdx
  801b72:	be 01 00 00 00       	mov    $0x1,%esi
  801b77:	bf 04 00 00 00       	mov    $0x4,%edi
  801b7c:	48 b8 64 19 80 00 00 	movabs $0x801964,%rax
  801b83:	00 00 00 
  801b86:	ff d0                	callq  *%rax
  801b88:	c9                   	leaveq 
  801b89:	c3                   	retq   

0000000000801b8a <sys_page_map>:
  801b8a:	55                   	push   %rbp
  801b8b:	48 89 e5             	mov    %rsp,%rbp
  801b8e:	48 83 ec 30          	sub    $0x30,%rsp
  801b92:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b95:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b99:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801b9c:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801ba0:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801ba4:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801ba7:	48 63 c8             	movslq %eax,%rcx
  801baa:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801bae:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801bb1:	48 63 f0             	movslq %eax,%rsi
  801bb4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801bb8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801bbb:	48 98                	cltq   
  801bbd:	48 89 0c 24          	mov    %rcx,(%rsp)
  801bc1:	49 89 f9             	mov    %rdi,%r9
  801bc4:	49 89 f0             	mov    %rsi,%r8
  801bc7:	48 89 d1             	mov    %rdx,%rcx
  801bca:	48 89 c2             	mov    %rax,%rdx
  801bcd:	be 01 00 00 00       	mov    $0x1,%esi
  801bd2:	bf 05 00 00 00       	mov    $0x5,%edi
  801bd7:	48 b8 64 19 80 00 00 	movabs $0x801964,%rax
  801bde:	00 00 00 
  801be1:	ff d0                	callq  *%rax
  801be3:	c9                   	leaveq 
  801be4:	c3                   	retq   

0000000000801be5 <sys_page_unmap>:
  801be5:	55                   	push   %rbp
  801be6:	48 89 e5             	mov    %rsp,%rbp
  801be9:	48 83 ec 20          	sub    $0x20,%rsp
  801bed:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801bf0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801bf4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801bf8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801bfb:	48 98                	cltq   
  801bfd:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c04:	00 
  801c05:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c0b:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c11:	48 89 d1             	mov    %rdx,%rcx
  801c14:	48 89 c2             	mov    %rax,%rdx
  801c17:	be 01 00 00 00       	mov    $0x1,%esi
  801c1c:	bf 06 00 00 00       	mov    $0x6,%edi
  801c21:	48 b8 64 19 80 00 00 	movabs $0x801964,%rax
  801c28:	00 00 00 
  801c2b:	ff d0                	callq  *%rax
  801c2d:	c9                   	leaveq 
  801c2e:	c3                   	retq   

0000000000801c2f <sys_env_set_status>:
  801c2f:	55                   	push   %rbp
  801c30:	48 89 e5             	mov    %rsp,%rbp
  801c33:	48 83 ec 10          	sub    $0x10,%rsp
  801c37:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801c3a:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801c3d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801c40:	48 63 d0             	movslq %eax,%rdx
  801c43:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c46:	48 98                	cltq   
  801c48:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c4f:	00 
  801c50:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c56:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c5c:	48 89 d1             	mov    %rdx,%rcx
  801c5f:	48 89 c2             	mov    %rax,%rdx
  801c62:	be 01 00 00 00       	mov    $0x1,%esi
  801c67:	bf 08 00 00 00       	mov    $0x8,%edi
  801c6c:	48 b8 64 19 80 00 00 	movabs $0x801964,%rax
  801c73:	00 00 00 
  801c76:	ff d0                	callq  *%rax
  801c78:	c9                   	leaveq 
  801c79:	c3                   	retq   

0000000000801c7a <sys_env_set_trapframe>:
  801c7a:	55                   	push   %rbp
  801c7b:	48 89 e5             	mov    %rsp,%rbp
  801c7e:	48 83 ec 20          	sub    $0x20,%rsp
  801c82:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801c85:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c89:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c8d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c90:	48 98                	cltq   
  801c92:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c99:	00 
  801c9a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ca0:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ca6:	48 89 d1             	mov    %rdx,%rcx
  801ca9:	48 89 c2             	mov    %rax,%rdx
  801cac:	be 01 00 00 00       	mov    $0x1,%esi
  801cb1:	bf 09 00 00 00       	mov    $0x9,%edi
  801cb6:	48 b8 64 19 80 00 00 	movabs $0x801964,%rax
  801cbd:	00 00 00 
  801cc0:	ff d0                	callq  *%rax
  801cc2:	c9                   	leaveq 
  801cc3:	c3                   	retq   

0000000000801cc4 <sys_env_set_pgfault_upcall>:
  801cc4:	55                   	push   %rbp
  801cc5:	48 89 e5             	mov    %rsp,%rbp
  801cc8:	48 83 ec 20          	sub    $0x20,%rsp
  801ccc:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801ccf:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801cd3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801cd7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801cda:	48 98                	cltq   
  801cdc:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801ce3:	00 
  801ce4:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801cea:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801cf0:	48 89 d1             	mov    %rdx,%rcx
  801cf3:	48 89 c2             	mov    %rax,%rdx
  801cf6:	be 01 00 00 00       	mov    $0x1,%esi
  801cfb:	bf 0a 00 00 00       	mov    $0xa,%edi
  801d00:	48 b8 64 19 80 00 00 	movabs $0x801964,%rax
  801d07:	00 00 00 
  801d0a:	ff d0                	callq  *%rax
  801d0c:	c9                   	leaveq 
  801d0d:	c3                   	retq   

0000000000801d0e <sys_ipc_try_send>:
  801d0e:	55                   	push   %rbp
  801d0f:	48 89 e5             	mov    %rsp,%rbp
  801d12:	48 83 ec 20          	sub    $0x20,%rsp
  801d16:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801d19:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d1d:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801d21:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801d24:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801d27:	48 63 f0             	movslq %eax,%rsi
  801d2a:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801d2e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801d31:	48 98                	cltq   
  801d33:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d37:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801d3e:	00 
  801d3f:	49 89 f1             	mov    %rsi,%r9
  801d42:	49 89 c8             	mov    %rcx,%r8
  801d45:	48 89 d1             	mov    %rdx,%rcx
  801d48:	48 89 c2             	mov    %rax,%rdx
  801d4b:	be 00 00 00 00       	mov    $0x0,%esi
  801d50:	bf 0c 00 00 00       	mov    $0xc,%edi
  801d55:	48 b8 64 19 80 00 00 	movabs $0x801964,%rax
  801d5c:	00 00 00 
  801d5f:	ff d0                	callq  *%rax
  801d61:	c9                   	leaveq 
  801d62:	c3                   	retq   

0000000000801d63 <sys_ipc_recv>:
  801d63:	55                   	push   %rbp
  801d64:	48 89 e5             	mov    %rsp,%rbp
  801d67:	48 83 ec 10          	sub    $0x10,%rsp
  801d6b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d6f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d73:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801d7a:	00 
  801d7b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d81:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d87:	b9 00 00 00 00       	mov    $0x0,%ecx
  801d8c:	48 89 c2             	mov    %rax,%rdx
  801d8f:	be 01 00 00 00       	mov    $0x1,%esi
  801d94:	bf 0d 00 00 00       	mov    $0xd,%edi
  801d99:	48 b8 64 19 80 00 00 	movabs $0x801964,%rax
  801da0:	00 00 00 
  801da3:	ff d0                	callq  *%rax
  801da5:	c9                   	leaveq 
  801da6:	c3                   	retq   

0000000000801da7 <sys_time_msec>:
  801da7:	55                   	push   %rbp
  801da8:	48 89 e5             	mov    %rsp,%rbp
  801dab:	48 83 ec 10          	sub    $0x10,%rsp
  801daf:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801db6:	00 
  801db7:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801dbd:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801dc3:	b9 00 00 00 00       	mov    $0x0,%ecx
  801dc8:	ba 00 00 00 00       	mov    $0x0,%edx
  801dcd:	be 00 00 00 00       	mov    $0x0,%esi
  801dd2:	bf 0e 00 00 00       	mov    $0xe,%edi
  801dd7:	48 b8 64 19 80 00 00 	movabs $0x801964,%rax
  801dde:	00 00 00 
  801de1:	ff d0                	callq  *%rax
  801de3:	c9                   	leaveq 
  801de4:	c3                   	retq   

0000000000801de5 <sys_net_transmit>:
  801de5:	55                   	push   %rbp
  801de6:	48 89 e5             	mov    %rsp,%rbp
  801de9:	48 83 ec 20          	sub    $0x20,%rsp
  801ded:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801df1:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801df4:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801df7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801dfb:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801e02:	00 
  801e03:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e09:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e0f:	48 89 d1             	mov    %rdx,%rcx
  801e12:	48 89 c2             	mov    %rax,%rdx
  801e15:	be 00 00 00 00       	mov    $0x0,%esi
  801e1a:	bf 0f 00 00 00       	mov    $0xf,%edi
  801e1f:	48 b8 64 19 80 00 00 	movabs $0x801964,%rax
  801e26:	00 00 00 
  801e29:	ff d0                	callq  *%rax
  801e2b:	c9                   	leaveq 
  801e2c:	c3                   	retq   

0000000000801e2d <sys_net_receive>:
  801e2d:	55                   	push   %rbp
  801e2e:	48 89 e5             	mov    %rsp,%rbp
  801e31:	48 83 ec 20          	sub    $0x20,%rsp
  801e35:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801e39:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801e3c:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801e3f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e43:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801e4a:	00 
  801e4b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e51:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e57:	48 89 d1             	mov    %rdx,%rcx
  801e5a:	48 89 c2             	mov    %rax,%rdx
  801e5d:	be 00 00 00 00       	mov    $0x0,%esi
  801e62:	bf 10 00 00 00       	mov    $0x10,%edi
  801e67:	48 b8 64 19 80 00 00 	movabs $0x801964,%rax
  801e6e:	00 00 00 
  801e71:	ff d0                	callq  *%rax
  801e73:	c9                   	leaveq 
  801e74:	c3                   	retq   

0000000000801e75 <sys_ept_map>:
  801e75:	55                   	push   %rbp
  801e76:	48 89 e5             	mov    %rsp,%rbp
  801e79:	48 83 ec 30          	sub    $0x30,%rsp
  801e7d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801e80:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801e84:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801e87:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801e8b:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801e8f:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801e92:	48 63 c8             	movslq %eax,%rcx
  801e95:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801e99:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801e9c:	48 63 f0             	movslq %eax,%rsi
  801e9f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801ea3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ea6:	48 98                	cltq   
  801ea8:	48 89 0c 24          	mov    %rcx,(%rsp)
  801eac:	49 89 f9             	mov    %rdi,%r9
  801eaf:	49 89 f0             	mov    %rsi,%r8
  801eb2:	48 89 d1             	mov    %rdx,%rcx
  801eb5:	48 89 c2             	mov    %rax,%rdx
  801eb8:	be 00 00 00 00       	mov    $0x0,%esi
  801ebd:	bf 11 00 00 00       	mov    $0x11,%edi
  801ec2:	48 b8 64 19 80 00 00 	movabs $0x801964,%rax
  801ec9:	00 00 00 
  801ecc:	ff d0                	callq  *%rax
  801ece:	c9                   	leaveq 
  801ecf:	c3                   	retq   

0000000000801ed0 <sys_env_mkguest>:
  801ed0:	55                   	push   %rbp
  801ed1:	48 89 e5             	mov    %rsp,%rbp
  801ed4:	48 83 ec 20          	sub    $0x20,%rsp
  801ed8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801edc:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801ee0:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801ee4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ee8:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801eef:	00 
  801ef0:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ef6:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801efc:	48 89 d1             	mov    %rdx,%rcx
  801eff:	48 89 c2             	mov    %rax,%rdx
  801f02:	be 00 00 00 00       	mov    $0x0,%esi
  801f07:	bf 12 00 00 00       	mov    $0x12,%edi
  801f0c:	48 b8 64 19 80 00 00 	movabs $0x801964,%rax
  801f13:	00 00 00 
  801f16:	ff d0                	callq  *%rax
  801f18:	c9                   	leaveq 
  801f19:	c3                   	retq   

0000000000801f1a <sys_vmx_list_vms>:
  801f1a:	55                   	push   %rbp
  801f1b:	48 89 e5             	mov    %rsp,%rbp
  801f1e:	48 83 ec 10          	sub    $0x10,%rsp
  801f22:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801f29:	00 
  801f2a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801f30:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801f36:	b9 00 00 00 00       	mov    $0x0,%ecx
  801f3b:	ba 00 00 00 00       	mov    $0x0,%edx
  801f40:	be 00 00 00 00       	mov    $0x0,%esi
  801f45:	bf 13 00 00 00       	mov    $0x13,%edi
  801f4a:	48 b8 64 19 80 00 00 	movabs $0x801964,%rax
  801f51:	00 00 00 
  801f54:	ff d0                	callq  *%rax
  801f56:	c9                   	leaveq 
  801f57:	c3                   	retq   

0000000000801f58 <sys_vmx_sel_resume>:
  801f58:	55                   	push   %rbp
  801f59:	48 89 e5             	mov    %rsp,%rbp
  801f5c:	48 83 ec 10          	sub    $0x10,%rsp
  801f60:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801f63:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801f66:	48 98                	cltq   
  801f68:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801f6f:	00 
  801f70:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801f76:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801f7c:	b9 00 00 00 00       	mov    $0x0,%ecx
  801f81:	48 89 c2             	mov    %rax,%rdx
  801f84:	be 00 00 00 00       	mov    $0x0,%esi
  801f89:	bf 14 00 00 00       	mov    $0x14,%edi
  801f8e:	48 b8 64 19 80 00 00 	movabs $0x801964,%rax
  801f95:	00 00 00 
  801f98:	ff d0                	callq  *%rax
  801f9a:	c9                   	leaveq 
  801f9b:	c3                   	retq   

0000000000801f9c <sys_vmx_get_vmdisk_number>:
  801f9c:	55                   	push   %rbp
  801f9d:	48 89 e5             	mov    %rsp,%rbp
  801fa0:	48 83 ec 10          	sub    $0x10,%rsp
  801fa4:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801fab:	00 
  801fac:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801fb2:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801fb8:	b9 00 00 00 00       	mov    $0x0,%ecx
  801fbd:	ba 00 00 00 00       	mov    $0x0,%edx
  801fc2:	be 00 00 00 00       	mov    $0x0,%esi
  801fc7:	bf 15 00 00 00       	mov    $0x15,%edi
  801fcc:	48 b8 64 19 80 00 00 	movabs $0x801964,%rax
  801fd3:	00 00 00 
  801fd6:	ff d0                	callq  *%rax
  801fd8:	c9                   	leaveq 
  801fd9:	c3                   	retq   

0000000000801fda <sys_vmx_incr_vmdisk_number>:
  801fda:	55                   	push   %rbp
  801fdb:	48 89 e5             	mov    %rsp,%rbp
  801fde:	48 83 ec 10          	sub    $0x10,%rsp
  801fe2:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801fe9:	00 
  801fea:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ff0:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ff6:	b9 00 00 00 00       	mov    $0x0,%ecx
  801ffb:	ba 00 00 00 00       	mov    $0x0,%edx
  802000:	be 00 00 00 00       	mov    $0x0,%esi
  802005:	bf 16 00 00 00       	mov    $0x16,%edi
  80200a:	48 b8 64 19 80 00 00 	movabs $0x801964,%rax
  802011:	00 00 00 
  802014:	ff d0                	callq  *%rax
  802016:	c9                   	leaveq 
  802017:	c3                   	retq   

0000000000802018 <fd2num>:
  802018:	55                   	push   %rbp
  802019:	48 89 e5             	mov    %rsp,%rbp
  80201c:	48 83 ec 08          	sub    $0x8,%rsp
  802020:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802024:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802028:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  80202f:	ff ff ff 
  802032:	48 01 d0             	add    %rdx,%rax
  802035:	48 c1 e8 0c          	shr    $0xc,%rax
  802039:	c9                   	leaveq 
  80203a:	c3                   	retq   

000000000080203b <fd2data>:
  80203b:	55                   	push   %rbp
  80203c:	48 89 e5             	mov    %rsp,%rbp
  80203f:	48 83 ec 08          	sub    $0x8,%rsp
  802043:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802047:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80204b:	48 89 c7             	mov    %rax,%rdi
  80204e:	48 b8 18 20 80 00 00 	movabs $0x802018,%rax
  802055:	00 00 00 
  802058:	ff d0                	callq  *%rax
  80205a:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  802060:	48 c1 e0 0c          	shl    $0xc,%rax
  802064:	c9                   	leaveq 
  802065:	c3                   	retq   

0000000000802066 <fd_alloc>:
  802066:	55                   	push   %rbp
  802067:	48 89 e5             	mov    %rsp,%rbp
  80206a:	48 83 ec 18          	sub    $0x18,%rsp
  80206e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802072:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802079:	eb 6b                	jmp    8020e6 <fd_alloc+0x80>
  80207b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80207e:	48 98                	cltq   
  802080:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802086:	48 c1 e0 0c          	shl    $0xc,%rax
  80208a:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80208e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802092:	48 c1 e8 15          	shr    $0x15,%rax
  802096:	48 89 c2             	mov    %rax,%rdx
  802099:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8020a0:	01 00 00 
  8020a3:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8020a7:	83 e0 01             	and    $0x1,%eax
  8020aa:	48 85 c0             	test   %rax,%rax
  8020ad:	74 21                	je     8020d0 <fd_alloc+0x6a>
  8020af:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8020b3:	48 c1 e8 0c          	shr    $0xc,%rax
  8020b7:	48 89 c2             	mov    %rax,%rdx
  8020ba:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8020c1:	01 00 00 
  8020c4:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8020c8:	83 e0 01             	and    $0x1,%eax
  8020cb:	48 85 c0             	test   %rax,%rax
  8020ce:	75 12                	jne    8020e2 <fd_alloc+0x7c>
  8020d0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8020d4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8020d8:	48 89 10             	mov    %rdx,(%rax)
  8020db:	b8 00 00 00 00       	mov    $0x0,%eax
  8020e0:	eb 1a                	jmp    8020fc <fd_alloc+0x96>
  8020e2:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8020e6:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  8020ea:	7e 8f                	jle    80207b <fd_alloc+0x15>
  8020ec:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8020f0:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  8020f7:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  8020fc:	c9                   	leaveq 
  8020fd:	c3                   	retq   

00000000008020fe <fd_lookup>:
  8020fe:	55                   	push   %rbp
  8020ff:	48 89 e5             	mov    %rsp,%rbp
  802102:	48 83 ec 20          	sub    $0x20,%rsp
  802106:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802109:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80210d:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802111:	78 06                	js     802119 <fd_lookup+0x1b>
  802113:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  802117:	7e 07                	jle    802120 <fd_lookup+0x22>
  802119:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80211e:	eb 6c                	jmp    80218c <fd_lookup+0x8e>
  802120:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802123:	48 98                	cltq   
  802125:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  80212b:	48 c1 e0 0c          	shl    $0xc,%rax
  80212f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802133:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802137:	48 c1 e8 15          	shr    $0x15,%rax
  80213b:	48 89 c2             	mov    %rax,%rdx
  80213e:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802145:	01 00 00 
  802148:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80214c:	83 e0 01             	and    $0x1,%eax
  80214f:	48 85 c0             	test   %rax,%rax
  802152:	74 21                	je     802175 <fd_lookup+0x77>
  802154:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802158:	48 c1 e8 0c          	shr    $0xc,%rax
  80215c:	48 89 c2             	mov    %rax,%rdx
  80215f:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802166:	01 00 00 
  802169:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80216d:	83 e0 01             	and    $0x1,%eax
  802170:	48 85 c0             	test   %rax,%rax
  802173:	75 07                	jne    80217c <fd_lookup+0x7e>
  802175:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80217a:	eb 10                	jmp    80218c <fd_lookup+0x8e>
  80217c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802180:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802184:	48 89 10             	mov    %rdx,(%rax)
  802187:	b8 00 00 00 00       	mov    $0x0,%eax
  80218c:	c9                   	leaveq 
  80218d:	c3                   	retq   

000000000080218e <fd_close>:
  80218e:	55                   	push   %rbp
  80218f:	48 89 e5             	mov    %rsp,%rbp
  802192:	48 83 ec 30          	sub    $0x30,%rsp
  802196:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80219a:	89 f0                	mov    %esi,%eax
  80219c:	88 45 d4             	mov    %al,-0x2c(%rbp)
  80219f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8021a3:	48 89 c7             	mov    %rax,%rdi
  8021a6:	48 b8 18 20 80 00 00 	movabs $0x802018,%rax
  8021ad:	00 00 00 
  8021b0:	ff d0                	callq  *%rax
  8021b2:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8021b6:	48 89 d6             	mov    %rdx,%rsi
  8021b9:	89 c7                	mov    %eax,%edi
  8021bb:	48 b8 fe 20 80 00 00 	movabs $0x8020fe,%rax
  8021c2:	00 00 00 
  8021c5:	ff d0                	callq  *%rax
  8021c7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8021ca:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8021ce:	78 0a                	js     8021da <fd_close+0x4c>
  8021d0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8021d4:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  8021d8:	74 12                	je     8021ec <fd_close+0x5e>
  8021da:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  8021de:	74 05                	je     8021e5 <fd_close+0x57>
  8021e0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8021e3:	eb 05                	jmp    8021ea <fd_close+0x5c>
  8021e5:	b8 00 00 00 00       	mov    $0x0,%eax
  8021ea:	eb 69                	jmp    802255 <fd_close+0xc7>
  8021ec:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8021f0:	8b 00                	mov    (%rax),%eax
  8021f2:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8021f6:	48 89 d6             	mov    %rdx,%rsi
  8021f9:	89 c7                	mov    %eax,%edi
  8021fb:	48 b8 57 22 80 00 00 	movabs $0x802257,%rax
  802202:	00 00 00 
  802205:	ff d0                	callq  *%rax
  802207:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80220a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80220e:	78 2a                	js     80223a <fd_close+0xac>
  802210:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802214:	48 8b 40 20          	mov    0x20(%rax),%rax
  802218:	48 85 c0             	test   %rax,%rax
  80221b:	74 16                	je     802233 <fd_close+0xa5>
  80221d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802221:	48 8b 40 20          	mov    0x20(%rax),%rax
  802225:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802229:	48 89 d7             	mov    %rdx,%rdi
  80222c:	ff d0                	callq  *%rax
  80222e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802231:	eb 07                	jmp    80223a <fd_close+0xac>
  802233:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80223a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80223e:	48 89 c6             	mov    %rax,%rsi
  802241:	bf 00 00 00 00       	mov    $0x0,%edi
  802246:	48 b8 e5 1b 80 00 00 	movabs $0x801be5,%rax
  80224d:	00 00 00 
  802250:	ff d0                	callq  *%rax
  802252:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802255:	c9                   	leaveq 
  802256:	c3                   	retq   

0000000000802257 <dev_lookup>:
  802257:	55                   	push   %rbp
  802258:	48 89 e5             	mov    %rsp,%rbp
  80225b:	48 83 ec 20          	sub    $0x20,%rsp
  80225f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802262:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802266:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80226d:	eb 41                	jmp    8022b0 <dev_lookup+0x59>
  80226f:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  802276:	00 00 00 
  802279:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80227c:	48 63 d2             	movslq %edx,%rdx
  80227f:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802283:	8b 00                	mov    (%rax),%eax
  802285:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  802288:	75 22                	jne    8022ac <dev_lookup+0x55>
  80228a:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  802291:	00 00 00 
  802294:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802297:	48 63 d2             	movslq %edx,%rdx
  80229a:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  80229e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8022a2:	48 89 10             	mov    %rdx,(%rax)
  8022a5:	b8 00 00 00 00       	mov    $0x0,%eax
  8022aa:	eb 60                	jmp    80230c <dev_lookup+0xb5>
  8022ac:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8022b0:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  8022b7:	00 00 00 
  8022ba:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8022bd:	48 63 d2             	movslq %edx,%rdx
  8022c0:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8022c4:	48 85 c0             	test   %rax,%rax
  8022c7:	75 a6                	jne    80226f <dev_lookup+0x18>
  8022c9:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8022d0:	00 00 00 
  8022d3:	48 8b 00             	mov    (%rax),%rax
  8022d6:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8022dc:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8022df:	89 c6                	mov    %eax,%esi
  8022e1:	48 bf 38 49 80 00 00 	movabs $0x804938,%rdi
  8022e8:	00 00 00 
  8022eb:	b8 00 00 00 00       	mov    $0x0,%eax
  8022f0:	48 b9 56 06 80 00 00 	movabs $0x800656,%rcx
  8022f7:	00 00 00 
  8022fa:	ff d1                	callq  *%rcx
  8022fc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802300:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802307:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80230c:	c9                   	leaveq 
  80230d:	c3                   	retq   

000000000080230e <close>:
  80230e:	55                   	push   %rbp
  80230f:	48 89 e5             	mov    %rsp,%rbp
  802312:	48 83 ec 20          	sub    $0x20,%rsp
  802316:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802319:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80231d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802320:	48 89 d6             	mov    %rdx,%rsi
  802323:	89 c7                	mov    %eax,%edi
  802325:	48 b8 fe 20 80 00 00 	movabs $0x8020fe,%rax
  80232c:	00 00 00 
  80232f:	ff d0                	callq  *%rax
  802331:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802334:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802338:	79 05                	jns    80233f <close+0x31>
  80233a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80233d:	eb 18                	jmp    802357 <close+0x49>
  80233f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802343:	be 01 00 00 00       	mov    $0x1,%esi
  802348:	48 89 c7             	mov    %rax,%rdi
  80234b:	48 b8 8e 21 80 00 00 	movabs $0x80218e,%rax
  802352:	00 00 00 
  802355:	ff d0                	callq  *%rax
  802357:	c9                   	leaveq 
  802358:	c3                   	retq   

0000000000802359 <close_all>:
  802359:	55                   	push   %rbp
  80235a:	48 89 e5             	mov    %rsp,%rbp
  80235d:	48 83 ec 10          	sub    $0x10,%rsp
  802361:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802368:	eb 15                	jmp    80237f <close_all+0x26>
  80236a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80236d:	89 c7                	mov    %eax,%edi
  80236f:	48 b8 0e 23 80 00 00 	movabs $0x80230e,%rax
  802376:	00 00 00 
  802379:	ff d0                	callq  *%rax
  80237b:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80237f:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802383:	7e e5                	jle    80236a <close_all+0x11>
  802385:	c9                   	leaveq 
  802386:	c3                   	retq   

0000000000802387 <dup>:
  802387:	55                   	push   %rbp
  802388:	48 89 e5             	mov    %rsp,%rbp
  80238b:	48 83 ec 40          	sub    $0x40,%rsp
  80238f:	89 7d cc             	mov    %edi,-0x34(%rbp)
  802392:	89 75 c8             	mov    %esi,-0x38(%rbp)
  802395:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  802399:	8b 45 cc             	mov    -0x34(%rbp),%eax
  80239c:	48 89 d6             	mov    %rdx,%rsi
  80239f:	89 c7                	mov    %eax,%edi
  8023a1:	48 b8 fe 20 80 00 00 	movabs $0x8020fe,%rax
  8023a8:	00 00 00 
  8023ab:	ff d0                	callq  *%rax
  8023ad:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8023b0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8023b4:	79 08                	jns    8023be <dup+0x37>
  8023b6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023b9:	e9 70 01 00 00       	jmpq   80252e <dup+0x1a7>
  8023be:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8023c1:	89 c7                	mov    %eax,%edi
  8023c3:	48 b8 0e 23 80 00 00 	movabs $0x80230e,%rax
  8023ca:	00 00 00 
  8023cd:	ff d0                	callq  *%rax
  8023cf:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8023d2:	48 98                	cltq   
  8023d4:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  8023da:	48 c1 e0 0c          	shl    $0xc,%rax
  8023de:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8023e2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8023e6:	48 89 c7             	mov    %rax,%rdi
  8023e9:	48 b8 3b 20 80 00 00 	movabs $0x80203b,%rax
  8023f0:	00 00 00 
  8023f3:	ff d0                	callq  *%rax
  8023f5:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8023f9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8023fd:	48 89 c7             	mov    %rax,%rdi
  802400:	48 b8 3b 20 80 00 00 	movabs $0x80203b,%rax
  802407:	00 00 00 
  80240a:	ff d0                	callq  *%rax
  80240c:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802410:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802414:	48 c1 e8 15          	shr    $0x15,%rax
  802418:	48 89 c2             	mov    %rax,%rdx
  80241b:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802422:	01 00 00 
  802425:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802429:	83 e0 01             	and    $0x1,%eax
  80242c:	48 85 c0             	test   %rax,%rax
  80242f:	74 73                	je     8024a4 <dup+0x11d>
  802431:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802435:	48 c1 e8 0c          	shr    $0xc,%rax
  802439:	48 89 c2             	mov    %rax,%rdx
  80243c:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802443:	01 00 00 
  802446:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80244a:	83 e0 01             	and    $0x1,%eax
  80244d:	48 85 c0             	test   %rax,%rax
  802450:	74 52                	je     8024a4 <dup+0x11d>
  802452:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802456:	48 c1 e8 0c          	shr    $0xc,%rax
  80245a:	48 89 c2             	mov    %rax,%rdx
  80245d:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802464:	01 00 00 
  802467:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80246b:	25 07 0e 00 00       	and    $0xe07,%eax
  802470:	89 c1                	mov    %eax,%ecx
  802472:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802476:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80247a:	41 89 c8             	mov    %ecx,%r8d
  80247d:	48 89 d1             	mov    %rdx,%rcx
  802480:	ba 00 00 00 00       	mov    $0x0,%edx
  802485:	48 89 c6             	mov    %rax,%rsi
  802488:	bf 00 00 00 00       	mov    $0x0,%edi
  80248d:	48 b8 8a 1b 80 00 00 	movabs $0x801b8a,%rax
  802494:	00 00 00 
  802497:	ff d0                	callq  *%rax
  802499:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80249c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8024a0:	79 02                	jns    8024a4 <dup+0x11d>
  8024a2:	eb 57                	jmp    8024fb <dup+0x174>
  8024a4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8024a8:	48 c1 e8 0c          	shr    $0xc,%rax
  8024ac:	48 89 c2             	mov    %rax,%rdx
  8024af:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8024b6:	01 00 00 
  8024b9:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8024bd:	25 07 0e 00 00       	and    $0xe07,%eax
  8024c2:	89 c1                	mov    %eax,%ecx
  8024c4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8024c8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8024cc:	41 89 c8             	mov    %ecx,%r8d
  8024cf:	48 89 d1             	mov    %rdx,%rcx
  8024d2:	ba 00 00 00 00       	mov    $0x0,%edx
  8024d7:	48 89 c6             	mov    %rax,%rsi
  8024da:	bf 00 00 00 00       	mov    $0x0,%edi
  8024df:	48 b8 8a 1b 80 00 00 	movabs $0x801b8a,%rax
  8024e6:	00 00 00 
  8024e9:	ff d0                	callq  *%rax
  8024eb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8024ee:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8024f2:	79 02                	jns    8024f6 <dup+0x16f>
  8024f4:	eb 05                	jmp    8024fb <dup+0x174>
  8024f6:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8024f9:	eb 33                	jmp    80252e <dup+0x1a7>
  8024fb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8024ff:	48 89 c6             	mov    %rax,%rsi
  802502:	bf 00 00 00 00       	mov    $0x0,%edi
  802507:	48 b8 e5 1b 80 00 00 	movabs $0x801be5,%rax
  80250e:	00 00 00 
  802511:	ff d0                	callq  *%rax
  802513:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802517:	48 89 c6             	mov    %rax,%rsi
  80251a:	bf 00 00 00 00       	mov    $0x0,%edi
  80251f:	48 b8 e5 1b 80 00 00 	movabs $0x801be5,%rax
  802526:	00 00 00 
  802529:	ff d0                	callq  *%rax
  80252b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80252e:	c9                   	leaveq 
  80252f:	c3                   	retq   

0000000000802530 <read>:
  802530:	55                   	push   %rbp
  802531:	48 89 e5             	mov    %rsp,%rbp
  802534:	48 83 ec 40          	sub    $0x40,%rsp
  802538:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80253b:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80253f:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802543:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802547:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80254a:	48 89 d6             	mov    %rdx,%rsi
  80254d:	89 c7                	mov    %eax,%edi
  80254f:	48 b8 fe 20 80 00 00 	movabs $0x8020fe,%rax
  802556:	00 00 00 
  802559:	ff d0                	callq  *%rax
  80255b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80255e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802562:	78 24                	js     802588 <read+0x58>
  802564:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802568:	8b 00                	mov    (%rax),%eax
  80256a:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80256e:	48 89 d6             	mov    %rdx,%rsi
  802571:	89 c7                	mov    %eax,%edi
  802573:	48 b8 57 22 80 00 00 	movabs $0x802257,%rax
  80257a:	00 00 00 
  80257d:	ff d0                	callq  *%rax
  80257f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802582:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802586:	79 05                	jns    80258d <read+0x5d>
  802588:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80258b:	eb 76                	jmp    802603 <read+0xd3>
  80258d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802591:	8b 40 08             	mov    0x8(%rax),%eax
  802594:	83 e0 03             	and    $0x3,%eax
  802597:	83 f8 01             	cmp    $0x1,%eax
  80259a:	75 3a                	jne    8025d6 <read+0xa6>
  80259c:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8025a3:	00 00 00 
  8025a6:	48 8b 00             	mov    (%rax),%rax
  8025a9:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8025af:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8025b2:	89 c6                	mov    %eax,%esi
  8025b4:	48 bf 57 49 80 00 00 	movabs $0x804957,%rdi
  8025bb:	00 00 00 
  8025be:	b8 00 00 00 00       	mov    $0x0,%eax
  8025c3:	48 b9 56 06 80 00 00 	movabs $0x800656,%rcx
  8025ca:	00 00 00 
  8025cd:	ff d1                	callq  *%rcx
  8025cf:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8025d4:	eb 2d                	jmp    802603 <read+0xd3>
  8025d6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8025da:	48 8b 40 10          	mov    0x10(%rax),%rax
  8025de:	48 85 c0             	test   %rax,%rax
  8025e1:	75 07                	jne    8025ea <read+0xba>
  8025e3:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8025e8:	eb 19                	jmp    802603 <read+0xd3>
  8025ea:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8025ee:	48 8b 40 10          	mov    0x10(%rax),%rax
  8025f2:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8025f6:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8025fa:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  8025fe:	48 89 cf             	mov    %rcx,%rdi
  802601:	ff d0                	callq  *%rax
  802603:	c9                   	leaveq 
  802604:	c3                   	retq   

0000000000802605 <readn>:
  802605:	55                   	push   %rbp
  802606:	48 89 e5             	mov    %rsp,%rbp
  802609:	48 83 ec 30          	sub    $0x30,%rsp
  80260d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802610:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802614:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802618:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80261f:	eb 49                	jmp    80266a <readn+0x65>
  802621:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802624:	48 98                	cltq   
  802626:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80262a:	48 29 c2             	sub    %rax,%rdx
  80262d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802630:	48 63 c8             	movslq %eax,%rcx
  802633:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802637:	48 01 c1             	add    %rax,%rcx
  80263a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80263d:	48 89 ce             	mov    %rcx,%rsi
  802640:	89 c7                	mov    %eax,%edi
  802642:	48 b8 30 25 80 00 00 	movabs $0x802530,%rax
  802649:	00 00 00 
  80264c:	ff d0                	callq  *%rax
  80264e:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802651:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802655:	79 05                	jns    80265c <readn+0x57>
  802657:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80265a:	eb 1c                	jmp    802678 <readn+0x73>
  80265c:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802660:	75 02                	jne    802664 <readn+0x5f>
  802662:	eb 11                	jmp    802675 <readn+0x70>
  802664:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802667:	01 45 fc             	add    %eax,-0x4(%rbp)
  80266a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80266d:	48 98                	cltq   
  80266f:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802673:	72 ac                	jb     802621 <readn+0x1c>
  802675:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802678:	c9                   	leaveq 
  802679:	c3                   	retq   

000000000080267a <write>:
  80267a:	55                   	push   %rbp
  80267b:	48 89 e5             	mov    %rsp,%rbp
  80267e:	48 83 ec 40          	sub    $0x40,%rsp
  802682:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802685:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802689:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80268d:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802691:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802694:	48 89 d6             	mov    %rdx,%rsi
  802697:	89 c7                	mov    %eax,%edi
  802699:	48 b8 fe 20 80 00 00 	movabs $0x8020fe,%rax
  8026a0:	00 00 00 
  8026a3:	ff d0                	callq  *%rax
  8026a5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8026a8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8026ac:	78 24                	js     8026d2 <write+0x58>
  8026ae:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8026b2:	8b 00                	mov    (%rax),%eax
  8026b4:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8026b8:	48 89 d6             	mov    %rdx,%rsi
  8026bb:	89 c7                	mov    %eax,%edi
  8026bd:	48 b8 57 22 80 00 00 	movabs $0x802257,%rax
  8026c4:	00 00 00 
  8026c7:	ff d0                	callq  *%rax
  8026c9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8026cc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8026d0:	79 05                	jns    8026d7 <write+0x5d>
  8026d2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8026d5:	eb 75                	jmp    80274c <write+0xd2>
  8026d7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8026db:	8b 40 08             	mov    0x8(%rax),%eax
  8026de:	83 e0 03             	and    $0x3,%eax
  8026e1:	85 c0                	test   %eax,%eax
  8026e3:	75 3a                	jne    80271f <write+0xa5>
  8026e5:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8026ec:	00 00 00 
  8026ef:	48 8b 00             	mov    (%rax),%rax
  8026f2:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8026f8:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8026fb:	89 c6                	mov    %eax,%esi
  8026fd:	48 bf 73 49 80 00 00 	movabs $0x804973,%rdi
  802704:	00 00 00 
  802707:	b8 00 00 00 00       	mov    $0x0,%eax
  80270c:	48 b9 56 06 80 00 00 	movabs $0x800656,%rcx
  802713:	00 00 00 
  802716:	ff d1                	callq  *%rcx
  802718:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80271d:	eb 2d                	jmp    80274c <write+0xd2>
  80271f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802723:	48 8b 40 18          	mov    0x18(%rax),%rax
  802727:	48 85 c0             	test   %rax,%rax
  80272a:	75 07                	jne    802733 <write+0xb9>
  80272c:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802731:	eb 19                	jmp    80274c <write+0xd2>
  802733:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802737:	48 8b 40 18          	mov    0x18(%rax),%rax
  80273b:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80273f:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802743:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802747:	48 89 cf             	mov    %rcx,%rdi
  80274a:	ff d0                	callq  *%rax
  80274c:	c9                   	leaveq 
  80274d:	c3                   	retq   

000000000080274e <seek>:
  80274e:	55                   	push   %rbp
  80274f:	48 89 e5             	mov    %rsp,%rbp
  802752:	48 83 ec 18          	sub    $0x18,%rsp
  802756:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802759:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80275c:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802760:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802763:	48 89 d6             	mov    %rdx,%rsi
  802766:	89 c7                	mov    %eax,%edi
  802768:	48 b8 fe 20 80 00 00 	movabs $0x8020fe,%rax
  80276f:	00 00 00 
  802772:	ff d0                	callq  *%rax
  802774:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802777:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80277b:	79 05                	jns    802782 <seek+0x34>
  80277d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802780:	eb 0f                	jmp    802791 <seek+0x43>
  802782:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802786:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802789:	89 50 04             	mov    %edx,0x4(%rax)
  80278c:	b8 00 00 00 00       	mov    $0x0,%eax
  802791:	c9                   	leaveq 
  802792:	c3                   	retq   

0000000000802793 <ftruncate>:
  802793:	55                   	push   %rbp
  802794:	48 89 e5             	mov    %rsp,%rbp
  802797:	48 83 ec 30          	sub    $0x30,%rsp
  80279b:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80279e:	89 75 d8             	mov    %esi,-0x28(%rbp)
  8027a1:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8027a5:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8027a8:	48 89 d6             	mov    %rdx,%rsi
  8027ab:	89 c7                	mov    %eax,%edi
  8027ad:	48 b8 fe 20 80 00 00 	movabs $0x8020fe,%rax
  8027b4:	00 00 00 
  8027b7:	ff d0                	callq  *%rax
  8027b9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8027bc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8027c0:	78 24                	js     8027e6 <ftruncate+0x53>
  8027c2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8027c6:	8b 00                	mov    (%rax),%eax
  8027c8:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8027cc:	48 89 d6             	mov    %rdx,%rsi
  8027cf:	89 c7                	mov    %eax,%edi
  8027d1:	48 b8 57 22 80 00 00 	movabs $0x802257,%rax
  8027d8:	00 00 00 
  8027db:	ff d0                	callq  *%rax
  8027dd:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8027e0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8027e4:	79 05                	jns    8027eb <ftruncate+0x58>
  8027e6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8027e9:	eb 72                	jmp    80285d <ftruncate+0xca>
  8027eb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8027ef:	8b 40 08             	mov    0x8(%rax),%eax
  8027f2:	83 e0 03             	and    $0x3,%eax
  8027f5:	85 c0                	test   %eax,%eax
  8027f7:	75 3a                	jne    802833 <ftruncate+0xa0>
  8027f9:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  802800:	00 00 00 
  802803:	48 8b 00             	mov    (%rax),%rax
  802806:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80280c:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80280f:	89 c6                	mov    %eax,%esi
  802811:	48 bf 90 49 80 00 00 	movabs $0x804990,%rdi
  802818:	00 00 00 
  80281b:	b8 00 00 00 00       	mov    $0x0,%eax
  802820:	48 b9 56 06 80 00 00 	movabs $0x800656,%rcx
  802827:	00 00 00 
  80282a:	ff d1                	callq  *%rcx
  80282c:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802831:	eb 2a                	jmp    80285d <ftruncate+0xca>
  802833:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802837:	48 8b 40 30          	mov    0x30(%rax),%rax
  80283b:	48 85 c0             	test   %rax,%rax
  80283e:	75 07                	jne    802847 <ftruncate+0xb4>
  802840:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802845:	eb 16                	jmp    80285d <ftruncate+0xca>
  802847:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80284b:	48 8b 40 30          	mov    0x30(%rax),%rax
  80284f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802853:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  802856:	89 ce                	mov    %ecx,%esi
  802858:	48 89 d7             	mov    %rdx,%rdi
  80285b:	ff d0                	callq  *%rax
  80285d:	c9                   	leaveq 
  80285e:	c3                   	retq   

000000000080285f <fstat>:
  80285f:	55                   	push   %rbp
  802860:	48 89 e5             	mov    %rsp,%rbp
  802863:	48 83 ec 30          	sub    $0x30,%rsp
  802867:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80286a:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80286e:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802872:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802875:	48 89 d6             	mov    %rdx,%rsi
  802878:	89 c7                	mov    %eax,%edi
  80287a:	48 b8 fe 20 80 00 00 	movabs $0x8020fe,%rax
  802881:	00 00 00 
  802884:	ff d0                	callq  *%rax
  802886:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802889:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80288d:	78 24                	js     8028b3 <fstat+0x54>
  80288f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802893:	8b 00                	mov    (%rax),%eax
  802895:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802899:	48 89 d6             	mov    %rdx,%rsi
  80289c:	89 c7                	mov    %eax,%edi
  80289e:	48 b8 57 22 80 00 00 	movabs $0x802257,%rax
  8028a5:	00 00 00 
  8028a8:	ff d0                	callq  *%rax
  8028aa:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8028ad:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8028b1:	79 05                	jns    8028b8 <fstat+0x59>
  8028b3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8028b6:	eb 5e                	jmp    802916 <fstat+0xb7>
  8028b8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8028bc:	48 8b 40 28          	mov    0x28(%rax),%rax
  8028c0:	48 85 c0             	test   %rax,%rax
  8028c3:	75 07                	jne    8028cc <fstat+0x6d>
  8028c5:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8028ca:	eb 4a                	jmp    802916 <fstat+0xb7>
  8028cc:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8028d0:	c6 00 00             	movb   $0x0,(%rax)
  8028d3:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8028d7:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  8028de:	00 00 00 
  8028e1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8028e5:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  8028ec:	00 00 00 
  8028ef:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8028f3:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8028f7:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  8028fe:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802902:	48 8b 40 28          	mov    0x28(%rax),%rax
  802906:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80290a:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  80290e:	48 89 ce             	mov    %rcx,%rsi
  802911:	48 89 d7             	mov    %rdx,%rdi
  802914:	ff d0                	callq  *%rax
  802916:	c9                   	leaveq 
  802917:	c3                   	retq   

0000000000802918 <stat>:
  802918:	55                   	push   %rbp
  802919:	48 89 e5             	mov    %rsp,%rbp
  80291c:	48 83 ec 20          	sub    $0x20,%rsp
  802920:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802924:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802928:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80292c:	be 00 00 00 00       	mov    $0x0,%esi
  802931:	48 89 c7             	mov    %rax,%rdi
  802934:	48 b8 06 2a 80 00 00 	movabs $0x802a06,%rax
  80293b:	00 00 00 
  80293e:	ff d0                	callq  *%rax
  802940:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802943:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802947:	79 05                	jns    80294e <stat+0x36>
  802949:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80294c:	eb 2f                	jmp    80297d <stat+0x65>
  80294e:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802952:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802955:	48 89 d6             	mov    %rdx,%rsi
  802958:	89 c7                	mov    %eax,%edi
  80295a:	48 b8 5f 28 80 00 00 	movabs $0x80285f,%rax
  802961:	00 00 00 
  802964:	ff d0                	callq  *%rax
  802966:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802969:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80296c:	89 c7                	mov    %eax,%edi
  80296e:	48 b8 0e 23 80 00 00 	movabs $0x80230e,%rax
  802975:	00 00 00 
  802978:	ff d0                	callq  *%rax
  80297a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80297d:	c9                   	leaveq 
  80297e:	c3                   	retq   

000000000080297f <fsipc>:
  80297f:	55                   	push   %rbp
  802980:	48 89 e5             	mov    %rsp,%rbp
  802983:	48 83 ec 10          	sub    $0x10,%rsp
  802987:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80298a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80298e:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  802995:	00 00 00 
  802998:	8b 00                	mov    (%rax),%eax
  80299a:	85 c0                	test   %eax,%eax
  80299c:	75 1d                	jne    8029bb <fsipc+0x3c>
  80299e:	bf 01 00 00 00       	mov    $0x1,%edi
  8029a3:	48 b8 22 42 80 00 00 	movabs $0x804222,%rax
  8029aa:	00 00 00 
  8029ad:	ff d0                	callq  *%rax
  8029af:	48 ba 00 70 80 00 00 	movabs $0x807000,%rdx
  8029b6:	00 00 00 
  8029b9:	89 02                	mov    %eax,(%rdx)
  8029bb:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8029c2:	00 00 00 
  8029c5:	8b 00                	mov    (%rax),%eax
  8029c7:	8b 75 fc             	mov    -0x4(%rbp),%esi
  8029ca:	b9 07 00 00 00       	mov    $0x7,%ecx
  8029cf:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  8029d6:	00 00 00 
  8029d9:	89 c7                	mov    %eax,%edi
  8029db:	48 b8 8c 41 80 00 00 	movabs $0x80418c,%rax
  8029e2:	00 00 00 
  8029e5:	ff d0                	callq  *%rax
  8029e7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8029eb:	ba 00 00 00 00       	mov    $0x0,%edx
  8029f0:	48 89 c6             	mov    %rax,%rsi
  8029f3:	bf 00 00 00 00       	mov    $0x0,%edi
  8029f8:	48 b8 cb 40 80 00 00 	movabs $0x8040cb,%rax
  8029ff:	00 00 00 
  802a02:	ff d0                	callq  *%rax
  802a04:	c9                   	leaveq 
  802a05:	c3                   	retq   

0000000000802a06 <open>:
  802a06:	55                   	push   %rbp
  802a07:	48 89 e5             	mov    %rsp,%rbp
  802a0a:	48 83 ec 20          	sub    $0x20,%rsp
  802a0e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802a12:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  802a15:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802a19:	48 89 c7             	mov    %rax,%rdi
  802a1c:	48 b8 9f 11 80 00 00 	movabs $0x80119f,%rax
  802a23:	00 00 00 
  802a26:	ff d0                	callq  *%rax
  802a28:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802a2d:	7e 0a                	jle    802a39 <open+0x33>
  802a2f:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802a34:	e9 a5 00 00 00       	jmpq   802ade <open+0xd8>
  802a39:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802a3d:	48 89 c7             	mov    %rax,%rdi
  802a40:	48 b8 66 20 80 00 00 	movabs $0x802066,%rax
  802a47:	00 00 00 
  802a4a:	ff d0                	callq  *%rax
  802a4c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802a4f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802a53:	79 08                	jns    802a5d <open+0x57>
  802a55:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a58:	e9 81 00 00 00       	jmpq   802ade <open+0xd8>
  802a5d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802a61:	48 89 c6             	mov    %rax,%rsi
  802a64:	48 bf 00 80 80 00 00 	movabs $0x808000,%rdi
  802a6b:	00 00 00 
  802a6e:	48 b8 0b 12 80 00 00 	movabs $0x80120b,%rax
  802a75:	00 00 00 
  802a78:	ff d0                	callq  *%rax
  802a7a:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802a81:	00 00 00 
  802a84:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  802a87:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  802a8d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802a91:	48 89 c6             	mov    %rax,%rsi
  802a94:	bf 01 00 00 00       	mov    $0x1,%edi
  802a99:	48 b8 7f 29 80 00 00 	movabs $0x80297f,%rax
  802aa0:	00 00 00 
  802aa3:	ff d0                	callq  *%rax
  802aa5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802aa8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802aac:	79 1d                	jns    802acb <open+0xc5>
  802aae:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ab2:	be 00 00 00 00       	mov    $0x0,%esi
  802ab7:	48 89 c7             	mov    %rax,%rdi
  802aba:	48 b8 8e 21 80 00 00 	movabs $0x80218e,%rax
  802ac1:	00 00 00 
  802ac4:	ff d0                	callq  *%rax
  802ac6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ac9:	eb 13                	jmp    802ade <open+0xd8>
  802acb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802acf:	48 89 c7             	mov    %rax,%rdi
  802ad2:	48 b8 18 20 80 00 00 	movabs $0x802018,%rax
  802ad9:	00 00 00 
  802adc:	ff d0                	callq  *%rax
  802ade:	c9                   	leaveq 
  802adf:	c3                   	retq   

0000000000802ae0 <devfile_flush>:
  802ae0:	55                   	push   %rbp
  802ae1:	48 89 e5             	mov    %rsp,%rbp
  802ae4:	48 83 ec 10          	sub    $0x10,%rsp
  802ae8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802aec:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802af0:	8b 50 0c             	mov    0xc(%rax),%edx
  802af3:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802afa:	00 00 00 
  802afd:	89 10                	mov    %edx,(%rax)
  802aff:	be 00 00 00 00       	mov    $0x0,%esi
  802b04:	bf 06 00 00 00       	mov    $0x6,%edi
  802b09:	48 b8 7f 29 80 00 00 	movabs $0x80297f,%rax
  802b10:	00 00 00 
  802b13:	ff d0                	callq  *%rax
  802b15:	c9                   	leaveq 
  802b16:	c3                   	retq   

0000000000802b17 <devfile_read>:
  802b17:	55                   	push   %rbp
  802b18:	48 89 e5             	mov    %rsp,%rbp
  802b1b:	48 83 ec 30          	sub    $0x30,%rsp
  802b1f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802b23:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802b27:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802b2b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b2f:	8b 50 0c             	mov    0xc(%rax),%edx
  802b32:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802b39:	00 00 00 
  802b3c:	89 10                	mov    %edx,(%rax)
  802b3e:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802b45:	00 00 00 
  802b48:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802b4c:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802b50:	be 00 00 00 00       	mov    $0x0,%esi
  802b55:	bf 03 00 00 00       	mov    $0x3,%edi
  802b5a:	48 b8 7f 29 80 00 00 	movabs $0x80297f,%rax
  802b61:	00 00 00 
  802b64:	ff d0                	callq  *%rax
  802b66:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b69:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b6d:	79 08                	jns    802b77 <devfile_read+0x60>
  802b6f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b72:	e9 a4 00 00 00       	jmpq   802c1b <devfile_read+0x104>
  802b77:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b7a:	48 98                	cltq   
  802b7c:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802b80:	76 35                	jbe    802bb7 <devfile_read+0xa0>
  802b82:	48 b9 b6 49 80 00 00 	movabs $0x8049b6,%rcx
  802b89:	00 00 00 
  802b8c:	48 ba bd 49 80 00 00 	movabs $0x8049bd,%rdx
  802b93:	00 00 00 
  802b96:	be 89 00 00 00       	mov    $0x89,%esi
  802b9b:	48 bf d2 49 80 00 00 	movabs $0x8049d2,%rdi
  802ba2:	00 00 00 
  802ba5:	b8 00 00 00 00       	mov    $0x0,%eax
  802baa:	49 b8 1d 04 80 00 00 	movabs $0x80041d,%r8
  802bb1:	00 00 00 
  802bb4:	41 ff d0             	callq  *%r8
  802bb7:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  802bbe:	7e 35                	jle    802bf5 <devfile_read+0xde>
  802bc0:	48 b9 e0 49 80 00 00 	movabs $0x8049e0,%rcx
  802bc7:	00 00 00 
  802bca:	48 ba bd 49 80 00 00 	movabs $0x8049bd,%rdx
  802bd1:	00 00 00 
  802bd4:	be 8a 00 00 00       	mov    $0x8a,%esi
  802bd9:	48 bf d2 49 80 00 00 	movabs $0x8049d2,%rdi
  802be0:	00 00 00 
  802be3:	b8 00 00 00 00       	mov    $0x0,%eax
  802be8:	49 b8 1d 04 80 00 00 	movabs $0x80041d,%r8
  802bef:	00 00 00 
  802bf2:	41 ff d0             	callq  *%r8
  802bf5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802bf8:	48 63 d0             	movslq %eax,%rdx
  802bfb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802bff:	48 be 00 80 80 00 00 	movabs $0x808000,%rsi
  802c06:	00 00 00 
  802c09:	48 89 c7             	mov    %rax,%rdi
  802c0c:	48 b8 2f 15 80 00 00 	movabs $0x80152f,%rax
  802c13:	00 00 00 
  802c16:	ff d0                	callq  *%rax
  802c18:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c1b:	c9                   	leaveq 
  802c1c:	c3                   	retq   

0000000000802c1d <devfile_write>:
  802c1d:	55                   	push   %rbp
  802c1e:	48 89 e5             	mov    %rsp,%rbp
  802c21:	48 83 ec 40          	sub    $0x40,%rsp
  802c25:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802c29:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802c2d:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802c31:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  802c35:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802c39:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  802c40:	00 
  802c41:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802c45:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  802c49:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  802c4e:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  802c52:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802c56:	8b 50 0c             	mov    0xc(%rax),%edx
  802c59:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802c60:	00 00 00 
  802c63:	89 10                	mov    %edx,(%rax)
  802c65:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802c6c:	00 00 00 
  802c6f:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802c73:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802c77:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802c7b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802c7f:	48 89 c6             	mov    %rax,%rsi
  802c82:	48 bf 10 80 80 00 00 	movabs $0x808010,%rdi
  802c89:	00 00 00 
  802c8c:	48 b8 2f 15 80 00 00 	movabs $0x80152f,%rax
  802c93:	00 00 00 
  802c96:	ff d0                	callq  *%rax
  802c98:	be 00 00 00 00       	mov    $0x0,%esi
  802c9d:	bf 04 00 00 00       	mov    $0x4,%edi
  802ca2:	48 b8 7f 29 80 00 00 	movabs $0x80297f,%rax
  802ca9:	00 00 00 
  802cac:	ff d0                	callq  *%rax
  802cae:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802cb1:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802cb5:	79 05                	jns    802cbc <devfile_write+0x9f>
  802cb7:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802cba:	eb 43                	jmp    802cff <devfile_write+0xe2>
  802cbc:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802cbf:	48 98                	cltq   
  802cc1:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  802cc5:	76 35                	jbe    802cfc <devfile_write+0xdf>
  802cc7:	48 b9 b6 49 80 00 00 	movabs $0x8049b6,%rcx
  802cce:	00 00 00 
  802cd1:	48 ba bd 49 80 00 00 	movabs $0x8049bd,%rdx
  802cd8:	00 00 00 
  802cdb:	be a8 00 00 00       	mov    $0xa8,%esi
  802ce0:	48 bf d2 49 80 00 00 	movabs $0x8049d2,%rdi
  802ce7:	00 00 00 
  802cea:	b8 00 00 00 00       	mov    $0x0,%eax
  802cef:	49 b8 1d 04 80 00 00 	movabs $0x80041d,%r8
  802cf6:	00 00 00 
  802cf9:	41 ff d0             	callq  *%r8
  802cfc:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802cff:	c9                   	leaveq 
  802d00:	c3                   	retq   

0000000000802d01 <devfile_stat>:
  802d01:	55                   	push   %rbp
  802d02:	48 89 e5             	mov    %rsp,%rbp
  802d05:	48 83 ec 20          	sub    $0x20,%rsp
  802d09:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802d0d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802d11:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d15:	8b 50 0c             	mov    0xc(%rax),%edx
  802d18:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802d1f:	00 00 00 
  802d22:	89 10                	mov    %edx,(%rax)
  802d24:	be 00 00 00 00       	mov    $0x0,%esi
  802d29:	bf 05 00 00 00       	mov    $0x5,%edi
  802d2e:	48 b8 7f 29 80 00 00 	movabs $0x80297f,%rax
  802d35:	00 00 00 
  802d38:	ff d0                	callq  *%rax
  802d3a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d3d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d41:	79 05                	jns    802d48 <devfile_stat+0x47>
  802d43:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d46:	eb 56                	jmp    802d9e <devfile_stat+0x9d>
  802d48:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802d4c:	48 be 00 80 80 00 00 	movabs $0x808000,%rsi
  802d53:	00 00 00 
  802d56:	48 89 c7             	mov    %rax,%rdi
  802d59:	48 b8 0b 12 80 00 00 	movabs $0x80120b,%rax
  802d60:	00 00 00 
  802d63:	ff d0                	callq  *%rax
  802d65:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802d6c:	00 00 00 
  802d6f:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  802d75:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802d79:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  802d7f:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802d86:	00 00 00 
  802d89:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  802d8f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802d93:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  802d99:	b8 00 00 00 00       	mov    $0x0,%eax
  802d9e:	c9                   	leaveq 
  802d9f:	c3                   	retq   

0000000000802da0 <devfile_trunc>:
  802da0:	55                   	push   %rbp
  802da1:	48 89 e5             	mov    %rsp,%rbp
  802da4:	48 83 ec 10          	sub    $0x10,%rsp
  802da8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802dac:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802daf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802db3:	8b 50 0c             	mov    0xc(%rax),%edx
  802db6:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802dbd:	00 00 00 
  802dc0:	89 10                	mov    %edx,(%rax)
  802dc2:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802dc9:	00 00 00 
  802dcc:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802dcf:	89 50 04             	mov    %edx,0x4(%rax)
  802dd2:	be 00 00 00 00       	mov    $0x0,%esi
  802dd7:	bf 02 00 00 00       	mov    $0x2,%edi
  802ddc:	48 b8 7f 29 80 00 00 	movabs $0x80297f,%rax
  802de3:	00 00 00 
  802de6:	ff d0                	callq  *%rax
  802de8:	c9                   	leaveq 
  802de9:	c3                   	retq   

0000000000802dea <remove>:
  802dea:	55                   	push   %rbp
  802deb:	48 89 e5             	mov    %rsp,%rbp
  802dee:	48 83 ec 10          	sub    $0x10,%rsp
  802df2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802df6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802dfa:	48 89 c7             	mov    %rax,%rdi
  802dfd:	48 b8 9f 11 80 00 00 	movabs $0x80119f,%rax
  802e04:	00 00 00 
  802e07:	ff d0                	callq  *%rax
  802e09:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802e0e:	7e 07                	jle    802e17 <remove+0x2d>
  802e10:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802e15:	eb 33                	jmp    802e4a <remove+0x60>
  802e17:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802e1b:	48 89 c6             	mov    %rax,%rsi
  802e1e:	48 bf 00 80 80 00 00 	movabs $0x808000,%rdi
  802e25:	00 00 00 
  802e28:	48 b8 0b 12 80 00 00 	movabs $0x80120b,%rax
  802e2f:	00 00 00 
  802e32:	ff d0                	callq  *%rax
  802e34:	be 00 00 00 00       	mov    $0x0,%esi
  802e39:	bf 07 00 00 00       	mov    $0x7,%edi
  802e3e:	48 b8 7f 29 80 00 00 	movabs $0x80297f,%rax
  802e45:	00 00 00 
  802e48:	ff d0                	callq  *%rax
  802e4a:	c9                   	leaveq 
  802e4b:	c3                   	retq   

0000000000802e4c <sync>:
  802e4c:	55                   	push   %rbp
  802e4d:	48 89 e5             	mov    %rsp,%rbp
  802e50:	be 00 00 00 00       	mov    $0x0,%esi
  802e55:	bf 08 00 00 00       	mov    $0x8,%edi
  802e5a:	48 b8 7f 29 80 00 00 	movabs $0x80297f,%rax
  802e61:	00 00 00 
  802e64:	ff d0                	callq  *%rax
  802e66:	5d                   	pop    %rbp
  802e67:	c3                   	retq   

0000000000802e68 <copy>:
  802e68:	55                   	push   %rbp
  802e69:	48 89 e5             	mov    %rsp,%rbp
  802e6c:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  802e73:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  802e7a:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  802e81:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  802e88:	be 00 00 00 00       	mov    $0x0,%esi
  802e8d:	48 89 c7             	mov    %rax,%rdi
  802e90:	48 b8 06 2a 80 00 00 	movabs $0x802a06,%rax
  802e97:	00 00 00 
  802e9a:	ff d0                	callq  *%rax
  802e9c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e9f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ea3:	79 28                	jns    802ecd <copy+0x65>
  802ea5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ea8:	89 c6                	mov    %eax,%esi
  802eaa:	48 bf ec 49 80 00 00 	movabs $0x8049ec,%rdi
  802eb1:	00 00 00 
  802eb4:	b8 00 00 00 00       	mov    $0x0,%eax
  802eb9:	48 ba 56 06 80 00 00 	movabs $0x800656,%rdx
  802ec0:	00 00 00 
  802ec3:	ff d2                	callq  *%rdx
  802ec5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ec8:	e9 74 01 00 00       	jmpq   803041 <copy+0x1d9>
  802ecd:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  802ed4:	be 01 01 00 00       	mov    $0x101,%esi
  802ed9:	48 89 c7             	mov    %rax,%rdi
  802edc:	48 b8 06 2a 80 00 00 	movabs $0x802a06,%rax
  802ee3:	00 00 00 
  802ee6:	ff d0                	callq  *%rax
  802ee8:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802eeb:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802eef:	79 39                	jns    802f2a <copy+0xc2>
  802ef1:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802ef4:	89 c6                	mov    %eax,%esi
  802ef6:	48 bf 02 4a 80 00 00 	movabs $0x804a02,%rdi
  802efd:	00 00 00 
  802f00:	b8 00 00 00 00       	mov    $0x0,%eax
  802f05:	48 ba 56 06 80 00 00 	movabs $0x800656,%rdx
  802f0c:	00 00 00 
  802f0f:	ff d2                	callq  *%rdx
  802f11:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f14:	89 c7                	mov    %eax,%edi
  802f16:	48 b8 0e 23 80 00 00 	movabs $0x80230e,%rax
  802f1d:	00 00 00 
  802f20:	ff d0                	callq  *%rax
  802f22:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802f25:	e9 17 01 00 00       	jmpq   803041 <copy+0x1d9>
  802f2a:	eb 74                	jmp    802fa0 <copy+0x138>
  802f2c:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802f2f:	48 63 d0             	movslq %eax,%rdx
  802f32:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802f39:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802f3c:	48 89 ce             	mov    %rcx,%rsi
  802f3f:	89 c7                	mov    %eax,%edi
  802f41:	48 b8 7a 26 80 00 00 	movabs $0x80267a,%rax
  802f48:	00 00 00 
  802f4b:	ff d0                	callq  *%rax
  802f4d:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802f50:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802f54:	79 4a                	jns    802fa0 <copy+0x138>
  802f56:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802f59:	89 c6                	mov    %eax,%esi
  802f5b:	48 bf 1c 4a 80 00 00 	movabs $0x804a1c,%rdi
  802f62:	00 00 00 
  802f65:	b8 00 00 00 00       	mov    $0x0,%eax
  802f6a:	48 ba 56 06 80 00 00 	movabs $0x800656,%rdx
  802f71:	00 00 00 
  802f74:	ff d2                	callq  *%rdx
  802f76:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f79:	89 c7                	mov    %eax,%edi
  802f7b:	48 b8 0e 23 80 00 00 	movabs $0x80230e,%rax
  802f82:	00 00 00 
  802f85:	ff d0                	callq  *%rax
  802f87:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802f8a:	89 c7                	mov    %eax,%edi
  802f8c:	48 b8 0e 23 80 00 00 	movabs $0x80230e,%rax
  802f93:	00 00 00 
  802f96:	ff d0                	callq  *%rax
  802f98:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802f9b:	e9 a1 00 00 00       	jmpq   803041 <copy+0x1d9>
  802fa0:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802fa7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802faa:	ba 00 02 00 00       	mov    $0x200,%edx
  802faf:	48 89 ce             	mov    %rcx,%rsi
  802fb2:	89 c7                	mov    %eax,%edi
  802fb4:	48 b8 30 25 80 00 00 	movabs $0x802530,%rax
  802fbb:	00 00 00 
  802fbe:	ff d0                	callq  *%rax
  802fc0:	89 45 f4             	mov    %eax,-0xc(%rbp)
  802fc3:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802fc7:	0f 8f 5f ff ff ff    	jg     802f2c <copy+0xc4>
  802fcd:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802fd1:	79 47                	jns    80301a <copy+0x1b2>
  802fd3:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802fd6:	89 c6                	mov    %eax,%esi
  802fd8:	48 bf 2f 4a 80 00 00 	movabs $0x804a2f,%rdi
  802fdf:	00 00 00 
  802fe2:	b8 00 00 00 00       	mov    $0x0,%eax
  802fe7:	48 ba 56 06 80 00 00 	movabs $0x800656,%rdx
  802fee:	00 00 00 
  802ff1:	ff d2                	callq  *%rdx
  802ff3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ff6:	89 c7                	mov    %eax,%edi
  802ff8:	48 b8 0e 23 80 00 00 	movabs $0x80230e,%rax
  802fff:	00 00 00 
  803002:	ff d0                	callq  *%rax
  803004:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803007:	89 c7                	mov    %eax,%edi
  803009:	48 b8 0e 23 80 00 00 	movabs $0x80230e,%rax
  803010:	00 00 00 
  803013:	ff d0                	callq  *%rax
  803015:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803018:	eb 27                	jmp    803041 <copy+0x1d9>
  80301a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80301d:	89 c7                	mov    %eax,%edi
  80301f:	48 b8 0e 23 80 00 00 	movabs $0x80230e,%rax
  803026:	00 00 00 
  803029:	ff d0                	callq  *%rax
  80302b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80302e:	89 c7                	mov    %eax,%edi
  803030:	48 b8 0e 23 80 00 00 	movabs $0x80230e,%rax
  803037:	00 00 00 
  80303a:	ff d0                	callq  *%rax
  80303c:	b8 00 00 00 00       	mov    $0x0,%eax
  803041:	c9                   	leaveq 
  803042:	c3                   	retq   

0000000000803043 <fd2sockid>:
  803043:	55                   	push   %rbp
  803044:	48 89 e5             	mov    %rsp,%rbp
  803047:	48 83 ec 20          	sub    $0x20,%rsp
  80304b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80304e:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803052:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803055:	48 89 d6             	mov    %rdx,%rsi
  803058:	89 c7                	mov    %eax,%edi
  80305a:	48 b8 fe 20 80 00 00 	movabs $0x8020fe,%rax
  803061:	00 00 00 
  803064:	ff d0                	callq  *%rax
  803066:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803069:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80306d:	79 05                	jns    803074 <fd2sockid+0x31>
  80306f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803072:	eb 24                	jmp    803098 <fd2sockid+0x55>
  803074:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803078:	8b 10                	mov    (%rax),%edx
  80307a:	48 b8 a0 60 80 00 00 	movabs $0x8060a0,%rax
  803081:	00 00 00 
  803084:	8b 00                	mov    (%rax),%eax
  803086:	39 c2                	cmp    %eax,%edx
  803088:	74 07                	je     803091 <fd2sockid+0x4e>
  80308a:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80308f:	eb 07                	jmp    803098 <fd2sockid+0x55>
  803091:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803095:	8b 40 0c             	mov    0xc(%rax),%eax
  803098:	c9                   	leaveq 
  803099:	c3                   	retq   

000000000080309a <alloc_sockfd>:
  80309a:	55                   	push   %rbp
  80309b:	48 89 e5             	mov    %rsp,%rbp
  80309e:	48 83 ec 20          	sub    $0x20,%rsp
  8030a2:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8030a5:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8030a9:	48 89 c7             	mov    %rax,%rdi
  8030ac:	48 b8 66 20 80 00 00 	movabs $0x802066,%rax
  8030b3:	00 00 00 
  8030b6:	ff d0                	callq  *%rax
  8030b8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8030bb:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8030bf:	78 26                	js     8030e7 <alloc_sockfd+0x4d>
  8030c1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8030c5:	ba 07 04 00 00       	mov    $0x407,%edx
  8030ca:	48 89 c6             	mov    %rax,%rsi
  8030cd:	bf 00 00 00 00       	mov    $0x0,%edi
  8030d2:	48 b8 3a 1b 80 00 00 	movabs $0x801b3a,%rax
  8030d9:	00 00 00 
  8030dc:	ff d0                	callq  *%rax
  8030de:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8030e1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8030e5:	79 16                	jns    8030fd <alloc_sockfd+0x63>
  8030e7:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8030ea:	89 c7                	mov    %eax,%edi
  8030ec:	48 b8 a7 35 80 00 00 	movabs $0x8035a7,%rax
  8030f3:	00 00 00 
  8030f6:	ff d0                	callq  *%rax
  8030f8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030fb:	eb 3a                	jmp    803137 <alloc_sockfd+0x9d>
  8030fd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803101:	48 ba a0 60 80 00 00 	movabs $0x8060a0,%rdx
  803108:	00 00 00 
  80310b:	8b 12                	mov    (%rdx),%edx
  80310d:	89 10                	mov    %edx,(%rax)
  80310f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803113:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  80311a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80311e:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803121:	89 50 0c             	mov    %edx,0xc(%rax)
  803124:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803128:	48 89 c7             	mov    %rax,%rdi
  80312b:	48 b8 18 20 80 00 00 	movabs $0x802018,%rax
  803132:	00 00 00 
  803135:	ff d0                	callq  *%rax
  803137:	c9                   	leaveq 
  803138:	c3                   	retq   

0000000000803139 <accept>:
  803139:	55                   	push   %rbp
  80313a:	48 89 e5             	mov    %rsp,%rbp
  80313d:	48 83 ec 30          	sub    $0x30,%rsp
  803141:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803144:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803148:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80314c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80314f:	89 c7                	mov    %eax,%edi
  803151:	48 b8 43 30 80 00 00 	movabs $0x803043,%rax
  803158:	00 00 00 
  80315b:	ff d0                	callq  *%rax
  80315d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803160:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803164:	79 05                	jns    80316b <accept+0x32>
  803166:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803169:	eb 3b                	jmp    8031a6 <accept+0x6d>
  80316b:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80316f:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803173:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803176:	48 89 ce             	mov    %rcx,%rsi
  803179:	89 c7                	mov    %eax,%edi
  80317b:	48 b8 84 34 80 00 00 	movabs $0x803484,%rax
  803182:	00 00 00 
  803185:	ff d0                	callq  *%rax
  803187:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80318a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80318e:	79 05                	jns    803195 <accept+0x5c>
  803190:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803193:	eb 11                	jmp    8031a6 <accept+0x6d>
  803195:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803198:	89 c7                	mov    %eax,%edi
  80319a:	48 b8 9a 30 80 00 00 	movabs $0x80309a,%rax
  8031a1:	00 00 00 
  8031a4:	ff d0                	callq  *%rax
  8031a6:	c9                   	leaveq 
  8031a7:	c3                   	retq   

00000000008031a8 <bind>:
  8031a8:	55                   	push   %rbp
  8031a9:	48 89 e5             	mov    %rsp,%rbp
  8031ac:	48 83 ec 20          	sub    $0x20,%rsp
  8031b0:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8031b3:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8031b7:	89 55 e8             	mov    %edx,-0x18(%rbp)
  8031ba:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8031bd:	89 c7                	mov    %eax,%edi
  8031bf:	48 b8 43 30 80 00 00 	movabs $0x803043,%rax
  8031c6:	00 00 00 
  8031c9:	ff d0                	callq  *%rax
  8031cb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8031ce:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8031d2:	79 05                	jns    8031d9 <bind+0x31>
  8031d4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031d7:	eb 1b                	jmp    8031f4 <bind+0x4c>
  8031d9:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8031dc:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8031e0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031e3:	48 89 ce             	mov    %rcx,%rsi
  8031e6:	89 c7                	mov    %eax,%edi
  8031e8:	48 b8 03 35 80 00 00 	movabs $0x803503,%rax
  8031ef:	00 00 00 
  8031f2:	ff d0                	callq  *%rax
  8031f4:	c9                   	leaveq 
  8031f5:	c3                   	retq   

00000000008031f6 <shutdown>:
  8031f6:	55                   	push   %rbp
  8031f7:	48 89 e5             	mov    %rsp,%rbp
  8031fa:	48 83 ec 20          	sub    $0x20,%rsp
  8031fe:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803201:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803204:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803207:	89 c7                	mov    %eax,%edi
  803209:	48 b8 43 30 80 00 00 	movabs $0x803043,%rax
  803210:	00 00 00 
  803213:	ff d0                	callq  *%rax
  803215:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803218:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80321c:	79 05                	jns    803223 <shutdown+0x2d>
  80321e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803221:	eb 16                	jmp    803239 <shutdown+0x43>
  803223:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803226:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803229:	89 d6                	mov    %edx,%esi
  80322b:	89 c7                	mov    %eax,%edi
  80322d:	48 b8 67 35 80 00 00 	movabs $0x803567,%rax
  803234:	00 00 00 
  803237:	ff d0                	callq  *%rax
  803239:	c9                   	leaveq 
  80323a:	c3                   	retq   

000000000080323b <devsock_close>:
  80323b:	55                   	push   %rbp
  80323c:	48 89 e5             	mov    %rsp,%rbp
  80323f:	48 83 ec 10          	sub    $0x10,%rsp
  803243:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803247:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80324b:	48 89 c7             	mov    %rax,%rdi
  80324e:	48 b8 94 42 80 00 00 	movabs $0x804294,%rax
  803255:	00 00 00 
  803258:	ff d0                	callq  *%rax
  80325a:	83 f8 01             	cmp    $0x1,%eax
  80325d:	75 17                	jne    803276 <devsock_close+0x3b>
  80325f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803263:	8b 40 0c             	mov    0xc(%rax),%eax
  803266:	89 c7                	mov    %eax,%edi
  803268:	48 b8 a7 35 80 00 00 	movabs $0x8035a7,%rax
  80326f:	00 00 00 
  803272:	ff d0                	callq  *%rax
  803274:	eb 05                	jmp    80327b <devsock_close+0x40>
  803276:	b8 00 00 00 00       	mov    $0x0,%eax
  80327b:	c9                   	leaveq 
  80327c:	c3                   	retq   

000000000080327d <connect>:
  80327d:	55                   	push   %rbp
  80327e:	48 89 e5             	mov    %rsp,%rbp
  803281:	48 83 ec 20          	sub    $0x20,%rsp
  803285:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803288:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80328c:	89 55 e8             	mov    %edx,-0x18(%rbp)
  80328f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803292:	89 c7                	mov    %eax,%edi
  803294:	48 b8 43 30 80 00 00 	movabs $0x803043,%rax
  80329b:	00 00 00 
  80329e:	ff d0                	callq  *%rax
  8032a0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8032a3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8032a7:	79 05                	jns    8032ae <connect+0x31>
  8032a9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032ac:	eb 1b                	jmp    8032c9 <connect+0x4c>
  8032ae:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8032b1:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8032b5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032b8:	48 89 ce             	mov    %rcx,%rsi
  8032bb:	89 c7                	mov    %eax,%edi
  8032bd:	48 b8 d4 35 80 00 00 	movabs $0x8035d4,%rax
  8032c4:	00 00 00 
  8032c7:	ff d0                	callq  *%rax
  8032c9:	c9                   	leaveq 
  8032ca:	c3                   	retq   

00000000008032cb <listen>:
  8032cb:	55                   	push   %rbp
  8032cc:	48 89 e5             	mov    %rsp,%rbp
  8032cf:	48 83 ec 20          	sub    $0x20,%rsp
  8032d3:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8032d6:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8032d9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8032dc:	89 c7                	mov    %eax,%edi
  8032de:	48 b8 43 30 80 00 00 	movabs $0x803043,%rax
  8032e5:	00 00 00 
  8032e8:	ff d0                	callq  *%rax
  8032ea:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8032ed:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8032f1:	79 05                	jns    8032f8 <listen+0x2d>
  8032f3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032f6:	eb 16                	jmp    80330e <listen+0x43>
  8032f8:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8032fb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032fe:	89 d6                	mov    %edx,%esi
  803300:	89 c7                	mov    %eax,%edi
  803302:	48 b8 38 36 80 00 00 	movabs $0x803638,%rax
  803309:	00 00 00 
  80330c:	ff d0                	callq  *%rax
  80330e:	c9                   	leaveq 
  80330f:	c3                   	retq   

0000000000803310 <devsock_read>:
  803310:	55                   	push   %rbp
  803311:	48 89 e5             	mov    %rsp,%rbp
  803314:	48 83 ec 20          	sub    $0x20,%rsp
  803318:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80331c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803320:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803324:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803328:	89 c2                	mov    %eax,%edx
  80332a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80332e:	8b 40 0c             	mov    0xc(%rax),%eax
  803331:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803335:	b9 00 00 00 00       	mov    $0x0,%ecx
  80333a:	89 c7                	mov    %eax,%edi
  80333c:	48 b8 78 36 80 00 00 	movabs $0x803678,%rax
  803343:	00 00 00 
  803346:	ff d0                	callq  *%rax
  803348:	c9                   	leaveq 
  803349:	c3                   	retq   

000000000080334a <devsock_write>:
  80334a:	55                   	push   %rbp
  80334b:	48 89 e5             	mov    %rsp,%rbp
  80334e:	48 83 ec 20          	sub    $0x20,%rsp
  803352:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803356:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80335a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80335e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803362:	89 c2                	mov    %eax,%edx
  803364:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803368:	8b 40 0c             	mov    0xc(%rax),%eax
  80336b:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  80336f:	b9 00 00 00 00       	mov    $0x0,%ecx
  803374:	89 c7                	mov    %eax,%edi
  803376:	48 b8 44 37 80 00 00 	movabs $0x803744,%rax
  80337d:	00 00 00 
  803380:	ff d0                	callq  *%rax
  803382:	c9                   	leaveq 
  803383:	c3                   	retq   

0000000000803384 <devsock_stat>:
  803384:	55                   	push   %rbp
  803385:	48 89 e5             	mov    %rsp,%rbp
  803388:	48 83 ec 10          	sub    $0x10,%rsp
  80338c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803390:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803394:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803398:	48 be 4a 4a 80 00 00 	movabs $0x804a4a,%rsi
  80339f:	00 00 00 
  8033a2:	48 89 c7             	mov    %rax,%rdi
  8033a5:	48 b8 0b 12 80 00 00 	movabs $0x80120b,%rax
  8033ac:	00 00 00 
  8033af:	ff d0                	callq  *%rax
  8033b1:	b8 00 00 00 00       	mov    $0x0,%eax
  8033b6:	c9                   	leaveq 
  8033b7:	c3                   	retq   

00000000008033b8 <socket>:
  8033b8:	55                   	push   %rbp
  8033b9:	48 89 e5             	mov    %rsp,%rbp
  8033bc:	48 83 ec 20          	sub    $0x20,%rsp
  8033c0:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8033c3:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8033c6:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  8033c9:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8033cc:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  8033cf:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8033d2:	89 ce                	mov    %ecx,%esi
  8033d4:	89 c7                	mov    %eax,%edi
  8033d6:	48 b8 fc 37 80 00 00 	movabs $0x8037fc,%rax
  8033dd:	00 00 00 
  8033e0:	ff d0                	callq  *%rax
  8033e2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8033e5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8033e9:	79 05                	jns    8033f0 <socket+0x38>
  8033eb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033ee:	eb 11                	jmp    803401 <socket+0x49>
  8033f0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033f3:	89 c7                	mov    %eax,%edi
  8033f5:	48 b8 9a 30 80 00 00 	movabs $0x80309a,%rax
  8033fc:	00 00 00 
  8033ff:	ff d0                	callq  *%rax
  803401:	c9                   	leaveq 
  803402:	c3                   	retq   

0000000000803403 <nsipc>:
  803403:	55                   	push   %rbp
  803404:	48 89 e5             	mov    %rsp,%rbp
  803407:	48 83 ec 10          	sub    $0x10,%rsp
  80340b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80340e:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  803415:	00 00 00 
  803418:	8b 00                	mov    (%rax),%eax
  80341a:	85 c0                	test   %eax,%eax
  80341c:	75 1d                	jne    80343b <nsipc+0x38>
  80341e:	bf 02 00 00 00       	mov    $0x2,%edi
  803423:	48 b8 22 42 80 00 00 	movabs $0x804222,%rax
  80342a:	00 00 00 
  80342d:	ff d0                	callq  *%rax
  80342f:	48 ba 04 70 80 00 00 	movabs $0x807004,%rdx
  803436:	00 00 00 
  803439:	89 02                	mov    %eax,(%rdx)
  80343b:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  803442:	00 00 00 
  803445:	8b 00                	mov    (%rax),%eax
  803447:	8b 75 fc             	mov    -0x4(%rbp),%esi
  80344a:	b9 07 00 00 00       	mov    $0x7,%ecx
  80344f:	48 ba 00 a0 80 00 00 	movabs $0x80a000,%rdx
  803456:	00 00 00 
  803459:	89 c7                	mov    %eax,%edi
  80345b:	48 b8 8c 41 80 00 00 	movabs $0x80418c,%rax
  803462:	00 00 00 
  803465:	ff d0                	callq  *%rax
  803467:	ba 00 00 00 00       	mov    $0x0,%edx
  80346c:	be 00 00 00 00       	mov    $0x0,%esi
  803471:	bf 00 00 00 00       	mov    $0x0,%edi
  803476:	48 b8 cb 40 80 00 00 	movabs $0x8040cb,%rax
  80347d:	00 00 00 
  803480:	ff d0                	callq  *%rax
  803482:	c9                   	leaveq 
  803483:	c3                   	retq   

0000000000803484 <nsipc_accept>:
  803484:	55                   	push   %rbp
  803485:	48 89 e5             	mov    %rsp,%rbp
  803488:	48 83 ec 30          	sub    $0x30,%rsp
  80348c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80348f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803493:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803497:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80349e:	00 00 00 
  8034a1:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8034a4:	89 10                	mov    %edx,(%rax)
  8034a6:	bf 01 00 00 00       	mov    $0x1,%edi
  8034ab:	48 b8 03 34 80 00 00 	movabs $0x803403,%rax
  8034b2:	00 00 00 
  8034b5:	ff d0                	callq  *%rax
  8034b7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8034ba:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8034be:	78 3e                	js     8034fe <nsipc_accept+0x7a>
  8034c0:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8034c7:	00 00 00 
  8034ca:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8034ce:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8034d2:	8b 40 10             	mov    0x10(%rax),%eax
  8034d5:	89 c2                	mov    %eax,%edx
  8034d7:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8034db:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8034df:	48 89 ce             	mov    %rcx,%rsi
  8034e2:	48 89 c7             	mov    %rax,%rdi
  8034e5:	48 b8 2f 15 80 00 00 	movabs $0x80152f,%rax
  8034ec:	00 00 00 
  8034ef:	ff d0                	callq  *%rax
  8034f1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8034f5:	8b 50 10             	mov    0x10(%rax),%edx
  8034f8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8034fc:	89 10                	mov    %edx,(%rax)
  8034fe:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803501:	c9                   	leaveq 
  803502:	c3                   	retq   

0000000000803503 <nsipc_bind>:
  803503:	55                   	push   %rbp
  803504:	48 89 e5             	mov    %rsp,%rbp
  803507:	48 83 ec 10          	sub    $0x10,%rsp
  80350b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80350e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803512:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803515:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80351c:	00 00 00 
  80351f:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803522:	89 10                	mov    %edx,(%rax)
  803524:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803527:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80352b:	48 89 c6             	mov    %rax,%rsi
  80352e:	48 bf 04 a0 80 00 00 	movabs $0x80a004,%rdi
  803535:	00 00 00 
  803538:	48 b8 2f 15 80 00 00 	movabs $0x80152f,%rax
  80353f:	00 00 00 
  803542:	ff d0                	callq  *%rax
  803544:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80354b:	00 00 00 
  80354e:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803551:	89 50 14             	mov    %edx,0x14(%rax)
  803554:	bf 02 00 00 00       	mov    $0x2,%edi
  803559:	48 b8 03 34 80 00 00 	movabs $0x803403,%rax
  803560:	00 00 00 
  803563:	ff d0                	callq  *%rax
  803565:	c9                   	leaveq 
  803566:	c3                   	retq   

0000000000803567 <nsipc_shutdown>:
  803567:	55                   	push   %rbp
  803568:	48 89 e5             	mov    %rsp,%rbp
  80356b:	48 83 ec 10          	sub    $0x10,%rsp
  80356f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803572:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803575:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80357c:	00 00 00 
  80357f:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803582:	89 10                	mov    %edx,(%rax)
  803584:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80358b:	00 00 00 
  80358e:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803591:	89 50 04             	mov    %edx,0x4(%rax)
  803594:	bf 03 00 00 00       	mov    $0x3,%edi
  803599:	48 b8 03 34 80 00 00 	movabs $0x803403,%rax
  8035a0:	00 00 00 
  8035a3:	ff d0                	callq  *%rax
  8035a5:	c9                   	leaveq 
  8035a6:	c3                   	retq   

00000000008035a7 <nsipc_close>:
  8035a7:	55                   	push   %rbp
  8035a8:	48 89 e5             	mov    %rsp,%rbp
  8035ab:	48 83 ec 10          	sub    $0x10,%rsp
  8035af:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8035b2:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8035b9:	00 00 00 
  8035bc:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8035bf:	89 10                	mov    %edx,(%rax)
  8035c1:	bf 04 00 00 00       	mov    $0x4,%edi
  8035c6:	48 b8 03 34 80 00 00 	movabs $0x803403,%rax
  8035cd:	00 00 00 
  8035d0:	ff d0                	callq  *%rax
  8035d2:	c9                   	leaveq 
  8035d3:	c3                   	retq   

00000000008035d4 <nsipc_connect>:
  8035d4:	55                   	push   %rbp
  8035d5:	48 89 e5             	mov    %rsp,%rbp
  8035d8:	48 83 ec 10          	sub    $0x10,%rsp
  8035dc:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8035df:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8035e3:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8035e6:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8035ed:	00 00 00 
  8035f0:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8035f3:	89 10                	mov    %edx,(%rax)
  8035f5:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8035f8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8035fc:	48 89 c6             	mov    %rax,%rsi
  8035ff:	48 bf 04 a0 80 00 00 	movabs $0x80a004,%rdi
  803606:	00 00 00 
  803609:	48 b8 2f 15 80 00 00 	movabs $0x80152f,%rax
  803610:	00 00 00 
  803613:	ff d0                	callq  *%rax
  803615:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80361c:	00 00 00 
  80361f:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803622:	89 50 14             	mov    %edx,0x14(%rax)
  803625:	bf 05 00 00 00       	mov    $0x5,%edi
  80362a:	48 b8 03 34 80 00 00 	movabs $0x803403,%rax
  803631:	00 00 00 
  803634:	ff d0                	callq  *%rax
  803636:	c9                   	leaveq 
  803637:	c3                   	retq   

0000000000803638 <nsipc_listen>:
  803638:	55                   	push   %rbp
  803639:	48 89 e5             	mov    %rsp,%rbp
  80363c:	48 83 ec 10          	sub    $0x10,%rsp
  803640:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803643:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803646:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80364d:	00 00 00 
  803650:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803653:	89 10                	mov    %edx,(%rax)
  803655:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80365c:	00 00 00 
  80365f:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803662:	89 50 04             	mov    %edx,0x4(%rax)
  803665:	bf 06 00 00 00       	mov    $0x6,%edi
  80366a:	48 b8 03 34 80 00 00 	movabs $0x803403,%rax
  803671:	00 00 00 
  803674:	ff d0                	callq  *%rax
  803676:	c9                   	leaveq 
  803677:	c3                   	retq   

0000000000803678 <nsipc_recv>:
  803678:	55                   	push   %rbp
  803679:	48 89 e5             	mov    %rsp,%rbp
  80367c:	48 83 ec 30          	sub    $0x30,%rsp
  803680:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803683:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803687:	89 55 e8             	mov    %edx,-0x18(%rbp)
  80368a:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  80368d:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803694:	00 00 00 
  803697:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80369a:	89 10                	mov    %edx,(%rax)
  80369c:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8036a3:	00 00 00 
  8036a6:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8036a9:	89 50 04             	mov    %edx,0x4(%rax)
  8036ac:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8036b3:	00 00 00 
  8036b6:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8036b9:	89 50 08             	mov    %edx,0x8(%rax)
  8036bc:	bf 07 00 00 00       	mov    $0x7,%edi
  8036c1:	48 b8 03 34 80 00 00 	movabs $0x803403,%rax
  8036c8:	00 00 00 
  8036cb:	ff d0                	callq  *%rax
  8036cd:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8036d0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8036d4:	78 69                	js     80373f <nsipc_recv+0xc7>
  8036d6:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  8036dd:	7f 08                	jg     8036e7 <nsipc_recv+0x6f>
  8036df:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036e2:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  8036e5:	7e 35                	jle    80371c <nsipc_recv+0xa4>
  8036e7:	48 b9 51 4a 80 00 00 	movabs $0x804a51,%rcx
  8036ee:	00 00 00 
  8036f1:	48 ba 66 4a 80 00 00 	movabs $0x804a66,%rdx
  8036f8:	00 00 00 
  8036fb:	be 62 00 00 00       	mov    $0x62,%esi
  803700:	48 bf 7b 4a 80 00 00 	movabs $0x804a7b,%rdi
  803707:	00 00 00 
  80370a:	b8 00 00 00 00       	mov    $0x0,%eax
  80370f:	49 b8 1d 04 80 00 00 	movabs $0x80041d,%r8
  803716:	00 00 00 
  803719:	41 ff d0             	callq  *%r8
  80371c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80371f:	48 63 d0             	movslq %eax,%rdx
  803722:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803726:	48 be 00 a0 80 00 00 	movabs $0x80a000,%rsi
  80372d:	00 00 00 
  803730:	48 89 c7             	mov    %rax,%rdi
  803733:	48 b8 2f 15 80 00 00 	movabs $0x80152f,%rax
  80373a:	00 00 00 
  80373d:	ff d0                	callq  *%rax
  80373f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803742:	c9                   	leaveq 
  803743:	c3                   	retq   

0000000000803744 <nsipc_send>:
  803744:	55                   	push   %rbp
  803745:	48 89 e5             	mov    %rsp,%rbp
  803748:	48 83 ec 20          	sub    $0x20,%rsp
  80374c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80374f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803753:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803756:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  803759:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803760:	00 00 00 
  803763:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803766:	89 10                	mov    %edx,(%rax)
  803768:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  80376f:	7e 35                	jle    8037a6 <nsipc_send+0x62>
  803771:	48 b9 8a 4a 80 00 00 	movabs $0x804a8a,%rcx
  803778:	00 00 00 
  80377b:	48 ba 66 4a 80 00 00 	movabs $0x804a66,%rdx
  803782:	00 00 00 
  803785:	be 6d 00 00 00       	mov    $0x6d,%esi
  80378a:	48 bf 7b 4a 80 00 00 	movabs $0x804a7b,%rdi
  803791:	00 00 00 
  803794:	b8 00 00 00 00       	mov    $0x0,%eax
  803799:	49 b8 1d 04 80 00 00 	movabs $0x80041d,%r8
  8037a0:	00 00 00 
  8037a3:	41 ff d0             	callq  *%r8
  8037a6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8037a9:	48 63 d0             	movslq %eax,%rdx
  8037ac:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8037b0:	48 89 c6             	mov    %rax,%rsi
  8037b3:	48 bf 0c a0 80 00 00 	movabs $0x80a00c,%rdi
  8037ba:	00 00 00 
  8037bd:	48 b8 2f 15 80 00 00 	movabs $0x80152f,%rax
  8037c4:	00 00 00 
  8037c7:	ff d0                	callq  *%rax
  8037c9:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8037d0:	00 00 00 
  8037d3:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8037d6:	89 50 04             	mov    %edx,0x4(%rax)
  8037d9:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8037e0:	00 00 00 
  8037e3:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8037e6:	89 50 08             	mov    %edx,0x8(%rax)
  8037e9:	bf 08 00 00 00       	mov    $0x8,%edi
  8037ee:	48 b8 03 34 80 00 00 	movabs $0x803403,%rax
  8037f5:	00 00 00 
  8037f8:	ff d0                	callq  *%rax
  8037fa:	c9                   	leaveq 
  8037fb:	c3                   	retq   

00000000008037fc <nsipc_socket>:
  8037fc:	55                   	push   %rbp
  8037fd:	48 89 e5             	mov    %rsp,%rbp
  803800:	48 83 ec 10          	sub    $0x10,%rsp
  803804:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803807:	89 75 f8             	mov    %esi,-0x8(%rbp)
  80380a:	89 55 f4             	mov    %edx,-0xc(%rbp)
  80380d:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803814:	00 00 00 
  803817:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80381a:	89 10                	mov    %edx,(%rax)
  80381c:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803823:	00 00 00 
  803826:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803829:	89 50 04             	mov    %edx,0x4(%rax)
  80382c:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803833:	00 00 00 
  803836:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803839:	89 50 08             	mov    %edx,0x8(%rax)
  80383c:	bf 09 00 00 00       	mov    $0x9,%edi
  803841:	48 b8 03 34 80 00 00 	movabs $0x803403,%rax
  803848:	00 00 00 
  80384b:	ff d0                	callq  *%rax
  80384d:	c9                   	leaveq 
  80384e:	c3                   	retq   

000000000080384f <pipe>:
  80384f:	55                   	push   %rbp
  803850:	48 89 e5             	mov    %rsp,%rbp
  803853:	53                   	push   %rbx
  803854:	48 83 ec 38          	sub    $0x38,%rsp
  803858:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  80385c:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  803860:	48 89 c7             	mov    %rax,%rdi
  803863:	48 b8 66 20 80 00 00 	movabs $0x802066,%rax
  80386a:	00 00 00 
  80386d:	ff d0                	callq  *%rax
  80386f:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803872:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803876:	0f 88 bf 01 00 00    	js     803a3b <pipe+0x1ec>
  80387c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803880:	ba 07 04 00 00       	mov    $0x407,%edx
  803885:	48 89 c6             	mov    %rax,%rsi
  803888:	bf 00 00 00 00       	mov    $0x0,%edi
  80388d:	48 b8 3a 1b 80 00 00 	movabs $0x801b3a,%rax
  803894:	00 00 00 
  803897:	ff d0                	callq  *%rax
  803899:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80389c:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8038a0:	0f 88 95 01 00 00    	js     803a3b <pipe+0x1ec>
  8038a6:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  8038aa:	48 89 c7             	mov    %rax,%rdi
  8038ad:	48 b8 66 20 80 00 00 	movabs $0x802066,%rax
  8038b4:	00 00 00 
  8038b7:	ff d0                	callq  *%rax
  8038b9:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8038bc:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8038c0:	0f 88 5d 01 00 00    	js     803a23 <pipe+0x1d4>
  8038c6:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8038ca:	ba 07 04 00 00       	mov    $0x407,%edx
  8038cf:	48 89 c6             	mov    %rax,%rsi
  8038d2:	bf 00 00 00 00       	mov    $0x0,%edi
  8038d7:	48 b8 3a 1b 80 00 00 	movabs $0x801b3a,%rax
  8038de:	00 00 00 
  8038e1:	ff d0                	callq  *%rax
  8038e3:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8038e6:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8038ea:	0f 88 33 01 00 00    	js     803a23 <pipe+0x1d4>
  8038f0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8038f4:	48 89 c7             	mov    %rax,%rdi
  8038f7:	48 b8 3b 20 80 00 00 	movabs $0x80203b,%rax
  8038fe:	00 00 00 
  803901:	ff d0                	callq  *%rax
  803903:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803907:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80390b:	ba 07 04 00 00       	mov    $0x407,%edx
  803910:	48 89 c6             	mov    %rax,%rsi
  803913:	bf 00 00 00 00       	mov    $0x0,%edi
  803918:	48 b8 3a 1b 80 00 00 	movabs $0x801b3a,%rax
  80391f:	00 00 00 
  803922:	ff d0                	callq  *%rax
  803924:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803927:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80392b:	79 05                	jns    803932 <pipe+0xe3>
  80392d:	e9 d9 00 00 00       	jmpq   803a0b <pipe+0x1bc>
  803932:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803936:	48 89 c7             	mov    %rax,%rdi
  803939:	48 b8 3b 20 80 00 00 	movabs $0x80203b,%rax
  803940:	00 00 00 
  803943:	ff d0                	callq  *%rax
  803945:	48 89 c2             	mov    %rax,%rdx
  803948:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80394c:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  803952:	48 89 d1             	mov    %rdx,%rcx
  803955:	ba 00 00 00 00       	mov    $0x0,%edx
  80395a:	48 89 c6             	mov    %rax,%rsi
  80395d:	bf 00 00 00 00       	mov    $0x0,%edi
  803962:	48 b8 8a 1b 80 00 00 	movabs $0x801b8a,%rax
  803969:	00 00 00 
  80396c:	ff d0                	callq  *%rax
  80396e:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803971:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803975:	79 1b                	jns    803992 <pipe+0x143>
  803977:	90                   	nop
  803978:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80397c:	48 89 c6             	mov    %rax,%rsi
  80397f:	bf 00 00 00 00       	mov    $0x0,%edi
  803984:	48 b8 e5 1b 80 00 00 	movabs $0x801be5,%rax
  80398b:	00 00 00 
  80398e:	ff d0                	callq  *%rax
  803990:	eb 79                	jmp    803a0b <pipe+0x1bc>
  803992:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803996:	48 ba e0 60 80 00 00 	movabs $0x8060e0,%rdx
  80399d:	00 00 00 
  8039a0:	8b 12                	mov    (%rdx),%edx
  8039a2:	89 10                	mov    %edx,(%rax)
  8039a4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8039a8:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  8039af:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8039b3:	48 ba e0 60 80 00 00 	movabs $0x8060e0,%rdx
  8039ba:	00 00 00 
  8039bd:	8b 12                	mov    (%rdx),%edx
  8039bf:	89 10                	mov    %edx,(%rax)
  8039c1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8039c5:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  8039cc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8039d0:	48 89 c7             	mov    %rax,%rdi
  8039d3:	48 b8 18 20 80 00 00 	movabs $0x802018,%rax
  8039da:	00 00 00 
  8039dd:	ff d0                	callq  *%rax
  8039df:	89 c2                	mov    %eax,%edx
  8039e1:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8039e5:	89 10                	mov    %edx,(%rax)
  8039e7:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8039eb:	48 8d 58 04          	lea    0x4(%rax),%rbx
  8039ef:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8039f3:	48 89 c7             	mov    %rax,%rdi
  8039f6:	48 b8 18 20 80 00 00 	movabs $0x802018,%rax
  8039fd:	00 00 00 
  803a00:	ff d0                	callq  *%rax
  803a02:	89 03                	mov    %eax,(%rbx)
  803a04:	b8 00 00 00 00       	mov    $0x0,%eax
  803a09:	eb 33                	jmp    803a3e <pipe+0x1ef>
  803a0b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803a0f:	48 89 c6             	mov    %rax,%rsi
  803a12:	bf 00 00 00 00       	mov    $0x0,%edi
  803a17:	48 b8 e5 1b 80 00 00 	movabs $0x801be5,%rax
  803a1e:	00 00 00 
  803a21:	ff d0                	callq  *%rax
  803a23:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803a27:	48 89 c6             	mov    %rax,%rsi
  803a2a:	bf 00 00 00 00       	mov    $0x0,%edi
  803a2f:	48 b8 e5 1b 80 00 00 	movabs $0x801be5,%rax
  803a36:	00 00 00 
  803a39:	ff d0                	callq  *%rax
  803a3b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803a3e:	48 83 c4 38          	add    $0x38,%rsp
  803a42:	5b                   	pop    %rbx
  803a43:	5d                   	pop    %rbp
  803a44:	c3                   	retq   

0000000000803a45 <_pipeisclosed>:
  803a45:	55                   	push   %rbp
  803a46:	48 89 e5             	mov    %rsp,%rbp
  803a49:	53                   	push   %rbx
  803a4a:	48 83 ec 28          	sub    $0x28,%rsp
  803a4e:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803a52:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803a56:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803a5d:	00 00 00 
  803a60:	48 8b 00             	mov    (%rax),%rax
  803a63:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  803a69:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803a6c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803a70:	48 89 c7             	mov    %rax,%rdi
  803a73:	48 b8 94 42 80 00 00 	movabs $0x804294,%rax
  803a7a:	00 00 00 
  803a7d:	ff d0                	callq  *%rax
  803a7f:	89 c3                	mov    %eax,%ebx
  803a81:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803a85:	48 89 c7             	mov    %rax,%rdi
  803a88:	48 b8 94 42 80 00 00 	movabs $0x804294,%rax
  803a8f:	00 00 00 
  803a92:	ff d0                	callq  *%rax
  803a94:	39 c3                	cmp    %eax,%ebx
  803a96:	0f 94 c0             	sete   %al
  803a99:	0f b6 c0             	movzbl %al,%eax
  803a9c:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803a9f:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803aa6:	00 00 00 
  803aa9:	48 8b 00             	mov    (%rax),%rax
  803aac:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  803ab2:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  803ab5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803ab8:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  803abb:	75 05                	jne    803ac2 <_pipeisclosed+0x7d>
  803abd:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803ac0:	eb 4f                	jmp    803b11 <_pipeisclosed+0xcc>
  803ac2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803ac5:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  803ac8:	74 42                	je     803b0c <_pipeisclosed+0xc7>
  803aca:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  803ace:	75 3c                	jne    803b0c <_pipeisclosed+0xc7>
  803ad0:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803ad7:	00 00 00 
  803ada:	48 8b 00             	mov    (%rax),%rax
  803add:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  803ae3:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803ae6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803ae9:	89 c6                	mov    %eax,%esi
  803aeb:	48 bf 9b 4a 80 00 00 	movabs $0x804a9b,%rdi
  803af2:	00 00 00 
  803af5:	b8 00 00 00 00       	mov    $0x0,%eax
  803afa:	49 b8 56 06 80 00 00 	movabs $0x800656,%r8
  803b01:	00 00 00 
  803b04:	41 ff d0             	callq  *%r8
  803b07:	e9 4a ff ff ff       	jmpq   803a56 <_pipeisclosed+0x11>
  803b0c:	e9 45 ff ff ff       	jmpq   803a56 <_pipeisclosed+0x11>
  803b11:	48 83 c4 28          	add    $0x28,%rsp
  803b15:	5b                   	pop    %rbx
  803b16:	5d                   	pop    %rbp
  803b17:	c3                   	retq   

0000000000803b18 <pipeisclosed>:
  803b18:	55                   	push   %rbp
  803b19:	48 89 e5             	mov    %rsp,%rbp
  803b1c:	48 83 ec 30          	sub    $0x30,%rsp
  803b20:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803b23:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  803b27:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803b2a:	48 89 d6             	mov    %rdx,%rsi
  803b2d:	89 c7                	mov    %eax,%edi
  803b2f:	48 b8 fe 20 80 00 00 	movabs $0x8020fe,%rax
  803b36:	00 00 00 
  803b39:	ff d0                	callq  *%rax
  803b3b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803b3e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803b42:	79 05                	jns    803b49 <pipeisclosed+0x31>
  803b44:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b47:	eb 31                	jmp    803b7a <pipeisclosed+0x62>
  803b49:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803b4d:	48 89 c7             	mov    %rax,%rdi
  803b50:	48 b8 3b 20 80 00 00 	movabs $0x80203b,%rax
  803b57:	00 00 00 
  803b5a:	ff d0                	callq  *%rax
  803b5c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803b60:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803b64:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803b68:	48 89 d6             	mov    %rdx,%rsi
  803b6b:	48 89 c7             	mov    %rax,%rdi
  803b6e:	48 b8 45 3a 80 00 00 	movabs $0x803a45,%rax
  803b75:	00 00 00 
  803b78:	ff d0                	callq  *%rax
  803b7a:	c9                   	leaveq 
  803b7b:	c3                   	retq   

0000000000803b7c <devpipe_read>:
  803b7c:	55                   	push   %rbp
  803b7d:	48 89 e5             	mov    %rsp,%rbp
  803b80:	48 83 ec 40          	sub    $0x40,%rsp
  803b84:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803b88:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803b8c:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803b90:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803b94:	48 89 c7             	mov    %rax,%rdi
  803b97:	48 b8 3b 20 80 00 00 	movabs $0x80203b,%rax
  803b9e:	00 00 00 
  803ba1:	ff d0                	callq  *%rax
  803ba3:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803ba7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803bab:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803baf:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803bb6:	00 
  803bb7:	e9 92 00 00 00       	jmpq   803c4e <devpipe_read+0xd2>
  803bbc:	eb 41                	jmp    803bff <devpipe_read+0x83>
  803bbe:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  803bc3:	74 09                	je     803bce <devpipe_read+0x52>
  803bc5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803bc9:	e9 92 00 00 00       	jmpq   803c60 <devpipe_read+0xe4>
  803bce:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803bd2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803bd6:	48 89 d6             	mov    %rdx,%rsi
  803bd9:	48 89 c7             	mov    %rax,%rdi
  803bdc:	48 b8 45 3a 80 00 00 	movabs $0x803a45,%rax
  803be3:	00 00 00 
  803be6:	ff d0                	callq  *%rax
  803be8:	85 c0                	test   %eax,%eax
  803bea:	74 07                	je     803bf3 <devpipe_read+0x77>
  803bec:	b8 00 00 00 00       	mov    $0x0,%eax
  803bf1:	eb 6d                	jmp    803c60 <devpipe_read+0xe4>
  803bf3:	48 b8 fc 1a 80 00 00 	movabs $0x801afc,%rax
  803bfa:	00 00 00 
  803bfd:	ff d0                	callq  *%rax
  803bff:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803c03:	8b 10                	mov    (%rax),%edx
  803c05:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803c09:	8b 40 04             	mov    0x4(%rax),%eax
  803c0c:	39 c2                	cmp    %eax,%edx
  803c0e:	74 ae                	je     803bbe <devpipe_read+0x42>
  803c10:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803c14:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803c18:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  803c1c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803c20:	8b 00                	mov    (%rax),%eax
  803c22:	99                   	cltd   
  803c23:	c1 ea 1b             	shr    $0x1b,%edx
  803c26:	01 d0                	add    %edx,%eax
  803c28:	83 e0 1f             	and    $0x1f,%eax
  803c2b:	29 d0                	sub    %edx,%eax
  803c2d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803c31:	48 98                	cltq   
  803c33:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  803c38:	88 01                	mov    %al,(%rcx)
  803c3a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803c3e:	8b 00                	mov    (%rax),%eax
  803c40:	8d 50 01             	lea    0x1(%rax),%edx
  803c43:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803c47:	89 10                	mov    %edx,(%rax)
  803c49:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803c4e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803c52:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803c56:	0f 82 60 ff ff ff    	jb     803bbc <devpipe_read+0x40>
  803c5c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803c60:	c9                   	leaveq 
  803c61:	c3                   	retq   

0000000000803c62 <devpipe_write>:
  803c62:	55                   	push   %rbp
  803c63:	48 89 e5             	mov    %rsp,%rbp
  803c66:	48 83 ec 40          	sub    $0x40,%rsp
  803c6a:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803c6e:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803c72:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803c76:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803c7a:	48 89 c7             	mov    %rax,%rdi
  803c7d:	48 b8 3b 20 80 00 00 	movabs $0x80203b,%rax
  803c84:	00 00 00 
  803c87:	ff d0                	callq  *%rax
  803c89:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803c8d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803c91:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803c95:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803c9c:	00 
  803c9d:	e9 8e 00 00 00       	jmpq   803d30 <devpipe_write+0xce>
  803ca2:	eb 31                	jmp    803cd5 <devpipe_write+0x73>
  803ca4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803ca8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803cac:	48 89 d6             	mov    %rdx,%rsi
  803caf:	48 89 c7             	mov    %rax,%rdi
  803cb2:	48 b8 45 3a 80 00 00 	movabs $0x803a45,%rax
  803cb9:	00 00 00 
  803cbc:	ff d0                	callq  *%rax
  803cbe:	85 c0                	test   %eax,%eax
  803cc0:	74 07                	je     803cc9 <devpipe_write+0x67>
  803cc2:	b8 00 00 00 00       	mov    $0x0,%eax
  803cc7:	eb 79                	jmp    803d42 <devpipe_write+0xe0>
  803cc9:	48 b8 fc 1a 80 00 00 	movabs $0x801afc,%rax
  803cd0:	00 00 00 
  803cd3:	ff d0                	callq  *%rax
  803cd5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803cd9:	8b 40 04             	mov    0x4(%rax),%eax
  803cdc:	48 63 d0             	movslq %eax,%rdx
  803cdf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ce3:	8b 00                	mov    (%rax),%eax
  803ce5:	48 98                	cltq   
  803ce7:	48 83 c0 20          	add    $0x20,%rax
  803ceb:	48 39 c2             	cmp    %rax,%rdx
  803cee:	73 b4                	jae    803ca4 <devpipe_write+0x42>
  803cf0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803cf4:	8b 40 04             	mov    0x4(%rax),%eax
  803cf7:	99                   	cltd   
  803cf8:	c1 ea 1b             	shr    $0x1b,%edx
  803cfb:	01 d0                	add    %edx,%eax
  803cfd:	83 e0 1f             	and    $0x1f,%eax
  803d00:	29 d0                	sub    %edx,%eax
  803d02:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  803d06:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  803d0a:	48 01 ca             	add    %rcx,%rdx
  803d0d:	0f b6 0a             	movzbl (%rdx),%ecx
  803d10:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803d14:	48 98                	cltq   
  803d16:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  803d1a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803d1e:	8b 40 04             	mov    0x4(%rax),%eax
  803d21:	8d 50 01             	lea    0x1(%rax),%edx
  803d24:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803d28:	89 50 04             	mov    %edx,0x4(%rax)
  803d2b:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803d30:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803d34:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803d38:	0f 82 64 ff ff ff    	jb     803ca2 <devpipe_write+0x40>
  803d3e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803d42:	c9                   	leaveq 
  803d43:	c3                   	retq   

0000000000803d44 <devpipe_stat>:
  803d44:	55                   	push   %rbp
  803d45:	48 89 e5             	mov    %rsp,%rbp
  803d48:	48 83 ec 20          	sub    $0x20,%rsp
  803d4c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803d50:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803d54:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803d58:	48 89 c7             	mov    %rax,%rdi
  803d5b:	48 b8 3b 20 80 00 00 	movabs $0x80203b,%rax
  803d62:	00 00 00 
  803d65:	ff d0                	callq  *%rax
  803d67:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803d6b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803d6f:	48 be ae 4a 80 00 00 	movabs $0x804aae,%rsi
  803d76:	00 00 00 
  803d79:	48 89 c7             	mov    %rax,%rdi
  803d7c:	48 b8 0b 12 80 00 00 	movabs $0x80120b,%rax
  803d83:	00 00 00 
  803d86:	ff d0                	callq  *%rax
  803d88:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803d8c:	8b 50 04             	mov    0x4(%rax),%edx
  803d8f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803d93:	8b 00                	mov    (%rax),%eax
  803d95:	29 c2                	sub    %eax,%edx
  803d97:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803d9b:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  803da1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803da5:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  803dac:	00 00 00 
  803daf:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803db3:	48 b9 e0 60 80 00 00 	movabs $0x8060e0,%rcx
  803dba:	00 00 00 
  803dbd:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  803dc4:	b8 00 00 00 00       	mov    $0x0,%eax
  803dc9:	c9                   	leaveq 
  803dca:	c3                   	retq   

0000000000803dcb <devpipe_close>:
  803dcb:	55                   	push   %rbp
  803dcc:	48 89 e5             	mov    %rsp,%rbp
  803dcf:	48 83 ec 10          	sub    $0x10,%rsp
  803dd3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803dd7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803ddb:	48 89 c6             	mov    %rax,%rsi
  803dde:	bf 00 00 00 00       	mov    $0x0,%edi
  803de3:	48 b8 e5 1b 80 00 00 	movabs $0x801be5,%rax
  803dea:	00 00 00 
  803ded:	ff d0                	callq  *%rax
  803def:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803df3:	48 89 c7             	mov    %rax,%rdi
  803df6:	48 b8 3b 20 80 00 00 	movabs $0x80203b,%rax
  803dfd:	00 00 00 
  803e00:	ff d0                	callq  *%rax
  803e02:	48 89 c6             	mov    %rax,%rsi
  803e05:	bf 00 00 00 00       	mov    $0x0,%edi
  803e0a:	48 b8 e5 1b 80 00 00 	movabs $0x801be5,%rax
  803e11:	00 00 00 
  803e14:	ff d0                	callq  *%rax
  803e16:	c9                   	leaveq 
  803e17:	c3                   	retq   

0000000000803e18 <cputchar>:
  803e18:	55                   	push   %rbp
  803e19:	48 89 e5             	mov    %rsp,%rbp
  803e1c:	48 83 ec 20          	sub    $0x20,%rsp
  803e20:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803e23:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803e26:	88 45 ff             	mov    %al,-0x1(%rbp)
  803e29:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  803e2d:	be 01 00 00 00       	mov    $0x1,%esi
  803e32:	48 89 c7             	mov    %rax,%rdi
  803e35:	48 b8 f2 19 80 00 00 	movabs $0x8019f2,%rax
  803e3c:	00 00 00 
  803e3f:	ff d0                	callq  *%rax
  803e41:	c9                   	leaveq 
  803e42:	c3                   	retq   

0000000000803e43 <getchar>:
  803e43:	55                   	push   %rbp
  803e44:	48 89 e5             	mov    %rsp,%rbp
  803e47:	48 83 ec 10          	sub    $0x10,%rsp
  803e4b:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  803e4f:	ba 01 00 00 00       	mov    $0x1,%edx
  803e54:	48 89 c6             	mov    %rax,%rsi
  803e57:	bf 00 00 00 00       	mov    $0x0,%edi
  803e5c:	48 b8 30 25 80 00 00 	movabs $0x802530,%rax
  803e63:	00 00 00 
  803e66:	ff d0                	callq  *%rax
  803e68:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803e6b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803e6f:	79 05                	jns    803e76 <getchar+0x33>
  803e71:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e74:	eb 14                	jmp    803e8a <getchar+0x47>
  803e76:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803e7a:	7f 07                	jg     803e83 <getchar+0x40>
  803e7c:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  803e81:	eb 07                	jmp    803e8a <getchar+0x47>
  803e83:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  803e87:	0f b6 c0             	movzbl %al,%eax
  803e8a:	c9                   	leaveq 
  803e8b:	c3                   	retq   

0000000000803e8c <iscons>:
  803e8c:	55                   	push   %rbp
  803e8d:	48 89 e5             	mov    %rsp,%rbp
  803e90:	48 83 ec 20          	sub    $0x20,%rsp
  803e94:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803e97:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803e9b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803e9e:	48 89 d6             	mov    %rdx,%rsi
  803ea1:	89 c7                	mov    %eax,%edi
  803ea3:	48 b8 fe 20 80 00 00 	movabs $0x8020fe,%rax
  803eaa:	00 00 00 
  803ead:	ff d0                	callq  *%rax
  803eaf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803eb2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803eb6:	79 05                	jns    803ebd <iscons+0x31>
  803eb8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ebb:	eb 1a                	jmp    803ed7 <iscons+0x4b>
  803ebd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ec1:	8b 10                	mov    (%rax),%edx
  803ec3:	48 b8 20 61 80 00 00 	movabs $0x806120,%rax
  803eca:	00 00 00 
  803ecd:	8b 00                	mov    (%rax),%eax
  803ecf:	39 c2                	cmp    %eax,%edx
  803ed1:	0f 94 c0             	sete   %al
  803ed4:	0f b6 c0             	movzbl %al,%eax
  803ed7:	c9                   	leaveq 
  803ed8:	c3                   	retq   

0000000000803ed9 <opencons>:
  803ed9:	55                   	push   %rbp
  803eda:	48 89 e5             	mov    %rsp,%rbp
  803edd:	48 83 ec 10          	sub    $0x10,%rsp
  803ee1:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803ee5:	48 89 c7             	mov    %rax,%rdi
  803ee8:	48 b8 66 20 80 00 00 	movabs $0x802066,%rax
  803eef:	00 00 00 
  803ef2:	ff d0                	callq  *%rax
  803ef4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803ef7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803efb:	79 05                	jns    803f02 <opencons+0x29>
  803efd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f00:	eb 5b                	jmp    803f5d <opencons+0x84>
  803f02:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f06:	ba 07 04 00 00       	mov    $0x407,%edx
  803f0b:	48 89 c6             	mov    %rax,%rsi
  803f0e:	bf 00 00 00 00       	mov    $0x0,%edi
  803f13:	48 b8 3a 1b 80 00 00 	movabs $0x801b3a,%rax
  803f1a:	00 00 00 
  803f1d:	ff d0                	callq  *%rax
  803f1f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803f22:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803f26:	79 05                	jns    803f2d <opencons+0x54>
  803f28:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f2b:	eb 30                	jmp    803f5d <opencons+0x84>
  803f2d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f31:	48 ba 20 61 80 00 00 	movabs $0x806120,%rdx
  803f38:	00 00 00 
  803f3b:	8b 12                	mov    (%rdx),%edx
  803f3d:	89 10                	mov    %edx,(%rax)
  803f3f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f43:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  803f4a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f4e:	48 89 c7             	mov    %rax,%rdi
  803f51:	48 b8 18 20 80 00 00 	movabs $0x802018,%rax
  803f58:	00 00 00 
  803f5b:	ff d0                	callq  *%rax
  803f5d:	c9                   	leaveq 
  803f5e:	c3                   	retq   

0000000000803f5f <devcons_read>:
  803f5f:	55                   	push   %rbp
  803f60:	48 89 e5             	mov    %rsp,%rbp
  803f63:	48 83 ec 30          	sub    $0x30,%rsp
  803f67:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803f6b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803f6f:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803f73:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  803f78:	75 07                	jne    803f81 <devcons_read+0x22>
  803f7a:	b8 00 00 00 00       	mov    $0x0,%eax
  803f7f:	eb 4b                	jmp    803fcc <devcons_read+0x6d>
  803f81:	eb 0c                	jmp    803f8f <devcons_read+0x30>
  803f83:	48 b8 fc 1a 80 00 00 	movabs $0x801afc,%rax
  803f8a:	00 00 00 
  803f8d:	ff d0                	callq  *%rax
  803f8f:	48 b8 3c 1a 80 00 00 	movabs $0x801a3c,%rax
  803f96:	00 00 00 
  803f99:	ff d0                	callq  *%rax
  803f9b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803f9e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803fa2:	74 df                	je     803f83 <devcons_read+0x24>
  803fa4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803fa8:	79 05                	jns    803faf <devcons_read+0x50>
  803faa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803fad:	eb 1d                	jmp    803fcc <devcons_read+0x6d>
  803faf:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  803fb3:	75 07                	jne    803fbc <devcons_read+0x5d>
  803fb5:	b8 00 00 00 00       	mov    $0x0,%eax
  803fba:	eb 10                	jmp    803fcc <devcons_read+0x6d>
  803fbc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803fbf:	89 c2                	mov    %eax,%edx
  803fc1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803fc5:	88 10                	mov    %dl,(%rax)
  803fc7:	b8 01 00 00 00       	mov    $0x1,%eax
  803fcc:	c9                   	leaveq 
  803fcd:	c3                   	retq   

0000000000803fce <devcons_write>:
  803fce:	55                   	push   %rbp
  803fcf:	48 89 e5             	mov    %rsp,%rbp
  803fd2:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  803fd9:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  803fe0:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  803fe7:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  803fee:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803ff5:	eb 76                	jmp    80406d <devcons_write+0x9f>
  803ff7:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  803ffe:	89 c2                	mov    %eax,%edx
  804000:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804003:	29 c2                	sub    %eax,%edx
  804005:	89 d0                	mov    %edx,%eax
  804007:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80400a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80400d:	83 f8 7f             	cmp    $0x7f,%eax
  804010:	76 07                	jbe    804019 <devcons_write+0x4b>
  804012:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  804019:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80401c:	48 63 d0             	movslq %eax,%rdx
  80401f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804022:	48 63 c8             	movslq %eax,%rcx
  804025:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  80402c:	48 01 c1             	add    %rax,%rcx
  80402f:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  804036:	48 89 ce             	mov    %rcx,%rsi
  804039:	48 89 c7             	mov    %rax,%rdi
  80403c:	48 b8 2f 15 80 00 00 	movabs $0x80152f,%rax
  804043:	00 00 00 
  804046:	ff d0                	callq  *%rax
  804048:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80404b:	48 63 d0             	movslq %eax,%rdx
  80404e:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  804055:	48 89 d6             	mov    %rdx,%rsi
  804058:	48 89 c7             	mov    %rax,%rdi
  80405b:	48 b8 f2 19 80 00 00 	movabs $0x8019f2,%rax
  804062:	00 00 00 
  804065:	ff d0                	callq  *%rax
  804067:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80406a:	01 45 fc             	add    %eax,-0x4(%rbp)
  80406d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804070:	48 98                	cltq   
  804072:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  804079:	0f 82 78 ff ff ff    	jb     803ff7 <devcons_write+0x29>
  80407f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804082:	c9                   	leaveq 
  804083:	c3                   	retq   

0000000000804084 <devcons_close>:
  804084:	55                   	push   %rbp
  804085:	48 89 e5             	mov    %rsp,%rbp
  804088:	48 83 ec 08          	sub    $0x8,%rsp
  80408c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804090:	b8 00 00 00 00       	mov    $0x0,%eax
  804095:	c9                   	leaveq 
  804096:	c3                   	retq   

0000000000804097 <devcons_stat>:
  804097:	55                   	push   %rbp
  804098:	48 89 e5             	mov    %rsp,%rbp
  80409b:	48 83 ec 10          	sub    $0x10,%rsp
  80409f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8040a3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8040a7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8040ab:	48 be ba 4a 80 00 00 	movabs $0x804aba,%rsi
  8040b2:	00 00 00 
  8040b5:	48 89 c7             	mov    %rax,%rdi
  8040b8:	48 b8 0b 12 80 00 00 	movabs $0x80120b,%rax
  8040bf:	00 00 00 
  8040c2:	ff d0                	callq  *%rax
  8040c4:	b8 00 00 00 00       	mov    $0x0,%eax
  8040c9:	c9                   	leaveq 
  8040ca:	c3                   	retq   

00000000008040cb <ipc_recv>:
  8040cb:	55                   	push   %rbp
  8040cc:	48 89 e5             	mov    %rsp,%rbp
  8040cf:	48 83 ec 30          	sub    $0x30,%rsp
  8040d3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8040d7:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8040db:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8040df:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8040e4:	75 0e                	jne    8040f4 <ipc_recv+0x29>
  8040e6:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8040ed:	00 00 00 
  8040f0:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8040f4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8040f8:	48 89 c7             	mov    %rax,%rdi
  8040fb:	48 b8 63 1d 80 00 00 	movabs $0x801d63,%rax
  804102:	00 00 00 
  804105:	ff d0                	callq  *%rax
  804107:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80410a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80410e:	79 27                	jns    804137 <ipc_recv+0x6c>
  804110:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  804115:	74 0a                	je     804121 <ipc_recv+0x56>
  804117:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80411b:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  804121:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804126:	74 0a                	je     804132 <ipc_recv+0x67>
  804128:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80412c:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  804132:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804135:	eb 53                	jmp    80418a <ipc_recv+0xbf>
  804137:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80413c:	74 19                	je     804157 <ipc_recv+0x8c>
  80413e:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  804145:	00 00 00 
  804148:	48 8b 00             	mov    (%rax),%rax
  80414b:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  804151:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804155:	89 10                	mov    %edx,(%rax)
  804157:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80415c:	74 19                	je     804177 <ipc_recv+0xac>
  80415e:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  804165:	00 00 00 
  804168:	48 8b 00             	mov    (%rax),%rax
  80416b:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  804171:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804175:	89 10                	mov    %edx,(%rax)
  804177:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  80417e:	00 00 00 
  804181:	48 8b 00             	mov    (%rax),%rax
  804184:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  80418a:	c9                   	leaveq 
  80418b:	c3                   	retq   

000000000080418c <ipc_send>:
  80418c:	55                   	push   %rbp
  80418d:	48 89 e5             	mov    %rsp,%rbp
  804190:	48 83 ec 30          	sub    $0x30,%rsp
  804194:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804197:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80419a:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  80419e:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  8041a1:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8041a6:	75 10                	jne    8041b8 <ipc_send+0x2c>
  8041a8:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8041af:	00 00 00 
  8041b2:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8041b6:	eb 0e                	jmp    8041c6 <ipc_send+0x3a>
  8041b8:	eb 0c                	jmp    8041c6 <ipc_send+0x3a>
  8041ba:	48 b8 fc 1a 80 00 00 	movabs $0x801afc,%rax
  8041c1:	00 00 00 
  8041c4:	ff d0                	callq  *%rax
  8041c6:	8b 75 e8             	mov    -0x18(%rbp),%esi
  8041c9:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  8041cc:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8041d0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8041d3:	89 c7                	mov    %eax,%edi
  8041d5:	48 b8 0e 1d 80 00 00 	movabs $0x801d0e,%rax
  8041dc:	00 00 00 
  8041df:	ff d0                	callq  *%rax
  8041e1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8041e4:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  8041e8:	74 d0                	je     8041ba <ipc_send+0x2e>
  8041ea:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8041ee:	79 30                	jns    804220 <ipc_send+0x94>
  8041f0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8041f3:	89 c1                	mov    %eax,%ecx
  8041f5:	48 ba c1 4a 80 00 00 	movabs $0x804ac1,%rdx
  8041fc:	00 00 00 
  8041ff:	be 44 00 00 00       	mov    $0x44,%esi
  804204:	48 bf d7 4a 80 00 00 	movabs $0x804ad7,%rdi
  80420b:	00 00 00 
  80420e:	b8 00 00 00 00       	mov    $0x0,%eax
  804213:	49 b8 1d 04 80 00 00 	movabs $0x80041d,%r8
  80421a:	00 00 00 
  80421d:	41 ff d0             	callq  *%r8
  804220:	c9                   	leaveq 
  804221:	c3                   	retq   

0000000000804222 <ipc_find_env>:
  804222:	55                   	push   %rbp
  804223:	48 89 e5             	mov    %rsp,%rbp
  804226:	48 83 ec 14          	sub    $0x14,%rsp
  80422a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80422d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804234:	eb 4e                	jmp    804284 <ipc_find_env+0x62>
  804236:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  80423d:	00 00 00 
  804240:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804243:	48 98                	cltq   
  804245:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  80424c:	48 01 d0             	add    %rdx,%rax
  80424f:	48 05 d0 00 00 00    	add    $0xd0,%rax
  804255:	8b 00                	mov    (%rax),%eax
  804257:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  80425a:	75 24                	jne    804280 <ipc_find_env+0x5e>
  80425c:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804263:	00 00 00 
  804266:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804269:	48 98                	cltq   
  80426b:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804272:	48 01 d0             	add    %rdx,%rax
  804275:	48 05 c0 00 00 00    	add    $0xc0,%rax
  80427b:	8b 40 08             	mov    0x8(%rax),%eax
  80427e:	eb 12                	jmp    804292 <ipc_find_env+0x70>
  804280:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  804284:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  80428b:	7e a9                	jle    804236 <ipc_find_env+0x14>
  80428d:	b8 00 00 00 00       	mov    $0x0,%eax
  804292:	c9                   	leaveq 
  804293:	c3                   	retq   

0000000000804294 <pageref>:
  804294:	55                   	push   %rbp
  804295:	48 89 e5             	mov    %rsp,%rbp
  804298:	48 83 ec 18          	sub    $0x18,%rsp
  80429c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8042a0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8042a4:	48 c1 e8 15          	shr    $0x15,%rax
  8042a8:	48 89 c2             	mov    %rax,%rdx
  8042ab:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8042b2:	01 00 00 
  8042b5:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8042b9:	83 e0 01             	and    $0x1,%eax
  8042bc:	48 85 c0             	test   %rax,%rax
  8042bf:	75 07                	jne    8042c8 <pageref+0x34>
  8042c1:	b8 00 00 00 00       	mov    $0x0,%eax
  8042c6:	eb 53                	jmp    80431b <pageref+0x87>
  8042c8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8042cc:	48 c1 e8 0c          	shr    $0xc,%rax
  8042d0:	48 89 c2             	mov    %rax,%rdx
  8042d3:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8042da:	01 00 00 
  8042dd:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8042e1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8042e5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8042e9:	83 e0 01             	and    $0x1,%eax
  8042ec:	48 85 c0             	test   %rax,%rax
  8042ef:	75 07                	jne    8042f8 <pageref+0x64>
  8042f1:	b8 00 00 00 00       	mov    $0x0,%eax
  8042f6:	eb 23                	jmp    80431b <pageref+0x87>
  8042f8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8042fc:	48 c1 e8 0c          	shr    $0xc,%rax
  804300:	48 89 c2             	mov    %rax,%rdx
  804303:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  80430a:	00 00 00 
  80430d:	48 c1 e2 04          	shl    $0x4,%rdx
  804311:	48 01 d0             	add    %rdx,%rax
  804314:	0f b7 40 08          	movzwl 0x8(%rax),%eax
  804318:	0f b7 c0             	movzwl %ax,%eax
  80431b:	c9                   	leaveq 
  80431c:	c3                   	retq   
