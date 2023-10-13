
obj/user/testpteshare:     file format elf64-x86-64


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
  80003c:	e8 67 02 00 00       	callq  8002a8 <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <umain>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 20          	sub    $0x20,%rsp
  80004b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80004e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800052:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  800056:	74 0c                	je     800064 <umain+0x21>
  800058:	48 b8 75 02 80 00 00 	movabs $0x800275,%rax
  80005f:	00 00 00 
  800062:	ff d0                	callq  *%rax
  800064:	ba 07 04 00 00       	mov    $0x407,%edx
  800069:	be 00 00 00 a0       	mov    $0xa0000000,%esi
  80006e:	bf 00 00 00 00       	mov    $0x0,%edi
  800073:	48 b8 6b 1a 80 00 00 	movabs $0x801a6b,%rax
  80007a:	00 00 00 
  80007d:	ff d0                	callq  *%rax
  80007f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800082:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800086:	79 30                	jns    8000b8 <umain+0x75>
  800088:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80008b:	89 c1                	mov    %eax,%ecx
  80008d:	48 ba be 55 80 00 00 	movabs $0x8055be,%rdx
  800094:	00 00 00 
  800097:	be 14 00 00 00       	mov    $0x14,%esi
  80009c:	48 bf d1 55 80 00 00 	movabs $0x8055d1,%rdi
  8000a3:	00 00 00 
  8000a6:	b8 00 00 00 00       	mov    $0x0,%eax
  8000ab:	49 b8 4e 03 80 00 00 	movabs $0x80034e,%r8
  8000b2:	00 00 00 
  8000b5:	41 ff d0             	callq  *%r8
  8000b8:	48 b8 e9 22 80 00 00 	movabs $0x8022e9,%rax
  8000bf:	00 00 00 
  8000c2:	ff d0                	callq  *%rax
  8000c4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8000c7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8000cb:	79 30                	jns    8000fd <umain+0xba>
  8000cd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8000d0:	89 c1                	mov    %eax,%ecx
  8000d2:	48 ba e8 55 80 00 00 	movabs $0x8055e8,%rdx
  8000d9:	00 00 00 
  8000dc:	be 18 00 00 00       	mov    $0x18,%esi
  8000e1:	48 bf d1 55 80 00 00 	movabs $0x8055d1,%rdi
  8000e8:	00 00 00 
  8000eb:	b8 00 00 00 00       	mov    $0x0,%eax
  8000f0:	49 b8 4e 03 80 00 00 	movabs $0x80034e,%r8
  8000f7:	00 00 00 
  8000fa:	41 ff d0             	callq  *%r8
  8000fd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800101:	75 2d                	jne    800130 <umain+0xed>
  800103:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80010a:	00 00 00 
  80010d:	48 8b 00             	mov    (%rax),%rax
  800110:	48 89 c6             	mov    %rax,%rsi
  800113:	bf 00 00 00 a0       	mov    $0xa0000000,%edi
  800118:	48 b8 3c 11 80 00 00 	movabs $0x80113c,%rax
  80011f:	00 00 00 
  800122:	ff d0                	callq  *%rax
  800124:	48 b8 2b 03 80 00 00 	movabs $0x80032b,%rax
  80012b:	00 00 00 
  80012e:	ff d0                	callq  *%rax
  800130:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800133:	89 c7                	mov    %eax,%edi
  800135:	48 b8 c8 4e 80 00 00 	movabs $0x804ec8,%rax
  80013c:	00 00 00 
  80013f:	ff d0                	callq  *%rax
  800141:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  800148:	00 00 00 
  80014b:	48 8b 00             	mov    (%rax),%rax
  80014e:	48 89 c6             	mov    %rax,%rsi
  800151:	bf 00 00 00 a0       	mov    $0xa0000000,%edi
  800156:	48 b8 9e 12 80 00 00 	movabs $0x80129e,%rax
  80015d:	00 00 00 
  800160:	ff d0                	callq  *%rax
  800162:	85 c0                	test   %eax,%eax
  800164:	75 0c                	jne    800172 <umain+0x12f>
  800166:	48 b8 f1 55 80 00 00 	movabs $0x8055f1,%rax
  80016d:	00 00 00 
  800170:	eb 0a                	jmp    80017c <umain+0x139>
  800172:	48 b8 f7 55 80 00 00 	movabs $0x8055f7,%rax
  800179:	00 00 00 
  80017c:	48 89 c6             	mov    %rax,%rsi
  80017f:	48 bf fd 55 80 00 00 	movabs $0x8055fd,%rdi
  800186:	00 00 00 
  800189:	b8 00 00 00 00       	mov    $0x0,%eax
  80018e:	48 ba 87 05 80 00 00 	movabs $0x800587,%rdx
  800195:	00 00 00 
  800198:	ff d2                	callq  *%rdx
  80019a:	b9 00 00 00 00       	mov    $0x0,%ecx
  80019f:	48 ba 18 56 80 00 00 	movabs $0x805618,%rdx
  8001a6:	00 00 00 
  8001a9:	48 be 1c 56 80 00 00 	movabs $0x80561c,%rsi
  8001b0:	00 00 00 
  8001b3:	48 bf 29 56 80 00 00 	movabs $0x805629,%rdi
  8001ba:	00 00 00 
  8001bd:	b8 00 00 00 00       	mov    $0x0,%eax
  8001c2:	49 b8 dc 38 80 00 00 	movabs $0x8038dc,%r8
  8001c9:	00 00 00 
  8001cc:	41 ff d0             	callq  *%r8
  8001cf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8001d2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8001d6:	79 30                	jns    800208 <umain+0x1c5>
  8001d8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8001db:	89 c1                	mov    %eax,%ecx
  8001dd:	48 ba 3b 56 80 00 00 	movabs $0x80563b,%rdx
  8001e4:	00 00 00 
  8001e7:	be 22 00 00 00       	mov    $0x22,%esi
  8001ec:	48 bf d1 55 80 00 00 	movabs $0x8055d1,%rdi
  8001f3:	00 00 00 
  8001f6:	b8 00 00 00 00       	mov    $0x0,%eax
  8001fb:	49 b8 4e 03 80 00 00 	movabs $0x80034e,%r8
  800202:	00 00 00 
  800205:	41 ff d0             	callq  *%r8
  800208:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80020b:	89 c7                	mov    %eax,%edi
  80020d:	48 b8 c8 4e 80 00 00 	movabs $0x804ec8,%rax
  800214:	00 00 00 
  800217:	ff d0                	callq  *%rax
  800219:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  800220:	00 00 00 
  800223:	48 8b 00             	mov    (%rax),%rax
  800226:	48 89 c6             	mov    %rax,%rsi
  800229:	bf 00 00 00 a0       	mov    $0xa0000000,%edi
  80022e:	48 b8 9e 12 80 00 00 	movabs $0x80129e,%rax
  800235:	00 00 00 
  800238:	ff d0                	callq  *%rax
  80023a:	85 c0                	test   %eax,%eax
  80023c:	75 0c                	jne    80024a <umain+0x207>
  80023e:	48 b8 f1 55 80 00 00 	movabs $0x8055f1,%rax
  800245:	00 00 00 
  800248:	eb 0a                	jmp    800254 <umain+0x211>
  80024a:	48 b8 f7 55 80 00 00 	movabs $0x8055f7,%rax
  800251:	00 00 00 
  800254:	48 89 c6             	mov    %rax,%rsi
  800257:	48 bf 45 56 80 00 00 	movabs $0x805645,%rdi
  80025e:	00 00 00 
  800261:	b8 00 00 00 00       	mov    $0x0,%eax
  800266:	48 ba 87 05 80 00 00 	movabs $0x800587,%rdx
  80026d:	00 00 00 
  800270:	ff d2                	callq  *%rdx
static __inline void read_gdtr (uint64_t *gdtbase, uint16_t *gdtlimit) __attribute__((always_inline));

