
obj/user/spawnhello:     file format elf64-x86-64


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
  80003c:	e8 a6 00 00 00       	callq  8000e7 <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <umain>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 20          	sub    $0x20,%rsp
  80004b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80004e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800052:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  800059:	00 00 00 
  80005c:	48 8b 00             	mov    (%rax),%rax
  80005f:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  800065:	89 c6                	mov    %eax,%esi
  800067:	48 bf 00 4c 80 00 00 	movabs $0x804c00,%rdi
  80006e:	00 00 00 
  800071:	b8 00 00 00 00       	mov    $0x0,%eax
  800076:	48 ba c6 03 80 00 00 	movabs $0x8003c6,%rdx
  80007d:	00 00 00 
  800080:	ff d2                	callq  *%rdx
  800082:	ba 00 00 00 00       	mov    $0x0,%edx
  800087:	48 be 1e 4c 80 00 00 	movabs $0x804c1e,%rsi
  80008e:	00 00 00 
  800091:	48 bf 24 4c 80 00 00 	movabs $0x804c24,%rdi
  800098:	00 00 00 
  80009b:	b8 00 00 00 00       	mov    $0x0,%eax
  8000a0:	48 b9 06 31 80 00 00 	movabs $0x803106,%rcx
  8000a7:	00 00 00 
  8000aa:	ff d1                	callq  *%rcx
  8000ac:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8000af:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8000b3:	79 30                	jns    8000e5 <umain+0xa2>
  8000b5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8000b8:	89 c1                	mov    %eax,%ecx
  8000ba:	48 ba 2f 4c 80 00 00 	movabs $0x804c2f,%rdx
  8000c1:	00 00 00 
  8000c4:	be 0a 00 00 00       	mov    $0xa,%esi
  8000c9:	48 bf 47 4c 80 00 00 	movabs $0x804c47,%rdi
  8000d0:	00 00 00 
  8000d3:	b8 00 00 00 00       	mov    $0x0,%eax
  8000d8:	49 b8 8d 01 80 00 00 	movabs $0x80018d,%r8
  8000df:	00 00 00 
  8000e2:	41 ff d0             	callq  *%r8
  8000e5:	c9                   	leaveq 
  8000e6:	c3                   	retq   

00000000008000e7 <libmain>:
  8000e7:	55                   	push   %rbp
  8000e8:	48 89 e5             	mov    %rsp,%rbp
  8000eb:	48 83 ec 10          	sub    $0x10,%rsp
  8000ef:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8000f2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8000f6:	48 b8 2e 18 80 00 00 	movabs $0x80182e,%rax
  8000fd:	00 00 00 
  800100:	ff d0                	callq  *%rax
  800102:	25 ff 03 00 00       	and    $0x3ff,%eax
  800107:	48 98                	cltq   
  800109:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  800110:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  800117:	00 00 00 
  80011a:	48 01 c2             	add    %rax,%rdx
  80011d:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  800124:	00 00 00 
  800127:	48 89 10             	mov    %rdx,(%rax)
  80012a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80012e:	7e 14                	jle    800144 <libmain+0x5d>
  800130:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800134:	48 8b 10             	mov    (%rax),%rdx
  800137:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  80013e:	00 00 00 
  800141:	48 89 10             	mov    %rdx,(%rax)
  800144:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800148:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80014b:	48 89 d6             	mov    %rdx,%rsi
  80014e:	89 c7                	mov    %eax,%edi
  800150:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800157:	00 00 00 
  80015a:	ff d0                	callq  *%rax
  80015c:	48 b8 6a 01 80 00 00 	movabs $0x80016a,%rax
  800163:	00 00 00 
  800166:	ff d0                	callq  *%rax
  800168:	c9                   	leaveq 
  800169:	c3                   	retq   

000000000080016a <exit>:
  80016a:	55                   	push   %rbp
  80016b:	48 89 e5             	mov    %rsp,%rbp
  80016e:	48 b8 c9 20 80 00 00 	movabs $0x8020c9,%rax
  800175:	00 00 00 
  800178:	ff d0                	callq  *%rax
  80017a:	bf 00 00 00 00       	mov    $0x0,%edi
  80017f:	48 b8 ea 17 80 00 00 	movabs $0x8017ea,%rax
  800186:	00 00 00 
  800189:	ff d0                	callq  *%rax
  80018b:	5d                   	pop    %rbp
  80018c:	c3                   	retq   

000000000080018d <_panic>:
  80018d:	55                   	push   %rbp
  80018e:	48 89 e5             	mov    %rsp,%rbp
  800191:	53                   	push   %rbx
  800192:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  800199:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  8001a0:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  8001a6:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  8001ad:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  8001b4:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  8001bb:	84 c0                	test   %al,%al
  8001bd:	74 23                	je     8001e2 <_panic+0x55>
  8001bf:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  8001c6:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  8001ca:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  8001ce:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  8001d2:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  8001d6:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  8001da:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  8001de:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  8001e2:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  8001e9:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  8001f0:	00 00 00 
  8001f3:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  8001fa:	00 00 00 
  8001fd:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800201:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  800208:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  80020f:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800216:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  80021d:	00 00 00 
  800220:	48 8b 18             	mov    (%rax),%rbx
  800223:	48 b8 2e 18 80 00 00 	movabs $0x80182e,%rax
  80022a:	00 00 00 
  80022d:	ff d0                	callq  *%rax
  80022f:	8b 8d 14 ff ff ff    	mov    -0xec(%rbp),%ecx
  800235:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  80023c:	41 89 c8             	mov    %ecx,%r8d
  80023f:	48 89 d1             	mov    %rdx,%rcx
  800242:	48 89 da             	mov    %rbx,%rdx
  800245:	89 c6                	mov    %eax,%esi
  800247:	48 bf 68 4c 80 00 00 	movabs $0x804c68,%rdi
  80024e:	00 00 00 
  800251:	b8 00 00 00 00       	mov    $0x0,%eax
  800256:	49 b9 c6 03 80 00 00 	movabs $0x8003c6,%r9
  80025d:	00 00 00 
  800260:	41 ff d1             	callq  *%r9
  800263:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  80026a:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800271:	48 89 d6             	mov    %rdx,%rsi
  800274:	48 89 c7             	mov    %rax,%rdi
  800277:	48 b8 1a 03 80 00 00 	movabs $0x80031a,%rax
  80027e:	00 00 00 
  800281:	ff d0                	callq  *%rax
  800283:	48 bf 8b 4c 80 00 00 	movabs $0x804c8b,%rdi
  80028a:	00 00 00 
  80028d:	b8 00 00 00 00       	mov    $0x0,%eax
  800292:	48 ba c6 03 80 00 00 	movabs $0x8003c6,%rdx
  800299:	00 00 00 
  80029c:	ff d2                	callq  *%rdx
  80029e:	cc                   	int3   
  80029f:	eb fd                	jmp    80029e <_panic+0x111>

00000000008002a1 <putch>:
  8002a1:	55                   	push   %rbp
  8002a2:	48 89 e5             	mov    %rsp,%rbp
  8002a5:	48 83 ec 10          	sub    $0x10,%rsp
  8002a9:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8002ac:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8002b0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8002b4:	8b 00                	mov    (%rax),%eax
  8002b6:	8d 48 01             	lea    0x1(%rax),%ecx
  8002b9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8002bd:	89 0a                	mov    %ecx,(%rdx)
  8002bf:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8002c2:	89 d1                	mov    %edx,%ecx
  8002c4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8002c8:	48 98                	cltq   
  8002ca:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  8002ce:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8002d2:	8b 00                	mov    (%rax),%eax
  8002d4:	3d ff 00 00 00       	cmp    $0xff,%eax
  8002d9:	75 2c                	jne    800307 <putch+0x66>
  8002db:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8002df:	8b 00                	mov    (%rax),%eax
  8002e1:	48 98                	cltq   
  8002e3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8002e7:	48 83 c2 08          	add    $0x8,%rdx
  8002eb:	48 89 c6             	mov    %rax,%rsi
  8002ee:	48 89 d7             	mov    %rdx,%rdi
  8002f1:	48 b8 62 17 80 00 00 	movabs $0x801762,%rax
  8002f8:	00 00 00 
  8002fb:	ff d0                	callq  *%rax
  8002fd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800301:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  800307:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80030b:	8b 40 04             	mov    0x4(%rax),%eax
  80030e:	8d 50 01             	lea    0x1(%rax),%edx
  800311:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800315:	89 50 04             	mov    %edx,0x4(%rax)
  800318:	c9                   	leaveq 
  800319:	c3                   	retq   

000000000080031a <vcprintf>:
  80031a:	55                   	push   %rbp
  80031b:	48 89 e5             	mov    %rsp,%rbp
  80031e:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  800325:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  80032c:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  800333:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  80033a:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  800341:	48 8b 0a             	mov    (%rdx),%rcx
  800344:	48 89 08             	mov    %rcx,(%rax)
  800347:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80034b:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80034f:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800353:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800357:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  80035e:	00 00 00 
  800361:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  800368:	00 00 00 
  80036b:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  800372:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  800379:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800380:	48 89 c6             	mov    %rax,%rsi
  800383:	48 bf a1 02 80 00 00 	movabs $0x8002a1,%rdi
  80038a:	00 00 00 
  80038d:	48 b8 79 07 80 00 00 	movabs $0x800779,%rax
  800394:	00 00 00 
  800397:	ff d0                	callq  *%rax
  800399:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  80039f:	48 98                	cltq   
  8003a1:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  8003a8:	48 83 c2 08          	add    $0x8,%rdx
  8003ac:	48 89 c6             	mov    %rax,%rsi
  8003af:	48 89 d7             	mov    %rdx,%rdi
  8003b2:	48 b8 62 17 80 00 00 	movabs $0x801762,%rax
  8003b9:	00 00 00 
  8003bc:	ff d0                	callq  *%rax
  8003be:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  8003c4:	c9                   	leaveq 
  8003c5:	c3                   	retq   

00000000008003c6 <cprintf>:
  8003c6:	55                   	push   %rbp
  8003c7:	48 89 e5             	mov    %rsp,%rbp
  8003ca:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  8003d1:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  8003d8:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  8003df:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8003e6:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8003ed:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8003f4:	84 c0                	test   %al,%al
  8003f6:	74 20                	je     800418 <cprintf+0x52>
  8003f8:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8003fc:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800400:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800404:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800408:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  80040c:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800410:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800414:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800418:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  80041f:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  800426:	00 00 00 
  800429:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800430:	00 00 00 
  800433:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800437:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  80043e:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800445:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  80044c:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800453:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  80045a:	48 8b 0a             	mov    (%rdx),%rcx
  80045d:	48 89 08             	mov    %rcx,(%rax)
  800460:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800464:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800468:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  80046c:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800470:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  800477:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  80047e:	48 89 d6             	mov    %rdx,%rsi
  800481:	48 89 c7             	mov    %rax,%rdi
  800484:	48 b8 1a 03 80 00 00 	movabs $0x80031a,%rax
  80048b:	00 00 00 
  80048e:	ff d0                	callq  *%rax
  800490:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  800496:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  80049c:	c9                   	leaveq 
  80049d:	c3                   	retq   

000000000080049e <printnum>:
  80049e:	55                   	push   %rbp
  80049f:	48 89 e5             	mov    %rsp,%rbp
  8004a2:	53                   	push   %rbx
  8004a3:	48 83 ec 38          	sub    $0x38,%rsp
  8004a7:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8004ab:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8004af:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8004b3:	89 4d d4             	mov    %ecx,-0x2c(%rbp)
  8004b6:	44 89 45 d0          	mov    %r8d,-0x30(%rbp)
  8004ba:	44 89 4d cc          	mov    %r9d,-0x34(%rbp)
  8004be:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  8004c1:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8004c5:	77 3b                	ja     800502 <printnum+0x64>
  8004c7:	8b 45 d0             	mov    -0x30(%rbp),%eax
  8004ca:	44 8d 40 ff          	lea    -0x1(%rax),%r8d
  8004ce:	8b 5d d4             	mov    -0x2c(%rbp),%ebx
  8004d1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8004d5:	ba 00 00 00 00       	mov    $0x0,%edx
  8004da:	48 f7 f3             	div    %rbx
  8004dd:	48 89 c2             	mov    %rax,%rdx
  8004e0:	8b 7d cc             	mov    -0x34(%rbp),%edi
  8004e3:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  8004e6:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
  8004ea:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8004ee:	41 89 f9             	mov    %edi,%r9d
  8004f1:	48 89 c7             	mov    %rax,%rdi
  8004f4:	48 b8 9e 04 80 00 00 	movabs $0x80049e,%rax
  8004fb:	00 00 00 
  8004fe:	ff d0                	callq  *%rax
  800500:	eb 1e                	jmp    800520 <printnum+0x82>
  800502:	eb 12                	jmp    800516 <printnum+0x78>
  800504:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  800508:	8b 55 cc             	mov    -0x34(%rbp),%edx
  80050b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80050f:	48 89 ce             	mov    %rcx,%rsi
  800512:	89 d7                	mov    %edx,%edi
  800514:	ff d0                	callq  *%rax
  800516:	83 6d d0 01          	subl   $0x1,-0x30(%rbp)
  80051a:	83 7d d0 00          	cmpl   $0x0,-0x30(%rbp)
  80051e:	7f e4                	jg     800504 <printnum+0x66>
  800520:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  800523:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800527:	ba 00 00 00 00       	mov    $0x0,%edx
  80052c:	48 f7 f1             	div    %rcx
  80052f:	48 89 d0             	mov    %rdx,%rax
  800532:	48 ba 90 4e 80 00 00 	movabs $0x804e90,%rdx
  800539:	00 00 00 
  80053c:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
  800540:	0f be d0             	movsbl %al,%edx
  800543:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  800547:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80054b:	48 89 ce             	mov    %rcx,%rsi
  80054e:	89 d7                	mov    %edx,%edi
  800550:	ff d0                	callq  *%rax
  800552:	48 83 c4 38          	add    $0x38,%rsp
  800556:	5b                   	pop    %rbx
  800557:	5d                   	pop    %rbp
  800558:	c3                   	retq   

0000000000800559 <getuint>:
  800559:	55                   	push   %rbp
  80055a:	48 89 e5             	mov    %rsp,%rbp
  80055d:	48 83 ec 1c          	sub    $0x1c,%rsp
  800561:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800565:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800568:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  80056c:	7e 52                	jle    8005c0 <getuint+0x67>
  80056e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800572:	8b 00                	mov    (%rax),%eax
  800574:	83 f8 30             	cmp    $0x30,%eax
  800577:	73 24                	jae    80059d <getuint+0x44>
  800579:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80057d:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800581:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800585:	8b 00                	mov    (%rax),%eax
  800587:	89 c0                	mov    %eax,%eax
  800589:	48 01 d0             	add    %rdx,%rax
  80058c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800590:	8b 12                	mov    (%rdx),%edx
  800592:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800595:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800599:	89 0a                	mov    %ecx,(%rdx)
  80059b:	eb 17                	jmp    8005b4 <getuint+0x5b>
  80059d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005a1:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8005a5:	48 89 d0             	mov    %rdx,%rax
  8005a8:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8005ac:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8005b0:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8005b4:	48 8b 00             	mov    (%rax),%rax
  8005b7:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8005bb:	e9 a3 00 00 00       	jmpq   800663 <getuint+0x10a>
  8005c0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  8005c4:	74 4f                	je     800615 <getuint+0xbc>
  8005c6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005ca:	8b 00                	mov    (%rax),%eax
  8005cc:	83 f8 30             	cmp    $0x30,%eax
  8005cf:	73 24                	jae    8005f5 <getuint+0x9c>
  8005d1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005d5:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8005d9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005dd:	8b 00                	mov    (%rax),%eax
  8005df:	89 c0                	mov    %eax,%eax
  8005e1:	48 01 d0             	add    %rdx,%rax
  8005e4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8005e8:	8b 12                	mov    (%rdx),%edx
  8005ea:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8005ed:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8005f1:	89 0a                	mov    %ecx,(%rdx)
  8005f3:	eb 17                	jmp    80060c <getuint+0xb3>
  8005f5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005f9:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8005fd:	48 89 d0             	mov    %rdx,%rax
  800600:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800604:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800608:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80060c:	48 8b 00             	mov    (%rax),%rax
  80060f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800613:	eb 4e                	jmp    800663 <getuint+0x10a>
  800615:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800619:	8b 00                	mov    (%rax),%eax
  80061b:	83 f8 30             	cmp    $0x30,%eax
  80061e:	73 24                	jae    800644 <getuint+0xeb>
  800620:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800624:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800628:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80062c:	8b 00                	mov    (%rax),%eax
  80062e:	89 c0                	mov    %eax,%eax
  800630:	48 01 d0             	add    %rdx,%rax
  800633:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800637:	8b 12                	mov    (%rdx),%edx
  800639:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80063c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800640:	89 0a                	mov    %ecx,(%rdx)
  800642:	eb 17                	jmp    80065b <getuint+0x102>
  800644:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800648:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80064c:	48 89 d0             	mov    %rdx,%rax
  80064f:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800653:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800657:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80065b:	8b 00                	mov    (%rax),%eax
  80065d:	89 c0                	mov    %eax,%eax
  80065f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800663:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800667:	c9                   	leaveq 
  800668:	c3                   	retq   

0000000000800669 <getint>:
  800669:	55                   	push   %rbp
  80066a:	48 89 e5             	mov    %rsp,%rbp
  80066d:	48 83 ec 1c          	sub    $0x1c,%rsp
  800671:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800675:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800678:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  80067c:	7e 52                	jle    8006d0 <getint+0x67>
  80067e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800682:	8b 00                	mov    (%rax),%eax
  800684:	83 f8 30             	cmp    $0x30,%eax
  800687:	73 24                	jae    8006ad <getint+0x44>
  800689:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80068d:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800691:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800695:	8b 00                	mov    (%rax),%eax
  800697:	89 c0                	mov    %eax,%eax
  800699:	48 01 d0             	add    %rdx,%rax
  80069c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006a0:	8b 12                	mov    (%rdx),%edx
  8006a2:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8006a5:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006a9:	89 0a                	mov    %ecx,(%rdx)
  8006ab:	eb 17                	jmp    8006c4 <getint+0x5b>
  8006ad:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006b1:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8006b5:	48 89 d0             	mov    %rdx,%rax
  8006b8:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8006bc:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006c0:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8006c4:	48 8b 00             	mov    (%rax),%rax
  8006c7:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8006cb:	e9 a3 00 00 00       	jmpq   800773 <getint+0x10a>
  8006d0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  8006d4:	74 4f                	je     800725 <getint+0xbc>
  8006d6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006da:	8b 00                	mov    (%rax),%eax
  8006dc:	83 f8 30             	cmp    $0x30,%eax
  8006df:	73 24                	jae    800705 <getint+0x9c>
  8006e1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006e5:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8006e9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006ed:	8b 00                	mov    (%rax),%eax
  8006ef:	89 c0                	mov    %eax,%eax
  8006f1:	48 01 d0             	add    %rdx,%rax
  8006f4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006f8:	8b 12                	mov    (%rdx),%edx
  8006fa:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8006fd:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800701:	89 0a                	mov    %ecx,(%rdx)
  800703:	eb 17                	jmp    80071c <getint+0xb3>
  800705:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800709:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80070d:	48 89 d0             	mov    %rdx,%rax
  800710:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800714:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800718:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80071c:	48 8b 00             	mov    (%rax),%rax
  80071f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800723:	eb 4e                	jmp    800773 <getint+0x10a>
  800725:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800729:	8b 00                	mov    (%rax),%eax
  80072b:	83 f8 30             	cmp    $0x30,%eax
  80072e:	73 24                	jae    800754 <getint+0xeb>
  800730:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800734:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800738:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80073c:	8b 00                	mov    (%rax),%eax
  80073e:	89 c0                	mov    %eax,%eax
  800740:	48 01 d0             	add    %rdx,%rax
  800743:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800747:	8b 12                	mov    (%rdx),%edx
  800749:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80074c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800750:	89 0a                	mov    %ecx,(%rdx)
  800752:	eb 17                	jmp    80076b <getint+0x102>
  800754:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800758:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80075c:	48 89 d0             	mov    %rdx,%rax
  80075f:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800763:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800767:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80076b:	8b 00                	mov    (%rax),%eax
  80076d:	48 98                	cltq   
  80076f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800773:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800777:	c9                   	leaveq 
  800778:	c3                   	retq   

0000000000800779 <vprintfmt>:
  800779:	55                   	push   %rbp
  80077a:	48 89 e5             	mov    %rsp,%rbp
  80077d:	41 54                	push   %r12
  80077f:	53                   	push   %rbx
  800780:	48 83 ec 60          	sub    $0x60,%rsp
  800784:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  800788:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  80078c:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800790:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  800794:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800798:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  80079c:	48 8b 0a             	mov    (%rdx),%rcx
  80079f:	48 89 08             	mov    %rcx,(%rax)
  8007a2:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8007a6:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8007aa:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8007ae:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8007b2:	eb 17                	jmp    8007cb <vprintfmt+0x52>
  8007b4:	85 db                	test   %ebx,%ebx
  8007b6:	0f 84 cc 04 00 00    	je     800c88 <vprintfmt+0x50f>
  8007bc:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8007c0:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8007c4:	48 89 d6             	mov    %rdx,%rsi
  8007c7:	89 df                	mov    %ebx,%edi
  8007c9:	ff d0                	callq  *%rax
  8007cb:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8007cf:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8007d3:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8007d7:	0f b6 00             	movzbl (%rax),%eax
  8007da:	0f b6 d8             	movzbl %al,%ebx
  8007dd:	83 fb 25             	cmp    $0x25,%ebx
  8007e0:	75 d2                	jne    8007b4 <vprintfmt+0x3b>
  8007e2:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  8007e6:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  8007ed:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  8007f4:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  8007fb:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  800802:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800806:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80080a:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  80080e:	0f b6 00             	movzbl (%rax),%eax
  800811:	0f b6 d8             	movzbl %al,%ebx
  800814:	8d 43 dd             	lea    -0x23(%rbx),%eax
  800817:	83 f8 55             	cmp    $0x55,%eax
  80081a:	0f 87 34 04 00 00    	ja     800c54 <vprintfmt+0x4db>
  800820:	89 c0                	mov    %eax,%eax
  800822:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800829:	00 
  80082a:	48 b8 b8 4e 80 00 00 	movabs $0x804eb8,%rax
  800831:	00 00 00 
  800834:	48 01 d0             	add    %rdx,%rax
  800837:	48 8b 00             	mov    (%rax),%rax
  80083a:	ff e0                	jmpq   *%rax
  80083c:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  800840:	eb c0                	jmp    800802 <vprintfmt+0x89>
  800842:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  800846:	eb ba                	jmp    800802 <vprintfmt+0x89>
  800848:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  80084f:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800852:	89 d0                	mov    %edx,%eax
  800854:	c1 e0 02             	shl    $0x2,%eax
  800857:	01 d0                	add    %edx,%eax
  800859:	01 c0                	add    %eax,%eax
  80085b:	01 d8                	add    %ebx,%eax
  80085d:	83 e8 30             	sub    $0x30,%eax
  800860:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800863:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800867:	0f b6 00             	movzbl (%rax),%eax
  80086a:	0f be d8             	movsbl %al,%ebx
  80086d:	83 fb 2f             	cmp    $0x2f,%ebx
  800870:	7e 0c                	jle    80087e <vprintfmt+0x105>
  800872:	83 fb 39             	cmp    $0x39,%ebx
  800875:	7f 07                	jg     80087e <vprintfmt+0x105>
  800877:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  80087c:	eb d1                	jmp    80084f <vprintfmt+0xd6>
  80087e:	eb 58                	jmp    8008d8 <vprintfmt+0x15f>
  800880:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800883:	83 f8 30             	cmp    $0x30,%eax
  800886:	73 17                	jae    80089f <vprintfmt+0x126>
  800888:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80088c:	8b 45 b8             	mov    -0x48(%rbp),%eax
  80088f:	89 c0                	mov    %eax,%eax
  800891:	48 01 d0             	add    %rdx,%rax
  800894:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800897:	83 c2 08             	add    $0x8,%edx
  80089a:	89 55 b8             	mov    %edx,-0x48(%rbp)
  80089d:	eb 0f                	jmp    8008ae <vprintfmt+0x135>
  80089f:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  8008a3:	48 89 d0             	mov    %rdx,%rax
  8008a6:	48 83 c2 08          	add    $0x8,%rdx
  8008aa:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8008ae:	8b 00                	mov    (%rax),%eax
  8008b0:	89 45 d8             	mov    %eax,-0x28(%rbp)
  8008b3:	eb 23                	jmp    8008d8 <vprintfmt+0x15f>
  8008b5:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8008b9:	79 0c                	jns    8008c7 <vprintfmt+0x14e>
  8008bb:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  8008c2:	e9 3b ff ff ff       	jmpq   800802 <vprintfmt+0x89>
  8008c7:	e9 36 ff ff ff       	jmpq   800802 <vprintfmt+0x89>
  8008cc:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  8008d3:	e9 2a ff ff ff       	jmpq   800802 <vprintfmt+0x89>
  8008d8:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8008dc:	79 12                	jns    8008f0 <vprintfmt+0x177>
  8008de:	8b 45 d8             	mov    -0x28(%rbp),%eax
  8008e1:	89 45 dc             	mov    %eax,-0x24(%rbp)
  8008e4:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  8008eb:	e9 12 ff ff ff       	jmpq   800802 <vprintfmt+0x89>
  8008f0:	e9 0d ff ff ff       	jmpq   800802 <vprintfmt+0x89>
  8008f5:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  8008f9:	e9 04 ff ff ff       	jmpq   800802 <vprintfmt+0x89>
  8008fe:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800901:	83 f8 30             	cmp    $0x30,%eax
  800904:	73 17                	jae    80091d <vprintfmt+0x1a4>
  800906:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80090a:	8b 45 b8             	mov    -0x48(%rbp),%eax
  80090d:	89 c0                	mov    %eax,%eax
  80090f:	48 01 d0             	add    %rdx,%rax
  800912:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800915:	83 c2 08             	add    $0x8,%edx
  800918:	89 55 b8             	mov    %edx,-0x48(%rbp)
  80091b:	eb 0f                	jmp    80092c <vprintfmt+0x1b3>
  80091d:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800921:	48 89 d0             	mov    %rdx,%rax
  800924:	48 83 c2 08          	add    $0x8,%rdx
  800928:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  80092c:	8b 10                	mov    (%rax),%edx
  80092e:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800932:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800936:	48 89 ce             	mov    %rcx,%rsi
  800939:	89 d7                	mov    %edx,%edi
  80093b:	ff d0                	callq  *%rax
  80093d:	e9 40 03 00 00       	jmpq   800c82 <vprintfmt+0x509>
  800942:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800945:	83 f8 30             	cmp    $0x30,%eax
  800948:	73 17                	jae    800961 <vprintfmt+0x1e8>
  80094a:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80094e:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800951:	89 c0                	mov    %eax,%eax
  800953:	48 01 d0             	add    %rdx,%rax
  800956:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800959:	83 c2 08             	add    $0x8,%edx
  80095c:	89 55 b8             	mov    %edx,-0x48(%rbp)
  80095f:	eb 0f                	jmp    800970 <vprintfmt+0x1f7>
  800961:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800965:	48 89 d0             	mov    %rdx,%rax
  800968:	48 83 c2 08          	add    $0x8,%rdx
  80096c:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800970:	8b 18                	mov    (%rax),%ebx
  800972:	85 db                	test   %ebx,%ebx
  800974:	79 02                	jns    800978 <vprintfmt+0x1ff>
  800976:	f7 db                	neg    %ebx
  800978:	83 fb 15             	cmp    $0x15,%ebx
  80097b:	7f 16                	jg     800993 <vprintfmt+0x21a>
  80097d:	48 b8 e0 4d 80 00 00 	movabs $0x804de0,%rax
  800984:	00 00 00 
  800987:	48 63 d3             	movslq %ebx,%rdx
  80098a:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  80098e:	4d 85 e4             	test   %r12,%r12
  800991:	75 2e                	jne    8009c1 <vprintfmt+0x248>
  800993:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800997:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80099b:	89 d9                	mov    %ebx,%ecx
  80099d:	48 ba a1 4e 80 00 00 	movabs $0x804ea1,%rdx
  8009a4:	00 00 00 
  8009a7:	48 89 c7             	mov    %rax,%rdi
  8009aa:	b8 00 00 00 00       	mov    $0x0,%eax
  8009af:	49 b8 91 0c 80 00 00 	movabs $0x800c91,%r8
  8009b6:	00 00 00 
  8009b9:	41 ff d0             	callq  *%r8
  8009bc:	e9 c1 02 00 00       	jmpq   800c82 <vprintfmt+0x509>
  8009c1:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  8009c5:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8009c9:	4c 89 e1             	mov    %r12,%rcx
  8009cc:	48 ba aa 4e 80 00 00 	movabs $0x804eaa,%rdx
  8009d3:	00 00 00 
  8009d6:	48 89 c7             	mov    %rax,%rdi
  8009d9:	b8 00 00 00 00       	mov    $0x0,%eax
  8009de:	49 b8 91 0c 80 00 00 	movabs $0x800c91,%r8
  8009e5:	00 00 00 
  8009e8:	41 ff d0             	callq  *%r8
  8009eb:	e9 92 02 00 00       	jmpq   800c82 <vprintfmt+0x509>
  8009f0:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8009f3:	83 f8 30             	cmp    $0x30,%eax
  8009f6:	73 17                	jae    800a0f <vprintfmt+0x296>
  8009f8:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8009fc:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8009ff:	89 c0                	mov    %eax,%eax
  800a01:	48 01 d0             	add    %rdx,%rax
  800a04:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800a07:	83 c2 08             	add    $0x8,%edx
  800a0a:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800a0d:	eb 0f                	jmp    800a1e <vprintfmt+0x2a5>
  800a0f:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800a13:	48 89 d0             	mov    %rdx,%rax
  800a16:	48 83 c2 08          	add    $0x8,%rdx
  800a1a:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800a1e:	4c 8b 20             	mov    (%rax),%r12
  800a21:	4d 85 e4             	test   %r12,%r12
  800a24:	75 0a                	jne    800a30 <vprintfmt+0x2b7>
  800a26:	49 bc ad 4e 80 00 00 	movabs $0x804ead,%r12
  800a2d:	00 00 00 
  800a30:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800a34:	7e 3f                	jle    800a75 <vprintfmt+0x2fc>
  800a36:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  800a3a:	74 39                	je     800a75 <vprintfmt+0x2fc>
  800a3c:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800a3f:	48 98                	cltq   
  800a41:	48 89 c6             	mov    %rax,%rsi
  800a44:	4c 89 e7             	mov    %r12,%rdi
  800a47:	48 b8 3d 0f 80 00 00 	movabs $0x800f3d,%rax
  800a4e:	00 00 00 
  800a51:	ff d0                	callq  *%rax
  800a53:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800a56:	eb 17                	jmp    800a6f <vprintfmt+0x2f6>
  800a58:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800a5c:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800a60:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a64:	48 89 ce             	mov    %rcx,%rsi
  800a67:	89 d7                	mov    %edx,%edi
  800a69:	ff d0                	callq  *%rax
  800a6b:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800a6f:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800a73:	7f e3                	jg     800a58 <vprintfmt+0x2df>
  800a75:	eb 37                	jmp    800aae <vprintfmt+0x335>
  800a77:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  800a7b:	74 1e                	je     800a9b <vprintfmt+0x322>
  800a7d:	83 fb 1f             	cmp    $0x1f,%ebx
  800a80:	7e 05                	jle    800a87 <vprintfmt+0x30e>
  800a82:	83 fb 7e             	cmp    $0x7e,%ebx
  800a85:	7e 14                	jle    800a9b <vprintfmt+0x322>
  800a87:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800a8b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a8f:	48 89 d6             	mov    %rdx,%rsi
  800a92:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800a97:	ff d0                	callq  *%rax
  800a99:	eb 0f                	jmp    800aaa <vprintfmt+0x331>
  800a9b:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800a9f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800aa3:	48 89 d6             	mov    %rdx,%rsi
  800aa6:	89 df                	mov    %ebx,%edi
  800aa8:	ff d0                	callq  *%rax
  800aaa:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800aae:	4c 89 e0             	mov    %r12,%rax
  800ab1:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800ab5:	0f b6 00             	movzbl (%rax),%eax
  800ab8:	0f be d8             	movsbl %al,%ebx
  800abb:	85 db                	test   %ebx,%ebx
  800abd:	74 10                	je     800acf <vprintfmt+0x356>
  800abf:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800ac3:	78 b2                	js     800a77 <vprintfmt+0x2fe>
  800ac5:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800ac9:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800acd:	79 a8                	jns    800a77 <vprintfmt+0x2fe>
  800acf:	eb 16                	jmp    800ae7 <vprintfmt+0x36e>
  800ad1:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800ad5:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ad9:	48 89 d6             	mov    %rdx,%rsi
  800adc:	bf 20 00 00 00       	mov    $0x20,%edi
  800ae1:	ff d0                	callq  *%rax
  800ae3:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800ae7:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800aeb:	7f e4                	jg     800ad1 <vprintfmt+0x358>
  800aed:	e9 90 01 00 00       	jmpq   800c82 <vprintfmt+0x509>
  800af2:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800af6:	be 03 00 00 00       	mov    $0x3,%esi
  800afb:	48 89 c7             	mov    %rax,%rdi
  800afe:	48 b8 69 06 80 00 00 	movabs $0x800669,%rax
  800b05:	00 00 00 
  800b08:	ff d0                	callq  *%rax
  800b0a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800b0e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b12:	48 85 c0             	test   %rax,%rax
  800b15:	79 1d                	jns    800b34 <vprintfmt+0x3bb>
  800b17:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800b1b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b1f:	48 89 d6             	mov    %rdx,%rsi
  800b22:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800b27:	ff d0                	callq  *%rax
  800b29:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b2d:	48 f7 d8             	neg    %rax
  800b30:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800b34:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800b3b:	e9 d5 00 00 00       	jmpq   800c15 <vprintfmt+0x49c>
  800b40:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800b44:	be 03 00 00 00       	mov    $0x3,%esi
  800b49:	48 89 c7             	mov    %rax,%rdi
  800b4c:	48 b8 59 05 80 00 00 	movabs $0x800559,%rax
  800b53:	00 00 00 
  800b56:	ff d0                	callq  *%rax
  800b58:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800b5c:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800b63:	e9 ad 00 00 00       	jmpq   800c15 <vprintfmt+0x49c>
  800b68:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800b6c:	be 03 00 00 00       	mov    $0x3,%esi
  800b71:	48 89 c7             	mov    %rax,%rdi
  800b74:	48 b8 59 05 80 00 00 	movabs $0x800559,%rax
  800b7b:	00 00 00 
  800b7e:	ff d0                	callq  *%rax
  800b80:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800b84:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800b8b:	e9 85 00 00 00       	jmpq   800c15 <vprintfmt+0x49c>
  800b90:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800b94:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b98:	48 89 d6             	mov    %rdx,%rsi
  800b9b:	bf 30 00 00 00       	mov    $0x30,%edi
  800ba0:	ff d0                	callq  *%rax
  800ba2:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800ba6:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800baa:	48 89 d6             	mov    %rdx,%rsi
  800bad:	bf 78 00 00 00       	mov    $0x78,%edi
  800bb2:	ff d0                	callq  *%rax
  800bb4:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800bb7:	83 f8 30             	cmp    $0x30,%eax
  800bba:	73 17                	jae    800bd3 <vprintfmt+0x45a>
  800bbc:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800bc0:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800bc3:	89 c0                	mov    %eax,%eax
  800bc5:	48 01 d0             	add    %rdx,%rax
  800bc8:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800bcb:	83 c2 08             	add    $0x8,%edx
  800bce:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800bd1:	eb 0f                	jmp    800be2 <vprintfmt+0x469>
  800bd3:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800bd7:	48 89 d0             	mov    %rdx,%rax
  800bda:	48 83 c2 08          	add    $0x8,%rdx
  800bde:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800be2:	48 8b 00             	mov    (%rax),%rax
  800be5:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800be9:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800bf0:	eb 23                	jmp    800c15 <vprintfmt+0x49c>
  800bf2:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800bf6:	be 03 00 00 00       	mov    $0x3,%esi
  800bfb:	48 89 c7             	mov    %rax,%rdi
  800bfe:	48 b8 59 05 80 00 00 	movabs $0x800559,%rax
  800c05:	00 00 00 
  800c08:	ff d0                	callq  *%rax
  800c0a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800c0e:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800c15:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  800c1a:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800c1d:	8b 7d dc             	mov    -0x24(%rbp),%edi
  800c20:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800c24:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800c28:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c2c:	45 89 c1             	mov    %r8d,%r9d
  800c2f:	41 89 f8             	mov    %edi,%r8d
  800c32:	48 89 c7             	mov    %rax,%rdi
  800c35:	48 b8 9e 04 80 00 00 	movabs $0x80049e,%rax
  800c3c:	00 00 00 
  800c3f:	ff d0                	callq  *%rax
  800c41:	eb 3f                	jmp    800c82 <vprintfmt+0x509>
  800c43:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c47:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c4b:	48 89 d6             	mov    %rdx,%rsi
  800c4e:	89 df                	mov    %ebx,%edi
  800c50:	ff d0                	callq  *%rax
  800c52:	eb 2e                	jmp    800c82 <vprintfmt+0x509>
  800c54:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c58:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c5c:	48 89 d6             	mov    %rdx,%rsi
  800c5f:	bf 25 00 00 00       	mov    $0x25,%edi
  800c64:	ff d0                	callq  *%rax
  800c66:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800c6b:	eb 05                	jmp    800c72 <vprintfmt+0x4f9>
  800c6d:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800c72:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800c76:	48 83 e8 01          	sub    $0x1,%rax
  800c7a:	0f b6 00             	movzbl (%rax),%eax
  800c7d:	3c 25                	cmp    $0x25,%al
  800c7f:	75 ec                	jne    800c6d <vprintfmt+0x4f4>
  800c81:	90                   	nop
  800c82:	90                   	nop
  800c83:	e9 43 fb ff ff       	jmpq   8007cb <vprintfmt+0x52>
  800c88:	48 83 c4 60          	add    $0x60,%rsp
  800c8c:	5b                   	pop    %rbx
  800c8d:	41 5c                	pop    %r12
  800c8f:	5d                   	pop    %rbp
  800c90:	c3                   	retq   

