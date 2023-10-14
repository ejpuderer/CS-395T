
obj/user/testkbd:     file format elf64-x86-64


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
  80003c:	e8 2a 04 00 00       	callq  80046b <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <umain>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 20          	sub    $0x20,%rsp
  80004b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80004e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800052:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800059:	eb 10                	jmp    80006b <umain+0x28>
  80005b:	48 b8 4a 1d 80 00 00 	movabs $0x801d4a,%rax
  800062:	00 00 00 
  800065:	ff d0                	callq  *%rax
  800067:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80006b:	83 7d fc 09          	cmpl   $0x9,-0x4(%rbp)
  80006f:	7e ea                	jle    80005b <umain+0x18>
  800071:	bf 00 00 00 00       	mov    $0x0,%edi
  800076:	48 b8 5c 25 80 00 00 	movabs $0x80255c,%rax
  80007d:	00 00 00 
  800080:	ff d0                	callq  *%rax
  800082:	48 b8 79 02 80 00 00 	movabs $0x800279,%rax
  800089:	00 00 00 
  80008c:	ff d0                	callq  *%rax
  80008e:	89 45 f8             	mov    %eax,-0x8(%rbp)
  800091:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  800095:	79 30                	jns    8000c7 <umain+0x84>
  800097:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80009a:	89 c1                	mov    %eax,%ecx
  80009c:	48 ba c0 45 80 00 00 	movabs $0x8045c0,%rdx
  8000a3:	00 00 00 
  8000a6:	be 10 00 00 00       	mov    $0x10,%esi
  8000ab:	48 bf cd 45 80 00 00 	movabs $0x8045cd,%rdi
  8000b2:	00 00 00 
  8000b5:	b8 00 00 00 00       	mov    $0x0,%eax
  8000ba:	49 b8 11 05 80 00 00 	movabs $0x800511,%r8
  8000c1:	00 00 00 
  8000c4:	41 ff d0             	callq  *%r8
  8000c7:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8000cb:	74 30                	je     8000fd <umain+0xba>
  8000cd:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8000d0:	89 c1                	mov    %eax,%ecx
  8000d2:	48 ba df 45 80 00 00 	movabs $0x8045df,%rdx
  8000d9:	00 00 00 
  8000dc:	be 12 00 00 00       	mov    $0x12,%esi
  8000e1:	48 bf cd 45 80 00 00 	movabs $0x8045cd,%rdi
  8000e8:	00 00 00 
  8000eb:	b8 00 00 00 00       	mov    $0x0,%eax
  8000f0:	49 b8 11 05 80 00 00 	movabs $0x800511,%r8
  8000f7:	00 00 00 
  8000fa:	41 ff d0             	callq  *%r8
  8000fd:	be 01 00 00 00       	mov    $0x1,%esi
  800102:	bf 00 00 00 00       	mov    $0x0,%edi
  800107:	48 b8 d5 25 80 00 00 	movabs $0x8025d5,%rax
  80010e:	00 00 00 
  800111:	ff d0                	callq  *%rax
  800113:	89 45 f8             	mov    %eax,-0x8(%rbp)
  800116:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80011a:	79 30                	jns    80014c <umain+0x109>
  80011c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80011f:	89 c1                	mov    %eax,%ecx
  800121:	48 ba f9 45 80 00 00 	movabs $0x8045f9,%rdx
  800128:	00 00 00 
  80012b:	be 14 00 00 00       	mov    $0x14,%esi
  800130:	48 bf cd 45 80 00 00 	movabs $0x8045cd,%rdi
  800137:	00 00 00 
  80013a:	b8 00 00 00 00       	mov    $0x0,%eax
  80013f:	49 b8 11 05 80 00 00 	movabs $0x800511,%r8
  800146:	00 00 00 
  800149:	41 ff d0             	callq  *%r8
  80014c:	48 bf 01 46 80 00 00 	movabs $0x804601,%rdi
  800153:	00 00 00 
  800156:	48 b8 93 12 80 00 00 	movabs $0x801293,%rax
  80015d:	00 00 00 
  800160:	ff d0                	callq  *%rax
  800162:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  800166:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
  80016b:	74 29                	je     800196 <umain+0x153>
  80016d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800171:	48 89 c2             	mov    %rax,%rdx
  800174:	48 be 0f 46 80 00 00 	movabs $0x80460f,%rsi
  80017b:	00 00 00 
  80017e:	bf 01 00 00 00       	mov    $0x1,%edi
  800183:	b8 00 00 00 00       	mov    $0x0,%eax
  800188:	48 b9 27 34 80 00 00 	movabs $0x803427,%rcx
  80018f:	00 00 00 
  800192:	ff d1                	callq  *%rcx
  800194:	eb b6                	jmp    80014c <umain+0x109>
  800196:	48 be 13 46 80 00 00 	movabs $0x804613,%rsi
  80019d:	00 00 00 
  8001a0:	bf 01 00 00 00       	mov    $0x1,%edi
  8001a5:	b8 00 00 00 00       	mov    $0x0,%eax
  8001aa:	48 ba 27 34 80 00 00 	movabs $0x803427,%rdx
  8001b1:	00 00 00 
  8001b4:	ff d2                	callq  *%rdx
  8001b6:	eb 94                	jmp    80014c <umain+0x109>

00000000008001b8 <cputchar>:
  8001b8:	55                   	push   %rbp
  8001b9:	48 89 e5             	mov    %rsp,%rbp
  8001bc:	48 83 ec 20          	sub    $0x20,%rsp
  8001c0:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8001c3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8001c6:	88 45 ff             	mov    %al,-0x1(%rbp)
  8001c9:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  8001cd:	be 01 00 00 00       	mov    $0x1,%esi
  8001d2:	48 89 c7             	mov    %rax,%rdi
  8001d5:	48 b8 40 1c 80 00 00 	movabs $0x801c40,%rax
  8001dc:	00 00 00 
  8001df:	ff d0                	callq  *%rax
  8001e1:	c9                   	leaveq 
  8001e2:	c3                   	retq   

00000000008001e3 <getchar>:
  8001e3:	55                   	push   %rbp
  8001e4:	48 89 e5             	mov    %rsp,%rbp
  8001e7:	48 83 ec 10          	sub    $0x10,%rsp
  8001eb:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  8001ef:	ba 01 00 00 00       	mov    $0x1,%edx
  8001f4:	48 89 c6             	mov    %rax,%rsi
  8001f7:	bf 00 00 00 00       	mov    $0x0,%edi
  8001fc:	48 b8 7e 27 80 00 00 	movabs $0x80277e,%rax
  800203:	00 00 00 
  800206:	ff d0                	callq  *%rax
  800208:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80020b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80020f:	79 05                	jns    800216 <getchar+0x33>
  800211:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800214:	eb 14                	jmp    80022a <getchar+0x47>
  800216:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80021a:	7f 07                	jg     800223 <getchar+0x40>
  80021c:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  800221:	eb 07                	jmp    80022a <getchar+0x47>
  800223:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  800227:	0f b6 c0             	movzbl %al,%eax
  80022a:	c9                   	leaveq 
  80022b:	c3                   	retq   

000000000080022c <iscons>:
  80022c:	55                   	push   %rbp
  80022d:	48 89 e5             	mov    %rsp,%rbp
  800230:	48 83 ec 20          	sub    $0x20,%rsp
  800234:	89 7d ec             	mov    %edi,-0x14(%rbp)
  800237:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80023b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80023e:	48 89 d6             	mov    %rdx,%rsi
  800241:	89 c7                	mov    %eax,%edi
  800243:	48 b8 4c 23 80 00 00 	movabs $0x80234c,%rax
  80024a:	00 00 00 
  80024d:	ff d0                	callq  *%rax
  80024f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800252:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800256:	79 05                	jns    80025d <iscons+0x31>
  800258:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80025b:	eb 1a                	jmp    800277 <iscons+0x4b>
  80025d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800261:	8b 10                	mov    (%rax),%edx
  800263:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  80026a:	00 00 00 
  80026d:	8b 00                	mov    (%rax),%eax
  80026f:	39 c2                	cmp    %eax,%edx
  800271:	0f 94 c0             	sete   %al
  800274:	0f b6 c0             	movzbl %al,%eax
  800277:	c9                   	leaveq 
  800278:	c3                   	retq   

0000000000800279 <opencons>:
  800279:	55                   	push   %rbp
  80027a:	48 89 e5             	mov    %rsp,%rbp
  80027d:	48 83 ec 10          	sub    $0x10,%rsp
  800281:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  800285:	48 89 c7             	mov    %rax,%rdi
  800288:	48 b8 b4 22 80 00 00 	movabs $0x8022b4,%rax
  80028f:	00 00 00 
  800292:	ff d0                	callq  *%rax
  800294:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800297:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80029b:	79 05                	jns    8002a2 <opencons+0x29>
  80029d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8002a0:	eb 5b                	jmp    8002fd <opencons+0x84>
  8002a2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8002a6:	ba 07 04 00 00       	mov    $0x407,%edx
  8002ab:	48 89 c6             	mov    %rax,%rsi
  8002ae:	bf 00 00 00 00       	mov    $0x0,%edi
  8002b3:	48 b8 88 1d 80 00 00 	movabs $0x801d88,%rax
  8002ba:	00 00 00 
  8002bd:	ff d0                	callq  *%rax
  8002bf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8002c2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8002c6:	79 05                	jns    8002cd <opencons+0x54>
  8002c8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8002cb:	eb 30                	jmp    8002fd <opencons+0x84>
  8002cd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8002d1:	48 ba 00 60 80 00 00 	movabs $0x806000,%rdx
  8002d8:	00 00 00 
  8002db:	8b 12                	mov    (%rdx),%edx
  8002dd:	89 10                	mov    %edx,(%rax)
  8002df:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8002e3:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8002ea:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8002ee:	48 89 c7             	mov    %rax,%rdi
  8002f1:	48 b8 66 22 80 00 00 	movabs $0x802266,%rax
  8002f8:	00 00 00 
  8002fb:	ff d0                	callq  *%rax
  8002fd:	c9                   	leaveq 
  8002fe:	c3                   	retq   

00000000008002ff <devcons_read>:
  8002ff:	55                   	push   %rbp
  800300:	48 89 e5             	mov    %rsp,%rbp
  800303:	48 83 ec 30          	sub    $0x30,%rsp
  800307:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80030b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80030f:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  800313:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  800318:	75 07                	jne    800321 <devcons_read+0x22>
  80031a:	b8 00 00 00 00       	mov    $0x0,%eax
  80031f:	eb 4b                	jmp    80036c <devcons_read+0x6d>
  800321:	eb 0c                	jmp    80032f <devcons_read+0x30>
  800323:	48 b8 4a 1d 80 00 00 	movabs $0x801d4a,%rax
  80032a:	00 00 00 
  80032d:	ff d0                	callq  *%rax
  80032f:	48 b8 8a 1c 80 00 00 	movabs $0x801c8a,%rax
  800336:	00 00 00 
  800339:	ff d0                	callq  *%rax
  80033b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80033e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800342:	74 df                	je     800323 <devcons_read+0x24>
  800344:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800348:	79 05                	jns    80034f <devcons_read+0x50>
  80034a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80034d:	eb 1d                	jmp    80036c <devcons_read+0x6d>
  80034f:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  800353:	75 07                	jne    80035c <devcons_read+0x5d>
  800355:	b8 00 00 00 00       	mov    $0x0,%eax
  80035a:	eb 10                	jmp    80036c <devcons_read+0x6d>
  80035c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80035f:	89 c2                	mov    %eax,%edx
  800361:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800365:	88 10                	mov    %dl,(%rax)
  800367:	b8 01 00 00 00       	mov    $0x1,%eax
  80036c:	c9                   	leaveq 
  80036d:	c3                   	retq   

000000000080036e <devcons_write>:
  80036e:	55                   	push   %rbp
  80036f:	48 89 e5             	mov    %rsp,%rbp
  800372:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  800379:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  800380:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  800387:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  80038e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800395:	eb 76                	jmp    80040d <devcons_write+0x9f>
  800397:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  80039e:	89 c2                	mov    %eax,%edx
  8003a0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8003a3:	29 c2                	sub    %eax,%edx
  8003a5:	89 d0                	mov    %edx,%eax
  8003a7:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8003aa:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8003ad:	83 f8 7f             	cmp    $0x7f,%eax
  8003b0:	76 07                	jbe    8003b9 <devcons_write+0x4b>
  8003b2:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  8003b9:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8003bc:	48 63 d0             	movslq %eax,%rdx
  8003bf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8003c2:	48 63 c8             	movslq %eax,%rcx
  8003c5:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  8003cc:	48 01 c1             	add    %rax,%rcx
  8003cf:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  8003d6:	48 89 ce             	mov    %rcx,%rsi
  8003d9:	48 89 c7             	mov    %rax,%rdi
  8003dc:	48 b8 7d 17 80 00 00 	movabs $0x80177d,%rax
  8003e3:	00 00 00 
  8003e6:	ff d0                	callq  *%rax
  8003e8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8003eb:	48 63 d0             	movslq %eax,%rdx
  8003ee:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  8003f5:	48 89 d6             	mov    %rdx,%rsi
  8003f8:	48 89 c7             	mov    %rax,%rdi
  8003fb:	48 b8 40 1c 80 00 00 	movabs $0x801c40,%rax
  800402:	00 00 00 
  800405:	ff d0                	callq  *%rax
  800407:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80040a:	01 45 fc             	add    %eax,-0x4(%rbp)
  80040d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800410:	48 98                	cltq   
  800412:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  800419:	0f 82 78 ff ff ff    	jb     800397 <devcons_write+0x29>
  80041f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800422:	c9                   	leaveq 
  800423:	c3                   	retq   

0000000000800424 <devcons_close>:
  800424:	55                   	push   %rbp
  800425:	48 89 e5             	mov    %rsp,%rbp
  800428:	48 83 ec 08          	sub    $0x8,%rsp
  80042c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800430:	b8 00 00 00 00       	mov    $0x0,%eax
  800435:	c9                   	leaveq 
  800436:	c3                   	retq   

0000000000800437 <devcons_stat>:
  800437:	55                   	push   %rbp
  800438:	48 89 e5             	mov    %rsp,%rbp
  80043b:	48 83 ec 10          	sub    $0x10,%rsp
  80043f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800443:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800447:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80044b:	48 be 30 46 80 00 00 	movabs $0x804630,%rsi
  800452:	00 00 00 
  800455:	48 89 c7             	mov    %rax,%rdi
  800458:	48 b8 59 14 80 00 00 	movabs $0x801459,%rax
  80045f:	00 00 00 
  800462:	ff d0                	callq  *%rax
  800464:	b8 00 00 00 00       	mov    $0x0,%eax
  800469:	c9                   	leaveq 
  80046a:	c3                   	retq   

000000000080046b <libmain>:
  80046b:	55                   	push   %rbp
  80046c:	48 89 e5             	mov    %rsp,%rbp
  80046f:	48 83 ec 10          	sub    $0x10,%rsp
  800473:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800476:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80047a:	48 b8 0c 1d 80 00 00 	movabs $0x801d0c,%rax
  800481:	00 00 00 
  800484:	ff d0                	callq  *%rax
  800486:	25 ff 03 00 00       	and    $0x3ff,%eax
  80048b:	48 98                	cltq   
  80048d:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  800494:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80049b:	00 00 00 
  80049e:	48 01 c2             	add    %rax,%rdx
  8004a1:	48 b8 08 74 80 00 00 	movabs $0x807408,%rax
  8004a8:	00 00 00 
  8004ab:	48 89 10             	mov    %rdx,(%rax)
  8004ae:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8004b2:	7e 14                	jle    8004c8 <libmain+0x5d>
  8004b4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8004b8:	48 8b 10             	mov    (%rax),%rdx
  8004bb:	48 b8 38 60 80 00 00 	movabs $0x806038,%rax
  8004c2:	00 00 00 
  8004c5:	48 89 10             	mov    %rdx,(%rax)
  8004c8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8004cc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8004cf:	48 89 d6             	mov    %rdx,%rsi
  8004d2:	89 c7                	mov    %eax,%edi
  8004d4:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8004db:	00 00 00 
  8004de:	ff d0                	callq  *%rax
  8004e0:	48 b8 ee 04 80 00 00 	movabs $0x8004ee,%rax
  8004e7:	00 00 00 
  8004ea:	ff d0                	callq  *%rax
  8004ec:	c9                   	leaveq 
  8004ed:	c3                   	retq   

00000000008004ee <exit>:
  8004ee:	55                   	push   %rbp
  8004ef:	48 89 e5             	mov    %rsp,%rbp
  8004f2:	48 b8 a7 25 80 00 00 	movabs $0x8025a7,%rax
  8004f9:	00 00 00 
  8004fc:	ff d0                	callq  *%rax
  8004fe:	bf 00 00 00 00       	mov    $0x0,%edi
  800503:	48 b8 c8 1c 80 00 00 	movabs $0x801cc8,%rax
  80050a:	00 00 00 
  80050d:	ff d0                	callq  *%rax
  80050f:	5d                   	pop    %rbp
  800510:	c3                   	retq   

0000000000800511 <_panic>:
  800511:	55                   	push   %rbp
  800512:	48 89 e5             	mov    %rsp,%rbp
  800515:	53                   	push   %rbx
  800516:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  80051d:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  800524:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  80052a:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  800531:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  800538:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  80053f:	84 c0                	test   %al,%al
  800541:	74 23                	je     800566 <_panic+0x55>
  800543:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  80054a:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  80054e:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  800552:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  800556:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  80055a:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  80055e:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  800562:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  800566:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  80056d:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  800574:	00 00 00 
  800577:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  80057e:	00 00 00 
  800581:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800585:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  80058c:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  800593:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  80059a:	48 b8 38 60 80 00 00 	movabs $0x806038,%rax
  8005a1:	00 00 00 
  8005a4:	48 8b 18             	mov    (%rax),%rbx
  8005a7:	48 b8 0c 1d 80 00 00 	movabs $0x801d0c,%rax
  8005ae:	00 00 00 
  8005b1:	ff d0                	callq  *%rax
  8005b3:	8b 8d 14 ff ff ff    	mov    -0xec(%rbp),%ecx
  8005b9:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  8005c0:	41 89 c8             	mov    %ecx,%r8d
  8005c3:	48 89 d1             	mov    %rdx,%rcx
  8005c6:	48 89 da             	mov    %rbx,%rdx
  8005c9:	89 c6                	mov    %eax,%esi
  8005cb:	48 bf 48 46 80 00 00 	movabs $0x804648,%rdi
  8005d2:	00 00 00 
  8005d5:	b8 00 00 00 00       	mov    $0x0,%eax
  8005da:	49 b9 4a 07 80 00 00 	movabs $0x80074a,%r9
  8005e1:	00 00 00 
  8005e4:	41 ff d1             	callq  *%r9
  8005e7:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  8005ee:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8005f5:	48 89 d6             	mov    %rdx,%rsi
  8005f8:	48 89 c7             	mov    %rax,%rdi
  8005fb:	48 b8 9e 06 80 00 00 	movabs $0x80069e,%rax
  800602:	00 00 00 
  800605:	ff d0                	callq  *%rax
  800607:	48 bf 6b 46 80 00 00 	movabs $0x80466b,%rdi
  80060e:	00 00 00 
  800611:	b8 00 00 00 00       	mov    $0x0,%eax
  800616:	48 ba 4a 07 80 00 00 	movabs $0x80074a,%rdx
  80061d:	00 00 00 
  800620:	ff d2                	callq  *%rdx
  800622:	cc                   	int3   
  800623:	eb fd                	jmp    800622 <_panic+0x111>

0000000000800625 <putch>:
  800625:	55                   	push   %rbp
  800626:	48 89 e5             	mov    %rsp,%rbp
  800629:	48 83 ec 10          	sub    $0x10,%rsp
  80062d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800630:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800634:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800638:	8b 00                	mov    (%rax),%eax
  80063a:	8d 48 01             	lea    0x1(%rax),%ecx
  80063d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800641:	89 0a                	mov    %ecx,(%rdx)
  800643:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800646:	89 d1                	mov    %edx,%ecx
  800648:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80064c:	48 98                	cltq   
  80064e:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  800652:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800656:	8b 00                	mov    (%rax),%eax
  800658:	3d ff 00 00 00       	cmp    $0xff,%eax
  80065d:	75 2c                	jne    80068b <putch+0x66>
  80065f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800663:	8b 00                	mov    (%rax),%eax
  800665:	48 98                	cltq   
  800667:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80066b:	48 83 c2 08          	add    $0x8,%rdx
  80066f:	48 89 c6             	mov    %rax,%rsi
  800672:	48 89 d7             	mov    %rdx,%rdi
  800675:	48 b8 40 1c 80 00 00 	movabs $0x801c40,%rax
  80067c:	00 00 00 
  80067f:	ff d0                	callq  *%rax
  800681:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800685:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  80068b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80068f:	8b 40 04             	mov    0x4(%rax),%eax
  800692:	8d 50 01             	lea    0x1(%rax),%edx
  800695:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800699:	89 50 04             	mov    %edx,0x4(%rax)
  80069c:	c9                   	leaveq 
  80069d:	c3                   	retq   

000000000080069e <vcprintf>:
  80069e:	55                   	push   %rbp
  80069f:	48 89 e5             	mov    %rsp,%rbp
  8006a2:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  8006a9:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  8006b0:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  8006b7:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  8006be:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  8006c5:	48 8b 0a             	mov    (%rdx),%rcx
  8006c8:	48 89 08             	mov    %rcx,(%rax)
  8006cb:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8006cf:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8006d3:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8006d7:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8006db:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  8006e2:	00 00 00 
  8006e5:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  8006ec:	00 00 00 
  8006ef:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  8006f6:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  8006fd:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800704:	48 89 c6             	mov    %rax,%rsi
  800707:	48 bf 25 06 80 00 00 	movabs $0x800625,%rdi
  80070e:	00 00 00 
  800711:	48 b8 fd 0a 80 00 00 	movabs $0x800afd,%rax
  800718:	00 00 00 
  80071b:	ff d0                	callq  *%rax
  80071d:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  800723:	48 98                	cltq   
  800725:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  80072c:	48 83 c2 08          	add    $0x8,%rdx
  800730:	48 89 c6             	mov    %rax,%rsi
  800733:	48 89 d7             	mov    %rdx,%rdi
  800736:	48 b8 40 1c 80 00 00 	movabs $0x801c40,%rax
  80073d:	00 00 00 
  800740:	ff d0                	callq  *%rax
  800742:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  800748:	c9                   	leaveq 
  800749:	c3                   	retq   

000000000080074a <cprintf>:
  80074a:	55                   	push   %rbp
  80074b:	48 89 e5             	mov    %rsp,%rbp
  80074e:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  800755:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  80075c:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  800763:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  80076a:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800771:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800778:	84 c0                	test   %al,%al
  80077a:	74 20                	je     80079c <cprintf+0x52>
  80077c:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800780:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800784:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800788:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  80078c:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800790:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800794:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800798:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  80079c:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  8007a3:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  8007aa:	00 00 00 
  8007ad:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8007b4:	00 00 00 
  8007b7:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8007bb:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8007c2:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8007c9:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8007d0:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  8007d7:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8007de:	48 8b 0a             	mov    (%rdx),%rcx
  8007e1:	48 89 08             	mov    %rcx,(%rax)
  8007e4:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8007e8:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8007ec:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8007f0:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8007f4:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  8007fb:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800802:	48 89 d6             	mov    %rdx,%rsi
  800805:	48 89 c7             	mov    %rax,%rdi
  800808:	48 b8 9e 06 80 00 00 	movabs $0x80069e,%rax
  80080f:	00 00 00 
  800812:	ff d0                	callq  *%rax
  800814:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  80081a:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  800820:	c9                   	leaveq 
  800821:	c3                   	retq   

0000000000800822 <printnum>:
  800822:	55                   	push   %rbp
  800823:	48 89 e5             	mov    %rsp,%rbp
  800826:	53                   	push   %rbx
  800827:	48 83 ec 38          	sub    $0x38,%rsp
  80082b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80082f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800833:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  800837:	89 4d d4             	mov    %ecx,-0x2c(%rbp)
  80083a:	44 89 45 d0          	mov    %r8d,-0x30(%rbp)
  80083e:	44 89 4d cc          	mov    %r9d,-0x34(%rbp)
  800842:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  800845:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  800849:	77 3b                	ja     800886 <printnum+0x64>
  80084b:	8b 45 d0             	mov    -0x30(%rbp),%eax
  80084e:	44 8d 40 ff          	lea    -0x1(%rax),%r8d
  800852:	8b 5d d4             	mov    -0x2c(%rbp),%ebx
  800855:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800859:	ba 00 00 00 00       	mov    $0x0,%edx
  80085e:	48 f7 f3             	div    %rbx
  800861:	48 89 c2             	mov    %rax,%rdx
  800864:	8b 7d cc             	mov    -0x34(%rbp),%edi
  800867:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  80086a:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
  80086e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800872:	41 89 f9             	mov    %edi,%r9d
  800875:	48 89 c7             	mov    %rax,%rdi
  800878:	48 b8 22 08 80 00 00 	movabs $0x800822,%rax
  80087f:	00 00 00 
  800882:	ff d0                	callq  *%rax
  800884:	eb 1e                	jmp    8008a4 <printnum+0x82>
  800886:	eb 12                	jmp    80089a <printnum+0x78>
  800888:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80088c:	8b 55 cc             	mov    -0x34(%rbp),%edx
  80088f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800893:	48 89 ce             	mov    %rcx,%rsi
  800896:	89 d7                	mov    %edx,%edi
  800898:	ff d0                	callq  *%rax
  80089a:	83 6d d0 01          	subl   $0x1,-0x30(%rbp)
  80089e:	83 7d d0 00          	cmpl   $0x0,-0x30(%rbp)
  8008a2:	7f e4                	jg     800888 <printnum+0x66>
  8008a4:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  8008a7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8008ab:	ba 00 00 00 00       	mov    $0x0,%edx
  8008b0:	48 f7 f1             	div    %rcx
  8008b3:	48 89 d0             	mov    %rdx,%rax
  8008b6:	48 ba 70 48 80 00 00 	movabs $0x804870,%rdx
  8008bd:	00 00 00 
  8008c0:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
  8008c4:	0f be d0             	movsbl %al,%edx
  8008c7:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8008cb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008cf:	48 89 ce             	mov    %rcx,%rsi
  8008d2:	89 d7                	mov    %edx,%edi
  8008d4:	ff d0                	callq  *%rax
  8008d6:	48 83 c4 38          	add    $0x38,%rsp
  8008da:	5b                   	pop    %rbx
  8008db:	5d                   	pop    %rbp
  8008dc:	c3                   	retq   