static __inline void
breakpoint(void)
{
	__asm __volatile("int3");
  800272:	cc                   	int3   
  800273:	c9                   	leaveq 
  800274:	c3                   	retq   

0000000000800275 <childofspawn>:
  800275:	55                   	push   %rbp
  800276:	48 89 e5             	mov    %rsp,%rbp
  800279:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  800280:	00 00 00 
  800283:	48 8b 00             	mov    (%rax),%rax
  800286:	48 89 c6             	mov    %rax,%rsi
  800289:	bf 00 00 00 a0       	mov    $0xa0000000,%edi
  80028e:	48 b8 3c 11 80 00 00 	movabs $0x80113c,%rax
  800295:	00 00 00 
  800298:	ff d0                	callq  *%rax
  80029a:	48 b8 2b 03 80 00 00 	movabs $0x80032b,%rax
  8002a1:	00 00 00 
  8002a4:	ff d0                	callq  *%rax
  8002a6:	5d                   	pop    %rbp
  8002a7:	c3                   	retq   

00000000008002a8 <libmain>:
  8002a8:	55                   	push   %rbp
  8002a9:	48 89 e5             	mov    %rsp,%rbp
  8002ac:	48 83 ec 10          	sub    $0x10,%rsp
  8002b0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8002b3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8002b7:	48 b8 ef 19 80 00 00 	movabs $0x8019ef,%rax
  8002be:	00 00 00 
  8002c1:	ff d0                	callq  *%rax
  8002c3:	25 ff 03 00 00       	and    $0x3ff,%eax
  8002c8:	48 98                	cltq   
  8002ca:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8002d1:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8002d8:	00 00 00 
  8002db:	48 01 c2             	add    %rax,%rdx
  8002de:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  8002e5:	00 00 00 
  8002e8:	48 89 10             	mov    %rdx,(%rax)
  8002eb:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8002ef:	7e 14                	jle    800305 <libmain+0x5d>
  8002f1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8002f5:	48 8b 10             	mov    (%rax),%rdx
  8002f8:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  8002ff:	00 00 00 
  800302:	48 89 10             	mov    %rdx,(%rax)
  800305:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800309:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80030c:	48 89 d6             	mov    %rdx,%rsi
  80030f:	89 c7                	mov    %eax,%edi
  800311:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800318:	00 00 00 
  80031b:	ff d0                	callq  *%rax
  80031d:	48 b8 2b 03 80 00 00 	movabs $0x80032b,%rax
  800324:	00 00 00 
  800327:	ff d0                	callq  *%rax
  800329:	c9                   	leaveq 
  80032a:	c3                   	retq   

000000000080032b <exit>:
  80032b:	55                   	push   %rbp
  80032c:	48 89 e5             	mov    %rsp,%rbp
  80032f:	48 b8 9f 28 80 00 00 	movabs $0x80289f,%rax
  800336:	00 00 00 
  800339:	ff d0                	callq  *%rax
  80033b:	bf 00 00 00 00       	mov    $0x0,%edi
  800340:	48 b8 ab 19 80 00 00 	movabs $0x8019ab,%rax
  800347:	00 00 00 
  80034a:	ff d0                	callq  *%rax
  80034c:	5d                   	pop    %rbp
  80034d:	c3                   	retq   

000000000080034e <_panic>:
  80034e:	55                   	push   %rbp
  80034f:	48 89 e5             	mov    %rsp,%rbp
  800352:	53                   	push   %rbx
  800353:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  80035a:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  800361:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  800367:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  80036e:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  800375:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  80037c:	84 c0                	test   %al,%al
  80037e:	74 23                	je     8003a3 <_panic+0x55>
  800380:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  800387:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  80038b:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  80038f:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  800393:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  800397:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  80039b:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  80039f:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  8003a3:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  8003aa:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  8003b1:	00 00 00 
  8003b4:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  8003bb:	00 00 00 
  8003be:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8003c2:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  8003c9:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  8003d0:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8003d7:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  8003de:	00 00 00 
  8003e1:	48 8b 18             	mov    (%rax),%rbx
  8003e4:	48 b8 ef 19 80 00 00 	movabs $0x8019ef,%rax
  8003eb:	00 00 00 
  8003ee:	ff d0                	callq  *%rax
  8003f0:	8b 8d 14 ff ff ff    	mov    -0xec(%rbp),%ecx
  8003f6:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  8003fd:	41 89 c8             	mov    %ecx,%r8d
  800400:	48 89 d1             	mov    %rdx,%rcx
  800403:	48 89 da             	mov    %rbx,%rdx
  800406:	89 c6                	mov    %eax,%esi
  800408:	48 bf 70 56 80 00 00 	movabs $0x805670,%rdi
  80040f:	00 00 00 
  800412:	b8 00 00 00 00       	mov    $0x0,%eax
  800417:	49 b9 87 05 80 00 00 	movabs $0x800587,%r9
  80041e:	00 00 00 
  800421:	41 ff d1             	callq  *%r9
  800424:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  80042b:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800432:	48 89 d6             	mov    %rdx,%rsi
  800435:	48 89 c7             	mov    %rax,%rdi
  800438:	48 b8 db 04 80 00 00 	movabs $0x8004db,%rax
  80043f:	00 00 00 
  800442:	ff d0                	callq  *%rax
  800444:	48 bf 93 56 80 00 00 	movabs $0x805693,%rdi
  80044b:	00 00 00 
  80044e:	b8 00 00 00 00       	mov    $0x0,%eax
  800453:	48 ba 87 05 80 00 00 	movabs $0x800587,%rdx
  80045a:	00 00 00 
  80045d:	ff d2                	callq  *%rdx
  80045f:	cc                   	int3   
  800460:	eb fd                	jmp    80045f <_panic+0x111>

0000000000800462 <putch>:
  800462:	55                   	push   %rbp
  800463:	48 89 e5             	mov    %rsp,%rbp
  800466:	48 83 ec 10          	sub    $0x10,%rsp
  80046a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80046d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800471:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800475:	8b 00                	mov    (%rax),%eax
  800477:	8d 48 01             	lea    0x1(%rax),%ecx
  80047a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80047e:	89 0a                	mov    %ecx,(%rdx)
  800480:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800483:	89 d1                	mov    %edx,%ecx
  800485:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800489:	48 98                	cltq   
  80048b:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  80048f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800493:	8b 00                	mov    (%rax),%eax
  800495:	3d ff 00 00 00       	cmp    $0xff,%eax
  80049a:	75 2c                	jne    8004c8 <putch+0x66>
  80049c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8004a0:	8b 00                	mov    (%rax),%eax
  8004a2:	48 98                	cltq   
  8004a4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8004a8:	48 83 c2 08          	add    $0x8,%rdx
  8004ac:	48 89 c6             	mov    %rax,%rsi
  8004af:	48 89 d7             	mov    %rdx,%rdi
  8004b2:	48 b8 23 19 80 00 00 	movabs $0x801923,%rax
  8004b9:	00 00 00 
  8004bc:	ff d0                	callq  *%rax
  8004be:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8004c2:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8004c8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8004cc:	8b 40 04             	mov    0x4(%rax),%eax
  8004cf:	8d 50 01             	lea    0x1(%rax),%edx
  8004d2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8004d6:	89 50 04             	mov    %edx,0x4(%rax)
  8004d9:	c9                   	leaveq 
  8004da:	c3                   	retq   

00000000008004db <vcprintf>:
  8004db:	55                   	push   %rbp
  8004dc:	48 89 e5             	mov    %rsp,%rbp
  8004df:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  8004e6:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  8004ed:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  8004f4:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  8004fb:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  800502:	48 8b 0a             	mov    (%rdx),%rcx
  800505:	48 89 08             	mov    %rcx,(%rax)
  800508:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80050c:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800510:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800514:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800518:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  80051f:	00 00 00 
  800522:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  800529:	00 00 00 
  80052c:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  800533:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  80053a:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800541:	48 89 c6             	mov    %rax,%rsi
  800544:	48 bf 62 04 80 00 00 	movabs $0x800462,%rdi
  80054b:	00 00 00 
  80054e:	48 b8 3a 09 80 00 00 	movabs $0x80093a,%rax
  800555:	00 00 00 
  800558:	ff d0                	callq  *%rax
  80055a:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  800560:	48 98                	cltq   
  800562:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  800569:	48 83 c2 08          	add    $0x8,%rdx
  80056d:	48 89 c6             	mov    %rax,%rsi
  800570:	48 89 d7             	mov    %rdx,%rdi
  800573:	48 b8 23 19 80 00 00 	movabs $0x801923,%rax
  80057a:	00 00 00 
  80057d:	ff d0                	callq  *%rax
  80057f:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  800585:	c9                   	leaveq 
  800586:	c3                   	retq   

0000000000800587 <cprintf>:
  800587:	55                   	push   %rbp
  800588:	48 89 e5             	mov    %rsp,%rbp
  80058b:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  800592:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  800599:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  8005a0:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8005a7:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8005ae:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8005b5:	84 c0                	test   %al,%al
  8005b7:	74 20                	je     8005d9 <cprintf+0x52>
  8005b9:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8005bd:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8005c1:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8005c5:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8005c9:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8005cd:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8005d1:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8005d5:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8005d9:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  8005e0:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  8005e7:	00 00 00 
  8005ea:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8005f1:	00 00 00 
  8005f4:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8005f8:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8005ff:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800606:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  80060d:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800614:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  80061b:	48 8b 0a             	mov    (%rdx),%rcx
  80061e:	48 89 08             	mov    %rcx,(%rax)
  800621:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800625:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800629:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  80062d:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800631:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  800638:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  80063f:	48 89 d6             	mov    %rdx,%rsi
  800642:	48 89 c7             	mov    %rax,%rdi
  800645:	48 b8 db 04 80 00 00 	movabs $0x8004db,%rax
  80064c:	00 00 00 
  80064f:	ff d0                	callq  *%rax
  800651:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  800657:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  80065d:	c9                   	leaveq 
  80065e:	c3                   	retq   

000000000080065f <printnum>:
  80065f:	55                   	push   %rbp
  800660:	48 89 e5             	mov    %rsp,%rbp
  800663:	53                   	push   %rbx
  800664:	48 83 ec 38          	sub    $0x38,%rsp
  800668:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80066c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800670:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  800674:	89 4d d4             	mov    %ecx,-0x2c(%rbp)
  800677:	44 89 45 d0          	mov    %r8d,-0x30(%rbp)
  80067b:	44 89 4d cc          	mov    %r9d,-0x34(%rbp)
  80067f:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  800682:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  800686:	77 3b                	ja     8006c3 <printnum+0x64>
  800688:	8b 45 d0             	mov    -0x30(%rbp),%eax
  80068b:	44 8d 40 ff          	lea    -0x1(%rax),%r8d
  80068f:	8b 5d d4             	mov    -0x2c(%rbp),%ebx
  800692:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800696:	ba 00 00 00 00       	mov    $0x0,%edx
  80069b:	48 f7 f3             	div    %rbx
  80069e:	48 89 c2             	mov    %rax,%rdx
  8006a1:	8b 7d cc             	mov    -0x34(%rbp),%edi
  8006a4:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  8006a7:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
  8006ab:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006af:	41 89 f9             	mov    %edi,%r9d
  8006b2:	48 89 c7             	mov    %rax,%rdi
  8006b5:	48 b8 5f 06 80 00 00 	movabs $0x80065f,%rax
  8006bc:	00 00 00 
  8006bf:	ff d0                	callq  *%rax
  8006c1:	eb 1e                	jmp    8006e1 <printnum+0x82>
  8006c3:	eb 12                	jmp    8006d7 <printnum+0x78>
  8006c5:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8006c9:	8b 55 cc             	mov    -0x34(%rbp),%edx
  8006cc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006d0:	48 89 ce             	mov    %rcx,%rsi
  8006d3:	89 d7                	mov    %edx,%edi
  8006d5:	ff d0                	callq  *%rax
  8006d7:	83 6d d0 01          	subl   $0x1,-0x30(%rbp)
  8006db:	83 7d d0 00          	cmpl   $0x0,-0x30(%rbp)
  8006df:	7f e4                	jg     8006c5 <printnum+0x66>
  8006e1:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  8006e4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8006e8:	ba 00 00 00 00       	mov    $0x0,%edx
  8006ed:	48 f7 f1             	div    %rcx
  8006f0:	48 89 d0             	mov    %rdx,%rax
  8006f3:	48 ba 90 58 80 00 00 	movabs $0x805890,%rdx
  8006fa:	00 00 00 
  8006fd:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
  800701:	0f be d0             	movsbl %al,%edx
  800704:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  800708:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80070c:	48 89 ce             	mov    %rcx,%rsi
  80070f:	89 d7                	mov    %edx,%edi
  800711:	ff d0                	callq  *%rax
  800713:	48 83 c4 38          	add    $0x38,%rsp
  800717:	5b                   	pop    %rbx
  800718:	5d                   	pop    %rbp
  800719:	c3                   	retq   

000000000080071a <getuint>:
  80071a:	55                   	push   %rbp
  80071b:	48 89 e5             	mov    %rsp,%rbp
  80071e:	48 83 ec 1c          	sub    $0x1c,%rsp
  800722:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800726:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800729:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  80072d:	7e 52                	jle    800781 <getuint+0x67>
  80072f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800733:	8b 00                	mov    (%rax),%eax
  800735:	83 f8 30             	cmp    $0x30,%eax
  800738:	73 24                	jae    80075e <getuint+0x44>
  80073a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80073e:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800742:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800746:	8b 00                	mov    (%rax),%eax
  800748:	89 c0                	mov    %eax,%eax
  80074a:	48 01 d0             	add    %rdx,%rax
  80074d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800751:	8b 12                	mov    (%rdx),%edx
  800753:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800756:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80075a:	89 0a                	mov    %ecx,(%rdx)
  80075c:	eb 17                	jmp    800775 <getuint+0x5b>
  80075e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800762:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800766:	48 89 d0             	mov    %rdx,%rax
  800769:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  80076d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800771:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800775:	48 8b 00             	mov    (%rax),%rax
  800778:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80077c:	e9 a3 00 00 00       	jmpq   800824 <getuint+0x10a>
  800781:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800785:	74 4f                	je     8007d6 <getuint+0xbc>
  800787:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80078b:	8b 00                	mov    (%rax),%eax
  80078d:	83 f8 30             	cmp    $0x30,%eax
  800790:	73 24                	jae    8007b6 <getuint+0x9c>
  800792:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800796:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80079a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80079e:	8b 00                	mov    (%rax),%eax
  8007a0:	89 c0                	mov    %eax,%eax
  8007a2:	48 01 d0             	add    %rdx,%rax
  8007a5:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007a9:	8b 12                	mov    (%rdx),%edx
  8007ab:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8007ae:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007b2:	89 0a                	mov    %ecx,(%rdx)
  8007b4:	eb 17                	jmp    8007cd <getuint+0xb3>
  8007b6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007ba:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8007be:	48 89 d0             	mov    %rdx,%rax
  8007c1:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8007c5:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007c9:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8007cd:	48 8b 00             	mov    (%rax),%rax
  8007d0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8007d4:	eb 4e                	jmp    800824 <getuint+0x10a>
  8007d6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007da:	8b 00                	mov    (%rax),%eax
  8007dc:	83 f8 30             	cmp    $0x30,%eax
  8007df:	73 24                	jae    800805 <getuint+0xeb>
  8007e1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007e5:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8007e9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007ed:	8b 00                	mov    (%rax),%eax
  8007ef:	89 c0                	mov    %eax,%eax
  8007f1:	48 01 d0             	add    %rdx,%rax
  8007f4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007f8:	8b 12                	mov    (%rdx),%edx
  8007fa:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8007fd:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800801:	89 0a                	mov    %ecx,(%rdx)
  800803:	eb 17                	jmp    80081c <getuint+0x102>
  800805:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800809:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80080d:	48 89 d0             	mov    %rdx,%rax
  800810:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800814:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800818:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80081c:	8b 00                	mov    (%rax),%eax
  80081e:	89 c0                	mov    %eax,%eax
  800820:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800824:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800828:	c9                   	leaveq 
  800829:	c3                   	retq   

000000000080082a <getint>:
  80082a:	55                   	push   %rbp
  80082b:	48 89 e5             	mov    %rsp,%rbp
  80082e:	48 83 ec 1c          	sub    $0x1c,%rsp
  800832:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800836:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800839:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  80083d:	7e 52                	jle    800891 <getint+0x67>
  80083f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800843:	8b 00                	mov    (%rax),%eax
  800845:	83 f8 30             	cmp    $0x30,%eax
  800848:	73 24                	jae    80086e <getint+0x44>
  80084a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80084e:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800852:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800856:	8b 00                	mov    (%rax),%eax
  800858:	89 c0                	mov    %eax,%eax
  80085a:	48 01 d0             	add    %rdx,%rax
  80085d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800861:	8b 12                	mov    (%rdx),%edx
  800863:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800866:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80086a:	89 0a                	mov    %ecx,(%rdx)
  80086c:	eb 17                	jmp    800885 <getint+0x5b>
  80086e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800872:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800876:	48 89 d0             	mov    %rdx,%rax
  800879:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  80087d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800881:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800885:	48 8b 00             	mov    (%rax),%rax
  800888:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80088c:	e9 a3 00 00 00       	jmpq   800934 <getint+0x10a>
  800891:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800895:	74 4f                	je     8008e6 <getint+0xbc>
  800897:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80089b:	8b 00                	mov    (%rax),%eax
  80089d:	83 f8 30             	cmp    $0x30,%eax
  8008a0:	73 24                	jae    8008c6 <getint+0x9c>
  8008a2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008a6:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8008aa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008ae:	8b 00                	mov    (%rax),%eax
  8008b0:	89 c0                	mov    %eax,%eax
  8008b2:	48 01 d0             	add    %rdx,%rax
  8008b5:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008b9:	8b 12                	mov    (%rdx),%edx
  8008bb:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8008be:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008c2:	89 0a                	mov    %ecx,(%rdx)
  8008c4:	eb 17                	jmp    8008dd <getint+0xb3>
  8008c6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008ca:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8008ce:	48 89 d0             	mov    %rdx,%rax
  8008d1:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8008d5:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008d9:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8008dd:	48 8b 00             	mov    (%rax),%rax
  8008e0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8008e4:	eb 4e                	jmp    800934 <getint+0x10a>
  8008e6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008ea:	8b 00                	mov    (%rax),%eax
  8008ec:	83 f8 30             	cmp    $0x30,%eax
  8008ef:	73 24                	jae    800915 <getint+0xeb>
  8008f1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008f5:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8008f9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008fd:	8b 00                	mov    (%rax),%eax
  8008ff:	89 c0                	mov    %eax,%eax
  800901:	48 01 d0             	add    %rdx,%rax
  800904:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800908:	8b 12                	mov    (%rdx),%edx
  80090a:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80090d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800911:	89 0a                	mov    %ecx,(%rdx)
  800913:	eb 17                	jmp    80092c <getint+0x102>
  800915:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800919:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80091d:	48 89 d0             	mov    %rdx,%rax
  800920:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800924:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800928:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80092c:	8b 00                	mov    (%rax),%eax
  80092e:	48 98                	cltq   
  800930:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800934:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800938:	c9                   	leaveq 
  800939:	c3                   	retq   

000000000080093a <vprintfmt>:
  80093a:	55                   	push   %rbp
  80093b:	48 89 e5             	mov    %rsp,%rbp
  80093e:	41 54                	push   %r12
  800940:	53                   	push   %rbx
  800941:	48 83 ec 60          	sub    $0x60,%rsp
  800945:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  800949:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  80094d:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800951:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  800955:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800959:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  80095d:	48 8b 0a             	mov    (%rdx),%rcx
  800960:	48 89 08             	mov    %rcx,(%rax)
  800963:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800967:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80096b:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  80096f:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800973:	eb 17                	jmp    80098c <vprintfmt+0x52>
  800975:	85 db                	test   %ebx,%ebx
  800977:	0f 84 cc 04 00 00    	je     800e49 <vprintfmt+0x50f>
  80097d:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800981:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800985:	48 89 d6             	mov    %rdx,%rsi
  800988:	89 df                	mov    %ebx,%edi
  80098a:	ff d0                	callq  *%rax
  80098c:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800990:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800994:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800998:	0f b6 00             	movzbl (%rax),%eax
  80099b:	0f b6 d8             	movzbl %al,%ebx
  80099e:	83 fb 25             	cmp    $0x25,%ebx
  8009a1:	75 d2                	jne    800975 <vprintfmt+0x3b>
  8009a3:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  8009a7:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  8009ae:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  8009b5:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  8009bc:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  8009c3:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8009c7:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8009cb:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8009cf:	0f b6 00             	movzbl (%rax),%eax
  8009d2:	0f b6 d8             	movzbl %al,%ebx
  8009d5:	8d 43 dd             	lea    -0x23(%rbx),%eax
  8009d8:	83 f8 55             	cmp    $0x55,%eax
  8009db:	0f 87 34 04 00 00    	ja     800e15 <vprintfmt+0x4db>
  8009e1:	89 c0                	mov    %eax,%eax
  8009e3:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8009ea:	00 
  8009eb:	48 b8 b8 58 80 00 00 	movabs $0x8058b8,%rax
  8009f2:	00 00 00 
  8009f5:	48 01 d0             	add    %rdx,%rax
  8009f8:	48 8b 00             	mov    (%rax),%rax
  8009fb:	ff e0                	jmpq   *%rax
  8009fd:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  800a01:	eb c0                	jmp    8009c3 <vprintfmt+0x89>
  800a03:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  800a07:	eb ba                	jmp    8009c3 <vprintfmt+0x89>
  800a09:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  800a10:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800a13:	89 d0                	mov    %edx,%eax
  800a15:	c1 e0 02             	shl    $0x2,%eax
  800a18:	01 d0                	add    %edx,%eax
  800a1a:	01 c0                	add    %eax,%eax
  800a1c:	01 d8                	add    %ebx,%eax
  800a1e:	83 e8 30             	sub    $0x30,%eax
  800a21:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800a24:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800a28:	0f b6 00             	movzbl (%rax),%eax
  800a2b:	0f be d8             	movsbl %al,%ebx
  800a2e:	83 fb 2f             	cmp    $0x2f,%ebx
  800a31:	7e 0c                	jle    800a3f <vprintfmt+0x105>
  800a33:	83 fb 39             	cmp    $0x39,%ebx
  800a36:	7f 07                	jg     800a3f <vprintfmt+0x105>
  800a38:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  800a3d:	eb d1                	jmp    800a10 <vprintfmt+0xd6>
  800a3f:	eb 58                	jmp    800a99 <vprintfmt+0x15f>
  800a41:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800a44:	83 f8 30             	cmp    $0x30,%eax
  800a47:	73 17                	jae    800a60 <vprintfmt+0x126>
  800a49:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800a4d:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800a50:	89 c0                	mov    %eax,%eax
  800a52:	48 01 d0             	add    %rdx,%rax
  800a55:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800a58:	83 c2 08             	add    $0x8,%edx
  800a5b:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800a5e:	eb 0f                	jmp    800a6f <vprintfmt+0x135>
  800a60:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800a64:	48 89 d0             	mov    %rdx,%rax
  800a67:	48 83 c2 08          	add    $0x8,%rdx
  800a6b:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800a6f:	8b 00                	mov    (%rax),%eax
  800a71:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800a74:	eb 23                	jmp    800a99 <vprintfmt+0x15f>
  800a76:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800a7a:	79 0c                	jns    800a88 <vprintfmt+0x14e>
  800a7c:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  800a83:	e9 3b ff ff ff       	jmpq   8009c3 <vprintfmt+0x89>
  800a88:	e9 36 ff ff ff       	jmpq   8009c3 <vprintfmt+0x89>
  800a8d:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  800a94:	e9 2a ff ff ff       	jmpq   8009c3 <vprintfmt+0x89>
  800a99:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800a9d:	79 12                	jns    800ab1 <vprintfmt+0x177>
  800a9f:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800aa2:	89 45 dc             	mov    %eax,-0x24(%rbp)
  800aa5:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800aac:	e9 12 ff ff ff       	jmpq   8009c3 <vprintfmt+0x89>
  800ab1:	e9 0d ff ff ff       	jmpq   8009c3 <vprintfmt+0x89>
  800ab6:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  800aba:	e9 04 ff ff ff       	jmpq   8009c3 <vprintfmt+0x89>
  800abf:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800ac2:	83 f8 30             	cmp    $0x30,%eax
  800ac5:	73 17                	jae    800ade <vprintfmt+0x1a4>
  800ac7:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800acb:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800ace:	89 c0                	mov    %eax,%eax
  800ad0:	48 01 d0             	add    %rdx,%rax
  800ad3:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800ad6:	83 c2 08             	add    $0x8,%edx
  800ad9:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800adc:	eb 0f                	jmp    800aed <vprintfmt+0x1b3>
  800ade:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800ae2:	48 89 d0             	mov    %rdx,%rax
  800ae5:	48 83 c2 08          	add    $0x8,%rdx
  800ae9:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800aed:	8b 10                	mov    (%rax),%edx
  800aef:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800af3:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800af7:	48 89 ce             	mov    %rcx,%rsi
  800afa:	89 d7                	mov    %edx,%edi
  800afc:	ff d0                	callq  *%rax
  800afe:	e9 40 03 00 00       	jmpq   800e43 <vprintfmt+0x509>
  800b03:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b06:	83 f8 30             	cmp    $0x30,%eax
  800b09:	73 17                	jae    800b22 <vprintfmt+0x1e8>
  800b0b:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800b0f:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b12:	89 c0                	mov    %eax,%eax
  800b14:	48 01 d0             	add    %rdx,%rax
  800b17:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b1a:	83 c2 08             	add    $0x8,%edx
  800b1d:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800b20:	eb 0f                	jmp    800b31 <vprintfmt+0x1f7>
  800b22:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800b26:	48 89 d0             	mov    %rdx,%rax
  800b29:	48 83 c2 08          	add    $0x8,%rdx
  800b2d:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800b31:	8b 18                	mov    (%rax),%ebx
  800b33:	85 db                	test   %ebx,%ebx
  800b35:	79 02                	jns    800b39 <vprintfmt+0x1ff>
  800b37:	f7 db                	neg    %ebx
  800b39:	83 fb 15             	cmp    $0x15,%ebx
  800b3c:	7f 16                	jg     800b54 <vprintfmt+0x21a>
  800b3e:	48 b8 e0 57 80 00 00 	movabs $0x8057e0,%rax
  800b45:	00 00 00 
  800b48:	48 63 d3             	movslq %ebx,%rdx
  800b4b:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800b4f:	4d 85 e4             	test   %r12,%r12
  800b52:	75 2e                	jne    800b82 <vprintfmt+0x248>
  800b54:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800b58:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b5c:	89 d9                	mov    %ebx,%ecx
  800b5e:	48 ba a1 58 80 00 00 	movabs $0x8058a1,%rdx
  800b65:	00 00 00 
  800b68:	48 89 c7             	mov    %rax,%rdi
  800b6b:	b8 00 00 00 00       	mov    $0x0,%eax
  800b70:	49 b8 52 0e 80 00 00 	movabs $0x800e52,%r8
  800b77:	00 00 00 
  800b7a:	41 ff d0             	callq  *%r8
  800b7d:	e9 c1 02 00 00       	jmpq   800e43 <vprintfmt+0x509>
  800b82:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800b86:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b8a:	4c 89 e1             	mov    %r12,%rcx
  800b8d:	48 ba aa 58 80 00 00 	movabs $0x8058aa,%rdx
  800b94:	00 00 00 
  800b97:	48 89 c7             	mov    %rax,%rdi
  800b9a:	b8 00 00 00 00       	mov    $0x0,%eax
  800b9f:	49 b8 52 0e 80 00 00 	movabs $0x800e52,%r8
  800ba6:	00 00 00 
  800ba9:	41 ff d0             	callq  *%r8
  800bac:	e9 92 02 00 00       	jmpq   800e43 <vprintfmt+0x509>
  800bb1:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800bb4:	83 f8 30             	cmp    $0x30,%eax
  800bb7:	73 17                	jae    800bd0 <vprintfmt+0x296>
  800bb9:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800bbd:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800bc0:	89 c0                	mov    %eax,%eax
  800bc2:	48 01 d0             	add    %rdx,%rax
  800bc5:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800bc8:	83 c2 08             	add    $0x8,%edx
  800bcb:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800bce:	eb 0f                	jmp    800bdf <vprintfmt+0x2a5>
  800bd0:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800bd4:	48 89 d0             	mov    %rdx,%rax
  800bd7:	48 83 c2 08          	add    $0x8,%rdx
  800bdb:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800bdf:	4c 8b 20             	mov    (%rax),%r12
  800be2:	4d 85 e4             	test   %r12,%r12
  800be5:	75 0a                	jne    800bf1 <vprintfmt+0x2b7>
  800be7:	49 bc ad 58 80 00 00 	movabs $0x8058ad,%r12
  800bee:	00 00 00 
  800bf1:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800bf5:	7e 3f                	jle    800c36 <vprintfmt+0x2fc>
  800bf7:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  800bfb:	74 39                	je     800c36 <vprintfmt+0x2fc>
  800bfd:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800c00:	48 98                	cltq   
  800c02:	48 89 c6             	mov    %rax,%rsi
  800c05:	4c 89 e7             	mov    %r12,%rdi
  800c08:	48 b8 fe 10 80 00 00 	movabs $0x8010fe,%rax
  800c0f:	00 00 00 
  800c12:	ff d0                	callq  *%rax
  800c14:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800c17:	eb 17                	jmp    800c30 <vprintfmt+0x2f6>
  800c19:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800c1d:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800c21:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c25:	48 89 ce             	mov    %rcx,%rsi
  800c28:	89 d7                	mov    %edx,%edi
  800c2a:	ff d0                	callq  *%rax
  800c2c:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800c30:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800c34:	7f e3                	jg     800c19 <vprintfmt+0x2df>
  800c36:	eb 37                	jmp    800c6f <vprintfmt+0x335>
  800c38:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  800c3c:	74 1e                	je     800c5c <vprintfmt+0x322>
  800c3e:	83 fb 1f             	cmp    $0x1f,%ebx
  800c41:	7e 05                	jle    800c48 <vprintfmt+0x30e>
  800c43:	83 fb 7e             	cmp    $0x7e,%ebx
  800c46:	7e 14                	jle    800c5c <vprintfmt+0x322>
  800c48:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c4c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c50:	48 89 d6             	mov    %rdx,%rsi
  800c53:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800c58:	ff d0                	callq  *%rax
  800c5a:	eb 0f                	jmp    800c6b <vprintfmt+0x331>
  800c5c:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c60:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c64:	48 89 d6             	mov    %rdx,%rsi
  800c67:	89 df                	mov    %ebx,%edi
  800c69:	ff d0                	callq  *%rax
  800c6b:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800c6f:	4c 89 e0             	mov    %r12,%rax
  800c72:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800c76:	0f b6 00             	movzbl (%rax),%eax
  800c79:	0f be d8             	movsbl %al,%ebx
  800c7c:	85 db                	test   %ebx,%ebx
  800c7e:	74 10                	je     800c90 <vprintfmt+0x356>
  800c80:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800c84:	78 b2                	js     800c38 <vprintfmt+0x2fe>
  800c86:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800c8a:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800c8e:	79 a8                	jns    800c38 <vprintfmt+0x2fe>
  800c90:	eb 16                	jmp    800ca8 <vprintfmt+0x36e>
  800c92:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c96:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c9a:	48 89 d6             	mov    %rdx,%rsi
  800c9d:	bf 20 00 00 00       	mov    $0x20,%edi
  800ca2:	ff d0                	callq  *%rax
  800ca4:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800ca8:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800cac:	7f e4                	jg     800c92 <vprintfmt+0x358>
  800cae:	e9 90 01 00 00       	jmpq   800e43 <vprintfmt+0x509>
  800cb3:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800cb7:	be 03 00 00 00       	mov    $0x3,%esi
  800cbc:	48 89 c7             	mov    %rax,%rdi
  800cbf:	48 b8 2a 08 80 00 00 	movabs $0x80082a,%rax
  800cc6:	00 00 00 
  800cc9:	ff d0                	callq  *%rax
  800ccb:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800ccf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800cd3:	48 85 c0             	test   %rax,%rax
  800cd6:	79 1d                	jns    800cf5 <vprintfmt+0x3bb>
  800cd8:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800cdc:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ce0:	48 89 d6             	mov    %rdx,%rsi
  800ce3:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800ce8:	ff d0                	callq  *%rax
  800cea:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800cee:	48 f7 d8             	neg    %rax
  800cf1:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800cf5:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800cfc:	e9 d5 00 00 00       	jmpq   800dd6 <vprintfmt+0x49c>
  800d01:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800d05:	be 03 00 00 00       	mov    $0x3,%esi
  800d0a:	48 89 c7             	mov    %rax,%rdi
  800d0d:	48 b8 1a 07 80 00 00 	movabs $0x80071a,%rax
  800d14:	00 00 00 
  800d17:	ff d0                	callq  *%rax
  800d19:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800d1d:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800d24:	e9 ad 00 00 00       	jmpq   800dd6 <vprintfmt+0x49c>
  800d29:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800d2d:	be 03 00 00 00       	mov    $0x3,%esi
  800d32:	48 89 c7             	mov    %rax,%rdi
  800d35:	48 b8 1a 07 80 00 00 	movabs $0x80071a,%rax
  800d3c:	00 00 00 
  800d3f:	ff d0                	callq  *%rax
  800d41:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800d45:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800d4c:	e9 85 00 00 00       	jmpq   800dd6 <vprintfmt+0x49c>
  800d51:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d55:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d59:	48 89 d6             	mov    %rdx,%rsi
  800d5c:	bf 30 00 00 00       	mov    $0x30,%edi
  800d61:	ff d0                	callq  *%rax
  800d63:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d67:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d6b:	48 89 d6             	mov    %rdx,%rsi
  800d6e:	bf 78 00 00 00       	mov    $0x78,%edi
  800d73:	ff d0                	callq  *%rax
  800d75:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800d78:	83 f8 30             	cmp    $0x30,%eax
  800d7b:	73 17                	jae    800d94 <vprintfmt+0x45a>
  800d7d:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800d81:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800d84:	89 c0                	mov    %eax,%eax
  800d86:	48 01 d0             	add    %rdx,%rax
  800d89:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800d8c:	83 c2 08             	add    $0x8,%edx
  800d8f:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800d92:	eb 0f                	jmp    800da3 <vprintfmt+0x469>
  800d94:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800d98:	48 89 d0             	mov    %rdx,%rax
  800d9b:	48 83 c2 08          	add    $0x8,%rdx
  800d9f:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800da3:	48 8b 00             	mov    (%rax),%rax
  800da6:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800daa:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800db1:	eb 23                	jmp    800dd6 <vprintfmt+0x49c>
  800db3:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800db7:	be 03 00 00 00       	mov    $0x3,%esi
  800dbc:	48 89 c7             	mov    %rax,%rdi
  800dbf:	48 b8 1a 07 80 00 00 	movabs $0x80071a,%rax
  800dc6:	00 00 00 
  800dc9:	ff d0                	callq  *%rax
  800dcb:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800dcf:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800dd6:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  800ddb:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800dde:	8b 7d dc             	mov    -0x24(%rbp),%edi
  800de1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800de5:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800de9:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ded:	45 89 c1             	mov    %r8d,%r9d
  800df0:	41 89 f8             	mov    %edi,%r8d
  800df3:	48 89 c7             	mov    %rax,%rdi
  800df6:	48 b8 5f 06 80 00 00 	movabs $0x80065f,%rax
  800dfd:	00 00 00 
  800e00:	ff d0                	callq  *%rax
  800e02:	eb 3f                	jmp    800e43 <vprintfmt+0x509>
  800e04:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800e08:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e0c:	48 89 d6             	mov    %rdx,%rsi
  800e0f:	89 df                	mov    %ebx,%edi
  800e11:	ff d0                	callq  *%rax
  800e13:	eb 2e                	jmp    800e43 <vprintfmt+0x509>
  800e15:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800e19:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e1d:	48 89 d6             	mov    %rdx,%rsi
  800e20:	bf 25 00 00 00       	mov    $0x25,%edi
  800e25:	ff d0                	callq  *%rax
  800e27:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800e2c:	eb 05                	jmp    800e33 <vprintfmt+0x4f9>
  800e2e:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800e33:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800e37:	48 83 e8 01          	sub    $0x1,%rax
  800e3b:	0f b6 00             	movzbl (%rax),%eax
  800e3e:	3c 25                	cmp    $0x25,%al
  800e40:	75 ec                	jne    800e2e <vprintfmt+0x4f4>
  800e42:	90                   	nop
  800e43:	90                   	nop
  800e44:	e9 43 fb ff ff       	jmpq   80098c <vprintfmt+0x52>
  800e49:	48 83 c4 60          	add    $0x60,%rsp
  800e4d:	5b                   	pop    %rbx
  800e4e:	41 5c                	pop    %r12
  800e50:	5d                   	pop    %rbp
  800e51:	c3                   	retq   

0000000000800e52 <printfmt>:
  800e52:	55                   	push   %rbp
  800e53:	48 89 e5             	mov    %rsp,%rbp
  800e56:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  800e5d:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  800e64:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  800e6b:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800e72:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800e79:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800e80:	84 c0                	test   %al,%al
  800e82:	74 20                	je     800ea4 <printfmt+0x52>
  800e84:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800e88:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800e8c:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800e90:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800e94:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800e98:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800e9c:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800ea0:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800ea4:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  800eab:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  800eb2:	00 00 00 
  800eb5:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  800ebc:	00 00 00 
  800ebf:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800ec3:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800eca:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800ed1:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  800ed8:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  800edf:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800ee6:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  800eed:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  800ef4:	48 89 c7             	mov    %rax,%rdi
  800ef7:	48 b8 3a 09 80 00 00 	movabs $0x80093a,%rax
  800efe:	00 00 00 
  800f01:	ff d0                	callq  *%rax
  800f03:	c9                   	leaveq 
  800f04:	c3                   	retq   

0000000000800f05 <sprintputch>:
  800f05:	55                   	push   %rbp
  800f06:	48 89 e5             	mov    %rsp,%rbp
  800f09:	48 83 ec 10          	sub    $0x10,%rsp
  800f0d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800f10:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800f14:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800f18:	8b 40 10             	mov    0x10(%rax),%eax
  800f1b:	8d 50 01             	lea    0x1(%rax),%edx
  800f1e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800f22:	89 50 10             	mov    %edx,0x10(%rax)
  800f25:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800f29:	48 8b 10             	mov    (%rax),%rdx
  800f2c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800f30:	48 8b 40 08          	mov    0x8(%rax),%rax
  800f34:	48 39 c2             	cmp    %rax,%rdx
  800f37:	73 17                	jae    800f50 <sprintputch+0x4b>
  800f39:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800f3d:	48 8b 00             	mov    (%rax),%rax
  800f40:	48 8d 48 01          	lea    0x1(%rax),%rcx
  800f44:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800f48:	48 89 0a             	mov    %rcx,(%rdx)
  800f4b:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800f4e:	88 10                	mov    %dl,(%rax)
  800f50:	c9                   	leaveq 
  800f51:	c3                   	retq   

0000000000800f52 <vsnprintf>:
  800f52:	55                   	push   %rbp
  800f53:	48 89 e5             	mov    %rsp,%rbp
  800f56:	48 83 ec 50          	sub    $0x50,%rsp
  800f5a:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  800f5e:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  800f61:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  800f65:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  800f69:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  800f6d:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  800f71:	48 8b 0a             	mov    (%rdx),%rcx
  800f74:	48 89 08             	mov    %rcx,(%rax)
  800f77:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800f7b:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800f7f:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800f83:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800f87:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800f8b:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  800f8f:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  800f92:	48 98                	cltq   
  800f94:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  800f98:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800f9c:	48 01 d0             	add    %rdx,%rax
  800f9f:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  800fa3:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800faa:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  800faf:	74 06                	je     800fb7 <vsnprintf+0x65>
  800fb1:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  800fb5:	7f 07                	jg     800fbe <vsnprintf+0x6c>
  800fb7:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800fbc:	eb 2f                	jmp    800fed <vsnprintf+0x9b>
  800fbe:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  800fc2:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  800fc6:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  800fca:	48 89 c6             	mov    %rax,%rsi
  800fcd:	48 bf 05 0f 80 00 00 	movabs $0x800f05,%rdi
  800fd4:	00 00 00 
  800fd7:	48 b8 3a 09 80 00 00 	movabs $0x80093a,%rax
  800fde:	00 00 00 
  800fe1:	ff d0                	callq  *%rax
  800fe3:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800fe7:	c6 00 00             	movb   $0x0,(%rax)
  800fea:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800fed:	c9                   	leaveq 
  800fee:	c3                   	retq   

0000000000800fef <snprintf>:
  800fef:	55                   	push   %rbp
  800ff0:	48 89 e5             	mov    %rsp,%rbp
  800ff3:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  800ffa:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  801001:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  801007:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  80100e:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  801015:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  80101c:	84 c0                	test   %al,%al
  80101e:	74 20                	je     801040 <snprintf+0x51>
  801020:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  801024:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  801028:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  80102c:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  801030:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  801034:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  801038:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  80103c:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  801040:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  801047:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  80104e:	00 00 00 
  801051:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  801058:	00 00 00 
  80105b:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80105f:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  801066:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  80106d:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  801074:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  80107b:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  801082:	48 8b 0a             	mov    (%rdx),%rcx
  801085:	48 89 08             	mov    %rcx,(%rax)
  801088:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80108c:	48 89 48 08          	mov    %rcx,0x8(%rax)
  801090:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801094:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801098:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  80109f:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  8010a6:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  8010ac:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8010b3:	48 89 c7             	mov    %rax,%rdi
  8010b6:	48 b8 52 0f 80 00 00 	movabs $0x800f52,%rax
  8010bd:	00 00 00 
  8010c0:	ff d0                	callq  *%rax
  8010c2:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  8010c8:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  8010ce:	c9                   	leaveq 
  8010cf:	c3                   	retq   

00000000008010d0 <strlen>:
  8010d0:	55                   	push   %rbp
  8010d1:	48 89 e5             	mov    %rsp,%rbp
  8010d4:	48 83 ec 18          	sub    $0x18,%rsp
  8010d8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8010dc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8010e3:	eb 09                	jmp    8010ee <strlen+0x1e>
  8010e5:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8010e9:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8010ee:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010f2:	0f b6 00             	movzbl (%rax),%eax
  8010f5:	84 c0                	test   %al,%al
  8010f7:	75 ec                	jne    8010e5 <strlen+0x15>
  8010f9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8010fc:	c9                   	leaveq 
  8010fd:	c3                   	retq   

00000000008010fe <strnlen>:
  8010fe:	55                   	push   %rbp
  8010ff:	48 89 e5             	mov    %rsp,%rbp
  801102:	48 83 ec 20          	sub    $0x20,%rsp
  801106:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80110a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80110e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801115:	eb 0e                	jmp    801125 <strnlen+0x27>
  801117:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80111b:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801120:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  801125:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80112a:	74 0b                	je     801137 <strnlen+0x39>
  80112c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801130:	0f b6 00             	movzbl (%rax),%eax
  801133:	84 c0                	test   %al,%al
  801135:	75 e0                	jne    801117 <strnlen+0x19>
  801137:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80113a:	c9                   	leaveq 
  80113b:	c3                   	retq   

000000000080113c <strcpy>:
  80113c:	55                   	push   %rbp
  80113d:	48 89 e5             	mov    %rsp,%rbp
  801140:	48 83 ec 20          	sub    $0x20,%rsp
  801144:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801148:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80114c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801150:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801154:	90                   	nop
  801155:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801159:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80115d:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801161:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801165:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801169:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  80116d:	0f b6 12             	movzbl (%rdx),%edx
  801170:	88 10                	mov    %dl,(%rax)
  801172:	0f b6 00             	movzbl (%rax),%eax
  801175:	84 c0                	test   %al,%al
  801177:	75 dc                	jne    801155 <strcpy+0x19>
  801179:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80117d:	c9                   	leaveq 
  80117e:	c3                   	retq   

000000000080117f <strcat>:
  80117f:	55                   	push   %rbp
  801180:	48 89 e5             	mov    %rsp,%rbp
  801183:	48 83 ec 20          	sub    $0x20,%rsp
  801187:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80118b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80118f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801193:	48 89 c7             	mov    %rax,%rdi
  801196:	48 b8 d0 10 80 00 00 	movabs $0x8010d0,%rax
  80119d:	00 00 00 
  8011a0:	ff d0                	callq  *%rax
  8011a2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8011a5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8011a8:	48 63 d0             	movslq %eax,%rdx
  8011ab:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011af:	48 01 c2             	add    %rax,%rdx
  8011b2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8011b6:	48 89 c6             	mov    %rax,%rsi
  8011b9:	48 89 d7             	mov    %rdx,%rdi
  8011bc:	48 b8 3c 11 80 00 00 	movabs $0x80113c,%rax
  8011c3:	00 00 00 
  8011c6:	ff d0                	callq  *%rax
  8011c8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011cc:	c9                   	leaveq 
  8011cd:	c3                   	retq   

00000000008011ce <strncpy>:
  8011ce:	55                   	push   %rbp
  8011cf:	48 89 e5             	mov    %rsp,%rbp
  8011d2:	48 83 ec 28          	sub    $0x28,%rsp
  8011d6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8011da:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8011de:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8011e2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011e6:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8011ea:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8011f1:	00 
  8011f2:	eb 2a                	jmp    80121e <strncpy+0x50>
  8011f4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011f8:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8011fc:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801200:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801204:	0f b6 12             	movzbl (%rdx),%edx
  801207:	88 10                	mov    %dl,(%rax)
  801209:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80120d:	0f b6 00             	movzbl (%rax),%eax
  801210:	84 c0                	test   %al,%al
  801212:	74 05                	je     801219 <strncpy+0x4b>
  801214:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  801219:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80121e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801222:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  801226:	72 cc                	jb     8011f4 <strncpy+0x26>
  801228:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80122c:	c9                   	leaveq 
  80122d:	c3                   	retq   

000000000080122e <strlcpy>:
  80122e:	55                   	push   %rbp
  80122f:	48 89 e5             	mov    %rsp,%rbp
  801232:	48 83 ec 28          	sub    $0x28,%rsp
  801236:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80123a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80123e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801242:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801246:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80124a:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80124f:	74 3d                	je     80128e <strlcpy+0x60>
  801251:	eb 1d                	jmp    801270 <strlcpy+0x42>
  801253:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801257:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80125b:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80125f:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801263:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801267:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  80126b:	0f b6 12             	movzbl (%rdx),%edx
  80126e:	88 10                	mov    %dl,(%rax)
  801270:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  801275:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80127a:	74 0b                	je     801287 <strlcpy+0x59>
  80127c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801280:	0f b6 00             	movzbl (%rax),%eax
  801283:	84 c0                	test   %al,%al
  801285:	75 cc                	jne    801253 <strlcpy+0x25>
  801287:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80128b:	c6 00 00             	movb   $0x0,(%rax)
  80128e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801292:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801296:	48 29 c2             	sub    %rax,%rdx
  801299:	48 89 d0             	mov    %rdx,%rax
  80129c:	c9                   	leaveq 
  80129d:	c3                   	retq   

000000000080129e <strcmp>:
  80129e:	55                   	push   %rbp
  80129f:	48 89 e5             	mov    %rsp,%rbp
  8012a2:	48 83 ec 10          	sub    $0x10,%rsp
  8012a6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8012aa:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8012ae:	eb 0a                	jmp    8012ba <strcmp+0x1c>
  8012b0:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8012b5:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8012ba:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012be:	0f b6 00             	movzbl (%rax),%eax
  8012c1:	84 c0                	test   %al,%al
  8012c3:	74 12                	je     8012d7 <strcmp+0x39>
  8012c5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012c9:	0f b6 10             	movzbl (%rax),%edx
  8012cc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012d0:	0f b6 00             	movzbl (%rax),%eax
  8012d3:	38 c2                	cmp    %al,%dl
  8012d5:	74 d9                	je     8012b0 <strcmp+0x12>
  8012d7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012db:	0f b6 00             	movzbl (%rax),%eax
  8012de:	0f b6 d0             	movzbl %al,%edx
  8012e1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012e5:	0f b6 00             	movzbl (%rax),%eax
  8012e8:	0f b6 c0             	movzbl %al,%eax
  8012eb:	29 c2                	sub    %eax,%edx
  8012ed:	89 d0                	mov    %edx,%eax
  8012ef:	c9                   	leaveq 
  8012f0:	c3                   	retq   

00000000008012f1 <strncmp>:
  8012f1:	55                   	push   %rbp
  8012f2:	48 89 e5             	mov    %rsp,%rbp
  8012f5:	48 83 ec 18          	sub    $0x18,%rsp
  8012f9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8012fd:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801301:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801305:	eb 0f                	jmp    801316 <strncmp+0x25>
  801307:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  80130c:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801311:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801316:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80131b:	74 1d                	je     80133a <strncmp+0x49>
  80131d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801321:	0f b6 00             	movzbl (%rax),%eax
  801324:	84 c0                	test   %al,%al
  801326:	74 12                	je     80133a <strncmp+0x49>
  801328:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80132c:	0f b6 10             	movzbl (%rax),%edx
  80132f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801333:	0f b6 00             	movzbl (%rax),%eax
  801336:	38 c2                	cmp    %al,%dl
  801338:	74 cd                	je     801307 <strncmp+0x16>
  80133a:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80133f:	75 07                	jne    801348 <strncmp+0x57>
  801341:	b8 00 00 00 00       	mov    $0x0,%eax
  801346:	eb 18                	jmp    801360 <strncmp+0x6f>
  801348:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80134c:	0f b6 00             	movzbl (%rax),%eax
  80134f:	0f b6 d0             	movzbl %al,%edx
  801352:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801356:	0f b6 00             	movzbl (%rax),%eax
  801359:	0f b6 c0             	movzbl %al,%eax
  80135c:	29 c2                	sub    %eax,%edx
  80135e:	89 d0                	mov    %edx,%eax
  801360:	c9                   	leaveq 
  801361:	c3                   	retq   

0000000000801362 <strchr>:
  801362:	55                   	push   %rbp
  801363:	48 89 e5             	mov    %rsp,%rbp
  801366:	48 83 ec 0c          	sub    $0xc,%rsp
  80136a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80136e:	89 f0                	mov    %esi,%eax
  801370:	88 45 f4             	mov    %al,-0xc(%rbp)
  801373:	eb 17                	jmp    80138c <strchr+0x2a>
  801375:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801379:	0f b6 00             	movzbl (%rax),%eax
  80137c:	3a 45 f4             	cmp    -0xc(%rbp),%al
  80137f:	75 06                	jne    801387 <strchr+0x25>
  801381:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801385:	eb 15                	jmp    80139c <strchr+0x3a>
  801387:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80138c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801390:	0f b6 00             	movzbl (%rax),%eax
  801393:	84 c0                	test   %al,%al
  801395:	75 de                	jne    801375 <strchr+0x13>
  801397:	b8 00 00 00 00       	mov    $0x0,%eax
  80139c:	c9                   	leaveq 
  80139d:	c3                   	retq   

000000000080139e <strfind>:
  80139e:	55                   	push   %rbp
  80139f:	48 89 e5             	mov    %rsp,%rbp
  8013a2:	48 83 ec 0c          	sub    $0xc,%rsp
  8013a6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8013aa:	89 f0                	mov    %esi,%eax
  8013ac:	88 45 f4             	mov    %al,-0xc(%rbp)
  8013af:	eb 13                	jmp    8013c4 <strfind+0x26>
  8013b1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013b5:	0f b6 00             	movzbl (%rax),%eax
  8013b8:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8013bb:	75 02                	jne    8013bf <strfind+0x21>
  8013bd:	eb 10                	jmp    8013cf <strfind+0x31>
  8013bf:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8013c4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013c8:	0f b6 00             	movzbl (%rax),%eax
  8013cb:	84 c0                	test   %al,%al
  8013cd:	75 e2                	jne    8013b1 <strfind+0x13>
  8013cf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013d3:	c9                   	leaveq 
  8013d4:	c3                   	retq   

00000000008013d5 <memset>:
  8013d5:	55                   	push   %rbp
  8013d6:	48 89 e5             	mov    %rsp,%rbp
  8013d9:	48 83 ec 18          	sub    $0x18,%rsp
  8013dd:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8013e1:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8013e4:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8013e8:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8013ed:	75 06                	jne    8013f5 <memset+0x20>
  8013ef:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013f3:	eb 69                	jmp    80145e <memset+0x89>
  8013f5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013f9:	83 e0 03             	and    $0x3,%eax
  8013fc:	48 85 c0             	test   %rax,%rax
  8013ff:	75 48                	jne    801449 <memset+0x74>
  801401:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801405:	83 e0 03             	and    $0x3,%eax
  801408:	48 85 c0             	test   %rax,%rax
  80140b:	75 3c                	jne    801449 <memset+0x74>
  80140d:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  801414:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801417:	c1 e0 18             	shl    $0x18,%eax
  80141a:	89 c2                	mov    %eax,%edx
  80141c:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80141f:	c1 e0 10             	shl    $0x10,%eax
  801422:	09 c2                	or     %eax,%edx
  801424:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801427:	c1 e0 08             	shl    $0x8,%eax
  80142a:	09 d0                	or     %edx,%eax
  80142c:	09 45 f4             	or     %eax,-0xc(%rbp)
  80142f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801433:	48 c1 e8 02          	shr    $0x2,%rax
  801437:	48 89 c1             	mov    %rax,%rcx
  80143a:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80143e:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801441:	48 89 d7             	mov    %rdx,%rdi
  801444:	fc                   	cld    
  801445:	f3 ab                	rep stos %eax,%es:(%rdi)
  801447:	eb 11                	jmp    80145a <memset+0x85>
  801449:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80144d:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801450:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801454:	48 89 d7             	mov    %rdx,%rdi
  801457:	fc                   	cld    
  801458:	f3 aa                	rep stos %al,%es:(%rdi)
  80145a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80145e:	c9                   	leaveq 
  80145f:	c3                   	retq   

0000000000801460 <memmove>:
  801460:	55                   	push   %rbp
  801461:	48 89 e5             	mov    %rsp,%rbp
  801464:	48 83 ec 28          	sub    $0x28,%rsp
  801468:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80146c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801470:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801474:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801478:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80147c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801480:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801484:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801488:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  80148c:	0f 83 88 00 00 00    	jae    80151a <memmove+0xba>
  801492:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801496:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80149a:	48 01 d0             	add    %rdx,%rax
  80149d:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8014a1:	76 77                	jbe    80151a <memmove+0xba>
  8014a3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014a7:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  8014ab:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014af:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  8014b3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014b7:	83 e0 03             	and    $0x3,%eax
  8014ba:	48 85 c0             	test   %rax,%rax
  8014bd:	75 3b                	jne    8014fa <memmove+0x9a>
  8014bf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014c3:	83 e0 03             	and    $0x3,%eax
  8014c6:	48 85 c0             	test   %rax,%rax
  8014c9:	75 2f                	jne    8014fa <memmove+0x9a>
  8014cb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014cf:	83 e0 03             	and    $0x3,%eax
  8014d2:	48 85 c0             	test   %rax,%rax
  8014d5:	75 23                	jne    8014fa <memmove+0x9a>
  8014d7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014db:	48 83 e8 04          	sub    $0x4,%rax
  8014df:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8014e3:	48 83 ea 04          	sub    $0x4,%rdx
  8014e7:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  8014eb:	48 c1 e9 02          	shr    $0x2,%rcx
  8014ef:	48 89 c7             	mov    %rax,%rdi
  8014f2:	48 89 d6             	mov    %rdx,%rsi
  8014f5:	fd                   	std    
  8014f6:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  8014f8:	eb 1d                	jmp    801517 <memmove+0xb7>
  8014fa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014fe:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801502:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801506:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  80150a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80150e:	48 89 d7             	mov    %rdx,%rdi
  801511:	48 89 c1             	mov    %rax,%rcx
  801514:	fd                   	std    
  801515:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801517:	fc                   	cld    
  801518:	eb 57                	jmp    801571 <memmove+0x111>
  80151a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80151e:	83 e0 03             	and    $0x3,%eax
  801521:	48 85 c0             	test   %rax,%rax
  801524:	75 36                	jne    80155c <memmove+0xfc>
  801526:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80152a:	83 e0 03             	and    $0x3,%eax
  80152d:	48 85 c0             	test   %rax,%rax
  801530:	75 2a                	jne    80155c <memmove+0xfc>
  801532:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801536:	83 e0 03             	and    $0x3,%eax
  801539:	48 85 c0             	test   %rax,%rax
  80153c:	75 1e                	jne    80155c <memmove+0xfc>
  80153e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801542:	48 c1 e8 02          	shr    $0x2,%rax
  801546:	48 89 c1             	mov    %rax,%rcx
  801549:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80154d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801551:	48 89 c7             	mov    %rax,%rdi
  801554:	48 89 d6             	mov    %rdx,%rsi
  801557:	fc                   	cld    
  801558:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  80155a:	eb 15                	jmp    801571 <memmove+0x111>
  80155c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801560:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801564:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801568:	48 89 c7             	mov    %rax,%rdi
  80156b:	48 89 d6             	mov    %rdx,%rsi
  80156e:	fc                   	cld    
  80156f:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801571:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801575:	c9                   	leaveq 
  801576:	c3                   	retq   

0000000000801577 <memcpy>:
  801577:	55                   	push   %rbp
  801578:	48 89 e5             	mov    %rsp,%rbp
  80157b:	48 83 ec 18          	sub    $0x18,%rsp
  80157f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801583:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801587:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80158b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80158f:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  801593:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801597:	48 89 ce             	mov    %rcx,%rsi
  80159a:	48 89 c7             	mov    %rax,%rdi
  80159d:	48 b8 60 14 80 00 00 	movabs $0x801460,%rax
  8015a4:	00 00 00 
  8015a7:	ff d0                	callq  *%rax
  8015a9:	c9                   	leaveq 
  8015aa:	c3                   	retq   

00000000008015ab <memcmp>:
  8015ab:	55                   	push   %rbp
  8015ac:	48 89 e5             	mov    %rsp,%rbp
  8015af:	48 83 ec 28          	sub    $0x28,%rsp
  8015b3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8015b7:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8015bb:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8015bf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8015c3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8015c7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8015cb:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8015cf:	eb 36                	jmp    801607 <memcmp+0x5c>
  8015d1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015d5:	0f b6 10             	movzbl (%rax),%edx
  8015d8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015dc:	0f b6 00             	movzbl (%rax),%eax
  8015df:	38 c2                	cmp    %al,%dl
  8015e1:	74 1a                	je     8015fd <memcmp+0x52>
  8015e3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015e7:	0f b6 00             	movzbl (%rax),%eax
  8015ea:	0f b6 d0             	movzbl %al,%edx
  8015ed:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015f1:	0f b6 00             	movzbl (%rax),%eax
  8015f4:	0f b6 c0             	movzbl %al,%eax
  8015f7:	29 c2                	sub    %eax,%edx
  8015f9:	89 d0                	mov    %edx,%eax
  8015fb:	eb 20                	jmp    80161d <memcmp+0x72>
  8015fd:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801602:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801607:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80160b:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80160f:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801613:	48 85 c0             	test   %rax,%rax
  801616:	75 b9                	jne    8015d1 <memcmp+0x26>
  801618:	b8 00 00 00 00       	mov    $0x0,%eax
  80161d:	c9                   	leaveq 
  80161e:	c3                   	retq   

000000000080161f <memfind>:
  80161f:	55                   	push   %rbp
  801620:	48 89 e5             	mov    %rsp,%rbp
  801623:	48 83 ec 28          	sub    $0x28,%rsp
  801627:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80162b:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80162e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801632:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801636:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80163a:	48 01 d0             	add    %rdx,%rax
  80163d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801641:	eb 15                	jmp    801658 <memfind+0x39>
  801643:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801647:	0f b6 10             	movzbl (%rax),%edx
  80164a:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80164d:	38 c2                	cmp    %al,%dl
  80164f:	75 02                	jne    801653 <memfind+0x34>
  801651:	eb 0f                	jmp    801662 <memfind+0x43>
  801653:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801658:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80165c:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  801660:	72 e1                	jb     801643 <memfind+0x24>
  801662:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801666:	c9                   	leaveq 
  801667:	c3                   	retq   

0000000000801668 <strtol>:
  801668:	55                   	push   %rbp
  801669:	48 89 e5             	mov    %rsp,%rbp
  80166c:	48 83 ec 34          	sub    $0x34,%rsp
  801670:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801674:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801678:	89 55 cc             	mov    %edx,-0x34(%rbp)
  80167b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801682:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  801689:	00 
  80168a:	eb 05                	jmp    801691 <strtol+0x29>
  80168c:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801691:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801695:	0f b6 00             	movzbl (%rax),%eax
  801698:	3c 20                	cmp    $0x20,%al
  80169a:	74 f0                	je     80168c <strtol+0x24>
  80169c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016a0:	0f b6 00             	movzbl (%rax),%eax
  8016a3:	3c 09                	cmp    $0x9,%al
  8016a5:	74 e5                	je     80168c <strtol+0x24>
  8016a7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016ab:	0f b6 00             	movzbl (%rax),%eax
  8016ae:	3c 2b                	cmp    $0x2b,%al
  8016b0:	75 07                	jne    8016b9 <strtol+0x51>
  8016b2:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8016b7:	eb 17                	jmp    8016d0 <strtol+0x68>
  8016b9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016bd:	0f b6 00             	movzbl (%rax),%eax
  8016c0:	3c 2d                	cmp    $0x2d,%al
  8016c2:	75 0c                	jne    8016d0 <strtol+0x68>
  8016c4:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8016c9:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  8016d0:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8016d4:	74 06                	je     8016dc <strtol+0x74>
  8016d6:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  8016da:	75 28                	jne    801704 <strtol+0x9c>
  8016dc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016e0:	0f b6 00             	movzbl (%rax),%eax
  8016e3:	3c 30                	cmp    $0x30,%al
  8016e5:	75 1d                	jne    801704 <strtol+0x9c>
  8016e7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016eb:	48 83 c0 01          	add    $0x1,%rax
  8016ef:	0f b6 00             	movzbl (%rax),%eax
  8016f2:	3c 78                	cmp    $0x78,%al
  8016f4:	75 0e                	jne    801704 <strtol+0x9c>
  8016f6:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  8016fb:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  801702:	eb 2c                	jmp    801730 <strtol+0xc8>
  801704:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801708:	75 19                	jne    801723 <strtol+0xbb>
  80170a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80170e:	0f b6 00             	movzbl (%rax),%eax
  801711:	3c 30                	cmp    $0x30,%al
  801713:	75 0e                	jne    801723 <strtol+0xbb>
  801715:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80171a:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  801721:	eb 0d                	jmp    801730 <strtol+0xc8>
  801723:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801727:	75 07                	jne    801730 <strtol+0xc8>
  801729:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  801730:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801734:	0f b6 00             	movzbl (%rax),%eax
  801737:	3c 2f                	cmp    $0x2f,%al
  801739:	7e 1d                	jle    801758 <strtol+0xf0>
  80173b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80173f:	0f b6 00             	movzbl (%rax),%eax
  801742:	3c 39                	cmp    $0x39,%al
  801744:	7f 12                	jg     801758 <strtol+0xf0>
  801746:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80174a:	0f b6 00             	movzbl (%rax),%eax
  80174d:	0f be c0             	movsbl %al,%eax
  801750:	83 e8 30             	sub    $0x30,%eax
  801753:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801756:	eb 4e                	jmp    8017a6 <strtol+0x13e>
  801758:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80175c:	0f b6 00             	movzbl (%rax),%eax
  80175f:	3c 60                	cmp    $0x60,%al
  801761:	7e 1d                	jle    801780 <strtol+0x118>
  801763:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801767:	0f b6 00             	movzbl (%rax),%eax
  80176a:	3c 7a                	cmp    $0x7a,%al
  80176c:	7f 12                	jg     801780 <strtol+0x118>
  80176e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801772:	0f b6 00             	movzbl (%rax),%eax
  801775:	0f be c0             	movsbl %al,%eax
  801778:	83 e8 57             	sub    $0x57,%eax
  80177b:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80177e:	eb 26                	jmp    8017a6 <strtol+0x13e>
  801780:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801784:	0f b6 00             	movzbl (%rax),%eax
  801787:	3c 40                	cmp    $0x40,%al
  801789:	7e 48                	jle    8017d3 <strtol+0x16b>
  80178b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80178f:	0f b6 00             	movzbl (%rax),%eax
  801792:	3c 5a                	cmp    $0x5a,%al
  801794:	7f 3d                	jg     8017d3 <strtol+0x16b>
  801796:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80179a:	0f b6 00             	movzbl (%rax),%eax
  80179d:	0f be c0             	movsbl %al,%eax
  8017a0:	83 e8 37             	sub    $0x37,%eax
  8017a3:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8017a6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8017a9:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  8017ac:	7c 02                	jl     8017b0 <strtol+0x148>
  8017ae:	eb 23                	jmp    8017d3 <strtol+0x16b>
  8017b0:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8017b5:	8b 45 cc             	mov    -0x34(%rbp),%eax
  8017b8:	48 98                	cltq   
  8017ba:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  8017bf:	48 89 c2             	mov    %rax,%rdx
  8017c2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8017c5:	48 98                	cltq   
  8017c7:	48 01 d0             	add    %rdx,%rax
  8017ca:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8017ce:	e9 5d ff ff ff       	jmpq   801730 <strtol+0xc8>
  8017d3:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  8017d8:	74 0b                	je     8017e5 <strtol+0x17d>
  8017da:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8017de:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8017e2:	48 89 10             	mov    %rdx,(%rax)
  8017e5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8017e9:	74 09                	je     8017f4 <strtol+0x18c>
  8017eb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017ef:	48 f7 d8             	neg    %rax
  8017f2:	eb 04                	jmp    8017f8 <strtol+0x190>
  8017f4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017f8:	c9                   	leaveq 
  8017f9:	c3                   	retq   

00000000008017fa <strstr>:
  8017fa:	55                   	push   %rbp
  8017fb:	48 89 e5             	mov    %rsp,%rbp
  8017fe:	48 83 ec 30          	sub    $0x30,%rsp
  801802:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801806:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80180a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80180e:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801812:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801816:	0f b6 00             	movzbl (%rax),%eax
  801819:	88 45 ff             	mov    %al,-0x1(%rbp)
  80181c:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  801820:	75 06                	jne    801828 <strstr+0x2e>
  801822:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801826:	eb 6b                	jmp    801893 <strstr+0x99>
  801828:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80182c:	48 89 c7             	mov    %rax,%rdi
  80182f:	48 b8 d0 10 80 00 00 	movabs $0x8010d0,%rax
  801836:	00 00 00 
  801839:	ff d0                	callq  *%rax
  80183b:	48 98                	cltq   
  80183d:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801841:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801845:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801849:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80184d:	0f b6 00             	movzbl (%rax),%eax
  801850:	88 45 ef             	mov    %al,-0x11(%rbp)
  801853:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  801857:	75 07                	jne    801860 <strstr+0x66>
  801859:	b8 00 00 00 00       	mov    $0x0,%eax
  80185e:	eb 33                	jmp    801893 <strstr+0x99>
  801860:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  801864:	3a 45 ff             	cmp    -0x1(%rbp),%al
  801867:	75 d8                	jne    801841 <strstr+0x47>
  801869:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80186d:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  801871:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801875:	48 89 ce             	mov    %rcx,%rsi
  801878:	48 89 c7             	mov    %rax,%rdi
  80187b:	48 b8 f1 12 80 00 00 	movabs $0x8012f1,%rax
  801882:	00 00 00 
  801885:	ff d0                	callq  *%rax
  801887:	85 c0                	test   %eax,%eax
  801889:	75 b6                	jne    801841 <strstr+0x47>
  80188b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80188f:	48 83 e8 01          	sub    $0x1,%rax
  801893:	c9                   	leaveq 
  801894:	c3                   	retq   

0000000000801895 <syscall>:
  801895:	55                   	push   %rbp
  801896:	48 89 e5             	mov    %rsp,%rbp
  801899:	53                   	push   %rbx
  80189a:	48 83 ec 48          	sub    $0x48,%rsp
  80189e:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8018a1:	89 75 d8             	mov    %esi,-0x28(%rbp)
  8018a4:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  8018a8:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  8018ac:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  8018b0:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  8018b4:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8018b7:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  8018bb:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  8018bf:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  8018c3:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  8018c7:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  8018cb:	4c 89 c3             	mov    %r8,%rbx
  8018ce:	cd 30                	int    $0x30
  8018d0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8018d4:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  8018d8:	74 3e                	je     801918 <syscall+0x83>
  8018da:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8018df:	7e 37                	jle    801918 <syscall+0x83>
  8018e1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8018e5:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8018e8:	49 89 d0             	mov    %rdx,%r8
  8018eb:	89 c1                	mov    %eax,%ecx
  8018ed:	48 ba 68 5b 80 00 00 	movabs $0x805b68,%rdx
  8018f4:	00 00 00 
  8018f7:	be 24 00 00 00       	mov    $0x24,%esi
  8018fc:	48 bf 85 5b 80 00 00 	movabs $0x805b85,%rdi
  801903:	00 00 00 
  801906:	b8 00 00 00 00       	mov    $0x0,%eax
  80190b:	49 b9 4e 03 80 00 00 	movabs $0x80034e,%r9
  801912:	00 00 00 
  801915:	41 ff d1             	callq  *%r9
  801918:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80191c:	48 83 c4 48          	add    $0x48,%rsp
  801920:	5b                   	pop    %rbx
  801921:	5d                   	pop    %rbp
  801922:	c3                   	retq   

0000000000801923 <sys_cputs>:
  801923:	55                   	push   %rbp
  801924:	48 89 e5             	mov    %rsp,%rbp
  801927:	48 83 ec 20          	sub    $0x20,%rsp
  80192b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80192f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801933:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801937:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80193b:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801942:	00 
  801943:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801949:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80194f:	48 89 d1             	mov    %rdx,%rcx
  801952:	48 89 c2             	mov    %rax,%rdx
  801955:	be 00 00 00 00       	mov    $0x0,%esi
  80195a:	bf 00 00 00 00       	mov    $0x0,%edi
  80195f:	48 b8 95 18 80 00 00 	movabs $0x801895,%rax
  801966:	00 00 00 
  801969:	ff d0                	callq  *%rax
  80196b:	c9                   	leaveq 
  80196c:	c3                   	retq   

000000000080196d <sys_cgetc>:
  80196d:	55                   	push   %rbp
  80196e:	48 89 e5             	mov    %rsp,%rbp
  801971:	48 83 ec 10          	sub    $0x10,%rsp
  801975:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80197c:	00 
  80197d:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801983:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801989:	b9 00 00 00 00       	mov    $0x0,%ecx
  80198e:	ba 00 00 00 00       	mov    $0x0,%edx
  801993:	be 00 00 00 00       	mov    $0x0,%esi
  801998:	bf 01 00 00 00       	mov    $0x1,%edi
  80199d:	48 b8 95 18 80 00 00 	movabs $0x801895,%rax
  8019a4:	00 00 00 
  8019a7:	ff d0                	callq  *%rax
  8019a9:	c9                   	leaveq 
  8019aa:	c3                   	retq   

00000000008019ab <sys_env_destroy>:
  8019ab:	55                   	push   %rbp
  8019ac:	48 89 e5             	mov    %rsp,%rbp
  8019af:	48 83 ec 10          	sub    $0x10,%rsp
  8019b3:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8019b6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8019b9:	48 98                	cltq   
  8019bb:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8019c2:	00 
  8019c3:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8019c9:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8019cf:	b9 00 00 00 00       	mov    $0x0,%ecx
  8019d4:	48 89 c2             	mov    %rax,%rdx
  8019d7:	be 01 00 00 00       	mov    $0x1,%esi
  8019dc:	bf 03 00 00 00       	mov    $0x3,%edi
  8019e1:	48 b8 95 18 80 00 00 	movabs $0x801895,%rax
  8019e8:	00 00 00 
  8019eb:	ff d0                	callq  *%rax
  8019ed:	c9                   	leaveq 
  8019ee:	c3                   	retq   

00000000008019ef <sys_getenvid>:
  8019ef:	55                   	push   %rbp
  8019f0:	48 89 e5             	mov    %rsp,%rbp
  8019f3:	48 83 ec 10          	sub    $0x10,%rsp
  8019f7:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8019fe:	00 
  8019ff:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a05:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a0b:	b9 00 00 00 00       	mov    $0x0,%ecx
  801a10:	ba 00 00 00 00       	mov    $0x0,%edx
  801a15:	be 00 00 00 00       	mov    $0x0,%esi
  801a1a:	bf 02 00 00 00       	mov    $0x2,%edi
  801a1f:	48 b8 95 18 80 00 00 	movabs $0x801895,%rax
  801a26:	00 00 00 
  801a29:	ff d0                	callq  *%rax
  801a2b:	c9                   	leaveq 
  801a2c:	c3                   	retq   

0000000000801a2d <sys_yield>:
  801a2d:	55                   	push   %rbp
  801a2e:	48 89 e5             	mov    %rsp,%rbp
  801a31:	48 83 ec 10          	sub    $0x10,%rsp
  801a35:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801a3c:	00 
  801a3d:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a43:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a49:	b9 00 00 00 00       	mov    $0x0,%ecx
  801a4e:	ba 00 00 00 00       	mov    $0x0,%edx
  801a53:	be 00 00 00 00       	mov    $0x0,%esi
  801a58:	bf 0b 00 00 00       	mov    $0xb,%edi
  801a5d:	48 b8 95 18 80 00 00 	movabs $0x801895,%rax
  801a64:	00 00 00 
  801a67:	ff d0                	callq  *%rax
  801a69:	c9                   	leaveq 
  801a6a:	c3                   	retq   

0000000000801a6b <sys_page_alloc>:
  801a6b:	55                   	push   %rbp
  801a6c:	48 89 e5             	mov    %rsp,%rbp
  801a6f:	48 83 ec 20          	sub    $0x20,%rsp
  801a73:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a76:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a7a:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801a7d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801a80:	48 63 c8             	movslq %eax,%rcx
  801a83:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801a87:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a8a:	48 98                	cltq   
  801a8c:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801a93:	00 
  801a94:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a9a:	49 89 c8             	mov    %rcx,%r8
  801a9d:	48 89 d1             	mov    %rdx,%rcx
  801aa0:	48 89 c2             	mov    %rax,%rdx
  801aa3:	be 01 00 00 00       	mov    $0x1,%esi
  801aa8:	bf 04 00 00 00       	mov    $0x4,%edi
  801aad:	48 b8 95 18 80 00 00 	movabs $0x801895,%rax
  801ab4:	00 00 00 
  801ab7:	ff d0                	callq  *%rax
  801ab9:	c9                   	leaveq 
  801aba:	c3                   	retq   

0000000000801abb <sys_page_map>:
  801abb:	55                   	push   %rbp
  801abc:	48 89 e5             	mov    %rsp,%rbp
  801abf:	48 83 ec 30          	sub    $0x30,%rsp
  801ac3:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801ac6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801aca:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801acd:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801ad1:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801ad5:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801ad8:	48 63 c8             	movslq %eax,%rcx
  801adb:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801adf:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801ae2:	48 63 f0             	movslq %eax,%rsi
  801ae5:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801ae9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801aec:	48 98                	cltq   
  801aee:	48 89 0c 24          	mov    %rcx,(%rsp)
  801af2:	49 89 f9             	mov    %rdi,%r9
  801af5:	49 89 f0             	mov    %rsi,%r8
  801af8:	48 89 d1             	mov    %rdx,%rcx
  801afb:	48 89 c2             	mov    %rax,%rdx
  801afe:	be 01 00 00 00       	mov    $0x1,%esi
  801b03:	bf 05 00 00 00       	mov    $0x5,%edi
  801b08:	48 b8 95 18 80 00 00 	movabs $0x801895,%rax
  801b0f:	00 00 00 
  801b12:	ff d0                	callq  *%rax
  801b14:	c9                   	leaveq 
  801b15:	c3                   	retq   

0000000000801b16 <sys_page_unmap>:
  801b16:	55                   	push   %rbp
  801b17:	48 89 e5             	mov    %rsp,%rbp
  801b1a:	48 83 ec 20          	sub    $0x20,%rsp
  801b1e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b21:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b25:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b29:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b2c:	48 98                	cltq   
  801b2e:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801b35:	00 
  801b36:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b3c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b42:	48 89 d1             	mov    %rdx,%rcx
  801b45:	48 89 c2             	mov    %rax,%rdx
  801b48:	be 01 00 00 00       	mov    $0x1,%esi
  801b4d:	bf 06 00 00 00       	mov    $0x6,%edi
  801b52:	48 b8 95 18 80 00 00 	movabs $0x801895,%rax
  801b59:	00 00 00 
  801b5c:	ff d0                	callq  *%rax
  801b5e:	c9                   	leaveq 
  801b5f:	c3                   	retq   

0000000000801b60 <sys_env_set_status>:
  801b60:	55                   	push   %rbp
  801b61:	48 89 e5             	mov    %rsp,%rbp
  801b64:	48 83 ec 10          	sub    $0x10,%rsp
  801b68:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b6b:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801b6e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801b71:	48 63 d0             	movslq %eax,%rdx
  801b74:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b77:	48 98                	cltq   
  801b79:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801b80:	00 
  801b81:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b87:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b8d:	48 89 d1             	mov    %rdx,%rcx
  801b90:	48 89 c2             	mov    %rax,%rdx
  801b93:	be 01 00 00 00       	mov    $0x1,%esi
  801b98:	bf 08 00 00 00       	mov    $0x8,%edi
  801b9d:	48 b8 95 18 80 00 00 	movabs $0x801895,%rax
  801ba4:	00 00 00 
  801ba7:	ff d0                	callq  *%rax
  801ba9:	c9                   	leaveq 
  801baa:	c3                   	retq   

0000000000801bab <sys_env_set_trapframe>:
  801bab:	55                   	push   %rbp
  801bac:	48 89 e5             	mov    %rsp,%rbp
  801baf:	48 83 ec 20          	sub    $0x20,%rsp
  801bb3:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801bb6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801bba:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801bbe:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801bc1:	48 98                	cltq   
  801bc3:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801bca:	00 
  801bcb:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801bd1:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801bd7:	48 89 d1             	mov    %rdx,%rcx
  801bda:	48 89 c2             	mov    %rax,%rdx
  801bdd:	be 01 00 00 00       	mov    $0x1,%esi
  801be2:	bf 09 00 00 00       	mov    $0x9,%edi
  801be7:	48 b8 95 18 80 00 00 	movabs $0x801895,%rax
  801bee:	00 00 00 
  801bf1:	ff d0                	callq  *%rax
  801bf3:	c9                   	leaveq 
  801bf4:	c3                   	retq   

0000000000801bf5 <sys_env_set_pgfault_upcall>:
  801bf5:	55                   	push   %rbp
  801bf6:	48 89 e5             	mov    %rsp,%rbp
  801bf9:	48 83 ec 20          	sub    $0x20,%rsp
  801bfd:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801c00:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c04:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c08:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c0b:	48 98                	cltq   
  801c0d:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c14:	00 
  801c15:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c1b:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c21:	48 89 d1             	mov    %rdx,%rcx
  801c24:	48 89 c2             	mov    %rax,%rdx
  801c27:	be 01 00 00 00       	mov    $0x1,%esi
  801c2c:	bf 0a 00 00 00       	mov    $0xa,%edi
  801c31:	48 b8 95 18 80 00 00 	movabs $0x801895,%rax
  801c38:	00 00 00 
  801c3b:	ff d0                	callq  *%rax
  801c3d:	c9                   	leaveq 
  801c3e:	c3                   	retq   

0000000000801c3f <sys_ipc_try_send>:
  801c3f:	55                   	push   %rbp
  801c40:	48 89 e5             	mov    %rsp,%rbp
  801c43:	48 83 ec 20          	sub    $0x20,%rsp
  801c47:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801c4a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c4e:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801c52:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801c55:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801c58:	48 63 f0             	movslq %eax,%rsi
  801c5b:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801c5f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c62:	48 98                	cltq   
  801c64:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c68:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c6f:	00 
  801c70:	49 89 f1             	mov    %rsi,%r9
  801c73:	49 89 c8             	mov    %rcx,%r8
  801c76:	48 89 d1             	mov    %rdx,%rcx
  801c79:	48 89 c2             	mov    %rax,%rdx
  801c7c:	be 00 00 00 00       	mov    $0x0,%esi
  801c81:	bf 0c 00 00 00       	mov    $0xc,%edi
  801c86:	48 b8 95 18 80 00 00 	movabs $0x801895,%rax
  801c8d:	00 00 00 
  801c90:	ff d0                	callq  *%rax
  801c92:	c9                   	leaveq 
  801c93:	c3                   	retq   

0000000000801c94 <sys_ipc_recv>:
  801c94:	55                   	push   %rbp
  801c95:	48 89 e5             	mov    %rsp,%rbp
  801c98:	48 83 ec 10          	sub    $0x10,%rsp
  801c9c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801ca0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ca4:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801cab:	00 
  801cac:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801cb2:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801cb8:	b9 00 00 00 00       	mov    $0x0,%ecx
  801cbd:	48 89 c2             	mov    %rax,%rdx
  801cc0:	be 01 00 00 00       	mov    $0x1,%esi
  801cc5:	bf 0d 00 00 00       	mov    $0xd,%edi
  801cca:	48 b8 95 18 80 00 00 	movabs $0x801895,%rax
  801cd1:	00 00 00 
  801cd4:	ff d0                	callq  *%rax
  801cd6:	c9                   	leaveq 
  801cd7:	c3                   	retq   

0000000000801cd8 <sys_time_msec>:
  801cd8:	55                   	push   %rbp
  801cd9:	48 89 e5             	mov    %rsp,%rbp
  801cdc:	48 83 ec 10          	sub    $0x10,%rsp
  801ce0:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801ce7:	00 
  801ce8:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801cee:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801cf4:	b9 00 00 00 00       	mov    $0x0,%ecx
  801cf9:	ba 00 00 00 00       	mov    $0x0,%edx
  801cfe:	be 00 00 00 00       	mov    $0x0,%esi
  801d03:	bf 0e 00 00 00       	mov    $0xe,%edi
  801d08:	48 b8 95 18 80 00 00 	movabs $0x801895,%rax
  801d0f:	00 00 00 
  801d12:	ff d0                	callq  *%rax
  801d14:	c9                   	leaveq 
  801d15:	c3                   	retq   

0000000000801d16 <sys_net_transmit>:
  801d16:	55                   	push   %rbp
  801d17:	48 89 e5             	mov    %rsp,%rbp
  801d1a:	48 83 ec 20          	sub    $0x20,%rsp
  801d1e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d22:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801d25:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801d28:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d2c:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801d33:	00 
  801d34:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d3a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d40:	48 89 d1             	mov    %rdx,%rcx
  801d43:	48 89 c2             	mov    %rax,%rdx
  801d46:	be 00 00 00 00       	mov    $0x0,%esi
  801d4b:	bf 0f 00 00 00       	mov    $0xf,%edi
  801d50:	48 b8 95 18 80 00 00 	movabs $0x801895,%rax
  801d57:	00 00 00 
  801d5a:	ff d0                	callq  *%rax
  801d5c:	c9                   	leaveq 
  801d5d:	c3                   	retq   

0000000000801d5e <sys_net_receive>:
  801d5e:	55                   	push   %rbp
  801d5f:	48 89 e5             	mov    %rsp,%rbp
  801d62:	48 83 ec 20          	sub    $0x20,%rsp
  801d66:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d6a:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801d6d:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801d70:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d74:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801d7b:	00 
  801d7c:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d82:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d88:	48 89 d1             	mov    %rdx,%rcx
  801d8b:	48 89 c2             	mov    %rax,%rdx
  801d8e:	be 00 00 00 00       	mov    $0x0,%esi
  801d93:	bf 10 00 00 00       	mov    $0x10,%edi
  801d98:	48 b8 95 18 80 00 00 	movabs $0x801895,%rax
  801d9f:	00 00 00 
  801da2:	ff d0                	callq  *%rax
  801da4:	c9                   	leaveq 
  801da5:	c3                   	retq   

0000000000801da6 <sys_ept_map>:
  801da6:	55                   	push   %rbp
  801da7:	48 89 e5             	mov    %rsp,%rbp
  801daa:	48 83 ec 30          	sub    $0x30,%rsp
  801dae:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801db1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801db5:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801db8:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801dbc:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801dc0:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801dc3:	48 63 c8             	movslq %eax,%rcx
  801dc6:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801dca:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801dcd:	48 63 f0             	movslq %eax,%rsi
  801dd0:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801dd4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801dd7:	48 98                	cltq   
  801dd9:	48 89 0c 24          	mov    %rcx,(%rsp)
  801ddd:	49 89 f9             	mov    %rdi,%r9
  801de0:	49 89 f0             	mov    %rsi,%r8
  801de3:	48 89 d1             	mov    %rdx,%rcx
  801de6:	48 89 c2             	mov    %rax,%rdx
  801de9:	be 00 00 00 00       	mov    $0x0,%esi
  801dee:	bf 11 00 00 00       	mov    $0x11,%edi
  801df3:	48 b8 95 18 80 00 00 	movabs $0x801895,%rax
  801dfa:	00 00 00 
  801dfd:	ff d0                	callq  *%rax
  801dff:	c9                   	leaveq 
  801e00:	c3                   	retq   

0000000000801e01 <sys_env_mkguest>:
  801e01:	55                   	push   %rbp
  801e02:	48 89 e5             	mov    %rsp,%rbp
  801e05:	48 83 ec 20          	sub    $0x20,%rsp
  801e09:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801e0d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801e11:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801e15:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e19:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801e20:	00 
  801e21:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e27:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e2d:	48 89 d1             	mov    %rdx,%rcx
  801e30:	48 89 c2             	mov    %rax,%rdx
  801e33:	be 00 00 00 00       	mov    $0x0,%esi
  801e38:	bf 12 00 00 00       	mov    $0x12,%edi
  801e3d:	48 b8 95 18 80 00 00 	movabs $0x801895,%rax
  801e44:	00 00 00 
  801e47:	ff d0                	callq  *%rax
  801e49:	c9                   	leaveq 
  801e4a:	c3                   	retq   

0000000000801e4b <sys_vmx_list_vms>:
  801e4b:	55                   	push   %rbp
  801e4c:	48 89 e5             	mov    %rsp,%rbp
  801e4f:	48 83 ec 10          	sub    $0x10,%rsp
  801e53:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801e5a:	00 
  801e5b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e61:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e67:	b9 00 00 00 00       	mov    $0x0,%ecx
  801e6c:	ba 00 00 00 00       	mov    $0x0,%edx
  801e71:	be 00 00 00 00       	mov    $0x0,%esi
  801e76:	bf 13 00 00 00       	mov    $0x13,%edi
  801e7b:	48 b8 95 18 80 00 00 	movabs $0x801895,%rax
  801e82:	00 00 00 
  801e85:	ff d0                	callq  *%rax
  801e87:	c9                   	leaveq 
  801e88:	c3                   	retq   

0000000000801e89 <sys_vmx_sel_resume>:
  801e89:	55                   	push   %rbp
  801e8a:	48 89 e5             	mov    %rsp,%rbp
  801e8d:	48 83 ec 10          	sub    $0x10,%rsp
  801e91:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801e94:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e97:	48 98                	cltq   
  801e99:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801ea0:	00 
  801ea1:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ea7:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ead:	b9 00 00 00 00       	mov    $0x0,%ecx
  801eb2:	48 89 c2             	mov    %rax,%rdx
  801eb5:	be 00 00 00 00       	mov    $0x0,%esi
  801eba:	bf 14 00 00 00       	mov    $0x14,%edi
  801ebf:	48 b8 95 18 80 00 00 	movabs $0x801895,%rax
  801ec6:	00 00 00 
  801ec9:	ff d0                	callq  *%rax
  801ecb:	c9                   	leaveq 
  801ecc:	c3                   	retq   

0000000000801ecd <sys_vmx_get_vmdisk_number>:
  801ecd:	55                   	push   %rbp
  801ece:	48 89 e5             	mov    %rsp,%rbp
  801ed1:	48 83 ec 10          	sub    $0x10,%rsp
  801ed5:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801edc:	00 
  801edd:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ee3:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ee9:	b9 00 00 00 00       	mov    $0x0,%ecx
  801eee:	ba 00 00 00 00       	mov    $0x0,%edx
  801ef3:	be 00 00 00 00       	mov    $0x0,%esi
  801ef8:	bf 15 00 00 00       	mov    $0x15,%edi
  801efd:	48 b8 95 18 80 00 00 	movabs $0x801895,%rax
  801f04:	00 00 00 
  801f07:	ff d0                	callq  *%rax
  801f09:	c9                   	leaveq 
  801f0a:	c3                   	retq   

0000000000801f0b <sys_vmx_incr_vmdisk_number>:
  801f0b:	55                   	push   %rbp
  801f0c:	48 89 e5             	mov    %rsp,%rbp
  801f0f:	48 83 ec 10          	sub    $0x10,%rsp
  801f13:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801f1a:	00 
  801f1b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801f21:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801f27:	b9 00 00 00 00       	mov    $0x0,%ecx
  801f2c:	ba 00 00 00 00       	mov    $0x0,%edx
  801f31:	be 00 00 00 00       	mov    $0x0,%esi
  801f36:	bf 16 00 00 00       	mov    $0x16,%edi
  801f3b:	48 b8 95 18 80 00 00 	movabs $0x801895,%rax
  801f42:	00 00 00 
  801f45:	ff d0                	callq  *%rax
  801f47:	c9                   	leaveq 
  801f48:	c3                   	retq   

0000000000801f49 <pgfault>:
  801f49:	55                   	push   %rbp
  801f4a:	48 89 e5             	mov    %rsp,%rbp
  801f4d:	48 83 ec 30          	sub    $0x30,%rsp
  801f51:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801f55:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f59:	48 8b 00             	mov    (%rax),%rax
  801f5c:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  801f60:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f64:	48 8b 40 08          	mov    0x8(%rax),%rax
  801f68:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801f6b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801f6e:	83 e0 02             	and    $0x2,%eax
  801f71:	85 c0                	test   %eax,%eax
  801f73:	75 40                	jne    801fb5 <pgfault+0x6c>
  801f75:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f79:	48 8b 90 88 00 00 00 	mov    0x88(%rax),%rdx
  801f80:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801f84:	49 89 d0             	mov    %rdx,%r8
  801f87:	48 89 c1             	mov    %rax,%rcx
  801f8a:	48 ba 98 5b 80 00 00 	movabs $0x805b98,%rdx
  801f91:	00 00 00 
  801f94:	be 1f 00 00 00       	mov    $0x1f,%esi
  801f99:	48 bf b1 5b 80 00 00 	movabs $0x805bb1,%rdi
  801fa0:	00 00 00 
  801fa3:	b8 00 00 00 00       	mov    $0x0,%eax
  801fa8:	49 b9 4e 03 80 00 00 	movabs $0x80034e,%r9
  801faf:	00 00 00 
  801fb2:	41 ff d1             	callq  *%r9
  801fb5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801fb9:	48 c1 e8 0c          	shr    $0xc,%rax
  801fbd:	48 89 c2             	mov    %rax,%rdx
  801fc0:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801fc7:	01 00 00 
  801fca:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801fce:	25 07 08 00 00       	and    $0x807,%eax
  801fd3:	48 3d 05 08 00 00    	cmp    $0x805,%rax
  801fd9:	74 4e                	je     802029 <pgfault+0xe0>
  801fdb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801fdf:	48 c1 e8 0c          	shr    $0xc,%rax
  801fe3:	48 89 c2             	mov    %rax,%rdx
  801fe6:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801fed:	01 00 00 
  801ff0:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  801ff4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801ff8:	49 89 d0             	mov    %rdx,%r8
  801ffb:	48 89 c1             	mov    %rax,%rcx
  801ffe:	48 ba c0 5b 80 00 00 	movabs $0x805bc0,%rdx
  802005:	00 00 00 
  802008:	be 22 00 00 00       	mov    $0x22,%esi
  80200d:	48 bf b1 5b 80 00 00 	movabs $0x805bb1,%rdi
  802014:	00 00 00 
  802017:	b8 00 00 00 00       	mov    $0x0,%eax
  80201c:	49 b9 4e 03 80 00 00 	movabs $0x80034e,%r9
  802023:	00 00 00 
  802026:	41 ff d1             	callq  *%r9
  802029:	ba 07 00 00 00       	mov    $0x7,%edx
  80202e:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  802033:	bf 00 00 00 00       	mov    $0x0,%edi
  802038:	48 b8 6b 1a 80 00 00 	movabs $0x801a6b,%rax
  80203f:	00 00 00 
  802042:	ff d0                	callq  *%rax
  802044:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802047:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80204b:	79 30                	jns    80207d <pgfault+0x134>
  80204d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802050:	89 c1                	mov    %eax,%ecx
  802052:	48 ba eb 5b 80 00 00 	movabs $0x805beb,%rdx
  802059:	00 00 00 
  80205c:	be 30 00 00 00       	mov    $0x30,%esi
  802061:	48 bf b1 5b 80 00 00 	movabs $0x805bb1,%rdi
  802068:	00 00 00 
  80206b:	b8 00 00 00 00       	mov    $0x0,%eax
  802070:	49 b8 4e 03 80 00 00 	movabs $0x80034e,%r8
  802077:	00 00 00 
  80207a:	41 ff d0             	callq  *%r8
  80207d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802081:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802085:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802089:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  80208f:	ba 00 10 00 00       	mov    $0x1000,%edx
  802094:	48 89 c6             	mov    %rax,%rsi
  802097:	bf 00 f0 5f 00       	mov    $0x5ff000,%edi
  80209c:	48 b8 60 14 80 00 00 	movabs $0x801460,%rax
  8020a3:	00 00 00 
  8020a6:	ff d0                	callq  *%rax
  8020a8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8020ac:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8020b0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8020b4:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  8020ba:	41 b8 07 00 00 00    	mov    $0x7,%r8d
  8020c0:	48 89 c1             	mov    %rax,%rcx
  8020c3:	ba 00 00 00 00       	mov    $0x0,%edx
  8020c8:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  8020cd:	bf 00 00 00 00       	mov    $0x0,%edi
  8020d2:	48 b8 bb 1a 80 00 00 	movabs $0x801abb,%rax
  8020d9:	00 00 00 
  8020dc:	ff d0                	callq  *%rax
  8020de:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8020e1:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8020e5:	79 30                	jns    802117 <pgfault+0x1ce>
  8020e7:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8020ea:	89 c1                	mov    %eax,%ecx
  8020ec:	48 ba fe 5b 80 00 00 	movabs $0x805bfe,%rdx
  8020f3:	00 00 00 
  8020f6:	be 35 00 00 00       	mov    $0x35,%esi
  8020fb:	48 bf b1 5b 80 00 00 	movabs $0x805bb1,%rdi
  802102:	00 00 00 
  802105:	b8 00 00 00 00       	mov    $0x0,%eax
  80210a:	49 b8 4e 03 80 00 00 	movabs $0x80034e,%r8
  802111:	00 00 00 
  802114:	41 ff d0             	callq  *%r8
  802117:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  80211c:	bf 00 00 00 00       	mov    $0x0,%edi
  802121:	48 b8 16 1b 80 00 00 	movabs $0x801b16,%rax
  802128:	00 00 00 
  80212b:	ff d0                	callq  *%rax
  80212d:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802130:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802134:	79 30                	jns    802166 <pgfault+0x21d>
  802136:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802139:	89 c1                	mov    %eax,%ecx
  80213b:	48 ba 0f 5c 80 00 00 	movabs $0x805c0f,%rdx
  802142:	00 00 00 
  802145:	be 39 00 00 00       	mov    $0x39,%esi
  80214a:	48 bf b1 5b 80 00 00 	movabs $0x805bb1,%rdi
  802151:	00 00 00 
  802154:	b8 00 00 00 00       	mov    $0x0,%eax
  802159:	49 b8 4e 03 80 00 00 	movabs $0x80034e,%r8
  802160:	00 00 00 
  802163:	41 ff d0             	callq  *%r8
  802166:	c9                   	leaveq 
  802167:	c3                   	retq   

0000000000802168 <duppage>:
  802168:	55                   	push   %rbp
  802169:	48 89 e5             	mov    %rsp,%rbp
  80216c:	48 83 ec 30          	sub    $0x30,%rsp
  802170:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802173:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802176:	8b 45 d8             	mov    -0x28(%rbp),%eax
  802179:	c1 e0 0c             	shl    $0xc,%eax
  80217c:	89 c0                	mov    %eax,%eax
  80217e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802182:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802189:	01 00 00 
  80218c:	8b 55 d8             	mov    -0x28(%rbp),%edx
  80218f:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802193:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802197:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80219b:	25 02 08 00 00       	and    $0x802,%eax
  8021a0:	48 85 c0             	test   %rax,%rax
  8021a3:	74 0e                	je     8021b3 <duppage+0x4b>
  8021a5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8021a9:	25 00 04 00 00       	and    $0x400,%eax
  8021ae:	48 85 c0             	test   %rax,%rax
  8021b1:	74 70                	je     802223 <duppage+0xbb>
  8021b3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8021b7:	25 07 0e 00 00       	and    $0xe07,%eax
  8021bc:	89 c6                	mov    %eax,%esi
  8021be:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  8021c2:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8021c5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8021c9:	41 89 f0             	mov    %esi,%r8d
  8021cc:	48 89 c6             	mov    %rax,%rsi
  8021cf:	bf 00 00 00 00       	mov    $0x0,%edi
  8021d4:	48 b8 bb 1a 80 00 00 	movabs $0x801abb,%rax
  8021db:	00 00 00 
  8021de:	ff d0                	callq  *%rax
  8021e0:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8021e3:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8021e7:	79 30                	jns    802219 <duppage+0xb1>
  8021e9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8021ec:	89 c1                	mov    %eax,%ecx
  8021ee:	48 ba fe 5b 80 00 00 	movabs $0x805bfe,%rdx
  8021f5:	00 00 00 
  8021f8:	be 63 00 00 00       	mov    $0x63,%esi
  8021fd:	48 bf b1 5b 80 00 00 	movabs $0x805bb1,%rdi
  802204:	00 00 00 
  802207:	b8 00 00 00 00       	mov    $0x0,%eax
  80220c:	49 b8 4e 03 80 00 00 	movabs $0x80034e,%r8
  802213:	00 00 00 
  802216:	41 ff d0             	callq  *%r8
  802219:	b8 00 00 00 00       	mov    $0x0,%eax
  80221e:	e9 c4 00 00 00       	jmpq   8022e7 <duppage+0x17f>
  802223:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  802227:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80222a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80222e:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  802234:	48 89 c6             	mov    %rax,%rsi
  802237:	bf 00 00 00 00       	mov    $0x0,%edi
  80223c:	48 b8 bb 1a 80 00 00 	movabs $0x801abb,%rax
  802243:	00 00 00 
  802246:	ff d0                	callq  *%rax
  802248:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80224b:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80224f:	79 30                	jns    802281 <duppage+0x119>
  802251:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802254:	89 c1                	mov    %eax,%ecx
  802256:	48 ba fe 5b 80 00 00 	movabs $0x805bfe,%rdx
  80225d:	00 00 00 
  802260:	be 7e 00 00 00       	mov    $0x7e,%esi
  802265:	48 bf b1 5b 80 00 00 	movabs $0x805bb1,%rdi
  80226c:	00 00 00 
  80226f:	b8 00 00 00 00       	mov    $0x0,%eax
  802274:	49 b8 4e 03 80 00 00 	movabs $0x80034e,%r8
  80227b:	00 00 00 
  80227e:	41 ff d0             	callq  *%r8
  802281:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802285:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802289:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  80228f:	48 89 d1             	mov    %rdx,%rcx
  802292:	ba 00 00 00 00       	mov    $0x0,%edx
  802297:	48 89 c6             	mov    %rax,%rsi
  80229a:	bf 00 00 00 00       	mov    $0x0,%edi
  80229f:	48 b8 bb 1a 80 00 00 	movabs $0x801abb,%rax
  8022a6:	00 00 00 
  8022a9:	ff d0                	callq  *%rax
  8022ab:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8022ae:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8022b2:	79 30                	jns    8022e4 <duppage+0x17c>
  8022b4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8022b7:	89 c1                	mov    %eax,%ecx
  8022b9:	48 ba fe 5b 80 00 00 	movabs $0x805bfe,%rdx
  8022c0:	00 00 00 
  8022c3:	be 80 00 00 00       	mov    $0x80,%esi
  8022c8:	48 bf b1 5b 80 00 00 	movabs $0x805bb1,%rdi
  8022cf:	00 00 00 
  8022d2:	b8 00 00 00 00       	mov    $0x0,%eax
  8022d7:	49 b8 4e 03 80 00 00 	movabs $0x80034e,%r8
  8022de:	00 00 00 
  8022e1:	41 ff d0             	callq  *%r8
  8022e4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8022e7:	c9                   	leaveq 
  8022e8:	c3                   	retq   

00000000008022e9 <fork>:
  8022e9:	55                   	push   %rbp
  8022ea:	48 89 e5             	mov    %rsp,%rbp
  8022ed:	48 83 ec 20          	sub    $0x20,%rsp
  8022f1:	48 bf 49 1f 80 00 00 	movabs $0x801f49,%rdi
  8022f8:	00 00 00 
  8022fb:	48 b8 10 52 80 00 00 	movabs $0x805210,%rax
  802302:	00 00 00 
  802305:	ff d0                	callq  *%rax
  802307:	b8 07 00 00 00       	mov    $0x7,%eax
  80230c:	cd 30                	int    $0x30
  80230e:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802311:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802314:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802317:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80231b:	79 08                	jns    802325 <fork+0x3c>
  80231d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802320:	e9 09 02 00 00       	jmpq   80252e <fork+0x245>
  802325:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802329:	75 3e                	jne    802369 <fork+0x80>
  80232b:	48 b8 ef 19 80 00 00 	movabs $0x8019ef,%rax
  802332:	00 00 00 
  802335:	ff d0                	callq  *%rax
  802337:	25 ff 03 00 00       	and    $0x3ff,%eax
  80233c:	48 98                	cltq   
  80233e:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  802345:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80234c:	00 00 00 
  80234f:	48 01 c2             	add    %rax,%rdx
  802352:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  802359:	00 00 00 
  80235c:	48 89 10             	mov    %rdx,(%rax)
  80235f:	b8 00 00 00 00       	mov    $0x0,%eax
  802364:	e9 c5 01 00 00       	jmpq   80252e <fork+0x245>
  802369:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802370:	e9 a4 00 00 00       	jmpq   802419 <fork+0x130>
  802375:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802378:	c1 f8 12             	sar    $0x12,%eax
  80237b:	89 c2                	mov    %eax,%edx
  80237d:	48 b8 00 00 40 80 00 	movabs $0x10080400000,%rax
  802384:	01 00 00 
  802387:	48 63 d2             	movslq %edx,%rdx
  80238a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80238e:	83 e0 01             	and    $0x1,%eax
  802391:	48 85 c0             	test   %rax,%rax
  802394:	74 21                	je     8023b7 <fork+0xce>
  802396:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802399:	c1 f8 09             	sar    $0x9,%eax
  80239c:	89 c2                	mov    %eax,%edx
  80239e:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8023a5:	01 00 00 
  8023a8:	48 63 d2             	movslq %edx,%rdx
  8023ab:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8023af:	83 e0 01             	and    $0x1,%eax
  8023b2:	48 85 c0             	test   %rax,%rax
  8023b5:	75 09                	jne    8023c0 <fork+0xd7>
  8023b7:	81 45 fc 00 02 00 00 	addl   $0x200,-0x4(%rbp)
  8023be:	eb 59                	jmp    802419 <fork+0x130>
  8023c0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023c3:	05 00 02 00 00       	add    $0x200,%eax
  8023c8:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8023cb:	eb 44                	jmp    802411 <fork+0x128>
  8023cd:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8023d4:	01 00 00 
  8023d7:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8023da:	48 63 d2             	movslq %edx,%rdx
  8023dd:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8023e1:	83 e0 05             	and    $0x5,%eax
  8023e4:	48 83 f8 05          	cmp    $0x5,%rax
  8023e8:	74 02                	je     8023ec <fork+0x103>
  8023ea:	eb 21                	jmp    80240d <fork+0x124>
  8023ec:	81 7d fc ff f7 0e 00 	cmpl   $0xef7ff,-0x4(%rbp)
  8023f3:	75 02                	jne    8023f7 <fork+0x10e>
  8023f5:	eb 16                	jmp    80240d <fork+0x124>
  8023f7:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8023fa:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8023fd:	89 d6                	mov    %edx,%esi
  8023ff:	89 c7                	mov    %eax,%edi
  802401:	48 b8 68 21 80 00 00 	movabs $0x802168,%rax
  802408:	00 00 00 
  80240b:	ff d0                	callq  *%rax
  80240d:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802411:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802414:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  802417:	7c b4                	jl     8023cd <fork+0xe4>
  802419:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80241c:	3d ff 07 00 08       	cmp    $0x80007ff,%eax
  802421:	0f 86 4e ff ff ff    	jbe    802375 <fork+0x8c>
  802427:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80242a:	ba 07 00 00 00       	mov    $0x7,%edx
  80242f:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  802434:	89 c7                	mov    %eax,%edi
  802436:	48 b8 6b 1a 80 00 00 	movabs $0x801a6b,%rax
  80243d:	00 00 00 
  802440:	ff d0                	callq  *%rax
  802442:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802445:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802449:	79 30                	jns    80247b <fork+0x192>
  80244b:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80244e:	89 c1                	mov    %eax,%ecx
  802450:	48 ba 28 5c 80 00 00 	movabs $0x805c28,%rdx
  802457:	00 00 00 
  80245a:	be bc 00 00 00       	mov    $0xbc,%esi
  80245f:	48 bf b1 5b 80 00 00 	movabs $0x805bb1,%rdi
  802466:	00 00 00 
  802469:	b8 00 00 00 00       	mov    $0x0,%eax
  80246e:	49 b8 4e 03 80 00 00 	movabs $0x80034e,%r8
  802475:	00 00 00 
  802478:	41 ff d0             	callq  *%r8
  80247b:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  802482:	00 00 00 
  802485:	48 8b 00             	mov    (%rax),%rax
  802488:	48 8b 90 f0 00 00 00 	mov    0xf0(%rax),%rdx
  80248f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802492:	48 89 d6             	mov    %rdx,%rsi
  802495:	89 c7                	mov    %eax,%edi
  802497:	48 b8 f5 1b 80 00 00 	movabs $0x801bf5,%rax
  80249e:	00 00 00 
  8024a1:	ff d0                	callq  *%rax
  8024a3:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8024a6:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8024aa:	79 30                	jns    8024dc <fork+0x1f3>
  8024ac:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8024af:	89 c1                	mov    %eax,%ecx
  8024b1:	48 ba 48 5c 80 00 00 	movabs $0x805c48,%rdx
  8024b8:	00 00 00 
  8024bb:	be c0 00 00 00       	mov    $0xc0,%esi
  8024c0:	48 bf b1 5b 80 00 00 	movabs $0x805bb1,%rdi
  8024c7:	00 00 00 
  8024ca:	b8 00 00 00 00       	mov    $0x0,%eax
  8024cf:	49 b8 4e 03 80 00 00 	movabs $0x80034e,%r8
  8024d6:	00 00 00 
  8024d9:	41 ff d0             	callq  *%r8
  8024dc:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8024df:	be 02 00 00 00       	mov    $0x2,%esi
  8024e4:	89 c7                	mov    %eax,%edi
  8024e6:	48 b8 60 1b 80 00 00 	movabs $0x801b60,%rax
  8024ed:	00 00 00 
  8024f0:	ff d0                	callq  *%rax
  8024f2:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8024f5:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8024f9:	79 30                	jns    80252b <fork+0x242>
  8024fb:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8024fe:	89 c1                	mov    %eax,%ecx
  802500:	48 ba 67 5c 80 00 00 	movabs $0x805c67,%rdx
  802507:	00 00 00 
  80250a:	be c5 00 00 00       	mov    $0xc5,%esi
  80250f:	48 bf b1 5b 80 00 00 	movabs $0x805bb1,%rdi
  802516:	00 00 00 
  802519:	b8 00 00 00 00       	mov    $0x0,%eax
  80251e:	49 b8 4e 03 80 00 00 	movabs $0x80034e,%r8
  802525:	00 00 00 
  802528:	41 ff d0             	callq  *%r8
  80252b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80252e:	c9                   	leaveq 
  80252f:	c3                   	retq   

0000000000802530 <sfork>:
  802530:	55                   	push   %rbp
  802531:	48 89 e5             	mov    %rsp,%rbp
  802534:	48 ba 7e 5c 80 00 00 	movabs $0x805c7e,%rdx
  80253b:	00 00 00 
  80253e:	be d2 00 00 00       	mov    $0xd2,%esi
  802543:	48 bf b1 5b 80 00 00 	movabs $0x805bb1,%rdi
  80254a:	00 00 00 
  80254d:	b8 00 00 00 00       	mov    $0x0,%eax
  802552:	48 b9 4e 03 80 00 00 	movabs $0x80034e,%rcx
  802559:	00 00 00 
  80255c:	ff d1                	callq  *%rcx

000000000080255e <fd2num>:
  80255e:	55                   	push   %rbp
  80255f:	48 89 e5             	mov    %rsp,%rbp
  802562:	48 83 ec 08          	sub    $0x8,%rsp
  802566:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80256a:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80256e:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  802575:	ff ff ff 
  802578:	48 01 d0             	add    %rdx,%rax
  80257b:	48 c1 e8 0c          	shr    $0xc,%rax
  80257f:	c9                   	leaveq 
  802580:	c3                   	retq   

0000000000802581 <fd2data>:
  802581:	55                   	push   %rbp
  802582:	48 89 e5             	mov    %rsp,%rbp
  802585:	48 83 ec 08          	sub    $0x8,%rsp
  802589:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80258d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802591:	48 89 c7             	mov    %rax,%rdi
  802594:	48 b8 5e 25 80 00 00 	movabs $0x80255e,%rax
  80259b:	00 00 00 
  80259e:	ff d0                	callq  *%rax
  8025a0:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  8025a6:	48 c1 e0 0c          	shl    $0xc,%rax
  8025aa:	c9                   	leaveq 
  8025ab:	c3                   	retq   

00000000008025ac <fd_alloc>:
  8025ac:	55                   	push   %rbp
  8025ad:	48 89 e5             	mov    %rsp,%rbp
  8025b0:	48 83 ec 18          	sub    $0x18,%rsp
  8025b4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8025b8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8025bf:	eb 6b                	jmp    80262c <fd_alloc+0x80>
  8025c1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8025c4:	48 98                	cltq   
  8025c6:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  8025cc:	48 c1 e0 0c          	shl    $0xc,%rax
  8025d0:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8025d4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8025d8:	48 c1 e8 15          	shr    $0x15,%rax
  8025dc:	48 89 c2             	mov    %rax,%rdx
  8025df:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8025e6:	01 00 00 
  8025e9:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8025ed:	83 e0 01             	and    $0x1,%eax
  8025f0:	48 85 c0             	test   %rax,%rax
  8025f3:	74 21                	je     802616 <fd_alloc+0x6a>
  8025f5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8025f9:	48 c1 e8 0c          	shr    $0xc,%rax
  8025fd:	48 89 c2             	mov    %rax,%rdx
  802600:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802607:	01 00 00 
  80260a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80260e:	83 e0 01             	and    $0x1,%eax
  802611:	48 85 c0             	test   %rax,%rax
  802614:	75 12                	jne    802628 <fd_alloc+0x7c>
  802616:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80261a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80261e:	48 89 10             	mov    %rdx,(%rax)
  802621:	b8 00 00 00 00       	mov    $0x0,%eax
  802626:	eb 1a                	jmp    802642 <fd_alloc+0x96>
  802628:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80262c:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802630:	7e 8f                	jle    8025c1 <fd_alloc+0x15>
  802632:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802636:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  80263d:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  802642:	c9                   	leaveq 
  802643:	c3                   	retq   

0000000000802644 <fd_lookup>:
  802644:	55                   	push   %rbp
  802645:	48 89 e5             	mov    %rsp,%rbp
  802648:	48 83 ec 20          	sub    $0x20,%rsp
  80264c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80264f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802653:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802657:	78 06                	js     80265f <fd_lookup+0x1b>
  802659:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  80265d:	7e 07                	jle    802666 <fd_lookup+0x22>
  80265f:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802664:	eb 6c                	jmp    8026d2 <fd_lookup+0x8e>
  802666:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802669:	48 98                	cltq   
  80266b:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802671:	48 c1 e0 0c          	shl    $0xc,%rax
  802675:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802679:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80267d:	48 c1 e8 15          	shr    $0x15,%rax
  802681:	48 89 c2             	mov    %rax,%rdx
  802684:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  80268b:	01 00 00 
  80268e:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802692:	83 e0 01             	and    $0x1,%eax
  802695:	48 85 c0             	test   %rax,%rax
  802698:	74 21                	je     8026bb <fd_lookup+0x77>
  80269a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80269e:	48 c1 e8 0c          	shr    $0xc,%rax
  8026a2:	48 89 c2             	mov    %rax,%rdx
  8026a5:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8026ac:	01 00 00 
  8026af:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8026b3:	83 e0 01             	and    $0x1,%eax
  8026b6:	48 85 c0             	test   %rax,%rax
  8026b9:	75 07                	jne    8026c2 <fd_lookup+0x7e>
  8026bb:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8026c0:	eb 10                	jmp    8026d2 <fd_lookup+0x8e>
  8026c2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8026c6:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8026ca:	48 89 10             	mov    %rdx,(%rax)
  8026cd:	b8 00 00 00 00       	mov    $0x0,%eax
  8026d2:	c9                   	leaveq 
  8026d3:	c3                   	retq   

00000000008026d4 <fd_close>:
  8026d4:	55                   	push   %rbp
  8026d5:	48 89 e5             	mov    %rsp,%rbp
  8026d8:	48 83 ec 30          	sub    $0x30,%rsp
  8026dc:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8026e0:	89 f0                	mov    %esi,%eax
  8026e2:	88 45 d4             	mov    %al,-0x2c(%rbp)
  8026e5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8026e9:	48 89 c7             	mov    %rax,%rdi
  8026ec:	48 b8 5e 25 80 00 00 	movabs $0x80255e,%rax
  8026f3:	00 00 00 
  8026f6:	ff d0                	callq  *%rax
  8026f8:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8026fc:	48 89 d6             	mov    %rdx,%rsi
  8026ff:	89 c7                	mov    %eax,%edi
  802701:	48 b8 44 26 80 00 00 	movabs $0x802644,%rax
  802708:	00 00 00 
  80270b:	ff d0                	callq  *%rax
  80270d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802710:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802714:	78 0a                	js     802720 <fd_close+0x4c>
  802716:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80271a:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  80271e:	74 12                	je     802732 <fd_close+0x5e>
  802720:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  802724:	74 05                	je     80272b <fd_close+0x57>
  802726:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802729:	eb 05                	jmp    802730 <fd_close+0x5c>
  80272b:	b8 00 00 00 00       	mov    $0x0,%eax
  802730:	eb 69                	jmp    80279b <fd_close+0xc7>
  802732:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802736:	8b 00                	mov    (%rax),%eax
  802738:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80273c:	48 89 d6             	mov    %rdx,%rsi
  80273f:	89 c7                	mov    %eax,%edi
  802741:	48 b8 9d 27 80 00 00 	movabs $0x80279d,%rax
  802748:	00 00 00 
  80274b:	ff d0                	callq  *%rax
  80274d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802750:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802754:	78 2a                	js     802780 <fd_close+0xac>
  802756:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80275a:	48 8b 40 20          	mov    0x20(%rax),%rax
  80275e:	48 85 c0             	test   %rax,%rax
  802761:	74 16                	je     802779 <fd_close+0xa5>
  802763:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802767:	48 8b 40 20          	mov    0x20(%rax),%rax
  80276b:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80276f:	48 89 d7             	mov    %rdx,%rdi
  802772:	ff d0                	callq  *%rax
  802774:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802777:	eb 07                	jmp    802780 <fd_close+0xac>
  802779:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802780:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802784:	48 89 c6             	mov    %rax,%rsi
  802787:	bf 00 00 00 00       	mov    $0x0,%edi
  80278c:	48 b8 16 1b 80 00 00 	movabs $0x801b16,%rax
  802793:	00 00 00 
  802796:	ff d0                	callq  *%rax
  802798:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80279b:	c9                   	leaveq 
  80279c:	c3                   	retq   

000000000080279d <dev_lookup>:
  80279d:	55                   	push   %rbp
  80279e:	48 89 e5             	mov    %rsp,%rbp
  8027a1:	48 83 ec 20          	sub    $0x20,%rsp
  8027a5:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8027a8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8027ac:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8027b3:	eb 41                	jmp    8027f6 <dev_lookup+0x59>
  8027b5:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  8027bc:	00 00 00 
  8027bf:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8027c2:	48 63 d2             	movslq %edx,%rdx
  8027c5:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8027c9:	8b 00                	mov    (%rax),%eax
  8027cb:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  8027ce:	75 22                	jne    8027f2 <dev_lookup+0x55>
  8027d0:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  8027d7:	00 00 00 
  8027da:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8027dd:	48 63 d2             	movslq %edx,%rdx
  8027e0:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  8027e4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8027e8:	48 89 10             	mov    %rdx,(%rax)
  8027eb:	b8 00 00 00 00       	mov    $0x0,%eax
  8027f0:	eb 60                	jmp    802852 <dev_lookup+0xb5>
  8027f2:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8027f6:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  8027fd:	00 00 00 
  802800:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802803:	48 63 d2             	movslq %edx,%rdx
  802806:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80280a:	48 85 c0             	test   %rax,%rax
  80280d:	75 a6                	jne    8027b5 <dev_lookup+0x18>
  80280f:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  802816:	00 00 00 
  802819:	48 8b 00             	mov    (%rax),%rax
  80281c:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802822:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802825:	89 c6                	mov    %eax,%esi
  802827:	48 bf 98 5c 80 00 00 	movabs $0x805c98,%rdi
  80282e:	00 00 00 
  802831:	b8 00 00 00 00       	mov    $0x0,%eax
  802836:	48 b9 87 05 80 00 00 	movabs $0x800587,%rcx
  80283d:	00 00 00 
  802840:	ff d1                	callq  *%rcx
  802842:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802846:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  80284d:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802852:	c9                   	leaveq 
  802853:	c3                   	retq   

0000000000802854 <close>:
  802854:	55                   	push   %rbp
  802855:	48 89 e5             	mov    %rsp,%rbp
  802858:	48 83 ec 20          	sub    $0x20,%rsp
  80285c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80285f:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802863:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802866:	48 89 d6             	mov    %rdx,%rsi
  802869:	89 c7                	mov    %eax,%edi
  80286b:	48 b8 44 26 80 00 00 	movabs $0x802644,%rax
  802872:	00 00 00 
  802875:	ff d0                	callq  *%rax
  802877:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80287a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80287e:	79 05                	jns    802885 <close+0x31>
  802880:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802883:	eb 18                	jmp    80289d <close+0x49>
  802885:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802889:	be 01 00 00 00       	mov    $0x1,%esi
  80288e:	48 89 c7             	mov    %rax,%rdi
  802891:	48 b8 d4 26 80 00 00 	movabs $0x8026d4,%rax
  802898:	00 00 00 
  80289b:	ff d0                	callq  *%rax
  80289d:	c9                   	leaveq 
  80289e:	c3                   	retq   

000000000080289f <close_all>:
  80289f:	55                   	push   %rbp
  8028a0:	48 89 e5             	mov    %rsp,%rbp
  8028a3:	48 83 ec 10          	sub    $0x10,%rsp
  8028a7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8028ae:	eb 15                	jmp    8028c5 <close_all+0x26>
  8028b0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8028b3:	89 c7                	mov    %eax,%edi
  8028b5:	48 b8 54 28 80 00 00 	movabs $0x802854,%rax
  8028bc:	00 00 00 
  8028bf:	ff d0                	callq  *%rax
  8028c1:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8028c5:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  8028c9:	7e e5                	jle    8028b0 <close_all+0x11>
  8028cb:	c9                   	leaveq 
  8028cc:	c3                   	retq   

00000000008028cd <dup>:
  8028cd:	55                   	push   %rbp
  8028ce:	48 89 e5             	mov    %rsp,%rbp
  8028d1:	48 83 ec 40          	sub    $0x40,%rsp
  8028d5:	89 7d cc             	mov    %edi,-0x34(%rbp)
  8028d8:	89 75 c8             	mov    %esi,-0x38(%rbp)
  8028db:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  8028df:	8b 45 cc             	mov    -0x34(%rbp),%eax
  8028e2:	48 89 d6             	mov    %rdx,%rsi
  8028e5:	89 c7                	mov    %eax,%edi
  8028e7:	48 b8 44 26 80 00 00 	movabs $0x802644,%rax
  8028ee:	00 00 00 
  8028f1:	ff d0                	callq  *%rax
  8028f3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8028f6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8028fa:	79 08                	jns    802904 <dup+0x37>
  8028fc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8028ff:	e9 70 01 00 00       	jmpq   802a74 <dup+0x1a7>
  802904:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802907:	89 c7                	mov    %eax,%edi
  802909:	48 b8 54 28 80 00 00 	movabs $0x802854,%rax
  802910:	00 00 00 
  802913:	ff d0                	callq  *%rax
  802915:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802918:	48 98                	cltq   
  80291a:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802920:	48 c1 e0 0c          	shl    $0xc,%rax
  802924:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802928:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80292c:	48 89 c7             	mov    %rax,%rdi
  80292f:	48 b8 81 25 80 00 00 	movabs $0x802581,%rax
  802936:	00 00 00 
  802939:	ff d0                	callq  *%rax
  80293b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80293f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802943:	48 89 c7             	mov    %rax,%rdi
  802946:	48 b8 81 25 80 00 00 	movabs $0x802581,%rax
  80294d:	00 00 00 
  802950:	ff d0                	callq  *%rax
  802952:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802956:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80295a:	48 c1 e8 15          	shr    $0x15,%rax
  80295e:	48 89 c2             	mov    %rax,%rdx
  802961:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802968:	01 00 00 
  80296b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80296f:	83 e0 01             	and    $0x1,%eax
  802972:	48 85 c0             	test   %rax,%rax
  802975:	74 73                	je     8029ea <dup+0x11d>
  802977:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80297b:	48 c1 e8 0c          	shr    $0xc,%rax
  80297f:	48 89 c2             	mov    %rax,%rdx
  802982:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802989:	01 00 00 
  80298c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802990:	83 e0 01             	and    $0x1,%eax
  802993:	48 85 c0             	test   %rax,%rax
  802996:	74 52                	je     8029ea <dup+0x11d>
  802998:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80299c:	48 c1 e8 0c          	shr    $0xc,%rax
  8029a0:	48 89 c2             	mov    %rax,%rdx
  8029a3:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8029aa:	01 00 00 
  8029ad:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8029b1:	25 07 0e 00 00       	and    $0xe07,%eax
  8029b6:	89 c1                	mov    %eax,%ecx
  8029b8:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8029bc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8029c0:	41 89 c8             	mov    %ecx,%r8d
  8029c3:	48 89 d1             	mov    %rdx,%rcx
  8029c6:	ba 00 00 00 00       	mov    $0x0,%edx
  8029cb:	48 89 c6             	mov    %rax,%rsi
  8029ce:	bf 00 00 00 00       	mov    $0x0,%edi
  8029d3:	48 b8 bb 1a 80 00 00 	movabs $0x801abb,%rax
  8029da:	00 00 00 
  8029dd:	ff d0                	callq  *%rax
  8029df:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8029e2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8029e6:	79 02                	jns    8029ea <dup+0x11d>
  8029e8:	eb 57                	jmp    802a41 <dup+0x174>
  8029ea:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8029ee:	48 c1 e8 0c          	shr    $0xc,%rax
  8029f2:	48 89 c2             	mov    %rax,%rdx
  8029f5:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8029fc:	01 00 00 
  8029ff:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802a03:	25 07 0e 00 00       	and    $0xe07,%eax
  802a08:	89 c1                	mov    %eax,%ecx
  802a0a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802a0e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802a12:	41 89 c8             	mov    %ecx,%r8d
  802a15:	48 89 d1             	mov    %rdx,%rcx
  802a18:	ba 00 00 00 00       	mov    $0x0,%edx
  802a1d:	48 89 c6             	mov    %rax,%rsi
  802a20:	bf 00 00 00 00       	mov    $0x0,%edi
  802a25:	48 b8 bb 1a 80 00 00 	movabs $0x801abb,%rax
  802a2c:	00 00 00 
  802a2f:	ff d0                	callq  *%rax
  802a31:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802a34:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802a38:	79 02                	jns    802a3c <dup+0x16f>
  802a3a:	eb 05                	jmp    802a41 <dup+0x174>
  802a3c:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802a3f:	eb 33                	jmp    802a74 <dup+0x1a7>
  802a41:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802a45:	48 89 c6             	mov    %rax,%rsi
  802a48:	bf 00 00 00 00       	mov    $0x0,%edi
  802a4d:	48 b8 16 1b 80 00 00 	movabs $0x801b16,%rax
  802a54:	00 00 00 
  802a57:	ff d0                	callq  *%rax
  802a59:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802a5d:	48 89 c6             	mov    %rax,%rsi
  802a60:	bf 00 00 00 00       	mov    $0x0,%edi
  802a65:	48 b8 16 1b 80 00 00 	movabs $0x801b16,%rax
  802a6c:	00 00 00 
  802a6f:	ff d0                	callq  *%rax
  802a71:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a74:	c9                   	leaveq 
  802a75:	c3                   	retq   

0000000000802a76 <read>:
  802a76:	55                   	push   %rbp
  802a77:	48 89 e5             	mov    %rsp,%rbp
  802a7a:	48 83 ec 40          	sub    $0x40,%rsp
  802a7e:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802a81:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802a85:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802a89:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802a8d:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802a90:	48 89 d6             	mov    %rdx,%rsi
  802a93:	89 c7                	mov    %eax,%edi
  802a95:	48 b8 44 26 80 00 00 	movabs $0x802644,%rax
  802a9c:	00 00 00 
  802a9f:	ff d0                	callq  *%rax
  802aa1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802aa4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802aa8:	78 24                	js     802ace <read+0x58>
  802aaa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802aae:	8b 00                	mov    (%rax),%eax
  802ab0:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802ab4:	48 89 d6             	mov    %rdx,%rsi
  802ab7:	89 c7                	mov    %eax,%edi
  802ab9:	48 b8 9d 27 80 00 00 	movabs $0x80279d,%rax
  802ac0:	00 00 00 
  802ac3:	ff d0                	callq  *%rax
  802ac5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ac8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802acc:	79 05                	jns    802ad3 <read+0x5d>
  802ace:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ad1:	eb 76                	jmp    802b49 <read+0xd3>
  802ad3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ad7:	8b 40 08             	mov    0x8(%rax),%eax
  802ada:	83 e0 03             	and    $0x3,%eax
  802add:	83 f8 01             	cmp    $0x1,%eax
  802ae0:	75 3a                	jne    802b1c <read+0xa6>
  802ae2:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  802ae9:	00 00 00 
  802aec:	48 8b 00             	mov    (%rax),%rax
  802aef:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802af5:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802af8:	89 c6                	mov    %eax,%esi
  802afa:	48 bf b7 5c 80 00 00 	movabs $0x805cb7,%rdi
  802b01:	00 00 00 
  802b04:	b8 00 00 00 00       	mov    $0x0,%eax
  802b09:	48 b9 87 05 80 00 00 	movabs $0x800587,%rcx
  802b10:	00 00 00 
  802b13:	ff d1                	callq  *%rcx
  802b15:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802b1a:	eb 2d                	jmp    802b49 <read+0xd3>
  802b1c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802b20:	48 8b 40 10          	mov    0x10(%rax),%rax
  802b24:	48 85 c0             	test   %rax,%rax
  802b27:	75 07                	jne    802b30 <read+0xba>
  802b29:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802b2e:	eb 19                	jmp    802b49 <read+0xd3>
  802b30:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802b34:	48 8b 40 10          	mov    0x10(%rax),%rax
  802b38:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802b3c:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802b40:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802b44:	48 89 cf             	mov    %rcx,%rdi
  802b47:	ff d0                	callq  *%rax
  802b49:	c9                   	leaveq 
  802b4a:	c3                   	retq   

0000000000802b4b <readn>:
  802b4b:	55                   	push   %rbp
  802b4c:	48 89 e5             	mov    %rsp,%rbp
  802b4f:	48 83 ec 30          	sub    $0x30,%rsp
  802b53:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802b56:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802b5a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802b5e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802b65:	eb 49                	jmp    802bb0 <readn+0x65>
  802b67:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b6a:	48 98                	cltq   
  802b6c:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802b70:	48 29 c2             	sub    %rax,%rdx
  802b73:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b76:	48 63 c8             	movslq %eax,%rcx
  802b79:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802b7d:	48 01 c1             	add    %rax,%rcx
  802b80:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802b83:	48 89 ce             	mov    %rcx,%rsi
  802b86:	89 c7                	mov    %eax,%edi
  802b88:	48 b8 76 2a 80 00 00 	movabs $0x802a76,%rax
  802b8f:	00 00 00 
  802b92:	ff d0                	callq  *%rax
  802b94:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802b97:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802b9b:	79 05                	jns    802ba2 <readn+0x57>
  802b9d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802ba0:	eb 1c                	jmp    802bbe <readn+0x73>
  802ba2:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802ba6:	75 02                	jne    802baa <readn+0x5f>
  802ba8:	eb 11                	jmp    802bbb <readn+0x70>
  802baa:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802bad:	01 45 fc             	add    %eax,-0x4(%rbp)
  802bb0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802bb3:	48 98                	cltq   
  802bb5:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802bb9:	72 ac                	jb     802b67 <readn+0x1c>
  802bbb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802bbe:	c9                   	leaveq 
  802bbf:	c3                   	retq   

0000000000802bc0 <write>:
  802bc0:	55                   	push   %rbp
  802bc1:	48 89 e5             	mov    %rsp,%rbp
  802bc4:	48 83 ec 40          	sub    $0x40,%rsp
  802bc8:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802bcb:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802bcf:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802bd3:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802bd7:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802bda:	48 89 d6             	mov    %rdx,%rsi
  802bdd:	89 c7                	mov    %eax,%edi
  802bdf:	48 b8 44 26 80 00 00 	movabs $0x802644,%rax
  802be6:	00 00 00 
  802be9:	ff d0                	callq  *%rax
  802beb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802bee:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802bf2:	78 24                	js     802c18 <write+0x58>
  802bf4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802bf8:	8b 00                	mov    (%rax),%eax
  802bfa:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802bfe:	48 89 d6             	mov    %rdx,%rsi
  802c01:	89 c7                	mov    %eax,%edi
  802c03:	48 b8 9d 27 80 00 00 	movabs $0x80279d,%rax
  802c0a:	00 00 00 
  802c0d:	ff d0                	callq  *%rax
  802c0f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c12:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c16:	79 05                	jns    802c1d <write+0x5d>
  802c18:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c1b:	eb 75                	jmp    802c92 <write+0xd2>
  802c1d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c21:	8b 40 08             	mov    0x8(%rax),%eax
  802c24:	83 e0 03             	and    $0x3,%eax
  802c27:	85 c0                	test   %eax,%eax
  802c29:	75 3a                	jne    802c65 <write+0xa5>
  802c2b:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  802c32:	00 00 00 
  802c35:	48 8b 00             	mov    (%rax),%rax
  802c38:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802c3e:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802c41:	89 c6                	mov    %eax,%esi
  802c43:	48 bf d3 5c 80 00 00 	movabs $0x805cd3,%rdi
  802c4a:	00 00 00 
  802c4d:	b8 00 00 00 00       	mov    $0x0,%eax
  802c52:	48 b9 87 05 80 00 00 	movabs $0x800587,%rcx
  802c59:	00 00 00 
  802c5c:	ff d1                	callq  *%rcx
  802c5e:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802c63:	eb 2d                	jmp    802c92 <write+0xd2>
  802c65:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802c69:	48 8b 40 18          	mov    0x18(%rax),%rax
  802c6d:	48 85 c0             	test   %rax,%rax
  802c70:	75 07                	jne    802c79 <write+0xb9>
  802c72:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802c77:	eb 19                	jmp    802c92 <write+0xd2>
  802c79:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802c7d:	48 8b 40 18          	mov    0x18(%rax),%rax
  802c81:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802c85:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802c89:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802c8d:	48 89 cf             	mov    %rcx,%rdi
  802c90:	ff d0                	callq  *%rax
  802c92:	c9                   	leaveq 
  802c93:	c3                   	retq   

0000000000802c94 <seek>:
  802c94:	55                   	push   %rbp
  802c95:	48 89 e5             	mov    %rsp,%rbp
  802c98:	48 83 ec 18          	sub    $0x18,%rsp
  802c9c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802c9f:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802ca2:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802ca6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802ca9:	48 89 d6             	mov    %rdx,%rsi
  802cac:	89 c7                	mov    %eax,%edi
  802cae:	48 b8 44 26 80 00 00 	movabs $0x802644,%rax
  802cb5:	00 00 00 
  802cb8:	ff d0                	callq  *%rax
  802cba:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802cbd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802cc1:	79 05                	jns    802cc8 <seek+0x34>
  802cc3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802cc6:	eb 0f                	jmp    802cd7 <seek+0x43>
  802cc8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ccc:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802ccf:	89 50 04             	mov    %edx,0x4(%rax)
  802cd2:	b8 00 00 00 00       	mov    $0x0,%eax
  802cd7:	c9                   	leaveq 
  802cd8:	c3                   	retq   

0000000000802cd9 <ftruncate>:
  802cd9:	55                   	push   %rbp
  802cda:	48 89 e5             	mov    %rsp,%rbp
  802cdd:	48 83 ec 30          	sub    $0x30,%rsp
  802ce1:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802ce4:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802ce7:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802ceb:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802cee:	48 89 d6             	mov    %rdx,%rsi
  802cf1:	89 c7                	mov    %eax,%edi
  802cf3:	48 b8 44 26 80 00 00 	movabs $0x802644,%rax
  802cfa:	00 00 00 
  802cfd:	ff d0                	callq  *%rax
  802cff:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d02:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d06:	78 24                	js     802d2c <ftruncate+0x53>
  802d08:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d0c:	8b 00                	mov    (%rax),%eax
  802d0e:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802d12:	48 89 d6             	mov    %rdx,%rsi
  802d15:	89 c7                	mov    %eax,%edi
  802d17:	48 b8 9d 27 80 00 00 	movabs $0x80279d,%rax
  802d1e:	00 00 00 
  802d21:	ff d0                	callq  *%rax
  802d23:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d26:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d2a:	79 05                	jns    802d31 <ftruncate+0x58>
  802d2c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d2f:	eb 72                	jmp    802da3 <ftruncate+0xca>
  802d31:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d35:	8b 40 08             	mov    0x8(%rax),%eax
  802d38:	83 e0 03             	and    $0x3,%eax
  802d3b:	85 c0                	test   %eax,%eax
  802d3d:	75 3a                	jne    802d79 <ftruncate+0xa0>
  802d3f:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  802d46:	00 00 00 
  802d49:	48 8b 00             	mov    (%rax),%rax
  802d4c:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802d52:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802d55:	89 c6                	mov    %eax,%esi
  802d57:	48 bf f0 5c 80 00 00 	movabs $0x805cf0,%rdi
  802d5e:	00 00 00 
  802d61:	b8 00 00 00 00       	mov    $0x0,%eax
  802d66:	48 b9 87 05 80 00 00 	movabs $0x800587,%rcx
  802d6d:	00 00 00 
  802d70:	ff d1                	callq  *%rcx
  802d72:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802d77:	eb 2a                	jmp    802da3 <ftruncate+0xca>
  802d79:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d7d:	48 8b 40 30          	mov    0x30(%rax),%rax
  802d81:	48 85 c0             	test   %rax,%rax
  802d84:	75 07                	jne    802d8d <ftruncate+0xb4>
  802d86:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802d8b:	eb 16                	jmp    802da3 <ftruncate+0xca>
  802d8d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d91:	48 8b 40 30          	mov    0x30(%rax),%rax
  802d95:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802d99:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  802d9c:	89 ce                	mov    %ecx,%esi
  802d9e:	48 89 d7             	mov    %rdx,%rdi
  802da1:	ff d0                	callq  *%rax
  802da3:	c9                   	leaveq 
  802da4:	c3                   	retq   

0000000000802da5 <fstat>:
  802da5:	55                   	push   %rbp
  802da6:	48 89 e5             	mov    %rsp,%rbp
  802da9:	48 83 ec 30          	sub    $0x30,%rsp
  802dad:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802db0:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802db4:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802db8:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802dbb:	48 89 d6             	mov    %rdx,%rsi
  802dbe:	89 c7                	mov    %eax,%edi
  802dc0:	48 b8 44 26 80 00 00 	movabs $0x802644,%rax
  802dc7:	00 00 00 
  802dca:	ff d0                	callq  *%rax
  802dcc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802dcf:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802dd3:	78 24                	js     802df9 <fstat+0x54>
  802dd5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802dd9:	8b 00                	mov    (%rax),%eax
  802ddb:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802ddf:	48 89 d6             	mov    %rdx,%rsi
  802de2:	89 c7                	mov    %eax,%edi
  802de4:	48 b8 9d 27 80 00 00 	movabs $0x80279d,%rax
  802deb:	00 00 00 
  802dee:	ff d0                	callq  *%rax
  802df0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802df3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802df7:	79 05                	jns    802dfe <fstat+0x59>
  802df9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802dfc:	eb 5e                	jmp    802e5c <fstat+0xb7>
  802dfe:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e02:	48 8b 40 28          	mov    0x28(%rax),%rax
  802e06:	48 85 c0             	test   %rax,%rax
  802e09:	75 07                	jne    802e12 <fstat+0x6d>
  802e0b:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802e10:	eb 4a                	jmp    802e5c <fstat+0xb7>
  802e12:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802e16:	c6 00 00             	movb   $0x0,(%rax)
  802e19:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802e1d:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  802e24:	00 00 00 
  802e27:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802e2b:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  802e32:	00 00 00 
  802e35:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802e39:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802e3d:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  802e44:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e48:	48 8b 40 28          	mov    0x28(%rax),%rax
  802e4c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802e50:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  802e54:	48 89 ce             	mov    %rcx,%rsi
  802e57:	48 89 d7             	mov    %rdx,%rdi
  802e5a:	ff d0                	callq  *%rax
  802e5c:	c9                   	leaveq 
  802e5d:	c3                   	retq   

0000000000802e5e <stat>:
  802e5e:	55                   	push   %rbp
  802e5f:	48 89 e5             	mov    %rsp,%rbp
  802e62:	48 83 ec 20          	sub    $0x20,%rsp
  802e66:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802e6a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802e6e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e72:	be 00 00 00 00       	mov    $0x0,%esi
  802e77:	48 89 c7             	mov    %rax,%rdi
  802e7a:	48 b8 4c 2f 80 00 00 	movabs $0x802f4c,%rax
  802e81:	00 00 00 
  802e84:	ff d0                	callq  *%rax
  802e86:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e89:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e8d:	79 05                	jns    802e94 <stat+0x36>
  802e8f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e92:	eb 2f                	jmp    802ec3 <stat+0x65>
  802e94:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802e98:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e9b:	48 89 d6             	mov    %rdx,%rsi
  802e9e:	89 c7                	mov    %eax,%edi
  802ea0:	48 b8 a5 2d 80 00 00 	movabs $0x802da5,%rax
  802ea7:	00 00 00 
  802eaa:	ff d0                	callq  *%rax
  802eac:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802eaf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802eb2:	89 c7                	mov    %eax,%edi
  802eb4:	48 b8 54 28 80 00 00 	movabs $0x802854,%rax
  802ebb:	00 00 00 
  802ebe:	ff d0                	callq  *%rax
  802ec0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802ec3:	c9                   	leaveq 
  802ec4:	c3                   	retq   

0000000000802ec5 <fsipc>:
  802ec5:	55                   	push   %rbp
  802ec6:	48 89 e5             	mov    %rsp,%rbp
  802ec9:	48 83 ec 10          	sub    $0x10,%rsp
  802ecd:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802ed0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802ed4:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802edb:	00 00 00 
  802ede:	8b 00                	mov    (%rax),%eax
  802ee0:	85 c0                	test   %eax,%eax
  802ee2:	75 1d                	jne    802f01 <fsipc+0x3c>
  802ee4:	bf 01 00 00 00       	mov    $0x1,%edi
  802ee9:	48 b8 8f 54 80 00 00 	movabs $0x80548f,%rax
  802ef0:	00 00 00 
  802ef3:	ff d0                	callq  *%rax
  802ef5:	48 ba 00 90 80 00 00 	movabs $0x809000,%rdx
  802efc:	00 00 00 
  802eff:	89 02                	mov    %eax,(%rdx)
  802f01:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802f08:	00 00 00 
  802f0b:	8b 00                	mov    (%rax),%eax
  802f0d:	8b 75 fc             	mov    -0x4(%rbp),%esi
  802f10:	b9 07 00 00 00       	mov    $0x7,%ecx
  802f15:	48 ba 00 a0 80 00 00 	movabs $0x80a000,%rdx
  802f1c:	00 00 00 
  802f1f:	89 c7                	mov    %eax,%edi
  802f21:	48 b8 f9 53 80 00 00 	movabs $0x8053f9,%rax
  802f28:	00 00 00 
  802f2b:	ff d0                	callq  *%rax
  802f2d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f31:	ba 00 00 00 00       	mov    $0x0,%edx
  802f36:	48 89 c6             	mov    %rax,%rsi
  802f39:	bf 00 00 00 00       	mov    $0x0,%edi
  802f3e:	48 b8 38 53 80 00 00 	movabs $0x805338,%rax
  802f45:	00 00 00 
  802f48:	ff d0                	callq  *%rax
  802f4a:	c9                   	leaveq 
  802f4b:	c3                   	retq   

0000000000802f4c <open>:
  802f4c:	55                   	push   %rbp
  802f4d:	48 89 e5             	mov    %rsp,%rbp
  802f50:	48 83 ec 20          	sub    $0x20,%rsp
  802f54:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802f58:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  802f5b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f5f:	48 89 c7             	mov    %rax,%rdi
  802f62:	48 b8 d0 10 80 00 00 	movabs $0x8010d0,%rax
  802f69:	00 00 00 
  802f6c:	ff d0                	callq  *%rax
  802f6e:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802f73:	7e 0a                	jle    802f7f <open+0x33>
  802f75:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802f7a:	e9 a5 00 00 00       	jmpq   803024 <open+0xd8>
  802f7f:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802f83:	48 89 c7             	mov    %rax,%rdi
  802f86:	48 b8 ac 25 80 00 00 	movabs $0x8025ac,%rax
  802f8d:	00 00 00 
  802f90:	ff d0                	callq  *%rax
  802f92:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f95:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f99:	79 08                	jns    802fa3 <open+0x57>
  802f9b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f9e:	e9 81 00 00 00       	jmpq   803024 <open+0xd8>
  802fa3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802fa7:	48 89 c6             	mov    %rax,%rsi
  802faa:	48 bf 00 a0 80 00 00 	movabs $0x80a000,%rdi
  802fb1:	00 00 00 
  802fb4:	48 b8 3c 11 80 00 00 	movabs $0x80113c,%rax
  802fbb:	00 00 00 
  802fbe:	ff d0                	callq  *%rax
  802fc0:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  802fc7:	00 00 00 
  802fca:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  802fcd:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  802fd3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802fd7:	48 89 c6             	mov    %rax,%rsi
  802fda:	bf 01 00 00 00       	mov    $0x1,%edi
  802fdf:	48 b8 c5 2e 80 00 00 	movabs $0x802ec5,%rax
  802fe6:	00 00 00 
  802fe9:	ff d0                	callq  *%rax
  802feb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802fee:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ff2:	79 1d                	jns    803011 <open+0xc5>
  802ff4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ff8:	be 00 00 00 00       	mov    $0x0,%esi
  802ffd:	48 89 c7             	mov    %rax,%rdi
  803000:	48 b8 d4 26 80 00 00 	movabs $0x8026d4,%rax
  803007:	00 00 00 
  80300a:	ff d0                	callq  *%rax
  80300c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80300f:	eb 13                	jmp    803024 <open+0xd8>
  803011:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803015:	48 89 c7             	mov    %rax,%rdi
  803018:	48 b8 5e 25 80 00 00 	movabs $0x80255e,%rax
  80301f:	00 00 00 
  803022:	ff d0                	callq  *%rax
  803024:	c9                   	leaveq 
  803025:	c3                   	retq   

0000000000803026 <devfile_flush>:
  803026:	55                   	push   %rbp
  803027:	48 89 e5             	mov    %rsp,%rbp
  80302a:	48 83 ec 10          	sub    $0x10,%rsp
  80302e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803032:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803036:	8b 50 0c             	mov    0xc(%rax),%edx
  803039:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803040:	00 00 00 
  803043:	89 10                	mov    %edx,(%rax)
  803045:	be 00 00 00 00       	mov    $0x0,%esi
  80304a:	bf 06 00 00 00       	mov    $0x6,%edi
  80304f:	48 b8 c5 2e 80 00 00 	movabs $0x802ec5,%rax
  803056:	00 00 00 
  803059:	ff d0                	callq  *%rax
  80305b:	c9                   	leaveq 
  80305c:	c3                   	retq   

000000000080305d <devfile_read>:
  80305d:	55                   	push   %rbp
  80305e:	48 89 e5             	mov    %rsp,%rbp
  803061:	48 83 ec 30          	sub    $0x30,%rsp
  803065:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803069:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80306d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803071:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803075:	8b 50 0c             	mov    0xc(%rax),%edx
  803078:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80307f:	00 00 00 
  803082:	89 10                	mov    %edx,(%rax)
  803084:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80308b:	00 00 00 
  80308e:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803092:	48 89 50 08          	mov    %rdx,0x8(%rax)
  803096:	be 00 00 00 00       	mov    $0x0,%esi
  80309b:	bf 03 00 00 00       	mov    $0x3,%edi
  8030a0:	48 b8 c5 2e 80 00 00 	movabs $0x802ec5,%rax
  8030a7:	00 00 00 
  8030aa:	ff d0                	callq  *%rax
  8030ac:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8030af:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8030b3:	79 08                	jns    8030bd <devfile_read+0x60>
  8030b5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030b8:	e9 a4 00 00 00       	jmpq   803161 <devfile_read+0x104>
  8030bd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030c0:	48 98                	cltq   
  8030c2:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8030c6:	76 35                	jbe    8030fd <devfile_read+0xa0>
  8030c8:	48 b9 16 5d 80 00 00 	movabs $0x805d16,%rcx
  8030cf:	00 00 00 
  8030d2:	48 ba 1d 5d 80 00 00 	movabs $0x805d1d,%rdx
  8030d9:	00 00 00 
  8030dc:	be 89 00 00 00       	mov    $0x89,%esi
  8030e1:	48 bf 32 5d 80 00 00 	movabs $0x805d32,%rdi
  8030e8:	00 00 00 
  8030eb:	b8 00 00 00 00       	mov    $0x0,%eax
  8030f0:	49 b8 4e 03 80 00 00 	movabs $0x80034e,%r8
  8030f7:	00 00 00 
  8030fa:	41 ff d0             	callq  *%r8
  8030fd:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  803104:	7e 35                	jle    80313b <devfile_read+0xde>
  803106:	48 b9 40 5d 80 00 00 	movabs $0x805d40,%rcx
  80310d:	00 00 00 
  803110:	48 ba 1d 5d 80 00 00 	movabs $0x805d1d,%rdx
  803117:	00 00 00 
  80311a:	be 8a 00 00 00       	mov    $0x8a,%esi
  80311f:	48 bf 32 5d 80 00 00 	movabs $0x805d32,%rdi
  803126:	00 00 00 
  803129:	b8 00 00 00 00       	mov    $0x0,%eax
  80312e:	49 b8 4e 03 80 00 00 	movabs $0x80034e,%r8
  803135:	00 00 00 
  803138:	41 ff d0             	callq  *%r8
  80313b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80313e:	48 63 d0             	movslq %eax,%rdx
  803141:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803145:	48 be 00 a0 80 00 00 	movabs $0x80a000,%rsi
  80314c:	00 00 00 
  80314f:	48 89 c7             	mov    %rax,%rdi
  803152:	48 b8 60 14 80 00 00 	movabs $0x801460,%rax
  803159:	00 00 00 
  80315c:	ff d0                	callq  *%rax
  80315e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803161:	c9                   	leaveq 
  803162:	c3                   	retq   

0000000000803163 <devfile_write>:
  803163:	55                   	push   %rbp
  803164:	48 89 e5             	mov    %rsp,%rbp
  803167:	48 83 ec 40          	sub    $0x40,%rsp
  80316b:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80316f:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803173:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803177:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80317b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80317f:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  803186:	00 
  803187:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80318b:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  80318f:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  803194:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  803198:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80319c:	8b 50 0c             	mov    0xc(%rax),%edx
  80319f:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8031a6:	00 00 00 
  8031a9:	89 10                	mov    %edx,(%rax)
  8031ab:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8031b2:	00 00 00 
  8031b5:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8031b9:	48 89 50 08          	mov    %rdx,0x8(%rax)
  8031bd:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8031c1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8031c5:	48 89 c6             	mov    %rax,%rsi
  8031c8:	48 bf 10 a0 80 00 00 	movabs $0x80a010,%rdi
  8031cf:	00 00 00 
  8031d2:	48 b8 60 14 80 00 00 	movabs $0x801460,%rax
  8031d9:	00 00 00 
  8031dc:	ff d0                	callq  *%rax
  8031de:	be 00 00 00 00       	mov    $0x0,%esi
  8031e3:	bf 04 00 00 00       	mov    $0x4,%edi
  8031e8:	48 b8 c5 2e 80 00 00 	movabs $0x802ec5,%rax
  8031ef:	00 00 00 
  8031f2:	ff d0                	callq  *%rax
  8031f4:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8031f7:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8031fb:	79 05                	jns    803202 <devfile_write+0x9f>
  8031fd:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803200:	eb 43                	jmp    803245 <devfile_write+0xe2>
  803202:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803205:	48 98                	cltq   
  803207:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  80320b:	76 35                	jbe    803242 <devfile_write+0xdf>
  80320d:	48 b9 16 5d 80 00 00 	movabs $0x805d16,%rcx
  803214:	00 00 00 
  803217:	48 ba 1d 5d 80 00 00 	movabs $0x805d1d,%rdx
  80321e:	00 00 00 
  803221:	be a8 00 00 00       	mov    $0xa8,%esi
  803226:	48 bf 32 5d 80 00 00 	movabs $0x805d32,%rdi
  80322d:	00 00 00 
  803230:	b8 00 00 00 00       	mov    $0x0,%eax
  803235:	49 b8 4e 03 80 00 00 	movabs $0x80034e,%r8
  80323c:	00 00 00 
  80323f:	41 ff d0             	callq  *%r8
  803242:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803245:	c9                   	leaveq 
  803246:	c3                   	retq   

0000000000803247 <devfile_stat>:
  803247:	55                   	push   %rbp
  803248:	48 89 e5             	mov    %rsp,%rbp
  80324b:	48 83 ec 20          	sub    $0x20,%rsp
  80324f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803253:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803257:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80325b:	8b 50 0c             	mov    0xc(%rax),%edx
  80325e:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803265:	00 00 00 
  803268:	89 10                	mov    %edx,(%rax)
  80326a:	be 00 00 00 00       	mov    $0x0,%esi
  80326f:	bf 05 00 00 00       	mov    $0x5,%edi
  803274:	48 b8 c5 2e 80 00 00 	movabs $0x802ec5,%rax
  80327b:	00 00 00 
  80327e:	ff d0                	callq  *%rax
  803280:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803283:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803287:	79 05                	jns    80328e <devfile_stat+0x47>
  803289:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80328c:	eb 56                	jmp    8032e4 <devfile_stat+0x9d>
  80328e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803292:	48 be 00 a0 80 00 00 	movabs $0x80a000,%rsi
  803299:	00 00 00 
  80329c:	48 89 c7             	mov    %rax,%rdi
  80329f:	48 b8 3c 11 80 00 00 	movabs $0x80113c,%rax
  8032a6:	00 00 00 
  8032a9:	ff d0                	callq  *%rax
  8032ab:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8032b2:	00 00 00 
  8032b5:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  8032bb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8032bf:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  8032c5:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8032cc:	00 00 00 
  8032cf:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  8032d5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8032d9:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  8032df:	b8 00 00 00 00       	mov    $0x0,%eax
  8032e4:	c9                   	leaveq 
  8032e5:	c3                   	retq   

00000000008032e6 <devfile_trunc>:
  8032e6:	55                   	push   %rbp
  8032e7:	48 89 e5             	mov    %rsp,%rbp
  8032ea:	48 83 ec 10          	sub    $0x10,%rsp
  8032ee:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8032f2:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8032f5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8032f9:	8b 50 0c             	mov    0xc(%rax),%edx
  8032fc:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803303:	00 00 00 
  803306:	89 10                	mov    %edx,(%rax)
  803308:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80330f:	00 00 00 
  803312:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803315:	89 50 04             	mov    %edx,0x4(%rax)
  803318:	be 00 00 00 00       	mov    $0x0,%esi
  80331d:	bf 02 00 00 00       	mov    $0x2,%edi
  803322:	48 b8 c5 2e 80 00 00 	movabs $0x802ec5,%rax
  803329:	00 00 00 
  80332c:	ff d0                	callq  *%rax
  80332e:	c9                   	leaveq 
  80332f:	c3                   	retq   

0000000000803330 <remove>:
  803330:	55                   	push   %rbp
  803331:	48 89 e5             	mov    %rsp,%rbp
  803334:	48 83 ec 10          	sub    $0x10,%rsp
  803338:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80333c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803340:	48 89 c7             	mov    %rax,%rdi
  803343:	48 b8 d0 10 80 00 00 	movabs $0x8010d0,%rax
  80334a:	00 00 00 
  80334d:	ff d0                	callq  *%rax
  80334f:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  803354:	7e 07                	jle    80335d <remove+0x2d>
  803356:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  80335b:	eb 33                	jmp    803390 <remove+0x60>
  80335d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803361:	48 89 c6             	mov    %rax,%rsi
  803364:	48 bf 00 a0 80 00 00 	movabs $0x80a000,%rdi
  80336b:	00 00 00 
  80336e:	48 b8 3c 11 80 00 00 	movabs $0x80113c,%rax
  803375:	00 00 00 
  803378:	ff d0                	callq  *%rax
  80337a:	be 00 00 00 00       	mov    $0x0,%esi
  80337f:	bf 07 00 00 00       	mov    $0x7,%edi
  803384:	48 b8 c5 2e 80 00 00 	movabs $0x802ec5,%rax
  80338b:	00 00 00 
  80338e:	ff d0                	callq  *%rax
  803390:	c9                   	leaveq 
  803391:	c3                   	retq   

0000000000803392 <sync>:
  803392:	55                   	push   %rbp
  803393:	48 89 e5             	mov    %rsp,%rbp
  803396:	be 00 00 00 00       	mov    $0x0,%esi
  80339b:	bf 08 00 00 00       	mov    $0x8,%edi
  8033a0:	48 b8 c5 2e 80 00 00 	movabs $0x802ec5,%rax
  8033a7:	00 00 00 
  8033aa:	ff d0                	callq  *%rax
  8033ac:	5d                   	pop    %rbp
  8033ad:	c3                   	retq   

00000000008033ae <copy>:
  8033ae:	55                   	push   %rbp
  8033af:	48 89 e5             	mov    %rsp,%rbp
  8033b2:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  8033b9:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  8033c0:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  8033c7:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  8033ce:	be 00 00 00 00       	mov    $0x0,%esi
  8033d3:	48 89 c7             	mov    %rax,%rdi
  8033d6:	48 b8 4c 2f 80 00 00 	movabs $0x802f4c,%rax
  8033dd:	00 00 00 
  8033e0:	ff d0                	callq  *%rax
  8033e2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8033e5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8033e9:	79 28                	jns    803413 <copy+0x65>
  8033eb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033ee:	89 c6                	mov    %eax,%esi
  8033f0:	48 bf 4c 5d 80 00 00 	movabs $0x805d4c,%rdi
  8033f7:	00 00 00 
  8033fa:	b8 00 00 00 00       	mov    $0x0,%eax
  8033ff:	48 ba 87 05 80 00 00 	movabs $0x800587,%rdx
  803406:	00 00 00 
  803409:	ff d2                	callq  *%rdx
  80340b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80340e:	e9 74 01 00 00       	jmpq   803587 <copy+0x1d9>
  803413:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  80341a:	be 01 01 00 00       	mov    $0x101,%esi
  80341f:	48 89 c7             	mov    %rax,%rdi
  803422:	48 b8 4c 2f 80 00 00 	movabs $0x802f4c,%rax
  803429:	00 00 00 
  80342c:	ff d0                	callq  *%rax
  80342e:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803431:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803435:	79 39                	jns    803470 <copy+0xc2>
  803437:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80343a:	89 c6                	mov    %eax,%esi
  80343c:	48 bf 62 5d 80 00 00 	movabs $0x805d62,%rdi
  803443:	00 00 00 
  803446:	b8 00 00 00 00       	mov    $0x0,%eax
  80344b:	48 ba 87 05 80 00 00 	movabs $0x800587,%rdx
  803452:	00 00 00 
  803455:	ff d2                	callq  *%rdx
  803457:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80345a:	89 c7                	mov    %eax,%edi
  80345c:	48 b8 54 28 80 00 00 	movabs $0x802854,%rax
  803463:	00 00 00 
  803466:	ff d0                	callq  *%rax
  803468:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80346b:	e9 17 01 00 00       	jmpq   803587 <copy+0x1d9>
  803470:	eb 74                	jmp    8034e6 <copy+0x138>
  803472:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803475:	48 63 d0             	movslq %eax,%rdx
  803478:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  80347f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803482:	48 89 ce             	mov    %rcx,%rsi
  803485:	89 c7                	mov    %eax,%edi
  803487:	48 b8 c0 2b 80 00 00 	movabs $0x802bc0,%rax
  80348e:	00 00 00 
  803491:	ff d0                	callq  *%rax
  803493:	89 45 f0             	mov    %eax,-0x10(%rbp)
  803496:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  80349a:	79 4a                	jns    8034e6 <copy+0x138>
  80349c:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80349f:	89 c6                	mov    %eax,%esi
  8034a1:	48 bf 7c 5d 80 00 00 	movabs $0x805d7c,%rdi
  8034a8:	00 00 00 
  8034ab:	b8 00 00 00 00       	mov    $0x0,%eax
  8034b0:	48 ba 87 05 80 00 00 	movabs $0x800587,%rdx
  8034b7:	00 00 00 
  8034ba:	ff d2                	callq  *%rdx
  8034bc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034bf:	89 c7                	mov    %eax,%edi
  8034c1:	48 b8 54 28 80 00 00 	movabs $0x802854,%rax
  8034c8:	00 00 00 
  8034cb:	ff d0                	callq  *%rax
  8034cd:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8034d0:	89 c7                	mov    %eax,%edi
  8034d2:	48 b8 54 28 80 00 00 	movabs $0x802854,%rax
  8034d9:	00 00 00 
  8034dc:	ff d0                	callq  *%rax
  8034de:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8034e1:	e9 a1 00 00 00       	jmpq   803587 <copy+0x1d9>
  8034e6:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  8034ed:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034f0:	ba 00 02 00 00       	mov    $0x200,%edx
  8034f5:	48 89 ce             	mov    %rcx,%rsi
  8034f8:	89 c7                	mov    %eax,%edi
  8034fa:	48 b8 76 2a 80 00 00 	movabs $0x802a76,%rax
  803501:	00 00 00 
  803504:	ff d0                	callq  *%rax
  803506:	89 45 f4             	mov    %eax,-0xc(%rbp)
  803509:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  80350d:	0f 8f 5f ff ff ff    	jg     803472 <copy+0xc4>
  803513:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  803517:	79 47                	jns    803560 <copy+0x1b2>
  803519:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80351c:	89 c6                	mov    %eax,%esi
  80351e:	48 bf 8f 5d 80 00 00 	movabs $0x805d8f,%rdi
  803525:	00 00 00 
  803528:	b8 00 00 00 00       	mov    $0x0,%eax
  80352d:	48 ba 87 05 80 00 00 	movabs $0x800587,%rdx
  803534:	00 00 00 
  803537:	ff d2                	callq  *%rdx
  803539:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80353c:	89 c7                	mov    %eax,%edi
  80353e:	48 b8 54 28 80 00 00 	movabs $0x802854,%rax
  803545:	00 00 00 
  803548:	ff d0                	callq  *%rax
  80354a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80354d:	89 c7                	mov    %eax,%edi
  80354f:	48 b8 54 28 80 00 00 	movabs $0x802854,%rax
  803556:	00 00 00 
  803559:	ff d0                	callq  *%rax
  80355b:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80355e:	eb 27                	jmp    803587 <copy+0x1d9>
  803560:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803563:	89 c7                	mov    %eax,%edi
  803565:	48 b8 54 28 80 00 00 	movabs $0x802854,%rax
  80356c:	00 00 00 
  80356f:	ff d0                	callq  *%rax
  803571:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803574:	89 c7                	mov    %eax,%edi
  803576:	48 b8 54 28 80 00 00 	movabs $0x802854,%rax
  80357d:	00 00 00 
  803580:	ff d0                	callq  *%rax
  803582:	b8 00 00 00 00       	mov    $0x0,%eax
  803587:	c9                   	leaveq 
  803588:	c3                   	retq   

0000000000803589 <spawn>:
  803589:	55                   	push   %rbp
  80358a:	48 89 e5             	mov    %rsp,%rbp
  80358d:	48 81 ec 10 03 00 00 	sub    $0x310,%rsp
  803594:	48 89 bd 08 fd ff ff 	mov    %rdi,-0x2f8(%rbp)
  80359b:	48 89 b5 00 fd ff ff 	mov    %rsi,-0x300(%rbp)
  8035a2:	48 8b 85 08 fd ff ff 	mov    -0x2f8(%rbp),%rax
  8035a9:	be 00 00 00 00       	mov    $0x0,%esi
  8035ae:	48 89 c7             	mov    %rax,%rdi
  8035b1:	48 b8 4c 2f 80 00 00 	movabs $0x802f4c,%rax
  8035b8:	00 00 00 
  8035bb:	ff d0                	callq  *%rax
  8035bd:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8035c0:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  8035c4:	79 08                	jns    8035ce <spawn+0x45>
  8035c6:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8035c9:	e9 0c 03 00 00       	jmpq   8038da <spawn+0x351>
  8035ce:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8035d1:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  8035d4:	48 8d 85 d0 fd ff ff 	lea    -0x230(%rbp),%rax
  8035db:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  8035df:	48 8d 8d d0 fd ff ff 	lea    -0x230(%rbp),%rcx
  8035e6:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8035e9:	ba 00 02 00 00       	mov    $0x200,%edx
  8035ee:	48 89 ce             	mov    %rcx,%rsi
  8035f1:	89 c7                	mov    %eax,%edi
  8035f3:	48 b8 4b 2b 80 00 00 	movabs $0x802b4b,%rax
  8035fa:	00 00 00 
  8035fd:	ff d0                	callq  *%rax
  8035ff:	3d 00 02 00 00       	cmp    $0x200,%eax
  803604:	75 0d                	jne    803613 <spawn+0x8a>
  803606:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80360a:	8b 00                	mov    (%rax),%eax
  80360c:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
  803611:	74 43                	je     803656 <spawn+0xcd>
  803613:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  803616:	89 c7                	mov    %eax,%edi
  803618:	48 b8 54 28 80 00 00 	movabs $0x802854,%rax
  80361f:	00 00 00 
  803622:	ff d0                	callq  *%rax
  803624:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803628:	8b 00                	mov    (%rax),%eax
  80362a:	ba 7f 45 4c 46       	mov    $0x464c457f,%edx
  80362f:	89 c6                	mov    %eax,%esi
  803631:	48 bf a8 5d 80 00 00 	movabs $0x805da8,%rdi
  803638:	00 00 00 
  80363b:	b8 00 00 00 00       	mov    $0x0,%eax
  803640:	48 b9 87 05 80 00 00 	movabs $0x800587,%rcx
  803647:	00 00 00 
  80364a:	ff d1                	callq  *%rcx
  80364c:	b8 f1 ff ff ff       	mov    $0xfffffff1,%eax
  803651:	e9 84 02 00 00       	jmpq   8038da <spawn+0x351>
  803656:	b8 07 00 00 00       	mov    $0x7,%eax
  80365b:	cd 30                	int    $0x30
  80365d:	89 45 d0             	mov    %eax,-0x30(%rbp)
  803660:	8b 45 d0             	mov    -0x30(%rbp),%eax
  803663:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803666:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  80366a:	79 08                	jns    803674 <spawn+0xeb>
  80366c:	8b 45 e8             	mov    -0x18(%rbp),%eax
  80366f:	e9 66 02 00 00       	jmpq   8038da <spawn+0x351>
  803674:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803677:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  80367a:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  80367d:	25 ff 03 00 00       	and    $0x3ff,%eax
  803682:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  803689:	00 00 00 
  80368c:	48 98                	cltq   
  80368e:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  803695:	48 01 d0             	add    %rdx,%rax
  803698:	48 8d 95 10 fd ff ff 	lea    -0x2f0(%rbp),%rdx
  80369f:	48 89 c6             	mov    %rax,%rsi
  8036a2:	b8 18 00 00 00       	mov    $0x18,%eax
  8036a7:	48 89 d7             	mov    %rdx,%rdi
  8036aa:	48 89 c1             	mov    %rax,%rcx
  8036ad:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
  8036b0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8036b4:	48 8b 40 18          	mov    0x18(%rax),%rax
  8036b8:	48 89 85 a8 fd ff ff 	mov    %rax,-0x258(%rbp)
  8036bf:	48 8d 85 10 fd ff ff 	lea    -0x2f0(%rbp),%rax
  8036c6:	48 8d 90 b0 00 00 00 	lea    0xb0(%rax),%rdx
  8036cd:	48 8b 8d 00 fd ff ff 	mov    -0x300(%rbp),%rcx
  8036d4:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  8036d7:	48 89 ce             	mov    %rcx,%rsi
  8036da:	89 c7                	mov    %eax,%edi
  8036dc:	48 b8 44 3b 80 00 00 	movabs $0x803b44,%rax
  8036e3:	00 00 00 
  8036e6:	ff d0                	callq  *%rax
  8036e8:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8036eb:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  8036ef:	79 08                	jns    8036f9 <spawn+0x170>
  8036f1:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8036f4:	e9 e1 01 00 00       	jmpq   8038da <spawn+0x351>
  8036f9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8036fd:	48 8b 40 20          	mov    0x20(%rax),%rax
  803701:	48 8d 95 d0 fd ff ff 	lea    -0x230(%rbp),%rdx
  803708:	48 01 d0             	add    %rdx,%rax
  80370b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80370f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803716:	e9 a3 00 00 00       	jmpq   8037be <spawn+0x235>
  80371b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80371f:	8b 00                	mov    (%rax),%eax
  803721:	83 f8 01             	cmp    $0x1,%eax
  803724:	74 05                	je     80372b <spawn+0x1a2>
  803726:	e9 8a 00 00 00       	jmpq   8037b5 <spawn+0x22c>
  80372b:	c7 45 ec 05 00 00 00 	movl   $0x5,-0x14(%rbp)
  803732:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803736:	8b 40 04             	mov    0x4(%rax),%eax
  803739:	83 e0 02             	and    $0x2,%eax
  80373c:	85 c0                	test   %eax,%eax
  80373e:	74 04                	je     803744 <spawn+0x1bb>
  803740:	83 4d ec 02          	orl    $0x2,-0x14(%rbp)
  803744:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803748:	48 8b 40 08          	mov    0x8(%rax),%rax
  80374c:	41 89 c1             	mov    %eax,%r9d
  80374f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803753:	4c 8b 40 20          	mov    0x20(%rax),%r8
  803757:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80375b:	48 8b 50 28          	mov    0x28(%rax),%rdx
  80375f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803763:	48 8b 70 10          	mov    0x10(%rax),%rsi
  803767:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  80376a:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  80376d:	8b 7d ec             	mov    -0x14(%rbp),%edi
  803770:	89 3c 24             	mov    %edi,(%rsp)
  803773:	89 c7                	mov    %eax,%edi
  803775:	48 b8 ed 3d 80 00 00 	movabs $0x803ded,%rax
  80377c:	00 00 00 
  80377f:	ff d0                	callq  *%rax
  803781:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803784:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  803788:	79 2b                	jns    8037b5 <spawn+0x22c>
  80378a:	90                   	nop
  80378b:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  80378e:	89 c7                	mov    %eax,%edi
  803790:	48 b8 ab 19 80 00 00 	movabs $0x8019ab,%rax
  803797:	00 00 00 
  80379a:	ff d0                	callq  *%rax
  80379c:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80379f:	89 c7                	mov    %eax,%edi
  8037a1:	48 b8 54 28 80 00 00 	movabs $0x802854,%rax
  8037a8:	00 00 00 
  8037ab:	ff d0                	callq  *%rax
  8037ad:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8037b0:	e9 25 01 00 00       	jmpq   8038da <spawn+0x351>
  8037b5:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8037b9:	48 83 45 f0 38       	addq   $0x38,-0x10(%rbp)
  8037be:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8037c2:	0f b7 40 38          	movzwl 0x38(%rax),%eax
  8037c6:	0f b7 c0             	movzwl %ax,%eax
  8037c9:	3b 45 fc             	cmp    -0x4(%rbp),%eax
  8037cc:	0f 8f 49 ff ff ff    	jg     80371b <spawn+0x192>
  8037d2:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8037d5:	89 c7                	mov    %eax,%edi
  8037d7:	48 b8 54 28 80 00 00 	movabs $0x802854,%rax
  8037de:	00 00 00 
  8037e1:	ff d0                	callq  *%rax
  8037e3:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%rbp)
  8037ea:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  8037ed:	89 c7                	mov    %eax,%edi
  8037ef:	48 b8 d9 3f 80 00 00 	movabs $0x803fd9,%rax
  8037f6:	00 00 00 
  8037f9:	ff d0                	callq  *%rax
  8037fb:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8037fe:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  803802:	79 30                	jns    803834 <spawn+0x2ab>
  803804:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803807:	89 c1                	mov    %eax,%ecx
  803809:	48 ba c2 5d 80 00 00 	movabs $0x805dc2,%rdx
  803810:	00 00 00 
  803813:	be 86 00 00 00       	mov    $0x86,%esi
  803818:	48 bf d8 5d 80 00 00 	movabs $0x805dd8,%rdi
  80381f:	00 00 00 
  803822:	b8 00 00 00 00       	mov    $0x0,%eax
  803827:	49 b8 4e 03 80 00 00 	movabs $0x80034e,%r8
  80382e:	00 00 00 
  803831:	41 ff d0             	callq  *%r8
  803834:	48 8d 95 10 fd ff ff 	lea    -0x2f0(%rbp),%rdx
  80383b:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  80383e:	48 89 d6             	mov    %rdx,%rsi
  803841:	89 c7                	mov    %eax,%edi
  803843:	48 b8 ab 1b 80 00 00 	movabs $0x801bab,%rax
  80384a:	00 00 00 
  80384d:	ff d0                	callq  *%rax
  80384f:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803852:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  803856:	79 30                	jns    803888 <spawn+0x2ff>
  803858:	8b 45 e8             	mov    -0x18(%rbp),%eax
  80385b:	89 c1                	mov    %eax,%ecx
  80385d:	48 ba e7 5d 80 00 00 	movabs $0x805de7,%rdx
  803864:	00 00 00 
  803867:	be 8a 00 00 00       	mov    $0x8a,%esi
  80386c:	48 bf d8 5d 80 00 00 	movabs $0x805dd8,%rdi
  803873:	00 00 00 
  803876:	b8 00 00 00 00       	mov    $0x0,%eax
  80387b:	49 b8 4e 03 80 00 00 	movabs $0x80034e,%r8
  803882:	00 00 00 
  803885:	41 ff d0             	callq  *%r8
  803888:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  80388b:	be 02 00 00 00       	mov    $0x2,%esi
  803890:	89 c7                	mov    %eax,%edi
  803892:	48 b8 60 1b 80 00 00 	movabs $0x801b60,%rax
  803899:	00 00 00 
  80389c:	ff d0                	callq  *%rax
  80389e:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8038a1:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  8038a5:	79 30                	jns    8038d7 <spawn+0x34e>
  8038a7:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8038aa:	89 c1                	mov    %eax,%ecx
  8038ac:	48 ba 01 5e 80 00 00 	movabs $0x805e01,%rdx
  8038b3:	00 00 00 
  8038b6:	be 8d 00 00 00       	mov    $0x8d,%esi
  8038bb:	48 bf d8 5d 80 00 00 	movabs $0x805dd8,%rdi
  8038c2:	00 00 00 
  8038c5:	b8 00 00 00 00       	mov    $0x0,%eax
  8038ca:	49 b8 4e 03 80 00 00 	movabs $0x80034e,%r8
  8038d1:	00 00 00 
  8038d4:	41 ff d0             	callq  *%r8
  8038d7:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  8038da:	c9                   	leaveq 
  8038db:	c3                   	retq   

