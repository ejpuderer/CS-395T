
obj/user/testpipe:     file format elf64-x86-64


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
  80003c:	e8 fe 04 00 00       	callq  80053f <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <umain>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	53                   	push   %rbx
  800048:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
  80004f:	89 bd 6c ff ff ff    	mov    %edi,-0x94(%rbp)
  800055:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  80005c:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  800063:	00 00 00 
  800066:	48 bb 04 4d 80 00 00 	movabs $0x804d04,%rbx
  80006d:	00 00 00 
  800070:	48 89 18             	mov    %rbx,(%rax)
  800073:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  80007a:	48 89 c7             	mov    %rax,%rdi
  80007d:	48 b8 2c 40 80 00 00 	movabs $0x80402c,%rax
  800084:	00 00 00 
  800087:	ff d0                	callq  *%rax
  800089:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80008c:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  800090:	79 30                	jns    8000c2 <umain+0x7f>
  800092:	8b 45 ec             	mov    -0x14(%rbp),%eax
  800095:	89 c1                	mov    %eax,%ecx
  800097:	48 ba 10 4d 80 00 00 	movabs $0x804d10,%rdx
  80009e:	00 00 00 
  8000a1:	be 0f 00 00 00       	mov    $0xf,%esi
  8000a6:	48 bf 19 4d 80 00 00 	movabs $0x804d19,%rdi
  8000ad:	00 00 00 
  8000b0:	b8 00 00 00 00       	mov    $0x0,%eax
  8000b5:	49 b8 e5 05 80 00 00 	movabs $0x8005e5,%r8
  8000bc:	00 00 00 
  8000bf:	41 ff d0             	callq  *%r8
  8000c2:	48 b8 80 25 80 00 00 	movabs $0x802580,%rax
  8000c9:	00 00 00 
  8000cc:	ff d0                	callq  *%rax
  8000ce:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8000d1:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  8000d5:	79 30                	jns    800107 <umain+0xc4>
  8000d7:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8000da:	89 c1                	mov    %eax,%ecx
  8000dc:	48 ba 2c 4d 80 00 00 	movabs $0x804d2c,%rdx
  8000e3:	00 00 00 
  8000e6:	be 12 00 00 00       	mov    $0x12,%esi
  8000eb:	48 bf 19 4d 80 00 00 	movabs $0x804d19,%rdi
  8000f2:	00 00 00 
  8000f5:	b8 00 00 00 00       	mov    $0x0,%eax
  8000fa:	49 b8 e5 05 80 00 00 	movabs $0x8005e5,%r8
  800101:	00 00 00 
  800104:	41 ff d0             	callq  *%r8
  800107:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  80010b:	0f 85 5c 01 00 00    	jne    80026d <umain+0x22a>
  800111:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
  800117:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80011e:	00 00 00 
  800121:	48 8b 00             	mov    (%rax),%rax
  800124:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80012a:	89 c6                	mov    %eax,%esi
  80012c:	48 bf 35 4d 80 00 00 	movabs $0x804d35,%rdi
  800133:	00 00 00 
  800136:	b8 00 00 00 00       	mov    $0x0,%eax
  80013b:	48 b9 1e 08 80 00 00 	movabs $0x80081e,%rcx
  800142:	00 00 00 
  800145:	ff d1                	callq  *%rcx
  800147:	8b 85 74 ff ff ff    	mov    -0x8c(%rbp),%eax
  80014d:	89 c7                	mov    %eax,%edi
  80014f:	48 b8 eb 2a 80 00 00 	movabs $0x802aeb,%rax
  800156:	00 00 00 
  800159:	ff d0                	callq  *%rax
  80015b:	8b 95 70 ff ff ff    	mov    -0x90(%rbp),%edx
  800161:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  800168:	00 00 00 
  80016b:	48 8b 00             	mov    (%rax),%rax
  80016e:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  800174:	89 c6                	mov    %eax,%esi
  800176:	48 bf 52 4d 80 00 00 	movabs $0x804d52,%rdi
  80017d:	00 00 00 
  800180:	b8 00 00 00 00       	mov    $0x0,%eax
  800185:	48 b9 1e 08 80 00 00 	movabs $0x80081e,%rcx
  80018c:	00 00 00 
  80018f:	ff d1                	callq  *%rcx
  800191:	8b 85 70 ff ff ff    	mov    -0x90(%rbp),%eax
  800197:	48 8d 4d 80          	lea    -0x80(%rbp),%rcx
  80019b:	ba 63 00 00 00       	mov    $0x63,%edx
  8001a0:	48 89 ce             	mov    %rcx,%rsi
  8001a3:	89 c7                	mov    %eax,%edi
  8001a5:	48 b8 e2 2d 80 00 00 	movabs $0x802de2,%rax
  8001ac:	00 00 00 
  8001af:	ff d0                	callq  *%rax
  8001b1:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8001b4:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8001b8:	79 30                	jns    8001ea <umain+0x1a7>
  8001ba:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8001bd:	89 c1                	mov    %eax,%ecx
  8001bf:	48 ba 6f 4d 80 00 00 	movabs $0x804d6f,%rdx
  8001c6:	00 00 00 
  8001c9:	be 1a 00 00 00       	mov    $0x1a,%esi
  8001ce:	48 bf 19 4d 80 00 00 	movabs $0x804d19,%rdi
  8001d5:	00 00 00 
  8001d8:	b8 00 00 00 00       	mov    $0x0,%eax
  8001dd:	49 b8 e5 05 80 00 00 	movabs $0x8005e5,%r8
  8001e4:	00 00 00 
  8001e7:	41 ff d0             	callq  *%r8
  8001ea:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8001ed:	48 98                	cltq   
  8001ef:	c6 44 05 80 00       	movb   $0x0,-0x80(%rbp,%rax,1)
  8001f4:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8001fb:	00 00 00 
  8001fe:	48 8b 10             	mov    (%rax),%rdx
  800201:	48 8d 45 80          	lea    -0x80(%rbp),%rax
  800205:	48 89 d6             	mov    %rdx,%rsi
  800208:	48 89 c7             	mov    %rax,%rdi
  80020b:	48 b8 35 15 80 00 00 	movabs $0x801535,%rax
  800212:	00 00 00 
  800215:	ff d0                	callq  *%rax
  800217:	85 c0                	test   %eax,%eax
  800219:	75 1d                	jne    800238 <umain+0x1f5>
  80021b:	48 bf 78 4d 80 00 00 	movabs $0x804d78,%rdi
  800222:	00 00 00 
  800225:	b8 00 00 00 00       	mov    $0x0,%eax
  80022a:	48 ba 1e 08 80 00 00 	movabs $0x80081e,%rdx
  800231:	00 00 00 
  800234:	ff d2                	callq  *%rdx
  800236:	eb 24                	jmp    80025c <umain+0x219>
  800238:	48 8d 55 80          	lea    -0x80(%rbp),%rdx
  80023c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80023f:	89 c6                	mov    %eax,%esi
  800241:	48 bf 94 4d 80 00 00 	movabs $0x804d94,%rdi
  800248:	00 00 00 
  80024b:	b8 00 00 00 00       	mov    $0x0,%eax
  800250:	48 b9 1e 08 80 00 00 	movabs $0x80081e,%rcx
  800257:	00 00 00 
  80025a:	ff d1                	callq  *%rcx
  80025c:	48 b8 c2 05 80 00 00 	movabs $0x8005c2,%rax
  800263:	00 00 00 
  800266:	ff d0                	callq  *%rax
  800268:	e9 2b 01 00 00       	jmpq   800398 <umain+0x355>
  80026d:	8b 95 70 ff ff ff    	mov    -0x90(%rbp),%edx
  800273:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80027a:	00 00 00 
  80027d:	48 8b 00             	mov    (%rax),%rax
  800280:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  800286:	89 c6                	mov    %eax,%esi
  800288:	48 bf 35 4d 80 00 00 	movabs $0x804d35,%rdi
  80028f:	00 00 00 
  800292:	b8 00 00 00 00       	mov    $0x0,%eax
  800297:	48 b9 1e 08 80 00 00 	movabs $0x80081e,%rcx
  80029e:	00 00 00 
  8002a1:	ff d1                	callq  *%rcx
  8002a3:	8b 85 70 ff ff ff    	mov    -0x90(%rbp),%eax
  8002a9:	89 c7                	mov    %eax,%edi
  8002ab:	48 b8 eb 2a 80 00 00 	movabs $0x802aeb,%rax
  8002b2:	00 00 00 
  8002b5:	ff d0                	callq  *%rax
  8002b7:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
  8002bd:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8002c4:	00 00 00 
  8002c7:	48 8b 00             	mov    (%rax),%rax
  8002ca:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8002d0:	89 c6                	mov    %eax,%esi
  8002d2:	48 bf a7 4d 80 00 00 	movabs $0x804da7,%rdi
  8002d9:	00 00 00 
  8002dc:	b8 00 00 00 00       	mov    $0x0,%eax
  8002e1:	48 b9 1e 08 80 00 00 	movabs $0x80081e,%rcx
  8002e8:	00 00 00 
  8002eb:	ff d1                	callq  *%rcx
  8002ed:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8002f4:	00 00 00 
  8002f7:	48 8b 00             	mov    (%rax),%rax
  8002fa:	48 89 c7             	mov    %rax,%rdi
  8002fd:	48 b8 67 13 80 00 00 	movabs $0x801367,%rax
  800304:	00 00 00 
  800307:	ff d0                	callq  *%rax
  800309:	48 63 d0             	movslq %eax,%rdx
  80030c:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  800313:	00 00 00 
  800316:	48 8b 08             	mov    (%rax),%rcx
  800319:	8b 85 74 ff ff ff    	mov    -0x8c(%rbp),%eax
  80031f:	48 89 ce             	mov    %rcx,%rsi
  800322:	89 c7                	mov    %eax,%edi
  800324:	48 b8 57 2e 80 00 00 	movabs $0x802e57,%rax
  80032b:	00 00 00 
  80032e:	ff d0                	callq  *%rax
  800330:	89 45 ec             	mov    %eax,-0x14(%rbp)
  800333:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  80033a:	00 00 00 
  80033d:	48 8b 00             	mov    (%rax),%rax
  800340:	48 89 c7             	mov    %rax,%rdi
  800343:	48 b8 67 13 80 00 00 	movabs $0x801367,%rax
  80034a:	00 00 00 
  80034d:	ff d0                	callq  *%rax
  80034f:	39 45 ec             	cmp    %eax,-0x14(%rbp)
  800352:	74 30                	je     800384 <umain+0x341>
  800354:	8b 45 ec             	mov    -0x14(%rbp),%eax
  800357:	89 c1                	mov    %eax,%ecx
  800359:	48 ba c4 4d 80 00 00 	movabs $0x804dc4,%rdx
  800360:	00 00 00 
  800363:	be 26 00 00 00       	mov    $0x26,%esi
  800368:	48 bf 19 4d 80 00 00 	movabs $0x804d19,%rdi
  80036f:	00 00 00 
  800372:	b8 00 00 00 00       	mov    $0x0,%eax
  800377:	49 b8 e5 05 80 00 00 	movabs $0x8005e5,%r8
  80037e:	00 00 00 
  800381:	41 ff d0             	callq  *%r8
  800384:	8b 85 74 ff ff ff    	mov    -0x8c(%rbp),%eax
  80038a:	89 c7                	mov    %eax,%edi
  80038c:	48 b8 eb 2a 80 00 00 	movabs $0x802aeb,%rax
  800393:	00 00 00 
  800396:	ff d0                	callq  *%rax
  800398:	8b 45 e8             	mov    -0x18(%rbp),%eax
  80039b:	89 c7                	mov    %eax,%edi
  80039d:	48 b8 f5 45 80 00 00 	movabs $0x8045f5,%rax
  8003a4:	00 00 00 
  8003a7:	ff d0                	callq  *%rax
  8003a9:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8003b0:	00 00 00 
  8003b3:	48 bb ce 4d 80 00 00 	movabs $0x804dce,%rbx
  8003ba:	00 00 00 
  8003bd:	48 89 18             	mov    %rbx,(%rax)
  8003c0:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  8003c7:	48 89 c7             	mov    %rax,%rdi
  8003ca:	48 b8 2c 40 80 00 00 	movabs $0x80402c,%rax
  8003d1:	00 00 00 
  8003d4:	ff d0                	callq  *%rax
  8003d6:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8003d9:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8003dd:	79 30                	jns    80040f <umain+0x3cc>
  8003df:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8003e2:	89 c1                	mov    %eax,%ecx
  8003e4:	48 ba 10 4d 80 00 00 	movabs $0x804d10,%rdx
  8003eb:	00 00 00 
  8003ee:	be 2d 00 00 00       	mov    $0x2d,%esi
  8003f3:	48 bf 19 4d 80 00 00 	movabs $0x804d19,%rdi
  8003fa:	00 00 00 
  8003fd:	b8 00 00 00 00       	mov    $0x0,%eax
  800402:	49 b8 e5 05 80 00 00 	movabs $0x8005e5,%r8
  800409:	00 00 00 
  80040c:	41 ff d0             	callq  *%r8
  80040f:	48 b8 80 25 80 00 00 	movabs $0x802580,%rax
  800416:	00 00 00 
  800419:	ff d0                	callq  *%rax
  80041b:	89 45 e8             	mov    %eax,-0x18(%rbp)
  80041e:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  800422:	79 30                	jns    800454 <umain+0x411>
  800424:	8b 45 ec             	mov    -0x14(%rbp),%eax
  800427:	89 c1                	mov    %eax,%ecx
  800429:	48 ba 2c 4d 80 00 00 	movabs $0x804d2c,%rdx
  800430:	00 00 00 
  800433:	be 30 00 00 00       	mov    $0x30,%esi
  800438:	48 bf 19 4d 80 00 00 	movabs $0x804d19,%rdi
  80043f:	00 00 00 
  800442:	b8 00 00 00 00       	mov    $0x0,%eax
  800447:	49 b8 e5 05 80 00 00 	movabs $0x8005e5,%r8
  80044e:	00 00 00 
  800451:	41 ff d0             	callq  *%r8
  800454:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  800458:	0f 85 83 00 00 00    	jne    8004e1 <umain+0x49e>
  80045e:	8b 85 70 ff ff ff    	mov    -0x90(%rbp),%eax
  800464:	89 c7                	mov    %eax,%edi
  800466:	48 b8 eb 2a 80 00 00 	movabs $0x802aeb,%rax
  80046d:	00 00 00 
  800470:	ff d0                	callq  *%rax
  800472:	48 bf db 4d 80 00 00 	movabs $0x804ddb,%rdi
  800479:	00 00 00 
  80047c:	b8 00 00 00 00       	mov    $0x0,%eax
  800481:	48 ba 1e 08 80 00 00 	movabs $0x80081e,%rdx
  800488:	00 00 00 
  80048b:	ff d2                	callq  *%rdx
  80048d:	8b 85 74 ff ff ff    	mov    -0x8c(%rbp),%eax
  800493:	ba 01 00 00 00       	mov    $0x1,%edx
  800498:	48 be dd 4d 80 00 00 	movabs $0x804ddd,%rsi
  80049f:	00 00 00 
  8004a2:	89 c7                	mov    %eax,%edi
  8004a4:	48 b8 57 2e 80 00 00 	movabs $0x802e57,%rax
  8004ab:	00 00 00 
  8004ae:	ff d0                	callq  *%rax
  8004b0:	83 f8 01             	cmp    $0x1,%eax
  8004b3:	74 2a                	je     8004df <umain+0x49c>
  8004b5:	90                   	nop
  8004b6:	48 bf df 4d 80 00 00 	movabs $0x804ddf,%rdi
  8004bd:	00 00 00 
  8004c0:	b8 00 00 00 00       	mov    $0x0,%eax
  8004c5:	48 ba 1e 08 80 00 00 	movabs $0x80081e,%rdx
  8004cc:	00 00 00 
  8004cf:	ff d2                	callq  *%rdx
  8004d1:	48 b8 c2 05 80 00 00 	movabs $0x8005c2,%rax
  8004d8:	00 00 00 
  8004db:	ff d0                	callq  *%rax
  8004dd:	eb 02                	jmp    8004e1 <umain+0x49e>
  8004df:	eb 91                	jmp    800472 <umain+0x42f>
  8004e1:	8b 85 70 ff ff ff    	mov    -0x90(%rbp),%eax
  8004e7:	89 c7                	mov    %eax,%edi
  8004e9:	48 b8 eb 2a 80 00 00 	movabs $0x802aeb,%rax
  8004f0:	00 00 00 
  8004f3:	ff d0                	callq  *%rax
  8004f5:	8b 85 74 ff ff ff    	mov    -0x8c(%rbp),%eax
  8004fb:	89 c7                	mov    %eax,%edi
  8004fd:	48 b8 eb 2a 80 00 00 	movabs $0x802aeb,%rax
  800504:	00 00 00 
  800507:	ff d0                	callq  *%rax
  800509:	8b 45 e8             	mov    -0x18(%rbp),%eax
  80050c:	89 c7                	mov    %eax,%edi
  80050e:	48 b8 f5 45 80 00 00 	movabs $0x8045f5,%rax
  800515:	00 00 00 
  800518:	ff d0                	callq  *%rax
  80051a:	48 bf fc 4d 80 00 00 	movabs $0x804dfc,%rdi
  800521:	00 00 00 
  800524:	b8 00 00 00 00       	mov    $0x0,%eax
  800529:	48 ba 1e 08 80 00 00 	movabs $0x80081e,%rdx
  800530:	00 00 00 
  800533:	ff d2                	callq  *%rdx
  800535:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
  80053c:	5b                   	pop    %rbx
  80053d:	5d                   	pop    %rbp
  80053e:	c3                   	retq   

000000000080053f <libmain>:
  80053f:	55                   	push   %rbp
  800540:	48 89 e5             	mov    %rsp,%rbp
  800543:	48 83 ec 10          	sub    $0x10,%rsp
  800547:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80054a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80054e:	48 b8 86 1c 80 00 00 	movabs $0x801c86,%rax
  800555:	00 00 00 
  800558:	ff d0                	callq  *%rax
  80055a:	25 ff 03 00 00       	and    $0x3ff,%eax
  80055f:	48 98                	cltq   
  800561:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  800568:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80056f:	00 00 00 
  800572:	48 01 c2             	add    %rax,%rdx
  800575:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80057c:	00 00 00 
  80057f:	48 89 10             	mov    %rdx,(%rax)
  800582:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800586:	7e 14                	jle    80059c <libmain+0x5d>
  800588:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80058c:	48 8b 10             	mov    (%rax),%rdx
  80058f:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  800596:	00 00 00 
  800599:	48 89 10             	mov    %rdx,(%rax)
  80059c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8005a0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8005a3:	48 89 d6             	mov    %rdx,%rsi
  8005a6:	89 c7                	mov    %eax,%edi
  8005a8:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8005af:	00 00 00 
  8005b2:	ff d0                	callq  *%rax
  8005b4:	48 b8 c2 05 80 00 00 	movabs $0x8005c2,%rax
  8005bb:	00 00 00 
  8005be:	ff d0                	callq  *%rax
  8005c0:	c9                   	leaveq 
  8005c1:	c3                   	retq   

00000000008005c2 <exit>:
  8005c2:	55                   	push   %rbp
  8005c3:	48 89 e5             	mov    %rsp,%rbp
  8005c6:	48 b8 36 2b 80 00 00 	movabs $0x802b36,%rax
  8005cd:	00 00 00 
  8005d0:	ff d0                	callq  *%rax
  8005d2:	bf 00 00 00 00       	mov    $0x0,%edi
  8005d7:	48 b8 42 1c 80 00 00 	movabs $0x801c42,%rax
  8005de:	00 00 00 
  8005e1:	ff d0                	callq  *%rax
  8005e3:	5d                   	pop    %rbp
  8005e4:	c3                   	retq   

00000000008005e5 <_panic>:
  8005e5:	55                   	push   %rbp
  8005e6:	48 89 e5             	mov    %rsp,%rbp
  8005e9:	53                   	push   %rbx
  8005ea:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  8005f1:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  8005f8:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  8005fe:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  800605:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  80060c:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  800613:	84 c0                	test   %al,%al
  800615:	74 23                	je     80063a <_panic+0x55>
  800617:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  80061e:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  800622:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  800626:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  80062a:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  80062e:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  800632:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  800636:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  80063a:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  800641:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  800648:	00 00 00 
  80064b:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  800652:	00 00 00 
  800655:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800659:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  800660:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  800667:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  80066e:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  800675:	00 00 00 
  800678:	48 8b 18             	mov    (%rax),%rbx
  80067b:	48 b8 86 1c 80 00 00 	movabs $0x801c86,%rax
  800682:	00 00 00 
  800685:	ff d0                	callq  *%rax
  800687:	8b 8d 14 ff ff ff    	mov    -0xec(%rbp),%ecx
  80068d:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800694:	41 89 c8             	mov    %ecx,%r8d
  800697:	48 89 d1             	mov    %rdx,%rcx
  80069a:	48 89 da             	mov    %rbx,%rdx
  80069d:	89 c6                	mov    %eax,%esi
  80069f:	48 bf 20 4e 80 00 00 	movabs $0x804e20,%rdi
  8006a6:	00 00 00 
  8006a9:	b8 00 00 00 00       	mov    $0x0,%eax
  8006ae:	49 b9 1e 08 80 00 00 	movabs $0x80081e,%r9
  8006b5:	00 00 00 
  8006b8:	41 ff d1             	callq  *%r9
  8006bb:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  8006c2:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8006c9:	48 89 d6             	mov    %rdx,%rsi
  8006cc:	48 89 c7             	mov    %rax,%rdi
  8006cf:	48 b8 72 07 80 00 00 	movabs $0x800772,%rax
  8006d6:	00 00 00 
  8006d9:	ff d0                	callq  *%rax
  8006db:	48 bf 43 4e 80 00 00 	movabs $0x804e43,%rdi
  8006e2:	00 00 00 
  8006e5:	b8 00 00 00 00       	mov    $0x0,%eax
  8006ea:	48 ba 1e 08 80 00 00 	movabs $0x80081e,%rdx
  8006f1:	00 00 00 
  8006f4:	ff d2                	callq  *%rdx
  8006f6:	cc                   	int3   
  8006f7:	eb fd                	jmp    8006f6 <_panic+0x111>

00000000008006f9 <putch>:
  8006f9:	55                   	push   %rbp
  8006fa:	48 89 e5             	mov    %rsp,%rbp
  8006fd:	48 83 ec 10          	sub    $0x10,%rsp
  800701:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800704:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800708:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80070c:	8b 00                	mov    (%rax),%eax
  80070e:	8d 48 01             	lea    0x1(%rax),%ecx
  800711:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800715:	89 0a                	mov    %ecx,(%rdx)
  800717:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80071a:	89 d1                	mov    %edx,%ecx
  80071c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800720:	48 98                	cltq   
  800722:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  800726:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80072a:	8b 00                	mov    (%rax),%eax
  80072c:	3d ff 00 00 00       	cmp    $0xff,%eax
  800731:	75 2c                	jne    80075f <putch+0x66>
  800733:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800737:	8b 00                	mov    (%rax),%eax
  800739:	48 98                	cltq   
  80073b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80073f:	48 83 c2 08          	add    $0x8,%rdx
  800743:	48 89 c6             	mov    %rax,%rsi
  800746:	48 89 d7             	mov    %rdx,%rdi
  800749:	48 b8 ba 1b 80 00 00 	movabs $0x801bba,%rax
  800750:	00 00 00 
  800753:	ff d0                	callq  *%rax
  800755:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800759:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  80075f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800763:	8b 40 04             	mov    0x4(%rax),%eax
  800766:	8d 50 01             	lea    0x1(%rax),%edx
  800769:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80076d:	89 50 04             	mov    %edx,0x4(%rax)
  800770:	c9                   	leaveq 
  800771:	c3                   	retq   

0000000000800772 <vcprintf>:
  800772:	55                   	push   %rbp
  800773:	48 89 e5             	mov    %rsp,%rbp
  800776:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  80077d:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  800784:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  80078b:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  800792:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  800799:	48 8b 0a             	mov    (%rdx),%rcx
  80079c:	48 89 08             	mov    %rcx,(%rax)
  80079f:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8007a3:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8007a7:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8007ab:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8007af:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  8007b6:	00 00 00 
  8007b9:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  8007c0:	00 00 00 
  8007c3:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  8007ca:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  8007d1:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  8007d8:	48 89 c6             	mov    %rax,%rsi
  8007db:	48 bf f9 06 80 00 00 	movabs $0x8006f9,%rdi
  8007e2:	00 00 00 
  8007e5:	48 b8 d1 0b 80 00 00 	movabs $0x800bd1,%rax
  8007ec:	00 00 00 
  8007ef:	ff d0                	callq  *%rax
  8007f1:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  8007f7:	48 98                	cltq   
  8007f9:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  800800:	48 83 c2 08          	add    $0x8,%rdx
  800804:	48 89 c6             	mov    %rax,%rsi
  800807:	48 89 d7             	mov    %rdx,%rdi
  80080a:	48 b8 ba 1b 80 00 00 	movabs $0x801bba,%rax
  800811:	00 00 00 
  800814:	ff d0                	callq  *%rax
  800816:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  80081c:	c9                   	leaveq 
  80081d:	c3                   	retq   

000000000080081e <cprintf>:
  80081e:	55                   	push   %rbp
  80081f:	48 89 e5             	mov    %rsp,%rbp
  800822:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  800829:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  800830:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  800837:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  80083e:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800845:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  80084c:	84 c0                	test   %al,%al
  80084e:	74 20                	je     800870 <cprintf+0x52>
  800850:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800854:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800858:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  80085c:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800860:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800864:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800868:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  80086c:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800870:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800877:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  80087e:	00 00 00 
  800881:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800888:	00 00 00 
  80088b:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80088f:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800896:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  80089d:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8008a4:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  8008ab:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8008b2:	48 8b 0a             	mov    (%rdx),%rcx
  8008b5:	48 89 08             	mov    %rcx,(%rax)
  8008b8:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8008bc:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8008c0:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8008c4:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8008c8:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  8008cf:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8008d6:	48 89 d6             	mov    %rdx,%rsi
  8008d9:	48 89 c7             	mov    %rax,%rdi
  8008dc:	48 b8 72 07 80 00 00 	movabs $0x800772,%rax
  8008e3:	00 00 00 
  8008e6:	ff d0                	callq  *%rax
  8008e8:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  8008ee:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  8008f4:	c9                   	leaveq 
  8008f5:	c3                   	retq   

00000000008008f6 <printnum>:
  8008f6:	55                   	push   %rbp
  8008f7:	48 89 e5             	mov    %rsp,%rbp
  8008fa:	53                   	push   %rbx
  8008fb:	48 83 ec 38          	sub    $0x38,%rsp
  8008ff:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800903:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800907:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80090b:	89 4d d4             	mov    %ecx,-0x2c(%rbp)
  80090e:	44 89 45 d0          	mov    %r8d,-0x30(%rbp)
  800912:	44 89 4d cc          	mov    %r9d,-0x34(%rbp)
  800916:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  800919:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  80091d:	77 3b                	ja     80095a <printnum+0x64>
  80091f:	8b 45 d0             	mov    -0x30(%rbp),%eax
  800922:	44 8d 40 ff          	lea    -0x1(%rax),%r8d
  800926:	8b 5d d4             	mov    -0x2c(%rbp),%ebx
  800929:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80092d:	ba 00 00 00 00       	mov    $0x0,%edx
  800932:	48 f7 f3             	div    %rbx
  800935:	48 89 c2             	mov    %rax,%rdx
  800938:	8b 7d cc             	mov    -0x34(%rbp),%edi
  80093b:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  80093e:	48 8b 75 e0          	mov    -0x20(%rbp),%rsi
  800942:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800946:	41 89 f9             	mov    %edi,%r9d
  800949:	48 89 c7             	mov    %rax,%rdi
  80094c:	48 b8 f6 08 80 00 00 	movabs $0x8008f6,%rax
  800953:	00 00 00 
  800956:	ff d0                	callq  *%rax
  800958:	eb 1e                	jmp    800978 <printnum+0x82>
  80095a:	eb 12                	jmp    80096e <printnum+0x78>
  80095c:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  800960:	8b 55 cc             	mov    -0x34(%rbp),%edx
  800963:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800967:	48 89 ce             	mov    %rcx,%rsi
  80096a:	89 d7                	mov    %edx,%edi
  80096c:	ff d0                	callq  *%rax
  80096e:	83 6d d0 01          	subl   $0x1,-0x30(%rbp)
  800972:	83 7d d0 00          	cmpl   $0x0,-0x30(%rbp)
  800976:	7f e4                	jg     80095c <printnum+0x66>
  800978:	8b 4d d4             	mov    -0x2c(%rbp),%ecx
  80097b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80097f:	ba 00 00 00 00       	mov    $0x0,%edx
  800984:	48 f7 f1             	div    %rcx
  800987:	48 89 d0             	mov    %rdx,%rax
  80098a:	48 ba 50 50 80 00 00 	movabs $0x805050,%rdx
  800991:	00 00 00 
  800994:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
  800998:	0f be d0             	movsbl %al,%edx
  80099b:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80099f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009a3:	48 89 ce             	mov    %rcx,%rsi
  8009a6:	89 d7                	mov    %edx,%edi
  8009a8:	ff d0                	callq  *%rax
  8009aa:	48 83 c4 38          	add    $0x38,%rsp
  8009ae:	5b                   	pop    %rbx
  8009af:	5d                   	pop    %rbp
  8009b0:	c3                   	retq   

00000000008009b1 <getuint>:
  8009b1:	55                   	push   %rbp
  8009b2:	48 89 e5             	mov    %rsp,%rbp
  8009b5:	48 83 ec 1c          	sub    $0x1c,%rsp
  8009b9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8009bd:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8009c0:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8009c4:	7e 52                	jle    800a18 <getuint+0x67>
  8009c6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009ca:	8b 00                	mov    (%rax),%eax
  8009cc:	83 f8 30             	cmp    $0x30,%eax
  8009cf:	73 24                	jae    8009f5 <getuint+0x44>
  8009d1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009d5:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8009d9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009dd:	8b 00                	mov    (%rax),%eax
  8009df:	89 c0                	mov    %eax,%eax
  8009e1:	48 01 d0             	add    %rdx,%rax
  8009e4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009e8:	8b 12                	mov    (%rdx),%edx
  8009ea:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8009ed:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009f1:	89 0a                	mov    %ecx,(%rdx)
  8009f3:	eb 17                	jmp    800a0c <getuint+0x5b>
  8009f5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009f9:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8009fd:	48 89 d0             	mov    %rdx,%rax
  800a00:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800a04:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a08:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800a0c:	48 8b 00             	mov    (%rax),%rax
  800a0f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800a13:	e9 a3 00 00 00       	jmpq   800abb <getuint+0x10a>
  800a18:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800a1c:	74 4f                	je     800a6d <getuint+0xbc>
  800a1e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a22:	8b 00                	mov    (%rax),%eax
  800a24:	83 f8 30             	cmp    $0x30,%eax
  800a27:	73 24                	jae    800a4d <getuint+0x9c>
  800a29:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a2d:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800a31:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a35:	8b 00                	mov    (%rax),%eax
  800a37:	89 c0                	mov    %eax,%eax
  800a39:	48 01 d0             	add    %rdx,%rax
  800a3c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a40:	8b 12                	mov    (%rdx),%edx
  800a42:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800a45:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a49:	89 0a                	mov    %ecx,(%rdx)
  800a4b:	eb 17                	jmp    800a64 <getuint+0xb3>
  800a4d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a51:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800a55:	48 89 d0             	mov    %rdx,%rax
  800a58:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800a5c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a60:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800a64:	48 8b 00             	mov    (%rax),%rax
  800a67:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800a6b:	eb 4e                	jmp    800abb <getuint+0x10a>
  800a6d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a71:	8b 00                	mov    (%rax),%eax
  800a73:	83 f8 30             	cmp    $0x30,%eax
  800a76:	73 24                	jae    800a9c <getuint+0xeb>
  800a78:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a7c:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800a80:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a84:	8b 00                	mov    (%rax),%eax
  800a86:	89 c0                	mov    %eax,%eax
  800a88:	48 01 d0             	add    %rdx,%rax
  800a8b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a8f:	8b 12                	mov    (%rdx),%edx
  800a91:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800a94:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a98:	89 0a                	mov    %ecx,(%rdx)
  800a9a:	eb 17                	jmp    800ab3 <getuint+0x102>
  800a9c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800aa0:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800aa4:	48 89 d0             	mov    %rdx,%rax
  800aa7:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800aab:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800aaf:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800ab3:	8b 00                	mov    (%rax),%eax
  800ab5:	89 c0                	mov    %eax,%eax
  800ab7:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800abb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800abf:	c9                   	leaveq 
  800ac0:	c3                   	retq   