00000000008008dd <getuint>:
  8008dd:	55                   	push   %rbp
  8008de:	48 89 e5             	mov    %rsp,%rbp
  8008e1:	48 83 ec 1c          	sub    $0x1c,%rsp
  8008e5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8008e9:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8008ec:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8008f0:	7e 52                	jle    800944 <getuint+0x67>
  8008f2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008f6:	8b 00                	mov    (%rax),%eax
  8008f8:	83 f8 30             	cmp    $0x30,%eax
  8008fb:	73 24                	jae    800921 <getuint+0x44>
  8008fd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800901:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800905:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800909:	8b 00                	mov    (%rax),%eax
  80090b:	89 c0                	mov    %eax,%eax
  80090d:	48 01 d0             	add    %rdx,%rax
  800910:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800914:	8b 12                	mov    (%rdx),%edx
  800916:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800919:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80091d:	89 0a                	mov    %ecx,(%rdx)
  80091f:	eb 17                	jmp    800938 <getuint+0x5b>
  800921:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800925:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800929:	48 89 d0             	mov    %rdx,%rax
  80092c:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800930:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800934:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800938:	48 8b 00             	mov    (%rax),%rax
  80093b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80093f:	e9 a3 00 00 00       	jmpq   8009e7 <getuint+0x10a>
  800944:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800948:	74 4f                	je     800999 <getuint+0xbc>
  80094a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80094e:	8b 00                	mov    (%rax),%eax
  800950:	83 f8 30             	cmp    $0x30,%eax
  800953:	73 24                	jae    800979 <getuint+0x9c>
  800955:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800959:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80095d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800961:	8b 00                	mov    (%rax),%eax
  800963:	89 c0                	mov    %eax,%eax
  800965:	48 01 d0             	add    %rdx,%rax
  800968:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80096c:	8b 12                	mov    (%rdx),%edx
  80096e:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800971:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800975:	89 0a                	mov    %ecx,(%rdx)
  800977:	eb 17                	jmp    800990 <getuint+0xb3>
  800979:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80097d:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800981:	48 89 d0             	mov    %rdx,%rax
  800984:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800988:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80098c:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800990:	48 8b 00             	mov    (%rax),%rax
  800993:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800997:	eb 4e                	jmp    8009e7 <getuint+0x10a>
  800999:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80099d:	8b 00                	mov    (%rax),%eax
  80099f:	83 f8 30             	cmp    $0x30,%eax
  8009a2:	73 24                	jae    8009c8 <getuint+0xeb>
  8009a4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009a8:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8009ac:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009b0:	8b 00                	mov    (%rax),%eax
  8009b2:	89 c0                	mov    %eax,%eax
  8009b4:	48 01 d0             	add    %rdx,%rax
  8009b7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009bb:	8b 12                	mov    (%rdx),%edx
  8009bd:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8009c0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009c4:	89 0a                	mov    %ecx,(%rdx)
  8009c6:	eb 17                	jmp    8009df <getuint+0x102>
  8009c8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009cc:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8009d0:	48 89 d0             	mov    %rdx,%rax
  8009d3:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  8009d7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009db:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8009df:	8b 00                	mov    (%rax),%eax
  8009e1:	89 c0                	mov    %eax,%eax
  8009e3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8009e7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8009eb:	c9                   	leaveq 
  8009ec:	c3                   	retq   

00000000008009ed <getint>:
  8009ed:	55                   	push   %rbp
  8009ee:	48 89 e5             	mov    %rsp,%rbp
  8009f1:	48 83 ec 1c          	sub    $0x1c,%rsp
  8009f5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8009f9:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8009fc:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800a00:	7e 52                	jle    800a54 <getint+0x67>
  800a02:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a06:	8b 00                	mov    (%rax),%eax
  800a08:	83 f8 30             	cmp    $0x30,%eax
  800a0b:	73 24                	jae    800a31 <getint+0x44>
  800a0d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a11:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800a15:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a19:	8b 00                	mov    (%rax),%eax
  800a1b:	89 c0                	mov    %eax,%eax
  800a1d:	48 01 d0             	add    %rdx,%rax
  800a20:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a24:	8b 12                	mov    (%rdx),%edx
  800a26:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800a29:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a2d:	89 0a                	mov    %ecx,(%rdx)
  800a2f:	eb 17                	jmp    800a48 <getint+0x5b>
  800a31:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a35:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800a39:	48 89 d0             	mov    %rdx,%rax
  800a3c:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800a40:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a44:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800a48:	48 8b 00             	mov    (%rax),%rax
  800a4b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800a4f:	e9 a3 00 00 00       	jmpq   800af7 <getint+0x10a>
  800a54:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800a58:	74 4f                	je     800aa9 <getint+0xbc>
  800a5a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a5e:	8b 00                	mov    (%rax),%eax
  800a60:	83 f8 30             	cmp    $0x30,%eax
  800a63:	73 24                	jae    800a89 <getint+0x9c>
  800a65:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a69:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800a6d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a71:	8b 00                	mov    (%rax),%eax
  800a73:	89 c0                	mov    %eax,%eax
  800a75:	48 01 d0             	add    %rdx,%rax
  800a78:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a7c:	8b 12                	mov    (%rdx),%edx
  800a7e:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800a81:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a85:	89 0a                	mov    %ecx,(%rdx)
  800a87:	eb 17                	jmp    800aa0 <getint+0xb3>
  800a89:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a8d:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800a91:	48 89 d0             	mov    %rdx,%rax
  800a94:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800a98:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a9c:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800aa0:	48 8b 00             	mov    (%rax),%rax
  800aa3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800aa7:	eb 4e                	jmp    800af7 <getint+0x10a>
  800aa9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800aad:	8b 00                	mov    (%rax),%eax
  800aaf:	83 f8 30             	cmp    $0x30,%eax
  800ab2:	73 24                	jae    800ad8 <getint+0xeb>
  800ab4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ab8:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800abc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ac0:	8b 00                	mov    (%rax),%eax
  800ac2:	89 c0                	mov    %eax,%eax
  800ac4:	48 01 d0             	add    %rdx,%rax
  800ac7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800acb:	8b 12                	mov    (%rdx),%edx
  800acd:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800ad0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800ad4:	89 0a                	mov    %ecx,(%rdx)
  800ad6:	eb 17                	jmp    800aef <getint+0x102>
  800ad8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800adc:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800ae0:	48 89 d0             	mov    %rdx,%rax
  800ae3:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800ae7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800aeb:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800aef:	8b 00                	mov    (%rax),%eax
  800af1:	48 98                	cltq   
  800af3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800af7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800afb:	c9                   	leaveq 
  800afc:	c3                   	retq   

0000000000800afd <vprintfmt>:
  800afd:	55                   	push   %rbp
  800afe:	48 89 e5             	mov    %rsp,%rbp
  800b01:	41 54                	push   %r12
  800b03:	53                   	push   %rbx
  800b04:	48 83 ec 60          	sub    $0x60,%rsp
  800b08:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  800b0c:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  800b10:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800b14:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  800b18:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800b1c:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  800b20:	48 8b 0a             	mov    (%rdx),%rcx
  800b23:	48 89 08             	mov    %rcx,(%rax)
  800b26:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800b2a:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800b2e:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800b32:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800b36:	eb 17                	jmp    800b4f <vprintfmt+0x52>
  800b38:	85 db                	test   %ebx,%ebx
  800b3a:	0f 84 cc 04 00 00    	je     80100c <vprintfmt+0x50f>
  800b40:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800b44:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b48:	48 89 d6             	mov    %rdx,%rsi
  800b4b:	89 df                	mov    %ebx,%edi
  800b4d:	ff d0                	callq  *%rax
  800b4f:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800b53:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800b57:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800b5b:	0f b6 00             	movzbl (%rax),%eax
  800b5e:	0f b6 d8             	movzbl %al,%ebx
  800b61:	83 fb 25             	cmp    $0x25,%ebx
  800b64:	75 d2                	jne    800b38 <vprintfmt+0x3b>
  800b66:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  800b6a:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  800b71:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800b78:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800b7f:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  800b86:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800b8a:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800b8e:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800b92:	0f b6 00             	movzbl (%rax),%eax
  800b95:	0f b6 d8             	movzbl %al,%ebx
  800b98:	8d 43 dd             	lea    -0x23(%rbx),%eax
  800b9b:	83 f8 55             	cmp    $0x55,%eax
  800b9e:	0f 87 34 04 00 00    	ja     800fd8 <vprintfmt+0x4db>
  800ba4:	89 c0                	mov    %eax,%eax
  800ba6:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800bad:	00 
  800bae:	48 b8 98 48 80 00 00 	movabs $0x804898,%rax
  800bb5:	00 00 00 
  800bb8:	48 01 d0             	add    %rdx,%rax
  800bbb:	48 8b 00             	mov    (%rax),%rax
  800bbe:	ff e0                	jmpq   *%rax
  800bc0:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  800bc4:	eb c0                	jmp    800b86 <vprintfmt+0x89>
  800bc6:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  800bca:	eb ba                	jmp    800b86 <vprintfmt+0x89>
  800bcc:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  800bd3:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800bd6:	89 d0                	mov    %edx,%eax
  800bd8:	c1 e0 02             	shl    $0x2,%eax
  800bdb:	01 d0                	add    %edx,%eax
  800bdd:	01 c0                	add    %eax,%eax
  800bdf:	01 d8                	add    %ebx,%eax
  800be1:	83 e8 30             	sub    $0x30,%eax
  800be4:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800be7:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800beb:	0f b6 00             	movzbl (%rax),%eax
  800bee:	0f be d8             	movsbl %al,%ebx
  800bf1:	83 fb 2f             	cmp    $0x2f,%ebx
  800bf4:	7e 0c                	jle    800c02 <vprintfmt+0x105>
  800bf6:	83 fb 39             	cmp    $0x39,%ebx
  800bf9:	7f 07                	jg     800c02 <vprintfmt+0x105>
  800bfb:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  800c00:	eb d1                	jmp    800bd3 <vprintfmt+0xd6>
  800c02:	eb 58                	jmp    800c5c <vprintfmt+0x15f>
  800c04:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800c07:	83 f8 30             	cmp    $0x30,%eax
  800c0a:	73 17                	jae    800c23 <vprintfmt+0x126>
  800c0c:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800c10:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800c13:	89 c0                	mov    %eax,%eax
  800c15:	48 01 d0             	add    %rdx,%rax
  800c18:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800c1b:	83 c2 08             	add    $0x8,%edx
  800c1e:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800c21:	eb 0f                	jmp    800c32 <vprintfmt+0x135>
  800c23:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800c27:	48 89 d0             	mov    %rdx,%rax
  800c2a:	48 83 c2 08          	add    $0x8,%rdx
  800c2e:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800c32:	8b 00                	mov    (%rax),%eax
  800c34:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800c37:	eb 23                	jmp    800c5c <vprintfmt+0x15f>
  800c39:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800c3d:	79 0c                	jns    800c4b <vprintfmt+0x14e>
  800c3f:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  800c46:	e9 3b ff ff ff       	jmpq   800b86 <vprintfmt+0x89>
  800c4b:	e9 36 ff ff ff       	jmpq   800b86 <vprintfmt+0x89>
  800c50:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  800c57:	e9 2a ff ff ff       	jmpq   800b86 <vprintfmt+0x89>
  800c5c:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800c60:	79 12                	jns    800c74 <vprintfmt+0x177>
  800c62:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800c65:	89 45 dc             	mov    %eax,-0x24(%rbp)
  800c68:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800c6f:	e9 12 ff ff ff       	jmpq   800b86 <vprintfmt+0x89>
  800c74:	e9 0d ff ff ff       	jmpq   800b86 <vprintfmt+0x89>
  800c79:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  800c7d:	e9 04 ff ff ff       	jmpq   800b86 <vprintfmt+0x89>
  800c82:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800c85:	83 f8 30             	cmp    $0x30,%eax
  800c88:	73 17                	jae    800ca1 <vprintfmt+0x1a4>
  800c8a:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800c8e:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800c91:	89 c0                	mov    %eax,%eax
  800c93:	48 01 d0             	add    %rdx,%rax
  800c96:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800c99:	83 c2 08             	add    $0x8,%edx
  800c9c:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800c9f:	eb 0f                	jmp    800cb0 <vprintfmt+0x1b3>
  800ca1:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800ca5:	48 89 d0             	mov    %rdx,%rax
  800ca8:	48 83 c2 08          	add    $0x8,%rdx
  800cac:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800cb0:	8b 10                	mov    (%rax),%edx
  800cb2:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800cb6:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800cba:	48 89 ce             	mov    %rcx,%rsi
  800cbd:	89 d7                	mov    %edx,%edi
  800cbf:	ff d0                	callq  *%rax
  800cc1:	e9 40 03 00 00       	jmpq   801006 <vprintfmt+0x509>
  800cc6:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800cc9:	83 f8 30             	cmp    $0x30,%eax
  800ccc:	73 17                	jae    800ce5 <vprintfmt+0x1e8>
  800cce:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800cd2:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800cd5:	89 c0                	mov    %eax,%eax
  800cd7:	48 01 d0             	add    %rdx,%rax
  800cda:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800cdd:	83 c2 08             	add    $0x8,%edx
  800ce0:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800ce3:	eb 0f                	jmp    800cf4 <vprintfmt+0x1f7>
  800ce5:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800ce9:	48 89 d0             	mov    %rdx,%rax
  800cec:	48 83 c2 08          	add    $0x8,%rdx
  800cf0:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800cf4:	8b 18                	mov    (%rax),%ebx
  800cf6:	85 db                	test   %ebx,%ebx
  800cf8:	79 02                	jns    800cfc <vprintfmt+0x1ff>
  800cfa:	f7 db                	neg    %ebx
  800cfc:	83 fb 15             	cmp    $0x15,%ebx
  800cff:	7f 16                	jg     800d17 <vprintfmt+0x21a>
  800d01:	48 b8 c0 47 80 00 00 	movabs $0x8047c0,%rax
  800d08:	00 00 00 
  800d0b:	48 63 d3             	movslq %ebx,%rdx
  800d0e:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800d12:	4d 85 e4             	test   %r12,%r12
  800d15:	75 2e                	jne    800d45 <vprintfmt+0x248>
  800d17:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800d1b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d1f:	89 d9                	mov    %ebx,%ecx
  800d21:	48 ba 81 48 80 00 00 	movabs $0x804881,%rdx
  800d28:	00 00 00 
  800d2b:	48 89 c7             	mov    %rax,%rdi
  800d2e:	b8 00 00 00 00       	mov    $0x0,%eax
  800d33:	49 b8 15 10 80 00 00 	movabs $0x801015,%r8
  800d3a:	00 00 00 
  800d3d:	41 ff d0             	callq  *%r8
  800d40:	e9 c1 02 00 00       	jmpq   801006 <vprintfmt+0x509>
  800d45:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800d49:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d4d:	4c 89 e1             	mov    %r12,%rcx
  800d50:	48 ba 8a 48 80 00 00 	movabs $0x80488a,%rdx
  800d57:	00 00 00 
  800d5a:	48 89 c7             	mov    %rax,%rdi
  800d5d:	b8 00 00 00 00       	mov    $0x0,%eax
  800d62:	49 b8 15 10 80 00 00 	movabs $0x801015,%r8
  800d69:	00 00 00 
  800d6c:	41 ff d0             	callq  *%r8
  800d6f:	e9 92 02 00 00       	jmpq   801006 <vprintfmt+0x509>
  800d74:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800d77:	83 f8 30             	cmp    $0x30,%eax
  800d7a:	73 17                	jae    800d93 <vprintfmt+0x296>
  800d7c:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800d80:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800d83:	89 c0                	mov    %eax,%eax
  800d85:	48 01 d0             	add    %rdx,%rax
  800d88:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800d8b:	83 c2 08             	add    $0x8,%edx
  800d8e:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800d91:	eb 0f                	jmp    800da2 <vprintfmt+0x2a5>
  800d93:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800d97:	48 89 d0             	mov    %rdx,%rax
  800d9a:	48 83 c2 08          	add    $0x8,%rdx
  800d9e:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800da2:	4c 8b 20             	mov    (%rax),%r12
  800da5:	4d 85 e4             	test   %r12,%r12
  800da8:	75 0a                	jne    800db4 <vprintfmt+0x2b7>
  800daa:	49 bc 8d 48 80 00 00 	movabs $0x80488d,%r12
  800db1:	00 00 00 
  800db4:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800db8:	7e 3f                	jle    800df9 <vprintfmt+0x2fc>
  800dba:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  800dbe:	74 39                	je     800df9 <vprintfmt+0x2fc>
  800dc0:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800dc3:	48 98                	cltq   
  800dc5:	48 89 c6             	mov    %rax,%rsi
  800dc8:	4c 89 e7             	mov    %r12,%rdi
  800dcb:	48 b8 1b 14 80 00 00 	movabs $0x80141b,%rax
  800dd2:	00 00 00 
  800dd5:	ff d0                	callq  *%rax
  800dd7:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800dda:	eb 17                	jmp    800df3 <vprintfmt+0x2f6>
  800ddc:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800de0:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800de4:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800de8:	48 89 ce             	mov    %rcx,%rsi
  800deb:	89 d7                	mov    %edx,%edi
  800ded:	ff d0                	callq  *%rax
  800def:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800df3:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800df7:	7f e3                	jg     800ddc <vprintfmt+0x2df>
  800df9:	eb 37                	jmp    800e32 <vprintfmt+0x335>
  800dfb:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  800dff:	74 1e                	je     800e1f <vprintfmt+0x322>
  800e01:	83 fb 1f             	cmp    $0x1f,%ebx
  800e04:	7e 05                	jle    800e0b <vprintfmt+0x30e>
  800e06:	83 fb 7e             	cmp    $0x7e,%ebx
  800e09:	7e 14                	jle    800e1f <vprintfmt+0x322>
  800e0b:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800e0f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e13:	48 89 d6             	mov    %rdx,%rsi
  800e16:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800e1b:	ff d0                	callq  *%rax
  800e1d:	eb 0f                	jmp    800e2e <vprintfmt+0x331>
  800e1f:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800e23:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e27:	48 89 d6             	mov    %rdx,%rsi
  800e2a:	89 df                	mov    %ebx,%edi
  800e2c:	ff d0                	callq  *%rax
  800e2e:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800e32:	4c 89 e0             	mov    %r12,%rax
  800e35:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800e39:	0f b6 00             	movzbl (%rax),%eax
  800e3c:	0f be d8             	movsbl %al,%ebx
  800e3f:	85 db                	test   %ebx,%ebx
  800e41:	74 10                	je     800e53 <vprintfmt+0x356>
  800e43:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800e47:	78 b2                	js     800dfb <vprintfmt+0x2fe>
  800e49:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800e4d:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800e51:	79 a8                	jns    800dfb <vprintfmt+0x2fe>
  800e53:	eb 16                	jmp    800e6b <vprintfmt+0x36e>
  800e55:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800e59:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e5d:	48 89 d6             	mov    %rdx,%rsi
  800e60:	bf 20 00 00 00       	mov    $0x20,%edi
  800e65:	ff d0                	callq  *%rax
  800e67:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800e6b:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800e6f:	7f e4                	jg     800e55 <vprintfmt+0x358>
  800e71:	e9 90 01 00 00       	jmpq   801006 <vprintfmt+0x509>
  800e76:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800e7a:	be 03 00 00 00       	mov    $0x3,%esi
  800e7f:	48 89 c7             	mov    %rax,%rdi
  800e82:	48 b8 ed 09 80 00 00 	movabs $0x8009ed,%rax
  800e89:	00 00 00 
  800e8c:	ff d0                	callq  *%rax
  800e8e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800e92:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e96:	48 85 c0             	test   %rax,%rax
  800e99:	79 1d                	jns    800eb8 <vprintfmt+0x3bb>
  800e9b:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800e9f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ea3:	48 89 d6             	mov    %rdx,%rsi
  800ea6:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800eab:	ff d0                	callq  *%rax
  800ead:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800eb1:	48 f7 d8             	neg    %rax
  800eb4:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800eb8:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800ebf:	e9 d5 00 00 00       	jmpq   800f99 <vprintfmt+0x49c>
  800ec4:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800ec8:	be 03 00 00 00       	mov    $0x3,%esi
  800ecd:	48 89 c7             	mov    %rax,%rdi
  800ed0:	48 b8 dd 08 80 00 00 	movabs $0x8008dd,%rax
  800ed7:	00 00 00 
  800eda:	ff d0                	callq  *%rax
  800edc:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800ee0:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800ee7:	e9 ad 00 00 00       	jmpq   800f99 <vprintfmt+0x49c>
  800eec:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800ef0:	be 03 00 00 00       	mov    $0x3,%esi
  800ef5:	48 89 c7             	mov    %rax,%rdi
  800ef8:	48 b8 dd 08 80 00 00 	movabs $0x8008dd,%rax
  800eff:	00 00 00 
  800f02:	ff d0                	callq  *%rax
  800f04:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800f08:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800f0f:	e9 85 00 00 00       	jmpq   800f99 <vprintfmt+0x49c>
  800f14:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800f18:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800f1c:	48 89 d6             	mov    %rdx,%rsi
  800f1f:	bf 30 00 00 00       	mov    $0x30,%edi
  800f24:	ff d0                	callq  *%rax
  800f26:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800f2a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800f2e:	48 89 d6             	mov    %rdx,%rsi
  800f31:	bf 78 00 00 00       	mov    $0x78,%edi
  800f36:	ff d0                	callq  *%rax
  800f38:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800f3b:	83 f8 30             	cmp    $0x30,%eax
  800f3e:	73 17                	jae    800f57 <vprintfmt+0x45a>
  800f40:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800f44:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800f47:	89 c0                	mov    %eax,%eax
  800f49:	48 01 d0             	add    %rdx,%rax
  800f4c:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800f4f:	83 c2 08             	add    $0x8,%edx
  800f52:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800f55:	eb 0f                	jmp    800f66 <vprintfmt+0x469>
  800f57:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800f5b:	48 89 d0             	mov    %rdx,%rax
  800f5e:	48 83 c2 08          	add    $0x8,%rdx
  800f62:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800f66:	48 8b 00             	mov    (%rax),%rax
  800f69:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800f6d:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800f74:	eb 23                	jmp    800f99 <vprintfmt+0x49c>
  800f76:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800f7a:	be 03 00 00 00       	mov    $0x3,%esi
  800f7f:	48 89 c7             	mov    %rax,%rdi
  800f82:	48 b8 dd 08 80 00 00 	movabs $0x8008dd,%rax
  800f89:	00 00 00 
  800f8c:	ff d0                	callq  *%rax
  800f8e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800f92:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800f99:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  800f9e:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800fa1:	8b 7d dc             	mov    -0x24(%rbp),%edi
  800fa4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800fa8:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800fac:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800fb0:	45 89 c1             	mov    %r8d,%r9d
  800fb3:	41 89 f8             	mov    %edi,%r8d
  800fb6:	48 89 c7             	mov    %rax,%rdi
  800fb9:	48 b8 22 08 80 00 00 	movabs $0x800822,%rax
  800fc0:	00 00 00 
  800fc3:	ff d0                	callq  *%rax
  800fc5:	eb 3f                	jmp    801006 <vprintfmt+0x509>
  800fc7:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800fcb:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800fcf:	48 89 d6             	mov    %rdx,%rsi
  800fd2:	89 df                	mov    %ebx,%edi
  800fd4:	ff d0                	callq  *%rax
  800fd6:	eb 2e                	jmp    801006 <vprintfmt+0x509>
  800fd8:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800fdc:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800fe0:	48 89 d6             	mov    %rdx,%rsi
  800fe3:	bf 25 00 00 00       	mov    $0x25,%edi
  800fe8:	ff d0                	callq  *%rax
  800fea:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800fef:	eb 05                	jmp    800ff6 <vprintfmt+0x4f9>
  800ff1:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800ff6:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800ffa:	48 83 e8 01          	sub    $0x1,%rax
  800ffe:	0f b6 00             	movzbl (%rax),%eax
  801001:	3c 25                	cmp    $0x25,%al
  801003:	75 ec                	jne    800ff1 <vprintfmt+0x4f4>
  801005:	90                   	nop
  801006:	90                   	nop
  801007:	e9 43 fb ff ff       	jmpq   800b4f <vprintfmt+0x52>
  80100c:	48 83 c4 60          	add    $0x60,%rsp
  801010:	5b                   	pop    %rbx
  801011:	41 5c                	pop    %r12
  801013:	5d                   	pop    %rbp
  801014:	c3                   	retq   

0000000000801015 <printfmt>:
  801015:	55                   	push   %rbp
  801016:	48 89 e5             	mov    %rsp,%rbp
  801019:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  801020:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  801027:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  80102e:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  801035:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  80103c:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  801043:	84 c0                	test   %al,%al
  801045:	74 20                	je     801067 <printfmt+0x52>
  801047:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  80104b:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80104f:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  801053:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  801057:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  80105b:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  80105f:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  801063:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  801067:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  80106e:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  801075:	00 00 00 
  801078:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  80107f:	00 00 00 
  801082:	48 8d 45 10          	lea    0x10(%rbp),%rax
  801086:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  80108d:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  801094:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  80109b:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  8010a2:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  8010a9:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  8010b0:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  8010b7:	48 89 c7             	mov    %rax,%rdi
  8010ba:	48 b8 fd 0a 80 00 00 	movabs $0x800afd,%rax
  8010c1:	00 00 00 
  8010c4:	ff d0                	callq  *%rax
  8010c6:	c9                   	leaveq 
  8010c7:	c3                   	retq   

00000000008010c8 <sprintputch>:
  8010c8:	55                   	push   %rbp
  8010c9:	48 89 e5             	mov    %rsp,%rbp
  8010cc:	48 83 ec 10          	sub    $0x10,%rsp
  8010d0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8010d3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8010d7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8010db:	8b 40 10             	mov    0x10(%rax),%eax
  8010de:	8d 50 01             	lea    0x1(%rax),%edx
  8010e1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8010e5:	89 50 10             	mov    %edx,0x10(%rax)
  8010e8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8010ec:	48 8b 10             	mov    (%rax),%rdx
  8010ef:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8010f3:	48 8b 40 08          	mov    0x8(%rax),%rax
  8010f7:	48 39 c2             	cmp    %rax,%rdx
  8010fa:	73 17                	jae    801113 <sprintputch+0x4b>
  8010fc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801100:	48 8b 00             	mov    (%rax),%rax
  801103:	48 8d 48 01          	lea    0x1(%rax),%rcx
  801107:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80110b:	48 89 0a             	mov    %rcx,(%rdx)
  80110e:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801111:	88 10                	mov    %dl,(%rax)
  801113:	c9                   	leaveq 
  801114:	c3                   	retq   

0000000000801115 <vsnprintf>:
  801115:	55                   	push   %rbp
  801116:	48 89 e5             	mov    %rsp,%rbp
  801119:	48 83 ec 50          	sub    $0x50,%rsp
  80111d:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  801121:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  801124:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  801128:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  80112c:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  801130:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  801134:	48 8b 0a             	mov    (%rdx),%rcx
  801137:	48 89 08             	mov    %rcx,(%rax)
  80113a:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80113e:	48 89 48 08          	mov    %rcx,0x8(%rax)
  801142:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801146:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80114a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80114e:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  801152:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  801155:	48 98                	cltq   
  801157:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80115b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80115f:	48 01 d0             	add    %rdx,%rax
  801162:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  801166:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  80116d:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  801172:	74 06                	je     80117a <vsnprintf+0x65>
  801174:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  801178:	7f 07                	jg     801181 <vsnprintf+0x6c>
  80117a:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80117f:	eb 2f                	jmp    8011b0 <vsnprintf+0x9b>
  801181:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  801185:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  801189:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  80118d:	48 89 c6             	mov    %rax,%rsi
  801190:	48 bf c8 10 80 00 00 	movabs $0x8010c8,%rdi
  801197:	00 00 00 
  80119a:	48 b8 fd 0a 80 00 00 	movabs $0x800afd,%rax
  8011a1:	00 00 00 
  8011a4:	ff d0                	callq  *%rax
  8011a6:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8011aa:	c6 00 00             	movb   $0x0,(%rax)
  8011ad:	8b 45 e0             	mov    -0x20(%rbp),%eax
  8011b0:	c9                   	leaveq 
  8011b1:	c3                   	retq   

00000000008011b2 <snprintf>:
  8011b2:	55                   	push   %rbp
  8011b3:	48 89 e5             	mov    %rsp,%rbp
  8011b6:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  8011bd:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  8011c4:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  8011ca:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8011d1:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8011d8:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8011df:	84 c0                	test   %al,%al
  8011e1:	74 20                	je     801203 <snprintf+0x51>
  8011e3:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8011e7:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8011eb:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8011ef:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8011f3:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8011f7:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8011fb:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8011ff:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  801203:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  80120a:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  801211:	00 00 00 
  801214:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  80121b:	00 00 00 
  80121e:	48 8d 45 10          	lea    0x10(%rbp),%rax
  801222:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  801229:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  801230:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  801237:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  80123e:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  801245:	48 8b 0a             	mov    (%rdx),%rcx
  801248:	48 89 08             	mov    %rcx,(%rax)
  80124b:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80124f:	48 89 48 08          	mov    %rcx,0x8(%rax)
  801253:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801257:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80125b:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  801262:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  801269:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  80126f:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  801276:	48 89 c7             	mov    %rax,%rdi
  801279:	48 b8 15 11 80 00 00 	movabs $0x801115,%rax
  801280:	00 00 00 
  801283:	ff d0                	callq  *%rax
  801285:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  80128b:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  801291:	c9                   	leaveq 
  801292:	c3                   	retq   

