
obj/user/cat:     file format elf64-x86-64


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
  80003c:	e8 08 02 00 00       	callq  800249 <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <cat>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 20          	sub    $0x20,%rsp
  80004b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80004e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800052:	eb 68                	jmp    8000bc <cat+0x79>
  800054:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800058:	48 89 c2             	mov    %rax,%rdx
  80005b:	48 be 20 70 80 00 00 	movabs $0x807020,%rsi
  800062:	00 00 00 
  800065:	bf 01 00 00 00       	mov    $0x1,%edi
  80006a:	48 b8 4c 25 80 00 00 	movabs $0x80254c,%rax
  800071:	00 00 00 
  800074:	ff d0                	callq  *%rax
  800076:	89 45 f4             	mov    %eax,-0xc(%rbp)
  800079:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80007c:	48 98                	cltq   
  80007e:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  800082:	74 38                	je     8000bc <cat+0x79>
  800084:	8b 55 f4             	mov    -0xc(%rbp),%edx
  800087:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80008b:	41 89 d0             	mov    %edx,%r8d
  80008e:	48 89 c1             	mov    %rax,%rcx
  800091:	48 ba 00 45 80 00 00 	movabs $0x804500,%rdx
  800098:	00 00 00 
  80009b:	be 0e 00 00 00       	mov    $0xe,%esi
  8000a0:	48 bf 1b 45 80 00 00 	movabs $0x80451b,%rdi
  8000a7:	00 00 00 
  8000aa:	b8 00 00 00 00       	mov    $0x0,%eax
  8000af:	49 b9 ef 02 80 00 00 	movabs $0x8002ef,%r9
  8000b6:	00 00 00 
  8000b9:	41 ff d1             	callq  *%r9
  8000bc:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8000bf:	ba 00 20 00 00       	mov    $0x2000,%edx
  8000c4:	48 be 20 70 80 00 00 	movabs $0x807020,%rsi
  8000cb:	00 00 00 
  8000ce:	89 c7                	mov    %eax,%edi
  8000d0:	48 b8 02 24 80 00 00 	movabs $0x802402,%rax
  8000d7:	00 00 00 
  8000da:	ff d0                	callq  *%rax
  8000dc:	48 98                	cltq   
  8000de:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8000e2:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  8000e7:	0f 8f 67 ff ff ff    	jg     800054 <cat+0x11>
  8000ed:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  8000f2:	79 39                	jns    80012d <cat+0xea>
  8000f4:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8000f8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8000fc:	49 89 d0             	mov    %rdx,%r8
  8000ff:	48 89 c1             	mov    %rax,%rcx
  800102:	48 ba 29 45 80 00 00 	movabs $0x804529,%rdx
  800109:	00 00 00 
  80010c:	be 10 00 00 00       	mov    $0x10,%esi
  800111:	48 bf 1b 45 80 00 00 	movabs $0x80451b,%rdi
  800118:	00 00 00 
  80011b:	b8 00 00 00 00       	mov    $0x0,%eax
  800120:	49 b9 ef 02 80 00 00 	movabs $0x8002ef,%r9
  800127:	00 00 00 
  80012a:	41 ff d1             	callq  *%r9
  80012d:	c9                   	leaveq 
  80012e:	c3                   	retq   

000000000080012f <umain>:
  80012f:	55                   	push   %rbp
  800130:	48 89 e5             	mov    %rsp,%rbp
  800133:	53                   	push   %rbx
  800134:	48 83 ec 28          	sub    $0x28,%rsp
  800138:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80013b:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80013f:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  800146:	00 00 00 
  800149:	48 bb 3e 45 80 00 00 	movabs $0x80453e,%rbx
  800150:	00 00 00 
  800153:	48 89 18             	mov    %rbx,(%rax)
  800156:	83 7d dc 01          	cmpl   $0x1,-0x24(%rbp)
  80015a:	75 20                	jne    80017c <umain+0x4d>
  80015c:	48 be 42 45 80 00 00 	movabs $0x804542,%rsi
  800163:	00 00 00 
  800166:	bf 00 00 00 00       	mov    $0x0,%edi
  80016b:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800172:	00 00 00 
  800175:	ff d0                	callq  *%rax
  800177:	e9 c6 00 00 00       	jmpq   800242 <umain+0x113>
  80017c:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%rbp)
  800183:	e9 ae 00 00 00       	jmpq   800236 <umain+0x107>
  800188:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80018b:	48 98                	cltq   
  80018d:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800194:	00 
  800195:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800199:	48 01 d0             	add    %rdx,%rax
  80019c:	48 8b 00             	mov    (%rax),%rax
  80019f:	be 00 00 00 00       	mov    $0x0,%esi
  8001a4:	48 89 c7             	mov    %rax,%rdi
  8001a7:	48 b8 d8 28 80 00 00 	movabs $0x8028d8,%rax
  8001ae:	00 00 00 
  8001b1:	ff d0                	callq  *%rax
  8001b3:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8001b6:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  8001ba:	79 3a                	jns    8001f6 <umain+0xc7>
  8001bc:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8001bf:	48 98                	cltq   
  8001c1:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8001c8:	00 
  8001c9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8001cd:	48 01 d0             	add    %rdx,%rax
  8001d0:	48 8b 00             	mov    (%rax),%rax
  8001d3:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8001d6:	48 89 c6             	mov    %rax,%rsi
  8001d9:	48 bf 4a 45 80 00 00 	movabs $0x80454a,%rdi
  8001e0:	00 00 00 
  8001e3:	b8 00 00 00 00       	mov    $0x0,%eax
  8001e8:	48 b9 63 31 80 00 00 	movabs $0x803163,%rcx
  8001ef:	00 00 00 
  8001f2:	ff d1                	callq  *%rcx
  8001f4:	eb 3c                	jmp    800232 <umain+0x103>
  8001f6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8001f9:	48 98                	cltq   
  8001fb:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800202:	00 
  800203:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800207:	48 01 d0             	add    %rdx,%rax
  80020a:	48 8b 10             	mov    (%rax),%rdx
  80020d:	8b 45 e8             	mov    -0x18(%rbp),%eax
  800210:	48 89 d6             	mov    %rdx,%rsi
  800213:	89 c7                	mov    %eax,%edi
  800215:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  80021c:	00 00 00 
  80021f:	ff d0                	callq  *%rax
  800221:	8b 45 e8             	mov    -0x18(%rbp),%eax
  800224:	89 c7                	mov    %eax,%edi
  800226:	48 b8 e0 21 80 00 00 	movabs $0x8021e0,%rax
  80022d:	00 00 00 
  800230:	ff d0                	callq  *%rax
  800232:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
  800236:	8b 45 ec             	mov    -0x14(%rbp),%eax
  800239:	3b 45 dc             	cmp    -0x24(%rbp),%eax
  80023c:	0f 8c 46 ff ff ff    	jl     800188 <umain+0x59>
  800242:	48 83 c4 28          	add    $0x28,%rsp
  800246:	5b                   	pop    %rbx
  800247:	5d                   	pop    %rbp
  800248:	c3                   	retq   

0000000000800249 <libmain>:
  800249:	55                   	push   %rbp
  80024a:	48 89 e5             	mov    %rsp,%rbp
  80024d:	48 83 ec 10          	sub    $0x10,%rsp
  800251:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800254:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800258:	48 b8 90 19 80 00 00 	movabs $0x801990,%rax
  80025f:	00 00 00 
  800262:	ff d0                	callq  *%rax
  800264:	25 ff 03 00 00       	and    $0x3ff,%eax
  800269:	48 98                	cltq   
  80026b:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  800272:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  800279:	00 00 00 
  80027c:	48 01 c2             	add    %rax,%rdx
  80027f:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  800286:	00 00 00 
  800289:	48 89 10             	mov    %rdx,(%rax)
  80028c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800290:	7e 14                	jle    8002a6 <libmain+0x5d>
  800292:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800296:	48 8b 10             	mov    (%rax),%rdx
  800299:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  8002a0:	00 00 00 
  8002a3:	48 89 10             	mov    %rdx,(%rax)
  8002a6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8002aa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8002ad:	48 89 d6             	mov    %rdx,%rsi
  8002b0:	89 c7                	mov    %eax,%edi
  8002b2:	48 b8 2f 01 80 00 00 	movabs $0x80012f,%rax
  8002b9:	00 00 00 
  8002bc:	ff d0                	callq  *%rax
  8002be:	48 b8 cc 02 80 00 00 	movabs $0x8002cc,%rax
  8002c5:	00 00 00 
  8002c8:	ff d0                	callq  *%rax
  8002ca:	c9                   	leaveq 
  8002cb:	c3                   	retq   

00000000008002cc <exit>:
  8002cc:	55                   	push   %rbp
  8002cd:	48 89 e5             	mov    %rsp,%rbp
  8002d0:	48 b8 2b 22 80 00 00 	movabs $0x80222b,%rax
  8002d7:	00 00 00 
  8002da:	ff d0                	callq  *%rax
  8002dc:	bf 00 00 00 00       	mov    $0x0,%edi
  8002e1:	48 b8 4c 19 80 00 00 	movabs $0x80194c,%rax
  8002e8:	00 00 00 
  8002eb:	ff d0                	callq  *%rax
  8002ed:	5d                   	pop    %rbp
  8002ee:	c3                   	retq   

00000000008002ef <_panic>:
  8002ef:	55                   	push   %rbp
  8002f0:	48 89 e5             	mov    %rsp,%rbp
  8002f3:	53                   	push   %rbx
  8002f4:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  8002fb:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  800302:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  800308:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  80030f:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  800316:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  80031d:	84 c0                	test   %al,%al
  80031f:	74 23                	je     800344 <_panic+0x55>
  800321:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  800328:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  80032c:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  800330:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  800334:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  800338:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  80033c:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  800340:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  800344:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  80034b:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  800352:	00 00 00 
  800355:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  80035c:	00 00 00 
  80035f:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800363:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  80036a:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  800371:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800378:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  80037f:	00 00 00 
  800382:	48 8b 18             	mov    (%rax),%rbx
  800385:	48 b8 90 19 80 00 00 	movabs $0x801990,%rax
  80038c:	00 00 00 
  80038f:	ff d0                	callq  *%rax
  800391:	8b 8d 14 ff ff ff    	mov    -0xec(%rbp),%ecx
  800397:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  80039e:	41 89 c8             	mov    %ecx,%r8d
  8003a1:	48 89 d1             	mov    %rdx,%rcx
  8003a4:	48 89 da             	mov    %rbx,%rdx
  8003a7:	89 c6                	mov    %eax,%esi
  8003a9:	48 bf 68 45 80 00 00 	movabs $0x804568,%rdi
  8003b0:	00 00 00 
  8003b3:	b8 00 00 00 00       	mov    $0x0,%eax
  8003b8:	49 b9 28 05 80 00 00 	movabs $0x800528,%r9
  8003bf:	00 00 00 
  8003c2:	41 ff d1             	callq  *%r9
  8003c5:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  8003cc:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8003d3:	48 89 d6             	mov    %rdx,%rsi
  8003d6:	48 89 c7             	mov    %rax,%rdi
  8003d9:	48 b8 7c 04 80 00 00 	movabs $0x80047c,%rax
  8003e0:	00 00 00 
  8003e3:	ff d0                	callq  *%rax
  8003e5:	48 bf 8b 45 80 00 00 	movabs $0x80458b,%rdi
  8003ec:	00 00 00 
  8003ef:	b8 00 00 00 00       	mov    $0x0,%eax
  8003f4:	48 ba 28 05 80 00 00 	movabs $0x800528,%rdx
  8003fb:	00 00 00 
  8003fe:	ff d2                	callq  *%rdx
  800400:	cc                   	int3   
  800401:	eb fd                	jmp    800400 <_panic+0x111>

0000000000800403 <putch>:
  800403:	55                   	push   %rbp
  800404:	48 89 e5             	mov    %rsp,%rbp
  800407:	48 83 ec 10          	sub    $0x10,%rsp
  80040b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80040e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800412:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800416:	8b 00                	mov    (%rax),%eax
  800418:	8d 48 01             	lea    0x1(%rax),%ecx
  80041b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80041f:	89 0a                	mov    %ecx,(%rdx)
  800421:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800424:	89 d1                	mov    %edx,%ecx
  800426:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80042a:	48 98                	cltq   
  80042c:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  800430:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800434:	8b 00                	mov    (%rax),%eax
  800436:	3d ff 00 00 00       	cmp    $0xff,%eax
  80043b:	75 2c                	jne    800469 <putch+0x66>
  80043d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800441:	8b 00                	mov    (%rax),%eax
  800443:	48 98                	cltq   
  800445:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800449:	48 83 c2 08          	add    $0x8,%rdx
  80044d:	48 89 c6             	mov    %rax,%rsi
  800450:	48 89 d7             	mov    %rdx,%rdi
  800453:	48 b8 c4 18 80 00 00 	movabs $0x8018c4,%rax
  80045a:	00 00 00 
  80045d:	ff d0                	callq  *%rax
  80045f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800463:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  800469:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80046d:	8b 40 04             	mov    0x4(%rax),%eax
  800470:	8d 50 01             	lea    0x1(%rax),%edx
  800473:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800477:	89 50 04             	mov    %edx,0x4(%rax)
  80047a:	c9                   	leaveq 
  80047b:	c3                   	retq   

000000000080047c <vcprintf>:
  80047c:	55                   	push   %rbp
  80047d:	48 89 e5             	mov    %rsp,%rbp
  800480:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  800487:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  80048e:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  800495:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  80049c:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  8004a3:	48 8b 0a             	mov    (%rdx),%rcx
  8004a6:	48 89 08             	mov    %rcx,(%rax)
  8004a9:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8004ad:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8004b1:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8004b5:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8004b9:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  8004c0:	00 00 00 
  8004c3:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  8004ca:	00 00 00 
  8004cd:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  8004d4:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  8004db:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  8004e2:	48 89 c6             	mov    %rax,%rsi
  8004e5:	48 bf 03 04 80 00 00 	movabs $0x800403,%rdi
  8004ec:	00 00 00 
  8004ef:	48 b8 db 08 80 00 00 	movabs $0x8008db,%rax
  8004f6:	00 00 00 
  8004f9:	ff d0                	callq  *%rax
  8004fb:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  800501:	48 98                	cltq   
  800503:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  80050a:	48 83 c2 08          	add    $0x8,%rdx
  80050e:	48 89 c6             	mov    %rax,%rsi
  800511:	48 89 d7             	mov    %rdx,%rdi
  800514:	48 b8 c4 18 80 00 00 	movabs $0x8018c4,%rax
  80051b:	00 00 00 
  80051e:	ff d0                	callq  *%rax
  800520:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  800526:	c9                   	leaveq 
  800527:	c3                   	retq   

0000000000800528 <cprintf>:
  800528:	55                   	push   %rbp
  800529:	48 89 e5             	mov    %rsp,%rbp
  80052c:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  800533:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  80053a:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  800541:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800548:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  80054f:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800556:	84 c0                	test   %al,%al
  800558:	74 20                	je     80057a <cprintf+0x52>
  80055a:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  80055e:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800562:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800566:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  80056a:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  80056e:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800572:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800576:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  80057a:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800581:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  800588:	00 00 00 
  80058b:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800592:	00 00 00 
  800595:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800599:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8005a0:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8005a7:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8005ae:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  8005b5:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8005bc:	48 8b 0a             	mov    (%rdx),%rcx
  8005bf:	48 89 08             	mov    %rcx,(%rax)
  8005c2:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8005c6:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8005ca:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8005ce:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8005d2:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  8005d9:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8005e0:	48 89 d6             	mov    %rdx,%rsi
  8005e3:	48 89 c7             	mov    %rax,%rdi
  8005e6:	48 b8 7c 04 80 00 00 	movabs $0x80047c,%rax
  8005ed:	00 00 00 
  8005f0:	ff d0                	callq  *%rax
  8005f2:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  8005f8:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  8005fe:	c9                   	leaveq 
  8005ff:	c3                   	retq   

0000000000800600 <printnum>:
  800600:	55                   	push   %rbp
  800601:	48 89 e5             	mov    %rsp,%rbp
  800604:	53                   	push   %rbx
  800605:	48 83 ec 38          	sub    $0x38,%rsp
  800609:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80060d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800611:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  800615:	89 4d d4             	mov    %ecx,-0x2c(%rbp)
  800618:	44 89 45 d0          	mov    %r8d,-0x30(%rbp)
  80061c:	44 89 4d cc          	mov    %r9d,-0x34(%rbp)
  800620:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  800623:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  800627:	77 3b                	ja     800664 <printnum+0x64>
  800629:	8b 45 d0             	mov    -0x30(%rbp),%eax
  80062c:	44 8d 40 ff          	lea    -0x1(%rax),%r8d
  800630:	8b 5d d4             	mov    -0x2c(%rbp),%ebx
  800633:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800637:	ba 00 00 00 00       	mov    $0x0,%edx
  80063c:	48 f7 f3             	div    %rbx
  80063f:	48 89 c2             	mov    %rax,%rdx
  800642:	8b 7d cc             	mov    -0x34(%rbp),%edi
  800645:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  800648:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
  80064c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800650:	41 89 f9             	mov    %edi,%r9d
  800653:	48 89 c7             	mov    %rax,%rdi
  800656:	48 b8 00 06 80 00 00 	movabs $0x800600,%rax
  80065d:	00 00 00 
  800660:	ff d0                	callq  *%rax
  800662:	eb 1e                	jmp    800682 <printnum+0x82>
  800664:	eb 12                	jmp    800678 <printnum+0x78>
  800666:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80066a:	8b 55 cc             	mov    -0x34(%rbp),%edx
  80066d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800671:	48 89 ce             	mov    %rcx,%rsi
  800674:	89 d7                	mov    %edx,%edi
  800676:	ff d0                	callq  *%rax
  800678:	83 6d d0 01          	subl   $0x1,-0x30(%rbp)
  80067c:	83 7d d0 00          	cmpl   $0x0,-0x30(%rbp)
  800680:	7f e4                	jg     800666 <printnum+0x66>
  800682:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  800685:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800689:	ba 00 00 00 00       	mov    $0x0,%edx
  80068e:	48 f7 f1             	div    %rcx
  800691:	48 89 d0             	mov    %rdx,%rax
  800694:	48 ba 90 47 80 00 00 	movabs $0x804790,%rdx
  80069b:	00 00 00 
  80069e:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
  8006a2:	0f be d0             	movsbl %al,%edx
  8006a5:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8006a9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006ad:	48 89 ce             	mov    %rcx,%rsi
  8006b0:	89 d7                	mov    %edx,%edi
  8006b2:	ff d0                	callq  *%rax
  8006b4:	48 83 c4 38          	add    $0x38,%rsp
  8006b8:	5b                   	pop    %rbx
  8006b9:	5d                   	pop    %rbp
  8006ba:	c3                   	retq   

00000000008006bb <getuint>:
  8006bb:	55                   	push   %rbp
  8006bc:	48 89 e5             	mov    %rsp,%rbp
  8006bf:	48 83 ec 1c          	sub    $0x1c,%rsp
  8006c3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8006c7:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8006ca:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8006ce:	7e 52                	jle    800722 <getuint+0x67>
  8006d0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006d4:	8b 00                	mov    (%rax),%eax
  8006d6:	83 f8 30             	cmp    $0x30,%eax
  8006d9:	73 24                	jae    8006ff <getuint+0x44>
  8006db:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006df:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8006e3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006e7:	8b 00                	mov    (%rax),%eax
  8006e9:	89 c0                	mov    %eax,%eax
  8006eb:	48 01 d0             	add    %rdx,%rax
  8006ee:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006f2:	8b 12                	mov    (%rdx),%edx
  8006f4:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8006f7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006fb:	89 0a                	mov    %ecx,(%rdx)
  8006fd:	eb 17                	jmp    800716 <getuint+0x5b>
  8006ff:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800703:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800707:	48 89 d0             	mov    %rdx,%rax
  80070a:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  80070e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800712:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800716:	48 8b 00             	mov    (%rax),%rax
  800719:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80071d:	e9 a3 00 00 00       	jmpq   8007c5 <getuint+0x10a>
  800722:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800726:	74 4f                	je     800777 <getuint+0xbc>
  800728:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80072c:	8b 00                	mov    (%rax),%eax
  80072e:	83 f8 30             	cmp    $0x30,%eax
  800731:	73 24                	jae    800757 <getuint+0x9c>
  800733:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800737:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80073b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80073f:	8b 00                	mov    (%rax),%eax
  800741:	89 c0                	mov    %eax,%eax
  800743:	48 01 d0             	add    %rdx,%rax
  800746:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80074a:	8b 12                	mov    (%rdx),%edx
  80074c:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80074f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800753:	89 0a                	mov    %ecx,(%rdx)
  800755:	eb 17                	jmp    80076e <getuint+0xb3>
  800757:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80075b:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80075f:	48 89 d0             	mov    %rdx,%rax
  800762:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800766:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80076a:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80076e:	48 8b 00             	mov    (%rax),%rax
  800771:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800775:	eb 4e                	jmp    8007c5 <getuint+0x10a>
  800777:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80077b:	8b 00                	mov    (%rax),%eax
  80077d:	83 f8 30             	cmp    $0x30,%eax
  800780:	73 24                	jae    8007a6 <getuint+0xeb>
  800782:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800786:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80078a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80078e:	8b 00                	mov    (%rax),%eax
  800790:	89 c0                	mov    %eax,%eax
  800792:	48 01 d0             	add    %rdx,%rax
  800795:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800799:	8b 12                	mov    (%rdx),%edx
  80079b:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80079e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007a2:	89 0a                	mov    %ecx,(%rdx)
  8007a4:	eb 17                	jmp    8007bd <getuint+0x102>
  8007a6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007aa:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8007ae:	48 89 d0             	mov    %rdx,%rax
  8007b1:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8007b5:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007b9:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8007bd:	8b 00                	mov    (%rax),%eax
  8007bf:	89 c0                	mov    %eax,%eax
  8007c1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8007c5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8007c9:	c9                   	leaveq 
  8007ca:	c3                   	retq   

00000000008007cb <getint>:
  8007cb:	55                   	push   %rbp
  8007cc:	48 89 e5             	mov    %rsp,%rbp
  8007cf:	48 83 ec 1c          	sub    $0x1c,%rsp
  8007d3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8007d7:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8007da:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8007de:	7e 52                	jle    800832 <getint+0x67>
  8007e0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007e4:	8b 00                	mov    (%rax),%eax
  8007e6:	83 f8 30             	cmp    $0x30,%eax
  8007e9:	73 24                	jae    80080f <getint+0x44>
  8007eb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007ef:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8007f3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007f7:	8b 00                	mov    (%rax),%eax
  8007f9:	89 c0                	mov    %eax,%eax
  8007fb:	48 01 d0             	add    %rdx,%rax
  8007fe:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800802:	8b 12                	mov    (%rdx),%edx
  800804:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800807:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80080b:	89 0a                	mov    %ecx,(%rdx)
  80080d:	eb 17                	jmp    800826 <getint+0x5b>
  80080f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800813:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800817:	48 89 d0             	mov    %rdx,%rax
  80081a:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  80081e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800822:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800826:	48 8b 00             	mov    (%rax),%rax
  800829:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80082d:	e9 a3 00 00 00       	jmpq   8008d5 <getint+0x10a>
  800832:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800836:	74 4f                	je     800887 <getint+0xbc>
  800838:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80083c:	8b 00                	mov    (%rax),%eax
  80083e:	83 f8 30             	cmp    $0x30,%eax
  800841:	73 24                	jae    800867 <getint+0x9c>
  800843:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800847:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80084b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80084f:	8b 00                	mov    (%rax),%eax
  800851:	89 c0                	mov    %eax,%eax
  800853:	48 01 d0             	add    %rdx,%rax
  800856:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80085a:	8b 12                	mov    (%rdx),%edx
  80085c:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80085f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800863:	89 0a                	mov    %ecx,(%rdx)
  800865:	eb 17                	jmp    80087e <getint+0xb3>
  800867:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80086b:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80086f:	48 89 d0             	mov    %rdx,%rax
  800872:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800876:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80087a:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80087e:	48 8b 00             	mov    (%rax),%rax
  800881:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800885:	eb 4e                	jmp    8008d5 <getint+0x10a>
  800887:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80088b:	8b 00                	mov    (%rax),%eax
  80088d:	83 f8 30             	cmp    $0x30,%eax
  800890:	73 24                	jae    8008b6 <getint+0xeb>
  800892:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800896:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80089a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80089e:	8b 00                	mov    (%rax),%eax
  8008a0:	89 c0                	mov    %eax,%eax
  8008a2:	48 01 d0             	add    %rdx,%rax
  8008a5:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008a9:	8b 12                	mov    (%rdx),%edx
  8008ab:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8008ae:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008b2:	89 0a                	mov    %ecx,(%rdx)
  8008b4:	eb 17                	jmp    8008cd <getint+0x102>
  8008b6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008ba:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8008be:	48 89 d0             	mov    %rdx,%rax
  8008c1:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8008c5:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008c9:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8008cd:	8b 00                	mov    (%rax),%eax
  8008cf:	48 98                	cltq   
  8008d1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8008d5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8008d9:	c9                   	leaveq 
  8008da:	c3                   	retq   