0000000000800ac1 <getint>:
  800ac1:	55                   	push   %rbp
  800ac2:	48 89 e5             	mov    %rsp,%rbp
  800ac5:	48 83 ec 1c          	sub    $0x1c,%rsp
  800ac9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800acd:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800ad0:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800ad4:	7e 52                	jle    800b28 <getint+0x67>
  800ad6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ada:	8b 00                	mov    (%rax),%eax
  800adc:	83 f8 30             	cmp    $0x30,%eax
  800adf:	73 24                	jae    800b05 <getint+0x44>
  800ae1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ae5:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800ae9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800aed:	8b 00                	mov    (%rax),%eax
  800aef:	89 c0                	mov    %eax,%eax
  800af1:	48 01 d0             	add    %rdx,%rax
  800af4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800af8:	8b 12                	mov    (%rdx),%edx
  800afa:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800afd:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b01:	89 0a                	mov    %ecx,(%rdx)
  800b03:	eb 17                	jmp    800b1c <getint+0x5b>
  800b05:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b09:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800b0d:	48 89 d0             	mov    %rdx,%rax
  800b10:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800b14:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b18:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800b1c:	48 8b 00             	mov    (%rax),%rax
  800b1f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800b23:	e9 a3 00 00 00       	jmpq   800bcb <getint+0x10a>
  800b28:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800b2c:	74 4f                	je     800b7d <getint+0xbc>
  800b2e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b32:	8b 00                	mov    (%rax),%eax
  800b34:	83 f8 30             	cmp    $0x30,%eax
  800b37:	73 24                	jae    800b5d <getint+0x9c>
  800b39:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b3d:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800b41:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b45:	8b 00                	mov    (%rax),%eax
  800b47:	89 c0                	mov    %eax,%eax
  800b49:	48 01 d0             	add    %rdx,%rax
  800b4c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b50:	8b 12                	mov    (%rdx),%edx
  800b52:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800b55:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b59:	89 0a                	mov    %ecx,(%rdx)
  800b5b:	eb 17                	jmp    800b74 <getint+0xb3>
  800b5d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b61:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800b65:	48 89 d0             	mov    %rdx,%rax
  800b68:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800b6c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b70:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800b74:	48 8b 00             	mov    (%rax),%rax
  800b77:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800b7b:	eb 4e                	jmp    800bcb <getint+0x10a>
  800b7d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b81:	8b 00                	mov    (%rax),%eax
  800b83:	83 f8 30             	cmp    $0x30,%eax
  800b86:	73 24                	jae    800bac <getint+0xeb>
  800b88:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b8c:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800b90:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b94:	8b 00                	mov    (%rax),%eax
  800b96:	89 c0                	mov    %eax,%eax
  800b98:	48 01 d0             	add    %rdx,%rax
  800b9b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b9f:	8b 12                	mov    (%rdx),%edx
  800ba1:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800ba4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800ba8:	89 0a                	mov    %ecx,(%rdx)
  800baa:	eb 17                	jmp    800bc3 <getint+0x102>
  800bac:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800bb0:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800bb4:	48 89 d0             	mov    %rdx,%rax
  800bb7:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  800bbb:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800bbf:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800bc3:	8b 00                	mov    (%rax),%eax
  800bc5:	48 98                	cltq   
  800bc7:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800bcb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800bcf:	c9                   	leaveq 
  800bd0:	c3                   	retq   

0000000000800bd1 <vprintfmt>:
  800bd1:	55                   	push   %rbp
  800bd2:	48 89 e5             	mov    %rsp,%rbp
  800bd5:	41 54                	push   %r12
  800bd7:	53                   	push   %rbx
  800bd8:	48 83 ec 60          	sub    $0x60,%rsp
  800bdc:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  800be0:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  800be4:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800be8:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  800bec:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800bf0:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  800bf4:	48 8b 0a             	mov    (%rdx),%rcx
  800bf7:	48 89 08             	mov    %rcx,(%rax)
  800bfa:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800bfe:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800c02:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800c06:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800c0a:	eb 17                	jmp    800c23 <vprintfmt+0x52>
  800c0c:	85 db                	test   %ebx,%ebx
  800c0e:	0f 84 cc 04 00 00    	je     8010e0 <vprintfmt+0x50f>
  800c14:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c18:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c1c:	48 89 d6             	mov    %rdx,%rsi
  800c1f:	89 df                	mov    %ebx,%edi
  800c21:	ff d0                	callq  *%rax
  800c23:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800c27:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800c2b:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800c2f:	0f b6 00             	movzbl (%rax),%eax
  800c32:	0f b6 d8             	movzbl %al,%ebx
  800c35:	83 fb 25             	cmp    $0x25,%ebx
  800c38:	75 d2                	jne    800c0c <vprintfmt+0x3b>
  800c3a:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  800c3e:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  800c45:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800c4c:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800c53:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  800c5a:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800c5e:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800c62:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800c66:	0f b6 00             	movzbl (%rax),%eax
  800c69:	0f b6 d8             	movzbl %al,%ebx
  800c6c:	8d 43 dd             	lea    -0x23(%rbx),%eax
  800c6f:	83 f8 55             	cmp    $0x55,%eax
  800c72:	0f 87 34 04 00 00    	ja     8010ac <vprintfmt+0x4db>
  800c78:	89 c0                	mov    %eax,%eax
  800c7a:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800c81:	00 
  800c82:	48 b8 78 50 80 00 00 	movabs $0x805078,%rax
  800c89:	00 00 00 
  800c8c:	48 01 d0             	add    %rdx,%rax
  800c8f:	48 8b 00             	mov    (%rax),%rax
  800c92:	ff e0                	jmpq   *%rax
  800c94:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  800c98:	eb c0                	jmp    800c5a <vprintfmt+0x89>
  800c9a:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  800c9e:	eb ba                	jmp    800c5a <vprintfmt+0x89>
  800ca0:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  800ca7:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800caa:	89 d0                	mov    %edx,%eax
  800cac:	c1 e0 02             	shl    $0x2,%eax
  800caf:	01 d0                	add    %edx,%eax
  800cb1:	01 c0                	add    %eax,%eax
  800cb3:	01 d8                	add    %ebx,%eax
  800cb5:	83 e8 30             	sub    $0x30,%eax
  800cb8:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800cbb:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800cbf:	0f b6 00             	movzbl (%rax),%eax
  800cc2:	0f be d8             	movsbl %al,%ebx
  800cc5:	83 fb 2f             	cmp    $0x2f,%ebx
  800cc8:	7e 0c                	jle    800cd6 <vprintfmt+0x105>
  800cca:	83 fb 39             	cmp    $0x39,%ebx
  800ccd:	7f 07                	jg     800cd6 <vprintfmt+0x105>
  800ccf:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  800cd4:	eb d1                	jmp    800ca7 <vprintfmt+0xd6>
  800cd6:	eb 58                	jmp    800d30 <vprintfmt+0x15f>
  800cd8:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800cdb:	83 f8 30             	cmp    $0x30,%eax
  800cde:	73 17                	jae    800cf7 <vprintfmt+0x126>
  800ce0:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800ce4:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800ce7:	89 c0                	mov    %eax,%eax
  800ce9:	48 01 d0             	add    %rdx,%rax
  800cec:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800cef:	83 c2 08             	add    $0x8,%edx
  800cf2:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800cf5:	eb 0f                	jmp    800d06 <vprintfmt+0x135>
  800cf7:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800cfb:	48 89 d0             	mov    %rdx,%rax
  800cfe:	48 83 c2 08          	add    $0x8,%rdx
  800d02:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800d06:	8b 00                	mov    (%rax),%eax
  800d08:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800d0b:	eb 23                	jmp    800d30 <vprintfmt+0x15f>
  800d0d:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800d11:	79 0c                	jns    800d1f <vprintfmt+0x14e>
  800d13:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  800d1a:	e9 3b ff ff ff       	jmpq   800c5a <vprintfmt+0x89>
  800d1f:	e9 36 ff ff ff       	jmpq   800c5a <vprintfmt+0x89>
  800d24:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  800d2b:	e9 2a ff ff ff       	jmpq   800c5a <vprintfmt+0x89>
  800d30:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800d34:	79 12                	jns    800d48 <vprintfmt+0x177>
  800d36:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800d39:	89 45 dc             	mov    %eax,-0x24(%rbp)
  800d3c:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800d43:	e9 12 ff ff ff       	jmpq   800c5a <vprintfmt+0x89>
  800d48:	e9 0d ff ff ff       	jmpq   800c5a <vprintfmt+0x89>
  800d4d:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  800d51:	e9 04 ff ff ff       	jmpq   800c5a <vprintfmt+0x89>
  800d56:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800d59:	83 f8 30             	cmp    $0x30,%eax
  800d5c:	73 17                	jae    800d75 <vprintfmt+0x1a4>
  800d5e:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800d62:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800d65:	89 c0                	mov    %eax,%eax
  800d67:	48 01 d0             	add    %rdx,%rax
  800d6a:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800d6d:	83 c2 08             	add    $0x8,%edx
  800d70:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800d73:	eb 0f                	jmp    800d84 <vprintfmt+0x1b3>
  800d75:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800d79:	48 89 d0             	mov    %rdx,%rax
  800d7c:	48 83 c2 08          	add    $0x8,%rdx
  800d80:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800d84:	8b 10                	mov    (%rax),%edx
  800d86:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800d8a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d8e:	48 89 ce             	mov    %rcx,%rsi
  800d91:	89 d7                	mov    %edx,%edi
  800d93:	ff d0                	callq  *%rax
  800d95:	e9 40 03 00 00       	jmpq   8010da <vprintfmt+0x509>
  800d9a:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800d9d:	83 f8 30             	cmp    $0x30,%eax
  800da0:	73 17                	jae    800db9 <vprintfmt+0x1e8>
  800da2:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800da6:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800da9:	89 c0                	mov    %eax,%eax
  800dab:	48 01 d0             	add    %rdx,%rax
  800dae:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800db1:	83 c2 08             	add    $0x8,%edx
  800db4:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800db7:	eb 0f                	jmp    800dc8 <vprintfmt+0x1f7>
  800db9:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800dbd:	48 89 d0             	mov    %rdx,%rax
  800dc0:	48 83 c2 08          	add    $0x8,%rdx
  800dc4:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800dc8:	8b 18                	mov    (%rax),%ebx
  800dca:	85 db                	test   %ebx,%ebx
  800dcc:	79 02                	jns    800dd0 <vprintfmt+0x1ff>
  800dce:	f7 db                	neg    %ebx
  800dd0:	83 fb 15             	cmp    $0x15,%ebx
  800dd3:	7f 16                	jg     800deb <vprintfmt+0x21a>
  800dd5:	48 b8 a0 4f 80 00 00 	movabs $0x804fa0,%rax
  800ddc:	00 00 00 
  800ddf:	48 63 d3             	movslq %ebx,%rdx
  800de2:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800de6:	4d 85 e4             	test   %r12,%r12
  800de9:	75 2e                	jne    800e19 <vprintfmt+0x248>
  800deb:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800def:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800df3:	89 d9                	mov    %ebx,%ecx
  800df5:	48 ba 61 50 80 00 00 	movabs $0x805061,%rdx
  800dfc:	00 00 00 
  800dff:	48 89 c7             	mov    %rax,%rdi
  800e02:	b8 00 00 00 00       	mov    $0x0,%eax
  800e07:	49 b8 e9 10 80 00 00 	movabs $0x8010e9,%r8
  800e0e:	00 00 00 
  800e11:	41 ff d0             	callq  *%r8
  800e14:	e9 c1 02 00 00       	jmpq   8010da <vprintfmt+0x509>
  800e19:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800e1d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e21:	4c 89 e1             	mov    %r12,%rcx
  800e24:	48 ba 6a 50 80 00 00 	movabs $0x80506a,%rdx
  800e2b:	00 00 00 
  800e2e:	48 89 c7             	mov    %rax,%rdi
  800e31:	b8 00 00 00 00       	mov    $0x0,%eax
  800e36:	49 b8 e9 10 80 00 00 	movabs $0x8010e9,%r8
  800e3d:	00 00 00 
  800e40:	41 ff d0             	callq  *%r8
  800e43:	e9 92 02 00 00       	jmpq   8010da <vprintfmt+0x509>
  800e48:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800e4b:	83 f8 30             	cmp    $0x30,%eax
  800e4e:	73 17                	jae    800e67 <vprintfmt+0x296>
  800e50:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800e54:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800e57:	89 c0                	mov    %eax,%eax
  800e59:	48 01 d0             	add    %rdx,%rax
  800e5c:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800e5f:	83 c2 08             	add    $0x8,%edx
  800e62:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800e65:	eb 0f                	jmp    800e76 <vprintfmt+0x2a5>
  800e67:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  800e6b:	48 89 d0             	mov    %rdx,%rax
  800e6e:	48 83 c2 08          	add    $0x8,%rdx
  800e72:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800e76:	4c 8b 20             	mov    (%rax),%r12
  800e79:	4d 85 e4             	test   %r12,%r12
  800e7c:	75 0a                	jne    800e88 <vprintfmt+0x2b7>
  800e7e:	49 bc 6d 50 80 00 00 	movabs $0x80506d,%r12
  800e85:	00 00 00 
  800e88:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800e8c:	7e 3f                	jle    800ecd <vprintfmt+0x2fc>
  800e8e:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  800e92:	74 39                	je     800ecd <vprintfmt+0x2fc>
  800e94:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800e97:	48 98                	cltq   
  800e99:	48 89 c6             	mov    %rax,%rsi
  800e9c:	4c 89 e7             	mov    %r12,%rdi
  800e9f:	48 b8 95 13 80 00 00 	movabs $0x801395,%rax
  800ea6:	00 00 00 
  800ea9:	ff d0                	callq  *%rax
  800eab:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800eae:	eb 17                	jmp    800ec7 <vprintfmt+0x2f6>
  800eb0:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800eb4:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800eb8:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ebc:	48 89 ce             	mov    %rcx,%rsi
  800ebf:	89 d7                	mov    %edx,%edi
  800ec1:	ff d0                	callq  *%rax
  800ec3:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800ec7:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800ecb:	7f e3                	jg     800eb0 <vprintfmt+0x2df>
  800ecd:	eb 37                	jmp    800f06 <vprintfmt+0x335>
  800ecf:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  800ed3:	74 1e                	je     800ef3 <vprintfmt+0x322>
  800ed5:	83 fb 1f             	cmp    $0x1f,%ebx
  800ed8:	7e 05                	jle    800edf <vprintfmt+0x30e>
  800eda:	83 fb 7e             	cmp    $0x7e,%ebx
  800edd:	7e 14                	jle    800ef3 <vprintfmt+0x322>
  800edf:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800ee3:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ee7:	48 89 d6             	mov    %rdx,%rsi
  800eea:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800eef:	ff d0                	callq  *%rax
  800ef1:	eb 0f                	jmp    800f02 <vprintfmt+0x331>
  800ef3:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800ef7:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800efb:	48 89 d6             	mov    %rdx,%rsi
  800efe:	89 df                	mov    %ebx,%edi
  800f00:	ff d0                	callq  *%rax
  800f02:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800f06:	4c 89 e0             	mov    %r12,%rax
  800f09:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800f0d:	0f b6 00             	movzbl (%rax),%eax
  800f10:	0f be d8             	movsbl %al,%ebx
  800f13:	85 db                	test   %ebx,%ebx
  800f15:	74 10                	je     800f27 <vprintfmt+0x356>
  800f17:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800f1b:	78 b2                	js     800ecf <vprintfmt+0x2fe>
  800f1d:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800f21:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800f25:	79 a8                	jns    800ecf <vprintfmt+0x2fe>
  800f27:	eb 16                	jmp    800f3f <vprintfmt+0x36e>
  800f29:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800f2d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800f31:	48 89 d6             	mov    %rdx,%rsi
  800f34:	bf 20 00 00 00       	mov    $0x20,%edi
  800f39:	ff d0                	callq  *%rax
  800f3b:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800f3f:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800f43:	7f e4                	jg     800f29 <vprintfmt+0x358>
  800f45:	e9 90 01 00 00       	jmpq   8010da <vprintfmt+0x509>
  800f4a:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800f4e:	be 03 00 00 00       	mov    $0x3,%esi
  800f53:	48 89 c7             	mov    %rax,%rdi
  800f56:	48 b8 c1 0a 80 00 00 	movabs $0x800ac1,%rax
  800f5d:	00 00 00 
  800f60:	ff d0                	callq  *%rax
  800f62:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800f66:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f6a:	48 85 c0             	test   %rax,%rax
  800f6d:	79 1d                	jns    800f8c <vprintfmt+0x3bb>
  800f6f:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800f73:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800f77:	48 89 d6             	mov    %rdx,%rsi
  800f7a:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800f7f:	ff d0                	callq  *%rax
  800f81:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f85:	48 f7 d8             	neg    %rax
  800f88:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800f8c:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800f93:	e9 d5 00 00 00       	jmpq   80106d <vprintfmt+0x49c>
  800f98:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800f9c:	be 03 00 00 00       	mov    $0x3,%esi
  800fa1:	48 89 c7             	mov    %rax,%rdi
  800fa4:	48 b8 b1 09 80 00 00 	movabs $0x8009b1,%rax
  800fab:	00 00 00 
  800fae:	ff d0                	callq  *%rax
  800fb0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800fb4:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800fbb:	e9 ad 00 00 00       	jmpq   80106d <vprintfmt+0x49c>
  800fc0:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800fc4:	be 03 00 00 00       	mov    $0x3,%esi
  800fc9:	48 89 c7             	mov    %rax,%rdi
  800fcc:	48 b8 b1 09 80 00 00 	movabs $0x8009b1,%rax
  800fd3:	00 00 00 
  800fd6:	ff d0                	callq  *%rax
  800fd8:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800fdc:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800fe3:	e9 85 00 00 00       	jmpq   80106d <vprintfmt+0x49c>
  800fe8:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800fec:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ff0:	48 89 d6             	mov    %rdx,%rsi
  800ff3:	bf 30 00 00 00       	mov    $0x30,%edi
  800ff8:	ff d0                	callq  *%rax
  800ffa:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800ffe:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801002:	48 89 d6             	mov    %rdx,%rsi
  801005:	bf 78 00 00 00       	mov    $0x78,%edi
  80100a:	ff d0                	callq  *%rax
  80100c:	8b 45 b8             	mov    -0x48(%rbp),%eax
  80100f:	83 f8 30             	cmp    $0x30,%eax
  801012:	73 17                	jae    80102b <vprintfmt+0x45a>
  801014:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  801018:	8b 45 b8             	mov    -0x48(%rbp),%eax
  80101b:	89 c0                	mov    %eax,%eax
  80101d:	48 01 d0             	add    %rdx,%rax
  801020:	8b 55 b8             	mov    -0x48(%rbp),%edx
  801023:	83 c2 08             	add    $0x8,%edx
  801026:	89 55 b8             	mov    %edx,-0x48(%rbp)
  801029:	eb 0f                	jmp    80103a <vprintfmt+0x469>
  80102b:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  80102f:	48 89 d0             	mov    %rdx,%rax
  801032:	48 83 c2 08          	add    $0x8,%rdx
  801036:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  80103a:	48 8b 00             	mov    (%rax),%rax
  80103d:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801041:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  801048:	eb 23                	jmp    80106d <vprintfmt+0x49c>
  80104a:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  80104e:	be 03 00 00 00       	mov    $0x3,%esi
  801053:	48 89 c7             	mov    %rax,%rdi
  801056:	48 b8 b1 09 80 00 00 	movabs $0x8009b1,%rax
  80105d:	00 00 00 
  801060:	ff d0                	callq  *%rax
  801062:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801066:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  80106d:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  801072:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  801075:	8b 7d dc             	mov    -0x24(%rbp),%edi
  801078:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80107c:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  801080:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801084:	45 89 c1             	mov    %r8d,%r9d
  801087:	41 89 f8             	mov    %edi,%r8d
  80108a:	48 89 c7             	mov    %rax,%rdi
  80108d:	48 b8 f6 08 80 00 00 	movabs $0x8008f6,%rax
  801094:	00 00 00 
  801097:	ff d0                	callq  *%rax
  801099:	eb 3f                	jmp    8010da <vprintfmt+0x509>
  80109b:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  80109f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8010a3:	48 89 d6             	mov    %rdx,%rsi
  8010a6:	89 df                	mov    %ebx,%edi
  8010a8:	ff d0                	callq  *%rax
  8010aa:	eb 2e                	jmp    8010da <vprintfmt+0x509>
  8010ac:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8010b0:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8010b4:	48 89 d6             	mov    %rdx,%rsi
  8010b7:	bf 25 00 00 00       	mov    $0x25,%edi
  8010bc:	ff d0                	callq  *%rax
  8010be:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  8010c3:	eb 05                	jmp    8010ca <vprintfmt+0x4f9>
  8010c5:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  8010ca:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8010ce:	48 83 e8 01          	sub    $0x1,%rax
  8010d2:	0f b6 00             	movzbl (%rax),%eax
  8010d5:	3c 25                	cmp    $0x25,%al
  8010d7:	75 ec                	jne    8010c5 <vprintfmt+0x4f4>
  8010d9:	90                   	nop
  8010da:	90                   	nop
  8010db:	e9 43 fb ff ff       	jmpq   800c23 <vprintfmt+0x52>
  8010e0:	48 83 c4 60          	add    $0x60,%rsp
  8010e4:	5b                   	pop    %rbx
  8010e5:	41 5c                	pop    %r12
  8010e7:	5d                   	pop    %rbp
  8010e8:	c3                   	retq   

00000000008010e9 <printfmt>:
  8010e9:	55                   	push   %rbp
  8010ea:	48 89 e5             	mov    %rsp,%rbp
  8010ed:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  8010f4:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  8010fb:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  801102:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  801109:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  801110:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  801117:	84 c0                	test   %al,%al
  801119:	74 20                	je     80113b <printfmt+0x52>
  80111b:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  80111f:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  801123:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  801127:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  80112b:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  80112f:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  801133:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  801137:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  80113b:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  801142:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  801149:	00 00 00 
  80114c:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  801153:	00 00 00 
  801156:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80115a:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  801161:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  801168:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  80116f:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  801176:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  80117d:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  801184:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  80118b:	48 89 c7             	mov    %rax,%rdi
  80118e:	48 b8 d1 0b 80 00 00 	movabs $0x800bd1,%rax
  801195:	00 00 00 
  801198:	ff d0                	callq  *%rax
  80119a:	c9                   	leaveq 
  80119b:	c3                   	retq   

000000000080119c <sprintputch>:
  80119c:	55                   	push   %rbp
  80119d:	48 89 e5             	mov    %rsp,%rbp
  8011a0:	48 83 ec 10          	sub    $0x10,%rsp
  8011a4:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8011a7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8011ab:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8011af:	8b 40 10             	mov    0x10(%rax),%eax
  8011b2:	8d 50 01             	lea    0x1(%rax),%edx
  8011b5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8011b9:	89 50 10             	mov    %edx,0x10(%rax)
  8011bc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8011c0:	48 8b 10             	mov    (%rax),%rdx
  8011c3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8011c7:	48 8b 40 08          	mov    0x8(%rax),%rax
  8011cb:	48 39 c2             	cmp    %rax,%rdx
  8011ce:	73 17                	jae    8011e7 <sprintputch+0x4b>
  8011d0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8011d4:	48 8b 00             	mov    (%rax),%rax
  8011d7:	48 8d 48 01          	lea    0x1(%rax),%rcx
  8011db:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8011df:	48 89 0a             	mov    %rcx,(%rdx)
  8011e2:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8011e5:	88 10                	mov    %dl,(%rax)
  8011e7:	c9                   	leaveq 
  8011e8:	c3                   	retq   

00000000008011e9 <vsnprintf>:
  8011e9:	55                   	push   %rbp
  8011ea:	48 89 e5             	mov    %rsp,%rbp
  8011ed:	48 83 ec 50          	sub    $0x50,%rsp
  8011f1:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  8011f5:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  8011f8:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  8011fc:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  801200:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  801204:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  801208:	48 8b 0a             	mov    (%rdx),%rcx
  80120b:	48 89 08             	mov    %rcx,(%rax)
  80120e:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  801212:	48 89 48 08          	mov    %rcx,0x8(%rax)
  801216:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  80121a:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80121e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801222:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  801226:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  801229:	48 98                	cltq   
  80122b:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80122f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801233:	48 01 d0             	add    %rdx,%rax
  801236:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  80123a:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  801241:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  801246:	74 06                	je     80124e <vsnprintf+0x65>
  801248:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  80124c:	7f 07                	jg     801255 <vsnprintf+0x6c>
  80124e:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801253:	eb 2f                	jmp    801284 <vsnprintf+0x9b>
  801255:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  801259:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  80125d:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  801261:	48 89 c6             	mov    %rax,%rsi
  801264:	48 bf 9c 11 80 00 00 	movabs $0x80119c,%rdi
  80126b:	00 00 00 
  80126e:	48 b8 d1 0b 80 00 00 	movabs $0x800bd1,%rax
  801275:	00 00 00 
  801278:	ff d0                	callq  *%rax
  80127a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80127e:	c6 00 00             	movb   $0x0,(%rax)
  801281:	8b 45 e0             	mov    -0x20(%rbp),%eax
  801284:	c9                   	leaveq 
  801285:	c3                   	retq   

0000000000801286 <snprintf>:
  801286:	55                   	push   %rbp
  801287:	48 89 e5             	mov    %rsp,%rbp
  80128a:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  801291:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  801298:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  80129e:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8012a5:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8012ac:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8012b3:	84 c0                	test   %al,%al
  8012b5:	74 20                	je     8012d7 <snprintf+0x51>
  8012b7:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8012bb:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8012bf:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8012c3:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8012c7:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8012cb:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8012cf:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8012d3:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8012d7:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  8012de:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  8012e5:	00 00 00 
  8012e8:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8012ef:	00 00 00 
  8012f2:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8012f6:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8012fd:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  801304:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  80130b:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  801312:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  801319:	48 8b 0a             	mov    (%rdx),%rcx
  80131c:	48 89 08             	mov    %rcx,(%rax)
  80131f:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  801323:	48 89 48 08          	mov    %rcx,0x8(%rax)
  801327:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  80132b:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80132f:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  801336:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  80133d:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  801343:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  80134a:	48 89 c7             	mov    %rax,%rdi
  80134d:	48 b8 e9 11 80 00 00 	movabs $0x8011e9,%rax
  801354:	00 00 00 
  801357:	ff d0                	callq  *%rax
  801359:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  80135f:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  801365:	c9                   	leaveq 
  801366:	c3                   	retq   

0000000000801367 <strlen>:
  801367:	55                   	push   %rbp
  801368:	48 89 e5             	mov    %rsp,%rbp
  80136b:	48 83 ec 18          	sub    $0x18,%rsp
  80136f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801373:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80137a:	eb 09                	jmp    801385 <strlen+0x1e>
  80137c:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801380:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801385:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801389:	0f b6 00             	movzbl (%rax),%eax
  80138c:	84 c0                	test   %al,%al
  80138e:	75 ec                	jne    80137c <strlen+0x15>
  801390:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801393:	c9                   	leaveq 
  801394:	c3                   	retq   

0000000000801395 <strnlen>:
  801395:	55                   	push   %rbp
  801396:	48 89 e5             	mov    %rsp,%rbp
  801399:	48 83 ec 20          	sub    $0x20,%rsp
  80139d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8013a1:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8013a5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8013ac:	eb 0e                	jmp    8013bc <strnlen+0x27>
  8013ae:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8013b2:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8013b7:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  8013bc:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8013c1:	74 0b                	je     8013ce <strnlen+0x39>
  8013c3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013c7:	0f b6 00             	movzbl (%rax),%eax
  8013ca:	84 c0                	test   %al,%al
  8013cc:	75 e0                	jne    8013ae <strnlen+0x19>
  8013ce:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8013d1:	c9                   	leaveq 
  8013d2:	c3                   	retq   

00000000008013d3 <strcpy>:
  8013d3:	55                   	push   %rbp
  8013d4:	48 89 e5             	mov    %rsp,%rbp
  8013d7:	48 83 ec 20          	sub    $0x20,%rsp
  8013db:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8013df:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8013e3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013e7:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8013eb:	90                   	nop
  8013ec:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013f0:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8013f4:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8013f8:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8013fc:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801400:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  801404:	0f b6 12             	movzbl (%rdx),%edx
  801407:	88 10                	mov    %dl,(%rax)
  801409:	0f b6 00             	movzbl (%rax),%eax
  80140c:	84 c0                	test   %al,%al
  80140e:	75 dc                	jne    8013ec <strcpy+0x19>
  801410:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801414:	c9                   	leaveq 
  801415:	c3                   	retq   

0000000000801416 <strcat>:
  801416:	55                   	push   %rbp
  801417:	48 89 e5             	mov    %rsp,%rbp
  80141a:	48 83 ec 20          	sub    $0x20,%rsp
  80141e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801422:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801426:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80142a:	48 89 c7             	mov    %rax,%rdi
  80142d:	48 b8 67 13 80 00 00 	movabs $0x801367,%rax
  801434:	00 00 00 
  801437:	ff d0                	callq  *%rax
  801439:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80143c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80143f:	48 63 d0             	movslq %eax,%rdx
  801442:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801446:	48 01 c2             	add    %rax,%rdx
  801449:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80144d:	48 89 c6             	mov    %rax,%rsi
  801450:	48 89 d7             	mov    %rdx,%rdi
  801453:	48 b8 d3 13 80 00 00 	movabs $0x8013d3,%rax
  80145a:	00 00 00 
  80145d:	ff d0                	callq  *%rax
  80145f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801463:	c9                   	leaveq 
  801464:	c3                   	retq   