0000000000801293 <readline>:
  801293:	55                   	push   %rbp
  801294:	48 89 e5             	mov    %rsp,%rbp
  801297:	48 83 ec 20          	sub    $0x20,%rsp
  80129b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80129f:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8012a4:	74 27                	je     8012cd <readline+0x3a>
  8012a6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012aa:	48 89 c2             	mov    %rax,%rdx
  8012ad:	48 be 48 4b 80 00 00 	movabs $0x804b48,%rsi
  8012b4:	00 00 00 
  8012b7:	bf 01 00 00 00       	mov    $0x1,%edi
  8012bc:	b8 00 00 00 00       	mov    $0x0,%eax
  8012c1:	48 b9 27 34 80 00 00 	movabs $0x803427,%rcx
  8012c8:	00 00 00 
  8012cb:	ff d1                	callq  *%rcx
  8012cd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8012d4:	bf 00 00 00 00       	mov    $0x0,%edi
  8012d9:	48 b8 2c 02 80 00 00 	movabs $0x80022c,%rax
  8012e0:	00 00 00 
  8012e3:	ff d0                	callq  *%rax
  8012e5:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8012e8:	48 b8 e3 01 80 00 00 	movabs $0x8001e3,%rax
  8012ef:	00 00 00 
  8012f2:	ff d0                	callq  *%rax
  8012f4:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8012f7:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8012fb:	79 30                	jns    80132d <readline+0x9a>
  8012fd:	83 7d f4 f7          	cmpl   $0xfffffff7,-0xc(%rbp)
  801301:	74 20                	je     801323 <readline+0x90>
  801303:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801306:	89 c6                	mov    %eax,%esi
  801308:	48 bf 4b 4b 80 00 00 	movabs $0x804b4b,%rdi
  80130f:	00 00 00 
  801312:	b8 00 00 00 00       	mov    $0x0,%eax
  801317:	48 ba 4a 07 80 00 00 	movabs $0x80074a,%rdx
  80131e:	00 00 00 
  801321:	ff d2                	callq  *%rdx
  801323:	b8 00 00 00 00       	mov    $0x0,%eax
  801328:	e9 be 00 00 00       	jmpq   8013eb <readline+0x158>
  80132d:	83 7d f4 08          	cmpl   $0x8,-0xc(%rbp)
  801331:	74 06                	je     801339 <readline+0xa6>
  801333:	83 7d f4 7f          	cmpl   $0x7f,-0xc(%rbp)
  801337:	75 26                	jne    80135f <readline+0xcc>
  801339:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80133d:	7e 20                	jle    80135f <readline+0xcc>
  80133f:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  801343:	74 11                	je     801356 <readline+0xc3>
  801345:	bf 08 00 00 00       	mov    $0x8,%edi
  80134a:	48 b8 b8 01 80 00 00 	movabs $0x8001b8,%rax
  801351:	00 00 00 
  801354:	ff d0                	callq  *%rax
  801356:	83 6d fc 01          	subl   $0x1,-0x4(%rbp)
  80135a:	e9 87 00 00 00       	jmpq   8013e6 <readline+0x153>
  80135f:	83 7d f4 1f          	cmpl   $0x1f,-0xc(%rbp)
  801363:	7e 3f                	jle    8013a4 <readline+0x111>
  801365:	81 7d fc fe 03 00 00 	cmpl   $0x3fe,-0x4(%rbp)
  80136c:	7f 36                	jg     8013a4 <readline+0x111>
  80136e:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  801372:	74 11                	je     801385 <readline+0xf2>
  801374:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801377:	89 c7                	mov    %eax,%edi
  801379:	48 b8 b8 01 80 00 00 	movabs $0x8001b8,%rax
  801380:	00 00 00 
  801383:	ff d0                	callq  *%rax
  801385:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801388:	8d 50 01             	lea    0x1(%rax),%edx
  80138b:	89 55 fc             	mov    %edx,-0x4(%rbp)
  80138e:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801391:	89 d1                	mov    %edx,%ecx
  801393:	48 ba 00 70 80 00 00 	movabs $0x807000,%rdx
  80139a:	00 00 00 
  80139d:	48 98                	cltq   
  80139f:	88 0c 02             	mov    %cl,(%rdx,%rax,1)
  8013a2:	eb 42                	jmp    8013e6 <readline+0x153>
  8013a4:	83 7d f4 0a          	cmpl   $0xa,-0xc(%rbp)
  8013a8:	74 06                	je     8013b0 <readline+0x11d>
  8013aa:	83 7d f4 0d          	cmpl   $0xd,-0xc(%rbp)
  8013ae:	75 36                	jne    8013e6 <readline+0x153>
  8013b0:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8013b4:	74 11                	je     8013c7 <readline+0x134>
  8013b6:	bf 0a 00 00 00       	mov    $0xa,%edi
  8013bb:	48 b8 b8 01 80 00 00 	movabs $0x8001b8,%rax
  8013c2:	00 00 00 
  8013c5:	ff d0                	callq  *%rax
  8013c7:	48 ba 00 70 80 00 00 	movabs $0x807000,%rdx
  8013ce:	00 00 00 
  8013d1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8013d4:	48 98                	cltq   
  8013d6:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
  8013da:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8013e1:	00 00 00 
  8013e4:	eb 05                	jmp    8013eb <readline+0x158>
  8013e6:	e9 fd fe ff ff       	jmpq   8012e8 <readline+0x55>
  8013eb:	c9                   	leaveq 
  8013ec:	c3                   	retq   

00000000008013ed <strlen>:
  8013ed:	55                   	push   %rbp
  8013ee:	48 89 e5             	mov    %rsp,%rbp
  8013f1:	48 83 ec 18          	sub    $0x18,%rsp
  8013f5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8013f9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801400:	eb 09                	jmp    80140b <strlen+0x1e>
  801402:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801406:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80140b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80140f:	0f b6 00             	movzbl (%rax),%eax
  801412:	84 c0                	test   %al,%al
  801414:	75 ec                	jne    801402 <strlen+0x15>
  801416:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801419:	c9                   	leaveq 
  80141a:	c3                   	retq   

000000000080141b <strnlen>:
  80141b:	55                   	push   %rbp
  80141c:	48 89 e5             	mov    %rsp,%rbp
  80141f:	48 83 ec 20          	sub    $0x20,%rsp
  801423:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801427:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80142b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801432:	eb 0e                	jmp    801442 <strnlen+0x27>
  801434:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801438:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80143d:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  801442:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  801447:	74 0b                	je     801454 <strnlen+0x39>
  801449:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80144d:	0f b6 00             	movzbl (%rax),%eax
  801450:	84 c0                	test   %al,%al
  801452:	75 e0                	jne    801434 <strnlen+0x19>
  801454:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801457:	c9                   	leaveq 
  801458:	c3                   	retq   

0000000000801459 <strcpy>:
  801459:	55                   	push   %rbp
  80145a:	48 89 e5             	mov    %rsp,%rbp
  80145d:	48 83 ec 20          	sub    $0x20,%rsp
  801461:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801465:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801469:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80146d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801471:	90                   	nop
  801472:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801476:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80147a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80147e:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801482:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801486:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  80148a:	0f b6 12             	movzbl (%rdx),%edx
  80148d:	88 10                	mov    %dl,(%rax)
  80148f:	0f b6 00             	movzbl (%rax),%eax
  801492:	84 c0                	test   %al,%al
  801494:	75 dc                	jne    801472 <strcpy+0x19>
  801496:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80149a:	c9                   	leaveq 
  80149b:	c3                   	retq   

000000000080149c <strcat>:
  80149c:	55                   	push   %rbp
  80149d:	48 89 e5             	mov    %rsp,%rbp
  8014a0:	48 83 ec 20          	sub    $0x20,%rsp
  8014a4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8014a8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8014ac:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014b0:	48 89 c7             	mov    %rax,%rdi
  8014b3:	48 b8 ed 13 80 00 00 	movabs $0x8013ed,%rax
  8014ba:	00 00 00 
  8014bd:	ff d0                	callq  *%rax
  8014bf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8014c2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8014c5:	48 63 d0             	movslq %eax,%rdx
  8014c8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014cc:	48 01 c2             	add    %rax,%rdx
  8014cf:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8014d3:	48 89 c6             	mov    %rax,%rsi
  8014d6:	48 89 d7             	mov    %rdx,%rdi
  8014d9:	48 b8 59 14 80 00 00 	movabs $0x801459,%rax
  8014e0:	00 00 00 
  8014e3:	ff d0                	callq  *%rax
  8014e5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014e9:	c9                   	leaveq 
  8014ea:	c3                   	retq   

00000000008014eb <strncpy>:
  8014eb:	55                   	push   %rbp
  8014ec:	48 89 e5             	mov    %rsp,%rbp
  8014ef:	48 83 ec 28          	sub    $0x28,%rsp
  8014f3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8014f7:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8014fb:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8014ff:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801503:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801507:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80150e:	00 
  80150f:	eb 2a                	jmp    80153b <strncpy+0x50>
  801511:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801515:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801519:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80151d:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801521:	0f b6 12             	movzbl (%rdx),%edx
  801524:	88 10                	mov    %dl,(%rax)
  801526:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80152a:	0f b6 00             	movzbl (%rax),%eax
  80152d:	84 c0                	test   %al,%al
  80152f:	74 05                	je     801536 <strncpy+0x4b>
  801531:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  801536:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80153b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80153f:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  801543:	72 cc                	jb     801511 <strncpy+0x26>
  801545:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801549:	c9                   	leaveq 
  80154a:	c3                   	retq   

000000000080154b <strlcpy>:
  80154b:	55                   	push   %rbp
  80154c:	48 89 e5             	mov    %rsp,%rbp
  80154f:	48 83 ec 28          	sub    $0x28,%rsp
  801553:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801557:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80155b:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80155f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801563:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801567:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80156c:	74 3d                	je     8015ab <strlcpy+0x60>
  80156e:	eb 1d                	jmp    80158d <strlcpy+0x42>
  801570:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801574:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801578:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80157c:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801580:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801584:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  801588:	0f b6 12             	movzbl (%rdx),%edx
  80158b:	88 10                	mov    %dl,(%rax)
  80158d:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  801592:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801597:	74 0b                	je     8015a4 <strlcpy+0x59>
  801599:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80159d:	0f b6 00             	movzbl (%rax),%eax
  8015a0:	84 c0                	test   %al,%al
  8015a2:	75 cc                	jne    801570 <strlcpy+0x25>
  8015a4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8015a8:	c6 00 00             	movb   $0x0,(%rax)
  8015ab:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8015af:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015b3:	48 29 c2             	sub    %rax,%rdx
  8015b6:	48 89 d0             	mov    %rdx,%rax
  8015b9:	c9                   	leaveq 
  8015ba:	c3                   	retq   

00000000008015bb <strcmp>:
  8015bb:	55                   	push   %rbp
  8015bc:	48 89 e5             	mov    %rsp,%rbp
  8015bf:	48 83 ec 10          	sub    $0x10,%rsp
  8015c3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8015c7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8015cb:	eb 0a                	jmp    8015d7 <strcmp+0x1c>
  8015cd:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8015d2:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8015d7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015db:	0f b6 00             	movzbl (%rax),%eax
  8015de:	84 c0                	test   %al,%al
  8015e0:	74 12                	je     8015f4 <strcmp+0x39>
  8015e2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015e6:	0f b6 10             	movzbl (%rax),%edx
  8015e9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015ed:	0f b6 00             	movzbl (%rax),%eax
  8015f0:	38 c2                	cmp    %al,%dl
  8015f2:	74 d9                	je     8015cd <strcmp+0x12>
  8015f4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015f8:	0f b6 00             	movzbl (%rax),%eax
  8015fb:	0f b6 d0             	movzbl %al,%edx
  8015fe:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801602:	0f b6 00             	movzbl (%rax),%eax
  801605:	0f b6 c0             	movzbl %al,%eax
  801608:	29 c2                	sub    %eax,%edx
  80160a:	89 d0                	mov    %edx,%eax
  80160c:	c9                   	leaveq 
  80160d:	c3                   	retq   

000000000080160e <strncmp>:
  80160e:	55                   	push   %rbp
  80160f:	48 89 e5             	mov    %rsp,%rbp
  801612:	48 83 ec 18          	sub    $0x18,%rsp
  801616:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80161a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80161e:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801622:	eb 0f                	jmp    801633 <strncmp+0x25>
  801624:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  801629:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80162e:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801633:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801638:	74 1d                	je     801657 <strncmp+0x49>
  80163a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80163e:	0f b6 00             	movzbl (%rax),%eax
  801641:	84 c0                	test   %al,%al
  801643:	74 12                	je     801657 <strncmp+0x49>
  801645:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801649:	0f b6 10             	movzbl (%rax),%edx
  80164c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801650:	0f b6 00             	movzbl (%rax),%eax
  801653:	38 c2                	cmp    %al,%dl
  801655:	74 cd                	je     801624 <strncmp+0x16>
  801657:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80165c:	75 07                	jne    801665 <strncmp+0x57>
  80165e:	b8 00 00 00 00       	mov    $0x0,%eax
  801663:	eb 18                	jmp    80167d <strncmp+0x6f>
  801665:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801669:	0f b6 00             	movzbl (%rax),%eax
  80166c:	0f b6 d0             	movzbl %al,%edx
  80166f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801673:	0f b6 00             	movzbl (%rax),%eax
  801676:	0f b6 c0             	movzbl %al,%eax
  801679:	29 c2                	sub    %eax,%edx
  80167b:	89 d0                	mov    %edx,%eax
  80167d:	c9                   	leaveq 
  80167e:	c3                   	retq   

000000000080167f <strchr>:
  80167f:	55                   	push   %rbp
  801680:	48 89 e5             	mov    %rsp,%rbp
  801683:	48 83 ec 0c          	sub    $0xc,%rsp
  801687:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80168b:	89 f0                	mov    %esi,%eax
  80168d:	88 45 f4             	mov    %al,-0xc(%rbp)
  801690:	eb 17                	jmp    8016a9 <strchr+0x2a>
  801692:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801696:	0f b6 00             	movzbl (%rax),%eax
  801699:	3a 45 f4             	cmp    -0xc(%rbp),%al
  80169c:	75 06                	jne    8016a4 <strchr+0x25>
  80169e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016a2:	eb 15                	jmp    8016b9 <strchr+0x3a>
  8016a4:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8016a9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016ad:	0f b6 00             	movzbl (%rax),%eax
  8016b0:	84 c0                	test   %al,%al
  8016b2:	75 de                	jne    801692 <strchr+0x13>
  8016b4:	b8 00 00 00 00       	mov    $0x0,%eax
  8016b9:	c9                   	leaveq 
  8016ba:	c3                   	retq   

00000000008016bb <strfind>:
  8016bb:	55                   	push   %rbp
  8016bc:	48 89 e5             	mov    %rsp,%rbp
  8016bf:	48 83 ec 0c          	sub    $0xc,%rsp
  8016c3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8016c7:	89 f0                	mov    %esi,%eax
  8016c9:	88 45 f4             	mov    %al,-0xc(%rbp)
  8016cc:	eb 13                	jmp    8016e1 <strfind+0x26>
  8016ce:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016d2:	0f b6 00             	movzbl (%rax),%eax
  8016d5:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8016d8:	75 02                	jne    8016dc <strfind+0x21>
  8016da:	eb 10                	jmp    8016ec <strfind+0x31>
  8016dc:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8016e1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016e5:	0f b6 00             	movzbl (%rax),%eax
  8016e8:	84 c0                	test   %al,%al
  8016ea:	75 e2                	jne    8016ce <strfind+0x13>
  8016ec:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016f0:	c9                   	leaveq 
  8016f1:	c3                   	retq   

00000000008016f2 <memset>:
  8016f2:	55                   	push   %rbp
  8016f3:	48 89 e5             	mov    %rsp,%rbp
  8016f6:	48 83 ec 18          	sub    $0x18,%rsp
  8016fa:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8016fe:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801701:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801705:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80170a:	75 06                	jne    801712 <memset+0x20>
  80170c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801710:	eb 69                	jmp    80177b <memset+0x89>
  801712:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801716:	83 e0 03             	and    $0x3,%eax
  801719:	48 85 c0             	test   %rax,%rax
  80171c:	75 48                	jne    801766 <memset+0x74>
  80171e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801722:	83 e0 03             	and    $0x3,%eax
  801725:	48 85 c0             	test   %rax,%rax
  801728:	75 3c                	jne    801766 <memset+0x74>
  80172a:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  801731:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801734:	c1 e0 18             	shl    $0x18,%eax
  801737:	89 c2                	mov    %eax,%edx
  801739:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80173c:	c1 e0 10             	shl    $0x10,%eax
  80173f:	09 c2                	or     %eax,%edx
  801741:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801744:	c1 e0 08             	shl    $0x8,%eax
  801747:	09 d0                	or     %edx,%eax
  801749:	09 45 f4             	or     %eax,-0xc(%rbp)
  80174c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801750:	48 c1 e8 02          	shr    $0x2,%rax
  801754:	48 89 c1             	mov    %rax,%rcx
  801757:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80175b:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80175e:	48 89 d7             	mov    %rdx,%rdi
  801761:	fc                   	cld    
  801762:	f3 ab                	rep stos %eax,%es:(%rdi)
  801764:	eb 11                	jmp    801777 <memset+0x85>
  801766:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80176a:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80176d:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801771:	48 89 d7             	mov    %rdx,%rdi
  801774:	fc                   	cld    
  801775:	f3 aa                	rep stos %al,%es:(%rdi)
  801777:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80177b:	c9                   	leaveq 
  80177c:	c3                   	retq   

000000000080177d <memmove>:
  80177d:	55                   	push   %rbp
  80177e:	48 89 e5             	mov    %rsp,%rbp
  801781:	48 83 ec 28          	sub    $0x28,%rsp
  801785:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801789:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80178d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801791:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801795:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801799:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80179d:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8017a1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8017a5:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8017a9:	0f 83 88 00 00 00    	jae    801837 <memmove+0xba>
  8017af:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017b3:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8017b7:	48 01 d0             	add    %rdx,%rax
  8017ba:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8017be:	76 77                	jbe    801837 <memmove+0xba>
  8017c0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017c4:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  8017c8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017cc:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  8017d0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8017d4:	83 e0 03             	and    $0x3,%eax
  8017d7:	48 85 c0             	test   %rax,%rax
  8017da:	75 3b                	jne    801817 <memmove+0x9a>
  8017dc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017e0:	83 e0 03             	and    $0x3,%eax
  8017e3:	48 85 c0             	test   %rax,%rax
  8017e6:	75 2f                	jne    801817 <memmove+0x9a>
  8017e8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017ec:	83 e0 03             	and    $0x3,%eax
  8017ef:	48 85 c0             	test   %rax,%rax
  8017f2:	75 23                	jne    801817 <memmove+0x9a>
  8017f4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017f8:	48 83 e8 04          	sub    $0x4,%rax
  8017fc:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801800:	48 83 ea 04          	sub    $0x4,%rdx
  801804:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801808:	48 c1 e9 02          	shr    $0x2,%rcx
  80180c:	48 89 c7             	mov    %rax,%rdi
  80180f:	48 89 d6             	mov    %rdx,%rsi
  801812:	fd                   	std    
  801813:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801815:	eb 1d                	jmp    801834 <memmove+0xb7>
  801817:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80181b:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80181f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801823:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  801827:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80182b:	48 89 d7             	mov    %rdx,%rdi
  80182e:	48 89 c1             	mov    %rax,%rcx
  801831:	fd                   	std    
  801832:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801834:	fc                   	cld    
  801835:	eb 57                	jmp    80188e <memmove+0x111>
  801837:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80183b:	83 e0 03             	and    $0x3,%eax
  80183e:	48 85 c0             	test   %rax,%rax
  801841:	75 36                	jne    801879 <memmove+0xfc>
  801843:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801847:	83 e0 03             	and    $0x3,%eax
  80184a:	48 85 c0             	test   %rax,%rax
  80184d:	75 2a                	jne    801879 <memmove+0xfc>
  80184f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801853:	83 e0 03             	and    $0x3,%eax
  801856:	48 85 c0             	test   %rax,%rax
  801859:	75 1e                	jne    801879 <memmove+0xfc>
  80185b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80185f:	48 c1 e8 02          	shr    $0x2,%rax
  801863:	48 89 c1             	mov    %rax,%rcx
  801866:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80186a:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80186e:	48 89 c7             	mov    %rax,%rdi
  801871:	48 89 d6             	mov    %rdx,%rsi
  801874:	fc                   	cld    
  801875:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801877:	eb 15                	jmp    80188e <memmove+0x111>
  801879:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80187d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801881:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801885:	48 89 c7             	mov    %rax,%rdi
  801888:	48 89 d6             	mov    %rdx,%rsi
  80188b:	fc                   	cld    
  80188c:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  80188e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801892:	c9                   	leaveq 
  801893:	c3                   	retq   

0000000000801894 <memcpy>:
  801894:	55                   	push   %rbp
  801895:	48 89 e5             	mov    %rsp,%rbp
  801898:	48 83 ec 18          	sub    $0x18,%rsp
  80189c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8018a0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8018a4:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8018a8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8018ac:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8018b0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8018b4:	48 89 ce             	mov    %rcx,%rsi
  8018b7:	48 89 c7             	mov    %rax,%rdi
  8018ba:	48 b8 7d 17 80 00 00 	movabs $0x80177d,%rax
  8018c1:	00 00 00 
  8018c4:	ff d0                	callq  *%rax
  8018c6:	c9                   	leaveq 
  8018c7:	c3                   	retq   

00000000008018c8 <memcmp>:
  8018c8:	55                   	push   %rbp
  8018c9:	48 89 e5             	mov    %rsp,%rbp
  8018cc:	48 83 ec 28          	sub    $0x28,%rsp
  8018d0:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8018d4:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8018d8:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8018dc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8018e0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8018e4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8018e8:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8018ec:	eb 36                	jmp    801924 <memcmp+0x5c>
  8018ee:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8018f2:	0f b6 10             	movzbl (%rax),%edx
  8018f5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8018f9:	0f b6 00             	movzbl (%rax),%eax
  8018fc:	38 c2                	cmp    %al,%dl
  8018fe:	74 1a                	je     80191a <memcmp+0x52>
  801900:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801904:	0f b6 00             	movzbl (%rax),%eax
  801907:	0f b6 d0             	movzbl %al,%edx
  80190a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80190e:	0f b6 00             	movzbl (%rax),%eax
  801911:	0f b6 c0             	movzbl %al,%eax
  801914:	29 c2                	sub    %eax,%edx
  801916:	89 d0                	mov    %edx,%eax
  801918:	eb 20                	jmp    80193a <memcmp+0x72>
  80191a:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80191f:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801924:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801928:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80192c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801930:	48 85 c0             	test   %rax,%rax
  801933:	75 b9                	jne    8018ee <memcmp+0x26>
  801935:	b8 00 00 00 00       	mov    $0x0,%eax
  80193a:	c9                   	leaveq 
  80193b:	c3                   	retq   

000000000080193c <memfind>:
  80193c:	55                   	push   %rbp
  80193d:	48 89 e5             	mov    %rsp,%rbp
  801940:	48 83 ec 28          	sub    $0x28,%rsp
  801944:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801948:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80194b:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80194f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801953:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801957:	48 01 d0             	add    %rdx,%rax
  80195a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80195e:	eb 15                	jmp    801975 <memfind+0x39>
  801960:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801964:	0f b6 10             	movzbl (%rax),%edx
  801967:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80196a:	38 c2                	cmp    %al,%dl
  80196c:	75 02                	jne    801970 <memfind+0x34>
  80196e:	eb 0f                	jmp    80197f <memfind+0x43>
  801970:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801975:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801979:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  80197d:	72 e1                	jb     801960 <memfind+0x24>
  80197f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801983:	c9                   	leaveq 
  801984:	c3                   	retq   

0000000000801985 <strtol>:
  801985:	55                   	push   %rbp
  801986:	48 89 e5             	mov    %rsp,%rbp
  801989:	48 83 ec 34          	sub    $0x34,%rsp
  80198d:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801991:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801995:	89 55 cc             	mov    %edx,-0x34(%rbp)
  801998:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80199f:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  8019a6:	00 
  8019a7:	eb 05                	jmp    8019ae <strtol+0x29>
  8019a9:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8019ae:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019b2:	0f b6 00             	movzbl (%rax),%eax
  8019b5:	3c 20                	cmp    $0x20,%al
  8019b7:	74 f0                	je     8019a9 <strtol+0x24>
  8019b9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019bd:	0f b6 00             	movzbl (%rax),%eax
  8019c0:	3c 09                	cmp    $0x9,%al
  8019c2:	74 e5                	je     8019a9 <strtol+0x24>
  8019c4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019c8:	0f b6 00             	movzbl (%rax),%eax
  8019cb:	3c 2b                	cmp    $0x2b,%al
  8019cd:	75 07                	jne    8019d6 <strtol+0x51>
  8019cf:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8019d4:	eb 17                	jmp    8019ed <strtol+0x68>
  8019d6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019da:	0f b6 00             	movzbl (%rax),%eax
  8019dd:	3c 2d                	cmp    $0x2d,%al
  8019df:	75 0c                	jne    8019ed <strtol+0x68>
  8019e1:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8019e6:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  8019ed:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8019f1:	74 06                	je     8019f9 <strtol+0x74>
  8019f3:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  8019f7:	75 28                	jne    801a21 <strtol+0x9c>
  8019f9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019fd:	0f b6 00             	movzbl (%rax),%eax
  801a00:	3c 30                	cmp    $0x30,%al
  801a02:	75 1d                	jne    801a21 <strtol+0x9c>
  801a04:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a08:	48 83 c0 01          	add    $0x1,%rax
  801a0c:	0f b6 00             	movzbl (%rax),%eax
  801a0f:	3c 78                	cmp    $0x78,%al
  801a11:	75 0e                	jne    801a21 <strtol+0x9c>
  801a13:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  801a18:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  801a1f:	eb 2c                	jmp    801a4d <strtol+0xc8>
  801a21:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801a25:	75 19                	jne    801a40 <strtol+0xbb>
  801a27:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a2b:	0f b6 00             	movzbl (%rax),%eax
  801a2e:	3c 30                	cmp    $0x30,%al
  801a30:	75 0e                	jne    801a40 <strtol+0xbb>
  801a32:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801a37:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  801a3e:	eb 0d                	jmp    801a4d <strtol+0xc8>
  801a40:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801a44:	75 07                	jne    801a4d <strtol+0xc8>
  801a46:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  801a4d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a51:	0f b6 00             	movzbl (%rax),%eax
  801a54:	3c 2f                	cmp    $0x2f,%al
  801a56:	7e 1d                	jle    801a75 <strtol+0xf0>
  801a58:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a5c:	0f b6 00             	movzbl (%rax),%eax
  801a5f:	3c 39                	cmp    $0x39,%al
  801a61:	7f 12                	jg     801a75 <strtol+0xf0>
  801a63:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a67:	0f b6 00             	movzbl (%rax),%eax
  801a6a:	0f be c0             	movsbl %al,%eax
  801a6d:	83 e8 30             	sub    $0x30,%eax
  801a70:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801a73:	eb 4e                	jmp    801ac3 <strtol+0x13e>
  801a75:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a79:	0f b6 00             	movzbl (%rax),%eax
  801a7c:	3c 60                	cmp    $0x60,%al
  801a7e:	7e 1d                	jle    801a9d <strtol+0x118>
  801a80:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a84:	0f b6 00             	movzbl (%rax),%eax
  801a87:	3c 7a                	cmp    $0x7a,%al
  801a89:	7f 12                	jg     801a9d <strtol+0x118>
  801a8b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a8f:	0f b6 00             	movzbl (%rax),%eax
  801a92:	0f be c0             	movsbl %al,%eax
  801a95:	83 e8 57             	sub    $0x57,%eax
  801a98:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801a9b:	eb 26                	jmp    801ac3 <strtol+0x13e>
  801a9d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801aa1:	0f b6 00             	movzbl (%rax),%eax
  801aa4:	3c 40                	cmp    $0x40,%al
  801aa6:	7e 48                	jle    801af0 <strtol+0x16b>
  801aa8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801aac:	0f b6 00             	movzbl (%rax),%eax
  801aaf:	3c 5a                	cmp    $0x5a,%al
  801ab1:	7f 3d                	jg     801af0 <strtol+0x16b>
  801ab3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ab7:	0f b6 00             	movzbl (%rax),%eax
  801aba:	0f be c0             	movsbl %al,%eax
  801abd:	83 e8 37             	sub    $0x37,%eax
  801ac0:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801ac3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801ac6:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  801ac9:	7c 02                	jl     801acd <strtol+0x148>
  801acb:	eb 23                	jmp    801af0 <strtol+0x16b>
  801acd:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801ad2:	8b 45 cc             	mov    -0x34(%rbp),%eax
  801ad5:	48 98                	cltq   
  801ad7:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  801adc:	48 89 c2             	mov    %rax,%rdx
  801adf:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801ae2:	48 98                	cltq   
  801ae4:	48 01 d0             	add    %rdx,%rax
  801ae7:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801aeb:	e9 5d ff ff ff       	jmpq   801a4d <strtol+0xc8>
  801af0:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  801af5:	74 0b                	je     801b02 <strtol+0x17d>
  801af7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801afb:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801aff:	48 89 10             	mov    %rdx,(%rax)
  801b02:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801b06:	74 09                	je     801b11 <strtol+0x18c>
  801b08:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801b0c:	48 f7 d8             	neg    %rax
  801b0f:	eb 04                	jmp    801b15 <strtol+0x190>
  801b11:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801b15:	c9                   	leaveq 
  801b16:	c3                   	retq   