0000000000800c91 <printfmt>:
  800c91:	55                   	push   %rbp
  800c92:	48 89 e5             	mov    %rsp,%rbp
  800c95:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  800c9c:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  800ca3:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  800caa:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800cb1:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800cb8:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800cbf:	84 c0                	test   %al,%al
  800cc1:	74 20                	je     800ce3 <printfmt+0x52>
  800cc3:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800cc7:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800ccb:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800ccf:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800cd3:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800cd7:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800cdb:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800cdf:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800ce3:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  800cea:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  800cf1:	00 00 00 
  800cf4:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  800cfb:	00 00 00 
  800cfe:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800d02:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800d09:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800d10:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  800d17:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  800d1e:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800d25:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  800d2c:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  800d33:	48 89 c7             	mov    %rax,%rdi
  800d36:	48 b8 79 07 80 00 00 	movabs $0x800779,%rax
  800d3d:	00 00 00 
  800d40:	ff d0                	callq  *%rax
  800d42:	c9                   	leaveq 
  800d43:	c3                   	retq   

0000000000800d44 <sprintputch>:
  800d44:	55                   	push   %rbp
  800d45:	48 89 e5             	mov    %rsp,%rbp
  800d48:	48 83 ec 10          	sub    $0x10,%rsp
  800d4c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800d4f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800d53:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800d57:	8b 40 10             	mov    0x10(%rax),%eax
  800d5a:	8d 50 01             	lea    0x1(%rax),%edx
  800d5d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800d61:	89 50 10             	mov    %edx,0x10(%rax)
  800d64:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800d68:	48 8b 10             	mov    (%rax),%rdx
  800d6b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800d6f:	48 8b 40 08          	mov    0x8(%rax),%rax
  800d73:	48 39 c2             	cmp    %rax,%rdx
  800d76:	73 17                	jae    800d8f <sprintputch+0x4b>
  800d78:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800d7c:	48 8b 00             	mov    (%rax),%rax
  800d7f:	48 8d 48 01          	lea    0x1(%rax),%rcx
  800d83:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800d87:	48 89 0a             	mov    %rcx,(%rdx)
  800d8a:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800d8d:	88 10                	mov    %dl,(%rax)
  800d8f:	c9                   	leaveq 
  800d90:	c3                   	retq   

0000000000800d91 <vsnprintf>:
  800d91:	55                   	push   %rbp
  800d92:	48 89 e5             	mov    %rsp,%rbp
  800d95:	48 83 ec 50          	sub    $0x50,%rsp
  800d99:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  800d9d:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  800da0:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  800da4:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  800da8:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  800dac:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  800db0:	48 8b 0a             	mov    (%rdx),%rcx
  800db3:	48 89 08             	mov    %rcx,(%rax)
  800db6:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800dba:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800dbe:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800dc2:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800dc6:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800dca:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  800dce:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  800dd1:	48 98                	cltq   
  800dd3:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  800dd7:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800ddb:	48 01 d0             	add    %rdx,%rax
  800dde:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  800de2:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800de9:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  800dee:	74 06                	je     800df6 <vsnprintf+0x65>
  800df0:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  800df4:	7f 07                	jg     800dfd <vsnprintf+0x6c>
  800df6:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800dfb:	eb 2f                	jmp    800e2c <vsnprintf+0x9b>
  800dfd:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  800e01:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  800e05:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  800e09:	48 89 c6             	mov    %rax,%rsi
  800e0c:	48 bf 44 0d 80 00 00 	movabs $0x800d44,%rdi
  800e13:	00 00 00 
  800e16:	48 b8 79 07 80 00 00 	movabs $0x800779,%rax
  800e1d:	00 00 00 
  800e20:	ff d0                	callq  *%rax
  800e22:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800e26:	c6 00 00             	movb   $0x0,(%rax)
  800e29:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800e2c:	c9                   	leaveq 
  800e2d:	c3                   	retq   

0000000000800e2e <snprintf>:
  800e2e:	55                   	push   %rbp
  800e2f:	48 89 e5             	mov    %rsp,%rbp
  800e32:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  800e39:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800e40:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  800e46:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800e4d:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800e54:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800e5b:	84 c0                	test   %al,%al
  800e5d:	74 20                	je     800e7f <snprintf+0x51>
  800e5f:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800e63:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800e67:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800e6b:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800e6f:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800e73:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800e77:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800e7b:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800e7f:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  800e86:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  800e8d:	00 00 00 
  800e90:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800e97:	00 00 00 
  800e9a:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800e9e:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800ea5:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800eac:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800eb3:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800eba:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800ec1:	48 8b 0a             	mov    (%rdx),%rcx
  800ec4:	48 89 08             	mov    %rcx,(%rax)
  800ec7:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800ecb:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800ecf:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800ed3:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800ed7:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  800ede:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  800ee5:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  800eeb:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800ef2:	48 89 c7             	mov    %rax,%rdi
  800ef5:	48 b8 91 0d 80 00 00 	movabs $0x800d91,%rax
  800efc:	00 00 00 
  800eff:	ff d0                	callq  *%rax
  800f01:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  800f07:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  800f0d:	c9                   	leaveq 
  800f0e:	c3                   	retq   

0000000000800f0f <strlen>:
  800f0f:	55                   	push   %rbp
  800f10:	48 89 e5             	mov    %rsp,%rbp
  800f13:	48 83 ec 18          	sub    $0x18,%rsp
  800f17:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800f1b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800f22:	eb 09                	jmp    800f2d <strlen+0x1e>
  800f24:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800f28:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  800f2d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f31:	0f b6 00             	movzbl (%rax),%eax
  800f34:	84 c0                	test   %al,%al
  800f36:	75 ec                	jne    800f24 <strlen+0x15>
  800f38:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800f3b:	c9                   	leaveq 
  800f3c:	c3                   	retq   

0000000000800f3d <strnlen>:
  800f3d:	55                   	push   %rbp
  800f3e:	48 89 e5             	mov    %rsp,%rbp
  800f41:	48 83 ec 20          	sub    $0x20,%rsp
  800f45:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800f49:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800f4d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800f54:	eb 0e                	jmp    800f64 <strnlen+0x27>
  800f56:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800f5a:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  800f5f:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  800f64:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  800f69:	74 0b                	je     800f76 <strnlen+0x39>
  800f6b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f6f:	0f b6 00             	movzbl (%rax),%eax
  800f72:	84 c0                	test   %al,%al
  800f74:	75 e0                	jne    800f56 <strnlen+0x19>
  800f76:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800f79:	c9                   	leaveq 
  800f7a:	c3                   	retq   

0000000000800f7b <strcpy>:
  800f7b:	55                   	push   %rbp
  800f7c:	48 89 e5             	mov    %rsp,%rbp
  800f7f:	48 83 ec 20          	sub    $0x20,%rsp
  800f83:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800f87:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800f8b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f8f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800f93:	90                   	nop
  800f94:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f98:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800f9c:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  800fa0:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  800fa4:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  800fa8:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  800fac:	0f b6 12             	movzbl (%rdx),%edx
  800faf:	88 10                	mov    %dl,(%rax)
  800fb1:	0f b6 00             	movzbl (%rax),%eax
  800fb4:	84 c0                	test   %al,%al
  800fb6:	75 dc                	jne    800f94 <strcpy+0x19>
  800fb8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800fbc:	c9                   	leaveq 
  800fbd:	c3                   	retq   

0000000000800fbe <strcat>:
  800fbe:	55                   	push   %rbp
  800fbf:	48 89 e5             	mov    %rsp,%rbp
  800fc2:	48 83 ec 20          	sub    $0x20,%rsp
  800fc6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800fca:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800fce:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800fd2:	48 89 c7             	mov    %rax,%rdi
  800fd5:	48 b8 0f 0f 80 00 00 	movabs $0x800f0f,%rax
  800fdc:	00 00 00 
  800fdf:	ff d0                	callq  *%rax
  800fe1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800fe4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800fe7:	48 63 d0             	movslq %eax,%rdx
  800fea:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800fee:	48 01 c2             	add    %rax,%rdx
  800ff1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800ff5:	48 89 c6             	mov    %rax,%rsi
  800ff8:	48 89 d7             	mov    %rdx,%rdi
  800ffb:	48 b8 7b 0f 80 00 00 	movabs $0x800f7b,%rax
  801002:	00 00 00 
  801005:	ff d0                	callq  *%rax
  801007:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80100b:	c9                   	leaveq 
  80100c:	c3                   	retq   

000000000080100d <strncpy>:
  80100d:	55                   	push   %rbp
  80100e:	48 89 e5             	mov    %rsp,%rbp
  801011:	48 83 ec 28          	sub    $0x28,%rsp
  801015:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801019:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80101d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801021:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801025:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801029:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  801030:	00 
  801031:	eb 2a                	jmp    80105d <strncpy+0x50>
  801033:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801037:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80103b:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80103f:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801043:	0f b6 12             	movzbl (%rdx),%edx
  801046:	88 10                	mov    %dl,(%rax)
  801048:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80104c:	0f b6 00             	movzbl (%rax),%eax
  80104f:	84 c0                	test   %al,%al
  801051:	74 05                	je     801058 <strncpy+0x4b>
  801053:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  801058:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80105d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801061:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  801065:	72 cc                	jb     801033 <strncpy+0x26>
  801067:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80106b:	c9                   	leaveq 
  80106c:	c3                   	retq   

000000000080106d <strlcpy>:
  80106d:	55                   	push   %rbp
  80106e:	48 89 e5             	mov    %rsp,%rbp
  801071:	48 83 ec 28          	sub    $0x28,%rsp
  801075:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801079:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80107d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801081:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801085:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801089:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80108e:	74 3d                	je     8010cd <strlcpy+0x60>
  801090:	eb 1d                	jmp    8010af <strlcpy+0x42>
  801092:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801096:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80109a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80109e:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8010a2:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8010a6:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8010aa:	0f b6 12             	movzbl (%rdx),%edx
  8010ad:	88 10                	mov    %dl,(%rax)
  8010af:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  8010b4:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8010b9:	74 0b                	je     8010c6 <strlcpy+0x59>
  8010bb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8010bf:	0f b6 00             	movzbl (%rax),%eax
  8010c2:	84 c0                	test   %al,%al
  8010c4:	75 cc                	jne    801092 <strlcpy+0x25>
  8010c6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010ca:	c6 00 00             	movb   $0x0,(%rax)
  8010cd:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8010d1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010d5:	48 29 c2             	sub    %rax,%rdx
  8010d8:	48 89 d0             	mov    %rdx,%rax
  8010db:	c9                   	leaveq 
  8010dc:	c3                   	retq   

00000000008010dd <strcmp>:
  8010dd:	55                   	push   %rbp
  8010de:	48 89 e5             	mov    %rsp,%rbp
  8010e1:	48 83 ec 10          	sub    $0x10,%rsp
  8010e5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8010e9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8010ed:	eb 0a                	jmp    8010f9 <strcmp+0x1c>
  8010ef:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8010f4:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8010f9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010fd:	0f b6 00             	movzbl (%rax),%eax
  801100:	84 c0                	test   %al,%al
  801102:	74 12                	je     801116 <strcmp+0x39>
  801104:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801108:	0f b6 10             	movzbl (%rax),%edx
  80110b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80110f:	0f b6 00             	movzbl (%rax),%eax
  801112:	38 c2                	cmp    %al,%dl
  801114:	74 d9                	je     8010ef <strcmp+0x12>
  801116:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80111a:	0f b6 00             	movzbl (%rax),%eax
  80111d:	0f b6 d0             	movzbl %al,%edx
  801120:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801124:	0f b6 00             	movzbl (%rax),%eax
  801127:	0f b6 c0             	movzbl %al,%eax
  80112a:	29 c2                	sub    %eax,%edx
  80112c:	89 d0                	mov    %edx,%eax
  80112e:	c9                   	leaveq 
  80112f:	c3                   	retq   

0000000000801130 <strncmp>:
  801130:	55                   	push   %rbp
  801131:	48 89 e5             	mov    %rsp,%rbp
  801134:	48 83 ec 18          	sub    $0x18,%rsp
  801138:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80113c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801140:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801144:	eb 0f                	jmp    801155 <strncmp+0x25>
  801146:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  80114b:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801150:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801155:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80115a:	74 1d                	je     801179 <strncmp+0x49>
  80115c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801160:	0f b6 00             	movzbl (%rax),%eax
  801163:	84 c0                	test   %al,%al
  801165:	74 12                	je     801179 <strncmp+0x49>
  801167:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80116b:	0f b6 10             	movzbl (%rax),%edx
  80116e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801172:	0f b6 00             	movzbl (%rax),%eax
  801175:	38 c2                	cmp    %al,%dl
  801177:	74 cd                	je     801146 <strncmp+0x16>
  801179:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80117e:	75 07                	jne    801187 <strncmp+0x57>
  801180:	b8 00 00 00 00       	mov    $0x0,%eax
  801185:	eb 18                	jmp    80119f <strncmp+0x6f>
  801187:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80118b:	0f b6 00             	movzbl (%rax),%eax
  80118e:	0f b6 d0             	movzbl %al,%edx
  801191:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801195:	0f b6 00             	movzbl (%rax),%eax
  801198:	0f b6 c0             	movzbl %al,%eax
  80119b:	29 c2                	sub    %eax,%edx
  80119d:	89 d0                	mov    %edx,%eax
  80119f:	c9                   	leaveq 
  8011a0:	c3                   	retq   

00000000008011a1 <strchr>:
  8011a1:	55                   	push   %rbp
  8011a2:	48 89 e5             	mov    %rsp,%rbp
  8011a5:	48 83 ec 0c          	sub    $0xc,%rsp
  8011a9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8011ad:	89 f0                	mov    %esi,%eax
  8011af:	88 45 f4             	mov    %al,-0xc(%rbp)
  8011b2:	eb 17                	jmp    8011cb <strchr+0x2a>
  8011b4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011b8:	0f b6 00             	movzbl (%rax),%eax
  8011bb:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8011be:	75 06                	jne    8011c6 <strchr+0x25>
  8011c0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011c4:	eb 15                	jmp    8011db <strchr+0x3a>
  8011c6:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8011cb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011cf:	0f b6 00             	movzbl (%rax),%eax
  8011d2:	84 c0                	test   %al,%al
  8011d4:	75 de                	jne    8011b4 <strchr+0x13>
  8011d6:	b8 00 00 00 00       	mov    $0x0,%eax
  8011db:	c9                   	leaveq 
  8011dc:	c3                   	retq   

00000000008011dd <strfind>:
  8011dd:	55                   	push   %rbp
  8011de:	48 89 e5             	mov    %rsp,%rbp
  8011e1:	48 83 ec 0c          	sub    $0xc,%rsp
  8011e5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8011e9:	89 f0                	mov    %esi,%eax
  8011eb:	88 45 f4             	mov    %al,-0xc(%rbp)
  8011ee:	eb 13                	jmp    801203 <strfind+0x26>
  8011f0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011f4:	0f b6 00             	movzbl (%rax),%eax
  8011f7:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8011fa:	75 02                	jne    8011fe <strfind+0x21>
  8011fc:	eb 10                	jmp    80120e <strfind+0x31>
  8011fe:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801203:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801207:	0f b6 00             	movzbl (%rax),%eax
  80120a:	84 c0                	test   %al,%al
  80120c:	75 e2                	jne    8011f0 <strfind+0x13>
  80120e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801212:	c9                   	leaveq 
  801213:	c3                   	retq   

0000000000801214 <memset>:
  801214:	55                   	push   %rbp
  801215:	48 89 e5             	mov    %rsp,%rbp
  801218:	48 83 ec 18          	sub    $0x18,%rsp
  80121c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801220:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801223:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801227:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80122c:	75 06                	jne    801234 <memset+0x20>
  80122e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801232:	eb 69                	jmp    80129d <memset+0x89>
  801234:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801238:	83 e0 03             	and    $0x3,%eax
  80123b:	48 85 c0             	test   %rax,%rax
  80123e:	75 48                	jne    801288 <memset+0x74>
  801240:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801244:	83 e0 03             	and    $0x3,%eax
  801247:	48 85 c0             	test   %rax,%rax
  80124a:	75 3c                	jne    801288 <memset+0x74>
  80124c:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  801253:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801256:	c1 e0 18             	shl    $0x18,%eax
  801259:	89 c2                	mov    %eax,%edx
  80125b:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80125e:	c1 e0 10             	shl    $0x10,%eax
  801261:	09 c2                	or     %eax,%edx
  801263:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801266:	c1 e0 08             	shl    $0x8,%eax
  801269:	09 d0                	or     %edx,%eax
  80126b:	09 45 f4             	or     %eax,-0xc(%rbp)
  80126e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801272:	48 c1 e8 02          	shr    $0x2,%rax
  801276:	48 89 c1             	mov    %rax,%rcx
  801279:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80127d:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801280:	48 89 d7             	mov    %rdx,%rdi
  801283:	fc                   	cld    
  801284:	f3 ab                	rep stos %eax,%es:(%rdi)
  801286:	eb 11                	jmp    801299 <memset+0x85>
  801288:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80128c:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80128f:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801293:	48 89 d7             	mov    %rdx,%rdi
  801296:	fc                   	cld    
  801297:	f3 aa                	rep stos %al,%es:(%rdi)
  801299:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80129d:	c9                   	leaveq 
  80129e:	c3                   	retq   

000000000080129f <memmove>:
  80129f:	55                   	push   %rbp
  8012a0:	48 89 e5             	mov    %rsp,%rbp
  8012a3:	48 83 ec 28          	sub    $0x28,%rsp
  8012a7:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8012ab:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8012af:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8012b3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8012b7:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8012bb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012bf:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8012c3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012c7:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8012cb:	0f 83 88 00 00 00    	jae    801359 <memmove+0xba>
  8012d1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8012d5:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8012d9:	48 01 d0             	add    %rdx,%rax
  8012dc:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8012e0:	76 77                	jbe    801359 <memmove+0xba>
  8012e2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8012e6:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  8012ea:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8012ee:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  8012f2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012f6:	83 e0 03             	and    $0x3,%eax
  8012f9:	48 85 c0             	test   %rax,%rax
  8012fc:	75 3b                	jne    801339 <memmove+0x9a>
  8012fe:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801302:	83 e0 03             	and    $0x3,%eax
  801305:	48 85 c0             	test   %rax,%rax
  801308:	75 2f                	jne    801339 <memmove+0x9a>
  80130a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80130e:	83 e0 03             	and    $0x3,%eax
  801311:	48 85 c0             	test   %rax,%rax
  801314:	75 23                	jne    801339 <memmove+0x9a>
  801316:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80131a:	48 83 e8 04          	sub    $0x4,%rax
  80131e:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801322:	48 83 ea 04          	sub    $0x4,%rdx
  801326:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  80132a:	48 c1 e9 02          	shr    $0x2,%rcx
  80132e:	48 89 c7             	mov    %rax,%rdi
  801331:	48 89 d6             	mov    %rdx,%rsi
  801334:	fd                   	std    
  801335:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801337:	eb 1d                	jmp    801356 <memmove+0xb7>
  801339:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80133d:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801341:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801345:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  801349:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80134d:	48 89 d7             	mov    %rdx,%rdi
  801350:	48 89 c1             	mov    %rax,%rcx
  801353:	fd                   	std    
  801354:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801356:	fc                   	cld    
  801357:	eb 57                	jmp    8013b0 <memmove+0x111>
  801359:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80135d:	83 e0 03             	and    $0x3,%eax
  801360:	48 85 c0             	test   %rax,%rax
  801363:	75 36                	jne    80139b <memmove+0xfc>
  801365:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801369:	83 e0 03             	and    $0x3,%eax
  80136c:	48 85 c0             	test   %rax,%rax
  80136f:	75 2a                	jne    80139b <memmove+0xfc>
  801371:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801375:	83 e0 03             	and    $0x3,%eax
  801378:	48 85 c0             	test   %rax,%rax
  80137b:	75 1e                	jne    80139b <memmove+0xfc>
  80137d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801381:	48 c1 e8 02          	shr    $0x2,%rax
  801385:	48 89 c1             	mov    %rax,%rcx
  801388:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80138c:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801390:	48 89 c7             	mov    %rax,%rdi
  801393:	48 89 d6             	mov    %rdx,%rsi
  801396:	fc                   	cld    
  801397:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801399:	eb 15                	jmp    8013b0 <memmove+0x111>
  80139b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80139f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8013a3:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  8013a7:	48 89 c7             	mov    %rax,%rdi
  8013aa:	48 89 d6             	mov    %rdx,%rsi
  8013ad:	fc                   	cld    
  8013ae:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  8013b0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013b4:	c9                   	leaveq 
  8013b5:	c3                   	retq   

00000000008013b6 <memcpy>:
  8013b6:	55                   	push   %rbp
  8013b7:	48 89 e5             	mov    %rsp,%rbp
  8013ba:	48 83 ec 18          	sub    $0x18,%rsp
  8013be:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8013c2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8013c6:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8013ca:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8013ce:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8013d2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013d6:	48 89 ce             	mov    %rcx,%rsi
  8013d9:	48 89 c7             	mov    %rax,%rdi
  8013dc:	48 b8 9f 12 80 00 00 	movabs $0x80129f,%rax
  8013e3:	00 00 00 
  8013e6:	ff d0                	callq  *%rax
  8013e8:	c9                   	leaveq 
  8013e9:	c3                   	retq   

00000000008013ea <memcmp>:
  8013ea:	55                   	push   %rbp
  8013eb:	48 89 e5             	mov    %rsp,%rbp
  8013ee:	48 83 ec 28          	sub    $0x28,%rsp
  8013f2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8013f6:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8013fa:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8013fe:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801402:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801406:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80140a:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80140e:	eb 36                	jmp    801446 <memcmp+0x5c>
  801410:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801414:	0f b6 10             	movzbl (%rax),%edx
  801417:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80141b:	0f b6 00             	movzbl (%rax),%eax
  80141e:	38 c2                	cmp    %al,%dl
  801420:	74 1a                	je     80143c <memcmp+0x52>
  801422:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801426:	0f b6 00             	movzbl (%rax),%eax
  801429:	0f b6 d0             	movzbl %al,%edx
  80142c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801430:	0f b6 00             	movzbl (%rax),%eax
  801433:	0f b6 c0             	movzbl %al,%eax
  801436:	29 c2                	sub    %eax,%edx
  801438:	89 d0                	mov    %edx,%eax
  80143a:	eb 20                	jmp    80145c <memcmp+0x72>
  80143c:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801441:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801446:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80144a:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80144e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801452:	48 85 c0             	test   %rax,%rax
  801455:	75 b9                	jne    801410 <memcmp+0x26>
  801457:	b8 00 00 00 00       	mov    $0x0,%eax
  80145c:	c9                   	leaveq 
  80145d:	c3                   	retq   

000000000080145e <memfind>:
  80145e:	55                   	push   %rbp
  80145f:	48 89 e5             	mov    %rsp,%rbp
  801462:	48 83 ec 28          	sub    $0x28,%rsp
  801466:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80146a:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80146d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801471:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801475:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801479:	48 01 d0             	add    %rdx,%rax
  80147c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801480:	eb 15                	jmp    801497 <memfind+0x39>
  801482:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801486:	0f b6 10             	movzbl (%rax),%edx
  801489:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80148c:	38 c2                	cmp    %al,%dl
  80148e:	75 02                	jne    801492 <memfind+0x34>
  801490:	eb 0f                	jmp    8014a1 <memfind+0x43>
  801492:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801497:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80149b:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  80149f:	72 e1                	jb     801482 <memfind+0x24>
  8014a1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014a5:	c9                   	leaveq 
  8014a6:	c3                   	retq   