0000000000801465 <strncpy>:
  801465:	55                   	push   %rbp
  801466:	48 89 e5             	mov    %rsp,%rbp
  801469:	48 83 ec 28          	sub    $0x28,%rsp
  80146d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801471:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801475:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801479:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80147d:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801481:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  801488:	00 
  801489:	eb 2a                	jmp    8014b5 <strncpy+0x50>
  80148b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80148f:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801493:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801497:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80149b:	0f b6 12             	movzbl (%rdx),%edx
  80149e:	88 10                	mov    %dl,(%rax)
  8014a0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8014a4:	0f b6 00             	movzbl (%rax),%eax
  8014a7:	84 c0                	test   %al,%al
  8014a9:	74 05                	je     8014b0 <strncpy+0x4b>
  8014ab:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  8014b0:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8014b5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014b9:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8014bd:	72 cc                	jb     80148b <strncpy+0x26>
  8014bf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014c3:	c9                   	leaveq 
  8014c4:	c3                   	retq   

00000000008014c5 <strlcpy>:
  8014c5:	55                   	push   %rbp
  8014c6:	48 89 e5             	mov    %rsp,%rbp
  8014c9:	48 83 ec 28          	sub    $0x28,%rsp
  8014cd:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8014d1:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8014d5:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8014d9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014dd:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8014e1:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8014e6:	74 3d                	je     801525 <strlcpy+0x60>
  8014e8:	eb 1d                	jmp    801507 <strlcpy+0x42>
  8014ea:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014ee:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8014f2:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8014f6:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8014fa:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8014fe:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  801502:	0f b6 12             	movzbl (%rdx),%edx
  801505:	88 10                	mov    %dl,(%rax)
  801507:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  80150c:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801511:	74 0b                	je     80151e <strlcpy+0x59>
  801513:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801517:	0f b6 00             	movzbl (%rax),%eax
  80151a:	84 c0                	test   %al,%al
  80151c:	75 cc                	jne    8014ea <strlcpy+0x25>
  80151e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801522:	c6 00 00             	movb   $0x0,(%rax)
  801525:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801529:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80152d:	48 29 c2             	sub    %rax,%rdx
  801530:	48 89 d0             	mov    %rdx,%rax
  801533:	c9                   	leaveq 
  801534:	c3                   	retq   

0000000000801535 <strcmp>:
  801535:	55                   	push   %rbp
  801536:	48 89 e5             	mov    %rsp,%rbp
  801539:	48 83 ec 10          	sub    $0x10,%rsp
  80153d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801541:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801545:	eb 0a                	jmp    801551 <strcmp+0x1c>
  801547:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80154c:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801551:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801555:	0f b6 00             	movzbl (%rax),%eax
  801558:	84 c0                	test   %al,%al
  80155a:	74 12                	je     80156e <strcmp+0x39>
  80155c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801560:	0f b6 10             	movzbl (%rax),%edx
  801563:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801567:	0f b6 00             	movzbl (%rax),%eax
  80156a:	38 c2                	cmp    %al,%dl
  80156c:	74 d9                	je     801547 <strcmp+0x12>
  80156e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801572:	0f b6 00             	movzbl (%rax),%eax
  801575:	0f b6 d0             	movzbl %al,%edx
  801578:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80157c:	0f b6 00             	movzbl (%rax),%eax
  80157f:	0f b6 c0             	movzbl %al,%eax
  801582:	29 c2                	sub    %eax,%edx
  801584:	89 d0                	mov    %edx,%eax
  801586:	c9                   	leaveq 
  801587:	c3                   	retq   

0000000000801588 <strncmp>:
  801588:	55                   	push   %rbp
  801589:	48 89 e5             	mov    %rsp,%rbp
  80158c:	48 83 ec 18          	sub    $0x18,%rsp
  801590:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801594:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801598:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80159c:	eb 0f                	jmp    8015ad <strncmp+0x25>
  80159e:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  8015a3:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8015a8:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8015ad:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8015b2:	74 1d                	je     8015d1 <strncmp+0x49>
  8015b4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015b8:	0f b6 00             	movzbl (%rax),%eax
  8015bb:	84 c0                	test   %al,%al
  8015bd:	74 12                	je     8015d1 <strncmp+0x49>
  8015bf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015c3:	0f b6 10             	movzbl (%rax),%edx
  8015c6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015ca:	0f b6 00             	movzbl (%rax),%eax
  8015cd:	38 c2                	cmp    %al,%dl
  8015cf:	74 cd                	je     80159e <strncmp+0x16>
  8015d1:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8015d6:	75 07                	jne    8015df <strncmp+0x57>
  8015d8:	b8 00 00 00 00       	mov    $0x0,%eax
  8015dd:	eb 18                	jmp    8015f7 <strncmp+0x6f>
  8015df:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015e3:	0f b6 00             	movzbl (%rax),%eax
  8015e6:	0f b6 d0             	movzbl %al,%edx
  8015e9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015ed:	0f b6 00             	movzbl (%rax),%eax
  8015f0:	0f b6 c0             	movzbl %al,%eax
  8015f3:	29 c2                	sub    %eax,%edx
  8015f5:	89 d0                	mov    %edx,%eax
  8015f7:	c9                   	leaveq 
  8015f8:	c3                   	retq   

00000000008015f9 <strchr>:
  8015f9:	55                   	push   %rbp
  8015fa:	48 89 e5             	mov    %rsp,%rbp
  8015fd:	48 83 ec 0c          	sub    $0xc,%rsp
  801601:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801605:	89 f0                	mov    %esi,%eax
  801607:	88 45 f4             	mov    %al,-0xc(%rbp)
  80160a:	eb 17                	jmp    801623 <strchr+0x2a>
  80160c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801610:	0f b6 00             	movzbl (%rax),%eax
  801613:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801616:	75 06                	jne    80161e <strchr+0x25>
  801618:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80161c:	eb 15                	jmp    801633 <strchr+0x3a>
  80161e:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801623:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801627:	0f b6 00             	movzbl (%rax),%eax
  80162a:	84 c0                	test   %al,%al
  80162c:	75 de                	jne    80160c <strchr+0x13>
  80162e:	b8 00 00 00 00       	mov    $0x0,%eax
  801633:	c9                   	leaveq 
  801634:	c3                   	retq   

0000000000801635 <strfind>:
  801635:	55                   	push   %rbp
  801636:	48 89 e5             	mov    %rsp,%rbp
  801639:	48 83 ec 0c          	sub    $0xc,%rsp
  80163d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801641:	89 f0                	mov    %esi,%eax
  801643:	88 45 f4             	mov    %al,-0xc(%rbp)
  801646:	eb 13                	jmp    80165b <strfind+0x26>
  801648:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80164c:	0f b6 00             	movzbl (%rax),%eax
  80164f:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801652:	75 02                	jne    801656 <strfind+0x21>
  801654:	eb 10                	jmp    801666 <strfind+0x31>
  801656:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80165b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80165f:	0f b6 00             	movzbl (%rax),%eax
  801662:	84 c0                	test   %al,%al
  801664:	75 e2                	jne    801648 <strfind+0x13>
  801666:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80166a:	c9                   	leaveq 
  80166b:	c3                   	retq   

000000000080166c <memset>:
  80166c:	55                   	push   %rbp
  80166d:	48 89 e5             	mov    %rsp,%rbp
  801670:	48 83 ec 18          	sub    $0x18,%rsp
  801674:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801678:	89 75 f4             	mov    %esi,-0xc(%rbp)
  80167b:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80167f:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801684:	75 06                	jne    80168c <memset+0x20>
  801686:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80168a:	eb 69                	jmp    8016f5 <memset+0x89>
  80168c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801690:	83 e0 03             	and    $0x3,%eax
  801693:	48 85 c0             	test   %rax,%rax
  801696:	75 48                	jne    8016e0 <memset+0x74>
  801698:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80169c:	83 e0 03             	and    $0x3,%eax
  80169f:	48 85 c0             	test   %rax,%rax
  8016a2:	75 3c                	jne    8016e0 <memset+0x74>
  8016a4:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  8016ab:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8016ae:	c1 e0 18             	shl    $0x18,%eax
  8016b1:	89 c2                	mov    %eax,%edx
  8016b3:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8016b6:	c1 e0 10             	shl    $0x10,%eax
  8016b9:	09 c2                	or     %eax,%edx
  8016bb:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8016be:	c1 e0 08             	shl    $0x8,%eax
  8016c1:	09 d0                	or     %edx,%eax
  8016c3:	09 45 f4             	or     %eax,-0xc(%rbp)
  8016c6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8016ca:	48 c1 e8 02          	shr    $0x2,%rax
  8016ce:	48 89 c1             	mov    %rax,%rcx
  8016d1:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8016d5:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8016d8:	48 89 d7             	mov    %rdx,%rdi
  8016db:	fc                   	cld    
  8016dc:	f3 ab                	rep stos %eax,%es:(%rdi)
  8016de:	eb 11                	jmp    8016f1 <memset+0x85>
  8016e0:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8016e4:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8016e7:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8016eb:	48 89 d7             	mov    %rdx,%rdi
  8016ee:	fc                   	cld    
  8016ef:	f3 aa                	rep stos %al,%es:(%rdi)
  8016f1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016f5:	c9                   	leaveq 
  8016f6:	c3                   	retq   

00000000008016f7 <memmove>:
  8016f7:	55                   	push   %rbp
  8016f8:	48 89 e5             	mov    %rsp,%rbp
  8016fb:	48 83 ec 28          	sub    $0x28,%rsp
  8016ff:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801703:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801707:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80170b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80170f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801713:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801717:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80171b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80171f:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801723:	0f 83 88 00 00 00    	jae    8017b1 <memmove+0xba>
  801729:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80172d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801731:	48 01 d0             	add    %rdx,%rax
  801734:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801738:	76 77                	jbe    8017b1 <memmove+0xba>
  80173a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80173e:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  801742:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801746:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  80174a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80174e:	83 e0 03             	and    $0x3,%eax
  801751:	48 85 c0             	test   %rax,%rax
  801754:	75 3b                	jne    801791 <memmove+0x9a>
  801756:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80175a:	83 e0 03             	and    $0x3,%eax
  80175d:	48 85 c0             	test   %rax,%rax
  801760:	75 2f                	jne    801791 <memmove+0x9a>
  801762:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801766:	83 e0 03             	and    $0x3,%eax
  801769:	48 85 c0             	test   %rax,%rax
  80176c:	75 23                	jne    801791 <memmove+0x9a>
  80176e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801772:	48 83 e8 04          	sub    $0x4,%rax
  801776:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80177a:	48 83 ea 04          	sub    $0x4,%rdx
  80177e:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801782:	48 c1 e9 02          	shr    $0x2,%rcx
  801786:	48 89 c7             	mov    %rax,%rdi
  801789:	48 89 d6             	mov    %rdx,%rsi
  80178c:	fd                   	std    
  80178d:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  80178f:	eb 1d                	jmp    8017ae <memmove+0xb7>
  801791:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801795:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801799:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80179d:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  8017a1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017a5:	48 89 d7             	mov    %rdx,%rdi
  8017a8:	48 89 c1             	mov    %rax,%rcx
  8017ab:	fd                   	std    
  8017ac:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  8017ae:	fc                   	cld    
  8017af:	eb 57                	jmp    801808 <memmove+0x111>
  8017b1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8017b5:	83 e0 03             	and    $0x3,%eax
  8017b8:	48 85 c0             	test   %rax,%rax
  8017bb:	75 36                	jne    8017f3 <memmove+0xfc>
  8017bd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017c1:	83 e0 03             	and    $0x3,%eax
  8017c4:	48 85 c0             	test   %rax,%rax
  8017c7:	75 2a                	jne    8017f3 <memmove+0xfc>
  8017c9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017cd:	83 e0 03             	and    $0x3,%eax
  8017d0:	48 85 c0             	test   %rax,%rax
  8017d3:	75 1e                	jne    8017f3 <memmove+0xfc>
  8017d5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017d9:	48 c1 e8 02          	shr    $0x2,%rax
  8017dd:	48 89 c1             	mov    %rax,%rcx
  8017e0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017e4:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8017e8:	48 89 c7             	mov    %rax,%rdi
  8017eb:	48 89 d6             	mov    %rdx,%rsi
  8017ee:	fc                   	cld    
  8017ef:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  8017f1:	eb 15                	jmp    801808 <memmove+0x111>
  8017f3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017f7:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8017fb:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  8017ff:	48 89 c7             	mov    %rax,%rdi
  801802:	48 89 d6             	mov    %rdx,%rsi
  801805:	fc                   	cld    
  801806:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801808:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80180c:	c9                   	leaveq 
  80180d:	c3                   	retq   

000000000080180e <memcpy>:
  80180e:	55                   	push   %rbp
  80180f:	48 89 e5             	mov    %rsp,%rbp
  801812:	48 83 ec 18          	sub    $0x18,%rsp
  801816:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80181a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80181e:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801822:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801826:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  80182a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80182e:	48 89 ce             	mov    %rcx,%rsi
  801831:	48 89 c7             	mov    %rax,%rdi
  801834:	48 b8 f7 16 80 00 00 	movabs $0x8016f7,%rax
  80183b:	00 00 00 
  80183e:	ff d0                	callq  *%rax
  801840:	c9                   	leaveq 
  801841:	c3                   	retq   

0000000000801842 <memcmp>:
  801842:	55                   	push   %rbp
  801843:	48 89 e5             	mov    %rsp,%rbp
  801846:	48 83 ec 28          	sub    $0x28,%rsp
  80184a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80184e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801852:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801856:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80185a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80185e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801862:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801866:	eb 36                	jmp    80189e <memcmp+0x5c>
  801868:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80186c:	0f b6 10             	movzbl (%rax),%edx
  80186f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801873:	0f b6 00             	movzbl (%rax),%eax
  801876:	38 c2                	cmp    %al,%dl
  801878:	74 1a                	je     801894 <memcmp+0x52>
  80187a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80187e:	0f b6 00             	movzbl (%rax),%eax
  801881:	0f b6 d0             	movzbl %al,%edx
  801884:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801888:	0f b6 00             	movzbl (%rax),%eax
  80188b:	0f b6 c0             	movzbl %al,%eax
  80188e:	29 c2                	sub    %eax,%edx
  801890:	89 d0                	mov    %edx,%eax
  801892:	eb 20                	jmp    8018b4 <memcmp+0x72>
  801894:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801899:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  80189e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018a2:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8018a6:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8018aa:	48 85 c0             	test   %rax,%rax
  8018ad:	75 b9                	jne    801868 <memcmp+0x26>
  8018af:	b8 00 00 00 00       	mov    $0x0,%eax
  8018b4:	c9                   	leaveq 
  8018b5:	c3                   	retq   

00000000008018b6 <memfind>:
  8018b6:	55                   	push   %rbp
  8018b7:	48 89 e5             	mov    %rsp,%rbp
  8018ba:	48 83 ec 28          	sub    $0x28,%rsp
  8018be:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8018c2:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8018c5:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8018c9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018cd:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8018d1:	48 01 d0             	add    %rdx,%rax
  8018d4:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8018d8:	eb 15                	jmp    8018ef <memfind+0x39>
  8018da:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8018de:	0f b6 10             	movzbl (%rax),%edx
  8018e1:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8018e4:	38 c2                	cmp    %al,%dl
  8018e6:	75 02                	jne    8018ea <memfind+0x34>
  8018e8:	eb 0f                	jmp    8018f9 <memfind+0x43>
  8018ea:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8018ef:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8018f3:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  8018f7:	72 e1                	jb     8018da <memfind+0x24>
  8018f9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8018fd:	c9                   	leaveq 
  8018fe:	c3                   	retq   

00000000008018ff <strtol>:
  8018ff:	55                   	push   %rbp
  801900:	48 89 e5             	mov    %rsp,%rbp
  801903:	48 83 ec 34          	sub    $0x34,%rsp
  801907:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80190b:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80190f:	89 55 cc             	mov    %edx,-0x34(%rbp)
  801912:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801919:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  801920:	00 
  801921:	eb 05                	jmp    801928 <strtol+0x29>
  801923:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801928:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80192c:	0f b6 00             	movzbl (%rax),%eax
  80192f:	3c 20                	cmp    $0x20,%al
  801931:	74 f0                	je     801923 <strtol+0x24>
  801933:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801937:	0f b6 00             	movzbl (%rax),%eax
  80193a:	3c 09                	cmp    $0x9,%al
  80193c:	74 e5                	je     801923 <strtol+0x24>
  80193e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801942:	0f b6 00             	movzbl (%rax),%eax
  801945:	3c 2b                	cmp    $0x2b,%al
  801947:	75 07                	jne    801950 <strtol+0x51>
  801949:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80194e:	eb 17                	jmp    801967 <strtol+0x68>
  801950:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801954:	0f b6 00             	movzbl (%rax),%eax
  801957:	3c 2d                	cmp    $0x2d,%al
  801959:	75 0c                	jne    801967 <strtol+0x68>
  80195b:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801960:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  801967:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  80196b:	74 06                	je     801973 <strtol+0x74>
  80196d:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  801971:	75 28                	jne    80199b <strtol+0x9c>
  801973:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801977:	0f b6 00             	movzbl (%rax),%eax
  80197a:	3c 30                	cmp    $0x30,%al
  80197c:	75 1d                	jne    80199b <strtol+0x9c>
  80197e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801982:	48 83 c0 01          	add    $0x1,%rax
  801986:	0f b6 00             	movzbl (%rax),%eax
  801989:	3c 78                	cmp    $0x78,%al
  80198b:	75 0e                	jne    80199b <strtol+0x9c>
  80198d:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  801992:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  801999:	eb 2c                	jmp    8019c7 <strtol+0xc8>
  80199b:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  80199f:	75 19                	jne    8019ba <strtol+0xbb>
  8019a1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019a5:	0f b6 00             	movzbl (%rax),%eax
  8019a8:	3c 30                	cmp    $0x30,%al
  8019aa:	75 0e                	jne    8019ba <strtol+0xbb>
  8019ac:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8019b1:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  8019b8:	eb 0d                	jmp    8019c7 <strtol+0xc8>
  8019ba:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8019be:	75 07                	jne    8019c7 <strtol+0xc8>
  8019c0:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  8019c7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019cb:	0f b6 00             	movzbl (%rax),%eax
  8019ce:	3c 2f                	cmp    $0x2f,%al
  8019d0:	7e 1d                	jle    8019ef <strtol+0xf0>
  8019d2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019d6:	0f b6 00             	movzbl (%rax),%eax
  8019d9:	3c 39                	cmp    $0x39,%al
  8019db:	7f 12                	jg     8019ef <strtol+0xf0>
  8019dd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019e1:	0f b6 00             	movzbl (%rax),%eax
  8019e4:	0f be c0             	movsbl %al,%eax
  8019e7:	83 e8 30             	sub    $0x30,%eax
  8019ea:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8019ed:	eb 4e                	jmp    801a3d <strtol+0x13e>
  8019ef:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019f3:	0f b6 00             	movzbl (%rax),%eax
  8019f6:	3c 60                	cmp    $0x60,%al
  8019f8:	7e 1d                	jle    801a17 <strtol+0x118>
  8019fa:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019fe:	0f b6 00             	movzbl (%rax),%eax
  801a01:	3c 7a                	cmp    $0x7a,%al
  801a03:	7f 12                	jg     801a17 <strtol+0x118>
  801a05:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a09:	0f b6 00             	movzbl (%rax),%eax
  801a0c:	0f be c0             	movsbl %al,%eax
  801a0f:	83 e8 57             	sub    $0x57,%eax
  801a12:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801a15:	eb 26                	jmp    801a3d <strtol+0x13e>
  801a17:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a1b:	0f b6 00             	movzbl (%rax),%eax
  801a1e:	3c 40                	cmp    $0x40,%al
  801a20:	7e 48                	jle    801a6a <strtol+0x16b>
  801a22:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a26:	0f b6 00             	movzbl (%rax),%eax
  801a29:	3c 5a                	cmp    $0x5a,%al
  801a2b:	7f 3d                	jg     801a6a <strtol+0x16b>
  801a2d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a31:	0f b6 00             	movzbl (%rax),%eax
  801a34:	0f be c0             	movsbl %al,%eax
  801a37:	83 e8 37             	sub    $0x37,%eax
  801a3a:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801a3d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801a40:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  801a43:	7c 02                	jl     801a47 <strtol+0x148>
  801a45:	eb 23                	jmp    801a6a <strtol+0x16b>
  801a47:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801a4c:	8b 45 cc             	mov    -0x34(%rbp),%eax
  801a4f:	48 98                	cltq   
  801a51:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  801a56:	48 89 c2             	mov    %rax,%rdx
  801a59:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801a5c:	48 98                	cltq   
  801a5e:	48 01 d0             	add    %rdx,%rax
  801a61:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801a65:	e9 5d ff ff ff       	jmpq   8019c7 <strtol+0xc8>
  801a6a:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  801a6f:	74 0b                	je     801a7c <strtol+0x17d>
  801a71:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801a75:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801a79:	48 89 10             	mov    %rdx,(%rax)
  801a7c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801a80:	74 09                	je     801a8b <strtol+0x18c>
  801a82:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801a86:	48 f7 d8             	neg    %rax
  801a89:	eb 04                	jmp    801a8f <strtol+0x190>
  801a8b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801a8f:	c9                   	leaveq 
  801a90:	c3                   	retq   

0000000000801a91 <strstr>:
  801a91:	55                   	push   %rbp
  801a92:	48 89 e5             	mov    %rsp,%rbp
  801a95:	48 83 ec 30          	sub    $0x30,%rsp
  801a99:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801a9d:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801aa1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801aa5:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801aa9:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801aad:	0f b6 00             	movzbl (%rax),%eax
  801ab0:	88 45 ff             	mov    %al,-0x1(%rbp)
  801ab3:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  801ab7:	75 06                	jne    801abf <strstr+0x2e>
  801ab9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801abd:	eb 6b                	jmp    801b2a <strstr+0x99>
  801abf:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801ac3:	48 89 c7             	mov    %rax,%rdi
  801ac6:	48 b8 67 13 80 00 00 	movabs $0x801367,%rax
  801acd:	00 00 00 
  801ad0:	ff d0                	callq  *%rax
  801ad2:	48 98                	cltq   
  801ad4:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801ad8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801adc:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801ae0:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801ae4:	0f b6 00             	movzbl (%rax),%eax
  801ae7:	88 45 ef             	mov    %al,-0x11(%rbp)
  801aea:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  801aee:	75 07                	jne    801af7 <strstr+0x66>
  801af0:	b8 00 00 00 00       	mov    $0x0,%eax
  801af5:	eb 33                	jmp    801b2a <strstr+0x99>
  801af7:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  801afb:	3a 45 ff             	cmp    -0x1(%rbp),%al
  801afe:	75 d8                	jne    801ad8 <strstr+0x47>
  801b00:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b04:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  801b08:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801b0c:	48 89 ce             	mov    %rcx,%rsi
  801b0f:	48 89 c7             	mov    %rax,%rdi
  801b12:	48 b8 88 15 80 00 00 	movabs $0x801588,%rax
  801b19:	00 00 00 
  801b1c:	ff d0                	callq  *%rax
  801b1e:	85 c0                	test   %eax,%eax
  801b20:	75 b6                	jne    801ad8 <strstr+0x47>
  801b22:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801b26:	48 83 e8 01          	sub    $0x1,%rax
  801b2a:	c9                   	leaveq 
  801b2b:	c3                   	retq   

0000000000801b2c <syscall>:
  801b2c:	55                   	push   %rbp
  801b2d:	48 89 e5             	mov    %rsp,%rbp
  801b30:	53                   	push   %rbx
  801b31:	48 83 ec 48          	sub    $0x48,%rsp
  801b35:	89 7d dc             	mov    %edi,-0x24(%rbp)
  801b38:	89 75 d8             	mov    %esi,-0x28(%rbp)
  801b3b:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801b3f:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  801b43:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  801b47:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  801b4b:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801b4e:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  801b52:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  801b56:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  801b5a:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  801b5e:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  801b62:	4c 89 c3             	mov    %r8,%rbx
  801b65:	cd 30                	int    $0x30
  801b67:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801b6b:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801b6f:	74 3e                	je     801baf <syscall+0x83>
  801b71:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801b76:	7e 37                	jle    801baf <syscall+0x83>
  801b78:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801b7c:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801b7f:	49 89 d0             	mov    %rdx,%r8
  801b82:	89 c1                	mov    %eax,%ecx
  801b84:	48 ba 28 53 80 00 00 	movabs $0x805328,%rdx
  801b8b:	00 00 00 
  801b8e:	be 24 00 00 00       	mov    $0x24,%esi
  801b93:	48 bf 45 53 80 00 00 	movabs $0x805345,%rdi
  801b9a:	00 00 00 
  801b9d:	b8 00 00 00 00       	mov    $0x0,%eax
  801ba2:	49 b9 e5 05 80 00 00 	movabs $0x8005e5,%r9
  801ba9:	00 00 00 
  801bac:	41 ff d1             	callq  *%r9
  801baf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801bb3:	48 83 c4 48          	add    $0x48,%rsp
  801bb7:	5b                   	pop    %rbx
  801bb8:	5d                   	pop    %rbp
  801bb9:	c3                   	retq   

0000000000801bba <sys_cputs>:
  801bba:	55                   	push   %rbp
  801bbb:	48 89 e5             	mov    %rsp,%rbp
  801bbe:	48 83 ec 20          	sub    $0x20,%rsp
  801bc2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801bc6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801bca:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801bce:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801bd2:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801bd9:	00 
  801bda:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801be0:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801be6:	48 89 d1             	mov    %rdx,%rcx
  801be9:	48 89 c2             	mov    %rax,%rdx
  801bec:	be 00 00 00 00       	mov    $0x0,%esi
  801bf1:	bf 00 00 00 00       	mov    $0x0,%edi
  801bf6:	48 b8 2c 1b 80 00 00 	movabs $0x801b2c,%rax
  801bfd:	00 00 00 
  801c00:	ff d0                	callq  *%rax
  801c02:	c9                   	leaveq 
  801c03:	c3                   	retq   

0000000000801c04 <sys_cgetc>:
  801c04:	55                   	push   %rbp
  801c05:	48 89 e5             	mov    %rsp,%rbp
  801c08:	48 83 ec 10          	sub    $0x10,%rsp
  801c0c:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c13:	00 
  801c14:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c1a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c20:	b9 00 00 00 00       	mov    $0x0,%ecx
  801c25:	ba 00 00 00 00       	mov    $0x0,%edx
  801c2a:	be 00 00 00 00       	mov    $0x0,%esi
  801c2f:	bf 01 00 00 00       	mov    $0x1,%edi
  801c34:	48 b8 2c 1b 80 00 00 	movabs $0x801b2c,%rax
  801c3b:	00 00 00 
  801c3e:	ff d0                	callq  *%rax
  801c40:	c9                   	leaveq 
  801c41:	c3                   	retq   

0000000000801c42 <sys_env_destroy>:
  801c42:	55                   	push   %rbp
  801c43:	48 89 e5             	mov    %rsp,%rbp
  801c46:	48 83 ec 10          	sub    $0x10,%rsp
  801c4a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801c4d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c50:	48 98                	cltq   
  801c52:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c59:	00 
  801c5a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c60:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c66:	b9 00 00 00 00       	mov    $0x0,%ecx
  801c6b:	48 89 c2             	mov    %rax,%rdx
  801c6e:	be 01 00 00 00       	mov    $0x1,%esi
  801c73:	bf 03 00 00 00       	mov    $0x3,%edi
  801c78:	48 b8 2c 1b 80 00 00 	movabs $0x801b2c,%rax
  801c7f:	00 00 00 
  801c82:	ff d0                	callq  *%rax
  801c84:	c9                   	leaveq 
  801c85:	c3                   	retq   

0000000000801c86 <sys_getenvid>:
  801c86:	55                   	push   %rbp
  801c87:	48 89 e5             	mov    %rsp,%rbp
  801c8a:	48 83 ec 10          	sub    $0x10,%rsp
  801c8e:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801c95:	00 
  801c96:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c9c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ca2:	b9 00 00 00 00       	mov    $0x0,%ecx
  801ca7:	ba 00 00 00 00       	mov    $0x0,%edx
  801cac:	be 00 00 00 00       	mov    $0x0,%esi
  801cb1:	bf 02 00 00 00       	mov    $0x2,%edi
  801cb6:	48 b8 2c 1b 80 00 00 	movabs $0x801b2c,%rax
  801cbd:	00 00 00 
  801cc0:	ff d0                	callq  *%rax
  801cc2:	c9                   	leaveq 
  801cc3:	c3                   	retq   

0000000000801cc4 <sys_yield>:
  801cc4:	55                   	push   %rbp
  801cc5:	48 89 e5             	mov    %rsp,%rbp
  801cc8:	48 83 ec 10          	sub    $0x10,%rsp
  801ccc:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801cd3:	00 
  801cd4:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801cda:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ce0:	b9 00 00 00 00       	mov    $0x0,%ecx
  801ce5:	ba 00 00 00 00       	mov    $0x0,%edx
  801cea:	be 00 00 00 00       	mov    $0x0,%esi
  801cef:	bf 0b 00 00 00       	mov    $0xb,%edi
  801cf4:	48 b8 2c 1b 80 00 00 	movabs $0x801b2c,%rax
  801cfb:	00 00 00 
  801cfe:	ff d0                	callq  *%rax
  801d00:	c9                   	leaveq 
  801d01:	c3                   	retq   

0000000000801d02 <sys_page_alloc>:
  801d02:	55                   	push   %rbp
  801d03:	48 89 e5             	mov    %rsp,%rbp
  801d06:	48 83 ec 20          	sub    $0x20,%rsp
  801d0a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801d0d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d11:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801d14:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801d17:	48 63 c8             	movslq %eax,%rcx
  801d1a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d1e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801d21:	48 98                	cltq   
  801d23:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801d2a:	00 
  801d2b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d31:	49 89 c8             	mov    %rcx,%r8
  801d34:	48 89 d1             	mov    %rdx,%rcx
  801d37:	48 89 c2             	mov    %rax,%rdx
  801d3a:	be 01 00 00 00       	mov    $0x1,%esi
  801d3f:	bf 04 00 00 00       	mov    $0x4,%edi
  801d44:	48 b8 2c 1b 80 00 00 	movabs $0x801b2c,%rax
  801d4b:	00 00 00 
  801d4e:	ff d0                	callq  *%rax
  801d50:	c9                   	leaveq 
  801d51:	c3                   	retq   

0000000000801d52 <sys_page_map>:
  801d52:	55                   	push   %rbp
  801d53:	48 89 e5             	mov    %rsp,%rbp
  801d56:	48 83 ec 30          	sub    $0x30,%rsp
  801d5a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801d5d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d61:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801d64:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801d68:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801d6c:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801d6f:	48 63 c8             	movslq %eax,%rcx
  801d72:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801d76:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801d79:	48 63 f0             	movslq %eax,%rsi
  801d7c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d80:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801d83:	48 98                	cltq   
  801d85:	48 89 0c 24          	mov    %rcx,(%rsp)
  801d89:	49 89 f9             	mov    %rdi,%r9
  801d8c:	49 89 f0             	mov    %rsi,%r8
  801d8f:	48 89 d1             	mov    %rdx,%rcx
  801d92:	48 89 c2             	mov    %rax,%rdx
  801d95:	be 01 00 00 00       	mov    $0x1,%esi
  801d9a:	bf 05 00 00 00       	mov    $0x5,%edi
  801d9f:	48 b8 2c 1b 80 00 00 	movabs $0x801b2c,%rax
  801da6:	00 00 00 
  801da9:	ff d0                	callq  *%rax
  801dab:	c9                   	leaveq 
  801dac:	c3                   	retq   