0000000000801b17 <strstr>:
  801b17:	55                   	push   %rbp
  801b18:	48 89 e5             	mov    %rsp,%rbp
  801b1b:	48 83 ec 30          	sub    $0x30,%rsp
  801b1f:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801b23:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801b27:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801b2b:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801b2f:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801b33:	0f b6 00             	movzbl (%rax),%eax
  801b36:	88 45 ff             	mov    %al,-0x1(%rbp)
  801b39:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  801b3d:	75 06                	jne    801b45 <strstr+0x2e>
  801b3f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801b43:	eb 6b                	jmp    801bb0 <strstr+0x99>
  801b45:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801b49:	48 89 c7             	mov    %rax,%rdi
  801b4c:	48 b8 ed 13 80 00 00 	movabs $0x8013ed,%rax
  801b53:	00 00 00 
  801b56:	ff d0                	callq  *%rax
  801b58:	48 98                	cltq   
  801b5a:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801b5e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801b62:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801b66:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801b6a:	0f b6 00             	movzbl (%rax),%eax
  801b6d:	88 45 ef             	mov    %al,-0x11(%rbp)
  801b70:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  801b74:	75 07                	jne    801b7d <strstr+0x66>
  801b76:	b8 00 00 00 00       	mov    $0x0,%eax
  801b7b:	eb 33                	jmp    801bb0 <strstr+0x99>
  801b7d:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  801b81:	3a 45 ff             	cmp    -0x1(%rbp),%al
  801b84:	75 d8                	jne    801b5e <strstr+0x47>
  801b86:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b8a:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  801b8e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801b92:	48 89 ce             	mov    %rcx,%rsi
  801b95:	48 89 c7             	mov    %rax,%rdi
  801b98:	48 b8 0e 16 80 00 00 	movabs $0x80160e,%rax
  801b9f:	00 00 00 
  801ba2:	ff d0                	callq  *%rax
  801ba4:	85 c0                	test   %eax,%eax
  801ba6:	75 b6                	jne    801b5e <strstr+0x47>
  801ba8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801bac:	48 83 e8 01          	sub    $0x1,%rax
  801bb0:	c9                   	leaveq 
  801bb1:	c3                   	retq   

0000000000801bb2 <syscall>:
  801bb2:	55                   	push   %rbp
  801bb3:	48 89 e5             	mov    %rsp,%rbp
  801bb6:	53                   	push   %rbx
  801bb7:	48 83 ec 48          	sub    $0x48,%rsp
  801bbb:	89 7d dc             	mov    %edi,-0x24(%rbp)
  801bbe:	89 75 d8             	mov    %esi,-0x28(%rbp)
  801bc1:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801bc5:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  801bc9:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  801bcd:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  801bd1:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801bd4:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  801bd8:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  801bdc:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  801be0:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  801be4:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  801be8:	4c 89 c3             	mov    %r8,%rbx
  801beb:	cd 30                	int    $0x30
  801bed:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801bf1:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801bf5:	74 3e                	je     801c35 <syscall+0x83>
  801bf7:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801bfc:	7e 37                	jle    801c35 <syscall+0x83>
  801bfe:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801c02:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801c05:	49 89 d0             	mov    %rdx,%r8
  801c08:	89 c1                	mov    %eax,%ecx
  801c0a:	48 ba 5b 4b 80 00 00 	movabs $0x804b5b,%rdx
  801c11:	00 00 00 
  801c14:	be 24 00 00 00       	mov    $0x24,%esi
  801c19:	48 bf 78 4b 80 00 00 	movabs $0x804b78,%rdi
  801c20:	00 00 00 
  801c23:	b8 00 00 00 00       	mov    $0x0,%eax
  801c28:	49 b9 11 05 80 00 00 	movabs $0x800511,%r9
  801c2f:	00 00 00 
  801c32:	41 ff d1             	callq  *%r9
  801c35:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801c39:	48 83 c4 48          	add    $0x48,%rsp
  801c3d:	5b                   	pop    %rbx
  801c3e:	5d                   	pop    %rbp
  801c3f:	c3                   	retq   

0000000000801c40 <sys_cputs>:
  801c40:	55                   	push   %rbp
  801c41:	48 89 e5             	mov    %rsp,%rbp
  801c44:	48 83 ec 20          	sub    $0x20,%rsp
  801c48:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c4c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c50:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c54:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c58:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c5f:	00 
  801c60:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c66:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c6c:	48 89 d1             	mov    %rdx,%rcx
  801c6f:	48 89 c2             	mov    %rax,%rdx
  801c72:	be 00 00 00 00       	mov    $0x0,%esi
  801c77:	bf 00 00 00 00       	mov    $0x0,%edi
  801c7c:	48 b8 b2 1b 80 00 00 	movabs $0x801bb2,%rax
  801c83:	00 00 00 
  801c86:	ff d0                	callq  *%rax
  801c88:	c9                   	leaveq 
  801c89:	c3                   	retq   

0000000000801c8a <sys_cgetc>:
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
  801cb5:	bf 01 00 00 00       	mov    $0x1,%edi
  801cba:	48 b8 b2 1b 80 00 00 	movabs $0x801bb2,%rax
  801cc1:	00 00 00 
  801cc4:	ff d0                	callq  *%rax
  801cc6:	c9                   	leaveq 
  801cc7:	c3                   	retq   

0000000000801cc8 <sys_env_destroy>:
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
  801cf4:	be 01 00 00 00       	mov    $0x1,%esi
  801cf9:	bf 03 00 00 00       	mov    $0x3,%edi
  801cfe:	48 b8 b2 1b 80 00 00 	movabs $0x801bb2,%rax
  801d05:	00 00 00 
  801d08:	ff d0                	callq  *%rax
  801d0a:	c9                   	leaveq 
  801d0b:	c3                   	retq   

0000000000801d0c <sys_getenvid>:
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
  801d37:	bf 02 00 00 00       	mov    $0x2,%edi
  801d3c:	48 b8 b2 1b 80 00 00 	movabs $0x801bb2,%rax
  801d43:	00 00 00 
  801d46:	ff d0                	callq  *%rax
  801d48:	c9                   	leaveq 
  801d49:	c3                   	retq   

0000000000801d4a <sys_yield>:
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
  801d75:	bf 0b 00 00 00       	mov    $0xb,%edi
  801d7a:	48 b8 b2 1b 80 00 00 	movabs $0x801bb2,%rax
  801d81:	00 00 00 
  801d84:	ff d0                	callq  *%rax
  801d86:	c9                   	leaveq 
  801d87:	c3                   	retq   

0000000000801d88 <sys_page_alloc>:
  801d88:	55                   	push   %rbp
  801d89:	48 89 e5             	mov    %rsp,%rbp
  801d8c:	48 83 ec 20          	sub    $0x20,%rsp
  801d90:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801d93:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d97:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801d9a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801d9d:	48 63 c8             	movslq %eax,%rcx
  801da0:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801da4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801da7:	48 98                	cltq   
  801da9:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801db0:	00 
  801db1:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801db7:	49 89 c8             	mov    %rcx,%r8
  801dba:	48 89 d1             	mov    %rdx,%rcx
  801dbd:	48 89 c2             	mov    %rax,%rdx
  801dc0:	be 01 00 00 00       	mov    $0x1,%esi
  801dc5:	bf 04 00 00 00       	mov    $0x4,%edi
  801dca:	48 b8 b2 1b 80 00 00 	movabs $0x801bb2,%rax
  801dd1:	00 00 00 
  801dd4:	ff d0                	callq  *%rax
  801dd6:	c9                   	leaveq 
  801dd7:	c3                   	retq   

0000000000801dd8 <sys_page_map>:
  801dd8:	55                   	push   %rbp
  801dd9:	48 89 e5             	mov    %rsp,%rbp
  801ddc:	48 83 ec 30          	sub    $0x30,%rsp
  801de0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801de3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801de7:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801dea:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801dee:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801df2:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801df5:	48 63 c8             	movslq %eax,%rcx
  801df8:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801dfc:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801dff:	48 63 f0             	movslq %eax,%rsi
  801e02:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801e06:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e09:	48 98                	cltq   
  801e0b:	48 89 0c 24          	mov    %rcx,(%rsp)
  801e0f:	49 89 f9             	mov    %rdi,%r9
  801e12:	49 89 f0             	mov    %rsi,%r8
  801e15:	48 89 d1             	mov    %rdx,%rcx
  801e18:	48 89 c2             	mov    %rax,%rdx
  801e1b:	be 01 00 00 00       	mov    $0x1,%esi
  801e20:	bf 05 00 00 00       	mov    $0x5,%edi
  801e25:	48 b8 b2 1b 80 00 00 	movabs $0x801bb2,%rax
  801e2c:	00 00 00 
  801e2f:	ff d0                	callq  *%rax
  801e31:	c9                   	leaveq 
  801e32:	c3                   	retq   

0000000000801e33 <sys_page_unmap>:
  801e33:	55                   	push   %rbp
  801e34:	48 89 e5             	mov    %rsp,%rbp
  801e37:	48 83 ec 20          	sub    $0x20,%rsp
  801e3b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801e3e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801e42:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801e46:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e49:	48 98                	cltq   
  801e4b:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801e52:	00 
  801e53:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e59:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e5f:	48 89 d1             	mov    %rdx,%rcx
  801e62:	48 89 c2             	mov    %rax,%rdx
  801e65:	be 01 00 00 00       	mov    $0x1,%esi
  801e6a:	bf 06 00 00 00       	mov    $0x6,%edi
  801e6f:	48 b8 b2 1b 80 00 00 	movabs $0x801bb2,%rax
  801e76:	00 00 00 
  801e79:	ff d0                	callq  *%rax
  801e7b:	c9                   	leaveq 
  801e7c:	c3                   	retq   

0000000000801e7d <sys_env_set_status>:
  801e7d:	55                   	push   %rbp
  801e7e:	48 89 e5             	mov    %rsp,%rbp
  801e81:	48 83 ec 10          	sub    $0x10,%rsp
  801e85:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801e88:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801e8b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801e8e:	48 63 d0             	movslq %eax,%rdx
  801e91:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e94:	48 98                	cltq   
  801e96:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801e9d:	00 
  801e9e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ea4:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801eaa:	48 89 d1             	mov    %rdx,%rcx
  801ead:	48 89 c2             	mov    %rax,%rdx
  801eb0:	be 01 00 00 00       	mov    $0x1,%esi
  801eb5:	bf 08 00 00 00       	mov    $0x8,%edi
  801eba:	48 b8 b2 1b 80 00 00 	movabs $0x801bb2,%rax
  801ec1:	00 00 00 
  801ec4:	ff d0                	callq  *%rax
  801ec6:	c9                   	leaveq 
  801ec7:	c3                   	retq   

0000000000801ec8 <sys_env_set_trapframe>:
  801ec8:	55                   	push   %rbp
  801ec9:	48 89 e5             	mov    %rsp,%rbp
  801ecc:	48 83 ec 20          	sub    $0x20,%rsp
  801ed0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801ed3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801ed7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801edb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ede:	48 98                	cltq   
  801ee0:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801ee7:	00 
  801ee8:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801eee:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ef4:	48 89 d1             	mov    %rdx,%rcx
  801ef7:	48 89 c2             	mov    %rax,%rdx
  801efa:	be 01 00 00 00       	mov    $0x1,%esi
  801eff:	bf 09 00 00 00       	mov    $0x9,%edi
  801f04:	48 b8 b2 1b 80 00 00 	movabs $0x801bb2,%rax
  801f0b:	00 00 00 
  801f0e:	ff d0                	callq  *%rax
  801f10:	c9                   	leaveq 
  801f11:	c3                   	retq   

0000000000801f12 <sys_env_set_pgfault_upcall>:
  801f12:	55                   	push   %rbp
  801f13:	48 89 e5             	mov    %rsp,%rbp
  801f16:	48 83 ec 20          	sub    $0x20,%rsp
  801f1a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801f1d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801f21:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801f25:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801f28:	48 98                	cltq   
  801f2a:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801f31:	00 
  801f32:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801f38:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801f3e:	48 89 d1             	mov    %rdx,%rcx
  801f41:	48 89 c2             	mov    %rax,%rdx
  801f44:	be 01 00 00 00       	mov    $0x1,%esi
  801f49:	bf 0a 00 00 00       	mov    $0xa,%edi
  801f4e:	48 b8 b2 1b 80 00 00 	movabs $0x801bb2,%rax
  801f55:	00 00 00 
  801f58:	ff d0                	callq  *%rax
  801f5a:	c9                   	leaveq 
  801f5b:	c3                   	retq   

0000000000801f5c <sys_ipc_try_send>:
  801f5c:	55                   	push   %rbp
  801f5d:	48 89 e5             	mov    %rsp,%rbp
  801f60:	48 83 ec 20          	sub    $0x20,%rsp
  801f64:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801f67:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801f6b:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801f6f:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801f72:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801f75:	48 63 f0             	movslq %eax,%rsi
  801f78:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801f7c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801f7f:	48 98                	cltq   
  801f81:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801f85:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801f8c:	00 
  801f8d:	49 89 f1             	mov    %rsi,%r9
  801f90:	49 89 c8             	mov    %rcx,%r8
  801f93:	48 89 d1             	mov    %rdx,%rcx
  801f96:	48 89 c2             	mov    %rax,%rdx
  801f99:	be 00 00 00 00       	mov    $0x0,%esi
  801f9e:	bf 0c 00 00 00       	mov    $0xc,%edi
  801fa3:	48 b8 b2 1b 80 00 00 	movabs $0x801bb2,%rax
  801faa:	00 00 00 
  801fad:	ff d0                	callq  *%rax
  801faf:	c9                   	leaveq 
  801fb0:	c3                   	retq   

0000000000801fb1 <sys_ipc_recv>:
  801fb1:	55                   	push   %rbp
  801fb2:	48 89 e5             	mov    %rsp,%rbp
  801fb5:	48 83 ec 10          	sub    $0x10,%rsp
  801fb9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801fbd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801fc1:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801fc8:	00 
  801fc9:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801fcf:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801fd5:	b9 00 00 00 00       	mov    $0x0,%ecx
  801fda:	48 89 c2             	mov    %rax,%rdx
  801fdd:	be 01 00 00 00       	mov    $0x1,%esi
  801fe2:	bf 0d 00 00 00       	mov    $0xd,%edi
  801fe7:	48 b8 b2 1b 80 00 00 	movabs $0x801bb2,%rax
  801fee:	00 00 00 
  801ff1:	ff d0                	callq  *%rax
  801ff3:	c9                   	leaveq 
  801ff4:	c3                   	retq   

0000000000801ff5 <sys_time_msec>:
  801ff5:	55                   	push   %rbp
  801ff6:	48 89 e5             	mov    %rsp,%rbp
  801ff9:	48 83 ec 10          	sub    $0x10,%rsp
  801ffd:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802004:	00 
  802005:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80200b:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802011:	b9 00 00 00 00       	mov    $0x0,%ecx
  802016:	ba 00 00 00 00       	mov    $0x0,%edx
  80201b:	be 00 00 00 00       	mov    $0x0,%esi
  802020:	bf 0e 00 00 00       	mov    $0xe,%edi
  802025:	48 b8 b2 1b 80 00 00 	movabs $0x801bb2,%rax
  80202c:	00 00 00 
  80202f:	ff d0                	callq  *%rax
  802031:	c9                   	leaveq 
  802032:	c3                   	retq   

0000000000802033 <sys_net_transmit>:
  802033:	55                   	push   %rbp
  802034:	48 89 e5             	mov    %rsp,%rbp
  802037:	48 83 ec 20          	sub    $0x20,%rsp
  80203b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80203f:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802042:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802045:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802049:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802050:	00 
  802051:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802057:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80205d:	48 89 d1             	mov    %rdx,%rcx
  802060:	48 89 c2             	mov    %rax,%rdx
  802063:	be 00 00 00 00       	mov    $0x0,%esi
  802068:	bf 0f 00 00 00       	mov    $0xf,%edi
  80206d:	48 b8 b2 1b 80 00 00 	movabs $0x801bb2,%rax
  802074:	00 00 00 
  802077:	ff d0                	callq  *%rax
  802079:	c9                   	leaveq 
  80207a:	c3                   	retq   

000000000080207b <sys_net_receive>:
  80207b:	55                   	push   %rbp
  80207c:	48 89 e5             	mov    %rsp,%rbp
  80207f:	48 83 ec 20          	sub    $0x20,%rsp
  802083:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802087:	89 75 f4             	mov    %esi,-0xc(%rbp)
  80208a:	8b 55 f4             	mov    -0xc(%rbp),%edx
  80208d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802091:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802098:	00 
  802099:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80209f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8020a5:	48 89 d1             	mov    %rdx,%rcx
  8020a8:	48 89 c2             	mov    %rax,%rdx
  8020ab:	be 00 00 00 00       	mov    $0x0,%esi
  8020b0:	bf 10 00 00 00       	mov    $0x10,%edi
  8020b5:	48 b8 b2 1b 80 00 00 	movabs $0x801bb2,%rax
  8020bc:	00 00 00 
  8020bf:	ff d0                	callq  *%rax
  8020c1:	c9                   	leaveq 
  8020c2:	c3                   	retq   

00000000008020c3 <sys_ept_map>:
  8020c3:	55                   	push   %rbp
  8020c4:	48 89 e5             	mov    %rsp,%rbp
  8020c7:	48 83 ec 30          	sub    $0x30,%rsp
  8020cb:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8020ce:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8020d2:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8020d5:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  8020d9:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  8020dd:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8020e0:	48 63 c8             	movslq %eax,%rcx
  8020e3:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  8020e7:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8020ea:	48 63 f0             	movslq %eax,%rsi
  8020ed:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8020f1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8020f4:	48 98                	cltq   
  8020f6:	48 89 0c 24          	mov    %rcx,(%rsp)
  8020fa:	49 89 f9             	mov    %rdi,%r9
  8020fd:	49 89 f0             	mov    %rsi,%r8
  802100:	48 89 d1             	mov    %rdx,%rcx
  802103:	48 89 c2             	mov    %rax,%rdx
  802106:	be 00 00 00 00       	mov    $0x0,%esi
  80210b:	bf 11 00 00 00       	mov    $0x11,%edi
  802110:	48 b8 b2 1b 80 00 00 	movabs $0x801bb2,%rax
  802117:	00 00 00 
  80211a:	ff d0                	callq  *%rax
  80211c:	c9                   	leaveq 
  80211d:	c3                   	retq   

000000000080211e <sys_env_mkguest>:
  80211e:	55                   	push   %rbp
  80211f:	48 89 e5             	mov    %rsp,%rbp
  802122:	48 83 ec 20          	sub    $0x20,%rsp
  802126:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80212a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80212e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802132:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802136:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  80213d:	00 
  80213e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802144:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80214a:	48 89 d1             	mov    %rdx,%rcx
  80214d:	48 89 c2             	mov    %rax,%rdx
  802150:	be 00 00 00 00       	mov    $0x0,%esi
  802155:	bf 12 00 00 00       	mov    $0x12,%edi
  80215a:	48 b8 b2 1b 80 00 00 	movabs $0x801bb2,%rax
  802161:	00 00 00 
  802164:	ff d0                	callq  *%rax
  802166:	c9                   	leaveq 
  802167:	c3                   	retq   

0000000000802168 <sys_vmx_list_vms>:
  802168:	55                   	push   %rbp
  802169:	48 89 e5             	mov    %rsp,%rbp
  80216c:	48 83 ec 10          	sub    $0x10,%rsp
  802170:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802177:	00 
  802178:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80217e:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802184:	b9 00 00 00 00       	mov    $0x0,%ecx
  802189:	ba 00 00 00 00       	mov    $0x0,%edx
  80218e:	be 00 00 00 00       	mov    $0x0,%esi
  802193:	bf 13 00 00 00       	mov    $0x13,%edi
  802198:	48 b8 b2 1b 80 00 00 	movabs $0x801bb2,%rax
  80219f:	00 00 00 
  8021a2:	ff d0                	callq  *%rax
  8021a4:	c9                   	leaveq 
  8021a5:	c3                   	retq   

00000000008021a6 <sys_vmx_sel_resume>:
  8021a6:	55                   	push   %rbp
  8021a7:	48 89 e5             	mov    %rsp,%rbp
  8021aa:	48 83 ec 10          	sub    $0x10,%rsp
  8021ae:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8021b1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8021b4:	48 98                	cltq   
  8021b6:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8021bd:	00 
  8021be:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8021c4:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8021ca:	b9 00 00 00 00       	mov    $0x0,%ecx
  8021cf:	48 89 c2             	mov    %rax,%rdx
  8021d2:	be 00 00 00 00       	mov    $0x0,%esi
  8021d7:	bf 14 00 00 00       	mov    $0x14,%edi
  8021dc:	48 b8 b2 1b 80 00 00 	movabs $0x801bb2,%rax
  8021e3:	00 00 00 
  8021e6:	ff d0                	callq  *%rax
  8021e8:	c9                   	leaveq 
  8021e9:	c3                   	retq   

00000000008021ea <sys_vmx_get_vmdisk_number>:
  8021ea:	55                   	push   %rbp
  8021eb:	48 89 e5             	mov    %rsp,%rbp
  8021ee:	48 83 ec 10          	sub    $0x10,%rsp
  8021f2:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8021f9:	00 
  8021fa:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802200:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802206:	b9 00 00 00 00       	mov    $0x0,%ecx
  80220b:	ba 00 00 00 00       	mov    $0x0,%edx
  802210:	be 00 00 00 00       	mov    $0x0,%esi
  802215:	bf 15 00 00 00       	mov    $0x15,%edi
  80221a:	48 b8 b2 1b 80 00 00 	movabs $0x801bb2,%rax
  802221:	00 00 00 
  802224:	ff d0                	callq  *%rax
  802226:	c9                   	leaveq 
  802227:	c3                   	retq   

0000000000802228 <sys_vmx_incr_vmdisk_number>:
  802228:	55                   	push   %rbp
  802229:	48 89 e5             	mov    %rsp,%rbp
  80222c:	48 83 ec 10          	sub    $0x10,%rsp
  802230:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802237:	00 
  802238:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80223e:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802244:	b9 00 00 00 00       	mov    $0x0,%ecx
  802249:	ba 00 00 00 00       	mov    $0x0,%edx
  80224e:	be 00 00 00 00       	mov    $0x0,%esi
  802253:	bf 16 00 00 00       	mov    $0x16,%edi
  802258:	48 b8 b2 1b 80 00 00 	movabs $0x801bb2,%rax
  80225f:	00 00 00 
  802262:	ff d0                	callq  *%rax
  802264:	c9                   	leaveq 
  802265:	c3                   	retq   

0000000000802266 <fd2num>:
  802266:	55                   	push   %rbp
  802267:	48 89 e5             	mov    %rsp,%rbp
  80226a:	48 83 ec 08          	sub    $0x8,%rsp
  80226e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802272:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802276:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  80227d:	ff ff ff 
  802280:	48 01 d0             	add    %rdx,%rax
  802283:	48 c1 e8 0c          	shr    $0xc,%rax
  802287:	c9                   	leaveq 
  802288:	c3                   	retq   

0000000000802289 <fd2data>:
  802289:	55                   	push   %rbp
  80228a:	48 89 e5             	mov    %rsp,%rbp
  80228d:	48 83 ec 08          	sub    $0x8,%rsp
  802291:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802295:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802299:	48 89 c7             	mov    %rax,%rdi
  80229c:	48 b8 66 22 80 00 00 	movabs $0x802266,%rax
  8022a3:	00 00 00 
  8022a6:	ff d0                	callq  *%rax
  8022a8:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  8022ae:	48 c1 e0 0c          	shl    $0xc,%rax
  8022b2:	c9                   	leaveq 
  8022b3:	c3                   	retq   

00000000008022b4 <fd_alloc>:
  8022b4:	55                   	push   %rbp
  8022b5:	48 89 e5             	mov    %rsp,%rbp
  8022b8:	48 83 ec 18          	sub    $0x18,%rsp
  8022bc:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8022c0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8022c7:	eb 6b                	jmp    802334 <fd_alloc+0x80>
  8022c9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8022cc:	48 98                	cltq   
  8022ce:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  8022d4:	48 c1 e0 0c          	shl    $0xc,%rax
  8022d8:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8022dc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8022e0:	48 c1 e8 15          	shr    $0x15,%rax
  8022e4:	48 89 c2             	mov    %rax,%rdx
  8022e7:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8022ee:	01 00 00 
  8022f1:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8022f5:	83 e0 01             	and    $0x1,%eax
  8022f8:	48 85 c0             	test   %rax,%rax
  8022fb:	74 21                	je     80231e <fd_alloc+0x6a>
  8022fd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802301:	48 c1 e8 0c          	shr    $0xc,%rax
  802305:	48 89 c2             	mov    %rax,%rdx
  802308:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80230f:	01 00 00 
  802312:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802316:	83 e0 01             	and    $0x1,%eax
  802319:	48 85 c0             	test   %rax,%rax
  80231c:	75 12                	jne    802330 <fd_alloc+0x7c>
  80231e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802322:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802326:	48 89 10             	mov    %rdx,(%rax)
  802329:	b8 00 00 00 00       	mov    $0x0,%eax
  80232e:	eb 1a                	jmp    80234a <fd_alloc+0x96>
  802330:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802334:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802338:	7e 8f                	jle    8022c9 <fd_alloc+0x15>
  80233a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80233e:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802345:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  80234a:	c9                   	leaveq 
  80234b:	c3                   	retq   

000000000080234c <fd_lookup>:
  80234c:	55                   	push   %rbp
  80234d:	48 89 e5             	mov    %rsp,%rbp
  802350:	48 83 ec 20          	sub    $0x20,%rsp
  802354:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802357:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80235b:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80235f:	78 06                	js     802367 <fd_lookup+0x1b>
  802361:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  802365:	7e 07                	jle    80236e <fd_lookup+0x22>
  802367:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80236c:	eb 6c                	jmp    8023da <fd_lookup+0x8e>
  80236e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802371:	48 98                	cltq   
  802373:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802379:	48 c1 e0 0c          	shl    $0xc,%rax
  80237d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802381:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802385:	48 c1 e8 15          	shr    $0x15,%rax
  802389:	48 89 c2             	mov    %rax,%rdx
  80238c:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802393:	01 00 00 
  802396:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80239a:	83 e0 01             	and    $0x1,%eax
  80239d:	48 85 c0             	test   %rax,%rax
  8023a0:	74 21                	je     8023c3 <fd_lookup+0x77>
  8023a2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8023a6:	48 c1 e8 0c          	shr    $0xc,%rax
  8023aa:	48 89 c2             	mov    %rax,%rdx
  8023ad:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8023b4:	01 00 00 
  8023b7:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8023bb:	83 e0 01             	and    $0x1,%eax
  8023be:	48 85 c0             	test   %rax,%rax
  8023c1:	75 07                	jne    8023ca <fd_lookup+0x7e>
  8023c3:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8023c8:	eb 10                	jmp    8023da <fd_lookup+0x8e>
  8023ca:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8023ce:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8023d2:	48 89 10             	mov    %rdx,(%rax)
  8023d5:	b8 00 00 00 00       	mov    $0x0,%eax
  8023da:	c9                   	leaveq 
  8023db:	c3                   	retq   

