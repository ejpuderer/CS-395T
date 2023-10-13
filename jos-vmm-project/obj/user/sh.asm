
obj/user/sh:     file format elf64-x86-64


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
  80003c:	e8 4b 12 00 00       	callq  80128c <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <runcmd>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 81 ec 60 05 00 00 	sub    $0x560,%rsp
  80004e:	48 89 bd a8 fa ff ff 	mov    %rdi,-0x558(%rbp)
  800055:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
  80005c:	48 8b 85 a8 fa ff ff 	mov    -0x558(%rbp),%rax
  800063:	be 00 00 00 00       	mov    $0x0,%esi
  800068:	48 89 c7             	mov    %rax,%rdi
  80006b:	48 b8 5b 0a 80 00 00 	movabs $0x800a5b,%rax
  800072:	00 00 00 
  800075:	ff d0                	callq  *%rax
  800077:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80007e:	48 8d 85 58 ff ff ff 	lea    -0xa8(%rbp),%rax
  800085:	48 89 c6             	mov    %rax,%rsi
  800088:	bf 00 00 00 00       	mov    $0x0,%edi
  80008d:	48 b8 5b 0a 80 00 00 	movabs $0x800a5b,%rax
  800094:	00 00 00 
  800097:	ff d0                	callq  *%rax
  800099:	89 45 f0             	mov    %eax,-0x10(%rbp)
  80009c:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80009f:	83 f8 3e             	cmp    $0x3e,%eax
  8000a2:	0f 84 4c 01 00 00    	je     8001f4 <runcmd+0x1b1>
  8000a8:	83 f8 3e             	cmp    $0x3e,%eax
  8000ab:	7f 12                	jg     8000bf <runcmd+0x7c>
  8000ad:	85 c0                	test   %eax,%eax
  8000af:	0f 84 b9 03 00 00    	je     80046e <runcmd+0x42b>
  8000b5:	83 f8 3c             	cmp    $0x3c,%eax
  8000b8:	74 64                	je     80011e <runcmd+0xdb>
  8000ba:	e9 7a 03 00 00       	jmpq   800439 <runcmd+0x3f6>
  8000bf:	83 f8 77             	cmp    $0x77,%eax
  8000c2:	74 0e                	je     8000d2 <runcmd+0x8f>
  8000c4:	83 f8 7c             	cmp    $0x7c,%eax
  8000c7:	0f 84 fd 01 00 00    	je     8002ca <runcmd+0x287>
  8000cd:	e9 67 03 00 00       	jmpq   800439 <runcmd+0x3f6>
  8000d2:	83 7d fc 10          	cmpl   $0x10,-0x4(%rbp)
  8000d6:	75 27                	jne    8000ff <runcmd+0xbc>
  8000d8:	48 bf 08 6a 80 00 00 	movabs $0x806a08,%rdi
  8000df:	00 00 00 
  8000e2:	b8 00 00 00 00       	mov    $0x0,%eax
  8000e7:	48 ba 6b 15 80 00 00 	movabs $0x80156b,%rdx
  8000ee:	00 00 00 
  8000f1:	ff d2                	callq  *%rdx
  8000f3:	48 b8 0f 13 80 00 00 	movabs $0x80130f,%rax
  8000fa:	00 00 00 
  8000fd:	ff d0                	callq  *%rax
  8000ff:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800102:	8d 50 01             	lea    0x1(%rax),%edx
  800105:	89 55 fc             	mov    %edx,-0x4(%rbp)
  800108:	48 8b 95 58 ff ff ff 	mov    -0xa8(%rbp),%rdx
  80010f:	48 98                	cltq   
  800111:	48 89 94 c5 60 ff ff 	mov    %rdx,-0xa0(%rbp,%rax,8)
  800118:	ff 
  800119:	e9 4b 03 00 00       	jmpq   800469 <runcmd+0x426>
  80011e:	48 8d 85 58 ff ff ff 	lea    -0xa8(%rbp),%rax
  800125:	48 89 c6             	mov    %rax,%rsi
  800128:	bf 00 00 00 00       	mov    $0x0,%edi
  80012d:	48 b8 5b 0a 80 00 00 	movabs $0x800a5b,%rax
  800134:	00 00 00 
  800137:	ff d0                	callq  *%rax
  800139:	83 f8 77             	cmp    $0x77,%eax
  80013c:	74 27                	je     800165 <runcmd+0x122>
  80013e:	48 bf 20 6a 80 00 00 	movabs $0x806a20,%rdi
  800145:	00 00 00 
  800148:	b8 00 00 00 00       	mov    $0x0,%eax
  80014d:	48 ba 6b 15 80 00 00 	movabs $0x80156b,%rdx
  800154:	00 00 00 
  800157:	ff d2                	callq  *%rdx
  800159:	48 b8 0f 13 80 00 00 	movabs $0x80130f,%rax
  800160:	00 00 00 
  800163:	ff d0                	callq  *%rax
  800165:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  80016c:	be 00 00 00 00       	mov    $0x0,%esi
  800171:	48 89 c7             	mov    %rax,%rdi
  800174:	48 b8 6f 43 80 00 00 	movabs $0x80436f,%rax
  80017b:	00 00 00 
  80017e:	ff d0                	callq  *%rax
  800180:	89 45 ec             	mov    %eax,-0x14(%rbp)
  800183:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  800187:	79 34                	jns    8001bd <runcmd+0x17a>
  800189:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  800190:	8b 55 ec             	mov    -0x14(%rbp),%edx
  800193:	48 89 c6             	mov    %rax,%rsi
  800196:	48 bf 46 6a 80 00 00 	movabs $0x806a46,%rdi
  80019d:	00 00 00 
  8001a0:	b8 00 00 00 00       	mov    $0x0,%eax
  8001a5:	48 b9 6b 15 80 00 00 	movabs $0x80156b,%rcx
  8001ac:	00 00 00 
  8001af:	ff d1                	callq  *%rcx
  8001b1:	48 b8 0f 13 80 00 00 	movabs $0x80130f,%rax
  8001b8:	00 00 00 
  8001bb:	ff d0                	callq  *%rax
  8001bd:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8001c1:	74 2c                	je     8001ef <runcmd+0x1ac>
  8001c3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8001c6:	be 00 00 00 00       	mov    $0x0,%esi
  8001cb:	89 c7                	mov    %eax,%edi
  8001cd:	48 b8 f0 3c 80 00 00 	movabs $0x803cf0,%rax
  8001d4:	00 00 00 
  8001d7:	ff d0                	callq  *%rax
  8001d9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8001dc:	89 c7                	mov    %eax,%edi
  8001de:	48 b8 77 3c 80 00 00 	movabs $0x803c77,%rax
  8001e5:	00 00 00 
  8001e8:	ff d0                	callq  *%rax
  8001ea:	e9 7a 02 00 00       	jmpq   800469 <runcmd+0x426>
  8001ef:	e9 75 02 00 00       	jmpq   800469 <runcmd+0x426>
  8001f4:	48 8d 85 58 ff ff ff 	lea    -0xa8(%rbp),%rax
  8001fb:	48 89 c6             	mov    %rax,%rsi
  8001fe:	bf 00 00 00 00       	mov    $0x0,%edi
  800203:	48 b8 5b 0a 80 00 00 	movabs $0x800a5b,%rax
  80020a:	00 00 00 
  80020d:	ff d0                	callq  *%rax
  80020f:	83 f8 77             	cmp    $0x77,%eax
  800212:	74 27                	je     80023b <runcmd+0x1f8>
  800214:	48 bf 60 6a 80 00 00 	movabs $0x806a60,%rdi
  80021b:	00 00 00 
  80021e:	b8 00 00 00 00       	mov    $0x0,%eax
  800223:	48 ba 6b 15 80 00 00 	movabs $0x80156b,%rdx
  80022a:	00 00 00 
  80022d:	ff d2                	callq  *%rdx
  80022f:	48 b8 0f 13 80 00 00 	movabs $0x80130f,%rax
  800236:	00 00 00 
  800239:	ff d0                	callq  *%rax
  80023b:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  800242:	be 01 03 00 00       	mov    $0x301,%esi
  800247:	48 89 c7             	mov    %rax,%rdi
  80024a:	48 b8 6f 43 80 00 00 	movabs $0x80436f,%rax
  800251:	00 00 00 
  800254:	ff d0                	callq  *%rax
  800256:	89 45 ec             	mov    %eax,-0x14(%rbp)
  800259:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80025d:	79 34                	jns    800293 <runcmd+0x250>
  80025f:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  800266:	8b 55 ec             	mov    -0x14(%rbp),%edx
  800269:	48 89 c6             	mov    %rax,%rsi
  80026c:	48 bf 86 6a 80 00 00 	movabs $0x806a86,%rdi
  800273:	00 00 00 
  800276:	b8 00 00 00 00       	mov    $0x0,%eax
  80027b:	48 b9 6b 15 80 00 00 	movabs $0x80156b,%rcx
  800282:	00 00 00 
  800285:	ff d1                	callq  *%rcx
  800287:	48 b8 0f 13 80 00 00 	movabs $0x80130f,%rax
  80028e:	00 00 00 
  800291:	ff d0                	callq  *%rax
  800293:	83 7d ec 01          	cmpl   $0x1,-0x14(%rbp)
  800297:	74 2c                	je     8002c5 <runcmd+0x282>
  800299:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80029c:	be 01 00 00 00       	mov    $0x1,%esi
  8002a1:	89 c7                	mov    %eax,%edi
  8002a3:	48 b8 f0 3c 80 00 00 	movabs $0x803cf0,%rax
  8002aa:	00 00 00 
  8002ad:	ff d0                	callq  *%rax
  8002af:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8002b2:	89 c7                	mov    %eax,%edi
  8002b4:	48 b8 77 3c 80 00 00 	movabs $0x803c77,%rax
  8002bb:	00 00 00 
  8002be:	ff d0                	callq  *%rax
  8002c0:	e9 a4 01 00 00       	jmpq   800469 <runcmd+0x426>
  8002c5:	e9 9f 01 00 00       	jmpq   800469 <runcmd+0x426>
  8002ca:	48 8d 85 40 fb ff ff 	lea    -0x4c0(%rbp),%rax
  8002d1:	48 89 c7             	mov    %rax,%rdi
  8002d4:	48 b8 26 60 80 00 00 	movabs $0x806026,%rax
  8002db:	00 00 00 
  8002de:	ff d0                	callq  *%rax
  8002e0:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8002e3:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  8002e7:	79 2c                	jns    800315 <runcmd+0x2d2>
  8002e9:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8002ec:	89 c6                	mov    %eax,%esi
  8002ee:	48 bf 9c 6a 80 00 00 	movabs $0x806a9c,%rdi
  8002f5:	00 00 00 
  8002f8:	b8 00 00 00 00       	mov    $0x0,%eax
  8002fd:	48 ba 6b 15 80 00 00 	movabs $0x80156b,%rdx
  800304:	00 00 00 
  800307:	ff d2                	callq  *%rdx
  800309:	48 b8 0f 13 80 00 00 	movabs $0x80130f,%rax
  800310:	00 00 00 
  800313:	ff d0                	callq  *%rax
  800315:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80031c:	00 00 00 
  80031f:	8b 00                	mov    (%rax),%eax
  800321:	85 c0                	test   %eax,%eax
  800323:	74 29                	je     80034e <runcmd+0x30b>
  800325:	8b 95 44 fb ff ff    	mov    -0x4bc(%rbp),%edx
  80032b:	8b 85 40 fb ff ff    	mov    -0x4c0(%rbp),%eax
  800331:	89 c6                	mov    %eax,%esi
  800333:	48 bf a5 6a 80 00 00 	movabs $0x806aa5,%rdi
  80033a:	00 00 00 
  80033d:	b8 00 00 00 00       	mov    $0x0,%eax
  800342:	48 b9 6b 15 80 00 00 	movabs $0x80156b,%rcx
  800349:	00 00 00 
  80034c:	ff d1                	callq  *%rcx
  80034e:	48 b8 27 34 80 00 00 	movabs $0x803427,%rax
  800355:	00 00 00 
  800358:	ff d0                	callq  *%rax
  80035a:	89 45 e8             	mov    %eax,-0x18(%rbp)
  80035d:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  800361:	79 2c                	jns    80038f <runcmd+0x34c>
  800363:	8b 45 e8             	mov    -0x18(%rbp),%eax
  800366:	89 c6                	mov    %eax,%esi
  800368:	48 bf b2 6a 80 00 00 	movabs $0x806ab2,%rdi
  80036f:	00 00 00 
  800372:	b8 00 00 00 00       	mov    $0x0,%eax
  800377:	48 ba 6b 15 80 00 00 	movabs $0x80156b,%rdx
  80037e:	00 00 00 
  800381:	ff d2                	callq  *%rdx
  800383:	48 b8 0f 13 80 00 00 	movabs $0x80130f,%rax
  80038a:	00 00 00 
  80038d:	ff d0                	callq  *%rax
  80038f:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  800393:	75 50                	jne    8003e5 <runcmd+0x3a2>
  800395:	8b 85 40 fb ff ff    	mov    -0x4c0(%rbp),%eax
  80039b:	85 c0                	test   %eax,%eax
  80039d:	74 2d                	je     8003cc <runcmd+0x389>
  80039f:	8b 85 40 fb ff ff    	mov    -0x4c0(%rbp),%eax
  8003a5:	be 00 00 00 00       	mov    $0x0,%esi
  8003aa:	89 c7                	mov    %eax,%edi
  8003ac:	48 b8 f0 3c 80 00 00 	movabs $0x803cf0,%rax
  8003b3:	00 00 00 
  8003b6:	ff d0                	callq  *%rax
  8003b8:	8b 85 40 fb ff ff    	mov    -0x4c0(%rbp),%eax
  8003be:	89 c7                	mov    %eax,%edi
  8003c0:	48 b8 77 3c 80 00 00 	movabs $0x803c77,%rax
  8003c7:	00 00 00 
  8003ca:	ff d0                	callq  *%rax
  8003cc:	8b 85 44 fb ff ff    	mov    -0x4bc(%rbp),%eax
  8003d2:	89 c7                	mov    %eax,%edi
  8003d4:	48 b8 77 3c 80 00 00 	movabs $0x803c77,%rax
  8003db:	00 00 00 
  8003de:	ff d0                	callq  *%rax
  8003e0:	e9 92 fc ff ff       	jmpq   800077 <runcmd+0x34>
  8003e5:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8003e8:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8003eb:	8b 85 44 fb ff ff    	mov    -0x4bc(%rbp),%eax
  8003f1:	83 f8 01             	cmp    $0x1,%eax
  8003f4:	74 2d                	je     800423 <runcmd+0x3e0>
  8003f6:	8b 85 44 fb ff ff    	mov    -0x4bc(%rbp),%eax
  8003fc:	be 01 00 00 00       	mov    $0x1,%esi
  800401:	89 c7                	mov    %eax,%edi
  800403:	48 b8 f0 3c 80 00 00 	movabs $0x803cf0,%rax
  80040a:	00 00 00 
  80040d:	ff d0                	callq  *%rax
  80040f:	8b 85 44 fb ff ff    	mov    -0x4bc(%rbp),%eax
  800415:	89 c7                	mov    %eax,%edi
  800417:	48 b8 77 3c 80 00 00 	movabs $0x803c77,%rax
  80041e:	00 00 00 
  800421:	ff d0                	callq  *%rax
  800423:	8b 85 40 fb ff ff    	mov    -0x4c0(%rbp),%eax
  800429:	89 c7                	mov    %eax,%edi
  80042b:	48 b8 77 3c 80 00 00 	movabs $0x803c77,%rax
  800432:	00 00 00 
  800435:	ff d0                	callq  *%rax
  800437:	eb 36                	jmp    80046f <runcmd+0x42c>
  800439:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80043c:	89 c1                	mov    %eax,%ecx
  80043e:	48 ba bb 6a 80 00 00 	movabs $0x806abb,%rdx
  800445:	00 00 00 
  800448:	be ab 00 00 00       	mov    $0xab,%esi
  80044d:	48 bf d7 6a 80 00 00 	movabs $0x806ad7,%rdi
  800454:	00 00 00 
  800457:	b8 00 00 00 00       	mov    $0x0,%eax
  80045c:	49 b8 32 13 80 00 00 	movabs $0x801332,%r8
  800463:	00 00 00 
  800466:	41 ff d0             	callq  *%r8
  800469:	e9 10 fc ff ff       	jmpq   80007e <runcmd+0x3b>
  80046e:	90                   	nop
  80046f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800473:	75 34                	jne    8004a9 <runcmd+0x466>
  800475:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80047c:	00 00 00 
  80047f:	8b 00                	mov    (%rax),%eax
  800481:	85 c0                	test   %eax,%eax
  800483:	0f 84 79 03 00 00    	je     800802 <runcmd+0x7bf>
  800489:	48 bf e4 6a 80 00 00 	movabs $0x806ae4,%rdi
  800490:	00 00 00 
  800493:	b8 00 00 00 00       	mov    $0x0,%eax
  800498:	48 ba 6b 15 80 00 00 	movabs $0x80156b,%rdx
  80049f:	00 00 00 
  8004a2:	ff d2                	callq  *%rdx
  8004a4:	e9 59 03 00 00       	jmpq   800802 <runcmd+0x7bf>
  8004a9:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
  8004b0:	e9 8a 00 00 00       	jmpq   80053f <runcmd+0x4fc>
  8004b5:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8004bc:	00 00 00 
  8004bf:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8004c2:	48 63 d2             	movslq %edx,%rdx
  8004c5:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  8004c9:	48 8d 85 50 fb ff ff 	lea    -0x4b0(%rbp),%rax
  8004d0:	48 89 d6             	mov    %rdx,%rsi
  8004d3:	48 89 c7             	mov    %rax,%rdi
  8004d6:	48 b8 7a 22 80 00 00 	movabs $0x80227a,%rax
  8004dd:	00 00 00 
  8004e0:	ff d0                	callq  *%rax
  8004e2:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  8004e9:	48 8d 85 50 fb ff ff 	lea    -0x4b0(%rbp),%rax
  8004f0:	48 89 d6             	mov    %rdx,%rsi
  8004f3:	48 89 c7             	mov    %rax,%rdi
  8004f6:	48 b8 bd 22 80 00 00 	movabs $0x8022bd,%rax
  8004fd:	00 00 00 
  800500:	ff d0                	callq  *%rax
  800502:	48 8d 95 b0 fa ff ff 	lea    -0x550(%rbp),%rdx
  800509:	48 8d 85 50 fb ff ff 	lea    -0x4b0(%rbp),%rax
  800510:	48 89 d6             	mov    %rdx,%rsi
  800513:	48 89 c7             	mov    %rax,%rdi
  800516:	48 b8 81 42 80 00 00 	movabs $0x804281,%rax
  80051d:	00 00 00 
  800520:	ff d0                	callq  *%rax
  800522:	89 45 e8             	mov    %eax,-0x18(%rbp)
  800525:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  800529:	75 10                	jne    80053b <runcmd+0x4f8>
  80052b:	48 8d 85 50 fb ff ff 	lea    -0x4b0(%rbp),%rax
  800532:	48 89 85 60 ff ff ff 	mov    %rax,-0xa0(%rbp)
  800539:	eb 19                	jmp    800554 <runcmd+0x511>
  80053b:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
  80053f:	48 b8 10 90 80 00 00 	movabs $0x809010,%rax
  800546:	00 00 00 
  800549:	8b 00                	mov    (%rax),%eax
  80054b:	39 45 f8             	cmp    %eax,-0x8(%rbp)
  80054e:	0f 8c 61 ff ff ff    	jl     8004b5 <runcmd+0x472>
  800554:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  80055b:	0f b6 00             	movzbl (%rax),%eax
  80055e:	3c 2f                	cmp    $0x2f,%al
  800560:	74 39                	je     80059b <runcmd+0x558>
  800562:	c6 85 50 fb ff ff 2f 	movb   $0x2f,-0x4b0(%rbp)
  800569:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  800570:	48 8d 95 50 fb ff ff 	lea    -0x4b0(%rbp),%rdx
  800577:	48 83 c2 01          	add    $0x1,%rdx
  80057b:	48 89 c6             	mov    %rax,%rsi
  80057e:	48 89 d7             	mov    %rdx,%rdi
  800581:	48 b8 7a 22 80 00 00 	movabs $0x80227a,%rax
  800588:	00 00 00 
  80058b:	ff d0                	callq  *%rax
  80058d:	48 8d 85 50 fb ff ff 	lea    -0x4b0(%rbp),%rax
  800594:	48 89 85 60 ff ff ff 	mov    %rax,-0xa0(%rbp)
  80059b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80059e:	48 98                	cltq   
  8005a0:	48 c7 84 c5 60 ff ff 	movq   $0x0,-0xa0(%rbp,%rax,8)
  8005a7:	ff 00 00 00 00 
  8005ac:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8005b3:	00 00 00 
  8005b6:	8b 00                	mov    (%rax),%eax
  8005b8:	85 c0                	test   %eax,%eax
  8005ba:	0f 84 95 00 00 00    	je     800655 <runcmd+0x612>
  8005c0:	48 b8 28 a4 80 00 00 	movabs $0x80a428,%rax
  8005c7:	00 00 00 
  8005ca:	48 8b 00             	mov    (%rax),%rax
  8005cd:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8005d3:	89 c6                	mov    %eax,%esi
  8005d5:	48 bf f3 6a 80 00 00 	movabs $0x806af3,%rdi
  8005dc:	00 00 00 
  8005df:	b8 00 00 00 00       	mov    $0x0,%eax
  8005e4:	48 ba 6b 15 80 00 00 	movabs $0x80156b,%rdx
  8005eb:	00 00 00 
  8005ee:	ff d2                	callq  *%rdx
  8005f0:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
  8005f7:	eb 2f                	jmp    800628 <runcmd+0x5e5>
  8005f9:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8005fc:	48 98                	cltq   
  8005fe:	48 8b 84 c5 60 ff ff 	mov    -0xa0(%rbp,%rax,8),%rax
  800605:	ff 
  800606:	48 89 c6             	mov    %rax,%rsi
  800609:	48 bf 01 6b 80 00 00 	movabs $0x806b01,%rdi
  800610:	00 00 00 
  800613:	b8 00 00 00 00       	mov    $0x0,%eax
  800618:	48 ba 6b 15 80 00 00 	movabs $0x80156b,%rdx
  80061f:	00 00 00 
  800622:	ff d2                	callq  *%rdx
  800624:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
  800628:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80062b:	48 98                	cltq   
  80062d:	48 8b 84 c5 60 ff ff 	mov    -0xa0(%rbp,%rax,8),%rax
  800634:	ff 
  800635:	48 85 c0             	test   %rax,%rax
  800638:	75 bf                	jne    8005f9 <runcmd+0x5b6>
  80063a:	48 bf 05 6b 80 00 00 	movabs $0x806b05,%rdi
  800641:	00 00 00 
  800644:	b8 00 00 00 00       	mov    $0x0,%eax
  800649:	48 ba 6b 15 80 00 00 	movabs $0x80156b,%rdx
  800650:	00 00 00 
  800653:	ff d2                	callq  *%rdx
  800655:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  80065c:	48 8d 95 60 ff ff ff 	lea    -0xa0(%rbp),%rdx
  800663:	48 89 d6             	mov    %rdx,%rsi
  800666:	48 89 c7             	mov    %rax,%rdi
  800669:	48 b8 b0 4c 80 00 00 	movabs $0x804cb0,%rax
  800670:	00 00 00 
  800673:	ff d0                	callq  *%rax
  800675:	89 45 e8             	mov    %eax,-0x18(%rbp)
  800678:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  80067c:	79 28                	jns    8006a6 <runcmd+0x663>
  80067e:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  800685:	8b 55 e8             	mov    -0x18(%rbp),%edx
  800688:	48 89 c6             	mov    %rax,%rsi
  80068b:	48 bf 07 6b 80 00 00 	movabs $0x806b07,%rdi
  800692:	00 00 00 
  800695:	b8 00 00 00 00       	mov    $0x0,%eax
  80069a:	48 b9 6b 15 80 00 00 	movabs $0x80156b,%rcx
  8006a1:	00 00 00 
  8006a4:	ff d1                	callq  *%rcx
  8006a6:	48 b8 c2 3c 80 00 00 	movabs $0x803cc2,%rax
  8006ad:	00 00 00 
  8006b0:	ff d0                	callq  *%rax
  8006b2:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  8006b6:	0f 88 9c 00 00 00    	js     800758 <runcmd+0x715>
  8006bc:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8006c3:	00 00 00 
  8006c6:	8b 00                	mov    (%rax),%eax
  8006c8:	85 c0                	test   %eax,%eax
  8006ca:	74 3b                	je     800707 <runcmd+0x6c4>
  8006cc:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  8006d3:	48 b8 28 a4 80 00 00 	movabs $0x80a428,%rax
  8006da:	00 00 00 
  8006dd:	48 8b 00             	mov    (%rax),%rax
  8006e0:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8006e6:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  8006e9:	89 c6                	mov    %eax,%esi
  8006eb:	48 bf 15 6b 80 00 00 	movabs $0x806b15,%rdi
  8006f2:	00 00 00 
  8006f5:	b8 00 00 00 00       	mov    $0x0,%eax
  8006fa:	49 b8 6b 15 80 00 00 	movabs $0x80156b,%r8
  800701:	00 00 00 
  800704:	41 ff d0             	callq  *%r8
  800707:	8b 45 e8             	mov    -0x18(%rbp),%eax
  80070a:	89 c7                	mov    %eax,%edi
  80070c:	48 b8 ef 65 80 00 00 	movabs $0x8065ef,%rax
  800713:	00 00 00 
  800716:	ff d0                	callq  *%rax
  800718:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80071f:	00 00 00 
  800722:	8b 00                	mov    (%rax),%eax
  800724:	85 c0                	test   %eax,%eax
  800726:	74 30                	je     800758 <runcmd+0x715>
  800728:	48 b8 28 a4 80 00 00 	movabs $0x80a428,%rax
  80072f:	00 00 00 
  800732:	48 8b 00             	mov    (%rax),%rax
  800735:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80073b:	89 c6                	mov    %eax,%esi
  80073d:	48 bf 2a 6b 80 00 00 	movabs $0x806b2a,%rdi
  800744:	00 00 00 
  800747:	b8 00 00 00 00       	mov    $0x0,%eax
  80074c:	48 ba 6b 15 80 00 00 	movabs $0x80156b,%rdx
  800753:	00 00 00 
  800756:	ff d2                	callq  *%rdx
  800758:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  80075c:	0f 84 94 00 00 00    	je     8007f6 <runcmd+0x7b3>
  800762:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  800769:	00 00 00 
  80076c:	8b 00                	mov    (%rax),%eax
  80076e:	85 c0                	test   %eax,%eax
  800770:	74 33                	je     8007a5 <runcmd+0x762>
  800772:	48 b8 28 a4 80 00 00 	movabs $0x80a428,%rax
  800779:	00 00 00 
  80077c:	48 8b 00             	mov    (%rax),%rax
  80077f:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  800785:	8b 55 f4             	mov    -0xc(%rbp),%edx
  800788:	89 c6                	mov    %eax,%esi
  80078a:	48 bf 40 6b 80 00 00 	movabs $0x806b40,%rdi
  800791:	00 00 00 
  800794:	b8 00 00 00 00       	mov    $0x0,%eax
  800799:	48 b9 6b 15 80 00 00 	movabs $0x80156b,%rcx
  8007a0:	00 00 00 
  8007a3:	ff d1                	callq  *%rcx
  8007a5:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8007a8:	89 c7                	mov    %eax,%edi
  8007aa:	48 b8 ef 65 80 00 00 	movabs $0x8065ef,%rax
  8007b1:	00 00 00 
  8007b4:	ff d0                	callq  *%rax
  8007b6:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8007bd:	00 00 00 
  8007c0:	8b 00                	mov    (%rax),%eax
  8007c2:	85 c0                	test   %eax,%eax
  8007c4:	74 30                	je     8007f6 <runcmd+0x7b3>
  8007c6:	48 b8 28 a4 80 00 00 	movabs $0x80a428,%rax
  8007cd:	00 00 00 
  8007d0:	48 8b 00             	mov    (%rax),%rax
  8007d3:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8007d9:	89 c6                	mov    %eax,%esi
  8007db:	48 bf 2a 6b 80 00 00 	movabs $0x806b2a,%rdi
  8007e2:	00 00 00 
  8007e5:	b8 00 00 00 00       	mov    $0x0,%eax
  8007ea:	48 ba 6b 15 80 00 00 	movabs $0x80156b,%rdx
  8007f1:	00 00 00 
  8007f4:	ff d2                	callq  *%rdx
  8007f6:	48 b8 0f 13 80 00 00 	movabs $0x80130f,%rax
  8007fd:	00 00 00 
  800800:	ff d0                	callq  *%rax
  800802:	c9                   	leaveq 
  800803:	c3                   	retq   

0000000000800804 <_gettoken>:
  800804:	55                   	push   %rbp
  800805:	48 89 e5             	mov    %rsp,%rbp
  800808:	48 83 ec 30          	sub    $0x30,%rsp
  80080c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800810:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800814:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  800818:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80081d:	75 36                	jne    800855 <_gettoken+0x51>
  80081f:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  800826:	00 00 00 
  800829:	8b 00                	mov    (%rax),%eax
  80082b:	83 f8 01             	cmp    $0x1,%eax
  80082e:	7e 1b                	jle    80084b <_gettoken+0x47>
  800830:	48 bf 5d 6b 80 00 00 	movabs $0x806b5d,%rdi
  800837:	00 00 00 
  80083a:	b8 00 00 00 00       	mov    $0x0,%eax
  80083f:	48 ba 6b 15 80 00 00 	movabs $0x80156b,%rdx
  800846:	00 00 00 
  800849:	ff d2                	callq  *%rdx
  80084b:	b8 00 00 00 00       	mov    $0x0,%eax
  800850:	e9 04 02 00 00       	jmpq   800a59 <_gettoken+0x255>
  800855:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80085c:	00 00 00 
  80085f:	8b 00                	mov    (%rax),%eax
  800861:	83 f8 01             	cmp    $0x1,%eax
  800864:	7e 22                	jle    800888 <_gettoken+0x84>
  800866:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80086a:	48 89 c6             	mov    %rax,%rsi
  80086d:	48 bf 6c 6b 80 00 00 	movabs $0x806b6c,%rdi
  800874:	00 00 00 
  800877:	b8 00 00 00 00       	mov    $0x0,%eax
  80087c:	48 ba 6b 15 80 00 00 	movabs $0x80156b,%rdx
  800883:	00 00 00 
  800886:	ff d2                	callq  *%rdx
  800888:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80088c:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  800893:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800897:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  80089e:	eb 0f                	jmp    8008af <_gettoken+0xab>
  8008a0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008a4:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8008a8:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8008ac:	c6 00 00             	movb   $0x0,(%rax)
  8008af:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008b3:	0f b6 00             	movzbl (%rax),%eax
  8008b6:	0f be c0             	movsbl %al,%eax
  8008b9:	89 c6                	mov    %eax,%esi
  8008bb:	48 bf 7a 6b 80 00 00 	movabs $0x806b7a,%rdi
  8008c2:	00 00 00 
  8008c5:	48 b8 a0 24 80 00 00 	movabs $0x8024a0,%rax
  8008cc:	00 00 00 
  8008cf:	ff d0                	callq  *%rax
  8008d1:	48 85 c0             	test   %rax,%rax
  8008d4:	75 ca                	jne    8008a0 <_gettoken+0x9c>
  8008d6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008da:	0f b6 00             	movzbl (%rax),%eax
  8008dd:	84 c0                	test   %al,%al
  8008df:	75 36                	jne    800917 <_gettoken+0x113>
  8008e1:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8008e8:	00 00 00 
  8008eb:	8b 00                	mov    (%rax),%eax
  8008ed:	83 f8 01             	cmp    $0x1,%eax
  8008f0:	7e 1b                	jle    80090d <_gettoken+0x109>
  8008f2:	48 bf 7f 6b 80 00 00 	movabs $0x806b7f,%rdi
  8008f9:	00 00 00 
  8008fc:	b8 00 00 00 00       	mov    $0x0,%eax
  800901:	48 ba 6b 15 80 00 00 	movabs $0x80156b,%rdx
  800908:	00 00 00 
  80090b:	ff d2                	callq  *%rdx
  80090d:	b8 00 00 00 00       	mov    $0x0,%eax
  800912:	e9 42 01 00 00       	jmpq   800a59 <_gettoken+0x255>
  800917:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80091b:	0f b6 00             	movzbl (%rax),%eax
  80091e:	0f be c0             	movsbl %al,%eax
  800921:	89 c6                	mov    %eax,%esi
  800923:	48 bf 84 6b 80 00 00 	movabs $0x806b84,%rdi
  80092a:	00 00 00 
  80092d:	48 b8 a0 24 80 00 00 	movabs $0x8024a0,%rax
  800934:	00 00 00 
  800937:	ff d0                	callq  *%rax
  800939:	48 85 c0             	test   %rax,%rax
  80093c:	74 6b                	je     8009a9 <_gettoken+0x1a5>
  80093e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800942:	0f b6 00             	movzbl (%rax),%eax
  800945:	0f be c0             	movsbl %al,%eax
  800948:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80094b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80094f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800953:	48 89 10             	mov    %rdx,(%rax)
  800956:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80095a:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80095e:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  800962:	c6 00 00             	movb   $0x0,(%rax)
  800965:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800969:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80096d:	48 89 10             	mov    %rdx,(%rax)
  800970:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  800977:	00 00 00 
  80097a:	8b 00                	mov    (%rax),%eax
  80097c:	83 f8 01             	cmp    $0x1,%eax
  80097f:	7e 20                	jle    8009a1 <_gettoken+0x19d>
  800981:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800984:	89 c6                	mov    %eax,%esi
  800986:	48 bf 8c 6b 80 00 00 	movabs $0x806b8c,%rdi
  80098d:	00 00 00 
  800990:	b8 00 00 00 00       	mov    $0x0,%eax
  800995:	48 ba 6b 15 80 00 00 	movabs $0x80156b,%rdx
  80099c:	00 00 00 
  80099f:	ff d2                	callq  *%rdx
  8009a1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8009a4:	e9 b0 00 00 00       	jmpq   800a59 <_gettoken+0x255>
  8009a9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8009ad:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009b1:	48 89 10             	mov    %rdx,(%rax)
  8009b4:	eb 05                	jmp    8009bb <_gettoken+0x1b7>
  8009b6:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8009bb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009bf:	0f b6 00             	movzbl (%rax),%eax
  8009c2:	84 c0                	test   %al,%al
  8009c4:	74 27                	je     8009ed <_gettoken+0x1e9>
  8009c6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009ca:	0f b6 00             	movzbl (%rax),%eax
  8009cd:	0f be c0             	movsbl %al,%eax
  8009d0:	89 c6                	mov    %eax,%esi
  8009d2:	48 bf 94 6b 80 00 00 	movabs $0x806b94,%rdi
  8009d9:	00 00 00 
  8009dc:	48 b8 a0 24 80 00 00 	movabs $0x8024a0,%rax
  8009e3:	00 00 00 
  8009e6:	ff d0                	callq  *%rax
  8009e8:	48 85 c0             	test   %rax,%rax
  8009eb:	74 c9                	je     8009b6 <_gettoken+0x1b2>
  8009ed:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8009f1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009f5:	48 89 10             	mov    %rdx,(%rax)
  8009f8:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8009ff:	00 00 00 
  800a02:	8b 00                	mov    (%rax),%eax
  800a04:	83 f8 01             	cmp    $0x1,%eax
  800a07:	7e 4b                	jle    800a54 <_gettoken+0x250>
  800a09:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800a0d:	48 8b 00             	mov    (%rax),%rax
  800a10:	0f b6 00             	movzbl (%rax),%eax
  800a13:	0f be c0             	movsbl %al,%eax
  800a16:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800a19:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800a1d:	48 8b 00             	mov    (%rax),%rax
  800a20:	c6 00 00             	movb   $0x0,(%rax)
  800a23:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800a27:	48 8b 00             	mov    (%rax),%rax
  800a2a:	48 89 c6             	mov    %rax,%rsi
  800a2d:	48 bf a0 6b 80 00 00 	movabs $0x806ba0,%rdi
  800a34:	00 00 00 
  800a37:	b8 00 00 00 00       	mov    $0x0,%eax
  800a3c:	48 ba 6b 15 80 00 00 	movabs $0x80156b,%rdx
  800a43:	00 00 00 
  800a46:	ff d2                	callq  *%rdx
  800a48:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800a4c:	48 8b 00             	mov    (%rax),%rax
  800a4f:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800a52:	88 10                	mov    %dl,(%rax)
  800a54:	b8 77 00 00 00       	mov    $0x77,%eax
  800a59:	c9                   	leaveq 
  800a5a:	c3                   	retq   

0000000000800a5b <gettoken>:
  800a5b:	55                   	push   %rbp
  800a5c:	48 89 e5             	mov    %rsp,%rbp
  800a5f:	48 83 ec 10          	sub    $0x10,%rsp
  800a63:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800a67:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800a6b:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  800a70:	74 3a                	je     800aac <gettoken+0x51>
  800a72:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800a76:	48 ba 10 a0 80 00 00 	movabs $0x80a010,%rdx
  800a7d:	00 00 00 
  800a80:	48 be 08 a0 80 00 00 	movabs $0x80a008,%rsi
  800a87:	00 00 00 
  800a8a:	48 89 c7             	mov    %rax,%rdi
  800a8d:	48 b8 04 08 80 00 00 	movabs $0x800804,%rax
  800a94:	00 00 00 
  800a97:	ff d0                	callq  *%rax
  800a99:	48 ba 18 a0 80 00 00 	movabs $0x80a018,%rdx
  800aa0:	00 00 00 
  800aa3:	89 02                	mov    %eax,(%rdx)
  800aa5:	b8 00 00 00 00       	mov    $0x0,%eax
  800aaa:	eb 74                	jmp    800b20 <gettoken+0xc5>
  800aac:	48 b8 18 a0 80 00 00 	movabs $0x80a018,%rax
  800ab3:	00 00 00 
  800ab6:	8b 10                	mov    (%rax),%edx
  800ab8:	48 b8 1c a0 80 00 00 	movabs $0x80a01c,%rax
  800abf:	00 00 00 
  800ac2:	89 10                	mov    %edx,(%rax)
  800ac4:	48 b8 08 a0 80 00 00 	movabs $0x80a008,%rax
  800acb:	00 00 00 
  800ace:	48 8b 10             	mov    (%rax),%rdx
  800ad1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800ad5:	48 89 10             	mov    %rdx,(%rax)
  800ad8:	48 b8 10 a0 80 00 00 	movabs $0x80a010,%rax
  800adf:	00 00 00 
  800ae2:	48 8b 00             	mov    (%rax),%rax
  800ae5:	48 ba 10 a0 80 00 00 	movabs $0x80a010,%rdx
  800aec:	00 00 00 
  800aef:	48 be 08 a0 80 00 00 	movabs $0x80a008,%rsi
  800af6:	00 00 00 
  800af9:	48 89 c7             	mov    %rax,%rdi
  800afc:	48 b8 04 08 80 00 00 	movabs $0x800804,%rax
  800b03:	00 00 00 
  800b06:	ff d0                	callq  *%rax
  800b08:	48 ba 18 a0 80 00 00 	movabs $0x80a018,%rdx
  800b0f:	00 00 00 
  800b12:	89 02                	mov    %eax,(%rdx)
  800b14:	48 b8 1c a0 80 00 00 	movabs $0x80a01c,%rax
  800b1b:	00 00 00 
  800b1e:	8b 00                	mov    (%rax),%eax
  800b20:	c9                   	leaveq 
  800b21:	c3                   	retq   

0000000000800b22 <usage>:
  800b22:	55                   	push   %rbp
  800b23:	48 89 e5             	mov    %rsp,%rbp
  800b26:	48 bf b0 6b 80 00 00 	movabs $0x806bb0,%rdi
  800b2d:	00 00 00 
  800b30:	b8 00 00 00 00       	mov    $0x0,%eax
  800b35:	48 ba 6b 15 80 00 00 	movabs $0x80156b,%rdx
  800b3c:	00 00 00 
  800b3f:	ff d2                	callq  *%rdx
  800b41:	48 b8 0f 13 80 00 00 	movabs $0x80130f,%rax
  800b48:	00 00 00 
  800b4b:	ff d0                	callq  *%rax
  800b4d:	5d                   	pop    %rbp
  800b4e:	c3                   	retq   

0000000000800b4f <umain>:
  800b4f:	55                   	push   %rbp
  800b50:	48 89 e5             	mov    %rsp,%rbp
  800b53:	48 83 ec 50          	sub    $0x50,%rsp
  800b57:	89 7d bc             	mov    %edi,-0x44(%rbp)
  800b5a:	48 89 75 b0          	mov    %rsi,-0x50(%rbp)
  800b5e:	c6 45 f7 00          	movb   $0x0,-0x9(%rbp)
  800b62:	c7 45 fc 3f 00 00 00 	movl   $0x3f,-0x4(%rbp)
  800b69:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
  800b70:	48 8d 55 c0          	lea    -0x40(%rbp),%rdx
  800b74:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
  800b78:	48 8d 45 bc          	lea    -0x44(%rbp),%rax
  800b7c:	48 89 ce             	mov    %rcx,%rsi
  800b7f:	48 89 c7             	mov    %rax,%rdi
  800b82:	48 b8 9c 36 80 00 00 	movabs $0x80369c,%rax
  800b89:	00 00 00 
  800b8c:	ff d0                	callq  *%rax
  800b8e:	eb 4d                	jmp    800bdd <umain+0x8e>
  800b90:	8b 45 f0             	mov    -0x10(%rbp),%eax
  800b93:	83 f8 69             	cmp    $0x69,%eax
  800b96:	74 27                	je     800bbf <umain+0x70>
  800b98:	83 f8 78             	cmp    $0x78,%eax
  800b9b:	74 2b                	je     800bc8 <umain+0x79>
  800b9d:	83 f8 64             	cmp    $0x64,%eax
  800ba0:	75 2f                	jne    800bd1 <umain+0x82>
  800ba2:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  800ba9:	00 00 00 
  800bac:	8b 00                	mov    (%rax),%eax
  800bae:	8d 50 01             	lea    0x1(%rax),%edx
  800bb1:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  800bb8:	00 00 00 
  800bbb:	89 10                	mov    %edx,(%rax)
  800bbd:	eb 1e                	jmp    800bdd <umain+0x8e>
  800bbf:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  800bc6:	eb 15                	jmp    800bdd <umain+0x8e>
  800bc8:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%rbp)
  800bcf:	eb 0c                	jmp    800bdd <umain+0x8e>
  800bd1:	48 b8 22 0b 80 00 00 	movabs $0x800b22,%rax
  800bd8:	00 00 00 
  800bdb:	ff d0                	callq  *%rax
  800bdd:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
  800be1:	48 89 c7             	mov    %rax,%rdi
  800be4:	48 b8 00 37 80 00 00 	movabs $0x803700,%rax
  800beb:	00 00 00 
  800bee:	ff d0                	callq  *%rax
  800bf0:	89 45 f0             	mov    %eax,-0x10(%rbp)
  800bf3:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  800bf7:	79 97                	jns    800b90 <umain+0x41>
  800bf9:	bf 00 00 00 00       	mov    $0x0,%edi
  800bfe:	48 b8 77 3c 80 00 00 	movabs $0x803c77,%rax
  800c05:	00 00 00 
  800c08:	ff d0                	callq  *%rax
  800c0a:	48 b8 9a 10 80 00 00 	movabs $0x80109a,%rax
  800c11:	00 00 00 
  800c14:	ff d0                	callq  *%rax
  800c16:	89 45 f0             	mov    %eax,-0x10(%rbp)
  800c19:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  800c1d:	79 30                	jns    800c4f <umain+0x100>
  800c1f:	8b 45 f0             	mov    -0x10(%rbp),%eax
  800c22:	89 c1                	mov    %eax,%ecx
  800c24:	48 ba d1 6b 80 00 00 	movabs $0x806bd1,%rdx
  800c2b:	00 00 00 
  800c2e:	be 66 01 00 00       	mov    $0x166,%esi
  800c33:	48 bf d7 6a 80 00 00 	movabs $0x806ad7,%rdi
  800c3a:	00 00 00 
  800c3d:	b8 00 00 00 00       	mov    $0x0,%eax
  800c42:	49 b8 32 13 80 00 00 	movabs $0x801332,%r8
  800c49:	00 00 00 
  800c4c:	41 ff d0             	callq  *%r8
  800c4f:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  800c53:	74 30                	je     800c85 <umain+0x136>
  800c55:	8b 45 f0             	mov    -0x10(%rbp),%eax
  800c58:	89 c1                	mov    %eax,%ecx
  800c5a:	48 ba de 6b 80 00 00 	movabs $0x806bde,%rdx
  800c61:	00 00 00 
  800c64:	be 68 01 00 00       	mov    $0x168,%esi
  800c69:	48 bf d7 6a 80 00 00 	movabs $0x806ad7,%rdi
  800c70:	00 00 00 
  800c73:	b8 00 00 00 00       	mov    $0x0,%eax
  800c78:	49 b8 32 13 80 00 00 	movabs $0x801332,%r8
  800c7f:	00 00 00 
  800c82:	41 ff d0             	callq  *%r8
  800c85:	be 01 00 00 00       	mov    $0x1,%esi
  800c8a:	bf 00 00 00 00       	mov    $0x0,%edi
  800c8f:	48 b8 f0 3c 80 00 00 	movabs $0x803cf0,%rax
  800c96:	00 00 00 
  800c99:	ff d0                	callq  *%rax
  800c9b:	89 45 f0             	mov    %eax,-0x10(%rbp)
  800c9e:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  800ca2:	79 30                	jns    800cd4 <umain+0x185>
  800ca4:	8b 45 f0             	mov    -0x10(%rbp),%eax
  800ca7:	89 c1                	mov    %eax,%ecx
  800ca9:	48 ba f8 6b 80 00 00 	movabs $0x806bf8,%rdx
  800cb0:	00 00 00 
  800cb3:	be 6a 01 00 00       	mov    $0x16a,%esi
  800cb8:	48 bf d7 6a 80 00 00 	movabs $0x806ad7,%rdi
  800cbf:	00 00 00 
  800cc2:	b8 00 00 00 00       	mov    $0x0,%eax
  800cc7:	49 b8 32 13 80 00 00 	movabs $0x801332,%r8
  800cce:	00 00 00 
  800cd1:	41 ff d0             	callq  *%r8
  800cd4:	8b 45 bc             	mov    -0x44(%rbp),%eax
  800cd7:	83 f8 02             	cmp    $0x2,%eax
  800cda:	7e 0c                	jle    800ce8 <umain+0x199>
  800cdc:	48 b8 22 0b 80 00 00 	movabs $0x800b22,%rax
  800ce3:	00 00 00 
  800ce6:	ff d0                	callq  *%rax
  800ce8:	8b 45 bc             	mov    -0x44(%rbp),%eax
  800ceb:	83 f8 02             	cmp    $0x2,%eax
  800cee:	0f 85 b3 00 00 00    	jne    800da7 <umain+0x258>
  800cf4:	bf 00 00 00 00       	mov    $0x0,%edi
  800cf9:	48 b8 77 3c 80 00 00 	movabs $0x803c77,%rax
  800d00:	00 00 00 
  800d03:	ff d0                	callq  *%rax
  800d05:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
  800d09:	48 83 c0 08          	add    $0x8,%rax
  800d0d:	48 8b 00             	mov    (%rax),%rax
  800d10:	be 00 00 00 00       	mov    $0x0,%esi
  800d15:	48 89 c7             	mov    %rax,%rdi
  800d18:	48 b8 6f 43 80 00 00 	movabs $0x80436f,%rax
  800d1f:	00 00 00 
  800d22:	ff d0                	callq  *%rax
  800d24:	89 45 f0             	mov    %eax,-0x10(%rbp)
  800d27:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  800d2b:	79 3f                	jns    800d6c <umain+0x21d>
  800d2d:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
  800d31:	48 83 c0 08          	add    $0x8,%rax
  800d35:	48 8b 00             	mov    (%rax),%rax
  800d38:	8b 55 f0             	mov    -0x10(%rbp),%edx
  800d3b:	41 89 d0             	mov    %edx,%r8d
  800d3e:	48 89 c1             	mov    %rax,%rcx
  800d41:	48 ba 00 6c 80 00 00 	movabs $0x806c00,%rdx
  800d48:	00 00 00 
  800d4b:	be 71 01 00 00       	mov    $0x171,%esi
  800d50:	48 bf d7 6a 80 00 00 	movabs $0x806ad7,%rdi
  800d57:	00 00 00 
  800d5a:	b8 00 00 00 00       	mov    $0x0,%eax
  800d5f:	49 b9 32 13 80 00 00 	movabs $0x801332,%r9
  800d66:	00 00 00 
  800d69:	41 ff d1             	callq  *%r9
  800d6c:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  800d70:	74 35                	je     800da7 <umain+0x258>
  800d72:	48 b9 0c 6c 80 00 00 	movabs $0x806c0c,%rcx
  800d79:	00 00 00 
  800d7c:	48 ba 13 6c 80 00 00 	movabs $0x806c13,%rdx
  800d83:	00 00 00 
  800d86:	be 72 01 00 00       	mov    $0x172,%esi
  800d8b:	48 bf d7 6a 80 00 00 	movabs $0x806ad7,%rdi
  800d92:	00 00 00 
  800d95:	b8 00 00 00 00       	mov    $0x0,%eax
  800d9a:	49 b8 32 13 80 00 00 	movabs $0x801332,%r8
  800da1:	00 00 00 
  800da4:	41 ff d0             	callq  *%r8
  800da7:	83 7d fc 3f          	cmpl   $0x3f,-0x4(%rbp)
  800dab:	75 14                	jne    800dc1 <umain+0x272>
  800dad:	bf 00 00 00 00       	mov    $0x0,%edi
  800db2:	48 b8 4d 10 80 00 00 	movabs $0x80104d,%rax
  800db9:	00 00 00 
  800dbc:	ff d0                	callq  *%rax
  800dbe:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800dc1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800dc5:	74 0c                	je     800dd3 <umain+0x284>
  800dc7:	48 b8 28 6c 80 00 00 	movabs $0x806c28,%rax
  800dce:	00 00 00 
  800dd1:	eb 05                	jmp    800dd8 <umain+0x289>
  800dd3:	b8 00 00 00 00       	mov    $0x0,%eax
  800dd8:	48 89 c7             	mov    %rax,%rdi
  800ddb:	48 b8 b4 20 80 00 00 	movabs $0x8020b4,%rax
  800de2:	00 00 00 
  800de5:	ff d0                	callq  *%rax
  800de7:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800deb:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  800df0:	75 37                	jne    800e29 <umain+0x2da>
  800df2:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  800df9:	00 00 00 
  800dfc:	8b 00                	mov    (%rax),%eax
  800dfe:	85 c0                	test   %eax,%eax
  800e00:	74 1b                	je     800e1d <umain+0x2ce>
  800e02:	48 bf 2b 6c 80 00 00 	movabs $0x806c2b,%rdi
  800e09:	00 00 00 
  800e0c:	b8 00 00 00 00       	mov    $0x0,%eax
  800e11:	48 ba 6b 15 80 00 00 	movabs $0x80156b,%rdx
  800e18:	00 00 00 
  800e1b:	ff d2                	callq  *%rdx
  800e1d:	48 b8 0f 13 80 00 00 	movabs $0x80130f,%rax
  800e24:	00 00 00 
  800e27:	ff d0                	callq  *%rax
  800e29:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e2d:	48 be 34 6c 80 00 00 	movabs $0x806c34,%rsi
  800e34:	00 00 00 
  800e37:	48 89 c7             	mov    %rax,%rdi
  800e3a:	48 b8 dc 23 80 00 00 	movabs $0x8023dc,%rax
  800e41:	00 00 00 
  800e44:	ff d0                	callq  *%rax
  800e46:	85 c0                	test   %eax,%eax
  800e48:	75 04                	jne    800e4e <umain+0x2ff>
  800e4a:	c6 45 f7 01          	movb   $0x1,-0x9(%rbp)
  800e4e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e52:	48 be 3e 6c 80 00 00 	movabs $0x806c3e,%rsi
  800e59:	00 00 00 
  800e5c:	48 89 c7             	mov    %rax,%rdi
  800e5f:	48 b8 dc 23 80 00 00 	movabs $0x8023dc,%rax
  800e66:	00 00 00 
  800e69:	ff d0                	callq  *%rax
  800e6b:	85 c0                	test   %eax,%eax
  800e6d:	75 0c                	jne    800e7b <umain+0x32c>
  800e6f:	48 b8 0f 13 80 00 00 	movabs $0x80130f,%rax
  800e76:	00 00 00 
  800e79:	ff d0                	callq  *%rax
  800e7b:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  800e82:	00 00 00 
  800e85:	8b 00                	mov    (%rax),%eax
  800e87:	85 c0                	test   %eax,%eax
  800e89:	74 22                	je     800ead <umain+0x35e>
  800e8b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e8f:	48 89 c6             	mov    %rax,%rsi
  800e92:	48 bf 43 6c 80 00 00 	movabs $0x806c43,%rdi
  800e99:	00 00 00 
  800e9c:	b8 00 00 00 00       	mov    $0x0,%eax
  800ea1:	48 ba 6b 15 80 00 00 	movabs $0x80156b,%rdx
  800ea8:	00 00 00 
  800eab:	ff d2                	callq  *%rdx
  800ead:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800eb1:	0f b6 00             	movzbl (%rax),%eax
  800eb4:	3c 23                	cmp    $0x23,%al
  800eb6:	75 05                	jne    800ebd <umain+0x36e>
  800eb8:	e9 17 01 00 00       	jmpq   800fd4 <umain+0x485>
  800ebd:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  800ec1:	74 22                	je     800ee5 <umain+0x396>
  800ec3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ec7:	48 89 c6             	mov    %rax,%rsi
  800eca:	48 bf 4d 6c 80 00 00 	movabs $0x806c4d,%rdi
  800ed1:	00 00 00 
  800ed4:	b8 00 00 00 00       	mov    $0x0,%eax
  800ed9:	48 ba fa 4b 80 00 00 	movabs $0x804bfa,%rdx
  800ee0:	00 00 00 
  800ee3:	ff d2                	callq  *%rdx
  800ee5:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  800eec:	00 00 00 
  800eef:	8b 00                	mov    (%rax),%eax
  800ef1:	85 c0                	test   %eax,%eax
  800ef3:	74 1b                	je     800f10 <umain+0x3c1>
  800ef5:	48 bf 53 6c 80 00 00 	movabs $0x806c53,%rdi
  800efc:	00 00 00 
  800eff:	b8 00 00 00 00       	mov    $0x0,%eax
  800f04:	48 ba 6b 15 80 00 00 	movabs $0x80156b,%rdx
  800f0b:	00 00 00 
  800f0e:	ff d2                	callq  *%rdx
  800f10:	48 b8 27 34 80 00 00 	movabs $0x803427,%rax
  800f17:	00 00 00 
  800f1a:	ff d0                	callq  *%rax
  800f1c:	89 45 f0             	mov    %eax,-0x10(%rbp)
  800f1f:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  800f23:	79 30                	jns    800f55 <umain+0x406>
  800f25:	8b 45 f0             	mov    -0x10(%rbp),%eax
  800f28:	89 c1                	mov    %eax,%ecx
  800f2a:	48 ba b2 6a 80 00 00 	movabs $0x806ab2,%rdx
  800f31:	00 00 00 
  800f34:	be 98 01 00 00       	mov    $0x198,%esi
  800f39:	48 bf d7 6a 80 00 00 	movabs $0x806ad7,%rdi
  800f40:	00 00 00 
  800f43:	b8 00 00 00 00       	mov    $0x0,%eax
  800f48:	49 b8 32 13 80 00 00 	movabs $0x801332,%r8
  800f4f:	00 00 00 
  800f52:	41 ff d0             	callq  *%r8
  800f55:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  800f5c:	00 00 00 
  800f5f:	8b 00                	mov    (%rax),%eax
  800f61:	85 c0                	test   %eax,%eax
  800f63:	74 20                	je     800f85 <umain+0x436>
  800f65:	8b 45 f0             	mov    -0x10(%rbp),%eax
  800f68:	89 c6                	mov    %eax,%esi
  800f6a:	48 bf 60 6c 80 00 00 	movabs $0x806c60,%rdi
  800f71:	00 00 00 
  800f74:	b8 00 00 00 00       	mov    $0x0,%eax
  800f79:	48 ba 6b 15 80 00 00 	movabs $0x80156b,%rdx
  800f80:	00 00 00 
  800f83:	ff d2                	callq  *%rdx
  800f85:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  800f89:	75 21                	jne    800fac <umain+0x45d>
  800f8b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f8f:	48 89 c7             	mov    %rax,%rdi
  800f92:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800f99:	00 00 00 
  800f9c:	ff d0                	callq  *%rax
  800f9e:	48 b8 0f 13 80 00 00 	movabs $0x80130f,%rax
  800fa5:	00 00 00 
  800fa8:	ff d0                	callq  *%rax
  800faa:	eb 28                	jmp    800fd4 <umain+0x485>
  800fac:	8b 45 f0             	mov    -0x10(%rbp),%eax
  800faf:	89 c7                	mov    %eax,%edi
  800fb1:	48 b8 ef 65 80 00 00 	movabs $0x8065ef,%rax
  800fb8:	00 00 00 
  800fbb:	ff d0                	callq  *%rax
  800fbd:	80 7d f7 00          	cmpb   $0x0,-0x9(%rbp)
  800fc1:	74 11                	je     800fd4 <umain+0x485>
  800fc3:	48 b8 0f 13 80 00 00 	movabs $0x80130f,%rax
  800fca:	00 00 00 
  800fcd:	ff d0                	callq  *%rax
  800fcf:	e9 ed fd ff ff       	jmpq   800dc1 <umain+0x272>
  800fd4:	e9 e8 fd ff ff       	jmpq   800dc1 <umain+0x272>

0000000000800fd9 <cputchar>:
  800fd9:	55                   	push   %rbp
  800fda:	48 89 e5             	mov    %rsp,%rbp
  800fdd:	48 83 ec 20          	sub    $0x20,%rsp
  800fe1:	89 7d ec             	mov    %edi,-0x14(%rbp)
  800fe4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  800fe7:	88 45 ff             	mov    %al,-0x1(%rbp)
  800fea:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  800fee:	be 01 00 00 00       	mov    $0x1,%esi
  800ff3:	48 89 c7             	mov    %rax,%rdi
  800ff6:	48 b8 61 2a 80 00 00 	movabs $0x802a61,%rax
  800ffd:	00 00 00 
  801000:	ff d0                	callq  *%rax
  801002:	c9                   	leaveq 
  801003:	c3                   	retq   

0000000000801004 <getchar>:
  801004:	55                   	push   %rbp
  801005:	48 89 e5             	mov    %rsp,%rbp
  801008:	48 83 ec 10          	sub    $0x10,%rsp
  80100c:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  801010:	ba 01 00 00 00       	mov    $0x1,%edx
  801015:	48 89 c6             	mov    %rax,%rsi
  801018:	bf 00 00 00 00       	mov    $0x0,%edi
  80101d:	48 b8 99 3e 80 00 00 	movabs $0x803e99,%rax
  801024:	00 00 00 
  801027:	ff d0                	callq  *%rax
  801029:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80102c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801030:	79 05                	jns    801037 <getchar+0x33>
  801032:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801035:	eb 14                	jmp    80104b <getchar+0x47>
  801037:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80103b:	7f 07                	jg     801044 <getchar+0x40>
  80103d:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  801042:	eb 07                	jmp    80104b <getchar+0x47>
  801044:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  801048:	0f b6 c0             	movzbl %al,%eax
  80104b:	c9                   	leaveq 
  80104c:	c3                   	retq   

000000000080104d <iscons>:
  80104d:	55                   	push   %rbp
  80104e:	48 89 e5             	mov    %rsp,%rbp
  801051:	48 83 ec 20          	sub    $0x20,%rsp
  801055:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801058:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80105c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80105f:	48 89 d6             	mov    %rdx,%rsi
  801062:	89 c7                	mov    %eax,%edi
  801064:	48 b8 67 3a 80 00 00 	movabs $0x803a67,%rax
  80106b:	00 00 00 
  80106e:	ff d0                	callq  *%rax
  801070:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801073:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801077:	79 05                	jns    80107e <iscons+0x31>
  801079:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80107c:	eb 1a                	jmp    801098 <iscons+0x4b>
  80107e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801082:	8b 10                	mov    (%rax),%edx
  801084:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  80108b:	00 00 00 
  80108e:	8b 00                	mov    (%rax),%eax
  801090:	39 c2                	cmp    %eax,%edx
  801092:	0f 94 c0             	sete   %al
  801095:	0f b6 c0             	movzbl %al,%eax
  801098:	c9                   	leaveq 
  801099:	c3                   	retq   

000000000080109a <opencons>:
  80109a:	55                   	push   %rbp
  80109b:	48 89 e5             	mov    %rsp,%rbp
  80109e:	48 83 ec 10          	sub    $0x10,%rsp
  8010a2:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8010a6:	48 89 c7             	mov    %rax,%rdi
  8010a9:	48 b8 cf 39 80 00 00 	movabs $0x8039cf,%rax
  8010b0:	00 00 00 
  8010b3:	ff d0                	callq  *%rax
  8010b5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8010b8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8010bc:	79 05                	jns    8010c3 <opencons+0x29>
  8010be:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8010c1:	eb 5b                	jmp    80111e <opencons+0x84>
  8010c3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8010c7:	ba 07 04 00 00       	mov    $0x407,%edx
  8010cc:	48 89 c6             	mov    %rax,%rsi
  8010cf:	bf 00 00 00 00       	mov    $0x0,%edi
  8010d4:	48 b8 a9 2b 80 00 00 	movabs $0x802ba9,%rax
  8010db:	00 00 00 
  8010de:	ff d0                	callq  *%rax
  8010e0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8010e3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8010e7:	79 05                	jns    8010ee <opencons+0x54>
  8010e9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8010ec:	eb 30                	jmp    80111e <opencons+0x84>
  8010ee:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8010f2:	48 ba 20 90 80 00 00 	movabs $0x809020,%rdx
  8010f9:	00 00 00 
  8010fc:	8b 12                	mov    (%rdx),%edx
  8010fe:	89 10                	mov    %edx,(%rax)
  801100:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801104:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  80110b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80110f:	48 89 c7             	mov    %rax,%rdi
  801112:	48 b8 81 39 80 00 00 	movabs $0x803981,%rax
  801119:	00 00 00 
  80111c:	ff d0                	callq  *%rax
  80111e:	c9                   	leaveq 
  80111f:	c3                   	retq   

0000000000801120 <devcons_read>:
  801120:	55                   	push   %rbp
  801121:	48 89 e5             	mov    %rsp,%rbp
  801124:	48 83 ec 30          	sub    $0x30,%rsp
  801128:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80112c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801130:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801134:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801139:	75 07                	jne    801142 <devcons_read+0x22>
  80113b:	b8 00 00 00 00       	mov    $0x0,%eax
  801140:	eb 4b                	jmp    80118d <devcons_read+0x6d>
  801142:	eb 0c                	jmp    801150 <devcons_read+0x30>
  801144:	48 b8 6b 2b 80 00 00 	movabs $0x802b6b,%rax
  80114b:	00 00 00 
  80114e:	ff d0                	callq  *%rax
  801150:	48 b8 ab 2a 80 00 00 	movabs $0x802aab,%rax
  801157:	00 00 00 
  80115a:	ff d0                	callq  *%rax
  80115c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80115f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801163:	74 df                	je     801144 <devcons_read+0x24>
  801165:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801169:	79 05                	jns    801170 <devcons_read+0x50>
  80116b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80116e:	eb 1d                	jmp    80118d <devcons_read+0x6d>
  801170:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  801174:	75 07                	jne    80117d <devcons_read+0x5d>
  801176:	b8 00 00 00 00       	mov    $0x0,%eax
  80117b:	eb 10                	jmp    80118d <devcons_read+0x6d>
  80117d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801180:	89 c2                	mov    %eax,%edx
  801182:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801186:	88 10                	mov    %dl,(%rax)
  801188:	b8 01 00 00 00       	mov    $0x1,%eax
  80118d:	c9                   	leaveq 
  80118e:	c3                   	retq   

000000000080118f <devcons_write>:
  80118f:	55                   	push   %rbp
  801190:	48 89 e5             	mov    %rsp,%rbp
  801193:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  80119a:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  8011a1:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  8011a8:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  8011af:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8011b6:	eb 76                	jmp    80122e <devcons_write+0x9f>
  8011b8:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  8011bf:	89 c2                	mov    %eax,%edx
  8011c1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8011c4:	29 c2                	sub    %eax,%edx
  8011c6:	89 d0                	mov    %edx,%eax
  8011c8:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8011cb:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8011ce:	83 f8 7f             	cmp    $0x7f,%eax
  8011d1:	76 07                	jbe    8011da <devcons_write+0x4b>
  8011d3:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  8011da:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8011dd:	48 63 d0             	movslq %eax,%rdx
  8011e0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8011e3:	48 63 c8             	movslq %eax,%rcx
  8011e6:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  8011ed:	48 01 c1             	add    %rax,%rcx
  8011f0:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  8011f7:	48 89 ce             	mov    %rcx,%rsi
  8011fa:	48 89 c7             	mov    %rax,%rdi
  8011fd:	48 b8 9e 25 80 00 00 	movabs $0x80259e,%rax
  801204:	00 00 00 
  801207:	ff d0                	callq  *%rax
  801209:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80120c:	48 63 d0             	movslq %eax,%rdx
  80120f:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  801216:	48 89 d6             	mov    %rdx,%rsi
  801219:	48 89 c7             	mov    %rax,%rdi
  80121c:	48 b8 61 2a 80 00 00 	movabs $0x802a61,%rax
  801223:	00 00 00 
  801226:	ff d0                	callq  *%rax
  801228:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80122b:	01 45 fc             	add    %eax,-0x4(%rbp)
  80122e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801231:	48 98                	cltq   
  801233:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  80123a:	0f 82 78 ff ff ff    	jb     8011b8 <devcons_write+0x29>
  801240:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801243:	c9                   	leaveq 
  801244:	c3                   	retq   

0000000000801245 <devcons_close>:
  801245:	55                   	push   %rbp
  801246:	48 89 e5             	mov    %rsp,%rbp
  801249:	48 83 ec 08          	sub    $0x8,%rsp
  80124d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801251:	b8 00 00 00 00       	mov    $0x0,%eax
  801256:	c9                   	leaveq 
  801257:	c3                   	retq   

0000000000801258 <devcons_stat>:
  801258:	55                   	push   %rbp
  801259:	48 89 e5             	mov    %rsp,%rbp
  80125c:	48 83 ec 10          	sub    $0x10,%rsp
  801260:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801264:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801268:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80126c:	48 be 6f 6c 80 00 00 	movabs $0x806c6f,%rsi
  801273:	00 00 00 
  801276:	48 89 c7             	mov    %rax,%rdi
  801279:	48 b8 7a 22 80 00 00 	movabs $0x80227a,%rax
  801280:	00 00 00 
  801283:	ff d0                	callq  *%rax
  801285:	b8 00 00 00 00       	mov    $0x0,%eax
  80128a:	c9                   	leaveq 
  80128b:	c3                   	retq   

000000000080128c <libmain>:
  80128c:	55                   	push   %rbp
  80128d:	48 89 e5             	mov    %rsp,%rbp
  801290:	48 83 ec 10          	sub    $0x10,%rsp
  801294:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801297:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80129b:	48 b8 2d 2b 80 00 00 	movabs $0x802b2d,%rax
  8012a2:	00 00 00 
  8012a5:	ff d0                	callq  *%rax
  8012a7:	25 ff 03 00 00       	and    $0x3ff,%eax
  8012ac:	48 98                	cltq   
  8012ae:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8012b5:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8012bc:	00 00 00 
  8012bf:	48 01 c2             	add    %rax,%rdx
  8012c2:	48 b8 28 a4 80 00 00 	movabs $0x80a428,%rax
  8012c9:	00 00 00 
  8012cc:	48 89 10             	mov    %rdx,(%rax)
  8012cf:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8012d3:	7e 14                	jle    8012e9 <libmain+0x5d>
  8012d5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012d9:	48 8b 10             	mov    (%rax),%rdx
  8012dc:	48 b8 58 90 80 00 00 	movabs $0x809058,%rax
  8012e3:	00 00 00 
  8012e6:	48 89 10             	mov    %rdx,(%rax)
  8012e9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8012ed:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8012f0:	48 89 d6             	mov    %rdx,%rsi
  8012f3:	89 c7                	mov    %eax,%edi
  8012f5:	48 b8 4f 0b 80 00 00 	movabs $0x800b4f,%rax
  8012fc:	00 00 00 
  8012ff:	ff d0                	callq  *%rax
  801301:	48 b8 0f 13 80 00 00 	movabs $0x80130f,%rax
  801308:	00 00 00 
  80130b:	ff d0                	callq  *%rax
  80130d:	c9                   	leaveq 
  80130e:	c3                   	retq   

000000000080130f <exit>:
  80130f:	55                   	push   %rbp
  801310:	48 89 e5             	mov    %rsp,%rbp
  801313:	48 b8 c2 3c 80 00 00 	movabs $0x803cc2,%rax
  80131a:	00 00 00 
  80131d:	ff d0                	callq  *%rax
  80131f:	bf 00 00 00 00       	mov    $0x0,%edi
  801324:	48 b8 e9 2a 80 00 00 	movabs $0x802ae9,%rax
  80132b:	00 00 00 
  80132e:	ff d0                	callq  *%rax
  801330:	5d                   	pop    %rbp
  801331:	c3                   	retq   

0000000000801332 <_panic>:
  801332:	55                   	push   %rbp
  801333:	48 89 e5             	mov    %rsp,%rbp
  801336:	53                   	push   %rbx
  801337:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  80133e:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  801345:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  80134b:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  801352:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  801359:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  801360:	84 c0                	test   %al,%al
  801362:	74 23                	je     801387 <_panic+0x55>
  801364:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  80136b:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  80136f:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  801373:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  801377:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  80137b:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  80137f:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  801383:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  801387:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  80138e:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  801395:	00 00 00 
  801398:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  80139f:	00 00 00 
  8013a2:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8013a6:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  8013ad:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  8013b4:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8013bb:	48 b8 58 90 80 00 00 	movabs $0x809058,%rax
  8013c2:	00 00 00 
  8013c5:	48 8b 18             	mov    (%rax),%rbx
  8013c8:	48 b8 2d 2b 80 00 00 	movabs $0x802b2d,%rax
  8013cf:	00 00 00 
  8013d2:	ff d0                	callq  *%rax
  8013d4:	8b 8d 14 ff ff ff    	mov    -0xec(%rbp),%ecx
  8013da:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  8013e1:	41 89 c8             	mov    %ecx,%r8d
  8013e4:	48 89 d1             	mov    %rdx,%rcx
  8013e7:	48 89 da             	mov    %rbx,%rdx
  8013ea:	89 c6                	mov    %eax,%esi
  8013ec:	48 bf 80 6c 80 00 00 	movabs $0x806c80,%rdi
  8013f3:	00 00 00 
  8013f6:	b8 00 00 00 00       	mov    $0x0,%eax
  8013fb:	49 b9 6b 15 80 00 00 	movabs $0x80156b,%r9
  801402:	00 00 00 
  801405:	41 ff d1             	callq  *%r9
  801408:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  80140f:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  801416:	48 89 d6             	mov    %rdx,%rsi
  801419:	48 89 c7             	mov    %rax,%rdi
  80141c:	48 b8 bf 14 80 00 00 	movabs $0x8014bf,%rax
  801423:	00 00 00 
  801426:	ff d0                	callq  *%rax
  801428:	48 bf a3 6c 80 00 00 	movabs $0x806ca3,%rdi
  80142f:	00 00 00 
  801432:	b8 00 00 00 00       	mov    $0x0,%eax
  801437:	48 ba 6b 15 80 00 00 	movabs $0x80156b,%rdx
  80143e:	00 00 00 
  801441:	ff d2                	callq  *%rdx
  801443:	cc                   	int3   
  801444:	eb fd                	jmp    801443 <_panic+0x111>

0000000000801446 <putch>:
  801446:	55                   	push   %rbp
  801447:	48 89 e5             	mov    %rsp,%rbp
  80144a:	48 83 ec 10          	sub    $0x10,%rsp
  80144e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801451:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801455:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801459:	8b 00                	mov    (%rax),%eax
  80145b:	8d 48 01             	lea    0x1(%rax),%ecx
  80145e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801462:	89 0a                	mov    %ecx,(%rdx)
  801464:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801467:	89 d1                	mov    %edx,%ecx
  801469:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80146d:	48 98                	cltq   
  80146f:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  801473:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801477:	8b 00                	mov    (%rax),%eax
  801479:	3d ff 00 00 00       	cmp    $0xff,%eax
  80147e:	75 2c                	jne    8014ac <putch+0x66>
  801480:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801484:	8b 00                	mov    (%rax),%eax
  801486:	48 98                	cltq   
  801488:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80148c:	48 83 c2 08          	add    $0x8,%rdx
  801490:	48 89 c6             	mov    %rax,%rsi
  801493:	48 89 d7             	mov    %rdx,%rdi
  801496:	48 b8 61 2a 80 00 00 	movabs $0x802a61,%rax
  80149d:	00 00 00 
  8014a0:	ff d0                	callq  *%rax
  8014a2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014a6:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8014ac:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014b0:	8b 40 04             	mov    0x4(%rax),%eax
  8014b3:	8d 50 01             	lea    0x1(%rax),%edx
  8014b6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014ba:	89 50 04             	mov    %edx,0x4(%rax)
  8014bd:	c9                   	leaveq 
  8014be:	c3                   	retq   

00000000008014bf <vcprintf>:
  8014bf:	55                   	push   %rbp
  8014c0:	48 89 e5             	mov    %rsp,%rbp
  8014c3:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  8014ca:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  8014d1:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  8014d8:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  8014df:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  8014e6:	48 8b 0a             	mov    (%rdx),%rcx
  8014e9:	48 89 08             	mov    %rcx,(%rax)
  8014ec:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8014f0:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8014f4:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8014f8:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8014fc:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  801503:	00 00 00 
  801506:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  80150d:	00 00 00 
  801510:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  801517:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  80151e:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  801525:	48 89 c6             	mov    %rax,%rsi
  801528:	48 bf 46 14 80 00 00 	movabs $0x801446,%rdi
  80152f:	00 00 00 
  801532:	48 b8 1e 19 80 00 00 	movabs $0x80191e,%rax
  801539:	00 00 00 
  80153c:	ff d0                	callq  *%rax
  80153e:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  801544:	48 98                	cltq   
  801546:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  80154d:	48 83 c2 08          	add    $0x8,%rdx
  801551:	48 89 c6             	mov    %rax,%rsi
  801554:	48 89 d7             	mov    %rdx,%rdi
  801557:	48 b8 61 2a 80 00 00 	movabs $0x802a61,%rax
  80155e:	00 00 00 
  801561:	ff d0                	callq  *%rax
  801563:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  801569:	c9                   	leaveq 
  80156a:	c3                   	retq   

000000000080156b <cprintf>:
  80156b:	55                   	push   %rbp
  80156c:	48 89 e5             	mov    %rsp,%rbp
  80156f:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  801576:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  80157d:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  801584:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  80158b:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  801592:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  801599:	84 c0                	test   %al,%al
  80159b:	74 20                	je     8015bd <cprintf+0x52>
  80159d:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8015a1:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8015a5:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8015a9:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8015ad:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8015b1:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8015b5:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8015b9:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8015bd:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  8015c4:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  8015cb:	00 00 00 
  8015ce:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8015d5:	00 00 00 
  8015d8:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8015dc:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8015e3:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8015ea:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8015f1:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  8015f8:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8015ff:	48 8b 0a             	mov    (%rdx),%rcx
  801602:	48 89 08             	mov    %rcx,(%rax)
  801605:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  801609:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80160d:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801611:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801615:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  80161c:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  801623:	48 89 d6             	mov    %rdx,%rsi
  801626:	48 89 c7             	mov    %rax,%rdi
  801629:	48 b8 bf 14 80 00 00 	movabs $0x8014bf,%rax
  801630:	00 00 00 
  801633:	ff d0                	callq  *%rax
  801635:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  80163b:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  801641:	c9                   	leaveq 
  801642:	c3                   	retq   

0000000000801643 <printnum>:
  801643:	55                   	push   %rbp
  801644:	48 89 e5             	mov    %rsp,%rbp
  801647:	53                   	push   %rbx
  801648:	48 83 ec 38          	sub    $0x38,%rsp
  80164c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801650:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801654:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801658:	89 4d d4             	mov    %ecx,-0x2c(%rbp)
  80165b:	44 89 45 d0          	mov    %r8d,-0x30(%rbp)
  80165f:	44 89 4d cc          	mov    %r9d,-0x34(%rbp)
  801663:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  801666:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  80166a:	77 3b                	ja     8016a7 <printnum+0x64>
  80166c:	8b 45 d0             	mov    -0x30(%rbp),%eax
  80166f:	44 8d 40 ff          	lea    -0x1(%rax),%r8d
  801673:	8b 5d d4             	mov    -0x2c(%rbp),%ebx
  801676:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80167a:	ba 00 00 00 00       	mov    $0x0,%edx
  80167f:	48 f7 f3             	div    %rbx
  801682:	48 89 c2             	mov    %rax,%rdx
  801685:	8b 7d cc             	mov    -0x34(%rbp),%edi
  801688:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  80168b:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
  80168f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801693:	41 89 f9             	mov    %edi,%r9d
  801696:	48 89 c7             	mov    %rax,%rdi
  801699:	48 b8 43 16 80 00 00 	movabs $0x801643,%rax
  8016a0:	00 00 00 
  8016a3:	ff d0                	callq  *%rax
  8016a5:	eb 1e                	jmp    8016c5 <printnum+0x82>
  8016a7:	eb 12                	jmp    8016bb <printnum+0x78>
  8016a9:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8016ad:	8b 55 cc             	mov    -0x34(%rbp),%edx
  8016b0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8016b4:	48 89 ce             	mov    %rcx,%rsi
  8016b7:	89 d7                	mov    %edx,%edi
  8016b9:	ff d0                	callq  *%rax
  8016bb:	83 6d d0 01          	subl   $0x1,-0x30(%rbp)
  8016bf:	83 7d d0 00          	cmpl   $0x0,-0x30(%rbp)
  8016c3:	7f e4                	jg     8016a9 <printnum+0x66>
  8016c5:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  8016c8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016cc:	ba 00 00 00 00       	mov    $0x0,%edx
  8016d1:	48 f7 f1             	div    %rcx
  8016d4:	48 89 d0             	mov    %rdx,%rax
  8016d7:	48 ba b0 6e 80 00 00 	movabs $0x806eb0,%rdx
  8016de:	00 00 00 
  8016e1:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
  8016e5:	0f be d0             	movsbl %al,%edx
  8016e8:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8016ec:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8016f0:	48 89 ce             	mov    %rcx,%rsi
  8016f3:	89 d7                	mov    %edx,%edi
  8016f5:	ff d0                	callq  *%rax
  8016f7:	48 83 c4 38          	add    $0x38,%rsp
  8016fb:	5b                   	pop    %rbx
  8016fc:	5d                   	pop    %rbp
  8016fd:	c3                   	retq   

00000000008016fe <getuint>:
  8016fe:	55                   	push   %rbp
  8016ff:	48 89 e5             	mov    %rsp,%rbp
  801702:	48 83 ec 1c          	sub    $0x1c,%rsp
  801706:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80170a:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80170d:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  801711:	7e 52                	jle    801765 <getuint+0x67>
  801713:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801717:	8b 00                	mov    (%rax),%eax
  801719:	83 f8 30             	cmp    $0x30,%eax
  80171c:	73 24                	jae    801742 <getuint+0x44>
  80171e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801722:	48 8b 50 10          	mov    0x10(%rax),%rdx
  801726:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80172a:	8b 00                	mov    (%rax),%eax
  80172c:	89 c0                	mov    %eax,%eax
  80172e:	48 01 d0             	add    %rdx,%rax
  801731:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801735:	8b 12                	mov    (%rdx),%edx
  801737:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80173a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80173e:	89 0a                	mov    %ecx,(%rdx)
  801740:	eb 17                	jmp    801759 <getuint+0x5b>
  801742:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801746:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80174a:	48 89 d0             	mov    %rdx,%rax
  80174d:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  801751:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801755:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  801759:	48 8b 00             	mov    (%rax),%rax
  80175c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801760:	e9 a3 00 00 00       	jmpq   801808 <getuint+0x10a>
  801765:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  801769:	74 4f                	je     8017ba <getuint+0xbc>
  80176b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80176f:	8b 00                	mov    (%rax),%eax
  801771:	83 f8 30             	cmp    $0x30,%eax
  801774:	73 24                	jae    80179a <getuint+0x9c>
  801776:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80177a:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80177e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801782:	8b 00                	mov    (%rax),%eax
  801784:	89 c0                	mov    %eax,%eax
  801786:	48 01 d0             	add    %rdx,%rax
  801789:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80178d:	8b 12                	mov    (%rdx),%edx
  80178f:	8d 4a 08             	lea    0x8(%rdx),%ecx
  801792:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801796:	89 0a                	mov    %ecx,(%rdx)
  801798:	eb 17                	jmp    8017b1 <getuint+0xb3>
  80179a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80179e:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8017a2:	48 89 d0             	mov    %rdx,%rax
  8017a5:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8017a9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8017ad:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8017b1:	48 8b 00             	mov    (%rax),%rax
  8017b4:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8017b8:	eb 4e                	jmp    801808 <getuint+0x10a>
  8017ba:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8017be:	8b 00                	mov    (%rax),%eax
  8017c0:	83 f8 30             	cmp    $0x30,%eax
  8017c3:	73 24                	jae    8017e9 <getuint+0xeb>
  8017c5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8017c9:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8017cd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8017d1:	8b 00                	mov    (%rax),%eax
  8017d3:	89 c0                	mov    %eax,%eax
  8017d5:	48 01 d0             	add    %rdx,%rax
  8017d8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8017dc:	8b 12                	mov    (%rdx),%edx
  8017de:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8017e1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8017e5:	89 0a                	mov    %ecx,(%rdx)
  8017e7:	eb 17                	jmp    801800 <getuint+0x102>
  8017e9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8017ed:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8017f1:	48 89 d0             	mov    %rdx,%rax
  8017f4:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8017f8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8017fc:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  801800:	8b 00                	mov    (%rax),%eax
  801802:	89 c0                	mov    %eax,%eax
  801804:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801808:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80180c:	c9                   	leaveq 
  80180d:	c3                   	retq   

000000000080180e <getint>:
  80180e:	55                   	push   %rbp
  80180f:	48 89 e5             	mov    %rsp,%rbp
  801812:	48 83 ec 1c          	sub    $0x1c,%rsp
  801816:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80181a:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80181d:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  801821:	7e 52                	jle    801875 <getint+0x67>
  801823:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801827:	8b 00                	mov    (%rax),%eax
  801829:	83 f8 30             	cmp    $0x30,%eax
  80182c:	73 24                	jae    801852 <getint+0x44>
  80182e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801832:	48 8b 50 10          	mov    0x10(%rax),%rdx
  801836:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80183a:	8b 00                	mov    (%rax),%eax
  80183c:	89 c0                	mov    %eax,%eax
  80183e:	48 01 d0             	add    %rdx,%rax
  801841:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801845:	8b 12                	mov    (%rdx),%edx
  801847:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80184a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80184e:	89 0a                	mov    %ecx,(%rdx)
  801850:	eb 17                	jmp    801869 <getint+0x5b>
  801852:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801856:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80185a:	48 89 d0             	mov    %rdx,%rax
  80185d:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  801861:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801865:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  801869:	48 8b 00             	mov    (%rax),%rax
  80186c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801870:	e9 a3 00 00 00       	jmpq   801918 <getint+0x10a>
  801875:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  801879:	74 4f                	je     8018ca <getint+0xbc>
  80187b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80187f:	8b 00                	mov    (%rax),%eax
  801881:	83 f8 30             	cmp    $0x30,%eax
  801884:	73 24                	jae    8018aa <getint+0x9c>
  801886:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80188a:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80188e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801892:	8b 00                	mov    (%rax),%eax
  801894:	89 c0                	mov    %eax,%eax
  801896:	48 01 d0             	add    %rdx,%rax
  801899:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80189d:	8b 12                	mov    (%rdx),%edx
  80189f:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8018a2:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8018a6:	89 0a                	mov    %ecx,(%rdx)
  8018a8:	eb 17                	jmp    8018c1 <getint+0xb3>
  8018aa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8018ae:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8018b2:	48 89 d0             	mov    %rdx,%rax
  8018b5:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8018b9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8018bd:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8018c1:	48 8b 00             	mov    (%rax),%rax
  8018c4:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8018c8:	eb 4e                	jmp    801918 <getint+0x10a>
  8018ca:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8018ce:	8b 00                	mov    (%rax),%eax
  8018d0:	83 f8 30             	cmp    $0x30,%eax
  8018d3:	73 24                	jae    8018f9 <getint+0xeb>
  8018d5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8018d9:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8018dd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8018e1:	8b 00                	mov    (%rax),%eax
  8018e3:	89 c0                	mov    %eax,%eax
  8018e5:	48 01 d0             	add    %rdx,%rax
  8018e8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8018ec:	8b 12                	mov    (%rdx),%edx
  8018ee:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8018f1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8018f5:	89 0a                	mov    %ecx,(%rdx)
  8018f7:	eb 17                	jmp    801910 <getint+0x102>
  8018f9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8018fd:	48 8b 50 08          	mov    0x8(%rax),%rdx
  801901:	48 89 d0             	mov    %rdx,%rax
  801904:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  801908:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80190c:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  801910:	8b 00                	mov    (%rax),%eax
  801912:	48 98                	cltq   
  801914:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801918:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80191c:	c9                   	leaveq 
  80191d:	c3                   	retq   

000000000080191e <vprintfmt>:
  80191e:	55                   	push   %rbp
  80191f:	48 89 e5             	mov    %rsp,%rbp
  801922:	41 54                	push   %r12
  801924:	53                   	push   %rbx
  801925:	48 83 ec 60          	sub    $0x60,%rsp
  801929:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  80192d:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  801931:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  801935:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  801939:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  80193d:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  801941:	48 8b 0a             	mov    (%rdx),%rcx
  801944:	48 89 08             	mov    %rcx,(%rax)
  801947:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80194b:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80194f:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801953:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801957:	eb 17                	jmp    801970 <vprintfmt+0x52>
  801959:	85 db                	test   %ebx,%ebx
  80195b:	0f 84 cc 04 00 00    	je     801e2d <vprintfmt+0x50f>
  801961:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801965:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801969:	48 89 d6             	mov    %rdx,%rsi
  80196c:	89 df                	mov    %ebx,%edi
  80196e:	ff d0                	callq  *%rax
  801970:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  801974:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801978:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  80197c:	0f b6 00             	movzbl (%rax),%eax
  80197f:	0f b6 d8             	movzbl %al,%ebx
  801982:	83 fb 25             	cmp    $0x25,%ebx
  801985:	75 d2                	jne    801959 <vprintfmt+0x3b>
  801987:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  80198b:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  801992:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  801999:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  8019a0:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  8019a7:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8019ab:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8019af:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8019b3:	0f b6 00             	movzbl (%rax),%eax
  8019b6:	0f b6 d8             	movzbl %al,%ebx
  8019b9:	8d 43 dd             	lea    -0x23(%rbx),%eax
  8019bc:	83 f8 55             	cmp    $0x55,%eax
  8019bf:	0f 87 34 04 00 00    	ja     801df9 <vprintfmt+0x4db>
  8019c5:	89 c0                	mov    %eax,%eax
  8019c7:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8019ce:	00 
  8019cf:	48 b8 d8 6e 80 00 00 	movabs $0x806ed8,%rax
  8019d6:	00 00 00 
  8019d9:	48 01 d0             	add    %rdx,%rax
  8019dc:	48 8b 00             	mov    (%rax),%rax
  8019df:	ff e0                	jmpq   *%rax
  8019e1:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  8019e5:	eb c0                	jmp    8019a7 <vprintfmt+0x89>
  8019e7:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  8019eb:	eb ba                	jmp    8019a7 <vprintfmt+0x89>
  8019ed:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  8019f4:	8b 55 d8             	mov    -0x28(%rbp),%edx
  8019f7:	89 d0                	mov    %edx,%eax
  8019f9:	c1 e0 02             	shl    $0x2,%eax
  8019fc:	01 d0                	add    %edx,%eax
  8019fe:	01 c0                	add    %eax,%eax
  801a00:	01 d8                	add    %ebx,%eax
  801a02:	83 e8 30             	sub    $0x30,%eax
  801a05:	89 45 d8             	mov    %eax,-0x28(%rbp)
  801a08:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  801a0c:	0f b6 00             	movzbl (%rax),%eax
  801a0f:	0f be d8             	movsbl %al,%ebx
  801a12:	83 fb 2f             	cmp    $0x2f,%ebx
  801a15:	7e 0c                	jle    801a23 <vprintfmt+0x105>
  801a17:	83 fb 39             	cmp    $0x39,%ebx
  801a1a:	7f 07                	jg     801a23 <vprintfmt+0x105>
  801a1c:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  801a21:	eb d1                	jmp    8019f4 <vprintfmt+0xd6>
  801a23:	eb 58                	jmp    801a7d <vprintfmt+0x15f>
  801a25:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801a28:	83 f8 30             	cmp    $0x30,%eax
  801a2b:	73 17                	jae    801a44 <vprintfmt+0x126>
  801a2d:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  801a31:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801a34:	89 c0                	mov    %eax,%eax
  801a36:	48 01 d0             	add    %rdx,%rax
  801a39:	8b 55 b8             	mov    -0x48(%rbp),%edx
  801a3c:	83 c2 08             	add    $0x8,%edx
  801a3f:	89 55 b8             	mov    %edx,-0x48(%rbp)
  801a42:	eb 0f                	jmp    801a53 <vprintfmt+0x135>
  801a44:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  801a48:	48 89 d0             	mov    %rdx,%rax
  801a4b:	48 83 c2 08          	add    $0x8,%rdx
  801a4f:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  801a53:	8b 00                	mov    (%rax),%eax
  801a55:	89 45 d8             	mov    %eax,-0x28(%rbp)
  801a58:	eb 23                	jmp    801a7d <vprintfmt+0x15f>
  801a5a:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  801a5e:	79 0c                	jns    801a6c <vprintfmt+0x14e>
  801a60:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  801a67:	e9 3b ff ff ff       	jmpq   8019a7 <vprintfmt+0x89>
  801a6c:	e9 36 ff ff ff       	jmpq   8019a7 <vprintfmt+0x89>
  801a71:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  801a78:	e9 2a ff ff ff       	jmpq   8019a7 <vprintfmt+0x89>
  801a7d:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  801a81:	79 12                	jns    801a95 <vprintfmt+0x177>
  801a83:	8b 45 d8             	mov    -0x28(%rbp),%eax
  801a86:	89 45 dc             	mov    %eax,-0x24(%rbp)
  801a89:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  801a90:	e9 12 ff ff ff       	jmpq   8019a7 <vprintfmt+0x89>
  801a95:	e9 0d ff ff ff       	jmpq   8019a7 <vprintfmt+0x89>
  801a9a:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  801a9e:	e9 04 ff ff ff       	jmpq   8019a7 <vprintfmt+0x89>
  801aa3:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801aa6:	83 f8 30             	cmp    $0x30,%eax
  801aa9:	73 17                	jae    801ac2 <vprintfmt+0x1a4>
  801aab:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  801aaf:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801ab2:	89 c0                	mov    %eax,%eax
  801ab4:	48 01 d0             	add    %rdx,%rax
  801ab7:	8b 55 b8             	mov    -0x48(%rbp),%edx
  801aba:	83 c2 08             	add    $0x8,%edx
  801abd:	89 55 b8             	mov    %edx,-0x48(%rbp)
  801ac0:	eb 0f                	jmp    801ad1 <vprintfmt+0x1b3>
  801ac2:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  801ac6:	48 89 d0             	mov    %rdx,%rax
  801ac9:	48 83 c2 08          	add    $0x8,%rdx
  801acd:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  801ad1:	8b 10                	mov    (%rax),%edx
  801ad3:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  801ad7:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801adb:	48 89 ce             	mov    %rcx,%rsi
  801ade:	89 d7                	mov    %edx,%edi
  801ae0:	ff d0                	callq  *%rax
  801ae2:	e9 40 03 00 00       	jmpq   801e27 <vprintfmt+0x509>
  801ae7:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801aea:	83 f8 30             	cmp    $0x30,%eax
  801aed:	73 17                	jae    801b06 <vprintfmt+0x1e8>
  801aef:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  801af3:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801af6:	89 c0                	mov    %eax,%eax
  801af8:	48 01 d0             	add    %rdx,%rax
  801afb:	8b 55 b8             	mov    -0x48(%rbp),%edx
  801afe:	83 c2 08             	add    $0x8,%edx
  801b01:	89 55 b8             	mov    %edx,-0x48(%rbp)
  801b04:	eb 0f                	jmp    801b15 <vprintfmt+0x1f7>
  801b06:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  801b0a:	48 89 d0             	mov    %rdx,%rax
  801b0d:	48 83 c2 08          	add    $0x8,%rdx
  801b11:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  801b15:	8b 18                	mov    (%rax),%ebx
  801b17:	85 db                	test   %ebx,%ebx
  801b19:	79 02                	jns    801b1d <vprintfmt+0x1ff>
  801b1b:	f7 db                	neg    %ebx
  801b1d:	83 fb 15             	cmp    $0x15,%ebx
  801b20:	7f 16                	jg     801b38 <vprintfmt+0x21a>
  801b22:	48 b8 00 6e 80 00 00 	movabs $0x806e00,%rax
  801b29:	00 00 00 
  801b2c:	48 63 d3             	movslq %ebx,%rdx
  801b2f:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  801b33:	4d 85 e4             	test   %r12,%r12
  801b36:	75 2e                	jne    801b66 <vprintfmt+0x248>
  801b38:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  801b3c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801b40:	89 d9                	mov    %ebx,%ecx
  801b42:	48 ba c1 6e 80 00 00 	movabs $0x806ec1,%rdx
  801b49:	00 00 00 
  801b4c:	48 89 c7             	mov    %rax,%rdi
  801b4f:	b8 00 00 00 00       	mov    $0x0,%eax
  801b54:	49 b8 36 1e 80 00 00 	movabs $0x801e36,%r8
  801b5b:	00 00 00 
  801b5e:	41 ff d0             	callq  *%r8
  801b61:	e9 c1 02 00 00       	jmpq   801e27 <vprintfmt+0x509>
  801b66:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  801b6a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801b6e:	4c 89 e1             	mov    %r12,%rcx
  801b71:	48 ba ca 6e 80 00 00 	movabs $0x806eca,%rdx
  801b78:	00 00 00 
  801b7b:	48 89 c7             	mov    %rax,%rdi
  801b7e:	b8 00 00 00 00       	mov    $0x0,%eax
  801b83:	49 b8 36 1e 80 00 00 	movabs $0x801e36,%r8
  801b8a:	00 00 00 
  801b8d:	41 ff d0             	callq  *%r8
  801b90:	e9 92 02 00 00       	jmpq   801e27 <vprintfmt+0x509>
  801b95:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801b98:	83 f8 30             	cmp    $0x30,%eax
  801b9b:	73 17                	jae    801bb4 <vprintfmt+0x296>
  801b9d:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  801ba1:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801ba4:	89 c0                	mov    %eax,%eax
  801ba6:	48 01 d0             	add    %rdx,%rax
  801ba9:	8b 55 b8             	mov    -0x48(%rbp),%edx
  801bac:	83 c2 08             	add    $0x8,%edx
  801baf:	89 55 b8             	mov    %edx,-0x48(%rbp)
  801bb2:	eb 0f                	jmp    801bc3 <vprintfmt+0x2a5>
  801bb4:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  801bb8:	48 89 d0             	mov    %rdx,%rax
  801bbb:	48 83 c2 08          	add    $0x8,%rdx
  801bbf:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  801bc3:	4c 8b 20             	mov    (%rax),%r12
  801bc6:	4d 85 e4             	test   %r12,%r12
  801bc9:	75 0a                	jne    801bd5 <vprintfmt+0x2b7>
  801bcb:	49 bc cd 6e 80 00 00 	movabs $0x806ecd,%r12
  801bd2:	00 00 00 
  801bd5:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  801bd9:	7e 3f                	jle    801c1a <vprintfmt+0x2fc>
  801bdb:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  801bdf:	74 39                	je     801c1a <vprintfmt+0x2fc>
  801be1:	8b 45 d8             	mov    -0x28(%rbp),%eax
  801be4:	48 98                	cltq   
  801be6:	48 89 c6             	mov    %rax,%rsi
  801be9:	4c 89 e7             	mov    %r12,%rdi
  801bec:	48 b8 3c 22 80 00 00 	movabs $0x80223c,%rax
  801bf3:	00 00 00 
  801bf6:	ff d0                	callq  *%rax
  801bf8:	29 45 dc             	sub    %eax,-0x24(%rbp)
  801bfb:	eb 17                	jmp    801c14 <vprintfmt+0x2f6>
  801bfd:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  801c01:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  801c05:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801c09:	48 89 ce             	mov    %rcx,%rsi
  801c0c:	89 d7                	mov    %edx,%edi
  801c0e:	ff d0                	callq  *%rax
  801c10:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  801c14:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  801c18:	7f e3                	jg     801bfd <vprintfmt+0x2df>
  801c1a:	eb 37                	jmp    801c53 <vprintfmt+0x335>
  801c1c:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  801c20:	74 1e                	je     801c40 <vprintfmt+0x322>
  801c22:	83 fb 1f             	cmp    $0x1f,%ebx
  801c25:	7e 05                	jle    801c2c <vprintfmt+0x30e>
  801c27:	83 fb 7e             	cmp    $0x7e,%ebx
  801c2a:	7e 14                	jle    801c40 <vprintfmt+0x322>
  801c2c:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801c30:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801c34:	48 89 d6             	mov    %rdx,%rsi
  801c37:	bf 3f 00 00 00       	mov    $0x3f,%edi
  801c3c:	ff d0                	callq  *%rax
  801c3e:	eb 0f                	jmp    801c4f <vprintfmt+0x331>
  801c40:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801c44:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801c48:	48 89 d6             	mov    %rdx,%rsi
  801c4b:	89 df                	mov    %ebx,%edi
  801c4d:	ff d0                	callq  *%rax
  801c4f:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  801c53:	4c 89 e0             	mov    %r12,%rax
  801c56:	4c 8d 60 01          	lea    0x1(%rax),%r12
  801c5a:	0f b6 00             	movzbl (%rax),%eax
  801c5d:	0f be d8             	movsbl %al,%ebx
  801c60:	85 db                	test   %ebx,%ebx
  801c62:	74 10                	je     801c74 <vprintfmt+0x356>
  801c64:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801c68:	78 b2                	js     801c1c <vprintfmt+0x2fe>
  801c6a:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  801c6e:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801c72:	79 a8                	jns    801c1c <vprintfmt+0x2fe>
  801c74:	eb 16                	jmp    801c8c <vprintfmt+0x36e>
  801c76:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801c7a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801c7e:	48 89 d6             	mov    %rdx,%rsi
  801c81:	bf 20 00 00 00       	mov    $0x20,%edi
  801c86:	ff d0                	callq  *%rax
  801c88:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  801c8c:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  801c90:	7f e4                	jg     801c76 <vprintfmt+0x358>
  801c92:	e9 90 01 00 00       	jmpq   801e27 <vprintfmt+0x509>
  801c97:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  801c9b:	be 03 00 00 00       	mov    $0x3,%esi
  801ca0:	48 89 c7             	mov    %rax,%rdi
  801ca3:	48 b8 0e 18 80 00 00 	movabs $0x80180e,%rax
  801caa:	00 00 00 
  801cad:	ff d0                	callq  *%rax
  801caf:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801cb3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801cb7:	48 85 c0             	test   %rax,%rax
  801cba:	79 1d                	jns    801cd9 <vprintfmt+0x3bb>
  801cbc:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801cc0:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801cc4:	48 89 d6             	mov    %rdx,%rsi
  801cc7:	bf 2d 00 00 00       	mov    $0x2d,%edi
  801ccc:	ff d0                	callq  *%rax
  801cce:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801cd2:	48 f7 d8             	neg    %rax
  801cd5:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801cd9:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  801ce0:	e9 d5 00 00 00       	jmpq   801dba <vprintfmt+0x49c>
  801ce5:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  801ce9:	be 03 00 00 00       	mov    $0x3,%esi
  801cee:	48 89 c7             	mov    %rax,%rdi
  801cf1:	48 b8 fe 16 80 00 00 	movabs $0x8016fe,%rax
  801cf8:	00 00 00 
  801cfb:	ff d0                	callq  *%rax
  801cfd:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801d01:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  801d08:	e9 ad 00 00 00       	jmpq   801dba <vprintfmt+0x49c>
  801d0d:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  801d11:	be 03 00 00 00       	mov    $0x3,%esi
  801d16:	48 89 c7             	mov    %rax,%rdi
  801d19:	48 b8 fe 16 80 00 00 	movabs $0x8016fe,%rax
  801d20:	00 00 00 
  801d23:	ff d0                	callq  *%rax
  801d25:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801d29:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  801d30:	e9 85 00 00 00       	jmpq   801dba <vprintfmt+0x49c>
  801d35:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801d39:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801d3d:	48 89 d6             	mov    %rdx,%rsi
  801d40:	bf 30 00 00 00       	mov    $0x30,%edi
  801d45:	ff d0                	callq  *%rax
  801d47:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801d4b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801d4f:	48 89 d6             	mov    %rdx,%rsi
  801d52:	bf 78 00 00 00       	mov    $0x78,%edi
  801d57:	ff d0                	callq  *%rax
  801d59:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801d5c:	83 f8 30             	cmp    $0x30,%eax
  801d5f:	73 17                	jae    801d78 <vprintfmt+0x45a>
  801d61:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  801d65:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801d68:	89 c0                	mov    %eax,%eax
  801d6a:	48 01 d0             	add    %rdx,%rax
  801d6d:	8b 55 b8             	mov    -0x48(%rbp),%edx
  801d70:	83 c2 08             	add    $0x8,%edx
  801d73:	89 55 b8             	mov    %edx,-0x48(%rbp)
  801d76:	eb 0f                	jmp    801d87 <vprintfmt+0x469>
  801d78:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  801d7c:	48 89 d0             	mov    %rdx,%rax
  801d7f:	48 83 c2 08          	add    $0x8,%rdx
  801d83:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  801d87:	48 8b 00             	mov    (%rax),%rax
  801d8a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801d8e:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  801d95:	eb 23                	jmp    801dba <vprintfmt+0x49c>
  801d97:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  801d9b:	be 03 00 00 00       	mov    $0x3,%esi
  801da0:	48 89 c7             	mov    %rax,%rdi
  801da3:	48 b8 fe 16 80 00 00 	movabs $0x8016fe,%rax
  801daa:	00 00 00 
  801dad:	ff d0                	callq  *%rax
  801daf:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801db3:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  801dba:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  801dbf:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  801dc2:	8b 7d dc             	mov    -0x24(%rbp),%edi
  801dc5:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801dc9:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  801dcd:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801dd1:	45 89 c1             	mov    %r8d,%r9d
  801dd4:	41 89 f8             	mov    %edi,%r8d
  801dd7:	48 89 c7             	mov    %rax,%rdi
  801dda:	48 b8 43 16 80 00 00 	movabs $0x801643,%rax
  801de1:	00 00 00 
  801de4:	ff d0                	callq  *%rax
  801de6:	eb 3f                	jmp    801e27 <vprintfmt+0x509>
  801de8:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801dec:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801df0:	48 89 d6             	mov    %rdx,%rsi
  801df3:	89 df                	mov    %ebx,%edi
  801df5:	ff d0                	callq  *%rax
  801df7:	eb 2e                	jmp    801e27 <vprintfmt+0x509>
  801df9:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801dfd:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801e01:	48 89 d6             	mov    %rdx,%rsi
  801e04:	bf 25 00 00 00       	mov    $0x25,%edi
  801e09:	ff d0                	callq  *%rax
  801e0b:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  801e10:	eb 05                	jmp    801e17 <vprintfmt+0x4f9>
  801e12:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  801e17:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  801e1b:	48 83 e8 01          	sub    $0x1,%rax
  801e1f:	0f b6 00             	movzbl (%rax),%eax
  801e22:	3c 25                	cmp    $0x25,%al
  801e24:	75 ec                	jne    801e12 <vprintfmt+0x4f4>
  801e26:	90                   	nop
  801e27:	90                   	nop
  801e28:	e9 43 fb ff ff       	jmpq   801970 <vprintfmt+0x52>
  801e2d:	48 83 c4 60          	add    $0x60,%rsp
  801e31:	5b                   	pop    %rbx
  801e32:	41 5c                	pop    %r12
  801e34:	5d                   	pop    %rbp
  801e35:	c3                   	retq   

0000000000801e36 <printfmt>:
  801e36:	55                   	push   %rbp
  801e37:	48 89 e5             	mov    %rsp,%rbp
  801e3a:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  801e41:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  801e48:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  801e4f:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  801e56:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  801e5d:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  801e64:	84 c0                	test   %al,%al
  801e66:	74 20                	je     801e88 <printfmt+0x52>
  801e68:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  801e6c:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  801e70:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  801e74:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  801e78:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  801e7c:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  801e80:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  801e84:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  801e88:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  801e8f:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  801e96:	00 00 00 
  801e99:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  801ea0:	00 00 00 
  801ea3:	48 8d 45 10          	lea    0x10(%rbp),%rax
  801ea7:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  801eae:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  801eb5:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  801ebc:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  801ec3:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  801eca:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  801ed1:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  801ed8:	48 89 c7             	mov    %rax,%rdi
  801edb:	48 b8 1e 19 80 00 00 	movabs $0x80191e,%rax
  801ee2:	00 00 00 
  801ee5:	ff d0                	callq  *%rax
  801ee7:	c9                   	leaveq 
  801ee8:	c3                   	retq   

0000000000801ee9 <sprintputch>:
  801ee9:	55                   	push   %rbp
  801eea:	48 89 e5             	mov    %rsp,%rbp
  801eed:	48 83 ec 10          	sub    $0x10,%rsp
  801ef1:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801ef4:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801ef8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801efc:	8b 40 10             	mov    0x10(%rax),%eax
  801eff:	8d 50 01             	lea    0x1(%rax),%edx
  801f02:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801f06:	89 50 10             	mov    %edx,0x10(%rax)
  801f09:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801f0d:	48 8b 10             	mov    (%rax),%rdx
  801f10:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801f14:	48 8b 40 08          	mov    0x8(%rax),%rax
  801f18:	48 39 c2             	cmp    %rax,%rdx
  801f1b:	73 17                	jae    801f34 <sprintputch+0x4b>
  801f1d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801f21:	48 8b 00             	mov    (%rax),%rax
  801f24:	48 8d 48 01          	lea    0x1(%rax),%rcx
  801f28:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801f2c:	48 89 0a             	mov    %rcx,(%rdx)
  801f2f:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801f32:	88 10                	mov    %dl,(%rax)
  801f34:	c9                   	leaveq 
  801f35:	c3                   	retq   

0000000000801f36 <vsnprintf>:
  801f36:	55                   	push   %rbp
  801f37:	48 89 e5             	mov    %rsp,%rbp
  801f3a:	48 83 ec 50          	sub    $0x50,%rsp
  801f3e:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  801f42:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  801f45:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  801f49:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  801f4d:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  801f51:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  801f55:	48 8b 0a             	mov    (%rdx),%rcx
  801f58:	48 89 08             	mov    %rcx,(%rax)
  801f5b:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  801f5f:	48 89 48 08          	mov    %rcx,0x8(%rax)
  801f63:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801f67:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801f6b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801f6f:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  801f73:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  801f76:	48 98                	cltq   
  801f78:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801f7c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801f80:	48 01 d0             	add    %rdx,%rax
  801f83:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  801f87:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  801f8e:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  801f93:	74 06                	je     801f9b <vsnprintf+0x65>
  801f95:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  801f99:	7f 07                	jg     801fa2 <vsnprintf+0x6c>
  801f9b:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801fa0:	eb 2f                	jmp    801fd1 <vsnprintf+0x9b>
  801fa2:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  801fa6:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  801faa:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  801fae:	48 89 c6             	mov    %rax,%rsi
  801fb1:	48 bf e9 1e 80 00 00 	movabs $0x801ee9,%rdi
  801fb8:	00 00 00 
  801fbb:	48 b8 1e 19 80 00 00 	movabs $0x80191e,%rax
  801fc2:	00 00 00 
  801fc5:	ff d0                	callq  *%rax
  801fc7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801fcb:	c6 00 00             	movb   $0x0,(%rax)
  801fce:	8b 45 e0             	mov    -0x20(%rbp),%eax
  801fd1:	c9                   	leaveq 
  801fd2:	c3                   	retq   

0000000000801fd3 <snprintf>:
  801fd3:	55                   	push   %rbp
  801fd4:	48 89 e5             	mov    %rsp,%rbp
  801fd7:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  801fde:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  801fe5:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  801feb:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  801ff2:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  801ff9:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  802000:	84 c0                	test   %al,%al
  802002:	74 20                	je     802024 <snprintf+0x51>
  802004:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  802008:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80200c:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  802010:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  802014:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  802018:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  80201c:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  802020:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  802024:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  80202b:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  802032:	00 00 00 
  802035:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  80203c:	00 00 00 
  80203f:	48 8d 45 10          	lea    0x10(%rbp),%rax
  802043:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  80204a:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  802051:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  802058:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  80205f:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  802066:	48 8b 0a             	mov    (%rdx),%rcx
  802069:	48 89 08             	mov    %rcx,(%rax)
  80206c:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  802070:	48 89 48 08          	mov    %rcx,0x8(%rax)
  802074:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  802078:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80207c:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  802083:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  80208a:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  802090:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  802097:	48 89 c7             	mov    %rax,%rdi
  80209a:	48 b8 36 1f 80 00 00 	movabs $0x801f36,%rax
  8020a1:	00 00 00 
  8020a4:	ff d0                	callq  *%rax
  8020a6:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  8020ac:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  8020b2:	c9                   	leaveq 
  8020b3:	c3                   	retq   

00000000008020b4 <readline>:
  8020b4:	55                   	push   %rbp
  8020b5:	48 89 e5             	mov    %rsp,%rbp
  8020b8:	48 83 ec 20          	sub    $0x20,%rsp
  8020bc:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8020c0:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8020c5:	74 27                	je     8020ee <readline+0x3a>
  8020c7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8020cb:	48 89 c2             	mov    %rax,%rdx
  8020ce:	48 be 88 71 80 00 00 	movabs $0x807188,%rsi
  8020d5:	00 00 00 
  8020d8:	bf 01 00 00 00       	mov    $0x1,%edi
  8020dd:	b8 00 00 00 00       	mov    $0x0,%eax
  8020e2:	48 b9 42 4b 80 00 00 	movabs $0x804b42,%rcx
  8020e9:	00 00 00 
  8020ec:	ff d1                	callq  *%rcx
  8020ee:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8020f5:	bf 00 00 00 00       	mov    $0x0,%edi
  8020fa:	48 b8 4d 10 80 00 00 	movabs $0x80104d,%rax
  802101:	00 00 00 
  802104:	ff d0                	callq  *%rax
  802106:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802109:	48 b8 04 10 80 00 00 	movabs $0x801004,%rax
  802110:	00 00 00 
  802113:	ff d0                	callq  *%rax
  802115:	89 45 f4             	mov    %eax,-0xc(%rbp)
  802118:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  80211c:	79 30                	jns    80214e <readline+0x9a>
  80211e:	83 7d f4 f7          	cmpl   $0xfffffff7,-0xc(%rbp)
  802122:	74 20                	je     802144 <readline+0x90>
  802124:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802127:	89 c6                	mov    %eax,%esi
  802129:	48 bf 8b 71 80 00 00 	movabs $0x80718b,%rdi
  802130:	00 00 00 
  802133:	b8 00 00 00 00       	mov    $0x0,%eax
  802138:	48 ba 6b 15 80 00 00 	movabs $0x80156b,%rdx
  80213f:	00 00 00 
  802142:	ff d2                	callq  *%rdx
  802144:	b8 00 00 00 00       	mov    $0x0,%eax
  802149:	e9 be 00 00 00       	jmpq   80220c <readline+0x158>
  80214e:	83 7d f4 08          	cmpl   $0x8,-0xc(%rbp)
  802152:	74 06                	je     80215a <readline+0xa6>
  802154:	83 7d f4 7f          	cmpl   $0x7f,-0xc(%rbp)
  802158:	75 26                	jne    802180 <readline+0xcc>
  80215a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80215e:	7e 20                	jle    802180 <readline+0xcc>
  802160:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802164:	74 11                	je     802177 <readline+0xc3>
  802166:	bf 08 00 00 00       	mov    $0x8,%edi
  80216b:	48 b8 d9 0f 80 00 00 	movabs $0x800fd9,%rax
  802172:	00 00 00 
  802175:	ff d0                	callq  *%rax
  802177:	83 6d fc 01          	subl   $0x1,-0x4(%rbp)
  80217b:	e9 87 00 00 00       	jmpq   802207 <readline+0x153>
  802180:	83 7d f4 1f          	cmpl   $0x1f,-0xc(%rbp)
  802184:	7e 3f                	jle    8021c5 <readline+0x111>
  802186:	81 7d fc fe 03 00 00 	cmpl   $0x3fe,-0x4(%rbp)
  80218d:	7f 36                	jg     8021c5 <readline+0x111>
  80218f:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802193:	74 11                	je     8021a6 <readline+0xf2>
  802195:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802198:	89 c7                	mov    %eax,%edi
  80219a:	48 b8 d9 0f 80 00 00 	movabs $0x800fd9,%rax
  8021a1:	00 00 00 
  8021a4:	ff d0                	callq  *%rax
  8021a6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8021a9:	8d 50 01             	lea    0x1(%rax),%edx
  8021ac:	89 55 fc             	mov    %edx,-0x4(%rbp)
  8021af:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8021b2:	89 d1                	mov    %edx,%ecx
  8021b4:	48 ba 20 a0 80 00 00 	movabs $0x80a020,%rdx
  8021bb:	00 00 00 
  8021be:	48 98                	cltq   
  8021c0:	88 0c 02             	mov    %cl,(%rdx,%rax,1)
  8021c3:	eb 42                	jmp    802207 <readline+0x153>
  8021c5:	83 7d f4 0a          	cmpl   $0xa,-0xc(%rbp)
  8021c9:	74 06                	je     8021d1 <readline+0x11d>
  8021cb:	83 7d f4 0d          	cmpl   $0xd,-0xc(%rbp)
  8021cf:	75 36                	jne    802207 <readline+0x153>
  8021d1:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8021d5:	74 11                	je     8021e8 <readline+0x134>
  8021d7:	bf 0a 00 00 00       	mov    $0xa,%edi
  8021dc:	48 b8 d9 0f 80 00 00 	movabs $0x800fd9,%rax
  8021e3:	00 00 00 
  8021e6:	ff d0                	callq  *%rax
  8021e8:	48 ba 20 a0 80 00 00 	movabs $0x80a020,%rdx
  8021ef:	00 00 00 
  8021f2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8021f5:	48 98                	cltq   
  8021f7:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
  8021fb:	48 b8 20 a0 80 00 00 	movabs $0x80a020,%rax
  802202:	00 00 00 
  802205:	eb 05                	jmp    80220c <readline+0x158>
  802207:	e9 fd fe ff ff       	jmpq   802109 <readline+0x55>
  80220c:	c9                   	leaveq 
  80220d:	c3                   	retq   

000000000080220e <strlen>:
  80220e:	55                   	push   %rbp
  80220f:	48 89 e5             	mov    %rsp,%rbp
  802212:	48 83 ec 18          	sub    $0x18,%rsp
  802216:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80221a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802221:	eb 09                	jmp    80222c <strlen+0x1e>
  802223:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802227:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80222c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802230:	0f b6 00             	movzbl (%rax),%eax
  802233:	84 c0                	test   %al,%al
  802235:	75 ec                	jne    802223 <strlen+0x15>
  802237:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80223a:	c9                   	leaveq 
  80223b:	c3                   	retq   

000000000080223c <strnlen>:
  80223c:	55                   	push   %rbp
  80223d:	48 89 e5             	mov    %rsp,%rbp
  802240:	48 83 ec 20          	sub    $0x20,%rsp
  802244:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802248:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80224c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802253:	eb 0e                	jmp    802263 <strnlen+0x27>
  802255:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802259:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80225e:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  802263:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  802268:	74 0b                	je     802275 <strnlen+0x39>
  80226a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80226e:	0f b6 00             	movzbl (%rax),%eax
  802271:	84 c0                	test   %al,%al
  802273:	75 e0                	jne    802255 <strnlen+0x19>
  802275:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802278:	c9                   	leaveq 
  802279:	c3                   	retq   

000000000080227a <strcpy>:
  80227a:	55                   	push   %rbp
  80227b:	48 89 e5             	mov    %rsp,%rbp
  80227e:	48 83 ec 20          	sub    $0x20,%rsp
  802282:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802286:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80228a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80228e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802292:	90                   	nop
  802293:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802297:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80229b:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80229f:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8022a3:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8022a7:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8022ab:	0f b6 12             	movzbl (%rdx),%edx
  8022ae:	88 10                	mov    %dl,(%rax)
  8022b0:	0f b6 00             	movzbl (%rax),%eax
  8022b3:	84 c0                	test   %al,%al
  8022b5:	75 dc                	jne    802293 <strcpy+0x19>
  8022b7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8022bb:	c9                   	leaveq 
  8022bc:	c3                   	retq   

00000000008022bd <strcat>:
  8022bd:	55                   	push   %rbp
  8022be:	48 89 e5             	mov    %rsp,%rbp
  8022c1:	48 83 ec 20          	sub    $0x20,%rsp
  8022c5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8022c9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8022cd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8022d1:	48 89 c7             	mov    %rax,%rdi
  8022d4:	48 b8 0e 22 80 00 00 	movabs $0x80220e,%rax
  8022db:	00 00 00 
  8022de:	ff d0                	callq  *%rax
  8022e0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8022e3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8022e6:	48 63 d0             	movslq %eax,%rdx
  8022e9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8022ed:	48 01 c2             	add    %rax,%rdx
  8022f0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8022f4:	48 89 c6             	mov    %rax,%rsi
  8022f7:	48 89 d7             	mov    %rdx,%rdi
  8022fa:	48 b8 7a 22 80 00 00 	movabs $0x80227a,%rax
  802301:	00 00 00 
  802304:	ff d0                	callq  *%rax
  802306:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80230a:	c9                   	leaveq 
  80230b:	c3                   	retq   

000000000080230c <strncpy>:
  80230c:	55                   	push   %rbp
  80230d:	48 89 e5             	mov    %rsp,%rbp
  802310:	48 83 ec 28          	sub    $0x28,%rsp
  802314:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802318:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80231c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802320:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802324:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802328:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80232f:	00 
  802330:	eb 2a                	jmp    80235c <strncpy+0x50>
  802332:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802336:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80233a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80233e:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802342:	0f b6 12             	movzbl (%rdx),%edx
  802345:	88 10                	mov    %dl,(%rax)
  802347:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80234b:	0f b6 00             	movzbl (%rax),%eax
  80234e:	84 c0                	test   %al,%al
  802350:	74 05                	je     802357 <strncpy+0x4b>
  802352:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  802357:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80235c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802360:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802364:	72 cc                	jb     802332 <strncpy+0x26>
  802366:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80236a:	c9                   	leaveq 
  80236b:	c3                   	retq   

000000000080236c <strlcpy>:
  80236c:	55                   	push   %rbp
  80236d:	48 89 e5             	mov    %rsp,%rbp
  802370:	48 83 ec 28          	sub    $0x28,%rsp
  802374:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802378:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80237c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802380:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802384:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802388:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80238d:	74 3d                	je     8023cc <strlcpy+0x60>
  80238f:	eb 1d                	jmp    8023ae <strlcpy+0x42>
  802391:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802395:	48 8d 50 01          	lea    0x1(%rax),%rdx
  802399:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80239d:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8023a1:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8023a5:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8023a9:	0f b6 12             	movzbl (%rdx),%edx
  8023ac:	88 10                	mov    %dl,(%rax)
  8023ae:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  8023b3:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8023b8:	74 0b                	je     8023c5 <strlcpy+0x59>
  8023ba:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8023be:	0f b6 00             	movzbl (%rax),%eax
  8023c1:	84 c0                	test   %al,%al
  8023c3:	75 cc                	jne    802391 <strlcpy+0x25>
  8023c5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8023c9:	c6 00 00             	movb   $0x0,(%rax)
  8023cc:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8023d0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8023d4:	48 29 c2             	sub    %rax,%rdx
  8023d7:	48 89 d0             	mov    %rdx,%rax
  8023da:	c9                   	leaveq 
  8023db:	c3                   	retq   

00000000008023dc <strcmp>:
  8023dc:	55                   	push   %rbp
  8023dd:	48 89 e5             	mov    %rsp,%rbp
  8023e0:	48 83 ec 10          	sub    $0x10,%rsp
  8023e4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8023e8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8023ec:	eb 0a                	jmp    8023f8 <strcmp+0x1c>
  8023ee:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8023f3:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8023f8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8023fc:	0f b6 00             	movzbl (%rax),%eax
  8023ff:	84 c0                	test   %al,%al
  802401:	74 12                	je     802415 <strcmp+0x39>
  802403:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802407:	0f b6 10             	movzbl (%rax),%edx
  80240a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80240e:	0f b6 00             	movzbl (%rax),%eax
  802411:	38 c2                	cmp    %al,%dl
  802413:	74 d9                	je     8023ee <strcmp+0x12>
  802415:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802419:	0f b6 00             	movzbl (%rax),%eax
  80241c:	0f b6 d0             	movzbl %al,%edx
  80241f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802423:	0f b6 00             	movzbl (%rax),%eax
  802426:	0f b6 c0             	movzbl %al,%eax
  802429:	29 c2                	sub    %eax,%edx
  80242b:	89 d0                	mov    %edx,%eax
  80242d:	c9                   	leaveq 
  80242e:	c3                   	retq   

000000000080242f <strncmp>:
  80242f:	55                   	push   %rbp
  802430:	48 89 e5             	mov    %rsp,%rbp
  802433:	48 83 ec 18          	sub    $0x18,%rsp
  802437:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80243b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80243f:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  802443:	eb 0f                	jmp    802454 <strncmp+0x25>
  802445:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  80244a:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80244f:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  802454:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  802459:	74 1d                	je     802478 <strncmp+0x49>
  80245b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80245f:	0f b6 00             	movzbl (%rax),%eax
  802462:	84 c0                	test   %al,%al
  802464:	74 12                	je     802478 <strncmp+0x49>
  802466:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80246a:	0f b6 10             	movzbl (%rax),%edx
  80246d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802471:	0f b6 00             	movzbl (%rax),%eax
  802474:	38 c2                	cmp    %al,%dl
  802476:	74 cd                	je     802445 <strncmp+0x16>
  802478:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80247d:	75 07                	jne    802486 <strncmp+0x57>
  80247f:	b8 00 00 00 00       	mov    $0x0,%eax
  802484:	eb 18                	jmp    80249e <strncmp+0x6f>
  802486:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80248a:	0f b6 00             	movzbl (%rax),%eax
  80248d:	0f b6 d0             	movzbl %al,%edx
  802490:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802494:	0f b6 00             	movzbl (%rax),%eax
  802497:	0f b6 c0             	movzbl %al,%eax
  80249a:	29 c2                	sub    %eax,%edx
  80249c:	89 d0                	mov    %edx,%eax
  80249e:	c9                   	leaveq 
  80249f:	c3                   	retq   

00000000008024a0 <strchr>:
  8024a0:	55                   	push   %rbp
  8024a1:	48 89 e5             	mov    %rsp,%rbp
  8024a4:	48 83 ec 0c          	sub    $0xc,%rsp
  8024a8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8024ac:	89 f0                	mov    %esi,%eax
  8024ae:	88 45 f4             	mov    %al,-0xc(%rbp)
  8024b1:	eb 17                	jmp    8024ca <strchr+0x2a>
  8024b3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8024b7:	0f b6 00             	movzbl (%rax),%eax
  8024ba:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8024bd:	75 06                	jne    8024c5 <strchr+0x25>
  8024bf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8024c3:	eb 15                	jmp    8024da <strchr+0x3a>
  8024c5:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8024ca:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8024ce:	0f b6 00             	movzbl (%rax),%eax
  8024d1:	84 c0                	test   %al,%al
  8024d3:	75 de                	jne    8024b3 <strchr+0x13>
  8024d5:	b8 00 00 00 00       	mov    $0x0,%eax
  8024da:	c9                   	leaveq 
  8024db:	c3                   	retq   

00000000008024dc <strfind>:
  8024dc:	55                   	push   %rbp
  8024dd:	48 89 e5             	mov    %rsp,%rbp
  8024e0:	48 83 ec 0c          	sub    $0xc,%rsp
  8024e4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8024e8:	89 f0                	mov    %esi,%eax
  8024ea:	88 45 f4             	mov    %al,-0xc(%rbp)
  8024ed:	eb 13                	jmp    802502 <strfind+0x26>
  8024ef:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8024f3:	0f b6 00             	movzbl (%rax),%eax
  8024f6:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8024f9:	75 02                	jne    8024fd <strfind+0x21>
  8024fb:	eb 10                	jmp    80250d <strfind+0x31>
  8024fd:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  802502:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802506:	0f b6 00             	movzbl (%rax),%eax
  802509:	84 c0                	test   %al,%al
  80250b:	75 e2                	jne    8024ef <strfind+0x13>
  80250d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802511:	c9                   	leaveq 
  802512:	c3                   	retq   

0000000000802513 <memset>:
  802513:	55                   	push   %rbp
  802514:	48 89 e5             	mov    %rsp,%rbp
  802517:	48 83 ec 18          	sub    $0x18,%rsp
  80251b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80251f:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802522:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  802526:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80252b:	75 06                	jne    802533 <memset+0x20>
  80252d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802531:	eb 69                	jmp    80259c <memset+0x89>
  802533:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802537:	83 e0 03             	and    $0x3,%eax
  80253a:	48 85 c0             	test   %rax,%rax
  80253d:	75 48                	jne    802587 <memset+0x74>
  80253f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802543:	83 e0 03             	and    $0x3,%eax
  802546:	48 85 c0             	test   %rax,%rax
  802549:	75 3c                	jne    802587 <memset+0x74>
  80254b:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  802552:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802555:	c1 e0 18             	shl    $0x18,%eax
  802558:	89 c2                	mov    %eax,%edx
  80255a:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80255d:	c1 e0 10             	shl    $0x10,%eax
  802560:	09 c2                	or     %eax,%edx
  802562:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802565:	c1 e0 08             	shl    $0x8,%eax
  802568:	09 d0                	or     %edx,%eax
  80256a:	09 45 f4             	or     %eax,-0xc(%rbp)
  80256d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802571:	48 c1 e8 02          	shr    $0x2,%rax
  802575:	48 89 c1             	mov    %rax,%rcx
  802578:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80257c:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80257f:	48 89 d7             	mov    %rdx,%rdi
  802582:	fc                   	cld    
  802583:	f3 ab                	rep stos %eax,%es:(%rdi)
  802585:	eb 11                	jmp    802598 <memset+0x85>
  802587:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80258b:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80258e:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802592:	48 89 d7             	mov    %rdx,%rdi
  802595:	fc                   	cld    
  802596:	f3 aa                	rep stos %al,%es:(%rdi)
  802598:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80259c:	c9                   	leaveq 
  80259d:	c3                   	retq   

000000000080259e <memmove>:
  80259e:	55                   	push   %rbp
  80259f:	48 89 e5             	mov    %rsp,%rbp
  8025a2:	48 83 ec 28          	sub    $0x28,%rsp
  8025a6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8025aa:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8025ae:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8025b2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8025b6:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8025ba:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8025be:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8025c2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8025c6:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8025ca:	0f 83 88 00 00 00    	jae    802658 <memmove+0xba>
  8025d0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8025d4:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8025d8:	48 01 d0             	add    %rdx,%rax
  8025db:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8025df:	76 77                	jbe    802658 <memmove+0xba>
  8025e1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8025e5:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  8025e9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8025ed:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  8025f1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8025f5:	83 e0 03             	and    $0x3,%eax
  8025f8:	48 85 c0             	test   %rax,%rax
  8025fb:	75 3b                	jne    802638 <memmove+0x9a>
  8025fd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802601:	83 e0 03             	and    $0x3,%eax
  802604:	48 85 c0             	test   %rax,%rax
  802607:	75 2f                	jne    802638 <memmove+0x9a>
  802609:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80260d:	83 e0 03             	and    $0x3,%eax
  802610:	48 85 c0             	test   %rax,%rax
  802613:	75 23                	jne    802638 <memmove+0x9a>
  802615:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802619:	48 83 e8 04          	sub    $0x4,%rax
  80261d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802621:	48 83 ea 04          	sub    $0x4,%rdx
  802625:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  802629:	48 c1 e9 02          	shr    $0x2,%rcx
  80262d:	48 89 c7             	mov    %rax,%rdi
  802630:	48 89 d6             	mov    %rdx,%rsi
  802633:	fd                   	std    
  802634:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  802636:	eb 1d                	jmp    802655 <memmove+0xb7>
  802638:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80263c:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  802640:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802644:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  802648:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80264c:	48 89 d7             	mov    %rdx,%rdi
  80264f:	48 89 c1             	mov    %rax,%rcx
  802652:	fd                   	std    
  802653:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  802655:	fc                   	cld    
  802656:	eb 57                	jmp    8026af <memmove+0x111>
  802658:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80265c:	83 e0 03             	and    $0x3,%eax
  80265f:	48 85 c0             	test   %rax,%rax
  802662:	75 36                	jne    80269a <memmove+0xfc>
  802664:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802668:	83 e0 03             	and    $0x3,%eax
  80266b:	48 85 c0             	test   %rax,%rax
  80266e:	75 2a                	jne    80269a <memmove+0xfc>
  802670:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802674:	83 e0 03             	and    $0x3,%eax
  802677:	48 85 c0             	test   %rax,%rax
  80267a:	75 1e                	jne    80269a <memmove+0xfc>
  80267c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802680:	48 c1 e8 02          	shr    $0x2,%rax
  802684:	48 89 c1             	mov    %rax,%rcx
  802687:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80268b:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80268f:	48 89 c7             	mov    %rax,%rdi
  802692:	48 89 d6             	mov    %rdx,%rsi
  802695:	fc                   	cld    
  802696:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  802698:	eb 15                	jmp    8026af <memmove+0x111>
  80269a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80269e:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8026a2:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  8026a6:	48 89 c7             	mov    %rax,%rdi
  8026a9:	48 89 d6             	mov    %rdx,%rsi
  8026ac:	fc                   	cld    
  8026ad:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  8026af:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8026b3:	c9                   	leaveq 
  8026b4:	c3                   	retq   

00000000008026b5 <memcpy>:
  8026b5:	55                   	push   %rbp
  8026b6:	48 89 e5             	mov    %rsp,%rbp
  8026b9:	48 83 ec 18          	sub    $0x18,%rsp
  8026bd:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8026c1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8026c5:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8026c9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8026cd:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8026d1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8026d5:	48 89 ce             	mov    %rcx,%rsi
  8026d8:	48 89 c7             	mov    %rax,%rdi
  8026db:	48 b8 9e 25 80 00 00 	movabs $0x80259e,%rax
  8026e2:	00 00 00 
  8026e5:	ff d0                	callq  *%rax
  8026e7:	c9                   	leaveq 
  8026e8:	c3                   	retq   

00000000008026e9 <memcmp>:
  8026e9:	55                   	push   %rbp
  8026ea:	48 89 e5             	mov    %rsp,%rbp
  8026ed:	48 83 ec 28          	sub    $0x28,%rsp
  8026f1:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8026f5:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8026f9:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8026fd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802701:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802705:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802709:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80270d:	eb 36                	jmp    802745 <memcmp+0x5c>
  80270f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802713:	0f b6 10             	movzbl (%rax),%edx
  802716:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80271a:	0f b6 00             	movzbl (%rax),%eax
  80271d:	38 c2                	cmp    %al,%dl
  80271f:	74 1a                	je     80273b <memcmp+0x52>
  802721:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802725:	0f b6 00             	movzbl (%rax),%eax
  802728:	0f b6 d0             	movzbl %al,%edx
  80272b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80272f:	0f b6 00             	movzbl (%rax),%eax
  802732:	0f b6 c0             	movzbl %al,%eax
  802735:	29 c2                	sub    %eax,%edx
  802737:	89 d0                	mov    %edx,%eax
  802739:	eb 20                	jmp    80275b <memcmp+0x72>
  80273b:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  802740:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  802745:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802749:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80274d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802751:	48 85 c0             	test   %rax,%rax
  802754:	75 b9                	jne    80270f <memcmp+0x26>
  802756:	b8 00 00 00 00       	mov    $0x0,%eax
  80275b:	c9                   	leaveq 
  80275c:	c3                   	retq   

000000000080275d <memfind>:
  80275d:	55                   	push   %rbp
  80275e:	48 89 e5             	mov    %rsp,%rbp
  802761:	48 83 ec 28          	sub    $0x28,%rsp
  802765:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802769:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80276c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802770:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802774:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802778:	48 01 d0             	add    %rdx,%rax
  80277b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80277f:	eb 15                	jmp    802796 <memfind+0x39>
  802781:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802785:	0f b6 10             	movzbl (%rax),%edx
  802788:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80278b:	38 c2                	cmp    %al,%dl
  80278d:	75 02                	jne    802791 <memfind+0x34>
  80278f:	eb 0f                	jmp    8027a0 <memfind+0x43>
  802791:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  802796:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80279a:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  80279e:	72 e1                	jb     802781 <memfind+0x24>
  8027a0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8027a4:	c9                   	leaveq 
  8027a5:	c3                   	retq   

00000000008027a6 <strtol>:
  8027a6:	55                   	push   %rbp
  8027a7:	48 89 e5             	mov    %rsp,%rbp
  8027aa:	48 83 ec 34          	sub    $0x34,%rsp
  8027ae:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8027b2:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8027b6:	89 55 cc             	mov    %edx,-0x34(%rbp)
  8027b9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8027c0:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  8027c7:	00 
  8027c8:	eb 05                	jmp    8027cf <strtol+0x29>
  8027ca:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8027cf:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8027d3:	0f b6 00             	movzbl (%rax),%eax
  8027d6:	3c 20                	cmp    $0x20,%al
  8027d8:	74 f0                	je     8027ca <strtol+0x24>
  8027da:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8027de:	0f b6 00             	movzbl (%rax),%eax
  8027e1:	3c 09                	cmp    $0x9,%al
  8027e3:	74 e5                	je     8027ca <strtol+0x24>
  8027e5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8027e9:	0f b6 00             	movzbl (%rax),%eax
  8027ec:	3c 2b                	cmp    $0x2b,%al
  8027ee:	75 07                	jne    8027f7 <strtol+0x51>
  8027f0:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8027f5:	eb 17                	jmp    80280e <strtol+0x68>
  8027f7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8027fb:	0f b6 00             	movzbl (%rax),%eax
  8027fe:	3c 2d                	cmp    $0x2d,%al
  802800:	75 0c                	jne    80280e <strtol+0x68>
  802802:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  802807:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  80280e:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  802812:	74 06                	je     80281a <strtol+0x74>
  802814:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  802818:	75 28                	jne    802842 <strtol+0x9c>
  80281a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80281e:	0f b6 00             	movzbl (%rax),%eax
  802821:	3c 30                	cmp    $0x30,%al
  802823:	75 1d                	jne    802842 <strtol+0x9c>
  802825:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802829:	48 83 c0 01          	add    $0x1,%rax
  80282d:	0f b6 00             	movzbl (%rax),%eax
  802830:	3c 78                	cmp    $0x78,%al
  802832:	75 0e                	jne    802842 <strtol+0x9c>
  802834:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  802839:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  802840:	eb 2c                	jmp    80286e <strtol+0xc8>
  802842:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  802846:	75 19                	jne    802861 <strtol+0xbb>
  802848:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80284c:	0f b6 00             	movzbl (%rax),%eax
  80284f:	3c 30                	cmp    $0x30,%al
  802851:	75 0e                	jne    802861 <strtol+0xbb>
  802853:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  802858:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  80285f:	eb 0d                	jmp    80286e <strtol+0xc8>
  802861:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  802865:	75 07                	jne    80286e <strtol+0xc8>
  802867:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  80286e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802872:	0f b6 00             	movzbl (%rax),%eax
  802875:	3c 2f                	cmp    $0x2f,%al
  802877:	7e 1d                	jle    802896 <strtol+0xf0>
  802879:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80287d:	0f b6 00             	movzbl (%rax),%eax
  802880:	3c 39                	cmp    $0x39,%al
  802882:	7f 12                	jg     802896 <strtol+0xf0>
  802884:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802888:	0f b6 00             	movzbl (%rax),%eax
  80288b:	0f be c0             	movsbl %al,%eax
  80288e:	83 e8 30             	sub    $0x30,%eax
  802891:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802894:	eb 4e                	jmp    8028e4 <strtol+0x13e>
  802896:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80289a:	0f b6 00             	movzbl (%rax),%eax
  80289d:	3c 60                	cmp    $0x60,%al
  80289f:	7e 1d                	jle    8028be <strtol+0x118>
  8028a1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8028a5:	0f b6 00             	movzbl (%rax),%eax
  8028a8:	3c 7a                	cmp    $0x7a,%al
  8028aa:	7f 12                	jg     8028be <strtol+0x118>
  8028ac:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8028b0:	0f b6 00             	movzbl (%rax),%eax
  8028b3:	0f be c0             	movsbl %al,%eax
  8028b6:	83 e8 57             	sub    $0x57,%eax
  8028b9:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8028bc:	eb 26                	jmp    8028e4 <strtol+0x13e>
  8028be:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8028c2:	0f b6 00             	movzbl (%rax),%eax
  8028c5:	3c 40                	cmp    $0x40,%al
  8028c7:	7e 48                	jle    802911 <strtol+0x16b>
  8028c9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8028cd:	0f b6 00             	movzbl (%rax),%eax
  8028d0:	3c 5a                	cmp    $0x5a,%al
  8028d2:	7f 3d                	jg     802911 <strtol+0x16b>
  8028d4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8028d8:	0f b6 00             	movzbl (%rax),%eax
  8028db:	0f be c0             	movsbl %al,%eax
  8028de:	83 e8 37             	sub    $0x37,%eax
  8028e1:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8028e4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8028e7:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  8028ea:	7c 02                	jl     8028ee <strtol+0x148>
  8028ec:	eb 23                	jmp    802911 <strtol+0x16b>
  8028ee:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8028f3:	8b 45 cc             	mov    -0x34(%rbp),%eax
  8028f6:	48 98                	cltq   
  8028f8:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  8028fd:	48 89 c2             	mov    %rax,%rdx
  802900:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802903:	48 98                	cltq   
  802905:	48 01 d0             	add    %rdx,%rax
  802908:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80290c:	e9 5d ff ff ff       	jmpq   80286e <strtol+0xc8>
  802911:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  802916:	74 0b                	je     802923 <strtol+0x17d>
  802918:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80291c:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802920:	48 89 10             	mov    %rdx,(%rax)
  802923:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802927:	74 09                	je     802932 <strtol+0x18c>
  802929:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80292d:	48 f7 d8             	neg    %rax
  802930:	eb 04                	jmp    802936 <strtol+0x190>
  802932:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802936:	c9                   	leaveq 
  802937:	c3                   	retq   

0000000000802938 <strstr>:
  802938:	55                   	push   %rbp
  802939:	48 89 e5             	mov    %rsp,%rbp
  80293c:	48 83 ec 30          	sub    $0x30,%rsp
  802940:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802944:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802948:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80294c:	48 8d 50 01          	lea    0x1(%rax),%rdx
  802950:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  802954:	0f b6 00             	movzbl (%rax),%eax
  802957:	88 45 ff             	mov    %al,-0x1(%rbp)
  80295a:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  80295e:	75 06                	jne    802966 <strstr+0x2e>
  802960:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802964:	eb 6b                	jmp    8029d1 <strstr+0x99>
  802966:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80296a:	48 89 c7             	mov    %rax,%rdi
  80296d:	48 b8 0e 22 80 00 00 	movabs $0x80220e,%rax
  802974:	00 00 00 
  802977:	ff d0                	callq  *%rax
  802979:	48 98                	cltq   
  80297b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80297f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802983:	48 8d 50 01          	lea    0x1(%rax),%rdx
  802987:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80298b:	0f b6 00             	movzbl (%rax),%eax
  80298e:	88 45 ef             	mov    %al,-0x11(%rbp)
  802991:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  802995:	75 07                	jne    80299e <strstr+0x66>
  802997:	b8 00 00 00 00       	mov    $0x0,%eax
  80299c:	eb 33                	jmp    8029d1 <strstr+0x99>
  80299e:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  8029a2:	3a 45 ff             	cmp    -0x1(%rbp),%al
  8029a5:	75 d8                	jne    80297f <strstr+0x47>
  8029a7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8029ab:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  8029af:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8029b3:	48 89 ce             	mov    %rcx,%rsi
  8029b6:	48 89 c7             	mov    %rax,%rdi
  8029b9:	48 b8 2f 24 80 00 00 	movabs $0x80242f,%rax
  8029c0:	00 00 00 
  8029c3:	ff d0                	callq  *%rax
  8029c5:	85 c0                	test   %eax,%eax
  8029c7:	75 b6                	jne    80297f <strstr+0x47>
  8029c9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8029cd:	48 83 e8 01          	sub    $0x1,%rax
  8029d1:	c9                   	leaveq 
  8029d2:	c3                   	retq   

00000000008029d3 <syscall>:
  8029d3:	55                   	push   %rbp
  8029d4:	48 89 e5             	mov    %rsp,%rbp
  8029d7:	53                   	push   %rbx
  8029d8:	48 83 ec 48          	sub    $0x48,%rsp
  8029dc:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8029df:	89 75 d8             	mov    %esi,-0x28(%rbp)
  8029e2:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  8029e6:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  8029ea:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  8029ee:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  8029f2:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8029f5:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  8029f9:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  8029fd:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  802a01:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  802a05:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  802a09:	4c 89 c3             	mov    %r8,%rbx
  802a0c:	cd 30                	int    $0x30
  802a0e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802a12:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  802a16:	74 3e                	je     802a56 <syscall+0x83>
  802a18:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  802a1d:	7e 37                	jle    802a56 <syscall+0x83>
  802a1f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802a23:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802a26:	49 89 d0             	mov    %rdx,%r8
  802a29:	89 c1                	mov    %eax,%ecx
  802a2b:	48 ba 9b 71 80 00 00 	movabs $0x80719b,%rdx
  802a32:	00 00 00 
  802a35:	be 24 00 00 00       	mov    $0x24,%esi
  802a3a:	48 bf b8 71 80 00 00 	movabs $0x8071b8,%rdi
  802a41:	00 00 00 
  802a44:	b8 00 00 00 00       	mov    $0x0,%eax
  802a49:	49 b9 32 13 80 00 00 	movabs $0x801332,%r9
  802a50:	00 00 00 
  802a53:	41 ff d1             	callq  *%r9
  802a56:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802a5a:	48 83 c4 48          	add    $0x48,%rsp
  802a5e:	5b                   	pop    %rbx
  802a5f:	5d                   	pop    %rbp
  802a60:	c3                   	retq   

0000000000802a61 <sys_cputs>:
  802a61:	55                   	push   %rbp
  802a62:	48 89 e5             	mov    %rsp,%rbp
  802a65:	48 83 ec 20          	sub    $0x20,%rsp
  802a69:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802a6d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802a71:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802a75:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802a79:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802a80:	00 
  802a81:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802a87:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802a8d:	48 89 d1             	mov    %rdx,%rcx
  802a90:	48 89 c2             	mov    %rax,%rdx
  802a93:	be 00 00 00 00       	mov    $0x0,%esi
  802a98:	bf 00 00 00 00       	mov    $0x0,%edi
  802a9d:	48 b8 d3 29 80 00 00 	movabs $0x8029d3,%rax
  802aa4:	00 00 00 
  802aa7:	ff d0                	callq  *%rax
  802aa9:	c9                   	leaveq 
  802aaa:	c3                   	retq   

0000000000802aab <sys_cgetc>:
  802aab:	55                   	push   %rbp
  802aac:	48 89 e5             	mov    %rsp,%rbp
  802aaf:	48 83 ec 10          	sub    $0x10,%rsp
  802ab3:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802aba:	00 
  802abb:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802ac1:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802ac7:	b9 00 00 00 00       	mov    $0x0,%ecx
  802acc:	ba 00 00 00 00       	mov    $0x0,%edx
  802ad1:	be 00 00 00 00       	mov    $0x0,%esi
  802ad6:	bf 01 00 00 00       	mov    $0x1,%edi
  802adb:	48 b8 d3 29 80 00 00 	movabs $0x8029d3,%rax
  802ae2:	00 00 00 
  802ae5:	ff d0                	callq  *%rax
  802ae7:	c9                   	leaveq 
  802ae8:	c3                   	retq   

0000000000802ae9 <sys_env_destroy>:
  802ae9:	55                   	push   %rbp
  802aea:	48 89 e5             	mov    %rsp,%rbp
  802aed:	48 83 ec 10          	sub    $0x10,%rsp
  802af1:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802af4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802af7:	48 98                	cltq   
  802af9:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802b00:	00 
  802b01:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802b07:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802b0d:	b9 00 00 00 00       	mov    $0x0,%ecx
  802b12:	48 89 c2             	mov    %rax,%rdx
  802b15:	be 01 00 00 00       	mov    $0x1,%esi
  802b1a:	bf 03 00 00 00       	mov    $0x3,%edi
  802b1f:	48 b8 d3 29 80 00 00 	movabs $0x8029d3,%rax
  802b26:	00 00 00 
  802b29:	ff d0                	callq  *%rax
  802b2b:	c9                   	leaveq 
  802b2c:	c3                   	retq   

0000000000802b2d <sys_getenvid>:
  802b2d:	55                   	push   %rbp
  802b2e:	48 89 e5             	mov    %rsp,%rbp
  802b31:	48 83 ec 10          	sub    $0x10,%rsp
  802b35:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802b3c:	00 
  802b3d:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802b43:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802b49:	b9 00 00 00 00       	mov    $0x0,%ecx
  802b4e:	ba 00 00 00 00       	mov    $0x0,%edx
  802b53:	be 00 00 00 00       	mov    $0x0,%esi
  802b58:	bf 02 00 00 00       	mov    $0x2,%edi
  802b5d:	48 b8 d3 29 80 00 00 	movabs $0x8029d3,%rax
  802b64:	00 00 00 
  802b67:	ff d0                	callq  *%rax
  802b69:	c9                   	leaveq 
  802b6a:	c3                   	retq   

0000000000802b6b <sys_yield>:
  802b6b:	55                   	push   %rbp
  802b6c:	48 89 e5             	mov    %rsp,%rbp
  802b6f:	48 83 ec 10          	sub    $0x10,%rsp
  802b73:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802b7a:	00 
  802b7b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802b81:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802b87:	b9 00 00 00 00       	mov    $0x0,%ecx
  802b8c:	ba 00 00 00 00       	mov    $0x0,%edx
  802b91:	be 00 00 00 00       	mov    $0x0,%esi
  802b96:	bf 0b 00 00 00       	mov    $0xb,%edi
  802b9b:	48 b8 d3 29 80 00 00 	movabs $0x8029d3,%rax
  802ba2:	00 00 00 
  802ba5:	ff d0                	callq  *%rax
  802ba7:	c9                   	leaveq 
  802ba8:	c3                   	retq   

0000000000802ba9 <sys_page_alloc>:
  802ba9:	55                   	push   %rbp
  802baa:	48 89 e5             	mov    %rsp,%rbp
  802bad:	48 83 ec 20          	sub    $0x20,%rsp
  802bb1:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802bb4:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802bb8:	89 55 f8             	mov    %edx,-0x8(%rbp)
  802bbb:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802bbe:	48 63 c8             	movslq %eax,%rcx
  802bc1:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802bc5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802bc8:	48 98                	cltq   
  802bca:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802bd1:	00 
  802bd2:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802bd8:	49 89 c8             	mov    %rcx,%r8
  802bdb:	48 89 d1             	mov    %rdx,%rcx
  802bde:	48 89 c2             	mov    %rax,%rdx
  802be1:	be 01 00 00 00       	mov    $0x1,%esi
  802be6:	bf 04 00 00 00       	mov    $0x4,%edi
  802beb:	48 b8 d3 29 80 00 00 	movabs $0x8029d3,%rax
  802bf2:	00 00 00 
  802bf5:	ff d0                	callq  *%rax
  802bf7:	c9                   	leaveq 
  802bf8:	c3                   	retq   

0000000000802bf9 <sys_page_map>:
  802bf9:	55                   	push   %rbp
  802bfa:	48 89 e5             	mov    %rsp,%rbp
  802bfd:	48 83 ec 30          	sub    $0x30,%rsp
  802c01:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802c04:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802c08:	89 55 f8             	mov    %edx,-0x8(%rbp)
  802c0b:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  802c0f:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  802c13:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  802c16:	48 63 c8             	movslq %eax,%rcx
  802c19:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  802c1d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802c20:	48 63 f0             	movslq %eax,%rsi
  802c23:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802c27:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c2a:	48 98                	cltq   
  802c2c:	48 89 0c 24          	mov    %rcx,(%rsp)
  802c30:	49 89 f9             	mov    %rdi,%r9
  802c33:	49 89 f0             	mov    %rsi,%r8
  802c36:	48 89 d1             	mov    %rdx,%rcx
  802c39:	48 89 c2             	mov    %rax,%rdx
  802c3c:	be 01 00 00 00       	mov    $0x1,%esi
  802c41:	bf 05 00 00 00       	mov    $0x5,%edi
  802c46:	48 b8 d3 29 80 00 00 	movabs $0x8029d3,%rax
  802c4d:	00 00 00 
  802c50:	ff d0                	callq  *%rax
  802c52:	c9                   	leaveq 
  802c53:	c3                   	retq   

0000000000802c54 <sys_page_unmap>:
  802c54:	55                   	push   %rbp
  802c55:	48 89 e5             	mov    %rsp,%rbp
  802c58:	48 83 ec 20          	sub    $0x20,%rsp
  802c5c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802c5f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802c63:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802c67:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c6a:	48 98                	cltq   
  802c6c:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802c73:	00 
  802c74:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802c7a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802c80:	48 89 d1             	mov    %rdx,%rcx
  802c83:	48 89 c2             	mov    %rax,%rdx
  802c86:	be 01 00 00 00       	mov    $0x1,%esi
  802c8b:	bf 06 00 00 00       	mov    $0x6,%edi
  802c90:	48 b8 d3 29 80 00 00 	movabs $0x8029d3,%rax
  802c97:	00 00 00 
  802c9a:	ff d0                	callq  *%rax
  802c9c:	c9                   	leaveq 
  802c9d:	c3                   	retq   

0000000000802c9e <sys_env_set_status>:
  802c9e:	55                   	push   %rbp
  802c9f:	48 89 e5             	mov    %rsp,%rbp
  802ca2:	48 83 ec 10          	sub    $0x10,%rsp
  802ca6:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802ca9:	89 75 f8             	mov    %esi,-0x8(%rbp)
  802cac:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802caf:	48 63 d0             	movslq %eax,%rdx
  802cb2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802cb5:	48 98                	cltq   
  802cb7:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802cbe:	00 
  802cbf:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802cc5:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802ccb:	48 89 d1             	mov    %rdx,%rcx
  802cce:	48 89 c2             	mov    %rax,%rdx
  802cd1:	be 01 00 00 00       	mov    $0x1,%esi
  802cd6:	bf 08 00 00 00       	mov    $0x8,%edi
  802cdb:	48 b8 d3 29 80 00 00 	movabs $0x8029d3,%rax
  802ce2:	00 00 00 
  802ce5:	ff d0                	callq  *%rax
  802ce7:	c9                   	leaveq 
  802ce8:	c3                   	retq   

0000000000802ce9 <sys_env_set_trapframe>:
  802ce9:	55                   	push   %rbp
  802cea:	48 89 e5             	mov    %rsp,%rbp
  802ced:	48 83 ec 20          	sub    $0x20,%rsp
  802cf1:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802cf4:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802cf8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802cfc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802cff:	48 98                	cltq   
  802d01:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802d08:	00 
  802d09:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802d0f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802d15:	48 89 d1             	mov    %rdx,%rcx
  802d18:	48 89 c2             	mov    %rax,%rdx
  802d1b:	be 01 00 00 00       	mov    $0x1,%esi
  802d20:	bf 09 00 00 00       	mov    $0x9,%edi
  802d25:	48 b8 d3 29 80 00 00 	movabs $0x8029d3,%rax
  802d2c:	00 00 00 
  802d2f:	ff d0                	callq  *%rax
  802d31:	c9                   	leaveq 
  802d32:	c3                   	retq   

0000000000802d33 <sys_env_set_pgfault_upcall>:
  802d33:	55                   	push   %rbp
  802d34:	48 89 e5             	mov    %rsp,%rbp
  802d37:	48 83 ec 20          	sub    $0x20,%rsp
  802d3b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802d3e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802d42:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802d46:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d49:	48 98                	cltq   
  802d4b:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802d52:	00 
  802d53:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802d59:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802d5f:	48 89 d1             	mov    %rdx,%rcx
  802d62:	48 89 c2             	mov    %rax,%rdx
  802d65:	be 01 00 00 00       	mov    $0x1,%esi
  802d6a:	bf 0a 00 00 00       	mov    $0xa,%edi
  802d6f:	48 b8 d3 29 80 00 00 	movabs $0x8029d3,%rax
  802d76:	00 00 00 
  802d79:	ff d0                	callq  *%rax
  802d7b:	c9                   	leaveq 
  802d7c:	c3                   	retq   

0000000000802d7d <sys_ipc_try_send>:
  802d7d:	55                   	push   %rbp
  802d7e:	48 89 e5             	mov    %rsp,%rbp
  802d81:	48 83 ec 20          	sub    $0x20,%rsp
  802d85:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802d88:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802d8c:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  802d90:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  802d93:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802d96:	48 63 f0             	movslq %eax,%rsi
  802d99:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802d9d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802da0:	48 98                	cltq   
  802da2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802da6:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802dad:	00 
  802dae:	49 89 f1             	mov    %rsi,%r9
  802db1:	49 89 c8             	mov    %rcx,%r8
  802db4:	48 89 d1             	mov    %rdx,%rcx
  802db7:	48 89 c2             	mov    %rax,%rdx
  802dba:	be 00 00 00 00       	mov    $0x0,%esi
  802dbf:	bf 0c 00 00 00       	mov    $0xc,%edi
  802dc4:	48 b8 d3 29 80 00 00 	movabs $0x8029d3,%rax
  802dcb:	00 00 00 
  802dce:	ff d0                	callq  *%rax
  802dd0:	c9                   	leaveq 
  802dd1:	c3                   	retq   

0000000000802dd2 <sys_ipc_recv>:
  802dd2:	55                   	push   %rbp
  802dd3:	48 89 e5             	mov    %rsp,%rbp
  802dd6:	48 83 ec 10          	sub    $0x10,%rsp
  802dda:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802dde:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802de2:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802de9:	00 
  802dea:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802df0:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802df6:	b9 00 00 00 00       	mov    $0x0,%ecx
  802dfb:	48 89 c2             	mov    %rax,%rdx
  802dfe:	be 01 00 00 00       	mov    $0x1,%esi
  802e03:	bf 0d 00 00 00       	mov    $0xd,%edi
  802e08:	48 b8 d3 29 80 00 00 	movabs $0x8029d3,%rax
  802e0f:	00 00 00 
  802e12:	ff d0                	callq  *%rax
  802e14:	c9                   	leaveq 
  802e15:	c3                   	retq   

0000000000802e16 <sys_time_msec>:
  802e16:	55                   	push   %rbp
  802e17:	48 89 e5             	mov    %rsp,%rbp
  802e1a:	48 83 ec 10          	sub    $0x10,%rsp
  802e1e:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802e25:	00 
  802e26:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802e2c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802e32:	b9 00 00 00 00       	mov    $0x0,%ecx
  802e37:	ba 00 00 00 00       	mov    $0x0,%edx
  802e3c:	be 00 00 00 00       	mov    $0x0,%esi
  802e41:	bf 0e 00 00 00       	mov    $0xe,%edi
  802e46:	48 b8 d3 29 80 00 00 	movabs $0x8029d3,%rax
  802e4d:	00 00 00 
  802e50:	ff d0                	callq  *%rax
  802e52:	c9                   	leaveq 
  802e53:	c3                   	retq   

0000000000802e54 <sys_net_transmit>:
  802e54:	55                   	push   %rbp
  802e55:	48 89 e5             	mov    %rsp,%rbp
  802e58:	48 83 ec 20          	sub    $0x20,%rsp
  802e5c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802e60:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802e63:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802e66:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802e6a:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802e71:	00 
  802e72:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802e78:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802e7e:	48 89 d1             	mov    %rdx,%rcx
  802e81:	48 89 c2             	mov    %rax,%rdx
  802e84:	be 00 00 00 00       	mov    $0x0,%esi
  802e89:	bf 0f 00 00 00       	mov    $0xf,%edi
  802e8e:	48 b8 d3 29 80 00 00 	movabs $0x8029d3,%rax
  802e95:	00 00 00 
  802e98:	ff d0                	callq  *%rax
  802e9a:	c9                   	leaveq 
  802e9b:	c3                   	retq   

0000000000802e9c <sys_net_receive>:
  802e9c:	55                   	push   %rbp
  802e9d:	48 89 e5             	mov    %rsp,%rbp
  802ea0:	48 83 ec 20          	sub    $0x20,%rsp
  802ea4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802ea8:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802eab:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802eae:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802eb2:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802eb9:	00 
  802eba:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802ec0:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802ec6:	48 89 d1             	mov    %rdx,%rcx
  802ec9:	48 89 c2             	mov    %rax,%rdx
  802ecc:	be 00 00 00 00       	mov    $0x0,%esi
  802ed1:	bf 10 00 00 00       	mov    $0x10,%edi
  802ed6:	48 b8 d3 29 80 00 00 	movabs $0x8029d3,%rax
  802edd:	00 00 00 
  802ee0:	ff d0                	callq  *%rax
  802ee2:	c9                   	leaveq 
  802ee3:	c3                   	retq   

0000000000802ee4 <sys_ept_map>:
  802ee4:	55                   	push   %rbp
  802ee5:	48 89 e5             	mov    %rsp,%rbp
  802ee8:	48 83 ec 30          	sub    $0x30,%rsp
  802eec:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802eef:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802ef3:	89 55 f8             	mov    %edx,-0x8(%rbp)
  802ef6:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  802efa:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  802efe:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  802f01:	48 63 c8             	movslq %eax,%rcx
  802f04:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  802f08:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802f0b:	48 63 f0             	movslq %eax,%rsi
  802f0e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802f12:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f15:	48 98                	cltq   
  802f17:	48 89 0c 24          	mov    %rcx,(%rsp)
  802f1b:	49 89 f9             	mov    %rdi,%r9
  802f1e:	49 89 f0             	mov    %rsi,%r8
  802f21:	48 89 d1             	mov    %rdx,%rcx
  802f24:	48 89 c2             	mov    %rax,%rdx
  802f27:	be 00 00 00 00       	mov    $0x0,%esi
  802f2c:	bf 11 00 00 00       	mov    $0x11,%edi
  802f31:	48 b8 d3 29 80 00 00 	movabs $0x8029d3,%rax
  802f38:	00 00 00 
  802f3b:	ff d0                	callq  *%rax
  802f3d:	c9                   	leaveq 
  802f3e:	c3                   	retq   

0000000000802f3f <sys_env_mkguest>:
  802f3f:	55                   	push   %rbp
  802f40:	48 89 e5             	mov    %rsp,%rbp
  802f43:	48 83 ec 20          	sub    $0x20,%rsp
  802f47:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802f4b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802f4f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802f53:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802f57:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802f5e:	00 
  802f5f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802f65:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802f6b:	48 89 d1             	mov    %rdx,%rcx
  802f6e:	48 89 c2             	mov    %rax,%rdx
  802f71:	be 00 00 00 00       	mov    $0x0,%esi
  802f76:	bf 12 00 00 00       	mov    $0x12,%edi
  802f7b:	48 b8 d3 29 80 00 00 	movabs $0x8029d3,%rax
  802f82:	00 00 00 
  802f85:	ff d0                	callq  *%rax
  802f87:	c9                   	leaveq 
  802f88:	c3                   	retq   

0000000000802f89 <sys_vmx_list_vms>:
  802f89:	55                   	push   %rbp
  802f8a:	48 89 e5             	mov    %rsp,%rbp
  802f8d:	48 83 ec 10          	sub    $0x10,%rsp
  802f91:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802f98:	00 
  802f99:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802f9f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802fa5:	b9 00 00 00 00       	mov    $0x0,%ecx
  802faa:	ba 00 00 00 00       	mov    $0x0,%edx
  802faf:	be 00 00 00 00       	mov    $0x0,%esi
  802fb4:	bf 13 00 00 00       	mov    $0x13,%edi
  802fb9:	48 b8 d3 29 80 00 00 	movabs $0x8029d3,%rax
  802fc0:	00 00 00 
  802fc3:	ff d0                	callq  *%rax
  802fc5:	c9                   	leaveq 
  802fc6:	c3                   	retq   

0000000000802fc7 <sys_vmx_sel_resume>:
  802fc7:	55                   	push   %rbp
  802fc8:	48 89 e5             	mov    %rsp,%rbp
  802fcb:	48 83 ec 10          	sub    $0x10,%rsp
  802fcf:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802fd2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802fd5:	48 98                	cltq   
  802fd7:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802fde:	00 
  802fdf:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802fe5:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802feb:	b9 00 00 00 00       	mov    $0x0,%ecx
  802ff0:	48 89 c2             	mov    %rax,%rdx
  802ff3:	be 00 00 00 00       	mov    $0x0,%esi
  802ff8:	bf 14 00 00 00       	mov    $0x14,%edi
  802ffd:	48 b8 d3 29 80 00 00 	movabs $0x8029d3,%rax
  803004:	00 00 00 
  803007:	ff d0                	callq  *%rax
  803009:	c9                   	leaveq 
  80300a:	c3                   	retq   

000000000080300b <sys_vmx_get_vmdisk_number>:
  80300b:	55                   	push   %rbp
  80300c:	48 89 e5             	mov    %rsp,%rbp
  80300f:	48 83 ec 10          	sub    $0x10,%rsp
  803013:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80301a:	00 
  80301b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  803021:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  803027:	b9 00 00 00 00       	mov    $0x0,%ecx
  80302c:	ba 00 00 00 00       	mov    $0x0,%edx
  803031:	be 00 00 00 00       	mov    $0x0,%esi
  803036:	bf 15 00 00 00       	mov    $0x15,%edi
  80303b:	48 b8 d3 29 80 00 00 	movabs $0x8029d3,%rax
  803042:	00 00 00 
  803045:	ff d0                	callq  *%rax
  803047:	c9                   	leaveq 
  803048:	c3                   	retq   

0000000000803049 <sys_vmx_incr_vmdisk_number>:
  803049:	55                   	push   %rbp
  80304a:	48 89 e5             	mov    %rsp,%rbp
  80304d:	48 83 ec 10          	sub    $0x10,%rsp
  803051:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  803058:	00 
  803059:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80305f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  803065:	b9 00 00 00 00       	mov    $0x0,%ecx
  80306a:	ba 00 00 00 00       	mov    $0x0,%edx
  80306f:	be 00 00 00 00       	mov    $0x0,%esi
  803074:	bf 16 00 00 00       	mov    $0x16,%edi
  803079:	48 b8 d3 29 80 00 00 	movabs $0x8029d3,%rax
  803080:	00 00 00 
  803083:	ff d0                	callq  *%rax
  803085:	c9                   	leaveq 
  803086:	c3                   	retq   

0000000000803087 <pgfault>:
  803087:	55                   	push   %rbp
  803088:	48 89 e5             	mov    %rsp,%rbp
  80308b:	48 83 ec 30          	sub    $0x30,%rsp
  80308f:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803093:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803097:	48 8b 00             	mov    (%rax),%rax
  80309a:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80309e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8030a2:	48 8b 40 08          	mov    0x8(%rax),%rax
  8030a6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8030a9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030ac:	83 e0 02             	and    $0x2,%eax
  8030af:	85 c0                	test   %eax,%eax
  8030b1:	75 40                	jne    8030f3 <pgfault+0x6c>
  8030b3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8030b7:	48 8b 90 88 00 00 00 	mov    0x88(%rax),%rdx
  8030be:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8030c2:	49 89 d0             	mov    %rdx,%r8
  8030c5:	48 89 c1             	mov    %rax,%rcx
  8030c8:	48 ba d0 71 80 00 00 	movabs $0x8071d0,%rdx
  8030cf:	00 00 00 
  8030d2:	be 1f 00 00 00       	mov    $0x1f,%esi
  8030d7:	48 bf e9 71 80 00 00 	movabs $0x8071e9,%rdi
  8030de:	00 00 00 
  8030e1:	b8 00 00 00 00       	mov    $0x0,%eax
  8030e6:	49 b9 32 13 80 00 00 	movabs $0x801332,%r9
  8030ed:	00 00 00 
  8030f0:	41 ff d1             	callq  *%r9
  8030f3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8030f7:	48 c1 e8 0c          	shr    $0xc,%rax
  8030fb:	48 89 c2             	mov    %rax,%rdx
  8030fe:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  803105:	01 00 00 
  803108:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80310c:	25 07 08 00 00       	and    $0x807,%eax
  803111:	48 3d 05 08 00 00    	cmp    $0x805,%rax
  803117:	74 4e                	je     803167 <pgfault+0xe0>
  803119:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80311d:	48 c1 e8 0c          	shr    $0xc,%rax
  803121:	48 89 c2             	mov    %rax,%rdx
  803124:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80312b:	01 00 00 
  80312e:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  803132:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803136:	49 89 d0             	mov    %rdx,%r8
  803139:	48 89 c1             	mov    %rax,%rcx
  80313c:	48 ba f8 71 80 00 00 	movabs $0x8071f8,%rdx
  803143:	00 00 00 
  803146:	be 22 00 00 00       	mov    $0x22,%esi
  80314b:	48 bf e9 71 80 00 00 	movabs $0x8071e9,%rdi
  803152:	00 00 00 
  803155:	b8 00 00 00 00       	mov    $0x0,%eax
  80315a:	49 b9 32 13 80 00 00 	movabs $0x801332,%r9
  803161:	00 00 00 
  803164:	41 ff d1             	callq  *%r9
  803167:	ba 07 00 00 00       	mov    $0x7,%edx
  80316c:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  803171:	bf 00 00 00 00       	mov    $0x0,%edi
  803176:	48 b8 a9 2b 80 00 00 	movabs $0x802ba9,%rax
  80317d:	00 00 00 
  803180:	ff d0                	callq  *%rax
  803182:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803185:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803189:	79 30                	jns    8031bb <pgfault+0x134>
  80318b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80318e:	89 c1                	mov    %eax,%ecx
  803190:	48 ba 23 72 80 00 00 	movabs $0x807223,%rdx
  803197:	00 00 00 
  80319a:	be 30 00 00 00       	mov    $0x30,%esi
  80319f:	48 bf e9 71 80 00 00 	movabs $0x8071e9,%rdi
  8031a6:	00 00 00 
  8031a9:	b8 00 00 00 00       	mov    $0x0,%eax
  8031ae:	49 b8 32 13 80 00 00 	movabs $0x801332,%r8
  8031b5:	00 00 00 
  8031b8:	41 ff d0             	callq  *%r8
  8031bb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8031bf:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8031c3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8031c7:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  8031cd:	ba 00 10 00 00       	mov    $0x1000,%edx
  8031d2:	48 89 c6             	mov    %rax,%rsi
  8031d5:	bf 00 f0 5f 00       	mov    $0x5ff000,%edi
  8031da:	48 b8 9e 25 80 00 00 	movabs $0x80259e,%rax
  8031e1:	00 00 00 
  8031e4:	ff d0                	callq  *%rax
  8031e6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8031ea:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8031ee:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8031f2:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  8031f8:	41 b8 07 00 00 00    	mov    $0x7,%r8d
  8031fe:	48 89 c1             	mov    %rax,%rcx
  803201:	ba 00 00 00 00       	mov    $0x0,%edx
  803206:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  80320b:	bf 00 00 00 00       	mov    $0x0,%edi
  803210:	48 b8 f9 2b 80 00 00 	movabs $0x802bf9,%rax
  803217:	00 00 00 
  80321a:	ff d0                	callq  *%rax
  80321c:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80321f:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803223:	79 30                	jns    803255 <pgfault+0x1ce>
  803225:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803228:	89 c1                	mov    %eax,%ecx
  80322a:	48 ba 36 72 80 00 00 	movabs $0x807236,%rdx
  803231:	00 00 00 
  803234:	be 35 00 00 00       	mov    $0x35,%esi
  803239:	48 bf e9 71 80 00 00 	movabs $0x8071e9,%rdi
  803240:	00 00 00 
  803243:	b8 00 00 00 00       	mov    $0x0,%eax
  803248:	49 b8 32 13 80 00 00 	movabs $0x801332,%r8
  80324f:	00 00 00 
  803252:	41 ff d0             	callq  *%r8
  803255:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  80325a:	bf 00 00 00 00       	mov    $0x0,%edi
  80325f:	48 b8 54 2c 80 00 00 	movabs $0x802c54,%rax
  803266:	00 00 00 
  803269:	ff d0                	callq  *%rax
  80326b:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80326e:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803272:	79 30                	jns    8032a4 <pgfault+0x21d>
  803274:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803277:	89 c1                	mov    %eax,%ecx
  803279:	48 ba 47 72 80 00 00 	movabs $0x807247,%rdx
  803280:	00 00 00 
  803283:	be 39 00 00 00       	mov    $0x39,%esi
  803288:	48 bf e9 71 80 00 00 	movabs $0x8071e9,%rdi
  80328f:	00 00 00 
  803292:	b8 00 00 00 00       	mov    $0x0,%eax
  803297:	49 b8 32 13 80 00 00 	movabs $0x801332,%r8
  80329e:	00 00 00 
  8032a1:	41 ff d0             	callq  *%r8
  8032a4:	c9                   	leaveq 
  8032a5:	c3                   	retq   

00000000008032a6 <duppage>:
  8032a6:	55                   	push   %rbp
  8032a7:	48 89 e5             	mov    %rsp,%rbp
  8032aa:	48 83 ec 30          	sub    $0x30,%rsp
  8032ae:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8032b1:	89 75 d8             	mov    %esi,-0x28(%rbp)
  8032b4:	8b 45 d8             	mov    -0x28(%rbp),%eax
  8032b7:	c1 e0 0c             	shl    $0xc,%eax
  8032ba:	89 c0                	mov    %eax,%eax
  8032bc:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8032c0:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8032c7:	01 00 00 
  8032ca:	8b 55 d8             	mov    -0x28(%rbp),%edx
  8032cd:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8032d1:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8032d5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8032d9:	25 02 08 00 00       	and    $0x802,%eax
  8032de:	48 85 c0             	test   %rax,%rax
  8032e1:	74 0e                	je     8032f1 <duppage+0x4b>
  8032e3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8032e7:	25 00 04 00 00       	and    $0x400,%eax
  8032ec:	48 85 c0             	test   %rax,%rax
  8032ef:	74 70                	je     803361 <duppage+0xbb>
  8032f1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8032f5:	25 07 0e 00 00       	and    $0xe07,%eax
  8032fa:	89 c6                	mov    %eax,%esi
  8032fc:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  803300:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803303:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803307:	41 89 f0             	mov    %esi,%r8d
  80330a:	48 89 c6             	mov    %rax,%rsi
  80330d:	bf 00 00 00 00       	mov    $0x0,%edi
  803312:	48 b8 f9 2b 80 00 00 	movabs $0x802bf9,%rax
  803319:	00 00 00 
  80331c:	ff d0                	callq  *%rax
  80331e:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803321:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803325:	79 30                	jns    803357 <duppage+0xb1>
  803327:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80332a:	89 c1                	mov    %eax,%ecx
  80332c:	48 ba 36 72 80 00 00 	movabs $0x807236,%rdx
  803333:	00 00 00 
  803336:	be 63 00 00 00       	mov    $0x63,%esi
  80333b:	48 bf e9 71 80 00 00 	movabs $0x8071e9,%rdi
  803342:	00 00 00 
  803345:	b8 00 00 00 00       	mov    $0x0,%eax
  80334a:	49 b8 32 13 80 00 00 	movabs $0x801332,%r8
  803351:	00 00 00 
  803354:	41 ff d0             	callq  *%r8
  803357:	b8 00 00 00 00       	mov    $0x0,%eax
  80335c:	e9 c4 00 00 00       	jmpq   803425 <duppage+0x17f>
  803361:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  803365:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803368:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80336c:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  803372:	48 89 c6             	mov    %rax,%rsi
  803375:	bf 00 00 00 00       	mov    $0x0,%edi
  80337a:	48 b8 f9 2b 80 00 00 	movabs $0x802bf9,%rax
  803381:	00 00 00 
  803384:	ff d0                	callq  *%rax
  803386:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803389:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80338d:	79 30                	jns    8033bf <duppage+0x119>
  80338f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803392:	89 c1                	mov    %eax,%ecx
  803394:	48 ba 36 72 80 00 00 	movabs $0x807236,%rdx
  80339b:	00 00 00 
  80339e:	be 7e 00 00 00       	mov    $0x7e,%esi
  8033a3:	48 bf e9 71 80 00 00 	movabs $0x8071e9,%rdi
  8033aa:	00 00 00 
  8033ad:	b8 00 00 00 00       	mov    $0x0,%eax
  8033b2:	49 b8 32 13 80 00 00 	movabs $0x801332,%r8
  8033b9:	00 00 00 
  8033bc:	41 ff d0             	callq  *%r8
  8033bf:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8033c3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8033c7:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  8033cd:	48 89 d1             	mov    %rdx,%rcx
  8033d0:	ba 00 00 00 00       	mov    $0x0,%edx
  8033d5:	48 89 c6             	mov    %rax,%rsi
  8033d8:	bf 00 00 00 00       	mov    $0x0,%edi
  8033dd:	48 b8 f9 2b 80 00 00 	movabs $0x802bf9,%rax
  8033e4:	00 00 00 
  8033e7:	ff d0                	callq  *%rax
  8033e9:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8033ec:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8033f0:	79 30                	jns    803422 <duppage+0x17c>
  8033f2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8033f5:	89 c1                	mov    %eax,%ecx
  8033f7:	48 ba 36 72 80 00 00 	movabs $0x807236,%rdx
  8033fe:	00 00 00 
  803401:	be 80 00 00 00       	mov    $0x80,%esi
  803406:	48 bf e9 71 80 00 00 	movabs $0x8071e9,%rdi
  80340d:	00 00 00 
  803410:	b8 00 00 00 00       	mov    $0x0,%eax
  803415:	49 b8 32 13 80 00 00 	movabs $0x801332,%r8
  80341c:	00 00 00 
  80341f:	41 ff d0             	callq  *%r8
  803422:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803425:	c9                   	leaveq 
  803426:	c3                   	retq   

0000000000803427 <fork>:
  803427:	55                   	push   %rbp
  803428:	48 89 e5             	mov    %rsp,%rbp
  80342b:	48 83 ec 20          	sub    $0x20,%rsp
  80342f:	48 bf 87 30 80 00 00 	movabs $0x803087,%rdi
  803436:	00 00 00 
  803439:	48 b8 84 66 80 00 00 	movabs $0x806684,%rax
  803440:	00 00 00 
  803443:	ff d0                	callq  *%rax
  803445:	b8 07 00 00 00       	mov    $0x7,%eax
  80344a:	cd 30                	int    $0x30
  80344c:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80344f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803452:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803455:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803459:	79 08                	jns    803463 <fork+0x3c>
  80345b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80345e:	e9 09 02 00 00       	jmpq   80366c <fork+0x245>
  803463:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803467:	75 3e                	jne    8034a7 <fork+0x80>
  803469:	48 b8 2d 2b 80 00 00 	movabs $0x802b2d,%rax
  803470:	00 00 00 
  803473:	ff d0                	callq  *%rax
  803475:	25 ff 03 00 00       	and    $0x3ff,%eax
  80347a:	48 98                	cltq   
  80347c:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  803483:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80348a:	00 00 00 
  80348d:	48 01 c2             	add    %rax,%rdx
  803490:	48 b8 28 a4 80 00 00 	movabs $0x80a428,%rax
  803497:	00 00 00 
  80349a:	48 89 10             	mov    %rdx,(%rax)
  80349d:	b8 00 00 00 00       	mov    $0x0,%eax
  8034a2:	e9 c5 01 00 00       	jmpq   80366c <fork+0x245>
  8034a7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8034ae:	e9 a4 00 00 00       	jmpq   803557 <fork+0x130>
  8034b3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034b6:	c1 f8 12             	sar    $0x12,%eax
  8034b9:	89 c2                	mov    %eax,%edx
  8034bb:	48 b8 00 00 40 80 00 	movabs $0x10080400000,%rax
  8034c2:	01 00 00 
  8034c5:	48 63 d2             	movslq %edx,%rdx
  8034c8:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8034cc:	83 e0 01             	and    $0x1,%eax
  8034cf:	48 85 c0             	test   %rax,%rax
  8034d2:	74 21                	je     8034f5 <fork+0xce>
  8034d4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034d7:	c1 f8 09             	sar    $0x9,%eax
  8034da:	89 c2                	mov    %eax,%edx
  8034dc:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8034e3:	01 00 00 
  8034e6:	48 63 d2             	movslq %edx,%rdx
  8034e9:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8034ed:	83 e0 01             	and    $0x1,%eax
  8034f0:	48 85 c0             	test   %rax,%rax
  8034f3:	75 09                	jne    8034fe <fork+0xd7>
  8034f5:	81 45 fc 00 02 00 00 	addl   $0x200,-0x4(%rbp)
  8034fc:	eb 59                	jmp    803557 <fork+0x130>
  8034fe:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803501:	05 00 02 00 00       	add    $0x200,%eax
  803506:	89 45 f4             	mov    %eax,-0xc(%rbp)
  803509:	eb 44                	jmp    80354f <fork+0x128>
  80350b:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  803512:	01 00 00 
  803515:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803518:	48 63 d2             	movslq %edx,%rdx
  80351b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80351f:	83 e0 05             	and    $0x5,%eax
  803522:	48 83 f8 05          	cmp    $0x5,%rax
  803526:	74 02                	je     80352a <fork+0x103>
  803528:	eb 21                	jmp    80354b <fork+0x124>
  80352a:	81 7d fc ff f7 0e 00 	cmpl   $0xef7ff,-0x4(%rbp)
  803531:	75 02                	jne    803535 <fork+0x10e>
  803533:	eb 16                	jmp    80354b <fork+0x124>
  803535:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803538:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80353b:	89 d6                	mov    %edx,%esi
  80353d:	89 c7                	mov    %eax,%edi
  80353f:	48 b8 a6 32 80 00 00 	movabs $0x8032a6,%rax
  803546:	00 00 00 
  803549:	ff d0                	callq  *%rax
  80354b:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80354f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803552:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  803555:	7c b4                	jl     80350b <fork+0xe4>
  803557:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80355a:	3d ff 07 00 08       	cmp    $0x80007ff,%eax
  80355f:	0f 86 4e ff ff ff    	jbe    8034b3 <fork+0x8c>
  803565:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803568:	ba 07 00 00 00       	mov    $0x7,%edx
  80356d:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  803572:	89 c7                	mov    %eax,%edi
  803574:	48 b8 a9 2b 80 00 00 	movabs $0x802ba9,%rax
  80357b:	00 00 00 
  80357e:	ff d0                	callq  *%rax
  803580:	89 45 f0             	mov    %eax,-0x10(%rbp)
  803583:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  803587:	79 30                	jns    8035b9 <fork+0x192>
  803589:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80358c:	89 c1                	mov    %eax,%ecx
  80358e:	48 ba 60 72 80 00 00 	movabs $0x807260,%rdx
  803595:	00 00 00 
  803598:	be bc 00 00 00       	mov    $0xbc,%esi
  80359d:	48 bf e9 71 80 00 00 	movabs $0x8071e9,%rdi
  8035a4:	00 00 00 
  8035a7:	b8 00 00 00 00       	mov    $0x0,%eax
  8035ac:	49 b8 32 13 80 00 00 	movabs $0x801332,%r8
  8035b3:	00 00 00 
  8035b6:	41 ff d0             	callq  *%r8
  8035b9:	48 b8 28 a4 80 00 00 	movabs $0x80a428,%rax
  8035c0:	00 00 00 
  8035c3:	48 8b 00             	mov    (%rax),%rax
  8035c6:	48 8b 90 f0 00 00 00 	mov    0xf0(%rax),%rdx
  8035cd:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8035d0:	48 89 d6             	mov    %rdx,%rsi
  8035d3:	89 c7                	mov    %eax,%edi
  8035d5:	48 b8 33 2d 80 00 00 	movabs $0x802d33,%rax
  8035dc:	00 00 00 
  8035df:	ff d0                	callq  *%rax
  8035e1:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8035e4:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8035e8:	79 30                	jns    80361a <fork+0x1f3>
  8035ea:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8035ed:	89 c1                	mov    %eax,%ecx
  8035ef:	48 ba 80 72 80 00 00 	movabs $0x807280,%rdx
  8035f6:	00 00 00 
  8035f9:	be c0 00 00 00       	mov    $0xc0,%esi
  8035fe:	48 bf e9 71 80 00 00 	movabs $0x8071e9,%rdi
  803605:	00 00 00 
  803608:	b8 00 00 00 00       	mov    $0x0,%eax
  80360d:	49 b8 32 13 80 00 00 	movabs $0x801332,%r8
  803614:	00 00 00 
  803617:	41 ff d0             	callq  *%r8
  80361a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80361d:	be 02 00 00 00       	mov    $0x2,%esi
  803622:	89 c7                	mov    %eax,%edi
  803624:	48 b8 9e 2c 80 00 00 	movabs $0x802c9e,%rax
  80362b:	00 00 00 
  80362e:	ff d0                	callq  *%rax
  803630:	89 45 f0             	mov    %eax,-0x10(%rbp)
  803633:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  803637:	79 30                	jns    803669 <fork+0x242>
  803639:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80363c:	89 c1                	mov    %eax,%ecx
  80363e:	48 ba 9f 72 80 00 00 	movabs $0x80729f,%rdx
  803645:	00 00 00 
  803648:	be c5 00 00 00       	mov    $0xc5,%esi
  80364d:	48 bf e9 71 80 00 00 	movabs $0x8071e9,%rdi
  803654:	00 00 00 
  803657:	b8 00 00 00 00       	mov    $0x0,%eax
  80365c:	49 b8 32 13 80 00 00 	movabs $0x801332,%r8
  803663:	00 00 00 
  803666:	41 ff d0             	callq  *%r8
  803669:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80366c:	c9                   	leaveq 
  80366d:	c3                   	retq   

000000000080366e <sfork>:
  80366e:	55                   	push   %rbp
  80366f:	48 89 e5             	mov    %rsp,%rbp
  803672:	48 ba b6 72 80 00 00 	movabs $0x8072b6,%rdx
  803679:	00 00 00 
  80367c:	be d2 00 00 00       	mov    $0xd2,%esi
  803681:	48 bf e9 71 80 00 00 	movabs $0x8071e9,%rdi
  803688:	00 00 00 
  80368b:	b8 00 00 00 00       	mov    $0x0,%eax
  803690:	48 b9 32 13 80 00 00 	movabs $0x801332,%rcx
  803697:	00 00 00 
  80369a:	ff d1                	callq  *%rcx

000000000080369c <argstart>:
  80369c:	55                   	push   %rbp
  80369d:	48 89 e5             	mov    %rsp,%rbp
  8036a0:	48 83 ec 18          	sub    $0x18,%rsp
  8036a4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8036a8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8036ac:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8036b0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8036b4:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8036b8:	48 89 10             	mov    %rdx,(%rax)
  8036bb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8036bf:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8036c3:	48 89 50 08          	mov    %rdx,0x8(%rax)
  8036c7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8036cb:	8b 00                	mov    (%rax),%eax
  8036cd:	83 f8 01             	cmp    $0x1,%eax
  8036d0:	7e 13                	jle    8036e5 <argstart+0x49>
  8036d2:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
  8036d7:	74 0c                	je     8036e5 <argstart+0x49>
  8036d9:	48 b8 cc 72 80 00 00 	movabs $0x8072cc,%rax
  8036e0:	00 00 00 
  8036e3:	eb 05                	jmp    8036ea <argstart+0x4e>
  8036e5:	b8 00 00 00 00       	mov    $0x0,%eax
  8036ea:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8036ee:	48 89 42 10          	mov    %rax,0x10(%rdx)
  8036f2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8036f6:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
  8036fd:	00 
  8036fe:	c9                   	leaveq 
  8036ff:	c3                   	retq   

0000000000803700 <argnext>:
  803700:	55                   	push   %rbp
  803701:	48 89 e5             	mov    %rsp,%rbp
  803704:	48 83 ec 20          	sub    $0x20,%rsp
  803708:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80370c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803710:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
  803717:	00 
  803718:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80371c:	48 8b 40 10          	mov    0x10(%rax),%rax
  803720:	48 85 c0             	test   %rax,%rax
  803723:	75 0a                	jne    80372f <argnext+0x2f>
  803725:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  80372a:	e9 25 01 00 00       	jmpq   803854 <argnext+0x154>
  80372f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803733:	48 8b 40 10          	mov    0x10(%rax),%rax
  803737:	0f b6 00             	movzbl (%rax),%eax
  80373a:	84 c0                	test   %al,%al
  80373c:	0f 85 d7 00 00 00    	jne    803819 <argnext+0x119>
  803742:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803746:	48 8b 00             	mov    (%rax),%rax
  803749:	8b 00                	mov    (%rax),%eax
  80374b:	83 f8 01             	cmp    $0x1,%eax
  80374e:	0f 84 ef 00 00 00    	je     803843 <argnext+0x143>
  803754:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803758:	48 8b 40 08          	mov    0x8(%rax),%rax
  80375c:	48 83 c0 08          	add    $0x8,%rax
  803760:	48 8b 00             	mov    (%rax),%rax
  803763:	0f b6 00             	movzbl (%rax),%eax
  803766:	3c 2d                	cmp    $0x2d,%al
  803768:	0f 85 d5 00 00 00    	jne    803843 <argnext+0x143>
  80376e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803772:	48 8b 40 08          	mov    0x8(%rax),%rax
  803776:	48 83 c0 08          	add    $0x8,%rax
  80377a:	48 8b 00             	mov    (%rax),%rax
  80377d:	48 83 c0 01          	add    $0x1,%rax
  803781:	0f b6 00             	movzbl (%rax),%eax
  803784:	84 c0                	test   %al,%al
  803786:	0f 84 b7 00 00 00    	je     803843 <argnext+0x143>
  80378c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803790:	48 8b 40 08          	mov    0x8(%rax),%rax
  803794:	48 83 c0 08          	add    $0x8,%rax
  803798:	48 8b 00             	mov    (%rax),%rax
  80379b:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80379f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8037a3:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8037a7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8037ab:	48 8b 00             	mov    (%rax),%rax
  8037ae:	8b 00                	mov    (%rax),%eax
  8037b0:	83 e8 01             	sub    $0x1,%eax
  8037b3:	48 98                	cltq   
  8037b5:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8037bc:	00 
  8037bd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8037c1:	48 8b 40 08          	mov    0x8(%rax),%rax
  8037c5:	48 8d 48 10          	lea    0x10(%rax),%rcx
  8037c9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8037cd:	48 8b 40 08          	mov    0x8(%rax),%rax
  8037d1:	48 83 c0 08          	add    $0x8,%rax
  8037d5:	48 89 ce             	mov    %rcx,%rsi
  8037d8:	48 89 c7             	mov    %rax,%rdi
  8037db:	48 b8 9e 25 80 00 00 	movabs $0x80259e,%rax
  8037e2:	00 00 00 
  8037e5:	ff d0                	callq  *%rax
  8037e7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8037eb:	48 8b 00             	mov    (%rax),%rax
  8037ee:	8b 10                	mov    (%rax),%edx
  8037f0:	83 ea 01             	sub    $0x1,%edx
  8037f3:	89 10                	mov    %edx,(%rax)
  8037f5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8037f9:	48 8b 40 10          	mov    0x10(%rax),%rax
  8037fd:	0f b6 00             	movzbl (%rax),%eax
  803800:	3c 2d                	cmp    $0x2d,%al
  803802:	75 15                	jne    803819 <argnext+0x119>
  803804:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803808:	48 8b 40 10          	mov    0x10(%rax),%rax
  80380c:	48 83 c0 01          	add    $0x1,%rax
  803810:	0f b6 00             	movzbl (%rax),%eax
  803813:	84 c0                	test   %al,%al
  803815:	75 02                	jne    803819 <argnext+0x119>
  803817:	eb 2a                	jmp    803843 <argnext+0x143>
  803819:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80381d:	48 8b 40 10          	mov    0x10(%rax),%rax
  803821:	0f b6 00             	movzbl (%rax),%eax
  803824:	0f b6 c0             	movzbl %al,%eax
  803827:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80382a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80382e:	48 8b 40 10          	mov    0x10(%rax),%rax
  803832:	48 8d 50 01          	lea    0x1(%rax),%rdx
  803836:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80383a:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80383e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803841:	eb 11                	jmp    803854 <argnext+0x154>
  803843:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803847:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
  80384e:	00 
  80384f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  803854:	c9                   	leaveq 
  803855:	c3                   	retq   

0000000000803856 <argvalue>:
  803856:	55                   	push   %rbp
  803857:	48 89 e5             	mov    %rsp,%rbp
  80385a:	48 83 ec 10          	sub    $0x10,%rsp
  80385e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803862:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803866:	48 8b 40 18          	mov    0x18(%rax),%rax
  80386a:	48 85 c0             	test   %rax,%rax
  80386d:	74 0a                	je     803879 <argvalue+0x23>
  80386f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803873:	48 8b 40 18          	mov    0x18(%rax),%rax
  803877:	eb 13                	jmp    80388c <argvalue+0x36>
  803879:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80387d:	48 89 c7             	mov    %rax,%rdi
  803880:	48 b8 8e 38 80 00 00 	movabs $0x80388e,%rax
  803887:	00 00 00 
  80388a:	ff d0                	callq  *%rax
  80388c:	c9                   	leaveq 
  80388d:	c3                   	retq   

000000000080388e <argnextvalue>:
  80388e:	55                   	push   %rbp
  80388f:	48 89 e5             	mov    %rsp,%rbp
  803892:	53                   	push   %rbx
  803893:	48 83 ec 18          	sub    $0x18,%rsp
  803897:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80389b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80389f:	48 8b 40 10          	mov    0x10(%rax),%rax
  8038a3:	48 85 c0             	test   %rax,%rax
  8038a6:	75 0a                	jne    8038b2 <argnextvalue+0x24>
  8038a8:	b8 00 00 00 00       	mov    $0x0,%eax
  8038ad:	e9 c8 00 00 00       	jmpq   80397a <argnextvalue+0xec>
  8038b2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8038b6:	48 8b 40 10          	mov    0x10(%rax),%rax
  8038ba:	0f b6 00             	movzbl (%rax),%eax
  8038bd:	84 c0                	test   %al,%al
  8038bf:	74 27                	je     8038e8 <argnextvalue+0x5a>
  8038c1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8038c5:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8038c9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8038cd:	48 89 50 18          	mov    %rdx,0x18(%rax)
  8038d1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8038d5:	48 bb cc 72 80 00 00 	movabs $0x8072cc,%rbx
  8038dc:	00 00 00 
  8038df:	48 89 58 10          	mov    %rbx,0x10(%rax)
  8038e3:	e9 8a 00 00 00       	jmpq   803972 <argnextvalue+0xe4>
  8038e8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8038ec:	48 8b 00             	mov    (%rax),%rax
  8038ef:	8b 00                	mov    (%rax),%eax
  8038f1:	83 f8 01             	cmp    $0x1,%eax
  8038f4:	7e 64                	jle    80395a <argnextvalue+0xcc>
  8038f6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8038fa:	48 8b 40 08          	mov    0x8(%rax),%rax
  8038fe:	48 8b 50 08          	mov    0x8(%rax),%rdx
  803902:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803906:	48 89 50 18          	mov    %rdx,0x18(%rax)
  80390a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80390e:	48 8b 00             	mov    (%rax),%rax
  803911:	8b 00                	mov    (%rax),%eax
  803913:	83 e8 01             	sub    $0x1,%eax
  803916:	48 98                	cltq   
  803918:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  80391f:	00 
  803920:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803924:	48 8b 40 08          	mov    0x8(%rax),%rax
  803928:	48 8d 48 10          	lea    0x10(%rax),%rcx
  80392c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803930:	48 8b 40 08          	mov    0x8(%rax),%rax
  803934:	48 83 c0 08          	add    $0x8,%rax
  803938:	48 89 ce             	mov    %rcx,%rsi
  80393b:	48 89 c7             	mov    %rax,%rdi
  80393e:	48 b8 9e 25 80 00 00 	movabs $0x80259e,%rax
  803945:	00 00 00 
  803948:	ff d0                	callq  *%rax
  80394a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80394e:	48 8b 00             	mov    (%rax),%rax
  803951:	8b 10                	mov    (%rax),%edx
  803953:	83 ea 01             	sub    $0x1,%edx
  803956:	89 10                	mov    %edx,(%rax)
  803958:	eb 18                	jmp    803972 <argnextvalue+0xe4>
  80395a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80395e:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
  803965:	00 
  803966:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80396a:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
  803971:	00 
  803972:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803976:	48 8b 40 18          	mov    0x18(%rax),%rax
  80397a:	48 83 c4 18          	add    $0x18,%rsp
  80397e:	5b                   	pop    %rbx
  80397f:	5d                   	pop    %rbp
  803980:	c3                   	retq   

0000000000803981 <fd2num>:
  803981:	55                   	push   %rbp
  803982:	48 89 e5             	mov    %rsp,%rbp
  803985:	48 83 ec 08          	sub    $0x8,%rsp
  803989:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80398d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  803991:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  803998:	ff ff ff 
  80399b:	48 01 d0             	add    %rdx,%rax
  80399e:	48 c1 e8 0c          	shr    $0xc,%rax
  8039a2:	c9                   	leaveq 
  8039a3:	c3                   	retq   

00000000008039a4 <fd2data>:
  8039a4:	55                   	push   %rbp
  8039a5:	48 89 e5             	mov    %rsp,%rbp
  8039a8:	48 83 ec 08          	sub    $0x8,%rsp
  8039ac:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8039b0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8039b4:	48 89 c7             	mov    %rax,%rdi
  8039b7:	48 b8 81 39 80 00 00 	movabs $0x803981,%rax
  8039be:	00 00 00 
  8039c1:	ff d0                	callq  *%rax
  8039c3:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  8039c9:	48 c1 e0 0c          	shl    $0xc,%rax
  8039cd:	c9                   	leaveq 
  8039ce:	c3                   	retq   

00000000008039cf <fd_alloc>:
  8039cf:	55                   	push   %rbp
  8039d0:	48 89 e5             	mov    %rsp,%rbp
  8039d3:	48 83 ec 18          	sub    $0x18,%rsp
  8039d7:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8039db:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8039e2:	eb 6b                	jmp    803a4f <fd_alloc+0x80>
  8039e4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039e7:	48 98                	cltq   
  8039e9:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  8039ef:	48 c1 e0 0c          	shl    $0xc,%rax
  8039f3:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8039f7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8039fb:	48 c1 e8 15          	shr    $0x15,%rax
  8039ff:	48 89 c2             	mov    %rax,%rdx
  803a02:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  803a09:	01 00 00 
  803a0c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803a10:	83 e0 01             	and    $0x1,%eax
  803a13:	48 85 c0             	test   %rax,%rax
  803a16:	74 21                	je     803a39 <fd_alloc+0x6a>
  803a18:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a1c:	48 c1 e8 0c          	shr    $0xc,%rax
  803a20:	48 89 c2             	mov    %rax,%rdx
  803a23:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  803a2a:	01 00 00 
  803a2d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803a31:	83 e0 01             	and    $0x1,%eax
  803a34:	48 85 c0             	test   %rax,%rax
  803a37:	75 12                	jne    803a4b <fd_alloc+0x7c>
  803a39:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803a3d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803a41:	48 89 10             	mov    %rdx,(%rax)
  803a44:	b8 00 00 00 00       	mov    $0x0,%eax
  803a49:	eb 1a                	jmp    803a65 <fd_alloc+0x96>
  803a4b:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  803a4f:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  803a53:	7e 8f                	jle    8039e4 <fd_alloc+0x15>
  803a55:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803a59:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  803a60:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  803a65:	c9                   	leaveq 
  803a66:	c3                   	retq   

0000000000803a67 <fd_lookup>:
  803a67:	55                   	push   %rbp
  803a68:	48 89 e5             	mov    %rsp,%rbp
  803a6b:	48 83 ec 20          	sub    $0x20,%rsp
  803a6f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803a72:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803a76:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803a7a:	78 06                	js     803a82 <fd_lookup+0x1b>
  803a7c:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  803a80:	7e 07                	jle    803a89 <fd_lookup+0x22>
  803a82:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  803a87:	eb 6c                	jmp    803af5 <fd_lookup+0x8e>
  803a89:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803a8c:	48 98                	cltq   
  803a8e:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  803a94:	48 c1 e0 0c          	shl    $0xc,%rax
  803a98:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803a9c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803aa0:	48 c1 e8 15          	shr    $0x15,%rax
  803aa4:	48 89 c2             	mov    %rax,%rdx
  803aa7:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  803aae:	01 00 00 
  803ab1:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803ab5:	83 e0 01             	and    $0x1,%eax
  803ab8:	48 85 c0             	test   %rax,%rax
  803abb:	74 21                	je     803ade <fd_lookup+0x77>
  803abd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803ac1:	48 c1 e8 0c          	shr    $0xc,%rax
  803ac5:	48 89 c2             	mov    %rax,%rdx
  803ac8:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  803acf:	01 00 00 
  803ad2:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803ad6:	83 e0 01             	and    $0x1,%eax
  803ad9:	48 85 c0             	test   %rax,%rax
  803adc:	75 07                	jne    803ae5 <fd_lookup+0x7e>
  803ade:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  803ae3:	eb 10                	jmp    803af5 <fd_lookup+0x8e>
  803ae5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803ae9:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  803aed:	48 89 10             	mov    %rdx,(%rax)
  803af0:	b8 00 00 00 00       	mov    $0x0,%eax
  803af5:	c9                   	leaveq 
  803af6:	c3                   	retq   

0000000000803af7 <fd_close>:
  803af7:	55                   	push   %rbp
  803af8:	48 89 e5             	mov    %rsp,%rbp
  803afb:	48 83 ec 30          	sub    $0x30,%rsp
  803aff:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803b03:	89 f0                	mov    %esi,%eax
  803b05:	88 45 d4             	mov    %al,-0x2c(%rbp)
  803b08:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803b0c:	48 89 c7             	mov    %rax,%rdi
  803b0f:	48 b8 81 39 80 00 00 	movabs $0x803981,%rax
  803b16:	00 00 00 
  803b19:	ff d0                	callq  *%rax
  803b1b:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803b1f:	48 89 d6             	mov    %rdx,%rsi
  803b22:	89 c7                	mov    %eax,%edi
  803b24:	48 b8 67 3a 80 00 00 	movabs $0x803a67,%rax
  803b2b:	00 00 00 
  803b2e:	ff d0                	callq  *%rax
  803b30:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803b33:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803b37:	78 0a                	js     803b43 <fd_close+0x4c>
  803b39:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b3d:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  803b41:	74 12                	je     803b55 <fd_close+0x5e>
  803b43:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  803b47:	74 05                	je     803b4e <fd_close+0x57>
  803b49:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b4c:	eb 05                	jmp    803b53 <fd_close+0x5c>
  803b4e:	b8 00 00 00 00       	mov    $0x0,%eax
  803b53:	eb 69                	jmp    803bbe <fd_close+0xc7>
  803b55:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803b59:	8b 00                	mov    (%rax),%eax
  803b5b:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  803b5f:	48 89 d6             	mov    %rdx,%rsi
  803b62:	89 c7                	mov    %eax,%edi
  803b64:	48 b8 c0 3b 80 00 00 	movabs $0x803bc0,%rax
  803b6b:	00 00 00 
  803b6e:	ff d0                	callq  *%rax
  803b70:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803b73:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803b77:	78 2a                	js     803ba3 <fd_close+0xac>
  803b79:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803b7d:	48 8b 40 20          	mov    0x20(%rax),%rax
  803b81:	48 85 c0             	test   %rax,%rax
  803b84:	74 16                	je     803b9c <fd_close+0xa5>
  803b86:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803b8a:	48 8b 40 20          	mov    0x20(%rax),%rax
  803b8e:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803b92:	48 89 d7             	mov    %rdx,%rdi
  803b95:	ff d0                	callq  *%rax
  803b97:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803b9a:	eb 07                	jmp    803ba3 <fd_close+0xac>
  803b9c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803ba3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803ba7:	48 89 c6             	mov    %rax,%rsi
  803baa:	bf 00 00 00 00       	mov    $0x0,%edi
  803baf:	48 b8 54 2c 80 00 00 	movabs $0x802c54,%rax
  803bb6:	00 00 00 
  803bb9:	ff d0                	callq  *%rax
  803bbb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803bbe:	c9                   	leaveq 
  803bbf:	c3                   	retq   

0000000000803bc0 <dev_lookup>:
  803bc0:	55                   	push   %rbp
  803bc1:	48 89 e5             	mov    %rsp,%rbp
  803bc4:	48 83 ec 20          	sub    $0x20,%rsp
  803bc8:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803bcb:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803bcf:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803bd6:	eb 41                	jmp    803c19 <dev_lookup+0x59>
  803bd8:	48 b8 60 90 80 00 00 	movabs $0x809060,%rax
  803bdf:	00 00 00 
  803be2:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803be5:	48 63 d2             	movslq %edx,%rdx
  803be8:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803bec:	8b 00                	mov    (%rax),%eax
  803bee:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  803bf1:	75 22                	jne    803c15 <dev_lookup+0x55>
  803bf3:	48 b8 60 90 80 00 00 	movabs $0x809060,%rax
  803bfa:	00 00 00 
  803bfd:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803c00:	48 63 d2             	movslq %edx,%rdx
  803c03:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  803c07:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803c0b:	48 89 10             	mov    %rdx,(%rax)
  803c0e:	b8 00 00 00 00       	mov    $0x0,%eax
  803c13:	eb 60                	jmp    803c75 <dev_lookup+0xb5>
  803c15:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  803c19:	48 b8 60 90 80 00 00 	movabs $0x809060,%rax
  803c20:	00 00 00 
  803c23:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803c26:	48 63 d2             	movslq %edx,%rdx
  803c29:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803c2d:	48 85 c0             	test   %rax,%rax
  803c30:	75 a6                	jne    803bd8 <dev_lookup+0x18>
  803c32:	48 b8 28 a4 80 00 00 	movabs $0x80a428,%rax
  803c39:	00 00 00 
  803c3c:	48 8b 00             	mov    (%rax),%rax
  803c3f:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  803c45:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803c48:	89 c6                	mov    %eax,%esi
  803c4a:	48 bf d0 72 80 00 00 	movabs $0x8072d0,%rdi
  803c51:	00 00 00 
  803c54:	b8 00 00 00 00       	mov    $0x0,%eax
  803c59:	48 b9 6b 15 80 00 00 	movabs $0x80156b,%rcx
  803c60:	00 00 00 
  803c63:	ff d1                	callq  *%rcx
  803c65:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803c69:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  803c70:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  803c75:	c9                   	leaveq 
  803c76:	c3                   	retq   

0000000000803c77 <close>:
  803c77:	55                   	push   %rbp
  803c78:	48 89 e5             	mov    %rsp,%rbp
  803c7b:	48 83 ec 20          	sub    $0x20,%rsp
  803c7f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803c82:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803c86:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803c89:	48 89 d6             	mov    %rdx,%rsi
  803c8c:	89 c7                	mov    %eax,%edi
  803c8e:	48 b8 67 3a 80 00 00 	movabs $0x803a67,%rax
  803c95:	00 00 00 
  803c98:	ff d0                	callq  *%rax
  803c9a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803c9d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803ca1:	79 05                	jns    803ca8 <close+0x31>
  803ca3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ca6:	eb 18                	jmp    803cc0 <close+0x49>
  803ca8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803cac:	be 01 00 00 00       	mov    $0x1,%esi
  803cb1:	48 89 c7             	mov    %rax,%rdi
  803cb4:	48 b8 f7 3a 80 00 00 	movabs $0x803af7,%rax
  803cbb:	00 00 00 
  803cbe:	ff d0                	callq  *%rax
  803cc0:	c9                   	leaveq 
  803cc1:	c3                   	retq   

0000000000803cc2 <close_all>:
  803cc2:	55                   	push   %rbp
  803cc3:	48 89 e5             	mov    %rsp,%rbp
  803cc6:	48 83 ec 10          	sub    $0x10,%rsp
  803cca:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803cd1:	eb 15                	jmp    803ce8 <close_all+0x26>
  803cd3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803cd6:	89 c7                	mov    %eax,%edi
  803cd8:	48 b8 77 3c 80 00 00 	movabs $0x803c77,%rax
  803cdf:	00 00 00 
  803ce2:	ff d0                	callq  *%rax
  803ce4:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  803ce8:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  803cec:	7e e5                	jle    803cd3 <close_all+0x11>
  803cee:	c9                   	leaveq 
  803cef:	c3                   	retq   

0000000000803cf0 <dup>:
  803cf0:	55                   	push   %rbp
  803cf1:	48 89 e5             	mov    %rsp,%rbp
  803cf4:	48 83 ec 40          	sub    $0x40,%rsp
  803cf8:	89 7d cc             	mov    %edi,-0x34(%rbp)
  803cfb:	89 75 c8             	mov    %esi,-0x38(%rbp)
  803cfe:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  803d02:	8b 45 cc             	mov    -0x34(%rbp),%eax
  803d05:	48 89 d6             	mov    %rdx,%rsi
  803d08:	89 c7                	mov    %eax,%edi
  803d0a:	48 b8 67 3a 80 00 00 	movabs $0x803a67,%rax
  803d11:	00 00 00 
  803d14:	ff d0                	callq  *%rax
  803d16:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803d19:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803d1d:	79 08                	jns    803d27 <dup+0x37>
  803d1f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d22:	e9 70 01 00 00       	jmpq   803e97 <dup+0x1a7>
  803d27:	8b 45 c8             	mov    -0x38(%rbp),%eax
  803d2a:	89 c7                	mov    %eax,%edi
  803d2c:	48 b8 77 3c 80 00 00 	movabs $0x803c77,%rax
  803d33:	00 00 00 
  803d36:	ff d0                	callq  *%rax
  803d38:	8b 45 c8             	mov    -0x38(%rbp),%eax
  803d3b:	48 98                	cltq   
  803d3d:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  803d43:	48 c1 e0 0c          	shl    $0xc,%rax
  803d47:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803d4b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803d4f:	48 89 c7             	mov    %rax,%rdi
  803d52:	48 b8 a4 39 80 00 00 	movabs $0x8039a4,%rax
  803d59:	00 00 00 
  803d5c:	ff d0                	callq  *%rax
  803d5e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803d62:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803d66:	48 89 c7             	mov    %rax,%rdi
  803d69:	48 b8 a4 39 80 00 00 	movabs $0x8039a4,%rax
  803d70:	00 00 00 
  803d73:	ff d0                	callq  *%rax
  803d75:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803d79:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803d7d:	48 c1 e8 15          	shr    $0x15,%rax
  803d81:	48 89 c2             	mov    %rax,%rdx
  803d84:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  803d8b:	01 00 00 
  803d8e:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803d92:	83 e0 01             	and    $0x1,%eax
  803d95:	48 85 c0             	test   %rax,%rax
  803d98:	74 73                	je     803e0d <dup+0x11d>
  803d9a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803d9e:	48 c1 e8 0c          	shr    $0xc,%rax
  803da2:	48 89 c2             	mov    %rax,%rdx
  803da5:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  803dac:	01 00 00 
  803daf:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803db3:	83 e0 01             	and    $0x1,%eax
  803db6:	48 85 c0             	test   %rax,%rax
  803db9:	74 52                	je     803e0d <dup+0x11d>
  803dbb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803dbf:	48 c1 e8 0c          	shr    $0xc,%rax
  803dc3:	48 89 c2             	mov    %rax,%rdx
  803dc6:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  803dcd:	01 00 00 
  803dd0:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803dd4:	25 07 0e 00 00       	and    $0xe07,%eax
  803dd9:	89 c1                	mov    %eax,%ecx
  803ddb:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  803ddf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803de3:	41 89 c8             	mov    %ecx,%r8d
  803de6:	48 89 d1             	mov    %rdx,%rcx
  803de9:	ba 00 00 00 00       	mov    $0x0,%edx
  803dee:	48 89 c6             	mov    %rax,%rsi
  803df1:	bf 00 00 00 00       	mov    $0x0,%edi
  803df6:	48 b8 f9 2b 80 00 00 	movabs $0x802bf9,%rax
  803dfd:	00 00 00 
  803e00:	ff d0                	callq  *%rax
  803e02:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803e05:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803e09:	79 02                	jns    803e0d <dup+0x11d>
  803e0b:	eb 57                	jmp    803e64 <dup+0x174>
  803e0d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803e11:	48 c1 e8 0c          	shr    $0xc,%rax
  803e15:	48 89 c2             	mov    %rax,%rdx
  803e18:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  803e1f:	01 00 00 
  803e22:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803e26:	25 07 0e 00 00       	and    $0xe07,%eax
  803e2b:	89 c1                	mov    %eax,%ecx
  803e2d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803e31:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803e35:	41 89 c8             	mov    %ecx,%r8d
  803e38:	48 89 d1             	mov    %rdx,%rcx
  803e3b:	ba 00 00 00 00       	mov    $0x0,%edx
  803e40:	48 89 c6             	mov    %rax,%rsi
  803e43:	bf 00 00 00 00       	mov    $0x0,%edi
  803e48:	48 b8 f9 2b 80 00 00 	movabs $0x802bf9,%rax
  803e4f:	00 00 00 
  803e52:	ff d0                	callq  *%rax
  803e54:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803e57:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803e5b:	79 02                	jns    803e5f <dup+0x16f>
  803e5d:	eb 05                	jmp    803e64 <dup+0x174>
  803e5f:	8b 45 c8             	mov    -0x38(%rbp),%eax
  803e62:	eb 33                	jmp    803e97 <dup+0x1a7>
  803e64:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e68:	48 89 c6             	mov    %rax,%rsi
  803e6b:	bf 00 00 00 00       	mov    $0x0,%edi
  803e70:	48 b8 54 2c 80 00 00 	movabs $0x802c54,%rax
  803e77:	00 00 00 
  803e7a:	ff d0                	callq  *%rax
  803e7c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803e80:	48 89 c6             	mov    %rax,%rsi
  803e83:	bf 00 00 00 00       	mov    $0x0,%edi
  803e88:	48 b8 54 2c 80 00 00 	movabs $0x802c54,%rax
  803e8f:	00 00 00 
  803e92:	ff d0                	callq  *%rax
  803e94:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e97:	c9                   	leaveq 
  803e98:	c3                   	retq   

0000000000803e99 <read>:
  803e99:	55                   	push   %rbp
  803e9a:	48 89 e5             	mov    %rsp,%rbp
  803e9d:	48 83 ec 40          	sub    $0x40,%rsp
  803ea1:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803ea4:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803ea8:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803eac:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  803eb0:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803eb3:	48 89 d6             	mov    %rdx,%rsi
  803eb6:	89 c7                	mov    %eax,%edi
  803eb8:	48 b8 67 3a 80 00 00 	movabs $0x803a67,%rax
  803ebf:	00 00 00 
  803ec2:	ff d0                	callq  *%rax
  803ec4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803ec7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803ecb:	78 24                	js     803ef1 <read+0x58>
  803ecd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803ed1:	8b 00                	mov    (%rax),%eax
  803ed3:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803ed7:	48 89 d6             	mov    %rdx,%rsi
  803eda:	89 c7                	mov    %eax,%edi
  803edc:	48 b8 c0 3b 80 00 00 	movabs $0x803bc0,%rax
  803ee3:	00 00 00 
  803ee6:	ff d0                	callq  *%rax
  803ee8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803eeb:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803eef:	79 05                	jns    803ef6 <read+0x5d>
  803ef1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ef4:	eb 76                	jmp    803f6c <read+0xd3>
  803ef6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803efa:	8b 40 08             	mov    0x8(%rax),%eax
  803efd:	83 e0 03             	and    $0x3,%eax
  803f00:	83 f8 01             	cmp    $0x1,%eax
  803f03:	75 3a                	jne    803f3f <read+0xa6>
  803f05:	48 b8 28 a4 80 00 00 	movabs $0x80a428,%rax
  803f0c:	00 00 00 
  803f0f:	48 8b 00             	mov    (%rax),%rax
  803f12:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  803f18:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803f1b:	89 c6                	mov    %eax,%esi
  803f1d:	48 bf ef 72 80 00 00 	movabs $0x8072ef,%rdi
  803f24:	00 00 00 
  803f27:	b8 00 00 00 00       	mov    $0x0,%eax
  803f2c:	48 b9 6b 15 80 00 00 	movabs $0x80156b,%rcx
  803f33:	00 00 00 
  803f36:	ff d1                	callq  *%rcx
  803f38:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  803f3d:	eb 2d                	jmp    803f6c <read+0xd3>
  803f3f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f43:	48 8b 40 10          	mov    0x10(%rax),%rax
  803f47:	48 85 c0             	test   %rax,%rax
  803f4a:	75 07                	jne    803f53 <read+0xba>
  803f4c:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803f51:	eb 19                	jmp    803f6c <read+0xd3>
  803f53:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f57:	48 8b 40 10          	mov    0x10(%rax),%rax
  803f5b:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  803f5f:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803f63:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  803f67:	48 89 cf             	mov    %rcx,%rdi
  803f6a:	ff d0                	callq  *%rax
  803f6c:	c9                   	leaveq 
  803f6d:	c3                   	retq   

0000000000803f6e <readn>:
  803f6e:	55                   	push   %rbp
  803f6f:	48 89 e5             	mov    %rsp,%rbp
  803f72:	48 83 ec 30          	sub    $0x30,%rsp
  803f76:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803f79:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803f7d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803f81:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803f88:	eb 49                	jmp    803fd3 <readn+0x65>
  803f8a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f8d:	48 98                	cltq   
  803f8f:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803f93:	48 29 c2             	sub    %rax,%rdx
  803f96:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f99:	48 63 c8             	movslq %eax,%rcx
  803f9c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803fa0:	48 01 c1             	add    %rax,%rcx
  803fa3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803fa6:	48 89 ce             	mov    %rcx,%rsi
  803fa9:	89 c7                	mov    %eax,%edi
  803fab:	48 b8 99 3e 80 00 00 	movabs $0x803e99,%rax
  803fb2:	00 00 00 
  803fb5:	ff d0                	callq  *%rax
  803fb7:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803fba:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803fbe:	79 05                	jns    803fc5 <readn+0x57>
  803fc0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803fc3:	eb 1c                	jmp    803fe1 <readn+0x73>
  803fc5:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803fc9:	75 02                	jne    803fcd <readn+0x5f>
  803fcb:	eb 11                	jmp    803fde <readn+0x70>
  803fcd:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803fd0:	01 45 fc             	add    %eax,-0x4(%rbp)
  803fd3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803fd6:	48 98                	cltq   
  803fd8:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  803fdc:	72 ac                	jb     803f8a <readn+0x1c>
  803fde:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803fe1:	c9                   	leaveq 
  803fe2:	c3                   	retq   

0000000000803fe3 <write>:
  803fe3:	55                   	push   %rbp
  803fe4:	48 89 e5             	mov    %rsp,%rbp
  803fe7:	48 83 ec 40          	sub    $0x40,%rsp
  803feb:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803fee:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803ff2:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803ff6:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  803ffa:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803ffd:	48 89 d6             	mov    %rdx,%rsi
  804000:	89 c7                	mov    %eax,%edi
  804002:	48 b8 67 3a 80 00 00 	movabs $0x803a67,%rax
  804009:	00 00 00 
  80400c:	ff d0                	callq  *%rax
  80400e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804011:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804015:	78 24                	js     80403b <write+0x58>
  804017:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80401b:	8b 00                	mov    (%rax),%eax
  80401d:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  804021:	48 89 d6             	mov    %rdx,%rsi
  804024:	89 c7                	mov    %eax,%edi
  804026:	48 b8 c0 3b 80 00 00 	movabs $0x803bc0,%rax
  80402d:	00 00 00 
  804030:	ff d0                	callq  *%rax
  804032:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804035:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804039:	79 05                	jns    804040 <write+0x5d>
  80403b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80403e:	eb 75                	jmp    8040b5 <write+0xd2>
  804040:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804044:	8b 40 08             	mov    0x8(%rax),%eax
  804047:	83 e0 03             	and    $0x3,%eax
  80404a:	85 c0                	test   %eax,%eax
  80404c:	75 3a                	jne    804088 <write+0xa5>
  80404e:	48 b8 28 a4 80 00 00 	movabs $0x80a428,%rax
  804055:	00 00 00 
  804058:	48 8b 00             	mov    (%rax),%rax
  80405b:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  804061:	8b 55 dc             	mov    -0x24(%rbp),%edx
  804064:	89 c6                	mov    %eax,%esi
  804066:	48 bf 0b 73 80 00 00 	movabs $0x80730b,%rdi
  80406d:	00 00 00 
  804070:	b8 00 00 00 00       	mov    $0x0,%eax
  804075:	48 b9 6b 15 80 00 00 	movabs $0x80156b,%rcx
  80407c:	00 00 00 
  80407f:	ff d1                	callq  *%rcx
  804081:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  804086:	eb 2d                	jmp    8040b5 <write+0xd2>
  804088:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80408c:	48 8b 40 18          	mov    0x18(%rax),%rax
  804090:	48 85 c0             	test   %rax,%rax
  804093:	75 07                	jne    80409c <write+0xb9>
  804095:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80409a:	eb 19                	jmp    8040b5 <write+0xd2>
  80409c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8040a0:	48 8b 40 18          	mov    0x18(%rax),%rax
  8040a4:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8040a8:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8040ac:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  8040b0:	48 89 cf             	mov    %rcx,%rdi
  8040b3:	ff d0                	callq  *%rax
  8040b5:	c9                   	leaveq 
  8040b6:	c3                   	retq   

00000000008040b7 <seek>:
  8040b7:	55                   	push   %rbp
  8040b8:	48 89 e5             	mov    %rsp,%rbp
  8040bb:	48 83 ec 18          	sub    $0x18,%rsp
  8040bf:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8040c2:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8040c5:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8040c9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8040cc:	48 89 d6             	mov    %rdx,%rsi
  8040cf:	89 c7                	mov    %eax,%edi
  8040d1:	48 b8 67 3a 80 00 00 	movabs $0x803a67,%rax
  8040d8:	00 00 00 
  8040db:	ff d0                	callq  *%rax
  8040dd:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8040e0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8040e4:	79 05                	jns    8040eb <seek+0x34>
  8040e6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8040e9:	eb 0f                	jmp    8040fa <seek+0x43>
  8040eb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8040ef:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8040f2:	89 50 04             	mov    %edx,0x4(%rax)
  8040f5:	b8 00 00 00 00       	mov    $0x0,%eax
  8040fa:	c9                   	leaveq 
  8040fb:	c3                   	retq   

00000000008040fc <ftruncate>:
  8040fc:	55                   	push   %rbp
  8040fd:	48 89 e5             	mov    %rsp,%rbp
  804100:	48 83 ec 30          	sub    $0x30,%rsp
  804104:	89 7d dc             	mov    %edi,-0x24(%rbp)
  804107:	89 75 d8             	mov    %esi,-0x28(%rbp)
  80410a:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80410e:	8b 45 dc             	mov    -0x24(%rbp),%eax
  804111:	48 89 d6             	mov    %rdx,%rsi
  804114:	89 c7                	mov    %eax,%edi
  804116:	48 b8 67 3a 80 00 00 	movabs $0x803a67,%rax
  80411d:	00 00 00 
  804120:	ff d0                	callq  *%rax
  804122:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804125:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804129:	78 24                	js     80414f <ftruncate+0x53>
  80412b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80412f:	8b 00                	mov    (%rax),%eax
  804131:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  804135:	48 89 d6             	mov    %rdx,%rsi
  804138:	89 c7                	mov    %eax,%edi
  80413a:	48 b8 c0 3b 80 00 00 	movabs $0x803bc0,%rax
  804141:	00 00 00 
  804144:	ff d0                	callq  *%rax
  804146:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804149:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80414d:	79 05                	jns    804154 <ftruncate+0x58>
  80414f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804152:	eb 72                	jmp    8041c6 <ftruncate+0xca>
  804154:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804158:	8b 40 08             	mov    0x8(%rax),%eax
  80415b:	83 e0 03             	and    $0x3,%eax
  80415e:	85 c0                	test   %eax,%eax
  804160:	75 3a                	jne    80419c <ftruncate+0xa0>
  804162:	48 b8 28 a4 80 00 00 	movabs $0x80a428,%rax
  804169:	00 00 00 
  80416c:	48 8b 00             	mov    (%rax),%rax
  80416f:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  804175:	8b 55 dc             	mov    -0x24(%rbp),%edx
  804178:	89 c6                	mov    %eax,%esi
  80417a:	48 bf 28 73 80 00 00 	movabs $0x807328,%rdi
  804181:	00 00 00 
  804184:	b8 00 00 00 00       	mov    $0x0,%eax
  804189:	48 b9 6b 15 80 00 00 	movabs $0x80156b,%rcx
  804190:	00 00 00 
  804193:	ff d1                	callq  *%rcx
  804195:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80419a:	eb 2a                	jmp    8041c6 <ftruncate+0xca>
  80419c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8041a0:	48 8b 40 30          	mov    0x30(%rax),%rax
  8041a4:	48 85 c0             	test   %rax,%rax
  8041a7:	75 07                	jne    8041b0 <ftruncate+0xb4>
  8041a9:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8041ae:	eb 16                	jmp    8041c6 <ftruncate+0xca>
  8041b0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8041b4:	48 8b 40 30          	mov    0x30(%rax),%rax
  8041b8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8041bc:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  8041bf:	89 ce                	mov    %ecx,%esi
  8041c1:	48 89 d7             	mov    %rdx,%rdi
  8041c4:	ff d0                	callq  *%rax
  8041c6:	c9                   	leaveq 
  8041c7:	c3                   	retq   

00000000008041c8 <fstat>:
  8041c8:	55                   	push   %rbp
  8041c9:	48 89 e5             	mov    %rsp,%rbp
  8041cc:	48 83 ec 30          	sub    $0x30,%rsp
  8041d0:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8041d3:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8041d7:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8041db:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8041de:	48 89 d6             	mov    %rdx,%rsi
  8041e1:	89 c7                	mov    %eax,%edi
  8041e3:	48 b8 67 3a 80 00 00 	movabs $0x803a67,%rax
  8041ea:	00 00 00 
  8041ed:	ff d0                	callq  *%rax
  8041ef:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8041f2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8041f6:	78 24                	js     80421c <fstat+0x54>
  8041f8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8041fc:	8b 00                	mov    (%rax),%eax
  8041fe:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  804202:	48 89 d6             	mov    %rdx,%rsi
  804205:	89 c7                	mov    %eax,%edi
  804207:	48 b8 c0 3b 80 00 00 	movabs $0x803bc0,%rax
  80420e:	00 00 00 
  804211:	ff d0                	callq  *%rax
  804213:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804216:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80421a:	79 05                	jns    804221 <fstat+0x59>
  80421c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80421f:	eb 5e                	jmp    80427f <fstat+0xb7>
  804221:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804225:	48 8b 40 28          	mov    0x28(%rax),%rax
  804229:	48 85 c0             	test   %rax,%rax
  80422c:	75 07                	jne    804235 <fstat+0x6d>
  80422e:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  804233:	eb 4a                	jmp    80427f <fstat+0xb7>
  804235:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804239:	c6 00 00             	movb   $0x0,(%rax)
  80423c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804240:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  804247:	00 00 00 
  80424a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80424e:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  804255:	00 00 00 
  804258:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80425c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804260:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  804267:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80426b:	48 8b 40 28          	mov    0x28(%rax),%rax
  80426f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804273:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  804277:	48 89 ce             	mov    %rcx,%rsi
  80427a:	48 89 d7             	mov    %rdx,%rdi
  80427d:	ff d0                	callq  *%rax
  80427f:	c9                   	leaveq 
  804280:	c3                   	retq   

0000000000804281 <stat>:
  804281:	55                   	push   %rbp
  804282:	48 89 e5             	mov    %rsp,%rbp
  804285:	48 83 ec 20          	sub    $0x20,%rsp
  804289:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80428d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804291:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804295:	be 00 00 00 00       	mov    $0x0,%esi
  80429a:	48 89 c7             	mov    %rax,%rdi
  80429d:	48 b8 6f 43 80 00 00 	movabs $0x80436f,%rax
  8042a4:	00 00 00 
  8042a7:	ff d0                	callq  *%rax
  8042a9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8042ac:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8042b0:	79 05                	jns    8042b7 <stat+0x36>
  8042b2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8042b5:	eb 2f                	jmp    8042e6 <stat+0x65>
  8042b7:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8042bb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8042be:	48 89 d6             	mov    %rdx,%rsi
  8042c1:	89 c7                	mov    %eax,%edi
  8042c3:	48 b8 c8 41 80 00 00 	movabs $0x8041c8,%rax
  8042ca:	00 00 00 
  8042cd:	ff d0                	callq  *%rax
  8042cf:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8042d2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8042d5:	89 c7                	mov    %eax,%edi
  8042d7:	48 b8 77 3c 80 00 00 	movabs $0x803c77,%rax
  8042de:	00 00 00 
  8042e1:	ff d0                	callq  *%rax
  8042e3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8042e6:	c9                   	leaveq 
  8042e7:	c3                   	retq   

00000000008042e8 <fsipc>:
  8042e8:	55                   	push   %rbp
  8042e9:	48 89 e5             	mov    %rsp,%rbp
  8042ec:	48 83 ec 10          	sub    $0x10,%rsp
  8042f0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8042f3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8042f7:	48 b8 20 a4 80 00 00 	movabs $0x80a420,%rax
  8042fe:	00 00 00 
  804301:	8b 00                	mov    (%rax),%eax
  804303:	85 c0                	test   %eax,%eax
  804305:	75 1d                	jne    804324 <fsipc+0x3c>
  804307:	bf 01 00 00 00       	mov    $0x1,%edi
  80430c:	48 b8 03 69 80 00 00 	movabs $0x806903,%rax
  804313:	00 00 00 
  804316:	ff d0                	callq  *%rax
  804318:	48 ba 20 a4 80 00 00 	movabs $0x80a420,%rdx
  80431f:	00 00 00 
  804322:	89 02                	mov    %eax,(%rdx)
  804324:	48 b8 20 a4 80 00 00 	movabs $0x80a420,%rax
  80432b:	00 00 00 
  80432e:	8b 00                	mov    (%rax),%eax
  804330:	8b 75 fc             	mov    -0x4(%rbp),%esi
  804333:	b9 07 00 00 00       	mov    $0x7,%ecx
  804338:	48 ba 00 b0 80 00 00 	movabs $0x80b000,%rdx
  80433f:	00 00 00 
  804342:	89 c7                	mov    %eax,%edi
  804344:	48 b8 6d 68 80 00 00 	movabs $0x80686d,%rax
  80434b:	00 00 00 
  80434e:	ff d0                	callq  *%rax
  804350:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804354:	ba 00 00 00 00       	mov    $0x0,%edx
  804359:	48 89 c6             	mov    %rax,%rsi
  80435c:	bf 00 00 00 00       	mov    $0x0,%edi
  804361:	48 b8 ac 67 80 00 00 	movabs $0x8067ac,%rax
  804368:	00 00 00 
  80436b:	ff d0                	callq  *%rax
  80436d:	c9                   	leaveq 
  80436e:	c3                   	retq   

000000000080436f <open>:
  80436f:	55                   	push   %rbp
  804370:	48 89 e5             	mov    %rsp,%rbp
  804373:	48 83 ec 20          	sub    $0x20,%rsp
  804377:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80437b:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80437e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804382:	48 89 c7             	mov    %rax,%rdi
  804385:	48 b8 0e 22 80 00 00 	movabs $0x80220e,%rax
  80438c:	00 00 00 
  80438f:	ff d0                	callq  *%rax
  804391:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  804396:	7e 0a                	jle    8043a2 <open+0x33>
  804398:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  80439d:	e9 a5 00 00 00       	jmpq   804447 <open+0xd8>
  8043a2:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8043a6:	48 89 c7             	mov    %rax,%rdi
  8043a9:	48 b8 cf 39 80 00 00 	movabs $0x8039cf,%rax
  8043b0:	00 00 00 
  8043b3:	ff d0                	callq  *%rax
  8043b5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8043b8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8043bc:	79 08                	jns    8043c6 <open+0x57>
  8043be:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8043c1:	e9 81 00 00 00       	jmpq   804447 <open+0xd8>
  8043c6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8043ca:	48 89 c6             	mov    %rax,%rsi
  8043cd:	48 bf 00 b0 80 00 00 	movabs $0x80b000,%rdi
  8043d4:	00 00 00 
  8043d7:	48 b8 7a 22 80 00 00 	movabs $0x80227a,%rax
  8043de:	00 00 00 
  8043e1:	ff d0                	callq  *%rax
  8043e3:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8043ea:	00 00 00 
  8043ed:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8043f0:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  8043f6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8043fa:	48 89 c6             	mov    %rax,%rsi
  8043fd:	bf 01 00 00 00       	mov    $0x1,%edi
  804402:	48 b8 e8 42 80 00 00 	movabs $0x8042e8,%rax
  804409:	00 00 00 
  80440c:	ff d0                	callq  *%rax
  80440e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804411:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804415:	79 1d                	jns    804434 <open+0xc5>
  804417:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80441b:	be 00 00 00 00       	mov    $0x0,%esi
  804420:	48 89 c7             	mov    %rax,%rdi
  804423:	48 b8 f7 3a 80 00 00 	movabs $0x803af7,%rax
  80442a:	00 00 00 
  80442d:	ff d0                	callq  *%rax
  80442f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804432:	eb 13                	jmp    804447 <open+0xd8>
  804434:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804438:	48 89 c7             	mov    %rax,%rdi
  80443b:	48 b8 81 39 80 00 00 	movabs $0x803981,%rax
  804442:	00 00 00 
  804445:	ff d0                	callq  *%rax
  804447:	c9                   	leaveq 
  804448:	c3                   	retq   

0000000000804449 <devfile_flush>:
  804449:	55                   	push   %rbp
  80444a:	48 89 e5             	mov    %rsp,%rbp
  80444d:	48 83 ec 10          	sub    $0x10,%rsp
  804451:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804455:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804459:	8b 50 0c             	mov    0xc(%rax),%edx
  80445c:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804463:	00 00 00 
  804466:	89 10                	mov    %edx,(%rax)
  804468:	be 00 00 00 00       	mov    $0x0,%esi
  80446d:	bf 06 00 00 00       	mov    $0x6,%edi
  804472:	48 b8 e8 42 80 00 00 	movabs $0x8042e8,%rax
  804479:	00 00 00 
  80447c:	ff d0                	callq  *%rax
  80447e:	c9                   	leaveq 
  80447f:	c3                   	retq   

0000000000804480 <devfile_read>:
  804480:	55                   	push   %rbp
  804481:	48 89 e5             	mov    %rsp,%rbp
  804484:	48 83 ec 30          	sub    $0x30,%rsp
  804488:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80448c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804490:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804494:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804498:	8b 50 0c             	mov    0xc(%rax),%edx
  80449b:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8044a2:	00 00 00 
  8044a5:	89 10                	mov    %edx,(%rax)
  8044a7:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8044ae:	00 00 00 
  8044b1:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8044b5:	48 89 50 08          	mov    %rdx,0x8(%rax)
  8044b9:	be 00 00 00 00       	mov    $0x0,%esi
  8044be:	bf 03 00 00 00       	mov    $0x3,%edi
  8044c3:	48 b8 e8 42 80 00 00 	movabs $0x8042e8,%rax
  8044ca:	00 00 00 
  8044cd:	ff d0                	callq  *%rax
  8044cf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8044d2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8044d6:	79 08                	jns    8044e0 <devfile_read+0x60>
  8044d8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8044db:	e9 a4 00 00 00       	jmpq   804584 <devfile_read+0x104>
  8044e0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8044e3:	48 98                	cltq   
  8044e5:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8044e9:	76 35                	jbe    804520 <devfile_read+0xa0>
  8044eb:	48 b9 4e 73 80 00 00 	movabs $0x80734e,%rcx
  8044f2:	00 00 00 
  8044f5:	48 ba 55 73 80 00 00 	movabs $0x807355,%rdx
  8044fc:	00 00 00 
  8044ff:	be 89 00 00 00       	mov    $0x89,%esi
  804504:	48 bf 6a 73 80 00 00 	movabs $0x80736a,%rdi
  80450b:	00 00 00 
  80450e:	b8 00 00 00 00       	mov    $0x0,%eax
  804513:	49 b8 32 13 80 00 00 	movabs $0x801332,%r8
  80451a:	00 00 00 
  80451d:	41 ff d0             	callq  *%r8
  804520:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  804527:	7e 35                	jle    80455e <devfile_read+0xde>
  804529:	48 b9 78 73 80 00 00 	movabs $0x807378,%rcx
  804530:	00 00 00 
  804533:	48 ba 55 73 80 00 00 	movabs $0x807355,%rdx
  80453a:	00 00 00 
  80453d:	be 8a 00 00 00       	mov    $0x8a,%esi
  804542:	48 bf 6a 73 80 00 00 	movabs $0x80736a,%rdi
  804549:	00 00 00 
  80454c:	b8 00 00 00 00       	mov    $0x0,%eax
  804551:	49 b8 32 13 80 00 00 	movabs $0x801332,%r8
  804558:	00 00 00 
  80455b:	41 ff d0             	callq  *%r8
  80455e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804561:	48 63 d0             	movslq %eax,%rdx
  804564:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804568:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  80456f:	00 00 00 
  804572:	48 89 c7             	mov    %rax,%rdi
  804575:	48 b8 9e 25 80 00 00 	movabs $0x80259e,%rax
  80457c:	00 00 00 
  80457f:	ff d0                	callq  *%rax
  804581:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804584:	c9                   	leaveq 
  804585:	c3                   	retq   

0000000000804586 <devfile_write>:
  804586:	55                   	push   %rbp
  804587:	48 89 e5             	mov    %rsp,%rbp
  80458a:	48 83 ec 40          	sub    $0x40,%rsp
  80458e:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804592:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804596:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80459a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80459e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8045a2:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  8045a9:	00 
  8045aa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8045ae:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  8045b2:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  8045b7:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  8045bb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8045bf:	8b 50 0c             	mov    0xc(%rax),%edx
  8045c2:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8045c9:	00 00 00 
  8045cc:	89 10                	mov    %edx,(%rax)
  8045ce:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8045d5:	00 00 00 
  8045d8:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8045dc:	48 89 50 08          	mov    %rdx,0x8(%rax)
  8045e0:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8045e4:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8045e8:	48 89 c6             	mov    %rax,%rsi
  8045eb:	48 bf 10 b0 80 00 00 	movabs $0x80b010,%rdi
  8045f2:	00 00 00 
  8045f5:	48 b8 9e 25 80 00 00 	movabs $0x80259e,%rax
  8045fc:	00 00 00 
  8045ff:	ff d0                	callq  *%rax
  804601:	be 00 00 00 00       	mov    $0x0,%esi
  804606:	bf 04 00 00 00       	mov    $0x4,%edi
  80460b:	48 b8 e8 42 80 00 00 	movabs $0x8042e8,%rax
  804612:	00 00 00 
  804615:	ff d0                	callq  *%rax
  804617:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80461a:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80461e:	79 05                	jns    804625 <devfile_write+0x9f>
  804620:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804623:	eb 43                	jmp    804668 <devfile_write+0xe2>
  804625:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804628:	48 98                	cltq   
  80462a:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  80462e:	76 35                	jbe    804665 <devfile_write+0xdf>
  804630:	48 b9 4e 73 80 00 00 	movabs $0x80734e,%rcx
  804637:	00 00 00 
  80463a:	48 ba 55 73 80 00 00 	movabs $0x807355,%rdx
  804641:	00 00 00 
  804644:	be a8 00 00 00       	mov    $0xa8,%esi
  804649:	48 bf 6a 73 80 00 00 	movabs $0x80736a,%rdi
  804650:	00 00 00 
  804653:	b8 00 00 00 00       	mov    $0x0,%eax
  804658:	49 b8 32 13 80 00 00 	movabs $0x801332,%r8
  80465f:	00 00 00 
  804662:	41 ff d0             	callq  *%r8
  804665:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804668:	c9                   	leaveq 
  804669:	c3                   	retq   

000000000080466a <devfile_stat>:
  80466a:	55                   	push   %rbp
  80466b:	48 89 e5             	mov    %rsp,%rbp
  80466e:	48 83 ec 20          	sub    $0x20,%rsp
  804672:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804676:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80467a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80467e:	8b 50 0c             	mov    0xc(%rax),%edx
  804681:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804688:	00 00 00 
  80468b:	89 10                	mov    %edx,(%rax)
  80468d:	be 00 00 00 00       	mov    $0x0,%esi
  804692:	bf 05 00 00 00       	mov    $0x5,%edi
  804697:	48 b8 e8 42 80 00 00 	movabs $0x8042e8,%rax
  80469e:	00 00 00 
  8046a1:	ff d0                	callq  *%rax
  8046a3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8046a6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8046aa:	79 05                	jns    8046b1 <devfile_stat+0x47>
  8046ac:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8046af:	eb 56                	jmp    804707 <devfile_stat+0x9d>
  8046b1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8046b5:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  8046bc:	00 00 00 
  8046bf:	48 89 c7             	mov    %rax,%rdi
  8046c2:	48 b8 7a 22 80 00 00 	movabs $0x80227a,%rax
  8046c9:	00 00 00 
  8046cc:	ff d0                	callq  *%rax
  8046ce:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8046d5:	00 00 00 
  8046d8:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  8046de:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8046e2:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  8046e8:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8046ef:	00 00 00 
  8046f2:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  8046f8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8046fc:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  804702:	b8 00 00 00 00       	mov    $0x0,%eax
  804707:	c9                   	leaveq 
  804708:	c3                   	retq   

0000000000804709 <devfile_trunc>:
  804709:	55                   	push   %rbp
  80470a:	48 89 e5             	mov    %rsp,%rbp
  80470d:	48 83 ec 10          	sub    $0x10,%rsp
  804711:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804715:	89 75 f4             	mov    %esi,-0xc(%rbp)
  804718:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80471c:	8b 50 0c             	mov    0xc(%rax),%edx
  80471f:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804726:	00 00 00 
  804729:	89 10                	mov    %edx,(%rax)
  80472b:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804732:	00 00 00 
  804735:	8b 55 f4             	mov    -0xc(%rbp),%edx
  804738:	89 50 04             	mov    %edx,0x4(%rax)
  80473b:	be 00 00 00 00       	mov    $0x0,%esi
  804740:	bf 02 00 00 00       	mov    $0x2,%edi
  804745:	48 b8 e8 42 80 00 00 	movabs $0x8042e8,%rax
  80474c:	00 00 00 
  80474f:	ff d0                	callq  *%rax
  804751:	c9                   	leaveq 
  804752:	c3                   	retq   

0000000000804753 <remove>:
  804753:	55                   	push   %rbp
  804754:	48 89 e5             	mov    %rsp,%rbp
  804757:	48 83 ec 10          	sub    $0x10,%rsp
  80475b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80475f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804763:	48 89 c7             	mov    %rax,%rdi
  804766:	48 b8 0e 22 80 00 00 	movabs $0x80220e,%rax
  80476d:	00 00 00 
  804770:	ff d0                	callq  *%rax
  804772:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  804777:	7e 07                	jle    804780 <remove+0x2d>
  804779:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  80477e:	eb 33                	jmp    8047b3 <remove+0x60>
  804780:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804784:	48 89 c6             	mov    %rax,%rsi
  804787:	48 bf 00 b0 80 00 00 	movabs $0x80b000,%rdi
  80478e:	00 00 00 
  804791:	48 b8 7a 22 80 00 00 	movabs $0x80227a,%rax
  804798:	00 00 00 
  80479b:	ff d0                	callq  *%rax
  80479d:	be 00 00 00 00       	mov    $0x0,%esi
  8047a2:	bf 07 00 00 00       	mov    $0x7,%edi
  8047a7:	48 b8 e8 42 80 00 00 	movabs $0x8042e8,%rax
  8047ae:	00 00 00 
  8047b1:	ff d0                	callq  *%rax
  8047b3:	c9                   	leaveq 
  8047b4:	c3                   	retq   

00000000008047b5 <sync>:
  8047b5:	55                   	push   %rbp
  8047b6:	48 89 e5             	mov    %rsp,%rbp
  8047b9:	be 00 00 00 00       	mov    $0x0,%esi
  8047be:	bf 08 00 00 00       	mov    $0x8,%edi
  8047c3:	48 b8 e8 42 80 00 00 	movabs $0x8042e8,%rax
  8047ca:	00 00 00 
  8047cd:	ff d0                	callq  *%rax
  8047cf:	5d                   	pop    %rbp
  8047d0:	c3                   	retq   

00000000008047d1 <copy>:
  8047d1:	55                   	push   %rbp
  8047d2:	48 89 e5             	mov    %rsp,%rbp
  8047d5:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  8047dc:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  8047e3:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  8047ea:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  8047f1:	be 00 00 00 00       	mov    $0x0,%esi
  8047f6:	48 89 c7             	mov    %rax,%rdi
  8047f9:	48 b8 6f 43 80 00 00 	movabs $0x80436f,%rax
  804800:	00 00 00 
  804803:	ff d0                	callq  *%rax
  804805:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804808:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80480c:	79 28                	jns    804836 <copy+0x65>
  80480e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804811:	89 c6                	mov    %eax,%esi
  804813:	48 bf 84 73 80 00 00 	movabs $0x807384,%rdi
  80481a:	00 00 00 
  80481d:	b8 00 00 00 00       	mov    $0x0,%eax
  804822:	48 ba 6b 15 80 00 00 	movabs $0x80156b,%rdx
  804829:	00 00 00 
  80482c:	ff d2                	callq  *%rdx
  80482e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804831:	e9 74 01 00 00       	jmpq   8049aa <copy+0x1d9>
  804836:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  80483d:	be 01 01 00 00       	mov    $0x101,%esi
  804842:	48 89 c7             	mov    %rax,%rdi
  804845:	48 b8 6f 43 80 00 00 	movabs $0x80436f,%rax
  80484c:	00 00 00 
  80484f:	ff d0                	callq  *%rax
  804851:	89 45 f8             	mov    %eax,-0x8(%rbp)
  804854:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  804858:	79 39                	jns    804893 <copy+0xc2>
  80485a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80485d:	89 c6                	mov    %eax,%esi
  80485f:	48 bf 9a 73 80 00 00 	movabs $0x80739a,%rdi
  804866:	00 00 00 
  804869:	b8 00 00 00 00       	mov    $0x0,%eax
  80486e:	48 ba 6b 15 80 00 00 	movabs $0x80156b,%rdx
  804875:	00 00 00 
  804878:	ff d2                	callq  *%rdx
  80487a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80487d:	89 c7                	mov    %eax,%edi
  80487f:	48 b8 77 3c 80 00 00 	movabs $0x803c77,%rax
  804886:	00 00 00 
  804889:	ff d0                	callq  *%rax
  80488b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80488e:	e9 17 01 00 00       	jmpq   8049aa <copy+0x1d9>
  804893:	eb 74                	jmp    804909 <copy+0x138>
  804895:	8b 45 f4             	mov    -0xc(%rbp),%eax
  804898:	48 63 d0             	movslq %eax,%rdx
  80489b:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  8048a2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8048a5:	48 89 ce             	mov    %rcx,%rsi
  8048a8:	89 c7                	mov    %eax,%edi
  8048aa:	48 b8 e3 3f 80 00 00 	movabs $0x803fe3,%rax
  8048b1:	00 00 00 
  8048b4:	ff d0                	callq  *%rax
  8048b6:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8048b9:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8048bd:	79 4a                	jns    804909 <copy+0x138>
  8048bf:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8048c2:	89 c6                	mov    %eax,%esi
  8048c4:	48 bf b4 73 80 00 00 	movabs $0x8073b4,%rdi
  8048cb:	00 00 00 
  8048ce:	b8 00 00 00 00       	mov    $0x0,%eax
  8048d3:	48 ba 6b 15 80 00 00 	movabs $0x80156b,%rdx
  8048da:	00 00 00 
  8048dd:	ff d2                	callq  *%rdx
  8048df:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8048e2:	89 c7                	mov    %eax,%edi
  8048e4:	48 b8 77 3c 80 00 00 	movabs $0x803c77,%rax
  8048eb:	00 00 00 
  8048ee:	ff d0                	callq  *%rax
  8048f0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8048f3:	89 c7                	mov    %eax,%edi
  8048f5:	48 b8 77 3c 80 00 00 	movabs $0x803c77,%rax
  8048fc:	00 00 00 
  8048ff:	ff d0                	callq  *%rax
  804901:	8b 45 f0             	mov    -0x10(%rbp),%eax
  804904:	e9 a1 00 00 00       	jmpq   8049aa <copy+0x1d9>
  804909:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  804910:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804913:	ba 00 02 00 00       	mov    $0x200,%edx
  804918:	48 89 ce             	mov    %rcx,%rsi
  80491b:	89 c7                	mov    %eax,%edi
  80491d:	48 b8 99 3e 80 00 00 	movabs $0x803e99,%rax
  804924:	00 00 00 
  804927:	ff d0                	callq  *%rax
  804929:	89 45 f4             	mov    %eax,-0xc(%rbp)
  80492c:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  804930:	0f 8f 5f ff ff ff    	jg     804895 <copy+0xc4>
  804936:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  80493a:	79 47                	jns    804983 <copy+0x1b2>
  80493c:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80493f:	89 c6                	mov    %eax,%esi
  804941:	48 bf c7 73 80 00 00 	movabs $0x8073c7,%rdi
  804948:	00 00 00 
  80494b:	b8 00 00 00 00       	mov    $0x0,%eax
  804950:	48 ba 6b 15 80 00 00 	movabs $0x80156b,%rdx
  804957:	00 00 00 
  80495a:	ff d2                	callq  *%rdx
  80495c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80495f:	89 c7                	mov    %eax,%edi
  804961:	48 b8 77 3c 80 00 00 	movabs $0x803c77,%rax
  804968:	00 00 00 
  80496b:	ff d0                	callq  *%rax
  80496d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804970:	89 c7                	mov    %eax,%edi
  804972:	48 b8 77 3c 80 00 00 	movabs $0x803c77,%rax
  804979:	00 00 00 
  80497c:	ff d0                	callq  *%rax
  80497e:	8b 45 f4             	mov    -0xc(%rbp),%eax
  804981:	eb 27                	jmp    8049aa <copy+0x1d9>
  804983:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804986:	89 c7                	mov    %eax,%edi
  804988:	48 b8 77 3c 80 00 00 	movabs $0x803c77,%rax
  80498f:	00 00 00 
  804992:	ff d0                	callq  *%rax
  804994:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804997:	89 c7                	mov    %eax,%edi
  804999:	48 b8 77 3c 80 00 00 	movabs $0x803c77,%rax
  8049a0:	00 00 00 
  8049a3:	ff d0                	callq  *%rax
  8049a5:	b8 00 00 00 00       	mov    $0x0,%eax
  8049aa:	c9                   	leaveq 
  8049ab:	c3                   	retq   

00000000008049ac <writebuf>:
  8049ac:	55                   	push   %rbp
  8049ad:	48 89 e5             	mov    %rsp,%rbp
  8049b0:	48 83 ec 20          	sub    $0x20,%rsp
  8049b4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8049b8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8049bc:	8b 40 0c             	mov    0xc(%rax),%eax
  8049bf:	85 c0                	test   %eax,%eax
  8049c1:	7e 67                	jle    804a2a <writebuf+0x7e>
  8049c3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8049c7:	8b 40 04             	mov    0x4(%rax),%eax
  8049ca:	48 63 d0             	movslq %eax,%rdx
  8049cd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8049d1:	48 8d 48 10          	lea    0x10(%rax),%rcx
  8049d5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8049d9:	8b 00                	mov    (%rax),%eax
  8049db:	48 89 ce             	mov    %rcx,%rsi
  8049de:	89 c7                	mov    %eax,%edi
  8049e0:	48 b8 e3 3f 80 00 00 	movabs $0x803fe3,%rax
  8049e7:	00 00 00 
  8049ea:	ff d0                	callq  *%rax
  8049ec:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8049ef:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8049f3:	7e 13                	jle    804a08 <writebuf+0x5c>
  8049f5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8049f9:	8b 50 08             	mov    0x8(%rax),%edx
  8049fc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8049ff:	01 c2                	add    %eax,%edx
  804a01:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804a05:	89 50 08             	mov    %edx,0x8(%rax)
  804a08:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804a0c:	8b 40 04             	mov    0x4(%rax),%eax
  804a0f:	3b 45 fc             	cmp    -0x4(%rbp),%eax
  804a12:	74 16                	je     804a2a <writebuf+0x7e>
  804a14:	b8 00 00 00 00       	mov    $0x0,%eax
  804a19:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804a1d:	0f 4e 45 fc          	cmovle -0x4(%rbp),%eax
  804a21:	89 c2                	mov    %eax,%edx
  804a23:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804a27:	89 50 0c             	mov    %edx,0xc(%rax)
  804a2a:	c9                   	leaveq 
  804a2b:	c3                   	retq   

0000000000804a2c <putch>:
  804a2c:	55                   	push   %rbp
  804a2d:	48 89 e5             	mov    %rsp,%rbp
  804a30:	48 83 ec 20          	sub    $0x20,%rsp
  804a34:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804a37:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804a3b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804a3f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804a43:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804a47:	8b 40 04             	mov    0x4(%rax),%eax
  804a4a:	8d 48 01             	lea    0x1(%rax),%ecx
  804a4d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  804a51:	89 4a 04             	mov    %ecx,0x4(%rdx)
  804a54:	8b 55 ec             	mov    -0x14(%rbp),%edx
  804a57:	89 d1                	mov    %edx,%ecx
  804a59:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  804a5d:	48 98                	cltq   
  804a5f:	88 4c 02 10          	mov    %cl,0x10(%rdx,%rax,1)
  804a63:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804a67:	8b 40 04             	mov    0x4(%rax),%eax
  804a6a:	3d 00 01 00 00       	cmp    $0x100,%eax
  804a6f:	75 1e                	jne    804a8f <putch+0x63>
  804a71:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804a75:	48 89 c7             	mov    %rax,%rdi
  804a78:	48 b8 ac 49 80 00 00 	movabs $0x8049ac,%rax
  804a7f:	00 00 00 
  804a82:	ff d0                	callq  *%rax
  804a84:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804a88:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%rax)
  804a8f:	c9                   	leaveq 
  804a90:	c3                   	retq   

0000000000804a91 <vfprintf>:
  804a91:	55                   	push   %rbp
  804a92:	48 89 e5             	mov    %rsp,%rbp
  804a95:	48 81 ec 30 01 00 00 	sub    $0x130,%rsp
  804a9c:	89 bd ec fe ff ff    	mov    %edi,-0x114(%rbp)
  804aa2:	48 89 b5 e0 fe ff ff 	mov    %rsi,-0x120(%rbp)
  804aa9:	48 89 95 d8 fe ff ff 	mov    %rdx,-0x128(%rbp)
  804ab0:	8b 85 ec fe ff ff    	mov    -0x114(%rbp),%eax
  804ab6:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%rbp)
  804abc:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  804ac3:	00 00 00 
  804ac6:	c7 85 f8 fe ff ff 00 	movl   $0x0,-0x108(%rbp)
  804acd:	00 00 00 
  804ad0:	c7 85 fc fe ff ff 01 	movl   $0x1,-0x104(%rbp)
  804ad7:	00 00 00 
  804ada:	48 8b 8d d8 fe ff ff 	mov    -0x128(%rbp),%rcx
  804ae1:	48 8b 95 e0 fe ff ff 	mov    -0x120(%rbp),%rdx
  804ae8:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  804aef:	48 89 c6             	mov    %rax,%rsi
  804af2:	48 bf 2c 4a 80 00 00 	movabs $0x804a2c,%rdi
  804af9:	00 00 00 
  804afc:	48 b8 1e 19 80 00 00 	movabs $0x80191e,%rax
  804b03:	00 00 00 
  804b06:	ff d0                	callq  *%rax
  804b08:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  804b0e:	85 c0                	test   %eax,%eax
  804b10:	7e 16                	jle    804b28 <vfprintf+0x97>
  804b12:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  804b19:	48 89 c7             	mov    %rax,%rdi
  804b1c:	48 b8 ac 49 80 00 00 	movabs $0x8049ac,%rax
  804b23:	00 00 00 
  804b26:	ff d0                	callq  *%rax
  804b28:	8b 85 f8 fe ff ff    	mov    -0x108(%rbp),%eax
  804b2e:	85 c0                	test   %eax,%eax
  804b30:	74 08                	je     804b3a <vfprintf+0xa9>
  804b32:	8b 85 f8 fe ff ff    	mov    -0x108(%rbp),%eax
  804b38:	eb 06                	jmp    804b40 <vfprintf+0xaf>
  804b3a:	8b 85 fc fe ff ff    	mov    -0x104(%rbp),%eax
  804b40:	c9                   	leaveq 
  804b41:	c3                   	retq   

0000000000804b42 <fprintf>:
  804b42:	55                   	push   %rbp
  804b43:	48 89 e5             	mov    %rsp,%rbp
  804b46:	48 81 ec e0 00 00 00 	sub    $0xe0,%rsp
  804b4d:	89 bd 2c ff ff ff    	mov    %edi,-0xd4(%rbp)
  804b53:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  804b5a:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  804b61:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  804b68:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  804b6f:	84 c0                	test   %al,%al
  804b71:	74 20                	je     804b93 <fprintf+0x51>
  804b73:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  804b77:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  804b7b:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  804b7f:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  804b83:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  804b87:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  804b8b:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  804b8f:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  804b93:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  804b9a:	c7 85 30 ff ff ff 10 	movl   $0x10,-0xd0(%rbp)
  804ba1:	00 00 00 
  804ba4:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  804bab:	00 00 00 
  804bae:	48 8d 45 10          	lea    0x10(%rbp),%rax
  804bb2:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  804bb9:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  804bc0:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  804bc7:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  804bce:	48 8b 8d 20 ff ff ff 	mov    -0xe0(%rbp),%rcx
  804bd5:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  804bdb:	48 89 ce             	mov    %rcx,%rsi
  804bde:	89 c7                	mov    %eax,%edi
  804be0:	48 b8 91 4a 80 00 00 	movabs $0x804a91,%rax
  804be7:	00 00 00 
  804bea:	ff d0                	callq  *%rax
  804bec:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  804bf2:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  804bf8:	c9                   	leaveq 
  804bf9:	c3                   	retq   

0000000000804bfa <printf>:
  804bfa:	55                   	push   %rbp
  804bfb:	48 89 e5             	mov    %rsp,%rbp
  804bfe:	48 81 ec e0 00 00 00 	sub    $0xe0,%rsp
  804c05:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  804c0c:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  804c13:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  804c1a:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  804c21:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  804c28:	84 c0                	test   %al,%al
  804c2a:	74 20                	je     804c4c <printf+0x52>
  804c2c:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  804c30:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  804c34:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  804c38:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  804c3c:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  804c40:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  804c44:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  804c48:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  804c4c:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  804c53:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  804c5a:	00 00 00 
  804c5d:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  804c64:	00 00 00 
  804c67:	48 8d 45 10          	lea    0x10(%rbp),%rax
  804c6b:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  804c72:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  804c79:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  804c80:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  804c87:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  804c8e:	48 89 c6             	mov    %rax,%rsi
  804c91:	bf 01 00 00 00       	mov    $0x1,%edi
  804c96:	48 b8 91 4a 80 00 00 	movabs $0x804a91,%rax
  804c9d:	00 00 00 
  804ca0:	ff d0                	callq  *%rax
  804ca2:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  804ca8:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  804cae:	c9                   	leaveq 
  804caf:	c3                   	retq   

0000000000804cb0 <spawn>:
  804cb0:	55                   	push   %rbp
  804cb1:	48 89 e5             	mov    %rsp,%rbp
  804cb4:	48 81 ec 10 03 00 00 	sub    $0x310,%rsp
  804cbb:	48 89 bd 08 fd ff ff 	mov    %rdi,-0x2f8(%rbp)
  804cc2:	48 89 b5 00 fd ff ff 	mov    %rsi,-0x300(%rbp)
  804cc9:	48 8b 85 08 fd ff ff 	mov    -0x2f8(%rbp),%rax
  804cd0:	be 00 00 00 00       	mov    $0x0,%esi
  804cd5:	48 89 c7             	mov    %rax,%rdi
  804cd8:	48 b8 6f 43 80 00 00 	movabs $0x80436f,%rax
  804cdf:	00 00 00 
  804ce2:	ff d0                	callq  *%rax
  804ce4:	89 45 e8             	mov    %eax,-0x18(%rbp)
  804ce7:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  804ceb:	79 08                	jns    804cf5 <spawn+0x45>
  804ced:	8b 45 e8             	mov    -0x18(%rbp),%eax
  804cf0:	e9 0c 03 00 00       	jmpq   805001 <spawn+0x351>
  804cf5:	8b 45 e8             	mov    -0x18(%rbp),%eax
  804cf8:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  804cfb:	48 8d 85 d0 fd ff ff 	lea    -0x230(%rbp),%rax
  804d02:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  804d06:	48 8d 8d d0 fd ff ff 	lea    -0x230(%rbp),%rcx
  804d0d:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  804d10:	ba 00 02 00 00       	mov    $0x200,%edx
  804d15:	48 89 ce             	mov    %rcx,%rsi
  804d18:	89 c7                	mov    %eax,%edi
  804d1a:	48 b8 6e 3f 80 00 00 	movabs $0x803f6e,%rax
  804d21:	00 00 00 
  804d24:	ff d0                	callq  *%rax
  804d26:	3d 00 02 00 00       	cmp    $0x200,%eax
  804d2b:	75 0d                	jne    804d3a <spawn+0x8a>
  804d2d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804d31:	8b 00                	mov    (%rax),%eax
  804d33:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
  804d38:	74 43                	je     804d7d <spawn+0xcd>
  804d3a:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  804d3d:	89 c7                	mov    %eax,%edi
  804d3f:	48 b8 77 3c 80 00 00 	movabs $0x803c77,%rax
  804d46:	00 00 00 
  804d49:	ff d0                	callq  *%rax
  804d4b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804d4f:	8b 00                	mov    (%rax),%eax
  804d51:	ba 7f 45 4c 46       	mov    $0x464c457f,%edx
  804d56:	89 c6                	mov    %eax,%esi
  804d58:	48 bf e0 73 80 00 00 	movabs $0x8073e0,%rdi
  804d5f:	00 00 00 
  804d62:	b8 00 00 00 00       	mov    $0x0,%eax
  804d67:	48 b9 6b 15 80 00 00 	movabs $0x80156b,%rcx
  804d6e:	00 00 00 
  804d71:	ff d1                	callq  *%rcx
  804d73:	b8 f1 ff ff ff       	mov    $0xfffffff1,%eax
  804d78:	e9 84 02 00 00       	jmpq   805001 <spawn+0x351>
  804d7d:	b8 07 00 00 00       	mov    $0x7,%eax
  804d82:	cd 30                	int    $0x30
  804d84:	89 45 d0             	mov    %eax,-0x30(%rbp)
  804d87:	8b 45 d0             	mov    -0x30(%rbp),%eax
  804d8a:	89 45 e8             	mov    %eax,-0x18(%rbp)
  804d8d:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  804d91:	79 08                	jns    804d9b <spawn+0xeb>
  804d93:	8b 45 e8             	mov    -0x18(%rbp),%eax
  804d96:	e9 66 02 00 00       	jmpq   805001 <spawn+0x351>
  804d9b:	8b 45 e8             	mov    -0x18(%rbp),%eax
  804d9e:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  804da1:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  804da4:	25 ff 03 00 00       	and    $0x3ff,%eax
  804da9:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804db0:	00 00 00 
  804db3:	48 98                	cltq   
  804db5:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804dbc:	48 01 d0             	add    %rdx,%rax
  804dbf:	48 8d 95 10 fd ff ff 	lea    -0x2f0(%rbp),%rdx
  804dc6:	48 89 c6             	mov    %rax,%rsi
  804dc9:	b8 18 00 00 00       	mov    $0x18,%eax
  804dce:	48 89 d7             	mov    %rdx,%rdi
  804dd1:	48 89 c1             	mov    %rax,%rcx
  804dd4:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
  804dd7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804ddb:	48 8b 40 18          	mov    0x18(%rax),%rax
  804ddf:	48 89 85 a8 fd ff ff 	mov    %rax,-0x258(%rbp)
  804de6:	48 8d 85 10 fd ff ff 	lea    -0x2f0(%rbp),%rax
  804ded:	48 8d 90 b0 00 00 00 	lea    0xb0(%rax),%rdx
  804df4:	48 8b 8d 00 fd ff ff 	mov    -0x300(%rbp),%rcx
  804dfb:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  804dfe:	48 89 ce             	mov    %rcx,%rsi
  804e01:	89 c7                	mov    %eax,%edi
  804e03:	48 b8 6b 52 80 00 00 	movabs $0x80526b,%rax
  804e0a:	00 00 00 
  804e0d:	ff d0                	callq  *%rax
  804e0f:	89 45 e8             	mov    %eax,-0x18(%rbp)
  804e12:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  804e16:	79 08                	jns    804e20 <spawn+0x170>
  804e18:	8b 45 e8             	mov    -0x18(%rbp),%eax
  804e1b:	e9 e1 01 00 00       	jmpq   805001 <spawn+0x351>
  804e20:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804e24:	48 8b 40 20          	mov    0x20(%rax),%rax
  804e28:	48 8d 95 d0 fd ff ff 	lea    -0x230(%rbp),%rdx
  804e2f:	48 01 d0             	add    %rdx,%rax
  804e32:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804e36:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804e3d:	e9 a3 00 00 00       	jmpq   804ee5 <spawn+0x235>
  804e42:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804e46:	8b 00                	mov    (%rax),%eax
  804e48:	83 f8 01             	cmp    $0x1,%eax
  804e4b:	74 05                	je     804e52 <spawn+0x1a2>
  804e4d:	e9 8a 00 00 00       	jmpq   804edc <spawn+0x22c>
  804e52:	c7 45 ec 05 00 00 00 	movl   $0x5,-0x14(%rbp)
  804e59:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804e5d:	8b 40 04             	mov    0x4(%rax),%eax
  804e60:	83 e0 02             	and    $0x2,%eax
  804e63:	85 c0                	test   %eax,%eax
  804e65:	74 04                	je     804e6b <spawn+0x1bb>
  804e67:	83 4d ec 02          	orl    $0x2,-0x14(%rbp)
  804e6b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804e6f:	48 8b 40 08          	mov    0x8(%rax),%rax
  804e73:	41 89 c1             	mov    %eax,%r9d
  804e76:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804e7a:	4c 8b 40 20          	mov    0x20(%rax),%r8
  804e7e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804e82:	48 8b 50 28          	mov    0x28(%rax),%rdx
  804e86:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804e8a:	48 8b 70 10          	mov    0x10(%rax),%rsi
  804e8e:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  804e91:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  804e94:	8b 7d ec             	mov    -0x14(%rbp),%edi
  804e97:	89 3c 24             	mov    %edi,(%rsp)
  804e9a:	89 c7                	mov    %eax,%edi
  804e9c:	48 b8 14 55 80 00 00 	movabs $0x805514,%rax
  804ea3:	00 00 00 
  804ea6:	ff d0                	callq  *%rax
  804ea8:	89 45 e8             	mov    %eax,-0x18(%rbp)
  804eab:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  804eaf:	79 2b                	jns    804edc <spawn+0x22c>
  804eb1:	90                   	nop
  804eb2:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  804eb5:	89 c7                	mov    %eax,%edi
  804eb7:	48 b8 e9 2a 80 00 00 	movabs $0x802ae9,%rax
  804ebe:	00 00 00 
  804ec1:	ff d0                	callq  *%rax
  804ec3:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  804ec6:	89 c7                	mov    %eax,%edi
  804ec8:	48 b8 77 3c 80 00 00 	movabs $0x803c77,%rax
  804ecf:	00 00 00 
  804ed2:	ff d0                	callq  *%rax
  804ed4:	8b 45 e8             	mov    -0x18(%rbp),%eax
  804ed7:	e9 25 01 00 00       	jmpq   805001 <spawn+0x351>
  804edc:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  804ee0:	48 83 45 f0 38       	addq   $0x38,-0x10(%rbp)
  804ee5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804ee9:	0f b7 40 38          	movzwl 0x38(%rax),%eax
  804eed:	0f b7 c0             	movzwl %ax,%eax
  804ef0:	3b 45 fc             	cmp    -0x4(%rbp),%eax
  804ef3:	0f 8f 49 ff ff ff    	jg     804e42 <spawn+0x192>
  804ef9:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  804efc:	89 c7                	mov    %eax,%edi
  804efe:	48 b8 77 3c 80 00 00 	movabs $0x803c77,%rax
  804f05:	00 00 00 
  804f08:	ff d0                	callq  *%rax
  804f0a:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%rbp)
  804f11:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  804f14:	89 c7                	mov    %eax,%edi
  804f16:	48 b8 00 57 80 00 00 	movabs $0x805700,%rax
  804f1d:	00 00 00 
  804f20:	ff d0                	callq  *%rax
  804f22:	89 45 e8             	mov    %eax,-0x18(%rbp)
  804f25:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  804f29:	79 30                	jns    804f5b <spawn+0x2ab>
  804f2b:	8b 45 e8             	mov    -0x18(%rbp),%eax
  804f2e:	89 c1                	mov    %eax,%ecx
  804f30:	48 ba fa 73 80 00 00 	movabs $0x8073fa,%rdx
  804f37:	00 00 00 
  804f3a:	be 86 00 00 00       	mov    $0x86,%esi
  804f3f:	48 bf 10 74 80 00 00 	movabs $0x807410,%rdi
  804f46:	00 00 00 
  804f49:	b8 00 00 00 00       	mov    $0x0,%eax
  804f4e:	49 b8 32 13 80 00 00 	movabs $0x801332,%r8
  804f55:	00 00 00 
  804f58:	41 ff d0             	callq  *%r8
  804f5b:	48 8d 95 10 fd ff ff 	lea    -0x2f0(%rbp),%rdx
  804f62:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  804f65:	48 89 d6             	mov    %rdx,%rsi
  804f68:	89 c7                	mov    %eax,%edi
  804f6a:	48 b8 e9 2c 80 00 00 	movabs $0x802ce9,%rax
  804f71:	00 00 00 
  804f74:	ff d0                	callq  *%rax
  804f76:	89 45 e8             	mov    %eax,-0x18(%rbp)
  804f79:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  804f7d:	79 30                	jns    804faf <spawn+0x2ff>
  804f7f:	8b 45 e8             	mov    -0x18(%rbp),%eax
  804f82:	89 c1                	mov    %eax,%ecx
  804f84:	48 ba 1f 74 80 00 00 	movabs $0x80741f,%rdx
  804f8b:	00 00 00 
  804f8e:	be 8a 00 00 00       	mov    $0x8a,%esi
  804f93:	48 bf 10 74 80 00 00 	movabs $0x807410,%rdi
  804f9a:	00 00 00 
  804f9d:	b8 00 00 00 00       	mov    $0x0,%eax
  804fa2:	49 b8 32 13 80 00 00 	movabs $0x801332,%r8
  804fa9:	00 00 00 
  804fac:	41 ff d0             	callq  *%r8
  804faf:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  804fb2:	be 02 00 00 00       	mov    $0x2,%esi
  804fb7:	89 c7                	mov    %eax,%edi
  804fb9:	48 b8 9e 2c 80 00 00 	movabs $0x802c9e,%rax
  804fc0:	00 00 00 
  804fc3:	ff d0                	callq  *%rax
  804fc5:	89 45 e8             	mov    %eax,-0x18(%rbp)
  804fc8:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  804fcc:	79 30                	jns    804ffe <spawn+0x34e>
  804fce:	8b 45 e8             	mov    -0x18(%rbp),%eax
  804fd1:	89 c1                	mov    %eax,%ecx
  804fd3:	48 ba 39 74 80 00 00 	movabs $0x807439,%rdx
  804fda:	00 00 00 
  804fdd:	be 8d 00 00 00       	mov    $0x8d,%esi
  804fe2:	48 bf 10 74 80 00 00 	movabs $0x807410,%rdi
  804fe9:	00 00 00 
  804fec:	b8 00 00 00 00       	mov    $0x0,%eax
  804ff1:	49 b8 32 13 80 00 00 	movabs $0x801332,%r8
  804ff8:	00 00 00 
  804ffb:	41 ff d0             	callq  *%r8
  804ffe:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  805001:	c9                   	leaveq 
  805002:	c3                   	retq   

0000000000805003 <spawnl>:
  805003:	55                   	push   %rbp
  805004:	48 89 e5             	mov    %rsp,%rbp
  805007:	41 55                	push   %r13
  805009:	41 54                	push   %r12
  80500b:	53                   	push   %rbx
  80500c:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  805013:	48 89 bd f8 fe ff ff 	mov    %rdi,-0x108(%rbp)
  80501a:	48 89 95 40 ff ff ff 	mov    %rdx,-0xc0(%rbp)
  805021:	48 89 8d 48 ff ff ff 	mov    %rcx,-0xb8(%rbp)
  805028:	4c 89 85 50 ff ff ff 	mov    %r8,-0xb0(%rbp)
  80502f:	4c 89 8d 58 ff ff ff 	mov    %r9,-0xa8(%rbp)
  805036:	84 c0                	test   %al,%al
  805038:	74 26                	je     805060 <spawnl+0x5d>
  80503a:	0f 29 85 60 ff ff ff 	movaps %xmm0,-0xa0(%rbp)
  805041:	0f 29 8d 70 ff ff ff 	movaps %xmm1,-0x90(%rbp)
  805048:	0f 29 55 80          	movaps %xmm2,-0x80(%rbp)
  80504c:	0f 29 5d 90          	movaps %xmm3,-0x70(%rbp)
  805050:	0f 29 65 a0          	movaps %xmm4,-0x60(%rbp)
  805054:	0f 29 6d b0          	movaps %xmm5,-0x50(%rbp)
  805058:	0f 29 75 c0          	movaps %xmm6,-0x40(%rbp)
  80505c:	0f 29 7d d0          	movaps %xmm7,-0x30(%rbp)
  805060:	48 89 b5 f0 fe ff ff 	mov    %rsi,-0x110(%rbp)
  805067:	c7 85 2c ff ff ff 00 	movl   $0x0,-0xd4(%rbp)
  80506e:	00 00 00 
  805071:	c7 85 00 ff ff ff 10 	movl   $0x10,-0x100(%rbp)
  805078:	00 00 00 
  80507b:	c7 85 04 ff ff ff 30 	movl   $0x30,-0xfc(%rbp)
  805082:	00 00 00 
  805085:	48 8d 45 10          	lea    0x10(%rbp),%rax
  805089:	48 89 85 08 ff ff ff 	mov    %rax,-0xf8(%rbp)
  805090:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
  805097:	48 89 85 10 ff ff ff 	mov    %rax,-0xf0(%rbp)
  80509e:	eb 07                	jmp    8050a7 <spawnl+0xa4>
  8050a0:	83 85 2c ff ff ff 01 	addl   $0x1,-0xd4(%rbp)
  8050a7:	8b 85 00 ff ff ff    	mov    -0x100(%rbp),%eax
  8050ad:	83 f8 30             	cmp    $0x30,%eax
  8050b0:	73 23                	jae    8050d5 <spawnl+0xd2>
  8050b2:	48 8b 95 10 ff ff ff 	mov    -0xf0(%rbp),%rdx
  8050b9:	8b 85 00 ff ff ff    	mov    -0x100(%rbp),%eax
  8050bf:	89 c0                	mov    %eax,%eax
  8050c1:	48 01 d0             	add    %rdx,%rax
  8050c4:	8b 95 00 ff ff ff    	mov    -0x100(%rbp),%edx
  8050ca:	83 c2 08             	add    $0x8,%edx
  8050cd:	89 95 00 ff ff ff    	mov    %edx,-0x100(%rbp)
  8050d3:	eb 15                	jmp    8050ea <spawnl+0xe7>
  8050d5:	48 8b 95 08 ff ff ff 	mov    -0xf8(%rbp),%rdx
  8050dc:	48 89 d0             	mov    %rdx,%rax
  8050df:	48 83 c2 08          	add    $0x8,%rdx
  8050e3:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  8050ea:	48 8b 00             	mov    (%rax),%rax
  8050ed:	48 85 c0             	test   %rax,%rax
  8050f0:	75 ae                	jne    8050a0 <spawnl+0x9d>
  8050f2:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  8050f8:	83 c0 02             	add    $0x2,%eax
  8050fb:	48 89 e2             	mov    %rsp,%rdx
  8050fe:	48 89 d3             	mov    %rdx,%rbx
  805101:	48 63 d0             	movslq %eax,%rdx
  805104:	48 83 ea 01          	sub    $0x1,%rdx
  805108:	48 89 95 20 ff ff ff 	mov    %rdx,-0xe0(%rbp)
  80510f:	48 63 d0             	movslq %eax,%rdx
  805112:	49 89 d4             	mov    %rdx,%r12
  805115:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  80511b:	48 63 d0             	movslq %eax,%rdx
  80511e:	49 89 d2             	mov    %rdx,%r10
  805121:	41 bb 00 00 00 00    	mov    $0x0,%r11d
  805127:	48 98                	cltq   
  805129:	48 c1 e0 03          	shl    $0x3,%rax
  80512d:	48 8d 50 07          	lea    0x7(%rax),%rdx
  805131:	b8 10 00 00 00       	mov    $0x10,%eax
  805136:	48 83 e8 01          	sub    $0x1,%rax
  80513a:	48 01 d0             	add    %rdx,%rax
  80513d:	bf 10 00 00 00       	mov    $0x10,%edi
  805142:	ba 00 00 00 00       	mov    $0x0,%edx
  805147:	48 f7 f7             	div    %rdi
  80514a:	48 6b c0 10          	imul   $0x10,%rax,%rax
  80514e:	48 29 c4             	sub    %rax,%rsp
  805151:	48 89 e0             	mov    %rsp,%rax
  805154:	48 83 c0 07          	add    $0x7,%rax
  805158:	48 c1 e8 03          	shr    $0x3,%rax
  80515c:	48 c1 e0 03          	shl    $0x3,%rax
  805160:	48 89 85 18 ff ff ff 	mov    %rax,-0xe8(%rbp)
  805167:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  80516e:	48 8b 95 f0 fe ff ff 	mov    -0x110(%rbp),%rdx
  805175:	48 89 10             	mov    %rdx,(%rax)
  805178:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  80517e:	8d 50 01             	lea    0x1(%rax),%edx
  805181:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  805188:	48 63 d2             	movslq %edx,%rdx
  80518b:	48 c7 04 d0 00 00 00 	movq   $0x0,(%rax,%rdx,8)
  805192:	00 
  805193:	c7 85 00 ff ff ff 10 	movl   $0x10,-0x100(%rbp)
  80519a:	00 00 00 
  80519d:	c7 85 04 ff ff ff 30 	movl   $0x30,-0xfc(%rbp)
  8051a4:	00 00 00 
  8051a7:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8051ab:	48 89 85 08 ff ff ff 	mov    %rax,-0xf8(%rbp)
  8051b2:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
  8051b9:	48 89 85 10 ff ff ff 	mov    %rax,-0xf0(%rbp)
  8051c0:	c7 85 28 ff ff ff 00 	movl   $0x0,-0xd8(%rbp)
  8051c7:	00 00 00 
  8051ca:	eb 63                	jmp    80522f <spawnl+0x22c>
  8051cc:	8b 85 28 ff ff ff    	mov    -0xd8(%rbp),%eax
  8051d2:	8d 70 01             	lea    0x1(%rax),%esi
  8051d5:	8b 85 00 ff ff ff    	mov    -0x100(%rbp),%eax
  8051db:	83 f8 30             	cmp    $0x30,%eax
  8051de:	73 23                	jae    805203 <spawnl+0x200>
  8051e0:	48 8b 95 10 ff ff ff 	mov    -0xf0(%rbp),%rdx
  8051e7:	8b 85 00 ff ff ff    	mov    -0x100(%rbp),%eax
  8051ed:	89 c0                	mov    %eax,%eax
  8051ef:	48 01 d0             	add    %rdx,%rax
  8051f2:	8b 95 00 ff ff ff    	mov    -0x100(%rbp),%edx
  8051f8:	83 c2 08             	add    $0x8,%edx
  8051fb:	89 95 00 ff ff ff    	mov    %edx,-0x100(%rbp)
  805201:	eb 15                	jmp    805218 <spawnl+0x215>
  805203:	48 8b 95 08 ff ff ff 	mov    -0xf8(%rbp),%rdx
  80520a:	48 89 d0             	mov    %rdx,%rax
  80520d:	48 83 c2 08          	add    $0x8,%rdx
  805211:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  805218:	48 8b 08             	mov    (%rax),%rcx
  80521b:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  805222:	89 f2                	mov    %esi,%edx
  805224:	48 89 0c d0          	mov    %rcx,(%rax,%rdx,8)
  805228:	83 85 28 ff ff ff 01 	addl   $0x1,-0xd8(%rbp)
  80522f:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  805235:	3b 85 28 ff ff ff    	cmp    -0xd8(%rbp),%eax
  80523b:	77 8f                	ja     8051cc <spawnl+0x1c9>
  80523d:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  805244:	48 8b 85 f8 fe ff ff 	mov    -0x108(%rbp),%rax
  80524b:	48 89 d6             	mov    %rdx,%rsi
  80524e:	48 89 c7             	mov    %rax,%rdi
  805251:	48 b8 b0 4c 80 00 00 	movabs $0x804cb0,%rax
  805258:	00 00 00 
  80525b:	ff d0                	callq  *%rax
  80525d:	48 89 dc             	mov    %rbx,%rsp
  805260:	48 8d 65 e8          	lea    -0x18(%rbp),%rsp
  805264:	5b                   	pop    %rbx
  805265:	41 5c                	pop    %r12
  805267:	41 5d                	pop    %r13
  805269:	5d                   	pop    %rbp
  80526a:	c3                   	retq   

000000000080526b <init_stack>:
  80526b:	55                   	push   %rbp
  80526c:	48 89 e5             	mov    %rsp,%rbp
  80526f:	48 83 ec 50          	sub    $0x50,%rsp
  805273:	89 7d cc             	mov    %edi,-0x34(%rbp)
  805276:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
  80527a:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  80527e:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  805285:	00 
  805286:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
  80528d:	eb 33                	jmp    8052c2 <init_stack+0x57>
  80528f:	8b 45 f4             	mov    -0xc(%rbp),%eax
  805292:	48 98                	cltq   
  805294:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  80529b:	00 
  80529c:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  8052a0:	48 01 d0             	add    %rdx,%rax
  8052a3:	48 8b 00             	mov    (%rax),%rax
  8052a6:	48 89 c7             	mov    %rax,%rdi
  8052a9:	48 b8 0e 22 80 00 00 	movabs $0x80220e,%rax
  8052b0:	00 00 00 
  8052b3:	ff d0                	callq  *%rax
  8052b5:	83 c0 01             	add    $0x1,%eax
  8052b8:	48 98                	cltq   
  8052ba:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  8052be:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
  8052c2:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8052c5:	48 98                	cltq   
  8052c7:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8052ce:	00 
  8052cf:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  8052d3:	48 01 d0             	add    %rdx,%rax
  8052d6:	48 8b 00             	mov    (%rax),%rax
  8052d9:	48 85 c0             	test   %rax,%rax
  8052dc:	75 b1                	jne    80528f <init_stack+0x24>
  8052de:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8052e2:	48 f7 d8             	neg    %rax
  8052e5:	48 05 00 10 40 00    	add    $0x401000,%rax
  8052eb:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8052ef:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8052f3:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  8052f7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8052fb:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  8052ff:	8b 55 f4             	mov    -0xc(%rbp),%edx
  805302:	83 c2 01             	add    $0x1,%edx
  805305:	c1 e2 03             	shl    $0x3,%edx
  805308:	48 63 d2             	movslq %edx,%rdx
  80530b:	48 f7 da             	neg    %rdx
  80530e:	48 01 d0             	add    %rdx,%rax
  805311:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  805315:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  805319:	48 83 e8 10          	sub    $0x10,%rax
  80531d:	48 3d ff ff 3f 00    	cmp    $0x3fffff,%rax
  805323:	77 0a                	ja     80532f <init_stack+0xc4>
  805325:	b8 fc ff ff ff       	mov    $0xfffffffc,%eax
  80532a:	e9 e3 01 00 00       	jmpq   805512 <init_stack+0x2a7>
  80532f:	ba 07 00 00 00       	mov    $0x7,%edx
  805334:	be 00 00 40 00       	mov    $0x400000,%esi
  805339:	bf 00 00 00 00       	mov    $0x0,%edi
  80533e:	48 b8 a9 2b 80 00 00 	movabs $0x802ba9,%rax
  805345:	00 00 00 
  805348:	ff d0                	callq  *%rax
  80534a:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80534d:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  805351:	79 08                	jns    80535b <init_stack+0xf0>
  805353:	8b 45 ec             	mov    -0x14(%rbp),%eax
  805356:	e9 b7 01 00 00       	jmpq   805512 <init_stack+0x2a7>
  80535b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
  805362:	e9 8a 00 00 00       	jmpq   8053f1 <init_stack+0x186>
  805367:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80536a:	48 98                	cltq   
  80536c:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  805373:	00 
  805374:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  805378:	48 01 c2             	add    %rax,%rdx
  80537b:	b9 00 d0 7f ef       	mov    $0xef7fd000,%ecx
  805380:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  805384:	48 01 c8             	add    %rcx,%rax
  805387:	48 2d 00 00 40 00    	sub    $0x400000,%rax
  80538d:	48 89 02             	mov    %rax,(%rdx)
  805390:	8b 45 f0             	mov    -0x10(%rbp),%eax
  805393:	48 98                	cltq   
  805395:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  80539c:	00 
  80539d:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  8053a1:	48 01 d0             	add    %rdx,%rax
  8053a4:	48 8b 10             	mov    (%rax),%rdx
  8053a7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8053ab:	48 89 d6             	mov    %rdx,%rsi
  8053ae:	48 89 c7             	mov    %rax,%rdi
  8053b1:	48 b8 7a 22 80 00 00 	movabs $0x80227a,%rax
  8053b8:	00 00 00 
  8053bb:	ff d0                	callq  *%rax
  8053bd:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8053c0:	48 98                	cltq   
  8053c2:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8053c9:	00 
  8053ca:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  8053ce:	48 01 d0             	add    %rdx,%rax
  8053d1:	48 8b 00             	mov    (%rax),%rax
  8053d4:	48 89 c7             	mov    %rax,%rdi
  8053d7:	48 b8 0e 22 80 00 00 	movabs $0x80220e,%rax
  8053de:	00 00 00 
  8053e1:	ff d0                	callq  *%rax
  8053e3:	48 98                	cltq   
  8053e5:	48 83 c0 01          	add    $0x1,%rax
  8053e9:	48 01 45 e0          	add    %rax,-0x20(%rbp)
  8053ed:	83 45 f0 01          	addl   $0x1,-0x10(%rbp)
  8053f1:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8053f4:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  8053f7:	0f 8c 6a ff ff ff    	jl     805367 <init_stack+0xfc>
  8053fd:	8b 45 f4             	mov    -0xc(%rbp),%eax
  805400:	48 98                	cltq   
  805402:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  805409:	00 
  80540a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80540e:	48 01 d0             	add    %rdx,%rax
  805411:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  805418:	48 81 7d e0 00 10 40 	cmpq   $0x401000,-0x20(%rbp)
  80541f:	00 
  805420:	74 35                	je     805457 <init_stack+0x1ec>
  805422:	48 b9 50 74 80 00 00 	movabs $0x807450,%rcx
  805429:	00 00 00 
  80542c:	48 ba 76 74 80 00 00 	movabs $0x807476,%rdx
  805433:	00 00 00 
  805436:	be f6 00 00 00       	mov    $0xf6,%esi
  80543b:	48 bf 10 74 80 00 00 	movabs $0x807410,%rdi
  805442:	00 00 00 
  805445:	b8 00 00 00 00       	mov    $0x0,%eax
  80544a:	49 b8 32 13 80 00 00 	movabs $0x801332,%r8
  805451:	00 00 00 
  805454:	41 ff d0             	callq  *%r8
  805457:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80545b:	48 8d 50 f8          	lea    -0x8(%rax),%rdx
  80545f:	b9 00 d0 7f ef       	mov    $0xef7fd000,%ecx
  805464:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  805468:	48 01 c8             	add    %rcx,%rax
  80546b:	48 2d 00 00 40 00    	sub    $0x400000,%rax
  805471:	48 89 02             	mov    %rax,(%rdx)
  805474:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  805478:	48 8d 50 f0          	lea    -0x10(%rax),%rdx
  80547c:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80547f:	48 98                	cltq   
  805481:	48 89 02             	mov    %rax,(%rdx)
  805484:	ba f0 cf 7f ef       	mov    $0xef7fcff0,%edx
  805489:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80548d:	48 01 d0             	add    %rdx,%rax
  805490:	48 2d 00 00 40 00    	sub    $0x400000,%rax
  805496:	48 89 c2             	mov    %rax,%rdx
  805499:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  80549d:	48 89 10             	mov    %rdx,(%rax)
  8054a0:	8b 45 cc             	mov    -0x34(%rbp),%eax
  8054a3:	41 b8 07 00 00 00    	mov    $0x7,%r8d
  8054a9:	b9 00 d0 7f ef       	mov    $0xef7fd000,%ecx
  8054ae:	89 c2                	mov    %eax,%edx
  8054b0:	be 00 00 40 00       	mov    $0x400000,%esi
  8054b5:	bf 00 00 00 00       	mov    $0x0,%edi
  8054ba:	48 b8 f9 2b 80 00 00 	movabs $0x802bf9,%rax
  8054c1:	00 00 00 
  8054c4:	ff d0                	callq  *%rax
  8054c6:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8054c9:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8054cd:	79 02                	jns    8054d1 <init_stack+0x266>
  8054cf:	eb 28                	jmp    8054f9 <init_stack+0x28e>
  8054d1:	be 00 00 40 00       	mov    $0x400000,%esi
  8054d6:	bf 00 00 00 00       	mov    $0x0,%edi
  8054db:	48 b8 54 2c 80 00 00 	movabs $0x802c54,%rax
  8054e2:	00 00 00 
  8054e5:	ff d0                	callq  *%rax
  8054e7:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8054ea:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8054ee:	79 02                	jns    8054f2 <init_stack+0x287>
  8054f0:	eb 07                	jmp    8054f9 <init_stack+0x28e>
  8054f2:	b8 00 00 00 00       	mov    $0x0,%eax
  8054f7:	eb 19                	jmp    805512 <init_stack+0x2a7>
  8054f9:	be 00 00 40 00       	mov    $0x400000,%esi
  8054fe:	bf 00 00 00 00       	mov    $0x0,%edi
  805503:	48 b8 54 2c 80 00 00 	movabs $0x802c54,%rax
  80550a:	00 00 00 
  80550d:	ff d0                	callq  *%rax
  80550f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  805512:	c9                   	leaveq 
  805513:	c3                   	retq   

0000000000805514 <map_segment>:
  805514:	55                   	push   %rbp
  805515:	48 89 e5             	mov    %rsp,%rbp
  805518:	48 83 ec 50          	sub    $0x50,%rsp
  80551c:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80551f:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  805523:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  805527:	89 4d d8             	mov    %ecx,-0x28(%rbp)
  80552a:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  80552e:	44 89 4d bc          	mov    %r9d,-0x44(%rbp)
  805532:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  805536:	25 ff 0f 00 00       	and    $0xfff,%eax
  80553b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80553e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805542:	74 21                	je     805565 <map_segment+0x51>
  805544:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805547:	48 98                	cltq   
  805549:	48 29 45 d0          	sub    %rax,-0x30(%rbp)
  80554d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805550:	48 98                	cltq   
  805552:	48 01 45 c8          	add    %rax,-0x38(%rbp)
  805556:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805559:	48 98                	cltq   
  80555b:	48 01 45 c0          	add    %rax,-0x40(%rbp)
  80555f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805562:	29 45 bc             	sub    %eax,-0x44(%rbp)
  805565:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80556c:	e9 79 01 00 00       	jmpq   8056ea <map_segment+0x1d6>
  805571:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805574:	48 98                	cltq   
  805576:	48 3b 45 c0          	cmp    -0x40(%rbp),%rax
  80557a:	72 3c                	jb     8055b8 <map_segment+0xa4>
  80557c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80557f:	48 63 d0             	movslq %eax,%rdx
  805582:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  805586:	48 01 d0             	add    %rdx,%rax
  805589:	48 89 c1             	mov    %rax,%rcx
  80558c:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80558f:	8b 55 10             	mov    0x10(%rbp),%edx
  805592:	48 89 ce             	mov    %rcx,%rsi
  805595:	89 c7                	mov    %eax,%edi
  805597:	48 b8 a9 2b 80 00 00 	movabs $0x802ba9,%rax
  80559e:	00 00 00 
  8055a1:	ff d0                	callq  *%rax
  8055a3:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8055a6:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8055aa:	0f 89 33 01 00 00    	jns    8056e3 <map_segment+0x1cf>
  8055b0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8055b3:	e9 46 01 00 00       	jmpq   8056fe <map_segment+0x1ea>
  8055b8:	ba 07 00 00 00       	mov    $0x7,%edx
  8055bd:	be 00 00 40 00       	mov    $0x400000,%esi
  8055c2:	bf 00 00 00 00       	mov    $0x0,%edi
  8055c7:	48 b8 a9 2b 80 00 00 	movabs $0x802ba9,%rax
  8055ce:	00 00 00 
  8055d1:	ff d0                	callq  *%rax
  8055d3:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8055d6:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8055da:	79 08                	jns    8055e4 <map_segment+0xd0>
  8055dc:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8055df:	e9 1a 01 00 00       	jmpq   8056fe <map_segment+0x1ea>
  8055e4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8055e7:	8b 55 bc             	mov    -0x44(%rbp),%edx
  8055ea:	01 c2                	add    %eax,%edx
  8055ec:	8b 45 d8             	mov    -0x28(%rbp),%eax
  8055ef:	89 d6                	mov    %edx,%esi
  8055f1:	89 c7                	mov    %eax,%edi
  8055f3:	48 b8 b7 40 80 00 00 	movabs $0x8040b7,%rax
  8055fa:	00 00 00 
  8055fd:	ff d0                	callq  *%rax
  8055ff:	89 45 f8             	mov    %eax,-0x8(%rbp)
  805602:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  805606:	79 08                	jns    805610 <map_segment+0xfc>
  805608:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80560b:	e9 ee 00 00 00       	jmpq   8056fe <map_segment+0x1ea>
  805610:	c7 45 f4 00 10 00 00 	movl   $0x1000,-0xc(%rbp)
  805617:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80561a:	48 98                	cltq   
  80561c:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  805620:	48 29 c2             	sub    %rax,%rdx
  805623:	48 89 d0             	mov    %rdx,%rax
  805626:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80562a:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80562d:	48 63 d0             	movslq %eax,%rdx
  805630:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805634:	48 39 c2             	cmp    %rax,%rdx
  805637:	48 0f 47 d0          	cmova  %rax,%rdx
  80563b:	8b 45 d8             	mov    -0x28(%rbp),%eax
  80563e:	be 00 00 40 00       	mov    $0x400000,%esi
  805643:	89 c7                	mov    %eax,%edi
  805645:	48 b8 6e 3f 80 00 00 	movabs $0x803f6e,%rax
  80564c:	00 00 00 
  80564f:	ff d0                	callq  *%rax
  805651:	89 45 f8             	mov    %eax,-0x8(%rbp)
  805654:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  805658:	79 08                	jns    805662 <map_segment+0x14e>
  80565a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80565d:	e9 9c 00 00 00       	jmpq   8056fe <map_segment+0x1ea>
  805662:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805665:	48 63 d0             	movslq %eax,%rdx
  805668:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80566c:	48 01 d0             	add    %rdx,%rax
  80566f:	48 89 c2             	mov    %rax,%rdx
  805672:	8b 45 dc             	mov    -0x24(%rbp),%eax
  805675:	44 8b 45 10          	mov    0x10(%rbp),%r8d
  805679:	48 89 d1             	mov    %rdx,%rcx
  80567c:	89 c2                	mov    %eax,%edx
  80567e:	be 00 00 40 00       	mov    $0x400000,%esi
  805683:	bf 00 00 00 00       	mov    $0x0,%edi
  805688:	48 b8 f9 2b 80 00 00 	movabs $0x802bf9,%rax
  80568f:	00 00 00 
  805692:	ff d0                	callq  *%rax
  805694:	89 45 f8             	mov    %eax,-0x8(%rbp)
  805697:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80569b:	79 30                	jns    8056cd <map_segment+0x1b9>
  80569d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8056a0:	89 c1                	mov    %eax,%ecx
  8056a2:	48 ba 8b 74 80 00 00 	movabs $0x80748b,%rdx
  8056a9:	00 00 00 
  8056ac:	be 29 01 00 00       	mov    $0x129,%esi
  8056b1:	48 bf 10 74 80 00 00 	movabs $0x807410,%rdi
  8056b8:	00 00 00 
  8056bb:	b8 00 00 00 00       	mov    $0x0,%eax
  8056c0:	49 b8 32 13 80 00 00 	movabs $0x801332,%r8
  8056c7:	00 00 00 
  8056ca:	41 ff d0             	callq  *%r8
  8056cd:	be 00 00 40 00       	mov    $0x400000,%esi
  8056d2:	bf 00 00 00 00       	mov    $0x0,%edi
  8056d7:	48 b8 54 2c 80 00 00 	movabs $0x802c54,%rax
  8056de:	00 00 00 
  8056e1:	ff d0                	callq  *%rax
  8056e3:	81 45 fc 00 10 00 00 	addl   $0x1000,-0x4(%rbp)
  8056ea:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8056ed:	48 98                	cltq   
  8056ef:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8056f3:	0f 82 78 fe ff ff    	jb     805571 <map_segment+0x5d>
  8056f9:	b8 00 00 00 00       	mov    $0x0,%eax
  8056fe:	c9                   	leaveq 
  8056ff:	c3                   	retq   

0000000000805700 <copy_shared_pages>:
  805700:	55                   	push   %rbp
  805701:	48 89 e5             	mov    %rsp,%rbp
  805704:	48 83 ec 30          	sub    $0x30,%rsp
  805708:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80570b:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  805712:	00 
  805713:	e9 eb 00 00 00       	jmpq   805803 <copy_shared_pages+0x103>
  805718:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80571c:	48 c1 f8 12          	sar    $0x12,%rax
  805720:	48 89 c2             	mov    %rax,%rdx
  805723:	48 b8 00 00 40 80 00 	movabs $0x10080400000,%rax
  80572a:	01 00 00 
  80572d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  805731:	83 e0 01             	and    $0x1,%eax
  805734:	48 85 c0             	test   %rax,%rax
  805737:	74 21                	je     80575a <copy_shared_pages+0x5a>
  805739:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80573d:	48 c1 f8 09          	sar    $0x9,%rax
  805741:	48 89 c2             	mov    %rax,%rdx
  805744:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  80574b:	01 00 00 
  80574e:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  805752:	83 e0 01             	and    $0x1,%eax
  805755:	48 85 c0             	test   %rax,%rax
  805758:	75 0d                	jne    805767 <copy_shared_pages+0x67>
  80575a:	48 81 45 f8 00 02 00 	addq   $0x200,-0x8(%rbp)
  805761:	00 
  805762:	e9 9c 00 00 00       	jmpq   805803 <copy_shared_pages+0x103>
  805767:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80576b:	48 05 00 02 00 00    	add    $0x200,%rax
  805771:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  805775:	eb 7e                	jmp    8057f5 <copy_shared_pages+0xf5>
  805777:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80577e:	01 00 00 
  805781:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  805785:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  805789:	25 01 04 00 00       	and    $0x401,%eax
  80578e:	48 3d 01 04 00 00    	cmp    $0x401,%rax
  805794:	75 5a                	jne    8057f0 <copy_shared_pages+0xf0>
  805796:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80579a:	48 c1 e0 0c          	shl    $0xc,%rax
  80579e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8057a2:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8057a9:	01 00 00 
  8057ac:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8057b0:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8057b4:	25 07 0e 00 00       	and    $0xe07,%eax
  8057b9:	89 c6                	mov    %eax,%esi
  8057bb:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8057bf:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8057c2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8057c6:	41 89 f0             	mov    %esi,%r8d
  8057c9:	48 89 c6             	mov    %rax,%rsi
  8057cc:	bf 00 00 00 00       	mov    $0x0,%edi
  8057d1:	48 b8 f9 2b 80 00 00 	movabs $0x802bf9,%rax
  8057d8:	00 00 00 
  8057db:	ff d0                	callq  *%rax
  8057dd:	48 98                	cltq   
  8057df:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8057e3:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8057e8:	79 06                	jns    8057f0 <copy_shared_pages+0xf0>
  8057ea:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8057ee:	eb 28                	jmp    805818 <copy_shared_pages+0x118>
  8057f0:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8057f5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8057f9:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8057fd:	0f 8c 74 ff ff ff    	jl     805777 <copy_shared_pages+0x77>
  805803:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  805807:	48 3d ff 07 00 08    	cmp    $0x80007ff,%rax
  80580d:	0f 86 05 ff ff ff    	jbe    805718 <copy_shared_pages+0x18>
  805813:	b8 00 00 00 00       	mov    $0x0,%eax
  805818:	c9                   	leaveq 
  805819:	c3                   	retq   

000000000080581a <fd2sockid>:
  80581a:	55                   	push   %rbp
  80581b:	48 89 e5             	mov    %rsp,%rbp
  80581e:	48 83 ec 20          	sub    $0x20,%rsp
  805822:	89 7d ec             	mov    %edi,-0x14(%rbp)
  805825:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  805829:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80582c:	48 89 d6             	mov    %rdx,%rsi
  80582f:	89 c7                	mov    %eax,%edi
  805831:	48 b8 67 3a 80 00 00 	movabs $0x803a67,%rax
  805838:	00 00 00 
  80583b:	ff d0                	callq  *%rax
  80583d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805840:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805844:	79 05                	jns    80584b <fd2sockid+0x31>
  805846:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805849:	eb 24                	jmp    80586f <fd2sockid+0x55>
  80584b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80584f:	8b 10                	mov    (%rax),%edx
  805851:	48 b8 e0 90 80 00 00 	movabs $0x8090e0,%rax
  805858:	00 00 00 
  80585b:	8b 00                	mov    (%rax),%eax
  80585d:	39 c2                	cmp    %eax,%edx
  80585f:	74 07                	je     805868 <fd2sockid+0x4e>
  805861:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  805866:	eb 07                	jmp    80586f <fd2sockid+0x55>
  805868:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80586c:	8b 40 0c             	mov    0xc(%rax),%eax
  80586f:	c9                   	leaveq 
  805870:	c3                   	retq   

0000000000805871 <alloc_sockfd>:
  805871:	55                   	push   %rbp
  805872:	48 89 e5             	mov    %rsp,%rbp
  805875:	48 83 ec 20          	sub    $0x20,%rsp
  805879:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80587c:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  805880:	48 89 c7             	mov    %rax,%rdi
  805883:	48 b8 cf 39 80 00 00 	movabs $0x8039cf,%rax
  80588a:	00 00 00 
  80588d:	ff d0                	callq  *%rax
  80588f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805892:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805896:	78 26                	js     8058be <alloc_sockfd+0x4d>
  805898:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80589c:	ba 07 04 00 00       	mov    $0x407,%edx
  8058a1:	48 89 c6             	mov    %rax,%rsi
  8058a4:	bf 00 00 00 00       	mov    $0x0,%edi
  8058a9:	48 b8 a9 2b 80 00 00 	movabs $0x802ba9,%rax
  8058b0:	00 00 00 
  8058b3:	ff d0                	callq  *%rax
  8058b5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8058b8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8058bc:	79 16                	jns    8058d4 <alloc_sockfd+0x63>
  8058be:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8058c1:	89 c7                	mov    %eax,%edi
  8058c3:	48 b8 7e 5d 80 00 00 	movabs $0x805d7e,%rax
  8058ca:	00 00 00 
  8058cd:	ff d0                	callq  *%rax
  8058cf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8058d2:	eb 3a                	jmp    80590e <alloc_sockfd+0x9d>
  8058d4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8058d8:	48 ba e0 90 80 00 00 	movabs $0x8090e0,%rdx
  8058df:	00 00 00 
  8058e2:	8b 12                	mov    (%rdx),%edx
  8058e4:	89 10                	mov    %edx,(%rax)
  8058e6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8058ea:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8058f1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8058f5:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8058f8:	89 50 0c             	mov    %edx,0xc(%rax)
  8058fb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8058ff:	48 89 c7             	mov    %rax,%rdi
  805902:	48 b8 81 39 80 00 00 	movabs $0x803981,%rax
  805909:	00 00 00 
  80590c:	ff d0                	callq  *%rax
  80590e:	c9                   	leaveq 
  80590f:	c3                   	retq   

0000000000805910 <accept>:
  805910:	55                   	push   %rbp
  805911:	48 89 e5             	mov    %rsp,%rbp
  805914:	48 83 ec 30          	sub    $0x30,%rsp
  805918:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80591b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80591f:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  805923:	8b 45 ec             	mov    -0x14(%rbp),%eax
  805926:	89 c7                	mov    %eax,%edi
  805928:	48 b8 1a 58 80 00 00 	movabs $0x80581a,%rax
  80592f:	00 00 00 
  805932:	ff d0                	callq  *%rax
  805934:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805937:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80593b:	79 05                	jns    805942 <accept+0x32>
  80593d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805940:	eb 3b                	jmp    80597d <accept+0x6d>
  805942:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  805946:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80594a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80594d:	48 89 ce             	mov    %rcx,%rsi
  805950:	89 c7                	mov    %eax,%edi
  805952:	48 b8 5b 5c 80 00 00 	movabs $0x805c5b,%rax
  805959:	00 00 00 
  80595c:	ff d0                	callq  *%rax
  80595e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805961:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805965:	79 05                	jns    80596c <accept+0x5c>
  805967:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80596a:	eb 11                	jmp    80597d <accept+0x6d>
  80596c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80596f:	89 c7                	mov    %eax,%edi
  805971:	48 b8 71 58 80 00 00 	movabs $0x805871,%rax
  805978:	00 00 00 
  80597b:	ff d0                	callq  *%rax
  80597d:	c9                   	leaveq 
  80597e:	c3                   	retq   

000000000080597f <bind>:
  80597f:	55                   	push   %rbp
  805980:	48 89 e5             	mov    %rsp,%rbp
  805983:	48 83 ec 20          	sub    $0x20,%rsp
  805987:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80598a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80598e:	89 55 e8             	mov    %edx,-0x18(%rbp)
  805991:	8b 45 ec             	mov    -0x14(%rbp),%eax
  805994:	89 c7                	mov    %eax,%edi
  805996:	48 b8 1a 58 80 00 00 	movabs $0x80581a,%rax
  80599d:	00 00 00 
  8059a0:	ff d0                	callq  *%rax
  8059a2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8059a5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8059a9:	79 05                	jns    8059b0 <bind+0x31>
  8059ab:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8059ae:	eb 1b                	jmp    8059cb <bind+0x4c>
  8059b0:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8059b3:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8059b7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8059ba:	48 89 ce             	mov    %rcx,%rsi
  8059bd:	89 c7                	mov    %eax,%edi
  8059bf:	48 b8 da 5c 80 00 00 	movabs $0x805cda,%rax
  8059c6:	00 00 00 
  8059c9:	ff d0                	callq  *%rax
  8059cb:	c9                   	leaveq 
  8059cc:	c3                   	retq   

00000000008059cd <shutdown>:
  8059cd:	55                   	push   %rbp
  8059ce:	48 89 e5             	mov    %rsp,%rbp
  8059d1:	48 83 ec 20          	sub    $0x20,%rsp
  8059d5:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8059d8:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8059db:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8059de:	89 c7                	mov    %eax,%edi
  8059e0:	48 b8 1a 58 80 00 00 	movabs $0x80581a,%rax
  8059e7:	00 00 00 
  8059ea:	ff d0                	callq  *%rax
  8059ec:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8059ef:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8059f3:	79 05                	jns    8059fa <shutdown+0x2d>
  8059f5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8059f8:	eb 16                	jmp    805a10 <shutdown+0x43>
  8059fa:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8059fd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805a00:	89 d6                	mov    %edx,%esi
  805a02:	89 c7                	mov    %eax,%edi
  805a04:	48 b8 3e 5d 80 00 00 	movabs $0x805d3e,%rax
  805a0b:	00 00 00 
  805a0e:	ff d0                	callq  *%rax
  805a10:	c9                   	leaveq 
  805a11:	c3                   	retq   

0000000000805a12 <devsock_close>:
  805a12:	55                   	push   %rbp
  805a13:	48 89 e5             	mov    %rsp,%rbp
  805a16:	48 83 ec 10          	sub    $0x10,%rsp
  805a1a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  805a1e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  805a22:	48 89 c7             	mov    %rax,%rdi
  805a25:	48 b8 75 69 80 00 00 	movabs $0x806975,%rax
  805a2c:	00 00 00 
  805a2f:	ff d0                	callq  *%rax
  805a31:	83 f8 01             	cmp    $0x1,%eax
  805a34:	75 17                	jne    805a4d <devsock_close+0x3b>
  805a36:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  805a3a:	8b 40 0c             	mov    0xc(%rax),%eax
  805a3d:	89 c7                	mov    %eax,%edi
  805a3f:	48 b8 7e 5d 80 00 00 	movabs $0x805d7e,%rax
  805a46:	00 00 00 
  805a49:	ff d0                	callq  *%rax
  805a4b:	eb 05                	jmp    805a52 <devsock_close+0x40>
  805a4d:	b8 00 00 00 00       	mov    $0x0,%eax
  805a52:	c9                   	leaveq 
  805a53:	c3                   	retq   

0000000000805a54 <connect>:
  805a54:	55                   	push   %rbp
  805a55:	48 89 e5             	mov    %rsp,%rbp
  805a58:	48 83 ec 20          	sub    $0x20,%rsp
  805a5c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  805a5f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  805a63:	89 55 e8             	mov    %edx,-0x18(%rbp)
  805a66:	8b 45 ec             	mov    -0x14(%rbp),%eax
  805a69:	89 c7                	mov    %eax,%edi
  805a6b:	48 b8 1a 58 80 00 00 	movabs $0x80581a,%rax
  805a72:	00 00 00 
  805a75:	ff d0                	callq  *%rax
  805a77:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805a7a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805a7e:	79 05                	jns    805a85 <connect+0x31>
  805a80:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805a83:	eb 1b                	jmp    805aa0 <connect+0x4c>
  805a85:	8b 55 e8             	mov    -0x18(%rbp),%edx
  805a88:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  805a8c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805a8f:	48 89 ce             	mov    %rcx,%rsi
  805a92:	89 c7                	mov    %eax,%edi
  805a94:	48 b8 ab 5d 80 00 00 	movabs $0x805dab,%rax
  805a9b:	00 00 00 
  805a9e:	ff d0                	callq  *%rax
  805aa0:	c9                   	leaveq 
  805aa1:	c3                   	retq   

0000000000805aa2 <listen>:
  805aa2:	55                   	push   %rbp
  805aa3:	48 89 e5             	mov    %rsp,%rbp
  805aa6:	48 83 ec 20          	sub    $0x20,%rsp
  805aaa:	89 7d ec             	mov    %edi,-0x14(%rbp)
  805aad:	89 75 e8             	mov    %esi,-0x18(%rbp)
  805ab0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  805ab3:	89 c7                	mov    %eax,%edi
  805ab5:	48 b8 1a 58 80 00 00 	movabs $0x80581a,%rax
  805abc:	00 00 00 
  805abf:	ff d0                	callq  *%rax
  805ac1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805ac4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805ac8:	79 05                	jns    805acf <listen+0x2d>
  805aca:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805acd:	eb 16                	jmp    805ae5 <listen+0x43>
  805acf:	8b 55 e8             	mov    -0x18(%rbp),%edx
  805ad2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805ad5:	89 d6                	mov    %edx,%esi
  805ad7:	89 c7                	mov    %eax,%edi
  805ad9:	48 b8 0f 5e 80 00 00 	movabs $0x805e0f,%rax
  805ae0:	00 00 00 
  805ae3:	ff d0                	callq  *%rax
  805ae5:	c9                   	leaveq 
  805ae6:	c3                   	retq   

0000000000805ae7 <devsock_read>:
  805ae7:	55                   	push   %rbp
  805ae8:	48 89 e5             	mov    %rsp,%rbp
  805aeb:	48 83 ec 20          	sub    $0x20,%rsp
  805aef:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  805af3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  805af7:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  805afb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805aff:	89 c2                	mov    %eax,%edx
  805b01:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  805b05:	8b 40 0c             	mov    0xc(%rax),%eax
  805b08:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  805b0c:	b9 00 00 00 00       	mov    $0x0,%ecx
  805b11:	89 c7                	mov    %eax,%edi
  805b13:	48 b8 4f 5e 80 00 00 	movabs $0x805e4f,%rax
  805b1a:	00 00 00 
  805b1d:	ff d0                	callq  *%rax
  805b1f:	c9                   	leaveq 
  805b20:	c3                   	retq   

0000000000805b21 <devsock_write>:
  805b21:	55                   	push   %rbp
  805b22:	48 89 e5             	mov    %rsp,%rbp
  805b25:	48 83 ec 20          	sub    $0x20,%rsp
  805b29:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  805b2d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  805b31:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  805b35:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805b39:	89 c2                	mov    %eax,%edx
  805b3b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  805b3f:	8b 40 0c             	mov    0xc(%rax),%eax
  805b42:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  805b46:	b9 00 00 00 00       	mov    $0x0,%ecx
  805b4b:	89 c7                	mov    %eax,%edi
  805b4d:	48 b8 1b 5f 80 00 00 	movabs $0x805f1b,%rax
  805b54:	00 00 00 
  805b57:	ff d0                	callq  *%rax
  805b59:	c9                   	leaveq 
  805b5a:	c3                   	retq   

0000000000805b5b <devsock_stat>:
  805b5b:	55                   	push   %rbp
  805b5c:	48 89 e5             	mov    %rsp,%rbp
  805b5f:	48 83 ec 10          	sub    $0x10,%rsp
  805b63:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  805b67:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  805b6b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805b6f:	48 be ad 74 80 00 00 	movabs $0x8074ad,%rsi
  805b76:	00 00 00 
  805b79:	48 89 c7             	mov    %rax,%rdi
  805b7c:	48 b8 7a 22 80 00 00 	movabs $0x80227a,%rax
  805b83:	00 00 00 
  805b86:	ff d0                	callq  *%rax
  805b88:	b8 00 00 00 00       	mov    $0x0,%eax
  805b8d:	c9                   	leaveq 
  805b8e:	c3                   	retq   

0000000000805b8f <socket>:
  805b8f:	55                   	push   %rbp
  805b90:	48 89 e5             	mov    %rsp,%rbp
  805b93:	48 83 ec 20          	sub    $0x20,%rsp
  805b97:	89 7d ec             	mov    %edi,-0x14(%rbp)
  805b9a:	89 75 e8             	mov    %esi,-0x18(%rbp)
  805b9d:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  805ba0:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  805ba3:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  805ba6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  805ba9:	89 ce                	mov    %ecx,%esi
  805bab:	89 c7                	mov    %eax,%edi
  805bad:	48 b8 d3 5f 80 00 00 	movabs $0x805fd3,%rax
  805bb4:	00 00 00 
  805bb7:	ff d0                	callq  *%rax
  805bb9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805bbc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805bc0:	79 05                	jns    805bc7 <socket+0x38>
  805bc2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805bc5:	eb 11                	jmp    805bd8 <socket+0x49>
  805bc7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805bca:	89 c7                	mov    %eax,%edi
  805bcc:	48 b8 71 58 80 00 00 	movabs $0x805871,%rax
  805bd3:	00 00 00 
  805bd6:	ff d0                	callq  *%rax
  805bd8:	c9                   	leaveq 
  805bd9:	c3                   	retq   

0000000000805bda <nsipc>:
  805bda:	55                   	push   %rbp
  805bdb:	48 89 e5             	mov    %rsp,%rbp
  805bde:	48 83 ec 10          	sub    $0x10,%rsp
  805be2:	89 7d fc             	mov    %edi,-0x4(%rbp)
  805be5:	48 b8 24 a4 80 00 00 	movabs $0x80a424,%rax
  805bec:	00 00 00 
  805bef:	8b 00                	mov    (%rax),%eax
  805bf1:	85 c0                	test   %eax,%eax
  805bf3:	75 1d                	jne    805c12 <nsipc+0x38>
  805bf5:	bf 02 00 00 00       	mov    $0x2,%edi
  805bfa:	48 b8 03 69 80 00 00 	movabs $0x806903,%rax
  805c01:	00 00 00 
  805c04:	ff d0                	callq  *%rax
  805c06:	48 ba 24 a4 80 00 00 	movabs $0x80a424,%rdx
  805c0d:	00 00 00 
  805c10:	89 02                	mov    %eax,(%rdx)
  805c12:	48 b8 24 a4 80 00 00 	movabs $0x80a424,%rax
  805c19:	00 00 00 
  805c1c:	8b 00                	mov    (%rax),%eax
  805c1e:	8b 75 fc             	mov    -0x4(%rbp),%esi
  805c21:	b9 07 00 00 00       	mov    $0x7,%ecx
  805c26:	48 ba 00 d0 80 00 00 	movabs $0x80d000,%rdx
  805c2d:	00 00 00 
  805c30:	89 c7                	mov    %eax,%edi
  805c32:	48 b8 6d 68 80 00 00 	movabs $0x80686d,%rax
  805c39:	00 00 00 
  805c3c:	ff d0                	callq  *%rax
  805c3e:	ba 00 00 00 00       	mov    $0x0,%edx
  805c43:	be 00 00 00 00       	mov    $0x0,%esi
  805c48:	bf 00 00 00 00       	mov    $0x0,%edi
  805c4d:	48 b8 ac 67 80 00 00 	movabs $0x8067ac,%rax
  805c54:	00 00 00 
  805c57:	ff d0                	callq  *%rax
  805c59:	c9                   	leaveq 
  805c5a:	c3                   	retq   

0000000000805c5b <nsipc_accept>:
  805c5b:	55                   	push   %rbp
  805c5c:	48 89 e5             	mov    %rsp,%rbp
  805c5f:	48 83 ec 30          	sub    $0x30,%rsp
  805c63:	89 7d ec             	mov    %edi,-0x14(%rbp)
  805c66:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  805c6a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  805c6e:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  805c75:	00 00 00 
  805c78:	8b 55 ec             	mov    -0x14(%rbp),%edx
  805c7b:	89 10                	mov    %edx,(%rax)
  805c7d:	bf 01 00 00 00       	mov    $0x1,%edi
  805c82:	48 b8 da 5b 80 00 00 	movabs $0x805bda,%rax
  805c89:	00 00 00 
  805c8c:	ff d0                	callq  *%rax
  805c8e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805c91:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805c95:	78 3e                	js     805cd5 <nsipc_accept+0x7a>
  805c97:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  805c9e:	00 00 00 
  805ca1:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  805ca5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805ca9:	8b 40 10             	mov    0x10(%rax),%eax
  805cac:	89 c2                	mov    %eax,%edx
  805cae:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  805cb2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  805cb6:	48 89 ce             	mov    %rcx,%rsi
  805cb9:	48 89 c7             	mov    %rax,%rdi
  805cbc:	48 b8 9e 25 80 00 00 	movabs $0x80259e,%rax
  805cc3:	00 00 00 
  805cc6:	ff d0                	callq  *%rax
  805cc8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805ccc:	8b 50 10             	mov    0x10(%rax),%edx
  805ccf:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  805cd3:	89 10                	mov    %edx,(%rax)
  805cd5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805cd8:	c9                   	leaveq 
  805cd9:	c3                   	retq   

0000000000805cda <nsipc_bind>:
  805cda:	55                   	push   %rbp
  805cdb:	48 89 e5             	mov    %rsp,%rbp
  805cde:	48 83 ec 10          	sub    $0x10,%rsp
  805ce2:	89 7d fc             	mov    %edi,-0x4(%rbp)
  805ce5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  805ce9:	89 55 f8             	mov    %edx,-0x8(%rbp)
  805cec:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  805cf3:	00 00 00 
  805cf6:	8b 55 fc             	mov    -0x4(%rbp),%edx
  805cf9:	89 10                	mov    %edx,(%rax)
  805cfb:	8b 55 f8             	mov    -0x8(%rbp),%edx
  805cfe:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805d02:	48 89 c6             	mov    %rax,%rsi
  805d05:	48 bf 04 d0 80 00 00 	movabs $0x80d004,%rdi
  805d0c:	00 00 00 
  805d0f:	48 b8 9e 25 80 00 00 	movabs $0x80259e,%rax
  805d16:	00 00 00 
  805d19:	ff d0                	callq  *%rax
  805d1b:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  805d22:	00 00 00 
  805d25:	8b 55 f8             	mov    -0x8(%rbp),%edx
  805d28:	89 50 14             	mov    %edx,0x14(%rax)
  805d2b:	bf 02 00 00 00       	mov    $0x2,%edi
  805d30:	48 b8 da 5b 80 00 00 	movabs $0x805bda,%rax
  805d37:	00 00 00 
  805d3a:	ff d0                	callq  *%rax
  805d3c:	c9                   	leaveq 
  805d3d:	c3                   	retq   

0000000000805d3e <nsipc_shutdown>:
  805d3e:	55                   	push   %rbp
  805d3f:	48 89 e5             	mov    %rsp,%rbp
  805d42:	48 83 ec 10          	sub    $0x10,%rsp
  805d46:	89 7d fc             	mov    %edi,-0x4(%rbp)
  805d49:	89 75 f8             	mov    %esi,-0x8(%rbp)
  805d4c:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  805d53:	00 00 00 
  805d56:	8b 55 fc             	mov    -0x4(%rbp),%edx
  805d59:	89 10                	mov    %edx,(%rax)
  805d5b:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  805d62:	00 00 00 
  805d65:	8b 55 f8             	mov    -0x8(%rbp),%edx
  805d68:	89 50 04             	mov    %edx,0x4(%rax)
  805d6b:	bf 03 00 00 00       	mov    $0x3,%edi
  805d70:	48 b8 da 5b 80 00 00 	movabs $0x805bda,%rax
  805d77:	00 00 00 
  805d7a:	ff d0                	callq  *%rax
  805d7c:	c9                   	leaveq 
  805d7d:	c3                   	retq   

0000000000805d7e <nsipc_close>:
  805d7e:	55                   	push   %rbp
  805d7f:	48 89 e5             	mov    %rsp,%rbp
  805d82:	48 83 ec 10          	sub    $0x10,%rsp
  805d86:	89 7d fc             	mov    %edi,-0x4(%rbp)
  805d89:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  805d90:	00 00 00 
  805d93:	8b 55 fc             	mov    -0x4(%rbp),%edx
  805d96:	89 10                	mov    %edx,(%rax)
  805d98:	bf 04 00 00 00       	mov    $0x4,%edi
  805d9d:	48 b8 da 5b 80 00 00 	movabs $0x805bda,%rax
  805da4:	00 00 00 
  805da7:	ff d0                	callq  *%rax
  805da9:	c9                   	leaveq 
  805daa:	c3                   	retq   

0000000000805dab <nsipc_connect>:
  805dab:	55                   	push   %rbp
  805dac:	48 89 e5             	mov    %rsp,%rbp
  805daf:	48 83 ec 10          	sub    $0x10,%rsp
  805db3:	89 7d fc             	mov    %edi,-0x4(%rbp)
  805db6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  805dba:	89 55 f8             	mov    %edx,-0x8(%rbp)
  805dbd:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  805dc4:	00 00 00 
  805dc7:	8b 55 fc             	mov    -0x4(%rbp),%edx
  805dca:	89 10                	mov    %edx,(%rax)
  805dcc:	8b 55 f8             	mov    -0x8(%rbp),%edx
  805dcf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805dd3:	48 89 c6             	mov    %rax,%rsi
  805dd6:	48 bf 04 d0 80 00 00 	movabs $0x80d004,%rdi
  805ddd:	00 00 00 
  805de0:	48 b8 9e 25 80 00 00 	movabs $0x80259e,%rax
  805de7:	00 00 00 
  805dea:	ff d0                	callq  *%rax
  805dec:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  805df3:	00 00 00 
  805df6:	8b 55 f8             	mov    -0x8(%rbp),%edx
  805df9:	89 50 14             	mov    %edx,0x14(%rax)
  805dfc:	bf 05 00 00 00       	mov    $0x5,%edi
  805e01:	48 b8 da 5b 80 00 00 	movabs $0x805bda,%rax
  805e08:	00 00 00 
  805e0b:	ff d0                	callq  *%rax
  805e0d:	c9                   	leaveq 
  805e0e:	c3                   	retq   

0000000000805e0f <nsipc_listen>:
  805e0f:	55                   	push   %rbp
  805e10:	48 89 e5             	mov    %rsp,%rbp
  805e13:	48 83 ec 10          	sub    $0x10,%rsp
  805e17:	89 7d fc             	mov    %edi,-0x4(%rbp)
  805e1a:	89 75 f8             	mov    %esi,-0x8(%rbp)
  805e1d:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  805e24:	00 00 00 
  805e27:	8b 55 fc             	mov    -0x4(%rbp),%edx
  805e2a:	89 10                	mov    %edx,(%rax)
  805e2c:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  805e33:	00 00 00 
  805e36:	8b 55 f8             	mov    -0x8(%rbp),%edx
  805e39:	89 50 04             	mov    %edx,0x4(%rax)
  805e3c:	bf 06 00 00 00       	mov    $0x6,%edi
  805e41:	48 b8 da 5b 80 00 00 	movabs $0x805bda,%rax
  805e48:	00 00 00 
  805e4b:	ff d0                	callq  *%rax
  805e4d:	c9                   	leaveq 
  805e4e:	c3                   	retq   

0000000000805e4f <nsipc_recv>:
  805e4f:	55                   	push   %rbp
  805e50:	48 89 e5             	mov    %rsp,%rbp
  805e53:	48 83 ec 30          	sub    $0x30,%rsp
  805e57:	89 7d ec             	mov    %edi,-0x14(%rbp)
  805e5a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  805e5e:	89 55 e8             	mov    %edx,-0x18(%rbp)
  805e61:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  805e64:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  805e6b:	00 00 00 
  805e6e:	8b 55 ec             	mov    -0x14(%rbp),%edx
  805e71:	89 10                	mov    %edx,(%rax)
  805e73:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  805e7a:	00 00 00 
  805e7d:	8b 55 e8             	mov    -0x18(%rbp),%edx
  805e80:	89 50 04             	mov    %edx,0x4(%rax)
  805e83:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  805e8a:	00 00 00 
  805e8d:	8b 55 dc             	mov    -0x24(%rbp),%edx
  805e90:	89 50 08             	mov    %edx,0x8(%rax)
  805e93:	bf 07 00 00 00       	mov    $0x7,%edi
  805e98:	48 b8 da 5b 80 00 00 	movabs $0x805bda,%rax
  805e9f:	00 00 00 
  805ea2:	ff d0                	callq  *%rax
  805ea4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805ea7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805eab:	78 69                	js     805f16 <nsipc_recv+0xc7>
  805ead:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  805eb4:	7f 08                	jg     805ebe <nsipc_recv+0x6f>
  805eb6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805eb9:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  805ebc:	7e 35                	jle    805ef3 <nsipc_recv+0xa4>
  805ebe:	48 b9 b4 74 80 00 00 	movabs $0x8074b4,%rcx
  805ec5:	00 00 00 
  805ec8:	48 ba c9 74 80 00 00 	movabs $0x8074c9,%rdx
  805ecf:	00 00 00 
  805ed2:	be 62 00 00 00       	mov    $0x62,%esi
  805ed7:	48 bf de 74 80 00 00 	movabs $0x8074de,%rdi
  805ede:	00 00 00 
  805ee1:	b8 00 00 00 00       	mov    $0x0,%eax
  805ee6:	49 b8 32 13 80 00 00 	movabs $0x801332,%r8
  805eed:	00 00 00 
  805ef0:	41 ff d0             	callq  *%r8
  805ef3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805ef6:	48 63 d0             	movslq %eax,%rdx
  805ef9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  805efd:	48 be 00 d0 80 00 00 	movabs $0x80d000,%rsi
  805f04:	00 00 00 
  805f07:	48 89 c7             	mov    %rax,%rdi
  805f0a:	48 b8 9e 25 80 00 00 	movabs $0x80259e,%rax
  805f11:	00 00 00 
  805f14:	ff d0                	callq  *%rax
  805f16:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805f19:	c9                   	leaveq 
  805f1a:	c3                   	retq   

0000000000805f1b <nsipc_send>:
  805f1b:	55                   	push   %rbp
  805f1c:	48 89 e5             	mov    %rsp,%rbp
  805f1f:	48 83 ec 20          	sub    $0x20,%rsp
  805f23:	89 7d fc             	mov    %edi,-0x4(%rbp)
  805f26:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  805f2a:	89 55 f8             	mov    %edx,-0x8(%rbp)
  805f2d:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  805f30:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  805f37:	00 00 00 
  805f3a:	8b 55 fc             	mov    -0x4(%rbp),%edx
  805f3d:	89 10                	mov    %edx,(%rax)
  805f3f:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  805f46:	7e 35                	jle    805f7d <nsipc_send+0x62>
  805f48:	48 b9 ed 74 80 00 00 	movabs $0x8074ed,%rcx
  805f4f:	00 00 00 
  805f52:	48 ba c9 74 80 00 00 	movabs $0x8074c9,%rdx
  805f59:	00 00 00 
  805f5c:	be 6d 00 00 00       	mov    $0x6d,%esi
  805f61:	48 bf de 74 80 00 00 	movabs $0x8074de,%rdi
  805f68:	00 00 00 
  805f6b:	b8 00 00 00 00       	mov    $0x0,%eax
  805f70:	49 b8 32 13 80 00 00 	movabs $0x801332,%r8
  805f77:	00 00 00 
  805f7a:	41 ff d0             	callq  *%r8
  805f7d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  805f80:	48 63 d0             	movslq %eax,%rdx
  805f83:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805f87:	48 89 c6             	mov    %rax,%rsi
  805f8a:	48 bf 0c d0 80 00 00 	movabs $0x80d00c,%rdi
  805f91:	00 00 00 
  805f94:	48 b8 9e 25 80 00 00 	movabs $0x80259e,%rax
  805f9b:	00 00 00 
  805f9e:	ff d0                	callq  *%rax
  805fa0:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  805fa7:	00 00 00 
  805faa:	8b 55 f8             	mov    -0x8(%rbp),%edx
  805fad:	89 50 04             	mov    %edx,0x4(%rax)
  805fb0:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  805fb7:	00 00 00 
  805fba:	8b 55 ec             	mov    -0x14(%rbp),%edx
  805fbd:	89 50 08             	mov    %edx,0x8(%rax)
  805fc0:	bf 08 00 00 00       	mov    $0x8,%edi
  805fc5:	48 b8 da 5b 80 00 00 	movabs $0x805bda,%rax
  805fcc:	00 00 00 
  805fcf:	ff d0                	callq  *%rax
  805fd1:	c9                   	leaveq 
  805fd2:	c3                   	retq   

0000000000805fd3 <nsipc_socket>:
  805fd3:	55                   	push   %rbp
  805fd4:	48 89 e5             	mov    %rsp,%rbp
  805fd7:	48 83 ec 10          	sub    $0x10,%rsp
  805fdb:	89 7d fc             	mov    %edi,-0x4(%rbp)
  805fde:	89 75 f8             	mov    %esi,-0x8(%rbp)
  805fe1:	89 55 f4             	mov    %edx,-0xc(%rbp)
  805fe4:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  805feb:	00 00 00 
  805fee:	8b 55 fc             	mov    -0x4(%rbp),%edx
  805ff1:	89 10                	mov    %edx,(%rax)
  805ff3:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  805ffa:	00 00 00 
  805ffd:	8b 55 f8             	mov    -0x8(%rbp),%edx
  806000:	89 50 04             	mov    %edx,0x4(%rax)
  806003:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  80600a:	00 00 00 
  80600d:	8b 55 f4             	mov    -0xc(%rbp),%edx
  806010:	89 50 08             	mov    %edx,0x8(%rax)
  806013:	bf 09 00 00 00       	mov    $0x9,%edi
  806018:	48 b8 da 5b 80 00 00 	movabs $0x805bda,%rax
  80601f:	00 00 00 
  806022:	ff d0                	callq  *%rax
  806024:	c9                   	leaveq 
  806025:	c3                   	retq   

0000000000806026 <pipe>:
  806026:	55                   	push   %rbp
  806027:	48 89 e5             	mov    %rsp,%rbp
  80602a:	53                   	push   %rbx
  80602b:	48 83 ec 38          	sub    $0x38,%rsp
  80602f:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  806033:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  806037:	48 89 c7             	mov    %rax,%rdi
  80603a:	48 b8 cf 39 80 00 00 	movabs $0x8039cf,%rax
  806041:	00 00 00 
  806044:	ff d0                	callq  *%rax
  806046:	89 45 ec             	mov    %eax,-0x14(%rbp)
  806049:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80604d:	0f 88 bf 01 00 00    	js     806212 <pipe+0x1ec>
  806053:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  806057:	ba 07 04 00 00       	mov    $0x407,%edx
  80605c:	48 89 c6             	mov    %rax,%rsi
  80605f:	bf 00 00 00 00       	mov    $0x0,%edi
  806064:	48 b8 a9 2b 80 00 00 	movabs $0x802ba9,%rax
  80606b:	00 00 00 
  80606e:	ff d0                	callq  *%rax
  806070:	89 45 ec             	mov    %eax,-0x14(%rbp)
  806073:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  806077:	0f 88 95 01 00 00    	js     806212 <pipe+0x1ec>
  80607d:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  806081:	48 89 c7             	mov    %rax,%rdi
  806084:	48 b8 cf 39 80 00 00 	movabs $0x8039cf,%rax
  80608b:	00 00 00 
  80608e:	ff d0                	callq  *%rax
  806090:	89 45 ec             	mov    %eax,-0x14(%rbp)
  806093:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  806097:	0f 88 5d 01 00 00    	js     8061fa <pipe+0x1d4>
  80609d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8060a1:	ba 07 04 00 00       	mov    $0x407,%edx
  8060a6:	48 89 c6             	mov    %rax,%rsi
  8060a9:	bf 00 00 00 00       	mov    $0x0,%edi
  8060ae:	48 b8 a9 2b 80 00 00 	movabs $0x802ba9,%rax
  8060b5:	00 00 00 
  8060b8:	ff d0                	callq  *%rax
  8060ba:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8060bd:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8060c1:	0f 88 33 01 00 00    	js     8061fa <pipe+0x1d4>
  8060c7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8060cb:	48 89 c7             	mov    %rax,%rdi
  8060ce:	48 b8 a4 39 80 00 00 	movabs $0x8039a4,%rax
  8060d5:	00 00 00 
  8060d8:	ff d0                	callq  *%rax
  8060da:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8060de:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8060e2:	ba 07 04 00 00       	mov    $0x407,%edx
  8060e7:	48 89 c6             	mov    %rax,%rsi
  8060ea:	bf 00 00 00 00       	mov    $0x0,%edi
  8060ef:	48 b8 a9 2b 80 00 00 	movabs $0x802ba9,%rax
  8060f6:	00 00 00 
  8060f9:	ff d0                	callq  *%rax
  8060fb:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8060fe:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  806102:	79 05                	jns    806109 <pipe+0xe3>
  806104:	e9 d9 00 00 00       	jmpq   8061e2 <pipe+0x1bc>
  806109:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80610d:	48 89 c7             	mov    %rax,%rdi
  806110:	48 b8 a4 39 80 00 00 	movabs $0x8039a4,%rax
  806117:	00 00 00 
  80611a:	ff d0                	callq  *%rax
  80611c:	48 89 c2             	mov    %rax,%rdx
  80611f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  806123:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  806129:	48 89 d1             	mov    %rdx,%rcx
  80612c:	ba 00 00 00 00       	mov    $0x0,%edx
  806131:	48 89 c6             	mov    %rax,%rsi
  806134:	bf 00 00 00 00       	mov    $0x0,%edi
  806139:	48 b8 f9 2b 80 00 00 	movabs $0x802bf9,%rax
  806140:	00 00 00 
  806143:	ff d0                	callq  *%rax
  806145:	89 45 ec             	mov    %eax,-0x14(%rbp)
  806148:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80614c:	79 1b                	jns    806169 <pipe+0x143>
  80614e:	90                   	nop
  80614f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  806153:	48 89 c6             	mov    %rax,%rsi
  806156:	bf 00 00 00 00       	mov    $0x0,%edi
  80615b:	48 b8 54 2c 80 00 00 	movabs $0x802c54,%rax
  806162:	00 00 00 
  806165:	ff d0                	callq  *%rax
  806167:	eb 79                	jmp    8061e2 <pipe+0x1bc>
  806169:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80616d:	48 ba 20 91 80 00 00 	movabs $0x809120,%rdx
  806174:	00 00 00 
  806177:	8b 12                	mov    (%rdx),%edx
  806179:	89 10                	mov    %edx,(%rax)
  80617b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80617f:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  806186:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80618a:	48 ba 20 91 80 00 00 	movabs $0x809120,%rdx
  806191:	00 00 00 
  806194:	8b 12                	mov    (%rdx),%edx
  806196:	89 10                	mov    %edx,(%rax)
  806198:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80619c:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  8061a3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8061a7:	48 89 c7             	mov    %rax,%rdi
  8061aa:	48 b8 81 39 80 00 00 	movabs $0x803981,%rax
  8061b1:	00 00 00 
  8061b4:	ff d0                	callq  *%rax
  8061b6:	89 c2                	mov    %eax,%edx
  8061b8:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8061bc:	89 10                	mov    %edx,(%rax)
  8061be:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8061c2:	48 8d 58 04          	lea    0x4(%rax),%rbx
  8061c6:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8061ca:	48 89 c7             	mov    %rax,%rdi
  8061cd:	48 b8 81 39 80 00 00 	movabs $0x803981,%rax
  8061d4:	00 00 00 
  8061d7:	ff d0                	callq  *%rax
  8061d9:	89 03                	mov    %eax,(%rbx)
  8061db:	b8 00 00 00 00       	mov    $0x0,%eax
  8061e0:	eb 33                	jmp    806215 <pipe+0x1ef>
  8061e2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8061e6:	48 89 c6             	mov    %rax,%rsi
  8061e9:	bf 00 00 00 00       	mov    $0x0,%edi
  8061ee:	48 b8 54 2c 80 00 00 	movabs $0x802c54,%rax
  8061f5:	00 00 00 
  8061f8:	ff d0                	callq  *%rax
  8061fa:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8061fe:	48 89 c6             	mov    %rax,%rsi
  806201:	bf 00 00 00 00       	mov    $0x0,%edi
  806206:	48 b8 54 2c 80 00 00 	movabs $0x802c54,%rax
  80620d:	00 00 00 
  806210:	ff d0                	callq  *%rax
  806212:	8b 45 ec             	mov    -0x14(%rbp),%eax
  806215:	48 83 c4 38          	add    $0x38,%rsp
  806219:	5b                   	pop    %rbx
  80621a:	5d                   	pop    %rbp
  80621b:	c3                   	retq   

000000000080621c <_pipeisclosed>:
  80621c:	55                   	push   %rbp
  80621d:	48 89 e5             	mov    %rsp,%rbp
  806220:	53                   	push   %rbx
  806221:	48 83 ec 28          	sub    $0x28,%rsp
  806225:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  806229:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80622d:	48 b8 28 a4 80 00 00 	movabs $0x80a428,%rax
  806234:	00 00 00 
  806237:	48 8b 00             	mov    (%rax),%rax
  80623a:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  806240:	89 45 ec             	mov    %eax,-0x14(%rbp)
  806243:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  806247:	48 89 c7             	mov    %rax,%rdi
  80624a:	48 b8 75 69 80 00 00 	movabs $0x806975,%rax
  806251:	00 00 00 
  806254:	ff d0                	callq  *%rax
  806256:	89 c3                	mov    %eax,%ebx
  806258:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80625c:	48 89 c7             	mov    %rax,%rdi
  80625f:	48 b8 75 69 80 00 00 	movabs $0x806975,%rax
  806266:	00 00 00 
  806269:	ff d0                	callq  *%rax
  80626b:	39 c3                	cmp    %eax,%ebx
  80626d:	0f 94 c0             	sete   %al
  806270:	0f b6 c0             	movzbl %al,%eax
  806273:	89 45 e8             	mov    %eax,-0x18(%rbp)
  806276:	48 b8 28 a4 80 00 00 	movabs $0x80a428,%rax
  80627d:	00 00 00 
  806280:	48 8b 00             	mov    (%rax),%rax
  806283:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  806289:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  80628c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80628f:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  806292:	75 05                	jne    806299 <_pipeisclosed+0x7d>
  806294:	8b 45 e8             	mov    -0x18(%rbp),%eax
  806297:	eb 4f                	jmp    8062e8 <_pipeisclosed+0xcc>
  806299:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80629c:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  80629f:	74 42                	je     8062e3 <_pipeisclosed+0xc7>
  8062a1:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  8062a5:	75 3c                	jne    8062e3 <_pipeisclosed+0xc7>
  8062a7:	48 b8 28 a4 80 00 00 	movabs $0x80a428,%rax
  8062ae:	00 00 00 
  8062b1:	48 8b 00             	mov    (%rax),%rax
  8062b4:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  8062ba:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  8062bd:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8062c0:	89 c6                	mov    %eax,%esi
  8062c2:	48 bf fe 74 80 00 00 	movabs $0x8074fe,%rdi
  8062c9:	00 00 00 
  8062cc:	b8 00 00 00 00       	mov    $0x0,%eax
  8062d1:	49 b8 6b 15 80 00 00 	movabs $0x80156b,%r8
  8062d8:	00 00 00 
  8062db:	41 ff d0             	callq  *%r8
  8062de:	e9 4a ff ff ff       	jmpq   80622d <_pipeisclosed+0x11>
  8062e3:	e9 45 ff ff ff       	jmpq   80622d <_pipeisclosed+0x11>
  8062e8:	48 83 c4 28          	add    $0x28,%rsp
  8062ec:	5b                   	pop    %rbx
  8062ed:	5d                   	pop    %rbp
  8062ee:	c3                   	retq   

00000000008062ef <pipeisclosed>:
  8062ef:	55                   	push   %rbp
  8062f0:	48 89 e5             	mov    %rsp,%rbp
  8062f3:	48 83 ec 30          	sub    $0x30,%rsp
  8062f7:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8062fa:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8062fe:	8b 45 dc             	mov    -0x24(%rbp),%eax
  806301:	48 89 d6             	mov    %rdx,%rsi
  806304:	89 c7                	mov    %eax,%edi
  806306:	48 b8 67 3a 80 00 00 	movabs $0x803a67,%rax
  80630d:	00 00 00 
  806310:	ff d0                	callq  *%rax
  806312:	89 45 fc             	mov    %eax,-0x4(%rbp)
  806315:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  806319:	79 05                	jns    806320 <pipeisclosed+0x31>
  80631b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80631e:	eb 31                	jmp    806351 <pipeisclosed+0x62>
  806320:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  806324:	48 89 c7             	mov    %rax,%rdi
  806327:	48 b8 a4 39 80 00 00 	movabs $0x8039a4,%rax
  80632e:	00 00 00 
  806331:	ff d0                	callq  *%rax
  806333:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  806337:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80633b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80633f:	48 89 d6             	mov    %rdx,%rsi
  806342:	48 89 c7             	mov    %rax,%rdi
  806345:	48 b8 1c 62 80 00 00 	movabs $0x80621c,%rax
  80634c:	00 00 00 
  80634f:	ff d0                	callq  *%rax
  806351:	c9                   	leaveq 
  806352:	c3                   	retq   

0000000000806353 <devpipe_read>:
  806353:	55                   	push   %rbp
  806354:	48 89 e5             	mov    %rsp,%rbp
  806357:	48 83 ec 40          	sub    $0x40,%rsp
  80635b:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80635f:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  806363:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  806367:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80636b:	48 89 c7             	mov    %rax,%rdi
  80636e:	48 b8 a4 39 80 00 00 	movabs $0x8039a4,%rax
  806375:	00 00 00 
  806378:	ff d0                	callq  *%rax
  80637a:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80637e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  806382:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  806386:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80638d:	00 
  80638e:	e9 92 00 00 00       	jmpq   806425 <devpipe_read+0xd2>
  806393:	eb 41                	jmp    8063d6 <devpipe_read+0x83>
  806395:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  80639a:	74 09                	je     8063a5 <devpipe_read+0x52>
  80639c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8063a0:	e9 92 00 00 00       	jmpq   806437 <devpipe_read+0xe4>
  8063a5:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8063a9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8063ad:	48 89 d6             	mov    %rdx,%rsi
  8063b0:	48 89 c7             	mov    %rax,%rdi
  8063b3:	48 b8 1c 62 80 00 00 	movabs $0x80621c,%rax
  8063ba:	00 00 00 
  8063bd:	ff d0                	callq  *%rax
  8063bf:	85 c0                	test   %eax,%eax
  8063c1:	74 07                	je     8063ca <devpipe_read+0x77>
  8063c3:	b8 00 00 00 00       	mov    $0x0,%eax
  8063c8:	eb 6d                	jmp    806437 <devpipe_read+0xe4>
  8063ca:	48 b8 6b 2b 80 00 00 	movabs $0x802b6b,%rax
  8063d1:	00 00 00 
  8063d4:	ff d0                	callq  *%rax
  8063d6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8063da:	8b 10                	mov    (%rax),%edx
  8063dc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8063e0:	8b 40 04             	mov    0x4(%rax),%eax
  8063e3:	39 c2                	cmp    %eax,%edx
  8063e5:	74 ae                	je     806395 <devpipe_read+0x42>
  8063e7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8063eb:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8063ef:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  8063f3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8063f7:	8b 00                	mov    (%rax),%eax
  8063f9:	99                   	cltd   
  8063fa:	c1 ea 1b             	shr    $0x1b,%edx
  8063fd:	01 d0                	add    %edx,%eax
  8063ff:	83 e0 1f             	and    $0x1f,%eax
  806402:	29 d0                	sub    %edx,%eax
  806404:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  806408:	48 98                	cltq   
  80640a:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  80640f:	88 01                	mov    %al,(%rcx)
  806411:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  806415:	8b 00                	mov    (%rax),%eax
  806417:	8d 50 01             	lea    0x1(%rax),%edx
  80641a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80641e:	89 10                	mov    %edx,(%rax)
  806420:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  806425:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  806429:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  80642d:	0f 82 60 ff ff ff    	jb     806393 <devpipe_read+0x40>
  806433:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  806437:	c9                   	leaveq 
  806438:	c3                   	retq   

0000000000806439 <devpipe_write>:
  806439:	55                   	push   %rbp
  80643a:	48 89 e5             	mov    %rsp,%rbp
  80643d:	48 83 ec 40          	sub    $0x40,%rsp
  806441:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  806445:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  806449:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80644d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  806451:	48 89 c7             	mov    %rax,%rdi
  806454:	48 b8 a4 39 80 00 00 	movabs $0x8039a4,%rax
  80645b:	00 00 00 
  80645e:	ff d0                	callq  *%rax
  806460:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  806464:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  806468:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80646c:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  806473:	00 
  806474:	e9 8e 00 00 00       	jmpq   806507 <devpipe_write+0xce>
  806479:	eb 31                	jmp    8064ac <devpipe_write+0x73>
  80647b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80647f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  806483:	48 89 d6             	mov    %rdx,%rsi
  806486:	48 89 c7             	mov    %rax,%rdi
  806489:	48 b8 1c 62 80 00 00 	movabs $0x80621c,%rax
  806490:	00 00 00 
  806493:	ff d0                	callq  *%rax
  806495:	85 c0                	test   %eax,%eax
  806497:	74 07                	je     8064a0 <devpipe_write+0x67>
  806499:	b8 00 00 00 00       	mov    $0x0,%eax
  80649e:	eb 79                	jmp    806519 <devpipe_write+0xe0>
  8064a0:	48 b8 6b 2b 80 00 00 	movabs $0x802b6b,%rax
  8064a7:	00 00 00 
  8064aa:	ff d0                	callq  *%rax
  8064ac:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8064b0:	8b 40 04             	mov    0x4(%rax),%eax
  8064b3:	48 63 d0             	movslq %eax,%rdx
  8064b6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8064ba:	8b 00                	mov    (%rax),%eax
  8064bc:	48 98                	cltq   
  8064be:	48 83 c0 20          	add    $0x20,%rax
  8064c2:	48 39 c2             	cmp    %rax,%rdx
  8064c5:	73 b4                	jae    80647b <devpipe_write+0x42>
  8064c7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8064cb:	8b 40 04             	mov    0x4(%rax),%eax
  8064ce:	99                   	cltd   
  8064cf:	c1 ea 1b             	shr    $0x1b,%edx
  8064d2:	01 d0                	add    %edx,%eax
  8064d4:	83 e0 1f             	and    $0x1f,%eax
  8064d7:	29 d0                	sub    %edx,%eax
  8064d9:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8064dd:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8064e1:	48 01 ca             	add    %rcx,%rdx
  8064e4:	0f b6 0a             	movzbl (%rdx),%ecx
  8064e7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8064eb:	48 98                	cltq   
  8064ed:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  8064f1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8064f5:	8b 40 04             	mov    0x4(%rax),%eax
  8064f8:	8d 50 01             	lea    0x1(%rax),%edx
  8064fb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8064ff:	89 50 04             	mov    %edx,0x4(%rax)
  806502:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  806507:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80650b:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  80650f:	0f 82 64 ff ff ff    	jb     806479 <devpipe_write+0x40>
  806515:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  806519:	c9                   	leaveq 
  80651a:	c3                   	retq   

000000000080651b <devpipe_stat>:
  80651b:	55                   	push   %rbp
  80651c:	48 89 e5             	mov    %rsp,%rbp
  80651f:	48 83 ec 20          	sub    $0x20,%rsp
  806523:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  806527:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80652b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80652f:	48 89 c7             	mov    %rax,%rdi
  806532:	48 b8 a4 39 80 00 00 	movabs $0x8039a4,%rax
  806539:	00 00 00 
  80653c:	ff d0                	callq  *%rax
  80653e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  806542:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  806546:	48 be 11 75 80 00 00 	movabs $0x807511,%rsi
  80654d:	00 00 00 
  806550:	48 89 c7             	mov    %rax,%rdi
  806553:	48 b8 7a 22 80 00 00 	movabs $0x80227a,%rax
  80655a:	00 00 00 
  80655d:	ff d0                	callq  *%rax
  80655f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  806563:	8b 50 04             	mov    0x4(%rax),%edx
  806566:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80656a:	8b 00                	mov    (%rax),%eax
  80656c:	29 c2                	sub    %eax,%edx
  80656e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  806572:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  806578:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80657c:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  806583:	00 00 00 
  806586:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80658a:	48 b9 20 91 80 00 00 	movabs $0x809120,%rcx
  806591:	00 00 00 
  806594:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  80659b:	b8 00 00 00 00       	mov    $0x0,%eax
  8065a0:	c9                   	leaveq 
  8065a1:	c3                   	retq   

00000000008065a2 <devpipe_close>:
  8065a2:	55                   	push   %rbp
  8065a3:	48 89 e5             	mov    %rsp,%rbp
  8065a6:	48 83 ec 10          	sub    $0x10,%rsp
  8065aa:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8065ae:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8065b2:	48 89 c6             	mov    %rax,%rsi
  8065b5:	bf 00 00 00 00       	mov    $0x0,%edi
  8065ba:	48 b8 54 2c 80 00 00 	movabs $0x802c54,%rax
  8065c1:	00 00 00 
  8065c4:	ff d0                	callq  *%rax
  8065c6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8065ca:	48 89 c7             	mov    %rax,%rdi
  8065cd:	48 b8 a4 39 80 00 00 	movabs $0x8039a4,%rax
  8065d4:	00 00 00 
  8065d7:	ff d0                	callq  *%rax
  8065d9:	48 89 c6             	mov    %rax,%rsi
  8065dc:	bf 00 00 00 00       	mov    $0x0,%edi
  8065e1:	48 b8 54 2c 80 00 00 	movabs $0x802c54,%rax
  8065e8:	00 00 00 
  8065eb:	ff d0                	callq  *%rax
  8065ed:	c9                   	leaveq 
  8065ee:	c3                   	retq   

00000000008065ef <wait>:
  8065ef:	55                   	push   %rbp
  8065f0:	48 89 e5             	mov    %rsp,%rbp
  8065f3:	48 83 ec 20          	sub    $0x20,%rsp
  8065f7:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8065fa:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8065fe:	75 35                	jne    806635 <wait+0x46>
  806600:	48 b9 18 75 80 00 00 	movabs $0x807518,%rcx
  806607:	00 00 00 
  80660a:	48 ba 23 75 80 00 00 	movabs $0x807523,%rdx
  806611:	00 00 00 
  806614:	be 0a 00 00 00       	mov    $0xa,%esi
  806619:	48 bf 38 75 80 00 00 	movabs $0x807538,%rdi
  806620:	00 00 00 
  806623:	b8 00 00 00 00       	mov    $0x0,%eax
  806628:	49 b8 32 13 80 00 00 	movabs $0x801332,%r8
  80662f:	00 00 00 
  806632:	41 ff d0             	callq  *%r8
  806635:	8b 45 ec             	mov    -0x14(%rbp),%eax
  806638:	25 ff 03 00 00       	and    $0x3ff,%eax
  80663d:	48 98                	cltq   
  80663f:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  806646:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80664d:	00 00 00 
  806650:	48 01 d0             	add    %rdx,%rax
  806653:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  806657:	eb 0c                	jmp    806665 <wait+0x76>
  806659:	48 b8 6b 2b 80 00 00 	movabs $0x802b6b,%rax
  806660:	00 00 00 
  806663:	ff d0                	callq  *%rax
  806665:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  806669:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80666f:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  806672:	75 0e                	jne    806682 <wait+0x93>
  806674:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  806678:	8b 80 d4 00 00 00    	mov    0xd4(%rax),%eax
  80667e:	85 c0                	test   %eax,%eax
  806680:	75 d7                	jne    806659 <wait+0x6a>
  806682:	c9                   	leaveq 
  806683:	c3                   	retq   

0000000000806684 <set_pgfault_handler>:
  806684:	55                   	push   %rbp
  806685:	48 89 e5             	mov    %rsp,%rbp
  806688:	48 83 ec 20          	sub    $0x20,%rsp
  80668c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  806690:	48 b8 00 e0 80 00 00 	movabs $0x80e000,%rax
  806697:	00 00 00 
  80669a:	48 8b 00             	mov    (%rax),%rax
  80669d:	48 85 c0             	test   %rax,%rax
  8066a0:	75 6f                	jne    806711 <set_pgfault_handler+0x8d>
  8066a2:	ba 07 00 00 00       	mov    $0x7,%edx
  8066a7:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  8066ac:	bf 00 00 00 00       	mov    $0x0,%edi
  8066b1:	48 b8 a9 2b 80 00 00 	movabs $0x802ba9,%rax
  8066b8:	00 00 00 
  8066bb:	ff d0                	callq  *%rax
  8066bd:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8066c0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8066c4:	79 30                	jns    8066f6 <set_pgfault_handler+0x72>
  8066c6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8066c9:	89 c1                	mov    %eax,%ecx
  8066cb:	48 ba 48 75 80 00 00 	movabs $0x807548,%rdx
  8066d2:	00 00 00 
  8066d5:	be 22 00 00 00       	mov    $0x22,%esi
  8066da:	48 bf 67 75 80 00 00 	movabs $0x807567,%rdi
  8066e1:	00 00 00 
  8066e4:	b8 00 00 00 00       	mov    $0x0,%eax
  8066e9:	49 b8 32 13 80 00 00 	movabs $0x801332,%r8
  8066f0:	00 00 00 
  8066f3:	41 ff d0             	callq  *%r8
  8066f6:	48 be 24 67 80 00 00 	movabs $0x806724,%rsi
  8066fd:	00 00 00 
  806700:	bf 00 00 00 00       	mov    $0x0,%edi
  806705:	48 b8 33 2d 80 00 00 	movabs $0x802d33,%rax
  80670c:	00 00 00 
  80670f:	ff d0                	callq  *%rax
  806711:	48 b8 00 e0 80 00 00 	movabs $0x80e000,%rax
  806718:	00 00 00 
  80671b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80671f:	48 89 10             	mov    %rdx,(%rax)
  806722:	c9                   	leaveq 
  806723:	c3                   	retq   

0000000000806724 <_pgfault_upcall>:
.globl _pgfault_upcall
_pgfault_upcall:
// Call the C page fault handler.
// function argument: pointer to UTF

movq  %rsp,%rdi                // passing the function argument in rdi
  806724:	48 89 e7             	mov    %rsp,%rdi
movabs _pgfault_handler, %rax
  806727:	48 a1 00 e0 80 00 00 	movabs 0x80e000,%rax
  80672e:	00 00 00 
call *%rax
  806731:	ff d0                	callq  *%rax
// registers are available for intermediate calculations.  You
// may find that you have to rearrange your code in non-obvious
// ways as registers become unavailable as scratch space.
//
// LAB 4: Your code here.
subq $8, 152(%rsp)
  806733:	48 83 ac 24 98 00 00 	subq   $0x8,0x98(%rsp)
  80673a:	00 08 
    movq 152(%rsp), %rax
  80673c:	48 8b 84 24 98 00 00 	mov    0x98(%rsp),%rax
  806743:	00 
    movq 136(%rsp), %rbx
  806744:	48 8b 9c 24 88 00 00 	mov    0x88(%rsp),%rbx
  80674b:	00 
movq %rbx, (%rax)
  80674c:	48 89 18             	mov    %rbx,(%rax)

    // Restore the trap-time registers.  After you do this, you
    // can no longer modify any general-purpose registers.
    // LAB 4: Your code here.
    addq $16, %rsp
  80674f:	48 83 c4 10          	add    $0x10,%rsp
    POPA_
  806753:	4c 8b 3c 24          	mov    (%rsp),%r15
  806757:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
  80675c:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
  806761:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  806766:	4c 8b 5c 24 20       	mov    0x20(%rsp),%r11
  80676b:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
  806770:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
  806775:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
  80677a:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
  80677f:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
  806784:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
  806789:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
  80678e:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
  806793:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
  806798:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  80679d:	48 83 c4 78          	add    $0x78,%rsp

    // Restore eflags from the stack.  After you do this, you can
    // no longer use arithmetic operations or anything else that
    // modifies eflags.
    // LAB 4: Your code here.
pushq 8(%rsp)
  8067a1:	ff 74 24 08          	pushq  0x8(%rsp)
    popfq
  8067a5:	9d                   	popfq  

    // Switch back to the adjusted trap-time stack.
    // LAB 4: Your code here.
    movq 16(%rsp), %rsp
  8067a6:	48 8b 64 24 10       	mov    0x10(%rsp),%rsp

    // Return to re-execute the instruction that faulted.
    // LAB 4: Your code here.
    retq
  8067ab:	c3                   	retq   

00000000008067ac <ipc_recv>:
  8067ac:	55                   	push   %rbp
  8067ad:	48 89 e5             	mov    %rsp,%rbp
  8067b0:	48 83 ec 30          	sub    $0x30,%rsp
  8067b4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8067b8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8067bc:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8067c0:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8067c5:	75 0e                	jne    8067d5 <ipc_recv+0x29>
  8067c7:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8067ce:	00 00 00 
  8067d1:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8067d5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8067d9:	48 89 c7             	mov    %rax,%rdi
  8067dc:	48 b8 d2 2d 80 00 00 	movabs $0x802dd2,%rax
  8067e3:	00 00 00 
  8067e6:	ff d0                	callq  *%rax
  8067e8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8067eb:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8067ef:	79 27                	jns    806818 <ipc_recv+0x6c>
  8067f1:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8067f6:	74 0a                	je     806802 <ipc_recv+0x56>
  8067f8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8067fc:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  806802:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  806807:	74 0a                	je     806813 <ipc_recv+0x67>
  806809:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80680d:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  806813:	8b 45 fc             	mov    -0x4(%rbp),%eax
  806816:	eb 53                	jmp    80686b <ipc_recv+0xbf>
  806818:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80681d:	74 19                	je     806838 <ipc_recv+0x8c>
  80681f:	48 b8 28 a4 80 00 00 	movabs $0x80a428,%rax
  806826:	00 00 00 
  806829:	48 8b 00             	mov    (%rax),%rax
  80682c:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  806832:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  806836:	89 10                	mov    %edx,(%rax)
  806838:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80683d:	74 19                	je     806858 <ipc_recv+0xac>
  80683f:	48 b8 28 a4 80 00 00 	movabs $0x80a428,%rax
  806846:	00 00 00 
  806849:	48 8b 00             	mov    (%rax),%rax
  80684c:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  806852:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  806856:	89 10                	mov    %edx,(%rax)
  806858:	48 b8 28 a4 80 00 00 	movabs $0x80a428,%rax
  80685f:	00 00 00 
  806862:	48 8b 00             	mov    (%rax),%rax
  806865:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  80686b:	c9                   	leaveq 
  80686c:	c3                   	retq   

000000000080686d <ipc_send>:
  80686d:	55                   	push   %rbp
  80686e:	48 89 e5             	mov    %rsp,%rbp
  806871:	48 83 ec 30          	sub    $0x30,%rsp
  806875:	89 7d ec             	mov    %edi,-0x14(%rbp)
  806878:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80687b:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  80687f:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  806882:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  806887:	75 10                	jne    806899 <ipc_send+0x2c>
  806889:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  806890:	00 00 00 
  806893:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  806897:	eb 0e                	jmp    8068a7 <ipc_send+0x3a>
  806899:	eb 0c                	jmp    8068a7 <ipc_send+0x3a>
  80689b:	48 b8 6b 2b 80 00 00 	movabs $0x802b6b,%rax
  8068a2:	00 00 00 
  8068a5:	ff d0                	callq  *%rax
  8068a7:	8b 75 e8             	mov    -0x18(%rbp),%esi
  8068aa:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  8068ad:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8068b1:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8068b4:	89 c7                	mov    %eax,%edi
  8068b6:	48 b8 7d 2d 80 00 00 	movabs $0x802d7d,%rax
  8068bd:	00 00 00 
  8068c0:	ff d0                	callq  *%rax
  8068c2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8068c5:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  8068c9:	74 d0                	je     80689b <ipc_send+0x2e>
  8068cb:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8068cf:	79 30                	jns    806901 <ipc_send+0x94>
  8068d1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8068d4:	89 c1                	mov    %eax,%ecx
  8068d6:	48 ba 78 75 80 00 00 	movabs $0x807578,%rdx
  8068dd:	00 00 00 
  8068e0:	be 44 00 00 00       	mov    $0x44,%esi
  8068e5:	48 bf 8e 75 80 00 00 	movabs $0x80758e,%rdi
  8068ec:	00 00 00 
  8068ef:	b8 00 00 00 00       	mov    $0x0,%eax
  8068f4:	49 b8 32 13 80 00 00 	movabs $0x801332,%r8
  8068fb:	00 00 00 
  8068fe:	41 ff d0             	callq  *%r8
  806901:	c9                   	leaveq 
  806902:	c3                   	retq   

0000000000806903 <ipc_find_env>:
  806903:	55                   	push   %rbp
  806904:	48 89 e5             	mov    %rsp,%rbp
  806907:	48 83 ec 14          	sub    $0x14,%rsp
  80690b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80690e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  806915:	eb 4e                	jmp    806965 <ipc_find_env+0x62>
  806917:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  80691e:	00 00 00 
  806921:	8b 45 fc             	mov    -0x4(%rbp),%eax
  806924:	48 98                	cltq   
  806926:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  80692d:	48 01 d0             	add    %rdx,%rax
  806930:	48 05 d0 00 00 00    	add    $0xd0,%rax
  806936:	8b 00                	mov    (%rax),%eax
  806938:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  80693b:	75 24                	jne    806961 <ipc_find_env+0x5e>
  80693d:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  806944:	00 00 00 
  806947:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80694a:	48 98                	cltq   
  80694c:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  806953:	48 01 d0             	add    %rdx,%rax
  806956:	48 05 c0 00 00 00    	add    $0xc0,%rax
  80695c:	8b 40 08             	mov    0x8(%rax),%eax
  80695f:	eb 12                	jmp    806973 <ipc_find_env+0x70>
  806961:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  806965:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  80696c:	7e a9                	jle    806917 <ipc_find_env+0x14>
  80696e:	b8 00 00 00 00       	mov    $0x0,%eax
  806973:	c9                   	leaveq 
  806974:	c3                   	retq   

0000000000806975 <pageref>:
  806975:	55                   	push   %rbp
  806976:	48 89 e5             	mov    %rsp,%rbp
  806979:	48 83 ec 18          	sub    $0x18,%rsp
  80697d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  806981:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  806985:	48 c1 e8 15          	shr    $0x15,%rax
  806989:	48 89 c2             	mov    %rax,%rdx
  80698c:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  806993:	01 00 00 
  806996:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80699a:	83 e0 01             	and    $0x1,%eax
  80699d:	48 85 c0             	test   %rax,%rax
  8069a0:	75 07                	jne    8069a9 <pageref+0x34>
  8069a2:	b8 00 00 00 00       	mov    $0x0,%eax
  8069a7:	eb 53                	jmp    8069fc <pageref+0x87>
  8069a9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8069ad:	48 c1 e8 0c          	shr    $0xc,%rax
  8069b1:	48 89 c2             	mov    %rax,%rdx
  8069b4:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8069bb:	01 00 00 
  8069be:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8069c2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8069c6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8069ca:	83 e0 01             	and    $0x1,%eax
  8069cd:	48 85 c0             	test   %rax,%rax
  8069d0:	75 07                	jne    8069d9 <pageref+0x64>
  8069d2:	b8 00 00 00 00       	mov    $0x0,%eax
  8069d7:	eb 23                	jmp    8069fc <pageref+0x87>
  8069d9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8069dd:	48 c1 e8 0c          	shr    $0xc,%rax
  8069e1:	48 89 c2             	mov    %rax,%rdx
  8069e4:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  8069eb:	00 00 00 
  8069ee:	48 c1 e2 04          	shl    $0x4,%rdx
  8069f2:	48 01 d0             	add    %rdx,%rax
  8069f5:	0f b7 40 08          	movzwl 0x8(%rax),%eax
  8069f9:	0f b7 c0             	movzwl %ax,%eax
  8069fc:	c9                   	leaveq 
  8069fd:	c3                   	retq   