00000000008014a7 <strtol>:
  8014a7:	55                   	push   %rbp
  8014a8:	48 89 e5             	mov    %rsp,%rbp
  8014ab:	48 83 ec 34          	sub    $0x34,%rsp
  8014af:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8014b3:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8014b7:	89 55 cc             	mov    %edx,-0x34(%rbp)
  8014ba:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8014c1:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  8014c8:	00 
  8014c9:	eb 05                	jmp    8014d0 <strtol+0x29>
  8014cb:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8014d0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014d4:	0f b6 00             	movzbl (%rax),%eax
  8014d7:	3c 20                	cmp    $0x20,%al
  8014d9:	74 f0                	je     8014cb <strtol+0x24>
  8014db:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014df:	0f b6 00             	movzbl (%rax),%eax
  8014e2:	3c 09                	cmp    $0x9,%al
  8014e4:	74 e5                	je     8014cb <strtol+0x24>
  8014e6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014ea:	0f b6 00             	movzbl (%rax),%eax
  8014ed:	3c 2b                	cmp    $0x2b,%al
  8014ef:	75 07                	jne    8014f8 <strtol+0x51>
  8014f1:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8014f6:	eb 17                	jmp    80150f <strtol+0x68>
  8014f8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014fc:	0f b6 00             	movzbl (%rax),%eax
  8014ff:	3c 2d                	cmp    $0x2d,%al
  801501:	75 0c                	jne    80150f <strtol+0x68>
  801503:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801508:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  80150f:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801513:	74 06                	je     80151b <strtol+0x74>
  801515:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  801519:	75 28                	jne    801543 <strtol+0x9c>
  80151b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80151f:	0f b6 00             	movzbl (%rax),%eax
  801522:	3c 30                	cmp    $0x30,%al
  801524:	75 1d                	jne    801543 <strtol+0x9c>
  801526:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80152a:	48 83 c0 01          	add    $0x1,%rax
  80152e:	0f b6 00             	movzbl (%rax),%eax
  801531:	3c 78                	cmp    $0x78,%al
  801533:	75 0e                	jne    801543 <strtol+0x9c>
  801535:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  80153a:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  801541:	eb 2c                	jmp    80156f <strtol+0xc8>
  801543:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801547:	75 19                	jne    801562 <strtol+0xbb>
  801549:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80154d:	0f b6 00             	movzbl (%rax),%eax
  801550:	3c 30                	cmp    $0x30,%al
  801552:	75 0e                	jne    801562 <strtol+0xbb>
  801554:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801559:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  801560:	eb 0d                	jmp    80156f <strtol+0xc8>
  801562:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801566:	75 07                	jne    80156f <strtol+0xc8>
  801568:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  80156f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801573:	0f b6 00             	movzbl (%rax),%eax
  801576:	3c 2f                	cmp    $0x2f,%al
  801578:	7e 1d                	jle    801597 <strtol+0xf0>
  80157a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80157e:	0f b6 00             	movzbl (%rax),%eax
  801581:	3c 39                	cmp    $0x39,%al
  801583:	7f 12                	jg     801597 <strtol+0xf0>
  801585:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801589:	0f b6 00             	movzbl (%rax),%eax
  80158c:	0f be c0             	movsbl %al,%eax
  80158f:	83 e8 30             	sub    $0x30,%eax
  801592:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801595:	eb 4e                	jmp    8015e5 <strtol+0x13e>
  801597:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80159b:	0f b6 00             	movzbl (%rax),%eax
  80159e:	3c 60                	cmp    $0x60,%al
  8015a0:	7e 1d                	jle    8015bf <strtol+0x118>
  8015a2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015a6:	0f b6 00             	movzbl (%rax),%eax
  8015a9:	3c 7a                	cmp    $0x7a,%al
  8015ab:	7f 12                	jg     8015bf <strtol+0x118>
  8015ad:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015b1:	0f b6 00             	movzbl (%rax),%eax
  8015b4:	0f be c0             	movsbl %al,%eax
  8015b7:	83 e8 57             	sub    $0x57,%eax
  8015ba:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8015bd:	eb 26                	jmp    8015e5 <strtol+0x13e>
  8015bf:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015c3:	0f b6 00             	movzbl (%rax),%eax
  8015c6:	3c 40                	cmp    $0x40,%al
  8015c8:	7e 48                	jle    801612 <strtol+0x16b>
  8015ca:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015ce:	0f b6 00             	movzbl (%rax),%eax
  8015d1:	3c 5a                	cmp    $0x5a,%al
  8015d3:	7f 3d                	jg     801612 <strtol+0x16b>
  8015d5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015d9:	0f b6 00             	movzbl (%rax),%eax
  8015dc:	0f be c0             	movsbl %al,%eax
  8015df:	83 e8 37             	sub    $0x37,%eax
  8015e2:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8015e5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8015e8:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  8015eb:	7c 02                	jl     8015ef <strtol+0x148>
  8015ed:	eb 23                	jmp    801612 <strtol+0x16b>
  8015ef:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8015f4:	8b 45 cc             	mov    -0x34(%rbp),%eax
  8015f7:	48 98                	cltq   
  8015f9:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  8015fe:	48 89 c2             	mov    %rax,%rdx
  801601:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801604:	48 98                	cltq   
  801606:	48 01 d0             	add    %rdx,%rax
  801609:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80160d:	e9 5d ff ff ff       	jmpq   80156f <strtol+0xc8>
  801612:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  801617:	74 0b                	je     801624 <strtol+0x17d>
  801619:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80161d:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801621:	48 89 10             	mov    %rdx,(%rax)
  801624:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801628:	74 09                	je     801633 <strtol+0x18c>
  80162a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80162e:	48 f7 d8             	neg    %rax
  801631:	eb 04                	jmp    801637 <strtol+0x190>
  801633:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801637:	c9                   	leaveq 
  801638:	c3                   	retq   

0000000000801639 <strstr>:
  801639:	55                   	push   %rbp
  80163a:	48 89 e5             	mov    %rsp,%rbp
  80163d:	48 83 ec 30          	sub    $0x30,%rsp
  801641:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801645:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801649:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80164d:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801651:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801655:	0f b6 00             	movzbl (%rax),%eax
  801658:	88 45 ff             	mov    %al,-0x1(%rbp)
  80165b:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  80165f:	75 06                	jne    801667 <strstr+0x2e>
  801661:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801665:	eb 6b                	jmp    8016d2 <strstr+0x99>
  801667:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80166b:	48 89 c7             	mov    %rax,%rdi
  80166e:	48 b8 0f 0f 80 00 00 	movabs $0x800f0f,%rax
  801675:	00 00 00 
  801678:	ff d0                	callq  *%rax
  80167a:	48 98                	cltq   
  80167c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801680:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801684:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801688:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80168c:	0f b6 00             	movzbl (%rax),%eax
  80168f:	88 45 ef             	mov    %al,-0x11(%rbp)
  801692:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  801696:	75 07                	jne    80169f <strstr+0x66>
  801698:	b8 00 00 00 00       	mov    $0x0,%eax
  80169d:	eb 33                	jmp    8016d2 <strstr+0x99>
  80169f:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  8016a3:	3a 45 ff             	cmp    -0x1(%rbp),%al
  8016a6:	75 d8                	jne    801680 <strstr+0x47>
  8016a8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8016ac:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  8016b0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016b4:	48 89 ce             	mov    %rcx,%rsi
  8016b7:	48 89 c7             	mov    %rax,%rdi
  8016ba:	48 b8 30 11 80 00 00 	movabs $0x801130,%rax
  8016c1:	00 00 00 
  8016c4:	ff d0                	callq  *%rax
  8016c6:	85 c0                	test   %eax,%eax
  8016c8:	75 b6                	jne    801680 <strstr+0x47>
  8016ca:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016ce:	48 83 e8 01          	sub    $0x1,%rax
  8016d2:	c9                   	leaveq 
  8016d3:	c3                   	retq   

00000000008016d4 <syscall>:
  8016d4:	55                   	push   %rbp
  8016d5:	48 89 e5             	mov    %rsp,%rbp
  8016d8:	53                   	push   %rbx
  8016d9:	48 83 ec 48          	sub    $0x48,%rsp
  8016dd:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8016e0:	89 75 d8             	mov    %esi,-0x28(%rbp)
  8016e3:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  8016e7:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  8016eb:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  8016ef:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  8016f3:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8016f6:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  8016fa:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  8016fe:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  801702:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  801706:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  80170a:	4c 89 c3             	mov    %r8,%rbx
  80170d:	cd 30                	int    $0x30
  80170f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801713:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801717:	74 3e                	je     801757 <syscall+0x83>
  801719:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80171e:	7e 37                	jle    801757 <syscall+0x83>
  801720:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801724:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801727:	49 89 d0             	mov    %rdx,%r8
  80172a:	89 c1                	mov    %eax,%ecx
  80172c:	48 ba 68 51 80 00 00 	movabs $0x805168,%rdx
  801733:	00 00 00 
  801736:	be 24 00 00 00       	mov    $0x24,%esi
  80173b:	48 bf 85 51 80 00 00 	movabs $0x805185,%rdi
  801742:	00 00 00 
  801745:	b8 00 00 00 00       	mov    $0x0,%eax
  80174a:	49 b9 8d 01 80 00 00 	movabs $0x80018d,%r9
  801751:	00 00 00 
  801754:	41 ff d1             	callq  *%r9
  801757:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80175b:	48 83 c4 48          	add    $0x48,%rsp
  80175f:	5b                   	pop    %rbx
  801760:	5d                   	pop    %rbp
  801761:	c3                   	retq   

0000000000801762 <sys_cputs>:
  801762:	55                   	push   %rbp
  801763:	48 89 e5             	mov    %rsp,%rbp
  801766:	48 83 ec 20          	sub    $0x20,%rsp
  80176a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80176e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801772:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801776:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80177a:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801781:	00 
  801782:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801788:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80178e:	48 89 d1             	mov    %rdx,%rcx
  801791:	48 89 c2             	mov    %rax,%rdx
  801794:	be 00 00 00 00       	mov    $0x0,%esi
  801799:	bf 00 00 00 00       	mov    $0x0,%edi
  80179e:	48 b8 d4 16 80 00 00 	movabs $0x8016d4,%rax
  8017a5:	00 00 00 
  8017a8:	ff d0                	callq  *%rax
  8017aa:	c9                   	leaveq 
  8017ab:	c3                   	retq   

00000000008017ac <sys_cgetc>:
  8017ac:	55                   	push   %rbp
  8017ad:	48 89 e5             	mov    %rsp,%rbp
  8017b0:	48 83 ec 10          	sub    $0x10,%rsp
  8017b4:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8017bb:	00 
  8017bc:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8017c2:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8017c8:	b9 00 00 00 00       	mov    $0x0,%ecx
  8017cd:	ba 00 00 00 00       	mov    $0x0,%edx
  8017d2:	be 00 00 00 00       	mov    $0x0,%esi
  8017d7:	bf 01 00 00 00       	mov    $0x1,%edi
  8017dc:	48 b8 d4 16 80 00 00 	movabs $0x8016d4,%rax
  8017e3:	00 00 00 
  8017e6:	ff d0                	callq  *%rax
  8017e8:	c9                   	leaveq 
  8017e9:	c3                   	retq   

00000000008017ea <sys_env_destroy>:
  8017ea:	55                   	push   %rbp
  8017eb:	48 89 e5             	mov    %rsp,%rbp
  8017ee:	48 83 ec 10          	sub    $0x10,%rsp
  8017f2:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8017f5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8017f8:	48 98                	cltq   
  8017fa:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801801:	00 
  801802:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801808:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80180e:	b9 00 00 00 00       	mov    $0x0,%ecx
  801813:	48 89 c2             	mov    %rax,%rdx
  801816:	be 01 00 00 00       	mov    $0x1,%esi
  80181b:	bf 03 00 00 00       	mov    $0x3,%edi
  801820:	48 b8 d4 16 80 00 00 	movabs $0x8016d4,%rax
  801827:	00 00 00 
  80182a:	ff d0                	callq  *%rax
  80182c:	c9                   	leaveq 
  80182d:	c3                   	retq   

000000000080182e <sys_getenvid>:
  80182e:	55                   	push   %rbp
  80182f:	48 89 e5             	mov    %rsp,%rbp
  801832:	48 83 ec 10          	sub    $0x10,%rsp
  801836:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80183d:	00 
  80183e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801844:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80184a:	b9 00 00 00 00       	mov    $0x0,%ecx
  80184f:	ba 00 00 00 00       	mov    $0x0,%edx
  801854:	be 00 00 00 00       	mov    $0x0,%esi
  801859:	bf 02 00 00 00       	mov    $0x2,%edi
  80185e:	48 b8 d4 16 80 00 00 	movabs $0x8016d4,%rax
  801865:	00 00 00 
  801868:	ff d0                	callq  *%rax
  80186a:	c9                   	leaveq 
  80186b:	c3                   	retq   

000000000080186c <sys_yield>:
  80186c:	55                   	push   %rbp
  80186d:	48 89 e5             	mov    %rsp,%rbp
  801870:	48 83 ec 10          	sub    $0x10,%rsp
  801874:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80187b:	00 
  80187c:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801882:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801888:	b9 00 00 00 00       	mov    $0x0,%ecx
  80188d:	ba 00 00 00 00       	mov    $0x0,%edx
  801892:	be 00 00 00 00       	mov    $0x0,%esi
  801897:	bf 0b 00 00 00       	mov    $0xb,%edi
  80189c:	48 b8 d4 16 80 00 00 	movabs $0x8016d4,%rax
  8018a3:	00 00 00 
  8018a6:	ff d0                	callq  *%rax
  8018a8:	c9                   	leaveq 
  8018a9:	c3                   	retq   

00000000008018aa <sys_page_alloc>:
  8018aa:	55                   	push   %rbp
  8018ab:	48 89 e5             	mov    %rsp,%rbp
  8018ae:	48 83 ec 20          	sub    $0x20,%rsp
  8018b2:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8018b5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8018b9:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8018bc:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8018bf:	48 63 c8             	movslq %eax,%rcx
  8018c2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8018c6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8018c9:	48 98                	cltq   
  8018cb:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8018d2:	00 
  8018d3:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8018d9:	49 89 c8             	mov    %rcx,%r8
  8018dc:	48 89 d1             	mov    %rdx,%rcx
  8018df:	48 89 c2             	mov    %rax,%rdx
  8018e2:	be 01 00 00 00       	mov    $0x1,%esi
  8018e7:	bf 04 00 00 00       	mov    $0x4,%edi
  8018ec:	48 b8 d4 16 80 00 00 	movabs $0x8016d4,%rax
  8018f3:	00 00 00 
  8018f6:	ff d0                	callq  *%rax
  8018f8:	c9                   	leaveq 
  8018f9:	c3                   	retq   

00000000008018fa <sys_page_map>:
  8018fa:	55                   	push   %rbp
  8018fb:	48 89 e5             	mov    %rsp,%rbp
  8018fe:	48 83 ec 30          	sub    $0x30,%rsp
  801902:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801905:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801909:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80190c:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801910:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801914:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801917:	48 63 c8             	movslq %eax,%rcx
  80191a:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  80191e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801921:	48 63 f0             	movslq %eax,%rsi
  801924:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801928:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80192b:	48 98                	cltq   
  80192d:	48 89 0c 24          	mov    %rcx,(%rsp)
  801931:	49 89 f9             	mov    %rdi,%r9
  801934:	49 89 f0             	mov    %rsi,%r8
  801937:	48 89 d1             	mov    %rdx,%rcx
  80193a:	48 89 c2             	mov    %rax,%rdx
  80193d:	be 01 00 00 00       	mov    $0x1,%esi
  801942:	bf 05 00 00 00       	mov    $0x5,%edi
  801947:	48 b8 d4 16 80 00 00 	movabs $0x8016d4,%rax
  80194e:	00 00 00 
  801951:	ff d0                	callq  *%rax
  801953:	c9                   	leaveq 
  801954:	c3                   	retq   

0000000000801955 <sys_page_unmap>:
  801955:	55                   	push   %rbp
  801956:	48 89 e5             	mov    %rsp,%rbp
  801959:	48 83 ec 20          	sub    $0x20,%rsp
  80195d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801960:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801964:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801968:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80196b:	48 98                	cltq   
  80196d:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801974:	00 
  801975:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80197b:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801981:	48 89 d1             	mov    %rdx,%rcx
  801984:	48 89 c2             	mov    %rax,%rdx
  801987:	be 01 00 00 00       	mov    $0x1,%esi
  80198c:	bf 06 00 00 00       	mov    $0x6,%edi
  801991:	48 b8 d4 16 80 00 00 	movabs $0x8016d4,%rax
  801998:	00 00 00 
  80199b:	ff d0                	callq  *%rax
  80199d:	c9                   	leaveq 
  80199e:	c3                   	retq   

000000000080199f <sys_env_set_status>:
  80199f:	55                   	push   %rbp
  8019a0:	48 89 e5             	mov    %rsp,%rbp
  8019a3:	48 83 ec 10          	sub    $0x10,%rsp
  8019a7:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8019aa:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8019ad:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8019b0:	48 63 d0             	movslq %eax,%rdx
  8019b3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8019b6:	48 98                	cltq   
  8019b8:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8019bf:	00 
  8019c0:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8019c6:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8019cc:	48 89 d1             	mov    %rdx,%rcx
  8019cf:	48 89 c2             	mov    %rax,%rdx
  8019d2:	be 01 00 00 00       	mov    $0x1,%esi
  8019d7:	bf 08 00 00 00       	mov    $0x8,%edi
  8019dc:	48 b8 d4 16 80 00 00 	movabs $0x8016d4,%rax
  8019e3:	00 00 00 
  8019e6:	ff d0                	callq  *%rax
  8019e8:	c9                   	leaveq 
  8019e9:	c3                   	retq   

00000000008019ea <sys_env_set_trapframe>:
  8019ea:	55                   	push   %rbp
  8019eb:	48 89 e5             	mov    %rsp,%rbp
  8019ee:	48 83 ec 20          	sub    $0x20,%rsp
  8019f2:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8019f5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8019f9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8019fd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a00:	48 98                	cltq   
  801a02:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801a09:	00 
  801a0a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a10:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a16:	48 89 d1             	mov    %rdx,%rcx
  801a19:	48 89 c2             	mov    %rax,%rdx
  801a1c:	be 01 00 00 00       	mov    $0x1,%esi
  801a21:	bf 09 00 00 00       	mov    $0x9,%edi
  801a26:	48 b8 d4 16 80 00 00 	movabs $0x8016d4,%rax
  801a2d:	00 00 00 
  801a30:	ff d0                	callq  *%rax
  801a32:	c9                   	leaveq 
  801a33:	c3                   	retq   

0000000000801a34 <sys_env_set_pgfault_upcall>:
  801a34:	55                   	push   %rbp
  801a35:	48 89 e5             	mov    %rsp,%rbp
  801a38:	48 83 ec 20          	sub    $0x20,%rsp
  801a3c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a3f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a43:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801a47:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a4a:	48 98                	cltq   
  801a4c:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801a53:	00 
  801a54:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a5a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a60:	48 89 d1             	mov    %rdx,%rcx
  801a63:	48 89 c2             	mov    %rax,%rdx
  801a66:	be 01 00 00 00       	mov    $0x1,%esi
  801a6b:	bf 0a 00 00 00       	mov    $0xa,%edi
  801a70:	48 b8 d4 16 80 00 00 	movabs $0x8016d4,%rax
  801a77:	00 00 00 
  801a7a:	ff d0                	callq  *%rax
  801a7c:	c9                   	leaveq 
  801a7d:	c3                   	retq   

0000000000801a7e <sys_ipc_try_send>:
  801a7e:	55                   	push   %rbp
  801a7f:	48 89 e5             	mov    %rsp,%rbp
  801a82:	48 83 ec 20          	sub    $0x20,%rsp
  801a86:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a89:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a8d:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801a91:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801a94:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801a97:	48 63 f0             	movslq %eax,%rsi
  801a9a:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801a9e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801aa1:	48 98                	cltq   
  801aa3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801aa7:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801aae:	00 
  801aaf:	49 89 f1             	mov    %rsi,%r9
  801ab2:	49 89 c8             	mov    %rcx,%r8
  801ab5:	48 89 d1             	mov    %rdx,%rcx
  801ab8:	48 89 c2             	mov    %rax,%rdx
  801abb:	be 00 00 00 00       	mov    $0x0,%esi
  801ac0:	bf 0c 00 00 00       	mov    $0xc,%edi
  801ac5:	48 b8 d4 16 80 00 00 	movabs $0x8016d4,%rax
  801acc:	00 00 00 
  801acf:	ff d0                	callq  *%rax
  801ad1:	c9                   	leaveq 
  801ad2:	c3                   	retq   

0000000000801ad3 <sys_ipc_recv>:
  801ad3:	55                   	push   %rbp
  801ad4:	48 89 e5             	mov    %rsp,%rbp
  801ad7:	48 83 ec 10          	sub    $0x10,%rsp
  801adb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801adf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ae3:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801aea:	00 
  801aeb:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801af1:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801af7:	b9 00 00 00 00       	mov    $0x0,%ecx
  801afc:	48 89 c2             	mov    %rax,%rdx
  801aff:	be 01 00 00 00       	mov    $0x1,%esi
  801b04:	bf 0d 00 00 00       	mov    $0xd,%edi
  801b09:	48 b8 d4 16 80 00 00 	movabs $0x8016d4,%rax
  801b10:	00 00 00 
  801b13:	ff d0                	callq  *%rax
  801b15:	c9                   	leaveq 
  801b16:	c3                   	retq   

0000000000801b17 <sys_time_msec>:
  801b17:	55                   	push   %rbp
  801b18:	48 89 e5             	mov    %rsp,%rbp
  801b1b:	48 83 ec 10          	sub    $0x10,%rsp
  801b1f:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801b26:	00 
  801b27:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b2d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b33:	b9 00 00 00 00       	mov    $0x0,%ecx
  801b38:	ba 00 00 00 00       	mov    $0x0,%edx
  801b3d:	be 00 00 00 00       	mov    $0x0,%esi
  801b42:	bf 0e 00 00 00       	mov    $0xe,%edi
  801b47:	48 b8 d4 16 80 00 00 	movabs $0x8016d4,%rax
  801b4e:	00 00 00 
  801b51:	ff d0                	callq  *%rax
  801b53:	c9                   	leaveq 
  801b54:	c3                   	retq   

0000000000801b55 <sys_net_transmit>:
  801b55:	55                   	push   %rbp
  801b56:	48 89 e5             	mov    %rsp,%rbp
  801b59:	48 83 ec 20          	sub    $0x20,%rsp
  801b5d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801b61:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801b64:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801b67:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b6b:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801b72:	00 
  801b73:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b79:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b7f:	48 89 d1             	mov    %rdx,%rcx
  801b82:	48 89 c2             	mov    %rax,%rdx
  801b85:	be 00 00 00 00       	mov    $0x0,%esi
  801b8a:	bf 0f 00 00 00       	mov    $0xf,%edi
  801b8f:	48 b8 d4 16 80 00 00 	movabs $0x8016d4,%rax
  801b96:	00 00 00 
  801b99:	ff d0                	callq  *%rax
  801b9b:	c9                   	leaveq 
  801b9c:	c3                   	retq   

0000000000801b9d <sys_net_receive>:
  801b9d:	55                   	push   %rbp
  801b9e:	48 89 e5             	mov    %rsp,%rbp
  801ba1:	48 83 ec 20          	sub    $0x20,%rsp
  801ba5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801ba9:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801bac:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801baf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801bb3:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801bba:	00 
  801bbb:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801bc1:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801bc7:	48 89 d1             	mov    %rdx,%rcx
  801bca:	48 89 c2             	mov    %rax,%rdx
  801bcd:	be 00 00 00 00       	mov    $0x0,%esi
  801bd2:	bf 10 00 00 00       	mov    $0x10,%edi
  801bd7:	48 b8 d4 16 80 00 00 	movabs $0x8016d4,%rax
  801bde:	00 00 00 
  801be1:	ff d0                	callq  *%rax
  801be3:	c9                   	leaveq 
  801be4:	c3                   	retq   

0000000000801be5 <sys_ept_map>:
  801be5:	55                   	push   %rbp
  801be6:	48 89 e5             	mov    %rsp,%rbp
  801be9:	48 83 ec 30          	sub    $0x30,%rsp
  801bed:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801bf0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801bf4:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801bf7:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801bfb:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801bff:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801c02:	48 63 c8             	movslq %eax,%rcx
  801c05:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801c09:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801c0c:	48 63 f0             	movslq %eax,%rsi
  801c0f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c13:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c16:	48 98                	cltq   
  801c18:	48 89 0c 24          	mov    %rcx,(%rsp)
  801c1c:	49 89 f9             	mov    %rdi,%r9
  801c1f:	49 89 f0             	mov    %rsi,%r8
  801c22:	48 89 d1             	mov    %rdx,%rcx
  801c25:	48 89 c2             	mov    %rax,%rdx
  801c28:	be 00 00 00 00       	mov    $0x0,%esi
  801c2d:	bf 11 00 00 00       	mov    $0x11,%edi
  801c32:	48 b8 d4 16 80 00 00 	movabs $0x8016d4,%rax
  801c39:	00 00 00 
  801c3c:	ff d0                	callq  *%rax
  801c3e:	c9                   	leaveq 
  801c3f:	c3                   	retq   

0000000000801c40 <sys_env_mkguest>:
  801c40:	55                   	push   %rbp
  801c41:	48 89 e5             	mov    %rsp,%rbp
  801c44:	48 83 ec 20          	sub    $0x20,%rsp
  801c48:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c4c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c50:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c54:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c58:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c5f:	00 
  801c60:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c66:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c6c:	48 89 d1             	mov    %rdx,%rcx
  801c6f:	48 89 c2             	mov    %rax,%rdx
  801c72:	be 00 00 00 00       	mov    $0x0,%esi
  801c77:	bf 12 00 00 00       	mov    $0x12,%edi
  801c7c:	48 b8 d4 16 80 00 00 	movabs $0x8016d4,%rax
  801c83:	00 00 00 
  801c86:	ff d0                	callq  *%rax
  801c88:	c9                   	leaveq 
  801c89:	c3                   	retq   

0000000000801c8a <sys_vmx_list_vms>:
  801c8a:	55                   	push   %rbp
  801c8b:	48 89 e5             	mov    %rsp,%rbp
  801c8e:	48 83 ec 10          	sub    $0x10,%rsp
  801c92:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c99:	00 
  801c9a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ca0:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ca6:	b9 00 00 00 00       	mov    $0x0,%ecx
  801cab:	ba 00 00 00 00       	mov    $0x0,%edx
  801cb0:	be 00 00 00 00       	mov    $0x0,%esi
  801cb5:	bf 13 00 00 00       	mov    $0x13,%edi
  801cba:	48 b8 d4 16 80 00 00 	movabs $0x8016d4,%rax
  801cc1:	00 00 00 
  801cc4:	ff d0                	callq  *%rax
  801cc6:	c9                   	leaveq 
  801cc7:	c3                   	retq   

0000000000801cc8 <sys_vmx_sel_resume>:
  801cc8:	55                   	push   %rbp
  801cc9:	48 89 e5             	mov    %rsp,%rbp
  801ccc:	48 83 ec 10          	sub    $0x10,%rsp
  801cd0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801cd3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801cd6:	48 98                	cltq   
  801cd8:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801cdf:	00 
  801ce0:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ce6:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801cec:	b9 00 00 00 00       	mov    $0x0,%ecx
  801cf1:	48 89 c2             	mov    %rax,%rdx
  801cf4:	be 00 00 00 00       	mov    $0x0,%esi
  801cf9:	bf 14 00 00 00       	mov    $0x14,%edi
  801cfe:	48 b8 d4 16 80 00 00 	movabs $0x8016d4,%rax
  801d05:	00 00 00 
  801d08:	ff d0                	callq  *%rax
  801d0a:	c9                   	leaveq 
  801d0b:	c3                   	retq   

0000000000801d0c <sys_vmx_get_vmdisk_number>:
  801d0c:	55                   	push   %rbp
  801d0d:	48 89 e5             	mov    %rsp,%rbp
  801d10:	48 83 ec 10          	sub    $0x10,%rsp
  801d14:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801d1b:	00 
  801d1c:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d22:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d28:	b9 00 00 00 00       	mov    $0x0,%ecx
  801d2d:	ba 00 00 00 00       	mov    $0x0,%edx
  801d32:	be 00 00 00 00       	mov    $0x0,%esi
  801d37:	bf 15 00 00 00       	mov    $0x15,%edi
  801d3c:	48 b8 d4 16 80 00 00 	movabs $0x8016d4,%rax
  801d43:	00 00 00 
  801d46:	ff d0                	callq  *%rax
  801d48:	c9                   	leaveq 
  801d49:	c3                   	retq   

0000000000801d4a <sys_vmx_incr_vmdisk_number>:
  801d4a:	55                   	push   %rbp
  801d4b:	48 89 e5             	mov    %rsp,%rbp
  801d4e:	48 83 ec 10          	sub    $0x10,%rsp
  801d52:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801d59:	00 
  801d5a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d60:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d66:	b9 00 00 00 00       	mov    $0x0,%ecx
  801d6b:	ba 00 00 00 00       	mov    $0x0,%edx
  801d70:	be 00 00 00 00       	mov    $0x0,%esi
  801d75:	bf 16 00 00 00       	mov    $0x16,%edi
  801d7a:	48 b8 d4 16 80 00 00 	movabs $0x8016d4,%rax
  801d81:	00 00 00 
  801d84:	ff d0                	callq  *%rax
  801d86:	c9                   	leaveq 
  801d87:	c3                   	retq   

0000000000801d88 <fd2num>:
  801d88:	55                   	push   %rbp
  801d89:	48 89 e5             	mov    %rsp,%rbp
  801d8c:	48 83 ec 08          	sub    $0x8,%rsp
  801d90:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d94:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801d98:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  801d9f:	ff ff ff 
  801da2:	48 01 d0             	add    %rdx,%rax
  801da5:	48 c1 e8 0c          	shr    $0xc,%rax
  801da9:	c9                   	leaveq 
  801daa:	c3                   	retq   

0000000000801dab <fd2data>:
  801dab:	55                   	push   %rbp
  801dac:	48 89 e5             	mov    %rsp,%rbp
  801daf:	48 83 ec 08          	sub    $0x8,%rsp
  801db3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801db7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801dbb:	48 89 c7             	mov    %rax,%rdi
  801dbe:	48 b8 88 1d 80 00 00 	movabs $0x801d88,%rax
  801dc5:	00 00 00 
  801dc8:	ff d0                	callq  *%rax
  801dca:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  801dd0:	48 c1 e0 0c          	shl    $0xc,%rax
  801dd4:	c9                   	leaveq 
  801dd5:	c3                   	retq   