00000000008023dc <fd_close>:
  8023dc:	55                   	push   %rbp
  8023dd:	48 89 e5             	mov    %rsp,%rbp
  8023e0:	48 83 ec 30          	sub    $0x30,%rsp
  8023e4:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8023e8:	89 f0                	mov    %esi,%eax
  8023ea:	88 45 d4             	mov    %al,-0x2c(%rbp)
  8023ed:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8023f1:	48 89 c7             	mov    %rax,%rdi
  8023f4:	48 b8 66 22 80 00 00 	movabs $0x802266,%rax
  8023fb:	00 00 00 
  8023fe:	ff d0                	callq  *%rax
  802400:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802404:	48 89 d6             	mov    %rdx,%rsi
  802407:	89 c7                	mov    %eax,%edi
  802409:	48 b8 4c 23 80 00 00 	movabs $0x80234c,%rax
  802410:	00 00 00 
  802413:	ff d0                	callq  *%rax
  802415:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802418:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80241c:	78 0a                	js     802428 <fd_close+0x4c>
  80241e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802422:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  802426:	74 12                	je     80243a <fd_close+0x5e>
  802428:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  80242c:	74 05                	je     802433 <fd_close+0x57>
  80242e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802431:	eb 05                	jmp    802438 <fd_close+0x5c>
  802433:	b8 00 00 00 00       	mov    $0x0,%eax
  802438:	eb 69                	jmp    8024a3 <fd_close+0xc7>
  80243a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80243e:	8b 00                	mov    (%rax),%eax
  802440:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802444:	48 89 d6             	mov    %rdx,%rsi
  802447:	89 c7                	mov    %eax,%edi
  802449:	48 b8 a5 24 80 00 00 	movabs $0x8024a5,%rax
  802450:	00 00 00 
  802453:	ff d0                	callq  *%rax
  802455:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802458:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80245c:	78 2a                	js     802488 <fd_close+0xac>
  80245e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802462:	48 8b 40 20          	mov    0x20(%rax),%rax
  802466:	48 85 c0             	test   %rax,%rax
  802469:	74 16                	je     802481 <fd_close+0xa5>
  80246b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80246f:	48 8b 40 20          	mov    0x20(%rax),%rax
  802473:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802477:	48 89 d7             	mov    %rdx,%rdi
  80247a:	ff d0                	callq  *%rax
  80247c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80247f:	eb 07                	jmp    802488 <fd_close+0xac>
  802481:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802488:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80248c:	48 89 c6             	mov    %rax,%rsi
  80248f:	bf 00 00 00 00       	mov    $0x0,%edi
  802494:	48 b8 33 1e 80 00 00 	movabs $0x801e33,%rax
  80249b:	00 00 00 
  80249e:	ff d0                	callq  *%rax
  8024a0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024a3:	c9                   	leaveq 
  8024a4:	c3                   	retq   

00000000008024a5 <dev_lookup>:
  8024a5:	55                   	push   %rbp
  8024a6:	48 89 e5             	mov    %rsp,%rbp
  8024a9:	48 83 ec 20          	sub    $0x20,%rsp
  8024ad:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8024b0:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8024b4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8024bb:	eb 41                	jmp    8024fe <dev_lookup+0x59>
  8024bd:	48 b8 40 60 80 00 00 	movabs $0x806040,%rax
  8024c4:	00 00 00 
  8024c7:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8024ca:	48 63 d2             	movslq %edx,%rdx
  8024cd:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8024d1:	8b 00                	mov    (%rax),%eax
  8024d3:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  8024d6:	75 22                	jne    8024fa <dev_lookup+0x55>
  8024d8:	48 b8 40 60 80 00 00 	movabs $0x806040,%rax
  8024df:	00 00 00 
  8024e2:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8024e5:	48 63 d2             	movslq %edx,%rdx
  8024e8:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  8024ec:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8024f0:	48 89 10             	mov    %rdx,(%rax)
  8024f3:	b8 00 00 00 00       	mov    $0x0,%eax
  8024f8:	eb 60                	jmp    80255a <dev_lookup+0xb5>
  8024fa:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8024fe:	48 b8 40 60 80 00 00 	movabs $0x806040,%rax
  802505:	00 00 00 
  802508:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80250b:	48 63 d2             	movslq %edx,%rdx
  80250e:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802512:	48 85 c0             	test   %rax,%rax
  802515:	75 a6                	jne    8024bd <dev_lookup+0x18>
  802517:	48 b8 08 74 80 00 00 	movabs $0x807408,%rax
  80251e:	00 00 00 
  802521:	48 8b 00             	mov    (%rax),%rax
  802524:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80252a:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80252d:	89 c6                	mov    %eax,%esi
  80252f:	48 bf 90 4b 80 00 00 	movabs $0x804b90,%rdi
  802536:	00 00 00 
  802539:	b8 00 00 00 00       	mov    $0x0,%eax
  80253e:	48 b9 4a 07 80 00 00 	movabs $0x80074a,%rcx
  802545:	00 00 00 
  802548:	ff d1                	callq  *%rcx
  80254a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80254e:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802555:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80255a:	c9                   	leaveq 
  80255b:	c3                   	retq   

000000000080255c <close>:
  80255c:	55                   	push   %rbp
  80255d:	48 89 e5             	mov    %rsp,%rbp
  802560:	48 83 ec 20          	sub    $0x20,%rsp
  802564:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802567:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80256b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80256e:	48 89 d6             	mov    %rdx,%rsi
  802571:	89 c7                	mov    %eax,%edi
  802573:	48 b8 4c 23 80 00 00 	movabs $0x80234c,%rax
  80257a:	00 00 00 
  80257d:	ff d0                	callq  *%rax
  80257f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802582:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802586:	79 05                	jns    80258d <close+0x31>
  802588:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80258b:	eb 18                	jmp    8025a5 <close+0x49>
  80258d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802591:	be 01 00 00 00       	mov    $0x1,%esi
  802596:	48 89 c7             	mov    %rax,%rdi
  802599:	48 b8 dc 23 80 00 00 	movabs $0x8023dc,%rax
  8025a0:	00 00 00 
  8025a3:	ff d0                	callq  *%rax
  8025a5:	c9                   	leaveq 
  8025a6:	c3                   	retq   

00000000008025a7 <close_all>:
  8025a7:	55                   	push   %rbp
  8025a8:	48 89 e5             	mov    %rsp,%rbp
  8025ab:	48 83 ec 10          	sub    $0x10,%rsp
  8025af:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8025b6:	eb 15                	jmp    8025cd <close_all+0x26>
  8025b8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8025bb:	89 c7                	mov    %eax,%edi
  8025bd:	48 b8 5c 25 80 00 00 	movabs $0x80255c,%rax
  8025c4:	00 00 00 
  8025c7:	ff d0                	callq  *%rax
  8025c9:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8025cd:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  8025d1:	7e e5                	jle    8025b8 <close_all+0x11>
  8025d3:	c9                   	leaveq 
  8025d4:	c3                   	retq   

00000000008025d5 <dup>:
  8025d5:	55                   	push   %rbp
  8025d6:	48 89 e5             	mov    %rsp,%rbp
  8025d9:	48 83 ec 40          	sub    $0x40,%rsp
  8025dd:	89 7d cc             	mov    %edi,-0x34(%rbp)
  8025e0:	89 75 c8             	mov    %esi,-0x38(%rbp)
  8025e3:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  8025e7:	8b 45 cc             	mov    -0x34(%rbp),%eax
  8025ea:	48 89 d6             	mov    %rdx,%rsi
  8025ed:	89 c7                	mov    %eax,%edi
  8025ef:	48 b8 4c 23 80 00 00 	movabs $0x80234c,%rax
  8025f6:	00 00 00 
  8025f9:	ff d0                	callq  *%rax
  8025fb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8025fe:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802602:	79 08                	jns    80260c <dup+0x37>
  802604:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802607:	e9 70 01 00 00       	jmpq   80277c <dup+0x1a7>
  80260c:	8b 45 c8             	mov    -0x38(%rbp),%eax
  80260f:	89 c7                	mov    %eax,%edi
  802611:	48 b8 5c 25 80 00 00 	movabs $0x80255c,%rax
  802618:	00 00 00 
  80261b:	ff d0                	callq  *%rax
  80261d:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802620:	48 98                	cltq   
  802622:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802628:	48 c1 e0 0c          	shl    $0xc,%rax
  80262c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802630:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802634:	48 89 c7             	mov    %rax,%rdi
  802637:	48 b8 89 22 80 00 00 	movabs $0x802289,%rax
  80263e:	00 00 00 
  802641:	ff d0                	callq  *%rax
  802643:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802647:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80264b:	48 89 c7             	mov    %rax,%rdi
  80264e:	48 b8 89 22 80 00 00 	movabs $0x802289,%rax
  802655:	00 00 00 
  802658:	ff d0                	callq  *%rax
  80265a:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80265e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802662:	48 c1 e8 15          	shr    $0x15,%rax
  802666:	48 89 c2             	mov    %rax,%rdx
  802669:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802670:	01 00 00 
  802673:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802677:	83 e0 01             	and    $0x1,%eax
  80267a:	48 85 c0             	test   %rax,%rax
  80267d:	74 73                	je     8026f2 <dup+0x11d>
  80267f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802683:	48 c1 e8 0c          	shr    $0xc,%rax
  802687:	48 89 c2             	mov    %rax,%rdx
  80268a:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802691:	01 00 00 
  802694:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802698:	83 e0 01             	and    $0x1,%eax
  80269b:	48 85 c0             	test   %rax,%rax
  80269e:	74 52                	je     8026f2 <dup+0x11d>
  8026a0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8026a4:	48 c1 e8 0c          	shr    $0xc,%rax
  8026a8:	48 89 c2             	mov    %rax,%rdx
  8026ab:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8026b2:	01 00 00 
  8026b5:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8026b9:	25 07 0e 00 00       	and    $0xe07,%eax
  8026be:	89 c1                	mov    %eax,%ecx
  8026c0:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8026c4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8026c8:	41 89 c8             	mov    %ecx,%r8d
  8026cb:	48 89 d1             	mov    %rdx,%rcx
  8026ce:	ba 00 00 00 00       	mov    $0x0,%edx
  8026d3:	48 89 c6             	mov    %rax,%rsi
  8026d6:	bf 00 00 00 00       	mov    $0x0,%edi
  8026db:	48 b8 d8 1d 80 00 00 	movabs $0x801dd8,%rax
  8026e2:	00 00 00 
  8026e5:	ff d0                	callq  *%rax
  8026e7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8026ea:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8026ee:	79 02                	jns    8026f2 <dup+0x11d>
  8026f0:	eb 57                	jmp    802749 <dup+0x174>
  8026f2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8026f6:	48 c1 e8 0c          	shr    $0xc,%rax
  8026fa:	48 89 c2             	mov    %rax,%rdx
  8026fd:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802704:	01 00 00 
  802707:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80270b:	25 07 0e 00 00       	and    $0xe07,%eax
  802710:	89 c1                	mov    %eax,%ecx
  802712:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802716:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80271a:	41 89 c8             	mov    %ecx,%r8d
  80271d:	48 89 d1             	mov    %rdx,%rcx
  802720:	ba 00 00 00 00       	mov    $0x0,%edx
  802725:	48 89 c6             	mov    %rax,%rsi
  802728:	bf 00 00 00 00       	mov    $0x0,%edi
  80272d:	48 b8 d8 1d 80 00 00 	movabs $0x801dd8,%rax
  802734:	00 00 00 
  802737:	ff d0                	callq  *%rax
  802739:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80273c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802740:	79 02                	jns    802744 <dup+0x16f>
  802742:	eb 05                	jmp    802749 <dup+0x174>
  802744:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802747:	eb 33                	jmp    80277c <dup+0x1a7>
  802749:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80274d:	48 89 c6             	mov    %rax,%rsi
  802750:	bf 00 00 00 00       	mov    $0x0,%edi
  802755:	48 b8 33 1e 80 00 00 	movabs $0x801e33,%rax
  80275c:	00 00 00 
  80275f:	ff d0                	callq  *%rax
  802761:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802765:	48 89 c6             	mov    %rax,%rsi
  802768:	bf 00 00 00 00       	mov    $0x0,%edi
  80276d:	48 b8 33 1e 80 00 00 	movabs $0x801e33,%rax
  802774:	00 00 00 
  802777:	ff d0                	callq  *%rax
  802779:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80277c:	c9                   	leaveq 
  80277d:	c3                   	retq   

000000000080277e <read>:
  80277e:	55                   	push   %rbp
  80277f:	48 89 e5             	mov    %rsp,%rbp
  802782:	48 83 ec 40          	sub    $0x40,%rsp
  802786:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802789:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80278d:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802791:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802795:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802798:	48 89 d6             	mov    %rdx,%rsi
  80279b:	89 c7                	mov    %eax,%edi
  80279d:	48 b8 4c 23 80 00 00 	movabs $0x80234c,%rax
  8027a4:	00 00 00 
  8027a7:	ff d0                	callq  *%rax
  8027a9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8027ac:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8027b0:	78 24                	js     8027d6 <read+0x58>
  8027b2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8027b6:	8b 00                	mov    (%rax),%eax
  8027b8:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8027bc:	48 89 d6             	mov    %rdx,%rsi
  8027bf:	89 c7                	mov    %eax,%edi
  8027c1:	48 b8 a5 24 80 00 00 	movabs $0x8024a5,%rax
  8027c8:	00 00 00 
  8027cb:	ff d0                	callq  *%rax
  8027cd:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8027d0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8027d4:	79 05                	jns    8027db <read+0x5d>
  8027d6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8027d9:	eb 76                	jmp    802851 <read+0xd3>
  8027db:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8027df:	8b 40 08             	mov    0x8(%rax),%eax
  8027e2:	83 e0 03             	and    $0x3,%eax
  8027e5:	83 f8 01             	cmp    $0x1,%eax
  8027e8:	75 3a                	jne    802824 <read+0xa6>
  8027ea:	48 b8 08 74 80 00 00 	movabs $0x807408,%rax
  8027f1:	00 00 00 
  8027f4:	48 8b 00             	mov    (%rax),%rax
  8027f7:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8027fd:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802800:	89 c6                	mov    %eax,%esi
  802802:	48 bf af 4b 80 00 00 	movabs $0x804baf,%rdi
  802809:	00 00 00 
  80280c:	b8 00 00 00 00       	mov    $0x0,%eax
  802811:	48 b9 4a 07 80 00 00 	movabs $0x80074a,%rcx
  802818:	00 00 00 
  80281b:	ff d1                	callq  *%rcx
  80281d:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802822:	eb 2d                	jmp    802851 <read+0xd3>
  802824:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802828:	48 8b 40 10          	mov    0x10(%rax),%rax
  80282c:	48 85 c0             	test   %rax,%rax
  80282f:	75 07                	jne    802838 <read+0xba>
  802831:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802836:	eb 19                	jmp    802851 <read+0xd3>
  802838:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80283c:	48 8b 40 10          	mov    0x10(%rax),%rax
  802840:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802844:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802848:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  80284c:	48 89 cf             	mov    %rcx,%rdi
  80284f:	ff d0                	callq  *%rax
  802851:	c9                   	leaveq 
  802852:	c3                   	retq   

0000000000802853 <readn>:
  802853:	55                   	push   %rbp
  802854:	48 89 e5             	mov    %rsp,%rbp
  802857:	48 83 ec 30          	sub    $0x30,%rsp
  80285b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80285e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802862:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802866:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80286d:	eb 49                	jmp    8028b8 <readn+0x65>
  80286f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802872:	48 98                	cltq   
  802874:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802878:	48 29 c2             	sub    %rax,%rdx
  80287b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80287e:	48 63 c8             	movslq %eax,%rcx
  802881:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802885:	48 01 c1             	add    %rax,%rcx
  802888:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80288b:	48 89 ce             	mov    %rcx,%rsi
  80288e:	89 c7                	mov    %eax,%edi
  802890:	48 b8 7e 27 80 00 00 	movabs $0x80277e,%rax
  802897:	00 00 00 
  80289a:	ff d0                	callq  *%rax
  80289c:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80289f:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8028a3:	79 05                	jns    8028aa <readn+0x57>
  8028a5:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8028a8:	eb 1c                	jmp    8028c6 <readn+0x73>
  8028aa:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8028ae:	75 02                	jne    8028b2 <readn+0x5f>
  8028b0:	eb 11                	jmp    8028c3 <readn+0x70>
  8028b2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8028b5:	01 45 fc             	add    %eax,-0x4(%rbp)
  8028b8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8028bb:	48 98                	cltq   
  8028bd:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8028c1:	72 ac                	jb     80286f <readn+0x1c>
  8028c3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8028c6:	c9                   	leaveq 
  8028c7:	c3                   	retq   

00000000008028c8 <write>:
  8028c8:	55                   	push   %rbp
  8028c9:	48 89 e5             	mov    %rsp,%rbp
  8028cc:	48 83 ec 40          	sub    $0x40,%rsp
  8028d0:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8028d3:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8028d7:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8028db:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8028df:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8028e2:	48 89 d6             	mov    %rdx,%rsi
  8028e5:	89 c7                	mov    %eax,%edi
  8028e7:	48 b8 4c 23 80 00 00 	movabs $0x80234c,%rax
  8028ee:	00 00 00 
  8028f1:	ff d0                	callq  *%rax
  8028f3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8028f6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8028fa:	78 24                	js     802920 <write+0x58>
  8028fc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802900:	8b 00                	mov    (%rax),%eax
  802902:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802906:	48 89 d6             	mov    %rdx,%rsi
  802909:	89 c7                	mov    %eax,%edi
  80290b:	48 b8 a5 24 80 00 00 	movabs $0x8024a5,%rax
  802912:	00 00 00 
  802915:	ff d0                	callq  *%rax
  802917:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80291a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80291e:	79 05                	jns    802925 <write+0x5d>
  802920:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802923:	eb 75                	jmp    80299a <write+0xd2>
  802925:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802929:	8b 40 08             	mov    0x8(%rax),%eax
  80292c:	83 e0 03             	and    $0x3,%eax
  80292f:	85 c0                	test   %eax,%eax
  802931:	75 3a                	jne    80296d <write+0xa5>
  802933:	48 b8 08 74 80 00 00 	movabs $0x807408,%rax
  80293a:	00 00 00 
  80293d:	48 8b 00             	mov    (%rax),%rax
  802940:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802946:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802949:	89 c6                	mov    %eax,%esi
  80294b:	48 bf cb 4b 80 00 00 	movabs $0x804bcb,%rdi
  802952:	00 00 00 
  802955:	b8 00 00 00 00       	mov    $0x0,%eax
  80295a:	48 b9 4a 07 80 00 00 	movabs $0x80074a,%rcx
  802961:	00 00 00 
  802964:	ff d1                	callq  *%rcx
  802966:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80296b:	eb 2d                	jmp    80299a <write+0xd2>
  80296d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802971:	48 8b 40 18          	mov    0x18(%rax),%rax
  802975:	48 85 c0             	test   %rax,%rax
  802978:	75 07                	jne    802981 <write+0xb9>
  80297a:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80297f:	eb 19                	jmp    80299a <write+0xd2>
  802981:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802985:	48 8b 40 18          	mov    0x18(%rax),%rax
  802989:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80298d:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802991:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802995:	48 89 cf             	mov    %rcx,%rdi
  802998:	ff d0                	callq  *%rax
  80299a:	c9                   	leaveq 
  80299b:	c3                   	retq   

000000000080299c <seek>:
  80299c:	55                   	push   %rbp
  80299d:	48 89 e5             	mov    %rsp,%rbp
  8029a0:	48 83 ec 18          	sub    $0x18,%rsp
  8029a4:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8029a7:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8029aa:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8029ae:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8029b1:	48 89 d6             	mov    %rdx,%rsi
  8029b4:	89 c7                	mov    %eax,%edi
  8029b6:	48 b8 4c 23 80 00 00 	movabs $0x80234c,%rax
  8029bd:	00 00 00 
  8029c0:	ff d0                	callq  *%rax
  8029c2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8029c5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8029c9:	79 05                	jns    8029d0 <seek+0x34>
  8029cb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029ce:	eb 0f                	jmp    8029df <seek+0x43>
  8029d0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8029d4:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8029d7:	89 50 04             	mov    %edx,0x4(%rax)
  8029da:	b8 00 00 00 00       	mov    $0x0,%eax
  8029df:	c9                   	leaveq 
  8029e0:	c3                   	retq   

00000000008029e1 <ftruncate>:
  8029e1:	55                   	push   %rbp
  8029e2:	48 89 e5             	mov    %rsp,%rbp
  8029e5:	48 83 ec 30          	sub    $0x30,%rsp
  8029e9:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8029ec:	89 75 d8             	mov    %esi,-0x28(%rbp)
  8029ef:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8029f3:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8029f6:	48 89 d6             	mov    %rdx,%rsi
  8029f9:	89 c7                	mov    %eax,%edi
  8029fb:	48 b8 4c 23 80 00 00 	movabs $0x80234c,%rax
  802a02:	00 00 00 
  802a05:	ff d0                	callq  *%rax
  802a07:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802a0a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802a0e:	78 24                	js     802a34 <ftruncate+0x53>
  802a10:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802a14:	8b 00                	mov    (%rax),%eax
  802a16:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802a1a:	48 89 d6             	mov    %rdx,%rsi
  802a1d:	89 c7                	mov    %eax,%edi
  802a1f:	48 b8 a5 24 80 00 00 	movabs $0x8024a5,%rax
  802a26:	00 00 00 
  802a29:	ff d0                	callq  *%rax
  802a2b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802a2e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802a32:	79 05                	jns    802a39 <ftruncate+0x58>
  802a34:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a37:	eb 72                	jmp    802aab <ftruncate+0xca>
  802a39:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802a3d:	8b 40 08             	mov    0x8(%rax),%eax
  802a40:	83 e0 03             	and    $0x3,%eax
  802a43:	85 c0                	test   %eax,%eax
  802a45:	75 3a                	jne    802a81 <ftruncate+0xa0>
  802a47:	48 b8 08 74 80 00 00 	movabs $0x807408,%rax
  802a4e:	00 00 00 
  802a51:	48 8b 00             	mov    (%rax),%rax
  802a54:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802a5a:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802a5d:	89 c6                	mov    %eax,%esi
  802a5f:	48 bf e8 4b 80 00 00 	movabs $0x804be8,%rdi
  802a66:	00 00 00 
  802a69:	b8 00 00 00 00       	mov    $0x0,%eax
  802a6e:	48 b9 4a 07 80 00 00 	movabs $0x80074a,%rcx
  802a75:	00 00 00 
  802a78:	ff d1                	callq  *%rcx
  802a7a:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802a7f:	eb 2a                	jmp    802aab <ftruncate+0xca>
  802a81:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802a85:	48 8b 40 30          	mov    0x30(%rax),%rax
  802a89:	48 85 c0             	test   %rax,%rax
  802a8c:	75 07                	jne    802a95 <ftruncate+0xb4>
  802a8e:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802a93:	eb 16                	jmp    802aab <ftruncate+0xca>
  802a95:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802a99:	48 8b 40 30          	mov    0x30(%rax),%rax
  802a9d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802aa1:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  802aa4:	89 ce                	mov    %ecx,%esi
  802aa6:	48 89 d7             	mov    %rdx,%rdi
  802aa9:	ff d0                	callq  *%rax
  802aab:	c9                   	leaveq 
  802aac:	c3                   	retq   

0000000000802aad <fstat>:
  802aad:	55                   	push   %rbp
  802aae:	48 89 e5             	mov    %rsp,%rbp
  802ab1:	48 83 ec 30          	sub    $0x30,%rsp
  802ab5:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802ab8:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802abc:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802ac0:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802ac3:	48 89 d6             	mov    %rdx,%rsi
  802ac6:	89 c7                	mov    %eax,%edi
  802ac8:	48 b8 4c 23 80 00 00 	movabs $0x80234c,%rax
  802acf:	00 00 00 
  802ad2:	ff d0                	callq  *%rax
  802ad4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ad7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802adb:	78 24                	js     802b01 <fstat+0x54>
  802add:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ae1:	8b 00                	mov    (%rax),%eax
  802ae3:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802ae7:	48 89 d6             	mov    %rdx,%rsi
  802aea:	89 c7                	mov    %eax,%edi
  802aec:	48 b8 a5 24 80 00 00 	movabs $0x8024a5,%rax
  802af3:	00 00 00 
  802af6:	ff d0                	callq  *%rax
  802af8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802afb:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802aff:	79 05                	jns    802b06 <fstat+0x59>
  802b01:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b04:	eb 5e                	jmp    802b64 <fstat+0xb7>
  802b06:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802b0a:	48 8b 40 28          	mov    0x28(%rax),%rax
  802b0e:	48 85 c0             	test   %rax,%rax
  802b11:	75 07                	jne    802b1a <fstat+0x6d>
  802b13:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802b18:	eb 4a                	jmp    802b64 <fstat+0xb7>
  802b1a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802b1e:	c6 00 00             	movb   $0x0,(%rax)
  802b21:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802b25:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  802b2c:	00 00 00 
  802b2f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802b33:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  802b3a:	00 00 00 
  802b3d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802b41:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802b45:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  802b4c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802b50:	48 8b 40 28          	mov    0x28(%rax),%rax
  802b54:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802b58:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  802b5c:	48 89 ce             	mov    %rcx,%rsi
  802b5f:	48 89 d7             	mov    %rdx,%rdi
  802b62:	ff d0                	callq  *%rax
  802b64:	c9                   	leaveq 
  802b65:	c3                   	retq   

0000000000802b66 <stat>:
  802b66:	55                   	push   %rbp
  802b67:	48 89 e5             	mov    %rsp,%rbp
  802b6a:	48 83 ec 20          	sub    $0x20,%rsp
  802b6e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802b72:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802b76:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b7a:	be 00 00 00 00       	mov    $0x0,%esi
  802b7f:	48 89 c7             	mov    %rax,%rdi
  802b82:	48 b8 54 2c 80 00 00 	movabs $0x802c54,%rax
  802b89:	00 00 00 
  802b8c:	ff d0                	callq  *%rax
  802b8e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b91:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b95:	79 05                	jns    802b9c <stat+0x36>
  802b97:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b9a:	eb 2f                	jmp    802bcb <stat+0x65>
  802b9c:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802ba0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ba3:	48 89 d6             	mov    %rdx,%rsi
  802ba6:	89 c7                	mov    %eax,%edi
  802ba8:	48 b8 ad 2a 80 00 00 	movabs $0x802aad,%rax
  802baf:	00 00 00 
  802bb2:	ff d0                	callq  *%rax
  802bb4:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802bb7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802bba:	89 c7                	mov    %eax,%edi
  802bbc:	48 b8 5c 25 80 00 00 	movabs $0x80255c,%rax
  802bc3:	00 00 00 
  802bc6:	ff d0                	callq  *%rax
  802bc8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802bcb:	c9                   	leaveq 
  802bcc:	c3                   	retq   