00000000008008db <vprintfmt>:
  8008db:	55                   	push   %rbp
  8008dc:	48 89 e5             	mov    %rsp,%rbp
  8008df:	41 54                	push   %r12
  8008e1:	53                   	push   %rbx
  8008e2:	48 83 ec 60          	sub    $0x60,%rsp
  8008e6:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  8008ea:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  8008ee:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8008f2:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  8008f6:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8008fa:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  8008fe:	48 8b 0a             	mov    (%rdx),%rcx
  800901:	48 89 08             	mov    %rcx,(%rax)
  800904:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800908:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80090c:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800910:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800914:	eb 17                	jmp    80092d <vprintfmt+0x52>
  800916:	85 db                	test   %ebx,%ebx
  800918:	0f 84 cc 04 00 00    	je     800dea <vprintfmt+0x50f>
  80091e:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800922:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800926:	48 89 d6             	mov    %rdx,%rsi
  800929:	89 df                	mov    %ebx,%edi
  80092b:	ff d0                	callq  *%rax
  80092d:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800931:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800935:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800939:	0f b6 00             	movzbl (%rax),%eax
  80093c:	0f b6 d8             	movzbl %al,%ebx
  80093f:	83 fb 25             	cmp    $0x25,%ebx
  800942:	75 d2                	jne    800916 <vprintfmt+0x3b>
  800944:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  800948:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  80094f:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800956:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  80095d:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  800964:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800968:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80096c:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800970:	0f b6 00             	movzbl (%rax),%eax
  800973:	0f b6 d8             	movzbl %al,%ebx
  800976:	8d 43 dd             	lea    -0x23(%rbx),%eax
  800979:	83 f8 55             	cmp    $0x55,%eax
  80097c:	0f 87 34 04 00 00    	ja     800db6 <vprintfmt+0x4db>
  800982:	89 c0                	mov    %eax,%eax
  800984:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  80098b:	00 
  80098c:	48 b8 b8 47 80 00 00 	movabs $0x8047b8,%rax
  800993:	00 00 00 
  800996:	48 01 d0             	add    %rdx,%rax
  800999:	48 8b 00             	mov    (%rax),%rax
  80099c:	ff e0                	jmpq   *%rax
  80099e:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  8009a2:	eb c0                	jmp    800964 <vprintfmt+0x89>
  8009a4:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  8009a8:	eb ba                	jmp    800964 <vprintfmt+0x89>
  8009aa:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  8009b1:	8b 55 d8             	mov    -0x28(%rbp),%edx
  8009b4:	89 d0                	mov    %edx,%eax
  8009b6:	c1 e0 02             	shl    $0x2,%eax
  8009b9:	01 d0                	add    %edx,%eax
  8009bb:	01 c0                	add    %eax,%eax
  8009bd:	01 d8                	add    %ebx,%eax
  8009bf:	83 e8 30             	sub    $0x30,%eax
  8009c2:	89 45 d8             	mov    %eax,-0x28(%rbp)
  8009c5:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8009c9:	0f b6 00             	movzbl (%rax),%eax
  8009cc:	0f be d8             	movsbl %al,%ebx
  8009cf:	83 fb 2f             	cmp    $0x2f,%ebx
  8009d2:	7e 0c                	jle    8009e0 <vprintfmt+0x105>
  8009d4:	83 fb 39             	cmp    $0x39,%ebx
  8009d7:	7f 07                	jg     8009e0 <vprintfmt+0x105>
  8009d9:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  8009de:	eb d1                	jmp    8009b1 <vprintfmt+0xd6>
  8009e0:	eb 58                	jmp    800a3a <vprintfmt+0x15f>
  8009e2:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8009e5:	83 f8 30             	cmp    $0x30,%eax
  8009e8:	73 17                	jae    800a01 <vprintfmt+0x126>
  8009ea:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8009ee:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8009f1:	89 c0                	mov    %eax,%eax
  8009f3:	48 01 d0             	add    %rdx,%rax
  8009f6:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8009f9:	83 c2 08             	add    $0x8,%edx
  8009fc:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8009ff:	eb 0f                	jmp    800a10 <vprintfmt+0x135>
  800a01:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800a05:	48 89 d0             	mov    %rdx,%rax
  800a08:	48 83 c2 08          	add    $0x8,%rdx
  800a0c:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800a10:	8b 00                	mov    (%rax),%eax
  800a12:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800a15:	eb 23                	jmp    800a3a <vprintfmt+0x15f>
  800a17:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800a1b:	79 0c                	jns    800a29 <vprintfmt+0x14e>
  800a1d:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  800a24:	e9 3b ff ff ff       	jmpq   800964 <vprintfmt+0x89>
  800a29:	e9 36 ff ff ff       	jmpq   800964 <vprintfmt+0x89>
  800a2e:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  800a35:	e9 2a ff ff ff       	jmpq   800964 <vprintfmt+0x89>
  800a3a:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800a3e:	79 12                	jns    800a52 <vprintfmt+0x177>
  800a40:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800a43:	89 45 dc             	mov    %eax,-0x24(%rbp)
  800a46:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800a4d:	e9 12 ff ff ff       	jmpq   800964 <vprintfmt+0x89>
  800a52:	e9 0d ff ff ff       	jmpq   800964 <vprintfmt+0x89>
  800a57:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  800a5b:	e9 04 ff ff ff       	jmpq   800964 <vprintfmt+0x89>
  800a60:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800a63:	83 f8 30             	cmp    $0x30,%eax
  800a66:	73 17                	jae    800a7f <vprintfmt+0x1a4>
  800a68:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800a6c:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800a6f:	89 c0                	mov    %eax,%eax
  800a71:	48 01 d0             	add    %rdx,%rax
  800a74:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800a77:	83 c2 08             	add    $0x8,%edx
  800a7a:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800a7d:	eb 0f                	jmp    800a8e <vprintfmt+0x1b3>
  800a7f:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800a83:	48 89 d0             	mov    %rdx,%rax
  800a86:	48 83 c2 08          	add    $0x8,%rdx
  800a8a:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800a8e:	8b 10                	mov    (%rax),%edx
  800a90:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800a94:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a98:	48 89 ce             	mov    %rcx,%rsi
  800a9b:	89 d7                	mov    %edx,%edi
  800a9d:	ff d0                	callq  *%rax
  800a9f:	e9 40 03 00 00       	jmpq   800de4 <vprintfmt+0x509>
  800aa4:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800aa7:	83 f8 30             	cmp    $0x30,%eax
  800aaa:	73 17                	jae    800ac3 <vprintfmt+0x1e8>
  800aac:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800ab0:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800ab3:	89 c0                	mov    %eax,%eax
  800ab5:	48 01 d0             	add    %rdx,%rax
  800ab8:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800abb:	83 c2 08             	add    $0x8,%edx
  800abe:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800ac1:	eb 0f                	jmp    800ad2 <vprintfmt+0x1f7>
  800ac3:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800ac7:	48 89 d0             	mov    %rdx,%rax
  800aca:	48 83 c2 08          	add    $0x8,%rdx
  800ace:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800ad2:	8b 18                	mov    (%rax),%ebx
  800ad4:	85 db                	test   %ebx,%ebx
  800ad6:	79 02                	jns    800ada <vprintfmt+0x1ff>
  800ad8:	f7 db                	neg    %ebx
  800ada:	83 fb 15             	cmp    $0x15,%ebx
  800add:	7f 16                	jg     800af5 <vprintfmt+0x21a>
  800adf:	48 b8 e0 46 80 00 00 	movabs $0x8046e0,%rax
  800ae6:	00 00 00 
  800ae9:	48 63 d3             	movslq %ebx,%rdx
  800aec:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800af0:	4d 85 e4             	test   %r12,%r12
  800af3:	75 2e                	jne    800b23 <vprintfmt+0x248>
  800af5:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800af9:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800afd:	89 d9                	mov    %ebx,%ecx
  800aff:	48 ba a1 47 80 00 00 	movabs $0x8047a1,%rdx
  800b06:	00 00 00 
  800b09:	48 89 c7             	mov    %rax,%rdi
  800b0c:	b8 00 00 00 00       	mov    $0x0,%eax
  800b11:	49 b8 f3 0d 80 00 00 	movabs $0x800df3,%r8
  800b18:	00 00 00 
  800b1b:	41 ff d0             	callq  *%r8
  800b1e:	e9 c1 02 00 00       	jmpq   800de4 <vprintfmt+0x509>
  800b23:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800b27:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b2b:	4c 89 e1             	mov    %r12,%rcx
  800b2e:	48 ba aa 47 80 00 00 	movabs $0x8047aa,%rdx
  800b35:	00 00 00 
  800b38:	48 89 c7             	mov    %rax,%rdi
  800b3b:	b8 00 00 00 00       	mov    $0x0,%eax
  800b40:	49 b8 f3 0d 80 00 00 	movabs $0x800df3,%r8
  800b47:	00 00 00 
  800b4a:	41 ff d0             	callq  *%r8
  800b4d:	e9 92 02 00 00       	jmpq   800de4 <vprintfmt+0x509>
  800b52:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b55:	83 f8 30             	cmp    $0x30,%eax
  800b58:	73 17                	jae    800b71 <vprintfmt+0x296>
  800b5a:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800b5e:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b61:	89 c0                	mov    %eax,%eax
  800b63:	48 01 d0             	add    %rdx,%rax
  800b66:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b69:	83 c2 08             	add    $0x8,%edx
  800b6c:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800b6f:	eb 0f                	jmp    800b80 <vprintfmt+0x2a5>
  800b71:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800b75:	48 89 d0             	mov    %rdx,%rax
  800b78:	48 83 c2 08          	add    $0x8,%rdx
  800b7c:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800b80:	4c 8b 20             	mov    (%rax),%r12
  800b83:	4d 85 e4             	test   %r12,%r12
  800b86:	75 0a                	jne    800b92 <vprintfmt+0x2b7>
  800b88:	49 bc ad 47 80 00 00 	movabs $0x8047ad,%r12
  800b8f:	00 00 00 
  800b92:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800b96:	7e 3f                	jle    800bd7 <vprintfmt+0x2fc>
  800b98:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  800b9c:	74 39                	je     800bd7 <vprintfmt+0x2fc>
  800b9e:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800ba1:	48 98                	cltq   
  800ba3:	48 89 c6             	mov    %rax,%rsi
  800ba6:	4c 89 e7             	mov    %r12,%rdi
  800ba9:	48 b8 9f 10 80 00 00 	movabs $0x80109f,%rax
  800bb0:	00 00 00 
  800bb3:	ff d0                	callq  *%rax
  800bb5:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800bb8:	eb 17                	jmp    800bd1 <vprintfmt+0x2f6>
  800bba:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800bbe:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800bc2:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800bc6:	48 89 ce             	mov    %rcx,%rsi
  800bc9:	89 d7                	mov    %edx,%edi
  800bcb:	ff d0                	callq  *%rax
  800bcd:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800bd1:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800bd5:	7f e3                	jg     800bba <vprintfmt+0x2df>
  800bd7:	eb 37                	jmp    800c10 <vprintfmt+0x335>
  800bd9:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  800bdd:	74 1e                	je     800bfd <vprintfmt+0x322>
  800bdf:	83 fb 1f             	cmp    $0x1f,%ebx
  800be2:	7e 05                	jle    800be9 <vprintfmt+0x30e>
  800be4:	83 fb 7e             	cmp    $0x7e,%ebx
  800be7:	7e 14                	jle    800bfd <vprintfmt+0x322>
  800be9:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800bed:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800bf1:	48 89 d6             	mov    %rdx,%rsi
  800bf4:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800bf9:	ff d0                	callq  *%rax
  800bfb:	eb 0f                	jmp    800c0c <vprintfmt+0x331>
  800bfd:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c01:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c05:	48 89 d6             	mov    %rdx,%rsi
  800c08:	89 df                	mov    %ebx,%edi
  800c0a:	ff d0                	callq  *%rax
  800c0c:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800c10:	4c 89 e0             	mov    %r12,%rax
  800c13:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800c17:	0f b6 00             	movzbl (%rax),%eax
  800c1a:	0f be d8             	movsbl %al,%ebx
  800c1d:	85 db                	test   %ebx,%ebx
  800c1f:	74 10                	je     800c31 <vprintfmt+0x356>
  800c21:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800c25:	78 b2                	js     800bd9 <vprintfmt+0x2fe>
  800c27:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800c2b:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800c2f:	79 a8                	jns    800bd9 <vprintfmt+0x2fe>
  800c31:	eb 16                	jmp    800c49 <vprintfmt+0x36e>
  800c33:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c37:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c3b:	48 89 d6             	mov    %rdx,%rsi
  800c3e:	bf 20 00 00 00       	mov    $0x20,%edi
  800c43:	ff d0                	callq  *%rax
  800c45:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800c49:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800c4d:	7f e4                	jg     800c33 <vprintfmt+0x358>
  800c4f:	e9 90 01 00 00       	jmpq   800de4 <vprintfmt+0x509>
  800c54:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800c58:	be 03 00 00 00       	mov    $0x3,%esi
  800c5d:	48 89 c7             	mov    %rax,%rdi
  800c60:	48 b8 cb 07 80 00 00 	movabs $0x8007cb,%rax
  800c67:	00 00 00 
  800c6a:	ff d0                	callq  *%rax
  800c6c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800c70:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c74:	48 85 c0             	test   %rax,%rax
  800c77:	79 1d                	jns    800c96 <vprintfmt+0x3bb>
  800c79:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c7d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c81:	48 89 d6             	mov    %rdx,%rsi
  800c84:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800c89:	ff d0                	callq  *%rax
  800c8b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c8f:	48 f7 d8             	neg    %rax
  800c92:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800c96:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800c9d:	e9 d5 00 00 00       	jmpq   800d77 <vprintfmt+0x49c>
  800ca2:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800ca6:	be 03 00 00 00       	mov    $0x3,%esi
  800cab:	48 89 c7             	mov    %rax,%rdi
  800cae:	48 b8 bb 06 80 00 00 	movabs $0x8006bb,%rax
  800cb5:	00 00 00 
  800cb8:	ff d0                	callq  *%rax
  800cba:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800cbe:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800cc5:	e9 ad 00 00 00       	jmpq   800d77 <vprintfmt+0x49c>
  800cca:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800cce:	be 03 00 00 00       	mov    $0x3,%esi
  800cd3:	48 89 c7             	mov    %rax,%rdi
  800cd6:	48 b8 bb 06 80 00 00 	movabs $0x8006bb,%rax
  800cdd:	00 00 00 
  800ce0:	ff d0                	callq  *%rax
  800ce2:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800ce6:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800ced:	e9 85 00 00 00       	jmpq   800d77 <vprintfmt+0x49c>
  800cf2:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800cf6:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800cfa:	48 89 d6             	mov    %rdx,%rsi
  800cfd:	bf 30 00 00 00       	mov    $0x30,%edi
  800d02:	ff d0                	callq  *%rax
  800d04:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d08:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d0c:	48 89 d6             	mov    %rdx,%rsi
  800d0f:	bf 78 00 00 00       	mov    $0x78,%edi
  800d14:	ff d0                	callq  *%rax
  800d16:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800d19:	83 f8 30             	cmp    $0x30,%eax
  800d1c:	73 17                	jae    800d35 <vprintfmt+0x45a>
  800d1e:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800d22:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800d25:	89 c0                	mov    %eax,%eax
  800d27:	48 01 d0             	add    %rdx,%rax
  800d2a:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800d2d:	83 c2 08             	add    $0x8,%edx
  800d30:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800d33:	eb 0f                	jmp    800d44 <vprintfmt+0x469>
  800d35:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800d39:	48 89 d0             	mov    %rdx,%rax
  800d3c:	48 83 c2 08          	add    $0x8,%rdx
  800d40:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800d44:	48 8b 00             	mov    (%rax),%rax
  800d47:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800d4b:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800d52:	eb 23                	jmp    800d77 <vprintfmt+0x49c>
  800d54:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800d58:	be 03 00 00 00       	mov    $0x3,%esi
  800d5d:	48 89 c7             	mov    %rax,%rdi
  800d60:	48 b8 bb 06 80 00 00 	movabs $0x8006bb,%rax
  800d67:	00 00 00 
  800d6a:	ff d0                	callq  *%rax
  800d6c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800d70:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800d77:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  800d7c:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800d7f:	8b 7d dc             	mov    -0x24(%rbp),%edi
  800d82:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800d86:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800d8a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d8e:	45 89 c1             	mov    %r8d,%r9d
  800d91:	41 89 f8             	mov    %edi,%r8d
  800d94:	48 89 c7             	mov    %rax,%rdi
  800d97:	48 b8 00 06 80 00 00 	movabs $0x800600,%rax
  800d9e:	00 00 00 
  800da1:	ff d0                	callq  *%rax
  800da3:	eb 3f                	jmp    800de4 <vprintfmt+0x509>
  800da5:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800da9:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800dad:	48 89 d6             	mov    %rdx,%rsi
  800db0:	89 df                	mov    %ebx,%edi
  800db2:	ff d0                	callq  *%rax
  800db4:	eb 2e                	jmp    800de4 <vprintfmt+0x509>
  800db6:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800dba:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800dbe:	48 89 d6             	mov    %rdx,%rsi
  800dc1:	bf 25 00 00 00       	mov    $0x25,%edi
  800dc6:	ff d0                	callq  *%rax
  800dc8:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800dcd:	eb 05                	jmp    800dd4 <vprintfmt+0x4f9>
  800dcf:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800dd4:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800dd8:	48 83 e8 01          	sub    $0x1,%rax
  800ddc:	0f b6 00             	movzbl (%rax),%eax
  800ddf:	3c 25                	cmp    $0x25,%al
  800de1:	75 ec                	jne    800dcf <vprintfmt+0x4f4>
  800de3:	90                   	nop
  800de4:	90                   	nop
  800de5:	e9 43 fb ff ff       	jmpq   80092d <vprintfmt+0x52>
  800dea:	48 83 c4 60          	add    $0x60,%rsp
  800dee:	5b                   	pop    %rbx
  800def:	41 5c                	pop    %r12
  800df1:	5d                   	pop    %rbp
  800df2:	c3                   	retq   

0000000000800df3 <printfmt>:
  800df3:	55                   	push   %rbp
  800df4:	48 89 e5             	mov    %rsp,%rbp
  800df7:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  800dfe:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  800e05:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  800e0c:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800e13:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800e1a:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800e21:	84 c0                	test   %al,%al
  800e23:	74 20                	je     800e45 <printfmt+0x52>
  800e25:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800e29:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800e2d:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800e31:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800e35:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800e39:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800e3d:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800e41:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800e45:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  800e4c:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  800e53:	00 00 00 
  800e56:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  800e5d:	00 00 00 
  800e60:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800e64:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800e6b:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800e72:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  800e79:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  800e80:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800e87:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  800e8e:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  800e95:	48 89 c7             	mov    %rax,%rdi
  800e98:	48 b8 db 08 80 00 00 	movabs $0x8008db,%rax
  800e9f:	00 00 00 
  800ea2:	ff d0                	callq  *%rax
  800ea4:	c9                   	leaveq 
  800ea5:	c3                   	retq   

0000000000800ea6 <sprintputch>:
  800ea6:	55                   	push   %rbp
  800ea7:	48 89 e5             	mov    %rsp,%rbp
  800eaa:	48 83 ec 10          	sub    $0x10,%rsp
  800eae:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800eb1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800eb5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800eb9:	8b 40 10             	mov    0x10(%rax),%eax
  800ebc:	8d 50 01             	lea    0x1(%rax),%edx
  800ebf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800ec3:	89 50 10             	mov    %edx,0x10(%rax)
  800ec6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800eca:	48 8b 10             	mov    (%rax),%rdx
  800ecd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800ed1:	48 8b 40 08          	mov    0x8(%rax),%rax
  800ed5:	48 39 c2             	cmp    %rax,%rdx
  800ed8:	73 17                	jae    800ef1 <sprintputch+0x4b>
  800eda:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800ede:	48 8b 00             	mov    (%rax),%rax
  800ee1:	48 8d 48 01          	lea    0x1(%rax),%rcx
  800ee5:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800ee9:	48 89 0a             	mov    %rcx,(%rdx)
  800eec:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800eef:	88 10                	mov    %dl,(%rax)
  800ef1:	c9                   	leaveq 
  800ef2:	c3                   	retq   

0000000000800ef3 <vsnprintf>:
  800ef3:	55                   	push   %rbp
  800ef4:	48 89 e5             	mov    %rsp,%rbp
  800ef7:	48 83 ec 50          	sub    $0x50,%rsp
  800efb:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  800eff:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  800f02:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  800f06:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  800f0a:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  800f0e:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  800f12:	48 8b 0a             	mov    (%rdx),%rcx
  800f15:	48 89 08             	mov    %rcx,(%rax)
  800f18:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800f1c:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800f20:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800f24:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800f28:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800f2c:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  800f30:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  800f33:	48 98                	cltq   
  800f35:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  800f39:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800f3d:	48 01 d0             	add    %rdx,%rax
  800f40:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  800f44:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800f4b:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  800f50:	74 06                	je     800f58 <vsnprintf+0x65>
  800f52:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  800f56:	7f 07                	jg     800f5f <vsnprintf+0x6c>
  800f58:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800f5d:	eb 2f                	jmp    800f8e <vsnprintf+0x9b>
  800f5f:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  800f63:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  800f67:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  800f6b:	48 89 c6             	mov    %rax,%rsi
  800f6e:	48 bf a6 0e 80 00 00 	movabs $0x800ea6,%rdi
  800f75:	00 00 00 
  800f78:	48 b8 db 08 80 00 00 	movabs $0x8008db,%rax
  800f7f:	00 00 00 
  800f82:	ff d0                	callq  *%rax
  800f84:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800f88:	c6 00 00             	movb   $0x0,(%rax)
  800f8b:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800f8e:	c9                   	leaveq 
  800f8f:	c3                   	retq   

0000000000800f90 <snprintf>:
  800f90:	55                   	push   %rbp
  800f91:	48 89 e5             	mov    %rsp,%rbp
  800f94:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  800f9b:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800fa2:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  800fa8:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800faf:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800fb6:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800fbd:	84 c0                	test   %al,%al
  800fbf:	74 20                	je     800fe1 <snprintf+0x51>
  800fc1:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800fc5:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800fc9:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800fcd:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800fd1:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800fd5:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800fd9:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800fdd:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800fe1:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  800fe8:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  800fef:	00 00 00 
  800ff2:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800ff9:	00 00 00 
  800ffc:	48 8d 45 10          	lea    0x10(%rbp),%rax
  801000:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  801007:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  80100e:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  801015:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  80101c:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  801023:	48 8b 0a             	mov    (%rdx),%rcx
  801026:	48 89 08             	mov    %rcx,(%rax)
  801029:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80102d:	48 89 48 08          	mov    %rcx,0x8(%rax)
  801031:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801035:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801039:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  801040:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  801047:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  80104d:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  801054:	48 89 c7             	mov    %rax,%rdi
  801057:	48 b8 f3 0e 80 00 00 	movabs $0x800ef3,%rax
  80105e:	00 00 00 
  801061:	ff d0                	callq  *%rax
  801063:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  801069:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  80106f:	c9                   	leaveq 
  801070:	c3                   	retq   

0000000000801071 <strlen>:
  801071:	55                   	push   %rbp
  801072:	48 89 e5             	mov    %rsp,%rbp
  801075:	48 83 ec 18          	sub    $0x18,%rsp
  801079:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80107d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801084:	eb 09                	jmp    80108f <strlen+0x1e>
  801086:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80108a:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80108f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801093:	0f b6 00             	movzbl (%rax),%eax
  801096:	84 c0                	test   %al,%al
  801098:	75 ec                	jne    801086 <strlen+0x15>
  80109a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80109d:	c9                   	leaveq 
  80109e:	c3                   	retq   

000000000080109f <strnlen>:
  80109f:	55                   	push   %rbp
  8010a0:	48 89 e5             	mov    %rsp,%rbp
  8010a3:	48 83 ec 20          	sub    $0x20,%rsp
  8010a7:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8010ab:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8010af:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8010b6:	eb 0e                	jmp    8010c6 <strnlen+0x27>
  8010b8:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8010bc:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8010c1:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  8010c6:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8010cb:	74 0b                	je     8010d8 <strnlen+0x39>
  8010cd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010d1:	0f b6 00             	movzbl (%rax),%eax
  8010d4:	84 c0                	test   %al,%al
  8010d6:	75 e0                	jne    8010b8 <strnlen+0x19>
  8010d8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8010db:	c9                   	leaveq 
  8010dc:	c3                   	retq   

00000000008010dd <strcpy>:
  8010dd:	55                   	push   %rbp
  8010de:	48 89 e5             	mov    %rsp,%rbp
  8010e1:	48 83 ec 20          	sub    $0x20,%rsp
  8010e5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8010e9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8010ed:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010f1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8010f5:	90                   	nop
  8010f6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010fa:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8010fe:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801102:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801106:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  80110a:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  80110e:	0f b6 12             	movzbl (%rdx),%edx
  801111:	88 10                	mov    %dl,(%rax)
  801113:	0f b6 00             	movzbl (%rax),%eax
  801116:	84 c0                	test   %al,%al
  801118:	75 dc                	jne    8010f6 <strcpy+0x19>
  80111a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80111e:	c9                   	leaveq 
  80111f:	c3                   	retq   

0000000000801120 <strcat>:
  801120:	55                   	push   %rbp
  801121:	48 89 e5             	mov    %rsp,%rbp
  801124:	48 83 ec 20          	sub    $0x20,%rsp
  801128:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80112c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801130:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801134:	48 89 c7             	mov    %rax,%rdi
  801137:	48 b8 71 10 80 00 00 	movabs $0x801071,%rax
  80113e:	00 00 00 
  801141:	ff d0                	callq  *%rax
  801143:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801146:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801149:	48 63 d0             	movslq %eax,%rdx
  80114c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801150:	48 01 c2             	add    %rax,%rdx
  801153:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801157:	48 89 c6             	mov    %rax,%rsi
  80115a:	48 89 d7             	mov    %rdx,%rdi
  80115d:	48 b8 dd 10 80 00 00 	movabs $0x8010dd,%rax
  801164:	00 00 00 
  801167:	ff d0                	callq  *%rax
  801169:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80116d:	c9                   	leaveq 
  80116e:	c3                   	retq   

000000000080116f <strncpy>:
  80116f:	55                   	push   %rbp
  801170:	48 89 e5             	mov    %rsp,%rbp
  801173:	48 83 ec 28          	sub    $0x28,%rsp
  801177:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80117b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80117f:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801183:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801187:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80118b:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  801192:	00 
  801193:	eb 2a                	jmp    8011bf <strncpy+0x50>
  801195:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801199:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80119d:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8011a1:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8011a5:	0f b6 12             	movzbl (%rdx),%edx
  8011a8:	88 10                	mov    %dl,(%rax)
  8011aa:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8011ae:	0f b6 00             	movzbl (%rax),%eax
  8011b1:	84 c0                	test   %al,%al
  8011b3:	74 05                	je     8011ba <strncpy+0x4b>
  8011b5:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  8011ba:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8011bf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011c3:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8011c7:	72 cc                	jb     801195 <strncpy+0x26>
  8011c9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8011cd:	c9                   	leaveq 
  8011ce:	c3                   	retq   

00000000008011cf <strlcpy>:
  8011cf:	55                   	push   %rbp
  8011d0:	48 89 e5             	mov    %rsp,%rbp
  8011d3:	48 83 ec 28          	sub    $0x28,%rsp
  8011d7:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8011db:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8011df:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8011e3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011e7:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8011eb:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8011f0:	74 3d                	je     80122f <strlcpy+0x60>
  8011f2:	eb 1d                	jmp    801211 <strlcpy+0x42>
  8011f4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011f8:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8011fc:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801200:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801204:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801208:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  80120c:	0f b6 12             	movzbl (%rdx),%edx
  80120f:	88 10                	mov    %dl,(%rax)
  801211:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  801216:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80121b:	74 0b                	je     801228 <strlcpy+0x59>
  80121d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801221:	0f b6 00             	movzbl (%rax),%eax
  801224:	84 c0                	test   %al,%al
  801226:	75 cc                	jne    8011f4 <strlcpy+0x25>
  801228:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80122c:	c6 00 00             	movb   $0x0,(%rax)
  80122f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801233:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801237:	48 29 c2             	sub    %rax,%rdx
  80123a:	48 89 d0             	mov    %rdx,%rax
  80123d:	c9                   	leaveq 
  80123e:	c3                   	retq   

000000000080123f <strcmp>:
  80123f:	55                   	push   %rbp
  801240:	48 89 e5             	mov    %rsp,%rbp
  801243:	48 83 ec 10          	sub    $0x10,%rsp
  801247:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80124b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80124f:	eb 0a                	jmp    80125b <strcmp+0x1c>
  801251:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801256:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  80125b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80125f:	0f b6 00             	movzbl (%rax),%eax
  801262:	84 c0                	test   %al,%al
  801264:	74 12                	je     801278 <strcmp+0x39>
  801266:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80126a:	0f b6 10             	movzbl (%rax),%edx
  80126d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801271:	0f b6 00             	movzbl (%rax),%eax
  801274:	38 c2                	cmp    %al,%dl
  801276:	74 d9                	je     801251 <strcmp+0x12>
  801278:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80127c:	0f b6 00             	movzbl (%rax),%eax
  80127f:	0f b6 d0             	movzbl %al,%edx
  801282:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801286:	0f b6 00             	movzbl (%rax),%eax
  801289:	0f b6 c0             	movzbl %al,%eax
  80128c:	29 c2                	sub    %eax,%edx
  80128e:	89 d0                	mov    %edx,%eax
  801290:	c9                   	leaveq 
  801291:	c3                   	retq   