0000000000801dd6 <fd_alloc>:
  801dd6:	55                   	push   %rbp
  801dd7:	48 89 e5             	mov    %rsp,%rbp
  801dda:	48 83 ec 18          	sub    $0x18,%rsp
  801dde:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801de2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801de9:	eb 6b                	jmp    801e56 <fd_alloc+0x80>
  801deb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801dee:	48 98                	cltq   
  801df0:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801df6:	48 c1 e0 0c          	shl    $0xc,%rax
  801dfa:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801dfe:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801e02:	48 c1 e8 15          	shr    $0x15,%rax
  801e06:	48 89 c2             	mov    %rax,%rdx
  801e09:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  801e10:	01 00 00 
  801e13:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801e17:	83 e0 01             	and    $0x1,%eax
  801e1a:	48 85 c0             	test   %rax,%rax
  801e1d:	74 21                	je     801e40 <fd_alloc+0x6a>
  801e1f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801e23:	48 c1 e8 0c          	shr    $0xc,%rax
  801e27:	48 89 c2             	mov    %rax,%rdx
  801e2a:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801e31:	01 00 00 
  801e34:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801e38:	83 e0 01             	and    $0x1,%eax
  801e3b:	48 85 c0             	test   %rax,%rax
  801e3e:	75 12                	jne    801e52 <fd_alloc+0x7c>
  801e40:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801e44:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801e48:	48 89 10             	mov    %rdx,(%rax)
  801e4b:	b8 00 00 00 00       	mov    $0x0,%eax
  801e50:	eb 1a                	jmp    801e6c <fd_alloc+0x96>
  801e52:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801e56:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  801e5a:	7e 8f                	jle    801deb <fd_alloc+0x15>
  801e5c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801e60:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  801e67:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  801e6c:	c9                   	leaveq 
  801e6d:	c3                   	retq   

0000000000801e6e <fd_lookup>:
  801e6e:	55                   	push   %rbp
  801e6f:	48 89 e5             	mov    %rsp,%rbp
  801e72:	48 83 ec 20          	sub    $0x20,%rsp
  801e76:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801e79:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801e7d:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  801e81:	78 06                	js     801e89 <fd_lookup+0x1b>
  801e83:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  801e87:	7e 07                	jle    801e90 <fd_lookup+0x22>
  801e89:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801e8e:	eb 6c                	jmp    801efc <fd_lookup+0x8e>
  801e90:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801e93:	48 98                	cltq   
  801e95:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801e9b:	48 c1 e0 0c          	shl    $0xc,%rax
  801e9f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801ea3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ea7:	48 c1 e8 15          	shr    $0x15,%rax
  801eab:	48 89 c2             	mov    %rax,%rdx
  801eae:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  801eb5:	01 00 00 
  801eb8:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801ebc:	83 e0 01             	and    $0x1,%eax
  801ebf:	48 85 c0             	test   %rax,%rax
  801ec2:	74 21                	je     801ee5 <fd_lookup+0x77>
  801ec4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ec8:	48 c1 e8 0c          	shr    $0xc,%rax
  801ecc:	48 89 c2             	mov    %rax,%rdx
  801ecf:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801ed6:	01 00 00 
  801ed9:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801edd:	83 e0 01             	and    $0x1,%eax
  801ee0:	48 85 c0             	test   %rax,%rax
  801ee3:	75 07                	jne    801eec <fd_lookup+0x7e>
  801ee5:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801eea:	eb 10                	jmp    801efc <fd_lookup+0x8e>
  801eec:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801ef0:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801ef4:	48 89 10             	mov    %rdx,(%rax)
  801ef7:	b8 00 00 00 00       	mov    $0x0,%eax
  801efc:	c9                   	leaveq 
  801efd:	c3                   	retq   

0000000000801efe <fd_close>:
  801efe:	55                   	push   %rbp
  801eff:	48 89 e5             	mov    %rsp,%rbp
  801f02:	48 83 ec 30          	sub    $0x30,%rsp
  801f06:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801f0a:	89 f0                	mov    %esi,%eax
  801f0c:	88 45 d4             	mov    %al,-0x2c(%rbp)
  801f0f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f13:	48 89 c7             	mov    %rax,%rdi
  801f16:	48 b8 88 1d 80 00 00 	movabs $0x801d88,%rax
  801f1d:	00 00 00 
  801f20:	ff d0                	callq  *%rax
  801f22:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  801f26:	48 89 d6             	mov    %rdx,%rsi
  801f29:	89 c7                	mov    %eax,%edi
  801f2b:	48 b8 6e 1e 80 00 00 	movabs $0x801e6e,%rax
  801f32:	00 00 00 
  801f35:	ff d0                	callq  *%rax
  801f37:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801f3a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801f3e:	78 0a                	js     801f4a <fd_close+0x4c>
  801f40:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801f44:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  801f48:	74 12                	je     801f5c <fd_close+0x5e>
  801f4a:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  801f4e:	74 05                	je     801f55 <fd_close+0x57>
  801f50:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801f53:	eb 05                	jmp    801f5a <fd_close+0x5c>
  801f55:	b8 00 00 00 00       	mov    $0x0,%eax
  801f5a:	eb 69                	jmp    801fc5 <fd_close+0xc7>
  801f5c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f60:	8b 00                	mov    (%rax),%eax
  801f62:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  801f66:	48 89 d6             	mov    %rdx,%rsi
  801f69:	89 c7                	mov    %eax,%edi
  801f6b:	48 b8 c7 1f 80 00 00 	movabs $0x801fc7,%rax
  801f72:	00 00 00 
  801f75:	ff d0                	callq  *%rax
  801f77:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801f7a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801f7e:	78 2a                	js     801faa <fd_close+0xac>
  801f80:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801f84:	48 8b 40 20          	mov    0x20(%rax),%rax
  801f88:	48 85 c0             	test   %rax,%rax
  801f8b:	74 16                	je     801fa3 <fd_close+0xa5>
  801f8d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801f91:	48 8b 40 20          	mov    0x20(%rax),%rax
  801f95:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801f99:	48 89 d7             	mov    %rdx,%rdi
  801f9c:	ff d0                	callq  *%rax
  801f9e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801fa1:	eb 07                	jmp    801faa <fd_close+0xac>
  801fa3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801faa:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801fae:	48 89 c6             	mov    %rax,%rsi
  801fb1:	bf 00 00 00 00       	mov    $0x0,%edi
  801fb6:	48 b8 55 19 80 00 00 	movabs $0x801955,%rax
  801fbd:	00 00 00 
  801fc0:	ff d0                	callq  *%rax
  801fc2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801fc5:	c9                   	leaveq 
  801fc6:	c3                   	retq   

0000000000801fc7 <dev_lookup>:
  801fc7:	55                   	push   %rbp
  801fc8:	48 89 e5             	mov    %rsp,%rbp
  801fcb:	48 83 ec 20          	sub    $0x20,%rsp
  801fcf:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801fd2:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801fd6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801fdd:	eb 41                	jmp    802020 <dev_lookup+0x59>
  801fdf:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  801fe6:	00 00 00 
  801fe9:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801fec:	48 63 d2             	movslq %edx,%rdx
  801fef:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801ff3:	8b 00                	mov    (%rax),%eax
  801ff5:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  801ff8:	75 22                	jne    80201c <dev_lookup+0x55>
  801ffa:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802001:	00 00 00 
  802004:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802007:	48 63 d2             	movslq %edx,%rdx
  80200a:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  80200e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802012:	48 89 10             	mov    %rdx,(%rax)
  802015:	b8 00 00 00 00       	mov    $0x0,%eax
  80201a:	eb 60                	jmp    80207c <dev_lookup+0xb5>
  80201c:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802020:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802027:	00 00 00 
  80202a:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80202d:	48 63 d2             	movslq %edx,%rdx
  802030:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802034:	48 85 c0             	test   %rax,%rax
  802037:	75 a6                	jne    801fdf <dev_lookup+0x18>
  802039:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802040:	00 00 00 
  802043:	48 8b 00             	mov    (%rax),%rax
  802046:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80204c:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80204f:	89 c6                	mov    %eax,%esi
  802051:	48 bf 98 51 80 00 00 	movabs $0x805198,%rdi
  802058:	00 00 00 
  80205b:	b8 00 00 00 00       	mov    $0x0,%eax
  802060:	48 b9 c6 03 80 00 00 	movabs $0x8003c6,%rcx
  802067:	00 00 00 
  80206a:	ff d1                	callq  *%rcx
  80206c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802070:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802077:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80207c:	c9                   	leaveq 
  80207d:	c3                   	retq   

000000000080207e <close>:
  80207e:	55                   	push   %rbp
  80207f:	48 89 e5             	mov    %rsp,%rbp
  802082:	48 83 ec 20          	sub    $0x20,%rsp
  802086:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802089:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80208d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802090:	48 89 d6             	mov    %rdx,%rsi
  802093:	89 c7                	mov    %eax,%edi
  802095:	48 b8 6e 1e 80 00 00 	movabs $0x801e6e,%rax
  80209c:	00 00 00 
  80209f:	ff d0                	callq  *%rax
  8020a1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8020a4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8020a8:	79 05                	jns    8020af <close+0x31>
  8020aa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8020ad:	eb 18                	jmp    8020c7 <close+0x49>
  8020af:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8020b3:	be 01 00 00 00       	mov    $0x1,%esi
  8020b8:	48 89 c7             	mov    %rax,%rdi
  8020bb:	48 b8 fe 1e 80 00 00 	movabs $0x801efe,%rax
  8020c2:	00 00 00 
  8020c5:	ff d0                	callq  *%rax
  8020c7:	c9                   	leaveq 
  8020c8:	c3                   	retq   

00000000008020c9 <close_all>:
  8020c9:	55                   	push   %rbp
  8020ca:	48 89 e5             	mov    %rsp,%rbp
  8020cd:	48 83 ec 10          	sub    $0x10,%rsp
  8020d1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8020d8:	eb 15                	jmp    8020ef <close_all+0x26>
  8020da:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8020dd:	89 c7                	mov    %eax,%edi
  8020df:	48 b8 7e 20 80 00 00 	movabs $0x80207e,%rax
  8020e6:	00 00 00 
  8020e9:	ff d0                	callq  *%rax
  8020eb:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8020ef:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  8020f3:	7e e5                	jle    8020da <close_all+0x11>
  8020f5:	c9                   	leaveq 
  8020f6:	c3                   	retq   

00000000008020f7 <dup>:
  8020f7:	55                   	push   %rbp
  8020f8:	48 89 e5             	mov    %rsp,%rbp
  8020fb:	48 83 ec 40          	sub    $0x40,%rsp
  8020ff:	89 7d cc             	mov    %edi,-0x34(%rbp)
  802102:	89 75 c8             	mov    %esi,-0x38(%rbp)
  802105:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  802109:	8b 45 cc             	mov    -0x34(%rbp),%eax
  80210c:	48 89 d6             	mov    %rdx,%rsi
  80210f:	89 c7                	mov    %eax,%edi
  802111:	48 b8 6e 1e 80 00 00 	movabs $0x801e6e,%rax
  802118:	00 00 00 
  80211b:	ff d0                	callq  *%rax
  80211d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802120:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802124:	79 08                	jns    80212e <dup+0x37>
  802126:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802129:	e9 70 01 00 00       	jmpq   80229e <dup+0x1a7>
  80212e:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802131:	89 c7                	mov    %eax,%edi
  802133:	48 b8 7e 20 80 00 00 	movabs $0x80207e,%rax
  80213a:	00 00 00 
  80213d:	ff d0                	callq  *%rax
  80213f:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802142:	48 98                	cltq   
  802144:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  80214a:	48 c1 e0 0c          	shl    $0xc,%rax
  80214e:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802152:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802156:	48 89 c7             	mov    %rax,%rdi
  802159:	48 b8 ab 1d 80 00 00 	movabs $0x801dab,%rax
  802160:	00 00 00 
  802163:	ff d0                	callq  *%rax
  802165:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802169:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80216d:	48 89 c7             	mov    %rax,%rdi
  802170:	48 b8 ab 1d 80 00 00 	movabs $0x801dab,%rax
  802177:	00 00 00 
  80217a:	ff d0                	callq  *%rax
  80217c:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802180:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802184:	48 c1 e8 15          	shr    $0x15,%rax
  802188:	48 89 c2             	mov    %rax,%rdx
  80218b:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802192:	01 00 00 
  802195:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802199:	83 e0 01             	and    $0x1,%eax
  80219c:	48 85 c0             	test   %rax,%rax
  80219f:	74 73                	je     802214 <dup+0x11d>
  8021a1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8021a5:	48 c1 e8 0c          	shr    $0xc,%rax
  8021a9:	48 89 c2             	mov    %rax,%rdx
  8021ac:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8021b3:	01 00 00 
  8021b6:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8021ba:	83 e0 01             	and    $0x1,%eax
  8021bd:	48 85 c0             	test   %rax,%rax
  8021c0:	74 52                	je     802214 <dup+0x11d>
  8021c2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8021c6:	48 c1 e8 0c          	shr    $0xc,%rax
  8021ca:	48 89 c2             	mov    %rax,%rdx
  8021cd:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8021d4:	01 00 00 
  8021d7:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8021db:	25 07 0e 00 00       	and    $0xe07,%eax
  8021e0:	89 c1                	mov    %eax,%ecx
  8021e2:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8021e6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8021ea:	41 89 c8             	mov    %ecx,%r8d
  8021ed:	48 89 d1             	mov    %rdx,%rcx
  8021f0:	ba 00 00 00 00       	mov    $0x0,%edx
  8021f5:	48 89 c6             	mov    %rax,%rsi
  8021f8:	bf 00 00 00 00       	mov    $0x0,%edi
  8021fd:	48 b8 fa 18 80 00 00 	movabs $0x8018fa,%rax
  802204:	00 00 00 
  802207:	ff d0                	callq  *%rax
  802209:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80220c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802210:	79 02                	jns    802214 <dup+0x11d>
  802212:	eb 57                	jmp    80226b <dup+0x174>
  802214:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802218:	48 c1 e8 0c          	shr    $0xc,%rax
  80221c:	48 89 c2             	mov    %rax,%rdx
  80221f:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802226:	01 00 00 
  802229:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80222d:	25 07 0e 00 00       	and    $0xe07,%eax
  802232:	89 c1                	mov    %eax,%ecx
  802234:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802238:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80223c:	41 89 c8             	mov    %ecx,%r8d
  80223f:	48 89 d1             	mov    %rdx,%rcx
  802242:	ba 00 00 00 00       	mov    $0x0,%edx
  802247:	48 89 c6             	mov    %rax,%rsi
  80224a:	bf 00 00 00 00       	mov    $0x0,%edi
  80224f:	48 b8 fa 18 80 00 00 	movabs $0x8018fa,%rax
  802256:	00 00 00 
  802259:	ff d0                	callq  *%rax
  80225b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80225e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802262:	79 02                	jns    802266 <dup+0x16f>
  802264:	eb 05                	jmp    80226b <dup+0x174>
  802266:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802269:	eb 33                	jmp    80229e <dup+0x1a7>
  80226b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80226f:	48 89 c6             	mov    %rax,%rsi
  802272:	bf 00 00 00 00       	mov    $0x0,%edi
  802277:	48 b8 55 19 80 00 00 	movabs $0x801955,%rax
  80227e:	00 00 00 
  802281:	ff d0                	callq  *%rax
  802283:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802287:	48 89 c6             	mov    %rax,%rsi
  80228a:	bf 00 00 00 00       	mov    $0x0,%edi
  80228f:	48 b8 55 19 80 00 00 	movabs $0x801955,%rax
  802296:	00 00 00 
  802299:	ff d0                	callq  *%rax
  80229b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80229e:	c9                   	leaveq 
  80229f:	c3                   	retq   

00000000008022a0 <read>:
  8022a0:	55                   	push   %rbp
  8022a1:	48 89 e5             	mov    %rsp,%rbp
  8022a4:	48 83 ec 40          	sub    $0x40,%rsp
  8022a8:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8022ab:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8022af:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8022b3:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8022b7:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8022ba:	48 89 d6             	mov    %rdx,%rsi
  8022bd:	89 c7                	mov    %eax,%edi
  8022bf:	48 b8 6e 1e 80 00 00 	movabs $0x801e6e,%rax
  8022c6:	00 00 00 
  8022c9:	ff d0                	callq  *%rax
  8022cb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8022ce:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8022d2:	78 24                	js     8022f8 <read+0x58>
  8022d4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8022d8:	8b 00                	mov    (%rax),%eax
  8022da:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8022de:	48 89 d6             	mov    %rdx,%rsi
  8022e1:	89 c7                	mov    %eax,%edi
  8022e3:	48 b8 c7 1f 80 00 00 	movabs $0x801fc7,%rax
  8022ea:	00 00 00 
  8022ed:	ff d0                	callq  *%rax
  8022ef:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8022f2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8022f6:	79 05                	jns    8022fd <read+0x5d>
  8022f8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8022fb:	eb 76                	jmp    802373 <read+0xd3>
  8022fd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802301:	8b 40 08             	mov    0x8(%rax),%eax
  802304:	83 e0 03             	and    $0x3,%eax
  802307:	83 f8 01             	cmp    $0x1,%eax
  80230a:	75 3a                	jne    802346 <read+0xa6>
  80230c:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802313:	00 00 00 
  802316:	48 8b 00             	mov    (%rax),%rax
  802319:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80231f:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802322:	89 c6                	mov    %eax,%esi
  802324:	48 bf b7 51 80 00 00 	movabs $0x8051b7,%rdi
  80232b:	00 00 00 
  80232e:	b8 00 00 00 00       	mov    $0x0,%eax
  802333:	48 b9 c6 03 80 00 00 	movabs $0x8003c6,%rcx
  80233a:	00 00 00 
  80233d:	ff d1                	callq  *%rcx
  80233f:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802344:	eb 2d                	jmp    802373 <read+0xd3>
  802346:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80234a:	48 8b 40 10          	mov    0x10(%rax),%rax
  80234e:	48 85 c0             	test   %rax,%rax
  802351:	75 07                	jne    80235a <read+0xba>
  802353:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802358:	eb 19                	jmp    802373 <read+0xd3>
  80235a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80235e:	48 8b 40 10          	mov    0x10(%rax),%rax
  802362:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802366:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80236a:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  80236e:	48 89 cf             	mov    %rcx,%rdi
  802371:	ff d0                	callq  *%rax
  802373:	c9                   	leaveq 
  802374:	c3                   	retq   

0000000000802375 <readn>:
  802375:	55                   	push   %rbp
  802376:	48 89 e5             	mov    %rsp,%rbp
  802379:	48 83 ec 30          	sub    $0x30,%rsp
  80237d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802380:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802384:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802388:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80238f:	eb 49                	jmp    8023da <readn+0x65>
  802391:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802394:	48 98                	cltq   
  802396:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80239a:	48 29 c2             	sub    %rax,%rdx
  80239d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023a0:	48 63 c8             	movslq %eax,%rcx
  8023a3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8023a7:	48 01 c1             	add    %rax,%rcx
  8023aa:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8023ad:	48 89 ce             	mov    %rcx,%rsi
  8023b0:	89 c7                	mov    %eax,%edi
  8023b2:	48 b8 a0 22 80 00 00 	movabs $0x8022a0,%rax
  8023b9:	00 00 00 
  8023bc:	ff d0                	callq  *%rax
  8023be:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8023c1:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8023c5:	79 05                	jns    8023cc <readn+0x57>
  8023c7:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8023ca:	eb 1c                	jmp    8023e8 <readn+0x73>
  8023cc:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8023d0:	75 02                	jne    8023d4 <readn+0x5f>
  8023d2:	eb 11                	jmp    8023e5 <readn+0x70>
  8023d4:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8023d7:	01 45 fc             	add    %eax,-0x4(%rbp)
  8023da:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023dd:	48 98                	cltq   
  8023df:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8023e3:	72 ac                	jb     802391 <readn+0x1c>
  8023e5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023e8:	c9                   	leaveq 
  8023e9:	c3                   	retq   

00000000008023ea <write>:
  8023ea:	55                   	push   %rbp
  8023eb:	48 89 e5             	mov    %rsp,%rbp
  8023ee:	48 83 ec 40          	sub    $0x40,%rsp
  8023f2:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8023f5:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8023f9:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8023fd:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802401:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802404:	48 89 d6             	mov    %rdx,%rsi
  802407:	89 c7                	mov    %eax,%edi
  802409:	48 b8 6e 1e 80 00 00 	movabs $0x801e6e,%rax
  802410:	00 00 00 
  802413:	ff d0                	callq  *%rax
  802415:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802418:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80241c:	78 24                	js     802442 <write+0x58>
  80241e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802422:	8b 00                	mov    (%rax),%eax
  802424:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802428:	48 89 d6             	mov    %rdx,%rsi
  80242b:	89 c7                	mov    %eax,%edi
  80242d:	48 b8 c7 1f 80 00 00 	movabs $0x801fc7,%rax
  802434:	00 00 00 
  802437:	ff d0                	callq  *%rax
  802439:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80243c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802440:	79 05                	jns    802447 <write+0x5d>
  802442:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802445:	eb 75                	jmp    8024bc <write+0xd2>
  802447:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80244b:	8b 40 08             	mov    0x8(%rax),%eax
  80244e:	83 e0 03             	and    $0x3,%eax
  802451:	85 c0                	test   %eax,%eax
  802453:	75 3a                	jne    80248f <write+0xa5>
  802455:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80245c:	00 00 00 
  80245f:	48 8b 00             	mov    (%rax),%rax
  802462:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802468:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80246b:	89 c6                	mov    %eax,%esi
  80246d:	48 bf d3 51 80 00 00 	movabs $0x8051d3,%rdi
  802474:	00 00 00 
  802477:	b8 00 00 00 00       	mov    $0x0,%eax
  80247c:	48 b9 c6 03 80 00 00 	movabs $0x8003c6,%rcx
  802483:	00 00 00 
  802486:	ff d1                	callq  *%rcx
  802488:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80248d:	eb 2d                	jmp    8024bc <write+0xd2>
  80248f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802493:	48 8b 40 18          	mov    0x18(%rax),%rax
  802497:	48 85 c0             	test   %rax,%rax
  80249a:	75 07                	jne    8024a3 <write+0xb9>
  80249c:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8024a1:	eb 19                	jmp    8024bc <write+0xd2>
  8024a3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8024a7:	48 8b 40 18          	mov    0x18(%rax),%rax
  8024ab:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8024af:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8024b3:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  8024b7:	48 89 cf             	mov    %rcx,%rdi
  8024ba:	ff d0                	callq  *%rax
  8024bc:	c9                   	leaveq 
  8024bd:	c3                   	retq   

00000000008024be <seek>:
  8024be:	55                   	push   %rbp
  8024bf:	48 89 e5             	mov    %rsp,%rbp
  8024c2:	48 83 ec 18          	sub    $0x18,%rsp
  8024c6:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8024c9:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8024cc:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8024d0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8024d3:	48 89 d6             	mov    %rdx,%rsi
  8024d6:	89 c7                	mov    %eax,%edi
  8024d8:	48 b8 6e 1e 80 00 00 	movabs $0x801e6e,%rax
  8024df:	00 00 00 
  8024e2:	ff d0                	callq  *%rax
  8024e4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8024e7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8024eb:	79 05                	jns    8024f2 <seek+0x34>
  8024ed:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024f0:	eb 0f                	jmp    802501 <seek+0x43>
  8024f2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8024f6:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8024f9:	89 50 04             	mov    %edx,0x4(%rax)
  8024fc:	b8 00 00 00 00       	mov    $0x0,%eax
  802501:	c9                   	leaveq 
  802502:	c3                   	retq   

0000000000802503 <ftruncate>:
  802503:	55                   	push   %rbp
  802504:	48 89 e5             	mov    %rsp,%rbp
  802507:	48 83 ec 30          	sub    $0x30,%rsp
  80250b:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80250e:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802511:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802515:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802518:	48 89 d6             	mov    %rdx,%rsi
  80251b:	89 c7                	mov    %eax,%edi
  80251d:	48 b8 6e 1e 80 00 00 	movabs $0x801e6e,%rax
  802524:	00 00 00 
  802527:	ff d0                	callq  *%rax
  802529:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80252c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802530:	78 24                	js     802556 <ftruncate+0x53>
  802532:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802536:	8b 00                	mov    (%rax),%eax
  802538:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80253c:	48 89 d6             	mov    %rdx,%rsi
  80253f:	89 c7                	mov    %eax,%edi
  802541:	48 b8 c7 1f 80 00 00 	movabs $0x801fc7,%rax
  802548:	00 00 00 
  80254b:	ff d0                	callq  *%rax
  80254d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802550:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802554:	79 05                	jns    80255b <ftruncate+0x58>
  802556:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802559:	eb 72                	jmp    8025cd <ftruncate+0xca>
  80255b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80255f:	8b 40 08             	mov    0x8(%rax),%eax
  802562:	83 e0 03             	and    $0x3,%eax
  802565:	85 c0                	test   %eax,%eax
  802567:	75 3a                	jne    8025a3 <ftruncate+0xa0>
  802569:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802570:	00 00 00 
  802573:	48 8b 00             	mov    (%rax),%rax
  802576:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80257c:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80257f:	89 c6                	mov    %eax,%esi
  802581:	48 bf f0 51 80 00 00 	movabs $0x8051f0,%rdi
  802588:	00 00 00 
  80258b:	b8 00 00 00 00       	mov    $0x0,%eax
  802590:	48 b9 c6 03 80 00 00 	movabs $0x8003c6,%rcx
  802597:	00 00 00 
  80259a:	ff d1                	callq  *%rcx
  80259c:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8025a1:	eb 2a                	jmp    8025cd <ftruncate+0xca>
  8025a3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8025a7:	48 8b 40 30          	mov    0x30(%rax),%rax
  8025ab:	48 85 c0             	test   %rax,%rax
  8025ae:	75 07                	jne    8025b7 <ftruncate+0xb4>
  8025b0:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8025b5:	eb 16                	jmp    8025cd <ftruncate+0xca>
  8025b7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8025bb:	48 8b 40 30          	mov    0x30(%rax),%rax
  8025bf:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8025c3:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  8025c6:	89 ce                	mov    %ecx,%esi
  8025c8:	48 89 d7             	mov    %rdx,%rdi
  8025cb:	ff d0                	callq  *%rax
  8025cd:	c9                   	leaveq 
  8025ce:	c3                   	retq   

00000000008025cf <fstat>:
  8025cf:	55                   	push   %rbp
  8025d0:	48 89 e5             	mov    %rsp,%rbp
  8025d3:	48 83 ec 30          	sub    $0x30,%rsp
  8025d7:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8025da:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8025de:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8025e2:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8025e5:	48 89 d6             	mov    %rdx,%rsi
  8025e8:	89 c7                	mov    %eax,%edi
  8025ea:	48 b8 6e 1e 80 00 00 	movabs $0x801e6e,%rax
  8025f1:	00 00 00 
  8025f4:	ff d0                	callq  *%rax
  8025f6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8025f9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8025fd:	78 24                	js     802623 <fstat+0x54>
  8025ff:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802603:	8b 00                	mov    (%rax),%eax
  802605:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802609:	48 89 d6             	mov    %rdx,%rsi
  80260c:	89 c7                	mov    %eax,%edi
  80260e:	48 b8 c7 1f 80 00 00 	movabs $0x801fc7,%rax
  802615:	00 00 00 
  802618:	ff d0                	callq  *%rax
  80261a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80261d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802621:	79 05                	jns    802628 <fstat+0x59>
  802623:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802626:	eb 5e                	jmp    802686 <fstat+0xb7>
  802628:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80262c:	48 8b 40 28          	mov    0x28(%rax),%rax
  802630:	48 85 c0             	test   %rax,%rax
  802633:	75 07                	jne    80263c <fstat+0x6d>
  802635:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80263a:	eb 4a                	jmp    802686 <fstat+0xb7>
  80263c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802640:	c6 00 00             	movb   $0x0,(%rax)
  802643:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802647:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  80264e:	00 00 00 
  802651:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802655:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  80265c:	00 00 00 
  80265f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802663:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802667:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  80266e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802672:	48 8b 40 28          	mov    0x28(%rax),%rax
  802676:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80267a:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  80267e:	48 89 ce             	mov    %rcx,%rsi
  802681:	48 89 d7             	mov    %rdx,%rdi
  802684:	ff d0                	callq  *%rax
  802686:	c9                   	leaveq 
  802687:	c3                   	retq   

0000000000802688 <stat>:
  802688:	55                   	push   %rbp
  802689:	48 89 e5             	mov    %rsp,%rbp
  80268c:	48 83 ec 20          	sub    $0x20,%rsp
  802690:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802694:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802698:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80269c:	be 00 00 00 00       	mov    $0x0,%esi
  8026a1:	48 89 c7             	mov    %rax,%rdi
  8026a4:	48 b8 76 27 80 00 00 	movabs $0x802776,%rax
  8026ab:	00 00 00 
  8026ae:	ff d0                	callq  *%rax
  8026b0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8026b3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8026b7:	79 05                	jns    8026be <stat+0x36>
  8026b9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8026bc:	eb 2f                	jmp    8026ed <stat+0x65>
  8026be:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8026c2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8026c5:	48 89 d6             	mov    %rdx,%rsi
  8026c8:	89 c7                	mov    %eax,%edi
  8026ca:	48 b8 cf 25 80 00 00 	movabs $0x8025cf,%rax
  8026d1:	00 00 00 
  8026d4:	ff d0                	callq  *%rax
  8026d6:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8026d9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8026dc:	89 c7                	mov    %eax,%edi
  8026de:	48 b8 7e 20 80 00 00 	movabs $0x80207e,%rax
  8026e5:	00 00 00 
  8026e8:	ff d0                	callq  *%rax
  8026ea:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8026ed:	c9                   	leaveq 
  8026ee:	c3                   	retq   

00000000008026ef <fsipc>:
  8026ef:	55                   	push   %rbp
  8026f0:	48 89 e5             	mov    %rsp,%rbp
  8026f3:	48 83 ec 10          	sub    $0x10,%rsp
  8026f7:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8026fa:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8026fe:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802705:	00 00 00 
  802708:	8b 00                	mov    (%rax),%eax
  80270a:	85 c0                	test   %eax,%eax
  80270c:	75 1d                	jne    80272b <fsipc+0x3c>
  80270e:	bf 01 00 00 00       	mov    $0x1,%edi
  802713:	48 b8 fc 4a 80 00 00 	movabs $0x804afc,%rax
  80271a:	00 00 00 
  80271d:	ff d0                	callq  *%rax
  80271f:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  802726:	00 00 00 
  802729:	89 02                	mov    %eax,(%rdx)
  80272b:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802732:	00 00 00 
  802735:	8b 00                	mov    (%rax),%eax
  802737:	8b 75 fc             	mov    -0x4(%rbp),%esi
  80273a:	b9 07 00 00 00       	mov    $0x7,%ecx
  80273f:	48 ba 00 90 80 00 00 	movabs $0x809000,%rdx
  802746:	00 00 00 
  802749:	89 c7                	mov    %eax,%edi
  80274b:	48 b8 66 4a 80 00 00 	movabs $0x804a66,%rax
  802752:	00 00 00 
  802755:	ff d0                	callq  *%rax
  802757:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80275b:	ba 00 00 00 00       	mov    $0x0,%edx
  802760:	48 89 c6             	mov    %rax,%rsi
  802763:	bf 00 00 00 00       	mov    $0x0,%edi
  802768:	48 b8 a5 49 80 00 00 	movabs $0x8049a5,%rax
  80276f:	00 00 00 
  802772:	ff d0                	callq  *%rax
  802774:	c9                   	leaveq 
  802775:	c3                   	retq   