00000000008038dc <spawnl>:
  8038dc:	55                   	push   %rbp
  8038dd:	48 89 e5             	mov    %rsp,%rbp
  8038e0:	41 55                	push   %r13
  8038e2:	41 54                	push   %r12
  8038e4:	53                   	push   %rbx
  8038e5:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  8038ec:	48 89 bd f8 fe ff ff 	mov    %rdi,-0x108(%rbp)
  8038f3:	48 89 95 40 ff ff ff 	mov    %rdx,-0xc0(%rbp)
  8038fa:	48 89 8d 48 ff ff ff 	mov    %rcx,-0xb8(%rbp)
  803901:	4c 89 85 50 ff ff ff 	mov    %r8,-0xb0(%rbp)
  803908:	4c 89 8d 58 ff ff ff 	mov    %r9,-0xa8(%rbp)
  80390f:	84 c0                	test   %al,%al
  803911:	74 26                	je     803939 <spawnl+0x5d>
  803913:	0f 29 85 60 ff ff ff 	movaps %xmm0,-0xa0(%rbp)
  80391a:	0f 29 8d 70 ff ff ff 	movaps %xmm1,-0x90(%rbp)
  803921:	0f 29 55 80          	movaps %xmm2,-0x80(%rbp)
  803925:	0f 29 5d 90          	movaps %xmm3,-0x70(%rbp)
  803929:	0f 29 65 a0          	movaps %xmm4,-0x60(%rbp)
  80392d:	0f 29 6d b0          	movaps %xmm5,-0x50(%rbp)
  803931:	0f 29 75 c0          	movaps %xmm6,-0x40(%rbp)
  803935:	0f 29 7d d0          	movaps %xmm7,-0x30(%rbp)
  803939:	48 89 b5 f0 fe ff ff 	mov    %rsi,-0x110(%rbp)
  803940:	c7 85 2c ff ff ff 00 	movl   $0x0,-0xd4(%rbp)
  803947:	00 00 00 
  80394a:	c7 85 00 ff ff ff 10 	movl   $0x10,-0x100(%rbp)
  803951:	00 00 00 
  803954:	c7 85 04 ff ff ff 30 	movl   $0x30,-0xfc(%rbp)
  80395b:	00 00 00 
  80395e:	48 8d 45 10          	lea    0x10(%rbp),%rax
  803962:	48 89 85 08 ff ff ff 	mov    %rax,-0xf8(%rbp)
  803969:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
  803970:	48 89 85 10 ff ff ff 	mov    %rax,-0xf0(%rbp)
  803977:	eb 07                	jmp    803980 <spawnl+0xa4>
  803979:	83 85 2c ff ff ff 01 	addl   $0x1,-0xd4(%rbp)
  803980:	8b 85 00 ff ff ff    	mov    -0x100(%rbp),%eax
  803986:	83 f8 30             	cmp    $0x30,%eax
  803989:	73 23                	jae    8039ae <spawnl+0xd2>
  80398b:	48 8b 95 10 ff ff ff 	mov    -0xf0(%rbp),%rdx
  803992:	8b 85 00 ff ff ff    	mov    -0x100(%rbp),%eax
  803998:	89 c0                	mov    %eax,%eax
  80399a:	48 01 d0             	add    %rdx,%rax
  80399d:	8b 95 00 ff ff ff    	mov    -0x100(%rbp),%edx
  8039a3:	83 c2 08             	add    $0x8,%edx
  8039a6:	89 95 00 ff ff ff    	mov    %edx,-0x100(%rbp)
  8039ac:	eb 15                	jmp    8039c3 <spawnl+0xe7>
  8039ae:	48 8b 95 08 ff ff ff 	mov    -0xf8(%rbp),%rdx
  8039b5:	48 89 d0             	mov    %rdx,%rax
  8039b8:	48 83 c2 08          	add    $0x8,%rdx
  8039bc:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  8039c3:	48 8b 00             	mov    (%rax),%rax
  8039c6:	48 85 c0             	test   %rax,%rax
  8039c9:	75 ae                	jne    803979 <spawnl+0x9d>
  8039cb:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  8039d1:	83 c0 02             	add    $0x2,%eax
  8039d4:	48 89 e2             	mov    %rsp,%rdx
  8039d7:	48 89 d3             	mov    %rdx,%rbx
  8039da:	48 63 d0             	movslq %eax,%rdx
  8039dd:	48 83 ea 01          	sub    $0x1,%rdx
  8039e1:	48 89 95 20 ff ff ff 	mov    %rdx,-0xe0(%rbp)
  8039e8:	48 63 d0             	movslq %eax,%rdx
  8039eb:	49 89 d4             	mov    %rdx,%r12
  8039ee:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  8039f4:	48 63 d0             	movslq %eax,%rdx
  8039f7:	49 89 d2             	mov    %rdx,%r10
  8039fa:	41 bb 00 00 00 00    	mov    $0x0,%r11d
  803a00:	48 98                	cltq   
  803a02:	48 c1 e0 03          	shl    $0x3,%rax
  803a06:	48 8d 50 07          	lea    0x7(%rax),%rdx
  803a0a:	b8 10 00 00 00       	mov    $0x10,%eax
  803a0f:	48 83 e8 01          	sub    $0x1,%rax
  803a13:	48 01 d0             	add    %rdx,%rax
  803a16:	bf 10 00 00 00       	mov    $0x10,%edi
  803a1b:	ba 00 00 00 00       	mov    $0x0,%edx
  803a20:	48 f7 f7             	div    %rdi
  803a23:	48 6b c0 10          	imul   $0x10,%rax,%rax
  803a27:	48 29 c4             	sub    %rax,%rsp
  803a2a:	48 89 e0             	mov    %rsp,%rax
  803a2d:	48 83 c0 07          	add    $0x7,%rax
  803a31:	48 c1 e8 03          	shr    $0x3,%rax
  803a35:	48 c1 e0 03          	shl    $0x3,%rax
  803a39:	48 89 85 18 ff ff ff 	mov    %rax,-0xe8(%rbp)
  803a40:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  803a47:	48 8b 95 f0 fe ff ff 	mov    -0x110(%rbp),%rdx
  803a4e:	48 89 10             	mov    %rdx,(%rax)
  803a51:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  803a57:	8d 50 01             	lea    0x1(%rax),%edx
  803a5a:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  803a61:	48 63 d2             	movslq %edx,%rdx
  803a64:	48 c7 04 d0 00 00 00 	movq   $0x0,(%rax,%rdx,8)
  803a6b:	00 
  803a6c:	c7 85 00 ff ff ff 10 	movl   $0x10,-0x100(%rbp)
  803a73:	00 00 00 
  803a76:	c7 85 04 ff ff ff 30 	movl   $0x30,-0xfc(%rbp)
  803a7d:	00 00 00 
  803a80:	48 8d 45 10          	lea    0x10(%rbp),%rax
  803a84:	48 89 85 08 ff ff ff 	mov    %rax,-0xf8(%rbp)
  803a8b:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
  803a92:	48 89 85 10 ff ff ff 	mov    %rax,-0xf0(%rbp)
  803a99:	c7 85 28 ff ff ff 00 	movl   $0x0,-0xd8(%rbp)
  803aa0:	00 00 00 
  803aa3:	eb 63                	jmp    803b08 <spawnl+0x22c>
  803aa5:	8b 85 28 ff ff ff    	mov    -0xd8(%rbp),%eax
  803aab:	8d 70 01             	lea    0x1(%rax),%esi
  803aae:	8b 85 00 ff ff ff    	mov    -0x100(%rbp),%eax
  803ab4:	83 f8 30             	cmp    $0x30,%eax
  803ab7:	73 23                	jae    803adc <spawnl+0x200>
  803ab9:	48 8b 95 10 ff ff ff 	mov    -0xf0(%rbp),%rdx
  803ac0:	8b 85 00 ff ff ff    	mov    -0x100(%rbp),%eax
  803ac6:	89 c0                	mov    %eax,%eax
  803ac8:	48 01 d0             	add    %rdx,%rax
  803acb:	8b 95 00 ff ff ff    	mov    -0x100(%rbp),%edx
  803ad1:	83 c2 08             	add    $0x8,%edx
  803ad4:	89 95 00 ff ff ff    	mov    %edx,-0x100(%rbp)
  803ada:	eb 15                	jmp    803af1 <spawnl+0x215>
  803adc:	48 8b 95 08 ff ff ff 	mov    -0xf8(%rbp),%rdx
  803ae3:	48 89 d0             	mov    %rdx,%rax
  803ae6:	48 83 c2 08          	add    $0x8,%rdx
  803aea:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  803af1:	48 8b 08             	mov    (%rax),%rcx
  803af4:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  803afb:	89 f2                	mov    %esi,%edx
  803afd:	48 89 0c d0          	mov    %rcx,(%rax,%rdx,8)
  803b01:	83 85 28 ff ff ff 01 	addl   $0x1,-0xd8(%rbp)
  803b08:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  803b0e:	3b 85 28 ff ff ff    	cmp    -0xd8(%rbp),%eax
  803b14:	77 8f                	ja     803aa5 <spawnl+0x1c9>
  803b16:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  803b1d:	48 8b 85 f8 fe ff ff 	mov    -0x108(%rbp),%rax
  803b24:	48 89 d6             	mov    %rdx,%rsi
  803b27:	48 89 c7             	mov    %rax,%rdi
  803b2a:	48 b8 89 35 80 00 00 	movabs $0x803589,%rax
  803b31:	00 00 00 
  803b34:	ff d0                	callq  *%rax
  803b36:	48 89 dc             	mov    %rbx,%rsp
  803b39:	48 8d 65 e8          	lea    -0x18(%rbp),%rsp
  803b3d:	5b                   	pop    %rbx
  803b3e:	41 5c                	pop    %r12
  803b40:	41 5d                	pop    %r13
  803b42:	5d                   	pop    %rbp
  803b43:	c3                   	retq   