0000000000801dad <sys_page_unmap>:
  801dad:	55                   	push   %rbp
  801dae:	48 89 e5             	mov    %rsp,%rbp
  801db1:	48 83 ec 20          	sub    $0x20,%rsp
  801db5:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801db8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801dbc:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801dc0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801dc3:	48 98                	cltq   
  801dc5:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801dcc:	00 
  801dcd:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801dd3:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801dd9:	48 89 d1             	mov    %rdx,%rcx
  801ddc:	48 89 c2             	mov    %rax,%rdx
  801ddf:	be 01 00 00 00       	mov    $0x1,%esi
  801de4:	bf 06 00 00 00       	mov    $0x6,%edi
  801de9:	48 b8 2c 1b 80 00 00 	movabs $0x801b2c,%rax
  801df0:	00 00 00 
  801df3:	ff d0                	callq  *%rax
  801df5:	c9                   	leaveq 
  801df6:	c3                   	retq   

0000000000801df7 <sys_env_set_status>:
  801df7:	55                   	push   %rbp
  801df8:	48 89 e5             	mov    %rsp,%rbp
  801dfb:	48 83 ec 10          	sub    $0x10,%rsp
  801dff:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801e02:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801e05:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801e08:	48 63 d0             	movslq %eax,%rdx
  801e0b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e0e:	48 98                	cltq   
  801e10:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801e17:	00 
  801e18:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e1e:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e24:	48 89 d1             	mov    %rdx,%rcx
  801e27:	48 89 c2             	mov    %rax,%rdx
  801e2a:	be 01 00 00 00       	mov    $0x1,%esi
  801e2f:	bf 08 00 00 00       	mov    $0x8,%edi
  801e34:	48 b8 2c 1b 80 00 00 	movabs $0x801b2c,%rax
  801e3b:	00 00 00 
  801e3e:	ff d0                	callq  *%rax
  801e40:	c9                   	leaveq 
  801e41:	c3                   	retq   

0000000000801e42 <sys_env_set_trapframe>:
  801e42:	55                   	push   %rbp
  801e43:	48 89 e5             	mov    %rsp,%rbp
  801e46:	48 83 ec 20          	sub    $0x20,%rsp
  801e4a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801e4d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801e51:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801e55:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e58:	48 98                	cltq   
  801e5a:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801e61:	00 
  801e62:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e68:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e6e:	48 89 d1             	mov    %rdx,%rcx
  801e71:	48 89 c2             	mov    %rax,%rdx
  801e74:	be 01 00 00 00       	mov    $0x1,%esi
  801e79:	bf 09 00 00 00       	mov    $0x9,%edi
  801e7e:	48 b8 2c 1b 80 00 00 	movabs $0x801b2c,%rax
  801e85:	00 00 00 
  801e88:	ff d0                	callq  *%rax
  801e8a:	c9                   	leaveq 
  801e8b:	c3                   	retq   

0000000000801e8c <sys_env_set_pgfault_upcall>:
  801e8c:	55                   	push   %rbp
  801e8d:	48 89 e5             	mov    %rsp,%rbp
  801e90:	48 83 ec 20          	sub    $0x20,%rsp
  801e94:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801e97:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801e9b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801e9f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ea2:	48 98                	cltq   
  801ea4:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801eab:	00 
  801eac:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801eb2:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801eb8:	48 89 d1             	mov    %rdx,%rcx
  801ebb:	48 89 c2             	mov    %rax,%rdx
  801ebe:	be 01 00 00 00       	mov    $0x1,%esi
  801ec3:	bf 0a 00 00 00       	mov    $0xa,%edi
  801ec8:	48 b8 2c 1b 80 00 00 	movabs $0x801b2c,%rax
  801ecf:	00 00 00 
  801ed2:	ff d0                	callq  *%rax
  801ed4:	c9                   	leaveq 
  801ed5:	c3                   	retq   

0000000000801ed6 <sys_ipc_try_send>:
  801ed6:	55                   	push   %rbp
  801ed7:	48 89 e5             	mov    %rsp,%rbp
  801eda:	48 83 ec 20          	sub    $0x20,%rsp
  801ede:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801ee1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801ee5:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801ee9:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801eec:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801eef:	48 63 f0             	movslq %eax,%rsi
  801ef2:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801ef6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ef9:	48 98                	cltq   
  801efb:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801eff:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801f06:	00 
  801f07:	49 89 f1             	mov    %rsi,%r9
  801f0a:	49 89 c8             	mov    %rcx,%r8
  801f0d:	48 89 d1             	mov    %rdx,%rcx
  801f10:	48 89 c2             	mov    %rax,%rdx
  801f13:	be 00 00 00 00       	mov    $0x0,%esi
  801f18:	bf 0c 00 00 00       	mov    $0xc,%edi
  801f1d:	48 b8 2c 1b 80 00 00 	movabs $0x801b2c,%rax
  801f24:	00 00 00 
  801f27:	ff d0                	callq  *%rax
  801f29:	c9                   	leaveq 
  801f2a:	c3                   	retq   

0000000000801f2b <sys_ipc_recv>:
  801f2b:	55                   	push   %rbp
  801f2c:	48 89 e5             	mov    %rsp,%rbp
  801f2f:	48 83 ec 10          	sub    $0x10,%rsp
  801f33:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801f37:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801f3b:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801f42:	00 
  801f43:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801f49:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801f4f:	b9 00 00 00 00       	mov    $0x0,%ecx
  801f54:	48 89 c2             	mov    %rax,%rdx
  801f57:	be 01 00 00 00       	mov    $0x1,%esi
  801f5c:	bf 0d 00 00 00       	mov    $0xd,%edi
  801f61:	48 b8 2c 1b 80 00 00 	movabs $0x801b2c,%rax
  801f68:	00 00 00 
  801f6b:	ff d0                	callq  *%rax
  801f6d:	c9                   	leaveq 
  801f6e:	c3                   	retq   

0000000000801f6f <sys_time_msec>:
  801f6f:	55                   	push   %rbp
  801f70:	48 89 e5             	mov    %rsp,%rbp
  801f73:	48 83 ec 10          	sub    $0x10,%rsp
  801f77:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801f7e:	00 
  801f7f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801f85:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801f8b:	b9 00 00 00 00       	mov    $0x0,%ecx
  801f90:	ba 00 00 00 00       	mov    $0x0,%edx
  801f95:	be 00 00 00 00       	mov    $0x0,%esi
  801f9a:	bf 0e 00 00 00       	mov    $0xe,%edi
  801f9f:	48 b8 2c 1b 80 00 00 	movabs $0x801b2c,%rax
  801fa6:	00 00 00 
  801fa9:	ff d0                	callq  *%rax
  801fab:	c9                   	leaveq 
  801fac:	c3                   	retq   

0000000000801fad <sys_net_transmit>:
  801fad:	55                   	push   %rbp
  801fae:	48 89 e5             	mov    %rsp,%rbp
  801fb1:	48 83 ec 20          	sub    $0x20,%rsp
  801fb5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801fb9:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801fbc:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801fbf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801fc3:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  801fca:	00 
  801fcb:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801fd1:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801fd7:	48 89 d1             	mov    %rdx,%rcx
  801fda:	48 89 c2             	mov    %rax,%rdx
  801fdd:	be 00 00 00 00       	mov    $0x0,%esi
  801fe2:	bf 0f 00 00 00       	mov    $0xf,%edi
  801fe7:	48 b8 2c 1b 80 00 00 	movabs $0x801b2c,%rax
  801fee:	00 00 00 
  801ff1:	ff d0                	callq  *%rax
  801ff3:	c9                   	leaveq 
  801ff4:	c3                   	retq   

0000000000801ff5 <sys_net_receive>:
  801ff5:	55                   	push   %rbp
  801ff6:	48 89 e5             	mov    %rsp,%rbp
  801ff9:	48 83 ec 20          	sub    $0x20,%rsp
  801ffd:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802001:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802004:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802007:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80200b:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802012:	00 
  802013:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802019:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80201f:	48 89 d1             	mov    %rdx,%rcx
  802022:	48 89 c2             	mov    %rax,%rdx
  802025:	be 00 00 00 00       	mov    $0x0,%esi
  80202a:	bf 10 00 00 00       	mov    $0x10,%edi
  80202f:	48 b8 2c 1b 80 00 00 	movabs $0x801b2c,%rax
  802036:	00 00 00 
  802039:	ff d0                	callq  *%rax
  80203b:	c9                   	leaveq 
  80203c:	c3                   	retq   

000000000080203d <sys_ept_map>:
  80203d:	55                   	push   %rbp
  80203e:	48 89 e5             	mov    %rsp,%rbp
  802041:	48 83 ec 30          	sub    $0x30,%rsp
  802045:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802048:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80204c:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80204f:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  802053:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  802057:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80205a:	48 63 c8             	movslq %eax,%rcx
  80205d:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  802061:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802064:	48 63 f0             	movslq %eax,%rsi
  802067:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80206b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80206e:	48 98                	cltq   
  802070:	48 89 0c 24          	mov    %rcx,(%rsp)
  802074:	49 89 f9             	mov    %rdi,%r9
  802077:	49 89 f0             	mov    %rsi,%r8
  80207a:	48 89 d1             	mov    %rdx,%rcx
  80207d:	48 89 c2             	mov    %rax,%rdx
  802080:	be 00 00 00 00       	mov    $0x0,%esi
  802085:	bf 11 00 00 00       	mov    $0x11,%edi
  80208a:	48 b8 2c 1b 80 00 00 	movabs $0x801b2c,%rax
  802091:	00 00 00 
  802094:	ff d0                	callq  *%rax
  802096:	c9                   	leaveq 
  802097:	c3                   	retq   

0000000000802098 <sys_env_mkguest>:
  802098:	55                   	push   %rbp
  802099:	48 89 e5             	mov    %rsp,%rbp
  80209c:	48 83 ec 20          	sub    $0x20,%rsp
  8020a0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8020a4:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8020a8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8020ac:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8020b0:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8020b7:	00 
  8020b8:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8020be:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8020c4:	48 89 d1             	mov    %rdx,%rcx
  8020c7:	48 89 c2             	mov    %rax,%rdx
  8020ca:	be 00 00 00 00       	mov    $0x0,%esi
  8020cf:	bf 12 00 00 00       	mov    $0x12,%edi
  8020d4:	48 b8 2c 1b 80 00 00 	movabs $0x801b2c,%rax
  8020db:	00 00 00 
  8020de:	ff d0                	callq  *%rax
  8020e0:	c9                   	leaveq 
  8020e1:	c3                   	retq   

00000000008020e2 <sys_vmx_list_vms>:
  8020e2:	55                   	push   %rbp
  8020e3:	48 89 e5             	mov    %rsp,%rbp
  8020e6:	48 83 ec 10          	sub    $0x10,%rsp
  8020ea:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8020f1:	00 
  8020f2:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8020f8:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8020fe:	b9 00 00 00 00       	mov    $0x0,%ecx
  802103:	ba 00 00 00 00       	mov    $0x0,%edx
  802108:	be 00 00 00 00       	mov    $0x0,%esi
  80210d:	bf 13 00 00 00       	mov    $0x13,%edi
  802112:	48 b8 2c 1b 80 00 00 	movabs $0x801b2c,%rax
  802119:	00 00 00 
  80211c:	ff d0                	callq  *%rax
  80211e:	c9                   	leaveq 
  80211f:	c3                   	retq   

0000000000802120 <sys_vmx_sel_resume>:
  802120:	55                   	push   %rbp
  802121:	48 89 e5             	mov    %rsp,%rbp
  802124:	48 83 ec 10          	sub    $0x10,%rsp
  802128:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80212b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80212e:	48 98                	cltq   
  802130:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802137:	00 
  802138:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80213e:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802144:	b9 00 00 00 00       	mov    $0x0,%ecx
  802149:	48 89 c2             	mov    %rax,%rdx
  80214c:	be 00 00 00 00       	mov    $0x0,%esi
  802151:	bf 14 00 00 00       	mov    $0x14,%edi
  802156:	48 b8 2c 1b 80 00 00 	movabs $0x801b2c,%rax
  80215d:	00 00 00 
  802160:	ff d0                	callq  *%rax
  802162:	c9                   	leaveq 
  802163:	c3                   	retq   

0000000000802164 <sys_vmx_get_vmdisk_number>:
  802164:	55                   	push   %rbp
  802165:	48 89 e5             	mov    %rsp,%rbp
  802168:	48 83 ec 10          	sub    $0x10,%rsp
  80216c:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  802173:	00 
  802174:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80217a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802180:	b9 00 00 00 00       	mov    $0x0,%ecx
  802185:	ba 00 00 00 00       	mov    $0x0,%edx
  80218a:	be 00 00 00 00       	mov    $0x0,%esi
  80218f:	bf 15 00 00 00       	mov    $0x15,%edi
  802194:	48 b8 2c 1b 80 00 00 	movabs $0x801b2c,%rax
  80219b:	00 00 00 
  80219e:	ff d0                	callq  *%rax
  8021a0:	c9                   	leaveq 
  8021a1:	c3                   	retq   

00000000008021a2 <sys_vmx_incr_vmdisk_number>:
  8021a2:	55                   	push   %rbp
  8021a3:	48 89 e5             	mov    %rsp,%rbp
  8021a6:	48 83 ec 10          	sub    $0x10,%rsp
  8021aa:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  8021b1:	00 
  8021b2:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8021b8:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8021be:	b9 00 00 00 00       	mov    $0x0,%ecx
  8021c3:	ba 00 00 00 00       	mov    $0x0,%edx
  8021c8:	be 00 00 00 00       	mov    $0x0,%esi
  8021cd:	bf 16 00 00 00       	mov    $0x16,%edi
  8021d2:	48 b8 2c 1b 80 00 00 	movabs $0x801b2c,%rax
  8021d9:	00 00 00 
  8021dc:	ff d0                	callq  *%rax
  8021de:	c9                   	leaveq 
  8021df:	c3                   	retq   

00000000008021e0 <pgfault>:
  8021e0:	55                   	push   %rbp
  8021e1:	48 89 e5             	mov    %rsp,%rbp
  8021e4:	48 83 ec 30          	sub    $0x30,%rsp
  8021e8:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8021ec:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8021f0:	48 8b 00             	mov    (%rax),%rax
  8021f3:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8021f7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8021fb:	48 8b 40 08          	mov    0x8(%rax),%rax
  8021ff:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802202:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802205:	83 e0 02             	and    $0x2,%eax
  802208:	85 c0                	test   %eax,%eax
  80220a:	75 40                	jne    80224c <pgfault+0x6c>
  80220c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802210:	48 8b 90 88 00 00 00 	mov    0x88(%rax),%rdx
  802217:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80221b:	49 89 d0             	mov    %rdx,%r8
  80221e:	48 89 c1             	mov    %rax,%rcx
  802221:	48 ba 58 53 80 00 00 	movabs $0x805358,%rdx
  802228:	00 00 00 
  80222b:	be 1f 00 00 00       	mov    $0x1f,%esi
  802230:	48 bf 71 53 80 00 00 	movabs $0x805371,%rdi
  802237:	00 00 00 
  80223a:	b8 00 00 00 00       	mov    $0x0,%eax
  80223f:	49 b9 e5 05 80 00 00 	movabs $0x8005e5,%r9
  802246:	00 00 00 
  802249:	41 ff d1             	callq  *%r9
  80224c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802250:	48 c1 e8 0c          	shr    $0xc,%rax
  802254:	48 89 c2             	mov    %rax,%rdx
  802257:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80225e:	01 00 00 
  802261:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802265:	25 07 08 00 00       	and    $0x807,%eax
  80226a:	48 3d 05 08 00 00    	cmp    $0x805,%rax
  802270:	74 4e                	je     8022c0 <pgfault+0xe0>
  802272:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802276:	48 c1 e8 0c          	shr    $0xc,%rax
  80227a:	48 89 c2             	mov    %rax,%rdx
  80227d:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802284:	01 00 00 
  802287:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  80228b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80228f:	49 89 d0             	mov    %rdx,%r8
  802292:	48 89 c1             	mov    %rax,%rcx
  802295:	48 ba 80 53 80 00 00 	movabs $0x805380,%rdx
  80229c:	00 00 00 
  80229f:	be 22 00 00 00       	mov    $0x22,%esi
  8022a4:	48 bf 71 53 80 00 00 	movabs $0x805371,%rdi
  8022ab:	00 00 00 
  8022ae:	b8 00 00 00 00       	mov    $0x0,%eax
  8022b3:	49 b9 e5 05 80 00 00 	movabs $0x8005e5,%r9
  8022ba:	00 00 00 
  8022bd:	41 ff d1             	callq  *%r9
  8022c0:	ba 07 00 00 00       	mov    $0x7,%edx
  8022c5:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  8022ca:	bf 00 00 00 00       	mov    $0x0,%edi
  8022cf:	48 b8 02 1d 80 00 00 	movabs $0x801d02,%rax
  8022d6:	00 00 00 
  8022d9:	ff d0                	callq  *%rax
  8022db:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8022de:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8022e2:	79 30                	jns    802314 <pgfault+0x134>
  8022e4:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8022e7:	89 c1                	mov    %eax,%ecx
  8022e9:	48 ba ab 53 80 00 00 	movabs $0x8053ab,%rdx
  8022f0:	00 00 00 
  8022f3:	be 30 00 00 00       	mov    $0x30,%esi
  8022f8:	48 bf 71 53 80 00 00 	movabs $0x805371,%rdi
  8022ff:	00 00 00 
  802302:	b8 00 00 00 00       	mov    $0x0,%eax
  802307:	49 b8 e5 05 80 00 00 	movabs $0x8005e5,%r8
  80230e:	00 00 00 
  802311:	41 ff d0             	callq  *%r8
  802314:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802318:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80231c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802320:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  802326:	ba 00 10 00 00       	mov    $0x1000,%edx
  80232b:	48 89 c6             	mov    %rax,%rsi
  80232e:	bf 00 f0 5f 00       	mov    $0x5ff000,%edi
  802333:	48 b8 f7 16 80 00 00 	movabs $0x8016f7,%rax
  80233a:	00 00 00 
  80233d:	ff d0                	callq  *%rax
  80233f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802343:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802347:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80234b:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  802351:	41 b8 07 00 00 00    	mov    $0x7,%r8d
  802357:	48 89 c1             	mov    %rax,%rcx
  80235a:	ba 00 00 00 00       	mov    $0x0,%edx
  80235f:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  802364:	bf 00 00 00 00       	mov    $0x0,%edi
  802369:	48 b8 52 1d 80 00 00 	movabs $0x801d52,%rax
  802370:	00 00 00 
  802373:	ff d0                	callq  *%rax
  802375:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802378:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80237c:	79 30                	jns    8023ae <pgfault+0x1ce>
  80237e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802381:	89 c1                	mov    %eax,%ecx
  802383:	48 ba be 53 80 00 00 	movabs $0x8053be,%rdx
  80238a:	00 00 00 
  80238d:	be 35 00 00 00       	mov    $0x35,%esi
  802392:	48 bf 71 53 80 00 00 	movabs $0x805371,%rdi
  802399:	00 00 00 
  80239c:	b8 00 00 00 00       	mov    $0x0,%eax
  8023a1:	49 b8 e5 05 80 00 00 	movabs $0x8005e5,%r8
  8023a8:	00 00 00 
  8023ab:	41 ff d0             	callq  *%r8
  8023ae:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  8023b3:	bf 00 00 00 00       	mov    $0x0,%edi
  8023b8:	48 b8 ad 1d 80 00 00 	movabs $0x801dad,%rax
  8023bf:	00 00 00 
  8023c2:	ff d0                	callq  *%rax
  8023c4:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8023c7:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8023cb:	79 30                	jns    8023fd <pgfault+0x21d>
  8023cd:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8023d0:	89 c1                	mov    %eax,%ecx
  8023d2:	48 ba cf 53 80 00 00 	movabs $0x8053cf,%rdx
  8023d9:	00 00 00 
  8023dc:	be 39 00 00 00       	mov    $0x39,%esi
  8023e1:	48 bf 71 53 80 00 00 	movabs $0x805371,%rdi
  8023e8:	00 00 00 
  8023eb:	b8 00 00 00 00       	mov    $0x0,%eax
  8023f0:	49 b8 e5 05 80 00 00 	movabs $0x8005e5,%r8
  8023f7:	00 00 00 
  8023fa:	41 ff d0             	callq  *%r8
  8023fd:	c9                   	leaveq 
  8023fe:	c3                   	retq   

00000000008023ff <duppage>:
  8023ff:	55                   	push   %rbp
  802400:	48 89 e5             	mov    %rsp,%rbp
  802403:	48 83 ec 30          	sub    $0x30,%rsp
  802407:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80240a:	89 75 d8             	mov    %esi,-0x28(%rbp)
  80240d:	8b 45 d8             	mov    -0x28(%rbp),%eax
  802410:	c1 e0 0c             	shl    $0xc,%eax
  802413:	89 c0                	mov    %eax,%eax
  802415:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802419:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802420:	01 00 00 
  802423:	8b 55 d8             	mov    -0x28(%rbp),%edx
  802426:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80242a:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80242e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802432:	25 02 08 00 00       	and    $0x802,%eax
  802437:	48 85 c0             	test   %rax,%rax
  80243a:	74 0e                	je     80244a <duppage+0x4b>
  80243c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802440:	25 00 04 00 00       	and    $0x400,%eax
  802445:	48 85 c0             	test   %rax,%rax
  802448:	74 70                	je     8024ba <duppage+0xbb>
  80244a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80244e:	25 07 0e 00 00       	and    $0xe07,%eax
  802453:	89 c6                	mov    %eax,%esi
  802455:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  802459:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80245c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802460:	41 89 f0             	mov    %esi,%r8d
  802463:	48 89 c6             	mov    %rax,%rsi
  802466:	bf 00 00 00 00       	mov    $0x0,%edi
  80246b:	48 b8 52 1d 80 00 00 	movabs $0x801d52,%rax
  802472:	00 00 00 
  802475:	ff d0                	callq  *%rax
  802477:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80247a:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80247e:	79 30                	jns    8024b0 <duppage+0xb1>
  802480:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802483:	89 c1                	mov    %eax,%ecx
  802485:	48 ba be 53 80 00 00 	movabs $0x8053be,%rdx
  80248c:	00 00 00 
  80248f:	be 63 00 00 00       	mov    $0x63,%esi
  802494:	48 bf 71 53 80 00 00 	movabs $0x805371,%rdi
  80249b:	00 00 00 
  80249e:	b8 00 00 00 00       	mov    $0x0,%eax
  8024a3:	49 b8 e5 05 80 00 00 	movabs $0x8005e5,%r8
  8024aa:	00 00 00 
  8024ad:	41 ff d0             	callq  *%r8
  8024b0:	b8 00 00 00 00       	mov    $0x0,%eax
  8024b5:	e9 c4 00 00 00       	jmpq   80257e <duppage+0x17f>
  8024ba:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  8024be:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8024c1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8024c5:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  8024cb:	48 89 c6             	mov    %rax,%rsi
  8024ce:	bf 00 00 00 00       	mov    $0x0,%edi
  8024d3:	48 b8 52 1d 80 00 00 	movabs $0x801d52,%rax
  8024da:	00 00 00 
  8024dd:	ff d0                	callq  *%rax
  8024df:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8024e2:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8024e6:	79 30                	jns    802518 <duppage+0x119>
  8024e8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8024eb:	89 c1                	mov    %eax,%ecx
  8024ed:	48 ba be 53 80 00 00 	movabs $0x8053be,%rdx
  8024f4:	00 00 00 
  8024f7:	be 7e 00 00 00       	mov    $0x7e,%esi
  8024fc:	48 bf 71 53 80 00 00 	movabs $0x805371,%rdi
  802503:	00 00 00 
  802506:	b8 00 00 00 00       	mov    $0x0,%eax
  80250b:	49 b8 e5 05 80 00 00 	movabs $0x8005e5,%r8
  802512:	00 00 00 
  802515:	41 ff d0             	callq  *%r8
  802518:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80251c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802520:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  802526:	48 89 d1             	mov    %rdx,%rcx
  802529:	ba 00 00 00 00       	mov    $0x0,%edx
  80252e:	48 89 c6             	mov    %rax,%rsi
  802531:	bf 00 00 00 00       	mov    $0x0,%edi
  802536:	48 b8 52 1d 80 00 00 	movabs $0x801d52,%rax
  80253d:	00 00 00 
  802540:	ff d0                	callq  *%rax
  802542:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802545:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802549:	79 30                	jns    80257b <duppage+0x17c>
  80254b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80254e:	89 c1                	mov    %eax,%ecx
  802550:	48 ba be 53 80 00 00 	movabs $0x8053be,%rdx
  802557:	00 00 00 
  80255a:	be 80 00 00 00       	mov    $0x80,%esi
  80255f:	48 bf 71 53 80 00 00 	movabs $0x805371,%rdi
  802566:	00 00 00 
  802569:	b8 00 00 00 00       	mov    $0x0,%eax
  80256e:	49 b8 e5 05 80 00 00 	movabs $0x8005e5,%r8
  802575:	00 00 00 
  802578:	41 ff d0             	callq  *%r8
  80257b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80257e:	c9                   	leaveq 
  80257f:	c3                   	retq   

0000000000802580 <fork>:
  802580:	55                   	push   %rbp
  802581:	48 89 e5             	mov    %rsp,%rbp
  802584:	48 83 ec 20          	sub    $0x20,%rsp
  802588:	48 bf e0 21 80 00 00 	movabs $0x8021e0,%rdi
  80258f:	00 00 00 
  802592:	48 b8 3d 49 80 00 00 	movabs $0x80493d,%rax
  802599:	00 00 00 
  80259c:	ff d0                	callq  *%rax
  80259e:	b8 07 00 00 00       	mov    $0x7,%eax
  8025a3:	cd 30                	int    $0x30
  8025a5:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8025a8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8025ab:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8025ae:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8025b2:	79 08                	jns    8025bc <fork+0x3c>
  8025b4:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8025b7:	e9 09 02 00 00       	jmpq   8027c5 <fork+0x245>
  8025bc:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8025c0:	75 3e                	jne    802600 <fork+0x80>
  8025c2:	48 b8 86 1c 80 00 00 	movabs $0x801c86,%rax
  8025c9:	00 00 00 
  8025cc:	ff d0                	callq  *%rax
  8025ce:	25 ff 03 00 00       	and    $0x3ff,%eax
  8025d3:	48 98                	cltq   
  8025d5:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8025dc:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8025e3:	00 00 00 
  8025e6:	48 01 c2             	add    %rax,%rdx
  8025e9:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8025f0:	00 00 00 
  8025f3:	48 89 10             	mov    %rdx,(%rax)
  8025f6:	b8 00 00 00 00       	mov    $0x0,%eax
  8025fb:	e9 c5 01 00 00       	jmpq   8027c5 <fork+0x245>
  802600:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802607:	e9 a4 00 00 00       	jmpq   8026b0 <fork+0x130>
  80260c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80260f:	c1 f8 12             	sar    $0x12,%eax
  802612:	89 c2                	mov    %eax,%edx
  802614:	48 b8 00 00 40 80 00 	movabs $0x10080400000,%rax
  80261b:	01 00 00 
  80261e:	48 63 d2             	movslq %edx,%rdx
  802621:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802625:	83 e0 01             	and    $0x1,%eax
  802628:	48 85 c0             	test   %rax,%rax
  80262b:	74 21                	je     80264e <fork+0xce>
  80262d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802630:	c1 f8 09             	sar    $0x9,%eax
  802633:	89 c2                	mov    %eax,%edx
  802635:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  80263c:	01 00 00 
  80263f:	48 63 d2             	movslq %edx,%rdx
  802642:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802646:	83 e0 01             	and    $0x1,%eax
  802649:	48 85 c0             	test   %rax,%rax
  80264c:	75 09                	jne    802657 <fork+0xd7>
  80264e:	81 45 fc 00 02 00 00 	addl   $0x200,-0x4(%rbp)
  802655:	eb 59                	jmp    8026b0 <fork+0x130>
  802657:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80265a:	05 00 02 00 00       	add    $0x200,%eax
  80265f:	89 45 f4             	mov    %eax,-0xc(%rbp)
  802662:	eb 44                	jmp    8026a8 <fork+0x128>
  802664:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80266b:	01 00 00 
  80266e:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802671:	48 63 d2             	movslq %edx,%rdx
  802674:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802678:	83 e0 05             	and    $0x5,%eax
  80267b:	48 83 f8 05          	cmp    $0x5,%rax
  80267f:	74 02                	je     802683 <fork+0x103>
  802681:	eb 21                	jmp    8026a4 <fork+0x124>
  802683:	81 7d fc ff f7 0e 00 	cmpl   $0xef7ff,-0x4(%rbp)
  80268a:	75 02                	jne    80268e <fork+0x10e>
  80268c:	eb 16                	jmp    8026a4 <fork+0x124>
  80268e:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802691:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802694:	89 d6                	mov    %edx,%esi
  802696:	89 c7                	mov    %eax,%edi
  802698:	48 b8 ff 23 80 00 00 	movabs $0x8023ff,%rax
  80269f:	00 00 00 
  8026a2:	ff d0                	callq  *%rax
  8026a4:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8026a8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8026ab:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  8026ae:	7c b4                	jl     802664 <fork+0xe4>
  8026b0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8026b3:	3d ff 07 00 08       	cmp    $0x80007ff,%eax
  8026b8:	0f 86 4e ff ff ff    	jbe    80260c <fork+0x8c>
  8026be:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8026c1:	ba 07 00 00 00       	mov    $0x7,%edx
  8026c6:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  8026cb:	89 c7                	mov    %eax,%edi
  8026cd:	48 b8 02 1d 80 00 00 	movabs $0x801d02,%rax
  8026d4:	00 00 00 
  8026d7:	ff d0                	callq  *%rax
  8026d9:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8026dc:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8026e0:	79 30                	jns    802712 <fork+0x192>
  8026e2:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8026e5:	89 c1                	mov    %eax,%ecx
  8026e7:	48 ba e8 53 80 00 00 	movabs $0x8053e8,%rdx
  8026ee:	00 00 00 
  8026f1:	be bc 00 00 00       	mov    $0xbc,%esi
  8026f6:	48 bf 71 53 80 00 00 	movabs $0x805371,%rdi
  8026fd:	00 00 00 
  802700:	b8 00 00 00 00       	mov    $0x0,%eax
  802705:	49 b8 e5 05 80 00 00 	movabs $0x8005e5,%r8
  80270c:	00 00 00 
  80270f:	41 ff d0             	callq  *%r8
  802712:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802719:	00 00 00 
  80271c:	48 8b 00             	mov    (%rax),%rax
  80271f:	48 8b 90 f0 00 00 00 	mov    0xf0(%rax),%rdx
  802726:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802729:	48 89 d6             	mov    %rdx,%rsi
  80272c:	89 c7                	mov    %eax,%edi
  80272e:	48 b8 8c 1e 80 00 00 	movabs $0x801e8c,%rax
  802735:	00 00 00 
  802738:	ff d0                	callq  *%rax
  80273a:	89 45 f0             	mov    %eax,-0x10(%rbp)
  80273d:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802741:	79 30                	jns    802773 <fork+0x1f3>
  802743:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802746:	89 c1                	mov    %eax,%ecx
  802748:	48 ba 08 54 80 00 00 	movabs $0x805408,%rdx
  80274f:	00 00 00 
  802752:	be c0 00 00 00       	mov    $0xc0,%esi
  802757:	48 bf 71 53 80 00 00 	movabs $0x805371,%rdi
  80275e:	00 00 00 
  802761:	b8 00 00 00 00       	mov    $0x0,%eax
  802766:	49 b8 e5 05 80 00 00 	movabs $0x8005e5,%r8
  80276d:	00 00 00 
  802770:	41 ff d0             	callq  *%r8
  802773:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802776:	be 02 00 00 00       	mov    $0x2,%esi
  80277b:	89 c7                	mov    %eax,%edi
  80277d:	48 b8 f7 1d 80 00 00 	movabs $0x801df7,%rax
  802784:	00 00 00 
  802787:	ff d0                	callq  *%rax
  802789:	89 45 f0             	mov    %eax,-0x10(%rbp)
  80278c:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802790:	79 30                	jns    8027c2 <fork+0x242>
  802792:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802795:	89 c1                	mov    %eax,%ecx
  802797:	48 ba 27 54 80 00 00 	movabs $0x805427,%rdx
  80279e:	00 00 00 
  8027a1:	be c5 00 00 00       	mov    $0xc5,%esi
  8027a6:	48 bf 71 53 80 00 00 	movabs $0x805371,%rdi
  8027ad:	00 00 00 
  8027b0:	b8 00 00 00 00       	mov    $0x0,%eax
  8027b5:	49 b8 e5 05 80 00 00 	movabs $0x8005e5,%r8
  8027bc:	00 00 00 
  8027bf:	41 ff d0             	callq  *%r8
  8027c2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8027c5:	c9                   	leaveq 
  8027c6:	c3                   	retq   