0000000000802776 <open>:
  802776:	55                   	push   %rbp
  802777:	48 89 e5             	mov    %rsp,%rbp
  80277a:	48 83 ec 20          	sub    $0x20,%rsp
  80277e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802782:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  802785:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802789:	48 89 c7             	mov    %rax,%rdi
  80278c:	48 b8 0f 0f 80 00 00 	movabs $0x800f0f,%rax
  802793:	00 00 00 
  802796:	ff d0                	callq  *%rax
  802798:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  80279d:	7e 0a                	jle    8027a9 <open+0x33>
  80279f:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  8027a4:	e9 a5 00 00 00       	jmpq   80284e <open+0xd8>
  8027a9:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8027ad:	48 89 c7             	mov    %rax,%rdi
  8027b0:	48 b8 d6 1d 80 00 00 	movabs $0x801dd6,%rax
  8027b7:	00 00 00 
  8027ba:	ff d0                	callq  *%rax
  8027bc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8027bf:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8027c3:	79 08                	jns    8027cd <open+0x57>
  8027c5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8027c8:	e9 81 00 00 00       	jmpq   80284e <open+0xd8>
  8027cd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8027d1:	48 89 c6             	mov    %rax,%rsi
  8027d4:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  8027db:	00 00 00 
  8027de:	48 b8 7b 0f 80 00 00 	movabs $0x800f7b,%rax
  8027e5:	00 00 00 
  8027e8:	ff d0                	callq  *%rax
  8027ea:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8027f1:	00 00 00 
  8027f4:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8027f7:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  8027fd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802801:	48 89 c6             	mov    %rax,%rsi
  802804:	bf 01 00 00 00       	mov    $0x1,%edi
  802809:	48 b8 ef 26 80 00 00 	movabs $0x8026ef,%rax
  802810:	00 00 00 
  802813:	ff d0                	callq  *%rax
  802815:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802818:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80281c:	79 1d                	jns    80283b <open+0xc5>
  80281e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802822:	be 00 00 00 00       	mov    $0x0,%esi
  802827:	48 89 c7             	mov    %rax,%rdi
  80282a:	48 b8 fe 1e 80 00 00 	movabs $0x801efe,%rax
  802831:	00 00 00 
  802834:	ff d0                	callq  *%rax
  802836:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802839:	eb 13                	jmp    80284e <open+0xd8>
  80283b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80283f:	48 89 c7             	mov    %rax,%rdi
  802842:	48 b8 88 1d 80 00 00 	movabs $0x801d88,%rax
  802849:	00 00 00 
  80284c:	ff d0                	callq  *%rax
  80284e:	c9                   	leaveq 
  80284f:	c3                   	retq   

0000000000802850 <devfile_flush>:
  802850:	55                   	push   %rbp
  802851:	48 89 e5             	mov    %rsp,%rbp
  802854:	48 83 ec 10          	sub    $0x10,%rsp
  802858:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80285c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802860:	8b 50 0c             	mov    0xc(%rax),%edx
  802863:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80286a:	00 00 00 
  80286d:	89 10                	mov    %edx,(%rax)
  80286f:	be 00 00 00 00       	mov    $0x0,%esi
  802874:	bf 06 00 00 00       	mov    $0x6,%edi
  802879:	48 b8 ef 26 80 00 00 	movabs $0x8026ef,%rax
  802880:	00 00 00 
  802883:	ff d0                	callq  *%rax
  802885:	c9                   	leaveq 
  802886:	c3                   	retq   

0000000000802887 <devfile_read>:
  802887:	55                   	push   %rbp
  802888:	48 89 e5             	mov    %rsp,%rbp
  80288b:	48 83 ec 30          	sub    $0x30,%rsp
  80288f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802893:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802897:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80289b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80289f:	8b 50 0c             	mov    0xc(%rax),%edx
  8028a2:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8028a9:	00 00 00 
  8028ac:	89 10                	mov    %edx,(%rax)
  8028ae:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8028b5:	00 00 00 
  8028b8:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8028bc:	48 89 50 08          	mov    %rdx,0x8(%rax)
  8028c0:	be 00 00 00 00       	mov    $0x0,%esi
  8028c5:	bf 03 00 00 00       	mov    $0x3,%edi
  8028ca:	48 b8 ef 26 80 00 00 	movabs $0x8026ef,%rax
  8028d1:	00 00 00 
  8028d4:	ff d0                	callq  *%rax
  8028d6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8028d9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8028dd:	79 08                	jns    8028e7 <devfile_read+0x60>
  8028df:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8028e2:	e9 a4 00 00 00       	jmpq   80298b <devfile_read+0x104>
  8028e7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8028ea:	48 98                	cltq   
  8028ec:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8028f0:	76 35                	jbe    802927 <devfile_read+0xa0>
  8028f2:	48 b9 16 52 80 00 00 	movabs $0x805216,%rcx
  8028f9:	00 00 00 
  8028fc:	48 ba 1d 52 80 00 00 	movabs $0x80521d,%rdx
  802903:	00 00 00 
  802906:	be 89 00 00 00       	mov    $0x89,%esi
  80290b:	48 bf 32 52 80 00 00 	movabs $0x805232,%rdi
  802912:	00 00 00 
  802915:	b8 00 00 00 00       	mov    $0x0,%eax
  80291a:	49 b8 8d 01 80 00 00 	movabs $0x80018d,%r8
  802921:	00 00 00 
  802924:	41 ff d0             	callq  *%r8
  802927:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  80292e:	7e 35                	jle    802965 <devfile_read+0xde>
  802930:	48 b9 40 52 80 00 00 	movabs $0x805240,%rcx
  802937:	00 00 00 
  80293a:	48 ba 1d 52 80 00 00 	movabs $0x80521d,%rdx
  802941:	00 00 00 
  802944:	be 8a 00 00 00       	mov    $0x8a,%esi
  802949:	48 bf 32 52 80 00 00 	movabs $0x805232,%rdi
  802950:	00 00 00 
  802953:	b8 00 00 00 00       	mov    $0x0,%eax
  802958:	49 b8 8d 01 80 00 00 	movabs $0x80018d,%r8
  80295f:	00 00 00 
  802962:	41 ff d0             	callq  *%r8
  802965:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802968:	48 63 d0             	movslq %eax,%rdx
  80296b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80296f:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  802976:	00 00 00 
  802979:	48 89 c7             	mov    %rax,%rdi
  80297c:	48 b8 9f 12 80 00 00 	movabs $0x80129f,%rax
  802983:	00 00 00 
  802986:	ff d0                	callq  *%rax
  802988:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80298b:	c9                   	leaveq 
  80298c:	c3                   	retq   

000000000080298d <devfile_write>:
  80298d:	55                   	push   %rbp
  80298e:	48 89 e5             	mov    %rsp,%rbp
  802991:	48 83 ec 40          	sub    $0x40,%rsp
  802995:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802999:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80299d:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8029a1:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8029a5:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8029a9:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  8029b0:	00 
  8029b1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8029b5:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  8029b9:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  8029be:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  8029c2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8029c6:	8b 50 0c             	mov    0xc(%rax),%edx
  8029c9:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8029d0:	00 00 00 
  8029d3:	89 10                	mov    %edx,(%rax)
  8029d5:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8029dc:	00 00 00 
  8029df:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8029e3:	48 89 50 08          	mov    %rdx,0x8(%rax)
  8029e7:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8029eb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8029ef:	48 89 c6             	mov    %rax,%rsi
  8029f2:	48 bf 10 90 80 00 00 	movabs $0x809010,%rdi
  8029f9:	00 00 00 
  8029fc:	48 b8 9f 12 80 00 00 	movabs $0x80129f,%rax
  802a03:	00 00 00 
  802a06:	ff d0                	callq  *%rax
  802a08:	be 00 00 00 00       	mov    $0x0,%esi
  802a0d:	bf 04 00 00 00       	mov    $0x4,%edi
  802a12:	48 b8 ef 26 80 00 00 	movabs $0x8026ef,%rax
  802a19:	00 00 00 
  802a1c:	ff d0                	callq  *%rax
  802a1e:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802a21:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802a25:	79 05                	jns    802a2c <devfile_write+0x9f>
  802a27:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802a2a:	eb 43                	jmp    802a6f <devfile_write+0xe2>
  802a2c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802a2f:	48 98                	cltq   
  802a31:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  802a35:	76 35                	jbe    802a6c <devfile_write+0xdf>
  802a37:	48 b9 16 52 80 00 00 	movabs $0x805216,%rcx
  802a3e:	00 00 00 
  802a41:	48 ba 1d 52 80 00 00 	movabs $0x80521d,%rdx
  802a48:	00 00 00 
  802a4b:	be a8 00 00 00       	mov    $0xa8,%esi
  802a50:	48 bf 32 52 80 00 00 	movabs $0x805232,%rdi
  802a57:	00 00 00 
  802a5a:	b8 00 00 00 00       	mov    $0x0,%eax
  802a5f:	49 b8 8d 01 80 00 00 	movabs $0x80018d,%r8
  802a66:	00 00 00 
  802a69:	41 ff d0             	callq  *%r8
  802a6c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802a6f:	c9                   	leaveq 
  802a70:	c3                   	retq   

0000000000802a71 <devfile_stat>:
  802a71:	55                   	push   %rbp
  802a72:	48 89 e5             	mov    %rsp,%rbp
  802a75:	48 83 ec 20          	sub    $0x20,%rsp
  802a79:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802a7d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802a81:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802a85:	8b 50 0c             	mov    0xc(%rax),%edx
  802a88:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802a8f:	00 00 00 
  802a92:	89 10                	mov    %edx,(%rax)
  802a94:	be 00 00 00 00       	mov    $0x0,%esi
  802a99:	bf 05 00 00 00       	mov    $0x5,%edi
  802a9e:	48 b8 ef 26 80 00 00 	movabs $0x8026ef,%rax
  802aa5:	00 00 00 
  802aa8:	ff d0                	callq  *%rax
  802aaa:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802aad:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ab1:	79 05                	jns    802ab8 <devfile_stat+0x47>
  802ab3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ab6:	eb 56                	jmp    802b0e <devfile_stat+0x9d>
  802ab8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802abc:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  802ac3:	00 00 00 
  802ac6:	48 89 c7             	mov    %rax,%rdi
  802ac9:	48 b8 7b 0f 80 00 00 	movabs $0x800f7b,%rax
  802ad0:	00 00 00 
  802ad3:	ff d0                	callq  *%rax
  802ad5:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802adc:	00 00 00 
  802adf:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  802ae5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802ae9:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  802aef:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802af6:	00 00 00 
  802af9:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  802aff:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802b03:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  802b09:	b8 00 00 00 00       	mov    $0x0,%eax
  802b0e:	c9                   	leaveq 
  802b0f:	c3                   	retq   

0000000000802b10 <devfile_trunc>:
  802b10:	55                   	push   %rbp
  802b11:	48 89 e5             	mov    %rsp,%rbp
  802b14:	48 83 ec 10          	sub    $0x10,%rsp
  802b18:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802b1c:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802b1f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802b23:	8b 50 0c             	mov    0xc(%rax),%edx
  802b26:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802b2d:	00 00 00 
  802b30:	89 10                	mov    %edx,(%rax)
  802b32:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802b39:	00 00 00 
  802b3c:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802b3f:	89 50 04             	mov    %edx,0x4(%rax)
  802b42:	be 00 00 00 00       	mov    $0x0,%esi
  802b47:	bf 02 00 00 00       	mov    $0x2,%edi
  802b4c:	48 b8 ef 26 80 00 00 	movabs $0x8026ef,%rax
  802b53:	00 00 00 
  802b56:	ff d0                	callq  *%rax
  802b58:	c9                   	leaveq 
  802b59:	c3                   	retq   

0000000000802b5a <remove>:
  802b5a:	55                   	push   %rbp
  802b5b:	48 89 e5             	mov    %rsp,%rbp
  802b5e:	48 83 ec 10          	sub    $0x10,%rsp
  802b62:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802b66:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802b6a:	48 89 c7             	mov    %rax,%rdi
  802b6d:	48 b8 0f 0f 80 00 00 	movabs $0x800f0f,%rax
  802b74:	00 00 00 
  802b77:	ff d0                	callq  *%rax
  802b79:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802b7e:	7e 07                	jle    802b87 <remove+0x2d>
  802b80:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802b85:	eb 33                	jmp    802bba <remove+0x60>
  802b87:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802b8b:	48 89 c6             	mov    %rax,%rsi
  802b8e:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  802b95:	00 00 00 
  802b98:	48 b8 7b 0f 80 00 00 	movabs $0x800f7b,%rax
  802b9f:	00 00 00 
  802ba2:	ff d0                	callq  *%rax
  802ba4:	be 00 00 00 00       	mov    $0x0,%esi
  802ba9:	bf 07 00 00 00       	mov    $0x7,%edi
  802bae:	48 b8 ef 26 80 00 00 	movabs $0x8026ef,%rax
  802bb5:	00 00 00 
  802bb8:	ff d0                	callq  *%rax
  802bba:	c9                   	leaveq 
  802bbb:	c3                   	retq   

0000000000802bbc <sync>:
  802bbc:	55                   	push   %rbp
  802bbd:	48 89 e5             	mov    %rsp,%rbp
  802bc0:	be 00 00 00 00       	mov    $0x0,%esi
  802bc5:	bf 08 00 00 00       	mov    $0x8,%edi
  802bca:	48 b8 ef 26 80 00 00 	movabs $0x8026ef,%rax
  802bd1:	00 00 00 
  802bd4:	ff d0                	callq  *%rax
  802bd6:	5d                   	pop    %rbp
  802bd7:	c3                   	retq   

0000000000802bd8 <copy>:
  802bd8:	55                   	push   %rbp
  802bd9:	48 89 e5             	mov    %rsp,%rbp
  802bdc:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  802be3:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  802bea:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  802bf1:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  802bf8:	be 00 00 00 00       	mov    $0x0,%esi
  802bfd:	48 89 c7             	mov    %rax,%rdi
  802c00:	48 b8 76 27 80 00 00 	movabs $0x802776,%rax
  802c07:	00 00 00 
  802c0a:	ff d0                	callq  *%rax
  802c0c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c0f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c13:	79 28                	jns    802c3d <copy+0x65>
  802c15:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c18:	89 c6                	mov    %eax,%esi
  802c1a:	48 bf 4c 52 80 00 00 	movabs $0x80524c,%rdi
  802c21:	00 00 00 
  802c24:	b8 00 00 00 00       	mov    $0x0,%eax
  802c29:	48 ba c6 03 80 00 00 	movabs $0x8003c6,%rdx
  802c30:	00 00 00 
  802c33:	ff d2                	callq  *%rdx
  802c35:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c38:	e9 74 01 00 00       	jmpq   802db1 <copy+0x1d9>
  802c3d:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  802c44:	be 01 01 00 00       	mov    $0x101,%esi
  802c49:	48 89 c7             	mov    %rax,%rdi
  802c4c:	48 b8 76 27 80 00 00 	movabs $0x802776,%rax
  802c53:	00 00 00 
  802c56:	ff d0                	callq  *%rax
  802c58:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802c5b:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802c5f:	79 39                	jns    802c9a <copy+0xc2>
  802c61:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802c64:	89 c6                	mov    %eax,%esi
  802c66:	48 bf 62 52 80 00 00 	movabs $0x805262,%rdi
  802c6d:	00 00 00 
  802c70:	b8 00 00 00 00       	mov    $0x0,%eax
  802c75:	48 ba c6 03 80 00 00 	movabs $0x8003c6,%rdx
  802c7c:	00 00 00 
  802c7f:	ff d2                	callq  *%rdx
  802c81:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c84:	89 c7                	mov    %eax,%edi
  802c86:	48 b8 7e 20 80 00 00 	movabs $0x80207e,%rax
  802c8d:	00 00 00 
  802c90:	ff d0                	callq  *%rax
  802c92:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802c95:	e9 17 01 00 00       	jmpq   802db1 <copy+0x1d9>
  802c9a:	eb 74                	jmp    802d10 <copy+0x138>
  802c9c:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802c9f:	48 63 d0             	movslq %eax,%rdx
  802ca2:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802ca9:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802cac:	48 89 ce             	mov    %rcx,%rsi
  802caf:	89 c7                	mov    %eax,%edi
  802cb1:	48 b8 ea 23 80 00 00 	movabs $0x8023ea,%rax
  802cb8:	00 00 00 
  802cbb:	ff d0                	callq  *%rax
  802cbd:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802cc0:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802cc4:	79 4a                	jns    802d10 <copy+0x138>
  802cc6:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802cc9:	89 c6                	mov    %eax,%esi
  802ccb:	48 bf 7c 52 80 00 00 	movabs $0x80527c,%rdi
  802cd2:	00 00 00 
  802cd5:	b8 00 00 00 00       	mov    $0x0,%eax
  802cda:	48 ba c6 03 80 00 00 	movabs $0x8003c6,%rdx
  802ce1:	00 00 00 
  802ce4:	ff d2                	callq  *%rdx
  802ce6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ce9:	89 c7                	mov    %eax,%edi
  802ceb:	48 b8 7e 20 80 00 00 	movabs $0x80207e,%rax
  802cf2:	00 00 00 
  802cf5:	ff d0                	callq  *%rax
  802cf7:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802cfa:	89 c7                	mov    %eax,%edi
  802cfc:	48 b8 7e 20 80 00 00 	movabs $0x80207e,%rax
  802d03:	00 00 00 
  802d06:	ff d0                	callq  *%rax
  802d08:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802d0b:	e9 a1 00 00 00       	jmpq   802db1 <copy+0x1d9>
  802d10:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802d17:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d1a:	ba 00 02 00 00       	mov    $0x200,%edx
  802d1f:	48 89 ce             	mov    %rcx,%rsi
  802d22:	89 c7                	mov    %eax,%edi
  802d24:	48 b8 a0 22 80 00 00 	movabs $0x8022a0,%rax
  802d2b:	00 00 00 
  802d2e:	ff d0                	callq  *%rax
  802d30:	89 45 f4             	mov    %eax,-0xc(%rbp)
  802d33:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802d37:	0f 8f 5f ff ff ff    	jg     802c9c <copy+0xc4>
  802d3d:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802d41:	79 47                	jns    802d8a <copy+0x1b2>
  802d43:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802d46:	89 c6                	mov    %eax,%esi
  802d48:	48 bf 8f 52 80 00 00 	movabs $0x80528f,%rdi
  802d4f:	00 00 00 
  802d52:	b8 00 00 00 00       	mov    $0x0,%eax
  802d57:	48 ba c6 03 80 00 00 	movabs $0x8003c6,%rdx
  802d5e:	00 00 00 
  802d61:	ff d2                	callq  *%rdx
  802d63:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d66:	89 c7                	mov    %eax,%edi
  802d68:	48 b8 7e 20 80 00 00 	movabs $0x80207e,%rax
  802d6f:	00 00 00 
  802d72:	ff d0                	callq  *%rax
  802d74:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802d77:	89 c7                	mov    %eax,%edi
  802d79:	48 b8 7e 20 80 00 00 	movabs $0x80207e,%rax
  802d80:	00 00 00 
  802d83:	ff d0                	callq  *%rax
  802d85:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802d88:	eb 27                	jmp    802db1 <copy+0x1d9>
  802d8a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d8d:	89 c7                	mov    %eax,%edi
  802d8f:	48 b8 7e 20 80 00 00 	movabs $0x80207e,%rax
  802d96:	00 00 00 
  802d99:	ff d0                	callq  *%rax
  802d9b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802d9e:	89 c7                	mov    %eax,%edi
  802da0:	48 b8 7e 20 80 00 00 	movabs $0x80207e,%rax
  802da7:	00 00 00 
  802daa:	ff d0                	callq  *%rax
  802dac:	b8 00 00 00 00       	mov    $0x0,%eax
  802db1:	c9                   	leaveq 
  802db2:	c3                   	retq   

0000000000802db3 <spawn>:
  802db3:	55                   	push   %rbp
  802db4:	48 89 e5             	mov    %rsp,%rbp
  802db7:	48 81 ec 10 03 00 00 	sub    $0x310,%rsp
  802dbe:	48 89 bd 08 fd ff ff 	mov    %rdi,-0x2f8(%rbp)
  802dc5:	48 89 b5 00 fd ff ff 	mov    %rsi,-0x300(%rbp)
  802dcc:	48 8b 85 08 fd ff ff 	mov    -0x2f8(%rbp),%rax
  802dd3:	be 00 00 00 00       	mov    $0x0,%esi
  802dd8:	48 89 c7             	mov    %rax,%rdi
  802ddb:	48 b8 76 27 80 00 00 	movabs $0x802776,%rax
  802de2:	00 00 00 
  802de5:	ff d0                	callq  *%rax
  802de7:	89 45 e8             	mov    %eax,-0x18(%rbp)
  802dea:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  802dee:	79 08                	jns    802df8 <spawn+0x45>
  802df0:	8b 45 e8             	mov    -0x18(%rbp),%eax
  802df3:	e9 0c 03 00 00       	jmpq   803104 <spawn+0x351>
  802df8:	8b 45 e8             	mov    -0x18(%rbp),%eax
  802dfb:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  802dfe:	48 8d 85 d0 fd ff ff 	lea    -0x230(%rbp),%rax
  802e05:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  802e09:	48 8d 8d d0 fd ff ff 	lea    -0x230(%rbp),%rcx
  802e10:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  802e13:	ba 00 02 00 00       	mov    $0x200,%edx
  802e18:	48 89 ce             	mov    %rcx,%rsi
  802e1b:	89 c7                	mov    %eax,%edi
  802e1d:	48 b8 75 23 80 00 00 	movabs $0x802375,%rax
  802e24:	00 00 00 
  802e27:	ff d0                	callq  *%rax
  802e29:	3d 00 02 00 00       	cmp    $0x200,%eax
  802e2e:	75 0d                	jne    802e3d <spawn+0x8a>
  802e30:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802e34:	8b 00                	mov    (%rax),%eax
  802e36:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
  802e3b:	74 43                	je     802e80 <spawn+0xcd>
  802e3d:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  802e40:	89 c7                	mov    %eax,%edi
  802e42:	48 b8 7e 20 80 00 00 	movabs $0x80207e,%rax
  802e49:	00 00 00 
  802e4c:	ff d0                	callq  *%rax
  802e4e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802e52:	8b 00                	mov    (%rax),%eax
  802e54:	ba 7f 45 4c 46       	mov    $0x464c457f,%edx
  802e59:	89 c6                	mov    %eax,%esi
  802e5b:	48 bf a8 52 80 00 00 	movabs $0x8052a8,%rdi
  802e62:	00 00 00 
  802e65:	b8 00 00 00 00       	mov    $0x0,%eax
  802e6a:	48 b9 c6 03 80 00 00 	movabs $0x8003c6,%rcx
  802e71:	00 00 00 
  802e74:	ff d1                	callq  *%rcx
  802e76:	b8 f1 ff ff ff       	mov    $0xfffffff1,%eax
  802e7b:	e9 84 02 00 00       	jmpq   803104 <spawn+0x351>
  802e80:	b8 07 00 00 00       	mov    $0x7,%eax
  802e85:	cd 30                	int    $0x30
  802e87:	89 45 d0             	mov    %eax,-0x30(%rbp)
  802e8a:	8b 45 d0             	mov    -0x30(%rbp),%eax
  802e8d:	89 45 e8             	mov    %eax,-0x18(%rbp)
  802e90:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  802e94:	79 08                	jns    802e9e <spawn+0xeb>
  802e96:	8b 45 e8             	mov    -0x18(%rbp),%eax
  802e99:	e9 66 02 00 00       	jmpq   803104 <spawn+0x351>
  802e9e:	8b 45 e8             	mov    -0x18(%rbp),%eax
  802ea1:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  802ea4:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  802ea7:	25 ff 03 00 00       	and    $0x3ff,%eax
  802eac:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  802eb3:	00 00 00 
  802eb6:	48 98                	cltq   
  802eb8:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  802ebf:	48 01 d0             	add    %rdx,%rax
  802ec2:	48 8d 95 10 fd ff ff 	lea    -0x2f0(%rbp),%rdx
  802ec9:	48 89 c6             	mov    %rax,%rsi
  802ecc:	b8 18 00 00 00       	mov    $0x18,%eax
  802ed1:	48 89 d7             	mov    %rdx,%rdi
  802ed4:	48 89 c1             	mov    %rax,%rcx
  802ed7:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
  802eda:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802ede:	48 8b 40 18          	mov    0x18(%rax),%rax
  802ee2:	48 89 85 a8 fd ff ff 	mov    %rax,-0x258(%rbp)
  802ee9:	48 8d 85 10 fd ff ff 	lea    -0x2f0(%rbp),%rax
  802ef0:	48 8d 90 b0 00 00 00 	lea    0xb0(%rax),%rdx
  802ef7:	48 8b 8d 00 fd ff ff 	mov    -0x300(%rbp),%rcx
  802efe:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  802f01:	48 89 ce             	mov    %rcx,%rsi
  802f04:	89 c7                	mov    %eax,%edi
  802f06:	48 b8 6e 33 80 00 00 	movabs $0x80336e,%rax
  802f0d:	00 00 00 
  802f10:	ff d0                	callq  *%rax
  802f12:	89 45 e8             	mov    %eax,-0x18(%rbp)
  802f15:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  802f19:	79 08                	jns    802f23 <spawn+0x170>
  802f1b:	8b 45 e8             	mov    -0x18(%rbp),%eax
  802f1e:	e9 e1 01 00 00       	jmpq   803104 <spawn+0x351>
  802f23:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802f27:	48 8b 40 20          	mov    0x20(%rax),%rax
  802f2b:	48 8d 95 d0 fd ff ff 	lea    -0x230(%rbp),%rdx
  802f32:	48 01 d0             	add    %rdx,%rax
  802f35:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802f39:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802f40:	e9 a3 00 00 00       	jmpq   802fe8 <spawn+0x235>
  802f45:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f49:	8b 00                	mov    (%rax),%eax
  802f4b:	83 f8 01             	cmp    $0x1,%eax
  802f4e:	74 05                	je     802f55 <spawn+0x1a2>
  802f50:	e9 8a 00 00 00       	jmpq   802fdf <spawn+0x22c>
  802f55:	c7 45 ec 05 00 00 00 	movl   $0x5,-0x14(%rbp)
  802f5c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f60:	8b 40 04             	mov    0x4(%rax),%eax
  802f63:	83 e0 02             	and    $0x2,%eax
  802f66:	85 c0                	test   %eax,%eax
  802f68:	74 04                	je     802f6e <spawn+0x1bb>
  802f6a:	83 4d ec 02          	orl    $0x2,-0x14(%rbp)
  802f6e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f72:	48 8b 40 08          	mov    0x8(%rax),%rax
  802f76:	41 89 c1             	mov    %eax,%r9d
  802f79:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f7d:	4c 8b 40 20          	mov    0x20(%rax),%r8
  802f81:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f85:	48 8b 50 28          	mov    0x28(%rax),%rdx
  802f89:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f8d:	48 8b 70 10          	mov    0x10(%rax),%rsi
  802f91:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  802f94:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  802f97:	8b 7d ec             	mov    -0x14(%rbp),%edi
  802f9a:	89 3c 24             	mov    %edi,(%rsp)
  802f9d:	89 c7                	mov    %eax,%edi
  802f9f:	48 b8 17 36 80 00 00 	movabs $0x803617,%rax
  802fa6:	00 00 00 
  802fa9:	ff d0                	callq  *%rax
  802fab:	89 45 e8             	mov    %eax,-0x18(%rbp)
  802fae:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  802fb2:	79 2b                	jns    802fdf <spawn+0x22c>
  802fb4:	90                   	nop
  802fb5:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  802fb8:	89 c7                	mov    %eax,%edi
  802fba:	48 b8 ea 17 80 00 00 	movabs $0x8017ea,%rax
  802fc1:	00 00 00 
  802fc4:	ff d0                	callq  *%rax
  802fc6:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  802fc9:	89 c7                	mov    %eax,%edi
  802fcb:	48 b8 7e 20 80 00 00 	movabs $0x80207e,%rax
  802fd2:	00 00 00 
  802fd5:	ff d0                	callq  *%rax
  802fd7:	8b 45 e8             	mov    -0x18(%rbp),%eax
  802fda:	e9 25 01 00 00       	jmpq   803104 <spawn+0x351>
  802fdf:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802fe3:	48 83 45 f0 38       	addq   $0x38,-0x10(%rbp)
  802fe8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802fec:	0f b7 40 38          	movzwl 0x38(%rax),%eax
  802ff0:	0f b7 c0             	movzwl %ax,%eax
  802ff3:	3b 45 fc             	cmp    -0x4(%rbp),%eax
  802ff6:	0f 8f 49 ff ff ff    	jg     802f45 <spawn+0x192>
  802ffc:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  802fff:	89 c7                	mov    %eax,%edi
  803001:	48 b8 7e 20 80 00 00 	movabs $0x80207e,%rax
  803008:	00 00 00 
  80300b:	ff d0                	callq  *%rax
  80300d:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%rbp)
  803014:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  803017:	89 c7                	mov    %eax,%edi
  803019:	48 b8 03 38 80 00 00 	movabs $0x803803,%rax
  803020:	00 00 00 
  803023:	ff d0                	callq  *%rax
  803025:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803028:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  80302c:	79 30                	jns    80305e <spawn+0x2ab>
  80302e:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803031:	89 c1                	mov    %eax,%ecx
  803033:	48 ba c2 52 80 00 00 	movabs $0x8052c2,%rdx
  80303a:	00 00 00 
  80303d:	be 86 00 00 00       	mov    $0x86,%esi
  803042:	48 bf d8 52 80 00 00 	movabs $0x8052d8,%rdi
  803049:	00 00 00 
  80304c:	b8 00 00 00 00       	mov    $0x0,%eax
  803051:	49 b8 8d 01 80 00 00 	movabs $0x80018d,%r8
  803058:	00 00 00 
  80305b:	41 ff d0             	callq  *%r8
  80305e:	48 8d 95 10 fd ff ff 	lea    -0x2f0(%rbp),%rdx
  803065:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  803068:	48 89 d6             	mov    %rdx,%rsi
  80306b:	89 c7                	mov    %eax,%edi
  80306d:	48 b8 ea 19 80 00 00 	movabs $0x8019ea,%rax
  803074:	00 00 00 
  803077:	ff d0                	callq  *%rax
  803079:	89 45 e8             	mov    %eax,-0x18(%rbp)
  80307c:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  803080:	79 30                	jns    8030b2 <spawn+0x2ff>
  803082:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803085:	89 c1                	mov    %eax,%ecx
  803087:	48 ba e7 52 80 00 00 	movabs $0x8052e7,%rdx
  80308e:	00 00 00 
  803091:	be 8a 00 00 00       	mov    $0x8a,%esi
  803096:	48 bf d8 52 80 00 00 	movabs $0x8052d8,%rdi
  80309d:	00 00 00 
  8030a0:	b8 00 00 00 00       	mov    $0x0,%eax
  8030a5:	49 b8 8d 01 80 00 00 	movabs $0x80018d,%r8
  8030ac:	00 00 00 
  8030af:	41 ff d0             	callq  *%r8
  8030b2:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  8030b5:	be 02 00 00 00       	mov    $0x2,%esi
  8030ba:	89 c7                	mov    %eax,%edi
  8030bc:	48 b8 9f 19 80 00 00 	movabs $0x80199f,%rax
  8030c3:	00 00 00 
  8030c6:	ff d0                	callq  *%rax
  8030c8:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8030cb:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  8030cf:	79 30                	jns    803101 <spawn+0x34e>
  8030d1:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8030d4:	89 c1                	mov    %eax,%ecx
  8030d6:	48 ba 01 53 80 00 00 	movabs $0x805301,%rdx
  8030dd:	00 00 00 
  8030e0:	be 8d 00 00 00       	mov    $0x8d,%esi
  8030e5:	48 bf d8 52 80 00 00 	movabs $0x8052d8,%rdi
  8030ec:	00 00 00 
  8030ef:	b8 00 00 00 00       	mov    $0x0,%eax
  8030f4:	49 b8 8d 01 80 00 00 	movabs $0x80018d,%r8
  8030fb:	00 00 00 
  8030fe:	41 ff d0             	callq  *%r8
  803101:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  803104:	c9                   	leaveq 
  803105:	c3                   	retq   

