
obj/user/testtime:     file format elf64-x86-64


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
  80003c:	e8 6c 01 00 00       	callq  8001ad <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <sleep>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 20          	sub    $0x20,%rsp
  80004b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80004e:	48 b8 dd 1b 80 00 00 	movabs $0x801bdd,%rax
  800055:	00 00 00 
  800058:	ff d0                	callq  *%rax
  80005a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80005d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  800060:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
  800066:	89 c2                	mov    %eax,%edx
  800068:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80006b:	01 d0                	add    %edx,%eax
  80006d:	89 45 f8             	mov    %eax,-0x8(%rbp)
  800070:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800073:	85 c0                	test   %eax,%eax
  800075:	79 38                	jns    8000af <sleep+0x6c>
  800077:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80007a:	83 f8 eb             	cmp    $0xffffffeb,%eax
  80007d:	7c 30                	jl     8000af <sleep+0x6c>
  80007f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800082:	89 c1                	mov    %eax,%ecx
  800084:	48 ba 60 41 80 00 00 	movabs $0x804160,%rdx
  80008b:	00 00 00 
  80008e:	be 0c 00 00 00       	mov    $0xc,%esi
  800093:	48 bf 72 41 80 00 00 	movabs $0x804172,%rdi
  80009a:	00 00 00 
  80009d:	b8 00 00 00 00       	mov    $0x0,%eax
  8000a2:	49 b8 53 02 80 00 00 	movabs $0x800253,%r8
  8000a9:	00 00 00 
  8000ac:	41 ff d0             	callq  *%r8
  8000af:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8000b2:	3b 45 fc             	cmp    -0x4(%rbp),%eax
  8000b5:	73 2a                	jae    8000e1 <sleep+0x9e>
  8000b7:	48 ba 85 41 80 00 00 	movabs $0x804185,%rdx
  8000be:	00 00 00 
  8000c1:	be 0e 00 00 00       	mov    $0xe,%esi
  8000c6:	48 bf 72 41 80 00 00 	movabs $0x804172,%rdi
  8000cd:	00 00 00 
  8000d0:	b8 00 00 00 00       	mov    $0x0,%eax
  8000d5:	48 b9 53 02 80 00 00 	movabs $0x800253,%rcx
  8000dc:	00 00 00 
  8000df:	ff d1                	callq  *%rcx
  8000e1:	eb 0c                	jmp    8000ef <sleep+0xac>
  8000e3:	48 b8 32 19 80 00 00 	movabs $0x801932,%rax
  8000ea:	00 00 00 
  8000ed:	ff d0                	callq  *%rax
  8000ef:	48 b8 dd 1b 80 00 00 	movabs $0x801bdd,%rax
  8000f6:	00 00 00 
  8000f9:	ff d0                	callq  *%rax
  8000fb:	3b 45 f8             	cmp    -0x8(%rbp),%eax
  8000fe:	72 e3                	jb     8000e3 <sleep+0xa0>
  800100:	c9                   	leaveq 
  800101:	c3                   	retq   

0000000000800102 <umain>:
  800102:	55                   	push   %rbp
  800103:	48 89 e5             	mov    %rsp,%rbp
  800106:	48 83 ec 20          	sub    $0x20,%rsp
  80010a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80010d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800111:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800118:	eb 10                	jmp    80012a <umain+0x28>
  80011a:	48 b8 32 19 80 00 00 	movabs $0x801932,%rax
  800121:	00 00 00 
  800124:	ff d0                	callq  *%rax
  800126:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80012a:	83 7d fc 31          	cmpl   $0x31,-0x4(%rbp)
  80012e:	7e ea                	jle    80011a <umain+0x18>
  800130:	48 bf 91 41 80 00 00 	movabs $0x804191,%rdi
  800137:	00 00 00 
  80013a:	b8 00 00 00 00       	mov    $0x0,%eax
  80013f:	48 ba 8c 04 80 00 00 	movabs $0x80048c,%rdx
  800146:	00 00 00 
  800149:	ff d2                	callq  *%rdx
  80014b:	c7 45 fc 05 00 00 00 	movl   $0x5,-0x4(%rbp)
  800152:	eb 35                	jmp    800189 <umain+0x87>
  800154:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800157:	89 c6                	mov    %eax,%esi
  800159:	48 bf a7 41 80 00 00 	movabs $0x8041a7,%rdi
  800160:	00 00 00 
  800163:	b8 00 00 00 00       	mov    $0x0,%eax
  800168:	48 ba 8c 04 80 00 00 	movabs $0x80048c,%rdx
  80016f:	00 00 00 
  800172:	ff d2                	callq  *%rdx
  800174:	bf 01 00 00 00       	mov    $0x1,%edi
  800179:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800180:	00 00 00 
  800183:	ff d0                	callq  *%rax
  800185:	83 6d fc 01          	subl   $0x1,-0x4(%rbp)
  800189:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80018d:	79 c5                	jns    800154 <umain+0x52>
  80018f:	48 bf ab 41 80 00 00 	movabs $0x8041ab,%rdi
  800196:	00 00 00 
  800199:	b8 00 00 00 00       	mov    $0x0,%eax
  80019e:	48 ba 8c 04 80 00 00 	movabs $0x80048c,%rdx
  8001a5:	00 00 00 
  8001a8:	ff d2                	callq  *%rdx
static __inline void read_gdtr (uint64_t *gdtbase, uint16_t *gdtlimit) __attribute__((always_inline));