0000000000803b44 <init_stack>:
  803b44:	55                   	push   %rbp
  803b45:	48 89 e5             	mov    %rsp,%rbp
  803b48:	48 83 ec 50          	sub    $0x50,%rsp
  803b4c:	89 7d cc             	mov    %edi,-0x34(%rbp)
  803b4f:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
  803b53:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  803b57:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803b5e:	00 
  803b5f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
  803b66:	eb 33                	jmp    803b9b <init_stack+0x57>
  803b68:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803b6b:	48 98                	cltq   
  803b6d:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  803b74:	00 
  803b75:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  803b79:	48 01 d0             	add    %rdx,%rax
  803b7c:	48 8b 00             	mov    (%rax),%rax
  803b7f:	48 89 c7             	mov    %rax,%rdi
  803b82:	48 b8 d0 10 80 00 00 	movabs $0x8010d0,%rax
  803b89:	00 00 00 
  803b8c:	ff d0                	callq  *%rax
  803b8e:	83 c0 01             	add    $0x1,%eax
  803b91:	48 98                	cltq   
  803b93:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  803b97:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
  803b9b:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803b9e:	48 98                	cltq   
  803ba0:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  803ba7:	00 
  803ba8:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  803bac:	48 01 d0             	add    %rdx,%rax
  803baf:	48 8b 00             	mov    (%rax),%rax
  803bb2:	48 85 c0             	test   %rax,%rax
  803bb5:	75 b1                	jne    803b68 <init_stack+0x24>
  803bb7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803bbb:	48 f7 d8             	neg    %rax
  803bbe:	48 05 00 10 40 00    	add    $0x401000,%rax
  803bc4:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803bc8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803bcc:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  803bd0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803bd4:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  803bd8:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803bdb:	83 c2 01             	add    $0x1,%edx
  803bde:	c1 e2 03             	shl    $0x3,%edx
  803be1:	48 63 d2             	movslq %edx,%rdx
  803be4:	48 f7 da             	neg    %rdx
  803be7:	48 01 d0             	add    %rdx,%rax
  803bea:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  803bee:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803bf2:	48 83 e8 10          	sub    $0x10,%rax
  803bf6:	48 3d ff ff 3f 00    	cmp    $0x3fffff,%rax
  803bfc:	77 0a                	ja     803c08 <init_stack+0xc4>
  803bfe:	b8 fc ff ff ff       	mov    $0xfffffffc,%eax
  803c03:	e9 e3 01 00 00       	jmpq   803deb <init_stack+0x2a7>
  803c08:	ba 07 00 00 00       	mov    $0x7,%edx
  803c0d:	be 00 00 40 00       	mov    $0x400000,%esi
  803c12:	bf 00 00 00 00       	mov    $0x0,%edi
  803c17:	48 b8 6b 1a 80 00 00 	movabs $0x801a6b,%rax
  803c1e:	00 00 00 
  803c21:	ff d0                	callq  *%rax
  803c23:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803c26:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803c2a:	79 08                	jns    803c34 <init_stack+0xf0>
  803c2c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803c2f:	e9 b7 01 00 00       	jmpq   803deb <init_stack+0x2a7>
  803c34:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
  803c3b:	e9 8a 00 00 00       	jmpq   803cca <init_stack+0x186>
  803c40:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803c43:	48 98                	cltq   
  803c45:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  803c4c:	00 
  803c4d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803c51:	48 01 c2             	add    %rax,%rdx
  803c54:	b9 00 d0 7f ef       	mov    $0xef7fd000,%ecx
  803c59:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803c5d:	48 01 c8             	add    %rcx,%rax
  803c60:	48 2d 00 00 40 00    	sub    $0x400000,%rax
  803c66:	48 89 02             	mov    %rax,(%rdx)
  803c69:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803c6c:	48 98                	cltq   
  803c6e:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  803c75:	00 
  803c76:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  803c7a:	48 01 d0             	add    %rdx,%rax
  803c7d:	48 8b 10             	mov    (%rax),%rdx
  803c80:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803c84:	48 89 d6             	mov    %rdx,%rsi
  803c87:	48 89 c7             	mov    %rax,%rdi
  803c8a:	48 b8 3c 11 80 00 00 	movabs $0x80113c,%rax
  803c91:	00 00 00 
  803c94:	ff d0                	callq  *%rax
  803c96:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803c99:	48 98                	cltq   
  803c9b:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  803ca2:	00 
  803ca3:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  803ca7:	48 01 d0             	add    %rdx,%rax
  803caa:	48 8b 00             	mov    (%rax),%rax
  803cad:	48 89 c7             	mov    %rax,%rdi
  803cb0:	48 b8 d0 10 80 00 00 	movabs $0x8010d0,%rax
  803cb7:	00 00 00 
  803cba:	ff d0                	callq  *%rax
  803cbc:	48 98                	cltq   
  803cbe:	48 83 c0 01          	add    $0x1,%rax
  803cc2:	48 01 45 e0          	add    %rax,-0x20(%rbp)
  803cc6:	83 45 f0 01          	addl   $0x1,-0x10(%rbp)
  803cca:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803ccd:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  803cd0:	0f 8c 6a ff ff ff    	jl     803c40 <init_stack+0xfc>
  803cd6:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803cd9:	48 98                	cltq   
  803cdb:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  803ce2:	00 
  803ce3:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803ce7:	48 01 d0             	add    %rdx,%rax
  803cea:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  803cf1:	48 81 7d e0 00 10 40 	cmpq   $0x401000,-0x20(%rbp)
  803cf8:	00 
  803cf9:	74 35                	je     803d30 <init_stack+0x1ec>
  803cfb:	48 b9 18 5e 80 00 00 	movabs $0x805e18,%rcx
  803d02:	00 00 00 
  803d05:	48 ba 3e 5e 80 00 00 	movabs $0x805e3e,%rdx
  803d0c:	00 00 00 
  803d0f:	be f6 00 00 00       	mov    $0xf6,%esi
  803d14:	48 bf d8 5d 80 00 00 	movabs $0x805dd8,%rdi
  803d1b:	00 00 00 
  803d1e:	b8 00 00 00 00       	mov    $0x0,%eax
  803d23:	49 b8 4e 03 80 00 00 	movabs $0x80034e,%r8
  803d2a:	00 00 00 
  803d2d:	41 ff d0             	callq  *%r8
  803d30:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803d34:	48 8d 50 f8          	lea    -0x8(%rax),%rdx
  803d38:	b9 00 d0 7f ef       	mov    $0xef7fd000,%ecx
  803d3d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803d41:	48 01 c8             	add    %rcx,%rax
  803d44:	48 2d 00 00 40 00    	sub    $0x400000,%rax
  803d4a:	48 89 02             	mov    %rax,(%rdx)
  803d4d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803d51:	48 8d 50 f0          	lea    -0x10(%rax),%rdx
  803d55:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803d58:	48 98                	cltq   
  803d5a:	48 89 02             	mov    %rax,(%rdx)
  803d5d:	ba f0 cf 7f ef       	mov    $0xef7fcff0,%edx
  803d62:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803d66:	48 01 d0             	add    %rdx,%rax
  803d69:	48 2d 00 00 40 00    	sub    $0x400000,%rax
  803d6f:	48 89 c2             	mov    %rax,%rdx
  803d72:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  803d76:	48 89 10             	mov    %rdx,(%rax)
  803d79:	8b 45 cc             	mov    -0x34(%rbp),%eax
  803d7c:	41 b8 07 00 00 00    	mov    $0x7,%r8d
  803d82:	b9 00 d0 7f ef       	mov    $0xef7fd000,%ecx
  803d87:	89 c2                	mov    %eax,%edx
  803d89:	be 00 00 40 00       	mov    $0x400000,%esi
  803d8e:	bf 00 00 00 00       	mov    $0x0,%edi
  803d93:	48 b8 bb 1a 80 00 00 	movabs $0x801abb,%rax
  803d9a:	00 00 00 
  803d9d:	ff d0                	callq  *%rax
  803d9f:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803da2:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803da6:	79 02                	jns    803daa <init_stack+0x266>
  803da8:	eb 28                	jmp    803dd2 <init_stack+0x28e>
  803daa:	be 00 00 40 00       	mov    $0x400000,%esi
  803daf:	bf 00 00 00 00       	mov    $0x0,%edi
  803db4:	48 b8 16 1b 80 00 00 	movabs $0x801b16,%rax
  803dbb:	00 00 00 
  803dbe:	ff d0                	callq  *%rax
  803dc0:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803dc3:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803dc7:	79 02                	jns    803dcb <init_stack+0x287>
  803dc9:	eb 07                	jmp    803dd2 <init_stack+0x28e>
  803dcb:	b8 00 00 00 00       	mov    $0x0,%eax
  803dd0:	eb 19                	jmp    803deb <init_stack+0x2a7>
  803dd2:	be 00 00 40 00       	mov    $0x400000,%esi
  803dd7:	bf 00 00 00 00       	mov    $0x0,%edi
  803ddc:	48 b8 16 1b 80 00 00 	movabs $0x801b16,%rax
  803de3:	00 00 00 
  803de6:	ff d0                	callq  *%rax
  803de8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803deb:	c9                   	leaveq 
  803dec:	c3                   	retq   