0000000000803106 <spawnl>:
  803106:	55                   	push   %rbp
  803107:	48 89 e5             	mov    %rsp,%rbp
  80310a:	41 55                	push   %r13
  80310c:	41 54                	push   %r12
  80310e:	53                   	push   %rbx
  80310f:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  803116:	48 89 bd f8 fe ff ff 	mov    %rdi,-0x108(%rbp)
  80311d:	48 89 95 40 ff ff ff 	mov    %rdx,-0xc0(%rbp)
  803124:	48 89 8d 48 ff ff ff 	mov    %rcx,-0xb8(%rbp)
  80312b:	4c 89 85 50 ff ff ff 	mov    %r8,-0xb0(%rbp)
  803132:	4c 89 8d 58 ff ff ff 	mov    %r9,-0xa8(%rbp)
  803139:	84 c0                	test   %al,%al
  80313b:	74 26                	je     803163 <spawnl+0x5d>
  80313d:	0f 29 85 60 ff ff ff 	movaps %xmm0,-0xa0(%rbp)
  803144:	0f 29 8d 70 ff ff ff 	movaps %xmm1,-0x90(%rbp)
  80314b:	0f 29 55 80          	movaps %xmm2,-0x80(%rbp)
  80314f:	0f 29 5d 90          	movaps %xmm3,-0x70(%rbp)
  803153:	0f 29 65 a0          	movaps %xmm4,-0x60(%rbp)
  803157:	0f 29 6d b0          	movaps %xmm5,-0x50(%rbp)
  80315b:	0f 29 75 c0          	movaps %xmm6,-0x40(%rbp)
  80315f:	0f 29 7d d0          	movaps %xmm7,-0x30(%rbp)
  803163:	48 89 b5 f0 fe ff ff 	mov    %rsi,-0x110(%rbp)
  80316a:	c7 85 2c ff ff ff 00 	movl   $0x0,-0xd4(%rbp)
  803171:	00 00 00 
  803174:	c7 85 00 ff ff ff 10 	movl   $0x10,-0x100(%rbp)
  80317b:	00 00 00 
  80317e:	c7 85 04 ff ff ff 30 	movl   $0x30,-0xfc(%rbp)
  803185:	00 00 00 
  803188:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80318c:	48 89 85 08 ff ff ff 	mov    %rax,-0xf8(%rbp)
  803193:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
  80319a:	48 89 85 10 ff ff ff 	mov    %rax,-0xf0(%rbp)
  8031a1:	eb 07                	jmp    8031aa <spawnl+0xa4>
  8031a3:	83 85 2c ff ff ff 01 	addl   $0x1,-0xd4(%rbp)
  8031aa:	8b 85 00 ff ff ff    	mov    -0x100(%rbp),%eax
  8031b0:	83 f8 30             	cmp    $0x30,%eax
  8031b3:	73 23                	jae    8031d8 <spawnl+0xd2>
  8031b5:	48 8b 95 10 ff ff ff 	mov    -0xf0(%rbp),%rdx
  8031bc:	8b 85 00 ff ff ff    	mov    -0x100(%rbp),%eax
  8031c2:	89 c0                	mov    %eax,%eax
  8031c4:	48 01 d0             	add    %rdx,%rax
  8031c7:	8b 95 00 ff ff ff    	mov    -0x100(%rbp),%edx
  8031cd:	83 c2 08             	add    $0x8,%edx
  8031d0:	89 95 00 ff ff ff    	mov    %edx,-0x100(%rbp)
  8031d6:	eb 15                	jmp    8031ed <spawnl+0xe7>
  8031d8:	48 8b 95 08 ff ff ff 	mov    -0xf8(%rbp),%rdx
  8031df:	48 89 d0             	mov    %rdx,%rax
  8031e2:	48 83 c2 08          	add    $0x8,%rdx
  8031e6:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  8031ed:	48 8b 00             	mov    (%rax),%rax
  8031f0:	48 85 c0             	test   %rax,%rax
  8031f3:	75 ae                	jne    8031a3 <spawnl+0x9d>
  8031f5:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  8031fb:	83 c0 02             	add    $0x2,%eax
  8031fe:	48 89 e2             	mov    %rsp,%rdx
  803201:	48 89 d3             	mov    %rdx,%rbx
  803204:	48 63 d0             	movslq %eax,%rdx
  803207:	48 83 ea 01          	sub    $0x1,%rdx
  80320b:	48 89 95 20 ff ff ff 	mov    %rdx,-0xe0(%rbp)
  803212:	48 63 d0             	movslq %eax,%rdx
  803215:	49 89 d4             	mov    %rdx,%r12
  803218:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  80321e:	48 63 d0             	movslq %eax,%rdx
  803221:	49 89 d2             	mov    %rdx,%r10
  803224:	41 bb 00 00 00 00    	mov    $0x0,%r11d
  80322a:	48 98                	cltq   
  80322c:	48 c1 e0 03          	shl    $0x3,%rax
  803230:	48 8d 50 07          	lea    0x7(%rax),%rdx
  803234:	b8 10 00 00 00       	mov    $0x10,%eax
  803239:	48 83 e8 01          	sub    $0x1,%rax
  80323d:	48 01 d0             	add    %rdx,%rax
  803240:	bf 10 00 00 00       	mov    $0x10,%edi
  803245:	ba 00 00 00 00       	mov    $0x0,%edx
  80324a:	48 f7 f7             	div    %rdi
  80324d:	48 6b c0 10          	imul   $0x10,%rax,%rax
  803251:	48 29 c4             	sub    %rax,%rsp
  803254:	48 89 e0             	mov    %rsp,%rax
  803257:	48 83 c0 07          	add    $0x7,%rax
  80325b:	48 c1 e8 03          	shr    $0x3,%rax
  80325f:	48 c1 e0 03          	shl    $0x3,%rax
  803263:	48 89 85 18 ff ff ff 	mov    %rax,-0xe8(%rbp)
  80326a:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  803271:	48 8b 95 f0 fe ff ff 	mov    -0x110(%rbp),%rdx
  803278:	48 89 10             	mov    %rdx,(%rax)
  80327b:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  803281:	8d 50 01             	lea    0x1(%rax),%edx
  803284:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  80328b:	48 63 d2             	movslq %edx,%rdx
  80328e:	48 c7 04 d0 00 00 00 	movq   $0x0,(%rax,%rdx,8)
  803295:	00 
  803296:	c7 85 00 ff ff ff 10 	movl   $0x10,-0x100(%rbp)
  80329d:	00 00 00 
  8032a0:	c7 85 04 ff ff ff 30 	movl   $0x30,-0xfc(%rbp)
  8032a7:	00 00 00 
  8032aa:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8032ae:	48 89 85 08 ff ff ff 	mov    %rax,-0xf8(%rbp)
  8032b5:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
  8032bc:	48 89 85 10 ff ff ff 	mov    %rax,-0xf0(%rbp)
  8032c3:	c7 85 28 ff ff ff 00 	movl   $0x0,-0xd8(%rbp)
  8032ca:	00 00 00 
  8032cd:	eb 63                	jmp    803332 <spawnl+0x22c>
  8032cf:	8b 85 28 ff ff ff    	mov    -0xd8(%rbp),%eax
  8032d5:	8d 70 01             	lea    0x1(%rax),%esi
  8032d8:	8b 85 00 ff ff ff    	mov    -0x100(%rbp),%eax
  8032de:	83 f8 30             	cmp    $0x30,%eax
  8032e1:	73 23                	jae    803306 <spawnl+0x200>
  8032e3:	48 8b 95 10 ff ff ff 	mov    -0xf0(%rbp),%rdx
  8032ea:	8b 85 00 ff ff ff    	mov    -0x100(%rbp),%eax
  8032f0:	89 c0                	mov    %eax,%eax
  8032f2:	48 01 d0             	add    %rdx,%rax
  8032f5:	8b 95 00 ff ff ff    	mov    -0x100(%rbp),%edx
  8032fb:	83 c2 08             	add    $0x8,%edx
  8032fe:	89 95 00 ff ff ff    	mov    %edx,-0x100(%rbp)
  803304:	eb 15                	jmp    80331b <spawnl+0x215>
  803306:	48 8b 95 08 ff ff ff 	mov    -0xf8(%rbp),%rdx
  80330d:	48 89 d0             	mov    %rdx,%rax
  803310:	48 83 c2 08          	add    $0x8,%rdx
  803314:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  80331b:	48 8b 08             	mov    (%rax),%rcx
  80331e:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  803325:	89 f2                	mov    %esi,%edx
  803327:	48 89 0c d0          	mov    %rcx,(%rax,%rdx,8)
  80332b:	83 85 28 ff ff ff 01 	addl   $0x1,-0xd8(%rbp)
  803332:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  803338:	3b 85 28 ff ff ff    	cmp    -0xd8(%rbp),%eax
  80333e:	77 8f                	ja     8032cf <spawnl+0x1c9>
  803340:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  803347:	48 8b 85 f8 fe ff ff 	mov    -0x108(%rbp),%rax
  80334e:	48 89 d6             	mov    %rdx,%rsi
  803351:	48 89 c7             	mov    %rax,%rdi
  803354:	48 b8 b3 2d 80 00 00 	movabs $0x802db3,%rax
  80335b:	00 00 00 
  80335e:	ff d0                	callq  *%rax
  803360:	48 89 dc             	mov    %rbx,%rsp
  803363:	48 8d 65 e8          	lea    -0x18(%rbp),%rsp
  803367:	5b                   	pop    %rbx
  803368:	41 5c                	pop    %r12
  80336a:	41 5d                	pop    %r13
  80336c:	5d                   	pop    %rbp
  80336d:	c3                   	retq   

000000000080336e <init_stack>:
  80336e:	55                   	push   %rbp
  80336f:	48 89 e5             	mov    %rsp,%rbp
  803372:	48 83 ec 50          	sub    $0x50,%rsp
  803376:	89 7d cc             	mov    %edi,-0x34(%rbp)
  803379:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
  80337d:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  803381:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803388:	00 
  803389:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
  803390:	eb 33                	jmp    8033c5 <init_stack+0x57>
  803392:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803395:	48 98                	cltq   
  803397:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  80339e:	00 
  80339f:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  8033a3:	48 01 d0             	add    %rdx,%rax
  8033a6:	48 8b 00             	mov    (%rax),%rax
  8033a9:	48 89 c7             	mov    %rax,%rdi
  8033ac:	48 b8 0f 0f 80 00 00 	movabs $0x800f0f,%rax
  8033b3:	00 00 00 
  8033b6:	ff d0                	callq  *%rax
  8033b8:	83 c0 01             	add    $0x1,%eax
  8033bb:	48 98                	cltq   
  8033bd:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  8033c1:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
  8033c5:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8033c8:	48 98                	cltq   
  8033ca:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8033d1:	00 
  8033d2:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  8033d6:	48 01 d0             	add    %rdx,%rax
  8033d9:	48 8b 00             	mov    (%rax),%rax
  8033dc:	48 85 c0             	test   %rax,%rax
  8033df:	75 b1                	jne    803392 <init_stack+0x24>
  8033e1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8033e5:	48 f7 d8             	neg    %rax
  8033e8:	48 05 00 10 40 00    	add    $0x401000,%rax
  8033ee:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8033f2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8033f6:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  8033fa:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8033fe:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  803402:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803405:	83 c2 01             	add    $0x1,%edx
  803408:	c1 e2 03             	shl    $0x3,%edx
  80340b:	48 63 d2             	movslq %edx,%rdx
  80340e:	48 f7 da             	neg    %rdx
  803411:	48 01 d0             	add    %rdx,%rax
  803414:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  803418:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80341c:	48 83 e8 10          	sub    $0x10,%rax
  803420:	48 3d ff ff 3f 00    	cmp    $0x3fffff,%rax
  803426:	77 0a                	ja     803432 <init_stack+0xc4>
  803428:	b8 fc ff ff ff       	mov    $0xfffffffc,%eax
  80342d:	e9 e3 01 00 00       	jmpq   803615 <init_stack+0x2a7>
  803432:	ba 07 00 00 00       	mov    $0x7,%edx
  803437:	be 00 00 40 00       	mov    $0x400000,%esi
  80343c:	bf 00 00 00 00       	mov    $0x0,%edi
  803441:	48 b8 aa 18 80 00 00 	movabs $0x8018aa,%rax
  803448:	00 00 00 
  80344b:	ff d0                	callq  *%rax
  80344d:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803450:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803454:	79 08                	jns    80345e <init_stack+0xf0>
  803456:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803459:	e9 b7 01 00 00       	jmpq   803615 <init_stack+0x2a7>
  80345e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
  803465:	e9 8a 00 00 00       	jmpq   8034f4 <init_stack+0x186>
  80346a:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80346d:	48 98                	cltq   
  80346f:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  803476:	00 
  803477:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80347b:	48 01 c2             	add    %rax,%rdx
  80347e:	b9 00 d0 7f ef       	mov    $0xef7fd000,%ecx
  803483:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803487:	48 01 c8             	add    %rcx,%rax
  80348a:	48 2d 00 00 40 00    	sub    $0x400000,%rax
  803490:	48 89 02             	mov    %rax,(%rdx)
  803493:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803496:	48 98                	cltq   
  803498:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  80349f:	00 
  8034a0:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  8034a4:	48 01 d0             	add    %rdx,%rax
  8034a7:	48 8b 10             	mov    (%rax),%rdx
  8034aa:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8034ae:	48 89 d6             	mov    %rdx,%rsi
  8034b1:	48 89 c7             	mov    %rax,%rdi
  8034b4:	48 b8 7b 0f 80 00 00 	movabs $0x800f7b,%rax
  8034bb:	00 00 00 
  8034be:	ff d0                	callq  *%rax
  8034c0:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8034c3:	48 98                	cltq   
  8034c5:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8034cc:	00 
  8034cd:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  8034d1:	48 01 d0             	add    %rdx,%rax
  8034d4:	48 8b 00             	mov    (%rax),%rax
  8034d7:	48 89 c7             	mov    %rax,%rdi
  8034da:	48 b8 0f 0f 80 00 00 	movabs $0x800f0f,%rax
  8034e1:	00 00 00 
  8034e4:	ff d0                	callq  *%rax
  8034e6:	48 98                	cltq   
  8034e8:	48 83 c0 01          	add    $0x1,%rax
  8034ec:	48 01 45 e0          	add    %rax,-0x20(%rbp)
  8034f0:	83 45 f0 01          	addl   $0x1,-0x10(%rbp)
  8034f4:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8034f7:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  8034fa:	0f 8c 6a ff ff ff    	jl     80346a <init_stack+0xfc>
  803500:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803503:	48 98                	cltq   
  803505:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  80350c:	00 
  80350d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803511:	48 01 d0             	add    %rdx,%rax
  803514:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  80351b:	48 81 7d e0 00 10 40 	cmpq   $0x401000,-0x20(%rbp)
  803522:	00 
  803523:	74 35                	je     80355a <init_stack+0x1ec>
  803525:	48 b9 18 53 80 00 00 	movabs $0x805318,%rcx
  80352c:	00 00 00 
  80352f:	48 ba 3e 53 80 00 00 	movabs $0x80533e,%rdx
  803536:	00 00 00 
  803539:	be f6 00 00 00       	mov    $0xf6,%esi
  80353e:	48 bf d8 52 80 00 00 	movabs $0x8052d8,%rdi
  803545:	00 00 00 
  803548:	b8 00 00 00 00       	mov    $0x0,%eax
  80354d:	49 b8 8d 01 80 00 00 	movabs $0x80018d,%r8
  803554:	00 00 00 
  803557:	41 ff d0             	callq  *%r8
  80355a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80355e:	48 8d 50 f8          	lea    -0x8(%rax),%rdx
  803562:	b9 00 d0 7f ef       	mov    $0xef7fd000,%ecx
  803567:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80356b:	48 01 c8             	add    %rcx,%rax
  80356e:	48 2d 00 00 40 00    	sub    $0x400000,%rax
  803574:	48 89 02             	mov    %rax,(%rdx)
  803577:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80357b:	48 8d 50 f0          	lea    -0x10(%rax),%rdx
  80357f:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803582:	48 98                	cltq   
  803584:	48 89 02             	mov    %rax,(%rdx)
  803587:	ba f0 cf 7f ef       	mov    $0xef7fcff0,%edx
  80358c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803590:	48 01 d0             	add    %rdx,%rax
  803593:	48 2d 00 00 40 00    	sub    $0x400000,%rax
  803599:	48 89 c2             	mov    %rax,%rdx
  80359c:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  8035a0:	48 89 10             	mov    %rdx,(%rax)
  8035a3:	8b 45 cc             	mov    -0x34(%rbp),%eax
  8035a6:	41 b8 07 00 00 00    	mov    $0x7,%r8d
  8035ac:	b9 00 d0 7f ef       	mov    $0xef7fd000,%ecx
  8035b1:	89 c2                	mov    %eax,%edx
  8035b3:	be 00 00 40 00       	mov    $0x400000,%esi
  8035b8:	bf 00 00 00 00       	mov    $0x0,%edi
  8035bd:	48 b8 fa 18 80 00 00 	movabs $0x8018fa,%rax
  8035c4:	00 00 00 
  8035c7:	ff d0                	callq  *%rax
  8035c9:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8035cc:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8035d0:	79 02                	jns    8035d4 <init_stack+0x266>
  8035d2:	eb 28                	jmp    8035fc <init_stack+0x28e>
  8035d4:	be 00 00 40 00       	mov    $0x400000,%esi
  8035d9:	bf 00 00 00 00       	mov    $0x0,%edi
  8035de:	48 b8 55 19 80 00 00 	movabs $0x801955,%rax
  8035e5:	00 00 00 
  8035e8:	ff d0                	callq  *%rax
  8035ea:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8035ed:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8035f1:	79 02                	jns    8035f5 <init_stack+0x287>
  8035f3:	eb 07                	jmp    8035fc <init_stack+0x28e>
  8035f5:	b8 00 00 00 00       	mov    $0x0,%eax
  8035fa:	eb 19                	jmp    803615 <init_stack+0x2a7>
  8035fc:	be 00 00 40 00       	mov    $0x400000,%esi
  803601:	bf 00 00 00 00       	mov    $0x0,%edi
  803606:	48 b8 55 19 80 00 00 	movabs $0x801955,%rax
  80360d:	00 00 00 
  803610:	ff d0                	callq  *%rax
  803612:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803615:	c9                   	leaveq 
  803616:	c3                   	retq   

0000000000803617 <map_segment>:
  803617:	55                   	push   %rbp
  803618:	48 89 e5             	mov    %rsp,%rbp
  80361b:	48 83 ec 50          	sub    $0x50,%rsp
  80361f:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803622:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803626:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80362a:	89 4d d8             	mov    %ecx,-0x28(%rbp)
  80362d:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  803631:	44 89 4d bc          	mov    %r9d,-0x44(%rbp)
  803635:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803639:	25 ff 0f 00 00       	and    $0xfff,%eax
  80363e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803641:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803645:	74 21                	je     803668 <map_segment+0x51>
  803647:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80364a:	48 98                	cltq   
  80364c:	48 29 45 d0          	sub    %rax,-0x30(%rbp)
  803650:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803653:	48 98                	cltq   
  803655:	48 01 45 c8          	add    %rax,-0x38(%rbp)
  803659:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80365c:	48 98                	cltq   
  80365e:	48 01 45 c0          	add    %rax,-0x40(%rbp)
  803662:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803665:	29 45 bc             	sub    %eax,-0x44(%rbp)
  803668:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80366f:	e9 79 01 00 00       	jmpq   8037ed <map_segment+0x1d6>
  803674:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803677:	48 98                	cltq   
  803679:	48 3b 45 c0          	cmp    -0x40(%rbp),%rax
  80367d:	72 3c                	jb     8036bb <map_segment+0xa4>
  80367f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803682:	48 63 d0             	movslq %eax,%rdx
  803685:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803689:	48 01 d0             	add    %rdx,%rax
  80368c:	48 89 c1             	mov    %rax,%rcx
  80368f:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803692:	8b 55 10             	mov    0x10(%rbp),%edx
  803695:	48 89 ce             	mov    %rcx,%rsi
  803698:	89 c7                	mov    %eax,%edi
  80369a:	48 b8 aa 18 80 00 00 	movabs $0x8018aa,%rax
  8036a1:	00 00 00 
  8036a4:	ff d0                	callq  *%rax
  8036a6:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8036a9:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8036ad:	0f 89 33 01 00 00    	jns    8037e6 <map_segment+0x1cf>
  8036b3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8036b6:	e9 46 01 00 00       	jmpq   803801 <map_segment+0x1ea>
  8036bb:	ba 07 00 00 00       	mov    $0x7,%edx
  8036c0:	be 00 00 40 00       	mov    $0x400000,%esi
  8036c5:	bf 00 00 00 00       	mov    $0x0,%edi
  8036ca:	48 b8 aa 18 80 00 00 	movabs $0x8018aa,%rax
  8036d1:	00 00 00 
  8036d4:	ff d0                	callq  *%rax
  8036d6:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8036d9:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8036dd:	79 08                	jns    8036e7 <map_segment+0xd0>
  8036df:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8036e2:	e9 1a 01 00 00       	jmpq   803801 <map_segment+0x1ea>
  8036e7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036ea:	8b 55 bc             	mov    -0x44(%rbp),%edx
  8036ed:	01 c2                	add    %eax,%edx
  8036ef:	8b 45 d8             	mov    -0x28(%rbp),%eax
  8036f2:	89 d6                	mov    %edx,%esi
  8036f4:	89 c7                	mov    %eax,%edi
  8036f6:	48 b8 be 24 80 00 00 	movabs $0x8024be,%rax
  8036fd:	00 00 00 
  803700:	ff d0                	callq  *%rax
  803702:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803705:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803709:	79 08                	jns    803713 <map_segment+0xfc>
  80370b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80370e:	e9 ee 00 00 00       	jmpq   803801 <map_segment+0x1ea>
  803713:	c7 45 f4 00 10 00 00 	movl   $0x1000,-0xc(%rbp)
  80371a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80371d:	48 98                	cltq   
  80371f:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  803723:	48 29 c2             	sub    %rax,%rdx
  803726:	48 89 d0             	mov    %rdx,%rax
  803729:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80372d:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803730:	48 63 d0             	movslq %eax,%rdx
  803733:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803737:	48 39 c2             	cmp    %rax,%rdx
  80373a:	48 0f 47 d0          	cmova  %rax,%rdx
  80373e:	8b 45 d8             	mov    -0x28(%rbp),%eax
  803741:	be 00 00 40 00       	mov    $0x400000,%esi
  803746:	89 c7                	mov    %eax,%edi
  803748:	48 b8 75 23 80 00 00 	movabs $0x802375,%rax
  80374f:	00 00 00 
  803752:	ff d0                	callq  *%rax
  803754:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803757:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80375b:	79 08                	jns    803765 <map_segment+0x14e>
  80375d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803760:	e9 9c 00 00 00       	jmpq   803801 <map_segment+0x1ea>
  803765:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803768:	48 63 d0             	movslq %eax,%rdx
  80376b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80376f:	48 01 d0             	add    %rdx,%rax
  803772:	48 89 c2             	mov    %rax,%rdx
  803775:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803778:	44 8b 45 10          	mov    0x10(%rbp),%r8d
  80377c:	48 89 d1             	mov    %rdx,%rcx
  80377f:	89 c2                	mov    %eax,%edx
  803781:	be 00 00 40 00       	mov    $0x400000,%esi
  803786:	bf 00 00 00 00       	mov    $0x0,%edi
  80378b:	48 b8 fa 18 80 00 00 	movabs $0x8018fa,%rax
  803792:	00 00 00 
  803795:	ff d0                	callq  *%rax
  803797:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80379a:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80379e:	79 30                	jns    8037d0 <map_segment+0x1b9>
  8037a0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8037a3:	89 c1                	mov    %eax,%ecx
  8037a5:	48 ba 53 53 80 00 00 	movabs $0x805353,%rdx
  8037ac:	00 00 00 
  8037af:	be 29 01 00 00       	mov    $0x129,%esi
  8037b4:	48 bf d8 52 80 00 00 	movabs $0x8052d8,%rdi
  8037bb:	00 00 00 
  8037be:	b8 00 00 00 00       	mov    $0x0,%eax
  8037c3:	49 b8 8d 01 80 00 00 	movabs $0x80018d,%r8
  8037ca:	00 00 00 
  8037cd:	41 ff d0             	callq  *%r8
  8037d0:	be 00 00 40 00       	mov    $0x400000,%esi
  8037d5:	bf 00 00 00 00       	mov    $0x0,%edi
  8037da:	48 b8 55 19 80 00 00 	movabs $0x801955,%rax
  8037e1:	00 00 00 
  8037e4:	ff d0                	callq  *%rax
  8037e6:	81 45 fc 00 10 00 00 	addl   $0x1000,-0x4(%rbp)
  8037ed:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037f0:	48 98                	cltq   
  8037f2:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8037f6:	0f 82 78 fe ff ff    	jb     803674 <map_segment+0x5d>
  8037fc:	b8 00 00 00 00       	mov    $0x0,%eax
  803801:	c9                   	leaveq 
  803802:	c3                   	retq   

0000000000803803 <copy_shared_pages>:
  803803:	55                   	push   %rbp
  803804:	48 89 e5             	mov    %rsp,%rbp
  803807:	48 83 ec 30          	sub    $0x30,%rsp
  80380b:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80380e:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803815:	00 
  803816:	e9 eb 00 00 00       	jmpq   803906 <copy_shared_pages+0x103>
  80381b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80381f:	48 c1 f8 12          	sar    $0x12,%rax
  803823:	48 89 c2             	mov    %rax,%rdx
  803826:	48 b8 00 00 40 80 00 	movabs $0x10080400000,%rax
  80382d:	01 00 00 
  803830:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803834:	83 e0 01             	and    $0x1,%eax
  803837:	48 85 c0             	test   %rax,%rax
  80383a:	74 21                	je     80385d <copy_shared_pages+0x5a>
  80383c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803840:	48 c1 f8 09          	sar    $0x9,%rax
  803844:	48 89 c2             	mov    %rax,%rdx
  803847:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  80384e:	01 00 00 
  803851:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803855:	83 e0 01             	and    $0x1,%eax
  803858:	48 85 c0             	test   %rax,%rax
  80385b:	75 0d                	jne    80386a <copy_shared_pages+0x67>
  80385d:	48 81 45 f8 00 02 00 	addq   $0x200,-0x8(%rbp)
  803864:	00 
  803865:	e9 9c 00 00 00       	jmpq   803906 <copy_shared_pages+0x103>
  80386a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80386e:	48 05 00 02 00 00    	add    $0x200,%rax
  803874:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803878:	eb 7e                	jmp    8038f8 <copy_shared_pages+0xf5>
  80387a:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  803881:	01 00 00 
  803884:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  803888:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80388c:	25 01 04 00 00       	and    $0x401,%eax
  803891:	48 3d 01 04 00 00    	cmp    $0x401,%rax
  803897:	75 5a                	jne    8038f3 <copy_shared_pages+0xf0>
  803899:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80389d:	48 c1 e0 0c          	shl    $0xc,%rax
  8038a1:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8038a5:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8038ac:	01 00 00 
  8038af:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8038b3:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8038b7:	25 07 0e 00 00       	and    $0xe07,%eax
  8038bc:	89 c6                	mov    %eax,%esi
  8038be:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8038c2:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8038c5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8038c9:	41 89 f0             	mov    %esi,%r8d
  8038cc:	48 89 c6             	mov    %rax,%rsi
  8038cf:	bf 00 00 00 00       	mov    $0x0,%edi
  8038d4:	48 b8 fa 18 80 00 00 	movabs $0x8018fa,%rax
  8038db:	00 00 00 
  8038de:	ff d0                	callq  *%rax
  8038e0:	48 98                	cltq   
  8038e2:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8038e6:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8038eb:	79 06                	jns    8038f3 <copy_shared_pages+0xf0>
  8038ed:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8038f1:	eb 28                	jmp    80391b <copy_shared_pages+0x118>
  8038f3:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8038f8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8038fc:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  803900:	0f 8c 74 ff ff ff    	jl     80387a <copy_shared_pages+0x77>
  803906:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80390a:	48 3d ff 07 00 08    	cmp    $0x80007ff,%rax
  803910:	0f 86 05 ff ff ff    	jbe    80381b <copy_shared_pages+0x18>
  803916:	b8 00 00 00 00       	mov    $0x0,%eax
  80391b:	c9                   	leaveq 
  80391c:	c3                   	retq   

000000000080391d <fd2sockid>:
  80391d:	55                   	push   %rbp
  80391e:	48 89 e5             	mov    %rsp,%rbp
  803921:	48 83 ec 20          	sub    $0x20,%rsp
  803925:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803928:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80392c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80392f:	48 89 d6             	mov    %rdx,%rsi
  803932:	89 c7                	mov    %eax,%edi
  803934:	48 b8 6e 1e 80 00 00 	movabs $0x801e6e,%rax
  80393b:	00 00 00 
  80393e:	ff d0                	callq  *%rax
  803940:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803943:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803947:	79 05                	jns    80394e <fd2sockid+0x31>
  803949:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80394c:	eb 24                	jmp    803972 <fd2sockid+0x55>
  80394e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803952:	8b 10                	mov    (%rax),%edx
  803954:	48 b8 a0 70 80 00 00 	movabs $0x8070a0,%rax
  80395b:	00 00 00 
  80395e:	8b 00                	mov    (%rax),%eax
  803960:	39 c2                	cmp    %eax,%edx
  803962:	74 07                	je     80396b <fd2sockid+0x4e>
  803964:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803969:	eb 07                	jmp    803972 <fd2sockid+0x55>
  80396b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80396f:	8b 40 0c             	mov    0xc(%rax),%eax
  803972:	c9                   	leaveq 
  803973:	c3                   	retq   