0000000000801292 <strncmp>:
  801292:	55                   	push   %rbp
  801293:	48 89 e5             	mov    %rsp,%rbp
  801296:	48 83 ec 18          	sub    $0x18,%rsp
  80129a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80129e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8012a2:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8012a6:	eb 0f                	jmp    8012b7 <strncmp+0x25>
  8012a8:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  8012ad:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8012b2:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8012b7:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8012bc:	74 1d                	je     8012db <strncmp+0x49>
  8012be:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012c2:	0f b6 00             	movzbl (%rax),%eax
  8012c5:	84 c0                	test   %al,%al
  8012c7:	74 12                	je     8012db <strncmp+0x49>
  8012c9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012cd:	0f b6 10             	movzbl (%rax),%edx
  8012d0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012d4:	0f b6 00             	movzbl (%rax),%eax
  8012d7:	38 c2                	cmp    %al,%dl
  8012d9:	74 cd                	je     8012a8 <strncmp+0x16>
  8012db:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8012e0:	75 07                	jne    8012e9 <strncmp+0x57>
  8012e2:	b8 00 00 00 00       	mov    $0x0,%eax
  8012e7:	eb 18                	jmp    801301 <strncmp+0x6f>
  8012e9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012ed:	0f b6 00             	movzbl (%rax),%eax
  8012f0:	0f b6 d0             	movzbl %al,%edx
  8012f3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012f7:	0f b6 00             	movzbl (%rax),%eax
  8012fa:	0f b6 c0             	movzbl %al,%eax
  8012fd:	29 c2                	sub    %eax,%edx
  8012ff:	89 d0                	mov    %edx,%eax
  801301:	c9                   	leaveq 
  801302:	c3                   	retq   

0000000000801303 <strchr>:
  801303:	55                   	push   %rbp
  801304:	48 89 e5             	mov    %rsp,%rbp
  801307:	48 83 ec 0c          	sub    $0xc,%rsp
  80130b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80130f:	89 f0                	mov    %esi,%eax
  801311:	88 45 f4             	mov    %al,-0xc(%rbp)
  801314:	eb 17                	jmp    80132d <strchr+0x2a>
  801316:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80131a:	0f b6 00             	movzbl (%rax),%eax
  80131d:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801320:	75 06                	jne    801328 <strchr+0x25>
  801322:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801326:	eb 15                	jmp    80133d <strchr+0x3a>
  801328:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80132d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801331:	0f b6 00             	movzbl (%rax),%eax
  801334:	84 c0                	test   %al,%al
  801336:	75 de                	jne    801316 <strchr+0x13>
  801338:	b8 00 00 00 00       	mov    $0x0,%eax
  80133d:	c9                   	leaveq 
  80133e:	c3                   	retq   

000000000080133f <strfind>:
  80133f:	55                   	push   %rbp
  801340:	48 89 e5             	mov    %rsp,%rbp
  801343:	48 83 ec 0c          	sub    $0xc,%rsp
  801347:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80134b:	89 f0                	mov    %esi,%eax
  80134d:	88 45 f4             	mov    %al,-0xc(%rbp)
  801350:	eb 13                	jmp    801365 <strfind+0x26>
  801352:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801356:	0f b6 00             	movzbl (%rax),%eax
  801359:	3a 45 f4             	cmp    -0xc(%rbp),%al
  80135c:	75 02                	jne    801360 <strfind+0x21>
  80135e:	eb 10                	jmp    801370 <strfind+0x31>
  801360:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801365:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801369:	0f b6 00             	movzbl (%rax),%eax
  80136c:	84 c0                	test   %al,%al
  80136e:	75 e2                	jne    801352 <strfind+0x13>
  801370:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801374:	c9                   	leaveq 
  801375:	c3                   	retq   

0000000000801376 <memset>:
  801376:	55                   	push   %rbp
  801377:	48 89 e5             	mov    %rsp,%rbp
  80137a:	48 83 ec 18          	sub    $0x18,%rsp
  80137e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801382:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801385:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801389:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80138e:	75 06                	jne    801396 <memset+0x20>
  801390:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801394:	eb 69                	jmp    8013ff <memset+0x89>
  801396:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80139a:	83 e0 03             	and    $0x3,%eax
  80139d:	48 85 c0             	test   %rax,%rax
  8013a0:	75 48                	jne    8013ea <memset+0x74>
  8013a2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013a6:	83 e0 03             	and    $0x3,%eax
  8013a9:	48 85 c0             	test   %rax,%rax
  8013ac:	75 3c                	jne    8013ea <memset+0x74>
  8013ae:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  8013b5:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8013b8:	c1 e0 18             	shl    $0x18,%eax
  8013bb:	89 c2                	mov    %eax,%edx
  8013bd:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8013c0:	c1 e0 10             	shl    $0x10,%eax
  8013c3:	09 c2                	or     %eax,%edx
  8013c5:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8013c8:	c1 e0 08             	shl    $0x8,%eax
  8013cb:	09 d0                	or     %edx,%eax
  8013cd:	09 45 f4             	or     %eax,-0xc(%rbp)
  8013d0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013d4:	48 c1 e8 02          	shr    $0x2,%rax
  8013d8:	48 89 c1             	mov    %rax,%rcx
  8013db:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8013df:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8013e2:	48 89 d7             	mov    %rdx,%rdi
  8013e5:	fc                   	cld    
  8013e6:	f3 ab                	rep stos %eax,%es:(%rdi)
  8013e8:	eb 11                	jmp    8013fb <memset+0x85>
  8013ea:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8013ee:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8013f1:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8013f5:	48 89 d7             	mov    %rdx,%rdi
  8013f8:	fc                   	cld    
  8013f9:	f3 aa                	rep stos %al,%es:(%rdi)
  8013fb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013ff:	c9                   	leaveq 
  801400:	c3                   	retq   

0000000000801401 <memmove>:
  801401:	55                   	push   %rbp
  801402:	48 89 e5             	mov    %rsp,%rbp
  801405:	48 83 ec 28          	sub    $0x28,%rsp
  801409:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80140d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801411:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801415:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801419:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80141d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801421:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801425:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801429:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  80142d:	0f 83 88 00 00 00    	jae    8014bb <memmove+0xba>
  801433:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801437:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80143b:	48 01 d0             	add    %rdx,%rax
  80143e:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801442:	76 77                	jbe    8014bb <memmove+0xba>
  801444:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801448:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  80144c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801450:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  801454:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801458:	83 e0 03             	and    $0x3,%eax
  80145b:	48 85 c0             	test   %rax,%rax
  80145e:	75 3b                	jne    80149b <memmove+0x9a>
  801460:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801464:	83 e0 03             	and    $0x3,%eax
  801467:	48 85 c0             	test   %rax,%rax
  80146a:	75 2f                	jne    80149b <memmove+0x9a>
  80146c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801470:	83 e0 03             	and    $0x3,%eax
  801473:	48 85 c0             	test   %rax,%rax
  801476:	75 23                	jne    80149b <memmove+0x9a>
  801478:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80147c:	48 83 e8 04          	sub    $0x4,%rax
  801480:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801484:	48 83 ea 04          	sub    $0x4,%rdx
  801488:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  80148c:	48 c1 e9 02          	shr    $0x2,%rcx
  801490:	48 89 c7             	mov    %rax,%rdi
  801493:	48 89 d6             	mov    %rdx,%rsi
  801496:	fd                   	std    
  801497:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801499:	eb 1d                	jmp    8014b8 <memmove+0xb7>
  80149b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80149f:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8014a3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014a7:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  8014ab:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014af:	48 89 d7             	mov    %rdx,%rdi
  8014b2:	48 89 c1             	mov    %rax,%rcx
  8014b5:	fd                   	std    
  8014b6:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  8014b8:	fc                   	cld    
  8014b9:	eb 57                	jmp    801512 <memmove+0x111>
  8014bb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014bf:	83 e0 03             	and    $0x3,%eax
  8014c2:	48 85 c0             	test   %rax,%rax
  8014c5:	75 36                	jne    8014fd <memmove+0xfc>
  8014c7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014cb:	83 e0 03             	and    $0x3,%eax
  8014ce:	48 85 c0             	test   %rax,%rax
  8014d1:	75 2a                	jne    8014fd <memmove+0xfc>
  8014d3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014d7:	83 e0 03             	and    $0x3,%eax
  8014da:	48 85 c0             	test   %rax,%rax
  8014dd:	75 1e                	jne    8014fd <memmove+0xfc>
  8014df:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014e3:	48 c1 e8 02          	shr    $0x2,%rax
  8014e7:	48 89 c1             	mov    %rax,%rcx
  8014ea:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014ee:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8014f2:	48 89 c7             	mov    %rax,%rdi
  8014f5:	48 89 d6             	mov    %rdx,%rsi
  8014f8:	fc                   	cld    
  8014f9:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  8014fb:	eb 15                	jmp    801512 <memmove+0x111>
  8014fd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801501:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801505:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801509:	48 89 c7             	mov    %rax,%rdi
  80150c:	48 89 d6             	mov    %rdx,%rsi
  80150f:	fc                   	cld    
  801510:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801512:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801516:	c9                   	leaveq 
  801517:	c3                   	retq   

0000000000801518 <memcpy>:
  801518:	55                   	push   %rbp
  801519:	48 89 e5             	mov    %rsp,%rbp
  80151c:	48 83 ec 18          	sub    $0x18,%rsp
  801520:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801524:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801528:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80152c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801530:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  801534:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801538:	48 89 ce             	mov    %rcx,%rsi
  80153b:	48 89 c7             	mov    %rax,%rdi
  80153e:	48 b8 01 14 80 00 00 	movabs $0x801401,%rax
  801545:	00 00 00 
  801548:	ff d0                	callq  *%rax
  80154a:	c9                   	leaveq 
  80154b:	c3                   	retq   

000000000080154c <memcmp>:
  80154c:	55                   	push   %rbp
  80154d:	48 89 e5             	mov    %rsp,%rbp
  801550:	48 83 ec 28          	sub    $0x28,%rsp
  801554:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801558:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80155c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801560:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801564:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801568:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80156c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801570:	eb 36                	jmp    8015a8 <memcmp+0x5c>
  801572:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801576:	0f b6 10             	movzbl (%rax),%edx
  801579:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80157d:	0f b6 00             	movzbl (%rax),%eax
  801580:	38 c2                	cmp    %al,%dl
  801582:	74 1a                	je     80159e <memcmp+0x52>
  801584:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801588:	0f b6 00             	movzbl (%rax),%eax
  80158b:	0f b6 d0             	movzbl %al,%edx
  80158e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801592:	0f b6 00             	movzbl (%rax),%eax
  801595:	0f b6 c0             	movzbl %al,%eax
  801598:	29 c2                	sub    %eax,%edx
  80159a:	89 d0                	mov    %edx,%eax
  80159c:	eb 20                	jmp    8015be <memcmp+0x72>
  80159e:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8015a3:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8015a8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015ac:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8015b0:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8015b4:	48 85 c0             	test   %rax,%rax
  8015b7:	75 b9                	jne    801572 <memcmp+0x26>
  8015b9:	b8 00 00 00 00       	mov    $0x0,%eax
  8015be:	c9                   	leaveq 
  8015bf:	c3                   	retq   

00000000008015c0 <memfind>:
  8015c0:	55                   	push   %rbp
  8015c1:	48 89 e5             	mov    %rsp,%rbp
  8015c4:	48 83 ec 28          	sub    $0x28,%rsp
  8015c8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8015cc:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8015cf:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8015d3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015d7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8015db:	48 01 d0             	add    %rdx,%rax
  8015de:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8015e2:	eb 15                	jmp    8015f9 <memfind+0x39>
  8015e4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8015e8:	0f b6 10             	movzbl (%rax),%edx
  8015eb:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8015ee:	38 c2                	cmp    %al,%dl
  8015f0:	75 02                	jne    8015f4 <memfind+0x34>
  8015f2:	eb 0f                	jmp    801603 <memfind+0x43>
  8015f4:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8015f9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8015fd:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  801601:	72 e1                	jb     8015e4 <memfind+0x24>
  801603:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801607:	c9                   	leaveq 
  801608:	c3                   	retq   

0000000000801609 <strtol>:
  801609:	55                   	push   %rbp
  80160a:	48 89 e5             	mov    %rsp,%rbp
  80160d:	48 83 ec 34          	sub    $0x34,%rsp
  801611:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801615:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801619:	89 55 cc             	mov    %edx,-0x34(%rbp)
  80161c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801623:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  80162a:	00 
  80162b:	eb 05                	jmp    801632 <strtol+0x29>
  80162d:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801632:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801636:	0f b6 00             	movzbl (%rax),%eax
  801639:	3c 20                	cmp    $0x20,%al
  80163b:	74 f0                	je     80162d <strtol+0x24>
  80163d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801641:	0f b6 00             	movzbl (%rax),%eax
  801644:	3c 09                	cmp    $0x9,%al
  801646:	74 e5                	je     80162d <strtol+0x24>
  801648:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80164c:	0f b6 00             	movzbl (%rax),%eax
  80164f:	3c 2b                	cmp    $0x2b,%al
  801651:	75 07                	jne    80165a <strtol+0x51>
  801653:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801658:	eb 17                	jmp    801671 <strtol+0x68>
  80165a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80165e:	0f b6 00             	movzbl (%rax),%eax
  801661:	3c 2d                	cmp    $0x2d,%al
  801663:	75 0c                	jne    801671 <strtol+0x68>
  801665:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80166a:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  801671:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801675:	74 06                	je     80167d <strtol+0x74>
  801677:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  80167b:	75 28                	jne    8016a5 <strtol+0x9c>
  80167d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801681:	0f b6 00             	movzbl (%rax),%eax
  801684:	3c 30                	cmp    $0x30,%al
  801686:	75 1d                	jne    8016a5 <strtol+0x9c>
  801688:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80168c:	48 83 c0 01          	add    $0x1,%rax
  801690:	0f b6 00             	movzbl (%rax),%eax
  801693:	3c 78                	cmp    $0x78,%al
  801695:	75 0e                	jne    8016a5 <strtol+0x9c>
  801697:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  80169c:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  8016a3:	eb 2c                	jmp    8016d1 <strtol+0xc8>
  8016a5:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8016a9:	75 19                	jne    8016c4 <strtol+0xbb>
  8016ab:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016af:	0f b6 00             	movzbl (%rax),%eax
  8016b2:	3c 30                	cmp    $0x30,%al
  8016b4:	75 0e                	jne    8016c4 <strtol+0xbb>
  8016b6:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8016bb:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  8016c2:	eb 0d                	jmp    8016d1 <strtol+0xc8>
  8016c4:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8016c8:	75 07                	jne    8016d1 <strtol+0xc8>
  8016ca:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  8016d1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016d5:	0f b6 00             	movzbl (%rax),%eax
  8016d8:	3c 2f                	cmp    $0x2f,%al
  8016da:	7e 1d                	jle    8016f9 <strtol+0xf0>
  8016dc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016e0:	0f b6 00             	movzbl (%rax),%eax
  8016e3:	3c 39                	cmp    $0x39,%al
  8016e5:	7f 12                	jg     8016f9 <strtol+0xf0>
  8016e7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016eb:	0f b6 00             	movzbl (%rax),%eax
  8016ee:	0f be c0             	movsbl %al,%eax
  8016f1:	83 e8 30             	sub    $0x30,%eax
  8016f4:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8016f7:	eb 4e                	jmp    801747 <strtol+0x13e>
  8016f9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016fd:	0f b6 00             	movzbl (%rax),%eax
  801700:	3c 60                	cmp    $0x60,%al
  801702:	7e 1d                	jle    801721 <strtol+0x118>
  801704:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801708:	0f b6 00             	movzbl (%rax),%eax
  80170b:	3c 7a                	cmp    $0x7a,%al
  80170d:	7f 12                	jg     801721 <strtol+0x118>
  80170f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801713:	0f b6 00             	movzbl (%rax),%eax
  801716:	0f be c0             	movsbl %al,%eax
  801719:	83 e8 57             	sub    $0x57,%eax
  80171c:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80171f:	eb 26                	jmp    801747 <strtol+0x13e>
  801721:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801725:	0f b6 00             	movzbl (%rax),%eax
  801728:	3c 40                	cmp    $0x40,%al
  80172a:	7e 48                	jle    801774 <strtol+0x16b>
  80172c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801730:	0f b6 00             	movzbl (%rax),%eax
  801733:	3c 5a                	cmp    $0x5a,%al
  801735:	7f 3d                	jg     801774 <strtol+0x16b>
  801737:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80173b:	0f b6 00             	movzbl (%rax),%eax
  80173e:	0f be c0             	movsbl %al,%eax
  801741:	83 e8 37             	sub    $0x37,%eax
  801744:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801747:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80174a:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  80174d:	7c 02                	jl     801751 <strtol+0x148>
  80174f:	eb 23                	jmp    801774 <strtol+0x16b>
  801751:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801756:	8b 45 cc             	mov    -0x34(%rbp),%eax
  801759:	48 98                	cltq   
  80175b:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  801760:	48 89 c2             	mov    %rax,%rdx
  801763:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801766:	48 98                	cltq   
  801768:	48 01 d0             	add    %rdx,%rax
  80176b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80176f:	e9 5d ff ff ff       	jmpq   8016d1 <strtol+0xc8>
  801774:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  801779:	74 0b                	je     801786 <strtol+0x17d>
  80177b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80177f:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801783:	48 89 10             	mov    %rdx,(%rax)
  801786:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80178a:	74 09                	je     801795 <strtol+0x18c>
  80178c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801790:	48 f7 d8             	neg    %rax
  801793:	eb 04                	jmp    801799 <strtol+0x190>
  801795:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801799:	c9                   	leaveq 
  80179a:	c3                   	retq   

000000000080179b <strstr>:
  80179b:	55                   	push   %rbp
  80179c:	48 89 e5             	mov    %rsp,%rbp
  80179f:	48 83 ec 30          	sub    $0x30,%rsp
  8017a3:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8017a7:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8017ab:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8017af:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8017b3:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  8017b7:	0f b6 00             	movzbl (%rax),%eax
  8017ba:	88 45 ff             	mov    %al,-0x1(%rbp)
  8017bd:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  8017c1:	75 06                	jne    8017c9 <strstr+0x2e>
  8017c3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017c7:	eb 6b                	jmp    801834 <strstr+0x99>
  8017c9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8017cd:	48 89 c7             	mov    %rax,%rdi
  8017d0:	48 b8 71 10 80 00 00 	movabs $0x801071,%rax
  8017d7:	00 00 00 
  8017da:	ff d0                	callq  *%rax
  8017dc:	48 98                	cltq   
  8017de:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8017e2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017e6:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8017ea:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8017ee:	0f b6 00             	movzbl (%rax),%eax
  8017f1:	88 45 ef             	mov    %al,-0x11(%rbp)
  8017f4:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  8017f8:	75 07                	jne    801801 <strstr+0x66>
  8017fa:	b8 00 00 00 00       	mov    $0x0,%eax
  8017ff:	eb 33                	jmp    801834 <strstr+0x99>
  801801:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  801805:	3a 45 ff             	cmp    -0x1(%rbp),%al
  801808:	75 d8                	jne    8017e2 <strstr+0x47>
  80180a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80180e:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  801812:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801816:	48 89 ce             	mov    %rcx,%rsi
  801819:	48 89 c7             	mov    %rax,%rdi
  80181c:	48 b8 92 12 80 00 00 	movabs $0x801292,%rax
  801823:	00 00 00 
  801826:	ff d0                	callq  *%rax
  801828:	85 c0                	test   %eax,%eax
  80182a:	75 b6                	jne    8017e2 <strstr+0x47>
  80182c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801830:	48 83 e8 01          	sub    $0x1,%rax
  801834:	c9                   	leaveq 
  801835:	c3                   	retq   

0000000000801836 <syscall>:
  801836:	55                   	push   %rbp
  801837:	48 89 e5             	mov    %rsp,%rbp
  80183a:	53                   	push   %rbx
  80183b:	48 83 ec 48          	sub    $0x48,%rsp
  80183f:	89 7d dc             	mov    %edi,-0x24(%rbp)
  801842:	89 75 d8             	mov    %esi,-0x28(%rbp)
  801845:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801849:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  80184d:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  801851:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  801855:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801858:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  80185c:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  801860:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  801864:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  801868:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  80186c:	4c 89 c3             	mov    %r8,%rbx
  80186f:	cd 30                	int    $0x30
  801871:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801875:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801879:	74 3e                	je     8018b9 <syscall+0x83>
  80187b:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801880:	7e 37                	jle    8018b9 <syscall+0x83>
  801882:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801886:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801889:	49 89 d0             	mov    %rdx,%r8
  80188c:	89 c1                	mov    %eax,%ecx
  80188e:	48 ba 68 4a 80 00 00 	movabs $0x804a68,%rdx
  801895:	00 00 00 
  801898:	be 24 00 00 00       	mov    $0x24,%esi
  80189d:	48 bf 85 4a 80 00 00 	movabs $0x804a85,%rdi
  8018a4:	00 00 00 
  8018a7:	b8 00 00 00 00       	mov    $0x0,%eax
  8018ac:	49 b9 ef 02 80 00 00 	movabs $0x8002ef,%r9
  8018b3:	00 00 00 
  8018b6:	41 ff d1             	callq  *%r9
  8018b9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8018bd:	48 83 c4 48          	add    $0x48,%rsp
  8018c1:	5b                   	pop    %rbx
  8018c2:	5d                   	pop    %rbp
  8018c3:	c3                   	retq   

00000000008018c4 <sys_cputs>:
  8018c4:	55                   	push   %rbp
  8018c5:	48 89 e5             	mov    %rsp,%rbp
  8018c8:	48 83 ec 20          	sub    $0x20,%rsp
  8018cc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8018d0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8018d4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8018d8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8018dc:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8018e3:	00 
  8018e4:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8018ea:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8018f0:	48 89 d1             	mov    %rdx,%rcx
  8018f3:	48 89 c2             	mov    %rax,%rdx
  8018f6:	be 00 00 00 00       	mov    $0x0,%esi
  8018fb:	bf 00 00 00 00       	mov    $0x0,%edi
  801900:	48 b8 36 18 80 00 00 	movabs $0x801836,%rax
  801907:	00 00 00 
  80190a:	ff d0                	callq  *%rax
  80190c:	c9                   	leaveq 
  80190d:	c3                   	retq   

000000000080190e <sys_cgetc>:
  80190e:	55                   	push   %rbp
  80190f:	48 89 e5             	mov    %rsp,%rbp
  801912:	48 83 ec 10          	sub    $0x10,%rsp
  801916:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80191d:	00 
  80191e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801924:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80192a:	b9 00 00 00 00       	mov    $0x0,%ecx
  80192f:	ba 00 00 00 00       	mov    $0x0,%edx
  801934:	be 00 00 00 00       	mov    $0x0,%esi
  801939:	bf 01 00 00 00       	mov    $0x1,%edi
  80193e:	48 b8 36 18 80 00 00 	movabs $0x801836,%rax
  801945:	00 00 00 
  801948:	ff d0                	callq  *%rax
  80194a:	c9                   	leaveq 
  80194b:	c3                   	retq   

000000000080194c <sys_env_destroy>:
  80194c:	55                   	push   %rbp
  80194d:	48 89 e5             	mov    %rsp,%rbp
  801950:	48 83 ec 10          	sub    $0x10,%rsp
  801954:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801957:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80195a:	48 98                	cltq   
  80195c:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801963:	00 
  801964:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80196a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801970:	b9 00 00 00 00       	mov    $0x0,%ecx
  801975:	48 89 c2             	mov    %rax,%rdx
  801978:	be 01 00 00 00       	mov    $0x1,%esi
  80197d:	bf 03 00 00 00       	mov    $0x3,%edi
  801982:	48 b8 36 18 80 00 00 	movabs $0x801836,%rax
  801989:	00 00 00 
  80198c:	ff d0                	callq  *%rax
  80198e:	c9                   	leaveq 
  80198f:	c3                   	retq   

0000000000801990 <sys_getenvid>:
  801990:	55                   	push   %rbp
  801991:	48 89 e5             	mov    %rsp,%rbp
  801994:	48 83 ec 10          	sub    $0x10,%rsp
  801998:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80199f:	00 
  8019a0:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8019a6:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8019ac:	b9 00 00 00 00       	mov    $0x0,%ecx
  8019b1:	ba 00 00 00 00       	mov    $0x0,%edx
  8019b6:	be 00 00 00 00       	mov    $0x0,%esi
  8019bb:	bf 02 00 00 00       	mov    $0x2,%edi
  8019c0:	48 b8 36 18 80 00 00 	movabs $0x801836,%rax
  8019c7:	00 00 00 
  8019ca:	ff d0                	callq  *%rax
  8019cc:	c9                   	leaveq 
  8019cd:	c3                   	retq   

00000000008019ce <sys_yield>:
  8019ce:	55                   	push   %rbp
  8019cf:	48 89 e5             	mov    %rsp,%rbp
  8019d2:	48 83 ec 10          	sub    $0x10,%rsp
  8019d6:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8019dd:	00 
  8019de:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8019e4:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8019ea:	b9 00 00 00 00       	mov    $0x0,%ecx
  8019ef:	ba 00 00 00 00       	mov    $0x0,%edx
  8019f4:	be 00 00 00 00       	mov    $0x0,%esi
  8019f9:	bf 0b 00 00 00       	mov    $0xb,%edi
  8019fe:	48 b8 36 18 80 00 00 	movabs $0x801836,%rax
  801a05:	00 00 00 
  801a08:	ff d0                	callq  *%rax
  801a0a:	c9                   	leaveq 
  801a0b:	c3                   	retq   

0000000000801a0c <sys_page_alloc>:
  801a0c:	55                   	push   %rbp
  801a0d:	48 89 e5             	mov    %rsp,%rbp
  801a10:	48 83 ec 20          	sub    $0x20,%rsp
  801a14:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a17:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a1b:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801a1e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801a21:	48 63 c8             	movslq %eax,%rcx
  801a24:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801a28:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a2b:	48 98                	cltq   
  801a2d:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801a34:	00 
  801a35:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a3b:	49 89 c8             	mov    %rcx,%r8
  801a3e:	48 89 d1             	mov    %rdx,%rcx
  801a41:	48 89 c2             	mov    %rax,%rdx
  801a44:	be 01 00 00 00       	mov    $0x1,%esi
  801a49:	bf 04 00 00 00       	mov    $0x4,%edi
  801a4e:	48 b8 36 18 80 00 00 	movabs $0x801836,%rax
  801a55:	00 00 00 
  801a58:	ff d0                	callq  *%rax
  801a5a:	c9                   	leaveq 
  801a5b:	c3                   	retq   

0000000000801a5c <sys_page_map>:
  801a5c:	55                   	push   %rbp
  801a5d:	48 89 e5             	mov    %rsp,%rbp
  801a60:	48 83 ec 30          	sub    $0x30,%rsp
  801a64:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a67:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a6b:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801a6e:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801a72:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801a76:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801a79:	48 63 c8             	movslq %eax,%rcx
  801a7c:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801a80:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801a83:	48 63 f0             	movslq %eax,%rsi
  801a86:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801a8a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a8d:	48 98                	cltq   
  801a8f:	48 89 0c 24          	mov    %rcx,(%rsp)
  801a93:	49 89 f9             	mov    %rdi,%r9
  801a96:	49 89 f0             	mov    %rsi,%r8
  801a99:	48 89 d1             	mov    %rdx,%rcx
  801a9c:	48 89 c2             	mov    %rax,%rdx
  801a9f:	be 01 00 00 00       	mov    $0x1,%esi
  801aa4:	bf 05 00 00 00       	mov    $0x5,%edi
  801aa9:	48 b8 36 18 80 00 00 	movabs $0x801836,%rax
  801ab0:	00 00 00 
  801ab3:	ff d0                	callq  *%rax
  801ab5:	c9                   	leaveq 
  801ab6:	c3                   	retq   