00000000008027c7 <sfork>:
  8027c7:	55                   	push   %rbp
  8027c8:	48 89 e5             	mov    %rsp,%rbp
  8027cb:	48 ba 3e 54 80 00 00 	movabs $0x80543e,%rdx
  8027d2:	00 00 00 
  8027d5:	be d2 00 00 00       	mov    $0xd2,%esi
  8027da:	48 bf 71 53 80 00 00 	movabs $0x805371,%rdi
  8027e1:	00 00 00 
  8027e4:	b8 00 00 00 00       	mov    $0x0,%eax
  8027e9:	48 b9 e5 05 80 00 00 	movabs $0x8005e5,%rcx
  8027f0:	00 00 00 
  8027f3:	ff d1                	callq  *%rcx

00000000008027f5 <fd2num>:
  8027f5:	55                   	push   %rbp
  8027f6:	48 89 e5             	mov    %rsp,%rbp
  8027f9:	48 83 ec 08          	sub    $0x8,%rsp
  8027fd:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802801:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802805:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  80280c:	ff ff ff 
  80280f:	48 01 d0             	add    %rdx,%rax
  802812:	48 c1 e8 0c          	shr    $0xc,%rax
  802816:	c9                   	leaveq 
  802817:	c3                   	retq   

0000000000802818 <fd2data>:
  802818:	55                   	push   %rbp
  802819:	48 89 e5             	mov    %rsp,%rbp
  80281c:	48 83 ec 08          	sub    $0x8,%rsp
  802820:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802824:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802828:	48 89 c7             	mov    %rax,%rdi
  80282b:	48 b8 f5 27 80 00 00 	movabs $0x8027f5,%rax
  802832:	00 00 00 
  802835:	ff d0                	callq  *%rax
  802837:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  80283d:	48 c1 e0 0c          	shl    $0xc,%rax
  802841:	c9                   	leaveq 
  802842:	c3                   	retq   

0000000000802843 <fd_alloc>:
  802843:	55                   	push   %rbp
  802844:	48 89 e5             	mov    %rsp,%rbp
  802847:	48 83 ec 18          	sub    $0x18,%rsp
  80284b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80284f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802856:	eb 6b                	jmp    8028c3 <fd_alloc+0x80>
  802858:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80285b:	48 98                	cltq   
  80285d:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802863:	48 c1 e0 0c          	shl    $0xc,%rax
  802867:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80286b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80286f:	48 c1 e8 15          	shr    $0x15,%rax
  802873:	48 89 c2             	mov    %rax,%rdx
  802876:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  80287d:	01 00 00 
  802880:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802884:	83 e0 01             	and    $0x1,%eax
  802887:	48 85 c0             	test   %rax,%rax
  80288a:	74 21                	je     8028ad <fd_alloc+0x6a>
  80288c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802890:	48 c1 e8 0c          	shr    $0xc,%rax
  802894:	48 89 c2             	mov    %rax,%rdx
  802897:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80289e:	01 00 00 
  8028a1:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8028a5:	83 e0 01             	and    $0x1,%eax
  8028a8:	48 85 c0             	test   %rax,%rax
  8028ab:	75 12                	jne    8028bf <fd_alloc+0x7c>
  8028ad:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8028b1:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8028b5:	48 89 10             	mov    %rdx,(%rax)
  8028b8:	b8 00 00 00 00       	mov    $0x0,%eax
  8028bd:	eb 1a                	jmp    8028d9 <fd_alloc+0x96>
  8028bf:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8028c3:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  8028c7:	7e 8f                	jle    802858 <fd_alloc+0x15>
  8028c9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8028cd:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  8028d4:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  8028d9:	c9                   	leaveq 
  8028da:	c3                   	retq   

00000000008028db <fd_lookup>:
  8028db:	55                   	push   %rbp
  8028dc:	48 89 e5             	mov    %rsp,%rbp
  8028df:	48 83 ec 20          	sub    $0x20,%rsp
  8028e3:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8028e6:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8028ea:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8028ee:	78 06                	js     8028f6 <fd_lookup+0x1b>
  8028f0:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  8028f4:	7e 07                	jle    8028fd <fd_lookup+0x22>
  8028f6:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8028fb:	eb 6c                	jmp    802969 <fd_lookup+0x8e>
  8028fd:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802900:	48 98                	cltq   
  802902:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802908:	48 c1 e0 0c          	shl    $0xc,%rax
  80290c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802910:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802914:	48 c1 e8 15          	shr    $0x15,%rax
  802918:	48 89 c2             	mov    %rax,%rdx
  80291b:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802922:	01 00 00 
  802925:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802929:	83 e0 01             	and    $0x1,%eax
  80292c:	48 85 c0             	test   %rax,%rax
  80292f:	74 21                	je     802952 <fd_lookup+0x77>
  802931:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802935:	48 c1 e8 0c          	shr    $0xc,%rax
  802939:	48 89 c2             	mov    %rax,%rdx
  80293c:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802943:	01 00 00 
  802946:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80294a:	83 e0 01             	and    $0x1,%eax
  80294d:	48 85 c0             	test   %rax,%rax
  802950:	75 07                	jne    802959 <fd_lookup+0x7e>
  802952:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802957:	eb 10                	jmp    802969 <fd_lookup+0x8e>
  802959:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80295d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802961:	48 89 10             	mov    %rdx,(%rax)
  802964:	b8 00 00 00 00       	mov    $0x0,%eax
  802969:	c9                   	leaveq 
  80296a:	c3                   	retq   

000000000080296b <fd_close>:
  80296b:	55                   	push   %rbp
  80296c:	48 89 e5             	mov    %rsp,%rbp
  80296f:	48 83 ec 30          	sub    $0x30,%rsp
  802973:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802977:	89 f0                	mov    %esi,%eax
  802979:	88 45 d4             	mov    %al,-0x2c(%rbp)
  80297c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802980:	48 89 c7             	mov    %rax,%rdi
  802983:	48 b8 f5 27 80 00 00 	movabs $0x8027f5,%rax
  80298a:	00 00 00 
  80298d:	ff d0                	callq  *%rax
  80298f:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802993:	48 89 d6             	mov    %rdx,%rsi
  802996:	89 c7                	mov    %eax,%edi
  802998:	48 b8 db 28 80 00 00 	movabs $0x8028db,%rax
  80299f:	00 00 00 
  8029a2:	ff d0                	callq  *%rax
  8029a4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8029a7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8029ab:	78 0a                	js     8029b7 <fd_close+0x4c>
  8029ad:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8029b1:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  8029b5:	74 12                	je     8029c9 <fd_close+0x5e>
  8029b7:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  8029bb:	74 05                	je     8029c2 <fd_close+0x57>
  8029bd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029c0:	eb 05                	jmp    8029c7 <fd_close+0x5c>
  8029c2:	b8 00 00 00 00       	mov    $0x0,%eax
  8029c7:	eb 69                	jmp    802a32 <fd_close+0xc7>
  8029c9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8029cd:	8b 00                	mov    (%rax),%eax
  8029cf:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8029d3:	48 89 d6             	mov    %rdx,%rsi
  8029d6:	89 c7                	mov    %eax,%edi
  8029d8:	48 b8 34 2a 80 00 00 	movabs $0x802a34,%rax
  8029df:	00 00 00 
  8029e2:	ff d0                	callq  *%rax
  8029e4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8029e7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8029eb:	78 2a                	js     802a17 <fd_close+0xac>
  8029ed:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8029f1:	48 8b 40 20          	mov    0x20(%rax),%rax
  8029f5:	48 85 c0             	test   %rax,%rax
  8029f8:	74 16                	je     802a10 <fd_close+0xa5>
  8029fa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8029fe:	48 8b 40 20          	mov    0x20(%rax),%rax
  802a02:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802a06:	48 89 d7             	mov    %rdx,%rdi
  802a09:	ff d0                	callq  *%rax
  802a0b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802a0e:	eb 07                	jmp    802a17 <fd_close+0xac>
  802a10:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802a17:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802a1b:	48 89 c6             	mov    %rax,%rsi
  802a1e:	bf 00 00 00 00       	mov    $0x0,%edi
  802a23:	48 b8 ad 1d 80 00 00 	movabs $0x801dad,%rax
  802a2a:	00 00 00 
  802a2d:	ff d0                	callq  *%rax
  802a2f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a32:	c9                   	leaveq 
  802a33:	c3                   	retq   

0000000000802a34 <dev_lookup>:
  802a34:	55                   	push   %rbp
  802a35:	48 89 e5             	mov    %rsp,%rbp
  802a38:	48 83 ec 20          	sub    $0x20,%rsp
  802a3c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802a3f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802a43:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802a4a:	eb 41                	jmp    802a8d <dev_lookup+0x59>
  802a4c:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802a53:	00 00 00 
  802a56:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802a59:	48 63 d2             	movslq %edx,%rdx
  802a5c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802a60:	8b 00                	mov    (%rax),%eax
  802a62:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  802a65:	75 22                	jne    802a89 <dev_lookup+0x55>
  802a67:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802a6e:	00 00 00 
  802a71:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802a74:	48 63 d2             	movslq %edx,%rdx
  802a77:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  802a7b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802a7f:	48 89 10             	mov    %rdx,(%rax)
  802a82:	b8 00 00 00 00       	mov    $0x0,%eax
  802a87:	eb 60                	jmp    802ae9 <dev_lookup+0xb5>
  802a89:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802a8d:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802a94:	00 00 00 
  802a97:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802a9a:	48 63 d2             	movslq %edx,%rdx
  802a9d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802aa1:	48 85 c0             	test   %rax,%rax
  802aa4:	75 a6                	jne    802a4c <dev_lookup+0x18>
  802aa6:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802aad:	00 00 00 
  802ab0:	48 8b 00             	mov    (%rax),%rax
  802ab3:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802ab9:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802abc:	89 c6                	mov    %eax,%esi
  802abe:	48 bf 58 54 80 00 00 	movabs $0x805458,%rdi
  802ac5:	00 00 00 
  802ac8:	b8 00 00 00 00       	mov    $0x0,%eax
  802acd:	48 b9 1e 08 80 00 00 	movabs $0x80081e,%rcx
  802ad4:	00 00 00 
  802ad7:	ff d1                	callq  *%rcx
  802ad9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802add:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802ae4:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802ae9:	c9                   	leaveq 
  802aea:	c3                   	retq   

0000000000802aeb <close>:
  802aeb:	55                   	push   %rbp
  802aec:	48 89 e5             	mov    %rsp,%rbp
  802aef:	48 83 ec 20          	sub    $0x20,%rsp
  802af3:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802af6:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802afa:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802afd:	48 89 d6             	mov    %rdx,%rsi
  802b00:	89 c7                	mov    %eax,%edi
  802b02:	48 b8 db 28 80 00 00 	movabs $0x8028db,%rax
  802b09:	00 00 00 
  802b0c:	ff d0                	callq  *%rax
  802b0e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b11:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b15:	79 05                	jns    802b1c <close+0x31>
  802b17:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b1a:	eb 18                	jmp    802b34 <close+0x49>
  802b1c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802b20:	be 01 00 00 00       	mov    $0x1,%esi
  802b25:	48 89 c7             	mov    %rax,%rdi
  802b28:	48 b8 6b 29 80 00 00 	movabs $0x80296b,%rax
  802b2f:	00 00 00 
  802b32:	ff d0                	callq  *%rax
  802b34:	c9                   	leaveq 
  802b35:	c3                   	retq   

0000000000802b36 <close_all>:
  802b36:	55                   	push   %rbp
  802b37:	48 89 e5             	mov    %rsp,%rbp
  802b3a:	48 83 ec 10          	sub    $0x10,%rsp
  802b3e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802b45:	eb 15                	jmp    802b5c <close_all+0x26>
  802b47:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b4a:	89 c7                	mov    %eax,%edi
  802b4c:	48 b8 eb 2a 80 00 00 	movabs $0x802aeb,%rax
  802b53:	00 00 00 
  802b56:	ff d0                	callq  *%rax
  802b58:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802b5c:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802b60:	7e e5                	jle    802b47 <close_all+0x11>
  802b62:	c9                   	leaveq 
  802b63:	c3                   	retq   

0000000000802b64 <dup>:
  802b64:	55                   	push   %rbp
  802b65:	48 89 e5             	mov    %rsp,%rbp
  802b68:	48 83 ec 40          	sub    $0x40,%rsp
  802b6c:	89 7d cc             	mov    %edi,-0x34(%rbp)
  802b6f:	89 75 c8             	mov    %esi,-0x38(%rbp)
  802b72:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  802b76:	8b 45 cc             	mov    -0x34(%rbp),%eax
  802b79:	48 89 d6             	mov    %rdx,%rsi
  802b7c:	89 c7                	mov    %eax,%edi
  802b7e:	48 b8 db 28 80 00 00 	movabs $0x8028db,%rax
  802b85:	00 00 00 
  802b88:	ff d0                	callq  *%rax
  802b8a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b8d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b91:	79 08                	jns    802b9b <dup+0x37>
  802b93:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b96:	e9 70 01 00 00       	jmpq   802d0b <dup+0x1a7>
  802b9b:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802b9e:	89 c7                	mov    %eax,%edi
  802ba0:	48 b8 eb 2a 80 00 00 	movabs $0x802aeb,%rax
  802ba7:	00 00 00 
  802baa:	ff d0                	callq  *%rax
  802bac:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802baf:	48 98                	cltq   
  802bb1:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802bb7:	48 c1 e0 0c          	shl    $0xc,%rax
  802bbb:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802bbf:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802bc3:	48 89 c7             	mov    %rax,%rdi
  802bc6:	48 b8 18 28 80 00 00 	movabs $0x802818,%rax
  802bcd:	00 00 00 
  802bd0:	ff d0                	callq  *%rax
  802bd2:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802bd6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802bda:	48 89 c7             	mov    %rax,%rdi
  802bdd:	48 b8 18 28 80 00 00 	movabs $0x802818,%rax
  802be4:	00 00 00 
  802be7:	ff d0                	callq  *%rax
  802be9:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802bed:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802bf1:	48 c1 e8 15          	shr    $0x15,%rax
  802bf5:	48 89 c2             	mov    %rax,%rdx
  802bf8:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802bff:	01 00 00 
  802c02:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802c06:	83 e0 01             	and    $0x1,%eax
  802c09:	48 85 c0             	test   %rax,%rax
  802c0c:	74 73                	je     802c81 <dup+0x11d>
  802c0e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c12:	48 c1 e8 0c          	shr    $0xc,%rax
  802c16:	48 89 c2             	mov    %rax,%rdx
  802c19:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802c20:	01 00 00 
  802c23:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802c27:	83 e0 01             	and    $0x1,%eax
  802c2a:	48 85 c0             	test   %rax,%rax
  802c2d:	74 52                	je     802c81 <dup+0x11d>
  802c2f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c33:	48 c1 e8 0c          	shr    $0xc,%rax
  802c37:	48 89 c2             	mov    %rax,%rdx
  802c3a:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802c41:	01 00 00 
  802c44:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802c48:	25 07 0e 00 00       	and    $0xe07,%eax
  802c4d:	89 c1                	mov    %eax,%ecx
  802c4f:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802c53:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c57:	41 89 c8             	mov    %ecx,%r8d
  802c5a:	48 89 d1             	mov    %rdx,%rcx
  802c5d:	ba 00 00 00 00       	mov    $0x0,%edx
  802c62:	48 89 c6             	mov    %rax,%rsi
  802c65:	bf 00 00 00 00       	mov    $0x0,%edi
  802c6a:	48 b8 52 1d 80 00 00 	movabs $0x801d52,%rax
  802c71:	00 00 00 
  802c74:	ff d0                	callq  *%rax
  802c76:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c79:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c7d:	79 02                	jns    802c81 <dup+0x11d>
  802c7f:	eb 57                	jmp    802cd8 <dup+0x174>
  802c81:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802c85:	48 c1 e8 0c          	shr    $0xc,%rax
  802c89:	48 89 c2             	mov    %rax,%rdx
  802c8c:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802c93:	01 00 00 
  802c96:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802c9a:	25 07 0e 00 00       	and    $0xe07,%eax
  802c9f:	89 c1                	mov    %eax,%ecx
  802ca1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802ca5:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802ca9:	41 89 c8             	mov    %ecx,%r8d
  802cac:	48 89 d1             	mov    %rdx,%rcx
  802caf:	ba 00 00 00 00       	mov    $0x0,%edx
  802cb4:	48 89 c6             	mov    %rax,%rsi
  802cb7:	bf 00 00 00 00       	mov    $0x0,%edi
  802cbc:	48 b8 52 1d 80 00 00 	movabs $0x801d52,%rax
  802cc3:	00 00 00 
  802cc6:	ff d0                	callq  *%rax
  802cc8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ccb:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ccf:	79 02                	jns    802cd3 <dup+0x16f>
  802cd1:	eb 05                	jmp    802cd8 <dup+0x174>
  802cd3:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802cd6:	eb 33                	jmp    802d0b <dup+0x1a7>
  802cd8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802cdc:	48 89 c6             	mov    %rax,%rsi
  802cdf:	bf 00 00 00 00       	mov    $0x0,%edi
  802ce4:	48 b8 ad 1d 80 00 00 	movabs $0x801dad,%rax
  802ceb:	00 00 00 
  802cee:	ff d0                	callq  *%rax
  802cf0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802cf4:	48 89 c6             	mov    %rax,%rsi
  802cf7:	bf 00 00 00 00       	mov    $0x0,%edi
  802cfc:	48 b8 ad 1d 80 00 00 	movabs $0x801dad,%rax
  802d03:	00 00 00 
  802d06:	ff d0                	callq  *%rax
  802d08:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d0b:	c9                   	leaveq 
  802d0c:	c3                   	retq   

0000000000802d0d <read>:
  802d0d:	55                   	push   %rbp
  802d0e:	48 89 e5             	mov    %rsp,%rbp
  802d11:	48 83 ec 40          	sub    $0x40,%rsp
  802d15:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802d18:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802d1c:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802d20:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802d24:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802d27:	48 89 d6             	mov    %rdx,%rsi
  802d2a:	89 c7                	mov    %eax,%edi
  802d2c:	48 b8 db 28 80 00 00 	movabs $0x8028db,%rax
  802d33:	00 00 00 
  802d36:	ff d0                	callq  *%rax
  802d38:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d3b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d3f:	78 24                	js     802d65 <read+0x58>
  802d41:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d45:	8b 00                	mov    (%rax),%eax
  802d47:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802d4b:	48 89 d6             	mov    %rdx,%rsi
  802d4e:	89 c7                	mov    %eax,%edi
  802d50:	48 b8 34 2a 80 00 00 	movabs $0x802a34,%rax
  802d57:	00 00 00 
  802d5a:	ff d0                	callq  *%rax
  802d5c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d5f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d63:	79 05                	jns    802d6a <read+0x5d>
  802d65:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d68:	eb 76                	jmp    802de0 <read+0xd3>
  802d6a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d6e:	8b 40 08             	mov    0x8(%rax),%eax
  802d71:	83 e0 03             	and    $0x3,%eax
  802d74:	83 f8 01             	cmp    $0x1,%eax
  802d77:	75 3a                	jne    802db3 <read+0xa6>
  802d79:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802d80:	00 00 00 
  802d83:	48 8b 00             	mov    (%rax),%rax
  802d86:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802d8c:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802d8f:	89 c6                	mov    %eax,%esi
  802d91:	48 bf 77 54 80 00 00 	movabs $0x805477,%rdi
  802d98:	00 00 00 
  802d9b:	b8 00 00 00 00       	mov    $0x0,%eax
  802da0:	48 b9 1e 08 80 00 00 	movabs $0x80081e,%rcx
  802da7:	00 00 00 
  802daa:	ff d1                	callq  *%rcx
  802dac:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802db1:	eb 2d                	jmp    802de0 <read+0xd3>
  802db3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802db7:	48 8b 40 10          	mov    0x10(%rax),%rax
  802dbb:	48 85 c0             	test   %rax,%rax
  802dbe:	75 07                	jne    802dc7 <read+0xba>
  802dc0:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802dc5:	eb 19                	jmp    802de0 <read+0xd3>
  802dc7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802dcb:	48 8b 40 10          	mov    0x10(%rax),%rax
  802dcf:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802dd3:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802dd7:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802ddb:	48 89 cf             	mov    %rcx,%rdi
  802dde:	ff d0                	callq  *%rax
  802de0:	c9                   	leaveq 
  802de1:	c3                   	retq   

0000000000802de2 <readn>:
  802de2:	55                   	push   %rbp
  802de3:	48 89 e5             	mov    %rsp,%rbp
  802de6:	48 83 ec 30          	sub    $0x30,%rsp
  802dea:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802ded:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802df1:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802df5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802dfc:	eb 49                	jmp    802e47 <readn+0x65>
  802dfe:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e01:	48 98                	cltq   
  802e03:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802e07:	48 29 c2             	sub    %rax,%rdx
  802e0a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e0d:	48 63 c8             	movslq %eax,%rcx
  802e10:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802e14:	48 01 c1             	add    %rax,%rcx
  802e17:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802e1a:	48 89 ce             	mov    %rcx,%rsi
  802e1d:	89 c7                	mov    %eax,%edi
  802e1f:	48 b8 0d 2d 80 00 00 	movabs $0x802d0d,%rax
  802e26:	00 00 00 
  802e29:	ff d0                	callq  *%rax
  802e2b:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802e2e:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802e32:	79 05                	jns    802e39 <readn+0x57>
  802e34:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802e37:	eb 1c                	jmp    802e55 <readn+0x73>
  802e39:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802e3d:	75 02                	jne    802e41 <readn+0x5f>
  802e3f:	eb 11                	jmp    802e52 <readn+0x70>
  802e41:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802e44:	01 45 fc             	add    %eax,-0x4(%rbp)
  802e47:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e4a:	48 98                	cltq   
  802e4c:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802e50:	72 ac                	jb     802dfe <readn+0x1c>
  802e52:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e55:	c9                   	leaveq 
  802e56:	c3                   	retq   

0000000000802e57 <write>:
  802e57:	55                   	push   %rbp
  802e58:	48 89 e5             	mov    %rsp,%rbp
  802e5b:	48 83 ec 40          	sub    $0x40,%rsp
  802e5f:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802e62:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802e66:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802e6a:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802e6e:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802e71:	48 89 d6             	mov    %rdx,%rsi
  802e74:	89 c7                	mov    %eax,%edi
  802e76:	48 b8 db 28 80 00 00 	movabs $0x8028db,%rax
  802e7d:	00 00 00 
  802e80:	ff d0                	callq  *%rax
  802e82:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e85:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e89:	78 24                	js     802eaf <write+0x58>
  802e8b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e8f:	8b 00                	mov    (%rax),%eax
  802e91:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802e95:	48 89 d6             	mov    %rdx,%rsi
  802e98:	89 c7                	mov    %eax,%edi
  802e9a:	48 b8 34 2a 80 00 00 	movabs $0x802a34,%rax
  802ea1:	00 00 00 
  802ea4:	ff d0                	callq  *%rax
  802ea6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ea9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ead:	79 05                	jns    802eb4 <write+0x5d>
  802eaf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802eb2:	eb 75                	jmp    802f29 <write+0xd2>
  802eb4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802eb8:	8b 40 08             	mov    0x8(%rax),%eax
  802ebb:	83 e0 03             	and    $0x3,%eax
  802ebe:	85 c0                	test   %eax,%eax
  802ec0:	75 3a                	jne    802efc <write+0xa5>
  802ec2:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802ec9:	00 00 00 
  802ecc:	48 8b 00             	mov    (%rax),%rax
  802ecf:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802ed5:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802ed8:	89 c6                	mov    %eax,%esi
  802eda:	48 bf 93 54 80 00 00 	movabs $0x805493,%rdi
  802ee1:	00 00 00 
  802ee4:	b8 00 00 00 00       	mov    $0x0,%eax
  802ee9:	48 b9 1e 08 80 00 00 	movabs $0x80081e,%rcx
  802ef0:	00 00 00 
  802ef3:	ff d1                	callq  *%rcx
  802ef5:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802efa:	eb 2d                	jmp    802f29 <write+0xd2>
  802efc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f00:	48 8b 40 18          	mov    0x18(%rax),%rax
  802f04:	48 85 c0             	test   %rax,%rax
  802f07:	75 07                	jne    802f10 <write+0xb9>
  802f09:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802f0e:	eb 19                	jmp    802f29 <write+0xd2>
  802f10:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f14:	48 8b 40 18          	mov    0x18(%rax),%rax
  802f18:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802f1c:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802f20:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802f24:	48 89 cf             	mov    %rcx,%rdi
  802f27:	ff d0                	callq  *%rax
  802f29:	c9                   	leaveq 
  802f2a:	c3                   	retq   

0000000000802f2b <seek>:
  802f2b:	55                   	push   %rbp
  802f2c:	48 89 e5             	mov    %rsp,%rbp
  802f2f:	48 83 ec 18          	sub    $0x18,%rsp
  802f33:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802f36:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802f39:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802f3d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802f40:	48 89 d6             	mov    %rdx,%rsi
  802f43:	89 c7                	mov    %eax,%edi
  802f45:	48 b8 db 28 80 00 00 	movabs $0x8028db,%rax
  802f4c:	00 00 00 
  802f4f:	ff d0                	callq  *%rax
  802f51:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f54:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f58:	79 05                	jns    802f5f <seek+0x34>
  802f5a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f5d:	eb 0f                	jmp    802f6e <seek+0x43>
  802f5f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f63:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802f66:	89 50 04             	mov    %edx,0x4(%rax)
  802f69:	b8 00 00 00 00       	mov    $0x0,%eax
  802f6e:	c9                   	leaveq 
  802f6f:	c3                   	retq   

0000000000802f70 <ftruncate>:
  802f70:	55                   	push   %rbp
  802f71:	48 89 e5             	mov    %rsp,%rbp
  802f74:	48 83 ec 30          	sub    $0x30,%rsp
  802f78:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802f7b:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802f7e:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802f82:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802f85:	48 89 d6             	mov    %rdx,%rsi
  802f88:	89 c7                	mov    %eax,%edi
  802f8a:	48 b8 db 28 80 00 00 	movabs $0x8028db,%rax
  802f91:	00 00 00 
  802f94:	ff d0                	callq  *%rax
  802f96:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f99:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f9d:	78 24                	js     802fc3 <ftruncate+0x53>
  802f9f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802fa3:	8b 00                	mov    (%rax),%eax
  802fa5:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802fa9:	48 89 d6             	mov    %rdx,%rsi
  802fac:	89 c7                	mov    %eax,%edi
  802fae:	48 b8 34 2a 80 00 00 	movabs $0x802a34,%rax
  802fb5:	00 00 00 
  802fb8:	ff d0                	callq  *%rax
  802fba:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802fbd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802fc1:	79 05                	jns    802fc8 <ftruncate+0x58>
  802fc3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802fc6:	eb 72                	jmp    80303a <ftruncate+0xca>
  802fc8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802fcc:	8b 40 08             	mov    0x8(%rax),%eax
  802fcf:	83 e0 03             	and    $0x3,%eax
  802fd2:	85 c0                	test   %eax,%eax
  802fd4:	75 3a                	jne    803010 <ftruncate+0xa0>
  802fd6:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802fdd:	00 00 00 
  802fe0:	48 8b 00             	mov    (%rax),%rax
  802fe3:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802fe9:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802fec:	89 c6                	mov    %eax,%esi
  802fee:	48 bf b0 54 80 00 00 	movabs $0x8054b0,%rdi
  802ff5:	00 00 00 
  802ff8:	b8 00 00 00 00       	mov    $0x0,%eax
  802ffd:	48 b9 1e 08 80 00 00 	movabs $0x80081e,%rcx
  803004:	00 00 00 
  803007:	ff d1                	callq  *%rcx
  803009:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80300e:	eb 2a                	jmp    80303a <ftruncate+0xca>
  803010:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803014:	48 8b 40 30          	mov    0x30(%rax),%rax
  803018:	48 85 c0             	test   %rax,%rax
  80301b:	75 07                	jne    803024 <ftruncate+0xb4>
  80301d:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803022:	eb 16                	jmp    80303a <ftruncate+0xca>
  803024:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803028:	48 8b 40 30          	mov    0x30(%rax),%rax
  80302c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803030:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  803033:	89 ce                	mov    %ecx,%esi
  803035:	48 89 d7             	mov    %rdx,%rdi
  803038:	ff d0                	callq  *%rax
  80303a:	c9                   	leaveq 
  80303b:	c3                   	retq   

000000000080303c <fstat>:
  80303c:	55                   	push   %rbp
  80303d:	48 89 e5             	mov    %rsp,%rbp
  803040:	48 83 ec 30          	sub    $0x30,%rsp
  803044:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803047:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80304b:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80304f:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803052:	48 89 d6             	mov    %rdx,%rsi
  803055:	89 c7                	mov    %eax,%edi
  803057:	48 b8 db 28 80 00 00 	movabs $0x8028db,%rax
  80305e:	00 00 00 
  803061:	ff d0                	callq  *%rax
  803063:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803066:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80306a:	78 24                	js     803090 <fstat+0x54>
  80306c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803070:	8b 00                	mov    (%rax),%eax
  803072:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803076:	48 89 d6             	mov    %rdx,%rsi
  803079:	89 c7                	mov    %eax,%edi
  80307b:	48 b8 34 2a 80 00 00 	movabs $0x802a34,%rax
  803082:	00 00 00 
  803085:	ff d0                	callq  *%rax
  803087:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80308a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80308e:	79 05                	jns    803095 <fstat+0x59>
  803090:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803093:	eb 5e                	jmp    8030f3 <fstat+0xb7>
  803095:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803099:	48 8b 40 28          	mov    0x28(%rax),%rax
  80309d:	48 85 c0             	test   %rax,%rax
  8030a0:	75 07                	jne    8030a9 <fstat+0x6d>
  8030a2:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8030a7:	eb 4a                	jmp    8030f3 <fstat+0xb7>
  8030a9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8030ad:	c6 00 00             	movb   $0x0,(%rax)
  8030b0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8030b4:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  8030bb:	00 00 00 
  8030be:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8030c2:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  8030c9:	00 00 00 
  8030cc:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8030d0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8030d4:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  8030db:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8030df:	48 8b 40 28          	mov    0x28(%rax),%rax
  8030e3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8030e7:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  8030eb:	48 89 ce             	mov    %rcx,%rsi
  8030ee:	48 89 d7             	mov    %rdx,%rdi
  8030f1:	ff d0                	callq  *%rax
  8030f3:	c9                   	leaveq 
  8030f4:	c3                   	retq   