0000000000802bcd <fsipc>:
  802bcd:	55                   	push   %rbp
  802bce:	48 89 e5             	mov    %rsp,%rbp
  802bd1:	48 83 ec 10          	sub    $0x10,%rsp
  802bd5:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802bd8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802bdc:	48 b8 00 74 80 00 00 	movabs $0x807400,%rax
  802be3:	00 00 00 
  802be6:	8b 00                	mov    (%rax),%eax
  802be8:	85 c0                	test   %eax,%eax
  802bea:	75 1d                	jne    802c09 <fsipc+0x3c>
  802bec:	bf 01 00 00 00       	mov    $0x1,%edi
  802bf1:	48 b8 c1 44 80 00 00 	movabs $0x8044c1,%rax
  802bf8:	00 00 00 
  802bfb:	ff d0                	callq  *%rax
  802bfd:	48 ba 00 74 80 00 00 	movabs $0x807400,%rdx
  802c04:	00 00 00 
  802c07:	89 02                	mov    %eax,(%rdx)
  802c09:	48 b8 00 74 80 00 00 	movabs $0x807400,%rax
  802c10:	00 00 00 
  802c13:	8b 00                	mov    (%rax),%eax
  802c15:	8b 75 fc             	mov    -0x4(%rbp),%esi
  802c18:	b9 07 00 00 00       	mov    $0x7,%ecx
  802c1d:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  802c24:	00 00 00 
  802c27:	89 c7                	mov    %eax,%edi
  802c29:	48 b8 2b 44 80 00 00 	movabs $0x80442b,%rax
  802c30:	00 00 00 
  802c33:	ff d0                	callq  *%rax
  802c35:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802c39:	ba 00 00 00 00       	mov    $0x0,%edx
  802c3e:	48 89 c6             	mov    %rax,%rsi
  802c41:	bf 00 00 00 00       	mov    $0x0,%edi
  802c46:	48 b8 6a 43 80 00 00 	movabs $0x80436a,%rax
  802c4d:	00 00 00 
  802c50:	ff d0                	callq  *%rax
  802c52:	c9                   	leaveq 
  802c53:	c3                   	retq   

0000000000802c54 <open>:
  802c54:	55                   	push   %rbp
  802c55:	48 89 e5             	mov    %rsp,%rbp
  802c58:	48 83 ec 20          	sub    $0x20,%rsp
  802c5c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802c60:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  802c63:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c67:	48 89 c7             	mov    %rax,%rdi
  802c6a:	48 b8 ed 13 80 00 00 	movabs $0x8013ed,%rax
  802c71:	00 00 00 
  802c74:	ff d0                	callq  *%rax
  802c76:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802c7b:	7e 0a                	jle    802c87 <open+0x33>
  802c7d:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802c82:	e9 a5 00 00 00       	jmpq   802d2c <open+0xd8>
  802c87:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802c8b:	48 89 c7             	mov    %rax,%rdi
  802c8e:	48 b8 b4 22 80 00 00 	movabs $0x8022b4,%rax
  802c95:	00 00 00 
  802c98:	ff d0                	callq  *%rax
  802c9a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c9d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ca1:	79 08                	jns    802cab <open+0x57>
  802ca3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ca6:	e9 81 00 00 00       	jmpq   802d2c <open+0xd8>
  802cab:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802caf:	48 89 c6             	mov    %rax,%rsi
  802cb2:	48 bf 00 80 80 00 00 	movabs $0x808000,%rdi
  802cb9:	00 00 00 
  802cbc:	48 b8 59 14 80 00 00 	movabs $0x801459,%rax
  802cc3:	00 00 00 
  802cc6:	ff d0                	callq  *%rax
  802cc8:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802ccf:	00 00 00 
  802cd2:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  802cd5:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  802cdb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802cdf:	48 89 c6             	mov    %rax,%rsi
  802ce2:	bf 01 00 00 00       	mov    $0x1,%edi
  802ce7:	48 b8 cd 2b 80 00 00 	movabs $0x802bcd,%rax
  802cee:	00 00 00 
  802cf1:	ff d0                	callq  *%rax
  802cf3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802cf6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802cfa:	79 1d                	jns    802d19 <open+0xc5>
  802cfc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d00:	be 00 00 00 00       	mov    $0x0,%esi
  802d05:	48 89 c7             	mov    %rax,%rdi
  802d08:	48 b8 dc 23 80 00 00 	movabs $0x8023dc,%rax
  802d0f:	00 00 00 
  802d12:	ff d0                	callq  *%rax
  802d14:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d17:	eb 13                	jmp    802d2c <open+0xd8>
  802d19:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d1d:	48 89 c7             	mov    %rax,%rdi
  802d20:	48 b8 66 22 80 00 00 	movabs $0x802266,%rax
  802d27:	00 00 00 
  802d2a:	ff d0                	callq  *%rax
  802d2c:	c9                   	leaveq 
  802d2d:	c3                   	retq   

0000000000802d2e <devfile_flush>:
  802d2e:	55                   	push   %rbp
  802d2f:	48 89 e5             	mov    %rsp,%rbp
  802d32:	48 83 ec 10          	sub    $0x10,%rsp
  802d36:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802d3a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802d3e:	8b 50 0c             	mov    0xc(%rax),%edx
  802d41:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802d48:	00 00 00 
  802d4b:	89 10                	mov    %edx,(%rax)
  802d4d:	be 00 00 00 00       	mov    $0x0,%esi
  802d52:	bf 06 00 00 00       	mov    $0x6,%edi
  802d57:	48 b8 cd 2b 80 00 00 	movabs $0x802bcd,%rax
  802d5e:	00 00 00 
  802d61:	ff d0                	callq  *%rax
  802d63:	c9                   	leaveq 
  802d64:	c3                   	retq   

0000000000802d65 <devfile_read>:
  802d65:	55                   	push   %rbp
  802d66:	48 89 e5             	mov    %rsp,%rbp
  802d69:	48 83 ec 30          	sub    $0x30,%rsp
  802d6d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802d71:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802d75:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802d79:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d7d:	8b 50 0c             	mov    0xc(%rax),%edx
  802d80:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802d87:	00 00 00 
  802d8a:	89 10                	mov    %edx,(%rax)
  802d8c:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802d93:	00 00 00 
  802d96:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802d9a:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802d9e:	be 00 00 00 00       	mov    $0x0,%esi
  802da3:	bf 03 00 00 00       	mov    $0x3,%edi
  802da8:	48 b8 cd 2b 80 00 00 	movabs $0x802bcd,%rax
  802daf:	00 00 00 
  802db2:	ff d0                	callq  *%rax
  802db4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802db7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802dbb:	79 08                	jns    802dc5 <devfile_read+0x60>
  802dbd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802dc0:	e9 a4 00 00 00       	jmpq   802e69 <devfile_read+0x104>
  802dc5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802dc8:	48 98                	cltq   
  802dca:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802dce:	76 35                	jbe    802e05 <devfile_read+0xa0>
  802dd0:	48 b9 0e 4c 80 00 00 	movabs $0x804c0e,%rcx
  802dd7:	00 00 00 
  802dda:	48 ba 15 4c 80 00 00 	movabs $0x804c15,%rdx
  802de1:	00 00 00 
  802de4:	be 89 00 00 00       	mov    $0x89,%esi
  802de9:	48 bf 2a 4c 80 00 00 	movabs $0x804c2a,%rdi
  802df0:	00 00 00 
  802df3:	b8 00 00 00 00       	mov    $0x0,%eax
  802df8:	49 b8 11 05 80 00 00 	movabs $0x800511,%r8
  802dff:	00 00 00 
  802e02:	41 ff d0             	callq  *%r8
  802e05:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  802e0c:	7e 35                	jle    802e43 <devfile_read+0xde>
  802e0e:	48 b9 38 4c 80 00 00 	movabs $0x804c38,%rcx
  802e15:	00 00 00 
  802e18:	48 ba 15 4c 80 00 00 	movabs $0x804c15,%rdx
  802e1f:	00 00 00 
  802e22:	be 8a 00 00 00       	mov    $0x8a,%esi
  802e27:	48 bf 2a 4c 80 00 00 	movabs $0x804c2a,%rdi
  802e2e:	00 00 00 
  802e31:	b8 00 00 00 00       	mov    $0x0,%eax
  802e36:	49 b8 11 05 80 00 00 	movabs $0x800511,%r8
  802e3d:	00 00 00 
  802e40:	41 ff d0             	callq  *%r8
  802e43:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e46:	48 63 d0             	movslq %eax,%rdx
  802e49:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802e4d:	48 be 00 80 80 00 00 	movabs $0x808000,%rsi
  802e54:	00 00 00 
  802e57:	48 89 c7             	mov    %rax,%rdi
  802e5a:	48 b8 7d 17 80 00 00 	movabs $0x80177d,%rax
  802e61:	00 00 00 
  802e64:	ff d0                	callq  *%rax
  802e66:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e69:	c9                   	leaveq 
  802e6a:	c3                   	retq   

0000000000802e6b <devfile_write>:
  802e6b:	55                   	push   %rbp
  802e6c:	48 89 e5             	mov    %rsp,%rbp
  802e6f:	48 83 ec 40          	sub    $0x40,%rsp
  802e73:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802e77:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802e7b:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802e7f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  802e83:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802e87:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  802e8e:	00 
  802e8f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e93:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  802e97:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  802e9c:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  802ea0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802ea4:	8b 50 0c             	mov    0xc(%rax),%edx
  802ea7:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802eae:	00 00 00 
  802eb1:	89 10                	mov    %edx,(%rax)
  802eb3:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802eba:	00 00 00 
  802ebd:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802ec1:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802ec5:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802ec9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802ecd:	48 89 c6             	mov    %rax,%rsi
  802ed0:	48 bf 10 80 80 00 00 	movabs $0x808010,%rdi
  802ed7:	00 00 00 
  802eda:	48 b8 7d 17 80 00 00 	movabs $0x80177d,%rax
  802ee1:	00 00 00 
  802ee4:	ff d0                	callq  *%rax
  802ee6:	be 00 00 00 00       	mov    $0x0,%esi
  802eeb:	bf 04 00 00 00       	mov    $0x4,%edi
  802ef0:	48 b8 cd 2b 80 00 00 	movabs $0x802bcd,%rax
  802ef7:	00 00 00 
  802efa:	ff d0                	callq  *%rax
  802efc:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802eff:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802f03:	79 05                	jns    802f0a <devfile_write+0x9f>
  802f05:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802f08:	eb 43                	jmp    802f4d <devfile_write+0xe2>
  802f0a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802f0d:	48 98                	cltq   
  802f0f:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  802f13:	76 35                	jbe    802f4a <devfile_write+0xdf>
  802f15:	48 b9 0e 4c 80 00 00 	movabs $0x804c0e,%rcx
  802f1c:	00 00 00 
  802f1f:	48 ba 15 4c 80 00 00 	movabs $0x804c15,%rdx
  802f26:	00 00 00 
  802f29:	be a8 00 00 00       	mov    $0xa8,%esi
  802f2e:	48 bf 2a 4c 80 00 00 	movabs $0x804c2a,%rdi
  802f35:	00 00 00 
  802f38:	b8 00 00 00 00       	mov    $0x0,%eax
  802f3d:	49 b8 11 05 80 00 00 	movabs $0x800511,%r8
  802f44:	00 00 00 
  802f47:	41 ff d0             	callq  *%r8
  802f4a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802f4d:	c9                   	leaveq 
  802f4e:	c3                   	retq   

0000000000802f4f <devfile_stat>:
  802f4f:	55                   	push   %rbp
  802f50:	48 89 e5             	mov    %rsp,%rbp
  802f53:	48 83 ec 20          	sub    $0x20,%rsp
  802f57:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802f5b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802f5f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f63:	8b 50 0c             	mov    0xc(%rax),%edx
  802f66:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802f6d:	00 00 00 
  802f70:	89 10                	mov    %edx,(%rax)
  802f72:	be 00 00 00 00       	mov    $0x0,%esi
  802f77:	bf 05 00 00 00       	mov    $0x5,%edi
  802f7c:	48 b8 cd 2b 80 00 00 	movabs $0x802bcd,%rax
  802f83:	00 00 00 
  802f86:	ff d0                	callq  *%rax
  802f88:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f8b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f8f:	79 05                	jns    802f96 <devfile_stat+0x47>
  802f91:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f94:	eb 56                	jmp    802fec <devfile_stat+0x9d>
  802f96:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802f9a:	48 be 00 80 80 00 00 	movabs $0x808000,%rsi
  802fa1:	00 00 00 
  802fa4:	48 89 c7             	mov    %rax,%rdi
  802fa7:	48 b8 59 14 80 00 00 	movabs $0x801459,%rax
  802fae:	00 00 00 
  802fb1:	ff d0                	callq  *%rax
  802fb3:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802fba:	00 00 00 
  802fbd:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  802fc3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802fc7:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  802fcd:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802fd4:	00 00 00 
  802fd7:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  802fdd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802fe1:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  802fe7:	b8 00 00 00 00       	mov    $0x0,%eax
  802fec:	c9                   	leaveq 
  802fed:	c3                   	retq   

0000000000802fee <devfile_trunc>:
  802fee:	55                   	push   %rbp
  802fef:	48 89 e5             	mov    %rsp,%rbp
  802ff2:	48 83 ec 10          	sub    $0x10,%rsp
  802ff6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802ffa:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802ffd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803001:	8b 50 0c             	mov    0xc(%rax),%edx
  803004:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80300b:	00 00 00 
  80300e:	89 10                	mov    %edx,(%rax)
  803010:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  803017:	00 00 00 
  80301a:	8b 55 f4             	mov    -0xc(%rbp),%edx
  80301d:	89 50 04             	mov    %edx,0x4(%rax)
  803020:	be 00 00 00 00       	mov    $0x0,%esi
  803025:	bf 02 00 00 00       	mov    $0x2,%edi
  80302a:	48 b8 cd 2b 80 00 00 	movabs $0x802bcd,%rax
  803031:	00 00 00 
  803034:	ff d0                	callq  *%rax
  803036:	c9                   	leaveq 
  803037:	c3                   	retq   

0000000000803038 <remove>:
  803038:	55                   	push   %rbp
  803039:	48 89 e5             	mov    %rsp,%rbp
  80303c:	48 83 ec 10          	sub    $0x10,%rsp
  803040:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803044:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803048:	48 89 c7             	mov    %rax,%rdi
  80304b:	48 b8 ed 13 80 00 00 	movabs $0x8013ed,%rax
  803052:	00 00 00 
  803055:	ff d0                	callq  *%rax
  803057:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  80305c:	7e 07                	jle    803065 <remove+0x2d>
  80305e:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  803063:	eb 33                	jmp    803098 <remove+0x60>
  803065:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803069:	48 89 c6             	mov    %rax,%rsi
  80306c:	48 bf 00 80 80 00 00 	movabs $0x808000,%rdi
  803073:	00 00 00 
  803076:	48 b8 59 14 80 00 00 	movabs $0x801459,%rax
  80307d:	00 00 00 
  803080:	ff d0                	callq  *%rax
  803082:	be 00 00 00 00       	mov    $0x0,%esi
  803087:	bf 07 00 00 00       	mov    $0x7,%edi
  80308c:	48 b8 cd 2b 80 00 00 	movabs $0x802bcd,%rax
  803093:	00 00 00 
  803096:	ff d0                	callq  *%rax
  803098:	c9                   	leaveq 
  803099:	c3                   	retq   

000000000080309a <sync>:
  80309a:	55                   	push   %rbp
  80309b:	48 89 e5             	mov    %rsp,%rbp
  80309e:	be 00 00 00 00       	mov    $0x0,%esi
  8030a3:	bf 08 00 00 00       	mov    $0x8,%edi
  8030a8:	48 b8 cd 2b 80 00 00 	movabs $0x802bcd,%rax
  8030af:	00 00 00 
  8030b2:	ff d0                	callq  *%rax
  8030b4:	5d                   	pop    %rbp
  8030b5:	c3                   	retq   

00000000008030b6 <copy>:
  8030b6:	55                   	push   %rbp
  8030b7:	48 89 e5             	mov    %rsp,%rbp
  8030ba:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  8030c1:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  8030c8:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  8030cf:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  8030d6:	be 00 00 00 00       	mov    $0x0,%esi
  8030db:	48 89 c7             	mov    %rax,%rdi
  8030de:	48 b8 54 2c 80 00 00 	movabs $0x802c54,%rax
  8030e5:	00 00 00 
  8030e8:	ff d0                	callq  *%rax
  8030ea:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8030ed:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8030f1:	79 28                	jns    80311b <copy+0x65>
  8030f3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030f6:	89 c6                	mov    %eax,%esi
  8030f8:	48 bf 44 4c 80 00 00 	movabs $0x804c44,%rdi
  8030ff:	00 00 00 
  803102:	b8 00 00 00 00       	mov    $0x0,%eax
  803107:	48 ba 4a 07 80 00 00 	movabs $0x80074a,%rdx
  80310e:	00 00 00 
  803111:	ff d2                	callq  *%rdx
  803113:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803116:	e9 74 01 00 00       	jmpq   80328f <copy+0x1d9>
  80311b:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  803122:	be 01 01 00 00       	mov    $0x101,%esi
  803127:	48 89 c7             	mov    %rax,%rdi
  80312a:	48 b8 54 2c 80 00 00 	movabs $0x802c54,%rax
  803131:	00 00 00 
  803134:	ff d0                	callq  *%rax
  803136:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803139:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80313d:	79 39                	jns    803178 <copy+0xc2>
  80313f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803142:	89 c6                	mov    %eax,%esi
  803144:	48 bf 5a 4c 80 00 00 	movabs $0x804c5a,%rdi
  80314b:	00 00 00 
  80314e:	b8 00 00 00 00       	mov    $0x0,%eax
  803153:	48 ba 4a 07 80 00 00 	movabs $0x80074a,%rdx
  80315a:	00 00 00 
  80315d:	ff d2                	callq  *%rdx
  80315f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803162:	89 c7                	mov    %eax,%edi
  803164:	48 b8 5c 25 80 00 00 	movabs $0x80255c,%rax
  80316b:	00 00 00 
  80316e:	ff d0                	callq  *%rax
  803170:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803173:	e9 17 01 00 00       	jmpq   80328f <copy+0x1d9>
  803178:	eb 74                	jmp    8031ee <copy+0x138>
  80317a:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80317d:	48 63 d0             	movslq %eax,%rdx
  803180:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  803187:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80318a:	48 89 ce             	mov    %rcx,%rsi
  80318d:	89 c7                	mov    %eax,%edi
  80318f:	48 b8 c8 28 80 00 00 	movabs $0x8028c8,%rax
  803196:	00 00 00 
  803199:	ff d0                	callq  *%rax
  80319b:	89 45 f0             	mov    %eax,-0x10(%rbp)
  80319e:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8031a2:	79 4a                	jns    8031ee <copy+0x138>
  8031a4:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8031a7:	89 c6                	mov    %eax,%esi
  8031a9:	48 bf 74 4c 80 00 00 	movabs $0x804c74,%rdi
  8031b0:	00 00 00 
  8031b3:	b8 00 00 00 00       	mov    $0x0,%eax
  8031b8:	48 ba 4a 07 80 00 00 	movabs $0x80074a,%rdx
  8031bf:	00 00 00 
  8031c2:	ff d2                	callq  *%rdx
  8031c4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031c7:	89 c7                	mov    %eax,%edi
  8031c9:	48 b8 5c 25 80 00 00 	movabs $0x80255c,%rax
  8031d0:	00 00 00 
  8031d3:	ff d0                	callq  *%rax
  8031d5:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8031d8:	89 c7                	mov    %eax,%edi
  8031da:	48 b8 5c 25 80 00 00 	movabs $0x80255c,%rax
  8031e1:	00 00 00 
  8031e4:	ff d0                	callq  *%rax
  8031e6:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8031e9:	e9 a1 00 00 00       	jmpq   80328f <copy+0x1d9>
  8031ee:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  8031f5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031f8:	ba 00 02 00 00       	mov    $0x200,%edx
  8031fd:	48 89 ce             	mov    %rcx,%rsi
  803200:	89 c7                	mov    %eax,%edi
  803202:	48 b8 7e 27 80 00 00 	movabs $0x80277e,%rax
  803209:	00 00 00 
  80320c:	ff d0                	callq  *%rax
  80320e:	89 45 f4             	mov    %eax,-0xc(%rbp)
  803211:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  803215:	0f 8f 5f ff ff ff    	jg     80317a <copy+0xc4>
  80321b:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  80321f:	79 47                	jns    803268 <copy+0x1b2>
  803221:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803224:	89 c6                	mov    %eax,%esi
  803226:	48 bf 87 4c 80 00 00 	movabs $0x804c87,%rdi
  80322d:	00 00 00 
  803230:	b8 00 00 00 00       	mov    $0x0,%eax
  803235:	48 ba 4a 07 80 00 00 	movabs $0x80074a,%rdx
  80323c:	00 00 00 
  80323f:	ff d2                	callq  *%rdx
  803241:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803244:	89 c7                	mov    %eax,%edi
  803246:	48 b8 5c 25 80 00 00 	movabs $0x80255c,%rax
  80324d:	00 00 00 
  803250:	ff d0                	callq  *%rax
  803252:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803255:	89 c7                	mov    %eax,%edi
  803257:	48 b8 5c 25 80 00 00 	movabs $0x80255c,%rax
  80325e:	00 00 00 
  803261:	ff d0                	callq  *%rax
  803263:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803266:	eb 27                	jmp    80328f <copy+0x1d9>
  803268:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80326b:	89 c7                	mov    %eax,%edi
  80326d:	48 b8 5c 25 80 00 00 	movabs $0x80255c,%rax
  803274:	00 00 00 
  803277:	ff d0                	callq  *%rax
  803279:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80327c:	89 c7                	mov    %eax,%edi
  80327e:	48 b8 5c 25 80 00 00 	movabs $0x80255c,%rax
  803285:	00 00 00 
  803288:	ff d0                	callq  *%rax
  80328a:	b8 00 00 00 00       	mov    $0x0,%eax
  80328f:	c9                   	leaveq 
  803290:	c3                   	retq   

0000000000803291 <writebuf>:
  803291:	55                   	push   %rbp
  803292:	48 89 e5             	mov    %rsp,%rbp
  803295:	48 83 ec 20          	sub    $0x20,%rsp
  803299:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80329d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8032a1:	8b 40 0c             	mov    0xc(%rax),%eax
  8032a4:	85 c0                	test   %eax,%eax
  8032a6:	7e 67                	jle    80330f <writebuf+0x7e>
  8032a8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8032ac:	8b 40 04             	mov    0x4(%rax),%eax
  8032af:	48 63 d0             	movslq %eax,%rdx
  8032b2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8032b6:	48 8d 48 10          	lea    0x10(%rax),%rcx
  8032ba:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8032be:	8b 00                	mov    (%rax),%eax
  8032c0:	48 89 ce             	mov    %rcx,%rsi
  8032c3:	89 c7                	mov    %eax,%edi
  8032c5:	48 b8 c8 28 80 00 00 	movabs $0x8028c8,%rax
  8032cc:	00 00 00 
  8032cf:	ff d0                	callq  *%rax
  8032d1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8032d4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8032d8:	7e 13                	jle    8032ed <writebuf+0x5c>
  8032da:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8032de:	8b 50 08             	mov    0x8(%rax),%edx
  8032e1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032e4:	01 c2                	add    %eax,%edx
  8032e6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8032ea:	89 50 08             	mov    %edx,0x8(%rax)
  8032ed:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8032f1:	8b 40 04             	mov    0x4(%rax),%eax
  8032f4:	3b 45 fc             	cmp    -0x4(%rbp),%eax
  8032f7:	74 16                	je     80330f <writebuf+0x7e>
  8032f9:	b8 00 00 00 00       	mov    $0x0,%eax
  8032fe:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803302:	0f 4e 45 fc          	cmovle -0x4(%rbp),%eax
  803306:	89 c2                	mov    %eax,%edx
  803308:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80330c:	89 50 0c             	mov    %edx,0xc(%rax)
  80330f:	c9                   	leaveq 
  803310:	c3                   	retq   

0000000000803311 <putch>:
  803311:	55                   	push   %rbp
  803312:	48 89 e5             	mov    %rsp,%rbp
  803315:	48 83 ec 20          	sub    $0x20,%rsp
  803319:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80331c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803320:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803324:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803328:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80332c:	8b 40 04             	mov    0x4(%rax),%eax
  80332f:	8d 48 01             	lea    0x1(%rax),%ecx
  803332:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  803336:	89 4a 04             	mov    %ecx,0x4(%rdx)
  803339:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80333c:	89 d1                	mov    %edx,%ecx
  80333e:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  803342:	48 98                	cltq   
  803344:	88 4c 02 10          	mov    %cl,0x10(%rdx,%rax,1)
  803348:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80334c:	8b 40 04             	mov    0x4(%rax),%eax
  80334f:	3d 00 01 00 00       	cmp    $0x100,%eax
  803354:	75 1e                	jne    803374 <putch+0x63>
  803356:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80335a:	48 89 c7             	mov    %rax,%rdi
  80335d:	48 b8 91 32 80 00 00 	movabs $0x803291,%rax
  803364:	00 00 00 
  803367:	ff d0                	callq  *%rax
  803369:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80336d:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%rax)
  803374:	c9                   	leaveq 
  803375:	c3                   	retq   

0000000000803376 <vfprintf>:
  803376:	55                   	push   %rbp
  803377:	48 89 e5             	mov    %rsp,%rbp
  80337a:	48 81 ec 30 01 00 00 	sub    $0x130,%rsp
  803381:	89 bd ec fe ff ff    	mov    %edi,-0x114(%rbp)
  803387:	48 89 b5 e0 fe ff ff 	mov    %rsi,-0x120(%rbp)
  80338e:	48 89 95 d8 fe ff ff 	mov    %rdx,-0x128(%rbp)
  803395:	8b 85 ec fe ff ff    	mov    -0x114(%rbp),%eax
  80339b:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%rbp)
  8033a1:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  8033a8:	00 00 00 
  8033ab:	c7 85 f8 fe ff ff 00 	movl   $0x0,-0x108(%rbp)
  8033b2:	00 00 00 
  8033b5:	c7 85 fc fe ff ff 01 	movl   $0x1,-0x104(%rbp)
  8033bc:	00 00 00 
  8033bf:	48 8b 8d d8 fe ff ff 	mov    -0x128(%rbp),%rcx
  8033c6:	48 8b 95 e0 fe ff ff 	mov    -0x120(%rbp),%rdx
  8033cd:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  8033d4:	48 89 c6             	mov    %rax,%rsi
  8033d7:	48 bf 11 33 80 00 00 	movabs $0x803311,%rdi
  8033de:	00 00 00 
  8033e1:	48 b8 fd 0a 80 00 00 	movabs $0x800afd,%rax
  8033e8:	00 00 00 
  8033eb:	ff d0                	callq  *%rax
  8033ed:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  8033f3:	85 c0                	test   %eax,%eax
  8033f5:	7e 16                	jle    80340d <vfprintf+0x97>
  8033f7:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  8033fe:	48 89 c7             	mov    %rax,%rdi
  803401:	48 b8 91 32 80 00 00 	movabs $0x803291,%rax
  803408:	00 00 00 
  80340b:	ff d0                	callq  *%rax
  80340d:	8b 85 f8 fe ff ff    	mov    -0x108(%rbp),%eax
  803413:	85 c0                	test   %eax,%eax
  803415:	74 08                	je     80341f <vfprintf+0xa9>
  803417:	8b 85 f8 fe ff ff    	mov    -0x108(%rbp),%eax
  80341d:	eb 06                	jmp    803425 <vfprintf+0xaf>
  80341f:	8b 85 fc fe ff ff    	mov    -0x104(%rbp),%eax
  803425:	c9                   	leaveq 
  803426:	c3                   	retq   

0000000000803427 <fprintf>:
  803427:	55                   	push   %rbp
  803428:	48 89 e5             	mov    %rsp,%rbp
  80342b:	48 81 ec e0 00 00 00 	sub    $0xe0,%rsp
  803432:	89 bd 2c ff ff ff    	mov    %edi,-0xd4(%rbp)
  803438:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  80343f:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  803446:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  80344d:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  803454:	84 c0                	test   %al,%al
  803456:	74 20                	je     803478 <fprintf+0x51>
  803458:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  80345c:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  803460:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  803464:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  803468:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  80346c:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  803470:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  803474:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  803478:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  80347f:	c7 85 30 ff ff ff 10 	movl   $0x10,-0xd0(%rbp)
  803486:	00 00 00 
  803489:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  803490:	00 00 00 
  803493:	48 8d 45 10          	lea    0x10(%rbp),%rax
  803497:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  80349e:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8034a5:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8034ac:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8034b3:	48 8b 8d 20 ff ff ff 	mov    -0xe0(%rbp),%rcx
  8034ba:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  8034c0:	48 89 ce             	mov    %rcx,%rsi
  8034c3:	89 c7                	mov    %eax,%edi
  8034c5:	48 b8 76 33 80 00 00 	movabs $0x803376,%rax
  8034cc:	00 00 00 
  8034cf:	ff d0                	callq  *%rax
  8034d1:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  8034d7:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  8034dd:	c9                   	leaveq 
  8034de:	c3                   	retq   