static __inline void
breakpoint(void)
{
	__asm __volatile("int3");
  8001aa:	cc                   	int3   
  8001ab:	c9                   	leaveq 
  8001ac:	c3                   	retq   

00000000008001ad <libmain>:
  8001ad:	55                   	push   %rbp
  8001ae:	48 89 e5             	mov    %rsp,%rbp
  8001b1:	48 83 ec 10          	sub    $0x10,%rsp
  8001b5:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8001b8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8001bc:	48 b8 f4 18 80 00 00 	movabs $0x8018f4,%rax
  8001c3:	00 00 00 
  8001c6:	ff d0                	callq  *%rax
  8001c8:	25 ff 03 00 00       	and    $0x3ff,%eax
  8001cd:	48 98                	cltq   
  8001cf:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8001d6:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8001dd:	00 00 00 
  8001e0:	48 01 c2             	add    %rax,%rdx
  8001e3:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8001ea:	00 00 00 
  8001ed:	48 89 10             	mov    %rdx,(%rax)
  8001f0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8001f4:	7e 14                	jle    80020a <libmain+0x5d>
  8001f6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8001fa:	48 8b 10             	mov    (%rax),%rdx
  8001fd:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  800204:	00 00 00 
  800207:	48 89 10             	mov    %rdx,(%rax)
  80020a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80020e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800211:	48 89 d6             	mov    %rdx,%rsi
  800214:	89 c7                	mov    %eax,%edi
  800216:	48 b8 02 01 80 00 00 	movabs $0x800102,%rax
  80021d:	00 00 00 
  800220:	ff d0                	callq  *%rax
  800222:	48 b8 30 02 80 00 00 	movabs $0x800230,%rax
  800229:	00 00 00 
  80022c:	ff d0                	callq  *%rax
  80022e:	c9                   	leaveq 
  80022f:	c3                   	retq   

0000000000800230 <exit>:
  800230:	55                   	push   %rbp
  800231:	48 89 e5             	mov    %rsp,%rbp
  800234:	48 b8 8f 21 80 00 00 	movabs $0x80218f,%rax
  80023b:	00 00 00 
  80023e:	ff d0                	callq  *%rax
  800240:	bf 00 00 00 00       	mov    $0x0,%edi
  800245:	48 b8 b0 18 80 00 00 	movabs $0x8018b0,%rax
  80024c:	00 00 00 
  80024f:	ff d0                	callq  *%rax
  800251:	5d                   	pop    %rbp
  800252:	c3                   	retq   

0000000000800253 <_panic>:
  800253:	55                   	push   %rbp
  800254:	48 89 e5             	mov    %rsp,%rbp
  800257:	53                   	push   %rbx
  800258:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  80025f:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  800266:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  80026c:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  800273:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  80027a:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  800281:	84 c0                	test   %al,%al
  800283:	74 23                	je     8002a8 <_panic+0x55>
  800285:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  80028c:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  800290:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  800294:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  800298:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  80029c:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  8002a0:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  8002a4:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  8002a8:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  8002af:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  8002b6:	00 00 00 
  8002b9:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  8002c0:	00 00 00 
  8002c3:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8002c7:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  8002ce:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  8002d5:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8002dc:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  8002e3:	00 00 00 
  8002e6:	48 8b 18             	mov    (%rax),%rbx
  8002e9:	48 b8 f4 18 80 00 00 	movabs $0x8018f4,%rax
  8002f0:	00 00 00 
  8002f3:	ff d0                	callq  *%rax
  8002f5:	8b 8d 14 ff ff ff    	mov    -0xec(%rbp),%ecx
  8002fb:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800302:	41 89 c8             	mov    %ecx,%r8d
  800305:	48 89 d1             	mov    %rdx,%rcx
  800308:	48 89 da             	mov    %rbx,%rdx
  80030b:	89 c6                	mov    %eax,%esi
  80030d:	48 bf b8 41 80 00 00 	movabs $0x8041b8,%rdi
  800314:	00 00 00 
  800317:	b8 00 00 00 00       	mov    $0x0,%eax
  80031c:	49 b9 8c 04 80 00 00 	movabs $0x80048c,%r9
  800323:	00 00 00 
  800326:	41 ff d1             	callq  *%r9
  800329:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  800330:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800337:	48 89 d6             	mov    %rdx,%rsi
  80033a:	48 89 c7             	mov    %rax,%rdi
  80033d:	48 b8 e0 03 80 00 00 	movabs $0x8003e0,%rax
  800344:	00 00 00 
  800347:	ff d0                	callq  *%rax
  800349:	48 bf db 41 80 00 00 	movabs $0x8041db,%rdi
  800350:	00 00 00 
  800353:	b8 00 00 00 00       	mov    $0x0,%eax
  800358:	48 ba 8c 04 80 00 00 	movabs $0x80048c,%rdx
  80035f:	00 00 00 
  800362:	ff d2                	callq  *%rdx
  800364:	cc                   	int3   
  800365:	eb fd                	jmp    800364 <_panic+0x111>

0000000000800367 <putch>:
  800367:	55                   	push   %rbp
  800368:	48 89 e5             	mov    %rsp,%rbp
  80036b:	48 83 ec 10          	sub    $0x10,%rsp
  80036f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800372:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800376:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80037a:	8b 00                	mov    (%rax),%eax
  80037c:	8d 48 01             	lea    0x1(%rax),%ecx
  80037f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800383:	89 0a                	mov    %ecx,(%rdx)
  800385:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800388:	89 d1                	mov    %edx,%ecx
  80038a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80038e:	48 98                	cltq   
  800390:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  800394:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800398:	8b 00                	mov    (%rax),%eax
  80039a:	3d ff 00 00 00       	cmp    $0xff,%eax
  80039f:	75 2c                	jne    8003cd <putch+0x66>
  8003a1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8003a5:	8b 00                	mov    (%rax),%eax
  8003a7:	48 98                	cltq   
  8003a9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8003ad:	48 83 c2 08          	add    $0x8,%rdx
  8003b1:	48 89 c6             	mov    %rax,%rsi
  8003b4:	48 89 d7             	mov    %rdx,%rdi
  8003b7:	48 b8 28 18 80 00 00 	movabs $0x801828,%rax
  8003be:	00 00 00 
  8003c1:	ff d0                	callq  *%rax
  8003c3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8003c7:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8003cd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8003d1:	8b 40 04             	mov    0x4(%rax),%eax
  8003d4:	8d 50 01             	lea    0x1(%rax),%edx
  8003d7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8003db:	89 50 04             	mov    %edx,0x4(%rax)
  8003de:	c9                   	leaveq 
  8003df:	c3                   	retq   

00000000008003e0 <vcprintf>:
  8003e0:	55                   	push   %rbp
  8003e1:	48 89 e5             	mov    %rsp,%rbp
  8003e4:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  8003eb:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  8003f2:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  8003f9:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  800400:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  800407:	48 8b 0a             	mov    (%rdx),%rcx
  80040a:	48 89 08             	mov    %rcx,(%rax)
  80040d:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800411:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800415:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800419:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80041d:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  800424:	00 00 00 
  800427:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  80042e:	00 00 00 
  800431:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  800438:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  80043f:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800446:	48 89 c6             	mov    %rax,%rsi
  800449:	48 bf 67 03 80 00 00 	movabs $0x800367,%rdi
  800450:	00 00 00 
  800453:	48 b8 3f 08 80 00 00 	movabs $0x80083f,%rax
  80045a:	00 00 00 
  80045d:	ff d0                	callq  *%rax
  80045f:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  800465:	48 98                	cltq   
  800467:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  80046e:	48 83 c2 08          	add    $0x8,%rdx
  800472:	48 89 c6             	mov    %rax,%rsi
  800475:	48 89 d7             	mov    %rdx,%rdi
  800478:	48 b8 28 18 80 00 00 	movabs $0x801828,%rax
  80047f:	00 00 00 
  800482:	ff d0                	callq  *%rax
  800484:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  80048a:	c9                   	leaveq 
  80048b:	c3                   	retq   

000000000080048c <cprintf>:
  80048c:	55                   	push   %rbp
  80048d:	48 89 e5             	mov    %rsp,%rbp
  800490:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  800497:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  80049e:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  8004a5:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8004ac:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8004b3:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8004ba:	84 c0                	test   %al,%al
  8004bc:	74 20                	je     8004de <cprintf+0x52>
  8004be:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8004c2:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8004c6:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8004ca:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8004ce:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8004d2:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8004d6:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8004da:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8004de:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  8004e5:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  8004ec:	00 00 00 
  8004ef:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8004f6:	00 00 00 
  8004f9:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8004fd:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800504:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  80050b:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800512:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800519:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800520:	48 8b 0a             	mov    (%rdx),%rcx
  800523:	48 89 08             	mov    %rcx,(%rax)
  800526:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80052a:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80052e:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800532:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800536:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  80053d:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800544:	48 89 d6             	mov    %rdx,%rsi
  800547:	48 89 c7             	mov    %rax,%rdi
  80054a:	48 b8 e0 03 80 00 00 	movabs $0x8003e0,%rax
  800551:	00 00 00 
  800554:	ff d0                	callq  *%rax
  800556:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  80055c:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  800562:	c9                   	leaveq 
  800563:	c3                   	retq   

0000000000800564 <printnum>:
  800564:	55                   	push   %rbp
  800565:	48 89 e5             	mov    %rsp,%rbp
  800568:	53                   	push   %rbx
  800569:	48 83 ec 38          	sub    $0x38,%rsp
  80056d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800571:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800575:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  800579:	89 4d d4             	mov    %ecx,-0x2c(%rbp)
  80057c:	44 89 45 d0          	mov    %r8d,-0x30(%rbp)
  800580:	44 89 4d cc          	mov    %r9d,-0x34(%rbp)
  800584:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  800587:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  80058b:	77 3b                	ja     8005c8 <printnum+0x64>
  80058d:	8b 45 d0             	mov    -0x30(%rbp),%eax
  800590:	44 8d 40 ff          	lea    -0x1(%rax),%r8d
  800594:	8b 5d d4             	mov    -0x2c(%rbp),%ebx
  800597:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80059b:	ba 00 00 00 00       	mov    $0x0,%edx
  8005a0:	48 f7 f3             	div    %rbx
  8005a3:	48 89 c2             	mov    %rax,%rdx
  8005a6:	8b 7d cc             	mov    -0x34(%rbp),%edi
  8005a9:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  8005ac:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
  8005b0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005b4:	41 89 f9             	mov    %edi,%r9d
  8005b7:	48 89 c7             	mov    %rax,%rdi
  8005ba:	48 b8 64 05 80 00 00 	movabs $0x800564,%rax
  8005c1:	00 00 00 
  8005c4:	ff d0                	callq  *%rax
  8005c6:	eb 1e                	jmp    8005e6 <printnum+0x82>
  8005c8:	eb 12                	jmp    8005dc <printnum+0x78>
  8005ca:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8005ce:	8b 55 cc             	mov    -0x34(%rbp),%edx
  8005d1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005d5:	48 89 ce             	mov    %rcx,%rsi
  8005d8:	89 d7                	mov    %edx,%edi
  8005da:	ff d0                	callq  *%rax
  8005dc:	83 6d d0 01          	subl   $0x1,-0x30(%rbp)
  8005e0:	83 7d d0 00          	cmpl   $0x0,-0x30(%rbp)
  8005e4:	7f e4                	jg     8005ca <printnum+0x66>
  8005e6:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  8005e9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8005ed:	ba 00 00 00 00       	mov    $0x0,%edx
  8005f2:	48 f7 f1             	div    %rcx
  8005f5:	48 89 d0             	mov    %rdx,%rax
  8005f8:	48 ba d0 43 80 00 00 	movabs $0x8043d0,%rdx
  8005ff:	00 00 00 
  800602:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
  800606:	0f be d0             	movsbl %al,%edx
  800609:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80060d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800611:	48 89 ce             	mov    %rcx,%rsi
  800614:	89 d7                	mov    %edx,%edi
  800616:	ff d0                	callq  *%rax
  800618:	48 83 c4 38          	add    $0x38,%rsp
  80061c:	5b                   	pop    %rbx
  80061d:	5d                   	pop    %rbp
  80061e:	c3                   	retq   

000000000080061f <getuint>:
  80061f:	55                   	push   %rbp
  800620:	48 89 e5             	mov    %rsp,%rbp
  800623:	48 83 ec 1c          	sub    $0x1c,%rsp
  800627:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80062b:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80062e:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800632:	7e 52                	jle    800686 <getuint+0x67>
  800634:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800638:	8b 00                	mov    (%rax),%eax
  80063a:	83 f8 30             	cmp    $0x30,%eax
  80063d:	73 24                	jae    800663 <getuint+0x44>
  80063f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800643:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800647:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80064b:	8b 00                	mov    (%rax),%eax
  80064d:	89 c0                	mov    %eax,%eax
  80064f:	48 01 d0             	add    %rdx,%rax
  800652:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800656:	8b 12                	mov    (%rdx),%edx
  800658:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80065b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80065f:	89 0a                	mov    %ecx,(%rdx)
  800661:	eb 17                	jmp    80067a <getuint+0x5b>
  800663:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800667:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80066b:	48 89 d0             	mov    %rdx,%rax
  80066e:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800672:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800676:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80067a:	48 8b 00             	mov    (%rax),%rax
  80067d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800681:	e9 a3 00 00 00       	jmpq   800729 <getuint+0x10a>
  800686:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  80068a:	74 4f                	je     8006db <getuint+0xbc>
  80068c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800690:	8b 00                	mov    (%rax),%eax
  800692:	83 f8 30             	cmp    $0x30,%eax
  800695:	73 24                	jae    8006bb <getuint+0x9c>
  800697:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80069b:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80069f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006a3:	8b 00                	mov    (%rax),%eax
  8006a5:	89 c0                	mov    %eax,%eax
  8006a7:	48 01 d0             	add    %rdx,%rax
  8006aa:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006ae:	8b 12                	mov    (%rdx),%edx
  8006b0:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8006b3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006b7:	89 0a                	mov    %ecx,(%rdx)
  8006b9:	eb 17                	jmp    8006d2 <getuint+0xb3>
  8006bb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006bf:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8006c3:	48 89 d0             	mov    %rdx,%rax
  8006c6:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8006ca:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006ce:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8006d2:	48 8b 00             	mov    (%rax),%rax
  8006d5:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8006d9:	eb 4e                	jmp    800729 <getuint+0x10a>
  8006db:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006df:	8b 00                	mov    (%rax),%eax
  8006e1:	83 f8 30             	cmp    $0x30,%eax
  8006e4:	73 24                	jae    80070a <getuint+0xeb>
  8006e6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006ea:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8006ee:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006f2:	8b 00                	mov    (%rax),%eax
  8006f4:	89 c0                	mov    %eax,%eax
  8006f6:	48 01 d0             	add    %rdx,%rax
  8006f9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006fd:	8b 12                	mov    (%rdx),%edx
  8006ff:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800702:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800706:	89 0a                	mov    %ecx,(%rdx)
  800708:	eb 17                	jmp    800721 <getuint+0x102>
  80070a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80070e:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800712:	48 89 d0             	mov    %rdx,%rax
  800715:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800719:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80071d:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800721:	8b 00                	mov    (%rax),%eax
  800723:	89 c0                	mov    %eax,%eax
  800725:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800729:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80072d:	c9                   	leaveq 
  80072e:	c3                   	retq   

000000000080072f <getint>:
  80072f:	55                   	push   %rbp
  800730:	48 89 e5             	mov    %rsp,%rbp
  800733:	48 83 ec 1c          	sub    $0x1c,%rsp
  800737:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80073b:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80073e:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800742:	7e 52                	jle    800796 <getint+0x67>
  800744:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800748:	8b 00                	mov    (%rax),%eax
  80074a:	83 f8 30             	cmp    $0x30,%eax
  80074d:	73 24                	jae    800773 <getint+0x44>
  80074f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800753:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800757:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80075b:	8b 00                	mov    (%rax),%eax
  80075d:	89 c0                	mov    %eax,%eax
  80075f:	48 01 d0             	add    %rdx,%rax
  800762:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800766:	8b 12                	mov    (%rdx),%edx
  800768:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80076b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80076f:	89 0a                	mov    %ecx,(%rdx)
  800771:	eb 17                	jmp    80078a <getint+0x5b>
  800773:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800777:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80077b:	48 89 d0             	mov    %rdx,%rax
  80077e:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800782:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800786:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80078a:	48 8b 00             	mov    (%rax),%rax
  80078d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800791:	e9 a3 00 00 00       	jmpq   800839 <getint+0x10a>
  800796:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  80079a:	74 4f                	je     8007eb <getint+0xbc>
  80079c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007a0:	8b 00                	mov    (%rax),%eax
  8007a2:	83 f8 30             	cmp    $0x30,%eax
  8007a5:	73 24                	jae    8007cb <getint+0x9c>
  8007a7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007ab:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8007af:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007b3:	8b 00                	mov    (%rax),%eax
  8007b5:	89 c0                	mov    %eax,%eax
  8007b7:	48 01 d0             	add    %rdx,%rax
  8007ba:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007be:	8b 12                	mov    (%rdx),%edx
  8007c0:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8007c3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007c7:	89 0a                	mov    %ecx,(%rdx)
  8007c9:	eb 17                	jmp    8007e2 <getint+0xb3>
  8007cb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007cf:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8007d3:	48 89 d0             	mov    %rdx,%rax
  8007d6:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8007da:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007de:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8007e2:	48 8b 00             	mov    (%rax),%rax
  8007e5:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8007e9:	eb 4e                	jmp    800839 <getint+0x10a>
  8007eb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007ef:	8b 00                	mov    (%rax),%eax
  8007f1:	83 f8 30             	cmp    $0x30,%eax
  8007f4:	73 24                	jae    80081a <getint+0xeb>
  8007f6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007fa:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8007fe:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800802:	8b 00                	mov    (%rax),%eax
  800804:	89 c0                	mov    %eax,%eax
  800806:	48 01 d0             	add    %rdx,%rax
  800809:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80080d:	8b 12                	mov    (%rdx),%edx
  80080f:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800812:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800816:	89 0a                	mov    %ecx,(%rdx)
  800818:	eb 17                	jmp    800831 <getint+0x102>
  80081a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80081e:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800822:	48 89 d0             	mov    %rdx,%rax
  800825:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800829:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80082d:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800831:	8b 00                	mov    (%rax),%eax
  800833:	48 98                	cltq   
  800835:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800839:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80083d:	c9                   	leaveq 
  80083e:	c3                   	retq   

000000000080083f <vprintfmt>:
  80083f:	55                   	push   %rbp
  800840:	48 89 e5             	mov    %rsp,%rbp
  800843:	41 54                	push   %r12
  800845:	53                   	push   %rbx
  800846:	48 83 ec 60          	sub    $0x60,%rsp
  80084a:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  80084e:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  800852:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800856:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  80085a:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  80085e:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  800862:	48 8b 0a             	mov    (%rdx),%rcx
  800865:	48 89 08             	mov    %rcx,(%rax)
  800868:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80086c:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800870:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800874:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800878:	eb 17                	jmp    800891 <vprintfmt+0x52>
  80087a:	85 db                	test   %ebx,%ebx
  80087c:	0f 84 cc 04 00 00    	je     800d4e <vprintfmt+0x50f>
  800882:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800886:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80088a:	48 89 d6             	mov    %rdx,%rsi
  80088d:	89 df                	mov    %ebx,%edi
  80088f:	ff d0                	callq  *%rax
  800891:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800895:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800899:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  80089d:	0f b6 00             	movzbl (%rax),%eax
  8008a0:	0f b6 d8             	movzbl %al,%ebx
  8008a3:	83 fb 25             	cmp    $0x25,%ebx
  8008a6:	75 d2                	jne    80087a <vprintfmt+0x3b>
  8008a8:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  8008ac:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  8008b3:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  8008ba:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  8008c1:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  8008c8:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8008cc:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8008d0:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8008d4:	0f b6 00             	movzbl (%rax),%eax
  8008d7:	0f b6 d8             	movzbl %al,%ebx
  8008da:	8d 43 dd             	lea    -0x23(%rbx),%eax
  8008dd:	83 f8 55             	cmp    $0x55,%eax
  8008e0:	0f 87 34 04 00 00    	ja     800d1a <vprintfmt+0x4db>
  8008e6:	89 c0                	mov    %eax,%eax
  8008e8:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8008ef:	00 
  8008f0:	48 b8 f8 43 80 00 00 	movabs $0x8043f8,%rax
  8008f7:	00 00 00 
  8008fa:	48 01 d0             	add    %rdx,%rax
  8008fd:	48 8b 00             	mov    (%rax),%rax
  800900:	ff e0                	jmpq   *%rax
  800902:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  800906:	eb c0                	jmp    8008c8 <vprintfmt+0x89>
  800908:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  80090c:	eb ba                	jmp    8008c8 <vprintfmt+0x89>
  80090e:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  800915:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800918:	89 d0                	mov    %edx,%eax
  80091a:	c1 e0 02             	shl    $0x2,%eax
  80091d:	01 d0                	add    %edx,%eax
  80091f:	01 c0                	add    %eax,%eax
  800921:	01 d8                	add    %ebx,%eax
  800923:	83 e8 30             	sub    $0x30,%eax
  800926:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800929:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  80092d:	0f b6 00             	movzbl (%rax),%eax
  800930:	0f be d8             	movsbl %al,%ebx
  800933:	83 fb 2f             	cmp    $0x2f,%ebx
  800936:	7e 0c                	jle    800944 <vprintfmt+0x105>
  800938:	83 fb 39             	cmp    $0x39,%ebx
  80093b:	7f 07                	jg     800944 <vprintfmt+0x105>
  80093d:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  800942:	eb d1                	jmp    800915 <vprintfmt+0xd6>
  800944:	eb 58                	jmp    80099e <vprintfmt+0x15f>
  800946:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800949:	83 f8 30             	cmp    $0x30,%eax
  80094c:	73 17                	jae    800965 <vprintfmt+0x126>
  80094e:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800952:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800955:	89 c0                	mov    %eax,%eax
  800957:	48 01 d0             	add    %rdx,%rax
  80095a:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80095d:	83 c2 08             	add    $0x8,%edx
  800960:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800963:	eb 0f                	jmp    800974 <vprintfmt+0x135>
  800965:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800969:	48 89 d0             	mov    %rdx,%rax
  80096c:	48 83 c2 08          	add    $0x8,%rdx
  800970:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800974:	8b 00                	mov    (%rax),%eax
  800976:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800979:	eb 23                	jmp    80099e <vprintfmt+0x15f>
  80097b:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  80097f:	79 0c                	jns    80098d <vprintfmt+0x14e>
  800981:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  800988:	e9 3b ff ff ff       	jmpq   8008c8 <vprintfmt+0x89>
  80098d:	e9 36 ff ff ff       	jmpq   8008c8 <vprintfmt+0x89>
  800992:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  800999:	e9 2a ff ff ff       	jmpq   8008c8 <vprintfmt+0x89>
  80099e:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8009a2:	79 12                	jns    8009b6 <vprintfmt+0x177>
  8009a4:	8b 45 d8             	mov    -0x28(%rbp),%eax
  8009a7:	89 45 dc             	mov    %eax,-0x24(%rbp)
  8009aa:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  8009b1:	e9 12 ff ff ff       	jmpq   8008c8 <vprintfmt+0x89>
  8009b6:	e9 0d ff ff ff       	jmpq   8008c8 <vprintfmt+0x89>
  8009bb:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  8009bf:	e9 04 ff ff ff       	jmpq   8008c8 <vprintfmt+0x89>
  8009c4:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8009c7:	83 f8 30             	cmp    $0x30,%eax
  8009ca:	73 17                	jae    8009e3 <vprintfmt+0x1a4>
  8009cc:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8009d0:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8009d3:	89 c0                	mov    %eax,%eax
  8009d5:	48 01 d0             	add    %rdx,%rax
  8009d8:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8009db:	83 c2 08             	add    $0x8,%edx
  8009de:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8009e1:	eb 0f                	jmp    8009f2 <vprintfmt+0x1b3>
  8009e3:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  8009e7:	48 89 d0             	mov    %rdx,%rax
  8009ea:	48 83 c2 08          	add    $0x8,%rdx
  8009ee:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8009f2:	8b 10                	mov    (%rax),%edx
  8009f4:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  8009f8:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8009fc:	48 89 ce             	mov    %rcx,%rsi
  8009ff:	89 d7                	mov    %edx,%edi
  800a01:	ff d0                	callq  *%rax
  800a03:	e9 40 03 00 00       	jmpq   800d48 <vprintfmt+0x509>
  800a08:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800a0b:	83 f8 30             	cmp    $0x30,%eax
  800a0e:	73 17                	jae    800a27 <vprintfmt+0x1e8>
  800a10:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800a14:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800a17:	89 c0                	mov    %eax,%eax
  800a19:	48 01 d0             	add    %rdx,%rax
  800a1c:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800a1f:	83 c2 08             	add    $0x8,%edx
  800a22:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800a25:	eb 0f                	jmp    800a36 <vprintfmt+0x1f7>
  800a27:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800a2b:	48 89 d0             	mov    %rdx,%rax
  800a2e:	48 83 c2 08          	add    $0x8,%rdx
  800a32:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800a36:	8b 18                	mov    (%rax),%ebx
  800a38:	85 db                	test   %ebx,%ebx
  800a3a:	79 02                	jns    800a3e <vprintfmt+0x1ff>
  800a3c:	f7 db                	neg    %ebx
  800a3e:	83 fb 15             	cmp    $0x15,%ebx
  800a41:	7f 16                	jg     800a59 <vprintfmt+0x21a>
  800a43:	48 b8 20 43 80 00 00 	movabs $0x804320,%rax
  800a4a:	00 00 00 
  800a4d:	48 63 d3             	movslq %ebx,%rdx
  800a50:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800a54:	4d 85 e4             	test   %r12,%r12
  800a57:	75 2e                	jne    800a87 <vprintfmt+0x248>
  800a59:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800a5d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a61:	89 d9                	mov    %ebx,%ecx
  800a63:	48 ba e1 43 80 00 00 	movabs $0x8043e1,%rdx
  800a6a:	00 00 00 
  800a6d:	48 89 c7             	mov    %rax,%rdi
  800a70:	b8 00 00 00 00       	mov    $0x0,%eax
  800a75:	49 b8 57 0d 80 00 00 	movabs $0x800d57,%r8
  800a7c:	00 00 00 
  800a7f:	41 ff d0             	callq  *%r8
  800a82:	e9 c1 02 00 00       	jmpq   800d48 <vprintfmt+0x509>
  800a87:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800a8b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a8f:	4c 89 e1             	mov    %r12,%rcx
  800a92:	48 ba ea 43 80 00 00 	movabs $0x8043ea,%rdx
  800a99:	00 00 00 
  800a9c:	48 89 c7             	mov    %rax,%rdi
  800a9f:	b8 00 00 00 00       	mov    $0x0,%eax
  800aa4:	49 b8 57 0d 80 00 00 	movabs $0x800d57,%r8
  800aab:	00 00 00 
  800aae:	41 ff d0             	callq  *%r8
  800ab1:	e9 92 02 00 00       	jmpq   800d48 <vprintfmt+0x509>
  800ab6:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800ab9:	83 f8 30             	cmp    $0x30,%eax
  800abc:	73 17                	jae    800ad5 <vprintfmt+0x296>
  800abe:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800ac2:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800ac5:	89 c0                	mov    %eax,%eax
  800ac7:	48 01 d0             	add    %rdx,%rax
  800aca:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800acd:	83 c2 08             	add    $0x8,%edx
  800ad0:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800ad3:	eb 0f                	jmp    800ae4 <vprintfmt+0x2a5>
  800ad5:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800ad9:	48 89 d0             	mov    %rdx,%rax
  800adc:	48 83 c2 08          	add    $0x8,%rdx
  800ae0:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800ae4:	4c 8b 20             	mov    (%rax),%r12
  800ae7:	4d 85 e4             	test   %r12,%r12
  800aea:	75 0a                	jne    800af6 <vprintfmt+0x2b7>
  800aec:	49 bc ed 43 80 00 00 	movabs $0x8043ed,%r12
  800af3:	00 00 00 
  800af6:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800afa:	7e 3f                	jle    800b3b <vprintfmt+0x2fc>
  800afc:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  800b00:	74 39                	je     800b3b <vprintfmt+0x2fc>
  800b02:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800b05:	48 98                	cltq   
  800b07:	48 89 c6             	mov    %rax,%rsi
  800b0a:	4c 89 e7             	mov    %r12,%rdi
  800b0d:	48 b8 03 10 80 00 00 	movabs $0x801003,%rax
  800b14:	00 00 00 
  800b17:	ff d0                	callq  *%rax
  800b19:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800b1c:	eb 17                	jmp    800b35 <vprintfmt+0x2f6>
  800b1e:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800b22:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800b26:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b2a:	48 89 ce             	mov    %rcx,%rsi
  800b2d:	89 d7                	mov    %edx,%edi
  800b2f:	ff d0                	callq  *%rax
  800b31:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800b35:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800b39:	7f e3                	jg     800b1e <vprintfmt+0x2df>
  800b3b:	eb 37                	jmp    800b74 <vprintfmt+0x335>
  800b3d:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  800b41:	74 1e                	je     800b61 <vprintfmt+0x322>
  800b43:	83 fb 1f             	cmp    $0x1f,%ebx
  800b46:	7e 05                	jle    800b4d <vprintfmt+0x30e>
  800b48:	83 fb 7e             	cmp    $0x7e,%ebx
  800b4b:	7e 14                	jle    800b61 <vprintfmt+0x322>
  800b4d:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800b51:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b55:	48 89 d6             	mov    %rdx,%rsi
  800b58:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800b5d:	ff d0                	callq  *%rax
  800b5f:	eb 0f                	jmp    800b70 <vprintfmt+0x331>
  800b61:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800b65:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b69:	48 89 d6             	mov    %rdx,%rsi
  800b6c:	89 df                	mov    %ebx,%edi
  800b6e:	ff d0                	callq  *%rax
  800b70:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800b74:	4c 89 e0             	mov    %r12,%rax
  800b77:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800b7b:	0f b6 00             	movzbl (%rax),%eax
  800b7e:	0f be d8             	movsbl %al,%ebx
  800b81:	85 db                	test   %ebx,%ebx
  800b83:	74 10                	je     800b95 <vprintfmt+0x356>
  800b85:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800b89:	78 b2                	js     800b3d <vprintfmt+0x2fe>
  800b8b:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800b8f:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800b93:	79 a8                	jns    800b3d <vprintfmt+0x2fe>
  800b95:	eb 16                	jmp    800bad <vprintfmt+0x36e>
  800b97:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800b9b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b9f:	48 89 d6             	mov    %rdx,%rsi
  800ba2:	bf 20 00 00 00       	mov    $0x20,%edi
  800ba7:	ff d0                	callq  *%rax
  800ba9:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800bad:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800bb1:	7f e4                	jg     800b97 <vprintfmt+0x358>
  800bb3:	e9 90 01 00 00       	jmpq   800d48 <vprintfmt+0x509>
  800bb8:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800bbc:	be 03 00 00 00       	mov    $0x3,%esi
  800bc1:	48 89 c7             	mov    %rax,%rdi
  800bc4:	48 b8 2f 07 80 00 00 	movabs $0x80072f,%rax
  800bcb:	00 00 00 
  800bce:	ff d0                	callq  *%rax
  800bd0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800bd4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800bd8:	48 85 c0             	test   %rax,%rax
  800bdb:	79 1d                	jns    800bfa <vprintfmt+0x3bb>
  800bdd:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800be1:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800be5:	48 89 d6             	mov    %rdx,%rsi
  800be8:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800bed:	ff d0                	callq  *%rax
  800bef:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800bf3:	48 f7 d8             	neg    %rax
  800bf6:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800bfa:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800c01:	e9 d5 00 00 00       	jmpq   800cdb <vprintfmt+0x49c>
  800c06:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800c0a:	be 03 00 00 00       	mov    $0x3,%esi
  800c0f:	48 89 c7             	mov    %rax,%rdi
  800c12:	48 b8 1f 06 80 00 00 	movabs $0x80061f,%rax
  800c19:	00 00 00 
  800c1c:	ff d0                	callq  *%rax
  800c1e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800c22:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800c29:	e9 ad 00 00 00       	jmpq   800cdb <vprintfmt+0x49c>
  800c2e:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800c32:	be 03 00 00 00       	mov    $0x3,%esi
  800c37:	48 89 c7             	mov    %rax,%rdi
  800c3a:	48 b8 1f 06 80 00 00 	movabs $0x80061f,%rax
  800c41:	00 00 00 
  800c44:	ff d0                	callq  *%rax
  800c46:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800c4a:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800c51:	e9 85 00 00 00       	jmpq   800cdb <vprintfmt+0x49c>
  800c56:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c5a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c5e:	48 89 d6             	mov    %rdx,%rsi
  800c61:	bf 30 00 00 00       	mov    $0x30,%edi
  800c66:	ff d0                	callq  *%rax
  800c68:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c6c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c70:	48 89 d6             	mov    %rdx,%rsi
  800c73:	bf 78 00 00 00       	mov    $0x78,%edi
  800c78:	ff d0                	callq  *%rax
  800c7a:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800c7d:	83 f8 30             	cmp    $0x30,%eax
  800c80:	73 17                	jae    800c99 <vprintfmt+0x45a>
  800c82:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800c86:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800c89:	89 c0                	mov    %eax,%eax
  800c8b:	48 01 d0             	add    %rdx,%rax
  800c8e:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800c91:	83 c2 08             	add    $0x8,%edx
  800c94:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800c97:	eb 0f                	jmp    800ca8 <vprintfmt+0x469>
  800c99:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800c9d:	48 89 d0             	mov    %rdx,%rax
  800ca0:	48 83 c2 08          	add    $0x8,%rdx
  800ca4:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800ca8:	48 8b 00             	mov    (%rax),%rax
  800cab:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800caf:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800cb6:	eb 23                	jmp    800cdb <vprintfmt+0x49c>
  800cb8:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800cbc:	be 03 00 00 00       	mov    $0x3,%esi
  800cc1:	48 89 c7             	mov    %rax,%rdi
  800cc4:	48 b8 1f 06 80 00 00 	movabs $0x80061f,%rax
  800ccb:	00 00 00 
  800cce:	ff d0                	callq  *%rax
  800cd0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800cd4:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800cdb:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  800ce0:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800ce3:	8b 7d dc             	mov    -0x24(%rbp),%edi
  800ce6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800cea:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800cee:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800cf2:	45 89 c1             	mov    %r8d,%r9d
  800cf5:	41 89 f8             	mov    %edi,%r8d
  800cf8:	48 89 c7             	mov    %rax,%rdi
  800cfb:	48 b8 64 05 80 00 00 	movabs $0x800564,%rax
  800d02:	00 00 00 
  800d05:	ff d0                	callq  *%rax
  800d07:	eb 3f                	jmp    800d48 <vprintfmt+0x509>
  800d09:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d0d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d11:	48 89 d6             	mov    %rdx,%rsi
  800d14:	89 df                	mov    %ebx,%edi
  800d16:	ff d0                	callq  *%rax
  800d18:	eb 2e                	jmp    800d48 <vprintfmt+0x509>
  800d1a:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d1e:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d22:	48 89 d6             	mov    %rdx,%rsi
  800d25:	bf 25 00 00 00       	mov    $0x25,%edi
  800d2a:	ff d0                	callq  *%rax
  800d2c:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800d31:	eb 05                	jmp    800d38 <vprintfmt+0x4f9>
  800d33:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800d38:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800d3c:	48 83 e8 01          	sub    $0x1,%rax
  800d40:	0f b6 00             	movzbl (%rax),%eax
  800d43:	3c 25                	cmp    $0x25,%al
  800d45:	75 ec                	jne    800d33 <vprintfmt+0x4f4>
  800d47:	90                   	nop
  800d48:	90                   	nop
  800d49:	e9 43 fb ff ff       	jmpq   800891 <vprintfmt+0x52>
  800d4e:	48 83 c4 60          	add    $0x60,%rsp
  800d52:	5b                   	pop    %rbx
  800d53:	41 5c                	pop    %r12
  800d55:	5d                   	pop    %rbp
  800d56:	c3                   	retq   

0000000000800d57 <printfmt>:
  800d57:	55                   	push   %rbp
  800d58:	48 89 e5             	mov    %rsp,%rbp
  800d5b:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  800d62:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  800d69:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  800d70:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800d77:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800d7e:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800d85:	84 c0                	test   %al,%al
  800d87:	74 20                	je     800da9 <printfmt+0x52>
  800d89:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800d8d:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800d91:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800d95:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800d99:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800d9d:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800da1:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800da5:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800da9:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  800db0:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  800db7:	00 00 00 
  800dba:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  800dc1:	00 00 00 
  800dc4:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800dc8:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800dcf:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800dd6:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  800ddd:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  800de4:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800deb:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  800df2:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  800df9:	48 89 c7             	mov    %rax,%rdi
  800dfc:	48 b8 3f 08 80 00 00 	movabs $0x80083f,%rax
  800e03:	00 00 00 
  800e06:	ff d0                	callq  *%rax
  800e08:	c9                   	leaveq 
  800e09:	c3                   	retq   

0000000000800e0a <sprintputch>:
  800e0a:	55                   	push   %rbp
  800e0b:	48 89 e5             	mov    %rsp,%rbp
  800e0e:	48 83 ec 10          	sub    $0x10,%rsp
  800e12:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800e15:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800e19:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e1d:	8b 40 10             	mov    0x10(%rax),%eax
  800e20:	8d 50 01             	lea    0x1(%rax),%edx
  800e23:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e27:	89 50 10             	mov    %edx,0x10(%rax)
  800e2a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e2e:	48 8b 10             	mov    (%rax),%rdx
  800e31:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e35:	48 8b 40 08          	mov    0x8(%rax),%rax
  800e39:	48 39 c2             	cmp    %rax,%rdx
  800e3c:	73 17                	jae    800e55 <sprintputch+0x4b>
  800e3e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e42:	48 8b 00             	mov    (%rax),%rax
  800e45:	48 8d 48 01          	lea    0x1(%rax),%rcx
  800e49:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800e4d:	48 89 0a             	mov    %rcx,(%rdx)
  800e50:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800e53:	88 10                	mov    %dl,(%rax)
  800e55:	c9                   	leaveq 
  800e56:	c3                   	retq   

0000000000800e57 <vsnprintf>:
  800e57:	55                   	push   %rbp
  800e58:	48 89 e5             	mov    %rsp,%rbp
  800e5b:	48 83 ec 50          	sub    $0x50,%rsp
  800e5f:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  800e63:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  800e66:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  800e6a:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  800e6e:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  800e72:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  800e76:	48 8b 0a             	mov    (%rdx),%rcx
  800e79:	48 89 08             	mov    %rcx,(%rax)
  800e7c:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800e80:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800e84:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800e88:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800e8c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800e90:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  800e94:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  800e97:	48 98                	cltq   
  800e99:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  800e9d:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800ea1:	48 01 d0             	add    %rdx,%rax
  800ea4:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  800ea8:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800eaf:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  800eb4:	74 06                	je     800ebc <vsnprintf+0x65>
  800eb6:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  800eba:	7f 07                	jg     800ec3 <vsnprintf+0x6c>
  800ebc:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800ec1:	eb 2f                	jmp    800ef2 <vsnprintf+0x9b>
  800ec3:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  800ec7:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  800ecb:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  800ecf:	48 89 c6             	mov    %rax,%rsi
  800ed2:	48 bf 0a 0e 80 00 00 	movabs $0x800e0a,%rdi
  800ed9:	00 00 00 
  800edc:	48 b8 3f 08 80 00 00 	movabs $0x80083f,%rax
  800ee3:	00 00 00 
  800ee6:	ff d0                	callq  *%rax
  800ee8:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800eec:	c6 00 00             	movb   $0x0,(%rax)
  800eef:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800ef2:	c9                   	leaveq 
  800ef3:	c3                   	retq   

0000000000800ef4 <snprintf>:
  800ef4:	55                   	push   %rbp
  800ef5:	48 89 e5             	mov    %rsp,%rbp
  800ef8:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  800eff:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800f06:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  800f0c:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800f13:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800f1a:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800f21:	84 c0                	test   %al,%al
  800f23:	74 20                	je     800f45 <snprintf+0x51>
  800f25:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800f29:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800f2d:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800f31:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800f35:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800f39:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800f3d:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800f41:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800f45:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  800f4c:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  800f53:	00 00 00 
  800f56:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800f5d:	00 00 00 
  800f60:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800f64:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800f6b:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800f72:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800f79:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800f80:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800f87:	48 8b 0a             	mov    (%rdx),%rcx
  800f8a:	48 89 08             	mov    %rcx,(%rax)
  800f8d:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800f91:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800f95:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800f99:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800f9d:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  800fa4:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  800fab:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  800fb1:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800fb8:	48 89 c7             	mov    %rax,%rdi
  800fbb:	48 b8 57 0e 80 00 00 	movabs $0x800e57,%rax
  800fc2:	00 00 00 
  800fc5:	ff d0                	callq  *%rax
  800fc7:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  800fcd:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  800fd3:	c9                   	leaveq 
  800fd4:	c3                   	retq   

0000000000800fd5 <strlen>:
  800fd5:	55                   	push   %rbp
  800fd6:	48 89 e5             	mov    %rsp,%rbp
  800fd9:	48 83 ec 18          	sub    $0x18,%rsp
  800fdd:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800fe1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800fe8:	eb 09                	jmp    800ff3 <strlen+0x1e>
  800fea:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800fee:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  800ff3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ff7:	0f b6 00             	movzbl (%rax),%eax
  800ffa:	84 c0                	test   %al,%al
  800ffc:	75 ec                	jne    800fea <strlen+0x15>
  800ffe:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801001:	c9                   	leaveq 
  801002:	c3                   	retq   

0000000000801003 <strnlen>:
  801003:	55                   	push   %rbp
  801004:	48 89 e5             	mov    %rsp,%rbp
  801007:	48 83 ec 20          	sub    $0x20,%rsp
  80100b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80100f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801013:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80101a:	eb 0e                	jmp    80102a <strnlen+0x27>
  80101c:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801020:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801025:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  80102a:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80102f:	74 0b                	je     80103c <strnlen+0x39>
  801031:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801035:	0f b6 00             	movzbl (%rax),%eax
  801038:	84 c0                	test   %al,%al
  80103a:	75 e0                	jne    80101c <strnlen+0x19>
  80103c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80103f:	c9                   	leaveq 
  801040:	c3                   	retq   

0000000000801041 <strcpy>:
  801041:	55                   	push   %rbp
  801042:	48 89 e5             	mov    %rsp,%rbp
  801045:	48 83 ec 20          	sub    $0x20,%rsp
  801049:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80104d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801051:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801055:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801059:	90                   	nop
  80105a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80105e:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801062:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801066:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80106a:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  80106e:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  801072:	0f b6 12             	movzbl (%rdx),%edx
  801075:	88 10                	mov    %dl,(%rax)
  801077:	0f b6 00             	movzbl (%rax),%eax
  80107a:	84 c0                	test   %al,%al
  80107c:	75 dc                	jne    80105a <strcpy+0x19>
  80107e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801082:	c9                   	leaveq 
  801083:	c3                   	retq   

0000000000801084 <strcat>:
  801084:	55                   	push   %rbp
  801085:	48 89 e5             	mov    %rsp,%rbp
  801088:	48 83 ec 20          	sub    $0x20,%rsp
  80108c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801090:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801094:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801098:	48 89 c7             	mov    %rax,%rdi
  80109b:	48 b8 d5 0f 80 00 00 	movabs $0x800fd5,%rax
  8010a2:	00 00 00 
  8010a5:	ff d0                	callq  *%rax
  8010a7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8010aa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8010ad:	48 63 d0             	movslq %eax,%rdx
  8010b0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010b4:	48 01 c2             	add    %rax,%rdx
  8010b7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8010bb:	48 89 c6             	mov    %rax,%rsi
  8010be:	48 89 d7             	mov    %rdx,%rdi
  8010c1:	48 b8 41 10 80 00 00 	movabs $0x801041,%rax
  8010c8:	00 00 00 
  8010cb:	ff d0                	callq  *%rax
  8010cd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010d1:	c9                   	leaveq 
  8010d2:	c3                   	retq   

00000000008010d3 <strncpy>:
  8010d3:	55                   	push   %rbp
  8010d4:	48 89 e5             	mov    %rsp,%rbp
  8010d7:	48 83 ec 28          	sub    $0x28,%rsp
  8010db:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8010df:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8010e3:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8010e7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010eb:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8010ef:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8010f6:	00 
  8010f7:	eb 2a                	jmp    801123 <strncpy+0x50>
  8010f9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010fd:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801101:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801105:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801109:	0f b6 12             	movzbl (%rdx),%edx
  80110c:	88 10                	mov    %dl,(%rax)
  80110e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801112:	0f b6 00             	movzbl (%rax),%eax
  801115:	84 c0                	test   %al,%al
  801117:	74 05                	je     80111e <strncpy+0x4b>
  801119:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  80111e:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801123:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801127:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  80112b:	72 cc                	jb     8010f9 <strncpy+0x26>
  80112d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801131:	c9                   	leaveq 
  801132:	c3                   	retq   

0000000000801133 <strlcpy>:
  801133:	55                   	push   %rbp
  801134:	48 89 e5             	mov    %rsp,%rbp
  801137:	48 83 ec 28          	sub    $0x28,%rsp
  80113b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80113f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801143:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801147:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80114b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80114f:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801154:	74 3d                	je     801193 <strlcpy+0x60>
  801156:	eb 1d                	jmp    801175 <strlcpy+0x42>
  801158:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80115c:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801160:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801164:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801168:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  80116c:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  801170:	0f b6 12             	movzbl (%rdx),%edx
  801173:	88 10                	mov    %dl,(%rax)
  801175:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  80117a:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80117f:	74 0b                	je     80118c <strlcpy+0x59>
  801181:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801185:	0f b6 00             	movzbl (%rax),%eax
  801188:	84 c0                	test   %al,%al
  80118a:	75 cc                	jne    801158 <strlcpy+0x25>
  80118c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801190:	c6 00 00             	movb   $0x0,(%rax)
  801193:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801197:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80119b:	48 29 c2             	sub    %rax,%rdx
  80119e:	48 89 d0             	mov    %rdx,%rax
  8011a1:	c9                   	leaveq 
  8011a2:	c3                   	retq   

00000000008011a3 <strcmp>:
  8011a3:	55                   	push   %rbp
  8011a4:	48 89 e5             	mov    %rsp,%rbp
  8011a7:	48 83 ec 10          	sub    $0x10,%rsp
  8011ab:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8011af:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8011b3:	eb 0a                	jmp    8011bf <strcmp+0x1c>
  8011b5:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8011ba:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8011bf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011c3:	0f b6 00             	movzbl (%rax),%eax
  8011c6:	84 c0                	test   %al,%al
  8011c8:	74 12                	je     8011dc <strcmp+0x39>
  8011ca:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011ce:	0f b6 10             	movzbl (%rax),%edx
  8011d1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8011d5:	0f b6 00             	movzbl (%rax),%eax
  8011d8:	38 c2                	cmp    %al,%dl
  8011da:	74 d9                	je     8011b5 <strcmp+0x12>
  8011dc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011e0:	0f b6 00             	movzbl (%rax),%eax
  8011e3:	0f b6 d0             	movzbl %al,%edx
  8011e6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8011ea:	0f b6 00             	movzbl (%rax),%eax
  8011ed:	0f b6 c0             	movzbl %al,%eax
  8011f0:	29 c2                	sub    %eax,%edx
  8011f2:	89 d0                	mov    %edx,%eax
  8011f4:	c9                   	leaveq 
  8011f5:	c3                   	retq   

00000000008011f6 <strncmp>:
  8011f6:	55                   	push   %rbp
  8011f7:	48 89 e5             	mov    %rsp,%rbp
  8011fa:	48 83 ec 18          	sub    $0x18,%rsp
  8011fe:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801202:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801206:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80120a:	eb 0f                	jmp    80121b <strncmp+0x25>
  80120c:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  801211:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801216:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  80121b:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801220:	74 1d                	je     80123f <strncmp+0x49>
  801222:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801226:	0f b6 00             	movzbl (%rax),%eax
  801229:	84 c0                	test   %al,%al
  80122b:	74 12                	je     80123f <strncmp+0x49>
  80122d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801231:	0f b6 10             	movzbl (%rax),%edx
  801234:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801238:	0f b6 00             	movzbl (%rax),%eax
  80123b:	38 c2                	cmp    %al,%dl
  80123d:	74 cd                	je     80120c <strncmp+0x16>
  80123f:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801244:	75 07                	jne    80124d <strncmp+0x57>
  801246:	b8 00 00 00 00       	mov    $0x0,%eax
  80124b:	eb 18                	jmp    801265 <strncmp+0x6f>
  80124d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801251:	0f b6 00             	movzbl (%rax),%eax
  801254:	0f b6 d0             	movzbl %al,%edx
  801257:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80125b:	0f b6 00             	movzbl (%rax),%eax
  80125e:	0f b6 c0             	movzbl %al,%eax
  801261:	29 c2                	sub    %eax,%edx
  801263:	89 d0                	mov    %edx,%eax
  801265:	c9                   	leaveq 
  801266:	c3                   	retq   

0000000000801267 <strchr>:
  801267:	55                   	push   %rbp
  801268:	48 89 e5             	mov    %rsp,%rbp
  80126b:	48 83 ec 0c          	sub    $0xc,%rsp
  80126f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801273:	89 f0                	mov    %esi,%eax
  801275:	88 45 f4             	mov    %al,-0xc(%rbp)
  801278:	eb 17                	jmp    801291 <strchr+0x2a>
  80127a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80127e:	0f b6 00             	movzbl (%rax),%eax
  801281:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801284:	75 06                	jne    80128c <strchr+0x25>
  801286:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80128a:	eb 15                	jmp    8012a1 <strchr+0x3a>
  80128c:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801291:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801295:	0f b6 00             	movzbl (%rax),%eax
  801298:	84 c0                	test   %al,%al
  80129a:	75 de                	jne    80127a <strchr+0x13>
  80129c:	b8 00 00 00 00       	mov    $0x0,%eax
  8012a1:	c9                   	leaveq 
  8012a2:	c3                   	retq   

00000000008012a3 <strfind>:
  8012a3:	55                   	push   %rbp
  8012a4:	48 89 e5             	mov    %rsp,%rbp
  8012a7:	48 83 ec 0c          	sub    $0xc,%rsp
  8012ab:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8012af:	89 f0                	mov    %esi,%eax
  8012b1:	88 45 f4             	mov    %al,-0xc(%rbp)
  8012b4:	eb 13                	jmp    8012c9 <strfind+0x26>
  8012b6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012ba:	0f b6 00             	movzbl (%rax),%eax
  8012bd:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8012c0:	75 02                	jne    8012c4 <strfind+0x21>
  8012c2:	eb 10                	jmp    8012d4 <strfind+0x31>
  8012c4:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8012c9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012cd:	0f b6 00             	movzbl (%rax),%eax
  8012d0:	84 c0                	test   %al,%al
  8012d2:	75 e2                	jne    8012b6 <strfind+0x13>
  8012d4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012d8:	c9                   	leaveq 
  8012d9:	c3                   	retq   

00000000008012da <memset>:
  8012da:	55                   	push   %rbp
  8012db:	48 89 e5             	mov    %rsp,%rbp
  8012de:	48 83 ec 18          	sub    $0x18,%rsp
  8012e2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8012e6:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8012e9:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8012ed:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8012f2:	75 06                	jne    8012fa <memset+0x20>
  8012f4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012f8:	eb 69                	jmp    801363 <memset+0x89>
  8012fa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012fe:	83 e0 03             	and    $0x3,%eax
  801301:	48 85 c0             	test   %rax,%rax
  801304:	75 48                	jne    80134e <memset+0x74>
  801306:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80130a:	83 e0 03             	and    $0x3,%eax
  80130d:	48 85 c0             	test   %rax,%rax
  801310:	75 3c                	jne    80134e <memset+0x74>
  801312:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  801319:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80131c:	c1 e0 18             	shl    $0x18,%eax
  80131f:	89 c2                	mov    %eax,%edx
  801321:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801324:	c1 e0 10             	shl    $0x10,%eax
  801327:	09 c2                	or     %eax,%edx
  801329:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80132c:	c1 e0 08             	shl    $0x8,%eax
  80132f:	09 d0                	or     %edx,%eax
  801331:	09 45 f4             	or     %eax,-0xc(%rbp)
  801334:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801338:	48 c1 e8 02          	shr    $0x2,%rax
  80133c:	48 89 c1             	mov    %rax,%rcx
  80133f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801343:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801346:	48 89 d7             	mov    %rdx,%rdi
  801349:	fc                   	cld    
  80134a:	f3 ab                	rep stos %eax,%es:(%rdi)
  80134c:	eb 11                	jmp    80135f <memset+0x85>
  80134e:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801352:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801355:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801359:	48 89 d7             	mov    %rdx,%rdi
  80135c:	fc                   	cld    
  80135d:	f3 aa                	rep stos %al,%es:(%rdi)
  80135f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801363:	c9                   	leaveq 
  801364:	c3                   	retq   

0000000000801365 <memmove>:
  801365:	55                   	push   %rbp
  801366:	48 89 e5             	mov    %rsp,%rbp
  801369:	48 83 ec 28          	sub    $0x28,%rsp
  80136d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801371:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801375:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801379:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80137d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801381:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801385:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801389:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80138d:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801391:	0f 83 88 00 00 00    	jae    80141f <memmove+0xba>
  801397:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80139b:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80139f:	48 01 d0             	add    %rdx,%rax
  8013a2:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8013a6:	76 77                	jbe    80141f <memmove+0xba>
  8013a8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8013ac:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  8013b0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8013b4:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  8013b8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013bc:	83 e0 03             	and    $0x3,%eax
  8013bf:	48 85 c0             	test   %rax,%rax
  8013c2:	75 3b                	jne    8013ff <memmove+0x9a>
  8013c4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8013c8:	83 e0 03             	and    $0x3,%eax
  8013cb:	48 85 c0             	test   %rax,%rax
  8013ce:	75 2f                	jne    8013ff <memmove+0x9a>
  8013d0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8013d4:	83 e0 03             	and    $0x3,%eax
  8013d7:	48 85 c0             	test   %rax,%rax
  8013da:	75 23                	jne    8013ff <memmove+0x9a>
  8013dc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8013e0:	48 83 e8 04          	sub    $0x4,%rax
  8013e4:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8013e8:	48 83 ea 04          	sub    $0x4,%rdx
  8013ec:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  8013f0:	48 c1 e9 02          	shr    $0x2,%rcx
  8013f4:	48 89 c7             	mov    %rax,%rdi
  8013f7:	48 89 d6             	mov    %rdx,%rsi
  8013fa:	fd                   	std    
  8013fb:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  8013fd:	eb 1d                	jmp    80141c <memmove+0xb7>
  8013ff:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801403:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801407:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80140b:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  80140f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801413:	48 89 d7             	mov    %rdx,%rdi
  801416:	48 89 c1             	mov    %rax,%rcx
  801419:	fd                   	std    
  80141a:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  80141c:	fc                   	cld    
  80141d:	eb 57                	jmp    801476 <memmove+0x111>
  80141f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801423:	83 e0 03             	and    $0x3,%eax
  801426:	48 85 c0             	test   %rax,%rax
  801429:	75 36                	jne    801461 <memmove+0xfc>
  80142b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80142f:	83 e0 03             	and    $0x3,%eax
  801432:	48 85 c0             	test   %rax,%rax
  801435:	75 2a                	jne    801461 <memmove+0xfc>
  801437:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80143b:	83 e0 03             	and    $0x3,%eax
  80143e:	48 85 c0             	test   %rax,%rax
  801441:	75 1e                	jne    801461 <memmove+0xfc>
  801443:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801447:	48 c1 e8 02          	shr    $0x2,%rax
  80144b:	48 89 c1             	mov    %rax,%rcx
  80144e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801452:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801456:	48 89 c7             	mov    %rax,%rdi
  801459:	48 89 d6             	mov    %rdx,%rsi
  80145c:	fc                   	cld    
  80145d:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  80145f:	eb 15                	jmp    801476 <memmove+0x111>
  801461:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801465:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801469:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  80146d:	48 89 c7             	mov    %rax,%rdi
  801470:	48 89 d6             	mov    %rdx,%rsi
  801473:	fc                   	cld    
  801474:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801476:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80147a:	c9                   	leaveq 
  80147b:	c3                   	retq   

000000000080147c <memcpy>:
  80147c:	55                   	push   %rbp
  80147d:	48 89 e5             	mov    %rsp,%rbp
  801480:	48 83 ec 18          	sub    $0x18,%rsp
  801484:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801488:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80148c:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801490:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801494:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  801498:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80149c:	48 89 ce             	mov    %rcx,%rsi
  80149f:	48 89 c7             	mov    %rax,%rdi
  8014a2:	48 b8 65 13 80 00 00 	movabs $0x801365,%rax
  8014a9:	00 00 00 
  8014ac:	ff d0                	callq  *%rax
  8014ae:	c9                   	leaveq 
  8014af:	c3                   	retq   

00000000008014b0 <memcmp>:
  8014b0:	55                   	push   %rbp
  8014b1:	48 89 e5             	mov    %rsp,%rbp
  8014b4:	48 83 ec 28          	sub    $0x28,%rsp
  8014b8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8014bc:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8014c0:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8014c4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014c8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8014cc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8014d0:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8014d4:	eb 36                	jmp    80150c <memcmp+0x5c>
  8014d6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014da:	0f b6 10             	movzbl (%rax),%edx
  8014dd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014e1:	0f b6 00             	movzbl (%rax),%eax
  8014e4:	38 c2                	cmp    %al,%dl
  8014e6:	74 1a                	je     801502 <memcmp+0x52>
  8014e8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014ec:	0f b6 00             	movzbl (%rax),%eax
  8014ef:	0f b6 d0             	movzbl %al,%edx
  8014f2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014f6:	0f b6 00             	movzbl (%rax),%eax
  8014f9:	0f b6 c0             	movzbl %al,%eax
  8014fc:	29 c2                	sub    %eax,%edx
  8014fe:	89 d0                	mov    %edx,%eax
  801500:	eb 20                	jmp    801522 <memcmp+0x72>
  801502:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801507:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  80150c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801510:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801514:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801518:	48 85 c0             	test   %rax,%rax
  80151b:	75 b9                	jne    8014d6 <memcmp+0x26>
  80151d:	b8 00 00 00 00       	mov    $0x0,%eax
  801522:	c9                   	leaveq 
  801523:	c3                   	retq   

0000000000801524 <memfind>:
  801524:	55                   	push   %rbp
  801525:	48 89 e5             	mov    %rsp,%rbp
  801528:	48 83 ec 28          	sub    $0x28,%rsp
  80152c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801530:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  801533:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801537:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80153b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80153f:	48 01 d0             	add    %rdx,%rax
  801542:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801546:	eb 15                	jmp    80155d <memfind+0x39>
  801548:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80154c:	0f b6 10             	movzbl (%rax),%edx
  80154f:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801552:	38 c2                	cmp    %al,%dl
  801554:	75 02                	jne    801558 <memfind+0x34>
  801556:	eb 0f                	jmp    801567 <memfind+0x43>
  801558:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80155d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801561:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  801565:	72 e1                	jb     801548 <memfind+0x24>
  801567:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80156b:	c9                   	leaveq 
  80156c:	c3                   	retq   

000000000080156d <strtol>:
  80156d:	55                   	push   %rbp
  80156e:	48 89 e5             	mov    %rsp,%rbp
  801571:	48 83 ec 34          	sub    $0x34,%rsp
  801575:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801579:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80157d:	89 55 cc             	mov    %edx,-0x34(%rbp)
  801580:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801587:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  80158e:	00 
  80158f:	eb 05                	jmp    801596 <strtol+0x29>
  801591:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801596:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80159a:	0f b6 00             	movzbl (%rax),%eax
  80159d:	3c 20                	cmp    $0x20,%al
  80159f:	74 f0                	je     801591 <strtol+0x24>
  8015a1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015a5:	0f b6 00             	movzbl (%rax),%eax
  8015a8:	3c 09                	cmp    $0x9,%al
  8015aa:	74 e5                	je     801591 <strtol+0x24>
  8015ac:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015b0:	0f b6 00             	movzbl (%rax),%eax
  8015b3:	3c 2b                	cmp    $0x2b,%al
  8015b5:	75 07                	jne    8015be <strtol+0x51>
  8015b7:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8015bc:	eb 17                	jmp    8015d5 <strtol+0x68>
  8015be:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015c2:	0f b6 00             	movzbl (%rax),%eax
  8015c5:	3c 2d                	cmp    $0x2d,%al
  8015c7:	75 0c                	jne    8015d5 <strtol+0x68>
  8015c9:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8015ce:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  8015d5:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8015d9:	74 06                	je     8015e1 <strtol+0x74>
  8015db:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  8015df:	75 28                	jne    801609 <strtol+0x9c>
  8015e1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015e5:	0f b6 00             	movzbl (%rax),%eax
  8015e8:	3c 30                	cmp    $0x30,%al
  8015ea:	75 1d                	jne    801609 <strtol+0x9c>
  8015ec:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015f0:	48 83 c0 01          	add    $0x1,%rax
  8015f4:	0f b6 00             	movzbl (%rax),%eax
  8015f7:	3c 78                	cmp    $0x78,%al
  8015f9:	75 0e                	jne    801609 <strtol+0x9c>
  8015fb:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  801600:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  801607:	eb 2c                	jmp    801635 <strtol+0xc8>
  801609:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  80160d:	75 19                	jne    801628 <strtol+0xbb>
  80160f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801613:	0f b6 00             	movzbl (%rax),%eax
  801616:	3c 30                	cmp    $0x30,%al
  801618:	75 0e                	jne    801628 <strtol+0xbb>
  80161a:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80161f:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  801626:	eb 0d                	jmp    801635 <strtol+0xc8>
  801628:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  80162c:	75 07                	jne    801635 <strtol+0xc8>
  80162e:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  801635:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801639:	0f b6 00             	movzbl (%rax),%eax
  80163c:	3c 2f                	cmp    $0x2f,%al
  80163e:	7e 1d                	jle    80165d <strtol+0xf0>
  801640:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801644:	0f b6 00             	movzbl (%rax),%eax
  801647:	3c 39                	cmp    $0x39,%al
  801649:	7f 12                	jg     80165d <strtol+0xf0>
  80164b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80164f:	0f b6 00             	movzbl (%rax),%eax
  801652:	0f be c0             	movsbl %al,%eax
  801655:	83 e8 30             	sub    $0x30,%eax
  801658:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80165b:	eb 4e                	jmp    8016ab <strtol+0x13e>
  80165d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801661:	0f b6 00             	movzbl (%rax),%eax
  801664:	3c 60                	cmp    $0x60,%al
  801666:	7e 1d                	jle    801685 <strtol+0x118>
  801668:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80166c:	0f b6 00             	movzbl (%rax),%eax
  80166f:	3c 7a                	cmp    $0x7a,%al
  801671:	7f 12                	jg     801685 <strtol+0x118>
  801673:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801677:	0f b6 00             	movzbl (%rax),%eax
  80167a:	0f be c0             	movsbl %al,%eax
  80167d:	83 e8 57             	sub    $0x57,%eax
  801680:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801683:	eb 26                	jmp    8016ab <strtol+0x13e>
  801685:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801689:	0f b6 00             	movzbl (%rax),%eax
  80168c:	3c 40                	cmp    $0x40,%al
  80168e:	7e 48                	jle    8016d8 <strtol+0x16b>
  801690:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801694:	0f b6 00             	movzbl (%rax),%eax
  801697:	3c 5a                	cmp    $0x5a,%al
  801699:	7f 3d                	jg     8016d8 <strtol+0x16b>
  80169b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80169f:	0f b6 00             	movzbl (%rax),%eax
  8016a2:	0f be c0             	movsbl %al,%eax
  8016a5:	83 e8 37             	sub    $0x37,%eax
  8016a8:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8016ab:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8016ae:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  8016b1:	7c 02                	jl     8016b5 <strtol+0x148>
  8016b3:	eb 23                	jmp    8016d8 <strtol+0x16b>
  8016b5:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8016ba:	8b 45 cc             	mov    -0x34(%rbp),%eax
  8016bd:	48 98                	cltq   
  8016bf:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  8016c4:	48 89 c2             	mov    %rax,%rdx
  8016c7:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8016ca:	48 98                	cltq   
  8016cc:	48 01 d0             	add    %rdx,%rax
  8016cf:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8016d3:	e9 5d ff ff ff       	jmpq   801635 <strtol+0xc8>
  8016d8:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  8016dd:	74 0b                	je     8016ea <strtol+0x17d>
  8016df:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8016e3:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8016e7:	48 89 10             	mov    %rdx,(%rax)
  8016ea:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8016ee:	74 09                	je     8016f9 <strtol+0x18c>
  8016f0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8016f4:	48 f7 d8             	neg    %rax
  8016f7:	eb 04                	jmp    8016fd <strtol+0x190>
  8016f9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8016fd:	c9                   	leaveq 
  8016fe:	c3                   	retq   

00000000008016ff <strstr>:
  8016ff:	55                   	push   %rbp
  801700:	48 89 e5             	mov    %rsp,%rbp
  801703:	48 83 ec 30          	sub    $0x30,%rsp
  801707:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80170b:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80170f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801713:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801717:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  80171b:	0f b6 00             	movzbl (%rax),%eax
  80171e:	88 45 ff             	mov    %al,-0x1(%rbp)
  801721:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  801725:	75 06                	jne    80172d <strstr+0x2e>
  801727:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80172b:	eb 6b                	jmp    801798 <strstr+0x99>
  80172d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801731:	48 89 c7             	mov    %rax,%rdi
  801734:	48 b8 d5 0f 80 00 00 	movabs $0x800fd5,%rax
  80173b:	00 00 00 
  80173e:	ff d0                	callq  *%rax
  801740:	48 98                	cltq   
  801742:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801746:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80174a:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80174e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801752:	0f b6 00             	movzbl (%rax),%eax
  801755:	88 45 ef             	mov    %al,-0x11(%rbp)
  801758:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  80175c:	75 07                	jne    801765 <strstr+0x66>
  80175e:	b8 00 00 00 00       	mov    $0x0,%eax
  801763:	eb 33                	jmp    801798 <strstr+0x99>
  801765:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  801769:	3a 45 ff             	cmp    -0x1(%rbp),%al
  80176c:	75 d8                	jne    801746 <strstr+0x47>
  80176e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801772:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  801776:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80177a:	48 89 ce             	mov    %rcx,%rsi
  80177d:	48 89 c7             	mov    %rax,%rdi
  801780:	48 b8 f6 11 80 00 00 	movabs $0x8011f6,%rax
  801787:	00 00 00 
  80178a:	ff d0                	callq  *%rax
  80178c:	85 c0                	test   %eax,%eax
  80178e:	75 b6                	jne    801746 <strstr+0x47>
  801790:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801794:	48 83 e8 01          	sub    $0x1,%rax
  801798:	c9                   	leaveq 
  801799:	c3                   	retq   

000000000080179a <syscall>:
  80179a:	55                   	push   %rbp
  80179b:	48 89 e5             	mov    %rsp,%rbp
  80179e:	53                   	push   %rbx
  80179f:	48 83 ec 48          	sub    $0x48,%rsp
  8017a3:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8017a6:	89 75 d8             	mov    %esi,-0x28(%rbp)
  8017a9:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  8017ad:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  8017b1:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  8017b5:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  8017b9:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8017bc:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  8017c0:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  8017c4:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  8017c8:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  8017cc:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  8017d0:	4c 89 c3             	mov    %r8,%rbx
  8017d3:	cd 30                	int    $0x30
  8017d5:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8017d9:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  8017dd:	74 3e                	je     80181d <syscall+0x83>
  8017df:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8017e4:	7e 37                	jle    80181d <syscall+0x83>
  8017e6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8017ea:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8017ed:	49 89 d0             	mov    %rdx,%r8
  8017f0:	89 c1                	mov    %eax,%ecx
  8017f2:	48 ba a8 46 80 00 00 	movabs $0x8046a8,%rdx
  8017f9:	00 00 00 
  8017fc:	be 24 00 00 00       	mov    $0x24,%esi
  801801:	48 bf c5 46 80 00 00 	movabs $0x8046c5,%rdi
  801808:	00 00 00 
  80180b:	b8 00 00 00 00       	mov    $0x0,%eax
  801810:	49 b9 53 02 80 00 00 	movabs $0x800253,%r9
  801817:	00 00 00 
  80181a:	41 ff d1             	callq  *%r9
  80181d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801821:	48 83 c4 48          	add    $0x48,%rsp
  801825:	5b                   	pop    %rbx
  801826:	5d                   	pop    %rbp
  801827:	c3                   	retq   

0000000000801828 <sys_cputs>:
  801828:	55                   	push   %rbp
  801829:	48 89 e5             	mov    %rsp,%rbp
  80182c:	48 83 ec 20          	sub    $0x20,%rsp
  801830:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801834:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801838:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80183c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801840:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801847:	00 
  801848:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80184e:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801854:	48 89 d1             	mov    %rdx,%rcx
  801857:	48 89 c2             	mov    %rax,%rdx
  80185a:	be 00 00 00 00       	mov    $0x0,%esi
  80185f:	bf 00 00 00 00       	mov    $0x0,%edi
  801864:	48 b8 9a 17 80 00 00 	movabs $0x80179a,%rax
  80186b:	00 00 00 
  80186e:	ff d0                	callq  *%rax
  801870:	c9                   	leaveq 
  801871:	c3                   	retq   

0000000000801872 <sys_cgetc>:
  801872:	55                   	push   %rbp
  801873:	48 89 e5             	mov    %rsp,%rbp
  801876:	48 83 ec 10          	sub    $0x10,%rsp
  80187a:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801881:	00 
  801882:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801888:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80188e:	b9 00 00 00 00       	mov    $0x0,%ecx
  801893:	ba 00 00 00 00       	mov    $0x0,%edx
  801898:	be 00 00 00 00       	mov    $0x0,%esi
  80189d:	bf 01 00 00 00       	mov    $0x1,%edi
  8018a2:	48 b8 9a 17 80 00 00 	movabs $0x80179a,%rax
  8018a9:	00 00 00 
  8018ac:	ff d0                	callq  *%rax
  8018ae:	c9                   	leaveq 
  8018af:	c3                   	retq   

00000000008018b0 <sys_env_destroy>:
  8018b0:	55                   	push   %rbp
  8018b1:	48 89 e5             	mov    %rsp,%rbp
  8018b4:	48 83 ec 10          	sub    $0x10,%rsp
  8018b8:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8018bb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8018be:	48 98                	cltq   
  8018c0:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8018c7:	00 
  8018c8:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8018ce:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8018d4:	b9 00 00 00 00       	mov    $0x0,%ecx
  8018d9:	48 89 c2             	mov    %rax,%rdx
  8018dc:	be 01 00 00 00       	mov    $0x1,%esi
  8018e1:	bf 03 00 00 00       	mov    $0x3,%edi
  8018e6:	48 b8 9a 17 80 00 00 	movabs $0x80179a,%rax
  8018ed:	00 00 00 
  8018f0:	ff d0                	callq  *%rax
  8018f2:	c9                   	leaveq 
  8018f3:	c3                   	retq   

00000000008018f4 <sys_getenvid>:
  8018f4:	55                   	push   %rbp
  8018f5:	48 89 e5             	mov    %rsp,%rbp
  8018f8:	48 83 ec 10          	sub    $0x10,%rsp
  8018fc:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801903:	00 
  801904:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80190a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801910:	b9 00 00 00 00       	mov    $0x0,%ecx
  801915:	ba 00 00 00 00       	mov    $0x0,%edx
  80191a:	be 00 00 00 00       	mov    $0x0,%esi
  80191f:	bf 02 00 00 00       	mov    $0x2,%edi
  801924:	48 b8 9a 17 80 00 00 	movabs $0x80179a,%rax
  80192b:	00 00 00 
  80192e:	ff d0                	callq  *%rax
  801930:	c9                   	leaveq 
  801931:	c3                   	retq   

0000000000801932 <sys_yield>:
  801932:	55                   	push   %rbp
  801933:	48 89 e5             	mov    %rsp,%rbp
  801936:	48 83 ec 10          	sub    $0x10,%rsp
  80193a:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801941:	00 
  801942:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801948:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80194e:	b9 00 00 00 00       	mov    $0x0,%ecx
  801953:	ba 00 00 00 00       	mov    $0x0,%edx
  801958:	be 00 00 00 00       	mov    $0x0,%esi
  80195d:	bf 0b 00 00 00       	mov    $0xb,%edi
  801962:	48 b8 9a 17 80 00 00 	movabs $0x80179a,%rax
  801969:	00 00 00 
  80196c:	ff d0                	callq  *%rax
  80196e:	c9                   	leaveq 
  80196f:	c3                   	retq   

0000000000801970 <sys_page_alloc>:
  801970:	55                   	push   %rbp
  801971:	48 89 e5             	mov    %rsp,%rbp
  801974:	48 83 ec 20          	sub    $0x20,%rsp
  801978:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80197b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80197f:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801982:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801985:	48 63 c8             	movslq %eax,%rcx
  801988:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80198c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80198f:	48 98                	cltq   
  801991:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801998:	00 
  801999:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80199f:	49 89 c8             	mov    %rcx,%r8
  8019a2:	48 89 d1             	mov    %rdx,%rcx
  8019a5:	48 89 c2             	mov    %rax,%rdx
  8019a8:	be 01 00 00 00       	mov    $0x1,%esi
  8019ad:	bf 04 00 00 00       	mov    $0x4,%edi
  8019b2:	48 b8 9a 17 80 00 00 	movabs $0x80179a,%rax
  8019b9:	00 00 00 
  8019bc:	ff d0                	callq  *%rax
  8019be:	c9                   	leaveq 
  8019bf:	c3                   	retq   

00000000008019c0 <sys_page_map>:
  8019c0:	55                   	push   %rbp
  8019c1:	48 89 e5             	mov    %rsp,%rbp
  8019c4:	48 83 ec 30          	sub    $0x30,%rsp
  8019c8:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8019cb:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8019cf:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8019d2:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  8019d6:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  8019da:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8019dd:	48 63 c8             	movslq %eax,%rcx
  8019e0:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  8019e4:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8019e7:	48 63 f0             	movslq %eax,%rsi
  8019ea:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8019ee:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8019f1:	48 98                	cltq   
  8019f3:	48 89 0c 24          	mov    %rcx,(%rsp)
  8019f7:	49 89 f9             	mov    %rdi,%r9
  8019fa:	49 89 f0             	mov    %rsi,%r8
  8019fd:	48 89 d1             	mov    %rdx,%rcx
  801a00:	48 89 c2             	mov    %rax,%rdx
  801a03:	be 01 00 00 00       	mov    $0x1,%esi
  801a08:	bf 05 00 00 00       	mov    $0x5,%edi
  801a0d:	48 b8 9a 17 80 00 00 	movabs $0x80179a,%rax
  801a14:	00 00 00 
  801a17:	ff d0                	callq  *%rax
  801a19:	c9                   	leaveq 
  801a1a:	c3                   	retq   

0000000000801a1b <sys_page_unmap>:
  801a1b:	55                   	push   %rbp
  801a1c:	48 89 e5             	mov    %rsp,%rbp
  801a1f:	48 83 ec 20          	sub    $0x20,%rsp
  801a23:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a26:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a2a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801a2e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a31:	48 98                	cltq   
  801a33:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801a3a:	00 
  801a3b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a41:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a47:	48 89 d1             	mov    %rdx,%rcx
  801a4a:	48 89 c2             	mov    %rax,%rdx
  801a4d:	be 01 00 00 00       	mov    $0x1,%esi
  801a52:	bf 06 00 00 00       	mov    $0x6,%edi
  801a57:	48 b8 9a 17 80 00 00 	movabs $0x80179a,%rax
  801a5e:	00 00 00 
  801a61:	ff d0                	callq  *%rax
  801a63:	c9                   	leaveq 
  801a64:	c3                   	retq   

0000000000801a65 <sys_env_set_status>:
  801a65:	55                   	push   %rbp
  801a66:	48 89 e5             	mov    %rsp,%rbp
  801a69:	48 83 ec 10          	sub    $0x10,%rsp
  801a6d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a70:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801a73:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801a76:	48 63 d0             	movslq %eax,%rdx
  801a79:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a7c:	48 98                	cltq   
  801a7e:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801a85:	00 
  801a86:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a8c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a92:	48 89 d1             	mov    %rdx,%rcx
  801a95:	48 89 c2             	mov    %rax,%rdx
  801a98:	be 01 00 00 00       	mov    $0x1,%esi
  801a9d:	bf 08 00 00 00       	mov    $0x8,%edi
  801aa2:	48 b8 9a 17 80 00 00 	movabs $0x80179a,%rax
  801aa9:	00 00 00 
  801aac:	ff d0                	callq  *%rax
  801aae:	c9                   	leaveq 
  801aaf:	c3                   	retq   

0000000000801ab0 <sys_env_set_trapframe>:
  801ab0:	55                   	push   %rbp
  801ab1:	48 89 e5             	mov    %rsp,%rbp
  801ab4:	48 83 ec 20          	sub    $0x20,%rsp
  801ab8:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801abb:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801abf:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801ac3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ac6:	48 98                	cltq   
  801ac8:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801acf:	00 
  801ad0:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ad6:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801adc:	48 89 d1             	mov    %rdx,%rcx
  801adf:	48 89 c2             	mov    %rax,%rdx
  801ae2:	be 01 00 00 00       	mov    $0x1,%esi
  801ae7:	bf 09 00 00 00       	mov    $0x9,%edi
  801aec:	48 b8 9a 17 80 00 00 	movabs $0x80179a,%rax
  801af3:	00 00 00 
  801af6:	ff d0                	callq  *%rax
  801af8:	c9                   	leaveq 
  801af9:	c3                   	retq   

0000000000801afa <sys_env_set_pgfault_upcall>:
  801afa:	55                   	push   %rbp
  801afb:	48 89 e5             	mov    %rsp,%rbp
  801afe:	48 83 ec 20          	sub    $0x20,%rsp
  801b02:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b05:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b09:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b0d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b10:	48 98                	cltq   
  801b12:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801b19:	00 
  801b1a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b20:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b26:	48 89 d1             	mov    %rdx,%rcx
  801b29:	48 89 c2             	mov    %rax,%rdx
  801b2c:	be 01 00 00 00       	mov    $0x1,%esi
  801b31:	bf 0a 00 00 00       	mov    $0xa,%edi
  801b36:	48 b8 9a 17 80 00 00 	movabs $0x80179a,%rax
  801b3d:	00 00 00 
  801b40:	ff d0                	callq  *%rax
  801b42:	c9                   	leaveq 
  801b43:	c3                   	retq   

0000000000801b44 <sys_ipc_try_send>:
  801b44:	55                   	push   %rbp
  801b45:	48 89 e5             	mov    %rsp,%rbp
  801b48:	48 83 ec 20          	sub    $0x20,%rsp
  801b4c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b4f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b53:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801b57:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801b5a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801b5d:	48 63 f0             	movslq %eax,%rsi
  801b60:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801b64:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b67:	48 98                	cltq   
  801b69:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b6d:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801b74:	00 
  801b75:	49 89 f1             	mov    %rsi,%r9
  801b78:	49 89 c8             	mov    %rcx,%r8
  801b7b:	48 89 d1             	mov    %rdx,%rcx
  801b7e:	48 89 c2             	mov    %rax,%rdx
  801b81:	be 00 00 00 00       	mov    $0x0,%esi
  801b86:	bf 0c 00 00 00       	mov    $0xc,%edi
  801b8b:	48 b8 9a 17 80 00 00 	movabs $0x80179a,%rax
  801b92:	00 00 00 
  801b95:	ff d0                	callq  *%rax
  801b97:	c9                   	leaveq 
  801b98:	c3                   	retq   

0000000000801b99 <sys_ipc_recv>:
  801b99:	55                   	push   %rbp
  801b9a:	48 89 e5             	mov    %rsp,%rbp
  801b9d:	48 83 ec 10          	sub    $0x10,%rsp
  801ba1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801ba5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ba9:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801bb0:	00 
  801bb1:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801bb7:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801bbd:	b9 00 00 00 00       	mov    $0x0,%ecx
  801bc2:	48 89 c2             	mov    %rax,%rdx
  801bc5:	be 01 00 00 00       	mov    $0x1,%esi
  801bca:	bf 0d 00 00 00       	mov    $0xd,%edi
  801bcf:	48 b8 9a 17 80 00 00 	movabs $0x80179a,%rax
  801bd6:	00 00 00 
  801bd9:	ff d0                	callq  *%rax
  801bdb:	c9                   	leaveq 
  801bdc:	c3                   	retq   

0000000000801bdd <sys_time_msec>:
  801bdd:	55                   	push   %rbp
  801bde:	48 89 e5             	mov    %rsp,%rbp
  801be1:	48 83 ec 10          	sub    $0x10,%rsp
  801be5:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801bec:	00 
  801bed:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801bf3:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801bf9:	b9 00 00 00 00       	mov    $0x0,%ecx
  801bfe:	ba 00 00 00 00       	mov    $0x0,%edx
  801c03:	be 00 00 00 00       	mov    $0x0,%esi
  801c08:	bf 0e 00 00 00       	mov    $0xe,%edi
  801c0d:	48 b8 9a 17 80 00 00 	movabs $0x80179a,%rax
  801c14:	00 00 00 
  801c17:	ff d0                	callq  *%rax
  801c19:	c9                   	leaveq 
  801c1a:	c3                   	retq   

0000000000801c1b <sys_net_transmit>:
  801c1b:	55                   	push   %rbp
  801c1c:	48 89 e5             	mov    %rsp,%rbp
  801c1f:	48 83 ec 20          	sub    $0x20,%rsp
  801c23:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c27:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801c2a:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801c2d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c31:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c38:	00 
  801c39:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c3f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c45:	48 89 d1             	mov    %rdx,%rcx
  801c48:	48 89 c2             	mov    %rax,%rdx
  801c4b:	be 00 00 00 00       	mov    $0x0,%esi
  801c50:	bf 0f 00 00 00       	mov    $0xf,%edi
  801c55:	48 b8 9a 17 80 00 00 	movabs $0x80179a,%rax
  801c5c:	00 00 00 
  801c5f:	ff d0                	callq  *%rax
  801c61:	c9                   	leaveq 
  801c62:	c3                   	retq   

0000000000801c63 <sys_net_receive>:
  801c63:	55                   	push   %rbp
  801c64:	48 89 e5             	mov    %rsp,%rbp
  801c67:	48 83 ec 20          	sub    $0x20,%rsp
  801c6b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c6f:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801c72:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801c75:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c79:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c80:	00 
  801c81:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c87:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c8d:	48 89 d1             	mov    %rdx,%rcx
  801c90:	48 89 c2             	mov    %rax,%rdx
  801c93:	be 00 00 00 00       	mov    $0x0,%esi
  801c98:	bf 10 00 00 00       	mov    $0x10,%edi
  801c9d:	48 b8 9a 17 80 00 00 	movabs $0x80179a,%rax
  801ca4:	00 00 00 
  801ca7:	ff d0                	callq  *%rax
  801ca9:	c9                   	leaveq 
  801caa:	c3                   	retq   

0000000000801cab <sys_ept_map>:
  801cab:	55                   	push   %rbp
  801cac:	48 89 e5             	mov    %rsp,%rbp
  801caf:	48 83 ec 30          	sub    $0x30,%rsp
  801cb3:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801cb6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801cba:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801cbd:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801cc1:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801cc5:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801cc8:	48 63 c8             	movslq %eax,%rcx
  801ccb:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801ccf:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801cd2:	48 63 f0             	movslq %eax,%rsi
  801cd5:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801cd9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801cdc:	48 98                	cltq   
  801cde:	48 89 0c 24          	mov    %rcx,(%rsp)
  801ce2:	49 89 f9             	mov    %rdi,%r9
  801ce5:	49 89 f0             	mov    %rsi,%r8
  801ce8:	48 89 d1             	mov    %rdx,%rcx
  801ceb:	48 89 c2             	mov    %rax,%rdx
  801cee:	be 00 00 00 00       	mov    $0x0,%esi
  801cf3:	bf 11 00 00 00       	mov    $0x11,%edi
  801cf8:	48 b8 9a 17 80 00 00 	movabs $0x80179a,%rax
  801cff:	00 00 00 
  801d02:	ff d0                	callq  *%rax
  801d04:	c9                   	leaveq 
  801d05:	c3                   	retq   

0000000000801d06 <sys_env_mkguest>:
  801d06:	55                   	push   %rbp
  801d07:	48 89 e5             	mov    %rsp,%rbp
  801d0a:	48 83 ec 20          	sub    $0x20,%rsp
  801d0e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d12:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d16:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d1a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d1e:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801d25:	00 
  801d26:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d2c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d32:	48 89 d1             	mov    %rdx,%rcx
  801d35:	48 89 c2             	mov    %rax,%rdx
  801d38:	be 00 00 00 00       	mov    $0x0,%esi
  801d3d:	bf 12 00 00 00       	mov    $0x12,%edi
  801d42:	48 b8 9a 17 80 00 00 	movabs $0x80179a,%rax
  801d49:	00 00 00 
  801d4c:	ff d0                	callq  *%rax
  801d4e:	c9                   	leaveq 
  801d4f:	c3                   	retq   

0000000000801d50 <sys_vmx_list_vms>:
  801d50:	55                   	push   %rbp
  801d51:	48 89 e5             	mov    %rsp,%rbp
  801d54:	48 83 ec 10          	sub    $0x10,%rsp
  801d58:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801d5f:	00 
  801d60:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d66:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d6c:	b9 00 00 00 00       	mov    $0x0,%ecx
  801d71:	ba 00 00 00 00       	mov    $0x0,%edx
  801d76:	be 00 00 00 00       	mov    $0x0,%esi
  801d7b:	bf 13 00 00 00       	mov    $0x13,%edi
  801d80:	48 b8 9a 17 80 00 00 	movabs $0x80179a,%rax
  801d87:	00 00 00 
  801d8a:	ff d0                	callq  *%rax
  801d8c:	c9                   	leaveq 
  801d8d:	c3                   	retq   

0000000000801d8e <sys_vmx_sel_resume>:
  801d8e:	55                   	push   %rbp
  801d8f:	48 89 e5             	mov    %rsp,%rbp
  801d92:	48 83 ec 10          	sub    $0x10,%rsp
  801d96:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801d99:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801d9c:	48 98                	cltq   
  801d9e:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801da5:	00 
  801da6:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801dac:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801db2:	b9 00 00 00 00       	mov    $0x0,%ecx
  801db7:	48 89 c2             	mov    %rax,%rdx
  801dba:	be 00 00 00 00       	mov    $0x0,%esi
  801dbf:	bf 14 00 00 00       	mov    $0x14,%edi
  801dc4:	48 b8 9a 17 80 00 00 	movabs $0x80179a,%rax
  801dcb:	00 00 00 
  801dce:	ff d0                	callq  *%rax
  801dd0:	c9                   	leaveq 
  801dd1:	c3                   	retq   

0000000000801dd2 <sys_vmx_get_vmdisk_number>:
  801dd2:	55                   	push   %rbp
  801dd3:	48 89 e5             	mov    %rsp,%rbp
  801dd6:	48 83 ec 10          	sub    $0x10,%rsp
  801dda:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801de1:	00 
  801de2:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801de8:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801dee:	b9 00 00 00 00       	mov    $0x0,%ecx
  801df3:	ba 00 00 00 00       	mov    $0x0,%edx
  801df8:	be 00 00 00 00       	mov    $0x0,%esi
  801dfd:	bf 15 00 00 00       	mov    $0x15,%edi
  801e02:	48 b8 9a 17 80 00 00 	movabs $0x80179a,%rax
  801e09:	00 00 00 
  801e0c:	ff d0                	callq  *%rax
  801e0e:	c9                   	leaveq 
  801e0f:	c3                   	retq   

0000000000801e10 <sys_vmx_incr_vmdisk_number>:
  801e10:	55                   	push   %rbp
  801e11:	48 89 e5             	mov    %rsp,%rbp
  801e14:	48 83 ec 10          	sub    $0x10,%rsp
  801e18:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801e1f:	00 
  801e20:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e26:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e2c:	b9 00 00 00 00       	mov    $0x0,%ecx
  801e31:	ba 00 00 00 00       	mov    $0x0,%edx
  801e36:	be 00 00 00 00       	mov    $0x0,%esi
  801e3b:	bf 16 00 00 00       	mov    $0x16,%edi
  801e40:	48 b8 9a 17 80 00 00 	movabs $0x80179a,%rax
  801e47:	00 00 00 
  801e4a:	ff d0                	callq  *%rax
  801e4c:	c9                   	leaveq 
  801e4d:	c3                   	retq   

0000000000801e4e <fd2num>:
  801e4e:	55                   	push   %rbp
  801e4f:	48 89 e5             	mov    %rsp,%rbp
  801e52:	48 83 ec 08          	sub    $0x8,%rsp
  801e56:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801e5a:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801e5e:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  801e65:	ff ff ff 
  801e68:	48 01 d0             	add    %rdx,%rax
  801e6b:	48 c1 e8 0c          	shr    $0xc,%rax
  801e6f:	c9                   	leaveq 
  801e70:	c3                   	retq   

0000000000801e71 <fd2data>:
  801e71:	55                   	push   %rbp
  801e72:	48 89 e5             	mov    %rsp,%rbp
  801e75:	48 83 ec 08          	sub    $0x8,%rsp
  801e79:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801e7d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e81:	48 89 c7             	mov    %rax,%rdi
  801e84:	48 b8 4e 1e 80 00 00 	movabs $0x801e4e,%rax
  801e8b:	00 00 00 
  801e8e:	ff d0                	callq  *%rax
  801e90:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  801e96:	48 c1 e0 0c          	shl    $0xc,%rax
  801e9a:	c9                   	leaveq 
  801e9b:	c3                   	retq   

0000000000801e9c <fd_alloc>:
  801e9c:	55                   	push   %rbp
  801e9d:	48 89 e5             	mov    %rsp,%rbp
  801ea0:	48 83 ec 18          	sub    $0x18,%rsp
  801ea4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801ea8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801eaf:	eb 6b                	jmp    801f1c <fd_alloc+0x80>
  801eb1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801eb4:	48 98                	cltq   
  801eb6:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801ebc:	48 c1 e0 0c          	shl    $0xc,%rax
  801ec0:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801ec4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801ec8:	48 c1 e8 15          	shr    $0x15,%rax
  801ecc:	48 89 c2             	mov    %rax,%rdx
  801ecf:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  801ed6:	01 00 00 
  801ed9:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801edd:	83 e0 01             	and    $0x1,%eax
  801ee0:	48 85 c0             	test   %rax,%rax
  801ee3:	74 21                	je     801f06 <fd_alloc+0x6a>
  801ee5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801ee9:	48 c1 e8 0c          	shr    $0xc,%rax
  801eed:	48 89 c2             	mov    %rax,%rdx
  801ef0:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801ef7:	01 00 00 
  801efa:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801efe:	83 e0 01             	and    $0x1,%eax
  801f01:	48 85 c0             	test   %rax,%rax
  801f04:	75 12                	jne    801f18 <fd_alloc+0x7c>
  801f06:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801f0a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801f0e:	48 89 10             	mov    %rdx,(%rax)
  801f11:	b8 00 00 00 00       	mov    $0x0,%eax
  801f16:	eb 1a                	jmp    801f32 <fd_alloc+0x96>
  801f18:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801f1c:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  801f20:	7e 8f                	jle    801eb1 <fd_alloc+0x15>
  801f22:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801f26:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  801f2d:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  801f32:	c9                   	leaveq 
  801f33:	c3                   	retq   

0000000000801f34 <fd_lookup>:
  801f34:	55                   	push   %rbp
  801f35:	48 89 e5             	mov    %rsp,%rbp
  801f38:	48 83 ec 20          	sub    $0x20,%rsp
  801f3c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801f3f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801f43:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  801f47:	78 06                	js     801f4f <fd_lookup+0x1b>
  801f49:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  801f4d:	7e 07                	jle    801f56 <fd_lookup+0x22>
  801f4f:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801f54:	eb 6c                	jmp    801fc2 <fd_lookup+0x8e>
  801f56:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801f59:	48 98                	cltq   
  801f5b:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801f61:	48 c1 e0 0c          	shl    $0xc,%rax
  801f65:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801f69:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801f6d:	48 c1 e8 15          	shr    $0x15,%rax
  801f71:	48 89 c2             	mov    %rax,%rdx
  801f74:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  801f7b:	01 00 00 
  801f7e:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801f82:	83 e0 01             	and    $0x1,%eax
  801f85:	48 85 c0             	test   %rax,%rax
  801f88:	74 21                	je     801fab <fd_lookup+0x77>
  801f8a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801f8e:	48 c1 e8 0c          	shr    $0xc,%rax
  801f92:	48 89 c2             	mov    %rax,%rdx
  801f95:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801f9c:	01 00 00 
  801f9f:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801fa3:	83 e0 01             	and    $0x1,%eax
  801fa6:	48 85 c0             	test   %rax,%rax
  801fa9:	75 07                	jne    801fb2 <fd_lookup+0x7e>
  801fab:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801fb0:	eb 10                	jmp    801fc2 <fd_lookup+0x8e>
  801fb2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801fb6:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801fba:	48 89 10             	mov    %rdx,(%rax)
  801fbd:	b8 00 00 00 00       	mov    $0x0,%eax
  801fc2:	c9                   	leaveq 
  801fc3:	c3                   	retq   

0000000000801fc4 <fd_close>:
  801fc4:	55                   	push   %rbp
  801fc5:	48 89 e5             	mov    %rsp,%rbp
  801fc8:	48 83 ec 30          	sub    $0x30,%rsp
  801fcc:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801fd0:	89 f0                	mov    %esi,%eax
  801fd2:	88 45 d4             	mov    %al,-0x2c(%rbp)
  801fd5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801fd9:	48 89 c7             	mov    %rax,%rdi
  801fdc:	48 b8 4e 1e 80 00 00 	movabs $0x801e4e,%rax
  801fe3:	00 00 00 
  801fe6:	ff d0                	callq  *%rax
  801fe8:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  801fec:	48 89 d6             	mov    %rdx,%rsi
  801fef:	89 c7                	mov    %eax,%edi
  801ff1:	48 b8 34 1f 80 00 00 	movabs $0x801f34,%rax
  801ff8:	00 00 00 
  801ffb:	ff d0                	callq  *%rax
  801ffd:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802000:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802004:	78 0a                	js     802010 <fd_close+0x4c>
  802006:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80200a:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  80200e:	74 12                	je     802022 <fd_close+0x5e>
  802010:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  802014:	74 05                	je     80201b <fd_close+0x57>
  802016:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802019:	eb 05                	jmp    802020 <fd_close+0x5c>
  80201b:	b8 00 00 00 00       	mov    $0x0,%eax
  802020:	eb 69                	jmp    80208b <fd_close+0xc7>
  802022:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802026:	8b 00                	mov    (%rax),%eax
  802028:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80202c:	48 89 d6             	mov    %rdx,%rsi
  80202f:	89 c7                	mov    %eax,%edi
  802031:	48 b8 8d 20 80 00 00 	movabs $0x80208d,%rax
  802038:	00 00 00 
  80203b:	ff d0                	callq  *%rax
  80203d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802040:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802044:	78 2a                	js     802070 <fd_close+0xac>
  802046:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80204a:	48 8b 40 20          	mov    0x20(%rax),%rax
  80204e:	48 85 c0             	test   %rax,%rax
  802051:	74 16                	je     802069 <fd_close+0xa5>
  802053:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802057:	48 8b 40 20          	mov    0x20(%rax),%rax
  80205b:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80205f:	48 89 d7             	mov    %rdx,%rdi
  802062:	ff d0                	callq  *%rax
  802064:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802067:	eb 07                	jmp    802070 <fd_close+0xac>
  802069:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802070:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802074:	48 89 c6             	mov    %rax,%rsi
  802077:	bf 00 00 00 00       	mov    $0x0,%edi
  80207c:	48 b8 1b 1a 80 00 00 	movabs $0x801a1b,%rax
  802083:	00 00 00 
  802086:	ff d0                	callq  *%rax
  802088:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80208b:	c9                   	leaveq 
  80208c:	c3                   	retq   

000000000080208d <dev_lookup>:
  80208d:	55                   	push   %rbp
  80208e:	48 89 e5             	mov    %rsp,%rbp
  802091:	48 83 ec 20          	sub    $0x20,%rsp
  802095:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802098:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80209c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8020a3:	eb 41                	jmp    8020e6 <dev_lookup+0x59>
  8020a5:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  8020ac:	00 00 00 
  8020af:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8020b2:	48 63 d2             	movslq %edx,%rdx
  8020b5:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8020b9:	8b 00                	mov    (%rax),%eax
  8020bb:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  8020be:	75 22                	jne    8020e2 <dev_lookup+0x55>
  8020c0:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  8020c7:	00 00 00 
  8020ca:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8020cd:	48 63 d2             	movslq %edx,%rdx
  8020d0:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  8020d4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8020d8:	48 89 10             	mov    %rdx,(%rax)
  8020db:	b8 00 00 00 00       	mov    $0x0,%eax
  8020e0:	eb 60                	jmp    802142 <dev_lookup+0xb5>
  8020e2:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8020e6:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  8020ed:	00 00 00 
  8020f0:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8020f3:	48 63 d2             	movslq %edx,%rdx
  8020f6:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8020fa:	48 85 c0             	test   %rax,%rax
  8020fd:	75 a6                	jne    8020a5 <dev_lookup+0x18>
  8020ff:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  802106:	00 00 00 
  802109:	48 8b 00             	mov    (%rax),%rax
  80210c:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802112:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802115:	89 c6                	mov    %eax,%esi
  802117:	48 bf d8 46 80 00 00 	movabs $0x8046d8,%rdi
  80211e:	00 00 00 
  802121:	b8 00 00 00 00       	mov    $0x0,%eax
  802126:	48 b9 8c 04 80 00 00 	movabs $0x80048c,%rcx
  80212d:	00 00 00 
  802130:	ff d1                	callq  *%rcx
  802132:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802136:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  80213d:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802142:	c9                   	leaveq 
  802143:	c3                   	retq   

0000000000802144 <close>:
  802144:	55                   	push   %rbp
  802145:	48 89 e5             	mov    %rsp,%rbp
  802148:	48 83 ec 20          	sub    $0x20,%rsp
  80214c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80214f:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802153:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802156:	48 89 d6             	mov    %rdx,%rsi
  802159:	89 c7                	mov    %eax,%edi
  80215b:	48 b8 34 1f 80 00 00 	movabs $0x801f34,%rax
  802162:	00 00 00 
  802165:	ff d0                	callq  *%rax
  802167:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80216a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80216e:	79 05                	jns    802175 <close+0x31>
  802170:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802173:	eb 18                	jmp    80218d <close+0x49>
  802175:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802179:	be 01 00 00 00       	mov    $0x1,%esi
  80217e:	48 89 c7             	mov    %rax,%rdi
  802181:	48 b8 c4 1f 80 00 00 	movabs $0x801fc4,%rax
  802188:	00 00 00 
  80218b:	ff d0                	callq  *%rax
  80218d:	c9                   	leaveq 
  80218e:	c3                   	retq   

000000000080218f <close_all>:
  80218f:	55                   	push   %rbp
  802190:	48 89 e5             	mov    %rsp,%rbp
  802193:	48 83 ec 10          	sub    $0x10,%rsp
  802197:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80219e:	eb 15                	jmp    8021b5 <close_all+0x26>
  8021a0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8021a3:	89 c7                	mov    %eax,%edi
  8021a5:	48 b8 44 21 80 00 00 	movabs $0x802144,%rax
  8021ac:	00 00 00 
  8021af:	ff d0                	callq  *%rax
  8021b1:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8021b5:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  8021b9:	7e e5                	jle    8021a0 <close_all+0x11>
  8021bb:	c9                   	leaveq 
  8021bc:	c3                   	retq   

00000000008021bd <dup>:
  8021bd:	55                   	push   %rbp
  8021be:	48 89 e5             	mov    %rsp,%rbp
  8021c1:	48 83 ec 40          	sub    $0x40,%rsp
  8021c5:	89 7d cc             	mov    %edi,-0x34(%rbp)
  8021c8:	89 75 c8             	mov    %esi,-0x38(%rbp)
  8021cb:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  8021cf:	8b 45 cc             	mov    -0x34(%rbp),%eax
  8021d2:	48 89 d6             	mov    %rdx,%rsi
  8021d5:	89 c7                	mov    %eax,%edi
  8021d7:	48 b8 34 1f 80 00 00 	movabs $0x801f34,%rax
  8021de:	00 00 00 
  8021e1:	ff d0                	callq  *%rax
  8021e3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8021e6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8021ea:	79 08                	jns    8021f4 <dup+0x37>
  8021ec:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8021ef:	e9 70 01 00 00       	jmpq   802364 <dup+0x1a7>
  8021f4:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8021f7:	89 c7                	mov    %eax,%edi
  8021f9:	48 b8 44 21 80 00 00 	movabs $0x802144,%rax
  802200:	00 00 00 
  802203:	ff d0                	callq  *%rax
  802205:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802208:	48 98                	cltq   
  80220a:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802210:	48 c1 e0 0c          	shl    $0xc,%rax
  802214:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802218:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80221c:	48 89 c7             	mov    %rax,%rdi
  80221f:	48 b8 71 1e 80 00 00 	movabs $0x801e71,%rax
  802226:	00 00 00 
  802229:	ff d0                	callq  *%rax
  80222b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80222f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802233:	48 89 c7             	mov    %rax,%rdi
  802236:	48 b8 71 1e 80 00 00 	movabs $0x801e71,%rax
  80223d:	00 00 00 
  802240:	ff d0                	callq  *%rax
  802242:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802246:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80224a:	48 c1 e8 15          	shr    $0x15,%rax
  80224e:	48 89 c2             	mov    %rax,%rdx
  802251:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802258:	01 00 00 
  80225b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80225f:	83 e0 01             	and    $0x1,%eax
  802262:	48 85 c0             	test   %rax,%rax
  802265:	74 73                	je     8022da <dup+0x11d>
  802267:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80226b:	48 c1 e8 0c          	shr    $0xc,%rax
  80226f:	48 89 c2             	mov    %rax,%rdx
  802272:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802279:	01 00 00 
  80227c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802280:	83 e0 01             	and    $0x1,%eax
  802283:	48 85 c0             	test   %rax,%rax
  802286:	74 52                	je     8022da <dup+0x11d>
  802288:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80228c:	48 c1 e8 0c          	shr    $0xc,%rax
  802290:	48 89 c2             	mov    %rax,%rdx
  802293:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80229a:	01 00 00 
  80229d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8022a1:	25 07 0e 00 00       	and    $0xe07,%eax
  8022a6:	89 c1                	mov    %eax,%ecx
  8022a8:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8022ac:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8022b0:	41 89 c8             	mov    %ecx,%r8d
  8022b3:	48 89 d1             	mov    %rdx,%rcx
  8022b6:	ba 00 00 00 00       	mov    $0x0,%edx
  8022bb:	48 89 c6             	mov    %rax,%rsi
  8022be:	bf 00 00 00 00       	mov    $0x0,%edi
  8022c3:	48 b8 c0 19 80 00 00 	movabs $0x8019c0,%rax
  8022ca:	00 00 00 
  8022cd:	ff d0                	callq  *%rax
  8022cf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8022d2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8022d6:	79 02                	jns    8022da <dup+0x11d>
  8022d8:	eb 57                	jmp    802331 <dup+0x174>
  8022da:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8022de:	48 c1 e8 0c          	shr    $0xc,%rax
  8022e2:	48 89 c2             	mov    %rax,%rdx
  8022e5:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8022ec:	01 00 00 
  8022ef:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8022f3:	25 07 0e 00 00       	and    $0xe07,%eax
  8022f8:	89 c1                	mov    %eax,%ecx
  8022fa:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8022fe:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802302:	41 89 c8             	mov    %ecx,%r8d
  802305:	48 89 d1             	mov    %rdx,%rcx
  802308:	ba 00 00 00 00       	mov    $0x0,%edx
  80230d:	48 89 c6             	mov    %rax,%rsi
  802310:	bf 00 00 00 00       	mov    $0x0,%edi
  802315:	48 b8 c0 19 80 00 00 	movabs $0x8019c0,%rax
  80231c:	00 00 00 
  80231f:	ff d0                	callq  *%rax
  802321:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802324:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802328:	79 02                	jns    80232c <dup+0x16f>
  80232a:	eb 05                	jmp    802331 <dup+0x174>
  80232c:	8b 45 c8             	mov    -0x38(%rbp),%eax
  80232f:	eb 33                	jmp    802364 <dup+0x1a7>
  802331:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802335:	48 89 c6             	mov    %rax,%rsi
  802338:	bf 00 00 00 00       	mov    $0x0,%edi
  80233d:	48 b8 1b 1a 80 00 00 	movabs $0x801a1b,%rax
  802344:	00 00 00 
  802347:	ff d0                	callq  *%rax
  802349:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80234d:	48 89 c6             	mov    %rax,%rsi
  802350:	bf 00 00 00 00       	mov    $0x0,%edi
  802355:	48 b8 1b 1a 80 00 00 	movabs $0x801a1b,%rax
  80235c:	00 00 00 
  80235f:	ff d0                	callq  *%rax
  802361:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802364:	c9                   	leaveq 
  802365:	c3                   	retq   

0000000000802366 <read>:
  802366:	55                   	push   %rbp
  802367:	48 89 e5             	mov    %rsp,%rbp
  80236a:	48 83 ec 40          	sub    $0x40,%rsp
  80236e:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802371:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802375:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802379:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80237d:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802380:	48 89 d6             	mov    %rdx,%rsi
  802383:	89 c7                	mov    %eax,%edi
  802385:	48 b8 34 1f 80 00 00 	movabs $0x801f34,%rax
  80238c:	00 00 00 
  80238f:	ff d0                	callq  *%rax
  802391:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802394:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802398:	78 24                	js     8023be <read+0x58>
  80239a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80239e:	8b 00                	mov    (%rax),%eax
  8023a0:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8023a4:	48 89 d6             	mov    %rdx,%rsi
  8023a7:	89 c7                	mov    %eax,%edi
  8023a9:	48 b8 8d 20 80 00 00 	movabs $0x80208d,%rax
  8023b0:	00 00 00 
  8023b3:	ff d0                	callq  *%rax
  8023b5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8023b8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8023bc:	79 05                	jns    8023c3 <read+0x5d>
  8023be:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023c1:	eb 76                	jmp    802439 <read+0xd3>
  8023c3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8023c7:	8b 40 08             	mov    0x8(%rax),%eax
  8023ca:	83 e0 03             	and    $0x3,%eax
  8023cd:	83 f8 01             	cmp    $0x1,%eax
  8023d0:	75 3a                	jne    80240c <read+0xa6>
  8023d2:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8023d9:	00 00 00 
  8023dc:	48 8b 00             	mov    (%rax),%rax
  8023df:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8023e5:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8023e8:	89 c6                	mov    %eax,%esi
  8023ea:	48 bf f7 46 80 00 00 	movabs $0x8046f7,%rdi
  8023f1:	00 00 00 
  8023f4:	b8 00 00 00 00       	mov    $0x0,%eax
  8023f9:	48 b9 8c 04 80 00 00 	movabs $0x80048c,%rcx
  802400:	00 00 00 
  802403:	ff d1                	callq  *%rcx
  802405:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80240a:	eb 2d                	jmp    802439 <read+0xd3>
  80240c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802410:	48 8b 40 10          	mov    0x10(%rax),%rax
  802414:	48 85 c0             	test   %rax,%rax
  802417:	75 07                	jne    802420 <read+0xba>
  802419:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80241e:	eb 19                	jmp    802439 <read+0xd3>
  802420:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802424:	48 8b 40 10          	mov    0x10(%rax),%rax
  802428:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80242c:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802430:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802434:	48 89 cf             	mov    %rcx,%rdi
  802437:	ff d0                	callq  *%rax
  802439:	c9                   	leaveq 
  80243a:	c3                   	retq   

000000000080243b <readn>:
  80243b:	55                   	push   %rbp
  80243c:	48 89 e5             	mov    %rsp,%rbp
  80243f:	48 83 ec 30          	sub    $0x30,%rsp
  802443:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802446:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80244a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80244e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802455:	eb 49                	jmp    8024a0 <readn+0x65>
  802457:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80245a:	48 98                	cltq   
  80245c:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802460:	48 29 c2             	sub    %rax,%rdx
  802463:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802466:	48 63 c8             	movslq %eax,%rcx
  802469:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80246d:	48 01 c1             	add    %rax,%rcx
  802470:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802473:	48 89 ce             	mov    %rcx,%rsi
  802476:	89 c7                	mov    %eax,%edi
  802478:	48 b8 66 23 80 00 00 	movabs $0x802366,%rax
  80247f:	00 00 00 
  802482:	ff d0                	callq  *%rax
  802484:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802487:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80248b:	79 05                	jns    802492 <readn+0x57>
  80248d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802490:	eb 1c                	jmp    8024ae <readn+0x73>
  802492:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802496:	75 02                	jne    80249a <readn+0x5f>
  802498:	eb 11                	jmp    8024ab <readn+0x70>
  80249a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80249d:	01 45 fc             	add    %eax,-0x4(%rbp)
  8024a0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024a3:	48 98                	cltq   
  8024a5:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8024a9:	72 ac                	jb     802457 <readn+0x1c>
  8024ab:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024ae:	c9                   	leaveq 
  8024af:	c3                   	retq   

00000000008024b0 <write>:
  8024b0:	55                   	push   %rbp
  8024b1:	48 89 e5             	mov    %rsp,%rbp
  8024b4:	48 83 ec 40          	sub    $0x40,%rsp
  8024b8:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8024bb:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8024bf:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8024c3:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8024c7:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8024ca:	48 89 d6             	mov    %rdx,%rsi
  8024cd:	89 c7                	mov    %eax,%edi
  8024cf:	48 b8 34 1f 80 00 00 	movabs $0x801f34,%rax
  8024d6:	00 00 00 
  8024d9:	ff d0                	callq  *%rax
  8024db:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8024de:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8024e2:	78 24                	js     802508 <write+0x58>
  8024e4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8024e8:	8b 00                	mov    (%rax),%eax
  8024ea:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8024ee:	48 89 d6             	mov    %rdx,%rsi
  8024f1:	89 c7                	mov    %eax,%edi
  8024f3:	48 b8 8d 20 80 00 00 	movabs $0x80208d,%rax
  8024fa:	00 00 00 
  8024fd:	ff d0                	callq  *%rax
  8024ff:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802502:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802506:	79 05                	jns    80250d <write+0x5d>
  802508:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80250b:	eb 75                	jmp    802582 <write+0xd2>
  80250d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802511:	8b 40 08             	mov    0x8(%rax),%eax
  802514:	83 e0 03             	and    $0x3,%eax
  802517:	85 c0                	test   %eax,%eax
  802519:	75 3a                	jne    802555 <write+0xa5>
  80251b:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  802522:	00 00 00 
  802525:	48 8b 00             	mov    (%rax),%rax
  802528:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80252e:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802531:	89 c6                	mov    %eax,%esi
  802533:	48 bf 13 47 80 00 00 	movabs $0x804713,%rdi
  80253a:	00 00 00 
  80253d:	b8 00 00 00 00       	mov    $0x0,%eax
  802542:	48 b9 8c 04 80 00 00 	movabs $0x80048c,%rcx
  802549:	00 00 00 
  80254c:	ff d1                	callq  *%rcx
  80254e:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802553:	eb 2d                	jmp    802582 <write+0xd2>
  802555:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802559:	48 8b 40 18          	mov    0x18(%rax),%rax
  80255d:	48 85 c0             	test   %rax,%rax
  802560:	75 07                	jne    802569 <write+0xb9>
  802562:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802567:	eb 19                	jmp    802582 <write+0xd2>
  802569:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80256d:	48 8b 40 18          	mov    0x18(%rax),%rax
  802571:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802575:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802579:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  80257d:	48 89 cf             	mov    %rcx,%rdi
  802580:	ff d0                	callq  *%rax
  802582:	c9                   	leaveq 
  802583:	c3                   	retq   

0000000000802584 <seek>:
  802584:	55                   	push   %rbp
  802585:	48 89 e5             	mov    %rsp,%rbp
  802588:	48 83 ec 18          	sub    $0x18,%rsp
  80258c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80258f:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802592:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802596:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802599:	48 89 d6             	mov    %rdx,%rsi
  80259c:	89 c7                	mov    %eax,%edi
  80259e:	48 b8 34 1f 80 00 00 	movabs $0x801f34,%rax
  8025a5:	00 00 00 
  8025a8:	ff d0                	callq  *%rax
  8025aa:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8025ad:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8025b1:	79 05                	jns    8025b8 <seek+0x34>
  8025b3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8025b6:	eb 0f                	jmp    8025c7 <seek+0x43>
  8025b8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8025bc:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8025bf:	89 50 04             	mov    %edx,0x4(%rax)
  8025c2:	b8 00 00 00 00       	mov    $0x0,%eax
  8025c7:	c9                   	leaveq 
  8025c8:	c3                   	retq   

00000000008025c9 <ftruncate>:
  8025c9:	55                   	push   %rbp
  8025ca:	48 89 e5             	mov    %rsp,%rbp
  8025cd:	48 83 ec 30          	sub    $0x30,%rsp
  8025d1:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8025d4:	89 75 d8             	mov    %esi,-0x28(%rbp)
  8025d7:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8025db:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8025de:	48 89 d6             	mov    %rdx,%rsi
  8025e1:	89 c7                	mov    %eax,%edi
  8025e3:	48 b8 34 1f 80 00 00 	movabs $0x801f34,%rax
  8025ea:	00 00 00 
  8025ed:	ff d0                	callq  *%rax
  8025ef:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8025f2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8025f6:	78 24                	js     80261c <ftruncate+0x53>
  8025f8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8025fc:	8b 00                	mov    (%rax),%eax
  8025fe:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802602:	48 89 d6             	mov    %rdx,%rsi
  802605:	89 c7                	mov    %eax,%edi
  802607:	48 b8 8d 20 80 00 00 	movabs $0x80208d,%rax
  80260e:	00 00 00 
  802611:	ff d0                	callq  *%rax
  802613:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802616:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80261a:	79 05                	jns    802621 <ftruncate+0x58>
  80261c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80261f:	eb 72                	jmp    802693 <ftruncate+0xca>
  802621:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802625:	8b 40 08             	mov    0x8(%rax),%eax
  802628:	83 e0 03             	and    $0x3,%eax
  80262b:	85 c0                	test   %eax,%eax
  80262d:	75 3a                	jne    802669 <ftruncate+0xa0>
  80262f:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  802636:	00 00 00 
  802639:	48 8b 00             	mov    (%rax),%rax
  80263c:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802642:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802645:	89 c6                	mov    %eax,%esi
  802647:	48 bf 30 47 80 00 00 	movabs $0x804730,%rdi
  80264e:	00 00 00 
  802651:	b8 00 00 00 00       	mov    $0x0,%eax
  802656:	48 b9 8c 04 80 00 00 	movabs $0x80048c,%rcx
  80265d:	00 00 00 
  802660:	ff d1                	callq  *%rcx
  802662:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802667:	eb 2a                	jmp    802693 <ftruncate+0xca>
  802669:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80266d:	48 8b 40 30          	mov    0x30(%rax),%rax
  802671:	48 85 c0             	test   %rax,%rax
  802674:	75 07                	jne    80267d <ftruncate+0xb4>
  802676:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80267b:	eb 16                	jmp    802693 <ftruncate+0xca>
  80267d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802681:	48 8b 40 30          	mov    0x30(%rax),%rax
  802685:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802689:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  80268c:	89 ce                	mov    %ecx,%esi
  80268e:	48 89 d7             	mov    %rdx,%rdi
  802691:	ff d0                	callq  *%rax
  802693:	c9                   	leaveq 
  802694:	c3                   	retq   

0000000000802695 <fstat>:
  802695:	55                   	push   %rbp
  802696:	48 89 e5             	mov    %rsp,%rbp
  802699:	48 83 ec 30          	sub    $0x30,%rsp
  80269d:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8026a0:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8026a4:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8026a8:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8026ab:	48 89 d6             	mov    %rdx,%rsi
  8026ae:	89 c7                	mov    %eax,%edi
  8026b0:	48 b8 34 1f 80 00 00 	movabs $0x801f34,%rax
  8026b7:	00 00 00 
  8026ba:	ff d0                	callq  *%rax
  8026bc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8026bf:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8026c3:	78 24                	js     8026e9 <fstat+0x54>
  8026c5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8026c9:	8b 00                	mov    (%rax),%eax
  8026cb:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8026cf:	48 89 d6             	mov    %rdx,%rsi
  8026d2:	89 c7                	mov    %eax,%edi
  8026d4:	48 b8 8d 20 80 00 00 	movabs $0x80208d,%rax
  8026db:	00 00 00 
  8026de:	ff d0                	callq  *%rax
  8026e0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8026e3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8026e7:	79 05                	jns    8026ee <fstat+0x59>
  8026e9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8026ec:	eb 5e                	jmp    80274c <fstat+0xb7>
  8026ee:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8026f2:	48 8b 40 28          	mov    0x28(%rax),%rax
  8026f6:	48 85 c0             	test   %rax,%rax
  8026f9:	75 07                	jne    802702 <fstat+0x6d>
  8026fb:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802700:	eb 4a                	jmp    80274c <fstat+0xb7>
  802702:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802706:	c6 00 00             	movb   $0x0,(%rax)
  802709:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80270d:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  802714:	00 00 00 
  802717:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80271b:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  802722:	00 00 00 
  802725:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802729:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80272d:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  802734:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802738:	48 8b 40 28          	mov    0x28(%rax),%rax
  80273c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802740:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  802744:	48 89 ce             	mov    %rcx,%rsi
  802747:	48 89 d7             	mov    %rdx,%rdi
  80274a:	ff d0                	callq  *%rax
  80274c:	c9                   	leaveq 
  80274d:	c3                   	retq   

000000000080274e <stat>:
  80274e:	55                   	push   %rbp
  80274f:	48 89 e5             	mov    %rsp,%rbp
  802752:	48 83 ec 20          	sub    $0x20,%rsp
  802756:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80275a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80275e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802762:	be 00 00 00 00       	mov    $0x0,%esi
  802767:	48 89 c7             	mov    %rax,%rdi
  80276a:	48 b8 3c 28 80 00 00 	movabs $0x80283c,%rax
  802771:	00 00 00 
  802774:	ff d0                	callq  *%rax
  802776:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802779:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80277d:	79 05                	jns    802784 <stat+0x36>
  80277f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802782:	eb 2f                	jmp    8027b3 <stat+0x65>
  802784:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802788:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80278b:	48 89 d6             	mov    %rdx,%rsi
  80278e:	89 c7                	mov    %eax,%edi
  802790:	48 b8 95 26 80 00 00 	movabs $0x802695,%rax
  802797:	00 00 00 
  80279a:	ff d0                	callq  *%rax
  80279c:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80279f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8027a2:	89 c7                	mov    %eax,%edi
  8027a4:	48 b8 44 21 80 00 00 	movabs $0x802144,%rax
  8027ab:	00 00 00 
  8027ae:	ff d0                	callq  *%rax
  8027b0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8027b3:	c9                   	leaveq 
  8027b4:	c3                   	retq   

00000000008027b5 <fsipc>:
  8027b5:	55                   	push   %rbp
  8027b6:	48 89 e5             	mov    %rsp,%rbp
  8027b9:	48 83 ec 10          	sub    $0x10,%rsp
  8027bd:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8027c0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8027c4:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8027cb:	00 00 00 
  8027ce:	8b 00                	mov    (%rax),%eax
  8027d0:	85 c0                	test   %eax,%eax
  8027d2:	75 1d                	jne    8027f1 <fsipc+0x3c>
  8027d4:	bf 01 00 00 00       	mov    $0x1,%edi
  8027d9:	48 b8 58 40 80 00 00 	movabs $0x804058,%rax
  8027e0:	00 00 00 
  8027e3:	ff d0                	callq  *%rax
  8027e5:	48 ba 00 70 80 00 00 	movabs $0x807000,%rdx
  8027ec:	00 00 00 
  8027ef:	89 02                	mov    %eax,(%rdx)
  8027f1:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8027f8:	00 00 00 
  8027fb:	8b 00                	mov    (%rax),%eax
  8027fd:	8b 75 fc             	mov    -0x4(%rbp),%esi
  802800:	b9 07 00 00 00       	mov    $0x7,%ecx
  802805:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  80280c:	00 00 00 
  80280f:	89 c7                	mov    %eax,%edi
  802811:	48 b8 c2 3f 80 00 00 	movabs $0x803fc2,%rax
  802818:	00 00 00 
  80281b:	ff d0                	callq  *%rax
  80281d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802821:	ba 00 00 00 00       	mov    $0x0,%edx
  802826:	48 89 c6             	mov    %rax,%rsi
  802829:	bf 00 00 00 00       	mov    $0x0,%edi
  80282e:	48 b8 01 3f 80 00 00 	movabs $0x803f01,%rax
  802835:	00 00 00 
  802838:	ff d0                	callq  *%rax
  80283a:	c9                   	leaveq 
  80283b:	c3                   	retq   

000000000080283c <open>:
  80283c:	55                   	push   %rbp
  80283d:	48 89 e5             	mov    %rsp,%rbp
  802840:	48 83 ec 20          	sub    $0x20,%rsp
  802844:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802848:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80284b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80284f:	48 89 c7             	mov    %rax,%rdi
  802852:	48 b8 d5 0f 80 00 00 	movabs $0x800fd5,%rax
  802859:	00 00 00 
  80285c:	ff d0                	callq  *%rax
  80285e:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802863:	7e 0a                	jle    80286f <open+0x33>
  802865:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  80286a:	e9 a5 00 00 00       	jmpq   802914 <open+0xd8>
  80286f:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802873:	48 89 c7             	mov    %rax,%rdi
  802876:	48 b8 9c 1e 80 00 00 	movabs $0x801e9c,%rax
  80287d:	00 00 00 
  802880:	ff d0                	callq  *%rax
  802882:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802885:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802889:	79 08                	jns    802893 <open+0x57>
  80288b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80288e:	e9 81 00 00 00       	jmpq   802914 <open+0xd8>
  802893:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802897:	48 89 c6             	mov    %rax,%rsi
  80289a:	48 bf 00 80 80 00 00 	movabs $0x808000,%rdi
  8028a1:	00 00 00 
  8028a4:	48 b8 41 10 80 00 00 	movabs $0x801041,%rax
  8028ab:	00 00 00 
  8028ae:	ff d0                	callq  *%rax
  8028b0:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8028b7:	00 00 00 
  8028ba:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8028bd:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  8028c3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8028c7:	48 89 c6             	mov    %rax,%rsi
  8028ca:	bf 01 00 00 00       	mov    $0x1,%edi
  8028cf:	48 b8 b5 27 80 00 00 	movabs $0x8027b5,%rax
  8028d6:	00 00 00 
  8028d9:	ff d0                	callq  *%rax
  8028db:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8028de:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8028e2:	79 1d                	jns    802901 <open+0xc5>
  8028e4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8028e8:	be 00 00 00 00       	mov    $0x0,%esi
  8028ed:	48 89 c7             	mov    %rax,%rdi
  8028f0:	48 b8 c4 1f 80 00 00 	movabs $0x801fc4,%rax
  8028f7:	00 00 00 
  8028fa:	ff d0                	callq  *%rax
  8028fc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8028ff:	eb 13                	jmp    802914 <open+0xd8>
  802901:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802905:	48 89 c7             	mov    %rax,%rdi
  802908:	48 b8 4e 1e 80 00 00 	movabs $0x801e4e,%rax
  80290f:	00 00 00 
  802912:	ff d0                	callq  *%rax
  802914:	c9                   	leaveq 
  802915:	c3                   	retq   

0000000000802916 <devfile_flush>:
  802916:	55                   	push   %rbp
  802917:	48 89 e5             	mov    %rsp,%rbp
  80291a:	48 83 ec 10          	sub    $0x10,%rsp
  80291e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802922:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802926:	8b 50 0c             	mov    0xc(%rax),%edx
  802929:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802930:	00 00 00 
  802933:	89 10                	mov    %edx,(%rax)
  802935:	be 00 00 00 00       	mov    $0x0,%esi
  80293a:	bf 06 00 00 00       	mov    $0x6,%edi
  80293f:	48 b8 b5 27 80 00 00 	movabs $0x8027b5,%rax
  802946:	00 00 00 
  802949:	ff d0                	callq  *%rax
  80294b:	c9                   	leaveq 
  80294c:	c3                   	retq   

000000000080294d <devfile_read>:
  80294d:	55                   	push   %rbp
  80294e:	48 89 e5             	mov    %rsp,%rbp
  802951:	48 83 ec 30          	sub    $0x30,%rsp
  802955:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802959:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80295d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802961:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802965:	8b 50 0c             	mov    0xc(%rax),%edx
  802968:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80296f:	00 00 00 
  802972:	89 10                	mov    %edx,(%rax)
  802974:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80297b:	00 00 00 
  80297e:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802982:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802986:	be 00 00 00 00       	mov    $0x0,%esi
  80298b:	bf 03 00 00 00       	mov    $0x3,%edi
  802990:	48 b8 b5 27 80 00 00 	movabs $0x8027b5,%rax
  802997:	00 00 00 
  80299a:	ff d0                	callq  *%rax
  80299c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80299f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8029a3:	79 08                	jns    8029ad <devfile_read+0x60>
  8029a5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029a8:	e9 a4 00 00 00       	jmpq   802a51 <devfile_read+0x104>
  8029ad:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029b0:	48 98                	cltq   
  8029b2:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8029b6:	76 35                	jbe    8029ed <devfile_read+0xa0>
  8029b8:	48 b9 56 47 80 00 00 	movabs $0x804756,%rcx
  8029bf:	00 00 00 
  8029c2:	48 ba 5d 47 80 00 00 	movabs $0x80475d,%rdx
  8029c9:	00 00 00 
  8029cc:	be 89 00 00 00       	mov    $0x89,%esi
  8029d1:	48 bf 72 47 80 00 00 	movabs $0x804772,%rdi
  8029d8:	00 00 00 
  8029db:	b8 00 00 00 00       	mov    $0x0,%eax
  8029e0:	49 b8 53 02 80 00 00 	movabs $0x800253,%r8
  8029e7:	00 00 00 
  8029ea:	41 ff d0             	callq  *%r8
  8029ed:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  8029f4:	7e 35                	jle    802a2b <devfile_read+0xde>
  8029f6:	48 b9 80 47 80 00 00 	movabs $0x804780,%rcx
  8029fd:	00 00 00 
  802a00:	48 ba 5d 47 80 00 00 	movabs $0x80475d,%rdx
  802a07:	00 00 00 
  802a0a:	be 8a 00 00 00       	mov    $0x8a,%esi
  802a0f:	48 bf 72 47 80 00 00 	movabs $0x804772,%rdi
  802a16:	00 00 00 
  802a19:	b8 00 00 00 00       	mov    $0x0,%eax
  802a1e:	49 b8 53 02 80 00 00 	movabs $0x800253,%r8
  802a25:	00 00 00 
  802a28:	41 ff d0             	callq  *%r8
  802a2b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a2e:	48 63 d0             	movslq %eax,%rdx
  802a31:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802a35:	48 be 00 80 80 00 00 	movabs $0x808000,%rsi
  802a3c:	00 00 00 
  802a3f:	48 89 c7             	mov    %rax,%rdi
  802a42:	48 b8 65 13 80 00 00 	movabs $0x801365,%rax
  802a49:	00 00 00 
  802a4c:	ff d0                	callq  *%rax
  802a4e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a51:	c9                   	leaveq 
  802a52:	c3                   	retq   

0000000000802a53 <devfile_write>:
  802a53:	55                   	push   %rbp
  802a54:	48 89 e5             	mov    %rsp,%rbp
  802a57:	48 83 ec 40          	sub    $0x40,%rsp
  802a5b:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802a5f:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802a63:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802a67:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  802a6b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802a6f:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  802a76:	00 
  802a77:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802a7b:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  802a7f:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  802a84:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  802a88:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802a8c:	8b 50 0c             	mov    0xc(%rax),%edx
  802a8f:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802a96:	00 00 00 
  802a99:	89 10                	mov    %edx,(%rax)
  802a9b:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802aa2:	00 00 00 
  802aa5:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802aa9:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802aad:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802ab1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802ab5:	48 89 c6             	mov    %rax,%rsi
  802ab8:	48 bf 10 80 80 00 00 	movabs $0x808010,%rdi
  802abf:	00 00 00 
  802ac2:	48 b8 65 13 80 00 00 	movabs $0x801365,%rax
  802ac9:	00 00 00 
  802acc:	ff d0                	callq  *%rax
  802ace:	be 00 00 00 00       	mov    $0x0,%esi
  802ad3:	bf 04 00 00 00       	mov    $0x4,%edi
  802ad8:	48 b8 b5 27 80 00 00 	movabs $0x8027b5,%rax
  802adf:	00 00 00 
  802ae2:	ff d0                	callq  *%rax
  802ae4:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802ae7:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802aeb:	79 05                	jns    802af2 <devfile_write+0x9f>
  802aed:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802af0:	eb 43                	jmp    802b35 <devfile_write+0xe2>
  802af2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802af5:	48 98                	cltq   
  802af7:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  802afb:	76 35                	jbe    802b32 <devfile_write+0xdf>
  802afd:	48 b9 56 47 80 00 00 	movabs $0x804756,%rcx
  802b04:	00 00 00 
  802b07:	48 ba 5d 47 80 00 00 	movabs $0x80475d,%rdx
  802b0e:	00 00 00 
  802b11:	be a8 00 00 00       	mov    $0xa8,%esi
  802b16:	48 bf 72 47 80 00 00 	movabs $0x804772,%rdi
  802b1d:	00 00 00 
  802b20:	b8 00 00 00 00       	mov    $0x0,%eax
  802b25:	49 b8 53 02 80 00 00 	movabs $0x800253,%r8
  802b2c:	00 00 00 
  802b2f:	41 ff d0             	callq  *%r8
  802b32:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802b35:	c9                   	leaveq 
  802b36:	c3                   	retq   

0000000000802b37 <devfile_stat>:
  802b37:	55                   	push   %rbp
  802b38:	48 89 e5             	mov    %rsp,%rbp
  802b3b:	48 83 ec 20          	sub    $0x20,%rsp
  802b3f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802b43:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802b47:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b4b:	8b 50 0c             	mov    0xc(%rax),%edx
  802b4e:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802b55:	00 00 00 
  802b58:	89 10                	mov    %edx,(%rax)
  802b5a:	be 00 00 00 00       	mov    $0x0,%esi
  802b5f:	bf 05 00 00 00       	mov    $0x5,%edi
  802b64:	48 b8 b5 27 80 00 00 	movabs $0x8027b5,%rax
  802b6b:	00 00 00 
  802b6e:	ff d0                	callq  *%rax
  802b70:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b73:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b77:	79 05                	jns    802b7e <devfile_stat+0x47>
  802b79:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b7c:	eb 56                	jmp    802bd4 <devfile_stat+0x9d>
  802b7e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802b82:	48 be 00 80 80 00 00 	movabs $0x808000,%rsi
  802b89:	00 00 00 
  802b8c:	48 89 c7             	mov    %rax,%rdi
  802b8f:	48 b8 41 10 80 00 00 	movabs $0x801041,%rax
  802b96:	00 00 00 
  802b99:	ff d0                	callq  *%rax
  802b9b:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802ba2:	00 00 00 
  802ba5:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  802bab:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802baf:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  802bb5:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802bbc:	00 00 00 
  802bbf:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  802bc5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802bc9:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  802bcf:	b8 00 00 00 00       	mov    $0x0,%eax
  802bd4:	c9                   	leaveq 
  802bd5:	c3                   	retq   

0000000000802bd6 <devfile_trunc>:
  802bd6:	55                   	push   %rbp
  802bd7:	48 89 e5             	mov    %rsp,%rbp
  802bda:	48 83 ec 10          	sub    $0x10,%rsp
  802bde:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802be2:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802be5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802be9:	8b 50 0c             	mov    0xc(%rax),%edx
  802bec:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802bf3:	00 00 00 
  802bf6:	89 10                	mov    %edx,(%rax)
  802bf8:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802bff:	00 00 00 
  802c02:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802c05:	89 50 04             	mov    %edx,0x4(%rax)
  802c08:	be 00 00 00 00       	mov    $0x0,%esi
  802c0d:	bf 02 00 00 00       	mov    $0x2,%edi
  802c12:	48 b8 b5 27 80 00 00 	movabs $0x8027b5,%rax
  802c19:	00 00 00 
  802c1c:	ff d0                	callq  *%rax
  802c1e:	c9                   	leaveq 
  802c1f:	c3                   	retq   

0000000000802c20 <remove>:
  802c20:	55                   	push   %rbp
  802c21:	48 89 e5             	mov    %rsp,%rbp
  802c24:	48 83 ec 10          	sub    $0x10,%rsp
  802c28:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802c2c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802c30:	48 89 c7             	mov    %rax,%rdi
  802c33:	48 b8 d5 0f 80 00 00 	movabs $0x800fd5,%rax
  802c3a:	00 00 00 
  802c3d:	ff d0                	callq  *%rax
  802c3f:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802c44:	7e 07                	jle    802c4d <remove+0x2d>
  802c46:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802c4b:	eb 33                	jmp    802c80 <remove+0x60>
  802c4d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802c51:	48 89 c6             	mov    %rax,%rsi
  802c54:	48 bf 00 80 80 00 00 	movabs $0x808000,%rdi
  802c5b:	00 00 00 
  802c5e:	48 b8 41 10 80 00 00 	movabs $0x801041,%rax
  802c65:	00 00 00 
  802c68:	ff d0                	callq  *%rax
  802c6a:	be 00 00 00 00       	mov    $0x0,%esi
  802c6f:	bf 07 00 00 00       	mov    $0x7,%edi
  802c74:	48 b8 b5 27 80 00 00 	movabs $0x8027b5,%rax
  802c7b:	00 00 00 
  802c7e:	ff d0                	callq  *%rax
  802c80:	c9                   	leaveq 
  802c81:	c3                   	retq   

0000000000802c82 <sync>:
  802c82:	55                   	push   %rbp
  802c83:	48 89 e5             	mov    %rsp,%rbp
  802c86:	be 00 00 00 00       	mov    $0x0,%esi
  802c8b:	bf 08 00 00 00       	mov    $0x8,%edi
  802c90:	48 b8 b5 27 80 00 00 	movabs $0x8027b5,%rax
  802c97:	00 00 00 
  802c9a:	ff d0                	callq  *%rax
  802c9c:	5d                   	pop    %rbp
  802c9d:	c3                   	retq   

0000000000802c9e <copy>:
  802c9e:	55                   	push   %rbp
  802c9f:	48 89 e5             	mov    %rsp,%rbp
  802ca2:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  802ca9:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  802cb0:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  802cb7:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  802cbe:	be 00 00 00 00       	mov    $0x0,%esi
  802cc3:	48 89 c7             	mov    %rax,%rdi
  802cc6:	48 b8 3c 28 80 00 00 	movabs $0x80283c,%rax
  802ccd:	00 00 00 
  802cd0:	ff d0                	callq  *%rax
  802cd2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802cd5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802cd9:	79 28                	jns    802d03 <copy+0x65>
  802cdb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802cde:	89 c6                	mov    %eax,%esi
  802ce0:	48 bf 8c 47 80 00 00 	movabs $0x80478c,%rdi
  802ce7:	00 00 00 
  802cea:	b8 00 00 00 00       	mov    $0x0,%eax
  802cef:	48 ba 8c 04 80 00 00 	movabs $0x80048c,%rdx
  802cf6:	00 00 00 
  802cf9:	ff d2                	callq  *%rdx
  802cfb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802cfe:	e9 74 01 00 00       	jmpq   802e77 <copy+0x1d9>
  802d03:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  802d0a:	be 01 01 00 00       	mov    $0x101,%esi
  802d0f:	48 89 c7             	mov    %rax,%rdi
  802d12:	48 b8 3c 28 80 00 00 	movabs $0x80283c,%rax
  802d19:	00 00 00 
  802d1c:	ff d0                	callq  *%rax
  802d1e:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802d21:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802d25:	79 39                	jns    802d60 <copy+0xc2>
  802d27:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802d2a:	89 c6                	mov    %eax,%esi
  802d2c:	48 bf a2 47 80 00 00 	movabs $0x8047a2,%rdi
  802d33:	00 00 00 
  802d36:	b8 00 00 00 00       	mov    $0x0,%eax
  802d3b:	48 ba 8c 04 80 00 00 	movabs $0x80048c,%rdx
  802d42:	00 00 00 
  802d45:	ff d2                	callq  *%rdx
  802d47:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d4a:	89 c7                	mov    %eax,%edi
  802d4c:	48 b8 44 21 80 00 00 	movabs $0x802144,%rax
  802d53:	00 00 00 
  802d56:	ff d0                	callq  *%rax
  802d58:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802d5b:	e9 17 01 00 00       	jmpq   802e77 <copy+0x1d9>
  802d60:	eb 74                	jmp    802dd6 <copy+0x138>
  802d62:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802d65:	48 63 d0             	movslq %eax,%rdx
  802d68:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802d6f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802d72:	48 89 ce             	mov    %rcx,%rsi
  802d75:	89 c7                	mov    %eax,%edi
  802d77:	48 b8 b0 24 80 00 00 	movabs $0x8024b0,%rax
  802d7e:	00 00 00 
  802d81:	ff d0                	callq  *%rax
  802d83:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802d86:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802d8a:	79 4a                	jns    802dd6 <copy+0x138>
  802d8c:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802d8f:	89 c6                	mov    %eax,%esi
  802d91:	48 bf bc 47 80 00 00 	movabs $0x8047bc,%rdi
  802d98:	00 00 00 
  802d9b:	b8 00 00 00 00       	mov    $0x0,%eax
  802da0:	48 ba 8c 04 80 00 00 	movabs $0x80048c,%rdx
  802da7:	00 00 00 
  802daa:	ff d2                	callq  *%rdx
  802dac:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802daf:	89 c7                	mov    %eax,%edi
  802db1:	48 b8 44 21 80 00 00 	movabs $0x802144,%rax
  802db8:	00 00 00 
  802dbb:	ff d0                	callq  *%rax
  802dbd:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802dc0:	89 c7                	mov    %eax,%edi
  802dc2:	48 b8 44 21 80 00 00 	movabs $0x802144,%rax
  802dc9:	00 00 00 
  802dcc:	ff d0                	callq  *%rax
  802dce:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802dd1:	e9 a1 00 00 00       	jmpq   802e77 <copy+0x1d9>
  802dd6:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802ddd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802de0:	ba 00 02 00 00       	mov    $0x200,%edx
  802de5:	48 89 ce             	mov    %rcx,%rsi
  802de8:	89 c7                	mov    %eax,%edi
  802dea:	48 b8 66 23 80 00 00 	movabs $0x802366,%rax
  802df1:	00 00 00 
  802df4:	ff d0                	callq  *%rax
  802df6:	89 45 f4             	mov    %eax,-0xc(%rbp)
  802df9:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802dfd:	0f 8f 5f ff ff ff    	jg     802d62 <copy+0xc4>
  802e03:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802e07:	79 47                	jns    802e50 <copy+0x1b2>
  802e09:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802e0c:	89 c6                	mov    %eax,%esi
  802e0e:	48 bf cf 47 80 00 00 	movabs $0x8047cf,%rdi
  802e15:	00 00 00 
  802e18:	b8 00 00 00 00       	mov    $0x0,%eax
  802e1d:	48 ba 8c 04 80 00 00 	movabs $0x80048c,%rdx
  802e24:	00 00 00 
  802e27:	ff d2                	callq  *%rdx
  802e29:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e2c:	89 c7                	mov    %eax,%edi
  802e2e:	48 b8 44 21 80 00 00 	movabs $0x802144,%rax
  802e35:	00 00 00 
  802e38:	ff d0                	callq  *%rax
  802e3a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802e3d:	89 c7                	mov    %eax,%edi
  802e3f:	48 b8 44 21 80 00 00 	movabs $0x802144,%rax
  802e46:	00 00 00 
  802e49:	ff d0                	callq  *%rax
  802e4b:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802e4e:	eb 27                	jmp    802e77 <copy+0x1d9>
  802e50:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e53:	89 c7                	mov    %eax,%edi
  802e55:	48 b8 44 21 80 00 00 	movabs $0x802144,%rax
  802e5c:	00 00 00 
  802e5f:	ff d0                	callq  *%rax
  802e61:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802e64:	89 c7                	mov    %eax,%edi
  802e66:	48 b8 44 21 80 00 00 	movabs $0x802144,%rax
  802e6d:	00 00 00 
  802e70:	ff d0                	callq  *%rax
  802e72:	b8 00 00 00 00       	mov    $0x0,%eax
  802e77:	c9                   	leaveq 
  802e78:	c3                   	retq   

0000000000802e79 <fd2sockid>:
  802e79:	55                   	push   %rbp
  802e7a:	48 89 e5             	mov    %rsp,%rbp
  802e7d:	48 83 ec 20          	sub    $0x20,%rsp
  802e81:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802e84:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802e88:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802e8b:	48 89 d6             	mov    %rdx,%rsi
  802e8e:	89 c7                	mov    %eax,%edi
  802e90:	48 b8 34 1f 80 00 00 	movabs $0x801f34,%rax
  802e97:	00 00 00 
  802e9a:	ff d0                	callq  *%rax
  802e9c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e9f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ea3:	79 05                	jns    802eaa <fd2sockid+0x31>
  802ea5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ea8:	eb 24                	jmp    802ece <fd2sockid+0x55>
  802eaa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802eae:	8b 10                	mov    (%rax),%edx
  802eb0:	48 b8 a0 60 80 00 00 	movabs $0x8060a0,%rax
  802eb7:	00 00 00 
  802eba:	8b 00                	mov    (%rax),%eax
  802ebc:	39 c2                	cmp    %eax,%edx
  802ebe:	74 07                	je     802ec7 <fd2sockid+0x4e>
  802ec0:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802ec5:	eb 07                	jmp    802ece <fd2sockid+0x55>
  802ec7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ecb:	8b 40 0c             	mov    0xc(%rax),%eax
  802ece:	c9                   	leaveq 
  802ecf:	c3                   	retq   

0000000000802ed0 <alloc_sockfd>:
  802ed0:	55                   	push   %rbp
  802ed1:	48 89 e5             	mov    %rsp,%rbp
  802ed4:	48 83 ec 20          	sub    $0x20,%rsp
  802ed8:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802edb:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802edf:	48 89 c7             	mov    %rax,%rdi
  802ee2:	48 b8 9c 1e 80 00 00 	movabs $0x801e9c,%rax
  802ee9:	00 00 00 
  802eec:	ff d0                	callq  *%rax
  802eee:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ef1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ef5:	78 26                	js     802f1d <alloc_sockfd+0x4d>
  802ef7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802efb:	ba 07 04 00 00       	mov    $0x407,%edx
  802f00:	48 89 c6             	mov    %rax,%rsi
  802f03:	bf 00 00 00 00       	mov    $0x0,%edi
  802f08:	48 b8 70 19 80 00 00 	movabs $0x801970,%rax
  802f0f:	00 00 00 
  802f12:	ff d0                	callq  *%rax
  802f14:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f17:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f1b:	79 16                	jns    802f33 <alloc_sockfd+0x63>
  802f1d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802f20:	89 c7                	mov    %eax,%edi
  802f22:	48 b8 dd 33 80 00 00 	movabs $0x8033dd,%rax
  802f29:	00 00 00 
  802f2c:	ff d0                	callq  *%rax
  802f2e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f31:	eb 3a                	jmp    802f6d <alloc_sockfd+0x9d>
  802f33:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f37:	48 ba a0 60 80 00 00 	movabs $0x8060a0,%rdx
  802f3e:	00 00 00 
  802f41:	8b 12                	mov    (%rdx),%edx
  802f43:	89 10                	mov    %edx,(%rax)
  802f45:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f49:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  802f50:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f54:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802f57:	89 50 0c             	mov    %edx,0xc(%rax)
  802f5a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f5e:	48 89 c7             	mov    %rax,%rdi
  802f61:	48 b8 4e 1e 80 00 00 	movabs $0x801e4e,%rax
  802f68:	00 00 00 
  802f6b:	ff d0                	callq  *%rax
  802f6d:	c9                   	leaveq 
  802f6e:	c3                   	retq   

0000000000802f6f <accept>:
  802f6f:	55                   	push   %rbp
  802f70:	48 89 e5             	mov    %rsp,%rbp
  802f73:	48 83 ec 30          	sub    $0x30,%rsp
  802f77:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802f7a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802f7e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802f82:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802f85:	89 c7                	mov    %eax,%edi
  802f87:	48 b8 79 2e 80 00 00 	movabs $0x802e79,%rax
  802f8e:	00 00 00 
  802f91:	ff d0                	callq  *%rax
  802f93:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f96:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f9a:	79 05                	jns    802fa1 <accept+0x32>
  802f9c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f9f:	eb 3b                	jmp    802fdc <accept+0x6d>
  802fa1:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802fa5:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  802fa9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802fac:	48 89 ce             	mov    %rcx,%rsi
  802faf:	89 c7                	mov    %eax,%edi
  802fb1:	48 b8 ba 32 80 00 00 	movabs $0x8032ba,%rax
  802fb8:	00 00 00 
  802fbb:	ff d0                	callq  *%rax
  802fbd:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802fc0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802fc4:	79 05                	jns    802fcb <accept+0x5c>
  802fc6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802fc9:	eb 11                	jmp    802fdc <accept+0x6d>
  802fcb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802fce:	89 c7                	mov    %eax,%edi
  802fd0:	48 b8 d0 2e 80 00 00 	movabs $0x802ed0,%rax
  802fd7:	00 00 00 
  802fda:	ff d0                	callq  *%rax
  802fdc:	c9                   	leaveq 
  802fdd:	c3                   	retq   

0000000000802fde <bind>:
  802fde:	55                   	push   %rbp
  802fdf:	48 89 e5             	mov    %rsp,%rbp
  802fe2:	48 83 ec 20          	sub    $0x20,%rsp
  802fe6:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802fe9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802fed:	89 55 e8             	mov    %edx,-0x18(%rbp)
  802ff0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802ff3:	89 c7                	mov    %eax,%edi
  802ff5:	48 b8 79 2e 80 00 00 	movabs $0x802e79,%rax
  802ffc:	00 00 00 
  802fff:	ff d0                	callq  *%rax
  803001:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803004:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803008:	79 05                	jns    80300f <bind+0x31>
  80300a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80300d:	eb 1b                	jmp    80302a <bind+0x4c>
  80300f:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803012:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803016:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803019:	48 89 ce             	mov    %rcx,%rsi
  80301c:	89 c7                	mov    %eax,%edi
  80301e:	48 b8 39 33 80 00 00 	movabs $0x803339,%rax
  803025:	00 00 00 
  803028:	ff d0                	callq  *%rax
  80302a:	c9                   	leaveq 
  80302b:	c3                   	retq   

000000000080302c <shutdown>:
  80302c:	55                   	push   %rbp
  80302d:	48 89 e5             	mov    %rsp,%rbp
  803030:	48 83 ec 20          	sub    $0x20,%rsp
  803034:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803037:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80303a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80303d:	89 c7                	mov    %eax,%edi
  80303f:	48 b8 79 2e 80 00 00 	movabs $0x802e79,%rax
  803046:	00 00 00 
  803049:	ff d0                	callq  *%rax
  80304b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80304e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803052:	79 05                	jns    803059 <shutdown+0x2d>
  803054:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803057:	eb 16                	jmp    80306f <shutdown+0x43>
  803059:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80305c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80305f:	89 d6                	mov    %edx,%esi
  803061:	89 c7                	mov    %eax,%edi
  803063:	48 b8 9d 33 80 00 00 	movabs $0x80339d,%rax
  80306a:	00 00 00 
  80306d:	ff d0                	callq  *%rax
  80306f:	c9                   	leaveq 
  803070:	c3                   	retq   

0000000000803071 <devsock_close>:
  803071:	55                   	push   %rbp
  803072:	48 89 e5             	mov    %rsp,%rbp
  803075:	48 83 ec 10          	sub    $0x10,%rsp
  803079:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80307d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803081:	48 89 c7             	mov    %rax,%rdi
  803084:	48 b8 ca 40 80 00 00 	movabs $0x8040ca,%rax
  80308b:	00 00 00 
  80308e:	ff d0                	callq  *%rax
  803090:	83 f8 01             	cmp    $0x1,%eax
  803093:	75 17                	jne    8030ac <devsock_close+0x3b>
  803095:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803099:	8b 40 0c             	mov    0xc(%rax),%eax
  80309c:	89 c7                	mov    %eax,%edi
  80309e:	48 b8 dd 33 80 00 00 	movabs $0x8033dd,%rax
  8030a5:	00 00 00 
  8030a8:	ff d0                	callq  *%rax
  8030aa:	eb 05                	jmp    8030b1 <devsock_close+0x40>
  8030ac:	b8 00 00 00 00       	mov    $0x0,%eax
  8030b1:	c9                   	leaveq 
  8030b2:	c3                   	retq   

00000000008030b3 <connect>:
  8030b3:	55                   	push   %rbp
  8030b4:	48 89 e5             	mov    %rsp,%rbp
  8030b7:	48 83 ec 20          	sub    $0x20,%rsp
  8030bb:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8030be:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8030c2:	89 55 e8             	mov    %edx,-0x18(%rbp)
  8030c5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8030c8:	89 c7                	mov    %eax,%edi
  8030ca:	48 b8 79 2e 80 00 00 	movabs $0x802e79,%rax
  8030d1:	00 00 00 
  8030d4:	ff d0                	callq  *%rax
  8030d6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8030d9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8030dd:	79 05                	jns    8030e4 <connect+0x31>
  8030df:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030e2:	eb 1b                	jmp    8030ff <connect+0x4c>
  8030e4:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8030e7:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8030eb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030ee:	48 89 ce             	mov    %rcx,%rsi
  8030f1:	89 c7                	mov    %eax,%edi
  8030f3:	48 b8 0a 34 80 00 00 	movabs $0x80340a,%rax
  8030fa:	00 00 00 
  8030fd:	ff d0                	callq  *%rax
  8030ff:	c9                   	leaveq 
  803100:	c3                   	retq   

0000000000803101 <listen>:
  803101:	55                   	push   %rbp
  803102:	48 89 e5             	mov    %rsp,%rbp
  803105:	48 83 ec 20          	sub    $0x20,%rsp
  803109:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80310c:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80310f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803112:	89 c7                	mov    %eax,%edi
  803114:	48 b8 79 2e 80 00 00 	movabs $0x802e79,%rax
  80311b:	00 00 00 
  80311e:	ff d0                	callq  *%rax
  803120:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803123:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803127:	79 05                	jns    80312e <listen+0x2d>
  803129:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80312c:	eb 16                	jmp    803144 <listen+0x43>
  80312e:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803131:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803134:	89 d6                	mov    %edx,%esi
  803136:	89 c7                	mov    %eax,%edi
  803138:	48 b8 6e 34 80 00 00 	movabs $0x80346e,%rax
  80313f:	00 00 00 
  803142:	ff d0                	callq  *%rax
  803144:	c9                   	leaveq 
  803145:	c3                   	retq   

0000000000803146 <devsock_read>:
  803146:	55                   	push   %rbp
  803147:	48 89 e5             	mov    %rsp,%rbp
  80314a:	48 83 ec 20          	sub    $0x20,%rsp
  80314e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803152:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803156:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80315a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80315e:	89 c2                	mov    %eax,%edx
  803160:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803164:	8b 40 0c             	mov    0xc(%rax),%eax
  803167:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  80316b:	b9 00 00 00 00       	mov    $0x0,%ecx
  803170:	89 c7                	mov    %eax,%edi
  803172:	48 b8 ae 34 80 00 00 	movabs $0x8034ae,%rax
  803179:	00 00 00 
  80317c:	ff d0                	callq  *%rax
  80317e:	c9                   	leaveq 
  80317f:	c3                   	retq   

0000000000803180 <devsock_write>:
  803180:	55                   	push   %rbp
  803181:	48 89 e5             	mov    %rsp,%rbp
  803184:	48 83 ec 20          	sub    $0x20,%rsp
  803188:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80318c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803190:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803194:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803198:	89 c2                	mov    %eax,%edx
  80319a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80319e:	8b 40 0c             	mov    0xc(%rax),%eax
  8031a1:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  8031a5:	b9 00 00 00 00       	mov    $0x0,%ecx
  8031aa:	89 c7                	mov    %eax,%edi
  8031ac:	48 b8 7a 35 80 00 00 	movabs $0x80357a,%rax
  8031b3:	00 00 00 
  8031b6:	ff d0                	callq  *%rax
  8031b8:	c9                   	leaveq 
  8031b9:	c3                   	retq   

00000000008031ba <devsock_stat>:
  8031ba:	55                   	push   %rbp
  8031bb:	48 89 e5             	mov    %rsp,%rbp
  8031be:	48 83 ec 10          	sub    $0x10,%rsp
  8031c2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8031c6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8031ca:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8031ce:	48 be ea 47 80 00 00 	movabs $0x8047ea,%rsi
  8031d5:	00 00 00 
  8031d8:	48 89 c7             	mov    %rax,%rdi
  8031db:	48 b8 41 10 80 00 00 	movabs $0x801041,%rax
  8031e2:	00 00 00 
  8031e5:	ff d0                	callq  *%rax
  8031e7:	b8 00 00 00 00       	mov    $0x0,%eax
  8031ec:	c9                   	leaveq 
  8031ed:	c3                   	retq   

00000000008031ee <socket>:
  8031ee:	55                   	push   %rbp
  8031ef:	48 89 e5             	mov    %rsp,%rbp
  8031f2:	48 83 ec 20          	sub    $0x20,%rsp
  8031f6:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8031f9:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8031fc:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  8031ff:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803202:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803205:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803208:	89 ce                	mov    %ecx,%esi
  80320a:	89 c7                	mov    %eax,%edi
  80320c:	48 b8 32 36 80 00 00 	movabs $0x803632,%rax
  803213:	00 00 00 
  803216:	ff d0                	callq  *%rax
  803218:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80321b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80321f:	79 05                	jns    803226 <socket+0x38>
  803221:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803224:	eb 11                	jmp    803237 <socket+0x49>
  803226:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803229:	89 c7                	mov    %eax,%edi
  80322b:	48 b8 d0 2e 80 00 00 	movabs $0x802ed0,%rax
  803232:	00 00 00 
  803235:	ff d0                	callq  *%rax
  803237:	c9                   	leaveq 
  803238:	c3                   	retq   

0000000000803239 <nsipc>:
  803239:	55                   	push   %rbp
  80323a:	48 89 e5             	mov    %rsp,%rbp
  80323d:	48 83 ec 10          	sub    $0x10,%rsp
  803241:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803244:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  80324b:	00 00 00 
  80324e:	8b 00                	mov    (%rax),%eax
  803250:	85 c0                	test   %eax,%eax
  803252:	75 1d                	jne    803271 <nsipc+0x38>
  803254:	bf 02 00 00 00       	mov    $0x2,%edi
  803259:	48 b8 58 40 80 00 00 	movabs $0x804058,%rax
  803260:	00 00 00 
  803263:	ff d0                	callq  *%rax
  803265:	48 ba 04 70 80 00 00 	movabs $0x807004,%rdx
  80326c:	00 00 00 
  80326f:	89 02                	mov    %eax,(%rdx)
  803271:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  803278:	00 00 00 
  80327b:	8b 00                	mov    (%rax),%eax
  80327d:	8b 75 fc             	mov    -0x4(%rbp),%esi
  803280:	b9 07 00 00 00       	mov    $0x7,%ecx
  803285:	48 ba 00 a0 80 00 00 	movabs $0x80a000,%rdx
  80328c:	00 00 00 
  80328f:	89 c7                	mov    %eax,%edi
  803291:	48 b8 c2 3f 80 00 00 	movabs $0x803fc2,%rax
  803298:	00 00 00 
  80329b:	ff d0                	callq  *%rax
  80329d:	ba 00 00 00 00       	mov    $0x0,%edx
  8032a2:	be 00 00 00 00       	mov    $0x0,%esi
  8032a7:	bf 00 00 00 00       	mov    $0x0,%edi
  8032ac:	48 b8 01 3f 80 00 00 	movabs $0x803f01,%rax
  8032b3:	00 00 00 
  8032b6:	ff d0                	callq  *%rax
  8032b8:	c9                   	leaveq 
  8032b9:	c3                   	retq   

00000000008032ba <nsipc_accept>:
  8032ba:	55                   	push   %rbp
  8032bb:	48 89 e5             	mov    %rsp,%rbp
  8032be:	48 83 ec 30          	sub    $0x30,%rsp
  8032c2:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8032c5:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8032c9:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8032cd:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8032d4:	00 00 00 
  8032d7:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8032da:	89 10                	mov    %edx,(%rax)
  8032dc:	bf 01 00 00 00       	mov    $0x1,%edi
  8032e1:	48 b8 39 32 80 00 00 	movabs $0x803239,%rax
  8032e8:	00 00 00 
  8032eb:	ff d0                	callq  *%rax
  8032ed:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8032f0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8032f4:	78 3e                	js     803334 <nsipc_accept+0x7a>
  8032f6:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8032fd:	00 00 00 
  803300:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803304:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803308:	8b 40 10             	mov    0x10(%rax),%eax
  80330b:	89 c2                	mov    %eax,%edx
  80330d:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  803311:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803315:	48 89 ce             	mov    %rcx,%rsi
  803318:	48 89 c7             	mov    %rax,%rdi
  80331b:	48 b8 65 13 80 00 00 	movabs $0x801365,%rax
  803322:	00 00 00 
  803325:	ff d0                	callq  *%rax
  803327:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80332b:	8b 50 10             	mov    0x10(%rax),%edx
  80332e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803332:	89 10                	mov    %edx,(%rax)
  803334:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803337:	c9                   	leaveq 
  803338:	c3                   	retq   

0000000000803339 <nsipc_bind>:
  803339:	55                   	push   %rbp
  80333a:	48 89 e5             	mov    %rsp,%rbp
  80333d:	48 83 ec 10          	sub    $0x10,%rsp
  803341:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803344:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803348:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80334b:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803352:	00 00 00 
  803355:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803358:	89 10                	mov    %edx,(%rax)
  80335a:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80335d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803361:	48 89 c6             	mov    %rax,%rsi
  803364:	48 bf 04 a0 80 00 00 	movabs $0x80a004,%rdi
  80336b:	00 00 00 
  80336e:	48 b8 65 13 80 00 00 	movabs $0x801365,%rax
  803375:	00 00 00 
  803378:	ff d0                	callq  *%rax
  80337a:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803381:	00 00 00 
  803384:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803387:	89 50 14             	mov    %edx,0x14(%rax)
  80338a:	bf 02 00 00 00       	mov    $0x2,%edi
  80338f:	48 b8 39 32 80 00 00 	movabs $0x803239,%rax
  803396:	00 00 00 
  803399:	ff d0                	callq  *%rax
  80339b:	c9                   	leaveq 
  80339c:	c3                   	retq   

000000000080339d <nsipc_shutdown>:
  80339d:	55                   	push   %rbp
  80339e:	48 89 e5             	mov    %rsp,%rbp
  8033a1:	48 83 ec 10          	sub    $0x10,%rsp
  8033a5:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8033a8:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8033ab:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8033b2:	00 00 00 
  8033b5:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8033b8:	89 10                	mov    %edx,(%rax)
  8033ba:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8033c1:	00 00 00 
  8033c4:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8033c7:	89 50 04             	mov    %edx,0x4(%rax)
  8033ca:	bf 03 00 00 00       	mov    $0x3,%edi
  8033cf:	48 b8 39 32 80 00 00 	movabs $0x803239,%rax
  8033d6:	00 00 00 
  8033d9:	ff d0                	callq  *%rax
  8033db:	c9                   	leaveq 
  8033dc:	c3                   	retq   

00000000008033dd <nsipc_close>:
  8033dd:	55                   	push   %rbp
  8033de:	48 89 e5             	mov    %rsp,%rbp
  8033e1:	48 83 ec 10          	sub    $0x10,%rsp
  8033e5:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8033e8:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8033ef:	00 00 00 
  8033f2:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8033f5:	89 10                	mov    %edx,(%rax)
  8033f7:	bf 04 00 00 00       	mov    $0x4,%edi
  8033fc:	48 b8 39 32 80 00 00 	movabs $0x803239,%rax
  803403:	00 00 00 
  803406:	ff d0                	callq  *%rax
  803408:	c9                   	leaveq 
  803409:	c3                   	retq   

000000000080340a <nsipc_connect>:
  80340a:	55                   	push   %rbp
  80340b:	48 89 e5             	mov    %rsp,%rbp
  80340e:	48 83 ec 10          	sub    $0x10,%rsp
  803412:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803415:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803419:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80341c:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803423:	00 00 00 
  803426:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803429:	89 10                	mov    %edx,(%rax)
  80342b:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80342e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803432:	48 89 c6             	mov    %rax,%rsi
  803435:	48 bf 04 a0 80 00 00 	movabs $0x80a004,%rdi
  80343c:	00 00 00 
  80343f:	48 b8 65 13 80 00 00 	movabs $0x801365,%rax
  803446:	00 00 00 
  803449:	ff d0                	callq  *%rax
  80344b:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803452:	00 00 00 
  803455:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803458:	89 50 14             	mov    %edx,0x14(%rax)
  80345b:	bf 05 00 00 00       	mov    $0x5,%edi
  803460:	48 b8 39 32 80 00 00 	movabs $0x803239,%rax
  803467:	00 00 00 
  80346a:	ff d0                	callq  *%rax
  80346c:	c9                   	leaveq 
  80346d:	c3                   	retq   

000000000080346e <nsipc_listen>:
  80346e:	55                   	push   %rbp
  80346f:	48 89 e5             	mov    %rsp,%rbp
  803472:	48 83 ec 10          	sub    $0x10,%rsp
  803476:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803479:	89 75 f8             	mov    %esi,-0x8(%rbp)
  80347c:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803483:	00 00 00 
  803486:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803489:	89 10                	mov    %edx,(%rax)
  80348b:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803492:	00 00 00 
  803495:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803498:	89 50 04             	mov    %edx,0x4(%rax)
  80349b:	bf 06 00 00 00       	mov    $0x6,%edi
  8034a0:	48 b8 39 32 80 00 00 	movabs $0x803239,%rax
  8034a7:	00 00 00 
  8034aa:	ff d0                	callq  *%rax
  8034ac:	c9                   	leaveq 
  8034ad:	c3                   	retq   

00000000008034ae <nsipc_recv>:
  8034ae:	55                   	push   %rbp
  8034af:	48 89 e5             	mov    %rsp,%rbp
  8034b2:	48 83 ec 30          	sub    $0x30,%rsp
  8034b6:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8034b9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8034bd:	89 55 e8             	mov    %edx,-0x18(%rbp)
  8034c0:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  8034c3:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8034ca:	00 00 00 
  8034cd:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8034d0:	89 10                	mov    %edx,(%rax)
  8034d2:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8034d9:	00 00 00 
  8034dc:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8034df:	89 50 04             	mov    %edx,0x4(%rax)
  8034e2:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8034e9:	00 00 00 
  8034ec:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8034ef:	89 50 08             	mov    %edx,0x8(%rax)
  8034f2:	bf 07 00 00 00       	mov    $0x7,%edi
  8034f7:	48 b8 39 32 80 00 00 	movabs $0x803239,%rax
  8034fe:	00 00 00 
  803501:	ff d0                	callq  *%rax
  803503:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803506:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80350a:	78 69                	js     803575 <nsipc_recv+0xc7>
  80350c:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  803513:	7f 08                	jg     80351d <nsipc_recv+0x6f>
  803515:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803518:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  80351b:	7e 35                	jle    803552 <nsipc_recv+0xa4>
  80351d:	48 b9 f1 47 80 00 00 	movabs $0x8047f1,%rcx
  803524:	00 00 00 
  803527:	48 ba 06 48 80 00 00 	movabs $0x804806,%rdx
  80352e:	00 00 00 
  803531:	be 62 00 00 00       	mov    $0x62,%esi
  803536:	48 bf 1b 48 80 00 00 	movabs $0x80481b,%rdi
  80353d:	00 00 00 
  803540:	b8 00 00 00 00       	mov    $0x0,%eax
  803545:	49 b8 53 02 80 00 00 	movabs $0x800253,%r8
  80354c:	00 00 00 
  80354f:	41 ff d0             	callq  *%r8
  803552:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803555:	48 63 d0             	movslq %eax,%rdx
  803558:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80355c:	48 be 00 a0 80 00 00 	movabs $0x80a000,%rsi
  803563:	00 00 00 
  803566:	48 89 c7             	mov    %rax,%rdi
  803569:	48 b8 65 13 80 00 00 	movabs $0x801365,%rax
  803570:	00 00 00 
  803573:	ff d0                	callq  *%rax
  803575:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803578:	c9                   	leaveq 
  803579:	c3                   	retq   

000000000080357a <nsipc_send>:
  80357a:	55                   	push   %rbp
  80357b:	48 89 e5             	mov    %rsp,%rbp
  80357e:	48 83 ec 20          	sub    $0x20,%rsp
  803582:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803585:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803589:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80358c:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  80358f:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803596:	00 00 00 
  803599:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80359c:	89 10                	mov    %edx,(%rax)
  80359e:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  8035a5:	7e 35                	jle    8035dc <nsipc_send+0x62>
  8035a7:	48 b9 2a 48 80 00 00 	movabs $0x80482a,%rcx
  8035ae:	00 00 00 
  8035b1:	48 ba 06 48 80 00 00 	movabs $0x804806,%rdx
  8035b8:	00 00 00 
  8035bb:	be 6d 00 00 00       	mov    $0x6d,%esi
  8035c0:	48 bf 1b 48 80 00 00 	movabs $0x80481b,%rdi
  8035c7:	00 00 00 
  8035ca:	b8 00 00 00 00       	mov    $0x0,%eax
  8035cf:	49 b8 53 02 80 00 00 	movabs $0x800253,%r8
  8035d6:	00 00 00 
  8035d9:	41 ff d0             	callq  *%r8
  8035dc:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8035df:	48 63 d0             	movslq %eax,%rdx
  8035e2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8035e6:	48 89 c6             	mov    %rax,%rsi
  8035e9:	48 bf 0c a0 80 00 00 	movabs $0x80a00c,%rdi
  8035f0:	00 00 00 
  8035f3:	48 b8 65 13 80 00 00 	movabs $0x801365,%rax
  8035fa:	00 00 00 
  8035fd:	ff d0                	callq  *%rax
  8035ff:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803606:	00 00 00 
  803609:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80360c:	89 50 04             	mov    %edx,0x4(%rax)
  80360f:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803616:	00 00 00 
  803619:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80361c:	89 50 08             	mov    %edx,0x8(%rax)
  80361f:	bf 08 00 00 00       	mov    $0x8,%edi
  803624:	48 b8 39 32 80 00 00 	movabs $0x803239,%rax
  80362b:	00 00 00 
  80362e:	ff d0                	callq  *%rax
  803630:	c9                   	leaveq 
  803631:	c3                   	retq   

0000000000803632 <nsipc_socket>:
  803632:	55                   	push   %rbp
  803633:	48 89 e5             	mov    %rsp,%rbp
  803636:	48 83 ec 10          	sub    $0x10,%rsp
  80363a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80363d:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803640:	89 55 f4             	mov    %edx,-0xc(%rbp)
  803643:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80364a:	00 00 00 
  80364d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803650:	89 10                	mov    %edx,(%rax)
  803652:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803659:	00 00 00 
  80365c:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80365f:	89 50 04             	mov    %edx,0x4(%rax)
  803662:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803669:	00 00 00 
  80366c:	8b 55 f4             	mov    -0xc(%rbp),%edx
  80366f:	89 50 08             	mov    %edx,0x8(%rax)
  803672:	bf 09 00 00 00       	mov    $0x9,%edi
  803677:	48 b8 39 32 80 00 00 	movabs $0x803239,%rax
  80367e:	00 00 00 
  803681:	ff d0                	callq  *%rax
  803683:	c9                   	leaveq 
  803684:	c3                   	retq   

0000000000803685 <pipe>:
  803685:	55                   	push   %rbp
  803686:	48 89 e5             	mov    %rsp,%rbp
  803689:	53                   	push   %rbx
  80368a:	48 83 ec 38          	sub    $0x38,%rsp
  80368e:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  803692:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  803696:	48 89 c7             	mov    %rax,%rdi
  803699:	48 b8 9c 1e 80 00 00 	movabs $0x801e9c,%rax
  8036a0:	00 00 00 
  8036a3:	ff d0                	callq  *%rax
  8036a5:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8036a8:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8036ac:	0f 88 bf 01 00 00    	js     803871 <pipe+0x1ec>
  8036b2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8036b6:	ba 07 04 00 00       	mov    $0x407,%edx
  8036bb:	48 89 c6             	mov    %rax,%rsi
  8036be:	bf 00 00 00 00       	mov    $0x0,%edi
  8036c3:	48 b8 70 19 80 00 00 	movabs $0x801970,%rax
  8036ca:	00 00 00 
  8036cd:	ff d0                	callq  *%rax
  8036cf:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8036d2:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8036d6:	0f 88 95 01 00 00    	js     803871 <pipe+0x1ec>
  8036dc:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  8036e0:	48 89 c7             	mov    %rax,%rdi
  8036e3:	48 b8 9c 1e 80 00 00 	movabs $0x801e9c,%rax
  8036ea:	00 00 00 
  8036ed:	ff d0                	callq  *%rax
  8036ef:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8036f2:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8036f6:	0f 88 5d 01 00 00    	js     803859 <pipe+0x1d4>
  8036fc:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803700:	ba 07 04 00 00       	mov    $0x407,%edx
  803705:	48 89 c6             	mov    %rax,%rsi
  803708:	bf 00 00 00 00       	mov    $0x0,%edi
  80370d:	48 b8 70 19 80 00 00 	movabs $0x801970,%rax
  803714:	00 00 00 
  803717:	ff d0                	callq  *%rax
  803719:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80371c:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803720:	0f 88 33 01 00 00    	js     803859 <pipe+0x1d4>
  803726:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80372a:	48 89 c7             	mov    %rax,%rdi
  80372d:	48 b8 71 1e 80 00 00 	movabs $0x801e71,%rax
  803734:	00 00 00 
  803737:	ff d0                	callq  *%rax
  803739:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80373d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803741:	ba 07 04 00 00       	mov    $0x407,%edx
  803746:	48 89 c6             	mov    %rax,%rsi
  803749:	bf 00 00 00 00       	mov    $0x0,%edi
  80374e:	48 b8 70 19 80 00 00 	movabs $0x801970,%rax
  803755:	00 00 00 
  803758:	ff d0                	callq  *%rax
  80375a:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80375d:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803761:	79 05                	jns    803768 <pipe+0xe3>
  803763:	e9 d9 00 00 00       	jmpq   803841 <pipe+0x1bc>
  803768:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80376c:	48 89 c7             	mov    %rax,%rdi
  80376f:	48 b8 71 1e 80 00 00 	movabs $0x801e71,%rax
  803776:	00 00 00 
  803779:	ff d0                	callq  *%rax
  80377b:	48 89 c2             	mov    %rax,%rdx
  80377e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803782:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  803788:	48 89 d1             	mov    %rdx,%rcx
  80378b:	ba 00 00 00 00       	mov    $0x0,%edx
  803790:	48 89 c6             	mov    %rax,%rsi
  803793:	bf 00 00 00 00       	mov    $0x0,%edi
  803798:	48 b8 c0 19 80 00 00 	movabs $0x8019c0,%rax
  80379f:	00 00 00 
  8037a2:	ff d0                	callq  *%rax
  8037a4:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8037a7:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8037ab:	79 1b                	jns    8037c8 <pipe+0x143>
  8037ad:	90                   	nop
  8037ae:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8037b2:	48 89 c6             	mov    %rax,%rsi
  8037b5:	bf 00 00 00 00       	mov    $0x0,%edi
  8037ba:	48 b8 1b 1a 80 00 00 	movabs $0x801a1b,%rax
  8037c1:	00 00 00 
  8037c4:	ff d0                	callq  *%rax
  8037c6:	eb 79                	jmp    803841 <pipe+0x1bc>
  8037c8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8037cc:	48 ba e0 60 80 00 00 	movabs $0x8060e0,%rdx
  8037d3:	00 00 00 
  8037d6:	8b 12                	mov    (%rdx),%edx
  8037d8:	89 10                	mov    %edx,(%rax)
  8037da:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8037de:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  8037e5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8037e9:	48 ba e0 60 80 00 00 	movabs $0x8060e0,%rdx
  8037f0:	00 00 00 
  8037f3:	8b 12                	mov    (%rdx),%edx
  8037f5:	89 10                	mov    %edx,(%rax)
  8037f7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8037fb:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  803802:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803806:	48 89 c7             	mov    %rax,%rdi
  803809:	48 b8 4e 1e 80 00 00 	movabs $0x801e4e,%rax
  803810:	00 00 00 
  803813:	ff d0                	callq  *%rax
  803815:	89 c2                	mov    %eax,%edx
  803817:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80381b:	89 10                	mov    %edx,(%rax)
  80381d:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803821:	48 8d 58 04          	lea    0x4(%rax),%rbx
  803825:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803829:	48 89 c7             	mov    %rax,%rdi
  80382c:	48 b8 4e 1e 80 00 00 	movabs $0x801e4e,%rax
  803833:	00 00 00 
  803836:	ff d0                	callq  *%rax
  803838:	89 03                	mov    %eax,(%rbx)
  80383a:	b8 00 00 00 00       	mov    $0x0,%eax
  80383f:	eb 33                	jmp    803874 <pipe+0x1ef>
  803841:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803845:	48 89 c6             	mov    %rax,%rsi
  803848:	bf 00 00 00 00       	mov    $0x0,%edi
  80384d:	48 b8 1b 1a 80 00 00 	movabs $0x801a1b,%rax
  803854:	00 00 00 
  803857:	ff d0                	callq  *%rax
  803859:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80385d:	48 89 c6             	mov    %rax,%rsi
  803860:	bf 00 00 00 00       	mov    $0x0,%edi
  803865:	48 b8 1b 1a 80 00 00 	movabs $0x801a1b,%rax
  80386c:	00 00 00 
  80386f:	ff d0                	callq  *%rax
  803871:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803874:	48 83 c4 38          	add    $0x38,%rsp
  803878:	5b                   	pop    %rbx
  803879:	5d                   	pop    %rbp
  80387a:	c3                   	retq   

000000000080387b <_pipeisclosed>:
  80387b:	55                   	push   %rbp
  80387c:	48 89 e5             	mov    %rsp,%rbp
  80387f:	53                   	push   %rbx
  803880:	48 83 ec 28          	sub    $0x28,%rsp
  803884:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803888:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80388c:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803893:	00 00 00 
  803896:	48 8b 00             	mov    (%rax),%rax
  803899:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80389f:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8038a2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8038a6:	48 89 c7             	mov    %rax,%rdi
  8038a9:	48 b8 ca 40 80 00 00 	movabs $0x8040ca,%rax
  8038b0:	00 00 00 
  8038b3:	ff d0                	callq  *%rax
  8038b5:	89 c3                	mov    %eax,%ebx
  8038b7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8038bb:	48 89 c7             	mov    %rax,%rdi
  8038be:	48 b8 ca 40 80 00 00 	movabs $0x8040ca,%rax
  8038c5:	00 00 00 
  8038c8:	ff d0                	callq  *%rax
  8038ca:	39 c3                	cmp    %eax,%ebx
  8038cc:	0f 94 c0             	sete   %al
  8038cf:	0f b6 c0             	movzbl %al,%eax
  8038d2:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8038d5:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8038dc:	00 00 00 
  8038df:	48 8b 00             	mov    (%rax),%rax
  8038e2:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8038e8:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  8038eb:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8038ee:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  8038f1:	75 05                	jne    8038f8 <_pipeisclosed+0x7d>
  8038f3:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8038f6:	eb 4f                	jmp    803947 <_pipeisclosed+0xcc>
  8038f8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8038fb:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  8038fe:	74 42                	je     803942 <_pipeisclosed+0xc7>
  803900:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  803904:	75 3c                	jne    803942 <_pipeisclosed+0xc7>
  803906:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  80390d:	00 00 00 
  803910:	48 8b 00             	mov    (%rax),%rax
  803913:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  803919:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  80391c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80391f:	89 c6                	mov    %eax,%esi
  803921:	48 bf 3b 48 80 00 00 	movabs $0x80483b,%rdi
  803928:	00 00 00 
  80392b:	b8 00 00 00 00       	mov    $0x0,%eax
  803930:	49 b8 8c 04 80 00 00 	movabs $0x80048c,%r8
  803937:	00 00 00 
  80393a:	41 ff d0             	callq  *%r8
  80393d:	e9 4a ff ff ff       	jmpq   80388c <_pipeisclosed+0x11>
  803942:	e9 45 ff ff ff       	jmpq   80388c <_pipeisclosed+0x11>
  803947:	48 83 c4 28          	add    $0x28,%rsp
  80394b:	5b                   	pop    %rbx
  80394c:	5d                   	pop    %rbp
  80394d:	c3                   	retq   

000000000080394e <pipeisclosed>:
  80394e:	55                   	push   %rbp
  80394f:	48 89 e5             	mov    %rsp,%rbp
  803952:	48 83 ec 30          	sub    $0x30,%rsp
  803956:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803959:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80395d:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803960:	48 89 d6             	mov    %rdx,%rsi
  803963:	89 c7                	mov    %eax,%edi
  803965:	48 b8 34 1f 80 00 00 	movabs $0x801f34,%rax
  80396c:	00 00 00 
  80396f:	ff d0                	callq  *%rax
  803971:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803974:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803978:	79 05                	jns    80397f <pipeisclosed+0x31>
  80397a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80397d:	eb 31                	jmp    8039b0 <pipeisclosed+0x62>
  80397f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803983:	48 89 c7             	mov    %rax,%rdi
  803986:	48 b8 71 1e 80 00 00 	movabs $0x801e71,%rax
  80398d:	00 00 00 
  803990:	ff d0                	callq  *%rax
  803992:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803996:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80399a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80399e:	48 89 d6             	mov    %rdx,%rsi
  8039a1:	48 89 c7             	mov    %rax,%rdi
  8039a4:	48 b8 7b 38 80 00 00 	movabs $0x80387b,%rax
  8039ab:	00 00 00 
  8039ae:	ff d0                	callq  *%rax
  8039b0:	c9                   	leaveq 
  8039b1:	c3                   	retq   

00000000008039b2 <devpipe_read>:
  8039b2:	55                   	push   %rbp
  8039b3:	48 89 e5             	mov    %rsp,%rbp
  8039b6:	48 83 ec 40          	sub    $0x40,%rsp
  8039ba:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8039be:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8039c2:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8039c6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8039ca:	48 89 c7             	mov    %rax,%rdi
  8039cd:	48 b8 71 1e 80 00 00 	movabs $0x801e71,%rax
  8039d4:	00 00 00 
  8039d7:	ff d0                	callq  *%rax
  8039d9:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8039dd:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8039e1:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8039e5:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8039ec:	00 
  8039ed:	e9 92 00 00 00       	jmpq   803a84 <devpipe_read+0xd2>
  8039f2:	eb 41                	jmp    803a35 <devpipe_read+0x83>
  8039f4:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  8039f9:	74 09                	je     803a04 <devpipe_read+0x52>
  8039fb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8039ff:	e9 92 00 00 00       	jmpq   803a96 <devpipe_read+0xe4>
  803a04:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803a08:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803a0c:	48 89 d6             	mov    %rdx,%rsi
  803a0f:	48 89 c7             	mov    %rax,%rdi
  803a12:	48 b8 7b 38 80 00 00 	movabs $0x80387b,%rax
  803a19:	00 00 00 
  803a1c:	ff d0                	callq  *%rax
  803a1e:	85 c0                	test   %eax,%eax
  803a20:	74 07                	je     803a29 <devpipe_read+0x77>
  803a22:	b8 00 00 00 00       	mov    $0x0,%eax
  803a27:	eb 6d                	jmp    803a96 <devpipe_read+0xe4>
  803a29:	48 b8 32 19 80 00 00 	movabs $0x801932,%rax
  803a30:	00 00 00 
  803a33:	ff d0                	callq  *%rax
  803a35:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a39:	8b 10                	mov    (%rax),%edx
  803a3b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a3f:	8b 40 04             	mov    0x4(%rax),%eax
  803a42:	39 c2                	cmp    %eax,%edx
  803a44:	74 ae                	je     8039f4 <devpipe_read+0x42>
  803a46:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803a4a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803a4e:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  803a52:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a56:	8b 00                	mov    (%rax),%eax
  803a58:	99                   	cltd   
  803a59:	c1 ea 1b             	shr    $0x1b,%edx
  803a5c:	01 d0                	add    %edx,%eax
  803a5e:	83 e0 1f             	and    $0x1f,%eax
  803a61:	29 d0                	sub    %edx,%eax
  803a63:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803a67:	48 98                	cltq   
  803a69:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  803a6e:	88 01                	mov    %al,(%rcx)
  803a70:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a74:	8b 00                	mov    (%rax),%eax
  803a76:	8d 50 01             	lea    0x1(%rax),%edx
  803a79:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a7d:	89 10                	mov    %edx,(%rax)
  803a7f:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803a84:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803a88:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803a8c:	0f 82 60 ff ff ff    	jb     8039f2 <devpipe_read+0x40>
  803a92:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803a96:	c9                   	leaveq 
  803a97:	c3                   	retq   

0000000000803a98 <devpipe_write>:
  803a98:	55                   	push   %rbp
  803a99:	48 89 e5             	mov    %rsp,%rbp
  803a9c:	48 83 ec 40          	sub    $0x40,%rsp
  803aa0:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803aa4:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803aa8:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803aac:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803ab0:	48 89 c7             	mov    %rax,%rdi
  803ab3:	48 b8 71 1e 80 00 00 	movabs $0x801e71,%rax
  803aba:	00 00 00 
  803abd:	ff d0                	callq  *%rax
  803abf:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803ac3:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803ac7:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803acb:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803ad2:	00 
  803ad3:	e9 8e 00 00 00       	jmpq   803b66 <devpipe_write+0xce>
  803ad8:	eb 31                	jmp    803b0b <devpipe_write+0x73>
  803ada:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803ade:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803ae2:	48 89 d6             	mov    %rdx,%rsi
  803ae5:	48 89 c7             	mov    %rax,%rdi
  803ae8:	48 b8 7b 38 80 00 00 	movabs $0x80387b,%rax
  803aef:	00 00 00 
  803af2:	ff d0                	callq  *%rax
  803af4:	85 c0                	test   %eax,%eax
  803af6:	74 07                	je     803aff <devpipe_write+0x67>
  803af8:	b8 00 00 00 00       	mov    $0x0,%eax
  803afd:	eb 79                	jmp    803b78 <devpipe_write+0xe0>
  803aff:	48 b8 32 19 80 00 00 	movabs $0x801932,%rax
  803b06:	00 00 00 
  803b09:	ff d0                	callq  *%rax
  803b0b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b0f:	8b 40 04             	mov    0x4(%rax),%eax
  803b12:	48 63 d0             	movslq %eax,%rdx
  803b15:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b19:	8b 00                	mov    (%rax),%eax
  803b1b:	48 98                	cltq   
  803b1d:	48 83 c0 20          	add    $0x20,%rax
  803b21:	48 39 c2             	cmp    %rax,%rdx
  803b24:	73 b4                	jae    803ada <devpipe_write+0x42>
  803b26:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b2a:	8b 40 04             	mov    0x4(%rax),%eax
  803b2d:	99                   	cltd   
  803b2e:	c1 ea 1b             	shr    $0x1b,%edx
  803b31:	01 d0                	add    %edx,%eax
  803b33:	83 e0 1f             	and    $0x1f,%eax
  803b36:	29 d0                	sub    %edx,%eax
  803b38:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  803b3c:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  803b40:	48 01 ca             	add    %rcx,%rdx
  803b43:	0f b6 0a             	movzbl (%rdx),%ecx
  803b46:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803b4a:	48 98                	cltq   
  803b4c:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  803b50:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b54:	8b 40 04             	mov    0x4(%rax),%eax
  803b57:	8d 50 01             	lea    0x1(%rax),%edx
  803b5a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b5e:	89 50 04             	mov    %edx,0x4(%rax)
  803b61:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803b66:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803b6a:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803b6e:	0f 82 64 ff ff ff    	jb     803ad8 <devpipe_write+0x40>
  803b74:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803b78:	c9                   	leaveq 
  803b79:	c3                   	retq   

0000000000803b7a <devpipe_stat>:
  803b7a:	55                   	push   %rbp
  803b7b:	48 89 e5             	mov    %rsp,%rbp
  803b7e:	48 83 ec 20          	sub    $0x20,%rsp
  803b82:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803b86:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803b8a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803b8e:	48 89 c7             	mov    %rax,%rdi
  803b91:	48 b8 71 1e 80 00 00 	movabs $0x801e71,%rax
  803b98:	00 00 00 
  803b9b:	ff d0                	callq  *%rax
  803b9d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803ba1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803ba5:	48 be 4e 48 80 00 00 	movabs $0x80484e,%rsi
  803bac:	00 00 00 
  803baf:	48 89 c7             	mov    %rax,%rdi
  803bb2:	48 b8 41 10 80 00 00 	movabs $0x801041,%rax
  803bb9:	00 00 00 
  803bbc:	ff d0                	callq  *%rax
  803bbe:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803bc2:	8b 50 04             	mov    0x4(%rax),%edx
  803bc5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803bc9:	8b 00                	mov    (%rax),%eax
  803bcb:	29 c2                	sub    %eax,%edx
  803bcd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803bd1:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  803bd7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803bdb:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  803be2:	00 00 00 
  803be5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803be9:	48 b9 e0 60 80 00 00 	movabs $0x8060e0,%rcx
  803bf0:	00 00 00 
  803bf3:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  803bfa:	b8 00 00 00 00       	mov    $0x0,%eax
  803bff:	c9                   	leaveq 
  803c00:	c3                   	retq   

0000000000803c01 <devpipe_close>:
  803c01:	55                   	push   %rbp
  803c02:	48 89 e5             	mov    %rsp,%rbp
  803c05:	48 83 ec 10          	sub    $0x10,%rsp
  803c09:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803c0d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803c11:	48 89 c6             	mov    %rax,%rsi
  803c14:	bf 00 00 00 00       	mov    $0x0,%edi
  803c19:	48 b8 1b 1a 80 00 00 	movabs $0x801a1b,%rax
  803c20:	00 00 00 
  803c23:	ff d0                	callq  *%rax
  803c25:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803c29:	48 89 c7             	mov    %rax,%rdi
  803c2c:	48 b8 71 1e 80 00 00 	movabs $0x801e71,%rax
  803c33:	00 00 00 
  803c36:	ff d0                	callq  *%rax
  803c38:	48 89 c6             	mov    %rax,%rsi
  803c3b:	bf 00 00 00 00       	mov    $0x0,%edi
  803c40:	48 b8 1b 1a 80 00 00 	movabs $0x801a1b,%rax
  803c47:	00 00 00 
  803c4a:	ff d0                	callq  *%rax
  803c4c:	c9                   	leaveq 
  803c4d:	c3                   	retq   

0000000000803c4e <cputchar>:
  803c4e:	55                   	push   %rbp
  803c4f:	48 89 e5             	mov    %rsp,%rbp
  803c52:	48 83 ec 20          	sub    $0x20,%rsp
  803c56:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803c59:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803c5c:	88 45 ff             	mov    %al,-0x1(%rbp)
  803c5f:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  803c63:	be 01 00 00 00       	mov    $0x1,%esi
  803c68:	48 89 c7             	mov    %rax,%rdi
  803c6b:	48 b8 28 18 80 00 00 	movabs $0x801828,%rax
  803c72:	00 00 00 
  803c75:	ff d0                	callq  *%rax
  803c77:	c9                   	leaveq 
  803c78:	c3                   	retq   

0000000000803c79 <getchar>:
  803c79:	55                   	push   %rbp
  803c7a:	48 89 e5             	mov    %rsp,%rbp
  803c7d:	48 83 ec 10          	sub    $0x10,%rsp
  803c81:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  803c85:	ba 01 00 00 00       	mov    $0x1,%edx
  803c8a:	48 89 c6             	mov    %rax,%rsi
  803c8d:	bf 00 00 00 00       	mov    $0x0,%edi
  803c92:	48 b8 66 23 80 00 00 	movabs $0x802366,%rax
  803c99:	00 00 00 
  803c9c:	ff d0                	callq  *%rax
  803c9e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803ca1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803ca5:	79 05                	jns    803cac <getchar+0x33>
  803ca7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803caa:	eb 14                	jmp    803cc0 <getchar+0x47>
  803cac:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803cb0:	7f 07                	jg     803cb9 <getchar+0x40>
  803cb2:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  803cb7:	eb 07                	jmp    803cc0 <getchar+0x47>
  803cb9:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  803cbd:	0f b6 c0             	movzbl %al,%eax
  803cc0:	c9                   	leaveq 
  803cc1:	c3                   	retq   

0000000000803cc2 <iscons>:
  803cc2:	55                   	push   %rbp
  803cc3:	48 89 e5             	mov    %rsp,%rbp
  803cc6:	48 83 ec 20          	sub    $0x20,%rsp
  803cca:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803ccd:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803cd1:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803cd4:	48 89 d6             	mov    %rdx,%rsi
  803cd7:	89 c7                	mov    %eax,%edi
  803cd9:	48 b8 34 1f 80 00 00 	movabs $0x801f34,%rax
  803ce0:	00 00 00 
  803ce3:	ff d0                	callq  *%rax
  803ce5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803ce8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803cec:	79 05                	jns    803cf3 <iscons+0x31>
  803cee:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803cf1:	eb 1a                	jmp    803d0d <iscons+0x4b>
  803cf3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803cf7:	8b 10                	mov    (%rax),%edx
  803cf9:	48 b8 20 61 80 00 00 	movabs $0x806120,%rax
  803d00:	00 00 00 
  803d03:	8b 00                	mov    (%rax),%eax
  803d05:	39 c2                	cmp    %eax,%edx
  803d07:	0f 94 c0             	sete   %al
  803d0a:	0f b6 c0             	movzbl %al,%eax
  803d0d:	c9                   	leaveq 
  803d0e:	c3                   	retq   

0000000000803d0f <opencons>:
  803d0f:	55                   	push   %rbp
  803d10:	48 89 e5             	mov    %rsp,%rbp
  803d13:	48 83 ec 10          	sub    $0x10,%rsp
  803d17:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803d1b:	48 89 c7             	mov    %rax,%rdi
  803d1e:	48 b8 9c 1e 80 00 00 	movabs $0x801e9c,%rax
  803d25:	00 00 00 
  803d28:	ff d0                	callq  *%rax
  803d2a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803d2d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803d31:	79 05                	jns    803d38 <opencons+0x29>
  803d33:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d36:	eb 5b                	jmp    803d93 <opencons+0x84>
  803d38:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803d3c:	ba 07 04 00 00       	mov    $0x407,%edx
  803d41:	48 89 c6             	mov    %rax,%rsi
  803d44:	bf 00 00 00 00       	mov    $0x0,%edi
  803d49:	48 b8 70 19 80 00 00 	movabs $0x801970,%rax
  803d50:	00 00 00 
  803d53:	ff d0                	callq  *%rax
  803d55:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803d58:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803d5c:	79 05                	jns    803d63 <opencons+0x54>
  803d5e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d61:	eb 30                	jmp    803d93 <opencons+0x84>
  803d63:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803d67:	48 ba 20 61 80 00 00 	movabs $0x806120,%rdx
  803d6e:	00 00 00 
  803d71:	8b 12                	mov    (%rdx),%edx
  803d73:	89 10                	mov    %edx,(%rax)
  803d75:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803d79:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  803d80:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803d84:	48 89 c7             	mov    %rax,%rdi
  803d87:	48 b8 4e 1e 80 00 00 	movabs $0x801e4e,%rax
  803d8e:	00 00 00 
  803d91:	ff d0                	callq  *%rax
  803d93:	c9                   	leaveq 
  803d94:	c3                   	retq   

0000000000803d95 <devcons_read>:
  803d95:	55                   	push   %rbp
  803d96:	48 89 e5             	mov    %rsp,%rbp
  803d99:	48 83 ec 30          	sub    $0x30,%rsp
  803d9d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803da1:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803da5:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803da9:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  803dae:	75 07                	jne    803db7 <devcons_read+0x22>
  803db0:	b8 00 00 00 00       	mov    $0x0,%eax
  803db5:	eb 4b                	jmp    803e02 <devcons_read+0x6d>
  803db7:	eb 0c                	jmp    803dc5 <devcons_read+0x30>
  803db9:	48 b8 32 19 80 00 00 	movabs $0x801932,%rax
  803dc0:	00 00 00 
  803dc3:	ff d0                	callq  *%rax
  803dc5:	48 b8 72 18 80 00 00 	movabs $0x801872,%rax
  803dcc:	00 00 00 
  803dcf:	ff d0                	callq  *%rax
  803dd1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803dd4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803dd8:	74 df                	je     803db9 <devcons_read+0x24>
  803dda:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803dde:	79 05                	jns    803de5 <devcons_read+0x50>
  803de0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803de3:	eb 1d                	jmp    803e02 <devcons_read+0x6d>
  803de5:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  803de9:	75 07                	jne    803df2 <devcons_read+0x5d>
  803deb:	b8 00 00 00 00       	mov    $0x0,%eax
  803df0:	eb 10                	jmp    803e02 <devcons_read+0x6d>
  803df2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803df5:	89 c2                	mov    %eax,%edx
  803df7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803dfb:	88 10                	mov    %dl,(%rax)
  803dfd:	b8 01 00 00 00       	mov    $0x1,%eax
  803e02:	c9                   	leaveq 
  803e03:	c3                   	retq   

0000000000803e04 <devcons_write>:
  803e04:	55                   	push   %rbp
  803e05:	48 89 e5             	mov    %rsp,%rbp
  803e08:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  803e0f:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  803e16:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  803e1d:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  803e24:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803e2b:	eb 76                	jmp    803ea3 <devcons_write+0x9f>
  803e2d:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  803e34:	89 c2                	mov    %eax,%edx
  803e36:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e39:	29 c2                	sub    %eax,%edx
  803e3b:	89 d0                	mov    %edx,%eax
  803e3d:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803e40:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803e43:	83 f8 7f             	cmp    $0x7f,%eax
  803e46:	76 07                	jbe    803e4f <devcons_write+0x4b>
  803e48:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  803e4f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803e52:	48 63 d0             	movslq %eax,%rdx
  803e55:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e58:	48 63 c8             	movslq %eax,%rcx
  803e5b:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  803e62:	48 01 c1             	add    %rax,%rcx
  803e65:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  803e6c:	48 89 ce             	mov    %rcx,%rsi
  803e6f:	48 89 c7             	mov    %rax,%rdi
  803e72:	48 b8 65 13 80 00 00 	movabs $0x801365,%rax
  803e79:	00 00 00 
  803e7c:	ff d0                	callq  *%rax
  803e7e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803e81:	48 63 d0             	movslq %eax,%rdx
  803e84:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  803e8b:	48 89 d6             	mov    %rdx,%rsi
  803e8e:	48 89 c7             	mov    %rax,%rdi
  803e91:	48 b8 28 18 80 00 00 	movabs $0x801828,%rax
  803e98:	00 00 00 
  803e9b:	ff d0                	callq  *%rax
  803e9d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803ea0:	01 45 fc             	add    %eax,-0x4(%rbp)
  803ea3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ea6:	48 98                	cltq   
  803ea8:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  803eaf:	0f 82 78 ff ff ff    	jb     803e2d <devcons_write+0x29>
  803eb5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803eb8:	c9                   	leaveq 
  803eb9:	c3                   	retq   

0000000000803eba <devcons_close>:
  803eba:	55                   	push   %rbp
  803ebb:	48 89 e5             	mov    %rsp,%rbp
  803ebe:	48 83 ec 08          	sub    $0x8,%rsp
  803ec2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803ec6:	b8 00 00 00 00       	mov    $0x0,%eax
  803ecb:	c9                   	leaveq 
  803ecc:	c3                   	retq   

0000000000803ecd <devcons_stat>:
  803ecd:	55                   	push   %rbp
  803ece:	48 89 e5             	mov    %rsp,%rbp
  803ed1:	48 83 ec 10          	sub    $0x10,%rsp
  803ed5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803ed9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803edd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ee1:	48 be 5a 48 80 00 00 	movabs $0x80485a,%rsi
  803ee8:	00 00 00 
  803eeb:	48 89 c7             	mov    %rax,%rdi
  803eee:	48 b8 41 10 80 00 00 	movabs $0x801041,%rax
  803ef5:	00 00 00 
  803ef8:	ff d0                	callq  *%rax
  803efa:	b8 00 00 00 00       	mov    $0x0,%eax
  803eff:	c9                   	leaveq 
  803f00:	c3                   	retq   

0000000000803f01 <ipc_recv>:
  803f01:	55                   	push   %rbp
  803f02:	48 89 e5             	mov    %rsp,%rbp
  803f05:	48 83 ec 30          	sub    $0x30,%rsp
  803f09:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803f0d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803f11:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803f15:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  803f1a:	75 0e                	jne    803f2a <ipc_recv+0x29>
  803f1c:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  803f23:	00 00 00 
  803f26:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803f2a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803f2e:	48 89 c7             	mov    %rax,%rdi
  803f31:	48 b8 99 1b 80 00 00 	movabs $0x801b99,%rax
  803f38:	00 00 00 
  803f3b:	ff d0                	callq  *%rax
  803f3d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803f40:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803f44:	79 27                	jns    803f6d <ipc_recv+0x6c>
  803f46:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  803f4b:	74 0a                	je     803f57 <ipc_recv+0x56>
  803f4d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803f51:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  803f57:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  803f5c:	74 0a                	je     803f68 <ipc_recv+0x67>
  803f5e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803f62:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  803f68:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f6b:	eb 53                	jmp    803fc0 <ipc_recv+0xbf>
  803f6d:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  803f72:	74 19                	je     803f8d <ipc_recv+0x8c>
  803f74:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803f7b:	00 00 00 
  803f7e:	48 8b 00             	mov    (%rax),%rax
  803f81:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  803f87:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803f8b:	89 10                	mov    %edx,(%rax)
  803f8d:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  803f92:	74 19                	je     803fad <ipc_recv+0xac>
  803f94:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803f9b:	00 00 00 
  803f9e:	48 8b 00             	mov    (%rax),%rax
  803fa1:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  803fa7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803fab:	89 10                	mov    %edx,(%rax)
  803fad:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803fb4:	00 00 00 
  803fb7:	48 8b 00             	mov    (%rax),%rax
  803fba:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  803fc0:	c9                   	leaveq 
  803fc1:	c3                   	retq   

0000000000803fc2 <ipc_send>:
  803fc2:	55                   	push   %rbp
  803fc3:	48 89 e5             	mov    %rsp,%rbp
  803fc6:	48 83 ec 30          	sub    $0x30,%rsp
  803fca:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803fcd:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803fd0:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  803fd4:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  803fd7:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  803fdc:	75 10                	jne    803fee <ipc_send+0x2c>
  803fde:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  803fe5:	00 00 00 
  803fe8:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803fec:	eb 0e                	jmp    803ffc <ipc_send+0x3a>
  803fee:	eb 0c                	jmp    803ffc <ipc_send+0x3a>
  803ff0:	48 b8 32 19 80 00 00 	movabs $0x801932,%rax
  803ff7:	00 00 00 
  803ffa:	ff d0                	callq  *%rax
  803ffc:	8b 75 e8             	mov    -0x18(%rbp),%esi
  803fff:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  804002:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  804006:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804009:	89 c7                	mov    %eax,%edi
  80400b:	48 b8 44 1b 80 00 00 	movabs $0x801b44,%rax
  804012:	00 00 00 
  804015:	ff d0                	callq  *%rax
  804017:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80401a:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  80401e:	74 d0                	je     803ff0 <ipc_send+0x2e>
  804020:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804024:	79 30                	jns    804056 <ipc_send+0x94>
  804026:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804029:	89 c1                	mov    %eax,%ecx
  80402b:	48 ba 61 48 80 00 00 	movabs $0x804861,%rdx
  804032:	00 00 00 
  804035:	be 44 00 00 00       	mov    $0x44,%esi
  80403a:	48 bf 77 48 80 00 00 	movabs $0x804877,%rdi
  804041:	00 00 00 
  804044:	b8 00 00 00 00       	mov    $0x0,%eax
  804049:	49 b8 53 02 80 00 00 	movabs $0x800253,%r8
  804050:	00 00 00 
  804053:	41 ff d0             	callq  *%r8
  804056:	c9                   	leaveq 
  804057:	c3                   	retq   

0000000000804058 <ipc_find_env>:
  804058:	55                   	push   %rbp
  804059:	48 89 e5             	mov    %rsp,%rbp
  80405c:	48 83 ec 14          	sub    $0x14,%rsp
  804060:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804063:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80406a:	eb 4e                	jmp    8040ba <ipc_find_env+0x62>
  80406c:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804073:	00 00 00 
  804076:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804079:	48 98                	cltq   
  80407b:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804082:	48 01 d0             	add    %rdx,%rax
  804085:	48 05 d0 00 00 00    	add    $0xd0,%rax
  80408b:	8b 00                	mov    (%rax),%eax
  80408d:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  804090:	75 24                	jne    8040b6 <ipc_find_env+0x5e>
  804092:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804099:	00 00 00 
  80409c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80409f:	48 98                	cltq   
  8040a1:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  8040a8:	48 01 d0             	add    %rdx,%rax
  8040ab:	48 05 c0 00 00 00    	add    $0xc0,%rax
  8040b1:	8b 40 08             	mov    0x8(%rax),%eax
  8040b4:	eb 12                	jmp    8040c8 <ipc_find_env+0x70>
  8040b6:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8040ba:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  8040c1:	7e a9                	jle    80406c <ipc_find_env+0x14>
  8040c3:	b8 00 00 00 00       	mov    $0x0,%eax
  8040c8:	c9                   	leaveq 
  8040c9:	c3                   	retq   

00000000008040ca <pageref>:
  8040ca:	55                   	push   %rbp
  8040cb:	48 89 e5             	mov    %rsp,%rbp
  8040ce:	48 83 ec 18          	sub    $0x18,%rsp
  8040d2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8040d6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8040da:	48 c1 e8 15          	shr    $0x15,%rax
  8040de:	48 89 c2             	mov    %rax,%rdx
  8040e1:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8040e8:	01 00 00 
  8040eb:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8040ef:	83 e0 01             	and    $0x1,%eax
  8040f2:	48 85 c0             	test   %rax,%rax
  8040f5:	75 07                	jne    8040fe <pageref+0x34>
  8040f7:	b8 00 00 00 00       	mov    $0x0,%eax
  8040fc:	eb 53                	jmp    804151 <pageref+0x87>
  8040fe:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804102:	48 c1 e8 0c          	shr    $0xc,%rax
  804106:	48 89 c2             	mov    %rax,%rdx
  804109:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  804110:	01 00 00 
  804113:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804117:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80411b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80411f:	83 e0 01             	and    $0x1,%eax
  804122:	48 85 c0             	test   %rax,%rax
  804125:	75 07                	jne    80412e <pageref+0x64>
  804127:	b8 00 00 00 00       	mov    $0x0,%eax
  80412c:	eb 23                	jmp    804151 <pageref+0x87>
  80412e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804132:	48 c1 e8 0c          	shr    $0xc,%rax
  804136:	48 89 c2             	mov    %rax,%rdx
  804139:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  804140:	00 00 00 
  804143:	48 c1 e2 04          	shl    $0x4,%rdx
  804147:	48 01 d0             	add    %rdx,%rax
  80414a:	0f b7 40 08          	movzwl 0x8(%rax),%eax
  80414e:	0f b7 c0             	movzwl %ax,%eax
  804151:	c9                   	leaveq 
  804152:	c3                   	retq   