00000000008030f5 <stat>:
  8030f5:	55                   	push   %rbp
  8030f6:	48 89 e5             	mov    %rsp,%rbp
  8030f9:	48 83 ec 20          	sub    $0x20,%rsp
  8030fd:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803101:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803105:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803109:	be 00 00 00 00       	mov    $0x0,%esi
  80310e:	48 89 c7             	mov    %rax,%rdi
  803111:	48 b8 e3 31 80 00 00 	movabs $0x8031e3,%rax
  803118:	00 00 00 
  80311b:	ff d0                	callq  *%rax
  80311d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803120:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803124:	79 05                	jns    80312b <stat+0x36>
  803126:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803129:	eb 2f                	jmp    80315a <stat+0x65>
  80312b:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80312f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803132:	48 89 d6             	mov    %rdx,%rsi
  803135:	89 c7                	mov    %eax,%edi
  803137:	48 b8 3c 30 80 00 00 	movabs $0x80303c,%rax
  80313e:	00 00 00 
  803141:	ff d0                	callq  *%rax
  803143:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803146:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803149:	89 c7                	mov    %eax,%edi
  80314b:	48 b8 eb 2a 80 00 00 	movabs $0x802aeb,%rax
  803152:	00 00 00 
  803155:	ff d0                	callq  *%rax
  803157:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80315a:	c9                   	leaveq 
  80315b:	c3                   	retq   

000000000080315c <fsipc>:
  80315c:	55                   	push   %rbp
  80315d:	48 89 e5             	mov    %rsp,%rbp
  803160:	48 83 ec 10          	sub    $0x10,%rsp
  803164:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803167:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80316b:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  803172:	00 00 00 
  803175:	8b 00                	mov    (%rax),%eax
  803177:	85 c0                	test   %eax,%eax
  803179:	75 1d                	jne    803198 <fsipc+0x3c>
  80317b:	bf 01 00 00 00       	mov    $0x1,%edi
  803180:	48 b8 bc 4b 80 00 00 	movabs $0x804bbc,%rax
  803187:	00 00 00 
  80318a:	ff d0                	callq  *%rax
  80318c:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  803193:	00 00 00 
  803196:	89 02                	mov    %eax,(%rdx)
  803198:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80319f:	00 00 00 
  8031a2:	8b 00                	mov    (%rax),%eax
  8031a4:	8b 75 fc             	mov    -0x4(%rbp),%esi
  8031a7:	b9 07 00 00 00       	mov    $0x7,%ecx
  8031ac:	48 ba 00 90 80 00 00 	movabs $0x809000,%rdx
  8031b3:	00 00 00 
  8031b6:	89 c7                	mov    %eax,%edi
  8031b8:	48 b8 26 4b 80 00 00 	movabs $0x804b26,%rax
  8031bf:	00 00 00 
  8031c2:	ff d0                	callq  *%rax
  8031c4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8031c8:	ba 00 00 00 00       	mov    $0x0,%edx
  8031cd:	48 89 c6             	mov    %rax,%rsi
  8031d0:	bf 00 00 00 00       	mov    $0x0,%edi
  8031d5:	48 b8 65 4a 80 00 00 	movabs $0x804a65,%rax
  8031dc:	00 00 00 
  8031df:	ff d0                	callq  *%rax
  8031e1:	c9                   	leaveq 
  8031e2:	c3                   	retq   

00000000008031e3 <open>:
  8031e3:	55                   	push   %rbp
  8031e4:	48 89 e5             	mov    %rsp,%rbp
  8031e7:	48 83 ec 20          	sub    $0x20,%rsp
  8031eb:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8031ef:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8031f2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8031f6:	48 89 c7             	mov    %rax,%rdi
  8031f9:	48 b8 67 13 80 00 00 	movabs $0x801367,%rax
  803200:	00 00 00 
  803203:	ff d0                	callq  *%rax
  803205:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  80320a:	7e 0a                	jle    803216 <open+0x33>
  80320c:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  803211:	e9 a5 00 00 00       	jmpq   8032bb <open+0xd8>
  803216:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  80321a:	48 89 c7             	mov    %rax,%rdi
  80321d:	48 b8 43 28 80 00 00 	movabs $0x802843,%rax
  803224:	00 00 00 
  803227:	ff d0                	callq  *%rax
  803229:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80322c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803230:	79 08                	jns    80323a <open+0x57>
  803232:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803235:	e9 81 00 00 00       	jmpq   8032bb <open+0xd8>
  80323a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80323e:	48 89 c6             	mov    %rax,%rsi
  803241:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  803248:	00 00 00 
  80324b:	48 b8 d3 13 80 00 00 	movabs $0x8013d3,%rax
  803252:	00 00 00 
  803255:	ff d0                	callq  *%rax
  803257:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80325e:	00 00 00 
  803261:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803264:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  80326a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80326e:	48 89 c6             	mov    %rax,%rsi
  803271:	bf 01 00 00 00       	mov    $0x1,%edi
  803276:	48 b8 5c 31 80 00 00 	movabs $0x80315c,%rax
  80327d:	00 00 00 
  803280:	ff d0                	callq  *%rax
  803282:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803285:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803289:	79 1d                	jns    8032a8 <open+0xc5>
  80328b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80328f:	be 00 00 00 00       	mov    $0x0,%esi
  803294:	48 89 c7             	mov    %rax,%rdi
  803297:	48 b8 6b 29 80 00 00 	movabs $0x80296b,%rax
  80329e:	00 00 00 
  8032a1:	ff d0                	callq  *%rax
  8032a3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032a6:	eb 13                	jmp    8032bb <open+0xd8>
  8032a8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8032ac:	48 89 c7             	mov    %rax,%rdi
  8032af:	48 b8 f5 27 80 00 00 	movabs $0x8027f5,%rax
  8032b6:	00 00 00 
  8032b9:	ff d0                	callq  *%rax
  8032bb:	c9                   	leaveq 
  8032bc:	c3                   	retq   

00000000008032bd <devfile_flush>:
  8032bd:	55                   	push   %rbp
  8032be:	48 89 e5             	mov    %rsp,%rbp
  8032c1:	48 83 ec 10          	sub    $0x10,%rsp
  8032c5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8032c9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8032cd:	8b 50 0c             	mov    0xc(%rax),%edx
  8032d0:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8032d7:	00 00 00 
  8032da:	89 10                	mov    %edx,(%rax)
  8032dc:	be 00 00 00 00       	mov    $0x0,%esi
  8032e1:	bf 06 00 00 00       	mov    $0x6,%edi
  8032e6:	48 b8 5c 31 80 00 00 	movabs $0x80315c,%rax
  8032ed:	00 00 00 
  8032f0:	ff d0                	callq  *%rax
  8032f2:	c9                   	leaveq 
  8032f3:	c3                   	retq   

00000000008032f4 <devfile_read>:
  8032f4:	55                   	push   %rbp
  8032f5:	48 89 e5             	mov    %rsp,%rbp
  8032f8:	48 83 ec 30          	sub    $0x30,%rsp
  8032fc:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803300:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803304:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803308:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80330c:	8b 50 0c             	mov    0xc(%rax),%edx
  80330f:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803316:	00 00 00 
  803319:	89 10                	mov    %edx,(%rax)
  80331b:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803322:	00 00 00 
  803325:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803329:	48 89 50 08          	mov    %rdx,0x8(%rax)
  80332d:	be 00 00 00 00       	mov    $0x0,%esi
  803332:	bf 03 00 00 00       	mov    $0x3,%edi
  803337:	48 b8 5c 31 80 00 00 	movabs $0x80315c,%rax
  80333e:	00 00 00 
  803341:	ff d0                	callq  *%rax
  803343:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803346:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80334a:	79 08                	jns    803354 <devfile_read+0x60>
  80334c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80334f:	e9 a4 00 00 00       	jmpq   8033f8 <devfile_read+0x104>
  803354:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803357:	48 98                	cltq   
  803359:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  80335d:	76 35                	jbe    803394 <devfile_read+0xa0>
  80335f:	48 b9 d6 54 80 00 00 	movabs $0x8054d6,%rcx
  803366:	00 00 00 
  803369:	48 ba dd 54 80 00 00 	movabs $0x8054dd,%rdx
  803370:	00 00 00 
  803373:	be 89 00 00 00       	mov    $0x89,%esi
  803378:	48 bf f2 54 80 00 00 	movabs $0x8054f2,%rdi
  80337f:	00 00 00 
  803382:	b8 00 00 00 00       	mov    $0x0,%eax
  803387:	49 b8 e5 05 80 00 00 	movabs $0x8005e5,%r8
  80338e:	00 00 00 
  803391:	41 ff d0             	callq  *%r8
  803394:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  80339b:	7e 35                	jle    8033d2 <devfile_read+0xde>
  80339d:	48 b9 00 55 80 00 00 	movabs $0x805500,%rcx
  8033a4:	00 00 00 
  8033a7:	48 ba dd 54 80 00 00 	movabs $0x8054dd,%rdx
  8033ae:	00 00 00 
  8033b1:	be 8a 00 00 00       	mov    $0x8a,%esi
  8033b6:	48 bf f2 54 80 00 00 	movabs $0x8054f2,%rdi
  8033bd:	00 00 00 
  8033c0:	b8 00 00 00 00       	mov    $0x0,%eax
  8033c5:	49 b8 e5 05 80 00 00 	movabs $0x8005e5,%r8
  8033cc:	00 00 00 
  8033cf:	41 ff d0             	callq  *%r8
  8033d2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033d5:	48 63 d0             	movslq %eax,%rdx
  8033d8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8033dc:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  8033e3:	00 00 00 
  8033e6:	48 89 c7             	mov    %rax,%rdi
  8033e9:	48 b8 f7 16 80 00 00 	movabs $0x8016f7,%rax
  8033f0:	00 00 00 
  8033f3:	ff d0                	callq  *%rax
  8033f5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033f8:	c9                   	leaveq 
  8033f9:	c3                   	retq   

00000000008033fa <devfile_write>:
  8033fa:	55                   	push   %rbp
  8033fb:	48 89 e5             	mov    %rsp,%rbp
  8033fe:	48 83 ec 40          	sub    $0x40,%rsp
  803402:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803406:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80340a:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80340e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803412:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803416:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  80341d:	00 
  80341e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803422:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  803426:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  80342b:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  80342f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803433:	8b 50 0c             	mov    0xc(%rax),%edx
  803436:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80343d:	00 00 00 
  803440:	89 10                	mov    %edx,(%rax)
  803442:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803449:	00 00 00 
  80344c:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803450:	48 89 50 08          	mov    %rdx,0x8(%rax)
  803454:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803458:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80345c:	48 89 c6             	mov    %rax,%rsi
  80345f:	48 bf 10 90 80 00 00 	movabs $0x809010,%rdi
  803466:	00 00 00 
  803469:	48 b8 f7 16 80 00 00 	movabs $0x8016f7,%rax
  803470:	00 00 00 
  803473:	ff d0                	callq  *%rax
  803475:	be 00 00 00 00       	mov    $0x0,%esi
  80347a:	bf 04 00 00 00       	mov    $0x4,%edi
  80347f:	48 b8 5c 31 80 00 00 	movabs $0x80315c,%rax
  803486:	00 00 00 
  803489:	ff d0                	callq  *%rax
  80348b:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80348e:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803492:	79 05                	jns    803499 <devfile_write+0x9f>
  803494:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803497:	eb 43                	jmp    8034dc <devfile_write+0xe2>
  803499:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80349c:	48 98                	cltq   
  80349e:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8034a2:	76 35                	jbe    8034d9 <devfile_write+0xdf>
  8034a4:	48 b9 d6 54 80 00 00 	movabs $0x8054d6,%rcx
  8034ab:	00 00 00 
  8034ae:	48 ba dd 54 80 00 00 	movabs $0x8054dd,%rdx
  8034b5:	00 00 00 
  8034b8:	be a8 00 00 00       	mov    $0xa8,%esi
  8034bd:	48 bf f2 54 80 00 00 	movabs $0x8054f2,%rdi
  8034c4:	00 00 00 
  8034c7:	b8 00 00 00 00       	mov    $0x0,%eax
  8034cc:	49 b8 e5 05 80 00 00 	movabs $0x8005e5,%r8
  8034d3:	00 00 00 
  8034d6:	41 ff d0             	callq  *%r8
  8034d9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8034dc:	c9                   	leaveq 
  8034dd:	c3                   	retq   

00000000008034de <devfile_stat>:
  8034de:	55                   	push   %rbp
  8034df:	48 89 e5             	mov    %rsp,%rbp
  8034e2:	48 83 ec 20          	sub    $0x20,%rsp
  8034e6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8034ea:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8034ee:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8034f2:	8b 50 0c             	mov    0xc(%rax),%edx
  8034f5:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8034fc:	00 00 00 
  8034ff:	89 10                	mov    %edx,(%rax)
  803501:	be 00 00 00 00       	mov    $0x0,%esi
  803506:	bf 05 00 00 00       	mov    $0x5,%edi
  80350b:	48 b8 5c 31 80 00 00 	movabs $0x80315c,%rax
  803512:	00 00 00 
  803515:	ff d0                	callq  *%rax
  803517:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80351a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80351e:	79 05                	jns    803525 <devfile_stat+0x47>
  803520:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803523:	eb 56                	jmp    80357b <devfile_stat+0x9d>
  803525:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803529:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  803530:	00 00 00 
  803533:	48 89 c7             	mov    %rax,%rdi
  803536:	48 b8 d3 13 80 00 00 	movabs $0x8013d3,%rax
  80353d:	00 00 00 
  803540:	ff d0                	callq  *%rax
  803542:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803549:	00 00 00 
  80354c:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  803552:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803556:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  80355c:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803563:	00 00 00 
  803566:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  80356c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803570:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  803576:	b8 00 00 00 00       	mov    $0x0,%eax
  80357b:	c9                   	leaveq 
  80357c:	c3                   	retq   

000000000080357d <devfile_trunc>:
  80357d:	55                   	push   %rbp
  80357e:	48 89 e5             	mov    %rsp,%rbp
  803581:	48 83 ec 10          	sub    $0x10,%rsp
  803585:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803589:	89 75 f4             	mov    %esi,-0xc(%rbp)
  80358c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803590:	8b 50 0c             	mov    0xc(%rax),%edx
  803593:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80359a:	00 00 00 
  80359d:	89 10                	mov    %edx,(%rax)
  80359f:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8035a6:	00 00 00 
  8035a9:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8035ac:	89 50 04             	mov    %edx,0x4(%rax)
  8035af:	be 00 00 00 00       	mov    $0x0,%esi
  8035b4:	bf 02 00 00 00       	mov    $0x2,%edi
  8035b9:	48 b8 5c 31 80 00 00 	movabs $0x80315c,%rax
  8035c0:	00 00 00 
  8035c3:	ff d0                	callq  *%rax
  8035c5:	c9                   	leaveq 
  8035c6:	c3                   	retq   

00000000008035c7 <remove>:
  8035c7:	55                   	push   %rbp
  8035c8:	48 89 e5             	mov    %rsp,%rbp
  8035cb:	48 83 ec 10          	sub    $0x10,%rsp
  8035cf:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8035d3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8035d7:	48 89 c7             	mov    %rax,%rdi
  8035da:	48 b8 67 13 80 00 00 	movabs $0x801367,%rax
  8035e1:	00 00 00 
  8035e4:	ff d0                	callq  *%rax
  8035e6:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  8035eb:	7e 07                	jle    8035f4 <remove+0x2d>
  8035ed:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  8035f2:	eb 33                	jmp    803627 <remove+0x60>
  8035f4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8035f8:	48 89 c6             	mov    %rax,%rsi
  8035fb:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  803602:	00 00 00 
  803605:	48 b8 d3 13 80 00 00 	movabs $0x8013d3,%rax
  80360c:	00 00 00 
  80360f:	ff d0                	callq  *%rax
  803611:	be 00 00 00 00       	mov    $0x0,%esi
  803616:	bf 07 00 00 00       	mov    $0x7,%edi
  80361b:	48 b8 5c 31 80 00 00 	movabs $0x80315c,%rax
  803622:	00 00 00 
  803625:	ff d0                	callq  *%rax
  803627:	c9                   	leaveq 
  803628:	c3                   	retq   

0000000000803629 <sync>:
  803629:	55                   	push   %rbp
  80362a:	48 89 e5             	mov    %rsp,%rbp
  80362d:	be 00 00 00 00       	mov    $0x0,%esi
  803632:	bf 08 00 00 00       	mov    $0x8,%edi
  803637:	48 b8 5c 31 80 00 00 	movabs $0x80315c,%rax
  80363e:	00 00 00 
  803641:	ff d0                	callq  *%rax
  803643:	5d                   	pop    %rbp
  803644:	c3                   	retq   

0000000000803645 <copy>:
  803645:	55                   	push   %rbp
  803646:	48 89 e5             	mov    %rsp,%rbp
  803649:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  803650:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  803657:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  80365e:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  803665:	be 00 00 00 00       	mov    $0x0,%esi
  80366a:	48 89 c7             	mov    %rax,%rdi
  80366d:	48 b8 e3 31 80 00 00 	movabs $0x8031e3,%rax
  803674:	00 00 00 
  803677:	ff d0                	callq  *%rax
  803679:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80367c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803680:	79 28                	jns    8036aa <copy+0x65>
  803682:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803685:	89 c6                	mov    %eax,%esi
  803687:	48 bf 0c 55 80 00 00 	movabs $0x80550c,%rdi
  80368e:	00 00 00 
  803691:	b8 00 00 00 00       	mov    $0x0,%eax
  803696:	48 ba 1e 08 80 00 00 	movabs $0x80081e,%rdx
  80369d:	00 00 00 
  8036a0:	ff d2                	callq  *%rdx
  8036a2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036a5:	e9 74 01 00 00       	jmpq   80381e <copy+0x1d9>
  8036aa:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  8036b1:	be 01 01 00 00       	mov    $0x101,%esi
  8036b6:	48 89 c7             	mov    %rax,%rdi
  8036b9:	48 b8 e3 31 80 00 00 	movabs $0x8031e3,%rax
  8036c0:	00 00 00 
  8036c3:	ff d0                	callq  *%rax
  8036c5:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8036c8:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8036cc:	79 39                	jns    803707 <copy+0xc2>
  8036ce:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8036d1:	89 c6                	mov    %eax,%esi
  8036d3:	48 bf 22 55 80 00 00 	movabs $0x805522,%rdi
  8036da:	00 00 00 
  8036dd:	b8 00 00 00 00       	mov    $0x0,%eax
  8036e2:	48 ba 1e 08 80 00 00 	movabs $0x80081e,%rdx
  8036e9:	00 00 00 
  8036ec:	ff d2                	callq  *%rdx
  8036ee:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036f1:	89 c7                	mov    %eax,%edi
  8036f3:	48 b8 eb 2a 80 00 00 	movabs $0x802aeb,%rax
  8036fa:	00 00 00 
  8036fd:	ff d0                	callq  *%rax
  8036ff:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803702:	e9 17 01 00 00       	jmpq   80381e <copy+0x1d9>
  803707:	eb 74                	jmp    80377d <copy+0x138>
  803709:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80370c:	48 63 d0             	movslq %eax,%rdx
  80370f:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  803716:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803719:	48 89 ce             	mov    %rcx,%rsi
  80371c:	89 c7                	mov    %eax,%edi
  80371e:	48 b8 57 2e 80 00 00 	movabs $0x802e57,%rax
  803725:	00 00 00 
  803728:	ff d0                	callq  *%rax
  80372a:	89 45 f0             	mov    %eax,-0x10(%rbp)
  80372d:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  803731:	79 4a                	jns    80377d <copy+0x138>
  803733:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803736:	89 c6                	mov    %eax,%esi
  803738:	48 bf 3c 55 80 00 00 	movabs $0x80553c,%rdi
  80373f:	00 00 00 
  803742:	b8 00 00 00 00       	mov    $0x0,%eax
  803747:	48 ba 1e 08 80 00 00 	movabs $0x80081e,%rdx
  80374e:	00 00 00 
  803751:	ff d2                	callq  *%rdx
  803753:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803756:	89 c7                	mov    %eax,%edi
  803758:	48 b8 eb 2a 80 00 00 	movabs $0x802aeb,%rax
  80375f:	00 00 00 
  803762:	ff d0                	callq  *%rax
  803764:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803767:	89 c7                	mov    %eax,%edi
  803769:	48 b8 eb 2a 80 00 00 	movabs $0x802aeb,%rax
  803770:	00 00 00 
  803773:	ff d0                	callq  *%rax
  803775:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803778:	e9 a1 00 00 00       	jmpq   80381e <copy+0x1d9>
  80377d:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  803784:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803787:	ba 00 02 00 00       	mov    $0x200,%edx
  80378c:	48 89 ce             	mov    %rcx,%rsi
  80378f:	89 c7                	mov    %eax,%edi
  803791:	48 b8 0d 2d 80 00 00 	movabs $0x802d0d,%rax
  803798:	00 00 00 
  80379b:	ff d0                	callq  *%rax
  80379d:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8037a0:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8037a4:	0f 8f 5f ff ff ff    	jg     803709 <copy+0xc4>
  8037aa:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8037ae:	79 47                	jns    8037f7 <copy+0x1b2>
  8037b0:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8037b3:	89 c6                	mov    %eax,%esi
  8037b5:	48 bf 4f 55 80 00 00 	movabs $0x80554f,%rdi
  8037bc:	00 00 00 
  8037bf:	b8 00 00 00 00       	mov    $0x0,%eax
  8037c4:	48 ba 1e 08 80 00 00 	movabs $0x80081e,%rdx
  8037cb:	00 00 00 
  8037ce:	ff d2                	callq  *%rdx
  8037d0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037d3:	89 c7                	mov    %eax,%edi
  8037d5:	48 b8 eb 2a 80 00 00 	movabs $0x802aeb,%rax
  8037dc:	00 00 00 
  8037df:	ff d0                	callq  *%rax
  8037e1:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8037e4:	89 c7                	mov    %eax,%edi
  8037e6:	48 b8 eb 2a 80 00 00 	movabs $0x802aeb,%rax
  8037ed:	00 00 00 
  8037f0:	ff d0                	callq  *%rax
  8037f2:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8037f5:	eb 27                	jmp    80381e <copy+0x1d9>
  8037f7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037fa:	89 c7                	mov    %eax,%edi
  8037fc:	48 b8 eb 2a 80 00 00 	movabs $0x802aeb,%rax
  803803:	00 00 00 
  803806:	ff d0                	callq  *%rax
  803808:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80380b:	89 c7                	mov    %eax,%edi
  80380d:	48 b8 eb 2a 80 00 00 	movabs $0x802aeb,%rax
  803814:	00 00 00 
  803817:	ff d0                	callq  *%rax
  803819:	b8 00 00 00 00       	mov    $0x0,%eax
  80381e:	c9                   	leaveq 
  80381f:	c3                   	retq   

0000000000803820 <fd2sockid>:
  803820:	55                   	push   %rbp
  803821:	48 89 e5             	mov    %rsp,%rbp
  803824:	48 83 ec 20          	sub    $0x20,%rsp
  803828:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80382b:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80382f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803832:	48 89 d6             	mov    %rdx,%rsi
  803835:	89 c7                	mov    %eax,%edi
  803837:	48 b8 db 28 80 00 00 	movabs $0x8028db,%rax
  80383e:	00 00 00 
  803841:	ff d0                	callq  *%rax
  803843:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803846:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80384a:	79 05                	jns    803851 <fd2sockid+0x31>
  80384c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80384f:	eb 24                	jmp    803875 <fd2sockid+0x55>
  803851:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803855:	8b 10                	mov    (%rax),%edx
  803857:	48 b8 a0 70 80 00 00 	movabs $0x8070a0,%rax
  80385e:	00 00 00 
  803861:	8b 00                	mov    (%rax),%eax
  803863:	39 c2                	cmp    %eax,%edx
  803865:	74 07                	je     80386e <fd2sockid+0x4e>
  803867:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80386c:	eb 07                	jmp    803875 <fd2sockid+0x55>
  80386e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803872:	8b 40 0c             	mov    0xc(%rax),%eax
  803875:	c9                   	leaveq 
  803876:	c3                   	retq   

0000000000803877 <alloc_sockfd>:
  803877:	55                   	push   %rbp
  803878:	48 89 e5             	mov    %rsp,%rbp
  80387b:	48 83 ec 20          	sub    $0x20,%rsp
  80387f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803882:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803886:	48 89 c7             	mov    %rax,%rdi
  803889:	48 b8 43 28 80 00 00 	movabs $0x802843,%rax
  803890:	00 00 00 
  803893:	ff d0                	callq  *%rax
  803895:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803898:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80389c:	78 26                	js     8038c4 <alloc_sockfd+0x4d>
  80389e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8038a2:	ba 07 04 00 00       	mov    $0x407,%edx
  8038a7:	48 89 c6             	mov    %rax,%rsi
  8038aa:	bf 00 00 00 00       	mov    $0x0,%edi
  8038af:	48 b8 02 1d 80 00 00 	movabs $0x801d02,%rax
  8038b6:	00 00 00 
  8038b9:	ff d0                	callq  *%rax
  8038bb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8038be:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8038c2:	79 16                	jns    8038da <alloc_sockfd+0x63>
  8038c4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8038c7:	89 c7                	mov    %eax,%edi
  8038c9:	48 b8 84 3d 80 00 00 	movabs $0x803d84,%rax
  8038d0:	00 00 00 
  8038d3:	ff d0                	callq  *%rax
  8038d5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038d8:	eb 3a                	jmp    803914 <alloc_sockfd+0x9d>
  8038da:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8038de:	48 ba a0 70 80 00 00 	movabs $0x8070a0,%rdx
  8038e5:	00 00 00 
  8038e8:	8b 12                	mov    (%rdx),%edx
  8038ea:	89 10                	mov    %edx,(%rax)
  8038ec:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8038f0:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8038f7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8038fb:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8038fe:	89 50 0c             	mov    %edx,0xc(%rax)
  803901:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803905:	48 89 c7             	mov    %rax,%rdi
  803908:	48 b8 f5 27 80 00 00 	movabs $0x8027f5,%rax
  80390f:	00 00 00 
  803912:	ff d0                	callq  *%rax
  803914:	c9                   	leaveq 
  803915:	c3                   	retq   

0000000000803916 <accept>:
  803916:	55                   	push   %rbp
  803917:	48 89 e5             	mov    %rsp,%rbp
  80391a:	48 83 ec 30          	sub    $0x30,%rsp
  80391e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803921:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803925:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803929:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80392c:	89 c7                	mov    %eax,%edi
  80392e:	48 b8 20 38 80 00 00 	movabs $0x803820,%rax
  803935:	00 00 00 
  803938:	ff d0                	callq  *%rax
  80393a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80393d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803941:	79 05                	jns    803948 <accept+0x32>
  803943:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803946:	eb 3b                	jmp    803983 <accept+0x6d>
  803948:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80394c:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803950:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803953:	48 89 ce             	mov    %rcx,%rsi
  803956:	89 c7                	mov    %eax,%edi
  803958:	48 b8 61 3c 80 00 00 	movabs $0x803c61,%rax
  80395f:	00 00 00 
  803962:	ff d0                	callq  *%rax
  803964:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803967:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80396b:	79 05                	jns    803972 <accept+0x5c>
  80396d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803970:	eb 11                	jmp    803983 <accept+0x6d>
  803972:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803975:	89 c7                	mov    %eax,%edi
  803977:	48 b8 77 38 80 00 00 	movabs $0x803877,%rax
  80397e:	00 00 00 
  803981:	ff d0                	callq  *%rax
  803983:	c9                   	leaveq 
  803984:	c3                   	retq   

0000000000803985 <bind>:
  803985:	55                   	push   %rbp
  803986:	48 89 e5             	mov    %rsp,%rbp
  803989:	48 83 ec 20          	sub    $0x20,%rsp
  80398d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803990:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803994:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803997:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80399a:	89 c7                	mov    %eax,%edi
  80399c:	48 b8 20 38 80 00 00 	movabs $0x803820,%rax
  8039a3:	00 00 00 
  8039a6:	ff d0                	callq  *%rax
  8039a8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8039ab:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8039af:	79 05                	jns    8039b6 <bind+0x31>
  8039b1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039b4:	eb 1b                	jmp    8039d1 <bind+0x4c>
  8039b6:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8039b9:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8039bd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039c0:	48 89 ce             	mov    %rcx,%rsi
  8039c3:	89 c7                	mov    %eax,%edi
  8039c5:	48 b8 e0 3c 80 00 00 	movabs $0x803ce0,%rax
  8039cc:	00 00 00 
  8039cf:	ff d0                	callq  *%rax
  8039d1:	c9                   	leaveq 
  8039d2:	c3                   	retq   

00000000008039d3 <shutdown>:
  8039d3:	55                   	push   %rbp
  8039d4:	48 89 e5             	mov    %rsp,%rbp
  8039d7:	48 83 ec 20          	sub    $0x20,%rsp
  8039db:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8039de:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8039e1:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8039e4:	89 c7                	mov    %eax,%edi
  8039e6:	48 b8 20 38 80 00 00 	movabs $0x803820,%rax
  8039ed:	00 00 00 
  8039f0:	ff d0                	callq  *%rax
  8039f2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8039f5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8039f9:	79 05                	jns    803a00 <shutdown+0x2d>
  8039fb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039fe:	eb 16                	jmp    803a16 <shutdown+0x43>
  803a00:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803a03:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a06:	89 d6                	mov    %edx,%esi
  803a08:	89 c7                	mov    %eax,%edi
  803a0a:	48 b8 44 3d 80 00 00 	movabs $0x803d44,%rax
  803a11:	00 00 00 
  803a14:	ff d0                	callq  *%rax
  803a16:	c9                   	leaveq 
  803a17:	c3                   	retq   