0000000000803974 <alloc_sockfd>:
  803974:	55                   	push   %rbp
  803975:	48 89 e5             	mov    %rsp,%rbp
  803978:	48 83 ec 20          	sub    $0x20,%rsp
  80397c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80397f:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803983:	48 89 c7             	mov    %rax,%rdi
  803986:	48 b8 d6 1d 80 00 00 	movabs $0x801dd6,%rax
  80398d:	00 00 00 
  803990:	ff d0                	callq  *%rax
  803992:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803995:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803999:	78 26                	js     8039c1 <alloc_sockfd+0x4d>
  80399b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80399f:	ba 07 04 00 00       	mov    $0x407,%edx
  8039a4:	48 89 c6             	mov    %rax,%rsi
  8039a7:	bf 00 00 00 00       	mov    $0x0,%edi
  8039ac:	48 b8 aa 18 80 00 00 	movabs $0x8018aa,%rax
  8039b3:	00 00 00 
  8039b6:	ff d0                	callq  *%rax
  8039b8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8039bb:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8039bf:	79 16                	jns    8039d7 <alloc_sockfd+0x63>
  8039c1:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8039c4:	89 c7                	mov    %eax,%edi
  8039c6:	48 b8 81 3e 80 00 00 	movabs $0x803e81,%rax
  8039cd:	00 00 00 
  8039d0:	ff d0                	callq  *%rax
  8039d2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039d5:	eb 3a                	jmp    803a11 <alloc_sockfd+0x9d>
  8039d7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8039db:	48 ba a0 70 80 00 00 	movabs $0x8070a0,%rdx
  8039e2:	00 00 00 
  8039e5:	8b 12                	mov    (%rdx),%edx
  8039e7:	89 10                	mov    %edx,(%rax)
  8039e9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8039ed:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8039f4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8039f8:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8039fb:	89 50 0c             	mov    %edx,0xc(%rax)
  8039fe:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a02:	48 89 c7             	mov    %rax,%rdi
  803a05:	48 b8 88 1d 80 00 00 	movabs $0x801d88,%rax
  803a0c:	00 00 00 
  803a0f:	ff d0                	callq  *%rax
  803a11:	c9                   	leaveq 
  803a12:	c3                   	retq   

0000000000803a13 <accept>:
  803a13:	55                   	push   %rbp
  803a14:	48 89 e5             	mov    %rsp,%rbp
  803a17:	48 83 ec 30          	sub    $0x30,%rsp
  803a1b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803a1e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803a22:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803a26:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803a29:	89 c7                	mov    %eax,%edi
  803a2b:	48 b8 1d 39 80 00 00 	movabs $0x80391d,%rax
  803a32:	00 00 00 
  803a35:	ff d0                	callq  *%rax
  803a37:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803a3a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803a3e:	79 05                	jns    803a45 <accept+0x32>
  803a40:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a43:	eb 3b                	jmp    803a80 <accept+0x6d>
  803a45:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803a49:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803a4d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a50:	48 89 ce             	mov    %rcx,%rsi
  803a53:	89 c7                	mov    %eax,%edi
  803a55:	48 b8 5e 3d 80 00 00 	movabs $0x803d5e,%rax
  803a5c:	00 00 00 
  803a5f:	ff d0                	callq  *%rax
  803a61:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803a64:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803a68:	79 05                	jns    803a6f <accept+0x5c>
  803a6a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a6d:	eb 11                	jmp    803a80 <accept+0x6d>
  803a6f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a72:	89 c7                	mov    %eax,%edi
  803a74:	48 b8 74 39 80 00 00 	movabs $0x803974,%rax
  803a7b:	00 00 00 
  803a7e:	ff d0                	callq  *%rax
  803a80:	c9                   	leaveq 
  803a81:	c3                   	retq   

0000000000803a82 <bind>:
  803a82:	55                   	push   %rbp
  803a83:	48 89 e5             	mov    %rsp,%rbp
  803a86:	48 83 ec 20          	sub    $0x20,%rsp
  803a8a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803a8d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803a91:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803a94:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803a97:	89 c7                	mov    %eax,%edi
  803a99:	48 b8 1d 39 80 00 00 	movabs $0x80391d,%rax
  803aa0:	00 00 00 
  803aa3:	ff d0                	callq  *%rax
  803aa5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803aa8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803aac:	79 05                	jns    803ab3 <bind+0x31>
  803aae:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ab1:	eb 1b                	jmp    803ace <bind+0x4c>
  803ab3:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803ab6:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803aba:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803abd:	48 89 ce             	mov    %rcx,%rsi
  803ac0:	89 c7                	mov    %eax,%edi
  803ac2:	48 b8 dd 3d 80 00 00 	movabs $0x803ddd,%rax
  803ac9:	00 00 00 
  803acc:	ff d0                	callq  *%rax
  803ace:	c9                   	leaveq 
  803acf:	c3                   	retq   

0000000000803ad0 <shutdown>:
  803ad0:	55                   	push   %rbp
  803ad1:	48 89 e5             	mov    %rsp,%rbp
  803ad4:	48 83 ec 20          	sub    $0x20,%rsp
  803ad8:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803adb:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803ade:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803ae1:	89 c7                	mov    %eax,%edi
  803ae3:	48 b8 1d 39 80 00 00 	movabs $0x80391d,%rax
  803aea:	00 00 00 
  803aed:	ff d0                	callq  *%rax
  803aef:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803af2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803af6:	79 05                	jns    803afd <shutdown+0x2d>
  803af8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803afb:	eb 16                	jmp    803b13 <shutdown+0x43>
  803afd:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803b00:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b03:	89 d6                	mov    %edx,%esi
  803b05:	89 c7                	mov    %eax,%edi
  803b07:	48 b8 41 3e 80 00 00 	movabs $0x803e41,%rax
  803b0e:	00 00 00 
  803b11:	ff d0                	callq  *%rax
  803b13:	c9                   	leaveq 
  803b14:	c3                   	retq   

0000000000803b15 <devsock_close>:
  803b15:	55                   	push   %rbp
  803b16:	48 89 e5             	mov    %rsp,%rbp
  803b19:	48 83 ec 10          	sub    $0x10,%rsp
  803b1d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803b21:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803b25:	48 89 c7             	mov    %rax,%rdi
  803b28:	48 b8 6e 4b 80 00 00 	movabs $0x804b6e,%rax
  803b2f:	00 00 00 
  803b32:	ff d0                	callq  *%rax
  803b34:	83 f8 01             	cmp    $0x1,%eax
  803b37:	75 17                	jne    803b50 <devsock_close+0x3b>
  803b39:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803b3d:	8b 40 0c             	mov    0xc(%rax),%eax
  803b40:	89 c7                	mov    %eax,%edi
  803b42:	48 b8 81 3e 80 00 00 	movabs $0x803e81,%rax
  803b49:	00 00 00 
  803b4c:	ff d0                	callq  *%rax
  803b4e:	eb 05                	jmp    803b55 <devsock_close+0x40>
  803b50:	b8 00 00 00 00       	mov    $0x0,%eax
  803b55:	c9                   	leaveq 
  803b56:	c3                   	retq   

0000000000803b57 <connect>:
  803b57:	55                   	push   %rbp
  803b58:	48 89 e5             	mov    %rsp,%rbp
  803b5b:	48 83 ec 20          	sub    $0x20,%rsp
  803b5f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803b62:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803b66:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803b69:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803b6c:	89 c7                	mov    %eax,%edi
  803b6e:	48 b8 1d 39 80 00 00 	movabs $0x80391d,%rax
  803b75:	00 00 00 
  803b78:	ff d0                	callq  *%rax
  803b7a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803b7d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803b81:	79 05                	jns    803b88 <connect+0x31>
  803b83:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b86:	eb 1b                	jmp    803ba3 <connect+0x4c>
  803b88:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803b8b:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803b8f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b92:	48 89 ce             	mov    %rcx,%rsi
  803b95:	89 c7                	mov    %eax,%edi
  803b97:	48 b8 ae 3e 80 00 00 	movabs $0x803eae,%rax
  803b9e:	00 00 00 
  803ba1:	ff d0                	callq  *%rax
  803ba3:	c9                   	leaveq 
  803ba4:	c3                   	retq   

0000000000803ba5 <listen>:
  803ba5:	55                   	push   %rbp
  803ba6:	48 89 e5             	mov    %rsp,%rbp
  803ba9:	48 83 ec 20          	sub    $0x20,%rsp
  803bad:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803bb0:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803bb3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803bb6:	89 c7                	mov    %eax,%edi
  803bb8:	48 b8 1d 39 80 00 00 	movabs $0x80391d,%rax
  803bbf:	00 00 00 
  803bc2:	ff d0                	callq  *%rax
  803bc4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803bc7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803bcb:	79 05                	jns    803bd2 <listen+0x2d>
  803bcd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803bd0:	eb 16                	jmp    803be8 <listen+0x43>
  803bd2:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803bd5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803bd8:	89 d6                	mov    %edx,%esi
  803bda:	89 c7                	mov    %eax,%edi
  803bdc:	48 b8 12 3f 80 00 00 	movabs $0x803f12,%rax
  803be3:	00 00 00 
  803be6:	ff d0                	callq  *%rax
  803be8:	c9                   	leaveq 
  803be9:	c3                   	retq   

0000000000803bea <devsock_read>:
  803bea:	55                   	push   %rbp
  803beb:	48 89 e5             	mov    %rsp,%rbp
  803bee:	48 83 ec 20          	sub    $0x20,%rsp
  803bf2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803bf6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803bfa:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803bfe:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803c02:	89 c2                	mov    %eax,%edx
  803c04:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803c08:	8b 40 0c             	mov    0xc(%rax),%eax
  803c0b:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803c0f:	b9 00 00 00 00       	mov    $0x0,%ecx
  803c14:	89 c7                	mov    %eax,%edi
  803c16:	48 b8 52 3f 80 00 00 	movabs $0x803f52,%rax
  803c1d:	00 00 00 
  803c20:	ff d0                	callq  *%rax
  803c22:	c9                   	leaveq 
  803c23:	c3                   	retq   

0000000000803c24 <devsock_write>:
  803c24:	55                   	push   %rbp
  803c25:	48 89 e5             	mov    %rsp,%rbp
  803c28:	48 83 ec 20          	sub    $0x20,%rsp
  803c2c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803c30:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803c34:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803c38:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803c3c:	89 c2                	mov    %eax,%edx
  803c3e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803c42:	8b 40 0c             	mov    0xc(%rax),%eax
  803c45:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803c49:	b9 00 00 00 00       	mov    $0x0,%ecx
  803c4e:	89 c7                	mov    %eax,%edi
  803c50:	48 b8 1e 40 80 00 00 	movabs $0x80401e,%rax
  803c57:	00 00 00 
  803c5a:	ff d0                	callq  *%rax
  803c5c:	c9                   	leaveq 
  803c5d:	c3                   	retq   

0000000000803c5e <devsock_stat>:
  803c5e:	55                   	push   %rbp
  803c5f:	48 89 e5             	mov    %rsp,%rbp
  803c62:	48 83 ec 10          	sub    $0x10,%rsp
  803c66:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803c6a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803c6e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803c72:	48 be 75 53 80 00 00 	movabs $0x805375,%rsi
  803c79:	00 00 00 
  803c7c:	48 89 c7             	mov    %rax,%rdi
  803c7f:	48 b8 7b 0f 80 00 00 	movabs $0x800f7b,%rax
  803c86:	00 00 00 
  803c89:	ff d0                	callq  *%rax
  803c8b:	b8 00 00 00 00       	mov    $0x0,%eax
  803c90:	c9                   	leaveq 
  803c91:	c3                   	retq   

0000000000803c92 <socket>:
  803c92:	55                   	push   %rbp
  803c93:	48 89 e5             	mov    %rsp,%rbp
  803c96:	48 83 ec 20          	sub    $0x20,%rsp
  803c9a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803c9d:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803ca0:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  803ca3:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803ca6:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803ca9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803cac:	89 ce                	mov    %ecx,%esi
  803cae:	89 c7                	mov    %eax,%edi
  803cb0:	48 b8 d6 40 80 00 00 	movabs $0x8040d6,%rax
  803cb7:	00 00 00 
  803cba:	ff d0                	callq  *%rax
  803cbc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803cbf:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803cc3:	79 05                	jns    803cca <socket+0x38>
  803cc5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803cc8:	eb 11                	jmp    803cdb <socket+0x49>
  803cca:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ccd:	89 c7                	mov    %eax,%edi
  803ccf:	48 b8 74 39 80 00 00 	movabs $0x803974,%rax
  803cd6:	00 00 00 
  803cd9:	ff d0                	callq  *%rax
  803cdb:	c9                   	leaveq 
  803cdc:	c3                   	retq   

0000000000803cdd <nsipc>:
  803cdd:	55                   	push   %rbp
  803cde:	48 89 e5             	mov    %rsp,%rbp
  803ce1:	48 83 ec 10          	sub    $0x10,%rsp
  803ce5:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803ce8:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803cef:	00 00 00 
  803cf2:	8b 00                	mov    (%rax),%eax
  803cf4:	85 c0                	test   %eax,%eax
  803cf6:	75 1d                	jne    803d15 <nsipc+0x38>
  803cf8:	bf 02 00 00 00       	mov    $0x2,%edi
  803cfd:	48 b8 fc 4a 80 00 00 	movabs $0x804afc,%rax
  803d04:	00 00 00 
  803d07:	ff d0                	callq  *%rax
  803d09:	48 ba 04 80 80 00 00 	movabs $0x808004,%rdx
  803d10:	00 00 00 
  803d13:	89 02                	mov    %eax,(%rdx)
  803d15:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803d1c:	00 00 00 
  803d1f:	8b 00                	mov    (%rax),%eax
  803d21:	8b 75 fc             	mov    -0x4(%rbp),%esi
  803d24:	b9 07 00 00 00       	mov    $0x7,%ecx
  803d29:	48 ba 00 b0 80 00 00 	movabs $0x80b000,%rdx
  803d30:	00 00 00 
  803d33:	89 c7                	mov    %eax,%edi
  803d35:	48 b8 66 4a 80 00 00 	movabs $0x804a66,%rax
  803d3c:	00 00 00 
  803d3f:	ff d0                	callq  *%rax
  803d41:	ba 00 00 00 00       	mov    $0x0,%edx
  803d46:	be 00 00 00 00       	mov    $0x0,%esi
  803d4b:	bf 00 00 00 00       	mov    $0x0,%edi
  803d50:	48 b8 a5 49 80 00 00 	movabs $0x8049a5,%rax
  803d57:	00 00 00 
  803d5a:	ff d0                	callq  *%rax
  803d5c:	c9                   	leaveq 
  803d5d:	c3                   	retq   

0000000000803d5e <nsipc_accept>:
  803d5e:	55                   	push   %rbp
  803d5f:	48 89 e5             	mov    %rsp,%rbp
  803d62:	48 83 ec 30          	sub    $0x30,%rsp
  803d66:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803d69:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803d6d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803d71:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d78:	00 00 00 
  803d7b:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803d7e:	89 10                	mov    %edx,(%rax)
  803d80:	bf 01 00 00 00       	mov    $0x1,%edi
  803d85:	48 b8 dd 3c 80 00 00 	movabs $0x803cdd,%rax
  803d8c:	00 00 00 
  803d8f:	ff d0                	callq  *%rax
  803d91:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803d94:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803d98:	78 3e                	js     803dd8 <nsipc_accept+0x7a>
  803d9a:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803da1:	00 00 00 
  803da4:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803da8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803dac:	8b 40 10             	mov    0x10(%rax),%eax
  803daf:	89 c2                	mov    %eax,%edx
  803db1:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  803db5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803db9:	48 89 ce             	mov    %rcx,%rsi
  803dbc:	48 89 c7             	mov    %rax,%rdi
  803dbf:	48 b8 9f 12 80 00 00 	movabs $0x80129f,%rax
  803dc6:	00 00 00 
  803dc9:	ff d0                	callq  *%rax
  803dcb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803dcf:	8b 50 10             	mov    0x10(%rax),%edx
  803dd2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803dd6:	89 10                	mov    %edx,(%rax)
  803dd8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ddb:	c9                   	leaveq 
  803ddc:	c3                   	retq   

0000000000803ddd <nsipc_bind>:
  803ddd:	55                   	push   %rbp
  803dde:	48 89 e5             	mov    %rsp,%rbp
  803de1:	48 83 ec 10          	sub    $0x10,%rsp
  803de5:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803de8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803dec:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803def:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803df6:	00 00 00 
  803df9:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803dfc:	89 10                	mov    %edx,(%rax)
  803dfe:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803e01:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e05:	48 89 c6             	mov    %rax,%rsi
  803e08:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803e0f:	00 00 00 
  803e12:	48 b8 9f 12 80 00 00 	movabs $0x80129f,%rax
  803e19:	00 00 00 
  803e1c:	ff d0                	callq  *%rax
  803e1e:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e25:	00 00 00 
  803e28:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803e2b:	89 50 14             	mov    %edx,0x14(%rax)
  803e2e:	bf 02 00 00 00       	mov    $0x2,%edi
  803e33:	48 b8 dd 3c 80 00 00 	movabs $0x803cdd,%rax
  803e3a:	00 00 00 
  803e3d:	ff d0                	callq  *%rax
  803e3f:	c9                   	leaveq 
  803e40:	c3                   	retq   

0000000000803e41 <nsipc_shutdown>:
  803e41:	55                   	push   %rbp
  803e42:	48 89 e5             	mov    %rsp,%rbp
  803e45:	48 83 ec 10          	sub    $0x10,%rsp
  803e49:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803e4c:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803e4f:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e56:	00 00 00 
  803e59:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803e5c:	89 10                	mov    %edx,(%rax)
  803e5e:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e65:	00 00 00 
  803e68:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803e6b:	89 50 04             	mov    %edx,0x4(%rax)
  803e6e:	bf 03 00 00 00       	mov    $0x3,%edi
  803e73:	48 b8 dd 3c 80 00 00 	movabs $0x803cdd,%rax
  803e7a:	00 00 00 
  803e7d:	ff d0                	callq  *%rax
  803e7f:	c9                   	leaveq 
  803e80:	c3                   	retq   

0000000000803e81 <nsipc_close>:
  803e81:	55                   	push   %rbp
  803e82:	48 89 e5             	mov    %rsp,%rbp
  803e85:	48 83 ec 10          	sub    $0x10,%rsp
  803e89:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803e8c:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e93:	00 00 00 
  803e96:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803e99:	89 10                	mov    %edx,(%rax)
  803e9b:	bf 04 00 00 00       	mov    $0x4,%edi
  803ea0:	48 b8 dd 3c 80 00 00 	movabs $0x803cdd,%rax
  803ea7:	00 00 00 
  803eaa:	ff d0                	callq  *%rax
  803eac:	c9                   	leaveq 
  803ead:	c3                   	retq   

0000000000803eae <nsipc_connect>:
  803eae:	55                   	push   %rbp
  803eaf:	48 89 e5             	mov    %rsp,%rbp
  803eb2:	48 83 ec 10          	sub    $0x10,%rsp
  803eb6:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803eb9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803ebd:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803ec0:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803ec7:	00 00 00 
  803eca:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803ecd:	89 10                	mov    %edx,(%rax)
  803ecf:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803ed2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ed6:	48 89 c6             	mov    %rax,%rsi
  803ed9:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803ee0:	00 00 00 
  803ee3:	48 b8 9f 12 80 00 00 	movabs $0x80129f,%rax
  803eea:	00 00 00 
  803eed:	ff d0                	callq  *%rax
  803eef:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803ef6:	00 00 00 
  803ef9:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803efc:	89 50 14             	mov    %edx,0x14(%rax)
  803eff:	bf 05 00 00 00       	mov    $0x5,%edi
  803f04:	48 b8 dd 3c 80 00 00 	movabs $0x803cdd,%rax
  803f0b:	00 00 00 
  803f0e:	ff d0                	callq  *%rax
  803f10:	c9                   	leaveq 
  803f11:	c3                   	retq   

0000000000803f12 <nsipc_listen>:
  803f12:	55                   	push   %rbp
  803f13:	48 89 e5             	mov    %rsp,%rbp
  803f16:	48 83 ec 10          	sub    $0x10,%rsp
  803f1a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803f1d:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803f20:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803f27:	00 00 00 
  803f2a:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803f2d:	89 10                	mov    %edx,(%rax)
  803f2f:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803f36:	00 00 00 
  803f39:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803f3c:	89 50 04             	mov    %edx,0x4(%rax)
  803f3f:	bf 06 00 00 00       	mov    $0x6,%edi
  803f44:	48 b8 dd 3c 80 00 00 	movabs $0x803cdd,%rax
  803f4b:	00 00 00 
  803f4e:	ff d0                	callq  *%rax
  803f50:	c9                   	leaveq 
  803f51:	c3                   	retq   

0000000000803f52 <nsipc_recv>:
  803f52:	55                   	push   %rbp
  803f53:	48 89 e5             	mov    %rsp,%rbp
  803f56:	48 83 ec 30          	sub    $0x30,%rsp
  803f5a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803f5d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803f61:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803f64:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  803f67:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803f6e:	00 00 00 
  803f71:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803f74:	89 10                	mov    %edx,(%rax)
  803f76:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803f7d:	00 00 00 
  803f80:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803f83:	89 50 04             	mov    %edx,0x4(%rax)
  803f86:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803f8d:	00 00 00 
  803f90:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803f93:	89 50 08             	mov    %edx,0x8(%rax)
  803f96:	bf 07 00 00 00       	mov    $0x7,%edi
  803f9b:	48 b8 dd 3c 80 00 00 	movabs $0x803cdd,%rax
  803fa2:	00 00 00 
  803fa5:	ff d0                	callq  *%rax
  803fa7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803faa:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803fae:	78 69                	js     804019 <nsipc_recv+0xc7>
  803fb0:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  803fb7:	7f 08                	jg     803fc1 <nsipc_recv+0x6f>
  803fb9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803fbc:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  803fbf:	7e 35                	jle    803ff6 <nsipc_recv+0xa4>
  803fc1:	48 b9 7c 53 80 00 00 	movabs $0x80537c,%rcx
  803fc8:	00 00 00 
  803fcb:	48 ba 91 53 80 00 00 	movabs $0x805391,%rdx
  803fd2:	00 00 00 
  803fd5:	be 62 00 00 00       	mov    $0x62,%esi
  803fda:	48 bf a6 53 80 00 00 	movabs $0x8053a6,%rdi
  803fe1:	00 00 00 
  803fe4:	b8 00 00 00 00       	mov    $0x0,%eax
  803fe9:	49 b8 8d 01 80 00 00 	movabs $0x80018d,%r8
  803ff0:	00 00 00 
  803ff3:	41 ff d0             	callq  *%r8
  803ff6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ff9:	48 63 d0             	movslq %eax,%rdx
  803ffc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804000:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  804007:	00 00 00 
  80400a:	48 89 c7             	mov    %rax,%rdi
  80400d:	48 b8 9f 12 80 00 00 	movabs $0x80129f,%rax
  804014:	00 00 00 
  804017:	ff d0                	callq  *%rax
  804019:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80401c:	c9                   	leaveq 
  80401d:	c3                   	retq   

000000000080401e <nsipc_send>:
  80401e:	55                   	push   %rbp
  80401f:	48 89 e5             	mov    %rsp,%rbp
  804022:	48 83 ec 20          	sub    $0x20,%rsp
  804026:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804029:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80402d:	89 55 f8             	mov    %edx,-0x8(%rbp)
  804030:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  804033:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80403a:	00 00 00 
  80403d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804040:	89 10                	mov    %edx,(%rax)
  804042:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  804049:	7e 35                	jle    804080 <nsipc_send+0x62>
  80404b:	48 b9 b5 53 80 00 00 	movabs $0x8053b5,%rcx
  804052:	00 00 00 
  804055:	48 ba 91 53 80 00 00 	movabs $0x805391,%rdx
  80405c:	00 00 00 
  80405f:	be 6d 00 00 00       	mov    $0x6d,%esi
  804064:	48 bf a6 53 80 00 00 	movabs $0x8053a6,%rdi
  80406b:	00 00 00 
  80406e:	b8 00 00 00 00       	mov    $0x0,%eax
  804073:	49 b8 8d 01 80 00 00 	movabs $0x80018d,%r8
  80407a:	00 00 00 
  80407d:	41 ff d0             	callq  *%r8
  804080:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804083:	48 63 d0             	movslq %eax,%rdx
  804086:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80408a:	48 89 c6             	mov    %rax,%rsi
  80408d:	48 bf 0c b0 80 00 00 	movabs $0x80b00c,%rdi
  804094:	00 00 00 
  804097:	48 b8 9f 12 80 00 00 	movabs $0x80129f,%rax
  80409e:	00 00 00 
  8040a1:	ff d0                	callq  *%rax
  8040a3:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8040aa:	00 00 00 
  8040ad:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8040b0:	89 50 04             	mov    %edx,0x4(%rax)
  8040b3:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8040ba:	00 00 00 
  8040bd:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8040c0:	89 50 08             	mov    %edx,0x8(%rax)
  8040c3:	bf 08 00 00 00       	mov    $0x8,%edi
  8040c8:	48 b8 dd 3c 80 00 00 	movabs $0x803cdd,%rax
  8040cf:	00 00 00 
  8040d2:	ff d0                	callq  *%rax
  8040d4:	c9                   	leaveq 
  8040d5:	c3                   	retq   

00000000008040d6 <nsipc_socket>:
  8040d6:	55                   	push   %rbp
  8040d7:	48 89 e5             	mov    %rsp,%rbp
  8040da:	48 83 ec 10          	sub    $0x10,%rsp
  8040de:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8040e1:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8040e4:	89 55 f4             	mov    %edx,-0xc(%rbp)
  8040e7:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8040ee:	00 00 00 
  8040f1:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8040f4:	89 10                	mov    %edx,(%rax)
  8040f6:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8040fd:	00 00 00 
  804100:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804103:	89 50 04             	mov    %edx,0x4(%rax)
  804106:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80410d:	00 00 00 
  804110:	8b 55 f4             	mov    -0xc(%rbp),%edx
  804113:	89 50 08             	mov    %edx,0x8(%rax)
  804116:	bf 09 00 00 00       	mov    $0x9,%edi
  80411b:	48 b8 dd 3c 80 00 00 	movabs $0x803cdd,%rax
  804122:	00 00 00 
  804125:	ff d0                	callq  *%rax
  804127:	c9                   	leaveq 
  804128:	c3                   	retq   

0000000000804129 <pipe>:
  804129:	55                   	push   %rbp
  80412a:	48 89 e5             	mov    %rsp,%rbp
  80412d:	53                   	push   %rbx
  80412e:	48 83 ec 38          	sub    $0x38,%rsp
  804132:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  804136:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  80413a:	48 89 c7             	mov    %rax,%rdi
  80413d:	48 b8 d6 1d 80 00 00 	movabs $0x801dd6,%rax
  804144:	00 00 00 
  804147:	ff d0                	callq  *%rax
  804149:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80414c:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804150:	0f 88 bf 01 00 00    	js     804315 <pipe+0x1ec>
  804156:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80415a:	ba 07 04 00 00       	mov    $0x407,%edx
  80415f:	48 89 c6             	mov    %rax,%rsi
  804162:	bf 00 00 00 00       	mov    $0x0,%edi
  804167:	48 b8 aa 18 80 00 00 	movabs $0x8018aa,%rax
  80416e:	00 00 00 
  804171:	ff d0                	callq  *%rax
  804173:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804176:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80417a:	0f 88 95 01 00 00    	js     804315 <pipe+0x1ec>
  804180:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  804184:	48 89 c7             	mov    %rax,%rdi
  804187:	48 b8 d6 1d 80 00 00 	movabs $0x801dd6,%rax
  80418e:	00 00 00 
  804191:	ff d0                	callq  *%rax
  804193:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804196:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80419a:	0f 88 5d 01 00 00    	js     8042fd <pipe+0x1d4>
  8041a0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8041a4:	ba 07 04 00 00       	mov    $0x407,%edx
  8041a9:	48 89 c6             	mov    %rax,%rsi
  8041ac:	bf 00 00 00 00       	mov    $0x0,%edi
  8041b1:	48 b8 aa 18 80 00 00 	movabs $0x8018aa,%rax
  8041b8:	00 00 00 
  8041bb:	ff d0                	callq  *%rax
  8041bd:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8041c0:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8041c4:	0f 88 33 01 00 00    	js     8042fd <pipe+0x1d4>
  8041ca:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8041ce:	48 89 c7             	mov    %rax,%rdi
  8041d1:	48 b8 ab 1d 80 00 00 	movabs $0x801dab,%rax
  8041d8:	00 00 00 
  8041db:	ff d0                	callq  *%rax
  8041dd:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8041e1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8041e5:	ba 07 04 00 00       	mov    $0x407,%edx
  8041ea:	48 89 c6             	mov    %rax,%rsi
  8041ed:	bf 00 00 00 00       	mov    $0x0,%edi
  8041f2:	48 b8 aa 18 80 00 00 	movabs $0x8018aa,%rax
  8041f9:	00 00 00 
  8041fc:	ff d0                	callq  *%rax
  8041fe:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804201:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804205:	79 05                	jns    80420c <pipe+0xe3>
  804207:	e9 d9 00 00 00       	jmpq   8042e5 <pipe+0x1bc>
  80420c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804210:	48 89 c7             	mov    %rax,%rdi
  804213:	48 b8 ab 1d 80 00 00 	movabs $0x801dab,%rax
  80421a:	00 00 00 
  80421d:	ff d0                	callq  *%rax
  80421f:	48 89 c2             	mov    %rax,%rdx
  804222:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804226:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  80422c:	48 89 d1             	mov    %rdx,%rcx
  80422f:	ba 00 00 00 00       	mov    $0x0,%edx
  804234:	48 89 c6             	mov    %rax,%rsi
  804237:	bf 00 00 00 00       	mov    $0x0,%edi
  80423c:	48 b8 fa 18 80 00 00 	movabs $0x8018fa,%rax
  804243:	00 00 00 
  804246:	ff d0                	callq  *%rax
  804248:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80424b:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80424f:	79 1b                	jns    80426c <pipe+0x143>
  804251:	90                   	nop
  804252:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804256:	48 89 c6             	mov    %rax,%rsi
  804259:	bf 00 00 00 00       	mov    $0x0,%edi
  80425e:	48 b8 55 19 80 00 00 	movabs $0x801955,%rax
  804265:	00 00 00 
  804268:	ff d0                	callq  *%rax
  80426a:	eb 79                	jmp    8042e5 <pipe+0x1bc>
  80426c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804270:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  804277:	00 00 00 
  80427a:	8b 12                	mov    (%rdx),%edx
  80427c:	89 10                	mov    %edx,(%rax)
  80427e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804282:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  804289:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80428d:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  804294:	00 00 00 
  804297:	8b 12                	mov    (%rdx),%edx
  804299:	89 10                	mov    %edx,(%rax)
  80429b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80429f:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  8042a6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8042aa:	48 89 c7             	mov    %rax,%rdi
  8042ad:	48 b8 88 1d 80 00 00 	movabs $0x801d88,%rax
  8042b4:	00 00 00 
  8042b7:	ff d0                	callq  *%rax
  8042b9:	89 c2                	mov    %eax,%edx
  8042bb:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8042bf:	89 10                	mov    %edx,(%rax)
  8042c1:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8042c5:	48 8d 58 04          	lea    0x4(%rax),%rbx
  8042c9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8042cd:	48 89 c7             	mov    %rax,%rdi
  8042d0:	48 b8 88 1d 80 00 00 	movabs $0x801d88,%rax
  8042d7:	00 00 00 
  8042da:	ff d0                	callq  *%rax
  8042dc:	89 03                	mov    %eax,(%rbx)
  8042de:	b8 00 00 00 00       	mov    $0x0,%eax
  8042e3:	eb 33                	jmp    804318 <pipe+0x1ef>
  8042e5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8042e9:	48 89 c6             	mov    %rax,%rsi
  8042ec:	bf 00 00 00 00       	mov    $0x0,%edi
  8042f1:	48 b8 55 19 80 00 00 	movabs $0x801955,%rax
  8042f8:	00 00 00 
  8042fb:	ff d0                	callq  *%rax
  8042fd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804301:	48 89 c6             	mov    %rax,%rsi
  804304:	bf 00 00 00 00       	mov    $0x0,%edi
  804309:	48 b8 55 19 80 00 00 	movabs $0x801955,%rax
  804310:	00 00 00 
  804313:	ff d0                	callq  *%rax
  804315:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804318:	48 83 c4 38          	add    $0x38,%rsp
  80431c:	5b                   	pop    %rbx
  80431d:	5d                   	pop    %rbp
  80431e:	c3                   	retq   