0000000000801ab7 <sys_page_unmap>:
  801ab7:	55                   	push   %rbp
  801ab8:	48 89 e5             	mov    %rsp,%rbp
  801abb:	48 83 ec 20          	sub    $0x20,%rsp
  801abf:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801ac2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801ac6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801aca:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801acd:	48 98                	cltq   
  801acf:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801ad6:	00 
  801ad7:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801add:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ae3:	48 89 d1             	mov    %rdx,%rcx
  801ae6:	48 89 c2             	mov    %rax,%rdx
  801ae9:	be 01 00 00 00       	mov    $0x1,%esi
  801aee:	bf 06 00 00 00       	mov    $0x6,%edi
  801af3:	48 b8 36 18 80 00 00 	movabs $0x801836,%rax
  801afa:	00 00 00 
  801afd:	ff d0                	callq  *%rax
  801aff:	c9                   	leaveq 
  801b00:	c3                   	retq   

0000000000801b01 <sys_env_set_status>:
  801b01:	55                   	push   %rbp
  801b02:	48 89 e5             	mov    %rsp,%rbp
  801b05:	48 83 ec 10          	sub    $0x10,%rsp
  801b09:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b0c:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801b0f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801b12:	48 63 d0             	movslq %eax,%rdx
  801b15:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b18:	48 98                	cltq   
  801b1a:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801b21:	00 
  801b22:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b28:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b2e:	48 89 d1             	mov    %rdx,%rcx
  801b31:	48 89 c2             	mov    %rax,%rdx
  801b34:	be 01 00 00 00       	mov    $0x1,%esi
  801b39:	bf 08 00 00 00       	mov    $0x8,%edi
  801b3e:	48 b8 36 18 80 00 00 	movabs $0x801836,%rax
  801b45:	00 00 00 
  801b48:	ff d0                	callq  *%rax
  801b4a:	c9                   	leaveq 
  801b4b:	c3                   	retq   

0000000000801b4c <sys_env_set_trapframe>:
  801b4c:	55                   	push   %rbp
  801b4d:	48 89 e5             	mov    %rsp,%rbp
  801b50:	48 83 ec 20          	sub    $0x20,%rsp
  801b54:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b57:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b5b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b5f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b62:	48 98                	cltq   
  801b64:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801b6b:	00 
  801b6c:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b72:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b78:	48 89 d1             	mov    %rdx,%rcx
  801b7b:	48 89 c2             	mov    %rax,%rdx
  801b7e:	be 01 00 00 00       	mov    $0x1,%esi
  801b83:	bf 09 00 00 00       	mov    $0x9,%edi
  801b88:	48 b8 36 18 80 00 00 	movabs $0x801836,%rax
  801b8f:	00 00 00 
  801b92:	ff d0                	callq  *%rax
  801b94:	c9                   	leaveq 
  801b95:	c3                   	retq   

0000000000801b96 <sys_env_set_pgfault_upcall>:
  801b96:	55                   	push   %rbp
  801b97:	48 89 e5             	mov    %rsp,%rbp
  801b9a:	48 83 ec 20          	sub    $0x20,%rsp
  801b9e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801ba1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801ba5:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801ba9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801bac:	48 98                	cltq   
  801bae:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801bb5:	00 
  801bb6:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801bbc:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801bc2:	48 89 d1             	mov    %rdx,%rcx
  801bc5:	48 89 c2             	mov    %rax,%rdx
  801bc8:	be 01 00 00 00       	mov    $0x1,%esi
  801bcd:	bf 0a 00 00 00       	mov    $0xa,%edi
  801bd2:	48 b8 36 18 80 00 00 	movabs $0x801836,%rax
  801bd9:	00 00 00 
  801bdc:	ff d0                	callq  *%rax
  801bde:	c9                   	leaveq 
  801bdf:	c3                   	retq   

0000000000801be0 <sys_ipc_try_send>:
  801be0:	55                   	push   %rbp
  801be1:	48 89 e5             	mov    %rsp,%rbp
  801be4:	48 83 ec 20          	sub    $0x20,%rsp
  801be8:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801beb:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801bef:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801bf3:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801bf6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801bf9:	48 63 f0             	movslq %eax,%rsi
  801bfc:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801c00:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c03:	48 98                	cltq   
  801c05:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c09:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c10:	00 
  801c11:	49 89 f1             	mov    %rsi,%r9
  801c14:	49 89 c8             	mov    %rcx,%r8
  801c17:	48 89 d1             	mov    %rdx,%rcx
  801c1a:	48 89 c2             	mov    %rax,%rdx
  801c1d:	be 00 00 00 00       	mov    $0x0,%esi
  801c22:	bf 0c 00 00 00       	mov    $0xc,%edi
  801c27:	48 b8 36 18 80 00 00 	movabs $0x801836,%rax
  801c2e:	00 00 00 
  801c31:	ff d0                	callq  *%rax
  801c33:	c9                   	leaveq 
  801c34:	c3                   	retq   

0000000000801c35 <sys_ipc_recv>:
  801c35:	55                   	push   %rbp
  801c36:	48 89 e5             	mov    %rsp,%rbp
  801c39:	48 83 ec 10          	sub    $0x10,%rsp
  801c3d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c41:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c45:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c4c:	00 
  801c4d:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c53:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c59:	b9 00 00 00 00       	mov    $0x0,%ecx
  801c5e:	48 89 c2             	mov    %rax,%rdx
  801c61:	be 01 00 00 00       	mov    $0x1,%esi
  801c66:	bf 0d 00 00 00       	mov    $0xd,%edi
  801c6b:	48 b8 36 18 80 00 00 	movabs $0x801836,%rax
  801c72:	00 00 00 
  801c75:	ff d0                	callq  *%rax
  801c77:	c9                   	leaveq 
  801c78:	c3                   	retq   

0000000000801c79 <sys_time_msec>:
  801c79:	55                   	push   %rbp
  801c7a:	48 89 e5             	mov    %rsp,%rbp
  801c7d:	48 83 ec 10          	sub    $0x10,%rsp
  801c81:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c88:	00 
  801c89:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c8f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c95:	b9 00 00 00 00       	mov    $0x0,%ecx
  801c9a:	ba 00 00 00 00       	mov    $0x0,%edx
  801c9f:	be 00 00 00 00       	mov    $0x0,%esi
  801ca4:	bf 0e 00 00 00       	mov    $0xe,%edi
  801ca9:	48 b8 36 18 80 00 00 	movabs $0x801836,%rax
  801cb0:	00 00 00 
  801cb3:	ff d0                	callq  *%rax
  801cb5:	c9                   	leaveq 
  801cb6:	c3                   	retq   

0000000000801cb7 <sys_net_transmit>:
  801cb7:	55                   	push   %rbp
  801cb8:	48 89 e5             	mov    %rsp,%rbp
  801cbb:	48 83 ec 20          	sub    $0x20,%rsp
  801cbf:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801cc3:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801cc6:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801cc9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ccd:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801cd4:	00 
  801cd5:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801cdb:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ce1:	48 89 d1             	mov    %rdx,%rcx
  801ce4:	48 89 c2             	mov    %rax,%rdx
  801ce7:	be 00 00 00 00       	mov    $0x0,%esi
  801cec:	bf 0f 00 00 00       	mov    $0xf,%edi
  801cf1:	48 b8 36 18 80 00 00 	movabs $0x801836,%rax
  801cf8:	00 00 00 
  801cfb:	ff d0                	callq  *%rax
  801cfd:	c9                   	leaveq 
  801cfe:	c3                   	retq   

0000000000801cff <sys_net_receive>:
  801cff:	55                   	push   %rbp
  801d00:	48 89 e5             	mov    %rsp,%rbp
  801d03:	48 83 ec 20          	sub    $0x20,%rsp
  801d07:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d0b:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801d0e:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801d11:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d15:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801d1c:	00 
  801d1d:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d23:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d29:	48 89 d1             	mov    %rdx,%rcx
  801d2c:	48 89 c2             	mov    %rax,%rdx
  801d2f:	be 00 00 00 00       	mov    $0x0,%esi
  801d34:	bf 10 00 00 00       	mov    $0x10,%edi
  801d39:	48 b8 36 18 80 00 00 	movabs $0x801836,%rax
  801d40:	00 00 00 
  801d43:	ff d0                	callq  *%rax
  801d45:	c9                   	leaveq 
  801d46:	c3                   	retq   

0000000000801d47 <sys_ept_map>:
  801d47:	55                   	push   %rbp
  801d48:	48 89 e5             	mov    %rsp,%rbp
  801d4b:	48 83 ec 30          	sub    $0x30,%rsp
  801d4f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801d52:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d56:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801d59:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801d5d:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801d61:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801d64:	48 63 c8             	movslq %eax,%rcx
  801d67:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801d6b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801d6e:	48 63 f0             	movslq %eax,%rsi
  801d71:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d75:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801d78:	48 98                	cltq   
  801d7a:	48 89 0c 24          	mov    %rcx,(%rsp)
  801d7e:	49 89 f9             	mov    %rdi,%r9
  801d81:	49 89 f0             	mov    %rsi,%r8
  801d84:	48 89 d1             	mov    %rdx,%rcx
  801d87:	48 89 c2             	mov    %rax,%rdx
  801d8a:	be 00 00 00 00       	mov    $0x0,%esi
  801d8f:	bf 11 00 00 00       	mov    $0x11,%edi
  801d94:	48 b8 36 18 80 00 00 	movabs $0x801836,%rax
  801d9b:	00 00 00 
  801d9e:	ff d0                	callq  *%rax
  801da0:	c9                   	leaveq 
  801da1:	c3                   	retq   

0000000000801da2 <sys_env_mkguest>:
  801da2:	55                   	push   %rbp
  801da3:	48 89 e5             	mov    %rsp,%rbp
  801da6:	48 83 ec 20          	sub    $0x20,%rsp
  801daa:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801dae:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801db2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801db6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801dba:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801dc1:	00 
  801dc2:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801dc8:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801dce:	48 89 d1             	mov    %rdx,%rcx
  801dd1:	48 89 c2             	mov    %rax,%rdx
  801dd4:	be 00 00 00 00       	mov    $0x0,%esi
  801dd9:	bf 12 00 00 00       	mov    $0x12,%edi
  801dde:	48 b8 36 18 80 00 00 	movabs $0x801836,%rax
  801de5:	00 00 00 
  801de8:	ff d0                	callq  *%rax
  801dea:	c9                   	leaveq 
  801deb:	c3                   	retq   

0000000000801dec <sys_vmx_list_vms>:
  801dec:	55                   	push   %rbp
  801ded:	48 89 e5             	mov    %rsp,%rbp
  801df0:	48 83 ec 10          	sub    $0x10,%rsp
  801df4:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801dfb:	00 
  801dfc:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e02:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e08:	b9 00 00 00 00       	mov    $0x0,%ecx
  801e0d:	ba 00 00 00 00       	mov    $0x0,%edx
  801e12:	be 00 00 00 00       	mov    $0x0,%esi
  801e17:	bf 13 00 00 00       	mov    $0x13,%edi
  801e1c:	48 b8 36 18 80 00 00 	movabs $0x801836,%rax
  801e23:	00 00 00 
  801e26:	ff d0                	callq  *%rax
  801e28:	c9                   	leaveq 
  801e29:	c3                   	retq   

0000000000801e2a <sys_vmx_sel_resume>:
  801e2a:	55                   	push   %rbp
  801e2b:	48 89 e5             	mov    %rsp,%rbp
  801e2e:	48 83 ec 10          	sub    $0x10,%rsp
  801e32:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801e35:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e38:	48 98                	cltq   
  801e3a:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801e41:	00 
  801e42:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e48:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e4e:	b9 00 00 00 00       	mov    $0x0,%ecx
  801e53:	48 89 c2             	mov    %rax,%rdx
  801e56:	be 00 00 00 00       	mov    $0x0,%esi
  801e5b:	bf 14 00 00 00       	mov    $0x14,%edi
  801e60:	48 b8 36 18 80 00 00 	movabs $0x801836,%rax
  801e67:	00 00 00 
  801e6a:	ff d0                	callq  *%rax
  801e6c:	c9                   	leaveq 
  801e6d:	c3                   	retq   

0000000000801e6e <sys_vmx_get_vmdisk_number>:
  801e6e:	55                   	push   %rbp
  801e6f:	48 89 e5             	mov    %rsp,%rbp
  801e72:	48 83 ec 10          	sub    $0x10,%rsp
  801e76:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801e7d:	00 
  801e7e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e84:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e8a:	b9 00 00 00 00       	mov    $0x0,%ecx
  801e8f:	ba 00 00 00 00       	mov    $0x0,%edx
  801e94:	be 00 00 00 00       	mov    $0x0,%esi
  801e99:	bf 15 00 00 00       	mov    $0x15,%edi
  801e9e:	48 b8 36 18 80 00 00 	movabs $0x801836,%rax
  801ea5:	00 00 00 
  801ea8:	ff d0                	callq  *%rax
  801eaa:	c9                   	leaveq 
  801eab:	c3                   	retq   

0000000000801eac <sys_vmx_incr_vmdisk_number>:
  801eac:	55                   	push   %rbp
  801ead:	48 89 e5             	mov    %rsp,%rbp
  801eb0:	48 83 ec 10          	sub    $0x10,%rsp
  801eb4:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801ebb:	00 
  801ebc:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ec2:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ec8:	b9 00 00 00 00       	mov    $0x0,%ecx
  801ecd:	ba 00 00 00 00       	mov    $0x0,%edx
  801ed2:	be 00 00 00 00       	mov    $0x0,%esi
  801ed7:	bf 16 00 00 00       	mov    $0x16,%edi
  801edc:	48 b8 36 18 80 00 00 	movabs $0x801836,%rax
  801ee3:	00 00 00 
  801ee6:	ff d0                	callq  *%rax
  801ee8:	c9                   	leaveq 
  801ee9:	c3                   	retq   

0000000000801eea <fd2num>:
  801eea:	55                   	push   %rbp
  801eeb:	48 89 e5             	mov    %rsp,%rbp
  801eee:	48 83 ec 08          	sub    $0x8,%rsp
  801ef2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801ef6:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801efa:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  801f01:	ff ff ff 
  801f04:	48 01 d0             	add    %rdx,%rax
  801f07:	48 c1 e8 0c          	shr    $0xc,%rax
  801f0b:	c9                   	leaveq 
  801f0c:	c3                   	retq   

0000000000801f0d <fd2data>:
  801f0d:	55                   	push   %rbp
  801f0e:	48 89 e5             	mov    %rsp,%rbp
  801f11:	48 83 ec 08          	sub    $0x8,%rsp
  801f15:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801f19:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801f1d:	48 89 c7             	mov    %rax,%rdi
  801f20:	48 b8 ea 1e 80 00 00 	movabs $0x801eea,%rax
  801f27:	00 00 00 
  801f2a:	ff d0                	callq  *%rax
  801f2c:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  801f32:	48 c1 e0 0c          	shl    $0xc,%rax
  801f36:	c9                   	leaveq 
  801f37:	c3                   	retq   

0000000000801f38 <fd_alloc>:
  801f38:	55                   	push   %rbp
  801f39:	48 89 e5             	mov    %rsp,%rbp
  801f3c:	48 83 ec 18          	sub    $0x18,%rsp
  801f40:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801f44:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801f4b:	eb 6b                	jmp    801fb8 <fd_alloc+0x80>
  801f4d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801f50:	48 98                	cltq   
  801f52:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801f58:	48 c1 e0 0c          	shl    $0xc,%rax
  801f5c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801f60:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801f64:	48 c1 e8 15          	shr    $0x15,%rax
  801f68:	48 89 c2             	mov    %rax,%rdx
  801f6b:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  801f72:	01 00 00 
  801f75:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801f79:	83 e0 01             	and    $0x1,%eax
  801f7c:	48 85 c0             	test   %rax,%rax
  801f7f:	74 21                	je     801fa2 <fd_alloc+0x6a>
  801f81:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801f85:	48 c1 e8 0c          	shr    $0xc,%rax
  801f89:	48 89 c2             	mov    %rax,%rdx
  801f8c:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801f93:	01 00 00 
  801f96:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801f9a:	83 e0 01             	and    $0x1,%eax
  801f9d:	48 85 c0             	test   %rax,%rax
  801fa0:	75 12                	jne    801fb4 <fd_alloc+0x7c>
  801fa2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801fa6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801faa:	48 89 10             	mov    %rdx,(%rax)
  801fad:	b8 00 00 00 00       	mov    $0x0,%eax
  801fb2:	eb 1a                	jmp    801fce <fd_alloc+0x96>
  801fb4:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801fb8:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  801fbc:	7e 8f                	jle    801f4d <fd_alloc+0x15>
  801fbe:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801fc2:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  801fc9:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  801fce:	c9                   	leaveq 
  801fcf:	c3                   	retq   

0000000000801fd0 <fd_lookup>:
  801fd0:	55                   	push   %rbp
  801fd1:	48 89 e5             	mov    %rsp,%rbp
  801fd4:	48 83 ec 20          	sub    $0x20,%rsp
  801fd8:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801fdb:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801fdf:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  801fe3:	78 06                	js     801feb <fd_lookup+0x1b>
  801fe5:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  801fe9:	7e 07                	jle    801ff2 <fd_lookup+0x22>
  801feb:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801ff0:	eb 6c                	jmp    80205e <fd_lookup+0x8e>
  801ff2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801ff5:	48 98                	cltq   
  801ff7:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801ffd:	48 c1 e0 0c          	shl    $0xc,%rax
  802001:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802005:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802009:	48 c1 e8 15          	shr    $0x15,%rax
  80200d:	48 89 c2             	mov    %rax,%rdx
  802010:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802017:	01 00 00 
  80201a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80201e:	83 e0 01             	and    $0x1,%eax
  802021:	48 85 c0             	test   %rax,%rax
  802024:	74 21                	je     802047 <fd_lookup+0x77>
  802026:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80202a:	48 c1 e8 0c          	shr    $0xc,%rax
  80202e:	48 89 c2             	mov    %rax,%rdx
  802031:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802038:	01 00 00 
  80203b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80203f:	83 e0 01             	and    $0x1,%eax
  802042:	48 85 c0             	test   %rax,%rax
  802045:	75 07                	jne    80204e <fd_lookup+0x7e>
  802047:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80204c:	eb 10                	jmp    80205e <fd_lookup+0x8e>
  80204e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802052:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802056:	48 89 10             	mov    %rdx,(%rax)
  802059:	b8 00 00 00 00       	mov    $0x0,%eax
  80205e:	c9                   	leaveq 
  80205f:	c3                   	retq   

0000000000802060 <fd_close>:
  802060:	55                   	push   %rbp
  802061:	48 89 e5             	mov    %rsp,%rbp
  802064:	48 83 ec 30          	sub    $0x30,%rsp
  802068:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80206c:	89 f0                	mov    %esi,%eax
  80206e:	88 45 d4             	mov    %al,-0x2c(%rbp)
  802071:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802075:	48 89 c7             	mov    %rax,%rdi
  802078:	48 b8 ea 1e 80 00 00 	movabs $0x801eea,%rax
  80207f:	00 00 00 
  802082:	ff d0                	callq  *%rax
  802084:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802088:	48 89 d6             	mov    %rdx,%rsi
  80208b:	89 c7                	mov    %eax,%edi
  80208d:	48 b8 d0 1f 80 00 00 	movabs $0x801fd0,%rax
  802094:	00 00 00 
  802097:	ff d0                	callq  *%rax
  802099:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80209c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8020a0:	78 0a                	js     8020ac <fd_close+0x4c>
  8020a2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8020a6:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  8020aa:	74 12                	je     8020be <fd_close+0x5e>
  8020ac:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  8020b0:	74 05                	je     8020b7 <fd_close+0x57>
  8020b2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8020b5:	eb 05                	jmp    8020bc <fd_close+0x5c>
  8020b7:	b8 00 00 00 00       	mov    $0x0,%eax
  8020bc:	eb 69                	jmp    802127 <fd_close+0xc7>
  8020be:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8020c2:	8b 00                	mov    (%rax),%eax
  8020c4:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8020c8:	48 89 d6             	mov    %rdx,%rsi
  8020cb:	89 c7                	mov    %eax,%edi
  8020cd:	48 b8 29 21 80 00 00 	movabs $0x802129,%rax
  8020d4:	00 00 00 
  8020d7:	ff d0                	callq  *%rax
  8020d9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8020dc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8020e0:	78 2a                	js     80210c <fd_close+0xac>
  8020e2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8020e6:	48 8b 40 20          	mov    0x20(%rax),%rax
  8020ea:	48 85 c0             	test   %rax,%rax
  8020ed:	74 16                	je     802105 <fd_close+0xa5>
  8020ef:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8020f3:	48 8b 40 20          	mov    0x20(%rax),%rax
  8020f7:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8020fb:	48 89 d7             	mov    %rdx,%rdi
  8020fe:	ff d0                	callq  *%rax
  802100:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802103:	eb 07                	jmp    80210c <fd_close+0xac>
  802105:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80210c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802110:	48 89 c6             	mov    %rax,%rsi
  802113:	bf 00 00 00 00       	mov    $0x0,%edi
  802118:	48 b8 b7 1a 80 00 00 	movabs $0x801ab7,%rax
  80211f:	00 00 00 
  802122:	ff d0                	callq  *%rax
  802124:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802127:	c9                   	leaveq 
  802128:	c3                   	retq   

0000000000802129 <dev_lookup>:
  802129:	55                   	push   %rbp
  80212a:	48 89 e5             	mov    %rsp,%rbp
  80212d:	48 83 ec 20          	sub    $0x20,%rsp
  802131:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802134:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802138:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80213f:	eb 41                	jmp    802182 <dev_lookup+0x59>
  802141:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  802148:	00 00 00 
  80214b:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80214e:	48 63 d2             	movslq %edx,%rdx
  802151:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802155:	8b 00                	mov    (%rax),%eax
  802157:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  80215a:	75 22                	jne    80217e <dev_lookup+0x55>
  80215c:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  802163:	00 00 00 
  802166:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802169:	48 63 d2             	movslq %edx,%rdx
  80216c:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  802170:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802174:	48 89 10             	mov    %rdx,(%rax)
  802177:	b8 00 00 00 00       	mov    $0x0,%eax
  80217c:	eb 60                	jmp    8021de <dev_lookup+0xb5>
  80217e:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802182:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  802189:	00 00 00 
  80218c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80218f:	48 63 d2             	movslq %edx,%rdx
  802192:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802196:	48 85 c0             	test   %rax,%rax
  802199:	75 a6                	jne    802141 <dev_lookup+0x18>
  80219b:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  8021a2:	00 00 00 
  8021a5:	48 8b 00             	mov    (%rax),%rax
  8021a8:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8021ae:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8021b1:	89 c6                	mov    %eax,%esi
  8021b3:	48 bf 98 4a 80 00 00 	movabs $0x804a98,%rdi
  8021ba:	00 00 00 
  8021bd:	b8 00 00 00 00       	mov    $0x0,%eax
  8021c2:	48 b9 28 05 80 00 00 	movabs $0x800528,%rcx
  8021c9:	00 00 00 
  8021cc:	ff d1                	callq  *%rcx
  8021ce:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8021d2:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  8021d9:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8021de:	c9                   	leaveq 
  8021df:	c3                   	retq   

00000000008021e0 <close>:
  8021e0:	55                   	push   %rbp
  8021e1:	48 89 e5             	mov    %rsp,%rbp
  8021e4:	48 83 ec 20          	sub    $0x20,%rsp
  8021e8:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8021eb:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8021ef:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8021f2:	48 89 d6             	mov    %rdx,%rsi
  8021f5:	89 c7                	mov    %eax,%edi
  8021f7:	48 b8 d0 1f 80 00 00 	movabs $0x801fd0,%rax
  8021fe:	00 00 00 
  802201:	ff d0                	callq  *%rax
  802203:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802206:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80220a:	79 05                	jns    802211 <close+0x31>
  80220c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80220f:	eb 18                	jmp    802229 <close+0x49>
  802211:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802215:	be 01 00 00 00       	mov    $0x1,%esi
  80221a:	48 89 c7             	mov    %rax,%rdi
  80221d:	48 b8 60 20 80 00 00 	movabs $0x802060,%rax
  802224:	00 00 00 
  802227:	ff d0                	callq  *%rax
  802229:	c9                   	leaveq 
  80222a:	c3                   	retq   

000000000080222b <close_all>:
  80222b:	55                   	push   %rbp
  80222c:	48 89 e5             	mov    %rsp,%rbp
  80222f:	48 83 ec 10          	sub    $0x10,%rsp
  802233:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80223a:	eb 15                	jmp    802251 <close_all+0x26>
  80223c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80223f:	89 c7                	mov    %eax,%edi
  802241:	48 b8 e0 21 80 00 00 	movabs $0x8021e0,%rax
  802248:	00 00 00 
  80224b:	ff d0                	callq  *%rax
  80224d:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802251:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802255:	7e e5                	jle    80223c <close_all+0x11>
  802257:	c9                   	leaveq 
  802258:	c3                   	retq   

0000000000802259 <dup>:
  802259:	55                   	push   %rbp
  80225a:	48 89 e5             	mov    %rsp,%rbp
  80225d:	48 83 ec 40          	sub    $0x40,%rsp
  802261:	89 7d cc             	mov    %edi,-0x34(%rbp)
  802264:	89 75 c8             	mov    %esi,-0x38(%rbp)
  802267:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  80226b:	8b 45 cc             	mov    -0x34(%rbp),%eax
  80226e:	48 89 d6             	mov    %rdx,%rsi
  802271:	89 c7                	mov    %eax,%edi
  802273:	48 b8 d0 1f 80 00 00 	movabs $0x801fd0,%rax
  80227a:	00 00 00 
  80227d:	ff d0                	callq  *%rax
  80227f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802282:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802286:	79 08                	jns    802290 <dup+0x37>
  802288:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80228b:	e9 70 01 00 00       	jmpq   802400 <dup+0x1a7>
  802290:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802293:	89 c7                	mov    %eax,%edi
  802295:	48 b8 e0 21 80 00 00 	movabs $0x8021e0,%rax
  80229c:	00 00 00 
  80229f:	ff d0                	callq  *%rax
  8022a1:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8022a4:	48 98                	cltq   
  8022a6:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  8022ac:	48 c1 e0 0c          	shl    $0xc,%rax
  8022b0:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8022b4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8022b8:	48 89 c7             	mov    %rax,%rdi
  8022bb:	48 b8 0d 1f 80 00 00 	movabs $0x801f0d,%rax
  8022c2:	00 00 00 
  8022c5:	ff d0                	callq  *%rax
  8022c7:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8022cb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8022cf:	48 89 c7             	mov    %rax,%rdi
  8022d2:	48 b8 0d 1f 80 00 00 	movabs $0x801f0d,%rax
  8022d9:	00 00 00 
  8022dc:	ff d0                	callq  *%rax
  8022de:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8022e2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8022e6:	48 c1 e8 15          	shr    $0x15,%rax
  8022ea:	48 89 c2             	mov    %rax,%rdx
  8022ed:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8022f4:	01 00 00 
  8022f7:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8022fb:	83 e0 01             	and    $0x1,%eax
  8022fe:	48 85 c0             	test   %rax,%rax
  802301:	74 73                	je     802376 <dup+0x11d>
  802303:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802307:	48 c1 e8 0c          	shr    $0xc,%rax
  80230b:	48 89 c2             	mov    %rax,%rdx
  80230e:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802315:	01 00 00 
  802318:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80231c:	83 e0 01             	and    $0x1,%eax
  80231f:	48 85 c0             	test   %rax,%rax
  802322:	74 52                	je     802376 <dup+0x11d>
  802324:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802328:	48 c1 e8 0c          	shr    $0xc,%rax
  80232c:	48 89 c2             	mov    %rax,%rdx
  80232f:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802336:	01 00 00 
  802339:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80233d:	25 07 0e 00 00       	and    $0xe07,%eax
  802342:	89 c1                	mov    %eax,%ecx
  802344:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802348:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80234c:	41 89 c8             	mov    %ecx,%r8d
  80234f:	48 89 d1             	mov    %rdx,%rcx
  802352:	ba 00 00 00 00       	mov    $0x0,%edx
  802357:	48 89 c6             	mov    %rax,%rsi
  80235a:	bf 00 00 00 00       	mov    $0x0,%edi
  80235f:	48 b8 5c 1a 80 00 00 	movabs $0x801a5c,%rax
  802366:	00 00 00 
  802369:	ff d0                	callq  *%rax
  80236b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80236e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802372:	79 02                	jns    802376 <dup+0x11d>
  802374:	eb 57                	jmp    8023cd <dup+0x174>
  802376:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80237a:	48 c1 e8 0c          	shr    $0xc,%rax
  80237e:	48 89 c2             	mov    %rax,%rdx
  802381:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802388:	01 00 00 
  80238b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80238f:	25 07 0e 00 00       	and    $0xe07,%eax
  802394:	89 c1                	mov    %eax,%ecx
  802396:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80239a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80239e:	41 89 c8             	mov    %ecx,%r8d
  8023a1:	48 89 d1             	mov    %rdx,%rcx
  8023a4:	ba 00 00 00 00       	mov    $0x0,%edx
  8023a9:	48 89 c6             	mov    %rax,%rsi
  8023ac:	bf 00 00 00 00       	mov    $0x0,%edi
  8023b1:	48 b8 5c 1a 80 00 00 	movabs $0x801a5c,%rax
  8023b8:	00 00 00 
  8023bb:	ff d0                	callq  *%rax
  8023bd:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8023c0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8023c4:	79 02                	jns    8023c8 <dup+0x16f>
  8023c6:	eb 05                	jmp    8023cd <dup+0x174>
  8023c8:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8023cb:	eb 33                	jmp    802400 <dup+0x1a7>
  8023cd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8023d1:	48 89 c6             	mov    %rax,%rsi
  8023d4:	bf 00 00 00 00       	mov    $0x0,%edi
  8023d9:	48 b8 b7 1a 80 00 00 	movabs $0x801ab7,%rax
  8023e0:	00 00 00 
  8023e3:	ff d0                	callq  *%rax
  8023e5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8023e9:	48 89 c6             	mov    %rax,%rsi
  8023ec:	bf 00 00 00 00       	mov    $0x0,%edi
  8023f1:	48 b8 b7 1a 80 00 00 	movabs $0x801ab7,%rax
  8023f8:	00 00 00 
  8023fb:	ff d0                	callq  *%rax
  8023fd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802400:	c9                   	leaveq 
  802401:	c3                   	retq   