0000000000803a18 <devsock_close>:
  803a18:	55                   	push   %rbp
  803a19:	48 89 e5             	mov    %rsp,%rbp
  803a1c:	48 83 ec 10          	sub    $0x10,%rsp
  803a20:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803a24:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803a28:	48 89 c7             	mov    %rax,%rdi
  803a2b:	48 b8 2e 4c 80 00 00 	movabs $0x804c2e,%rax
  803a32:	00 00 00 
  803a35:	ff d0                	callq  *%rax
  803a37:	83 f8 01             	cmp    $0x1,%eax
  803a3a:	75 17                	jne    803a53 <devsock_close+0x3b>
  803a3c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803a40:	8b 40 0c             	mov    0xc(%rax),%eax
  803a43:	89 c7                	mov    %eax,%edi
  803a45:	48 b8 84 3d 80 00 00 	movabs $0x803d84,%rax
  803a4c:	00 00 00 
  803a4f:	ff d0                	callq  *%rax
  803a51:	eb 05                	jmp    803a58 <devsock_close+0x40>
  803a53:	b8 00 00 00 00       	mov    $0x0,%eax
  803a58:	c9                   	leaveq 
  803a59:	c3                   	retq   

0000000000803a5a <connect>:
  803a5a:	55                   	push   %rbp
  803a5b:	48 89 e5             	mov    %rsp,%rbp
  803a5e:	48 83 ec 20          	sub    $0x20,%rsp
  803a62:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803a65:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803a69:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803a6c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803a6f:	89 c7                	mov    %eax,%edi
  803a71:	48 b8 20 38 80 00 00 	movabs $0x803820,%rax
  803a78:	00 00 00 
  803a7b:	ff d0                	callq  *%rax
  803a7d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803a80:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803a84:	79 05                	jns    803a8b <connect+0x31>
  803a86:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a89:	eb 1b                	jmp    803aa6 <connect+0x4c>
  803a8b:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803a8e:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803a92:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a95:	48 89 ce             	mov    %rcx,%rsi
  803a98:	89 c7                	mov    %eax,%edi
  803a9a:	48 b8 b1 3d 80 00 00 	movabs $0x803db1,%rax
  803aa1:	00 00 00 
  803aa4:	ff d0                	callq  *%rax
  803aa6:	c9                   	leaveq 
  803aa7:	c3                   	retq   

0000000000803aa8 <listen>:
  803aa8:	55                   	push   %rbp
  803aa9:	48 89 e5             	mov    %rsp,%rbp
  803aac:	48 83 ec 20          	sub    $0x20,%rsp
  803ab0:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803ab3:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803ab6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803ab9:	89 c7                	mov    %eax,%edi
  803abb:	48 b8 20 38 80 00 00 	movabs $0x803820,%rax
  803ac2:	00 00 00 
  803ac5:	ff d0                	callq  *%rax
  803ac7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803aca:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803ace:	79 05                	jns    803ad5 <listen+0x2d>
  803ad0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ad3:	eb 16                	jmp    803aeb <listen+0x43>
  803ad5:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803ad8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803adb:	89 d6                	mov    %edx,%esi
  803add:	89 c7                	mov    %eax,%edi
  803adf:	48 b8 15 3e 80 00 00 	movabs $0x803e15,%rax
  803ae6:	00 00 00 
  803ae9:	ff d0                	callq  *%rax
  803aeb:	c9                   	leaveq 
  803aec:	c3                   	retq   

0000000000803aed <devsock_read>:
  803aed:	55                   	push   %rbp
  803aee:	48 89 e5             	mov    %rsp,%rbp
  803af1:	48 83 ec 20          	sub    $0x20,%rsp
  803af5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803af9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803afd:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803b01:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803b05:	89 c2                	mov    %eax,%edx
  803b07:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803b0b:	8b 40 0c             	mov    0xc(%rax),%eax
  803b0e:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803b12:	b9 00 00 00 00       	mov    $0x0,%ecx
  803b17:	89 c7                	mov    %eax,%edi
  803b19:	48 b8 55 3e 80 00 00 	movabs $0x803e55,%rax
  803b20:	00 00 00 
  803b23:	ff d0                	callq  *%rax
  803b25:	c9                   	leaveq 
  803b26:	c3                   	retq   

0000000000803b27 <devsock_write>:
  803b27:	55                   	push   %rbp
  803b28:	48 89 e5             	mov    %rsp,%rbp
  803b2b:	48 83 ec 20          	sub    $0x20,%rsp
  803b2f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803b33:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803b37:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803b3b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803b3f:	89 c2                	mov    %eax,%edx
  803b41:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803b45:	8b 40 0c             	mov    0xc(%rax),%eax
  803b48:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803b4c:	b9 00 00 00 00       	mov    $0x0,%ecx
  803b51:	89 c7                	mov    %eax,%edi
  803b53:	48 b8 21 3f 80 00 00 	movabs $0x803f21,%rax
  803b5a:	00 00 00 
  803b5d:	ff d0                	callq  *%rax
  803b5f:	c9                   	leaveq 
  803b60:	c3                   	retq   

0000000000803b61 <devsock_stat>:
  803b61:	55                   	push   %rbp
  803b62:	48 89 e5             	mov    %rsp,%rbp
  803b65:	48 83 ec 10          	sub    $0x10,%rsp
  803b69:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803b6d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803b71:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b75:	48 be 6a 55 80 00 00 	movabs $0x80556a,%rsi
  803b7c:	00 00 00 
  803b7f:	48 89 c7             	mov    %rax,%rdi
  803b82:	48 b8 d3 13 80 00 00 	movabs $0x8013d3,%rax
  803b89:	00 00 00 
  803b8c:	ff d0                	callq  *%rax
  803b8e:	b8 00 00 00 00       	mov    $0x0,%eax
  803b93:	c9                   	leaveq 
  803b94:	c3                   	retq   

0000000000803b95 <socket>:
  803b95:	55                   	push   %rbp
  803b96:	48 89 e5             	mov    %rsp,%rbp
  803b99:	48 83 ec 20          	sub    $0x20,%rsp
  803b9d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803ba0:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803ba3:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  803ba6:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803ba9:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803bac:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803baf:	89 ce                	mov    %ecx,%esi
  803bb1:	89 c7                	mov    %eax,%edi
  803bb3:	48 b8 d9 3f 80 00 00 	movabs $0x803fd9,%rax
  803bba:	00 00 00 
  803bbd:	ff d0                	callq  *%rax
  803bbf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803bc2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803bc6:	79 05                	jns    803bcd <socket+0x38>
  803bc8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803bcb:	eb 11                	jmp    803bde <socket+0x49>
  803bcd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803bd0:	89 c7                	mov    %eax,%edi
  803bd2:	48 b8 77 38 80 00 00 	movabs $0x803877,%rax
  803bd9:	00 00 00 
  803bdc:	ff d0                	callq  *%rax
  803bde:	c9                   	leaveq 
  803bdf:	c3                   	retq   

0000000000803be0 <nsipc>:
  803be0:	55                   	push   %rbp
  803be1:	48 89 e5             	mov    %rsp,%rbp
  803be4:	48 83 ec 10          	sub    $0x10,%rsp
  803be8:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803beb:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803bf2:	00 00 00 
  803bf5:	8b 00                	mov    (%rax),%eax
  803bf7:	85 c0                	test   %eax,%eax
  803bf9:	75 1d                	jne    803c18 <nsipc+0x38>
  803bfb:	bf 02 00 00 00       	mov    $0x2,%edi
  803c00:	48 b8 bc 4b 80 00 00 	movabs $0x804bbc,%rax
  803c07:	00 00 00 
  803c0a:	ff d0                	callq  *%rax
  803c0c:	48 ba 04 80 80 00 00 	movabs $0x808004,%rdx
  803c13:	00 00 00 
  803c16:	89 02                	mov    %eax,(%rdx)
  803c18:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803c1f:	00 00 00 
  803c22:	8b 00                	mov    (%rax),%eax
  803c24:	8b 75 fc             	mov    -0x4(%rbp),%esi
  803c27:	b9 07 00 00 00       	mov    $0x7,%ecx
  803c2c:	48 ba 00 b0 80 00 00 	movabs $0x80b000,%rdx
  803c33:	00 00 00 
  803c36:	89 c7                	mov    %eax,%edi
  803c38:	48 b8 26 4b 80 00 00 	movabs $0x804b26,%rax
  803c3f:	00 00 00 
  803c42:	ff d0                	callq  *%rax
  803c44:	ba 00 00 00 00       	mov    $0x0,%edx
  803c49:	be 00 00 00 00       	mov    $0x0,%esi
  803c4e:	bf 00 00 00 00       	mov    $0x0,%edi
  803c53:	48 b8 65 4a 80 00 00 	movabs $0x804a65,%rax
  803c5a:	00 00 00 
  803c5d:	ff d0                	callq  *%rax
  803c5f:	c9                   	leaveq 
  803c60:	c3                   	retq   

0000000000803c61 <nsipc_accept>:
  803c61:	55                   	push   %rbp
  803c62:	48 89 e5             	mov    %rsp,%rbp
  803c65:	48 83 ec 30          	sub    $0x30,%rsp
  803c69:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803c6c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803c70:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803c74:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c7b:	00 00 00 
  803c7e:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803c81:	89 10                	mov    %edx,(%rax)
  803c83:	bf 01 00 00 00       	mov    $0x1,%edi
  803c88:	48 b8 e0 3b 80 00 00 	movabs $0x803be0,%rax
  803c8f:	00 00 00 
  803c92:	ff d0                	callq  *%rax
  803c94:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803c97:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803c9b:	78 3e                	js     803cdb <nsipc_accept+0x7a>
  803c9d:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803ca4:	00 00 00 
  803ca7:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803cab:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803caf:	8b 40 10             	mov    0x10(%rax),%eax
  803cb2:	89 c2                	mov    %eax,%edx
  803cb4:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  803cb8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803cbc:	48 89 ce             	mov    %rcx,%rsi
  803cbf:	48 89 c7             	mov    %rax,%rdi
  803cc2:	48 b8 f7 16 80 00 00 	movabs $0x8016f7,%rax
  803cc9:	00 00 00 
  803ccc:	ff d0                	callq  *%rax
  803cce:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803cd2:	8b 50 10             	mov    0x10(%rax),%edx
  803cd5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803cd9:	89 10                	mov    %edx,(%rax)
  803cdb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803cde:	c9                   	leaveq 
  803cdf:	c3                   	retq   

0000000000803ce0 <nsipc_bind>:
  803ce0:	55                   	push   %rbp
  803ce1:	48 89 e5             	mov    %rsp,%rbp
  803ce4:	48 83 ec 10          	sub    $0x10,%rsp
  803ce8:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803ceb:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803cef:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803cf2:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803cf9:	00 00 00 
  803cfc:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803cff:	89 10                	mov    %edx,(%rax)
  803d01:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803d04:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803d08:	48 89 c6             	mov    %rax,%rsi
  803d0b:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803d12:	00 00 00 
  803d15:	48 b8 f7 16 80 00 00 	movabs $0x8016f7,%rax
  803d1c:	00 00 00 
  803d1f:	ff d0                	callq  *%rax
  803d21:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d28:	00 00 00 
  803d2b:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803d2e:	89 50 14             	mov    %edx,0x14(%rax)
  803d31:	bf 02 00 00 00       	mov    $0x2,%edi
  803d36:	48 b8 e0 3b 80 00 00 	movabs $0x803be0,%rax
  803d3d:	00 00 00 
  803d40:	ff d0                	callq  *%rax
  803d42:	c9                   	leaveq 
  803d43:	c3                   	retq   

0000000000803d44 <nsipc_shutdown>:
  803d44:	55                   	push   %rbp
  803d45:	48 89 e5             	mov    %rsp,%rbp
  803d48:	48 83 ec 10          	sub    $0x10,%rsp
  803d4c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803d4f:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803d52:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d59:	00 00 00 
  803d5c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803d5f:	89 10                	mov    %edx,(%rax)
  803d61:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d68:	00 00 00 
  803d6b:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803d6e:	89 50 04             	mov    %edx,0x4(%rax)
  803d71:	bf 03 00 00 00       	mov    $0x3,%edi
  803d76:	48 b8 e0 3b 80 00 00 	movabs $0x803be0,%rax
  803d7d:	00 00 00 
  803d80:	ff d0                	callq  *%rax
  803d82:	c9                   	leaveq 
  803d83:	c3                   	retq   

0000000000803d84 <nsipc_close>:
  803d84:	55                   	push   %rbp
  803d85:	48 89 e5             	mov    %rsp,%rbp
  803d88:	48 83 ec 10          	sub    $0x10,%rsp
  803d8c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803d8f:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d96:	00 00 00 
  803d99:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803d9c:	89 10                	mov    %edx,(%rax)
  803d9e:	bf 04 00 00 00       	mov    $0x4,%edi
  803da3:	48 b8 e0 3b 80 00 00 	movabs $0x803be0,%rax
  803daa:	00 00 00 
  803dad:	ff d0                	callq  *%rax
  803daf:	c9                   	leaveq 
  803db0:	c3                   	retq   

0000000000803db1 <nsipc_connect>:
  803db1:	55                   	push   %rbp
  803db2:	48 89 e5             	mov    %rsp,%rbp
  803db5:	48 83 ec 10          	sub    $0x10,%rsp
  803db9:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803dbc:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803dc0:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803dc3:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803dca:	00 00 00 
  803dcd:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803dd0:	89 10                	mov    %edx,(%rax)
  803dd2:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803dd5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803dd9:	48 89 c6             	mov    %rax,%rsi
  803ddc:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803de3:	00 00 00 
  803de6:	48 b8 f7 16 80 00 00 	movabs $0x8016f7,%rax
  803ded:	00 00 00 
  803df0:	ff d0                	callq  *%rax
  803df2:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803df9:	00 00 00 
  803dfc:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803dff:	89 50 14             	mov    %edx,0x14(%rax)
  803e02:	bf 05 00 00 00       	mov    $0x5,%edi
  803e07:	48 b8 e0 3b 80 00 00 	movabs $0x803be0,%rax
  803e0e:	00 00 00 
  803e11:	ff d0                	callq  *%rax
  803e13:	c9                   	leaveq 
  803e14:	c3                   	retq   

0000000000803e15 <nsipc_listen>:
  803e15:	55                   	push   %rbp
  803e16:	48 89 e5             	mov    %rsp,%rbp
  803e19:	48 83 ec 10          	sub    $0x10,%rsp
  803e1d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803e20:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803e23:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e2a:	00 00 00 
  803e2d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803e30:	89 10                	mov    %edx,(%rax)
  803e32:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e39:	00 00 00 
  803e3c:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803e3f:	89 50 04             	mov    %edx,0x4(%rax)
  803e42:	bf 06 00 00 00       	mov    $0x6,%edi
  803e47:	48 b8 e0 3b 80 00 00 	movabs $0x803be0,%rax
  803e4e:	00 00 00 
  803e51:	ff d0                	callq  *%rax
  803e53:	c9                   	leaveq 
  803e54:	c3                   	retq   

0000000000803e55 <nsipc_recv>:
  803e55:	55                   	push   %rbp
  803e56:	48 89 e5             	mov    %rsp,%rbp
  803e59:	48 83 ec 30          	sub    $0x30,%rsp
  803e5d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803e60:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803e64:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803e67:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  803e6a:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e71:	00 00 00 
  803e74:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803e77:	89 10                	mov    %edx,(%rax)
  803e79:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e80:	00 00 00 
  803e83:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803e86:	89 50 04             	mov    %edx,0x4(%rax)
  803e89:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e90:	00 00 00 
  803e93:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803e96:	89 50 08             	mov    %edx,0x8(%rax)
  803e99:	bf 07 00 00 00       	mov    $0x7,%edi
  803e9e:	48 b8 e0 3b 80 00 00 	movabs $0x803be0,%rax
  803ea5:	00 00 00 
  803ea8:	ff d0                	callq  *%rax
  803eaa:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803ead:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803eb1:	78 69                	js     803f1c <nsipc_recv+0xc7>
  803eb3:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  803eba:	7f 08                	jg     803ec4 <nsipc_recv+0x6f>
  803ebc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ebf:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  803ec2:	7e 35                	jle    803ef9 <nsipc_recv+0xa4>
  803ec4:	48 b9 71 55 80 00 00 	movabs $0x805571,%rcx
  803ecb:	00 00 00 
  803ece:	48 ba 86 55 80 00 00 	movabs $0x805586,%rdx
  803ed5:	00 00 00 
  803ed8:	be 62 00 00 00       	mov    $0x62,%esi
  803edd:	48 bf 9b 55 80 00 00 	movabs $0x80559b,%rdi
  803ee4:	00 00 00 
  803ee7:	b8 00 00 00 00       	mov    $0x0,%eax
  803eec:	49 b8 e5 05 80 00 00 	movabs $0x8005e5,%r8
  803ef3:	00 00 00 
  803ef6:	41 ff d0             	callq  *%r8
  803ef9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803efc:	48 63 d0             	movslq %eax,%rdx
  803eff:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803f03:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  803f0a:	00 00 00 
  803f0d:	48 89 c7             	mov    %rax,%rdi
  803f10:	48 b8 f7 16 80 00 00 	movabs $0x8016f7,%rax
  803f17:	00 00 00 
  803f1a:	ff d0                	callq  *%rax
  803f1c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f1f:	c9                   	leaveq 
  803f20:	c3                   	retq   

0000000000803f21 <nsipc_send>:
  803f21:	55                   	push   %rbp
  803f22:	48 89 e5             	mov    %rsp,%rbp
  803f25:	48 83 ec 20          	sub    $0x20,%rsp
  803f29:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803f2c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803f30:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803f33:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  803f36:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803f3d:	00 00 00 
  803f40:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803f43:	89 10                	mov    %edx,(%rax)
  803f45:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  803f4c:	7e 35                	jle    803f83 <nsipc_send+0x62>
  803f4e:	48 b9 aa 55 80 00 00 	movabs $0x8055aa,%rcx
  803f55:	00 00 00 
  803f58:	48 ba 86 55 80 00 00 	movabs $0x805586,%rdx
  803f5f:	00 00 00 
  803f62:	be 6d 00 00 00       	mov    $0x6d,%esi
  803f67:	48 bf 9b 55 80 00 00 	movabs $0x80559b,%rdi
  803f6e:	00 00 00 
  803f71:	b8 00 00 00 00       	mov    $0x0,%eax
  803f76:	49 b8 e5 05 80 00 00 	movabs $0x8005e5,%r8
  803f7d:	00 00 00 
  803f80:	41 ff d0             	callq  *%r8
  803f83:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803f86:	48 63 d0             	movslq %eax,%rdx
  803f89:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f8d:	48 89 c6             	mov    %rax,%rsi
  803f90:	48 bf 0c b0 80 00 00 	movabs $0x80b00c,%rdi
  803f97:	00 00 00 
  803f9a:	48 b8 f7 16 80 00 00 	movabs $0x8016f7,%rax
  803fa1:	00 00 00 
  803fa4:	ff d0                	callq  *%rax
  803fa6:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803fad:	00 00 00 
  803fb0:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803fb3:	89 50 04             	mov    %edx,0x4(%rax)
  803fb6:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803fbd:	00 00 00 
  803fc0:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803fc3:	89 50 08             	mov    %edx,0x8(%rax)
  803fc6:	bf 08 00 00 00       	mov    $0x8,%edi
  803fcb:	48 b8 e0 3b 80 00 00 	movabs $0x803be0,%rax
  803fd2:	00 00 00 
  803fd5:	ff d0                	callq  *%rax
  803fd7:	c9                   	leaveq 
  803fd8:	c3                   	retq   

0000000000803fd9 <nsipc_socket>:
  803fd9:	55                   	push   %rbp
  803fda:	48 89 e5             	mov    %rsp,%rbp
  803fdd:	48 83 ec 10          	sub    $0x10,%rsp
  803fe1:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803fe4:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803fe7:	89 55 f4             	mov    %edx,-0xc(%rbp)
  803fea:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803ff1:	00 00 00 
  803ff4:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803ff7:	89 10                	mov    %edx,(%rax)
  803ff9:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804000:	00 00 00 
  804003:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804006:	89 50 04             	mov    %edx,0x4(%rax)
  804009:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804010:	00 00 00 
  804013:	8b 55 f4             	mov    -0xc(%rbp),%edx
  804016:	89 50 08             	mov    %edx,0x8(%rax)
  804019:	bf 09 00 00 00       	mov    $0x9,%edi
  80401e:	48 b8 e0 3b 80 00 00 	movabs $0x803be0,%rax
  804025:	00 00 00 
  804028:	ff d0                	callq  *%rax
  80402a:	c9                   	leaveq 
  80402b:	c3                   	retq   

000000000080402c <pipe>:
  80402c:	55                   	push   %rbp
  80402d:	48 89 e5             	mov    %rsp,%rbp
  804030:	53                   	push   %rbx
  804031:	48 83 ec 38          	sub    $0x38,%rsp
  804035:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  804039:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  80403d:	48 89 c7             	mov    %rax,%rdi
  804040:	48 b8 43 28 80 00 00 	movabs $0x802843,%rax
  804047:	00 00 00 
  80404a:	ff d0                	callq  *%rax
  80404c:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80404f:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804053:	0f 88 bf 01 00 00    	js     804218 <pipe+0x1ec>
  804059:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80405d:	ba 07 04 00 00       	mov    $0x407,%edx
  804062:	48 89 c6             	mov    %rax,%rsi
  804065:	bf 00 00 00 00       	mov    $0x0,%edi
  80406a:	48 b8 02 1d 80 00 00 	movabs $0x801d02,%rax
  804071:	00 00 00 
  804074:	ff d0                	callq  *%rax
  804076:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804079:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80407d:	0f 88 95 01 00 00    	js     804218 <pipe+0x1ec>
  804083:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  804087:	48 89 c7             	mov    %rax,%rdi
  80408a:	48 b8 43 28 80 00 00 	movabs $0x802843,%rax
  804091:	00 00 00 
  804094:	ff d0                	callq  *%rax
  804096:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804099:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80409d:	0f 88 5d 01 00 00    	js     804200 <pipe+0x1d4>
  8040a3:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8040a7:	ba 07 04 00 00       	mov    $0x407,%edx
  8040ac:	48 89 c6             	mov    %rax,%rsi
  8040af:	bf 00 00 00 00       	mov    $0x0,%edi
  8040b4:	48 b8 02 1d 80 00 00 	movabs $0x801d02,%rax
  8040bb:	00 00 00 
  8040be:	ff d0                	callq  *%rax
  8040c0:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8040c3:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8040c7:	0f 88 33 01 00 00    	js     804200 <pipe+0x1d4>
  8040cd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8040d1:	48 89 c7             	mov    %rax,%rdi
  8040d4:	48 b8 18 28 80 00 00 	movabs $0x802818,%rax
  8040db:	00 00 00 
  8040de:	ff d0                	callq  *%rax
  8040e0:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8040e4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8040e8:	ba 07 04 00 00       	mov    $0x407,%edx
  8040ed:	48 89 c6             	mov    %rax,%rsi
  8040f0:	bf 00 00 00 00       	mov    $0x0,%edi
  8040f5:	48 b8 02 1d 80 00 00 	movabs $0x801d02,%rax
  8040fc:	00 00 00 
  8040ff:	ff d0                	callq  *%rax
  804101:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804104:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804108:	79 05                	jns    80410f <pipe+0xe3>
  80410a:	e9 d9 00 00 00       	jmpq   8041e8 <pipe+0x1bc>
  80410f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804113:	48 89 c7             	mov    %rax,%rdi
  804116:	48 b8 18 28 80 00 00 	movabs $0x802818,%rax
  80411d:	00 00 00 
  804120:	ff d0                	callq  *%rax
  804122:	48 89 c2             	mov    %rax,%rdx
  804125:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804129:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  80412f:	48 89 d1             	mov    %rdx,%rcx
  804132:	ba 00 00 00 00       	mov    $0x0,%edx
  804137:	48 89 c6             	mov    %rax,%rsi
  80413a:	bf 00 00 00 00       	mov    $0x0,%edi
  80413f:	48 b8 52 1d 80 00 00 	movabs $0x801d52,%rax
  804146:	00 00 00 
  804149:	ff d0                	callq  *%rax
  80414b:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80414e:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804152:	79 1b                	jns    80416f <pipe+0x143>
  804154:	90                   	nop
  804155:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804159:	48 89 c6             	mov    %rax,%rsi
  80415c:	bf 00 00 00 00       	mov    $0x0,%edi
  804161:	48 b8 ad 1d 80 00 00 	movabs $0x801dad,%rax
  804168:	00 00 00 
  80416b:	ff d0                	callq  *%rax
  80416d:	eb 79                	jmp    8041e8 <pipe+0x1bc>
  80416f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804173:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  80417a:	00 00 00 
  80417d:	8b 12                	mov    (%rdx),%edx
  80417f:	89 10                	mov    %edx,(%rax)
  804181:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804185:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  80418c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804190:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  804197:	00 00 00 
  80419a:	8b 12                	mov    (%rdx),%edx
  80419c:	89 10                	mov    %edx,(%rax)
  80419e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8041a2:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  8041a9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8041ad:	48 89 c7             	mov    %rax,%rdi
  8041b0:	48 b8 f5 27 80 00 00 	movabs $0x8027f5,%rax
  8041b7:	00 00 00 
  8041ba:	ff d0                	callq  *%rax
  8041bc:	89 c2                	mov    %eax,%edx
  8041be:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8041c2:	89 10                	mov    %edx,(%rax)
  8041c4:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8041c8:	48 8d 58 04          	lea    0x4(%rax),%rbx
  8041cc:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8041d0:	48 89 c7             	mov    %rax,%rdi
  8041d3:	48 b8 f5 27 80 00 00 	movabs $0x8027f5,%rax
  8041da:	00 00 00 
  8041dd:	ff d0                	callq  *%rax
  8041df:	89 03                	mov    %eax,(%rbx)
  8041e1:	b8 00 00 00 00       	mov    $0x0,%eax
  8041e6:	eb 33                	jmp    80421b <pipe+0x1ef>
  8041e8:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8041ec:	48 89 c6             	mov    %rax,%rsi
  8041ef:	bf 00 00 00 00       	mov    $0x0,%edi
  8041f4:	48 b8 ad 1d 80 00 00 	movabs $0x801dad,%rax
  8041fb:	00 00 00 
  8041fe:	ff d0                	callq  *%rax
  804200:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804204:	48 89 c6             	mov    %rax,%rsi
  804207:	bf 00 00 00 00       	mov    $0x0,%edi
  80420c:	48 b8 ad 1d 80 00 00 	movabs $0x801dad,%rax
  804213:	00 00 00 
  804216:	ff d0                	callq  *%rax
  804218:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80421b:	48 83 c4 38          	add    $0x38,%rsp
  80421f:	5b                   	pop    %rbx
  804220:	5d                   	pop    %rbp
  804221:	c3                   	retq   

0000000000804222 <_pipeisclosed>:
  804222:	55                   	push   %rbp
  804223:	48 89 e5             	mov    %rsp,%rbp
  804226:	53                   	push   %rbx
  804227:	48 83 ec 28          	sub    $0x28,%rsp
  80422b:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80422f:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804233:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80423a:	00 00 00 
  80423d:	48 8b 00             	mov    (%rax),%rax
  804240:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  804246:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804249:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80424d:	48 89 c7             	mov    %rax,%rdi
  804250:	48 b8 2e 4c 80 00 00 	movabs $0x804c2e,%rax
  804257:	00 00 00 
  80425a:	ff d0                	callq  *%rax
  80425c:	89 c3                	mov    %eax,%ebx
  80425e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804262:	48 89 c7             	mov    %rax,%rdi
  804265:	48 b8 2e 4c 80 00 00 	movabs $0x804c2e,%rax
  80426c:	00 00 00 
  80426f:	ff d0                	callq  *%rax
  804271:	39 c3                	cmp    %eax,%ebx
  804273:	0f 94 c0             	sete   %al
  804276:	0f b6 c0             	movzbl %al,%eax
  804279:	89 45 e8             	mov    %eax,-0x18(%rbp)
  80427c:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  804283:	00 00 00 
  804286:	48 8b 00             	mov    (%rax),%rax
  804289:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80428f:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  804292:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804295:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  804298:	75 05                	jne    80429f <_pipeisclosed+0x7d>
  80429a:	8b 45 e8             	mov    -0x18(%rbp),%eax
  80429d:	eb 4f                	jmp    8042ee <_pipeisclosed+0xcc>
  80429f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8042a2:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  8042a5:	74 42                	je     8042e9 <_pipeisclosed+0xc7>
  8042a7:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  8042ab:	75 3c                	jne    8042e9 <_pipeisclosed+0xc7>
  8042ad:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8042b4:	00 00 00 
  8042b7:	48 8b 00             	mov    (%rax),%rax
  8042ba:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  8042c0:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  8042c3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8042c6:	89 c6                	mov    %eax,%esi
  8042c8:	48 bf bb 55 80 00 00 	movabs $0x8055bb,%rdi
  8042cf:	00 00 00 
  8042d2:	b8 00 00 00 00       	mov    $0x0,%eax
  8042d7:	49 b8 1e 08 80 00 00 	movabs $0x80081e,%r8
  8042de:	00 00 00 
  8042e1:	41 ff d0             	callq  *%r8
  8042e4:	e9 4a ff ff ff       	jmpq   804233 <_pipeisclosed+0x11>
  8042e9:	e9 45 ff ff ff       	jmpq   804233 <_pipeisclosed+0x11>
  8042ee:	48 83 c4 28          	add    $0x28,%rsp
  8042f2:	5b                   	pop    %rbx
  8042f3:	5d                   	pop    %rbp
  8042f4:	c3                   	retq   

00000000008042f5 <pipeisclosed>:
  8042f5:	55                   	push   %rbp
  8042f6:	48 89 e5             	mov    %rsp,%rbp
  8042f9:	48 83 ec 30          	sub    $0x30,%rsp
  8042fd:	89 7d dc             	mov    %edi,-0x24(%rbp)
  804300:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  804304:	8b 45 dc             	mov    -0x24(%rbp),%eax
  804307:	48 89 d6             	mov    %rdx,%rsi
  80430a:	89 c7                	mov    %eax,%edi
  80430c:	48 b8 db 28 80 00 00 	movabs $0x8028db,%rax
  804313:	00 00 00 
  804316:	ff d0                	callq  *%rax
  804318:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80431b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80431f:	79 05                	jns    804326 <pipeisclosed+0x31>
  804321:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804324:	eb 31                	jmp    804357 <pipeisclosed+0x62>
  804326:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80432a:	48 89 c7             	mov    %rax,%rdi
  80432d:	48 b8 18 28 80 00 00 	movabs $0x802818,%rax
  804334:	00 00 00 
  804337:	ff d0                	callq  *%rax
  804339:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80433d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804341:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804345:	48 89 d6             	mov    %rdx,%rsi
  804348:	48 89 c7             	mov    %rax,%rdi
  80434b:	48 b8 22 42 80 00 00 	movabs $0x804222,%rax
  804352:	00 00 00 
  804355:	ff d0                	callq  *%rax
  804357:	c9                   	leaveq 
  804358:	c3                   	retq   