000000000080431f <_pipeisclosed>:
  80431f:	55                   	push   %rbp
  804320:	48 89 e5             	mov    %rsp,%rbp
  804323:	53                   	push   %rbx
  804324:	48 83 ec 28          	sub    $0x28,%rsp
  804328:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80432c:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804330:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  804337:	00 00 00 
  80433a:	48 8b 00             	mov    (%rax),%rax
  80433d:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  804343:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804346:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80434a:	48 89 c7             	mov    %rax,%rdi
  80434d:	48 b8 6e 4b 80 00 00 	movabs $0x804b6e,%rax
  804354:	00 00 00 
  804357:	ff d0                	callq  *%rax
  804359:	89 c3                	mov    %eax,%ebx
  80435b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80435f:	48 89 c7             	mov    %rax,%rdi
  804362:	48 b8 6e 4b 80 00 00 	movabs $0x804b6e,%rax
  804369:	00 00 00 
  80436c:	ff d0                	callq  *%rax
  80436e:	39 c3                	cmp    %eax,%ebx
  804370:	0f 94 c0             	sete   %al
  804373:	0f b6 c0             	movzbl %al,%eax
  804376:	89 45 e8             	mov    %eax,-0x18(%rbp)
  804379:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  804380:	00 00 00 
  804383:	48 8b 00             	mov    (%rax),%rax
  804386:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80438c:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  80438f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804392:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  804395:	75 05                	jne    80439c <_pipeisclosed+0x7d>
  804397:	8b 45 e8             	mov    -0x18(%rbp),%eax
  80439a:	eb 4f                	jmp    8043eb <_pipeisclosed+0xcc>
  80439c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80439f:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  8043a2:	74 42                	je     8043e6 <_pipeisclosed+0xc7>
  8043a4:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  8043a8:	75 3c                	jne    8043e6 <_pipeisclosed+0xc7>
  8043aa:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8043b1:	00 00 00 
  8043b4:	48 8b 00             	mov    (%rax),%rax
  8043b7:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  8043bd:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  8043c0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8043c3:	89 c6                	mov    %eax,%esi
  8043c5:	48 bf c6 53 80 00 00 	movabs $0x8053c6,%rdi
  8043cc:	00 00 00 
  8043cf:	b8 00 00 00 00       	mov    $0x0,%eax
  8043d4:	49 b8 c6 03 80 00 00 	movabs $0x8003c6,%r8
  8043db:	00 00 00 
  8043de:	41 ff d0             	callq  *%r8
  8043e1:	e9 4a ff ff ff       	jmpq   804330 <_pipeisclosed+0x11>
  8043e6:	e9 45 ff ff ff       	jmpq   804330 <_pipeisclosed+0x11>
  8043eb:	48 83 c4 28          	add    $0x28,%rsp
  8043ef:	5b                   	pop    %rbx
  8043f0:	5d                   	pop    %rbp
  8043f1:	c3                   	retq   

00000000008043f2 <pipeisclosed>:
  8043f2:	55                   	push   %rbp
  8043f3:	48 89 e5             	mov    %rsp,%rbp
  8043f6:	48 83 ec 30          	sub    $0x30,%rsp
  8043fa:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8043fd:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  804401:	8b 45 dc             	mov    -0x24(%rbp),%eax
  804404:	48 89 d6             	mov    %rdx,%rsi
  804407:	89 c7                	mov    %eax,%edi
  804409:	48 b8 6e 1e 80 00 00 	movabs $0x801e6e,%rax
  804410:	00 00 00 
  804413:	ff d0                	callq  *%rax
  804415:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804418:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80441c:	79 05                	jns    804423 <pipeisclosed+0x31>
  80441e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804421:	eb 31                	jmp    804454 <pipeisclosed+0x62>
  804423:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804427:	48 89 c7             	mov    %rax,%rdi
  80442a:	48 b8 ab 1d 80 00 00 	movabs $0x801dab,%rax
  804431:	00 00 00 
  804434:	ff d0                	callq  *%rax
  804436:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80443a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80443e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804442:	48 89 d6             	mov    %rdx,%rsi
  804445:	48 89 c7             	mov    %rax,%rdi
  804448:	48 b8 1f 43 80 00 00 	movabs $0x80431f,%rax
  80444f:	00 00 00 
  804452:	ff d0                	callq  *%rax
  804454:	c9                   	leaveq 
  804455:	c3                   	retq   

0000000000804456 <devpipe_read>:
  804456:	55                   	push   %rbp
  804457:	48 89 e5             	mov    %rsp,%rbp
  80445a:	48 83 ec 40          	sub    $0x40,%rsp
  80445e:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804462:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804466:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80446a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80446e:	48 89 c7             	mov    %rax,%rdi
  804471:	48 b8 ab 1d 80 00 00 	movabs $0x801dab,%rax
  804478:	00 00 00 
  80447b:	ff d0                	callq  *%rax
  80447d:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804481:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804485:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804489:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804490:	00 
  804491:	e9 92 00 00 00       	jmpq   804528 <devpipe_read+0xd2>
  804496:	eb 41                	jmp    8044d9 <devpipe_read+0x83>
  804498:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  80449d:	74 09                	je     8044a8 <devpipe_read+0x52>
  80449f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8044a3:	e9 92 00 00 00       	jmpq   80453a <devpipe_read+0xe4>
  8044a8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8044ac:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8044b0:	48 89 d6             	mov    %rdx,%rsi
  8044b3:	48 89 c7             	mov    %rax,%rdi
  8044b6:	48 b8 1f 43 80 00 00 	movabs $0x80431f,%rax
  8044bd:	00 00 00 
  8044c0:	ff d0                	callq  *%rax
  8044c2:	85 c0                	test   %eax,%eax
  8044c4:	74 07                	je     8044cd <devpipe_read+0x77>
  8044c6:	b8 00 00 00 00       	mov    $0x0,%eax
  8044cb:	eb 6d                	jmp    80453a <devpipe_read+0xe4>
  8044cd:	48 b8 6c 18 80 00 00 	movabs $0x80186c,%rax
  8044d4:	00 00 00 
  8044d7:	ff d0                	callq  *%rax
  8044d9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8044dd:	8b 10                	mov    (%rax),%edx
  8044df:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8044e3:	8b 40 04             	mov    0x4(%rax),%eax
  8044e6:	39 c2                	cmp    %eax,%edx
  8044e8:	74 ae                	je     804498 <devpipe_read+0x42>
  8044ea:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8044ee:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8044f2:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  8044f6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8044fa:	8b 00                	mov    (%rax),%eax
  8044fc:	99                   	cltd   
  8044fd:	c1 ea 1b             	shr    $0x1b,%edx
  804500:	01 d0                	add    %edx,%eax
  804502:	83 e0 1f             	and    $0x1f,%eax
  804505:	29 d0                	sub    %edx,%eax
  804507:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80450b:	48 98                	cltq   
  80450d:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  804512:	88 01                	mov    %al,(%rcx)
  804514:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804518:	8b 00                	mov    (%rax),%eax
  80451a:	8d 50 01             	lea    0x1(%rax),%edx
  80451d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804521:	89 10                	mov    %edx,(%rax)
  804523:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  804528:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80452c:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  804530:	0f 82 60 ff ff ff    	jb     804496 <devpipe_read+0x40>
  804536:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80453a:	c9                   	leaveq 
  80453b:	c3                   	retq   

000000000080453c <devpipe_write>:
  80453c:	55                   	push   %rbp
  80453d:	48 89 e5             	mov    %rsp,%rbp
  804540:	48 83 ec 40          	sub    $0x40,%rsp
  804544:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804548:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80454c:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  804550:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804554:	48 89 c7             	mov    %rax,%rdi
  804557:	48 b8 ab 1d 80 00 00 	movabs $0x801dab,%rax
  80455e:	00 00 00 
  804561:	ff d0                	callq  *%rax
  804563:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804567:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80456b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80456f:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804576:	00 
  804577:	e9 8e 00 00 00       	jmpq   80460a <devpipe_write+0xce>
  80457c:	eb 31                	jmp    8045af <devpipe_write+0x73>
  80457e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804582:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804586:	48 89 d6             	mov    %rdx,%rsi
  804589:	48 89 c7             	mov    %rax,%rdi
  80458c:	48 b8 1f 43 80 00 00 	movabs $0x80431f,%rax
  804593:	00 00 00 
  804596:	ff d0                	callq  *%rax
  804598:	85 c0                	test   %eax,%eax
  80459a:	74 07                	je     8045a3 <devpipe_write+0x67>
  80459c:	b8 00 00 00 00       	mov    $0x0,%eax
  8045a1:	eb 79                	jmp    80461c <devpipe_write+0xe0>
  8045a3:	48 b8 6c 18 80 00 00 	movabs $0x80186c,%rax
  8045aa:	00 00 00 
  8045ad:	ff d0                	callq  *%rax
  8045af:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8045b3:	8b 40 04             	mov    0x4(%rax),%eax
  8045b6:	48 63 d0             	movslq %eax,%rdx
  8045b9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8045bd:	8b 00                	mov    (%rax),%eax
  8045bf:	48 98                	cltq   
  8045c1:	48 83 c0 20          	add    $0x20,%rax
  8045c5:	48 39 c2             	cmp    %rax,%rdx
  8045c8:	73 b4                	jae    80457e <devpipe_write+0x42>
  8045ca:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8045ce:	8b 40 04             	mov    0x4(%rax),%eax
  8045d1:	99                   	cltd   
  8045d2:	c1 ea 1b             	shr    $0x1b,%edx
  8045d5:	01 d0                	add    %edx,%eax
  8045d7:	83 e0 1f             	and    $0x1f,%eax
  8045da:	29 d0                	sub    %edx,%eax
  8045dc:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8045e0:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8045e4:	48 01 ca             	add    %rcx,%rdx
  8045e7:	0f b6 0a             	movzbl (%rdx),%ecx
  8045ea:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8045ee:	48 98                	cltq   
  8045f0:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  8045f4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8045f8:	8b 40 04             	mov    0x4(%rax),%eax
  8045fb:	8d 50 01             	lea    0x1(%rax),%edx
  8045fe:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804602:	89 50 04             	mov    %edx,0x4(%rax)
  804605:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80460a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80460e:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  804612:	0f 82 64 ff ff ff    	jb     80457c <devpipe_write+0x40>
  804618:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80461c:	c9                   	leaveq 
  80461d:	c3                   	retq   

000000000080461e <devpipe_stat>:
  80461e:	55                   	push   %rbp
  80461f:	48 89 e5             	mov    %rsp,%rbp
  804622:	48 83 ec 20          	sub    $0x20,%rsp
  804626:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80462a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80462e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804632:	48 89 c7             	mov    %rax,%rdi
  804635:	48 b8 ab 1d 80 00 00 	movabs $0x801dab,%rax
  80463c:	00 00 00 
  80463f:	ff d0                	callq  *%rax
  804641:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804645:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804649:	48 be d9 53 80 00 00 	movabs $0x8053d9,%rsi
  804650:	00 00 00 
  804653:	48 89 c7             	mov    %rax,%rdi
  804656:	48 b8 7b 0f 80 00 00 	movabs $0x800f7b,%rax
  80465d:	00 00 00 
  804660:	ff d0                	callq  *%rax
  804662:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804666:	8b 50 04             	mov    0x4(%rax),%edx
  804669:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80466d:	8b 00                	mov    (%rax),%eax
  80466f:	29 c2                	sub    %eax,%edx
  804671:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804675:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  80467b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80467f:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  804686:	00 00 00 
  804689:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80468d:	48 b9 e0 70 80 00 00 	movabs $0x8070e0,%rcx
  804694:	00 00 00 
  804697:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  80469e:	b8 00 00 00 00       	mov    $0x0,%eax
  8046a3:	c9                   	leaveq 
  8046a4:	c3                   	retq   

00000000008046a5 <devpipe_close>:
  8046a5:	55                   	push   %rbp
  8046a6:	48 89 e5             	mov    %rsp,%rbp
  8046a9:	48 83 ec 10          	sub    $0x10,%rsp
  8046ad:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8046b1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8046b5:	48 89 c6             	mov    %rax,%rsi
  8046b8:	bf 00 00 00 00       	mov    $0x0,%edi
  8046bd:	48 b8 55 19 80 00 00 	movabs $0x801955,%rax
  8046c4:	00 00 00 
  8046c7:	ff d0                	callq  *%rax
  8046c9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8046cd:	48 89 c7             	mov    %rax,%rdi
  8046d0:	48 b8 ab 1d 80 00 00 	movabs $0x801dab,%rax
  8046d7:	00 00 00 
  8046da:	ff d0                	callq  *%rax
  8046dc:	48 89 c6             	mov    %rax,%rsi
  8046df:	bf 00 00 00 00       	mov    $0x0,%edi
  8046e4:	48 b8 55 19 80 00 00 	movabs $0x801955,%rax
  8046eb:	00 00 00 
  8046ee:	ff d0                	callq  *%rax
  8046f0:	c9                   	leaveq 
  8046f1:	c3                   	retq   

00000000008046f2 <cputchar>:
  8046f2:	55                   	push   %rbp
  8046f3:	48 89 e5             	mov    %rsp,%rbp
  8046f6:	48 83 ec 20          	sub    $0x20,%rsp
  8046fa:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8046fd:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804700:	88 45 ff             	mov    %al,-0x1(%rbp)
  804703:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  804707:	be 01 00 00 00       	mov    $0x1,%esi
  80470c:	48 89 c7             	mov    %rax,%rdi
  80470f:	48 b8 62 17 80 00 00 	movabs $0x801762,%rax
  804716:	00 00 00 
  804719:	ff d0                	callq  *%rax
  80471b:	c9                   	leaveq 
  80471c:	c3                   	retq   

000000000080471d <getchar>:
  80471d:	55                   	push   %rbp
  80471e:	48 89 e5             	mov    %rsp,%rbp
  804721:	48 83 ec 10          	sub    $0x10,%rsp
  804725:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  804729:	ba 01 00 00 00       	mov    $0x1,%edx
  80472e:	48 89 c6             	mov    %rax,%rsi
  804731:	bf 00 00 00 00       	mov    $0x0,%edi
  804736:	48 b8 a0 22 80 00 00 	movabs $0x8022a0,%rax
  80473d:	00 00 00 
  804740:	ff d0                	callq  *%rax
  804742:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804745:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804749:	79 05                	jns    804750 <getchar+0x33>
  80474b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80474e:	eb 14                	jmp    804764 <getchar+0x47>
  804750:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804754:	7f 07                	jg     80475d <getchar+0x40>
  804756:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  80475b:	eb 07                	jmp    804764 <getchar+0x47>
  80475d:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  804761:	0f b6 c0             	movzbl %al,%eax
  804764:	c9                   	leaveq 
  804765:	c3                   	retq   

0000000000804766 <iscons>:
  804766:	55                   	push   %rbp
  804767:	48 89 e5             	mov    %rsp,%rbp
  80476a:	48 83 ec 20          	sub    $0x20,%rsp
  80476e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804771:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  804775:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804778:	48 89 d6             	mov    %rdx,%rsi
  80477b:	89 c7                	mov    %eax,%edi
  80477d:	48 b8 6e 1e 80 00 00 	movabs $0x801e6e,%rax
  804784:	00 00 00 
  804787:	ff d0                	callq  *%rax
  804789:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80478c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804790:	79 05                	jns    804797 <iscons+0x31>
  804792:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804795:	eb 1a                	jmp    8047b1 <iscons+0x4b>
  804797:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80479b:	8b 10                	mov    (%rax),%edx
  80479d:	48 b8 20 71 80 00 00 	movabs $0x807120,%rax
  8047a4:	00 00 00 
  8047a7:	8b 00                	mov    (%rax),%eax
  8047a9:	39 c2                	cmp    %eax,%edx
  8047ab:	0f 94 c0             	sete   %al
  8047ae:	0f b6 c0             	movzbl %al,%eax
  8047b1:	c9                   	leaveq 
  8047b2:	c3                   	retq   

00000000008047b3 <opencons>:
  8047b3:	55                   	push   %rbp
  8047b4:	48 89 e5             	mov    %rsp,%rbp
  8047b7:	48 83 ec 10          	sub    $0x10,%rsp
  8047bb:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8047bf:	48 89 c7             	mov    %rax,%rdi
  8047c2:	48 b8 d6 1d 80 00 00 	movabs $0x801dd6,%rax
  8047c9:	00 00 00 
  8047cc:	ff d0                	callq  *%rax
  8047ce:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8047d1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8047d5:	79 05                	jns    8047dc <opencons+0x29>
  8047d7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8047da:	eb 5b                	jmp    804837 <opencons+0x84>
  8047dc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8047e0:	ba 07 04 00 00       	mov    $0x407,%edx
  8047e5:	48 89 c6             	mov    %rax,%rsi
  8047e8:	bf 00 00 00 00       	mov    $0x0,%edi
  8047ed:	48 b8 aa 18 80 00 00 	movabs $0x8018aa,%rax
  8047f4:	00 00 00 
  8047f7:	ff d0                	callq  *%rax
  8047f9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8047fc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804800:	79 05                	jns    804807 <opencons+0x54>
  804802:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804805:	eb 30                	jmp    804837 <opencons+0x84>
  804807:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80480b:	48 ba 20 71 80 00 00 	movabs $0x807120,%rdx
  804812:	00 00 00 
  804815:	8b 12                	mov    (%rdx),%edx
  804817:	89 10                	mov    %edx,(%rax)
  804819:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80481d:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  804824:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804828:	48 89 c7             	mov    %rax,%rdi
  80482b:	48 b8 88 1d 80 00 00 	movabs $0x801d88,%rax
  804832:	00 00 00 
  804835:	ff d0                	callq  *%rax
  804837:	c9                   	leaveq 
  804838:	c3                   	retq   

0000000000804839 <devcons_read>:
  804839:	55                   	push   %rbp
  80483a:	48 89 e5             	mov    %rsp,%rbp
  80483d:	48 83 ec 30          	sub    $0x30,%rsp
  804841:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804845:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804849:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80484d:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804852:	75 07                	jne    80485b <devcons_read+0x22>
  804854:	b8 00 00 00 00       	mov    $0x0,%eax
  804859:	eb 4b                	jmp    8048a6 <devcons_read+0x6d>
  80485b:	eb 0c                	jmp    804869 <devcons_read+0x30>
  80485d:	48 b8 6c 18 80 00 00 	movabs $0x80186c,%rax
  804864:	00 00 00 
  804867:	ff d0                	callq  *%rax
  804869:	48 b8 ac 17 80 00 00 	movabs $0x8017ac,%rax
  804870:	00 00 00 
  804873:	ff d0                	callq  *%rax
  804875:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804878:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80487c:	74 df                	je     80485d <devcons_read+0x24>
  80487e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804882:	79 05                	jns    804889 <devcons_read+0x50>
  804884:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804887:	eb 1d                	jmp    8048a6 <devcons_read+0x6d>
  804889:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  80488d:	75 07                	jne    804896 <devcons_read+0x5d>
  80488f:	b8 00 00 00 00       	mov    $0x0,%eax
  804894:	eb 10                	jmp    8048a6 <devcons_read+0x6d>
  804896:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804899:	89 c2                	mov    %eax,%edx
  80489b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80489f:	88 10                	mov    %dl,(%rax)
  8048a1:	b8 01 00 00 00       	mov    $0x1,%eax
  8048a6:	c9                   	leaveq 
  8048a7:	c3                   	retq   

00000000008048a8 <devcons_write>:
  8048a8:	55                   	push   %rbp
  8048a9:	48 89 e5             	mov    %rsp,%rbp
  8048ac:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  8048b3:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  8048ba:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  8048c1:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  8048c8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8048cf:	eb 76                	jmp    804947 <devcons_write+0x9f>
  8048d1:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  8048d8:	89 c2                	mov    %eax,%edx
  8048da:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8048dd:	29 c2                	sub    %eax,%edx
  8048df:	89 d0                	mov    %edx,%eax
  8048e1:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8048e4:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8048e7:	83 f8 7f             	cmp    $0x7f,%eax
  8048ea:	76 07                	jbe    8048f3 <devcons_write+0x4b>
  8048ec:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  8048f3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8048f6:	48 63 d0             	movslq %eax,%rdx
  8048f9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8048fc:	48 63 c8             	movslq %eax,%rcx
  8048ff:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  804906:	48 01 c1             	add    %rax,%rcx
  804909:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  804910:	48 89 ce             	mov    %rcx,%rsi
  804913:	48 89 c7             	mov    %rax,%rdi
  804916:	48 b8 9f 12 80 00 00 	movabs $0x80129f,%rax
  80491d:	00 00 00 
  804920:	ff d0                	callq  *%rax
  804922:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804925:	48 63 d0             	movslq %eax,%rdx
  804928:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  80492f:	48 89 d6             	mov    %rdx,%rsi
  804932:	48 89 c7             	mov    %rax,%rdi
  804935:	48 b8 62 17 80 00 00 	movabs $0x801762,%rax
  80493c:	00 00 00 
  80493f:	ff d0                	callq  *%rax
  804941:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804944:	01 45 fc             	add    %eax,-0x4(%rbp)
  804947:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80494a:	48 98                	cltq   
  80494c:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  804953:	0f 82 78 ff ff ff    	jb     8048d1 <devcons_write+0x29>
  804959:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80495c:	c9                   	leaveq 
  80495d:	c3                   	retq   

000000000080495e <devcons_close>:
  80495e:	55                   	push   %rbp
  80495f:	48 89 e5             	mov    %rsp,%rbp
  804962:	48 83 ec 08          	sub    $0x8,%rsp
  804966:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80496a:	b8 00 00 00 00       	mov    $0x0,%eax
  80496f:	c9                   	leaveq 
  804970:	c3                   	retq   

0000000000804971 <devcons_stat>:
  804971:	55                   	push   %rbp
  804972:	48 89 e5             	mov    %rsp,%rbp
  804975:	48 83 ec 10          	sub    $0x10,%rsp
  804979:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80497d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804981:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804985:	48 be e5 53 80 00 00 	movabs $0x8053e5,%rsi
  80498c:	00 00 00 
  80498f:	48 89 c7             	mov    %rax,%rdi
  804992:	48 b8 7b 0f 80 00 00 	movabs $0x800f7b,%rax
  804999:	00 00 00 
  80499c:	ff d0                	callq  *%rax
  80499e:	b8 00 00 00 00       	mov    $0x0,%eax
  8049a3:	c9                   	leaveq 
  8049a4:	c3                   	retq   

00000000008049a5 <ipc_recv>:
  8049a5:	55                   	push   %rbp
  8049a6:	48 89 e5             	mov    %rsp,%rbp
  8049a9:	48 83 ec 30          	sub    $0x30,%rsp
  8049ad:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8049b1:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8049b5:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8049b9:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8049be:	75 0e                	jne    8049ce <ipc_recv+0x29>
  8049c0:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8049c7:	00 00 00 
  8049ca:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8049ce:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8049d2:	48 89 c7             	mov    %rax,%rdi
  8049d5:	48 b8 d3 1a 80 00 00 	movabs $0x801ad3,%rax
  8049dc:	00 00 00 
  8049df:	ff d0                	callq  *%rax
  8049e1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8049e4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8049e8:	79 27                	jns    804a11 <ipc_recv+0x6c>
  8049ea:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8049ef:	74 0a                	je     8049fb <ipc_recv+0x56>
  8049f1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8049f5:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8049fb:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804a00:	74 0a                	je     804a0c <ipc_recv+0x67>
  804a02:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804a06:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  804a0c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804a0f:	eb 53                	jmp    804a64 <ipc_recv+0xbf>
  804a11:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  804a16:	74 19                	je     804a31 <ipc_recv+0x8c>
  804a18:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  804a1f:	00 00 00 
  804a22:	48 8b 00             	mov    (%rax),%rax
  804a25:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  804a2b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804a2f:	89 10                	mov    %edx,(%rax)
  804a31:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804a36:	74 19                	je     804a51 <ipc_recv+0xac>
  804a38:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  804a3f:	00 00 00 
  804a42:	48 8b 00             	mov    (%rax),%rax
  804a45:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  804a4b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804a4f:	89 10                	mov    %edx,(%rax)
  804a51:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  804a58:	00 00 00 
  804a5b:	48 8b 00             	mov    (%rax),%rax
  804a5e:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  804a64:	c9                   	leaveq 
  804a65:	c3                   	retq   

0000000000804a66 <ipc_send>:
  804a66:	55                   	push   %rbp
  804a67:	48 89 e5             	mov    %rsp,%rbp
  804a6a:	48 83 ec 30          	sub    $0x30,%rsp
  804a6e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804a71:	89 75 e8             	mov    %esi,-0x18(%rbp)
  804a74:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  804a78:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  804a7b:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  804a80:	75 10                	jne    804a92 <ipc_send+0x2c>
  804a82:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804a89:	00 00 00 
  804a8c:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804a90:	eb 0e                	jmp    804aa0 <ipc_send+0x3a>
  804a92:	eb 0c                	jmp    804aa0 <ipc_send+0x3a>
  804a94:	48 b8 6c 18 80 00 00 	movabs $0x80186c,%rax
  804a9b:	00 00 00 
  804a9e:	ff d0                	callq  *%rax
  804aa0:	8b 75 e8             	mov    -0x18(%rbp),%esi
  804aa3:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  804aa6:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  804aaa:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804aad:	89 c7                	mov    %eax,%edi
  804aaf:	48 b8 7e 1a 80 00 00 	movabs $0x801a7e,%rax
  804ab6:	00 00 00 
  804ab9:	ff d0                	callq  *%rax
  804abb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804abe:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  804ac2:	74 d0                	je     804a94 <ipc_send+0x2e>
  804ac4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804ac8:	79 30                	jns    804afa <ipc_send+0x94>
  804aca:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804acd:	89 c1                	mov    %eax,%ecx
  804acf:	48 ba ec 53 80 00 00 	movabs $0x8053ec,%rdx
  804ad6:	00 00 00 
  804ad9:	be 44 00 00 00       	mov    $0x44,%esi
  804ade:	48 bf 02 54 80 00 00 	movabs $0x805402,%rdi
  804ae5:	00 00 00 
  804ae8:	b8 00 00 00 00       	mov    $0x0,%eax
  804aed:	49 b8 8d 01 80 00 00 	movabs $0x80018d,%r8
  804af4:	00 00 00 
  804af7:	41 ff d0             	callq  *%r8
  804afa:	c9                   	leaveq 
  804afb:	c3                   	retq   

0000000000804afc <ipc_find_env>:
  804afc:	55                   	push   %rbp
  804afd:	48 89 e5             	mov    %rsp,%rbp
  804b00:	48 83 ec 14          	sub    $0x14,%rsp
  804b04:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804b07:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804b0e:	eb 4e                	jmp    804b5e <ipc_find_env+0x62>
  804b10:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804b17:	00 00 00 
  804b1a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804b1d:	48 98                	cltq   
  804b1f:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804b26:	48 01 d0             	add    %rdx,%rax
  804b29:	48 05 d0 00 00 00    	add    $0xd0,%rax
  804b2f:	8b 00                	mov    (%rax),%eax
  804b31:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  804b34:	75 24                	jne    804b5a <ipc_find_env+0x5e>
  804b36:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804b3d:	00 00 00 
  804b40:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804b43:	48 98                	cltq   
  804b45:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804b4c:	48 01 d0             	add    %rdx,%rax
  804b4f:	48 05 c0 00 00 00    	add    $0xc0,%rax
  804b55:	8b 40 08             	mov    0x8(%rax),%eax
  804b58:	eb 12                	jmp    804b6c <ipc_find_env+0x70>
  804b5a:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  804b5e:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  804b65:	7e a9                	jle    804b10 <ipc_find_env+0x14>
  804b67:	b8 00 00 00 00       	mov    $0x0,%eax
  804b6c:	c9                   	leaveq 
  804b6d:	c3                   	retq   

0000000000804b6e <pageref>:
  804b6e:	55                   	push   %rbp
  804b6f:	48 89 e5             	mov    %rsp,%rbp
  804b72:	48 83 ec 18          	sub    $0x18,%rsp
  804b76:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804b7a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804b7e:	48 c1 e8 15          	shr    $0x15,%rax
  804b82:	48 89 c2             	mov    %rax,%rdx
  804b85:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  804b8c:	01 00 00 
  804b8f:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804b93:	83 e0 01             	and    $0x1,%eax
  804b96:	48 85 c0             	test   %rax,%rax
  804b99:	75 07                	jne    804ba2 <pageref+0x34>
  804b9b:	b8 00 00 00 00       	mov    $0x0,%eax
  804ba0:	eb 53                	jmp    804bf5 <pageref+0x87>
  804ba2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804ba6:	48 c1 e8 0c          	shr    $0xc,%rax
  804baa:	48 89 c2             	mov    %rax,%rdx
  804bad:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  804bb4:	01 00 00 
  804bb7:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804bbb:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804bbf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804bc3:	83 e0 01             	and    $0x1,%eax
  804bc6:	48 85 c0             	test   %rax,%rax
  804bc9:	75 07                	jne    804bd2 <pageref+0x64>
  804bcb:	b8 00 00 00 00       	mov    $0x0,%eax
  804bd0:	eb 23                	jmp    804bf5 <pageref+0x87>
  804bd2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804bd6:	48 c1 e8 0c          	shr    $0xc,%rax
  804bda:	48 89 c2             	mov    %rax,%rdx
  804bdd:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  804be4:	00 00 00 
  804be7:	48 c1 e2 04          	shl    $0x4,%rdx
  804beb:	48 01 d0             	add    %rdx,%rax
  804bee:	0f b7 40 08          	movzwl 0x8(%rax),%eax
  804bf2:	0f b7 c0             	movzwl %ax,%eax
  804bf5:	c9                   	leaveq 
  804bf6:	c3                   	retq   