0000000000803ded <map_segment>:
  803ded:	55                   	push   %rbp
  803dee:	48 89 e5             	mov    %rsp,%rbp
  803df1:	48 83 ec 50          	sub    $0x50,%rsp
  803df5:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803df8:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803dfc:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803e00:	89 4d d8             	mov    %ecx,-0x28(%rbp)
  803e03:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  803e07:	44 89 4d bc          	mov    %r9d,-0x44(%rbp)
  803e0b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803e0f:	25 ff 0f 00 00       	and    $0xfff,%eax
  803e14:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803e17:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803e1b:	74 21                	je     803e3e <map_segment+0x51>
  803e1d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e20:	48 98                	cltq   
  803e22:	48 29 45 d0          	sub    %rax,-0x30(%rbp)
  803e26:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e29:	48 98                	cltq   
  803e2b:	48 01 45 c8          	add    %rax,-0x38(%rbp)
  803e2f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e32:	48 98                	cltq   
  803e34:	48 01 45 c0          	add    %rax,-0x40(%rbp)
  803e38:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e3b:	29 45 bc             	sub    %eax,-0x44(%rbp)
  803e3e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803e45:	e9 79 01 00 00       	jmpq   803fc3 <map_segment+0x1d6>
  803e4a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e4d:	48 98                	cltq   
  803e4f:	48 3b 45 c0          	cmp    -0x40(%rbp),%rax
  803e53:	72 3c                	jb     803e91 <map_segment+0xa4>
  803e55:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e58:	48 63 d0             	movslq %eax,%rdx
  803e5b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803e5f:	48 01 d0             	add    %rdx,%rax
  803e62:	48 89 c1             	mov    %rax,%rcx
  803e65:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803e68:	8b 55 10             	mov    0x10(%rbp),%edx
  803e6b:	48 89 ce             	mov    %rcx,%rsi
  803e6e:	89 c7                	mov    %eax,%edi
  803e70:	48 b8 6b 1a 80 00 00 	movabs $0x801a6b,%rax
  803e77:	00 00 00 
  803e7a:	ff d0                	callq  *%rax
  803e7c:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803e7f:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803e83:	0f 89 33 01 00 00    	jns    803fbc <map_segment+0x1cf>
  803e89:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803e8c:	e9 46 01 00 00       	jmpq   803fd7 <map_segment+0x1ea>
  803e91:	ba 07 00 00 00       	mov    $0x7,%edx
  803e96:	be 00 00 40 00       	mov    $0x400000,%esi
  803e9b:	bf 00 00 00 00       	mov    $0x0,%edi
  803ea0:	48 b8 6b 1a 80 00 00 	movabs $0x801a6b,%rax
  803ea7:	00 00 00 
  803eaa:	ff d0                	callq  *%rax
  803eac:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803eaf:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803eb3:	79 08                	jns    803ebd <map_segment+0xd0>
  803eb5:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803eb8:	e9 1a 01 00 00       	jmpq   803fd7 <map_segment+0x1ea>
  803ebd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ec0:	8b 55 bc             	mov    -0x44(%rbp),%edx
  803ec3:	01 c2                	add    %eax,%edx
  803ec5:	8b 45 d8             	mov    -0x28(%rbp),%eax
  803ec8:	89 d6                	mov    %edx,%esi
  803eca:	89 c7                	mov    %eax,%edi
  803ecc:	48 b8 94 2c 80 00 00 	movabs $0x802c94,%rax
  803ed3:	00 00 00 
  803ed6:	ff d0                	callq  *%rax
  803ed8:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803edb:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803edf:	79 08                	jns    803ee9 <map_segment+0xfc>
  803ee1:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803ee4:	e9 ee 00 00 00       	jmpq   803fd7 <map_segment+0x1ea>
  803ee9:	c7 45 f4 00 10 00 00 	movl   $0x1000,-0xc(%rbp)
  803ef0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ef3:	48 98                	cltq   
  803ef5:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  803ef9:	48 29 c2             	sub    %rax,%rdx
  803efc:	48 89 d0             	mov    %rdx,%rax
  803eff:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803f03:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803f06:	48 63 d0             	movslq %eax,%rdx
  803f09:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803f0d:	48 39 c2             	cmp    %rax,%rdx
  803f10:	48 0f 47 d0          	cmova  %rax,%rdx
  803f14:	8b 45 d8             	mov    -0x28(%rbp),%eax
  803f17:	be 00 00 40 00       	mov    $0x400000,%esi
  803f1c:	89 c7                	mov    %eax,%edi
  803f1e:	48 b8 4b 2b 80 00 00 	movabs $0x802b4b,%rax
  803f25:	00 00 00 
  803f28:	ff d0                	callq  *%rax
  803f2a:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803f2d:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803f31:	79 08                	jns    803f3b <map_segment+0x14e>
  803f33:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803f36:	e9 9c 00 00 00       	jmpq   803fd7 <map_segment+0x1ea>
  803f3b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f3e:	48 63 d0             	movslq %eax,%rdx
  803f41:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803f45:	48 01 d0             	add    %rdx,%rax
  803f48:	48 89 c2             	mov    %rax,%rdx
  803f4b:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803f4e:	44 8b 45 10          	mov    0x10(%rbp),%r8d
  803f52:	48 89 d1             	mov    %rdx,%rcx
  803f55:	89 c2                	mov    %eax,%edx
  803f57:	be 00 00 40 00       	mov    $0x400000,%esi
  803f5c:	bf 00 00 00 00       	mov    $0x0,%edi
  803f61:	48 b8 bb 1a 80 00 00 	movabs $0x801abb,%rax
  803f68:	00 00 00 
  803f6b:	ff d0                	callq  *%rax
  803f6d:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803f70:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803f74:	79 30                	jns    803fa6 <map_segment+0x1b9>
  803f76:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803f79:	89 c1                	mov    %eax,%ecx
  803f7b:	48 ba 53 5e 80 00 00 	movabs $0x805e53,%rdx
  803f82:	00 00 00 
  803f85:	be 29 01 00 00       	mov    $0x129,%esi
  803f8a:	48 bf d8 5d 80 00 00 	movabs $0x805dd8,%rdi
  803f91:	00 00 00 
  803f94:	b8 00 00 00 00       	mov    $0x0,%eax
  803f99:	49 b8 4e 03 80 00 00 	movabs $0x80034e,%r8
  803fa0:	00 00 00 
  803fa3:	41 ff d0             	callq  *%r8
  803fa6:	be 00 00 40 00       	mov    $0x400000,%esi
  803fab:	bf 00 00 00 00       	mov    $0x0,%edi
  803fb0:	48 b8 16 1b 80 00 00 	movabs $0x801b16,%rax
  803fb7:	00 00 00 
  803fba:	ff d0                	callq  *%rax
  803fbc:	81 45 fc 00 10 00 00 	addl   $0x1000,-0x4(%rbp)
  803fc3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803fc6:	48 98                	cltq   
  803fc8:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803fcc:	0f 82 78 fe ff ff    	jb     803e4a <map_segment+0x5d>
  803fd2:	b8 00 00 00 00       	mov    $0x0,%eax
  803fd7:	c9                   	leaveq 
  803fd8:	c3                   	retq   