0000000000802402 <read>:
  802402:	55                   	push   %rbp
  802403:	48 89 e5             	mov    %rsp,%rbp
  802406:	48 83 ec 40          	sub    $0x40,%rsp
  80240a:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80240d:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802411:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802415:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802419:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80241c:	48 89 d6             	mov    %rdx,%rsi
  80241f:	89 c7                	mov    %eax,%edi
  802421:	48 b8 d0 1f 80 00 00 	movabs $0x801fd0,%rax
  802428:	00 00 00 
  80242b:	ff d0                	callq  *%rax
  80242d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802430:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802434:	78 24                	js     80245a <read+0x58>
  802436:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80243a:	8b 00                	mov    (%rax),%eax
  80243c:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802440:	48 89 d6             	mov    %rdx,%rsi
  802443:	89 c7                	mov    %eax,%edi
  802445:	48 b8 29 21 80 00 00 	movabs $0x802129,%rax
  80244c:	00 00 00 
  80244f:	ff d0                	callq  *%rax
  802451:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802454:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802458:	79 05                	jns    80245f <read+0x5d>
  80245a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80245d:	eb 76                	jmp    8024d5 <read+0xd3>
  80245f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802463:	8b 40 08             	mov    0x8(%rax),%eax
  802466:	83 e0 03             	and    $0x3,%eax
  802469:	83 f8 01             	cmp    $0x1,%eax
  80246c:	75 3a                	jne    8024a8 <read+0xa6>
  80246e:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  802475:	00 00 00 
  802478:	48 8b 00             	mov    (%rax),%rax
  80247b:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802481:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802484:	89 c6                	mov    %eax,%esi
  802486:	48 bf b7 4a 80 00 00 	movabs $0x804ab7,%rdi
  80248d:	00 00 00 
  802490:	b8 00 00 00 00       	mov    $0x0,%eax
  802495:	48 b9 28 05 80 00 00 	movabs $0x800528,%rcx
  80249c:	00 00 00 
  80249f:	ff d1                	callq  *%rcx
  8024a1:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8024a6:	eb 2d                	jmp    8024d5 <read+0xd3>
  8024a8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8024ac:	48 8b 40 10          	mov    0x10(%rax),%rax
  8024b0:	48 85 c0             	test   %rax,%rax
  8024b3:	75 07                	jne    8024bc <read+0xba>
  8024b5:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8024ba:	eb 19                	jmp    8024d5 <read+0xd3>
  8024bc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8024c0:	48 8b 40 10          	mov    0x10(%rax),%rax
  8024c4:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8024c8:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8024cc:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  8024d0:	48 89 cf             	mov    %rcx,%rdi
  8024d3:	ff d0                	callq  *%rax
  8024d5:	c9                   	leaveq 
  8024d6:	c3                   	retq   

00000000008024d7 <readn>:
  8024d7:	55                   	push   %rbp
  8024d8:	48 89 e5             	mov    %rsp,%rbp
  8024db:	48 83 ec 30          	sub    $0x30,%rsp
  8024df:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8024e2:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8024e6:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8024ea:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8024f1:	eb 49                	jmp    80253c <readn+0x65>
  8024f3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024f6:	48 98                	cltq   
  8024f8:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8024fc:	48 29 c2             	sub    %rax,%rdx
  8024ff:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802502:	48 63 c8             	movslq %eax,%rcx
  802505:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802509:	48 01 c1             	add    %rax,%rcx
  80250c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80250f:	48 89 ce             	mov    %rcx,%rsi
  802512:	89 c7                	mov    %eax,%edi
  802514:	48 b8 02 24 80 00 00 	movabs $0x802402,%rax
  80251b:	00 00 00 
  80251e:	ff d0                	callq  *%rax
  802520:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802523:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802527:	79 05                	jns    80252e <readn+0x57>
  802529:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80252c:	eb 1c                	jmp    80254a <readn+0x73>
  80252e:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802532:	75 02                	jne    802536 <readn+0x5f>
  802534:	eb 11                	jmp    802547 <readn+0x70>
  802536:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802539:	01 45 fc             	add    %eax,-0x4(%rbp)
  80253c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80253f:	48 98                	cltq   
  802541:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802545:	72 ac                	jb     8024f3 <readn+0x1c>
  802547:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80254a:	c9                   	leaveq 
  80254b:	c3                   	retq   

000000000080254c <write>:
  80254c:	55                   	push   %rbp
  80254d:	48 89 e5             	mov    %rsp,%rbp
  802550:	48 83 ec 40          	sub    $0x40,%rsp
  802554:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802557:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80255b:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80255f:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802563:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802566:	48 89 d6             	mov    %rdx,%rsi
  802569:	89 c7                	mov    %eax,%edi
  80256b:	48 b8 d0 1f 80 00 00 	movabs $0x801fd0,%rax
  802572:	00 00 00 
  802575:	ff d0                	callq  *%rax
  802577:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80257a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80257e:	78 24                	js     8025a4 <write+0x58>
  802580:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802584:	8b 00                	mov    (%rax),%eax
  802586:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80258a:	48 89 d6             	mov    %rdx,%rsi
  80258d:	89 c7                	mov    %eax,%edi
  80258f:	48 b8 29 21 80 00 00 	movabs $0x802129,%rax
  802596:	00 00 00 
  802599:	ff d0                	callq  *%rax
  80259b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80259e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8025a2:	79 05                	jns    8025a9 <write+0x5d>
  8025a4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8025a7:	eb 75                	jmp    80261e <write+0xd2>
  8025a9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8025ad:	8b 40 08             	mov    0x8(%rax),%eax
  8025b0:	83 e0 03             	and    $0x3,%eax
  8025b3:	85 c0                	test   %eax,%eax
  8025b5:	75 3a                	jne    8025f1 <write+0xa5>
  8025b7:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  8025be:	00 00 00 
  8025c1:	48 8b 00             	mov    (%rax),%rax
  8025c4:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8025ca:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8025cd:	89 c6                	mov    %eax,%esi
  8025cf:	48 bf d3 4a 80 00 00 	movabs $0x804ad3,%rdi
  8025d6:	00 00 00 
  8025d9:	b8 00 00 00 00       	mov    $0x0,%eax
  8025de:	48 b9 28 05 80 00 00 	movabs $0x800528,%rcx
  8025e5:	00 00 00 
  8025e8:	ff d1                	callq  *%rcx
  8025ea:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8025ef:	eb 2d                	jmp    80261e <write+0xd2>
  8025f1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8025f5:	48 8b 40 18          	mov    0x18(%rax),%rax
  8025f9:	48 85 c0             	test   %rax,%rax
  8025fc:	75 07                	jne    802605 <write+0xb9>
  8025fe:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802603:	eb 19                	jmp    80261e <write+0xd2>
  802605:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802609:	48 8b 40 18          	mov    0x18(%rax),%rax
  80260d:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802611:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802615:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802619:	48 89 cf             	mov    %rcx,%rdi
  80261c:	ff d0                	callq  *%rax
  80261e:	c9                   	leaveq 
  80261f:	c3                   	retq   

0000000000802620 <seek>:
  802620:	55                   	push   %rbp
  802621:	48 89 e5             	mov    %rsp,%rbp
  802624:	48 83 ec 18          	sub    $0x18,%rsp
  802628:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80262b:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80262e:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802632:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802635:	48 89 d6             	mov    %rdx,%rsi
  802638:	89 c7                	mov    %eax,%edi
  80263a:	48 b8 d0 1f 80 00 00 	movabs $0x801fd0,%rax
  802641:	00 00 00 
  802644:	ff d0                	callq  *%rax
  802646:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802649:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80264d:	79 05                	jns    802654 <seek+0x34>
  80264f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802652:	eb 0f                	jmp    802663 <seek+0x43>
  802654:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802658:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80265b:	89 50 04             	mov    %edx,0x4(%rax)
  80265e:	b8 00 00 00 00       	mov    $0x0,%eax
  802663:	c9                   	leaveq 
  802664:	c3                   	retq   

0000000000802665 <ftruncate>:
  802665:	55                   	push   %rbp
  802666:	48 89 e5             	mov    %rsp,%rbp
  802669:	48 83 ec 30          	sub    $0x30,%rsp
  80266d:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802670:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802673:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802677:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80267a:	48 89 d6             	mov    %rdx,%rsi
  80267d:	89 c7                	mov    %eax,%edi
  80267f:	48 b8 d0 1f 80 00 00 	movabs $0x801fd0,%rax
  802686:	00 00 00 
  802689:	ff d0                	callq  *%rax
  80268b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80268e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802692:	78 24                	js     8026b8 <ftruncate+0x53>
  802694:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802698:	8b 00                	mov    (%rax),%eax
  80269a:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80269e:	48 89 d6             	mov    %rdx,%rsi
  8026a1:	89 c7                	mov    %eax,%edi
  8026a3:	48 b8 29 21 80 00 00 	movabs $0x802129,%rax
  8026aa:	00 00 00 
  8026ad:	ff d0                	callq  *%rax
  8026af:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8026b2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8026b6:	79 05                	jns    8026bd <ftruncate+0x58>
  8026b8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8026bb:	eb 72                	jmp    80272f <ftruncate+0xca>
  8026bd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8026c1:	8b 40 08             	mov    0x8(%rax),%eax
  8026c4:	83 e0 03             	and    $0x3,%eax
  8026c7:	85 c0                	test   %eax,%eax
  8026c9:	75 3a                	jne    802705 <ftruncate+0xa0>
  8026cb:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  8026d2:	00 00 00 
  8026d5:	48 8b 00             	mov    (%rax),%rax
  8026d8:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8026de:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8026e1:	89 c6                	mov    %eax,%esi
  8026e3:	48 bf f0 4a 80 00 00 	movabs $0x804af0,%rdi
  8026ea:	00 00 00 
  8026ed:	b8 00 00 00 00       	mov    $0x0,%eax
  8026f2:	48 b9 28 05 80 00 00 	movabs $0x800528,%rcx
  8026f9:	00 00 00 
  8026fc:	ff d1                	callq  *%rcx
  8026fe:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802703:	eb 2a                	jmp    80272f <ftruncate+0xca>
  802705:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802709:	48 8b 40 30          	mov    0x30(%rax),%rax
  80270d:	48 85 c0             	test   %rax,%rax
  802710:	75 07                	jne    802719 <ftruncate+0xb4>
  802712:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802717:	eb 16                	jmp    80272f <ftruncate+0xca>
  802719:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80271d:	48 8b 40 30          	mov    0x30(%rax),%rax
  802721:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802725:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  802728:	89 ce                	mov    %ecx,%esi
  80272a:	48 89 d7             	mov    %rdx,%rdi
  80272d:	ff d0                	callq  *%rax
  80272f:	c9                   	leaveq 
  802730:	c3                   	retq   

0000000000802731 <fstat>:
  802731:	55                   	push   %rbp
  802732:	48 89 e5             	mov    %rsp,%rbp
  802735:	48 83 ec 30          	sub    $0x30,%rsp
  802739:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80273c:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802740:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802744:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802747:	48 89 d6             	mov    %rdx,%rsi
  80274a:	89 c7                	mov    %eax,%edi
  80274c:	48 b8 d0 1f 80 00 00 	movabs $0x801fd0,%rax
  802753:	00 00 00 
  802756:	ff d0                	callq  *%rax
  802758:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80275b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80275f:	78 24                	js     802785 <fstat+0x54>
  802761:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802765:	8b 00                	mov    (%rax),%eax
  802767:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80276b:	48 89 d6             	mov    %rdx,%rsi
  80276e:	89 c7                	mov    %eax,%edi
  802770:	48 b8 29 21 80 00 00 	movabs $0x802129,%rax
  802777:	00 00 00 
  80277a:	ff d0                	callq  *%rax
  80277c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80277f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802783:	79 05                	jns    80278a <fstat+0x59>
  802785:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802788:	eb 5e                	jmp    8027e8 <fstat+0xb7>
  80278a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80278e:	48 8b 40 28          	mov    0x28(%rax),%rax
  802792:	48 85 c0             	test   %rax,%rax
  802795:	75 07                	jne    80279e <fstat+0x6d>
  802797:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80279c:	eb 4a                	jmp    8027e8 <fstat+0xb7>
  80279e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8027a2:	c6 00 00             	movb   $0x0,(%rax)
  8027a5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8027a9:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  8027b0:	00 00 00 
  8027b3:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8027b7:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  8027be:	00 00 00 
  8027c1:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8027c5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8027c9:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  8027d0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8027d4:	48 8b 40 28          	mov    0x28(%rax),%rax
  8027d8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8027dc:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  8027e0:	48 89 ce             	mov    %rcx,%rsi
  8027e3:	48 89 d7             	mov    %rdx,%rdi
  8027e6:	ff d0                	callq  *%rax
  8027e8:	c9                   	leaveq 
  8027e9:	c3                   	retq   

00000000008027ea <stat>:
  8027ea:	55                   	push   %rbp
  8027eb:	48 89 e5             	mov    %rsp,%rbp
  8027ee:	48 83 ec 20          	sub    $0x20,%rsp
  8027f2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8027f6:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8027fa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8027fe:	be 00 00 00 00       	mov    $0x0,%esi
  802803:	48 89 c7             	mov    %rax,%rdi
  802806:	48 b8 d8 28 80 00 00 	movabs $0x8028d8,%rax
  80280d:	00 00 00 
  802810:	ff d0                	callq  *%rax
  802812:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802815:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802819:	79 05                	jns    802820 <stat+0x36>
  80281b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80281e:	eb 2f                	jmp    80284f <stat+0x65>
  802820:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802824:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802827:	48 89 d6             	mov    %rdx,%rsi
  80282a:	89 c7                	mov    %eax,%edi
  80282c:	48 b8 31 27 80 00 00 	movabs $0x802731,%rax
  802833:	00 00 00 
  802836:	ff d0                	callq  *%rax
  802838:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80283b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80283e:	89 c7                	mov    %eax,%edi
  802840:	48 b8 e0 21 80 00 00 	movabs $0x8021e0,%rax
  802847:	00 00 00 
  80284a:	ff d0                	callq  *%rax
  80284c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80284f:	c9                   	leaveq 
  802850:	c3                   	retq   

0000000000802851 <fsipc>:
  802851:	55                   	push   %rbp
  802852:	48 89 e5             	mov    %rsp,%rbp
  802855:	48 83 ec 10          	sub    $0x10,%rsp
  802859:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80285c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802860:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  802867:	00 00 00 
  80286a:	8b 00                	mov    (%rax),%eax
  80286c:	85 c0                	test   %eax,%eax
  80286e:	75 1d                	jne    80288d <fsipc+0x3c>
  802870:	bf 01 00 00 00       	mov    $0x1,%edi
  802875:	48 b8 f8 43 80 00 00 	movabs $0x8043f8,%rax
  80287c:	00 00 00 
  80287f:	ff d0                	callq  *%rax
  802881:	48 ba 00 70 80 00 00 	movabs $0x807000,%rdx
  802888:	00 00 00 
  80288b:	89 02                	mov    %eax,(%rdx)
  80288d:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  802894:	00 00 00 
  802897:	8b 00                	mov    (%rax),%eax
  802899:	8b 75 fc             	mov    -0x4(%rbp),%esi
  80289c:	b9 07 00 00 00       	mov    $0x7,%ecx
  8028a1:	48 ba 00 a0 80 00 00 	movabs $0x80a000,%rdx
  8028a8:	00 00 00 
  8028ab:	89 c7                	mov    %eax,%edi
  8028ad:	48 b8 62 43 80 00 00 	movabs $0x804362,%rax
  8028b4:	00 00 00 
  8028b7:	ff d0                	callq  *%rax
  8028b9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8028bd:	ba 00 00 00 00       	mov    $0x0,%edx
  8028c2:	48 89 c6             	mov    %rax,%rsi
  8028c5:	bf 00 00 00 00       	mov    $0x0,%edi
  8028ca:	48 b8 a1 42 80 00 00 	movabs $0x8042a1,%rax
  8028d1:	00 00 00 
  8028d4:	ff d0                	callq  *%rax
  8028d6:	c9                   	leaveq 
  8028d7:	c3                   	retq   

00000000008028d8 <open>:
  8028d8:	55                   	push   %rbp
  8028d9:	48 89 e5             	mov    %rsp,%rbp
  8028dc:	48 83 ec 20          	sub    $0x20,%rsp
  8028e0:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8028e4:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8028e7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8028eb:	48 89 c7             	mov    %rax,%rdi
  8028ee:	48 b8 71 10 80 00 00 	movabs $0x801071,%rax
  8028f5:	00 00 00 
  8028f8:	ff d0                	callq  *%rax
  8028fa:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  8028ff:	7e 0a                	jle    80290b <open+0x33>
  802901:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802906:	e9 a5 00 00 00       	jmpq   8029b0 <open+0xd8>
  80290b:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  80290f:	48 89 c7             	mov    %rax,%rdi
  802912:	48 b8 38 1f 80 00 00 	movabs $0x801f38,%rax
  802919:	00 00 00 
  80291c:	ff d0                	callq  *%rax
  80291e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802921:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802925:	79 08                	jns    80292f <open+0x57>
  802927:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80292a:	e9 81 00 00 00       	jmpq   8029b0 <open+0xd8>
  80292f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802933:	48 89 c6             	mov    %rax,%rsi
  802936:	48 bf 00 a0 80 00 00 	movabs $0x80a000,%rdi
  80293d:	00 00 00 
  802940:	48 b8 dd 10 80 00 00 	movabs $0x8010dd,%rax
  802947:	00 00 00 
  80294a:	ff d0                	callq  *%rax
  80294c:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  802953:	00 00 00 
  802956:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  802959:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  80295f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802963:	48 89 c6             	mov    %rax,%rsi
  802966:	bf 01 00 00 00       	mov    $0x1,%edi
  80296b:	48 b8 51 28 80 00 00 	movabs $0x802851,%rax
  802972:	00 00 00 
  802975:	ff d0                	callq  *%rax
  802977:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80297a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80297e:	79 1d                	jns    80299d <open+0xc5>
  802980:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802984:	be 00 00 00 00       	mov    $0x0,%esi
  802989:	48 89 c7             	mov    %rax,%rdi
  80298c:	48 b8 60 20 80 00 00 	movabs $0x802060,%rax
  802993:	00 00 00 
  802996:	ff d0                	callq  *%rax
  802998:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80299b:	eb 13                	jmp    8029b0 <open+0xd8>
  80299d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8029a1:	48 89 c7             	mov    %rax,%rdi
  8029a4:	48 b8 ea 1e 80 00 00 	movabs $0x801eea,%rax
  8029ab:	00 00 00 
  8029ae:	ff d0                	callq  *%rax
  8029b0:	c9                   	leaveq 
  8029b1:	c3                   	retq   

00000000008029b2 <devfile_flush>:
  8029b2:	55                   	push   %rbp
  8029b3:	48 89 e5             	mov    %rsp,%rbp
  8029b6:	48 83 ec 10          	sub    $0x10,%rsp
  8029ba:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8029be:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8029c2:	8b 50 0c             	mov    0xc(%rax),%edx
  8029c5:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8029cc:	00 00 00 
  8029cf:	89 10                	mov    %edx,(%rax)
  8029d1:	be 00 00 00 00       	mov    $0x0,%esi
  8029d6:	bf 06 00 00 00       	mov    $0x6,%edi
  8029db:	48 b8 51 28 80 00 00 	movabs $0x802851,%rax
  8029e2:	00 00 00 
  8029e5:	ff d0                	callq  *%rax
  8029e7:	c9                   	leaveq 
  8029e8:	c3                   	retq   

00000000008029e9 <devfile_read>:
  8029e9:	55                   	push   %rbp
  8029ea:	48 89 e5             	mov    %rsp,%rbp
  8029ed:	48 83 ec 30          	sub    $0x30,%rsp
  8029f1:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8029f5:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8029f9:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8029fd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802a01:	8b 50 0c             	mov    0xc(%rax),%edx
  802a04:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  802a0b:	00 00 00 
  802a0e:	89 10                	mov    %edx,(%rax)
  802a10:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  802a17:	00 00 00 
  802a1a:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802a1e:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802a22:	be 00 00 00 00       	mov    $0x0,%esi
  802a27:	bf 03 00 00 00       	mov    $0x3,%edi
  802a2c:	48 b8 51 28 80 00 00 	movabs $0x802851,%rax
  802a33:	00 00 00 
  802a36:	ff d0                	callq  *%rax
  802a38:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802a3b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802a3f:	79 08                	jns    802a49 <devfile_read+0x60>
  802a41:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a44:	e9 a4 00 00 00       	jmpq   802aed <devfile_read+0x104>
  802a49:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a4c:	48 98                	cltq   
  802a4e:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802a52:	76 35                	jbe    802a89 <devfile_read+0xa0>
  802a54:	48 b9 16 4b 80 00 00 	movabs $0x804b16,%rcx
  802a5b:	00 00 00 
  802a5e:	48 ba 1d 4b 80 00 00 	movabs $0x804b1d,%rdx
  802a65:	00 00 00 
  802a68:	be 89 00 00 00       	mov    $0x89,%esi
  802a6d:	48 bf 32 4b 80 00 00 	movabs $0x804b32,%rdi
  802a74:	00 00 00 
  802a77:	b8 00 00 00 00       	mov    $0x0,%eax
  802a7c:	49 b8 ef 02 80 00 00 	movabs $0x8002ef,%r8
  802a83:	00 00 00 
  802a86:	41 ff d0             	callq  *%r8
  802a89:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  802a90:	7e 35                	jle    802ac7 <devfile_read+0xde>
  802a92:	48 b9 40 4b 80 00 00 	movabs $0x804b40,%rcx
  802a99:	00 00 00 
  802a9c:	48 ba 1d 4b 80 00 00 	movabs $0x804b1d,%rdx
  802aa3:	00 00 00 
  802aa6:	be 8a 00 00 00       	mov    $0x8a,%esi
  802aab:	48 bf 32 4b 80 00 00 	movabs $0x804b32,%rdi
  802ab2:	00 00 00 
  802ab5:	b8 00 00 00 00       	mov    $0x0,%eax
  802aba:	49 b8 ef 02 80 00 00 	movabs $0x8002ef,%r8
  802ac1:	00 00 00 
  802ac4:	41 ff d0             	callq  *%r8
  802ac7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802aca:	48 63 d0             	movslq %eax,%rdx
  802acd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802ad1:	48 be 00 a0 80 00 00 	movabs $0x80a000,%rsi
  802ad8:	00 00 00 
  802adb:	48 89 c7             	mov    %rax,%rdi
  802ade:	48 b8 01 14 80 00 00 	movabs $0x801401,%rax
  802ae5:	00 00 00 
  802ae8:	ff d0                	callq  *%rax
  802aea:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802aed:	c9                   	leaveq 
  802aee:	c3                   	retq   

0000000000802aef <devfile_write>:
  802aef:	55                   	push   %rbp
  802af0:	48 89 e5             	mov    %rsp,%rbp
  802af3:	48 83 ec 40          	sub    $0x40,%rsp
  802af7:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802afb:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802aff:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802b03:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  802b07:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802b0b:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  802b12:	00 
  802b13:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802b17:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  802b1b:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  802b20:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  802b24:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802b28:	8b 50 0c             	mov    0xc(%rax),%edx
  802b2b:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  802b32:	00 00 00 
  802b35:	89 10                	mov    %edx,(%rax)
  802b37:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  802b3e:	00 00 00 
  802b41:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802b45:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802b49:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802b4d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802b51:	48 89 c6             	mov    %rax,%rsi
  802b54:	48 bf 10 a0 80 00 00 	movabs $0x80a010,%rdi
  802b5b:	00 00 00 
  802b5e:	48 b8 01 14 80 00 00 	movabs $0x801401,%rax
  802b65:	00 00 00 
  802b68:	ff d0                	callq  *%rax
  802b6a:	be 00 00 00 00       	mov    $0x0,%esi
  802b6f:	bf 04 00 00 00       	mov    $0x4,%edi
  802b74:	48 b8 51 28 80 00 00 	movabs $0x802851,%rax
  802b7b:	00 00 00 
  802b7e:	ff d0                	callq  *%rax
  802b80:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802b83:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802b87:	79 05                	jns    802b8e <devfile_write+0x9f>
  802b89:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802b8c:	eb 43                	jmp    802bd1 <devfile_write+0xe2>
  802b8e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802b91:	48 98                	cltq   
  802b93:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  802b97:	76 35                	jbe    802bce <devfile_write+0xdf>
  802b99:	48 b9 16 4b 80 00 00 	movabs $0x804b16,%rcx
  802ba0:	00 00 00 
  802ba3:	48 ba 1d 4b 80 00 00 	movabs $0x804b1d,%rdx
  802baa:	00 00 00 
  802bad:	be a8 00 00 00       	mov    $0xa8,%esi
  802bb2:	48 bf 32 4b 80 00 00 	movabs $0x804b32,%rdi
  802bb9:	00 00 00 
  802bbc:	b8 00 00 00 00       	mov    $0x0,%eax
  802bc1:	49 b8 ef 02 80 00 00 	movabs $0x8002ef,%r8
  802bc8:	00 00 00 
  802bcb:	41 ff d0             	callq  *%r8
  802bce:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802bd1:	c9                   	leaveq 
  802bd2:	c3                   	retq   