0000000000804359 <devpipe_read>:
  804359:	55                   	push   %rbp
  80435a:	48 89 e5             	mov    %rsp,%rbp
  80435d:	48 83 ec 40          	sub    $0x40,%rsp
  804361:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804365:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804369:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80436d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804371:	48 89 c7             	mov    %rax,%rdi
  804374:	48 b8 18 28 80 00 00 	movabs $0x802818,%rax
  80437b:	00 00 00 
  80437e:	ff d0                	callq  *%rax
  804380:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804384:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804388:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80438c:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804393:	00 
  804394:	e9 92 00 00 00       	jmpq   80442b <devpipe_read+0xd2>
  804399:	eb 41                	jmp    8043dc <devpipe_read+0x83>
  80439b:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  8043a0:	74 09                	je     8043ab <devpipe_read+0x52>
  8043a2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8043a6:	e9 92 00 00 00       	jmpq   80443d <devpipe_read+0xe4>
  8043ab:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8043af:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8043b3:	48 89 d6             	mov    %rdx,%rsi
  8043b6:	48 89 c7             	mov    %rax,%rdi
  8043b9:	48 b8 22 42 80 00 00 	movabs $0x804222,%rax
  8043c0:	00 00 00 
  8043c3:	ff d0                	callq  *%rax
  8043c5:	85 c0                	test   %eax,%eax
  8043c7:	74 07                	je     8043d0 <devpipe_read+0x77>
  8043c9:	b8 00 00 00 00       	mov    $0x0,%eax
  8043ce:	eb 6d                	jmp    80443d <devpipe_read+0xe4>
  8043d0:	48 b8 c4 1c 80 00 00 	movabs $0x801cc4,%rax
  8043d7:	00 00 00 
  8043da:	ff d0                	callq  *%rax
  8043dc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8043e0:	8b 10                	mov    (%rax),%edx
  8043e2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8043e6:	8b 40 04             	mov    0x4(%rax),%eax
  8043e9:	39 c2                	cmp    %eax,%edx
  8043eb:	74 ae                	je     80439b <devpipe_read+0x42>
  8043ed:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8043f1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8043f5:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  8043f9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8043fd:	8b 00                	mov    (%rax),%eax
  8043ff:	99                   	cltd   
  804400:	c1 ea 1b             	shr    $0x1b,%edx
  804403:	01 d0                	add    %edx,%eax
  804405:	83 e0 1f             	and    $0x1f,%eax
  804408:	29 d0                	sub    %edx,%eax
  80440a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80440e:	48 98                	cltq   
  804410:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  804415:	88 01                	mov    %al,(%rcx)
  804417:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80441b:	8b 00                	mov    (%rax),%eax
  80441d:	8d 50 01             	lea    0x1(%rax),%edx
  804420:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804424:	89 10                	mov    %edx,(%rax)
  804426:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80442b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80442f:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  804433:	0f 82 60 ff ff ff    	jb     804399 <devpipe_read+0x40>
  804439:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80443d:	c9                   	leaveq 
  80443e:	c3                   	retq   

000000000080443f <devpipe_write>:
  80443f:	55                   	push   %rbp
  804440:	48 89 e5             	mov    %rsp,%rbp
  804443:	48 83 ec 40          	sub    $0x40,%rsp
  804447:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80444b:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80444f:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  804453:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804457:	48 89 c7             	mov    %rax,%rdi
  80445a:	48 b8 18 28 80 00 00 	movabs $0x802818,%rax
  804461:	00 00 00 
  804464:	ff d0                	callq  *%rax
  804466:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80446a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80446e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804472:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804479:	00 
  80447a:	e9 8e 00 00 00       	jmpq   80450d <devpipe_write+0xce>
  80447f:	eb 31                	jmp    8044b2 <devpipe_write+0x73>
  804481:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804485:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804489:	48 89 d6             	mov    %rdx,%rsi
  80448c:	48 89 c7             	mov    %rax,%rdi
  80448f:	48 b8 22 42 80 00 00 	movabs $0x804222,%rax
  804496:	00 00 00 
  804499:	ff d0                	callq  *%rax
  80449b:	85 c0                	test   %eax,%eax
  80449d:	74 07                	je     8044a6 <devpipe_write+0x67>
  80449f:	b8 00 00 00 00       	mov    $0x0,%eax
  8044a4:	eb 79                	jmp    80451f <devpipe_write+0xe0>
  8044a6:	48 b8 c4 1c 80 00 00 	movabs $0x801cc4,%rax
  8044ad:	00 00 00 
  8044b0:	ff d0                	callq  *%rax
  8044b2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8044b6:	8b 40 04             	mov    0x4(%rax),%eax
  8044b9:	48 63 d0             	movslq %eax,%rdx
  8044bc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8044c0:	8b 00                	mov    (%rax),%eax
  8044c2:	48 98                	cltq   
  8044c4:	48 83 c0 20          	add    $0x20,%rax
  8044c8:	48 39 c2             	cmp    %rax,%rdx
  8044cb:	73 b4                	jae    804481 <devpipe_write+0x42>
  8044cd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8044d1:	8b 40 04             	mov    0x4(%rax),%eax
  8044d4:	99                   	cltd   
  8044d5:	c1 ea 1b             	shr    $0x1b,%edx
  8044d8:	01 d0                	add    %edx,%eax
  8044da:	83 e0 1f             	and    $0x1f,%eax
  8044dd:	29 d0                	sub    %edx,%eax
  8044df:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8044e3:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8044e7:	48 01 ca             	add    %rcx,%rdx
  8044ea:	0f b6 0a             	movzbl (%rdx),%ecx
  8044ed:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8044f1:	48 98                	cltq   
  8044f3:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  8044f7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8044fb:	8b 40 04             	mov    0x4(%rax),%eax
  8044fe:	8d 50 01             	lea    0x1(%rax),%edx
  804501:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804505:	89 50 04             	mov    %edx,0x4(%rax)
  804508:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80450d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804511:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  804515:	0f 82 64 ff ff ff    	jb     80447f <devpipe_write+0x40>
  80451b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80451f:	c9                   	leaveq 
  804520:	c3                   	retq   

0000000000804521 <devpipe_stat>:
  804521:	55                   	push   %rbp
  804522:	48 89 e5             	mov    %rsp,%rbp
  804525:	48 83 ec 20          	sub    $0x20,%rsp
  804529:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80452d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804531:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804535:	48 89 c7             	mov    %rax,%rdi
  804538:	48 b8 18 28 80 00 00 	movabs $0x802818,%rax
  80453f:	00 00 00 
  804542:	ff d0                	callq  *%rax
  804544:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804548:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80454c:	48 be ce 55 80 00 00 	movabs $0x8055ce,%rsi
  804553:	00 00 00 
  804556:	48 89 c7             	mov    %rax,%rdi
  804559:	48 b8 d3 13 80 00 00 	movabs $0x8013d3,%rax
  804560:	00 00 00 
  804563:	ff d0                	callq  *%rax
  804565:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804569:	8b 50 04             	mov    0x4(%rax),%edx
  80456c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804570:	8b 00                	mov    (%rax),%eax
  804572:	29 c2                	sub    %eax,%edx
  804574:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804578:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  80457e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804582:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  804589:	00 00 00 
  80458c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804590:	48 b9 e0 70 80 00 00 	movabs $0x8070e0,%rcx
  804597:	00 00 00 
  80459a:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  8045a1:	b8 00 00 00 00       	mov    $0x0,%eax
  8045a6:	c9                   	leaveq 
  8045a7:	c3                   	retq   

00000000008045a8 <devpipe_close>:
  8045a8:	55                   	push   %rbp
  8045a9:	48 89 e5             	mov    %rsp,%rbp
  8045ac:	48 83 ec 10          	sub    $0x10,%rsp
  8045b0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8045b4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8045b8:	48 89 c6             	mov    %rax,%rsi
  8045bb:	bf 00 00 00 00       	mov    $0x0,%edi
  8045c0:	48 b8 ad 1d 80 00 00 	movabs $0x801dad,%rax
  8045c7:	00 00 00 
  8045ca:	ff d0                	callq  *%rax
  8045cc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8045d0:	48 89 c7             	mov    %rax,%rdi
  8045d3:	48 b8 18 28 80 00 00 	movabs $0x802818,%rax
  8045da:	00 00 00 
  8045dd:	ff d0                	callq  *%rax
  8045df:	48 89 c6             	mov    %rax,%rsi
  8045e2:	bf 00 00 00 00       	mov    $0x0,%edi
  8045e7:	48 b8 ad 1d 80 00 00 	movabs $0x801dad,%rax
  8045ee:	00 00 00 
  8045f1:	ff d0                	callq  *%rax
  8045f3:	c9                   	leaveq 
  8045f4:	c3                   	retq   

00000000008045f5 <wait>:
  8045f5:	55                   	push   %rbp
  8045f6:	48 89 e5             	mov    %rsp,%rbp
  8045f9:	48 83 ec 20          	sub    $0x20,%rsp
  8045fd:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804600:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804604:	75 35                	jne    80463b <wait+0x46>
  804606:	48 b9 d5 55 80 00 00 	movabs $0x8055d5,%rcx
  80460d:	00 00 00 
  804610:	48 ba e0 55 80 00 00 	movabs $0x8055e0,%rdx
  804617:	00 00 00 
  80461a:	be 0a 00 00 00       	mov    $0xa,%esi
  80461f:	48 bf f5 55 80 00 00 	movabs $0x8055f5,%rdi
  804626:	00 00 00 
  804629:	b8 00 00 00 00       	mov    $0x0,%eax
  80462e:	49 b8 e5 05 80 00 00 	movabs $0x8005e5,%r8
  804635:	00 00 00 
  804638:	41 ff d0             	callq  *%r8
  80463b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80463e:	25 ff 03 00 00       	and    $0x3ff,%eax
  804643:	48 98                	cltq   
  804645:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  80464c:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804653:	00 00 00 
  804656:	48 01 d0             	add    %rdx,%rax
  804659:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80465d:	eb 0c                	jmp    80466b <wait+0x76>
  80465f:	48 b8 c4 1c 80 00 00 	movabs $0x801cc4,%rax
  804666:	00 00 00 
  804669:	ff d0                	callq  *%rax
  80466b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80466f:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  804675:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  804678:	75 0e                	jne    804688 <wait+0x93>
  80467a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80467e:	8b 80 d4 00 00 00    	mov    0xd4(%rax),%eax
  804684:	85 c0                	test   %eax,%eax
  804686:	75 d7                	jne    80465f <wait+0x6a>
  804688:	c9                   	leaveq 
  804689:	c3                   	retq   

000000000080468a <cputchar>:
  80468a:	55                   	push   %rbp
  80468b:	48 89 e5             	mov    %rsp,%rbp
  80468e:	48 83 ec 20          	sub    $0x20,%rsp
  804692:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804695:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804698:	88 45 ff             	mov    %al,-0x1(%rbp)
  80469b:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  80469f:	be 01 00 00 00       	mov    $0x1,%esi
  8046a4:	48 89 c7             	mov    %rax,%rdi
  8046a7:	48 b8 ba 1b 80 00 00 	movabs $0x801bba,%rax
  8046ae:	00 00 00 
  8046b1:	ff d0                	callq  *%rax
  8046b3:	c9                   	leaveq 
  8046b4:	c3                   	retq   

00000000008046b5 <getchar>:
  8046b5:	55                   	push   %rbp
  8046b6:	48 89 e5             	mov    %rsp,%rbp
  8046b9:	48 83 ec 10          	sub    $0x10,%rsp
  8046bd:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  8046c1:	ba 01 00 00 00       	mov    $0x1,%edx
  8046c6:	48 89 c6             	mov    %rax,%rsi
  8046c9:	bf 00 00 00 00       	mov    $0x0,%edi
  8046ce:	48 b8 0d 2d 80 00 00 	movabs $0x802d0d,%rax
  8046d5:	00 00 00 
  8046d8:	ff d0                	callq  *%rax
  8046da:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8046dd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8046e1:	79 05                	jns    8046e8 <getchar+0x33>
  8046e3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8046e6:	eb 14                	jmp    8046fc <getchar+0x47>
  8046e8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8046ec:	7f 07                	jg     8046f5 <getchar+0x40>
  8046ee:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  8046f3:	eb 07                	jmp    8046fc <getchar+0x47>
  8046f5:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  8046f9:	0f b6 c0             	movzbl %al,%eax
  8046fc:	c9                   	leaveq 
  8046fd:	c3                   	retq   

00000000008046fe <iscons>:
  8046fe:	55                   	push   %rbp
  8046ff:	48 89 e5             	mov    %rsp,%rbp
  804702:	48 83 ec 20          	sub    $0x20,%rsp
  804706:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804709:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80470d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804710:	48 89 d6             	mov    %rdx,%rsi
  804713:	89 c7                	mov    %eax,%edi
  804715:	48 b8 db 28 80 00 00 	movabs $0x8028db,%rax
  80471c:	00 00 00 
  80471f:	ff d0                	callq  *%rax
  804721:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804724:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804728:	79 05                	jns    80472f <iscons+0x31>
  80472a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80472d:	eb 1a                	jmp    804749 <iscons+0x4b>
  80472f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804733:	8b 10                	mov    (%rax),%edx
  804735:	48 b8 20 71 80 00 00 	movabs $0x807120,%rax
  80473c:	00 00 00 
  80473f:	8b 00                	mov    (%rax),%eax
  804741:	39 c2                	cmp    %eax,%edx
  804743:	0f 94 c0             	sete   %al
  804746:	0f b6 c0             	movzbl %al,%eax
  804749:	c9                   	leaveq 
  80474a:	c3                   	retq   

000000000080474b <opencons>:
  80474b:	55                   	push   %rbp
  80474c:	48 89 e5             	mov    %rsp,%rbp
  80474f:	48 83 ec 10          	sub    $0x10,%rsp
  804753:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  804757:	48 89 c7             	mov    %rax,%rdi
  80475a:	48 b8 43 28 80 00 00 	movabs $0x802843,%rax
  804761:	00 00 00 
  804764:	ff d0                	callq  *%rax
  804766:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804769:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80476d:	79 05                	jns    804774 <opencons+0x29>
  80476f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804772:	eb 5b                	jmp    8047cf <opencons+0x84>
  804774:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804778:	ba 07 04 00 00       	mov    $0x407,%edx
  80477d:	48 89 c6             	mov    %rax,%rsi
  804780:	bf 00 00 00 00       	mov    $0x0,%edi
  804785:	48 b8 02 1d 80 00 00 	movabs $0x801d02,%rax
  80478c:	00 00 00 
  80478f:	ff d0                	callq  *%rax
  804791:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804794:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804798:	79 05                	jns    80479f <opencons+0x54>
  80479a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80479d:	eb 30                	jmp    8047cf <opencons+0x84>
  80479f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8047a3:	48 ba 20 71 80 00 00 	movabs $0x807120,%rdx
  8047aa:	00 00 00 
  8047ad:	8b 12                	mov    (%rdx),%edx
  8047af:	89 10                	mov    %edx,(%rax)
  8047b1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8047b5:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8047bc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8047c0:	48 89 c7             	mov    %rax,%rdi
  8047c3:	48 b8 f5 27 80 00 00 	movabs $0x8027f5,%rax
  8047ca:	00 00 00 
  8047cd:	ff d0                	callq  *%rax
  8047cf:	c9                   	leaveq 
  8047d0:	c3                   	retq   

00000000008047d1 <devcons_read>:
  8047d1:	55                   	push   %rbp
  8047d2:	48 89 e5             	mov    %rsp,%rbp
  8047d5:	48 83 ec 30          	sub    $0x30,%rsp
  8047d9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8047dd:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8047e1:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8047e5:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8047ea:	75 07                	jne    8047f3 <devcons_read+0x22>
  8047ec:	b8 00 00 00 00       	mov    $0x0,%eax
  8047f1:	eb 4b                	jmp    80483e <devcons_read+0x6d>
  8047f3:	eb 0c                	jmp    804801 <devcons_read+0x30>
  8047f5:	48 b8 c4 1c 80 00 00 	movabs $0x801cc4,%rax
  8047fc:	00 00 00 
  8047ff:	ff d0                	callq  *%rax
  804801:	48 b8 04 1c 80 00 00 	movabs $0x801c04,%rax
  804808:	00 00 00 
  80480b:	ff d0                	callq  *%rax
  80480d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804810:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804814:	74 df                	je     8047f5 <devcons_read+0x24>
  804816:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80481a:	79 05                	jns    804821 <devcons_read+0x50>
  80481c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80481f:	eb 1d                	jmp    80483e <devcons_read+0x6d>
  804821:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  804825:	75 07                	jne    80482e <devcons_read+0x5d>
  804827:	b8 00 00 00 00       	mov    $0x0,%eax
  80482c:	eb 10                	jmp    80483e <devcons_read+0x6d>
  80482e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804831:	89 c2                	mov    %eax,%edx
  804833:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804837:	88 10                	mov    %dl,(%rax)
  804839:	b8 01 00 00 00       	mov    $0x1,%eax
  80483e:	c9                   	leaveq 
  80483f:	c3                   	retq   

0000000000804840 <devcons_write>:
  804840:	55                   	push   %rbp
  804841:	48 89 e5             	mov    %rsp,%rbp
  804844:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  80484b:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  804852:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  804859:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  804860:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804867:	eb 76                	jmp    8048df <devcons_write+0x9f>
  804869:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  804870:	89 c2                	mov    %eax,%edx
  804872:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804875:	29 c2                	sub    %eax,%edx
  804877:	89 d0                	mov    %edx,%eax
  804879:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80487c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80487f:	83 f8 7f             	cmp    $0x7f,%eax
  804882:	76 07                	jbe    80488b <devcons_write+0x4b>
  804884:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  80488b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80488e:	48 63 d0             	movslq %eax,%rdx
  804891:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804894:	48 63 c8             	movslq %eax,%rcx
  804897:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  80489e:	48 01 c1             	add    %rax,%rcx
  8048a1:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  8048a8:	48 89 ce             	mov    %rcx,%rsi
  8048ab:	48 89 c7             	mov    %rax,%rdi
  8048ae:	48 b8 f7 16 80 00 00 	movabs $0x8016f7,%rax
  8048b5:	00 00 00 
  8048b8:	ff d0                	callq  *%rax
  8048ba:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8048bd:	48 63 d0             	movslq %eax,%rdx
  8048c0:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  8048c7:	48 89 d6             	mov    %rdx,%rsi
  8048ca:	48 89 c7             	mov    %rax,%rdi
  8048cd:	48 b8 ba 1b 80 00 00 	movabs $0x801bba,%rax
  8048d4:	00 00 00 
  8048d7:	ff d0                	callq  *%rax
  8048d9:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8048dc:	01 45 fc             	add    %eax,-0x4(%rbp)
  8048df:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8048e2:	48 98                	cltq   
  8048e4:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  8048eb:	0f 82 78 ff ff ff    	jb     804869 <devcons_write+0x29>
  8048f1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8048f4:	c9                   	leaveq 
  8048f5:	c3                   	retq   

00000000008048f6 <devcons_close>:
  8048f6:	55                   	push   %rbp
  8048f7:	48 89 e5             	mov    %rsp,%rbp
  8048fa:	48 83 ec 08          	sub    $0x8,%rsp
  8048fe:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804902:	b8 00 00 00 00       	mov    $0x0,%eax
  804907:	c9                   	leaveq 
  804908:	c3                   	retq   

0000000000804909 <devcons_stat>:
  804909:	55                   	push   %rbp
  80490a:	48 89 e5             	mov    %rsp,%rbp
  80490d:	48 83 ec 10          	sub    $0x10,%rsp
  804911:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804915:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804919:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80491d:	48 be 08 56 80 00 00 	movabs $0x805608,%rsi
  804924:	00 00 00 
  804927:	48 89 c7             	mov    %rax,%rdi
  80492a:	48 b8 d3 13 80 00 00 	movabs $0x8013d3,%rax
  804931:	00 00 00 
  804934:	ff d0                	callq  *%rax
  804936:	b8 00 00 00 00       	mov    $0x0,%eax
  80493b:	c9                   	leaveq 
  80493c:	c3                   	retq   

000000000080493d <set_pgfault_handler>:
  80493d:	55                   	push   %rbp
  80493e:	48 89 e5             	mov    %rsp,%rbp
  804941:	48 83 ec 20          	sub    $0x20,%rsp
  804945:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804949:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804950:	00 00 00 
  804953:	48 8b 00             	mov    (%rax),%rax
  804956:	48 85 c0             	test   %rax,%rax
  804959:	75 6f                	jne    8049ca <set_pgfault_handler+0x8d>
  80495b:	ba 07 00 00 00       	mov    $0x7,%edx
  804960:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  804965:	bf 00 00 00 00       	mov    $0x0,%edi
  80496a:	48 b8 02 1d 80 00 00 	movabs $0x801d02,%rax
  804971:	00 00 00 
  804974:	ff d0                	callq  *%rax
  804976:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804979:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80497d:	79 30                	jns    8049af <set_pgfault_handler+0x72>
  80497f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804982:	89 c1                	mov    %eax,%ecx
  804984:	48 ba 10 56 80 00 00 	movabs $0x805610,%rdx
  80498b:	00 00 00 
  80498e:	be 22 00 00 00       	mov    $0x22,%esi
  804993:	48 bf 2f 56 80 00 00 	movabs $0x80562f,%rdi
  80499a:	00 00 00 
  80499d:	b8 00 00 00 00       	mov    $0x0,%eax
  8049a2:	49 b8 e5 05 80 00 00 	movabs $0x8005e5,%r8
  8049a9:	00 00 00 
  8049ac:	41 ff d0             	callq  *%r8
  8049af:	48 be dd 49 80 00 00 	movabs $0x8049dd,%rsi
  8049b6:	00 00 00 
  8049b9:	bf 00 00 00 00       	mov    $0x0,%edi
  8049be:	48 b8 8c 1e 80 00 00 	movabs $0x801e8c,%rax
  8049c5:	00 00 00 
  8049c8:	ff d0                	callq  *%rax
  8049ca:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8049d1:	00 00 00 
  8049d4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8049d8:	48 89 10             	mov    %rdx,(%rax)
  8049db:	c9                   	leaveq 
  8049dc:	c3                   	retq   

00000000008049dd <_pgfault_upcall>:
.globl _pgfault_upcall
_pgfault_upcall:
// Call the C page fault handler.
// function argument: pointer to UTF

movq  %rsp,%rdi                // passing the function argument in rdi
  8049dd:	48 89 e7             	mov    %rsp,%rdi
movabs _pgfault_handler, %rax
  8049e0:	48 a1 00 c0 80 00 00 	movabs 0x80c000,%rax
  8049e7:	00 00 00 
call *%rax
  8049ea:	ff d0                	callq  *%rax
// registers are available for intermediate calculations.  You
// may find that you have to rearrange your code in non-obvious
// ways as registers become unavailable as scratch space.
//
// LAB 4: Your code here.
subq $8, 152(%rsp)
  8049ec:	48 83 ac 24 98 00 00 	subq   $0x8,0x98(%rsp)
  8049f3:	00 08 
    movq 152(%rsp), %rax
  8049f5:	48 8b 84 24 98 00 00 	mov    0x98(%rsp),%rax
  8049fc:	00 
    movq 136(%rsp), %rbx
  8049fd:	48 8b 9c 24 88 00 00 	mov    0x88(%rsp),%rbx
  804a04:	00 
movq %rbx, (%rax)
  804a05:	48 89 18             	mov    %rbx,(%rax)

    // Restore the trap-time registers.  After you do this, you
    // can no longer modify any general-purpose registers.
    // LAB 4: Your code here.
    addq $16, %rsp
  804a08:	48 83 c4 10          	add    $0x10,%rsp
    POPA_
  804a0c:	4c 8b 3c 24          	mov    (%rsp),%r15
  804a10:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
  804a15:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
  804a1a:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  804a1f:	4c 8b 5c 24 20       	mov    0x20(%rsp),%r11
  804a24:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
  804a29:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
  804a2e:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
  804a33:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
  804a38:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
  804a3d:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
  804a42:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
  804a47:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
  804a4c:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
  804a51:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  804a56:	48 83 c4 78          	add    $0x78,%rsp

    // Restore eflags from the stack.  After you do this, you can
    // no longer use arithmetic operations or anything else that
    // modifies eflags.
    // LAB 4: Your code here.
pushq 8(%rsp)
  804a5a:	ff 74 24 08          	pushq  0x8(%rsp)
    popfq
  804a5e:	9d                   	popfq  

    // Switch back to the adjusted trap-time stack.
    // LAB 4: Your code here.
    movq 16(%rsp), %rsp
  804a5f:	48 8b 64 24 10       	mov    0x10(%rsp),%rsp

    // Return to re-execute the instruction that faulted.
    // LAB 4: Your code here.
    retq
  804a64:	c3                   	retq   

0000000000804a65 <ipc_recv>:
  804a65:	55                   	push   %rbp
  804a66:	48 89 e5             	mov    %rsp,%rbp
  804a69:	48 83 ec 30          	sub    $0x30,%rsp
  804a6d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804a71:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804a75:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804a79:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  804a7e:	75 0e                	jne    804a8e <ipc_recv+0x29>
  804a80:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804a87:	00 00 00 
  804a8a:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804a8e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804a92:	48 89 c7             	mov    %rax,%rdi
  804a95:	48 b8 2b 1f 80 00 00 	movabs $0x801f2b,%rax
  804a9c:	00 00 00 
  804a9f:	ff d0                	callq  *%rax
  804aa1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804aa4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804aa8:	79 27                	jns    804ad1 <ipc_recv+0x6c>
  804aaa:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  804aaf:	74 0a                	je     804abb <ipc_recv+0x56>
  804ab1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804ab5:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  804abb:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804ac0:	74 0a                	je     804acc <ipc_recv+0x67>
  804ac2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804ac6:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  804acc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804acf:	eb 53                	jmp    804b24 <ipc_recv+0xbf>
  804ad1:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  804ad6:	74 19                	je     804af1 <ipc_recv+0x8c>
  804ad8:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  804adf:	00 00 00 
  804ae2:	48 8b 00             	mov    (%rax),%rax
  804ae5:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  804aeb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804aef:	89 10                	mov    %edx,(%rax)
  804af1:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804af6:	74 19                	je     804b11 <ipc_recv+0xac>
  804af8:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  804aff:	00 00 00 
  804b02:	48 8b 00             	mov    (%rax),%rax
  804b05:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  804b0b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804b0f:	89 10                	mov    %edx,(%rax)
  804b11:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  804b18:	00 00 00 
  804b1b:	48 8b 00             	mov    (%rax),%rax
  804b1e:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  804b24:	c9                   	leaveq 
  804b25:	c3                   	retq   

0000000000804b26 <ipc_send>:
  804b26:	55                   	push   %rbp
  804b27:	48 89 e5             	mov    %rsp,%rbp
  804b2a:	48 83 ec 30          	sub    $0x30,%rsp
  804b2e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804b31:	89 75 e8             	mov    %esi,-0x18(%rbp)
  804b34:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  804b38:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  804b3b:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  804b40:	75 10                	jne    804b52 <ipc_send+0x2c>
  804b42:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804b49:	00 00 00 
  804b4c:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804b50:	eb 0e                	jmp    804b60 <ipc_send+0x3a>
  804b52:	eb 0c                	jmp    804b60 <ipc_send+0x3a>
  804b54:	48 b8 c4 1c 80 00 00 	movabs $0x801cc4,%rax
  804b5b:	00 00 00 
  804b5e:	ff d0                	callq  *%rax
  804b60:	8b 75 e8             	mov    -0x18(%rbp),%esi
  804b63:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  804b66:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  804b6a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804b6d:	89 c7                	mov    %eax,%edi
  804b6f:	48 b8 d6 1e 80 00 00 	movabs $0x801ed6,%rax
  804b76:	00 00 00 
  804b79:	ff d0                	callq  *%rax
  804b7b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804b7e:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  804b82:	74 d0                	je     804b54 <ipc_send+0x2e>
  804b84:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804b88:	79 30                	jns    804bba <ipc_send+0x94>
  804b8a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804b8d:	89 c1                	mov    %eax,%ecx
  804b8f:	48 ba 40 56 80 00 00 	movabs $0x805640,%rdx
  804b96:	00 00 00 
  804b99:	be 44 00 00 00       	mov    $0x44,%esi
  804b9e:	48 bf 56 56 80 00 00 	movabs $0x805656,%rdi
  804ba5:	00 00 00 
  804ba8:	b8 00 00 00 00       	mov    $0x0,%eax
  804bad:	49 b8 e5 05 80 00 00 	movabs $0x8005e5,%r8
  804bb4:	00 00 00 
  804bb7:	41 ff d0             	callq  *%r8
  804bba:	c9                   	leaveq 
  804bbb:	c3                   	retq   

0000000000804bbc <ipc_find_env>:
  804bbc:	55                   	push   %rbp
  804bbd:	48 89 e5             	mov    %rsp,%rbp
  804bc0:	48 83 ec 14          	sub    $0x14,%rsp
  804bc4:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804bc7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804bce:	eb 4e                	jmp    804c1e <ipc_find_env+0x62>
  804bd0:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804bd7:	00 00 00 
  804bda:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804bdd:	48 98                	cltq   
  804bdf:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804be6:	48 01 d0             	add    %rdx,%rax
  804be9:	48 05 d0 00 00 00    	add    $0xd0,%rax
  804bef:	8b 00                	mov    (%rax),%eax
  804bf1:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  804bf4:	75 24                	jne    804c1a <ipc_find_env+0x5e>
  804bf6:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804bfd:	00 00 00 
  804c00:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804c03:	48 98                	cltq   
  804c05:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804c0c:	48 01 d0             	add    %rdx,%rax
  804c0f:	48 05 c0 00 00 00    	add    $0xc0,%rax
  804c15:	8b 40 08             	mov    0x8(%rax),%eax
  804c18:	eb 12                	jmp    804c2c <ipc_find_env+0x70>
  804c1a:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  804c1e:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  804c25:	7e a9                	jle    804bd0 <ipc_find_env+0x14>
  804c27:	b8 00 00 00 00       	mov    $0x0,%eax
  804c2c:	c9                   	leaveq 
  804c2d:	c3                   	retq   

0000000000804c2e <pageref>:
  804c2e:	55                   	push   %rbp
  804c2f:	48 89 e5             	mov    %rsp,%rbp
  804c32:	48 83 ec 18          	sub    $0x18,%rsp
  804c36:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804c3a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804c3e:	48 c1 e8 15          	shr    $0x15,%rax
  804c42:	48 89 c2             	mov    %rax,%rdx
  804c45:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  804c4c:	01 00 00 
  804c4f:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804c53:	83 e0 01             	and    $0x1,%eax
  804c56:	48 85 c0             	test   %rax,%rax
  804c59:	75 07                	jne    804c62 <pageref+0x34>
  804c5b:	b8 00 00 00 00       	mov    $0x0,%eax
  804c60:	eb 53                	jmp    804cb5 <pageref+0x87>
  804c62:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804c66:	48 c1 e8 0c          	shr    $0xc,%rax
  804c6a:	48 89 c2             	mov    %rax,%rdx
  804c6d:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  804c74:	01 00 00 
  804c77:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804c7b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804c7f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804c83:	83 e0 01             	and    $0x1,%eax
  804c86:	48 85 c0             	test   %rax,%rax
  804c89:	75 07                	jne    804c92 <pageref+0x64>
  804c8b:	b8 00 00 00 00       	mov    $0x0,%eax
  804c90:	eb 23                	jmp    804cb5 <pageref+0x87>
  804c92:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804c96:	48 c1 e8 0c          	shr    $0xc,%rax
  804c9a:	48 89 c2             	mov    %rax,%rdx
  804c9d:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  804ca4:	00 00 00 
  804ca7:	48 c1 e2 04          	shl    $0x4,%rdx
  804cab:	48 01 d0             	add    %rdx,%rax
  804cae:	0f b7 40 08          	movzwl 0x8(%rax),%eax
  804cb2:	0f b7 c0             	movzwl %ax,%eax
  804cb5:	c9                   	leaveq 
  804cb6:	c3                   	retq   