0000000000803fd9 <copy_shared_pages>:
  803fd9:	55                   	push   %rbp
  803fda:	48 89 e5             	mov    %rsp,%rbp
  803fdd:	48 83 ec 30          	sub    $0x30,%rsp
  803fe1:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803fe4:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803feb:	00 
  803fec:	e9 eb 00 00 00       	jmpq   8040dc <copy_shared_pages+0x103>
  803ff1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803ff5:	48 c1 f8 12          	sar    $0x12,%rax
  803ff9:	48 89 c2             	mov    %rax,%rdx
  803ffc:	48 b8 00 00 40 80 00 	movabs $0x10080400000,%rax
  804003:	01 00 00 
  804006:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80400a:	83 e0 01             	and    $0x1,%eax
  80400d:	48 85 c0             	test   %rax,%rax
  804010:	74 21                	je     804033 <copy_shared_pages+0x5a>
  804012:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804016:	48 c1 f8 09          	sar    $0x9,%rax
  80401a:	48 89 c2             	mov    %rax,%rdx
  80401d:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  804024:	01 00 00 
  804027:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80402b:	83 e0 01             	and    $0x1,%eax
  80402e:	48 85 c0             	test   %rax,%rax
  804031:	75 0d                	jne    804040 <copy_shared_pages+0x67>
  804033:	48 81 45 f8 00 02 00 	addq   $0x200,-0x8(%rbp)
  80403a:	00 
  80403b:	e9 9c 00 00 00       	jmpq   8040dc <copy_shared_pages+0x103>
  804040:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804044:	48 05 00 02 00 00    	add    $0x200,%rax
  80404a:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80404e:	eb 7e                	jmp    8040ce <copy_shared_pages+0xf5>
  804050:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  804057:	01 00 00 
  80405a:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80405e:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804062:	25 01 04 00 00       	and    $0x401,%eax
  804067:	48 3d 01 04 00 00    	cmp    $0x401,%rax
  80406d:	75 5a                	jne    8040c9 <copy_shared_pages+0xf0>
  80406f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804073:	48 c1 e0 0c          	shl    $0xc,%rax
  804077:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80407b:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  804082:	01 00 00 
  804085:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  804089:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80408d:	25 07 0e 00 00       	and    $0xe07,%eax
  804092:	89 c6                	mov    %eax,%esi
  804094:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  804098:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80409b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80409f:	41 89 f0             	mov    %esi,%r8d
  8040a2:	48 89 c6             	mov    %rax,%rsi
  8040a5:	bf 00 00 00 00       	mov    $0x0,%edi
  8040aa:	48 b8 bb 1a 80 00 00 	movabs $0x801abb,%rax
  8040b1:	00 00 00 
  8040b4:	ff d0                	callq  *%rax
  8040b6:	48 98                	cltq   
  8040b8:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8040bc:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8040c1:	79 06                	jns    8040c9 <copy_shared_pages+0xf0>
  8040c3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8040c7:	eb 28                	jmp    8040f1 <copy_shared_pages+0x118>
  8040c9:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8040ce:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8040d2:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8040d6:	0f 8c 74 ff ff ff    	jl     804050 <copy_shared_pages+0x77>
  8040dc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8040e0:	48 3d ff 07 00 08    	cmp    $0x80007ff,%rax
  8040e6:	0f 86 05 ff ff ff    	jbe    803ff1 <copy_shared_pages+0x18>
  8040ec:	b8 00 00 00 00       	mov    $0x0,%eax
  8040f1:	c9                   	leaveq 
  8040f2:	c3                   	retq   

00000000008040f3 <fd2sockid>:
  8040f3:	55                   	push   %rbp
  8040f4:	48 89 e5             	mov    %rsp,%rbp
  8040f7:	48 83 ec 20          	sub    $0x20,%rsp
  8040fb:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8040fe:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  804102:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804105:	48 89 d6             	mov    %rdx,%rsi
  804108:	89 c7                	mov    %eax,%edi
  80410a:	48 b8 44 26 80 00 00 	movabs $0x802644,%rax
  804111:	00 00 00 
  804114:	ff d0                	callq  *%rax
  804116:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804119:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80411d:	79 05                	jns    804124 <fd2sockid+0x31>
  80411f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804122:	eb 24                	jmp    804148 <fd2sockid+0x55>
  804124:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804128:	8b 10                	mov    (%rax),%edx
  80412a:	48 b8 a0 80 80 00 00 	movabs $0x8080a0,%rax
  804131:	00 00 00 
  804134:	8b 00                	mov    (%rax),%eax
  804136:	39 c2                	cmp    %eax,%edx
  804138:	74 07                	je     804141 <fd2sockid+0x4e>
  80413a:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80413f:	eb 07                	jmp    804148 <fd2sockid+0x55>
  804141:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804145:	8b 40 0c             	mov    0xc(%rax),%eax
  804148:	c9                   	leaveq 
  804149:	c3                   	retq   