0000000000802bd3 <devfile_stat>:
  802bd3:	55                   	push   %rbp
  802bd4:	48 89 e5             	mov    %rsp,%rbp
  802bd7:	48 83 ec 20          	sub    $0x20,%rsp
  802bdb:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802bdf:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802be3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802be7:	8b 50 0c             	mov    0xc(%rax),%edx
  802bea:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  802bf1:	00 00 00 
  802bf4:	89 10                	mov    %edx,(%rax)
  802bf6:	be 00 00 00 00       	mov    $0x0,%esi
  802bfb:	bf 05 00 00 00       	mov    $0x5,%edi
  802c00:	48 b8 51 28 80 00 00 	movabs $0x802851,%rax
  802c07:	00 00 00 
  802c0a:	ff d0                	callq  *%rax
  802c0c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c0f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c13:	79 05                	jns    802c1a <devfile_stat+0x47>
  802c15:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c18:	eb 56                	jmp    802c70 <devfile_stat+0x9d>
  802c1a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802c1e:	48 be 00 a0 80 00 00 	movabs $0x80a000,%rsi
  802c25:	00 00 00 
  802c28:	48 89 c7             	mov    %rax,%rdi
  802c2b:	48 b8 dd 10 80 00 00 	movabs $0x8010dd,%rax
  802c32:	00 00 00 
  802c35:	ff d0                	callq  *%rax
  802c37:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  802c3e:	00 00 00 
  802c41:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  802c47:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802c4b:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  802c51:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  802c58:	00 00 00 
  802c5b:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  802c61:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802c65:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  802c6b:	b8 00 00 00 00       	mov    $0x0,%eax
  802c70:	c9                   	leaveq 
  802c71:	c3                   	retq   

0000000000802c72 <devfile_trunc>:
  802c72:	55                   	push   %rbp
  802c73:	48 89 e5             	mov    %rsp,%rbp
  802c76:	48 83 ec 10          	sub    $0x10,%rsp
  802c7a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802c7e:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802c81:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802c85:	8b 50 0c             	mov    0xc(%rax),%edx
  802c88:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  802c8f:	00 00 00 
  802c92:	89 10                	mov    %edx,(%rax)
  802c94:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  802c9b:	00 00 00 
  802c9e:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802ca1:	89 50 04             	mov    %edx,0x4(%rax)
  802ca4:	be 00 00 00 00       	mov    $0x0,%esi
  802ca9:	bf 02 00 00 00       	mov    $0x2,%edi
  802cae:	48 b8 51 28 80 00 00 	movabs $0x802851,%rax
  802cb5:	00 00 00 
  802cb8:	ff d0                	callq  *%rax
  802cba:	c9                   	leaveq 
  802cbb:	c3                   	retq   

0000000000802cbc <remove>:
  802cbc:	55                   	push   %rbp
  802cbd:	48 89 e5             	mov    %rsp,%rbp
  802cc0:	48 83 ec 10          	sub    $0x10,%rsp
  802cc4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802cc8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802ccc:	48 89 c7             	mov    %rax,%rdi
  802ccf:	48 b8 71 10 80 00 00 	movabs $0x801071,%rax
  802cd6:	00 00 00 
  802cd9:	ff d0                	callq  *%rax
  802cdb:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802ce0:	7e 07                	jle    802ce9 <remove+0x2d>
  802ce2:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802ce7:	eb 33                	jmp    802d1c <remove+0x60>
  802ce9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802ced:	48 89 c6             	mov    %rax,%rsi
  802cf0:	48 bf 00 a0 80 00 00 	movabs $0x80a000,%rdi
  802cf7:	00 00 00 
  802cfa:	48 b8 dd 10 80 00 00 	movabs $0x8010dd,%rax
  802d01:	00 00 00 
  802d04:	ff d0                	callq  *%rax
  802d06:	be 00 00 00 00       	mov    $0x0,%esi
  802d0b:	bf 07 00 00 00       	mov    $0x7,%edi
  802d10:	48 b8 51 28 80 00 00 	movabs $0x802851,%rax
  802d17:	00 00 00 
  802d1a:	ff d0                	callq  *%rax
  802d1c:	c9                   	leaveq 
  802d1d:	c3                   	retq   

0000000000802d1e <sync>:
  802d1e:	55                   	push   %rbp
  802d1f:	48 89 e5             	mov    %rsp,%rbp
  802d22:	be 00 00 00 00       	mov    $0x0,%esi
  802d27:	bf 08 00 00 00       	mov    $0x8,%edi
  802d2c:	48 b8 51 28 80 00 00 	movabs $0x802851,%rax
  802d33:	00 00 00 
  802d36:	ff d0                	callq  *%rax
  802d38:	5d                   	pop    %rbp
  802d39:	c3                   	retq   

0000000000802d3a <copy>:
  802d3a:	55                   	push   %rbp
  802d3b:	48 89 e5             	mov    %rsp,%rbp
  802d3e:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  802d45:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  802d4c:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  802d53:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  802d5a:	be 00 00 00 00       	mov    $0x0,%esi
  802d5f:	48 89 c7             	mov    %rax,%rdi
  802d62:	48 b8 d8 28 80 00 00 	movabs $0x8028d8,%rax
  802d69:	00 00 00 
  802d6c:	ff d0                	callq  *%rax
  802d6e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d71:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d75:	79 28                	jns    802d9f <copy+0x65>
  802d77:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d7a:	89 c6                	mov    %eax,%esi
  802d7c:	48 bf 4c 4b 80 00 00 	movabs $0x804b4c,%rdi
  802d83:	00 00 00 
  802d86:	b8 00 00 00 00       	mov    $0x0,%eax
  802d8b:	48 ba 28 05 80 00 00 	movabs $0x800528,%rdx
  802d92:	00 00 00 
  802d95:	ff d2                	callq  *%rdx
  802d97:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d9a:	e9 74 01 00 00       	jmpq   802f13 <copy+0x1d9>
  802d9f:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  802da6:	be 01 01 00 00       	mov    $0x101,%esi
  802dab:	48 89 c7             	mov    %rax,%rdi
  802dae:	48 b8 d8 28 80 00 00 	movabs $0x8028d8,%rax
  802db5:	00 00 00 
  802db8:	ff d0                	callq  *%rax
  802dba:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802dbd:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802dc1:	79 39                	jns    802dfc <copy+0xc2>
  802dc3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802dc6:	89 c6                	mov    %eax,%esi
  802dc8:	48 bf 62 4b 80 00 00 	movabs $0x804b62,%rdi
  802dcf:	00 00 00 
  802dd2:	b8 00 00 00 00       	mov    $0x0,%eax
  802dd7:	48 ba 28 05 80 00 00 	movabs $0x800528,%rdx
  802dde:	00 00 00 
  802de1:	ff d2                	callq  *%rdx
  802de3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802de6:	89 c7                	mov    %eax,%edi
  802de8:	48 b8 e0 21 80 00 00 	movabs $0x8021e0,%rax
  802def:	00 00 00 
  802df2:	ff d0                	callq  *%rax
  802df4:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802df7:	e9 17 01 00 00       	jmpq   802f13 <copy+0x1d9>
  802dfc:	eb 74                	jmp    802e72 <copy+0x138>
  802dfe:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802e01:	48 63 d0             	movslq %eax,%rdx
  802e04:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802e0b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802e0e:	48 89 ce             	mov    %rcx,%rsi
  802e11:	89 c7                	mov    %eax,%edi
  802e13:	48 b8 4c 25 80 00 00 	movabs $0x80254c,%rax
  802e1a:	00 00 00 
  802e1d:	ff d0                	callq  *%rax
  802e1f:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802e22:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802e26:	79 4a                	jns    802e72 <copy+0x138>
  802e28:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802e2b:	89 c6                	mov    %eax,%esi
  802e2d:	48 bf 7c 4b 80 00 00 	movabs $0x804b7c,%rdi
  802e34:	00 00 00 
  802e37:	b8 00 00 00 00       	mov    $0x0,%eax
  802e3c:	48 ba 28 05 80 00 00 	movabs $0x800528,%rdx
  802e43:	00 00 00 
  802e46:	ff d2                	callq  *%rdx
  802e48:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e4b:	89 c7                	mov    %eax,%edi
  802e4d:	48 b8 e0 21 80 00 00 	movabs $0x8021e0,%rax
  802e54:	00 00 00 
  802e57:	ff d0                	callq  *%rax
  802e59:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802e5c:	89 c7                	mov    %eax,%edi
  802e5e:	48 b8 e0 21 80 00 00 	movabs $0x8021e0,%rax
  802e65:	00 00 00 
  802e68:	ff d0                	callq  *%rax
  802e6a:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802e6d:	e9 a1 00 00 00       	jmpq   802f13 <copy+0x1d9>
  802e72:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802e79:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e7c:	ba 00 02 00 00       	mov    $0x200,%edx
  802e81:	48 89 ce             	mov    %rcx,%rsi
  802e84:	89 c7                	mov    %eax,%edi
  802e86:	48 b8 02 24 80 00 00 	movabs $0x802402,%rax
  802e8d:	00 00 00 
  802e90:	ff d0                	callq  *%rax
  802e92:	89 45 f4             	mov    %eax,-0xc(%rbp)
  802e95:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802e99:	0f 8f 5f ff ff ff    	jg     802dfe <copy+0xc4>
  802e9f:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802ea3:	79 47                	jns    802eec <copy+0x1b2>
  802ea5:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802ea8:	89 c6                	mov    %eax,%esi
  802eaa:	48 bf 8f 4b 80 00 00 	movabs $0x804b8f,%rdi
  802eb1:	00 00 00 
  802eb4:	b8 00 00 00 00       	mov    $0x0,%eax
  802eb9:	48 ba 28 05 80 00 00 	movabs $0x800528,%rdx
  802ec0:	00 00 00 
  802ec3:	ff d2                	callq  *%rdx
  802ec5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ec8:	89 c7                	mov    %eax,%edi
  802eca:	48 b8 e0 21 80 00 00 	movabs $0x8021e0,%rax
  802ed1:	00 00 00 
  802ed4:	ff d0                	callq  *%rax
  802ed6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802ed9:	89 c7                	mov    %eax,%edi
  802edb:	48 b8 e0 21 80 00 00 	movabs $0x8021e0,%rax
  802ee2:	00 00 00 
  802ee5:	ff d0                	callq  *%rax
  802ee7:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802eea:	eb 27                	jmp    802f13 <copy+0x1d9>
  802eec:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802eef:	89 c7                	mov    %eax,%edi
  802ef1:	48 b8 e0 21 80 00 00 	movabs $0x8021e0,%rax
  802ef8:	00 00 00 
  802efb:	ff d0                	callq  *%rax
  802efd:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802f00:	89 c7                	mov    %eax,%edi
  802f02:	48 b8 e0 21 80 00 00 	movabs $0x8021e0,%rax
  802f09:	00 00 00 
  802f0c:	ff d0                	callq  *%rax
  802f0e:	b8 00 00 00 00       	mov    $0x0,%eax
  802f13:	c9                   	leaveq 
  802f14:	c3                   	retq   

0000000000802f15 <writebuf>:
  802f15:	55                   	push   %rbp
  802f16:	48 89 e5             	mov    %rsp,%rbp
  802f19:	48 83 ec 20          	sub    $0x20,%rsp
  802f1d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802f21:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f25:	8b 40 0c             	mov    0xc(%rax),%eax
  802f28:	85 c0                	test   %eax,%eax
  802f2a:	7e 67                	jle    802f93 <writebuf+0x7e>
  802f2c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f30:	8b 40 04             	mov    0x4(%rax),%eax
  802f33:	48 63 d0             	movslq %eax,%rdx
  802f36:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f3a:	48 8d 48 10          	lea    0x10(%rax),%rcx
  802f3e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f42:	8b 00                	mov    (%rax),%eax
  802f44:	48 89 ce             	mov    %rcx,%rsi
  802f47:	89 c7                	mov    %eax,%edi
  802f49:	48 b8 4c 25 80 00 00 	movabs $0x80254c,%rax
  802f50:	00 00 00 
  802f53:	ff d0                	callq  *%rax
  802f55:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f58:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f5c:	7e 13                	jle    802f71 <writebuf+0x5c>
  802f5e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f62:	8b 50 08             	mov    0x8(%rax),%edx
  802f65:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f68:	01 c2                	add    %eax,%edx
  802f6a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f6e:	89 50 08             	mov    %edx,0x8(%rax)
  802f71:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f75:	8b 40 04             	mov    0x4(%rax),%eax
  802f78:	3b 45 fc             	cmp    -0x4(%rbp),%eax
  802f7b:	74 16                	je     802f93 <writebuf+0x7e>
  802f7d:	b8 00 00 00 00       	mov    $0x0,%eax
  802f82:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f86:	0f 4e 45 fc          	cmovle -0x4(%rbp),%eax
  802f8a:	89 c2                	mov    %eax,%edx
  802f8c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f90:	89 50 0c             	mov    %edx,0xc(%rax)
  802f93:	c9                   	leaveq 
  802f94:	c3                   	retq   

0000000000802f95 <putch>:
  802f95:	55                   	push   %rbp
  802f96:	48 89 e5             	mov    %rsp,%rbp
  802f99:	48 83 ec 20          	sub    $0x20,%rsp
  802f9d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802fa0:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802fa4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802fa8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802fac:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802fb0:	8b 40 04             	mov    0x4(%rax),%eax
  802fb3:	8d 48 01             	lea    0x1(%rax),%ecx
  802fb6:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802fba:	89 4a 04             	mov    %ecx,0x4(%rdx)
  802fbd:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802fc0:	89 d1                	mov    %edx,%ecx
  802fc2:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802fc6:	48 98                	cltq   
  802fc8:	88 4c 02 10          	mov    %cl,0x10(%rdx,%rax,1)
  802fcc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802fd0:	8b 40 04             	mov    0x4(%rax),%eax
  802fd3:	3d 00 01 00 00       	cmp    $0x100,%eax
  802fd8:	75 1e                	jne    802ff8 <putch+0x63>
  802fda:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802fde:	48 89 c7             	mov    %rax,%rdi
  802fe1:	48 b8 15 2f 80 00 00 	movabs $0x802f15,%rax
  802fe8:	00 00 00 
  802feb:	ff d0                	callq  *%rax
  802fed:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802ff1:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%rax)
  802ff8:	c9                   	leaveq 
  802ff9:	c3                   	retq   

0000000000802ffa <vfprintf>:
  802ffa:	55                   	push   %rbp
  802ffb:	48 89 e5             	mov    %rsp,%rbp
  802ffe:	48 81 ec 30 01 00 00 	sub    $0x130,%rsp
  803005:	89 bd ec fe ff ff    	mov    %edi,-0x114(%rbp)
  80300b:	48 89 b5 e0 fe ff ff 	mov    %rsi,-0x120(%rbp)
  803012:	48 89 95 d8 fe ff ff 	mov    %rdx,-0x128(%rbp)
  803019:	8b 85 ec fe ff ff    	mov    -0x114(%rbp),%eax
  80301f:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%rbp)
  803025:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  80302c:	00 00 00 
  80302f:	c7 85 f8 fe ff ff 00 	movl   $0x0,-0x108(%rbp)
  803036:	00 00 00 
  803039:	c7 85 fc fe ff ff 01 	movl   $0x1,-0x104(%rbp)
  803040:	00 00 00 
  803043:	48 8b 8d d8 fe ff ff 	mov    -0x128(%rbp),%rcx
  80304a:	48 8b 95 e0 fe ff ff 	mov    -0x120(%rbp),%rdx
  803051:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  803058:	48 89 c6             	mov    %rax,%rsi
  80305b:	48 bf 95 2f 80 00 00 	movabs $0x802f95,%rdi
  803062:	00 00 00 
  803065:	48 b8 db 08 80 00 00 	movabs $0x8008db,%rax
  80306c:	00 00 00 
  80306f:	ff d0                	callq  *%rax
  803071:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  803077:	85 c0                	test   %eax,%eax
  803079:	7e 16                	jle    803091 <vfprintf+0x97>
  80307b:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  803082:	48 89 c7             	mov    %rax,%rdi
  803085:	48 b8 15 2f 80 00 00 	movabs $0x802f15,%rax
  80308c:	00 00 00 
  80308f:	ff d0                	callq  *%rax
  803091:	8b 85 f8 fe ff ff    	mov    -0x108(%rbp),%eax
  803097:	85 c0                	test   %eax,%eax
  803099:	74 08                	je     8030a3 <vfprintf+0xa9>
  80309b:	8b 85 f8 fe ff ff    	mov    -0x108(%rbp),%eax
  8030a1:	eb 06                	jmp    8030a9 <vfprintf+0xaf>
  8030a3:	8b 85 fc fe ff ff    	mov    -0x104(%rbp),%eax
  8030a9:	c9                   	leaveq 
  8030aa:	c3                   	retq   

00000000008030ab <fprintf>:
  8030ab:	55                   	push   %rbp
  8030ac:	48 89 e5             	mov    %rsp,%rbp
  8030af:	48 81 ec e0 00 00 00 	sub    $0xe0,%rsp
  8030b6:	89 bd 2c ff ff ff    	mov    %edi,-0xd4(%rbp)
  8030bc:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  8030c3:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8030ca:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8030d1:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8030d8:	84 c0                	test   %al,%al
  8030da:	74 20                	je     8030fc <fprintf+0x51>
  8030dc:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8030e0:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8030e4:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8030e8:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8030ec:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8030f0:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8030f4:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8030f8:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8030fc:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  803103:	c7 85 30 ff ff ff 10 	movl   $0x10,-0xd0(%rbp)
  80310a:	00 00 00 
  80310d:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  803114:	00 00 00 
  803117:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80311b:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  803122:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  803129:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  803130:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  803137:	48 8b 8d 20 ff ff ff 	mov    -0xe0(%rbp),%rcx
  80313e:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  803144:	48 89 ce             	mov    %rcx,%rsi
  803147:	89 c7                	mov    %eax,%edi
  803149:	48 b8 fa 2f 80 00 00 	movabs $0x802ffa,%rax
  803150:	00 00 00 
  803153:	ff d0                	callq  *%rax
  803155:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  80315b:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  803161:	c9                   	leaveq 
  803162:	c3                   	retq   

0000000000803163 <printf>:
  803163:	55                   	push   %rbp
  803164:	48 89 e5             	mov    %rsp,%rbp
  803167:	48 81 ec e0 00 00 00 	sub    $0xe0,%rsp
  80316e:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  803175:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  80317c:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  803183:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  80318a:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  803191:	84 c0                	test   %al,%al
  803193:	74 20                	je     8031b5 <printf+0x52>
  803195:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  803199:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80319d:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8031a1:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8031a5:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8031a9:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8031ad:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8031b1:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8031b5:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  8031bc:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  8031c3:	00 00 00 
  8031c6:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8031cd:	00 00 00 
  8031d0:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8031d4:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8031db:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8031e2:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8031e9:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8031f0:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  8031f7:	48 89 c6             	mov    %rax,%rsi
  8031fa:	bf 01 00 00 00       	mov    $0x1,%edi
  8031ff:	48 b8 fa 2f 80 00 00 	movabs $0x802ffa,%rax
  803206:	00 00 00 
  803209:	ff d0                	callq  *%rax
  80320b:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  803211:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  803217:	c9                   	leaveq 
  803218:	c3                   	retq   

0000000000803219 <fd2sockid>:
  803219:	55                   	push   %rbp
  80321a:	48 89 e5             	mov    %rsp,%rbp
  80321d:	48 83 ec 20          	sub    $0x20,%rsp
  803221:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803224:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803228:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80322b:	48 89 d6             	mov    %rdx,%rsi
  80322e:	89 c7                	mov    %eax,%edi
  803230:	48 b8 d0 1f 80 00 00 	movabs $0x801fd0,%rax
  803237:	00 00 00 
  80323a:	ff d0                	callq  *%rax
  80323c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80323f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803243:	79 05                	jns    80324a <fd2sockid+0x31>
  803245:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803248:	eb 24                	jmp    80326e <fd2sockid+0x55>
  80324a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80324e:	8b 10                	mov    (%rax),%edx
  803250:	48 b8 a0 60 80 00 00 	movabs $0x8060a0,%rax
  803257:	00 00 00 
  80325a:	8b 00                	mov    (%rax),%eax
  80325c:	39 c2                	cmp    %eax,%edx
  80325e:	74 07                	je     803267 <fd2sockid+0x4e>
  803260:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803265:	eb 07                	jmp    80326e <fd2sockid+0x55>
  803267:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80326b:	8b 40 0c             	mov    0xc(%rax),%eax
  80326e:	c9                   	leaveq 
  80326f:	c3                   	retq   

0000000000803270 <alloc_sockfd>:
  803270:	55                   	push   %rbp
  803271:	48 89 e5             	mov    %rsp,%rbp
  803274:	48 83 ec 20          	sub    $0x20,%rsp
  803278:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80327b:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  80327f:	48 89 c7             	mov    %rax,%rdi
  803282:	48 b8 38 1f 80 00 00 	movabs $0x801f38,%rax
  803289:	00 00 00 
  80328c:	ff d0                	callq  *%rax
  80328e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803291:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803295:	78 26                	js     8032bd <alloc_sockfd+0x4d>
  803297:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80329b:	ba 07 04 00 00       	mov    $0x407,%edx
  8032a0:	48 89 c6             	mov    %rax,%rsi
  8032a3:	bf 00 00 00 00       	mov    $0x0,%edi
  8032a8:	48 b8 0c 1a 80 00 00 	movabs $0x801a0c,%rax
  8032af:	00 00 00 
  8032b2:	ff d0                	callq  *%rax
  8032b4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8032b7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8032bb:	79 16                	jns    8032d3 <alloc_sockfd+0x63>
  8032bd:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8032c0:	89 c7                	mov    %eax,%edi
  8032c2:	48 b8 7d 37 80 00 00 	movabs $0x80377d,%rax
  8032c9:	00 00 00 
  8032cc:	ff d0                	callq  *%rax
  8032ce:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032d1:	eb 3a                	jmp    80330d <alloc_sockfd+0x9d>
  8032d3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8032d7:	48 ba a0 60 80 00 00 	movabs $0x8060a0,%rdx
  8032de:	00 00 00 
  8032e1:	8b 12                	mov    (%rdx),%edx
  8032e3:	89 10                	mov    %edx,(%rax)
  8032e5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8032e9:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8032f0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8032f4:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8032f7:	89 50 0c             	mov    %edx,0xc(%rax)
  8032fa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8032fe:	48 89 c7             	mov    %rax,%rdi
  803301:	48 b8 ea 1e 80 00 00 	movabs $0x801eea,%rax
  803308:	00 00 00 
  80330b:	ff d0                	callq  *%rax
  80330d:	c9                   	leaveq 
  80330e:	c3                   	retq   

000000000080330f <accept>:
  80330f:	55                   	push   %rbp
  803310:	48 89 e5             	mov    %rsp,%rbp
  803313:	48 83 ec 30          	sub    $0x30,%rsp
  803317:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80331a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80331e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803322:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803325:	89 c7                	mov    %eax,%edi
  803327:	48 b8 19 32 80 00 00 	movabs $0x803219,%rax
  80332e:	00 00 00 
  803331:	ff d0                	callq  *%rax
  803333:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803336:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80333a:	79 05                	jns    803341 <accept+0x32>
  80333c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80333f:	eb 3b                	jmp    80337c <accept+0x6d>
  803341:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803345:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803349:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80334c:	48 89 ce             	mov    %rcx,%rsi
  80334f:	89 c7                	mov    %eax,%edi
  803351:	48 b8 5a 36 80 00 00 	movabs $0x80365a,%rax
  803358:	00 00 00 
  80335b:	ff d0                	callq  *%rax
  80335d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803360:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803364:	79 05                	jns    80336b <accept+0x5c>
  803366:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803369:	eb 11                	jmp    80337c <accept+0x6d>
  80336b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80336e:	89 c7                	mov    %eax,%edi
  803370:	48 b8 70 32 80 00 00 	movabs $0x803270,%rax
  803377:	00 00 00 
  80337a:	ff d0                	callq  *%rax
  80337c:	c9                   	leaveq 
  80337d:	c3                   	retq   

000000000080337e <bind>:
  80337e:	55                   	push   %rbp
  80337f:	48 89 e5             	mov    %rsp,%rbp
  803382:	48 83 ec 20          	sub    $0x20,%rsp
  803386:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803389:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80338d:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803390:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803393:	89 c7                	mov    %eax,%edi
  803395:	48 b8 19 32 80 00 00 	movabs $0x803219,%rax
  80339c:	00 00 00 
  80339f:	ff d0                	callq  *%rax
  8033a1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8033a4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8033a8:	79 05                	jns    8033af <bind+0x31>
  8033aa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033ad:	eb 1b                	jmp    8033ca <bind+0x4c>
  8033af:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8033b2:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8033b6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033b9:	48 89 ce             	mov    %rcx,%rsi
  8033bc:	89 c7                	mov    %eax,%edi
  8033be:	48 b8 d9 36 80 00 00 	movabs $0x8036d9,%rax
  8033c5:	00 00 00 
  8033c8:	ff d0                	callq  *%rax
  8033ca:	c9                   	leaveq 
  8033cb:	c3                   	retq   

00000000008033cc <shutdown>:
  8033cc:	55                   	push   %rbp
  8033cd:	48 89 e5             	mov    %rsp,%rbp
  8033d0:	48 83 ec 20          	sub    $0x20,%rsp
  8033d4:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8033d7:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8033da:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8033dd:	89 c7                	mov    %eax,%edi
  8033df:	48 b8 19 32 80 00 00 	movabs $0x803219,%rax
  8033e6:	00 00 00 
  8033e9:	ff d0                	callq  *%rax
  8033eb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8033ee:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8033f2:	79 05                	jns    8033f9 <shutdown+0x2d>
  8033f4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033f7:	eb 16                	jmp    80340f <shutdown+0x43>
  8033f9:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8033fc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033ff:	89 d6                	mov    %edx,%esi
  803401:	89 c7                	mov    %eax,%edi
  803403:	48 b8 3d 37 80 00 00 	movabs $0x80373d,%rax
  80340a:	00 00 00 
  80340d:	ff d0                	callq  *%rax
  80340f:	c9                   	leaveq 
  803410:	c3                   	retq   

0000000000803411 <devsock_close>:
  803411:	55                   	push   %rbp
  803412:	48 89 e5             	mov    %rsp,%rbp
  803415:	48 83 ec 10          	sub    $0x10,%rsp
  803419:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80341d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803421:	48 89 c7             	mov    %rax,%rdi
  803424:	48 b8 6a 44 80 00 00 	movabs $0x80446a,%rax
  80342b:	00 00 00 
  80342e:	ff d0                	callq  *%rax
  803430:	83 f8 01             	cmp    $0x1,%eax
  803433:	75 17                	jne    80344c <devsock_close+0x3b>
  803435:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803439:	8b 40 0c             	mov    0xc(%rax),%eax
  80343c:	89 c7                	mov    %eax,%edi
  80343e:	48 b8 7d 37 80 00 00 	movabs $0x80377d,%rax
  803445:	00 00 00 
  803448:	ff d0                	callq  *%rax
  80344a:	eb 05                	jmp    803451 <devsock_close+0x40>
  80344c:	b8 00 00 00 00       	mov    $0x0,%eax
  803451:	c9                   	leaveq 
  803452:	c3                   	retq   