00000000008034df <printf>:
  8034df:	55                   	push   %rbp
  8034e0:	48 89 e5             	mov    %rsp,%rbp
  8034e3:	48 81 ec e0 00 00 00 	sub    $0xe0,%rsp
  8034ea:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  8034f1:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  8034f8:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8034ff:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  803506:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  80350d:	84 c0                	test   %al,%al
  80350f:	74 20                	je     803531 <printf+0x52>
  803511:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  803515:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  803519:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  80351d:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  803521:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  803525:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  803529:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  80352d:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  803531:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  803538:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  80353f:	00 00 00 
  803542:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  803549:	00 00 00 
  80354c:	48 8d 45 10          	lea    0x10(%rbp),%rax
  803550:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  803557:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  80355e:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  803565:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  80356c:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  803573:	48 89 c6             	mov    %rax,%rsi
  803576:	bf 01 00 00 00       	mov    $0x1,%edi
  80357b:	48 b8 76 33 80 00 00 	movabs $0x803376,%rax
  803582:	00 00 00 
  803585:	ff d0                	callq  *%rax
  803587:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  80358d:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  803593:	c9                   	leaveq 
  803594:	c3                   	retq   

0000000000803595 <fd2sockid>:
  803595:	55                   	push   %rbp
  803596:	48 89 e5             	mov    %rsp,%rbp
  803599:	48 83 ec 20          	sub    $0x20,%rsp
  80359d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8035a0:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8035a4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8035a7:	48 89 d6             	mov    %rdx,%rsi
  8035aa:	89 c7                	mov    %eax,%edi
  8035ac:	48 b8 4c 23 80 00 00 	movabs $0x80234c,%rax
  8035b3:	00 00 00 
  8035b6:	ff d0                	callq  *%rax
  8035b8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8035bb:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8035bf:	79 05                	jns    8035c6 <fd2sockid+0x31>
  8035c1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035c4:	eb 24                	jmp    8035ea <fd2sockid+0x55>
  8035c6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8035ca:	8b 10                	mov    (%rax),%edx
  8035cc:	48 b8 c0 60 80 00 00 	movabs $0x8060c0,%rax
  8035d3:	00 00 00 
  8035d6:	8b 00                	mov    (%rax),%eax
  8035d8:	39 c2                	cmp    %eax,%edx
  8035da:	74 07                	je     8035e3 <fd2sockid+0x4e>
  8035dc:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8035e1:	eb 07                	jmp    8035ea <fd2sockid+0x55>
  8035e3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8035e7:	8b 40 0c             	mov    0xc(%rax),%eax
  8035ea:	c9                   	leaveq 
  8035eb:	c3                   	retq   

00000000008035ec <alloc_sockfd>:
  8035ec:	55                   	push   %rbp
  8035ed:	48 89 e5             	mov    %rsp,%rbp
  8035f0:	48 83 ec 20          	sub    $0x20,%rsp
  8035f4:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8035f7:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8035fb:	48 89 c7             	mov    %rax,%rdi
  8035fe:	48 b8 b4 22 80 00 00 	movabs $0x8022b4,%rax
  803605:	00 00 00 
  803608:	ff d0                	callq  *%rax
  80360a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80360d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803611:	78 26                	js     803639 <alloc_sockfd+0x4d>
  803613:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803617:	ba 07 04 00 00       	mov    $0x407,%edx
  80361c:	48 89 c6             	mov    %rax,%rsi
  80361f:	bf 00 00 00 00       	mov    $0x0,%edi
  803624:	48 b8 88 1d 80 00 00 	movabs $0x801d88,%rax
  80362b:	00 00 00 
  80362e:	ff d0                	callq  *%rax
  803630:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803633:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803637:	79 16                	jns    80364f <alloc_sockfd+0x63>
  803639:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80363c:	89 c7                	mov    %eax,%edi
  80363e:	48 b8 f9 3a 80 00 00 	movabs $0x803af9,%rax
  803645:	00 00 00 
  803648:	ff d0                	callq  *%rax
  80364a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80364d:	eb 3a                	jmp    803689 <alloc_sockfd+0x9d>
  80364f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803653:	48 ba c0 60 80 00 00 	movabs $0x8060c0,%rdx
  80365a:	00 00 00 
  80365d:	8b 12                	mov    (%rdx),%edx
  80365f:	89 10                	mov    %edx,(%rax)
  803661:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803665:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  80366c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803670:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803673:	89 50 0c             	mov    %edx,0xc(%rax)
  803676:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80367a:	48 89 c7             	mov    %rax,%rdi
  80367d:	48 b8 66 22 80 00 00 	movabs $0x802266,%rax
  803684:	00 00 00 
  803687:	ff d0                	callq  *%rax
  803689:	c9                   	leaveq 
  80368a:	c3                   	retq   

000000000080368b <accept>:
  80368b:	55                   	push   %rbp
  80368c:	48 89 e5             	mov    %rsp,%rbp
  80368f:	48 83 ec 30          	sub    $0x30,%rsp
  803693:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803696:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80369a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80369e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8036a1:	89 c7                	mov    %eax,%edi
  8036a3:	48 b8 95 35 80 00 00 	movabs $0x803595,%rax
  8036aa:	00 00 00 
  8036ad:	ff d0                	callq  *%rax
  8036af:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8036b2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8036b6:	79 05                	jns    8036bd <accept+0x32>
  8036b8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036bb:	eb 3b                	jmp    8036f8 <accept+0x6d>
  8036bd:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8036c1:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8036c5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036c8:	48 89 ce             	mov    %rcx,%rsi
  8036cb:	89 c7                	mov    %eax,%edi
  8036cd:	48 b8 d6 39 80 00 00 	movabs $0x8039d6,%rax
  8036d4:	00 00 00 
  8036d7:	ff d0                	callq  *%rax
  8036d9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8036dc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8036e0:	79 05                	jns    8036e7 <accept+0x5c>
  8036e2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036e5:	eb 11                	jmp    8036f8 <accept+0x6d>
  8036e7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036ea:	89 c7                	mov    %eax,%edi
  8036ec:	48 b8 ec 35 80 00 00 	movabs $0x8035ec,%rax
  8036f3:	00 00 00 
  8036f6:	ff d0                	callq  *%rax
  8036f8:	c9                   	leaveq 
  8036f9:	c3                   	retq   

00000000008036fa <bind>:
  8036fa:	55                   	push   %rbp
  8036fb:	48 89 e5             	mov    %rsp,%rbp
  8036fe:	48 83 ec 20          	sub    $0x20,%rsp
  803702:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803705:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803709:	89 55 e8             	mov    %edx,-0x18(%rbp)
  80370c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80370f:	89 c7                	mov    %eax,%edi
  803711:	48 b8 95 35 80 00 00 	movabs $0x803595,%rax
  803718:	00 00 00 
  80371b:	ff d0                	callq  *%rax
  80371d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803720:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803724:	79 05                	jns    80372b <bind+0x31>
  803726:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803729:	eb 1b                	jmp    803746 <bind+0x4c>
  80372b:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80372e:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803732:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803735:	48 89 ce             	mov    %rcx,%rsi
  803738:	89 c7                	mov    %eax,%edi
  80373a:	48 b8 55 3a 80 00 00 	movabs $0x803a55,%rax
  803741:	00 00 00 
  803744:	ff d0                	callq  *%rax
  803746:	c9                   	leaveq 
  803747:	c3                   	retq   

0000000000803748 <shutdown>:
  803748:	55                   	push   %rbp
  803749:	48 89 e5             	mov    %rsp,%rbp
  80374c:	48 83 ec 20          	sub    $0x20,%rsp
  803750:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803753:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803756:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803759:	89 c7                	mov    %eax,%edi
  80375b:	48 b8 95 35 80 00 00 	movabs $0x803595,%rax
  803762:	00 00 00 
  803765:	ff d0                	callq  *%rax
  803767:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80376a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80376e:	79 05                	jns    803775 <shutdown+0x2d>
  803770:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803773:	eb 16                	jmp    80378b <shutdown+0x43>
  803775:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803778:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80377b:	89 d6                	mov    %edx,%esi
  80377d:	89 c7                	mov    %eax,%edi
  80377f:	48 b8 b9 3a 80 00 00 	movabs $0x803ab9,%rax
  803786:	00 00 00 
  803789:	ff d0                	callq  *%rax
  80378b:	c9                   	leaveq 
  80378c:	c3                   	retq   

000000000080378d <devsock_close>:
  80378d:	55                   	push   %rbp
  80378e:	48 89 e5             	mov    %rsp,%rbp
  803791:	48 83 ec 10          	sub    $0x10,%rsp
  803795:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803799:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80379d:	48 89 c7             	mov    %rax,%rdi
  8037a0:	48 b8 33 45 80 00 00 	movabs $0x804533,%rax
  8037a7:	00 00 00 
  8037aa:	ff d0                	callq  *%rax
  8037ac:	83 f8 01             	cmp    $0x1,%eax
  8037af:	75 17                	jne    8037c8 <devsock_close+0x3b>
  8037b1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8037b5:	8b 40 0c             	mov    0xc(%rax),%eax
  8037b8:	89 c7                	mov    %eax,%edi
  8037ba:	48 b8 f9 3a 80 00 00 	movabs $0x803af9,%rax
  8037c1:	00 00 00 
  8037c4:	ff d0                	callq  *%rax
  8037c6:	eb 05                	jmp    8037cd <devsock_close+0x40>
  8037c8:	b8 00 00 00 00       	mov    $0x0,%eax
  8037cd:	c9                   	leaveq 
  8037ce:	c3                   	retq   

00000000008037cf <connect>:
  8037cf:	55                   	push   %rbp
  8037d0:	48 89 e5             	mov    %rsp,%rbp
  8037d3:	48 83 ec 20          	sub    $0x20,%rsp
  8037d7:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8037da:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8037de:	89 55 e8             	mov    %edx,-0x18(%rbp)
  8037e1:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8037e4:	89 c7                	mov    %eax,%edi
  8037e6:	48 b8 95 35 80 00 00 	movabs $0x803595,%rax
  8037ed:	00 00 00 
  8037f0:	ff d0                	callq  *%rax
  8037f2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8037f5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8037f9:	79 05                	jns    803800 <connect+0x31>
  8037fb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037fe:	eb 1b                	jmp    80381b <connect+0x4c>
  803800:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803803:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803807:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80380a:	48 89 ce             	mov    %rcx,%rsi
  80380d:	89 c7                	mov    %eax,%edi
  80380f:	48 b8 26 3b 80 00 00 	movabs $0x803b26,%rax
  803816:	00 00 00 
  803819:	ff d0                	callq  *%rax
  80381b:	c9                   	leaveq 
  80381c:	c3                   	retq   

000000000080381d <listen>:
  80381d:	55                   	push   %rbp
  80381e:	48 89 e5             	mov    %rsp,%rbp
  803821:	48 83 ec 20          	sub    $0x20,%rsp
  803825:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803828:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80382b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80382e:	89 c7                	mov    %eax,%edi
  803830:	48 b8 95 35 80 00 00 	movabs $0x803595,%rax
  803837:	00 00 00 
  80383a:	ff d0                	callq  *%rax
  80383c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80383f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803843:	79 05                	jns    80384a <listen+0x2d>
  803845:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803848:	eb 16                	jmp    803860 <listen+0x43>
  80384a:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80384d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803850:	89 d6                	mov    %edx,%esi
  803852:	89 c7                	mov    %eax,%edi
  803854:	48 b8 8a 3b 80 00 00 	movabs $0x803b8a,%rax
  80385b:	00 00 00 
  80385e:	ff d0                	callq  *%rax
  803860:	c9                   	leaveq 
  803861:	c3                   	retq   

0000000000803862 <devsock_read>:
  803862:	55                   	push   %rbp
  803863:	48 89 e5             	mov    %rsp,%rbp
  803866:	48 83 ec 20          	sub    $0x20,%rsp
  80386a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80386e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803872:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803876:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80387a:	89 c2                	mov    %eax,%edx
  80387c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803880:	8b 40 0c             	mov    0xc(%rax),%eax
  803883:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803887:	b9 00 00 00 00       	mov    $0x0,%ecx
  80388c:	89 c7                	mov    %eax,%edi
  80388e:	48 b8 ca 3b 80 00 00 	movabs $0x803bca,%rax
  803895:	00 00 00 
  803898:	ff d0                	callq  *%rax
  80389a:	c9                   	leaveq 
  80389b:	c3                   	retq   

000000000080389c <devsock_write>:
  80389c:	55                   	push   %rbp
  80389d:	48 89 e5             	mov    %rsp,%rbp
  8038a0:	48 83 ec 20          	sub    $0x20,%rsp
  8038a4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8038a8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8038ac:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8038b0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8038b4:	89 c2                	mov    %eax,%edx
  8038b6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8038ba:	8b 40 0c             	mov    0xc(%rax),%eax
  8038bd:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  8038c1:	b9 00 00 00 00       	mov    $0x0,%ecx
  8038c6:	89 c7                	mov    %eax,%edi
  8038c8:	48 b8 96 3c 80 00 00 	movabs $0x803c96,%rax
  8038cf:	00 00 00 
  8038d2:	ff d0                	callq  *%rax
  8038d4:	c9                   	leaveq 
  8038d5:	c3                   	retq   

00000000008038d6 <devsock_stat>:
  8038d6:	55                   	push   %rbp
  8038d7:	48 89 e5             	mov    %rsp,%rbp
  8038da:	48 83 ec 10          	sub    $0x10,%rsp
  8038de:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8038e2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8038e6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8038ea:	48 be a2 4c 80 00 00 	movabs $0x804ca2,%rsi
  8038f1:	00 00 00 
  8038f4:	48 89 c7             	mov    %rax,%rdi
  8038f7:	48 b8 59 14 80 00 00 	movabs $0x801459,%rax
  8038fe:	00 00 00 
  803901:	ff d0                	callq  *%rax
  803903:	b8 00 00 00 00       	mov    $0x0,%eax
  803908:	c9                   	leaveq 
  803909:	c3                   	retq   

000000000080390a <socket>:
  80390a:	55                   	push   %rbp
  80390b:	48 89 e5             	mov    %rsp,%rbp
  80390e:	48 83 ec 20          	sub    $0x20,%rsp
  803912:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803915:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803918:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  80391b:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  80391e:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803921:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803924:	89 ce                	mov    %ecx,%esi
  803926:	89 c7                	mov    %eax,%edi
  803928:	48 b8 4e 3d 80 00 00 	movabs $0x803d4e,%rax
  80392f:	00 00 00 
  803932:	ff d0                	callq  *%rax
  803934:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803937:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80393b:	79 05                	jns    803942 <socket+0x38>
  80393d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803940:	eb 11                	jmp    803953 <socket+0x49>
  803942:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803945:	89 c7                	mov    %eax,%edi
  803947:	48 b8 ec 35 80 00 00 	movabs $0x8035ec,%rax
  80394e:	00 00 00 
  803951:	ff d0                	callq  *%rax
  803953:	c9                   	leaveq 
  803954:	c3                   	retq   

0000000000803955 <nsipc>:
  803955:	55                   	push   %rbp
  803956:	48 89 e5             	mov    %rsp,%rbp
  803959:	48 83 ec 10          	sub    $0x10,%rsp
  80395d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803960:	48 b8 04 74 80 00 00 	movabs $0x807404,%rax
  803967:	00 00 00 
  80396a:	8b 00                	mov    (%rax),%eax
  80396c:	85 c0                	test   %eax,%eax
  80396e:	75 1d                	jne    80398d <nsipc+0x38>
  803970:	bf 02 00 00 00       	mov    $0x2,%edi
  803975:	48 b8 c1 44 80 00 00 	movabs $0x8044c1,%rax
  80397c:	00 00 00 
  80397f:	ff d0                	callq  *%rax
  803981:	48 ba 04 74 80 00 00 	movabs $0x807404,%rdx
  803988:	00 00 00 
  80398b:	89 02                	mov    %eax,(%rdx)
  80398d:	48 b8 04 74 80 00 00 	movabs $0x807404,%rax
  803994:	00 00 00 
  803997:	8b 00                	mov    (%rax),%eax
  803999:	8b 75 fc             	mov    -0x4(%rbp),%esi
  80399c:	b9 07 00 00 00       	mov    $0x7,%ecx
  8039a1:	48 ba 00 a0 80 00 00 	movabs $0x80a000,%rdx
  8039a8:	00 00 00 
  8039ab:	89 c7                	mov    %eax,%edi
  8039ad:	48 b8 2b 44 80 00 00 	movabs $0x80442b,%rax
  8039b4:	00 00 00 
  8039b7:	ff d0                	callq  *%rax
  8039b9:	ba 00 00 00 00       	mov    $0x0,%edx
  8039be:	be 00 00 00 00       	mov    $0x0,%esi
  8039c3:	bf 00 00 00 00       	mov    $0x0,%edi
  8039c8:	48 b8 6a 43 80 00 00 	movabs $0x80436a,%rax
  8039cf:	00 00 00 
  8039d2:	ff d0                	callq  *%rax
  8039d4:	c9                   	leaveq 
  8039d5:	c3                   	retq   

00000000008039d6 <nsipc_accept>:
  8039d6:	55                   	push   %rbp
  8039d7:	48 89 e5             	mov    %rsp,%rbp
  8039da:	48 83 ec 30          	sub    $0x30,%rsp
  8039de:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8039e1:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8039e5:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8039e9:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8039f0:	00 00 00 
  8039f3:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8039f6:	89 10                	mov    %edx,(%rax)
  8039f8:	bf 01 00 00 00       	mov    $0x1,%edi
  8039fd:	48 b8 55 39 80 00 00 	movabs $0x803955,%rax
  803a04:	00 00 00 
  803a07:	ff d0                	callq  *%rax
  803a09:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803a0c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803a10:	78 3e                	js     803a50 <nsipc_accept+0x7a>
  803a12:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803a19:	00 00 00 
  803a1c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803a20:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a24:	8b 40 10             	mov    0x10(%rax),%eax
  803a27:	89 c2                	mov    %eax,%edx
  803a29:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  803a2d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803a31:	48 89 ce             	mov    %rcx,%rsi
  803a34:	48 89 c7             	mov    %rax,%rdi
  803a37:	48 b8 7d 17 80 00 00 	movabs $0x80177d,%rax
  803a3e:	00 00 00 
  803a41:	ff d0                	callq  *%rax
  803a43:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a47:	8b 50 10             	mov    0x10(%rax),%edx
  803a4a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803a4e:	89 10                	mov    %edx,(%rax)
  803a50:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a53:	c9                   	leaveq 
  803a54:	c3                   	retq   

0000000000803a55 <nsipc_bind>:
  803a55:	55                   	push   %rbp
  803a56:	48 89 e5             	mov    %rsp,%rbp
  803a59:	48 83 ec 10          	sub    $0x10,%rsp
  803a5d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803a60:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803a64:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803a67:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803a6e:	00 00 00 
  803a71:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803a74:	89 10                	mov    %edx,(%rax)
  803a76:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803a79:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a7d:	48 89 c6             	mov    %rax,%rsi
  803a80:	48 bf 04 a0 80 00 00 	movabs $0x80a004,%rdi
  803a87:	00 00 00 
  803a8a:	48 b8 7d 17 80 00 00 	movabs $0x80177d,%rax
  803a91:	00 00 00 
  803a94:	ff d0                	callq  *%rax
  803a96:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803a9d:	00 00 00 
  803aa0:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803aa3:	89 50 14             	mov    %edx,0x14(%rax)
  803aa6:	bf 02 00 00 00       	mov    $0x2,%edi
  803aab:	48 b8 55 39 80 00 00 	movabs $0x803955,%rax
  803ab2:	00 00 00 
  803ab5:	ff d0                	callq  *%rax
  803ab7:	c9                   	leaveq 
  803ab8:	c3                   	retq   

0000000000803ab9 <nsipc_shutdown>:
  803ab9:	55                   	push   %rbp
  803aba:	48 89 e5             	mov    %rsp,%rbp
  803abd:	48 83 ec 10          	sub    $0x10,%rsp
  803ac1:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803ac4:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803ac7:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803ace:	00 00 00 
  803ad1:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803ad4:	89 10                	mov    %edx,(%rax)
  803ad6:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803add:	00 00 00 
  803ae0:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803ae3:	89 50 04             	mov    %edx,0x4(%rax)
  803ae6:	bf 03 00 00 00       	mov    $0x3,%edi
  803aeb:	48 b8 55 39 80 00 00 	movabs $0x803955,%rax
  803af2:	00 00 00 
  803af5:	ff d0                	callq  *%rax
  803af7:	c9                   	leaveq 
  803af8:	c3                   	retq   

0000000000803af9 <nsipc_close>:
  803af9:	55                   	push   %rbp
  803afa:	48 89 e5             	mov    %rsp,%rbp
  803afd:	48 83 ec 10          	sub    $0x10,%rsp
  803b01:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803b04:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803b0b:	00 00 00 
  803b0e:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803b11:	89 10                	mov    %edx,(%rax)
  803b13:	bf 04 00 00 00       	mov    $0x4,%edi
  803b18:	48 b8 55 39 80 00 00 	movabs $0x803955,%rax
  803b1f:	00 00 00 
  803b22:	ff d0                	callq  *%rax
  803b24:	c9                   	leaveq 
  803b25:	c3                   	retq   

0000000000803b26 <nsipc_connect>:
  803b26:	55                   	push   %rbp
  803b27:	48 89 e5             	mov    %rsp,%rbp
  803b2a:	48 83 ec 10          	sub    $0x10,%rsp
  803b2e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803b31:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803b35:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803b38:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803b3f:	00 00 00 
  803b42:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803b45:	89 10                	mov    %edx,(%rax)
  803b47:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803b4a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b4e:	48 89 c6             	mov    %rax,%rsi
  803b51:	48 bf 04 a0 80 00 00 	movabs $0x80a004,%rdi
  803b58:	00 00 00 
  803b5b:	48 b8 7d 17 80 00 00 	movabs $0x80177d,%rax
  803b62:	00 00 00 
  803b65:	ff d0                	callq  *%rax
  803b67:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803b6e:	00 00 00 
  803b71:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803b74:	89 50 14             	mov    %edx,0x14(%rax)
  803b77:	bf 05 00 00 00       	mov    $0x5,%edi
  803b7c:	48 b8 55 39 80 00 00 	movabs $0x803955,%rax
  803b83:	00 00 00 
  803b86:	ff d0                	callq  *%rax
  803b88:	c9                   	leaveq 
  803b89:	c3                   	retq   

0000000000803b8a <nsipc_listen>:
  803b8a:	55                   	push   %rbp
  803b8b:	48 89 e5             	mov    %rsp,%rbp
  803b8e:	48 83 ec 10          	sub    $0x10,%rsp
  803b92:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803b95:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803b98:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803b9f:	00 00 00 
  803ba2:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803ba5:	89 10                	mov    %edx,(%rax)
  803ba7:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803bae:	00 00 00 
  803bb1:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803bb4:	89 50 04             	mov    %edx,0x4(%rax)
  803bb7:	bf 06 00 00 00       	mov    $0x6,%edi
  803bbc:	48 b8 55 39 80 00 00 	movabs $0x803955,%rax
  803bc3:	00 00 00 
  803bc6:	ff d0                	callq  *%rax
  803bc8:	c9                   	leaveq 
  803bc9:	c3                   	retq   

0000000000803bca <nsipc_recv>:
  803bca:	55                   	push   %rbp
  803bcb:	48 89 e5             	mov    %rsp,%rbp
  803bce:	48 83 ec 30          	sub    $0x30,%rsp
  803bd2:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803bd5:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803bd9:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803bdc:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  803bdf:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803be6:	00 00 00 
  803be9:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803bec:	89 10                	mov    %edx,(%rax)
  803bee:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803bf5:	00 00 00 
  803bf8:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803bfb:	89 50 04             	mov    %edx,0x4(%rax)
  803bfe:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803c05:	00 00 00 
  803c08:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803c0b:	89 50 08             	mov    %edx,0x8(%rax)
  803c0e:	bf 07 00 00 00       	mov    $0x7,%edi
  803c13:	48 b8 55 39 80 00 00 	movabs $0x803955,%rax
  803c1a:	00 00 00 
  803c1d:	ff d0                	callq  *%rax
  803c1f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803c22:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803c26:	78 69                	js     803c91 <nsipc_recv+0xc7>
  803c28:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  803c2f:	7f 08                	jg     803c39 <nsipc_recv+0x6f>
  803c31:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c34:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  803c37:	7e 35                	jle    803c6e <nsipc_recv+0xa4>
  803c39:	48 b9 a9 4c 80 00 00 	movabs $0x804ca9,%rcx
  803c40:	00 00 00 
  803c43:	48 ba be 4c 80 00 00 	movabs $0x804cbe,%rdx
  803c4a:	00 00 00 
  803c4d:	be 62 00 00 00       	mov    $0x62,%esi
  803c52:	48 bf d3 4c 80 00 00 	movabs $0x804cd3,%rdi
  803c59:	00 00 00 
  803c5c:	b8 00 00 00 00       	mov    $0x0,%eax
  803c61:	49 b8 11 05 80 00 00 	movabs $0x800511,%r8
  803c68:	00 00 00 
  803c6b:	41 ff d0             	callq  *%r8
  803c6e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c71:	48 63 d0             	movslq %eax,%rdx
  803c74:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803c78:	48 be 00 a0 80 00 00 	movabs $0x80a000,%rsi
  803c7f:	00 00 00 
  803c82:	48 89 c7             	mov    %rax,%rdi
  803c85:	48 b8 7d 17 80 00 00 	movabs $0x80177d,%rax
  803c8c:	00 00 00 
  803c8f:	ff d0                	callq  *%rax
  803c91:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c94:	c9                   	leaveq 
  803c95:	c3                   	retq   

0000000000803c96 <nsipc_send>:
  803c96:	55                   	push   %rbp
  803c97:	48 89 e5             	mov    %rsp,%rbp
  803c9a:	48 83 ec 20          	sub    $0x20,%rsp
  803c9e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803ca1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803ca5:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803ca8:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  803cab:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803cb2:	00 00 00 
  803cb5:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803cb8:	89 10                	mov    %edx,(%rax)
  803cba:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  803cc1:	7e 35                	jle    803cf8 <nsipc_send+0x62>
  803cc3:	48 b9 e2 4c 80 00 00 	movabs $0x804ce2,%rcx
  803cca:	00 00 00 
  803ccd:	48 ba be 4c 80 00 00 	movabs $0x804cbe,%rdx
  803cd4:	00 00 00 
  803cd7:	be 6d 00 00 00       	mov    $0x6d,%esi
  803cdc:	48 bf d3 4c 80 00 00 	movabs $0x804cd3,%rdi
  803ce3:	00 00 00 
  803ce6:	b8 00 00 00 00       	mov    $0x0,%eax
  803ceb:	49 b8 11 05 80 00 00 	movabs $0x800511,%r8
  803cf2:	00 00 00 
  803cf5:	41 ff d0             	callq  *%r8
  803cf8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803cfb:	48 63 d0             	movslq %eax,%rdx
  803cfe:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803d02:	48 89 c6             	mov    %rax,%rsi
  803d05:	48 bf 0c a0 80 00 00 	movabs $0x80a00c,%rdi
  803d0c:	00 00 00 
  803d0f:	48 b8 7d 17 80 00 00 	movabs $0x80177d,%rax
  803d16:	00 00 00 
  803d19:	ff d0                	callq  *%rax
  803d1b:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803d22:	00 00 00 
  803d25:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803d28:	89 50 04             	mov    %edx,0x4(%rax)
  803d2b:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803d32:	00 00 00 
  803d35:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803d38:	89 50 08             	mov    %edx,0x8(%rax)
  803d3b:	bf 08 00 00 00       	mov    $0x8,%edi
  803d40:	48 b8 55 39 80 00 00 	movabs $0x803955,%rax
  803d47:	00 00 00 
  803d4a:	ff d0                	callq  *%rax
  803d4c:	c9                   	leaveq 
  803d4d:	c3                   	retq   