000000000080414a <alloc_sockfd>:
  80414a:	55                   	push   %rbp
  80414b:	48 89 e5             	mov    %rsp,%rbp
  80414e:	48 83 ec 20          	sub    $0x20,%rsp
  804152:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804155:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  804159:	48 89 c7             	mov    %rax,%rdi
  80415c:	48 b8 ac 25 80 00 00 	movabs $0x8025ac,%rax
  804163:	00 00 00 
  804166:	ff d0                	callq  *%rax
  804168:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80416b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80416f:	78 26                	js     804197 <alloc_sockfd+0x4d>
  804171:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804175:	ba 07 04 00 00       	mov    $0x407,%edx
  80417a:	48 89 c6             	mov    %rax,%rsi
  80417d:	bf 00 00 00 00       	mov    $0x0,%edi
  804182:	48 b8 6b 1a 80 00 00 	movabs $0x801a6b,%rax
  804189:	00 00 00 
  80418c:	ff d0                	callq  *%rax
  80418e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804191:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804195:	79 16                	jns    8041ad <alloc_sockfd+0x63>
  804197:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80419a:	89 c7                	mov    %eax,%edi
  80419c:	48 b8 57 46 80 00 00 	movabs $0x804657,%rax
  8041a3:	00 00 00 
  8041a6:	ff d0                	callq  *%rax
  8041a8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8041ab:	eb 3a                	jmp    8041e7 <alloc_sockfd+0x9d>
  8041ad:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8041b1:	48 ba a0 80 80 00 00 	movabs $0x8080a0,%rdx
  8041b8:	00 00 00 
  8041bb:	8b 12                	mov    (%rdx),%edx
  8041bd:	89 10                	mov    %edx,(%rax)
  8041bf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8041c3:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8041ca:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8041ce:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8041d1:	89 50 0c             	mov    %edx,0xc(%rax)
  8041d4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8041d8:	48 89 c7             	mov    %rax,%rdi
  8041db:	48 b8 5e 25 80 00 00 	movabs $0x80255e,%rax
  8041e2:	00 00 00 
  8041e5:	ff d0                	callq  *%rax
  8041e7:	c9                   	leaveq 
  8041e8:	c3                   	retq   

00000000008041e9 <accept>:
  8041e9:	55                   	push   %rbp
  8041ea:	48 89 e5             	mov    %rsp,%rbp
  8041ed:	48 83 ec 30          	sub    $0x30,%rsp
  8041f1:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8041f4:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8041f8:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8041fc:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8041ff:	89 c7                	mov    %eax,%edi
  804201:	48 b8 f3 40 80 00 00 	movabs $0x8040f3,%rax
  804208:	00 00 00 
  80420b:	ff d0                	callq  *%rax
  80420d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804210:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804214:	79 05                	jns    80421b <accept+0x32>
  804216:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804219:	eb 3b                	jmp    804256 <accept+0x6d>
  80421b:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80421f:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  804223:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804226:	48 89 ce             	mov    %rcx,%rsi
  804229:	89 c7                	mov    %eax,%edi
  80422b:	48 b8 34 45 80 00 00 	movabs $0x804534,%rax
  804232:	00 00 00 
  804235:	ff d0                	callq  *%rax
  804237:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80423a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80423e:	79 05                	jns    804245 <accept+0x5c>
  804240:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804243:	eb 11                	jmp    804256 <accept+0x6d>
  804245:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804248:	89 c7                	mov    %eax,%edi
  80424a:	48 b8 4a 41 80 00 00 	movabs $0x80414a,%rax
  804251:	00 00 00 
  804254:	ff d0                	callq  *%rax
  804256:	c9                   	leaveq 
  804257:	c3                   	retq   

0000000000804258 <bind>:
  804258:	55                   	push   %rbp
  804259:	48 89 e5             	mov    %rsp,%rbp
  80425c:	48 83 ec 20          	sub    $0x20,%rsp
  804260:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804263:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804267:	89 55 e8             	mov    %edx,-0x18(%rbp)
  80426a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80426d:	89 c7                	mov    %eax,%edi
  80426f:	48 b8 f3 40 80 00 00 	movabs $0x8040f3,%rax
  804276:	00 00 00 
  804279:	ff d0                	callq  *%rax
  80427b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80427e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804282:	79 05                	jns    804289 <bind+0x31>
  804284:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804287:	eb 1b                	jmp    8042a4 <bind+0x4c>
  804289:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80428c:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  804290:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804293:	48 89 ce             	mov    %rcx,%rsi
  804296:	89 c7                	mov    %eax,%edi
  804298:	48 b8 b3 45 80 00 00 	movabs $0x8045b3,%rax
  80429f:	00 00 00 
  8042a2:	ff d0                	callq  *%rax
  8042a4:	c9                   	leaveq 
  8042a5:	c3                   	retq   

00000000008042a6 <shutdown>:
  8042a6:	55                   	push   %rbp
  8042a7:	48 89 e5             	mov    %rsp,%rbp
  8042aa:	48 83 ec 20          	sub    $0x20,%rsp
  8042ae:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8042b1:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8042b4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8042b7:	89 c7                	mov    %eax,%edi
  8042b9:	48 b8 f3 40 80 00 00 	movabs $0x8040f3,%rax
  8042c0:	00 00 00 
  8042c3:	ff d0                	callq  *%rax
  8042c5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8042c8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8042cc:	79 05                	jns    8042d3 <shutdown+0x2d>
  8042ce:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8042d1:	eb 16                	jmp    8042e9 <shutdown+0x43>
  8042d3:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8042d6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8042d9:	89 d6                	mov    %edx,%esi
  8042db:	89 c7                	mov    %eax,%edi
  8042dd:	48 b8 17 46 80 00 00 	movabs $0x804617,%rax
  8042e4:	00 00 00 
  8042e7:	ff d0                	callq  *%rax
  8042e9:	c9                   	leaveq 
  8042ea:	c3                   	retq   

00000000008042eb <devsock_close>:
  8042eb:	55                   	push   %rbp
  8042ec:	48 89 e5             	mov    %rsp,%rbp
  8042ef:	48 83 ec 10          	sub    $0x10,%rsp
  8042f3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8042f7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8042fb:	48 89 c7             	mov    %rax,%rdi
  8042fe:	48 b8 01 55 80 00 00 	movabs $0x805501,%rax
  804305:	00 00 00 
  804308:	ff d0                	callq  *%rax
  80430a:	83 f8 01             	cmp    $0x1,%eax
  80430d:	75 17                	jne    804326 <devsock_close+0x3b>
  80430f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804313:	8b 40 0c             	mov    0xc(%rax),%eax
  804316:	89 c7                	mov    %eax,%edi
  804318:	48 b8 57 46 80 00 00 	movabs $0x804657,%rax
  80431f:	00 00 00 
  804322:	ff d0                	callq  *%rax
  804324:	eb 05                	jmp    80432b <devsock_close+0x40>
  804326:	b8 00 00 00 00       	mov    $0x0,%eax
  80432b:	c9                   	leaveq 
  80432c:	c3                   	retq   

000000000080432d <connect>:
  80432d:	55                   	push   %rbp
  80432e:	48 89 e5             	mov    %rsp,%rbp
  804331:	48 83 ec 20          	sub    $0x20,%rsp
  804335:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804338:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80433c:	89 55 e8             	mov    %edx,-0x18(%rbp)
  80433f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804342:	89 c7                	mov    %eax,%edi
  804344:	48 b8 f3 40 80 00 00 	movabs $0x8040f3,%rax
  80434b:	00 00 00 
  80434e:	ff d0                	callq  *%rax
  804350:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804353:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804357:	79 05                	jns    80435e <connect+0x31>
  804359:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80435c:	eb 1b                	jmp    804379 <connect+0x4c>
  80435e:	8b 55 e8             	mov    -0x18(%rbp),%edx
  804361:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  804365:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804368:	48 89 ce             	mov    %rcx,%rsi
  80436b:	89 c7                	mov    %eax,%edi
  80436d:	48 b8 84 46 80 00 00 	movabs $0x804684,%rax
  804374:	00 00 00 
  804377:	ff d0                	callq  *%rax
  804379:	c9                   	leaveq 
  80437a:	c3                   	retq   

000000000080437b <listen>:
  80437b:	55                   	push   %rbp
  80437c:	48 89 e5             	mov    %rsp,%rbp
  80437f:	48 83 ec 20          	sub    $0x20,%rsp
  804383:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804386:	89 75 e8             	mov    %esi,-0x18(%rbp)
  804389:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80438c:	89 c7                	mov    %eax,%edi
  80438e:	48 b8 f3 40 80 00 00 	movabs $0x8040f3,%rax
  804395:	00 00 00 
  804398:	ff d0                	callq  *%rax
  80439a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80439d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8043a1:	79 05                	jns    8043a8 <listen+0x2d>
  8043a3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8043a6:	eb 16                	jmp    8043be <listen+0x43>
  8043a8:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8043ab:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8043ae:	89 d6                	mov    %edx,%esi
  8043b0:	89 c7                	mov    %eax,%edi
  8043b2:	48 b8 e8 46 80 00 00 	movabs $0x8046e8,%rax
  8043b9:	00 00 00 
  8043bc:	ff d0                	callq  *%rax
  8043be:	c9                   	leaveq 
  8043bf:	c3                   	retq   

00000000008043c0 <devsock_read>:
  8043c0:	55                   	push   %rbp
  8043c1:	48 89 e5             	mov    %rsp,%rbp
  8043c4:	48 83 ec 20          	sub    $0x20,%rsp
  8043c8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8043cc:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8043d0:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8043d4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8043d8:	89 c2                	mov    %eax,%edx
  8043da:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8043de:	8b 40 0c             	mov    0xc(%rax),%eax
  8043e1:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  8043e5:	b9 00 00 00 00       	mov    $0x0,%ecx
  8043ea:	89 c7                	mov    %eax,%edi
  8043ec:	48 b8 28 47 80 00 00 	movabs $0x804728,%rax
  8043f3:	00 00 00 
  8043f6:	ff d0                	callq  *%rax
  8043f8:	c9                   	leaveq 
  8043f9:	c3                   	retq   

00000000008043fa <devsock_write>:
  8043fa:	55                   	push   %rbp
  8043fb:	48 89 e5             	mov    %rsp,%rbp
  8043fe:	48 83 ec 20          	sub    $0x20,%rsp
  804402:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804406:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80440a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80440e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804412:	89 c2                	mov    %eax,%edx
  804414:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804418:	8b 40 0c             	mov    0xc(%rax),%eax
  80441b:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  80441f:	b9 00 00 00 00       	mov    $0x0,%ecx
  804424:	89 c7                	mov    %eax,%edi
  804426:	48 b8 f4 47 80 00 00 	movabs $0x8047f4,%rax
  80442d:	00 00 00 
  804430:	ff d0                	callq  *%rax
  804432:	c9                   	leaveq 
  804433:	c3                   	retq   

0000000000804434 <devsock_stat>:
  804434:	55                   	push   %rbp
  804435:	48 89 e5             	mov    %rsp,%rbp
  804438:	48 83 ec 10          	sub    $0x10,%rsp
  80443c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804440:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804444:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804448:	48 be 75 5e 80 00 00 	movabs $0x805e75,%rsi
  80444f:	00 00 00 
  804452:	48 89 c7             	mov    %rax,%rdi
  804455:	48 b8 3c 11 80 00 00 	movabs $0x80113c,%rax
  80445c:	00 00 00 
  80445f:	ff d0                	callq  *%rax
  804461:	b8 00 00 00 00       	mov    $0x0,%eax
  804466:	c9                   	leaveq 
  804467:	c3                   	retq   

0000000000804468 <socket>:
  804468:	55                   	push   %rbp
  804469:	48 89 e5             	mov    %rsp,%rbp
  80446c:	48 83 ec 20          	sub    $0x20,%rsp
  804470:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804473:	89 75 e8             	mov    %esi,-0x18(%rbp)
  804476:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  804479:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  80447c:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  80447f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804482:	89 ce                	mov    %ecx,%esi
  804484:	89 c7                	mov    %eax,%edi
  804486:	48 b8 ac 48 80 00 00 	movabs $0x8048ac,%rax
  80448d:	00 00 00 
  804490:	ff d0                	callq  *%rax
  804492:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804495:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804499:	79 05                	jns    8044a0 <socket+0x38>
  80449b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80449e:	eb 11                	jmp    8044b1 <socket+0x49>
  8044a0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8044a3:	89 c7                	mov    %eax,%edi
  8044a5:	48 b8 4a 41 80 00 00 	movabs $0x80414a,%rax
  8044ac:	00 00 00 
  8044af:	ff d0                	callq  *%rax
  8044b1:	c9                   	leaveq 
  8044b2:	c3                   	retq   

00000000008044b3 <nsipc>:
  8044b3:	55                   	push   %rbp
  8044b4:	48 89 e5             	mov    %rsp,%rbp
  8044b7:	48 83 ec 10          	sub    $0x10,%rsp
  8044bb:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8044be:	48 b8 04 90 80 00 00 	movabs $0x809004,%rax
  8044c5:	00 00 00 
  8044c8:	8b 00                	mov    (%rax),%eax
  8044ca:	85 c0                	test   %eax,%eax
  8044cc:	75 1d                	jne    8044eb <nsipc+0x38>
  8044ce:	bf 02 00 00 00       	mov    $0x2,%edi
  8044d3:	48 b8 8f 54 80 00 00 	movabs $0x80548f,%rax
  8044da:	00 00 00 
  8044dd:	ff d0                	callq  *%rax
  8044df:	48 ba 04 90 80 00 00 	movabs $0x809004,%rdx
  8044e6:	00 00 00 
  8044e9:	89 02                	mov    %eax,(%rdx)
  8044eb:	48 b8 04 90 80 00 00 	movabs $0x809004,%rax
  8044f2:	00 00 00 
  8044f5:	8b 00                	mov    (%rax),%eax
  8044f7:	8b 75 fc             	mov    -0x4(%rbp),%esi
  8044fa:	b9 07 00 00 00       	mov    $0x7,%ecx
  8044ff:	48 ba 00 c0 80 00 00 	movabs $0x80c000,%rdx
  804506:	00 00 00 
  804509:	89 c7                	mov    %eax,%edi
  80450b:	48 b8 f9 53 80 00 00 	movabs $0x8053f9,%rax
  804512:	00 00 00 
  804515:	ff d0                	callq  *%rax
  804517:	ba 00 00 00 00       	mov    $0x0,%edx
  80451c:	be 00 00 00 00       	mov    $0x0,%esi
  804521:	bf 00 00 00 00       	mov    $0x0,%edi
  804526:	48 b8 38 53 80 00 00 	movabs $0x805338,%rax
  80452d:	00 00 00 
  804530:	ff d0                	callq  *%rax
  804532:	c9                   	leaveq 
  804533:	c3                   	retq   

0000000000804534 <nsipc_accept>:
  804534:	55                   	push   %rbp
  804535:	48 89 e5             	mov    %rsp,%rbp
  804538:	48 83 ec 30          	sub    $0x30,%rsp
  80453c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80453f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804543:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804547:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  80454e:	00 00 00 
  804551:	8b 55 ec             	mov    -0x14(%rbp),%edx
  804554:	89 10                	mov    %edx,(%rax)
  804556:	bf 01 00 00 00       	mov    $0x1,%edi
  80455b:	48 b8 b3 44 80 00 00 	movabs $0x8044b3,%rax
  804562:	00 00 00 
  804565:	ff d0                	callq  *%rax
  804567:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80456a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80456e:	78 3e                	js     8045ae <nsipc_accept+0x7a>
  804570:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804577:	00 00 00 
  80457a:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80457e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804582:	8b 40 10             	mov    0x10(%rax),%eax
  804585:	89 c2                	mov    %eax,%edx
  804587:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  80458b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80458f:	48 89 ce             	mov    %rcx,%rsi
  804592:	48 89 c7             	mov    %rax,%rdi
  804595:	48 b8 60 14 80 00 00 	movabs $0x801460,%rax
  80459c:	00 00 00 
  80459f:	ff d0                	callq  *%rax
  8045a1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8045a5:	8b 50 10             	mov    0x10(%rax),%edx
  8045a8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8045ac:	89 10                	mov    %edx,(%rax)
  8045ae:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8045b1:	c9                   	leaveq 
  8045b2:	c3                   	retq   

00000000008045b3 <nsipc_bind>:
  8045b3:	55                   	push   %rbp
  8045b4:	48 89 e5             	mov    %rsp,%rbp
  8045b7:	48 83 ec 10          	sub    $0x10,%rsp
  8045bb:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8045be:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8045c2:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8045c5:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8045cc:	00 00 00 
  8045cf:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8045d2:	89 10                	mov    %edx,(%rax)
  8045d4:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8045d7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8045db:	48 89 c6             	mov    %rax,%rsi
  8045de:	48 bf 04 c0 80 00 00 	movabs $0x80c004,%rdi
  8045e5:	00 00 00 
  8045e8:	48 b8 60 14 80 00 00 	movabs $0x801460,%rax
  8045ef:	00 00 00 
  8045f2:	ff d0                	callq  *%rax
  8045f4:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8045fb:	00 00 00 
  8045fe:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804601:	89 50 14             	mov    %edx,0x14(%rax)
  804604:	bf 02 00 00 00       	mov    $0x2,%edi
  804609:	48 b8 b3 44 80 00 00 	movabs $0x8044b3,%rax
  804610:	00 00 00 
  804613:	ff d0                	callq  *%rax
  804615:	c9                   	leaveq 
  804616:	c3                   	retq   

0000000000804617 <nsipc_shutdown>:
  804617:	55                   	push   %rbp
  804618:	48 89 e5             	mov    %rsp,%rbp
  80461b:	48 83 ec 10          	sub    $0x10,%rsp
  80461f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804622:	89 75 f8             	mov    %esi,-0x8(%rbp)
  804625:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  80462c:	00 00 00 
  80462f:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804632:	89 10                	mov    %edx,(%rax)
  804634:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  80463b:	00 00 00 
  80463e:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804641:	89 50 04             	mov    %edx,0x4(%rax)
  804644:	bf 03 00 00 00       	mov    $0x3,%edi
  804649:	48 b8 b3 44 80 00 00 	movabs $0x8044b3,%rax
  804650:	00 00 00 
  804653:	ff d0                	callq  *%rax
  804655:	c9                   	leaveq 
  804656:	c3                   	retq   

0000000000804657 <nsipc_close>:
  804657:	55                   	push   %rbp
  804658:	48 89 e5             	mov    %rsp,%rbp
  80465b:	48 83 ec 10          	sub    $0x10,%rsp
  80465f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804662:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804669:	00 00 00 
  80466c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80466f:	89 10                	mov    %edx,(%rax)
  804671:	bf 04 00 00 00       	mov    $0x4,%edi
  804676:	48 b8 b3 44 80 00 00 	movabs $0x8044b3,%rax
  80467d:	00 00 00 
  804680:	ff d0                	callq  *%rax
  804682:	c9                   	leaveq 
  804683:	c3                   	retq   

0000000000804684 <nsipc_connect>:
  804684:	55                   	push   %rbp
  804685:	48 89 e5             	mov    %rsp,%rbp
  804688:	48 83 ec 10          	sub    $0x10,%rsp
  80468c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80468f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804693:	89 55 f8             	mov    %edx,-0x8(%rbp)
  804696:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  80469d:	00 00 00 
  8046a0:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8046a3:	89 10                	mov    %edx,(%rax)
  8046a5:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8046a8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8046ac:	48 89 c6             	mov    %rax,%rsi
  8046af:	48 bf 04 c0 80 00 00 	movabs $0x80c004,%rdi
  8046b6:	00 00 00 
  8046b9:	48 b8 60 14 80 00 00 	movabs $0x801460,%rax
  8046c0:	00 00 00 
  8046c3:	ff d0                	callq  *%rax
  8046c5:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8046cc:	00 00 00 
  8046cf:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8046d2:	89 50 14             	mov    %edx,0x14(%rax)
  8046d5:	bf 05 00 00 00       	mov    $0x5,%edi
  8046da:	48 b8 b3 44 80 00 00 	movabs $0x8044b3,%rax
  8046e1:	00 00 00 
  8046e4:	ff d0                	callq  *%rax
  8046e6:	c9                   	leaveq 
  8046e7:	c3                   	retq   

00000000008046e8 <nsipc_listen>:
  8046e8:	55                   	push   %rbp
  8046e9:	48 89 e5             	mov    %rsp,%rbp
  8046ec:	48 83 ec 10          	sub    $0x10,%rsp
  8046f0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8046f3:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8046f6:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8046fd:	00 00 00 
  804700:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804703:	89 10                	mov    %edx,(%rax)
  804705:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  80470c:	00 00 00 
  80470f:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804712:	89 50 04             	mov    %edx,0x4(%rax)
  804715:	bf 06 00 00 00       	mov    $0x6,%edi
  80471a:	48 b8 b3 44 80 00 00 	movabs $0x8044b3,%rax
  804721:	00 00 00 
  804724:	ff d0                	callq  *%rax
  804726:	c9                   	leaveq 
  804727:	c3                   	retq   

0000000000804728 <nsipc_recv>:
  804728:	55                   	push   %rbp
  804729:	48 89 e5             	mov    %rsp,%rbp
  80472c:	48 83 ec 30          	sub    $0x30,%rsp
  804730:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804733:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804737:	89 55 e8             	mov    %edx,-0x18(%rbp)
  80473a:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  80473d:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804744:	00 00 00 
  804747:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80474a:	89 10                	mov    %edx,(%rax)
  80474c:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804753:	00 00 00 
  804756:	8b 55 e8             	mov    -0x18(%rbp),%edx
  804759:	89 50 04             	mov    %edx,0x4(%rax)
  80475c:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804763:	00 00 00 
  804766:	8b 55 dc             	mov    -0x24(%rbp),%edx
  804769:	89 50 08             	mov    %edx,0x8(%rax)
  80476c:	bf 07 00 00 00       	mov    $0x7,%edi
  804771:	48 b8 b3 44 80 00 00 	movabs $0x8044b3,%rax
  804778:	00 00 00 
  80477b:	ff d0                	callq  *%rax
  80477d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804780:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804784:	78 69                	js     8047ef <nsipc_recv+0xc7>
  804786:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  80478d:	7f 08                	jg     804797 <nsipc_recv+0x6f>
  80478f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804792:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  804795:	7e 35                	jle    8047cc <nsipc_recv+0xa4>
  804797:	48 b9 7c 5e 80 00 00 	movabs $0x805e7c,%rcx
  80479e:	00 00 00 
  8047a1:	48 ba 91 5e 80 00 00 	movabs $0x805e91,%rdx
  8047a8:	00 00 00 
  8047ab:	be 62 00 00 00       	mov    $0x62,%esi
  8047b0:	48 bf a6 5e 80 00 00 	movabs $0x805ea6,%rdi
  8047b7:	00 00 00 
  8047ba:	b8 00 00 00 00       	mov    $0x0,%eax
  8047bf:	49 b8 4e 03 80 00 00 	movabs $0x80034e,%r8
  8047c6:	00 00 00 
  8047c9:	41 ff d0             	callq  *%r8
  8047cc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8047cf:	48 63 d0             	movslq %eax,%rdx
  8047d2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8047d6:	48 be 00 c0 80 00 00 	movabs $0x80c000,%rsi
  8047dd:	00 00 00 
  8047e0:	48 89 c7             	mov    %rax,%rdi
  8047e3:	48 b8 60 14 80 00 00 	movabs $0x801460,%rax
  8047ea:	00 00 00 
  8047ed:	ff d0                	callq  *%rax
  8047ef:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8047f2:	c9                   	leaveq 
  8047f3:	c3                   	retq   

00000000008047f4 <nsipc_send>:
  8047f4:	55                   	push   %rbp
  8047f5:	48 89 e5             	mov    %rsp,%rbp
  8047f8:	48 83 ec 20          	sub    $0x20,%rsp
  8047fc:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8047ff:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804803:	89 55 f8             	mov    %edx,-0x8(%rbp)
  804806:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  804809:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804810:	00 00 00 
  804813:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804816:	89 10                	mov    %edx,(%rax)
  804818:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  80481f:	7e 35                	jle    804856 <nsipc_send+0x62>
  804821:	48 b9 b5 5e 80 00 00 	movabs $0x805eb5,%rcx
  804828:	00 00 00 
  80482b:	48 ba 91 5e 80 00 00 	movabs $0x805e91,%rdx
  804832:	00 00 00 
  804835:	be 6d 00 00 00       	mov    $0x6d,%esi
  80483a:	48 bf a6 5e 80 00 00 	movabs $0x805ea6,%rdi
  804841:	00 00 00 
  804844:	b8 00 00 00 00       	mov    $0x0,%eax
  804849:	49 b8 4e 03 80 00 00 	movabs $0x80034e,%r8
  804850:	00 00 00 
  804853:	41 ff d0             	callq  *%r8
  804856:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804859:	48 63 d0             	movslq %eax,%rdx
  80485c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804860:	48 89 c6             	mov    %rax,%rsi
  804863:	48 bf 0c c0 80 00 00 	movabs $0x80c00c,%rdi
  80486a:	00 00 00 
  80486d:	48 b8 60 14 80 00 00 	movabs $0x801460,%rax
  804874:	00 00 00 
  804877:	ff d0                	callq  *%rax
  804879:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804880:	00 00 00 
  804883:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804886:	89 50 04             	mov    %edx,0x4(%rax)
  804889:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804890:	00 00 00 
  804893:	8b 55 ec             	mov    -0x14(%rbp),%edx
  804896:	89 50 08             	mov    %edx,0x8(%rax)
  804899:	bf 08 00 00 00       	mov    $0x8,%edi
  80489e:	48 b8 b3 44 80 00 00 	movabs $0x8044b3,%rax
  8048a5:	00 00 00 
  8048a8:	ff d0                	callq  *%rax
  8048aa:	c9                   	leaveq 
  8048ab:	c3                   	retq   

00000000008048ac <nsipc_socket>:
  8048ac:	55                   	push   %rbp
  8048ad:	48 89 e5             	mov    %rsp,%rbp
  8048b0:	48 83 ec 10          	sub    $0x10,%rsp
  8048b4:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8048b7:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8048ba:	89 55 f4             	mov    %edx,-0xc(%rbp)
  8048bd:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8048c4:	00 00 00 
  8048c7:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8048ca:	89 10                	mov    %edx,(%rax)
  8048cc:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8048d3:	00 00 00 
  8048d6:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8048d9:	89 50 04             	mov    %edx,0x4(%rax)
  8048dc:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8048e3:	00 00 00 
  8048e6:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8048e9:	89 50 08             	mov    %edx,0x8(%rax)
  8048ec:	bf 09 00 00 00       	mov    $0x9,%edi
  8048f1:	48 b8 b3 44 80 00 00 	movabs $0x8044b3,%rax
  8048f8:	00 00 00 
  8048fb:	ff d0                	callq  *%rax
  8048fd:	c9                   	leaveq 
  8048fe:	c3                   	retq   

00000000008048ff <pipe>:
  8048ff:	55                   	push   %rbp
  804900:	48 89 e5             	mov    %rsp,%rbp
  804903:	53                   	push   %rbx
  804904:	48 83 ec 38          	sub    $0x38,%rsp
  804908:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  80490c:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  804910:	48 89 c7             	mov    %rax,%rdi
  804913:	48 b8 ac 25 80 00 00 	movabs $0x8025ac,%rax
  80491a:	00 00 00 
  80491d:	ff d0                	callq  *%rax
  80491f:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804922:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804926:	0f 88 bf 01 00 00    	js     804aeb <pipe+0x1ec>
  80492c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804930:	ba 07 04 00 00       	mov    $0x407,%edx
  804935:	48 89 c6             	mov    %rax,%rsi
  804938:	bf 00 00 00 00       	mov    $0x0,%edi
  80493d:	48 b8 6b 1a 80 00 00 	movabs $0x801a6b,%rax
  804944:	00 00 00 
  804947:	ff d0                	callq  *%rax
  804949:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80494c:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804950:	0f 88 95 01 00 00    	js     804aeb <pipe+0x1ec>
  804956:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  80495a:	48 89 c7             	mov    %rax,%rdi
  80495d:	48 b8 ac 25 80 00 00 	movabs $0x8025ac,%rax
  804964:	00 00 00 
  804967:	ff d0                	callq  *%rax
  804969:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80496c:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804970:	0f 88 5d 01 00 00    	js     804ad3 <pipe+0x1d4>
  804976:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80497a:	ba 07 04 00 00       	mov    $0x407,%edx
  80497f:	48 89 c6             	mov    %rax,%rsi
  804982:	bf 00 00 00 00       	mov    $0x0,%edi
  804987:	48 b8 6b 1a 80 00 00 	movabs $0x801a6b,%rax
  80498e:	00 00 00 
  804991:	ff d0                	callq  *%rax
  804993:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804996:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80499a:	0f 88 33 01 00 00    	js     804ad3 <pipe+0x1d4>
  8049a0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8049a4:	48 89 c7             	mov    %rax,%rdi
  8049a7:	48 b8 81 25 80 00 00 	movabs $0x802581,%rax
  8049ae:	00 00 00 
  8049b1:	ff d0                	callq  *%rax
  8049b3:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8049b7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8049bb:	ba 07 04 00 00       	mov    $0x407,%edx
  8049c0:	48 89 c6             	mov    %rax,%rsi
  8049c3:	bf 00 00 00 00       	mov    $0x0,%edi
  8049c8:	48 b8 6b 1a 80 00 00 	movabs $0x801a6b,%rax
  8049cf:	00 00 00 
  8049d2:	ff d0                	callq  *%rax
  8049d4:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8049d7:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8049db:	79 05                	jns    8049e2 <pipe+0xe3>
  8049dd:	e9 d9 00 00 00       	jmpq   804abb <pipe+0x1bc>
  8049e2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8049e6:	48 89 c7             	mov    %rax,%rdi
  8049e9:	48 b8 81 25 80 00 00 	movabs $0x802581,%rax
  8049f0:	00 00 00 
  8049f3:	ff d0                	callq  *%rax
  8049f5:	48 89 c2             	mov    %rax,%rdx
  8049f8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8049fc:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  804a02:	48 89 d1             	mov    %rdx,%rcx
  804a05:	ba 00 00 00 00       	mov    $0x0,%edx
  804a0a:	48 89 c6             	mov    %rax,%rsi
  804a0d:	bf 00 00 00 00       	mov    $0x0,%edi
  804a12:	48 b8 bb 1a 80 00 00 	movabs $0x801abb,%rax
  804a19:	00 00 00 
  804a1c:	ff d0                	callq  *%rax
  804a1e:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804a21:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804a25:	79 1b                	jns    804a42 <pipe+0x143>
  804a27:	90                   	nop
  804a28:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804a2c:	48 89 c6             	mov    %rax,%rsi
  804a2f:	bf 00 00 00 00       	mov    $0x0,%edi
  804a34:	48 b8 16 1b 80 00 00 	movabs $0x801b16,%rax
  804a3b:	00 00 00 
  804a3e:	ff d0                	callq  *%rax
  804a40:	eb 79                	jmp    804abb <pipe+0x1bc>
  804a42:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804a46:	48 ba e0 80 80 00 00 	movabs $0x8080e0,%rdx
  804a4d:	00 00 00 
  804a50:	8b 12                	mov    (%rdx),%edx
  804a52:	89 10                	mov    %edx,(%rax)
  804a54:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804a58:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  804a5f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804a63:	48 ba e0 80 80 00 00 	movabs $0x8080e0,%rdx
  804a6a:	00 00 00 
  804a6d:	8b 12                	mov    (%rdx),%edx
  804a6f:	89 10                	mov    %edx,(%rax)
  804a71:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804a75:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  804a7c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804a80:	48 89 c7             	mov    %rax,%rdi
  804a83:	48 b8 5e 25 80 00 00 	movabs $0x80255e,%rax
  804a8a:	00 00 00 
  804a8d:	ff d0                	callq  *%rax
  804a8f:	89 c2                	mov    %eax,%edx
  804a91:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  804a95:	89 10                	mov    %edx,(%rax)
  804a97:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  804a9b:	48 8d 58 04          	lea    0x4(%rax),%rbx
  804a9f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804aa3:	48 89 c7             	mov    %rax,%rdi
  804aa6:	48 b8 5e 25 80 00 00 	movabs $0x80255e,%rax
  804aad:	00 00 00 
  804ab0:	ff d0                	callq  *%rax
  804ab2:	89 03                	mov    %eax,(%rbx)
  804ab4:	b8 00 00 00 00       	mov    $0x0,%eax
  804ab9:	eb 33                	jmp    804aee <pipe+0x1ef>
  804abb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804abf:	48 89 c6             	mov    %rax,%rsi
  804ac2:	bf 00 00 00 00       	mov    $0x0,%edi
  804ac7:	48 b8 16 1b 80 00 00 	movabs $0x801b16,%rax
  804ace:	00 00 00 
  804ad1:	ff d0                	callq  *%rax
  804ad3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804ad7:	48 89 c6             	mov    %rax,%rsi
  804ada:	bf 00 00 00 00       	mov    $0x0,%edi
  804adf:	48 b8 16 1b 80 00 00 	movabs $0x801b16,%rax
  804ae6:	00 00 00 
  804ae9:	ff d0                	callq  *%rax
  804aeb:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804aee:	48 83 c4 38          	add    $0x38,%rsp
  804af2:	5b                   	pop    %rbx
  804af3:	5d                   	pop    %rbp
  804af4:	c3                   	retq   