0000000000803453 <connect>:
  803453:	55                   	push   %rbp
  803454:	48 89 e5             	mov    %rsp,%rbp
  803457:	48 83 ec 20          	sub    $0x20,%rsp
  80345b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80345e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803462:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803465:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803468:	89 c7                	mov    %eax,%edi
  80346a:	48 b8 19 32 80 00 00 	movabs $0x803219,%rax
  803471:	00 00 00 
  803474:	ff d0                	callq  *%rax
  803476:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803479:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80347d:	79 05                	jns    803484 <connect+0x31>
  80347f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803482:	eb 1b                	jmp    80349f <connect+0x4c>
  803484:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803487:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80348b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80348e:	48 89 ce             	mov    %rcx,%rsi
  803491:	89 c7                	mov    %eax,%edi
  803493:	48 b8 aa 37 80 00 00 	movabs $0x8037aa,%rax
  80349a:	00 00 00 
  80349d:	ff d0                	callq  *%rax
  80349f:	c9                   	leaveq 
  8034a0:	c3                   	retq   

00000000008034a1 <listen>:
  8034a1:	55                   	push   %rbp
  8034a2:	48 89 e5             	mov    %rsp,%rbp
  8034a5:	48 83 ec 20          	sub    $0x20,%rsp
  8034a9:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8034ac:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8034af:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8034b2:	89 c7                	mov    %eax,%edi
  8034b4:	48 b8 19 32 80 00 00 	movabs $0x803219,%rax
  8034bb:	00 00 00 
  8034be:	ff d0                	callq  *%rax
  8034c0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8034c3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8034c7:	79 05                	jns    8034ce <listen+0x2d>
  8034c9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034cc:	eb 16                	jmp    8034e4 <listen+0x43>
  8034ce:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8034d1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034d4:	89 d6                	mov    %edx,%esi
  8034d6:	89 c7                	mov    %eax,%edi
  8034d8:	48 b8 0e 38 80 00 00 	movabs $0x80380e,%rax
  8034df:	00 00 00 
  8034e2:	ff d0                	callq  *%rax
  8034e4:	c9                   	leaveq 
  8034e5:	c3                   	retq   

00000000008034e6 <devsock_read>:
  8034e6:	55                   	push   %rbp
  8034e7:	48 89 e5             	mov    %rsp,%rbp
  8034ea:	48 83 ec 20          	sub    $0x20,%rsp
  8034ee:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8034f2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8034f6:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8034fa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8034fe:	89 c2                	mov    %eax,%edx
  803500:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803504:	8b 40 0c             	mov    0xc(%rax),%eax
  803507:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  80350b:	b9 00 00 00 00       	mov    $0x0,%ecx
  803510:	89 c7                	mov    %eax,%edi
  803512:	48 b8 4e 38 80 00 00 	movabs $0x80384e,%rax
  803519:	00 00 00 
  80351c:	ff d0                	callq  *%rax
  80351e:	c9                   	leaveq 
  80351f:	c3                   	retq   

0000000000803520 <devsock_write>:
  803520:	55                   	push   %rbp
  803521:	48 89 e5             	mov    %rsp,%rbp
  803524:	48 83 ec 20          	sub    $0x20,%rsp
  803528:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80352c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803530:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803534:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803538:	89 c2                	mov    %eax,%edx
  80353a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80353e:	8b 40 0c             	mov    0xc(%rax),%eax
  803541:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803545:	b9 00 00 00 00       	mov    $0x0,%ecx
  80354a:	89 c7                	mov    %eax,%edi
  80354c:	48 b8 1a 39 80 00 00 	movabs $0x80391a,%rax
  803553:	00 00 00 
  803556:	ff d0                	callq  *%rax
  803558:	c9                   	leaveq 
  803559:	c3                   	retq   

000000000080355a <devsock_stat>:
  80355a:	55                   	push   %rbp
  80355b:	48 89 e5             	mov    %rsp,%rbp
  80355e:	48 83 ec 10          	sub    $0x10,%rsp
  803562:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803566:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80356a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80356e:	48 be aa 4b 80 00 00 	movabs $0x804baa,%rsi
  803575:	00 00 00 
  803578:	48 89 c7             	mov    %rax,%rdi
  80357b:	48 b8 dd 10 80 00 00 	movabs $0x8010dd,%rax
  803582:	00 00 00 
  803585:	ff d0                	callq  *%rax
  803587:	b8 00 00 00 00       	mov    $0x0,%eax
  80358c:	c9                   	leaveq 
  80358d:	c3                   	retq   

000000000080358e <socket>:
  80358e:	55                   	push   %rbp
  80358f:	48 89 e5             	mov    %rsp,%rbp
  803592:	48 83 ec 20          	sub    $0x20,%rsp
  803596:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803599:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80359c:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  80359f:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8035a2:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  8035a5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8035a8:	89 ce                	mov    %ecx,%esi
  8035aa:	89 c7                	mov    %eax,%edi
  8035ac:	48 b8 d2 39 80 00 00 	movabs $0x8039d2,%rax
  8035b3:	00 00 00 
  8035b6:	ff d0                	callq  *%rax
  8035b8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8035bb:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8035bf:	79 05                	jns    8035c6 <socket+0x38>
  8035c1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035c4:	eb 11                	jmp    8035d7 <socket+0x49>
  8035c6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035c9:	89 c7                	mov    %eax,%edi
  8035cb:	48 b8 70 32 80 00 00 	movabs $0x803270,%rax
  8035d2:	00 00 00 
  8035d5:	ff d0                	callq  *%rax
  8035d7:	c9                   	leaveq 
  8035d8:	c3                   	retq   

00000000008035d9 <nsipc>:
  8035d9:	55                   	push   %rbp
  8035da:	48 89 e5             	mov    %rsp,%rbp
  8035dd:	48 83 ec 10          	sub    $0x10,%rsp
  8035e1:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8035e4:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  8035eb:	00 00 00 
  8035ee:	8b 00                	mov    (%rax),%eax
  8035f0:	85 c0                	test   %eax,%eax
  8035f2:	75 1d                	jne    803611 <nsipc+0x38>
  8035f4:	bf 02 00 00 00       	mov    $0x2,%edi
  8035f9:	48 b8 f8 43 80 00 00 	movabs $0x8043f8,%rax
  803600:	00 00 00 
  803603:	ff d0                	callq  *%rax
  803605:	48 ba 04 70 80 00 00 	movabs $0x807004,%rdx
  80360c:	00 00 00 
  80360f:	89 02                	mov    %eax,(%rdx)
  803611:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  803618:	00 00 00 
  80361b:	8b 00                	mov    (%rax),%eax
  80361d:	8b 75 fc             	mov    -0x4(%rbp),%esi
  803620:	b9 07 00 00 00       	mov    $0x7,%ecx
  803625:	48 ba 00 c0 80 00 00 	movabs $0x80c000,%rdx
  80362c:	00 00 00 
  80362f:	89 c7                	mov    %eax,%edi
  803631:	48 b8 62 43 80 00 00 	movabs $0x804362,%rax
  803638:	00 00 00 
  80363b:	ff d0                	callq  *%rax
  80363d:	ba 00 00 00 00       	mov    $0x0,%edx
  803642:	be 00 00 00 00       	mov    $0x0,%esi
  803647:	bf 00 00 00 00       	mov    $0x0,%edi
  80364c:	48 b8 a1 42 80 00 00 	movabs $0x8042a1,%rax
  803653:	00 00 00 
  803656:	ff d0                	callq  *%rax
  803658:	c9                   	leaveq 
  803659:	c3                   	retq   

000000000080365a <nsipc_accept>:
  80365a:	55                   	push   %rbp
  80365b:	48 89 e5             	mov    %rsp,%rbp
  80365e:	48 83 ec 30          	sub    $0x30,%rsp
  803662:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803665:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803669:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80366d:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803674:	00 00 00 
  803677:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80367a:	89 10                	mov    %edx,(%rax)
  80367c:	bf 01 00 00 00       	mov    $0x1,%edi
  803681:	48 b8 d9 35 80 00 00 	movabs $0x8035d9,%rax
  803688:	00 00 00 
  80368b:	ff d0                	callq  *%rax
  80368d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803690:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803694:	78 3e                	js     8036d4 <nsipc_accept+0x7a>
  803696:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  80369d:	00 00 00 
  8036a0:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8036a4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8036a8:	8b 40 10             	mov    0x10(%rax),%eax
  8036ab:	89 c2                	mov    %eax,%edx
  8036ad:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8036b1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8036b5:	48 89 ce             	mov    %rcx,%rsi
  8036b8:	48 89 c7             	mov    %rax,%rdi
  8036bb:	48 b8 01 14 80 00 00 	movabs $0x801401,%rax
  8036c2:	00 00 00 
  8036c5:	ff d0                	callq  *%rax
  8036c7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8036cb:	8b 50 10             	mov    0x10(%rax),%edx
  8036ce:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8036d2:	89 10                	mov    %edx,(%rax)
  8036d4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036d7:	c9                   	leaveq 
  8036d8:	c3                   	retq   

00000000008036d9 <nsipc_bind>:
  8036d9:	55                   	push   %rbp
  8036da:	48 89 e5             	mov    %rsp,%rbp
  8036dd:	48 83 ec 10          	sub    $0x10,%rsp
  8036e1:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8036e4:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8036e8:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8036eb:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8036f2:	00 00 00 
  8036f5:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8036f8:	89 10                	mov    %edx,(%rax)
  8036fa:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8036fd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803701:	48 89 c6             	mov    %rax,%rsi
  803704:	48 bf 04 c0 80 00 00 	movabs $0x80c004,%rdi
  80370b:	00 00 00 
  80370e:	48 b8 01 14 80 00 00 	movabs $0x801401,%rax
  803715:	00 00 00 
  803718:	ff d0                	callq  *%rax
  80371a:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803721:	00 00 00 
  803724:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803727:	89 50 14             	mov    %edx,0x14(%rax)
  80372a:	bf 02 00 00 00       	mov    $0x2,%edi
  80372f:	48 b8 d9 35 80 00 00 	movabs $0x8035d9,%rax
  803736:	00 00 00 
  803739:	ff d0                	callq  *%rax
  80373b:	c9                   	leaveq 
  80373c:	c3                   	retq   

000000000080373d <nsipc_shutdown>:
  80373d:	55                   	push   %rbp
  80373e:	48 89 e5             	mov    %rsp,%rbp
  803741:	48 83 ec 10          	sub    $0x10,%rsp
  803745:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803748:	89 75 f8             	mov    %esi,-0x8(%rbp)
  80374b:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803752:	00 00 00 
  803755:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803758:	89 10                	mov    %edx,(%rax)
  80375a:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803761:	00 00 00 
  803764:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803767:	89 50 04             	mov    %edx,0x4(%rax)
  80376a:	bf 03 00 00 00       	mov    $0x3,%edi
  80376f:	48 b8 d9 35 80 00 00 	movabs $0x8035d9,%rax
  803776:	00 00 00 
  803779:	ff d0                	callq  *%rax
  80377b:	c9                   	leaveq 
  80377c:	c3                   	retq   

000000000080377d <nsipc_close>:
  80377d:	55                   	push   %rbp
  80377e:	48 89 e5             	mov    %rsp,%rbp
  803781:	48 83 ec 10          	sub    $0x10,%rsp
  803785:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803788:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  80378f:	00 00 00 
  803792:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803795:	89 10                	mov    %edx,(%rax)
  803797:	bf 04 00 00 00       	mov    $0x4,%edi
  80379c:	48 b8 d9 35 80 00 00 	movabs $0x8035d9,%rax
  8037a3:	00 00 00 
  8037a6:	ff d0                	callq  *%rax
  8037a8:	c9                   	leaveq 
  8037a9:	c3                   	retq   

00000000008037aa <nsipc_connect>:
  8037aa:	55                   	push   %rbp
  8037ab:	48 89 e5             	mov    %rsp,%rbp
  8037ae:	48 83 ec 10          	sub    $0x10,%rsp
  8037b2:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8037b5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8037b9:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8037bc:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8037c3:	00 00 00 
  8037c6:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8037c9:	89 10                	mov    %edx,(%rax)
  8037cb:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8037ce:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8037d2:	48 89 c6             	mov    %rax,%rsi
  8037d5:	48 bf 04 c0 80 00 00 	movabs $0x80c004,%rdi
  8037dc:	00 00 00 
  8037df:	48 b8 01 14 80 00 00 	movabs $0x801401,%rax
  8037e6:	00 00 00 
  8037e9:	ff d0                	callq  *%rax
  8037eb:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8037f2:	00 00 00 
  8037f5:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8037f8:	89 50 14             	mov    %edx,0x14(%rax)
  8037fb:	bf 05 00 00 00       	mov    $0x5,%edi
  803800:	48 b8 d9 35 80 00 00 	movabs $0x8035d9,%rax
  803807:	00 00 00 
  80380a:	ff d0                	callq  *%rax
  80380c:	c9                   	leaveq 
  80380d:	c3                   	retq   

000000000080380e <nsipc_listen>:
  80380e:	55                   	push   %rbp
  80380f:	48 89 e5             	mov    %rsp,%rbp
  803812:	48 83 ec 10          	sub    $0x10,%rsp
  803816:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803819:	89 75 f8             	mov    %esi,-0x8(%rbp)
  80381c:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803823:	00 00 00 
  803826:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803829:	89 10                	mov    %edx,(%rax)
  80382b:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803832:	00 00 00 
  803835:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803838:	89 50 04             	mov    %edx,0x4(%rax)
  80383b:	bf 06 00 00 00       	mov    $0x6,%edi
  803840:	48 b8 d9 35 80 00 00 	movabs $0x8035d9,%rax
  803847:	00 00 00 
  80384a:	ff d0                	callq  *%rax
  80384c:	c9                   	leaveq 
  80384d:	c3                   	retq   

000000000080384e <nsipc_recv>:
  80384e:	55                   	push   %rbp
  80384f:	48 89 e5             	mov    %rsp,%rbp
  803852:	48 83 ec 30          	sub    $0x30,%rsp
  803856:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803859:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80385d:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803860:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  803863:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  80386a:	00 00 00 
  80386d:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803870:	89 10                	mov    %edx,(%rax)
  803872:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803879:	00 00 00 
  80387c:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80387f:	89 50 04             	mov    %edx,0x4(%rax)
  803882:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803889:	00 00 00 
  80388c:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80388f:	89 50 08             	mov    %edx,0x8(%rax)
  803892:	bf 07 00 00 00       	mov    $0x7,%edi
  803897:	48 b8 d9 35 80 00 00 	movabs $0x8035d9,%rax
  80389e:	00 00 00 
  8038a1:	ff d0                	callq  *%rax
  8038a3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8038a6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8038aa:	78 69                	js     803915 <nsipc_recv+0xc7>
  8038ac:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  8038b3:	7f 08                	jg     8038bd <nsipc_recv+0x6f>
  8038b5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038b8:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  8038bb:	7e 35                	jle    8038f2 <nsipc_recv+0xa4>
  8038bd:	48 b9 b1 4b 80 00 00 	movabs $0x804bb1,%rcx
  8038c4:	00 00 00 
  8038c7:	48 ba c6 4b 80 00 00 	movabs $0x804bc6,%rdx
  8038ce:	00 00 00 
  8038d1:	be 62 00 00 00       	mov    $0x62,%esi
  8038d6:	48 bf db 4b 80 00 00 	movabs $0x804bdb,%rdi
  8038dd:	00 00 00 
  8038e0:	b8 00 00 00 00       	mov    $0x0,%eax
  8038e5:	49 b8 ef 02 80 00 00 	movabs $0x8002ef,%r8
  8038ec:	00 00 00 
  8038ef:	41 ff d0             	callq  *%r8
  8038f2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038f5:	48 63 d0             	movslq %eax,%rdx
  8038f8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8038fc:	48 be 00 c0 80 00 00 	movabs $0x80c000,%rsi
  803903:	00 00 00 
  803906:	48 89 c7             	mov    %rax,%rdi
  803909:	48 b8 01 14 80 00 00 	movabs $0x801401,%rax
  803910:	00 00 00 
  803913:	ff d0                	callq  *%rax
  803915:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803918:	c9                   	leaveq 
  803919:	c3                   	retq   

000000000080391a <nsipc_send>:
  80391a:	55                   	push   %rbp
  80391b:	48 89 e5             	mov    %rsp,%rbp
  80391e:	48 83 ec 20          	sub    $0x20,%rsp
  803922:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803925:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803929:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80392c:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  80392f:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803936:	00 00 00 
  803939:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80393c:	89 10                	mov    %edx,(%rax)
  80393e:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  803945:	7e 35                	jle    80397c <nsipc_send+0x62>
  803947:	48 b9 ea 4b 80 00 00 	movabs $0x804bea,%rcx
  80394e:	00 00 00 
  803951:	48 ba c6 4b 80 00 00 	movabs $0x804bc6,%rdx
  803958:	00 00 00 
  80395b:	be 6d 00 00 00       	mov    $0x6d,%esi
  803960:	48 bf db 4b 80 00 00 	movabs $0x804bdb,%rdi
  803967:	00 00 00 
  80396a:	b8 00 00 00 00       	mov    $0x0,%eax
  80396f:	49 b8 ef 02 80 00 00 	movabs $0x8002ef,%r8
  803976:	00 00 00 
  803979:	41 ff d0             	callq  *%r8
  80397c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80397f:	48 63 d0             	movslq %eax,%rdx
  803982:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803986:	48 89 c6             	mov    %rax,%rsi
  803989:	48 bf 0c c0 80 00 00 	movabs $0x80c00c,%rdi
  803990:	00 00 00 
  803993:	48 b8 01 14 80 00 00 	movabs $0x801401,%rax
  80399a:	00 00 00 
  80399d:	ff d0                	callq  *%rax
  80399f:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8039a6:	00 00 00 
  8039a9:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8039ac:	89 50 04             	mov    %edx,0x4(%rax)
  8039af:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8039b6:	00 00 00 
  8039b9:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8039bc:	89 50 08             	mov    %edx,0x8(%rax)
  8039bf:	bf 08 00 00 00       	mov    $0x8,%edi
  8039c4:	48 b8 d9 35 80 00 00 	movabs $0x8035d9,%rax
  8039cb:	00 00 00 
  8039ce:	ff d0                	callq  *%rax
  8039d0:	c9                   	leaveq 
  8039d1:	c3                   	retq   

00000000008039d2 <nsipc_socket>:
  8039d2:	55                   	push   %rbp
  8039d3:	48 89 e5             	mov    %rsp,%rbp
  8039d6:	48 83 ec 10          	sub    $0x10,%rsp
  8039da:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8039dd:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8039e0:	89 55 f4             	mov    %edx,-0xc(%rbp)
  8039e3:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8039ea:	00 00 00 
  8039ed:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8039f0:	89 10                	mov    %edx,(%rax)
  8039f2:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8039f9:	00 00 00 
  8039fc:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8039ff:	89 50 04             	mov    %edx,0x4(%rax)
  803a02:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803a09:	00 00 00 
  803a0c:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803a0f:	89 50 08             	mov    %edx,0x8(%rax)
  803a12:	bf 09 00 00 00       	mov    $0x9,%edi
  803a17:	48 b8 d9 35 80 00 00 	movabs $0x8035d9,%rax
  803a1e:	00 00 00 
  803a21:	ff d0                	callq  *%rax
  803a23:	c9                   	leaveq 
  803a24:	c3                   	retq   

0000000000803a25 <pipe>:
  803a25:	55                   	push   %rbp
  803a26:	48 89 e5             	mov    %rsp,%rbp
  803a29:	53                   	push   %rbx
  803a2a:	48 83 ec 38          	sub    $0x38,%rsp
  803a2e:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  803a32:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  803a36:	48 89 c7             	mov    %rax,%rdi
  803a39:	48 b8 38 1f 80 00 00 	movabs $0x801f38,%rax
  803a40:	00 00 00 
  803a43:	ff d0                	callq  *%rax
  803a45:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803a48:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803a4c:	0f 88 bf 01 00 00    	js     803c11 <pipe+0x1ec>
  803a52:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803a56:	ba 07 04 00 00       	mov    $0x407,%edx
  803a5b:	48 89 c6             	mov    %rax,%rsi
  803a5e:	bf 00 00 00 00       	mov    $0x0,%edi
  803a63:	48 b8 0c 1a 80 00 00 	movabs $0x801a0c,%rax
  803a6a:	00 00 00 
  803a6d:	ff d0                	callq  *%rax
  803a6f:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803a72:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803a76:	0f 88 95 01 00 00    	js     803c11 <pipe+0x1ec>
  803a7c:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  803a80:	48 89 c7             	mov    %rax,%rdi
  803a83:	48 b8 38 1f 80 00 00 	movabs $0x801f38,%rax
  803a8a:	00 00 00 
  803a8d:	ff d0                	callq  *%rax
  803a8f:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803a92:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803a96:	0f 88 5d 01 00 00    	js     803bf9 <pipe+0x1d4>
  803a9c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803aa0:	ba 07 04 00 00       	mov    $0x407,%edx
  803aa5:	48 89 c6             	mov    %rax,%rsi
  803aa8:	bf 00 00 00 00       	mov    $0x0,%edi
  803aad:	48 b8 0c 1a 80 00 00 	movabs $0x801a0c,%rax
  803ab4:	00 00 00 
  803ab7:	ff d0                	callq  *%rax
  803ab9:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803abc:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803ac0:	0f 88 33 01 00 00    	js     803bf9 <pipe+0x1d4>
  803ac6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803aca:	48 89 c7             	mov    %rax,%rdi
  803acd:	48 b8 0d 1f 80 00 00 	movabs $0x801f0d,%rax
  803ad4:	00 00 00 
  803ad7:	ff d0                	callq  *%rax
  803ad9:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803add:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803ae1:	ba 07 04 00 00       	mov    $0x407,%edx
  803ae6:	48 89 c6             	mov    %rax,%rsi
  803ae9:	bf 00 00 00 00       	mov    $0x0,%edi
  803aee:	48 b8 0c 1a 80 00 00 	movabs $0x801a0c,%rax
  803af5:	00 00 00 
  803af8:	ff d0                	callq  *%rax
  803afa:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803afd:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803b01:	79 05                	jns    803b08 <pipe+0xe3>
  803b03:	e9 d9 00 00 00       	jmpq   803be1 <pipe+0x1bc>
  803b08:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803b0c:	48 89 c7             	mov    %rax,%rdi
  803b0f:	48 b8 0d 1f 80 00 00 	movabs $0x801f0d,%rax
  803b16:	00 00 00 
  803b19:	ff d0                	callq  *%rax
  803b1b:	48 89 c2             	mov    %rax,%rdx
  803b1e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803b22:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  803b28:	48 89 d1             	mov    %rdx,%rcx
  803b2b:	ba 00 00 00 00       	mov    $0x0,%edx
  803b30:	48 89 c6             	mov    %rax,%rsi
  803b33:	bf 00 00 00 00       	mov    $0x0,%edi
  803b38:	48 b8 5c 1a 80 00 00 	movabs $0x801a5c,%rax
  803b3f:	00 00 00 
  803b42:	ff d0                	callq  *%rax
  803b44:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803b47:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803b4b:	79 1b                	jns    803b68 <pipe+0x143>
  803b4d:	90                   	nop
  803b4e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803b52:	48 89 c6             	mov    %rax,%rsi
  803b55:	bf 00 00 00 00       	mov    $0x0,%edi
  803b5a:	48 b8 b7 1a 80 00 00 	movabs $0x801ab7,%rax
  803b61:	00 00 00 
  803b64:	ff d0                	callq  *%rax
  803b66:	eb 79                	jmp    803be1 <pipe+0x1bc>
  803b68:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803b6c:	48 ba e0 60 80 00 00 	movabs $0x8060e0,%rdx
  803b73:	00 00 00 
  803b76:	8b 12                	mov    (%rdx),%edx
  803b78:	89 10                	mov    %edx,(%rax)
  803b7a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803b7e:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  803b85:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803b89:	48 ba e0 60 80 00 00 	movabs $0x8060e0,%rdx
  803b90:	00 00 00 
  803b93:	8b 12                	mov    (%rdx),%edx
  803b95:	89 10                	mov    %edx,(%rax)
  803b97:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803b9b:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  803ba2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803ba6:	48 89 c7             	mov    %rax,%rdi
  803ba9:	48 b8 ea 1e 80 00 00 	movabs $0x801eea,%rax
  803bb0:	00 00 00 
  803bb3:	ff d0                	callq  *%rax
  803bb5:	89 c2                	mov    %eax,%edx
  803bb7:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803bbb:	89 10                	mov    %edx,(%rax)
  803bbd:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803bc1:	48 8d 58 04          	lea    0x4(%rax),%rbx
  803bc5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803bc9:	48 89 c7             	mov    %rax,%rdi
  803bcc:	48 b8 ea 1e 80 00 00 	movabs $0x801eea,%rax
  803bd3:	00 00 00 
  803bd6:	ff d0                	callq  *%rax
  803bd8:	89 03                	mov    %eax,(%rbx)
  803bda:	b8 00 00 00 00       	mov    $0x0,%eax
  803bdf:	eb 33                	jmp    803c14 <pipe+0x1ef>
  803be1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803be5:	48 89 c6             	mov    %rax,%rsi
  803be8:	bf 00 00 00 00       	mov    $0x0,%edi
  803bed:	48 b8 b7 1a 80 00 00 	movabs $0x801ab7,%rax
  803bf4:	00 00 00 
  803bf7:	ff d0                	callq  *%rax
  803bf9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803bfd:	48 89 c6             	mov    %rax,%rsi
  803c00:	bf 00 00 00 00       	mov    $0x0,%edi
  803c05:	48 b8 b7 1a 80 00 00 	movabs $0x801ab7,%rax
  803c0c:	00 00 00 
  803c0f:	ff d0                	callq  *%rax
  803c11:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803c14:	48 83 c4 38          	add    $0x38,%rsp
  803c18:	5b                   	pop    %rbx
  803c19:	5d                   	pop    %rbp
  803c1a:	c3                   	retq   

0000000000803c1b <_pipeisclosed>:
  803c1b:	55                   	push   %rbp
  803c1c:	48 89 e5             	mov    %rsp,%rbp
  803c1f:	53                   	push   %rbx
  803c20:	48 83 ec 28          	sub    $0x28,%rsp
  803c24:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803c28:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803c2c:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  803c33:	00 00 00 
  803c36:	48 8b 00             	mov    (%rax),%rax
  803c39:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  803c3f:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803c42:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803c46:	48 89 c7             	mov    %rax,%rdi
  803c49:	48 b8 6a 44 80 00 00 	movabs $0x80446a,%rax
  803c50:	00 00 00 
  803c53:	ff d0                	callq  *%rax
  803c55:	89 c3                	mov    %eax,%ebx
  803c57:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803c5b:	48 89 c7             	mov    %rax,%rdi
  803c5e:	48 b8 6a 44 80 00 00 	movabs $0x80446a,%rax
  803c65:	00 00 00 
  803c68:	ff d0                	callq  *%rax
  803c6a:	39 c3                	cmp    %eax,%ebx
  803c6c:	0f 94 c0             	sete   %al
  803c6f:	0f b6 c0             	movzbl %al,%eax
  803c72:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803c75:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  803c7c:	00 00 00 
  803c7f:	48 8b 00             	mov    (%rax),%rax
  803c82:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  803c88:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  803c8b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803c8e:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  803c91:	75 05                	jne    803c98 <_pipeisclosed+0x7d>
  803c93:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803c96:	eb 4f                	jmp    803ce7 <_pipeisclosed+0xcc>
  803c98:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803c9b:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  803c9e:	74 42                	je     803ce2 <_pipeisclosed+0xc7>
  803ca0:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  803ca4:	75 3c                	jne    803ce2 <_pipeisclosed+0xc7>
  803ca6:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  803cad:	00 00 00 
  803cb0:	48 8b 00             	mov    (%rax),%rax
  803cb3:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  803cb9:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803cbc:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803cbf:	89 c6                	mov    %eax,%esi
  803cc1:	48 bf fb 4b 80 00 00 	movabs $0x804bfb,%rdi
  803cc8:	00 00 00 
  803ccb:	b8 00 00 00 00       	mov    $0x0,%eax
  803cd0:	49 b8 28 05 80 00 00 	movabs $0x800528,%r8
  803cd7:	00 00 00 
  803cda:	41 ff d0             	callq  *%r8
  803cdd:	e9 4a ff ff ff       	jmpq   803c2c <_pipeisclosed+0x11>
  803ce2:	e9 45 ff ff ff       	jmpq   803c2c <_pipeisclosed+0x11>
  803ce7:	48 83 c4 28          	add    $0x28,%rsp
  803ceb:	5b                   	pop    %rbx
  803cec:	5d                   	pop    %rbp
  803ced:	c3                   	retq   