0000000000803d4e <nsipc_socket>:
  803d4e:	55                   	push   %rbp
  803d4f:	48 89 e5             	mov    %rsp,%rbp
  803d52:	48 83 ec 10          	sub    $0x10,%rsp
  803d56:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803d59:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803d5c:	89 55 f4             	mov    %edx,-0xc(%rbp)
  803d5f:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803d66:	00 00 00 
  803d69:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803d6c:	89 10                	mov    %edx,(%rax)
  803d6e:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803d75:	00 00 00 
  803d78:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803d7b:	89 50 04             	mov    %edx,0x4(%rax)
  803d7e:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803d85:	00 00 00 
  803d88:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803d8b:	89 50 08             	mov    %edx,0x8(%rax)
  803d8e:	bf 09 00 00 00       	mov    $0x9,%edi
  803d93:	48 b8 55 39 80 00 00 	movabs $0x803955,%rax
  803d9a:	00 00 00 
  803d9d:	ff d0                	callq  *%rax
  803d9f:	c9                   	leaveq 
  803da0:	c3                   	retq   

0000000000803da1 <pipe>:
  803da1:	55                   	push   %rbp
  803da2:	48 89 e5             	mov    %rsp,%rbp
  803da5:	53                   	push   %rbx
  803da6:	48 83 ec 38          	sub    $0x38,%rsp
  803daa:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  803dae:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  803db2:	48 89 c7             	mov    %rax,%rdi
  803db5:	48 b8 b4 22 80 00 00 	movabs $0x8022b4,%rax
  803dbc:	00 00 00 
  803dbf:	ff d0                	callq  *%rax
  803dc1:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803dc4:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803dc8:	0f 88 bf 01 00 00    	js     803f8d <pipe+0x1ec>
  803dce:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803dd2:	ba 07 04 00 00       	mov    $0x407,%edx
  803dd7:	48 89 c6             	mov    %rax,%rsi
  803dda:	bf 00 00 00 00       	mov    $0x0,%edi
  803ddf:	48 b8 88 1d 80 00 00 	movabs $0x801d88,%rax
  803de6:	00 00 00 
  803de9:	ff d0                	callq  *%rax
  803deb:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803dee:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803df2:	0f 88 95 01 00 00    	js     803f8d <pipe+0x1ec>
  803df8:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  803dfc:	48 89 c7             	mov    %rax,%rdi
  803dff:	48 b8 b4 22 80 00 00 	movabs $0x8022b4,%rax
  803e06:	00 00 00 
  803e09:	ff d0                	callq  *%rax
  803e0b:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803e0e:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803e12:	0f 88 5d 01 00 00    	js     803f75 <pipe+0x1d4>
  803e18:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803e1c:	ba 07 04 00 00       	mov    $0x407,%edx
  803e21:	48 89 c6             	mov    %rax,%rsi
  803e24:	bf 00 00 00 00       	mov    $0x0,%edi
  803e29:	48 b8 88 1d 80 00 00 	movabs $0x801d88,%rax
  803e30:	00 00 00 
  803e33:	ff d0                	callq  *%rax
  803e35:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803e38:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803e3c:	0f 88 33 01 00 00    	js     803f75 <pipe+0x1d4>
  803e42:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803e46:	48 89 c7             	mov    %rax,%rdi
  803e49:	48 b8 89 22 80 00 00 	movabs $0x802289,%rax
  803e50:	00 00 00 
  803e53:	ff d0                	callq  *%rax
  803e55:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803e59:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803e5d:	ba 07 04 00 00       	mov    $0x407,%edx
  803e62:	48 89 c6             	mov    %rax,%rsi
  803e65:	bf 00 00 00 00       	mov    $0x0,%edi
  803e6a:	48 b8 88 1d 80 00 00 	movabs $0x801d88,%rax
  803e71:	00 00 00 
  803e74:	ff d0                	callq  *%rax
  803e76:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803e79:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803e7d:	79 05                	jns    803e84 <pipe+0xe3>
  803e7f:	e9 d9 00 00 00       	jmpq   803f5d <pipe+0x1bc>
  803e84:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803e88:	48 89 c7             	mov    %rax,%rdi
  803e8b:	48 b8 89 22 80 00 00 	movabs $0x802289,%rax
  803e92:	00 00 00 
  803e95:	ff d0                	callq  *%rax
  803e97:	48 89 c2             	mov    %rax,%rdx
  803e9a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803e9e:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  803ea4:	48 89 d1             	mov    %rdx,%rcx
  803ea7:	ba 00 00 00 00       	mov    $0x0,%edx
  803eac:	48 89 c6             	mov    %rax,%rsi
  803eaf:	bf 00 00 00 00       	mov    $0x0,%edi
  803eb4:	48 b8 d8 1d 80 00 00 	movabs $0x801dd8,%rax
  803ebb:	00 00 00 
  803ebe:	ff d0                	callq  *%rax
  803ec0:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803ec3:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803ec7:	79 1b                	jns    803ee4 <pipe+0x143>
  803ec9:	90                   	nop
  803eca:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803ece:	48 89 c6             	mov    %rax,%rsi
  803ed1:	bf 00 00 00 00       	mov    $0x0,%edi
  803ed6:	48 b8 33 1e 80 00 00 	movabs $0x801e33,%rax
  803edd:	00 00 00 
  803ee0:	ff d0                	callq  *%rax
  803ee2:	eb 79                	jmp    803f5d <pipe+0x1bc>
  803ee4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803ee8:	48 ba 00 61 80 00 00 	movabs $0x806100,%rdx
  803eef:	00 00 00 
  803ef2:	8b 12                	mov    (%rdx),%edx
  803ef4:	89 10                	mov    %edx,(%rax)
  803ef6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803efa:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  803f01:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803f05:	48 ba 00 61 80 00 00 	movabs $0x806100,%rdx
  803f0c:	00 00 00 
  803f0f:	8b 12                	mov    (%rdx),%edx
  803f11:	89 10                	mov    %edx,(%rax)
  803f13:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803f17:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  803f1e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803f22:	48 89 c7             	mov    %rax,%rdi
  803f25:	48 b8 66 22 80 00 00 	movabs $0x802266,%rax
  803f2c:	00 00 00 
  803f2f:	ff d0                	callq  *%rax
  803f31:	89 c2                	mov    %eax,%edx
  803f33:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803f37:	89 10                	mov    %edx,(%rax)
  803f39:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803f3d:	48 8d 58 04          	lea    0x4(%rax),%rbx
  803f41:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803f45:	48 89 c7             	mov    %rax,%rdi
  803f48:	48 b8 66 22 80 00 00 	movabs $0x802266,%rax
  803f4f:	00 00 00 
  803f52:	ff d0                	callq  *%rax
  803f54:	89 03                	mov    %eax,(%rbx)
  803f56:	b8 00 00 00 00       	mov    $0x0,%eax
  803f5b:	eb 33                	jmp    803f90 <pipe+0x1ef>
  803f5d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803f61:	48 89 c6             	mov    %rax,%rsi
  803f64:	bf 00 00 00 00       	mov    $0x0,%edi
  803f69:	48 b8 33 1e 80 00 00 	movabs $0x801e33,%rax
  803f70:	00 00 00 
  803f73:	ff d0                	callq  *%rax
  803f75:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803f79:	48 89 c6             	mov    %rax,%rsi
  803f7c:	bf 00 00 00 00       	mov    $0x0,%edi
  803f81:	48 b8 33 1e 80 00 00 	movabs $0x801e33,%rax
  803f88:	00 00 00 
  803f8b:	ff d0                	callq  *%rax
  803f8d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803f90:	48 83 c4 38          	add    $0x38,%rsp
  803f94:	5b                   	pop    %rbx
  803f95:	5d                   	pop    %rbp
  803f96:	c3                   	retq   

0000000000803f97 <_pipeisclosed>:
  803f97:	55                   	push   %rbp
  803f98:	48 89 e5             	mov    %rsp,%rbp
  803f9b:	53                   	push   %rbx
  803f9c:	48 83 ec 28          	sub    $0x28,%rsp
  803fa0:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803fa4:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803fa8:	48 b8 08 74 80 00 00 	movabs $0x807408,%rax
  803faf:	00 00 00 
  803fb2:	48 8b 00             	mov    (%rax),%rax
  803fb5:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  803fbb:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803fbe:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803fc2:	48 89 c7             	mov    %rax,%rdi
  803fc5:	48 b8 33 45 80 00 00 	movabs $0x804533,%rax
  803fcc:	00 00 00 
  803fcf:	ff d0                	callq  *%rax
  803fd1:	89 c3                	mov    %eax,%ebx
  803fd3:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803fd7:	48 89 c7             	mov    %rax,%rdi
  803fda:	48 b8 33 45 80 00 00 	movabs $0x804533,%rax
  803fe1:	00 00 00 
  803fe4:	ff d0                	callq  *%rax
  803fe6:	39 c3                	cmp    %eax,%ebx
  803fe8:	0f 94 c0             	sete   %al
  803feb:	0f b6 c0             	movzbl %al,%eax
  803fee:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803ff1:	48 b8 08 74 80 00 00 	movabs $0x807408,%rax
  803ff8:	00 00 00 
  803ffb:	48 8b 00             	mov    (%rax),%rax
  803ffe:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  804004:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  804007:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80400a:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  80400d:	75 05                	jne    804014 <_pipeisclosed+0x7d>
  80400f:	8b 45 e8             	mov    -0x18(%rbp),%eax
  804012:	eb 4f                	jmp    804063 <_pipeisclosed+0xcc>
  804014:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804017:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  80401a:	74 42                	je     80405e <_pipeisclosed+0xc7>
  80401c:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  804020:	75 3c                	jne    80405e <_pipeisclosed+0xc7>
  804022:	48 b8 08 74 80 00 00 	movabs $0x807408,%rax
  804029:	00 00 00 
  80402c:	48 8b 00             	mov    (%rax),%rax
  80402f:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  804035:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  804038:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80403b:	89 c6                	mov    %eax,%esi
  80403d:	48 bf f3 4c 80 00 00 	movabs $0x804cf3,%rdi
  804044:	00 00 00 
  804047:	b8 00 00 00 00       	mov    $0x0,%eax
  80404c:	49 b8 4a 07 80 00 00 	movabs $0x80074a,%r8
  804053:	00 00 00 
  804056:	41 ff d0             	callq  *%r8
  804059:	e9 4a ff ff ff       	jmpq   803fa8 <_pipeisclosed+0x11>
  80405e:	e9 45 ff ff ff       	jmpq   803fa8 <_pipeisclosed+0x11>
  804063:	48 83 c4 28          	add    $0x28,%rsp
  804067:	5b                   	pop    %rbx
  804068:	5d                   	pop    %rbp
  804069:	c3                   	retq   

000000000080406a <pipeisclosed>:
  80406a:	55                   	push   %rbp
  80406b:	48 89 e5             	mov    %rsp,%rbp
  80406e:	48 83 ec 30          	sub    $0x30,%rsp
  804072:	89 7d dc             	mov    %edi,-0x24(%rbp)
  804075:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  804079:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80407c:	48 89 d6             	mov    %rdx,%rsi
  80407f:	89 c7                	mov    %eax,%edi
  804081:	48 b8 4c 23 80 00 00 	movabs $0x80234c,%rax
  804088:	00 00 00 
  80408b:	ff d0                	callq  *%rax
  80408d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804090:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804094:	79 05                	jns    80409b <pipeisclosed+0x31>
  804096:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804099:	eb 31                	jmp    8040cc <pipeisclosed+0x62>
  80409b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80409f:	48 89 c7             	mov    %rax,%rdi
  8040a2:	48 b8 89 22 80 00 00 	movabs $0x802289,%rax
  8040a9:	00 00 00 
  8040ac:	ff d0                	callq  *%rax
  8040ae:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8040b2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8040b6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8040ba:	48 89 d6             	mov    %rdx,%rsi
  8040bd:	48 89 c7             	mov    %rax,%rdi
  8040c0:	48 b8 97 3f 80 00 00 	movabs $0x803f97,%rax
  8040c7:	00 00 00 
  8040ca:	ff d0                	callq  *%rax
  8040cc:	c9                   	leaveq 
  8040cd:	c3                   	retq   

00000000008040ce <devpipe_read>:
  8040ce:	55                   	push   %rbp
  8040cf:	48 89 e5             	mov    %rsp,%rbp
  8040d2:	48 83 ec 40          	sub    $0x40,%rsp
  8040d6:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8040da:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8040de:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8040e2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8040e6:	48 89 c7             	mov    %rax,%rdi
  8040e9:	48 b8 89 22 80 00 00 	movabs $0x802289,%rax
  8040f0:	00 00 00 
  8040f3:	ff d0                	callq  *%rax
  8040f5:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8040f9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8040fd:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804101:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804108:	00 
  804109:	e9 92 00 00 00       	jmpq   8041a0 <devpipe_read+0xd2>
  80410e:	eb 41                	jmp    804151 <devpipe_read+0x83>
  804110:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  804115:	74 09                	je     804120 <devpipe_read+0x52>
  804117:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80411b:	e9 92 00 00 00       	jmpq   8041b2 <devpipe_read+0xe4>
  804120:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804124:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804128:	48 89 d6             	mov    %rdx,%rsi
  80412b:	48 89 c7             	mov    %rax,%rdi
  80412e:	48 b8 97 3f 80 00 00 	movabs $0x803f97,%rax
  804135:	00 00 00 
  804138:	ff d0                	callq  *%rax
  80413a:	85 c0                	test   %eax,%eax
  80413c:	74 07                	je     804145 <devpipe_read+0x77>
  80413e:	b8 00 00 00 00       	mov    $0x0,%eax
  804143:	eb 6d                	jmp    8041b2 <devpipe_read+0xe4>
  804145:	48 b8 4a 1d 80 00 00 	movabs $0x801d4a,%rax
  80414c:	00 00 00 
  80414f:	ff d0                	callq  *%rax
  804151:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804155:	8b 10                	mov    (%rax),%edx
  804157:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80415b:	8b 40 04             	mov    0x4(%rax),%eax
  80415e:	39 c2                	cmp    %eax,%edx
  804160:	74 ae                	je     804110 <devpipe_read+0x42>
  804162:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804166:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80416a:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  80416e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804172:	8b 00                	mov    (%rax),%eax
  804174:	99                   	cltd   
  804175:	c1 ea 1b             	shr    $0x1b,%edx
  804178:	01 d0                	add    %edx,%eax
  80417a:	83 e0 1f             	and    $0x1f,%eax
  80417d:	29 d0                	sub    %edx,%eax
  80417f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804183:	48 98                	cltq   
  804185:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  80418a:	88 01                	mov    %al,(%rcx)
  80418c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804190:	8b 00                	mov    (%rax),%eax
  804192:	8d 50 01             	lea    0x1(%rax),%edx
  804195:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804199:	89 10                	mov    %edx,(%rax)
  80419b:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8041a0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8041a4:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8041a8:	0f 82 60 ff ff ff    	jb     80410e <devpipe_read+0x40>
  8041ae:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8041b2:	c9                   	leaveq 
  8041b3:	c3                   	retq   

00000000008041b4 <devpipe_write>:
  8041b4:	55                   	push   %rbp
  8041b5:	48 89 e5             	mov    %rsp,%rbp
  8041b8:	48 83 ec 40          	sub    $0x40,%rsp
  8041bc:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8041c0:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8041c4:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8041c8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8041cc:	48 89 c7             	mov    %rax,%rdi
  8041cf:	48 b8 89 22 80 00 00 	movabs $0x802289,%rax
  8041d6:	00 00 00 
  8041d9:	ff d0                	callq  *%rax
  8041db:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8041df:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8041e3:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8041e7:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8041ee:	00 
  8041ef:	e9 8e 00 00 00       	jmpq   804282 <devpipe_write+0xce>
  8041f4:	eb 31                	jmp    804227 <devpipe_write+0x73>
  8041f6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8041fa:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8041fe:	48 89 d6             	mov    %rdx,%rsi
  804201:	48 89 c7             	mov    %rax,%rdi
  804204:	48 b8 97 3f 80 00 00 	movabs $0x803f97,%rax
  80420b:	00 00 00 
  80420e:	ff d0                	callq  *%rax
  804210:	85 c0                	test   %eax,%eax
  804212:	74 07                	je     80421b <devpipe_write+0x67>
  804214:	b8 00 00 00 00       	mov    $0x0,%eax
  804219:	eb 79                	jmp    804294 <devpipe_write+0xe0>
  80421b:	48 b8 4a 1d 80 00 00 	movabs $0x801d4a,%rax
  804222:	00 00 00 
  804225:	ff d0                	callq  *%rax
  804227:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80422b:	8b 40 04             	mov    0x4(%rax),%eax
  80422e:	48 63 d0             	movslq %eax,%rdx
  804231:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804235:	8b 00                	mov    (%rax),%eax
  804237:	48 98                	cltq   
  804239:	48 83 c0 20          	add    $0x20,%rax
  80423d:	48 39 c2             	cmp    %rax,%rdx
  804240:	73 b4                	jae    8041f6 <devpipe_write+0x42>
  804242:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804246:	8b 40 04             	mov    0x4(%rax),%eax
  804249:	99                   	cltd   
  80424a:	c1 ea 1b             	shr    $0x1b,%edx
  80424d:	01 d0                	add    %edx,%eax
  80424f:	83 e0 1f             	and    $0x1f,%eax
  804252:	29 d0                	sub    %edx,%eax
  804254:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  804258:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80425c:	48 01 ca             	add    %rcx,%rdx
  80425f:	0f b6 0a             	movzbl (%rdx),%ecx
  804262:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804266:	48 98                	cltq   
  804268:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  80426c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804270:	8b 40 04             	mov    0x4(%rax),%eax
  804273:	8d 50 01             	lea    0x1(%rax),%edx
  804276:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80427a:	89 50 04             	mov    %edx,0x4(%rax)
  80427d:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  804282:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804286:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  80428a:	0f 82 64 ff ff ff    	jb     8041f4 <devpipe_write+0x40>
  804290:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804294:	c9                   	leaveq 
  804295:	c3                   	retq   

0000000000804296 <devpipe_stat>:
  804296:	55                   	push   %rbp
  804297:	48 89 e5             	mov    %rsp,%rbp
  80429a:	48 83 ec 20          	sub    $0x20,%rsp
  80429e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8042a2:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8042a6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8042aa:	48 89 c7             	mov    %rax,%rdi
  8042ad:	48 b8 89 22 80 00 00 	movabs $0x802289,%rax
  8042b4:	00 00 00 
  8042b7:	ff d0                	callq  *%rax
  8042b9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8042bd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8042c1:	48 be 06 4d 80 00 00 	movabs $0x804d06,%rsi
  8042c8:	00 00 00 
  8042cb:	48 89 c7             	mov    %rax,%rdi
  8042ce:	48 b8 59 14 80 00 00 	movabs $0x801459,%rax
  8042d5:	00 00 00 
  8042d8:	ff d0                	callq  *%rax
  8042da:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8042de:	8b 50 04             	mov    0x4(%rax),%edx
  8042e1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8042e5:	8b 00                	mov    (%rax),%eax
  8042e7:	29 c2                	sub    %eax,%edx
  8042e9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8042ed:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  8042f3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8042f7:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  8042fe:	00 00 00 
  804301:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804305:	48 b9 00 61 80 00 00 	movabs $0x806100,%rcx
  80430c:	00 00 00 
  80430f:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  804316:	b8 00 00 00 00       	mov    $0x0,%eax
  80431b:	c9                   	leaveq 
  80431c:	c3                   	retq   

000000000080431d <devpipe_close>:
  80431d:	55                   	push   %rbp
  80431e:	48 89 e5             	mov    %rsp,%rbp
  804321:	48 83 ec 10          	sub    $0x10,%rsp
  804325:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804329:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80432d:	48 89 c6             	mov    %rax,%rsi
  804330:	bf 00 00 00 00       	mov    $0x0,%edi
  804335:	48 b8 33 1e 80 00 00 	movabs $0x801e33,%rax
  80433c:	00 00 00 
  80433f:	ff d0                	callq  *%rax
  804341:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804345:	48 89 c7             	mov    %rax,%rdi
  804348:	48 b8 89 22 80 00 00 	movabs $0x802289,%rax
  80434f:	00 00 00 
  804352:	ff d0                	callq  *%rax
  804354:	48 89 c6             	mov    %rax,%rsi
  804357:	bf 00 00 00 00       	mov    $0x0,%edi
  80435c:	48 b8 33 1e 80 00 00 	movabs $0x801e33,%rax
  804363:	00 00 00 
  804366:	ff d0                	callq  *%rax
  804368:	c9                   	leaveq 
  804369:	c3                   	retq   

000000000080436a <ipc_recv>:
  80436a:	55                   	push   %rbp
  80436b:	48 89 e5             	mov    %rsp,%rbp
  80436e:	48 83 ec 30          	sub    $0x30,%rsp
  804372:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804376:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80437a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80437e:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  804383:	75 0e                	jne    804393 <ipc_recv+0x29>
  804385:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80438c:	00 00 00 
  80438f:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804393:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804397:	48 89 c7             	mov    %rax,%rdi
  80439a:	48 b8 b1 1f 80 00 00 	movabs $0x801fb1,%rax
  8043a1:	00 00 00 
  8043a4:	ff d0                	callq  *%rax
  8043a6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8043a9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8043ad:	79 27                	jns    8043d6 <ipc_recv+0x6c>
  8043af:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8043b4:	74 0a                	je     8043c0 <ipc_recv+0x56>
  8043b6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8043ba:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8043c0:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8043c5:	74 0a                	je     8043d1 <ipc_recv+0x67>
  8043c7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8043cb:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8043d1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8043d4:	eb 53                	jmp    804429 <ipc_recv+0xbf>
  8043d6:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8043db:	74 19                	je     8043f6 <ipc_recv+0x8c>
  8043dd:	48 b8 08 74 80 00 00 	movabs $0x807408,%rax
  8043e4:	00 00 00 
  8043e7:	48 8b 00             	mov    (%rax),%rax
  8043ea:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  8043f0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8043f4:	89 10                	mov    %edx,(%rax)
  8043f6:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8043fb:	74 19                	je     804416 <ipc_recv+0xac>
  8043fd:	48 b8 08 74 80 00 00 	movabs $0x807408,%rax
  804404:	00 00 00 
  804407:	48 8b 00             	mov    (%rax),%rax
  80440a:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  804410:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804414:	89 10                	mov    %edx,(%rax)
  804416:	48 b8 08 74 80 00 00 	movabs $0x807408,%rax
  80441d:	00 00 00 
  804420:	48 8b 00             	mov    (%rax),%rax
  804423:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  804429:	c9                   	leaveq 
  80442a:	c3                   	retq   

000000000080442b <ipc_send>:
  80442b:	55                   	push   %rbp
  80442c:	48 89 e5             	mov    %rsp,%rbp
  80442f:	48 83 ec 30          	sub    $0x30,%rsp
  804433:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804436:	89 75 e8             	mov    %esi,-0x18(%rbp)
  804439:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  80443d:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  804440:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  804445:	75 10                	jne    804457 <ipc_send+0x2c>
  804447:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80444e:	00 00 00 
  804451:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804455:	eb 0e                	jmp    804465 <ipc_send+0x3a>
  804457:	eb 0c                	jmp    804465 <ipc_send+0x3a>
  804459:	48 b8 4a 1d 80 00 00 	movabs $0x801d4a,%rax
  804460:	00 00 00 
  804463:	ff d0                	callq  *%rax
  804465:	8b 75 e8             	mov    -0x18(%rbp),%esi
  804468:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  80446b:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80446f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804472:	89 c7                	mov    %eax,%edi
  804474:	48 b8 5c 1f 80 00 00 	movabs $0x801f5c,%rax
  80447b:	00 00 00 
  80447e:	ff d0                	callq  *%rax
  804480:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804483:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  804487:	74 d0                	je     804459 <ipc_send+0x2e>
  804489:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80448d:	79 30                	jns    8044bf <ipc_send+0x94>
  80448f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804492:	89 c1                	mov    %eax,%ecx
  804494:	48 ba 0d 4d 80 00 00 	movabs $0x804d0d,%rdx
  80449b:	00 00 00 
  80449e:	be 44 00 00 00       	mov    $0x44,%esi
  8044a3:	48 bf 23 4d 80 00 00 	movabs $0x804d23,%rdi
  8044aa:	00 00 00 
  8044ad:	b8 00 00 00 00       	mov    $0x0,%eax
  8044b2:	49 b8 11 05 80 00 00 	movabs $0x800511,%r8
  8044b9:	00 00 00 
  8044bc:	41 ff d0             	callq  *%r8
  8044bf:	c9                   	leaveq 
  8044c0:	c3                   	retq   

00000000008044c1 <ipc_find_env>:
  8044c1:	55                   	push   %rbp
  8044c2:	48 89 e5             	mov    %rsp,%rbp
  8044c5:	48 83 ec 14          	sub    $0x14,%rsp
  8044c9:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8044cc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8044d3:	eb 4e                	jmp    804523 <ipc_find_env+0x62>
  8044d5:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  8044dc:	00 00 00 
  8044df:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8044e2:	48 98                	cltq   
  8044e4:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  8044eb:	48 01 d0             	add    %rdx,%rax
  8044ee:	48 05 d0 00 00 00    	add    $0xd0,%rax
  8044f4:	8b 00                	mov    (%rax),%eax
  8044f6:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  8044f9:	75 24                	jne    80451f <ipc_find_env+0x5e>
  8044fb:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804502:	00 00 00 
  804505:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804508:	48 98                	cltq   
  80450a:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804511:	48 01 d0             	add    %rdx,%rax
  804514:	48 05 c0 00 00 00    	add    $0xc0,%rax
  80451a:	8b 40 08             	mov    0x8(%rax),%eax
  80451d:	eb 12                	jmp    804531 <ipc_find_env+0x70>
  80451f:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  804523:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  80452a:	7e a9                	jle    8044d5 <ipc_find_env+0x14>
  80452c:	b8 00 00 00 00       	mov    $0x0,%eax
  804531:	c9                   	leaveq 
  804532:	c3                   	retq   

0000000000804533 <pageref>:
  804533:	55                   	push   %rbp
  804534:	48 89 e5             	mov    %rsp,%rbp
  804537:	48 83 ec 18          	sub    $0x18,%rsp
  80453b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80453f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804543:	48 c1 e8 15          	shr    $0x15,%rax
  804547:	48 89 c2             	mov    %rax,%rdx
  80454a:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  804551:	01 00 00 
  804554:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804558:	83 e0 01             	and    $0x1,%eax
  80455b:	48 85 c0             	test   %rax,%rax
  80455e:	75 07                	jne    804567 <pageref+0x34>
  804560:	b8 00 00 00 00       	mov    $0x0,%eax
  804565:	eb 53                	jmp    8045ba <pageref+0x87>
  804567:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80456b:	48 c1 e8 0c          	shr    $0xc,%rax
  80456f:	48 89 c2             	mov    %rax,%rdx
  804572:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  804579:	01 00 00 
  80457c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804580:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804584:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804588:	83 e0 01             	and    $0x1,%eax
  80458b:	48 85 c0             	test   %rax,%rax
  80458e:	75 07                	jne    804597 <pageref+0x64>
  804590:	b8 00 00 00 00       	mov    $0x0,%eax
  804595:	eb 23                	jmp    8045ba <pageref+0x87>
  804597:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80459b:	48 c1 e8 0c          	shr    $0xc,%rax
  80459f:	48 89 c2             	mov    %rax,%rdx
  8045a2:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  8045a9:	00 00 00 
  8045ac:	48 c1 e2 04          	shl    $0x4,%rdx
  8045b0:	48 01 d0             	add    %rdx,%rax
  8045b3:	0f b7 40 08          	movzwl 0x8(%rax),%eax
  8045b7:	0f b7 c0             	movzwl %ax,%eax
  8045ba:	c9                   	leaveq 
  8045bb:	c3                   	retq   