0000000000804af5 <_pipeisclosed>:
  804af5:	55                   	push   %rbp
  804af6:	48 89 e5             	mov    %rsp,%rbp
  804af9:	53                   	push   %rbx
  804afa:	48 83 ec 28          	sub    $0x28,%rsp
  804afe:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804b02:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804b06:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  804b0d:	00 00 00 
  804b10:	48 8b 00             	mov    (%rax),%rax
  804b13:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  804b19:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804b1c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804b20:	48 89 c7             	mov    %rax,%rdi
  804b23:	48 b8 01 55 80 00 00 	movabs $0x805501,%rax
  804b2a:	00 00 00 
  804b2d:	ff d0                	callq  *%rax
  804b2f:	89 c3                	mov    %eax,%ebx
  804b31:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804b35:	48 89 c7             	mov    %rax,%rdi
  804b38:	48 b8 01 55 80 00 00 	movabs $0x805501,%rax
  804b3f:	00 00 00 
  804b42:	ff d0                	callq  *%rax
  804b44:	39 c3                	cmp    %eax,%ebx
  804b46:	0f 94 c0             	sete   %al
  804b49:	0f b6 c0             	movzbl %al,%eax
  804b4c:	89 45 e8             	mov    %eax,-0x18(%rbp)
  804b4f:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  804b56:	00 00 00 
  804b59:	48 8b 00             	mov    (%rax),%rax
  804b5c:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  804b62:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  804b65:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804b68:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  804b6b:	75 05                	jne    804b72 <_pipeisclosed+0x7d>
  804b6d:	8b 45 e8             	mov    -0x18(%rbp),%eax
  804b70:	eb 4f                	jmp    804bc1 <_pipeisclosed+0xcc>
  804b72:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804b75:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  804b78:	74 42                	je     804bbc <_pipeisclosed+0xc7>
  804b7a:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  804b7e:	75 3c                	jne    804bbc <_pipeisclosed+0xc7>
  804b80:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  804b87:	00 00 00 
  804b8a:	48 8b 00             	mov    (%rax),%rax
  804b8d:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  804b93:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  804b96:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804b99:	89 c6                	mov    %eax,%esi
  804b9b:	48 bf c6 5e 80 00 00 	movabs $0x805ec6,%rdi
  804ba2:	00 00 00 
  804ba5:	b8 00 00 00 00       	mov    $0x0,%eax
  804baa:	49 b8 87 05 80 00 00 	movabs $0x800587,%r8
  804bb1:	00 00 00 
  804bb4:	41 ff d0             	callq  *%r8
  804bb7:	e9 4a ff ff ff       	jmpq   804b06 <_pipeisclosed+0x11>
  804bbc:	e9 45 ff ff ff       	jmpq   804b06 <_pipeisclosed+0x11>
  804bc1:	48 83 c4 28          	add    $0x28,%rsp
  804bc5:	5b                   	pop    %rbx
  804bc6:	5d                   	pop    %rbp
  804bc7:	c3                   	retq   

0000000000804bc8 <pipeisclosed>:
  804bc8:	55                   	push   %rbp
  804bc9:	48 89 e5             	mov    %rsp,%rbp
  804bcc:	48 83 ec 30          	sub    $0x30,%rsp
  804bd0:	89 7d dc             	mov    %edi,-0x24(%rbp)
  804bd3:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  804bd7:	8b 45 dc             	mov    -0x24(%rbp),%eax
  804bda:	48 89 d6             	mov    %rdx,%rsi
  804bdd:	89 c7                	mov    %eax,%edi
  804bdf:	48 b8 44 26 80 00 00 	movabs $0x802644,%rax
  804be6:	00 00 00 
  804be9:	ff d0                	callq  *%rax
  804beb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804bee:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804bf2:	79 05                	jns    804bf9 <pipeisclosed+0x31>
  804bf4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804bf7:	eb 31                	jmp    804c2a <pipeisclosed+0x62>
  804bf9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804bfd:	48 89 c7             	mov    %rax,%rdi
  804c00:	48 b8 81 25 80 00 00 	movabs $0x802581,%rax
  804c07:	00 00 00 
  804c0a:	ff d0                	callq  *%rax
  804c0c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804c10:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804c14:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804c18:	48 89 d6             	mov    %rdx,%rsi
  804c1b:	48 89 c7             	mov    %rax,%rdi
  804c1e:	48 b8 f5 4a 80 00 00 	movabs $0x804af5,%rax
  804c25:	00 00 00 
  804c28:	ff d0                	callq  *%rax
  804c2a:	c9                   	leaveq 
  804c2b:	c3                   	retq   

0000000000804c2c <devpipe_read>:
  804c2c:	55                   	push   %rbp
  804c2d:	48 89 e5             	mov    %rsp,%rbp
  804c30:	48 83 ec 40          	sub    $0x40,%rsp
  804c34:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804c38:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804c3c:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  804c40:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804c44:	48 89 c7             	mov    %rax,%rdi
  804c47:	48 b8 81 25 80 00 00 	movabs $0x802581,%rax
  804c4e:	00 00 00 
  804c51:	ff d0                	callq  *%rax
  804c53:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804c57:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804c5b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804c5f:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804c66:	00 
  804c67:	e9 92 00 00 00       	jmpq   804cfe <devpipe_read+0xd2>
  804c6c:	eb 41                	jmp    804caf <devpipe_read+0x83>
  804c6e:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  804c73:	74 09                	je     804c7e <devpipe_read+0x52>
  804c75:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804c79:	e9 92 00 00 00       	jmpq   804d10 <devpipe_read+0xe4>
  804c7e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804c82:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804c86:	48 89 d6             	mov    %rdx,%rsi
  804c89:	48 89 c7             	mov    %rax,%rdi
  804c8c:	48 b8 f5 4a 80 00 00 	movabs $0x804af5,%rax
  804c93:	00 00 00 
  804c96:	ff d0                	callq  *%rax
  804c98:	85 c0                	test   %eax,%eax
  804c9a:	74 07                	je     804ca3 <devpipe_read+0x77>
  804c9c:	b8 00 00 00 00       	mov    $0x0,%eax
  804ca1:	eb 6d                	jmp    804d10 <devpipe_read+0xe4>
  804ca3:	48 b8 2d 1a 80 00 00 	movabs $0x801a2d,%rax
  804caa:	00 00 00 
  804cad:	ff d0                	callq  *%rax
  804caf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804cb3:	8b 10                	mov    (%rax),%edx
  804cb5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804cb9:	8b 40 04             	mov    0x4(%rax),%eax
  804cbc:	39 c2                	cmp    %eax,%edx
  804cbe:	74 ae                	je     804c6e <devpipe_read+0x42>
  804cc0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804cc4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804cc8:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  804ccc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804cd0:	8b 00                	mov    (%rax),%eax
  804cd2:	99                   	cltd   
  804cd3:	c1 ea 1b             	shr    $0x1b,%edx
  804cd6:	01 d0                	add    %edx,%eax
  804cd8:	83 e0 1f             	and    $0x1f,%eax
  804cdb:	29 d0                	sub    %edx,%eax
  804cdd:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804ce1:	48 98                	cltq   
  804ce3:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  804ce8:	88 01                	mov    %al,(%rcx)
  804cea:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804cee:	8b 00                	mov    (%rax),%eax
  804cf0:	8d 50 01             	lea    0x1(%rax),%edx
  804cf3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804cf7:	89 10                	mov    %edx,(%rax)
  804cf9:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  804cfe:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804d02:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  804d06:	0f 82 60 ff ff ff    	jb     804c6c <devpipe_read+0x40>
  804d0c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804d10:	c9                   	leaveq 
  804d11:	c3                   	retq   

0000000000804d12 <devpipe_write>:
  804d12:	55                   	push   %rbp
  804d13:	48 89 e5             	mov    %rsp,%rbp
  804d16:	48 83 ec 40          	sub    $0x40,%rsp
  804d1a:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804d1e:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804d22:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  804d26:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804d2a:	48 89 c7             	mov    %rax,%rdi
  804d2d:	48 b8 81 25 80 00 00 	movabs $0x802581,%rax
  804d34:	00 00 00 
  804d37:	ff d0                	callq  *%rax
  804d39:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804d3d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804d41:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804d45:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804d4c:	00 
  804d4d:	e9 8e 00 00 00       	jmpq   804de0 <devpipe_write+0xce>
  804d52:	eb 31                	jmp    804d85 <devpipe_write+0x73>
  804d54:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804d58:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804d5c:	48 89 d6             	mov    %rdx,%rsi
  804d5f:	48 89 c7             	mov    %rax,%rdi
  804d62:	48 b8 f5 4a 80 00 00 	movabs $0x804af5,%rax
  804d69:	00 00 00 
  804d6c:	ff d0                	callq  *%rax
  804d6e:	85 c0                	test   %eax,%eax
  804d70:	74 07                	je     804d79 <devpipe_write+0x67>
  804d72:	b8 00 00 00 00       	mov    $0x0,%eax
  804d77:	eb 79                	jmp    804df2 <devpipe_write+0xe0>
  804d79:	48 b8 2d 1a 80 00 00 	movabs $0x801a2d,%rax
  804d80:	00 00 00 
  804d83:	ff d0                	callq  *%rax
  804d85:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804d89:	8b 40 04             	mov    0x4(%rax),%eax
  804d8c:	48 63 d0             	movslq %eax,%rdx
  804d8f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804d93:	8b 00                	mov    (%rax),%eax
  804d95:	48 98                	cltq   
  804d97:	48 83 c0 20          	add    $0x20,%rax
  804d9b:	48 39 c2             	cmp    %rax,%rdx
  804d9e:	73 b4                	jae    804d54 <devpipe_write+0x42>
  804da0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804da4:	8b 40 04             	mov    0x4(%rax),%eax
  804da7:	99                   	cltd   
  804da8:	c1 ea 1b             	shr    $0x1b,%edx
  804dab:	01 d0                	add    %edx,%eax
  804dad:	83 e0 1f             	and    $0x1f,%eax
  804db0:	29 d0                	sub    %edx,%eax
  804db2:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  804db6:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  804dba:	48 01 ca             	add    %rcx,%rdx
  804dbd:	0f b6 0a             	movzbl (%rdx),%ecx
  804dc0:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804dc4:	48 98                	cltq   
  804dc6:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  804dca:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804dce:	8b 40 04             	mov    0x4(%rax),%eax
  804dd1:	8d 50 01             	lea    0x1(%rax),%edx
  804dd4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804dd8:	89 50 04             	mov    %edx,0x4(%rax)
  804ddb:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  804de0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804de4:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  804de8:	0f 82 64 ff ff ff    	jb     804d52 <devpipe_write+0x40>
  804dee:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804df2:	c9                   	leaveq 
  804df3:	c3                   	retq   

0000000000804df4 <devpipe_stat>:
  804df4:	55                   	push   %rbp
  804df5:	48 89 e5             	mov    %rsp,%rbp
  804df8:	48 83 ec 20          	sub    $0x20,%rsp
  804dfc:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804e00:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804e04:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804e08:	48 89 c7             	mov    %rax,%rdi
  804e0b:	48 b8 81 25 80 00 00 	movabs $0x802581,%rax
  804e12:	00 00 00 
  804e15:	ff d0                	callq  *%rax
  804e17:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804e1b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804e1f:	48 be d9 5e 80 00 00 	movabs $0x805ed9,%rsi
  804e26:	00 00 00 
  804e29:	48 89 c7             	mov    %rax,%rdi
  804e2c:	48 b8 3c 11 80 00 00 	movabs $0x80113c,%rax
  804e33:	00 00 00 
  804e36:	ff d0                	callq  *%rax
  804e38:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804e3c:	8b 50 04             	mov    0x4(%rax),%edx
  804e3f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804e43:	8b 00                	mov    (%rax),%eax
  804e45:	29 c2                	sub    %eax,%edx
  804e47:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804e4b:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  804e51:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804e55:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  804e5c:	00 00 00 
  804e5f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804e63:	48 b9 e0 80 80 00 00 	movabs $0x8080e0,%rcx
  804e6a:	00 00 00 
  804e6d:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  804e74:	b8 00 00 00 00       	mov    $0x0,%eax
  804e79:	c9                   	leaveq 
  804e7a:	c3                   	retq   

0000000000804e7b <devpipe_close>:
  804e7b:	55                   	push   %rbp
  804e7c:	48 89 e5             	mov    %rsp,%rbp
  804e7f:	48 83 ec 10          	sub    $0x10,%rsp
  804e83:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804e87:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804e8b:	48 89 c6             	mov    %rax,%rsi
  804e8e:	bf 00 00 00 00       	mov    $0x0,%edi
  804e93:	48 b8 16 1b 80 00 00 	movabs $0x801b16,%rax
  804e9a:	00 00 00 
  804e9d:	ff d0                	callq  *%rax
  804e9f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804ea3:	48 89 c7             	mov    %rax,%rdi
  804ea6:	48 b8 81 25 80 00 00 	movabs $0x802581,%rax
  804ead:	00 00 00 
  804eb0:	ff d0                	callq  *%rax
  804eb2:	48 89 c6             	mov    %rax,%rsi
  804eb5:	bf 00 00 00 00       	mov    $0x0,%edi
  804eba:	48 b8 16 1b 80 00 00 	movabs $0x801b16,%rax
  804ec1:	00 00 00 
  804ec4:	ff d0                	callq  *%rax
  804ec6:	c9                   	leaveq 
  804ec7:	c3                   	retq   

0000000000804ec8 <wait>:
  804ec8:	55                   	push   %rbp
  804ec9:	48 89 e5             	mov    %rsp,%rbp
  804ecc:	48 83 ec 20          	sub    $0x20,%rsp
  804ed0:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804ed3:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804ed7:	75 35                	jne    804f0e <wait+0x46>
  804ed9:	48 b9 e0 5e 80 00 00 	movabs $0x805ee0,%rcx
  804ee0:	00 00 00 
  804ee3:	48 ba eb 5e 80 00 00 	movabs $0x805eeb,%rdx
  804eea:	00 00 00 
  804eed:	be 0a 00 00 00       	mov    $0xa,%esi
  804ef2:	48 bf 00 5f 80 00 00 	movabs $0x805f00,%rdi
  804ef9:	00 00 00 
  804efc:	b8 00 00 00 00       	mov    $0x0,%eax
  804f01:	49 b8 4e 03 80 00 00 	movabs $0x80034e,%r8
  804f08:	00 00 00 
  804f0b:	41 ff d0             	callq  *%r8
  804f0e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804f11:	25 ff 03 00 00       	and    $0x3ff,%eax
  804f16:	48 98                	cltq   
  804f18:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  804f1f:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804f26:	00 00 00 
  804f29:	48 01 d0             	add    %rdx,%rax
  804f2c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804f30:	eb 0c                	jmp    804f3e <wait+0x76>
  804f32:	48 b8 2d 1a 80 00 00 	movabs $0x801a2d,%rax
  804f39:	00 00 00 
  804f3c:	ff d0                	callq  *%rax
  804f3e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804f42:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  804f48:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  804f4b:	75 0e                	jne    804f5b <wait+0x93>
  804f4d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804f51:	8b 80 d4 00 00 00    	mov    0xd4(%rax),%eax
  804f57:	85 c0                	test   %eax,%eax
  804f59:	75 d7                	jne    804f32 <wait+0x6a>
  804f5b:	c9                   	leaveq 
  804f5c:	c3                   	retq   

0000000000804f5d <cputchar>:
  804f5d:	55                   	push   %rbp
  804f5e:	48 89 e5             	mov    %rsp,%rbp
  804f61:	48 83 ec 20          	sub    $0x20,%rsp
  804f65:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804f68:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804f6b:	88 45 ff             	mov    %al,-0x1(%rbp)
  804f6e:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  804f72:	be 01 00 00 00       	mov    $0x1,%esi
  804f77:	48 89 c7             	mov    %rax,%rdi
  804f7a:	48 b8 23 19 80 00 00 	movabs $0x801923,%rax
  804f81:	00 00 00 
  804f84:	ff d0                	callq  *%rax
  804f86:	c9                   	leaveq 
  804f87:	c3                   	retq   

0000000000804f88 <getchar>:
  804f88:	55                   	push   %rbp
  804f89:	48 89 e5             	mov    %rsp,%rbp
  804f8c:	48 83 ec 10          	sub    $0x10,%rsp
  804f90:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  804f94:	ba 01 00 00 00       	mov    $0x1,%edx
  804f99:	48 89 c6             	mov    %rax,%rsi
  804f9c:	bf 00 00 00 00       	mov    $0x0,%edi
  804fa1:	48 b8 76 2a 80 00 00 	movabs $0x802a76,%rax
  804fa8:	00 00 00 
  804fab:	ff d0                	callq  *%rax
  804fad:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804fb0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804fb4:	79 05                	jns    804fbb <getchar+0x33>
  804fb6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804fb9:	eb 14                	jmp    804fcf <getchar+0x47>
  804fbb:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804fbf:	7f 07                	jg     804fc8 <getchar+0x40>
  804fc1:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  804fc6:	eb 07                	jmp    804fcf <getchar+0x47>
  804fc8:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  804fcc:	0f b6 c0             	movzbl %al,%eax
  804fcf:	c9                   	leaveq 
  804fd0:	c3                   	retq   

0000000000804fd1 <iscons>:
  804fd1:	55                   	push   %rbp
  804fd2:	48 89 e5             	mov    %rsp,%rbp
  804fd5:	48 83 ec 20          	sub    $0x20,%rsp
  804fd9:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804fdc:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  804fe0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804fe3:	48 89 d6             	mov    %rdx,%rsi
  804fe6:	89 c7                	mov    %eax,%edi
  804fe8:	48 b8 44 26 80 00 00 	movabs $0x802644,%rax
  804fef:	00 00 00 
  804ff2:	ff d0                	callq  *%rax
  804ff4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804ff7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804ffb:	79 05                	jns    805002 <iscons+0x31>
  804ffd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805000:	eb 1a                	jmp    80501c <iscons+0x4b>
  805002:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805006:	8b 10                	mov    (%rax),%edx
  805008:	48 b8 20 81 80 00 00 	movabs $0x808120,%rax
  80500f:	00 00 00 
  805012:	8b 00                	mov    (%rax),%eax
  805014:	39 c2                	cmp    %eax,%edx
  805016:	0f 94 c0             	sete   %al
  805019:	0f b6 c0             	movzbl %al,%eax
  80501c:	c9                   	leaveq 
  80501d:	c3                   	retq   

000000000080501e <opencons>:
  80501e:	55                   	push   %rbp
  80501f:	48 89 e5             	mov    %rsp,%rbp
  805022:	48 83 ec 10          	sub    $0x10,%rsp
  805026:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  80502a:	48 89 c7             	mov    %rax,%rdi
  80502d:	48 b8 ac 25 80 00 00 	movabs $0x8025ac,%rax
  805034:	00 00 00 
  805037:	ff d0                	callq  *%rax
  805039:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80503c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805040:	79 05                	jns    805047 <opencons+0x29>
  805042:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805045:	eb 5b                	jmp    8050a2 <opencons+0x84>
  805047:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80504b:	ba 07 04 00 00       	mov    $0x407,%edx
  805050:	48 89 c6             	mov    %rax,%rsi
  805053:	bf 00 00 00 00       	mov    $0x0,%edi
  805058:	48 b8 6b 1a 80 00 00 	movabs $0x801a6b,%rax
  80505f:	00 00 00 
  805062:	ff d0                	callq  *%rax
  805064:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805067:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80506b:	79 05                	jns    805072 <opencons+0x54>
  80506d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805070:	eb 30                	jmp    8050a2 <opencons+0x84>
  805072:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805076:	48 ba 20 81 80 00 00 	movabs $0x808120,%rdx
  80507d:	00 00 00 
  805080:	8b 12                	mov    (%rdx),%edx
  805082:	89 10                	mov    %edx,(%rax)
  805084:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805088:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  80508f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805093:	48 89 c7             	mov    %rax,%rdi
  805096:	48 b8 5e 25 80 00 00 	movabs $0x80255e,%rax
  80509d:	00 00 00 
  8050a0:	ff d0                	callq  *%rax
  8050a2:	c9                   	leaveq 
  8050a3:	c3                   	retq   

00000000008050a4 <devcons_read>:
  8050a4:	55                   	push   %rbp
  8050a5:	48 89 e5             	mov    %rsp,%rbp
  8050a8:	48 83 ec 30          	sub    $0x30,%rsp
  8050ac:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8050b0:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8050b4:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8050b8:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8050bd:	75 07                	jne    8050c6 <devcons_read+0x22>
  8050bf:	b8 00 00 00 00       	mov    $0x0,%eax
  8050c4:	eb 4b                	jmp    805111 <devcons_read+0x6d>
  8050c6:	eb 0c                	jmp    8050d4 <devcons_read+0x30>
  8050c8:	48 b8 2d 1a 80 00 00 	movabs $0x801a2d,%rax
  8050cf:	00 00 00 
  8050d2:	ff d0                	callq  *%rax
  8050d4:	48 b8 6d 19 80 00 00 	movabs $0x80196d,%rax
  8050db:	00 00 00 
  8050de:	ff d0                	callq  *%rax
  8050e0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8050e3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8050e7:	74 df                	je     8050c8 <devcons_read+0x24>
  8050e9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8050ed:	79 05                	jns    8050f4 <devcons_read+0x50>
  8050ef:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8050f2:	eb 1d                	jmp    805111 <devcons_read+0x6d>
  8050f4:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  8050f8:	75 07                	jne    805101 <devcons_read+0x5d>
  8050fa:	b8 00 00 00 00       	mov    $0x0,%eax
  8050ff:	eb 10                	jmp    805111 <devcons_read+0x6d>
  805101:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805104:	89 c2                	mov    %eax,%edx
  805106:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80510a:	88 10                	mov    %dl,(%rax)
  80510c:	b8 01 00 00 00       	mov    $0x1,%eax
  805111:	c9                   	leaveq 
  805112:	c3                   	retq   

0000000000805113 <devcons_write>:
  805113:	55                   	push   %rbp
  805114:	48 89 e5             	mov    %rsp,%rbp
  805117:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  80511e:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  805125:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  80512c:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  805133:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80513a:	eb 76                	jmp    8051b2 <devcons_write+0x9f>
  80513c:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  805143:	89 c2                	mov    %eax,%edx
  805145:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805148:	29 c2                	sub    %eax,%edx
  80514a:	89 d0                	mov    %edx,%eax
  80514c:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80514f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  805152:	83 f8 7f             	cmp    $0x7f,%eax
  805155:	76 07                	jbe    80515e <devcons_write+0x4b>
  805157:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  80515e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  805161:	48 63 d0             	movslq %eax,%rdx
  805164:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805167:	48 63 c8             	movslq %eax,%rcx
  80516a:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  805171:	48 01 c1             	add    %rax,%rcx
  805174:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  80517b:	48 89 ce             	mov    %rcx,%rsi
  80517e:	48 89 c7             	mov    %rax,%rdi
  805181:	48 b8 60 14 80 00 00 	movabs $0x801460,%rax
  805188:	00 00 00 
  80518b:	ff d0                	callq  *%rax
  80518d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  805190:	48 63 d0             	movslq %eax,%rdx
  805193:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  80519a:	48 89 d6             	mov    %rdx,%rsi
  80519d:	48 89 c7             	mov    %rax,%rdi
  8051a0:	48 b8 23 19 80 00 00 	movabs $0x801923,%rax
  8051a7:	00 00 00 
  8051aa:	ff d0                	callq  *%rax
  8051ac:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8051af:	01 45 fc             	add    %eax,-0x4(%rbp)
  8051b2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8051b5:	48 98                	cltq   
  8051b7:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  8051be:	0f 82 78 ff ff ff    	jb     80513c <devcons_write+0x29>
  8051c4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8051c7:	c9                   	leaveq 
  8051c8:	c3                   	retq   

00000000008051c9 <devcons_close>:
  8051c9:	55                   	push   %rbp
  8051ca:	48 89 e5             	mov    %rsp,%rbp
  8051cd:	48 83 ec 08          	sub    $0x8,%rsp
  8051d1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8051d5:	b8 00 00 00 00       	mov    $0x0,%eax
  8051da:	c9                   	leaveq 
  8051db:	c3                   	retq   

00000000008051dc <devcons_stat>:
  8051dc:	55                   	push   %rbp
  8051dd:	48 89 e5             	mov    %rsp,%rbp
  8051e0:	48 83 ec 10          	sub    $0x10,%rsp
  8051e4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8051e8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8051ec:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8051f0:	48 be 13 5f 80 00 00 	movabs $0x805f13,%rsi
  8051f7:	00 00 00 
  8051fa:	48 89 c7             	mov    %rax,%rdi
  8051fd:	48 b8 3c 11 80 00 00 	movabs $0x80113c,%rax
  805204:	00 00 00 
  805207:	ff d0                	callq  *%rax
  805209:	b8 00 00 00 00       	mov    $0x0,%eax
  80520e:	c9                   	leaveq 
  80520f:	c3                   	retq   

0000000000805210 <set_pgfault_handler>:
  805210:	55                   	push   %rbp
  805211:	48 89 e5             	mov    %rsp,%rbp
  805214:	48 83 ec 20          	sub    $0x20,%rsp
  805218:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80521c:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  805223:	00 00 00 
  805226:	48 8b 00             	mov    (%rax),%rax
  805229:	48 85 c0             	test   %rax,%rax
  80522c:	75 6f                	jne    80529d <set_pgfault_handler+0x8d>
  80522e:	ba 07 00 00 00       	mov    $0x7,%edx
  805233:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  805238:	bf 00 00 00 00       	mov    $0x0,%edi
  80523d:	48 b8 6b 1a 80 00 00 	movabs $0x801a6b,%rax
  805244:	00 00 00 
  805247:	ff d0                	callq  *%rax
  805249:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80524c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805250:	79 30                	jns    805282 <set_pgfault_handler+0x72>
  805252:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805255:	89 c1                	mov    %eax,%ecx
  805257:	48 ba 20 5f 80 00 00 	movabs $0x805f20,%rdx
  80525e:	00 00 00 
  805261:	be 22 00 00 00       	mov    $0x22,%esi
  805266:	48 bf 3f 5f 80 00 00 	movabs $0x805f3f,%rdi
  80526d:	00 00 00 
  805270:	b8 00 00 00 00       	mov    $0x0,%eax
  805275:	49 b8 4e 03 80 00 00 	movabs $0x80034e,%r8
  80527c:	00 00 00 
  80527f:	41 ff d0             	callq  *%r8
  805282:	48 be b0 52 80 00 00 	movabs $0x8052b0,%rsi
  805289:	00 00 00 
  80528c:	bf 00 00 00 00       	mov    $0x0,%edi
  805291:	48 b8 f5 1b 80 00 00 	movabs $0x801bf5,%rax
  805298:	00 00 00 
  80529b:	ff d0                	callq  *%rax
  80529d:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  8052a4:	00 00 00 
  8052a7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8052ab:	48 89 10             	mov    %rdx,(%rax)
  8052ae:	c9                   	leaveq 
  8052af:	c3                   	retq   

00000000008052b0 <_pgfault_upcall>:
.globl _pgfault_upcall
_pgfault_upcall:
// Call the C page fault handler.
// function argument: pointer to UTF

movq  %rsp,%rdi                // passing the function argument in rdi
  8052b0:	48 89 e7             	mov    %rsp,%rdi
movabs _pgfault_handler, %rax
  8052b3:	48 a1 00 d0 80 00 00 	movabs 0x80d000,%rax
  8052ba:	00 00 00 
call *%rax
  8052bd:	ff d0                	callq  *%rax
// registers are available for intermediate calculations.  You
// may find that you have to rearrange your code in non-obvious
// ways as registers become unavailable as scratch space.
//
// LAB 4: Your code here.
subq $8, 152(%rsp)
  8052bf:	48 83 ac 24 98 00 00 	subq   $0x8,0x98(%rsp)
  8052c6:	00 08 
    movq 152(%rsp), %rax
  8052c8:	48 8b 84 24 98 00 00 	mov    0x98(%rsp),%rax
  8052cf:	00 
    movq 136(%rsp), %rbx
  8052d0:	48 8b 9c 24 88 00 00 	mov    0x88(%rsp),%rbx
  8052d7:	00 
movq %rbx, (%rax)
  8052d8:	48 89 18             	mov    %rbx,(%rax)

    // Restore the trap-time registers.  After you do this, you
    // can no longer modify any general-purpose registers.
    // LAB 4: Your code here.
    addq $16, %rsp
  8052db:	48 83 c4 10          	add    $0x10,%rsp
    POPA_
  8052df:	4c 8b 3c 24          	mov    (%rsp),%r15
  8052e3:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
  8052e8:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
  8052ed:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  8052f2:	4c 8b 5c 24 20       	mov    0x20(%rsp),%r11
  8052f7:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
  8052fc:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
  805301:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
  805306:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
  80530b:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
  805310:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
  805315:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
  80531a:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
  80531f:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
  805324:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  805329:	48 83 c4 78          	add    $0x78,%rsp

    // Restore eflags from the stack.  After you do this, you can
    // no longer use arithmetic operations or anything else that
    // modifies eflags.
    // LAB 4: Your code here.
pushq 8(%rsp)
  80532d:	ff 74 24 08          	pushq  0x8(%rsp)
    popfq
  805331:	9d                   	popfq  

    // Switch back to the adjusted trap-time stack.
    // LAB 4: Your code here.
    movq 16(%rsp), %rsp
  805332:	48 8b 64 24 10       	mov    0x10(%rsp),%rsp

    // Return to re-execute the instruction that faulted.
    // LAB 4: Your code here.
    retq
  805337:	c3                   	retq   

0000000000805338 <ipc_recv>:
  805338:	55                   	push   %rbp
  805339:	48 89 e5             	mov    %rsp,%rbp
  80533c:	48 83 ec 30          	sub    $0x30,%rsp
  805340:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  805344:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  805348:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80534c:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  805351:	75 0e                	jne    805361 <ipc_recv+0x29>
  805353:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80535a:	00 00 00 
  80535d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  805361:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  805365:	48 89 c7             	mov    %rax,%rdi
  805368:	48 b8 94 1c 80 00 00 	movabs $0x801c94,%rax
  80536f:	00 00 00 
  805372:	ff d0                	callq  *%rax
  805374:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805377:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80537b:	79 27                	jns    8053a4 <ipc_recv+0x6c>
  80537d:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  805382:	74 0a                	je     80538e <ipc_recv+0x56>
  805384:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805388:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  80538e:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  805393:	74 0a                	je     80539f <ipc_recv+0x67>
  805395:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  805399:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  80539f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8053a2:	eb 53                	jmp    8053f7 <ipc_recv+0xbf>
  8053a4:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8053a9:	74 19                	je     8053c4 <ipc_recv+0x8c>
  8053ab:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  8053b2:	00 00 00 
  8053b5:	48 8b 00             	mov    (%rax),%rax
  8053b8:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  8053be:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8053c2:	89 10                	mov    %edx,(%rax)
  8053c4:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8053c9:	74 19                	je     8053e4 <ipc_recv+0xac>
  8053cb:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  8053d2:	00 00 00 
  8053d5:	48 8b 00             	mov    (%rax),%rax
  8053d8:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  8053de:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8053e2:	89 10                	mov    %edx,(%rax)
  8053e4:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  8053eb:	00 00 00 
  8053ee:	48 8b 00             	mov    (%rax),%rax
  8053f1:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  8053f7:	c9                   	leaveq 
  8053f8:	c3                   	retq   

00000000008053f9 <ipc_send>:
  8053f9:	55                   	push   %rbp
  8053fa:	48 89 e5             	mov    %rsp,%rbp
  8053fd:	48 83 ec 30          	sub    $0x30,%rsp
  805401:	89 7d ec             	mov    %edi,-0x14(%rbp)
  805404:	89 75 e8             	mov    %esi,-0x18(%rbp)
  805407:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  80540b:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  80540e:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  805413:	75 10                	jne    805425 <ipc_send+0x2c>
  805415:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80541c:	00 00 00 
  80541f:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  805423:	eb 0e                	jmp    805433 <ipc_send+0x3a>
  805425:	eb 0c                	jmp    805433 <ipc_send+0x3a>
  805427:	48 b8 2d 1a 80 00 00 	movabs $0x801a2d,%rax
  80542e:	00 00 00 
  805431:	ff d0                	callq  *%rax
  805433:	8b 75 e8             	mov    -0x18(%rbp),%esi
  805436:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  805439:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80543d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  805440:	89 c7                	mov    %eax,%edi
  805442:	48 b8 3f 1c 80 00 00 	movabs $0x801c3f,%rax
  805449:	00 00 00 
  80544c:	ff d0                	callq  *%rax
  80544e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805451:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  805455:	74 d0                	je     805427 <ipc_send+0x2e>
  805457:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80545b:	79 30                	jns    80548d <ipc_send+0x94>
  80545d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805460:	89 c1                	mov    %eax,%ecx
  805462:	48 ba 50 5f 80 00 00 	movabs $0x805f50,%rdx
  805469:	00 00 00 
  80546c:	be 44 00 00 00       	mov    $0x44,%esi
  805471:	48 bf 66 5f 80 00 00 	movabs $0x805f66,%rdi
  805478:	00 00 00 
  80547b:	b8 00 00 00 00       	mov    $0x0,%eax
  805480:	49 b8 4e 03 80 00 00 	movabs $0x80034e,%r8
  805487:	00 00 00 
  80548a:	41 ff d0             	callq  *%r8
  80548d:	c9                   	leaveq 
  80548e:	c3                   	retq   

000000000080548f <ipc_find_env>:
  80548f:	55                   	push   %rbp
  805490:	48 89 e5             	mov    %rsp,%rbp
  805493:	48 83 ec 14          	sub    $0x14,%rsp
  805497:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80549a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8054a1:	eb 4e                	jmp    8054f1 <ipc_find_env+0x62>
  8054a3:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  8054aa:	00 00 00 
  8054ad:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8054b0:	48 98                	cltq   
  8054b2:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  8054b9:	48 01 d0             	add    %rdx,%rax
  8054bc:	48 05 d0 00 00 00    	add    $0xd0,%rax
  8054c2:	8b 00                	mov    (%rax),%eax
  8054c4:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  8054c7:	75 24                	jne    8054ed <ipc_find_env+0x5e>
  8054c9:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  8054d0:	00 00 00 
  8054d3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8054d6:	48 98                	cltq   
  8054d8:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  8054df:	48 01 d0             	add    %rdx,%rax
  8054e2:	48 05 c0 00 00 00    	add    $0xc0,%rax
  8054e8:	8b 40 08             	mov    0x8(%rax),%eax
  8054eb:	eb 12                	jmp    8054ff <ipc_find_env+0x70>
  8054ed:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8054f1:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  8054f8:	7e a9                	jle    8054a3 <ipc_find_env+0x14>
  8054fa:	b8 00 00 00 00       	mov    $0x0,%eax
  8054ff:	c9                   	leaveq 
  805500:	c3                   	retq   

0000000000805501 <pageref>:
  805501:	55                   	push   %rbp
  805502:	48 89 e5             	mov    %rsp,%rbp
  805505:	48 83 ec 18          	sub    $0x18,%rsp
  805509:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80550d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805511:	48 c1 e8 15          	shr    $0x15,%rax
  805515:	48 89 c2             	mov    %rax,%rdx
  805518:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  80551f:	01 00 00 
  805522:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  805526:	83 e0 01             	and    $0x1,%eax
  805529:	48 85 c0             	test   %rax,%rax
  80552c:	75 07                	jne    805535 <pageref+0x34>
  80552e:	b8 00 00 00 00       	mov    $0x0,%eax
  805533:	eb 53                	jmp    805588 <pageref+0x87>
  805535:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805539:	48 c1 e8 0c          	shr    $0xc,%rax
  80553d:	48 89 c2             	mov    %rax,%rdx
  805540:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  805547:	01 00 00 
  80554a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80554e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  805552:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  805556:	83 e0 01             	and    $0x1,%eax
  805559:	48 85 c0             	test   %rax,%rax
  80555c:	75 07                	jne    805565 <pageref+0x64>
  80555e:	b8 00 00 00 00       	mov    $0x0,%eax
  805563:	eb 23                	jmp    805588 <pageref+0x87>
  805565:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  805569:	48 c1 e8 0c          	shr    $0xc,%rax
  80556d:	48 89 c2             	mov    %rax,%rdx
  805570:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  805577:	00 00 00 
  80557a:	48 c1 e2 04          	shl    $0x4,%rdx
  80557e:	48 01 d0             	add    %rdx,%rax
  805581:	0f b7 40 08          	movzwl 0x8(%rax),%eax
  805585:	0f b7 c0             	movzwl %ax,%eax
  805588:	c9                   	leaveq 
  805589:	c3                   	retq   