0000000000803cee <pipeisclosed>:
  803cee:	55                   	push   %rbp
  803cef:	48 89 e5             	mov    %rsp,%rbp
  803cf2:	48 83 ec 30          	sub    $0x30,%rsp
  803cf6:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803cf9:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  803cfd:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803d00:	48 89 d6             	mov    %rdx,%rsi
  803d03:	89 c7                	mov    %eax,%edi
  803d05:	48 b8 d0 1f 80 00 00 	movabs $0x801fd0,%rax
  803d0c:	00 00 00 
  803d0f:	ff d0                	callq  *%rax
  803d11:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803d14:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803d18:	79 05                	jns    803d1f <pipeisclosed+0x31>
  803d1a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d1d:	eb 31                	jmp    803d50 <pipeisclosed+0x62>
  803d1f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803d23:	48 89 c7             	mov    %rax,%rdi
  803d26:	48 b8 0d 1f 80 00 00 	movabs $0x801f0d,%rax
  803d2d:	00 00 00 
  803d30:	ff d0                	callq  *%rax
  803d32:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803d36:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803d3a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803d3e:	48 89 d6             	mov    %rdx,%rsi
  803d41:	48 89 c7             	mov    %rax,%rdi
  803d44:	48 b8 1b 3c 80 00 00 	movabs $0x803c1b,%rax
  803d4b:	00 00 00 
  803d4e:	ff d0                	callq  *%rax
  803d50:	c9                   	leaveq 
  803d51:	c3                   	retq   

0000000000803d52 <devpipe_read>:
  803d52:	55                   	push   %rbp
  803d53:	48 89 e5             	mov    %rsp,%rbp
  803d56:	48 83 ec 40          	sub    $0x40,%rsp
  803d5a:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803d5e:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803d62:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803d66:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803d6a:	48 89 c7             	mov    %rax,%rdi
  803d6d:	48 b8 0d 1f 80 00 00 	movabs $0x801f0d,%rax
  803d74:	00 00 00 
  803d77:	ff d0                	callq  *%rax
  803d79:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803d7d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803d81:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803d85:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803d8c:	00 
  803d8d:	e9 92 00 00 00       	jmpq   803e24 <devpipe_read+0xd2>
  803d92:	eb 41                	jmp    803dd5 <devpipe_read+0x83>
  803d94:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  803d99:	74 09                	je     803da4 <devpipe_read+0x52>
  803d9b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803d9f:	e9 92 00 00 00       	jmpq   803e36 <devpipe_read+0xe4>
  803da4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803da8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803dac:	48 89 d6             	mov    %rdx,%rsi
  803daf:	48 89 c7             	mov    %rax,%rdi
  803db2:	48 b8 1b 3c 80 00 00 	movabs $0x803c1b,%rax
  803db9:	00 00 00 
  803dbc:	ff d0                	callq  *%rax
  803dbe:	85 c0                	test   %eax,%eax
  803dc0:	74 07                	je     803dc9 <devpipe_read+0x77>
  803dc2:	b8 00 00 00 00       	mov    $0x0,%eax
  803dc7:	eb 6d                	jmp    803e36 <devpipe_read+0xe4>
  803dc9:	48 b8 ce 19 80 00 00 	movabs $0x8019ce,%rax
  803dd0:	00 00 00 
  803dd3:	ff d0                	callq  *%rax
  803dd5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803dd9:	8b 10                	mov    (%rax),%edx
  803ddb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ddf:	8b 40 04             	mov    0x4(%rax),%eax
  803de2:	39 c2                	cmp    %eax,%edx
  803de4:	74 ae                	je     803d94 <devpipe_read+0x42>
  803de6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803dea:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803dee:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  803df2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803df6:	8b 00                	mov    (%rax),%eax
  803df8:	99                   	cltd   
  803df9:	c1 ea 1b             	shr    $0x1b,%edx
  803dfc:	01 d0                	add    %edx,%eax
  803dfe:	83 e0 1f             	and    $0x1f,%eax
  803e01:	29 d0                	sub    %edx,%eax
  803e03:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803e07:	48 98                	cltq   
  803e09:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  803e0e:	88 01                	mov    %al,(%rcx)
  803e10:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e14:	8b 00                	mov    (%rax),%eax
  803e16:	8d 50 01             	lea    0x1(%rax),%edx
  803e19:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e1d:	89 10                	mov    %edx,(%rax)
  803e1f:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803e24:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803e28:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803e2c:	0f 82 60 ff ff ff    	jb     803d92 <devpipe_read+0x40>
  803e32:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803e36:	c9                   	leaveq 
  803e37:	c3                   	retq   

0000000000803e38 <devpipe_write>:
  803e38:	55                   	push   %rbp
  803e39:	48 89 e5             	mov    %rsp,%rbp
  803e3c:	48 83 ec 40          	sub    $0x40,%rsp
  803e40:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803e44:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803e48:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803e4c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803e50:	48 89 c7             	mov    %rax,%rdi
  803e53:	48 b8 0d 1f 80 00 00 	movabs $0x801f0d,%rax
  803e5a:	00 00 00 
  803e5d:	ff d0                	callq  *%rax
  803e5f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803e63:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803e67:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803e6b:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803e72:	00 
  803e73:	e9 8e 00 00 00       	jmpq   803f06 <devpipe_write+0xce>
  803e78:	eb 31                	jmp    803eab <devpipe_write+0x73>
  803e7a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803e7e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803e82:	48 89 d6             	mov    %rdx,%rsi
  803e85:	48 89 c7             	mov    %rax,%rdi
  803e88:	48 b8 1b 3c 80 00 00 	movabs $0x803c1b,%rax
  803e8f:	00 00 00 
  803e92:	ff d0                	callq  *%rax
  803e94:	85 c0                	test   %eax,%eax
  803e96:	74 07                	je     803e9f <devpipe_write+0x67>
  803e98:	b8 00 00 00 00       	mov    $0x0,%eax
  803e9d:	eb 79                	jmp    803f18 <devpipe_write+0xe0>
  803e9f:	48 b8 ce 19 80 00 00 	movabs $0x8019ce,%rax
  803ea6:	00 00 00 
  803ea9:	ff d0                	callq  *%rax
  803eab:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803eaf:	8b 40 04             	mov    0x4(%rax),%eax
  803eb2:	48 63 d0             	movslq %eax,%rdx
  803eb5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803eb9:	8b 00                	mov    (%rax),%eax
  803ebb:	48 98                	cltq   
  803ebd:	48 83 c0 20          	add    $0x20,%rax
  803ec1:	48 39 c2             	cmp    %rax,%rdx
  803ec4:	73 b4                	jae    803e7a <devpipe_write+0x42>
  803ec6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803eca:	8b 40 04             	mov    0x4(%rax),%eax
  803ecd:	99                   	cltd   
  803ece:	c1 ea 1b             	shr    $0x1b,%edx
  803ed1:	01 d0                	add    %edx,%eax
  803ed3:	83 e0 1f             	and    $0x1f,%eax
  803ed6:	29 d0                	sub    %edx,%eax
  803ed8:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  803edc:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  803ee0:	48 01 ca             	add    %rcx,%rdx
  803ee3:	0f b6 0a             	movzbl (%rdx),%ecx
  803ee6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803eea:	48 98                	cltq   
  803eec:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  803ef0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ef4:	8b 40 04             	mov    0x4(%rax),%eax
  803ef7:	8d 50 01             	lea    0x1(%rax),%edx
  803efa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803efe:	89 50 04             	mov    %edx,0x4(%rax)
  803f01:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803f06:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803f0a:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803f0e:	0f 82 64 ff ff ff    	jb     803e78 <devpipe_write+0x40>
  803f14:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803f18:	c9                   	leaveq 
  803f19:	c3                   	retq   

0000000000803f1a <devpipe_stat>:
  803f1a:	55                   	push   %rbp
  803f1b:	48 89 e5             	mov    %rsp,%rbp
  803f1e:	48 83 ec 20          	sub    $0x20,%rsp
  803f22:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803f26:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803f2a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803f2e:	48 89 c7             	mov    %rax,%rdi
  803f31:	48 b8 0d 1f 80 00 00 	movabs $0x801f0d,%rax
  803f38:	00 00 00 
  803f3b:	ff d0                	callq  *%rax
  803f3d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803f41:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803f45:	48 be 0e 4c 80 00 00 	movabs $0x804c0e,%rsi
  803f4c:	00 00 00 
  803f4f:	48 89 c7             	mov    %rax,%rdi
  803f52:	48 b8 dd 10 80 00 00 	movabs $0x8010dd,%rax
  803f59:	00 00 00 
  803f5c:	ff d0                	callq  *%rax
  803f5e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803f62:	8b 50 04             	mov    0x4(%rax),%edx
  803f65:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803f69:	8b 00                	mov    (%rax),%eax
  803f6b:	29 c2                	sub    %eax,%edx
  803f6d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803f71:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  803f77:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803f7b:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  803f82:	00 00 00 
  803f85:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803f89:	48 b9 e0 60 80 00 00 	movabs $0x8060e0,%rcx
  803f90:	00 00 00 
  803f93:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  803f9a:	b8 00 00 00 00       	mov    $0x0,%eax
  803f9f:	c9                   	leaveq 
  803fa0:	c3                   	retq   

0000000000803fa1 <devpipe_close>:
  803fa1:	55                   	push   %rbp
  803fa2:	48 89 e5             	mov    %rsp,%rbp
  803fa5:	48 83 ec 10          	sub    $0x10,%rsp
  803fa9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803fad:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803fb1:	48 89 c6             	mov    %rax,%rsi
  803fb4:	bf 00 00 00 00       	mov    $0x0,%edi
  803fb9:	48 b8 b7 1a 80 00 00 	movabs $0x801ab7,%rax
  803fc0:	00 00 00 
  803fc3:	ff d0                	callq  *%rax
  803fc5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803fc9:	48 89 c7             	mov    %rax,%rdi
  803fcc:	48 b8 0d 1f 80 00 00 	movabs $0x801f0d,%rax
  803fd3:	00 00 00 
  803fd6:	ff d0                	callq  *%rax
  803fd8:	48 89 c6             	mov    %rax,%rsi
  803fdb:	bf 00 00 00 00       	mov    $0x0,%edi
  803fe0:	48 b8 b7 1a 80 00 00 	movabs $0x801ab7,%rax
  803fe7:	00 00 00 
  803fea:	ff d0                	callq  *%rax
  803fec:	c9                   	leaveq 
  803fed:	c3                   	retq   

0000000000803fee <cputchar>:
  803fee:	55                   	push   %rbp
  803fef:	48 89 e5             	mov    %rsp,%rbp
  803ff2:	48 83 ec 20          	sub    $0x20,%rsp
  803ff6:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803ff9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803ffc:	88 45 ff             	mov    %al,-0x1(%rbp)
  803fff:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  804003:	be 01 00 00 00       	mov    $0x1,%esi
  804008:	48 89 c7             	mov    %rax,%rdi
  80400b:	48 b8 c4 18 80 00 00 	movabs $0x8018c4,%rax
  804012:	00 00 00 
  804015:	ff d0                	callq  *%rax
  804017:	c9                   	leaveq 
  804018:	c3                   	retq   

0000000000804019 <getchar>:
  804019:	55                   	push   %rbp
  80401a:	48 89 e5             	mov    %rsp,%rbp
  80401d:	48 83 ec 10          	sub    $0x10,%rsp
  804021:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  804025:	ba 01 00 00 00       	mov    $0x1,%edx
  80402a:	48 89 c6             	mov    %rax,%rsi
  80402d:	bf 00 00 00 00       	mov    $0x0,%edi
  804032:	48 b8 02 24 80 00 00 	movabs $0x802402,%rax
  804039:	00 00 00 
  80403c:	ff d0                	callq  *%rax
  80403e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804041:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804045:	79 05                	jns    80404c <getchar+0x33>
  804047:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80404a:	eb 14                	jmp    804060 <getchar+0x47>
  80404c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804050:	7f 07                	jg     804059 <getchar+0x40>
  804052:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  804057:	eb 07                	jmp    804060 <getchar+0x47>
  804059:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  80405d:	0f b6 c0             	movzbl %al,%eax
  804060:	c9                   	leaveq 
  804061:	c3                   	retq   

0000000000804062 <iscons>:
  804062:	55                   	push   %rbp
  804063:	48 89 e5             	mov    %rsp,%rbp
  804066:	48 83 ec 20          	sub    $0x20,%rsp
  80406a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80406d:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  804071:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804074:	48 89 d6             	mov    %rdx,%rsi
  804077:	89 c7                	mov    %eax,%edi
  804079:	48 b8 d0 1f 80 00 00 	movabs $0x801fd0,%rax
  804080:	00 00 00 
  804083:	ff d0                	callq  *%rax
  804085:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804088:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80408c:	79 05                	jns    804093 <iscons+0x31>
  80408e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804091:	eb 1a                	jmp    8040ad <iscons+0x4b>
  804093:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804097:	8b 10                	mov    (%rax),%edx
  804099:	48 b8 20 61 80 00 00 	movabs $0x806120,%rax
  8040a0:	00 00 00 
  8040a3:	8b 00                	mov    (%rax),%eax
  8040a5:	39 c2                	cmp    %eax,%edx
  8040a7:	0f 94 c0             	sete   %al
  8040aa:	0f b6 c0             	movzbl %al,%eax
  8040ad:	c9                   	leaveq 
  8040ae:	c3                   	retq   

00000000008040af <opencons>:
  8040af:	55                   	push   %rbp
  8040b0:	48 89 e5             	mov    %rsp,%rbp
  8040b3:	48 83 ec 10          	sub    $0x10,%rsp
  8040b7:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8040bb:	48 89 c7             	mov    %rax,%rdi
  8040be:	48 b8 38 1f 80 00 00 	movabs $0x801f38,%rax
  8040c5:	00 00 00 
  8040c8:	ff d0                	callq  *%rax
  8040ca:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8040cd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8040d1:	79 05                	jns    8040d8 <opencons+0x29>
  8040d3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8040d6:	eb 5b                	jmp    804133 <opencons+0x84>
  8040d8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8040dc:	ba 07 04 00 00       	mov    $0x407,%edx
  8040e1:	48 89 c6             	mov    %rax,%rsi
  8040e4:	bf 00 00 00 00       	mov    $0x0,%edi
  8040e9:	48 b8 0c 1a 80 00 00 	movabs $0x801a0c,%rax
  8040f0:	00 00 00 
  8040f3:	ff d0                	callq  *%rax
  8040f5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8040f8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8040fc:	79 05                	jns    804103 <opencons+0x54>
  8040fe:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804101:	eb 30                	jmp    804133 <opencons+0x84>
  804103:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804107:	48 ba 20 61 80 00 00 	movabs $0x806120,%rdx
  80410e:	00 00 00 
  804111:	8b 12                	mov    (%rdx),%edx
  804113:	89 10                	mov    %edx,(%rax)
  804115:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804119:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  804120:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804124:	48 89 c7             	mov    %rax,%rdi
  804127:	48 b8 ea 1e 80 00 00 	movabs $0x801eea,%rax
  80412e:	00 00 00 
  804131:	ff d0                	callq  *%rax
  804133:	c9                   	leaveq 
  804134:	c3                   	retq   

0000000000804135 <devcons_read>:
  804135:	55                   	push   %rbp
  804136:	48 89 e5             	mov    %rsp,%rbp
  804139:	48 83 ec 30          	sub    $0x30,%rsp
  80413d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804141:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804145:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804149:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80414e:	75 07                	jne    804157 <devcons_read+0x22>
  804150:	b8 00 00 00 00       	mov    $0x0,%eax
  804155:	eb 4b                	jmp    8041a2 <devcons_read+0x6d>
  804157:	eb 0c                	jmp    804165 <devcons_read+0x30>
  804159:	48 b8 ce 19 80 00 00 	movabs $0x8019ce,%rax
  804160:	00 00 00 
  804163:	ff d0                	callq  *%rax
  804165:	48 b8 0e 19 80 00 00 	movabs $0x80190e,%rax
  80416c:	00 00 00 
  80416f:	ff d0                	callq  *%rax
  804171:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804174:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804178:	74 df                	je     804159 <devcons_read+0x24>
  80417a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80417e:	79 05                	jns    804185 <devcons_read+0x50>
  804180:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804183:	eb 1d                	jmp    8041a2 <devcons_read+0x6d>
  804185:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  804189:	75 07                	jne    804192 <devcons_read+0x5d>
  80418b:	b8 00 00 00 00       	mov    $0x0,%eax
  804190:	eb 10                	jmp    8041a2 <devcons_read+0x6d>
  804192:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804195:	89 c2                	mov    %eax,%edx
  804197:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80419b:	88 10                	mov    %dl,(%rax)
  80419d:	b8 01 00 00 00       	mov    $0x1,%eax
  8041a2:	c9                   	leaveq 
  8041a3:	c3                   	retq   

00000000008041a4 <devcons_write>:
  8041a4:	55                   	push   %rbp
  8041a5:	48 89 e5             	mov    %rsp,%rbp
  8041a8:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  8041af:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  8041b6:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  8041bd:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  8041c4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8041cb:	eb 76                	jmp    804243 <devcons_write+0x9f>
  8041cd:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  8041d4:	89 c2                	mov    %eax,%edx
  8041d6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8041d9:	29 c2                	sub    %eax,%edx
  8041db:	89 d0                	mov    %edx,%eax
  8041dd:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8041e0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8041e3:	83 f8 7f             	cmp    $0x7f,%eax
  8041e6:	76 07                	jbe    8041ef <devcons_write+0x4b>
  8041e8:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  8041ef:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8041f2:	48 63 d0             	movslq %eax,%rdx
  8041f5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8041f8:	48 63 c8             	movslq %eax,%rcx
  8041fb:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  804202:	48 01 c1             	add    %rax,%rcx
  804205:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  80420c:	48 89 ce             	mov    %rcx,%rsi
  80420f:	48 89 c7             	mov    %rax,%rdi
  804212:	48 b8 01 14 80 00 00 	movabs $0x801401,%rax
  804219:	00 00 00 
  80421c:	ff d0                	callq  *%rax
  80421e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804221:	48 63 d0             	movslq %eax,%rdx
  804224:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  80422b:	48 89 d6             	mov    %rdx,%rsi
  80422e:	48 89 c7             	mov    %rax,%rdi
  804231:	48 b8 c4 18 80 00 00 	movabs $0x8018c4,%rax
  804238:	00 00 00 
  80423b:	ff d0                	callq  *%rax
  80423d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804240:	01 45 fc             	add    %eax,-0x4(%rbp)
  804243:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804246:	48 98                	cltq   
  804248:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  80424f:	0f 82 78 ff ff ff    	jb     8041cd <devcons_write+0x29>
  804255:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804258:	c9                   	leaveq 
  804259:	c3                   	retq   

000000000080425a <devcons_close>:
  80425a:	55                   	push   %rbp
  80425b:	48 89 e5             	mov    %rsp,%rbp
  80425e:	48 83 ec 08          	sub    $0x8,%rsp
  804262:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804266:	b8 00 00 00 00       	mov    $0x0,%eax
  80426b:	c9                   	leaveq 
  80426c:	c3                   	retq   

000000000080426d <devcons_stat>:
  80426d:	55                   	push   %rbp
  80426e:	48 89 e5             	mov    %rsp,%rbp
  804271:	48 83 ec 10          	sub    $0x10,%rsp
  804275:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804279:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80427d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804281:	48 be 1a 4c 80 00 00 	movabs $0x804c1a,%rsi
  804288:	00 00 00 
  80428b:	48 89 c7             	mov    %rax,%rdi
  80428e:	48 b8 dd 10 80 00 00 	movabs $0x8010dd,%rax
  804295:	00 00 00 
  804298:	ff d0                	callq  *%rax
  80429a:	b8 00 00 00 00       	mov    $0x0,%eax
  80429f:	c9                   	leaveq 
  8042a0:	c3                   	retq   

00000000008042a1 <ipc_recv>:
  8042a1:	55                   	push   %rbp
  8042a2:	48 89 e5             	mov    %rsp,%rbp
  8042a5:	48 83 ec 30          	sub    $0x30,%rsp
  8042a9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8042ad:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8042b1:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8042b5:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8042ba:	75 0e                	jne    8042ca <ipc_recv+0x29>
  8042bc:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8042c3:	00 00 00 
  8042c6:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8042ca:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8042ce:	48 89 c7             	mov    %rax,%rdi
  8042d1:	48 b8 35 1c 80 00 00 	movabs $0x801c35,%rax
  8042d8:	00 00 00 
  8042db:	ff d0                	callq  *%rax
  8042dd:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8042e0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8042e4:	79 27                	jns    80430d <ipc_recv+0x6c>
  8042e6:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8042eb:	74 0a                	je     8042f7 <ipc_recv+0x56>
  8042ed:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8042f1:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8042f7:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8042fc:	74 0a                	je     804308 <ipc_recv+0x67>
  8042fe:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804302:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  804308:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80430b:	eb 53                	jmp    804360 <ipc_recv+0xbf>
  80430d:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  804312:	74 19                	je     80432d <ipc_recv+0x8c>
  804314:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  80431b:	00 00 00 
  80431e:	48 8b 00             	mov    (%rax),%rax
  804321:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  804327:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80432b:	89 10                	mov    %edx,(%rax)
  80432d:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804332:	74 19                	je     80434d <ipc_recv+0xac>
  804334:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  80433b:	00 00 00 
  80433e:	48 8b 00             	mov    (%rax),%rax
  804341:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  804347:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80434b:	89 10                	mov    %edx,(%rax)
  80434d:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  804354:	00 00 00 
  804357:	48 8b 00             	mov    (%rax),%rax
  80435a:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  804360:	c9                   	leaveq 
  804361:	c3                   	retq   

0000000000804362 <ipc_send>:
  804362:	55                   	push   %rbp
  804363:	48 89 e5             	mov    %rsp,%rbp
  804366:	48 83 ec 30          	sub    $0x30,%rsp
  80436a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80436d:	89 75 e8             	mov    %esi,-0x18(%rbp)
  804370:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  804374:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  804377:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80437c:	75 10                	jne    80438e <ipc_send+0x2c>
  80437e:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804385:	00 00 00 
  804388:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80438c:	eb 0e                	jmp    80439c <ipc_send+0x3a>
  80438e:	eb 0c                	jmp    80439c <ipc_send+0x3a>
  804390:	48 b8 ce 19 80 00 00 	movabs $0x8019ce,%rax
  804397:	00 00 00 
  80439a:	ff d0                	callq  *%rax
  80439c:	8b 75 e8             	mov    -0x18(%rbp),%esi
  80439f:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  8043a2:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8043a6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8043a9:	89 c7                	mov    %eax,%edi
  8043ab:	48 b8 e0 1b 80 00 00 	movabs $0x801be0,%rax
  8043b2:	00 00 00 
  8043b5:	ff d0                	callq  *%rax
  8043b7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8043ba:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  8043be:	74 d0                	je     804390 <ipc_send+0x2e>
  8043c0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8043c4:	79 30                	jns    8043f6 <ipc_send+0x94>
  8043c6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8043c9:	89 c1                	mov    %eax,%ecx
  8043cb:	48 ba 21 4c 80 00 00 	movabs $0x804c21,%rdx
  8043d2:	00 00 00 
  8043d5:	be 44 00 00 00       	mov    $0x44,%esi
  8043da:	48 bf 37 4c 80 00 00 	movabs $0x804c37,%rdi
  8043e1:	00 00 00 
  8043e4:	b8 00 00 00 00       	mov    $0x0,%eax
  8043e9:	49 b8 ef 02 80 00 00 	movabs $0x8002ef,%r8
  8043f0:	00 00 00 
  8043f3:	41 ff d0             	callq  *%r8
  8043f6:	c9                   	leaveq 
  8043f7:	c3                   	retq   

00000000008043f8 <ipc_find_env>:
  8043f8:	55                   	push   %rbp
  8043f9:	48 89 e5             	mov    %rsp,%rbp
  8043fc:	48 83 ec 14          	sub    $0x14,%rsp
  804400:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804403:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80440a:	eb 4e                	jmp    80445a <ipc_find_env+0x62>
  80440c:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804413:	00 00 00 
  804416:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804419:	48 98                	cltq   
  80441b:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804422:	48 01 d0             	add    %rdx,%rax
  804425:	48 05 d0 00 00 00    	add    $0xd0,%rax
  80442b:	8b 00                	mov    (%rax),%eax
  80442d:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  804430:	75 24                	jne    804456 <ipc_find_env+0x5e>
  804432:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804439:	00 00 00 
  80443c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80443f:	48 98                	cltq   
  804441:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804448:	48 01 d0             	add    %rdx,%rax
  80444b:	48 05 c0 00 00 00    	add    $0xc0,%rax
  804451:	8b 40 08             	mov    0x8(%rax),%eax
  804454:	eb 12                	jmp    804468 <ipc_find_env+0x70>
  804456:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80445a:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  804461:	7e a9                	jle    80440c <ipc_find_env+0x14>
  804463:	b8 00 00 00 00       	mov    $0x0,%eax
  804468:	c9                   	leaveq 
  804469:	c3                   	retq   

000000000080446a <pageref>:
  80446a:	55                   	push   %rbp
  80446b:	48 89 e5             	mov    %rsp,%rbp
  80446e:	48 83 ec 18          	sub    $0x18,%rsp
  804472:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804476:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80447a:	48 c1 e8 15          	shr    $0x15,%rax
  80447e:	48 89 c2             	mov    %rax,%rdx
  804481:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  804488:	01 00 00 
  80448b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80448f:	83 e0 01             	and    $0x1,%eax
  804492:	48 85 c0             	test   %rax,%rax
  804495:	75 07                	jne    80449e <pageref+0x34>
  804497:	b8 00 00 00 00       	mov    $0x0,%eax
  80449c:	eb 53                	jmp    8044f1 <pageref+0x87>
  80449e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8044a2:	48 c1 e8 0c          	shr    $0xc,%rax
  8044a6:	48 89 c2             	mov    %rax,%rdx
  8044a9:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8044b0:	01 00 00 
  8044b3:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8044b7:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8044bb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8044bf:	83 e0 01             	and    $0x1,%eax
  8044c2:	48 85 c0             	test   %rax,%rax
  8044c5:	75 07                	jne    8044ce <pageref+0x64>
  8044c7:	b8 00 00 00 00       	mov    $0x0,%eax
  8044cc:	eb 23                	jmp    8044f1 <pageref+0x87>
  8044ce:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8044d2:	48 c1 e8 0c          	shr    $0xc,%rax
  8044d6:	48 89 c2             	mov    %rax,%rdx
  8044d9:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  8044e0:	00 00 00 
  8044e3:	48 c1 e2 04          	shl    $0x4,%rdx
  8044e7:	48 01 d0             	add    %rdx,%rax
  8044ea:	0f b7 40 08          	movzwl 0x8(%rax),%eax
  8044ee:	0f b7 c0             	movzwl %ax,%eax
  8044f1:	c9                   	leaveq 
  8044f2:	c3                   	retq   
